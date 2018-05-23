
module EX_MEM( en_reg, clk, rst, MemtoReg_out_from_ID, RegWrite_out_from_ID, MemRead_out_from_ID, MemWrite_out_from_ID,
	           MemtoReg_out_from_EX, RegWrite_out_from_EX, MemRead_out_from_EX, MemWrite_out_from_EX,
	       alu_out, alu_out_out,
	       rfile_rd2_out, mem_wd,
	       rfile_wn, rfile_wn_out );

input clk, rst, en_reg;
input MemtoReg_out_from_ID, RegWrite_out_from_ID, MemRead_out_from_ID, MemWrite_out_from_ID;
input [31:0] alu_out, rfile_rd2_out;
input [4:0] rfile_wn;

output MemtoReg_out_from_EX, RegWrite_out_from_EX, MemRead_out_from_EX, MemWrite_out_from_EX;
output [31:0] alu_out_out, mem_wd;
output [4:0] rfile_wn_out;

reg MemtoReg_out_from_EX, RegWrite_out_from_EX, MemRead_out_from_EX, MemWrite_out_from_EX;
reg [31:0] alu_out_out, mem_wd;
reg [4:0] rfile_wn_out;


always@ ( posedge clk )
begin
  if( rst )
  begin
    MemtoReg_out_from_EX <= 1'bx; RegWrite_out_from_EX <= 1'bx;
	MemRead_out_from_EX <= 1'bx; MemWrite_out_from_EX <= 1'bx;

    alu_out_out <= 32'd0;
    mem_wd <= 32'd0;
    rfile_wn_out <= 5'b00000;
  end
  else if ( en_reg )
  begin
    MemtoReg_out_from_EX <= MemtoReg_out_from_ID; RegWrite_out_from_EX <= RegWrite_out_from_ID;
    MemRead_out_from_EX <= MemRead_out_from_ID; MemWrite_out_from_EX <= MemWrite_out_from_ID;

    alu_out_out <= alu_out;
    mem_wd <= rfile_rd2_out;
    rfile_wn_out <= rfile_wn;
  end
end
endmodule
