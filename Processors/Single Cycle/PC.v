module
PC(clk,rst,pcSrc,jump,zFlag,Baddress,Jaddress,PCOut);
 input clk,rst,pcSrc,jump,zFlag;
 input [15:0] Baddress;
 input [25:0] Jaddress;
 output reg [31:0] PCOut;

 always @(posedge clk)
 begin
 if (rst == 1)
 PCOut <= 0;
 else
 begin
 if (pcSrc == 1 && zFlag == 1)
 PCOut <= PCOut + {{16{Baddress[15]}},Baddress[15:0]};
 else if (jump == 1)
 PCOut <= {PCOut[31:28], {2{Jaddress[25]}}, Jaddress};
 else
 PCOut <= PCOut + 1;
 end
 end
endmodule