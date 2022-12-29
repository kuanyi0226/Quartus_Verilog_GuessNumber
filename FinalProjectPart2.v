module FinalProjectPart2(
	in, valid, check,start,reset,divClk,
	SD0,SD1,SD2,SD3,inCorrect,AnsCorrect,ACounter,BCounter, reachS5);

input[3:0] in;
input check,start,reset; //Buttons
input divClk, valid; //valid num?

output reg [3:0] SD0,SD1,SD2,SD3; // SevenDisplay
output [3:0] ACounter,BCounter;
output inCorrect, AnsCorrect, reachS5;
reg inCorrect;

reg [3:0] A0,A1,A2,A3; // storing the ans
reg [3:0] In0, In1, In2, In3; //storing the ans player guess
reg[2:0] state;
reg[15:0] counter,answer;
reg lockAns; //helping lock the random four nums which shouldnt be same

parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5; 
integer i;

wire [2:0] countA, countB;
wire Aarray[0:3];
wire Barray[0:3];

//creating four random number(also the four num is different)
always @(posedge divClk or negedge start)
begin
	if(!start) begin
		answer <= counter;
	end
	else
		counter <= counter+1;
end

always @(posedge divClk or negedge check or negedge start) begin
	//init
	if(!start)begin
		lockAns <= 1'b0;
	end
	else if(!check) begin
		if(!lockAns)begin
		A0 <= answer[3:0] % 4'd10;
		A1 <= answer[7:4] % 4'd10;
		A2 <= answer[11:8] % 4'd10;
		A3 <= answer[15:12] % 4'd10;
		lockAns <= 1'b1;
		end
	end
	else begin
		A1 <= (A1 == A0) ? (A1 + 1'b1) % 4'd10 : A1;
		A2 <= (A2 == A0 || A2 == A1) ? (A2 + 1'b1) % 4'd10 : A2;
		A3 <= (A3 == A0 || A3 == A1 || A3 == A2) ? (A3 + 1'b1) % 4'd10 : A3;
	end
end

//state & inCorrect
always @(negedge reset or negedge start or negedge check)begin
	if(!reset || !start) //press reset or start: reset the state
		state <= S0;
	else if(!check) begin
		if(valid == 1'b0)begin //invalid number: dont change state
			inCorrect <= 1'b0; //for dot matrix
			state <= state;
		end
		else begin //valid number: change state
			inCorrect <= 1'b1;
			case(state)
				S0: state <= S1;
				S1: state <= S2;
				S2: state <= S3;
				S3: state <= S4;
				S4: state <= S5;
				default: state <= state;
			endcase
		end
	end

	else
		state <= state;
end

//store the input_nums
always @(negedge reset or negedge start or negedge check)begin
	if(!reset || !start)begin //reset input
		In0 <= 4'd15;
		In1 <= 4'd15;
		In2 <= 4'd15;
		In3 <= 4'd15;
	end
	else if(!check) begin
		if(valid == 1'b1)begin //invalid number: dont change state
			case(state)
				S0: In0 <= in;
				S1: In1 <= in;
				S2: In2 <= in;
				S3: In3 <= in;
				default: In0 <= In0;
			endcase
		end
		else begin
			In0 <= In0;
			In1 <= In1;
			In2 <= In2;
			In3 <= In3;
		end
	end
	else begin
		In0 <= In0;
		In1 <= In1;
		In2 <= In2;
		In3 <= In3;
	end
end

//SevenDisplay output
always@(negedge reset or negedge start or negedge check)begin
	if(!start || !reset)
	begin
		//reset output to null
		SD0 <= 4'd15;
		SD1 <= 4'd15;
		SD2 <= 4'd15;
		SD3 <= 4'd15;
	end
	else if(!check) // check
	begin
		case(state)
			S0:begin
				SD0 <= in;
				SD1 <= 4'd15;
				SD2 <= 4'd15;
				SD3 <= 4'd15;
			end
			S1:begin
				SD0 <= SD0;
				SD1 <= in;
				SD2 <= 4'd15;
				SD3 <= 4'd15;
			end
			S2:begin
				SD0 <= SD0;
				SD1 <= SD1;
				SD2 <= in;
				SD3 <= 4'd15;
			end
			S3:begin
				SD0 <= SD0;
				SD1 <= SD1;
				SD2 <= SD2;
				SD3 <= in;
			end
			S4:begin
				SD0 <= 4'd15; //B
				SD1 <= countB; //countB
				SD2 <= 4'd15; //A
				SD3 <= countA; //countA
				end
			default: begin
				SD0 <= SD0;
				SD1 <= SD1;
				SD2 <= SD2;
				SD3 <= SD3;
			end
		endcase
	end
	
end

//?A?B
//A
assign Aarray[0] = (In0 == A0) ? 1'b1 : 1'b0;
assign Aarray[1] = (In1 == A1) ? 1'b1 : 1'b0;
assign Aarray[2] = (In2 == A2) ? 1'b1 : 1'b0;
assign Aarray[3] = (In3 == A3) ? 1'b1 : 1'b0;
//B
assign Barray[0] = (In0 == A1 || In0 == A2 || In0 == A3) ? 1'b1 : 1'b0;
assign Barray[1] = (In1 == A0 || In1 == A2 || In1 == A3) ? 1'b1 : 1'b0;
assign Barray[2] = (In2 == A0 || In2 == A1 || In2 == A3) ? 1'b1 : 1'b0;
assign Barray[3] = (In3 == A0 || In3 == A1 || In3 == A2) ? 1'b1 : 1'b0;
                

assign countA = Aarray[0] + Aarray[1] + Aarray[2] + Aarray[3];
assign countB = Barray[0] + Barray[1] + Barray[2] + Barray[3];

assign ACounter = countA;
assign BCounter = countB;

assign reachS5 = (state == S5) ? 1'b1 : 1'b0;
assign AnsCorrect = (ACounter == 2'd4 && state == S5) ? 1'b1 : 1'b0;

endmodule 