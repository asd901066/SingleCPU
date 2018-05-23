

module NM_TM;

reg					clk, rst, MR, MW;
reg					[31:0] addr, wd ;
wire	[2:0] state ;
wire	[ 31:0] rd ;

Nmemory DataMem( clk, rst, MR, MW, wd, addr, rd, state );




//*********************************
//      control signal
//*********************************
parameter   t   = 10;
parameter   th  = t*0.5;
always #th clk = ~clk;

initial begin
    clk = 1;
    rst = 1;
	$readmemh("data_mem.txt",DataMem.mem_array );
	#(th*2) rst = 0 ;
    MR = 1;
    MW = 0;
	addr = 32'd5 ;
	wd = 32'd0 ;
	
    #(th*7) ;
	
	MR = 0;
    MW = 1;
	addr = 32'd12 ;
	wd = 32'd85;

	#(th*25) ;
	
	
    $stop;
end

endmodule
