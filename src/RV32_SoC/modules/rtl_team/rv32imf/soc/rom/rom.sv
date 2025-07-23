`ifndef PD_BUILD
module rom (
  // 32bit WISHBONE bus slave interface
  input  wire        clk_i,         // clock
  input  wire        rst_i,         // reset (synchronous active high)
  input  wire        cyc_i,         // cycle
  input  wire        stb_i,         // strobe
  input  wire [12:2] adr_i,         // address
  input  wire        we_i,          // write enable
  input  wire [3:0]  sel_i,
  input  wire [31:0] dat_i,         // data input
  output reg  [31:0] dat_o,         // data output
  output reg         ack_o          // normal bus termination

);


    logic [10:0] addr;
    logic [31:0]  inst; 
    logic [31:0]  rom  [0:2047]; // 8kb / 32bit = 2048 words

    logic wb_acc;

    assign wb_acc = cyc_i & stb_i;

    always_ff @(posedge clk_i, posedge rst_i) begin 
        if(rst_i) begin 
                ack_o <= 1'b0;
        end else    ack_o = wb_acc & ~ack_o; // delayed acknowledge
    end


    assign addr = adr_i;

    initial begin
        `ifdef tracer
            $readmemh("tb/interrupt_test/inst.hex", rom);
        `else 
            $readmemh("rom.mem", rom);
        `endif
    end
    assign inst = rom[addr];


    always_ff @(posedge clk_i, posedge rst_i) begin 
        if(rst_i) begin 
            dat_o <= 'b0;
        end else begin 
            dat_o <= inst;
        end
    end

endmodule

`endif