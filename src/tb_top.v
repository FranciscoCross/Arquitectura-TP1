module tb_top;
    parameter N_BITS = 6;
    parameter N_LEDS = 6;
    parameter N_B = 3;
    
    reg [N_BITS - 1 : 0] SW;
    reg [N_B - 1 : 0] B;
    reg reset;
    reg clock;
    
    wire [N_LEDS - 1 : 0] LEDs;
      
      
    always #1 clock = ~clock;  
    
    initial begin
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
    
    //CASE ADD
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b100;     //A
    $display("Toco el boton correspondiente a A = %d", B);
    
    #5
    SW = $random; 
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b010;     //B
    $display("Toco el boton correspondiente a B = %d", B);
    
    #5
    SW = 6'b100000;
    $display("Cargo el codigo ADD en los SWs = %d", SW);
    B =  3'b001;     //OP ADD
    $display("Toco el boton correspondiente a OP = %d", B);
    #5
    $display("El resultado es: %d", LEDs);
    begin
        if(LEDs == (top_ALU.reg_A + top_ALU.reg_B))
        begin 
           $display("ADD Correcto\n\n"); 
        end
    end
    
        
    //CASE SUB
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b100;     //A
    $display("Toco el boton correspondiente a A = %d", B);
    
    #5
    SW = $random; 
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b010;     //B
    $display("Toco el boton correspondiente a B = %d", B);
    
    #5
    SW = 6'b100010;
    $display("Cargo el codigo SUB en los SWs = %d", SW);
    B =  3'b001;     //OP SUB
    $display("Toco el boton correspondiente a OP = %d", B);
    #5
    $display("El resultado es: %d", LEDs);
    begin
        if(LEDs == (top_ALU.reg_A - top_ALU.reg_B))
        begin 
           $display("SUB Correcto\n\n"); 
        end
    end



    //CASE AND
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b100;     //A
    $display("Toco el boton correspondiente a A = %d", B);
    
    #5
    SW = $random; 
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b010;     //B
    $display("Toco el boton correspondiente a B = %d", B);
    
    #5
    SW = 6'b100100;
    $display("Cargo el codigo AND en los SWs = %d", SW);
    B =  3'b001;     //OP AND
    $display("Toco el boton correspondiente a OP = %d", B);
    #5
    $display("El resultado es: %d", LEDs);
    begin
        if(LEDs == (top_ALU.reg_A & top_ALU.reg_B))
        begin 
           $display("AND Correcto\n\n"); 
        end
    end
    
    //CASE OR
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b100;     //A
    $display("Toco el boton correspondiente a A = %d", B);
    
    #5
    SW = $random; 
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b010;     //B
    $display("Toco el boton correspondiente a B = %d", B);
    
    #5
    SW = 6'b100101;
    $display("Cargo el codigo OR en los SWs = %d", SW);
    B =  3'b001;     //OP OR
    $display("Toco el boton correspondiente a OP = %d", B);
    #5
    $display("El resultado es: %d", LEDs);
    begin
        if(LEDs == (top_ALU.reg_A | top_ALU.reg_B))
        begin 
           $display("OR Correcto\n\n"); 
        end
    end
    
    //CASE XOR
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b100;     //A
    $display("Toco el boton correspondiente a A = %d", B);
    
    #5
    SW = $random; 
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b010;     //B
    $display("Toco el boton correspondiente a B = %d", B);
    
    #5
    SW = 6'b100110;
    $display("Cargo el codigo XOR en los SWs = %d", SW);
    B =  3'b001;     //OP XOR
    $display("Toco el boton correspondiente a OP = %d", B);
    #5
    $display("El resultado es: %d", LEDs);
    begin
        if(LEDs == (top_ALU.reg_A ^ top_ALU.reg_B))
        begin 
           $display("XOR Correcto\n\n"); 
        end
    end    
    
    //CASE SRA
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b100;     //A
    $display("Toco el boton correspondiente a A = %d", B);
    
    #5
    SW = $random; 
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b010;     //B
    $display("Toco el boton correspondiente a B = %d", B);
    
    #5
    SW = 6'b000011;
    $display("Cargo el codigo SRA en los SWs = %d", SW);
    B =  3'b001;     //OP SRA
    $display("Toco el boton correspondiente a OP = %d", B);
    #5
    $display("El resultado es: %d", LEDs);
    begin
        if(LEDs == (top_ALU.reg_A >> top_ALU.reg_B))
        begin 
           $display("SRA Correcto\n\n"); 
        end
    end  
    
    
    //CASE SRL
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b100;     //A
    $display("Toco el boton correspondiente a A = %d", B);
    
    #5
    SW = $random; 
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b010;     //B
    $display("Toco el boton correspondiente a B = %d", B);
    
    #5
    SW = 6'b000010;
    $display("Cargo el codigo SRL en los SWs = %d", SW);
    B =  3'b001;     //OP SRL
    $display("Toco el boton correspondiente a OP = %d", B);
    #5
    $display("El resultado es: %d", LEDs);
    begin
        if(LEDs == (top_ALU.reg_A << top_ALU.reg_B))
        begin 
           $display("SRL Correcto\n\n"); 
        end
    end      

    //CASE NOR
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b100;     //A
    $display("Toco el boton correspondiente a A = %d", B);
    
    #5
    SW = $random; 
    $display("Cargo un valor random en los SWs = %d", SW);
    B =  3'b010;     //B
    $display("Toco el boton correspondiente a B = %d", B);
    
    #5
    SW = 6'b100111;
    $display("Cargo el codigo NOR en los SWs = %d", SW);
    B =  3'b001;     //OP NOR
    $display("Toco el boton correspondiente a OP = %d", B);
    #5
    $display("El resultado es: %d", LEDs);
    begin
        if(LEDs == ~(top_ALU.reg_A | top_ALU.reg_B))
        begin 
           $display("NOR Correcto\n\n"); 
        end
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