
module HiLo ( clk, rst, en_reg, sumofMul, HiOut, LoOut );
input clk ;
input reset ;
input [63:0] sumofMul ;
output [31:0] HiOut ;
output [31:0] LoOut ;

reg[31:0] HiOut, LoOut ;

always@( posedge clk )
begin
  if ( rst )
  begin
	HiOut <= 32'b0 ;
	LoOut <= 32'b0 ;
  end

  else if( en_reg )
  begin
	HiOut <= sumofMul[63:32] ;
	LoOut <= sumofMul[31:0];
  end
end

endmodule