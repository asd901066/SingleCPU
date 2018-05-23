/*
	Title:	ALU
	Author: Garfield (Computer System and Architecture Lab, ICE, CYCU)
	Input Port
		1. ctl: 由alu_ctl解碼完的控制訊號
		2. a:   inputA,第一筆要處理的資料
		3. b:   inputB,第二筆要處理的資料
	Output Port
		1. result: 最後處理完的結果
		2. zero:   branch指令所需要之輸出
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

