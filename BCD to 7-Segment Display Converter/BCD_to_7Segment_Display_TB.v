`timescale 1ns / 1ps

module BCD_to_7Segment_Display_TB;
reg [3:0]BCD;
wire A,B,C,D,E,F,G;

BCD_to_7Segment_Display uut(BCD,A,B,C,D,E,F,G);
 
integer i;

    initial
    begin
        $display("BCD  | A,B,C,D,E,F,G");
        for (i = 0; i<=9 ; i = i + 1)
        begin
            BCD = i[3:0]; 
            #10;
            $display("%b | %b,%b,%b,%b,%b,%b,%b",BCD,A,B,C,D,E,F,G); 
        end
    $finish;
    end
    endmodule
