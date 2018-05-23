module minus( rst, rd1, rd2, minus_out );

input rst;
input [31:0] rd1, rd2 ;
output minus_out ;
reg minus_out;

always @( posedge rst or rd1 or rd2 )
begin
	if( rd1 == rd2 )
		minus_out = 1'b1 ;
	else if( rd2 == 0 && rd1 > rd2 )
		minus_out = 1'b1 ;
	else
		minus_out = 1'b0 ;
end
	


endmodule 