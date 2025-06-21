`timescale 1ns / 1ps

    module Logic_Lock_tb;
    reg [15:0] Pin ;
    wire Unlock;

    Logic_Lock uut (.Pin(Pin),.Unlock(Unlock) );

    integer i;
    reg [15:0] test [0:10];  // Array of Test PINs
    

    initial
    begin
     // Total Combination to unlock the Lock is 2^16 cases = 65,536 cases
     // Not Possible To Take all 65,536 cases
     // Take 10 test Cases to Demonstrate Working
        test[0]  = 16'h123D;  // Incorrect
        test[1]  = 16'h127A;  // Incorrect
        test[2]  = 16'h5623;  // Incorrect
        test[3]  = 16'hEF23;  // Incorrect
        test[4]  = 16'hA1B2;  // Incorrect
        test[5]  = 16'hABC7;  // Correct PIN
        test[6]  = 16'hFEFA;  // Incorrect
        test[7]  = 16'h1234;  // Incorrect
        test[8]  = 16'hABCD;  // Incorrect
        test[9]  = 16'h5678;  // Incorrect
        test[10] = 16'hA23E;  // Incorrect
        
            $display("Pin  | Unlock");
        for (i = 0; i < 11; i = i + 1)
        begin
            Pin = test[i];
            #10;
            $display("%b |   %b", Pin, Unlock); 
        end
    $finish;
    end
    endmodule
