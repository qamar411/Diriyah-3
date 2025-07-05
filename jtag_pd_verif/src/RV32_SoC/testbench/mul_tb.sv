`timescale 1ns/1ps

// Include the library file for `exe_p_mux_bus_type`
`include "lib.sv"

module FP_final_Multiplier_tb;

    // Parameters
    parameter addr_width = 5;
    parameter num_rds = 2;

    // Testbench signals
    logic clk;
    logic rst_n;
    logic en;
    logic [num_rds-1:0] clear;
    logic [31:0] a, b;
    logic [2:0] rm;
    logic P_signal;
    exe_p_mux_bus_type fmul_pipeline_signals_i;
    exe_p_mux_bus_type fmul_pipeline_signals_o;
    logic P_O_signal;
    logic [addr_width-1:0] uu_rd [0:num_rds-1];
    logic [num_rds-1:0] uu_reg_write;
    logic [num_rds-1:0] uu_FP_reg_write;
    logic [31:0] result;

    // Instantiate the DUT (Device Under Test)
    FP_final_Multiplier #(
        .addr_width(addr_width),
        .num_rds(num_rds)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .clear(clear),
        .a(a),
        .b(b),
        .rm(rm),
        .P_signal(P_signal),
        .fmul_pipeline_signals_i(fmul_pipeline_signals_i),
        .fmul_pipeline_signals_o(fmul_pipeline_signals_o),
        .P_O_signal(P_O_signal),
        .uu_rd(uu_rd),
        .uu_reg_write(uu_reg_write),
        .uu_FP_reg_write(uu_FP_reg_write),
        .result(result)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns clock period

    // Testbench procedure
    initial begin
        // Initialize signals
        clk = 0;
        rst_n = 0;
        en = 0;
        clear = 0;
        a = 0;
        b = 0;
        rm = 3'b000; // Default rounding mode (RNE)
        P_signal = 0;
        fmul_pipeline_signals_i = 'b0;

        // Reset the DUT
        #10;
        rst_n = 1;

        // Test Case 1: Normal multiplication
        #10;
        en = 1;
        a = 32'h3F800000; // 1.0 in IEEE 754
        b = 32'h40000000; // 2.0 in IEEE 754
        rm = 3'b000; // RNE
        #20;
        $display("Test Case 1: a=0x%h, b=0x%h, result=0x%h", a, b, result);

        // Test Case 2: Subnormal multiplication
        #10;
        a = 32'h00000001; // Smallest subnormal number
        b = 32'h3F800000; // 1.0 in IEEE 754
        #20;
        $display("Test Case 2: a=0x%h, b=0x%h, result=0x%h", a, b, result);

        // Test Case 3: NaN propagation
        #10;
        a = 32'h7FC00000; // Canonical NaN
        b = 32'h40000000; // 2.0 in IEEE 754
        #20;
        $display("Test Case 3: a=0x%h, b=0x%h, result=0x%h", a, b, result);

        // Test Case 4: Infinity multiplication
        #10;
        a = 32'h7F800000; // +Infinity
        b = 32'h3F800000; // 1.0 in IEEE 754
        #20;
        $display("Test Case 4: a=0x%h, b=0x%h, result=0x%h", a, b, result);

        // Test Case 5: Zero multiplication
        #10;
        a = 32'h00000000; // +0.0
        b = 32'h40000000; // 2.0 in IEEE 754
        #20;
        $display("Test Case 5: a=0x%h, b=0x%h, result=0x%h", a, b, result);

        // Test Case 6: Overflow
        #10;
        a = 32'h7F7FFFFF; // Largest finite number
        b = 32'h40000000; // 2.0 in IEEE 754
        #20;
        $display("Test Case 6: a=0x%h, b=0x%h, result=0x%h", a, b, result);

        // Test Case 7: Underflow
        #10;
        a = 32'h00000001; // Smallest subnormal number
        b = 32'h00000001; // Smallest subnormal number
        #20;
        $display("Test Case 7: a=0x%h, b=0x%h, result=0x%h", a, b, result);

        // End simulation
        #10;
        $finish;
    end

endmodule