module Control(opcode,RegDst,jump,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite);
 input [5:0] opcode;
 output reg RegDst,jump,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite; 

always @ (opcode)
 begin
 if (opcode >=0 && opcode <=6) //r-type
 begin
	RegDst<=1;jump<=0;Branch<=0;MemRead<=0;MemtoReg<=0;MemWrite<=0;ALUSrc<=0;RegWrite<=1;
 end
 else if (opcode >=7 && opcode <=13) //i-type
 begin
	RegDst<=0;jump<=0;Branch<=0;MemRead<=0;MemtoReg<=0;MemWrite<=0;ALUSrc<=1;RegWrite<=1;
 end
 else if (opcode == 14) //lw
 begin
	RegDst<=0;jump<=0;Branch<=0;MemRead<=1;MemtoReg<=1;MemWrite<=0;ALUSrc<=1;RegWrite<=1;
 end
 else if (opcode == 15) //sw
 begin
	RegDst<=0;jump<=0;Branch<=0;MemRead<=0;MemtoReg<=0;MemWrite<=1;ALUSrc<=1;RegWrite<=0;
 end
 else if (opcode == 16) //branch
 begin
	jump<=0;Branch<=1;MemWrite<=0;ALUSrc<=0;RegWrite<=0;
 end
 else if (opcode == 17) //jump
 begin
 	jump<=1;Branch<=0;MemWrite<=0;RegWrite<=0;
 end
 end
endmodule