.globl main

.data
arr:                    #defining array
    .word   0
    .word   0
    .word   0


.text
main:
    addi sp, sp, -16    #getting stack
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    
    add s0, x0, x0  #initializing all with their base values
    addi s1, x0, 7
    la s2, arr
    addi t3, x0, 3
    
    
    
loop:    
    #implemnting logic
    beq t3, x0, exit
    mul t1, s0, s1
    add t2, s1, t1
  # Calculate the memory address of the index
    slli t1, s0, 2  # Multiply the index by 4
    add t4, s2, t1  # Add the offset to the start of the array

    # Store the value into the array at the calculated index
    sw t2, 0(t4)

 
    # Print the value stored at the current index
    li a7, 4          # Load the code for sys_write into a7
    li a0, 1          # Load the file descriptor for stdout into a0
    lw a1, 0(t4)      # Load the value to print into a1
    li a2, 4          # Load the number of bytes to print into a2 (4 bytes for a word)
    ecall             # Make the system call to print the value

    
    addi s0, s0, 1
    addi t3, t3, -1     #decreasing i because loop runs for 3 times
    jal x0, loop
    

exit:
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    addi sp, sp, 16   #Resetted stack
    ret
    


