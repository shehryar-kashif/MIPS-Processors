module tbPC;
 reg clk,rst,pcSrc,jump,zFlag;
 reg [31:0] Baddress;
 reg [25:0] Jaddress;
 wire [31:0] PCOut;

 PC uut1(clk,rst,pcSrc,jump,zFlag,Baddress,Jaddress,PCOut);

 always
 begin
 clk = ~clk;#2;
 end

 initial
 begin
 clk = 0; rst = 1;#4;
 rst = 0;#8;
 pcSrc = 1; Baddress = 26; zFlag = 0;#4;
 zFlag = 1;#4;
 pcSrc = 0; Jaddress = 10; jump = 1;#20;
 $finish;
 end

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars;
 end
endmodule