module tbRegFile;
 reg clk, RegWrite;
 reg [4:0] rs, rt, rd;
 reg [31:0] dataIn;
 wire [31:0] Rs, Rt;

 RegFile uut1 (clk, RegWrite, rs, rt, rd, dataIn, Rs, Rt);

 always
 begin
 clk = ~clk;#1;
 end

 initial
 begin
 clk = 0;
 rs = 0; rt = 3; rd = 3;
 RegWrite = 0; # 4;
 dataIn = 45;
 RegWrite = 1; # 4;
 $finish;
 end

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars;
 end

endmodule