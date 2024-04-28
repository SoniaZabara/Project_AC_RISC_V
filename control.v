module control(
    input [6:0] opcode,
    output reg ALUSrc,   
    output reg MemToReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg [1:0] ALUOp    
);

    always@(opcode) begin
        case(opcode)
            7'b0111011,
            7'b0110011: {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 8'b0_0_1_0_0_0_10;  // R
            7'b0000011: {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 8'b1_1_1_1_0_0_00;  // lw
            7'b0100011: {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 8'b1_x_0_0_1_0_00;  // sw
            7'b1100011: {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 8'b0_x_0_0_0_1_01;  // beq
            
            default:
                {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 8'b0_0_0_0_0_0_00;
        endcase
    end
    
endmodule