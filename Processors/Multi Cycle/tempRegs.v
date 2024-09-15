module tempRegs(clk, IRWrite, IRin, IRout, MDRin, MDRout, Ain, Aout, Bin, Bout, ALUin, ALUout);
 input clk, IRWrite;
 input [31:0] IRin, MDRin, Ain, Bin, ALUin;
 output reg [31:0] IRout, Aout, Bout, MDRout, ALUout;

 always @(posedge clk)
 begin
 ALUout <= ALUin;
 Aout <= Ain;
 Bout <= Bin;
 MDRout <= MDRin;
 if (IRWrite)
 IRout <= IRin;
 end

endmodule
