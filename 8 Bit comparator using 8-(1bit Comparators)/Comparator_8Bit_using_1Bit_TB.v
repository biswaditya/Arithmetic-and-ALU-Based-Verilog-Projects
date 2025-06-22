`timescale 1ns / 1ps

module Comparator_8Bit_using_1Bit_TB;
    reg [7:0] A;
    reg [7:0] B;
    wire A_greater_B;
    wire A_equal_B;
    wire A_lesser_B;

    // Instantiate your comparator
    Comparator_8Bit_using_1Bit uut (
        .A(A),
        .B(B),
        .A_greater_B(A_greater_B),
        .A_equal_B(A_equal_B),
        .A_lesser_B(A_lesser_B)
    );

    initial begin
       
        $monitor("Time=%0t| A=%b | B=%b | A>B=%b | A==B =%b |  A<B =%b |", $time, A, B, A_greater_B, A_equal_B, A_lesser_B);
        
   
 // Apply binary test cases
               A = 8'b11001010; B = 8'b10101010; #10;  // A > B
               A = 8'b00011000; B = 8'b00110000; #10;  // A < B
               A = 8'b11110000; B = 8'b11110000; #10;  // A == B
               A = 8'b00000000; B = 8'b00000000; #10;  // A == B
               A = 8'b11111111; B = 8'b00000001; #10;  // A > B
               A = 8'b00000001; B = 8'b11111111; #10;  // A < B
               A = 8'b10000000; B = 8'b10000000; #10;  // A == B (MSB set)
        
        $finish;
    end
endmodule
