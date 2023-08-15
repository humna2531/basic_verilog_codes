module gcounter_tb ();
     reg   clk;
     reg   reset;
     reg   enb;
     reg   load;
     reg  [4:0]  cnt_in;
     wire  [4:0]  cnt_out;
  
  
  generic_counter CNT (.*);
  
    initial begin
        clk=1'b0;
        #2;
        clk=1'b1;
        #2;
    end

    initial begin
       reset <= 1'b0;
       load <= 1'b1;
       enb <= 1'b1;
       cnt_in = 5'b10101;
       #2;
       reset <= 1'b0;
       load <= 1'b1;
       enb <= 1'b1;
       cnt_in = 5'b01010;
       #2;
       reset <= 1'b0;
       load <= 1'b1;
       enb <= 1'b1;
       cnt_in = 5'b11111;
       #2;
       reset <= 1'b1;
       load <= 1'b1;
       enb <= 1'b1;
       cnt_in <= 5'b11111;
       #2;
       $finish();
    end

    initial begin
      $dumpfile("generic_counter.vcd");
      $dumpvars(0,gcounter_tb);
    end  
       
endmodule