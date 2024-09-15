module tbMemory;
 reg clk, memRead, memWrite;
 reg [4:0] address;
 reg [31:0] dataIn;
 wire [31:0] dataOut;

 Memory uut1(clk, memRead, memWrite, address, dataIn, dataOut);

 always
 begin
 clk = ~clk; #1;
 end

 initial
 begin
 clk = 0;
 memRead = 0; memWrite = 0;#4;
 memWrite = 1; address = 23; dataIn = 456;#4;
 memRead = 1; memWrite = 0; address = 23;#4;
 $finish;
 end

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars;
 end
endmodule
