import riscv_types::*;

module rv32i #(
    parameter DMEM_DEPTH = 1024, 
    parameter IMEM_DEPTH = 1024
)(
    input logic clk, 
    input logic reset_n,
    // maybe PD needs to comment it

    // memory bus   -   these signals between mem-stage, in datapath, and DMEM module
    output logic [31:0] mem_addr_mem,      // mem-stage address to DMEM address
    output logic [31:0] mem_wdata_mem,
    output logic mem_write_mem,
    output logic [2:0] mem_op_mem,            // used for data-alignment logic (lw, lh, lb instructions)
    input logic [31:0] mem_rdata_mem,       // DMEM data to mem-stage --> (output of DMEM)
    output logic mem_read_mem,

    // inst mem access
    output logic [31:0] current_pc,
    input logic [31:0] inst,
    // debug signals 
    output logic core_resumeack,
    output logic core_running,
    output logic core_halted,

    input  logic dbg_haltreq,
    input  logic dbg_resumereq,
    input  logic dbg_ndmreset,
 
    input  logic        dbg_ar_en,
    input  logic        dbg_ar_wr,
    input  logic [15:0] dbg_ar_ad,
    output logic [31:0] dbg_ar_di,
    output logic        dbg_ar_done,
    input  logic [31:0] dbg_ar_do,
    // stall signal from wishbone 
    input logic stall_pipl,
    output logic if_id_reg_en
);
    // logic debug_pkg; // maybe not used
    // logic flush_flag; // defined
    // logic empty_core; // defined
    // logic no_jump; // maybe not used
    // logic inst_valid_wb; // defined
    // logic ex_busy; // defined
    // logic debug_on; // defined
    
    // controller to the data path 
    logic reg_write_id; 
    logic mem_write_id;
    logic mem_to_reg_id; 
    logic branch_id; 
    logic alu_src_id;
    logic jump_id; 
    logic lui_id;
    logic auipc_id;
    logic jal_id;
    logic [2:0] alu_op_id;      
    alu_t alu_ctrl_id; 
    logic pc_sel_mem;
    logic multicycle_hazard;
    logic pre_exe_stall;
    logic [8:0] p_signal_start_id;
    logic [8:0] p_stall;
    logic [8:0] p_signal_last;
    priority_t  p_sel_exe;    // used with priority-Mux
    
    // Floating point signals
    logic rdata1_int_FP_sel_id;          // 0: integer  ----  1: float
    logic rdata2_int_FP_sel_id;
    logic rdata1_int_FP_sel_exe;      // to avoid dependecy between int and FP
    logic rdata2_int_FP_sel_exe;      // to avoid dependecy between int and FP
    logic rdata2_int_FP_sel_mem;      // to avoid dependecy between int and FP specially during load & store
    logic FP_reg_write_id;                  // write_enable signal for FP registers-file
    logic FP_reg_write_exe;              // copies will be passed through stages in Datapath
    logic FP_reg_write_mem;
    logic FP_reg_write_wb;
    logic FP_rd_is_integer_id;
    logic FP_rs1_is_integer_id;

    // data path to the controller
    logic [6:0] opcode_id;
    logic [6:0] fun7_5_id;         // (new) MOVED TO ID STAGE
    logic [2:0] fun3_id, fun3_mem; // (new) MOVED TO ID STAGE
    logic zero_mem;
    logic jump_mem;
    logic branch_mem;
    logic [8:0] p_signal_start_exe;
    logic div_unit_busy;
    logic fsqrt_unit_busy;
    logic fdiv_unit_busy;
    logic rd_busy;
    /* NOTE: if you changed the name of "fun7_5_exe" signal here,
                  make sure to change it also inside "data_path_inst" and "controller_inst"
                  modules as well
    */

    // data path to the controller (forwarding unit)
    wire [4:0] rs1_id;
    wire [4:0] rs2_id;
    wire [4:0] rs1_exe;
    wire [4:0] rs2_exe;
    wire [4:0] rs2_mem;
    wire [4:0] rd_mem;
    wire [4:0] rd_wb;
    wire reg_write_mem;
    wire reg_write_wb;

    // controller(forwarding unit) to the data path 
    wire forward_rd1_id;
    wire forward_rd2_id;
    wire [1:0] forward_rd1_exe;
    wire [1:0] forward_rd2_exe;
    wire forward_rd2_mem;
    
    // forwarding 3rd operand for R4 unit
    wire [4:0] rs3_id;
    wire [4:0] rs3_exe;
    wire forward_rd3_id;
    wire [1:0] forward_rd3_exe;


    // data path to the controller (hazard handler)
    wire mem_to_reg_exe;
    wire [4:0] rd_exe;

    // signals to control the flow of the pipeline (handling hazards, stalls ... )
    logic if_id_reg_clr;
    logic id_exe_reg_clr;
    logic exe_mem_reg_clr;
    logic mem_wb_reg_clr;

    logic id_exe_reg_en;
    logic exe_mem_reg_en;
    logic mem_wb_reg_en;
    logic pc_reg_en;
    logic branch_hazard;
    logic clear_last;

    // inst mem access
    logic [31:0] current_pc_if1;
    logic [31:0] current_pc_if;
    logic [31:0] inst_if;

    logic mem_to_reg_mem;
    //debug logic 
    logic sys_inst;
    logic [31:0] dbg_gpr_rdata,dbg_gpr_rdata_f;
    logic debug_on;
    logic inst_valid_wb;
    logic ex_busy;
    logic empty_core;
    logic flush_flag;
    // logic [31:0] dbg_csr_result;
    // logic [31:0] current_pc_id;
    // logic [31:0] next_pc_if1;
    logic [31:0] cinst_pc;
    // logic        prv_fetch_busy;
    logic        ebreak_inst_mem;
    logic        dbg_ret;
    logic        multi_pipe;
    logic        branch_wb;
    logic [31:0] pc_jump_wb;   
    logic [31:0] dcsr, dpc;
    assign current_pc = current_pc_if;
    assign inst_if = inst;
    
    // logic [31:0] next_pc_mux_1_out;
    
    // Explicit instantiation for  tracer IP
    data_path #(
        .DMEM_DEPTH(DMEM_DEPTH),
        .IMEM_DEPTH(IMEM_DEPTH)
    ) data_path_inst (
        // .*
        .clk(clk),
        .reset_n(reset_n),
        .opcode_id(opcode_id),
        .fun7_5_id(fun7_5_id),
        .fun3_id(fun3_id),
        .fun3_mem(fun3_mem),
        .zero_mem(zero_mem),
        .jump_mem(jump_mem),
        .branch_mem(branch_mem),

        .reg_write_id(reg_write_id),
        .mem_write_id(mem_write_id),
        .mem_to_reg_id(mem_to_reg_id),
        .branch_id(branch_id),
        .alu_src_id(alu_src_id),
        .jump_id(jump_id),
        .lui_id(lui_id),
        .auipc_id(auipc_id),
        .jal_id(jal_id),
        .alu_op_id(alu_op_id),

        .alu_ctrl_id(alu_ctrl_id),
        .pc_sel_mem(pc_sel_mem),
        .pre_exe_stall(pre_exe_stall),
        .multicycle_hazard(multicycle_hazard),

        .rdata1_int_FP_sel_id(rdata1_int_FP_sel_id),
        .rdata2_int_FP_sel_id(rdata2_int_FP_sel_id),
        .rdata1_int_FP_sel_exe(rdata1_int_FP_sel_exe),
        .rdata2_int_FP_sel_exe(rdata2_int_FP_sel_exe),
        .rdata2_int_FP_sel_mem(rdata2_int_FP_sel_mem),
        .FP_reg_write_id(FP_reg_write_id),
        .FP_reg_write_exe(FP_reg_write_exe),
        .FP_reg_write_mem(FP_reg_write_mem),
        .FP_reg_write_wb(FP_reg_write_wb),
        .FP_rd_is_integer_id(FP_rd_is_integer_id),
        .FP_rs1_is_integer_id(FP_rs1_is_integer_id),

        .p_sel_exe(p_sel_exe),
        .p_signal_start_id(p_signal_start_id),
        .p_signal_start_exe(p_signal_start_exe),
        .p_signal_last(p_signal_last),
        .p_stall(p_stall),

        .div_unit_busy(div_unit_busy),
        .fsqrt_unit_busy(fsqrt_unit_busy),
        .fdiv_unit_busy(fdiv_unit_busy),
        .rd_busy(rd_busy),

        .rs1_id(rs1_id),
        .rs2_id(rs2_id),
        .rs1_exe(rs1_exe),
        .rs2_exe(rs2_exe),
        .rs2_mem(rs2_mem),
        .rd_mem(rd_mem),
        .rd_wb(rd_wb),
        .reg_write_mem(reg_write_mem),
        .reg_write_wb(reg_write_wb),

        .forward_rd1_id(forward_rd1_id),
        .forward_rd2_id(forward_rd2_id),
        .forward_rd1_exe(forward_rd1_exe),
        .forward_rd2_exe(forward_rd2_exe),
        .forward_rd2_mem(forward_rd2_mem),

        .rs3_id(rs3_id),
        .rs3_exe(rs3_exe),
        .forward_rd3_id(forward_rd3_id),
        .forward_rd3_exe(forward_rd3_exe),

        .mem_to_reg_exe(mem_to_reg_exe),
        .rd_exe(rd_exe),

        .if_id_reg_clr(if_id_reg_clr),
        .id_exe_reg_clr(id_exe_reg_clr),
        .exe_mem_reg_clr(exe_mem_reg_clr),
        .mem_wb_reg_clr(mem_wb_reg_clr),

        .if_id_reg_en(if_id_reg_en),
        .id_exe_reg_en(id_exe_reg_en),
        .exe_mem_reg_en(exe_mem_reg_en),
        .mem_wb_reg_en(mem_wb_reg_en),
        .pc_reg_en(pc_reg_en),
        .branch_hazard(branch_hazard),
        .clear_last(clear_last),

        .mem_addr_mem(mem_addr_mem),
        .mem_wdata_mem(mem_wdata_mem),
        .mem_op_mem(mem_op_mem),
        .mem_rdata_mem(mem_rdata_mem),
        .mem_write_mem(mem_write_mem),
        .mem_to_reg_mem(mem_to_reg_mem),
        // dbg
        .dbg_ar_do(dbg_ar_do),
        .dbg_gpr_rdata(dbg_gpr_rdata),
        .dbg_gpr_rdata_f(dbg_gpr_rdata_f),
        .ebreak_inst_mem(ebreak_inst_mem),
        .core_halted(core_halted),
        .core_running(core_running),
        .dbg_ar_en(dbg_ar_en),
        .dbg_ar_wr(dbg_ar_wr),
        .dbg_ar_ad(dbg_ar_ad),
        .dpc(dpc),
        .dbg_ret(dbg_ret),
        .debug_on(debug_on),
        .cinst_pc(cinst_pc),
        .inst_valid_wb(inst_valid_wb),
        .sys_inst(sys_inst),
        .ex_busy(ex_busy),
        .multi_pipe(multi_pipe),
        .current_pc_if(current_pc_if),
        .current_pc_if1(current_pc_if1),
        .branch_wb(branch_wb),
        .pc_jump_wb(pc_jump_wb),
        .inst_if(inst_if)
    );
    
    control_unit controller_inst(
        // .*
        .opcode_id(opcode_id),
        .fun7_5_id(fun7_5_id),
        .fun3_id(fun3_id),
        .fun3_mem(fun3_mem),
        .zero_mem(zero_mem),
        .jump_mem(jump_mem),
        .branch_mem(branch_mem),

        .reg_write_id(reg_write_id),
        .mem_write_id(mem_write_id),
        .mem_to_reg_id(mem_to_reg_id),
        .branch_id(branch_id),
        .alu_src_id(alu_src_id),
        .jump_id(jump_id),
        .lui_id(lui_id),
        .auipc_id(auipc_id),
        .jal_id(jal_id),
        .alu_op_id(alu_op_id),

        .rdata1_int_FP_sel_id(rdata1_int_FP_sel_id),
        .rdata2_int_FP_sel_id(rdata2_int_FP_sel_id),
        .rdata1_int_FP_sel_exe(rdata1_int_FP_sel_exe),
        .rdata2_int_FP_sel_exe(rdata2_int_FP_sel_exe),
        .rdata2_int_FP_sel_mem(rdata2_int_FP_sel_mem),
        .FP_reg_write_id(FP_reg_write_id),
        .FP_reg_write_exe(FP_reg_write_exe),
        .FP_reg_write_mem(FP_reg_write_mem),
        .FP_reg_write_wb(FP_reg_write_wb),
        .FP_rd_is_integer_id(FP_rd_is_integer_id),
        .FP_rs1_is_integer_id(FP_rs1_is_integer_id),

        .p_sel_exe(p_sel_exe),
        .p_signal_start_id(p_signal_start_id),
        .p_signal_start_exe(p_signal_start_exe),
        .p_signal_last(p_signal_last),
        .p_stall(p_stall),

        .div_unit_busy(div_unit_busy),
        .fsqrt_unit_busy(fsqrt_unit_busy),
        .fdiv_unit_busy(fdiv_unit_busy),
        .rd_busy(rd_busy),

        .alu_ctrl_id(alu_ctrl_id),

        .pc_sel_mem(pc_sel_mem),

        .rs1_id(rs1_id),
        .rs2_id(rs2_id),
        .rs1_exe(rs1_exe),
        .rs2_exe(rs2_exe),
        .rs2_mem(rs2_mem),
        .rd_mem(rd_mem),
        .rd_wb(rd_wb),
        .reg_write_mem(reg_write_mem),
        .reg_write_wb(reg_write_wb),

        .forward_rd1_id(forward_rd1_id),
        .forward_rd2_id(forward_rd2_id),
        .forward_rd1_exe(forward_rd1_exe),
        .forward_rd2_exe(forward_rd2_exe),
        .forward_rd2_mem(forward_rd2_mem),

        .rs3_id(rs3_id),
        .rs3_exe(rs3_exe),
        .forward_rd3_id(forward_rd3_id),
        .forward_rd3_exe(forward_rd3_exe),

        .mem_to_reg_exe(mem_to_reg_exe),
        .rd_exe(rd_exe),

        .if_id_reg_clr(if_id_reg_clr),
        .id_exe_reg_clr(id_exe_reg_clr),
        .exe_mem_reg_clr(exe_mem_reg_clr),
        .mem_wb_reg_clr(mem_wb_reg_clr),

        .if_id_reg_en(if_id_reg_en),
        .id_exe_reg_en(id_exe_reg_en),
        .exe_mem_reg_en(exe_mem_reg_en),
        .mem_wb_reg_en(mem_wb_reg_en),
        .pc_reg_en(pc_reg_en),
        .pre_exe_stall(pre_exe_stall),
        .multicycle_hazard(multicycle_hazard),
        .branch_hazard(branch_hazard),
        // linerization 
        .clk(clk),
        .rst(reset_n), 
        .debug_on(debug_on),
        .flush_flag(flush_flag),
        .ex_busy(ex_busy),
        .empty_core(empty_core),
        .core_running(core_running),
        .core_halted(core_halted),
        .dbg_ret(dbg_ret),
        .sys_inst(sys_inst),
        .multi_pipe(multi_pipe),
        .clear_last(clear_last),

        .stall_pipl(stall_pipl)
    );
 
    core_dbg_fsm u_core_dbg_fsm (
        .clk_i             (clk),
        .reset_i           (~reset_n),
        .ebreak_inst_mem   (ebreak_inst_mem),
        .dbg_resumereq_i   (dbg_resumereq),
        .dbg_haltreq_i     (dbg_haltreq),
        .core_resumeack_o  (core_resumeack),
        .core_running_o    (core_running),
        .core_halted_o     (core_halted),
        .cinst_pc          (cinst_pc),
        .dbg_ret           (dbg_ret),
        .inst_valid_wb     (inst_valid_wb),
        .dcsr_o            (dcsr),
        .dpc_o             (dpc),
        // linear logic 
        .empty_core(empty_core),
        .debug_on(debug_on),
        .flush_flag(flush_flag),
        .branch_wb(branch_wb),
        .pc_jump_wb(pc_jump_wb),
        // abstract register access interface
        .dbg_ar_en         (dbg_ar_en),
        .dbg_ar_wr         (dbg_ar_wr),
        .dbg_ar_ad         (dbg_ar_ad),
        .dbg_ar_do         (dbg_ar_do)
    );
    
    always_comb begin 
        if(dbg_ar_ad < 32'h1000)
            case(dbg_ar_ad)
                16'h07b0: dbg_ar_di = dcsr;
                16'h07b1: dbg_ar_di = dpc;
		16'h0300: dbg_ar_di = 32'h00001A00;//mstatus;
		16'h0301: dbg_ar_di = {2'b1,4'b0,13'b0,1'b1,3'b0,1'b1,2'b0,1'b1,5'b0};
                default:  dbg_ar_di = 32'b0;
            endcase
        else if(dbg_ar_ad >= 32'h1000 && dbg_ar_ad <= 32'h101f)
             dbg_ar_di = dbg_gpr_rdata;
        else if (dbg_ar_ad>= 32'h1020 && dbg_ar_ad <= 32'h103f)
             dbg_ar_di = dbg_gpr_rdata_f;

        else dbg_ar_di = 32'b0;
    end
    assign dbg_ar_done = dbg_ar_en;


    assign mem_read_mem = mem_to_reg_mem;


endmodule 
