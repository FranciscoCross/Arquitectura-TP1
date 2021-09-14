module tb_top;
  reg [5 : 0] SW;
  wire [5 : 0] LEDs;
  reg [2 : 0] B;
  reg reset;
  reg clock;
  


  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    clock = 0;
    reset = 1;
    
    SW = 0;
    B = 0;
    #2
    reset = 0;
    #5
    SW = 6'b000011; 
    B =  3'b100;     //A
    
    #5
    SW = 6'b000101; 
    B =  3'b010;     //B
    
    #5
    SW = 6'b100000;
    B =  3'b001;     //OP ADD

    #5
    SW = 6'b000111; 
    B =  3'b100;     //A
    
    #5
    SW = 6'b000010; 
    B =  3'b010;     //B
    
    #5
    SW = 6'b100010;
    B =  3'b001;     //OP SUB
    
    #5
    SW = 6'b000011; 
    B =  3'b100;     //A
    
    #5
    SW = 6'b000011; 
    B =  3'b010;     //B
    
    #5
    SW = 6'b100100; 
    B =  3'b001;     //OP AND
  end
  
  always #1 clock = ~clock;
   
  top_ALU instance_top_ALU(
        .o_led(LEDs), 
        .i_SWs (SW), 
        .i_buttons (B),
        .reset(reset),
        .clock(clock)
  );

   endmodule