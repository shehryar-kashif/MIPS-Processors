module ALU(opcode, opnd1, opnd2, out, zeroFlag, overflow);
 input [5:0] opcode;
 input [31:0] opnd1, opnd2;
 output [31:0] out;
 output reg zeroFlag;
 output overflow; 

 reg [32:0] out_intmd;

 always @ (opnd1, opnd2, opcode)
 begin
 case(opcode)
 6'b000000: out_intmd <= opnd1 + opnd2;
 6'b000001: out_intmd <= opnd1 - opnd2;
 6'b000010: out_intmd <= opnd1 * opnd2;
 6'b000011: out_intmd <= opnd1 & opnd2;
 6'b000100: out_intmd <= opnd1 | opnd2;
 6'b000101: out_intmd <= opnd1 ^ opnd2;
 6'b000110: out_intmd <= ~opnd1;
 6'b000111: out_intmd <= opnd1 + opnd2;
 6'b001000: out_intmd <= opnd1 - opnd2;
 6'b001001: out_intmd <= opnd1 * opnd2;
 6'b001010: out_intmd <= opnd1 & opnd2;
 6'b001011: out_intmd <= opnd1 | opnd2;
 6'b001100: out_intmd <= opnd1 ^ opnd2;
 6'b001101: out_intmd <= ~opnd1;
 6'b001110: out_intmd <= opnd1 + opnd2;
 6'b001111: out_intmd <= opnd1 + opnd2;
 6'b010000: out_intmd <= opnd1 - opnd2;
 endcase
 end

 always @ (out)
 begin
 if (out == 0)
 zeroFlag <= 1;
 else
 zeroFlag <= 0;
 end

 assign overflow = out_intmd[32];
 assign out = out_intmd[31:0];
endmodule