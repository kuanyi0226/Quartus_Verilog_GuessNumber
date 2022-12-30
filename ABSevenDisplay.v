module ABSevenDisplay(in_A, in_B, out_0, out_1, out_2, out_3);

input [3:0] in_A;
input [3:0] in_B;
output reg [6:0] out_0;
output reg [6:0] out_1;
output reg [6:0] out_2;
output reg [6:0] out_3;

always @(*)begin
	case(in_A)
    0 : out_3 = 7'b1000000;
    1 : out_3 = 7'b1111001;
    2 : out_3 = 7'b0100100;
    3 : out_3 = 7'b0110000;
    4 : out_3 = 7'b0011001;
    default : out_3 = 7'b1111111;
endcase

case(in_B)
    0 : out_1 = 7'b1000000;
    1 : out_1 = 7'b1111001;
    2 : out_1 = 7'b0100100;
    3 : out_1 = 7'b0110000;
    4 : out_1 = 7'b0011001;
    default : out_1 = 7'b1111111;
endcase

out_2 = 7'b0001000;
out_0 = 7'b0000011;
end

endmodule
