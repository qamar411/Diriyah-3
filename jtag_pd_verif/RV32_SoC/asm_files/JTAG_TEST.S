.section .text
# nop
# nop

# rom address
li x17, 0xfffff000

# Load test values
    li t0, 0x3f800000        # 1.0
    li t1, 0x40000000        # 2.0
    li t2, 0x40400000        # 3.0
    li t3, 0x00000000        # 0.0
    li t4, 0x7f800000        # +Inf
    li t5, 0xff800000        # -Inf
    li t6, 0x7fc00000        # NaN
    

    # ========================
    # JTAG linerization test 
    # ========================
    j back_to_fmv
    li a3, 0x00045001        
    add a3,a3,a3
    div a1,a3,a3
    add a2,a3,a3


back_to_fmv:
    # Move to FP registers
    fmv.s.x   f1, t0         # f1 = 1.0
    fmv.s.x   f2, t1         # f2 = 2.0
    fmv.s.x   f3, t2         # f3 = 3.0
    fmv.s.x   f4, t3         # f4 = 0.0
    fmv.s.x   f5, t4         # f5 = +Inf
    fmv.s.x   f6, t5         # f6 = -Inf
    fmv.s.x   f7, t6         # f7 = NaN

    # ========================
    # Test FSQRT.S
    # ========================

    fsqrt.s f10, f1          # sqrt(1.0) = 1.0           # 0x3f800000
    fsqrt.s f11, f2          # sqrt(2.0) = ~1.4142        # 0x3fb504f3
#             jalr x1,x0,16
#             jalr x1,x17,60
            beq t0, x17, back_to_fmv
    fsqrt.s f12, f3          # sqrt(3.0) = ~1.7320        # 0x3fddb3d7
    fsqrt.s f13, f4          # sqrt(0.0) = 0.0            # 0x00000000
    fsqrt.s f14, f5          # sqrt(+Inf) = +Inf          # 0x7f800000
    fsqrt.s f15, f6          # sqrt(-Inf) = NaN           # 0x7fc00000
    fsqrt.s f16, f7          # sqrt(NaN) = NaN            # 0x7fc00000




    fmv.x.s   t1, f0         # sqrt(1.0) = 1.0           # 0x3f800000 
    fmv.x.s   t2, f11         # sqrt(2.0) = ~1.4142        # 0x3fb504f3
    fmv.x.s   t3, f12         # sqrt(3.0) = ~1.7320        # 0x3fddb3d7
    fmv.x.s   t4, f13         # sqrt(0.0) = 0.0            # 0x00000000
    fmv.x.s   t5, f14         # sqrt(+Inf) = +Inf          # 0x7f800000
    fmv.x.s   t6, f15         # sqrt(-Inf) = NaN           # 0x7fc00000
    #ebreak
    # ========================
    # Test FDIV.S
    # ========================

    fdiv.s  f20, f1, f2      # 1.0 / 2.0 = 0.5            # 0x3f000000
    fdiv.s  f21, f2, f1      # 2.0 / 1.0 = 2.0            # 0x40000000
    fdiv.s  f22, f3, f2      # 3.0 / 2.0 = 1.5            # 0x3fc00000
    fdiv.s  f23, f1, f4      # 1.0 / 0.0 = +Inf           # 0x7f800000
    fdiv.s  f24, f4, f1      # 0.0 / 1.0 = 0.0            # 0x00000000
    fdiv.s  f25, f5, f1      # +Inf / 1.0 = +Inf          # 0x7f800000
    fdiv.s  f26, f1, f5      # 1.0 / +Inf = 0.0           # 0x00000000
    fdiv.s  f27, f6, f2      # -Inf / 2.0 = -Inf          # 0xff800000
    fdiv.s  f28, f2, f6      # 2.0 / -Inf = -0.0          # 0x80000000
    fdiv.s  f29, f1, f7      # 1.0 / NaN = NaN            # 0x7fc00000
    fdiv.s  f30, f7, f1      # NaN / 1.0 = NaN            # 0x7fc00000
