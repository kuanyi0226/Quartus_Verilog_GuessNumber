module DotMatrixDisplay(clk_div, rst, inCorrect, ansCorrect, dot_row, dot_col);
input clk_div, rst, signal;
output [7:0]dot_row;
output [7:0]dot_col;
reg [7:0]dot_row;
reg [7:0]dot_col;
reg [1:0]signal;

parameter wrong = 2'd0, correct = 2'd1, error = 2'd2, ok = 2'd3;

always@ (inCorrect or ansCorrect)
begin
    if (inCorrect == 0)
    begin
        signal = error;
    end

    else if (inCorrect == 1)
    begin
        signal = ok;
    end
    
    else if (ansCorrect == 0)
    begin
        signal = wrong;;
    end

    else if (ansCorrect == 1)
    begin
        signal = correct;
    end

    else
    begin
        signal = error;
    end
end

always@ (posedge clk_div or negedge rst)
begin
	if (~rst)
	begin
		dot_row <= 8'b11111111;
		dot_col <= 8'b00000000;
		row_count <= 0;
	end
    
	else
	begin
		if (row_count == 7) row_count <= 0;
		else row_count <= row_count + 1;

		case (row_count)
			3'd0: dot_row <= 8'b01111111;
			3'd1: dot_row <= 8'b10111111;
			3'd2: dot_row <= 8'b11011111;
			3'd3: dot_row <= 8'b11101111;
			3'd4: dot_row <= 8'b11110111;
			3'd5: dot_row <= 8'b11111011;
			3'd6: dot_row <= 8'b11111101;
			3'd7: dot_row <= 8'b11111110;
		endcase

        case (signal):
            correct:
            begin
                case (row_count)
                    3'd0: dot_col <= 8'b11111111;
                    3'd1: dot_col <= 8'b10000001;
                    3'd2: dot_col <= 8'b10000001;
                    3'd3: dot_col <= 8'b10000001;
                    3'd4: dot_col <= 8'b10000001;
                    3'd5: dot_col <= 8'b10000001;
                    3'd6: dot_col <= 8'b10000001;
                    3'd7: dot_col <= 8'b11111111;
                endcase
            end

            wrong:
            begin
                case (row_count)
                    3'd0: dot_col <= 8'b10000001;
                    3'd1: dot_col <= 8'b01000010;
                    3'd2: dot_col <= 8'b00100110;
                    3'd3: dot_col <= 8'b00011000;
                    3'd4: dot_col <= 8'b00011000;
                    3'd5: dot_col <= 8'b00100100;
                    3'd6: dot_col <= 8'b01000010;
                    3'd7: dot_col <= 8'b10000001;
                endcase
            end

            error:
            begin
                case (row_count)
                    3'd0: dot_col <= 8'b00000000;
                    3'd1: dot_col <= 8'b10011111;
                    3'd2: dot_col <= 8'b11011001;
                    3'd3: dot_col <= 8'b11011001;
                    3'd4: dot_col <= 8'b10111001;
                    3'd5: dot_col <= 8'b10111001;
                    3'd6: dot_col <= 8'b10011111;
                    3'd7: dot_col <= 8'b00000000;
                endcase
            end

            ok:
            begin
                case (row_count)
                    3'd0: dot_col <= 8'b00000000;
                    3'd1: dot_col <= 8'b11111001;
                    3'd2: dot_col <= 8'b10011010;
                    3'd3: dot_col <= 8'b10011100;
                    3'd4: dot_col <= 8'b10011100;
                    3'd5: dot_col <= 8'b10011010;
                    3'd6: dot_col <= 8'b10011001;
                    3'd7: dot_col <= 8'b00000000;
                endcase
            end

            default:
            begin
                dot_col <= 8'b00000000;
            end
        endcase
		
	end
end

endmodule