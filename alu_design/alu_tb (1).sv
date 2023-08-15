// alu testbench
module alu_tb ();
  reg   [7:0] a;
  reg   [7:0] b;
  reg   [1:0] s;
  wire  [7:0] x;
  
  alu_design  ALU (.*); 
  
  initial begin
    a=8'b00000000;
    b=8'b00000000;
    s=2'b00;
    #5;
    a= $urandom_range (0,8'b00111011);
    b= $urandom_range (0,8'b00111011);
    s= $urandom_range (0,2'b11);
    $finish;
  end
  
  initial begin
    $dumpfile("alu_design.vcd");
    $dumpvars(0,alu_tb);
  end
endmodule
             
      
    
  