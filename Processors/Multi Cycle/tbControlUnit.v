module tbControlUnit;
 reg clk, rst;
 reg [5:0] opcode;
 wire RegDst, RegWrite, MemRead, MemWrite, MemtoReg, IorD, IRWrite, AluSrcA, PCWrite, PCWriteCond;
 wire [1:0] ALUSrcB, ALUOp, PCSource;

 ControlUnit uut1 (clk, rst, opcode, RegDst, RegWrite, MemRead, MemWrite, MemtoReg, IorD, IRWrite, ALUSrcA, ALUSrcB, ALUOp, PCWrite, PCWriteCond, PCSource);

 always
 begin
 clk = ~clk;#1;
 end

 initial
 begin
 clk = 1; rst = 1; #4
 rst = 0;
 //rtype
 opcode = 0; #8;
 opcode = 1; #8;
 opcode = 2; #8;
 opcode = 3; #8;
 opcode = 4; #8;
 //itype
 opcode = 5; #8;
 opcode = 6; #8;
 opcode = 7; #8;
 opcode = 8; #8;
 opcode = 9; #8;
 //lwsw
 opcode = 10; #10;
 opcode = 11; #8;
 //beq 
 opcode = 12; #6;
 //j
 opcode = 13; #6;
 $finish;
 end

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars;
 end

endmodule