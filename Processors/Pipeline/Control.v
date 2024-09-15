module Control(opcode,ALUOp,RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite); 
  input [5:0] opcode;
  output reg [1:0] ALUOp;
  output reg RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite; 
   
  always @ (*) 
    begin 
      if (opcode >=0 && opcode <=4)  //r-type 
        begin        
          RegDst<=1; Branch<=0; MemRead<=0; MemtoReg<=0; MemWrite<=0; ALUSrc<=0; RegWrite<=1; ALUOp<=2;
        end 
      else if (opcode >=5 && opcode <=9)  //i-type 
        begin 
          RegDst<=0; Branch<=0; MemRead<=0; MemtoReg<=0; MemWrite<=0; ALUSrc<=1; RegWrite<=1; ALUOp <= 2; 
        end 
      else if (opcode == 10) //lw 
        begin 
          RegDst<=0; Branch<=0; MemRead<=1; MemtoReg<=0; MemWrite<=0; ALUSrc<=1; RegWrite<=1; ALUOp<=0;
        end 
      else if (opcode == 11)  //sw 
        begin 
          RegDst<=0; Branch<=0; MemRead<=0; MemtoReg<=0; MemWrite<=1; ALUSrc<=1; RegWrite<=0; ALUOp<=0; 
        end 
      else if (opcode == 12)  //branch 
        begin 
         RegDst<=0; Branch<=1; MemRead<=0; MemtoReg<=0; MemWrite<=0; ALUSrc<=0; RegWrite<=0; ALUOp<=1; 
        end  
    end 
endmodule