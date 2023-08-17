module sequence_controller (
  input wire         clk,
  input wire         reset,
  input wire         zero,
  input wire  [2:0]  opcode,
  output reg         mem_rd, load_ir, halt, inc_pc, load_ac, load_pc, mem_rw
); 

  reg [2:0] current_state;
  reg [2:0] next_state;


//opcode names
  localparam HLT = 3'b000;
  localparam SKZ = 3'b001;
  localparam ADD = 3'b010;
  localparam AND = 3'b011;
  localparam XOR = 3'b100;
  localparam LDA = 3'b101;
  localparam STO = 3'b110;
  localparam JMP = 3'b111;

//states names   
  localparam INST_ADDR = 3'b000;
  localparam INST_FETCH = 3'b001;
  localparam INST_LOAD = 3'b010;
  localparam IDLE = 3'b011;
  localparam OP_ADDR = 3'b100;
  localparam OP_FETCH = 3'b101;
  localparam ALU_OP = 3'b110;
  localparam STORE = 3'b111;

//state block
  always @(posedge clk or negedge reset) begin
    if (!reset) begin
        current_state <=INST_ADDR;
    end
    else begin
        current_state <=next_state;
    end
  end 

//next_state block
   always @(*) begin
     case (current_state)
       INST_ADDR : next_state =INST_FETCH;
       INST_FETCH: next_state =INST_LOAD;
       INST_LOAD : next_state =IDLE;
       IDLE      : next_state =OP_ADDR;
       OP_ADDR   : next_state =OP_FETCH;
       OP_FETCH  : next_state =ALU_OP;
       ALU_OP    : next_state =STORE;
     endcase
   end

//output block
  always @ (*) begin
    if (current_state == INST_ADDR) begin
        mem_rd = 1'b0;
        load_ir=1'b0;
        halt=1'b0;
        inc_pc=1'b0;
        load_ac=1'b0;
        load_pc=1'b0;
        mem_rw=1'b0;
    end
    else begin
        if (current_state == INST_FETCH) begin
            mem_rd = 1'b1;
            load_ir=1'b0;
            halt=1'b0;
            inc_pc=1'b0;
            load_ac=1'b0;
            load_pc=1'b0;
            mem_rw=1'b0;
        end
        else if (current_state == INST_LOAD) begin
            mem_rd = 1'b1;
            load_ir=1'b1;
            halt=1'b0;
            inc_pc=1'b0;
            load_ac=1'b0;
            load_pc=1'b0;
            mem_rw=1'b0;
        end
        else if (current_state == IDLE) begin
            mem_rd = 1'b1;
            load_ir=1'b1;
            halt=1'b0;
            inc_pc=1'b0;
            load_ac=1'b0;
            load_pc=1'b0;
            mem_rw=1'b0;
        end
        else if (current_state == OP_ADDR) begin
            mem_rd = 1'b0;
            load_ir=1'b0;
            inc_pc=1'b1;
            load_ac=1'b0;
            load_pc=1'b0;
            mem_rw=1'b0;
            if (opcode==HLT)begin
                halt=1'b1;
            end
            else begin
                halt=1'b0;
            end
        end
        else if (current_state == OP_FETCH) begin 
            load_ir=1'b0;
            halt=1'b0;
            inc_pc=1'b0;
            load_ac=1'b0;
            load_pc=1'b0;
            mem_rw=1'b0;
            if (opcode==ADD) begin
                mem_rd=1'b1;
            end
            else begin
                if (opcode==AND) begin
                    mem_rd=1'b1;
                end
                else if (opcode==XOR) begin
                    mem_rd=1'b1;                    
                end
                else if (opcode==LDA) begin
                    mem_rd=1'b1;
                end
                else begin
                    mem_rd=1'b0;
                end
            end
        end
        else if (current_state == ALU_OP) begin 
            load_ir=1'b0;
            halt=1'b0;
            mem_rw=1'b0;
            if (opcode==ADD) begin
                mem_rd=1'b1;
            end
            else begin
                if (opcode==AND) begin
                    mem_rd=1'b1;
                end
                else if (opcode==XOR) begin
                    mem_rd=1'b1;                    
                end
                else if (opcode==LDA) begin
                    mem_rd=1'b1;
                end
                else begin
                    mem_rd=1'b0;
                end
            end
            if (opcode==SKZ && zero==1'b1)begin
                inc_pc=1'b1;
            end
            else begin
                inc_pc=1'b0;
            end
            if (opcode==ADD) begin
                load_ac=1'b1;
            end
            else begin
                if (opcode==AND) begin
                    load_ac=1'b1;
                end
                else if (opcode==XOR) begin
                    load_ac=1'b1;                    
                end
                else if (opcode==LDA) begin
                    load_ac=1'b1;
                end
                else begin
                    load_ac=1'b0;
                end
            end
            if (opcode==JMP) begin
                load_pc=1'b1;
            end
            else begin
                load_pc=1'b0;
            end
        end
        else if (current_state == STORE) begin 
            load_ir=1'b0;
            halt=1'b0;
            if (opcode==ADD) begin
                mem_rd=1'b1;
            end
            else begin
                if (opcode==AND) begin
                    mem_rd=1'b1;
                end
                else if (opcode==XOR) begin
                    mem_rd=1'b1;                    
                end
                else if (opcode==LDA) begin
                    mem_rd=1'b1;
                end
                else begin
                    mem_rd=1'b0;
                end
            end
            if (opcode==JMP)begin
                inc_pc=1'b1;
            end
            else begin
                inc_pc=1'b0;
            end
            if (opcode==ADD) begin
                load_ac=1'b1;
            end
            else begin
                if (opcode==AND) begin
                    load_ac=1'b1;
                end
                else if (opcode==XOR) begin
                    load_ac=1'b1;                    
                end
                else if (opcode==LDA) begin
                    load_ac=1'b1;
                end
                else begin
                    load_ac=1'b0;
                end
            end
            if (opcode==JMP)begin
                load_pc=1'b1;
            end
            else begin
                load_pc=1'b0;
            end
            if (opcode==STO)begin
                mem_rw=1'b1;
            end
            else begin
                mem_rw=1'b0;
            end
        end
    end
  end  
endmodule



  

  


   

  