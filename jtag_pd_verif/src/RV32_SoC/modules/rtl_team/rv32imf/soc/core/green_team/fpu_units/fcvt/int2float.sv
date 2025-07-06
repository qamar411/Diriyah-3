module int2float ( // FCVT.S.WU
    input  logic [31:0] integerIN,
    input  logic [2:0] rm,
    output logic [31:0] result
);
    logic [7:0] exp;
    logic valid;
    logic [22:0] man;
    logic [4:0] msb_idx;  // Store MSB index
    logic [53:0] IU;
    logic lead;
    logic [11:0] grs;
    logic [31:0] temp_result;
    logic G,R,S;
    assign G = grs[11];
    assign R = grs[10];
    assign S = |grs[9:0];
    assign IU = {23'b0,integerIN}; // Extend integer with zeros for shifting

    always_comb begin 
        grs = 12'd0;
        // Check from MSB down using if-else conditions
        if (integerIN[31]) begin msb_idx = 5'd31; valid = 1'b1; end
        else if (integerIN[30]) begin msb_idx = 5'd30; valid = 1'b1; end
        else if (integerIN[29]) begin msb_idx = 5'd29; valid = 1'b1; end
        else if (integerIN[28]) begin msb_idx = 5'd28; valid = 1'b1; end
        else if (integerIN[27]) begin msb_idx = 5'd27; valid = 1'b1; end
        else if (integerIN[26]) begin msb_idx = 5'd26; valid = 1'b1; end
        else if (integerIN[25]) begin msb_idx = 5'd25; valid = 1'b1; end
        else if (integerIN[24]) begin msb_idx = 5'd24; valid = 1'b1; end
        else if (integerIN[23]) begin msb_idx = 5'd23; valid = 1'b1; end
        else if (integerIN[22]) begin msb_idx = 5'd22; valid = 1'b1; end
        else if (integerIN[21]) begin msb_idx = 5'd21; valid = 1'b1; end
        else if (integerIN[20]) begin msb_idx = 5'd20; valid = 1'b1; end
        else if (integerIN[19]) begin msb_idx = 5'd19; valid = 1'b1; end
        else if (integerIN[18]) begin msb_idx = 5'd18; valid = 1'b1; end
        else if (integerIN[17]) begin msb_idx = 5'd17; valid = 1'b1; end
        else if (integerIN[16]) begin msb_idx = 5'd16; valid = 1'b1; end
        else if (integerIN[15]) begin msb_idx = 5'd15; valid = 1'b1; end
        else if (integerIN[14]) begin msb_idx = 5'd14; valid = 1'b1; end
        else if (integerIN[13]) begin msb_idx = 5'd13; valid = 1'b1; end
        else if (integerIN[12]) begin msb_idx = 5'd12; valid = 1'b1; end
        else if (integerIN[11]) begin msb_idx = 5'd11; valid = 1'b1; end
        else if (integerIN[10]) begin msb_idx = 5'd10; valid = 1'b1; end
        else if (integerIN[9])  begin msb_idx = 5'd9; valid = 1'b1; end
        else if (integerIN[8])  begin msb_idx = 5'd8; valid = 1'b1; end
        else if (integerIN[7])  begin msb_idx = 5'd7; valid = 1'b1; end
        else if (integerIN[6])  begin msb_idx = 5'd6; valid = 1'b1; end
        else if (integerIN[5])  begin msb_idx = 5'd5; valid = 1'b1; end
        else if (integerIN[4])  begin msb_idx = 5'd4; valid = 1'b1; end
        else if (integerIN[3])  begin msb_idx = 5'd3; valid = 1'b1; end
        else if (integerIN[2])  begin msb_idx = 5'd2; valid = 1'b1; end
        else if (integerIN[1])  begin msb_idx = 5'd1; valid = 1'b1; end
        else if (integerIN[0])  begin msb_idx = 5'd0; valid = 1'b1; end
        else begin msb_idx = 5'd0; valid = 1'b0; end

        // Compute IEEE 754 floating point representation if valid
        if (valid) begin
            exp = {4'd0, msb_idx} + 8'd127; // Compute exponent
            {lead,man,grs} = IU << (35 - msb_idx);   // Normalize fraction
            temp_result = {1'b0, exp, man};
            case (rm)
                3'b000: begin // **RNE: Round to Nearest, Ties to Even**
                    if (G) begin
                        if (R || S || man[0]) begin
                            result = temp_result + 1; // Round up
                        end else begin
                            result = temp_result; // Keep as is
                        end
                    end else begin
                        result = temp_result; // No rounding needed
                    end
                end

                3'b001: begin // **RTZ: Round Toward Zero (Truncate)**
                    result = temp_result;
                end

                3'b010: begin // **RDN: Round Down (-∞)**
                    result = temp_result; // Same as RTZ for unsigned integers
                end

                3'b011: begin // **RUP: Round Up (+∞)**
                    if (G || R || S) begin
                        result = temp_result + 1; // Round up
                    end else begin
                        result = temp_result;
                    end
                end


                3'b100: begin
                    if (G) begin
                        result = temp_result + 1;
                    end
                    else
                        result = temp_result;
                end
                default : 
                begin 
                        result = temp_result;
                end
                endcase
        end
        else begin
            result = 32'd0; // Return 0 if input is 0
        end
    end

endmodule
