# Calculate sums of positive odd and negative even values in an array
#   in MIPS assembly using MARS
# for MYΥ-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 
     
main:
        la         $a0, length       # get address of length to $a0
        lw         $a0, 0($a0)       # get the length in to $a0

        la         $a1, input        # get address of array to $a1

        addiu      $s0, $zero, 0     # sum of positive odd values starts as 0
        addiu      $s1, $zero, 0     # sum of negative even values starts as 0

        ########################################################################
        #  Write your code here
        add        $t0,$zero,$zero
loop:
	beq	   $t9,4,exit
	addi	   $t9,$t9,1
	lw	   $s2,($a1)

        slti	   $t0,$s2,0
        beq	   $t0,1,ngtv
        
	#thetikos arithmos kai elegxoume an einai artios i perittos
	lw	   $s2,4($a1) #pairnoume to deftero noumero apo to array 
			      #to trito einai 4 byte pio dipla omoios kai ta ypoleipa
	
	j loop
	
ngtv:   
	#arnitikos kai elegxoume artios i perittos
	lw	   $s2,4($a1)
	j loop
   	   
        
        # NOTE: Don't print out the results! Automatic testing will get the final
        #  values of $s0, $s1 and check if they are correct
        ########################################################################
        
exit: 
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.
        
        ###############################################################################
        # Data input.
        ###############################################################################
        .data
length: .word 5 # Number of values in the input array
input:  .word 3, -2, 0, 4, -1
