import riscv_types::*;

module faddsub_r4 (
    input  logic        clk,
    input  logic        rst,
    input  logic        en,
    input  logic [2:0]  clear,    // based on number of stages in this pipelined unit 
    input  logic        add_sub,
    input  logic [7:0]  num1_exp,   
    input  logic [46:0] num1_mant,  
    input  logic        num1_sign,  
    input  logic        num1_is_NaN, 
    input  logic        num1_is_inf, 
    input  logic        num1_is_zero, 
    input  logic [31:0] num2,
    input  logic [2:0]  rm,  // Rounding Mode
    output logic [31:0] sum,  // result
    
    input  logic        p_start,
    output logic        p_result,

    input  exe_p_mux_bus_type fadd_sub_pipeline_signals_i,
    output exe_p_mux_bus_type fadd_sub_pipeline_signals_o,
    
    // all rd used within this unit (fadd_sub unit)
    output logic [4:0]  uu_rd [0:2],    // means "unit uses these rds"
    output logic [2:0]  uu_reg_write,
    output logic [2:0]  uu_FP_reg_write
);

logic [31:0] result;
logic p_logic[2:0];
exe_p_mux_bus_type stage [2:0];

// clear logic
assign uu_rd[0] = stage[0].rd;
assign uu_rd[1] = stage[1].rd;
assign uu_rd[2] = fadd_sub_pipeline_signals_o.rd;
assign uu_reg_write = {fadd_sub_pipeline_signals_o.reg_write, stage[1].reg_write, stage[0].reg_write };
assign uu_FP_reg_write = {fadd_sub_pipeline_signals_o.FP_reg_write, stage[1].FP_reg_write, stage[0].FP_reg_write };

assign sum = result;
logic a_is_zero, b_is_zero;
logic a_is_zero_EA, b_is_zero_EA;

