.data
msg: .asciiz "Enter the Number "
p: .asciiz "Palindrome"
np: .asciiz "Not Palindrome"
.text

main:

li $v0, 4
la $a0, msg
syscall


li $v0, 5
syscall
move $t0, $v0

move $t1, $t0

li $t3,0 #reminder
li $t4,0 #reverse

loop:
beq $t0, 0, ans
rem $t3, $t0, 10
mul $t4, $t4, 10
add $t4, $t4, $t3
div $t0, $t0, 10

j loop

ans:
beq $t1,$t4,yesPalindrome  
li $v0,4
la $a0,np
syscall
j exit 

yesPalindrome:
li $v0,4
la $a0,p
syscall



exit:
li $v0,10
syscall






















