//-----------------------------------------------------------------------------
// Title         : 2-1 multiplexer
//-----------------------------------------------------------------------------

module mux0( sel, CtrlSignal, MemtoReg, RegWrite, MemRead, MemWrite, ALUOp, RegDst, ALUSrc );

    input sel;
    input [7:0]  CtrlSignal;
    output MemtoReg, RegWrite, MemRead, MemWrite, RegDst, ALUSrc ;
	output [1:0] ALUOp;
	
	wire [7:0] temp;
	
	assign temp = (sel) ? CtrlSignal : 8'b0 ;
	
	assign MemtoReg = temp[7];
	assign RegWrite = temp[6];
    assign MemRead =temp[5];
	assign MemWrite = temp[4];
	assign ALUOp = temp[3:2];
	assign RegDst = temp[1];
	assign ALUSrc = temp[0];

endmodule
