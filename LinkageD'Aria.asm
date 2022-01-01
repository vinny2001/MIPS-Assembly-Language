#
# CS 254 Program 11
# Subroutine Linkage to compute multiplication
#
# Programmer: Vincenzo D'Aria
# Date: 12/07/2021
#
# Register use table:
# -------------------
# $s0 = x
# $s1 = y
# $s2 = z
# $s3 = product
# $a0 = handles addresses from data section
# $v0 = handles syscall codes

      .text
      .globl    main
      
      
main:
      
      la        $a0,prompt1    # print string
      li        $v0,4          # code 4 == print string
      syscall
    
      li        $v0,5          # code 5 == read int
      syscall                  # 
      move $s0, $v0            # $s0 = x
      
      la        $a0,prompt2    # print string
      li        $v0,4          # code 4 == print string
      syscall
    
      li        $v0,5          # code 5 == read int
      syscall                  # 
      move $s1, $v0            # $s1 = y
      
      la        $a0,prompt3    # print string
      li        $v0,4          # code 4 == print string
      syscall
    
      li        $v0,5          # read int into $v0
      syscall                  # code 5 == read int
      move $s2, $v0            # $s2 = z
      
      jal mult3                # Jump and link to mult3
      nop          
      move $s3, $v0            # move product from $v0 to $s3
      
      li $v0, 4                # code 4 == print string
      la $a0, product          # $a0 = Address of product
      syscall
      
      li $v0, 1                # code 1 == print integer
      move $a0, $s3            # $s3 = product
      syscall
      
      li        $v0,10         # exit program
      syscall

data:

      .data

      prompt1:   .asciiz        "Enter X: "
      prompt2:   .asciiz        "Enter Y: "
      prompt3:   .asciiz        "Enter Z: "
      product:   .asciiz        "Product: " 
      
## end of file