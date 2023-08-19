module byte_masked_memory_tb;
    reg        clk;
    reg  [2:0] addr;
    reg  [31:0] data;
    reg        enb;
    reg        wr;
    reg  [3:0] masked;
    wire [31:0] r_data;

    // Instantiate the memory module
    byte_masked_memory mem_inst (
        .clk(clk),
        .addr(addr),
        .data(data),
        .enb(enb),
        .wr(wr),
        .masked(masked),
        .r_data(r_data)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test stimulus
    initial begin
        clk     = 0;
        addr    = 0;
        data    = 8'b00001110;
        enb     = 1;
        wr      = 1;
        masked  = 4'b0011;
        
        // Write operation
        #10 wr     = 0;
        #20 enb    = 1;

        // Read operation
        #30 addr   = 0;
        #40 enb    = 1;
        #50 wr     = 0;

        // Finish simulation
        #60 $finish;
    end
      initial begin
        $dumpfiles("btye_masked_memory");
        $dumpvars (0,byte_masked_memory_tb);
      end
endmodule
