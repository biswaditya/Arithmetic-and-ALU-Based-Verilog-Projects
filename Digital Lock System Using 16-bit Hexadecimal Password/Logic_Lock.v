`timescale 1ns / 1ps

//Digital Lock System Using 16-bit Hexadecimal Password
module Logic_Lock(
    input [15:0] Pin,
    output reg Unlock
    );
    
    //Let Password =16'hABC7
    // Total Combination to unlock the Lock is 2^16 cases = 65,536 cases
    always@(*)
begin 
        case(Pin)
        16'hABC7 : Unlock = 1; //system Unlocked
        default  : Unlock = 0; //system Locked
        endcase
end    
endmodule

