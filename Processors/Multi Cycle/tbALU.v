module tbALU;
 reg [3:0] opcode;
 reg [31:0] opnd1, opnd2;
 reg [31:0] out;
 wire zeroFlag;
 wire overflow;

 ALU uut1(opcode, opnd1, opnd2, out, zeroFlag, overflow);

 initial
 begin
 opnd1 = 34; opnd2 = 34;
 opcode = 0;#3;
 opcode = 1;#3;
 opnd2 = 45;#3;
 opcode = 2;#3;
 opcode = 3;#3;
 opcode = 4;#3;
 $finish;
 end

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars;
 end

endmodule