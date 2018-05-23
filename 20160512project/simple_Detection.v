
module simple_Detection( rst, opcode, en_IF );

input rst;
input[5:0] opcode ;
output en_IF ;
reg en_IF ;

parameter BEQ = 6'd4;
parameter BGTZ = 6'd7 ;
parameter J = 6'd2 ;

always@( posedge rst or opcode ) 
begin
  case( opcode )
    BEQ : en_IF = 1'b0 ;
	BGTZ : en_IF = 1'b0 ;
	J : en_IF = 1'b0 ;
	default en_IF = 1'b1 ;
  endcase	
end

endmodule