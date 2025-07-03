import riscv_types::*;

module int_mul(
  input logic clk,
  input logic reset_n,
  input logic en,
  input logic p_start,
  input exe_p_mux_bus_type i_pipelined_signals,
  input  logic [31:0] rs1,
  input  logic [31:0] rs2,
  input  alu_t alu_op,
  output exe_p_mux_bus_type o_pipelined_signals,
  output logic [4:0] uu_rd,
  output logic p_last,
  output logic [31:0] result
);

  // Input registers
  logic [31:0] rs1_q, rs2_q;
  alu_t alu_op_q;
  
  always_ff @(posedge clk, negedge reset_n) begin
    if (!reset_n) begin
        p_last <= 1'b0;
        o_pipelined_signals <= 'b0;
        uu_rd <= 'b0;
        
        rs1_q <= 'b0;
        rs2_q <= 'b0;
        alu_op_q <= alu_t'(0); // type casting
    end else if (en) begin
        p_last <= p_start;
        o_pipelined_signals <= i_pipelined_signals;
        uu_rd <= i_pipelined_signals.rd;
        
        rs1_q <= rs1;
        rs2_q <= rs2;
        alu_op_q <= alu_op;
    end
  end 
    
  // Extended operands
  logic [63:0] op_a;
  logic [63:0] op_b;
  logic [127:0] full_product; // 128-bit product due to sign extension

  always_comb begin
    // Default sign extensions
    case (alu_op_q)
      MUL, // MUL
      MULH: begin // MULH (signed × signed)
        op_a = {{32{rs1_q[31]}}, rs1_q}; // sign-extend rs1
        op_b = {{32{rs2_q[31]}}, rs2_q}; // sign-extend rs2
      end

      MULHU: begin // MULHU (unsigned × unsigned)
        op_a = {32'b0, rs1_q}; // zero-extend
        op_b = {32'b0, rs2_q};
      end

      MULHSU: begin // MULHSU (signed × unsigned)
        op_a = {{32{rs1_q[31]}}, rs1_q}; // sign-extend rs1
        op_b = {32'b0, rs2_q};         // zero-extend rs2
      end

      default: begin
        op_a = 64'd0;
        op_b = 64'd0;
      end
    endcase

    // Single multiplication
    full_product = op_a * op_b;

    // Select result portion
    case (alu_op_q)
      MUL: result = full_product[31:0];   // MUL
      MULH: result = full_product[63:32];  // MULH
      MULHU: result = full_product[63:32];  // MULHU
      MULHSU: result = full_product[63:32];  // MULHSU
      default: result = 32'hDEADBEEF;
    endcase
  end

endmodule
