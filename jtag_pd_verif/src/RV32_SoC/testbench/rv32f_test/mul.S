# Test for Floating-Point Multiplication
# This test performs floating-point multiplication using RISC-V floating-point instructions.

.section .data
# Test data
a:      .word 0x3F800000  # 1.0 in IEEE 754
b:      .word 0x40000000  # 2.0 in IEEE 754
result: .word 0x00000000  # Placeholder for the result

.section .text
.globl _start

_start:


    # # TEST 1: Floating-Point Multiplication
    # li t1, 0x13629a7c
    # fmv.w.x ft0, t1                   
    # fmul.s fa2, ft0, ft0, rne


    # # TEST 2: Floating-Point Multiplication
    # li t1, 0x4f72a391
    # fmv.w.x ft0, t1       
    # li t1, 0x3f800000
    # fmv.w.x ft1, t1              
    # fmul.s fa2, ft0, ft1, rne


    # # TEST 3: Floating-Point Multiplication
    # li t1, 0x00000001
    # fmv.w.x ft0, t1       
    # li t1, 0x43f2c920
    # fmv.w.x ft1, t1              
    # fmul.s fa2, ft0, ft1, rne

    # TEST 4: Floating-Point Multiplication (overflow, with rtz)
    # This is Working now 

    # # TEST 5: Floating-Point Multiplication
    # li t1, 0x00000001
    # fmv.w.x ft0, t1       
    # fmul.s fa2, ft0, ft0, rup


    # # TEST 6: Floating-Point Multiplication
    # li t1, 0x80000003
    # fmv.w.x ft0, t1       
    # li t1, 0x8029d04c
    # fmv.w.x ft1, t1              
    # fmul.s fa2, ft0, ft1, rne

    # # TEST 6: Floating-Point Multiplication
    # li t1, 0x82000036
    # fmv.w.x ft0, t1       
    # li t1, 0x885806d9
    # fmv.w.x ft1, t1              
    # fmul.s fa2, ft0, ft1, rne

    # # TEST 7: Floating-Point Multiplication
    # li t1, 0xcefff7e0
    # fmv.w.x ft0, t1       
    # li t1, 0x4f000410
    # fmv.w.x ft1, t1              
    # fmul.s fa2, ft0, ft1, rdn


    # # TEST 8: Floating-Point Multiplication
    # li t1, 0xbf653938
    # fmv.w.x ft0, t1       
    # li t1, 0x00000001
    # fmv.w.x ft1, t1              
    # fmul.s fa2, ft0, ft1, rdn

    # # TEST 9: Floating-Point Multiplication
    # li t1, 0x00040fe4
    # fmv.w.x ft0, t1       
    # li t1, 0x42280000
    # fmv.w.x ft1, t1              
    # fmul.s fa2, ft0, ft1, rdn


    # # TEST 10: Floating-Point Multiplication
    # li t1, 0xca000000
    # fmv.w.x ft0, t1       
    # li t1, 0x80000006
    # fmv.w.x ft1, t1              
    # fmul.s fa2, ft0, ft1, rne

    # # TEST 11: Floating-Point Multiplication
    # li t1, 0xb0c614c6
    # fmv.w.x ft0, t1       
    # li t1, 0x03687b8c
    # fmv.w.x ft1, t1              
    # fmul.s fa2, ft0, ft1, rne

    # # TEST 12: Floating-Point Multiplication
    # li t1, 0x800004ee
    # fmv.w.x ft0, t1       
    # li t1, 0x800004ee
    # fmv.w.x ft1, t1              
    # fmul.s fa2, ft0, ft1, rne


    # # TEST 13: Floating-Point Multiplication
    # li t1, 0x800005aa
    # fmv.w.x ft0, t1       
    # li t1, 0x800005aa
    # fmv.w.x ft1, t1              
    # fmul.s fa2, ft0, ft1, rne

    # # # TEST 14: Floating-Point Multiplication
    # li t1, 0x00000001
    # fmv.w.x ft0, t1       
    # li t1, 0x3f330800
    # fmv.w.x ft1, t1              
    # fmul.s fa2, ft0, ft1, rne


    # # # TEST 15: Floating-Point Multiplication
    # li t1, 0x0124fc94
    # fmv.w.x ft0, t1       
    # li t1, 0x
    # fmv.w.x ft1, t1              
    # fmul.s fa2, ft0, ft1, rne

    nop
    nop
    nop