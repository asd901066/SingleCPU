#include <string.h>
#include <iostream>
#include <fstream>
#include <stdio.h>
#include <algorithm>
#include <stdlib.h>
#include<cmath>

using namespace std;

void Reg( string cmd , string &temp ) ;
string D2B( string cmd, int num ) ;

int main() {

int DataNum ;
string iName, Useless, cmd, Instruction, opcode, funct ;
string rs, rt, rd, shamt, offset, addr ;

cin >> iName ;
iName += ".txt" ;

fstream file_in( iName.c_str() ) ;
fstream file_for_count( iName.c_str() ) ;
fstream file_out( "MIPS Instructions_0.txt", ios::out ) ;

while( file_for_count >> Useless )
		DataNum++ ;

file_for_count.close() ;

file_in >> cmd ;


while( cmd != "end" ){
	if( cmd == "add" ){
		opcode = "000000" ;
		funct = "100000" ;
		shamt = "00000" ;
		file_in >> cmd ;
		Reg( cmd , rd ) ;
		file_in >> cmd ;
		Reg( cmd , rs ) ;
		file_in >> cmd ;
		Reg(  cmd , rt ) ;
		Instruction = opcode + rs + rt + rd + shamt + funct ;
		//file_out << opcode << rs << rt << rd << shamt << funct << endl ;
	}//if
	else if( cmd == "sub" ){
		opcode = "000000" ;
		funct = "100010" ;
		shamt = "00000" ;
		file_in >> cmd ;
		Reg( cmd , rd ) ;
		file_in >> cmd ;
		Reg(  cmd ,rs ) ;
		file_in >> cmd ;
		Reg(  cmd , rt ) ;
		Instruction = opcode + rs + rt + rd + shamt + funct ;
		//file_out << opcode << rs << rt << rd << shamt << funct << endl ;
	}//else if
	else if( cmd == "and" ){
		opcode = "000000" ;
		funct = "100100" ;
		shamt = "00000" ;
		file_in >> cmd ;
		Reg(  cmd , rd ) ;
		file_in >> cmd ;
		Reg(  cmd , rs ) ;
		file_in >> cmd ;
		Reg(  cmd , rt ) ;
		Instruction = opcode + rs + rt + rd + shamt + funct ;
		//file_out << opcode << rs << rt << rd << shamt << funct << endl ;
	}//else if
	else if( cmd == "or" ){
		opcode = "000000" ;
		funct = "100101" ;
		shamt = "00000" ;
		file_in >> cmd ;
		Reg(  cmd , rd ) ;
		file_in >> cmd ;
		Reg(  cmd , rs ) ;
		file_in >> cmd ;
		Reg(  cmd , rt ) ;
		Instruction = opcode + rs + rt + rd + shamt + funct ;
		//file_out << opcode << rs << rt << rd << shamt << funct << endl ;
	}//else if
	else if( cmd == "slt" ){
		opcode = "000000" ;
		funct = "101010" ;
		shamt = "00000" ;
		file_in >> cmd ;
		Reg(  cmd , rd ) ;
		file_in >> cmd ;
		Reg(  cmd , rs ) ;
		file_in >> cmd ;
		Reg(  cmd , rt ) ;
		Instruction = opcode + rs + rt + rd + shamt + funct ;
		//file_out << opcode << rs << rt << rd << shamt << funct << endl ;
	}//else if
	else if( cmd == "sll" ){
		opcode = "000000" ;
		funct = "000000" ;
		shamt = "00000" ;
		rs = "00000" ;
		file_in >> cmd ;
		Reg(  cmd , rd ) ;
		file_in >> cmd ;
		Reg(  cmd , rt ) ;
		file_in >>  cmd ;
		//Reg( string cmd , string &shamt ) ;
		shamt = D2B( cmd, 5) ;
		Instruction = opcode + rs + rt + rd + shamt + funct ;
		//file_out << opcode << rs << rt << rd << shamt << funct << endl ;
	}//else if
	else if( cmd == "srl" ){
		opcode = "000000" ;
		funct = "000010" ;
		rs= "00000" ;
		file_in >> cmd ;
		Reg(  cmd , rd ) ;
		file_in >> cmd ;
		Reg(  cmd , rs ) ;
		file_in >> cmd ;
		shamt = D2B( cmd, 5 ) ;
		Instruction = opcode + rs + rt + rd + shamt + funct ;
		//file_out << opcode << rs << rt << rd << shamt << funct << endl ;
	}//else if
	else if( cmd == "j" ){
        string J_temp = "" ;
        char J_array[26] ;
		opcode = "000010" ;
		file_in >> cmd ;
		addr = D2B( cmd, 26 ) ;
		Instruction = opcode + addr ;
		//file_out << opcode << addr << endl ;
	}//else if
	else if( cmd == "lw" ){
		opcode = "100011" ;
		file_in >> cmd ;
		Reg(  cmd , rt ) ;
		file_in >> cmd ;
		Reg(  cmd ,  rs ) ;
		file_in >> cmd ;
		offset= D2B( cmd, 16 ) ;
		Instruction = opcode + rs + rt + offset ;
		//file_out << opcode << rs << rt << offset << endl ;
	}//else if
	else if( cmd == "sw" ){
		opcode = "101011" ;
		file_in >> cmd ;
		Reg(  cmd , rt ) ;
		file_in >> cmd ;
		Reg(  cmd , rs ) ;
		file_in >> cmd ;
		offset= D2B( cmd, 16 ) ;
		Instruction = opcode + rs + rt + offset ;
		//file_out << opcode << rs << rt << offset << endl ;
	}//else if
	else if( cmd == "beq" ){
		opcode = "000100" ;
		file_in >> cmd ;
		Reg(  cmd , rs ) ;
		file_in >> cmd ;
		Reg(  cmd , rt ) ;
		file_in >> cmd ;
		offset= D2B( cmd, 16 ) ;
		Instruction = opcode + rs + rt + offset ;
		//file_out << opcode << rs << rt << offset << endl ;
	}//else if
	else if( cmd == "bgtz" ){
		opcode = "000111" ;
		rt = "00000" ;
		file_in >> cmd ;
		Reg(  cmd , rs ) ;
		file_in >> cmd ;
		offset= D2B( cmd, 16 ) ;
		Instruction = opcode + rs + rt + offset ;
		//file_out << opcode << rs << rt << offset << endl ;
	}//else if
	else if( cmd == "addiu" ){
		opcode = "001000" ;
		file_in >> cmd ;
		Reg(  cmd , rt ) ;
		file_in >> cmd ;
		Reg(  cmd , rs ) ;
		file_in >> cmd ;
		offset= D2B( cmd, 16 ) ;
		Instruction = opcode + rs + rt + offset ;
		//file_out << opcode << rs << rt << offset << endl ;
	}//else if
	else
		cout << "Error command : " << cmd << endl ;
	//cout << Instruction << endl ;

    char resultChar [40] ;
    char Iwant[32] ;
    char tempchar [4] ;
    strcpy( resultChar, Instruction.c_str());


    for( int f = 0 ; f < 32 ; f++ )
        Iwant[f] = resultChar[f] ;

    int counter = 1 ;
    for( int g = 0 ; g < 32 ; g++ ){
        file_out << Iwant[g] ;
        if( counter%4 == 0 && g != 0  )
            file_out << " " ;
        counter++ ;
    }//for


    file_out << endl ;
	file_in >> cmd ;
}//while

    file_out << "end" << endl ;

	file_in.close() ;
	file_out.close() ;

	fstream file_Hex( "MIPS Instructions_0.txt" ) ;
	fstream file_test( "test.txt", ios::out ) ;

	int c = 1 ;
	file_Hex >> cmd ;
	while( cmd != "end" ){
        if( cmd == "0000" )
            file_test << "0" ;
        else if( cmd == "0001" )
            file_test << "1" ;
        else if( cmd == "0010" )
            file_test << "2" ;
        else if( cmd == "0011" )
            file_test << "3" ;
        else if( cmd == "0100" )
            file_test << "4" ;
        else if( cmd == "0101" )
            file_test << "5" ;
        else if( cmd == "0110" )
            file_test << "6" ;
        else if( cmd == "0111" )
            file_test << "7" ;
        else if( cmd == "1000" )
            file_test << "8" ;
        else if( cmd == "1001" )
            file_test << "9" ;
        else if( cmd == "1010" )
            file_test << "a" ;
        else if( cmd == "1011" )
            file_test << "b" ;
        else if( cmd == "1100" )
            file_test << "c" ;
        else if( cmd == "1101" )
            file_test << "d" ;
        else if( cmd == "1110" )
            file_test << "e" ;
        else if( cmd == "1111" )
            file_test << "f" ;
        if( c%2 == 0 )
            file_test << endl ;
        if( c%8 == 0 )
            file_test << endl ;
        c++ ;
        file_Hex >> cmd ;
	}//while

	file_Hex.close() ;
	file_test.close() ;

}//main

