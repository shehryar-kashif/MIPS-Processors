//32 memory locations, each of 32 bits
module Memory(clk, memRead, memWrite, address, dataIn, dataOut);
 input clk, memRead, memWrite;
 input [4:0] address;
 input [31:0] dataIn;
 output reg [31:0] dataOut;

 reg [31:0] memory [31:0];

 initial
 begin
 $readmemb("InstrMem.txt", memory, 0, 31);
 end

 always @ (posedge clk)
 begin
 if (memWrite)
 memory[address] <= dataIn;
 end

 always @ (*)
 begin
 if (memRead)
 dataOut <= memory[address];
 end
endmodule