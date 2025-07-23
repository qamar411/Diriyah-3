.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x27, h0_start
jalr x0, x27, 0
h0_start:
                  li x15, 0x40001120
                  csrw 0x301, x15
kernel_sp:        
                  la x5, kernel_stack_end

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
                  li x15, 2139095041
                  fmv.w.x f0, x15
                  li x15, 2147483648
                  fmv.w.x f1, x15
                  li x15, 4286578687
                  fmv.w.x f2, x15
                  li x15, 3232143904
                  fmv.w.x f3, x15
                  li x15, 2139095039
                  fmv.w.x f4, x15
                  li x15, 2148556707
                  fmv.w.x f5, x15
                  li x15, 4286578687
                  fmv.w.x f6, x15
                  li x15, 4286578687
                  fmv.w.x f7, x15
                  li x15, 0
                  fmv.w.x f8, x15
                  li x15, 2154718090
                  fmv.w.x f9, x15
                  li x15, 2139095039
                  fmv.w.x f10, x15
                  li x15, 2139095040
                  fmv.w.x f11, x15
                  li x15, 2155627502
                  fmv.w.x f12, x15
                  li x15, 3527179108
                  fmv.w.x f13, x15
                  li x15, 7489484
                  fmv.w.x f14, x15
                  li x15, 2143289344
                  fmv.w.x f15, x15
                  li x15, 2139095041
                  fmv.w.x f16, x15
                  li x15, 2143289344
                  fmv.w.x f17, x15
                  li x15, 0
                  fmv.w.x f18, x15
                  li x15, 0
                  fmv.w.x f19, x15
                  li x15, 4286578688
                  fmv.w.x f20, x15
                  li x15, 4286578688
                  fmv.w.x f21, x15
                  li x15, 2147483648
                  fmv.w.x f22, x15
                  li x15, 5809020
                  fmv.w.x f23, x15
                  li x15, 2153449289
                  fmv.w.x f24, x15
                  li x15, 2147483648
                  fmv.w.x f25, x15
                  li x15, 2147483648
                  fmv.w.x f26, x15
                  li x15, 2143289344
                  fmv.w.x f27, x15
                  li x15, 2139095039
                  fmv.w.x f28, x15
                  li x15, 2143289344
                  fmv.w.x f29, x15
                  li x15, 2139095041
                  fmv.w.x f30, x15
                  li x15, 2227243113
                  fmv.w.x f31, x15
                  fsrmi 1
                  li x0, 0x0
                  li x1, 0x80000000
                  li x2, 0x80000000
                  li x3, 0x3438b8c4
                  li x4, 0x1
                  li x6, 0xdd3a9d16
                  li x7, 0x0
                  li x8, 0x80000000
                  li x9, 0xd470f121
                  li x10, 0x929b9bcf
                  li x11, 0x0
                  li x12, 0xf0eadaa8
                  li x13, 0xc04beaa3
                  li x14, 0xf0d7a409
                  li x15, 0xb
                  li x17, 0xfa67a3cc
                  li x18, 0x0
                  li x19, 0x0
                  li x20, 0x1c605268
                  li x21, 0x72a93b12
                  li x22, 0x80000000
                  li x23, 0x0
                  li x24, 0x80000000
                  li x25, 0xff2da637
                  li x26, 0xf42c1e44
                  li x27, 0xf9af2af0
                  li x28, 0x5
                  li x29, 0x4
                  li x30, 0x3fe21ea7
                  li x31, 0xf7a90133
                  la x16, user_stack_end
main:             fmul.s       fs0, fs8, fa0, rdn
                  sub          tp, s10, s6
                  mulhu        a3, t1, t2
                  slli         zero, s7, 7
                  sub          s8, t4, s10
                  sltu         ra, s0, sp
                  fclass.s     t6, fs10
                  fdiv.s       fs6, fs9, fa7, rtz
                  fmv.w.x      fa5, t3
                  add          t6, a2, t3
                  addi         s0, t4, -1127
                  mulhsu       t5, a2, t0
                  auipc        t6, 183413
                  divu         t1, a3, a6
                  auipc        a1, 461783
                  fmul.s       fa4, ft10, fa2
                  fcvt.w.s     s6, ft5, rup
                  mulhsu       t5, s6, a0
                  feq.s        gp, fa6, fs11
                  mulh         t5, s0, a3
                  rem          s9, a4, sp
                  fmax.s       ft7, fa0, fs5
                  divu         s8, a2, a4
                  ori          s6, tp, 1377
                  feq.s        a4, ft1, fa6
                  fsgnjn.s     fs11, fa5, fs3
                  flt.s        s4, ft5, fa3
                  fmv.w.x      ft1, sp
                  fcvt.w.s     t3, fa4, rmm
                  div          zero, s0, a7
                  fmul.s       fs9, fs5, fs2, rmm
                  sub          sp, s7, a0
                  sra          a5, a6, s7
                  fsub.s       fs10, fs10, fa7, rmm
                  fcvt.wu.s    gp, ft9
                  xor          s10, s5, t4
                  sll          t1, s10, a6
                  fsqrt.s      fa6, fs9
                  slt          t5, s5, ra
                  ori          a1, s1, 1013
                  fadd.s       ft0, fs5, fs4
                  fsub.s       fs11, fs1, ft7, rtz
                  div          t6, s8, s6
                  xor          a7, a7, t6
                  or           s8, t1, t1
                  mulhsu       t6, s8, s5
                  fmax.s       fs8, fs10, fs11
                  fsub.s       ft4, ft10, ft1, rtz
                  fle.s        zero, fa0, fa5
                  remu         ra, zero, a0
                  fcvt.w.s     a4, fs3, rne
                  fle.s        t1, ft3, fs9
                  auipc        s10, 24793
                  fsqrt.s      ft6, fa7, rmm
                  fcvt.s.w     fa7, gp, rup
                  sltiu        s9, sp, -1102
                  mulhu        sp, tp, gp
                  fcvt.s.wu    ft7, s7, rup
                  sll          a4, t6, t3
                  addi         t2, s1, -416
                  fadd.s       fs5, fs2, fs7, rmm
                  and          tp, s2, gp
                  fcvt.w.s     t4, fs8
                  ori          a1, zero, 1700
                  fmin.s       ft3, ft10, fs3
                  xor          gp, s1, t1
                  fadd.s       fa2, ft5, fs0, rtz
                  add          s6, s7, s3
                  fcvt.w.s     t5, ft4, rtz
                  fclass.s     s0, ft0
                  fsgnjn.s     fs0, fa1, fa5
                  fsub.s       fa1, fa2, fa0, rmm
                  fmv.w.x      fs9, s8
                  mul          s8, t0, s2
                  feq.s        s2, fa5, fa4
                  mul          s7, s1, s7
                  xori         a3, s6, -1321
                  fsgnjx.s     fs3, ft2, fs5
                  fcvt.w.s     t2, fa1
                  slli         sp, gp, 26
                  fcvt.s.wu    fs5, s6
                  fsgnjx.s     ft9, fs1, fs0
                  andi         s0, s7, -1023
                  fmv.w.x      fs0, t1
                  or           zero, s2, s11
                  divu         s9, a5, t6
                  fsub.s       fa2, fa2, fs10
                  fdiv.s       fs10, ft4, fa0, rdn
                  addi         t6, s0, 1926
                  sub          s10, s8, s6
                  fdiv.s       fa6, ft10, fs6
                  fsgnj.s      ft9, ft8, fs7
                  sltu         a2, t2, s7
                  andi         a7, t4, 751
                  fcvt.wu.s    s8, ft6, rdn
                  fle.s        gp, ft8, fa4
                  auipc        gp, 930472
                  div          a0, t0, s8
                  andi         a7, s11, 1557
                  rem          s0, a1, t3
                  fsgnjx.s     fa0, ft0, ft6
                  fadd.s       ft10, fs1, fs0, rdn
                  ori          s9, gp, -158
                  divu         t6, s5, s5
                  sltiu        a5, s9, -545
                  mulh         a3, a0, s11
                  and          t6, s5, gp
                  fsgnj.s      fa4, fs5, fs3
                  divu         s5, ra, a3
                  fcvt.w.s     t2, fs6, rdn
                  addi         sp, a6, -437
                  add          t5, s7, s1
                  divu         tp, a7, s8
                  fcvt.s.wu    fs3, s0
                  sll          t6, s9, t3
                  fcvt.s.w     fs3, gp
                  fsgnj.s      fs6, fa6, ft4
                  mulh         zero, ra, a5
                  fcvt.s.w     ft0, t3, rmm
                  remu         t1, a2, s6
                  nop
                  mulhsu       s10, s7, s0
                  slli         s9, t3, 20
                  fmin.s       ft11, ft1, fa1
                  fmv.w.x      ft5, a4
                  fsgnjn.s     fa3, fs2, fa3
                  fcvt.wu.s    t1, fs9, rmm
                  andi         s3, s10, -652
                  sltu         s8, zero, s10
                  slti         t3, t6, 1584
                  fmv.x.w      a4, ft6
                  or           s4, s7, t6
                  fmin.s       ft3, fa6, fa1
                  and          t1, s7, s4
                  fsub.s       ft1, ft6, fa2
                  fle.s        zero, fs3, fa2
                  fcvt.wu.s    zero, fs0, rup
                  fsub.s       fs9, fs8, fs10, rdn
                  fsub.s       fa0, fa0, fs9, rne
                  mulh         s8, gp, a6
                  srl          t5, s9, t2
                  fsqrt.s      fa5, fs0
                  auipc        t6, 981194
                  fsgnjn.s     fs5, fs7, fs4
                  fsqrt.s      fa2, fa7, rtz
                  srai         s8, s11, 31
                  or           a5, sp, t3
                  srl          s4, gp, a7
                  lui          ra, 996649
                  ori          tp, t0, -737
                  nop
                  divu         a1, t4, zero
                  fcvt.w.s     ra, fa2, rmm
                  mulhsu       s10, s0, s8
                  fclass.s     s9, ft1
                  addi         t4, s5, -1928
                  fcvt.s.wu    ft0, t0
                  fmv.w.x      ft3, s1
                  mulhu        sp, s8, t5
                  slti         t3, s6, -1466
                  slt          zero, s9, s0
                  fsgnj.s      fs5, ft6, fs3
                  ori          s10, a2, 1857
                  fcvt.s.wu    fa0, s6, rup
                  mulhu        s5, gp, s8
                  lui          s4, 204651
                  fmv.w.x      fa1, s5
                  addi         a4, t6, 1222
                  auipc        sp, 474955
                  srli         a1, s7, 15
                  fsgnjx.s     fs9, fs11, fa6
                  addi         s6, s11, -1459
                  slt          s9, s8, s9
                  srai         a3, s6, 9
                  fsgnjn.s     ft2, fs2, fs7
                  slti         ra, a2, -1001
                  feq.s        a2, fs9, fs10
                  fadd.s       fa7, ft3, ft4
                  add          a3, s8, sp
                  fclass.s     a5, ft7
                  fcvt.s.w     ft9, s2, rtz
                  sltu         a5, s10, t5
                  fsgnj.s      fa0, fs5, ft9
                  fmv.x.w      s10, fs4
                  fmax.s       ft11, fs11, fa7
                  fcvt.s.wu    fs4, zero, rup
                  xori         s2, s0, -352
                  flt.s        a4, fs11, fs4
                  fcvt.s.wu    ft5, t2
                  fcvt.s.wu    fs6, t3, rup
                  mulh         t5, t6, gp
                  sltiu        a3, zero, 46
                  mul          a0, s3, a1
                  sra          s10, s2, a7
                  fcvt.s.w     fa6, t0
                  slli         s8, t5, 30
                  nop
                  sltu         s9, s11, s10
                  fsub.s       ft4, ft5, fa5, rdn
                  and          ra, s10, s0
                  rem          s10, a4, s6
                  fcvt.w.s     a4, ft8, rne
                  fdiv.s       fs4, fs9, ft5, rmm
                  mulhsu       t2, zero, t4
                  fsqrt.s      fa7, fa4, rup
                  fmv.w.x      fs10, t4
                  flt.s        t1, fs0, fa7
                  srai         s2, a0, 13
                  srli         a3, sp, 11
                  fle.s        s6, fa0, ft5
                  auipc        s7, 28079
                  mulhu        s10, s3, t2
                  addi         a2, a1, -877
                  nop
                  fsgnjx.s     ft1, fa3, ft0
                  or           a3, a2, a7
                  fadd.s       fa3, fa0, fs10, rtz
                  flt.s        s1, fa1, fs3
                  slt          sp, s10, a1
                  srai         gp, a4, 6
                  fsqrt.s      fs6, fa5, rup
                  fcvt.wu.s    a3, fa3, rup
                  fsgnj.s      fs3, ft1, fa5
                  srai         s8, a5, 6
                  feq.s        s1, fa3, fs6
                  fsgnjx.s     ft0, fs5, ft7
                  fsqrt.s      fs4, fs1
                  addi         t3, s4, 920
                  sra          s1, s9, s7
                  slli         sp, t6, 27
                  fmax.s       fa5, fs1, fs9
                  fmin.s       fs7, fs8, fs7
                  srl          s6, s5, t5
                  srai         s6, s1, 6
                  remu         s2, s5, t1
                  and          s4, zero, s3
                  sub          s8, t4, t1
                  nop
                  srai         t1, t6, 27
                  sra          a5, s8, s5
                  div          s0, zero, s3
                  fmax.s       ft2, fa0, ft8
                  slt          a7, t0, s1
                  fadd.s       fs11, ft11, ft11
                  xor          a4, a0, s4
                  slli         ra, a4, 29
                  fmin.s       ft5, ft4, ft9
                  fsgnj.s      ft9, fs6, fa2
                  fadd.s       fa5, fs7, fa1
                  fmv.w.x      fa0, s0
                  sltu         t3, a1, zero
                  mulhsu       s4, s9, s1
                  remu         t5, s5, a3
                  fclass.s     a5, fs5
                  fsgnj.s      fa4, ft0, ft1
                  xor          s6, t0, a6
                  fcvt.s.wu    fa7, a6
                  feq.s        s2, ft11, fs1
                  andi         s7, s9, -86
                  fmv.x.w      s4, fa0
                  fle.s        a3, fa7, ft10
                  xori         s9, t1, 376
                  mulhu        s3, s4, s5
                  slti         ra, s6, 882
                  fmax.s       fa3, ft11, ft4
                  sll          a0, zero, gp
                  sll          s9, s6, a6
                  addi         zero, s9, -1224
                  auipc        a1, 802035
                  mulhsu       a1, s7, s5
                  sll          s4, s2, t3
                  feq.s        a1, fs9, fa5
                  fdiv.s       ft8, ft10, fa3
                  addi         s3, s2, -1240
                  fle.s        a1, fs0, fa1
                  fadd.s       fs11, fs1, ft10
                  slli         s0, s5, 7
                  sra          ra, t6, a4
                  or           ra, s11, s11
                  fsub.s       fs10, ft1, ft8
                  remu         t1, a1, s0
                  nop
                  nop
                  lui          a5, 1019929
                  fsqrt.s      ft6, fa2, rtz
                  fle.s        a2, fs11, ft11
                  fsgnj.s      ft4, fs9, fa0
                  fadd.s       fa7, ft6, fs8, rdn
                  fmv.x.w      s7, ft2
                  sltiu        a4, t6, -1762
                  div          a3, s2, t0
                  fcvt.wu.s    s1, ft6
                  sll          t6, t2, s11
                  fmv.x.w      s9, ft6
                  fcvt.w.s     zero, fs11
                  slti         t5, s11, 1098
                  divu         ra, s4, s2
                  feq.s        a2, ft10, ft7
                  flt.s        s8, fs6, fs1
                  remu         a5, a4, s1
                  fsub.s       fa2, fs6, fs9, rtz
                  and          a7, s10, s4
                  fsqrt.s      fs2, ft4
                  mulh         a2, t6, a2
                  nop
                  fadd.s       ft9, fs5, fa3
                  slt          zero, ra, s10
                  fclass.s     s10, ft3
                  auipc        a3, 762121
                  nop
                  auipc        s9, 1038086
                  auipc        ra, 960743
                  fsgnjn.s     fs7, ft7, fs0
                  fcvt.s.w     ft8, a6, rne
                  mul          s5, a5, s4
                  rem          gp, t1, s1
                  mulhsu       a3, s8, s7
                  sll          a3, s1, a3
                  srl          s2, t1, t1
                  remu         s8, a0, t6
                  ori          a4, gp, 510
                  xori         s0, s3, 780
                  feq.s        ra, fs9, fs10
                  fsgnjn.s     fs9, fs7, ft1
                  srl          a7, t6, t1
                  fcvt.w.s     gp, fs0, rne
                  auipc        s6, 919151
                  sub          a5, a5, s5
                  fmv.w.x      fa1, a5
                  mul          t3, t6, tp
                  slti         a2, t2, -658
                  mul          tp, t6, s6
                  fcvt.s.w     fs7, s6, rup
                  nop
                  fmv.x.w      t2, fs3
                  fsub.s       ft7, fs7, fs11, rtz
                  divu         t5, a1, sp
                  sub          a4, s11, s4
                  fmul.s       fs4, fa5, fs4, rup
                  fdiv.s       fa6, ft9, ft8, rdn
                  fcvt.w.s     t1, fs1, rne
                  lui          gp, 543999
                  fmax.s       ft2, ft5, fs2
                  div          a2, a5, s6
                  srai         gp, sp, 18
                  fclass.s     a2, fa3
                  fcvt.s.wu    ft0, gp, rne
                  fclass.s     s7, fa6
                  slt          ra, ra, sp
                  xor          a7, t4, s0
                  div          gp, s9, ra
                  fmv.w.x      fa7, s5
                  fsgnj.s      fs9, fa7, fs10
                  fmv.w.x      fs10, s1
                  and          t6, a1, s4
                  rem          t5, s4, t3
                  fle.s        t1, fa3, fa1
                  divu         a0, s1, t4
                  srli         s1, a2, 1
                  addi         t5, zero, 1778
                  fsqrt.s      ft7, fs3
                  fmax.s       fs7, ft9, fs5
                  fsqrt.s      ft8, fs2
                  divu         t3, a0, gp
                  fsgnjx.s     fa3, fs1, fa4
                  or           a7, gp, s4
                  auipc        t5, 654359
                  sltu         a3, zero, a2
                  fle.s        s5, fa4, fs1
                  div          s5, t5, a4
                  fcvt.s.w     ft9, a3
                  nop
                  nop
                  fdiv.s       fs4, ft10, fs8
                  remu         s1, a3, t1
                  fsqrt.s      ft2, fs9
                  slli         a0, t6, 8
                  slt          t2, a5, a7
                  fadd.s       ft3, fa1, ft5
                  mulhu        a3, s8, s8
                  rem          a3, s9, s8
                  fcvt.s.w     fs7, zero, rne
                  mulh         t6, s10, sp
                  and          ra, t6, s10
                  lui          s7, 508271
                  fmv.x.w      t4, ft10
                  rem          s3, a6, s5
                  div          a2, s4, gp
                  srli         a7, s5, 9
                  srl          t2, s3, t3
                  sltiu        t6, a0, 1261
                  srai         t6, s4, 6
                  or           tp, s1, a2
                  fmv.w.x      fs4, zero
                  srli         a7, t1, 17
                  mul          t1, s9, s5
                  div          s6, s1, tp
                  nop
                  rem          s3, t1, gp
                  remu         s4, t3, t0
                  mul          sp, s8, t4
                  fmax.s       fs7, fs5, fs6
                  xori         s2, s5, 756
                  or           a3, t4, sp
                  srl          a3, s8, a0
                  mulhu        s2, s8, s8
                  fclass.s     zero, fs1
                  lui          a1, 1039749
                  fsub.s       fa2, ft8, fs6, rne
                  remu         gp, t4, t2
                  sll          sp, s5, sp
                  fle.s        a0, fs6, fs6
                  srl          sp, s5, s8
                  mul          ra, sp, a3
                  xori         ra, a1, -688
                  add          a3, s9, a4
                  slli         s5, s5, 18
                  sra          t6, a3, s7
                  fcvt.wu.s    s10, ft5
                  addi         s0, t5, 1323
                  fcvt.s.w     fs11, t5
                  slt          a1, s11, t0
                  sra          t1, t0, a5
                  fsgnj.s      ft9, fs1, fa2
                  auipc        tp, 958617
                  fmv.w.x      fs5, a7
                  mulhu        ra, sp, a6
                  rem          a5, s7, s8
                  fsgnjn.s     fs1, fa0, fs9
                  xori         a5, a4, 1410
                  fmin.s       ft5, fa3, ft7
                  srl          a3, s0, a3
                  fclass.s     sp, ft1
                  xor          s3, a5, t4
                  slt          s7, s9, a2
                  srl          s10, t6, a4
                  sll          a2, s9, a4
                  srai         a7, t1, 11
                  remu         tp, a3, a4
                  fmin.s       ft4, ft5, fa7
                  fmin.s       fs2, ft10, fs5
                  divu         a0, t2, a7
                  sub          s7, s6, s2
                  sltiu        t1, t3, 1183
                  mulhsu       a1, sp, s11
                  fsgnjx.s     fs3, ft2, fs1
                  divu         s1, zero, s9
                  sltiu        a0, t5, -1983
                  sll          t1, a7, zero
                  fle.s        s8, ft7, ft2
                  fcvt.wu.s    s7, fs11
                  slli         s6, s8, 6
                  xor          s2, s8, sp
                  fcvt.s.wu    fs3, s2, rne
                  fmv.w.x      fs4, zero
                  auipc        gp, 311022
                  fcvt.w.s     a0, ft11
                  fmv.w.x      fs4, ra
                  fsub.s       ft1, ft11, fs10, rdn
                  fmul.s       fa3, fa6, fa1, rdn
                  slti         t4, sp, 1002
                  fdiv.s       ft10, fa1, ft4
                  rem          a2, s4, t6
                  lui          zero, 996534
                  xor          t1, tp, s8
                  fsgnjx.s     ft5, ft0, fs4
                  srli         a1, a6, 25
                  fle.s        s2, fs6, fa2
                  fsgnj.s      fa2, fa7, fa3
                  mulh         s6, a2, t5
                  mulhu        s1, s11, s9
                  fdiv.s       ft0, fa5, fa6
                  fsgnjx.s     fa4, ft2, fa7
                  srl          t3, a7, a3
                  slt          s5, s11, a4
                  fle.s        s2, fs0, fa2
                  sra          s0, sp, s0
                  fcvt.wu.s    a5, fs6
                  flt.s        t4, fs0, ft3
                  auipc        a2, 123828
                  or           s6, s2, s4
                  fmv.w.x      fs0, t1
                  fmin.s       ft4, fs5, fa4
                  sll          sp, s8, s3
                  nop
                  srli         t3, s6, 0
                  divu         a3, tp, a0
                  fsgnj.s      fs10, fs11, fs3
                  mulh         tp, zero, t0
                  fsgnjx.s     fa3, ft9, fs6
                  mulh         s2, s1, s9
                  slli         zero, a5, 11
                  srai         a7, s4, 6
                  fmv.x.w      s5, ft5
                  or           s9, t4, gp
                  fcvt.s.w     fs5, a4
                  fcvt.s.wu    ft7, s3, rmm
                  rem          s6, s10, s0
                  fmax.s       ft3, fs5, fa1
                  fmv.x.w      s3, fa0
                  mul          s2, t1, s4
                  rem          zero, s1, t5
                  fsgnjn.s     fs10, fs5, fs8
                  sltu         s9, s7, s0
                  fcvt.w.s     a7, fa0
                  fsub.s       ft1, ft5, fs0, rne
                  or           s9, t5, s9
                  divu         t3, a0, t1
                  sll          t2, s6, t5
                  srai         s6, a3, 30
                  slli         s3, s1, 4
                  rem          s1, a1, s8
                  fclass.s     tp, fs1
                  fsub.s       fa6, fs0, ft0, rup
                  mul          t3, a2, s0
                  slti         a5, s0, 467
                  fmv.w.x      fa1, a4
                  andi         a4, a0, -1040
                  or           gp, s11, s10
                  mulhsu       s7, a5, a0
                  fsgnjx.s     fa2, ft4, fa1
                  sll          s2, sp, s7
                  fmin.s       fs2, ft1, ft1
                  rem          a2, ra, a6
                  srli         s3, t2, 22
                  rem          s7, s3, s10
                  slt          s5, ra, t1
                  fsgnj.s      fs8, ft4, ft2
                  slt          a3, t3, s4
                  slli         s5, s4, 11
                  fdiv.s       ft2, ft8, fa1, rne
                  xori         s5, a3, -1437
                  fsgnjn.s     ft7, fa7, fs10
                  fdiv.s       fs6, fa5, ft8, rup
                  srl          ra, a6, a3
                  andi         s1, t0, 418
                  slt          s6, t5, s10
                  sltiu        a5, a0, 1139
                  flt.s        s1, fs3, fs6
                  fle.s        s0, ft11, ft7
                  fcvt.wu.s    t4, fa6
                  srli         tp, t1, 30
                  addi         sp, t2, -1437
                  slli         a3, zero, 28
                  xor          a0, s7, s9
                  sltu         t2, ra, t1
                  xori         s10, sp, 536
                  fmv.w.x      fa6, a1
                  slli         zero, s3, 20
                  div          s9, s4, s3
                  srl          sp, t0, s6
                  mul          t6, tp, sp
                  srl          t1, t4, s5
                  nop
                  ori          s1, s1, 494
                  fmv.x.w      t2, fa4
                  srl          t1, t6, s8
                  slti         a0, a4, 576
                  fsgnjn.s     fa1, fa1, ft0
                  fadd.s       fs8, ft9, fa1
                  fcvt.s.wu    fs7, t1, rup
                  fdiv.s       fs2, ft0, ft9
                  fcvt.wu.s    s7, fa1, rne
                  fcvt.w.s     s8, fs8
                  fmin.s       ft9, fs10, fa3
                  fdiv.s       ft7, ft0, fa1
                  remu         s9, s7, t1
                  fclass.s     a7, ft11
                  fsgnjx.s     fs10, fa6, fs9
                  mul          gp, s0, t2
                  feq.s        s8, fs3, fa5
                  fmax.s       fs1, fa3, ft6
                  flt.s        sp, fs9, ft1
                  fcvt.s.w     ft7, s6, rup
                  fdiv.s       ft11, ft2, ft3, rne
                  mulhu        s7, t3, a0
                  and          a3, s5, a6
                  auipc        s7, 816145
                  nop
                  addi         s7, s0, -156
                  flt.s        t3, ft11, ft3
                  feq.s        t5, fs10, ft4
                  xori         a4, s9, -1284
                  fsub.s       fs8, fs10, fa1
                  fsgnj.s      ft6, ft5, fs4
                  rem          s4, a4, a2
                  flt.s        zero, fs8, fs8
                  slti         a4, a3, 891
                  or           t5, s7, ra
                  sll          gp, s2, a5
                  sub          tp, t3, t3
                  mulhu        a4, s2, a1
                  mulh         s7, s9, s8
                  xori         zero, t5, -1939
                  xor          tp, s7, t3
                  fclass.s     sp, ft9
                  fmax.s       fa2, ft4, fa7
                  srl          a0, sp, a2
                  auipc        t3, 493555
                  fmax.s       fa5, ft10, fa0
                  fcvt.s.wu    fa6, a0
                  sltiu        a2, s8, 1877
                  sra          t4, a5, t2
                  mulh         s10, sp, a4
                  andi         s10, s5, -2016
                  mulhsu       a3, s2, ra
                  fmv.w.x      fs0, t2
                  fclass.s     t1, ft5
                  fle.s        s1, fa7, fs11
                  or           s10, s8, a3
                  fsgnjn.s     fa0, fs11, ft5
                  mulh         t2, t3, t4
                  flt.s        t3, fs10, ft9
                  fsgnjn.s     ft7, fs6, fa3
                  fcvt.s.w     fs1, gp, rmm
                  fmin.s       fa2, ft6, fs9
                  fcvt.wu.s    a4, fs11, rne
                  fcvt.w.s     t3, ft7, rtz
                  fmul.s       fs5, fs11, fa0, rtz
                  fcvt.w.s     zero, ft10
                  fle.s        a7, fa6, fs4
                  fcvt.w.s     a2, fs5
                  fsqrt.s      fs9, ft0, rne
                  fsgnj.s      fs4, fs4, fa3
                  fcvt.wu.s    gp, ft4
                  auipc        t6, 416405
                  ori          ra, a5, -1848
                  srli         zero, sp, 15
                  mulh         s6, t4, zero
                  fadd.s       fs9, fs0, fs9
                  slli         t1, zero, 24
                  andi         s1, sp, 1707
                  slli         t6, a2, 21
                  fmv.x.w      a1, ft6
                  mulhsu       a0, s0, a5
                  remu         a1, s11, gp
                  fcvt.wu.s    t5, fa1, rmm
                  fsgnjx.s     fs7, fa4, ft5
                  mulh         s9, tp, s0
                  add          a5, t2, s2
                  fclass.s     zero, ft3
                  mul          s10, s1, a1
                  rem          s8, s7, s1
                  sltiu        s7, s3, 1357
                  divu         zero, t0, t1
                  fmax.s       fa1, ft2, fs6
                  mulh         a0, a7, s7
                  fmv.x.w      s4, fs2
                  or           sp, s2, tp
                  fsgnjn.s     fa4, fs11, fs8
                  and          zero, a2, s0
                  mulhsu       a1, sp, sp
                  fmv.w.x      ft10, t6
                  slli         t3, s10, 17
                  or           s0, tp, t6
                  andi         s4, t6, 1475
                  srai         t4, zero, 9
                  nop
                  add          a7, s4, t5
                  fsqrt.s      ft5, ft5, rne
                  sub          s4, gp, s5
                  mul          a4, a5, s9
                  sra          tp, a4, a6
                  ori          a3, s5, -1948
                  slt          t1, zero, gp
                  fdiv.s       ft9, fs6, fs8, rne
                  flt.s        t2, fa6, fs10
                  fmv.x.w      s2, fs4
                  fcvt.s.w     fs7, s1
                  divu         t4, tp, s11
                  fcvt.s.wu    ft2, t1, rup
                  fadd.s       ft6, fs6, fa1, rup
                  or           t2, s2, s10
                  lui          s7, 445998
                  fsgnjn.s     fa6, fs2, fa3
                  fclass.s     sp, fa3
                  sra          tp, s7, s3
                  feq.s        s5, ft10, ft2
                  remu         a4, sp, s6
                  mulhu        a0, s8, s7
                  xori         s3, s9, -425
                  xor          a2, sp, s6
                  and          s1, s11, s5
                  ori          t4, tp, 136
                  srai         s7, s9, 2
                  nop
                  ori          t1, sp, 1466
                  sltiu        gp, a7, -1722
                  mulhu        s9, a0, a6
                  fcvt.s.wu    ft6, t4, rup
                  fmin.s       fs7, ft5, fs2
                  andi         a1, t5, 1836
                  div          s1, a0, tp
                  and          ra, s1, a3
                  fmul.s       fa3, fa7, fs6
                  fcvt.s.w     ft8, t3
                  xor          a5, a4, t5
                  fmin.s       fs2, fs9, ft9
                  rem          t3, zero, a4
                  fcvt.s.wu    fa7, t4, rmm
                  xori         t5, s3, -479
                  divu         a1, s7, a0
                  fsgnjn.s     fa7, ft5, fa7
                  ori          s2, a3, -334
                  nop
                  fmv.w.x      ft6, t3
                  lui          a7, 712243
                  fmv.w.x      ft6, gp
                  sltiu        s1, tp, 1906
                  fmin.s       ft1, fs7, ft9
                  sll          ra, a3, s1
                  fsgnj.s      fs3, fs8, fa6
                  addi         a3, a1, -1982
                  fmax.s       ft9, fa1, ft8
                  slt          t2, a0, s6
                  sra          t1, s5, s8
                  mulh         zero, s3, sp
                  fle.s        s7, fs9, ft0
                  remu         a0, s4, a3
                  add          s10, s11, t2
                  slt          s1, gp, t4
                  fsgnjx.s     fs5, fs11, ft6
                  slt          a0, t6, s2
                  mulhsu       t3, a7, s9
                  mulhu        gp, ra, a4
                  sltiu        s2, s7, -1267
                  fle.s        s5, fs5, ft7
                  addi         a4, a5, 1222
                  divu         gp, t3, a0
                  sub          a5, s6, s10
                  fsgnjn.s     ft8, ft5, fs9
                  fcvt.w.s     s9, fa3
                  sltiu        a1, a6, -1002
                  sll          sp, sp, a6
                  div          t4, a1, s4
                  xori         t4, s6, -501
                  rem          t2, s5, s1
                  slti         s7, t4, 434
                  srli         t3, s10, 30
                  sub          t6, sp, a7
                  fcvt.wu.s    gp, fa1
                  fmv.w.x      fa4, sp
                  slti         zero, s0, 886
                  flt.s        a7, fs0, ft4
                  flt.s        t1, ft4, fa2
                  fsgnjn.s     ft10, ft3, fs8
                  or           t2, s3, ra
                  mulh         a4, t6, s4
                  nop
                  fcvt.s.w     fs2, s5, rup
                  slti         t4, s2, 1475
                  feq.s        a2, fa7, ft4
                  sltu         s9, gp, a4
                  xori         s8, t3, -1423
                  sll          gp, s2, s1
                  fsqrt.s      fs5, fs6
                  mul          sp, s5, a7
                  lui          tp, 193878
                  fmin.s       ft6, ft11, fa6
                  xori         a7, a5, -503
                  slt          s3, a0, a6
                  slt          a1, t1, s7
                  nop
                  addi         s1, s2, -1329
                  mulh         a4, s11, t2
                  fcvt.s.w     fs6, a0
                  fsub.s       ft0, fs6, fs7
                  mulhu        s5, t4, s4
                  fadd.s       ft10, fs6, fa3, rtz
                  flt.s        s3, ft10, ft4
                  feq.s        s3, ft5, ft3
                  mulhsu       s6, s10, a3
                  xori         s6, sp, -1604
                  fsqrt.s      fa4, fs4, rup
                  fclass.s     ra, fa2
                  fdiv.s       fs7, fa5, fa3
                  add          s4, t1, a6
                  feq.s        t6, ft8, ft6
                  slli         a4, s10, 13
                  fclass.s     t3, fs2
                  sub          t4, s3, t4
                  fcvt.w.s     s4, ft4, rtz
                  mulh         a0, a6, zero
                  rem          a3, a3, s8
                  fmax.s       ft11, fs4, fs3
                  sll          s3, a7, a6
                  sltu         a5, a4, t2
                  xor          a3, t0, a1
                  slt          s9, a4, zero
                  srl          s4, s9, t0
                  fsqrt.s      fs2, ft11
                  fmul.s       fs11, ft10, fs8
                  fsgnjx.s     fa0, fs3, fs9
                  fmul.s       fa2, fa4, fs2
                  feq.s        a3, fs7, ft10
                  mulhsu       t2, a1, sp
                  fdiv.s       ft11, fs7, ft11
                  fmul.s       fs8, fs4, fa6
                  flt.s        a7, fs3, ft5
                  fsgnjn.s     ft2, ft1, fs11
                  mulhu        a4, a2, t3
                  addi         gp, a5, -145
                  rem          ra, a6, t4
                  div          s6, s9, s5
                  slli         s0, tp, 20
                  fle.s        s3, fa0, fs10
                  fcvt.s.w     fa7, t0, rup
                  slti         a2, s11, 1099
                  fcvt.w.s     s4, fs10
                  slti         s1, s5, 415
                  srli         sp, t6, 22
                  nop
                  srli         s6, s3, 10
                  srai         s9, t3, 6
                  mulhu        gp, a2, t0
                  sltu         tp, s10, a2
                  srai         s0, zero, 13
                  mulhu        s5, a4, gp
                  fcvt.s.wu    fs3, s2, rtz
                  add          a3, s1, tp
                  div          t2, tp, s8
                  feq.s        tp, ft2, ft10
                  add          t6, zero, a0
                  fcvt.w.s     a5, ft2
                  fadd.s       fa1, fs3, fs8, rmm
                  remu         zero, s9, s4
                  fcvt.wu.s    zero, fs11, rup
                  andi         a0, t0, -602
                  fsgnjx.s     fa6, ft6, fs2
                  xori         ra, gp, -637
                  fle.s        t3, fs6, fs7
                  fsgnjx.s     ft4, ft7, ft5
                  nop
                  fsgnj.s      fa7, ft7, ft8
                  srl          t5, t1, s0
                  srli         s0, sp, 30
                  fsgnjx.s     fs9, fs5, ft8
                  fcvt.wu.s    s7, ft2
                  srl          tp, t5, s8
                  sub          t6, t5, t0
                  fsqrt.s      fs6, ft2, rne
                  fmin.s       fs11, fa4, fs8
                  xori         sp, zero, 603
                  fsgnjn.s     fs7, ft2, fs2
                  slli         s2, a1, 6
                  mulhu        s10, s3, s11
                  sltiu        ra, s3, 1071
                  fadd.s       ft3, ft3, fs9
                  or           t2, a0, s10
                  fsgnj.s      fs7, fs0, fs1
                  rem          t2, zero, s4
                  xori         s7, s1, 221
                  fsgnjn.s     ft5, fa3, ft5
                  fsqrt.s      ft2, fs3
                  addi         s8, a2, -651
                  fle.s        s2, ft5, fa3
                  srl          t3, s8, t0
                  fsqrt.s      ft7, ft6
                  srli         s3, sp, 10
                  xor          t6, a0, a5
                  fmul.s       fa5, fs1, fa3, rne
                  srl          s5, a2, s7
                  auipc        a4, 790148
                  rem          t2, a1, s1
                  fclass.s     a3, fs0
                  flt.s        s9, ft11, fa2
                  div          t5, s2, t2
                  fmv.x.w      a5, ft0
                  mulhsu       tp, tp, s0
                  slt          zero, ra, s3
                  xor          a3, s5, t5
                  sub          t1, a7, a0
                  sra          s9, a3, s8
                  slt          t4, s6, t2
                  fcvt.w.s     zero, fs11, rmm
                  srl          t5, a3, s7
                  xori         s1, t5, -836
                  sub          a7, sp, a5
                  sub          a7, zero, a2
                  div          a0, a3, t2
                  and          s6, a2, zero
                  mulh         s4, s9, a7
                  andi         t3, s6, -1320
                  sltiu        tp, gp, 401
                  srli         zero, t4, 24
                  xor          t6, gp, a3
                  fcvt.s.w     fa3, zero, rmm
                  nop
                  flt.s        s5, ft5, fa4
                  fsgnj.s      fs8, ft0, fs7
                  flt.s        t5, fa3, fs11
                  fcvt.s.w     ft8, s11, rdn
                  sub          t1, t5, gp
                  nop
                  slli         gp, s1, 5
                  flt.s        s4, ft6, fa7
                  fsqrt.s      fs6, ft8
                  fdiv.s       fa7, fa7, ft4
                  addi         a1, t5, -1896
                  slti         s8, s4, -1304
                  xor          sp, a5, s3
                  lui          a0, 634770
                  sltiu        a5, s2, 1539
                  sll          t5, a3, s1
                  fmin.s       fs3, ft3, fa4
                  fsub.s       ft10, ft9, fs3
                  fclass.s     s9, ft4
                  fclass.s     s9, ft8
                  fcvt.wu.s    s4, ft1, rup
                  slt          s3, ra, a7
                  sll          a7, s11, a0
                  fcvt.s.w     ft5, s9, rtz
                  slti         a7, s9, 504
                  fmax.s       fs8, fs5, fs3
                  srai         a5, s3, 28
                  sub          t4, tp, s6
                  addi         a2, t5, 1855
                  feq.s        t6, ft1, ft10
                  xori         a1, s1, 220
                  fcvt.wu.s    a2, fs8, rtz
                  mul          a0, s4, t2
                  lui          s10, 728705
                  lui          a3, 190301
                  lui          t5, 739189
                  srai         a2, zero, 5
                  flt.s        zero, ft5, ft10
                  fclass.s     s5, fs0
                  fcvt.w.s     a3, ft7, rmm
                  xor          s10, ra, ra
                  sub          s1, t6, t6
                  rem          tp, s5, zero
                  mulhsu       s0, s7, s9
                  srli         a2, a1, 3
                  sll          a5, a7, a6
                  fcvt.w.s     a4, fs9, rne
                  mulh         s2, t2, tp
                  sll          gp, t4, s7
                  feq.s        a5, fs6, fs0
                  fmin.s       ft9, ft4, ft8
                  addi         s4, t0, -380
                  mulhsu       a5, sp, t5
                  lui          s4, 213530
                  xori         a3, gp, -834
                  fclass.s     s5, ft10
                  divu         t4, t6, gp
                  add          a4, tp, s9
                  fmv.x.w      a7, ft0
                  fmax.s       ft3, ft2, fs11
                  flt.s        s7, ft4, fs2
                  addi         ra, a7, -858
                  addi         s7, t2, -351
                  divu         sp, gp, a4
                  xor          gp, tp, t2
                  fsgnjx.s     fa5, fs1, fs2
                  sltu         zero, t1, sp
                  and          s2, s9, a6
                  sub          tp, a6, a3
                  fmin.s       fa4, fs3, fa1
                  fcvt.s.wu    ft9, s7, rtz
                  fmin.s       ft7, ft5, ft7
                  sra          ra, tp, t2
                  remu         a2, a7, t6
                  fle.s        s9, fa3, fa0
                  fsgnjn.s     fa1, fa5, fa1
                  fcvt.wu.s    sp, ft8
                  fcvt.wu.s    gp, fs3
                  fsgnjx.s     fa2, fs2, ft11
                  fclass.s     s2, fs3
                  fcvt.s.wu    ft6, a7, rmm
                  xor          a4, s5, a0
                  slti         s3, s4, 1033
                  fsgnj.s      fa5, ft4, fs9
                  fadd.s       fs6, ft4, fs1, rdn
                  fmv.w.x      ft3, s9
                  fcvt.s.w     fa7, ra
                  remu         t6, sp, a3
                  fcvt.wu.s    zero, ft3
                  divu         a5, a5, t2
                  fmul.s       fs2, ft11, ft9
                  fmv.x.w      a0, ft7
                  fmv.w.x      fs10, t5
                  add          a7, a7, ra
                  fsub.s       ft5, fa1, fs7
                  fsqrt.s      fa0, fa3
                  srli         s6, t6, 4
                  nop
                  slli         t2, sp, 24
                  sra          s6, a1, a3
                  fclass.s     s10, fa5
                  fmv.x.w      a7, fa5
                  sltu         s10, s3, a6
                  or           gp, tp, s7
                  srl          s7, t6, a2
                  mulhu        s5, t5, a2
                  slt          t3, s4, a1
                  fclass.s     a3, ft5
                  fcvt.w.s     s6, ft2, rup
                  sra          t5, t1, t3
                  slli         s0, s3, 21
                  add          s9, t4, a5
                  slli         s5, t2, 18
                  srli         a5, s2, 0
                  feq.s        a3, fa5, fs3
                  auipc        s8, 254220
                  add          a7, t1, a4
                  fmv.x.w      a1, ft6
                  slti         s1, ra, 2004
                  fmax.s       ft7, ft9, fa7
                  auipc        s7, 471586
                  sltiu        a0, gp, 582
                  andi         s10, a5, -1065
                  slli         a5, t0, 0
                  xor          s2, t3, s11
                  mulhsu       s9, sp, a3
                  slli         a7, s1, 5
                  sll          a1, t1, t5
                  ori          zero, s3, 675
                  sll          s5, s8, s6
                  fmax.s       fs10, fs3, ft8
                  fmax.s       ft3, fs3, fs4
                  sltu         tp, t6, s3
                  andi         t2, zero, 646
                  srai         t2, s10, 27
                  sltu         t6, t4, t4
                  or           s7, a1, gp
                  sltu         a1, tp, a7
                  lui          s9, 599303
                  xor          s4, a0, s10
                  fcvt.wu.s    s5, ft10
                  fcvt.s.w     ft5, s7
                  fclass.s     s4, fs1
                  fcvt.s.wu    fa4, a3
                  fsgnjx.s     ft3, ft9, fs4
                  fmv.w.x      fs8, s10
                  fcvt.s.wu    ft1, a0, rtz
                  remu         sp, a1, a0
                  divu         ra, a0, a3
                  mulhsu       a3, s9, zero
                  fadd.s       fs8, ft7, fa1
                  mulhsu       sp, a3, t5
                  fsub.s       fs6, fa7, fs7, rup
                  or           s3, gp, s3
                  sltiu        a7, t6, -1668
                  fcvt.wu.s    gp, ft11, rtz
                  fle.s        t2, fs11, ft5
                  srai         s10, t3, 2
                  srli         s5, sp, 11
                  fsub.s       fa7, fs1, fa3, rmm
                  fsgnj.s      fa0, ft7, fa6
                  fsub.s       fs10, ft2, fa0
                  srai         s4, a1, 16
                  fsgnj.s      fs5, fs4, fa4
                  slti         zero, s7, 1753
                  sltiu        s3, a0, 1357
                  srli         s6, s7, 20
                  addi         s6, t2, -36
                  fsqrt.s      fs11, fs7
                  feq.s        s5, fa0, fa4
                  divu         s2, s11, s7
                  fmv.x.w      s0, fs5
                  or           s1, tp, s10
                  fcvt.w.s     t2, fa2, rne
                  mulhsu       s10, t4, t4
                  andi         s0, a6, 168
                  sra          s10, s2, a3
                  addi         a4, gp, -1131
                  srl          t5, a4, s7
                  fsub.s       fs4, ft7, fa5
                  fmin.s       fs7, ft3, ft9
                  auipc        s10, 321621
                  fmax.s       fa2, fa5, ft1
                  feq.s        a7, fs3, ft7
                  or           s7, a1, a6
                  srli         ra, ra, 27
                  xori         ra, sp, -1865
                  div          s1, a1, s4
                  sltu         s6, a0, a4
                  sub          sp, s3, s9
                  slti         a1, a1, -1512
                  div          s7, t0, a7
                  xori         tp, sp, 1807
                  add          sp, a2, t5
                  xor          a4, t6, s10
                  mul          t4, a7, t5
                  fsgnj.s      fa4, fa0, ft6
                  fsgnjn.s     fs4, ft10, fs0
                  mul          s2, s5, t2
                  and          s7, a7, t0
                  fcvt.w.s     t3, fa5
                  slt          t1, s10, s11
                  fsgnjn.s     fs8, fs2, ft4
                  rem          zero, a0, ra
                  nop
                  mulhsu       zero, a2, s0
                  fsgnj.s      fa0, fa6, fa6
                  divu         a7, a5, ra
                  fdiv.s       ft0, fa7, fs6
                  fcvt.s.w     ft1, s3, rtz
                  or           a3, s6, a0
                  fcvt.wu.s    a1, fa6, rtz
                  fsub.s       ft4, ft6, ft7, rtz
                  remu         a4, a2, t5
                  sll          t4, sp, sp
                  addi         a0, zero, -1971
                  mulhu        a7, zero, a4
                  srli         t5, s7, 29
                  fsgnjn.s     fs11, fa5, fs4
                  fsqrt.s      ft2, ft1, rtz
                  mul          a2, s2, a6
                  xor          s4, s6, s10
                  fcvt.s.w     fa5, t0
                  sub          gp, tp, t5
                  fclass.s     s8, fs5
                  fadd.s       fa0, fa1, ft6
                  or           s9, t3, a2
                  fcvt.w.s     s9, ft11
                  sltiu        a3, a4, 1845
                  fmin.s       fa4, fs2, fs4
                  nop
                  fsqrt.s      ft7, ft11, rdn
                  fsgnj.s      ft10, fs2, ft4
                  slli         t2, t2, 4
                  sltu         s8, s10, t6
                  feq.s        a7, ft3, ft2
                  fcvt.s.wu    ft8, a7
                  auipc        s10, 986790
                  or           s8, s0, zero
                  srai         gp, a5, 22
                  fsgnjx.s     fa1, ft3, fa7
                  fmv.w.x      fs3, s7
                  fmax.s       ft1, ft6, ft10
                  remu         tp, a7, tp
                  sll          s5, s10, t1
                  add          gp, ra, t5
                  auipc        s5, 604632
                  mulhsu       a0, t4, s10
                  slli         s6, t6, 9
                  divu         s4, s6, a7
                  mulhu        s10, t4, s4
                  xori         a7, t3, 53
                  mul          sp, t1, ra
                  flt.s        s0, ft1, fa3
                  fmv.x.w      a7, ft1
                  sltu         sp, t4, s5
                  fcvt.s.w     ft6, sp
                  fsqrt.s      ft10, fs6
                  fmv.w.x      ft9, a6
                  fsqrt.s      fa6, ft2
                  add          s6, t0, t2
                  or           s3, s5, a6
                  fsqrt.s      fa6, ft7
                  mulh         t5, t0, a2
                  and          s10, s1, zero
                  fadd.s       ft3, fs9, ft6
                  fsub.s       ft2, ft8, ft6
                  divu         a2, t3, zero
                  divu         tp, s0, s7
                  slti         sp, s11, 1051
                  slt          t4, t1, s6
                  add          zero, s11, a1
                  sra          t2, sp, ra
                  fmin.s       fa2, ft8, fs5
                  fsgnj.s      fs6, fs5, fs10
                  fsqrt.s      ft2, ft5
                  fmul.s       ft8, fa2, fa5, rmm
                  fmul.s       ft4, fs0, ft1
                  fcvt.s.w     ft0, s10
                  add          ra, t2, zero
                  fmin.s       fs7, fa6, fa6
                  fmax.s       fs2, ft2, ft6
                  srli         t6, zero, 20
                  srli         s10, ra, 23
                  fmax.s       fs8, fs9, ft6
                  slli         t4, s0, 22
                  fsub.s       fs9, fa5, fa6, rdn
                  flt.s        a7, fa0, fa4
                  fmv.w.x      fa5, t6
                  fmax.s       ft2, ft2, fs5
                  remu         t4, s11, a6
                  mul          s9, s7, s3
                  auipc        s3, 605063
                  srl          zero, a5, t0
                  nop
                  xori         s9, a7, 1749
                  slti         sp, s4, -945
                  srl          s9, s9, t6
                  fsqrt.s      fs1, ft6
                  fsgnjn.s     fs7, ft3, fs8
                  fmul.s       ft2, fa5, fs6
                  mulh         t5, s5, t1
                  auipc        t1, 284972
                  fsqrt.s      fs2, ft5
                  fmv.x.w      t3, fs2
                  mul          s1, t2, a2
                  fcvt.s.w     ft6, s7, rup
                  mulhu        s0, s4, s9
                  feq.s        a3, ft1, fs2
                  flt.s        a4, fs9, fs10
                  srl          a0, a4, zero
                  fcvt.w.s     s5, fa0, rup
                  slt          a1, s0, t4
                  fdiv.s       fa1, fs2, fa3
                  slti         s0, s7, -1
                  fcvt.wu.s    s5, ft0, rne
                  auipc        ra, 583206
                  remu         t1, s10, a1
                  andi         a4, t1, 1918
                  remu         a1, s9, a7
                  remu         a1, a4, a5
                  fmin.s       fs1, ft10, fa6
                  slti         tp, s8, 877
                  slt          s9, a2, a1
                  fcvt.s.w     ft7, t0
                  fcvt.w.s     s5, fa5, rne
                  mulhu        tp, s2, s7
                  sltu         a7, s2, t2
                  andi         a3, s2, -1916
                  fcvt.wu.s    s10, fa5
                  remu         a7, s2, gp
                  or           s2, s11, a6
                  fclass.s     a4, fs0
                  sltiu        a1, a7, 1017
                  fmul.s       ft2, ft6, ft0, rup
                  fcvt.w.s     ra, fa7
                  slli         s10, t3, 18
                  divu         t3, t3, s8
                  auipc        s5, 618908
                  ori          zero, sp, 780
                  mulhsu       zero, sp, t2
                  srl          zero, t4, a7
                  mulh         s10, a1, sp
                  slti         t3, a7, -1621
                  fmul.s       fa0, ft2, ft0, rne
                  div          a2, t0, s0
                  fdiv.s       fs0, fs3, fs0, rup
                  remu         a5, a7, ra
                  nop
                  fcvt.s.w     fa1, s10, rmm
                  fle.s        t5, fs4, fa2
                  ori          s9, t3, -223
                  feq.s        a5, ft2, fs10
                  or           a0, a7, s8
                  and          s6, zero, a1
                  fadd.s       fs10, fa1, fs11, rdn
                  fclass.s     t4, ft0
                  div          s10, a2, s11
                  sra          s1, sp, s7
                  fle.s        s7, ft2, fa4
                  add          s5, t3, s9
                  mulh         gp, a0, s5
                  lui          s1, 875275
                  feq.s        s5, fs2, fs7
                  mulhu        sp, a3, s5
                  srl          s3, a2, t3
                  nop
                  fadd.s       ft1, ft5, ft2
                  fsgnj.s      fs0, ft6, ft3
                  remu         s7, a1, a2
                  add          a3, s10, s3
                  sltiu        s7, tp, 1887
                  fmv.w.x      ft2, s5
                  mulh         s10, s2, zero
                  ori          s8, tp, -1534
                  or           s2, a6, a4
                  fcvt.wu.s    a7, ft3, rup
                  feq.s        a5, fa7, fa0
                  fmv.w.x      ft3, t6
                  divu         s2, tp, t5
                  srli         t2, t4, 1
                  fcvt.w.s     zero, fs1
                  fsqrt.s      fa6, fs9, rmm
                  fle.s        a1, ft11, fs8
                  fmax.s       fs2, ft4, ft6
                  xor          s1, s8, tp
                  ori          s1, sp, -869
                  div          s7, s0, s6
                  fcvt.s.wu    fs1, s5, rmm
                  fsgnjx.s     fa5, fs11, fa1
                  auipc        s4, 448492
                  fcvt.wu.s    s1, fs4, rmm
                  fcvt.s.wu    ft5, s5, rup
                  sra          a2, a2, gp
                  srl          t5, tp, s5
                  flt.s        s7, ft9, fs11
                  fmax.s       fs8, fs3, fa5
                  ori          t2, t2, 469
                  sltiu        t5, gp, -196
                  and          s3, s0, ra
                  fcvt.wu.s    t3, fa3
                  sltiu        a0, t6, -1953
                  fsgnjx.s     ft6, fa7, fa6
                  or           t1, s2, t5
                  feq.s        s10, ft9, fs6
                  slli         a7, s0, 22
                  xor          t5, a4, gp
                  fcvt.w.s     sp, fa6
                  ori          ra, t4, 1352
                  fcvt.w.s     a4, ft2, rdn
                  fsgnj.s      fs0, fa5, fs7
                  fcvt.s.wu    ft8, tp, rne
                  fle.s        sp, fa4, fa0
                  fmv.w.x      ft8, a4
                  addi         s4, a4, -1179
                  sll          s1, zero, s7
                  flt.s        ra, fa5, ft3
                  or           s4, s5, a6
                  fcvt.s.w     ft7, t1
                  fcvt.w.s     ra, ft6
                  sub          s4, s3, t3
                  feq.s        s1, fa5, fs6
                  sltiu        a0, t5, 1047
                  and          s6, tp, s7
                  andi         a1, a2, -1793
                  fadd.s       fs2, ft5, fs2, rdn
                  flt.s        ra, ft10, fs11
                  srai         s9, s4, 18
                  fdiv.s       ft4, ft11, fa0, rdn
                  fmv.x.w      s2, fs5
                  mulhsu       a0, s10, tp
                  fmv.x.w      s9, fs10
                  lui          t5, 669955
                  addi         ra, s8, 1635
                  fmul.s       ft8, fa2, ft9, rtz
                  or           a2, a1, t6
                  slti         s9, s11, -1832
                  addi         t5, t5, -638
                  fclass.s     a3, fs5
                  and          a2, s3, t2
                  xori         s6, a2, 1465
                  fmv.w.x      fa0, s4
                  divu         s9, s5, t2
                  sub          s4, s6, s4
                  fsgnjx.s     fa0, fs10, fs8
                  fsgnjn.s     fs7, ft9, fa0
                  div          s5, s1, s3
                  sltu         t4, a2, a5
                  sll          t5, s0, s6
                  add          s6, s0, tp
                  fclass.s     s0, fs8
                  feq.s        t1, fs9, fs11
                  fmin.s       fs3, fs9, ft5
                  feq.s        s10, ft7, ft2
                  fclass.s     tp, fa0
                  fclass.s     zero, ft5
                  fmv.x.w      s8, fa0
                  fcvt.w.s     s2, ft7, rtz
                  fcvt.wu.s    s0, fa5
                  fsqrt.s      ft11, fa6, rdn
                  fadd.s       fs9, fs1, ft3, rup
                  srai         s3, s4, 24
                  xori         t6, a3, -526
                  ori          t6, a0, -579
                  srli         a7, t4, 4
                  auipc        t1, 590089
                  sra          sp, s8, a0
                  remu         s4, t0, t3
                  slt          t5, a7, a2
                  xor          t3, s2, a0
                  fsqrt.s      fa4, fs1, rup
                  slt          tp, a1, t1
                  fclass.s     t5, ft2
                  fcvt.s.wu    ft10, a7
                  mulhu        t4, t4, s6
                  fadd.s       fs7, ft9, fa2
                  auipc        s0, 177666
                  slli         t6, sp, 27
                  fsgnjx.s     ft4, fa7, fa6
                  mulhsu       s9, t1, t2
                  mulh         t6, s3, a2
                  fsgnj.s      fa6, fa0, fa6
                  slti         gp, s4, -1912
                  sltu         s7, a4, s3
                  ori          a7, s4, -1247
                  fsgnjx.s     fa0, fs9, fa6
                  fcvt.w.s     s2, fs0
                  slli         a4, sp, 19
                  ori          t2, s8, 1495
                  fcvt.wu.s    a7, fa3
                  fclass.s     t4, fa0
                  fsgnjx.s     ft2, fs11, fs2
                  and          t6, zero, s5
                  mulhu        s3, s5, a0
                  mul          gp, s11, s7
                  fclass.s     s7, ft11
                  mulhu        s0, s11, t4
                  auipc        s0, 517308
                  srli         a1, a0, 13
                  xori         s1, a5, -1182
                  ori          s9, t5, -1965
                  slli         sp, t5, 4
                  xor          s2, a1, a2
                  flt.s        a5, ft5, ft1
                  fadd.s       ft5, ft2, ft0
                  sltiu        t2, s11, 417
                  fsgnjn.s     ft0, fa1, ft1
                  nop
                  xor          a7, ra, tp
                  fle.s        a2, fs10, ft1
                  fadd.s       fa5, fs6, fs3
                  xor          gp, t4, s4
                  fsgnjx.s     ft5, fs8, ft5
                  fmin.s       fs9, fs4, fa5
                  fsqrt.s      fa5, ft7
                  slt          tp, a0, s4
                  sub          zero, t4, s4
                  ori          s0, a3, -1501
                  slli         t2, a5, 30
                  fcvt.wu.s    a0, fa7, rne
                  fdiv.s       fa0, fa0, ft8
                  nop
                  add          t1, a3, a2
                  srl          a4, a2, s9
                  auipc        a7, 596050
                  ori          s5, s0, -230
                  div          a1, s9, a2
                  fsgnjn.s     fa0, ft0, fs4
                  remu         s7, s11, s9
                  fmin.s       fs3, fs10, ft11
                  or           s4, s5, t0
                  sll          t6, s4, s9
                  fmv.w.x      ft11, s10
                  fmv.x.w      t4, ft1
                  fcvt.wu.s    a4, fs5
                  fle.s        a3, ft8, ft0
                  fsgnj.s      fa5, fs2, ft2
                  sub          s8, s11, s4
                  fle.s        a3, ft9, ft3
                  fmax.s       fs11, fa2, fs1
                  fmul.s       fs5, fs6, fs8, rup
                  fcvt.s.w     fa7, t4
                  fsub.s       ft1, ft4, fs8
                  rem          s10, s4, a7
                  slti         s10, t5, -1857
                  and          a3, t3, s11
                  ori          a4, s1, 166
                  flt.s        s8, ft9, ft7
                  slli         a2, s4, 16
                  sra          zero, s6, s11
                  xori         s1, a5, 860
                  fsgnjx.s     ft0, fs10, ft4
                  fmv.x.w      s3, ft8
                  sll          s3, a0, ra
                  sltiu        s5, a5, -20
                  auipc        t1, 969560
                  slt          tp, ra, t6
                  fcvt.w.s     t6, ft6
                  ori          a3, s11, -1376
                  sltu         a1, sp, t3
                  fmv.x.w      s6, fa5
                  sub          gp, t1, s0
                  or           ra, s3, a5
                  fdiv.s       ft4, fs5, ft9
                  nop
                  slli         a0, s1, 29
                  srli         s3, tp, 20
                  mulh         s4, s6, s1
                  slt          a3, s6, s1
                  fmax.s       ft11, fs1, ft3
                  mulhu        s2, a6, t2
                  ori          a5, a2, -1107
                  fcvt.s.w     fs3, a0
                  fsqrt.s      fa2, fs5
                  fsqrt.s      fa3, ft8
                  fcvt.s.w     ft11, gp, rne
                  ori          s10, t5, -1795
                  or           t6, t5, s8
                  fsub.s       fs1, fs10, ft7
                  xor          t6, gp, s5
                  fmv.w.x      fs8, s9
                  rem          t1, s0, t1
                  auipc        s2, 406331
                  divu         a4, a0, a2
                  auipc        s3, 433846
                  mulh         s4, s10, sp
                  nop
                  addi         s10, gp, -1921
                  fmv.w.x      ft11, a3
                  div          a3, t1, s5
                  sltu         s6, s6, a0
                  auipc        a5, 326535
                  sll          s0, s11, t6
                  fcvt.s.w     fs2, tp
                  feq.s        s4, fa1, ft6
                  srai         s7, a7, 9
                  sra          s1, gp, s8
                  sub          ra, t6, a3
                  xori         a0, a5, -435
                  divu         t4, a2, s8
                  fcvt.s.wu    fs4, s5
                  fmax.s       fs8, fs11, fs5
                  fcvt.w.s     t6, ft10, rmm
                  fmv.x.w      t4, fs10
                  srl          s10, s1, t3
                  fcvt.w.s     s1, fa0
                  fmin.s       ft7, ft10, fa5
                  remu         s0, s1, s2
                  srl          ra, zero, s10
                  fsgnjn.s     fs9, ft1, fs0
                  srl          a4, t6, tp
                  fcvt.wu.s    a2, fa5, rup
                  fclass.s     ra, fs1
                  sltiu        s3, s7, 324
                  xor          ra, s0, a5
                  add          s2, zero, t2
                  fsgnjx.s     fs3, fa4, ft9
                  slt          s2, s0, a7
                  fsgnjx.s     fs2, ft3, fs3
                  mulhu        a1, s4, t1
                  slli         a2, s7, 30
                  auipc        a0, 573535
                  mul          s3, a5, t6
                  fclass.s     tp, fs9
                  remu         t2, s9, ra
                  mul          ra, ra, s9
                  fsgnj.s      fa5, fa0, fa0
                  rem          t4, zero, tp
                  srai         t6, t4, 12
                  fsub.s       fa5, ft10, ft6, rtz
                  fmin.s       fa2, fs7, fs5
                  div          t5, sp, s10
                  fmul.s       ft2, fa4, fs0, rdn
                  addi         a7, a7, 781
                  fadd.s       ft2, fa4, ft8
                  nop
                  feq.s        t2, ft10, ft3
                  div          ra, s3, a6
                  fsgnjn.s     ft3, fs11, ft6
                  slli         s8, a0, 7
                  fcvt.s.wu    ft10, s6, rup
                  fdiv.s       fs8, fs10, fa5
                  rem          s2, s8, a5
                  nop
                  srl          a7, tp, s1
                  fcvt.s.wu    ft11, t0
                  fsgnjx.s     fs1, fa5, ft9
                  divu         s3, s4, t5
                  lui          s10, 855935
                  auipc        sp, 940771
                  remu         t2, a3, s8
                  addi         s5, t3, -309
                  divu         t5, a0, s3
                  sub          s4, a5, t1
                  fmv.w.x      fa2, t6
                  fsub.s       fs1, fa5, fs5
                  fcvt.s.wu    fs2, a2, rup
                  srl          s3, s10, s10
                  rem          tp, a6, sp
                  fdiv.s       fa3, fs5, ft3, rne
                  fcvt.wu.s    sp, fs8, rup
                  slt          ra, s8, s3
                  nop
                  fsub.s       ft4, fa1, ft8
                  fcvt.s.wu    fs2, a7
                  mul          a1, a0, s1
                  fcvt.wu.s    s0, ft5, rne
                  addi         sp, zero, 973
                  fsub.s       ft0, fs6, fa4, rmm
                  lui          a4, 76237
                  nop
                  fle.s        s2, fs8, ft10
                  fle.s        a0, fs6, ft5
                  fsgnjx.s     ft8, fs6, fa1
                  auipc        s4, 818352
                  sll          s7, s2, s11
                  addi         s9, t2, 1841
                  srl          tp, s11, zero
                  sra          t1, s6, t5
                  mul          s9, a2, ra
                  mulhu        t3, s11, t3
                  ori          s5, s8, -1043
                  sll          s9, a5, t4
                  xor          tp, tp, t1
                  add          a7, a4, a5
                  fadd.s       ft4, ft7, fs11, rdn
                  fmv.x.w      s10, fs1
                  fdiv.s       fs5, fs8, fa3
                  fmv.w.x      ft4, s4
                  srl          t4, s6, t1
                  xor          gp, t3, s7
                  lui          s10, 38881
                  fmv.w.x      fs7, a7
                  xori         s6, t6, -1286
                  slli         a7, a6, 1
                  lui          sp, 598523
                  lui          sp, 90408
                  flt.s        a7, ft2, fs7
                  fadd.s       fs2, fs11, fa6
                  slt          t5, a2, s5
                  fsgnj.s      fs10, fs5, fs8
                  fmax.s       fs6, fa4, fs1
                  slti         s6, t2, -892
                  fmul.s       ft8, ft3, ft5
                  andi         t4, t2, -1250
                  ori          t3, a4, 1460
                  fsgnj.s      fa4, fs9, fa7
                  mulhsu       s9, s2, s11
                  sll          s10, zero, gp
                  fmul.s       fa3, fs6, ft4, rdn
                  fmv.w.x      fa0, t6
                  sltu         a2, t0, t3
                  or           s2, s11, sp
                  mulhsu       a3, sp, a0
                  fmv.x.w      s7, fs4
                  sltu         s6, s10, s8
                  sll          zero, a3, a7
                  fmax.s       fs0, ft1, fs8
                  fdiv.s       fs8, ft8, fs2
                  lui          s10, 529083
                  srai         a3, t1, 24
                  fsub.s       fs2, ft7, ft5
                  div          t2, sp, s5
                  sll          a4, s10, s6
                  slli         s2, t1, 19
                  fmin.s       ft5, ft11, fa5
                  or           s9, s11, t1
                  or           a1, tp, s1
                  fsgnjx.s     fs9, fs6, fs3
                  feq.s        a2, ft2, ft4
                  xor          sp, a0, t2
                  slt          s5, s3, s4
                  andi         a1, t1, 1721
                  fcvt.s.w     fa3, t2, rne
                  fmv.x.w      s4, fa4
                  fsgnj.s      ft8, ft11, ft0
                  and          t4, a4, s6
                  xor          tp, s1, a7
                  and          t4, sp, ra
                  and          a5, ra, s9
                  div          s0, t6, gp
                  fdiv.s       fs9, fa5, fs1, rmm
                  fcvt.s.w     fs1, t1
                  auipc        gp, 141886
                  div          s5, sp, t3
                  fsgnjx.s     fa6, fs7, ft5
                  sll          a3, t1, a4
                  auipc        t1, 835390
                  add          s6, s9, s6
                  fmul.s       fa3, fs2, ft9
                  fsgnj.s      fa0, ft3, ft3
                  lui          gp, 276771
                  rem          a0, t1, t1
                  div          s5, t5, a3
                  andi         a2, a1, -508
                  sub          a2, t1, s2
                  mul          t2, s10, a2
                  fsgnjx.s     fs2, ft1, fs2
                  sltiu        s10, s1, 448
                  fmax.s       fa0, fs10, ft3
                  fmul.s       ft11, fa4, ft7
                  fcvt.s.w     ft1, t1
                  slti         s5, t5, 747
                  slti         s6, t3, 1512
                  mulh         t2, tp, s3
                  fsub.s       fs4, fa7, ft9
                  fmv.x.w      a2, fs8
                  ori          a4, ra, 1975
                  fmul.s       fa6, fs8, ft10, rtz
                  fsgnjn.s     fs10, fa6, fs10
                  andi         a4, a6, 961
                  or           gp, t6, s8
                  fadd.s       fa0, fa3, ft7
                  slt          t1, a2, s6
                  div          tp, s0, s6
                  fle.s        sp, fs0, fs11
                  fdiv.s       fa0, ft9, fs8, rdn
                  slt          t3, s2, a7
                  add          t3, tp, a0
                  mulh         s2, s8, s2
                  srl          a2, a0, tp
                  slli         t4, a0, 20
                  xor          a5, t2, tp
                  xor          t1, sp, tp
                  mul          zero, s1, gp
                  mul          a1, s4, s2
                  divu         s0, s1, a0
                  fmax.s       ft9, ft11, fs1
                  flt.s        ra, ft11, ft5
                  or           gp, zero, s6
                  fsgnj.s      fs9, fs1, fa2
                  fsqrt.s      fs11, fs3
                  fadd.s       ft7, fs8, fa2, rtz
                  mulhu        a3, a2, s1
                  add          s10, a6, s11
                  fdiv.s       fa5, fa0, fs11
                  or           t6, s10, t3
                  fsgnj.s      ft4, fs1, ft11
                  fmul.s       ft8, fs10, ft0, rne
                  fmv.x.w      s2, ft11
                  flt.s        tp, fs3, ft7
                  auipc        s7, 470282
                  fcvt.w.s     a0, fs11, rmm
                  fcvt.wu.s    t6, ft11, rtz
                  add          s7, a4, a3
                  divu         t6, s2, s5
                  sltu         t1, s7, s7
                  fmv.w.x      fa5, gp
                  remu         ra, a5, s8
                  mul          s10, a1, s4
                  srl          s7, s6, a5
                  or           a7, s3, s7
                  fclass.s     zero, fs5
                  fmul.s       fs7, fs4, ft2
                  nop
                  mulhu        gp, a2, t0
                  fcvt.wu.s    t5, ft4
                  feq.s        s3, fa7, fs8
                  slli         a0, s0, 21
                  fle.s        s4, fs11, fs10
                  sltiu        t1, t1, -1753
                  sra          s0, zero, s7
                  addi         a5, s1, -281
                  sltiu        s4, a1, 707
                  or           a2, gp, sp
                  fadd.s       fs11, ft3, fa4
                  fmin.s       fa5, ft9, ft6
                  fmul.s       fs2, fa0, ft10
                  feq.s        t3, fa5, fa4
                  fcvt.w.s     a4, ft4, rne
                  fle.s        a0, ft7, ft1
                  sra          s3, s11, s2
                  fclass.s     s7, ft0
                  fsub.s       fs5, fa3, ft1, rdn
                  srli         tp, gp, 8
                  srl          tp, sp, a2
                  rem          a5, s8, zero
                  fmul.s       ft6, fs6, fs11, rne
                  auipc        t4, 88185
                  feq.s        a0, ft9, fa0
                  sltu         a7, s11, s6
                  andi         s6, sp, -1100
                  fcvt.wu.s    t4, ft10
                  lui          a3, 19596
                  mulhsu       s6, t3, a5
                  and          tp, t0, zero
                  fclass.s     gp, fs9
                  feq.s        s7, ft7, ft2
                  sltiu        s4, t6, -112
                  fcvt.wu.s    t2, fa7
                  xori         s9, t3, 1859
                  slti         a5, s8, -164
                  flt.s        a2, fs11, ft7
                  fcvt.s.w     fs7, s8
                  flt.s        a4, fs9, fs7
                  srai         a5, s1, 0
                  mulhsu       s10, s5, t6
                  lui          t1, 24280
                  nop
                  mul          gp, s4, s0
                  or           s8, s6, s11
                  sltu         s7, a6, s6
                  add          zero, zero, a0
                  fsgnjx.s     ft7, fs7, fs10
                  rem          t4, t0, s0
                  rem          zero, a6, a0
                  mul          s8, s2, s3
                  fdiv.s       fs6, ft8, fs4
                  and          s8, gp, zero
                  fdiv.s       fs9, fs3, fa1, rup
                  fsgnj.s      ft9, ft11, ft7
                  div          s5, t4, a5
                  fmax.s       fa7, fs1, fa1
                  sltu         ra, s0, s5
                  srai         ra, t5, 21
                  fcvt.s.wu    fs6, a7, rne
                  fmv.x.w      s1, fs0
                  mulh         s4, s2, tp
                  xor          s3, s4, sp
                  remu         gp, a7, a1
                  fdiv.s       fs5, ft2, fs2
                  add          s2, a3, a7
                  fcvt.wu.s    t1, fa3
                  fsub.s       fs9, fs6, ft3, rup
                  lui          t1, 782373
                  fmv.w.x      fs3, ra
                  fcvt.s.wu    ft1, t6
                  srl          s2, t2, a0
                  slt          s3, a5, a2
                  feq.s        s6, fa5, ft7
                  addi         t6, t1, -242
                  fcvt.wu.s    tp, fa6
                  feq.s        a1, fs11, fs6
                  xori         zero, gp, 291
                  fcvt.w.s     t2, ft3
                  fmul.s       ft10, fs1, fs7
                  mul          s10, a3, s3
                  mul          s6, s4, s2
                  andi         t5, zero, -1157
                  div          a3, a5, s5
                  mul          t3, a0, s2
                  sltiu        s5, a2, 421
                  add          t3, sp, t2
                  fadd.s       ft1, ft0, ft7
                  srli         sp, t5, 22
                  fsgnj.s      fs8, fs4, ft9
                  nop
                  nop
                  fdiv.s       ft6, fs10, ft8
                  srai         t3, sp, 7
                  slti         s1, s5, 769
                  lui          a5, 277376
                  mulhsu       zero, t1, zero
                  divu         sp, t5, a2
                  slti         gp, s1, -405
                  srl          s2, s10, a3
                  fmax.s       fa6, ft8, fa5
                  div          t1, t3, s4
                  sll          a7, t3, zero
                  fadd.s       fa6, ft2, fs11, rtz
                  nop
                  slti         s5, t2, 1056
                  add          a0, a4, t6
                  rem          t5, s8, ra
                  fcvt.s.w     fs3, s5, rup
                  lui          s1, 274312
                  srl          a3, zero, t5
                  sll          t5, tp, a4
                  add          s1, s0, t5
                  nop
                  lui          t2, 281355
                  srli         s3, sp, 4
                  fmv.x.w      s3, fa0
                  fclass.s     tp, ft8
                  mulh         s7, a7, t0
                  div          s9, s4, a0
                  fadd.s       fs1, fs10, ft5, rtz
                  fsqrt.s      fa0, ft6
                  div          s3, t2, s4
                  srai         s3, t6, 23
                  xori         a7, gp, -1574
                  fclass.s     t1, fs0
                  mulhu        s6, s9, a6
                  auipc        a2, 453988
                  xori         zero, t0, 920
                  addi         t5, zero, 1264
                  sltu         a5, a0, t6
                  fmv.x.w      gp, fs3
                  fsqrt.s      ft11, ft10
                  nop
                  fmv.w.x      fa1, t1
                  slli         s6, s11, 3
                  srl          t4, a0, s3
                  mulh         t1, t3, s0
                  div          a3, t2, ra
                  fsgnjn.s     fa4, fs4, fs1
                  div          a3, s4, a0
                  srl          a7, s3, s1
                  remu         a5, s2, t0
                  fmin.s       ft1, ft7, fs6
                  slli         s2, s7, 0
                  srli         s2, s1, 28
                  ori          s4, gp, 1296
                  fmv.x.w      s7, fs4
                  ori          zero, t6, 1105
                  sub          s0, tp, s1
                  fsub.s       fa3, ft5, ft11, rdn
                  div          s1, s11, zero
                  sra          s5, ra, zero
                  addi         s0, t0, 1682
                  divu         a7, s1, a5
                  sub          a3, a4, t5
                  remu         a0, a4, gp
                  slli         s4, t4, 1
                  srl          s9, s7, s5
                  fcvt.w.s     s6, ft9
                  fmv.w.x      ft8, s1
                  add          s8, zero, a6
                  fmv.w.x      fs8, ra
                  auipc        a4, 599466
                  xori         a3, tp, 1296
                  fsgnjn.s     fs4, ft10, fs5
                  fadd.s       ft8, ft10, fs8, rdn
                  flt.s        s5, fs6, fa1
                  divu         s4, t0, s1
                  fdiv.s       ft5, fa7, fa2
                  and          s10, s0, t3
                  fcvt.s.w     fa3, t6, rdn
                  fclass.s     s9, ft3
                  fdiv.s       fs9, fa5, fs5, rmm
                  addi         ra, t5, 986
                  divu         t3, s4, t6
                  slti         a7, s6, 1352
                  fcvt.wu.s    t6, ft11
                  fclass.s     s6, fs9
                  sll          sp, s2, t2
                  srli         t1, t5, 5
                  fsub.s       fa1, ft11, ft11, rup
                  slti         tp, a4, 188
                  addi         a1, s5, -2017
                  fmv.x.w      s7, fs10
                  ori          s8, s9, -1730
                  fsgnjx.s     ft10, ft8, ft0
                  fmin.s       ft5, fs4, fa3
                  ori          t6, zero, -620
                  divu         s3, s9, a6
                  xor          t2, a3, s5
                  nop
                  fcvt.s.w     fs5, t1, rmm
                  fadd.s       ft1, fa7, ft0, rtz
                  fcvt.w.s     a0, fa0
                  fcvt.s.w     ft1, s11
                  ori          zero, s3, -216
                  fsgnj.s      ft2, ft9, fa6
                  fle.s        a0, ft8, ft1
                  mulhsu       t2, s7, a5
                  fmv.x.w      s1, fs4
                  fmv.w.x      ft1, a2
                  fsqrt.s      ft3, fs2, rup
                  sra          s5, gp, t2
                  sub          s6, s3, a3
                  addi         s0, a2, 50
                  flt.s        sp, ft2, ft11
                  fsgnj.s      ft8, fs3, fs6
                  sll          s1, a3, s5
                  lui          s5, 752060
                  add          s8, a2, s5
                  fdiv.s       fs4, fs10, fa5, rmm
                  srli         a2, tp, 17
                  remu         a4, gp, s0
                  fmul.s       ft8, fa7, fs4
                  fclass.s     a2, ft5
                  fsgnj.s      fa3, ft9, ft1
                  auipc        t5, 869569
                  ori          s5, t6, -1968
                  sltiu        t4, s9, -1560
                  fmv.w.x      fa4, tp
                  slli         t5, s7, 29
                  fsub.s       fs6, ft4, fs0, rdn
                  add          a7, t5, t2
                  xor          s2, a3, a7
                  fmin.s       fs5, ft5, fa4
                  remu         zero, s1, a4
                  fmul.s       fs2, ft2, ft11, rdn
                  xor          a0, t5, t5
                  divu         s7, a6, t0
                  slt          s7, s2, t2
                  lui          s3, 552463
                  addi         a1, s8, 1844
                  mulh         t3, a2, a2
                  mulh         zero, a3, a5
                  lui          t6, 101248
                  and          s9, gp, a2
                  and          s2, a0, s6
                  srl          s5, s0, t4
                  sltiu        a4, s1, 238
                  srai         s1, t6, 7
                  fmul.s       fs5, fs5, ft2
                  slt          s2, a1, s8
                  auipc        t1, 534200
                  and          sp, t2, s11
                  add          s7, ra, t6
                  or           s7, a6, sp
                  sll          zero, gp, a1
                  flt.s        a2, fa4, fs0
                  xor          t4, a0, a2
                  fle.s        s9, fs9, fa4
                  addi         s4, gp, -1291
                  addi         a2, a5, 1910
                  fmv.x.w      a7, fs2
                  andi         s9, s5, -7
                  mulh         zero, ra, s5
                  srl          a7, a7, zero
                  ori          s1, s6, -1265
                  auipc        t2, 763064
                  andi         ra, t1, -1685
                  remu         s0, sp, s1
                  fcvt.wu.s    t2, fa7
                  div          t4, s0, s5
                  sltiu        s3, s7, -586
                  flt.s        s8, fs3, fa0
                  fmax.s       ft11, fs3, ft5
                  sll          s4, tp, s4
                  mul          a7, a0, s2
                  mulhu        zero, s0, s3
                  fsgnjn.s     fs7, ft5, fa3
                  andi         s0, t5, -86
                  sub          s3, t2, s2
                  slt          a3, s5, a3
                  srli         a0, ra, 27
                  sll          s1, gp, s3
                  remu         s7, t4, zero
                  mul          a5, t2, s9
                  fdiv.s       ft11, ft10, fa5
                  mulhu        ra, s4, gp
                  nop
                  fsub.s       fs10, fs6, fa1, rup
                  fcvt.s.w     ft4, s5
                  mul          a3, t1, s5
                  fsgnj.s      fa4, fs0, ft0
                  fcvt.s.wu    ft10, s5
                  or           t6, t3, s2
                  sra          a3, ra, s5
                  fmv.w.x      ft4, zero
                  auipc        a1, 847326
                  fsgnjn.s     ft7, fa2, ft8
                  slli         s10, t2, 31
                  slli         s10, t3, 7
                  add          ra, a2, t4
                  divu         s1, sp, a5
                  ori          s1, t4, 1751
                  fsqrt.s      fs4, fa1, rne
                  or           t4, s9, s4
                  fsub.s       ft9, fa0, fs11
                  feq.s        a2, fs8, ft6
                  fsgnjx.s     ft1, ft2, fa7
                  sub          a0, zero, s7
                  and          a3, ra, s6
                  fsgnjx.s     ft1, fs0, fa6
                  fsqrt.s      ft5, ft3
                  fsub.s       fs4, fs10, fa0
                  slti         a2, tp, -1889
                  div          s0, s8, s10
                  slli         a2, s0, 25
                  sra          t6, tp, a4
                  mul          t1, t2, s4
                  divu         a0, a7, s10
                  fsub.s       fs3, fs10, fa5
                  srai         s4, a4, 23
                  mulhu        s7, t5, a7
                  sltu         s10, t3, zero
                  ori          t2, a5, -203
                  fsgnjx.s     fa2, fs4, fa6
                  mul          s0, a1, t1
                  slt          zero, t0, a2
                  mulh         t3, tp, a1
                  sub          s3, t3, zero
                  mulh         s6, t4, s11
                  fsgnj.s      fa3, fs0, fs0
                  mul          s7, s4, s8
                  divu         t6, t1, s0
                  fadd.s       fs7, ft10, fa7, rup
                  sltiu        sp, t4, -921
                  slt          s1, s5, t4
                  fcvt.wu.s    s10, fa0, rdn
                  sll          a0, t1, s7
                  fmax.s       ft4, fs0, fa3
                  addi         t6, a4, -292
                  slli         a1, s2, 8
                  remu         s0, a7, s10
                  srai         s7, tp, 28
                  or           a3, a5, s1
                  div          sp, s5, a4
                  fdiv.s       fa3, fs11, ft10
                  xor          a0, a7, s4
                  and          s9, s10, sp
                  mul          zero, s0, s2
                  nop
                  sll          a5, s7, a2
                  slt          s2, t0, s0
                  sltiu        s9, t3, -1742
                  srl          t5, tp, a3
                  slti         s9, s11, -330
                  mulh         a0, zero, sp
                  sltiu        a1, a7, -1582
                  ori          s1, s4, 1753
                  sll          t6, t1, t5
                  fmv.w.x      fs9, zero
                  slli         sp, a1, 11
                  or           a0, a5, a4
                  divu         s3, a7, a3
                  slli         t4, s10, 10
                  nop
                  fsgnjx.s     ft6, ft9, fs2
                  fmax.s       ft10, ft1, fa3
                  mul          t2, s1, ra
                  fcvt.s.wu    ft0, a2
                  sltu         a1, t5, zero
                  fcvt.s.w     fs0, t6
                  fcvt.wu.s    s1, ft0, rtz
                  flt.s        a1, fa1, ft0
                  fcvt.wu.s    a5, fa2, rne
                  add          a2, tp, t6
                  div          a0, a6, s10
                  xori         a2, a2, 1042
                  slli         t4, t5, 11
                  sra          s5, s3, s3
                  fsgnjn.s     ft10, fa7, ft4
                  feq.s        a2, fa5, ft0
                  fcvt.w.s     s2, ft10, rdn
                  sltiu        s2, t6, -1789
                  divu         a7, a2, t4
                  fcvt.wu.s    t3, ft2
                  fcvt.wu.s    a5, fa2, rtz
                  fsub.s       ft9, fa7, fa7
                  xori         s9, a0, -1539
                  fmul.s       fs1, ft2, fs9
                  feq.s        a4, fa3, fs1
                  fcvt.w.s     t1, fs6, rne
                  mulhsu       a3, s8, t0
                  remu         s6, s5, a2
                  addi         a1, t1, -1637
                  mulhu        a3, s11, t0
                  or           s2, a5, gp
                  srl          a1, t4, s4
                  fcvt.w.s     sp, ft8
                  sltiu        s1, s2, 609
                  sll          s10, t0, gp
                  or           a5, tp, s11
                  xori         a5, s5, 1212
                  sub          t2, gp, zero
                  fsgnjn.s     fs0, ft6, fa1
                  remu         t2, tp, ra
                  fmin.s       ft4, fa0, fs0
                  fle.s        t6, fs10, fs6
                  srl          t2, a4, s7
                  auipc        zero, 562518
                  fcvt.s.wu    ft7, tp, rdn
                  divu         s1, s0, s9
                  fle.s        s0, fa4, fs4
                  slti         s7, gp, -325
                  and          a3, s2, s0
                  slti         a4, t3, -1762
                  srai         s5, t0, 11
                  srai         gp, s5, 24
                  divu         a7, t5, t0
                  sltiu        tp, a6, 1643
                  fcvt.s.wu    fa2, s1, rmm
                  fcvt.w.s     t4, fa6
                  fcvt.s.wu    ft1, a0
                  fsgnjn.s     fs9, fs9, ft10
                  and          s7, a1, a1
                  fcvt.s.wu    fa0, t3, rdn
                  xor          s10, s4, s6
                  rem          t1, s4, ra
                  fdiv.s       fs2, fa7, fa1
                  fmax.s       fs4, fa6, fs7
                  fsgnjx.s     ft8, fs6, fs11
                  fcvt.wu.s    t2, ft8, rtz
                  flt.s        a3, fs5, ft6
                  sltiu        s6, t0, 516
                  fcvt.w.s     a7, fa3
                  addi         s9, t5, 639
                  andi         s1, t6, -1107
                  fdiv.s       ft6, fs5, fa2, rdn
                  and          a5, a0, zero
                  xor          s5, a2, t5
                  rem          gp, s6, s6
                  sra          a4, t6, s0
                  fdiv.s       fa5, ft7, fs3, rup
                  ori          a0, s9, 235
                  lui          s6, 924104
                  fsgnjn.s     fs3, fa1, fs0
                  divu         t3, s11, t5
                  slt          t3, s4, zero
                  nop
                  nop
                  slti         zero, s5, 1657
                  slti         s4, s7, 923
                  sll          gp, a1, a4
                  fmin.s       fs2, fs11, ft2
                  fcvt.s.w     fa5, s3
                  div          tp, t3, t0
                  slt          a0, a6, s6
                  div          s2, t0, gp
                  fcvt.s.w     ft5, a6, rtz
                  mulhsu       a1, s5, a4
                  fsub.s       fa6, fs8, ft9
                  mulhu        s2, a2, a7
                  sub          s2, s2, t6
                  mul          tp, s2, a2
                  fmul.s       fs5, fs9, fs4, rmm
                  fmv.w.x      ft9, tp
                  fmax.s       fs7, fs8, fs0
                  fclass.s     sp, ft6
                  sra          a7, sp, s10
                  fdiv.s       fa6, fa2, ft1
                  and          a3, s10, s3
                  fsub.s       fa4, fs4, fs8
                  addi         a5, s5, 208
                  slt          ra, sp, a0
                  srai         gp, a5, 28
                  slli         t1, t2, 0
                  feq.s        a2, ft9, fs2
                  slti         s1, t4, -578
                  srli         t4, s7, 7
                  mulhsu       s0, a4, s7
                  sub          tp, s10, a1
                  fmax.s       fa3, ft10, fs6
                  addi         a0, tp, 1898
                  mulhu        a3, t5, ra
                  andi         a2, sp, -511
                  sltiu        a0, s8, -100
                  fsub.s       fs10, ft2, ft7, rtz
                  divu         s9, t0, t6
                  fsgnj.s      fs4, fs6, fs6
                  fsgnjn.s     fs6, ft3, fa0
                  addi         a3, t5, -1686
                  and          sp, a5, s1
                  fsub.s       fs3, ft0, ft0
                  fmv.x.w      a2, fs3
                  fclass.s     s2, fs10
                  div          a7, s5, s10
                  srli         a7, a2, 31
                  fdiv.s       fs6, fs0, fa5
                  feq.s        t5, fa4, ft4
                  fsqrt.s      ft1, ft0
                  slli         a3, sp, 12
                  fcvt.w.s     t2, fa7
                  fmv.w.x      fs10, s9
                  fmv.w.x      ft2, t2
                  add          s10, t1, t2
                  addi         s2, s4, -836
                  add          ra, s0, s10
                  fcvt.w.s     t1, fs1
                  mul          a5, tp, s9
                  fsub.s       fs10, ft11, ft10
                  fclass.s     s0, fs0
                  sltiu        a5, s4, -140
                  fmul.s       ft5, fa5, ft7
                  andi         s8, sp, -1592
                  srai         a4, sp, 24
                  div          t3, s6, s4
                  andi         t6, s4, -1104
                  auipc        zero, 115884
                  addi         a7, a6, 1710
                  slli         s3, a3, 5
                  sltiu        t4, t2, 44
                  sub          gp, a6, a1
                  xor          tp, s4, t2
                  fsgnjx.s     ft7, ft3, fa3
                  and          t2, sp, s10
                  sub          s7, s11, ra
                  add          a5, s0, t5
                  fsub.s       ft8, ft4, ft11
                  slli         sp, s6, 25
                  fcvt.s.w     ft10, gp, rtz
                  or           t5, t3, t3
                  sltiu        s6, a2, -1444
                  slti         s7, s11, 248
                  or           a1, s6, tp
                  fmul.s       fa5, fs1, fa5, rdn
                  fsub.s       ft5, fs5, ft1, rmm
                  divu         a1, s4, t5
                  srai         t2, a0, 15
                  and          s5, a6, s1
                  mulh         s7, s4, t0
                  fadd.s       fs10, fa6, fa5
                  fmul.s       fa1, fs6, ft0, rdn
                  slli         gp, a0, 26
                  sub          gp, a1, ra
                  addi         a3, a1, -1359
                  fadd.s       ft8, ft5, ft8
                  fmv.x.w      s3, fa5
                  sra          a3, t5, s2
                  add          a0, a1, a1
                  srl          ra, s3, sp
                  sltu         s6, tp, t0
                  flt.s        t1, fs4, fa1
                  fcvt.s.w     fa3, s2
                  sub          a5, tp, s5
                  fsub.s       fs7, fs9, fs1
                  or           gp, t1, s5
                  fle.s        a1, fa1, fs7
                  sub          t1, a1, t1
                  fsub.s       fs2, ft9, ft3, rdn
                  fmax.s       fs3, ft11, fs8
                  fmul.s       ft10, ft8, fa5, rne
                  nop
                  mul          gp, s2, s10
                  slt          t3, a4, s1
                  mulh         gp, s4, gp
                  fsgnj.s      fs4, ft7, fs0
                  fadd.s       ft5, fs2, ft2
                  fmv.w.x      fs10, a5
                  mulhsu       t1, a4, gp
                  mulhu        gp, t5, s3
                  xor          ra, s10, s7
                  mulh         a0, s4, s0
                  slt          s7, s6, gp
                  fcvt.wu.s    a3, fs2, rup
                  fsub.s       ft7, fa1, fa4, rmm
                  fcvt.wu.s    s3, ft1
                  rem          s4, a6, t3
                  ori          s6, a4, 17
                  fmv.x.w      a2, ft4
                  divu         s4, tp, s2
                  fmv.w.x      ft10, a3
                  xori         zero, a5, 1831
                  slli         t4, t0, 29
                  xor          s7, a7, tp
                  slti         s6, s8, 1890
                  fmax.s       fs2, ft8, ft6
                  slti         a4, ra, 1225
                  mulh         zero, a7, gp
                  remu         a5, t1, a2
                  addi         t2, tp, 81
                  andi         a5, a1, -1576
                  and          zero, s11, t5
                  fdiv.s       ft7, fs11, fs11
                  rem          a3, s0, a7
                  fcvt.s.wu    ft6, t3, rup
                  lui          s10, 99876
                  fmv.x.w      s10, fs0
                  lui          gp, 667957
                  srli         t1, s9, 1
                  fclass.s     a0, fa4
                  xor          s4, sp, s10
                  srl          s0, s0, zero
                  sra          s5, a0, s5
                  sra          t5, s11, sp
                  mulhsu       tp, s10, s6
                  divu         s2, a0, s11
                  fsqrt.s      ft0, fs5
                  remu         t5, t6, t1
                  fsub.s       fa6, fs0, ft6
                  fmv.w.x      fs1, a5
                  fmin.s       fa3, fs9, fa3
                  fclass.s     gp, fs8
                  sltiu        a2, a4, 564
                  fsgnjx.s     ft3, ft5, fs4
                  slti         t5, s6, 2038
                  addi         a3, t3, 1184
                  add          sp, gp, a0
                  sub          s0, tp, s3
                  slti         a4, t4, -1860
                  srl          s8, a4, t2
                  nop
                  div          s1, s5, tp
                  andi         a0, s3, -1593
                  fclass.s     s9, ft4
                  fmax.s       ft0, fa3, fa6
                  fclass.s     a4, ft7
                  ori          zero, s5, 1958
                  div          s8, s1, t1
                  mul          a0, s4, a2
                  fsgnjn.s     fs6, ft4, ft3
                  sltiu        t4, a1, -1069
                  flt.s        t6, fa6, fs7
                  rem          a3, t0, s3
                  rem          t3, zero, s10
                  nop
                  fmin.s       fa5, fs8, fs1
                  sltu         a7, a1, s2
                  fdiv.s       fa0, ft10, ft2
                  ori          a2, tp, -994
                  sltiu        t6, t0, -1749
                  ori          a5, t5, 554
                  sub          s8, t4, ra
                  srai         a5, s4, 27
                  fsub.s       fa5, fs5, fs2
                  slli         sp, s6, 15
                  or           s5, a0, t0
                  srli         a3, a1, 16
                  remu         s7, sp, s1
                  flt.s        s0, fs5, fa3
                  fle.s        a2, ft6, ft8
                  mulh         a1, s9, t5
                  fcvt.wu.s    t4, ft4, rdn
                  slt          s3, s6, a0
                  sra          s8, t3, a6
                  and          s2, a5, t4
                  fcvt.s.wu    ft3, a1
                  add          s1, s3, a3
                  fcvt.w.s     s8, fa2, rmm
                  srli         zero, s0, 4
                  nop
                  slt          s8, a7, t6
                  fle.s        a5, ft7, fa2
                  add          sp, a4, a0
                  div          t2, t5, t1
                  srli         t3, gp, 8
                  fdiv.s       ft11, fs11, fs5
                  fcvt.w.s     s6, fa3
                  xori         t1, s0, 1166
                  fsgnj.s      fa0, fs5, fs2
                  fcvt.w.s     s0, fs5
                  srl          s8, s6, s5
                  div          ra, a4, ra
                  fsub.s       ft10, fa0, ft5
                  andi         zero, t5, -1934
                  div          a4, a4, gp
                  fmv.x.w      s5, fa5
                  fadd.s       fa0, fa0, ft8, rtz
                  fmv.x.w      s1, fa4
                  remu         a4, ra, sp
                  fmin.s       fs4, fs2, fa5
                  fle.s        t2, ft6, fa6
                  divu         zero, s3, s4
                  fmax.s       fs6, fs4, ft2
                  fle.s        s7, fa7, fs7
                  xor          a4, t4, t3
                  sltu         t4, t3, s7
                  mulhu        a3, ra, s11
                  and          t3, s11, t3
                  xor          s2, s8, a3
                  sltiu        s9, a0, -1241
                  fsqrt.s      fa7, fs1
                  fadd.s       fa6, ft6, fa3
                  sltu         tp, tp, s6
                  fsgnj.s      fs2, fs11, ft11
                  divu         gp, a2, t0
                  mulh         s3, a1, sp
                  feq.s        s0, ft7, ft4
                  rem          t3, a4, a1
                  feq.s        a2, fs6, fs8
                  mulhu        t4, s10, t1
                  andi         tp, s3, 1005
                  slt          a2, s11, tp
                  fmax.s       fs11, ft5, ft9
                  or           a2, s3, s3
                  sra          t1, s4, s2
                  addi         tp, t1, 948
                  fcvt.s.w     fs8, a5
                  nop
                  fdiv.s       fs1, ft7, fs9
                  auipc        a7, 330971
                  div          t5, t6, a7
                  fcvt.wu.s    s5, ft5, rdn
                  flt.s        s8, ft2, fa6
                  fadd.s       fs10, fs6, ft4, rne
                  xor          a2, s4, s9
                  andi         s6, gp, 1279
                  div          s4, a7, t2
                  sra          a3, s7, a1
                  slli         s8, a1, 12
                  fmul.s       ft1, ft4, fa4
                  sltu         t4, zero, s11
                  fmv.x.w      a3, ft0
                  sltiu        t2, s4, 1989
                  sll          s8, a6, a0
                  flt.s        gp, fs1, ft6
                  sltiu        t4, t1, 818
                  remu         a4, t5, s6
                  ori          ra, s7, -1910
                  fdiv.s       ft8, fs0, ft1
                  fsgnj.s      fa6, fa1, fs11
                  fmv.x.w      sp, fs3
                  fsub.s       ft6, fs10, ft1, rup
                  sra          a2, sp, a3
                  mulhsu       t3, sp, a0
                  fmul.s       ft0, fa7, ft3, rmm
                  fmin.s       ft3, fs1, fa1
                  fclass.s     a4, ft6
                  fclass.s     s8, fs4
                  fsgnjn.s     fs1, ft0, fs10
                  xor          t5, t6, ra
                  lui          ra, 1025769
                  slt          s8, t1, s1
                  fmv.w.x      fs9, s7
                  addi         s0, s10, -440
                  sra          s8, s6, s3
                  or           ra, a1, a0
                  flt.s        a7, fa0, fa6
                  fmax.s       fa6, fs2, ft11
                  fadd.s       fs10, fa0, fs7
                  mul          t6, t0, a5
                  fmv.x.w      s6, ft4
                  fcvt.w.s     s0, fs6
                  feq.s        a0, ft1, fa4
                  fle.s        s2, ft8, ft5
                  flt.s        t1, fs11, ft2
                  mulh         s10, s3, tp
                  fcvt.s.w     fs5, a4, rtz
                  auipc        ra, 660919
                  srli         t4, ra, 21
                  divu         a3, sp, a7
                  fsgnjx.s     ft2, ft5, ft3
                  fcvt.s.wu    fa7, a0, rmm
                  fmul.s       fs7, fs2, fa0, rup
                  andi         s8, s2, 776
                  srl          s0, s2, a5
                  fmul.s       ft0, fs0, fs6
                  feq.s        t3, fa1, ft5
                  or           sp, sp, t4
                  srl          a7, a7, a6
                  fcvt.wu.s    s8, ft0, rne
                  xor          a3, t2, tp
                  fsqrt.s      fs4, fa1, rmm
                  fmin.s       fs10, ft4, ft5
                  fsgnjn.s     fs1, fa6, fa2
                  rem          t2, s2, a4
                  xor          s0, a7, sp
                  fsqrt.s      ft1, ft6, rtz
                  div          s10, a0, t6
                  fsgnjx.s     ft8, ft11, fa1
                  fcvt.wu.s    a7, fs5, rtz
                  xori         t6, a3, -649
                  fsgnj.s      ft8, fa0, fs4
                  srai         s4, a0, 18
                  fdiv.s       fs2, fs5, fs0
                  sll          a2, t3, a7
                  sltu         s8, s4, tp
                  fmv.x.w      t1, ft8
                  fmv.x.w      tp, ft0
                  fadd.s       fa3, ft5, fs3
                  sll          s1, s3, t5
                  and          a7, t3, t1
                  slti         s7, a1, 1340
                  or           s10, t6, s5
                  sub          s9, t4, a1
                  mul          t4, a3, sp
                  slt          a3, gp, a3
                  fdiv.s       fa7, ft11, ft5, rup
                  fsgnjx.s     fs7, fa1, fa4
                  mulh         s6, s8, t3
                  remu         ra, a1, s6
                  fmul.s       fa5, fa1, fs10
                  mulh         gp, s8, tp
                  mul          t2, a3, a3
                  fcvt.w.s     s9, fs7, rup
                  div          s0, a4, ra
                  fmv.x.w      s1, fs10
                  mulh         t2, zero, t5
                  fmul.s       ft5, fs9, ft6, rtz
                  fdiv.s       fa7, ft5, fs9, rtz
                  fcvt.w.s     s3, fs8, rne
                  srai         t4, s0, 12
                  fadd.s       fa4, fs5, ft6, rmm
                  sltu         a1, a3, a4
                  and          s8, tp, t3
                  fsqrt.s      fs10, fa0
                  flt.s        t6, fs4, ft5
                  mul          tp, t3, s6
                  sub          s6, a3, gp
                  fmv.x.w      a2, ft1
                  addi         a7, t2, -216
                  srai         s2, t4, 12
                  srl          a3, s6, a2
                  srli         t6, s9, 22
                  fsqrt.s      fs7, fa3, rmm
                  add          sp, a1, a1
                  fcvt.w.s     a4, fa0
                  fsgnjx.s     ft1, fs8, fs0
                  sltiu        s7, s11, 581
                  andi         s9, s6, -210
                  sra          t5, gp, a2
                  sll          a3, s2, t4
                  divu         sp, t0, a7
                  mulhsu       s3, s0, t2
                  slli         a7, sp, 20
                  or           tp, a5, s6
                  sll          sp, gp, s7
                  addi         tp, s11, 647
                  and          t4, s3, t1
                  fsqrt.s      fa7, ft0
                  fle.s        t1, ft3, fs5
                  div          gp, s7, a2
                  mulh         a5, t3, a6
                  srl          t4, gp, a1
                  fcvt.w.s     tp, ft0
                  fmv.w.x      ft11, t3
                  flt.s        s10, fa3, fa0
                  div          sp, zero, a3
                  srai         t6, s8, 6
                  sltiu        t4, s5, -1114
                  fcvt.s.wu    fs1, a7, rdn
                  fmax.s       fa2, fa3, fa0
                  andi         t4, t1, -446
                  and          sp, s5, s2
                  fsgnjx.s     fs7, fs6, fs2
                  fsub.s       fs1, ft11, fa4, rmm
                  rem          a1, a2, a2
                  div          a5, sp, s5
                  mul          s2, a1, a5
                  fmv.w.x      fa6, t2
                  fadd.s       fs2, fa6, fa2
                  fmul.s       ft9, ft10, fa4
                  fsgnjx.s     ft2, ft11, fa4
                  mulhsu       t3, tp, a5
                  fsgnjx.s     fa2, fs2, fs4
                  lui          t5, 434765
                  fmax.s       fs11, ft0, fs11
                  xori         a7, s1, -1476
                  nop
                  xori         t2, a4, 910
                  flt.s        a5, fs8, fs4
                  sll          a2, s6, a0
                  fmin.s       ft2, ft8, ft5
                  lui          s10, 405696
                  divu         a5, a2, tp
                  xor          s1, s5, t6
                  or           t3, t2, a5
                  fcvt.wu.s    a5, ft5, rup
                  add          s7, tp, a2
                  fsub.s       fs10, fs2, fa1
                  fcvt.s.wu    fs2, s2
                  mulhsu       t5, s10, s0
                  fsub.s       fs2, fa1, fa3
                  srli         s7, s8, 13
                  sltu         a3, a5, s1
                  ori          t4, s6, -39
                  xor          t3, a2, a6
                  fcvt.wu.s    ra, ft10
                  slt          a1, t4, a1
                  andi         tp, s4, 445
                  nop
                  sltiu        t3, sp, -869
                  slti         t1, s7, 1218
                  fmv.w.x      fa6, a1
                  slli         ra, t0, 8
                  srl          sp, t2, a3
                  fsgnjx.s     fs1, ft9, ft5
                  fcvt.w.s     t6, fs1
                  remu         gp, a1, a3
                  fcvt.s.w     fa2, a0
                  ori          s1, s3, -502
                  and          s8, a1, a3
                  sltiu        s6, s3, -1948
                  addi         s7, s2, -981
                  mul          a3, gp, t5
                  ori          a1, gp, -181
                  sltiu        a4, a7, 1034
                  and          s10, s4, s2
                  sll          s2, a6, s6
                  andi         s6, s11, -128
                  nop
                  mulhsu       s4, s3, s8
                  fsgnjn.s     fs8, fs10, fa4
                  fcvt.w.s     a3, fa0
                  xori         t4, a3, 559
                  or           a4, gp, s11
                  srl          a1, s10, s6
                  sltiu        a5, s5, -1484
                  lui          sp, 263183
                  lui          t5, 759502
                  xori         ra, zero, 1848
                  fsgnjn.s     fs4, fa0, fa7
                  sra          s3, s11, s11
                  feq.s        sp, fs0, fs1
                  srli         t4, s2, 27
                  sll          t3, zero, tp
                  fsqrt.s      fa0, fa2, rne
                  or           a1, ra, s4
                  fle.s        s5, ft11, ft5
                  sra          zero, t3, a3
                  fcvt.w.s     t5, fs4, rne
                  fsqrt.s      ft2, fs7
                  rem          a7, s7, s0
                  fmax.s       ft4, fa7, fs5
                  srli         t4, s3, 5
                  divu         s0, s0, s0
                  ori          gp, a6, 1182
                  or           a0, a1, a3
                  or           s0, s2, tp
                  fclass.s     a5, fa4
                  slti         a3, zero, -1405
                  fmv.x.w      s9, fs9
                  fcvt.wu.s    s7, ft5, rmm
                  fsgnj.s      ft8, ft2, fa1
                  and          a3, s10, t2
                  srai         t5, s11, 15
                  divu         zero, s4, gp
                  mulhsu       t3, sp, zero
                  srl          s8, zero, t5
                  fsgnjn.s     ft10, ft0, fa0
                  slli         a7, gp, 6
                  srli         t6, a4, 6
                  ori          s4, t0, 1043
                  nop
                  srli         a7, s4, 29
                  addi         gp, s4, 1208
                  srl          s5, a0, a0
                  slt          s5, zero, sp
                  flt.s        tp, fa4, fa7
                  add          a4, ra, t0
                  div          a2, s6, a1
                  or           t5, t3, t6
                  sub          s5, s5, a6
                  mul          gp, s5, s9
                  mulhu        s2, a4, t3
                  sltu         s4, a7, a0
                  fclass.s     s4, fs7
                  fsgnjn.s     fa0, fs6, ft7
                  fmv.w.x      fs3, s6
                  fcvt.s.wu    ft9, tp
                  fclass.s     s1, fs2
                  andi         s4, s2, -997
                  fcvt.s.w     ft5, a5, rmm
                  fcvt.w.s     s4, fs6, rmm
                  fmv.w.x      fa5, s10
                  fsgnjn.s     fa0, ft10, ft5
                  andi         s1, a1, -1989
                  mulh         t3, s3, gp
                  xori         ra, s1, 1294
                  sll          t3, ra, s9
                  feq.s        s8, fs3, fa4
                  div          a4, gp, a0
                  fdiv.s       ft1, fa1, fs7, rdn
                  fcvt.s.wu    ft7, a1, rmm
                  srli         sp, t2, 29
                  and          s5, s3, a1
                  auipc        a7, 920224
                  fle.s        a2, fa3, fs4
                  xori         s6, s8, -1886
                  xori         s5, sp, -625
                  sltu         s0, s2, s0
                  fdiv.s       fs3, ft8, fs9, rdn
                  slt          sp, a5, a2
                  sltu         s1, s0, t1
                  srai         s5, sp, 27
                  flt.s        a2, fs8, fa4
                  fsgnjx.s     ft6, fa5, ft2
                  addi         t5, a7, -57
                  fsub.s       fs2, ft11, ft0
                  ori          s7, ra, 500
                  fmv.w.x      fs11, s5
                  feq.s        t4, fs3, fa4
                  lui          ra, 488096
                  fsqrt.s      ft11, ft6
                  feq.s        t4, ft1, fs9
                  rem          t1, t0, a7
                  fcvt.s.w     ft8, ra, rdn
                  fcvt.s.wu    ft1, a5
                  sltu         s9, s7, s1
                  mulhu        t3, s3, s2
                  auipc        s2, 537525
                  sra          s8, t6, tp
                  andi         t3, t0, 1869
                  fsub.s       ft7, fa7, fs6
                  lui          t4, 766769
                  slti         t5, tp, -170
                  ori          t2, s4, 556
                  mulh         a3, s3, s9
                  sltu         t6, t2, a5
                  feq.s        t1, fa2, ft8
                  lui          s6, 866836
                  feq.s        s4, fs10, fs0
                  mulhu        s5, s8, a3
                  fsqrt.s      fs0, fa7, rmm
                  mulhu        t3, t1, t6
                  auipc        s5, 1022903
                  xor          tp, s9, a3
                  mulhu        s1, s6, s8
                  fsgnjx.s     ft0, fs10, fa0
                  fmv.w.x      fs0, sp
                  and          t6, t4, s9
                  fmv.x.w      ra, fs9
                  fclass.s     t6, ft6
                  nop
                  fsub.s       ft4, fa0, fs1, rtz
                  sra          a5, t1, s10
                  andi         gp, s9, -1679
                  ori          s4, a2, -201
                  fcvt.wu.s    s2, fs4
                  fcvt.s.w     ft0, a7
                  fmv.x.w      s10, fa6
                  fsgnjn.s     fs1, ft1, fs1
                  remu         tp, t6, t4
                  srl          t2, a1, s5
                  flt.s        a2, fs6, fs11
                  fsgnjn.s     ft11, fs0, fa2
                  and          s5, t1, a0
                  fmul.s       fs2, fs6, fa6, rdn
                  sub          a0, sp, gp
                  flt.s        a7, fs4, fs6
                  remu         s4, s1, s6
                  addi         t2, s8, 1992
                  addi         a7, ra, 1945
                  xori         s0, zero, 1052
                  fmv.w.x      fs2, s4
                  fcvt.s.wu    fa4, s0, rup
                  slli         zero, a6, 14
                  srl          s9, a7, a1
                  sltu         s2, ra, s7
                  fsgnjx.s     fs1, ft5, fa3
                  fdiv.s       ft5, fs3, fa0
                  fmin.s       fs5, ft4, ft5
                  mul          ra, t0, s4
                  sra          zero, sp, a1
                  fsgnjx.s     fs10, ft5, ft9
                  sltu         s0, a2, tp
                  fmax.s       ft2, fs0, fs4
                  feq.s        ra, fs2, ft9
                  div          t6, s8, t0
                  sll          sp, t1, t3
                  mulhsu       s2, a3, a6
                  xor          a1, s3, s7
                  add          t1, s11, sp
                  xori         tp, s7, -1492
                  sra          a5, a3, gp
                  div          t5, zero, sp
                  fclass.s     gp, ft4
                  fcvt.w.s     s2, fs8
                  fle.s        s4, ft11, fa3
                  slti         s2, ra, -1489
                  fmax.s       ft2, ft7, ft1
                  sltiu        a5, a0, -1432
                  and          a4, s8, s7
                  fcvt.w.s     a4, fs4
                  ori          t3, s7, 1608
                  mulhu        s9, a6, s10
                  fcvt.wu.s    t1, ft5, rdn
                  sltu         s0, tp, a4
                  fsgnjx.s     fs8, fs7, fs3
                  slli         s5, s9, 23
                  xor          sp, s9, s0
                  mulhu        s6, a5, s5
                  mulh         t6, t6, a7
                  fdiv.s       ft6, ft2, fs6
                  and          sp, a7, s3
                  fcvt.s.wu    fs4, s5
                  andi         s9, s7, 193
                  divu         zero, s6, s10
                  feq.s        s6, ft6, fs1
                  fmv.x.w      a3, ft3
                  sltu         a4, t5, s5
                  srli         s1, tp, 0
                  auipc        s0, 1002102
                  remu         t2, t4, a5
                  slli         a4, s9, 21
                  fmv.x.w      t6, fa4
                  srai         s2, s10, 22
                  sub          s10, a2, s2
                  fsgnjx.s     ft5, ft8, fs9
                  fsgnjn.s     fa5, fs9, fs2
                  div          t3, gp, s2
                  sra          zero, s5, t5
                  fmax.s       fa5, ft1, ft9
                  mulhu        t2, a0, s6
                  feq.s        t2, fs11, fa4
                  fcvt.w.s     s4, fs9, rmm
                  fdiv.s       fs5, fs10, ft3, rup
                  divu         a1, zero, s0
                  flt.s        t1, fa6, ft3
                  mulhsu       s8, a4, t1
                  xori         s10, s6, 68
                  add          s0, t0, a4
                  srai         a7, s2, 26
                  nop
                  srli         t4, t2, 28
                  slti         ra, s3, -173
                  add          gp, tp, gp
                  mulhu        s7, s7, s4
                  slli         s2, a1, 15
                  divu         a2, t1, t1
                  remu         t4, s1, t4
                  mulh         t3, s4, tp
                  mulh         ra, s4, ra
                  mulhsu       t2, a0, s5
                  fcvt.s.wu    ft9, zero
                  fsgnjx.s     fs6, ft3, fs1
                  fcvt.s.w     fa6, a4, rup
                  mul          s5, s0, t0
                  and          s7, s10, t0
                  sll          s7, s8, s9
                  fsgnjn.s     fs10, ft3, ft0
                  feq.s        s5, ft3, fs5
                  or           s9, s10, zero
                  rem          t3, s0, a4
                  sll          s9, a6, s10
                  mulhu        s9, s10, a0
                  sra          t2, t4, t1
                  flt.s        sp, fa1, fs9
                  fclass.s     tp, fs10
                  sltu         s1, a2, a2
                  fadd.s       ft1, ft10, fs11, rne
                  xor          s5, ra, s6
                  fsgnj.s      fs1, fs1, fa1
                  fcvt.s.w     fs9, t4, rne
                  andi         a5, s0, 92
                  xori         s1, a7, -971
                  auipc        t1, 795528
                  flt.s        s4, ft7, ft9
                  auipc        s10, 838577
                  xor          s2, s8, s5
                  fcvt.s.wu    fs2, t0, rne
                  fcvt.w.s     a7, ft10
                  fcvt.w.s     s9, fs10
                  mulh         t6, s4, tp
                  rem          s4, t1, t1
                  mul          t2, t1, t3
                  fcvt.wu.s    s9, fs9
                  slli         s0, t2, 10
                  add          t1, t0, a1
                  feq.s        t6, fs5, fa6
                  sltu         a7, t5, s1
                  fmv.x.w      tp, ft0
                  fcvt.s.wu    ft8, s9, rmm
                  xori         sp, s0, -397
                  fle.s        t6, fs9, fs1
                  xori         s8, t0, -1058
                  fmv.w.x      fa1, tp
                  div          s2, t6, t4
                  xori         t1, a5, 504
                  addi         t5, s6, -714
                  andi         t6, a1, -1558
                  fmv.w.x      fs1, zero
                  fcvt.w.s     tp, ft8, rup
                  fsgnjn.s     fs6, fs1, fs10
                  srl          ra, zero, sp
                  xor          t5, s11, s7
                  fmin.s       fs0, fa6, fs6
                  addi         a5, a7, 1371
                  srl          t5, s0, s8
                  div          t2, a6, s11
                  fadd.s       fs11, ft7, fa5
                  andi         zero, a4, -382
                  fclass.s     gp, fs3
                  fsgnjn.s     fa0, ft10, fs11
                  srai         a1, s8, 28
                  nop
                  fmin.s       fa2, ft10, fs3
                  mulh         a1, t6, s8
                  and          a3, tp, a7
                  feq.s        tp, fs11, fa4
                  sll          a4, a2, s11
                  fcvt.s.w     fs0, t2, rdn
                  remu         s9, s6, sp
                  sub          s10, s10, t4
                  fsqrt.s      fs2, fa1
                  fle.s        s2, fa4, ft3
                  fsqrt.s      ft11, ft2
                  sltu         a3, t6, s1
                  divu         t5, s0, s10
                  auipc        s5, 721025
                  sra          gp, t3, s9
                  srai         s0, a0, 6
                  fcvt.wu.s    a3, fa0, rmm
                  fsub.s       ft6, fa5, ft8
                  fmul.s       ft0, fa5, ft9
                  fcvt.s.wu    fs8, t1, rdn
                  fsqrt.s      fa3, ft7, rne
                  fsqrt.s      fa7, fs9
                  and          gp, a7, s4
                  ori          s0, s10, -62
                  nop
                  fmax.s       ft2, ft7, ft5
                  or           a5, a3, s6
                  fadd.s       fs10, fa7, ft9
                  rem          a3, a5, s8
                  fmv.x.w      a3, ft0
                  sub          a0, sp, s4
                  mul          a4, a1, tp
                  fdiv.s       fs10, fa2, ft6, rne
                  fcvt.wu.s    a0, fa3, rtz
                  fsub.s       ft3, fs7, ft0, rmm
                  fsgnj.s      fa5, fs11, ft3
                  fcvt.wu.s    gp, ft10, rne
                  mulh         s2, a5, zero
                  xor          s8, s10, t5
                  remu         s1, a4, a0
                  sltiu        t6, s4, -1598
                  mulhsu       s2, s10, t1
                  srai         a2, gp, 22
                  sltu         t5, s8, s9
                  xori         s1, a7, 1680
                  flt.s        a0, fs10, fs3
                  fmin.s       fa0, ft2, fa2
                  fmin.s       fs11, fs5, fs6
                  andi         a4, s6, -2006
                  slt          a4, s4, t2
                  fdiv.s       fs1, fs3, ft11
                  feq.s        tp, fa2, fa3
                  div          s7, zero, s9
                  fsgnj.s      fs3, fa0, ft0
                  auipc        s8, 965597
                  fle.s        a5, fs0, ft6
                  fcvt.s.w     ft4, t6, rmm
                  fadd.s       fs7, ft0, fa4
                  mulh         t4, a7, sp
                  rem          s0, t3, s9
                  fsgnjx.s     ft4, ft11, fs6
                  flt.s        t4, fa2, ft2
                  and          t4, t3, tp
                  feq.s        a2, fa6, ft0
                  fmin.s       ft2, ft0, ft0
                  fmin.s       fa2, ft6, ft4
                  lui          zero, 757365
                  mul          zero, zero, s4
                  sub          ra, s9, s5
                  fmv.x.w      s2, fs1
                  ori          ra, zero, 1571
                  fcvt.s.w     ft11, gp
                  addi         t2, a7, -1676
                  slli         s8, a4, 30
                  sub          s4, ra, a5
                  fsgnj.s      fa2, fa7, fs6
                  mulhsu       s10, t1, a3
                  slt          ra, s2, s10
                  fcvt.s.w     fa3, t1, rmm
                  fdiv.s       fa2, fs1, ft6, rdn
                  flt.s        s5, fa6, fs8
                  ori          t2, s7, 2042
                  or           gp, t4, a5
                  or           s0, a6, s7
                  andi         s3, ra, -615
                  nop
                  nop
                  xor          s0, s10, s6
                  nop
                  slti         s8, t4, -2046
                  fcvt.w.s     t2, ft4, rtz
                  slti         t4, t6, 2040
                  slt          ra, t1, tp
                  lui          s1, 877363
                  fmul.s       fs8, fs11, fs2, rdn
                  fsub.s       fs1, fs10, fs2, rup
                  fle.s        s9, fa7, fs7
                  sltiu        sp, t5, 1505
                  mulh         s1, zero, s5
                  fsqrt.s      fs2, fs8, rtz
                  sub          s9, t4, s9
                  addi         a4, gp, -1920
                  fcvt.wu.s    gp, ft7, rtz
                  or           s10, a6, tp
                  srl          a5, t1, a3
                  fcvt.s.w     ft6, s4
                  and          a2, s6, gp
                  andi         s4, gp, -603
                  feq.s        t1, fa7, ft10
                  fle.s        s9, ft11, ft5
                  fsgnjn.s     fs1, fa6, fs5
                  fcvt.w.s     s6, fs0
                  srai         ra, gp, 25
                  addi         zero, t4, -1802
                  xori         tp, tp, 823
                  sltu         tp, s7, s10
                  fsgnjx.s     fs1, fs4, fs7
                  sra          s9, t5, s2
                  fadd.s       ft4, ft11, ft4, rtz
                  fmv.w.x      fs10, t6
                  fmul.s       fa3, ft4, ft2
                  remu         a4, s9, t2
                  fsgnj.s      fs9, fs8, ft6
                  fle.s        t3, fs3, ft0
                  fsgnjn.s     ft0, fs11, fa3
                  mul          s8, s4, s1
                  fcvt.s.w     ft7, s11
                  divu         ra, s5, t2
                  fmul.s       ft8, fa1, ft5, rup
                  fadd.s       fs6, fa1, fs7, rne
                  fmv.w.x      fs7, s5
                  auipc        a7, 355010
                  divu         s3, s1, s0
                  srli         ra, s9, 18
                  srli         a7, s10, 11
                  fmin.s       fa7, ft10, fa2
                  remu         a5, s0, sp
                  fcvt.s.wu    fs7, t2, rtz
                  slt          s4, a6, s6
                  fsub.s       fs5, fa2, fs1
                  fsgnj.s      fa0, fs5, ft1
                  fclass.s     zero, fa3
                  feq.s        s6, fs10, ft8
                  slli         t4, a5, 25
                  flt.s        t3, fs11, ft5
                  sltiu        zero, s6, -963
                  fle.s        gp, ft10, fa1
                  add          t1, t3, t5
                  and          s10, s6, a1
                  srl          sp, a3, s8
                  or           t4, s11, a6
                  andi         s0, sp, 1929
                  fsgnjn.s     ft4, fs9, ft1
                  xori         gp, a6, 1811
                  fsgnjx.s     ft8, ft6, fs5
                  divu         t5, t5, t1
                  fmin.s       fa7, fa7, ft0
                  srl          a7, t3, tp
                  mul          t2, s10, s1
                  lui          a5, 624524
                  fdiv.s       ft3, ft1, fa6, rtz
                  addi         s10, s1, 834
                  mulhu        t6, s6, t3
                  fmv.x.w      tp, fs9
                  ori          s1, tp, 1803
                  fcvt.w.s     s6, ft9, rdn
                  sltu         s7, s10, s5
                  feq.s        sp, ft6, fs11
                  fle.s        t5, ft1, ft3
                  mulh         t4, sp, t1
                  fcvt.wu.s    a2, fs2, rtz
                  fcvt.s.w     ft9, ra
                  fmax.s       fa4, fa6, fs10
                  fmv.x.w      t3, ft6
                  fmax.s       fs10, fa6, ft10
                  feq.s        s3, fa5, ft2
                  fcvt.s.wu    ft10, a5, rup
                  lui          gp, 312882
                  fcvt.s.wu    fs7, s0
                  slti         t1, s4, 718
                  slti         a7, a5, 1911
                  mulhu        s9, t5, tp
                  fsgnjn.s     fa6, fa5, ft8
                  mulhsu       t6, tp, s2
                  rem          t5, s2, t3
                  slt          s3, s1, s7
                  sra          s10, s5, a1
                  mul          t5, s5, s11
                  mulhu        t6, s3, s1
                  fclass.s     s7, ft5
                  rem          sp, t3, a7
                  srli         a1, sp, 20
                  fcvt.s.w     fs4, s7
                  fmv.w.x      fs4, gp
                  mulhu        a7, t1, t6
                  andi         s4, t4, 1976
                  mulh         ra, a6, t3
                  mulh         s0, sp, a7
                  add          t5, s7, s6
                  fsgnjx.s     fa1, fs5, fs11
                  fclass.s     a3, fa2
                  fcvt.w.s     s6, ft2
                  fsgnj.s      ft11, ft9, ft3
                  xor          s7, a7, t3
                  mulhu        t2, t2, s2
                  fle.s        a3, ft10, fa1
                  fmv.x.w      a2, fa7
                  sra          t3, t3, a1
                  addi         t6, s6, -576
                  slt          a2, zero, s6
                  xor          a5, t2, ra
                  fsgnjx.s     fa0, fs4, ft8
                  fsub.s       fa3, fa1, fs10
                  flt.s        a3, ft8, ft8
                  fcvt.wu.s    ra, fs2, rne
                  fadd.s       ft9, fs0, fs7
                  sltu         zero, t1, a1
                  remu         s9, t2, sp
                  fmin.s       ft9, ft9, ft7
                  fadd.s       fa0, ft4, fa4
                  and          t1, a2, a6
                  fclass.s     s5, fa7
                  sltiu        a0, a5, 1655
                  slti         s5, a4, -752
                  fsgnjx.s     ft11, fs0, fa1
                  fadd.s       fa2, ft2, ft9
                  remu         gp, s7, a3
                  auipc        a1, 543226
                  divu         t2, a1, a7
                  fcvt.wu.s    s4, ft4, rdn
                  fsgnjx.s     fa7, fs11, fa6
                  div          s2, a2, ra
                  nop
                  lui          a3, 809787
                  and          sp, s1, zero
                  divu         s7, s2, t3
                  mulhsu       t6, a1, t5
                  andi         s8, s9, -1244
                  fadd.s       fa4, fs10, fs5
                  sub          sp, a0, s5
                  fsub.s       ft8, fs2, fa7
                  sub          a2, a0, s3
                  fsub.s       fa3, fs0, fs9, rtz
                  sltu         gp, s7, t1
                  and          t5, t2, t5
                  mulhsu       ra, t1, t4
                  fsgnjx.s     fa1, fs7, fs11
                  fmv.w.x      ft8, a4
                  rem          a1, t6, t0
                  rem          t2, s9, a7
                  add          s6, s1, a0
                  fadd.s       ft10, ft10, fs7, rne
                  sra          a1, a3, tp
                  slt          s10, t1, a3
                  fsub.s       fa3, ft7, fs5
                  fsqrt.s      ft4, ft11
                  div          t1, s4, zero
                  fmv.w.x      fs2, t4
                  fclass.s     t2, ft3
                  div          t6, t2, a7
                  fmv.x.w      t5, ft10
                  fsgnj.s      fs8, ft7, ft9
                  feq.s        s7, fa2, ft10
                  auipc        a3, 535181
                  fmin.s       fs1, fs6, fs10
                  fdiv.s       ft4, fa7, fs9
                  slli         a3, a0, 7
                  auipc        s9, 534038
                  sltu         a2, a2, s7
                  slli         t1, tp, 14
                  fcvt.w.s     s8, fs1
                  andi         a2, s8, 1504
                  mulh         s10, a7, t5
                  srl          a3, a3, a1
                  slli         s8, sp, 10
                  flt.s        sp, fs10, fs11
                  fsgnjx.s     ft7, fa4, fa1
                  rem          s5, s10, a2
                  and          s1, s1, a3
                  mulhu        t6, a1, s9
                  and          s1, s3, s9
                  andi         s7, a6, -1652
                  fsgnjx.s     ft1, fs5, ft11
                  mulhsu       s2, t3, ra
                  add          a4, ra, a6
                  rem          s1, s8, s7
                  sll          t6, s9, a2
                  fadd.s       fa6, ft6, ft9
                  sra          s5, t5, a3
                  div          s4, a4, a5
                  lui          tp, 47338
                  ori          s2, s4, 1822
                  and          ra, ra, t4
                  fsgnjx.s     fs5, fa2, ft6
                  srl          s3, t6, t1
                  sltu         a5, s11, t1
                  srl          t4, a0, t6
                  fsgnjx.s     fs5, fa3, fa0
                  fdiv.s       fs8, fs3, fa7, rne
                  rem          tp, a6, s1
                  fsub.s       ft3, ft1, ft10
                  srl          zero, s11, zero
                  mul          s4, a5, s4
                  mulhu        ra, tp, a5
                  sra          s9, a3, s0
                  mulh         t5, s2, t5
                  addi         s7, t0, 1993
                  auipc        a1, 235934
                  lui          s10, 975062
                  srai         t3, sp, 26
                  andi         a7, a5, 1960
                  xor          t2, t5, s7
                  fadd.s       fa0, ft4, fs5
                  fclass.s     gp, ft3
                  fclass.s     t3, fs6
                  xori         ra, s2, 1159
                  addi         t4, s3, 1507
                  rem          a0, s3, a2
                  srli         s6, a5, 11
                  slti         t2, a4, 357
                  fmv.x.w      s1, ft0
                  and          a2, a4, t6
                  mulhu        s10, t2, s11
                  fcvt.s.w     fs4, t4
                  fsub.s       fs4, fs7, fs5, rdn
                  mulhsu       a2, t1, a5
                  feq.s        sp, fa0, fa2
                  lui          sp, 316032
                  flt.s        s8, ft6, fs2
                  mulhu        t4, t1, tp
                  sltiu        s0, a7, -767
                  or           a4, ra, a1
                  sltu         t6, t3, s1
                  sltiu        ra, t6, 272
                  xor          a2, s7, s1
                  addi         s5, s9, -578
                  sltiu        a5, t5, 895
                  mul          s0, gp, s3
                  sltu         s4, s7, a6
                  srai         t2, a4, 19
                  srli         ra, s9, 9
                  fsqrt.s      fa7, fs9, rmm
                  mulhsu       s5, t1, zero
                  fclass.s     gp, ft6
                  fsgnjn.s     fa4, fs8, fa1
                  fmv.w.x      fs6, a0
                  fcvt.s.w     fa0, s5, rmm
                  mul          tp, t4, s3
                  auipc        a4, 835521
                  mulh         s2, zero, s3
                  and          t2, t6, s9
                  fcvt.s.wu    ft2, s7
                  fcvt.wu.s    s8, ft4, rtz
                  fcvt.s.w     ft6, s2, rne
                  fcvt.w.s     t4, fs2
                  fsgnj.s      ft5, fs6, fs10
                  fcvt.s.w     fs0, s3, rne
                  srli         s4, s11, 14
                  sltiu        sp, ra, -2020
                  sra          a3, a5, sp
                  xori         s5, a7, 1267
                  mulh         tp, s4, s2
                  fcvt.wu.s    ra, ft4, rdn
                  fcvt.s.wu    ft7, s11, rdn
                  flt.s        s7, fs1, fs6
                  srli         s6, zero, 12
                  fadd.s       fs2, fs2, ft0, rtz
                  sltiu        s8, s2, 306
                  addi         s2, s7, 1005
                  sll          gp, a2, a0
                  srli         t4, s2, 4
                  slt          s4, t4, s11
                  srai         s1, sp, 9
                  nop
                  remu         s9, s7, a3
                  fcvt.w.s     sp, fs0, rne
                  fsgnj.s      ft6, ft7, ft11
                  fadd.s       fa6, ft2, fs6, rdn
                  div          a1, gp, a2
                  fsub.s       ft2, fs10, ft8, rdn
                  fle.s        a5, fa0, ft11
                  fsgnjx.s     fs3, ft10, fs10
                  rem          a1, s1, a1
                  auipc        tp, 483923
                  slli         zero, s7, 24
                  mulhsu       t6, a2, s5
                  fclass.s     zero, fs0
                  fcvt.wu.s    s0, fa4
                  feq.s        t2, ft8, fa4
                  divu         zero, a7, a0
                  slli         s8, s0, 3
                  fsgnjx.s     fs9, fs7, fs2
                  fsqrt.s      fa7, fa2, rup
                  remu         s3, a0, s0
                  xor          t5, s1, t0
                  sltu         a2, a6, t5
                  lui          sp, 561518
                  fcvt.s.w     fa6, sp, rtz
                  flt.s        zero, fs5, ft10
                  fcvt.s.wu    ft3, s1, rdn
                  mulh         s10, s0, s9
                  sra          gp, ra, s6
                  fclass.s     s2, fs4
                  addi         s6, t4, 1917
                  fsgnj.s      ft6, fs9, ft3
                  fmax.s       fs1, ft6, fs1
                  fsqrt.s      ft1, fs5
                  slt          s9, a3, a0
                  ori          s7, a5, 1934
                  mulhu        s3, s7, s11
                  fadd.s       fa1, fa1, ft4
                  mulhu        t1, s11, t4
                  and          a0, s10, t2
                  fmul.s       fs9, fs7, fa1
                  feq.s        s0, ft11, ft11
                  or           a2, s5, s7
                  mulhsu       t6, s11, s4
                  auipc        s3, 174698
                  nop
                  mulhu        a5, s1, s9
                  feq.s        s1, fs10, fs8
                  or           s6, sp, s11
                  fmax.s       fs6, ft3, fs7
                  sltiu        t4, t4, -1285
                  ori          a7, tp, -208
                  or           a2, a4, s6
                  feq.s        a0, fs9, fs5
                  fdiv.s       fa6, ft10, ft0, rup
                  fadd.s       fa5, fs5, fa4
                  rem          s1, t6, s0
                  remu         s2, a5, s2
                  fclass.s     s2, ft0
                  fcvt.s.w     ft0, s0, rdn
                  srli         a2, s10, 20
                  fadd.s       fa0, fs3, ft8, rmm
                  sltiu        a2, tp, 713
                  fmul.s       fs1, ft5, fs1, rup
                  xor          t2, a7, s5
                  addi         a2, a2, 940
                  auipc        t6, 735247
                  fmax.s       fa7, fs5, fs6
                  fcvt.wu.s    s7, ft0, rup
                  xori         zero, t6, 665
                  rem          s3, a6, s7
                  sltiu        zero, ra, 1358
                  sltiu        a0, tp, 1463
                  mulh         s0, t1, s2
                  srl          s2, t3, s10
                  mul          s3, a1, a7
                  fdiv.s       fs8, ft1, fs2
                  sra          a4, a3, t5
                  srl          s2, gp, a3
                  fle.s        a0, fs11, fa4
                  fcvt.s.w     fs7, s4
                  srl          s8, a2, s1
                  sltu         t6, t2, s0
                  rem          t1, t2, a6
                  mulh         a2, t3, s9
                  fdiv.s       ft11, fs2, fa1
                  xori         t4, a1, -699
                  srl          s0, s9, t2
                  andi         zero, a0, -1996
                  slti         s5, s7, 221
                  lui          a1, 351762
                  fle.s        a3, ft5, fs6
                  fcvt.s.wu    ft11, s8, rne
                  rem          s7, a0, a7
                  fcvt.s.w     fs6, sp
                  feq.s        a1, ft1, fs4
                  xor          t3, a4, s3
                  fmv.w.x      ft6, t2
                  remu         s2, a6, s5
                  fdiv.s       fs9, fs5, ft11
                  auipc        a2, 481596
                  mul          s4, tp, s11
                  fcvt.w.s     t6, fa6, rdn
                  sltu         t5, a0, t2
                  srl          t4, s6, s3
                  fsgnjx.s     fs5, ft10, fa2
                  fsgnjn.s     ft0, fa5, fs4
                  auipc        zero, 313353
                  fcvt.wu.s    s5, fa6, rtz
                  sra          s0, s1, s5
                  fsgnj.s      fa1, fa1, fa5
                  xori         t3, a6, -944
                  lui          a2, 1021369
                  xori         a2, a2, 1787
                  div          s5, s6, a2
                  lui          ra, 144430
                  slti         s0, t6, 597
                  srai         t5, t1, 17
                  remu         a2, t4, s10
                  xori         t5, t6, 1146
                  xori         s9, zero, -46
                  slti         a2, s4, -258
                  fmv.x.w      t1, ft5
                  slli         s10, gp, 20
                  and          zero, a6, s1
                  slli         t3, s0, 15
                  and          gp, a2, s8
                  sll          zero, s2, s1
                  auipc        zero, 1003518
                  fsqrt.s      ft10, fs4
                  lui          zero, 156409
                  auipc        t6, 341857
                  xor          a3, a5, s8
                  fmv.w.x      fs9, s5
                  fmv.x.w      s7, fs6
                  fcvt.w.s     a4, fs9, rup
                  xor          t4, t3, t4
                  fmv.x.w      t3, ft6
                  and          t4, t6, a0
                  flt.s        s6, fs2, fa3
                  fcvt.wu.s    a5, fs9
                  add          a4, t0, s2
                  fsqrt.s      fa5, ft7, rne
                  fsgnjn.s     fa4, ft5, ft5
                  and          t2, t2, t3
                  fmax.s       fs10, ft9, ft10
                  fsgnjx.s     fs8, fs6, fa6
                  remu         s7, zero, s6
                  slti         a1, s7, -1134
                  xori         s1, t6, -1497
                  srai         a2, s8, 1
                  fle.s        t6, ft6, ft4
                  mul          s1, s0, s0
                  srl          s9, zero, s8
                  fadd.s       fs5, fs0, ft10, rne
                  fclass.s     a0, fs0
                  srl          ra, ra, s4
                  slli         t1, a1, 19
                  sltu         s10, tp, s1
                  srli         a5, ra, 25
                  auipc        sp, 893570
                  fcvt.s.wu    ft9, s8, rtz
                  mulh         t4, a6, t0
                  fsub.s       ft1, ft9, fs11, rup
                  lui          a0, 310545
                  addi         a7, s1, -707
                  fmv.x.w      ra, fs11
                  addi         s1, s10, -1682
                  fcvt.w.s     t4, ft10
                  fcvt.w.s     s0, ft3, rtz
                  xor          s3, t5, s9
                  fclass.s     t4, fa3
                  fcvt.w.s     s9, fa5, rup
                  srli         s5, tp, 13
                  lui          sp, 360278
                  mulh         s2, t3, t0
                  div          tp, a4, a3
                  fcvt.wu.s    s8, ft8, rup
                  fcvt.s.w     fa3, t4, rup
                  sub          s10, s9, ra
                  remu         s8, s0, t2
                  fsgnj.s      fa6, fa5, fs10
                  or           s7, s3, t5
                  fsgnj.s      fa2, fs10, fa2
                  mul          zero, s0, s3
                  xori         a4, s5, 1693
                  fle.s        s8, fa3, fs9
                  fsgnj.s      fs7, fa6, ft8
                  mul          s10, s9, t1
                  xori         s6, a4, 2034
                  srli         t2, a4, 5
                  fle.s        t2, fa4, ft11
                  fsgnj.s      fs2, fs4, fa5
                  fcvt.s.w     fa5, a6, rdn
                  mulhsu       s2, a7, sp
                  fmax.s       fa1, fa6, ft11
                  nop
                  remu         a0, t1, t4
                  srli         t1, s1, 19
                  srai         s9, s0, 0
                  add          zero, s0, a1
                  sub          t2, s3, a0
                  sra          t6, t2, tp
                  fmax.s       fs11, fs8, fs8
                  mulhsu       t3, gp, t5
                  fcvt.w.s     sp, ft0
                  and          t3, gp, a3
                  sll          s8, a0, a6
                  fadd.s       ft6, fs6, fs9, rtz
                  and          a2, s3, a2
                  sltiu        a2, ra, 1296
                  xor          t3, s6, t4
                  xori         s0, tp, -1763
                  and          ra, s3, s5
                  xori         a2, t4, -1517
                  remu         s5, s2, s6
                  xor          s7, s3, a0
                  sub          sp, s8, gp
                  fmin.s       fa5, ft7, ft3
                  slt          s1, zero, tp
                  xori         s0, t5, 1556
                  ori          a4, zero, -930
                  lui          s1, 411527
                  fmin.s       ft3, ft9, fa2
                  fsgnjn.s     fs2, ft8, ft7
                  fmin.s       fs3, fs4, fs4
                  addi         s0, s0, -1324
                  and          s2, gp, s1
                  fmax.s       fa1, ft11, fs8
                  and          s5, s9, s11
                  and          a7, s11, s9
                  fsub.s       fa2, ft10, ft8
                  fmax.s       fa7, fa3, fs10
                  fsub.s       fs1, ft10, fa5, rtz
                  rem          a7, t5, s1
                  auipc        sp, 966295
                  fmul.s       ft10, fs7, ft11, rdn
                  mulhu        s0, a2, a7
                  srli         s2, a6, 15
                  fadd.s       fs1, fs2, ft4, rtz
                  slt          a2, t3, a3
                  fmv.w.x      fs10, s7
                  slti         t1, a0, 532
                  lui          ra, 522949
                  srl          a5, s2, a4
                  fsgnjn.s     ft8, fa2, fs10
                  fcvt.s.w     ft9, t5
                  divu         a3, a5, s6
                  fmin.s       ft0, fs6, ft5
                  srl          s5, t0, s3
                  fmin.s       ft2, ft0, fa3
                  sltu         tp, t2, gp
                  divu         s2, t5, a3
                  ori          t4, t1, -1327
                  xori         t6, a2, -833
                  div          sp, a1, a7
                  auipc        s8, 800676
                  fsgnjn.s     ft4, fa4, fs4
                  div          t1, t3, gp
                  addi         s2, s7, 989
                  slli         a0, s0, 10
                  lui          s1, 131502
                  slli         t1, s10, 2
                  ori          s5, s6, 812
                  slti         gp, a5, 522
                  rem          s2, a5, t6
                  remu         a5, a7, zero
                  flt.s        zero, fa3, ft5
                  sltu         a7, t6, zero
                  fle.s        s9, fs5, ft1
                  fcvt.s.wu    fs7, gp
                  auipc        s2, 343973
                  nop
                  mulhu        s4, t1, a7
                  feq.s        t6, ft1, fa7
                  andi         sp, s6, -830
                  slti         s9, s8, 1291
                  remu         a5, s3, s11
                  fadd.s       fs0, fs0, fa6
                  mulhsu       tp, a2, tp
                  mul          s6, tp, ra
                  slti         a4, gp, -16
                  rem          s3, s8, tp
                  divu         sp, s0, t3
                  xori         s10, a2, -190
                  fsgnj.s      fa4, ft8, fa2
                  rem          t1, tp, t6
                  nop
                  fdiv.s       fs11, fa4, fa5
                  fmv.x.w      a2, fs7
                  srai         s4, a1, 19
                  flt.s        a3, fs4, ft9
                  fclass.s     t6, ft6
                  fmv.x.w      a4, fs4
                  sub          s0, s6, a4
                  rem          a3, s2, a7
                  fmin.s       ft8, fs9, ft11
                  fcvt.s.wu    fs8, a3
                  sltiu        a5, s7, 1412
                  ori          s2, tp, -2039
                  fcvt.w.s     t6, fs6, rdn
                  divu         s7, a5, gp
                  fcvt.wu.s    a5, fa5
                  andi         ra, t3, -1086
                  nop
                  and          s9, sp, a3
                  fcvt.w.s     tp, ft5, rdn
                  srai         t2, s3, 11
                  srli         zero, t2, 19
                  fcvt.s.wu    ft8, s6
                  nop
                  fmul.s       fs6, ft0, ft9
                  auipc        s2, 524900
                  srli         sp, s10, 15
                  rem          a2, sp, a3
                  fcvt.s.wu    fa2, a0, rdn
                  fle.s        tp, fa7, fs10
                  rem          s8, t6, t5
                  xori         a0, s11, 546
                  fcvt.w.s     t2, fa4
                  xori         s10, t1, 469
                  sub          a0, s8, s9
                  fle.s        gp, ft0, ft1
                  divu         s8, a6, s8
                  fdiv.s       fs5, fs8, fs7
                  fadd.s       fs7, fs9, fa4
                  srl          s2, s2, tp
                  addi         ra, s1, -85
                  mulhu        a2, ra, t3
                  rem          a2, t5, s1
                  fmax.s       ft6, fa1, ft7
                  addi         tp, a5, 959
                  flt.s        a0, fs11, fs2
                  and          s4, a6, s8
                  fle.s        gp, ft1, fs5
                  divu         a0, s11, s7
                  fcvt.wu.s    a2, ft7
                  fmv.x.w      s9, fs8
                  remu         tp, s3, s8
                  fle.s        a4, fs7, ft4
                  divu         t5, a2, a7
                  fsgnjn.s     ft1, fs9, ft6
                  fsgnj.s      fa6, fs10, fs5
                  fmul.s       fs11, fs5, fs6
                  mulh         a2, a7, a1
                  fmin.s       ft3, ft7, fs2
                  fsqrt.s      fa2, ft10, rtz
                  fmv.x.w      s1, fa1
                  fsgnjx.s     ft3, fa4, fs2
                  mulhsu       s4, ra, s3
                  sltiu        s3, t1, -777
                  ori          a5, a6, 678
                  sra          gp, s10, gp
                  sltu         t4, s0, s5
                  fdiv.s       fs2, fa5, fa5, rmm
                  sra          s4, sp, s9
                  feq.s        s2, fa4, fa5
                  fsgnj.s      fa2, ft10, ft1
                  fmul.s       fa4, fa7, fs7
                  fsqrt.s      ft3, ft10
                  fadd.s       fs9, fs0, ft0, rdn
                  fdiv.s       fs10, fs3, fs11
                  mul          t3, t5, s9
                  sub          s0, tp, a3
                  fmul.s       fs2, fs10, fs6, rdn
                  fmax.s       ft9, fs2, fa4
                  srl          a4, t0, sp
                  sltu         s8, a4, a5
                  or           gp, zero, s11
                  mulhsu       a5, ra, t0
                  fsgnjx.s     fa2, fs5, ft11
                  fmv.x.w      t1, fs7
                  div          s7, t4, ra
                  mulh         s9, s3, s0
                  mulhsu       t1, s11, a2
                  xori         a3, s10, -148
                  fadd.s       fa4, ft8, fs0
                  fsqrt.s      fs1, ft9
                  fsqrt.s      fs6, fa3
                  addi         sp, a3, 1003
                  add          s4, t6, t5
                  fcvt.s.wu    fs11, s9, rtz
                  srli         a5, t2, 8
                  mulhu        t1, gp, t6
                  srl          a4, gp, s6
                  or           a2, s1, s1
                  rem          sp, s7, t2
                  fcvt.wu.s    s0, fs2, rdn
                  ori          a7, s4, -452
                  ori          a5, s3, -569
                  fsgnjn.s     fa7, ft8, ft1
                  slt          a3, s11, s10
                  add          a3, s9, t0
                  and          zero, t4, s7
                  xori         a3, a1, -268
                  fmv.x.w      s4, ft2
                  fcvt.s.wu    ft11, a6, rmm
                  div          s6, a2, s7
                  sltiu        s9, a3, 1633
                  ori          s5, t1, 582
                  sra          t6, s1, t4
                  fmax.s       ft0, fa5, ft0
                  fsgnjx.s     ft8, fs10, ft2
                  add          s6, tp, s6
                  srl          t5, t4, s1
                  fle.s        s0, fs4, fa0
                  mulhu        s4, gp, t2
                  nop
                  fmul.s       fa4, fa2, fs4, rup
                  sltu         s0, t6, s9
                  mulhu        t1, a1, a0
                  addi         t4, t6, 1784
                  fcvt.s.wu    fs5, a6
                  slli         a0, a4, 2
                  sll          sp, s4, s9
                  fsgnj.s      fs10, fs2, fa3
                  fsgnjn.s     fa0, fs0, fa3
                  srl          s9, t6, s6
                  flt.s        s8, fs9, fs1
                  fmv.w.x      ft3, a1
                  mulhsu       zero, tp, t4
                  mulhu        a4, a6, a2
                  fcvt.w.s     gp, fs10, rdn
                  sll          t5, a7, s4
                  srai         a0, a5, 0
                  fmul.s       fs7, ft5, fs4
                  sub          zero, t0, a7
                  feq.s        s10, fs4, fs4
                  andi         t4, zero, 1154
                  fdiv.s       ft9, ft4, fs11, rup
                  lui          s8, 659783
                  srai         s0, s2, 28
                  fsgnjx.s     fa4, fs10, fa5
                  fsub.s       fs11, ft11, fa0
                  fsgnjn.s     fs11, fs1, fa0
                  fmv.x.w      sp, fs5
                  fmv.w.x      fs9, sp
                  fadd.s       ft8, ft11, fs1, rne
                  divu         s4, gp, s2
                  fadd.s       ft8, ft5, fa4
                  nop
                  srl          s10, s4, t0
                  fcvt.wu.s    a1, fs4, rne
                  fmv.w.x      fs1, s9
                  slti         t5, s7, 377
                  fsgnj.s      ft0, fa1, ft9
                  slt          s2, s8, s9
                  add          t5, s9, ra
                  slti         s0, s11, -94
                  fsub.s       fs1, fa2, ft7, rmm
                  or           s2, a1, s4
                  nop
                  fmv.x.w      t3, fs11
                  fmax.s       fs5, ft11, ft1
                  addi         s5, gp, 1756
                  fcvt.w.s     s2, fa5
                  auipc        s3, 745626
                  srli         a2, t2, 1
                  fsgnjx.s     fa6, fa6, fa1
                  and          s2, t6, a0
                  mulhsu       s4, gp, t5
                  fmv.x.w      s8, fa4
                  fcvt.s.w     fs7, t1, rup
                  fcvt.s.w     ft1, s0
                  fcvt.s.wu    fa3, a1
                  fmul.s       ft2, fs10, fa5
                  divu         t1, sp, zero
                  fle.s        a5, ft9, fs5
                  xor          a3, s9, t4
                  flt.s        s7, fa0, fa6
                  sltu         s9, t4, s10
                  mul          t2, tp, a1
                  lui          zero, 304087
                  fle.s        a2, fs5, fs3
                  fmax.s       fa5, ft7, fa5
                  andi         s0, s7, -419
                  fsgnjn.s     fs9, fs4, fs9
                  remu         a3, s3, s11
                  fmax.s       fs7, fa3, fs3
                  add          a3, zero, s6
                  sltiu        s3, a2, -1379
                  fclass.s     a0, fs8
                  ori          s5, s2, 1260
                  sll          a2, t1, a2
                  fmin.s       ft2, fs2, ft7
                  sra          tp, t5, s0
                  feq.s        t2, ft8, fs5
                  fsqrt.s      ft11, ft9
                  auipc        t2, 199923
                  fmin.s       fs2, fs9, fs4
                  fsgnjx.s     ft1, fs5, fa7
                  div          a2, s5, a5
                  fcvt.wu.s    t6, fs0
                  auipc        s1, 184811
                  divu         t4, s11, gp
                  fadd.s       fa5, fa1, fs11, rmm
                  fsgnjx.s     fs7, fa7, fs3
                  fcvt.w.s     ra, fa7
                  srl          s1, a2, s1
                  auipc        t4, 560578
                  sll          a2, gp, s2
                  slt          s6, ra, t0
                  fsgnjn.s     fs2, fs5, fs0
                  remu         t3, s6, t2
                  fmax.s       fs1, fa0, ft6
                  fclass.s     s7, ft3
                  fdiv.s       fs4, ft11, fs7, rup
                  fmv.w.x      fs1, a2
                  mulhsu       t1, a7, zero
                  srli         a7, ra, 27
                  fsub.s       fs6, fs1, fs8, rmm
                  feq.s        a0, fa7, ft3
                  lui          s10, 185430
                  div          s10, a1, s6
                  mulh         s6, s8, t6
                  sub          s1, s3, s3
                  xori         s1, a2, -1360
                  mulh         s9, s4, s5
                  mulhsu       a0, s2, t1
                  rem          ra, t4, t2
                  fcvt.wu.s    s1, fa6, rtz
                  fcvt.w.s     a7, fs0, rne
                  fsub.s       ft8, fa1, fa1
                  slt          s6, s6, s1
                  sltiu        t2, a0, 1619
                  fle.s        a5, fs7, fs10
                  srli         t6, s2, 13
                  fadd.s       ft1, fa1, fs0, rmm
                  fclass.s     s10, fs9
                  fcvt.w.s     s0, ft0
                  fmv.w.x      fs2, a0
                  slti         s2, a4, -1520
                  sltiu        s8, s10, 587
                  and          s10, t3, s5
                  mulhu        a3, s11, t1
                  fcvt.s.wu    fs2, s1
                  fsgnjx.s     fs8, fa3, fs11
                  fsgnjx.s     ft8, ft11, ft7
                  fcvt.w.s     t5, ft3
                  fsub.s       fs0, fs5, ft6, rmm
                  and          a2, s4, a1
                  fclass.s     t2, fs10
                  lui          s7, 162061
                  fcvt.s.w     ft7, s4
                  fcvt.s.w     fs1, t6, rtz
                  sub          s10, a6, s2
                  slli         s9, s7, 9
                  mulh         a7, t6, a0
                  xori         s1, gp, -692
                  divu         t2, a6, s9
                  fcvt.s.w     fs0, t2, rmm
                  or           s2, s3, s8
                  srl          zero, gp, a2
                  fle.s        a0, fa0, ft3
                  slli         zero, s11, 3
                  ori          s6, t0, 1230
                  rem          t2, a4, s7
                  fsgnjx.s     fs9, ft6, fa1
                  fsqrt.s      fs3, fa6
                  sltu         s0, s8, a5
                  fcvt.w.s     zero, fa3
                  flt.s        s8, fs1, fs10
                  remu         gp, a5, s5
                  fcvt.s.wu    fs4, a1, rdn
                  fmin.s       fs9, fa5, ft3
                  add          t1, a2, sp
                  div          gp, a0, a3
                  add          s4, t2, a2
                  divu         s9, s2, tp
                  mulhu        t5, a5, a3
                  divu         t3, s5, a1
                  fsgnj.s      ft9, ft5, ft4
                  slt          t2, a1, a2
                  srl          s7, t6, t3
                  srai         t4, s5, 22
                  fsgnjx.s     fs5, ft7, ft2
                  feq.s        a2, ft3, fs6
                  fadd.s       fs1, fs4, fs10, rtz
                  fclass.s     zero, ft7
                  mulhsu       zero, t2, s6
                  fcvt.s.w     fs0, s5, rmm
                  fle.s        s7, fs8, fa7
                  slli         s0, s3, 31
                  lui          tp, 64630
                  fmin.s       ft1, fs2, fs2
                  srli         zero, t6, 17
                  sll          a4, a5, s10
                  fsgnjx.s     ft0, fs5, fa1
                  sra          t4, a7, tp
                  fsqrt.s      fs7, ft9, rdn
                  or           s6, s9, a2
                  sltiu        zero, t3, -559
                  fsqrt.s      ft0, ft1, rne
                  fcvt.s.w     ft0, a4, rne
                  fmin.s       fs6, fs9, ft3
                  xori         s0, a6, -869
                  sltu         a7, s11, s4
                  fcvt.s.wu    ft5, t6, rmm
                  sll          s4, t0, s10
                  and          t6, s9, t3
                  auipc        s4, 1037346
                  slt          tp, t1, ra
                  fmv.x.w      a5, fs1
                  mul          s10, t1, s3
                  sub          a4, gp, a3
                  and          s0, t2, zero
                  sub          s6, t5, s0
                  fsub.s       ft0, fa6, fa7
                  fclass.s     t2, fs6
                  sltu         s7, t4, a2
                  nop
                  slt          t6, sp, a1
                  sltiu        a2, s4, 187
                  slli         t6, t6, 16
                  div          t5, t1, t0
                  xor          sp, a7, t1
                  mul          t5, s7, s11
                  fmv.w.x      ft11, t1
                  sltu         s0, a0, a0
                  divu         ra, s8, sp
                  fcvt.s.w     fa2, ra
                  divu         t5, a2, s1
                  fle.s        s9, fs10, ft9
                  fmv.x.w      s2, ft8
                  fmin.s       ft9, ft9, ft3
                  feq.s        a0, fs1, fs3
                  mulh         t2, s10, a5
                  fdiv.s       ft9, ft8, ft10
                  fcvt.s.wu    fa5, t1, rne
                  fadd.s       ft7, fs10, fa6, rup
                  sltu         a4, a3, s5
                  fmin.s       fs9, fs0, ft9
                  feq.s        a5, fa0, fs0
                  sll          a5, s11, s8
                  fadd.s       fs8, ft4, fa0, rne
                  fadd.s       ft2, fs4, fs11
                  fmv.x.w      s3, fa1
                  add          sp, a4, s1
                  ori          a0, ra, -141
                  divu         gp, s8, s2
                  fclass.s     tp, fs3
                  fcvt.s.wu    fs7, a5, rtz
                  sltu         t5, s1, ra
                  mulhu        s9, s2, a7
                  ori          t6, t0, -202
                  fsqrt.s      ft8, fs9, rne
                  remu         ra, s10, t0
                  fsgnjn.s     ft11, fa1, fs4
                  srli         t6, s8, 16
                  auipc        s5, 750885
                  fmv.w.x      fs0, gp
                  srli         a3, s5, 25
                  srl          a3, s2, s9
                  fle.s        s8, fa5, fs5
                  xor          a1, sp, t6
                  fcvt.s.wu    ft8, s6
                  fmv.x.w      s2, ft3
                  fmax.s       fa2, fs11, fs9
                  mul          s1, s1, a7
                  xori         t1, s6, 379
                  fmul.s       fa5, fs9, ft2
                  fmv.w.x      ft3, a5
                  srl          s8, zero, s11
                  fcvt.s.w     fs0, s6, rne
                  sltu         s1, t3, s10
                  andi         a0, gp, -146
                  fmin.s       fs2, fa3, ft7
                  flt.s        a1, fs4, ft0
                  sra          s1, a0, s5
                  fsqrt.s      fs9, fa6
                  fclass.s     t2, fa1
                  feq.s        t1, fs4, ft3
                  mulhsu       a1, s0, t4
                  sltu         zero, t4, a3
                  andi         a2, s11, -1611
                  fle.s        a2, fa4, fa1
                  or           t3, a4, s11
                  slli         t5, s4, 27
                  srai         s2, s2, 17
                  fadd.s       fa2, fs8, fa0, rne
                  xor          zero, t2, sp
                  fsqrt.s      fa3, fa4
                  srli         tp, s11, 11
                  slli         s7, t2, 10
                  fsgnjx.s     ft7, ft9, ft7
                  fcvt.s.wu    fs10, t2, rdn
                  fsub.s       fa7, ft6, fs8
                  mulhsu       zero, s9, s11
                  fsgnj.s      fs5, fa1, ft9
                  divu         a3, t4, a6
                  fadd.s       ft4, fs1, fa7
                  feq.s        s4, fs10, fa2
                  xori         a4, s3, 1536
                  fsgnjx.s     fs11, fs7, fs2
                  or           s5, a4, s9
                  remu         s5, s5, t3
                  auipc        s8, 379044
                  slti         s7, a5, -1840
                  feq.s        s5, ft11, fs1
                  flt.s        ra, fs6, fa6
                  lui          a2, 493034
                  lui          s0, 289707
                  or           a2, t5, s7
                  fle.s        a2, fs2, ft6
                  fadd.s       ft3, ft2, ft0, rtz
                  addi         t6, s2, -322
                  sll          a3, s9, gp
                  flt.s        a3, ft5, ft11
                  fcvt.wu.s    t2, ft4
                  rem          a2, gp, t2
                  add          gp, t2, a2
                  sltiu        a7, a5, 1831
                  and          s0, s7, a4
                  mulhsu       s1, sp, a1
                  fmv.w.x      ft6, a6
                  sra          a0, a6, a4
                  fcvt.s.w     fs6, s11
                  fclass.s     s6, fa4
                  fmax.s       fs4, ft11, ft1
                  addi         s7, s1, 405
                  rem          a1, t0, gp
                  div          s5, a6, t3
                  and          a7, t5, s4
                  fadd.s       fs10, fs4, ft6
                  addi         s5, a2, -16
                  sll          ra, s3, gp
                  andi         s3, s6, 1396
                  fmul.s       fs9, fs9, fs10, rup
                  sll          s9, s10, tp
                  srl          zero, s0, a1
                  srl          s4, t3, zero
                  divu         s6, s9, a1
                  lui          t3, 321334
                  nop
                  xor          s8, t3, a0
                  fdiv.s       ft9, fs6, ft11
                  remu         s7, s11, a7
                  fsgnjn.s     fa0, fs3, fs9
                  flt.s        s8, fs1, fs2
                  mulhu        ra, s3, a5
                  fle.s        s8, fa4, fa1
                  flt.s        t3, fs8, fs7
                  fmv.w.x      fa1, a0
                  sra          t6, a5, s3
                  fle.s        a1, fs6, fa5
                  fmv.x.w      sp, fa5
                  fsgnjn.s     fs8, fa7, fa2
                  fmul.s       fa2, fs9, ft11
                  fdiv.s       fa0, ft10, fs9
                  mulh         t6, a0, s11
                  fmv.x.w      s0, ft1
                  div          s1, t4, s4
                  fsgnjn.s     fs5, ft2, fs5
                  mulh         t3, s3, s7
                  andi         a3, a1, 44
                  feq.s        ra, fs10, fs4
                  slti         a4, s11, -1102
                  ori          t4, a4, -1984
                  fsgnj.s      ft6, fa4, ft10
                  fclass.s     gp, fs1
                  div          a1, a0, tp
                  fcvt.w.s     zero, fa5
                  fle.s        t6, ft8, fs6
                  fcvt.w.s     t3, ft7, rup
                  fclass.s     t4, fs9
                  fsgnjx.s     fs6, ft7, fs3
                  fle.s        a4, fs3, fa4
                  sltu         t6, a5, s10
                  slt          t2, a0, s3
                  mulhsu       s2, tp, s10
                  sltiu        s7, t2, 612
                  ori          a1, s6, 346
                  fmv.x.w      t5, ft4
                  fsgnjx.s     ft1, fs7, ft9
                  fadd.s       fs5, ft2, fs6
                  srl          a7, t3, s7
                  flt.s        t3, ft2, ft1
                  add          s0, a4, t0
                  fcvt.s.w     ft8, a1
                  sub          zero, tp, a4
                  fdiv.s       fa7, fs7, fa6
                  sltiu        a3, a0, 491
                  sltiu        s7, t0, 2024
                  feq.s        s2, fs4, ft6
                  sll          s5, ra, a3
                  flt.s        t6, fs5, ft10
                  flt.s        t3, ft5, fs2
                  fle.s        t6, fs10, fa0
                  fmv.x.w      s8, fs1
                  sltu         a3, s3, a1
                  fsqrt.s      fa1, ft1
                  fsgnjx.s     ft11, fs7, ft9
                  fsqrt.s      fa1, fs4
                  andi         t1, t6, -1621
                  add          tp, s4, zero
                  fdiv.s       fs1, fs10, fs5
                  fmul.s       fa1, ft8, ft2
                  srl          a1, s8, tp
                  fadd.s       fs10, ft2, ft11, rne
                  mulhu        a2, s2, s5
                  divu         t2, t3, zero
                  mulhu        a2, t3, sp
                  auipc        s10, 379798
                  auipc        s10, 27626
                  srli         a4, t1, 12
                  and          zero, t4, s2
                  fsgnj.s      ft2, ft4, ft0
                  sltiu        a5, a7, -1237
                  fmin.s       fs4, fs1, ft2
                  fsub.s       fa6, fa2, ft1
                  auipc        a5, 997089
                  lui          sp, 531044
                  fadd.s       fa5, fs5, ft8
                  fmv.x.w      t1, ft0
                  divu         gp, t2, a7
                  srli         a4, gp, 11
                  slli         s7, t2, 17
                  srli         zero, t3, 6
                  fle.s        s7, ft11, fa3
                  xor          a0, t2, s2
                  srli         s7, s0, 15
                  slt          t5, s2, s0
                  slt          a0, s11, t6
                  or           a7, t5, t3
                  nop
                  lui          gp, 845987
                  mulhsu       t4, t2, t5
                  fmv.x.w      zero, ft9
                  sub          zero, s5, s6
                  slti         t4, t4, -477
                  slti         s2, gp, 528
                  fclass.s     sp, fa5
                  and          s2, s6, t2
                  mulhsu       s0, t1, a2
                  fclass.s     t1, fa6
                  sra          t1, s11, s1
                  fsub.s       fa3, fa3, ft7, rdn
                  srai         s5, a1, 10
                  fmv.w.x      fa4, s3
                  auipc        zero, 270199
                  fcvt.wu.s    ra, fs4, rdn
                  fcvt.s.wu    ft4, s0
                  fcvt.w.s     t6, fs3, rne
                  fmax.s       fa0, fs5, ft11
                  addi         a7, tp, 1487
                  addi         a5, s1, -530
                  slli         a3, a4, 4
                  lui          s10, 712333
                  fsub.s       fa3, ft8, fa1, rtz
                  xor          gp, zero, s9
                  srai         t6, s3, 12
                  fadd.s       fa0, ft2, fa7, rne
                  xori         gp, s4, 487
                  nop
                  xori         a3, t6, -780
                  sub          t1, tp, zero
                  slli         t2, tp, 13
                  fmin.s       ft7, ft9, fs10
                  sltiu        a5, t0, -637
                  add          s6, s2, sp
                  fmul.s       fa1, fs3, fs0
                  mulhu        a2, s9, t0
                  fadd.s       ft11, fs9, fs11
                  lui          s9, 615439
                  div          a2, s6, a7
                  fsqrt.s      fa6, ft2
                  lui          gp, 377229
                  fsgnj.s      fa4, fa5, ft11
                  fcvt.s.w     ft0, s11
                  srai         s0, a6, 2
                  div          a7, a7, t6
                  fmv.x.w      t4, fs8
                  addi         s4, a7, 177
                  ori          tp, s0, -2007
                  sltiu        s8, s11, -1578
                  mulh         a4, a1, s0
                  fsgnjx.s     fa7, fs0, ft1
                  mulhu        t1, t3, ra
                  lui          s3, 222202
                  or           gp, a6, zero
                  srli         tp, t4, 29
                  xor          s7, t0, s3
                  srl          a1, a5, a6
                  nop
                  lui          s4, 686368
                  ori          a2, a6, 1153
                  or           sp, s3, a6
                  fle.s        s3, fs3, fs2
                  add          s5, s9, ra
                  slti         s10, s7, -1250
                  slt          a2, s5, s7
                  fmin.s       fs5, fs4, fa2
                  fmv.x.w      s8, fs10
                  slti         t2, s1, -2008
                  fsub.s       ft10, ft4, fs10, rne
                  rem          a3, a7, a3
                  sltiu        a7, tp, -610
                  mulhsu       s1, t0, a6
                  xori         a7, ra, 1081
                  sra          zero, a1, s10
                  sub          s7, ra, t2
                  add          t3, a1, s10
                  remu         a1, t5, a4
                  mulh         s3, s6, s5
                  flt.s        a0, fs0, ft5
                  srai         ra, a6, 29
                  fmv.x.w      t3, ft0
                  ori          s9, s4, 1729
                  fsqrt.s      ft6, fs9, rup
                  slt          ra, a6, a0
                  and          a0, a6, sp
                  xor          sp, s1, tp
                  fmv.x.w      s3, fa6
                  fsqrt.s      ft7, ft10, rdn
                  fsgnjx.s     fs4, fa4, fa3
                  sltu         s0, s5, t3
                  fle.s        a4, fs9, fs3
                  mulh         s2, a4, sp
                  and          s1, s2, gp
                  lui          s8, 223500
                  remu         t1, t2, sp
                  or           s4, s5, s1
                  fcvt.s.w     fs3, s1, rtz
                  fmin.s       ft11, fs3, fa1
                  sltiu        s4, s8, -326
                  fcvt.w.s     s8, fa6, rne
                  mulhsu       s6, t3, t3
                  fcvt.s.w     fs4, a2
                  xori         s3, s4, -191
                  fcvt.wu.s    t4, ft5, rmm
                  mulhsu       a5, a3, s6
                  fcvt.s.w     ft9, sp, rne
                  xori         s1, tp, -1597
                  slli         s5, s1, 1
                  fsub.s       ft8, fa1, fa0
                  sll          t5, a1, a7
                  and          a4, t1, s2
                  fdiv.s       fs1, fs2, ft7
                  slli         s0, zero, 24
                  sra          s9, s10, s7
                  fdiv.s       fa0, fa3, fs2
                  fmv.w.x      ft6, a3
                  fadd.s       fs6, ft4, fs10, rup
                  slti         s9, s9, -1329
                  srl          a5, s0, a5
                  fcvt.s.wu    ft4, t3
                  sub          s5, s5, a4
                  fclass.s     s4, ft1
                  rem          s4, t6, a1
                  fdiv.s       fs10, fs10, fs8
                  mulh         s8, sp, s8
                  rem          t3, a7, sp
                  feq.s        t1, ft5, fs9
                  divu         sp, s4, s9
                  srai         a2, t5, 4
                  fsgnjx.s     fs11, ft5, ft4
                  srai         s1, a0, 24
                  feq.s        s7, fs0, fs1
                  fcvt.wu.s    t6, fs6
                  sll          a1, t4, tp
                  mul          t1, s5, s9
                  mulhsu       gp, a6, s7
                  ori          ra, s5, -1051
                  nop
                  andi         tp, ra, -1179
                  fsqrt.s      fs4, ft8, rtz
                  addi         s1, a6, 53
                  fsgnjx.s     fa5, fs6, fa1
                  slli         s8, t1, 6
                  addi         tp, tp, -217
                  mul          a4, s10, s8
                  srl          s10, a7, t5
                  xor          a7, s9, s3
                  fsub.s       ft6, fs3, fa6, rtz
                  rem          s2, s6, t3
                  mulhu        zero, s0, s2
                  slti         tp, a1, -1821
                  fmax.s       fa4, fs8, ft3
                  fmv.x.w      a4, fa5
                  add          a3, t6, gp
                  remu         s5, s8, t6
                  feq.s        s6, fa3, fs11
                  fcvt.wu.s    t4, ft0, rne
                  srli         gp, t1, 28
                  fsgnj.s      ft8, fs4, fs11
                  fmul.s       fs6, fs2, ft4
                  fdiv.s       fs9, ft9, ft2
                  sub          t5, a3, s11
                  fcvt.s.w     ft11, s0, rup
                  flt.s        a1, fs6, ft7
                  sll          zero, a0, a3
                  lui          s9, 580683
                  sra          s7, s4, ra
                  slti         a7, t0, -1504
                  slt          s5, s10, a0
                  fadd.s       fa3, ft6, ft9, rmm
                  xori         t4, gp, 1694
                  add          s0, a7, t1
                  rem          s1, a1, sp
                  mul          t5, t2, s1
                  fcvt.w.s     t4, fs6, rmm
                  nop
                  rem          t5, a5, s7
                  flt.s        s6, ft1, fs7
                  slli         s10, t6, 11
                  div          s6, t2, t0
                  fmul.s       ft9, fs3, fs4
                  sub          a0, a4, s5
                  fcvt.s.w     ft4, ra
                  fmv.w.x      fs9, t3
                  xori         s0, tp, -1407
                  fadd.s       fs3, fs3, fa1
                  auipc        s5, 32931
                  slt          tp, t0, t5
                  slli         a4, a2, 1
                  fmul.s       ft9, fs4, fa7
                  sra          s2, s0, s9
                  and          a4, a7, s1
                  fsub.s       ft8, ft10, fa5
                  mul          a4, a2, zero
                  fdiv.s       ft8, ft6, ft8
                  and          s0, a7, t6
                  sltu         s3, gp, t4
                  lui          t6, 362768
                  mul          a7, t4, s11
                  mulh         ra, a6, s2
                  fmin.s       ft8, fa4, ft1
                  mulhsu       s8, a7, t1
                  ori          s7, s3, -441
                  rem          a4, t1, s5
                  fsqrt.s      ft2, ft11
                  mul          s9, a7, s7
                  andi         s3, t4, -1304
                  or           a3, a5, s10
                  mulhu        s2, t0, s11
                  slli         ra, a6, 29
                  mul          a7, a4, a6
                  fle.s        t4, fa5, ft11
                  sra          t1, t1, t6
                  auipc        s1, 951238
                  fdiv.s       fa1, ft4, ft3
                  fsgnjn.s     ft5, fa6, ft10
                  mulhu        s2, a5, zero
                  srl          a4, t2, s3
                  mulhsu       t1, t1, t0
                  fmul.s       fs8, fs10, fs1
                  fmv.x.w      s6, fs10
                  sltiu        gp, t1, -1814
                  fdiv.s       ft7, fs4, fa1, rdn
                  mulhu        s5, s11, t6
                  fsqrt.s      ft5, ft10
                  divu         a0, s5, zero
                  fcvt.s.wu    ft3, s0, rdn
                  div          tp, s1, t4
                  or           a1, t6, s3
                  fsqrt.s      fa3, fa3
                  fsgnjx.s     fs9, ft3, fs5
                  lui          s3, 826835
                  fle.s        ra, fs9, fs10
                  srl          s8, s7, s3
                  xor          s9, s10, a7
                  fmul.s       fs9, fs5, ft8, rmm
                  fcvt.wu.s    s7, fs8
                  fadd.s       fs2, fa0, ft8
                  fclass.s     sp, ft0
                  andi         s3, s5, 1576
                  nop
                  addi         a4, t6, -221
                  feq.s        s1, ft1, ft4
                  fmul.s       fa2, fa4, ft10, rup
                  mul          ra, ra, t1
                  rem          s3, s9, t4
                  fcvt.s.wu    fs2, s0
                  feq.s        a4, fs7, ft1
                  mul          s1, s6, s3
                  or           t5, a3, a7
                  xori         s8, t2, -1536
                  sltiu        t6, t3, -239
                  fle.s        s3, fs8, ft1
                  fcvt.s.w     fa7, t4
                  addi         s9, s5, 247
                  sltiu        t1, gp, -1469
                  or           s9, t3, a4
                  sltiu        ra, s1, -1170
                  srli         a7, tp, 22
                  flt.s        s4, ft8, ft9
                  fcvt.s.w     fs11, gp
                  xor          a7, s10, a6
                  or           a7, ra, t4
                  fdiv.s       fa7, ft2, ft1
                  fdiv.s       fs5, ft11, ft6, rdn
                  fcvt.s.w     fa7, a5
                  remu         s5, gp, s1
                  fmul.s       fs2, fa4, ft10, rtz
                  fsgnj.s      fa5, ft3, ft2
                  fcvt.wu.s    t6, fa3
                  fsqrt.s      ft5, ft1, rmm
                  auipc        s3, 830539
                  fsub.s       fs5, fa4, fs9, rne
                  feq.s        t6, ft4, fs0
                  addi         a1, t6, -783
                  fmv.x.w      a2, fa6
                  fcvt.s.wu    ft5, s11
                  fmv.w.x      ft7, t2
                  mulhsu       t5, t4, s9
                  nop
                  fdiv.s       fs11, ft9, fa7
                  fcvt.w.s     a0, ft2, rdn
                  fcvt.wu.s    t6, ft11, rmm
                  sra          t2, a4, s3
                  fsgnjx.s     fs8, fs0, ft5
                  lui          t6, 1006131
                  fsgnjn.s     fs1, fa3, fs7
                  xor          s7, a7, s1
                  fsqrt.s      fa1, fa6
                  addi         s3, a7, -611
                  rem          s10, sp, s0
                  divu         a0, s11, s7
                  sltiu        t6, a1, -25
                  sltu         t3, t3, t5
                  mulhu        t2, t5, s7
                  addi         a0, t4, -1476
                  auipc        s10, 224783
                  mulh         s2, s4, t5
                  feq.s        t5, fa6, ft0
                  and          s8, s3, t1
                  fsgnj.s      ft10, fs3, fa5
                  slti         s4, a4, 700
                  fmin.s       fs2, ft0, ft8
                  srai         a5, s9, 7
                  fsgnjn.s     ft10, fa6, fa2
                  fmv.x.w      s6, fa1
                  fcvt.w.s     t2, fs4
                  fmv.x.w      a1, fs5
                  fclass.s     ra, ft2
                  slti         tp, s4, -680
                  slli         a7, s7, 14
                  sltiu        t4, s0, -476
                  fcvt.w.s     s4, fs6
                  rem          s8, tp, s5
                  fsub.s       ft11, ft10, fa7, rne
                  fcvt.w.s     s2, fa2, rup
                  srai         t3, t6, 29
                  sltu         t1, s4, s5
                  divu         s10, t3, tp
                  fle.s        s7, ft5, fa1
                  addi         s0, tp, 2001
                  rem          a0, a3, s8
                  fmin.s       ft2, fs3, ft7
                  fsgnjn.s     ft2, fs6, fs10
                  flt.s        s7, fs6, ft9
                  mulhsu       s8, t6, s3
                  mulhsu       s6, ra, s6
                  slt          sp, s5, a6
                  fsqrt.s      ft11, fs6, rup
                  fmv.w.x      ft4, t2
                  slli         a0, s9, 7
                  fle.s        zero, fa4, fs3
                  fcvt.wu.s    tp, fs10, rne
                  sub          t5, a5, s4
                  mul          a4, t6, a6
                  and          t1, a4, s0
                  divu         a3, s2, s9
                  mul          a0, t2, s9
                  slli         t2, t1, 0
                  xori         a5, t4, -176
                  fcvt.wu.s    s3, ft2, rne
                  divu         s9, s0, a7
                  fmul.s       fs11, fs10, fa5, rmm
                  fsgnj.s      fs9, fa6, fa1
                  srli         s10, a5, 29
                  sll          s2, tp, s9
                  divu         a7, sp, a4
                  fcvt.s.w     fs5, t0
                  slli         ra, s2, 16
                  fle.s        a1, ft0, ft5
                  divu         s2, s4, s3
                  addi         gp, s9, 616
                  fsgnjn.s     fs4, fa1, fa0
                  mulhu        s8, zero, s10
                  nop
                  addi         sp, s5, -1807
                  fsgnjn.s     ft1, ft9, fa5
                  sltu         s3, gp, s11
                  fsgnj.s      fa3, fs5, ft4
                  fclass.s     a7, fs0
                  fadd.s       fs4, ft5, fs11
                  addi         s0, s4, 598
                  fsgnjx.s     ft4, fs8, fs8
                  fcvt.s.wu    fs9, s0
                  fmax.s       fa6, fs5, ft0
                  lui          t4, 518342
                  fmin.s       fa6, ft1, fa3
                  sub          s7, s9, tp
                  add          t4, a0, a7
                  feq.s        a4, fs2, ft7
                  flt.s        t3, fs6, ft10
                  and          s7, sp, a0
                  sra          s0, s0, s8
                  div          ra, ra, t5
                  fmv.x.w      t4, fs6
                  fmin.s       ft6, ft7, fa0
                  srli         a3, a2, 10
                  fmin.s       fa0, fs9, fs1
                  fmax.s       fa6, ft8, ft9
                  and          s7, tp, t5
                  srl          s0, s1, zero
                  divu         s0, gp, gp
                  fmin.s       fs2, fa7, fs0
                  fadd.s       fa1, ft0, fa0, rdn
                  fle.s        tp, fa7, fs11
                  feq.s        a5, fs4, ft2
                  fsub.s       fa7, fa7, fs2
                  fsub.s       ft5, fa7, ft5
                  srl          a1, t6, t4
                  and          s10, t4, a1
                  remu         s10, zero, a2
                  fsqrt.s      fs7, fa6
                  fadd.s       ft0, fa1, fs5, rdn
                  fsgnjx.s     fa7, fs2, fs11
                  fmv.w.x      fs8, a3
                  mulh         t1, s3, a6
                  fsqrt.s      fs2, ft2
                  fcvt.s.w     ft3, s10
                  fle.s        a1, fa4, ft6
                  fcvt.s.w     fa4, s0
                  fdiv.s       fa2, ft0, fa3
                  fsgnjn.s     fs9, ft6, fs11
                  addi         t2, s4, -1990
                  fcvt.w.s     a0, fa7, rup
                  fsub.s       ft9, ft5, ft2, rne
                  fcvt.s.wu    fs8, t6
                  fcvt.s.wu    fa5, t6, rne
                  add          a4, t4, a3
                  fmin.s       fs6, fs10, fa3
                  fdiv.s       ft4, ft2, fa0, rne
                  fmv.x.w      a0, fs0
                  lui          tp, 700232
                  flt.s        t1, ft8, fs8
                  sltu         gp, s8, t4
                  fcvt.s.w     ft10, a2, rup
                  or           s5, t3, s4
                  mulhsu       tp, sp, t4
                  fclass.s     zero, fa4
                  mulh         t6, a6, t3
                  ori          s8, t5, -1473
                  and          a0, s6, a5
                  fmv.x.w      t4, fa7
                  fcvt.s.wu    fa1, a6, rup
                  xori         s2, t5, -553
                  srli         t1, s2, 7
                  ori          s8, s8, -603
                  fcvt.s.wu    fs8, t3
                  fcvt.s.w     fs3, t3
                  fclass.s     a3, fs2
                  slti         a7, sp, 2035
                  nop
                  fmin.s       ft4, fs2, fs7
                  fsqrt.s      ft11, fa0
                  flt.s        ra, fa3, fs10
                  mulhsu       t2, s6, a2
                  or           s2, t2, a5
                  nop
                  xor          t6, t1, t2
                  srli         a0, s10, 13
                  xori         gp, a5, -745
                  fcvt.wu.s    s10, fa7, rmm
                  sll          s8, s7, a3
                  srli         t2, sp, 31
                  srl          t3, s2, s6
                  remu         a1, s1, s5
                  fdiv.s       ft6, fa2, fs8, rmm
                  mulhsu       s10, a5, t5
                  fclass.s     s6, fa6
                  sltiu        tp, t6, -590
                  slt          s8, gp, gp
                  fcvt.s.wu    fs7, zero
                  srli         zero, s7, 26
                  sll          s1, a5, sp
                  slt          t1, s5, t6
                  mulhu        s2, s1, s9
                  fsgnjx.s     ft6, fa0, fa3
                  mulhu        a7, ra, t0
                  nop
                  sub          s3, tp, a0
                  fsgnj.s      ft4, fa6, fs7
                  addi         s5, s8, 1391
                  fcvt.s.w     ft2, a1, rmm
                  mul          s4, s8, s6
                  fle.s        zero, fs1, fs9
                  mulhu        a7, t3, s1
                  fsgnjx.s     ft2, fs3, ft3
                  xori         a7, s10, -1923
                  fcvt.wu.s    t1, ft9
                  remu         t5, a1, a0
                  flt.s        s3, fs0, fa1
                  fmax.s       ft10, fs10, ft11
                  mulhsu       s10, gp, t0
                  sra          a0, t1, s1
                  mul          ra, s3, gp
                  sltu         t5, s0, s11
                  fcvt.s.w     fs10, a4, rup
                  fmax.s       fs10, fa5, ft11
                  fdiv.s       fs11, fs4, fs9
                  sltu         s1, s1, s5
                  fmv.w.x      ft1, t6
                  sltiu        s2, t3, -1428
                  div          t1, s9, gp
                  addi         a7, ra, -874
                  fsgnj.s      fs3, fa7, fa4
                  fle.s        s3, ft2, fa3
                  fmul.s       fa6, fs9, ft2, rne
                  divu         s8, a3, s7
                  slli         s0, s5, 23
                  or           s8, a0, a1
                  divu         s8, tp, s2
                  nop
                  ori          t6, s7, 351
                  feq.s        s2, fa1, fa3
                  fle.s        tp, ft0, fs3
                  fadd.s       fs9, ft5, fs0
                  slt          a7, a2, s9
                  addi         s0, a4, 908
                  srl          s2, s10, s5
                  auipc        s8, 800775
                  ori          gp, t2, -1221
                  and          sp, t3, t5
                  srai         s6, s9, 9
                  div          t6, zero, s2
                  sra          s0, s5, s10
                  sub          s6, a7, t0
                  and          s1, a4, a3
                  fmv.w.x      fs4, t2
                  fsgnjx.s     fs6, fs6, fs7
                  sltu         a7, s7, a7
                  slt          a0, s10, s8
                  ori          t1, a0, 1494
                  divu         a7, t6, s11
                  sll          t2, tp, zero
                  rem          tp, gp, s6
                  feq.s        s10, ft4, fa3
                  div          s0, s1, s1
                  or           zero, s6, t3
                  slli         s5, t4, 10
                  srli         s2, s0, 18
                  fcvt.w.s     s3, ft3
                  fmul.s       fs11, ft1, fs6
                  fmv.x.w      s10, ft6
                  slti         a5, s3, 368
                  nop
                  and          s4, t5, gp
                  fcvt.wu.s    t6, ft9, rup
                  fsqrt.s      fa5, ft0
                  fmv.w.x      fs6, ra
                  fsgnjx.s     fa0, fs11, fa5
                  mul          s4, s2, a0
                  fcvt.wu.s    a5, fs4, rdn
                  srl          zero, t4, t5
                  xori         a3, s0, 1146
                  fmv.w.x      ft0, t3
                  fmin.s       fa7, ft9, ft11
                  fcvt.w.s     t1, ft0
                  add          t3, s6, a6
                  fclass.s     s3, fs0
                  and          tp, a7, t3
                  sltu         a2, gp, s9
                  fsgnjn.s     ft8, fs7, ft2
                  fcvt.wu.s    t1, ft1, rtz
                  fmax.s       ft3, fs4, fs6
                  flt.s        a4, fa4, fs0
                  rem          s1, t4, zero
                  sltu         s9, t5, t0
                  sll          s2, t5, s8
                  fcvt.s.wu    fa0, t4, rtz
                  fdiv.s       ft3, fs3, fa2
                  div          t4, a7, s0
                  fmax.s       fs9, ft1, fs7
                  fsqrt.s      fa5, fa7
                  andi         t4, s7, 1673
                  div          t2, s5, tp
                  mulhsu       s9, a2, a3
                  slli         s10, t6, 5
                  fsgnjn.s     ft6, fa1, fs8
                  fsub.s       fs10, ft2, fa4, rup
                  fmin.s       ft7, ft7, ft10
                  add          s3, a3, t4
                  ori          s2, s1, -406
                  ori          a4, t3, 564
                  flt.s        t2, fa5, fa3
                  add          tp, s0, a6
                  fdiv.s       ft4, ft11, ft10, rne
                  feq.s        sp, ft9, fa7
                  fdiv.s       ft6, fs0, fa0, rup
                  andi         s1, s5, -143
                  nop
                  fmul.s       fa1, fa2, ft10
                  fmv.x.w      tp, ft8
                  fcvt.w.s     a7, ft11, rdn
                  fadd.s       fs4, fs6, fa2, rmm
                  lui          s0, 716041
                  srai         s10, s6, 7
                  and          t2, zero, a0
                  mul          a5, s8, s7
                  srli         gp, t6, 7
                  fcvt.s.w     ft7, a4, rdn
                  div          a2, t6, s10
                  fcvt.s.wu    ft8, s0
                  divu         s2, zero, ra
                  mulhu        a4, s10, a5
                  nop
                  srl          s9, s2, t3
                  sltu         a0, s0, t5
                  mulhu        t5, tp, a0
                  sra          a2, s8, tp
                  divu         s4, s5, t0
                  add          s5, s9, t3
                  fcvt.wu.s    a5, fs1, rtz
                  fdiv.s       ft6, fa5, fa4
                  div          s5, tp, t3
                  mul          t5, s4, t4
                  slli         t6, ra, 25
                  fsqrt.s      fa7, fa3
                  remu         tp, s8, t1
                  fmv.x.w      s7, fs11
                  divu         t2, s5, a6
                  srli         s5, a7, 7
                  fcvt.s.w     fs5, gp, rne
                  fadd.s       ft6, fs6, fa0, rdn
                  mulh         s6, tp, s2
                  mulh         zero, a5, s5
                  slti         a2, t5, 1203
                  fsub.s       fs6, fs3, fs4, rmm
                  fcvt.wu.s    s10, fs3, rne
                  flt.s        a0, ft8, ft3
                  fmul.s       fs5, fs8, ft3, rdn
                  fcvt.s.w     ft10, s4, rne
                  fcvt.s.wu    fa4, tp
                  fsgnjx.s     ft10, fs0, fs0
                  feq.s        s0, ft9, fs0
                  flt.s        s4, ft2, fs8
                  slli         a7, s11, 16
                  mulh         s2, t1, s10
                  fmin.s       fs9, fs8, fa4
                  add          a1, a3, s3
                  fmul.s       ft2, fa6, fs11
                  fadd.s       fs0, fa7, ft11
                  mulhu        gp, s6, s1
                  srl          zero, a1, a2
                  srl          ra, a7, s9
                  fcvt.s.w     ft6, a0
                  xor          t1, s6, s2
                  fcvt.wu.s    a2, ft4
                  mulh         a1, s3, a2
                  remu         t2, s5, sp
                  fsub.s       fs6, fa5, fs5, rne
                  xori         s5, s5, 1512
                  mulhsu       sp, ra, t1
                  xor          zero, t0, a1
                  or           s4, s5, s11
                  srl          s0, t5, a0
                  flt.s        s3, fa4, ft10
                  ori          t6, s0, 1948
                  xori         t1, sp, 373
                  remu         a3, a1, t0
                  sub          tp, s1, s2
                  fmax.s       ft11, fs11, ft5
                  sll          a5, s10, t3
                  fsgnjx.s     fa2, fs9, ft0
                  fdiv.s       fa7, fs1, ft9, rtz
                  srai         t5, s10, 25
                  slli         a2, a4, 26
                  fcvt.s.w     fa5, s7, rne
                  sra          s4, a0, s3
                  fle.s        a1, fa2, fa1
                  sltu         a1, s1, zero
                  fdiv.s       fa2, ft9, fs11, rup
                  fdiv.s       fs9, fs9, ft11, rne
                  divu         t5, a5, t4
                  fclass.s     a0, ft1
                  fclass.s     s0, fs1
                  flt.s        t4, ft2, ft10
                  nop
                  fcvt.wu.s    s8, ft5, rmm
                  fsgnjn.s     ft6, fs11, fs0
                  div          t2, t5, t6
                  sub          s1, s2, s6
                  fle.s        s2, ft0, ft11
                  fcvt.w.s     t2, fs10, rtz
                  srai         s3, s1, 24
                  fcvt.w.s     a5, ft8, rtz
                  mulhsu       t4, t6, s7
                  fcvt.s.wu    fs1, tp, rmm
                  srai         s6, a6, 29
                  fcvt.w.s     s4, ft4
                  xori         zero, ra, 326
                  srl          s2, s4, a3
                  rem          s4, a2, s6
                  fadd.s       ft5, fs5, fs1, rne
                  slt          a2, gp, t5
                  sltu         s8, t1, t5
                  fmin.s       fs2, fs0, fs7
                  fmul.s       ft8, ft6, ft10
                  or           t5, t3, s2
                  fsgnjx.s     ft2, fa0, fa3
                  fcvt.wu.s    a7, fs4, rne
                  fle.s        s5, ft7, ft2
                  fcvt.wu.s    zero, ft11, rdn
                  fmin.s       fs10, fa1, ft2
                  addi         t2, a7, -1359
                  fsub.s       fs9, ft6, ft2
                  fmv.w.x      ft7, s2
                  fadd.s       fs1, fs0, fa4, rup
                  fcvt.wu.s    s9, fs3
                  addi         a1, t1, 1500
                  fsgnjx.s     fs11, fs8, fs4
                  mulhsu       s2, a7, ra
                  fsgnj.s      ft8, fa2, ft1
                  slli         ra, a2, 15
                  sra          s7, a0, s11
                  srli         t1, ra, 20
                  sltiu        zero, tp, -259
                  fsgnjx.s     ft10, fs1, ft6
                  nop
                  flt.s        t2, fs11, fs10
                  slti         s3, t3, 754
                  sltu         t4, a7, s6
                  addi         tp, s7, -1431
                  fsqrt.s      ft0, fs2
                  fsgnjn.s     fs9, ft3, fa7
                  fsgnjx.s     fa4, fs4, fa2
                  fmul.s       fs9, fs8, fs0
                  fmin.s       fa3, fs6, fa4
                  mulhu        tp, sp, s8
                  addi         s1, s3, 1699
                  divu         a7, a5, s7
                  fclass.s     sp, ft7
                  lui          zero, 447570
                  mulhsu       s8, a7, a5
                  sltiu        a7, gp, 1914
                  fmv.w.x      fa3, sp
                  divu         ra, a4, a6
                  xori         a1, s5, 1928
                  fsgnj.s      fs3, fs4, ft8
                  rem          sp, t0, t1
                  nop
                  fsub.s       fs8, fa0, fa1
                  srli         zero, s7, 25
                  fle.s        a0, fs3, fs9
                  fsub.s       fs2, ft8, ft11, rne
                  auipc        t1, 533100
                  fadd.s       fa5, fs1, fa3
                  rem          s2, s1, s6
                  divu         s6, a6, s1
                  addi         s4, a4, 275
                  mulhsu       a7, t1, a1
                  srai         t1, s10, 0
                  sll          t4, t1, s7
                  fcvt.wu.s    s3, ft3, rtz
                  fdiv.s       ft6, fs4, fs2
                  fclass.s     t6, ft3
                  mulhsu       s4, tp, gp
                  slt          s3, a1, a4
                  and          t6, s2, s3
                  fdiv.s       fs9, fs4, ft10, rup
                  div          ra, s2, s3
                  fsqrt.s      fa2, ft2, rtz
                  fsgnj.s      fa1, fs6, ft10
                  ori          s8, t5, -1975
                  auipc        t3, 185566
                  fdiv.s       fs8, ft9, fa4, rmm
                  mulhsu       sp, t2, zero
                  fsgnj.s      fs8, fs4, fs11
                  fdiv.s       ft11, fs7, fs9, rdn
                  ori          a4, a7, 1274
                  sra          s0, sp, s1
                  sll          s3, a3, t1
                  fcvt.wu.s    a7, ft5, rmm
                  slli         s4, zero, 20
                  fmax.s       ft0, fa6, fa4
                  fdiv.s       fa5, ft6, ft6
                  srl          zero, sp, a0
                  fdiv.s       ft7, fs7, fs5
                  auipc        s0, 687378
                  div          s10, s8, a5
                  xori         tp, s7, -1976
                  lui          gp, 813746
                  andi         zero, s2, -1093
                  auipc        t5, 1039503
                  auipc        a3, 661965
                  nop
                  fsqrt.s      ft10, ft1, rtz
                  fcvt.wu.s    t6, ft8, rdn
                  srli         tp, a6, 3
                  slli         sp, a5, 4
                  div          a0, s2, a2
                  fle.s        s8, fs4, ft10
                  mul          s5, t4, t2
                  sra          s10, t5, gp
                  srl          t5, s10, s3
                  fsgnjn.s     fs3, fa5, fa4
                  fmv.w.x      ft1, t4
                  and          a7, sp, t1
                  fcvt.wu.s    a0, fs1
                  flt.s        a3, ft8, ft2
                  fle.s        zero, ft6, fs3
                  fdiv.s       ft8, fs0, fs4
                  fsgnj.s      fs2, ft3, fs2
                  andi         t6, a4, 205
                  mulh         gp, gp, a3
                  slti         a5, s5, -1025
                  srai         s1, zero, 28
                  fdiv.s       ft3, fa7, fs4, rtz
                  sll          t2, a0, a5
                  nop
                  addi         ra, t6, -1705
                  slt          s1, s0, t0
                  fadd.s       ft1, fs9, ft10
                  fsgnj.s      ft0, ft4, ft9
                  mulh         gp, t2, t1
                  fcvt.s.wu    fs3, a5
                  fsgnj.s      ft9, ft5, fs1
                  ori          t6, a4, -1925
                  and          s3, a3, t3
                  mul          a5, a3, ra
                  divu         s8, sp, t0
                  fmv.x.w      s5, fs8
                  fmin.s       fa3, fa0, ft10
                  sub          a3, ra, a0
                  slli         a2, s10, 26
                  fmv.w.x      fs8, gp
                  addi         s9, tp, 1454
                  andi         ra, s3, -1911
                  fsub.s       fs10, fa6, fs5, rdn
                  remu         gp, ra, s0
                  xor          a7, a5, t2
                  srai         s9, a7, 5
                  and          s2, s1, s5
                  and          gp, t2, s10
                  nop
                  fmax.s       ft8, fs11, ft11
                  sltu         s3, sp, a5
                  mul          a7, sp, s9
                  flt.s        s3, ft6, ft8
                  xori         a0, zero, -844
                  mulhu        tp, a2, a1
                  slti         s7, s8, -757
                  xori         s10, a5, -1316
                  div          ra, sp, s6
                  sra          s10, s8, t3
                  sll          t5, t6, t6
                  div          s3, sp, t4
                  fmax.s       ft7, ft4, fs1
                  fmul.s       ft1, fs1, ft5
                  fsgnjn.s     ft2, fs11, fs9
                  fsgnjn.s     ft9, fs11, ft1
                  feq.s        t5, fs1, fa1
                  ori          s7, s7, 1011
                  fmv.w.x      fa5, a5
                  xori         a1, a6, 1654
                  remu         sp, t0, s3
                  fmul.s       ft5, ft4, fa1
                  auipc        tp, 31821
                  addi         s5, gp, -1562
                  srai         t3, a3, 17
                  ori          ra, t0, -394
                  fadd.s       ft9, fs9, ft7
                  fsub.s       fa3, ft9, fa2, rmm
                  or           s7, s4, a7
                  fle.s        ra, fs1, fs3
                  fsgnj.s      fa4, fa7, fa3
                  flt.s        t5, ft4, ft1
                  divu         s4, s2, t6
                  xori         s10, s3, -877
                  rem          s8, t6, ra
                  mulhu        a0, t6, a1
                  sll          a3, t5, t3
                  sll          s7, t3, s6
                  fsgnjn.s     fs5, fs9, ft1
                  fadd.s       ft2, fs5, fa0, rmm
                  mul          s3, gp, tp
                  feq.s        gp, ft1, fs3
                  fcvt.s.w     ft5, s0, rup
                  fsgnjx.s     ft5, fa7, fs1
                  fle.s        t6, fs11, fs0
                  divu         s0, t4, sp
                  remu         t1, s6, t1
                  xori         gp, a7, -1908
                  fmv.w.x      fa0, a5
                  mul          a2, t4, s8
                  fmv.w.x      ft6, zero
                  fmv.x.w      a7, fs0
                  sub          t2, ra, tp
                  fmax.s       fs0, ft1, fa2
                  xor          sp, s0, zero
                  divu         s3, a5, s4
                  rem          s8, a1, t6
                  and          tp, s11, s1
                  addi         s5, a7, -1944
                  xor          s9, t2, gp
                  mulhu        a5, s7, s9
                  fmin.s       ft3, ft10, fs3
                  fmv.w.x      ft1, a7
                  divu         zero, a1, t1
                  slli         a0, a5, 10
                  fmv.x.w      t4, fa7
                  fmv.x.w      ra, ft9
                  fcvt.s.w     ft7, s10
                  fmax.s       ft4, ft3, fa4
                  fsgnjx.s     fs2, ft1, ft3
                  rem          s4, t3, s7
                  andi         s4, zero, -1438
                  addi         s4, a2, 502
                  fclass.s     s0, fs5
                  srli         s1, a3, 22
                  remu         s4, t5, sp
                  fdiv.s       fs6, fs10, ft3
                  lui          a5, 188371
                  or           s1, s0, a3
                  fmv.w.x      fs11, s6
                  fsqrt.s      fa7, fs0
                  fmax.s       fs6, fa2, ft9
                  ori          tp, s9, -2018
                  sltu         a5, t4, s1
                  add          t5, s9, s1
                  sub          a1, t0, t5
                  fsgnjn.s     fa1, fs2, fa0
                  divu         s0, s3, t3
                  fsub.s       fs4, fa3, fa6, rdn
                  flt.s        s3, fa7, fs11
                  sub          a1, zero, s2
                  fle.s        t6, fs0, ft7
                  fclass.s     t1, ft10
                  srli         a0, tp, 8
                  sll          a2, s3, a2
                  srli         zero, t6, 23
                  slt          t4, sp, s9
                  fcvt.wu.s    t6, ft10, rup
                  fcvt.wu.s    s7, fs7, rne
                  remu         a3, t3, sp
                  auipc        s5, 739526
                  sll          s2, s6, sp
                  add          s8, s6, ra
                  remu         s6, s2, t5
                  or           sp, s6, s4
                  rem          a2, a4, s8
                  srai         t3, gp, 18
                  remu         t6, sp, t0
                  fclass.s     s0, ft8
                  fmv.w.x      fs11, a3
                  fsqrt.s      fa7, fs5
                  fsgnj.s      fa3, ft7, ft0
                  slli         t4, s4, 6
                  fsgnj.s      ft5, ft0, fa3
                  divu         t2, t0, s6
                  slti         gp, s10, -1857
                  fmin.s       fs7, fs9, fa7
                  sltu         s5, s3, s7
                  fcvt.s.wu    fs5, a5, rdn
                  fcvt.s.w     fs10, gp
                  sra          a1, s11, s0
                  fmul.s       fa0, fs3, fs4
                  srl          s6, s8, a6
                  fcvt.w.s     a2, ft0
                  mulhsu       t6, a5, s9
                  fmax.s       fs9, ft9, ft7
                  mulh         ra, t0, s3
                  mulhu        s8, s0, s1
                  div          zero, s5, s4
                  sltiu        s1, a7, -2023
                  slt          sp, s10, s3
                  sll          ra, s1, s0
                  fdiv.s       ft8, fa3, ft4, rdn
                  fadd.s       fa5, fs3, fa2, rup
                  srli         s0, t3, 9
                  fmin.s       fa3, fa5, fs8
                  and          a0, sp, a1
                  remu         gp, t2, s9
                  fcvt.w.s     s0, fs6, rmm
                  sltu         a7, a5, a3
                  slli         s0, s9, 8
                  rem          s2, s11, t6
                  mulhu        a2, t4, s1
                  flt.s        a4, ft8, fa4
                  mulh         ra, sp, zero
                  flt.s        t2, fs6, fs10
                  fle.s        a2, fs5, fa4
                  and          tp, a1, tp
                  fsqrt.s      fs7, ft6
                  fsub.s       ft3, fs2, ft7, rmm
                  feq.s        t1, ft10, ft5
                  srai         a2, a0, 5
                  fadd.s       fs0, ft2, ft1
                  mul          s8, a7, a3
                  mulh         sp, zero, s11
                  slti         s0, s4, -472
                  fmv.x.w      a0, fs9
                  rem          t1, ra, s11
                  fsgnjx.s     fa5, fs6, ft7
                  slt          t5, t5, t4
                  divu         a0, t0, s10
                  or           s9, t4, a6
                  fsqrt.s      fs10, ft9
                  sll          t6, t3, a3
                  srai         t5, tp, 4
                  flt.s        a0, fa1, fa6
                  sub          ra, s5, s5
                  mulhu        s6, gp, t1
                  fsgnj.s      fs7, ft8, fs9
                  lui          zero, 360065
                  xori         a1, s5, 645
                  div          t4, a4, s2
                  add          s10, t5, s9
                  srl          ra, s0, s9
                  slt          s8, a2, t2
                  divu         t1, t1, s6
                  mulh         s9, a7, a6
                  lui          zero, 36700
                  fsub.s       ft5, fs4, fa7
                  add          s6, s0, zero
                  mulhsu       zero, s1, gp
                  flt.s        a4, ft11, fa4
                  auipc        s7, 760180
                  flt.s        s2, fs1, ft5
                  remu         s5, gp, s10
                  fle.s        a3, ft9, fs8
                  sub          s7, s10, t1
                  fsqrt.s      fs9, ft2, rmm
                  ori          t6, s7, -1894
                  ori          sp, a2, 688
                  flt.s        a3, ft7, ft1
                  sll          a2, t1, s0
                  divu         a3, t3, zero
                  mul          tp, t6, a2
                  mulh         s6, zero, ra
                  fcvt.s.w     fa0, a7
                  fcvt.s.wu    ft6, s1
                  sll          s3, s8, s0
                  fdiv.s       fa4, ft2, ft3, rmm
                  srl          s8, t0, t0
                  fmin.s       fa4, ft9, fs4
                  xor          s7, a1, s10
                  srli         a4, s6, 27
                  srl          s0, t4, zero
                  fadd.s       fs4, fa5, ft10
                  srli         sp, t1, 1
                  sltu         s8, t0, t2
                  fsqrt.s      fa4, fa7
                  lui          s10, 843785
                  fmv.w.x      ft2, a7
                  feq.s        ra, ft11, fs1
                  fdiv.s       ft7, fa3, ft0, rmm
                  slti         gp, t2, 2030
                  ori          t4, sp, 1269
                  fsub.s       fs4, fs10, fa2, rmm
                  srai         a7, t4, 30
                  add          ra, a7, s8
                  or           a2, a1, t3
                  fcvt.s.wu    ft7, t5
                  flt.s        s1, fa5, fs4
                  fmv.w.x      fs11, a5
                  srli         sp, a2, 9
                  fcvt.s.wu    fa5, s11
                  xori         sp, gp, -2020
                  xori         t2, t0, -824
                  slti         s4, s8, 1818
                  ori          s6, t1, -937
                  fdiv.s       ft5, ft11, fa6, rtz
                  fsub.s       ft9, ft9, ft1
                  fadd.s       ft8, fa6, fs9
                  xor          a2, t1, tp
                  fsub.s       fa4, ft2, fs0, rne
                  flt.s        s3, fa6, fa4
                  fsgnj.s      ft0, ft11, fs2
                  fsqrt.s      fa3, ft4, rmm
                  srl          s0, gp, a3
                  sll          s10, tp, tp
                  mul          s10, a2, t1
                  add          s10, ra, s3
                  remu         sp, s2, a5
                  slti         sp, t1, 1925
                  mulh         a2, a4, s8
                  and          s5, s4, s3
                  xor          s7, s4, a5
                  flt.s        t2, ft7, ft1
                  remu         a2, a3, a4
                  sra          s7, zero, t2
                  fle.s        t3, fa4, ft3
                  mulhu        a5, s6, a6
                  sub          zero, a4, a1
                  slt          t5, a4, t2
                  auipc        a0, 643610
                  srli         s2, s4, 25
                  srli         s1, s11, 17
                  mul          t3, zero, ra
                  srai         a2, s9, 26
                  rem          a4, zero, tp
                  ori          t6, s11, 491
                  srli         s3, zero, 12
                  fclass.s     a5, ft5
                  sltiu        gp, t0, -1316
                  fle.s        t3, fs5, fs5
                  fcvt.wu.s    a1, fs5
                  add          t1, t1, zero
                  ori          t1, s10, 1655
                  fadd.s       ft6, fs3, ft1, rmm
                  mulh         t5, s11, sp
                  fcvt.w.s     s0, fa7
                  rem          ra, t2, a0
                  or           a0, t5, t3
                  fcvt.s.w     fs2, a7, rne
                  remu         a4, t6, s10
                  remu         s10, t5, t3
                  divu         a1, ra, ra
                  andi         t1, sp, -1819
                  slt          tp, t0, t0
                  xori         t1, sp, 293
                  sra          t6, a2, ra
                  fsgnj.s      ft4, fs11, fa1
                  fcvt.w.s     s5, fs7, rup
                  and          s1, s7, t6
                  lui          a3, 699422
                  remu         a1, zero, t4
                  mulh         s4, s2, s6
                  mulhsu       a7, s1, s6
                  nop
                  auipc        a1, 537797
                  or           t3, tp, s3
                  xor          a0, t3, s11
                  fsub.s       ft7, fs7, ft7
                  remu         s10, s10, t5
                  fle.s        sp, ft4, ft2
                  flt.s        s5, fs8, ft3
                  slti         sp, a7, 1871
                  auipc        t1, 664715
                  slt          a5, s0, t0
                  fcvt.wu.s    s4, fs4, rtz
                  fcvt.s.wu    fs4, gp
                  slt          a4, t5, t1
                  sltu         s10, s8, t0
                  fmax.s       ft9, fa1, fs2
                  mulh         s6, a2, a6
                  slli         t4, t5, 19
                  fmv.w.x      ft3, a7
                  nop
                  fcvt.s.w     ft6, s10, rmm
                  mul          a3, t5, a1
                  auipc        s10, 320927
                  sll          s6, t5, a4
                  fsgnjx.s     fa1, fa5, ft11
                  nop
                  feq.s        a3, fa7, fa0
                  lui          t3, 355760
                  fsgnjn.s     fs5, fs2, fs0
                  auipc        t2, 696505
                  fmin.s       fs0, fa3, fs9
                  srli         ra, t1, 5
                  fadd.s       ft7, fa5, fa0, rne
                  fmin.s       fs6, fa1, fs10
                  ori          a7, a0, -653
                  srli         t6, s10, 10
                  fsub.s       fs9, fa0, ft7
                  fsgnjn.s     fa0, ft3, fa7
                  fmv.x.w      s3, fa0
                  andi         s2, zero, -1424
                  lui          a0, 384874
                  andi         t4, ra, -1213
                  fcvt.wu.s    t5, ft8
                  fmv.x.w      s8, fa1
                  fmv.w.x      ft7, tp
                  xor          s6, s3, t2
                  srli         s1, s0, 9
                  addi         s2, s6, 1013
                  mulh         s8, s0, s10
                  xori         s3, a0, -1180
                  fmv.x.w      s9, fa3
                  xori         s3, a2, 549
                  slt          a1, s4, ra
                  fmv.w.x      fa5, a6
                  fsgnjn.s     fs9, ft2, fs3
                  remu         s7, zero, zero
                  fmul.s       ft8, fa6, fa7
                  fadd.s       fa7, fs6, fs0, rtz
                  fmv.w.x      ft6, s0
                  srli         s0, s4, 31
                  and          a5, s4, a2
                  nop
                  sub          s8, a4, ra
                  xori         t5, s1, -1577
                  srai         t2, t5, 3
                  feq.s        sp, fs0, ft6
                  fsgnjn.s     fa4, fs3, fs6
                  mulhsu       s2, a1, s1
                  ori          a1, a7, 314
                  slti         a0, gp, -959
                  fsgnj.s      fs8, fs3, fa0
                  ori          t6, zero, 1777
                  xori         a7, t5, -1809
                  fadd.s       fs10, fs0, ft0, rmm
                  slli         ra, s6, 30
                  fmax.s       ft10, fa0, fs9
                  sltu         zero, t3, a4
                  slt          t5, t5, ra
                  srai         s0, s3, 30
                  addi         s8, s3, 1083
                  fclass.s     t5, ft11
                  mulhu        s3, s4, s3
                  xori         t1, s3, 1048
                  fcvt.w.s     a4, ft6
                  sll          s2, a6, a0
                  fmin.s       fs9, ft1, ft3
                  fcvt.wu.s    tp, fs10, rtz
                  fadd.s       fs8, fa6, fa3
                  slti         s5, s8, 786
                  srli         ra, zero, 15
                  fmax.s       ft4, fs7, fs0
                  nop
                  mulh         t2, a4, t5
                  fcvt.w.s     s8, ft10, rne
                  remu         a3, s11, ra
                  fsgnjx.s     fs11, fs4, ft10
                  fdiv.s       fs7, fa7, fs3, rne
                  lui          a5, 255567
                  fmax.s       fa0, fa6, fs2
                  mulhu        a0, s2, t3
                  fadd.s       fs0, fs1, ft8
                  mulh         s10, s4, s3
                  xor          a4, a4, s9
                  sltu         t2, s2, s0
                  srli         t3, s2, 9
                  xor          s1, s6, tp
                  fcvt.s.w     ft6, t3, rtz
                  nop
                  fadd.s       fs10, ft10, fs11, rup
                  fclass.s     ra, ft5
                  srli         t2, ra, 10
                  fclass.s     s3, fa6
                  xor          s4, tp, a2
                  fcvt.s.w     fs2, s3, rdn
                  sll          t1, s6, a1
                  sub          a1, s5, a3
                  andi         t4, zero, -1279
                  slt          tp, s4, zero
                  feq.s        s2, ft3, fa1
                  fsqrt.s      ft8, fs5
                  fmv.x.w      t2, ft6
                  or           gp, s8, tp
                  mulhsu       a1, s6, s10
                  mulh         gp, s6, a7
                  fdiv.s       fs11, ft2, fs3, rtz
                  andi         a2, t2, 229
                  slti         s0, s3, 1537
                  fsgnjx.s     fs9, fs6, ft10
                  slt          t6, t2, s1
                  mulhsu       s5, a3, s4
                  fcvt.s.wu    fs3, s0, rup
                  add          a1, s2, s3
                  andi         s6, s6, -570
                  fmin.s       fa3, fa1, ft10
                  fsgnjn.s     fa0, fa3, ft11
                  remu         a5, t5, s3
                  mulh         a1, s3, s11
                  feq.s        t5, fa5, ft9
                  slt          t5, a0, s1
                  fcvt.wu.s    s9, fs11, rmm
                  mul          t5, a1, t5
                  fmv.w.x      ft10, s1
                  divu         s4, sp, a7
                  fsgnjn.s     fs9, ft11, fs9
                  slli         t5, tp, 27
                  fclass.s     a1, ft9
                  slli         t4, s2, 22
                  lui          t1, 716160
                  fsgnj.s      fs6, fs6, ft7
                  divu         s8, s1, a7
                  srli         a5, t3, 3
                  fmv.x.w      s8, ft4
                  sltiu        t3, a7, 1738
                  srai         s3, t5, 7
                  fcvt.s.wu    fs2, t6, rtz
                  fmax.s       fs5, ft1, ft11
                  fcvt.s.w     ft1, s6, rtz
                  div          s2, t0, a0
                  srai         t4, s11, 31
                  mulhsu       zero, a5, s8
                  sltiu        s4, a6, -1824
                  divu         gp, t6, t4
                  add          s2, a0, t3
                  sll          s4, a6, s10
                  flt.s        s3, fa3, ft3
                  feq.s        s10, ft7, fs0
                  fsqrt.s      fs7, ft10, rne
                  mulhsu       t4, t3, tp
                  or           sp, ra, s4
                  addi         s10, s4, -915
                  fmv.w.x      ft7, tp
                  fmv.x.w      a5, ft0
                  fmv.w.x      fs5, s10
                  nop
                  srai         t2, sp, 3
                  fsgnj.s      fs4, ft10, fs2
                  srli         t5, t1, 15
                  srai         tp, s8, 25
                  fcvt.w.s     s5, fa5, rdn
                  or           s3, a4, s9
                  lui          s10, 115728
                  fclass.s     a5, ft9
                  fle.s        a1, fs1, ft6
                  sub          s0, s3, a6
                  srli         a7, a2, 18
                  flt.s        a4, fs3, fs7
                  flt.s        a5, ft8, fa4
                  mulhsu       t5, zero, s8
                  fle.s        gp, ft3, fa5
                  remu         s10, t4, a7
                  fmv.x.w      s7, fa2
                  fmv.w.x      fs5, a7
                  nop
                  fsub.s       fa2, ft6, ft6
                  srli         a1, t1, 11
                  addi         s5, s4, -330
                  fadd.s       fa1, fa0, fa4, rtz
                  fmv.w.x      fs7, ra
                  or           t6, tp, t5
                  mulh         s0, s7, a7
                  divu         t2, t2, a1
                  fsgnjx.s     ft0, fs1, fs5
                  xori         a5, s8, -521
                  flt.s        a3, fs10, ft0
                  fle.s        t3, fa6, ft0
                  sltiu        gp, t1, -235
                  ori          t1, s5, -1150
                  div          t4, s9, s0
                  add          s7, sp, s9
                  remu         tp, s5, s5
                  xor          a5, s7, t6
                  fle.s        s0, ft0, fs2
                  fcvt.s.w     fa3, zero, rup
                  sll          t1, t5, s11
                  fclass.s     s0, ft10
                  mulhu        s9, a2, t0
                  srli         ra, a5, 13
                  addi         t2, a0, -277
                  and          s5, a1, t6
                  mulh         t4, t3, a2
                  xori         a0, a5, 365
                  srai         a5, a0, 6
                  fclass.s     t4, fs9
                  fle.s        s8, fa2, ft11
                  fsgnj.s      fs0, fs11, ft3
                  mulh         s3, a3, s3
                  fadd.s       fs4, ft0, fs1
                  fsgnjx.s     fs1, ft0, ft6
                  srl          a2, s6, t2
                  addi         tp, s7, 653
                  mulhsu       a1, a4, a4
                  fadd.s       ft6, fs0, fs8
                  sltiu        t3, t3, -1502
                  fcvt.w.s     a3, fs8, rmm
                  slli         sp, t1, 6
                  divu         a2, a6, a7
                  fcvt.wu.s    a1, ft1, rup
                  rem          s4, s2, a4
                  and          sp, a3, a6
                  fmin.s       fs3, ft2, fa2
                  add          s4, s11, a5
                  fsgnjn.s     ft6, ft4, ft0
                  sub          s7, gp, a4
                  and          ra, t5, t0
                  fmax.s       fs4, fa2, fa5
                  mulhu        t5, s6, a4
                  addi         zero, s9, -323
                  fsgnj.s      fs1, fs3, fa3
                  slli         t4, tp, 8
                  sltu         a3, a7, s7
                  mulh         a5, a0, a4
                  fcvt.s.w     fa5, s2
                  and          s8, a6, t6
                  feq.s        s9, fa1, fs10
                  slt          s0, s10, s1
                  sll          a0, s6, s8
                  sub          s3, s8, s7
                  mulhu        ra, s4, ra
                  sltiu        s9, a3, 800
                  lui          ra, 116086
                  sll          s5, s11, a0
                  xori         a4, s6, 2
                  andi         t5, s9, -769
                  fmax.s       fs0, fa4, fs1
                  fle.s        sp, fa0, fa7
                  fmv.w.x      ft1, t6
                  fsub.s       fs5, ft11, ft5
                  fmul.s       fa0, ft3, ft9
                  nop
                  mulhu        s6, s4, zero
                  sltiu        t4, t5, 1473
                  fclass.s     s7, ft10
                  fmv.x.w      a4, fs5
                  feq.s        s3, ft1, ft5
                  fcvt.wu.s    a4, fs7
                  rem          t3, zero, a4
                  add          t4, t6, gp
                  fle.s        t2, fa0, fs10
                  fsgnjx.s     fs6, fa5, fa2
                  fmin.s       fs4, fs5, ft2
                  fcvt.s.w     fs10, a2, rup
                  lui          a3, 626253
                  fcvt.w.s     t5, ft11, rup
                  and          s3, s2, t1
                  fcvt.wu.s    s10, fs1, rtz
                  remu         a3, a7, zero
                  divu         tp, a0, s6
                  add          t2, sp, gp
                  sltu         zero, a6, a1
                  fsgnjx.s     fs5, fs5, fs4
                  fmin.s       ft3, fs7, fs7
                  fadd.s       fa2, ft11, ft4
                  mulhu        a0, t4, a3
                  fsqrt.s      fs3, ft5, rne
                  slti         sp, t5, -1885
                  fsgnjx.s     fs8, ft1, fs2
                  sub          s1, s11, s9
                  sll          s5, t2, s7
                  add          a5, ra, t3
                  fcvt.s.w     ft7, t5
                  srai         s6, tp, 25
                  div          a1, ra, a6
                  fclass.s     a2, fs11
                  srl          s9, s8, t6
                  fsub.s       ft5, fa2, fa5, rdn
                  mulhu        a7, s10, a0
                  flt.s        gp, fs7, fa4
                  fcvt.s.w     fa6, a4
                  sra          s0, t6, a3
                  fcvt.w.s     t3, fa6
                  xor          a1, t3, s10
                  sll          s6, t1, t5
                  fle.s        zero, fs7, ft11
                  and          a7, s2, s11
                  lui          a7, 588714
                  andi         a2, a5, 151
                  or           s7, t1, a0
                  addi         t6, t1, -1131
                  fmv.w.x      ft4, s0
                  mulhsu       t3, t1, tp
                  sltu         s3, s6, ra
                  fsub.s       ft10, ft0, fs6, rmm
                  fmv.w.x      fa2, s1
                  fsgnjx.s     ft9, ft0, ft2
                  mul          a0, s9, s11
                  fsqrt.s      fs8, fs2
                  fmin.s       ft5, ft0, fs5
                  and          s5, t3, t5
                  fmax.s       ft0, fs0, fa6
                  lui          tp, 783754
                  fsgnj.s      fs5, fs11, ft2
                  fsgnjx.s     fa3, ft0, fa7
                  slli         zero, sp, 14
                  flt.s        a4, fa7, ft4
                  fmin.s       fa2, ft10, fs5
                  div          s2, a4, a5
                  sltu         a0, s0, a7
                  and          a5, sp, t5
                  mul          a4, a1, gp
                  remu         gp, t6, a7
                  xori         s4, s5, 676
                  mulh         s10, t4, s4
                  mulh         s10, s5, a4
                  flt.s        s4, fa2, ft2
                  ori          s9, a6, -105
                  xor          a7, s5, a7
                  fmv.x.w      zero, fs1
                  or           t6, a0, s2
                  fsub.s       ft8, fs6, fa1
                  sub          s9, a2, s10
                  mulhu        s5, s6, s2
                  xori         a5, s0, 98
                  divu         s9, a1, s7
                  xor          t2, s11, a2
                  fle.s        s0, fa6, ft11
                  slt          s9, a6, zero
                  andi         t6, t3, -123
                  mul          sp, a1, s4
                  fmax.s       fa5, ft7, fa4
                  slli         t2, a7, 18
                  fadd.s       fs3, ft6, ft10
                  fadd.s       fs1, fs2, fs7
                  auipc        s0, 891512
                  nop
                  mulh         s2, s7, s6
                  srli         t4, s10, 30
                  ori          s7, sp, 806
                  fsgnjn.s     fa5, ft6, fa3
                  andi         t4, t2, -928
                  andi         sp, a7, 1666
                  or           t1, s2, t3
                  rem          a5, t5, gp
                  fadd.s       fs3, fs0, fa6, rup
                  flt.s        s9, fs1, fa2
                  fmax.s       ft11, fs3, fa1
                  fadd.s       fa4, ft8, ft5, rdn
                  fsub.s       fa2, ft7, fa1
                  fcvt.w.s     t4, ft10
                  sra          a5, zero, t4
                  mulhu        s10, t2, a7
                  mul          sp, a1, s3
                  flt.s        a1, fa1, ft8
                  fsub.s       fa1, fs3, fs2
                  rem          s3, a3, t6
                  lui          s2, 564741
                  xor          s8, sp, a6
                  remu         t3, t4, s2
                  sll          a4, s1, t0
                  srl          ra, t4, t5
                  fadd.s       fs0, fa3, ft8
                  fcvt.wu.s    t1, fs2
                  or           ra, a4, t1
                  fmv.w.x      ft6, s4
                  sra          s6, a1, s0
                  or           sp, ra, s0
                  fmv.w.x      fa2, s10
                  fsgnj.s      fs8, fs1, ft3
                  div          s3, s4, t6
                  fcvt.w.s     t4, ft9, rne
                  mulhsu       s1, a1, s8
                  fsgnj.s      fs9, fa7, fs6
                  ori          s4, s5, 26
                  fsgnjx.s     ft10, fs8, ft5
                  sra          t6, s3, a0
                  xor          t6, s9, a2
                  feq.s        t4, fa5, ft1
                  fmax.s       fa2, fa0, ft1
                  sltu         a0, a1, s11
                  fmv.x.w      a5, ft7
                  nop
                  srli         a2, s2, 8
                  mulh         t2, sp, t2
                  srli         tp, a2, 13
                  xori         gp, sp, 822
                  fclass.s     zero, fs10
                  sltiu        a4, s4, -1899
                  remu         gp, a1, ra
                  flt.s        s2, ft2, ft6
                  xori         zero, s10, -1471
                  mulhsu       a7, t5, s4
                  andi         ra, gp, 2029
                  sra          sp, s1, sp
                  mulh         a0, zero, s10
                  mul          s5, s8, t6
                  auipc        t6, 681602
                  fsqrt.s      fs7, fs0
                  fsqrt.s      fa0, ft11
                  flt.s        t1, ft10, ft3
                  slti         a4, a7, -1040
                  addi         sp, a7, -1522
                  mul          s2, ra, t4
                  fsub.s       fs1, ft9, fs4
                  div          t4, tp, t5
                  srl          a4, t1, a3
                  sltiu        gp, a0, 1632
                  auipc        ra, 482508
                  remu         s1, t0, s5
                  fmax.s       fs7, fs4, ft5
                  divu         a1, sp, s0
                  mulhsu       sp, t1, sp
                  sltu         a0, zero, t1
                  slli         s10, t5, 8
                  div          t5, s9, a2
                  sll          s2, gp, s8
                  mulh         zero, s4, t3
                  divu         t4, a0, s5
                  srai         a1, s9, 16
                  slti         ra, t1, 1523
                  fdiv.s       fs8, fs0, fs2
                  fcvt.s.w     fa7, a4, rmm
                  srli         a3, a0, 18
                  add          s0, t4, t1
                  mul          a1, s4, tp
                  fsqrt.s      fs0, ft6, rne
                  ori          s3, s9, -112
                  or           zero, a7, t0
                  slti         t5, s8, -1681
                  srl          t5, t1, t2
                  srl          a2, t5, t1
                  divu         gp, s4, a5
                  sub          a7, a2, s2
                  feq.s        zero, ft4, ft0
                  rem          t4, ra, tp
                  or           s7, t0, a1
                  fsgnj.s      fs6, fs4, fa7
                  sll          a3, s6, gp
                  lui          a0, 570093
                  ori          a5, a3, -419
                  fdiv.s       ft9, ft8, fs10, rtz
                  sltu         t1, a7, a2
                  mulh         t3, s5, s10
                  sra          t1, a1, s10
                  lui          sp, 198854
                  fcvt.wu.s    s1, fs2
                  fcvt.wu.s    a2, fa1
                  mulhu        ra, sp, gp
                  fsub.s       fa3, fa5, ft7
                  slli         s4, s2, 15
                  rem          tp, s4, a1
                  andi         a0, t6, -1409
                  nop
                  lui          t3, 132325
                  remu         s5, ra, zero
                  fmul.s       fs0, fa6, fs4, rne
                  fle.s        t2, ft0, fa1
                  srl          s6, s8, a7
                  or           zero, a0, sp
                  fsgnj.s      fs2, ft6, fs10
                  feq.s        a1, fa1, fs11
                  sltiu        t1, s8, -1654
                  fmin.s       ft3, fs0, ft4
                  div          t3, t1, a2
                  slli         sp, s5, 6
                  div          s0, a5, t4
                  xori         s6, s4, -1279
                  div          sp, s3, t4
                  slti         t2, a5, -193
                  srl          s10, a6, s1
                  fsgnj.s      fs10, fs2, fs10
                  fcvt.wu.s    t3, fa2
                  xori         t3, a1, -22
                  fcvt.s.wu    ft11, a0
                  nop
                  remu         t1, tp, ra
                  mulhu        t1, a4, t3
                  fclass.s     s1, fa1
                  fmv.w.x      fs11, t0
                  fmax.s       fs8, fa5, fs7
                  fcvt.wu.s    s4, ft6
                  sll          s2, a2, tp
                  fdiv.s       fa1, fs3, ft10, rne
                  fsgnj.s      fs0, fs7, ft11
                  ori          a1, zero, 548
                  xori         s8, a5, -1641
                  fcvt.wu.s    t4, ft5
                  nop
                  fdiv.s       fs3, fs6, fs5, rtz
                  rem          a2, a7, a2
                  andi         s1, sp, -952
                  div          t2, sp, t4
                  fle.s        s1, fs5, fa1
                  and          zero, a7, s10
                  fsgnjx.s     ft3, fs0, ft3
                  fcvt.w.s     t2, fs2
                  fmul.s       ft2, ft4, fa1, rmm
                  mulhsu       s5, s8, a5
                  fclass.s     s7, ft0
                  sra          s1, sp, t3
                  srl          t3, s6, s11
                  fmv.x.w      a0, fa1
                  srai         s2, t4, 30
                  sub          s3, gp, s1
                  mulh         t6, ra, a2
                  fsqrt.s      ft8, fa1
                  fmin.s       fs1, ft6, fs4
                  slli         a7, s7, 26
                  fcvt.s.wu    ft0, s2, rdn
                  divu         s0, t0, s10
                  nop
                  sltu         t6, t6, t6
                  mul          t6, s4, s9
                  fmax.s       fa0, fs6, ft7
                  fmax.s       ft11, ft3, fs11
                  lui          a2, 145010
                  fmv.w.x      fa3, sp
                  fsqrt.s      fa2, fs2
                  fsgnj.s      fs4, ft2, fs2
                  and          a0, t1, sp
                  xori         a3, t0, -1655
                  fclass.s     s6, fa2
                  fcvt.w.s     t3, fa5
                  flt.s        s3, fa5, fs8
                  addi         sp, t2, 806
                  rem          a0, s6, t4
                  mulhsu       gp, t0, gp
                  sra          s9, s11, sp
                  mul          zero, a2, a3
                  addi         s10, s3, 1024
                  mulhu        a5, s10, t5
                  fmv.x.w      t5, ft0
                  fcvt.wu.s    s6, fa7, rup
                  slti         s8, t2, -1495
                  sltiu        s0, sp, -2030
                  mul          s8, s2, a5
                  add          ra, zero, a5
                  auipc        a4, 931071
                  fdiv.s       fs0, ft2, ft9, rtz
                  srai         t1, s9, 11
                  fmin.s       ft9, fs7, fs5
                  sltiu        a7, t1, -63
                  slli         a0, t0, 19
                  fclass.s     a1, fa7
                  div          gp, s9, a7
                  srl          tp, s7, a4
                  divu         t2, s4, a5
                  fcvt.s.w     fs8, ra, rmm
                  ori          s2, a5, -1219
                  fcvt.wu.s    ra, fs0, rdn
                  fsgnjx.s     fs9, fs3, fa2
                  nop
                  lui          s3, 91038
                  divu         s10, s2, a7
                  div          s9, s0, zero
                  fmv.w.x      fa4, a2
                  fclass.s     a4, fa4
                  remu         s2, t0, s4
                  srli         gp, s11, 3
                  srl          zero, a6, t4
                  srai         a2, t6, 5
                  srl          s10, s5, s5
                  nop
                  fdiv.s       fa0, fa7, fa0
                  or           s10, t5, s7
                  addi         a7, a7, -1818
                  feq.s        ra, fs11, ft8
                  sub          a3, s5, t4
                  flt.s        a3, ft2, fa3
                  fsgnjx.s     fa1, ft6, fs9
                  fsgnjn.s     fa2, ft10, ft2
                  slti         t3, a1, -93
                  andi         a7, ra, 1789
                  fsgnj.s      ft1, ft2, ft1
                  sra          s6, zero, s0
                  fsub.s       ft1, ft5, fs9
                  mulhu        a0, s7, s10
                  flt.s        s3, fs5, fa7
                  and          s8, t5, t1
                  xori         a4, a6, 1537
                  fmul.s       ft5, fs6, ft6, rdn
                  mulhu        s0, s8, gp
                  fmul.s       ft9, fs2, fa4, rmm
                  or           t6, s10, t6
                  add          tp, s4, s3
                  or           t6, s11, s10
                  nop
                  andi         s6, t5, 1902
                  ori          s6, t3, -775
                  slti         s8, s8, -680
                  mulhu        a1, a2, t5
                  sltu         a1, s4, sp
                  fadd.s       fs5, fa7, ft2
                  fmv.x.w      zero, fs5
                  sll          a7, s3, zero
                  srl          s2, t0, t4
                  mulhu        sp, zero, t2
                  sra          a0, zero, t5
                  srli         t1, zero, 2
                  fcvt.s.wu    fs4, gp, rne
                  fle.s        s5, ft1, fa7
                  nop
                  fmul.s       fa0, fs0, fa0, rup
                  srli         s3, a7, 27
                  fsub.s       ft6, ft6, fs4
                  mulhsu       zero, t0, ra
                  slt          s3, a7, t0
                  fsgnj.s      fa4, ft0, fa2
                  fsub.s       fa7, ft8, fs6, rmm
                  fmv.x.w      s5, fa6
                  sltiu        s9, s8, 1045
                  lui          s8, 149757
                  addi         t5, s8, -306
                  mul          s1, a0, t1
                  slli         gp, t0, 22
                  lui          zero, 427636
                  nop
                  srl          s9, t5, t0
                  add          a4, a4, ra
                  feq.s        tp, fa5, ft5
                  andi         s2, a1, 1518
                  andi         s2, s1, 407
                  fdiv.s       fs7, fa6, ft5
                  sltiu        a5, a7, -149
                  nop
                  sub          a7, t5, s0
                  nop
                  xori         s4, a0, -1735
                  auipc        a3, 365691
                  fsgnjx.s     fa1, fa0, ft4
                  sll          t5, a1, a3
                  fcvt.w.s     ra, ft10, rne
                  fmul.s       fs11, fs0, fs0
                  srai         s0, a4, 18
                  remu         s7, gp, t5
                  auipc        tp, 851031
                  slt          s3, s11, s10
                  mul          s5, a2, s10
                  fmax.s       ft6, ft6, fs8
                  feq.s        s6, fa0, ft11
                  fdiv.s       ft5, ft2, fs1
                  fadd.s       ft10, fa1, fa4, rup
                  addi         t2, a5, 965
                  add          t5, s9, a7
                  xori         s1, a3, 984
                  nop
                  xori         ra, t4, 90
                  srai         s7, s11, 25
                  fadd.s       fs9, fs1, ft5
                  fadd.s       fa4, fs9, fs10
                  ori          a2, s1, -94
                  fcvt.w.s     s0, ft5
                  fmv.w.x      fs9, s1
                  auipc        t3, 778971
                  slli         t2, s1, 24
                  ori          t5, a6, 92
                  rem          a7, zero, s7
                  fadd.s       ft5, fs9, fs0, rmm
                  sltu         a4, t1, t1
                  slti         s9, t0, -524
                  fdiv.s       fa0, fs2, fa0, rdn
                  fcvt.s.w     ft7, s1
                  fmax.s       ft5, fa4, ft4
                  fsgnj.s      ft8, ft1, fa6
                  mulhsu       a7, a4, a6
                  fmv.w.x      fs7, s7
                  mul          s3, tp, a0
                  fle.s        t2, ft5, fs3
                  fdiv.s       ft6, fa7, fa5
                  fsub.s       fa7, fa7, ft3
                  fcvt.s.wu    fa3, a7
                  srl          t2, s9, tp
                  and          a0, a2, s6
                  fcvt.s.w     fs4, tp
                  and          a4, zero, t2
                  sub          s10, a6, t4
                  div          tp, s3, s1
                  flt.s        s10, ft7, fs3
                  fadd.s       ft4, fa0, ft6
                  srli         t5, s5, 4
                  fmul.s       ft7, fa6, fs7
                  slti         s3, s10, 1108
                  fcvt.s.w     ft11, a6
                  fadd.s       ft11, fs5, ft5
                  fclass.s     a7, fa6
                  fcvt.s.w     fs10, t1
                  sltu         s8, a3, a3
                  fclass.s     tp, fs11
                  fmul.s       ft5, ft10, ft8
                  fmax.s       ft1, fs8, fa7
                  sra          a7, s11, a5
                  fcvt.s.wu    fa2, tp, rup
                  andi         s0, s1, 914
                  lui          gp, 20960
                  fcvt.w.s     s3, ft3
                  fsgnj.s      ft3, ft3, fa0
                  fmv.x.w      a0, fa1
                  addi         tp, s7, -1587
                  nop
                  andi         s5, a7, -1214
                  or           t1, a0, t2
                  sltiu        s5, a3, -1136
                  mulh         s4, gp, a0
                  fcvt.s.w     fa1, a6, rdn
                  fmul.s       ft2, fs3, fs5, rup
                  mulhu        t3, s9, a6
                  and          s6, a4, gp
                  fcvt.w.s     t4, fs5, rtz
                  andi         s1, sp, 452
                  ori          t3, s10, 366
                  fcvt.s.w     fa7, s3
                  fle.s        zero, fs4, fs10
                  xori         t3, s3, 713
                  fsub.s       fa0, fa0, fs4
                  or           t4, s2, gp
                  fsqrt.s      fa2, fs7
                  div          s9, s0, zero
                  fdiv.s       fs10, fs2, fs5
                  fadd.s       fs3, ft6, fs11, rup
                  nop
                  fcvt.wu.s    t3, ft0, rup
                  and          a7, t2, a5
                  sll          sp, s3, t5
                  div          s5, t6, s6
                  fsqrt.s      ft5, ft11
                  feq.s        a5, fs6, ft8
                  or           a1, a7, zero
                  lui          a4, 850262
                  xori         a0, t3, -952
                  fadd.s       fs8, ft1, fa3
                  lui          s3, 652973
                  fmv.w.x      fs7, t0
                  fmin.s       fa0, fs11, fs5
                  fdiv.s       fs4, fa2, fs9
                  fsgnjn.s     fa2, fa1, fa2
                  rem          a4, s3, s9
                  fle.s        t1, ft9, fs1
                  sll          s8, t5, s4
                  sll          a3, s8, s5
                  fcvt.w.s     sp, ft0, rmm
                  fdiv.s       fa1, fa4, fs7
                  sltiu        zero, a7, 1420
                  sub          s2, t2, a1
                  fmv.w.x      fs6, t0
                  fcvt.wu.s    a4, fs10
                  srai         t6, s8, 22
                  srl          zero, a5, t2
                  srli         s10, s2, 7
                  mulh         t4, t3, t5
                  mulh         sp, t4, sp
                  nop
                  lui          t4, 765392
                  xori         s2, s0, -1568
                  fmul.s       fa2, fs7, ft1
                  fmul.s       ft0, ft0, fa7, rtz
                  mul          a4, s1, tp
                  fcvt.s.wu    ft5, zero, rdn
                  fcvt.s.wu    ft0, t2, rdn
                  fmin.s       fa0, ft1, fs4
                  lui          s0, 443070
                  andi         t6, zero, 487
                  sub          s3, s8, s5
                  rem          a0, t4, t0
                  nop
                  xori         a2, tp, -909
                  fsgnj.s      ft11, fs0, ft8
                  lui          s4, 878549
                  fcvt.w.s     s2, ft1, rup
                  ori          t2, a0, 673
                  mulhu        a1, tp, t0
                  feq.s        a0, fa4, fs4
                  add          s10, a5, a2
                  auipc        s4, 429742
                  div          t1, t4, ra
                  mulhu        s10, s5, s5
                  slli         a5, a4, 22
                  xor          s9, t0, sp
                  fsgnjx.s     ft3, fs5, fs4
                  fclass.s     ra, fs4
                  nop
                  div          zero, s1, t2
                  fcvt.s.wu    fs6, t2
                  addi         s3, a4, -951
                  fmul.s       fa4, fs5, ft0, rup
                  slt          a7, t3, a2
                  fmin.s       fa3, ft3, fs10
                  fclass.s     s3, fs8
                  and          s9, s7, zero
                  sra          s9, a4, s4
                  sltiu        s10, a2, 250
                  fmul.s       fa0, ft3, ft1, rup
                  sra          t2, a0, t0
                  sltu         s0, t3, a4
                  sra          s1, a3, a0
                  addi         a3, t5, -1677
                  divu         s10, t1, s4
                  sltu         s5, s2, s8
                  fsgnj.s      fs1, ft2, fa6
                  fmv.w.x      fa4, tp
                  mulhu        t2, t4, s7
                  auipc        zero, 152782
                  sll          s8, tp, a7
                  addi         t2, a1, -521
                  srai         t2, t0, 15
                  mulhu        t5, a6, s5
                  slli         s2, s0, 7
                  fsgnjn.s     ft3, ft6, ft1
                  sub          sp, t2, s6
                  sll          t3, s2, a0
                  sltiu        s4, s11, -1753
                  divu         s8, s3, s0
                  mulhsu       s1, a7, a4
                  mulh         s0, s9, s3
                  sltu         s1, s8, a3
                  fmul.s       ft5, fa2, fs7
                  fclass.s     s7, fs9
                  mul          a7, a2, s4
                  fadd.s       fs1, ft6, fa5
                  fsgnj.s      fs0, ft8, fs9
                  add          s0, s2, s8
                  sltu         s8, a6, s6
                  add          s7, sp, s0
                  srl          s4, s11, a2
                  srai         s6, a4, 4
                  fcvt.s.wu    fa0, s3, rdn
                  add          t3, a5, a4
                  fle.s        t1, ft11, ft3
                  srli         s8, t5, 30
                  add          tp, a4, a7
                  and          t3, s10, s2
                  fsgnjn.s     fa6, ft0, fs7
                  fsqrt.s      ft6, ft10, rtz
                  nop
                  fle.s        sp, ft6, fs7
                  fcvt.s.w     ft1, t1, rup
                  andi         t1, t4, 501
                  rem          a5, s1, s7
                  fcvt.s.wu    ft11, gp, rdn
                  fcvt.s.w     fs11, a1
                  fclass.s     t1, fa6
                  or           s7, a0, s5
                  mulh         s7, s9, s2
                  ori          s0, t5, -1438
                  fcvt.s.wu    fs7, t0, rtz
                  fcvt.s.w     ft1, tp
                  fmin.s       ft8, ft11, fs7
                  or           s5, t4, s5
                  sra          a1, t1, t2
                  ori          s9, a0, -1959
                  fmin.s       fa3, ft3, fs6
                  fsqrt.s      fa7, ft2, rdn
                  slt          t2, s2, t2
                  mul          s6, zero, a5
                  sub          s5, s0, s9
                  fadd.s       fa3, fa2, fa6, rdn
                  fdiv.s       fa3, fa1, fs11
                  fdiv.s       fa5, fa6, fa3
                  auipc        s3, 857058
                  rem          s5, a4, t3
                  sub          a4, a3, s5
                  fsgnj.s      ft3, ft11, fa3
                  auipc        sp, 237709
                  fsqrt.s      ft7, fa1, rdn
                  fmin.s       fs5, ft7, fa6
                  mulh         s4, a6, tp
                  add          a0, ra, s10
                  feq.s        s4, fa1, ft10
                  sll          s2, s6, s1
                  mulhu        a3, gp, t2
                  addi         zero, s1, 1196
                  lui          ra, 420620
                  divu         s9, s6, t6
                  slti         s3, t1, -1208
                  lui          gp, 504088
                  xori         ra, sp, 1286
                  fmul.s       ft2, fs10, fs9, rmm
                  fadd.s       fs8, fs3, fa6, rup
                  fsub.s       fa3, fs1, fs6
                  fmul.s       fs10, fs1, ft1, rtz
                  fsgnjx.s     fs5, fs5, fa0
                  remu         t2, a7, t4
                  slt          t5, s1, t3
                  and          t5, t3, a4
                  andi         a5, a6, -1995
                  andi         a1, ra, 1420
                  fdiv.s       fa5, ft6, ft3, rdn
                  mulh         s0, a0, t4
                  fcvt.s.w     fs5, t3
                  add          s10, s2, t4
                  remu         t3, a1, s2
                  slt          a2, s10, s11
                  sltu         s1, t3, s6
                  xor          a5, a2, a7
                  fdiv.s       fs8, fa5, fa6
                  fsub.s       ft3, fa1, fa3, rne
                  and          a5, t0, s2
                  fmv.x.w      sp, fa3
                  fmv.x.w      s10, fa2
                  mulh         s10, a0, tp
                  nop
                  srl          zero, t2, t0
                  auipc        zero, 633786
                  feq.s        tp, ft10, ft10
                  fsub.s       fa0, fs1, fa6, rup
                  mul          a7, a5, a5
                  fsub.s       fs3, fa3, ft3
                  divu         gp, t4, t6
                  sltu         t4, s3, tp
                  srl          s8, a5, a0
                  sll          s9, s5, a3
                  slti         a0, a4, -1321
                  mul          s6, a0, a7
                  sub          a1, zero, a5
                  fclass.s     s10, fs8
                  sltiu        a7, t6, 17
                  fmv.x.w      zero, ft9
                  auipc        s6, 854892
                  srai         a7, t4, 26
                  feq.s        s7, fs10, fs3
                  fsgnjn.s     fs2, fs8, fa4
                  slt          a0, sp, s11
                  sltiu        t1, a5, -1823
                  fcvt.w.s     s4, fs8, rtz
                  addi         a1, zero, -1197
                  fmv.w.x      ft11, s0
                  sll          a1, s3, s0
                  sltu         s2, gp, ra
                  fcvt.w.s     ra, ft2, rne
                  fclass.s     s10, fa1
                  srl          s1, s3, s7
                  and          t6, t0, s8
                  andi         s5, sp, 564
                  slti         a5, a2, 1729
                  fadd.s       fa3, ft0, fa7
                  sltu         s9, s10, t6
                  sltiu        a4, s3, -819
                  slti         s6, t6, 1730
                  fclass.s     t1, fa4
                  addi         a7, s4, 407
                  fsgnj.s      fs1, fa5, fa5
                  sll          s10, zero, s11
                  rem          t6, t2, t4
                  fdiv.s       ft4, ft5, ft5, rdn
                  slli         s7, a1, 12
                  sub          t6, tp, s1
                  and          t4, gp, s6
                  fmul.s       fs4, fs2, fs2, rdn
                  fmin.s       ft9, fa4, ft2
                  fcvt.wu.s    t3, ft8
                  remu         a0, sp, t5
                  div          a0, s9, a1
                  fadd.s       fs9, fs4, ft1, rup
                  fcvt.wu.s    s5, fs7, rtz
                  fsqrt.s      fa2, ft4, rne
                  mulh         s5, t6, s2
                  fsub.s       fs5, fa5, fs8
                  remu         s4, a7, s7
                  mul          a1, zero, a3
                  srl          s7, s4, s7
                  srai         a0, s1, 8
                  add          a7, zero, s3
                  mulhu        t6, gp, a2
                  fadd.s       fa7, fs11, fs1
                  mulh         s5, a5, t1
                  fcvt.w.s     s7, fs11, rup
                  xor          s9, a5, s10
                  fcvt.s.wu    ft11, t2, rne
                  fsgnj.s      fs8, ft4, ft9
                  auipc        s6, 467442
                  fadd.s       ft3, ft5, ft1, rne
                  mul          s6, t6, t0
                  fcvt.wu.s    t6, ft10, rmm
                  fmax.s       ft10, ft2, fs4
                  ori          tp, s10, 1059
                  fsqrt.s      fa1, ft4, rtz
                  nop
                  remu         s7, t5, s2
                  nop
                  mulh         a5, a7, s4
                  div          s10, tp, s4
                  sub          s0, s8, t1
                  fmin.s       fs11, fs5, fs8
                  mulhu        s3, s5, s0
                  mulhsu       a2, s9, zero
                  flt.s        sp, ft3, fs3
                  fmul.s       ft9, fa6, fa4, rup
                  sub          a1, s3, s5
                  feq.s        t2, ft8, fa3
                  mulh         s10, t3, t2
                  div          s6, s10, t3
                  fle.s        t1, fa3, ft5
                  mulh         t4, s7, t5
                  addi         t1, t6, -1783
                  flt.s        s1, ft8, ft5
                  rem          zero, a4, a1
                  slli         t4, s8, 17
                  fsub.s       fa1, fs9, ft4, rmm
                  fsqrt.s      ft5, fa6, rdn
                  auipc        t4, 99433
                  sll          s10, zero, sp
                  sltiu        s7, a3, 993
                  and          a7, t6, s1
                  slli         t5, t5, 13
                  mul          s7, gp, a1
                  sub          s3, s7, ra
                  fmul.s       fs0, fa1, ft5, rmm
                  mulh         s8, t3, s7
                  fmax.s       ft10, ft10, fs9
                  fsgnjn.s     ft10, fs4, ft4
                  fsqrt.s      ft0, fs0
                  fmul.s       fa7, fs7, fa5
                  sub          t1, s1, t6
                  andi         ra, s0, 1222
                  flt.s        s2, fs8, ft5
                  mulh         ra, a6, t3
                  addi         a7, a1, -560
                  fcvt.w.s     s4, fs10, rup
                  fsgnj.s      fs10, ft9, fs9
                  mulh         t5, sp, t1
                  fadd.s       fs2, fa6, fa2
                  feq.s        a2, ft11, fa7
                  slti         t1, s11, 658
                  nop
                  fmax.s       fs1, ft11, fa0
                  srai         tp, t5, 22
                  srli         s0, t2, 8
                  fle.s        s6, fs5, fs3
                  fsqrt.s      ft2, fa1, rmm
                  fcvt.s.wu    fs0, t3
                  fadd.s       fs2, ft7, fa6, rmm
                  fmin.s       fs10, fa1, ft4
                  fclass.s     a0, ft7
                  feq.s        a7, fs2, fa0
                  fmin.s       fs1, ft5, fs10
                  sltiu        a0, s3, 1424
                  mulhsu       s5, s7, s11
                  fsgnjn.s     ft5, fs10, fs0
                  fsqrt.s      ft8, fs7, rmm
                  mulhsu       zero, s8, gp
                  fmax.s       ft2, fs10, fs0
                  fsub.s       fs10, fa1, fs8, rtz
                  fcvt.w.s     s7, ft4
                  fcvt.s.w     fa6, gp, rup
                  and          s6, t4, a3
                  fmv.w.x      fa6, s5
                  fmax.s       fs6, fs3, fs3
                  fcvt.s.w     fa3, s3
                  fclass.s     s4, fs7
                  and          a5, s11, s5
                  fmul.s       fs2, fa4, fs4, rup
                  sll          s7, tp, a0
                  srai         s8, s5, 7
                  fcvt.s.wu    fs10, s2
                  mul          a5, a7, a1
                  lui          t4, 1017881
                  flt.s        s3, fs10, ft11
                  fdiv.s       fa2, ft6, ft9
                  sub          s2, t3, s7
                  auipc        s2, 375547
                  slti         s2, s5, -1750
                  fle.s        gp, fs5, ft11
                  sra          t3, t3, a6
                  ori          s2, s8, -992
                  fadd.s       fs5, ft9, fs9
                  fmax.s       fa1, fs1, ft0
                  sub          s6, a7, s2
                  fmin.s       fs10, fs11, fs11
                  fsgnj.s      fs0, fa5, fs6
                  sub          s7, t6, s4
                  fsgnj.s      ft11, fs9, fs2
                  remu         tp, s10, s0
                  fmul.s       fa6, fs5, ft8
                  xori         s4, a5, -743
                  srli         t3, t3, 18
                  mulhsu       s1, s2, zero
                  divu         s8, s1, s3
                  lui          a1, 800880
                  sll          s7, s7, zero
                  auipc        a7, 587060
                  fcvt.s.w     fa6, s1
                  fmax.s       ft1, fs10, fs8
                  auipc        ra, 671723
                  fmul.s       ft2, ft6, fs11
                  andi         s4, a3, -145
                  fmax.s       fs4, fs0, fa7
                  lui          tp, 511388
                  flt.s        sp, fs11, fa0
                  fmax.s       fa0, fa1, fs10
                  srli         s9, t6, 26
                  slli         a5, zero, 24
                  flt.s        s3, ft0, fs0
                  fsqrt.s      ft6, fs3, rmm
                  div          s8, gp, ra
                  mulh         s9, t2, tp
                  sltu         a3, a5, a4
                  fsub.s       ft4, fs3, fa0, rtz
                  fle.s        s0, ft2, fa1
                  nop
                  fcvt.w.s     t2, ft2, rdn
                  andi         t5, gp, -1244
                  fsgnjn.s     ft4, ft7, fs9
                  fclass.s     t4, fs6
                  auipc        s8, 414298
                  flt.s        a4, ft6, fs6
                  slti         sp, t1, 1456
                  nop
                  nop
                  xor          s0, s10, a3
                  srli         s3, gp, 24
                  xori         s7, a6, -811
                  fmv.w.x      fa0, t6
                  fcvt.w.s     tp, ft9, rmm
                  div          t3, t6, t0
                  fclass.s     s0, fs2
                  fclass.s     t1, fa4
                  fmax.s       fs11, fs1, fs3
                  ori          a5, tp, -283
                  fmv.x.w      t4, ft4
                  addi         s10, s8, -1070
                  and          s1, s8, gp
                  ori          s4, a1, 548
                  slli         s6, a1, 12
                  fdiv.s       fa3, fa1, ft2
                  fsgnjx.s     fa5, fa7, fs7
                  mulhsu       t3, zero, s5
                  fmul.s       ft0, fs10, fa3
                  fsqrt.s      fs5, fa0
                  fle.s        a5, fa1, fs9
                  div          a3, s3, s7
                  remu         a7, t6, s9
                  remu         sp, s1, zero
                  fsgnjn.s     fs9, fa7, ft1
                  sll          a3, s11, t2
                  fcvt.s.w     fa2, s7
                  fsgnj.s      ft6, ft4, fa4
                  sll          t6, zero, gp
                  fsgnjn.s     ft3, fs11, ft9
                  xori         t5, t4, -1961
                  srli         a1, s7, 31
                  fadd.s       ft8, ft1, ft1
                  fmul.s       fs2, fs8, ft0
                  remu         a0, s4, t3
                  addi         s6, t6, 517
                  sra          s5, a0, s6
                  mulh         a2, s5, a7
                  srli         t1, ra, 5
                  fdiv.s       fs5, fa1, ft11
                  fle.s        a5, ft4, fa7
                  xor          zero, t6, t0
                  sll          a1, s10, a1
                  fmin.s       ft4, fs0, fa6
                  sll          a0, a7, a2
                  srl          zero, s4, a0
                  fcvt.s.w     ft10, s5
                  ori          a2, tp, -404
                  xor          a2, t0, s6
                  and          s7, s7, ra
                  mul          a4, a6, zero
                  fadd.s       ft11, fa5, ft6, rtz
                  sltiu        s3, t5, -286
                  slt          a5, ra, s6
                  slt          s9, s6, s0
                  fsub.s       fa5, fa0, fa6, rmm
                  fsub.s       fs11, fs2, fs7, rup
                  fsgnjx.s     fs10, fa7, ft10
                  fcvt.w.s     s0, fs2, rmm
                  fsub.s       fs8, ft5, fs10
                  lui          t2, 753234
                  fmul.s       fa4, ft5, fa3
                  fsqrt.s      fa4, fa7
                  sltu         s0, s10, ra
                  fsqrt.s      ft9, fs5, rmm
                  addi         tp, a2, 2040
                  fsgnjn.s     ft10, fa1, fs7
                  fmax.s       ft11, fs7, fs1
                  fsub.s       fs11, fs0, fs9, rmm
                  sltiu        s2, t3, -289
                  mul          t6, tp, t3
                  slt          t2, t1, t4
                  fmin.s       fs9, fa2, fa1
                  feq.s        s4, fa1, ft3
                  fmv.w.x      ft1, a1
                  srli         tp, gp, 5
                  sltiu        a3, s7, -1266
                  mulh         s2, a3, s6
                  fdiv.s       fs5, ft10, fa5, rtz
                  lui          s10, 65725
                  mulh         a5, s10, gp
                  addi         s2, s0, 1627
                  or           s1, s7, t3
                  fcvt.s.wu    fa1, s6
                  srli         a4, s7, 20
                  mul          s1, t1, t4
                  remu         t6, ra, a2
                  fcvt.s.w     fs7, t1, rdn
                  fcvt.wu.s    s4, ft0, rne
                  auipc        ra, 559209
                  xor          s9, t0, t3
                  sltiu        s6, t5, -1940
                  remu         s5, t5, s7
                  ori          s10, s8, -1403
                  fcvt.w.s     t4, fs7, rdn
                  fsqrt.s      fs3, fs3, rne
                  lui          t5, 689642
                  div          gp, t2, s11
                  mul          s8, s5, s1
                  fsgnj.s      ft2, fa3, ft0
                  fsqrt.s      ft10, ft10
                  div          a2, a0, s8
                  fmax.s       fa7, fa6, ft5
                  mul          a7, t3, zero
                  fmul.s       fs9, fa3, fs7, rup
                  fcvt.s.wu    fs3, a6
                  fsgnjx.s     fa2, ft8, fa2
                  mulhu        s2, sp, s5
                  add          s2, s8, s4
                  and          s1, a6, s3
                  flt.s        a5, fs9, fs1
                  fle.s        a2, fa6, fa5
                  fmv.w.x      fs2, t1
                  sub          a1, t4, a6
                  div          t1, a2, s1
                  sub          a5, ra, s3
                  mul          s4, a0, t3
                  flt.s        s8, ft0, ft3
                  srl          s0, zero, a2
                  fmin.s       fs9, fa2, ft11
                  fmul.s       fa7, fa0, fs11, rtz
                  andi         a7, s6, -1003
                  fclass.s     t5, ft4
                  lui          s5, 798299
                  sltiu        s5, a7, -1749
                  nop
                  fsqrt.s      fs0, ft4, rmm
                  sra          s8, a0, t2
                  and          s4, s1, ra
                  rem          s3, a5, tp
                  slli         s0, zero, 21
                  fcvt.s.wu    fs4, sp, rdn
                  fsqrt.s      fs3, fa3
                  remu         tp, gp, s11
                  sra          t4, t1, a0
                  andi         s5, a5, -393
                  fsgnjn.s     fs9, ft6, fs6
                  fsqrt.s      ft5, fa6
                  fsgnjn.s     ft4, ft1, ft4
                  fcvt.w.s     a7, fa4
                  lui          s5, 481995
                  or           a2, s8, s6
                  fclass.s     sp, ft1
                  mulhsu       t2, t1, tp
                  xor          t4, sp, s1
                  fmax.s       ft9, ft10, fa1
                  andi         t5, gp, -1373
                  xori         s2, s0, -1766
                  or           gp, a5, s0
                  fmul.s       ft9, fs4, ft0
                  fcvt.wu.s    a0, ft6, rne
                  auipc        t3, 298476
                  fdiv.s       ft8, ft3, ft8, rdn
                  slli         s5, s2, 2
                  auipc        t2, 1045151
                  srl          s3, t0, s10
                  sra          a3, a0, a1
                  divu         s9, sp, s5
                  mulh         t1, a6, zero
                  addi         s7, a2, -24
                  flt.s        s9, fs1, fs8
                  auipc        a0, 692426
                  srai         t2, s2, 16
                  mulhu        s7, s4, s6
                  and          s10, a5, a7
                  fcvt.s.wu    fa7, a5
                  sra          s7, s8, t4
                  sltiu        t2, a6, 1105
                  fdiv.s       ft1, fa5, fa2
                  srli         a1, t1, 13
                  add          a7, s9, a3
                  slti         s7, a6, -1349
                  mulhu        s9, s1, t3
                  addi         s8, t6, -940
                  sltu         t1, t5, s8
                  slli         a3, s7, 12
                  fcvt.w.s     gp, fs6
                  fmin.s       ft1, fs7, fs11
                  fdiv.s       fs4, ft6, fs8
                  lui          a3, 692861
                  sll          s0, sp, t5
                  or           t4, t3, a7
                  slt          a4, s11, s5
                  mulh         tp, s5, s3
                  div          s2, s2, t3
                  sltiu        s8, a1, -319
                  lui          s9, 182986
                  srai         sp, ra, 29
                  sltiu        a0, s2, -1125
                  mulhu        ra, s9, s4
                  rem          s1, s5, t1
                  addi         zero, t5, 1171
                  andi         s7, t5, -1143
                  fadd.s       ft2, fa7, ft4
                  fsgnjx.s     ft7, ft10, ft11
                  sub          sp, s6, s9
                  remu         t6, s11, gp
                  andi         s7, s3, -110
                  fcvt.s.w     ft3, s0, rtz
                  fcvt.w.s     tp, fs2, rmm
                  fle.s        zero, fs3, fa6
                  fsgnj.s      fs4, fa3, fs8
                  fle.s        t3, fs6, ft8
                  mulh         s10, t1, a1
                  fmv.w.x      ft10, a7
                  addi         t1, s0, -1351
                  divu         s8, s1, a5
                  slli         zero, gp, 27
                  and          a7, t3, t2
                  rem          tp, a7, s6
                  fsgnj.s      ft3, ft6, ft8
                  remu         t3, s4, t5
                  fcvt.wu.s    zero, fa6
                  sltu         s9, a4, tp
                  feq.s        a5, fs2, fs2
                  ori          t5, zero, -1782
                  mul          a3, a7, t0
                  srl          zero, s5, t0
                  fmv.x.w      s8, fa5
                  fmax.s       ft6, ft3, fa6
                  fsqrt.s      fa1, fs6
                  slli         s3, a0, 6
                  remu         a3, s2, tp
                  srai         s0, s7, 2
                  fclass.s     s1, fa3
                  fmin.s       ft10, ft8, ft0
                  fcvt.w.s     a7, fs0, rdn
                  sltiu        s6, s5, -597
                  fclass.s     tp, fa6
                  srai         s7, a7, 29
                  fmax.s       fs10, fs2, fs6
                  lui          t3, 950873
                  flt.s        a1, fa1, fs8
                  fdiv.s       ft9, ft7, fs9
                  fsub.s       fs11, fa7, fs0
                  fsgnj.s      fa1, fs2, fa3
                  div          t3, s11, a4
                  fmul.s       fa2, ft5, fa4, rne
                  xor          ra, t0, t5
                  fle.s        a1, fs1, fa4
                  andi         t3, tp, -1729
                  remu         s0, a5, tp
                  fadd.s       fa7, fs1, ft4, rdn
                  add          zero, s2, t0
                  fclass.s     s10, fs3
                  fcvt.s.wu    fs2, s10, rne
                  mulhu        t1, t6, gp
                  fmin.s       ft9, fa4, fa7
                  fsgnj.s      ft4, fa2, fa2
                  srli         s0, s7, 28
                  mulhsu       a0, s3, tp
                  rem          s1, s1, a7
                  xor          a5, s7, a2
                  slli         a5, t2, 29
                  fsgnjn.s     fa0, fa6, ft1
                  sra          s5, s0, s4
                  sra          a5, s1, a4
                  sll          s4, a6, zero
                  fcvt.s.w     ft4, s1
                  sltiu        s4, s7, -1980
                  andi         a5, s3, 1925
                  fadd.s       fs5, fs1, fs8, rup
                  sltu         s9, s3, a1
                  fle.s        a7, fs5, fs4
                  srl          sp, s9, s1
                  slli         s1, s3, 25
                  sra          s3, s5, sp
                  div          t4, t6, t0
                  and          a4, a2, a7
                  add          s2, a5, a7
                  fsqrt.s      ft0, ft1
                  andi         s2, t5, 287
                  mulhu        t2, t2, s5
                  div          t1, zero, t2
                  mulhsu       t1, s1, s3
                  auipc        a1, 297458
                  div          a0, s5, s2
                  fmax.s       fa3, fs6, fa0
                  lui          s10, 215803
                  slt          s3, s3, a6
                  fcvt.s.wu    ft3, t2, rup
                  or           s4, s5, a6
                  sub          s10, s0, s5
                  fadd.s       fs8, fs11, ft7
                  sra          s7, tp, t2
                  sub          sp, a6, s1
                  feq.s        s6, ft6, ft8
                  mul          tp, zero, s2
                  srai         s5, t3, 28
                  sra          sp, a2, t5
                  fmv.x.w      tp, fs7
                  fcvt.wu.s    a1, fs7, rup
                  fsgnj.s      ft7, ft6, fa0
                  fsgnj.s      ft1, ft0, fs9
                  fsub.s       ft8, fs2, fs1
                  fdiv.s       fs10, fa5, fs9, rtz
                  fcvt.w.s     t1, ft2
                  fmv.w.x      fs4, t3
                  nop
                  rem          s2, ra, s8
                  xori         s0, s7, 1338
                  fle.s        tp, fa6, fa6
                  add          s7, s7, s7
                  mulh         t5, t0, a5
                  sltiu        s0, t0, -214
                  fsqrt.s      fa4, fs0
                  or           tp, ra, a5
                  fmul.s       fs7, ft5, fa7, rne
                  add          t2, a5, a1
                  andi         a1, a4, 904
                  sub          t4, ra, s5
                  fcvt.wu.s    t6, fs0
                  mulh         t4, zero, tp
                  sll          a4, s3, sp
                  div          a7, a7, t6
                  and          a7, tp, s11
                  mulhsu       zero, t1, t0
                  flt.s        s9, fs6, ft0
                  rem          t4, zero, s6
                  slti         a5, s5, 410
                  and          t3, t3, a0
                  fle.s        a2, fa3, fs7
                  sltiu        s4, s6, -97
                  fle.s        s9, fs0, fa5
                  fle.s        a5, fs3, ft10
                  fclass.s     a3, fs4
                  fcvt.s.w     fa3, a5, rup
                  fadd.s       fa2, fs1, fs4, rdn
                  fmin.s       fa3, fa1, fs7
                  fclass.s     s1, ft1
                  fsub.s       ft8, fa4, fa5
                  fsub.s       fa1, fs0, fa4
                  fsub.s       fs10, fa4, ft11
                  srl          gp, s3, a4
                  sll          s1, gp, a4
                  sra          s4, ra, s1
                  fmv.w.x      fa7, a1
                  div          s0, sp, a2
                  fmv.x.w      zero, fs8
                  fmv.x.w      t6, fs3
                  sltu         t4, s11, gp
                  fmv.w.x      fa4, a7
                  srai         t6, t1, 15
                  fmax.s       ft11, ft10, fa3
                  sub          a5, a4, ra
                  fcvt.s.wu    ft2, s5
                  rem          t3, s6, t5
                  slt          s5, s8, s1
                  fsub.s       ft3, ft10, ft11
                  auipc        a0, 102730
                  xori         t6, s11, 455
                  fcvt.s.wu    fa2, t5, rdn
                  fdiv.s       ft3, ft7, fs8, rup
                  xor          t6, s7, tp
                  mulhsu       t4, t6, a0
                  fadd.s       fs11, fa2, ft11, rup
                  remu         s9, t4, t6
                  add          a3, s2, a6
                  fcvt.wu.s    a0, fs6, rmm
                  mulhu        s9, a7, a7
                  fcvt.w.s     tp, ft8
                  srai         t3, s3, 22
                  mulh         a5, s2, ra
                  nop
                  slti         s0, s9, 1468
                  andi         t6, a3, -400
                  mulhu        zero, s7, s5
                  auipc        t2, 511912
                  mulhu        a4, a3, s10
                  xori         s6, s7, -254
                  slt          a7, t3, t5
                  slti         a1, s9, -1734
                  ori          gp, a6, 1916
                  mul          s5, zero, t5
                  fsgnj.s      fs7, fs9, ft1
                  fdiv.s       fa3, fa4, fs10, rdn
                  sub          a7, s11, s3
                  fcvt.w.s     s9, fs8
                  fle.s        s3, fa0, fs6
                  slti         s9, s8, -1500
                  fsgnjx.s     fs6, ft10, fa4
                  fsgnj.s      fa2, ft5, fs2
                  fmax.s       fa0, fa3, fs7
                  fcvt.s.w     ft6, a0
                  fcvt.s.w     ft2, s7
                  fsgnjn.s     fa6, ft4, fs5
                  or           a3, a6, a0
                  lui          s10, 933176
                  add          s9, t3, a2
                  srl          s10, s3, s10
                  fcvt.s.w     ft1, t3, rne
                  xor          sp, a4, t2
                  srli         zero, a6, 3
                  xori         s1, s0, -976
                  fle.s        s7, fs11, fa2
                  add          s1, t6, a5
                  addi         s1, t1, 1664
                  slti         a7, s4, 936
                  flt.s        s7, ft0, ft8
                  remu         a3, t3, s1
                  auipc        t1, 286618
                  and          t6, s0, s3
                  srai         tp, ra, 25
                  xori         t1, a6, 1220
                  add          t5, a5, tp
                  fmax.s       ft1, fa7, fs0
                  and          s2, t1, t5
                  or           t1, s0, a0
                  fcvt.s.w     ft7, s0
                  addi         t2, a1, -1
                  fsgnj.s      fs9, fs4, ft4
                  mulhsu       a0, t6, s7
                  feq.s        s7, fs0, fs3
                  slt          a5, s6, s3
                  feq.s        s3, fa2, fa0
                  fle.s        s5, fs4, ft1
                  fadd.s       fs2, ft4, ft9
                  fadd.s       fa4, fs2, fa0, rmm
                  fcvt.w.s     a3, ft5, rup
                  fmv.x.w      s10, fs11
                  fdiv.s       ft6, fs4, ft8, rtz
                  sltiu        s6, t4, -1238
                  mulhsu       a7, a3, a2
                  sltu         s9, t0, s6
                  fmin.s       fa4, fs3, fs6
                  srli         s7, a6, 20
                  sub          tp, s6, s7
                  addi         tp, t2, -870
                  nop
                  xori         t1, t1, 1112
                  mulhsu       t2, a0, gp
                  fdiv.s       fa5, fs9, fs7
                  slli         sp, s6, 21
                  rem          a5, a1, s3
                  andi         a3, s10, -1467
                  fmv.w.x      fa1, s9
                  sub          t2, s1, s2
                  fle.s        a3, fa2, ft0
                  fmin.s       ft7, fs8, fa6
                  or           s5, a2, t0
                  srli         t6, a5, 31
                  fsgnjn.s     fs2, fs10, fs1
                  fadd.s       ft4, fs3, fa1
                  slti         t2, a1, 544
                  fsub.s       ft7, ft3, ft1, rtz
                  and          s7, t5, a4
                  fsgnj.s      fs10, ft9, fs3
                  fcvt.wu.s    s1, fa4, rmm
                  xor          sp, t6, ra
                  fmv.x.w      tp, fs2
                  fsgnjn.s     fs7, ft0, fs10
                  fsqrt.s      fa2, fs11
                  sra          zero, tp, a7
                  fsub.s       fs7, ft8, ft11, rup
                  xor          t5, t5, s3
                  sltu         t5, t5, s8
                  srli         t5, t5, 28
                  fcvt.s.w     fa7, t4, rne
                  sltu         a7, a0, s4
                  divu         s8, s2, t2
                  mul          gp, s8, t6
                  fsgnj.s      ft6, ft11, ft9
                  sll          s0, s4, t0
                  feq.s        a7, ft1, fs3
                  addi         t6, s0, 1847
                  fmin.s       ft10, ft5, fs0
                  fsgnjx.s     ft3, ft1, ft6
                  sltiu        s10, s5, 865
                  fcvt.w.s     a4, fs7
                  fcvt.s.w     ft9, s11
                  slli         sp, a5, 28
                  fle.s        s2, fs2, fs9
                  nop
                  divu         s0, s3, s8
                  fcvt.w.s     a3, ft11, rmm
                  fcvt.wu.s    ra, fa0, rne
                  sltu         s3, s11, s3
                  andi         zero, t6, 586
                  fadd.s       fs2, fs6, ft3
                  xor          a4, s7, a2
                  or           zero, s2, sp
                  andi         s9, s1, 302
                  fmv.x.w      s2, ft7
                  sll          ra, s7, a6
                  lui          a7, 1025839
                  sll          ra, sp, a4
                  addi         t4, t3, -1050
                  mul          tp, a0, a7
                  ori          s5, s0, -2015
                  fmin.s       ft11, ft10, ft5
                  fsgnjn.s     ft3, fa6, ft10
                  flt.s        t2, fs8, fa4
                  fmv.x.w      a4, fa5
                  nop
                  sll          t6, gp, s11
                  andi         a1, a4, -241
                  flt.s        t6, fs6, fa3
                  slt          a3, s3, s2
                  fsub.s       ft7, fa7, fs2, rmm
                  fcvt.wu.s    s1, ft8, rup
                  fadd.s       fa1, fa6, fs10
                  fsub.s       fa6, fa2, fs11, rtz
                  fmv.w.x      ft0, t1
                  fclass.s     s4, ft4
                  fcvt.s.wu    ft10, s0
                  divu         s7, a7, a3
                  sra          a1, s1, sp
                  fmax.s       ft9, fs10, ft1
                  fmv.x.w      s10, fs1
                  andi         a5, ra, -1981
                  feq.s        a0, ft2, ft5
                  fclass.s     a3, fs6
                  sltu         s0, s1, a7
                  sltu         sp, s11, t0
                  mul          t2, a3, s1
                  addi         s5, t6, -1365
                  sub          zero, t0, s3
                  divu         sp, zero, a0
                  fsgnjx.s     fs11, fa7, fa3
                  add          ra, s6, a5
                  srli         a4, a5, 25
                  srli         a5, ra, 29
                  remu         a2, s11, a2
                  srl          s0, a7, s0
                  divu         s3, s6, s0
                  sra          a1, t3, a4
                  remu         a1, s0, s8
                  fcvt.s.w     fa3, ra
                  mulhu        tp, s9, a0
                  mulhsu       tp, s11, zero
                  mulhu        a7, s0, s3
                  fsqrt.s      ft8, ft8
                  sltiu        ra, s6, 834
                  fmin.s       ft11, ft9, fs10
                  mulhsu       s10, s4, s8
                  fmax.s       ft2, fs4, fa3
                  mulhu        s10, s9, a5
                  nop
                  rem          a4, s2, t2
                  andi         a1, s7, 1154
                  mulh         t3, s8, t2
                  fmv.x.w      t5, ft11
                  auipc        s5, 1011080
                  add          a3, a0, a5
                  xori         ra, ra, -1222
                  sra          t4, a2, a4
                  fsqrt.s      fs7, ft11, rup
                  xor          s8, s6, t4
                  mulhu        sp, s9, a5
                  fsgnjn.s     ft8, fs6, ft1
                  fmin.s       ft5, fs3, fs7
                  fmv.x.w      s0, ft2
                  mulhu        t6, gp, s11
                  andi         t5, a0, 1944
                  ori          s9, a2, -265
                  or           tp, t3, a2
                  fmv.w.x      fa6, t4
                  fmin.s       ft4, fs5, ft4
                  fsgnjx.s     ft1, ft6, fs11
                  srli         a3, tp, 1
                  srai         gp, t3, 8
                  auipc        s9, 121781
                  sll          t1, s5, t1
                  fcvt.w.s     s3, ft4, rtz
                  fcvt.s.w     fa3, a0, rdn
                  slli         s10, t0, 31
                  mulh         t4, a4, s7
                  fmul.s       fs6, fs5, fa6, rne
                  mulhsu       t5, a4, t5
                  fcvt.w.s     s7, fs5, rup
                  addi         s1, s4, 1121
                  slt          t5, tp, t3
                  div          sp, a0, s8
                  andi         zero, t4, -1036
                  sltu         s7, s9, sp
                  lui          s0, 480414
                  andi         s4, a4, -1492
                  fcvt.s.wu    fs5, s3
                  mulhsu       sp, s0, a2
                  feq.s        s3, fa3, ft8
                  sra          a2, s7, tp
                  sra          a5, a6, a2
                  fmax.s       fa6, fs1, fs2
                  slti         s5, gp, 506
                  addi         t2, s10, 1126
                  sub          s4, s11, t6
                  ori          s9, s8, 1963
                  mulhsu       t3, s10, s2
                  remu         s8, s2, s0
                  xori         t1, t0, 448
                  slti         s10, a2, -587
                  mulhu        s1, t1, a2
                  xori         s10, a0, -1828
                  ori          s4, ra, -933
                  sltu         s7, s10, a6
                  auipc        a2, 884479
                  slti         ra, tp, -2036
                  rem          t1, a3, s2
                  add          gp, t1, a6
                  fsgnjx.s     ft1, ft1, fa5
                  slt          tp, a5, s2
                  fmul.s       fa3, ft10, fs3, rtz
                  sltiu        t6, a5, -1308
                  mulhsu       t1, tp, a6
                  lui          s6, 910495
                  mulhsu       a3, t6, a5
                  fadd.s       ft7, ft3, fa7, rne
                  fcvt.wu.s    s5, fa4, rne
                  srai         s0, s3, 2
                  mul          s5, sp, s6
                  mulh         a3, t2, a4
                  lui          a0, 125775
                  fcvt.w.s     a4, fs3, rup
                  fcvt.s.w     fs0, a1
                  mul          s10, s10, gp
                  fmin.s       fs8, ft7, ft5
                  remu         s2, a3, t4
                  fclass.s     s5, fa3
                  flt.s        s2, ft1, fa6
                  srli         s3, t6, 9
                  fcvt.w.s     s5, fs6, rtz
                  srli         a7, a5, 9
                  fmin.s       ft2, fa2, fa5
                  mul          gp, s2, tp
                  fcvt.w.s     a2, ft0, rne
                  sll          s10, a0, zero
                  srai         s9, t6, 16
                  auipc        s2, 173912
                  xor          t6, ra, a5
                  fsgnjn.s     fa6, ft10, ft7
                  ori          s8, s10, 767
                  fcvt.s.wu    fs9, s8
                  fsqrt.s      ft5, ft5, rne
                  fcvt.s.w     ft7, s5, rdn
                  div          s2, s3, s3
                  fmax.s       fs5, fs1, fs2
                  srai         zero, s0, 13
                  and          s6, a4, s6
                  sltiu        t6, a5, -1116
                  slt          sp, t2, t4
                  srl          sp, s0, s10
                  mul          zero, a7, a5
                  fcvt.s.w     ft1, t3, rmm
                  fle.s        a5, fa4, fa5
                  fmax.s       fs1, fa5, fa0
                  flt.s        t6, fs7, fs11
                  flt.s        a3, ft11, fs7
                  fmin.s       ft6, fs2, fs4
                  slti         s6, a1, -1406
                  fmax.s       ft3, ft8, ft10
                  and          t5, t1, a5
                  fsqrt.s      ft5, ft10
                  fcvt.s.w     ft2, a7, rmm
                  fsgnjn.s     fs8, ft9, ft5
                  fclass.s     tp, ft8
                  fdiv.s       fs0, fa6, fs11
                  auipc        sp, 383491
                  sra          t5, s6, a2
                  fsqrt.s      fs2, fa2
                  srl          t3, a7, s2
                  divu         s1, tp, t5
                  remu         t4, s6, s0
                  fle.s        s2, fs3, fs7
                  remu         a1, a7, a4
                  sll          ra, a7, s5
                  slt          a1, sp, t0
                  addi         a0, ra, 289
                  fcvt.s.w     ft7, a3
                  sltu         t1, t6, a7
                  fsgnj.s      fa5, ft10, fa2
                  fclass.s     s6, ft11
                  fmul.s       fs5, fs9, ft3, rdn
                  fadd.s       fs1, ft2, fs6, rmm
                  fle.s        t2, ft9, fs10
                  srl          ra, t1, t2
                  mulhsu       t6, s11, t4
                  srl          tp, a4, s8
                  rem          s0, a6, s1
                  fdiv.s       fa5, fs6, fs5
                  fdiv.s       fa4, fa2, ft0
                  lui          s6, 367751
                  fclass.s     s0, ft7
                  sll          a0, s4, t2
                  fcvt.wu.s    s9, ft1, rmm
                  and          s1, s8, t2
                  fcvt.s.w     fs6, s2
                  mul          s2, t4, s10
                  slli         a1, s11, 23
                  add          s6, a0, s3
                  or           t6, a7, s8
                  fsgnj.s      fs10, ft6, ft7
                  or           s1, s1, zero
                  mulhu        sp, s6, a5
                  andi         a1, s7, 1131
                  fsub.s       fs3, fs7, ft0
                  nop
                  srai         s4, a5, 29
                  fdiv.s       fs11, fa4, fs9, rmm
                  sub          s9, t5, s8
                  srl          tp, s2, s11
                  fmv.x.w      s0, fs10
                  mulhu        a3, a7, a5
                  fclass.s     t3, ft5
                  sltu         a1, s3, sp
                  fmin.s       fs7, fs7, fs2
                  srli         t1, t0, 6
                  remu         gp, zero, s3
                  andi         tp, s1, 1212
                  nop
                  fclass.s     s8, ft10
                  xori         s8, s10, -1211
                  srai         s7, s9, 20
                  srl          t4, zero, s4
                  mulh         a5, s5, s0
                  fcvt.w.s     s3, fa4, rne
                  feq.s        zero, ft2, ft3
                  sll          a2, s2, t3
                  sub          s2, s8, s7
                  fmv.x.w      s0, ft10
                  fsgnjx.s     ft9, fs1, fs5
                  div          s1, sp, t4
                  and          a5, sp, s4
                  fadd.s       ft7, fa1, fa4
                  fsgnj.s      ft7, fa0, ft11
                  addi         s6, s9, -1258
                  fmv.x.w      s5, ft6
                  fle.s        s0, ft7, fa3
                  fsub.s       fs9, ft8, ft3
                  flt.s        sp, fs3, fs6
                  mulhu        gp, s8, tp
                  fsqrt.s      ft8, ft9, rtz
                  rem          gp, t6, a7
                  slli         a2, tp, 1
                  slti         ra, s10, -1171
                  fcvt.w.s     s2, fa0
                  fmin.s       fa0, fs10, fs6
                  fcvt.s.wu    fa4, gp
                  or           s0, s6, a2
                  fadd.s       fa4, fs8, fs3
                  mul          gp, t6, a3
                  mulhsu       sp, s7, s2
                  divu         gp, s11, a7
                  div          t6, t0, s11
                  xori         t4, sp, 1938
                  fadd.s       fs1, ft6, ft6
                  sub          t5, t1, a0
                  mul          ra, s7, a1
                  fmul.s       ft4, fa1, ft3
                  ori          a4, t3, -754
                  srl          t2, a6, a2
                  mul          sp, a7, s5
                  fcvt.s.w     fs4, t0, rmm
                  and          s9, s11, s9
                  auipc        t3, 428949
                  slt          a7, a6, a6
                  fcvt.wu.s    s5, fs1
                  div          t1, s1, t1
                  mulh         a4, t4, t5
                  fle.s        a7, fs8, ft0
                  fcvt.w.s     t4, fa2, rtz
                  sll          a3, zero, t4
                  feq.s        s3, fa7, fs2
                  fmax.s       fa0, ft6, ft3
                  fmul.s       fs4, ft9, ft9, rmm
                  sltu         gp, s2, s5
                  slt          s3, s6, a1
                  addi         s9, s3, 398
                  ori          s6, s1, 1437
                  fclass.s     s7, fs9
                  add          a7, t0, s11
                  fadd.s       ft0, ft10, fa2, rtz
                  fsgnj.s      ft5, fs2, ft8
                  flt.s        a4, ft5, ft9
                  div          gp, a3, s7
                  div          s5, gp, tp
                  sltiu        s6, s7, 640
                  rem          s7, s2, t4
                  fsub.s       fa3, fs7, fs11
                  or           t1, a4, a5
                  mulh         a4, s10, s10
                  slli         a1, a0, 13
                  fmax.s       fa0, fa4, fa1
                  lui          a5, 307990
                  fmin.s       fs11, fs5, fs11
                  fcvt.s.w     ft2, t3, rne
                  slt          gp, t1, s7
                  fcvt.w.s     s4, ft11, rne
                  fclass.s     t1, fs11
                  auipc        t5, 389730
                  fadd.s       ft6, ft10, ft10, rup
                  fsgnj.s      ft10, ft2, fs10
                  ori          s9, t6, 1005
                  xor          s6, t2, s5
                  fsgnjn.s     fa6, fs9, fs0
                  fsub.s       fa6, fs11, fa0
                  xori         ra, s1, -234
                  fsgnj.s      fs5, ft6, fs8
                  fmul.s       fs0, ft10, fs10, rmm
                  fcvt.wu.s    t2, ft2, rtz
                  auipc        t4, 132339
                  addi         tp, t4, 2029
                  fcvt.s.w     fa7, s7, rtz
                  lui          s6, 602439
                  fmv.w.x      fa3, t4
                  nop
                  sltu         s4, s1, tp
                  srai         a2, tp, 27
                  fmv.w.x      fs2, a2
                  fmin.s       fa0, ft6, fs7
                  sltiu        s6, t0, 1469
                  mulh         a3, a3, t0
                  xori         zero, s5, 361
                  lui          s9, 818019
                  sltiu        t1, t3, -191
                  fsgnj.s      fa3, ft10, fs5
                  fcvt.s.wu    fa7, t5, rne
                  fdiv.s       fs0, ft11, fs2, rne
                  auipc        ra, 907509
                  srai         s5, a6, 31
                  sltiu        gp, a3, -2023
                  fcvt.s.w     fs0, a5
                  fclass.s     t3, ft2
                  nop
                  mul          s6, s9, t5
                  fcvt.s.wu    ft0, a0, rtz
                  fdiv.s       fs8, fa0, fs7, rmm
                  slli         a0, a5, 23
                  fdiv.s       fs0, fs7, ft2
                  fadd.s       ft10, fa3, fa4
                  addi         gp, s4, 1506
                  fclass.s     s5, fa0
                  fcvt.s.w     ft6, s0, rne
                  sltiu        s2, s8, 1791
                  ori          gp, s3, 1442
                  srai         s10, s11, 9
                  sub          t1, s3, a2
                  lui          a4, 983201
                  fclass.s     gp, fs1
                  auipc        s10, 504163
                  fcvt.s.wu    fa4, t1
                  sub          s8, t4, s4
                  fsub.s       ft1, fs5, fa3, rmm
                  mulhu        a5, a1, a3
                  fsgnj.s      ft0, ft0, fs1
                  sltiu        a5, s7, -644
                  xor          s5, a4, a1
                  fcvt.s.wu    ft9, t0
                  fmv.x.w      t5, fs7
                  or           s10, a5, t6
                  fmul.s       fs11, fa4, ft6
                  auipc        a2, 683339
                  feq.s        a1, ft9, ft6
                  srl          a5, tp, s6
                  and          t1, s11, a2
                  fcvt.w.s     a1, fs8
                  sll          tp, gp, s8
                  mulhu        tp, t1, s11
                  fmv.x.w      a5, ft7
                  fadd.s       ft10, fa3, fs10, rdn
                  xori         t4, a2, 949
                  fcvt.s.w     fs5, t3
                  xor          tp, a7, s4
                  nop
                  xori         t6, sp, -1314
                  slti         a7, a2, 1790
                  fclass.s     s1, fs5
                  xori         ra, s3, -904
                  auipc        t1, 837044
                  fcvt.wu.s    s4, ft7
                  add          s5, gp, s10
                  slti         s7, s6, -127
                  fmin.s       fs8, fs0, fa0
                  mulhsu       s5, ra, ra
                  auipc        s8, 22159
                  lui          sp, 127297
                  fmv.w.x      fs10, s0
                  feq.s        s6, fa0, ft6
                  fsgnj.s      fs1, fa0, fs2
                  sltiu        t5, t1, 665
                  fsqrt.s      fa2, fs9
                  fsub.s       fs4, ft10, fs5
                  fmin.s       ft11, ft2, fs7
                  sltiu        s9, a5, -275
                  add          t3, s5, gp
                  nop
                  fsgnjn.s     ft5, fs4, fs4
                  fadd.s       ft6, ft11, fs6, rne
                  srli         ra, s11, 23
                  or           ra, t3, s8
                  fcvt.s.wu    ft2, sp, rne
                  mulhsu       s3, s10, s8
                  slli         s9, s1, 15
                  srai         s8, s10, 10
                  fsgnj.s      fa5, ft5, ft8
                  srl          a4, t5, s1
                  sltiu        t5, zero, 1930
                  sll          ra, a4, a3
                  fsub.s       ft3, fa5, ft1, rne
                  sub          a1, a3, t2
                  lui          s3, 964871
                  remu         a7, ra, s4
                  fdiv.s       ft10, fa2, fs11, rdn
                  sltu         s5, s0, s5
                  andi         s0, s8, -1034
                  feq.s        a4, fa3, fs5
                  mulh         s3, a2, tp
                  sltu         s8, s7, s5
                  fcvt.s.wu    fs1, t1, rdn
                  divu         s3, a7, t3
                  srai         s10, s11, 7
                  lui          a4, 591077
                  sra          s10, s0, s5
                  slti         t6, ra, 11
                  addi         t3, t5, 143
                  xori         t6, s0, -778
                  divu         a0, t5, sp
                  fmax.s       ft2, fs7, fa6
                  andi         t2, t1, 1972
                  fmul.s       fs7, fs7, fa3, rmm
                  divu         s5, a6, s8
                  feq.s        s5, ft6, ft10
                  divu         a2, t2, tp
                  mulhsu       sp, s4, sp
                  mul          ra, ra, a7
                  fsgnjx.s     fs9, fs5, ft6
                  nop
                  sra          gp, s0, s2
                  sub          t2, a7, s9
                  fadd.s       ft7, fs5, ft11
                  fdiv.s       fs5, ft5, fa6, rtz
                  fle.s        s10, ft10, fs1
                  slli         t4, a2, 30
                  sll          s0, t5, a7
                  mul          s10, a1, tp
                  xori         s10, sp, -181
                  rem          gp, tp, t6
                  sub          t4, s11, sp
                  xor          s10, s5, s8
                  fcvt.s.wu    fa7, t4, rmm
                  remu         zero, s3, s10
                  flt.s        s1, ft10, ft9
                  fsgnjn.s     ft0, ft10, fs9
                  mulhsu       a7, s2, tp
                  sra          t2, s6, t2
                  mulhu        s0, a0, s3
                  fadd.s       ft4, ft5, fs0
                  mulh         s2, s0, ra
                  lui          t5, 639142
                  andi         s4, gp, -529
                  ori          ra, s11, 1828
                  sub          t5, s5, a3
                  fadd.s       fs4, ft2, ft7
                  addi         t5, t0, -1555
                  sltu         s7, a1, s0
                  fle.s        s1, fa7, fs10
                  feq.s        s3, fa2, ft5
                  fsgnjn.s     ft9, ft6, ft9
                  fmax.s       fa6, fa0, fs4
                  mulh         t4, a7, a3
                  srai         s0, gp, 22
                  fsgnjx.s     fs1, fs4, ft4
                  slli         s9, tp, 2
                  fmv.x.w      a2, ft9
                  srl          s5, a2, tp
                  fsub.s       fs8, fa0, ft5, rne
                  flt.s        a0, fs8, fa1
                  xor          s5, t0, s4
                  sub          t3, ra, t4
                  fmv.w.x      fs0, a4
                  divu         t6, s5, s0
                  sltiu        t2, a6, -371
                  ori          t3, s6, 1689
                  fcvt.w.s     s4, ft7, rtz
                  feq.s        a4, ft5, fs3
                  and          zero, ra, gp
                  mulhsu       s2, a1, a7
                  fsqrt.s      fa6, fa3, rmm
                  srai         a4, s3, 4
                  or           a2, s11, a1
                  fle.s        s1, fa3, fa7
                  fsub.s       fs10, fa2, fs7, rup
                  feq.s        t5, ft1, ft8
                  sll          t1, s5, tp
                  feq.s        s10, fs5, fa6
                  fsub.s       fa1, fs4, fs11, rdn
                  mulhu        a3, t1, t5
                  sra          t2, a6, t3
                  xor          s3, a0, gp
                  addi         gp, s4, -260
                  sll          s1, s6, s8
                  fcvt.w.s     t5, fs10, rup
                  and          a5, s9, s0
                  fmax.s       ft11, fs3, fs5
                  mulhu        a4, a4, t5
                  fcvt.w.s     s1, fs0
                  mulh         a5, s11, s11
                  fsgnj.s      fs8, fa0, ft4
                  fmv.x.w      t5, fs3
                  fmv.x.w      gp, fa6
                  mulh         s1, s11, s6
                  fle.s        tp, fa4, fs10
                  fcvt.wu.s    s9, ft6, rdn
                  fmul.s       ft4, fa6, ft5, rtz
                  fsgnjn.s     fa1, fs11, fs6
                  mulhu        gp, s6, s11
                  fmax.s       fs6, fs3, fs6
                  divu         t3, s2, gp
                  xori         t2, s2, -965
                  sra          a1, tp, t6
                  feq.s        s8, fs11, ft7
                  xori         s2, a4, 1225
                  fsgnjx.s     ft0, ft2, fs2
                  fdiv.s       ft10, ft9, fs0
                  fmv.x.w      a0, ft9
                  fmax.s       fs11, fa5, fs4
                  fmin.s       fs9, fs4, ft1
                  slt          a1, sp, sp
                  fmv.w.x      ft7, a1
                  srai         t6, t0, 19
                  div          gp, a6, t2
                  add          a2, a3, a4
                  fadd.s       fs11, fs5, fs1, rne
                  div          a7, gp, a3
                  andi         s8, t1, -656
                  srai         gp, s9, 11
                  srai         s5, zero, 3
                  srai         a3, a6, 27
                  feq.s        sp, fa0, fa0
                  rem          s2, t6, s1
                  fmax.s       fs4, fa7, fa1
                  mulh         t5, a5, ra
                  fle.s        s5, fa6, ft0
                  fclass.s     t1, ft11
                  rem          s8, s0, tp
                  sltiu        t5, t6, -304
                  fsgnjn.s     fs7, ft8, ft4
                  srli         a3, s8, 25
                  slli         a7, t6, 13
                  fsqrt.s      fa3, fa7
                  nop
                  srai         t4, t0, 21
                  fmv.x.w      a3, ft2
                  fmv.w.x      fs0, s0
                  divu         a4, t4, s8
                  remu         gp, a3, s7
                  feq.s        s7, ft6, fa2
                  fsgnj.s      fs4, ft0, ft7
                  fmul.s       fs10, fa6, ft3
                  add          t2, t0, a0
                  fdiv.s       ft7, fs9, fs11
                  nop
                  fcvt.wu.s    a3, ft5, rtz
                  flt.s        a4, fs7, fa5
                  lui          a5, 852678
                  srli         gp, a5, 10
                  fsqrt.s      fs9, fa7, rup
                  flt.s        zero, fs6, fa0
                  fcvt.wu.s    gp, ft1
                  xori         a3, a4, -347
                  sltu         s6, a3, s9
                  fsgnj.s      fs7, ft6, ft5
                  slti         sp, a3, 1529
                  fclass.s     t1, ft1
                  fsub.s       ft7, ft0, ft7, rup
                  sltiu        t6, s3, 708
                  auipc        a2, 849451
                  fsgnjx.s     fs3, fa4, fs7
                  nop
                  fclass.s     gp, ft5
                  sll          tp, s6, t2
                  or           s10, zero, s1
                  fclass.s     a5, ft2
                  auipc        a4, 604797
                  add          ra, t0, t2
                  slt          t6, s2, gp
                  divu         ra, t4, s3
                  flt.s        t6, ft11, fs8
                  slt          a5, ra, gp
                  remu         s0, t3, t6
                  fmv.x.w      a5, fs11
                  mulhu        s1, a2, s1
                  fcvt.s.wu    fa7, a6, rne
                  fcvt.w.s     a5, ft11
                  rem          a0, t4, s8
                  fle.s        s3, fa0, fa6
                  slt          t3, s8, gp
                  fsgnjn.s     fa5, fa1, fa0
                  sub          a5, s6, zero
                  auipc        a4, 226591
                  srli         tp, s3, 6
                  ori          a7, s6, 1460
                  rem          a0, t2, s5
                  mulhu        t1, a6, t6
                  ori          s4, t2, 1639
                  ori          tp, t6, -1868
                  slt          s9, a0, s9
                  fmax.s       ft1, fa4, fs2
                  fcvt.s.wu    fs10, a2, rdn
                  fle.s        s0, fs8, fa2
                  fcvt.w.s     t2, fs5
                  srli         ra, s10, 29
                  ori          s7, s6, 1254
                  fmul.s       ft9, ft5, fa1, rup
                  fsgnjn.s     fs11, fs6, fs6
                  srl          s10, t3, a6
                  or           a1, a4, s2
                  addi         s3, s2, -544
                  feq.s        tp, fa3, fs9
                  fsgnjn.s     ft7, fs8, fs8
                  sra          s6, a2, a2
                  sra          s9, tp, a4
                  slt          s6, a3, s5
                  andi         t1, s7, 1833
                  fsgnj.s      ft4, fa5, fa5
                  srl          t6, t1, t4
                  sll          tp, s1, sp
                  fmv.w.x      ft8, a6
                  srl          s7, s2, a3
                  sra          sp, a3, s3
                  fadd.s       fa7, fs0, fs7
                  fcvt.s.w     ft6, s7
                  fmin.s       fa2, fs9, ft2
                  slli         s3, t6, 11
                  sll          ra, s10, zero
                  sub          t1, tp, a3
                  ori          t4, a3, -1247
                  srai         a5, s1, 15
                  slli         tp, a2, 17
                  fsqrt.s      fa7, ft10
                  fsgnjn.s     ft0, fa2, ft11
                  fsub.s       fs1, fs6, ft1, rne
                  fadd.s       fs3, fa1, ft6
                  xori         t1, a1, -1773
                  slli         t5, sp, 7
                  fclass.s     s0, ft4
                  rem          s3, t4, zero
                  sltiu        a5, zero, 1455
                  sll          s8, s5, t6
                  mulhu        s3, s1, s1
                  add          t4, a5, s2
                  fcvt.w.s     s1, fs2, rdn
                  fmul.s       fa6, fa0, fa3
                  fcvt.w.s     s9, fs4
                  sra          s1, a6, s2
                  nop
                  mulh         a5, a4, gp
                  flt.s        s8, ft1, ft6
                  fsqrt.s      ft3, fs7, rdn
                  srl          t3, s2, s8
                  sll          a0, t0, a3
                  sub          sp, s10, s2
                  fdiv.s       fa3, ft10, fs7, rmm
                  mul          t5, a7, t0
                  fsub.s       fs9, fa3, fa1, rmm
                  srai         s9, t0, 31
                  slt          t3, s8, a1
                  sltu         a3, a5, s3
                  or           s7, s0, zero
                  fadd.s       fs8, fa1, ft11
                  addi         a3, a7, 334
                  fcvt.wu.s    t1, fa1
                  fmul.s       ft4, fs1, ft1, rdn
                  and          sp, a2, gp
                  fcvt.s.wu    fs2, t2, rmm
                  and          a1, s7, s11
                  sll          s8, s0, t4
                  fmv.w.x      fs5, s7
                  xor          ra, a5, t5
                  fsub.s       fs1, fs3, fs7, rdn
                  ori          zero, a6, 567
                  slli         t5, a5, 23
                  fmul.s       ft4, fs8, fs4, rtz
                  fcvt.w.s     gp, fs8
                  fcvt.wu.s    a7, ft4, rup
                  fsgnjn.s     fs4, fs5, fa2
                  mulhsu       s1, a3, a3
                  xor          s5, a5, a2
                  rem          s2, s5, tp
                  sltiu        a2, t6, -1419
                  fcvt.s.w     ft7, a0, rdn
                  mulhu        ra, s9, a0
                  sra          sp, a4, a0
                  fsub.s       fs0, fa0, fa7
                  fadd.s       fs1, ft6, ft6
                  fcvt.wu.s    s3, fs10
                  div          tp, s6, s2
                  xori         s5, tp, -416
                  fcvt.s.w     ft8, s2
                  sltu         s1, s4, a1
                  mul          a3, s4, a0
                  sll          s8, s8, t2
                  sltu         gp, s6, a6
                  sll          s4, zero, s11
                  fcvt.s.wu    fs2, a4, rne
                  nop
                  fle.s        s0, fa4, ft4
                  mulhu        a7, ra, s5
                  flt.s        a7, fa3, fa3
                  srl          s7, t4, sp
                  sra          s1, s10, a6
                  sltu         s1, gp, t4
                  add          s0, s6, a7
                  srli         a3, s1, 12
                  sra          s5, t0, a2
                  fsub.s       fs4, ft1, ft10
                  fcvt.w.s     t1, ft4, rtz
                  fsub.s       fa5, ft11, ft0, rup
                  xor          s3, s5, a5
                  fsgnj.s      fa6, ft7, ft10
                  rem          tp, a4, s5
                  nop
                  fcvt.s.w     fs9, a1
                  fcvt.s.w     fa0, a5, rtz
                  andi         s9, sp, -130
                  fdiv.s       fa3, fs10, ft0
                  rem          s10, s7, t5
                  feq.s        tp, fa7, fs9
                  nop
                  fsqrt.s      fs8, ft1
                  flt.s        s2, fs10, fs9
                  xori         s7, s0, -1099
                  andi         t6, t5, -1498
                  fsgnjn.s     ft5, ft3, ft9
                  fcvt.wu.s    t3, fs9, rtz
                  ori          t6, s4, -324
                  andi         s6, t1, -33
                  sltiu        s9, a0, -1685
                  srl          s8, tp, a1
                  fsub.s       fa1, ft1, fa5
                  sll          s7, zero, s11
                  xor          ra, a3, a0
                  fsub.s       fs6, fs8, ft0, rmm
                  srai         s2, s1, 31
                  fmax.s       fa7, fs7, fa3
                  fmul.s       fs3, fs5, fa3, rtz
                  sltu         t3, s6, s7
                  srli         s7, a7, 5
                  sll          a5, s5, t5
                  ori          a5, a5, 619
                  srli         t1, s3, 4
                  nop
                  fmin.s       ft1, ft4, ft10
                  fmv.w.x      ft7, s3
                  fmin.s       ft0, fs8, fa3
                  div          s5, s1, a6
                  fcvt.s.wu    fa0, s10
                  remu         s5, s5, s3
                  mulhsu       a3, a0, tp
                  srl          sp, ra, a1
                  srli         t6, gp, 4
                  fsub.s       fs7, ft3, fs11, rtz
                  addi         a2, gp, 1328
                  mul          s4, ra, a2
                  nop
                  nop
                  fsgnjn.s     fs4, fa6, ft7
                  rem          s7, t5, s3
                  sll          t3, a4, s2
                  slt          s2, s5, t5
                  fmul.s       ft10, ft1, ft9, rdn
                  nop
                  slti         s2, t1, 87
                  mulhsu       t4, s5, t1
                  addi         t6, t0, -602
                  slli         a5, t6, 22
                  srl          s4, t5, t6
                  flt.s        a5, fs8, ft9
                  sll          a5, s7, t0
                  fsqrt.s      fs1, fs7
                  fsub.s       ft11, ft9, fa6, rmm
                  div          s7, zero, a2
                  sub          t4, s9, t2
                  xori         s9, s3, 1894
                  fle.s        s8, ft3, fa2
                  ori          s6, a5, -1824
                  auipc        ra, 774230
                  divu         ra, sp, a1
                  fle.s        s7, fs5, ft7
                  remu         gp, s1, t6
                  sra          a1, s2, t1
                  and          s5, s8, a4
                  sra          s8, t5, t1
                  div          s4, tp, s4
                  sltu         a2, a0, a6
                  sub          t1, t1, a5
                  fsgnjn.s     fa0, fs11, ft8
                  nop
                  ori          s0, a3, 669
                  fdiv.s       fs3, fa4, fa5
                  nop
                  fsub.s       fs2, fs4, fs4
                  nop
                  fmax.s       fa0, fa4, fs1
                  fadd.s       fs8, fs2, fs1
                  rem          gp, t2, tp
                  sltu         a5, t3, a4
                  auipc        ra, 745008
                  fmin.s       ft8, ft11, fa2
                  and          gp, s11, zero
                  mulhsu       t1, s7, t6
                  sll          a0, t6, s5
                  remu         a2, s9, s8
                  feq.s        t2, ft7, fa2
                  nop
                  addi         t2, s11, -1657
                  fmin.s       ft10, ft5, fa3
                  fclass.s     t4, fs1
                  fclass.s     s5, ft2
                  fcvt.wu.s    a2, fa6, rup
                  fcvt.wu.s    s2, fa6, rne
                  addi         gp, s4, -228
                  flt.s        a2, fs5, ft2
                  fcvt.s.w     ft2, s8, rne
                  slt          tp, a5, t2
                  divu         zero, a6, t4
                  srl          s7, s2, a7
                  sra          zero, s0, s11
                  slti         a5, a1, -2033
                  fsgnjn.s     ft1, ft2, fs11
                  sltiu        gp, gp, 1526
                  nop
                  slli         s0, gp, 3
                  mulhu        s6, a2, s6
                  divu         s3, s9, a5
                  or           ra, a3, a0
                  xor          s0, s4, a7
                  fmul.s       fa0, ft0, ft9, rdn
                  remu         ra, t4, a6
                  slti         a1, a0, 79
                  lui          s9, 618891
                  addi         sp, a1, 187
                  fsqrt.s      fa3, ft11
                  addi         zero, sp, 1594
                  fcvt.s.w     fa3, t4
                  mul          s7, tp, t3
                  lui          s6, 184414
                  rem          a7, ra, zero
                  fmv.w.x      fs1, s6
                  andi         s5, t0, 1171
                  fmax.s       fs9, fs3, fa3
                  addi         s10, t1, 1351
                  fsqrt.s      ft6, fs3
                  fsqrt.s      ft5, ft7, rtz
                  mulhsu       t6, s1, a0
                  mulh         s0, s8, s10
                  remu         t3, t2, zero
                  fdiv.s       fa3, fs10, fs7
                  srli         s2, t4, 20
                  xori         a4, gp, -1408
                  mulhu        gp, t6, t4
                  xori         ra, zero, -561
                  fmul.s       fs5, fa7, fs2
                  fmv.x.w      s10, fs2
                  fmul.s       ft1, ft1, fs5, rtz
                  srai         t6, s11, 27
                  divu         s8, ra, s3
                  flt.s        s8, fa0, ft4
                  fcvt.wu.s    t5, fs5, rmm
                  slti         t2, t5, 1976
                  mulhu        t2, s4, zero
                  divu         a1, a7, a7
                  andi         zero, t3, 1842
                  slli         zero, a2, 0
                  srl          a4, s5, s5
                  mulh         a5, a7, a6
                  fsgnjx.s     fa0, ft1, fa1
                  fmin.s       ft7, fa2, ft4
                  fcvt.s.wu    fs10, s10, rup
                  fcvt.s.w     fa7, s2
                  fsgnjn.s     fs11, fs4, ft6
                  fsgnj.s      fa2, fa0, fa7
                  auipc        s0, 914792
                  xori         a4, t5, 1655
                  sub          t1, s11, t3
                  mul          s7, s3, a1
                  nop
                  auipc        ra, 134475
                  fmax.s       ft6, ft10, fa5
                  and          a7, s11, zero
                  lui          sp, 358541
                  and          gp, s6, t1
                  fdiv.s       ft10, fs7, fs2, rup
                  auipc        s10, 172207
                  mulhu        s2, s5, a7
                  fcvt.wu.s    tp, ft10, rtz
                  rem          s8, s11, tp
                  sltu         s7, t5, a6
                  flt.s        a7, ft10, fa6
                  lui          zero, 927841
                  fsgnj.s      fa6, ft5, fa5
                  divu         s3, a2, t4
                  fmv.w.x      fa2, s11
                  fclass.s     zero, fa0
                  div          s7, t5, s8
                  fmul.s       fs9, ft7, ft7, rmm
                  ori          a0, s0, -1119
                  flt.s        a5, ft6, fs10
                  sra          ra, s4, tp
                  fcvt.wu.s    a4, ft10, rdn
                  fcvt.w.s     sp, fs8
                  ori          a3, s2, 1752
                  fsqrt.s      fs4, fa3
                  mulhu        s3, s1, s7
                  srli         a3, s0, 9
                  slli         s1, a7, 14
                  sub          t4, t3, s7
                  ori          s0, s10, 1614
                  fadd.s       fs3, fs6, ft11
                  sra          a2, s2, t3
                  remu         tp, s11, t1
                  addi         t6, t2, 1194
                  lui          a7, 46052
                  fmin.s       ft11, fs10, ft4
                  xor          a3, s9, s6
                  auipc        gp, 887918
                  lui          sp, 3657
                  mul          a5, t6, sp
                  nop
                  divu         a5, s5, zero
                  fsgnj.s      fs3, fa1, ft2
                  addi         sp, t3, 647
                  fsgnjn.s     fs8, fa5, fa5
                  fsgnjx.s     fs5, fs10, fa7
                  slt          s7, a0, s11
                  lui          a3, 577206
                  fadd.s       ft6, fs0, fs11, rne
                  sltu         s10, a5, a5
                  fcvt.s.wu    fa6, s5
                  fcvt.w.s     s3, fa2, rup
                  sll          gp, zero, s11
                  fcvt.s.w     fa4, t2, rup
                  slt          a3, tp, t6
                  mulh         t2, gp, s4
                  fsgnjn.s     ft2, fa2, ft11
                  slti         a1, a3, -666
                  mulh         zero, t2, s9
                  ori          s2, s6, -662
                  fmin.s       fs4, fs3, fs11
                  srai         a7, zero, 17
                  fmax.s       fs3, fs11, ft3
                  srli         a4, t2, 26
                  mulhsu       s1, s6, s3
                  fmv.x.w      s6, ft11
                  sub          s5, s1, t2
                  mulh         s7, a2, t4
                  div          gp, s10, ra
                  fcvt.wu.s    tp, ft8, rmm
                  fcvt.wu.s    s0, fa3
                  feq.s        s10, fs2, fs10
                  slt          s6, t3, a7
                  mul          a1, s3, s5
                  fsgnjn.s     fs2, fs6, ft0
                  fsub.s       ft2, ft11, ft2, rmm
                  fle.s        t6, ft0, fa2
                  fadd.s       fs0, ft8, fa0, rdn
                  or           s2, s4, t0
                  and          s7, a0, a2
                  auipc        s9, 393730
                  sra          s6, t4, t5
                  add          t3, s8, t0
                  sra          a0, a4, a5
                  slli         t6, t3, 24
                  fcvt.wu.s    t2, fa0, rmm
                  fmin.s       fs8, ft5, fa4
                  fle.s        s9, fs10, ft6
                  srli         s6, t6, 0
                  fsgnjn.s     fs8, ft7, fs9
                  srl          gp, t5, t6
                  fmul.s       ft9, fs2, ft4, rne
                  mulhsu       s4, a0, t4
                  or           t1, a5, t6
                  fmin.s       ft6, ft11, ft8
                  rem          s0, s6, a2
                  fadd.s       ft9, fs1, fa3, rtz
                  sll          a0, a1, t2
                  fmax.s       fs2, fs7, fs0
                  auipc        a2, 996289
                  addi         a2, a3, -1751
                  mulh         s9, gp, s2
                  feq.s        t6, ft11, ft4
                  sll          a0, a3, s3
                  ori          sp, t3, -2001
                  mulhsu       a5, zero, s3
                  or           s7, t0, a3
                  sra          s7, t6, sp
                  fsgnjx.s     fs7, fs7, fs5
                  fcvt.w.s     t1, fa0
                  and          sp, s4, a3
                  fcvt.w.s     a1, fa7
                  and          s5, gp, s11
                  or           a5, a3, t6
                  add          s4, s8, s5
                  slti         a3, t2, -1262
                  nop
                  rem          t1, s6, s11
                  sll          s2, t2, a1
                  fsgnjx.s     fs6, fs6, fs7
                  srli         s2, tp, 4
                  mulh         s10, s3, t2
                  lui          s10, 809560
                  mulhsu       s9, t6, s11
                  fcvt.wu.s    s2, fs6
                  srl          s1, s6, a4
                  fcvt.wu.s    zero, fa3, rup
                  sll          a5, s5, a6
                  ori          t5, a2, -1688
                  slt          s7, s6, a4
                  fcvt.wu.s    a3, fs4
                  fdiv.s       ft8, fa7, fa0, rup
                  fadd.s       fa0, fa1, fa0
                  fmv.x.w      s4, fa6
                  xor          s8, a4, a2
                  mulhsu       tp, a2, s10
                  add          t1, t2, gp
                  lui          a4, 513080
                  fcvt.wu.s    zero, fs5, rdn
                  slti         s6, s7, -711
                  fcvt.s.w     ft6, a1
                  mulhu        t6, t0, zero
                  xori         t2, s11, 1024
                  lui          t5, 972103
                  fle.s        s2, fa4, fa0
                  fmv.x.w      s3, fa3
                  flt.s        a2, ft1, ft9
                  fcvt.s.wu    ft2, a3, rdn
                  fclass.s     t2, ft7
                  sll          s0, t5, t3
                  fmv.w.x      fa7, gp
                  slli         s6, s11, 10
                  mul          gp, a5, s2
                  srli         a0, tp, 18
                  mulh         zero, ra, a3
                  mulh         s3, t0, a5
                  andi         s5, zero, 15
                  addi         t2, s2, -1763
                  fcvt.s.wu    fa6, t4
                  fadd.s       ft9, ft1, ft11
                  sll          zero, s9, s8
                  fmul.s       fs2, ft4, fs4, rtz
                  slti         a5, zero, -992
                  fdiv.s       fa2, fa6, ft7
                  srli         a4, a1, 9
                  fdiv.s       ft8, fs8, fa2
                  fcvt.wu.s    zero, ft0, rne
                  remu         s2, a5, a0
                  slti         t2, a1, 1812
                  fsub.s       fs6, ft9, fs1, rtz
                  xor          s5, tp, zero
                  fcvt.s.wu    fs6, s11, rmm
                  fle.s        a3, ft8, ft1
                  fcvt.wu.s    t5, fa5
                  and          s3, s2, s3
                  div          a1, a3, s11
                  slti         s0, s0, -580
                  addi         a7, ra, -214
                  fmul.s       fs8, fs8, fs10, rdn
                  fsgnjn.s     fa1, fs7, fa4
                  fsub.s       ft7, fa3, ft1
                  fdiv.s       fs7, ft9, fa1, rne
                  fmax.s       fa3, fs1, fs0
                  xor          t6, s2, t1
                  fmv.w.x      ft4, s1
                  nop
                  fclass.s     s8, fs2
                  fsgnjn.s     fs0, fs0, fs5
                  fclass.s     t2, ft11
                  sltiu        s0, s1, 212
                  mulh         a7, s11, gp
                  feq.s        a2, ft10, ft8
                  remu         t3, a1, gp
                  fsub.s       fs10, fa2, ft9, rne
                  or           a0, zero, a4
                  divu         t3, s7, ra
                  and          a3, a0, tp
                  fmax.s       fa0, fs8, ft9
                  feq.s        s7, ft6, ft1
                  srai         s10, sp, 28
                  or           s10, t3, t4
                  mulhsu       t3, t3, s7
                  sra          a2, t6, a3
                  rem          ra, t6, a0
                  fcvt.s.wu    fs1, gp, rmm
                  lui          a5, 617740
                  sra          t1, s6, tp
                  ori          s10, t1, -836
                  slli         s5, s10, 12
                  xor          s10, t0, s9
                  srai         a4, s4, 24
                  div          t6, a0, a3
                  xori         a2, s4, 956
                  ori          a5, a7, 1308
                  sltu         a5, s5, a5
                  fdiv.s       fs2, fs6, fs2, rne
                  rem          s3, s9, s2
                  fcvt.wu.s    t4, ft11, rtz
                  feq.s        s6, fa6, ft2
                  sra          t2, t2, s2
                  and          s8, s7, t6
                  sra          s7, s3, s4
                  fcvt.w.s     s6, fs0
                  slt          s8, s2, s3
                  fcvt.s.w     fs10, s0
                  sll          s0, t1, t6
                  xori         s0, sp, -1724
                  add          ra, tp, zero
                  sra          a7, s7, t1
                  fmv.x.w      s8, fs6
                  sll          ra, t5, s2
                  mulhu        s10, t2, t6
                  slt          a7, a7, a3
                  auipc        s8, 857589
                  srai         s1, a5, 2
                  addi         ra, a4, 1911
                  remu         s0, tp, a1
                  fmv.x.w      t6, ft8
                  fcvt.w.s     a4, fs3
                  auipc        s0, 271982
                  mulhsu       t4, s3, s6
                  fsub.s       ft7, fa4, fa6, rdn
                  mulhsu       s5, s7, t1
                  andi         s8, t3, -114
                  fcvt.s.w     fs6, sp, rdn
                  nop
                  mulh         t1, s7, t0
                  add          s2, a1, s7
                  sltu         a4, ra, t3
                  fadd.s       fa3, fs0, ft9, rmm
                  mulh         s3, s7, t2
                  fmul.s       fs8, fa3, fa0
                  ori          a5, t1, 1702
                  slt          gp, gp, a2
                  slt          a0, t2, s0
                  fsub.s       ft4, ft0, fs5, rmm
                  addi         gp, a1, 1503
                  xor          a5, a5, s7
                  mul          s7, a3, a5
                  fmul.s       ft8, fs6, fs4
                  srl          s0, tp, tp
                  mulh         a4, s8, t3
                  auipc        t4, 183947
                  fsgnjx.s     fs6, ft9, fa1
                  or           sp, s7, s4
                  fcvt.s.wu    fa7, gp, rup
                  or           t1, t0, tp
                  or           a4, a2, t6
                  lui          a2, 373860
                  slt          sp, s7, gp
                  fsgnjx.s     ft2, fa1, fs7
                  divu         s9, s2, t2
                  fcvt.s.w     fs6, t5
                  and          ra, a0, t0
                  fle.s        gp, fs11, ft1
                  rem          s6, sp, sp
                  lui          s4, 853362
                  fclass.s     t4, fa5
                  rem          a0, t3, t2
                  sltiu        sp, a5, 1299
                  addi         a2, zero, 1724
                  slt          s4, a2, s1
                  fcvt.s.w     fs2, a2, rdn
                  or           s6, s4, t3
                  fsub.s       ft9, fs11, ft4
                  fle.s        s0, fs7, fs4
                  mulh         a5, tp, a1
                  slli         a4, a2, 31
                  mulhu        a3, zero, s9
                  nop
                  fmin.s       fs5, fa7, fs3
                  ori          a2, zero, 1491
                  mulh         ra, s6, s10
                  fmv.x.w      a7, fa2
                  mul          s8, s7, s0
                  div          zero, s4, a0
                  mul          a0, ra, t4
                  andi         s7, s3, 1572
                  fcvt.s.w     ft0, s6
                  slli         s3, t3, 12
                  mulhu        t6, t3, s0
                  divu         t6, s5, s11
                  fcvt.s.w     ft11, a7
                  fsgnj.s      fa7, fs7, ft2
                  lui          sp, 253707
                  fsgnjn.s     ft3, fs1, ft9
                  rem          a1, s4, a2
                  remu         s0, tp, s8
                  fsgnjn.s     fs3, fa6, fa5
                  slti         s5, t6, -902
                  mulhsu       s2, s1, t2
                  and          t6, a3, t4
                  fclass.s     t6, fa5
                  remu         s3, s5, a6
                  remu         s5, s7, a3
                  addi         s3, s1, -1616
                  or           t6, a3, tp
                  fmax.s       ft5, ft3, ft0
                  fle.s        a5, ft1, ft0
                  fsqrt.s      fs7, ft2
                  mulhsu       zero, s6, a2
                  sll          s0, s9, s11
                  addi         t2, a5, 90
                  fsqrt.s      ft11, fs9
                  fcvt.s.w     ft6, ra, rdn
                  fsgnjn.s     fa3, fs3, fa7
                  and          s9, s10, t3
                  fsqrt.s      fs8, fs10, rne
                  fsgnjn.s     ft6, fs5, fs1
                  and          s5, t6, a5
                  fcvt.s.w     fs10, a6, rne
                  fmax.s       ft8, ft2, fs4
                  fmax.s       fs9, fs4, fa0
                  ori          s0, a3, 253
                  ori          t4, a5, 432
                  sub          a0, t3, s7
                  sltiu        s7, a5, -802
                  addi         s3, a0, -1258
                  fle.s        s4, fs2, fs9
                  fsgnjx.s     fs9, ft2, fs5
                  sltiu        a1, s8, -1548
                  fsub.s       ft8, fa2, fa2
                  fdiv.s       fa4, ft2, ft11, rup
                  and          tp, a3, t4
                  flt.s        s0, ft2, ft6
                  fmul.s       fa6, fa7, fa5, rne
                  flt.s        t4, fs2, ft9
                  rem          s4, t1, a2
                  fcvt.s.w     fs4, sp, rne
                  divu         t2, a3, t0
                  fcvt.s.wu    ft2, s11, rne
                  nop
                  ori          s5, s9, 1101
                  mulhsu       t3, s6, t5
                  fsgnjn.s     fs5, fs0, ft0
                  sltiu        a7, a7, 100
                  fmv.w.x      fs7, s3
                  sub          a4, a2, s6
                  lui          t3, 982695
                  lui          s4, 392143
                  mul          t2, sp, a4
                  xor          a2, s8, t3
                  srl          t4, tp, a0
                  fmax.s       fs11, fs10, fa2
                  xor          s10, s5, s2
                  fdiv.s       ft5, fs10, fs4, rup
                  andi         a4, ra, 1459
                  ori          a3, s2, -1883
                  flt.s        tp, fs0, ft9
                  sub          t6, t4, a6
                  ori          s5, t6, -1723
                  fmax.s       fa5, fa4, ft8
                  mulhu        gp, s0, a5
                  fcvt.s.wu    ft5, s9
                  fcvt.w.s     s1, ft10
                  fcvt.s.w     fs11, sp, rtz
                  div          t1, a2, t4
                  fmax.s       ft6, ft5, ft2
                  slt          s8, s2, a4
                  fsgnjx.s     ft10, fa1, ft3
                  fcvt.w.s     a7, fs0
                  xor          t4, s9, t3
                  rem          s0, a5, s11
                  sltu         tp, s6, a5
                  nop
                  fcvt.w.s     s9, ft5
                  sub          s1, zero, t6
                  fsgnjn.s     fs3, fs1, ft9
                  xor          t3, s10, a6
                  slti         s7, ra, 405
                  slt          s9, t4, s4
                  mulhsu       s9, s0, a0
                  slt          s10, t6, s0
                  sub          a3, s0, t3
                  fsgnjn.s     fs0, fs3, fs4
                  sub          t4, t0, s10
                  fsgnjx.s     fs10, ft1, fa5
                  sll          zero, t2, sp
                  slli         a5, s4, 19
                  sltu         a1, s10, s1
                  fmv.x.w      a1, fs9
                  fmul.s       fs11, fa2, fa0
                  srai         a0, a1, 0
                  srli         ra, s3, 9
                  fadd.s       ft0, ft8, ft11, rdn
                  remu         t4, s6, ra
                  fcvt.w.s     a0, fs8
                  fmul.s       fs5, fa6, fs3
                  fadd.s       fa7, ft2, fa2, rmm
                  fcvt.w.s     a1, fa5
                  sll          a0, s4, t5
                  sll          a2, a6, t0
                  mulhsu       s2, s6, a0
                  srl          s7, t0, s6
                  divu         t1, s5, s3
                  fsqrt.s      ft8, fa5, rmm
                  sra          s7, s0, t0
                  or           t6, t2, a0
                  rem          t4, t0, s11
                  rem          s7, a4, gp
                  rem          s6, t4, s0
                  nop
                  slti         zero, s11, -966
                  fcvt.w.s     s8, fa3, rne
                  mul          s2, a6, t1
                  slti         ra, s4, 611
                  srli         t4, t4, 20
                  remu         s9, gp, s8
                  mulhu        s5, a2, gp
                  auipc        gp, 403690
                  rem          t2, a0, t3
                  fsqrt.s      ft10, ft3, rtz
                  and          s9, s10, s2
                  sub          tp, s6, s10
                  feq.s        a4, fa2, fa6
                  fclass.s     s2, ft11
                  fclass.s     s3, fs9
                  fmin.s       fa3, ft8, fa6
                  mulhsu       s1, zero, tp
                  fsgnjx.s     ft4, fs2, fa1
                  sll          t5, s3, s9
                  srai         gp, gp, 11
                  fsqrt.s      ft10, fs0, rne
                  mulh         s2, a7, s0
                  sra          s4, a0, s9
                  xor          a1, s3, s2
                  lui          s3, 312067
                  fcvt.s.wu    fa7, a4
                  srl          a3, s7, t2
                  fcvt.wu.s    s2, ft4
                  remu         a5, t0, t6
                  fsqrt.s      ft5, fs5
                  and          gp, s11, gp
                  srai         a2, t0, 23
                  nop
                  xor          s9, a3, s4
                  srai         ra, sp, 28
                  rem          s1, t3, s6
                  fsqrt.s      fa3, ft8, rne
                  fcvt.s.w     ft5, a3, rmm
                  srai         s4, s1, 7
                  fcvt.wu.s    gp, ft5, rtz
                  divu         s1, s10, gp
                  fsub.s       ft6, fs7, fs1
                  mulh         a7, s6, gp
                  fcvt.wu.s    t5, ft11
                  feq.s        s4, fa0, fa3
                  mulh         s4, s7, t1
                  mulhsu       a4, t4, t6
                  fsgnjn.s     fs9, fa5, ft5
                  xori         t5, t0, 192
                  fmin.s       ft10, ft0, fs5
                  fmv.x.w      s7, fs1
                  xor          a4, t5, s9
                  mulhsu       s6, a1, s2
                  divu         s4, t6, t0
                  feq.s        s0, fs8, fs7
                  fcvt.s.wu    ft2, t4, rtz
                  remu         s5, s1, t4
                  ori          s6, a1, -1798
                  fsgnj.s      fa4, fs5, fa4
                  addi         a1, s10, 1098
                  sub          a7, s11, s0
                  slt          s9, s7, zero
                  fsub.s       fs0, ft3, ft8, rtz
                  fle.s        s0, fa5, ft6
                  fsgnjn.s     fa7, ft3, fa3
                  srl          gp, a5, t0
                  fsgnjn.s     ft8, ft9, fs10
                  or           zero, a2, s3
                  mulh         s10, s8, a6
                  fcvt.s.wu    fs8, s5
                  sll          s2, t4, t6
                  slti         sp, a1, 219
                  mulhu        s5, s4, s2
                  flt.s        s3, fa1, fs9
                  slt          s2, a2, a7
                  fsqrt.s      ft10, fs10
                  mulh         a4, sp, gp
                  fsgnjx.s     fa7, fs9, ft0
                  lui          sp, 359712
                  sll          t6, a0, s6
                  srli         a5, s3, 3
                  mulh         s9, ra, s5
                  addi         ra, a6, 1635
                  fmul.s       fa0, fs10, fs5, rdn
                  fclass.s     t5, ft10
                  fcvt.wu.s    s2, fs5
                  lui          s9, 317420
                  fcvt.s.wu    ft2, s1
                  rem          t1, ra, t1
                  fmv.w.x      ft9, sp
                  feq.s        gp, fs1, fs3
                  flt.s        zero, fs3, ft2
                  fmv.w.x      fs7, t5
                  mul          t4, s11, a1
                  or           a1, s7, sp
                  fmv.w.x      fa2, a4
                  fmax.s       ft7, fa5, ft10
                  slt          ra, zero, a4
                  div          a4, tp, a0
                  xor          t6, s7, a7
                  fcvt.s.w     fa6, a2
                  fsgnj.s      ft6, fa7, fs5
                  fsqrt.s      fa0, ft11, rtz
                  or           s8, t6, a1
                  xori         s5, t1, -961
                  srli         s9, a5, 27
                  xori         gp, s4, -668
                  fdiv.s       ft5, fs1, ft10, rne
                  fsqrt.s      ft0, fs0
                  fsgnj.s      ft7, fs7, fs10
                  fmv.x.w      s1, fa2
                  fmul.s       ft2, fa7, fs3, rdn
                  andi         ra, s11, 735
                  fclass.s     zero, ft8
                  andi         s7, s8, 800
                  sub          t4, s8, s3
                  mulh         a2, s3, s11
                  mulh         s8, s11, t2
                  fmul.s       fs8, fa2, fs11, rtz
                  fmv.w.x      fs3, a0
                  sltu         zero, tp, s3
                  fmul.s       fa5, ft3, ft4
                  auipc        t3, 831368
                  andi         a3, a1, -511
                  flt.s        t4, ft6, ft9
                  sltu         a5, s4, s1
                  slli         a5, s9, 31
                  mulh         ra, s7, s11
                  mulhsu       ra, s4, t3
                  fmv.w.x      fa4, s10
                  sra          s3, s9, a6
                  srli         s9, a6, 0
                  sra          a5, t0, s0
                  rem          t1, s8, ra
                  srl          a3, a3, t1
                  srli         t4, a3, 14
                  fsgnjn.s     fs1, fs0, ft0
                  fsgnjx.s     fa2, ft8, ft9
                  fle.s        ra, ft8, fa1
                  slt          t4, gp, t4
                  rem          s2, a2, t0
                  addi         t5, zero, 876
                  fmv.w.x      ft3, s5
                  or           sp, a3, s10
                  div          s4, s0, s0
                  fsgnjn.s     fs10, fs1, ft10
                  fdiv.s       fs2, fa0, fa4
                  fmv.x.w      sp, ft8
                  and          s2, tp, gp
                  lui          s5, 593899
                  fdiv.s       fs0, fs5, fs1, rmm
                  fcvt.wu.s    a4, fa5
                  auipc        s6, 700570
                  fsgnjn.s     ft3, ft6, fa3
                  srai         s6, t6, 23
                  sub          s9, s2, s2
                  fdiv.s       ft4, fs7, fs2, rne
                  srai         gp, zero, 25
                  fadd.s       ft6, ft9, fa6, rtz
                  fadd.s       fa5, ft2, fs7, rup
                  or           gp, a6, s2
                  fclass.s     a7, ft7
                  mulhsu       a5, a4, s3
                  fdiv.s       fs7, fa0, fa6, rup
                  or           a3, zero, s5
                  fmv.x.w      s5, ft2
                  fcvt.s.wu    ft1, a6, rdn
                  flt.s        zero, fs4, ft0
                  sltu         a5, s2, s2
                  sub          zero, zero, t0
                  fsqrt.s      ft4, ft9, rtz
                  divu         s1, s10, t3
                  rem          t1, t6, a7
                  slti         s9, s4, -714
                  rem          s0, a3, t5
                  srai         s3, a5, 16
                  fmax.s       fs5, ft1, ft8
                  fsgnj.s      fs5, ft11, fs10
                  addi         ra, a4, -1238
                  fmv.x.w      s2, fs6
                  andi         tp, a0, -39
                  fsqrt.s      fs11, ft10, rup
                  fmin.s       fs10, ft4, fs2
                  fsqrt.s      ft6, fs4, rtz
                  fsgnjn.s     fs1, fs9, fa4
                  sltiu        a5, t1, -329
                  fmin.s       ft11, fa5, fs2
                  add          s10, t1, t5
                  fsgnjn.s     ft8, ft8, fs5
                  srli         s4, sp, 20
                  fcvt.s.wu    ft11, tp, rtz
                  fmv.w.x      fs8, zero
                  rem          a3, t6, s7
                  fclass.s     s7, ft4
                  fle.s        s8, ft10, ft10
                  andi         a0, t5, 1285
                  flt.s        sp, ft0, fa0
                  fsgnjn.s     ft2, ft10, fs0
                  fle.s        gp, fa7, fa3
                  mulhsu       t6, t2, s0
                  fclass.s     s7, fa7
                  divu         a1, t6, s1
                  fsqrt.s      ft7, ft9, rdn
                  fcvt.s.wu    ft4, t6, rtz
                  divu         s4, a4, s8
                  or           gp, s5, zero
                  fcvt.s.w     fa7, s0
                  auipc        s6, 960919
                  divu         zero, a4, s3
                  flt.s        s1, fa1, fs0
                  xor          t5, t3, t0
                  fsub.s       fs3, fs9, fa0, rne
                  addi         t6, s0, 1069
                  srli         s10, t5, 31
                  slt          s1, a6, tp
                  slt          t3, a2, s2
                  fmul.s       ft5, fs3, fa7
                  sub          zero, gp, tp
                  divu         s7, a5, t1
                  fsgnj.s      ft2, fs3, fs7
                  and          s10, a3, s11
                  add          s8, a2, t0
                  fsqrt.s      fs4, fs4
                  mulhu        a1, ra, a4
                  andi         a5, a1, -504
                  sll          s1, s9, gp
                  sub          s6, s2, a3
                  fle.s        s4, fa4, fs1
                  nop
                  rem          t5, s10, s1
                  mulhsu       a2, a3, s3
                  slti         a5, s11, -1515
                  slt          s8, s7, s0
                  srai         a3, sp, 8
                  rem          s8, t3, s0
                  lui          a5, 762334
                  lui          s8, 907612
                  fadd.s       fa3, fs2, ft7
                  flt.s        s3, ft7, fs9
                  slti         a7, a0, 1038
                  fmax.s       ft9, fa7, fa0
                  fle.s        s3, fa3, fa3
                  addi         s1, a0, -1654
                  lui          s1, 420013
                  fsqrt.s      fs1, fa5
                  div          s3, t5, s9
                  fcvt.s.w     fa7, t1, rtz
                  fsgnj.s      fa3, fa4, ft5
                  fcvt.w.s     s2, ft4
                  srli         t6, t1, 21
                  add          s10, s0, s6
                  mulhsu       s7, a5, zero
                  xori         s9, t4, -379
                  fadd.s       ft9, ft5, fa5, rdn
                  lui          t5, 681295
                  fle.s        s9, fs8, fs8
                  feq.s        s0, ft9, ft7
                  sltu         t1, t1, s6
                  fadd.s       fs6, fa2, fs6
                  xori         zero, s9, 1014
                  fclass.s     a2, fa7
                  xor          s9, a6, a6
                  fle.s        zero, fa2, fs4
                  fmv.x.w      s4, fa5
                  andi         a3, s10, -1509
                  fsgnjn.s     fa1, fs2, fa5
                  div          s6, t5, tp
                  slli         a2, gp, 18
                  div          t1, s11, a5
                  fsqrt.s      ft7, fs6, rup
                  fmv.w.x      ft8, t2
                  fdiv.s       fs1, ft2, fs4
                  fle.s        gp, fs4, fs7
                  mulhu        s2, a0, a0
                  remu         a7, gp, zero
                  srai         s9, s10, 21
                  fmul.s       fa4, ft2, ft7
                  fmv.w.x      ft5, s0
                  mulh         s8, s0, sp
                  fsqrt.s      ft1, fa0
                  sltiu        s2, gp, -21
                  slli         s5, a0, 20
                  flt.s        sp, fs6, ft0
                  fclass.s     s7, fs2
                  fsgnjx.s     ft8, fs11, fs8
                  slti         sp, a6, -1734
                  nop
                  divu         s5, s8, t2
                  lui          s9, 917607
                  addi         s6, s4, 373
                  fmv.w.x      fs1, t4
                  fsgnj.s      fa4, fa0, ft10
                  sub          a5, a7, t3
                  div          tp, zero, t6
                  srli         gp, a7, 10
                  ori          s2, s2, 663
                  sub          t2, a7, ra
                  and          zero, s4, gp
                  sll          s0, s1, s2
                  fmv.w.x      fa4, ra
                  slli         s1, t3, 27
                  auipc        t3, 244887
                  srl          gp, s3, t1
                  slti         s10, a4, -395
                  nop
                  addi         t6, s3, 2021
                  fle.s        s6, fs4, ft10
                  fmax.s       fs0, ft8, fa6
                  add          s10, a3, a2
                  mulhu        s7, t5, ra
                  fdiv.s       fa0, ft0, ft1, rdn
                  fmv.x.w      s5, fs5
                  remu         a4, t4, t3
                  mul          s4, gp, t6
                  fsub.s       ft10, ft0, ft11, rtz
                  fmin.s       fa6, fs0, fs2
                  or           a2, s5, a2
                  flt.s        s3, fs5, fs4
                  flt.s        s0, ft1, ft11
                  add          gp, s1, s7
                  fcvt.w.s     a2, fs3
                  fclass.s     a1, fa6
                  fmax.s       ft10, fa1, fa4
                  slti         a5, gp, 1812
                  fclass.s     s1, fa6
                  fsub.s       ft9, fs11, fa4, rne
                  rem          t5, a3, t6
                  mulhsu       s1, t1, s9
                  fmv.w.x      fs2, s0
                  fsqrt.s      fs11, ft11, rne
                  div          s8, s3, s8
                  fmv.x.w      ra, fa5
                  or           s6, a0, a4
                  addi         t3, tp, -1446
                  lui          s2, 29766
                  or           t5, a5, sp
                  srl          t3, a1, s8
                  and          t1, a3, t5
                  sltiu        gp, a5, 1567
                  andi         s1, s1, 1918
                  fsgnjx.s     fa4, ft6, ft3
                  fsqrt.s      fa1, ft9, rmm
                  ori          t2, a2, -1094
                  addi         t2, tp, -698
                  fmax.s       ft9, ft0, fs10
                  sltu         s8, a4, s4
                  divu         s2, s0, t1
                  flt.s        s8, ft6, fs6
                  fsgnjn.s     fa2, ft10, ft9
                  mulh         s5, t4, s11
                  fsgnj.s      ft5, ft9, ft5
                  or           a0, zero, s5
                  rem          s4, s4, a7
                  mulh         a3, t4, t2
                  sub          a7, s8, t4
                  fle.s        s10, ft5, fs1
                  mulh         sp, gp, s10
                  fsqrt.s      fa6, ft9
                  mulhu        sp, zero, t3
                  rem          a7, t4, s0
                  and          s1, gp, s11
                  or           t3, gp, s11
                  fcvt.s.wu    ft10, zero
                  fmax.s       fa5, fa4, fa2
                  fmin.s       fs0, fs8, fs5
                  fmax.s       ft8, fs0, fa7
                  fadd.s       ft3, fa4, fs0, rmm
                  flt.s        t5, ft3, ft6
                  nop
                  sub          a2, s7, a2
                  fcvt.s.wu    fa0, s4, rup
                  fmv.w.x      fa4, s1
                  xor          ra, s9, t5
                  mulhsu       a3, a1, a5
                  rem          t1, t2, t4
                  nop
                  andi         t3, a7, 952
                  slt          a4, a1, s7
                  fcvt.s.wu    ft5, gp, rup
                  fsqrt.s      ft10, fa3
                  addi         a7, t6, 253
                  rem          s5, t2, t6
                  sub          s1, s3, s1
                  fmin.s       ft10, fa1, ft1
                  sltiu        tp, s1, 1039
                  slti         a1, t4, 1059
                  addi         t2, sp, -1758
                  fmv.w.x      fs5, t6
                  divu         s10, s7, t3
                  slli         tp, a2, 8
                  lui          tp, 655449
                  fclass.s     a3, ft9
                  fcvt.s.w     ft2, s9
                  add          ra, t4, t3
                  fsgnjx.s     fa2, fs4, fs3
                  mulhsu       t3, s8, s3
                  xor          s3, a2, tp
                  sra          a0, t4, gp
                  rem          s1, a7, a4
                  fdiv.s       ft4, fa3, fs11
                  fclass.s     s1, fa7
                  srai         t6, t2, 29
                  lui          s5, 397134
                  div          a7, a5, a4
                  rem          s0, s6, t1
                  feq.s        tp, ft6, fs3
                  fcvt.s.wu    fa0, s7
                  xor          sp, t4, zero
                  fsgnjx.s     fs5, ft1, fa3
                  fsgnjx.s     ft9, fa7, fs4
                  and          a4, s11, a0
                  div          s2, s0, s7
                  fmin.s       ft0, ft11, fa0
                  mulhu        s1, t5, a7
                  srli         t2, t0, 28
                  srli         s2, s3, 24
                  addi         a2, s3, 650
                  fsgnjx.s     ft6, fs11, ft8
                  fmv.x.w      sp, ft0
                  auipc        s4, 76807
                  feq.s        a4, fs3, fs5
                  lui          a0, 614643
                  slli         ra, a6, 3
                  flt.s        a2, fs4, fs0
                  fdiv.s       fs3, fs3, fa4
                  srli         t2, s3, 7
                  sltu         s9, ra, a0
                  fle.s        t4, fs6, fa6
                  srli         s6, a0, 28
                  mulh         zero, s2, a7
                  fsgnjx.s     fs4, fa2, ft3
                  fsub.s       fs11, fs8, fa1
                  div          zero, s11, s4
                  fdiv.s       fa5, fs9, fs11
                  fcvt.s.w     ft10, t0, rup
                  slli         a5, a5, 11
                  sltu         gp, a7, s10
                  or           s9, s9, s4
                  mulhsu       s9, t6, s0
                  fcvt.w.s     ra, ft2
                  fadd.s       fs2, ft8, fs7
                  rem          ra, s2, s2
                  fsqrt.s      fs8, ft9
                  fadd.s       ft7, fs6, ft10, rmm
                  sra          ra, a1, t6
                  fcvt.wu.s    s0, ft6, rtz
                  fcvt.s.w     fs8, t4, rdn
                  fclass.s     a5, fs2
                  fsqrt.s      ft1, ft6
                  srli         t6, t6, 6
                  nop
                  auipc        a5, 367363
                  addi         s3, tp, 457
                  fsgnjx.s     fs4, fs1, fa5
                  addi         t4, a1, -978
                  divu         s9, s8, zero
                  andi         t1, s7, -527
                  xori         t1, s3, 1660
                  fsgnjn.s     fs7, fa6, ft10
                  xori         a1, s8, 951
                  fdiv.s       ft9, ft5, fa5
                  sra          zero, a0, a0
                  flt.s        t3, fa3, ft4
                  sltiu        t6, t4, -925
                  fdiv.s       ft1, fa2, ft4
                  fdiv.s       ft9, ft0, ft8
                  divu         tp, a7, s8
                  and          t2, a3, s1
                  fmin.s       fa1, fa1, ft5
                  fmv.w.x      fs2, gp
                  fdiv.s       ft1, ft3, fa4
                  xor          a3, s4, a7
                  srli         t5, s2, 21
                  rem          s4, s9, gp
                  addi         s9, a2, 1994
                  mulhu        t6, t4, a7
                  fcvt.w.s     s8, fa3, rdn
                  fcvt.w.s     t6, fa2
                  nop
                  fsgnj.s      fa7, fa3, fa1
                  mulh         t6, s2, a0
                  remu         s5, s8, a5
                  fle.s        s3, ft7, ft3
                  fsgnjn.s     ft3, fs11, ft5
                  fmv.w.x      fs9, a1
                  sll          s8, s5, s10
                  srai         a0, s10, 21
                  addi         s5, s8, 586
                  fmv.w.x      fa6, zero
                  flt.s        s9, fa1, fa6
                  srai         tp, s8, 3
                  fcvt.s.w     fs1, t0
                  mulhsu       s3, s5, a6
                  flt.s        t6, fs8, fa5
                  fmv.x.w      s10, ft11
                  fsub.s       fs1, fs9, ft0, rdn
                  fmv.x.w      ra, ft10
                  fsgnjn.s     ft10, fa7, fa2
                  slt          s6, sp, s8
                  div          a3, s2, a6
                  slti         t2, t2, 581
                  mulhu        s0, sp, sp
                  add          t2, t0, tp
                  nop
                  xor          t1, t3, s0
                  mulhu        s7, s5, t3
                  sub          s1, s8, t3
                  fcvt.w.s     s5, fa0, rmm
                  fle.s        s3, fs8, fs7
                  slt          s5, t1, a4
                  slt          s8, s7, tp
                  mulhu        t2, sp, a6
                  fsgnjx.s     fa6, fs1, fs11
                  fsgnjn.s     fa1, ft11, fs10
                  lui          s0, 1041185
                  andi         a2, a3, 2014
                  addi         a1, s9, 622
                  fcvt.s.w     fs6, t0, rne
                  srli         s4, a4, 19
                  flt.s        ra, fa6, ft4
                  slti         zero, t1, -1360
                  fsgnjx.s     ft10, ft11, fs2
                  sltu         t2, s11, a6
                  xori         a7, a1, -1544
                  fcvt.wu.s    s1, fs7, rtz
                  srl          s4, ra, s4
                  flt.s        a3, fs7, fs0
                  fcvt.wu.s    t2, ft11
                  fsgnjn.s     ft11, fs0, fs3
                  ori          ra, s8, -1253
                  ori          a2, t2, -953
                  fcvt.s.w     fs6, zero, rtz
                  fcvt.s.w     fa3, s7
                  fcvt.s.w     fs10, a2, rup
                  fcvt.wu.s    a5, fa6, rne
                  andi         s8, s0, 312
                  ori          gp, s3, -302
                  fsub.s       ft7, ft1, ft10, rdn
                  slti         s1, s7, -1531
                  fmin.s       ft8, ft11, fs8
                  slti         tp, s11, -156
                  fsub.s       ft10, ft7, fa0
                  fdiv.s       fa0, fa4, fs8
                  srl          s4, a0, s1
                  sltiu        t2, a2, -794
                  srl          s5, s0, s9
                  fsgnj.s      fs5, fs3, fs2
                  mulh         tp, s3, s7
                  srai         a7, s11, 29
                  sll          s1, tp, s8
                  fadd.s       fa5, ft7, fs1, rup
                  fsgnjx.s     ft11, ft9, ft5
                  fclass.s     t6, fs3
                  add          s3, s1, s8
                  fsub.s       fs11, ft7, fs2
                  fclass.s     s1, fa0
                  mulh         s10, t4, a2
                  xor          s5, s1, tp
                  xor          t4, gp, t5
                  sra          s9, a4, t1
                  fclass.s     a4, fs11
                  fsgnj.s      ft0, fs10, ft4
                  fmv.w.x      fs7, ra
                  fcvt.wu.s    t6, ft8
                  fsgnjn.s     fa0, ft6, ft1
                  xori         t4, s5, 1154
                  fmul.s       fs10, fs6, fs1, rmm
                  fsub.s       fs4, fa2, fa5, rmm
                  auipc        s9, 30397
                  fsub.s       fa5, fa2, fs11
                  and          t4, t3, s5
                  sll          a7, s11, gp
                  fmin.s       fa1, ft11, ft11
                  xori         s9, t5, 579
                  fsgnj.s      fs10, fs1, fs7
                  auipc        tp, 174849
                  fcvt.s.wu    ft0, s8
                  fcvt.s.w     ft5, s8, rmm
                  fcvt.s.wu    fs10, s8
                  div          a1, s0, s4
                  fsgnjx.s     ft4, ft6, fs8
                  slt          s3, a2, a0
                  mulh         s10, s6, t1
                  sltiu        s8, s3, 246
                  fmv.w.x      fs5, t1
                  mulhu        gp, sp, zero
                  andi         t2, s9, 192
                  sub          t3, s6, s5
                  ori          tp, s8, 1986
                  slti         s2, s11, -1007
                  flt.s        s7, fa5, ft7
                  fcvt.s.wu    ft2, tp, rdn
                  nop
                  divu         gp, gp, s11
                  slli         s0, t5, 17
                  xori         s10, a7, -1545
                  flt.s        a5, fs6, fa2
                  fcvt.s.w     ft2, gp, rne
                  fcvt.w.s     zero, fa0
                  divu         s5, s3, tp
                  addi         s0, t1, 308
                  fadd.s       ft6, fs0, fs0, rtz
                  fcvt.s.wu    fs2, s0, rtz
                  fcvt.s.wu    ft5, t5
                  lui          s6, 445240
                  fclass.s     a7, fs8
                  sub          a5, s11, s1
                  feq.s        s3, fa1, fa2
                  xor          zero, t6, sp
                  div          sp, s8, t4
                  fdiv.s       ft0, ft10, ft4
                  fadd.s       fs1, ft1, ft1
                  fmul.s       ft10, ft11, fa2
                  fclass.s     ra, fs1
                  fsub.s       ft5, fa1, ft7, rtz
                  sub          a3, a3, a3
                  fmv.w.x      fa4, sp
                  fmv.x.w      a0, ft8
                  mul          a7, a0, a7
                  slt          a5, s3, gp
                  fle.s        s3, ft10, ft10
                  fclass.s     s7, fs0
                  fclass.s     a4, ft5
                  srli         s8, s2, 15
                  addi         gp, s8, 919
                  fdiv.s       ft2, ft9, ft4, rtz
                  sltu         a7, t6, a1
                  fcvt.wu.s    zero, fs7
                  fsgnjx.s     ft3, fs4, fs0
                  mulh         t5, s8, s7
                  or           t4, sp, s5
                  fcvt.wu.s    a7, ft1
                  divu         s9, t0, s2
                  srli         a2, a2, 6
                  fcvt.s.wu    fa6, tp, rdn
                  lui          s9, 941271
                  fcvt.wu.s    t3, fs4, rup
                  flt.s        s1, ft1, ft11
                  andi         tp, s9, -608
                  fsgnjn.s     fs11, fa1, ft10
                  sltiu        a0, a6, 882
                  sra          s9, a2, zero
                  fle.s        sp, fs5, ft4
                  ori          a0, tp, 659
                  fmax.s       fs2, fs10, ft1
                  sll          sp, t1, s2
                  andi         zero, t3, 551
                  fsub.s       fs11, ft6, ft0
                  fmax.s       fa5, fa6, ft2
                  div          zero, a3, t5
                  ori          s4, tp, 1245
                  fmv.w.x      ft6, zero
                  srl          t5, t5, s10
                  fmv.w.x      fs0, s8
                  fmax.s       fs11, fs10, ft1
                  fadd.s       fs3, ft8, fs2
                  fmv.x.w      t1, ft4
                  fmax.s       fa6, ft4, ft2
                  xori         a5, s6, 1104
                  remu         t4, t0, a2
                  fcvt.wu.s    s3, fs5
                  mulhsu       t3, a3, s2
                  fmax.s       fs11, fs0, fs10
                  rem          s6, t4, t6
                  flt.s        a4, ft9, fs2
                  fcvt.w.s     s0, fs7, rne
                  fmax.s       ft7, ft10, fa5
                  mul          s6, s4, s7
                  fmax.s       fs0, fa4, fa5
                  fmul.s       fs10, ft11, fs5
                  lui          a1, 873485
                  divu         t2, a5, t3
                  mulhu        a3, a7, a3
                  xori         sp, s2, 195
                  fmin.s       fs5, fs3, fa3
                  lui          s1, 121608
                  fclass.s     s2, fs10
                  xor          s4, s4, sp
                  sltiu        zero, s2, 1925
                  feq.s        s1, fs3, fs11
                  mulhsu       ra, a4, gp
                  srl          a4, t5, s2
                  ori          t4, s8, -1844
                  fsgnjn.s     ft11, fs6, fs11
                  mulhu        s8, sp, sp
                  fsgnjx.s     ft4, fs3, ft1
                  sra          ra, s5, t1
                  rem          s5, s3, a4
                  fmul.s       fa3, fa7, ft8
                  srl          t5, a5, s1
                  fclass.s     s0, ft11
                  sll          s3, zero, s11
                  fcvt.w.s     t6, ft10, rne
                  fsgnjn.s     fs3, ft9, fa7
                  slt          zero, s11, s4
                  slli         s0, a3, 21
                  div          s7, s2, a5
                  addi         s6, s2, 1305
                  fsgnjx.s     ft2, fs6, ft8
                  flt.s        t2, fa0, fa2
                  fsgnjx.s     fs2, fs11, fa2
                  remu         a2, s11, s2
                  and          zero, a5, s4
                  remu         a0, t0, s10
                  sltu         t6, a5, tp
                  mulhu        zero, a7, sp
                  or           s4, s5, a6
                  fclass.s     s10, fs7
                  remu         t5, a1, a5
                  auipc        t4, 323433
                  flt.s        t5, ft2, fa0
                  fmax.s       fs4, fs0, fs3
                  fsgnj.s      fa4, fa6, fs9
                  ori          s1, a5, 791
                  or           a3, s11, gp
                  mul          s3, s11, sp
                  srai         a3, tp, 1
                  xor          s0, s4, s1
                  fsgnj.s      fa7, ft1, fs9
                  ori          s0, s8, 767
                  fdiv.s       fs3, ft9, fs10, rmm
                  srai         s6, tp, 24
                  sra          t4, s1, a3
                  divu         a3, s3, t1
                  feq.s        ra, fa5, fs5
                  xori         s10, s7, -893
                  rem          s0, s10, t4
                  fsgnjn.s     ft0, ft10, fs5
                  ori          s9, a5, 1873
                  sltu         a1, a7, s6
                  slt          t2, s9, a3
                  lui          t2, 690071
                  andi         zero, a6, -601
                  sll          t1, a0, a2
                  fmax.s       fs7, fs2, ft10
                  fclass.s     ra, fs3
                  sub          a0, a5, a1
                  sub          zero, ra, a6
                  mul          a3, gp, gp
                  fmul.s       fa1, ft6, fs9, rdn
                  srl          t6, t3, s0
                  srli         s3, t0, 29
                  auipc        t1, 1034074
                  fsgnjx.s     fs4, ft2, ft4
                  sltiu        s1, t1, 1055
                  sra          s9, s3, a1
                  mulh         gp, t3, s1
                  fsgnj.s      fa5, ft1, ft11
                  fcvt.s.w     ft4, s11
                  flt.s        s0, fa2, ft6
                  addi         gp, t5, -947
                  sltu         s2, a4, a7
                  nop
                  ori          s1, s4, -1730
                  auipc        t2, 985101
                  fadd.s       fa3, fa0, ft2
                  srai         s7, a2, 30
                  slti         gp, s10, -1687
                  fcvt.s.wu    ft0, ra
                  sub          t4, t6, t6
                  feq.s        a3, ft0, fs3
                  sll          s0, s5, s9
                  fcvt.s.wu    fs6, a0
                  sltiu        s4, a0, 798
                  sltiu        a0, s5, -515
                  srl          ra, t6, t5
                  fmax.s       ft3, ft10, fs10
                  fdiv.s       fa3, ft11, fs7, rne
                  and          a3, s5, a7
                  slti         s10, t1, -1316
                  xor          s1, s8, t0
                  lui          s5, 372857
                  fmul.s       ft2, ft6, fs5, rne
                  divu         gp, t6, s9
                  fcvt.w.s     s0, fa2, rne
                  fcvt.s.w     fs9, zero
                  fmv.w.x      fs9, s0
                  add          a1, gp, zero
                  fsqrt.s      fa2, fs10, rup
                  mulh         s5, a7, s8
                  addi         t2, s11, -84
                  feq.s        a3, fa2, fa5
                  ori          t6, s7, -333
                  fmv.x.w      t4, ft8
                  sltiu        a0, s0, 396
                  mul          ra, t5, a6
                  div          s5, a2, sp
                  slti         s8, s1, -1403
                  mulh         zero, s0, t4
                  slli         a5, gp, 5
                  fmv.x.w      t2, fs9
                  fcvt.wu.s    s2, fs7
                  fmv.w.x      fs8, t3
                  addi         s10, s5, -637
                  xori         s4, s9, 727
                  fadd.s       ft9, ft5, fs9
                  lui          a3, 803371
                  and          s4, ra, t0
                  fsgnjn.s     fs7, ft8, fs8
                  rem          t1, gp, t3
                  fcvt.s.wu    fa4, t0, rtz
                  xori         t4, t4, 454
                  slti         s7, a4, -1068
                  fmin.s       ft1, fs5, ft0
                  flt.s        a1, ft6, fa7
                  sub          a7, t5, s6
                  mulhsu       s9, s2, a1
                  sub          s5, s0, s8
                  addi         s2, a1, -1776
                  fcvt.s.w     ft4, s3, rtz
                  fmv.w.x      ft8, zero
                  fmv.x.w      ra, fs1
                  auipc        s4, 174231
                  fsgnjx.s     fs10, ft6, ft6
                  sll          a7, s9, s5
                  slt          ra, a3, sp
                  fmv.w.x      fs6, s8
                  fcvt.s.wu    fs3, t0
                  mulhu        a4, s10, a4
                  fclass.s     s1, fa6
                  srli         s10, s2, 9
                  auipc        a0, 637964
                  fmv.x.w      a7, fs4
                  fsub.s       fs9, fa3, fs9, rdn
                  div          a4, s9, a1
                  fsgnjn.s     fs10, fa5, fs5
                  fmax.s       fs11, ft0, fs4
                  mulh         a3, s7, t0
                  fmul.s       ft7, fa5, fs1, rne
                  nop
                  feq.s        t1, ft11, fa1
                  fdiv.s       ft2, fa1, ft10
                  divu         a5, t2, s3
                  sltu         t6, a1, a1
                  fdiv.s       ft7, ft8, fa7, rdn
                  fsgnj.s      ft10, ft11, ft2
                  fsub.s       fs3, fs5, fa7, rtz
                  mulh         sp, a4, s0
                  add          s5, a6, s5
                  mulhsu       gp, t6, a3
                  fsqrt.s      ft9, ft0, rmm
                  fsqrt.s      fs8, fs11
                  mulhsu       s10, t2, ra
                  feq.s        s4, fa5, ft3
                  fsgnjn.s     fs5, fs9, ft2
                  fsgnjx.s     ft6, fs4, ft8
                  rem          s3, a3, ra
                  fle.s        t6, ft3, fs2
                  add          a4, t3, a3
                  fsgnjn.s     ft9, fs5, fa5
                  fmv.w.x      ft7, t1
                  addi         a0, t2, 1633
                  slti         a2, a7, 334
                  feq.s        a4, ft11, fs2
                  lui          t4, 726264
                  lui          t3, 601259
                  fsqrt.s      ft0, fa5, rdn
                  xori         t3, a0, -1121
                  ori          t3, t1, -751
                  fcvt.w.s     a3, ft4
                  mul          t5, t2, t3
                  sltiu        s2, t5, 1475
                  mulhu        zero, s1, t0
                  fsgnj.s      fs4, fs4, ft11
                  auipc        sp, 615847
                  fcvt.s.w     fs11, s3
                  xori         t3, s8, 1184
                  fdiv.s       fs8, fs4, fs2, rup
                  fmv.x.w      t4, fs4
                  mulhsu       s6, a4, a6
                  slt          a1, s2, t0
                  srai         s6, t1, 20
                  feq.s        s1, fa1, fs8
                  remu         t5, t5, gp
                  fmul.s       fs3, ft3, fs5, rne
                  fmin.s       fa6, fa5, fs9
                  sll          s2, t3, s0
                  sll          a3, s7, s2
                  fcvt.w.s     s2, fs6
                  fsqrt.s      ft10, fa4, rdn
                  sra          s5, s9, t5
                  add          ra, a3, t6
                  fcvt.w.s     gp, ft3, rmm
                  sra          s5, s8, t3
                  srli         a7, a6, 14
                  fmv.w.x      ft4, a5
                  fcvt.wu.s    s0, fs5
                  fsgnjx.s     ft11, fa0, fa3
                  fsgnjn.s     fa5, ft11, fs10
                  addi         s7, a0, -1775
                  fsgnjn.s     fa7, ft10, fa4
                  slti         t1, gp, 1869
                  fcvt.s.wu    fs10, gp
                  feq.s        s2, fs3, fs6
                  fcvt.w.s     t1, ft3, rtz
                  auipc        a5, 810568
                  fdiv.s       ft9, fs5, ft9, rtz
                  fsgnjx.s     ft0, ft9, fs0
                  and          s9, s1, s9
                  slti         t5, a4, -525
                  fsgnjx.s     ft5, ft7, fs2
                  fdiv.s       fs7, fa0, fs8, rne
                  div          sp, s5, t0
                  and          s10, t1, s3
                  fmin.s       fa0, ft9, ft11
                  fsub.s       fs1, fs9, fs9
                  sra          t4, a1, s0
                  and          s5, a3, s5
                  sltu         t4, ra, ra
                  fmul.s       fs6, fs4, fs11, rup
                  sltu         s1, t4, s8
                  sll          t5, s2, tp
                  fcvt.s.wu    ft3, gp, rup
                  fdiv.s       ft5, fs9, ft5
                  fsub.s       fs8, fs5, fs5, rdn
                  sltiu        t2, s11, 1479
                  xor          t5, s1, s7
                  srl          s1, t1, s8
                  fmv.x.w      s2, fs11
                  lui          s9, 825379
                  fsqrt.s      fs10, ft7, rup
                  rem          s4, t0, s9
                  fcvt.s.wu    fa5, a7
                  mulh         tp, s6, s9
                  sub          t1, ra, a6
                  fsgnjx.s     fs5, ft8, ft3
                  auipc        sp, 804914
                  div          t2, s6, s4
                  fadd.s       fa5, fs9, fs8, rtz
                  mulhu        s2, s8, tp
                  mulh         tp, s4, a1
                  auipc        a0, 135399
                  remu         s8, s1, ra
                  mulhu        sp, a2, a7
                  fmin.s       fa7, fs5, ft7
                  fcvt.wu.s    s8, fs9, rmm
                  fdiv.s       fa2, ft4, ft5
                  slli         gp, s2, 20
                  fadd.s       fa6, ft2, fs11, rne
                  fcvt.w.s     a2, ft6
                  fcvt.wu.s    a3, fa4, rmm
                  rem          ra, a7, s7
                  fmv.w.x      ft3, a0
                  mulhsu       gp, s1, a2
                  srai         s3, a3, 18
                  fcvt.w.s     s6, fa2
                  xor          t3, a6, ra
                  slli         s6, t1, 6
                  and          tp, t4, s0
                  fcvt.wu.s    s9, ft3
                  ori          a3, sp, 694
                  mulh         t3, s11, s9
                  fcvt.wu.s    zero, ft4
                  feq.s        a5, fs8, fa1
                  srai         a4, a4, 2
                  ori          t6, s1, 2016
                  mul          a7, t4, s11
                  xor          a0, t5, a6
                  ori          a1, s1, -2031
                  slti         a4, ra, 766
                  fmul.s       ft6, fa6, fs9
                  sll          s9, t3, gp
                  fcvt.s.wu    fa5, s9
                  mulhsu       s10, a3, a6
                  fcvt.w.s     s5, ft5
                  rem          t1, s4, a0
                  fdiv.s       fs9, fa1, fs9, rup
                  mulhu        a2, a0, s0
                  fcvt.wu.s    sp, ft5
                  fsgnj.s      fs10, ft6, fa0
                  fmul.s       fs11, fs6, ft4
                  fdiv.s       fs3, fs9, fs11
                  and          s9, s8, s8
                  ori          s9, s5, -399
                  mul          t1, a1, s6
                  nop
                  mulhu        s3, s11, s10
                  fadd.s       fa3, ft2, fs2
                  xor          t1, s6, s1
                  div          sp, s6, s7
                  fcvt.wu.s    gp, fs6, rmm
                  fmv.w.x      fs0, a6
                  fmv.w.x      fs6, a2
                  srli         s5, tp, 4
                  fsub.s       fs4, fa2, fs5
                  slt          t2, a7, ra
                  fdiv.s       fs5, ft11, ft1
                  div          a5, ra, s2
                  flt.s        s6, fa6, ft0
                  rem          s5, s8, sp
                  rem          t3, s2, gp
                  fsgnj.s      ft5, fs3, fa6
                  add          gp, a5, s8
                  xori         a0, tp, 1828
                  fcvt.s.w     fs0, s2
                  divu         a1, t0, a7
                  slti         a2, t3, 975
                  lui          tp, 87481
                  fmul.s       fs8, fa0, fa4
                  fmax.s       fs3, ft5, ft2
                  srli         a5, t2, 28
                  divu         a1, s0, a4
                  fcvt.s.w     fa6, a3
                  fclass.s     s10, fs6
                  slt          s6, a7, s4
                  fcvt.s.wu    fa7, s0, rne
                  fle.s        a7, ft1, fa3
                  slli         a7, s4, 14
                  slt          s8, sp, tp
                  andi         zero, a4, 4
                  nop
                  rem          a5, s6, tp
                  fcvt.w.s     t6, ft8
                  fmin.s       ft6, ft8, fa6
                  fcvt.s.w     ft7, s0, rtz
                  srai         s4, s10, 7
                  div          s2, zero, a0
                  fcvt.s.w     fs0, zero, rmm
                  fmv.w.x      fs2, s1
                  fcvt.w.s     zero, ft10, rne
                  sub          s4, zero, s7
                  mulhsu       s2, t1, a1
                  fsqrt.s      fs11, fa7, rmm
                  srai         a5, gp, 5
                  srl          t6, a6, sp
                  slli         s3, s3, 1
                  rem          a1, zero, t1
                  fcvt.s.w     fs1, s4, rmm
                  mulhu        zero, a1, s9
                  fadd.s       ft7, ft4, fs11, rne
                  slti         s6, tp, 1802
                  rem          a4, a7, t2
                  fcvt.wu.s    a5, ft5
                  mul          sp, t0, s1
                  fsqrt.s      ft3, fa7
                  and          ra, s11, a1
                  fcvt.s.wu    fs0, t3
                  fmin.s       fa5, fs8, ft2
                  andi         s9, s4, 1119
                  slti         a4, t0, -1491
                  slt          s9, t2, s6
                  fmv.x.w      s2, fa3
                  srai         s0, ra, 17
                  sub          s8, a1, a6
                  srli         s0, a5, 27
                  remu         s3, t6, a7
                  sub          s3, t1, s7
                  lui          sp, 277730
                  sra          a3, a3, a1
                  fclass.s     t5, fa0
                  fsgnj.s      fs5, fa6, ft1
                  flt.s        a0, fa1, ft5
                  add          t6, a2, s11
                  fmv.x.w      zero, fs7
                  srli         a5, s4, 26
                  fmul.s       ft10, ft6, fa3, rne
                  mulh         s9, s9, t2
                  ori          s1, s2, -1205
                  fsqrt.s      ft1, ft5
                  fcvt.s.w     fa2, s1, rmm
                  fmv.w.x      fa5, s10
                  xor          t6, a1, a3
                  fle.s        a0, fa0, ft6
                  lui          s6, 185493
                  add          s8, a3, s8
                  srli         s10, s10, 22
                  slti         s9, s2, 951
                  slti         s10, s0, 1042
                  fmv.w.x      fa0, a2
                  fclass.s     a3, ft3
                  fmv.w.x      fa5, s1
                  srai         s9, a7, 11
                  andi         s10, s4, -707
                  ori          tp, s0, -598
                  rem          t2, t4, s1
                  sub          s3, a6, s2
                  mulhu        s8, s3, s11
                  lui          s2, 187797
                  mulh         a1, a7, a4
                  fmul.s       fa5, fa0, fs5, rne
                  addi         a7, t3, 1006
                  srli         a4, s4, 28
                  slti         s8, s1, -1510
                  and          t2, t0, t4
                  fsgnjx.s     ft2, fs6, ft5
                  fsgnjn.s     fa0, ft4, fs9
                  srai         s3, s9, 16
                  sltiu        t3, s7, 1584
                  slt          t4, t2, t0
                  fmin.s       fa3, fs2, fs10
                  srli         s1, ra, 19
                  sltu         s7, s8, tp
                  srai         s8, a4, 19
                  xor          t1, gp, a6
                  xor          zero, s9, s5
                  fsgnjn.s     fa4, fa6, fs11
                  fsqrt.s      fa5, ft11, rdn
                  mulh         t6, t4, s9
                  fclass.s     zero, ft1
                  fsub.s       ft10, ft4, ft6
                  srli         ra, sp, 16
                  and          a4, s4, ra
                  divu         t5, s10, s10
                  xor          tp, t0, a6
                  fle.s        s6, fa4, ft7
                  fmv.x.w      gp, fa0
                  fadd.s       fa4, fs4, ft10
                  flt.s        s0, fs5, fs4
                  and          t6, t6, t0
                  fmv.x.w      sp, fa3
                  fcvt.s.w     fs3, a5, rdn
                  lui          s7, 136649
                  ori          s5, s8, -906
                  fcvt.wu.s    s9, ft10
                  fcvt.w.s     a5, ft2
                  fcvt.s.wu    fa1, s5
                  fcvt.w.s     t2, ft9, rne
                  fsgnjx.s     ft8, ft7, ft10
                  feq.s        t6, fa6, ft2
                  sltiu        a7, gp, -1062
                  auipc        t1, 403894
                  fcvt.s.wu    fs6, t4, rdn
                  fcvt.s.wu    ft7, t3
                  ori          t6, s8, 2045
                  sltu         s0, gp, a2
                  flt.s        s4, ft5, fs8
                  and          t4, s1, tp
                  srai         s7, zero, 1
                  auipc        t6, 724701
                  mulhu        gp, s10, a0
                  fmv.x.w      t2, ft8
                  sub          s6, s6, s6
                  fsgnjx.s     ft11, fs4, fa3
                  fadd.s       fa7, fs4, ft0, rtz
                  xori         t4, a5, 59
                  div          a2, s9, zero
                  feq.s        t3, ft11, ft1
                  fcvt.wu.s    t2, fs0, rdn
                  sltu         s5, a1, tp
                  mul          s9, s5, zero
                  fmul.s       fs9, fs1, fs9
                  fcvt.wu.s    s5, fs7
                  fcvt.s.w     fa3, s1, rtz
                  lui          gp, 262970
                  slti         tp, t4, 1170
                  mulhsu       a0, t4, s8
                  andi         s9, s1, 1609
                  fcvt.s.wu    fa0, s7
                  and          s10, a2, sp
                  fclass.s     s10, fs7
                  fsgnj.s      fs4, ft1, ft6
                  fmin.s       fs6, fs6, ft4
                  fsub.s       fa3, fa5, ft2
                  fclass.s     t5, ft1
                  fsgnjx.s     fa7, fa0, fs10
                  fmul.s       ft5, fs8, fa6, rtz
                  fcvt.s.w     fa4, a6
                  xor          a1, s0, s0
                  fmin.s       ft10, ft11, fs4
                  fclass.s     s7, fa6
                  fmax.s       ft1, fa6, fs2
                  slli         gp, s2, 8
                  sltiu        a3, t5, 1460
                  fadd.s       ft2, fs1, ft4
                  sra          t3, t6, a7
                  fle.s        a5, ft10, fs10
                  mulhsu       t2, s1, sp
                  andi         zero, s2, 532
                  mulhsu       s9, t2, tp
                  xor          s1, s7, s10
                  fsqrt.s      fa4, fa6, rdn
                  fcvt.wu.s    t1, ft11
                  mul          ra, t6, s4
                  sll          sp, t2, t6
                  feq.s        s0, fa4, ft10
                  lui          gp, 982342
                  lui          a7, 678180
                  auipc        s4, 580283
                  sll          t5, a5, t1
                  auipc        s8, 583224
                  fcvt.s.wu    fs0, t1
                  sra          a5, a0, zero
                  mul          sp, a5, t2
                  mulhsu       a0, s0, s2
                  remu         sp, tp, s4
                  sra          s4, s10, a3
                  and          s9, sp, t6
                  slli         a1, a5, 0
                  fadd.s       fa3, ft8, fs0, rup
                  sub          ra, s1, s10
                  fmv.x.w      s9, ft0
                  mulhu        a1, sp, t6
                  fsqrt.s      ft7, fs6, rup
                  srli         s7, s4, 7
                  slt          s2, sp, s7
                  fmax.s       fs11, fa7, fa5
                  srai         s3, t1, 9
                  flt.s        s4, fa0, ft3
                  srli         a1, a5, 6
                  srai         a3, a3, 20
                  fsub.s       ft11, ft8, fs6
                  fsgnj.s      fs8, fs11, fs9
                  fle.s        a2, ft6, ft1
                  slt          a2, t3, a1
                  mulhsu       s6, s6, zero
                  fcvt.s.wu    fs5, s8
                  auipc        a7, 970248
                  nop
                  fmax.s       fs11, fs1, ft7
                  fcvt.s.wu    ft8, s11, rup
                  sra          gp, s5, sp
                  srai         t6, s6, 8
                  andi         s2, t0, -58
                  fsgnjn.s     fa6, fs6, fa3
                  fadd.s       fa6, ft1, fs3, rne
                  fmv.w.x      fa1, s3
                  srai         zero, s11, 5
                  rem          s3, t0, a6
                  xor          t3, t1, t1
                  sltu         a3, a3, t2
                  sub          s7, a7, sp
                  srl          sp, gp, tp
                  flt.s        s3, fs0, fs3
                  sub          a4, s5, t6
                  fcvt.w.s     gp, ft11, rdn
                  fadd.s       ft7, ft8, fs9, rup
                  andi         a0, s10, -372
                  ori          a1, s4, 298
                  rem          t2, s2, t3
                  mulhsu       ra, gp, gp
                  nop
                  andi         t1, s7, -428
                  lui          a3, 1013000
                  fdiv.s       fa2, fa6, ft6, rup
                  rem          s5, t6, a5
                  fmul.s       fa4, fa7, ft10
                  flt.s        s1, fa2, ft1
                  or           t2, t0, t4
                  fsub.s       fs6, ft4, fa1
                  ori          s5, tp, -1091
                  slli         s8, t2, 19
                  nop
                  srli         s8, t2, 8
                  xor          t4, t3, s6
                  fadd.s       fs8, ft1, fs1, rup
                  fsqrt.s      ft11, ft6, rdn
                  remu         s4, s3, t2
                  mulhu        t1, a3, s6
                  fcvt.wu.s    s2, fs10
                  ori          t4, s0, 831
                  fdiv.s       fs2, fa0, fs5
                  mulhu        t4, s7, sp
                  mul          a3, s0, a0
                  or           a0, t2, s1
                  slti         sp, a0, 1994
                  addi         ra, a7, 1823
                  rem          a2, sp, s5
                  slt          a0, a5, zero
                  addi         a2, a3, 577
                  sltu         sp, a6, s10
                  sltiu        a5, s5, -1727
                  lui          a5, 766049
                  sltiu        a4, gp, 428
                  fclass.s     s7, fs8
                  nop
                  fmv.w.x      fs7, t0
                  mulhsu       t3, a1, s5
                  rem          a7, t4, t0
                  addi         a3, a3, -1785
                  slti         s4, s0, 1472
                  sra          t3, a7, s0
                  div          s1, t6, a0
                  or           t5, a1, s0
                  fcvt.w.s     t5, fa4
                  auipc        t2, 727412
                  divu         a0, t1, t6
                  flt.s        s10, fa2, ft6
                  sub          s10, t1, t2
                  fmv.x.w      ra, fa3
                  ori          a7, t4, 639
                  flt.s        s6, fs10, ft0
                  andi         s9, s8, 1680
                  fdiv.s       fa3, fs1, fs8, rne
                  feq.s        s2, fs8, fa0
                  fmax.s       fa5, ft5, ft3
                  sll          t4, t0, s10
                  fmv.x.w      t4, fa6
                  mulhu        s10, tp, t6
                  lui          a2, 710753
                  fle.s        s7, ft1, ft5
                  fmax.s       fs6, ft7, ft2
                  fmv.w.x      fa4, a1
                  fmax.s       ft8, fs3, fa6
                  fdiv.s       fs5, ft9, fs10, rne
                  fmv.x.w      s5, ft4
                  lui          t5, 988125
                  mulhsu       zero, a0, s4
                  fsgnjn.s     fs11, fs10, ft6
                  fdiv.s       fs7, fs2, ft7
                  nop
                  div          t4, ra, t1
                  fmv.w.x      fs3, t2
                  fcvt.w.s     a5, ft0, rne
                  fcvt.wu.s    ra, ft6
                  fcvt.s.w     fs7, a5, rup
                  div          s3, t4, tp
                  andi         a4, sp, 1997
                  addi         a7, s8, 838
                  fmv.w.x      ft4, t4
                  fmax.s       fa2, fs2, fs10
                  fsgnjx.s     fs5, fs7, fa1
                  div          s4, t4, a1
                  sltiu        tp, a7, 1194
                  fmv.x.w      a0, fa4
                  divu         a1, s6, a5
                  or           zero, a2, a0
                  andi         a5, s5, -802
                  mulhu        t2, s2, tp
                  fmul.s       fs9, ft6, fa2, rne
                  fsgnjn.s     ft5, ft1, fs11
                  sub          s3, tp, a5
                  slti         t3, s2, -1055
                  fmax.s       ft3, fa3, fa7
                  fsgnj.s      ft4, ft5, fs11
                  srli         s7, t0, 1
                  fclass.s     s2, fa6
                  fsgnjn.s     fs1, ft1, fs10
                  xor          gp, sp, s0
                  fmax.s       fa2, fs8, ft2
                  sltu         s10, s0, t4
                  fsqrt.s      fa0, ft8, rup
                  fsgnj.s      fa3, fs6, ft0
                  add          sp, ra, a5
                  slli         t4, t5, 20
                  auipc        a4, 1014943
                  fcvt.wu.s    a4, fs11
                  or           a1, s10, gp
                  srli         t2, t0, 23
                  flt.s        s8, fa4, fs10
                  mulhsu       a0, a7, s9
                  sra          s9, s8, t2
                  slli         s9, t3, 24
                  mulhsu       s3, s4, t0
                  fle.s        s9, fa3, fs2
                  fmax.s       fa1, fs1, ft11
                  xori         t6, a3, 523
                  mulhu        s8, tp, a0
                  sub          a1, a0, t6
                  sll          t1, s6, a5
                  mulhsu       gp, tp, a2
                  nop
                  fmv.x.w      s4, fs3
                  sra          s1, a0, sp
                  sltiu        t2, t2, -836
                  fmin.s       fs10, ft10, ft11
                  div          s4, s11, a3
                  nop
                  div          s0, s4, s5
                  lui          t1, 496662
                  and          s8, s6, t6
                  feq.s        a1, fa4, fs6
                  slti         s0, a3, 1423
                  srli         gp, t1, 9
                  fmul.s       fs4, ft11, fa7
                  slli         s0, gp, 3
                  sltiu        sp, t2, 44
                  mulh         tp, a4, s11
                  andi         s9, s4, -1013
                  fle.s        t1, fa0, fs3
                  sll          zero, s11, sp
                  slt          ra, a1, zero
                  fmin.s       fs4, fa1, fs11
                  srai         a5, t4, 24
                  mulhu        t2, t4, t1
                  fmin.s       ft4, fa3, ft11
                  sub          s2, s4, a4
                  xor          a2, gp, t1
                  slti         s6, s6, -1492
                  auipc        zero, 658662
                  mulhu        a4, s10, a5
                  fcvt.wu.s    a7, fa6
                  lui          s3, 107695
                  fcvt.s.w     ft5, s4
                  ori          s2, gp, 1198
                  sra          t6, t0, tp
                  fdiv.s       ft10, fa0, fa1, rne
                  sra          a4, t1, s5
                  feq.s        s9, fa2, fs0
                  rem          s4, gp, s6
                  slti         s4, t5, -161
                  mulh         a7, s6, a3
                  xor          t6, s1, s2
                  rem          s5, s10, gp
                  srai         s1, a3, 29
                  fsgnj.s      fs4, fa7, fa1
                  fsub.s       fa0, fs9, ft9, rdn
                  sll          s0, s11, a7
                  fadd.s       fa5, fa3, ft4
                  mulhu        a0, gp, s3
                  slti         s3, t3, -1795
                  fmax.s       ft10, ft7, fs2
                  remu         s6, tp, t4
                  flt.s        s9, fs9, ft0
                  or           s8, t5, s2
                  fcvt.s.w     fa3, zero
                  mul          s7, t4, a6
                  fcvt.s.wu    fs8, t4, rtz
                  fmax.s       ft5, fs10, ft11
                  srl          s4, t0, s7
                  rem          a7, s5, a4
                  add          gp, tp, tp
                  or           t5, a7, t2
                  fcvt.s.w     ft2, a1
                  andi         zero, tp, 699
                  fmax.s       fs11, fs11, fs0
                  fcvt.s.wu    ft3, a6, rdn
                  fmul.s       fa1, ft8, ft1
                  fsgnjx.s     fs3, ft10, fs0
                  fmin.s       fa4, ft9, fa2
                  sub          t3, ra, t0
                  sub          s5, a2, s6
                  xor          zero, zero, a3
                  div          s6, t3, a2
                  feq.s        s3, ft3, fs8
                  xor          sp, a5, a2
                  srli         t1, a2, 0
                  slt          t3, s3, s9
                  or           zero, s7, a2
                  xor          a0, a4, a5
                  mulh         s2, t6, a4
                  srl          a4, s3, gp
                  srli         s8, gp, 26
                  srai         s0, a0, 5
                  and          s7, s4, s9
                  fcvt.s.wu    fa3, a0
                  div          s10, s6, t0
                  srl          gp, gp, a7
                  remu         s0, s11, a4
                  and          ra, t2, t1
                  and          t3, a6, t1
                  srli         ra, a7, 22
                  fmv.x.w      s3, fs5
                  srli         s8, t3, 18
                  fsgnj.s      ft4, fa5, ft1
                  fdiv.s       ft5, fs8, fs9, rdn
                  sub          s4, t6, t6
                  mulhsu       a1, s8, s6
                  fmin.s       ft8, fs4, fa2
                  lui          s8, 509129
                  fadd.s       fs10, ft1, ft0
                  fsgnjn.s     fs10, fa6, fa5
                  sra          s5, a0, a4
                  fadd.s       ft4, fs8, fa4
                  sll          ra, t0, tp
                  fle.s        a4, fa1, fa4
                  sra          sp, t4, a2
                  fsgnj.s      fs6, ft3, fs1
                  fmul.s       ft5, fa0, ft5
                  sub          t4, sp, t0
                  fcvt.s.w     fs7, a2, rup
                  sltu         t3, s2, a7
                  srai         s3, s2, 13
                  fle.s        s8, ft2, fa4
                  or           s2, a0, t1
                  add          a0, s11, t3
                  andi         s9, s0, -1201
                  ori          ra, t2, 340
                  andi         s8, s0, -272
                  fdiv.s       ft6, fs6, fa3
                  fsgnj.s      fs10, fs11, ft1
                  sltu         t3, tp, s9
                  auipc        ra, 381376
                  sub          t5, a4, s4
                  add          a1, t3, a2
                  auipc        s8, 229505
                  or           s4, a0, t0
                  sll          s0, s1, s5
                  or           zero, s3, gp
                  xori         a0, s1, -1658
                  mulhsu       t6, s2, s1
                  feq.s        a4, ft3, fs2
                  or           t2, ra, a6
                  fsub.s       ft4, fs4, fa5, rdn
                  fsgnjn.s     fa3, fa1, fs10
                  xori         a7, s4, 1753
                  mulh         t4, s5, t5
                  fle.s        s4, fs4, fa3
                  mulhu        s3, s7, gp
                  auipc        a0, 817235
                  div          s5, s8, gp
                  feq.s        s6, fa6, ft6
                  fmul.s       fs3, ft9, ft4, rup
                  fsgnj.s      fa7, fa1, fa3
                  mulh         a3, s9, a4
                  srai         t3, tp, 29
                  fmul.s       fa1, fs11, ft7
                  fle.s        t3, fs3, fs6
                  fcvt.s.wu    fs6, ra, rdn
                  xor          zero, s8, a7
                  slt          ra, tp, a5
                  fmv.w.x      fs6, s2
                  andi         tp, tp, -1343
                  auipc        gp, 621374
                  sltu         a3, zero, s10
                  auipc        t5, 524848
                  fdiv.s       fa4, fa4, fs9, rup
                  srl          t3, a3, a6
                  andi         s10, t0, -1243
                  slt          s7, tp, s0
                  fsub.s       ft3, fa6, ft0
                  sltu         t1, s0, a5
                  mulhsu       s2, s1, t0
                  fle.s        s2, ft0, fs6
                  slt          t2, t1, s9
                  flt.s        a7, ft8, fa5
                  fsgnjn.s     ft10, ft3, fa7
                  mulhsu       s7, t1, a4
                  or           s0, t1, a7
                  or           a5, s11, s6
                  feq.s        a2, ft7, fa7
                  flt.s        zero, fs2, fa2
                  auipc        a2, 57090
                  srai         s2, a7, 1
                  fsqrt.s      fa7, fs0, rdn
                  mulhu        a7, s4, gp
                  srai         s9, a2, 25
                  sltu         sp, a6, s1
                  fcvt.w.s     a5, fa5
                  sra          sp, s7, s0
                  fmul.s       fa3, fs4, ft10, rtz
                  srl          ra, a5, a1
                  rem          s7, s8, s3
                  and          tp, a2, gp
                  lui          t5, 220887
                  mulh         zero, a6, t6
                  srli         zero, a4, 16
                  sll          s8, s11, s10
                  addi         a3, a7, -237
                  mulh         a7, s0, zero
                  fcvt.s.wu    fs10, s4
                  addi         s1, t6, -1569
                  andi         ra, s9, 1333
                  fcvt.s.wu    fs6, t0
                  mulhsu       s0, a1, s11
                  fmul.s       fa3, fs5, fs7
                  xori         a0, s1, 1363
                  sltiu        gp, s7, 1495
                  fsqrt.s      ft7, fa7, rup
                  srai         a4, s10, 8
                  fmv.w.x      fs11, t2
                  flt.s        s10, fa3, fs9
                  fadd.s       ft1, ft9, fs5, rup
                  mulh         t6, t5, s1
                  fcvt.s.w     fa5, s8
                  or           a1, t3, t3
                  srai         s7, s11, 3
                  sub          tp, tp, s1
                  and          a1, s11, s7
                  srai         t1, s8, 0
                  add          s5, t0, zero
                  nop
                  mul          a0, a6, sp
                  slt          s6, tp, s10
                  mulhsu       t4, s5, s4
                  sltu         a3, sp, s3
                  sub          s1, s10, a3
                  srli         s10, t0, 11
                  fcvt.s.wu    fs3, s9
                  sltu         a5, s6, a3
                  fmax.s       fs7, ft9, ft0
                  and          s6, a4, sp
                  lui          a5, 253279
                  fsgnjx.s     ft0, ft0, fa3
                  fcvt.w.s     a5, fs10
                  sll          a1, t4, s7
                  or           s2, a1, s5
                  slt          a3, t3, a3
                  fdiv.s       ft1, fs2, ft7, rup
                  sll          s7, t0, s11
                  fdiv.s       ft10, fa4, fs7, rtz
                  auipc        s8, 864058
                  fadd.s       ft5, fs6, fs4
                  fadd.s       fa3, fs0, ft1, rtz
                  rem          t4, a5, ra
                  srai         zero, s3, 13
                  or           s7, a5, s4
                  slli         s1, s8, 10
                  fdiv.s       fs0, fa0, fa5
                  fcvt.s.w     fs3, a0
                  sltiu        s1, t4, 550
                  sra          s9, s6, t6
                  fsgnjn.s     ft1, ft6, ft6
                  auipc        s4, 34086
                  srli         zero, s5, 24
                  srl          a4, ra, t4
                  flt.s        a4, ft10, ft3
                  fsub.s       fa4, fs5, fs10
                  fcvt.s.wu    ft10, a7, rmm
                  fsub.s       fs4, fa1, fa7, rtz
                  fcvt.s.w     fs7, a7, rup
                  slti         s0, t5, 1013
                  nop
                  srai         a0, s1, 16
                  fsgnjn.s     ft11, ft5, ft5
                  fadd.s       fs2, fs2, fa1, rne
                  slt          s3, t6, sp
                  ori          t1, a4, -873
                  slli         t2, a1, 7
                  fadd.s       fs7, ft9, ft11, rup
                  srli         a3, a0, 26
                  mulhu        sp, a4, a0
                  div          s6, a0, s3
                  sra          s8, s5, a1
                  fsgnjx.s     fs3, fs6, fa7
                  lui          s4, 110157
                  mul          s3, s5, s6
                  sra          s7, s6, s5
                  xor          tp, t5, s10
                  fsgnjx.s     fa5, fs7, ft9
                  fmv.x.w      s10, ft3
                  fadd.s       ft3, fa5, ft8
                  mulhu        ra, s4, a3
                  fmv.w.x      fa0, s11
                  flt.s        a1, ft5, ft6
                  fsgnjn.s     ft5, fa3, fa7
                  fclass.s     ra, fs11
                  divu         t5, a1, t5
                  fsub.s       ft2, ft8, fs3
                  mul          a2, a2, s6
                  feq.s        s0, ft7, fa7
                  or           s2, a4, a1
                  fmul.s       ft0, fs11, ft9, rne
                  mulhsu       t6, sp, t2
                  fmv.x.w      a0, fs6
                  fcvt.wu.s    s0, fa2
                  or           s10, sp, tp
                  mulh         a7, s9, s7
                  sra          gp, zero, s9
                  div          s3, a1, a4
                  or           t3, t6, s1
                  rem          t2, s8, t5
                  sll          zero, t6, s6
                  sltiu        a4, a6, 466
                  fsgnj.s      fs0, fa4, ft5
                  addi         s10, a6, 1880
                  ori          s5, s1, -1304
                  fadd.s       fs0, fs11, ft0
                  lui          s2, 460492
                  fadd.s       ft10, fs11, fa5
                  fmv.w.x      fa2, s3
                  auipc        s3, 627999
                  sltu         a4, a2, s0
                  srli         sp, s5, 11
                  xori         s10, a2, 518
                  slli         t2, zero, 13
                  slti         s3, s2, -654
                  fmv.x.w      gp, fa5
                  fmin.s       fs3, fs7, fa3
                  fmv.w.x      ft9, a3
                  sra          a4, sp, s2
                  fmul.s       fs11, ft8, fa4, rtz
                  fsgnjx.s     ft0, fa2, fs8
                  auipc        t4, 568376
                  fadd.s       ft1, fs8, fs2
                  mul          s0, t4, gp
                  and          s3, s4, t6
                  fclass.s     t2, fs10
                  remu         s10, s8, a7
                  fdiv.s       fs3, fs0, ft3, rdn
                  slli         s0, gp, 5
                  fle.s        s10, fa1, fs11
                  fcvt.w.s     a4, fa5
                  ori          t2, a2, -804
                  fclass.s     sp, fa0
                  ori          tp, a4, -354
                  fclass.s     a2, fs9
                  fcvt.s.w     ft10, a7, rdn
                  fsqrt.s      fs6, ft11
                  div          a4, t4, t5
                  sltu         s2, a1, s5
                  xori         s7, s10, -545
                  fadd.s       fs0, fa1, fs11, rmm
                  fsqrt.s      fs8, fa6, rup
                  srl          a0, t4, zero
                  fmv.x.w      s1, fa1
                  fsqrt.s      ft6, fs2, rup
                  flt.s        s3, fa1, ft0
                  addi         a7, a2, 958
                  fdiv.s       ft5, ft0, fs11
                  mulhu        a4, s7, tp
                  xor          s3, a1, zero
                  mulh         s7, s7, t3
                  sll          tp, sp, s3
                  sltu         t1, t2, a2
                  addi         a2, s0, 1359
                  and          s10, zero, tp
                  fsgnjn.s     fa1, fs0, fa4
                  fmv.w.x      ft2, a0
                  fmv.w.x      ft7, s3
                  fmin.s       ft11, ft1, fa5
                  sll          zero, a7, s4
                  auipc        ra, 137124
                  fmv.x.w      s7, ft0
                  fsgnj.s      ft7, ft10, fs0
                  fmv.w.x      fs8, s6
                  ori          t2, s1, 704
                  div          zero, s4, tp
                  nop
                  fsqrt.s      fs5, fs10
                  fsgnjx.s     fa2, ft8, fa2
                  fmv.x.w      s9, fs6
                  sra          a7, zero, gp
                  div          s2, s0, a2
                  fle.s        a5, fs7, ft7
                  ori          s0, s7, 7
                  fmin.s       fa1, ft11, fa1
                  xori         a3, a2, 1592
                  slli         a3, s3, 17
                  fmv.w.x      fs3, t4
                  sra          a5, s0, s0
                  slti         s1, t2, 442
                  feq.s        tp, fs4, ft6
                  mulhsu       s5, t5, gp
                  andi         t4, s11, 737
                  flt.s        t5, fa6, ft8
                  slli         s5, t4, 18
                  slt          gp, t3, ra
                  fmax.s       fs11, fa0, ft11
                  auipc        s8, 72450
                  sra          s3, t0, a0
                  remu         zero, t5, s2
                  fmul.s       fs2, fa4, fs6
                  fadd.s       fs8, ft0, fa1
                  remu         t4, s10, t2
                  srli         a5, tp, 23
                  rem          a7, a1, s0
                  addi         a4, a1, 1292
                  xor          ra, a3, s0
                  and          a3, t2, t4
                  fle.s        s10, ft11, ft10
                  fsgnjx.s     fs8, ft2, fs1
                  remu         sp, zero, t6
                  ori          a7, s7, 60
                  slti         s1, a5, -1186
                  slt          s1, s3, s7
                  fcvt.wu.s    t2, ft5
                  fmul.s       ft7, fs4, fa7
                  lui          t2, 183127
                  sub          a3, t0, a3
                  mul          ra, a5, s2
                  auipc        gp, 649433
                  fadd.s       fa7, fs1, ft1, rmm
                  sltiu        a2, s7, 753
                  mulhu        t4, s9, t1
                  mulhu        s1, s5, s1
                  srl          s7, a4, t1
                  fcvt.w.s     s0, fa4, rne
                  fmul.s       fs11, fs5, fs9, rup
                  lui          t6, 145632
                  fmul.s       ft4, ft5, fs1
                  mulhu        s1, s7, s0
                  rem          s9, a6, t0
                  or           t1, a7, a6
                  fsgnjx.s     fs3, ft1, fs3
                  ori          a0, s10, 793
                  rem          a4, t3, s9
                  fmv.x.w      t4, ft11
                  srli         a5, a6, 8
                  fclass.s     a3, fs9
                  fsgnjn.s     fa6, fs4, fs3
                  flt.s        t2, fa2, ft5
                  srl          s6, s2, s7
                  fcvt.wu.s    t6, fs9, rne
                  srl          s7, s3, s5
                  fmin.s       fs0, ft4, ft6
                  andi         s10, s0, -924
                  ori          s2, a0, -1331
                  mulh         a4, a6, a4
                  feq.s        s9, ft10, fs2
                  mulhsu       s4, t0, s3
                  fmin.s       fs11, ft6, ft0
                  fcvt.wu.s    s2, fa0, rdn
                  auipc        s10, 728056
                  fcvt.s.wu    ft11, a0, rup
                  fcvt.s.w     ft5, t3
                  divu         t6, zero, a1
                  fmv.x.w      a4, fs9
                  mulhu        a3, s11, t5
                  sll          s7, t2, s3
                  sub          s8, s7, sp
                  mul          sp, a3, t1
                  flt.s        sp, fs5, ft11
                  and          sp, a0, sp
                  srl          s9, a2, s0
                  flt.s        a2, ft1, fa6
                  fdiv.s       ft10, fa7, fs0
                  mul          a0, t6, t2
                  srli         s4, s3, 10
                  remu         t2, ra, a3
                  srl          s3, a2, t5
                  feq.s        a4, fa2, ft3
                  fadd.s       fa2, ft8, fs1, rne
                  fmv.x.w      t6, fs0
                  mulhu        s10, s6, s2
                  fle.s        s2, ft7, fa2
                  fcvt.w.s     a5, ft6
                  fsgnjx.s     fs9, fs7, fs7
                  divu         a2, t5, s6
                  andi         t6, a7, -1040
                  sub          t4, s5, s10
                  srl          s7, s6, t2
                  fcvt.w.s     s0, ft5, rdn
                  srli         tp, s8, 17
                  sll          s1, a0, gp
                  fle.s        a1, ft4, fa7
                  ori          t2, ra, -1520
                  fmul.s       fs2, fa7, fs6, rmm
                  fdiv.s       fs11, fs11, ft4
                  xor          s7, s5, zero
                  fmul.s       ft9, fs11, ft4
                  fcvt.s.w     ft8, a5, rup
                  fsgnjn.s     ft7, fa5, ft0
                  slti         t5, a4, 739
                  rem          a7, t4, t0
                  fmv.x.w      s6, fs5
                  fmv.x.w      a5, fa3
                  srli         s9, a7, 4
                  fsgnjn.s     ft7, fs8, fs0
                  fmul.s       fa2, fa4, fs2, rmm
                  fsgnj.s      fs9, ft4, ft10
                  fsgnjn.s     ft6, fs10, fs3
                  fmin.s       fs9, ft8, fs3
                  andi         s8, s4, 1218
                  mulhsu       gp, a1, s6
                  fcvt.s.wu    fs7, t6
                  fmv.x.w      s1, ft7
                  fcvt.w.s     s1, fs2
                  nop
                  fmax.s       fa3, ft4, ft1
                  fmv.w.x      ft10, zero
                  sra          a7, s6, s7
                  divu         s4, s11, sp
                  mulh         s0, a0, t1
                  sltu         s2, s6, zero
                  fdiv.s       ft3, ft8, ft0, rdn
                  slt          a7, t3, tp
                  fsub.s       fa4, fs9, fs5, rup
                  auipc        s1, 849162
                  div          t6, ra, zero
                  remu         a5, s5, sp
                  xori         zero, gp, -1485
                  andi         zero, s10, -668
                  sub          t4, t2, s1
                  fcvt.s.wu    fa7, t5, rdn
                  mul          s10, s2, a2
                  addi         s6, t1, 979
                  mulh         a3, a7, t2
                  fle.s        a3, fs7, fs3
                  fmin.s       ft3, ft7, fa7
                  feq.s        t1, fa5, fa1
                  srai         t4, s7, 14
                  fcvt.w.s     tp, ft6
                  and          t5, t3, a7
                  lui          s6, 752039
                  nop
                  fsub.s       fa5, fs7, ft9
                  fcvt.wu.s    t5, fs4
                  mulh         s2, a0, s9
                  mulhsu       s4, s2, t4
                  feq.s        t1, fa6, fa0
                  fsub.s       ft6, ft7, fa2, rne
                  xori         s7, s7, 947
                  srli         s9, t4, 8
                  fsub.s       fa0, fs3, fa5, rmm
                  auipc        s4, 119447
                  fclass.s     a7, ft9
                  mulh         a4, t3, tp
                  sll          gp, s2, a0
                  mul          s8, a5, s9
                  la x27, test_done
                  jalr x0, x27, 0
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
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_2:
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_3:
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_4:
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_5:
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_6:
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_7:
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_8:
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_9:
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_10:
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_11:
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_12:
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_13:
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_14:
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_15:
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

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
                  addi x5, x5, -4
                  sw  x16, (x5)
                  add x16, x5, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x5, x16, zero
                  csrr x15, 0x341 # MEPC
                  csrr x15, 0x342 # MCAUSE
                  li x7, 0x3 # BREAKPOINT
                  beq x15, x7, ebreak_handler
                  li x7, 0x8 # ECALL_UMODE
                  beq x15, x7, ecall_handler
                  li x7, 0x9 # ECALL_SMODE
                  beq x15, x7, ecall_handler
                  li x7, 0xb # ECALL_MMODE
                  beq x15, x7, ecall_handler
                  li x7, 0x1
                  beq x15, x7, instr_fault_handler
                  li x7, 0x5
                  beq x15, x7, load_fault_handler
                  li x7, 0x7
                  beq x15, x7, store_fault_handler
                  li x7, 0xc
                  beq x15, x7, pt_fault_handler
                  li x7, 0xd
                  beq x15, x7, pt_fault_handler
                  li x7, 0xf
                  beq x15, x7, pt_fault_handler
                  li x7, 0x2 # ILLEGAL_INSTRUCTION
                  beq x15, x7, illegal_instr_handler
                  csrr x7, 0x343 # MTVAL
                  1: la x27, test_done
                  jalr x1, x27, 0

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
                  la x27, write_tohost
                  jalr x0, x27, 0

instr_fault_handler:
                  add x16, x5, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x5, x16, zero
                  lw  x16, (x5)
                  addi x5, x5, 4
                  mret

load_fault_handler:
                  add x16, x5, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x5, x16, zero
                  lw  x16, (x5)
                  addi x5, x5, 4
                  mret

store_fault_handler:
                  add x16, x5, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x5, x16, zero
                  lw  x16, (x5)
                  addi x5, x5, 4
                  mret

ebreak_handler:   
                  csrr  x15, 0x341
                  addi  x15, x15, 4
                  csrw  0x341, x15
                  add x16, x5, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x5, x16, zero
                  lw  x16, (x5)
                  addi x5, x5, 4
                  mret

illegal_instr_handler:
                  csrr  x15, 0x341
                  addi  x15, x15, 4
                  csrw  0x341, x15
                  add x16, x5, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x5, x16, zero
                  lw  x16, (x5)
                  addi x5, x5, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x15, 0x300 # MSTATUS;
                  csrr  x15, 0x304 # MIE;
                  csrr  x15, 0x344 # MIP;
                  csrrc x15, 0x344, x15 # MIP;
                  add x16, x5, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x5, x16, zero
                  lw  x16, (x5)
                  addi x5, x5, 4
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
