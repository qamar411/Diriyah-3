
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
        input [48:0] mantissa_sum,
        input [7:0] exp_res,
        input  carry,
        input  zero,
        input  sticky_bit,
        output logic [22:0] mantissa_norm,
        output logic [7:0] exp_norm,
        output logic underflow,
        output logic [2:0] grs 
    );

    logic G, R, S;

always_comb begin
         G = 0;
         R = 0;
         S = 0;
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
                {G, R, S} = {mantissa_sum[23], mantissa_sum[22], |mantissa_sum[21:0]};
             end
         end
         
         else if (sign1 == sign2 || zero) begin  // "addition" or "at least one of the operands iz zero"
            underflow=1'b0;
            case({carry,mantissa_sum[47]})
                2'b00: begin
                    mantissa_norm = mantissa_sum [46:24];
                    exp_norm = 8'b0;
                    {G, R, S} = {mantissa_sum[23], mantissa_sum[22], |mantissa_sum[21:0]};
                end
                2'b01: begin
                    mantissa_norm = mantissa_sum [46:24];
                    exp_norm = exp_res;
                    {G, R, S} = {mantissa_sum[23], mantissa_sum[22], |mantissa_sum[21:0]};
                end
                2'b10: begin
                    mantissa_norm = {1'b0,mantissa_sum[46:25]};
                    exp_norm = exp_res + 1;  
                    {G, R, S} = {mantissa_sum[24], mantissa_sum[23], |mantissa_sum[22:0]};

                end 
                2'b11: begin
                    mantissa_norm = {1'b1,mantissa_sum[46:25]};
                    exp_norm = exp_res + 1; 
                    {G, R, S} = {mantissa_sum[24], mantissa_sum[23], |mantissa_sum[22:0]};                           
                end
            default: begin
                mantissa_norm = mantissa_sum [46:24];
                exp_norm = exp_res;
                {G, R, S} = {mantissa_sum[23], mantissa_sum[22], |mantissa_sum[21:0]};
            end
            endcase
            end
            
            else begin

                if (mantissa_sum[47]) begin
                    mantissa_norm = mantissa_sum[46:24];
                    exp_norm = exp_res;
                    {G, R, S} = {mantissa_sum[23], mantissa_sum[22], |mantissa_sum[21:0]};
                end

                else if (mantissa_sum[46]) begin
                    mantissa_norm = mantissa_sum[45:23];
                    exp_norm = exp_res - 23'd1;
                    {G, R, S} = {mantissa_sum[22], mantissa_sum[21], |mantissa_sum[20:0]};
                end
                else if (mantissa_sum[45]) begin 
                    mantissa_norm = mantissa_sum[44:22];
                    exp_norm = exp_res - 23'd2;
                    {G, R, S} = {mantissa_sum[21], mantissa_sum[20], |mantissa_sum[19:0]};
                end
                else if (mantissa_sum[44]) begin
                    mantissa_norm = mantissa_sum[43:21];
                    exp_norm = exp_res - 23'd3;
                    {G, R, S} = {mantissa_sum[20], mantissa_sum[19], |mantissa_sum[18:0]};
                end
                else if (mantissa_sum[43]) begin
                    mantissa_norm = mantissa_sum[42:20];
                    exp_norm = exp_res - 23'd4;
                    {G, R, S} = {mantissa_sum[19], mantissa_sum[18], |mantissa_sum[17:0]};
                end
                else if (mantissa_sum[42]) begin
                    mantissa_norm = mantissa_sum[41:19];
                    exp_norm = exp_res - 23'd5;
                    {G, R, S} = {mantissa_sum[18], mantissa_sum[17], |mantissa_sum[16:0]};
                end
                else if (mantissa_sum[41]) begin
                    mantissa_norm = mantissa_sum[40:18];
                    exp_norm = exp_res - 23'd6;
                    {G, R, S} = {mantissa_sum[17], mantissa_sum[16], |mantissa_sum[15:0]};
                end
                else if (mantissa_sum[40]) begin
                    mantissa_norm = mantissa_sum[39:17];
                    exp_norm = exp_res - 23'd7;
                    {G, R, S} = {mantissa_sum[16], mantissa_sum[15], |mantissa_sum[14:0]};
                end
                else if (mantissa_sum[39]) begin
                    mantissa_norm = mantissa_sum[38:16];
                    exp_norm = exp_res - 23'd8;
                    {G, R, S} = {mantissa_sum[15], mantissa_sum[14], |mantissa_sum[13:0]};
                end
                else if (mantissa_sum[38]) begin
                    mantissa_norm = mantissa_sum[37:15];
                    exp_norm = exp_res - 23'd9;
                    {G, R, S} = {mantissa_sum[14], mantissa_sum[13], |mantissa_sum[12:0]};
                end
                else if (mantissa_sum[37]) begin
                    mantissa_norm = mantissa_sum[36:14];
                    exp_norm = exp_res - 23'd10;
                    {G, R, S} = {mantissa_sum[13], mantissa_sum[12], |mantissa_sum[11:0]};
                end
                else if (mantissa_sum[36]) begin
                    mantissa_norm = mantissa_sum[35:13];
                    exp_norm = exp_res - 23'd11;
                    {G, R, S} = {mantissa_sum[12], mantissa_sum[11], |mantissa_sum[10:0]};
                end
                else if (mantissa_sum[35]) begin
                    mantissa_norm = mantissa_sum[34:12];
                    exp_norm = exp_res - 23'd12;
                    {G, R, S} = {mantissa_sum[11], mantissa_sum[10], |mantissa_sum[9:0]};
                end
                else if (mantissa_sum[34]) begin
                    mantissa_norm = mantissa_sum[33:11];
                    exp_norm = exp_res - 23'd13;
                    {G, R, S} = {mantissa_sum[10], mantissa_sum[9], |mantissa_sum[8:0]};
                end
                else if (mantissa_sum[33]) begin
                    mantissa_norm = mantissa_sum[32:10];
                    exp_norm = exp_res - 23'd14;
                    {G, R, S} = {mantissa_sum[9], mantissa_sum[8], |mantissa_sum[7:0]};
                end
                else if (mantissa_sum[32]) begin
                    mantissa_norm = mantissa_sum[31:9];
                    exp_norm = exp_res - 23'd15;
                    {G, R, S} = {mantissa_sum[8], mantissa_sum[7], |mantissa_sum[6:0]};
                end
                else if (mantissa_sum[31]) begin
                    mantissa_norm = mantissa_sum[30:8];
                    exp_norm = exp_res - 23'd16;
                    {G, R, S} = {mantissa_sum[7], mantissa_sum[6], |mantissa_sum[5:0]};
                end
                else if (mantissa_sum[30]) begin
                    mantissa_norm = mantissa_sum[29:7];
                    exp_norm = exp_res - 23'd17;
                    {G, R, S} = {mantissa_sum[6], mantissa_sum[5], |mantissa_sum[4:0]};
                end
                else if (mantissa_sum[29]) begin
                    mantissa_norm = mantissa_sum[28:6];
                    exp_norm = exp_res - 23'd18;
                    {G, R, S} = {mantissa_sum[5], mantissa_sum[4], |mantissa_sum[3:0]};
                end
                else if (mantissa_sum[28]) begin
                    mantissa_norm = mantissa_sum[27:5];
                    exp_norm = exp_res - 23'd19;
                    {G, R, S} = {mantissa_sum[4], mantissa_sum[3], |mantissa_sum[2:0]};
                end
                else if (mantissa_sum[27]) begin
                    mantissa_norm = mantissa_sum[26:4];
                    exp_norm = exp_res - 23'd20;
                    {G, R, S} = {mantissa_sum[3], mantissa_sum[2], |mantissa_sum[1:0]};
                end
                else if (mantissa_sum[26]) begin
                    mantissa_norm = mantissa_sum[25:3];
                    exp_norm = exp_res - 23'd21;
                    {G, R, S} = {mantissa_sum[2], mantissa_sum[1], |mantissa_sum[0]};
                end
                else if (mantissa_sum[25]) begin
                    mantissa_norm = mantissa_sum[24:2];
                    exp_norm = exp_res - 23'd22;
                    {G, R, S} = {mantissa_sum[1], mantissa_sum[0], 1'b0};
                end
                else if (mantissa_sum[24]) begin
                    mantissa_norm = mantissa_sum[23:1];
                    exp_norm = exp_res - 23'd23;
                    {G, R, S} = {mantissa_sum[0], 1'b0, 1'b0};
                end
                else begin
                    mantissa_norm = mantissa_sum[22:0];
                    exp_norm = exp_res - 23'd24;
                    {G, R, S} = {1'b0, 1'b0, 1'b0};
                end

                if (exp_norm>exp_res)
                    underflow=1'b1;
                else
                underflow=1'b0;
            end
                        
end       

assign grs = {G, R, {S | sticky_bit}};
    
endmodule