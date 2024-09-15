module DataMem(wen,readEn,clk,dataIn,address,dataOut);  
  input wen,readEn,clk; 
  input [31:0] dataIn; 
  input [4:0] address; 
  output reg [31:0] dataOut; 
   
  reg [31:0] Memory [31:0]; 
   
  always @ (posedge clk) 
    begin 
      if (wen == 1) 
        Memory[address] <= dataIn; 
    end 
   
  always @ (*) 
    begin 
      if (readEn == 1) 
        dataOut <= Memory[address]; 
    end 
   
endmodule