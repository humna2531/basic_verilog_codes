module byte_masked_memory (
    input wire        clk,
    input wire [2:0]  addr,
    input wire [31:0]  data,
    input wire        enb,
    input wire        wr,
    input wire [3:0]  masked,
    output reg [31:0]  r_data   
); 
    reg [31:0] mem [255:0];

    always @ (posedge clk) begin
        if (enb) begin
            if (wr) begin
                if (masked[0]) begin
                    mem [addr][7:0]<=data;
                end
                else begin
                    if (masked[1]) begin
                        mem [addr][14:8]<=data;                        
                    end
                    else if (masked[3]) begin
                        mem[addr][22:15]<=data;
                    end
                    else if (masked[4]) begin
                        mem[addr][31:23]<=data;
                    end
                end
            end
            else begin
                r_data <= mem[addr];
            end
        end 
    end
endmodule
 


