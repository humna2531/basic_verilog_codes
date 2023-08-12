// binary to grey code convertor
module bin_grey (
  input wire [3:0] binary_value,
  output 
   [3:0] grey_value
);
  
  assign grey_value [3] = binary_value[3];
  assign grey_value [2] = binary_value [3] ^ binary_value [2];
  assign grey_value [1] = binary_value [2] ^ binary_value [1];
  assign grey_value [0] = binary_value [1] ^ binary_value [0];
  
endmodule



