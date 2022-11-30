.data
m1: .asciiz "Enter a limit: " 
r: .asciiz "Sum is: " 
comma: .asciiz ", " 
.text

main:

li $v0, 4
la $a0, m1
syscall


li $v0, 5
syscall
move $s0, $v0

li $t0,1
j for_loop

li $v0, 10
syscall

li $s2, 0
for_loop:
	bgt $t0, $s0, Exit
	beq $t0, $s0, print_sum
	add $s2, $s2, $t0 
	#increment i8
	addi $t0, $t0, 1
	#jump back to foor_loop
	j for_loop

print_sum:
	li $v0, 4
	la $a0, r
	syscall

li $v0, 1
move $a0, $s2
syscall

Exit: 
	li $v0, 10
	syscall




