.data
m1: .asciiz "Enter a Number " 
p: .asciiz "Number is Positive" 
n: .asciiz "Number is Negetive" 
.text

main:

li $v0, 4
la $a0, m1
syscall


li $v0, 5
syscall
move $s0, $v0

addi $t0, $t0, 0
slt $t2, $s0, $t0

beq $t2, 1, negetive

li $v0, 4
la $a0, p
syscall
j Exit

negetive: 
li $v0, 4
la $a0, n
syscall

Exit: 
li $v0, 10
syscall




