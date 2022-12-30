//Final Version
module FinalProject(
	SW, checkButt, startButt, resetButt, clock,
	Seven0,Seven1,Seven2,Seven3, dot_row, dot_col);

input [9:0] SW;
input checkButt, startButt, resetButt, clock;

output [6:0] Seven0,Seven1,Seven2,Seven3;
output [7:0] dot_row, dot_col;

wire valid, inCorrect, AnsCorrect, reachS5, divClk_dot;
wire [3:0] num_4bit;
wire [3:0] Seven0_4bit, Seven1_4bit, Seven2_4bit, Seven3_4bit;
wire [3:0] ACounter, BCounter;

wire [6:0] Seven0_AB, Seven1_AB, Seven2_AB, Seven3_AB; //?A?B
wire [6:0] Seven0_Num, Seven1_Num, Seven2_Num, Seven3_Num; //Current Input Numbers

//Part1
inputnumber inNum(.nonerror(valid),.num(num_4bit),.SW(SW));
//Part2
FinalProjectPart2 FP2(.in(num_4bit), .valid(valid), .check(checkButt),.start(startButt),.reset(resetButt),.divClk(clock),
	.SD0(Seven0_4bit),.SD1(Seven1_4bit),.SD2(Seven2_4bit),.SD3(Seven3_4bit),
	.inCorrect(inCorrect),.AnsCorrect(AnsCorrect),.ACounter(ACounter),.BCounter(BCounter), .reachS5(reachS5));
//Part3
//(dot matrix)
clk_div_dot_matrix div_clk(.clk(clock), .rst(startButt), .clk_div_dot_matrix(divClk_dot));
DotMatrixDisplay dot(.reachS5(reachS5),.clk_div(divClk_dot), .rst(startButt), .inCorrect(inCorrect),
					.ansCorrect(AnsCorrect), .dot_row(dot_row), .dot_col(dot_col));

//(seven display)
ABSevenDisplay(.in_A(ACounter), .in_B(BCounter), 
				.out_0(Seven0_AB), .out_1(Seven1_AB), .out_2(Seven2_AB), .out_3(Seven3_AB));

NumberSevenDisplay(.in_0(Seven0_4bit), .in_1(Seven1_4bit), .in_2(Seven2_4bit), .in_3(Seven3_4bit), 
					.out_0(Seven0_Num), .out_1(Seven1_Num), .out_2(Seven2_Num), .out_3(Seven3_Num));

assign Seven0 = (reachS5) ? Seven0_AB : Seven0_Num;
assign Seven1 = (reachS5) ? Seven1_AB : Seven1_Num;
assign Seven2 = (reachS5) ? Seven2_AB : Seven2_Num;
assign Seven3 = (reachS5) ? Seven3_AB : Seven3_Num;



endmodule

