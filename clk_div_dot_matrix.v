module clk_div_dot_matrix(clk, rst, clk_div_dot_matrix);
input clk, rst;
output reg clk_div_dot_matrix;
reg [31:0]count;

always@ (posedge clk)
begin
	if (!rst)
	begin
		count <= 32'd0;
		clk_div_dot_matrix <= 1'b0;
	end
	else
	begin
		if (count == 32'd2500) // 100000 Hz
		begin
			count <= 32'd0;
			clk_div_dot_matrix <= ~clk_div_dot_matrix;
		end
		else
		begin
			count <= count + 32'd1;
		end
	end
end

endmodule