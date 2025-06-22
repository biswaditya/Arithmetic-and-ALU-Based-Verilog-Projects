`timescale 1ns / 1ps

module Priority_Encoder_8to3(
    input [7:0] D,// Input decimal digits
    output reg [2:0]B // Output Binary Bits
    );
    //D[0],D[1],D[2],D[3],D[4],D[5],D[6],D[7] represents Decimal 1,2,3,4,5,6,7
    // let priority be D[0]<D[1]<D[2]<D[3]<D[4]<D[5]<D[6]<D[7]
    
    always@(*)
    begin
            casez(D)
            8'b00000001 : B = 3'b000; //Least Priority
            8'b0000001? : B = 3'b001;
            8'b000001?? : B = 3'b010;
            8'b00001??? : B = 3'b011;
            8'b0001???? : B = 3'b100;
            8'b001????? : B = 3'b101;
            8'b01?????? : B = 3'b110;
            8'b1??????? : B = 3'b111; //Highest Priority
            default     : B = 3'bxxx;
            endcase
    end
    
endmodule
