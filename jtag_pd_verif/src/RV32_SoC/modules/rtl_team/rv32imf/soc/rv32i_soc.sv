`ifndef SOC
    `ifndef PD_BUILD
        `ifdef VCS_SIM
            `include "RV32_SoC/modules/rtl_team/rv32imf/pads/tpz018nv_270a/tpz018nv.v"
            `include "RV32_SoC/modules/rtl_team/rv32imf/soc/sram/tsmc_32k_rtl.v"
            `include "RV32_SoC/modules/rtl_team/rv32imf/soc/sram/tsmc_8k_rtl.v"
            `include "RV32_SoC/modules/rtl_team/rv32imf/soc/rom/tsmc_rom_8kbyte_rtl.v"
            `include "RV32_SoC/modules/rtl_team/rv32imf/S25fl128s/model/s25fl128s.v"
        `endif
    `endif
`endif

// Added a comment
module rv32i_soc #(
    parameter DMEM_DEPTH = 8*256,
    parameter IMEM_DEPTH = 32*256,  
    parameter NO_OF_GPIO_PINS = 32,
    parameter NO_OF_SHARED_PINS = 15
) (
    input logic clk, 
    input logic reset_n,
        
    // gpio signals
    input  logic [NO_OF_GPIO_PINS - 1:0] i_gpio, 
    output logic [NO_OF_GPIO_PINS - 1:0] o_gpio,
    output logic [NO_OF_GPIO_PINS - 1:0] en_gpio,
    
    // uart signal
    output logic        o_uart1_tx,
    input logic         i_uart1_rx
    
`ifndef USE_FPGA_JTAG
    , 
    input logic tck_i,
    input logic tdi_i,
    input logic tms_i,
    output logic tdo_o
