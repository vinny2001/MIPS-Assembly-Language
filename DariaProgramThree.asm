## CS 254 Program 3
##
## Compute 27*x
##
## Programmer: Vincenzo D'Aria
## Date: October 6 2021


        .text
        .globl  main
        
main:

        ori     $5,$0,4       # Puts decimal three into register 5. This is value x
        
        sll     $6,$5,1       # Shift-left logical x once. Puts result into register 6
        sll     $7,$5,3       # Shift-left logical x three times. Puts result into register 7
        sll     $8,$5,4       # Shift-left logical x four times. Puts result into register 8
        
        addu    $3,$6,$7      # Add registers 6 and 7. Puts result into register 3
        addu    $4,$3,$8      # Add registers 3 and 8. Puts result into register 4
        addu    $10,$4,$5     # Add registers 4 and 5. Puts result into register 10. Result is 27x


## End of file
