.data
msg1: .asciiz "Enter the number of elements(less than 500) : "
msg2: .asciiz "Enter the values : "
array: .space 2000
space: .asciiz " "
msg3: .asciiz "Enter the element that you want to search : "
output2: .asciiz "The searched index is not in here."
output3: .asciiz "The number is found  : "
newline: .asciiz " \n"
.text
main:

li $v0,4
la $a0,msg1
syscall

li $v0,5  				# $v0=5
syscall
move $s0,$v0 		#s0=5

mul $s0,$s0,4 		#s0=5*4=20

li $v0,4
la $a0,msg2
syscall

addi $s1,$zero,0

start:

beq $s1,$s0,search  #s1=0, $s0=20

li $v0,5		#$v0= 1,2,3,4,5
syscall
move $t0,$v0 

sb $t0,array($s1) 
#array(0)=1, #array(4)=2, #array(8)=3, 
addi $s1,$s1,4
j start

search:
li $v0,4
la $a0,msg3
syscall

li $v0,5
syscall
move $t1,$v0

addi $s1,$zero,0

for2:
beq $s1,$s0,no
lb $t0,array($s1) #array(0)=1
beq $t1,$t0,yes
addi $s1,$s1,4
j for2
no:
li $v0,4
la $a0,output2
syscall
j exit
yes:
li $v0,4
la $a0,output3
syscall

div $t3, $s1, 4 
li $v0,1
move $a0,$t3
syscall 

exit:
li $v0,10
syscall
