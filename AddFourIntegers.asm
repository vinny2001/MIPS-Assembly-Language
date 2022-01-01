## CS 254 Program 2 Fall 2021
##
## Compute a + b + c + d
##
## Programmer: Vincenzo D'Aria
## Date: 29 September 2021


        .text
        .globl  main

main:
        ori     $8,$0,0x1      # put two's comp. one into register 8
        ori     $9,$0,0x2      # put two's comp. two into register 9
        ori     $12,$0,0x3     # put two's comp. three into register 12
        ori     $13,$0,0x4     # put two's comp. four into register 13
        
        addu    $14,$8,$9      # add register 8 and 9, put result in 14
        addu    $15,$14,$12    # add register 14 and 12, put result in 15. 
        addu    $10,$15,$13    # add register 15 and 13, put result in 10. Result is final answer!
        
## End of file