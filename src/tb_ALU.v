module tb_ALU;
  reg [5 : 0] A;
  reg [5 : 0] B;
  reg [5 : 0] OP;
  wire [5 : 0] RES;



  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    
    A = 0;
    B = 0;
    OP = 0;
    
    #5
    A = 2;
    B = 3;
    OP = 6'b100000; //ADD
    
    #5
    A = 6;
    B = 5;
    OP = 6'b100010; //SUB
    
    #5
    A = 7;
    B = 7;
    OP = 6'b100100; //AND

    #5
    A = 5;
    B = 2;
    OP = 6'b100101; //OR
    
    #5
    A = 8; //001000
    B = 2; //000010
    OP = 6'b100111; //XOR
    
    #5
    A = 15;
    B = 1;
    OP = 6'b000011; //SRA
    
    #5
    A = 15;
    B = 1;
    OP = 6'b000010; //SRL
    
    #5
    A = 8; //10110
    B = 12; //01010
    OP = 6'b100111; //NOR
    
    #5
    A = 0; 
    B = 0; 
    OP = 6'b100111; //AND
  end
   
  ALU instance_ALU(
        .o_res(RES), 
        .i_A (A), 
        .i_B (B), 
        .i_OP(OP)
  );
  
   endmodule