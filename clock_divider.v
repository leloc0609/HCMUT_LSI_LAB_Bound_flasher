module clock_divider(clk, rst,clk_out);
	input clk, rst;
	output clk_out;

	reg [27:0]counter;
	initial counter=0;
	
	always @(posedge clk)
	begin
		if (rst == 0)
		begin
			counter <= 0;
		end
		else
		begin
			counter <= counter +1;
			if (counter >= ((50000000/2)-1))
				counter <= 0;
		end
		clk_out <= (counter <= (25000000/2))? 0: 1;
	end
endmodule