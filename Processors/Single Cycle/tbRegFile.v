module tbRegFile;
 reg clk,rst,wen;
 reg [4:0] rs,rt,rd;
 reg [31:0] Rd;
 wire [31:0]Rs, Rt;

 RegFile uut1(rs,rt,rd,Rs,Rt,Rd,clk,rst,wen);

 always
 begin
 clk = ~clk; #1;
 end

 initial
 begin
 clk = 0; rst = 1; #3;
 rst = 0; rs = 5'd2; rt = 5'd3; rd = 5'd10; Rd =20; wen = 0;#3;
 wen = 1;#3;
 wen = 0; rs = 5'd10;#3;
 $finish;
 end

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars;
 end
endmodule 