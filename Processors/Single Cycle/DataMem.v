module DataMem(wen,readEn,clk,dataIn,address,dataOut);
 parameter Depth = 512;
 parameter addBits = 10;
 input wen,readEn,clk;
 input [31:0] dataIn;
 input [addBits-1:0] address;
 output reg [31:0] dataOut;

 reg [31:0] Memory [Depth-1:0];

 always @ (posedge clk)
 begin
 if (wen == 1)
 Memory[address] <= dataIn;
 end

 always @ (*)
 begin
 if (readEn == 1)
 dataOut <= Memory[address];
 end

endmodule
