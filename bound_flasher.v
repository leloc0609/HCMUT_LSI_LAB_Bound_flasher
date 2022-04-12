module bound_flasher(clk, rst_n, flick, led);

parameter MAX_LED = 16;
parameter STATE_INIT 		= 3'b000;
parameter STATE_ON_0TO5 	= 3'b001;
parameter STATE_OFF_5TO0 	= 3'b010;
parameter STATE_ON_0TO10 	= 3'b011;
parameter STATE_OFF_10TO5 	= 3'b100;
parameter STATE_ON_5TO15 	= 3'b101;
	
input clk, rst_n, flick;
output reg led [MAX_LED-1:0];

wire clk, rst_n, flick; 
reg [3:0] count;

// Inner vars
reg [2:0] state;
reg [2:0] next_state;
reg [MAX_LED-1:0] next_led;

initial count = 4'b0000;
initial led = 16'd0;
initial next_led = 16'd0;

always@(posedge clk, negedge rst_n)
	begin
		if (!rst_n)  
			begin
				state <= STATE_INIT;
			end
		else	
			begin
				state <= next_state;
			end
	end

	
always@(state, flick, led)
	begin
		case(state)
			STATE_INIT: 
				begin 
					if (count > 0)
						begin
							led[count] = 1'b0;
							count--;
							next_state = STATE_INIT;
						end
					else
						next_state = (flick) ? 	STATE_ON_0TO5 : STATE_INIT;
				end
				
			STATE_ON_0TO5: 
				begin
					if (count < 5)
						begin
							led[count] = 1'b1;
							count++;
							next_state = STATE_ON_0TO5;
						end
					else
						next_state = STATE_OFF_5TO0;
				end
				
			STATE_OFF_5TO0:
				begin
					if (count )
				end
					
				end
	end
endmodule
