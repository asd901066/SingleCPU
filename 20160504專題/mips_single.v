//	Title: MIPS Single-Cycle Processor
//	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
module mips_single( clk, rst, INSTR_from_Mem, RDATA, Instr_state, Mem_state,
					PC_for_Mem, MemRead_for_Mem, MemWrite_for_Mem, WD_for_Mem, ALU_Out_for_Mem );
	input clk, rst ;
	input [2:0] Instr_state, Mem_state;
	input [31:0] INSTR_from_Mem, RDATA ;
	output [31:0] PC_for_Mem, WD_for_Mem, ALU_Out_for_Mem ;
	output MemRead_for_Mem, MemWrite_for_Mem ;
	// instruction bus
	wire[31:0] instr_out;
	
	// break out important fields from instruction
	wire [5:0] opcode, funct;
    wire [4:0] Rs, Rt, Rd, shamt;
    wire [15:0] immed;
    wire [31:0] extend_immed, b_offset;
    wire [25:0] jumpoffset;
	
	// datapath signals
    wire [4:0] rfile_wn;
    wire [31:0] rfile_rd1, rfile_rd2, rfile_wd, pc_next, pc, pc_incr, alu_b, alu_out, b_tgt,
				dmem_rdata, jump_addr, branch_addr;

	// control signals
    wire RegWrite, Branch, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Jump, Shamt_s, minus_out;
    wire [1:0] ALUOp;
    wire [2:0] Operation;
	
    assign opcode = instr_out[31:26];
    assign Rs = instr_out[25:21];
    assign Rt = instr_out[20:16];
    assign Rd = instr_out[15:11];
    assign shamt = instr_out[10:6];
    assign funct = instr_out[5:0];
    assign immed = instr_out[15:0];
    assign jumpoffset = instr_out[25:0];


	// pipeline design
	wire en_IF, IF_flush, en_PC, ID_flush;
	wire [31:0] pc_outcr;
	wire [25:0] jumpoffset_out;
	
	wire MemtoReg_out_from_ID, RegWrite_out_from_ID, MemRead_out_from_ID, MemWrite_out_from_ID, RegDst_out_from_ID, ALUSrc_out_from_ID;
	wire [1:0]ALUOp_out_from_ID;
	wire [31:0] rfile_rd1_out, rfile_rd2_out, extend_immed_out;
	wire [4:0] Rs_out_from_ID, Rt_out_from_ID, Rd_out_from_ID, rout;
	wire [5:0] funct_out;
	wire [15:0] immed_shamt;
	
	wire MemtoReg_out_from_EX, RegWrite_out_from_EX, MemRead_out_from_EX, MemWrite_out_from_EX;
	wire [31:0] alu_out_out, mem_wd;
	wire [4:0] rfile_wn_out;
	
	wire MemtoReg_out_from_MEM, RegWrite_out_from_MEM;
	wire [31:0] dmem_rdata_out, alu_out_out_out;
	wire [4:0] rfile_wn_out2;
	
	wire [31:0] alu_in1, alu_in2;
    wire [1:0] forward1, forward2;
