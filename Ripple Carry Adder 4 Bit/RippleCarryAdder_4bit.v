`timescale 1ns / 1ps

module FullAdder_Gate(
    input a,b,cin,
    output cout,sum
    );
    wire s1,c1,c2;
    
    xor(s1,a,b);
    and(c1,a,b);
    and(c2,s1,cin);
    //Final Output
    xor(sum,s1,cin);
    or(cout,c1,c2);
    
endmodule


module RippleCarryAdder_4bit(
    input [3:0] a,
    input [3:0]b,
    input Cin,
    output Cout,
    output [3:0]sum
    );
    wire [2:0] c;
    
    FullAdder_Gate f1( a[0], b[0], Cin, c[0],sum[0]);
    FullAdder_Gate f2 (a[1], b[1], c[0], c[1], sum[1]);
    FullAdder_Gate f3 (a[2], b[2], c[1], c[2], sum[2]);
    FullAdder_Gate f4 (a[3], b[3], c[2], Cout, sum[3]);
    
endmodule
