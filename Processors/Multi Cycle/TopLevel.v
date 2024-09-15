module multicycle(clk, rst, overflow, zeroFlag);
 input clk, rst;
 output overflow, zeroFlag;
 wire PCWrite, RegDst, RegWrite, MemRead,MemWrite, MemtoReg, IorD, IRWrite, ALUSrcA,PCWriteCond;
 wire [2:0] ALUSrcB, ALUOp, PCSource;

 wire [31:0] PCOut;
 reg [31:0] PCin;
 wire [4:0] address;

 wire [31:0] dataOut;
 wire [31:0] ALUout;

 wire [4:0] rd;
 wire [31:0] dataIn, Rs, Rt;

 wire [3:0] ALUInp;
 wire [31:0] opnd1, opnd2;
 wire [31:0] out; //ALU's output

 wire [31:0] Aout, Bout, MDRout, IRout;

 ControlUnit cuUT(clk, rst, dataOut[31:26], RegDst, RegWrite, MemRead, MemWrite, MemtoReg, IorD, IRWrite, ALUSrcA, ALUSrcB, ALUOp, PCWrite, PCWriteCond, PCSource);

 //PCSource Mux
 always @ (*)
 begin
 if (PCSource == 0)
 PCin <= out; //PC + 1
 else if (PCSource == 1)
 PCin <= ALUout; //PC = branch
 else if (PCSource == 2)
 PCin <= {PCOut[31:27], {2{dataOut[25]}}, dataOut[25:0]}; // PC = jumo address
 end

 PC pcUT(clk, rst, PCin, PCWrite, PCOut);

 //IorD Mux
 assign address = IorD ? ALUout : PCOut;
 Memory memUT(clk, MemRead, MemWrite, address, Bout, dataOut);

 //RegDst mux
 assign rd = RegDst ? dataOut[15:11] : dataOut[20:16];
 //MemtoReg mux
 assign dataIn = MemtoReg ? MDRout : ALUout;
 
 RegFile rFileUT(clk, RegWrite, dataOut[25:21], dataOut[20:16], rd, dataIn, Rs, Rt);

 ALUControl aluCUT(dataOut[31:26], ALUOp, ALUInp);

 //ALUSrcA and ALUSrcB muxes
 assign opnd1 = ALUSrcA ? Aout : PCOut;
 assign opnd2 = ALUSrcB[1] ? (ALUSrcB[0] ? {{15{dataOut[15]}}, dataOut[15:0]} << 2 : {{15{dataOut[15]}}, dataOut[15:0]}) : (ALUSrcB[0] ? 32'd1 : Bout);
 
 ALU aluUT(ALUInp, opnd1, opnd2, out, zeroFlag, overflow);

 tempRegs tRegUT(clk, IRWrite, dataOut, IRout, dataOut, MDRout, Rs, Aout, Rt, Bout, out, ALUout);

endmodule