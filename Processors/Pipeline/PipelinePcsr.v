module PipelinePcsr(clk, rst, overflow);
  input clk, rst;
  output overflow;
  
  wire zeroFlag, PCSrc;
  wire[31:0] PCin, PCout;
  wire[31:0] instr, Rs, Rt;
  wire[63:0] IFin, IFout;
  wire[143:0] IDin, IDout;
  wire[101:0] EXin, EXout;
  wire[68:0] MEMin, MEMout;
  wire[31:0] rdataIn;
  wire RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
  wire[3:0] ALUInp;
  wire[1:0] ALUOp;
  wire [31:0] ALUOut, opnd2;
  wire[4:0] wbAddress;
  wire[31:0] memOut;
  
  assign PCSrc = Branch & zeroFlag; 
  //mux for PCin (PCSrc)
  assign PCin = PCSrc ? EXout[101:70] : (PCout + 1);
  PC pcUt(clk, rst, PCin, PCout);
  
  InstrMem iMemUt(PCout[4:0], instr);
  
  //mux for dataIn (MemtoReg)
  assign rdataIn = MemtoReg ? MEMout[68:37]: MEMout[36:5];
  RegFile rFileUt(clk, RegWrite, IFout[25:21], IFout[20:16], MEMout[4:0], rdataIn, Rs, Rt);
  
  ALUControl aluCUt(IDout[5:0], ALUOp, ALUInp);
  
  //ALUSrc Mux
  assign opnd2 = ALUSrc ? IDout[47:16]: IDout[79:48];
  ALU aluUt(ALUInp, IDout[111:80], opnd2, ALUOut, zeroFlag, overflow);
  
  DataMem dmemUt(MemWrite,MemRead,clk,EXout[36:5],EXout[42:37],memOut);
  
  assign IFin = {PCout,instr};
  assign IDin = {IFout[63:32], Rs, Rt, {{15{IFout[15]}},IFout[15:0]}, IFout[20:16], IFout[15:11], IFout[31:26]};
  //RegDst Mux
  assign wbAddress = RegDst ? IDout[10:6] : IDout[15:11];
  assign EXin = {(PCout + IDout[47:16]), zeroFlag, ALUOut, IDout[79:48], wbAddress};
  assign MEMin = {memOut, EXout[68:37], EXout[4:0]};
  Registers tregsUt(clk, IFin, IFout, IDin, IDout, EXin, EXout, MEMin, MEMout);
  
  Control cuUt(IFout[31:26],ALUOp,RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite);
  
endmodule