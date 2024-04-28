module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] ctrl,
    
    output reg [31:0] r,
    output zero
);

    always @(a or b or ctrl) begin
        case(ctrl)
            4'b0000: r = a & b;
            4'b0001: r = a | b;
            4'b0010: r = a + b;
            4'b0110: r = a - b;
            4'b0011: r = a ^ b; //xor
            default:
                r = 32'hFFFF_FFFF;
        endcase
    end
    
    assign zero = ~(|r);
    
endmodule
