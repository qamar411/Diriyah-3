# Test for Floating-Point Multiplication
# This test performs floating-point multiplication using RISC-V floating-point instructions.



.section .text
.globl _start

_start:


    # # TEST 1: Floating-Point Negate Multiplication and Addition 
    # li t1, 0xde2fc03e
    # fmv.w.x ft0, t1        
    # li t1, 0xedafc5d2
    # fmv.w.x ft1, t1

    # fnmadd.s fa2, ft0, ft1, ft0, rdn


    # # TEST 2: Floating-Point Negate Multiplication and Addition 
    # li t1, 0x000044b9
    # fmv.w.x ft0, t1        
    # fmv.w.x ft1, x0
    # li t1, 0x800d1f97
    # fmv.w.x ft2, t1
    # fnmadd.s fa2, ft0, ft1, ft2, rup


    # # TEST 2: Floating-Point Negate Multiplication and Addition 
    # li t1, 0xff7fffff
    # fmv.w.x ft0, t1        
    # fmv.w.x ft1, x0
    # fmv.w.x ft2, x0
    # fnmadd.s fa2, ft0, ft1, ft2, rup


    # # TEST 2: Floating-Point Negate Multiplication and Addition 
    # li t1, 0x0027c65a
    # fmv.w.x ft0, t1        
    # fmv.w.x ft2, t1
    # li t1, 0x000d1f97
    # fmv.w.x ft1, t1
    # fnmsub.s fa2, ft0, ft1, ft2, rdn

    # # TEST 2: Floating-Point Negate Multiplication and Addition 
    # li t1, 0x800d1f97
    # fmv.w.x ft0, t1        
    # li t1, 0x3f800000
    # fmv.w.x ft1, t1
    # li t1, 0x000d1f97
    # fmv.w.x ft2, t1
    # nop
    # nop
    # fmsub.s fa2, ft0, ft1, ft2, rtz


    # # TEST 2: Floating-Point Negate Multiplication and Addition 
    # li t1, 0xcf800000
    # fmv.w.x ft0, t1        
    # fmv.w.x ft1, t1
    # fmv.w.x ft2, x0
    # nop
    # nop
    # fnmadd.s fa2, ft0, ft1, ft2, rup


    # # TEST 2: Floating-Point Negate Multiplication and Addition 
    # li t1, 0x7ce508c4
    # fmv.w.x ft0, t1        
    # li t1, 0xce2e5bdcd
    # fmv.w.x ft1, t1
    # fmv.w.x ft2, x0
    # nop
    # nop
    # fnmadd.s fa2, ft0, ft1, ft2, rdn

    # # TEST 2: Floating-Point Negate Multiplication and Addition 
    # fmv.w.x ft0, x0      
    # fmsub.s fa2, ft0, ft1, ft2, rdn


    # # TEST 2: Floating-Point Negate Multiplication and Addition 
    li t1, 0xce2e5bcd
    fmv.w.x ft0, t1        
    fmv.w.x ft2, t1
    li t1, 0x3f800000
    fmv.w.x ft1, t1
    fmsub.s fa2, ft0, ft1, ft2, rne


    nop
    nop
    nop
