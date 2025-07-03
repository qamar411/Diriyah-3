module reg_file #(
    parameter DEPTH = 32,
    parameter WIDTH = 32
) (
    input logic clk, 
    input logic reset_n, 
    input logic reg_write, 
    input logic [4:0] raddr1, 
    input logic [4:0] raddr2,
    input logic [4:0] waddr, 
    input logic [31:0] wdata,
    output logic [31:0] rdata1,
    output logic [31:0] rdata2,
    
    // for change type of reg_file instance
    input logic FP_type,

    input logic [4:0] raddr3,
    output logic [31:0] rdata3
);

    logic [WIDTH - 1:0] reg_file [DEPTH -1 :0];
    int i;
    always @(posedge clk, negedge reset_n)
    begin 
        if(~reset_n) begin 
            for(i = 0; i<DEPTH; i = i+1)
            begin 
                reg_file[i] <= 0;
            end
        end else if (reg_write & ((|waddr) | FP_type) ) // can't write on x0, unless it's FP_reg_file type)
        begin 
            reg_file[waddr] <= wdata;
        end 
    end
    
    assign rdata1 = reg_file[raddr1];
    assign rdata2 = reg_file[raddr2];
    assign rdata3 = reg_file[raddr3];
    
    
endmodule 
