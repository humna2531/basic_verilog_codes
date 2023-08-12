// edge detector design
module edge_detector (
  input wire clk,
  input wire reset,
  input wire x,
  output reg  raising_edge
);
  wire  x_i;
  
  always @ (posedge clk or posedge reset)
    if (reset)
       x_i <= 1'b0;
    else
       x_i <= x;

  assign raising_edge = ~x_i & x;
  
endmodule