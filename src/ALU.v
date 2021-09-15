module ALU
  #(
    parameter N_BITS = 6,
    parameter N_LEDS = 6
    )
   (
    output wire [N_BITS - 1 : 0]  o_res   ,
    input wire  [N_BITS  - 1 : 0] i_A     ,
    input wire  [N_BITS  - 1 : 0] i_B     ,
    input wire  [N_BITS  - 1 : 0] i_OP    ,
    input wire                    reset   ,
    input wire                    clock
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


    always @(posedge clock or posedge reset) begin
        if(reset)
            begin
                RESULT <= 0;
            end
        else
            begin
                case(i_OP) 
                ADD:
                    RESULT <= (i_A + i_B);
                SUB:
                    RESULT <= (i_A - i_B);
                AND:
                    RESULT <= (i_A & i_B);
                OR:
                    RESULT <= (i_A | i_B); 
                XOR:
                    RESULT <= (i_A ^ i_B);
                SRA:
                    RESULT <= (i_A >>> i_B);
                SRL:
                    RESULT <= (i_A >> i_B);
                NOR:
                    RESULT <= ~(i_A | i_B);
                endcase
            end  
    end


assign o_res = RESULT;

endmodule //ALU
