module mux_tb ();
  logic [7:0]a;
  logic [7:0]b;
  logic sel;
  logic [7:0]y;
  
  mux MUX (.*);
  
  initial begin
    for ( int i=0; i<5 ; i++) begin
      a= $randam_range (0,8'hFF);
      b= $randam_range (0,8'hFF);
      sel=$randam ();
      #5;
    end
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,mux_tb);
  end
endmodule
              
    