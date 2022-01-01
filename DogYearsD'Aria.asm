## CS 254 Program 8
##
## Enter age in years, compute the equivalent human age.
##
## Programmer: Vincenzo D'Aria
## Date: 11/16/2021
##
## Register use table:
##
## $s0 = dog's age
## $s1 = equivalent human age
##
## $v0 = used to handle syscalls
##
## $a0 = used to load address of data
##
## $t1 = constant for 1
## $t2 = constant for 2
## $t3 = constant for 5



          .text
          .globl  main
        
main:    

          li     $v0,4          ## code 4 == print string
          la     $a0,dogAge     ## $a0 = dogAge
          syscall

          li     $v0,5          ## code 5 == read integer
          syscall 
          move   $s0,$v0        ## $s0 = integer value of dog's age
        
          li     $t1, 1         ## $t1 = 1
          li     $t2, 2         ## $t2 = 2
          li     $t3, 5         ## $t3 = 5
        
          beqz   $s0, zero            ## if dog's age == 0, branches to zero
          beq    $s0, $t1, oneOrTwo   ## if dog's age == 1, branches to oneOrTwo
          beq    $s0, $t2, oneOrTwo   ## if dog's age == 2, branches to oneOrTwo
          bgt    $s0, $t2, beyond2    ## if dog's age > 2, branches to beyond2
        
zero:
          li     $s1,14         ## equiv. human age in $s1 = 14
          b      end            ## branches to end


oneOrTwo:
          li     $s1,22         ## equiv. human age in $s1 = 22
          b      end            ## branches to end
          
beyond2:
          li     $s1,22         ## equiv. human age in $s1 > 22
          addi   $s0,$s0,-2     ## amount of addtional years beyond 2
          mult   $s0,$t3        ## $s0 * 5
          mflo   $s0            ## product stored in $s0
          add    $s1,$s1,$s0    ## $s1 = 22 + (($s0-2) *5)
          b      end            ## branches to end

end:  
             
          li     $v0,4          ## code 4 == print string
          la     $a0,humanAge   ## $a0 = constant1
          syscall
        
          li     $v0,1          ## code 1 == print integer
          move   $a0,$s1        ## $a0 = equiv. human age
          syscall

          li     $v0,10         ## code 10 == end program
          syscall               ## program ends

data: 
                  .data 
  
      dogAge:     .asciiz  "Enter the dog's age: "
      humanAge:   .asciiz  "Equivalent human age: "
      
      

## End of file