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
    # TEST 1: Floating-Point Multiplication 1.0 * 2.0
    li t1, 0x3f800000  # Load immediate value for `a` (1.0 in IEEE 754)
    fmv.w.x ft0, t1         # Move `a` into floating-point register fa0

    li t1, 0x40000000  # Load immediate value for `b` (2.0 in IEEE 754)
    fmv.w.x ft1, t1         # Move `b` into floating-point register fa1

    # Perform floating-point multiplication
    fmul.s fa0, ft0, ft1    # fa2 = fa0 * fa1

    # TEST 2: Floating-Point Multiplication 
    li t1, 0xab0e8597  # Load immediate value for `a` (1.0 in IEEE 754)
    fmv.w.x ft0, t1         # Move `a` into floating-point register fa0

    li t1, 0x8074de30  # Load immediate value for `b` (2.0 in IEEE 754)
    fmv.w.x ft1, t1         # Move `b` into floating-point register fa1

    # Perform floating-point multiplication
    fmul.s fa1, ft0, ft1    # fa2 = fa0 * fa1


    # Store the result back to memory
    fmv.x.w t2, fa2         # Move result from fa2 to t2
    la t0, result           # Load address of `result`
    sw t2, 0(t0)            # Store result in memory
