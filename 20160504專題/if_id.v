
module IF_ID( en_IF, IF_flush, clk, rst, instr, instr_out, pc_incr, pc_outcr );
  input clk, rst, en_IF, IF_flush;
  input [31:0] instr, pc_incr;

  output [31:0] instr_out, pc_outcr;
  
  reg [31:0] instr_out, pc_outcr;

  
  always@( posedge clk )
  begin
    if ( rst )
	begin
	  instr_out <= 32'bx;
	  pc_outcr <= 32'b0;
	end
	else if ( en_IF )
	begin
      instr_out <= instr;
	  pc_outcr <= pc_incr;
	end
	else if ( !en_IF )
	begin
	  
	end
	if( IF_flush )
	  instr_out <= 32'b0 ;
  end
  
endmodule
