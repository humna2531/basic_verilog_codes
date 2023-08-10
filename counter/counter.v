module counter (
  input wire clk,
  input wire reset,
  output wire [7:0] count_value
);
  
  wire  [7:0] next_value;
  
  always @(posedge clk or posedge reset)
    if reset 
      count_value = 8'b00000001;
    else
      count_value = next_value;
  
  assign next_value = count_value + 8'b00000001 ;
endmodule