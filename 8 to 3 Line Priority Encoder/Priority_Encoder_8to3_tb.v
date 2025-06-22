`timescale 1ns / 1ps

module Priority_Encoder_8to3_tb;
    reg [7:0] D;
    wire [2:0] B;
    
    Priority_Encoder_8to3 uut(D,B);
    
    integer i;
    
    initial 
    begin 
         $monitor("Time=%0t| D=%b | B=%b ", $time, D, B);
          // Total cases are 2 power 8 means 256 cases   
         for(i=0; i<=255 ;i=i+1)
         begin
         D=i[7:0]; #3;
         end
         $finish;
    end
    
endmodule
