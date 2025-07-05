// `define DV_DEBUG  // for RTL: uncomment it to use

module program_counter #(
    parameter MAX_LIMIT = 800 // ignored in the current implementation
)(
    input logic clk, 
    input logic reset_n, 
    input logic en,
    input logic [31:0] next_pc_if1, 
    output logic [31:0] current_pc_if1
);

    always_ff @(posedge clk, negedge reset_n) 
    begin 
        if(~reset_n)
	   `ifdef DV
		    current_pc_if1 <= 32'h80000000; // base address of inst mem (Verification)
       `elsif DV_DEBUG
            current_pc_if1 <= 32'h80000000; // base address of inst mem (Verification)
       `elsif VIVADO_SIM
            current_pc_if1 <= 32'h80000000; // base address of inst mem (Verification)
       `else
            current_pc_if1 <= 32'hfffff000; // base address of boot rom (RTL & Physical)
	   `endif
        else if (en)
            current_pc_if1 <=  next_pc_if1;
    end
    
endmodule
