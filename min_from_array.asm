.data
	array: .space 2000
	space: .asciiz " "
	howMany: .asciiz "Enter the number of integer less than 500: "
	inputMsg: .asciiz "Enter the element of array :-\n"
	outputMsg: .asciiz "Min is : "
	
.text
main:

li $v0, 4
la $a0, howMany
syscall


li $v0, 5
syscall
move $s1,$v0  #s1=5 integers

mul $s1,$s1,4 #s1=20 bytes
li $s4, 2  #for cheaking even number

li $v0, 4
la $a0, inputMsg
syscall

addi $s0, $zero, 0



input_loop:
	beq $s0, $s1, preMin
	#taking input from user
	li $v0, 5
	syscall
	move $t1, $v0
	
	#storing the result
	sw $t1, array($s0)
	addi $s0, $s0, 4
	j input_loop

preMin:
	li $s0, 0
	lw $t5, array($s0)

findMin:
	beq $s0, $s1, print
	lw $t4, array($s0)
	addi $s0, $s0, 4
	bgt $t5, $t4 , setMin
	j findMin
setMin:	
	move $t5, $t4
	j findMin

print:
	li $v0, 4
	la $a0, outputMsg
	syscall
	
	li $v0, 1
	move $a0,  $t5
	syscall
	
exit:
	li $v0, 10
	syscall















