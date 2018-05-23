
module ID_EX( en_reg, jumpoffset, jumpoffset_out, clk, rst,
           MemtoReg, RegWrite, MemRead, MemWrite, ALUOp, RegDst, ALUSrc, Jump,
           MemtoReg_out_from_ID, RegWrite_out_from_ID, MemRead_out_from_ID, MemWrite_out_from_ID, ALUOp_out_from_ID, RegDst_out_from_ID, ALUSrc_out_from_ID,
           rfile_rd1, rfile_rd2, rfile_rd1_out, rfile_rd2_out,
	       extend_immed, extend_immed_out,
	       rs, rt, rd, rs_out, rt_out, rd_out, funct, funct_out,
			Signal_of_Detection, Signal_of_Detection_out, HiLo, HiLo_out );

input clk, rst, en_reg;
input MemtoReg, RegWrite, MemRead, MemWrite, RegDst, ALUSrc, Jump;
input [1:0] ALUOp, HiLo;
input [31:0] rfile_rd1, rfile_rd2, extend_immed;
input [4:0] rs, rt, rd;
input [5:0] funct;
input [25:0] jumpoffset;
input [ 2:0 ] Signal_of_Detection ;

output MemtoReg_out_from_ID, RegWrite_out_from_ID, MemRead_out_from_ID, MemWrite_out_from_ID, RegDst_out_from_ID, ALUSrc_out_from_ID;
output [1:0] ALUOp_out_from_ID, HiLo_out;
output [31:0] rfile_rd1_out, rfile_rd2_out, extend_immed_out;
output [4:0] rs_out, rt_out, rd_out;
output [5:0] funct_out;
output [25:0] jumpoffset_out;
output [ 2:0 ] Signal_of_Detection_out ;

reg MemtoReg_out_from_ID, RegWrite_out_from_ID, MemRead_out_from_ID, MemWrite_out_from_ID, RegDst_out_from_ID, ALUSrc_out_from_ID;
reg [1:0] ALUOp_out_from_ID;
reg [31:0] rfile_rd1_out, rfile_rd2_out, extend_immed_out;
reg [4:0] rs_out, rt_out, rd_out;
reg [5:0] funct_out;
reg [25:0] jumpoffset_out;
reg [2:0] Signal_of_Detection_out ;

	
always@( posedge clk )
begin
  if ( rst )
	begin
	  MemtoReg_out_from_ID <= 1'bx; RegWrite_out_from_ID <= 1'bx; MemRead_out_from_ID <= 1'bx; MemWrite_out_from_ID <= 1'bx;
      ALUOp_out_from_ID <= 2'bxx;
      RegDst_out_from_ID <= 1'bx;
      ALUSrc_out_from_ID <= 1'bx;

      jumpoffset_out <= 26'd0;

      rfile_rd1_out <= 32'd0;
      rfile_rd2_out <= 32'd0;

      extend_immed_out <= 32'd0;
  
      rs_out <= 5'd0;
      rt_out <= 5'd0;
      rd_out <= 5'd0;
  
      funct_out <= 6'd0;
	  Signal_of_Detection_out <= 2'b0 ;
	  HiLo_out <= 2'bxx ;
	end
	else if ( en_reg )
	begin
      MemtoReg_out_from_ID <= MemtoReg; RegWrite_out_from_ID <= RegWrite; MemRead_out_from_ID <= MemRead; MemWrite_out_from_ID <= MemWrite;
      ALUOp_out_from_ID <= ALUOp;
      RegDst_out_from_ID <= RegDst;
      ALUSrc_out_from_ID <= ALUSrc;
  
      jumpoffset_out <= jumpoffset;

      rfile_rd1_out <= rfile_rd1;
      rfile_rd2_out <= rfile_rd2;

      extend_immed_out <= extend_immed;
  
      rs_out <= rs;
      rt_out <= rt;
      rd_out <= rd;
  
      funct_out <= funct;
	  Signal_of_Detection_out <= Signal_of_Detection ;
	  HiLo_out <= HiLo ;
	end
end

endmodule
