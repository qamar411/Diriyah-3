
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2025 02:24:40 AM
// Design Name: 
// Module Name: extract_align_FP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module round_fp_r4(
        input NaN,
        input inf1,
        input inf2,
        input sign1,
        input sign2,
        input underflow,
        input [2:0] grs,
        input [2:0] rm,
        input logic  sign_res,
        input logic [7:0] exp_norm,
        output logic [31:0] result,
        
        input logic [22:0] mantissa_norm,
        input logic        res_is_zero
        
    );

    logic G,R,S;
    logic overflow,inc_overflow;
//    logic [23:0] mantissa_norm_res;  // wrong
    logic [22:0] mantissa_norm_res; // correct
    logic [7:0] exp_round;
    logic       sign_res_final;


    always_comb begin 
        if(res_is_zero || (result[30:0] == 0)) begin
            case(rm)
                3'b000: sign_res_final  = sign_res; // Round to Nearest, Ties to Even
                3'b011: sign_res_final  = 1'b0;     // Round Up (+∞)
                3'b100: sign_res_final  = sign_res; // Round to Maximum Magnitude
                3'b001: sign_res_final  = sign_res; // Round Toward Zero
                3'b010: sign_res_final  = 1'b1;     // Round Down (-∞)
                default: sign_res_final = sign_res; // Default: Same as input sign
            endcase
        end else begin
            sign_res_final = sign_res;
        end
    end
always_comb begin

        G = grs[2];
        R = grs[1];
        S = grs[0];

        // Overflow & Underflow detection
        overflow = exp_norm > 8'd254;
        // underflow = (exp_norm == 0 && mantissa_norm == 0);

        // else if (underflow) begin
            
        //     result = {sign_res_final, 8'd0, 23'b0}; // Zero
        // end 

        // Handle special cases first
        if (NaN) begin // NaN case
            result = {1'b0, 8'd255, 23'h40_0000}; // Canonical NaN = 0x7fc0_0000
        end else if (inf1 && inf2) begin // Both inputs are infinity
            if (sign1 == sign2) begin
                result = {sign1, 8'd255, 23'd0}; // Same sign: Infinity
            end else begin
                result = {1'b0, 8'd255, 23'h40_0000}; // Opposite signs: NaN
            end
        end else if (inf1 || inf2) begin // One input is infinity
            result = {inf1 ? sign1 : sign2, 8'd255, 23'd0}; // Infinity
        end else if ((exp_norm == 0 && mantissa_norm == 0)) begin // Zero case
            result = {sign_res_final, 8'd0, 23'd0}; // Zero
        end else if (overflow) begin // Overflow case
            case (rm)
                3'b000: begin // **RNE: Round to Nearest, Ties to Even**
                    result = {sign_res_final, 8'd255, 23'd0}; // Infinity
                end

                3'b011: begin // **RUP: Round Up (+∞)**
                    if(sign_res_final) result = {sign_res_final, 8'd254, 23'h7fffff}; 
                    else result = {sign_res_final, 8'd255, 23'd0}; // Infinity
                end

                3'b100: begin // **RMM: Round to Maximum Magnitude**
                    result = {sign_res_final, 8'd255, 23'd0}; // Infinity
                end

                3'b001: begin // **RTZ: Round Toward Zero**
                    result = {sign_res_final, 8'd254, 23'h7fffff}; // Clamp to max finite value
                end

                3'b010: begin // **RDN: Round Down (-∞)**
                    if(~sign_res_final) result = {sign_res_final, 8'd254, 23'h7fffff}; 
                    else result = {sign_res_final, 8'd255, 23'd0}; // Infinity
                end

                default: begin
                    result = {sign_res_final, 8'd255, 23'd0}; // Default: Infinity
                end
            endcase
        // end else if (underflow) begin // Underflow case
        //     result = {sign_res_final, 8'd0, 23'd0}; // Zero
        end else begin


        case (rm)
            3'b000: begin // **RNE: Round to Nearest, Ties to Even**
                if (G) begin
                    if (R || S || mantissa_norm[0]) begin
                        {inc_overflow, mantissa_norm_res} = mantissa_norm + 1;
                        if (inc_overflow) begin
                            exp_round = exp_norm + 1;
                        end else begin
                            exp_round = exp_norm;
                        end
                    end else begin
                        mantissa_norm_res = mantissa_norm;
                        exp_round = exp_norm;
                    end
                end else begin
                    mantissa_norm_res = mantissa_norm;
                    exp_round = exp_norm;
                end
                result = {sign_res_final, exp_round, mantissa_norm_res};
            end

            3'b001: begin // **RTZ: Round Toward Zero (Truncate)**
                result = {sign_res_final, exp_norm, mantissa_norm};
            end

            3'b010: begin // **RDN: Round Down (-∞)**
                if (sign_res_final && (G || R || S)) begin
                    {inc_overflow, mantissa_norm_res} = mantissa_norm + 1;
                    if (inc_overflow) begin
                        exp_round = exp_norm + 1;
                    end else begin
                        exp_round = exp_norm;
                    end
                end else begin
                    mantissa_norm_res = mantissa_norm;
                    exp_round = exp_norm;
                end
                result = {sign_res_final, exp_round, mantissa_norm_res};
            end

            3'b011: begin // **RUP: Round Up (+∞)**
                if (!sign_res_final && (G || R || S)) begin
                    {inc_overflow, mantissa_norm_res} = mantissa_norm + 1;
                    if (inc_overflow) begin
                        exp_round = exp_norm + 1;
                    end else begin
                        exp_round = exp_norm;
                    end
                end else begin
                    mantissa_norm_res = mantissa_norm;
                    exp_round = exp_norm;
                end
                result = {sign_res_final, exp_round, mantissa_norm_res};
            end

            3'b100: begin // **Round to Maximum Magnitude**
                if (G) begin
                    {inc_overflow, mantissa_norm_res} = mantissa_norm + 1;
                    if (inc_overflow) begin
                        exp_round = exp_norm + 1;
                    end else begin
                        exp_round = exp_norm;
                    end
                end else begin
                    mantissa_norm_res = mantissa_norm;
                    exp_round = exp_norm;
                end
                result = {sign_res_final, exp_round, mantissa_norm_res};
            end

            default: begin
                result = {sign_res_final, exp_norm, mantissa_norm};
            end
        endcase            
end



end        
    
endmodule