.data
m1: .asciiz "Enter a Number to check Prime or Not: " 
p: .asciiz "Number is Prime" 
n: .asciiz "Number is Not Prime" 
.text

main:

li $v0, 4
la $a0, m1
syscall


li $v0, 5
syscall
move $s0, $v0

li $s1, 2

blt $s0, 0, notPrime
beq $s0, 1, notPrime
beq $s0, 2, prime

checkPrime:
	beq $s0, $s1, prime
	div $s0, $s1
	mfhi $s3
	beq $s3, 0, notPrime
	addi $s1, $s1, 1
	j checkPrime

prime: 
li $v0, 4
la $a0, p
syscall
j exit

notPrime: 
li $v0, 4
la $a0, n
syscall
j exit

exit: 
li $v0, 10
syscall




