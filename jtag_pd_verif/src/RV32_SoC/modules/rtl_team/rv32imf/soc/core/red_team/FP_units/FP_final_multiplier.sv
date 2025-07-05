import riscv_types::*;

// Function to count leading zeros
function automatic [5:0] count_leading_zeros(input logic [47:0] in);
    integer i;
    begin
        count_leading_zeros = 0;
        for (i = 47; i >= 0; i = i - 1) begin
            if (in[i] == 1'b1)
                break;
            count_leading_zeros = count_leading_zeros + 1;
        end
    end
endfunction

function automatic [5:0] count_leading_zeros_24(input logic [23:0] in);
    integer i;
    begin
        count_leading_zeros_24 = 0;
        for (i = 23; i >= 0; i = i - 1) begin
            if (in[i] == 1'b1)
                break;
            count_leading_zeros_24 = count_leading_zeros_24 + 1;
        end
    end
endfunction


module FP_final_Multiplier #(
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
    output logic [31:0] result
    
);
    // Output registers (for pipeline)
    logic [2:0] rm_pi;
    logic sign_res_pi;
    logic [47:0]mant_round_pi;
    logic [7:0] exp_a_pi, exp_b_pi;
    logic [31:0] a_pi, b_pi;
  
    logic sign_res;
    logic [7:0] exp_a, exp_b, exp_res;
    logic signed [9:0] exp_round;
    logic [47:0] mant_round;
    logic [22:0] mant_res;
    logic [7:0] final_exp;
    logic [22:0] final_mant;

    assign exp_a_pi = a[30:23];
    assign exp_b_pi = b[30:23];

    logic G,R,S;
    
    logic signed [9:0] exp_a_unbiased, exp_b_unbiased;
    logic [5:0] lz, lz_a, lz_b;  // Leading zeros (0 to 47)    
    logic signed [9:0] norm_exp_s; // Signed adjusted exponent
    logic [47:0] mant_res_shifted;  // temporary for shifted result
    
    // Pre-multiply registers (for pipeline) 
    // NOTE: signals labeled as _pi2 precede _pi signals
    logic [31:0] a_pi2, b_pi2;
    logic sign_a_pi, sign_b_pi, P_signal_pi;
    logic [7:0] exp_a_pi2, exp_b_pi2;
    logic [23:0] mant_a_pi2, mant_b_pi2;
    logic [2:0] rm_pi2;
    exe_p_mux_bus_type pipelined_signals_pi;
    logic [5:0] shift_amt;
    logic is_nan_a;
    logic is_nan_b;
    logic is_inf_a;
    logic is_inf_b;
    logic is_zero_a;
    logic is_zero_b;

    logic [23:0] mant_a_norm, mant_b_norm;
    logic signed [9:0] exp_a_norm, exp_b_norm;
    logic signed [7:0] exp_a_ff, exp_b_ff;
    logic signed [7:0] exp_a_ff2, exp_b_ff2;

    

    // Normalize inputs (combinational block)
    always_comb begin
        // Normalize input A
        lz_a = 0;
        lz_b = 0;
        if (a[30:23] == 8'h00) begin
            lz_a = count_leading_zeros_24({1'b0, a[22:0]});
            mant_a_norm = {1'b0, a[22:0]} << lz_a;
            exp_a_norm = 1 - lz_a;
        end else begin
            mant_a_norm = {1'b1, a[22:0]}; // Normalized mantissa
            exp_a_norm = a[30:23] - 127;
        end

        // Normalize input B
        if (b[30:23] == 8'h00) begin
            lz_b = count_leading_zeros_24({1'b0, b[22:0]});
            mant_b_norm = {1'b0, b[22:0]} << lz_b;
            exp_b_norm = 1 - lz_b;
        end else begin
            mant_b_norm = {1'b1, b[22:0]}; // Normalized mantissa
            exp_b_norm = b[30:23] - 127;
        end
    end
    
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

            exp_a_ff  <= 'b0;
            exp_b_ff  <= 'b0;

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

            exp_a_ff  <= 'b0;
            exp_b_ff  <= 'b0;

            rm_pi2 <= 'b0;
            pipelined_signals_pi <= 'b0;
            P_signal_pi <= 1'b0;
      end else if (en) begin
            a_pi2 <= a;
            b_pi2 <= b;
            sign_a_pi <= a[31];
            sign_b_pi <= b[31];
            exp_a_pi2 <= exp_a_norm;
            exp_b_pi2 <= exp_b_norm;
            mant_a_pi2 <= mant_a_norm;
            mant_b_pi2 <= mant_b_norm;
            exp_a_ff  <= exp_a_pi;
            exp_b_ff  <= exp_b_pi;

            rm_pi2 <= rm;
            pipelined_signals_pi <= fmul_pipeline_signals_i;
            P_signal_pi <= P_signal;
      end
    end 
    
    assign sign_res_pi = sign_a_pi ^ sign_b_pi;

    assign mant_round_pi = mant_a_pi2 * mant_b_pi2;
    
    logic inc_overflow; 
 
 // Output pipeline stage (holds control signals)
      always@(posedge clk ,negedge rst_n)begin 
     
        if(!rst_n)begin
            a_pi <= 'b0;
            b_pi <= 'b0;
            
            sign_res <= 0;
            P_O_signal <= 0;
            rm_pi <= 0;
            mant_round <= 0;
            exp_a <=0 ;
            exp_b <=0;
            fmul_pipeline_signals_o <= 0;

            exp_a_ff2  <= 'b0;
            exp_b_ff2  <= 'b0;

        
        end else if (clear[0])begin
            a_pi <= 'b0;
            b_pi <= 'b0;
            
            sign_res <= 0;
            P_O_signal <= 0;
            rm_pi <= 0;
            mant_round <= 0;
            exp_a <=0 ;
            exp_b <=0;
            fmul_pipeline_signals_o <= 0;

            exp_a_ff2  <= 'b0;
            exp_b_ff2  <= 'b0;
        
         end else if (en) begin 
            a_pi <= a_pi2;
            b_pi <= b_pi2;
            
            sign_res <= sign_res_pi;
            P_O_signal <= P_signal_pi;
            rm_pi <= rm_pi2;
            mant_round <= mant_round_pi;
            exp_a <= exp_a_pi2;
            exp_b <= exp_b_pi2;
      
            fmul_pipeline_signals_o <= pipelined_signals_pi;

            exp_a_ff2  <= exp_a_ff;
            exp_b_ff2  <= exp_b_ff;
     
        end 
    end
    
    // Clear logic
    assign uu_reg_write = {pipelined_signals_pi.reg_write, fmul_pipeline_signals_o.reg_write};
    assign uu_FP_reg_write = {pipelined_signals_pi.FP_reg_write, fmul_pipeline_signals_o.FP_reg_write};
    assign uu_rd = {pipelined_signals_pi.rd, fmul_pipeline_signals_o.rd};


    always_comb begin
        // Determine unbiased exponent
        // exp_a_unbiased = (exp_a == 8'h00) ? -126 : {1'b0, exp_a} - 127;
        // exp_b_unbiased = (exp_b == 8'h00) ? -126 : {1'b0, exp_b} - 127;
        exp_a_unbiased = exp_a;
        exp_b_unbiased = exp_b;
    
        // Add exponents for multiplication
        exp_round = exp_a_unbiased + exp_b_unbiased + 127;
    end
            
    // Normalize
    always_comb begin
        if (mant_round[47]) begin
            // Overflow in mantissa (bit 47 is high): shift right by 1, exponent++
            final_mant = mant_round[46:24];
            final_exp = exp_round + 1;
        end else if (mant_round[46]) begin
            // Already normalized: just extract mantissa
            final_mant = mant_round[45:23];
            final_exp = exp_round[7:0];
        end else begin
            // Not normalized: count leading zeros and shift left
            lz = count_leading_zeros(mant_round); 
            mant_res_shifted = mant_round << lz;
            norm_exp_s = $signed(exp_round) - lz; 

            if (norm_exp_s >= 1) begin
                // Normal number
                final_exp = norm_exp_s + 1;
                final_mant = mant_res_shifted[46:24];
            end else if (norm_exp_s >= -23) begin
                // Subnormal number
                shift_amt = 1 - norm_exp_s;
                final_exp = 8'd0;
                final_mant = mant_res_shifted[47-:25] >> shift_amt; // Extracts 25 bits downwards
            end else begin
                // Underflow to zero
                final_exp = 8'd0;
                final_mant = 23'd0;
            end
        end
    end

    // Round
    always_comb begin
        G = mant_round[23];
        R = mant_round[22];
        S = |mant_round[21:0];

                case (rm_pi)
                3'b000: begin // *RNE: Round to Nearest, Ties to Even*
                    if (G && (R || S || final_mant[0])) begin
                            {inc_overflow, mant_res} = {1'b0, final_mant} + 1;
                            exp_res = final_exp + inc_overflow;
                        end else begin
                            mant_res = final_mant;
                            exp_res = final_exp;
                        end
                end
                3'b001: begin // *RTZ: Round Toward Zero (Truncate)*
                      mant_res = final_mant;
                        exp_res = final_exp;
                end
                3'b010: begin // *RDN: Round Down (-∞)*
                    if (sign_res && (R || S || G)) begin
                        {inc_overflow,mant_res} = final_mant + 1;
                        if(inc_overflow) begin
                            exp_res = final_exp + 1;
                        end
                        else begin
                            exp_res = final_exp;
                        end
                    end
                    else
                          mant_res = final_mant;
                        exp_res = final_exp;
                end
                3'b011: begin // *RUP: Round Up (+∞)*
                    if (~sign_res && (R || S || G)) begin
                        {inc_overflow,mant_res} = final_mant + 1;
                        if(inc_overflow) begin
                            exp_res = final_exp + 1;
                        end
                        else begin
                             exp_res = final_exp ;
                        end
                    end
                    else
                          mant_res = final_mant;
                        exp_res = final_exp;
                end
                3'b100: begin // round to maximum magnitude 
                    if (G) begin
                        {inc_overflow,mant_res} = final_mant + 1;
                        if(inc_overflow) begin
                            exp_res = final_exp + 1;
                        end
                        else begin
                            exp_res = final_exp;
                        end  
                    end
                    else
                        mant_res = final_mant;
                        exp_res = final_exp;
                end
                default : begin // *RNE: Round to Nearest, Ties to Even*
                        if (G && (R || S || final_mant[0])) begin
                            {inc_overflow, mant_res} = {1'b0, final_mant} + 1;
                            exp_res = final_exp + inc_overflow;
                        end else begin
                            mant_res = final_mant;
                            exp_res = final_exp;
                        end
                    end
                endcase
            end
    
    // Special case handling
    always_comb begin
        is_nan_a =  (exp_a_ff2 == 8'hFF && a_pi[22:0] != 0);
        is_nan_b =  (exp_b_ff2 == 8'hFF && b_pi[22:0] != 0);
        is_inf_a =  (exp_a_ff2 == 8'hFF && a_pi[22:0] == 0);
        is_inf_b =  (exp_b_ff2 == 8'hFF && b_pi[22:0] == 0);
        is_zero_a = (exp_a_ff2 == 8'h00 && a_pi[22:0] == 0);
        is_zero_b = (exp_b_ff2 == 8'h00 && b_pi[22:0] == 0);
        
        if (is_nan_a || is_nan_b) begin // NaN case (if any input is NaN, result is NaN)
            result = {1'b0, 8'hFF, 23'h400000};  // Canonical NaN 0x7FC00000
        end else if ((is_inf_a && is_zero_b) || (is_inf_b && is_zero_a)) begin
            result = {1'b0, 8'hFF, 23'h400000};  // Canonical NaN 0x7FC00000
        end else if (is_inf_a || is_inf_b) begin // Infinity case
            result = {sign_res, 8'hFF, 23'b0};
        end else if (is_zero_a || is_zero_b) begin // Zero case
            result = {sign_res, 8'b0, 23'b0};
        end else if (exp_res >= 8'hFF || (exp_round > 254)) begin // Overflow case (result is greater than max value, return infinity)
            result = {sign_res, 8'hFF, 23'b0};
        end else if (exp_round <= -125 ) begin // Result underflow
            result = {sign_res, 8'b0, 23'b0};
        end else begin // Normal case (result is valid)
            result = {sign_res, exp_res, mant_res};
        end
    end
    
endmodule
