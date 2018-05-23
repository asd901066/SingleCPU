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
	
	parameter FREE = 3'b000;
	parameter STALL = 3'b111;
	parameter STALL_READ = 3'b010;
	parameter STALL_WRITE = 3'b001;
	
	always@( posedge clk ) 
	begin
		if( rst ) curr_state <= FREE ;
		else curr_state <= next_state ;
		counter <= counter + 1 ;
		$display( "No. %d  !!!  " ,  counter);

	end
	
	always@( curr_state or counter or MemRead or MemWrite or wd or addr )
	begin
		case( curr_state )

			FREE : 
			begin
			
				if( MemRead == 1  )
				begin
					next_state = STALL_READ ;
					counter = 0 ;
				end
				else if( MemWrite == 1 )
				begin
					next_state = STALL_WRITE ;
					counter = 0 ;
				end
				else 
				begin
					next_state = FREE ;
				end

				state = FREE ;
			end

			STALL_READ :
			begin
			
				if( counter == 4 )
				begin
					next_state = FREE ;
					$display( "%d, reading data: Mem[%d] => %d", counter, addr, rd );
				end
				else 
					next_state = STALL_READ ;

				rd[7:0] = mem_array[addr];
				rd[15:8] = mem_array[addr+1];
				rd[23:16] = mem_array[addr+2];
				rd[31:24] = mem_array[addr+3];
				state = STALL ;
			end

			STALL_WRITE :
			begin
			
				if( counter == 8 )
				begin
					next_state = FREE ;
					$display( "%d, writing data: Mem[%d] <= %d", counter, addr, wd );
				end
				else 
					next_state = STALL_WRITE ;

				mem_array[addr] <= wd[7:0];
				mem_array[addr+1] <= wd[15:8];
				mem_array[addr+2] <= wd[23:16];
				mem_array[addr+3] <= wd[31:24];
				state = STALL ;
			end

			default: next_state = FREE ;

		endcase
	end
	
	
	
endmodule