module controller_tb ();
  reg  [2:0] phase;
  reg  [2:0] opcode;
  reg        zero;
  wire       sel, rd, id_ir , inc_pc , halt , id_pc , data_c , id_ac , wr;

 controller CNT (.*);

 initial begin
   phase <= 3'b100;
   opcode=3'b000;
   zero=1'b0;
   #5;
   phase <= 3'b010;
   opcode <=3'b010;
   zero=1'b0;
   #5;
   $finish();
 end

initial begin
  $dumpfile("controller.vcd");
  $dumpvars(0,controller_tb);
 end
endmodule
