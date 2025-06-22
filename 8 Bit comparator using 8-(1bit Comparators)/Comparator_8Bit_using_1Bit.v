`timescale 1ns / 1ps

// 8 Bit comparator using 8 - 1bit Comparators
module Comparator_1bit (
    input A,
    input B,
    output A_greater_B,
    output A_equal_B,
    output A_less_B
);

    assign A_greater_B = (A > B);
    assign A_equal_B   = (A == B);
    assign A_less_B    = (A < B);

endmodule

module Comparator_8Bit_using_1Bit(
    input [7:0] A,
    input [7:0] B,
    output A_greater_B,
    output A_equal_B,
    output A_lesser_B
    );
    wire [7:0]G;
    wire [7:0]E;
    wire [7:0]L;
    
    Comparator_1bit c7(A[7], B[7], G[7], E[7], L[7]);
    Comparator_1bit c6(A[6], B[6], G[6], E[6], L[6]);
    Comparator_1bit c5(A[5], B[5], G[5], E[5], L[5]);
    Comparator_1bit c4(A[4], B[4], G[4], E[4], L[4]);
    Comparator_1bit c3(A[3], B[3], G[3], E[3], L[3]);
    Comparator_1bit c2(A[2], B[2], G[2], E[2], L[2]);
    Comparator_1bit c1(A[1], B[1], G[1], E[1], L[1]);
    Comparator_1bit c0(A[0], B[0], G[0], E[0], L[0]);
    
    assign A_greater_B = 
         G[7] |
        (E[7] & G[6]) |
        (E[7] & E[6] & G[5]) |
        (E[7] & E[6] & E[5] & G[4]) |
        (E[7] & E[6] & E[5] & E[4] & G[3]) |
        (E[7] & E[6] & E[5] & E[4] & E[3] & G[2]) |
        (E[7] & E[6] & E[5] & E[4] & E[3] & E[2] & G[1]) |
        (E[7] & E[6] & E[5] & E[4] & E[3] & E[2] & E[1] & G[0]);
    
    assign A_equal_B = (E[7] & E[6] & E[5] & E[4] & E[3] & E[2] & E[1] & E[0]);
    
    assign A_lesser_B =
         L[7] |
        (E[7] & L[6]) |
        (E[7] & E[6] & L[5]) |
        (E[7] & E[6] & E[5] & L[4]) |
        (E[7] & E[6] & E[5] & E[4] & L[3]) |
        (E[7] & E[6] & E[5] & E[4] & E[3] & L[2]) |
        (E[7] & E[6] & E[5] & E[4] & E[3] & E[2] & L[1]) |
        (E[7] & E[6] & E[5] & E[4] & E[3] & E[2] & E[1] & L[0]);
  
    
endmodule
