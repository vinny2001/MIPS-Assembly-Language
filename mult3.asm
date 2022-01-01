#
# CS 254 Program 11
# mult3 subroutine for main method
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
# $v0 = accumilator

      .text
      .globl mult3


mult3:

      multu     $s0, $s1        # x * y
      mflo      $v0             # $v0 = x * y
      multu     $v0, $s2        # x * y * z
      mflo      $v0             # $v0 = (x * y * z)
      jr        $ra             # Jump to return address in main
      nop
      

# End of file
