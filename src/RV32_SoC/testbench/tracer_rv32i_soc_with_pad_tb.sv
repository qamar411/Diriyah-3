    // =================================================================== //
    //   This is the example tb for connecting tracer to the riscv core
    // ================================================================== //
    
    /* for RTL: uncomment to use them ... */
    // `define PADS_TRACER_ENABLE=1; // any value -- (RTL) uncomment it to use tracer module with pads
    // `define DV_DEBUG=1;
    // `define USE_RS3=1;

module tracer_rv32i_soc_tb;
    logic clk;
    logic reset_n;
    // logic o_flash_sclk;
    // logic o_flash_cs_n;
    // logic o_flash_mosi;
    // logic i_flash_miso;
    // logic rts_pad_o;
    // logic cts_pad_i;
    // more signals can be here 
`ifdef PADS_TRACER_ENABLE
    logic [31:0] rvfi_insn;
    logic [4:0]  rvfi_rs1_addr;
    logic [4:0]  rvfi_rs2_addr;
    logic [31:0] rvfi_rs1_rdata;
    logic [31:0] rvfi_rs2_rdata;
    `ifdef USE_RS3
    logic [4:0]  rvfi_rs3_addr;
    logic [31:0] rvfi_rs3_rdata;
    `endif
    logic [4:0]  rvfi_rd_addr  ;
    logic [3:0] rvfi_mem_rmask;
    logic [3:0] rvfi_mem_wmask;
    logic [31:0] rvfi_rd_wdata ;
    logic [31:0] rvfi_pc_rdata ;
    logic [31:0] rvfi_pc_wdata ;
    logic [31:0] rvfi_mem_addr ;
    logic [31:0] rvfi_mem_wdata;
    logic [31:0] rvfi_mem_rdata;
    logic        rvfi_valid;
`endif

    // Clock generator 
    initial clk = 0;
    always #10 clk = ~clk;

    // signal geneartion here
    initial begin 
        reset_n = 0;
        repeat(2) @(negedge clk);
        reset_n = 1; // dropping reset after two clk cycles
    end

    // =================================================== //
    //             Instantiation of the SoC
    // =================================================== //
    `ifdef DV // for Verification
        parameter DMEM_DEPTH = 65536;
        parameter IMEM_DEPTH = 65536;
        parameter NO_OF_GPIO_PINS = 32;
    `else  // for RTL who uses Vivado software
        parameter DMEM_DEPTH = 10000; // or 128
        parameter IMEM_DEPTH = 10000;
        parameter NO_OF_GPIO_PINS = 32;
    `endif

    logic  [NO_OF_GPIO_PINS-1:0] io_gpio;
    logic i_uart_rx;
    logic o_uart_tx;
    logic tck_i; // JTAG
    logic tdi_i;
    logic tms_i;
    logic tdo_o;

    // DUT instantiation
    pads #(
        .IMEM_DEPTH(IMEM_DEPTH), // NOTE TO DV: CHANGE THE SIZE OF IMEM AND DMEM TO ACCOMMODATE THE SIZE OF YOUR TESTS
        .DMEM_DEPTH(DMEM_DEPTH),
        .NO_OF_GPIO_PINS(NO_OF_GPIO_PINS)
    )DUT(
        //.*
        .CLK_PAD(clk),
        .RESET_PAD(reset_n),

        // UART ports
        .O_UART_TX_PAD(o_uart_tx),
        .I_UART_RX_PAD(i_uart_rx),

        // GPIO ports
        .IO_GPIO_PAD(io_gpio)
        // .i_gpio(i_gpio),
        // .o_gpio(o_gpio),
        // .en_gpio(en_gpio), // defined internally

    // we don't need these singals if we wanna test JTAG on FPGA, because it has its own JTAG
    `ifndef VIVADO_BUILD // not defined
        // JTAG ports
        ,
        .I_TCK_PAD(tck_i), 
        .I_TMS_PAD(tms_i), 
        .I_TDI_PAD(tdi_i), 
        .O_TDO_PAD(tdo_o) 
    `endif

        //TRACER
    `ifdef PADS_TRACER_ENABLE
        ,
        .rvfi_insn(rvfi_insn),      
        .rvfi_rs1_addr(rvfi_rs1_addr),  
        .rvfi_rs2_addr(rvfi_rs2_addr),  
        .rvfi_rs1_rdata(rvfi_rs1_rdata), 
        .rvfi_rs2_rdata(rvfi_rs2_rdata), 
        `ifdef USE_RS3
        .rvfi_rs3_addr(rvfi_rs3_addr),
        .rvfi_rs3_rdata(rvfi_rs3_rdata),
        `endif
        .rvfi_mem_rmask(rvfi_mem_rmask),
        .rvfi_mem_wmask(rvfi_mem_wmask),
        .rvfi_rd_addr(rvfi_rd_addr),   
        .rvfi_rd_wdata(rvfi_rd_wdata),  
        .rvfi_pc_rdata(rvfi_pc_rdata),  
        .rvfi_pc_wdata(rvfi_pc_wdata),  
        .rvfi_mem_addr(rvfi_mem_addr),  
        .rvfi_mem_wdata(rvfi_mem_wdata), 
        .rvfi_mem_rdata(rvfi_mem_rdata), 
        .rvfi_valid(rvfi_valid)      
    `endif
    );


    // ============================================================================ //
    //     Example connection of tracer with WB stage signals in the data path
    // ============================================================================ //
    `ifdef PADS_TRACER_ENABLE 
        tracer tracer_inst (
        .clk_i(clk),
        .rst_ni(reset_n),
        .hart_id_i(1),
        .rvfi_insn_t(DUT.rv32i_core_inst.data_path_inst.rvfi_insn),
        .rvfi_rs1_addr_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rs1_addr),
        .rvfi_rs2_addr_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rs2_addr),
        `ifdef USE_RS3
        .rvfi_rs3_addr_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rs3_addr),
        .rvfi_rs3_rdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rs1_rdata),
        `else
        .rvfi_rs3_addr_t(),
        .rvfi_rs3_rdata_t(),
        `endif
        .rvfi_mem_rmask(), //DUT.rv32i_core_inst.data_path_inst.rvfi_mem_rmask),
        .rvfi_mem_wmask(), //DUT.rv32i_core_inst.data_path_inst.rvfi_mem_wmask),
        .rvfi_rs1_rdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rs1_rdata),
        .rvfi_rs2_rdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rs2_rdata),
        .rvfi_rd_addr_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rd_addr),
        .rvfi_rd_wdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rd_wdata),
        .rvfi_pc_rdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_pc_rdata),
        .rvfi_pc_wdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_pc_wdata),
        .rvfi_mem_addr(DUT.rv32i_core_inst.data_path_inst.rvfi_mem_addr),
        .rvfi_mem_wdata(DUT.rv32i_core_inst.data_path_inst.rvfi_mem_wdata),
        .rvfi_mem_rdata(DUT.rv32i_core_inst.data_path_inst.rvfi_mem_rdata),
        .rvfi_valid(DUT.rv32i_core_inst.data_path_inst.rvfi_valid)
        );
    `endif


    // ============================================================================ //
    //  Logic to Initialize the instruction Memory and Data Memory with .hex files
    // ============================================================================ //

    // // template ...
    // // initializing the instruction memory after every reset
    // bit [31:0] initial_imem [0:IMEM_DEPTH - 1];
    // bit [31:0] initial_dmem [0:DMEM_DEPTH - 1];
    //
    // // initial begin
    //     $readmemh("/path/to/inst_formatted.hex",DUT.inst_mem_inst.dmem); // VIVADO
    //     $readmemh("/path/to/data_formatted.hex",DUT.data_mem_inst.dmem); // VIVADO
    //
    //     // // (in VCS for verification) use force-release instead of assign them directly
    //     // $readmemh("/path/to/inst_formatted.hex", initial_imem);
    //     // $readmemh("/path/to/data_formatted.hex", initial_dmem);
    //     // force DUT.inst_mem_inst.dmem = initial_imem;
    //     // force DUT.data_mem_inst.dmem = initial_dmem;
    //     // #1; 
    //     // release DUT.inst_mem_inst.dmem;
    //     // release DUT.data_mem_inst.dmem;
    //
    //     // display content of dmem & imem
    //     for (int i=0; i<DMEM_DEPTH; ++i   ) begin
    //         $display("%h",DUT.data_mem_inst.dmem[i]);
    //         $display("%h",DUT.inst_mem_inst.dmem[i]);
    //     end
    //
    //     repeat(10000) begin 
    //         @(posedge clk);
    //     end
    //     $finish;
    // end  // wait
    //
    // // enable waveform dump
    // initial begin 
    //     $dumpfile("waveform.vcd");
    //     $dumpvars(0);
    // end


    // ============================================================================ //
    //                        Your Own testbench logic ....
    // ============================================================================ //

    // initializing the instruction memory after every reset
    bit [31:0] initial_imem [0:IMEM_DEPTH - 1];
    bit [31:0] initial_dmem [0:IMEM_DEPTH - 1];

    `ifdef DV   // Verifcation ...
        initial begin // use your own path ...
            // // Reda ...
            // $readmemh("/home/Reda_Alhashem/git/uart_wb_uvcs/core-verification/need_verification/testbench/inst_formatted.hex", initial_imem);
            // $readmemh("/home/Reda_Alhashem/git/uart_wb_uvcs/core-verification/need_verification/testbench/data_formatted.hex", initial_dmem);
        
            // // Nouf ...
            // $readmemh("/home/Nouf_Alsufyani/new_need_verification/RV32_SoC/testbench/inst_formatted.hex",  initial_imem);
            // $readmemh("/home/Nouf_Alsufyani/new_need_verification/RV32_SoC/testbench/data_formatted.hex", initial_dmem);
        
            // // Shahad ...
            // $readmemh("/home/Shahd_Abdulmohsan/core/riscv-dv/new_need_verification/testbench/inst_formatted.hex",  initial_imem);
            // $readmemh("/home/Shahd_Abdulmohsan/core/riscv-dv/new_need_verification/testbench/data_formatted.hex", initial_dmem);

            // // Abdulshakoor ...
            $readmemh("/home/Abdulshakoor_Bantan/verification/verif_rv32imf/jtag_pd_verif/RV32_SoC/testbench/inst_formatted.hex", initial_imem);
            $readmemh("/home/Abdulshakoor_Bantan/verification/verif_rv32imf/jtag_pd_verif/RV32_SoC/testbench/data_formatted.hex", initial_dmem);
        
            // use force-release instead of direct assignment
            force DUT.inst_mem_inst.dmem = initial_imem;
            force DUT.data_mem_inst.dmem = initial_dmem;
            #1; 
            release DUT.inst_mem_inst.dmem;
            release DUT.data_mem_inst.dmem;
        
            repeat(100000) @(posedge clk);
            $finish;
        end
        
        // enable waveform dump
        initial begin 
            $dumpfile("waveform.vcd");
            $dumpvars(0);
        end

    `else  // RTL
        // initializing the instruction memory after every reset
        initial begin
            $readmemh("/home/it/Documents/rvsoc_v3/src/tb/uart_receiver/machine.hex", DUT.inst_mem_inst.dmem);
        end // wait 
        
        initial begin 
            //    repeat(100000) @(posedge clk);
            //    for(int i = 0; i<= 14'h0fff; i = i+1) begin 
            //        $display("imem[%02d] = %8h", i, DUT.inst_mem_inst.memory[i]);
            //    end
            repeat(10000) @(posedge clk);
            for(int i = 0; i < 100; i = i+1) begin 
                $display("dmem[%02d] => %8h <=> %8h <= imem[%02d] ", i, DUT.data_mem_inst.dmem[i], DUT.inst_mem_inst.dmem[i], i);
            end
                for(int i = 0; i<32; i = i+1) begin 
                    $display("reg_file[%02d] = %03d", i, DUT.rv32i_core_inst.data_path_inst.reg_file_inst.reg_file[i]);
                end
            $finish;
        end

        initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, DUT);
        end
    `endif


endmodule
