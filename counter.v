module counter(clk, rst,counter_in, counter_out);
input clk, rst;
input [3:0]counter_in;
output reg[3:0]counter_out;

initial counter_out = counter_in;

always@(posedge clk)
	begin
		if (rst==1'b0)
		begin
			counter_out<=0;
		end
		else
		begin
			counter_out<= counter_out +1;
			if (counter_out < 4'b1111)
			begin
				counter_out <= 4'b0000;
			end 
		end
	end

endmodule
