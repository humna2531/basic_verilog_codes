module controller (
  input wire [2:0] phase,
  input wire [2:0] opcode,
  input  wire      zero,
  output  reg      sel, rd, id_ir , inc_pc , halt , id_pc , data_c , id_ac , wr
);
  
  always @ (*) begin
    if (phase ==3'b000) begin
        sel=1;
        rd=0;
        id_ir=0;
        inc_pc=0;
        halt=0;
        id_pc=0;
        data_c= 0;
        id_ac=0;
        wr=0;
    end
    else begin
      if (phase==3'b001) begin
        sel=1;
        rd=1;
        id_ir=0;
        inc_pc=0;
        halt=0;
        id_pc=0;
        data_c=0;
        id_ac=0;
        wr=0;
      end
      else if (phase==3'b010) begin
        sel=1;
        rd=1;
        id_ir=1;
        inc_pc=0;
        halt=0;
        id_pc=0;
        data_c=0;
        id_ac=0;
        wr=0;  
      end
      else if (phase==3'b011) begin
        sel=1;
        rd=1;
        id_ir=1;
        inc_pc=0;
        halt=0;
        id_pc=0;
        data_c=0;
        id_ac=0;
        wr=0;
      end
      else if (phase==3'b100) begin
        sel=0;
        rd=0;
        id_ir=0;
        inc_pc=0;
        id_pc=0;
        data_c=0;
        id_ac=0;
        wr=0;
        if (opcode==3'b000)begin 
          halt=1;
        end
        else begin
          halt=0;
        end
      end
      else if (phase==3'b101) begin
        sel=0;
        id_ir=0;
        inc_pc=0;
        halt=0;
        id_pc=0;
        data_c=0;
        id_ac=0;
        wr=0;
        if (opcode==3'b010)begin
          rd=1;  
        end
        else begin
          if (opcode==3'b011) begin
            rd=1;
          end
          else if (opcode==3'b100) begin
            rd=1;
          end 
          else begin
            rd=0;
          end
        end
      end
      else if (phase==3'b110) begin
        sel=0;
        id_ir=0;
        halt=0;
        id_ac=0;
        wr=0;
        if (opcode==3'b010)begin
          rd=1;  
        end 
        else begin
          if (opcode==3'b011) begin
            rd=1;
          end 
          else if (opcode==3'b100) begin
            rd=1;
          end 
          else begin
            rd=0;
          end 
        end
        if (opcode==3'b101)begin
          inc_pc=1;  
        end
        else begin 
          inc_pc=0;
        end 
        if (opcode==3'b110)begin
          id_pc=1; 
        end 
        else  begin
          id_pc=0;
        end 
        if (opcode==3'b111)begin
          data_c=1; 
        end 
        else begin
          data_c=0;
        end
      end
      else if (phase==3'b111) begin
        sel=0;
        id_ir=0;
        inc_pc=0;
        halt=0;
        if (opcode==3'b010)begin
          rd=1;
        end
        else begin
          if (opcode==3'b011) begin
            rd=1;
          end 
          else if (opcode==3'b100) begin
            rd=1;
          end 
          else begin
            rd=0;
          end
        end
        if (opcode==3'b110)begin
          id_pc=1;
        end
        else begin
          id_pc=0;
        end 
        if (opcode==3'b111)begin
          data_c=1;
        end 
        else begin
          data_c=0;
        end 
        if (opcode==3'b010)begin
          id_ac=1;  
        end 
        else begin
          if (opcode==3'b011) begin
            id_ac=1;
          end 
          else if (opcode==3'b100) begin
            id_ac=1;
          end 
          else begin
            id_ac=0;
          end
        end
        if (opcode==3'b111)begin
          wr=1;
        end
        else begin
          wr=0;
        end
      end
    end
  end  
endmodule
