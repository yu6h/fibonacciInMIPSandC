.data
    promptMessage:  .asciiz  "Enter a number to find its fibonacci :"
    resultMessage:  .asciiz  "The fibonacci  of number is :"
    theAnswer:  .word 0
    theNumber:  .word 0
    myArray:  .word 0:200
.text

    main:
    # Read the number from the user.
    li $v0, 4
    la $a0, promptMessage
    syscall
    
    li $v0, 5
    syscall
    
    sw $v0, theNumber
    
    # Call the factorial function
    lw   $a0, theNumber
    la   $a1, myArray
    jal  findFibonacci
    sw  $v0, theAnswer
    
    # Display the results
    li $v0 , 4
    la $a0 , resultMessage
    syscall
    
    li $v0, 1
    lw $a0, theAnswer
    syscall
    
  # Tell the system that the program is done.
  li $v0, 10
  syscall

   findFibonacci:
           subu  $sp, $sp, 12
           sw    $ra, 0($sp)
           sw    $s0, 4($sp)
           sw    $s1, 8($sp)     
           
           move $s0, $a0
           
           # Base Case: already have value in myArray
           sll $t0,$s0,2
           add $t0,$t0, $a1
           lw $v0, 0( $t0)
           bnez $v0 ,  fibonacciDone
           
           # Base Case: parameter  is 1 or 2
           sne $t0, $s0,1
           sne $t1, $s0,2
           and $t0, $t0, $t1
           beq $t0,1,L1
           
           sll $t0,$s0,2
           add $t0,$t0, $a1
           li $t1,1
           sw $t1,0($t0)
           move $v0, $t1
           j fibonacciDone

             L1:
           # Recursive Case: findFibonacci (theNumber - 1)
           sub $a0, $s0, 1
           jal findFibonacci
           move $s1, $v0
           
           # Recursive Case: findFibonacci (theNumber - 2)
           sub $a0, $s0, 2
           jal findFibonacci
           
           #calculate!
          add $t1, $s1, $v0
          #save result in array
          sll $t0,$s0, 2
          add $t0, $a1, $t0
          sw $t1, 0( $t0 )
          move $v0, $t1
            
             fibonacciDone:
           lw   $ra, 0($sp)
           lw   $s0,  4( $sp)
           lw    $s1, 8($sp)
           addu  $sp, $sp, 12
           jr $ra
           
