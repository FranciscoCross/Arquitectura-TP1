module tb_ALU;
  reg [5 : 0] A;
  reg [5 : 0] B;
  reg [5 : 0] OP;
  reg reset;
  reg clock;
  wire [5 : 0] LEDs;
  reg [5 : 0] RESULT;

  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    clock = 0;
    reset = 0;
    
    A = 0;
    B = 0;
    OP = 0;
    
    #10
    A = 2;
    B = 3;
    OP = 6'b100000; //ADD
    
    #10
    A = 6;
    B = 5;
    OP = 6'b100010; //SUB
    
    #10
    A = 5;
    B = 5;
    OP = 6'b100100; //AND

    #10
    A = 5;
    B = 2;
    OP = 6'b100101; //OR
    
    #10
    A = 0;
    B = 0;
    OP = 0;
    
    #10
    A = 0;
    B = 0;
    OP = 0;

  end
  
  always #1 clock = ~clock;
   
  ALU instance_ALU(
        .o_led(LEDs), 
        .i_A (A), 
        .i_B (B), 
        .i_OP(OP),
        .reset(reset),
        .clock(clock)
  );
  
   endmodule