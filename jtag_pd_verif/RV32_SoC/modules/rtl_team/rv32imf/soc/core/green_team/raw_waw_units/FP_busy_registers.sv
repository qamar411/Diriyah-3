// NOTE: other modules defined in "busy_registers.sv" file
// ===================== Top modules (main) ============================
// Top Module: Generates Many Flip-Flops for Registers
module FP_busy_registers #(
    parameter num_rds = 3,
    parameter total_regs = 32  // number of registers in reg_file
) (
    input logic clk,
    input logic reset_n,
    input logic [1:0] forward_rd1_exe,
    input logic [1:0] forward_rd2_exe,
    input logic reg_write_id,   // means "the instruction in ID/EXE register will write on int_reg_file later"
    input logic FP_reg_write_id,   // means "the instruction in ID/EXE register will write on FP_reg_file later"
    input logic FP_reg_write_p_mux,
    input logic [$clog2(total_regs)-1 : 0] waddr_wb,   // Address of rd from write-back stage
    input logic [$clog2(total_regs)-1 : 0] waddr_id,   // Address of rd from decode stage
    input logic [$clog2(total_regs)-1 : 0] rs1,
    input logic [$clog2(total_regs)-1 : 0] rs2,
    input logic [$clog2(total_regs)-1 : 0] rs3,
    input logic [1:0] forward_rd3_exe,
    input logic is_R4_instruction,
    input logic branch_hazard,
    output ex_busy,
    
    output logic FP_rd_busy,
    // for clear logic
    input logic [$clog2(total_regs)-1 : 0] all_uu_FP_rd [0 : num_rds-1],
    output logic [num_rds-1 :0] all_uu_FP_rd_busy,
    output logic FP_busy_rs1, FP_busy_rs2, FP_busy_rs3, // Separate busy flags for each rs
    input logic clear_last, // Last stage is being cleared (used to reslove RAW & WAW conflict in pipelined units) 
    input logic single_cycle_inst_exe, // To exclude registers used by single cycle units
    input logic FP_rd_is_integer, // i.e., FP instruction with int rd and FP source registers
    input logic FP_rs1_is_integer, // FP instruction that uses integer source register
    output logic no_FP_dependency 

);

    // Logic for tracking busy state of each register in reg-file
    logic [total_regs-1:0] rd_busy_reg;  // A vector of flip-flops
    logic no_dependency;
    logic rs3_not_busy;
    assign rs3_not_busy = is_R4_instruction? rd_busy_reg[rs3]=='b0 : 1'b1;
    
    // check if there's no dependency (f0 included)
    assign no_dependency = FP_rs1_is_integer ? 1'b1 : (rd_busy_reg[rs1] == 0 && rd_busy_reg[rs2] == 0 && rs3_not_busy); // There is no dependency if you are using int source registers
    assign no_FP_dependency = no_dependency;
    
    // generate clear signals for each flip-flop
    logic [31:0] clr_flip_flop;
    n_bits_decoder # (
        .n(5)
    ) clear_generator (
    .in(waddr_wb),
    .out(clr_flip_flop)
    );
    
    // generate clear signals for each flip-flop
    logic [31:0] en_flip_flop;
    n_bits_decoder # (
        .n(5)
    ) enable_generator (
    .in(waddr_id),
    .out(en_flip_flop)
    );

    
    // Generate seperated flip-flops for each register (starting from 1 to avoid x0)
    generate
        genvar i;
        for (i = 0; i < total_regs; i = i + 1) begin : gen_flip_flops
            // Instantiatiate many D flip-flops
            d_flip_flop_wclr ff (
                .clk(clk),
                .reset_n(reset_n),
                .en(no_dependency & FP_reg_write_id & en_flip_flop[i] & ~single_cycle_inst_exe & ~branch_hazard),         // Write on that flip-flop only if there isn't any data-dependency
                // we used ~branch_hazard the instruction supposes to be cleared if branch_hazard=1 , 
                //  but pipelined and multi instruction escape to inside the unit and won't be cleared in EXE/MEM register
                .clear_n(clr_flip_flop[i] & FP_reg_write_p_mux & ~(clear_last & en_flip_flop[i])),     // Clear busy flag of that register has been written on
                .d(1'b1),                  // Set busy-flag as 1 if the instruction in ID-stage needs to write
                .q(rd_busy_reg[i])              // Output of each flip-flop
            );
        end
    endgenerate

    // Output
    logic rd_is_FP, rd_busy;
    assign rd_is_FP = ~reg_write_id & FP_reg_write_id;
    
    assign FP_busy_rs1 = rd_busy_reg[rs1];
    assign FP_busy_rs2 = rd_busy_reg[rs2];
    assign FP_busy_rs3 = rd_busy_reg[rs3];
    
    assign rd_busy = FP_busy_rs1 | FP_busy_rs2 | FP_busy_rs3;
    // Check for dependency only if it is a FP instruction (that does not use integer source registers)
    assign FP_rd_busy = rd_busy & (rd_is_FP | FP_rd_is_integer) & ~FP_rs1_is_integer;
    assign ex_busy = |rd_busy_reg;

    // check if that uu_rd really used or not
    always_comb begin
        for(int i=0; i<=num_rds-1; i++) begin 
            all_uu_FP_rd_busy[i] = rd_busy_reg[all_uu_FP_rd[i]];
        end
    end

endmodule
