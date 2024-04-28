module alu_control(
    input [1:0] ALUOp,
    input [6:0] funct7,
    input [2:0] funct3,
    
    output reg [3:0] alu_ctrl
);

    always @(ALUOp or funct7 or funct3) begin
        casex({ALUOp, funct7, funct3})
            12'b00_xxxxxxx_xxx: alu_ctrl = 4'b0010; // lw sw
            12'b01_xxxxxxx_xxx: alu_ctrl = 4'b0110; // beq
            
            12'b10_0000000_000: alu_ctrl = 4'b0010; // add
            12'b10_0100000_000: alu_ctrl = 4'b0110; // sub            
            12'b10_0000000_111: alu_ctrl = 4'b0000; // and
            12'b10_0000000_110: alu_ctrl = 4'b0001; // or
            
            default:
                alu_ctrl = 4'b0000;
        endcase
    end    
endmodule