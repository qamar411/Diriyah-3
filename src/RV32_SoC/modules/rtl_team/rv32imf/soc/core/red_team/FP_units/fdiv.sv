
import riscv_types::*;

module fdiv(
    input logic clk,
    input logic rst_n,
    input logic clear,
    input logic [31:0] a_in,        // Multiplicand
    input logic [31:0] b_in,        // Divisor (we calculate 1/b)
    input logic p_start,            // Start pulse
    input exe_p_mux_bus_type bus_i, // Pipeline signals input
    input logic [2:0] rm,           // Rounding mode
    input logic en,                 // Enable signal
    
    output logic [31:0] result_out, // Final result: a * (1/b)
    output logic p_result,          // Result valid pulse
    output logic busy,              // Unit is busy
    output exe_p_mux_bus_type bus_o, // Pipeline signals output
    

    // For clear logic
    output logic [4:0] uu_rd,        // Unit uses this rd
    output logic uu_reg_write,       // Register write flag
    output logic uu_FP_reg_write     // FP register write flag
);

    // Internal signals
    exe_p_mux_bus_type bus_temp;     // Internal bus signals
    assign uu_rd = bus_temp.rd;      // Used for clear logic
    assign uu_reg_write = bus_temp.reg_write;
    assign uu_FP_reg_write = bus_temp.FP_reg_write;
    logic en_add_ff;
    // IEEE 754 Special Values
    localparam [31:0] POSITIVE_INFINITY = {1'b0, 8'hFF, 23'h000000};
    localparam [31:0] NEGATIVE_INFINITY = {1'b1, 8'hFF, 23'h000000};
    localparam [31:0] POSITIVE_ZERO = {1'b0, 8'h00, 23'h000000};
    localparam [31:0] NEGATIVE_ZERO = {1'b1, 8'h00, 23'h000000};
    localparam [31:0] NAN = {1'b0, 8'hFF, 23'h400000}; // Quiet NaN
    
    // Working registers
    logic [31:0] a_reg, b_reg;
    logic [31:0] temp1, temp2;
    logic [31:0] final_result;
    
    // Internal operation signals
    logic [31:0] x1, x2, x3, x4, x5;            // Newton-Raphson iterations
    logic [31:0] reciprocal_result; // Final reciprocal value
    logic [2:0] temp_rm;
    
    // Newton-Raphson intermediate values
    logic [31:0] temp_mul1, temp_mul2, temp_mul3, temp_mul4;
    logic [31:0] temp_sub1, temp_sub2, temp_sub3;
    
    // Special case detection
    logic a_is_zero, b_is_zero, a_is_inf, b_is_inf, a_is_nan, b_is_nan;
    logic special_case;
    logic [31:0] special_result;
    logic sign_a, sign_b, sign_result;
    
    // State machine control signals
    logic en_mul, done_mul;
    logic en_add, done_add;
    logic on_ctrl, on_ctrl_final;
    
    // Inputs for multiplier and adder
    logic [31:0] mul_input_a, mul_input_b;
    logic [31:0] add_input_num2, add_input_num1;
        
    // Adder signals for capture
    logic [31:0] add_result;
    
    // Extract fields from input operands
    logic [7:0] exp_a, exp_b;
    logic [22:0] frac_a, frac_b;
    
    // Extract IEEE 754 fields
    assign sign_a = a_reg[31];
    assign sign_b = b_reg[31];
    assign exp_a = a_reg[30:23];
    assign exp_b = b_reg[30:23];
    assign frac_a = a_reg[22:0];
    assign frac_b = b_reg[22:0];
    assign   sign_result = sign_a ^ sign_b;
        
    logic [8:0] reciprocal_exp;
    logic [31:0] reciprocal_temp;
    // Special case detection
    assign a_is_zero = (exp_a == 8'h00) && (frac_a == 23'h0);
    assign b_is_zero = (exp_b == 8'h00) && (frac_b == 23'h0);
    assign a_is_inf = (exp_a == 8'hFF) && (frac_a == 23'h0);
    assign b_is_inf = (exp_b == 8'hFF) && (frac_b == 23'h0);
    assign a_is_nan = (exp_a == 8'hFF) && (frac_a != 23'h0);
    assign b_is_nan = (exp_b == 8'hFF) && (frac_b != 23'h0);
    
    // Newton-Raphson step 1: Calculate initial approximation
    // b_scaled = b normalized to ~1.0 (exponent = 126)
    
    logic [31:0] b_scaled; 
    // assign b_scaled = (exp_b == 8'h00) ?   // NOTE: fmul already handled the subnormal values
    //                 //  {1'b0, 8'd126, 1'b0, frac_b[22:1]} :  // Denormal
    //                 //  {1'b0, 8'd126, frac_b};               // Normal
    assign b_scaled = b_reg;

    // Multiplier signals for capture
    logic [31:0] mul_result;
    
    // Signals to catch the final output
    logic done_mul_ff, move_mul_result; 
    
    // Define state machine
    typedef enum logic [4:0] {
        IDLE, // 0
        CHECK_SPECIAL, // 1
        NEWTON_STEP1_MUL, // 2
        NEWTON_STEP1_SUB, // 3
        NEWTON_STEP2_MUL, // 4
        NEWTON_STEP2_SUB, // 5
        NEWTON_STEP3_MUL, // 6
        NEWTON_STEP3_MUL2, // 7
        NEWTON_STEP3_SUB, // 8
        NEWTON_STEP3_MUL3, // 9
        RECIP_FINALIZE, // 10
        FINAL_MUL, // 11
        RESULT_OUTPUT, // 12
        Final_stage,
        EXTRA_CASE,
        EXTRA_CASE2
    } state_t;
    
    state_t current_state, next_state, previous_state;
  
    // State machine transition logic
    always_ff @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            current_state <= IDLE;
            previous_state <= IDLE;
        end else if (clear) begin
            current_state <= IDLE;
            previous_state <= IDLE;
        end else if (en) begin
            current_state <= next_state;
            previous_state <= current_state;
        end
    end
    
    // Next state logic
    always_comb begin
        case (current_state)
            IDLE:            next_state = p_start ? CHECK_SPECIAL : IDLE;
            CHECK_SPECIAL:   next_state = special_case ? RESULT_OUTPUT : NEWTON_STEP1_MUL;
            NEWTON_STEP1_MUL: next_state = done_mul ? NEWTON_STEP1_SUB : NEWTON_STEP1_MUL;
            NEWTON_STEP1_SUB: next_state = done_add ? NEWTON_STEP2_MUL : NEWTON_STEP1_SUB;
            NEWTON_STEP2_MUL: next_state = done_mul ? NEWTON_STEP2_SUB : NEWTON_STEP2_MUL;
            NEWTON_STEP2_SUB: next_state = done_add ? NEWTON_STEP3_MUL : NEWTON_STEP2_SUB;
            NEWTON_STEP3_MUL: next_state = done_mul ? NEWTON_STEP3_MUL2 : NEWTON_STEP3_MUL;
            NEWTON_STEP3_MUL2: next_state = done_mul ? NEWTON_STEP3_SUB : NEWTON_STEP3_MUL2;
            NEWTON_STEP3_SUB: next_state = done_add ?  NEWTON_STEP3_MUL3: NEWTON_STEP3_SUB;
            NEWTON_STEP3_MUL3:next_state = done_mul ? RECIP_FINALIZE : NEWTON_STEP3_MUL3;
            RECIP_FINALIZE:  next_state = FINAL_MUL;
            FINAL_MUL:       next_state = done_mul ? RESULT_OUTPUT : FINAL_MUL;
            RESULT_OUTPUT:   next_state = IDLE; 
            default:         next_state = IDLE;
        endcase
    end

    // Register inputs
    always_ff @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            a_reg <= 32'h0;
            b_reg <= 32'h0;
            temp_rm <= 1'd0;
        end else if (p_start) begin
            a_reg <= a_in;
            b_reg <= b_in;
            temp_rm <= rm;
        end
    end
    
    // Bus register for control signals
    Register #(.bits($bits(bus_i))) bus_reg1 (
        .clk(clk), 
        .rst_n(rst_n), 
        .clear(clear), 
        .en(en & on_ctrl), 
        .d(bus_i), 
        .q(bus_temp)
    );
    
    Register #(.bits($bits(bus_temp))) bus_reg2 (
        .clk(clk), 
        .rst_n(rst_n), 
        .clear(clear), 
        .en(en & on_ctrl_final), 
        .d(bus_temp), 
        .q(bus_o)
    );
     
    // Special-case handling
    always_comb begin
        special_case = 1'b0;
        special_result = 32'b0;
        
        if (a_is_nan || b_is_nan) begin
            // NaN input -> NaN output
            special_result = NAN;
            special_case = 1'b1;
        end else if (a_is_inf && b_is_inf) begin
            // Infinity / Infinity = NaN
            special_result = NAN;
            special_case = 1'b1;
        end else if (a_is_zero && b_is_zero) begin
            // 0/0 = NaN
            special_result = NAN;
            special_case = 1'b1;
        end else if (a_is_inf && !b_is_zero) begin
            // Infinity * (1/x) = Infinity (with sign)
            special_result = sign_result ? NEGATIVE_INFINITY : POSITIVE_INFINITY;
            special_case = 1'b1;
        end else if (b_is_inf && !a_is_inf) begin
            // x * (1/Infinity) = 0 (with sign)
            special_result = sign_result ? NEGATIVE_ZERO : POSITIVE_ZERO;
            special_case = 1'b1;
        end else if (b_is_zero && !a_is_zero) begin
            // x * (1/0) = Infinity (with sign)
            special_result = sign_result ? NEGATIVE_INFINITY : POSITIVE_INFINITY;
            special_case = 1'b1;
        end else if (a_is_zero && !b_is_zero) begin
            // 0 * (1/x) = 0 (with sign)
            special_result = sign_result ? NEGATIVE_ZERO : POSITIVE_ZERO;
            special_case = 1'b1;
        end
    end
    
    // Output and control signals
    always_comb begin
        en_mul = 1'b0;
        en_add = 1'b0;
        p_result = 1'b0;
        busy = 1'b0;
        // on_ctrl = p_start | p_result;
        on_ctrl = p_start; // Enable bus_reg1 to capture control signals
        on_ctrl_final = 1'b0;
        temp1 = 32'h0;  // Default value
        // Set multiplier and adder inputs based on current state
        mul_input_a = 32'h0;
        mul_input_b = 32'h0;
        add_input_num1 = 32'h0;
        add_input_num2 = 32'h0;
        
        case (current_state) 
            CHECK_SPECIAL: begin
                busy = 1'b1;
                p_result = 1'b0;
                if (special_case)
                    on_ctrl_final = 1'b1; // Enable bus_reg2 to output correct control signals for special cases
            end
            
            NEWTON_STEP1_MUL: begin // mul 1
                busy = 1'b1;
                mul_input_a =   32'h3FF0F0F1; 
                mul_input_b =  b_scaled; // 1.88 recheck this
                if (done_mul) begin // next state is NEWTON_STEP1_SUB
                    en_add = 1'b1;
                    en_mul = 1'b0;
                end else // next state is NEWTON_STEP1_MUL
                    // en_mul = 1'b1; 
                    en_mul = previous_state==NEWTON_STEP1_MUL? 1'b0 : 1'b1; // don't run it multiple times
            end
            
            NEWTON_STEP1_SUB: begin //sub 1
                busy = 1'b1;
                en_add = 1'b0;
                add_input_num1= 32'h4034B4B5; //// 48/17 ≈ 2.82352941
                add_input_num2 = x1;
                p_result = 1'b0;
            end
            
            NEWTON_STEP2_MUL: begin  // mul 2
                busy = 1'b1;
                // en_mul = 1'b1;
                en_mul = previous_state==NEWTON_STEP2_MUL? 1'b0 : 1'b1; // don't run it multiple times
                mul_input_a = b_scaled;
                mul_input_b = temp_sub1;
                p_result = 1'b0;
                if (done_mul) begin
                    en_add = 1'b1;
                    en_mul = 1'b0;              
               end
            end
            
            NEWTON_STEP2_SUB: begin // sub 2
                busy = 1'b1;
                en_add = 1'b0;
                add_input_num1 = 32'h40000000;
                add_input_num2 = x2;
                p_result = 1'b0;
            end
            NEWTON_STEP3_MUL: begin  // mul 3
                busy = 1'b1;
                // en_mul = 1'b1;
                en_mul = previous_state==NEWTON_STEP3_MUL? 1'b0 : 1'b1; // don't run it multiple times
                mul_input_a = temp_sub1; // taken from first adder result
                mul_input_b = temp_sub2;
                 p_result = 1'b0;
               if (done_mul) begin
                    en_mul = 1'b0;
               end
            end
            NEWTON_STEP3_MUL2: begin // mul 4
                busy = 1'b1;
                en_mul = previous_state==NEWTON_STEP3_MUL2? 1'b0 : 1'b1; // don't run it multiple times
                mul_input_a = b_scaled; 
                mul_input_b = x3;
                p_result = 1'b0;
                if (done_mul) begin
                    en_add = 1'b1;
                    en_mul = 1'b0;
               end
               else begin
                    en_add = 1'b0;
               end
            end
            
            NEWTON_STEP3_SUB: begin // sub 3
                busy = 1'b1;
                en_add = 1'b0;
                add_input_num1= 32'h40000000;
                add_input_num2 = x4;
                p_result = 1'b0;
            end
              
            NEWTON_STEP3_MUL3: begin // mul 5
                busy = 1'b1;
                // en_mul = 1'b1;                
                en_mul = previous_state==NEWTON_STEP3_MUL3? 1'b0 : 1'b1; // don't run it multiple times
                mul_input_a = x3; // mul 3 result
                mul_input_b = temp_sub3;
                p_result = 1'b0;
                if(done_mul) begin
                       en_add = 1'b0;
                       en_mul = 1'b0;
                 end
             end

            RECIP_FINALIZE: begin
                busy = 1'b1;
                p_result = 1'b0;
                // en_mul = 1'b1;
                en_mul = previous_state==RECIP_FINALIZE? 1'b0 : 1'b1; // don't run it multiple times
                mul_input_a = a_reg;
                mul_input_b = reciprocal_result;
            end
            
            FINAL_MUL: begin 
                busy = 1'b1;
                en_mul = 1'b0;
                p_result = 1'b0;
                on_ctrl_final = 1'b1; // Enable bus_reg2 to output correct control signals for normal cases
            end
            RESULT_OUTPUT: begin
                temp1 = special_case ? special_result : final_result;  
                busy = 1'b0;
                p_result = 1'b1;  
            end
            default: begin
                busy = 1'b0;
            end
        endcase
    end 
    
    // Assign final result
    assign result_out =  special_case ? special_result : final_result;
    
    // Multiplier instance for Newton-Raphson iterations
    FP_final_Multiplier multiplier (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .clear({2{clear}}),
        .a(mul_input_a),
        .b(mul_input_b),
        .rm(rm),
        // .rm(temp_rm),
    	.fmul_pipeline_signals_i(152'd0),
    	.fmul_pipeline_signals_o(),
        .P_signal(en_mul),
        .P_O_signal(done_mul),
        .uu_rd(),
        .uu_reg_write(),
        .uu_FP_reg_write(),
        .result(mul_result)
    );
    
    // Capture multiplier results
    always_ff @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            temp_mul1 <= 32'h0;
            temp_mul2 <= 32'h0;
            temp_mul3 <= 32'h0;
            x1 <= 32'h0;
            x2 <= 32'h0;
            x3 <= 32'h0;
            x4 <= 32'h0;
            x5 <= 32'h0;
            final_result <= 0;
            
        end else if (en & done_mul) begin
            final_result <= mul_result; // Capture the result of multiplication
            case (current_state)
                NEWTON_STEP1_MUL: x1 <= mul_result;
                NEWTON_STEP2_MUL: x2 <= mul_result;
                NEWTON_STEP3_MUL: x3 <= mul_result;
                NEWTON_STEP3_MUL2: x4 <=mul_result;
                NEWTON_STEP3_MUL3: x5 <=mul_result;            
                default: ; // Do nothing
            endcase
        end
    end   

    // Adder/Subtractor instance for Newton-Raphson iterations
    FP_add_sub adder (
        .clk(clk),
        .rst(rst_n),
        .en(en),
        .clear({3{clear}}),
        .add_sub(1'b1),  // Subtraction
        .num1(add_input_num1),  
        .num2(add_input_num2),
        .rm(rm),
        // .rm(temp_rm),
        .uu_rd(), // leave them empty to resolve compliation errors in PD & DV teams
        .uu_reg_write(),
        .uu_FP_reg_write(),
    	.fadd_sub_pipeline_signals_i(152'd0),  // .fadd_sub_pipeline_signals_i({$bits(bus_i){1'b0}})
    	.fadd_sub_pipeline_signals_o(),
        .p_start(en_add_ff),
        .p_result(done_add),
        .sum(add_result)
    );
    
    // Capture adder results
    always_ff @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            temp_sub1 <= 32'h0;
            temp_sub2 <= 32'h0;
            temp_sub3 <= 32'h0;
        end else if (en && done_add) begin
            case (current_state)
                NEWTON_STEP1_SUB: temp_sub1 <= add_result;
                NEWTON_STEP2_SUB: temp_sub2 <= add_result;
                NEWTON_STEP3_SUB: temp_sub3 <= add_result;
                default: ; // Do nothing
            endcase
        end
    end
    
   // Calculate the final reciprocal with proper exponent and sign
   always_comb begin
   if (current_state==RECIP_FINALIZE) begin
   // Calculate the reciprocal exponent
        if (b_reg[30:23] == 8'h00 && b_reg[22:0] != 23'h0) begin
            // Subnormal b - simplified handling
            reciprocal_exp = 9'd253 - 9'd1;
        end else begin
            reciprocal_exp = 9'd253 - b_reg[30:23];
        end
        
        // Construct the reciprocal value based on various conditions
        if (a_reg[30:23] < 8'd2 && b_reg[30:23] >= 8'd127) begin
            // For very small numerator and normal denominator >= 1.0
            reciprocal_temp = {1'b0, 8'h01, 23'h0}; // Small value to prevent overflow
        end else if (reciprocal_exp > 9'd254) begin
            // Overflow
            reciprocal_temp = {1'b0, 8'hFF, 23'h0};
        end else if (reciprocal_exp < 9'd1) begin
            // Underflow
            reciprocal_temp = {1'b0, 8'h00, 23'h0};
        end else begin
            // Normal case: use x2's mantissa with calculated exponent
            reciprocal_temp = {1'b0, reciprocal_exp[7:0], x5[22:0]};
        end
        
        // Apply the sign of the denominator to the reciprocal
        reciprocal_result = {b_reg[31], reciprocal_temp[30:0]};

        // reciprocal_result = x5; // directly from result of previous mul
    end
    else
        reciprocal_result='d0;

    end
   
    Register #(.bits(1)) add_en_reg (
        .clk(clk), 
        .rst_n(rst_n), 
        .clear(clear), 
        .en(en), 
        .d(en_add), 
        .q(en_add_ff)
    );   
endmodule