/*在CPU裡面，負責管控
如果MEMORY還在傳資料 其他的模組就必須維持原狀 
*/


module MemFreeze( clk, rst, state, freeze ) ;

input clk, rst
input [2:0] state ;

output freeze ;

reg curr_state , next_state ;

parameter FREEZE = 1'b0 ;
parameter MOVE = 1'b1 ;
parameter FREE = 3'b010;
parameter STALL = 3'b111;


always@( posedge clk )
begin
	if ( rst == 1 )
		curr_state = MOVE ;
	else
		curr_state = next_state ;
end

always@( state or curr_state )
begin
	case( curr_state ) 
		MOVE :
		begin
			if( state == FREE )
				curr_state = MOVE ;
			else if( state == STALL )
				curr_state = FREEZE ;
			else 
				curr_state = MOVE ;
				
			freeze = MOVE ;
		end
		
		FREEZE :
		begin
			if( state == FREE )
				curr_state = MOVE ;
			else if( state == STALL )
				curr_state = FREEZE ;
			else 
				curr_state = FREEZE ;
		end
		
		default : 
		begin 
			curr_state = MOVE ;
			freeze = MOVE ;
		end
end