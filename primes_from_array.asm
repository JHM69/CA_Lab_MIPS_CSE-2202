.data
	array: .space 2000
	space: .asciiz " "
	amount: .asciiz "Enter how many element: "
	inputMsg: .asciiz "Enter the elements :-\n"
	outputMsg: .asciiz "Prime Numbers are : "
.text
main:
li $v0, 4
la $a0, amount
syscall
li $v0, 5
syscall
move $s1,$v0 
mul $s1,$s1,4
li $s4, 2  
li $v0, 4
la $a0, inputMsg
syscall
addi $s0, $zero, 0

input_loop:
	beq $s0, $s1, check
	
	li $v0, 5
	syscall
	move $t1, $v0
	sw $t1, array($s0)
	addi $s0, $s0, 4
	j input_loop
	
check:
	li $v0, 4
	la $a0, outputMsg
	syscall 
	li $s0, 0

cheaking:
	beq $s0, $s1, exit
	lw $t4, array($s0)
	j isPrime

isPrime:
	blt $t4, 0, skip
    beq $t4, 1, skip
    beq $t4, 2, prime_print
    li $s6, 2
    j checkPrime

checkPrime:
	beq $t4, $s6, prime_print
	div $t4, $s6
	mfhi $s7
	beq $s7, 0, skip
	addi $s6, $s6, 1
	j checkPrime
	
prime_print:
	li $v0, 1
	move $a0, $t4
	syscall
	li $v0, 4
	la $a0, space
	syscall
	addi $s0, $s0, 4
	j cheaking

skip:
    addi $s0, $s0, 4
	j cheaking
	
exit:
	li $v0, 10
	syscall