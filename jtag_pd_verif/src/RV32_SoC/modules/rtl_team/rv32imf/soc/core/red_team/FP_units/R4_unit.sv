import riscv_types::*;
module R4_Unit #(
    parameter addr_width = 5,
    parameter num_rds = 5
    ) (
    input exe_p_mux_bus_type fadd_sub_pipeline_signals_i,
    output exe_p_mux_bus_type fadd_sub_pipeline_signals_o,

    input logic clk,rst,en,
    input logic [num_rds-1 :0] clear, // "id_exe_main_bus" included as register
    input logic [31:0] a, b, c,
    input alu_t alu_ctrl,
    input logic p_signal,
    input logic [2:0]rm,
    output logic [31:0] result, 
    output logic p_out_signal
    // for clear logic
    , output logic [addr_width-1 : 0] uu_rd [0 : num_rds-1],
    output logic [num_rds-1 : 0]  uu_reg_write,
    output logic [num_rds-1 : 0]  uu_FP_reg_write
);

    // pipelined signals
    exe_p_mux_bus_type stages[1:0];
    logic [31:0]  result_temp, result_temp2;
    logic add_sub;
    
    logic [31:0] c_temp_pi, result_temp_pi;
    logic [2:0] rm_pi;
    logic add_sub_pi, p_pi_signal;
    alu_t alu_ctrl_pi;  // "alu_ctrl" as delayed signal
    
    localparam R4_top_stages = 2;   // stage[0] "fmul" unit used --- stage[1] "fadd_sub" unit used
    localparam fmul_stages = 3;  // input-stage and output-stage
    
    // for clear logic ...
    logic [addr_width-1 : 0] R4_fadd_uu_rd [0 : 2];  // fadd has 4 stages (3 pipeline registers)
    logic [addr_width-1 : 0] R4_fmul_uu_rd [0 : 1];  // fmul has 3 stages (2 pipeline registers)
    logic [2:0] R4_fadd_uu_reg_write;
    logic [1:0] R4_fmul_uu_reg_write;
    logic [2:0] R4_fadd_uu_FP_reg_write;
    logic [1:0] R4_fmul_uu_FP_reg_write;
    
    assign uu_rd = {
        R4_fmul_uu_rd,   // FMul
        stages[1].rd,   // between FMul and FAdd
        R4_fadd_uu_rd
        
    };
    assign uu_reg_write = {
        R4_fadd_uu_reg_write,
        stages[1].reg_write,   // between FMul and FAdd
        R4_fmul_uu_reg_write    // FMul
    };
    assign uu_FP_reg_write = {
        R4_fadd_uu_FP_reg_write,
        stages[1].FP_reg_write,   // between FMul and FAdd
        R4_fmul_uu_FP_reg_write    // FMul
    };

    // calculation logic ...
    always@(*)begin 
        case(alu_ctrl)
            FMADD:begin // (rs1 * rs2) + rs3
                add_sub = 1'b0;
            end
            
            FMSUB:begin // (rs1 * rs2) - rs3
                add_sub = 1'b1;
            end 
            
            FNMADD:begin // -(rs1 * rs2) - rs3
                add_sub = 1'b1;
            end   
            
            FNMSUB:begin // -(rs1 * rs2) + rs3
                add_sub = 1'b0;
            end
            
            default: begin
                add_sub = 1'b0;  // FADD
            end   
        endcase
    end 
 
    logic        P_O_signal;
    logic [7:0]  mul_exp_o;
    logic [46:0] mul_mant_o;
    logic        mul_sign_o;
    logic        adder_op1_sign;

    logic [7:0]  adder_op1_exp_pi;
    logic [46:0] adder_op1_mant_pi;
    logic        adder_op1_sign_pi;


    logic       mul_NaN_o, mul_inf_o, mul_zero_o; 
    logic       adder_op1_is_NaN_pi, adder_op1_is_inf_pi, adder_op1_is_zero_pi;

    fpmul_r4 M1 (.a(a),  // its name was "FP_Multiplier"
        .b(b),
        .clk(clk),      // added
        .rst_n(rst),      // added
        .exp_o(mul_exp_o),
        .mant_o(mul_mant_o),
        .sign_o(mul_sign_o),
        .rm(rm),
        .fmul_pipeline_signals_i(fadd_sub_pipeline_signals_i),
        .fmul_pipeline_signals_o(stages[0]),
        .clear(clear[1:0]),
        .P_signal(p_signal),
        .P_O_signal(P_O_signal),
        .uu_rd(R4_fmul_uu_rd),
        .uu_reg_write(R4_fmul_uu_reg_write),
        .uu_FP_reg_write(R4_fmul_uu_FP_reg_write),
        .en(en),
        .adder_op1_sign(adder_op1_sign),
        .is_NaN_o(mul_NaN_o), 
        .is_inf_o(mul_inf_o),
        .is_zero_o(mul_zero_o)
    ); // takes 3 cycles
    

    always@(*)begin 
        if(alu_ctrl_pi == FNMADD || alu_ctrl_pi == FNMSUB) begin 
            adder_op1_sign = ~mul_sign_o; // negate the sign 
        end else 
            adder_op1_sign = mul_sign_o; // keep the sign 
    end
    
    
    // delay input signals that "fadd_sub" uses but fmul doesn't ...
    // 3rd operand (input c) delayer
    n_bit_delayer #(
        .n($bits(c)),
        .delay(fmul_stages-1 + R4_top_stages-1) // exclude last stage (output stage)
    ) c_temp_pi_delayer (
        .clk(clk),
        .reset_n(rst),
        .wen(en),
        .clr(clear[2:0]),
        .data_i(c),
        .data_o(c_temp_pi)
    );
    
    // "add_sub" control signal for fadd module
    n_bit_delayer #(
        .n(1),
        .delay(fmul_stages-1 + R4_top_stages-1) // exclude last R4_top_stage (output stage)
    ) add_sub_pi_delayer (
        .clk(clk),
        .reset_n(rst),
        .wen(en),
        .clr(clear[2:0]),
        .data_i(add_sub),
        .data_o(add_sub_pi)
    );
    
    // "add_sub" control signal for fadd module
    n_bit_delayer #(
        .n(3),
        .delay(fmul_stages-1 + R4_top_stages-1) // exclude last R4_top_stage (output stage)
    ) rm_pi_delayer (
        .clk(clk),
        .reset_n(rst),
        .wen(en),
        .clr(clear[2:0]),
        .data_i(rm),
        .data_o(rm_pi)
    );
    
    // alu_ctrl delayer
    alu_t alu_ctrl_pi2;
    always_ff@(posedge clk ,negedge rst) begin
        if(!rst) begin
            alu_ctrl_pi2 <= ADD; // defualt value
        end else if (clear[2]) begin
            alu_ctrl_pi2 <= ADD; // defualt value  
        end else if (en) begin
            alu_ctrl_pi2 <= alu_ctrl;
        end 
    end
    
    // single pipeline register between "fmul" and "fadd_sub" units
    always@(posedge clk ,negedge rst) begin
        if(!rst) begin
            adder_op1_exp_pi <= 'b0;
            adder_op1_mant_pi <= 'b0;   
            adder_op1_sign_pi <= 1'b0;
            adder_op1_is_inf_pi <= 1'b0;
            adder_op1_is_NaN_pi <= 1'b0;
            adder_op1_is_zero_pi <= 1'b0;
            p_pi_signal <= 0;
            stages[1] <= 0;
            alu_ctrl_pi <= ADD; // defualt value
        
        end else if (clear[2]) begin 
            adder_op1_exp_pi <= 'b0;
            adder_op1_mant_pi <= 'b0;   
            adder_op1_sign_pi <= 1'b0;
            adder_op1_is_inf_pi <= 1'b0;
            adder_op1_is_NaN_pi <= 1'b0;
            adder_op1_is_zero_pi <= 1'b0;
            p_pi_signal <= 0;
            stages[1] <= 'b0;
            alu_ctrl_pi <= ADD; // defualt value
        
        end else if (en) begin 
            adder_op1_exp_pi <= mul_exp_o; // delayed value
            adder_op1_mant_pi <= mul_mant_o; // delayed value   
            adder_op1_sign_pi <= adder_op1_sign; // delayed value
            adder_op1_is_inf_pi <= mul_inf_o; // delayed value
            adder_op1_is_NaN_pi <= mul_NaN_o; // delayed        
            adder_op1_is_zero_pi <= mul_zero_o; // delayed value
            p_pi_signal <= P_O_signal;
            stages[1] <= stages[0];  // no needs
            alu_ctrl_pi <= alu_ctrl_pi2;
        end 
    end


    
    logic p_add;

    faddsub_r4 A1 (
        .clk(clk), 
        .rst(rst), 
        .en(en),
        .clear(clear[5:3]), // clear[1] duplicated?
        .add_sub(add_sub_pi),
        .num1_exp(adder_op1_exp_pi),
        .num1_mant(adder_op1_mant_pi),
        .num1_sign(adder_op1_sign_pi),
        .num1_is_NaN(adder_op1_is_NaN_pi),
        .num1_is_inf(adder_op1_is_inf_pi), 
        .num1_is_zero(adder_op1_is_zero_pi),
        .num2(c_temp_pi),
        .rm(rm_pi),
        .sum(result),  // sum
        
        .p_start(p_pi_signal),
        .p_result(p_add),
        .fadd_sub_pipeline_signals_i(stages[1]),
        .fadd_sub_pipeline_signals_o(fadd_sub_pipeline_signals_o)
        
        // for clear logic
        , .uu_rd(R4_fadd_uu_rd),
        .uu_reg_write(R4_fadd_uu_reg_write),
        .uu_FP_reg_write(R4_fadd_uu_FP_reg_write)
    );

    assign p_out_signal = p_add;

endmodule