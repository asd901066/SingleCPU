
module mux4( en_single, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp,
			 RegDst_out, ALUSrc_out, MemtoReg_out, RegWrite_out, MemRead_out, MemWrite_out, Branch_out, Jump_out, ALUOp_out);

    
    input en_single;
    input RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump;
	input [1:0] ALUOp;
	
    output RegDst_out, ALUSrc_out, MemtoReg_out, RegWrite_out, MemRead_out, MemWrite_out, Branch_out, Jump_out;
	output [1:0] ALUOp_out;
	
    reg RegDst_out, ALUSrc_out, MemtoReg_out, RegWrite_out, MemRead_out, MemWrite_out, Branch_out, Jump_out;
	reg [1:0] ALUOp_out;
	
	always@( en_single or RegDst or ALUSrc or MemtoReg or RegWrite or MemRead or MemWrite or Branch or Jump or ALUOp )
	begin
	  case(en_single)
	    1'b1 : begin 
		  RegDst_out <= RegDst ;
		  ALUSrc_out <= ALUSrc ;
		  MemtoReg_out <= MemtoReg ;
          RegWrite_out <= RegWrite ;
          MemRead_out <= MemRead ;
          MemWrite_out <= MemWrite ;
          Branch_out <= Branch ;
          Jump_out <= Jump ;
          ALUOp_out <= ALUOp ;
		end
		
	    default begin
		  RegDst_out <= 1'b0 ;
		  ALUSrc_out <= 1'b0 ;
		  MemtoReg_out <= 1'b0 ;
          RegWrite_out <= 1'b0 ;
          MemRead_out <= 1'b0 ;
          MemWrite_out <= 1'b0 ;
          Branch_out <= 1'b0 ;
          Jump_out <= 1'b0 ;
          ALUOp_out <= 2'b0 ;
		end
	  endcase
	end  
	
endmodule