//-----------------------------------------------------------------------------
// Title         : 2-1 multiplexer
//-----------------------------------------------------------------------------

module mux1( sel, a, b, y, r1, r2, rout );
    input sel;
    input [15:0] a;
	input [4:0] b, r1, r2;
	
    output [15:0] y;
	output [4:0] rout;

    assign y = sel ? { {11'b0}, b } : a;
	assign rout = sel ? r2 : r1;
endmodule
