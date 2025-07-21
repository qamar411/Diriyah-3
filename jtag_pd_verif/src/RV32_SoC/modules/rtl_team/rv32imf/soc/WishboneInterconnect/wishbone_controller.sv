import riscv_types::*;
module wishbone_controller (  // combinational controller, not state based

    // Processor interface signals
    input  wire [31:0] proc_addr,     // Processor address
    input  wire [31:0] proc_wdata,    // Processor write data
    input  wire        proc_write,    // Processor write enable
    input  wire        proc_read,    // Processor write enable
    input  wire [2:0]  proc_op,       // Processor operation
    output wire  [31:0] proc_rdata,    // Processor read data
    output logic       proc_ack,
    output logic       proc_err,
    output logic       proc_stall_pipl,

    // Debug interface signals
    input logic   core_halted,
    input logic   dbg_am_en_i,
    input logic   dbg_am_wr_i,
    input [2:0]   dbg_am_st_i,
    input [31:0]  dbg_am_ad_i,
    output [31:0] dbg_am_di_o,
    input [31:0]  dbg_am_do_i,
    output logic  dbg_am_done_o,


    // Wishbone bus signals
    output wire  [31:0] wb_adr_o,      // Wishbone address output
    output wire  [31:0] wb_dat_o,      // Wishbone data output
    output wire  [3:0]  wb_sel_o,      // Wishbone byte enable
    output reg          wb_we_o,       // Wishbone write enable
    output reg          wb_cyc_o,      // Wishbone cycle valid
    output reg          wb_stb_o,      // Wishbone strobe
    input  wire  [31:0] wb_dat_i,      // Wishbone data input
    input  wire         wb_ack_i,      // Wishbone acknowledge
    input  wire         wb_err_i
);

    // ============================================
    //               Core Wishbone Access
    // ============================================

    reg  [31:0] core_wb_adr_o;  
    reg         core_wb_we_o;    
    reg         core_wb_cyc_o;   
    reg         core_wb_stb_o;  
    wire [31:0] core_wb_dat_i;   
    wire        core_wb_ack_i;   

    always_comb begin 
        core_wb_adr_o = proc_addr;
        core_wb_cyc_o = proc_write | proc_read;
        core_wb_stb_o = proc_write | proc_read;
        core_wb_we_o = proc_write;
        if(proc_write | proc_read) begin 
            proc_stall_pipl = (~core_wb_ack_i) & ~wb_err_i;
        end else proc_stall_pipl = 0;
        proc_ack = core_wb_ack_i | wb_err_i; 
    end


    // assign core_wb_dat_o = proc_wdata;
    store_aligner store_alignment_unit(
        .wdata(core_halted ? dbg_am_do_i : proc_wdata),
        .store_type(store_t'(core_halted ? dbg_am_st_i[1:0] : proc_op)),
        .addr(wb_adr_o[1:0]),
        .mem_write(proc_write | dbg_am_wr_i),
        .wsel(wb_sel_o),
        .aligned_data(wb_dat_o)
    );


    // assign proc_rdata = core_wb_dat_i;
    load_aligner load_alignment_unit (
        .addr(wb_adr_o[1:0]),
        .fun3(core_halted? dbg_am_st_i[2:0] : proc_op),
        .rdata(wb_dat_i),
        .aligned_data(proc_rdata)
    );

    // ============================================
    //            Debug Unit Wishbone Access
    // ============================================

    reg  [31:0] dbg_wb_adr_o;    
    reg         dbg_wb_we_o;    
    reg         dbg_wb_cyc_o;   
    reg         dbg_wb_stb_o;  

    // to the interconnect
    assign dbg_wb_adr_o = dbg_am_ad_i;




    assign dbg_wb_we_o  = dbg_am_wr_i;
    assign dbg_wb_cyc_o = dbg_am_en_i;
    assign dbg_wb_stb_o = dbg_am_en_i;
    // from the interconnect
    assign dbg_am_di_o  = proc_rdata;  
    assign dbg_am_done_o = core_halted ?  (wb_ack_i |  wb_err_i) : 1'b0;

    // ============================================
    //                  Multiplexing
    // ============================================

    assign wb_adr_o = core_halted ? dbg_wb_adr_o : core_wb_adr_o; 
    assign wb_we_o  = core_halted ? dbg_wb_we_o  : core_wb_we_o ; 
    assign wb_cyc_o = core_halted ? dbg_wb_cyc_o : core_wb_cyc_o; 
    assign wb_stb_o = core_halted ? dbg_wb_stb_o : core_wb_stb_o; 

    assign core_wb_ack_i = core_halted ? 1'b0 : wb_ack_i;

    assign proc_err = wb_err_i;

endmodule
