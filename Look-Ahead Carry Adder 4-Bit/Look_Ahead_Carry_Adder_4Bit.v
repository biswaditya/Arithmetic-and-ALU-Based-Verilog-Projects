`timescale 1ns / 1ps

module Look_Ahead_Carry_Adder_4Bit(
    input [3:0] a,
    input [3:0] b,
    input Cin,
    output Cout,
    output [3:0] Sum
    );
    
    wire [3:0]p; //carry propagating terms
    wire [3:0]g; //carry generating terms
    wire [3:1]c; // Intermediate Carry Bits
    
    // Assign carry propagating terms
    xor x1 (p[0],a[0],b[0]);
    xor x2 (p[1],a[1],b[1]);
    xor x3 (p[2],a[2],b[2]);
    xor x4 (p[3],a[3],b[3]); 
    
    // Assign carry generating terms 
    and a1 (g[0],a[0],b[0]);
    and a2 (g[1],a[1],b[1]);
    and a3 (g[2],a[2],b[2]);
    and a4 (g[3],a[3],b[3]);
    
    // Assign carry terms
    //assign c[1]= g[0] | (p[0]&Cin);
   // assign c[2]= g[1] | (p[1]&c[1]);
   // assign c[3]= g[2] | (p[2]&c[2]);
   // assign Cout= g[3] | (p[3]&c[3]);
   
   assign c[1] = g[0] | (p[0] & Cin);
   assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & Cin);
   assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & Cin);
   assign Cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & Cin);

    
    // Assign Sum terms
    assign Sum[0]= p[0]^Cin ;
    assign Sum[1]= p[1]^c[1];
    assign Sum[2]= p[2]^c[2];
    assign Sum[3]= p[3]^c[3];
    
endmodule
