module InstrMem(address, instr);
 parameter Depth = 512;
 parameter addBits = 10;
 input [addBits-1 : 0] address;
 output reg [31:0] instr;

 reg [31:0] Memory [Depth-1 : 0];

 initial
 begin
 $readmemb("InstrMem.txt", Memory, 0, 199);
 end

 always @ (address)
 begin
 instr <= Memory[address];
 end

endmodule