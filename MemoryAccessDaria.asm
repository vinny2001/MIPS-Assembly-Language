## CS 254 Program 5
##
## Program 5 - Memory Access
##
## Programmer: Vincenzo D'Aria
## Date: 23 October 2021
##
## Register Use:
##
## $10 base register, address of x
## $11 x
## $12 y
## $13 value of polynomial ( and accumilator)
## $4  temporary
## $14 value of remainder



        .text
        .globl  main
        
main:
        lui     $10,0x1000    # Init base register
        lw      $11,0($10)    # load x
        lw      $12,4($10)    # load y
        
        ori     $13,$0,28     # Initialize the accumilator
  
        mult    $11,$12       # x*y
        mflo    $14           # $14 = x*y, 32-bit result
        addiu   $4,$0,10      # Puts 10 in $4
        mult    $14,$4        # 10xy
        mflo    $14           # $14 = 10xy, 32-bit result
        addu    $13,$13,$14   # 10xy + 28
        
        addiu   $4,$0,17      # Puts 17 in 4
        mult    $11,$4        # 17x
        mflo    $14           # $14 = 17x
        addu    $13,$13,$14   # 17x + 10xy +28
        addiu   $4,$0,5       # Puts 5 in $4
        divu    $13,$4        # (17x + 10xy +28)/5
        mflo    $13           # $13 = (17x + 10xy +28)/5
        mfhi    $14           # $14 = remainder 
        
        sw      $13,8($10)    # Store $13 result in answer
        sw      $14,12($10)   # Store $14 remainder in remainder
        
        
        
            .data

x:          .word   -1
y:          .word   -1
answer:     .word    0
remainder:  .word    0



## End of File