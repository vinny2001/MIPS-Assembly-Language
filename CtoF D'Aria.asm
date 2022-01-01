## CS 254 Program 9
##
## Convert from Celsius to Fahrenheit
##
## Programmer: Vincenzo D'Aria
## Date: 11/20/2021
##
## Register use table:
##
## $v0 = handles syscall codes
## $a0 = loads addresses from data section
## $f1 = constant
## $f2 = five
## $f3 = nine
## $f0 = holds value of temp in Fahrenheit, starting with the temp in Celsius
## $f12= holds final value of temp in Fahrenheit


      .text
      .globl  main
       
main:

      li      $v0, 4                ## code 4 == print string
      la      $a0, inputText        ## load address of inputText
      syscall                       ## OS prints inputText

      li      $v0,  6               ## code 6 == read float
      syscall                       ## tells OS that float that was read == temp. in Celsius

      l.s     $f1, constant         ## load 32 bit float constant
      l.s     $f2, five             ## load 32 bit float five
      l.s     $f3, nine             ## load 32 bti float nine
    
      mul.s   $f0, $f0, $f3         ## celsius * 9
      div.s   $f0, $f0, $f2         ## celsius * (9/5)
      add.s   $f0, $f0, $f1         ## celsius * (9/5) + 32 = fahrenheit

      li      $v0, 4                ## code 4 == print string
      la      $a0, outputText       ## load address of outputText
      syscall                       ## OS prints outputText

      li      $v0, 2                ## code 2 == print float
      mov.s   $f12, $f0             ## move fahrenheit from $f0 to $f12
      syscall                       ## OS prints temp. in fahrenheit

      li $v0, 10                    ## Code 10 == exit program
      syscall                       ## OS exits program

data:
                        .data
                        
      inputText:        .asciiz     "Enter Celsius: "
      outputText:       .asciiz     "Fahrenheit: "
      constant:         .float      32.0
      five:             .float      5.0
      nine:             .float      9.0


## End of Program