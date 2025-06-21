`timescale 1ns / 1ps

module Boolean_Expression_Implement_usingMUX_TB;
reg A,B,C,D;
wire Y;

Boolean_Expression_Implement_usingMUX uut(A,B,C,D,Y);

integer i;

initial
begin
     $display("A,B,C,D | Y");
     $monitor("%b,%b,%b,%b | %b",A,B,C,D,Y);
     for(i = 0; i < 16; i = i + 1)
     begin
     {A,B,C,D}=i[3:0];
     #50;
     end
     $finish;
end
endmodule
