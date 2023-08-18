module sequencecontroller_tb ();
  reg        clk;
  reg        reset;
  reg        zero;
  reg  [2:0] opcode;
  wire [2:0] current_state;
  wire      mem_rd , load_ir , halt , inc_pc , load_ac , load_pc ,mem_rw;


  sequence_controller  SEQ (.*);

  always begin
    clk = 1'b0;
    #10;
    clk = 1'b1;
    #10;
  end

  initial begin
    reset<=1'b1;
    opcode<=3'b000;
    zero<=1'b0;
    reset<=1'b0;
    #10;
    reset<=1'b1;
    opcode<= 3'b000;
    zero<=1'b0;
    #10;
    #10;
    #10;
    #10;
    
    #60;
    opcode<= 3'b010;
    zero<=1'b0;
    #20;
    
    
    #20;
    
    #20;
    #20;
    #20;
    $finish();
  end

  initial begin
    $dumpfile("sequence_controller.vcd");
    $dumpvars(0,sequencecontroller_tb);
  end  
endmodule