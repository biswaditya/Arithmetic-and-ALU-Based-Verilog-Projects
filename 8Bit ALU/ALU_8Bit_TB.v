`timescale 1ns / 1ps

module ALU_8Bit_TB;
 reg [7:0] A;
 reg [7:0] B;
 reg [2:0] sel;
 wire [7:0] Y;
 wire Cout;

 ALU_8Bit uut(A,B,sel,Y,Cout);
 
 integer i;
 
 initial 
 begin
 A = 8'b10101010;
 B = 8'b11001100; 
 
    $monitor("Time=0%t | A=%b | B=%b | sel=%b | Y=%b | Cout=%b", 
           $time, A, B, sel, Y, Cout);
          for (i = 0; i <= 7; i = i + 1)
          begin
          sel= i[2:0];
          #100;
          
          end
         $finish;
       
 end
endmodule
