module ALU
  #(
    parameter N_BITS = 8,
    parameter N_LEDS = 8
    )
   (
    output reg [N_LEDS - 1 : 0]  o_res   ,
    input wire  [N_BITS  - 1 : 0] i_A     ,
    input wire  [N_BITS  - 1 : 0] i_B     ,
    input wire  [N_BITS  - 1 : 0] i_OP    
    );

    localparam ADD  = 6'b100000;
    localparam SUB  = 6'b100010;
    localparam AND  = 6'b100100;
    localparam OR   = 6'b100101;
    localparam XOR  = 6'b100110;
    localparam SRA  = 6'b000011;
    localparam SRL  = 6'b000010;
    localparam NOR  = 6'b100111;
    
    
    //Vars
       
    //A = i_A;
    //B = i_B;
    //OP = i_OP;


    always @(*) begin
        case(i_OP) 
        ADD:
            o_res = (i_A + i_B);
        SUB:
            o_res = (i_A - i_B);
        AND:
            o_res = (i_A & i_B);
        OR:
            o_res = (i_A | i_B); 
        XOR:
            o_res = (i_A ^ i_B);
        SRA:
            o_res = (i_A >>> i_B);
        SRL:
            o_res = (i_A >> i_B);
        NOR:
            o_res = ~(i_A | i_B);
        default:
            o_res = 0;
        endcase
   end



endmodule //ALU
