import riscv_types::*;

// a unit for executing other Floating-Point instructions (e.g.fmax, fmin, ..etc.)
module fpu (
    input logic clk,
    input logic reset_n,
    input logic en,
    input logic p_start,
    input exe_p_mux_bus_type i_pipelined_signals,
    input alu_t alu_ctrl ,
    input logic [2:0] fun3,
    input logic [31:0] rs1,
    input logic [31:0] rs2,
    output logic p_last,
    output exe_p_mux_bus_type o_pipelined_signals,
    output logic [31:0] result 
);

// Input registers
    logic [31:0] rs1_q, rs2_q;
    alu_t alu_ctrl_q;
    logic [2:0] fun3_q;
    logic [7:0] exp_1, exp_2;                             
    logic [22:0] frac_1, frac_2;                          
    logic zero_1,zero_2,inf_1,inf_2,nan_1,nan_2;          
    assign exp_1 = rs1_q[30:23];                            
    assign exp_2 = rs2_q[30:23];                            
    assign frac_1 = rs1_q[22:0];                            
    assign frac_2 = rs2_q[22:0];                            
                                                          
    logic [8:0] reciprocal_exp;                           
    logic [31:0] reciprocal_temp;                         
    // Special case detection                             
    assign zero_1 = (exp_1 == 8'h00) && (frac_1 == 23'h0);
    assign zero_2 = (exp_2 == 8'h00) && (frac_2 == 23'h0);
    assign inf_1 = (exp_1 == 8'hFF) && (frac_1 == 23'h0); 
    assign inf_2 = (exp_2 == 8'hFF) && (frac_2 == 23'h0); 
    assign nan_1 = (exp_1 == 8'hFF) && (frac_1 != 23'h0); 
    assign nan_2 = (exp_2 == 8'hFF) && (frac_2 != 23'h0); 

  always_ff @(posedge clk, negedge reset_n) begin
    if (!reset_n) begin
        p_last <= 1'b0;
        o_pipelined_signals <= 'b0;
        
        rs1_q <= 'b0;
        rs2_q <= 'b0;
        alu_ctrl_q <= alu_t'(0); // type casting
        fun3_q <= 'b0;
    // end else if (en) begin
    end else if (en) begin
        if (p_start) begin
            p_last <= p_start;
            o_pipelined_signals <= i_pipelined_signals;
            
            rs1_q <= rs1;
            rs2_q <= rs2;
            alu_ctrl_q <= alu_ctrl;
            fun3_q <= fun3;
        end else begin
            p_last <= 1'b0;
            o_pipelined_signals <= 'b0;
            
            rs1_q <= 'b0;
            rs2_q <= 'b0;
            alu_ctrl_q <= alu_t'(0); // type casting
            fun3_q <= 'b0;
        end
    end
  end 


// FCVT.s logic ...
logic [31:0] fcvt_result;
FP_converter fcvt (
    .alu_ctrl(alu_ctrl_q),
    .rs1(rs1_q),
    .rs2(rs2_q),
    .rm(fun3_q),
    .result(fcvt_result),
    .*
);


