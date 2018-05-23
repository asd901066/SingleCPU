	.text
	.globl main
main:
	lw   $a0, Size			# read the size of array
	li   $a1, 0		              # index i
	li   $a2, 0		              # a2 contains the sum
	li   $t2, 4		              # t2 contains constant 4

loop:	mul  $t1, $a1, $t2	              # t1 gets i*4
	lw   $a3, Nstart($t1)	              # a3 = N[i]
	add  $a2, $a2, $a3	              # sum = sum + N[i]
	add  $a1, $a1, 1	              # i = i + 1
	beq  $a1, $a0, STOR	              # go to STOR if finished
	j    loop

STOR:	sw   $a2, Result	               # store sum at Result

	.data
Nstart:      .word 8, 25, -5, 55, 33, 12, -78
Size:	     .word 7
Result:      .word 0