.globl _start

.equ SPCR,  0x20000200
.equ SPSR,  0x20000204
.equ SPDR,  0x20000208
.equ SPER,  0x2000020c
.equ SPCS,  0x20000210

_start:


    # li t0, SPCR
    # li t2, 0x80
    # sb t2, 0(t0)


    # li t2, 0
    # j . 

    # Initialize SPI
    call spiInit


    li t0, SPDR
    sb a0, 0(t0)   
    li t0, SPDR
    sb a0, 0(t0)  
    li t0, SPDR
    sb a0, 0(t0)    
    li t0, SPDR
    sb a0, 0(t0)  


    # call wait_transfer
    # call wait_transfer
    # call wait_transfer
    # call wait_transfer


    # # Clear Interrupt Flag
    # li t0, SPSR
    # lb t0, 0(t1)
    # ori t0, t0, 0x80
    # sb t0, 0(t1)



    # # disable interrupts
    # li t0, SPCR
    # lbu t1, 0(t0)
    # andi t1, t1, 0x7f # clear the interrupt bit
    # sb  t1, 0(t0)


    # li t0, SPER
    # lbu t1, 0(t0)
    # ori  t1, t1, 0xc0 # force uppoer two bits to one
    # sb t1, 0(t0)


    # li t0, SPDR
    # sb a0, 0(t0)   
    # li t0, SPDR
    # sb a0, 0(t0)  
    # li t0, SPDR
    # sb a0, 0(t0)    
    # li t0, SPDR
    # sb a0, 0(t0)  

end: j end

