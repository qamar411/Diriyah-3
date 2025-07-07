
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
        output logic [2:0] grs,
        output logic [47:0] mantissa_sum,
        output logic  carry,
        output logic  sign_res,
        input logic a_is_zero, // check if num1 is zero
        input logic b_is_zero  // check if num2 is zero
    );

logic [48:0] mantissa_sum_extended;
logic [47:0] mantissa_sum_temp;
always_comb begin
     if (sign1 == sign2) begin
         {mantissa_sum_extended} = mantissa2_aligned + mantissa1_aligned;
         sign_res = sign1;
     end 
     else if (mantissa1_aligned > mantissa2_aligned) begin
         {mantissa_sum_extended} = mantissa1_aligned - mantissa2_aligned;
         sign_res = sign1;
     end 
     else begin
         {mantissa_sum_extended} = mantissa2_aligned - mantissa1_aligned;
         sign_res = sign2;
     end
     
     if(mantissa_sum_extended[48]) begin 
        grs[2] =  mantissa_sum_extended[24];
        grs[1] =  mantissa_sum_extended[23];
        grs[0] = |mantissa_sum_extended[22:0]; // sticky
        mantissa_sum_temp = mantissa_sum_extended[47:0]; 
     end else begin 
        grs[2] =  mantissa_sum_extended[23];
        grs[1] =  mantissa_sum_extended[22];
        grs[0] = |mantissa_sum_extended[21:0]; // sticky   
        mantissa_sum_temp = mantissa_sum_extended[47:0]; 
     end

     if((mantissa1_aligned == 'b0 | mantissa2_aligned == 'b0) & ~a_is_zero &~b_is_zero) begin 
        if(sign1 ^ sign2) begin 
            mantissa_sum = mantissa_sum_temp - 1;
            grs = 3'b111;
        end else begin 
            grs[0] = 1'b1; // to make sure the sticky bit is one
            mantissa_sum = mantissa_sum_temp;        end
     end
     else 
     begin
        mantissa_sum = mantissa_sum_temp;
     end
end   

assign carry = mantissa_sum_extended[48];
    
endmodule