
module rv32i_soc_fpag_top (
    input logic CLK100MHZ, 
    input logic CPU_RESETN, 
    
    // FPGA core signals 
    output logic        o_uart_tx,
    input  logic        i_uart_rx,
    output logic        o_flash_cs_n,
    output logic        o_flash_mosi,
    input  logic        i_flash_miso,

    // ADDED FOR SEVEN SEGMENT DISPLAY
    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    output wire [7:0] AN,

    input  logic [15:0] SW,
    output logic [15:0] LED

    `ifndef USE_FPGA_JTAG
        , 
        input logic tck_i,
        input logic tdi_i,
        input logic tms_i,
        output logic tdo_o
    `endif
);  

    parameter DMEM_DEPTH = 4096;
    parameter IMEM_DEPTH = 16384*4;
    parameter NO_OF_GPIO_PINS = 32; 


    
    logic        o_flash_sclk;
    STARTUPE2 STARTUPE2
        (
        .CFGCLK    (),
        .CFGMCLK   (),
        .EOS       (),
        .PREQ      (),
        .CLK       (1'b0),
        .GSR       (1'b0),
        .GTS       (1'b0),
        .KEYCLEARB (1'b1),
        .PACK      (1'b0),
        .USRCCLKO  (o_flash_sclk),
        .USRCCLKTS (1'b0),
        .USRDONEO  (1'b1),
        .USRDONETS (1'b0));

    // soc core instance 

    // spi signals here 
         // serial clock output
         // slave select (active low)
         // MasterOut SlaveIN
         // MasterIn SlaveOut    

    // uart signals


    // gpio signals

    // wire [31:0]   io_data;
    // assign io_data[31:16] = SW;
    // assign LED = io_data[15:0];

    logic reset_n;
    logic clk;

    assign reset_n = CPU_RESETN;

    clk_div_by_2 gen_core_clk (
        .clk_i(CLK100MHZ),
        .clk_o(clk),
        .reset_n(CPU_RESETN)
    );


    // GPIO - Leds and Switches
    wire [NO_OF_GPIO_PINS - 1:0] en_gpio;
    wire [NO_OF_GPIO_PINS - 1:0] i_gpio;
    wire [NO_OF_GPIO_PINS - 1:0] o_gpio;
    wire [NO_OF_GPIO_PINS - 1:0] io_data;
    wire [NO_OF_GPIO_PINS - 1:0] oen_gpio;

    assign oen_gpio = 32'h00FFFF;

    assign i_gpio = {SW[15:0],16'dz};

       assign LED    = o_gpio[15:0];

    
    rv32i_soc #(
        .DMEM_DEPTH(DMEM_DEPTH),
        .IMEM_DEPTH(IMEM_DEPTH),
        .NO_OF_GPIO_PINS(NO_OF_GPIO_PINS)
    ) soc_inst (
        .o_uart1_tx(o_uart_tx),
        .i_uart1_rx(i_uart_rx),
        .*
    );

    // ADDED FOR THE SEVEN SEGMENT DISPLAY 
    // Seven segments Controller
    wire [6:0] Seg;
    wire [3:0] digits[0:7];
    wire [31:0] display_reg;


     assign display_reg = soc_inst.rv32i_core_inst.data_path_inst.reg_file_inst.reg_file[10];

    assign digits[0] = display_reg[3 :0 ];
    assign digits[1] = display_reg[7 :4 ];
    assign digits[2] = display_reg[11:8 ];
    assign digits[3] = display_reg[15:12];
    assign digits[4] = display_reg[19:16];
    assign digits[5] = display_reg[23:20];
    assign digits[6] = display_reg[27:24];
    assign digits[7] = display_reg[31:28];


    sev_seg_controller ssc(
        .clk(clk),
        .resetn(reset_n),
        .digits(digits),
        .Seg(Seg),
        .AN(AN)
    );


    assign CA = Seg[0];
    assign CB = Seg[1];
    assign CC = Seg[2];
    assign CD = Seg[3];
    assign CE = Seg[4];
    assign CF = Seg[5];
    assign CG = Seg[6];
    assign DP = 1'b1; // turn off the dot point on seven segs


    assign o_flash_mosi = o_gpio[8];
    assign o_flash_sclk = o_gpio[10];
    assign o_flash_cs_n = o_gpio[11];
    assign i_gpio[9]    = i_flash_miso;

    logic [7:0] spsr;
    assign spsr[7]   = soc_inst.spi1.spif;
    assign spsr[6]   = soc_inst.spi1.wcol;
    assign spsr[5:4] = 2'b00;
    assign spsr[3]   = soc_inst.spi1.wffull;
    assign spsr[2]   = soc_inst.spi1.wfempty;
    assign spsr[1]   = soc_inst.spi1.rffull;
    assign spsr[0]   = soc_inst.spi1.rfempty;
     

    // // for jtag debugging 
    // ila_0_spi ila_0_spi_inst  (
    //     .clk(clk),
    //     .probe0 (spsr),
    //     .probe1 (spsr),
    //     .probe2 (spsr),
    //     .probe3 (spsr),
    //     .probe4 (spsr),
    //     .probe5 (spsr),
    //     .probe6 (tdi_i),
    //     .probe7 (tck_i),
    //     .probe8 (tms_i),
    //     .probe9 (tdo_o)
    // );





endmodule : rv32i_soc_fpag_top

module clk_div_by_2 (
    input logic reset_n,
    input logic clk_i, 
    output logic clk_o
);
    always @(posedge clk_i, negedge reset_n)
    begin 
        if(~reset_n)    clk_o <= 0;
        else            clk_o <= ~clk_o;
    end
endmodule 