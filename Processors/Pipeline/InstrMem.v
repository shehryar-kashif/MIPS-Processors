module InstrMem(address, instr);
  input [4:0] address;
  output reg [31:0] instr;
  
  reg [31:0] mem [31:0];
  
  initial
    begin
      $readmemb("InstrMem.txt", mem, 0 ,11);
    end
  
  always @ (*)
    begin
      instr <= mem[address];
    end
  
endmodule