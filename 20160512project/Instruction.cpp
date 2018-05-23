#include <string>
#include <iostream>
#include <fstream>
#include <stdio.h>
#include <algorithm>
#include <stdlib.h>
#include<cmath>

using namespace std;

enum{
	AT = 1,
	v0,
	v1,
	a0,
	a1,
	a2,
	a3,
	t0,
	t1,
	t2,
	t3,
	t4.
	t5,
	t6,
	t7
	} ;

void R_Type( &char[], &char[], &char[], &char[], &char[], &char[], int  ) ;
void I_Type( &char[], &char[], &char[], &char[], int ) ;
void J_Type( &char[], &char[], int ) ;
void Multiple( &char[], &char[], &char[], &char[], &char[], &char[], int ) ;


int main() {

int cmd ;
char [6] opcode, funct ;
char [5] rs, rt, rd,shamt ;
char [16] offset ; 
char [26] addr ;
cout << "//---------------------------------------------------------------------------//" << endl ;
cout << "// Please choose which Instruction Reference you like                     //" << endl ;
cout << "// 1. ADD 2. SUB 3.AND 4.OR 5.SLT 6.SLL 7.SRL                     //" << endl ;
cout << "// 8.LW 9.SW 10.BEQ 11.BGTZ 12.ADDIU 13.Jump 14.MULT   //" << endl ;
cout << "// 0. Finish the program                                                                 //" << endl ;
cout << "//--------------------------------------------------------------------------//" << endl ;

cin >> cmd ;

switch( cmd ) {
	case 1 - 7 :
		R_Type( opcode, rs, rt, rd, shamt, funct, cmd ) ;
	case 8 - 12 :
		I_Type( opcode, rs, rt, offset, cmd ) ;
	case 13 :
		J_Type( opcode, addr, cmd ) ;
	case 14 :
		Multiple( opcode, rs, rt, rd, shamt, funct, cmd ) ;
	default :
		cout << "error commend !" << endl ;

} // switch



}//main


void R_Type( &char[] opcode, &char[] rs, &char[] rt, &char[] rd, &char[] shamt, &char[] funct, int cmd ) {



	for( int i = 0 ; i < 6 ; i++ )
		opcode[i] = '0' ;
		
	if( cmd == 1 ){
		cout << "// Your RS :"
		cin >> rs ;
		cout << "// Your RT :"
		cin >> rs ;
		cout << "// Your RD :"
		cin >> rs ;
		cout << "// Your SHAMT :"
		cin >> rs ;
		cout << "// Your FUNCT :"
		cin >> rs ;
	}//if

}//R_Type
void I_Type( &char[] opcode, &char[] rs, &char[] rt, &char[] offset ) ;
void J_Type( &char[] opcode, &char[] addr ) ;
void Multiple( &char[] opcode, &char[] rs, &char[] rt, &char[] rd, &char[] shamt, &char[] funct )  ;
















