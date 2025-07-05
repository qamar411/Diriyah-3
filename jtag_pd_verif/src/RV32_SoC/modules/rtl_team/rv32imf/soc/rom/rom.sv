module rom (
    input  logic [11:0] addr,
    output logic [31:0] inst
);
    logic [31:0] rom [0:255];

    initial begin
        $readmemh("rom.mem", rom);
    end

    assign inst = rom[addr >> 2];
endmodule