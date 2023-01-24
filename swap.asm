.data
msg1: .asciiz "Number 1 : "
msg2: .asciiz "Number 2 : "

r1: .asciiz "Number 1 : "
r2: .asciiz "Number 2 : "

endLine: .asciiz " \n "

.text

main:

li $v0, 4
la $a0, msg1
syscall


li $v0, 5
syscall
move $t1, $v0

li $v0, 4
la $a0, msg2
syscall


li $v0, 5
syscall
move $t2, $v0


jal Swap

li $v0, 4
la $a0, r1
syscall


li $v0, 1
move $a0, $t1
syscall


li $v0, 4
la $a0, endLine
syscall

li $v0, 4
la $a0, r2
syscall


li $v0, 1
move $a0, $t2
syscall


exit:
li $v0,10
syscall


Swap:
move $t3, $t1
move $t1, $t2
move $t2, $t3
jr $ra









