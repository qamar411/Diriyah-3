// `define DV_DEBUG  // for RTL: uncomment it to use

typedef enum logic [2:0]{
    NO_DBG_CAUSE,
    DBG_EBREAK,
    DBG_HALTREQ = 3'd3,
    DBG_STEP = 3'd4
} dcause_e;

module core_dbg_fsm (
    input logic clk_i, 
    input logic reset_i,
    input logic ebreak_inst_mem,
    input logic dbg_resumereq_i, 
    input logic dbg_haltreq_i,
    input logic inst_valid_wb,
    output logic core_resumeack_o,
    output logic core_running_o,
    output logic core_halted_o,
    output logic dbg_ret,
    input logic [31:0] cinst_pc,
    input [31:0] pc_jump_wb,  
    output logic [31:0] dcsr_o, 
    output logic [31:0] dpc_o,
    //linearization logic 
    input logic empty_core,
    output logic debug_on,
    output logic flush_flag,
    input logic branch_wb,
    // abstract register access interface 
    input  logic        dbg_ar_en,
    input  logic        dbg_ar_wr,
    input  logic [15:0] dbg_ar_ad,
    input  logic [31:0] dbg_ar_do
);

    logic [31:0] dpc, dcsr;
    dcause_e debug_cause;
    logic debug_step;
    

    enum logic [1:0] {RUNNING, HALTED, RESUME,FLUSH} pstate, nstate;
    always_ff@(posedge clk_i or posedge reset_i)
    begin
        if(reset_i)
            pstate <= RUNNING;
        else
            pstate <= nstate;
    end
    always_comb
    begin
        case(pstate)
            RUNNING: nstate = dbg_haltreq_i? FLUSH:(ebreak_inst_mem && dcsr[15]) || (debug_step && ( inst_valid_wb))? HALTED : RUNNING;
            FLUSH  : nstate = empty_core ? HALTED: FLUSH;
            HALTED:	nstate = dbg_resumereq_i? RESUME : HALTED;
            RESUME: nstate = dbg_resumereq_i? RESUME : RUNNING;
            default: nstate = RUNNING;
        endcase
    end
    assign core_resumeack_o = (pstate == RESUME);
    assign core_running_o = (pstate == RUNNING)||(pstate == FLUSH);
    assign core_halted_o = ((pstate == HALTED) || (pstate == RESUME));
    assign flush_flag = pstate==FLUSH;
    logic one_step;
    assign one_step=(pstate==RUNNING &&nstate==HALTED&&debug_step);
    //dcsr
    always_ff@(posedge clk_i or posedge reset_i)
    begin
        if(reset_i)
            debug_cause <= NO_DBG_CAUSE;
        else if(core_running_o && ebreak_inst_mem && dcsr[15])
            debug_cause <= DBG_EBREAK;
        else if(core_running_o && dbg_haltreq_i)
            debug_cause <= DBG_HALTREQ;
        else if(one_step)
            debug_cause <= DBG_STEP;
    end
    assign debug_step = (dcsr[2]);
    always_ff@(posedge clk_i or posedge reset_i)
    begin
            if(reset_i)
                dcsr <= 0;
            else if(dbg_ar_en && dbg_ar_wr && (dbg_ar_ad == 16'h07b0))
                dcsr <= dbg_ar_do;//add dcsr
            else if (debug_cause==DBG_STEP &inst_valid_wb)
                dcsr[2]<=0;

    end
     //dpc
    always_ff@(posedge clk_i or posedge reset_i)
    begin
        if(reset_i)
        `ifdef DV // verification starts form IMEM
            dpc <= 32'h80000000;
        `elsif DV_DEBUG // verification starts form IMEM
            dpc <= 32'h80000000;
        `else  // normal (RTL & PD) starts from ROM
            // dpc <= 32'd0;
            dpc <= 32'hfffff000 ; // For RTL
        `endif
        else if(dbg_ar_en & dbg_ar_wr & (dbg_ar_ad == 16'h07b1)) 
            dpc <= dbg_ar_do;
        else if(core_running_o & ebreak_inst_mem & dcsr[15])
            dpc <= cinst_pc;
        else if(core_running_o & (debug_step | dbg_haltreq_i) & inst_valid_wb) begin
            if(~branch_wb)
            dpc <= cinst_pc;
            else
            dpc <= pc_jump_wb; 
        end            
            // TODO the earliest valid insturction won't always be in wb, *bcz of flush* 
        // else if(core_running_o & (debug_step | dbg_haltreq_i))
        //     dpc <= next_pc_mux_1_out; // TODO the earliest valid insturction won't always be in wb, *bcz of flush*
    end

    assign dcsr_o = {4'd4, 12'd0, dcsr[15], 1'b0, dcsr[13:9], debug_cause, 1'b0, dcsr[4], 1'b0, dcsr[2], 2'd3};
    assign dpc_o  = dpc;

    logic core_running_o_ff;
    always @(posedge clk_i, posedge reset_i ) begin
        if(reset_i)
            core_running_o_ff <= 'b0;
        else 
            core_running_o_ff <= core_running_o;
    end
    assign dbg_ret = ~core_running_o_ff & core_running_o;
    `ifdef LINEAR_SYSTEM  // DV or DSV_DEBUG
    assign debug_on = 1'b1; // convert the system to linear operation ()
    `else
    assign debug_on = dcsr[15]|dcsr[2]; // convert the system to linear operation ()
    `endif
endmodule : core_dbg_fsm
