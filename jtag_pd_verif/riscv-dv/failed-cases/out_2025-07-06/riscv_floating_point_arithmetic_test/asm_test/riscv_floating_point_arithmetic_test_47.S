.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x16, h0_start
jalr x0, x16, 0
h0_start:
                  li x15, 0x40001120
                  csrw 0x301, x15
kernel_sp:        
                  la x25, kernel_stack_end

trap_vec_init:    
                  la x15, mtvec_handler
                  ori x15, x15, 1
                  csrw 0x305, x15 # MTVEC

mepc_setup:       
                  la x15, init
                  csrw 0x341, x15

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x15, 0x3800
                  csrw 0x300, x15 # MSTATUS
                  li x15, 0x0
                  csrw 0x304, x15 # MIE
                  mret
init:             
                  li x15, 2143289344
                  fmv.w.x f0, x15
                  li x15, 2154515926
                  fmv.w.x f1, x15
                  li x15, 2139095040
                  fmv.w.x f2, x15
                  li x15, 4286578688
                  fmv.w.x f3, x15
                  li x15, 1319868432
                  fmv.w.x f4, x15
                  li x15, 4286578687
                  fmv.w.x f5, x15
                  li x15, 1207722639
                  fmv.w.x f6, x15
                  li x15, 1601508091
                  fmv.w.x f7, x15
                  li x15, 1129205825
                  fmv.w.x f8, x15
                  li x15, 2139095040
                  fmv.w.x f9, x15
                  li x15, 638629504
                  fmv.w.x f10, x15
                  li x15, 4186013
                  fmv.w.x f11, x15
                  li x15, 2153113213
                  fmv.w.x f12, x15
                  li x15, 2147483648
                  fmv.w.x f13, x15
                  li x15, 2139095039
                  fmv.w.x f14, x15
                  li x15, 2139095039
                  fmv.w.x f15, x15
                  li x15, 2155654843
                  fmv.w.x f16, x15
                  li x15, 2139095041
                  fmv.w.x f17, x15
                  li x15, 2147483648
                  fmv.w.x f18, x15
                  li x15, 2139095039
                  fmv.w.x f19, x15
                  li x15, 2690015098
                  fmv.w.x f20, x15
                  li x15, 3090711
                  fmv.w.x f21, x15
                  li x15, 2223909
                  fmv.w.x f22, x15
                  li x15, 2742688589
                  fmv.w.x f23, x15
                  li x15, 2148280393
                  fmv.w.x f24, x15
                  li x15, 2139095040
                  fmv.w.x f25, x15
                  li x15, 4286578688
                  fmv.w.x f26, x15
                  li x15, 2155266205
                  fmv.w.x f27, x15
                  li x15, 2139095039
                  fmv.w.x f28, x15
                  li x15, 0
                  fmv.w.x f29, x15
                  li x15, 6292934
                  fmv.w.x f30, x15
                  li x15, 3957929160
                  fmv.w.x f31, x15
                  fsrmi 0
                  li x0, 0x2
                  li x1, 0x80000000
                  li x2, 0xf703e11e
                  li x3, 0x7
                  li x4, 0x9c53d21
                  li x5, 0x0
                  li x6, 0xfdbe3f6f
                  li x7, 0x38c3cc69
                  li x8, 0x0
                  li x9, 0x5
                  li x10, 0xf0072efc
                  li x11, 0x13738e22
                  li x12, 0x99cea43b
                  li x13, 0xf1d885b6
                  li x14, 0xff7248f8
                  li x15, 0x2c0e6c62
                  li x16, 0xf
                  li x17, 0x0
                  li x18, 0x3
                  li x19, 0x1
                  li x21, 0xff9f295b
                  li x22, 0x565e1fcb
                  li x23, 0x8d41009e
                  li x24, 0x80000000
                  li x26, 0xf4982227
                  li x27, 0x8
                  li x28, 0x80000000
                  li x29, 0xbdc9ae03
                  li x30, 0x9afc0581
                  li x31, 0xf1b30acb
                  la x20, user_stack_end
main:             slt          s8, s4, ra
                  nop
                  fcvt.w.s     t6, ft9, rup
                  fmv.w.x      fa6, zero
                  fsgnjx.s     fs1, fa5, fs7
                  fclass.s     t4, fs9
                  sra          a2, s8, sp
                  mulhsu       t2, a0, a5
                  xori         s10, a3, 1891
                  fmv.x.w      s8, fs7
                  sll          s0, s8, a1
                  srl          t3, t5, s10
                  nop
                  sra          a1, t5, s6
                  xor          s5, s9, s1
                  fdiv.s       ft9, ft9, ft6
                  mulhu        zero, s6, t4
                  fsgnjn.s     fa2, ft5, fs0
                  fclass.s     t0, fs10
                  mulh         zero, s3, s5
                  fsgnj.s      fa2, fs6, fs7
                  xori         s2, t2, 1903
                  fmv.x.w      a7, fa4
                  lui          s7, 787257
                  fcvt.s.wu    fs5, gp
                  fadd.s       ft6, fs11, ft8
                  mulhu        s2, s6, t5
                  fsqrt.s      fs8, ft9
                  or           gp, a0, s6
                  fdiv.s       ft3, fs2, fa5, rtz
                  fmax.s       ft9, fs1, fs1
                  mulhu        zero, gp, s0
                  xor          s3, a1, s11
                  fle.s        a1, fs4, fs6
                  divu         zero, s7, t0
                  addi         a4, a2, -2007
                  fsqrt.s      fs0, ft5, rne
                  sra          a7, s0, s1
                  and          a4, t6, s0
                  div          s5, s2, sp
                  slli         s8, s7, 27
                  sub          t6, zero, sp
                  xor          a3, s10, t2
                  fmax.s       fa5, ft1, ft9
                  fsub.s       ft3, fs5, ft9, rmm
                  sltiu        sp, s2, 429
                  fcvt.s.w     fa7, a2, rne
                  nop
                  sra          s2, t2, sp
                  fle.s        t0, fs2, fs7
                  fmax.s       ft7, fs6, ft2
                  fsub.s       ft8, fs11, fs2, rdn
                  srli         s5, s5, 9
                  srli         zero, s4, 0
                  andi         s8, s6, 1619
                  fle.s        a3, ft2, ft9
                  ori          t2, tp, -477
                  remu         gp, s0, gp
                  fsgnjn.s     ft0, ft6, ft7
                  fle.s        a0, fa0, ft8
                  fcvt.s.w     fs3, s4
                  feq.s        a3, fs10, ft11
                  feq.s        s3, ft9, fs0
                  fsqrt.s      fa3, fa5, rtz
                  fmul.s       fa1, fa5, fa1, rup
                  fle.s        s1, fs1, fs3
                  sll          t0, a0, tp
                  fclass.s     a3, ft4
                  fmv.w.x      fa6, t5
                  fsqrt.s      fs9, fs1, rtz
                  feq.s        a3, fs3, fs7
                  add          s3, tp, s7
                  sub          s3, a3, a6
                  flt.s        t4, ft8, ft4
                  fsgnjx.s     fs10, fs4, fs1
                  mul          t5, s6, t4
                  fmv.w.x      ft5, tp
                  mulh         s8, s1, t3
                  fsgnjx.s     fa6, fs3, fs0
                  sltu         s10, s9, t2
                  remu         t0, s3, t2
                  sub          t1, a3, a4
                  fsgnjn.s     fa2, fa3, ft5
                  fcvt.wu.s    t0, fa6, rne
                  nop
                  fadd.s       fa2, ft3, fa5
                  sra          s6, s10, t2
                  fsqrt.s      fs10, fa1, rup
                  srai         t6, t0, 29
                  xor          s5, t2, sp
                  andi         s2, t3, 59
                  srai         a3, t5, 15
                  fcvt.s.w     fs3, t0
                  fsgnjx.s     ft10, fs3, ft7
                  mulhu        gp, a5, ra
                  addi         t2, s9, 1591
                  fmax.s       ft8, ft5, fs5
                  fsqrt.s      ft2, fa6, rdn
                  sub          tp, a6, t4
                  mul          gp, s0, a6
                  fcvt.wu.s    t1, ft6
                  sra          gp, s5, t1
                  fadd.s       ft6, ft7, fs6, rtz
                  sub          a4, gp, s8
                  fle.s        t6, fs8, ft6
                  fcvt.s.w     fa4, s2
                  xori         s5, s2, 1416
                  fmax.s       fs6, fa4, ft0
                  fmax.s       fs10, fs2, ft1
                  sra          t1, ra, t0
                  sub          s1, s0, s0
                  fcvt.wu.s    t1, fs5, rne
                  divu         t4, s11, s8
                  flt.s        sp, ft11, fs2
                  mulh         a5, a5, t3
                  feq.s        s3, ft0, ft9
                  fadd.s       fa3, fs4, ft0, rmm
                  sub          s10, s8, tp
                  ori          s6, a2, -1570
                  fsqrt.s      ft1, fs10, rtz
                  fcvt.wu.s    s6, fa5, rtz
                  divu         s2, a7, a0
                  lui          t1, 10507
                  xor          gp, sp, a5
                  fcvt.s.w     ft3, t5, rne
                  sub          s11, t5, t3
                  div          a4, ra, s6
                  add          a0, s5, s6
                  srl          t5, t6, ra
                  slli         zero, ra, 18
                  feq.s        s11, fa0, fa3
                  fdiv.s       fs0, fa7, fa5
                  fcvt.wu.s    s3, fs2
                  fdiv.s       fs1, fa7, ft11
                  andi         t2, t4, -138
                  fmul.s       fs5, fs11, ft9
                  sltiu        s6, t1, 1603
                  fdiv.s       fa0, fa6, fa6
                  mul          a0, a0, a4
                  fle.s        t5, fa3, fs2
                  or           s0, t5, s2
                  mulh         t6, s9, ra
                  fmul.s       ft2, ft7, fs0
                  slli         a0, a6, 29
                  fsgnj.s      fs4, ft6, ft4
                  addi         s1, s4, -919
                  rem          ra, s8, ra
                  flt.s        a3, fs6, fs6
                  fsqrt.s      ft0, fs8, rup
                  fdiv.s       fs0, fs10, fa4
                  srli         s11, s3, 10
                  rem          gp, s4, a1
                  div          s11, zero, sp
                  fsgnjx.s     fs3, ft1, fa7
                  fsub.s       fs4, fs8, fa3, rdn
                  fcvt.wu.s    s3, fs2
                  fsgnjx.s     fs2, ft11, fs6
                  fsgnjx.s     fa7, fs1, fa5
                  lui          s1, 8256
                  mulh         sp, s0, a3
                  addi         s8, s6, -1021
                  mulh         t4, t2, zero
                  slli         t2, a1, 27
                  slt          a7, a3, s3
                  sll          t6, t1, ra
                  srli         s6, gp, 9
                  fsqrt.s      fa6, fs9, rmm
                  fmv.w.x      ft1, a0
                  sltu         s2, s9, t0
                  fcvt.s.w     fa0, tp, rne
                  mulhu        a2, tp, s3
                  fsgnj.s      fa3, fa6, fs5
                  fdiv.s       ft2, fa6, ft3
                  fsqrt.s      ft3, fa3
                  sltu         t3, gp, s11
                  auipc        s11, 536063
                  mulhu        s2, t2, s3
                  xor          t4, tp, a6
                  fsub.s       fa3, fa2, fa2
                  rem          tp, a2, a0
                  slti         t5, s0, -579
                  fcvt.w.s     a3, fa5, rmm
                  nop
                  andi         s8, s6, -1864
                  fle.s        a7, fs4, ft4
                  fmax.s       ft9, fa1, ft4
                  fsub.s       fs1, fs9, fs8, rdn
                  mul          a1, s0, a5
                  sub          ra, a5, s0
                  or           s7, gp, a2
                  lui          s6, 345817
                  slt          a1, s5, sp
                  fcvt.s.w     fs4, t3
                  fsqrt.s      fa5, ft9
                  fdiv.s       fs6, fs8, fa6
                  fmul.s       fs9, fs0, ft4, rup
                  fsgnjn.s     ft5, fs8, ft6
                  mulh         s6, a2, a4
                  fle.s        t0, fs6, fs1
                  mulhsu       a3, t4, s7
                  fmax.s       fs1, fs10, ft0
                  fcvt.wu.s    a7, ft3, rdn
                  sltiu        s1, s10, 1026
                  slt          a3, t3, t0
                  fcvt.wu.s    t4, fs6
                  nop
                  fmax.s       fs0, fs3, fs10
                  slli         t0, a1, 15
                  sltiu        gp, s5, 1125
                  sltu         a4, a4, a3
                  slt          a5, a3, a2
                  mul          s0, sp, s2
                  srli         s7, a2, 16
                  fmax.s       ft7, fa7, ft3
                  andi         s5, s7, -854
                  nop
                  div          t5, s6, s10
                  slti         s8, s10, 1227
                  fsqrt.s      ft1, ft2, rdn
                  sltiu        s10, t0, -1712
                  sltiu        gp, s5, -1802
                  auipc        a4, 555544
                  divu         gp, a2, a1
                  fsgnj.s      ft1, ft4, ft10
                  mulhu        t1, a2, s7
                  or           a4, zero, s0
                  slli         t3, ra, 8
                  slt          s1, s7, t6
                  addi         s2, t1, -430
                  ori          s7, s5, -34
                  div          a2, a3, s5
                  fcvt.w.s     s7, fs5
                  xori         t3, s9, 654
                  fcvt.s.w     fs2, t4, rne
                  sll          s8, sp, a5
                  xori         s10, tp, 1503
                  rem          t0, t0, t5
                  fmv.x.w      ra, ft8
                  fsgnj.s      fs8, fa4, fs9
                  fmv.x.w      s2, fs0
                  fsqrt.s      ft7, ft8
                  sll          a2, s9, a3
                  and          s8, a5, a2
                  addi         a2, a6, 581
                  srai         s2, a2, 28
                  fcvt.s.w     ft3, a1, rmm
                  andi         a5, tp, -1430
                  or           gp, s1, t2
                  srai         zero, t4, 29
                  lui          t3, 922966
                  srl          a5, a5, ra
                  fsub.s       fs0, ft1, ft5
                  fmv.w.x      fs5, ra
                  div          t0, t6, s0
                  slti         t4, s1, -320
                  fadd.s       fs10, fs7, ft0
                  sltu         t1, s5, t1
                  slli         s11, t3, 14
                  fsgnj.s      ft0, fa6, fs5
                  remu         a3, s5, t5
                  fdiv.s       fs4, ft10, fs4, rmm
                  fdiv.s       fa0, fs5, ft6, rup
                  slti         a7, t0, 1186
                  fsgnjn.s     ft4, fa7, fs4
                  srli         zero, sp, 20
                  or           s7, a6, s10
                  remu         a1, t6, sp
                  slli         s10, s3, 8
                  xori         t3, a7, 1070
                  and          s8, gp, s1
                  sll          s0, a5, s2
                  ori          tp, tp, 483
                  fcvt.s.w     fa0, a3
                  mul          t2, s9, t2
                  rem          t2, s0, s0
                  auipc        a7, 1033097
                  fle.s        t5, ft4, fa2
                  xori         t1, t0, -699
                  sll          ra, zero, ra
                  fmv.w.x      fs3, a6
                  and          tp, a1, a6
                  srli         t4, t1, 13
                  fsgnjn.s     ft10, ft10, ft4
                  fdiv.s       ft9, fs1, ft5
                  slti         s2, a7, -1963
                  fadd.s       ft2, ft1, fa6
                  sra          s2, s0, s3
                  div          t5, t1, a1
                  fcvt.w.s     s6, ft11, rmm
                  nop
                  fmax.s       ft10, fs0, ft0
                  fmax.s       fs2, ft4, fa3
                  div          t1, s7, s10
                  fsgnjx.s     fa2, ft10, ft10
                  fadd.s       fa5, fa6, ft9
                  add          sp, t6, t5
                  and          gp, s4, s4
                  srai         s3, tp, 24
                  fle.s        tp, ft4, ft4
                  auipc        ra, 777298
                  divu         s0, gp, a0
                  sll          t0, t5, t0
                  or           s1, t6, a1
                  fsqrt.s      ft1, ft2
                  sub          zero, s5, s11
                  fcvt.wu.s    tp, ft0, rne
                  ori          a4, s2, -1865
                  flt.s        s10, fa5, fa1
                  sra          a1, s1, s7
                  slt          t6, sp, s7
                  remu         t1, zero, s7
                  fmv.x.w      ra, fs0
                  sltu         s7, sp, a7
                  fle.s        t2, ft4, fs7
                  sra          a3, a3, a4
                  sub          s10, t5, a6
                  or           t3, ra, a1
                  sll          a4, t0, a0
                  fmin.s       fs2, ft5, fs3
                  sltu         s0, t4, a3
                  or           a2, a1, t4
                  slli         s8, t6, 17
                  lui          s6, 532870
                  srli         a7, t6, 12
                  lui          a3, 339797
                  sltu         sp, t1, s4
                  auipc        a1, 785470
                  fsgnjn.s     fs0, fs4, ft3
                  feq.s        gp, ft4, ft5
                  andi         s10, t4, -1166
                  sub          a0, s8, t6
                  feq.s        a1, ft8, fa3
                  srli         ra, a2, 4
                  xor          a2, s7, ra
                  sra          s1, t6, ra
                  mul          s1, a2, t0
                  andi         a3, t4, 817
                  fmax.s       fa1, ft3, fs4
                  fclass.s     a1, fs6
                  fdiv.s       fs8, fa1, fa6, rne
                  or           t6, a6, t6
                  xor          t3, s9, s7
                  fcvt.w.s     a4, fs5
                  rem          gp, a1, s7
                  fcvt.wu.s    a2, fs3
                  or           t0, ra, s8
                  fcvt.s.w     fs1, a3, rup
                  slti         s6, s6, 251
                  fsqrt.s      fa5, fs0, rup
                  fadd.s       ft8, ft8, fa6, rmm
                  fdiv.s       fa0, fs2, fa3, rup
                  sltiu        a5, t0, 1744
                  and          s1, t5, s10
                  srai         s8, s4, 16
                  ori          s7, ra, -1743
                  fsgnjx.s     ft6, ft4, fs11
                  fadd.s       ft2, fa3, ft4
                  fmax.s       ft9, ft4, fs10
                  div          t5, a6, s1
                  sltu         t3, s5, s3
                  xori         t5, s2, 1892
                  fmv.w.x      fa0, s7
                  fclass.s     gp, fs9
                  fsgnjn.s     fa6, ft3, fa6
                  fdiv.s       fs5, ft4, ft4, rdn
                  fsqrt.s      fa7, fs0, rtz
                  slli         t1, a7, 27
                  and          a7, t5, a0
                  xori         a2, s3, -1289
                  fcvt.w.s     a1, ft3
                  fcvt.w.s     t2, fa3, rup
                  feq.s        t4, fs5, fs8
                  feq.s        s1, fs8, ft8
                  ori          tp, zero, -798
                  fmul.s       ft0, fa1, ft11
                  slt          gp, t5, s4
                  auipc        t6, 88293
                  srai         s3, t3, 15
                  fsgnjx.s     fa5, fs5, fs10
                  fsgnjn.s     ft11, fa1, fa1
                  fsgnj.s      ft1, fs6, fs5
                  fmv.w.x      fs1, t0
                  sll          t0, a3, t4
                  xori         a0, t4, 1033
                  and          a7, t0, a4
                  andi         s10, t1, -1120
                  fclass.s     t5, fa5
                  fle.s        s0, ft6, fs1
                  divu         s1, s5, s7
                  fclass.s     s10, fa1
                  sll          s7, s1, t3
                  slli         t5, s9, 22
                  mul          t3, a7, s8
                  xori         t2, a5, -1975
                  fclass.s     a2, fa1
                  fmv.x.w      ra, ft6
                  rem          a7, a2, zero
                  ori          s1, t5, 1281
                  sll          s10, s8, t5
                  andi         s8, s3, 709
                  sra          t1, a3, t5
                  mulhu        a7, a5, t0
                  fmv.x.w      a7, ft4
                  rem          s6, t6, s10
                  fmv.w.x      fs1, zero
                  fclass.s     s5, ft10
                  divu         a0, s0, s6
                  fcvt.s.wu    ft2, a7
                  divu         s6, t6, s1
                  fcvt.w.s     t3, ft2, rmm
                  fsgnjn.s     ft11, ft2, fa2
                  sub          s8, s2, a1
                  fmin.s       fa1, ft7, fs2
                  mulhsu       t6, gp, s9
                  or           a5, a7, s6
                  fsqrt.s      fa4, fs5, rtz
                  fcvt.w.s     a7, fs0, rmm
                  fsub.s       fs1, fa0, fs6
                  lui          s3, 1002861
                  fmv.x.w      s8, ft9
                  sltu         t0, s8, s1
                  xori         s1, s7, -1677
                  srai         t2, s7, 25
                  fcvt.s.wu    fa7, t5
                  remu         a0, t6, ra
                  sub          t3, s8, a1
                  and          s2, zero, sp
                  and          zero, s1, s8
                  fle.s        s2, fs2, ft0
                  fcvt.s.wu    fa2, t0
                  fle.s        s10, fs4, fs2
                  add          t1, gp, gp
                  fcvt.wu.s    s3, fa4, rtz
                  fmv.w.x      fa0, s1
                  fdiv.s       fa2, fs7, fs3
                  fmv.w.x      ft1, s1
                  srl          tp, a3, a1
                  fmax.s       fa3, fa2, fa2
                  fsqrt.s      fs0, fs4
                  fsqrt.s      fs7, ft5
                  fmin.s       fs8, ft1, fs5
                  ori          t6, a0, 1757
                  feq.s        s1, fa0, fs6
                  div          s2, a0, a0
                  div          a7, s0, a6
                  slli         s11, a3, 20
                  feq.s        a1, ft10, fa3
                  mulhsu       tp, s3, s7
                  fcvt.s.w     ft1, t0, rne
                  divu         s11, s9, a6
                  and          t1, t4, s4
                  ori          s10, a7, -1478
                  divu         s1, zero, t2
                  mulhsu       t3, a5, a3
                  sltu         a3, s5, zero
                  fdiv.s       fa0, fs7, fa0
                  fsgnjn.s     fs9, fs9, ft2
                  fmin.s       fs0, ft0, fs1
                  mulh         a5, s11, a6
                  mulhu        s11, s10, a1
                  fle.s        s3, ft0, fa1
                  flt.s        t4, ft4, fa0
                  fmax.s       fs2, fa6, ft7
                  mulh         sp, a7, s5
                  xori         a4, s5, 286
                  fsgnjx.s     fa6, fs5, fa3
                  sll          a3, a7, a2
                  srli         gp, s9, 29
                  add          a2, s7, a1
                  fsgnjn.s     fs8, ft0, ft0
                  sll          s10, t0, a3
                  or           s2, t1, a1
                  fle.s        t2, fs3, fa6
                  lui          ra, 761892
                  feq.s        s0, ft8, fs0
                  mulhsu       t1, s11, t0
                  ori          t5, s0, -851
                  auipc        a5, 985418
                  sltu         t4, s2, s2
                  fle.s        s6, fa5, fa4
                  fcvt.s.w     fa2, gp
                  fcvt.s.w     fa1, tp
                  fcvt.s.w     fs10, s0, rdn
                  sra          t3, a7, s5
                  sltu         a5, a3, s3
                  xori         s10, t5, -1447
                  fmv.w.x      ft11, a2
                  fmul.s       ft7, ft0, ft11
                  divu         s0, s11, s8
                  nop
                  feq.s        t4, ft5, fs4
                  fmv.w.x      ft8, zero
                  mulhsu       s6, s10, a1
                  sra          s1, s4, s7
                  fle.s        s3, ft9, fs6
                  xori         s10, t0, 6
                  fsgnjn.s     ft0, fa6, fs9
                  nop
                  slti         s11, s2, 1824
                  ori          t4, a6, -358
                  fsgnjx.s     fs9, fs10, ft8
                  fadd.s       fs7, fs1, ft6
                  addi         t4, t6, -482
                  fsgnjx.s     fs8, fs8, fa7
                  fcvt.s.wu    fs5, s8, rup
                  addi         tp, a0, 520
                  auipc        s8, 698506
                  ori          s3, s7, 847
                  add          gp, s5, s2
                  xor          t0, a3, t3
                  fsgnjn.s     fs2, ft11, ft3
                  sub          s8, s2, a2
                  lui          s7, 619849
                  sll          sp, s2, s6
                  sll          s1, tp, t2
                  slti         sp, a6, -1901
                  fmv.w.x      fs7, a4
                  fadd.s       fa2, fa5, fs0
                  sltu         a1, tp, a4
                  divu         s2, s5, a4
                  fcvt.s.wu    fs11, a7, rtz
                  sltiu        t4, a5, 533
                  remu         s7, t5, s9
                  fsgnjn.s     fs9, fa0, fs4
                  fmax.s       ft0, ft1, fs4
                  fsqrt.s      ft3, ft11
                  remu         ra, tp, s11
                  fcvt.s.wu    ft10, s0, rtz
                  fclass.s     s11, fs2
                  fcvt.s.wu    fs5, t3
                  slt          s11, t6, t5
                  fsub.s       fs2, fs8, ft0, rdn
                  fsgnj.s      fs3, fs8, ft1
                  rem          s11, s3, t1
                  fsgnjn.s     fa5, fs2, ft4
                  mulhu        t3, sp, s11
                  remu         s3, gp, a0
                  flt.s        t3, ft1, ft6
                  xori         s10, t6, 1661
                  sltu         a1, t4, a5
                  add          s1, t4, t5
                  div          s1, s7, a7
                  sll          s8, s0, t2
                  sll          tp, tp, a0
                  mul          s2, a7, a7
                  mulhsu       s10, s0, s8
                  fsqrt.s      fa7, ft1
                  sltu         t4, a2, a3
                  div          a2, a5, a2
                  divu         t2, s2, t1
                  slli         t6, t2, 21
                  fcvt.s.w     ft3, s0
                  fcvt.wu.s    a0, ft1, rtz
                  or           s3, t6, t6
                  ori          s6, t0, -1211
                  addi         a4, a0, 1537
                  fsub.s       fs1, ft6, fa3, rmm
                  mulhu        t2, s0, t0
                  lui          t3, 527452
                  remu         s7, s10, a1
                  sltiu        t3, s5, -1966
                  mulh         a7, t2, a7
                  fcvt.wu.s    gp, ft8, rmm
                  mulhu        gp, s2, a0
                  srl          s10, t0, t2
                  fmin.s       fs10, fs2, ft7
                  fmin.s       ft10, ft4, fa2
                  fcvt.wu.s    a5, fs0
                  lui          sp, 84855
                  fcvt.w.s     s2, fa6, rmm
                  fcvt.s.wu    fa0, a7, rdn
                  fsgnjx.s     fs5, fs6, fs0
                  feq.s        s11, ft6, ft8
                  sub          a3, t3, s4
                  divu         zero, a6, s5
                  ori          s10, zero, -1258
                  mul          a1, t3, s8
                  mulhu        t2, t5, s10
                  fcvt.wu.s    zero, fs5
                  slti         s7, s0, -381
                  lui          t6, 842165
                  sub          s11, t2, s3
                  slli         s3, ra, 7
                  fdiv.s       fs3, fs6, fa4, rmm
                  srai         s1, s3, 16
                  rem          t5, sp, s1
                  xor          a2, s8, t2
                  remu         t3, t5, s10
                  divu         s11, a7, s1
                  slti         s3, t1, 1189
                  mulh         a0, tp, a3
                  fsgnj.s      ft10, fa5, fs0
                  and          sp, s0, s6
                  ori          s7, a4, -857
                  srli         a3, zero, 20
                  slti         a1, t5, -730
                  sll          t5, t5, s6
                  feq.s        a0, ft2, fs8
                  divu         s2, a0, t6
                  auipc        ra, 51175
                  fcvt.wu.s    a5, fa2
                  fmax.s       fs8, fs11, fa7
                  fcvt.s.wu    fa3, s2, rup
                  fmin.s       fs10, ft10, fs10
                  fmul.s       fa1, fs6, ft0
                  feq.s        ra, ft7, ft5
                  divu         a4, a4, a0
                  fadd.s       fa1, fa6, fa4, rup
                  slli         t6, s7, 30
                  mul          ra, t3, t1
                  sub          t0, s8, a6
                  sltu         s0, s3, t3
                  fsgnj.s      ft10, fa3, fa7
                  fsqrt.s      fs3, fa0, rdn
                  mul          t1, a3, a0
                  fmin.s       fa2, ft7, fa7
                  fclass.s     a3, fs10
                  andi         a7, t4, -516
                  addi         s0, zero, 1104
                  mulh         s2, a0, a7
                  slli         a0, s10, 3
                  fle.s        zero, fs2, ft1
                  add          s5, a0, s8
                  flt.s        gp, fs11, fs2
                  fdiv.s       fs0, fs7, fs6
                  lui          s3, 670532
                  mulhsu       t3, s4, a3
                  xor          s5, ra, a6
                  fmv.x.w      s6, fs7
                  slti         a0, a7, 1533
                  fle.s        a4, fa1, fa1
                  addi         a5, t4, -1612
                  fadd.s       fs10, ft6, fs0, rup
                  fsqrt.s      ft0, fs9, rup
                  mulhsu       s7, zero, t4
                  andi         s8, t0, -1662
                  andi         s11, ra, -538
                  fle.s        gp, ft9, ft3
                  fmv.w.x      fs0, a6
                  xori         s6, gp, 736
                  mul          s1, ra, s4
                  fclass.s     t4, fs6
                  divu         s8, s6, a0
                  or           t1, a2, t0
                  fmax.s       fa0, fs11, fs6
                  fmv.x.w      s7, fs1
                  lui          s2, 612244
                  srai         s0, s1, 13
                  mulhsu       s3, a2, a7
                  ori          a4, s10, -249
                  andi         t3, a2, 22
                  fmul.s       fs8, fs5, ft1, rdn
                  fclass.s     s11, fa7
                  mul          a4, t4, gp
                  fdiv.s       fa5, fa4, ft2
                  and          s0, s1, a0
                  sra          t5, gp, s11
                  mulhsu       s11, s2, a0
                  xor          zero, s9, t1
                  srl          a2, a5, ra
                  add          s1, t1, t1
                  fdiv.s       ft6, fs9, ft6, rne
                  sll          t0, a0, s5
                  fmv.w.x      fa4, a3
                  mul          s6, t2, s0
                  fsgnj.s      fs9, ft6, fa3
                  srai         s8, s9, 20
                  fsub.s       fa0, fs11, fa2
                  or           a3, s9, gp
                  auipc        s6, 68957
                  fcvt.w.s     gp, fa3
                  fmin.s       fs4, fs2, ft7
                  srl          gp, s8, a2
                  and          t2, a3, a6
                  fcvt.w.s     s8, ft10
                  sra          s7, s8, s2
                  slti         s11, t2, 756
                  srl          t5, s10, a5
                  auipc        tp, 330278
                  fmin.s       fs3, fs8, fa3
                  sll          s8, t1, t4
                  divu         s7, tp, sp
                  fsgnjx.s     fs3, ft11, ft6
                  xor          a1, s1, s6
                  srli         a4, t2, 12
                  add          gp, tp, a5
                  fmv.w.x      fs4, s11
                  mulhsu       s3, t5, a7
                  fcvt.s.wu    ft11, s3
                  mulhsu       zero, t0, a3
                  andi         ra, s8, -1926
                  fsqrt.s      fs11, ft8, rne
                  fsgnj.s      fa1, ft2, fs2
                  srai         gp, zero, 9
                  fle.s        s2, ft2, fa0
                  sltiu        t1, s9, -2018
                  fmv.x.w      s1, ft11
                  fsgnjn.s     fa7, fa0, fa3
                  fmv.w.x      fs5, s11
                  flt.s        a1, ft7, ft2
                  fadd.s       fa2, fs6, ft7
                  fdiv.s       fs8, ft5, fs6, rup
                  fsub.s       ft6, fa7, fs1
                  fsgnjn.s     fa2, fs10, fs0
                  sub          s1, s4, zero
                  mulhsu       t1, gp, t4
                  slt          a3, a4, s7
                  fclass.s     gp, ft11
                  srai         a4, sp, 6
                  ori          s6, t2, 1553
                  div          s7, t3, s8
                  sra          a5, s9, t4
                  sltiu        t6, s7, -144
                  fdiv.s       fa2, ft7, ft2
                  srl          t6, s11, a1
                  fsgnj.s      fs6, fs5, fa1
                  sra          a5, a1, s0
                  sra          tp, zero, s7
                  fcvt.wu.s    t5, ft9
                  fsgnjn.s     ft0, fa1, ft5
                  xor          zero, s0, s6
                  fcvt.w.s     s2, fa5, rdn
                  fcvt.wu.s    s0, fs3
                  fcvt.w.s     a1, ft10
                  mulhsu       a5, s7, a5
                  fclass.s     zero, ft7
                  ori          t1, t3, 272
                  fmax.s       ft8, fs9, fs0
                  fsgnjx.s     ft8, fa6, fs8
                  fcvt.s.w     ft8, a3
                  sra          a1, a0, s8
                  fdiv.s       fa1, ft3, ft1
                  mulh         s10, tp, zero
                  slli         a1, s7, 6
                  fmv.w.x      ft3, s2
                  divu         s0, t5, s1
                  fmul.s       fs1, fa0, ft4
                  xori         a2, s1, 354
                  fsgnj.s      fa2, fs6, fs7
                  srli         t5, tp, 22
                  remu         a2, t1, s9
                  fmv.x.w      s2, ft6
                  sll          a1, s10, a2
                  lui          s0, 461993
                  fsqrt.s      fs8, fs7, rdn
                  divu         s11, s11, s8
                  div          tp, a4, t6
                  fsub.s       fs7, fs0, fs8, rne
                  fle.s        s0, fa4, fs3
                  sltiu        t3, s11, 1619
                  mulhu        s1, a4, t6
                  ori          t2, a2, 143
                  flt.s        t1, fa5, fa7
                  mulh         tp, s9, a2
                  sra          s7, t1, t6
                  fsgnjn.s     fa5, fa7, ft5
                  slt          zero, a5, zero
                  mulhsu       t1, a4, s10
                  sub          t0, s11, t6
                  fcvt.s.wu    fs10, t3, rup
                  or           t1, s11, s9
                  mulhsu       t3, a1, a0
                  remu         s2, s9, a3
                  feq.s        a0, ft11, ft10
                  srai         s3, t5, 27
                  fsgnjx.s     fa5, fs4, fa4
                  srai         s0, a1, 5
                  andi         a2, t1, -1497
                  fsgnj.s      fs3, fa1, ft4
                  fdiv.s       fa0, fs3, fs7, rdn
                  divu         s8, t3, t3
                  mulhsu       ra, s3, s6
                  feq.s        gp, ft2, ft8
                  and          a1, s2, s6
                  remu         t6, s2, tp
                  fsgnj.s      fs5, fs8, fa0
                  flt.s        t4, fs10, fa3
                  remu         a4, s3, t5
                  andi         t4, t1, 885
                  fmin.s       ft6, fs8, fs9
                  div          t6, t4, a5
                  auipc        t3, 617858
                  feq.s        s0, ft9, ft1
                  mulh         a7, a5, t3
                  xor          s1, a2, a1
                  mulh         t1, s5, a2
                  remu         tp, s8, t2
                  fsgnjn.s     fs2, fs7, ft2
                  sltiu        a3, s0, 502
                  feq.s        s11, ft9, ft5
                  mulhu        t0, t6, s1
                  sra          sp, s4, s4
                  slti         t0, zero, -116
                  divu         t6, t6, a4
                  fclass.s     s2, fa0
                  slli         a2, a7, 13
                  fsgnj.s      fs2, fs5, fa0
                  auipc        a2, 399528
                  mulhsu       tp, s8, s8
                  slt          a7, t1, tp
                  fadd.s       ft8, fa1, ft8
                  mulh         a3, s9, a7
                  mul          a1, tp, tp
                  srli         s8, s6, 19
                  fcvt.w.s     a7, ft0, rup
                  fcvt.s.w     ft3, s8
                  mulhu        a2, s5, s5
                  fsgnjx.s     fs8, ft8, ft1
                  xor          s1, s7, t3
                  fmin.s       fa3, fs7, fa2
                  div          s1, ra, s4
                  mul          t0, t2, a1
                  srli         a3, t0, 16
                  fmul.s       ft1, fs2, fa5
                  feq.s        s11, fa5, ft0
                  slt          a7, a6, gp
                  lui          s6, 430082
                  fcvt.wu.s    s10, fs0, rdn
                  andi         t4, t3, 1554
                  fcvt.w.s     a4, fs4
                  lui          t4, 343331
                  fmul.s       fs8, fa4, ft6, rne
                  fcvt.w.s     s2, fa4, rup
                  lui          a0, 498315
                  fmv.w.x      ft8, t3
                  sub          s2, a2, s10
                  xor          t6, s7, a2
                  fadd.s       fs7, ft3, fs1, rtz
                  nop
                  fsub.s       fs6, fs1, fs11
                  fclass.s     a2, fa6
                  flt.s        s7, ft10, ft7
                  div          s1, s11, tp
                  or           gp, a4, t1
                  mul          t6, tp, zero
                  mul          tp, s2, sp
                  srl          ra, s11, s8
                  sub          s5, a7, s5
                  srl          s11, s7, t4
                  feq.s        s10, ft9, ft3
                  ori          t4, t4, 757
                  flt.s        s5, fs7, ft10
                  divu         a4, a1, s0
                  rem          s8, a7, ra
                  srli         s10, zero, 18
                  fcvt.s.w     fa2, a6
                  and          sp, t0, t3
                  xor          a1, t4, t6
                  or           t2, s8, s9
                  sltiu        s8, ra, -923
                  xori         a2, a4, -1784
                  and          s7, t1, s8
                  fsgnjx.s     fs1, ft9, ft9
                  or           sp, t2, s9
                  fmin.s       fs11, fa2, fa5
                  fmax.s       fa3, fs1, fa7
                  fcvt.w.s     s1, ft6, rmm
                  fmv.w.x      fa2, tp
                  slt          s10, s7, s11
                  fcvt.s.wu    fs0, s2, rtz
                  andi         t4, a6, -121
                  or           s7, ra, s1
                  rem          a3, tp, s9
                  add          t4, s9, t5
                  sll          t0, ra, s4
                  andi         s8, a4, -1874
                  fcvt.s.wu    ft0, gp, rup
                  fsgnjn.s     fs11, fa2, fs1
                  xori         s2, s1, 1777
                  divu         sp, t1, s4
                  andi         a0, a7, 1782
                  fcvt.wu.s    s0, ft0
                  mul          t5, t4, a6
                  div          s0, t0, a2
                  fmv.w.x      ft8, t0
                  fsgnjn.s     fs3, fs9, ft8
                  fmax.s       ft10, fs8, ft8
                  mulhsu       t0, a1, t3
                  srai         zero, tp, 0
                  srl          t3, a5, a4
                  slti         a3, s1, -1389
                  fmin.s       fs8, ft11, fs9
                  slti         zero, a1, 722
                  fdiv.s       fs4, ft0, fa1, rdn
                  fle.s        a5, ft0, fs6
                  fcvt.s.w     fs10, a4, rmm
                  and          t6, a5, zero
                  mul          a4, zero, t6
                  fmul.s       fa1, ft2, ft3
                  fsgnjx.s     fa2, ft4, ft7
                  fadd.s       fs11, fs8, fa7
                  fmax.s       ft5, fa7, fs8
                  slli         a7, a2, 13
                  and          a3, t0, t0
                  fcvt.w.s     a7, fa7
                  fsgnj.s      fa0, ft6, ft5
                  fadd.s       fs5, fa4, fa1
                  srai         t4, s8, 14
                  lui          s10, 456170
                  fcvt.s.wu    fs9, s8, rne
                  feq.s        t5, fa7, fa2
                  flt.s        zero, fa1, fs1
                  fcvt.s.wu    ft10, s0, rdn
                  fdiv.s       fa7, fs1, ft0
                  slti         ra, sp, -1699
                  fcvt.s.wu    fa5, sp
                  add          t5, sp, t0
                  remu         a2, zero, gp
                  fcvt.s.wu    ft11, a6
                  fsgnj.s      ft1, ft0, fa5
                  sra          t2, zero, tp
                  ori          a1, s5, 1069
                  div          s10, s11, t4
                  ori          zero, sp, -409
                  sltiu        t2, a2, -1121
                  sll          t0, a6, s0
                  fmv.x.w      a5, fs11
                  xor          tp, a3, a7
                  fmv.w.x      fs9, s9
                  sll          zero, s5, s5
                  srli         a7, a7, 30
                  srai         s0, s11, 16
                  slti         tp, a0, -1595
                  feq.s        s10, fs10, fs11
                  fmv.w.x      ft3, s8
                  feq.s        t1, ft7, fa7
                  divu         a2, a1, s5
                  sra          t5, s1, t6
                  fmax.s       fa7, fs2, fs6
                  fcvt.s.wu    ft1, a0, rtz
                  add          a0, s7, sp
                  slti         t1, s4, 1939
                  ori          a7, s9, -1215
                  srai         t1, ra, 19
                  fadd.s       ft11, fs6, fs3
                  slli         a7, t6, 12
                  slt          t4, a3, t3
                  fclass.s     a5, fs3
                  fsgnjx.s     fs0, fa3, ft4
                  andi         s6, s7, -700
                  sub          a2, zero, tp
                  and          s10, a3, sp
                  mul          t6, t6, a6
                  sltiu        t1, t1, 1741
                  fcvt.w.s     a3, ft10
                  fsqrt.s      ft0, fs9
                  xor          t6, gp, a4
                  fcvt.s.w     fs9, a0, rup
                  andi         s5, t0, -973
                  sltiu        s8, ra, -1083
                  or           a7, s9, t3
                  ori          a7, s3, 1037
                  slt          a2, sp, t6
                  mulhu        tp, t2, tp
                  xor          sp, s8, s6
                  fsgnj.s      fa7, ft9, ft3
                  feq.s        a5, fa4, fs8
                  or           s11, tp, s0
                  sltu         t2, s4, t2
                  fcvt.s.w     ft5, t3
                  fadd.s       fs10, ft0, fs3
                  fsgnj.s      fa2, ft10, fa3
                  sltu         zero, s11, t6
                  fadd.s       fs4, ft1, fa5
                  addi         s0, t0, -1500
                  fmv.w.x      fs5, s2
                  and          s1, s3, a0
                  fsqrt.s      fs6, fs2, rmm
                  fadd.s       fs11, ft0, fa2
                  or           s0, s8, zero
                  andi         gp, s7, -1573
                  addi         s8, a3, 907
                  fmv.x.w      s3, ft7
                  mulhsu       s2, s1, s3
                  xor          a2, t6, s0
                  mulhsu       zero, s2, a1
                  fmax.s       fs0, ft1, ft3
                  sll          s7, t3, s2
                  or           ra, a6, a6
                  fmin.s       fa0, fa2, fs1
                  fsgnjn.s     ft6, fa2, fs10
                  slti         t1, s9, 10
                  mulhu        sp, s3, s8
                  fsgnjn.s     ft2, ft7, ft3
                  rem          t0, a5, sp
                  sltiu        a3, a3, 1934
                  mulhu        sp, a3, sp
                  div          t4, a7, zero
                  fcvt.w.s     t2, fa3
                  fdiv.s       fs4, fs6, fs2
                  fsgnjx.s     fs9, fa7, ft9
                  srl          a2, t0, a3
                  slti         ra, s9, -812
                  addi         gp, s9, -1545
                  fmv.w.x      fs8, s7
                  srli         s3, s11, 2
                  div          gp, s0, a3
                  srai         a3, a6, 10
                  xori         s5, t4, 1164
                  fcvt.wu.s    t4, fa1
                  sll          t6, a2, a2
                  divu         s7, sp, a2
                  slli         s2, s10, 7
                  fmv.x.w      s11, ft4
                  fcvt.s.w     fs0, s1
                  fcvt.s.w     ft7, t3, rup
                  div          a2, s3, a5
                  slt          t5, s5, s2
                  div          s3, a2, s11
                  auipc        t4, 239276
                  add          t1, a3, t1
                  flt.s        t1, ft9, fs7
                  mulhsu       ra, s5, a5
                  addi         t2, gp, 702
                  slt          s10, s3, t0
                  fmax.s       ft7, fa7, fs2
                  fcvt.w.s     s0, fs3
                  or           a5, a0, s4
                  srl          s1, s6, t5
                  mul          s6, a4, s5
                  lui          s0, 253996
                  sra          a4, a3, t1
                  fcvt.w.s     s8, ft10
                  sll          gp, a6, a3
                  ori          s5, s9, -992
                  fle.s        a3, fs8, ft3
                  mul          zero, s0, zero
                  feq.s        s10, ft8, ft3
                  mulhu        sp, a4, ra
                  and          s6, a2, t2
                  fcvt.s.w     ft2, s1, rne
                  nop
                  srai         s5, t6, 16
                  fdiv.s       ft6, fs10, ft9, rmm
                  feq.s        t1, fs11, fa3
                  fsgnjx.s     fa5, fs8, ft6
                  fsgnjx.s     fa4, fs7, fa5
                  sub          s2, s0, s3
                  sltu         t3, s11, ra
                  nop
                  fcvt.w.s     s3, fs6, rdn
                  mulhu        s11, tp, s1
                  or           tp, a0, zero
                  fcvt.s.wu    ft4, a1
                  sltiu        t4, s8, 1371
                  rem          a5, a2, s10
                  fdiv.s       fs8, ft2, fs2, rne
                  srai         s7, s6, 6
                  srli         a2, s2, 23
                  xori         a0, a0, -118
                  fmin.s       fs0, ft8, fs5
                  srl          a7, a5, sp
                  fmul.s       fs3, fa5, ft4, rdn
                  fclass.s     a0, ft4
                  and          t5, a3, sp
                  feq.s        a0, fs11, fs6
                  fmv.w.x      ft0, a1
                  addi         s11, s11, -1756
                  fmul.s       fs0, ft7, fa0
                  remu         sp, a4, t4
                  flt.s        t2, ft4, ft4
                  auipc        t4, 47759
                  and          gp, s4, a3
                  slti         a7, t0, 356
                  addi         s5, a5, -67
                  fadd.s       ft7, fa2, fs3, rne
                  lui          t1, 981041
                  xori         t5, s8, -73
                  fmv.x.w      a5, fa6
                  fcvt.wu.s    t5, fs8
                  fle.s        s6, fs10, ft11
                  fsqrt.s      ft11, ft2, rne
                  remu         t6, gp, s7
                  rem          s10, s0, s9
                  fsgnjx.s     fs0, fa2, fa7
                  srl          sp, s4, gp
                  rem          a5, s2, t0
                  fcvt.w.s     s6, fs9
                  addi         s10, s4, -322
                  remu         s0, s1, t2
                  sub          s7, s4, s2
                  rem          s2, a2, s0
                  fmul.s       fs8, fs6, ft10, rdn
                  fdiv.s       fs1, ft8, ft2, rne
                  mulh         s7, a3, a4
                  sll          a5, t4, zero
                  slt          s6, t4, gp
                  mulhsu       ra, s0, a4
                  fadd.s       ft4, fs1, fs1, rtz
                  auipc        sp, 101905
                  mulhu        a0, s3, t4
                  fmax.s       fs11, ft0, ft5
                  srl          a2, s2, ra
                  srli         a4, t2, 26
                  slli         s8, t3, 15
                  fle.s        a1, ft9, ft7
                  auipc        t3, 971746
                  fmul.s       fs7, fa5, ft8
                  fdiv.s       ft4, fs6, fs11, rdn
                  fmv.w.x      ft7, a4
                  auipc        sp, 162005
                  fcvt.w.s     s5, ft9
                  fsgnj.s      ft9, fs2, fa7
                  addi         s1, a7, -1744
                  sltiu        s8, sp, 1114
                  fmax.s       fs11, fs4, ft0
                  xor          tp, tp, t3
                  mulh         t6, s1, a3
                  remu         s3, zero, t6
                  fmv.x.w      sp, fa1
                  fle.s        s10, fs6, fa1
                  fsub.s       fa0, fs0, fa4, rup
                  addi         gp, s9, -499
                  fsgnjx.s     fs4, fs7, ft1
                  slli         s11, t5, 20
                  or           tp, a4, a4
                  slt          s7, s3, s10
                  slti         t5, a1, -903
                  fsgnjn.s     fa6, ft2, fs1
                  slt          t2, t2, s8
                  flt.s        s10, fs4, fa4
                  slli         s5, a2, 30
                  andi         s10, a7, 229
                  lui          a7, 62705
                  flt.s        zero, ft11, fs3
                  xori         t5, a7, 196
                  divu         s5, t0, tp
                  fadd.s       fa1, ft5, fa0, rdn
                  mulhsu       zero, a3, t6
                  slli         s8, a0, 20
                  rem          s6, s1, t5
                  fmv.w.x      fa4, s3
                  remu         a5, s0, a6
                  fdiv.s       ft11, ft4, fa2
                  div          t3, t3, t2
                  fcvt.w.s     gp, fs2, rmm
                  fmin.s       fs7, fa4, fs1
                  fcvt.s.wu    fs7, a6, rtz
                  fcvt.s.wu    ft6, a5, rup
                  fclass.s     t4, fs10
                  fsgnjn.s     ft8, ft4, fs8
                  fmul.s       ft7, ft10, fs6
                  mulhu        s6, s11, t2
                  sub          zero, s6, s0
                  sltiu        t3, s2, 975
                  div          t0, gp, s2
                  flt.s        t6, ft8, ft7
                  fcvt.s.wu    fa3, t5, rtz
                  fmv.x.w      s10, ft4
                  xori         a4, a5, 521
                  fsqrt.s      ft1, fa3
                  xor          s7, t1, a2
                  sub          a4, t2, t6
                  slti         s7, s5, 1383
                  sra          t3, a3, t2
                  fmv.x.w      s8, fs4
                  fsub.s       fa6, ft4, ft4, rmm
                  fsqrt.s      fs8, ft11, rne
                  sub          zero, s3, t2
                  nop
                  fmv.w.x      fs3, a1
                  nop
                  div          a2, a7, t5
                  mul          t4, sp, s7
                  and          t2, a5, a7
                  mulhu        s1, s1, s2
                  fsub.s       fs11, fa2, fa3, rup
                  fmv.x.w      zero, ft7
                  slli         s10, zero, 1
                  add          s2, s2, zero
                  fmv.x.w      s2, fa2
                  andi         t5, zero, 1724
                  slti         zero, a2, 851
                  remu         gp, s3, t3
                  fcvt.wu.s    a3, fa7
                  or           t3, sp, s5
                  slti         s8, s9, -1517
                  sll          sp, sp, s5
                  xori         s8, s0, -398
                  sub          t4, s5, a7
                  addi         s11, a1, -894
                  or           sp, s9, s8
                  fmv.x.w      zero, fa1
                  ori          a3, s1, -1937
                  ori          a3, s8, -861
                  slt          a0, t2, s10
                  auipc        sp, 503382
                  remu         s1, sp, a7
                  feq.s        t6, ft2, fs0
                  fdiv.s       ft3, ft11, fa5
                  or           s7, s10, s8
                  slt          tp, s2, a4
                  fsqrt.s      ft11, ft5
                  srl          tp, s2, s6
                  mulhsu       a5, s2, s0
                  slli         t1, s4, 19
                  sltu         a2, tp, zero
                  rem          sp, zero, a0
                  slti         zero, a1, -545
                  fcvt.wu.s    t3, ft3
                  slt          a0, a4, s8
                  fle.s        a5, ft8, ft1
                  mulh         s0, tp, a0
                  fcvt.w.s     s6, fs7
                  or           t1, a5, a0
                  fsub.s       fa5, fs11, fs1, rdn
                  fsgnjn.s     fs1, fa2, ft3
                  flt.s        t2, ft0, ft10
                  ori          a7, a4, -1185
                  xori         s5, t1, 480
                  mulh         t2, s10, tp
                  div          tp, a7, s6
                  fcvt.s.wu    fs6, sp
                  fmin.s       ft3, ft6, fa3
                  sltiu        t6, s4, 660
                  mulhsu       s11, a0, s8
                  fsgnjx.s     fs7, fa1, ft6
                  srai         tp, t3, 0
                  mulhu        t5, s3, s0
                  auipc        s1, 428435
                  srl          gp, a7, a1
                  auipc        t1, 876561
                  lui          a1, 683477
                  fcvt.wu.s    t3, fs0, rup
                  nop
                  slti         t0, sp, 617
                  fsqrt.s      fs5, fa3
                  rem          t6, t1, ra
                  fle.s        s0, ft10, fs9
                  srl          a1, a1, a7
                  slli         tp, a4, 13
                  srl          t0, t6, s4
                  divu         a1, s7, sp
                  ori          sp, t5, 179
                  srl          gp, tp, a2
                  andi         t0, a0, -537
                  fcvt.wu.s    s2, ft2, rtz
                  fsgnjx.s     ft6, ft4, fa6
                  fmv.x.w      tp, fs8
                  fcvt.s.w     ft2, s0
                  lui          s10, 60894
                  sll          tp, s7, a0
                  fmin.s       ft2, fa4, ft4
                  fdiv.s       ft2, ft6, ft5
                  slti         zero, a1, -1833
                  fsqrt.s      ft1, fa6, rne
                  srai         a5, s2, 22
                  fmv.x.w      s3, fs7
                  divu         t3, a6, s1
                  rem          s6, a3, s10
                  add          s11, ra, s9
                  divu         a7, t3, t0
                  nop
                  fle.s        s10, fs5, fs11
                  fmax.s       ft0, ft4, fs7
                  remu         t5, a1, t4
                  mulhu        t5, a5, s0
                  sltu         a0, s5, t4
                  remu         t4, ra, s5
                  sltu         s0, sp, s2
                  srai         gp, a3, 15
                  rem          a4, s11, t4
                  fmin.s       fa6, fa7, fs11
                  fsgnjn.s     fs2, fs8, ft3
                  andi         s5, a6, 909
                  addi         s3, s0, -168
                  mulhu        s11, t5, s1
                  fclass.s     s7, fs8
                  fsgnj.s      ft0, fa3, fs1
                  and          s5, s0, a1
                  xori         a3, sp, 1790
                  slli         s1, t0, 12
                  xori         s0, s11, -1985
                  sltu         a7, t2, a4
                  sub          s1, s9, a0
                  fsqrt.s      ft9, fa3
                  xori         a1, a4, -363
                  add          s10, a7, s9
                  divu         ra, s4, ra
                  sra          t1, t5, t6
                  fcvt.wu.s    t6, fs8, rmm
                  mulhsu       t1, s8, a0
                  mulhsu       s8, s5, tp
                  mul          a2, s10, a5
                  mulhu        ra, sp, t5
                  slti         s0, t5, 1948
                  xori         a4, tp, -1188
                  lui          s10, 673265
                  fmul.s       fa5, fs5, fa5
                  fmul.s       ft8, ft8, ft5
                  addi         t5, s8, 1575
                  fmv.x.w      s10, fa1
                  fadd.s       fs4, ft7, fs6, rmm
                  slli         s0, t3, 23
                  and          t3, a0, t3
                  fadd.s       fs4, fs0, fa0
                  lui          s3, 494409
                  xori         t2, s4, 1790
                  fmin.s       ft5, fs8, fs9
                  remu         t1, s4, a4
                  slt          t3, t1, s10
                  mulh         gp, ra, tp
                  mulhu        s1, a6, a1
                  mulhsu       a7, tp, t2
                  fle.s        s6, fa4, fa3
                  remu         t4, a6, a2
                  feq.s        tp, fa0, ft3
                  srli         t2, a0, 5
                  xor          a2, s4, s2
                  andi         a0, t3, -671
                  andi         s8, s8, 1135
                  rem          a7, s9, a4
                  fsgnjn.s     fs3, fs3, ft6
                  fmin.s       ft5, ft7, ft7
                  remu         s2, t3, t1
                  srai         s5, s10, 12
                  slt          a5, s0, s7
                  fmul.s       fa6, ft9, fs1
                  fcvt.s.wu    fs10, t5
                  lui          t3, 944576
                  fdiv.s       fs1, fs1, fs5, rup
                  add          t5, ra, a2
                  srai         t1, t1, 26
                  fmv.x.w      tp, fs10
                  div          s8, a6, s8
                  mulhsu       s7, t3, t5
                  sub          s7, s8, a0
                  fle.s        t6, fs4, fa5
                  mulhsu       t3, sp, a2
                  andi         t0, s2, 480
                  fle.s        s7, fa0, ft8
                  remu         t3, s5, t5
                  fmax.s       fs2, ft2, ft7
                  fsub.s       fs3, fs1, fa5
                  sra          tp, s1, sp
                  fcvt.wu.s    sp, ft1, rne
                  fcvt.s.w     fs8, t1, rmm
                  fsgnjx.s     fa5, fs4, fa5
                  fsub.s       ft1, fa0, fs8
                  div          t0, ra, a5
                  fsqrt.s      ft11, ft1
                  fcvt.wu.s    t4, ft10, rtz
                  fcvt.s.wu    fa2, tp
                  or           a0, s4, s8
                  or           a1, ra, s2
                  rem          s3, t6, s3
                  fmax.s       fs8, ft8, fs0
                  fsgnj.s      ft10, ft3, fs4
                  xori         t1, a3, -445
                  fmin.s       fa2, fs2, fa2
                  sra          s10, s9, s3
                  sra          s8, t1, a2
                  addi         s1, a2, 1730
                  fdiv.s       fs1, fa1, ft5, rup
                  fmv.w.x      fs8, a5
                  nop
                  fsub.s       fs5, ft3, fa7, rne
                  and          t2, sp, t4
                  fdiv.s       ft7, ft8, ft0, rup
                  and          zero, zero, a5
                  fsqrt.s      fs5, fs1
                  fcvt.s.wu    fa6, s4, rtz
                  fclass.s     s3, fs3
                  mul          s1, s0, s8
                  sltu         t2, tp, s3
                  fmv.w.x      fs7, t1
                  srl          t2, s2, t1
                  xori         a3, t1, 1520
                  mulhu        s2, s7, a4
                  div          a5, s2, s6
                  xori         s0, s9, 744
                  fcvt.s.wu    fa0, tp
                  fcvt.s.w     fs5, a1
                  fle.s        t0, fa1, fs10
                  srai         s5, t5, 17
                  fmv.w.x      ft2, s5
                  slt          s8, a1, t4
                  divu         t3, a0, s9
                  fcvt.w.s     t3, fs2, rdn
                  fmax.s       fs10, fs7, fs5
                  sub          s3, t1, t3
                  mulhu        a1, s1, s11
                  fadd.s       fa3, fa0, ft0
                  auipc        t6, 758901
                  and          t6, s6, a0
                  slti         s7, s2, 1350
                  fcvt.s.w     fs1, s1, rdn
                  flt.s        s7, fs11, fa2
                  sltu         s11, s8, t3
                  nop
                  feq.s        gp, fs0, fs1
                  fsgnjx.s     fa2, fs7, ft8
                  or           ra, s5, a7
                  fdiv.s       ft0, fs1, fs9, rmm
                  srli         ra, t3, 4
                  sra          t4, s10, ra
                  mul          t5, sp, t3
                  fmv.x.w      t6, ft9
                  fdiv.s       ft11, fs3, fa6, rtz
                  xor          sp, s2, gp
                  fmv.w.x      fs4, s7
                  auipc        a4, 759647
                  add          s2, t2, t4
                  fcvt.wu.s    t1, fs3, rne
                  fcvt.s.w     fs4, s4, rne
                  srl          a5, a7, s7
                  mulhsu       gp, s4, s5
                  add          a3, a4, s7
                  fmv.w.x      fs10, t3
                  fcvt.wu.s    a7, fs5
                  sub          t6, s10, s11
                  fcvt.w.s     t6, fs9, rdn
                  sll          s11, ra, s1
                  or           s10, s6, s3
                  div          ra, a2, s6
                  sra          s2, a4, a4
                  fcvt.s.wu    fa5, a2, rdn
                  sub          t2, s5, zero
                  add          s1, a0, s11
                  fcvt.s.wu    fs9, a4, rne
                  fsqrt.s      ft4, fs2
                  divu         gp, t1, s2
                  xor          t1, a7, t1
                  fdiv.s       fs11, fa0, fs6, rmm
                  div          s10, ra, s11
                  sub          s11, a1, zero
                  mul          a3, s10, s9
                  fsqrt.s      fs9, fs2, rup
                  srai         t5, s8, 15
                  fmv.x.w      t6, ft2
                  ori          s10, s4, 1412
                  fmv.x.w      a5, ft4
                  addi         a7, a6, -80
                  mul          s7, a5, s2
                  andi         s3, a2, 265
                  nop
                  sll          a3, s8, s8
                  sltiu        a4, a7, 550
                  rem          t1, s9, a2
                  sll          t6, a2, t5
                  sll          s3, s4, a1
                  divu         tp, a1, s7
                  sll          sp, t5, s3
                  fmin.s       fa7, fs4, ft5
                  sll          a5, s10, t3
                  add          s3, s9, t1
                  fsgnjx.s     fs2, ft8, fa2
                  mulhsu       s8, s11, a0
                  and          ra, s8, a1
                  andi         s6, s2, -1648
                  slti         s2, s3, 1393
                  fsqrt.s      ft10, fs8, rtz
                  slt          s0, s5, a1
                  addi         t3, s3, -1472
                  fsqrt.s      fa1, fs4
                  fcvt.s.w     ft2, a6, rmm
                  fsgnjn.s     fs0, ft4, ft10
                  slli         a7, s6, 31
                  andi         s2, t4, 268
                  and          tp, ra, t5
                  fmv.x.w      s3, ft10
                  div          sp, s7, t4
                  remu         ra, zero, a5
                  rem          a1, zero, a2
                  fmv.x.w      s1, ft6
                  fsqrt.s      fs5, fs9
                  nop
                  fle.s        t3, fs7, fs4
                  flt.s        t0, ft10, ft5
                  fdiv.s       ft10, ft4, ft3
                  xor          s6, a4, t3
                  xor          t3, s8, t2
                  fmin.s       ft5, ft2, ft11
                  fle.s        s10, fs11, ft3
                  fmin.s       fa7, fs1, ft0
                  add          t2, s4, t1
                  sltu         a7, a0, zero
                  add          s6, a1, t6
                  fcvt.s.w     ft1, t1, rdn
                  srai         a5, t0, 10
                  mulhsu       a0, sp, t1
                  fmv.w.x      fa3, s10
                  fsgnj.s      fs8, ft10, fs3
                  fsqrt.s      fs10, fs9, rne
                  nop
                  div          s8, t0, gp
                  fsqrt.s      ft1, fs2, rup
                  and          t2, a7, s1
                  mulh         zero, s3, t6
                  fdiv.s       fs6, fs6, fs4
                  sll          t2, t6, zero
                  srl          s3, a5, a2
                  slt          ra, a1, zero
                  fsgnjn.s     ft1, ft11, ft2
                  fmul.s       fa2, fs8, fa7
                  addi         s10, t3, -1588
                  srai         s10, s3, 6
                  fclass.s     a5, fs4
                  rem          s2, s9, s8
                  fmul.s       fa1, fs7, ft8, rup
                  fclass.s     a3, ft9
                  fclass.s     t6, ft8
                  fmv.w.x      fa2, s7
                  feq.s        a1, fs9, ft0
                  sub          a3, t3, a2
                  auipc        s7, 724817
                  div          s11, s5, a5
                  mulh         a7, s4, s6
                  xori         tp, s5, -625
                  ori          s2, t5, -1089
                  fmax.s       fs7, ft6, ft5
                  srl          t1, a2, t5
                  sll          tp, t0, a5
                  sub          a3, gp, a0
                  srl          sp, t2, s0
                  fsub.s       ft0, fs6, fa4
                  fsgnjn.s     fa2, fs11, fs6
                  remu         s10, t5, zero
                  remu         a3, gp, t6
                  srl          s11, tp, s9
                  fle.s        t2, ft6, ft4
                  fmin.s       fs11, ft0, fs2
                  remu         a3, s2, gp
                  andi         s5, t2, 1595
                  fmax.s       fa7, fs0, fs11
                  srli         s3, t5, 30
                  xori         t4, a6, -405
                  rem          a2, s9, s2
                  fcvt.w.s     t5, fa2, rup
                  fadd.s       fa0, ft3, fs2
                  ori          tp, s10, -144
                  fsub.s       ft10, ft10, fa1
                  slli         tp, t0, 13
                  fsub.s       fs10, fa6, fs10, rdn
                  div          t3, s3, a0
                  fclass.s     a2, fs10
                  fcvt.s.w     fa5, s2
                  divu         a3, tp, s2
                  fdiv.s       fs2, fs7, ft3
                  mulh         t1, s3, s10
                  fsgnjx.s     ft1, fs3, fa1
                  fsub.s       fa0, fa7, ft11, rdn
                  fmin.s       fs2, fs2, fa3
                  ori          s5, t2, -1711
                  srli         t0, t3, 23
                  fcvt.s.wu    ft11, s5
                  slli         t3, t2, 14
                  sll          t6, s4, t2
                  or           s0, s7, s9
                  addi         t4, zero, 617
                  fclass.s     s5, fs8
                  div          t3, s11, s10
                  slti         t5, s10, 381
                  srli         zero, t1, 5
                  fsgnjx.s     fa0, fa3, fs6
                  auipc        t0, 342257
                  nop
                  sltu         s5, s11, s8
                  fsgnjx.s     ft1, fa2, fa5
                  remu         s6, zero, a1
                  remu         t2, s6, a1
                  fcvt.wu.s    a0, ft9
                  sltiu        s3, t0, -21
                  ori          a0, s4, 652
                  or           a0, s8, s10
                  sltiu        t1, t6, 713
                  fmul.s       fs3, fs0, fs11, rup
                  fmax.s       fs10, fs3, ft10
                  fsgnj.s      fs8, fa6, ft3
                  fmin.s       ft2, ft3, fa2
                  fcvt.s.w     fs6, t5, rdn
                  sra          tp, s11, a6
                  slli         s10, s4, 25
                  feq.s        t1, ft0, fa7
                  srl          s11, ra, s8
                  slt          t2, a6, a1
                  auipc        s11, 835243
                  srai         s1, t4, 11
                  feq.s        tp, ft6, fa4
                  fadd.s       fa4, fa3, ft5
                  xori         s6, a6, -1013
                  fmv.x.w      sp, fs6
                  fcvt.s.w     fs10, s11, rtz
                  mulh         t3, s9, t1
                  flt.s        s11, ft11, fa0
                  slt          a5, t4, s5
                  slli         t5, t3, 18
                  srai         s6, s4, 30
                  rem          s0, gp, a7
                  feq.s        s2, fs10, fs3
                  fmin.s       fa0, ft5, fa4
                  add          t2, s10, t5
                  addi         s1, zero, 1951
                  flt.s        s5, fs11, fs8
                  sltu         a4, t1, t0
                  flt.s        a7, ft7, fs1
                  mulhu        s10, t6, a3
                  and          zero, t0, s6
                  and          a4, sp, s4
                  fmax.s       fa4, fa0, fs6
                  fclass.s     t2, fs7
                  sub          a4, a7, a3
                  rem          t4, t5, a0
                  slli         t2, gp, 1
                  div          gp, a7, t6
                  auipc        t5, 406676
                  slti         t4, t0, 1046
                  fcvt.s.w     fs1, a6
                  xor          a0, sp, a6
                  fmv.x.w      t4, fa7
                  sltiu        s7, s9, -390
                  fsgnjn.s     ft4, ft8, ft10
                  fmax.s       ft10, fa2, fa4
                  sll          s7, a7, a4
                  sub          t6, a7, a7
                  sll          s3, s5, t3
                  fcvt.wu.s    s3, fs5
                  mulhu        a5, tp, s4
                  ori          s11, s5, 480
                  fcvt.s.wu    fs9, sp
                  auipc        s7, 412259
                  fclass.s     t2, fa0
                  fmul.s       fs8, fs1, ft9, rne
                  xor          t6, t6, s9
                  fmv.w.x      fa1, s5
                  fclass.s     t1, ft4
                  auipc        t2, 764162
                  sltiu        s5, t1, 256
                  fcvt.wu.s    s6, ft9
                  fmin.s       fs5, fa1, fa0
                  fmin.s       ft0, fs5, ft8
                  andi         tp, a6, 168
                  mulhsu       t0, ra, zero
                  sra          a1, t0, s10
                  or           sp, a1, t4
                  addi         s7, s2, -579
                  feq.s        t6, fs9, ft2
                  fadd.s       ft1, fs8, fs10, rmm
                  srai         s3, ra, 16
                  feq.s        t0, ft10, ft9
                  fcvt.s.w     fs10, t3
                  feq.s        sp, ft4, fs8
                  div          t6, s10, s6
                  sltu         a5, t0, a7
                  or           t3, s11, a3
                  addi         sp, s7, -1898
                  fcvt.s.wu    fs4, a2
                  feq.s        a4, fs7, ft5
                  slli         s5, t1, 21
                  fsgnj.s      ft6, fa0, fs9
                  auipc        a4, 475145
                  fmv.x.w      t0, ft9
                  nop
                  fmin.s       ft6, ft2, fs5
                  divu         s1, t3, s9
                  ori          t2, a4, 328
                  sra          a0, a6, s2
                  mulh         a5, s9, s3
                  and          a5, a1, ra
                  fmv.w.x      fa7, a5
                  lui          ra, 165542
                  feq.s        t2, ft10, ft4
                  fadd.s       fa5, ft9, ft0
                  fmv.x.w      zero, fs3
                  fclass.s     tp, fs5
                  or           t6, a3, t5
                  fsqrt.s      fs11, fs7
                  fcvt.s.wu    fs11, s11, rne
                  mulh         sp, s7, s3
                  fmv.w.x      ft10, s4
                  fmv.w.x      fa3, s0
                  fsgnj.s      fs1, fs7, ft6
                  and          s6, gp, t1
                  sltu         a1, a2, a4
                  sll          s0, a5, s5
                  fle.s        a2, fa4, fs8
                  sll          s2, s2, s4
                  sltiu        s1, sp, 1593
                  fmv.w.x      ft8, s5
                  sltiu        a3, tp, 411
                  slli         s11, s11, 16
                  sra          zero, a6, s5
                  or           s2, tp, a3
                  andi         s6, a0, 1203
                  fle.s        ra, fs3, ft11
                  divu         s3, t2, s7
                  fmv.w.x      fa4, t1
                  flt.s        a1, fa4, ft8
                  srai         t2, s1, 1
                  flt.s        s6, ft11, ft9
                  addi         a3, a4, 647
                  nop
                  sltiu        a3, a5, -1674
                  xori         s11, s8, -623
                  srai         s0, ra, 10
                  slti         t5, s6, 1979
                  sub          s3, t3, a6
                  fmul.s       ft3, ft11, ft6, rdn
                  fmv.x.w      t2, ft9
                  fmin.s       ft3, ft2, fs1
                  sub          t6, s2, a1
                  remu         t3, a0, t2
                  srai         a1, s6, 16
                  fdiv.s       ft1, fs8, fs6
                  divu         t3, gp, s4
                  slli         a4, a4, 3
                  xori         t6, s4, -153
                  slt          ra, zero, s0
                  div          a3, t5, t2
                  mulhsu       s3, t4, gp
                  mulhsu       tp, a4, tp
                  fdiv.s       ft6, ft0, fs10, rmm
                  srli         t2, t0, 23
                  sub          s6, s6, t4
                  xor          s6, s9, t2
                  remu         s5, a2, s2
                  fcvt.wu.s    s0, fs1, rtz
                  xor          s2, s1, s8
                  slt          t1, sp, t4
                  srai         ra, tp, 8
                  and          zero, s11, t1
                  sra          t5, a4, t3
                  fmv.x.w      a5, ft6
                  fmv.x.w      t1, fa1
                  srli         ra, a7, 19
                  fsgnjn.s     fs10, fs0, ft1
                  auipc        a3, 952771
                  ori          t4, s3, -1260
                  lui          s2, 1001170
                  divu         zero, t0, s5
                  lui          s11, 155660
                  andi         sp, s10, 1826
                  fcvt.s.wu    fs11, gp, rup
                  slt          s5, s10, t0
                  srl          a5, sp, s8
                  ori          zero, s0, -1910
                  srl          s2, s4, t4
                  fmin.s       ft11, ft4, ft3
                  fcvt.s.w     fa5, s4
                  feq.s        a4, ft9, fs1
                  slli         a2, a5, 8
                  slli         s8, s8, 31
                  sra          a3, a4, s3
                  fsgnjn.s     ft0, fs1, ft7
                  and          s2, s5, s7
                  fmv.x.w      tp, fs11
                  fmax.s       fs1, fs9, ft7
                  fcvt.w.s     a2, ft0
                  srli         gp, a7, 23
                  srl          zero, a4, t6
                  ori          s6, t2, 332
                  fcvt.w.s     a5, fa5, rtz
                  fcvt.w.s     s5, ft10, rmm
                  fcvt.w.s     t1, ft11
                  sra          s1, t1, gp
                  mul          sp, s0, a3
                  sltu         t5, t2, sp
                  fcvt.s.w     fs5, a6
                  sra          a5, s6, s9
                  auipc        t5, 138358
                  sll          gp, a6, t0
                  xor          a5, t0, s5
                  fsgnjx.s     fs9, fs1, fs7
                  fsgnj.s      fa4, fa2, ft6
                  fsub.s       fs1, fs2, fa7
                  auipc        s3, 100513
                  lui          a0, 550562
                  fcvt.wu.s    s8, fs4, rne
                  mulhsu       s2, zero, s2
                  fmin.s       fs7, fa1, fs4
                  fdiv.s       fs11, ft2, fs8
                  add          a1, s4, a0
                  slti         zero, a1, 1020
                  sub          tp, s8, s8
                  xor          ra, gp, t4
                  and          s2, ra, a1
                  fdiv.s       fs11, fa2, fs0
                  fcvt.w.s     a0, ft9
                  lui          tp, 550762
                  xori         s3, zero, 12
                  divu         tp, a7, s11
                  sra          t0, a0, a4
                  fsub.s       ft10, ft1, ft5
                  sra          tp, ra, s5
                  ori          s0, sp, -755
                  fcvt.wu.s    a4, ft9
                  div          gp, gp, gp
                  auipc        t0, 262504
                  fle.s        gp, fs0, fs2
                  divu         t5, a2, a3
                  fmin.s       fs10, fs1, ft4
                  fsgnjx.s     fa1, fa5, ft9
                  div          s7, ra, s3
                  sltu         s3, zero, a2
                  fcvt.s.w     fa3, a1
                  fmv.w.x      fa6, a4
                  divu         s11, a1, s3
                  fcvt.wu.s    s11, fa6, rdn
                  sub          s5, s8, t4
                  fdiv.s       ft6, fa5, fs5
                  srli         s11, zero, 21
                  fcvt.s.w     fs4, t4, rup
                  fmin.s       ft11, fs1, ft7
                  fmv.x.w      a3, ft5
                  fclass.s     s10, ft7
                  fsqrt.s      fa2, fs0
                  fle.s        s8, ft9, ft4
                  fmin.s       fs11, fa0, fa1
                  fcvt.s.wu    ft11, a0, rmm
                  fcvt.w.s     a0, fs9, rdn
                  fadd.s       fs4, fa1, ft11, rne
                  remu         a2, a4, t6
                  slli         a1, s10, 8
                  nop
                  fcvt.s.w     fa6, t3
                  slli         tp, gp, 0
                  or           zero, t4, sp
                  fmul.s       fa6, ft5, fs3, rup
                  flt.s        t2, fs11, fs10
                  fcvt.s.w     fs9, a6, rtz
                  fcvt.s.wu    ft7, s4
                  mulh         s1, t5, a5
                  divu         a1, s10, t1
                  sltu         s10, sp, s6
                  slt          sp, s5, t3
                  sra          s0, s4, s3
                  andi         a3, s7, 1846
                  and          t2, s4, s0
                  slt          s10, ra, t2
                  div          t6, a0, ra
                  ori          t6, a7, -767
                  fmin.s       fs11, fs6, ft6
                  ori          t1, a0, -1728
                  fclass.s     a3, ft2
                  mul          a7, zero, a6
                  and          sp, a3, a6
                  fmax.s       ft9, fa5, fs5
                  fcvt.w.s     sp, fa2
                  flt.s        t6, ft10, ft2
                  fmul.s       ft3, ft8, fs10
                  mul          a3, t6, s5
                  addi         t3, s6, 721
                  fcvt.wu.s    s11, fa7
                  xor          s7, a6, a0
                  fmv.w.x      fs2, t0
                  mulh         t6, a4, a5
                  andi         t1, s8, -1268
                  mul          a2, a0, t2
                  auipc        a4, 395883
                  div          a4, zero, s7
                  fcvt.wu.s    s7, fs11
                  fdiv.s       fs2, fs1, fs7, rtz
                  sltiu        a1, a5, -690
                  ori          sp, ra, -1442
                  fcvt.w.s     tp, fa7, rtz
                  fmv.x.w      s5, fs3
                  ori          t5, s9, -509
                  flt.s        t6, ft11, fs6
                  auipc        s3, 212698
                  sll          a4, s5, t6
                  fmv.x.w      a4, fa0
                  addi         s7, t4, 1968
                  xor          s7, sp, s7
                  fcvt.wu.s    s7, fa6
                  fadd.s       fs5, fa4, fs7, rmm
                  sll          a1, a6, s2
                  fsqrt.s      fs0, ft4
                  or           a5, zero, s4
                  andi         zero, a3, 414
                  fclass.s     t3, fs3
                  add          a5, zero, a2
                  fclass.s     s3, fs5
                  fadd.s       ft9, ft4, ft3, rdn
                  and          t2, a5, t4
                  fmv.w.x      fa6, s4
                  srli         s8, a6, 10
                  fmv.w.x      ft7, s2
                  nop
                  slt          a7, a5, a2
                  rem          t3, a6, s4
                  fmin.s       ft5, fa5, ft9
                  nop
                  fcvt.s.w     fs2, t0, rmm
                  fmul.s       fa0, fs3, ft1
                  slt          sp, t3, s7
                  lui          a4, 615332
                  sltiu        t3, t2, 922
                  fmul.s       ft0, ft8, ft5, rup
                  fcvt.s.wu    fa0, t3
                  feq.s        a2, ft8, fa4
                  fmv.w.x      fs3, tp
                  sltu         s11, s8, a0
                  fsgnj.s      fa2, fs3, ft11
                  srai         a2, t2, 29
                  sltu         s7, s10, s5
                  fsgnjn.s     fa1, fs2, fs11
                  sub          s11, t3, t0
                  sltu         s5, a1, gp
                  slt          t2, t0, t4
                  fmin.s       fa4, fa4, fa7
                  fcvt.s.wu    fa5, a5
                  mulhsu       zero, t1, a0
                  fdiv.s       fa4, ft4, fs4
                  fdiv.s       fs6, fa0, ft9
                  fclass.s     s7, fs7
                  nop
                  xor          s7, s11, a1
                  fsgnjx.s     fs4, fs1, fs10
                  xor          a4, a0, t2
                  srli         a4, s6, 11
                  divu         t4, zero, t3
                  mulhsu       t0, s10, t1
                  nop
                  rem          t0, gp, s9
                  or           s11, sp, s11
                  andi         s10, a7, -1279
                  sll          zero, a2, tp
                  fcvt.s.w     fs4, a1
                  fsgnjx.s     fa5, ft0, fa5
                  fmv.x.w      s5, ft3
                  fcvt.w.s     a0, fa7
                  fadd.s       fs3, ft11, ft8, rmm
                  srli         t6, a1, 16
                  mulhsu       a1, s11, sp
                  slt          a2, t1, sp
                  xor          a1, a3, s0
                  fmul.s       fa6, ft0, fs0, rne
                  xor          s7, a6, s2
                  fcvt.s.wu    fa7, gp, rdn
                  fsqrt.s      fs3, fs2, rup
                  fadd.s       fs10, fs2, fs8, rne
                  fle.s        t4, ft0, fs9
                  nop
                  ori          s11, s3, 1049
                  srl          a3, s7, sp
                  sltiu        gp, s7, 1275
                  remu         s10, s4, t6
                  lui          a0, 144614
                  divu         t6, t3, s1
                  sll          ra, s9, sp
                  andi         s5, a1, 1860
                  fclass.s     tp, fa1
                  fsgnj.s      ft1, fa1, ft4
                  sub          t4, a1, a1
                  fadd.s       ft3, fs11, ft10
                  xori         s5, a4, 1966
                  mul          a2, sp, s8
                  sll          s10, s9, tp
                  xori         a0, zero, -383
                  sra          sp, t1, a5
                  fsgnj.s      ft7, ft2, ft9
                  fcvt.w.s     s2, ft11, rmm
                  fcvt.s.w     fa5, s4
                  sra          s6, t3, s7
                  div          s5, a3, gp
                  fcvt.w.s     t4, ft10
                  mulhsu       t6, a7, s10
                  feq.s        t1, fs3, fs5
                  ori          s5, a0, 1490
                  xor          s2, s9, zero
                  slli         s0, s10, 1
                  xor          t6, s4, tp
                  addi         s1, sp, 1136
                  mul          a5, a6, a5
                  fsgnjn.s     fs10, ft2, ft4
                  sub          ra, s2, s10
                  fsub.s       fa6, ft3, ft11
                  mulh         sp, t1, t3
                  fsqrt.s      ft6, ft0, rup
                  addi         a3, a5, 1451
                  srai         a7, s2, 12
                  fsgnjn.s     fa6, fs7, ft8
                  fadd.s       ft3, fs1, ft11
                  or           t6, s9, s7
                  flt.s        a7, fs10, fs9
                  mulhu        s3, a2, s9
                  srl          a7, t4, s3
                  remu         t2, t1, s0
                  srai         a0, tp, 25
                  lui          a0, 71667
                  fcvt.s.wu    fa2, a1, rdn
                  ori          t5, s10, -1479
                  mulhu        sp, sp, s2
                  mulh         gp, s11, s0
                  fclass.s     t4, fs10
                  xori         a3, t1, -1981
                  fmin.s       fs7, ft5, ft2
                  mulh         a0, a7, a6
                  lui          t0, 207826
                  fsgnj.s      fa7, ft5, ft5
                  fsqrt.s      ft7, fa4
                  fdiv.s       ft11, fa6, fs2
                  fsub.s       ft10, fa7, fs8, rmm
                  mulh         s2, t6, s3
                  fcvt.w.s     t1, fs2, rup
                  fmv.x.w      a4, fs6
                  fsgnj.s      fs5, ft5, fs2
                  sltiu        t4, zero, -1224
                  sub          t2, a2, gp
                  nop
                  rem          s6, s10, s2
                  fmul.s       fa6, fa3, ft1
                  addi         a7, s0, -1040
                  fsgnj.s      fs2, ft8, fa2
                  feq.s        t6, fs7, ft1
                  sub          ra, zero, ra
                  fsub.s       ft6, fs0, fs2
                  fcvt.s.w     ft6, t1
                  fsub.s       fs9, fa7, fs1
                  fcvt.w.s     s1, fa3, rtz
                  flt.s        t1, ft3, fa1
                  xor          t3, t0, s5
                  sltu         t6, s0, s11
                  mulhu        t5, s6, zero
                  srai         s1, a5, 3
                  fsub.s       fs7, ft0, fs3
                  div          tp, a6, s1
                  fdiv.s       fa6, fs8, fs0
                  sltiu        gp, s9, 1268
                  srli         a3, a2, 4
                  fmv.x.w      s8, fs10
                  slt          a2, t3, t2
                  flt.s        a2, fa6, ft7
                  fle.s        ra, fa6, fs1
                  fadd.s       ft6, fs0, fa7, rup
                  and          s7, t6, a2
                  add          t0, t3, s8
                  fmin.s       fs1, fs0, fs3
                  ori          a7, s6, -1368
                  sltu         zero, s0, zero
                  remu         t3, a5, t2
                  fcvt.s.w     ft3, s0
                  fsub.s       ft7, ft8, fs6
                  divu         a7, s8, t4
                  fmv.x.w      t1, ft7
                  fsgnj.s      ft1, fs4, fs6
                  srli         s2, ra, 25
                  add          t2, s7, s6
                  or           a2, a7, t6
                  addi         t6, s5, 1722
                  fcvt.w.s     sp, fs7
                  fcvt.s.w     ft10, s3, rdn
                  fsub.s       ft0, fa3, fs5
                  fmv.x.w      t0, ft8
                  or           s5, t2, s5
                  sltiu        a1, t6, -447
                  andi         a2, s8, -1973
                  addi         s11, t4, -869
                  slt          t5, s8, s3
                  mulhu        s7, sp, t2
                  fcvt.s.w     ft5, ra, rtz
                  srl          tp, s9, s4
                  sltu         s8, t6, s5
                  fsgnj.s      fs10, fs3, ft6
                  auipc        t5, 247649
                  fcvt.wu.s    a4, ft8
                  nop
                  fsqrt.s      fa6, ft4, rdn
                  fsqrt.s      ft8, fa4
                  remu         t2, s1, tp
                  ori          sp, zero, 1927
                  sll          t3, t3, s7
                  nop
                  fcvt.s.wu    fa0, s11
                  ori          a1, tp, 666
                  flt.s        tp, fs4, fs10
                  sub          s2, t4, t1
                  or           a2, a3, a5
                  mulhu        s10, a5, s5
                  ori          t3, t6, -1029
                  fsgnj.s      ft11, fs0, fs11
                  fcvt.s.w     ft2, tp
                  xor          s6, s11, a1
                  srl          s8, s4, s11
                  fsub.s       fa7, fa5, fs10
                  mulh         s8, s0, s1
                  srl          t6, t6, s1
                  mulh         t3, a0, s7
                  addi         a0, a2, 1346
                  fmv.w.x      ft5, t3
                  slt          a3, sp, t6
                  divu         tp, t6, a0
                  mulhsu       s0, a3, s4
                  sra          s3, a6, a4
                  fsgnjn.s     fs7, fa1, ft5
                  fle.s        t2, fs8, fs9
                  fmv.w.x      ft1, t4
                  or           a5, a1, t0
                  fmv.x.w      t3, fs3
                  fsqrt.s      ft2, fs7, rup
                  slli         s2, sp, 16
                  fmv.x.w      tp, fs3
                  sub          s10, zero, s6
                  fsgnjn.s     fs1, fs6, ft0
                  add          a5, s9, s4
                  remu         s6, t1, t4
                  ori          s11, s8, 141
                  and          a7, s4, t5
                  slti         s3, tp, -899
                  mulhu        t0, t5, s6
                  feq.s        t1, fs10, fa7
                  fdiv.s       ft6, ft6, fa3, rmm
                  sll          a5, s0, s4
                  fcvt.wu.s    s2, ft0, rup
                  divu         s8, s1, a7
                  rem          a0, a4, s1
                  or           gp, t2, s4
                  fsgnjn.s     fs10, ft11, fa3
                  fcvt.w.s     a2, fs2
                  fmv.x.w      t5, fa2
                  fmv.w.x      fa7, s5
                  sub          t2, t6, t1
                  sll          t3, t3, a0
                  srli         s8, s9, 13
                  xori         s1, t6, 1535
                  mul          gp, a4, s9
                  fsub.s       fa4, ft10, ft8, rtz
                  mulhsu       t1, s7, a5
                  feq.s        s0, fa1, fs0
                  srl          s7, s1, t0
                  fsqrt.s      ft4, fs9
                  flt.s        zero, fs5, fa0
                  flt.s        zero, ft1, fs3
                  feq.s        s3, ft1, fs1
                  andi         zero, s3, 328
                  or           s10, s2, t2
                  fcvt.w.s     sp, ft11
                  xori         a0, t1, 1076
                  addi         ra, s2, -1831
                  fclass.s     s11, fa6
                  fsgnjx.s     fs7, fs2, fa6
                  addi         a5, t0, -830
                  mul          a3, s0, a2
                  fcvt.s.wu    ft6, s6, rdn
                  srli         tp, t0, 13
                  xori         a7, s2, 1391
                  fsqrt.s      ft5, fs6, rne
                  fsub.s       ft8, fs9, fs9
                  fcvt.s.wu    ft4, s9, rdn
                  andi         t0, s2, 2022
                  sll          t0, t3, gp
                  andi         t2, s4, 1772
                  fcvt.wu.s    s6, fs0, rup
                  remu         a0, s10, t4
                  fmax.s       ft0, ft0, ft6
                  feq.s        t3, fa3, fs1
                  fsgnj.s      ft4, ft6, fa1
                  lui          a7, 363111
                  remu         s3, s11, t2
                  sll          a4, s4, s10
                  fmv.w.x      fs6, s3
                  srl          s11, tp, t5
                  fcvt.w.s     ra, ft0, rup
                  fcvt.w.s     s1, ft2, rmm
                  fmax.s       fs9, fa1, ft4
                  fcvt.w.s     s0, fs7, rup
                  sra          a0, a6, t1
                  fcvt.w.s     tp, fa2
                  lui          a1, 856911
                  div          t3, a7, s8
                  fmv.w.x      ft5, a4
                  divu         s11, a4, t2
                  divu         ra, sp, a3
                  or           ra, a6, t2
                  ori          a5, a4, -1389
                  xor          zero, t3, a2
                  flt.s        zero, fa2, fa4
                  fsgnjx.s     fs3, fs0, fa5
                  sltu         t1, t3, s1
                  fmv.w.x      ft4, s5
                  sll          a5, a7, a7
                  fclass.s     tp, ft10
                  and          s7, a3, t1
                  fcvt.s.wu    fs7, a2
                  slti         s3, t5, -837
                  mulhu        sp, a2, a1
                  fcvt.wu.s    sp, fs7
                  mulhsu       s8, a7, a3
                  srl          t2, tp, gp
                  and          a4, s3, s2
                  ori          t1, a1, -229
                  slti         ra, s9, -686
                  fcvt.w.s     s3, ft7
                  xori         s10, s10, 1293
                  fle.s        t2, ft3, fa4
                  mulhu        s11, s2, a2
                  fdiv.s       fs0, ft7, fs3
                  xor          a4, s9, s8
                  srli         t1, tp, 22
                  nop
                  ori          s10, s11, -1107
                  fsgnjx.s     fs6, fs4, ft0
                  srai         ra, t6, 29
                  fdiv.s       fs7, ft1, fa3, rne
                  srai         t6, t1, 26
                  fmv.x.w      s8, fa5
                  or           s1, s10, s3
                  xori         s11, s10, 419
                  feq.s        s10, ft0, ft1
                  srai         t2, sp, 4
                  fcvt.wu.s    t2, fs4, rne
                  divu         s0, s0, s11
                  fcvt.s.wu    ft1, a0, rup
                  srai         gp, tp, 26
                  nop
                  fdiv.s       fs11, ft6, fs2, rmm
                  sltu         a5, t4, a4
                  fclass.s     a4, ft4
                  fsgnjx.s     fs8, ft1, ft8
                  lui          zero, 221434
                  slti         s8, a6, 1388
                  mulhsu       sp, a6, s9
                  fmv.w.x      ft5, gp
                  mul          a0, a3, s10
                  nop
                  fcvt.s.w     fs7, a2, rup
                  fmv.w.x      ft9, t2
                  rem          a2, sp, gp
                  fsgnjn.s     ft4, fs6, ft4
                  fmul.s       fs8, fs11, ft7, rdn
                  slti         a3, t0, -474
                  srl          a1, s5, s5
                  fclass.s     s8, fs7
                  fdiv.s       ft4, fs3, ft5
                  slt          s1, sp, s3
                  xori         s5, sp, -1914
                  ori          tp, a2, -589
                  fle.s        zero, fs11, fs3
                  fle.s        a7, fa5, fs5
                  srl          s2, t5, a3
                  slt          t6, a5, t2
                  fmv.w.x      fs10, a2
                  rem          zero, ra, s7
                  or           a0, s6, s7
                  fmax.s       ft11, ft7, fs11
                  srai         t6, tp, 24
                  fsgnjn.s     ft0, ft7, fa3
                  flt.s        s8, fa4, ft4
                  fdiv.s       ft11, ft1, ft1, rmm
                  fle.s        t2, fa3, fs11
                  mul          a4, s11, a0
                  nop
                  sll          s8, ra, t6
                  add          gp, a7, s4
                  fclass.s     t1, fa3
                  fmv.x.w      s1, fs0
                  fadd.s       ft8, ft8, ft0
                  mulhu        a2, a2, s10
                  mulh         a0, s7, s11
                  slli         s7, a4, 19
                  or           t0, t1, s3
                  srai         a3, s1, 21
                  slli         s10, t2, 5
                  fmv.x.w      s0, fa7
                  fclass.s     t3, fa6
                  fmul.s       fs3, fs8, fa5
                  lui          a1, 379739
                  lui          t0, 911228
                  fmul.s       fa2, fa6, fa3, rtz
                  feq.s        t6, ft11, fs11
                  fmv.x.w      t3, fa6
                  andi         a5, ra, -886
                  fle.s        tp, ft5, fs1
                  fsgnjx.s     fs3, fa5, ft7
                  fclass.s     s3, fa3
                  fadd.s       ft10, fs1, fa5
                  fmax.s       ft8, fs11, fs5
                  or           t2, t6, a0
                  fmax.s       fs10, fs10, fs9
                  nop
                  mulhu        t0, s10, sp
                  and          s3, s2, s0
                  fmul.s       ft4, ft11, ft4, rtz
                  auipc        t6, 937255
                  fsqrt.s      fs8, ft3
                  srli         s2, t2, 6
                  div          gp, s6, s2
                  fmv.x.w      t3, fa5
                  srl          s11, a3, s8
                  add          a3, a4, a6
                  fsgnjn.s     ft7, fa3, fa0
                  fsub.s       fs9, fa1, fs10
                  lui          a4, 624477
                  fclass.s     a5, fa0
                  fclass.s     s6, fs3
                  or           s8, a4, s3
                  srli         a1, a2, 31
                  remu         zero, gp, s7
                  xor          t1, s7, s1
                  andi         t0, s7, 885
                  fclass.s     sp, fs5
                  fcvt.s.w     ft6, a6, rmm
                  ori          s3, a1, -1910
                  remu         s5, s8, s5
                  lui          s2, 224946
                  sltiu        s0, s10, -1386
                  divu         s6, a4, s9
                  fsgnjx.s     fa3, ft7, fa6
                  flt.s        s7, fa1, ft4
                  fadd.s       fa2, fa0, fa3, rtz
                  sub          s7, s4, t6
                  fcvt.w.s     s5, fa2
                  fsgnjx.s     ft8, ft7, fa5
                  ori          t4, a7, 578
                  fsqrt.s      fa7, fa5, rup
                  divu         s1, a6, tp
                  slti         t1, a6, 1313
                  sra          t0, s7, a1
                  mulhsu       a7, s0, a7
                  mulh         s10, t5, a3
                  fadd.s       fs10, ft7, fa2
                  div          s7, ra, s5
                  nop
                  fle.s        s10, ft7, ft1
                  fmv.x.w      t4, ft11
                  and          s11, s4, t3
                  flt.s        t0, fa3, fs0
                  fsgnj.s      fa7, fs6, fa2
                  div          tp, s11, a2
                  and          s3, a0, a7
                  andi         a7, t6, 1750
                  mulhsu       a5, zero, a5
                  remu         t0, t5, s2
                  fsub.s       fs10, fs4, ft9
                  sltiu        sp, s3, -237
                  fcvt.w.s     s11, fa1
                  fdiv.s       ft10, ft11, fa5, rne
                  div          s11, t3, s6
                  auipc        s0, 656859
                  fmv.x.w      s1, fs7
                  fclass.s     a2, ft4
                  add          s0, s1, t2
                  srl          a2, t2, t5
                  add          t5, a3, s1
                  fsgnjx.s     fs3, fs10, fa0
                  lui          a4, 876284
                  add          s7, s11, t1
                  ori          a7, tp, -645
                  sltu         s1, gp, sp
                  ori          zero, s9, -108
                  fsqrt.s      ft9, fa1, rtz
                  mulhsu       t4, t4, a6
                  sra          gp, gp, s4
                  sra          a5, t0, s2
                  fadd.s       ft10, fs10, ft0
                  lui          gp, 700352
                  rem          t2, a2, t6
                  add          s8, t0, sp
                  sltu         a1, t2, s0
                  fcvt.s.wu    fa3, s1, rne
                  fmv.x.w      s10, ft5
                  fmv.x.w      a2, ft4
                  fle.s        sp, fa4, fs2
                  fadd.s       ft5, ft9, fa6
                  fclass.s     ra, fa2
                  fsub.s       fs10, ft2, fs2
                  fcvt.s.wu    fs7, t4, rtz
                  andi         a7, t4, 108
                  fmax.s       fs0, ft10, ft3
                  nop
                  mulh         t1, s4, a2
                  divu         s0, tp, s9
                  mulh         s6, s6, a6
                  feq.s        t5, ft5, fa7
                  fmv.w.x      fs11, t6
                  srai         zero, a6, 6
                  divu         a2, s9, t2
                  fmul.s       ft7, fs10, fs0, rtz
                  andi         t0, t6, -451
                  sub          ra, s9, a4
                  fcvt.s.w     ft9, s10, rdn
                  mulh         a2, s11, a1
                  xori         t0, tp, -1549
                  fmin.s       fa5, fa0, fs8
                  slti         s11, a6, -804
                  add          a7, sp, tp
                  addi         s8, t0, -61
                  add          s8, s0, t2
                  fsgnjx.s     fa7, ft7, fs7
                  fmin.s       fa5, ft8, ft7
                  divu         t1, a7, s1
                  div          s5, s1, t6
                  fmv.w.x      ft3, t4
                  slt          t1, a5, t1
                  fmul.s       ft10, fs3, fs10, rmm
                  fmul.s       fa4, fs7, fs3, rtz
                  slt          t3, sp, a3
                  fsgnjx.s     fa1, ft7, fa4
                  fsgnjn.s     fs11, ft3, ft5
                  srli         sp, t5, 1
                  fmv.w.x      fs0, s0
                  ori          s5, t0, -1701
                  fmul.s       ft0, ft9, fa7
                  xor          a7, a1, tp
                  fmv.w.x      ft11, zero
                  srl          t5, zero, a4
                  auipc        t2, 564440
                  xori         a0, a3, 437
                  mulhsu       t3, zero, t6
                  auipc        t4, 74478
                  addi         sp, s0, -1160
                  fsgnjn.s     fa5, fs0, fa7
                  srli         t1, s4, 28
                  slt          t6, t5, s1
                  fclass.s     a5, fa6
                  and          sp, a1, t5
                  sltu         a7, s3, s9
                  srai         ra, s1, 27
                  sub          s0, t4, s11
                  sra          s0, a1, t2
                  slt          t4, tp, s3
                  xor          s3, gp, tp
                  fmv.w.x      fs7, t6
                  fdiv.s       fs10, fs11, ft7, rdn
                  or           s7, a1, s10
                  fcvt.s.w     fa7, tp
                  fclass.s     s8, ft3
                  sub          sp, gp, zero
                  nop
                  nop
                  fsgnj.s      fs7, fa6, fa0
                  fmv.x.w      t6, fa0
                  ori          sp, a4, -387
                  slli         s0, a1, 12
                  fsgnjn.s     ft5, ft10, fs8
                  or           tp, a6, s6
                  auipc        t3, 337755
                  srai         s0, t3, 24
                  addi         a5, s5, 1580
                  srai         s7, a4, 13
                  fmin.s       fa3, fs10, fs4
                  div          gp, a6, t4
                  lui          a3, 72455
                  mulh         s0, ra, t5
                  divu         s3, a1, a5
                  sll          a5, t4, s3
                  slt          zero, s1, ra
                  fsqrt.s      ft2, fa7
                  fcvt.wu.s    a0, fa5
                  auipc        a5, 912040
                  andi         s1, t2, -517
                  add          t5, gp, s6
                  mul          sp, t1, a3
                  sub          s0, t3, s4
                  sltiu        s5, t4, 436
                  fclass.s     ra, fa5
                  sll          s3, t4, s8
                  divu         a3, s10, s9
                  fdiv.s       fs5, fs2, fs7, rne
                  sltiu        sp, t5, -1468
                  srli         t1, s5, 4
                  div          a7, a1, tp
                  sra          a0, a1, s9
                  xori         s10, t6, -2037
                  fcvt.s.w     fa0, s8, rne
                  mul          sp, a5, a5
                  xori         t3, s6, 164
                  add          s8, s1, a4
                  andi         s7, a2, 79
                  fcvt.s.w     fa3, a4, rdn
                  mulhsu       s7, sp, t6
                  fmul.s       ft5, fs2, fs11, rup
                  xori         a3, s3, 1391
                  fsgnjn.s     ft11, fs11, fs4
                  fmul.s       fs11, ft0, fa6, rtz
                  mulh         tp, s0, a4
                  fsub.s       fa4, fa3, fa5
                  rem          a5, t4, s0
                  srl          s0, t0, s2
                  ori          s3, a6, 56
                  sll          t6, s5, s5
                  remu         t0, s7, s1
                  slt          a1, a6, zero
                  rem          a2, a3, s8
                  addi         s3, tp, -1655
                  fsqrt.s      fs3, fa2, rtz
                  fmv.x.w      t1, fa1
                  fmv.x.w      tp, ft9
                  fsqrt.s      ft4, fs11
                  remu         t0, s1, gp
                  ori          gp, a6, -651
                  fsgnjn.s     fa5, fs9, fa7
                  fle.s        zero, fa5, fa4
                  and          a7, a7, a7
                  fmv.w.x      fa1, gp
                  sltiu        t1, a3, 930
                  and          s6, a0, t0
                  fmin.s       ft3, ft0, ft3
                  srl          a0, s8, ra
                  fcvt.s.wu    fa0, s9
                  fle.s        s1, fa5, fs1
                  srai         gp, s11, 24
                  mulh         s0, a7, t4
                  sltu         a4, gp, tp
                  flt.s        t5, fa1, ft4
                  ori          a1, a0, 1353
                  fcvt.s.wu    ft3, a5, rtz
                  fmul.s       ft3, fa5, fa7, rdn
                  mul          a5, a4, t0
                  slt          tp, a7, a1
                  mul          ra, s8, s2
                  slli         s8, a1, 27
                  fcvt.s.wu    fa0, s4, rtz
                  mulhu        s7, s11, s10
                  slli         s6, gp, 28
                  sll          t3, tp, ra
                  flt.s        a0, fs2, fa7
                  lui          ra, 118223
                  fcvt.wu.s    a2, fs11
                  fmax.s       ft7, fs3, ft8
                  fcvt.s.wu    fa6, s8
                  flt.s        t4, fs10, fs10
                  srai         s1, t5, 25
                  sra          tp, a5, a6
                  lui          s5, 731653
                  srai         a5, a6, 0
                  fmv.x.w      t4, fs7
                  fdiv.s       fs8, ft3, fa6
                  ori          s1, a1, -1256
                  fcvt.s.wu    fa5, a7, rmm
                  div          t4, s4, s6
                  remu         s1, tp, s5
                  fclass.s     s3, fa5
                  fmax.s       fs2, ft11, fs2
                  slti         s8, s5, 106
                  fcvt.s.w     fa3, t5, rdn
                  srli         s10, t2, 20
                  flt.s        a0, fs5, ft4
                  rem          a3, tp, sp
                  srl          a4, gp, a2
                  rem          s6, a3, t3
                  srai         s7, t4, 5
                  fle.s        s8, ft8, fs2
                  rem          t0, t4, s8
                  remu         t4, a6, s10
                  fdiv.s       fa5, ft0, fs8, rmm
                  sub          zero, ra, s4
                  ori          t3, sp, -754
                  fmv.x.w      s2, ft8
                  lui          ra, 693741
                  sltu         ra, s2, t2
                  xori         a4, s10, 1403
                  divu         gp, s0, t5
                  auipc        s3, 948438
                  flt.s        zero, ft0, fs10
                  fcvt.wu.s    s6, fs3, rmm
                  sltiu        gp, t2, 1855
                  ori          t1, s0, 1097
                  fmin.s       fs2, ft11, ft1
                  fmin.s       ft11, fs10, fa3
                  xori         t4, a2, -1801
                  xor          a7, a3, t6
                  xori         ra, tp, 1617
                  slti         s10, a3, 569
                  fcvt.wu.s    t1, fa2
                  feq.s        s1, ft4, ft11
                  addi         sp, s2, -1674
                  fmul.s       ft5, fa7, ft4, rdn
                  auipc        t0, 830681
                  rem          s0, s3, t1
                  mul          s2, s7, t6
                  rem          t5, s4, t4
                  fdiv.s       fs7, fs7, ft6, rup
                  or           s7, s11, a4
                  srai         t3, a0, 5
                  feq.s        s3, fs2, ft2
                  srli         s7, ra, 19
                  sltiu        zero, a3, 1292
                  rem          s6, t4, t6
                  fsub.s       fa4, fs0, fs6
                  mulh         zero, sp, s2
                  fmul.s       fs2, ft2, fs9, rmm
                  sltu         t1, a0, zero
                  remu         tp, a0, a5
                  addi         tp, a7, 1071
                  divu         t4, s2, a4
                  fsqrt.s      ft9, fa0, rup
                  flt.s        a0, fs10, fs3
                  fcvt.w.s     s10, ft10, rmm
                  fcvt.wu.s    t3, ft6
                  or           a0, s9, s8
                  feq.s        t3, ft7, fa2
                  sll          s1, a6, s11
                  fle.s        s6, fs2, fs9
                  rem          a5, s6, s10
                  addi         s2, a5, -1861
                  fmv.x.w      t0, ft8
                  divu         s5, s10, tp
                  nop
                  and          s8, s8, s2
                  fsgnjx.s     fs10, ft4, ft4
                  and          s1, t4, s5
                  div          s1, a5, tp
                  mul          a2, gp, zero
                  auipc        gp, 242459
                  sltu         a1, t1, t6
                  fmax.s       ft2, fs5, fs9
                  fsqrt.s      fs11, ft9, rdn
                  fsqrt.s      fs3, fa6
                  feq.s        a3, fa3, ft10
                  srli         s3, t6, 13
                  fcvt.wu.s    a1, fs7
                  mul          a1, s5, s3
                  sub          zero, t2, s3
                  flt.s        t4, fa3, fs11
                  add          s0, a3, a3
                  srai         ra, t0, 14
                  xori         ra, a7, 1318
                  srl          s1, s8, t1
                  fsgnjn.s     ft5, ft11, ft6
                  fle.s        gp, fs9, fs1
                  div          s0, t6, t5
                  fmin.s       ft6, ft7, fs3
                  fmax.s       fs11, fa2, fa2
                  fmax.s       ft0, ft2, fa3
                  andi         a7, a5, 1848
                  lui          a1, 669144
                  fsgnjx.s     fa7, fs8, fs4
                  fmv.x.w      t4, fs5
                  srl          s1, s9, sp
                  remu         a3, a2, ra
                  slli         s3, a2, 2
                  slt          t0, tp, s9
                  fsub.s       fa7, fs11, fs7
                  slti         s0, s2, 853
                  fdiv.s       ft8, ft9, ft5
                  slti         t2, s7, -1524
                  or           t6, s6, a7
                  divu         t1, a0, s10
                  fmul.s       fs4, fs4, fs8
                  or           t1, s3, t1
                  sltu         s7, s11, s9
                  add          ra, a1, s8
                  and          gp, t4, t2
                  addi         a5, t3, -1119
                  slti         a0, a5, -1364
                  fcvt.s.w     ft4, a4, rne
                  sltiu        s6, a1, -600
                  fsgnjx.s     ft7, ft7, ft2
                  fsqrt.s      ft6, fs10
                  or           t4, a0, sp
                  nop
                  srli         t1, t0, 6
                  lui          s2, 18844
                  srl          s0, s5, t6
                  sll          s11, t0, a2
                  fclass.s     t3, ft10
                  slti         a1, sp, 1579
                  fadd.s       fs9, fs7, fs6
                  slt          s2, tp, t0
                  div          s10, s10, a7
                  mulhu        s10, a5, a1
                  xor          t0, a1, s4
                  fsgnj.s      fs5, fs9, ft11
                  slt          s0, s4, a0
                  andi         t1, tp, -169
                  fclass.s     t0, ft10
                  nop
                  addi         s11, a7, 575
                  flt.s        t3, fa5, fs8
                  fclass.s     s8, ft1
                  feq.s        t5, ft3, fs9
                  fclass.s     sp, ft5
                  srli         s8, s6, 19
                  nop
                  addi         t1, gp, -1419
                  sltu         t0, s9, s6
                  fsqrt.s      fa2, fs8
                  mulhu        a1, a3, tp
                  ori          sp, s9, 208
                  fclass.s     s1, fs3
                  sltu         a5, t0, gp
                  fclass.s     t4, fs4
                  fmax.s       ft9, ft1, ft6
                  fsgnjn.s     ft5, ft6, fs1
                  nop
                  fcvt.s.w     fa3, s7, rdn
                  sltu         s5, a7, a7
                  slt          s6, s9, t5
                  fmv.x.w      tp, fa2
                  fmv.w.x      ft7, s3
                  fcvt.w.s     s10, fa6, rup
                  ori          t5, s2, 317
                  fcvt.s.w     ft0, tp
                  or           tp, sp, a7
                  nop
                  fclass.s     t3, fs5
                  fsqrt.s      fs5, ft10
                  fle.s        s2, fa0, ft3
                  slli         s2, a4, 23
                  flt.s        s6, fs2, fs1
                  fsgnjn.s     fs6, fs6, fs5
                  sltiu        a1, a1, -728
                  addi         s8, s7, 501
                  slt          s3, t5, a3
                  fmv.w.x      fs9, tp
                  sll          t1, s6, s11
                  ori          s10, tp, -1274
                  fmul.s       ft10, fs1, fa3
                  srl          t6, s11, a3
                  srai         a5, s5, 27
                  divu         a0, s10, ra
                  srl          t4, a0, t5
                  fsgnjx.s     ft7, fa0, fs10
                  srl          t1, s5, a1
                  fdiv.s       fs8, fs10, ft2
                  mulhsu       s10, a6, s2
                  andi         t5, t3, 560
                  mul          a2, zero, s1
                  flt.s        s2, fs3, fs8
                  remu         t5, s8, s0
                  fmv.x.w      s11, ft10
                  sra          gp, t6, s11
                  flt.s        t2, ft2, ft2
                  div          a2, tp, s4
                  srli         t4, s10, 21
                  andi         t4, s10, -1841
                  srl          s10, a7, t4
                  srli         t3, s6, 12
                  fdiv.s       ft2, fs6, fa5, rup
                  mul          t6, a6, s1
                  fsgnjn.s     fs11, ft1, ft11
                  fadd.s       ft6, fa3, ft5, rmm
                  sub          a0, s1, t3
                  fsgnj.s      ft6, fs7, fs10
                  sltiu        s1, s11, 1387
                  fclass.s     t6, fa1
                  sltiu        a4, gp, 754
                  fsqrt.s      fs0, ft3, rtz
                  lui          t3, 522777
                  fsgnjx.s     fa0, fs11, fs4
                  div          a7, a5, s9
                  feq.s        ra, fa7, fs3
                  srl          s11, a6, a3
                  fcvt.wu.s    t2, ft5
                  fmul.s       ft3, fs8, ft7, rdn
                  slli         zero, a1, 4
                  fsgnjx.s     fs3, ft11, ft8
                  fsub.s       ft4, fs3, fs0
                  sub          s3, gp, a7
                  mul          a4, ra, s9
                  xor          a3, a1, t3
                  sll          zero, gp, s8
                  lui          a3, 958041
                  slli         s3, s4, 9
                  rem          t2, a0, t2
                  slt          t4, t3, s10
                  fadd.s       ft8, fa1, fa6
                  rem          t1, t5, t0
                  slli         a3, a3, 26
                  fcvt.w.s     a1, ft11, rne
                  fclass.s     t6, fs7
                  slti         ra, ra, 804
                  fsqrt.s      ft4, fs3
                  flt.s        s10, fs6, ft2
                  fmv.x.w      tp, fa7
                  sra          a2, s4, s6
                  fcvt.w.s     a2, ft8
                  xori         s11, a5, -1939
                  slt          s6, s5, s1
                  addi         t6, a6, -1943
                  auipc        gp, 759765
                  fmul.s       fs1, ft6, ft8
                  fmv.w.x      fs8, t5
                  remu         t2, a6, t4
                  fsub.s       fs4, fs0, fs0, rne
                  fsgnjn.s     fs0, fa6, fs3
                  fmv.x.w      a1, fa7
                  auipc        t2, 51816
                  and          tp, t1, s8
                  fsqrt.s      fs4, fa7, rdn
                  sra          a7, t1, s7
                  fcvt.s.wu    fs10, s0, rmm
                  srai         a1, t3, 31
                  sll          tp, a7, s1
                  xor          ra, t6, s7
                  fle.s        s10, ft9, fa2
                  sll          sp, s10, gp
                  xori         zero, a5, 386
                  fclass.s     s2, ft7
                  srl          a2, t4, a7
                  remu         a5, tp, s9
                  fsub.s       fs5, ft1, fa1, rup
                  mul          t3, a5, a5
                  srai         t6, s5, 23
                  fsgnj.s      ft9, ft5, fa5
                  auipc        s8, 516040
                  lui          t2, 347707
                  flt.s        a5, ft1, fs4
                  fcvt.wu.s    s2, ft10
                  xor          t5, t2, a5
                  andi         t6, a3, 1206
                  fsgnjn.s     fs1, fa2, fs5
                  sra          s8, s8, t6
                  fcvt.s.w     fs0, gp
                  fmul.s       ft2, fs4, ft1
                  slti         s6, s3, 432
                  add          s11, s2, t2
                  fcvt.wu.s    ra, ft8
                  fcvt.wu.s    a2, ft3, rup
                  remu         a5, t0, s10
                  add          a1, s5, a4
                  divu         sp, a7, s8
                  fcvt.s.wu    fs8, t1
                  flt.s        s2, fs2, ft7
                  addi         a0, t0, -1377
                  fmul.s       fa0, fs3, fa7, rtz
                  flt.s        s6, fs8, ft11
                  nop
                  ori          zero, a0, -555
                  fsgnjx.s     ft11, fs10, ft0
                  or           a0, t5, zero
                  addi         t2, a2, 988
                  mulhsu       a2, t0, a6
                  mulhu        ra, ra, s9
                  mulhsu       a7, s6, s3
                  mulhsu       a1, s5, ra
                  flt.s        s3, ft2, fa3
                  andi         s0, t0, -477
                  sltiu        tp, s6, 535
                  remu         s0, s5, a3
                  mulhsu       t0, s8, s7
                  slt          a3, a6, a0
                  fclass.s     s10, ft2
                  fmv.x.w      s6, fs11
                  remu         a3, s9, s4
                  fdiv.s       fa2, fs9, fa3
                  srl          a4, s4, a7
                  fmin.s       ft10, fs9, ft5
                  addi         s7, sp, -2000
                  sra          t2, gp, t5
                  srl          a1, s9, sp
                  flt.s        s2, fs8, fa7
                  fsgnj.s      fa3, fs7, fa5
                  fcvt.wu.s    tp, ft8, rtz
                  or           t0, gp, t6
                  fmv.w.x      ft0, t4
                  srli         s7, s4, 8
                  fcvt.s.w     fa1, t5, rne
                  lui          s10, 33411
                  slti         ra, s4, 1370
                  nop
                  mulhsu       a3, s7, s4
                  fmv.w.x      fs5, a3
                  fcvt.s.w     fs11, t5
                  mulhsu       t3, s8, s2
                  sltiu        t5, s0, 481
                  fsgnj.s      fs9, fs10, ft1
                  slti         s1, s4, -696
                  div          s1, s4, a4
                  or           t0, s0, s4
                  fsqrt.s      fa1, fa5
                  srl          gp, s11, sp
                  addi         s0, t3, -540
                  sltiu        tp, t4, -1664
                  slt          ra, a2, s9
                  fmv.w.x      fs8, a2
                  slli         t1, s1, 2
                  mulh         a2, a2, gp
                  sll          a4, a0, a5
                  slti         a7, s6, 1836
                  fsgnjx.s     fs11, fs5, fs3
                  mulhu        a1, sp, s0
                  fcvt.s.w     fa0, a1
                  divu         s5, s3, ra
                  or           sp, t3, a2
                  fadd.s       ft9, ft11, fs9, rmm
                  fmv.x.w      a5, fs11
                  fsqrt.s      fs9, fs8, rtz
                  xor          a3, a0, s4
                  fsub.s       fa4, ft3, ft7, rup
                  fsgnjx.s     fa5, fa3, ft1
                  fle.s        s7, ft7, fa4
                  add          ra, s5, a1
                  fadd.s       fs0, fs1, fs8, rdn
                  feq.s        a5, ft9, fs11
                  fadd.s       fa2, fs2, fs3
                  flt.s        a0, fs4, fs3
                  sltiu        a3, s8, 772
                  feq.s        s2, fa5, ft5
                  remu         s6, s1, a2
                  remu         s0, a6, s11
                  xor          s6, s10, gp
                  auipc        s1, 1047947
                  fcvt.w.s     s11, fa5, rup
                  flt.s        ra, ft11, fa0
                  fcvt.w.s     a1, ft11
                  addi         s1, t2, -912
                  fmv.x.w      s1, fs4
                  xor          t3, a1, s0
                  ori          a2, s3, 64
                  div          s3, tp, t1
                  fdiv.s       ft8, fs0, ft10, rdn
                  add          s2, a7, t2
                  fcvt.s.w     fs2, t5
                  fcvt.s.wu    fs5, a0
                  sub          gp, a6, s1
                  srli         s1, s8, 18
                  fcvt.s.wu    ft1, t1
                  fmv.x.w      a0, ft7
                  fsgnjx.s     ft2, fs6, fs0
                  fcvt.wu.s    s10, fs7, rmm
                  slli         tp, s10, 28
                  fsgnjx.s     fa5, ft5, ft8
                  fmv.x.w      s8, fa5
                  fsgnjx.s     fs3, ft7, ft1
                  mulhu        s7, a3, s0
                  fcvt.s.w     ft9, a2, rtz
                  fcvt.s.w     ft1, t1
                  xor          a7, t3, s7
                  add          t2, s0, s3
                  fsgnjn.s     ft0, ft3, fs5
                  fsqrt.s      ft4, fs11
                  fsgnj.s      fa5, fs0, fa0
                  fcvt.s.w     fa6, sp
                  fsgnj.s      fs0, fa2, fs3
                  srl          s1, s4, s10
                  fsgnj.s      fs4, ft2, fs0
                  fmv.w.x      fa0, a3
                  addi         t3, t4, -145
                  fcvt.w.s     a3, ft8, rdn
                  sra          t4, s8, sp
                  addi         s2, s5, 1237
                  add          t1, t1, t5
                  fcvt.w.s     s2, fa4
                  fcvt.s.wu    fa5, sp
                  fsgnj.s      fs10, fs5, ft10
                  add          t1, a0, s9
                  lui          t3, 910222
                  srl          s11, ra, t3
                  sltu         a0, a7, s11
                  mulhu        s6, s10, s0
                  sub          s7, a7, s3
                  auipc        a1, 12751
                  rem          s10, s9, s0
                  fmv.x.w      a1, ft4
                  fle.s        a2, fa7, ft4
                  sll          t2, t2, zero
                  fmv.w.x      ft4, s5
                  fclass.s     a4, ft0
                  sll          a2, a4, sp
                  add          t4, s3, zero
                  mulhu        s3, s3, s11
                  sltu         a5, tp, t6
                  fadd.s       ft4, fs11, fs3
                  fcvt.w.s     tp, fs4
                  divu         s2, t4, s11
                  sub          zero, s1, a0
                  fmax.s       fa1, fa3, fa5
                  fmax.s       ft6, fs6, fs0
                  divu         s10, a5, tp
                  and          a2, s4, s4
                  slt          s5, a1, t1
                  fle.s        zero, fs4, fs5
                  divu         a0, t6, t6
                  mulh         a3, t5, sp
                  lui          s8, 881400
                  or           s0, t5, tp
                  div          a2, a7, a2
                  and          sp, a7, s5
                  sltu         a0, ra, s9
                  flt.s        a4, ft7, ft1
                  sub          tp, t1, a7
                  or           zero, t0, s9
                  remu         s10, s7, a3
                  fmax.s       fa5, ft1, fs3
                  fcvt.w.s     sp, fa2
                  fle.s        s3, fa3, ft0
                  slti         s5, s8, 1650
                  fle.s        s3, ft2, fa5
                  flt.s        a7, fs10, fs4
                  fsub.s       ft2, ft1, ft3
                  fle.s        a5, fs1, ft9
                  slli         s5, t4, 25
                  slli         t4, a4, 8
                  fmin.s       ft9, fs7, fs4
                  div          s3, s8, zero
                  fmv.w.x      ft9, s2
                  rem          t0, tp, gp
                  andi         t3, a1, 824
                  fmv.w.x      fa3, gp
                  mulhsu       a4, a4, t2
                  fmv.x.w      ra, ft9
                  fsqrt.s      ft3, ft6
                  fsgnj.s      fs10, fs7, fs0
                  fdiv.s       fa4, fs7, fs11, rtz
                  lui          t6, 1034808
                  div          tp, s2, gp
                  fmv.w.x      fa6, zero
                  nop
                  fmul.s       fs3, fs9, fa2, rtz
                  fcvt.s.w     fa4, a1, rdn
                  div          a7, t5, s7
                  fmv.w.x      fa1, t2
                  fsub.s       fs5, ft8, fs6
                  xor          t4, s4, zero
                  auipc        t1, 117035
                  fmin.s       fs5, fa7, fa2
                  div          t3, a2, s7
                  div          s11, t3, s9
                  and          t4, t3, t0
                  slt          t2, a4, a3
                  fdiv.s       fa7, ft11, ft5, rtz
                  fcvt.w.s     s6, fa3, rmm
                  fclass.s     gp, ft11
                  rem          a0, t4, a6
                  fmul.s       fs4, ft9, fa2, rdn
                  mulhsu       a0, gp, ra
                  fdiv.s       fa5, ft9, fs3, rne
                  fclass.s     a7, fa2
                  feq.s        s11, fs5, ft5
                  xori         tp, s10, -1872
                  mulhu        s7, t6, ra
                  div          zero, s9, a0
                  mulh         s8, t0, s3
                  sltiu        t1, s2, -1130
                  addi         a3, t5, -1363
                  addi         t2, t3, 1029
                  fcvt.s.wu    ft10, t2
                  rem          s1, s11, s3
                  slt          s6, s0, a4
                  srl          s7, sp, t1
                  or           t4, t4, zero
                  sltu         t3, a1, a0
                  fmul.s       ft3, ft9, fa7, rdn
                  fcvt.s.w     fs10, tp
                  srl          s5, s11, a6
                  divu         gp, s10, s11
                  sltu         s0, t0, t2
                  andi         s3, s5, -1241
                  mulhu        s10, a4, a7
                  sltu         a0, s6, s0
                  addi         s5, s6, -171
                  sltu         t5, s11, zero
                  xor          a0, s6, a2
                  slt          gp, a0, a2
                  mul          a5, s5, s0
                  feq.s        zero, fs5, fs11
                  fsub.s       ft10, fs4, fs0, rtz
                  xor          s11, a0, sp
                  slti         s11, s0, 1179
                  addi         s10, zero, 1395
                  fmul.s       fa0, fs5, ft3, rup
                  slti         t1, zero, -455
                  ori          gp, s0, 1681
                  flt.s        tp, fa5, fs3
                  lui          s11, 316600
                  xori         gp, ra, -73
                  mulh         s11, sp, ra
                  sll          s3, a0, ra
                  mul          t3, a1, s3
                  feq.s        s5, ft2, ft6
                  mulh         s3, t5, s9
                  sltiu        s3, zero, 1783
                  fmul.s       ft2, ft6, fa4, rtz
                  fcvt.w.s     s0, fs8
                  slt          t6, s5, s5
                  mulh         ra, t5, s5
                  fmv.w.x      ft5, t6
                  mulhu        a0, a3, s3
                  fmax.s       fs9, fs9, fs10
                  mulhu        t6, s11, s7
                  remu         gp, s11, s1
                  fcvt.s.wu    fa5, s5
                  sub          s8, t5, gp
                  sra          s11, a2, t4
                  slti         sp, s1, 854
                  fsgnjn.s     fa6, ft6, fs3
                  srli         tp, s11, 6
                  srl          s0, t0, t1
                  addi         a7, s10, -1876
                  or           s5, s6, s5
                  mul          s5, s8, a4
                  sltiu        s11, t2, 1523
                  rem          t2, s2, gp
                  fsqrt.s      fa5, fa5, rne
                  mulh         t4, zero, s1
                  lui          a7, 110827
                  slti         t2, a3, -1693
                  fle.s        s2, ft0, fs0
                  xor          t6, zero, s3
                  sub          t4, s7, t3
                  mul          t6, s2, s3
                  mulhsu       s8, ra, t4
                  fcvt.s.w     fa7, t0
                  mulhu        s5, a1, a3
                  srli         t4, a1, 19
                  add          s1, tp, a6
                  fclass.s     a1, ft2
                  fcvt.s.wu    fa0, t2
                  and          a5, ra, s11
                  and          s2, t3, s3
                  fcvt.wu.s    a2, fs8, rne
                  fsgnj.s      fa5, fa6, fs7
                  fclass.s     a0, fs2
                  fmv.x.w      a4, fa6
                  or           s0, a3, s8
                  fmv.w.x      ft11, s2
                  mulh         a4, gp, a0
                  divu         s5, s1, s8
                  mulhu        sp, t3, s1
                  div          s11, a1, s2
                  fadd.s       ft10, ft8, ft1, rup
                  mulhu        t6, t6, t1
                  fdiv.s       ft2, fa5, fs3, rup
                  fsgnj.s      ft4, ft9, fs0
                  mulhsu       t0, s2, s3
                  fmul.s       fs2, ft2, fa3
                  fcvt.w.s     s8, ft8
                  srai         t1, sp, 16
                  fmv.x.w      t5, fa0
                  fsub.s       fs6, ft5, fs8
                  sra          t2, t1, ra
                  add          tp, t4, s1
                  fsgnjn.s     ft7, fa4, fa2
                  andi         t2, s6, -124
                  srai         s2, s10, 20
                  rem          s8, zero, t5
                  sltu         a4, t6, t0
                  srli         s8, s11, 9
                  fcvt.w.s     s10, ft8
                  fadd.s       fs8, ft9, fa7, rup
                  xor          t0, a3, t2
                  feq.s        s10, ft6, ft1
                  xori         s7, s6, 75
                  srai         a4, gp, 26
                  div          s7, t3, t0
                  auipc        t4, 527140
                  fadd.s       ft10, fa1, fs9
                  mulhsu       a2, s6, t6
                  mul          gp, a0, sp
                  lui          a0, 1046271
                  sub          s3, a4, t5
                  mul          s5, zero, sp
                  rem          ra, s9, a6
                  fsub.s       fa5, fa5, fa1, rne
                  fcvt.s.wu    fs7, a0, rtz
                  sra          ra, s2, t4
                  fcvt.s.wu    fa6, a2
                  fmul.s       fs8, fa1, ft9, rmm
                  fcvt.w.s     s8, fs9, rmm
                  divu         s2, t1, t0
                  divu         s7, s9, s11
                  fcvt.s.wu    fs3, s10
                  srl          a7, a4, a2
                  add          a3, s5, s2
                  add          s10, tp, s7
                  fcvt.s.w     fs3, a0, rmm
                  srli         a4, s11, 21
                  flt.s        s2, fs11, ft5
                  sltu         s8, t0, s11
                  fadd.s       ft6, ft0, fa6
                  ori          a4, a6, 2017
                  rem          t1, s0, s5
                  remu         t2, zero, s0
                  fadd.s       ft7, fs1, fs3, rne
                  fcvt.s.w     ft2, s6, rtz
                  auipc        s11, 89747
                  fmax.s       ft11, ft3, fs3
                  xor          a2, t4, t0
                  fle.s        t5, fs9, ft9
                  mul          t0, s3, t2
                  fsgnjx.s     fs6, ft7, fa7
                  fcvt.s.wu    fs10, t3, rup
                  srl          a1, ra, a2
                  xori         a2, s2, -125
                  sll          t5, a7, t6
                  or           t4, tp, a5
                  rem          t0, ra, ra
                  remu         t2, t5, a5
                  fdiv.s       ft8, fs5, ft0, rne
                  fmv.w.x      ft2, s1
                  fmv.x.w      tp, fa0
                  addi         t2, s1, -1266
                  fmin.s       ft5, ft4, fs0
                  or           s3, s2, s0
                  mulhu        a5, s11, a5
                  fcvt.w.s     s0, fs2, rmm
                  fsgnjn.s     fs8, ft4, ft6
                  add          t3, s10, t4
                  fsub.s       fs11, ft9, fs5
                  fmul.s       fs1, fa3, fa1
                  slt          t0, s4, a7
                  fadd.s       fa0, fs9, ft2
                  srai         t4, s2, 7
                  and          tp, s9, a0
                  fmax.s       ft4, fa2, ft3
                  fclass.s     a3, fa4
                  lui          gp, 334306
                  xor          t5, t0, s7
                  slt          t2, t0, s4
                  mulh         s6, a0, s11
                  fcvt.w.s     t5, ft1
                  feq.s        s8, ft10, fa7
                  ori          a0, s0, -457
                  fadd.s       fa4, ft0, ft7, rne
                  xor          t5, s8, s1
                  fcvt.s.wu    fs1, a3, rne
                  fsub.s       fs11, fa1, fs5
                  slti         t6, zero, -1703
                  rem          a2, t2, s10
                  srai         t5, zero, 17
                  srl          s11, zero, sp
                  fsgnjn.s     fs8, fa1, ft8
                  ori          t5, a7, -1039
                  fcvt.s.w     fa1, a5
                  fcvt.s.wu    fs8, s7
                  mul          a5, t2, t3
                  fcvt.wu.s    s3, ft5
                  fclass.s     t1, ft7
                  andi         t3, sp, 83
                  srl          t5, a2, a7
                  slt          a7, s5, s1
                  fmin.s       ft11, ft1, fs5
                  fadd.s       ft9, fs8, ft3
                  srai         s11, t4, 12
                  fcvt.s.w     ft1, sp
                  fmin.s       fs2, fs3, ft10
                  slli         sp, t3, 2
                  mulh         t2, s9, s8
                  slti         a5, a2, 638
                  or           s11, t0, t1
                  sub          s7, t0, s1
                  fsgnjx.s     fa1, fa1, fa5
                  and          a1, t3, a6
                  slti         t4, sp, 1984
                  sra          s7, s11, t1
                  srl          s7, a6, t4
                  feq.s        s1, fs11, fs10
                  sltiu        s10, sp, 1393
                  mulhsu       zero, a6, t0
                  add          t5, a2, s3
                  fsgnjx.s     fs11, fs4, fa2
                  mulhsu       s11, a6, s7
                  fmv.x.w      s5, fs6
                  fsgnj.s      fs9, fs6, ft5
                  fmv.x.w      a5, ft10
                  fmv.w.x      fs11, t1
                  xor          s3, s2, ra
                  sltiu        s3, a3, -247
                  add          a7, s5, t6
                  ori          zero, s6, -1619
                  mulhu        a2, s6, s2
                  fadd.s       fs8, fs10, fs4
                  rem          s3, s4, ra
                  addi         t5, s7, -517
                  auipc        ra, 391095
                  remu         a2, a3, t3
                  or           t4, s5, a1
                  fmv.x.w      s5, ft9
                  fsgnjn.s     fs8, fa7, ft1
                  fsgnjn.s     fs1, fa3, fs7
                  fmul.s       fa6, ft2, fs4, rne
                  fmv.w.x      fa6, s7
                  flt.s        s3, ft7, fs11
                  xor          gp, s5, s5
                  fmax.s       fs1, ft6, fa5
                  fadd.s       ft9, ft0, fs11
                  divu         gp, s1, a1
                  fmin.s       ft10, fs1, fs10
                  fcvt.s.w     ft7, a5, rmm
                  sub          a4, s1, s10
                  remu         tp, s8, a1
                  and          a0, s9, s10
                  fsqrt.s      fa6, ft4, rdn
                  fsub.s       fs8, ft2, ft1
                  xor          s2, s4, s1
                  ori          s6, a1, -212
                  andi         t1, ra, 1852
                  fcvt.wu.s    a5, ft10
                  divu         a0, t3, s5
                  remu         a0, a5, a3
                  addi         tp, a4, -1008
                  mulhsu       t4, sp, ra
                  feq.s        t3, fs10, fa2
                  sub          a1, s4, ra
                  add          t4, a1, s10
                  sra          a1, a6, a1
                  mulhu        s2, s8, t1
                  nop
                  addi         s0, a3, 884
                  sll          zero, s2, t5
                  addi         a7, t6, 1235
                  fcvt.s.w     fs3, s8, rdn
                  feq.s        s2, fs1, fs1
                  slli         s8, s1, 23
                  add          t4, a2, t4
                  nop
                  sra          a3, tp, t3
                  fsgnjn.s     fs7, ft11, ft0
                  fcvt.w.s     gp, ft5, rne
                  lui          t2, 860059
                  ori          a1, ra, 143
                  add          a0, s10, a3
                  slli         s11, tp, 19
                  fcvt.w.s     s8, fs9, rup
                  srli         a7, s1, 31
                  auipc        t1, 598214
                  sll          a3, t4, a7
                  fmul.s       fa0, fs4, fs6, rne
                  sltu         a5, s4, sp
                  fmax.s       fa6, ft2, fs1
                  slli         s10, s5, 3
                  slli         a7, t1, 11
                  srai         s3, t6, 23
                  lui          gp, 246079
                  fcvt.s.w     fs2, s3, rup
                  sra          a3, s7, s1
                  fmul.s       fs9, fa5, fs3
                  mul          tp, s7, s11
                  srli         t1, a5, 24
                  fmv.x.w      a3, fa0
                  fadd.s       ft9, fa0, ft3, rdn
                  slti         gp, a4, -1344
                  feq.s        a3, fa7, ft2
                  sltiu        s11, sp, -1924
                  andi         zero, a0, -91
                  remu         t0, t6, s11
                  fcvt.wu.s    s1, fs7, rup
                  srl          t2, s0, s10
                  fcvt.w.s     t0, fs0, rtz
                  mul          ra, tp, s9
                  sltiu        s1, s3, -265
                  and          s6, zero, a6
                  andi         s6, a0, 165
                  mulhu        t6, sp, tp
                  slti         t5, t0, 1145
                  ori          s7, ra, 1844
                  lui          s5, 457236
                  feq.s        s6, ft6, ft4
                  or           t2, a7, s7
                  and          s0, a1, s11
                  slti         s1, a2, -353
                  slti         sp, tp, -294
                  sltu         a7, a1, t0
                  mul          a3, t5, t2
                  add          s3, zero, a3
                  lui          t4, 766433
                  fclass.s     a5, ft7
                  remu         t4, zero, t5
                  fcvt.s.wu    fs0, s2, rdn
                  fcvt.wu.s    sp, ft0
                  feq.s        s1, fs3, fa4
                  fmax.s       fa3, fa5, ft10
                  sll          s3, gp, a5
                  sll          t4, t0, s8
                  fclass.s     t3, ft11
                  add          a4, s0, s1
                  divu         ra, t6, a1
                  slt          a5, a0, s1
                  fmax.s       ft4, ft3, fs4
                  xori         t0, a3, -384
                  fsgnj.s      fs10, ft2, fs8
                  fcvt.s.wu    ft3, zero
                  fsub.s       fa4, fa2, fa1, rup
                  andi         a7, s11, -951
                  andi         t5, gp, 1441
                  fsgnjn.s     ft8, fs9, fa1
                  fsgnjn.s     fa2, fs2, ft4
                  lui          zero, 666323
                  feq.s        t2, fs10, fa2
                  auipc        t1, 116560
                  auipc        t4, 913951
                  auipc        s10, 294833
                  fcvt.s.wu    ft1, a3
                  sra          a7, a5, s10
                  fcvt.s.wu    fa0, a1, rmm
                  srl          gp, t2, t5
                  add          a3, zero, s1
                  fsgnjx.s     fs2, fa3, fa2
                  sll          s5, s0, gp
                  slt          a1, gp, t3
                  div          a3, s3, t1
                  xori         t0, sp, -610
                  fsgnj.s      fs0, fa4, fs5
                  or           a2, s1, s5
                  and          ra, s6, ra
                  mulhsu       a1, a2, gp
                  sltiu        s5, s6, -136
                  mul          t1, gp, a0
                  andi         a2, zero, -1762
                  mul          s7, a0, s6
                  or           t4, tp, t6
                  lui          s1, 242919
                  srl          s10, s7, a0
                  add          a0, t3, s7
                  add          t5, s6, a3
                  srli         a5, zero, 11
                  sra          t0, s3, t2
                  addi         a2, s6, 1521
                  xor          tp, gp, s3
                  fsub.s       fa4, ft4, ft6
                  fsgnj.s      ft10, ft9, ft5
                  andi         s5, s1, -362
                  srli         s0, gp, 24
                  srl          t1, tp, t6
                  sltiu        a2, s9, -2021
                  fdiv.s       ft5, ft11, fs2
                  srai         t5, gp, 31
                  nop
                  slt          zero, zero, t4
                  div          zero, s4, s9
                  srai         s7, a5, 10
                  mulhsu       s1, t2, s5
                  lui          t6, 454088
                  fmv.x.w      tp, fs4
                  divu         a4, s10, t2
                  div          t4, s3, s10
                  lui          t4, 279862
                  mulh         a3, t3, a2
                  srli         s7, s7, 28
                  xori         s3, a6, -1435
                  fsqrt.s      fa6, fs11, rdn
                  feq.s        a7, fs0, ft7
                  ori          a2, t6, 1029
                  or           a7, a3, gp
                  div          t1, s0, a7
                  fcvt.wu.s    s6, fs6
                  fle.s        s2, ft2, ft1
                  fmax.s       ft8, ft2, fs1
                  flt.s        ra, fs3, fs10
                  slti         tp, s4, 1560
                  fdiv.s       ft7, fs7, fs11
                  sll          zero, s11, sp
                  rem          s11, ra, tp
                  div          a0, s11, a4
                  and          s2, t5, t1
                  sll          a7, a1, t2
                  sra          s5, s3, s8
                  xor          s1, a1, sp
                  slli         a4, a0, 15
                  slti         ra, s3, -1393
                  fsgnjx.s     fa3, ft4, fs10
                  fsgnj.s      ft3, fa1, fa3
                  sltiu        zero, s6, -1010
                  mul          s6, s4, tp
                  mul          a3, a1, s8
                  fcvt.w.s     s10, fs5
                  srl          t0, s3, a0
                  fmin.s       fs11, ft2, fs1
                  fsgnjn.s     fa3, ft6, fs9
                  srl          s2, s8, a0
                  mul          a1, s4, s0
                  fsgnjx.s     fs4, fs3, fs5
                  lui          a0, 212641
                  mulhsu       a3, tp, a1
                  sll          t0, s5, s1
                  fcvt.w.s     zero, fs11
                  fsqrt.s      fs6, fs2, rne
                  fsgnjn.s     ft9, fa3, fs3
                  fsub.s       ft6, fs9, fs11, rdn
                  auipc        s0, 501567
                  fcvt.w.s     t2, ft8
                  fdiv.s       ft6, fs6, fa5
                  nop
                  slli         a3, s3, 6
                  slti         s5, s9, 1577
                  slt          a4, s9, t4
                  xor          s0, sp, gp
                  mulhsu       s2, ra, s1
                  fcvt.w.s     a4, fa1
                  fmax.s       fs2, fs7, fs1
                  add          t1, t3, s7
                  fle.s        s0, ft2, ft7
                  fcvt.wu.s    sp, ft10, rne
                  xor          sp, sp, a2
                  fmax.s       ft8, fs2, ft10
                  srli         s0, t4, 4
                  divu         t6, t2, t1
                  fcvt.w.s     s7, fs11, rmm
                  fmv.x.w      a4, fs1
                  auipc        s11, 278700
                  srli         a0, t2, 2
                  fmv.w.x      fa3, s8
                  sltu         t4, sp, s5
                  add          t4, a3, a7
                  remu         zero, s5, s5
                  fmul.s       fa0, fa4, ft3
                  or           gp, gp, a7
                  xor          t0, s8, ra
                  fmin.s       ft3, fa7, fa4
                  fcvt.s.wu    ft2, gp
                  fsqrt.s      ft3, fa2, rne
                  fcvt.s.wu    fa2, s8
                  srli         t5, tp, 29
                  fmax.s       ft2, fs0, fs2
                  fclass.s     a2, fs5
                  mulh         t4, s5, gp
                  sra          a3, s8, s2
                  remu         s10, a7, a4
                  fsub.s       fs1, fs0, fs0, rmm
                  rem          s2, a3, s5
                  xori         s0, t3, 1248
                  fdiv.s       fs11, ft1, fa4, rdn
                  fclass.s     s6, fs1
                  srl          a3, s11, a4
                  sll          s5, s0, s8
                  mulhu        a5, a1, zero
                  mulhsu       a0, tp, a5
                  sll          s11, s9, a2
                  auipc        s0, 398423
                  sub          tp, s0, t5
                  fsqrt.s      fa5, fs2
                  mulhsu       a2, a3, a1
                  fmul.s       fs11, fs11, fa0, rtz
                  div          s6, s3, t0
                  mulhsu       sp, a2, a2
                  xori         s1, t1, -58
                  fmv.w.x      ft3, a3
                  lui          zero, 732558
                  fcvt.wu.s    s2, fs11
                  fcvt.wu.s    s0, fs2
                  fcvt.s.wu    fa6, s0, rne
                  slt          a5, a7, t4
                  or           s11, s6, a6
                  srl          t3, zero, a2
                  fmv.w.x      fs5, a4
                  fle.s        a3, fa0, ft1
                  fsgnjn.s     fs6, fa6, ft6
                  lui          s7, 799495
                  sra          s7, s2, sp
                  sra          s3, s7, t3
                  fsgnjn.s     ft4, fs6, fs2
                  flt.s        a2, ft1, fa5
                  flt.s        t1, ft2, fs11
                  auipc        t0, 427089
                  fsgnjn.s     fs1, ft5, fs9
                  srl          t4, s4, t1
                  fmul.s       fs0, ft11, ft7, rdn
                  fadd.s       fs11, fs11, fs9
                  srl          s6, a7, s6
                  mulh         a4, gp, s5
                  fdiv.s       fa3, ft4, fs2, rup
                  fsgnj.s      ft10, ft11, ft5
                  fmul.s       fa3, ft5, ft10, rup
                  auipc        a3, 41793
                  nop
                  fmax.s       ft9, fa4, fs9
                  srai         s5, a3, 17
                  mulhsu       a7, a0, t6
                  fmin.s       fs4, fa7, fs3
                  fmul.s       fs10, fs11, fs8, rtz
                  and          t0, t4, a6
                  addi         s2, a0, -1671
                  mulhu        zero, a4, a2
                  or           s3, s2, a4
                  mul          s10, s6, s6
                  fsgnjx.s     fs1, fs9, fa0
                  addi         s1, t3, 1378
                  andi         a4, s6, 563
                  nop
                  and          s6, a3, s0
                  fsub.s       fa5, ft9, fs2
                  srl          s7, zero, s11
                  ori          ra, a2, -151
                  slti         t2, zero, -1316
                  lui          a5, 1043965
                  fcvt.s.w     fs7, a3
                  divu         sp, t2, gp
                  rem          a1, s4, s4
                  mul          ra, s2, a6
                  fsgnjn.s     ft0, fa6, ft8
                  fsgnjx.s     fs6, ft0, fa3
                  slt          a0, a2, s3
                  srl          s1, s10, zero
                  auipc        s2, 450073
                  fcvt.s.w     fa5, a5, rdn
                  slli         s1, t0, 3
                  and          t2, a6, a6
                  nop
                  fcvt.wu.s    t6, fs4
                  fclass.s     s1, ft2
                  fle.s        a4, fs3, fs8
                  fmin.s       fs8, ft4, ft2
                  and          t6, s8, s11
                  fdiv.s       ft3, fs4, ft6
                  fcvt.w.s     t1, fa4, rmm
                  fdiv.s       fa3, ft4, fs10, rdn
                  xor          gp, t5, sp
                  fcvt.s.w     fs2, a5
                  fsgnjx.s     fa7, fs5, ft1
                  sll          s7, s2, t4
                  flt.s        a1, fs1, fs9
                  addi         zero, zero, 599
                  fclass.s     a5, fs4
                  addi         s11, gp, -291
                  xor          sp, gp, s10
                  rem          a5, t5, a2
                  fcvt.w.s     s2, fs4
                  slti         t4, sp, 1903
                  auipc        t1, 282677
                  nop
                  fmin.s       ft11, fa7, ft10
                  fdiv.s       fs10, fa0, fs1, rtz
                  srl          a5, s1, t4
                  fcvt.wu.s    s11, fs2, rup
                  sll          a4, a3, s1
                  slti         t1, s8, -544
                  addi         a2, t1, 811
                  fsgnj.s      fs1, fa6, ft10
                  or           zero, t0, s10
                  xor          zero, s2, a2
                  fsgnjx.s     fs7, fa2, fs8
                  mulhsu       s7, zero, s0
                  sll          s10, t2, s9
                  xor          t0, gp, s3
                  fadd.s       fs5, ft10, ft4
                  fsgnjx.s     ft3, fs11, fa5
                  fclass.s     s6, ft5
                  mulhsu       gp, t0, a3
                  fclass.s     a1, fs10
                  fcvt.s.wu    fs6, t0
                  fadd.s       fs1, fa2, fs5, rmm
                  sltiu        s0, a3, 1455
                  slli         s6, s2, 14
                  sll          s11, sp, t0
                  sltiu        a0, t2, -128
                  fclass.s     gp, fs8
                  fsub.s       fa5, fs10, fa2, rup
                  flt.s        gp, ft4, ft9
                  mulhu        s8, t0, t6
                  xori         s7, tp, -1710
                  fclass.s     s6, fa5
                  srai         a3, a0, 4
                  fmv.x.w      s0, ft6
                  srl          tp, gp, ra
                  fsqrt.s      ft3, ft10
                  fsgnj.s      ft10, fa1, ft11
                  fclass.s     s7, fs2
                  sll          a7, t6, a5
                  lui          t4, 954515
                  nop
                  fdiv.s       ft10, ft3, fs2
                  xor          a4, s5, s9
                  add          s8, s0, s4
                  sub          a4, a6, a6
                  srli         s11, a3, 30
                  feq.s        ra, ft5, fs11
                  add          sp, t4, s5
                  addi         s5, t5, 275
                  sltu         s8, t3, a5
                  fdiv.s       ft9, ft2, ft9, rmm
                  rem          a4, s0, a5
                  slt          tp, a7, s0
                  srli         a4, sp, 0
                  fcvt.s.w     ft3, t3, rmm
                  fclass.s     a7, ft9
                  addi         a5, a3, -1783
                  fcvt.wu.s    s2, ft3, rtz
                  sub          t1, s5, t5
                  fsub.s       ft11, fs4, ft7, rne
                  fsgnj.s      fs1, ft8, fs7
                  nop
                  sll          s3, t2, t0
                  div          a1, s10, s0
                  srai         s1, t4, 31
                  xori         s0, a7, 593
                  auipc        t4, 451394
                  fcvt.s.wu    ft2, gp, rmm
                  mulh         t5, s9, t3
                  fmin.s       fa5, fs2, ft5
                  fcvt.w.s     sp, ft5
                  xori         s5, t1, -892
                  fdiv.s       ft3, ft3, fa2
                  sltiu        t2, s4, 1349
                  sll          a7, s10, s3
                  fmv.w.x      fs11, t4
                  mul          tp, t0, t5
                  fsgnjn.s     ft10, fa1, fa7
                  rem          a3, s1, a5
                  fmax.s       ft5, fa1, fa0
                  fmv.w.x      ft5, t4
                  fsub.s       fs0, fa2, fs3
                  fcvt.s.w     ft4, a6, rmm
                  fsgnjn.s     fs7, fs0, ft5
                  feq.s        t2, ft6, ft9
                  andi         t3, a0, -1879
                  sub          s1, s4, s2
                  nop
                  fmax.s       fs2, fs2, fa0
                  srli         zero, s10, 19
                  andi         a4, s6, 1352
                  sltu         s5, s8, s0
                  fsgnjx.s     ft8, fs7, fs5
                  fsub.s       fa5, fa2, fa0
                  mulh         zero, a0, sp
                  ori          a2, t0, -1359
                  fle.s        sp, fa0, fs7
                  sll          s3, s6, s9
                  fcvt.s.w     ft8, ra, rdn
                  fdiv.s       ft5, fs11, fs2, rdn
                  fmin.s       ft5, ft1, fs7
                  fclass.s     a1, fs2
                  xor          a2, s0, a0
                  or           s11, s11, t2
                  lui          a1, 471424
                  divu         s3, s7, t0
                  srli         a7, s4, 20
                  mul          s3, a3, s9
                  sltiu        ra, s4, -311
                  fclass.s     a5, ft8
                  fcvt.s.w     ft8, a3, rdn
                  rem          tp, ra, s0
                  mulh         a7, s9, a7
                  fmin.s       ft2, fa4, ft2
                  mulhu        t0, ra, s3
                  sll          s11, tp, s9
                  lui          sp, 273428
                  fcvt.w.s     a5, ft4
                  sub          a1, s11, s8
                  div          s3, t3, s10
                  slli         tp, ra, 28
                  fmax.s       fa1, fs5, fa1
                  fmax.s       ft1, fa3, ft2
                  nop
                  addi         gp, a5, 1875
                  sltiu        s7, a3, -1554
                  sub          a7, a2, t4
                  srai         zero, tp, 17
                  mulhsu       tp, tp, a3
                  div          ra, s9, a2
                  fadd.s       ft1, fa4, ft10
                  fle.s        s8, fs3, ft0
                  sltu         a7, s10, sp
                  fsqrt.s      fa2, ft1, rmm
                  fclass.s     s3, ft11
                  fmin.s       fa4, fs5, fs6
                  srai         a7, s7, 27
                  mulhu        sp, s2, s1
                  nop
                  fcvt.s.w     ft10, s9, rmm
                  remu         s10, s7, zero
                  sltiu        s6, a3, 957
                  fcvt.s.w     ft8, t1, rdn
                  srai         a1, a6, 17
                  sltu         s7, s5, a3
                  auipc        a1, 249927
                  fmv.x.w      a7, fs5
                  mulh         t4, t5, a6
                  fdiv.s       fs2, fs1, ft11, rtz
                  fclass.s     s7, ft5
                  fle.s        gp, ft10, ft11
                  fle.s        s1, ft1, fs3
                  mulhu        a2, a2, s4
                  fsgnjn.s     fs6, fa4, fs1
                  fle.s        a2, ft2, fs9
                  ori          sp, t5, 1691
                  nop
                  flt.s        tp, fs2, fs6
                  slti         sp, gp, 710
                  ori          s11, ra, -830
                  fsgnjx.s     fa2, fa4, ft2
                  sll          a7, t5, gp
                  add          t0, s4, s0
                  fsgnjx.s     fa5, ft1, ft8
                  slli         gp, t5, 25
                  xor          s8, t1, gp
                  fsgnjn.s     ft3, ft11, fs5
                  srai         t6, t2, 16
                  slti         t2, t5, 1315
                  sra          s1, s0, a0
                  srl          s0, s4, gp
                  auipc        s6, 50215
                  srli         s3, t3, 4
                  fdiv.s       ft0, ft6, fs11
                  slti         t1, zero, -1666
                  fadd.s       fs10, ft11, fs0
                  fdiv.s       ft6, ft2, ft4
                  fmin.s       fs4, ft3, fa0
                  sll          s1, t0, s1
                  lui          t6, 477537
                  or           t6, s0, t4
                  fmul.s       fa4, fs10, fs2
                  remu         a0, t5, zero
                  fadd.s       fs2, fs11, fs7
                  andi         s0, s10, 1737
                  fle.s        ra, fa3, fs10
                  fle.s        a7, fa5, fs10
                  fadd.s       fs4, ft7, ft10
                  nop
                  lui          a1, 394749
                  slt          t5, a0, s6
                  fmv.w.x      fs2, zero
                  feq.s        s7, ft9, ft5
                  fadd.s       ft2, fs7, fs8, rne
                  fsgnjn.s     fs1, fs11, ft1
                  srai         s7, s11, 3
                  fsqrt.s      fa1, ft10, rtz
                  sltiu        t4, s2, -1577
                  andi         t2, t6, -1808
                  fmul.s       fs8, ft4, ft2
                  sltu         a0, sp, a0
                  fsgnjn.s     fs8, fa1, fs3
                  xori         a3, t4, -787
                  div          s0, t1, a2
                  fclass.s     a1, fs9
                  fcvt.wu.s    sp, fa2
                  mul          t0, gp, t5
                  fmax.s       ft4, ft4, fs7
                  sltu         ra, a3, s4
                  or           a0, s6, s2
                  srai         t1, t6, 23
                  sub          a2, s10, t2
                  and          t6, s10, s8
                  mulhsu       a1, s8, t5
                  and          zero, s3, a6
                  and          s8, s6, s2
                  div          a5, gp, a5
                  and          gp, s5, gp
                  fmin.s       fa3, ft4, fa0
                  sub          ra, a7, a6
                  flt.s        s5, fs8, fs8
                  mulhsu       t2, t6, a7
                  auipc        t2, 841905
                  srai         t0, a3, 14
                  srli         s3, zero, 14
                  slti         gp, s11, -353
                  divu         t2, s3, s6
                  flt.s        t2, fa6, ft10
                  lui          a1, 539794
                  sltu         s10, tp, s10
                  sub          t2, s10, s9
                  fsgnj.s      ft4, ft1, ft8
                  fmul.s       fs8, ft10, fa0, rup
                  fcvt.s.w     ft7, t4
                  srli         a0, a0, 2
                  mulhu        t1, a7, t6
                  fdiv.s       fs8, fa5, fa7
                  divu         sp, tp, s2
                  or           t2, t4, t5
                  sltiu        s10, s2, -361
                  div          s11, a5, a1
                  fle.s        s10, fs5, fa4
                  sll          sp, a4, a4
                  srl          a7, zero, s2
                  sub          t0, tp, a3
                  add          gp, tp, sp
                  mulhsu       s10, a6, t2
                  fsgnj.s      fa0, ft5, ft5
                  slt          s8, s2, t4
                  remu         ra, s10, t1
                  fcvt.s.w     fs0, t5
                  sll          t2, s2, s11
                  fmv.x.w      t1, ft0
                  fle.s        a4, ft6, fs11
                  srli         s5, s11, 13
                  andi         s1, s10, -309
                  srl          sp, s1, s7
                  xori         a4, t6, 940
                  srl          tp, s1, a0
                  slti         a1, a1, 1419
                  mulh         s0, a6, s8
                  andi         gp, tp, 812
                  addi         t4, s8, 620
                  fmin.s       ft5, fs11, ft0
                  fadd.s       fa0, fa0, fs9, rtz
                  fsgnj.s      ft5, fa7, fs8
                  sltu         a1, t5, t4
                  divu         s3, s9, s4
                  fcvt.s.w     fs5, sp
                  rem          t3, s9, s5
                  slli         t6, s5, 2
                  fsub.s       fs9, ft4, ft9, rdn
                  fcvt.w.s     s10, fs2, rdn
                  remu         t3, sp, s3
                  fsqrt.s      fa2, ft4, rmm
                  fsgnj.s      fs1, fa0, ft9
                  srl          t6, s10, t6
                  fmv.x.w      a3, fs3
                  mul          s6, s9, s5
                  fmul.s       ft1, ft1, fs1
                  xor          a7, zero, s8
                  fmv.x.w      t3, fa5
                  fmax.s       fa6, ft0, fa1
                  ori          sp, s10, 146
                  sltiu        zero, s4, -1312
                  slti         a0, a4, -1100
                  fcvt.w.s     t6, fa4, rdn
                  slti         tp, a1, -917
                  fmax.s       ft5, ft6, fa0
                  mulh         s5, t3, s9
                  fsgnjn.s     fs3, ft8, fa2
                  slt          s2, a6, s5
                  slti         a7, s7, -1975
                  sltu         s0, s8, a3
                  remu         a1, a3, s11
                  feq.s        a0, ft9, fa6
                  sra          a3, s10, s0
                  fadd.s       fs2, fs6, fs7, rmm
                  andi         s0, a6, 1320
                  and          gp, s5, t5
                  slti         t3, a4, 1101
                  fsgnj.s      ft9, ft6, ft0
                  slli         a4, s2, 12
                  sll          a0, a6, s5
                  fmv.x.w      s10, ft4
                  fcvt.s.w     fs8, a0
                  fclass.s     a3, fa1
                  fsgnj.s      fs4, fs9, ft0
                  slti         a3, a1, 759
                  fsqrt.s      fs2, fa4, rne
                  fsgnjn.s     fs11, fa2, fs3
                  nop
                  mulhu        a4, s8, t1
                  and          tp, t4, s8
                  slli         tp, ra, 14
                  add          t3, a6, gp
                  mulhsu       s6, t5, a1
                  or           a3, a2, t2
                  fadd.s       fs10, fs11, ft6, rne
                  slti         a7, t2, -75
                  or           t4, s3, s3
                  lui          a2, 637445
                  fle.s        s0, ft0, ft11
                  remu         t6, s4, a5
                  fclass.s     s8, fs9
                  nop
                  srl          t4, s2, s7
                  sll          a5, zero, t1
                  or           s6, a4, s9
                  fmul.s       fs10, fs6, fs10
                  fmv.x.w      sp, fa0
                  div          t4, a2, t6
                  srli         a0, gp, 26
                  fmul.s       ft2, fs1, fa6
                  mulh         t5, s5, s5
                  fle.s        t5, fa3, fs8
                  feq.s        a2, fs2, ft5
                  fmul.s       ft3, ft3, fa6, rmm
                  fsgnjx.s     fs10, fs9, fa5
                  fle.s        t0, fs0, ft10
                  fmv.x.w      tp, ft5
                  slti         s3, t1, 787
                  fclass.s     s8, fs7
                  fmin.s       ft1, ft10, fs10
                  or           s8, s9, a7
                  slt          zero, a3, a4
                  sra          gp, a5, t6
                  ori          gp, a3, -2015
                  divu         t4, gp, sp
                  andi         s7, a2, 551
                  addi         s10, s3, 1904
                  fsub.s       fs6, ft2, fs0, rmm
                  fadd.s       fs7, fa5, ft10
                  sll          t0, s2, s10
                  fcvt.w.s     t3, fa4
                  fdiv.s       ft5, fs2, fs0
                  fadd.s       ft8, fs0, ft7, rup
                  fcvt.s.w     ft10, s0, rne
                  sltiu        a3, gp, 1534
                  add          s0, t0, t1
                  rem          s1, gp, s8
                  rem          t2, t2, t2
                  fmv.x.w      a2, fa0
                  fmv.w.x      ft5, ra
                  sub          t0, t5, t5
                  remu         s10, t6, s5
                  fadd.s       fs10, fs7, fa7, rmm
                  fsgnj.s      fs3, ft4, fa5
                  srai         t5, t0, 12
                  sll          a4, s11, s5
                  fsgnjx.s     ft9, fs5, ft7
                  mulh         a0, t6, s9
                  srai         gp, t6, 15
                  fcvt.wu.s    s11, fs0
                  andi         s2, a0, 915
                  sll          gp, t1, sp
                  sltu         a2, t4, a6
                  fcvt.s.wu    fs3, s5
                  nop
                  mulhsu       gp, s4, s7
                  srl          s7, s1, a5
                  nop
                  sll          a2, t5, t2
                  srai         t5, s3, 0
                  fcvt.wu.s    s0, ft2, rmm
                  remu         t5, ra, gp
                  fmv.x.w      t4, ft10
                  fmul.s       ft8, fs2, fa2, rup
                  mul          s3, s11, s0
                  srli         t3, zero, 23
                  srai         t3, s6, 8
                  lui          s2, 59493
                  fsgnjx.s     ft11, fs4, fs10
                  fsub.s       fs2, fs4, ft6
                  divu         s7, a3, gp
                  fmv.w.x      fa4, s0
                  fsub.s       fs1, fs5, fa6, rtz
                  sltu         t3, t6, a0
                  feq.s        s3, ft3, fs5
                  ori          s1, t4, -1315
                  fsgnj.s      ft3, ft7, ft9
                  auipc        t3, 658341
                  fclass.s     s2, ft8
                  fmul.s       fs7, ft0, ft8
                  fadd.s       fs10, fs5, ft7
                  fmv.w.x      fs7, a6
                  sltiu        t4, tp, -1769
                  sltiu        s11, s4, -535
                  slli         t3, t4, 1
                  lui          tp, 107622
                  sra          t4, a5, gp
                  mulhu        s11, a6, t1
                  addi         a0, t6, -653
                  srai         s5, s9, 27
                  xori         ra, a6, 860
                  mulhsu       t6, t4, a0
                  srli         s10, t2, 23
                  mulhu        s1, s9, a6
                  srai         s2, s11, 11
                  nop
                  auipc        t0, 112033
                  andi         a7, s3, -193
                  fclass.s     s3, ft6
                  fsub.s       ft9, ft5, fs6, rup
                  fmv.x.w      s6, ft5
                  fadd.s       ft11, ft11, ft9
                  fsub.s       fa0, fs9, ft9
                  fmv.w.x      fa7, tp
                  fcvt.s.w     ft3, a5, rmm
                  mul          tp, s2, s8
                  ori          a3, a5, 1325
                  sra          s3, a1, s5
                  and          a7, ra, a7
                  andi         t6, tp, -904
                  slt          t3, a5, t5
                  ori          s1, t1, -597
                  fmv.x.w      t1, ft9
                  mulh         a3, t4, t3
                  sll          t3, a2, s0
                  and          t3, a7, t3
                  slli         gp, s9, 2
                  rem          s1, a2, s8
                  srl          sp, s10, s8
                  fdiv.s       fa5, ft11, fs8, rne
                  fcvt.wu.s    s0, fs2
                  slli         a7, a1, 4
                  andi         s10, s8, -1503
                  fcvt.s.wu    ft0, a2, rtz
                  flt.s        a2, fa6, fa0
                  fsgnj.s      fs8, fs10, ft8
                  auipc        a1, 845659
                  fcvt.w.s     t6, fs0
                  andi         a2, a3, -143
                  fmv.x.w      s8, fa5
                  fcvt.s.w     fa4, s2
                  fsqrt.s      fa1, ft1
                  fmin.s       fa2, ft0, ft4
                  or           s10, s5, a5
                  fmax.s       fs9, fs1, fa5
                  andi         s8, t6, -270
                  fsqrt.s      ft10, fs7, rdn
                  fmul.s       fs6, fa7, ft11
                  mul          a3, gp, s3
                  fmv.w.x      fa1, a5
                  mulh         t4, a7, sp
                  fmin.s       fa6, ft4, fs5
                  fsub.s       fs1, ft4, fa0, rtz
                  flt.s        ra, ft4, fs9
                  slti         zero, t5, 1355
                  fclass.s     t2, fs8
                  slti         t2, a0, 1154
                  andi         s5, s4, -1700
                  lui          tp, 764660
                  mul          a5, t2, s8
                  slt          zero, s0, s0
                  fmv.x.w      zero, fs4
                  mulh         zero, s0, t1
                  sll          a0, s2, t3
                  fadd.s       fs5, fa0, fs10, rup
                  feq.s        t4, fs10, fs6
                  fclass.s     t6, fa4
                  fdiv.s       fa1, fa1, fs2
                  lui          t3, 608084
                  sltu         ra, t1, t6
                  mulhsu       s11, s11, a5
                  divu         t4, ra, s4
                  mulhu        sp, s8, s6
                  add          a3, s1, a4
                  slli         t1, a2, 9
                  fsgnj.s      ft6, ft11, fa4
                  sra          tp, sp, ra
                  slt          a2, zero, s0
                  or           t4, a4, a2
                  xori         s7, t4, -1882
                  fcvt.s.wu    ft6, t2
                  flt.s        t1, fs2, fa7
                  auipc        t3, 865873
                  remu         s6, s3, a7
                  divu         s3, t6, t0
                  div          s8, a3, s5
                  srli         s10, s2, 7
                  remu         tp, s5, t3
                  slt          ra, zero, a5
                  div          sp, tp, s3
                  fmv.w.x      fa6, s3
                  fcvt.s.w     ft11, s11
                  rem          s6, t4, t3
                  mul          gp, s5, s4
                  fsgnjn.s     ft2, fs9, fs4
                  srli         t4, sp, 15
                  lui          a3, 356768
                  fcvt.w.s     t3, fs5
                  fcvt.wu.s    a0, ft5
                  divu         a7, s9, a1
                  fcvt.wu.s    a2, ft0, rmm
                  ori          t3, t3, 1372
                  srli         t1, s5, 16
                  fcvt.wu.s    a2, fs2, rmm
                  fdiv.s       fa7, fs8, ft2, rdn
                  xori         t2, a2, 1000
                  fsub.s       ft2, fs6, fs4, rtz
                  fsgnjx.s     ft0, ft4, fs1
                  slli         zero, a0, 7
                  ori          t4, t6, 254
                  xori         t6, gp, 1934
                  feq.s        s2, fs3, fs2
                  fcvt.s.wu    fs5, a5
                  fsgnj.s      ft11, ft7, ft4
                  fcvt.w.s     s1, fs5
                  fsgnjn.s     ft7, fs6, ft3
                  fmax.s       ft9, fa6, ft10
                  or           t5, t0, t0
                  sra          t2, s7, a4
                  divu         t1, gp, t4
                  fmv.w.x      fs3, a3
                  fsgnjx.s     ft8, fs1, ft0
                  sltiu        t1, t6, -1106
                  fsqrt.s      fa1, fa3
                  slti         s0, a3, 2016
                  slli         s6, t6, 31
                  slli         sp, s2, 5
                  sra          a5, ra, s9
                  mulh         gp, a5, a6
                  or           t4, s8, s7
                  auipc        a7, 1045888
                  fadd.s       ft5, ft4, ft0
                  auipc        s7, 236922
                  mulh         a1, t0, a6
                  auipc        s0, 857878
                  rem          a4, t4, s6
                  fmv.x.w      s0, ft3
                  remu         s11, t3, a5
                  remu         ra, s6, t0
                  fdiv.s       ft1, ft9, ft10, rmm
                  andi         a1, sp, 1417
                  sltiu        a5, s7, -730
                  sltiu        s5, t0, 1480
                  fmax.s       ft9, fs10, ft8
                  andi         s2, s3, 1638
                  fmin.s       fa3, fs9, ft11
                  fmv.w.x      ft10, t0
                  mulhsu       s3, s8, t5
                  fcvt.s.wu    ft11, s6
                  mul          s2, a3, s6
                  fdiv.s       ft0, ft7, fs11, rtz
                  nop
                  flt.s        tp, fs1, fa2
                  sll          a5, s5, sp
                  fsub.s       fs1, ft5, ft8, rne
                  sub          zero, a1, gp
                  or           a1, a5, s5
                  srl          a4, t6, a3
                  remu         ra, t6, a4
                  fcvt.s.wu    fs11, a2, rtz
                  sltu         a7, tp, s4
                  add          a2, s7, t0
                  divu         t3, sp, s1
                  xor          a2, ra, zero
                  feq.s        gp, ft11, ft9
                  fmv.x.w      s5, fa1
                  fdiv.s       ft11, fs11, fa6
                  mulhsu       t5, t6, t2
                  remu         s11, s11, a7
                  nop
                  fsub.s       fs7, fs3, fs6, rdn
                  mulh         a0, s6, t4
                  xori         t4, a3, -800
                  fcvt.w.s     t6, fs4
                  fmin.s       ft6, fs0, ft11
                  feq.s        t5, fs8, ft7
                  add          s0, a7, a5
                  fmul.s       ft8, fa3, fs9, rdn
                  remu         sp, ra, a5
                  add          s10, s5, tp
                  or           gp, sp, s3
                  fcvt.wu.s    a7, ft3
                  fmv.w.x      ft4, s10
                  andi         s2, t3, -1742
                  slt          a7, s4, s11
                  fmv.w.x      fa6, t6
                  and          s10, tp, s1
                  srl          ra, s8, s1
                  fmv.w.x      fs3, a5
                  lui          a2, 523864
                  mulh         s6, s0, sp
                  auipc        s1, 603541
                  or           a2, a6, s8
                  mulhsu       s0, zero, s11
                  fdiv.s       ft11, fa3, ft7
                  ori          a0, s1, 1909
                  or           s10, a4, s0
                  fsgnjn.s     fs1, ft3, ft8
                  fmv.w.x      ft10, a3
                  divu         t6, s2, s7
                  sltiu        t6, tp, -1477
                  mul          t1, sp, a2
                  xori         s11, a5, -479
                  slli         t4, t0, 5
                  srl          a1, s7, t3
                  fsgnjn.s     ft1, fa0, fs9
                  add          a4, a3, ra
                  remu         tp, s7, a3
                  fmin.s       ft4, fa3, ft6
                  sra          t0, a3, s5
                  sltu         s1, s7, t2
                  fclass.s     zero, fs3
                  fsgnjx.s     fs2, fs6, fs0
                  rem          a4, sp, a4
                  fdiv.s       fs5, ft3, fs10
                  sltiu        gp, t1, 1756
                  srli         t2, s3, 16
                  sltu         t5, s0, tp
                  fcvt.s.wu    ft8, t4
                  fmin.s       ft1, fs3, ft1
                  auipc        s2, 611447
                  slli         t5, s9, 16
                  srai         t4, a7, 13
                  fsqrt.s      fa7, fa6
                  sub          ra, s10, s10
                  fsgnjx.s     ft11, ft8, ft4
                  div          tp, s6, s9
                  addi         s7, a1, -420
                  fmin.s       fa2, fs3, fs1
                  fsgnj.s      fa7, ft1, fa5
                  srli         sp, t4, 1
                  ori          a1, sp, 133
                  fcvt.s.wu    ft11, t3
                  addi         t4, ra, 1359
                  srai         s8, a1, 26
                  mulh         s1, t2, s11
                  lui          s6, 437937
                  mul          ra, s3, a3
                  add          gp, a1, a0
                  fcvt.s.w     ft6, t6
                  sltu         s11, s8, a7
                  srli         t6, a4, 18
                  fcvt.wu.s    t4, fs6
                  fsqrt.s      fa0, fa0, rne
                  fmv.x.w      a2, ft3
                  addi         s6, a6, -935
                  ori          s0, s6, -737
                  fadd.s       ft6, fs4, fa3
                  divu         zero, a1, a0
                  fsqrt.s      fs3, fa0, rdn
                  fmv.x.w      s5, ft5
                  fmin.s       ft3, ft3, ft2
                  mulh         t6, t3, t1
                  xor          t5, s6, s6
                  sltiu        s1, a5, 543
                  andi         t0, a3, -1179
                  slt          a0, sp, t5
                  fmul.s       fa3, fs10, fs0, rup
                  fcvt.w.s     t0, ft6, rdn
                  divu         t0, s7, a5
                  xori         s1, a0, 1714
                  mulh         ra, t0, s4
                  xor          s7, a3, s8
                  srl          s1, a1, t3
                  fcvt.s.w     fs10, s11, rup
                  fcvt.s.w     ft7, t6
                  remu         t1, t0, s3
                  slti         s7, s11, 1781
                  fle.s        s11, fs0, ft8
                  rem          s3, a7, s0
                  fcvt.w.s     a3, fa2, rne
                  fmul.s       ft4, fa3, ft6
                  sltu         ra, t4, t5
                  sltiu        a2, a6, 333
                  fle.s        a4, ft0, ft6
                  fmul.s       fs6, fs7, ft10, rdn
                  auipc        s10, 40869
                  sll          a3, t0, s3
                  addi         t0, a3, 368
                  fmax.s       ft7, fs7, fs8
                  remu         a1, s7, s6
                  fcvt.wu.s    s5, ft5, rdn
                  slt          tp, t0, t4
                  sltiu        sp, zero, -706
                  feq.s        s1, ft4, fs5
                  rem          s1, sp, s9
                  mulhu        s3, a0, t4
                  add          s7, s1, s11
                  and          a2, a0, t5
                  fmul.s       fa5, fs7, ft1
                  slti         a4, s0, -1757
                  srli         zero, t5, 9
                  mulh         t5, gp, t4
                  fmv.w.x      fs1, a5
                  fsgnjx.s     fs0, fa6, fs7
                  div          tp, a3, a5
                  fcvt.w.s     s3, fa1, rup
                  div          s2, a7, t1
                  fcvt.w.s     s2, fs9
                  mulh         t4, tp, s9
                  fmv.x.w      s1, ft5
                  sub          t1, t5, t2
                  div          sp, a1, s2
                  addi         a2, s10, 122
                  xor          s11, ra, s1
                  fsub.s       fa2, ft10, fa4
                  or           s7, s2, ra
                  srli         s7, t1, 29
                  mul          a3, s5, s5
                  fmin.s       fs9, fs5, fa4
                  nop
                  add          a1, a1, s10
                  rem          s2, tp, a0
                  fsgnj.s      fa6, ft5, fs0
                  lui          tp, 241545
                  sltiu        a0, t6, 133
                  fcvt.s.w     ft3, s9, rtz
                  srli         t6, t5, 28
                  srl          a4, tp, a1
                  and          s7, s7, s5
                  sll          ra, t3, a2
                  addi         a1, t0, 253
                  divu         gp, a3, t0
                  slti         a7, t3, -1895
                  add          a4, s2, a0
                  mulh         s3, s4, s10
                  ori          a2, s9, -206
                  mulhu        t3, a5, s9
                  and          t1, s4, s0
                  sltiu        a2, t2, 2023
                  slt          t6, s9, a2
                  ori          zero, s6, 790
                  fclass.s     t1, ft9
                  mulhsu       s11, s4, t2
                  auipc        s1, 181319
                  srli         t1, s0, 9
                  feq.s        a3, ft5, fs10
                  fsqrt.s      fs5, fa4, rup
                  fadd.s       fa3, fa4, ft8, rup
                  mulhu        a4, s11, s1
                  fsgnj.s      ft6, fs4, ft3
                  fadd.s       fs10, ft7, fa4, rne
                  fmv.w.x      fs5, s8
                  addi         s2, a0, -1203
                  xori         s2, s10, 720
                  fmin.s       ft9, fa4, ft2
                  andi         a1, t5, -1593
                  mulh         t1, t3, s4
                  fsqrt.s      ft4, ft0, rup
                  mulh         s5, zero, t5
                  ori          s5, s0, 469
                  fcvt.wu.s    t4, ft10
                  mulh         s6, sp, s3
                  auipc        t1, 952
                  sll          t4, a6, s4
                  flt.s        s7, ft0, ft1
                  fsqrt.s      ft3, ft3
                  srli         s11, a7, 16
                  fmax.s       fa7, ft11, fs1
                  slti         t6, a0, 2025
                  addi         a2, t6, -45
                  mulhsu       t3, s3, t5
                  ori          a0, t0, -1872
                  fsgnjx.s     fs11, fs9, ft11
                  fclass.s     s6, fs5
                  fcvt.s.w     fs0, a6
                  fcvt.wu.s    s3, fs2, rup
                  fmv.x.w      gp, ft10
                  rem          s8, s0, a6
                  flt.s        t2, fa4, fs0
                  fclass.s     s2, ft0
                  addi         a5, t6, 1184
                  sll          t0, s1, s5
                  mulhu        s5, s6, s7
                  fcvt.wu.s    t6, fs3
                  fle.s        s8, fa0, ft4
                  slt          tp, a0, s2
                  fcvt.s.wu    fs1, a0, rtz
                  rem          t2, zero, ra
                  fmax.s       ft3, fs8, fs7
                  fmul.s       ft6, ft5, ft6, rdn
                  xori         a1, s10, -520
                  flt.s        s6, ft5, fs2
                  nop
                  sll          s1, a1, t3
                  fadd.s       ft8, fs7, fa0, rtz
                  fmul.s       ft9, ft3, ft4, rdn
                  fsgnjx.s     fa2, fa6, fs0
                  srli         t0, a3, 21
                  srli         gp, a4, 29
                  fdiv.s       fa0, fa5, fs3
                  xor          s10, a0, a2
                  mulhu        s3, a0, sp
                  fmin.s       fs2, fs7, fs11
                  sltiu        s5, a5, -1833
                  auipc        s1, 835065
                  sltu         s10, s10, t2
                  div          a2, zero, t3
                  fadd.s       fs9, ft5, ft4, rdn
                  sub          t2, a3, s11
                  add          s1, s7, s1
                  fdiv.s       fa0, ft3, ft3
                  lui          a1, 11173
                  srai         t5, a7, 15
                  nop
                  slt          a5, s4, a2
                  fsgnjx.s     fa5, ft0, ft11
                  flt.s        t3, fa2, fs8
                  div          ra, s4, s4
                  fcvt.s.wu    fs3, s3, rne
                  mulh         a4, a4, a5
                  slli         tp, s0, 18
                  srl          tp, a2, s7
                  fsgnjx.s     ft0, ft6, fs3
                  fmax.s       fs7, fs9, fs4
                  fmax.s       ft11, ft11, fa4
                  slli         sp, s7, 6
                  and          tp, s10, tp
                  div          t2, a6, tp
                  fmax.s       fs7, fs6, ft6
                  sll          t2, t1, a1
                  andi         a2, a1, 1692
                  remu         t5, zero, s5
                  divu         t4, a0, a6
                  fdiv.s       fs1, fa6, ft1
                  nop
                  add          a4, s0, s8
                  remu         s2, s10, t5
                  fcvt.s.w     ft6, s11
                  fmin.s       fa1, ft7, fs9
                  mul          gp, a1, s4
                  remu         t2, s8, tp
                  slt          t3, s11, s6
                  fle.s        ra, fa1, fs7
                  xor          s7, t1, ra
                  mulh         a4, s8, a5
                  fdiv.s       ft4, fs10, ft9
                  feq.s        t4, ft10, ft5
                  divu         a7, zero, s5
                  fsgnjx.s     fs11, fa6, ft3
                  or           ra, t5, s6
                  fmv.w.x      fa3, t4
                  sll          t2, tp, s1
                  fcvt.w.s     a2, fa4, rup
                  slt          a0, s4, t2
                  mulhsu       t3, t3, s6
                  mul          ra, t4, t2
                  sub          t1, ra, zero
                  add          a7, s11, a2
                  addi         a0, a1, 1851
                  add          ra, s11, a0
                  fmin.s       fs0, fa5, ft10
                  mulhu        t1, a0, s0
                  fmul.s       fa4, fs8, fs4, rmm
                  rem          t2, a7, a2
                  fsgnjn.s     ft6, ft3, ft7
                  div          a0, gp, ra
                  fsgnjn.s     ft3, ft0, fs6
                  fcvt.s.wu    ft11, ra, rdn
                  rem          zero, a5, t5
                  add          a2, a7, a2
                  mulhsu       t2, s3, s4
                  divu         a3, a0, s9
                  rem          s7, s6, s0
                  fcvt.w.s     gp, fa6, rtz
                  remu         t5, a4, a6
                  fadd.s       ft11, ft6, fa7, rmm
                  srli         t5, tp, 19
                  fcvt.s.wu    ft10, a3
                  sra          s7, a1, t6
                  mulhu        a1, a0, a1
                  rem          s1, a0, s2
                  fcvt.s.wu    ft8, zero, rmm
                  fmv.x.w      t2, ft10
                  sub          t6, s9, s11
                  add          tp, s6, t1
                  mulh         t2, a6, zero
                  flt.s        a3, ft6, fs2
                  ori          gp, t0, 951
                  divu         zero, a2, s8
                  fcvt.s.wu    ft4, s4
                  fmv.x.w      zero, fa1
                  sll          t0, s4, a2
                  divu         s3, tp, s6
                  fcvt.w.s     s6, ft0, rtz
                  remu         sp, s9, s6
                  mulhsu       gp, a1, s3
                  srai         s8, t6, 14
                  sra          t3, ra, s6
                  sll          a2, sp, s2
                  rem          s2, ra, t3
                  fsgnjn.s     fs10, fs2, fa6
                  fmv.w.x      fa2, s8
                  and          a5, s9, sp
                  fmv.w.x      fs11, t4
                  div          t3, zero, zero
                  slt          t2, s11, s7
                  slti         a3, t5, -602
                  srl          gp, a5, ra
                  fsgnjn.s     fa1, fa1, fa1
                  fmv.x.w      t3, fs0
                  or           s0, t4, s5
                  fsgnj.s      fs0, fa1, ft9
                  fcvt.s.w     fs3, ra, rmm
                  fcvt.s.w     ft5, t0
                  rem          t6, t6, a0
                  ori          a1, s1, -15
                  mulh         t3, s9, s8
                  feq.s        s1, fa0, fs11
                  srli         a0, a5, 6
                  fle.s        a7, fs8, fa6
                  fsub.s       fa2, ft9, fs3
                  remu         s0, t0, a1
                  fclass.s     a0, fs2
                  mulhu        t3, a5, a3
                  mulhu        t0, s3, t0
                  fsub.s       fs7, fs6, ft4, rup
                  fadd.s       fs9, fs8, fs6
                  or           zero, t5, t4
                  srl          t3, a2, sp
                  fsgnj.s      fs9, ft7, fs8
                  mul          a2, s10, s4
                  srli         a7, s2, 16
                  sltiu        ra, s7, 968
                  mulh         s0, t2, t6
                  fle.s        a5, ft7, ft10
                  fle.s        a1, ft6, ft8
                  or           s3, t5, a5
                  fsqrt.s      fs4, ft0, rtz
                  add          a1, a5, s4
                  fmin.s       fs0, fs5, ft11
                  srli         s6, s10, 4
                  fsgnjn.s     fa7, ft8, fa1
                  fmv.x.w      s6, fa5
                  sra          t3, a3, s10
                  fsgnjx.s     ft2, fa7, fs7
                  fclass.s     t2, fs0
                  fcvt.s.w     fs1, s8, rtz
                  fsqrt.s      fs4, ft1
                  fdiv.s       fs1, ft6, ft7
                  fsgnj.s      ft0, fs7, fs7
                  mulh         t6, a2, t2
                  slti         t0, s6, -689
                  xori         s11, ra, -2009
                  flt.s        s11, fs5, fa2
                  fsgnjn.s     ft6, fa4, ft5
                  sltiu        s5, t1, 235
                  fclass.s     t4, fa6
                  nop
                  andi         s0, s7, 144
                  srai         s2, a5, 27
                  xori         s0, t4, 1465
                  slli         a4, s7, 19
                  auipc        a0, 962406
                  mulhsu       t6, s7, a1
                  addi         s8, s0, 969
                  fcvt.wu.s    s6, ft0
                  fmax.s       fa3, fs1, ft2
                  fadd.s       fs5, fs4, fa5
                  mulhsu       t0, t0, t2
                  feq.s        t5, fs2, fs1
                  sub          a2, a7, s1
                  andi         s11, t1, 669
                  sub          a3, s3, a3
                  nop
                  sltiu        s8, a6, -1877
                  mulhsu       s6, s11, a0
                  sra          s10, a6, s9
                  fcvt.s.wu    fa3, s8
                  fcvt.s.w     ft3, a4
                  srl          s2, s7, s2
                  auipc        t3, 377132
                  remu         ra, s6, a4
                  mulhu        zero, a1, t3
                  sra          a7, t4, t1
                  flt.s        t5, ft5, fs0
                  or           a7, s3, a2
                  mulhu        a4, s0, sp
                  rem          s8, tp, s3
                  rem          sp, s4, sp
                  feq.s        s5, fs10, ft10
                  fmul.s       fa1, fa7, ft3
                  ori          s11, s3, -617
                  andi         s10, zero, 1505
                  slli         s5, a0, 14
                  srli         sp, a6, 5
                  fmax.s       fa7, ft4, fs10
                  slti         s2, t0, 1982
                  sltu         t0, a1, t1
                  slti         t0, s2, -1111
                  ori          s0, s6, 1038
                  div          s10, s8, a7
                  rem          sp, s8, s0
                  srai         ra, s0, 5
                  fmv.x.w      t1, ft3
                  fsqrt.s      ft2, ft5
                  fmv.w.x      fs6, a5
                  flt.s        a1, ft3, ft11
                  div          s10, s4, a2
                  ori          s1, s6, 1298
                  mulh         t0, s9, t3
                  xori         a3, s11, -579
                  srl          t5, s9, gp
                  mulh         s5, a5, s0
                  srai         s10, sp, 6
                  mul          tp, s0, s3
                  fcvt.w.s     zero, fs1, rtz
                  fcvt.w.s     t0, ft2
                  slti         t6, s7, 1235
                  srl          a2, t5, zero
                  or           sp, s8, s3
                  nop
                  andi         t0, t1, -1360
                  fsgnjx.s     fs2, fs3, fa7
                  fdiv.s       fs4, fa1, ft8
                  mulhu        s6, a0, s0
                  fcvt.w.s     a7, ft2
                  fmin.s       ft8, fs1, fs10
                  sltu         s6, t3, a3
                  lui          a3, 496173
                  slt          tp, t4, s7
                  fcvt.wu.s    s1, fa0, rne
                  mulh         s8, ra, a1
                  fmin.s       ft10, ft9, fs5
                  fmin.s       fs9, ft9, fs5
                  srli         s6, a1, 15
                  fsgnj.s      fs0, ft6, ft2
                  sra          gp, ra, s3
                  srai         s0, s3, 19
                  srl          a0, s4, s2
                  fdiv.s       fa6, fa6, fs5
                  add          t6, s4, s11
                  div          ra, a2, t0
                  xori         a7, s10, -1511
                  remu         a7, s9, s8
                  or           t6, a4, gp
                  slti         ra, a1, -62
                  or           s5, s1, a3
                  srli         tp, a0, 5
                  xor          s7, t4, t6
                  fle.s        s11, fa1, fs9
                  fmax.s       ft2, ft7, ft9
                  ori          a7, a4, -54
                  fsgnjx.s     fs4, ft0, ft8
                  fsqrt.s      ft7, fa5, rup
                  mulhsu       t2, s8, a0
                  fsub.s       fs9, fs11, ft1
                  fcvt.s.w     fs11, a0
                  flt.s        s0, fa2, fs1
                  divu         s7, s6, a1
                  fdiv.s       fs3, ft1, fs9, rtz
                  remu         a3, t6, t4
                  xor          a2, s3, s0
                  sra          t6, a0, s4
                  sltu         s1, sp, ra
                  fsgnjn.s     fs6, fs9, ft8
                  fmv.x.w      a1, fa6
                  fmv.x.w      zero, fs8
                  fadd.s       fa0, ft6, ft4
                  auipc        s7, 282281
                  andi         s8, gp, -469
                  fmin.s       ft9, fs4, ft7
                  rem          ra, a7, s8
                  or           t2, s11, t2
                  srai         t0, s7, 6
                  mulhu        t4, s7, zero
                  slli         a0, zero, 19
                  auipc        t1, 556375
                  remu         a7, tp, s6
                  mulhu        a0, a4, a5
                  fmax.s       ft6, fs7, fa5
                  feq.s        s6, fs3, ft4
                  lui          s0, 949203
                  mulhu        zero, a7, a2
                  mul          s3, s4, s11
                  fmin.s       ft0, fa7, fs2
                  fle.s        ra, ft0, fs6
                  xor          s2, s11, a6
                  ori          t3, gp, -1871
                  fcvt.s.wu    fa0, sp
                  mulhsu       a0, s3, zero
                  srl          t2, t1, t5
                  addi         t2, a5, 1434
                  slli         s8, s11, 14
                  sltu         a1, a7, a7
                  srai         t5, a0, 20
                  sltu         s1, s3, a7
                  sra          s6, t0, ra
                  sub          a1, gp, a0
                  fsqrt.s      fs8, ft10
                  mulh         t5, s9, sp
                  addi         s10, tp, -228
                  srli         t5, t4, 21
                  fle.s        sp, fs5, fa6
                  srli         a7, t2, 24
                  fcvt.w.s     s0, fs3
                  fsgnj.s      fa7, ft8, ft7
                  mulhu        t1, sp, a4
                  slt          t1, t5, a0
                  flt.s        t0, ft0, fs11
                  fsgnj.s      fs4, ft3, fa7
                  andi         t1, s4, -1881
                  fcvt.s.w     fa4, sp, rup
                  sub          s8, a1, t3
                  fmv.w.x      fs10, t0
                  sltiu        ra, s11, -223
                  xori         s10, a5, 1609
                  andi         t2, s5, 816
                  feq.s        s3, ft6, fs3
                  mulh         s5, s9, s8
                  fmv.w.x      fs3, t6
                  slti         s7, s1, 1423
                  fsgnjn.s     ft2, ft3, fs2
                  divu         tp, a7, t0
                  mulhsu       s5, t0, a6
                  srl          s1, t5, a5
                  and          a5, t4, a7
                  fcvt.w.s     a7, fs10
                  sra          s7, a1, t3
                  sltiu        s3, a4, 81
                  mulhsu       a0, s1, a1
                  xori         gp, a2, -1102
                  fdiv.s       fa0, fa1, fa7, rdn
                  mulh         a4, a3, a5
                  and          tp, s5, s1
                  xori         a4, t0, -683
                  mulh         gp, a6, ra
                  auipc        a3, 673439
                  mulhu        s3, s8, a0
                  remu         tp, tp, s4
                  addi         a0, t2, 1597
                  mulhsu       s8, s9, tp
                  mulh         a3, tp, a6
                  mulh         ra, a4, s7
                  fcvt.s.wu    fs5, ra
                  ori          a0, ra, 930
                  fle.s        zero, fs5, ft1
                  srl          t4, s11, a6
                  srai         s8, s0, 11
                  fsgnjx.s     fs11, ft3, ft4
                  slt          s11, s6, a3
                  sub          s6, a3, t1
                  div          t1, ra, s8
                  fsub.s       ft5, ft1, fs5
                  xor          t6, t6, t1
                  srli         s10, s10, 21
                  ori          s10, a4, 599
                  fmin.s       ft4, ft9, fs6
                  feq.s        zero, fa0, fa1
                  div          s5, a1, s11
                  srli         s5, s8, 8
                  rem          s0, a2, t6
                  add          s5, a4, a1
                  div          s6, t3, tp
                  ori          t4, t3, 862
                  sra          a7, a7, s6
                  fmv.w.x      fs4, t4
                  mulhsu       tp, a4, ra
                  or           t2, a3, tp
                  fsgnjx.s     ft9, ft1, fs7
                  sra          a7, s8, s1
                  fmax.s       fs9, fa7, fa4
                  fmin.s       fa7, fs2, fs11
                  sub          s10, s7, s4
                  addi         a2, a2, 1780
                  nop
                  divu         t6, a5, s1
                  xori         s0, t1, -1147
                  feq.s        gp, ft8, ft10
                  srl          a5, t6, a7
                  slli         s1, s2, 19
                  fdiv.s       fs11, ft4, fs6, rdn
                  and          gp, a6, t6
                  fmul.s       ft11, fs1, ft11
                  auipc        tp, 75277
                  or           s3, s11, s7
                  mulhu        s5, s9, t1
                  srl          s10, a2, s1
                  mulhsu       a1, s10, s6
                  sll          s8, s4, s2
                  lui          s10, 283559
                  sra          t5, t4, zero
                  fcvt.wu.s    ra, ft5, rdn
                  divu         a4, a3, a2
                  srli         ra, t2, 25
                  fsub.s       fa7, fs7, fs3
                  slti         a2, tp, -1502
                  fadd.s       ft3, fs1, fs4
                  nop
                  fsgnjn.s     fs10, ft8, fs5
                  srai         s5, tp, 2
                  srai         s11, a5, 18
                  fsub.s       fs10, fs9, ft4
                  sltiu        sp, a0, -763
                  srai         s6, a6, 13
                  mulh         ra, s9, zero
                  fclass.s     t3, fa0
                  fsgnjn.s     fs7, fs11, fs7
                  fmv.x.w      t2, fa7
                  fmv.x.w      a2, fs6
                  srai         s2, t3, 3
                  auipc        zero, 1009530
                  auipc        t6, 105969
                  srl          t5, a7, s0
                  slt          s7, a1, t3
                  fmax.s       fa6, fa5, fs2
                  fsgnjn.s     fa6, ft3, ft7
                  sltiu        t5, t6, -709
                  auipc        a3, 615646
                  slt          zero, ra, a7
                  nop
                  divu         t2, s6, s6
                  fadd.s       ft9, fa0, fs8, rne
                  fle.s        t0, ft1, ft4
                  sra          a4, s10, s11
                  fmin.s       ft2, fs10, ft2
                  fmul.s       fa2, fs9, fa2, rup
                  fle.s        t4, ft0, fa2
                  sll          s1, a3, s10
                  slli         s1, a5, 15
                  mulhu        s10, s5, t6
                  remu         tp, gp, gp
                  fsqrt.s      ft2, fs4
                  xor          t2, t1, s6
                  add          t4, a1, s1
                  feq.s        s3, ft7, fs3
                  srl          a2, a1, gp
                  fsgnjn.s     fa7, ft9, ft3
                  feq.s        a5, fa5, ft7
                  fcvt.s.wu    ft4, s11, rup
                  or           t5, t2, s4
                  sra          s7, zero, s7
                  fsqrt.s      ft6, fs8, rtz
                  srai         t4, s7, 20
                  divu         a1, a7, t4
                  fadd.s       fs10, fs3, fa3
                  fmul.s       fs11, ft3, ft1
                  divu         a3, s3, s9
                  fclass.s     a0, ft7
                  slli         tp, s5, 8
                  xor          s2, s4, zero
                  sltu         ra, s3, zero
                  fadd.s       fs6, fa2, fs2, rup
                  sll          s11, a2, s11
                  xor          a7, ra, a5
                  fdiv.s       ft6, fa5, fs3, rup
                  andi         s3, s4, -1053
                  xori         t6, s3, -594
                  fmax.s       fs7, ft0, fa4
                  div          s2, s1, gp
                  fmv.w.x      fs5, a3
                  fmv.x.w      zero, fs8
                  flt.s        s1, ft0, ft9
                  fsqrt.s      ft5, ft7, rmm
                  fsgnjx.s     fs2, fa7, fa0
                  fcvt.wu.s    s7, ft3
                  fle.s        a3, fs10, ft3
                  fcvt.s.w     ft3, t2
                  add          a0, tp, gp
                  fle.s        t4, fs10, fs6
                  flt.s        t0, fs10, fs10
                  sltiu        t3, s9, 161
                  sltiu        ra, s6, 1686
                  sra          sp, a3, t4
                  ori          s7, t1, -1840
                  xori         s6, t3, 1024
                  sub          t1, s9, s2
                  addi         a5, s8, 827
                  slli         a0, t5, 31
                  fsgnjn.s     fs4, fs6, ft5
                  and          sp, a2, tp
                  xori         s5, a6, 1514
                  mulh         gp, gp, s9
                  and          zero, s0, sp
                  sltiu        s0, a2, 242
                  fcvt.w.s     s2, fs4
                  flt.s        a5, fs11, ft1
                  fcvt.s.wu    fs1, s9, rne
                  fsqrt.s      fs7, ft6, rtz
                  or           a2, s1, t0
                  fmv.x.w      s10, fa4
                  fmul.s       fs9, ft8, fa6
                  or           a5, s4, s8
                  mulhu        t4, t4, a7
                  divu         t1, a4, sp
                  fadd.s       fa1, fa1, fa1
                  auipc        a2, 25086
                  fadd.s       fs11, fa4, fs0, rtz
                  fsgnjn.s     fa2, ft9, fs1
                  rem          t5, gp, s1
                  slli         gp, ra, 24
                  mulh         s10, zero, s5
                  addi         a5, a5, 559
                  fclass.s     ra, fs1
                  srl          s3, a0, t6
                  sra          s1, a6, a7
                  fcvt.s.w     fa3, a2, rup
                  fmv.w.x      fs6, a1
                  sltiu        gp, s7, -1441
                  addi         t5, s6, -1097
                  fle.s        t3, fs11, ft11
                  fmul.s       fa3, fs2, ft5, rdn
                  nop
                  mulhu        t4, s2, a5
                  remu         s11, t6, s0
                  fsgnjx.s     fs4, ft1, ft4
                  fsgnjn.s     fs3, ft8, ft6
                  srli         t0, tp, 31
                  remu         gp, s1, s9
                  fmul.s       fa6, fa0, fs8, rup
                  sltiu        s1, zero, -185
                  srl          s2, t5, s1
                  sltu         s5, t5, a2
                  andi         a0, t2, -960
                  fcvt.wu.s    ra, ft7
                  mulhu        t2, s7, t1
                  auipc        tp, 1022560
                  fcvt.s.wu    fs1, t3
                  divu         t0, a5, sp
                  sltiu        sp, tp, -1423
                  sltu         s7, s3, a0
                  mulhu        t4, s6, t3
                  div          a1, s10, t0
                  sll          a2, gp, a5
                  and          a7, tp, s6
                  lui          s2, 890970
                  fsgnj.s      fs0, ft4, ft11
                  or           t0, s4, a1
                  sub          ra, s11, zero
                  and          t0, t0, a7
                  sra          a0, a0, s3
                  rem          s10, t0, s1
                  fcvt.w.s     s6, ft3, rdn
                  fmv.x.w      a4, fa7
                  fsub.s       ft5, ft4, ft0
                  nop
                  fmv.w.x      fs0, gp
                  flt.s        ra, fa7, ft8
                  fcvt.wu.s    t2, fs3
                  remu         s7, s3, s7
                  rem          ra, s3, s10
                  remu         tp, a4, s0
                  mulhu        t0, a0, t4
                  fle.s        t1, ft1, fs2
                  fcvt.w.s     t5, fs1
                  div          t2, zero, s0
                  srai         t4, s1, 16
                  div          a5, s6, a2
                  fmul.s       fs10, fa6, ft4, rup
                  div          a3, a0, t1
                  fsub.s       fs10, ft9, ft5, rtz
                  slli         t2, t2, 5
                  fcvt.wu.s    t6, fs0, rup
                  feq.s        a0, fa3, fs3
                  sra          a7, t2, s2
                  auipc        ra, 469057
                  fle.s        s0, fs11, fs9
                  sra          s11, zero, a6
                  sltu         s7, s9, a3
                  mulh         a2, t1, a6
                  lui          gp, 177616
                  mul          zero, s6, t4
                  fmv.w.x      fs10, tp
                  fcvt.s.w     fa7, a7, rtz
                  fcvt.s.w     fa7, s5, rtz
                  fle.s        tp, ft1, ft11
                  sra          ra, t2, s8
                  fmul.s       ft10, ft4, fa1, rup
                  srli         s6, s1, 6
                  fcvt.wu.s    a0, ft10
                  sub          t5, a1, t6
                  mul          s0, sp, t5
                  or           s3, t4, a0
                  fsgnjn.s     fa1, fs4, ft2
                  remu         t6, a6, a7
                  fsqrt.s      fa5, ft11, rdn
                  mulh         tp, zero, sp
                  fdiv.s       fs11, fs1, ft8, rtz
                  fdiv.s       fa0, fs10, ft4
                  slt          a4, t4, a6
                  flt.s        s10, ft10, fa7
                  addi         s7, t2, 444
                  srai         t4, s2, 25
                  fsqrt.s      fa1, ft4, rdn
                  srli         s5, sp, 28
                  sub          tp, s6, s1
                  sltu         a4, sp, a4
                  fcvt.wu.s    a5, fa7, rne
                  fcvt.wu.s    t3, ft1, rne
                  fmv.w.x      fa2, s6
                  srli         s3, a6, 19
                  fsgnj.s      fs5, fa3, ft2
                  fmul.s       fa0, fa6, ft4, rdn
                  mulhu        t0, a3, s3
                  fcvt.s.w     ft3, ra
                  sub          s7, a0, t1
                  divu         t6, s10, t4
                  fcvt.s.wu    fs8, s3, rne
                  mul          t2, a0, a7
                  fsgnj.s      ft2, fa2, fa5
                  fdiv.s       fs2, ft6, fs8
                  mulh         a4, a7, a7
                  fclass.s     gp, fs6
                  fsgnjn.s     ft2, fs4, fs9
                  fmv.x.w      s3, fa6
                  ori          t2, t4, 916
                  feq.s        t1, ft10, fa1
                  fdiv.s       ft0, fs7, fa7, rtz
                  sub          gp, s9, s3
                  sltiu        t1, s2, -1597
                  fmv.w.x      ft8, gp
                  srai         tp, s4, 25
                  sltiu        s10, t2, 155
                  addi         a7, s11, -1798
                  fmin.s       ft1, fs11, ft0
                  fcvt.w.s     t6, fs7
                  fsgnjn.s     ft11, fa4, fs5
                  mulh         a3, t2, s2
                  and          s5, t5, a3
                  fclass.s     ra, ft8
                  remu         t1, s3, s1
                  sltu         t2, t1, s10
                  div          t4, a4, zero
                  fdiv.s       fs7, ft8, fa1, rup
                  fdiv.s       fa3, fs3, fa5
                  and          s11, a0, s6
                  ori          a0, s9, -2005
                  sltiu        t1, a1, 618
                  divu         s1, s3, a2
                  srli         t0, s4, 21
                  slt          gp, s5, s10
                  divu         s10, a6, s5
                  fle.s        t1, ft5, fa5
                  fcvt.wu.s    t6, ft0
                  fcvt.s.wu    ft11, a2, rtz
                  fclass.s     ra, fs6
                  mulhsu       t0, a4, s1
                  feq.s        ra, ft5, ft8
                  and          gp, t6, ra
                  flt.s        a1, fs6, fs10
                  divu         t2, s11, a3
                  sltiu        t1, s9, 1639
                  auipc        a2, 476258
                  mulhu        t4, a5, t4
                  fclass.s     s11, ft6
                  fcvt.w.s     t6, ft5
                  fsub.s       fa0, fs9, ft8
                  fmax.s       ft7, ft6, fs2
                  add          a2, s0, s7
                  add          s6, a5, ra
                  rem          s2, t6, a1
                  sub          a5, ra, t0
                  mul          a3, a3, t1
                  fmin.s       fs0, ft2, ft0
                  ori          tp, s2, 699
                  slti         t4, a0, -1924
                  ori          s2, s3, -111
                  sltu         a2, t6, t1
                  srl          s11, t1, s10
                  fcvt.w.s     a3, ft8
                  srl          s3, s6, s10
                  addi         a7, s3, -1765
                  and          s11, a5, s6
                  fsub.s       ft5, ft3, fs11
                  xori         tp, t5, -1601
                  srl          s1, t4, s11
                  add          s0, s10, ra
                  fmv.x.w      t5, fs2
                  fmax.s       fs0, fs10, fa4
                  fmul.s       ft11, fs7, fs5
                  fmv.x.w      s1, fs4
                  fsgnjn.s     fs11, fa6, fs8
                  lui          t6, 316122
                  fadd.s       fs7, fs10, fs0, rdn
                  mul          a0, s4, s9
                  srli         tp, a6, 17
                  fcvt.s.w     fa5, a1, rup
                  srli         zero, s11, 29
                  ori          s1, s2, -1730
                  addi         s11, a3, -1045
                  ori          s6, a1, -989
                  fsgnjx.s     fs3, ft7, fs2
                  fadd.s       fa0, fs3, ft2
                  addi         a5, s1, 1646
                  sltu         s6, t6, s7
                  andi         tp, s11, 1080
                  fmv.w.x      fs5, a1
                  lui          s7, 680465
                  sltiu        a1, s6, -64
                  fadd.s       fs9, fs2, fs4
                  mulhsu       t3, zero, s9
                  mul          tp, s1, s8
                  fcvt.s.wu    fs0, a3
                  lui          a3, 313353
                  add          a5, sp, a3
                  rem          s3, sp, s2
                  fmin.s       fs6, fs3, fa3
                  auipc        t6, 480324
                  fmul.s       ft4, fs8, fa5
                  flt.s        t6, fs2, ft4
                  auipc        a7, 103540
                  slti         s7, t2, 1882
                  fmv.x.w      t0, fs3
                  andi         gp, a3, 693
                  sltiu        s6, s4, -601
                  divu         s2, t2, gp
                  fmul.s       fs9, ft5, ft1, rne
                  slti         s1, gp, 1209
                  divu         s5, t1, a4
                  mulh         s2, t4, a6
                  div          s0, t3, tp
                  fmax.s       fs6, fs0, ft2
                  mul          a7, a3, a7
                  fsub.s       fs8, ft8, ft7, rtz
                  srai         s2, s9, 10
                  mulhu        t4, ra, s7
                  fcvt.wu.s    gp, ft2, rdn
                  lui          s7, 958998
                  fsqrt.s      fa5, fs9, rup
                  fcvt.s.wu    ft11, a7
                  lui          a5, 593747
                  fcvt.s.w     ft8, s10
                  fmax.s       fa6, fa7, fs8
                  fcvt.wu.s    ra, fa4, rne
                  fcvt.w.s     s5, fa7, rne
                  sltiu        t4, ra, 1099
                  addi         gp, a4, -136
                  fmin.s       fa1, fa5, fs6
                  ori          t6, s2, -195
                  fsqrt.s      fa1, ft6, rdn
                  fle.s        gp, ft11, fs6
                  slti         s0, s10, -1262
                  xori         s8, s1, 74
                  fsqrt.s      fa6, ft2
                  fsub.s       fs8, fs10, ft6, rmm
                  fmv.w.x      ft8, s6
                  fsgnjx.s     fs2, fs0, fs0
                  fmin.s       fa3, fs5, fs1
                  fmul.s       fs8, fs6, fs9, rtz
                  srl          a1, tp, a4
                  addi         s7, s4, 1466
                  fadd.s       ft10, fs1, fs4
                  sltiu        tp, s6, 1586
                  lui          t5, 693787
                  fdiv.s       fs10, fs8, fs5, rmm
                  mul          a1, a7, s7
                  lui          a5, 187233
                  remu         t3, s0, s11
                  slli         a0, s2, 29
                  ori          a7, s6, -1517
                  auipc        t4, 972763
                  feq.s        sp, fa0, ft6
                  auipc        s1, 635066
                  slti         ra, a2, 822
                  rem          s2, s8, t0
                  auipc        tp, 278346
                  slti         zero, s2, -1335
                  srli         s10, sp, 23
                  div          a2, s3, t2
                  fcvt.s.w     fs3, a7, rmm
                  fsqrt.s      ft10, fs0
                  addi         t1, sp, -65
                  slli         a4, s10, 14
                  fcvt.wu.s    t2, fs0
                  srai         zero, zero, 30
                  slti         t4, s4, 1759
                  ori          a3, t0, 1578
                  flt.s        t3, fs10, ft3
                  fle.s        gp, ft6, fs10
                  add          gp, sp, t3
                  slti         s5, t5, 577
                  sra          tp, s5, t4
                  or           t1, tp, a1
                  xori         a4, s9, 887
                  srl          s8, s6, zero
                  sub          a1, t0, a2
                  fclass.s     s10, fs9
                  remu         a7, a7, a3
                  fsgnjx.s     fs10, fa0, fs3
                  fmv.x.w      tp, fa7
                  slti         ra, gp, -1081
                  srl          s5, t3, t2
                  auipc        s2, 785160
                  mulhsu       a2, s3, a7
                  sub          t1, a7, a5
                  rem          tp, s0, sp
                  sltu         s0, s3, s1
                  or           t6, t4, gp
                  fsgnjx.s     ft0, ft6, fs9
                  fdiv.s       ft0, fa1, fa2
                  slti         a4, a1, 1602
                  fcvt.s.wu    fs8, s1, rtz
                  srai         s6, a2, 10
                  fmin.s       ft7, ft7, ft2
                  rem          ra, a0, s4
                  divu         t4, sp, s7
                  ori          s2, s11, 1679
                  mulhsu       s2, s7, s6
                  fsqrt.s      fs4, fa0, rdn
                  fcvt.w.s     t3, fa0
                  nop
                  sra          s6, zero, sp
                  lui          t4, 867293
                  fadd.s       ft6, fs1, ft4
                  fcvt.s.wu    ft5, ra
                  fle.s        s10, fs6, ft5
                  feq.s        s11, fs5, fs0
                  sub          sp, s10, a5
                  div          s0, t5, t5
                  fsub.s       fa6, fa6, ft7
                  remu         a2, ra, s2
                  sltiu        s10, s0, 1278
                  fcvt.s.wu    ft9, t0
                  rem          t6, s6, a4
                  fdiv.s       ft8, fs8, fs7
                  nop
                  nop
                  add          s6, sp, a2
                  div          t0, t5, t6
                  fmul.s       ft0, ft9, ft7
                  auipc        t2, 682584
                  fdiv.s       fs9, fa7, fa7
                  mul          s8, s5, s4
                  fdiv.s       fa0, fs6, ft10, rne
                  srli         s7, s5, 27
                  add          s0, gp, s3
                  fmul.s       fa7, fa4, ft11
                  srli         s1, t4, 11
                  nop
                  fcvt.w.s     s2, fs8, rne
                  xori         s10, a1, 1676
                  feq.s        a5, fs6, fs8
                  fsgnjx.s     ft0, ft0, fa3
                  div          a0, zero, t0
                  fsgnjx.s     fa5, ft4, fa7
                  mulh         s2, s4, s6
                  sltiu        a7, a1, -2005
                  nop
                  sltu         sp, a7, t4
                  sra          t5, t4, s5
                  lui          s1, 229848
                  fle.s        t4, fs1, ft6
                  remu         tp, t4, t1
                  andi         a4, s6, -1291
                  slti         zero, s0, -1209
                  lui          t6, 795826
                  srl          t6, t6, a0
                  mul          s11, s1, s6
                  fcvt.wu.s    t4, fs4
                  fsgnj.s      fs5, fa4, fa3
                  flt.s        t3, fa0, fa3
                  sll          s10, a0, a0
                  fsgnjx.s     fa0, fs9, fs3
                  fmax.s       fs4, fs4, fa3
                  xor          gp, s4, gp
                  sra          s2, sp, a6
                  srl          gp, t4, s1
                  mulh         s6, t4, s5
                  fclass.s     a1, fa6
                  lui          t1, 879319
                  and          s2, a3, zero
                  add          t6, s3, a1
                  srl          t5, t2, t6
                  fsub.s       ft10, ft6, fa5
                  addi         t4, s2, 1313
                  sll          s6, t2, ra
                  or           s2, t3, a5
                  mulh         t5, t2, sp
                  slti         t5, zero, -1741
                  and          a0, tp, zero
                  sltu         s11, sp, s4
                  flt.s        s8, fa3, fa4
                  xor          t3, a1, s5
                  nop
                  feq.s        a1, fs7, ft5
                  or           zero, zero, s6
                  sltiu        a3, t1, 963
                  remu         sp, zero, a0
                  mulhu        a2, t0, s8
                  ori          s10, t0, 13
                  nop
                  fsgnjx.s     ft0, ft3, fa5
                  fcvt.w.s     s6, fs0, rdn
                  srli         s1, s9, 26
                  div          s2, s2, a1
                  and          a3, t0, t4
                  sub          a1, a4, zero
                  remu         t6, a6, a0
                  sltu         t2, s11, t3
                  slli         ra, s3, 14
                  xor          t6, s3, s4
                  fadd.s       fs3, ft3, ft9
                  auipc        zero, 875898
                  lui          s7, 479024
                  or           s0, s4, s11
                  fdiv.s       fs2, fs6, fa6, rdn
                  fmax.s       ft2, ft8, ft8
                  fsgnjn.s     ft5, fa2, fa6
                  slli         t2, a6, 5
                  div          t5, t3, t2
                  fcvt.w.s     zero, fa1, rmm
                  fmv.w.x      ft4, a3
                  and          s8, zero, t4
                  srl          s0, t5, s4
                  srai         t3, s4, 31
                  fcvt.s.wu    ft4, a4, rup
                  fadd.s       ft7, ft6, fa0
                  fdiv.s       fs7, fs8, fs8
                  fsub.s       ft1, fs10, ft5, rne
                  srl          s6, s3, s8
                  xor          s0, t3, sp
                  sll          s6, sp, s11
                  feq.s        s2, fs1, fs3
                  mul          a2, s2, a6
                  ori          sp, a5, 57
                  fsqrt.s      fs3, ft4, rne
                  mulh         t2, a2, t0
                  andi         s2, a1, -945
                  divu         s3, t5, a0
                  andi         a2, a6, -795
                  mul          t3, a2, s10
                  sll          sp, t6, t4
                  fmv.w.x      fa1, s5
                  xori         zero, ra, 330
                  fsub.s       fs8, ft2, ft0, rtz
                  srli         s10, a0, 4
                  mulhsu       s3, a2, t2
                  fcvt.wu.s    a4, fs4, rne
                  mulh         a7, t0, s9
                  fmin.s       fa3, fa1, fa7
                  sra          s7, s6, tp
                  mulhu        s7, ra, s6
                  fcvt.s.wu    ft5, a4, rtz
                  fsgnj.s      fa7, fs0, ft6
                  srl          gp, a7, s1
                  srli         a4, a6, 3
                  slli         t2, a1, 26
                  slti         zero, tp, -629
                  div          gp, gp, a7
                  nop
                  fmv.w.x      ft5, t1
                  or           s6, tp, s0
                  add          t2, sp, a3
                  auipc        sp, 849533
                  fdiv.s       fa3, fs3, fa3
                  fdiv.s       fa6, fs6, fa0
                  fcvt.w.s     a1, fs9
                  fmax.s       fs9, fa1, ft10
                  nop
                  and          s5, s11, a7
                  fadd.s       fa7, fa5, ft8
                  fclass.s     s6, ft3
                  fsqrt.s      ft0, fa0, rdn
                  fsub.s       fs2, ft10, fs8, rup
                  nop
                  mulh         s2, t2, tp
                  sll          s8, s1, s0
                  mulh         a4, t0, a6
                  fcvt.s.wu    fs3, s0, rtz
                  div          t3, a5, a6
                  lui          a5, 786442
                  slli         s11, tp, 16
                  fcvt.s.wu    fa6, s1
                  mulhu        a7, s5, s2
                  addi         s11, a1, -1426
                  flt.s        a4, fa4, fa7
                  srl          a3, a6, t4
                  fsqrt.s      fa0, ft2
                  mul          s7, s5, tp
                  nop
                  divu         a3, s11, a2
                  fmv.w.x      fa1, zero
                  slli         a5, s5, 27
                  fmin.s       fa5, fs2, fa4
                  sltu         s3, sp, t0
                  srai         t5, s9, 29
                  fsub.s       fa5, fa6, fs4
                  fsgnjn.s     ft4, fa3, ft8
                  and          t2, a2, s2
                  divu         a0, a2, s11
                  srl          s2, s1, a1
                  div          zero, s4, gp
                  fmul.s       fs6, ft6, ft9, rtz
                  fsqrt.s      fs0, fa0, rup
                  ori          a1, a6, 396
                  srl          s11, s7, t4
                  or           a1, a4, t5
                  fsgnj.s      fs11, ft1, fs5
                  fmax.s       fs11, fs3, ft2
                  fclass.s     a0, fs2
                  fmax.s       fs0, fa1, ft9
                  fclass.s     a2, ft4
                  sra          zero, a7, t2
                  sra          tp, s0, a7
                  fsqrt.s      ft3, fs11
                  fsgnj.s      fs10, fs2, fa1
                  fsgnjx.s     fs5, fs6, ft8
                  mulhsu       a5, a3, s7
                  sll          zero, sp, a1
                  and          a3, s11, t3
                  mulh         tp, t6, a6
                  fsqrt.s      fa4, ft2
                  fcvt.wu.s    a1, ft10
                  nop
                  xori         a1, a3, -238
                  fmul.s       ft11, ft0, fs7, rmm
                  divu         a3, s6, gp
                  fmv.x.w      s1, ft3
                  fsgnjn.s     ft3, ft2, fs7
                  mulhsu       ra, s10, a0
                  fsgnjn.s     ft2, fs3, fs9
                  srli         t3, s7, 4
                  rem          tp, s4, gp
                  fcvt.s.wu    fs10, sp, rtz
                  mulhu        s1, a7, a2
                  fdiv.s       fs5, fs5, fa3, rmm
                  sub          a3, s11, t5
                  sltiu        t3, t5, -1086
                  and          s11, a2, a3
                  xori         a7, a5, -1813
                  slti         s8, s1, 1439
                  fsqrt.s      ft11, fs0, rne
                  nop
                  ori          s5, s7, 1596
                  fsgnj.s      fa6, ft11, fs7
                  sll          s6, gp, s1
                  fcvt.s.w     fs6, t0
                  fcvt.wu.s    s10, fs8, rup
                  and          s6, s8, t5
                  sll          s2, a7, t2
                  lui          s10, 131831
                  fle.s        s7, fa4, fa7
                  xori         s0, s11, 1422
                  sra          a3, s0, t2
                  fclass.s     s1, ft9
                  add          t6, a0, t3
                  fsgnjn.s     ft8, fs0, fs8
                  fmax.s       fa6, ft4, fa6
                  fdiv.s       fa7, ft8, fs5, rmm
                  andi         a5, sp, 2015
                  fsgnj.s      fs10, ft4, fs11
                  slti         s10, a3, 44
                  rem          a1, t5, a0
                  auipc        ra, 133791
                  fmul.s       fs0, fs4, ft2, rup
                  fsqrt.s      ft6, fs10, rup
                  fmax.s       fa3, fs0, fs1
                  fcvt.w.s     a2, ft7
                  feq.s        a4, fs7, ft9
                  fle.s        a7, fs8, fa4
                  slt          t6, sp, a7
                  add          t3, t6, tp
                  fle.s        gp, ft2, fs4
                  or           a2, t3, s4
                  ori          s10, s11, -1384
                  or           t6, t5, zero
                  slli         a7, s4, 21
                  mulh         tp, t3, s0
                  srli         a5, ra, 7
                  fcvt.s.w     ft6, s2, rdn
                  divu         s11, a1, a1
                  fmul.s       fa3, fs6, ft7, rup
                  div          t6, a7, t5
                  nop
                  fadd.s       ft7, fa7, fa7
                  xor          t3, s8, s3
                  or           sp, zero, s8
                  div          ra, t4, t0
                  mul          ra, t2, s7
                  sra          a0, s0, s1
                  sub          s0, a0, a0
                  slt          s3, s9, ra
                  addi         a3, s5, 703
                  addi         s6, s4, -1550
                  mulhsu       s10, a0, tp
                  and          t0, a3, s5
                  sub          t1, t3, t0
                  fcvt.w.s     s2, ft5, rne
                  add          t5, a7, zero
                  fadd.s       fa7, fa7, fa3
                  slli         tp, s0, 15
                  divu         s10, a7, s4
                  srli         s10, t5, 21
                  or           a7, s10, ra
                  ori          a1, tp, -1446
                  fsqrt.s      fs10, ft0
                  slti         ra, t1, 738
                  fmax.s       ft2, ft1, fa5
                  fmv.x.w      s3, fs8
                  fle.s        s7, ft1, ft6
                  fle.s        a0, fs5, fs1
                  fmv.x.w      t3, ft5
                  mul          s10, a1, a0
                  fsgnj.s      fa7, ft3, ft6
                  fmax.s       fa0, ft7, ft11
                  fmul.s       ft9, fs0, fs10, rne
                  ori          t3, a3, -1365
                  fsgnjx.s     fa7, fs4, fs11
                  mulh         s5, a2, t2
                  xor          s1, s6, t4
                  auipc        a2, 684317
                  fclass.s     gp, fs9
                  mul          s3, s4, a3
                  srli         s10, ra, 23
                  auipc        zero, 541915
                  fmin.s       fs11, ft4, fs1
                  mulhsu       s5, s11, t6
                  and          s3, t5, s2
                  fdiv.s       ft7, fs8, ft6, rtz
                  fadd.s       fa6, fs11, fa1
                  and          s1, gp, ra
                  mul          t3, s11, a0
                  fdiv.s       ft8, ft5, fa0
                  fcvt.w.s     zero, ft11, rup
                  xori         a7, t3, -19
                  and          a7, s1, a6
                  xori         t6, t1, -2044
                  fle.s        s3, fs10, fa4
                  fcvt.w.s     s11, fs8
                  ori          t5, ra, -917
                  feq.s        zero, fs3, fa7
                  xor          t0, a3, ra
                  or           s8, t6, t2
                  slli         s6, a2, 16
                  mul          t2, a0, s5
                  fmin.s       fs10, fs9, fs3
                  srli         t3, a4, 26
                  fsqrt.s      ft6, fa2, rup
                  fdiv.s       fa2, fs11, ft9
                  auipc        s3, 169806
                  fcvt.w.s     s0, fs10
                  xor          t3, s3, a4
                  fsqrt.s      fs4, fs1, rtz
                  ori          s7, a5, -1960
                  div          s0, a6, s11
                  fsgnjn.s     fa7, fs10, fs2
                  fmv.x.w      s11, ft10
                  fmv.x.w      a7, ft4
                  fsgnj.s      ft11, fs1, fa7
                  sll          s7, s6, a5
                  fclass.s     a2, fs10
                  sll          zero, a6, sp
                  xor          gp, a3, s10
                  flt.s        s7, ft4, fs0
                  fsub.s       ft8, ft0, fa0, rmm
                  fle.s        s2, fa7, fa1
                  divu         t1, gp, s0
                  fmul.s       ft4, fs0, fa6, rtz
                  fmv.x.w      s8, ft5
                  divu         tp, gp, a0
                  slti         t2, a7, -702
                  or           s7, a4, a7
                  slt          gp, a7, s7
                  fsub.s       ft9, fs1, fa4, rmm
                  fle.s        gp, fs0, fa3
                  mulhsu       t6, t4, gp
                  fsgnj.s      fa7, ft11, ft9
                  ori          s5, a5, -1268
                  ori          a7, s4, 682
                  srl          sp, a5, tp
                  lui          zero, 818927
                  sltu         s5, tp, s2
                  xor          a3, s7, s10
                  fcvt.s.wu    fs4, ra, rmm
                  div          s6, t0, ra
                  fdiv.s       fa6, fa2, ft0
                  nop
                  divu         gp, zero, s4
                  fcvt.s.wu    fs0, t3
                  fsgnjx.s     fs4, fs1, ft5
                  mulhsu       t6, a5, s2
                  slt          s11, a5, s7
                  fcvt.w.s     t1, ft3
                  sub          t4, a4, s9
                  add          s6, s10, a7
                  fmv.w.x      ft8, a2
                  fclass.s     a0, fs3
                  ori          t1, s4, 1193
                  fadd.s       fa5, fs6, fa1
                  slti         a5, a1, -353
                  fsgnj.s      ft0, fs4, fs6
                  xor          s7, a0, s8
                  fmax.s       fa7, fs10, fa6
                  xor          t5, a0, s2
                  fmv.w.x      fa6, ra
                  feq.s        t0, fa3, fa4
                  mul          gp, s3, s11
                  feq.s        s6, ft0, fs8
                  nop
                  remu         s8, t4, s2
                  fmv.w.x      ft2, sp
                  fsgnjx.s     fs9, fa3, ft3
                  remu         ra, a5, s6
                  flt.s        s10, ft10, fs10
                  feq.s        a4, ft6, fs5
                  flt.s        s1, fs9, fs1
                  ori          s6, zero, -1758
                  srli         gp, a2, 16
                  fmax.s       ft5, ft1, ft4
                  mulh         s6, s2, s6
                  slli         s10, t3, 8
                  fmul.s       fs0, fa1, ft1, rmm
                  feq.s        s10, fa4, ft2
                  xori         t3, t6, -1808
                  fmv.w.x      ft5, t6
                  sltu         s3, t6, s10
                  flt.s        t6, fa3, fa3
                  fsgnjx.s     ft4, fs4, fs11
                  flt.s        s2, fa3, ft11
                  fcvt.s.w     fs5, a0
                  div          t4, t5, s7
                  mulh         t1, a2, t2
                  sltiu        zero, t6, 1634
                  fadd.s       ft6, fs2, fs3
                  slti         s6, ra, 1800
                  fsgnjx.s     fs3, fs6, fs9
                  fmul.s       ft5, fa5, fs4, rtz
                  srli         a3, ra, 9
                  feq.s        s11, ft1, fa1
                  srl          s2, s5, a2
                  fsgnjn.s     ft6, ft3, fs4
                  sub          t2, s9, sp
                  srli         s10, s11, 22
                  slli         s8, a5, 15
                  feq.s        tp, ft9, fa2
                  divu         s8, t4, zero
                  andi         t0, s8, 520
                  feq.s        a4, fs2, ft6
                  fsgnjn.s     fa3, fs9, fa2
                  addi         t4, zero, -1786
                  fsgnj.s      fs1, ft4, ft4
                  fmin.s       fs4, ft2, fs5
                  and          t0, zero, a0
                  fmax.s       fs9, ft0, fs8
                  or           s2, ra, s7
                  rem          gp, s6, t6
                  fle.s        gp, fa5, fa5
                  sra          t0, t1, t0
                  fle.s        t5, fa1, fa2
                  fsub.s       fa2, ft9, fs9, rdn
                  mulhsu       zero, a4, gp
                  srl          a3, zero, s7
                  fsqrt.s      ft0, fa0, rtz
                  or           s3, s1, a5
                  and          s6, s6, t3
                  add          s11, a0, a7
                  sra          t6, s5, s6
                  divu         a1, s8, s9
                  andi         s2, s3, -1448
                  rem          s8, ra, a1
                  mulh         t3, sp, t6
                  fmv.w.x      ft3, a0
                  andi         t3, s7, -10
                  mulhu        s10, t4, s5
                  mulhsu       zero, a6, a5
                  sltu         t6, a4, a0
                  addi         s11, sp, -1321
                  slti         t0, t4, -1514
                  feq.s        t5, ft7, fa4
                  fmv.x.w      a0, fa1
                  fsgnj.s      ft1, fs9, fs9
                  fdiv.s       fa1, fa6, ft9
                  and          a1, s1, sp
                  slti         t4, t0, 274
                  mulh         a2, t5, s11
                  nop
                  and          s7, a6, sp
                  sltiu        s10, s5, -203
                  and          t6, s10, t2
                  add          t3, a6, sp
                  fmv.x.w      s8, ft3
                  fadd.s       fa0, fs10, fs3, rup
                  remu         s11, t0, a0
                  slli         t2, s2, 21
                  fcvt.wu.s    sp, ft2, rtz
                  xori         t1, a1, -351
                  lui          t2, 552344
                  fcvt.wu.s    a1, fa2
                  fdiv.s       fa1, ft6, fa7, rmm
                  fcvt.wu.s    s8, ft1, rtz
                  fmax.s       ft8, fs8, fs2
                  or           s6, s9, zero
                  remu         a3, sp, tp
                  fsub.s       fs10, ft2, fa0
                  slli         t3, s7, 24
                  fdiv.s       fs8, fs0, fa0, rne
                  addi         sp, t4, -1009
                  fcvt.wu.s    a0, ft3, rup
                  fmin.s       ft2, fa2, ft6
                  fmin.s       fa2, ft3, fs10
                  srli         a5, s10, 25
                  xori         t0, s8, -1706
                  fmul.s       fs3, ft7, fa1
                  fadd.s       fa1, ft0, fs7
                  sll          t3, gp, s10
                  fadd.s       ft7, fs6, fs2, rne
                  fdiv.s       fs4, fs2, fs0
                  fle.s        sp, fs3, fa0
                  fmin.s       fs9, fs1, ft3
                  fclass.s     t1, fa4
                  slt          s5, s3, s6
                  rem          s1, s8, s7
                  fle.s        t3, ft0, fs0
                  fsqrt.s      fa6, fa3, rne
                  fcvt.wu.s    s7, fa6
                  mulh         s7, t0, s7
                  add          ra, s1, s1
                  or           t1, s3, t5
                  fmin.s       ft0, fs8, ft6
                  mulhsu       a1, s8, a4
                  slt          s11, t3, s4
                  fmul.s       ft11, fs3, fs2, rtz
                  fcvt.wu.s    a3, fs0, rmm
                  fsgnj.s      fa4, fs6, fs7
                  divu         a5, a6, ra
                  sltiu        s8, t3, 1805
                  mulhu        tp, t2, s0
                  divu         s10, a7, zero
                  and          t0, s7, s0
                  and          t3, t0, s0
                  srl          sp, s8, tp
                  slt          s1, s1, s7
                  nop
                  mul          t1, zero, s2
                  fcvt.s.w     fs7, a6, rtz
                  sub          a3, s2, t4
                  lui          a3, 451560
                  fmax.s       fa0, fs6, fa3
                  fle.s        s0, fs4, ft3
                  mulhsu       s8, s9, t5
                  sra          ra, s10, a6
                  lui          t2, 297200
                  xori         t6, zero, -239
                  fmul.s       fs4, ft10, fa1, rne
                  fadd.s       ft9, ft7, fs8, rne
                  mul          s8, a3, s10
                  sltiu        a4, s3, -1170
                  add          t4, a6, sp
                  remu         sp, a4, a0
                  or           s7, a2, sp
                  rem          a0, s3, s9
                  lui          ra, 558942
                  mul          s6, tp, t5
                  fsqrt.s      fa6, ft5, rdn
                  fcvt.w.s     s1, fs6
                  divu         s2, ra, t4
                  andi         a2, s4, 1001
                  xori         zero, a0, -22
                  fdiv.s       ft5, fs1, ft6
                  slti         s1, t2, 798
                  fsgnj.s      fa5, ft7, fa1
                  srl          t1, s8, t1
                  fcvt.wu.s    gp, fa2, rdn
                  ori          s7, t3, -1328
                  fadd.s       fs10, ft4, fs4
                  sub          a1, a7, a3
                  xor          t6, s2, a3
                  fmin.s       fa2, ft1, fs4
                  mulh         s3, zero, t3
                  mulhu        s7, s11, a4
                  srl          t5, t0, zero
                  ori          tp, s11, -626
                  xori         a7, a1, -1911
                  fle.s        gp, ft7, fa0
                  mulhu        s7, s2, s4
                  sltu         s3, s1, s7
                  addi         a7, a3, -1574
                  fclass.s     t5, fs4
                  ori          s8, t3, 1392
                  ori          s8, gp, 285
                  srli         a3, s2, 12
                  fmv.w.x      fs11, s4
                  or           t3, t5, a3
                  mulhu        s7, a6, s1
                  xor          t4, s11, t6
                  fmul.s       fa3, fs11, ft11
                  fcvt.s.wu    fa2, s6, rdn
                  nop
                  xori         s8, sp, 853
                  fcvt.s.w     ft11, sp, rne
                  addi         s0, ra, -116
                  fclass.s     a3, ft9
                  feq.s        s7, ft2, ft1
                  srl          a5, s5, s10
                  mulhsu       a3, s8, a2
                  sltiu        s8, t1, 379
                  fmin.s       ft1, fs4, ft6
                  or           t6, s5, s8
                  fsgnjx.s     fa2, fs2, fs4
                  mul          t6, s11, a6
                  sra          s0, s8, a3
                  srli         t2, s6, 10
                  srai         s0, s11, 18
                  fmv.x.w      a4, ft0
                  fsqrt.s      fa1, ft11
                  sra          t4, s8, t0
                  and          a0, s6, s5
                  mulhu        t1, a7, t3
                  fle.s        tp, ft3, fa2
                  slli         s10, a0, 30
                  mulhsu       t6, gp, s9
                  mulh         t0, s0, a3
                  fsgnjn.s     ft2, fs11, fs0
                  fcvt.w.s     s10, fa3
                  fdiv.s       fs3, fa7, ft8
                  fmin.s       ft9, fs4, ft11
                  slti         a3, s2, -1229
                  lui          s6, 327037
                  fsqrt.s      fs8, fs9
                  sub          t5, t3, t4
                  lui          a0, 293992
                  fclass.s     t2, ft1
                  fle.s        s6, fs10, ft11
                  addi         t4, a5, -1811
                  srli         a0, s4, 3
                  nop
                  fcvt.wu.s    a2, fa7, rdn
                  mulh         t3, s7, gp
                  srai         a7, a7, 27
                  mul          a4, a6, a6
                  fdiv.s       fs8, fs0, fs9, rmm
                  fadd.s       ft7, fs10, fs11, rne
                  sltu         ra, a1, zero
                  divu         t1, t6, gp
                  fmin.s       fs7, ft1, ft7
                  fcvt.s.wu    fa1, t4, rup
                  div          s5, s5, a7
                  add          a4, t2, s2
                  flt.s        a5, fa1, fa2
                  fmv.x.w      t4, fs10
                  fmin.s       fs7, ft4, fa7
                  fmul.s       ft10, fs2, ft9, rup
                  slt          gp, tp, a6
                  fsgnjn.s     ft2, fs8, ft5
                  div          s0, s1, s8
                  andi         a5, a3, 1846
                  sltiu        tp, t1, -1654
                  fmv.x.w      gp, fa4
                  divu         s8, s10, a6
                  mulhsu       a0, s3, s4
                  sltiu        t0, s8, -2015
                  slti         s5, s6, -1008
                  fdiv.s       ft8, fs2, fa6
                  ori          t4, a5, -946
                  addi         t0, s7, -1533
                  fsgnj.s      ft4, fs11, fs7
                  fcvt.s.w     ft9, a1
                  fclass.s     t0, fa0
                  remu         s2, s8, t0
                  sra          s0, sp, s6
                  and          s6, t6, t1
                  xor          a2, a7, s10
                  fsgnj.s      ft11, ft6, ft3
                  srl          tp, a1, t1
                  fdiv.s       fs11, fa0, fs3, rdn
                  auipc        s7, 787592
                  fle.s        a4, fs4, fs5
                  fmv.w.x      ft1, a3
                  fsgnjx.s     ft1, fs6, ft8
                  fmin.s       fs0, fs6, fa2
                  auipc        s8, 594475
                  sll          gp, t2, s4
                  fsgnjx.s     fs2, fs8, fs1
                  fsgnjx.s     ft8, fa7, fs3
                  divu         a0, t4, a6
                  sub          a3, s6, sp
                  mulh         t2, s6, s5
                  mulhu        s1, tp, a2
                  fclass.s     a1, ft6
                  mulh         t2, s3, s8
                  slt          t4, s11, s9
                  fle.s        a2, ft6, fs5
                  fmv.x.w      t6, fs8
                  rem          s6, a1, a7
                  div          a0, s7, t4
                  sra          ra, a5, zero
                  div          s5, s9, a7
                  fmv.x.w      s7, fs4
                  fsgnjn.s     fs4, ft11, fa6
                  fadd.s       fs3, ft8, fa7, rne
                  fmv.w.x      ft8, a0
                  srai         s1, t1, 2
                  sltu         a2, a0, tp
                  fmv.w.x      ft3, s5
                  slt          s1, gp, t2
                  fle.s        s2, ft0, fs6
                  fcvt.s.w     ft10, ra
                  divu         s11, t0, s5
                  add          t3, zero, a7
                  srl          t1, t6, a1
                  srai         s0, tp, 23
                  rem          sp, a4, t6
                  mulh         a4, t4, s9
                  divu         a0, a0, s5
                  add          t3, a3, s6
                  sltiu        s2, sp, -1017
                  sltiu        t5, a2, -713
                  and          t4, s1, a1
                  fmul.s       fs0, fs0, ft5, rmm
                  and          s6, s3, a6
                  fdiv.s       fa1, fs9, fa6, rdn
                  mulhsu       s11, s5, a3
                  fmv.x.w      a5, fa0
                  slti         s5, zero, 874
                  and          s0, s7, s8
                  fsub.s       fs9, ft10, ft11
                  fmin.s       ft0, fs5, fs1
                  fmv.w.x      fa4, s1
                  fmax.s       fs6, fs11, fs11
                  slt          a4, t1, tp
                  ori          t6, a2, -725
                  nop
                  fcvt.s.wu    ft4, a1
                  mul          t3, a5, s5
                  auipc        s10, 176183
                  ori          s1, s3, 1692
                  slt          tp, s10, s11
                  fcvt.w.s     a0, ft4
                  fmv.w.x      fa0, a5
                  xori         s11, gp, -742
                  fsgnjn.s     ft6, ft9, fa1
                  remu         s7, t3, t5
                  mulh         t2, s11, s4
                  fadd.s       fs1, fs5, ft5
                  fclass.s     tp, fa7
                  mul          a7, s4, a6
                  fsqrt.s      ft9, ft5, rtz
                  fle.s        s3, ft9, fs8
                  addi         t0, a6, 1029
                  fcvt.s.wu    fa6, t6
                  lui          t2, 1004384
                  sll          a7, a7, tp
                  fmul.s       fs8, fs11, ft4
                  fsub.s       ft10, fa0, ft0
                  fadd.s       fa6, ft10, fa7, rtz
                  slli         s8, s7, 0
                  fcvt.wu.s    s10, ft9, rtz
                  xori         t5, s8, 1900
                  fdiv.s       ft7, ft0, fa3, rup
                  andi         t1, s10, -242
                  fsqrt.s      ft7, ft4
                  fmv.x.w      a3, fs1
                  flt.s        t5, ft6, fs9
                  and          s3, gp, t0
                  mul          t5, t4, a7
                  sltiu        t0, t2, 1239
                  sltu         s10, a1, tp
                  sll          s8, t3, ra
                  fadd.s       fa4, fs7, fa1, rup
                  fsgnjn.s     fs0, fs11, ft5
                  fmv.w.x      fs0, s8
                  remu         a7, gp, s7
                  mulh         a3, t0, s6
                  lui          a4, 396956
                  ori          t5, t0, 764
                  mulhu        s5, s11, s4
                  fsub.s       ft3, ft11, ft9
                  fmax.s       fs11, fs3, fa7
                  sra          sp, gp, tp
                  add          s10, s5, s9
                  sll          a0, s8, s6
                  fsgnjx.s     fa4, fa1, fa3
                  flt.s        t0, ft5, fs6
                  sra          zero, a2, tp
                  auipc        ra, 840406
                  fcvt.s.w     ft5, a3, rtz
                  fsgnj.s      ft10, fs6, ft8
                  srli         a4, tp, 30
                  divu         ra, s0, s0
                  fsgnj.s      fs3, fs6, ft10
                  fsgnjn.s     fa3, ft8, ft8
                  div          t0, s2, t3
                  remu         ra, a0, tp
                  div          a0, s11, s1
                  flt.s        t4, fs1, fs7
                  xor          a1, a4, s3
                  xori         s0, s10, 847
                  sltiu        t2, tp, -939
                  or           tp, s6, s8
                  fsgnj.s      fs2, fa0, fs1
                  sub          s7, s9, a2
                  auipc        t3, 1011371
                  fmax.s       fs0, fa7, ft10
                  fsub.s       ft11, ft10, ft7
                  mul          t0, t2, a4
                  srai         a1, t5, 21
                  srai         s7, t2, 25
                  fsgnjn.s     fs9, ft3, ft11
                  mulh         t3, s1, tp
                  fsgnjx.s     fs9, fa4, fa2
                  and          a3, a6, t5
                  sltu         s8, t1, gp
                  fmv.x.w      a0, ft1
                  mul          t5, a5, a6
                  remu         a4, a4, s5
                  fmv.x.w      tp, fs2
                  mulh         ra, t3, s2
                  mulh         a3, ra, a4
                  andi         a1, t6, -916
                  fcvt.s.w     fs8, a7
                  fsgnjx.s     ft8, fa6, fs5
                  nop
                  fsub.s       ft3, fs6, fs6, rup
                  fclass.s     t0, ft4
                  xori         s2, s0, -285
                  srl          gp, s11, s7
                  fmax.s       ft8, ft10, ft4
                  fsgnjx.s     fs1, fa1, ft8
                  lui          s8, 142932
                  fmv.x.w      a7, ft7
                  and          s2, t2, gp
                  remu         t5, s10, s10
                  sltu         s5, a7, gp
                  fsgnjn.s     fs11, ft5, fa0
                  sll          s11, s2, gp
                  fmul.s       ft6, fs3, fs1
                  fmax.s       ft9, fs7, ft8
                  sltu         zero, s8, s2
                  rem          gp, s9, ra
                  mulh         zero, t3, a4
                  fcvt.s.wu    fa1, a2, rup
                  fmv.w.x      fs4, s9
                  fsgnj.s      fs2, fs3, fs2
                  auipc        t1, 205201
                  sll          a3, s8, s4
                  auipc        s8, 887153
                  flt.s        a0, fa4, ft11
                  flt.s        t2, fa3, fa3
                  mulhu        t4, a3, a5
                  fsub.s       ft1, fs0, ft7
                  slli         s3, a6, 28
                  sub          sp, s8, sp
                  fle.s        a0, ft3, ft5
                  fclass.s     t5, fa6
                  slti         a7, s6, 646
                  mulh         s10, s3, t1
                  srli         t2, s9, 18
                  rem          a1, a3, t4
                  fcvt.s.w     fs7, a7
                  fdiv.s       ft10, fa6, ft1, rne
                  addi         a4, s0, -1386
                  fmin.s       fa1, ft11, fa4
                  remu         s1, a2, t1
                  auipc        a2, 379974
                  fsgnj.s      fs9, ft8, fa4
                  fclass.s     t1, ft8
                  fsgnjx.s     fs5, fa7, fs7
                  or           a2, s2, t2
                  sll          a3, a7, a2
                  fsgnjn.s     fa7, ft6, ft7
                  srli         ra, t5, 23
                  fsub.s       fs3, fs9, ft4, rdn
                  fcvt.w.s     s6, fa1
                  sub          s1, t3, a1
                  fsub.s       ft2, fa6, fs7
                  fmin.s       ft5, ft5, fa3
                  mulhu        sp, s9, s10
                  fsgnj.s      fa5, ft6, fa7
                  srli         t5, tp, 20
                  fmax.s       ft5, fa7, fa7
                  slti         t2, tp, 385
                  and          t0, t5, ra
                  fmin.s       fs11, fs0, fa4
                  add          zero, s9, a2
                  slti         sp, s4, -1013
                  sltu         a7, a3, a2
                  fsgnjx.s     ft8, ft11, fs5
                  fclass.s     a3, fa7
                  lui          a0, 601448
                  remu         a5, s8, a0
                  sltu         a7, a4, a7
                  fadd.s       fa7, ft10, ft0
                  feq.s        a4, fs5, ft4
                  mul          t6, s9, a7
                  fcvt.wu.s    tp, fa6
                  sll          a5, s8, t1
                  mulhsu       a2, s8, s10
                  slt          s1, s4, s9
                  fcvt.w.s     a5, fa3
                  mulhu        t1, a6, a6
                  mulh         t5, s10, t6
                  sltu         s10, tp, s8
                  xori         t0, a2, -1393
                  slti         a1, s3, 733
                  fcvt.w.s     zero, ft1, rne
                  divu         t3, s9, a7
                  fsgnjn.s     fs9, fs4, fs4
                  mulhu        t6, a3, a6
                  slt          tp, a5, gp
                  fsgnj.s      ft7, ft8, ft0
                  slti         sp, s8, -484
                  slli         a0, t4, 6
                  xori         sp, s0, -218
                  sltu         t2, gp, s10
                  sub          a3, s8, s8
                  sltu         zero, tp, a6
                  fmin.s       fs3, ft1, fa2
                  fmin.s       ft10, fa2, fa7
                  fmul.s       ft10, fs8, fs10
                  auipc        s5, 174158
                  andi         t6, s7, -809
                  fmv.w.x      ft4, t0
                  div          s7, t2, s9
                  mulhsu       t5, t4, s7
                  fsgnj.s      fs3, ft9, ft8
                  mulhu        a5, gp, t5
                  slti         t2, sp, 565
                  div          a2, a2, t5
                  div          s1, a4, a2
                  ori          t6, s8, 391
                  fcvt.wu.s    sp, fs8, rmm
                  slli         ra, a2, 2
                  fsub.s       fa1, fs11, fs6, rne
                  xori         s1, a4, -1559
                  fmax.s       ft2, fs0, ft9
                  lui          zero, 1047946
                  andi         tp, a1, -238
                  sltu         ra, t0, s8
                  mulhu        a1, t4, t0
                  andi         a7, s8, 1920
                  srli         s8, s3, 9
                  fcvt.wu.s    sp, fs5, rup
                  mulhsu       t0, t3, s9
                  flt.s        s8, fs2, fs11
                  fclass.s     t0, ft6
                  flt.s        a5, ft9, ft9
                  andi         s10, s4, -328
                  slli         t6, zero, 10
                  slti         s11, a4, -112
                  fclass.s     s2, fs1
                  fsqrt.s      fs6, fs2
                  andi         a3, s5, -1262
                  add          t5, s6, s0
                  fcvt.s.wu    fs10, s6
                  fadd.s       fs6, ft0, fs9, rtz
                  fmv.x.w      ra, ft6
                  xori         s2, s0, -169
                  or           s3, s3, s11
                  or           s0, s1, t6
                  fsgnjn.s     ft1, fa0, ft9
                  sltiu        s6, t0, -2040
                  fmv.x.w      s2, fa3
                  fcvt.w.s     sp, ft2
                  slt          s6, s1, a1
                  add          sp, t6, zero
                  srai         s0, t2, 18
                  srl          a0, a6, t2
                  srli         sp, s2, 5
                  fcvt.s.w     ft9, a4, rne
                  flt.s        sp, fa1, fa4
                  fcvt.s.wu    fa1, a5
                  fadd.s       ft10, ft2, fa7
                  srli         a4, a5, 14
                  slt          s11, s6, s2
                  mulhsu       s6, t6, t3
                  srai         s10, s9, 15
                  nop
                  fsgnj.s      ft9, fs7, ft11
                  mulhu        s1, s7, t2
                  fle.s        t1, fa4, ft1
                  fdiv.s       fa7, fa3, ft11
                  fadd.s       fs5, fa1, fs8
                  sra          s7, t6, gp
                  fsgnjn.s     fs11, fs11, ft7
                  mulhu        sp, t6, tp
                  fcvt.s.wu    ft11, s8
                  fdiv.s       ft7, fa5, fs9
                  fmul.s       ft6, ft10, ft1, rup
                  fmax.s       ft6, ft8, fs0
                  ori          a3, s1, 1443
                  andi         s11, gp, -1839
                  fsgnjn.s     fa7, fs3, fs2
                  flt.s        t2, ft7, fs10
                  fle.s        t4, fs9, ft4
                  lui          a0, 307922
                  auipc        a7, 42598
                  fsub.s       ft3, fs4, ft9, rup
                  sll          s11, s9, sp
                  slli         t1, a6, 18
                  slt          s3, s11, sp
                  fadd.s       ft5, fa6, fs9, rne
                  fsgnjn.s     ft0, fa4, fa5
                  fclass.s     s6, fs2
                  remu         gp, s2, s10
                  fclass.s     s2, ft9
                  divu         a1, s10, s3
                  fdiv.s       fa0, ft8, ft7, rup
                  fadd.s       ft0, fa0, fs8, rtz
                  remu         s2, ra, gp
                  remu         t2, s1, s8
                  srl          t3, s0, a4
                  or           gp, a6, s5
                  fclass.s     s8, ft11
                  andi         gp, s5, 35
                  fmv.x.w      t4, fa4
                  nop
                  sub          t6, s11, zero
                  fadd.s       fa1, fs4, fs5
                  fsgnjx.s     fa4, fa2, fs2
                  divu         s10, s11, s11
                  fsgnjx.s     fa3, ft4, fa6
                  fmv.w.x      fa0, a0
                  addi         tp, s5, -500
                  mulhsu       t6, a7, s3
                  mulhu        s1, a3, t4
                  fsub.s       fa5, fs8, fs0, rne
                  fadd.s       ft3, ft4, fs6, rup
                  xor          a0, gp, a1
                  srai         t6, zero, 13
                  mulh         a4, s5, s9
                  mul          t0, t1, gp
                  fmin.s       ft9, fs6, fa5
                  sltu         t0, s1, s3
                  sra          t0, s7, t4
                  sltiu        a2, s7, 512
                  xori         s0, s8, 69
                  mul          a4, a0, a4
                  sub          s2, s6, s3
                  xor          s6, a5, s10
                  fsgnjx.s     ft5, fa5, ft7
                  flt.s        a7, fs5, fs7
                  fle.s        ra, ft1, fa0
                  fsgnjn.s     ft5, fs7, fa7
                  slli         tp, s6, 11
                  andi         a3, s7, 1417
                  xori         s8, t1, 1715
                  xori         t0, a4, 485
                  fmv.x.w      s8, ft8
                  fcvt.s.w     fa2, a5
                  sltiu        s3, a2, -1072
                  and          a1, a4, s6
                  fmax.s       fa1, fs5, fs1
                  fdiv.s       fs8, ft2, fs10
                  srli         s10, s9, 15
                  remu         a1, s3, s11
                  divu         t5, s9, s7
                  srai         t0, a0, 16
                  rem          t5, a0, t5
                  fclass.s     a3, ft7
                  xori         a0, a1, 1493
                  divu         a1, t6, a1
                  sub          a2, t3, s10
                  divu         s7, a4, s1
                  ori          t0, a4, 489
                  or           zero, a2, t1
                  feq.s        gp, fa1, fs6
                  mulh         t0, s0, s7
                  fmax.s       fs0, fs6, fa7
                  rem          s2, t0, t3
                  fmul.s       fs11, ft1, fa5, rup
                  fdiv.s       fa6, fa0, fs0
                  rem          a3, s3, sp
                  fmv.w.x      ft9, t3
                  sra          sp, s1, a2
                  srai         a5, a2, 26
                  or           s7, sp, t2
                  addi         ra, s6, -1380
                  addi         s3, t3, -728
                  fsgnj.s      ft8, ft6, ft8
                  fclass.s     sp, ft7
                  mul          ra, zero, s7
                  fsgnjn.s     fa5, fs4, ft8
                  xor          s10, ra, a3
                  fsgnjx.s     ft4, fa7, ft8
                  fsgnj.s      fa4, ft9, ft5
                  srai         zero, s3, 24
                  xori         ra, t4, 1446
                  mulh         ra, t1, tp
                  mulhsu       ra, a4, t6
                  srai         t2, tp, 19
                  mul          s5, s4, t1
                  slli         s6, s4, 4
                  mulhu        ra, s5, a4
                  mulh         ra, t0, t0
                  sltu         t2, s1, s10
                  fmin.s       fs2, fs0, fs8
                  fle.s        s10, fs1, fa2
                  andi         s7, a1, -1891
                  fmin.s       fa7, fs10, ft6
                  slli         sp, a5, 25
                  srai         a7, s6, 19
                  nop
                  add          t5, s7, tp
                  or           s8, a3, s8
                  mulhsu       ra, t0, t1
                  slt          a0, s4, a6
                  fsgnjn.s     fa3, ft6, ft0
                  mulh         a3, a4, ra
                  fcvt.s.w     fs2, t3
                  flt.s        s2, fa5, fs11
                  fsqrt.s      ft0, fs10
                  fcvt.s.wu    fa5, gp
                  remu         ra, zero, tp
                  mulh         s6, t6, a5
                  fmv.w.x      fa2, zero
                  addi         s10, t2, -884
                  slli         t6, t4, 10
                  srai         s1, s6, 7
                  andi         t4, gp, 322
                  and          s11, s0, t4
                  srli         zero, s7, 30
                  srai         a5, s3, 14
                  add          t2, a4, gp
                  auipc        tp, 710846
                  remu         a7, s8, a0
                  fdiv.s       fs11, ft7, ft3
                  fdiv.s       fs4, fs6, fa2
                  fcvt.wu.s    t1, ft10, rmm
                  fmv.x.w      a5, ft0
                  slti         a2, t0, 976
                  fmv.w.x      fs0, a6
                  sltu         ra, t4, sp
                  andi         s1, s0, -601
                  sra          sp, s11, a2
                  fsqrt.s      ft6, fs3, rup
                  auipc        s2, 1029792
                  fmin.s       ft8, fa1, fa1
                  or           zero, sp, t2
                  sll          t4, s9, a0
                  remu         s8, a5, s9
                  sltu         s8, t6, tp
                  flt.s        s3, fs10, ft1
                  sll          a4, tp, s3
                  flt.s        a4, ft2, ft5
                  xori         s3, a4, 1513
                  sll          a4, s3, t2
                  xori         a1, s7, 1803
                  fle.s        a7, fs11, ft7
                  fmin.s       ft4, ft10, fs4
                  mul          t5, a3, s9
                  sra          t5, a7, a3
                  sltu         t1, a7, a1
                  auipc        a1, 798044
                  flt.s        s6, ft11, fa6
                  rem          a5, t0, s4
                  sra          a4, a7, sp
                  fclass.s     t2, fs3
                  addi         s1, s1, -927
                  andi         a1, s6, 1203
                  sltiu        t5, s0, -1908
                  fsub.s       fs10, fa0, fa5
                  feq.s        t1, fs7, ft1
                  or           s6, ra, t2
                  fsgnjx.s     fs1, ft1, fa2
                  sra          ra, s9, a0
                  and          zero, a3, t2
                  fcvt.s.w     ft5, t6, rup
                  flt.s        t2, fs2, ft3
                  divu         t4, sp, ra
                  ori          a0, t1, 1582
                  feq.s        a1, fs11, ft3
                  fsgnj.s      fs2, ft7, ft0
                  div          t4, a3, s5
                  slti         t5, a7, 495
                  fcvt.s.wu    ft2, tp
                  fmin.s       ft4, fs3, fs6
                  fcvt.wu.s    s0, fs1, rup
                  divu         ra, a3, a3
                  flt.s        s10, fs5, fa4
                  ori          t3, tp, 1781
                  fmax.s       ft10, ft5, fa5
                  rem          t0, t4, s6
                  fcvt.s.wu    fs5, t2, rup
                  fsub.s       ft6, ft9, ft0, rdn
                  or           s5, t4, s8
                  nop
                  fcvt.w.s     s7, ft11
                  div          s8, t4, s0
                  xor          t6, t1, t4
                  slti         t1, a3, 420
                  mulhsu       s1, ra, a3
                  or           a3, zero, t1
                  fsub.s       fs8, fa3, fs5
                  mulh         t1, s10, ra
                  fmv.w.x      fs11, a5
                  sra          t2, s11, t5
                  fdiv.s       fs0, fa6, fs9, rup
                  and          a0, a2, t5
                  fcvt.s.w     ft9, a0, rdn
                  addi         a7, sp, 1361
                  fcvt.w.s     s2, fs7, rne
                  fsqrt.s      fs6, ft2
                  lui          a0, 715645
                  fmv.w.x      fa2, s0
                  sra          t0, a5, t5
                  fcvt.s.wu    fs2, s1
                  fcvt.s.w     fa2, a6
                  slti         a2, t0, 786
                  fcvt.s.w     fs7, a3, rtz
                  fclass.s     t5, fs3
                  remu         s6, s2, t5
                  fsgnjx.s     fs5, fs1, fs3
                  remu         zero, t4, t1
                  fsgnjx.s     ft0, ft2, fa4
                  divu         zero, a3, s8
                  fmv.w.x      ft7, a1
                  fsgnjn.s     ft6, fs4, ft10
                  srl          gp, a0, a2
                  andi         s8, t5, 431
                  fcvt.s.w     ft9, t3, rtz
                  fclass.s     t3, ft10
                  sltu         s8, sp, a4
                  and          s6, t4, tp
                  sltu         gp, s2, a4
                  mulhsu       t4, s5, s3
                  or           s2, zero, t5
                  fclass.s     a3, fs2
                  slt          s6, t2, a5
                  remu         gp, a3, a3
                  sll          s10, a1, a5
                  slt          a1, t0, tp
                  fle.s        t6, fs3, fs5
                  fmax.s       ft11, ft9, fa7
                  fle.s        s5, ft7, fs4
                  fcvt.s.w     ft2, s3, rmm
                  fcvt.w.s     s11, ft3
                  fmax.s       fs7, ft5, fs6
                  fsgnjx.s     fs10, fa4, fs4
                  fcvt.s.w     ft2, s8, rtz
                  sll          a3, a1, a2
                  fsgnjn.s     ft9, fa3, fa4
                  ori          s1, s6, -39
                  fsgnj.s      fs3, fs11, ft11
                  fdiv.s       fa1, ft3, fa1
                  fcvt.w.s     t4, ft9
                  fmv.x.w      t1, fs9
                  and          ra, ra, a0
                  fmul.s       ft1, ft7, ft3
                  divu         t6, zero, s8
                  fclass.s     tp, fs4
                  srl          s3, a7, tp
                  fsub.s       fs5, ft10, fs3
                  slti         t2, a1, -1860
                  mul          sp, ra, s5
                  lui          a0, 440012
                  divu         s8, s10, s1
                  fadd.s       ft4, fa3, fs11
                  fmv.w.x      fa0, ra
                  fadd.s       ft3, fs3, fs2
                  auipc        ra, 284760
                  fmul.s       ft7, ft8, ft7, rup
                  mulh         a7, a6, s5
                  addi         t3, s8, -704
                  slti         s11, tp, 379
                  fmv.w.x      fa1, gp
                  sll          s11, s3, s7
                  sltiu        s3, t3, -1772
                  remu         s1, s7, t1
                  srai         ra, t2, 22
                  slti         gp, a2, -213
                  fmin.s       ft1, ft3, fs11
                  fmv.w.x      fs7, a7
                  fmv.w.x      fs8, a4
                  fadd.s       fa6, fa1, fs0
                  sltu         a1, s8, s8
                  fdiv.s       ft8, fs11, fs8, rne
                  andi         t4, sp, -575
                  xor          ra, s11, s10
                  srai         s2, a2, 11
                  sll          s3, s2, s4
                  flt.s        sp, ft3, fs3
                  feq.s        s7, ft1, ft1
                  fsqrt.s      ft3, fa5
                  divu         ra, t1, s11
                  div          t4, tp, t2
                  fle.s        t3, ft11, ft8
                  slt          t6, zero, t3
                  fsgnjx.s     fs11, fs1, fa3
                  fcvt.w.s     a5, ft4, rmm
                  remu         s3, s9, t1
                  auipc        s0, 689767
                  feq.s        zero, fa1, fs11
                  mulhsu       t5, a0, a2
                  sub          ra, s7, t1
                  lui          s5, 530250
                  rem          s1, a3, s8
                  mulh         s10, sp, a7
                  fsgnj.s      fa7, ft3, ft7
                  srai         s5, t4, 1
                  fsub.s       ft1, fa5, fa3, rne
                  srai         s5, a1, 17
                  fsqrt.s      fa4, fs4
                  divu         s1, s0, a3
                  fmax.s       ft8, ft3, fs4
                  fsub.s       fs1, ft9, fs2, rtz
                  sltiu        a0, s6, -1870
                  fcvt.s.wu    fs6, t0, rne
                  div          s7, zero, a5
                  fmv.w.x      fs11, t1
                  ori          a3, tp, 1384
                  lui          s1, 318752
                  mulhu        ra, tp, t0
                  srai         s2, s6, 1
                  fle.s        a2, ft5, fa2
                  fsgnj.s      ft5, fa6, ft10
                  fmv.x.w      a2, fa4
                  fsgnjn.s     ft11, ft0, fa7
                  mul          s1, a2, s6
                  mulhsu       t6, s0, zero
                  fadd.s       ft4, fs5, fs7
                  fcvt.wu.s    a3, ft7, rdn
                  sltiu        a4, s6, -1386
                  sll          s0, s0, s8
                  ori          a2, s7, 685
                  slli         t4, s8, 27
                  divu         tp, sp, s11
                  div          ra, s6, a5
                  fcvt.s.wu    fs2, s2, rtz
                  or           t5, s5, s11
                  fle.s        a1, ft5, fs1
                  fdiv.s       ft11, ft2, fa3, rdn
                  mul          a4, zero, s8
                  fmax.s       fa5, fa1, ft8
                  fsgnjx.s     ft0, fs3, fs0
                  fle.s        s10, fs7, ft3
                  div          a0, s6, tp
                  flt.s        s0, ft5, fs9
                  fle.s        t2, ft5, ft3
                  srli         a1, s4, 2
                  remu         s2, s7, s10
                  fcvt.wu.s    s11, ft3
                  xori         s5, s0, -1473
                  or           t5, s3, t0
                  mulhsu       gp, zero, s1
                  fmin.s       fa6, fs1, fs11
                  fcvt.wu.s    a7, ft1
                  sra          t6, s7, a1
                  lui          tp, 798601
                  fmv.x.w      s0, fs2
                  sub          t2, s7, s8
                  or           a0, a0, a0
                  lui          a2, 995127
                  sltu         s5, t3, s10
                  fsgnjn.s     ft4, fa1, fs2
                  slli         s5, a4, 2
                  xor          t0, s3, gp
                  fsub.s       ft1, fa7, fs6
                  rem          s1, s9, zero
                  fcvt.wu.s    s3, fs0
                  addi         s2, ra, -51
                  slt          t6, a1, t6
                  fmv.x.w      t3, fs11
                  fdiv.s       fs2, ft4, ft6
                  fsqrt.s      fs6, fs7
                  sltiu        a2, t6, -1826
                  fmv.w.x      ft8, s9
                  fcvt.wu.s    t1, fa2, rtz
                  div          s3, s11, s3
                  fmul.s       ft4, fa3, fa4, rmm
                  sub          s1, s0, s6
                  rem          s3, s2, tp
                  mulhu        a7, a1, ra
                  remu         s8, t5, s4
                  div          s7, t3, a3
                  mulhsu       a0, a4, t4
                  fmul.s       ft6, ft10, fs1, rne
                  fmv.x.w      s11, fs5
                  divu         zero, t5, a4
                  slt          sp, s6, s8
                  fadd.s       fa4, ft5, ft1
                  srli         s10, a2, 30
                  fmin.s       fa6, fa7, fs1
                  fsgnj.s      fa7, ft5, fa7
                  mulh         t1, a0, s7
                  fmax.s       fs2, fa2, fa2
                  fcvt.s.wu    fs0, t3, rdn
                  fmv.w.x      fs8, s5
                  feq.s        ra, fa0, fs5
                  xori         s10, s6, -346
                  fmv.w.x      ft10, t4
                  fmv.w.x      fs0, s3
                  xori         s0, zero, -1798
                  auipc        s5, 382410
                  add          zero, ra, t6
                  fcvt.s.w     ft0, s8, rdn
                  divu         t2, a4, zero
                  and          a3, s2, gp
                  fsub.s       fs11, fs2, fs8, rdn
                  mulh         t1, s11, a0
                  fmul.s       ft5, fs6, fa1
                  mul          s7, a0, s8
                  srli         s1, s8, 30
                  fclass.s     zero, ft7
                  fclass.s     a1, fa4
                  fmin.s       fa2, ft7, fs2
                  mulhsu       s7, a0, ra
                  remu         a1, a5, s1
                  fmv.x.w      sp, fa1
                  xori         a2, a0, 1699
                  slt          a2, a0, t1
                  fmax.s       ft5, fa4, fs0
                  fsgnjn.s     fa2, fs11, fa2
                  fsgnj.s      ft3, fa1, fa3
                  fsgnj.s      ft7, fs6, fa2
                  rem          t3, a5, s10
                  fmv.w.x      fs5, t4
                  fmax.s       fa7, fs4, fa5
                  mul          gp, s2, a4
                  fsgnj.s      fa2, fa1, fs3
                  srli         a2, zero, 2
                  and          s8, t1, s7
                  addi         zero, s5, 1717
                  fcvt.wu.s    ra, fs5, rne
                  slli         t2, a7, 23
                  sltu         t3, s5, s5
                  srli         a4, s9, 24
                  flt.s        tp, fs1, ft4
                  fcvt.w.s     a4, ft3
                  mul          s8, ra, s10
                  fmax.s       fs6, fs4, fa4
                  slti         t5, s3, 572
                  sub          s11, t2, s9
                  mulh         a2, a2, t5
                  flt.s        s6, fs5, fs5
                  feq.s        s0, fs0, ft5
                  sltu         t1, a6, t6
                  remu         t2, a4, t1
                  srl          gp, s7, s6
                  slt          s8, s9, s8
                  srli         zero, a3, 0
                  and          s1, s3, a4
                  fadd.s       ft1, ft6, ft11, rmm
                  fmin.s       ft8, ft4, ft4
                  fsgnjn.s     fs0, fs6, ft10
                  fsqrt.s      fs11, fs3
                  slt          s10, a0, gp
                  fsgnjn.s     ft4, fs9, ft7
                  mulh         s7, s4, s3
                  fmv.w.x      fa4, t5
                  fcvt.s.wu    ft4, s11
                  div          sp, zero, t1
                  andi         s10, s0, 621
                  xor          t6, s2, s9
                  auipc        s5, 607301
                  fmv.x.w      a3, fs6
                  fmax.s       ft9, fa6, fa0
                  sltu         t4, t0, tp
                  fle.s        s11, ft2, fa5
                  fsgnjn.s     ft0, fs5, ft3
                  fmax.s       fa6, fs2, fa0
                  fsgnj.s      ft1, fs3, fs8
                  fle.s        sp, fs9, fa5
                  srli         a2, a1, 27
                  sltu         s10, s7, sp
                  fsgnj.s      ft8, ft9, fa0
                  andi         t2, s2, 1191
                  xor          tp, t6, s0
                  xor          gp, t6, s4
                  mulh         t0, a4, s0
                  feq.s        t6, fs3, fs10
                  fclass.s     gp, ft9
                  fmax.s       fa1, fa6, fa2
                  fmv.w.x      fs9, a2
                  lui          t6, 344232
                  fsgnj.s      ft2, ft11, fa2
                  lui          zero, 1034241
                  fsgnjx.s     fa2, ft3, ft10
                  fsgnj.s      fa1, fa2, fs8
                  fcvt.w.s     s6, fs7
                  fsqrt.s      ft1, fa1
                  srli         s6, tp, 26
                  srai         t1, a2, 30
                  fsgnjx.s     ft5, ft3, fs7
                  lui          s6, 181236
                  flt.s        a5, fs9, fa7
                  fmax.s       fs5, fs5, fs0
                  auipc        s6, 893965
                  fmax.s       fa0, fa3, ft2
                  divu         gp, t0, gp
                  rem          s0, s7, s6
                  fclass.s     s10, fs2
                  fmv.x.w      gp, fs0
                  fmv.x.w      t2, fa2
                  fdiv.s       fs3, fs3, fs0, rdn
                  or           ra, t5, s0
                  slli         t4, t2, 19
                  sltiu        zero, a7, -1325
                  fmv.w.x      ft6, gp
                  div          gp, a6, s10
                  flt.s        t2, fs1, fa1
                  and          s2, t0, s6
                  fclass.s     tp, ft9
                  fsqrt.s      fs8, ft9, rmm
                  fsub.s       fs0, fs4, ft4
                  fadd.s       fa4, fs9, fs2, rmm
                  fsgnjn.s     ft9, ft9, fs1
                  fdiv.s       ft10, fs0, ft3
                  sub          a2, a3, a4
                  fcvt.wu.s    a1, fs2, rmm
                  fsub.s       ft3, fs3, fa5
                  fmv.x.w      s1, fs4
                  fsgnjx.s     ft5, ft7, fs3
                  fmv.x.w      t0, fs1
                  fcvt.s.wu    fs6, t2, rne
                  flt.s        s1, ft0, ft2
                  fle.s        s8, fa2, ft9
                  fcvt.wu.s    a3, ft4, rup
                  slt          s3, s4, gp
                  fmv.x.w      a7, fs4
                  fadd.s       ft11, fa3, fs10, rup
                  fcvt.s.wu    fs5, a7, rne
                  slti         s8, a6, 453
                  fcvt.s.w     fs1, s2
                  flt.s        tp, fs0, fa4
                  fsub.s       ft0, fa0, ft11, rtz
                  xori         s8, t2, -127
                  ori          t5, a2, 16
                  nop
                  fdiv.s       ft9, ft9, fa6, rup
                  mulhu        s5, a0, t6
                  fmv.w.x      fs1, s10
                  add          s6, s5, sp
                  add          t5, s4, a5
                  fcvt.wu.s    s8, fa2
                  fle.s        s2, fa0, fs7
                  slli         s3, t1, 13
                  addi         s6, s3, 1798
                  fmv.x.w      a7, ft0
                  nop
                  andi         t2, s5, -1479
                  xori         a4, t5, -322
                  fclass.s     s6, fa7
                  fsqrt.s      fs4, ft10, rdn
                  ori          t6, s4, -1157
                  fmv.w.x      fa7, gp
                  fcvt.wu.s    a2, fa0, rtz
                  nop
                  fle.s        gp, ft8, ft3
                  xor          s2, sp, s11
                  srai         s7, zero, 1
                  andi         sp, a0, -1126
                  fsgnjn.s     fs11, fa5, ft3
                  fcvt.w.s     a1, fs11, rtz
                  srai         t2, a1, 21
                  mulhsu       zero, t6, s5
                  remu         s1, s6, ra
                  srai         sp, s7, 18
                  and          a5, tp, a7
                  fcvt.wu.s    t5, ft6, rup
                  feq.s        s2, fs6, ft7
                  fclass.s     sp, ft6
                  fcvt.wu.s    t3, ft8
                  sub          a7, a0, t6
                  div          t0, s6, t1
                  sub          a5, sp, t0
                  mulh         sp, t0, s4
                  slli         s3, s3, 8
                  fsgnjn.s     fa4, fs5, fa0
                  fmax.s       ft2, ft11, ft7
                  add          a1, s1, s4
                  fle.s        s6, fs7, ft0
                  mulhsu       zero, s4, sp
                  fcvt.wu.s    a5, ft10, rne
                  rem          s7, a1, s3
                  fsqrt.s      ft5, ft1
                  lui          tp, 413475
                  fcvt.w.s     t1, fs11, rne
                  sltiu        s7, tp, 1888
                  addi         s11, t2, -793
                  feq.s        a7, fs0, ft10
                  srl          t5, s4, s9
                  slt          tp, t3, s3
                  rem          gp, a3, a6
                  or           a1, s2, s0
                  sll          a3, a7, s2
                  fcvt.w.s     t4, ft2
                  slti         a0, ra, 922
                  mulhsu       sp, zero, a2
                  fmin.s       ft10, fs4, fs8
                  fmv.w.x      fs11, t4
                  sltiu        tp, t5, -312
                  xori         t6, sp, -271
                  fsgnjx.s     ft1, ft9, fa7
                  fmul.s       fs7, ft11, fs2
                  sra          t0, t6, zero
                  andi         s0, t4, 482
                  srl          a4, ra, a4
                  fmv.x.w      s5, ft4
                  srai         a1, a4, 28
                  slli         s2, t2, 5
                  nop
                  andi         s8, sp, 1513
                  srai         t0, t5, 6
                  div          s7, t5, a2
                  slt          a4, s6, t3
                  srl          a4, s3, t4
                  sra          s7, s10, t2
                  fsgnjx.s     fa6, ft7, fs0
                  addi         zero, sp, -1110
                  rem          s5, a6, a7
                  fadd.s       fs9, ft2, fs4
                  fsgnjx.s     fa6, fa6, fs11
                  fadd.s       ft1, fa6, ft6, rmm
                  remu         s5, s10, t3
                  andi         a0, s11, -53
                  srli         a2, s11, 15
                  sub          s3, a5, zero
                  fsgnjn.s     fs6, fs11, fs11
                  fsqrt.s      fs8, ft11
                  fclass.s     s1, fs6
                  fdiv.s       ft1, fs4, fa0, rmm
                  fcvt.s.wu    fs5, t5
                  div          a4, t1, a2
                  fcvt.s.w     fs9, a6
                  srli         t4, t5, 30
                  remu         a2, s0, s1
                  fle.s        a4, fa3, fs1
                  fclass.s     a7, fs3
                  lui          s2, 796618
                  sra          t4, sp, a4
                  slli         s10, s4, 12
                  mul          s11, t3, t2
                  srai         s10, t0, 1
                  addi         t5, t1, 1287
                  fcvt.s.wu    fa0, t2
                  sll          a5, s9, sp
                  slli         t2, a3, 22
                  addi         a5, t1, 2042
                  slti         gp, a6, 157
                  lui          zero, 231643
                  fadd.s       fs6, fs2, fs10, rne
                  srai         gp, t4, 10
                  fmax.s       ft3, ft7, ft3
                  nop
                  or           t3, a3, a6
                  feq.s        s7, ft7, fa2
                  fsqrt.s      ft10, ft10
                  sll          s2, s11, t0
                  mulhu        s1, s7, gp
                  xori         a0, gp, -1133
                  mulhsu       a1, t5, s11
                  fmin.s       fs6, ft6, fa0
                  fsgnjn.s     ft5, fa4, ft2
                  fcvt.s.w     fs4, gp
                  fsqrt.s      fs11, ft11, rtz
                  and          t6, a0, a2
                  slt          t6, s0, t4
                  fadd.s       fa7, fa5, fs2
                  fmax.s       fs10, fs11, fs2
                  srai         t6, gp, 9
                  srl          t2, a7, a3
                  mulh         a3, gp, s1
                  fdiv.s       fs10, ft11, fs4
                  fsgnjx.s     fs1, fs6, ft0
                  add          gp, zero, tp
                  srai         t1, s0, 27
                  auipc        t4, 225423
                  div          t0, s8, ra
                  remu         t6, s8, a2
                  auipc        zero, 139388
                  srli         a5, s2, 31
                  fmax.s       fs2, fs7, ft4
                  mulhsu       t6, zero, zero
                  fdiv.s       fs10, fa2, ft11, rne
                  nop
                  fle.s        t5, fs11, fs3
                  fsgnjn.s     ft10, fa4, ft7
                  auipc        s2, 951418
                  fsqrt.s      ft10, ft6, rne
                  add          zero, s2, t4
                  sra          ra, tp, s0
                  fdiv.s       fs2, fs0, fs0, rup
                  add          t0, s10, ra
                  srli         t5, s1, 4
                  divu         s2, a4, t0
                  flt.s        t4, fs1, ft1
                  sll          s7, t3, s9
                  slli         t3, t5, 19
                  div          zero, t1, t1
                  srli         s6, s10, 7
                  add          a3, s5, a2
                  remu         tp, a1, t1
                  divu         s2, t6, a3
                  feq.s        s1, fs7, fs7
                  and          s5, a2, t4
                  fcvt.wu.s    zero, fs0
                  fmin.s       fs9, ft6, fs1
                  remu         s8, a0, a0
                  auipc        s10, 411598
                  fmin.s       fa6, ft5, ft11
                  slt          s5, s0, t6
                  flt.s        s3, fa5, fa6
                  divu         t5, sp, s7
                  ori          s3, t4, -1663
                  divu         s8, a5, s10
                  xori         s2, ra, -69
                  addi         s1, s5, 217
                  fsqrt.s      fs4, fs1
                  nop
                  slt          t1, s3, a2
                  and          a4, gp, sp
                  srai         t2, t6, 25
                  remu         a3, t4, t5
                  fle.s        t5, fs10, ft3
                  fsgnj.s      fa3, ft4, fs10
                  mulhu        s11, t3, s11
                  fle.s        t5, ft7, fa3
                  or           s11, s1, s9
                  flt.s        s6, fa6, ft4
                  mul          a3, a0, s10
                  sub          tp, ra, tp
                  ori          s11, s7, -847
                  slti         t0, s3, -1223
                  sub          sp, s10, t2
                  andi         a7, s5, -404
                  slti         s6, tp, -524
                  ori          s6, s2, 673
                  andi         t4, a6, 40
                  fsub.s       fa2, fs9, fs0
                  or           t0, gp, sp
                  fadd.s       ft6, ft10, fa0, rdn
                  fsgnjn.s     fs3, fa0, ft8
                  sltiu        a3, ra, 237
                  fmv.w.x      fa1, s4
                  fmv.w.x      ft3, s0
                  xori         s2, gp, 686
                  or           t5, a4, t3
                  fcvt.s.wu    fs9, t4
                  sra          a2, a2, s6
                  div          zero, a5, s11
                  ori          a5, s7, 1384
                  lui          s11, 66447
                  fle.s        t5, ft7, fa0
                  auipc        gp, 557636
                  fsgnjn.s     fs10, fa0, ft5
                  fcvt.s.w     fa6, a6
                  slli         s7, s11, 10
                  add          s1, s0, ra
                  andi         sp, t2, -973
                  or           gp, t5, a7
                  sll          s7, a7, t2
                  and          s8, a4, s11
                  flt.s        s2, fs1, fa4
                  fsgnjn.s     fs11, ft1, fs10
                  xor          s10, t4, s1
                  mulhsu       gp, t4, t4
                  fclass.s     s5, ft6
                  fcvt.w.s     t3, fs8
                  and          s6, t0, t4
                  fsgnjn.s     ft1, ft11, fs5
                  addi         tp, t4, 943
                  fclass.s     a3, ft11
                  sltu         gp, s8, s8
                  ori          s11, s8, 1096
                  mulhu        a0, a1, s0
                  remu         s0, sp, ra
                  lui          s11, 914021
                  rem          s8, s10, s1
                  fsgnj.s      fa1, fa1, fa2
                  fle.s        a7, ft2, ft3
                  sub          a0, a5, s5
                  fcvt.s.wu    ft11, t1, rdn
                  or           a5, s10, a5
                  srai         s7, s8, 23
                  fsqrt.s      fs11, ft6, rne
                  fcvt.s.wu    fs6, s9, rdn
                  srli         ra, gp, 15
                  srai         t1, a3, 3
                  fle.s        s10, fa3, fs8
                  lui          a7, 539712
                  srli         a0, t5, 3
                  feq.s        t3, fs3, fs6
                  lui          s6, 41899
                  sra          sp, s1, s10
                  ori          t2, s7, -1634
                  fcvt.wu.s    t0, fs1, rmm
                  fadd.s       fs6, fs7, fs2
                  auipc        s11, 638305
                  auipc        s11, 10280
                  and          t1, sp, a0
                  fclass.s     s5, fs9
                  fle.s        t5, ft11, fs8
                  mulh         ra, t6, s5
                  feq.s        zero, ft5, ft2
                  mulhsu       t6, s6, s9
                  sll          s10, s2, a5
                  mulhsu       s0, gp, s6
                  lui          a3, 339784
                  fsgnj.s      ft11, ft5, fa5
                  xor          s2, s4, a2
                  flt.s        t0, fa0, ft4
                  divu         zero, a5, s10
                  sra          zero, a4, s2
                  nop
                  auipc        t2, 80333
                  and          zero, a4, s3
                  fclass.s     t0, fs6
                  lui          t0, 354607
                  fdiv.s       fa7, fs2, fa6, rtz
                  slli         s10, t4, 28
                  fle.s        s3, ft0, ft6
                  slli         s8, a0, 19
                  fsgnjn.s     fs0, ft10, ft10
                  div          ra, s2, t6
                  divu         zero, s9, sp
                  fmv.x.w      s7, ft11
                  fmv.w.x      ft4, ra
                  fadd.s       ft6, ft5, ft6
                  fsgnjn.s     ft6, ft3, fs9
                  fmin.s       fs8, fa4, fs8
                  sra          s1, s9, a3
                  srai         s7, a0, 9
                  divu         s3, t3, s2
                  ori          s5, a7, 1288
                  divu         a0, s5, s4
                  sltu         s2, a2, sp
                  xor          s0, s5, ra
                  srli         t5, a3, 19
                  nop
                  srli         tp, t2, 6
                  and          a7, zero, a7
                  fadd.s       fa6, fs8, fa3, rmm
                  slli         a2, t1, 6
                  xori         tp, t1, 717
                  mulhsu       s7, a2, gp
                  sltu         zero, t0, s6
                  xori         t2, t0, -1837
                  srli         s7, t4, 2
                  nop
                  fcvt.wu.s    s0, fs2
                  sra          t3, a6, a7
                  nop
                  fle.s        a0, ft0, ft3
                  xori         s5, s5, -1009
                  fdiv.s       ft10, ft9, fa4, rmm
                  addi         a1, a6, 129
                  nop
                  fcvt.w.s     t2, fs4
                  fmin.s       fa7, ft1, ft6
                  fsgnjx.s     ft0, fa7, fs8
                  fsgnjx.s     fa6, fs5, fs11
                  fcvt.s.w     fs5, t2, rne
                  fmin.s       fs3, ft9, fs6
                  srli         s5, zero, 6
                  xor          s6, s8, s6
                  fadd.s       ft4, ft6, fa1, rmm
                  xori         s10, t3, 943
                  or           a3, s5, s6
                  feq.s        a1, fs6, fs7
                  fsub.s       fs5, fs7, ft11, rne
                  fmv.x.w      a0, fs9
                  div          a2, a1, ra
                  fmul.s       ft5, fa6, fs2
                  add          s6, s6, s6
                  ori          s0, a6, 1939
                  fclass.s     t4, ft6
                  mulhu        t4, zero, s6
                  fdiv.s       ft7, fa2, fs3, rne
                  fcvt.wu.s    gp, fs3
                  feq.s        s3, fa0, fs11
                  divu         t0, s9, s3
                  fsgnjn.s     ft7, fs10, ft0
                  fmv.w.x      fs5, t5
                  fmin.s       fs9, fs5, fs11
                  fdiv.s       fa7, fa2, fs9, rup
                  srl          t2, a5, t6
                  sltu         s1, s4, s10
                  ori          a4, s5, -1796
                  slt          s2, t3, s8
                  auipc        s5, 716651
                  slt          a5, t0, t5
                  remu         t6, s7, t2
                  fadd.s       ft2, ft3, fs0, rup
                  divu         a3, s10, s9
                  fmin.s       fs8, ft7, fs7
                  slt          t4, s0, s11
                  fsqrt.s      fs7, ft9
                  auipc        a5, 610187
                  fdiv.s       ft10, ft11, ft9, rup
                  mulh         a5, ra, a5
                  mulhsu       s6, a0, s10
                  fmin.s       fs8, fs8, fs0
                  fmv.x.w      gp, fs3
                  fsgnjx.s     fa5, fs11, ft7
                  fsqrt.s      fs3, fs8
                  fmv.x.w      t6, fa2
                  and          a0, t5, s1
                  and          zero, s0, s4
                  sra          t2, gp, a7
                  mulhu        t2, s2, sp
                  add          gp, s3, a4
                  divu         tp, t6, s2
                  xori         t4, a7, 699
                  and          s7, t6, s6
                  fcvt.wu.s    a2, ft6, rdn
                  remu         a2, a1, ra
                  srli         zero, s10, 1
                  fadd.s       fa3, fa0, fs2
                  nop
                  addi         zero, s11, -242
                  fcvt.s.wu    ft10, s8
                  srai         zero, s3, 28
                  or           a0, a2, a5
                  mulh         a0, a7, a3
                  srai         s2, t3, 15
                  slti         a5, zero, 238
                  fsgnj.s      fa1, fs4, fs10
                  ori          t3, s0, -169
                  slli         s5, zero, 0
                  and          a2, t0, t3
                  fmv.w.x      fs4, ra
                  lui          s11, 147496
                  srli         s11, s2, 13
                  auipc        s8, 1018326
                  fmv.x.w      s5, fa3
                  slt          s3, tp, sp
                  addi         ra, t6, 1802
                  sub          t3, gp, t1
                  rem          s3, s2, t5
                  fsgnjx.s     ft7, fa1, fs0
                  fmul.s       fa4, fa6, ft9, rne
                  fmul.s       fs8, ft5, fs1
                  fmin.s       ft4, fa6, fs6
                  ori          s7, s7, 392
                  mulhsu       s8, s11, s10
                  slti         a1, a1, 1569
                  mulhu        tp, s0, tp
                  fsqrt.s      fs10, fa5
                  nop
                  fsub.s       fs2, ft7, fs4
                  andi         t6, s1, -443
                  auipc        s8, 513758
                  auipc        zero, 949856
                  sltiu        s11, s4, -176
                  sra          a1, s6, a4
                  sub          s11, t1, s7
                  sra          a3, a2, t0
                  fmin.s       ft9, fs8, ft11
                  sltu         a1, a5, s2
                  rem          tp, s9, tp
                  sltiu        sp, a1, -1958
                  auipc        a3, 730153
                  fsgnjn.s     ft3, fs4, fs10
                  fclass.s     tp, ft1
                  ori          s0, s1, -607
                  srli         a5, s4, 14
                  fmul.s       fa3, fs11, fs11
                  fmul.s       ft5, fs11, fs11, rne
                  fmul.s       ft1, ft0, ft9
                  lui          a7, 723643
                  mulhsu       tp, t4, t5
                  rem          t1, s3, t1
                  fdiv.s       ft11, fa6, fs3
                  srli         s2, s10, 16
                  divu         t6, s1, tp
                  fcvt.w.s     a3, fa1
                  fcvt.wu.s    a2, fa4
                  rem          s2, s0, a7
                  feq.s        a3, ft10, ft5
                  slt          sp, s1, t2
                  rem          t5, zero, a0
                  fcvt.wu.s    t5, fs5, rne
                  fcvt.w.s     s7, fs10, rtz
                  rem          zero, s6, s1
                  sll          a2, a6, s11
                  fsgnjn.s     ft6, ft8, ft4
                  ori          s11, a4, -1238
                  feq.s        a0, fa3, ft2
                  add          s6, t1, s2
                  sltiu        a1, s1, -1253
                  auipc        t1, 142495
                  sra          tp, tp, s2
                  rem          t5, t5, s8
                  and          s11, s2, a6
                  fsgnjn.s     ft8, fs9, fs5
                  mulhu        t1, t1, s11
                  slt          t3, t5, sp
                  fcvt.w.s     tp, fs3, rmm
                  flt.s        s3, fs3, fs4
                  fcvt.w.s     s6, fa7
                  fclass.s     t6, fs1
                  div          a4, t5, t4
                  srl          a4, s9, a7
                  fcvt.wu.s    tp, fs5, rtz
                  fmax.s       ft6, ft11, ft4
                  fclass.s     t5, fs10
                  rem          t1, s1, a2
                  fclass.s     s11, fs0
                  sltu         a1, s0, a4
                  or           t6, s5, s2
                  srl          t6, s6, s5
                  nop
                  or           a1, t5, t0
                  fle.s        t3, ft6, fs7
                  fle.s        s3, ft5, ft3
                  lui          s3, 855954
                  and          zero, s6, s4
                  divu         s2, t4, s11
                  fcvt.wu.s    sp, fs1, rdn
                  sltu         t0, a4, s11
                  fcvt.w.s     a1, ft3, rup
                  rem          t2, s4, s8
                  lui          t5, 774305
                  mulh         s8, a6, a1
                  fcvt.s.wu    fs0, ra, rmm
                  sltiu        t3, s5, -1718
                  feq.s        a0, ft5, fa1
                  remu         t5, t2, s0
                  fsgnjn.s     fa2, fs9, fs6
                  mul          a7, t2, zero
                  fsqrt.s      fs8, ft9
                  mulhsu       t5, t0, zero
                  sltu         ra, tp, gp
                  fcvt.w.s     t3, fs4, rtz
                  fsgnj.s      fa3, fs10, fs2
                  nop
                  addi         sp, ra, -1466
                  sub          s5, t6, gp
                  div          zero, s5, s2
                  sltu         s10, t2, t5
                  slt          t0, zero, a4
                  slt          zero, s9, s0
                  auipc        s0, 807018
                  lui          t5, 569000
                  lui          s3, 763630
                  div          a7, zero, t0
                  fcvt.wu.s    s10, fs9, rup
                  fsgnjn.s     fs2, ft10, fs9
                  fcvt.wu.s    t2, fs2, rup
                  srl          s2, t5, t1
                  sltiu        s2, a6, 645
                  sra          t0, t0, s8
                  lui          s1, 960082
                  andi         t2, s3, 1462
                  xori         s10, s0, 1121
                  remu         a2, t6, s8
                  fmax.s       ft4, fa2, ft1
                  fmv.w.x      fs9, s1
                  lui          zero, 905966
                  fmul.s       ft5, fa6, ft11, rmm
                  rem          zero, t4, sp
                  fmax.s       fs1, ft1, fs2
                  divu         t3, t3, s0
                  div          s10, sp, t0
                  fle.s        t6, ft2, fs6
                  divu         s10, s5, a0
                  fcvt.s.w     ft0, s11, rmm
                  mulh         s6, a7, s5
                  and          a1, s2, a6
                  fclass.s     a1, ft1
                  andi         s1, s7, 1558
                  srl          a7, s10, t3
                  addi         t5, gp, -251
                  sub          zero, s5, t2
                  flt.s        s8, fs11, fa6
                  srl          gp, s2, a1
                  fmv.x.w      t6, fs7
                  fcvt.w.s     a5, fs11, rne
                  srl          a5, t0, a0
                  fdiv.s       fs1, fs7, fa3, rne
                  fle.s        ra, ft11, fs2
                  sra          t3, a6, a5
                  fcvt.s.w     fa4, t4
                  fcvt.wu.s    s6, fs9
                  fsgnjn.s     ft1, fs6, fa3
                  fmax.s       fs3, ft8, ft4
                  fclass.s     s11, fs3
                  srl          s7, s7, s3
                  fsgnjx.s     ft9, fa5, fa1
                  fsgnjx.s     fs8, fs5, fa6
                  fsgnjn.s     fs7, fa1, ft5
                  feq.s        s8, fa4, fs5
                  fmv.x.w      s10, fa0
                  fdiv.s       fs2, fa1, fa4, rup
                  slti         a0, s3, 1940
                  addi         a4, s2, 1694
                  fmul.s       ft8, ft6, ft9
                  srai         t3, ra, 14
                  sra          s3, s0, t4
                  mulh         s11, gp, s9
                  auipc        gp, 168029
                  fmv.w.x      fa5, s10
                  fmin.s       fs3, ft4, ft1
                  or           t1, s2, t4
                  fdiv.s       ft0, ft4, ft4
                  fle.s        a7, fa3, fa2
                  xor          s5, a3, a4
                  srli         t1, tp, 29
                  fdiv.s       ft6, fs11, ft11, rdn
                  lui          s8, 250778
                  fmv.w.x      fa4, a3
                  rem          a0, tp, s5
                  sltiu        s7, sp, 904
                  mulh         a7, s4, t6
                  sra          zero, a6, a1
                  fsqrt.s      fa3, fa3, rdn
                  slti         tp, s6, -1468
                  fclass.s     s6, fs10
                  add          a5, s5, s6
                  slli         t5, s7, 14
                  add          sp, a6, t3
                  or           s5, t2, s0
                  sltiu        s6, s11, 744
                  or           a4, s11, s7
                  fcvt.s.w     ft11, s10, rup
                  fsqrt.s      ft3, ft3
                  fdiv.s       fa1, ft8, fa6, rtz
                  ori          a5, s9, -1229
                  fmul.s       fs6, fs6, fs11, rtz
                  remu         sp, a7, gp
                  slt          s10, a4, a5
                  fcvt.wu.s    s0, ft5, rmm
                  fcvt.w.s     t6, fa3
                  addi         a7, s5, -1920
                  or           a7, t4, a0
                  fcvt.wu.s    s7, fs11
                  nop
                  fmul.s       ft10, fa3, ft0
                  slti         a5, tp, 520
                  fcvt.s.wu    fs9, a3, rdn
                  slt          ra, s10, zero
                  mulh         t4, t5, a0
                  nop
                  flt.s        s11, ft0, ft7
                  nop
                  srl          s1, a0, t3
                  mulh         s11, ra, tp
                  flt.s        a2, fs0, fa1
                  fmin.s       ft4, fs9, ft6
                  nop
                  fsqrt.s      fs1, fa2, rtz
                  sltu         a0, t6, a0
                  fcvt.s.wu    ft9, ra, rdn
                  fcvt.w.s     s5, ft0, rmm
                  fclass.s     a7, fs10
                  fle.s        s3, fs6, fs11
                  sra          a1, a2, zero
                  mulh         s8, t5, a4
                  srli         t6, a6, 21
                  mulh         a0, a3, s3
                  fcvt.w.s     a4, fa4, rtz
                  remu         s1, s11, s5
                  sub          ra, t2, s0
                  fmin.s       fs5, ft2, ft5
                  mulhsu       t4, t1, gp
                  feq.s        a2, fa7, ft7
                  srl          s3, t0, s2
                  fsgnjn.s     ft5, ft2, fs5
                  andi         t0, sp, -283
                  mulhu        s11, a7, t4
                  slli         t1, s0, 25
                  slt          sp, a2, sp
                  fcvt.s.wu    ft4, t0
                  addi         s2, a2, 1363
                  fdiv.s       ft9, ft0, ft7, rne
                  fcvt.s.w     fa2, a5
                  fclass.s     a4, fs3
                  fsub.s       fs6, ft2, ft10
                  fadd.s       ft11, fs0, ft10, rdn
                  fcvt.s.wu    fa3, a5, rmm
                  fcvt.s.w     ft6, s4, rtz
                  fcvt.w.s     gp, ft0, rtz
                  mulhu        s11, t3, gp
                  fsgnjn.s     ft8, fs8, fs1
                  auipc        s7, 408502
                  slt          s2, s0, a2
                  xori         s3, sp, 2030
                  srli         ra, s5, 6
                  mulhu        t3, ra, a5
                  remu         s11, a2, s11
                  fmv.w.x      ft3, s11
                  fmul.s       fa3, fa3, fs5
                  auipc        sp, 813952
                  fsgnj.s      fs6, ft2, fa3
                  sll          s8, s6, a3
                  sll          a0, a2, t4
                  add          zero, a1, t0
                  fsgnj.s      fs6, ft4, ft10
                  fcvt.wu.s    t1, fa4, rtz
                  xori         s10, tp, 202
                  flt.s        t6, fs1, ft6
                  or           a4, ra, a5
                  fle.s        s0, ft3, ft3
                  rem          s11, t4, a0
                  fadd.s       fs2, ft5, ft10, rne
                  fmul.s       ft9, ft4, ft6, rtz
                  nop
                  slli         gp, a3, 21
                  and          a2, t4, t3
                  mulhu        ra, t6, a6
                  fadd.s       fs9, fa4, fa4
                  sltu         s0, a5, s7
                  auipc        s2, 845129
                  div          t1, s6, s5
                  or           sp, s6, a2
                  slt          a4, t0, t1
                  srli         s11, a2, 16
                  fle.s        a2, ft10, fa3
                  or           s2, sp, t6
                  flt.s        s11, ft3, fa6
                  fmul.s       ft11, ft2, fs5, rdn
                  rem          tp, a2, t5
                  remu         tp, sp, ra
                  srli         a5, ra, 3
                  xori         s1, s4, 1357
                  remu         t4, zero, a6
                  slti         t6, s9, 392
                  fmin.s       fs3, ft9, ft11
                  fmv.w.x      fs8, a6
                  xor          a5, t2, s3
                  fcvt.wu.s    s7, ft9
                  sra          ra, a5, s9
                  add          s5, a4, s7
                  srai         a3, a7, 18
                  andi         t4, t0, -1668
                  xor          s3, s6, a6
                  xor          s5, s8, t6
                  lui          sp, 576530
                  auipc        s7, 133620
                  mulh         s5, s0, s9
                  sltu         sp, t1, s7
                  fsub.s       ft6, fs0, fs6
                  fmv.w.x      fs8, t0
                  fsqrt.s      ft1, ft6, rup
                  srli         a0, tp, 29
                  sub          a1, t4, t3
                  fcvt.w.s     t2, fa2
                  fdiv.s       ft5, ft0, fs5, rne
                  add          sp, tp, zero
                  nop
                  fcvt.s.wu    ft4, t6, rtz
                  remu         t2, zero, t3
                  slt          s6, s11, t4
                  xor          s2, ra, t6
                  fsqrt.s      ft3, ft7
                  srai         a0, t4, 11
                  fmv.x.w      t1, ft0
                  mul          s0, a6, s1
                  ori          s1, s2, -575
                  fle.s        a7, ft1, ft10
                  slli         t1, s6, 10
                  fcvt.s.wu    ft5, t3, rtz
                  or           s5, a2, sp
                  div          t6, t3, sp
                  fclass.s     s0, fs5
                  mul          a1, s11, a7
                  fmv.x.w      zero, fa7
                  fcvt.w.s     t4, fs0
                  rem          t2, s8, s8
                  fle.s        a4, ft0, ft5
                  fsqrt.s      ft4, fa3
                  div          t5, a6, t4
                  fsqrt.s      ft1, ft10, rmm
                  mulhsu       s10, a0, ra
                  div          t5, t3, a1
                  sub          t6, t3, t2
                  slli         t2, s1, 31
                  fclass.s     t3, fs10
                  fsgnjx.s     fs5, fs1, fs4
                  slli         s6, t4, 29
                  fcvt.s.w     fs2, t3, rtz
                  fcvt.w.s     s10, fs5, rne
                  fcvt.s.wu    fa5, s1
                  sltu         a5, s7, s3
                  fsqrt.s      ft9, fs8
                  fadd.s       fs4, fa3, ft11
                  lui          sp, 930344
                  addi         a7, s2, -1238
                  srli         s3, s6, 0
                  add          s5, s0, s5
                  fcvt.s.wu    fs7, s11, rtz
                  fsgnj.s      ft5, ft7, ft4
                  fcvt.w.s     t1, fs9, rne
                  fclass.s     t2, ft5
                  feq.s        sp, ft7, fa3
                  fmul.s       ft2, fa6, fa7, rtz
                  sltu         s3, tp, t1
                  and          a2, t3, t0
                  srai         a0, s2, 17
                  fadd.s       fs1, fa4, fs10, rup
                  fmax.s       fa4, ft7, ft1
                  lui          t3, 272100
                  flt.s        tp, ft10, fs3
                  slti         a7, s9, 1641
                  flt.s        ra, ft0, fa7
                  fsqrt.s      fa4, fa6
                  sub          gp, a4, t5
                  lui          s2, 309141
                  fsqrt.s      ft5, fa0, rtz
                  srl          s10, a2, t0
                  fsub.s       ft2, fs4, fs9
                  fle.s        t2, fs9, fs3
                  fsub.s       fa2, ft5, ft0, rtz
                  slli         s0, sp, 18
                  ori          a3, sp, -241
                  fmax.s       fs10, fs5, fa6
                  mul          s0, s8, ra
                  srl          t3, s4, ra
                  sll          s10, t0, s6
                  sltu         s8, t3, s9
                  remu         ra, s6, s8
                  fadd.s       fa3, fs5, fa4, rne
                  fsgnj.s      fs6, fs0, ft5
                  sub          t6, a6, s0
                  sltu         a1, s4, a0
                  xor          t1, s3, sp
                  auipc        a7, 483923
                  fcvt.s.wu    fa4, a5, rtz
                  xor          a1, s11, zero
                  fsqrt.s      fs5, ft6
                  addi         a5, a7, 127
                  sltiu        t6, t1, 1928
                  feq.s        s2, fa4, ft4
                  flt.s        t1, fa2, ft7
                  flt.s        t2, fa7, fs3
                  fmv.w.x      fa6, ra
                  andi         s2, a6, -1342
                  fmv.w.x      ft10, s8
                  fsqrt.s      fs6, fa0
                  fmul.s       fs5, fs6, fa0
                  div          gp, t4, gp
                  flt.s        a0, fa2, fs6
                  div          ra, tp, t1
                  sll          ra, a6, s3
                  fcvt.w.s     a7, fs11
                  fmv.x.w      gp, ft10
                  add          s7, s6, a2
                  xori         sp, s7, -668
                  fcvt.s.w     ft2, a2
                  sltu         t4, a3, zero
                  fsgnj.s      fa6, fa1, fa6
                  add          a3, t1, s7
                  addi         a1, sp, -148
                  fcvt.s.w     ft7, t4, rdn
                  andi         s0, a4, 1547
                  fsqrt.s      fs11, ft2, rne
                  fle.s        sp, ft2, fs0
                  andi         s8, s9, 908
                  sub          s5, s10, s2
                  or           s11, gp, t1
                  remu         t6, t2, tp
                  div          t5, s9, s0
                  fadd.s       fa2, fa0, ft8
                  lui          a4, 318998
                  fclass.s     a7, fs3
                  fsgnjx.s     fs9, ft6, fs3
                  lui          s0, 495236
                  sra          t6, t5, t4
                  auipc        s11, 621008
                  fdiv.s       fa5, ft11, ft8, rmm
                  fmax.s       fs9, ft8, fs1
                  add          a5, t5, a7
                  mulhu        a5, s6, s0
                  fsub.s       ft8, fs3, fa2, rmm
                  sltiu        a7, s4, -149
                  xori         t6, a1, -226
                  fmv.w.x      fs0, sp
                  fle.s        s0, ft2, fs2
                  feq.s        s6, ft11, fs7
                  fsub.s       fs0, fs0, fs7
                  fsgnj.s      ft6, fa7, ft6
                  xori         s8, a4, 1215
                  fdiv.s       fs2, fs11, fa2
                  or           s7, s1, a6
                  srl          a5, a0, t1
                  mul          s1, t0, t0
                  add          a2, sp, s9
                  fcvt.wu.s    t4, ft3, rdn
                  mulhsu       a7, sp, s1
                  fcvt.s.w     fs11, zero
                  fsgnjx.s     fs0, fa1, ft10
                  lui          s10, 935233
                  flt.s        t3, fa3, fs1
                  sub          s10, t6, s6
                  fadd.s       fa1, fs0, ft8, rne
                  addi         t0, s11, -72
                  fmax.s       fa5, ft9, ft8
                  mulhu        t1, t3, t3
                  slti         s1, a2, 1441
                  fsub.s       ft2, ft10, ft10
                  slli         s10, s6, 11
                  xori         zero, a1, 1500
                  fclass.s     s3, fa7
                  fmv.w.x      ft7, s4
                  fsgnjx.s     ft5, fs5, fs5
                  slli         a1, t0, 20
                  rem          zero, s4, s11
                  fdiv.s       ft3, ft5, fa0
                  srai         s5, t4, 26
                  fsub.s       fa7, fs3, ft6, rup
                  fcvt.wu.s    s3, fa7, rup
                  addi         a4, t2, -2042
                  xori         a3, s4, 1944
                  mul          a2, s0, t1
                  div          tp, t5, zero
                  slli         sp, gp, 21
                  add          s5, t2, a4
                  and          tp, ra, gp
                  fcvt.s.w     ft11, s0, rup
                  slli         t1, s6, 9
                  andi         s3, s1, -1270
                  sltiu        t1, a3, -534
                  fmax.s       ft3, ft4, ft11
                  slt          a3, tp, s7
                  sub          s0, t0, a1
                  srli         a5, s8, 24
                  feq.s        zero, ft10, fa0
                  sub          a3, gp, s9
                  and          t3, s4, s10
                  fmv.w.x      ft3, a1
                  fsgnj.s      ft10, ft0, ft4
                  fmin.s       fa1, fs10, fa5
                  fsgnjx.s     fs1, fs10, fs2
                  or           a7, a3, tp
                  srl          t0, zero, sp
                  xori         s11, t6, -1759
                  divu         a7, s6, a4
                  divu         a0, s8, a6
                  fsgnjx.s     fa7, fs7, fa5
                  sub          s10, t1, t4
                  mulhsu       s1, s3, a6
                  auipc        t0, 796310
                  slli         a5, s4, 5
                  mulhsu       s11, s2, tp
                  remu         s1, a3, a6
                  fcvt.wu.s    t0, ft0, rtz
                  or           sp, a5, t6
                  fsgnjx.s     fa3, fs1, ft11
                  fclass.s     s6, fs9
                  fcvt.wu.s    t0, fs9
                  fdiv.s       ft9, fs8, ft4
                  or           a1, s10, a1
                  fmin.s       fs0, ft11, fa2
                  srli         a4, s1, 0
                  fmin.s       fs11, fs8, fa3
                  sll          a1, t3, s9
                  mul          s0, t4, t3
                  flt.s        s1, fs8, fs8
                  fdiv.s       fa4, ft11, fs8
                  addi         t2, s0, 258
                  fcvt.s.w     ft6, t6, rtz
                  addi         s8, t0, 869
                  slli         t1, t3, 27
                  fsgnjn.s     ft1, fs7, ft6
                  addi         a3, s7, -1935
                  sub          a3, tp, s2
                  slti         ra, s7, 92
                  remu         sp, a0, s11
                  fmv.w.x      ft10, zero
                  fmax.s       fs5, ft0, ft10
                  fclass.s     s11, ft1
                  fmul.s       fa4, fs10, fa0, rup
                  fcvt.w.s     s3, fs9, rtz
                  srli         s3, s11, 15
                  xori         a5, a1, -1639
                  fmv.w.x      ft3, s8
                  mulhu        a4, s0, sp
                  mulh         s2, s7, a0
                  fadd.s       ft6, fs11, ft9, rup
                  xori         ra, a0, 1484
                  fcvt.w.s     t0, fa1
                  fmax.s       fs7, fa7, fs9
                  mulhsu       s5, t2, s4
                  sra          s5, s5, a7
                  fdiv.s       fs6, fs0, fs2
                  fle.s        a7, fa5, ft6
                  sltiu        s3, s11, -2004
                  sltiu        t6, a2, 1229
                  or           s5, s6, s1
                  mulhu        t5, s7, s8
                  srai         a0, t2, 3
                  fcvt.s.wu    ft10, a2
                  mulhsu       t4, s8, a0
                  mulhsu       t2, a7, s5
                  divu         s6, t5, t2
                  slli         s2, a7, 17
                  fmul.s       ft10, fa7, fs11
                  fmv.w.x      fs9, s8
                  mul          s11, s7, s1
                  andi         sp, t4, -1580
                  mulh         s8, a6, t2
                  fcvt.w.s     zero, ft10
                  fsgnj.s      ft7, ft6, fs4
                  feq.s        s7, fs6, fs1
                  mulhu        tp, a7, t4
                  flt.s        s6, ft8, fs8
                  ori          s0, s5, 376
                  xor          a3, sp, s7
                  fcvt.wu.s    zero, fs3
                  fsgnjx.s     fa5, ft11, fs8
                  slli         t4, s1, 7
                  mul          ra, tp, a6
                  srli         a4, s7, 23
                  mulh         ra, s2, t4
                  add          s0, a3, t6
                  sltiu        a1, s7, 1465
                  sll          a0, s11, a1
                  flt.s        a3, fa2, ft11
                  addi         t6, a5, -136
                  nop
                  auipc        t2, 589371
                  sltu         s10, a1, t2
                  xori         s11, zero, 1155
                  fcvt.s.w     fs6, t1
                  lui          a4, 906120
                  rem          t1, t1, s5
                  fmax.s       fa6, ft9, ft9
                  div          a7, s8, t4
                  srai         s3, t0, 29
                  fmin.s       fs7, ft6, fs6
                  fcvt.s.wu    fa1, s8, rup
                  lui          s8, 629751
                  slti         a0, s5, -1627
                  srli         s8, a7, 12
                  fmin.s       fa4, fa7, fs5
                  fdiv.s       fs4, fa0, ft9
                  fsgnj.s      ft1, fa0, ft0
                  fdiv.s       fs0, ft5, fa4, rne
                  rem          t4, t3, a1
                  flt.s        a1, fa4, ft9
                  feq.s        sp, ft10, ft6
                  fsgnjn.s     fs5, fs10, fa2
                  and          a5, s4, a3
                  slli         t5, s1, 5
                  slti         s1, s7, 1623
                  srai         tp, t0, 27
                  rem          tp, t4, s11
                  fadd.s       fs11, fa0, fs7, rtz
                  mulh         a5, s10, s0
                  fsgnjn.s     fs5, fa2, fa1
                  fmv.w.x      ft10, s9
                  divu         t3, gp, a2
                  fmv.w.x      ft8, s0
                  nop
                  flt.s        t2, fs6, fs10
                  fle.s        a0, fs3, fs4
                  rem          s7, s4, s5
                  srai         t5, s0, 24
                  fcvt.wu.s    t0, ft9, rne
                  fle.s        t6, fs11, ft2
                  ori          zero, a4, -871
                  fsgnjx.s     fa6, fa5, fa1
                  slti         a3, a0, -778
                  fsgnjn.s     fs8, ft5, fa5
                  fcvt.s.wu    fa2, s5, rdn
                  divu         t3, ra, s4
                  xor          a1, t0, sp
                  fcvt.w.s     s7, ft10
                  auipc        a3, 674649
                  xor          tp, a5, s5
                  fcvt.w.s     a0, fs0
                  and          s6, s1, s4
                  fclass.s     a7, ft10
                  sltu         s5, ra, a7
                  div          t3, t3, t4
                  fcvt.wu.s    ra, ft6, rdn
                  andi         s1, t5, -332
                  fmv.x.w      gp, fa2
                  slt          s6, t3, t0
                  div          a7, s6, a4
                  mulhsu       a0, zero, t6
                  flt.s        s6, fs2, ft11
                  auipc        gp, 50550
                  sltiu        t0, s9, -104
                  fadd.s       fs5, ft6, ft8, rup
                  fcvt.s.w     fs0, sp, rmm
                  feq.s        a0, ft1, fs9
                  divu         tp, a6, t1
                  add          a4, s3, t1
                  fsgnjx.s     ft10, ft6, fa5
                  div          s10, t2, t1
                  srai         gp, gp, 9
                  fmv.x.w      a1, fs3
                  fsgnjx.s     fa3, fs5, ft0
                  nop
                  fle.s        t3, fa7, fs8
                  slt          a1, s3, s6
                  lui          s10, 924689
                  sltu         s11, t1, s8
                  fmul.s       fs0, fs2, ft6
                  fadd.s       fs2, fa0, ft3, rup
                  feq.s        t3, fa3, fa6
                  remu         s5, a6, s11
                  ori          ra, t5, 1227
                  sra          a3, t4, a6
                  fmv.x.w      s8, fs8
                  ori          t1, a2, 1266
                  and          s1, a5, a7
                  sltiu        a7, zero, -1201
                  sub          s6, gp, zero
                  ori          zero, gp, 259
                  fle.s        a5, fa5, fs10
                  fle.s        t0, fa6, ft5
                  srli         t4, a3, 5
                  fmax.s       fs7, ft5, ft11
                  sra          t0, s0, s1
                  andi         s8, t2, -1219
                  fle.s        s5, ft11, fa4
                  flt.s        a2, ft11, fs6
                  fsgnjn.s     fa3, ft9, fs0
                  rem          s3, a1, a6
                  ori          t2, s7, -575
                  fmin.s       fa0, fa1, fs7
                  and          t1, ra, t2
                  or           s3, s5, s8
                  fcvt.w.s     a1, ft3, rmm
                  fclass.s     s2, ft9
                  slti         t0, s1, -1889
                  fmv.x.w      a0, ft3
                  xori         s3, zero, -371
                  remu         s6, t1, a7
                  and          zero, s10, a0
                  or           a4, s8, t5
                  srl          gp, t3, t2
                  fmax.s       ft6, fa6, fa2
                  slli         t1, s2, 26
                  feq.s        t6, fs5, fs6
                  lui          s8, 459302
                  fsgnjx.s     fa1, ft0, fa4
                  ori          t5, s6, -427
                  add          gp, sp, s6
                  slti         s2, s0, -919
                  mulhu        t3, tp, a0
                  auipc        a5, 196617
                  sltiu        t2, s4, 1630
                  fcvt.s.wu    fs7, t6, rtz
                  slti         ra, ra, 173
                  fcvt.w.s     a4, fa7, rup
                  sra          a4, tp, a5
                  fsqrt.s      fs10, ft8
                  mul          a0, s7, a5
                  xori         a2, t5, 680
                  xori         a2, a0, 274
                  and          t0, s9, t5
                  fle.s        a7, ft7, ft4
                  xori         gp, t0, 1703
                  mul          s8, sp, t0
                  rem          a7, t5, t4
                  add          tp, s6, t3
                  xori         a2, a1, -1690
                  flt.s        ra, fs1, ft1
                  mulhsu       s8, s1, a4
                  srli         a0, s3, 0
                  fsgnj.s      ft1, fs4, fa3
                  fcvt.s.wu    ft9, s8
                  fsqrt.s      fs3, fs1
                  fadd.s       fa7, fs7, fs2
                  flt.s        t0, ft0, ft6
                  fsgnj.s      ft9, fs0, fs11
                  slti         s5, t0, -669
                  sltu         t1, s8, a3
                  addi         a2, tp, -522
                  xor          a0, s9, a4
                  sltu         t3, a4, a5
                  fsgnjx.s     fs2, ft8, fa7
                  xori         s6, s8, 388
                  fsgnjn.s     fa1, ft8, fs11
                  sll          s3, t5, a5
                  xor          gp, t2, t2
                  slt          s7, a5, a0
                  slt          t1, s4, s0
                  slti         a2, s10, 1647
                  mulhsu       ra, zero, a2
                  fdiv.s       ft2, fs5, fs0, rdn
                  rem          a0, t1, a0
                  xor          s10, zero, s8
                  feq.s        sp, fa4, fa4
                  fmv.w.x      ft1, s1
                  fdiv.s       fs5, ft7, ft10
                  flt.s        sp, fa5, fs2
                  lui          tp, 148164
                  mulh         a4, a4, a1
                  xori         t4, s2, -994
                  fsgnjx.s     fs0, ft0, fs9
                  sll          s8, s9, t2
                  xor          t6, a7, a6
                  div          s5, a7, s10
                  fcvt.s.w     ft9, gp
                  fsgnjx.s     fa6, ft10, ft4
                  mulhu        t5, a3, a7
                  srai         t2, a7, 16
                  rem          t3, t3, a5
                  fmul.s       fs6, fa1, ft8, rne
                  div          a2, s3, t0
                  sll          a7, t4, a5
                  addi         s5, s3, -1563
                  flt.s        a1, fs7, fs2
                  add          s3, s7, t0
                  slti         s7, a7, -1435
                  fmax.s       ft6, ft2, fa7
                  fsgnjn.s     fa4, fa7, ft0
                  fmax.s       ft10, fs4, fs11
                  mul          t2, t3, t1
                  fsgnjn.s     fa4, fa4, ft0
                  lui          s1, 434322
                  slti         gp, s5, -806
                  sll          a3, t2, s6
                  fcvt.w.s     zero, ft5, rmm
                  sll          t1, s3, s4
                  srl          a4, t5, a0
                  xori         a0, s6, -1961
                  srli         s6, a6, 1
                  add          a0, tp, s3
                  or           a0, a3, a1
                  xori         s6, s1, 372
                  slti         tp, t2, -960
                  remu         s2, a4, t5
                  fcvt.wu.s    s2, fs6
                  xor          a4, s1, t0
                  fle.s        zero, fs10, fs8
                  feq.s        gp, fs2, ft7
                  mulhsu       a1, a7, t1
                  fmul.s       ft2, fs1, fa6
                  mulhsu       gp, s11, tp
                  fclass.s     sp, fs0
                  remu         a5, a5, a2
                  rem          zero, s6, tp
                  xori         t4, s5, -859
                  slt          sp, s1, a4
                  fcvt.wu.s    s1, ft11, rup
                  srl          t1, zero, tp
                  fadd.s       fs1, fa2, ft8, rtz
                  fdiv.s       fa0, ft5, ft2
                  srl          s5, t6, zero
                  fmax.s       fs3, fs4, fs10
                  srl          a2, s4, s11
                  sll          t3, s8, ra
                  slt          t2, s4, s5
                  mul          t6, gp, s9
                  fsqrt.s      fs5, fs0
                  ori          gp, a7, -520
                  fdiv.s       ft6, fs3, ft7, rtz
                  sltu         s0, t2, s3
                  divu         s0, s0, t1
                  fsgnjn.s     ft4, fs6, ft7
                  fadd.s       ft6, fa3, ft1
                  fmv.w.x      fs1, ra
                  divu         s5, tp, s8
                  flt.s        tp, fa6, ft1
                  fmv.x.w      a1, fa2
                  ori          a0, s3, -951
                  sltiu        a3, s6, 123
                  andi         a7, s8, -766
                  sub          a1, s2, sp
                  fsub.s       fa2, fs5, fs6
                  slti         s6, a5, 540
                  slli         t2, t4, 4
                  addi         tp, t5, -672
                  fcvt.s.w     fa2, s0
                  mulh         s0, a0, a3
                  srl          sp, t4, t0
                  sltu         s1, a6, a2
                  slli         s10, tp, 11
                  divu         s2, ra, t4
                  xori         t6, s9, 966
                  or           s7, t4, a4
                  fcvt.w.s     ra, fa3
                  mul          s3, tp, gp
                  sll          s6, s3, sp
                  srai         a1, zero, 14
                  fsub.s       fa7, ft8, ft9
                  fdiv.s       ft5, ft3, fs8, rmm
                  rem          s1, t6, s3
                  sltu         zero, a0, t0
                  sltu         a5, zero, sp
                  div          a4, t2, t6
                  fle.s        zero, fs5, ft3
                  fmin.s       ft7, ft0, fa7
                  sltiu        a1, t0, -1381
                  xor          s2, s6, t0
                  divu         t0, t1, a1
                  add          ra, s9, t4
                  fmv.w.x      ft0, gp
                  fsgnjx.s     ft5, fa6, fa5
                  sltu         a2, a1, gp
                  and          sp, t3, s2
                  ori          sp, s1, 566
                  sra          gp, s7, s2
                  sll          a4, s0, t1
                  fcvt.s.wu    fa1, s1, rdn
                  slli         t3, t0, 19
                  srl          t0, a3, s3
                  slti         gp, s9, 908
                  fdiv.s       fs3, fa5, fa4
                  fdiv.s       fs4, ft10, ft0, rup
                  auipc        t0, 245555
                  fmv.x.w      t1, ft3
                  slt          a4, sp, t4
                  andi         a4, s6, -1444
                  fsgnj.s      fs6, ft11, fs9
                  div          t5, s5, s9
                  fcvt.w.s     s8, ft6, rmm
                  mulhu        a0, a6, s3
                  fmin.s       fs4, ft3, fa3
                  fsqrt.s      ft8, fa2, rne
                  srai         a5, gp, 29
                  flt.s        t2, ft11, fs11
                  fmax.s       ft8, fa6, ft10
                  add          tp, s5, s9
                  fmv.x.w      s0, ft9
                  mulhsu       zero, s8, sp
                  fcvt.s.w     ft4, t0
                  sra          t6, a6, s4
                  sra          t6, s8, s0
                  fmv.w.x      fs2, a0
                  fmv.w.x      fs11, t0
                  fcvt.wu.s    a2, fa7, rtz
                  sltiu        a0, tp, 1417
                  slli         s8, s9, 31
                  slti         a7, s1, -1181
                  fclass.s     ra, ft0
                  divu         tp, s5, s6
                  mulhsu       ra, s8, zero
                  srli         tp, a7, 25
                  lui          t6, 574501
                  sltiu        s5, t5, 532
                  sub          t2, s7, a3
                  sra          t5, a3, gp
                  andi         t1, s9, -1388
                  fmul.s       fs2, fa4, fa2
                  or           s6, t4, s11
                  flt.s        ra, fs7, fa3
                  fsgnjn.s     fs8, ft9, ft7
                  fsgnjn.s     ft2, fs9, fs6
                  fclass.s     a7, fa0
                  fcvt.s.wu    fa0, s6, rne
                  fle.s        t6, ft6, fs10
                  slti         t0, a4, 1680
                  fcvt.s.wu    fa1, s4
                  mulhu        t2, t0, a7
                  fcvt.wu.s    sp, ft4, rmm
                  xori         t3, s6, -1814
                  sra          t5, t3, a5
                  fsgnjn.s     ft5, fs2, fs9
                  fcvt.s.wu    fs10, s11
                  sra          zero, a2, a5
                  fdiv.s       ft10, fs11, fs7
                  sra          s3, ra, tp
                  mul          s1, a6, s1
                  divu         t0, t0, a4
                  fsqrt.s      fs5, fs8, rtz
                  fcvt.s.w     fa6, a4
                  fcvt.w.s     a7, ft6
                  fsqrt.s      fs6, ft6, rup
                  fcvt.s.wu    ft8, a0
                  add          zero, s1, t0
                  fsub.s       fa5, ft0, fs3
                  fcvt.w.s     a1, fa2
                  remu         s10, t3, t1
                  fmin.s       fs0, fa2, ft7
                  nop
                  mulhu        a1, a7, s3
                  fle.s        s8, ft0, fa6
                  slt          s3, a6, s1
                  srl          s1, s10, s11
                  remu         zero, a0, s6
                  rem          s5, a5, s8
                  srl          tp, a7, s1
                  fcvt.s.w     fs6, a4, rmm
                  ori          s7, s10, -219
                  auipc        s8, 707893
                  flt.s        zero, fs8, fs11
                  sltu         t2, t6, t2
                  fcvt.w.s     s3, ft6, rmm
                  fcvt.s.wu    fs10, sp
                  slti         gp, s1, 1707
                  addi         a2, t3, -2010
                  fcvt.w.s     t1, fs5
                  mulhsu       s5, s4, ra
                  nop
                  div          t2, s11, s5
                  rem          s8, t3, t4
                  fcvt.w.s     s10, ft10, rmm
                  auipc        t1, 163969
                  sltu         t6, a4, a0
                  srl          a3, s2, zero
                  fsgnjx.s     fa7, fs2, fs8
                  addi         s10, tp, 414
                  fsub.s       fs11, fs10, fa6
                  fsqrt.s      ft9, ft11
                  divu         a5, s5, t3
                  fcvt.w.s     zero, fs1
                  nop
                  fmv.x.w      s2, fs6
                  fdiv.s       fa7, fs1, fs7
                  feq.s        zero, ft10, fs10
                  fcvt.s.w     fs11, s5, rne
                  fmv.x.w      s8, fa6
                  xor          s5, zero, a6
                  fmin.s       ft8, fa0, fs11
                  slt          s8, zero, a3
                  feq.s        a3, ft1, fa5
                  addi         s1, a1, -960
                  fsqrt.s      ft8, ft11, rtz
                  xori         t1, tp, 251
                  slti         t4, t5, 746
                  fmul.s       fs2, fs2, ft4, rtz
                  lui          s10, 473404
                  fmv.x.w      t0, ft10
                  fmul.s       fs3, fa4, fs1, rup
                  fsub.s       fa3, ft11, ft1
                  fmv.x.w      ra, ft9
                  feq.s        ra, fs5, ft8
                  mulhsu       tp, s1, a2
                  slli         t6, a1, 24
                  xor          s6, s5, s2
                  xori         s3, s4, -1986
                  slli         s1, s10, 22
                  fdiv.s       ft8, fs5, fa1
                  fdiv.s       fs5, fs4, fs5, rtz
                  mulh         a2, a7, a4
                  srli         s10, s9, 12
                  sll          t2, s5, a4
                  sll          s11, s8, s11
                  fadd.s       fs4, fs11, fs5
                  srli         sp, s7, 2
                  andi         a7, t5, 1977
                  divu         s8, t4, t2
                  sltu         s7, a6, zero
                  fsgnjx.s     fs3, fs8, fa0
                  sub          a3, s6, a5
                  fsgnj.s      ft4, fa4, ft6
                  ori          t5, t0, 1416
                  divu         s8, zero, sp
                  nop
                  fadd.s       fs5, fs5, fa1, rmm
                  mulhu        a3, a5, tp
                  fmv.w.x      fa5, a6
                  sra          a5, s6, tp
                  mulhu        zero, a7, s4
                  slli         a1, a4, 19
                  fmv.x.w      a2, fs7
                  rem          a0, s10, zero
                  fsqrt.s      ft11, ft3
                  flt.s        s6, ft1, fs1
                  andi         s11, t6, 1314
                  fsub.s       fa4, fs11, fs4, rdn
                  sltiu        a3, s2, -1594
                  fadd.s       ft10, ft9, ft5
                  srai         s3, a3, 8
                  xori         t3, tp, 949
                  fclass.s     ra, fa3
                  andi         s7, s4, 1452
                  or           t3, a1, a3
                  flt.s        gp, fa6, fa3
                  remu         a1, s8, s6
                  sub          gp, s2, t6
                  div          tp, a3, a7
                  add          a5, s8, a4
                  remu         gp, s3, s5
                  mulh         s11, s10, a3
                  addi         s1, a0, -559
                  sltu         t2, a4, a2
                  srai         s3, sp, 6
                  add          t6, t4, t2
                  flt.s        t2, ft7, fs9
                  fle.s        a3, ft1, fa5
                  auipc        a0, 334789
                  divu         a1, s1, gp
                  rem          s2, a4, t1
                  ori          a1, tp, 164
                  lui          s0, 6614
                  mulhu        s5, a1, a1
                  addi         t0, gp, 228
                  fmv.w.x      fs9, a6
                  srai         s5, t6, 29
                  ori          t6, s0, -1364
                  remu         a7, s9, t0
                  feq.s        a1, fa7, fa6
                  fcvt.s.wu    ft8, a7, rup
                  fsqrt.s      fs5, ft9, rne
                  fcvt.s.w     fs10, t3
                  fmul.s       fa5, fa1, ft4, rdn
                  sltiu        a7, a7, 1533
                  sltiu        t1, s8, 1291
                  flt.s        s10, fs4, ft4
                  mulhsu       s5, s2, s9
                  or           t6, a1, t4
                  slli         s5, s1, 18
                  mulh         s8, t6, s3
                  mul          s8, tp, a7
                  xor          s7, a0, s6
                  fcvt.wu.s    a0, ft11
                  slli         a1, t5, 11
                  fsgnj.s      fs2, ft3, ft11
                  fmax.s       fs1, fa1, fs7
                  mulhu        s8, zero, s0
                  mulhsu       a1, a3, t5
                  srl          ra, t1, tp
                  sltiu        s0, a2, -836
                  xor          t1, t1, zero
                  fcvt.s.wu    fa7, a1, rmm
                  mulhu        a4, s4, s6
                  divu         t6, s11, a5
                  remu         a5, tp, s9
                  lui          zero, 155022
                  and          a5, gp, s7
                  fmax.s       fs4, fa1, ft11
                  andi         t6, a3, -1937
                  fadd.s       fa1, fa2, ft8
                  sub          s2, t0, t4
                  xor          tp, zero, s1
                  fadd.s       ft0, fs8, fa4, rup
                  divu         a2, zero, a4
                  fcvt.w.s     a7, ft5
                  fcvt.w.s     s7, fa6, rup
                  slti         s6, t1, 895
                  fsgnjn.s     ft11, ft10, fs1
                  fmin.s       ft11, fa4, ft4
                  feq.s        a4, ft0, ft11
                  sra          a7, a4, t1
                  fsgnjx.s     fs10, fa2, fs6
                  xor          ra, t4, a1
                  addi         a0, t4, -303
                  andi         sp, s11, -2035
                  ori          s6, s2, 1151
                  add          s2, t4, t4
                  slli         t1, ra, 0
                  fdiv.s       fs6, ft2, fs8, rmm
                  fsgnj.s      ft3, fs10, fs5
                  lui          a4, 510305
                  xori         t2, s2, 810
                  srl          t1, a4, t4
                  sll          s7, t6, s1
                  fdiv.s       ft10, ft4, ft7
                  mul          a4, t0, s0
                  fcvt.s.wu    ft4, s2, rne
                  mulhsu       t4, a0, zero
                  fmv.x.w      a1, fs7
                  sra          s1, s1, t3
                  fsub.s       ft4, ft7, fs6, rtz
                  fle.s        gp, fs8, fs5
                  sra          s1, a6, a4
                  andi         t6, gp, -1089
                  mul          t6, sp, s5
                  nop
                  fcvt.s.w     ft1, ra, rup
                  sll          t1, s10, t0
                  fmv.w.x      fs9, s3
                  fmax.s       fs4, ft3, fs2
                  srl          zero, sp, sp
                  mulhu        a0, a6, s11
                  and          ra, tp, s3
                  xori         ra, s11, 1895
                  and          a0, a1, s2
                  srli         t4, s11, 18
                  or           s11, s11, s3
                  feq.s        s3, fs8, fs11
                  mulhsu       t0, a3, a2
                  lui          a1, 120199
                  remu         s1, t3, t4
                  sltiu        t6, a7, 750
                  mul          s5, t5, s0
                  srl          s5, s4, s1
                  fdiv.s       fa4, fa2, ft10
                  addi         s3, sp, -1676
                  and          tp, s8, ra
                  fdiv.s       ft11, ft1, ft2, rup
                  mulhsu       a7, a2, s6
                  mulh         tp, s3, t0
                  fmax.s       ft6, fa0, fs2
                  feq.s        t0, fs8, fa5
                  feq.s        s1, fa1, fs1
                  fsgnjx.s     fs4, ft11, fa0
                  xor          ra, s7, s4
                  fmax.s       ft9, fs11, fa7
                  sltiu        ra, a0, 158
                  mulh         s7, t5, s8
                  auipc        s1, 310062
                  sll          t4, s5, ra
                  srai         zero, s7, 25
                  sltiu        a7, s3, -1158
                  add          s11, a4, t5
                  lui          a1, 649956
                  fmin.s       fs0, fs1, ft1
                  fcvt.w.s     a7, fs9
                  srli         s11, t3, 5
                  mulhsu       ra, t5, s7
                  xori         t5, a2, 290
                  divu         tp, s11, a3
                  divu         s10, s4, s9
                  fdiv.s       fa1, ft9, ft1
                  or           t1, s2, s0
                  remu         a7, a4, s4
                  feq.s        s1, ft10, ft6
                  mulh         gp, s3, a7
                  divu         s3, s11, sp
                  srai         s3, a1, 21
                  xor          a2, a2, s3
                  fmul.s       ft0, fa2, fs1
                  lui          a1, 352034
                  mulh         s0, a4, a2
                  fcvt.w.s     s2, ft5, rup
                  fle.s        s10, fa7, fa6
                  fadd.s       fs2, fs5, fs3
                  fmax.s       fa4, fs1, fs1
                  srai         t4, s4, 14
                  fclass.s     t6, fa3
                  srai         s0, t0, 8
                  fcvt.s.wu    fa7, s7, rne
                  slt          a3, t0, t4
                  fsgnj.s      fa6, ft0, ft4
                  fclass.s     t2, ft5
                  feq.s        s5, fs1, ft10
                  feq.s        s11, fs8, fs5
                  fle.s        a4, fa1, fs3
                  addi         t3, t2, -1681
                  divu         a7, zero, a2
                  fmv.x.w      s8, ft6
                  fcvt.s.w     fa4, tp
                  srli         t6, t1, 1
                  slt          t2, a0, a3
                  and          a3, s1, s2
                  auipc        a5, 433639
                  xori         ra, ra, -456
                  mulhsu       a7, a4, s4
                  or           s7, t1, s5
                  mulhsu       ra, s5, ra
                  fclass.s     a0, fa4
                  flt.s        s6, ft8, ft0
                  fsub.s       fs11, fa1, fs0, rdn
                  fadd.s       fs6, fs9, fa0, rne
                  fcvt.wu.s    t4, fs8
                  sll          t5, sp, s6
                  remu         a0, a1, s9
                  fadd.s       fs6, ft5, fs4
                  sll          s8, t2, a7
                  fsgnj.s      fs8, ft8, fa3
                  fsub.s       fa3, fs6, fs11
                  fadd.s       fs1, fa6, fs0, rup
                  sll          t3, a0, a0
                  mulh         a7, a0, s10
                  mulhsu       t3, a3, ra
                  fclass.s     s1, fs11
                  fcvt.s.w     fs2, s4, rdn
                  fmv.w.x      fs9, t6
                  slti         a2, gp, -341
                  addi         gp, a1, 1051
                  fsub.s       fs0, fs7, ft1, rne
                  fclass.s     s1, fa2
                  fadd.s       fs9, fa4, ft10
                  andi         a1, s10, -6
                  fmv.w.x      ft6, t2
                  fclass.s     tp, fs6
                  sll          t3, t4, s9
                  slti         t1, t6, 1023
                  srl          t0, a6, s8
                  fcvt.w.s     t6, ft8
                  fsgnjn.s     fa6, fs5, ft7
                  fsgnjn.s     fs3, fa7, ft1
                  sub          t0, s3, s4
                  srli         s2, t1, 15
                  fclass.s     zero, fs10
                  slli         s7, tp, 31
                  add          a3, s1, s10
                  xori         t6, ra, -2046
                  sra          tp, a2, gp
                  sltu         t6, t3, s3
                  mulhu        s1, t4, gp
                  fsgnj.s      fs7, fa6, fa4
                  lui          s5, 19693
                  sra          a7, s7, t4
                  nop
                  fadd.s       ft7, ft4, fs2
                  fsgnjn.s     fs4, fs7, fa4
                  fcvt.wu.s    s6, fs11
                  andi         t4, s1, -1157
                  fmax.s       fs11, ft6, ft2
                  fcvt.wu.s    t6, fa1, rdn
                  divu         s10, a6, sp
                  sltu         s2, ra, t5
                  flt.s        t2, fa2, ft8
                  div          a1, t0, s1
                  sra          t4, a0, t3
                  fmin.s       fa0, fs4, ft10
                  mul          s10, ra, t3
                  sub          s11, a2, a4
                  fmul.s       fs10, ft8, ft1, rdn
                  sra          s1, a5, sp
                  srl          a2, s8, s2
                  andi         t1, s0, -1310
                  slt          a4, s2, a1
                  rem          s10, s11, a7
                  sra          sp, s8, sp
                  fle.s        zero, ft0, ft5
                  slt          gp, t2, ra
                  addi         t4, a5, 306
                  sra          s11, t3, a0
                  fcvt.wu.s    t5, fs1, rne
                  fclass.s     s0, ft11
                  mul          sp, s2, s9
                  sll          t5, gp, s10
                  fsgnjn.s     fa0, fs7, fa1
                  sra          gp, s8, a3
                  fle.s        tp, fs2, fs3
                  fsub.s       fa2, fs11, ft0
                  xori         t2, t5, 1097
                  fmax.s       fs1, ft8, ft8
                  auipc        zero, 624552
                  nop
                  fsub.s       fa7, fs11, fa6, rup
                  sra          t0, a1, s7
                  auipc        zero, 252043
                  mulhu        t4, a0, a5
                  mul          a2, s5, t2
                  sll          sp, a3, t6
                  auipc        t3, 815342
                  mulh         gp, s6, zero
                  slli         s7, t1, 11
                  rem          s1, t4, s4
                  sub          sp, s10, s11
                  or           tp, t0, a7
                  sub          t1, t6, s2
                  and          t0, a5, s2
                  mulh         s7, gp, s1
                  fsub.s       fa5, fa1, ft3, rne
                  sll          a4, tp, s0
                  fadd.s       ft1, fs6, fa6
                  fsgnjx.s     fs2, fs6, fa3
                  addi         a0, sp, -493
                  fcvt.s.wu    fs10, t1
                  sll          t0, a6, s8
                  slli         t3, t0, 5
                  srl          s5, tp, a4
                  fcvt.w.s     zero, fa1, rup
                  fmul.s       ft7, ft4, ft8
                  and          s2, t3, t5
                  fsgnjx.s     fs3, ft8, fs0
                  srl          s8, a7, sp
                  srli         gp, a2, 0
                  fclass.s     a0, fs2
                  xor          a3, a2, a0
                  mul          tp, t2, t5
                  slt          s1, s3, s1
                  srli         tp, s11, 9
                  fsgnjx.s     fa4, ft9, ft1
                  auipc        zero, 766259
                  fsub.s       fa4, ft5, fs11
                  fmul.s       ft2, fs5, fs3
                  mulhsu       tp, s4, t4
                  sub          s6, a6, t1
                  sltiu        s6, ra, 479
                  fsgnj.s      fs9, fs6, fs2
                  and          t1, a0, a6
                  or           s5, a2, t4
                  fsgnj.s      fa4, ft7, fs2
                  divu         a7, a4, a7
                  xor          a3, tp, s1
                  fsub.s       fs5, fs11, fs0
                  fmul.s       ft4, fs2, fa2, rne
                  fsgnjx.s     ft3, ft2, fa3
                  add          a7, s10, s4
                  sub          t1, s2, s3
                  slli         a7, a0, 30
                  fmin.s       ft4, ft0, ft9
                  fmul.s       fs0, fs2, ft7
                  sra          s5, t0, tp
                  srli         a3, t5, 15
                  rem          s11, a4, a3
                  sra          tp, s11, t6
                  fclass.s     t5, ft10
                  ori          s2, a3, 637
                  fsub.s       ft10, fa1, ft0, rtz
                  srl          tp, t4, a6
                  fdiv.s       ft11, ft11, fa5
                  slt          a7, t1, s2
                  fsub.s       ft7, fa3, ft8, rtz
                  mulh         a4, t1, t5
                  mul          a4, s9, t2
                  fclass.s     s7, fs9
                  fdiv.s       ft1, ft4, fs1
                  divu         a0, s9, s8
                  fdiv.s       ft2, fs9, ft5, rdn
                  fle.s        s0, fa5, ft11
                  fcvt.s.wu    fa6, gp
                  srl          tp, ra, s3
                  fle.s        a4, ft9, ft2
                  xor          s6, s0, a7
                  rem          a5, s4, t5
                  sra          a5, s11, t3
                  feq.s        s3, fs0, ft2
                  flt.s        t2, ft4, fa3
                  slti         s0, s2, 734
                  divu         t2, t1, s5
                  xor          a7, t1, s6
                  sll          a2, s1, t5
                  fmul.s       ft3, fs8, ft7
                  srai         a7, t5, 7
                  lui          t5, 702809
                  fmax.s       ft7, fs7, fs6
                  srli         a0, s5, 14
                  xor          a0, s11, s3
                  rem          s7, s4, a1
                  fadd.s       fs3, fa0, ft6
                  fcvt.s.w     ft1, t0
                  xori         a7, s4, -1616
                  xor          a7, s10, t3
                  slli         t0, tp, 3
                  fsgnjx.s     fa7, fa2, fs2
                  sll          a1, s5, t0
                  fadd.s       fa7, fa3, fs6, rup
                  srli         s10, a2, 13
                  nop
                  fle.s        t5, fs2, fa3
                  rem          s10, zero, s10
                  slti         s8, a6, 406
                  mul          s8, s8, s10
                  andi         t0, a5, -1931
                  fcvt.s.w     fs6, s11, rne
                  add          t5, a7, t3
                  slti         a0, s2, 247
                  fclass.s     gp, fs6
                  fcvt.s.w     ft3, a4, rtz
                  srai         t6, a4, 12
                  xori         t4, a6, 692
                  remu         s5, a0, s4
                  remu         s5, a6, t5
                  fclass.s     a5, fs7
                  flt.s        s1, fs0, ft7
                  fsub.s       fs2, fs1, fa4
                  sra          t2, s9, a4
                  mulhsu       s11, t0, t0
                  flt.s        zero, fa2, fs11
                  fmv.w.x      ft6, t5
                  fcvt.s.w     ft3, t2, rtz
                  sub          tp, s1, a0
                  flt.s        s2, ft9, fs8
                  flt.s        a5, fa0, fs2
                  remu         a1, ra, a7
                  slti         t3, s2, 411
                  sll          s0, zero, sp
                  fsgnj.s      ft7, fs4, fs2
                  remu         s11, a6, s11
                  srl          s3, t1, s3
                  fsgnj.s      ft2, fs1, fa7
                  fle.s        gp, fs11, ft1
                  sra          sp, a1, t2
                  slti         a4, a7, 630
                  fclass.s     t6, ft6
                  fmul.s       fs10, fa0, fa6
                  fcvt.wu.s    s10, fs3
                  xor          s7, s5, s4
                  fcvt.wu.s    ra, fa5
                  sll          s5, s8, t2
                  nop
                  fsgnjx.s     ft4, fa4, fs6
                  srai         s11, a5, 12
                  xor          tp, s4, a1
                  srli         s8, a4, 10
                  xori         gp, t1, 894
                  sltiu        s5, zero, -438
                  fcvt.s.wu    ft7, zero, rne
                  fdiv.s       fa5, fa0, fs11, rtz
                  fcvt.w.s     s0, ft9
                  srai         s10, t1, 4
                  fclass.s     a2, fs4
                  fsgnjx.s     ft9, fs10, fa0
                  fadd.s       fs1, fa5, fa1, rdn
                  fle.s        t5, ft0, fa1
                  xor          a4, sp, s9
                  slt          a5, ra, sp
                  srli         s10, a5, 25
                  fsgnj.s      fs11, ft4, fs9
                  fsub.s       ft5, ft5, fs7, rtz
                  slli         a7, a0, 8
                  div          t4, a0, s9
                  sll          t6, s5, t5
                  slt          tp, s11, s8
                  fsub.s       fs9, ft4, ft7
                  or           a0, t1, s8
                  ori          a7, t1, -1219
                  sra          gp, s6, a5
                  rem          t2, s0, gp
                  addi         t3, t2, -1758
                  or           s2, a0, a3
                  fsub.s       ft5, fa6, ft7
                  fle.s        t0, ft1, fa3
                  fcvt.w.s     s8, fs3
                  div          s0, t0, s6
                  fcvt.s.w     fs8, s2
                  xori         t4, a7, -433
                  fsgnjn.s     fs4, fs9, ft4
                  slli         a7, s11, 1
                  and          a5, s9, s11
                  or           s2, t6, t0
                  mul          sp, a3, ra
                  addi         t5, s7, -1339
                  fadd.s       fs1, fs0, fa3
                  remu         a2, s8, a2
                  fmul.s       fa6, fs2, fs7
                  and          t6, t3, s7
                  or           zero, s1, ra
                  fclass.s     s1, ft5
                  flt.s        s10, fs5, ft1
                  fcvt.w.s     s10, ft6, rdn
                  rem          s6, a2, s11
                  fsgnjn.s     fa3, fs7, fa3
                  mul          t1, t3, s7
                  divu         t0, s1, a1
                  sll          t5, s1, t4
                  xor          s0, s1, tp
                  and          a0, a3, s1
                  fcvt.wu.s    a7, fa7, rup
                  srli         t6, s8, 24
                  mulhsu       a4, sp, s2
                  srai         tp, s5, 29
                  mulhu        gp, t2, ra
                  fsgnjn.s     fa2, fa1, fa2
                  slli         s10, a4, 29
                  slli         a7, s7, 15
                  xori         a5, gp, 1484
                  sll          t3, a3, a6
                  or           a4, s7, a3
                  fle.s        a1, fs0, fs1
                  fcvt.wu.s    a1, fs1
                  fmax.s       fa4, fs10, ft9
                  mulh         s6, s2, s4
                  fcvt.s.wu    ft9, s5
                  mulhu        a3, a3, s4
                  fclass.s     a2, fs0
                  fclass.s     s7, fs11
                  or           s0, a2, t0
                  mulhsu       t0, a5, s0
                  fadd.s       fa4, fs3, fs9, rne
                  srl          t5, s10, a5
                  fmin.s       fs4, ft8, fa1
                  xori         a7, ra, 1108
                  mulh         a7, t6, a2
                  remu         s10, s4, tp
                  fsgnj.s      fs0, fs2, fs11
                  fmv.x.w      s6, fa6
                  srai         s11, s11, 6
                  srl          s1, a2, s8
                  and          a4, tp, s0
                  sltiu        s3, s1, -456
                  feq.s        a4, ft1, ft3
                  fadd.s       fs10, fa2, ft6
                  sll          s0, a3, a6
                  fdiv.s       fa1, fs7, ft5, rmm
                  fmul.s       fs8, fa0, fa0, rmm
                  flt.s        s3, fs6, fs10
                  fdiv.s       ft6, ft2, ft8, rdn
                  sltiu        t5, a6, -657
                  fmin.s       ft4, ft10, ft3
                  remu         s1, a4, a6
                  flt.s        a5, fs10, fa0
                  feq.s        t2, ft10, fs3
                  andi         s5, s10, 836
                  fsub.s       fs7, ft11, fs4
                  fle.s        s2, fa0, ft6
                  fmv.x.w      t0, ft2
                  srai         a4, s5, 15
                  add          t5, a7, tp
                  lui          t5, 1016732
                  nop
                  fclass.s     tp, fs8
                  sltiu        a1, t1, -216
                  andi         s6, t2, 207
                  slt          s11, a3, a5
                  fcvt.s.w     ft4, a3
                  fsgnjx.s     fa0, fs1, ft11
                  fsub.s       ft10, fa6, fa3, rmm
                  fle.s        tp, fa3, fa1
                  or           s10, a7, sp
                  fle.s        t5, fa7, fs9
                  fsgnjn.s     ft5, fs8, ft4
                  fmul.s       fa1, fs0, ft5, rdn
                  fcvt.w.s     s3, ft0, rmm
                  nop
                  fdiv.s       ft6, ft8, fs4
                  mul          t1, a3, t4
                  srai         s6, s6, 10
                  fcvt.wu.s    tp, fa7, rup
                  fcvt.s.wu    fs11, t4
                  fmv.x.w      s0, ft5
                  srli         tp, s7, 5
                  fcvt.s.wu    fs4, a4
                  fmin.s       ft10, ft10, ft6
                  fmv.x.w      a3, ft7
                  fmin.s       fs0, ft5, fs6
                  and          s3, sp, a7
                  fadd.s       fs11, ft8, ft1, rdn
                  feq.s        a1, ft3, fa7
                  fsgnjn.s     ft11, fs2, fs4
                  mulhu        a1, s11, s8
                  fsgnjn.s     fa7, ft7, ft2
                  mulhu        zero, sp, s7
                  fsub.s       fs10, fs2, fs4, rup
                  xori         s5, t6, 51
                  nop
                  sra          s7, s6, t3
                  divu         t5, a3, s8
                  fcvt.wu.s    s10, ft2, rmm
                  rem          s6, t3, s8
                  xor          a2, gp, s5
                  fsgnjx.s     fs2, fs2, fa7
                  fmv.x.w      t4, fs9
                  fcvt.w.s     s5, fa5, rne
                  ori          s2, a1, 1362
                  fdiv.s       ft3, fa4, fa4, rup
                  mulh         a5, t2, a0
                  sra          s5, a7, s4
                  fcvt.s.w     ft2, a2, rmm
                  fsqrt.s      ft1, fa5, rtz
                  fle.s        a4, fs5, fs9
                  xori         s0, s1, -397
                  addi         t6, t3, -1181
                  mulhu        a1, t2, s5
                  fsgnj.s      ft2, ft3, ft9
                  fle.s        gp, fa0, fs7
                  rem          t1, s2, s2
                  flt.s        a5, fa6, fs3
                  mulhsu       a2, s10, s8
                  srai         t5, s10, 12
                  fmv.w.x      ft5, s5
                  auipc        s1, 831138
                  mul          a3, a1, tp
                  fmv.w.x      fs7, s1
                  and          s0, s1, s4
                  fmv.w.x      fs3, a5
                  sub          s8, gp, a6
                  divu         s5, t6, a2
                  slti         s1, s4, -831
                  feq.s        s1, ft5, ft2
                  fcvt.w.s     s7, ft11
                  nop
                  slti         a4, a5, 1485
                  fadd.s       fa7, ft4, fa0
                  fdiv.s       ft8, fa3, fs7
                  and          t4, s4, a2
                  slt          t3, gp, a7
                  fmv.x.w      a2, fs9
                  fcvt.s.w     fa6, t4
                  fdiv.s       fa2, ft7, fa6
                  feq.s        a7, fa2, ft0
                  feq.s        s0, fs3, ft10
                  remu         a1, s3, t0
                  fcvt.w.s     a5, fs11
                  remu         s10, s1, s9
                  feq.s        a7, ft10, ft10
                  sltiu        a0, a0, 1845
                  nop
                  fcvt.s.w     ft9, a0, rmm
                  sltiu        s11, a0, 1408
                  fsqrt.s      fs2, fs11, rmm
                  xor          ra, s5, zero
                  mulhsu       a4, t5, t3
                  fsgnjn.s     ft9, fs9, fa5
                  fsgnj.s      fa6, fa3, fs11
                  fsgnjx.s     ft1, fa2, fs5
                  fsgnjx.s     fs11, fa0, fs9
                  sltu         a1, s8, s4
                  ori          t1, t6, 606
                  xor          a5, s0, s5
                  flt.s        s2, fa5, fs6
                  xor          s2, s3, sp
                  rem          t4, s0, s7
                  srl          zero, s7, t6
                  sub          ra, s6, s9
                  fle.s        a1, ft5, fa7
                  slti         t3, s8, 849
                  fle.s        t0, ft5, fs3
                  fmv.w.x      fa5, s1
                  sltiu        t3, sp, 820
                  mulhsu       s2, t0, s8
                  xori         s1, ra, 712
                  div          a5, s4, s3
                  fmv.x.w      t4, fs1
                  remu         ra, a1, s4
                  srli         zero, t1, 12
                  slt          s0, s5, a1
                  sub          s7, t5, a3
                  xor          sp, s5, t1
                  fsgnj.s      ft4, fa5, fa6
                  add          t4, s5, a4
                  lui          tp, 1039042
                  sub          t3, ra, s5
                  sltu         s11, a1, a1
                  slti         ra, a7, -1453
                  feq.s        t6, ft10, fa0
                  fdiv.s       fs8, ft6, fs5
                  feq.s        a4, ft3, fs9
                  fcvt.wu.s    s2, fa7
                  fcvt.w.s     s6, fs0
                  rem          sp, zero, s0
                  fcvt.s.w     fa3, s4, rmm
                  mulhu        t6, s7, a0
                  fsgnjn.s     fs10, fa2, fs8
                  fmin.s       fa6, fa1, fs0
                  addi         t6, t0, 1784
                  nop
                  or           tp, s1, s2
                  divu         s6, s10, s8
                  auipc        sp, 236870
                  auipc        t6, 395451
                  fmin.s       ft0, fa1, fa7
                  xor          s6, a2, a0
                  auipc        t5, 982784
                  lui          t1, 397075
                  and          t4, s2, s5
                  fsgnj.s      ft0, ft9, ft8
                  sltiu        a3, t6, -895
                  fle.s        a1, fa5, fa7
                  sll          a2, s8, zero
                  add          tp, s6, s7
                  fmv.x.w      s7, fs1
                  xor          ra, s3, s3
                  fcvt.wu.s    a2, fs5
                  fle.s        s7, ft8, ft2
                  mul          s10, t0, gp
                  add          s2, a2, t1
                  sll          tp, zero, a2
                  divu         s11, s7, s8
                  remu         s7, s3, s1
                  ori          t4, s2, -2016
                  fmin.s       fs7, fs0, ft0
                  fsub.s       fa3, fa4, fs10
                  fcvt.s.wu    ft8, t3, rmm
                  xor          s8, t3, tp
                  and          a3, a4, s4
                  fmul.s       fa4, fs9, fs9, rup
                  srai         a1, a4, 16
                  mul          zero, a4, t5
                  fcvt.s.w     fs3, s3, rtz
                  fsgnjn.s     fs5, fs4, ft8
                  srai         s7, gp, 19
                  lui          gp, 357395
                  fmul.s       fa5, ft11, ft7
                  sltu         a5, zero, a5
                  fsgnjn.s     ft6, fs9, fa3
                  srl          ra, s0, s2
                  srli         t5, s3, 19
                  fsqrt.s      fs11, fs7
                  div          t4, t0, s11
                  divu         s0, s4, a7
                  srl          gp, s5, s5
                  fle.s        s11, ft4, fs8
                  srl          a1, a1, s8
                  fcvt.w.s     s1, fa4
                  fsub.s       fs3, ft11, ft5
                  fcvt.s.w     ft10, s10
                  mulh         a4, ra, s2
                  remu         t5, ra, s11
                  divu         s10, s7, a4
                  mulhu        t1, s1, s11
                  xor          a5, a2, s3
                  fclass.s     s7, fa2
                  rem          s7, s1, s0
                  addi         a3, t4, -1074
                  auipc        a5, 564884
                  slli         s11, s5, 19
                  sll          a7, sp, a2
                  fsqrt.s      ft10, fs3, rtz
                  sra          a1, t4, t2
                  fsqrt.s      fa2, fa3, rtz
                  sll          gp, s10, s2
                  rem          a2, ra, a3
                  addi         s7, sp, -1777
                  fmax.s       fa7, fa7, ft3
                  add          t3, a7, s6
                  fmv.w.x      fs3, s4
                  sll          zero, s6, s0
                  nop
                  andi         a0, s2, 1131
                  addi         t5, s8, -1675
                  fcvt.s.w     ft11, ra
                  rem          a4, t3, s6
                  fcvt.s.w     fs5, zero
                  xor          t5, a0, s9
                  fmin.s       ft1, fs3, fa7
                  sltiu        t5, a6, -730
                  and          t6, s11, a3
                  auipc        gp, 466314
                  sra          t0, t3, a3
                  andi         sp, t3, 1996
                  sra          s1, s1, s3
                  div          s0, s6, s4
                  fdiv.s       fs11, fs9, fa1
                  slli         zero, t0, 28
                  or           s2, s8, s2
                  sra          s6, a4, t2
                  nop
                  fclass.s     t0, fs0
                  mulh         t4, s6, a0
                  or           t6, s10, sp
                  mul          a5, gp, t5
                  addi         t1, a2, 417
                  fclass.s     a4, ft2
                  sltiu        sp, a6, -1420
                  sub          s10, t4, t6
                  lui          gp, 522448
                  addi         t5, a0, -792
                  fsgnjx.s     ft1, ft9, ft5
                  sltiu        t1, t5, -1439
                  fcvt.w.s     s0, ft0
                  srl          t0, zero, t0
                  mul          a0, t4, zero
                  fle.s        s1, fs2, ft4
                  add          s3, s4, a6
                  slli         a4, s1, 28
                  rem          ra, t1, a3
                  mulh         t3, t1, s11
                  fclass.s     s0, fs10
                  fmul.s       fa2, fs1, fs2, rup
                  fmin.s       fs2, fa6, fs6
                  remu         s2, t4, s6
                  fmv.w.x      fs3, a2
                  fcvt.wu.s    t4, ft5, rtz
                  srli         s5, t2, 8
                  slti         a5, t5, 1051
                  auipc        s3, 791307
                  fmax.s       ft5, fa1, ft9
                  lui          s11, 1012316
                  sll          t1, t5, t5
                  mulhu        t3, s5, t2
                  fclass.s     a1, fs2
                  mulhsu       a7, a4, gp
                  auipc        tp, 44993
                  flt.s        s8, fa1, ft9
                  fclass.s     t1, fa3
                  slt          s7, a0, sp
                  fsgnj.s      fa7, ft11, ft2
                  sltu         s6, t6, t6
                  fle.s        a0, ft0, ft2
                  sub          gp, s10, a4
                  sltiu        t1, t5, 228
                  sra          a7, a7, a1
                  fclass.s     s2, fa6
                  flt.s        t4, ft0, fs10
                  fmv.x.w      t2, fa0
                  div          t1, s7, s2
                  fmul.s       fs1, fs8, fs6, rmm
                  slli         s6, t0, 9
                  sltu         a4, t5, t3
                  srai         s7, s3, 5
                  slli         tp, a4, 29
                  fsub.s       ft3, ft5, ft10
                  fsgnjn.s     ft10, ft3, fs7
                  slli         a1, s1, 22
                  xori         sp, t6, 1524
                  fcvt.s.wu    fa1, t3, rdn
                  fclass.s     s11, fa6
                  fcvt.s.w     ft10, ra, rdn
                  fsgnj.s      ft9, ft5, fs1
                  mul          a7, t1, t4
                  rem          s8, t2, zero
                  mul          t0, a1, sp
                  sub          s10, s9, s1
                  feq.s        a1, fs4, fa0
                  fsgnjx.s     fs11, fa3, fs6
                  fcvt.s.wu    fs11, a2
                  fmv.x.w      gp, fs8
                  xori         s8, a1, -400
                  fmax.s       ft4, fs5, fs6
                  fmax.s       fs4, fa7, ft2
                  or           a7, s4, t2
                  and          a3, s4, t4
                  fadd.s       ft5, ft2, ft11
                  rem          sp, t3, zero
                  sra          a1, t1, ra
                  sub          a1, t5, t4
                  lui          s1, 808309
                  fsqrt.s      fa7, ft5, rne
                  srai         t0, s5, 27
                  fcvt.w.s     sp, fa6, rdn
                  nop
                  flt.s        t3, fs9, ft10
                  fle.s        s7, fa4, fs8
                  or           t1, s3, s7
                  remu         s10, gp, s11
                  fmv.w.x      ft3, s10
                  sll          s2, a2, sp
                  feq.s        sp, fs6, ft6
                  fcvt.wu.s    s2, ft1
                  mulh         s0, a3, s4
                  fsgnjx.s     fa1, fa6, fs5
                  fdiv.s       fs3, fa3, ft8, rmm
                  slti         t0, a0, -1255
                  xori         a1, gp, 1954
                  mulh         tp, a5, a7
                  mulh         s8, t0, t4
                  fcvt.wu.s    s5, fs10, rup
                  fsgnjx.s     fs10, fa1, ft11
                  flt.s        t2, ft0, fs1
                  fmv.x.w      t5, fs1
                  fmin.s       fa5, ft0, fs1
                  slti         s10, t4, 6
                  slti         t0, t0, -1237
                  andi         s5, s7, -1640
                  sltiu        s7, ra, 487
                  slli         a7, a5, 29
                  xor          t1, s0, s10
                  fadd.s       ft4, ft11, fs1
                  fsub.s       fs0, ft2, fa7
                  fsgnjn.s     fs9, ft8, fs6
                  sltiu        zero, s5, 1690
                  fadd.s       fs9, fs5, ft6
                  fcvt.wu.s    t2, ft1
                  fsgnjx.s     fa4, ft10, fs2
                  fsub.s       fs8, fa2, fs7
                  fsgnj.s      fa2, fa4, fs3
                  nop
                  fsgnjn.s     fs10, fs0, ft8
                  fsub.s       ft10, ft11, fa7, rmm
                  fcvt.s.wu    fs7, gp, rdn
                  sltiu        s3, s1, -1020
                  divu         sp, t6, a3
                  fdiv.s       ft9, ft4, fs3, rup
                  srai         s6, t5, 14
                  fcvt.wu.s    a3, fa3
                  flt.s        a7, fa3, fs2
                  andi         s3, a4, -68
                  fmv.w.x      ft4, s3
                  srl          s11, a0, t6
                  and          s6, t6, gp
                  fsgnjn.s     fs1, fa5, ft8
                  sltiu        sp, tp, -1087
                  sltu         sp, t1, a1
                  divu         a7, s8, a6
                  auipc        tp, 57665
                  remu         s5, a4, s6
                  nop
                  fcvt.s.wu    fs7, a6, rne
                  fmax.s       ft11, fa7, ft8
                  xor          t2, s5, a6
                  sra          s7, ra, s7
                  mulh         s2, a0, t2
                  div          s3, s3, s3
                  mul          t0, zero, s11
                  fle.s        s5, fa7, fa6
                  fle.s        t6, fs1, ft4
                  xori         a2, a0, -314
                  mul          s6, a5, s3
                  fcvt.s.w     ft8, t3
                  mul          ra, t3, gp
                  fcvt.s.w     fa0, t1, rup
                  fmin.s       fs6, ft9, ft2
                  fmv.w.x      ft4, a1
                  slti         a7, a2, -1203
                  fsgnj.s      fa0, ft3, fs0
                  div          s7, gp, a6
                  sll          ra, s11, gp
                  slti         s2, s10, 397
                  sub          s0, a1, ra
                  fcvt.w.s     s5, fa2
                  fsqrt.s      fs2, fa2, rup
                  sub          a0, a6, s7
                  sll          t0, s4, gp
                  srl          tp, a4, a6
                  fsqrt.s      fs11, fa0, rdn
                  nop
                  and          a7, s7, s4
                  auipc        t4, 394752
                  rem          t3, a7, t2
                  feq.s        t6, fs0, fs11
                  fclass.s     t3, fa1
                  mulh         s1, t5, s5
                  mulh         t1, t6, a7
                  srli         s11, gp, 11
                  mulh         s6, s8, s3
                  fmv.x.w      s6, fa7
                  or           t0, zero, s1
                  srl          zero, s11, a1
                  srli         s11, s0, 19
                  ori          a7, a3, 389
                  flt.s        t2, fs1, ft9
                  srl          zero, a3, s0
                  fdiv.s       ft10, fa1, fa0, rdn
                  mul          s1, sp, t6
                  or           s1, a0, sp
                  fle.s        t3, ft11, fs1
                  xor          s1, s6, a5
                  fcvt.s.wu    fs6, s7, rup
                  sub          s0, s11, a0
                  fcvt.s.wu    fs11, t5
                  divu         t1, s9, t1
                  flt.s        s10, fs3, fs7
                  rem          zero, sp, s1
                  fsub.s       ft11, ft11, fs8
                  fcvt.s.wu    fa7, s10
                  fmax.s       fa4, ft3, fs0
                  fdiv.s       fs6, fa3, fs10
                  andi         s2, a1, 1641
                  fcvt.s.w     ft11, s4, rup
                  add          tp, a1, a4
                  xor          t1, s5, ra
                  add          t0, s6, a5
                  flt.s        s5, ft3, fa2
                  flt.s        tp, ft9, fa3
                  ori          s5, a0, -697
                  fmv.x.w      a1, ft10
                  ori          t5, t0, -1486
                  xor          t3, t3, t1
                  mulh         t0, a0, t6
                  fmul.s       fa4, ft7, fs10, rdn
                  fcvt.s.wu    fa2, t6, rmm
                  sub          s0, a3, s10
                  srl          t3, t4, a3
                  srai         sp, a1, 26
                  mulh         s1, t0, s0
                  fmin.s       ft6, fs3, fa5
                  rem          s11, s2, ra
                  nop
                  fclass.s     zero, fs4
                  fsgnjn.s     ft8, ft0, ft11
                  ori          s11, s7, -1283
                  flt.s        t3, ft9, fa4
                  div          t5, t2, a5
                  and          t2, a6, t2
                  srl          t5, a6, a1
                  xor          s7, s3, s3
                  or           a2, sp, s2
                  srai         t5, s0, 17
                  sra          tp, t5, tp
                  fmul.s       fa5, ft2, ft3
                  mulhsu       a1, t6, t1
                  ori          gp, sp, -2023
                  divu         sp, s6, s10
                  add          t5, zero, s4
                  remu         ra, a3, a5
                  sll          zero, s6, s10
                  feq.s        a0, fs8, ft8
                  auipc        s10, 725678
                  srai         t6, s5, 14
                  flt.s        s3, ft0, fs0
                  mulh         s11, t2, t1
                  add          a5, s6, a5
                  fsgnjx.s     fs9, fa1, fs10
                  fclass.s     a3, fa4
                  sltiu        a7, s1, -1217
                  sra          t4, a0, a5
                  fsgnjx.s     fs2, fs0, fa7
                  sra          sp, t5, s11
                  remu         s10, tp, s1
                  fmax.s       fa5, fs0, ft11
                  fcvt.wu.s    s6, fs5
                  fcvt.w.s     t1, ft5
                  ori          a1, s7, 1628
                  fsgnj.s      fa7, fs8, fs6
                  addi         s2, a5, 239
                  fcvt.s.w     fs10, t1, rne
                  fdiv.s       fs8, fs0, fa6, rup
                  flt.s        s8, ft7, fs10
                  divu         t4, zero, gp
                  sra          s10, t4, s1
                  and          t6, a0, s2
                  fcvt.s.wu    fa7, t4, rtz
                  divu         t0, s2, sp
                  fdiv.s       ft10, fs11, fa7
                  fcvt.s.wu    fs0, sp, rdn
                  fsqrt.s      ft2, fa0, rmm
                  mulh         a4, s0, t3
                  fmul.s       fa5, ft5, fs10, rup
                  fcvt.s.w     fs1, t6, rup
                  mul          s3, s1, s8
                  add          s3, s6, t6
                  fsub.s       ft0, fs8, ft10, rne
                  fmv.x.w      s6, fa0
                  fmul.s       fa0, ft7, fa4
                  fsgnjx.s     fa7, fa5, fs1
                  fmax.s       ft1, fs9, fa3
                  lui          t5, 336758
                  fcvt.s.w     fa0, a2, rup
                  div          s6, t1, s0
                  ori          tp, a7, -993
                  fcvt.s.wu    fs0, t0, rmm
                  or           a7, zero, s5
                  fsub.s       fa2, fs9, fs1, rne
                  fdiv.s       fs11, ft1, ft3, rdn
                  fsqrt.s      fa0, ft8, rtz
                  xori         a7, a5, 488
                  fmin.s       ft11, fa0, fs2
                  fdiv.s       fa5, fs11, fs1, rtz
                  and          a0, s6, gp
                  xor          s1, zero, a0
                  xor          a2, t1, a6
                  feq.s        s7, ft3, ft7
                  fsub.s       fa5, ft3, fs8
                  fdiv.s       fa3, ft0, ft5
                  fdiv.s       ft8, ft10, fs2, rmm
                  fadd.s       fs8, ft0, ft8
                  andi         s7, zero, 1273
                  xor          tp, sp, s2
                  fadd.s       fs1, fs2, fa5
                  mulh         s3, s1, zero
                  fle.s        s5, ft11, fs10
                  auipc        t3, 329754
                  fcvt.s.w     fa4, a5
                  fsgnj.s      fs4, fa4, ft0
                  fsub.s       fs10, ft10, fs11
                  fmin.s       fa6, fa3, fa3
                  srai         s8, t4, 5
                  addi         t0, s10, 1930
                  flt.s        zero, ft7, ft6
                  addi         s0, t1, -1580
                  srl          a5, s3, sp
                  xor          t5, t3, s7
                  sra          s5, zero, s5
                  auipc        a1, 973966
                  fadd.s       fa2, fs2, fa3, rmm
                  lui          a3, 360255
                  fmv.x.w      zero, fa7
                  fmv.x.w      t3, ft1
                  sub          sp, a5, tp
                  rem          s7, sp, tp
                  mul          a4, sp, s10
                  rem          s7, s0, a6
                  fmin.s       fs6, fs10, fs4
                  fcvt.w.s     s10, ft10, rne
                  slli         t3, t1, 28
                  fcvt.w.s     t6, fa4, rup
                  fsgnjn.s     ft11, fs7, ft1
                  fcvt.wu.s    t0, fs7
                  feq.s        a3, fs8, ft8
                  auipc        zero, 502086
                  sub          t0, t4, t5
                  slti         zero, a7, 1308
                  sra          s8, t1, t2
                  fmul.s       fs3, ft5, fa7
                  sll          t0, a2, a6
                  rem          t1, s3, gp
                  fadd.s       ft2, fs8, fs10
                  flt.s        t3, fs5, fa2
                  fsgnjn.s     fa6, fa2, fs6
                  fsqrt.s      fs10, ft3, rup
                  fsgnjn.s     fs7, fs9, fs6
                  slt          s5, s9, t1
                  srli         zero, t2, 30
                  fle.s        t4, fs5, ft8
                  fclass.s     zero, fa7
                  fmin.s       ft7, fs8, fs0
                  or           tp, gp, s1
                  or           t4, a6, gp
                  fsub.s       fa5, ft9, fs6, rtz
                  fcvt.s.wu    fs10, a1, rtz
                  slti         a5, ra, 754
                  and          a3, s7, tp
                  and          a7, t1, s0
                  andi         s1, t3, -776
                  fcvt.s.w     ft2, a2
                  mulhsu       s0, a2, s4
                  nop
                  sltiu        ra, s6, 3
                  feq.s        a3, fa2, ft7
                  srli         gp, s10, 21
                  fmul.s       ft8, fs11, ft2, rup
                  srli         t0, gp, 7
                  fcvt.s.wu    fs9, s0
                  mul          s3, a4, s5
                  sltu         a2, ra, t5
                  sltu         gp, s1, s6
                  mulhsu       s0, s4, a2
                  divu         s0, t0, s1
                  div          a4, zero, gp
                  andi         a4, a3, -1599
                  mul          ra, t5, s2
                  mulhu        gp, a2, s9
                  xor          s3, s1, sp
                  fmax.s       fs2, fs8, ft0
                  remu         a7, a6, a5
                  srli         t5, a5, 7
                  fsub.s       ft10, fs9, fa7, rdn
                  flt.s        tp, fs4, fs4
                  mulh         s0, t1, t6
                  fmv.x.w      s3, fa0
                  sub          t3, t2, t1
                  fsgnjx.s     fa1, fs10, fs6
                  fmul.s       fs10, ft5, fa6, rmm
                  slti         t5, s4, 230
                  fcvt.w.s     t4, fs11, rup
                  fmv.x.w      s5, ft4
                  mulh         sp, a0, a6
                  mulh         a5, tp, a5
                  lui          t4, 566279
                  sub          s2, a4, t4
                  rem          s7, s4, zero
                  fdiv.s       fa2, fs7, ft4, rtz
                  fmin.s       ft6, fa5, fs1
                  xori         t2, t0, -846
                  fsub.s       ft5, fs11, ft8, rne
                  sltu         s0, tp, s6
                  mulhu        t2, a6, a4
                  fmin.s       ft5, ft10, ft3
                  feq.s        s6, ft8, fa2
                  fmul.s       fs4, fs9, fa6, rne
                  and          t2, s6, s8
                  fdiv.s       fs9, fs0, fs8
                  fdiv.s       fs1, fs1, ft3, rdn
                  feq.s        s10, ft1, ft0
                  fmv.x.w      t0, fs6
                  xori         s11, s7, 855
                  or           s10, s9, t2
                  sra          a3, a0, a3
                  or           a3, t6, t5
                  fsgnjn.s     ft4, ft3, ft11
                  sll          a3, a3, gp
                  div          t4, a6, s10
                  srai         t4, s7, 12
                  fsgnjn.s     ft8, fa3, fs1
                  sra          t1, s11, s10
                  flt.s        a5, fs6, ft4
                  srai         ra, s6, 18
                  slt          t5, s4, s7
                  divu         a3, zero, a1
                  flt.s        s7, fs8, fs11
                  divu         a3, s10, s10
                  fcvt.w.s     ra, fa3, rup
                  fsqrt.s      fa7, ft8
                  fclass.s     a1, ft11
                  lui          a5, 400806
                  sra          a0, a6, t5
                  srl          s2, tp, s9
                  fclass.s     sp, ft4
                  fmin.s       ft1, ft3, fs11
                  sltu         tp, t0, s9
                  divu         a7, s8, t2
                  andi         a4, a4, -156
                  slli         zero, a4, 6
                  fmin.s       fa7, ft0, fs7
                  fadd.s       fs4, ft8, fa6
                  fdiv.s       fs0, fs9, fs4, rne
                  remu         s2, sp, t3
                  lui          zero, 558009
                  sub          s5, t3, a0
                  fle.s        t4, ft4, fs4
                  fmv.x.w      t1, fa2
                  lui          s7, 709275
                  fsub.s       ft0, fs5, fs8
                  rem          a2, tp, zero
                  slti         a0, s7, 423
                  feq.s        s10, fa6, fs11
                  ori          a3, s7, 1381
                  fsgnjn.s     fs1, fs0, ft0
                  fle.s        zero, fs2, fa0
                  srl          s2, s9, s6
                  addi         a4, s10, 1062
                  slti         s10, tp, -690
                  slt          s11, sp, sp
                  flt.s        a3, fs1, fa7
                  fsgnjn.s     fs4, ft8, fa0
                  auipc        a3, 45644
                  sltu         t5, t0, s6
                  sltiu        tp, gp, 1792
                  add          s5, sp, zero
                  fmv.x.w      t2, fa5
                  fmul.s       ft11, fs5, fa1, rtz
                  sltu         t3, a2, s6
                  sltiu        a0, a7, -2043
                  sub          t5, s4, s8
                  or           t5, s10, t4
                  sub          a7, s9, s4
                  auipc        s11, 80149
                  mul          t2, s1, s3
                  srli         gp, a7, 31
                  fclass.s     a4, fs6
                  mulhu        t2, s1, s2
                  fdiv.s       fa4, fa4, fa1
                  fsub.s       fs9, ft6, ft0
                  srai         s2, t4, 7
                  addi         a7, a3, 660
                  xor          s0, s5, t5
                  feq.s        a1, fs7, ft10
                  fsgnjn.s     fa6, fs8, ft0
                  auipc        s1, 1028521
                  srl          s2, zero, s3
                  fsgnjn.s     fs6, fa3, ft7
                  div          t0, s4, a0
                  rem          a5, gp, s11
                  sra          a7, gp, t2
                  sltiu        t3, a5, -482
                  andi         s1, a0, 1862
                  srai         t6, zero, 4
                  rem          s6, t0, a3
                  sltiu        t0, t4, 40
                  fcvt.wu.s    a1, fs7
                  slti         s8, tp, 719
                  sll          t2, s0, sp
                  addi         s7, ra, -219
                  sltiu        a5, zero, -706
                  fclass.s     s7, ft7
                  xor          t5, s11, a4
                  fmul.s       ft4, fa5, fa4
                  xori         s7, s10, -648
                  flt.s        s5, fa3, ft2
                  feq.s        a4, fa1, ft3
                  mulhsu       tp, a0, a6
                  fle.s        t0, fs3, fs6
                  sll          t6, t5, t1
                  srl          t1, s3, t5
                  fsgnjn.s     fs6, fs5, fs4
                  mulhsu       t4, s1, a3
                  fcvt.w.s     ra, fs7, rmm
                  fclass.s     s6, ft2
                  sll          s7, a0, s5
                  fclass.s     gp, fs2
                  remu         s8, t2, s4
                  fdiv.s       fa6, ft9, fs3, rtz
                  rem          s3, ra, s2
                  mulhsu       s1, s5, s0
                  fmul.s       fs1, fa3, ft2, rne
                  sltu         t4, gp, s5
                  feq.s        s10, ft8, fa5
                  or           t4, s3, t6
                  ori          t0, s7, 1928
                  lui          a3, 93213
                  fmv.x.w      a1, ft9
                  fle.s        t0, ft5, fa2
                  mulh         t2, s1, s11
                  add          t6, a4, a6
                  srli         a2, ra, 13
                  fmin.s       fs8, ft8, fs7
                  slt          a3, sp, a4
                  srai         s6, s2, 13
                  sra          t6, t2, t3
                  srl          s5, tp, a3
                  andi         a2, s9, -1258
                  fsub.s       fs7, ft5, ft1, rup
                  srai         s8, s8, 4
                  addi         s1, t3, 1480
                  div          sp, s9, a1
                  addi         a3, s1, 204
                  mulh         sp, t6, s3
                  flt.s        sp, fs3, fa7
                  fadd.s       ft2, ft3, ft10, rtz
                  sltu         s11, ra, t5
                  sltiu        s0, t4, -500
                  fmin.s       ft5, fa5, fa2
                  feq.s        t4, fs5, ft0
                  fmin.s       fs3, fa6, fs8
                  nop
                  srai         s0, t5, 22
                  divu         t3, t5, s11
                  slli         a2, s4, 21
                  slli         sp, s4, 17
                  fmv.x.w      a0, fs4
                  mulhu        s10, t6, a0
                  fsgnj.s      fs4, fa5, ft5
                  fsub.s       ft1, fa4, fs8
                  addi         gp, s10, 1080
                  fsgnjn.s     fa1, fa1, ft3
                  addi         t4, s8, -1323
                  srli         tp, s6, 30
                  fcvt.w.s     a7, fs8
                  xor          ra, a7, t4
                  sltu         a4, t0, t4
                  fsgnjn.s     ft3, fs6, fs10
                  srai         s5, s10, 8
                  mulhsu       s5, s8, ra
                  sub          a1, s11, t3
                  sub          a7, s4, s1
                  fsub.s       fs5, fs1, ft10
                  fmul.s       ft5, fs4, fa2
                  fcvt.wu.s    tp, ft0, rtz
                  fmv.w.x      fs4, zero
                  divu         a7, a1, t3
                  rem          s5, s1, a0
                  fmax.s       ft11, fa3, fs1
                  fsgnj.s      fs0, fa3, ft5
                  or           t6, a2, t5
                  sra          s1, zero, t0
                  and          s2, s5, a6
                  sltiu        s10, t5, 1997
                  fsgnj.s      ft6, ft2, ft11
                  div          ra, a5, s0
                  remu         t1, ra, a6
                  sltiu        s8, t6, -161
                  andi         s1, a5, 548
                  fsgnjx.s     fs8, ft0, fs9
                  mulh         s10, s5, zero
                  mulh         sp, s3, a2
                  fcvt.s.wu    ft2, s1
                  xor          a2, t5, a4
                  fcvt.s.w     fs5, s5, rup
                  fsgnjx.s     fs5, fa3, ft4
                  fcvt.w.s     ra, fs1, rdn
                  srai         sp, a5, 19
                  div          t1, s3, s10
                  feq.s        s0, fs10, ft6
                  fsgnjx.s     fa2, fs6, fa1
                  add          s1, sp, zero
                  fsgnjx.s     ft11, fa6, fs4
                  xori         t5, s7, -402
                  fle.s        a5, fs10, fa1
                  divu         s2, t6, a7
                  ori          a7, ra, 1771
                  sltiu        s2, t2, -1920
                  or           t6, tp, s4
                  fmv.w.x      fa0, s7
                  sub          t5, ra, sp
                  fcvt.s.w     fs6, s8, rup
                  fmin.s       ft0, fs4, ft10
                  flt.s        a4, ft11, ft5
                  ori          t6, a0, 283
                  fcvt.s.wu    ft2, gp, rmm
                  srli         t0, s11, 9
                  xori         s2, a2, 1339
                  sll          t0, t2, t0
                  fcvt.s.wu    fs0, s2, rne
                  divu         a2, ra, s11
                  slt          a0, t1, t3
                  xor          a5, a7, s3
                  or           s10, s1, t6
                  xor          s1, ra, a4
                  fmax.s       ft9, fs3, fa3
                  fadd.s       ft1, ft3, ft1, rtz
                  fcvt.s.w     ft1, t0, rtz
                  mulhsu       a1, s1, a5
                  addi         sp, s7, 1754
                  srai         t1, s5, 19
                  srli         t3, s11, 21
                  auipc        sp, 41190
                  div          s7, t5, ra
                  srai         s5, t4, 27
                  fdiv.s       ft7, fs11, fs6, rdn
                  mulhsu       t5, t0, ra
                  ori          s1, s9, 329
                  auipc        s7, 1006666
                  andi         s3, a6, 622
                  fle.s        a7, fs1, fs11
                  rem          zero, tp, t4
                  fcvt.wu.s    a2, fs2
                  ori          s7, s9, -1383
                  div          a7, t6, s7
                  fadd.s       fa3, ft11, fs4
                  fsgnjn.s     fs5, fa5, fs9
                  divu         a2, s1, s6
                  fmax.s       fs2, fs2, fs1
                  fcvt.s.w     fa2, a1, rup
                  fsqrt.s      fs5, ft3, rdn
                  or           a1, t5, a4
                  mulhsu       a1, s7, s8
                  fsgnj.s      fa4, ft6, fs6
                  xor          t0, t1, a3
                  fmax.s       fs6, fa3, ft1
                  fmin.s       ft4, fs11, fs3
                  lui          s2, 850027
                  rem          t6, gp, a7
                  fdiv.s       fa1, fa6, fs2
                  mul          s11, a2, a2
                  or           tp, a0, s8
                  sra          a7, s8, t1
                  div          a5, s10, a7
                  srli         t6, s6, 11
                  srli         a7, t4, 24
                  mulh         zero, s8, tp
                  fmv.w.x      fs3, s0
                  lui          s0, 630131
                  fle.s        s6, ft2, ft4
                  mul          a4, s6, t6
                  fmul.s       fs1, fs1, fa7, rne
                  fadd.s       ft11, fa2, fs9
                  fsgnj.s      ft4, fs9, fa1
                  sra          ra, s8, s1
                  fcvt.wu.s    t6, ft8, rmm
                  fclass.s     ra, ft0
                  flt.s        zero, fs10, ft3
                  fcvt.s.w     fs0, a5
                  slli         t1, s7, 29
                  sltiu        sp, a2, -1572
                  nop
                  mulhsu       gp, t6, s3
                  fsgnj.s      fs5, fs2, fs10
                  fcvt.s.w     fs6, s0, rup
                  fclass.s     s5, fa2
                  fcvt.s.wu    ft3, t0, rup
                  rem          s8, s3, a4
                  addi         t0, a0, 550
                  slt          t1, t4, s5
                  slti         s2, a6, -427
                  ori          tp, a2, -644
                  or           a1, gp, t5
                  flt.s        s3, fa3, fs6
                  fsqrt.s      fs4, ft1
                  srai         ra, s10, 19
                  xori         s2, t2, 343
                  mulh         a7, s4, a7
                  fclass.s     t0, ft7
                  fdiv.s       fa2, ft3, fa2, rmm
                  fsub.s       fa2, fa1, fs4, rdn
                  fcvt.w.s     t4, ft11, rne
                  fadd.s       fs6, fs6, fs7, rtz
                  fsgnjn.s     fa0, fs8, ft2
                  lui          sp, 675960
                  fcvt.w.s     t3, ft8, rup
                  remu         a0, a3, s2
                  sll          a5, a4, s7
                  fadd.s       ft6, fa1, fs2
                  slti         s10, s7, 310
                  fsgnjn.s     ft0, fa2, fs11
                  feq.s        a1, fa6, ft4
                  slt          t1, tp, s6
                  feq.s        a7, fs8, ft0
                  mul          s0, t2, s8
                  mulh         s7, t3, t0
                  fmin.s       fs0, fs0, ft10
                  fdiv.s       ft4, fs1, fa2, rdn
                  rem          ra, t3, s10
                  fmax.s       ft2, fs9, fs3
                  mulhu        s5, tp, t5
                  fcvt.s.w     fa4, s5, rne
                  sltiu        s5, s2, -141
                  mulh         s1, gp, a0
                  sltu         a7, s11, ra
                  fle.s        a5, fa5, ft1
                  fcvt.w.s     t4, ft4, rup
                  fadd.s       ft10, fs10, fs10, rdn
                  slt          t1, ra, s11
                  fcvt.s.w     fs1, tp, rmm
                  sub          t0, s8, t4
                  flt.s        tp, ft10, fs8
                  slt          s0, s5, ra
                  rem          s3, gp, sp
                  sub          s7, ra, s3
                  fmul.s       fa4, fs8, fs9
                  mulh         t5, a4, a2
                  feq.s        s1, ft11, fs2
                  fmax.s       fs9, ft6, fs10
                  slli         t3, a4, 7
                  fcvt.wu.s    ra, ft0
                  fsgnjx.s     ft11, fs3, ft7
                  andi         sp, s1, -1370
                  fadd.s       fs1, fa0, ft10
                  srai         s5, s0, 30
                  sub          a1, t6, t2
                  sll          zero, s1, s3
                  mulhu        s2, t1, a7
                  remu         t1, t4, a7
                  slli         a1, a4, 5
                  fmv.w.x      fa0, a4
                  fsgnjn.s     fa5, fs5, fs4
                  sra          s7, zero, gp
                  slt          a7, a1, t4
                  andi         t3, gp, -1152
                  fsub.s       fa3, ft3, fs3, rdn
                  fmul.s       fs3, fa1, fa5
                  sltiu        s8, s0, 506
                  fsub.s       fs4, fa1, ft7, rmm
                  xori         ra, s2, -754
                  addi         a4, t1, 1098
                  slt          t5, t3, s0
                  lui          a2, 423232
                  and          t0, s6, s1
                  fcvt.s.w     ft7, t2
                  mulhu        t4, a1, s11
                  fcvt.s.w     fs5, t4
                  fdiv.s       fa4, ft8, ft5
                  srai         t6, t1, 29
                  feq.s        s1, ft5, ft3
                  sll          s7, t3, s3
                  sll          s0, s4, a0
                  flt.s        a1, ft8, fa3
                  fclass.s     s2, fs6
                  fdiv.s       fs0, fa6, fs0
                  fmax.s       ft11, fs1, fa0
                  mulhu        t1, s6, a3
                  xor          t1, t1, s6
                  remu         ra, s4, a7
                  mulhu        s5, s6, s1
                  ori          zero, s5, -826
                  fmv.w.x      fa5, t5
                  fmv.w.x      fs8, s11
                  xori         s6, s11, 871
                  slli         a7, t3, 11
                  fclass.s     t4, fs9
                  sra          s11, a7, sp
                  fcvt.w.s     s6, fa4
                  sll          t5, a5, t5
                  lui          ra, 288467
                  fsgnjn.s     fa7, fa2, ft4
                  mul          t6, s5, tp
                  slt          a1, s0, t4
                  fsgnjn.s     fa3, fs10, ft3
                  ori          t1, t6, 16
                  fle.s        s1, fs5, ft6
                  fsqrt.s      ft3, ft11
                  fsgnjx.s     fa5, fs7, fs6
                  fmin.s       ft11, fa7, ft1
                  sra          t1, s3, t2
                  mul          tp, a5, s1
                  rem          s2, s4, a7
                  xori         sp, tp, -771
                  ori          zero, a2, -11
                  addi         s0, a4, 91
                  fle.s        a2, fa3, ft4
                  flt.s        s1, fa4, fs7
                  mulhsu       a4, t3, s7
                  xor          a0, s8, a5
                  fsgnj.s      ft9, fs11, fa5
                  flt.s        ra, ft11, ft3
                  andi         a7, s9, -1139
                  add          a1, s0, a5
                  fclass.s     tp, fs7
                  sltiu        a5, t0, -1693
                  fmv.w.x      fs3, t6
                  srl          t5, a3, s0
                  slt          s5, s6, zero
                  div          a1, s8, t0
                  fmv.w.x      fs8, s7
                  fsqrt.s      fs2, ft5, rtz
                  fmul.s       fa7, fa1, ft6, rne
                  mulhu        s6, s3, a5
                  fclass.s     t0, fa1
                  fmin.s       ft6, ft1, fs11
                  fsub.s       fa7, fa5, ft11, rdn
                  auipc        s5, 795650
                  divu         a0, t6, s5
                  slli         s0, t6, 15
                  rem          s10, s10, ra
                  fmv.x.w      ra, ft8
                  fcvt.wu.s    s0, fs0, rtz
                  addi         a1, s10, -1546
                  fcvt.s.w     fs4, s4, rne
                  srai         sp, a6, 26
                  sra          zero, s11, s10
                  fcvt.s.w     fa1, s2
                  slli         a7, s3, 24
                  xor          s1, sp, a0
                  nop
                  andi         a4, a3, -1469
                  rem          gp, a6, tp
                  divu         zero, a3, s1
                  ori          t2, a6, -822
                  sra          s3, t3, s4
                  remu         sp, t5, a3
                  auipc        s11, 757981
                  fdiv.s       fs7, fs8, fs9
                  srai         s8, a7, 15
                  nop
                  mulh         sp, ra, s5
                  feq.s        a5, fa5, fa5
                  mulhu        gp, a7, t5
                  rem          s6, s0, gp
                  srli         s10, a5, 30
                  fsub.s       fs9, ft8, ft10
                  or           s5, t0, s8
                  fmul.s       fs11, ft3, fa1, rtz
                  fle.s        ra, fs9, fs9
                  fle.s        a3, fs5, fs11
                  slti         t4, s9, -887
                  or           t1, zero, s6
                  slt          s1, s1, a1
                  fdiv.s       ft3, ft1, fs10, rdn
                  fmv.w.x      ft7, s1
                  sub          a1, s0, tp
                  xor          t1, t4, gp
                  divu         s0, s7, sp
                  fsub.s       fs1, fa7, fs6
                  slt          t4, a1, t3
                  fmul.s       ft3, fa4, ft4
                  sltiu        a5, s11, -1649
                  nop
                  fmin.s       fa5, fs11, ft7
                  nop
                  mul          s5, a2, s3
                  divu         s0, a0, a0
                  fsgnj.s      ft1, ft4, fa1
                  mulhu        s10, t2, s6
                  divu         t6, t6, a7
                  slti         zero, a4, -1724
                  slt          a1, a0, t6
                  andi         s2, s7, -212
                  feq.s        s2, ft11, fs3
                  fmax.s       ft1, fs8, fa2
                  nop
                  auipc        tp, 1040415
                  fmv.x.w      a0, fs11
                  mulhu        ra, s3, a1
                  add          t4, a5, a4
                  fmin.s       fa0, fs8, fs1
                  mulhsu       a7, t2, t2
                  fmax.s       ft11, fs6, fa2
                  srl          t6, s1, a7
                  fcvt.w.s     a7, fs5
                  sltu         s3, t2, s1
                  sub          tp, zero, gp
                  addi         s6, t5, 458
                  fcvt.wu.s    t2, ft7
                  fsgnjx.s     ft11, fs4, fa7
                  fsub.s       ft4, fs9, fa1
                  lui          s11, 134355
                  sltu         t2, t0, a1
                  add          t3, a3, a6
                  fdiv.s       fa2, fs7, ft6, rdn
                  fclass.s     t6, fs5
                  ori          a7, s4, -1174
                  fmax.s       fa3, ft8, fs0
                  ori          a5, a3, 1561
                  srl          s11, a3, t4
                  mul          a7, s10, s7
                  sll          t6, s3, s11
                  mul          tp, sp, a4
                  fsub.s       fa2, fs2, fa3
                  slt          t1, s6, s11
                  sltu         zero, a1, s6
                  auipc        a3, 672236
                  slti         s3, s0, -827
                  auipc        gp, 57704
                  sltiu        tp, s5, -349
                  nop
                  fmin.s       fs2, fs10, fa1
                  fcvt.w.s     a2, fs4, rne
                  fsgnjx.s     ft8, fs4, fa0
                  sra          t5, sp, a1
                  and          a4, a0, t2
                  fsgnj.s      ft10, fs2, fs8
                  flt.s        s5, fa7, fs6
                  fmax.s       ft0, fa7, ft7
                  sltiu        t3, t5, 1070
                  or           t6, s1, s9
                  xor          t6, tp, t6
                  sltu         t3, sp, a3
                  lui          t3, 413229
                  nop
                  fmv.w.x      fa7, s7
                  fcvt.wu.s    t1, fa5, rne
                  fmv.w.x      fa2, t2
                  srl          t4, t6, s2
                  srl          s0, t4, s7
                  fcvt.s.w     fa4, s1
                  fmax.s       fa3, ft11, fs10
                  fsqrt.s      fs8, ft3, rdn
                  rem          t1, s9, a5
                  fclass.s     tp, fs9
                  fcvt.w.s     a4, fa7
                  fmul.s       fs7, fs0, fa7, rup
                  fsgnjx.s     fs5, fs11, fa5
                  fcvt.s.wu    fs9, s3
                  srl          zero, a7, gp
                  fcvt.wu.s    s3, fa0
                  feq.s        s10, fa6, ft10
                  nop
                  feq.s        t1, ft4, ft3
                  fcvt.wu.s    a4, ft10, rdn
                  add          s0, a3, a0
                  fle.s        s7, fs4, ft10
                  add          s6, tp, tp
                  xori         t0, t5, -1792
                  remu         t3, a0, t0
                  fcvt.s.wu    fa7, t5
                  mulhsu       s8, t6, t0
                  mulhsu       t0, ra, s5
                  divu         ra, t1, s2
                  srai         a0, s6, 8
                  fcvt.s.w     ft9, ra, rdn
                  fdiv.s       fs3, ft9, ft0, rup
                  div          t2, t1, s6
                  xor          t6, t4, gp
                  fmax.s       fs4, fs0, ft0
                  fmax.s       fs8, ft5, ft0
                  fle.s        a2, fa2, ft1
                  slli         s2, a7, 26
                  sltu         zero, a4, s1
                  sltu         t5, s11, a2
                  srai         s0, s3, 10
                  feq.s        a5, ft5, fs4
                  fsgnjx.s     fs2, fs4, ft9
                  slli         s11, s1, 25
                  fadd.s       fa6, fs6, fs1
                  sltiu        sp, tp, 1344
                  fcvt.wu.s    s7, ft7
                  mul          t5, t5, s5
                  mulhsu       s6, a5, gp
                  fadd.s       fs11, fs3, fa4
                  srai         t5, s9, 15
                  fsgnj.s      ft6, fs4, ft9
                  remu         s7, t1, tp
                  lui          s2, 71552
                  lui          a4, 838990
                  fadd.s       fa6, fs8, fa5, rtz
                  fsub.s       ft4, ft4, fs9, rmm
                  fcvt.s.wu    ft9, a3, rtz
                  fle.s        s11, fa3, ft6
                  fmv.x.w      s10, fs4
                  divu         t4, a0, a0
                  fclass.s     s3, ft7
                  sltiu        sp, a5, 1464
                  feq.s        a0, fs10, ft5
                  div          s5, s6, t2
                  sub          a7, tp, a2
                  fmul.s       ft2, fa2, ft1
                  nop
                  nop
                  fmul.s       ft2, fs6, ft2
                  flt.s        t2, ft5, ft1
                  fcvt.w.s     a1, fa6
                  sltiu        gp, zero, 962
                  lui          t5, 815388
                  flt.s        s0, ft9, ft7
                  sll          s0, sp, t3
                  fsgnjx.s     fs8, fa3, fs5
                  fadd.s       fa2, fa3, fs4, rmm
                  mulhsu       s2, s1, s11
                  mulh         zero, s11, s1
                  slli         sp, ra, 11
                  sra          s11, s6, zero
                  mulhu        s2, a7, t1
                  rem          s2, a4, a7
                  nop
                  fcvt.s.wu    fa7, s11
                  lui          s6, 478237
                  and          a7, a0, s8
                  feq.s        s0, ft0, ft2
                  fcvt.s.w     fs5, s7, rne
                  fsgnjx.s     ft6, fs7, fa1
                  fsgnjn.s     fa4, ft10, fs3
                  fsgnj.s      ft0, fs9, fa3
                  sll          s5, t5, s11
                  fsub.s       fs8, fs4, ft7
                  fcvt.s.wu    fs2, a3, rne
                  mul          s2, s5, t6
                  divu         s11, s6, a2
                  xor          s1, s1, a4
                  fsub.s       fs1, ft7, ft3, rdn
                  feq.s        sp, fs5, fa5
                  fcvt.s.wu    ft2, a4
                  fsgnjn.s     fs2, fs3, fa0
                  remu         s6, a6, s1
                  xor          t4, s2, s5
                  or           a0, a0, s0
                  srl          gp, a4, s2
                  sra          t5, s7, a6
                  nop
                  fmul.s       fa1, fs8, ft11
                  mulhu        a4, s2, t2
                  fle.s        sp, fs6, ft3
                  fsgnjn.s     ft2, ft9, ft10
                  lui          t2, 571135
                  nop
                  slti         t3, s6, 255
                  lui          a3, 436516
                  ori          s0, t3, 568
                  srai         s2, s2, 15
                  fsgnjn.s     ft2, ft11, fa0
                  fcvt.wu.s    sp, ft11, rtz
                  fmv.w.x      fa7, a7
                  mulhu        s2, s4, a3
                  mulh         s3, ra, s4
                  mulh         s2, s7, a0
                  sltu         a5, s9, a1
                  slli         sp, s9, 14
                  fsgnjn.s     fs10, fs2, fs10
                  fcvt.wu.s    a1, fs6
                  addi         a4, tp, 955
                  fsgnjx.s     ft2, fs11, ft1
                  add          s3, s6, t4
                  fsgnj.s      ft8, fs1, fs8
                  rem          tp, t4, t3
                  lui          s8, 341301
                  fmul.s       fs11, ft11, fs3, rne
                  fle.s        a2, fs4, fs0
                  xor          s2, t4, t4
                  fcvt.wu.s    t6, fa5
                  or           tp, t3, gp
                  fdiv.s       ft6, fa1, ft2, rdn
                  sltu         tp, a5, gp
                  fsub.s       ft8, fs8, ft3
                  rem          a5, t4, s11
                  fmv.w.x      fs4, t6
                  mul          s10, s10, a6
                  fmv.x.w      t3, fa4
                  mulhu        s3, sp, a6
                  auipc        s8, 478043
                  fcvt.s.w     fa2, t3
                  fadd.s       fs1, fs4, fs10, rtz
                  lui          s5, 788734
                  fdiv.s       fa4, fa4, fs6, rmm
                  rem          s5, s5, s7
                  slti         a4, zero, -434
                  fdiv.s       fa0, ft6, ft10
                  fcvt.w.s     s6, ft3
                  slli         t2, a1, 2
                  fcvt.wu.s    a3, ft1, rup
                  remu         a2, s6, t2
                  fcvt.s.wu    ft11, s4, rmm
                  srai         a4, t1, 5
                  sra          a4, s0, a4
                  fcvt.w.s     gp, ft8, rne
                  mulhsu       s1, s4, a2
                  mulh         t3, s1, t1
                  fsgnj.s      fs10, fa5, ft4
                  sll          s11, t3, s2
                  sub          s6, s0, a7
                  add          sp, a7, a6
                  ori          t0, t6, -210
                  sra          t6, s9, s4
                  sll          a2, a6, a0
                  divu         t2, s5, s5
                  fcvt.s.wu    ft4, s3
                  fle.s        s6, fa1, fs6
                  mulhsu       t0, a6, t4
                  fsgnj.s      fs9, ft6, fa5
                  fsqrt.s      fa2, fa0
                  lui          a2, 472368
                  ori          s6, a4, -1541
                  fle.s        t4, fs1, fs7
                  fsub.s       fs2, fs5, fa2, rne
                  fdiv.s       ft5, fs10, fa6
                  fcvt.w.s     s5, fs2
                  fsgnj.s      ft5, fa4, ft1
                  fadd.s       ft10, fa0, ft2
                  fsgnjx.s     fs4, ft2, ft11
                  fmul.s       fa0, ft8, fs2, rup
                  sltiu        t2, t4, 688
                  srli         a3, ra, 11
                  fmin.s       fa4, fa4, fa6
                  la x16, test_done
                  jalr x0, x16, 0
test_done:        
                  li gp, 1
                  ecall
write_tohost:     
                  sw gp, tohost, t5

_exit:            
                  j write_tohost

instr_end:        
                  nop

.section .data
.align 6; .global tohost; tohost: .dword 0;
.align 6; .global fromhost; fromhost: .dword 0;
.section .user_stack,"aw",@progbits;
.align 2
user_stack_start:
.rept 999
.4byte 0x0
.endr
user_stack_end:
.4byte 0x0
.align 2
kernel_instr_start:
.text
mmode_intr_vector_1:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_2:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_3:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_4:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_5:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_6:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_7:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_8:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_9:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_10:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_11:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_12:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_13:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_14:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_15:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

.align           4
mtvec_handler:    
                  .option norvc;
                  j mmode_exception_handler
                  j mmode_intr_vector_1
                  j mmode_intr_vector_2
                  j mmode_intr_vector_3
                  j mmode_intr_vector_4
                  j mmode_intr_vector_5
                  j mmode_intr_vector_6
                  j mmode_intr_vector_7
                  j mmode_intr_vector_8
                  j mmode_intr_vector_9
                  j mmode_intr_vector_10
                  j mmode_intr_vector_11
                  j mmode_intr_vector_12
                  j mmode_intr_vector_13
                  j mmode_intr_vector_14
                  j mmode_intr_vector_15

mmode_exception_handler:
                  addi x25, x25, -4
                  sw  x20, (x25)
                  add x20, x25, zero
                  addi x20, x20, -128
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  add x25, x20, zero
                  csrr x15, 0x341 # MEPC
                  csrr x15, 0x342 # MCAUSE
                  li x11, 0x3 # BREAKPOINT
                  beq x15, x11, ebreak_handler
                  li x11, 0x8 # ECALL_UMODE
                  beq x15, x11, ecall_handler
                  li x11, 0x9 # ECALL_SMODE
                  beq x15, x11, ecall_handler
                  li x11, 0xb # ECALL_MMODE
                  beq x15, x11, ecall_handler
                  li x11, 0x1
                  beq x15, x11, instr_fault_handler
                  li x11, 0x5
                  beq x15, x11, load_fault_handler
                  li x11, 0x7
                  beq x15, x11, store_fault_handler
                  li x11, 0xc
                  beq x15, x11, pt_fault_handler
                  li x11, 0xd
                  beq x15, x11, pt_fault_handler
                  li x11, 0xf
                  beq x15, x11, pt_fault_handler
                  li x11, 0x2 # ILLEGAL_INSTRUCTION
                  beq x15, x11, illegal_instr_handler
                  csrr x11, 0x343 # MTVAL
                  1: la x16, test_done
                  jalr x1, x16, 0

ecall_handler:    
                  la x15, _start
                  sw x0, 0(x15)
                  sw x1, 4(x15)
                  sw x2, 8(x15)
                  sw x3, 12(x15)
                  sw x4, 16(x15)
                  sw x5, 20(x15)
                  sw x6, 24(x15)
                  sw x7, 28(x15)
                  sw x8, 32(x15)
                  sw x9, 36(x15)
                  sw x10, 40(x15)
                  sw x11, 44(x15)
                  sw x12, 48(x15)
                  sw x13, 52(x15)
                  sw x14, 56(x15)
                  sw x15, 60(x15)
                  sw x16, 64(x15)
                  sw x17, 68(x15)
                  sw x18, 72(x15)
                  sw x19, 76(x15)
                  sw x20, 80(x15)
                  sw x21, 84(x15)
                  sw x22, 88(x15)
                  sw x23, 92(x15)
                  sw x24, 96(x15)
                  sw x25, 100(x15)
                  sw x26, 104(x15)
                  sw x27, 108(x15)
                  sw x28, 112(x15)
                  sw x29, 116(x15)
                  sw x30, 120(x15)
                  sw x31, 124(x15)
                  la x16, write_tohost
                  jalr x0, x16, 0

instr_fault_handler:
                  add x20, x25, zero
                  lw  x1, 4(x20)
                  lw  x2, 8(x20)
                  lw  x3, 12(x20)
                  lw  x4, 16(x20)
                  lw  x5, 20(x20)
                  lw  x6, 24(x20)
                  lw  x7, 28(x20)
                  lw  x8, 32(x20)
                  lw  x9, 36(x20)
                  lw  x10, 40(x20)
                  lw  x11, 44(x20)
                  lw  x12, 48(x20)
                  lw  x13, 52(x20)
                  lw  x14, 56(x20)
                  lw  x15, 60(x20)
                  lw  x16, 64(x20)
                  lw  x17, 68(x20)
                  lw  x18, 72(x20)
                  lw  x19, 76(x20)
                  lw  x20, 80(x20)
                  lw  x21, 84(x20)
                  lw  x22, 88(x20)
                  lw  x23, 92(x20)
                  lw  x24, 96(x20)
                  lw  x25, 100(x20)
                  lw  x26, 104(x20)
                  lw  x27, 108(x20)
                  lw  x28, 112(x20)
                  lw  x29, 116(x20)
                  lw  x30, 120(x20)
                  lw  x31, 124(x20)
                  addi x20, x20, 128
                  add x25, x20, zero
                  lw  x20, (x25)
                  addi x25, x25, 4
                  mret

load_fault_handler:
                  add x20, x25, zero
                  lw  x1, 4(x20)
                  lw  x2, 8(x20)
                  lw  x3, 12(x20)
                  lw  x4, 16(x20)
                  lw  x5, 20(x20)
                  lw  x6, 24(x20)
                  lw  x7, 28(x20)
                  lw  x8, 32(x20)
                  lw  x9, 36(x20)
                  lw  x10, 40(x20)
                  lw  x11, 44(x20)
                  lw  x12, 48(x20)
                  lw  x13, 52(x20)
                  lw  x14, 56(x20)
                  lw  x15, 60(x20)
                  lw  x16, 64(x20)
                  lw  x17, 68(x20)
                  lw  x18, 72(x20)
                  lw  x19, 76(x20)
                  lw  x20, 80(x20)
                  lw  x21, 84(x20)
                  lw  x22, 88(x20)
                  lw  x23, 92(x20)
                  lw  x24, 96(x20)
                  lw  x25, 100(x20)
                  lw  x26, 104(x20)
                  lw  x27, 108(x20)
                  lw  x28, 112(x20)
                  lw  x29, 116(x20)
                  lw  x30, 120(x20)
                  lw  x31, 124(x20)
                  addi x20, x20, 128
                  add x25, x20, zero
                  lw  x20, (x25)
                  addi x25, x25, 4
                  mret

store_fault_handler:
                  add x20, x25, zero
                  lw  x1, 4(x20)
                  lw  x2, 8(x20)
                  lw  x3, 12(x20)
                  lw  x4, 16(x20)
                  lw  x5, 20(x20)
                  lw  x6, 24(x20)
                  lw  x7, 28(x20)
                  lw  x8, 32(x20)
                  lw  x9, 36(x20)
                  lw  x10, 40(x20)
                  lw  x11, 44(x20)
                  lw  x12, 48(x20)
                  lw  x13, 52(x20)
                  lw  x14, 56(x20)
                  lw  x15, 60(x20)
                  lw  x16, 64(x20)
                  lw  x17, 68(x20)
                  lw  x18, 72(x20)
                  lw  x19, 76(x20)
                  lw  x20, 80(x20)
                  lw  x21, 84(x20)
                  lw  x22, 88(x20)
                  lw  x23, 92(x20)
                  lw  x24, 96(x20)
                  lw  x25, 100(x20)
                  lw  x26, 104(x20)
                  lw  x27, 108(x20)
                  lw  x28, 112(x20)
                  lw  x29, 116(x20)
                  lw  x30, 120(x20)
                  lw  x31, 124(x20)
                  addi x20, x20, 128
                  add x25, x20, zero
                  lw  x20, (x25)
                  addi x25, x25, 4
                  mret

ebreak_handler:   
                  csrr  x15, 0x341
                  addi  x15, x15, 4
                  csrw  0x341, x15
                  add x20, x25, zero
                  lw  x1, 4(x20)
                  lw  x2, 8(x20)
                  lw  x3, 12(x20)
                  lw  x4, 16(x20)
                  lw  x5, 20(x20)
                  lw  x6, 24(x20)
                  lw  x7, 28(x20)
                  lw  x8, 32(x20)
                  lw  x9, 36(x20)
                  lw  x10, 40(x20)
                  lw  x11, 44(x20)
                  lw  x12, 48(x20)
                  lw  x13, 52(x20)
                  lw  x14, 56(x20)
                  lw  x15, 60(x20)
                  lw  x16, 64(x20)
                  lw  x17, 68(x20)
                  lw  x18, 72(x20)
                  lw  x19, 76(x20)
                  lw  x20, 80(x20)
                  lw  x21, 84(x20)
                  lw  x22, 88(x20)
                  lw  x23, 92(x20)
                  lw  x24, 96(x20)
                  lw  x25, 100(x20)
                  lw  x26, 104(x20)
                  lw  x27, 108(x20)
                  lw  x28, 112(x20)
                  lw  x29, 116(x20)
                  lw  x30, 120(x20)
                  lw  x31, 124(x20)
                  addi x20, x20, 128
                  add x25, x20, zero
                  lw  x20, (x25)
                  addi x25, x25, 4
                  mret

illegal_instr_handler:
                  csrr  x15, 0x341
                  addi  x15, x15, 4
                  csrw  0x341, x15
                  add x20, x25, zero
                  lw  x1, 4(x20)
                  lw  x2, 8(x20)
                  lw  x3, 12(x20)
                  lw  x4, 16(x20)
                  lw  x5, 20(x20)
                  lw  x6, 24(x20)
                  lw  x7, 28(x20)
                  lw  x8, 32(x20)
                  lw  x9, 36(x20)
                  lw  x10, 40(x20)
                  lw  x11, 44(x20)
                  lw  x12, 48(x20)
                  lw  x13, 52(x20)
                  lw  x14, 56(x20)
                  lw  x15, 60(x20)
                  lw  x16, 64(x20)
                  lw  x17, 68(x20)
                  lw  x18, 72(x20)
                  lw  x19, 76(x20)
                  lw  x20, 80(x20)
                  lw  x21, 84(x20)
                  lw  x22, 88(x20)
                  lw  x23, 92(x20)
                  lw  x24, 96(x20)
                  lw  x25, 100(x20)
                  lw  x26, 104(x20)
                  lw  x27, 108(x20)
                  lw  x28, 112(x20)
                  lw  x29, 116(x20)
                  lw  x30, 120(x20)
                  lw  x31, 124(x20)
                  addi x20, x20, 128
                  add x25, x20, zero
                  lw  x20, (x25)
                  addi x25, x25, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x15, 0x300 # MSTATUS;
                  csrr  x15, 0x304 # MIE;
                  csrr  x15, 0x344 # MIP;
                  csrrc x15, 0x344, x15 # MIP;
                  add x20, x25, zero
                  lw  x1, 4(x20)
                  lw  x2, 8(x20)
                  lw  x3, 12(x20)
                  lw  x4, 16(x20)
                  lw  x5, 20(x20)
                  lw  x6, 24(x20)
                  lw  x7, 28(x20)
                  lw  x8, 32(x20)
                  lw  x9, 36(x20)
                  lw  x10, 40(x20)
                  lw  x11, 44(x20)
                  lw  x12, 48(x20)
                  lw  x13, 52(x20)
                  lw  x14, 56(x20)
                  lw  x15, 60(x20)
                  lw  x16, 64(x20)
                  lw  x17, 68(x20)
                  lw  x18, 72(x20)
                  lw  x19, 76(x20)
                  lw  x20, 80(x20)
                  lw  x21, 84(x20)
                  lw  x22, 88(x20)
                  lw  x23, 92(x20)
                  lw  x24, 96(x20)
                  lw  x25, 100(x20)
                  lw  x26, 104(x20)
                  lw  x27, 108(x20)
                  lw  x28, 112(x20)
                  lw  x29, 116(x20)
                  lw  x30, 120(x20)
                  lw  x31, 124(x20)
                  addi x20, x20, 128
                  add x25, x20, zero
                  lw  x20, (x25)
                  addi x25, x25, 4
                  mret;

kernel_instr_end: nop
.section .kernel_stack,"aw",@progbits;
.align 2
kernel_stack_start:
.rept 15
.4byte 0x0
.endr
kernel_stack_end:
.4byte 0x0
