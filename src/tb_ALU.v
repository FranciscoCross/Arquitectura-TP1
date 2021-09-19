`timescale 1ns / 1ps

module tb_ALU;

  localparam N_BITS = 8;
  localparam N_LEDS = 8;
  
  reg [N_BITS - 1 : 0] A;
  reg [N_BITS - 1 : 0] B;
  reg [N_BITS - 1 : 0] OP;
  reg       clk;
  wire [N_LEDS-1 : 0] LEDS;

  always #1 clk = ~clk;
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    clk = 1;
    A = 0;
    B = 0;
    OP = 0;
    
    #10
    A = 3;
    B = 3;
    OP = 6'b100000; //ADD
    
    #10
    A = 6;
    B = 2;
    OP = 6'b100010; //SUB

    
    #10
    A = 3; 
    B = 9; 
    OP = 6'b100100; //AND
    
    #10
    A = 5; 
    B = 2; 
    OP = 6'b100101; //OR
   
    #10
    A = 7; 
    B = 2; 
    OP = 6'b100110; //XOR
    
    #10
    A = 15; 
    B = 1;
    OP = 6'b000011; //SRA
   
    
    #10
    A = 16; 
    B = 2;
    OP = 6'b000010; //SRL

    
    #10
    A = 15; //00 1111
    B = 4; //01 0100
    OP = 6'b100111; //NOR

    
    #10
    A = 0;
    B = 0;
    OP = 0;
    
    #10
    $finish;

  end
   
  ALU #(
    .N_BITS(N_BITS),
    .N_LEDS(N_LEDS)
    ) 
    instance_ALU(
        .o_res(LEDS), 
        .i_A(A), 
        .i_B(B), 
        .i_Op(OP)
    );
  
   endmodule