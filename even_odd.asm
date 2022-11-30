.data
m: .asciiz "Enter a Limit: "
e: .asciiz "Even Sum is:  " 
n: .asciiz "\n" 
o: .asciiz "Odd Sum is:  " 
.text

main:

li $v0, 4
la $a0, m
syscall

li $v0, 5
syscall
move $s0, $v0



li $t1, 0 #even sum
li $t2, 0 #odd sum
li $s2, 2 #will be used to find even or odd


li $t0, 0
j for_loop 


for_loop:
	beq $t0, $s0, print_result
	addi $t0, $t0, 1
	div $t0, $s2 #$t0/$s2
	mfhi $s3 #store reminder
	beq $s3,0,even 
	j odd
even:
	add $t1, $t1, $t0
	j for_loop
	
odd:
	add $t2, $t2, $t0
	j for_loop

print_result:
	li $v0, 4
	la $a0, e
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, n
	syscall
	
	li $v0, 4
	la $a0, o
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall








