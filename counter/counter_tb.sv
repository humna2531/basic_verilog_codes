module counter_tb ();
reg clk;
reg reset;
wire [7:0] count_value;

counter COUNT (.*);

initial begin
    clk = 1'b1;
    #2;
    clk = 1'b0;
    #2;
  end

  
initial begin 
    reset <= 1'b1;
    @(posedge clk);
    reset <= 1'b0;
    for (init i =0 ; i<=128 ; i++) begin
      @(posedge clk);
      $finish ();
    end
end