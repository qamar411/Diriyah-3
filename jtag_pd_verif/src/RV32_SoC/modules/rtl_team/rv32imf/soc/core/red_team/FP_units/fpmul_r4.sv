import riscv_types::*;




module fpmul_r4 #(
    parameter addr_width = 5,
    parameter num_rds = 2
    ) (
    input logic clk,rst_n,en,
    input logic [num_rds-1:0] clear,
    input logic [31:0] a,   
    input logic [31:0] b, 
    input logic [2:0] rm,
    input logic P_signal,
    input exe_p_mux_bus_type fmul_pipeline_signals_i,
    output exe_p_mux_bus_type fmul_pipeline_signals_o,
    output logic P_O_signal,
    // for clear logic
    output logic [addr_width-1:0] uu_rd [0:num_rds-1],
    output logic [num_rds-1:0] uu_reg_write,
    output logic [num_rds-1:0] uu_FP_reg_write,
    output logic [9:0] exp_o,
    output logic [47:0] mant_o,
    output logic        sign_o,
    output logic        is_NaN_o, 
    output logic        is_inf_o,
    output logic        is_zero_o
);
    // Output registers (for pipeline)
    logic [2:0] rm_pi;
    logic sign_res_pi;
    logic [47:0]mant_round_pi;
    logic [7:0] exp_a_pi, exp_b_pi;
    logic [31:0] a_pi, b_pi;
  
    logic [7:0] exp_a, exp_b, exp_res;
    logic [7:0] final_exp;
    logic [22:0] final_mant;

    assign exp_a_pi = a[30:23];
    assign exp_b_pi = b[30:23];
    
    logic signed [9:0] exp_a_unbiased, exp_b_unbiased; 
    
    // Pre-multiply registers (for pipeline) 
    // NOTE: signals labeled as _pi2 precede _pi signals
    logic [31:0] a_pi2, b_pi2;
    logic sign_a_pi, sign_b_pi, P_signal_pi;
    logic [7:0] exp_a_pi2, exp_b_pi2;
    logic [23:0] mant_a_pi2, mant_b_pi2;
    logic [2:0] rm_pi2;
    exe_p_mux_bus_type pipelined_signals_pi;
    logic is_nan_a;
    logic is_nan_b;
    logic is_inf_a;
    logic is_inf_b;
    logic is_zero_a;
    logic is_zero_b;
    
    // Pre-multiply pipeline stage (prepares operands)
    always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            a_pi2 <= 'b0; // a_pi2 is before a_pi
            b_pi2 <= 'b0;
            sign_a_pi <= 1'b0;
            sign_b_pi <= 1'b0;
            exp_a_pi2 <= 'b0;
            exp_b_pi2 <= 'b0;
            mant_a_pi2 <= 'b0;
            mant_b_pi2 <= 'b0;
            rm_pi2 <= 'b0;
            pipelined_signals_pi <= 'b0;
            P_signal_pi <= 1'b0;
      end else if (clear[1]) begin
            a_pi2 <= 'b0;
            b_pi2 <= 'b0;
            sign_a_pi <= 1'b0;
            sign_b_pi <= 1'b0;
            exp_a_pi2 <= 'b0;
            exp_b_pi2 <= 'b0;
            mant_a_pi2 <= 'b0;
            mant_b_pi2 <= 'b0;
            rm_pi2 <= 'b0;
            pipelined_signals_pi <= 'b0;
            P_signal_pi <= 1'b0;
      end else if (en) begin
            a_pi2 <= a;
            b_pi2 <= b;
            sign_a_pi <= a[31];
            sign_b_pi <= b[31];
            exp_a_pi2 <= a[30:23];
            exp_b_pi2 <= b[30:23];
            mant_a_pi2 <= (a[30:23] == 8'h00) ? {1'b0, a[22:0]} : {1'b1, a[22:0]}; // Handle subnormal numbers
            mant_b_pi2 <= (b[30:23] == 8'h00) ? {1'b0, b[22:0]} : {1'b1, b[22:0]}; // Handle subnormal numbers
            rm_pi2 <= rm;
            pipelined_signals_pi <= fmul_pipeline_signals_i;
            P_signal_pi <= P_signal;
      end
    end 
    
    assign sign_res_pi = sign_a_pi ^ sign_b_pi;

    assign mant_round_pi = mant_a_pi2 * mant_b_pi2;
    
 
 // Output pipeline stage (holds control signals)
      always@(posedge clk ,negedge rst_n)begin 
     
        if(!rst_n)begin
            a_pi <= 'b0;
            b_pi <= 'b0;
            
            sign_o <= 0;
            P_O_signal <= 0;
            rm_pi <= 0;
            mant_o <= 0;
            exp_a <=0 ;
            exp_b <=0;
            fmul_pipeline_signals_o <= 0;
        
        end else if (clear[0])begin
            a_pi <= 'b0;
            b_pi <= 'b0;
            
            sign_o <= 0;
            P_O_signal <= 0;
            rm_pi <= 0;
            mant_o <= 0;
            exp_a <=0 ;
            exp_b <=0;
            fmul_pipeline_signals_o <= 0;
        
         end else if (en) begin 
            a_pi <= mant_a_pi2;
            b_pi <= mant_b_pi2;
            
            sign_o <= sign_res_pi;
            P_O_signal <= P_signal_pi;
            rm_pi <= rm_pi2;
            mant_o <= mant_round_pi;
            exp_a <= exp_a_pi2;
            exp_b <= exp_b_pi2;
      
            fmul_pipeline_signals_o <= pipelined_signals_pi;
     
        end 
    end
    
    // Clear logic
    assign uu_reg_write = {pipelined_signals_pi.reg_write, fmul_pipeline_signals_o.reg_write};
    assign uu_FP_reg_write = {pipelined_signals_pi.FP_reg_write, fmul_pipeline_signals_o.FP_reg_write};
    assign uu_rd = {pipelined_signals_pi.rd, fmul_pipeline_signals_o.rd};


    always_comb begin
        // Determine unbiased exponent
        exp_a_unbiased = (exp_a == 8'h00) ? -126 : {1'b0, exp_a} - 127;
        exp_b_unbiased = (exp_b == 8'h00) ? -126 : {1'b0, exp_b} - 127;
    
        // Add exponents for multiplication
        exp_o = exp_a_unbiased + exp_b_unbiased + 127;
    end


    // Special case handling
    always_comb begin
        is_nan_a = (exp_a == 8'hFF && a_pi[22:0] != 0);
        is_nan_b = (exp_b == 8'hFF && b_pi[22:0] != 0);
        is_inf_a = (exp_a == 8'hFF && a_pi[22:0] == 0);
        is_inf_b = (exp_b == 8'hFF && b_pi[22:0] == 0);
        is_zero_a = (exp_a == 8'h00 && a_pi[22:0] == 0);
        is_zero_b = (exp_b == 8'h00 && b_pi[22:0] == 0);

        is_NaN_o = 1'b0;
        is_inf_o = 1'b0;    
        is_zero_o = 1'b0;
        
        if (is_nan_a || is_nan_b) begin // NaN case (if any input is NaN, result is NaN)
            is_NaN_o = 1'b1;
        end else if ((is_inf_a && is_zero_b) || (is_inf_b && is_zero_a)) begin
            is_NaN_o = 1'b1;
        end else if (is_inf_a || is_inf_b) begin // Infinity case
            is_inf_o = 1'b1;
        end else if (is_zero_a || is_zero_b) begin // Zero case
            is_zero_o = 1'b1;
        end 
    end  
    
endmodule