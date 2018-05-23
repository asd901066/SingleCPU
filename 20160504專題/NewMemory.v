/*
	Title: Memory
	Author: Selene (Computer System and Architecture Lab, ICE, CYCU)
	
	Input Port
		1. clk
		2. MemRead: 控制記憶體是否可讀取
		3. MemWrite: 控制記憶體是否可寫入
		4. wd: 寫入的記憶體資料
		5. addr: 欲存取的記憶體位置
	Output Port
		1. rd: 讀取的記憶體資料
*/
module Nmemory( clk, rst, MemRead, MemWrite, wd, addr, rd, state );
	input clk, rst, MemRead, MemWrite;
	input[31:0] addr, wd;
	output[2:0] state ;
	output[31:0] rd;
	reg[31:0] rd;
	
	reg [2:0] state, curr_state, next_state ;
	reg [3:0] counter;
	
	// Memory size: 1KB.
	reg [7:0] mem_array [0:1023];
	
	parameter Free = 3'b000;
	parameter Stall = 3'b111;
	parameter Stall_Read = 3'b010;
	parameter Stall_Write = 3'b001;
	
	always@( posedge clk ) 
	begin
		if( rst ) curr_state <= Free ;
		else curr_state <= next_state ;
	
		counter <= counter + 1 ;
	end
	
	always@( curr_state or counter or MemRead or MemWrite or wd or addr )
	begin
		case( curr_state )

			Free : 
			begin
			
				if( MemRead == 1'b1 or MemWrite == 1'b1 ) 
				begin
					if( MemRead )
						next_state = Stall_Read ;
					else if( MemWrite )
						next_state = Stall_Write ;
				end
				else 
				begin
					next_state = Free ;
				end

				counter = 0;
				state = Free ;
			end

			Stall_Read :
			begin
			
				if( count == 4 )
					next_state = Free ;
				else 
					next_state = Stall_Read ;

				rd[7:0] = mem_array[addr];
				rd[15:8] = mem_array[addr+1];
				rd[23:16] = mem_array[addr+2];
				rd[31:24] = mem_array[addr+3];
				state = Stall ;
			end

			Stall_Write :
			begin
			
				if( count == 8 )
					next_state = Free ;
				else 
					next_state = Stall_Write ;

				mem_array[addr] <= wd[7:0];
				mem_array[addr+1] <= wd[15:8];
				mem_array[addr+2] <= wd[23:16];
				mem_array[addr+3] <= wd[31:24];
				state = Stall ;
			end

			default: next_state = Free ;

		endcase
	end
	
	
	
endmodule