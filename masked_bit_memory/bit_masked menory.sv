module bit_masked_memory (
    input wire        clk,
    input wire [2:0]  addr,
    input wire [31:0] data,
    input wire        enb,
    input wire        wr,
    input wire [31:0] masked,
    output reg [31:0] r_data   
); 
    reg [31:0] mem [255:0];

    always @ (posedge clk) begin
        if (enb) begin
            if (wr) begin
                mem [addr]= data & masked
            end
            else begin
                r_data <= mem[addr];
            end
        end
    end 
endmodule
 






