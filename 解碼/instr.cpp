#include <stdio.h>
#include <string.h>
#include <stdlib.h>

using namespace std;

void Reg( char cmd[26] , char temp[5] ) ;
void D2B( char cmd[26], int num ) ;


void Reset_array( char temp[50], int n ) {
	int i = 0;
	while ( i < n ) {
		temp[i] = '\0';
		i++ ;
	} // while
} // Reset_array()


int main() {

FILE * file_in, * file_out, * file_Hex, * file_test;

int itemp = 0;
char iName[21], cmd[27], ctemp ;
char Instruction[33], opcode[7], funct[7], rs[6], rt[6], rd[6], shamt[6], offset[17], addr[27] ;

// Clear Array
Reset_array(iName, 21);
Reset_array(cmd, 27);
Reset_array(Instruction, 33);
Reset_array(opcode, 7);
Reset_array(funct, 7);
Reset_array(rs, 6);
Reset_array(rt, 6);
Reset_array(rd, 6);
Reset_array(shamt, 6);
Reset_array(offset, 17);
Reset_array(addr, 27);

// Set Input File
scanf("%s", &iName);
strcat(iName, ".txt");

file_in = fopen( iName, "rt" ) ;
file_out = fopen( "MIPS Instructions_0.txt", "w+t" ) ;


fscanf( file_in, "%s", &cmd );

while( strcmp( cmd, "end" ) != 0 ) {
	if( strcmp( cmd, "add" ) == 0 ) {
		strcpy( opcode, "000000" ) ;
		strcpy( funct, "100000" ) ;
		strcpy( shamt, "00000" ) ;
		
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg( cmd , rd ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg( cmd , rs ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rt ) ;
		
		strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, rd );
		strcat( Instruction, shamt );
		strcat( Instruction, funct );
	}//if
	else if( strcmp( cmd, "sub" ) == 0 ) {
		strcpy( opcode, "000000" ) ;
		strcpy( funct, "100010" ) ;
		strcpy( shamt, "00000" ) ;
		
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg( cmd , rd ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd ,rs ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rt ) ;
		
		strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, rd );
		strcat( Instruction, shamt );
		strcat( Instruction, funct );
	}//else if
	else if( strcmp( cmd, "and" ) == 0 ) {
		strcpy( opcode, "000000" ) ;
		strcpy( funct, "100100" ) ;
		strcpy( shamt, "00000" ) ;
		
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rd ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rs ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rt ) ;
		
		strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, rd );
		strcat( Instruction, shamt );
		strcat( Instruction, funct );
	}//else if
	else if( strcmp( cmd, "or" ) == 0 ){
		strcpy( opcode, "000000" ) ;
		strcpy( funct, "100101" ) ;
		strcpy( shamt, "00000" ) ;
		
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rd ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rs ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rt ) ;
		
		strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, rd );
		strcat( Instruction, shamt );
		strcat( Instruction, funct );
	}//else if
	else if( strcmp( cmd, "slt" ) == 0 ){
		strcpy( opcode, "000000" ) ;
		strcpy( funct, "101010" ) ;
		strcpy( shamt, "00000" ) ;
		
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rd ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rs ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rt ) ;
		
		strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, rd );
		strcat( Instruction, shamt );
		strcat( Instruction, funct );
	}//else if
	else if( strcmp( cmd, "sll" ) == 0 ){
		strcpy( opcode, "000000" ) ;
		strcpy( funct, "000000" ) ;
		strcpy( shamt, "00000" ) ;
		strcpy( rs, "00000" ) ;
		
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rd ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rt ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		
		D2B( cmd, 5) ;
		strncpy(shamt, cmd, 5);
		
		strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, rd );
		strcat( Instruction, shamt );
		strcat( Instruction, funct );
	}//else if
	else if( strcmp( cmd, "srl" ) == 0 ){
		strcpy( opcode, "000000" ) ;
		strcpy( funct, "000010" ) ;
		strcpy( rs, "00000" ) ;
		
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rd ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rt ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		
		D2B( cmd, 5) ;
		strncpy(shamt, cmd, 5);
		
		strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, rd );
		strcat( Instruction, shamt );
		strcat( Instruction, funct );
	}//else if
	else if( strcmp( cmd, "j" ) == 0 ){
		strcpy( opcode, "000010" ) ;
		
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		
		D2B( cmd, 26) ;
		strncpy(addr, cmd, 26);
		
		strcpy( Instruction, opcode );
		strcat( Instruction, addr );
	}//else if
	else if( strcmp( cmd, "lw" ) == 0 ){ // lw rs, rt, offset --//-- lw rt, offset(rs)
		strcpy( opcode, "100011" ) ;
		
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rt ) ;
		
		Reset_array( cmd, 26 );
		fscanf( file_in, "%d", &itemp );
		sprintf(cmd,"%d",itemp);
		D2B( cmd, 16) ;
		strncpy(offset, cmd, 16);
		
		fscanf( file_in, "%c", &ctemp );
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );	
		Reg(  cmd , rs ) ;
		
		strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, offset );
	}//else if
	else if( strcmp( cmd, "sw" ) == 0 ){ // sw rs, rt, offset --//-- sw rt, offset(rs)
		strcpy( opcode, "101011" ) ;
		
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rt ) ;
		
		Reset_array( cmd, 26 );
		fscanf( file_in, "%d", &itemp );
		sprintf(cmd,"%d",itemp);
		D2B( cmd, 16) ;
		strncpy(offset, cmd, 16);
		
		fscanf( file_in, "%c", &ctemp );
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rs ) ;
		
		strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, offset );
	}//else if
	else if( strcmp( cmd, "beq" ) == 0 ){
		strcpy( opcode, "000100" ) ;
		
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rs ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rt ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		
		D2B( cmd, 16) ;
		strncpy(offset, cmd, 16);
		
		strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, offset );
	}//else if
	else if( strcmp( cmd, "bgtz" ) == 0 ){
		strcpy( opcode, "000111" ) ;
		strcpy( rt, "00000" ) ;
		
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rs ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		
		D2B( cmd, 16) ;
		strncpy(offset, cmd, 16);
		
		strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, offset );
	}//else if
	else if( strcmp( cmd, "addiu" ) == 0 ){
		strcpy( opcode, "001001" ) ;
		
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rt ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rs ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		
		D2B( cmd, 16) ;
		strncpy(offset, cmd, 16);
		
		strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, offset );
	}//else if
	else if( strcmp( cmd, "mfhi" ) == 0 ){
	  strcpy( opcode, "000000" ) ;
	  strcpy( rs, "00000" ) ;
	  strcpy( rt, "00000" ) ;
	  strcpy( shamt, "00000" ) ;
	  strcpy( funct, "010000" ) ;
	  
	  Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rd ) ;
	  
	  strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, rd );
		strcat( Instruction, shamt );
		strcat( Instruction, funct );
	} // else if
	else if( strcmp( cmd, "mflo" ) == 0 ){
	  strcpy( opcode, "000000" ) ;
	  strcpy( rs, "00000" ) ;
	  strcpy( rt, "00000" ) ;
	  strcpy( shamt, "00000" ) ;
	  strcpy( funct, "010010" ) ;
	  
	  Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rd ) ;
	  
	  strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, rd );
		strcat( Instruction, shamt );
		strcat( Instruction, funct );
	} // else if
	else if( strcmp( cmd, "mult" ) == 0 ){
	  strcpy( opcode, "000000" ) ;
	  strcpy( rd, "00000" ) ;
	  strcpy( shamt, "00000" ) ;
	  strcpy( funct, "011000" ) ;
	  
	  Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rs ) ;
	  Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rt ) ;
		
	  strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, rd );
		strcat( Instruction, shamt );
		strcat( Instruction, funct );
	} // else if
	else if( strcmp( cmd, "ori" ) == 0 ){
	  strcpy( opcode, "001101" ) ;
	  
	  Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rt ) ;
		Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		Reg(  cmd , rs ) ;
	  Reset_array( cmd, 26 );
		fscanf( file_in, "%s", &cmd );
		
		D2B( cmd, 16) ;
		strncpy(offset, cmd, 16);
		
	  strcpy( Instruction, opcode );
		strcat( Instruction, rs );
		strcat( Instruction, rt );
		strcat( Instruction, offset );
	} // else if
	else
		printf( "Error command : %s\n", cmd ) ;

    char Iwant[32] ;
    strcpy( Iwant, Instruction );

    int counter = 1 ;
    for( int g = 0 ; g < 32 ; g++ ){
        fprintf( file_out, "%c", Iwant[g] );
        if( counter % 4 == 0 && g != 0  )
            fprintf( file_out, " " );
        counter++ ;
    }//for


  fprintf( file_out, "\n" );
	Reset_array( Instruction, 32 );
	Reset_array( cmd, 26 );
	fscanf( file_in, "%s", &cmd );
}//while

    fprintf( file_out, "end\n" );

	fclose( file_in );
	fclose( file_out );

	
	file_Hex = fopen( "MIPS Instructions_0.txt", "rt" );
	file_test = fopen( "test.txt", "w+t" );

	int i = 0 ;
	char out[9];
	
	fscanf( file_Hex, "%s", &cmd );
	while( strcmp( cmd, "end" ) != 0 ) {
        if( strcmp( cmd, "0000" ) == 0 )
            out[i] = '0';
        else if( strcmp( cmd, "0001" ) == 0 )
            out[i] = '1';
        else if( strcmp( cmd, "0010" ) == 0 )
            out[i] = '2';
        else if( strcmp( cmd, "0011" ) == 0 )
            out[i] = '3';
        else if( strcmp( cmd, "0100" ) == 0 )
            out[i] = '4';
        else if( strcmp( cmd, "0101" ) == 0 )
            out[i] = '5';
        else if( strcmp( cmd, "0110" ) == 0 )
            out[i] = '6';
        else if( strcmp( cmd, "0111" ) == 0 )
            out[i] = '7';
        else if( strcmp( cmd, "1000" ) == 0 )
            out[i] = '8';
        else if( strcmp( cmd, "1001" ) == 0 )
            out[i] = '9';
        else if( strcmp( cmd, "1010" ) == 0 )
            out[i] = 'A';
        else if( strcmp( cmd, "1011" ) == 0 )
            out[i] = 'B';
        else if( strcmp( cmd, "1100" ) == 0 )
            out[i] = 'C';
        else if( strcmp( cmd, "1101" ) == 0 )
            out[i] = 'D';
        else if( strcmp( cmd, "1110" ) == 0 )
            out[i] = 'E';
        else if( strcmp( cmd, "1111" ) == 0 )
            out[i] = 'F';
  
        i++;
        if ( i == 8 ) {
		      for ( int j = 6 ; j >= 0 ; j=j-2 )
		        fprintf( file_test, "%c%c\n", out[j], out[j+1] );
		      fprintf( file_test, "\n" ) ;
		      i = 0;
		    } // if
		    
        fscanf( file_Hex, "%s", &cmd );
	}//while

	fclose( file_Hex );
	fclose( file_test );
}//main



