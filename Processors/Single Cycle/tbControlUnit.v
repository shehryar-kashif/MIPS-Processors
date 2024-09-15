module tbControlUnit;
 reg [5:0] opcode;
 wire RegDst,jump,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite; 

 Control uut1(opcode,RegDst,jump,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite);

 initial
 begin
 opcode = 6'd1;#1;
 opcode = 6'd2;#1;
 opcode = 6'd3;#1;
 opcode = 6'd4;#1;
 opcode = 6'd5;#1;
 opcode = 6'd6;#1;
 opcode = 6'd7;#1;
 opcode = 6'd8;#1;
 opcode = 6'd9;#1;
 opcode = 6'd10;#1;
 opcode = 6'd11;#1;
 opcode = 6'd12;#1;
 opcode = 6'd13;#1;
 opcode = 6'd14;#1;
 opcode = 6'd15;#1;
 opcode = 6'd16;#1;
 opcode = 6'd17;#1;
 opcode = 6'd18;#1;
 $finish;
 end

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars;
 end
endmodule