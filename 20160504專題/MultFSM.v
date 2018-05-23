
module Mult_Detection( clk, rst, instr, en_Mult, en_M2 );

input clk, rst;
input [31:0] instr;

output en_M2;
output [2:0] en_Mult;

reg en_M2;
reg [2:0] en_Mult;
reg [2:0] curr_state, next_state;
reg [5:0] counter;

parameter Free = 3'b101;
parameter Stall = 3'b000; // {en_IF, flash, en_PC}


always@ (posedge clk) begin
  if (rst) curr_state <= Free;
  else curr_state <= next_state;
  
  counter <= counter+1;
end


always@ (instr or curr_state or counter) begin
  case (curr_state)
    Free:
	begin
		if ({instr[31:26], instr[5:0]} == 12'd24)
		begin
			next_state = Stall;
			counter = 0;
		end
		else
		begin
			next_state = Free;
		end
	  
		en_Mult = Free;
		en_M2 =  1'b0 ;
    end
  
    Stall:
	begin
		if (counter == 32)
		begin
			next_state = Free;
		end
		else
		begin
			next_state = Stall;
		end
	
	
	    en_Mult = Stall;
	    en_M2 = 1'b1 ;
	end
	default: next_state = Free ;
  endcase
end


endmodule
