module main(clk, rst_counter,rst_divider, rst_n, flick, led);
	input clk, rst_counter,rst_divider, rst_n, flick;
	output[15:0] led;
	
	wire clk_1hz;
	wire [3:0] 	count_1;
	wire [3:0] 	count_2;
	assign count = 4'b0000;
	clock_divider uut1(
		clk,
		rst_divider,
		clk_1Hz
	);

	counter uut2(
		clk_1Hz,
		rst_counter,
		count_1,
		count_2
	);
	
	bound_flasher uut3(
		rst_n,
		count_2,
		flick,
		count_1,
		led
	);	
endmodule 
