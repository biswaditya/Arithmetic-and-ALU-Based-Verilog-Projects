`timescale 1ns / 1ps
//Even and Odd Parity Generator and Error Checker
module Parity_Generator_Checker(
    input A,B,C, //3 Data Bit
    input parity_in, // 1 Parity Bit
    output even_parity_gen,
    output odd_parity_gen,
    output even_parity_Error,
    output odd_parity_Error
    );
    // Generate Parity 
    assign even_parity_gen = A^B^C;
    assign odd_parity_gen = ~(A^B^C);
    // Check for Error in parity
    assign even_parity_Error = A^B^C^parity_in;
    assign odd_parity_Error = ~(A^B^C^parity_in);
    
endmodule
