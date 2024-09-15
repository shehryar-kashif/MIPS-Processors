module PC(clk, rst, PCin, PCout);
  input clk, rst;
  input [31:0] PCin;
  output reg [31:0] PCout;
  
  always @ (posedge clk or rst)
    begin
      if (rst)
        PCout <= 0;
      else
        PCout <= PCin;
    end
  
endmodule