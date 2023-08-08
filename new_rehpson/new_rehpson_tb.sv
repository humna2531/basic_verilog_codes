//testbench 
module newtonraphson_tb ();
  reg [7:0] x;
  wire [7:0] x_i;
  
  newton_raphson NEWTON (.*);
  
  initial begin 
    x=1;
    #1;
    x=$urandom_range (1,7);
    #1;
    $finish;
  end
  
  initial begin
    $dumpfile("newton_raphson.vcd");
    $dumpvars(0,newtonraphson_tb);
  end
endmodule
  
  