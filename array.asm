.data
	array: .space 2000
	space: .asciiz " "
	howMany: .asciiz "Enter the number of integer less than 500: "
	inputMsg: .asciiz "Enter the element of array :-\n"
	outputMsg: .asciiz "Array: "
	
.text
main:

li $v0, 4
la $a0, howMany
syscall


li $v0, 5
syscall
move $s1,$v0  #s1=5 integers

mul $s1,$s1,4 #s1=20 bytes

li $v0, 4
la $a0, inputMsg
syscall

addi $s0, $zero, 0

input_loop:
	beq $s0, $s1, output
	#taking input from user
	li $v0, 5
	syscall
	move $t1, $v0  #1
	
	#storing the result
	
	sw $t1, array($s0)
	addi $s0, $s0, 4
	j input_loop
	
output:
	li $v0, 4
	la $a0, outputMsg
	syscall

	
	li $s0, 0
	
print_loop:
	beq $s0, $s1, exit
	
	lw $t4, array($s0)
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $s0, $s0, 4
	j print_loop
	
exit:
	li $v0, 10
	syscall















