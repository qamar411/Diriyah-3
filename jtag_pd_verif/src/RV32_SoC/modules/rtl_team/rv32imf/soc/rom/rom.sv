module rom (
  // 32bit WISHBONE bus slave interface
  input  wire        clk_i,         // clock
  input  wire        rst_i,         // reset (synchronous active high)
  input  wire        cyc_i,         // cycle
  input  wire        stb_i,         // strobe
  input  wire [14:2] adr_i,         // address
  input  wire        we_i,          // write enable
  input  wire [3:0]  sel_i,
  input  wire [31:0] dat_i,         // data input
  output reg  [31:0] dat_o,         // data output
  output reg         ack_o          // normal bus termination

);


    logic [14:12] addr;
    logic [31:0]  inst;
    logic [31:0]  rom  [0:255];

    logic wb_acc;

    assign wb_acc = cyc_i & stb_i;

    always_ff @(posedge clk_i) ack_o = wb_acc & ~ack_o; // delayed acknowledge


    assign addr = adr_i;

    initial begin
        `ifdef tracer
            $readmemh("tb/interrupt_test/inst.hex", rom);
        `else 
            $readmemh("rom.mem", rom);
        `endif
    end
    assign inst = rom[addr >> 2];


    assign dat_o = inst;





endmodule