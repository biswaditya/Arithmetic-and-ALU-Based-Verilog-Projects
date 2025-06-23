`timescale 1ns / 1ps

module Look_Ahead_Carry_Adder_4Bit_tb;
    reg [3:0] a, b;
    reg Cin;
    wire Cout;
    wire [3:0] sum;

    
    Look_Ahead_Carry_Adder_4Bit uut (
        .a(a),
        .b(b),
        .Cin(Cin),
        .Cout(Cout),
        .Sum(sum)
    );

    //Total cases are 2^(4+4+1) = 512 cases take few test cases 

    initial begin
        $monitor("Time=%0t | a=%b b=%b Cin=%b | sum=%b Cout=%b", $time, a, b, Cin, sum, Cout);
         
        // Test 1
        a = 4'b0110; b = 4'b1100; Cin = 0; #20;

        // Test 2
        a = 4'b1101; b = 4'b1001; Cin = 1; #20;

        // Test 3
        a = 4'b0010; b = 4'b0011; Cin = 0; #20;

        // Test 4
        a = 4'b0101; b = 4'b0011; Cin = 1; #20;

        // Test 5
        a = 4'b1111; b = 4'b0001; Cin = 0; #20;

        // Test 6
        a = 4'b1111; b = 4'b1111; Cin = 1; 

        $finish;
    end

endmodule
