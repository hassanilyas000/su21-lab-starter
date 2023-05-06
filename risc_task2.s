.globl main

.data
n: .word 5
    
.text
main:
    addi sp, sp, -48  #getting stack for return address and s0
    sw ra, 0(sp)
    sw s0, 4(sp)
  
  
  
                       
                       #initializing all
    add s0, x0, x0    #i
    
    la t0, n
    lw a0, 0(t0)    #num
    mv t4,a0    #t4=a0
    addi t3, x0, 10     #loop is between 0-9
    
    #a1=t2
    addi t0, sp, 8  # t0 points to start of array on stack
loop:    
    #implemnting logic
   beq s0, t3, endloop   #implemented compare function
   
   jal subt               #jumping to subtract function and coming back
   bge t2, x0, truecom
    addi a2, x0, 0
    sw a2, 0(t0)           # store result in array
     ######                      #printing purpose
    addi a1,a2,0
    addi a0,x0,1
    ecall
    addi a1, x0, '\n'   # Load in ascii code for newline
    addi a0, x0, 11
    ecall
     ######
    addi t0, t0, 4         # increment array pointer
   ######
   addi s0,s0,1        #i++
   j loop
   
truecom:
    addi a2, x0, 1
    sw a2, 0(t0)           # store result in array
  ######
    addi a1,a2,0            #printing purpose
    addi a0,x0,1
    ecall
    addi a1, x0, '\n'   # Load in ascii code for newline
    addi a0, x0, 11
    ecall
    ####
    addi t0, t0, 4         # increment array pointer
    addi s0,s0,1        #i++
    j loop
    
endloop:
    lw ra, 0(sp)     #restoring ra 
    lw s0, 4(sp)    #restoring s0
    addi sp, sp, 48  #removing complete stack
    # Exit the program
    addi a0, x0, 10
    ecall # Exit


subt:
    sub t2, t4, s0    #performing subtaction of num - i
    jr ra             #jumping back
    
