module Multiplier( dataA, dataB, clk, MulAns, reset, signal ) ;
  input [31:0] dataA, dataB ;
  input clk,reset ;
  input [5:0] signal ;
  output [63:0] MulAns ;
  reg [63:0] BR,temp ;
  reg [31:0] QR ; 
  reg [5:0] SC ;

  always @ ( signal )
  begin
    if( signal == 0 )
    begin
    BR = { 32'b0,dataA } ;
    QR = dataB ;
    temp = 64'b0 ;
    SC = 0 ;
    end
    else
    begin
    BR = 64'b0 ;
    QR = 32'b0 ;
    temp = 64'b0 ;
    SC = 0 ;
    end
  end 

  always @ ( posedge clk   ) 
  begin
  if( signal == 0 ) begin
    if ( SC < 32 )
    begin
      if( QR[0] )
      begin
        temp = BR + temp  ;
      end
      BR = BR << 1 ;
      QR = QR >> 1 ;
      SC = SC + 1 ;
    end
  end
  else
    SC = 0 ;
  end

  assign MulAns = temp ;
endmodule