always_comb begin
    case(alu_ctrl_q)
        FMIN: begin                     
            if(nan_1 || nan_2) begin   
                /*
                this value 32'h7fc00000 is called "The Canonical NaN"
                based on unpriv-isa doc, this is the default NaN form
                */
                case({nan_1,nan_2})    
                2'b01:result = rs1_q; // if one of them is NaN then return the other one
                2'b10:result = rs2_q;    
                2'b11:result = 32'h7fc00000;
                default: result = 'b0; 
                endcase                
            end
            else if (inf_1 || (inf_2)) begin
                case({inf_1, inf_2})
                    2'b01: result = rs2_q[31]? rs2_q : rs1_q; // 2nd value is -inf
                    2'b10: result = rs1_q[31]? rs1_q : rs2_q; // 1st value is -inf
                    2'b11: result = rs1_q[31] >= rs2_q[31]? rs1_q : rs2_q; // (1 > 0?) --> means both inf but only 1st one is negative 
                    default: result = 32'd0;  // case= 2'b00 which never happen
                endcase
            end
            
            else if(rs1_q[31] > rs2_q[31]) begin // only 1st is negative -> yes "rs1<rs2"
                result = rs1_q;
            end
            else if(rs1_q[31] < rs2_q[31]) begin // only 2nd is negative
                result = rs2_q;
            end
            // if(rs1_q[31] == rs2_q[31]) -> BOTH HAVE SAME SIGN (either -ve or +ve)
            else if(exp_1 < exp_2) begin // compare 2 positive
                result = rs1_q[31]? rs2_q : rs1_q; // flip the logic if both were negative
            end
            else if(exp_1 > exp_2) begin // compare 2 positive
                result = rs1_q[31]? rs1_q : rs2_q; // flip the logic if both were negative
            end
            // if(exp_1 == exp_2)
            else if(frac_1 < frac_2) begin // compare 2 positive
                result = rs1_q[31]? rs2_q : rs1_q; // flip the logic if both were negative
            end
            else if(frac_1 > frac_2) begin // compare 2 positive
                result = rs1_q[31]? rs1_q : rs2_q; // flip the logic if both were negative
            end
            else if(frac_1 == frac_2) begin
                result = rs1_q;
            end
            else                  
            result = 0;                
                                       
        end                           
        FMAX:    begin                     
            if(nan_1 || nan_2) begin   
                /*
                this value 32'h7fc00000 is called "The Canonical NaN"
                based on unpriv-isa doc, this is the default NaN form
                */
                case({nan_1,nan_2})    
                2'b01:result = rs1_q; // if one of them is NaN then return the other one
                2'b10:result = rs2_q;    
                2'b11:result = 32'h7fc00000;
                default: result = 'b0; 
                endcase          
            end
            else if (inf_1 || (inf_2)) begin
                case({inf_1, inf_2})
                    2'b01: result = rs2_q[31]? rs1_q : rs2_q; // 2nd value is -inf
                    2'b10: result = rs1_q[31]? rs2_q : rs1_q; // 1st value is -inf
                    2'b11: result = rs1_q[31] >= rs2_q[31]?  rs2_q: rs1_q; // (1 > 0?) --> means both inf but only 1st one is negative 
                    default: result = 32'd0;  // case= 2'b00 which never happen
                endcase
            end
            
            else if(rs1_q[31] > rs2_q[31]) begin // only 1st is negative -> yes "rs1<rs2"
                result = rs2_q;
            end
            else if(rs1_q[31] < rs2_q[31]) begin // only 2nd is negative
                result = rs1_q;
            end
            // if(rs1_q[31] == rs2_q[31]) -> BOTH HAVE SAME SIGN (either -ve or +ve)
            else if(exp_1 < exp_2) begin // compare 2 positive
                result = rs1_q[31]? rs1_q : rs2_q ; // flip the logic if both were negative
            end
            else if(exp_1 > exp_2) begin // compare 2 positive
                result = rs1_q[31]? rs2_q : rs1_q; // flip the logic if both were negative
            end
            // if(exp_1 == exp_2)
            else if(frac_1 < frac_2) begin // compare 2 positive
                result = rs1_q[31]? rs1_q : rs2_q; // flip the logic if both were negative
            end
            else if(frac_1 > frac_2) begin // compare 2 positive
                result = rs1_q[31]? rs2_q : rs1_q; // flip the logic if both were negative
            end
            else if(frac_1 == frac_2) begin
                result = rs1_q;
            end
            else                  
            result = 0;                
                                       
        end                            
        FEQ: begin                     
            if(nan_1 || nan_2)         
            result = 0;                
            else if(rs1_q == rs2_q || (zero_1 && zero_2))         
            result = 1;                
            else                       
            result = 0;                
        end                            
        FLT: begin                     
            if(nan_1 || nan_2)         
            result = 0;            
            else if (inf_1 || (inf_2)) begin
                case({inf_1, inf_2})
                    2'b01: result = rs2_q[31]? 32'd0 : 32'd1; // 2nd value is -inf
                    2'b10: result = rs1_q[31]? 32'd1 : 32'd0; // 1st value is -inf
                    2'b11: result = rs1_q[31] > rs2_q[31]? 32'd1 : 32'd0; // (1 > 0?) --> means both inf but only 1st one is negative 
                    default: result = 32'd0;  // case= 2'b00 which never happen
                endcase
            end   
            else if (zero_1 || zero_2) begin
                case({zero_1, zero_2})
                    2'b01: result = rs1_q[31]? 32'd1 : 32'd0; // 2nd value is zero
                    2'b10: result = rs2_q[31]? 32'd0 : 32'd1; // 1st value is zero
                    2'b11: result = 32'd0; // both zeros -> they're equivalent
                    default: result = 32'd0;  // case= 2'b00 which never happen
                endcase
            end 
            else if(rs1_q[31] > rs2_q[31]) begin // only 1st is negative -> yes "rs1<rs2"
                result = 32'd1;
            end
            else if(rs1_q[31] < rs2_q[31]) begin // only 2nd is negative
                result = 32'd0;
            end
            // if(rs1_q[31] == rs2_q[31]) -> BOTH HAVE SAME SIGN (either -ve or +ve)
            else if(exp_1 < exp_2) begin // compare 2 positive
                result = rs1_q[31]? 32'd0 : 32'd1; // flip the logic if both were negative
            end
            else if(exp_1 > exp_2) begin // compare 2 positive
                result = rs1_q[31]? 32'd1 : 32'd0; // flip the logic if both were negative
            end
            // if(exp_1 == exp_2)
            else if(frac_1 < frac_2) begin // compare 2 positive
                result = rs1_q[31]? 32'd0 : 32'd1; // flip the logic if both were negative
            end
            else if(frac_1 > frac_2) begin // compare 2 positive
                result = rs1_q[31]? 32'd1 : 32'd0; // flip the logic if both were negative
            end
            else                       
            result = 0;                
        end                            
        FLE: begin                     
            if(nan_1 || nan_2)         
            result = 0;   
            else if (inf_1 || (inf_2)) begin
                case({inf_1, inf_2})
                    2'b01: result = rs2_q[31]? 32'd0 : 32'd1; // 2nd value is -inf
                    2'b10: result = rs1_q[31]? 32'd1 : 32'd0; // 1st value is -inf
                    2'b11: result = rs1_q[31] >= rs2_q[31]? 32'd1 : 32'd0; // (1 >= 0?) --> means both inf but either negative and positve 
                    default: result = 32'd0;  // case= 2'b00 which never happen
                endcase
            end
            else if (zero_1 || zero_2) begin
                case({zero_1, zero_2})
                    2'b01: result = rs1_q[31]? 32'd1 : 32'd0; // 2nd value is zero
                    2'b10: result = rs2_q[31]? 32'd0 : 32'd1; // 1st value is zero
                    2'b11: result = 32'd1; // both zeros -> they're equivalent
                    default: result = 32'd0;  // case= 2'b00 which never happen
                endcase
            end 
            else if(rs1_q[31] > rs2_q[31]) begin // only 1st is negative -> yes "rs1<rs2"
                result = 32'd1;
            end
            else if(rs1_q[31] < rs2_q[31]) begin // only 2nd is negative
                result = 32'd0;
            end
            // if(rs1_q[31] == rs2_q[31]) -> BOTH HAVE SAME SIGN (either -ve or +ve)
            else if(exp_1 < exp_2) begin // compare 2 positive
                result = rs1_q[31]? 32'd0 : 32'd1; // flip the logic if both were negative
            end
            else if(exp_1 > exp_2) begin // compare 2 positive
                result = rs1_q[31]? 32'd1 : 32'd0; // flip the logic if both were negative
            end
            // if(exp_1 == exp_2)
            else if(frac_1 < frac_2) begin // compare 2 positive
                result = rs1_q[31]? 32'd0 : 32'd1; // flip the logic if both were negative
            end
            else if(frac_1 > frac_2) begin // compare 2 positive
                result = rs1_q[31]? 32'd1 : 32'd0; // flip the logic if both were negative
            end
            else if(frac_1 == frac_2) begin
                result = 32'd1;
            end
            else                  
            result = 0;                
                                       
        end                            
        FSGNJ: begin
            result = {rs2_q[31],rs1_q[30:0]};
        end
        FSGNJN: begin
            result = {~rs2_q[31],rs1_q[30:0]}; 
        end
        FSGNJX: begin
            result = {rs1_q[31]^rs2_q[31],rs1_q[30:0]};
        end
        FCLASS: begin
            if(rs1_q[22] == 1'b0 && rs1_q[21:0] > 22'b0 && rs1_q[30:23] == 8'b11111111) //sNan
            result = {22'd0,10'b0100000000};
            else if(rs1_q[22] == 1'b1 && rs1_q[21:0] >= 22'd0 && rs1_q[30:23] == 8'b11111111)//qNan
            result = {22'd0,10'b1000000000};
            else if(rs1_q[31] == 1'b0 && rs1_q[22:0] == 23'd0 && rs1_q[30:23] == 8'b11111111)//+Inf
            result = {22'd0,10'b0010000000};
            else if(rs1_q[31] == 1'b1 && rs1_q[22:0] == 23'd0 && rs1_q[30:23] == 8'b11111111)//-Inf
            result = {22'd0,10'b0000000001};
            else if(rs1_q[31] == 1'b1 && rs1_q[30:0] == 31'd0)//-zero
            result = {22'd0,10'b0000001000};
            else if(rs1_q[31] == 1'b0 && rs1_q[30:0] == 31'd0)//+zero
            result = {22'd0,10'b0000010000};
            else if(rs1_q[31] == 1'b1 && rs1_q[30:23] == 8'd0 && rs1_q[22:0] > 23'd0)//-Subnum
            result = {22'd0,10'b0000000100};
            else if(rs1_q[31] == 1'b0 && rs1_q[30:23] == 8'd0 && rs1_q[22:0] > 23'd0)//+Subnum
            result = {22'd0,10'b0000100000};
            else if(rs1_q[31] == 1'b1)//- normal num
            result = {22'd0,10'b0000000010};
            else//+ normal num
            result = {22'd0,10'b0001000000};
        end
        FMVXW: begin
            result = rs1_q;
        end
        
        // all results in fcvt here are the same because FP_converter module already handled the result
        FCVTW: begin    // FP to integer (signed)
            result = fcvt_result;
        end
        FCVTWU: begin    // FP to integer (unsigned)
            result = fcvt_result;
        end
        FCVTSW: begin    // integer to FP (signed)
            result = fcvt_result;
        end
        FCVTSWU: begin    // integer to FP (unsigned)
            result = fcvt_result;
        end
        
        FMVWX: begin
            result = rs1_q;
        end
        
        default: result = 'b0;
    endcase
end


endmodule