module tbPC;
 reg clk, rst, PCWrite;
 reg [31:0] PCin;
 wire [31:0] PCOut;

 PC uut1 (clk, rst, PCin, PCWrite, PCOut);

 always
 begin
 clk = ~clk;#1;
 end

 initial
 begin
 clk = 0;
 rst = 1;#4;
 rst = 0; PCin = 1; PCWrite = 0;#2;
 PCWrite = 1;#2;
 PCin = 2;#2;
 PCin = 3;#2;
 $finish;
 end

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars;
 end

endmodule