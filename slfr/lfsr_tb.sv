//  testbench
module lfsr_tb ();
  reg        clk;
  reg        reset;
  reg  [3:0] shift_value;
  
  lfsr  LFSR (.*); 
  
  
  initial begin
   clk = 1'b1;
    #1;
   clk = 1'b0;
    #1;
  end
  
  
  initial begin
    reset <= 1'b1;
    @(posedge clk);
    @(posedge clk);
    reset <= 1'b0;
    for (int i=0 ; i<=128; i++)
      @(posedge clk);
    $finish();
  end
  
  initial begin
    $dumpfile("lfsr.vcd");
    $dumpvars(0,lfsr_tb);
  end
endmodule
             
      