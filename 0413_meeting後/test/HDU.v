
module HDU( rst, MemRead_out_from_ID, Rt_out_from_ID, Rs_out_from_IF, Rt_out_from_IF,
						 en_IF, en_PC, en_single );

    input rst, MemRead_out_from_ID;
    input [4:0] Rt_out_from_ID, Rs_out_from_IF, Rt_out_from_IF;
	
    output en_IF, en_PC, en_single;
	
    reg en_IF, en_PC, en_single;
   
    always @( posedge rst or MemRead_out_from_ID or Rt_out_from_ID or Rs_out_from_IF or Rt_out_from_IF ) begin
	
        if ( MemRead_out_from_ID && ((Rt_out_from_ID == Rs_out_from_IF) || (Rt_out_from_ID == Rt_out_from_IF)) ) // no use
	    begin
	      //stall<<= NOP + IF/ID Hold + PC Hold
		  en_IF <= 1'b0;
		  en_PC <= 1'b0;
		  en_single <= 1'b0;
        end
		else
		begin
		  en_IF <= 1'b1;
		  en_PC <= 1'b1;
		  en_single <= 1'b1;
		end	
    end

endmodule