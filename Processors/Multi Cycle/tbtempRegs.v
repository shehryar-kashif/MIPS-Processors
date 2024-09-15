module tbtempRegs;
 reg clk, IRWrite;
 reg [31:0] IRin, MDRin, Ain, Bin, ALUin;
 wire [31:0] IRout, Aout, Bout, MDRout, ALUout;
 tempRegs uut1(clk, IRWrite, IRin, IRout, MDRin, MDRout, Ain, Aout, Bin, Bout, ALUin, ALUout);
 always
 begin
 clk = ~clk;#1;
 end

 initial
 begin
 clk = 1;
 IRWrite = 0;
 IRin = 34;#3;
 IRWrite = 1;
 Ain = 45;#4;
 Bin = 56;#2;
 ALUin = 67;#2;
 MDRin = 78;#2;
 $finish;
 end

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars;
 end

endmodule