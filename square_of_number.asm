.data
msg: .asciiz "Enter the Number "
.text

main:

li $v0, 4
la $a0, msg
syscall


li $v0, 5
syscall
move $t0, $v0

jal Square

exit:
li $v0,10
syscall


Square:

mul $t0, $t0, $t0
li $v0, 1
move $a0, $t0
syscall

jr $ra









