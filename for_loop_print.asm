.data
m1: .asciiz "Enter a limit: " 
comma: .asciiz ", " 
.text

main:

li $v0, 4
la $a0, m1
syscall


li $v0, 5
syscall
move $s0, $v0

li $t0, 1
j for_loop

for_loop:
	bgt  $t0, $s0, Exit
	#print i
	li $v0, 1
	move $a0, $t0
	syscall

	beq $t0, $s0, Exit

	#print comma
	li $v0, 4
	la $a0, comma
	syscall


	#increment i8
	addi $t0, $t0, 1

	#jump back to foor_loop

	j for_loop

Exit: 
li $v0, 10
syscall




