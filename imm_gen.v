module imm_gen(
    input   [31:0] din,
    output  reg [31:0] dout
    );
    
    always@(din) begin
        case(din[6:0])
            7'b0000011,
            7'b0001111,
            7'b0011011,
            7'b1100111,
            7'b1110011,
            7'b0010011: dout = { {20{din[31]}}, din[31:20]}; //I format
            7'b0100011: dout = { {20{din[31]}}, din[31:25], din[11:7]}; //S format
            7'b1100011: dout = { {20{din[31]}}, din[7], din[30:25], din[11:8], 1'b0}; //SB format        
            7'b1101111: dout = { {12{din[31]}}, din[19:12], din[20], din[30:25], din[11:8], 1'b0}; //UJ format           
            7'b0010111,
            7'b0110111: dout = { din[31:12], {12{1'b0}}}; //U format
            default:
                dout = 32'h0000_0000;
        endcase
    end
endmodule