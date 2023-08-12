//  testbench
module shiftreg_tb ();
  reg         clk;
  reg         reset;
  reg         x;
  wire  [3:0] shift_value;
  
  
  shift_reg  SHIFT (.*); 
  
  
  initial begin
   clk = 1'b1;
    #1;
   clk = 1'b0;
    #1;
  end
  
  
  initial begin
    reset <= 1'b1;
    x=1'b0;
    @(posedge clk);
    @(posedge clk);
    reset <= 1'b0;
    for (int i=0 ; i<=128; i++) begin
      x= $random%2;
      @(posedge clk);
    $finish();
    end
  end
  
  initial begin
    $dumpfile("shift_reg.vcd");
    $dumpvars(0,shiftreg_tb);
  end
endmodule