`endif
);


    // spi signals to the spi-flash
    logic       o_flash_sclk;     // serial clock output
    logic [1:0] o_flash_cs_n;     // slave select (active low)
    logic       o_flash_mosi;     // MasterOut SlaveIN
    logic       i_flash_miso;     // MasterIn SlaveOut 

    // spi signals to the spi-2
    logic       o_sclk;     // serial clock output
    logic [1:0] o_cs_n;     // slave select (active low)
    logic       o_mosi;     // MasterOut SlaveIN
    logic       i_miso;     // MasterIn SlaveOut    


    // i2c signals 
    logic         i_scl;
    logic        o_scl;
    logic        o_scl_oen;
    logic         i_sda;
    logic        o_sda;
    logic        o_sda_oen;

    //  ptc signals 
    logic pwm_pad_o;

    // uart 2 signals 
    logic        o_uart2_tx;
    logic        i_uart2_rx;

    logic [NO_OF_GPIO_PINS - 1:0] i_gpio_;
    logic [NO_OF_GPIO_PINS - 1:0] o_gpio_;
    logic [NO_OF_GPIO_PINS - 1:0] en_gpio_;

    // ============================================
    //                    IO MUX
    // ============================================   
       
    logic [NO_OF_SHARED_PINS- 1:0] io_sel; 
    logic pwm_padoen_o;

    io_mux #(
        .NO_OF_SHARED_PINS  (NO_OF_SHARED_PINS),
        .NO_OF_GPIO_PINS    (NO_OF_GPIO_PINS)
    ) io_mux_instance (
        // Control
        .io_sel           (io_sel),

        // SPI Flash
        .o_flash_sclk     (o_flash_sclk),
        .o_flash_cs_n     (o_flash_cs_n),
        .o_flash_mosi     (o_flash_mosi),
        .i_flash_miso     (i_flash_miso),

        // SPI2
        .o_sclk           (o_sclk),
        .o_cs_n           (o_cs_n),
        .o_mosi           (o_mosi),
        .i_miso           (i_miso),

        // I2C
        .i_scl            (i_scl),
        .o_scl            (o_scl),
        .o_scl_oen        (o_scl_oen),
        .i_sda            (i_sda),
        .o_sda            (o_sda),
        .o_sda_oen        (o_sda_oen),

        // PTC
        .pwm_pad_o        (pwm_pad_o),
        .pwm_padoen_o     (pwm_padoen_o),

        // UART 2
        .o_uart2_tx       (o_uart2_tx),
        .i_uart2_rx       (i_uart2_rx),

        // GPIO core <-> pad mux
        .i_gpio_          (i_gpio_),
        .o_gpio_          (o_gpio_),
        .en_gpio_         (en_gpio_),

        // GPIO <-> actual pads
        .i_gpio           (i_gpio),
        .o_gpio           (o_gpio),
        .en_gpio          (en_gpio)
    );




    // Debug Signals 
    logic core_resumeack;
    logic core_running;
    logic core_halted;

    logic dbg_haltreq;
    logic dbg_resumereq;
    logic dbg_ndmreset;

    logic        dbg_ar_en;
    logic        dbg_ar_wr;
    logic [15:0] dbg_ar_ad;
    logic        dbg_ar_done;
    logic [31:0] dbg_ar_di;
    logic [31:0] dbg_ar_do;

    logic        dbg_am_en;
    logic        dbg_am_wr;
    logic [2:0]  dbg_am_st;
    logic [31:0] dbg_am_ad;
    logic [31:0] dbg_am_di;
    logic [31:0] dbg_am_do;
    logic        dbg_am_done;


    // Memory bus signals
    logic [31:0] mem_addr_mem;
    logic [31:0] mem_wdata_mem; 
    logic        mem_write_mem;
    logic [2:0]  mem_op_mem;
    logic [31:0] mem_rdata_mem;
    logic        mem_read_mem;
    logic        mem_ack_mem;
    logic        mem_err_mem;

    logic stall_pipl;
    logic [31:0] current_pc, inst;
    logic sel_boot_rom, sel_boot_rom_ff;

    logic [31:0] imem_addr;


    logic if_id_reg_en;

    logic timer_irq;
    logic ptc_irq;
    logic spi_flash_irq;
    logic spi2_irq;
    logic i2c_irq;
    logic uart1_irq;
    logic uart2_irq;
    logic gpio_irq;
    logic external_irq; 
    // to be assigned a value zero until PLIC is added
    
    
    // ============================================
    //              RISC-V Processor Core
    // ============================================ 
    rv32i #(
        .DMEM_DEPTH(DMEM_DEPTH),
        .IMEM_DEPTH(IMEM_DEPTH)
    ) rv32i_core_inst (
        .*
    );


    // ============================================
    //       Wishbone Controller & Interconnect
    // ============================================   

    wire   wb_clk;
    wire   wb_rst;
    assign wb_clk = clk;
    assign wb_rst = ~reset_n;

    // IO
    wire [31:0] wb_m2s_io_adr;
    wire [31:0] wb_m2s_io_dat;
    wire  [3:0] wb_m2s_io_sel;
    wire        wb_m2s_io_we;
    wire        wb_m2s_io_cyc;
    wire        wb_m2s_io_stb;
    wire [31:0] wb_s2m_io_dat;
    wire        wb_s2m_io_ack;
    wire        wb_s2m_io_err;
    wire        wb_s2m_io_rty;

    // SPI FLASH
    wire [31:0] wb_m2s_spi_flash_adr;
    wire [31:0] wb_m2s_spi_flash_dat;
    wire  [3:0] wb_m2s_spi_flash_sel;
    wire        wb_m2s_spi_flash_we;
    wire        wb_m2s_spi_flash_cyc;
    wire        wb_m2s_spi_flash_stb;
    wire [31:0] wb_s2m_spi_flash_dat;
    wire        wb_s2m_spi_flash_ack;
    wire        wb_s2m_spi_flash_err;
    wire        wb_s2m_spi_flash_rty;
    
    // SPI 2
    wire [31:0] wb_m2s_spi_adr;
    wire [31:0] wb_m2s_spi_dat;
    wire  [3:0] wb_m2s_spi_sel;
    wire        wb_m2s_spi_we;
    wire        wb_m2s_spi_cyc;
    wire        wb_m2s_spi_stb;
    wire [31:0] wb_s2m_spi_dat;
    wire        wb_s2m_spi_ack;
    wire        wb_s2m_spi_err;
    wire        wb_s2m_spi_rty;

    // UART
    wire [31:0] wb_m2s_uart1_adr;
    wire [31:0] wb_m2s_uart1_dat;
    wire  [3:0] wb_m2s_uart1_sel;
    wire        wb_m2s_uart1_we;
    wire        wb_m2s_uart1_cyc;
    wire        wb_m2s_uart1_stb;
    wire [31:0] wb_s2m_uart1_dat;
    wire        wb_s2m_uart1_ack;
    wire        wb_s2m_uart1_err;
    wire        wb_s2m_uart1_rty;

    // UART2
    wire [31:0] wb_m2s_uart2_adr;
    wire [31:0] wb_m2s_uart2_dat;
    wire  [3:0] wb_m2s_uart2_sel;
    wire        wb_m2s_uart2_we;
    wire        wb_m2s_uart2_cyc;
    wire        wb_m2s_uart2_stb;
    wire [31:0] wb_s2m_uart2_dat;
    wire        wb_s2m_uart2_ack;
    wire        wb_s2m_uart2_err;
    wire        wb_s2m_uart2_rty;



    // GPIO
    wire [31:0] wb_m2s_gpio_adr;
    wire [31:0] wb_m2s_gpio_dat;
    wire  [3:0] wb_m2s_gpio_sel;
    wire        wb_m2s_gpio_we;
    wire        wb_m2s_gpio_cyc;
    wire        wb_m2s_gpio_stb;
    wire [31:0] wb_s2m_gpio_dat;
    wire        wb_s2m_gpio_ack;
    wire        wb_s2m_gpio_err;
    wire        wb_s2m_gpio_rty;

    // I2C
    wire [31:0] wb_m2s_i2c_adr;
    wire [31:0] wb_m2s_i2c_dat;
    wire  [3:0] wb_m2s_i2c_sel;
    wire        wb_m2s_i2c_we;
    wire        wb_m2s_i2c_cyc;
    wire        wb_m2s_i2c_stb;
    wire [31:0] wb_s2m_i2c_dat;
    wire        wb_s2m_i2c_ack;
    wire        wb_s2m_i2c_err;
    wire        wb_s2m_i2c_rty;


    // IMEM
    wire [31:0] wb_m2s_imem_adr;
    wire [31:0] wb_m2s_imem_dat;
    wire  [3:0] wb_m2s_imem_sel;
    wire        wb_m2s_imem_we;
    wire        wb_m2s_imem_cyc;
    wire        wb_m2s_imem_stb;
    wire [31:0] wb_s2m_imem_dat;
    wire        wb_s2m_imem_ack;
    wire        wb_s2m_imem_err;
    wire        wb_s2m_imem_rty;

    // BOOT ROM
    wire [31:0] wb_m2s_rom_adr;
    wire [31:0] wb_m2s_rom_dat;
    wire  [3:0] wb_m2s_rom_sel;
    wire        wb_m2s_rom_we;
    wire        wb_m2s_rom_cyc;
    wire        wb_m2s_rom_stb;
    wire [31:0] wb_s2m_rom_dat;
    wire        wb_s2m_rom_ack;
    wire        wb_s2m_rom_err;
    wire        wb_s2m_rom_rty;


    // DMEM
    wire [31:0] wb_m2s_dmem_adr;
    wire [31:0] wb_m2s_dmem_dat;
    wire  [3:0] wb_m2s_dmem_sel;
    wire        wb_m2s_dmem_we;
    wire        wb_m2s_dmem_cyc;
    wire        wb_m2s_dmem_stb;
    wire [31:0] wb_s2m_dmem_dat;
    wire        wb_s2m_dmem_ack;
    wire        wb_s2m_dmem_err;
    wire        wb_s2m_dmem_rty;

    // PTC
    wire [31:0] wb_m2s_ptc_adr;
    wire [31:0] wb_m2s_ptc_dat;
    wire  [3:0] wb_m2s_ptc_sel;
    wire        wb_m2s_ptc_we;
    wire        wb_m2s_ptc_cyc;
    wire        wb_m2s_ptc_stb;
    wire [31:0] wb_s2m_ptc_dat;
    wire        wb_s2m_ptc_ack;
    wire        wb_s2m_ptc_err;
    wire        wb_s2m_ptc_rty;


    wishbone_controller wishbone_master (
        .clk        (clk),
        .rst        (~reset_n),

        .proc_addr  (mem_addr_mem),
        .proc_wdata (mem_wdata_mem),
        .proc_write (mem_write_mem),
        .proc_read  (mem_read_mem),
        .proc_op    (mem_op_mem),
        .proc_rdata (mem_rdata_mem),
        .proc_ack   (mem_ack_mem),
        .proc_stall_pipl(stall_pipl), // Stall pipeline if needed

        // memory access from the debug unit
        .core_halted(core_halted),
        .dbg_am_en_i	(dbg_am_en),
        .dbg_am_wr_i	(dbg_am_wr),
        .dbg_am_st_i	(dbg_am_st),
        .dbg_am_ad_i	(dbg_am_ad),
        .dbg_am_di_o	(dbg_am_di),
        .dbg_am_do_i	(dbg_am_do),
        .dbg_am_done_o	(dbg_am_done),

        .wb_adr_o   (wb_m2s_io_adr),     // Connect to the external Wishbone bus as required
        .wb_dat_o   (wb_m2s_io_dat),
        .wb_sel_o   (wb_m2s_io_sel),
        .wb_we_o    (wb_m2s_io_we ),
        .wb_cyc_o   (wb_m2s_io_cyc),
        .wb_stb_o   (wb_m2s_io_stb),
        .wb_dat_i   (wb_s2m_io_dat),  
        .wb_ack_i   (wb_s2m_io_ack),  
        .wb_err_i   (wb_s2m_io_err)
    );


    // wishbone interconnect, // later we should use interfaces to reduces number of lines
    wb_intercon wb_intercon0
   (.wb_clk_i           (wb_clk),
    .wb_rst_i           (wb_rst),
    .wb_io_adr_i        (wb_m2s_io_adr),
    .wb_io_dat_i        (wb_m2s_io_dat),
    .wb_io_sel_i        (wb_m2s_io_sel),
    .wb_io_we_i         (wb_m2s_io_we),
    .wb_io_cyc_i        (wb_m2s_io_cyc),
    .wb_io_stb_i        (wb_m2s_io_stb),
    .wb_io_dat_o        (wb_s2m_io_dat),
    .wb_io_ack_o        (wb_s2m_io_ack),
    .wb_io_err_o        (wb_s2m_io_err),
    .wb_io_rty_o        (wb_s2m_io_rty),

    .wb_spi_flash_adr_o (wb_m2s_spi_flash_adr),
    .wb_spi_flash_dat_o (wb_m2s_spi_flash_dat),
    .wb_spi_flash_sel_o (wb_m2s_spi_flash_sel),
    .wb_spi_flash_we_o  (wb_m2s_spi_flash_we),
    .wb_spi_flash_cyc_o (wb_m2s_spi_flash_cyc),
    .wb_spi_flash_stb_o (wb_m2s_spi_flash_stb),
    .wb_spi_flash_dat_i (wb_s2m_spi_flash_dat),
    .wb_spi_flash_ack_i (wb_s2m_spi_flash_ack),
    .wb_spi_flash_err_i (wb_s2m_spi_flash_err),
    .wb_spi_flash_rty_i (wb_s2m_spi_flash_rty),


// SPI 2
    .wb_spi_adr_o (wb_m2s_spi_adr),
    .wb_spi_dat_o (wb_m2s_spi_dat),
    .wb_spi_sel_o (wb_m2s_spi_sel),
    .wb_spi_we_o  (wb_m2s_spi_we),
    .wb_spi_cyc_o (wb_m2s_spi_cyc),
    .wb_spi_stb_o (wb_m2s_spi_stb),
    .wb_spi_dat_i (wb_s2m_spi_dat),
    .wb_spi_ack_i (wb_s2m_spi_ack),
    .wb_spi_err_i (wb_s2m_spi_err),
    .wb_spi_rty_i (wb_s2m_spi_rty),

    .wb_dmem_adr_o       (wb_m2s_dmem_adr),
    .wb_dmem_dat_o       (wb_m2s_dmem_dat),
    .wb_dmem_sel_o       (wb_m2s_dmem_sel),
    .wb_dmem_we_o        (wb_m2s_dmem_we),
    .wb_dmem_cyc_o       (wb_m2s_dmem_cyc),
    .wb_dmem_stb_o       (wb_m2s_dmem_stb),
    .wb_dmem_dat_i       (wb_s2m_dmem_dat),
    .wb_dmem_ack_i       (wb_s2m_dmem_ack),
    .wb_dmem_err_i       (wb_s2m_dmem_err),
    .wb_dmem_rty_i       (wb_s2m_dmem_rty),

    .wb_imem_adr_o       (wb_m2s_imem_adr),
    .wb_imem_dat_o       (wb_m2s_imem_dat),
    .wb_imem_sel_o       (wb_m2s_imem_sel),
    .wb_imem_we_o        (wb_m2s_imem_we),
    .wb_imem_cyc_o       (wb_m2s_imem_cyc),
    .wb_imem_stb_o       (wb_m2s_imem_stb),
    .wb_imem_dat_i       (wb_s2m_imem_dat),
    .wb_imem_ack_i       (wb_s2m_imem_ack),
    .wb_imem_err_i       (wb_s2m_imem_err),
    .wb_imem_rty_i       (wb_s2m_imem_rty),

// BOOT ROM
    .wb_rom_adr_o       (wb_m2s_rom_adr),
    .wb_rom_dat_o       (wb_m2s_rom_dat),
    .wb_rom_sel_o       (wb_m2s_rom_sel),
    .wb_rom_we_o        (wb_m2s_rom_we),
    .wb_rom_cyc_o       (wb_m2s_rom_cyc),
    .wb_rom_stb_o       (wb_m2s_rom_stb),
    .wb_rom_dat_i       (wb_s2m_rom_dat),
    .wb_rom_ack_i       (wb_s2m_rom_ack),
    .wb_rom_err_i       (wb_s2m_rom_err),
    .wb_rom_rty_i       (wb_s2m_rom_rty),

    .wb_uart_adr_o      (wb_m2s_uart1_adr),
    .wb_uart_dat_o      (wb_m2s_uart1_dat),
    .wb_uart_sel_o      (wb_m2s_uart1_sel),
    .wb_uart_we_o       (wb_m2s_uart1_we),
    .wb_uart_cyc_o      (wb_m2s_uart1_cyc),
    .wb_uart_stb_o      (wb_m2s_uart1_stb),
    .wb_uart_dat_i      (wb_s2m_uart1_dat),
    .wb_uart_ack_i      (wb_s2m_uart1_ack),
    .wb_uart_err_i      (wb_s2m_uart1_err),
    .wb_uart_rty_i      (wb_s2m_uart1_rty),


    .wb_uart2_adr_o      (wb_m2s_uart2_adr),
    .wb_uart2_dat_o      (wb_m2s_uart2_dat),
    .wb_uart2_sel_o      (wb_m2s_uart2_sel),
    .wb_uart2_we_o       (wb_m2s_uart2_we),
    .wb_uart2_cyc_o      (wb_m2s_uart2_cyc),
    .wb_uart2_stb_o      (wb_m2s_uart2_stb),
    .wb_uart2_dat_i      (wb_s2m_uart2_dat),
    .wb_uart2_ack_i      (wb_s2m_uart2_ack),
    .wb_uart2_err_i      (wb_s2m_uart2_err),
    .wb_uart2_rty_i      (wb_s2m_uart2_rty),

// GPIO
    .wb_gpio_adr_o      (wb_m2s_gpio_adr),
    .wb_gpio_dat_o      (wb_m2s_gpio_dat),
    .wb_gpio_sel_o      (wb_m2s_gpio_sel),
    .wb_gpio_we_o       (wb_m2s_gpio_we), 
    .wb_gpio_cyc_o      (wb_m2s_gpio_cyc),
    .wb_gpio_stb_o      (wb_m2s_gpio_stb),
    .wb_gpio_dat_i      (wb_s2m_gpio_dat),
    .wb_gpio_ack_i      (wb_s2m_gpio_ack),
    .wb_gpio_err_i      (wb_s2m_gpio_err),
    .wb_gpio_rty_i      (wb_s2m_gpio_rty), 

// I2C
    .wb_i2c_adr_o       (wb_m2s_i2c_adr),
    .wb_i2c_dat_o       (wb_m2s_i2c_dat),
    .wb_i2c_sel_o       (wb_m2s_i2c_sel),
    .wb_i2c_we_o        (wb_m2s_i2c_we), 
    .wb_i2c_cyc_o       (wb_m2s_i2c_cyc),
    .wb_i2c_stb_o       (wb_m2s_i2c_stb),
    .wb_i2c_dat_i       (wb_s2m_i2c_dat),
    .wb_i2c_ack_i       (wb_s2m_i2c_ack),
    .wb_i2c_err_i       (wb_s2m_i2c_err),
    .wb_i2c_rty_i       (wb_s2m_i2c_rty), 
    
// PTC
    .wb_ptc_adr_o       (wb_m2s_ptc_adr),
    .wb_ptc_dat_o       (wb_m2s_ptc_dat),
    .wb_ptc_sel_o       (wb_m2s_ptc_sel),
    .wb_ptc_we_o        (wb_m2s_ptc_we),
    .wb_ptc_cyc_o       (wb_m2s_ptc_cyc),
    .wb_ptc_stb_o       (wb_m2s_ptc_stb),
    .wb_ptc_dat_i       (wb_s2m_ptc_dat),
    .wb_ptc_ack_i       (wb_s2m_ptc_ack),
    .wb_ptc_err_i       (wb_s2m_ptc_err),
    .wb_ptc_rty_i       (wb_s2m_ptc_rty)

    );


    assign wb_s2m_imem_err  = 1'b0;
    assign wb_s2m_imem_rty  = 1'b0;
    assign wb_s2m_dmem_err  = 1'b0;
    assign wb_s2m_dmem_rty  = 1'b0;

    // ============================================
    //                  SPI Flash
    // ============================================   

   wire [7:0] 		       spi_rdt;
   assign wb_s2m_spi_flash_dat = {24'd0,spi_rdt};
   simple_spi spi1
     (// Wishbone slave interface
      .clk_i  (clk),
      .rst_i  (wb_rst),
      .adr_i  (wb_m2s_spi_flash_adr[4:2]),
      .dat_i  (wb_m2s_spi_flash_dat[7:0]),
      .we_i   (wb_m2s_spi_flash_we),
      .cyc_i  (wb_m2s_spi_flash_cyc),
      .stb_i  (wb_m2s_spi_flash_stb),
      .dat_o  (spi_rdt),
      .ack_o  (wb_s2m_spi_flash_ack),
      .inta_o (spi_flash_irq),
      // SPI interface
      .sck_o  (o_flash_sclk),
      .ss_o   (o_flash_cs_n),
      .mosi_o (o_flash_mosi),
      .miso_i (i_flash_miso));
   
   assign wb_s2m_spi_flash_err = 1'b0;
   assign wb_s2m_spi_flash_rty = 1'b0;


    // ============================================
    //                  SPI 2
    // ============================================   

   wire [7:0] 		       spi_rdt_2;
   assign wb_s2m_spi_dat = {24'd0,spi_rdt_2};
   simple_spi spi2
     (// Wishbone slave interface
      .clk_i  (clk),
      .rst_i  (wb_rst),
      .adr_i  (wb_m2s_spi_adr[4:2]),
      .dat_i  (wb_m2s_spi_dat[7:0]),
      .we_i   (wb_m2s_spi_we),
      .cyc_i  (wb_m2s_spi_cyc),
      .stb_i  (wb_m2s_spi_stb),
      .dat_o  (spi_rdt_2),
      .ack_o  (wb_s2m_spi_ack),
      .inta_o (spi2_irq),
      // SPI interface
      .sck_o  (o_sclk),
      .ss_o   (o_cs_n),
      .mosi_o (o_mosi),
      .miso_i (i_miso));
   
   assign wb_s2m_spi_err = 1'b0;
   assign wb_s2m_spi_rty = 1'b0;



    // ============================================
    //                  UART 1
    // ============================================  

   wire [7:0] 		       uart1_rdt;
   assign wb_s2m_uart1_dat = {24'd0, uart1_rdt};
   assign wb_s2m_uart1_err = 1'b0;
   assign wb_s2m_uart1_rty = 1'b0;

   uart_top uart16550_0
     (// Wishbone slave interface

      .wb_clk_i	(clk),
      .wb_rst_i	(wb_rst),
      .wb_adr_i	(wb_m2s_uart1_adr[4:2]),
      .wb_dat_i	(wb_m2s_uart1_dat[7:0]),
      .wb_we_i	(wb_m2s_uart1_we),
      .wb_cyc_i	(wb_m2s_uart1_cyc),
      .wb_stb_i	(wb_m2s_uart1_stb),
      .wb_dat_o	(uart1_rdt),
      .wb_ack_o	(wb_s2m_uart1_ack),

      // Outputs
      .int_o     (uart1_irq),
      .stx_pad_o (o_uart1_tx),
      .rts_pad_o (), // intentionally left unconnected
      .dtr_pad_o (), // intentionally left unconnected

      // Inputs
      .srx_pad_i (i_uart1_rx),
      .cts_pad_i (1'b0),
      .dsr_pad_i (1'b0),
      .ri_pad_i  (1'b0),
      .dcd_pad_i (1'b0));


    // ============================================
    //                  UART 2
    // ============================================  

   wire [7:0] 		       uart2_rdt;
   assign wb_s2m_uart2_dat = {24'd0, uart2_rdt};
   assign wb_s2m_uart2_err = 1'b0;
   assign wb_s2m_uart2_rty = 1'b0;

   uart_top uart16550_1
     (// Wishbone slave interface

      .wb_clk_i	(clk),
      .wb_rst_i	(wb_rst),
      .wb_adr_i	(wb_m2s_uart2_adr[4:2]),
      .wb_dat_i	(wb_m2s_uart2_dat[7:0]),
      .wb_we_i	(wb_m2s_uart2_we),
      .wb_cyc_i	(wb_m2s_uart2_cyc),
      .wb_stb_i	(wb_m2s_uart2_stb),
      .wb_dat_o	(uart2_rdt),
      .wb_ack_o	(wb_s2m_uart2_ack),

      // Outputs
      .int_o     (uart2_irq),
      .stx_pad_o (o_uart2_tx),
      .rts_pad_o (), // intentionally left unconnected
      .dtr_pad_o (), // intentionally left unconnected

      // Inputs
      .srx_pad_i (i_uart2_rx),
      .cts_pad_i (1'b0),
      .dsr_pad_i (1'b0),
      .ri_pad_i  (1'b0),
      .dcd_pad_i (1'b0));

    // ============================================
    //                  GPIO
    // ============================================  

   gpio_top #(
    .NO_OF_GPIO_PINS(NO_OF_GPIO_PINS),
    .NO_OF_SHARED_PINS(NO_OF_SHARED_PINS)
   )gpio_module (
        .wb_clk_i     (clk), 
        .wb_rst_i     (wb_rst), 
        .wb_cyc_i     (wb_m2s_gpio_cyc), 
        .wb_adr_i     ({wb_m2s_gpio_adr[4:2],2'b0}), 
        .wb_dat_i     (wb_m2s_gpio_dat), 
        .wb_sel_i     (wb_m2s_gpio_sel),
        .wb_we_i      (wb_m2s_gpio_we), 
        .wb_stb_i     (wb_m2s_gpio_stb), 
        .wb_dat_o     (wb_s2m_gpio_dat),
        .wb_ack_o     (wb_s2m_gpio_ack), 
        .wb_err_o     (wb_s2m_gpio_err),
        .wb_inta_o    (gpio_irq),
        // gpio signals 
        .i_gpio(i_gpio_),
        .o_gpio(o_gpio_),
        .en_gpio(en_gpio_),
        .io_sel(io_sel)
        );
    assign wb_s2m_gpio_rty = 1'b0;

    assign wb_s2m_i2c_dat[31:8] = 'h0;
    i2c_master_top  i2c_master_inst (
        .wb_clk_i     (clk), 
        .wb_rst_i     (1'b0), 
        .arst_i       (reset_n),
        .wb_cyc_i     (wb_m2s_i2c_cyc), 
        .wb_adr_i      ({wb_m2s_i2c_adr[4:2]}), 
        .wb_dat_i     (wb_m2s_i2c_dat[7:0]), 
        .wb_we_i      (wb_m2s_i2c_we), 
        .wb_stb_i     (wb_m2s_i2c_stb), 
        .wb_dat_o     (wb_s2m_i2c_dat[7:0]),
        .wb_ack_o     (wb_s2m_i2c_ack), 
        .wb_inta_o    (i2c_irq),
        // i2c signals 
        .scl_pad_i (i_scl),
        .scl_pad_o (o_scl),
        .scl_padoen_o (o_scl_oen),
        .sda_pad_i (i_sda),
        .sda_pad_o (o_sda),
        .sda_padoen_o (o_sda_oen)
        );
        assign wb_s2m_i2c_err = 1'b0;
        assign wb_s2m_i2c_rty = 1'b0;


    // ============================================
    //            SRAM Memory Instances
    // ============================================    


`ifdef USE_SRAM
    sram_8k_wrapper data_mem_inst (
`elsif PD_BUILD
    sram_8k_wrapper data_mem_inst (
`else 
    data_mem #(
        .DEPTH(DMEM_DEPTH)
    ) data_mem_inst (
`endif
        .clk_i       (clk            ),
        .rst_i       (wb_rst         ),
        .cyc_i       (wb_m2s_dmem_cyc), 
        .stb_i       (wb_m2s_dmem_stb),
`ifdef USE_SRAM
        .adr_i       (wb_m2s_dmem_adr[12:2]),
`elsif PD_BUILD
        .adr_i       (wb_m2s_dmem_adr[12:2]),
`else
        .adr_i       (wb_m2s_dmem_adr),
`endif
        .we_i        (wb_m2s_dmem_we ),
        .sel_i       (wb_m2s_dmem_sel),
        .dat_i       (wb_m2s_dmem_dat),
        .dat_o       (wb_s2m_dmem_dat),
        .ack_o       (wb_s2m_dmem_ack)
    );



logic [31:0] imem_inst;

assign imem_addr = (sel_boot_rom | core_halted) ? wb_m2s_imem_adr: current_pc;
`ifdef USE_SRAM
    sram_32k_wrapper inst_mem_inst (
`elsif PD_BUILD
    sram_32k_wrapper inst_mem_inst (
`else 
    data_mem #(
        .DEPTH(IMEM_DEPTH)
    ) inst_mem_inst (
`endif
        .clk_i       (clk            ),
        .rst_i       (wb_rst         ),
        .cyc_i       ((sel_boot_rom | core_halted) ?  wb_m2s_imem_cyc : 1'b1), 
        .stb_i       ((sel_boot_rom | core_halted) ?  wb_m2s_imem_stb : 1'b1),
`ifdef USE_SRAM
        .adr_i       (imem_addr[14:2]),
`elsif PD_BUILD
        .adr_i       (imem_addr[14:2]),
`else
        .adr_i       (imem_addr),
`endif
        .we_i        ((sel_boot_rom | core_halted) & wb_m2s_imem_we),
        .sel_i       (wb_m2s_imem_sel),
        .dat_i       (wb_m2s_imem_dat),
        .dat_o       (wb_s2m_imem_dat),
        .ack_o       (wb_s2m_imem_ack)
    );

    assign imem_inst = wb_s2m_imem_dat;


    // ============================================
    //                 PTC INSTANCE
    // ============================================


    ptc_top ptc_top_inst(

            // Wishbone Interface
            .wb_clk_i     (clk), 
            .wb_rst_i     (wb_rst        ), 
            .wb_cyc_i     (wb_m2s_ptc_cyc), 
            .wb_adr_i     ({10'b0,wb_m2s_ptc_adr[5:2],2'b0}), 
            .wb_dat_i     (wb_m2s_ptc_dat), 
            .wb_sel_i     (4'b1111),
            .wb_we_i      (wb_m2s_ptc_we), 
            .wb_stb_i     (wb_m2s_ptc_stb), 
            .wb_dat_o     (wb_s2m_ptc_dat),
            .wb_ack_o     (wb_s2m_ptc_ack), 
            .wb_err_o     (wb_s2m_ptc_err),
            .wb_inta_o    (ptc_irq),

            // External PTC Interface
            .gate_clk_pad_i (1'b0), // not using external clk
            .pwm_pad_o      (pwm_pad_o),
            .oen_padoen_o   (pwm_padoen_o)
    );
    assign wb_s2m_ptc_rty = 1'b0;


    // ============================================
    //                   BOOT ROM
    // ============================================

	logic [31:0] rom_inst, rom_addr;

    assign rom_addr = sel_boot_rom ? current_pc : wb_m2s_rom_adr;

        `ifdef USE_SRAM
            rom_8k_wrapper tsmc_rom_inst (
        `elsif PD_BUILD
            rom_8k_wrapper tsmc_rom_inst (
        `else 
            rom  tsmc_rom_inst (
        `endif
                .clk_i       (clk            ),
                .rst_i       (wb_rst         ),
                .cyc_i       (wb_m2s_rom_cyc | sel_boot_rom), 
                .stb_i       (wb_m2s_rom_stb | sel_boot_rom),
                .adr_i       (rom_addr[12:2]),
                .we_i        (wb_m2s_rom_we & ~sel_boot_rom),
                .sel_i       (wb_m2s_rom_sel),
                .dat_i       (wb_m2s_rom_dat),
                .dat_o       (wb_s2m_rom_dat),
                .ack_o       (wb_s2m_rom_ack)
            );

    assign rom_inst = wb_s2m_rom_dat;


    // Inst selection mux
    assign sel_boot_rom = ~|current_pc[31:13]; // 0x00000000 - to - 0x00001fff 
    always @(posedge clk, negedge reset_n) begin 
        if(~reset_n) sel_boot_rom_ff <= 'b0;
        else         sel_boot_rom_ff <= sel_boot_rom;
    end
    mux2x1 #(
        .n(32)
    ) rom_imem_inst_sel_mux (
        .in0    (imem_inst      ),
        .in1    (rom_inst    ),
        .sel    (sel_boot_rom_ff),
        .out_    (inst           )
    );


    // ============================================
    //                   Debug Unit
    // ============================================
		debug_top debug_top_inst
			(
            `ifndef USE_FPGA_JTAG
				.tms_i		(tms_i),
				.tck_i		(tck_i),
				.trstn_i	(reset_n),
				.tdi_i		(tdi_i),
				.tdo_o		(tdo_o),
            `endif

				.rst_i		(~reset_n),
				.clk_i		(clk),

				.resumeack_i(onebit_sig_e'(core_resumeack)),
				.running_i	(onebit_sig_e'(core_running)),
				.halted_i	(onebit_sig_e'(core_halted)),

				.haltreq_o	(dbg_haltreq),
				.resumereq_o(dbg_resumereq),
				.ndmreset_o	(dbg_ndmreset),

				.ar_en_o	(dbg_ar_en),
				.ar_wr_o	(dbg_ar_wr),
				.ar_ad_o	(dbg_ar_ad),
				.ar_di_i	(dbg_ar_di),
				.ar_do_o	(dbg_ar_do),
				.ar_done_i	(onebit_sig_e'(dbg_ar_done)),

				.am_en_o	(dbg_am_en),
				.am_wr_o	(dbg_am_wr),
				.am_st_o	(dbg_am_st),
				.am_ad_o	(dbg_am_ad),
				.am_di_i	(dbg_am_di),
				.am_do_o	(dbg_am_do),
				.am_done_i	(onebit_sig_e'(dbg_am_done))
			);

endmodule : rv32i_soc