/*
	wire RegDst_out, ALUSrc_out, MemtoReg_out, RegWrite_out, MemRead_out, MemWrite_out, Branch_out, Jump_out;
	wire [1:0] ALUOp_out;
*/
	
	wire [2:0] en_Branch, en_Mult, en_HD, Signal_of_Detection;
	wire en_B1, en_M2, en_H3;//, en_ID;
	
	
	Branch_Detection branchDetection( rst, PCSrc, en_Branch, en_B1 );
	
	Mult_Detection multDetection( clk, rst, instr_out, en_Mult, en_M2 );
	
	Hazard_Detection hazardDetection( clk, rst, MemRead_out_from_ID, Rt_out_from_ID, Rs, Rt, en_HD, en_H3 );
	
	Mux_for_MultiDetection multiDetection( en_B1, en_M2, en_H3, en_Branch, en_Mult, en_HD, 3'b101, Signal_of_Detection );
	
	assign en_PC = Signal_of_Detection[0];
	assign IF_flush = Signal_of_Detection[1];
	assign en_IF = Signal_of_Detection[2];
	
	or IDFlush0( ID_flush, MemRead, Signal_of_Detection[1] ) ;
	
	
	
	IF_ID pipeline1( en_IF, IF_flush, clk, rst, INSTR_from_Mem, instr_out, pc_incr, pc_outcr );

	ID_EX pipeline2( 1'b1, ID_flush, jumpoffset, jumpoffset_out, clk, rst,
	              MemtoReg, RegWrite, MemRead, MemWrite, ALUOp, RegDst, ALUSrc, Jump,
                  MemtoReg_out_from_ID, RegWrite_out_from_ID, MemRead_out_from_ID, MemWrite_out_from_ID, ALUOp_out_from_ID, RegDst_out_from_ID, ALUSrc_out_from_ID,
                  rfile_rd1, rfile_rd2, rfile_rd1_out, rfile_rd2_out,
	              extend_immed, extend_immed_out,
	              Rs, Rt, Rd, Rs_out_from_ID, Rt_out_from_ID, Rd_out_from_ID, funct, funct_out );
					 
	EX_MEM pipeline3( 1'b1, clk, rst, MemtoReg_out_from_ID, RegWrite_out_from_ID, MemRead_out_from_ID, MemWrite_out_from_ID,
	                  MemtoReg_out_from_EX, RegWrite_out_from_EX, MemRead_out_from_EX, MemWrite_out_from_EX,
		          alu_out, alu_out_out,
			  rfile_rd2_out, mem_wd,
		          rfile_wn, rfile_wn_out );
	
	MEM_WB pipeline4( 1'b1, clk, rst, MemtoReg_out_from_EX, RegWrite_out_from_EX, 
                   MemtoReg_out_from_MEM, RegWrite_out_from_MEM,
		           RDATA, dmem_rdata_out,
                   alu_out_out, alu_out_out_out,
                   rfile_wn_out, rfile_wn_out2);
	// branch offset shifter
    assign b_offset = extend_immed << 2;
	  
	// jump offset shifter & concatenation
	assign jump_addr = { 4'b0, jumpoffset << 2 };

	// module instantiations
	
	reg32 PC( .clk(clk), .rst(rst), .en_reg(en_PC), .d_in(pc_next), .d_out(pc) );
	// sign-extender
	sign_extend SignExt( .immed_in(immed_shamt), .ext_immed_out(extend_immed) );
	
	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr) );

    add32 BRADD( .a(pc_outcr), .b(b_offset), .result(b_tgt) );

    minus Minus(.rst(rst), .rd1(rfile_rd1), .rd2(rfile_rd2), .minus_out(minus_out) ) ;
    and B_AND( PCSrc, Branch, minus_out ) ;
	
    alu ALU( .clk(clk), .ctl(Operation), .a(alu_in1), .b(alu_in2), .result(alu_out) );
	
    mux1 Shamt_or_Immed( .sel(Shamt_s), .a(immed), .b(shamt), .y(immed_shamt), .r1(Rs), .r2(Rt), .rout(rout) );
	
    mux2 #(5) RFMUX( .sel(RegDst_out_from_ID), .a(Rt_out_from_ID), .b(Rd_out_from_ID), .y(rfile_wn) );
    
    mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr), .b(b_tgt), .y(branch_addr) );
	
	mux2 #(32) JMUX( .sel(Jump), .a(branch_addr), .b(jump_addr), .y(pc_next) );
	
	mux2 #(32) ALUMUX( .sel(ALUSrc_out_from_ID), .a(rfile_rd2_out), .b(extend_immed_out), .y(alu_b) );

    mux2 #(32) WRMUX( .sel(MemtoReg_out_from_MEM), .a(alu_out_out_out), .b(dmem_rdata_out), .y(rfile_wd) );
	
	
	forwarding Forwarding_Unit( .RegWrite_out_from_EX(RegWrite_out_from_EX), .Rd_out_from_EX(rfile_wn_out),
				   .Rs_out_from_ID(Rs_out_from_ID), .Rt_out_from_ID(Rt_out_from_ID),
				   .RegWrite_out_from_MEM(RegWrite_out_from_MEM), .Rd_out_from_MEM(rfile_wn_out2),
				   .forwardA(forward1), .forwardB(forward2) ) ;
	
	
	
    mux3 #(32) FORMUX1( .sel(forward1), .a(rfile_rd1_out), .b(rfile_wd), .c(alu_out_out), .y(alu_in1) );

	mux3 #(32) FORMUX2( .sel(forward2), .a(alu_b), .b(rfile_wd), .c(alu_out_out), .y(alu_in2) );

	
	
	
    control_single CTL(.instr(instr_out), .opcode(opcode), .funct(funct), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), 
                       .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), 
                       .Jump(Jump), .ALUOp(ALUOp), .Shamt(Shamt_s) );

					   
    alu_ctl ALUCTL( .ALUOp(ALUOp_out_from_ID), .Funct(funct_out), .ALUOperation(Operation) );
	
    reg_file RegFile( .clk(clk), .RegWrite(RegWrite_out_from_MEM), .RN1(rout), .RN2(Rt), .WN(rfile_wn_out2), 
				      .WD(rfile_wd), .RD1(rfile_rd1), .RD2(rfile_rd2) );

					






					// Memory outside 
	assign PC_for_Mem = pc ;
	assign MemRead_for_Mem = MemRead_out_from_EX ;
	assign MemWrite_for_Mem = MemWrite_out_from_EX ;
	assign WD_for_Mem = mem_wd ;
	assign ALU_Out_for_Mem = alu_out_out ;
	
	
	
	
	
	/*memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instr) );

	memory DatMem( .clk(clk), .MemRead(MemRead_out_from_EX), .MemWrite(MemWrite_out_from_EX), .wd(mem_wd), 
			       .addr(alu_out_out), .rd(dmem_rdata) ); */
	   		   
endmodule
