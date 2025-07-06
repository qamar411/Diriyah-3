
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


module add_sub_FP(
        input sign1,
        input sign2,
        input [47:0] mantissa1_aligned,
        input [47:0] mantissa2_aligned,
        output logic [23:0] grs,
        output logic [23:0] mantissa_sum,
        output logic  carry,
        output logic  sign_res,
        input logic a_is_zero, // check if num1 is zero
        input logic b_is_zero  // check if num2 is zero
    );

logic [23:0] mantissa_sum_temp;
always_comb begin
     if (sign1 == sign2) begin
         {carry, mantissa_sum_temp,grs} = mantissa2_aligned + mantissa1_aligned;
         sign_res = sign1;
     end 
     else if (mantissa1_aligned > mantissa2_aligned) begin
         {carry,mantissa_sum_temp,grs} = mantissa1_aligned - mantissa2_aligned;
         sign_res = sign1;
     end 
     else begin
         {carry,mantissa_sum_temp,grs} = mantissa2_aligned - mantissa1_aligned;
         sign_res = sign2;
     end
     if(mantissa1_aligned == 'b0 & ~a_is_zero &~b_is_zero) begin 
        grs[23:0] = 24'hffffff;
        mantissa_sum[23:0] = mantissa_sum_temp - 1;
     end
     else if(mantissa2_aligned == 'b0 & ~a_is_zero &~b_is_zero) begin 
        grs[23:0] = 24'hffffff;
        mantissa_sum[23:0] = mantissa_sum_temp - 1;
     end
     else 
    begin
        mantissa_sum[23:0] = mantissa_sum_temp;
    end
end          
    
endmodule