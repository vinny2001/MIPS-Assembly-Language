## CS 254 Program 6
##
## Program 6 - Odd Sum
##
## Programmer: Vincenzo D'Aria
## Date: 30 October 2021
##
## Register Use:
## -------------
## $6  - loads in decimal 2
## $7  - loop conditional variable (0 or 1)
## $9  - loads n+1 so the if statement works for the final value of n
## $10 - base register
## $11 - n
## $12 - loop counter
## $13 - even sum
## $14 - odd sum
## $16 - remainder


        .text
        .globl  main
      
main: 
        lui     $10,0x1000      ## Init base register
        lw      $11,0($10)      ## Load n from memory
        lw      $13,4($10)      ## Load even sum from memory
        lw      $14,8($10)      ## Load odd sum from memory
        addu    $9,$11,1        ## Loads n+1 into register 9
        ori     $12,$0,0        ## counter = 0
        ori     $6,$0,2         ## Load in decimal 2

loop:   
        slt     $7,$12,$9       ## If counter is < n, put 1 in $7, else put a 0
        beq     $7,$0,endLP     ## Ends the loop if counter remainder is zero
        sll     $0,$0,0         ## delay
        divu    $12,$6          ## divide counter by 2
        mfhi    $16             ## move remainder into register 16
        beq     $16,$0,addEven  ## if remainder is even, jump to add even
        sll     $0,$0,0         ## Delay

addOdd:
        addu    $14,$12,$14     ## Adds odd sum to the counter
        addiu   $12,$12,1       ## counter++
        j loop                  ## Jump back into loop
        sll     $0,$0,0         ## delay
        

addEven:
        addu    $13,$12,$13     ## Adds even sum to counter
        addiu   $12,$12,1       ## counter++
        j loop                  ## Jump back into loop
        sll     $0,$0,0         ## delay

endLP:
        sw      $13,4($10)      ## Stores the even sum in register 13
        sw      $14,8($10)      ## Stores the odd sum in register 14
        sll     $0,$0,0         ## Delay
        
            .data

n:          .word    4
evensum:    .word    0
oddsum:     .word    0