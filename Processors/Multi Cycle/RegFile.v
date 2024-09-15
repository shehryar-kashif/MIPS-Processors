module RegFile(clk, RegWrite, rs, rt, rd, dataIn,Rs, Rt);
 input clk, RegWrite;
 input [4:0] rs, rt, rd;
 input [31:0] dataIn;
 output reg [31:0] Rs, Rt;

 reg [31:0] regFile [31:0];

 initial
 begin
 $readmemh("RegFile.txt", regFile, 0, 31);
 end

 always @ (posedge clk)
 begin
 if (RegWrite)
 regFile[rd] <= dataIn;
 end

 always @ (*)
 begin
 Rs <= regFile[rs];
 Rt <= regFile[rt];
 end
endmodule