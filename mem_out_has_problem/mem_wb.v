
module MEM_WB( en_reg, clk, rst, MemtoReg_out_from_EX, RegWrite_out_from_EX, 
               MemtoReg_out_from_MEM, RegWrite_out_from_MEM,
			   dmem_rdata, dmem_rdata_out,
               alu_out_out, alu_out_out_out,
			   rfile_wn_out, rfile_wn_out2);

input clk, rst, en_reg, MemtoReg_out_from_EX, RegWrite_out_from_EX;
input [4:0] rfile_wn_out;
input [31:0] alu_out_out, dmem_rdata;

output MemtoReg_out_from_MEM, RegWrite_out_from_MEM;
output [31:0] dmem_rdata_out, alu_out_out_out;
output [4:0] rfile_wn_out2;

reg MemtoReg_out_from_MEM, RegWrite_out_from_MEM;
reg [31:0] dmem_rdata_out, alu_out_out_out;
reg [4:0] rfile_wn_out2;


always@( posedge clk )
begin
  if( rst )
  begin
    MemtoReg_out_from_MEM <= 1'bx; RegWrite_out_from_MEM <= 1'bx;

    dmem_rdata_out <= 32'd0;
    alu_out_out_out <= 32'd0;
	rfile_wn_out2 <= 5'd0;
  end
  else if ( en_reg )
  begin
    MemtoReg_out_from_MEM <= MemtoReg_out_from_EX; RegWrite_out_from_MEM <= RegWrite_out_from_EX;
	
    dmem_rdata_out <= dmem_rdata;
    alu_out_out_out <= alu_out_out;
    rfile_wn_out2 <= rfile_wn_out;
  end
end

endmodule
