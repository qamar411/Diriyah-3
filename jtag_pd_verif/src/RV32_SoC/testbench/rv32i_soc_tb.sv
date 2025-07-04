`timescale 1ns/1ps
`ifndef PD_BUILD

    `ifdef JTAG 
        `ifdef tracer 
            `undef tracer
        `endif
    `endif

    `ifdef tracer 
        `include "RV32_SoC/modules/tracer_modules/Tracer/pkg.sv"
        `include "RV32_SoC/modules/tracer_modules/Tracer/tracer_pkg.sv"
        `include "RV32_SoC/modules/tracer_modules/Tracer/tracer.sv"
        `include "RV32_SoC/modules/tracer_modules/rvfi_tracker_delay.sv"
    `endif 
    `ifdef JTAG
        `include "tb/SimJTAG.sv"
    `endif
   
    `ifndef VIVADO_SIM
        `define DUT_PATH DUT.u_rv32i_soc
    `else 
        `define DUT_PATH DUT
    `endif
    `define DATA_PATH `DUT_PATH.rv32i_core_inst.data_path_inst


    `ifdef POST_SYNTH
     `include "post_synth_route/post_syn.v"   
    `elsif POST_ROUTE
     `include "post_synth_route/post_route.v"   
    `endif


`define PACK_32(WIRE, OUT) \
    assign OUT = { \
        WIRE``__31_, WIRE``__30_, WIRE``__29_, WIRE``__28_, \
        WIRE``__27_, WIRE``__26_, WIRE``__25_, WIRE``__24_, \
        WIRE``__23_, WIRE``__22_, WIRE``__21_, WIRE``__20_, \
        WIRE``__19_, WIRE``__18_, WIRE``__17_, WIRE``__16_, \
        WIRE``__15_, WIRE``__14_, WIRE``__13_, WIRE``__12_, \
        WIRE``__11_, WIRE``__10_, WIRE``__9_,  WIRE``__8_,  \
        WIRE``__7_,  WIRE``__6_,  WIRE``__5_,  WIRE``__4_,  \
        WIRE``__3_,  WIRE``__2_,  WIRE``__1_,  WIRE``__0_   \
    }
    

    module rv32i_soc_tb;

        logic CLK_PAD;             
        logic RESET_N_PAD;         
        logic O_UART_TX_PAD;        
        logic I_UART_RX_PAD;        
        wire  [31:0] IO_DATA_PAD;  
        logic I_TCK_PAD; 
        logic I_TMS_PAD; 
        logic I_TDI_PAD; 
        logic O_TDO_PAD;
	    logic  VDD_LEFT;                // Power
   	    logic  VDD_RIGHT;                // Ground
    	logic  VDD_TOP;                // Power
   	    logic  VDD_BOTTOM;                // Ground
   	    logic  VSS_LEFT;                // Power
    	logic  VSS_RIGHT;                // Ground
    	logic VSS_TOP;                // Power
    	logic  VSS_BOTTOM;                // Ground
    	logic VDDPST_LEFT;             // Power
    	logic VDDPST_RIGHT;            // Ground
    	logic VDDPST_TOP;              // Power
    	logic VDDPST_BOTTOM;           // Ground
    	logic VSSPST_LEFT;             // Ground
    	logic VSSPST_RIGHT;            // Power
    	logic VSSPST_TOP;              // Ground
    	logic VSSPST_BOTTOM;           // Power

    `ifdef USE_SRAM
       parameter DMEM_DEPTH = 8*256;
       parameter IMEM_DEPTH = 32*256;
    `elsif tracer
       parameter DMEM_DEPTH = 2*8*256;
       parameter IMEM_DEPTH = 2*32*256;
    `else // normal simulation 
       parameter DMEM_DEPTH = 8*256;
       parameter IMEM_DEPTH = 32*256;
    `endif

        parameter NO_OF_GPIO_PINS = 32;
        
        logic [31:0] initial_imem [0:IMEM_DEPTH - 1];
        logic [31:0] initial_dmem [0:DMEM_DEPTH - 1];

        // GPIO - Leds and Switches
        wire [NO_OF_GPIO_PINS - 1:0] en_gpio;
        reg [NO_OF_GPIO_PINS - 1:0] i_gpio;
        wire [NO_OF_GPIO_PINS - 1:0] o_gpio;
    	logic VDD ;
    	logic VSS ;

    	assign VDD = 1;
    	assign VSS = 0;


        // ================================================//
        //                     DUT Instance                //
        // ================================================//

    `ifdef VIVADO_SIM
        rv32i_soc #(
            .DMEM_DEPTH(DMEM_DEPTH),
            .IMEM_DEPTH(IMEM_DEPTH)
        ) DUT (
            .clk(CLK_PAD),
            .reset_n(RESET_N_PAD),
            .i_gpio(i_gpio),
            .o_gpio(o_gpio),
            .en_gpio(en_gpio),
            .o_uart1_tx(O_UART_TX_PAD),
            .i_uart1_rx(I_UART_RX_PAD),
            .tck_i(I_TCK_PAD),
            .tdi_i(I_TDI_PAD),
            .tms_i(I_TMS_PAD),
            .tdo_o(O_TDO_PAD)
        );
    `else
        top_rv32i_soc #(
            .DMEM_DEPTH(DMEM_DEPTH),
            .IMEM_DEPTH(IMEM_DEPTH)
        ) DUT(
            .*
        );
    `endif

        // ================================================//
        //                       JTAG DPI                  //
        // ================================================//
        
    `ifdef JTAG
        SimJTAG sim_jtag_inst (
            .clock    (CLK_PAD),
            .reset    (~RESET_N_PAD),      // active high in SimJTAG
            .enable   (1'b1),
            .init_done(1'b1),
            .jtag_TCK (I_TCK_PAD),
            .jtag_TMS (I_TMS_PAD),
            .jtag_TDI (I_TDI_PAD),
            .jtag_TRSTn(),             // leave unconnected if you don’t use TRST
            .srstn    (),              // optional system reset (usually not needed)
            .jtag_TDO_data(O_TDO_PAD),
            .jtag_TDO_driven(1'b1),    // mark TDO always valid
            .exit     ()
        );
    `else 
        assign I_TCK_PAD = 1'b0;
    `endif


    
        // ========================================================//
        //    Gen Tracer Input signals in Program Execution Order  //
        // ========================================================//

        // maybe PD needs to comment it
        `ifdef tracer

            logic        rvfi_valid;
            logic [31:0] rvfi_insn;
            logic [4:0]  rvfi_rs1_addr;
            logic [4:0]  rvfi_rs2_addr;
            logic [4:0]  rvfi_rs3_addr;
            logic [31:0] rvfi_rs1_rdata;
            logic [4:0]  rvfi_rs2_addr;
            logic [4:0]  rvfi_rs3_addr;
            logic [4:0]  rvfi_rd_addr;
            logic [31:0] rvfi_rd_wdata;
            logic [31:0] rvfi_pc_rdata;
            logic [31:0] rvfi_pc_wdata;
            logic [31:0] rvfi_mem_addr;
            logic [31:0] rvfi_mem_wdata;
            logic [31:0] rvfi_mem_rdata;
            logic [3:0]  rvfi_mem_rmask;
            logic [3:0]  rvfi_mem_wmask;
            

            rvfi_tracker_delay DUT_tarcer
            (
                .inst_id          (`DATA_PATH.inst_id),
                .rs1_address_id   (`DATA_PATH.rs1_id),
                .rs2_address_id   (`DATA_PATH.rs2_id),
                .reg_rdata1_id    (`DATA_PATH.reg_rdata1_id),
                .reg_rdata2_id    (`DATA_PATH.reg_rdata2_id),
                .rs3_address_id   (`DATA_PATH.rs3_id),
                .reg_rdata3_id    (`DATA_PATH.reg_rdata3_id),
                .rd_address_id    (`DATA_PATH.rd_id),
                .p_mux_result     (`DATA_PATH.result_mem),  // "rvfi_rd_wdata"  -> result mux in MEM-stage
                .current_pc_id    (`DATA_PATH.current_pc_id),
                .p_mux_pc_plus_4  (`DATA_PATH.exe_mem_bus_o.pc_plus_4),  // PC+4 from p_mux signals
                .pc_sel_mem       (`DATA_PATH.pc_sel_mem),  // not used
                .pc_jump_mem      (`DATA_PATH.pc_jump_mem),  // not used
                .mem_write_mem    (`DATA_PATH.mem_write_mem),  // control signal used with store instructions
                .mem_wdata_mem    (`DATA_PATH.mem_wdata_mem), // value of writing on DMEM (writing data)
                .mem_to_reg_mem   (`DATA_PATH.mem_to_reg_mem),  // control signal used with load instructions (mem stage)
                .mem_to_reg_wb    (`DATA_PATH.mem_to_reg_wb), // control signal used with load instructions (wb stage)
                .reg_wdata_wb     (`DATA_PATH.reg_wdata_wb), // value of loaded-data from DMEM to reg_file (loading data -- wb stage)
                .branch_hazard_mem(`DATA_PATH.branch_hazard),
                .pc_plus_4_mem    (`DATA_PATH.pc_plus_4_mem),
                .stalled          (~(`DATA_PATH.pc_reg_en | `DATA_PATH.if_id_reg_en | `DATA_PATH.id_exe_reg_en)),
                .*  // outputs
            );

        `endif
     

        // ================================================//
        //                  Tracer Instance                //
        // ================================================//

        `ifdef tracer 
            tracer tracer_inst (
            .clk_i(CLK_PAD),
            .rst_ni(RESET_N_PAD),
            .hart_id_i(1),
            .rvfi_insn_t     (rvfi_insn),
            .rvfi_rs1_addr_t (rvfi_rs1_addr),
            .rvfi_rs2_addr_t (rvfi_rs2_addr),
            .rvfi_rs3_addr_t (rvfi_rs3_addr),
            .rvfi_rs1_rdata_t(rvfi_rs1_rdata),
            .rvfi_rs2_rdata_t(rvfi_rs2_rdata),
            .rvfi_rs3_rdata_t(rvfi_rs3_rdata),
            .rvfi_rd_addr_t  (rvfi_rd_addr),
            .rvfi_rd_wdata_t (rvfi_rd_wdata),
            .rvfi_pc_rdata_t (rvfi_pc_rdata),
            .rvfi_pc_wdata_t (rvfi_pc_wdata),
            .rvfi_mem_addr   (rvfi_mem_addr),
            .rvfi_mem_wdata  (rvfi_mem_wdata),
            .rvfi_mem_rdata  (rvfi_mem_rdata),
            .rvfi_valid      (rvfi_valid),
            .rvfi_rs3_addr_t (),
            .rvfi_rs3_rdata_t(),
            .rvfi_mem_rmask  (),
            .rvfi_mem_wmask  (),
            );
        `endif



        // Clock generator 
        initial CLK_PAD = 0;
        always #5 CLK_PAD = ~CLK_PAD;

        // signal geneartion here
        initial begin 
            RESET_N_PAD = 0;
            repeat(2) @(negedge CLK_PAD);
            RESET_N_PAD = 1; // dropping reset after two CLK_PAD cycles
        end


    initial begin
            `ifdef USE_SRAM
                $readmemh("RV32_SoC/testbench/inst_formatted.hex", initial_imem);
                $readmemh("RV32_SoC/testbench/data_formatted.hex", initial_dmem);
                force `DUT_PATH.inst_mem_inst.tsmc_ram.u0.mem_core_array = initial_imem;
                force `DUT_PATH.data_mem_inst.tsmc_ram.u0.mem_core_array = initial_dmem;
                @(posedge RESET_N_PAD); 
                release `DUT_PATH.inst_mem_inst.tsmc_ram.u0.mem_core_array;
                release `DUT_PATH.data_mem_inst.tsmc_ram.u0.mem_core_array;
            `elsif VCS_SIM
                $readmemh("RV32_SoC/testbench/inst_formatted.hex", initial_imem);
                $readmemh("RV32_SoC/testbench/data_formatted.hex", initial_dmem);
                force `DUT_PATH.inst_mem_inst.dmem = initial_imem;
                force `DUT_PATH.data_mem_inst.dmem = initial_dmem;
                #1; 
                release `DUT_PATH.inst_mem_inst.dmem;
                release `DUT_PATH.data_mem_inst.dmem;          
            `else 
                $readmemh("/home/it/rv32imf/jtag_pd_verif/src/RV32_SoC/testbench/inst_formatted.hex", initial_imem);
                $readmemh("/home/it/rv32imf/jtag_pd_verif/src/RV32_SoC/testbench/data_formatted.hex", initial_dmem);
                force `DUT_PATH.inst_mem_inst.dmem = initial_imem;
                force `DUT_PATH.data_mem_inst.dmem = initial_dmem;
                #1; 
                release `DUT_PATH.inst_mem_inst.dmem;
                release `DUT_PATH.data_mem_inst.dmem;
            `endif
    end 


    initial begin 
        `ifdef tracer  
            fork   
                begin
		    	
        	`ifdef POST_SYNTH
                wait(`DUT_PATH.rv32i_core_inst.data_path_inst.exe_mem_bus_o_ecall_)
                   
        	`else 
		        wait(`DUT_PATH.rv32i_core_inst.data_path_inst.ecall_mem)
	    	`endif 
                    @(posedge CLK_PAD);
                end
                begin 
                    repeat(500000) @(posedge CLK_PAD);                
                end
            join_any
        `elsif VIVADO_SIM
            repeat(100) @(posedge CLK_PAD);  
        `else 
            repeat(50000) @(posedge CLK_PAD);  
        `endif
        for(int i = 0; i < 100; i = i+1) begin 
                `ifdef USE_SRAM
                    $display("dmem[%02d] => %8h <=> %8h <= imem[%02d] ", i, `DUT_PATH.data_mem_inst.tsmc_8k_inst.u0.mem_core_array[i], `DUT_PATH.inst_mem_inst.tsmc_32k_inst.u0.mem_core_array[i], i);
                `else 
                    $display("dmem[%02d] => %8h <=> %8h <= imem[%02d] ", i, `DUT_PATH.data_mem_inst.dmem[i], `DUT_PATH.inst_mem_inst.dmem[i], i);
                `endif
        end
            for(int i = 0; i<32; i = i+1) begin 
                $display("reg_file[%02d] = %03d", i, `DUT_PATH.rv32i_core_inst.data_path_inst.reg_file_inst.reg_file[i]);
            end
        `ifndef JTAG
            $finish;
        `endif
    end
    initial begin
        `ifdef VCS_SIM    
            $dumpfile("waveform.vcd");
            $dumpvars(0);
        `endif 
    end

`ifdef JTAG_TEST
    initial begin 
     forever begin @(posedge CLK_PAD);
            force `DUT_PATH.rv32i_core_inst.u_core_dbg_fsm.debug_step = 1;
                if(`DUT_PATH.rv32i_core_inst.u_core_dbg_fsm.core_halted_o) begin 
                    force `DUT_PATH.rv32i_core_inst.u_core_dbg_fsm.dbg_resumereq_i = 1;   
                    @(posedge CLK_PAD);        
                    force `DUT_PATH.rv32i_core_inst.u_core_dbg_fsm.dbg_resumereq_i = 0; 
                end  
     end
    end
    initial begin 
        repeat(10) @(posedge CLK_PAD);
    end
`endif


initial begin 
    i_gpio[9] = 'b1;
end


logic [7:0] byte_received;
logic clk;

assign clk = CLK_PAD;

`ifdef UART_SIM
  assign i_gpio[31] = 1;
  logic [31:0] word_data[6];  // 4 bytes per entry
    initial begin 
        uart_rx = 1;
        repeat(10000) @(posedge clk)
        $readmemh("/home/it/RivRtos/src/tb/blinky/inst.hex", word_data);
        uart_upload("/home/it/RivRtos/src/tb/blinky/inst.hex", 32'h80000000);
    end

`endif


    // ================================================//
    //             s25fl128s flash model               //
    // ================================================//
    `ifndef VIVADO_SIM
    // Instantiate the flash model
    s25fl128s u_flash (
        .SI      (SI),
        .SO      (SO),
        .SCK     (SCK),
        .CSNeg   (CSNeg),
        .RSTNeg  (RSTNeg),
        .WPNeg   (WPNeg),
        .HOLDNeg (HOLDNeg)
    );
    `endif


`ifdef UART_SIM

    logic uart_rx, uart_tx;

    bit reading_rx;

    task automatic uart_send_byte(input byte tx_data);
    time bit_time = 4320ns;    // Safer bit time than 8680ns
    time stop_bit_time = 4320ns; // Slightly longer stop bit for margin
    int i;

    // Ensure line is idle high before sending
    #(bit_time * 2);  // Wait 2 bit times before sending
    // Start bit (0)
    uart_rx = 0;
    #(bit_time);

    // Data bits (LSB first)
    for (i = 0; i < 8; i++) begin
        uart_rx = tx_data[i];
        #(bit_time);
    end

    // Stop bit (1) — make it slightly longer than 1 bit time
    uart_rx = 1;
    fork 
        #(stop_bit_time);
    join_none
    endtask

    task automatic uart_get_byte(output byte rx_data);
    time bit_time = 4320ns;
    int i;
    reading_rx = 1; #1ns; reading_rx = 0;
    // Wait for start bit (falling edge)
    @(negedge uart_tx);

    // Wait half-bit to center on first data bit
    #(bit_time / 2);
    reading_rx = 1; #1ns; reading_rx = 0;

    rx_data = 0;

    // Sample 8 data bits (LSB first)
    for (i = 0; i < 8; i++) begin
        #(bit_time);            // Wait full bit time
        rx_data[i] = uart_tx;   // Sample bit
        reading_rx = 1; #1ns; reading_rx = 0;
    end

    // Wait for stop bit
    #(bit_time);
    reading_rx = 1; #1ns; reading_rx = 0;
    endtask



task automatic uart_upload(input string hex_file, input logic [31:0] base_addr);
  byte flat_data[$];           // Flattened to 1 byte per entry
  byte status;
  int i;
  int payload_len;
  int unsigned s1 = 1, s2 = 0;
  int unsigned checksum;

  // Step 1: Load and flatten
  for (i = 0; i < 24; i++) begin
    flat_data.push_back(word_data[i][7:0]);
    flat_data.push_back(word_data[i][15:8]);
    flat_data.push_back(word_data[i][23:16]);
    flat_data.push_back(word_data[i][31:24]);
  end

  payload_len = 24;

  // Step 2: Handshake
  uart_send_byte(8'h43);  // 'C'
  uart_get_byte(status);
  if (status !== 8'h43) $display("Handshake failed! %h", status);

  // Step 3: CMD_START + CMD_UPLOAD
  uart_send_byte(8'h53);  // 'S'
  uart_send_byte(8'h55);  // CMD_UPLOAD

  // Step 4: Address
  uart_send_byte(base_addr[31:24]);
  uart_send_byte(base_addr[23:16]);
  uart_send_byte(base_addr[15:8]);
  uart_send_byte(base_addr[7:0]);

  // Step 5: Length (2 bytes, big endian)
  uart_send_byte(payload_len[7:0]);
  uart_send_byte(payload_len[15:8]);

  // Step 6: Payload
  for (i = 0; i < payload_len; i++)
    uart_send_byte(flat_data[i]);

  // Step 7: Adler32 Checksum
  foreach (flat_data[i]) begin
    s1 = (s1 + flat_data[i]) % 65521;
    s2 = (s2 + s1) % 65521;
  end
  checksum = (s2 << 16) | s1;
  uart_send_byte(checksum[7:0]);
  uart_send_byte(checksum[15:8]);
  uart_send_byte(checksum[23:16]);
  uart_send_byte(checksum[31:24]);

  // Step 8: Response
  uart_get_byte(status);
  if (status == 8'h4F)
    $display("UPLOAD to %08x successful", base_addr);
  else if (status == 8'h4E)
    $display("UPLOAD to %08x failed - checksum mismatch", base_addr);
  else
    $fatal("Unexpected response: %02x", status);
endtask


    assign I_UART_RX_PAD = uart_rx;
    assign uart_tx       = O_UART_TX_PAD; 

`endif

    endmodule



`endif
