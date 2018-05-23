//-----------------------------------------------------------------------------
// Title         : 2-1 multiplexer
//-----------------------------------------------------------------------------

module mux2( sel, a, b, y );
    parameter bitwidth=32;
    input sel;
    input  [bitwidth-1:0] a, b;
    output [bitwidth-1:0] y;
    reg [bitwidth-1:0] y ;
	
	always@( a or b or sel )
	begin
	  case(sel)
	    1'b1 : y = b ;
	    1'b0 : y = a ;
	    default y = a ;
	  endcase
	end  
	
    // assign y = (sel==1'b1) ? b : a; 
endmodule
