.data
array: .space 100   
size: .asciiz "Enter size: "
int: .asciiz "Enter int: "
final: .asciiz "\nSorted: "

.text

main:

la $a0,size                       
li $v0,4
syscall

li $v0,5
syscall

move $s1, $v0                      
sub $s1,$s1,1                       

addint:

la $a0,int                     
li $v0,4
syscall

li $v0,5        
syscall

move $t3,$v0                        
add $t1,$zero,$zero                 
sll $t1,$t0,2                       

sw $t3,array ( $t1 )                
addi $t0,$t0,1                      
slt $t1,$s1,$t0                     
beq $t1,$zero,addint                

la $a0,array                        
addi $a1,$s1,1                      

jal bubble_sort                            

la $a0,final 
li $v0,4
syscall

la $t0,array                        
li $t1,0                            

print:
lw $a0,0($t0)                       
li $v0,1
syscall

addi $t0,$t0,4                      
addi $t1,$t1,1                      
slt $t2,$s1,$t1                     
beq $t2,$zero,print                 

li $v0,10                           
syscall

bubble_sort:
li $t0,0                            

loop1:

addi $t0,$t0,1                      
bgt $t0,$a1,end                  
add $t1,$a1,$zero                   

loop2:

bge $t0,$t1,loop1                  

subi $t1,$t1,1                      

sll $t4, $t1, 2                     
subi $t3, $t4, 4                    

add $t4,$t4,$a0                     
add $t3,$t3,$a0                     
lw $t5,0($t4)
lw $t6,0($t3)

swap:
bgt $t5,$t6,loop2                   
sw $t5,0($t3)                       
sw $t6,0($t4)
j loop2

end:
jr $ra