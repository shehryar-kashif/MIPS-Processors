module ALUControl(opcode, ALUOp, ALUInp);
 input [5:0] opcode;
 input [1:0] ALUOp;
 output reg [3:0] ALUInp;

 always @ (*)
 begin
 case(ALUOp)
 2'b00: ALUInp <= 4'b0000;
 2'b01: ALUInp <= 4'b0001;
 2'b10:
 begin 
 if (opcode == 0 || opcode == 5) //add & addi
 ALUInp <= 4'b0000;
 else if (opcode == 1 || opcode == 6) //sub & subi
 ALUInp <= 4'b0001;
 else if (opcode == 2 || opcode == 7) //mul & muli
 ALUInp <= 4'b0010;
 else if (opcode == 3 || opcode == 8) //and & andi
 ALUInp <= 4'b0011;
 else if (opcode == 4 || opcode == 9) //or & ori
 ALUInp <= 4'b0100;
 else
 ALUInp <= 4'b0000;
 end
 default: ALUInp <= 4'b0000;
 endcase
 end

endmodule
