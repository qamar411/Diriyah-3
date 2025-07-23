    .section .text
    .globl adler32
    .type adler32, @function

// adler32(base,len,mode)
//   a0 = base address (SRAM pointer or flash offset)
//   a1 = length in bytes
//   a2 = mode: 0 = SRAM, 1 = flash via SPI
// returns a0 = 32-bit Adler-32 checksum

adler32:
    addi sp, sp, -24 # creating space for three words ra, s0, s1
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    sw s3, 16(sp)
    sw s4, 20(sp)
    
    # save arguments into saved regs
    mv    s0, a0        # s0 = base pointer/offset
    mv    s1, a1        # s1 = remaining length
    mv    s4, a2        # s4 = mode

    # init sums and modulus
    li    s2, 1         # s2 = A = 1
    li    s3, 0         # s3 = B = 0
    li    s5, 65521     # s5 = MOD_ADLER

    # iff flash mode, issue READ header
    beqz  s4, .Lloop
    call  spiCSDown
    li    a0, 0x03
    call  spiSendGetData
    # send 24-bit address from s0
    srli  a0, s0, 16; call spiSendGetData
    srli  a0, s0,  8; call spiSendGetData
    srli  a0, s0,  0; call spiSendGetData

.Lloop:
    beqz  s1, .Ldone      # done?
    # load next byte into t0
    beqz  s4, .LfromSRAM
    call  spiSendGetData   # flash: byte → a0
    mv    t0, a0
    j     .Lsum

.LfromSRAM:
    lbu    t0, 0(s0)        # SRAM: byte → t0
    addi  s0, s0, 1        # inc pointer

.Lsum:
    # A += t0; if ≥MOD, A-=MOD
    add   s2, s2, t0
    blt   s2, s5, .LnA
    sub   s2, s2, s5
.LnA:
    # B += A; if ≥MOD, B-=MOD
    add   s3, s3, s2
    blt   s3, s5, .LnB
    sub   s3, s3, s5
.LnB:
    addi  s1, s1, -1       # dec length
    j     .Lloop

.Ldone:
    beqz  s4, .Lpack       # if SRAM mode skip CS up
    call  spiCSUp

.Lpack:
    # pack (B<<16)|A into a0
    slli  t0, s3, 16
    or    a0, t0, s2

    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    lw s3, 16(sp)
    lw s4, 20(sp)
    addi sp, sp, 24 # releasing space 
    ret
