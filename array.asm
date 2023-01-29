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


bubble_sort:
addi $s2, $zero, 0 # initialize outer loop variable
addi $s3, $s1, -1 # initialize inner loop variable

outer_loop:
beq $s2, $s3, output # exit outer loop if s2 == s3
addi $s3, $s2, 1 # reset inner loop variable
inner_loop:
beq $s3, $s1, outer_loop # exit inner loop if s3 == s1
lw $t1, array($s3) # load array element at s3
lw $t2, array($s3-4) # load array element at s3 - 1
bgt $t1, $t2, skip_swap # if t1 > t2, skip swap
sw $t1, array($s3-4) # swap t1 and t2
sw $t2, array($s3)
skip_swap:
addi $s3, $s3, 4 # increment inner loop variable
j inner_loop
addi $s2, $s2, 1 # increment outer loop variable
j outer_loop
	
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















