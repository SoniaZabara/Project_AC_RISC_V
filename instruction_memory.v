module instruction_memory( //the place where the code is stored
    input   [$clog2(MEM_SIZE)-1:0]  addr,
    output  [DATA_LENGTH-1:0]       dout
    );

    parameter 	DATA_LENGTH  = 32;
    parameter 	MEM_SIZE     = 256; // HINT Memory has only 256 bytes!
    
    reg [DATA_LENGTH / 4 -1:0] mem [0:MEM_SIZE * 4 -1];

    // read operation behavior
    assign dout = { mem[addr+3], mem[addr+2], mem[addr+1], mem[addr] };// HINT Memory provides 32 bits = 4 bytes = 4 locations/addresses
   
    // memory content initialization from file
    initial begin
        $readmemh( "memory_code.mem", mem);
    end
    
endmodule