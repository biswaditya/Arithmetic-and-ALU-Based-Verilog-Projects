`timescale 1ns / 1ps
//4-Bit BCD to 7-Segment Display Converter
module BCD_to_7Segment_Display(
input [3:0] BCD,
    output reg A,B,C,D,E,F,G
    );
    //Segments are {A,B,C,D,E,F,G};
    //    -- A --
    //   |       |
    //   F       B
    //   |       |
    //    -- G --
    //   |       |
    //   E       C
    //   |       |
    //    -- D --
    
    always@(*)
    begin
         case(BCD)
              4'b0000: {A,B,C,D,E,F,G} = 7'b1111110; // 0
              4'b0001: {A,B,C,D,E,F,G} = 7'b0110000; // 1
              4'b0010: {A,B,C,D,E,F,G} = 7'b1101101; // 2
              4'b0011: {A,B,C,D,E,F,G} = 7'b1111001; // 3
              4'b0100: {A,B,C,D,E,F,G} = 7'b0110011; // 4
              4'b0101: {A,B,C,D,E,F,G} = 7'b1011011; // 5
              4'b0110: {A,B,C,D,E,F,G} = 7'b1011111; // 6
              4'b0111: {A,B,C,D,E,F,G} = 7'b1110000; // 7
              4'b1000: {A,B,C,D,E,F,G} = 7'b1111111; // 8
              4'b1001: {A,B,C,D,E,F,G} = 7'b1111011; // 9
              default: {A,B,C,D,E,F,G} = 7'b0000000; //Blank for Invalid BCD
          endcase
    end
endmodule
