`timescale 100ns / 1ps
module tb_top;
    parameter N_BITS = 8;
    parameter N_LEDS = 8;
    parameter N_B = 3;
    
    reg [N_BITS - 1 : 0] SW;
    reg [N_B - 1 : 0] B;
    reg reset;
    reg [5 : 0] OPs [7:0];
    reg clock;
    reg [2 : 0] AUX;
    reg [15 : 0] NUM;
    
    localparam ADD  = 6'b100000;
    localparam SUB  = 6'b100010;
    localparam AND  = 6'b100100;
    localparam OR   = 6'b100101;
    localparam XOR  = 6'b100110;
    localparam SRA  = 6'b000011;
    localparam SRL  = 6'b000010;
    localparam NOR  = 6'b100111;
    
   
    
    wire [N_LEDS - 1 : 0] LEDs;
      
      
    always #1 clock = ~clock;  
    
    initial begin
    OPs[0] = ADD;
    OPs[1] = SUB;
    OPs[2] = AND;
    OPs[3] = OR;
    OPs[4] = XOR;
    OPs[5] = SRA;
    OPs[6] = SRL;
    OPs[7] = NOR;
    
    $display("El valor de ADD es: %b", OPs[0]);
    $dumpfile("dump.vcd"); $dumpvars;
    $display("Comienza la simulacion");
    clock = 0;
    reset = 1;
    
    SW = 0;
    B = 0;
    #2
    reset = 0;
    #5
    SW = $random; 
    end
    
    
    always @(posedge clock or posedge reset) begin
        #5
        NUM = $random;
        SW = NUM;
        $display("Cargo un valor random en los SWs = DECIMA %d, BINARIO %b ", SW, SW);
        B =  3'b100;     //A
        $display("Boton A = %d", B);
        
        #5
        NUM = $random;
        SW = NUM;
        $display("Cargo un valor random en los SWs = DECIMA %d, BINARIO %b ", SW, SW);
        B =  3'b010;     //B
        $display("Boton B = %d", B);
        
        #5
        AUX = $random;
        $display("El valor de AUX es: %b", AUX);
        SW = OPs[AUX];
        $display("Cargo el codigo OP en SWs = %d, %b", SW, SW);
        B =  3'b001;     //OP ADD
        $display("Boton de OP = %d", B);
        #5
        $display("El resultado es: DECIMAL %d, BINARIO %b", LEDs, LEDs);
        begin
            case(SW) 
                ADD:
                    begin
                        $display("ADD");
                        if(LEDs == (top_ALU.reg_A + top_ALU.reg_B))
                        begin 
                           $display("ADD Correcto\n\n"); 
                        end
                    end                    
                SUB:
                    begin
                        $display("SUB");
                        if(LEDs == (top_ALU.reg_A - top_ALU.reg_B))
                        begin 
                           $display("SUB Correcto\n\n"); 
                        end
                    end
                AND:
                    begin
                        $display("AND");
                        if(LEDs == (top_ALU.reg_A & top_ALU.reg_B))
                        begin 
                           $display("AND Correcto\n\n"); 
                        end
                    end
                OR:
                    begin
                        $display("OR");
                        if(LEDs == (top_ALU.reg_A | top_ALU.reg_B))
                        begin 
                           $display("OR Correcto\n\n"); 
                        end
                    end
                XOR:
                    begin
                        $display("XOR");
                        if(LEDs == (top_ALU.reg_A ^ top_ALU.reg_B))
                        begin 
                           $display("XOR Correcto\n\n"); 
                        end
                    end
                SRA:
                    begin
                        $display("SRA");
                        if(LEDs == (top_ALU.reg_A >>> top_ALU.reg_B))
                        begin 
                           $display("SRA Correcto\n\n"); 
                        end
                    end
                SRL:
                    begin
                        $display("SRL");
                        if(LEDs == (top_ALU.reg_A >>  top_ALU.reg_B))
                        begin 
                           $display("SRL Correcto\n\n"); 
                        end
                    end
                NOR:
                    begin
                        $display("NOR");
                        if(LEDs == ~(top_ALU.reg_A | top_ALU.reg_B))
                        begin 
                           $display("NOR Correcto\n\n"); 
                        end
                    end
                endcase
        end
    end
     
   
   
top_ALU#(N_BITS, N_LEDS, N_B) top_ALU(  
        .o_led(LEDs), 
        .i_SWs (SW), 
        .i_buttons (B),
        .reset(reset),
        .clock(clock)
  );

   endmodule
