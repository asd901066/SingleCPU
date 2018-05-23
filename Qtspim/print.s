	.data

str1:	.asciiz "Please type a string with lenght 19\n"
str2:	.asciiz "This string is that you input\n"

	.text 		           # 本文區段
	.align 2
	.globl main	           # main為全域變數

main:	li   $v0, 4		           # print_string的系統呼叫程式碼
	la   $a0, str1	           # 要列印字串的位置在str1
	syscall		           # 印出字串	
	li   $v0, 8		           # read_string的系統呼叫程式碼
	li   $a1, 20		           # 可讀入的字串長度19
	syscall		           # string的起始位置為暫存器$a0
	addi $t0, $a0, 0	           # 把暫存器$a0拷貝至暫存器$t0	
	
	li   $v0, 4		           # print_string的系統呼叫程式碼
	la   $a0, str2	           # 要列印字串的位置在str2
	syscall		           # 印出字串

	li   $v0, 4
	addi $a0, $t0, 0	           # 把暫存器$t0拷貝至暫存器$a0
	syscall