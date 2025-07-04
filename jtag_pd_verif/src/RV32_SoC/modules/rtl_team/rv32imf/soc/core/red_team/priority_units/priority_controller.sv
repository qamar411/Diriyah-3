/* prioirty ...
    p_signal [0]  fsqrt     (multi-cycle)
    p_signal [1] div     (multi-cycle)
    p_signal [2] f_div     (multi-cycle)
    p_signal [3] R4     (pipeline)
    p_signal [4] f_mul     (pipeline)
    p_signal [5] f_add_sub     (pipeline)
    p_signal [6] mul     (pipeline)
    p_signal [7] fpu     (pipeline)
    p_signal [8] alu     (single-cycle)
*/
import riscv_types::*;

module priority_controller (
    input logic [8:0] p_signal, // From all functional units    (last)
    input logic [7:0] p_signal_start, // From pipelined functional units
    input logic rd_busy, 

    output logic [8:0] stall, 
    output logic id_exe_reg_clr_priority, // to be ORed with id_exe_reg_clr
    output priority_t p_sel
);


    logic [3:0] p_signal_sum;
    logic collision;
    logic [7:0] copy_hazard; // Write-after-write (WAW) hazards 

    always_comb begin
        // TODO (Done): order units from highest priority to lowest ...
        p_sel = 
        // stop_single_cycle ? DEFAULT_unit : // to avoid repeating single-cycle results
                p_signal[0] ? FSQRT_unit : // FSQRT
                p_signal[1] ? DIV_unit : // DIVU
                p_signal[2] ? FDIV_unit : // FDIVU
                p_signal[5] ? FADD_SUB_unit : // FADD_SUBU
                p_signal[3] ? R4_unit : // R4 or Nothing
                p_signal[4] ? FMUL_unit : // FMULU
                p_signal[6] ? MUL_unit : // MULU
                p_signal[7] ? FP_unit : // FPU
                rd_busy ? DEFAULT_unit : // to avoid early execution of hazardous instructions (RAW) 
                p_signal[8] ? ALU_unit : DEFAULT_unit; // ALU or Nothing
                // NOTE: check them on lib.sv file if something wrong happened

        // Perform bitwise addition
        p_signal_sum = p_signal[8] + p_signal[7] + p_signal[6] + p_signal[5]
                                    + p_signal[4] + p_signal[3] + p_signal[2] + p_signal[1] + p_signal[0];
        
        // Detect the possibility of collision (more than one unit writing into EXE/MEM reg simultaneously)
        collision = (p_signal_sum >= 2) ? 1 : 0; 

        // TODO: only stall hardware (functional unit) that causes collision ...
        stall[0] = collision & ~(p_sel == FDIV_unit) & p_signal[2]; // stall FDIVU
        stall[1] = collision & ~(p_sel == FMUL_unit) & p_signal[4]; // stall FMULU
        stall[2] = collision & ~(p_sel == FADD_SUB_unit) & p_signal[5]; // stall FADD_SUBU
        stall[3] = collision & ~(p_sel == DIV_unit) & p_signal[1]; // stall DIVU
        stall[4] = collision & ~(p_sel == FSQRT_unit); // stall FSQRT_unit
        stall[5] = collision; // stall the system pipeline
        stall[6] = collision & ~(p_sel == R4_unit) & p_signal[3]; // stall R4_unit
        stall[7] = collision & ~(p_sel == MUL_unit) & p_signal[6]; // stall MUL unit
        stall[8] = collision & ~(p_sel == FP_unit) & p_signal[7]; // stall FPU
        // NOTE: no need for other units since they are single-cycle units

        // Write-after-write (WAW) hazards 
        copy_hazard = p_signal_start & p_signal[7:0]; 

        id_exe_reg_clr_priority = collision & (((p_sel == FSQRT_unit) & copy_hazard[0])
                                              |((p_sel == DIV_unit) & copy_hazard[1])
                                              |((p_sel == FDIV_unit) & copy_hazard[2])
                                              |((p_sel == R4_unit) & copy_hazard[3])
                                              |((p_sel == FMUL_unit) & copy_hazard[4])
                                              |((p_sel == FADD_SUB_unit) & copy_hazard[5])
                                              |((p_sel == MUL_unit) & copy_hazard[6])
                                              |((p_sel == FP_unit) & copy_hazard[7])
                                              );
    end

endmodule
