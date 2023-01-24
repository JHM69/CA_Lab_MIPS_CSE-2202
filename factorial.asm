
.data
    input: .asciiz "Enter an integer n: "
    output: .asciiz "Factorial of the given number is = "
       
.text
    li        $v0, 4
    la        $a0, input
    syscall
   
    li        $v0, 5
    syscall
    move      $a0, $v0  
    
    
    jal      factorial      
    move      $t0, $v0      
    
    li        $v0, 4
    la        $a0, output
    syscall
    
  
    li        $v0, 1       
    move      $a0, $t0    
    syscall 
    
    li        $v0, 10 
    syscall
factorial:
    addi    $sp, $sp, -8
    sw      $s0, 4($sp)
    sw      $ra, 0($sp)
    
    addi    $v0, $zero, 1
    
    beq     $a0, 0, fact_return 
    
    move $s0, $a0
    addi $a0, $a0, -1
    jal factorial
    mul $v0, $s0, $v0

    
fact_return:
    lw      $s0, 4($sp)
    lw      $ra, 0($sp)
    addi    $sp, $sp, 8
    jr      $ra
