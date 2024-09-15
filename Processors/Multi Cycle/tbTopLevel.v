module tbMultiCycle;
 reg clk, rst;
 wire overflow, zeroFlag;

 multicycle pcsrUT(clk, rst, overflow, zeroFlag);

 always
 begin
 clk = ~clk;#1;
 end

 initial
 begin
 clk = 1;#1;
 rst = 1; #4;
 rst = 0;#70;
 $finish;
 end

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars;
 end

endmodule 