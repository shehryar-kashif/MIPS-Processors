module tbDataMem;
 reg wen,readEn,clk;
 reg [31:0] dataIn;
 reg [9:0] address;
 wire [31:0] dataOut;

 DataMem uut1(wen,readEn,clk,dataIn,address,dataOut);

 always
 begin
 clk = ~clk;#0.5;
 end

 initial
 begin
 clk = 0; dataIn = 23; address = 1; wen = 1;#1;
 dataIn = 45; address = 2;#1;
 dataIn = 69; address = 3;#1;
 address = 1; readEn = 1; wen = 0;#1;
 address = 2;#1;
 $finish;
 end

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars;
 end
endmodule