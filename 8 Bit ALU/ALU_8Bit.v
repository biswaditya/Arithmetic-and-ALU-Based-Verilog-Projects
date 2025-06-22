`timescale 1ns / 1ps

module ALU_8Bit(
    input [7:0] A, // 8-bit input A
    input [7:0] B, // 8-bit input B
    input [2:0] sel, // 3-bit operation selector
    output reg [7:0] Y, // 8-bit result
    output reg Cout  // Carry out (for add/sub/INC/DEC)
    );
    
    always@(*)
    begin 
      Cout = 0;  // Default no carry
      case(sel)
       3'b000 : {Cout,Y}=A+B ; // ADD
       3'b001 : {Cout,Y}=A-B ; // SUBTRACT
       3'b010 :  Y = A&B ;     // AND
       3'b011 :  Y = A|B ;     // OR
       3'b100 :  Y = A^B ;     // XOR
       3'b101 :  Y = ~A  ;     //NOT A
       3'b110 : {Cout,Y}=A+1 ; //INCREMENT A BY 1
       3'b111 : {Cout,Y}=A-1 ; //DECREMENT A BY 1
       default: Y = 8'b00000000  ; 
      endcase
    end
endmodule
