
.globl _start

_start:

    # TEST 1: sqrt (-0)
    li t1, 0x80000000       # Load immediate value for `a` (-0.0 in IEEE 754)
    fmv.w.x ft0, t1         # Move `a` into floating-point register ft0

    fsqrt.s fa0, ft0          # Perform square root on ft0, result in fa0
    fmv.x.w t2, fa0         # Move result from fa0 to t2

