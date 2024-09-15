module tbInstrMem;
 reg [9 : 0] address;
 wire [31:0] instr;

InstrMem uut1(address, instr);

 initial
 begin
 address = 10'd0;#5;
 address = 10'd1;#5;
 address = 10'd2;#5;
 address = 10'd3;#5;
 address = 10'd4;#5;
 address = 10'd5;#5;
 address = 10'd6;#5;
 address = 10'd10;#5;
 address = 10'd15;#5;
 address = 10'd200;#5;
 address = 10'd89;#5;
 $finish;
 end

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars;
 end
endmodule