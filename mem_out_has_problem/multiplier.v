
module multip( a, b, temp );

input [63:0] a;
input b;
output [63:0] temp;


and( temp[0], a[0], b );
and( temp[1], a[1], b );
and( temp[2], a[2], b );
and( temp[3], a[3], b );
and( temp[4], a[4], b );
and( temp[5], a[5], b );
and( temp[6], a[6], b );
and( temp[7], a[7], b );
and( temp[8], a[8], b );
and( temp[9], a[9], b );
and( temp[10], a[10], b );
and( temp[11], a[11], b );
and( temp[12], a[12], b );
and( temp[13], a[13], b );
and( temp[14], a[14], b );
and( temp[15], a[15], b );
and( temp[16], a[16], b );
and( temp[17], a[17], b );
and( temp[18], a[18], b );
and( temp[19], a[19], b );
and( temp[20], a[20], b );
and( temp[21], a[21], b );
and( temp[22], a[22], b );
and( temp[23], a[23], b );
and( temp[24], a[24], b );
and( temp[25], a[25], b );
and( temp[26], a[26], b );
and( temp[27], a[27], b );
and( temp[28], a[28], b );
and( temp[29], a[29], b );
and( temp[30], a[30], b );
and( temp[31], a[31], b );
and( temp[32], a[32], b );
and( temp[33], a[33], b );
and( temp[34], a[34], b );
and( temp[35], a[35], b );
and( temp[36], a[36], b );
and( temp[37], a[37], b );
and( temp[38], a[38], b );
and( temp[39], a[39], b );
and( temp[40], a[40], b );
and( temp[41], a[41], b );
and( temp[42], a[42], b );
and( temp[43], a[43], b );
and( temp[44], a[44], b );
and( temp[45], a[45], b );
and( temp[46], a[46], b );
and( temp[47], a[47], b );
and( temp[48], a[48], b );
and( temp[49], a[49], b );
and( temp[50], a[50], b );
and( temp[51], a[51], b );
and( temp[52], a[52], b );
and( temp[53], a[53], b );
and( temp[54], a[54], b );
and( temp[55], a[55], b );
and( temp[56], a[56], b );
and( temp[57], a[57], b );
and( temp[58], a[58], b );
and( temp[59], a[59], b );
and( temp[60], a[60], b );
and( temp[61], a[61], b );
and( temp[62], a[62], b );
and( temp[63], a[63], b );

endmodule
//


module multiplier( a, b, multi_out, clk, reset, signal );

input clk, reset;
input [31:0] a, b;
input [2:0] signal;
output [63:0] multi_out;

wire [63:0] result_1b;
reg [63:0] multi_out, mul_1b, multiplicand;
reg [31:0] multip_1b;


always @( a or b )
  begin
   multiplicand = a;
   multip_1b = b;
  end

multip multip0( multiplicand, multip_1b[0], result_1b );

always @(posedge reset)
  begin
    multi_out = 64'd0;
  end

always @(posedge clk)
  begin
  if ( signal == 3'b000 )
    begin
      mul_1b = result_1b ;
      multiplicand = multiplicand << 1 ;
      multip_1b = multip_1b >> 1;

      multi_out = multi_out + mul_1b;
    end
  else
    begin
	  multi_out = 64'd0;
	end
  end


endmodule

