module top_ALU
  #(
    parameter N_BITS = 6,
    parameter N_LEDS = 6,
    parameter N_B   = 3 
    )
   (
    output wire [N_BITS - 1 : 0]  o_led ,
    input wire  [N_BITS  - 1 : 0] i_SWs ,
    input wire  [N_B - 1 : 0]     i_buttons ,
    input wire                    reset ,
    input wire                    clock
    );
    //Registros para almacenar los valores
    reg [N_BITS - 1 : 0] reg_A;
    reg [N_BITS - 1 : 0] reg_B;
    reg [N_BITS - 1 : 0] reg_OP;
    
    always @(posedge clock or posedge reset) begin
        if(reset)
            begin
                reg_A  <= 0;
                reg_B  <= 0;
                reg_OP <= 0;
            end
        else
            begin
                case(i_buttons) 
                3'b100:
                    reg_A <= i_SWs;
                3'b010:
                    reg_B <= i_SWs;
                3'b001:
                    reg_OP <= i_SWs;
                endcase
            end        
    end

ALU #(N_BITS, N_LEDS)  ALU(
        .o_res(o_led), 
        .i_A (reg_A), 
        .i_B (reg_B), 
        .i_OP(reg_OP),
        .reset(reset),
        .clock(clock)
);

endmodule //top_ALU
