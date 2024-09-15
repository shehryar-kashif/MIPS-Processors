module ControlUnit (clk, rst, opcode, RegDst, RegWrite, MemRead, MemWrite, MemtoReg, IorD, IRWrite, ALUSrcA, ALUSrcB, ALUOp, PCWrite, PCWriteCond, PCSource);
 input clk, rst;
 input [5:0] opcode;
 output reg RegDst, RegWrite, MemRead, MemWrite, MemtoReg, IorD, IRWrite, ALUSrcA, PCWrite, PCWriteCond;
 output reg [1:0] ALUSrcB, ALUOp, PCSource;

 reg [3:0] CurrentState;

 parameter FETCH = 4'b0000;
 parameter DECODE = 4'b0001;
 parameter BRANCH = 4'b0010;
 parameter JUMP = 4'b0011;
 parameter R_TYPE_1 = 4'b0100;
 parameter R_TYPE_2 = 4'b0101;
 parameter LW_SW = 4'b0110;
 parameter SW_2 = 4'b0111;
 parameter LW_2 = 4'b1000;
 parameter LW_3 = 4'b1001;
 parameter I_TYPE_1 = 4'b1010;
 parameter I_TYPE_2 = 4'b1011;

 //Block to change Current State
 always @ (posedge clk)
 begin
 if (rst)
 CurrentState <= FETCH;
 else
 begin
 case (CurrentState)
 FETCH: CurrentState <= DECODE;
 DECODE:
 begin
 if (opcode >=0 && opcode <=4)
 CurrentState <= R_TYPE_1;
 else if (opcode >=5 && opcode <=9)
 CurrentState <= I_TYPE_1;
 else if (opcode == 12)
 CurrentState <= BRANCH;
 else if (opcode == 13)
 CurrentState <= JUMP;
 else if (opcode == 10 || opcode == 11)
 CurrentState <= LW_SW;
 end
 R_TYPE_1: CurrentState <= R_TYPE_2;
 R_TYPE_2: CurrentState <= FETCH;
 I_TYPE_1: CurrentState <= I_TYPE_2;
 I_TYPE_2: CurrentState <= FETCH;
 BRANCH: CurrentState <= FETCH;
 JUMP: CurrentState <= FETCH;
 LW_SW:
 begin
 case (opcode)
 6'd10: CurrentState <= LW_2;
 6'd11: CurrentState <= SW_2;
 endcase
 end
 SW_2: CurrentState <= FETCH;
 LW_2: CurrentState <= LW_3;
 LW_3: CurrentState <= FETCH;
 endcase
 end
 end

 //Block to change signals on the basis of current state
 always @ (CurrentState)
 begin
 case (CurrentState)
 FETCH:
 begin
 MemRead <= 1; ALUSrcA <= 0; IorD <= 0; IRWrite <= 1; ALUSrcB <= 1; ALUOp <= 0; PCWrite <= 1; PCSource <= 0; PCWriteCond <= 0; RegWrite <= 0; MemWrite <= 0;
 end
 DECODE:
 begin
 ALUSrcA <= 0; ALUSrcB <= 3; ALUOp <= 0; PCWriteCond <= 0; RegWrite <= 0; MemWrite <= 0; IRWrite <= 0; PCWrite <= 0;
 end
 R_TYPE_1:
 begin
 ALUSrcA <= 1; ALUSrcB <= 0; ALUOp <= 2; PCWriteCond <= 0; RegWrite <= 0; MemWrite <= 0; IRWrite <= 0; PCWrite <= 0;
 end
 R_TYPE_2:
 begin
 RegDst <= 1; RegWrite <= 1; MemtoReg <= 0; PCWriteCond <= 0; MemWrite <= 0; IRWrite <= 0; PCWrite <= 0;
 end
 I_TYPE_1:
 begin
 ALUSrcA <= 1; ALUSrcB <= 2; ALUOp <= 2; PCWriteCond <= 0; RegWrite <= 0; MemWrite <= 0; IRWrite <= 0; PCWrite <= 0;
 end
 I_TYPE_2:
 begin
 RegDst <= 0; RegWrite <= 1; MemtoReg <=0; PCWriteCond <= 0; MemWrite <= 0; IRWrite <= 0; PCWrite <= 0;
 end
 BRANCH:
 begin 
   ALUSrcA <= 1; ALUSrcB <= 0; ALUOp <= 1; PCWriteCond <= 1; PCSource <= 1; RegWrite <= 0; MemWrite <= 0; IRWrite <= 0; PCWrite <= 0;
 end
 JUMP:
 begin
 PCWrite <= 1; PCSource <= 2; PCWriteCond<= 0; RegWrite <= 0; MemWrite <= 0; IRWrite <= 0;
 LW_SW:
 begin
 ALUSrcA <= 1; ALUSrcB <= 2; ALUOp <= 0;PCWriteCond <= 0; RegWrite <= 0; MemWrite <= 0; IRWrite <= 0; PCWrite <= 0;
 end
 LW_2:
 begin
 MemRead <= 1; IorD <= 1; PCWriteCond <= 0; RegWrite <= 0; MemWrite <= 0; IRWrite <= 0; PCWrite <= 0;
 end
 LW_3:
 begin
 RegDst <= 1; RegWrite <= 1; MemtoReg <= 0; PCWriteCond <= 0; MemWrite <= 0; IRWrite <= 0;PCWrite <= 0;
 end
 SW_2:
 begin
 MemWrite <= 1; IorD <= 1; PCWriteCond <= 0; RegWrite <= 0; IRWrite <= 0; PCWrite <= 0;
 end
 endcase
 end

endmodule
 