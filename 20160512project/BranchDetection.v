
module Branch_Detection(  rst, PCsrc, en_Branch, en_B1 );

input PCsrc, rst ;

output en_B1 ;
output [2:0] en_Branch ;
/*
reg en_B1 ;
reg [2:0] en_Branch ;
*/

// {en_IF, flash, en_PC}

assign en_Branch = (PCsrc) ? 3'b111 : 3'b101;
assign en_B1 = (PCsrc) ? 1'b1 : 1'b0;


endmodule

/*
always@( rst or PCsrc )
	begin
	  case( PCsrc )
	    1'b1 : begin
				  en_Branch = 3'b111 ;
                  en_B1 = 1'b1 ;				  
				end
	    1'b0 : begin
				  en_Branch = 3'b101 ;
				  en_B1 = 1'b0 ;
		       end
	    default  begin
				  en_Branch = 3'b101 ;
				  en_B1 = 1'b0 ;
		       end
	  endcase
	end   
*/

