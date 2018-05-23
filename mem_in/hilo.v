
module hilo( multi_out, clk, reset, signal, alu_out, hilo_out );

input [63:0] multi_out;
input [31:0] alu_out;
input [5:0] signal;
input clk, reset;

output [31:0] hilo_out;
//reg [31:0] hilo_out;
reg [63:0] hilo;


always @(posedge clk or posedge reset)
begin
  if ( reset )
  begin
    hilo <= 64'b0;
  end
  else
  begin
    hilo <= multi_out;
  end
end

assign hilo_out = ( signal == 6'd16 ) ? hilo[63:62] :
                  ( signal == 6'd18 ) ? hilo[31:0] : alu_out;
/*
always@( hilo )
begin
  if ( signal == 6'd16 )
    hilo_out <= hilo[63:62];
  else if ( signal == 6'd18 )
    hilo_out <= hilo[31:0];
  else
    hilo_out <= alu_out;
end
*/
endmodule