void Reg( string cmd , string &temp ) {
if( cmd  == "$at" )
	temp = "00001" ;
else if( cmd == "$v0" )
	temp = "00010" ;
else if( cmd  == "$v1" )
	temp = "00011" ;
else if( cmd   == "$a0" )
	temp = "00100" ;
else if( cmd  == "$a1" )
	temp = "00101" ;
else if( cmd  ==  "$a2" )
	temp = "00110" ;
else if(  cmd   == "$a3" )
	temp = "00111" ;
else if(  cmd   == "$t0" )
	temp = "01000" ;
else if(  cmd  == "$t1" )
	temp = "01001" ;
else if(  cmd ==  "$t2"  )
	temp = "01010" ;
else if(  cmd   == "$t3" )
	temp = "01011" ;
else if(  cmd   == "$t4" )
	temp = "01100" ;
else if(  cmd   == "$t5" )
	temp = "01101" ;
else if(  cmd  ==  "$t6" )
	temp = "01110" ;
else if(  cmd   == "$t7" )
	temp = "01111" ;
else if(  cmd == "$s0" )
	temp = "10000" ;
else if(  cmd  ==  "$s1" )
	temp = "10001" ;
else if(  cmd  == "$s2"  )
	temp = "10010" ;
else if(  cmd  == "$s3" )
	temp = "10011" ;
else if(  cmd == "$s4" )
	temp = "10100" ;
else if(  cmd == "$s5" )
	temp = "10101" ;
else if(  cmd  == "$s6" )
	temp = "10110" ;
else if(  cmd == "$s7"  )
	temp = "10111" ;
else if(  cmd == "$t8" )
	temp = "11000" ;
else if(  cmd  == "$t9" )
	temp = "11001" ;
else if(  cmd  == "$k0" )
	temp = "11010" ;
else if(  cmd   == "$k1" )
	temp = "11011" ;
else if(  cmd  == "$gp" )
	temp = "11100" ;
else if(  cmd ==  "$sp" )
	temp = "11101" ;
else if(  cmd  == "$fp" )
	temp = "11110" ;
else if(  cmd  == "$ra" )
	temp = "11111" ;
else
	temp = "00000" ;
}//reg

string D2B( string cmd, int num ){
int input = atoi( cmd.c_str() ) ;
int total = 0, m = num-1 ;
char temp[num]  ;

for( int i = 0 ; i < num ; i++ ){
	temp[i] = '0' ;
	//cout << temp[i] ;
}//for

//cout << endl << endl ;
while( m >= 0 ){
	total = input % 2 ;
	if( total == 1 )
		temp[m] = '1' ;
	else
		temp[m] = '0' ;
	input = input/2;
	//cout << "this is temp[" << m << "] :" << temp[m] << endl ;
	m-- ;
}//while
//cout << endl << endl ;
m = 0 ;
string temp2 = "" ;
temp2.assign( temp ) ;
return temp2 ;

}//D2B




















