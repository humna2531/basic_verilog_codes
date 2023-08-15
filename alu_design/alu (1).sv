// alu
module alu_design (
  input  wire [7:0] a,
  input  wire [7:0] b,
  input  wire [1:0] s,
  output reg  [7:0] x,
);
  
  always @ (*) begin
    if (s== 2'b00)
      x= a+b;
    else if (s== 2'b01)
      x= a-b;
    else if (s==2'b10)
      x= a&b;
    else 
      x= a^b;
  end
  
endmodule

    
  