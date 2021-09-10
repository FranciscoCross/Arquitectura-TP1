module ALU
  #(
    parameter N_BITS  = 6,
    parameter N_LEDS  = 6,
    )
   (
    output [N_LEDS - 1 : 0] o_led   ,
    input  [NB_SW  - 1 : 0] i_A     ,
    input  [NB_SW  - 1 : 0] i_B     ,
    input  [NB_SW  - 1 : 0] i_OP    ,
    input                   reset   ,
    input                   clock
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
    reg [NB_SW - 1 : 0] A = i_A;
    reg [NB_SW - 1 : 0] B = i_B;
    reg [NB_SW - 1 : 0] OP = i_OP;
    reg [NB_SW - 1 : 0] RES = 0;

    always @(posedge clock or posedge reset) begin
        case(OP)
        ADD:begin
                RES <= A + B;
            end
        SUB:begin
                RES <= A - B;
            end
        AND:begin
                RES <= A and B;
            end
        OR:begin
                RES <= A or B;
            end
        XOR:begin
                RES <= A xor B;
            end
        SRA:begin
                RES <= A >> B;
            end
        SRL:begin
                RES <= A << B;
            end
        NOR:begin
                RES <= A ~| B;
            end          
    end


assign o_led = RES;

endmodule //ALU