assign a_is_zero = num1_is_zero; // check if num1 is zero
assign b_is_zero = (num2[30:0] == 31'b0); // check if num2 is zero

//pipeline logic
always_ff @(posedge clk , negedge rst) begin
if (~rst) begin 
    p_logic[0]                  <=1'b0;
    p_logic[1]                  <=1'b0;
    p_logic[2]                  <=1'b0;
    p_result                    <=1'b0;
    stage[0]                    <='b0;
    stage[1]                    <='b0;
    stage[2]                    <='b0;
    fadd_sub_pipeline_signals_o <='b0;
end
else if (|clear) begin  // if there's any "clear" signal ... do the following ...
    p_logic[0]                  <=clear[0]? 1'b0 : p_start;
    p_logic[1]                  <=clear[1]? 1'b0 : p_logic[0];
    p_result                  <=clear[2]? 1'b0 : p_logic[1];
    stage[0]                    <=clear[0]? 1'b0 : fadd_sub_pipeline_signals_i;
    stage[1]                    <=clear[1]? 'b0 : stage[0];
    fadd_sub_pipeline_signals_o                   <=clear[2]? 'b0 : stage[1];
end 
else if(en) begin 
    
    p_logic[0]<=p_start;
    p_logic[1]<=p_logic[0];
    p_result<=p_logic[1];
    
    stage[0]<=fadd_sub_pipeline_signals_i;
    stage[1]<=stage[0];
    fadd_sub_pipeline_signals_o<=stage[1];
end

end // End always_ff




logic zero  ;
logic NaN   ;
logic inf1  ;
logic inf2  ;
logic sign1 ;
logic sign2 ;
logic [9:0] exp_res;
logic [47:0] mantissa1_aligned;
logic [47:0] mantissa2_aligned;
logic res_is_zero;
logic res_is_zero_EA;
logic res_is_zero_AS;
logic res_is_zero_N;
logic a_is_apox_zero;
        

        // EA extract align stage 
 extract_align_r4 extract_stage(
        // inputs 
        .add_sub(add_sub)                      ,
        .num1_exp(num1_exp)                      ,
        .num1_mant(num1_mant)                  ,
        .num1_sign(num1_sign)                  ,
        .num1_is_NaN(num1_is_NaN)              ,
        .num1_is_zero(num1_is_zero)          ,
        .num2(num2)                            ,
        // outputs                             ,
        .NaN(NaN)                              ,
        .inf2(inf2)                            ,
        .sign1(sign1)                            ,
        .sign2(sign2)                            ,
        .zero(zero)                           ,
        .exp_res(exp_res)                      ,
        .mantissa1_aligned(mantissa1_aligned)  ,
        .mantissa2_aligned(mantissa2_aligned)  ,
        .res_zero(res_is_zero),
        .num1_is_apox_zero(a_is_apox_zero)
    );
    assign inf1 = num1_is_inf; 

    
    logic             zero_EA                 ;
    logic             NaN_EA                 ;
    logic             inf1_EA                ;
    logic             inf2_EA                ;
    logic             sign1_EA                ;
    logic             sign2_EA                ;
    logic             a_is_apox_zero_EA;
    logic [7:0]       exp_res_EA             ;
    logic [47:0]      mantissa1_aligned_EA   ;
    logic [47:0]      mantissa2_aligned_EA   ;
    logic [2:0] rm_EA;
    
    
always_ff @(posedge clk , negedge rst) begin
if (~rst) begin 
    
    zero_EA <= 1'b0;
     NaN_EA                 <=1'b0;
     inf1_EA                <=1'b0;
     inf2_EA                <=1'b0;
     exp_res_EA             <=8'b0;
     mantissa1_aligned_EA   <=48'b0;  
     mantissa2_aligned_EA   <=48'b0;  
     sign1_EA<=1'b0;  
     sign2_EA<=1'b0;  
     rm_EA<=3'b000;
     a_is_zero_EA <= 1'b0;
     b_is_zero_EA <= 1'b0;
     res_is_zero_EA <= 1'b0;
     a_is_apox_zero_EA <= 1'b0;
end
else if (clear[0]) begin 
    
    zero_EA <= 1'b0;
     NaN_EA                 <=1'b0;
     inf1_EA                <=1'b0;
     inf2_EA                <=1'b0;
     exp_res_EA             <=8'b0;
     mantissa1_aligned_EA   <=48'b0;  
     mantissa2_aligned_EA   <=48'b0;
     sign1_EA<=1'b0;  
     sign2_EA<=1'b0;    
     rm_EA<=3'd0;
     a_is_zero_EA <= 'b0;
     b_is_zero_EA <= 'b0;
     res_is_zero_EA <= 1'b0;
     a_is_apox_zero_EA <= 1'b0;
end 
else if(en) begin 
    
    zero_EA <= zero;
     NaN_EA                 <=NaN;
     inf1_EA                <=inf1;
     inf2_EA                <=inf2;
     exp_res_EA             <=exp_res;
     mantissa1_aligned_EA   <=mantissa1_aligned;  
     mantissa2_aligned_EA   <=mantissa2_aligned;
     sign1_EA<=sign1;  
     sign2_EA<=sign2;  
     rm_EA<=rm;
     a_is_zero_EA <= a_is_zero;
     b_is_zero_EA <= b_is_zero;
     res_is_zero_EA <= res_is_zero;
     a_is_apox_zero_EA <= a_is_apox_zero;
end

end


        logic [47:0] mantissa_sum;
        logic carry;
        logic sign_res;
        logic sticky_bit_EA;
        
        //AS  add sub stage 
 add_sub_FP add_sub_stage(
        //inputs
        .sign1              (sign1_EA),
        .sign2              (sign2_EA),
        .mantissa1_aligned  (mantissa1_aligned_EA),
        .mantissa2_aligned  (mantissa2_aligned_EA),
        .a_is_zero        (a_is_zero_EA),
        .b_is_zero        (b_is_zero_EA),
        //outputs
        .mantissa_sum       (mantissa_sum),
        .carry              (carry),
        .sign_res           (sign_res),
        .sticky_bit         (sticky_bit_EA)
        
        
    );
    
        logic zero_AS;
        logic [2:0] grs_AS             ;
        logic sticky_bit_AS;
        logic [47:0] mantissa_sum_AS    ;
        logic        carry_AS           ;
        logic        sign_res_AS        ;  
        logic [7:0]       exp_res_AS             ;
        logic NaN_AS   ;
        logic inf1_AS  ;
        logic inf2_AS  ;
        logic sign1_AS ;
        logic sign2_AS ;
        logic [2:0] rm_AS ;
        logic a_is_apox_zero_AS;
  
  
  
  
    


always_ff @(posedge clk , negedge rst) begin
if (~rst) begin 
   
       zero_AS <= 1'b0;
        mantissa_sum_AS   <=24'd0;
        carry_AS          <=1'b0;
        sign_res_AS       <=1'b0; 
        exp_res_AS       <=7'd0;
        NaN_AS            <=1'b0;
        inf1_AS           <=1'b0;
        inf2_AS           <=1'b0;
        sign1_AS          <=1'b0;
        sign2_AS          <=1'b0;
        rm_AS             <=3'd0;
        res_is_zero_AS <= 1'b0;
        sticky_bit_AS <= 1'b0;
        a_is_apox_zero_AS <= 1'b0;


end
else if (clear[1]) begin 
    
       zero_AS <= 1'b0;
        mantissa_sum_AS   <=24'd0;
        carry_AS          <=1'b0;
        sign_res_AS       <=1'b0;
        exp_res_AS        <=7'd0;
        NaN_AS            <=1'b0;
        inf1_AS           <=1'b0;
        inf2_AS           <=1'b0;
        sign1_AS          <=1'b0;
        sign2_AS          <=1'b0;
        rm_AS             <=3'd0;
        res_is_zero_AS <= 1'b0;
        sticky_bit_AS <= 1'b0;
        a_is_apox_zero_AS <= 1'b0;


  
end 
else if(en) begin 

    zero_AS <= zero_EA;
        mantissa_sum_AS   <=mantissa_sum;
        carry_AS          <=carry;
        sign_res_AS       <=sign_res;
        exp_res_AS        <=exp_res_EA;
        NaN_AS            <=NaN_EA    ;
        inf1_AS           <=inf1_EA   ;
        inf2_AS           <=inf2_EA   ;
        sign1_AS          <=sign1_EA ;
        sign2_AS          <=sign2_EA  ;
        rm_AS<=rm_EA;
        res_is_zero_AS <= res_is_zero_EA;
        sticky_bit_AS <= sticky_bit_EA;
        a_is_apox_zero_AS <= a_is_apox_zero_EA;

end

end
        logic [47:0] mantissa_norm;
        logic [7:0] exp_norm;
        logic underflow;
             // N  normalize stage
normalize_fp_r4 normalize_stage(
        
        // inputs 
        .mantissa_sum        (mantissa_sum_AS),
        .exp_res             (exp_res_AS),
        .carry               (carry_AS),
        .sign1(sign1_AS),
        .sign2(sign2_AS),
        .zero(zero_AS),
        .sticky_bit          (sticky_bit_AS),
        .grs(grs_AS),
        //output
        .mantissa_norm       (mantissa_norm),
        .exp_norm            (exp_norm),
        .underflow(underflow)
        
    );

        logic [22:0] mantissa_norm_N;
        logic [2:0] grs_N;
        logic [7:0]  exp_norm_N      ;
        logic        sign_res_N      ;
        logic   NaN_N;   
        logic  inf1_N;  
        logic  inf2_N;  
        logic sign1_N;
        logic sign2_N; 
        logic underflow_N; 
        logic [2:0] rm_N; 
        logic a_is_apox_zero_N;
        
        
always_ff @(posedge clk , negedge rst) begin
if (~rst) begin 
   
mantissa_norm_N    <=23'd0;
exp_norm_N         <=8'd0;
sign_res_N         <=1'b0;
grs_N               <=24'd0;
NaN_N             <=1'b0;
inf1_N             <=1'b0;
inf2_N             <=1'b0;
sign1_N             <=1'b0;
sign2_N             <=1'b0;   
rm_N<=3'd0;
underflow_N<=1'b0;
res_is_zero_N <= 1'b0;
a_is_apox_zero_N <= 1'b0;



end
else if (clear[2]) begin 
    

   
mantissa_norm_N    <=23'd0;
exp_norm_N         <=8'd0;
sign_res_N         <=1'b0;    
grs_N               <=24'd0       ;
  NaN_N             <=1'b0;
 inf1_N             <=1'b0;
 inf2_N             <=1'b0;
sign1_N             <=1'b0;
sign2_N             <=1'b0;
rm_N<=3'd0;
underflow_N<=1'b0;
res_is_zero_N <= 1'b0;
a_is_apox_zero_N <= 1'b0;
end 
else if(en) begin 

mantissa_norm_N     <=mantissa_norm;
exp_norm_N          <=exp_norm     ;
sign_res_N          <=sign_res_AS     ;
grs_N               <=grs_AS       ;
  NaN_N             <=  NaN_AS;
 inf1_N             <= inf1_AS;
 inf2_N             <= inf2_AS;
sign1_N             <=sign1_AS;
sign2_N             <=sign2_AS;
rm_N<=rm_AS;
underflow_N<=underflow;
res_is_zero_N <= res_is_zero_AS;
a_is_apox_zero_N <= a_is_apox_zero_AS;


end

end


logic [31:0] result_temp;
 round_fp_r4 round_stage(
 
        //inputs
        .NaN            (NaN_N),
        .inf1           (inf1_N),
        .inf2           (inf2_N),
        .sign1          (sign1_N),
        .sign2          (sign2_N),
        .a_is_apox_zero (a_is_apox_zero_N),
        .grs            (grs_N),
        .rm             (rm_N),
//        .rm             (~rm_N),    // negate it if you're using RISC-V32 toolchain (like gcc-toolchain or gnu-toolchain)
        .exp_norm       (exp_norm_N),
        .mantissa_norm  (mantissa_norm_N),
        .sign_res       (sign_res_N),
        .underflow       (underflow_N),
        .res_is_zero    (res_is_zero_N),

       //outputs
        .result         (result_temp)
    );

logic exception;
assign exception = NaN_N | inf1_N | inf2_N ;;

assign result = (res_is_zero_N & ~exception) ? 
                ((rm_N == 3'b010) ?  32'h80000000 : 32'b0) : result_temp; // if result is zero, return 0, else return the computed result

endmodule