## CS 254 Program 7
##
## Program 7 - rand
##
## Programmer: Vincenzo D'Aria
## Date: 3 November 2021
##
## Register Use:
## -------------
## $s0 = initial value
## $s1 = number of random numbers
## $s2 = a
## $s3 = modulus constant
## $t0 = loop counter
## $t1 = result
## $v0 = used to handle syscalls
## $a0 = loading strings

        .text
        .globl main

main:

        
        li     $v0,4            ## print string prompt
        la     $a0,initial      ## $a0 = initial
        syscall
        
        
        li     $v0,5            ## read integer (initial value)
        syscall 
        move   $s0,$v0          ## $s0 = initial value
        li     $v0,4            ## print string into console
        la     $a0,prompt       ## $a0 = prompt 
        syscall
        
        li     $v0,5            ## read integer (prompt) at console
        syscall
        
        move   $s1,$v0          ## $s1 = prompt
        li     $t0,0            ## initialize loop counter to zero
        li     $t1,0            ## initialize the result
        li     $s2,21           ## $t2 = a =21
        li     $s3,100          ## $t3 = modulus constant = 100
for:    
        beq    $t0,$s1,endFor   ## for(i=0;i<$s1;i++)
        mult   $s0,$s2          ## multiply initial value * 21
        mflo   $t1              ## $t1 = initial value *21
        addi   $t1,$t1,53       ## $t1 = (initial value *21 + 53)
        div    $t1,$s3          ## $t1 = (initial value *21 + 53) / 100
        mfhi   $t1              ## $t1 holds first random number
        or     $s0,$0,$t1       ## $s0 = new intial value
        li     $v0,1            ## prints integer
        move   $a0,$t1          ## $a0 = result
        syscall
        li     $v0, 4           ## print into string console
        la     $a0,space        ## prints a new line after every result value
        syscall
        addi   $t0,$t0,1        ## i++
        b for                   ## breaks the loop
        
endFor:
        li     $v0,4            ## Print string into console
        la     $a0,done         ## Print done
        syscall
        li     $v0,10           ## exit
        syscall
        
        
           .data
initial:   .asciiz  "Enter the initial value, followed by enter: "
prompt:    .asciiz  "Enter how many: "
done:      .asciiz  "Done"
space:     .ascii   "\n"

        
## End of file
      