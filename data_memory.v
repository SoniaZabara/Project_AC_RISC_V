module data_memory(
    input   clk,
    input   wen,
    input   [$clog2(MEM_SIZE)-1:0]  addr,
    input   [DATA_LENGTH-1:0]       din,
    output  [DATA_LENGTH-1:0]       dout
    );

    parameter 	DATA_LENGTH  = 32;
    parameter 	MEM_SIZE     = 256;  // HINT Memory has only 256 bytes!
    
    reg [DATA_LENGTH / 4 - 1:0] mem [0:MEM_SIZE * 4 - 1];

    // read operation behavior
    assign dout = { mem[addr+3], mem[addr+2], mem[addr+1], mem[addr] }; // HINT Memory provides 32 bits = 4 bytes = 4 locations/addresses
    
    // write operation behavior
    always @(posedge clk) begin
        if (wen == 1) begin
            { mem[addr+3], mem[addr+2], mem[addr+1], mem[addr] } <= din; // HINT Memory reveives 32 bits = 4 bytes = 4 locations/addresses
        end
    end
    
    // memory content initialization from file
    initial begin
        $readmemh( "memory_data.mem", mem);
    end
    
endmodule