//   shift register design
module shift_reg(
  input wire clk,
  input wire reset,
  input wire x,
  output wire  [3:0] shift_value 
);
  reg [3:0] present_value;
  reg [3:0] next_value;
  
  always @ (posedge clk or posedge reset)
    if (reset)
       present_value <= 4'b0000;
    else
       present_value <= next_value;

  assign next_value = {present_value[2:0],x};
  assign shift_value = present_value;
  
endmodule



             
      