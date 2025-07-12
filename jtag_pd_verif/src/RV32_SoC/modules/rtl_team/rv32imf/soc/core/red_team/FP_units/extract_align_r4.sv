
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


module extract_align_r4(
        input add_sub,
        input logic [7:0]   num1_exp,    // exponent of num1
        input logic [46:0]  num1_mant,  // mantissa of num1
        input logic         num1_sign,  // sign of num1
        input logic [31:0]  num2,
        input logic         num1_is_NaN,
        input logic         num1_is_zero,
        output logic        NaN,
        output logic        inf2,
        output logic        sign1,
        output logic        sign2,
        output logic [7:0]  exp_res,
        output logic [47:0] mantissa1_aligned,
        output logic [47:0] mantissa2_aligned,
        output logic        zero,
        output logic        res_zero

    );
    
//    logic sign1; 
//    logic sign2; 
    logic [7:0] exp1 ; 
    logic [7:0] exp2 ; 
    logic [46:0] man1 ; 
    logic [22:0] man2 ; 
    logic [47:0] mantissa1, mantissa2; // 24-bit with implicit leading 1
    logic [7:0] exp1_sub;
    logic [7:0] exp2_sub;
    logic [7:0] exp_diff;
    logic zero1,zero2;
    
    assign sign1 = num1_sign;
    assign exp1  = num1_exp; 
    assign man1  = num1_mant[46:0]; 
    assign sign2 = num2[31] ^ add_sub;
    assign exp2  = num2[30:23];
    assign man2  = num2[22:0];

    assign zero1 = num1_is_zero || (exp1 == 8'h00 && man1 == 47'h0);
    assign zero2 = (exp2 == 8'h00) && (man2 == 23'h0);
    assign zero = zero1 || zero2; 
    
    always_comb begin
        NaN = num1_is_NaN || (man2 > 23'h000000 && exp2 == 8'b11111111);
        inf2 = (man2 ==23'd0 && exp2 == 8'b11111111); 
        res_zero = 'b0;
        exp_diff = 'b0;
         

            if(zero1) begin // zero 
                mantissa1 = 48'b0; 
                exp1_sub = 'b0; 
            end else if (exp1 == 8'b0) begin // subnormal
                mantissa1 = {1'b0, man1}; 
                if(exp2!=0) exp1_sub = exp1 + 1; 
                else        exp1_sub = exp1; 
            end
            else begin                       // normal
                mantissa1 = {1'b1, man1}; 
                exp1_sub = exp1; 
            end

            // 2nd operand
            if (exp2==0 && man2 ==0) begin
                mantissa2 = {1'b0, man2,24'b0};
                exp2_sub=exp2;
            end
            else if(exp2==0) begin  // subnormal
                mantissa2 = {1'b0, man2,24'b0};
                if(exp1!=0) exp2_sub=exp2+1;
                else        exp2_sub=exp2;
            end
            else begin
                mantissa2 = {1'b1, man2,24'b0};
                exp2_sub=exp2;
            end
        
            
            // Align exponent by shifting mantissa
            if ($signed(exp1_sub) > $signed({2'b00, exp2_sub})) begin
                exp_diff = exp1_sub - exp2_sub;
                mantissa2_aligned = mantissa2 >> exp_diff;
                // mantissa2_aligned = mantissa2 >> $clog2(exp_diff); // quick test
                mantissa1_aligned = mantissa1;
                exp_res = exp1_sub;
            end 
            else if($signed(exp1_sub) < $signed({2'b00, exp2_sub}))begin
                exp_diff = exp2_sub - exp1_sub;
                mantissa1_aligned = mantissa1 >> exp_diff;
                // mantissa1_aligned = mantissa1 >> $clog2(exp_diff); // quick test
                mantissa2_aligned = mantissa2;
                exp_res = exp2_sub;
            end 
            else begin
                mantissa1_aligned = mantissa1;
                mantissa2_aligned = mantissa2;
                exp_res = exp1_sub ;
            end
            
    
    end
    
    
    
endmodule