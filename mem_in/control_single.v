/*
	Title: MIPS Single-Cycle Control Unit
	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
	
	Input Port
		1. opcode: ��J�����O�N���A�ڦ����͹���������T��
	Input Port
		1. RegDst: ����RFMUX
		2. ALUSrc: ����ALUMUX
		3. MemtoReg: ����WRMUX
		4. RegWrite: ����Ȧs���O�_�i�g�J
		5. MemRead:  ����O����O�_�iŪ�X
		6. MemWrite: ����O����O�_�i�g�J
		7. Branch: �PALU��X��zero�T����AND�B�ⱱ��PCMUX
		8. ALUOp: ��X��ALU Control
*/
module control_single( instr, opcode, funct, Branch, Jump, Shamt, CtrlSignal );
	
	input[31:0] instr ;
    input[5:0] opcode, funct;
    output  Branch, Jump, Shamt;
	output[7:0] CtrlSignal ;
    reg RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, Shamt;
    reg[1:0] ALUOp;

    parameter R_FORMAT = 6'd0;
    parameter LW = 6'd35;
    parameter SW = 6'd43;
    parameter BEQ = 6'd4;
	parameter J = 6'd2;
    parameter ADDIU = 6'd9;
	parameter BGTZ = 6'd7;
	parameter MULTI = 6'd24;
	parameter MFHI = 6'd16;
	parameter MFLO = 6'd18;
	parameter ORI = 6'd13;
		
    always @( opcode or instr ) begin
        case ( opcode )
          R_FORMAT : 
          begin
		        if( instr == 32'd0 )
				begin
				    RegDst = 1'b1; ALUSrc = 1'b0; MemtoReg = 1'bx; RegWrite = 1'bx; MemRead = 1'bx; 
				    MemWrite = 1'bx; Branch = 1'b0; Jump = 1'b0; ALUOp = 2'b10; Shamt = 1'b0;
				end
				else
				  begin
				    RegDst = 1'b1; ALUSrc = 1'b0; MemtoReg = 1'b0; RegWrite = 1'b1; MemRead = 1'b0; 
				    MemWrite = 1'b0; Branch = 1'b0; Jump = 1'b0; ALUOp = 2'b10; Shamt = 1'b0;
                    if ( funct == 6'd0 || funct == 6'd2 )
				    begin 
				      ALUSrc = 1'b1; Shamt = 1'b1;
				    end
					else if ( funct == 6'd24 )
					begin
					  RegWrite = 1'b0;
					end
				  end
		  end
          LW :
          begin
				RegDst = 1'b0; ALUSrc = 1'b1; MemtoReg = 1'b1; RegWrite = 1'b1; MemRead = 1'b1; 
				MemWrite = 1'b0; Branch = 1'b0; Jump = 1'b0; ALUOp = 2'b00; Shamt = 1'b0;
          end
          SW :
          begin
				RegDst = 1'bx; ALUSrc = 1'b1; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
				MemWrite = 1'b1; Branch = 1'b0; Jump = 1'b0; ALUOp = 2'b00; Shamt = 1'b0;
          end
          BEQ :
          begin
				RegDst = 1'bx; ALUSrc = 1'b0; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
				MemWrite = 1'b0; Branch = 1'b1; Jump = 1'b0; ALUOp = 2'b01; Shamt = 1'b0;
          end
		  J :
		  begin
				RegDst = 1'bx; ALUSrc = 1'b0; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
				MemWrite = 1'b0; Branch = 1'b1; Jump = 1'b1; ALUOp = 2'b01; Shamt = 1'b0;
		  end
		  ADDIU :
          begin
              	RegDst = 1'b0; ALUSrc = 1'b1; MemtoReg = 1'b0; RegWrite = 1'b1; MemRead = 1'b0; 
             	MemWrite = 1'b0; Branch = 1'b0; Jump = 1'b0; ALUOp = 2'b00; Shamt = 1'b0;
          end
		  BGTZ :
          begin
				RegDst = 1'bx; ALUSrc = 1'b0; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
				MemWrite = 1'b0; Branch = 1'b1; Jump = 1'b0; ALUOp = 2'b01; Shamt = 1'b0;
          end
		  ORI :
          begin
				RegDst = 1'b0; ALUSrc = 1'b1; MemtoReg = 1'b0; RegWrite = 1'b1; MemRead = 1'b0; 
				MemWrite = 1'b0; Branch = 1'b0; Jump = 1'b0; ALUOp = 2'b11; Shamt = 1'b0;
          end
          default
          begin
				$display("control_single unimplemented opcode %d", opcode);
				RegDst=1'bx; ALUSrc=1'bx; MemtoReg=1'bx; RegWrite=1'bx; MemRead=1'bx; 
				MemWrite=1'bx; Branch=1'b0; Jump = 1'b0; ALUOp = 2'bxx; Shamt = 1'bx;
          end

        endcase
    end
	
	assign CtrlSignal = { MemtoReg, RegWrite, MemRead, MemWrite, ALUOp, RegDst, ALUSrc } ;
	
endmodule

