module inputnumber(nonerror,num,SW,check);
input check;
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
/*
module inputnumber(nonerror,num,SW,check);
input check;
input [9:0] SW;
output[4:0]num;
output nonerror;
reg nonerror;
reg [4:0] num;
reg [4:0] checknum;
reg [4:0] test;

always@(*)
begin
	if(!check)
	begin
			checknum=0;
			num=10;
	
			for(test=0;test<=5'd9;test=test+1)
				begin
				if(SW[test])
				begin
				checknum=checknum+1;
				end
				else
				begin
				checknum=checknum;
				end
				end
				
		if(checknum==1)
		begin
		nonerror=1;
			for(test=0;test<=9;test=test+1)
			begin
				if(SW[test])
				begin
				num=test;
				end
				else
				begin
				num=num;
				end
			end
		end
		else
			begin
			num=num;
			nonerror=0;
			end	
end
else
begin
num=num;
end
end

endmodule	
*/