module generic_counter (
    input wire   clk,
    input wire   reset,
    input wire   enb,
    input wire   load,
    input  reg [4:0]    cnt_in,
    output reg [4:0]     cnt_out
);
   always @(posedge clk) begin
    if (reset) begin
        cnt_out= 5'b00000;
    end
    else begin
      if (enb<= 1'b1 && load<=1'b0) begin
          cnt_out <= 5'b00000;
      end
      else if (enb <= 1'b1 && load<= 1'b1) begin
          cnt_out <= cnt_in;
      end
    end  
   end
endmodule