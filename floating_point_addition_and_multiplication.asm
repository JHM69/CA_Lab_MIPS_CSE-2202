#Floating point addition and multiplication
.data
     ms1: .asciiz "Enter first floating number : "
     ms2: .asciiz "Enter second floaing number : "
     ms3: .asciiz "After addition the value is : "
     ms4: .asciiz "\nAfter multiplication the value is :"
.text

main:

li $v0,4
la $a0,ms1
syscall

li $v0,6
syscall
mov.s $f1,$f0

li $v0,4
la $a0,ms2
syscall

li $v0,6   
syscall
mov.s $f2,$f0


add.s $f12,$f1,$f2

li $v0,4
la $a0,ms3
syscall


li $v0,2 
syscall


mul.s $f12,$f1,$f2

li $v0,4
la $a0,ms4
syscall


li $v0,2 
syscall

li $v0,10
syscall













