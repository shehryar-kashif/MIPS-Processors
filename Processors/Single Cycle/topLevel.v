module Processor(clk,rst,overflow,zeroFlag);
 input clk, rst;
 output overflow, zeroFlag;

 wire [31:0] ALUOut;
 wire [31:0] PCOut;
 wire [31:0] instr;
 wireb RegDst,jump,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
 wire [31:0] dataOut;
 wire [31:0] Rs,Rt;

 PC pc(clk,rst,Branch,jump,zeroFlag,instr[15:0],instr[25:0],PCOut);

 InstrMem iR(PCOut[9:0], instr);
 always @ (instr)
 begin
 $display("%b",instr);
 end
 
 Control cu(instr[31:26],RegDst,jump,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite);

 reg [4:0] rd_;
 reg [31:0] Rd_;

 always @ (*)
 begin
 if (RegDst == 0)
 rd_ <= instr[20:16];
 else
 rd_ <= instr[15:11];
 end

 always @ (*)
 begin
 if (MemtoReg == 1)
 Rd_ <= dataOut;
 else
 Rd_ <= ALUOut;
 end

 wire [4:0] rd;
 wire [31:0] Rd;
 assign rd = rd_;
 assign Rd = Rd_;

 RegFile regs(instr[25:21],instr[20:16],rd,Rs,Rt,Rd,clk,rst,RegWrite);

 reg [31:0] opnd2_;
 always @ (*)
 begin
 if (ALUSrc == 1)
 opnd2_ <= {{16{instr[15]}}, instr[15:0]};
 else
 opnd2_ <= Rt;
 end
 wire [31:0] opnd2;
 assign opnd2 = opnd2_;

 ALU alu(instr[31:26],Rs, opnd2, ALUOut, zeroFlag, overflow); 

 DataMem dmem(MemWrite,MemRead,clk,Rt,ALUOut[9:0],dataOut);

endmodule 