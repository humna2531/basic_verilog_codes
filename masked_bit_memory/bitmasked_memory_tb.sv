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
      addr = 1'b0;
      data = 32'b00000000000000000000000000000000;
      enb = 1'b0;
      wr = 1'b0;
      masked = 32'b00000000000000000000000000000000;
        
      // Write to memory
      enb = 1'b1;
      wr = 1'b1;
      addr = 1'b1;
      data = 32'b10100101101001011010010110100101;
      masked =32'b00000000111111110000000011111111;
      #10;
      enb = 1'b1;
      wr = 1'b0;
      addr = 1'b1;
      data = 32'b00000000111111110000000011111111;
      masked =32'b10100101101001011010010110100101;
      #10;
      #20;
     $finish();
   end
  
     
    initial begin
      $dumpfile("bit_masked_memory.vcd");
      $dumpvars(0,bitmasked_memory_tb);
    end
endmodule
   