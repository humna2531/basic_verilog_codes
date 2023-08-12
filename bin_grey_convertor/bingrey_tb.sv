// teshbench
module bingrey_tb ();
  reg [3:0] binary_value;
  wire [3:0] grey_value;
  
  bin_grey BINARY (.*);
  
  initial begin 
    binary_value = 4'b0001;
    #1;
    binary_value = $urandom_range (0, 4'b1111);
    #1;
  end
  
  initial begin
    $dumpfile("bin_grey.vcd");
    $dumpvars(0,bingrey_tb);
  end
endmodule