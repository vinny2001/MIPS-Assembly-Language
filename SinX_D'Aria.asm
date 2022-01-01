# CS 254 Program 10
# Compute sin(x) with a Taylor series
#
# Programmer: Vincenzo D'Aria
# Date: 11/27/2021
#
# Register use table:
#
# $v0 = handles syscall codes
# $a0 = handles addresses from data section
# $f0 = x
# $f1 = term
# $f2 = accumilator for numerator
# $f3 = accumilator for denominator
# $f4 = -1
# $f5 = 3
# $f6 = 21
# $f7 = 2
# $f12 = sin value


      .text
      .globl  main
       
main:

      li      $v0,  4             ## Code 4 == print string
      la      $a0,  enterPrompt   ## Load address of sinPrompt
      syscall                     ## OS prints value of x
      
      li      $v0,  6             ## code 6 == read float, put in $f0
      syscall
      
      add.s   $f1, $f3, $f0       ## load in variable for term, use $f3 as a zero-register
      add.s   $f12,$f3, $f0       ## load in variable for  sin, ise $f3 as a zero-register
      
      li.s    $f4, -1.0           ## load $f4 with immediate float -1
      li.s    $f5, 3.0            ## load $f5 with immediate float 3
      li.s    $f6, 21.0           ## load $f6 with immediate float 21
      li.s    $f7, 2.0            ## load $f7 with immediate float 2

loop:
      c.lt.s  $f6, $f5            ## if 21 < n, run loop
      bc1t    end                 
      mul.s   $f2, $f1, $f0       ## term * x
      mul.s   $f2, $f2, $f0       ## term * x *x 
      mul.s   $f2, $f2, $f4       ## -(term * x *x )
      
      add.s   $f3, $f5, $f4       ## n-1
      mul.s   $f3, $f3, $f5       ## n*(n-1)
      
      div.s   $f1, $f2, $f3       ## -(term * x *x )/(n*(n-1))
      
      add.s   $f12,$f12,$f1       ## sin += term
      
      add.s   $f5, $f5, $f7       ## increment $f5 by 2 after each run of loop 
     
      b loop                      ## branch back into loop
      
end: 
      
      li     $v0, 4               ## Code 4 == print string
      la     $a0, sinPrompt       ## Load address of sinPrompt
      syscall                     ## OS prints value of sin(x)
      
      li      $v0, 2              ## code 2 == print float
      syscall                     ## OS prints sin(x)
      
      li     $v0, 10              ## code 10 == exit program
      syscall                     ## OS exits program
   
data:

      .data
      
      enterPrompt:  .asciiz   "Enter x: "
      sinPrompt:    .asciiz   "Sin x: "

## End of File