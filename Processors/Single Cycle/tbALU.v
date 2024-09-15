module tbALU;
 reg [5:0] opcode;
 reg [31:0] opnd1, opnd2;
 wire [31:0] out;
 wire zeroFlag;
 wire overflow;

 ALU uut1(opcode, opnd1, opnd2, out, zeroFlag, overflow);

 initial
 begin
 opnd1 = 100; opnd2 = 500; opcode = 0;#2;
 opcode = 1;#2;
 opcode = 2;#2;
 opcode = 3;#2;
 opcode = 4;#2;
 opcode = 5;#2;
 opcode = 6;#2;
 opcode = 7;#2;
 opcode = 8;#2;
 opcode = 9;#2;
 opcode = 10;#2;
 opcode = 11;#2;
 opcode = 12;#2;
 opcode = 13;#2;
 opcode = 14;#2;
 opcode = 15;#2;
 opcode = 16;#2;
 opcode = 17;#2;

 $finish;
 end

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars;
 end
endmodule