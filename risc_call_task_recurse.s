.text              
main:
    la t0, num    #loading number from data
    lw a0, 0(t0)    #num=5
    jal ra,recurse_loop
   
    la a1, result       # Loading address of result from data
    sw a0, 0(a1)        # Storing in result

    addi a1,a0,0         #prinitng factorial
    addi a0,x0,1
    ecall
    addi a1, x0, '\n'   # Load in ascii code for newline
    addi a0, x0, 11
    ecall
    # End of the program
    addi a0,x0, 10
    ecall  
    
    
    
recurse_loop:
    addi sp, sp, -8     #allocating stack
    sw ra, 0(sp)
    mv s0, a0           #pushing num in stack
    sw s0, 4(sp)        #pushing recursively
    
    li t5,1
    
    ble a0,t5, basecase        #(if num<=1)
   
               
    addi a0, a0, -1      #num -1
    jal ra, recurse_loop            #5,4,3,2,1 moving from s0 into stack pointed by sp
  
    lw a2, 4(sp)        # recursively popping from stack
   
    mul a0,a0,a2       # recursively multiplying
    j end               # recursively jumping to end
    
    
basecase:
    li a0,1             # putting 1 if num<=1
    

end:
    lw ra, 0(sp)      #restoring recursively
    addi sp, sp, 8    #restoring 8 one by one bytes to get to our deisred location of pop then pop from there and do multiplication
    jr ra             #ra had the address of the last popped return adress register and in last it goes to main

write_tohost:

    li x1, 1

    sw x1, tohost, t5

    j write_tohost

    
.data 
# start data section here
    num: .word 5
    result: .word 0
# end data section here



.align 12

.section ".tohost","aw",@progbits;                            

.align 4; .global tohost; tohost: .dword 0;                     

.align 4; .global fromhost; fromhost: .dword 0; 



