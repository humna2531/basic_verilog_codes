//  linear feedback shift register design
module lfsr(
  input wire clk,
  input wire reset,
  output wire  [3:0] shift_value 
);
  reg [3:0] present_value;
  reg [3:0] next_value;
  always @ (posedge clk or posedge reset)
    if (reset)
       present_value <= 4'b1111;
    else
       present_value <= next_value;

  assign next_value = {present_value[2:0],present_value[2]^present_value[3]};
  assign shift_value = present_value;
  
endmodule




