module sram_32k_wrapper (
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



logic  [31:0] Q;
logic  [12:0] ADR;
logic  [31:0] D;
logic  [31:0] WEM;
logic WE;
logic OE;
wire ME;
logic CLK;
logic  [3:0] RM;




assign D = dat_i;
assign ADR = adr_i[14:2];
assign dat_o = Q;
assign WEM = {{8{sel_i[3]}}, {8{sel_i[2]}}, {8{sel_i[1]}}, {8{sel_i[0]}}};
assign WE =  we_i & stb_i & cyc_i; 
assign ME  = ~rst_i; // stb_i & cyc_i
assign CLK = clk_i;
assign RM[3] = 1'b1; // recommended value by synopsys
assign RM[2] = 1'b0; // recommended value by synopsys
assign RM[1] = 1'b0; // recommended value by synopsys
assign RM[0] = 1'b0; // recommended value by synopsys

`ifdef PD_BUILD
  tsmc_32k_sq tsmc_32k_inst ( 
`else
  tsmc_32k tsmc_32k_inst ( 
`endif
    .Q, 
    .ADR, 
    .D, 
    .WEM, 
    .WE, 
    .OE, 
    .ME, 
    .CLK, 
    .RM);


always_ff @(posedge clk_i, posedge rst_i) begin 
  if(rst_i) ack_o <= 'b0;
  else ack_o <= stb_i & cyc_i & ~ack_o;
end


always_ff @(posedge clk_i, posedge rst_i) begin 
  if(rst_i) OE <= 'b0;
  else      OE <= ~we_i & stb_i & cyc_i;
end

endmodule : sram_32k_wrapper




module sram_8k_wrapper (
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



logic  [31:0] Q;
logic  [10:0] ADR;
logic  [31:0] D;
logic  [31:0] WEM;
logic WE;
logic OE;
logic ME;
logic CLK;
logic  [3:0] RM;




assign D = dat_i;
assign ADR = adr_i[12:2];
assign dat_o = Q;
assign WEM = {{8{sel_i[3]}}, {8{sel_i[2]}}, {8{sel_i[1]}}, {8{sel_i[0]}}};
assign WE =  we_i & stb_i & cyc_i; 
assign ME  = ~rst_i; // stb_i & cyc_i
assign CLK = clk_i;
assign RM[3] = 1'b1; // recommended value by synopsys
assign RM[2] = 1'b1; // recommended value by synopsys
assign RM[1] = 1'b0; // recommended value by synopsys
assign RM[0] = 1'b1; // recommended value by synopsys


tsmc_8k tsmc_8k_inst ( 
    .Q, 
    .ADR, 
    .D, 
    .WEM, 
    .WE, 
    .OE, 
    .ME, 
    .CLK, 
    .RM);

always_ff @(posedge clk_i, posedge rst_i) begin 
  if(rst_i) ack_o <= 'b0;
  else ack_o <= stb_i & cyc_i & ~ack_o;
end

always_ff @(posedge clk_i, posedge rst_i) begin 
  if(rst_i) OE <= 'b0;
  else      OE <= ~we_i & stb_i & cyc_i;
end

endmodule : sram_8k_wrapper



module rom_8k_wrapper (
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



logic  [31:0] Q;
logic  [10:0] ADR;
logic OE;
wire  ME;
logic CLK;


assign ADR = adr_i[12:2];
assign dat_o = Q;
assign ME  = ~rst_i; // stb_i & cyc_i
assign CLK = clk_i;

always_ff @(posedge clk_i, posedge rst_i) begin 
  if(rst_i) OE <= 'b0;
  else      OE <= ~we_i & stb_i & cyc_i;
end

tsmc_rom_8kbyte tsmc_rom_8k_inst ( 
    .Q, 
    .ADR, 
    .OE, 
    .ME, 
    .CLK
    );


always_ff @(posedge clk_i, posedge rst_i) begin 
  if(rst_i) ack_o <= 'b0;
  else ack_o <= stb_i & cyc_i & ~ack_o;
end


endmodule : rom_8k_wrapper


