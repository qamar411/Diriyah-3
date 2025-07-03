`timescale 1ns / 1ps

import riscv_types::*;

module int_div_rem #(
    parameter WIDTH=32  // width of numbers in bits (integer only)
    ) (
    input wire clk,    // clock
    input wire rst,    // reset
    input logic clear,
    input logic en,
    input alu_t alu_ctrl,
    input reg [WIDTH-1:0] a,   // dividend (numerator)
    input reg [WIDTH-1:0] b,   // divisor (denominator)
    output logic [WIDTH-1:0] result,  // result value (quotient or remainder based on func3)

    // flags
    output logic dbz,    // divide by zero
    output logic ovf,    // overflow

    // contorl signals
    output logic stall,   // calculation in progress  NAME IT STALL USED TO BE  BUSY
    input wire i_p_signal,  // start calculation NAME IT i_p_signal used to be start
    output logic o_p_signal,   // calculation is complete (high for one tick)   NAME IT o_p_signal
    output logic [4:0] rd_div_unit_use, // rd that Div_unit uses during calcuation
    input exe_p_mux_bus_type   i_pipeline_control,
    output exe_p_mux_bus_type   o_pipeline_control
    );
    
    /* func3 operation codes ...
        localparam DIV  = 3'b100;  // signed division
        localparam DIVU = 3'b101;  // unsigned division
        localparam REM  = 3'b110;  // signed remainder
        localparam REMU = 3'b111;  // unsigned remainder

        TIP: Use full width for all operations to avoid losing bits
        NOTE: this division module implements unsigned-division, then handles the sign bit
        seperatly. Thus, the result should in 2's complement form to represent negative values
    */
    
    // Constants
    localparam SMALLEST = {1'b1, {WIDTH-1{1'b0}}};  // smallest negative number -2147483648 (-2^31) -> 32'h8000_0000
    localparam ITER = WIDTH;                        // Use full width iterations
    
    // Internal signals ...
    logic [$clog2(ITER):0] i;           // iteration counter
    // logic unsigned [WIDTH-1:0] a_abs, b_abs;     // absolute values of operands (full width) --> unsigned??
    logic [WIDTH-1:0] a_abs, b_abs;     // absolute values of operands (full width)
    logic [WIDTH-1:0] temp_a, temp_b;   // no needs ...
    logic [WIDTH-1:0] quotient_next;    // intermeidate signal (result)
    logic [WIDTH:0] acc_next ;         // intermeidate signal (remainder)
    logic temp_is_signed, temp_is_remainder;
    logic special_case1, special_case2; // 1: divided by zero --- 2: SMALLEST/-1

    // Internal registers (flip-flops)
    logic a_signed, b_signed;            // sign flags for operands
    logic is_signed;                     // operation is signed (DIV or REM)
    logic is_remainder;                  // operation is remainder (REM or REMU)
    logic [WIDTH-1:0] temp_a_ff, temp_b_ff;
    logic [WIDTH-1:0] quotient;  // quotient accumulator (full width) -> result
    logic [WIDTH:0] acc;       // division accumulator (one bit wider) -> remainder
    exe_p_mux_bus_type   temp_i_pipeline_control;
    logic [4:0] temp_rd_div_unit_use;

    // Determine operation type from func3
    assign temp_is_signed = (alu_ctrl == DIV || alu_ctrl == REM);
    assign temp_is_remainder = (alu_ctrl == REM || alu_ctrl == REMU);
    assign temp_a = a;
    assign temp_b = b;

    // Get absolute values for operands (full width)
    assign a_abs = a_signed ? -temp_a_ff : temp_a_ff;
    assign b_abs = b_signed ? -temp_b_ff : temp_b_ff;

    // define the special cases
    assign special_case1 = (temp_b==0); // devide by zero
    assign special_case2 = (temp_is_signed && temp_a==SMALLEST && temp_b=={WIDTH{1'b1}}); // SMALLEST / -1

    // Division algorithm iteration ...
    always_comb begin
        if (acc >= {1'b0, b_abs}) begin
            acc_next = acc - {1'b0, b_abs};
            {acc_next, quotient_next} = {acc_next[WIDTH-1:0], quotient, 1'b1};
        end else begin
            {acc_next, quotient_next} = {acc, quotient} << 1;
        end
    end 
    

    // Calculation state machine
    enum {IDLE, INIT, CALC, FINALIZE} state, next_state;

    // next_state logic
    always_comb begin
        case (state)
            IDLE: next_state = en && i_p_signal? ((special_case1 || special_case2)? FINALIZE : INIT) : IDLE;
            INIT: next_state = CALC;
            CALC: next_state = (i == ITER-1)? FINALIZE : CALC;
            FINALIZE: next_state = IDLE;
        endcase
    end

    // update internal registers and current_state ...
    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            state <= IDLE;
            dbz <= 0;
            ovf <= 0;
            result <= 0;
            // reset flip-flops ...
            i <= 0;
            {a_signed, b_signed, is_signed, is_remainder} <= 4'h0;
            temp_a_ff <= {WIDTH{1'b0}};
            temp_b_ff <= {WIDTH{1'b0}};
            quotient <= {WIDTH{1'b0}};
            acc <= {WIDTH+1{1'b0}}; // has one bit more for carry
            temp_rd_div_unit_use <=  0;
            temp_i_pipeline_control<= 0;
            // reset output signals
            stall <= 0;
            o_p_signal<= 0 ;
            o_pipeline_control <= 0;  
            rd_div_unit_use <= 0;

        end else if (clear) begin
            state <= IDLE;
            dbz <= 0;
            ovf <= 0;
            result <= 0;
            // clear flip-flops
            {a_signed, b_signed, is_signed, is_remainder} <= 4'h0;
            temp_a_ff <= {WIDTH{1'b0}};
            temp_b_ff <= {WIDTH{1'b0}};
            quotient <= {WIDTH{1'b0}};
            acc <= {WIDTH+1{1'b0}}; // has one bit more for carry
            temp_rd_div_unit_use <=  0;
            temp_i_pipeline_control<= 0;
            // clear output signals
            stall <= 0;
            o_p_signal<= 1 ;
            o_pipeline_control <= 0;  
            rd_div_unit_use <= 0;
        
        end else if (en) begin
            case (state)
                INIT: begin
                    state <= next_state;
                    i <= 0;
                    ovf <= 0;
                    dbz <= 0;
                    // Initialize calculation registers with full width
                    {acc, quotient} <= {{WIDTH{1'b0}}, a_abs, 1'b0};
                    // init some outputs
                    stall<=1;
                    o_p_signal<=0;
                    o_pipeline_control<=temp_i_pipeline_control;
                    rd_div_unit_use <= temp_i_pipeline_control.rd;
                end // End "INIT" case
                
                CALC: begin
                    state <= next_state;
                    if (i == ITER-1) begin
                        stall<=1;
                        o_p_signal<=0;
                        o_pipeline_control<=temp_i_pipeline_control;
                    end else begin     
                        i <= i + 1;
                        acc <= acc_next;
                        quotient <= quotient_next;
                        stall<=1;
                        o_p_signal<=0;
                    end
                end // End "CALC" case
                
                FINALIZE: begin
                    state <= next_state;
                    stall <= 0;
                    // ACTIVATE o_p_signal IN NORMAL CASES ONLY
                    if (dbz || ovf) begin
                        o_p_signal <= 0;
                    end else begin
                        o_p_signal <= 1;
                    end
                    dbz <= 0;
                    ovf <= 0;
                    rd_div_unit_use <= o_pipeline_control.rd;

                    if (is_remainder) begin // REM & REMU 
                        // Return remainder (acc) ...
                        if (temp_a_ff == temp_b_ff) begin // X%X = 0 
                            result <= {WIDTH{1'b0}};
                        // Remainder takes sign of dividend (a) for signed operations
                        end else if (is_signed && a_signed) begin // only REM: (-a) % X = -y
                            result <= -acc_next[WIDTH:1]; // 2's complement of y
                        end else begin
                            result <= acc_next[WIDTH:1]; 
                        end
                    end else begin // DIV & DIVU
                        // Return quotient ...
                        // For signed operations, quotient is negative if signs differ
                        if (is_signed && (a_signed ^ b_signed)) begin // only DIV
                            result <= -quotient_next;
                        end else begin
                            result <= quotient_next;
                        end
                    end
                end // End "FINALIZE" case

                default: begin  // IDLE
                    state <= next_state;
                    if (i_p_signal) begin
                        // Initialize internal registers ...
                        temp_a_ff <= temp_a;
                        temp_b_ff <= temp_b;
                        temp_i_pipeline_control <= i_pipeline_control;
                        // Determine input signs (relevant for signed operations only)
                        is_signed <= temp_is_signed;
                        is_remainder <= temp_is_remainder;
                        a_signed <= temp_is_signed && temp_a[WIDTH-1];
                        b_signed <= temp_is_signed && temp_b[WIDTH-1];
                        // initialize some outputs ...
                        o_pipeline_control <= i_pipeline_control; // used within all conditions in IDLE state
                        rd_div_unit_use <= i_pipeline_control.rd;

                        // Handle special cases
                        if (special_case1) begin
                            // special case: Divide by zero ...
                            stall <= 0;
                            o_p_signal <= 1;
                            dbz <= 1'b1;
                            ovf <= 1'b0;
                            if (temp_is_remainder) // dbz result as per RISC-V spec
                                result <= temp_a;  // return temp_a
                            else // DIV & DIVU
                                result <= 32'hFFFFFFFF; // Default value: -1 or maximum unsigned value
                        end else if (special_case2) begin // Used temp values (input signals)
                            // Special case: INT_MIN / -1 (overflow) => qou=SMALLEST, rem=0 ...
                            stall <= 0;
                            o_p_signal <= 1;
                            dbz <= 1'b0;
                            ovf <= 1'b1;
                            if (temp_is_remainder) // ovf result as per RISC-V spec
                                result <= {WIDTH{1'b0}};
                            else // DIV & DIVU
                                result <= SMALLEST; // Default value: 32'h8000_0000
                        end else begin
                            stall <= 1;
                            o_p_signal<=0;
                            dbz <= 1'b0;
                            ovf <= 1'b0;
                            // o_pipeline_control <= i_pipeline_control;
                        end  
                    end else begin // End i_p_signal
                        stall <= 0;
                        o_p_signal <= 0;
                        dbz <= 1'b0;
                        ovf <= 1'b0;
                    end // End else
                end // End "IDLE" case
            endcase
        end // End if(en)
    end // End always block
endmodule