.text
.globl main
main :
    la $t0 , array1       # load data to data segment, $t0 is it's address
	addiu $s7 , $t0 , 36  # $s7 <- stop address <<<< [data_num - 1] * 4
	addiu $s3 , $t0 , 0   # $s3 <- 2147482864
	
L1 :
	lw $s1 , 0($s3)       # $s1 <- num1
	beq $s3 , $s7 , fin   # $s3 stop or not
	addiu $s4 , $s3 , 4   # $s4 <- mem address( $s3 + 4 )
	
L2 :
	lw $s2 , 0($s4)       # $s2 <- num2
	slt $s5 , $s2 , $s1   # $s5 <= compare $s2, $s1
	beq $s5 , $0 , store  # ($s5 == 0) --> ($s1 < $s2)  ||  ($s5 != 0) --> ($s1 > $s2)
	add $s6 , $s1 , $0    #change num1 & num2
	add $s1 , $s2 , $0
	add $s2 , $s6 , $0
	
store :
	sw $s1 , 0($s3)      # mem[$s3] <- $s1
	sw $s2 , 0($s4)      # mem[$s4] <- $s2
	
	addiu $s4 , $s4 , 4  # $s4 <- $s4 + 4 
	slt $s5 , $s7 , $s4  # compare $s4 & $s7 --> stop loop or not
	beq $s5 , $0 , L2
	
	addiu $s3 , $s3 , 4
	slt $s5 , $s7 , $s3
	beq $s5 , $0 , L1
	
fin : # finish lable

.data
array1:	.word 10, 5, 8, 9, 7, 6, 4, 2, 1, 3    # 10 numbers