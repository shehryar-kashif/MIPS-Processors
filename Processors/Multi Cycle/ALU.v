module ALU(opcode, opnd1, opnd2, out, zeroFlag, overflow);
 input [3:0] opcode;
 input [31:0] opnd1, opnd2;
 output [31:0] out;
 output reg zeroFlag;
 output overflow;

 reg [32:0] out_intmd;

 always @ (*)
 begin
 case(opcode)
 4'b0000: out_intmd <= opnd1 + opnd2;
 4'b0001: out_intmd <= opnd1 - opnd2;
 4'b0010: out_intmd <= opnd1 * opnd2;
 4'b0011: out_intmd <= opnd1 & opnd2;
 4'b0100: out_intmd <= opnd1 | opnd2;
 default: out_intmd <= opnd1 + opnd2;
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