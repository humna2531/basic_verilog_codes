// newtom rehphsen method
module newton_raphson (
  input wire[7:0] x,
  output wire [7:0] x_i
);
  wire [7:0] f_x;
  wire [7:0] f_xi;
  
  assign f_x = (3*x)**3 + (2*x) + 1;
  assign f_xi = (3*x)**2 +2;
  assign x_i = x - f_x/f_xi;
endmodule



