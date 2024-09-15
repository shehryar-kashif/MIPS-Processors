module tbALUControl;
 reg [5:0] opcode;
 reg [1:0] ALUOp;
 wire [3:0] ALUInp;

 ALUControl uut1 (opcode, ALUOp, ALUInp);

 initial
 begin
 opcode = 0;
 ALUOp = 0;#4;
 ALUOp = 1;#4;
 ALUOp = 2;#4;
 opcode = 1;#1;
 opcode = 2;#1;
 opcode = 3;#1;
 opcode = 4;#1;
 opcode = 5;#1;
 opcode = 6;#1;
 opcode = 7;#1;
 opcode = 8;#1;
 opcode = 9;#1;
 ALUOp = 3;#4;
 $finish;
 end

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars;
 end

endmodule