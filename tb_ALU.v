module tb_ALU;
  reg A, B, OP, RES, LEDs;

  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    
    A = 0;
    B = 0;
    OP = 0;
    
    #10
    A = 0;
    B = 0;
    OP = 0;

    
    #10
    A = 0;
    B = 0;
    OP = 0;
    
    #10
    A = 0;
    B = 0;
    OP = 0;

        #10
    A = 0;
    B = 0;
    OP = 0;

    
    #10
    A = 0;
    B = 0;
    OP = 0;
    
    #10
    A = 0;
    B = 0;
    OP = 0;

  end
  
  ALU instance_ALU(
        .o_led(LEDs), 
        .i_A (B), 
        .i_B (C), 
        .i_OP(OP)
  );
                                   