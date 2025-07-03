module clear_units_decoder #(
        parameter num_rds = 9,         // number of rd
        parameter rd_addr_width = 5,    // bits of rd-address
        parameter int_uu_rds = 2
    ) (
    input  logic [rd_addr_width-1 : 0] rd_used [0 : num_rds-1],  // array of rd signals
    input logic [num_rds-1 : 0] reg_write_unit,            // indicates that rd is integer      // not used
    input logic [num_rds-1 : 0] FP_reg_write_unit,         // indicates that rd is FP       // not used
    input logic [num_rds-1 : 0] all_uu_rd_busy,         // indicate that rd still inisde the unit and didn't reach MEM stage yet
    input logic no_exe_unit_dependency, 
    input logic is_R4_instruction,
    input logic debug_on,
    
    input  logic [rd_addr_width-1 : 0] waw_rd,                    // a new rd that causes write-after-write (WAW) problem
    input  logic [rd_addr_width-1 : 0] waw_rs1,                  // rs1 from the new intstruction
    input  logic [rd_addr_width-1 : 0] waw_rs2,                  // rs2 from the new intstruction
    input  logic [rd_addr_width-1 : 0] waw_rs3,                  // rs3 from the new intstruction (special case used with R4 instructions)
    input logic reg_write_new,             // indicates that rd is integer
    input logic FP_reg_write_new,          // indicates that rd is FP
    
    // signals from ID/EXE pipeline register (the new instruction)
    input logic [rd_addr_width-1 : 0] waw_rd_exe, // CHECK IN EXE STAGE
    input logic [rd_addr_width-1 : 0] waw_rs1_exe,
    input logic [rd_addr_width-1 : 0] waw_rs2_exe,
    input logic [rd_addr_width-1 : 0] waw_rs3_exe,    // TODO: as ID stage
    input logic reg_write_new_exe,             // indicates that rd is integer
    input logic FP_reg_write_new_exe,          // indicates that rd is FP
    input logic FP_rd_busy_falling,
    input logic FP_rd_is_int_falling,
    input logic [8:0] p_signal_start_exe,
    input logic FP_rd_is_integer_id,
    input logic FP_rs1_is_integer_id,
    input logic FP_rd_is_integer_exe,
    input logic FP_rs1_is_integer_exe,

    output logic [num_rds-1 : 0] clear_rd  // Array of clear signals for each unit
);

    `ifdef NO_WAW
        // we don't need clear signals in verifciation
        assign clear_rd = 'b0;
    `else
    // Generate block using genvar to create the clear logic for each rd
    genvar i;
    generate
        for (i = 0; i < num_rds; i++) begin: clr_gen
            // Generate the clear signal for each rd only if the same rd address and type match
            if (i == 15) begin // clear fpu (writes on integer and floating-point registers)                               
                  assign clear_rd[i] = ((rd_used[i] == waw_rd) && (waw_rd != 0) && (reg_write_new && ~FP_reg_write_new && FP_rd_is_integer_id) // if FP_rd_is_integer_exe: Writing on int regs
                                                    || (rd_used[i] == waw_rd_exe) && (waw_rd_exe != 0) && (reg_write_new_exe && ~FP_reg_write_new_exe && FP_rd_is_integer_exe)) // To avoid clearing (and stalling) if the unit was not writing (reg 0)
                                                    && no_exe_unit_dependency && ~debug_on
                                                    ? 1'b1 : // else if FP_rs1_is_integer_exe: Writing on FP regs (with integer rs1 - no check for dependency)
                                                    ((rd_used[i] == waw_rd) && (~reg_write_new && FP_reg_write_new && FP_rs1_is_integer_id)
                                                    || (rd_used[i] == waw_rd_exe) && (~reg_write_new_exe && FP_reg_write_new_exe && FP_rs1_is_integer_exe) 
                                                    && !(FP_rd_is_int_falling && p_signal_start_exe[7])) // To resolve accidental clearing between int and FP regs for move & conversion (FPU) instructions
                                                    && no_exe_unit_dependency && ~debug_on
                                                    ? 1'b1 : // else: Writing on FP regs 
                                                    ((rd_used[i] == waw_rd) && (~reg_write_new && FP_reg_write_new)
                                                    && waw_rs1 != waw_rd && waw_rs2 != waw_rd // Diff reg file
                                                    || (rd_used[i] == waw_rd_exe) && (~reg_write_new_exe && FP_reg_write_new_exe) 
                                                    && !(FP_rd_is_int_falling && p_signal_start_exe[7]) // To resolve accidental clearing between int and FP regs for move & conversion (FPU) instructions
                                                    && waw_rs1_exe != waw_rd_exe && waw_rs2_exe != waw_rd_exe) // Must prioritize RAW in normal cases
                                                    && no_exe_unit_dependency && ~debug_on
                                                    ? 1'b1 : 1'b0;                                  
                                                    
            end else if (i < int_uu_rds) begin  // clear inreger units
                assign clear_rd[i] = ((rd_used[i] == waw_rd) && (waw_rd != 0) && (reg_write_new && ~FP_reg_write_new) // To avoid clearing (and stalling) if the unit was not writing (reg 0)
                                                    && waw_rs1 != waw_rd && waw_rs2 != waw_rd
                                                    || (rd_used[i] == waw_rd_exe) && (waw_rd_exe != 0) && (reg_write_new_exe && ~FP_reg_write_new_exe) // To avoid clearing (and stalling) if the unit was not writing (reg 0)
                                                    && waw_rs1_exe != waw_rd_exe && waw_rs2_exe != waw_rd_exe)
                                                    && no_exe_unit_dependency && ~debug_on
                                                    ? 1'b1 : 1'b0;
                
            end else begin  // clear FP units          
                assign clear_rd[i] = ((rd_used[i] == waw_rd) && (~reg_write_new && FP_reg_write_new)
                                                    && waw_rs1 != waw_rd && waw_rs2 != waw_rd && (waw_rs3 != waw_rd && is_R4_instruction)
                                                    || (rd_used[i] == waw_rd_exe && !(FP_rd_busy_falling && |p_signal_start_exe[5:3])) // To avoid clearing in RAW cases for Pipelined units (Excluding Mul & FPU)
                                                    && (~reg_write_new_exe && FP_reg_write_new_exe) 
                                                    && waw_rs1_exe != waw_rd_exe && waw_rs2_exe != waw_rd_exe)
                                                    && no_exe_unit_dependency && ~debug_on
                                                    ? 1'b1 : 1'b0;
            end

          
        end
    endgenerate
    `endif

endmodule