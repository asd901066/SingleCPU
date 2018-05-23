module forwarding( RegWrite_out_from_EX, Rd_out_from_EX,
				   Rs_out_from_ID, Rt_out_from_ID,
				   RegWrite_out_from_MEM, Rd_out_from_MEM,
				   forwardA, forwardB ) ;

	input RegWrite_out_from_EX, RegWrite_out_from_MEM ;
	input [4:0] Rd_out_from_EX, Rs_out_from_ID, Rt_out_from_ID ;
	input [4:0] Rd_out_from_MEM ;
	
	output [1:0] forwardA, forwardB ;
	
	reg [1:0] forwardA, forwardB ;
	
	always@ (RegWrite_out_from_EX or Rd_out_from_EX or Rs_out_from_ID or Rt_out_from_ID or RegWrite_out_from_MEM or Rd_out_from_MEM)
	begin
		if( RegWrite_out_from_EX && ( Rd_out_from_EX != 0 ) && ( Rd_out_from_EX == Rs_out_from_ID ) ) 
		begin 
		  forwardA = 2'b10 ; 
		end
		else if( RegWrite_out_from_MEM && ( Rd_out_from_MEM != 0 ) && ( Rd_out_from_MEM == Rs_out_from_ID )
				 && !( RegWrite_out_from_EX && ( Rd_out_from_EX != 0 ) && ( Rd_out_from_EX == Rs_out_from_ID  ) )
				 && ( Rd_out_from_MEM == Rs_out_from_ID ) )
		begin
		  forwardA = 2'b01 ; 
		end
		else
		begin
		  forwardA = 2'b00 ; 
		end
	
		if( RegWrite_out_from_EX && ( Rd_out_from_EX != 0 ) && ( Rd_out_from_EX == Rt_out_from_ID ) ) 
		begin
		  forwardB = 2'b10 ; 
		end
		else if( RegWrite_out_from_MEM && ( Rd_out_from_MEM != 0 ) && ( Rd_out_from_MEM == Rt_out_from_ID )
				 && !( RegWrite_out_from_EX && ( Rd_out_from_EX != 0 ) && ( Rd_out_from_EX == Rt_out_from_ID  ) )
				 && ( Rd_out_from_MEM == Rt_out_from_ID ) )
		begin
		  forwardB = 2'b01 ; 
		end
		else
		begin
		  forwardB = 2'b00 ;
		end
	end
endmodule