void Reg( char cmd[26] , char temp[5] ) {
  if ( strstr(cmd, ",") != 0 || strstr(cmd, ")") != 0 )
    cmd[sizeof(cmd)-1] = '\0';
  
if( strcmp( cmd, "$at" ) == 0 )
	strcpy( temp, "00001" );
else if( strcmp( cmd, "$v0" ) == 0 )
	strcpy( temp, "00010" );
else if( strcmp( cmd, "$v1" ) == 0 )
	strcpy( temp, "00011" );
else if( strcmp( cmd, "$a0" ) == 0 )
	strcpy( temp, "00100" );
else if( strcmp( cmd, "$a1" ) == 0 )
	strcpy( temp, "00101" );
else if( strcmp( cmd, "$a2" ) == 0 )
	strcpy( temp, "00110" );
else if( strcmp( cmd, "$a3" ) == 0 )
	strcpy( temp, "00111" );
else if( strcmp( cmd, "$t0" ) == 0 )
	strcpy( temp, "01000" );
else if( strcmp( cmd, "$t1" ) == 0 )
	strcpy( temp, "01001" );
else if( strcmp( cmd, "$t2" ) == 0 )
	strcpy( temp, "01010" );
else if( strcmp( cmd, "$t3" ) == 0 )
	strcpy( temp, "01011" );
else if( strcmp( cmd, "$t4" ) == 0 )
	strcpy( temp, "01100" );
else if( strcmp( cmd, "$t5" ) == 0 )
	strcpy( temp, "01101" );
else if( strcmp( cmd, "$t6" ) == 0 )
	strcpy( temp, "01110" );
else if( strcmp( cmd, "$t7" ) == 0 )
	strcpy( temp, "01111" );
else if( strcmp( cmd, "$s0" ) == 0 )
	strcpy( temp, "10000" );
else if( strcmp( cmd, "$s1" ) == 0 )
	strcpy( temp, "10001" );
else if( strcmp( cmd, "$s2" ) == 0 )
	strcpy( temp, "10010" );
else if( strcmp( cmd, "$s3" ) == 0 )
	strcpy( temp, "10011" );
else if( strcmp( cmd, "$s4" ) == 0 )
	strcpy( temp, "10100" );
else if( strcmp( cmd, "$s5" ) == 0 )
	strcpy( temp, "10101" );
else if( strcmp( cmd, "$s6" ) == 0 )
	strcpy( temp, "10110" );
else if( strcmp( cmd, "$s7" ) == 0 )
	strcpy( temp, "10111" );
else if( strcmp( cmd, "$t8" ) == 0 )
	strcpy( temp, "11000" );
else if( strcmp( cmd, "$t9" ) == 0 )
	strcpy( temp, "11001" );
else if( strcmp( cmd, "$k0" ) == 0 )
	strcpy( temp, "11010" );
else if( strcmp( cmd, "$k1" ) == 0 )
	strcpy( temp, "11011" );
else if( strcmp( cmd, "$gp" ) == 0 )
	strcpy( temp, "11100" );
else if( strcmp( cmd, "$sp" ) == 0 )
	strcpy( temp, "11101" );
else if( strcmp( cmd, "$fp" ) == 0 )
	strcpy( temp, "11110" );
else if( strcmp( cmd, "$ra" ) == 0 )
	strcpy( temp, "11111" );
else
	strcpy( temp, "00000" );
}//reg



void D2B( char cmd[26], int num ){
  int input = atoi( cmd ) ;
  int total = 0, m = num-1 ;
  
  Reset_array( cmd, 26 );

  while( m >= 0 ){
	total = input % 2 ;
	if( total == 1 )
		cmd[m] = '1' ;
	else
		cmd[m] = '0' ;
	input = input/2;
	m-- ;
  }//while
  
}//D2B

