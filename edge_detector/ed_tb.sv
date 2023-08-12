module ed_tb ();
 reg clk;
 reg reset;
 reg x;
 wire raising_edge;

 edge_detector EDGE (.*);

 initial begin
   clk = 1'b1;
    #1;
   clk = 1'b0;
    #1;
  end


  initial begin
    reset <= 1'b1;
    x=1'b1;
    @(posedge clk);
    reset <= 1'b0;
    for (int i=0 ; i=32; i++) begin
        x=$random%2;
        @(posedge clk);
        $finish();
    end
  end
  
  initial begin
    $dumpfile("edge_detector.vcd");
    $dumpvars(0,ed_tb_tb);
  end
endmodule