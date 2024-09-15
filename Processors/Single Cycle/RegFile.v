module RegFile(rs,rt,rd,Rs,Rt,Rd,clk,rst,wen);
 input clk,rst,wen;
 input [4:0] rs,rt,rd;
 input [31:0] Rd;
 output reg [31:0] Rs,Rt;

 reg [31:0] regFile [31:0];

 always@(posedge clk)
 begin
     if (rst == 1)
     begin
       $readmemh("RegFile.txt", regFile, 0, 31);
     end
     else 
     begin
       if (wen == 1)
         regFile[rd] <= Rd;
     end
 end

 always @ (rs,rt)
 begin
 Rs <= regFile[rs];
 Rt <= regFile[rt];
 end

endmodule
