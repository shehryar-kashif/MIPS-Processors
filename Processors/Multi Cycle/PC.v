module PC(clk, rst, PCin, PCWrite, PCOut);
 input clk, rst, PCWrite;
 input [31:0] PCin;
 output reg [31:0] PCOut;

 always @ (posedge clk or posedge rst)
 begin
 if (rst)
 PCOut <= 32'd0;
 else
 begin
 if (PCWrite == 1)
 PCOut <= PCin;
 end
 end

endmodule
