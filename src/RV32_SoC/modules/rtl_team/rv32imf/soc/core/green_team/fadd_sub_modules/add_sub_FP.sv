
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
        output logic [47:0] mantissa_sum,
        output logic  carry,
        output logic  sign_res,
        input logic a_is_zero, // check if num1 is zero
        input logic b_is_zero,  // check if num2 is zero
        output logic sticky_bit
    );

logic [48:0] mantissa_sum_extended;
always_comb begin
     if (sign1 == sign2) begin
         {mantissa_sum_extended} = mantissa2_aligned + mantissa1_aligned;
         sign_res = sign1;
     end 
     else if (mantissa1_aligned > mantissa2_aligned) begin
         {mantissa_sum_extended} = mantissa1_aligned - mantissa2_aligned;
         sign_res = sign1;
     end 
     else if (mantissa2_aligned > mantissa1_aligned) begin
         {mantissa_sum_extended} = mantissa2_aligned - mantissa1_aligned;
         sign_res = sign2;
     end 
     else begin
         {mantissa_sum_extended} = mantissa2_aligned - mantissa1_aligned;
         sign_res = 1'b0;
     end
     
     sticky_bit = 'b0;

     if((mantissa1_aligned == 'b0 | mantissa2_aligned == 'b0) & ~a_is_zero &~b_is_zero) begin 
        if(sign1 ^ sign2) begin 
            mantissa_sum = mantissa_sum_extended[47:0] - 1;
        end else begin 
            sticky_bit = 1'b1; // to make sure the sticky bit is one
            mantissa_sum = mantissa_sum_extended[47:0];        
        end
     end
     else 
     begin
        mantissa_sum = mantissa_sum_extended[47:0];
     end
end         

assign carry = mantissa_sum_extended[48];
    
endmodule