module ALU
  #(
    parameter N_BITS  = 6,
    parameter N_LEDS  = 6
    )
   (
    output wire [N_LEDS - 1 : 0] o_led   ,
    input wire  [N_BITS  - 1 : 0] i_A     ,
    input wire  [N_BITS  - 1 : 0] i_B     ,
    input wire  [N_BITS  - 1 : 0] i_OP    ,
    input wire                  reset   ,
    input wire                  clock
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
    reg [N_BITS - 1 : 0] RESULT; 
       
    //A = i_A;
    //B = i_B;
    //OP = i_OP;


    always @(posedge clock) begin
        case(i_OP) //Hay un problema acá, no entra a ningun case
        ADD:begin
                RESULT <= i_A + i_B;
            end
        SUB:begin
                RESULT <= i_A - i_B;
            end
        AND:begin
                RESULT <= i_A & i_B;
            end
        OR:begin
                RESULT <= i_A | i_B;
            end
        XOR:begin
                RESULT <= i_A ^ i_B;
            end
        SRA:begin
                RESULT <= i_A >> i_B;
            end
        SRL:begin
                RESULT <= i_A << i_B;
            end
        NOR:begin
                RESULT <= ~(i_A | i_B);
            end
            endcase          
    end


assign o_led = RESULT;

endmodule //ALU
