typedef enum logic [8:0] {
    FSQRT_UNIT = 9'h001,
    DIV_UNIT = 9'h002,
    FDIV_UNIT = 9'h004,
    R4_UNIT = 9'h008,
    FMUL_UNIT = 9'h010,
    FADD_UNIT = 9'h020
    , MUL_UNIT = 9'h040,  
    FP_UNIT = 9'h080 
//    ALU_UNIT = 9'h100 // not needed, because only one of them will execute -> use "single_cycle_inst" signal
} unit_t;


module pipeline_controller (
    input logic load_hazard,
    input logic branch_hazard,
    input logic stall_pipl,
    input logic clear_last,
    
    output logic if_id_reg_clr,
    output logic id_exe_reg_clr,
    output logic exe_mem_reg_clr,
    output logic mem_wb_reg_clr,

    output logic if_id_reg_en, 
    output logic id_exe_reg_en,
    output logic exe_mem_reg_en,
    output logic mem_wb_reg_en,
    output logic pc_reg_en,
    
    // "priority" signals
    input logic p_system_stall,         // p_system_stall = p_stall[5]
    input logic priority_hazard,        // to clear duplicated data in EXE stage (it unintentionally happend, so clear it)
    
    // back-to-back signals ..
    input logic multicycle_hazard,
    output logic pre_exe_stall, // Probably is not used outside anymore 
    input logic [8:0] p_signal_start_exe,
    input logic [8:0] p_stall,  // stall signals
    
    //linerization signals 
    input clk,
    input rst, 
    input debug_on,
    input flush_flag,
    input ex_busy,
    output empty_core,
    input core_running,
    input core_halted,
    input dbg_ret,
    input multi_pipe,
    // signals for WAW ..
    input logic  rd_busy
);

logic line_stall,line_clr;

linearization line_controller(

        .clk            (clk),
        .rst            (rst),
        .debug_on       (debug_on),
        .flush_flag     (flush_flag),
        .ex_busy        (ex_busy),
        .multi_pipe     (multi_pipe),
        .empty_core     (empty_core),
        .line_stall     (line_stall),
        .line_clr       (line_clr)

);


    // signals to solve edge-cases of multicycle_hazard ...
    logic clr_duplicated_inst;  // clear duplicated instruction
    logic single_cycle_inst;
    unit_t desired_unit;
    logic pass_to_fsqrt_unit, // pass the new instrucion to its desired unit safely
            pass_to_div_unit,
            pass_to_mul_unit,
            pass_to_fdiv_unit,
            pass_to_R4_unit,
            pass_to_fmul_unit,
            pass_to_fpu_unit,
            pass_to_fadd_unit;

    // these signals indicate that "the new instruction in ID/EXE register will go to a functional-unit, and that unit isn't busy"
    assign pass_to_fsqrt_unit = p_signal_start_exe[0] & ~p_stall[4];  // Fsqrt (multicycle)
    assign pass_to_div_unit  = p_signal_start_exe[1] & ~p_stall[3];  // Div (multicycle)
    assign pass_to_fdiv_unit  = p_signal_start_exe[2] & ~p_stall[0];  // FDiv (multicycle)
    assign pass_to_R4_unit  = p_signal_start_exe[3] & ~p_stall[6];  // R4 (pipelined)
    assign pass_to_fmul_unit  = p_signal_start_exe[4] & ~p_stall[2];  // Fmul (pipelined)
    assign pass_to_fadd_unit  = p_signal_start_exe[5] & ~p_stall[1];  // Fadd_sub (pipelined)
    assign pass_to_mul_unit = p_signal_start_exe[6] & ~p_stall[7]; // Mul (pipelined)
    assign pass_to_fpu_unit = p_signal_start_exe[7] & ~p_stall[8]; // FPU (pipelined)
    // NOTE: if collision occurred (unit_busy_signals[5]=1), it will also stall the collided units (units that causes collision)
    
    // determine type of the new instruction and if it's valid or not
    assign single_cycle_inst = (p_signal_start_exe[8]);
    assign desired_unit = unit_t'(p_signal_start_exe[7:0]);  // type casting
    // NOTE: "p_signal_start" could be zeros in 2 cases: invalid instruction, or  system has been stalled
    
    always_comb begin
        if (multicycle_hazard && !rd_busy) begin  // multicycle_hazard && ~RAW 
            if (single_cycle_inst & !p_system_stall & ~stall_pipl) begin // single_cycle & ~collision
                // use ~stall_pipl to prevent clearing ID/EXE in the following edge case:
                // rem_Id [] add_exe -- div_unit [] lb_mem
                // this contains multicycle_hazard (rem and div) with stall_pipl (lb)
                clr_duplicated_inst = 1'b1;
            end
            else begin
                case (desired_unit)  // check which one collides (stalled), so we shouldn't clear
                    FSQRT_UNIT:  clr_duplicated_inst = pass_to_fsqrt_unit? 1'b1 : 1'b0;
                    DIV_UNIT:  clr_duplicated_inst = pass_to_div_unit? 1'b1 : 1'b0;
                    MUL_UNIT: clr_duplicated_inst = pass_to_mul_unit? 1'b1 : 1'b0;
                    FDIV_UNIT:  clr_duplicated_inst = pass_to_fdiv_unit? 1'b1 : 1'b0;
                    R4_UNIT:  clr_duplicated_inst = pass_to_R4_unit? 1'b1 : 1'b0;
                    FMUL_UNIT:  clr_duplicated_inst = pass_to_fmul_unit? 1'b1 : 1'b0;
                    FADD_UNIT:  clr_duplicated_inst = pass_to_fadd_unit? 1'b1 : 1'b0;
                    FP_UNIT:  clr_duplicated_inst = pass_to_fpu_unit? 1'b1 : 1'b0;
                    default: clr_duplicated_inst =1'b0;
                endcase
            end
        end else // no multicycle_hazard or either rd is busy or a collision occurred
            clr_duplicated_inst = 1'b0;
    end
    
    
    // clear signals for pipeline registers
    assign if_id_reg_clr = dbg_ret | core_halted | branch_hazard;
    // assign id_exe_reg_clr = core_halted | branch_hazard | load_hazard | clr_duplicated_inst|line_clr;  // TO AVOID RESULT REPETITION // there are many failed cases with this logic ..
    assign id_exe_reg_clr = core_halted | branch_hazard | (load_hazard & ~stall_pipl) | clr_duplicated_inst|line_clr;  // TO AVOID RESULT REPETITION
    assign exe_mem_reg_clr = core_halted | branch_hazard | clear_last;
    assign mem_wb_reg_clr = core_halted;

    // stall stages before EXE if "back-to-back" multicycle instructions happend ...
    assign pre_exe_stall = stall_pipl | load_hazard | p_system_stall | multicycle_hazard | rd_busy;

    assign pc_reg_en =      core_running & ~(pre_exe_stall | line_stall);
    assign if_id_reg_en =   core_running & ~(pre_exe_stall | line_stall);
    assign id_exe_reg_en =  core_running & ~(stall_pipl | p_system_stall | multicycle_hazard | rd_busy | line_stall);
    assign exe_mem_reg_en = core_running & ~(stall_pipl);
    assign mem_wb_reg_en =  core_running & ~(stall_pipl);

endmodule
