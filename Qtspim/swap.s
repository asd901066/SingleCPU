.text
.globl	main
main:
	la	$a0, array
	addi	$a1, $0, 0	

	addi	$sp, $sp, -4
	sw	$ra, 0($sp)	

	jal	swap		

	lw	$ra, 0($sp)
	addi	$sp, $sp, 4	

	jr	$ra
	
swap:
	add	$t1, $a1, $a1
	add	$t1, $t1, $t1
	add	$t1, $a0, $t1
	lw	$t0, 0($t1) 
	lw	$t2, 4($t1)
	sw	$t2, 0($t1)
	sw	$t0, 4($t1)
	jr	$ra
.data
array:	.word 5, 4, 3, 2, 1

#	swap(int v[], int k)
#	{
#		int temp;
#		temp = v[k];
#		v[k] = v[k+1];
#		v[k+1] = temp;
#	}

