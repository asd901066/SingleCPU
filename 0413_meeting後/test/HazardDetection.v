

module Hazard_Detection( clk, rst, MemRead_out_from_ID, Rt_out_from_ID, Rs, Rt, en_HD, en_H3 ) ;

input clk, rst, MemRead_out_from_ID ;
input [4:0] Rs, Rt, Rt_out_from_ID ;

output en_H3 ;
output [2:0] en_HD ;

reg en_H3 ;
reg[2:0] en_HD ;
reg[2:0] current_state, next_state;

parameter Idle = 3'b101 ;
parameter Stall = 3'b010 ; // {en_IF, flash, en_PC}


always@( MemRead_out_from_ID or Rt_out_from_ID or Rs or Rt )
begin
    if( MemRead_out_from_ID ) begin
	    if( Rt_out_from_ID == Rs ) begin
		    en_HD = Stall ;
		    en_H3 = 1'b1 ;
		end
		else if( Rt_out_from_ID == Rt ) begin
            en_HD = Stall ;
		    en_H3 = 1'b1 ;
        end
	    else begin
			en_HD = Idle ;
		    en_H3 = 1'b0 ;
		end
	end
	else begin
        en_HD = Idle ;
		en_H3 = 1'b0 ;
	end
end
/*

always@( posedge clk ) 
  if( rst ) current_state = Idle ;
  else current_state = next_state ;
  
always@( MemRead_out_from_ID or Rt_out_from_ID or Rs or Rt or current_state )
begin
  case( current_state )
  Idle: begin
		if( MemRead_out_from_ID ) begin
		  if( Rt_out_from_ID == Rs )
		    next_state = Stall ;
		  else if( Rt_out_from_ID == Rt )
		    next_state = Stall ;
		  else next_state = Idle ;
        end
		else next_state = Idle ;
		
		en_HD = Idle ;
		en_H3 = 1'b0 ;
		
		end
  Stall:begin
		next_state = Idle ;
		
		en_HD = Stall ;
		en_H3 = 1'b1 ;
		
		end
  default: next_state = Idle ;
  endcase
end   
*/

endmodule