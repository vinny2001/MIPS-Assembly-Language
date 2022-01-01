## CS 254 Program 4
##
## Compute 7x^4+2x^3+10x^2-3x+17 using Horner's Method
##
## Programmer: Vincenzo D'Aria
## Date: 16 October 2021


        .text
        .globl  main
        
main:

        addiu   $9,$0,3       ## Load the value of x (decimal 3) into register 9
        addiu   $10,$0,7      ## Load register 10 with the first coefficent (decimal 7)
        mult    $10,$9        ## Multiplies 7*x
        mflo    $10           ## $10 = 7x
        addiu   $10,$10,2     ## Adds decimal 2 to 7x, result in $10
        mult    $10,$9        ## Multiples the quantity (7x+2) by x to get 7x^2+2x
        mflo    $10           ## $10 = 7x^2+2x
        addiu   $10,$10,10    ## Adds decimal 10 to 7x^2+2x to get 7x^2+2x+10, result in $10
        mult    $10,$9        ## Multiples the quantity 7x^2+2x+10 by x to get 7x^3+2x^2+10x
        mflo    $10           ## $10 = 7x^3+2x^2+10x
        addiu   $10,$10,-3    ## Adds decimal negative 3 to 7x^3+2x^2+10x to get 7x^3+2x^2+10x-3, result in $10
        mult    $10,$9        ## Multiples the quantity 7x^3+2x^2+10x-3 by x to get 7x^4+2x^3+10x^2-3x
        mflo    $10           ## $10 = 7x^4+2x^3+10x^2-3x
        addiu   $10,$10,17    ## Adds decimal 17 to 7x^4+2x^3+10x^2-3x, result is final answer, 7x^4+2x^3+10x^2-3x+17, in $10

## End of File