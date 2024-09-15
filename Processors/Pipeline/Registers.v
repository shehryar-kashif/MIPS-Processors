module Registers(clk, IFin, IFout, IDin, IDout, EXin, EXout, MEMin, MEMout);
  input clk;
  input [63:0] IFin;
  input [143:0] IDin;
  input [101:0] EXin;
  input [68:0] MEMin;
  output reg [63:0] IFout;
  output reg [143:0] IDout;
  output reg [101:0] EXout;
  output reg [68:0] MEMout;
  
  always @ (posedge clk)
    begin
      IFout <= IFin;
      IDout <= IDin;
      MEMout <= MEMin;
      EXout <= EXin;
    end
  
endmodule