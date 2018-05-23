/*
	Title:	ALU
	Author: Garfield (Computer System and Architecture Lab, ICE, CYCU)
	Input Port
		1. ctl: ��alu_ctl�ѽX��������T��
		2. a:   inputA,�Ĥ@���n�B�z�����
		3. b:   inputB,�ĤG���n�B�z�����
	Output Port
		1. result: �̫�B�z�������G
		2. zero:   branch���O�һݭn����X
*/


module alu(clk, a, b, result, ctl);
  input clk;
  input [2:0] ctl;
  input [31:0] a, b;
  output [31:0] result;

  reg [31:0] result;

  always @( a or b or ctl )
  begin
    case (ctl)
      3'b000 : result = a & b; // AND
      3'b001 : result = a | b; // OR
      3'b010 : result = a + b; // ADD
      3'b110 : result = a - b; // SUBTRACT
	  3'b111 : // SLT
	  begin
	    if ( a < b ) result = 1;
	    else result = 0;
	  end
      3'b101 : result = a << b; // SLL
	  3'b011 : result = a >> b; // SRL
      default : result = 32'hzzzzzzzz;
   endcase
   
   
 end
 
endmodule

