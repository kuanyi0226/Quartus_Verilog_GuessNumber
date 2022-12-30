module inputnumber(nonerror,num,SW);
input [9:0] SW;
output[3:0]num;
output nonerror;
reg nonerror;
reg [3:0] num;

//reg [3:0] temp_num;
//reg pushed;
//reg [4:0] checknum;
//reg [4:0] test;


always @(SW)begin
	case(SW)
	10'd1: num = 4'd0;
	10'd2: num = 4'd1;
	10'd4: num = 4'd2;
	10'd8: num = 4'd3;
	10'd16: num = 4'd4;
	10'd32: num = 4'd5;
	10'd64: num = 4'd6;
	10'd128: num = 4'd7;
	10'd256: num = 4'd8;
	10'd512: num = 4'd9;
	default: num = 4'd15;
	endcase
	
	if(num == 4'd15)
		nonerror = 1'd0;
	else
		nonerror = 1'd1;
end

endmodule