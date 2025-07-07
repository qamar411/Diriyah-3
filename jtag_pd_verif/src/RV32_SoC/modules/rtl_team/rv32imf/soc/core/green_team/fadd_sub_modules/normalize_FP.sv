
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


module normalize_FP(
        input sign1,
        input sign2,
        input [47:0] mantissa_sum,
        input [7:0] exp_res,
        input  carry,
        input  zero,
        output logic [22:0] mantissa_norm,
        output logic [7:0] exp_norm,
        output logic underflow
    );


always_comb begin

         if (exp_res==0) begin
            if (mantissa_sum[47:24] ==0) begin // result=0
                mantissa_norm =0;
                exp_norm = 8'b0;
             end
//             else if(mantissa_sum == 24'h7fffff ) begin 
                // case1 -> max_subnormal + smallest_positive_subnormal
                // case2 -> max_negative_subnormal - smallest_positive_subnormal
//             end
             else begin // result is subnormal value
                mantissa_norm =mantissa_sum [46:24];
                exp_norm = 8'b0;
             end
         end
         
         else if (sign1 == sign2 || zero) begin  // "addition" or "at least one of the operands iz zero"
            underflow=1'b0;
            case({carry,mantissa_sum[47]})
                2'b00: begin
                    mantissa_norm = mantissa_sum [46:24];
                    exp_norm = 8'b0;
                end
                2'b01: begin
                    mantissa_norm = mantissa_sum [46:24];
                    exp_norm = exp_res;
                end
                2'b10: begin
                    mantissa_norm = {1'b0,mantissa_sum[46:25]};
                    exp_norm = exp_res + 1;  

                end 
                2'b11: begin
                    mantissa_norm = {1'b1,mantissa_sum[46:25]};
                    exp_norm = exp_res + 1;  
                end
            default: begin
                mantissa_norm = mantissa_sum [46:24];
                exp_norm = exp_res;
            end
            endcase
            end
            
            else begin

                if (mantissa_sum[47]) begin
                    mantissa_norm = mantissa_sum[46:24];
                    exp_norm = exp_res;
                end

                else if (mantissa_sum[46]) begin
                    mantissa_norm = mantissa_sum[45:23];
                    exp_norm = exp_res - 23'd1;
                end
                else if (mantissa_sum[45]) begin 
                    mantissa_norm = mantissa_sum[44:22];
                    exp_norm = exp_res - 23'd2;
                end
                else if (mantissa_sum[44]) begin
                    mantissa_norm = mantissa_sum[43:21];
                    exp_norm = exp_res - 23'd3;
                end
                else if (mantissa_sum[43]) begin
                    mantissa_norm = mantissa_sum[42:20];
                    exp_norm = exp_res - 23'd4;
                end
                else if (mantissa_sum[42]) begin
                    mantissa_norm = mantissa_sum[41:19];
                    exp_norm = exp_res - 23'd5;
                end
                else if (mantissa_sum[41]) begin
                    mantissa_norm = mantissa_sum[40:18];
                    exp_norm = exp_res - 23'd6;
                end
                else if (mantissa_sum[40]) begin
                    mantissa_norm = mantissa_sum[39:17];
                    exp_norm = exp_res - 23'd7;
                end
                else if (mantissa_sum[39]) begin
                    mantissa_norm = mantissa_sum[38:16];
                    exp_norm = exp_res - 23'd8;
                end
                else if (mantissa_sum[38]) begin
                    mantissa_norm = mantissa_sum[37:15];
                    exp_norm = exp_res - 23'd9;
                end
                else if (mantissa_sum[37]) begin
                    mantissa_norm = mantissa_sum[36:14];
                    exp_norm = exp_res - 23'd10;
                end
                else if (mantissa_sum[36]) begin
                    mantissa_norm = mantissa_sum[35:13];
                    exp_norm = exp_res - 23'd11;
                end
                else if (mantissa_sum[35]) begin
                    mantissa_norm = mantissa_sum[34:12];
                    exp_norm = exp_res - 23'd12;
                end
                else if (mantissa_sum[34]) begin
                    mantissa_norm = mantissa_sum[33:11];
                    exp_norm = exp_res - 23'd13;
                end
                else if (mantissa_sum[33]) begin
                    mantissa_norm = mantissa_sum[32:10];
                    exp_norm = exp_res - 23'd14;
                end
                else if (mantissa_sum[32]) begin
                    mantissa_norm = mantissa_sum[31:9];
                    exp_norm = exp_res - 23'd15;
                end
                else if (mantissa_sum[31]) begin
                    mantissa_norm = mantissa_sum[30:8];
                    exp_norm = exp_res - 23'd16;
                end
                else if (mantissa_sum[30]) begin
                    mantissa_norm = mantissa_sum[29:7];
                    exp_norm = exp_res - 23'd17;
                end
                else if (mantissa_sum[29]) begin
                    mantissa_norm = mantissa_sum[28:6];
                    exp_norm = exp_res - 23'd18;
                end
                else if (mantissa_sum[28]) begin
                    mantissa_norm = mantissa_sum[27:5];
                    exp_norm = exp_res - 23'd19;
                end
                else if (mantissa_sum[27]) begin
                    mantissa_norm = mantissa_sum[26:4];
                    exp_norm = exp_res - 23'd20;
                end
                else if (mantissa_sum[26]) begin
                    mantissa_norm = mantissa_sum[25:3];
                    exp_norm = exp_res - 23'd21;
                end
                else if (mantissa_sum[25]) begin
                    mantissa_norm = mantissa_sum[24:2];
                    exp_norm = exp_res - 23'd22;
                end
                else if (mantissa_sum[24]) begin
                    mantissa_norm = mantissa_sum[23:1];
                    exp_norm = exp_res - 23'd23;
                end
                else begin
                    mantissa_norm = 0;
                    exp_norm = exp_res - 23'd24;
                end

                if (exp_norm>exp_res)
                underflow=1'b1;
                else
                underflow=1'b0;
            end
                        
end          
    
endmodule