//-----------------------------------------------------------------------------
// Title         : 2-1 multiplexer
//-----------------------------------------------------------------------------

module mux0( sel, CtrlSignal, MemtoReg, RegWrite, MemRead, MemWrite, ALUOp, RegDst, ALUSrc, HiLo );

    input sel;
    input [9:0]  CtrlSignal;
    output MemtoReg, RegWrite, MemRead, MemWrite, RegDst, ALUSrc ;
	output [1:0] ALUOp, HiLo;
	
	wire [9:0] temp;
	
	assign temp = (sel==1'b0) ? CtrlSignal : 10'b0 ;
	
	assign MemtoReg = temp[9];
	assign RegWrite = temp[8];
    	assign MemRead =temp[7];
	assign MemWrite = temp[6];
	assign ALUOp = temp[5:4];
	assign RegDst = temp[3];
	assign ALUSrc = temp[2];
	assign HiLo = temp[1:0] ;

endmodule
