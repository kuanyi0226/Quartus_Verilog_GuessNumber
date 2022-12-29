module inputnumber(nonerror,num,SW,check);
input check;
input [9:0] SW;
output[4:0]num;
output nonerror;
reg nonerror;
reg [4:0] num;
reg pushed;
reg [4:0] checknum;
reg [4:0] test;
always@(*)
begin
	if(!check)
	begin
		if(pushed==0)
		begin
			checknum=0;
			num=10;
			pushed=1;
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
pushed=pushed;
end
end
else
begin
num=num;
end
end
endmodule	
