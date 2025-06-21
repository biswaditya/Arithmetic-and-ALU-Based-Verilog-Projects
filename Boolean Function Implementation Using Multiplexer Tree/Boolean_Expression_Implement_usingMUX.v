`timescale 1ns / 1ps
//Boolean Function Implementation Using Multiplexer Tree
module mux2x1_case (
    input a,         
    input b,        
    input sel,       
    output reg y    
);
    always @(*) begin
        case (sel)
            1'b0: y = a;
            1'b1: y = b;
            default: y = 1'b0; 
        endcase
    end
endmodule

module Boolean_Expression_Implement_usingMUX(
    input A,B,C,D,
    output Y
    );
    //Let The Function Y(A,B,C,D) = m(1,3,4,6.10,11,12,13)
    //Let Us Implement Using 2X1MUX Tree
    wire i0,i1,i2,i3;
    wire t1,t2;// Thses are Output of M1,M2 MUX
    assign {i0,i1,i2,i3}={D,~D,C,~C};
    // For Mux M!,M2 use B as Select Line ANB For Final MUX M3 us A
    mux2x1_case M1(i0,i1,B,t1);
    mux2x1_case M2(i2,i3,B,t2);
    mux2x1_case M3(t1,t2,A,Y);//Final OUTPUT
endmodule
