// `define LINEAR_SYSTEM // for RTL

// ===================== Sub-module ============================
// Flip-Flop module with clear and reset
module d_flip_flop_wclr (
    input logic clk,
    input logic reset_n,
    input logic en,
    input logic clear_n,
    input logic d,               // data input
    output logic q             // data output
);
    always_ff @(posedge clk, negedge reset_n) begin    // use negedge or not? i think edges is better
        if (!reset_n)
            q <= 1'b0;
        else if (clear_n)
            q <= 1'b0;
        else if (en)
            q <= d;
        else
        q <= q;
    end
endmodule

// simple Decoder to generate clear signals for each Flip-Flop
module n_bits_decoder # (
    parameter n = 5
    ) (
    input logic [n-1:0] in,
    output logic [2**n-1 : 0] out
    );
    
    always_comb begin
        out = 'b0;                  // clear all outputs
        out[in] = 1'b1;          // Set the bit at the position specified by 'in'
    end
endmodule

// ===================== Top modules (main) ============================
// Top Module: Generates Many Flip-Flops for Registers
module busy_registers #(
    parameter total_regs = 32,  // number of registers
    parameter int_uu_rds = 2
) (
    input logic clk,
    input logic reset_n,
    input logic [1:0] forward_rd1_exe,
    input logic [1:0] forward_rd2_exe,
    input logic reg_write_id,   // means "the instruction in ID/EXE register will write on int_reg_file later"
    input logic FP_reg_write_id,   // means "the instruction in ID/EXE register will write on FP_reg_file later"
    input logic reg_write_p_mux,
    input logic [$clog2(total_regs)-1 : 0] waddr_wb,   // Address of rd from write-back stage
    input logic [$clog2(total_regs)-1 : 0] waddr_id,   // Address of rd from decode stage
    input logic [$clog2(total_regs)-1 : 0] rs1,
    input logic [$clog2(total_regs)-1 : 0] rs2,
    input logic [$clog2(total_regs)-1 : 0] all_uu_int_rd[0 : int_uu_rds-1],
    output logic [int_uu_rds-1   :   0] all_uu_int_rd_busy,
    output logic ex_busy,
    input logic clear_last,
    input logic single_cycle_inst_exe,
    input logic branch_hazard,
    input logic FP_rs1_is_integer, // FP instruction that uses integer source register
    input logic FP_rd_is_integer, // i.e., FP instruction with int rd and FP source registers
    output logic int_rd_busy,
    output logic busy_rs1,
    output logic busy_rs2,
    output logic no_int_dependency  
);

    // Logic for tracking busy state of each register in reg-file
    logic [total_regs-1:0] rd_busy_reg;  // A vector of flip-flops
    logic no_dependency;
    
    // Tip: for better consistency, name it as "no_rd_dependecy", "no_RAW", or "rs_available"
    // check if there's no dependency (x0 should be excluded from being busy) --> Read-After_Write (RAW) issue
    assign no_dependency = FP_rd_is_integer ? 1'b1 : (rd_busy_reg[rs1] == 0 && rd_busy_reg[rs2] == 0); // There is no dependency if you are using FP source registers

    assign no_int_dependency = no_dependency;
        
    // generate clear signals for each flip-flop
    logic [31:0] clr_flip_flop;
    n_bits_decoder # (
        .n(5)
    ) clear_generator (
    .in(waddr_wb),
    .out(clr_flip_flop)
    );
    logic rd_is_int, rd_busy;
    
    // generate clear signals for each flip-flop
    logic [31:0] en_flip_flop;
    n_bits_decoder # (
        .n(5)
    ) data_generator (
    .in(waddr_id),
    .out(en_flip_flop)
    );
    
    // Generate seperated flip-flops for each register (starting from 1 to avoid x0)
    generate
        genvar i;
        for (i = 0; i < total_regs; i = i + 1) begin : gen_flip_flops
            // Instantiatiate many a D flip-flops
            
        `ifdef LINEAR_SYSTEM
                d_flip_flop_wclr ff (
                .clk(clk),
                .reset_n(reset_n),
                .en(no_dependency & reg_write_id & en_flip_flop[i] & ~single_cycle_inst_exe & ~branch_hazard),
                .clear_n(clr_flip_flop[i] & reg_write_p_mux & ~(clear_last & en_flip_flop[i])),     // Clear busy flag of that register has been written on
                .d(1'b1),                  // Set busy-flag as 1 if the instruction in ID-stage needs to write
                .q(rd_busy_reg[i])              // Output of each flip-flop
            );

        `else
         if  (i==0) begin
         
                     
            d_flip_flop_wclr ff (
                .clk(clk),
                .reset_n(reset_n),
                .en(no_dependency),         // Write on that flip-flop only if there isn't any data-dependency (Read-After-Write)
                .clear_n(clr_flip_flop[i]),     // Clear busy flag of that register has been written on
                .d(1'b0),                  // Set busy-flag as 1 if the instruction in ID-stage needs to write
                .q(rd_busy_reg[i])              // Output of each flip-flop
            );
         end
         
         else begin
            
            d_flip_flop_wclr ff (
                .clk(clk),
                .reset_n(reset_n),
                .en(no_dependency & reg_write_id & en_flip_flop[i] & ~single_cycle_inst_exe & ~branch_hazard), // Write on that flip-flop only if there isn't any data-dependency
                // we used ~branch_hazard the instruction supposes to be cleared if branch_hazard=1 , 
                // but pipelined and multi instruction escape to inside the unit and won't be cleared in EXE/MEM register
                .clear_n(clr_flip_flop[i] & reg_write_p_mux & ~(clear_last & en_flip_flop[i])),     // Clear busy flag of that register has been written on
                .d(1'b1),                  // Set busy-flag as 1 if the instruction in ID-stage needs to write
                .q(rd_busy_reg[i])              // Output of each flip-flop
            );
           
           end 
        `endif
            
            
        end
    endgenerate
    
    // Output
    assign rd_is_int = reg_write_id & ~FP_reg_write_id; 
    assign rd_busy = busy_rs1 | busy_rs2;
    assign ex_busy = |rd_busy_reg;
    // Check for dependency only if it is an int instruction OR FP instruction that uses int source registers
    assign int_rd_busy = rd_busy & (rd_is_int | FP_rs1_is_integer) & ~FP_rd_is_integer;
    assign busy_rs1 = rd_busy_reg[rs1];
    assign busy_rs2 = rd_busy_reg[rs2];
    
    
    // Check if that uu_rd really used or not
    always_comb begin
        for(int i=0; i<=int_uu_rds-1; i++) begin 
            all_uu_int_rd_busy[i] = rd_busy_reg[all_uu_int_rd[i]];
        end
    end

endmodule
