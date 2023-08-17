module bitmasked_memory_tb ();
   reg       clk;
   reg       enb;
   reg       wr;
   reg  [2:0] addr;
   reg  [31:0] data;
   reg  [31:0] masked;
   wire [31:0] r_data;

   bit_masked_memory BIT (.*);

   always begin
    clk =1'b0;
    #5;
    clk =1'b1;
    #5;
   end
   

   initial begin
      enb<=1'b1;
      wr<=1'b1;
      data<=32'b000000000000000000000000111111;
      masked<=32'b000000000000000000001111111111;
      addr<= 8'b00011011;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      enb<=1'b1;
      wr<=1'b0;
      data<= 32'b11111111111111111111111110000111;
      masked<=  32'b11111111111000000000001111111111;
      addr<= 8'b00000001;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      enb<=1'b1;
      wr<=1'b1;
      data=$urandom_range (0, 32'b11111111111111111111111110000111);
      masked=$urandom_range (0, 32'b1111111111111111111111111111111);
      addr<=8'b00000111;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      #20;
     $finish();
   end
  
     
    initial begin
      $dumpfile("bit_masked_memory.vcd");
      $dumpvars(0,bitmasked_memory_tb);
    end
endmodule
   