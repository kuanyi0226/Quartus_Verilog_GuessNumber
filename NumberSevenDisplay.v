module NumberSevenDisplay(in_0, in_1, in_2, in_3, out_0, out_1, out_2, out_3);

input [3:0] in_0;
input [3:0] in_1;
input [3:0] in_2;
input [3:0] in_3;
output [6:0] out_0;
output [6:0] out_1;
output [6:0] out_2;
output [6:0] out_3;

case(in_0)
    0 : out_0 = 7'b1000000;
    1 : out_0 = 7'b1111001;
    2 : out_0 = 7'b0100100;
    3 : out_0 = 7'b0110000;
    4 : out_0 = 7'b0011001;
    5 : out_0 = 7'b0010010;
    6 : out_0 = 7'b0000010;
    7 : out_0 = 7'b1111000;
    8 : out_0 = 7'b0000000;
    9 : out_0 = 7'b0010000;
    default : out_0 = 7'b1111111;
endcase

case(in_1)
    0 : out_1 = 7'b1000000;
    1 : out_1 = 7'b1111001;
    2 : out_1 = 7'b0100100;
    3 : out_1 = 7'b0110000;
    4 : out_1 = 7'b0011001;
    5 : out_1 = 7'b0010010;
    6 : out_1 = 7'b0000010;
    7 : out_1 = 7'b1111000;
    8 : out_1 = 7'b0000000;
    9 : out_1 = 7'b0010000;
    default : out_1 = 7'b1111111;
endcase

case(in_2)
    0 : out_2 = 7'b1000000;
    1 : out_2 = 7'b1111001;
    2 : out_2 = 7'b0100100;
    3 : out_2 = 7'b0110000;
    4 : out_2 = 7'b0011001;
    5 : out_2 = 7'b0010010;
    6 : out_2 = 7'b0000010;
    7 : out_2 = 7'b1111000;
    8 : out_2 = 7'b0000000;
    9 : out_2 = 7'b0010000;
    default : out_2 = 7'b1111111;
endcase

case(in_3)
    0 : out_3 = 7'b1000000;
    1 : out_3 = 7'b1111001;
    2 : out_3 = 7'b0100100;
    3 : out_3 = 7'b0110000;
    4 : out_3 = 7'b0011001;
    5 : out_3 = 7'b0010010;
    6 : out_3 = 7'b0000010;
    7 : out_3 = 7'b1111000;
    8 : out_3 = 7'b0000000;
    9 : out_3 = 7'b0010000;
    default : out_3 = 7'b1111111;
endcase

endmodule
