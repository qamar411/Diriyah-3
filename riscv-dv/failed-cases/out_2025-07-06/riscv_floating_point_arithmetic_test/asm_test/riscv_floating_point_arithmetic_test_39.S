.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x6, h0_start
jalr x0, x6, 0
h0_start:
                  li x14, 0x40001120
                  csrw 0x301, x14
kernel_sp:        
                  la x4, kernel_stack_end

trap_vec_init:    
                  la x14, mtvec_handler
                  ori x14, x14, 0
                  csrw 0x305, x14 # MTVEC

mepc_setup:       
                  la x14, init
                  csrw 0x341, x14

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x14, 0x3800
                  csrw 0x300, x14 # MSTATUS
                  li x14, 0x0
                  csrw 0x304, x14 # MIE
                  mret
init:             
                  li x14, 2143289344
                  fmv.w.x f0, x14
                  li x14, 0
                  fmv.w.x f1, x14
                  li x14, 2143289344
                  fmv.w.x f2, x14
                  li x14, 0
                  fmv.w.x f3, x14
                  li x14, 1532132472
                  fmv.w.x f4, x14
                  li x14, 2143289344
                  fmv.w.x f5, x14
                  li x14, 1204672372
                  fmv.w.x f6, x14
                  li x14, 2139095040
                  fmv.w.x f7, x14
                  li x14, 4286578687
                  fmv.w.x f8, x14
                  li x14, 2139095040
                  fmv.w.x f9, x14
                  li x14, 2147483648
                  fmv.w.x f10, x14
                  li x14, 0
                  fmv.w.x f11, x14
                  li x14, 2139095041
                  fmv.w.x f12, x14
                  li x14, 2154087869
                  fmv.w.x f13, x14
                  li x14, 2143289344
                  fmv.w.x f14, x14
                  li x14, 2147483648
                  fmv.w.x f15, x14
                  li x14, 4286578687
                  fmv.w.x f16, x14
                  li x14, 2151601672
                  fmv.w.x f17, x14
                  li x14, 2147483648
                  fmv.w.x f18, x14
                  li x14, 4286578687
                  fmv.w.x f19, x14
                  li x14, 0
                  fmv.w.x f20, x14
                  li x14, 2147483648
                  fmv.w.x f21, x14
                  li x14, 2147483648
                  fmv.w.x f22, x14
                  li x14, 2143289344
                  fmv.w.x f23, x14
                  li x14, 2143289344
                  fmv.w.x f24, x14
                  li x14, 1492404191
                  fmv.w.x f25, x14
                  li x14, 206313492
                  fmv.w.x f26, x14
                  li x14, 2987124847
                  fmv.w.x f27, x14
                  li x14, 2139095041
                  fmv.w.x f28, x14
                  li x14, 0
                  fmv.w.x f29, x14
                  li x14, 2143289344
                  fmv.w.x f30, x14
                  li x14, 4286578687
                  fmv.w.x f31, x14
                  fsrmi 4
                  li x0, 0x6
                  li x1, 0xf4ad85b9
                  li x2, 0x0
                  li x3, 0xac64979
                  li x5, 0x8371a607
                  li x6, 0xf5abf8b2
                  li x7, 0x0
                  li x8, 0xfa0fd993
                  li x9, 0xf3c3203a
                  li x10, 0x8935d539
                  li x11, 0xa
                  li x12, 0x6
                  li x13, 0x80000000
                  li x14, 0x0
                  li x15, 0x9
                  li x16, 0x0
                  li x17, 0xcb4fa9ab
                  li x18, 0x0
                  li x19, 0xdb20f157
                  li x20, 0x36706ed4
                  li x21, 0xe
                  li x22, 0x2fef0798
                  li x23, 0xf
                  li x24, 0xc
                  li x25, 0x0
                  li x26, 0xfd77f910
                  li x27, 0x4a570031
                  li x28, 0x80000000
                  li x30, 0x80000000
                  li x31, 0xb
                  la x29, user_stack_end
main:             mulhsu       t5, zero, a1
                  divu         a0, t6, t4
                  fmul.s       ft0, fs3, ft2, rtz
                  fmin.s       fa5, fa5, fa6
                  mulhsu       a7, sp, sp
                  fmv.w.x      fs7, a6
                  fcvt.wu.s    t2, fa7, rup
                  fcvt.s.w     fa7, a0
                  nop
                  fcvt.w.s     a2, fs3
                  nop
                  sll          s0, s5, s6
                  addi         a5, tp, -1443
                  fmv.x.w      s10, fs9
                  fsqrt.s      fa0, fa3
                  fmul.s       fs0, fs6, ft5
                  lui          t2, 117594
                  divu         s0, a7, s4
                  feq.s        s9, fs8, fs5
                  srli         t6, s10, 30
                  sltiu        t0, a4, 1394
                  fclass.s     a7, ft11
                  fsgnjn.s     fa3, ft0, fs6
                  fcvt.s.w     fs1, t3
                  andi         s2, s4, -77
                  sub          s10, a3, s1
                  auipc        t3, 30874
                  fcvt.s.wu    ft6, zero, rne
                  sltu         gp, a0, t2
                  flt.s        s8, ft6, fa7
                  xor          s2, a1, gp
                  fdiv.s       fa2, fs7, ft1, rup
                  slti         a0, t6, -541
                  mulhu        zero, s11, s11
                  divu         s2, t3, s5
                  fsgnjn.s     ft4, fa4, fs7
                  fle.s        ra, ft4, ft0
                  or           s8, ra, s9
                  sub          s10, zero, s4
                  fmul.s       fs0, fs9, fs0
                  fmul.s       fs8, fs9, fs9
                  fle.s        s8, ft8, ft1
                  mulhu        a7, t0, tp
                  sub          s3, a4, s0
                  fcvt.w.s     s4, fs7, rmm
                  fmul.s       fs3, fs2, fs3, rup
                  fdiv.s       ft10, fs6, ft4
                  sltu         s1, t5, s4
                  fsub.s       fa4, fa6, ft2
                  divu         s8, s1, a1
                  fmul.s       fa3, ft2, fs8, rtz
                  sltiu        s0, a5, -877
                  slt          sp, s4, t5
                  auipc        t5, 515610
                  addi         s3, a5, 104
                  nop
                  sub          t6, s0, a1
                  and          t5, a1, t2
                  fcvt.w.s     s4, fa6
                  fmv.w.x      ft0, a4
                  addi         s1, s5, 1451
                  fcvt.wu.s    s5, fs9, rtz
                  srai         s9, sp, 23
                  mul          s10, s1, s7
                  fmax.s       fa7, fs1, fs1
                  slt          s3, s9, t6
                  sltu         t0, s9, t2
                  nop
                  mul          a5, t5, s8
                  xori         s8, a0, 828
                  fsgnj.s      ft1, fs9, ft11
                  and          s4, t4, ra
                  divu         a6, s6, a2
                  slti         a3, s6, -1229
                  fclass.s     s7, ft5
                  mulhu        s7, a5, s7
                  nop
                  sra          s5, a2, zero
                  fcvt.wu.s    s3, ft3
                  or           a5, ra, a7
                  fadd.s       ft0, fs8, ft5
                  fcvt.s.w     fa1, a4, rtz
                  nop
                  fsgnjn.s     ft1, fa4, ft8
                  slli         a6, a6, 27
                  mulhu        ra, a5, s0
                  add          t5, s8, a1
                  mulhu        s10, t3, a6
                  fle.s        s7, fs8, ft7
                  slt          s2, t5, t1
                  srl          s3, s3, tp
                  sra          s1, t6, s8
                  addi         s4, ra, -1998
                  fsgnjx.s     fa3, ft4, fs4
                  divu         a1, t4, t2
                  lui          a0, 889822
                  lui          a4, 487320
                  auipc        s10, 292392
                  ori          ra, a4, -1858
                  fsub.s       fs4, fs1, fa3, rmm
                  rem          s5, t2, a5
                  fcvt.s.wu    fa1, s3, rne
                  remu         s9, s9, t1
                  mulhu        t3, s4, t5
                  fdiv.s       fa2, ft5, fa7, rup
                  sra          s11, t2, s4
                  flt.s        t5, ft0, fs2
                  fcvt.w.s     a2, fs4
                  fdiv.s       fs7, fs6, ft7
                  addi         a6, s2, 1203
                  srl          s9, s2, s6
                  sltiu        s6, a6, -108
                  fsgnj.s      fa4, fs1, ft5
                  divu         zero, a4, s0
                  srli         s0, a6, 29
                  feq.s        a5, ft5, ft4
                  fcvt.w.s     zero, fs0, rmm
                  xor          s4, s0, a4
                  mulh         t0, t0, s0
                  or           s8, s3, a0
                  fcvt.wu.s    s8, fs3, rup
                  fsub.s       ft10, fs0, ft9
                  slli         sp, a5, 28
                  fsgnjx.s     fs11, ft5, fa6
                  fsgnjx.s     ft1, ft8, fs6
                  lui          s5, 891280
                  ori          t3, t4, -948
                  srai         a6, a5, 20
                  fmax.s       ft0, fs11, fs4
                  fmv.x.w      gp, ft1
                  feq.s        s9, fs4, fs0
                  srai         a3, t1, 27
                  sra          s7, a5, a1
                  remu         a4, a6, ra
                  addi         s0, sp, -987
                  fsgnj.s      ft11, ft4, fs2
                  fsqrt.s      fs8, ft3, rdn
                  mulh         a6, s1, tp
                  sub          s9, s5, t1
                  flt.s        a1, ft4, fs4
                  andi         a3, t1, -1735
                  slti         a5, s11, 278
                  srli         a6, ra, 15
                  add          t3, a4, a7
                  mulhsu       s2, s5, a5
                  addi         s4, s6, -237
                  div          s4, a3, a4
                  xor          a5, t6, t1
                  fsub.s       fs5, fs5, fa7
                  fsub.s       fs11, fa0, fs4
                  xori         t0, s8, 1997
                  fclass.s     s11, fa6
                  sltiu        s3, sp, 402
                  fcvt.w.s     a6, fs5, rdn
                  slli         t6, a0, 16
                  fmv.w.x      ft0, a2
                  xori         a2, tp, -1080
                  flt.s        a5, ft6, ft7
                  mul          a4, a3, a1
                  fsgnjn.s     fs11, ft5, fa7
                  mulhu        a2, a6, s10
                  fcvt.s.wu    fs10, s10, rtz
                  and          t6, t4, s4
                  divu         a3, t6, s5
                  srli         s4, t0, 11
                  fmv.x.w      s8, fs10
                  xori         t3, s10, 1637
                  auipc        t0, 554205
                  flt.s        gp, fs1, ft10
                  fsqrt.s      ft11, fs6, rdn
                  sll          s11, s0, sp
                  sra          s10, a3, t4
                  fadd.s       ft11, fa6, fs9, rdn
                  fcvt.s.w     fs0, s5, rtz
                  flt.s        s3, fa2, ft9
                  xor          zero, s9, sp
                  fclass.s     s5, fa2
                  fclass.s     t3, ft11
                  divu         a3, zero, sp
                  fmin.s       ft5, ft4, fs8
                  fmul.s       fs4, fa7, fs2
                  remu         gp, s0, t5
                  nop
                  fadd.s       ft9, ft5, fs0, rup
                  auipc        a0, 739014
                  sra          s6, s7, t2
                  srli         a1, gp, 16
                  mulhsu       s3, ra, a2
                  addi         a4, a3, -1059
                  fsqrt.s      ft8, fa6
                  fmin.s       ft10, fa5, fs4
                  srl          t2, a1, t2
                  fsgnj.s      ft9, ft5, fs8
                  fsgnjn.s     ft1, ft11, ft7
                  fcvt.w.s     sp, ft11
                  fmv.w.x      ft4, a2
                  divu         a0, s3, sp
                  andi         s11, s8, 291
                  addi         s11, a6, -36
                  add          a5, t2, ra
                  slti         s9, t0, 184
                  fsgnjx.s     ft11, fa2, fa6
                  srl          a0, zero, a5
                  ori          s7, a2, -1185
                  andi         t0, s8, -334
                  mulhsu       a0, s0, a4
                  xori         s4, gp, 1338
                  lui          a4, 709954
                  fcvt.wu.s    s2, ft0
                  fmax.s       ft8, ft4, ft4
                  fadd.s       ft2, fa3, fs10
                  fsgnjn.s     fs8, fa7, ft2
                  or           t5, gp, s11
                  auipc        a2, 637187
                  fcvt.s.wu    ft6, s9
                  fmin.s       ft0, fa1, ft8
                  or           s1, a7, s3
                  and          s8, t4, s2
                  div          a2, a6, s4
                  srai         t6, s9, 14
                  fcvt.w.s     a6, fs11, rmm
                  fcvt.s.wu    ft4, gp, rne
                  fdiv.s       ft1, fa7, ft0, rup
                  fsgnjx.s     ft1, fa4, fs7
                  rem          s2, a2, a2
                  fcvt.w.s     s2, ft0, rdn
                  srl          a3, t3, gp
                  sltu         s0, a1, s10
                  fcvt.s.wu    ft11, t1, rne
                  sub          s0, s5, s9
                  srli         zero, ra, 27
                  fsgnj.s      fs6, fa7, ft11
                  fle.s        t3, ft0, fs3
                  srl          sp, s6, t6
                  divu         s3, a7, t6
                  sll          s4, t2, s10
                  fcvt.s.w     fs0, sp
                  sra          a2, s7, tp
                  addi         s0, a3, -990
                  rem          t3, s1, s2
                  sltu         s9, tp, t4
                  fmv.w.x      fa3, a3
                  or           s5, s10, zero
                  fle.s        s3, fs3, fa1
                  mul          s2, gp, s11
                  fcvt.wu.s    s11, fs11, rmm
                  fmax.s       ft8, fs7, fs1
                  fsub.s       fa6, fa0, ft3, rmm
                  fcvt.s.wu    ft9, s1, rtz
                  slti         a2, ra, -802
                  fsgnjn.s     ft3, fa5, fa0
                  fsgnjx.s     ft1, fa0, ft9
                  fcvt.s.wu    fs1, s11
                  addi         gp, t0, -1438
                  fsgnjx.s     fa3, ft10, fs5
                  fmv.w.x      fs3, t2
                  fsqrt.s      fs4, fa4, rne
                  remu         a4, sp, t4
                  fsgnjn.s     fs3, fs2, fs8
                  sub          a0, s8, a5
                  srli         s10, a0, 22
                  fclass.s     zero, fa4
                  div          a3, a7, tp
                  fcvt.s.wu    ft6, t0, rdn
                  fmax.s       fs2, fs1, ft11
                  fsgnj.s      fs8, ft0, fs0
                  fsgnj.s      fa4, fa7, fa5
                  srli         a1, t6, 2
                  div          t5, s0, s11
                  srl          s9, t6, s1
                  fcvt.s.w     ft5, s4, rtz
                  fcvt.s.wu    fs0, s1
                  fsgnjx.s     fs10, fa6, fa4
                  fclass.s     sp, ft1
                  fmv.w.x      fs8, a0
                  andi         a5, a1, 1336
                  add          a2, s0, gp
                  sra          s7, s7, sp
                  xori         a3, gp, -1951
                  divu         s2, gp, a4
                  sltiu        s6, s8, 1283
                  or           zero, s10, s5
                  addi         s3, t3, 13
                  divu         sp, a6, s1
                  mulhsu       a0, s10, t1
                  rem          a5, s3, a4
                  srai         a2, s7, 15
                  srli         zero, s9, 19
                  xor          a7, a7, s10
                  divu         t0, tp, t4
                  fmin.s       ft5, ft10, ft9
                  lui          a5, 127346
                  sltu         t2, t0, s11
                  addi         a3, t1, 559
                  addi         s8, t5, -1372
                  mulhu        a6, a4, t5
                  fsgnjn.s     ft11, ft0, fa5
                  mulhu        gp, s11, s8
                  or           a4, sp, t2
                  sltiu        s8, gp, -1188
                  mul          zero, a7, t5
                  or           t5, s2, zero
                  mulhsu       s1, s5, s5
                  nop
                  mulh         a7, s6, t3
                  lui          s8, 1018087
                  sll          s5, t3, a7
                  sltiu        s6, a4, -1189
                  sltu         sp, t2, a2
                  sll          a4, t6, a0
                  fcvt.wu.s    s3, fa4, rup
                  fmax.s       ft0, ft2, ft7
                  add          a2, t5, s6
                  fcvt.s.w     fa2, s0, rtz
                  fmin.s       fs8, fa5, fs1
                  fsqrt.s      fs8, ft5
                  xori         s9, s4, 1816
                  fsub.s       ft9, fa2, fs1, rne
                  sub          s4, s7, zero
                  fsgnj.s      ft9, ft8, fa6
                  fclass.s     zero, ft10
                  add          gp, a7, a7
                  srli         s10, t1, 30
                  fadd.s       ft11, ft8, ft11, rdn
                  fmax.s       fs10, fs4, fs11
                  auipc        t0, 765943
                  fsgnjn.s     fa7, fs0, ft9
                  or           a6, a4, t1
                  xor          t0, t1, a4
                  sub          t3, s9, s1
                  mulhsu       s5, s8, s5
                  rem          a6, t5, s9
                  rem          sp, a0, gp
                  fmul.s       fa0, ft4, fs7, rdn
                  feq.s        s5, ft0, fa4
                  fadd.s       ft8, ft8, fs2, rdn
                  flt.s        a1, ft7, ft10
                  divu         a6, t0, a6
                  mulhu        a1, a6, sp
                  slti         a7, a7, 1403
                  rem          a0, t0, s0
                  fcvt.s.w     ft6, a7, rmm
                  rem          a5, gp, a2
                  nop
                  andi         t2, t0, -1341
                  xori         s10, a1, 328
                  slti         a6, t2, 2018
                  addi         s9, t1, 1535
                  fcvt.w.s     a3, ft8, rdn
                  srl          s5, a5, t3
                  fle.s        s7, fs8, fa0
                  fsqrt.s      fs6, fs9, rup
                  fmul.s       ft2, fs8, fa3
                  addi         s0, t2, 1261
                  slti         a1, s6, 222
                  sra          s4, s2, s3
                  srai         s1, sp, 8
                  mul          s11, s7, a3
                  fsqrt.s      fa1, fs0
                  srli         s7, a3, 4
                  fdiv.s       ft5, ft4, fs7
                  addi         s11, t1, -966
                  fmv.x.w      ra, fs3
                  fmin.s       ft5, fa7, ft10
                  fadd.s       ft9, ft0, fs0
                  fcvt.w.s     a1, ft10, rne
                  flt.s        s3, fa5, fs3
                  mulh         s7, a0, t1
                  lui          s7, 983650
                  and          s11, a4, t4
                  fmv.w.x      fa3, s8
                  add          s9, a0, t2
                  sub          s10, t6, t4
                  xori         a4, a1, 969
                  fsgnj.s      ft9, ft7, fa7
                  sra          s6, a7, s1
                  addi         t5, t2, -887
                  sub          s6, s10, s6
                  and          s4, a5, a5
                  sltu         t5, s2, s8
                  fsgnjn.s     fa2, fa1, fs8
                  rem          t6, s4, a5
                  andi         a6, a3, -1528
                  remu         ra, s2, a3
                  fcvt.wu.s    a4, fs3, rmm
                  flt.s        gp, ft10, fa1
                  xori         s1, s2, -1716
                  divu         s3, s10, t6
                  fsgnj.s      ft6, ft4, fs5
                  mulh         a6, a0, a5
                  sra          s9, s8, t3
                  fsgnj.s      ft2, ft7, fa4
                  fmv.x.w      s9, fs9
                  mulhsu       s3, t6, t4
                  fmv.w.x      fa1, gp
                  fclass.s     s10, ft11
                  sra          s6, t4, zero
                  srli         ra, zero, 21
                  fsqrt.s      ft6, fs6, rdn
                  fcvt.s.w     ft2, t4
                  and          sp, sp, a0
                  fle.s        a7, fs8, fa0
                  fclass.s     s11, ft7
                  fmv.x.w      s2, fs2
                  fmv.x.w      t2, ft1
                  sltu         a1, s11, t6
                  fsub.s       ft5, ft5, fs9, rne
                  fcvt.s.wu    fs6, a2
                  fcvt.wu.s    ra, fa4, rdn
                  mul          s8, s8, sp
                  slt          s10, s6, a2
                  mulhsu       ra, t4, s11
                  fsqrt.s      fs8, ft6
                  sra          a5, s9, s7
                  sll          s0, a3, a1
                  fle.s        t6, ft7, fa3
                  add          s10, s11, gp
                  ori          zero, sp, 1452
                  remu         s2, t4, sp
                  xor          s9, a3, s8
                  div          a1, a0, sp
                  fsgnjn.s     ft0, ft2, fa5
                  slli         a2, s5, 1
                  fmax.s       fa5, fs7, fa6
                  slt          a6, s8, a0
                  nop
                  and          t0, a7, s8
                  rem          sp, s10, s10
                  fcvt.w.s     s1, fs11, rtz
                  fmax.s       fa3, fs7, ft6
                  xor          a2, s5, a6
                  sll          s1, s5, s8
                  xori         s2, s3, 336
                  mulhsu       t6, s4, a4
                  fcvt.w.s     s7, fa6
                  slti         s11, a2, -1148
                  srl          s6, s5, t4
                  divu         gp, s4, t5
                  fmax.s       ft5, fa4, fs5
                  rem          s2, s0, s9
                  remu         zero, a0, t0
                  mul          a0, sp, ra
                  divu         gp, s0, s3
                  feq.s        s10, fs10, ft10
                  fcvt.s.wu    ft11, t3
                  srl          a0, s7, t6
                  fsub.s       ft4, fs11, ft7, rdn
                  ori          s8, t5, 2035
                  fcvt.s.w     fa7, s9
                  fmv.w.x      ft0, t2
                  mulhu        t6, a6, sp
                  fsgnj.s      ft10, fs1, ft1
                  divu         s6, a1, a6
                  slti         a6, a1, 1337
                  mulhsu       t3, s11, a6
                  slli         t0, a7, 20
                  xori         s7, s9, -1416
                  srl          t5, s8, t1
                  fsub.s       ft2, ft1, ft8, rtz
                  fmax.s       ft6, ft10, fa2
                  srl          t2, t3, a5
                  auipc        t2, 820762
                  fsub.s       fs10, fs6, fs2, rne
                  fmul.s       fs3, fs5, fa1
                  xor          a2, t6, s8
                  xori         gp, s3, 1532
                  fsgnj.s      fa7, fa6, fs11
                  fmv.w.x      ft3, s5
                  auipc        sp, 7020
                  fmul.s       fs10, fa5, fs10
                  srli         t6, gp, 28
                  rem          a2, s7, s9
                  rem          s1, s9, t4
                  remu         s11, s11, t5
                  fsgnj.s      fs2, ft5, fa6
                  sub          a7, s3, s3
                  rem          s5, a6, s2
                  sltiu        s8, s5, -920
                  fmin.s       ft7, fs4, ft5
                  add          a1, a1, t3
                  div          t2, a6, s0
                  xori         s6, a6, 1208
                  feq.s        a2, fs5, ft5
                  remu         s6, t2, s5
                  sll          a1, s0, t6
                  fclass.s     t5, fa3
                  fcvt.s.w     fa7, s10
                  fcvt.w.s     t5, fs0
                  slt          s10, s9, t3
                  mul          s1, a2, a6
                  slt          s0, s8, sp
                  sltiu        a5, a5, -826
                  rem          s11, s5, t5
                  fcvt.s.w     fs7, t0
                  fmin.s       ft9, fs6, fa3
                  mulh         a5, s6, t2
                  flt.s        s4, fa3, ft2
                  srl          sp, ra, gp
                  sll          a4, s2, tp
                  mulh         sp, t0, s8
                  fsub.s       fa2, fa6, ft8, rdn
                  fmv.w.x      fs7, s2
                  lui          t5, 515760
                  sltiu        s7, s10, -874
                  fclass.s     t0, fa7
                  and          gp, a4, a7
                  fmul.s       ft8, fs3, fs3, rtz
                  fsgnjn.s     fa2, ft7, fa7
                  feq.s        s8, fa4, fs10
                  addi         a3, s11, 18
                  sltiu        a4, a4, 1819
                  remu         s10, zero, a7
                  fsgnj.s      ft8, ft2, ft6
                  mulh         t2, a3, a2
                  mulh         t0, s2, a4
                  feq.s        sp, fs5, fa0
                  slti         t3, s3, -679
                  sll          a1, zero, t0
                  fsqrt.s      fa4, ft9, rne
                  fmul.s       fa3, ft2, ft1
                  feq.s        ra, fs5, ft1
                  andi         s5, t6, -63
                  addi         t5, s7, -224
                  fcvt.s.wu    fs5, s6, rdn
                  mulhu        zero, t0, s6
                  sll          a5, s10, ra
                  fmin.s       fs2, fa6, fs0
                  ori          s5, a3, -135
                  sltiu        s4, s0, 1916
                  remu         t6, s6, a2
                  fsqrt.s      ft11, fs2
                  srai         a4, t6, 11
                  fle.s        ra, ft10, ft6
                  fsqrt.s      fa4, fs8, rne
                  sll          a7, a3, t5
                  slt          s3, a2, s9
                  sltu         s2, zero, t5
                  fcvt.wu.s    sp, fs8
                  fdiv.s       fs4, fs2, fa2
                  xor          a7, t6, t2
                  fcvt.s.wu    fs5, t0
                  auipc        s8, 647343
                  fmv.x.w      t3, ft8
                  fcvt.s.w     fa5, a2
                  flt.s        s3, fs2, ft6
                  srai         t2, s3, 17
                  fsub.s       ft4, fa7, fa6
                  fsub.s       ft5, ft9, ft5, rne
                  slt          t3, a2, t5
                  addi         a4, s9, -939
                  sra          s8, a3, s7
                  remu         s4, s2, zero
                  srai         a0, a1, 31
                  fsgnj.s      ft4, ft10, fa4
                  mulhsu       a5, a1, s0
                  fmin.s       ft6, fa3, fa3
                  fdiv.s       fs2, ft2, fs0, rup
                  fmv.x.w      t2, ft0
                  sltiu        s0, s7, 413
                  srli         s0, t0, 24
                  fmax.s       fa6, fs0, fs10
                  srl          s6, s4, s7
                  fmin.s       ft0, ft8, fs9
                  mulh         t0, sp, s6
                  fmv.w.x      ft11, s2
                  slli         s8, s5, 5
                  fadd.s       fa6, ft6, fs4
                  flt.s        s0, ft0, ft0
                  sra          zero, zero, s8
                  slli         s4, zero, 3
                  slti         t5, ra, -1512
                  xori         s8, s0, -234
                  mulhu        a3, t1, sp
                  add          a0, t3, s3
                  fsgnjx.s     fa0, fs0, fs0
                  sll          t3, s5, s7
                  fsqrt.s      fs2, fs6
                  nop
                  mulh         zero, t2, ra
                  fmv.w.x      ft2, s9
                  mul          ra, tp, a2
                  and          s6, tp, a0
                  div          zero, t1, sp
                  fclass.s     a4, ft10
                  and          s4, a6, s1
                  ori          s10, a4, 1692
                  mulhu        a5, s4, s4
                  slti         s11, t0, 1827
                  srli         a6, s4, 17
                  auipc        a2, 351793
                  fsgnjx.s     ft5, fs7, fa0
                  fsqrt.s      ft0, ft2, rne
                  add          gp, a7, a0
                  fsqrt.s      ft6, fs8, rdn
                  add          t2, t2, sp
                  fclass.s     t2, ft5
                  div          a2, s8, t2
                  fsgnj.s      fa3, fa0, fs8
                  sll          a1, t2, t4
                  mulhu        ra, tp, s11
                  rem          s3, a7, a3
                  mulhsu       a0, s1, s7
                  xor          a5, a1, t1
                  xor          s5, a0, a5
                  fdiv.s       fa4, ft0, ft10
                  fsgnj.s      fs9, fa5, fa4
                  mulhsu       t5, s2, t2
                  fcvt.s.w     fs10, t3, rdn
                  fsgnj.s      ft2, ft5, fa1
                  slt          ra, s9, s11
                  sra          a7, a4, s8
                  fmv.x.w      s7, ft8
                  srl          a6, t2, t4
                  or           s6, a5, s10
                  xori         t0, t4, 938
                  addi         t5, a7, 1091
                  fsgnjn.s     fs11, fa7, fs10
                  add          s10, a3, a6
                  addi         ra, t5, -404
                  addi         s5, ra, -1077
                  addi         t6, a2, -1381
                  slli         s1, a4, 31
                  fmin.s       ft4, fs6, fs10
                  addi         zero, s5, 1652
                  fle.s        s6, ft6, ft6
                  feq.s        a5, ft10, fs4
                  mulhsu       s4, t5, s1
                  and          s0, t1, s0
                  mul          s11, zero, s9
                  ori          s11, a5, -79
                  nop
                  fmul.s       fa4, fa0, fa1
                  fdiv.s       fs7, ft10, ft7, rup
                  mulhsu       t3, s7, s3
                  fsgnj.s      fa2, ft8, fs1
                  sub          a1, ra, t6
                  slt          a3, s4, a3
                  slti         gp, t1, 220
                  mul          s8, s6, sp
                  fclass.s     a3, fa4
                  fsub.s       ft11, fs4, ft5
                  sra          s8, t3, s11
                  addi         gp, s5, 1276
                  ori          a0, s6, 461
                  div          zero, a5, s5
                  rem          a0, sp, s3
                  srai         zero, s0, 24
                  div          s5, a4, s3
                  fadd.s       fa3, fs8, fs8
                  fsub.s       fs10, ft8, ft0
                  srli         s11, tp, 8
                  fcvt.s.wu    ft5, t4
                  fmv.x.w      t5, ft9
                  fcvt.wu.s    s1, ft8
                  sltiu        a0, t5, 699
                  fdiv.s       fs6, fs6, fs11, rup
                  slli         a1, t6, 7
                  sltiu        a1, t2, 1484
                  sub          a1, sp, t6
                  div          s11, t1, s2
                  remu         t5, t3, s1
                  fsqrt.s      ft3, ft1, rup
                  fmax.s       fs9, ft9, fs2
                  flt.s        zero, ft3, ft5
                  slti         s5, s0, -1899
                  auipc        gp, 853126
                  xori         s2, a1, -915
                  feq.s        a4, fs3, fs1
                  fsgnjx.s     fa1, fs7, fa4
                  sltiu        a6, t2, -1676
                  slli         t2, s1, 24
                  andi         a3, gp, 305
                  fsgnjn.s     ft8, fa0, fa4
                  srai         s9, t2, 19
                  feq.s        a6, fa6, fa1
                  fmul.s       fa2, fa7, fs3
                  fmul.s       fa0, ft1, ft6, rup
                  flt.s        a0, fs7, ft1
                  ori          s2, s7, 1787
                  srl          s2, a3, s5
                  nop
                  or           s5, t6, s5
                  auipc        s9, 10859
                  mulhu        a7, gp, s11
                  srli         t3, s0, 17
                  slti         t2, s7, -262
                  fsgnjx.s     ft9, ft4, fs0
                  add          gp, a5, a1
                  fsgnj.s      ft8, ft4, fa2
                  auipc        a7, 545959
                  sll          a1, t4, s5
                  fcvt.wu.s    s3, ft7, rne
                  add          a1, t4, sp
                  divu         s7, a4, s9
                  mulhu        t5, s7, ra
                  lui          s4, 268005
                  sltu         s3, s9, sp
                  fmax.s       fs1, fs10, fa7
                  sltu         s1, t0, zero
                  fsgnjx.s     fa1, fa3, ft0
                  addi         a5, a2, 1454
                  fcvt.wu.s    s11, ft3, rtz
                  fsgnj.s      fa1, fa2, fs4
                  fsgnj.s      ft1, fa6, ft5
                  slti         t5, a5, -1827
                  srli         s1, a5, 7
                  srli         t5, a1, 19
                  fcvt.s.w     fa5, t4
                  fadd.s       fs2, fs8, fa3
                  or           t3, s6, a1
                  sll          s7, t1, s6
                  nop
                  div          a5, s5, t4
                  mulhu        s4, t3, s3
                  slli         a4, zero, 1
                  and          s7, tp, s9
                  flt.s        s4, fs8, fs7
                  fmul.s       ft9, ft7, fs9, rdn
                  sra          ra, s9, gp
                  rem          a6, t1, s2
                  fadd.s       fa5, ft1, fs4, rup
                  fcvt.wu.s    a2, fs4
                  div          a7, ra, s7
                  fadd.s       fs8, ft1, ft4, rmm
                  slli         a5, t4, 20
                  sll          a6, s1, s9
                  fmin.s       fs8, fa5, fs5
                  mulhu        s11, a7, s5
                  divu         s6, a6, a4
                  flt.s        s6, fs9, fs0
                  fmax.s       fs5, fa4, ft5
                  fmin.s       fs10, fa6, ft0
                  fmax.s       fa2, fs10, fs10
                  xor          a4, a1, a4
                  mulhsu       t2, s11, s7
                  mulhu        s2, t4, s10
                  fcvt.s.wu    fa3, s2
                  lui          s7, 1019776
                  srl          a4, t6, s9
                  sra          gp, tp, s9
                  mulh         gp, a2, t1
                  or           t0, s4, t0
                  fsub.s       ft4, fs8, fs10
                  fdiv.s       fs0, fa7, ft2
                  sltu         a3, a4, gp
                  fsgnjx.s     ft5, fs8, ft5
                  lui          s3, 845444
                  rem          gp, t4, t4
                  fmv.w.x      fs10, a0
                  fcvt.s.wu    fs0, t2, rmm
                  srl          s4, a1, a0
                  xori         ra, t0, -2018
                  fcvt.s.w     ft11, s10
                  srai         s9, a2, 29
                  auipc        t3, 989607
                  andi         s7, s0, 800
                  fsgnjx.s     fs6, ft3, ft11
                  fsqrt.s      fa0, fs4, rdn
                  ori          s7, s5, 1301
                  fcvt.w.s     a2, fs9, rup
                  remu         s7, tp, s9
                  addi         a2, a5, 67
                  nop
                  auipc        a2, 120320
                  andi         s1, ra, -1460
                  sll          t3, a7, t4
                  remu         sp, s2, t3
                  addi         s10, s2, -1208
                  mul          s4, t0, sp
                  mulhu        zero, t1, s0
                  sra          a3, ra, s10
                  fmul.s       fs5, fa0, fs4
                  fsub.s       ft8, fs9, fa3
                  add          a0, a5, a7
                  feq.s        s11, ft4, ft7
                  fsub.s       fs11, ft6, ft3
                  div          s7, s5, zero
                  remu         zero, t3, s0
                  fsub.s       ft0, fs0, ft5
                  slti         a1, t3, -127
                  srl          a7, a4, s5
                  ori          t6, sp, 195
                  fcvt.w.s     a5, fa2, rne
                  xor          s0, s6, t2
                  lui          a2, 921622
                  remu         a4, sp, a4
                  ori          t2, a6, 1265
                  fdiv.s       fs3, ft2, fs0
                  fsqrt.s      fs10, fs6, rup
                  addi         s8, ra, -822
                  fcvt.wu.s    ra, ft11
                  fle.s        s3, ft4, fa7
                  srai         s6, s3, 28
                  srai         gp, t5, 30
                  fdiv.s       fa6, fs6, fa7, rup
                  fadd.s       ft4, ft6, fa0
                  fmv.w.x      fs2, s1
                  sra          sp, s7, s7
                  feq.s        t5, ft0, fa4
                  srai         a0, a1, 29
                  fcvt.wu.s    a6, ft10
                  fsgnj.s      ft7, ft11, ft3
                  xori         s10, t2, -362
                  fcvt.s.w     ft4, s1, rup
                  fsub.s       fa0, ft3, ft10
                  slti         a5, s0, -564
                  sll          a5, t6, s2
                  fmv.x.w      s1, fa6
                  xor          t5, s8, s10
                  or           s11, t6, a4
                  fcvt.w.s     t0, fs5
                  sra          a4, t2, a2
                  fmul.s       ft4, fs1, fa0, rne
                  fmv.x.w      a3, ft10
                  rem          s4, gp, t4
                  fsub.s       fs4, fs7, fa4, rup
                  srli         ra, a5, 24
                  auipc        a4, 1011982
                  divu         a6, s5, s3
                  fcvt.w.s     s4, ft7, rtz
                  fsgnj.s      fa0, fs8, fs3
                  mulhsu       a2, s5, s0
                  fle.s        s9, ft7, fa2
                  sra          s5, s4, a7
                  fcvt.wu.s    t6, ft1, rtz
                  fadd.s       ft11, fa3, fs7
                  mulhu        a5, a7, s7
                  lui          gp, 424310
                  xori         t5, t3, 942
                  sltu         s9, t2, gp
                  fcvt.wu.s    ra, fs10
                  fcvt.w.s     a1, fs11
                  feq.s        t0, ft8, fa7
                  fmul.s       ft11, ft2, fs1
                  fsgnj.s      fs7, fs6, fs7
                  rem          s7, s9, s10
                  xor          a4, s7, s2
                  sltu         a5, s8, a7
                  or           ra, a5, s7
                  addi         a3, s8, 1090
                  or           s7, s2, t3
                  or           s3, s5, t5
                  mulhsu       a6, a1, a4
                  fcvt.s.wu    fs8, gp
                  xori         s6, a0, 907
                  mulhu        s1, a7, zero
                  sll          a6, a3, s0
                  mulh         s8, a5, s4
                  fcvt.w.s     t0, fa3
                  fadd.s       fs0, ft6, fs10
                  nop
                  fsgnjn.s     fa7, ft9, fs11
                  fle.s        s1, fs2, ft3
                  fsub.s       fs5, ft10, ft7
                  add          a6, s2, t0
                  srl          a1, tp, a7
                  sra          a2, gp, s9
                  fcvt.w.s     s5, fa2
                  fsgnjn.s     ft11, ft7, fs3
                  nop
                  rem          t2, sp, tp
                  rem          s5, a1, t0
                  fadd.s       fa0, fs5, fs8, rup
                  slt          s4, s2, s8
                  add          s2, s8, t5
                  xor          t6, gp, ra
                  fmul.s       ft9, fa7, fs7
                  flt.s        t5, ft5, ft3
                  fsgnjn.s     fa1, fa5, fs8
                  ori          s11, s11, -365
                  slt          s10, gp, s9
                  fcvt.wu.s    s3, ft3
                  fcvt.s.wu    fs2, s6, rne
                  andi         s4, ra, -1082
                  sra          a0, s7, s5
                  sltiu        s5, s6, 376
                  sll          s6, a0, s9
                  ori          s4, s9, 694
                  fmul.s       fa3, fs5, ft7, rdn
                  srli         a5, s9, 8
                  andi         t3, s3, 1869
                  nop
                  auipc        s8, 566773
                  add          t2, s4, tp
                  fadd.s       fs2, fs0, ft5
                  flt.s        s11, ft0, ft10
                  flt.s        s4, fs7, fs8
                  sltu         a1, a3, s0
                  fmax.s       fa0, fs1, fs8
                  fsgnj.s      fa3, fs6, fa5
                  fle.s        s1, fs9, ft6
                  nop
                  fmv.w.x      ft11, t1
                  sub          s2, a2, t0
                  sub          a1, s11, s10
                  sll          s3, s2, t2
                  sub          s3, t2, t3
                  flt.s        t2, ft3, fs6
                  mulhsu       sp, tp, t5
                  fsgnj.s      fa0, fs9, ft8
                  fcvt.w.s     gp, fa7, rne
                  fsgnj.s      fa4, fs6, fs4
                  divu         t2, a3, sp
                  fmax.s       ft5, ft2, fs4
                  fmax.s       fs10, fs4, fs0
                  sltiu        a0, t2, 1630
                  xori         a4, a0, 2028
                  sltiu        s3, a6, 1176
                  sra          s11, a0, a2
                  slli         a6, a7, 12
                  srl          s6, s11, t4
                  fmv.w.x      fs0, a5
                  sltiu        a7, t0, -1610
                  fcvt.s.w     fs8, t6
                  fsqrt.s      fa7, fa0
                  addi         s7, tp, -912
                  slti         t0, a7, -1998
                  ori          s2, a3, -222
                  remu         zero, ra, ra
                  xor          s9, s0, zero
                  sltu         s6, s8, gp
                  srli         a5, a1, 17
                  fcvt.wu.s    sp, ft2
                  xori         s1, s6, 554
                  fmax.s       fs2, fs1, ft7
                  auipc        a5, 909083
                  fsgnjn.s     fa6, ft9, fa7
                  mulhsu       s11, s10, s10
                  auipc        s11, 239489
                  fcvt.w.s     a0, fs8
                  fcvt.s.w     fs3, s4
                  ori          s0, a2, -1774
                  rem          zero, s3, a3
                  sltiu        a2, s7, 2023
                  mul          s7, gp, tp
                  srai         t3, s8, 6
                  fle.s        gp, ft0, ft3
                  fsqrt.s      fs4, fs2
                  addi         s1, gp, 690
                  andi         a1, t0, -1378
                  add          s9, a6, a6
                  fsgnjx.s     fs10, fa3, ft8
                  sll          s3, s10, s1
                  fadd.s       fs6, ft1, fa4, rup
                  sltiu        t3, a5, 1098
                  srl          s8, s6, ra
                  slli         zero, s0, 27
                  fsqrt.s      ft5, fs6
                  xori         s10, a6, -168
                  or           t3, s9, s1
                  sub          s0, t0, s9
                  fmv.w.x      fs7, s0
                  addi         s4, ra, 1837
                  srl          a1, a5, a3
                  slt          s7, s3, s5
                  nop
                  sub          t0, s9, s5
                  fmv.w.x      fs1, t4
                  slli         t0, s8, 20
                  slti         s10, s5, 195
                  and          a1, a1, a3
                  ori          a2, s7, 48
                  rem          a4, a3, a2
                  fsqrt.s      fs1, ft5
                  nop
                  auipc        a3, 777853
                  srai         ra, s4, 26
                  flt.s        sp, ft4, ft0
                  divu         s2, s3, s8
                  lui          a2, 10475
                  srai         s5, zero, 12
                  or           s4, s4, s7
                  srai         zero, s5, 20
                  fle.s        s1, fa6, ft7
                  div          s0, a1, t3
                  or           s4, s9, t1
                  fmax.s       ft6, ft8, fs9
                  addi         t2, a3, -1063
                  lui          s2, 14985
                  fmv.x.w      s3, fs7
                  fsgnjn.s     ft10, fs6, fs11
                  fclass.s     a4, fa5
                  slti         t3, a1, -1753
                  nop
                  addi         a1, t5, -1788
                  andi         s0, s0, -1827
                  fmv.w.x      fs3, t3
                  sub          s9, t6, t2
                  fmin.s       ft1, fa2, ft5
                  andi         s4, a4, -1408
                  srl          s7, t2, t3
                  fsgnjx.s     fs10, fs5, fs6
                  slti         a0, t2, 548
                  slli         a0, sp, 23
                  fcvt.wu.s    s9, fa5, rup
                  fmv.w.x      fs2, t2
                  fsgnjx.s     fs3, fs6, fs9
                  divu         zero, t0, s9
                  slti         s10, a7, 1273
                  fclass.s     t5, fs3
                  fmv.x.w      gp, ft2
                  fcvt.s.w     ft3, s8, rtz
                  sub          a7, sp, t1
                  divu         t5, a7, t5
                  srli         s6, a1, 1
                  fmax.s       ft11, fa7, fs8
                  fsqrt.s      fa4, fs9, rup
                  slti         s0, a0, 1874
                  or           s5, a2, t2
                  flt.s        a4, ft11, fs7
                  slt          s8, s11, a6
                  fsub.s       fs1, ft3, ft1, rup
                  and          a5, s3, t3
                  fsgnjx.s     fs5, ft9, ft11
                  add          a1, s0, s9
                  xori         sp, a4, -928
                  fsgnjx.s     fs2, ft1, fa0
                  feq.s        t2, fs7, fs6
                  fcvt.w.s     zero, fs5
                  fmin.s       fs9, fs6, fs9
                  fmin.s       fa3, ft2, ft2
                  or           s7, a7, gp
                  fmul.s       ft3, ft9, fs4, rne
                  sub          t0, tp, a1
                  fsgnj.s      ft6, ft3, ft2
                  slli         s10, a3, 27
                  fclass.s     sp, fs9
                  fmul.s       fs7, fa0, ft7
                  slli         a5, s6, 5
                  fsgnjn.s     ft2, fs9, fa0
                  fmv.w.x      ft0, s3
                  slti         s9, s8, 1898
                  div          t6, t0, a1
                  fadd.s       fa7, fa4, fs4
                  remu         a5, s4, s9
                  fsgnj.s      fs1, ft10, ft11
                  andi         s3, s2, 1023
                  fcvt.s.w     ft6, a1
                  fle.s        a1, fs9, ft11
                  sll          gp, t5, t5
                  sltiu        t2, s11, 538
                  srli         a5, a0, 15
                  feq.s        s5, fs2, fs2
                  mulhsu       s3, s5, tp
                  remu         a1, s2, a2
                  fcvt.wu.s    s4, fs7, rmm
                  sltiu        s7, s3, 918
                  xor          s5, s11, s9
                  srl          s11, zero, t2
                  fcvt.s.wu    fa0, a2, rmm
                  sll          s11, a0, s3
                  feq.s        s6, fs7, fa6
                  srl          t5, ra, t4
                  slti         s2, sp, -1018
                  fadd.s       fs3, fs5, fs11, rtz
                  ori          a2, s3, 422
                  mul          a0, a5, t2
                  fsub.s       ft6, ft3, ft11, rmm
                  ori          s5, t5, 26
                  fcvt.w.s     s5, fs7
                  fsqrt.s      fs2, ft2
                  sltiu        a3, t4, -237
                  addi         s9, t0, -1615
                  rem          s7, t5, a2
                  fcvt.s.w     fa6, s2, rup
                  auipc        s2, 395624
                  mulhsu       a3, s10, t2
                  fcvt.wu.s    t3, ft1, rtz
                  fmin.s       fs1, ft8, fs2
                  fdiv.s       fa6, ft2, ft5, rmm
                  andi         t0, s11, 301
                  fmv.x.w      sp, fs5
                  or           s2, t0, s5
                  fclass.s     s5, fa1
                  feq.s        t6, ft0, fs5
                  fcvt.s.wu    fs9, s4
                  divu         a7, ra, s1
                  divu         s0, a4, s0
                  andi         s2, s8, -1598
                  fadd.s       fa4, ft0, fs0
                  sltu         s5, s8, s4
                  divu         gp, s7, t3
                  mulhsu       a2, t2, s7
                  fmv.x.w      s10, ft2
                  nop
                  fcvt.wu.s    a3, fs1, rup
                  mulh         ra, gp, ra
                  sltiu        a5, t1, 1085
                  mulh         s7, s7, s10
                  slli         s4, s2, 9
                  fsqrt.s      fs6, fs1
                  slti         t6, a0, -792
                  fcvt.wu.s    a3, fs1
                  rem          s11, tp, s3
                  fmul.s       fs10, fs2, fs2
                  fadd.s       fs6, fs3, fa7
                  fmv.w.x      fa7, s7
                  fsgnjx.s     fa0, fs6, fs3
                  sll          a5, s1, a5
                  sltu         a6, s10, s2
                  fclass.s     t6, ft6
                  srli         a1, a3, 29
                  ori          s8, a5, -870
                  lui          t3, 851869
                  mulhu        s0, a1, s11
                  sra          a6, a2, t4
                  fmv.x.w      s3, ft2
                  fadd.s       fs6, fs4, fa1
                  sltu         s1, t5, zero
                  slli         a1, a6, 12
                  fmv.w.x      fs4, sp
                  sub          t0, t0, s0
                  rem          s9, s6, a7
                  and          s10, s1, s3
                  lui          a7, 142006
                  srli         t3, s6, 23
                  fcvt.s.w     fa6, gp, rmm
                  xor          t0, s11, a6
                  sra          t2, t3, ra
                  slt          s2, a6, s2
                  add          s7, a5, s7
                  flt.s        s10, ft0, ft4
                  fsgnjx.s     fa4, fs3, fa7
                  slli         s2, t4, 18
                  slti         a7, s2, -484
                  xori         a3, tp, -36
                  andi         s9, t5, 73
                  fmv.w.x      fs7, t6
                  fmv.w.x      fs7, t0
                  and          s5, s11, a6
                  lui          s2, 401700
                  fmv.w.x      ft9, t6
                  fmul.s       ft4, ft7, fs0, rtz
                  ori          a4, t0, -231
                  nop
                  sltu         sp, t1, s10
                  addi         a1, s6, 731
                  srai         t3, s1, 30
                  srai         t5, s6, 10
                  and          s0, t1, a1
                  mul          a5, s1, a1
                  sll          zero, zero, a0
                  div          s10, s0, s8
                  rem          t0, s4, a6
                  or           zero, a5, ra
                  fcvt.wu.s    zero, fs0, rup
                  fmin.s       ft6, fa0, fs8
                  remu         t2, s11, s10
                  xori         s0, t1, 1479
                  fsgnj.s      fs11, ft5, fs10
                  lui          s0, 231470
                  sltiu        gp, zero, 1564
                  fcvt.s.wu    ft10, a3
                  feq.s        zero, ft6, fs4
                  fcvt.s.w     fs11, a0, rdn
                  remu         sp, a5, s4
                  fcvt.s.wu    fa6, s9, rne
                  sub          s9, a7, s11
                  srai         a3, s4, 26
                  fsqrt.s      fs6, fs1
                  fmv.x.w      a4, fa2
                  div          t0, tp, s1
                  sub          a7, tp, t6
                  divu         a4, a7, a2
                  mulhu        s4, gp, s11
                  andi         s4, t6, -1951
                  feq.s        t6, ft10, fa0
                  xori         a1, t2, 1880
                  ori          a7, s6, -1224
                  fsgnjx.s     ft11, fs8, ft2
                  mul          s3, a6, gp
                  mulhsu       a5, t2, tp
                  and          s9, zero, a7
                  xor          a3, s0, a5
                  srl          gp, t0, t1
                  add          s1, s3, s4
                  mulhu        s2, a7, t4
                  srli         s0, t6, 18
                  sltiu        s1, t0, 1938
                  mul          sp, a6, a2
                  flt.s        a1, ft5, ft6
                  divu         t5, t2, s3
                  fmin.s       ft3, ft2, fs5
                  remu         s6, t3, s8
                  sll          gp, t0, s3
                  fmax.s       fs9, ft7, ft10
                  sub          sp, s8, t5
                  fsgnjn.s     fs11, ft5, fs8
                  fcvt.w.s     a2, fa3, rtz
                  sltiu        s0, s5, -1108
                  srli         a6, s11, 11
                  srai         s9, s2, 9
                  feq.s        s9, fs3, ft4
                  mul          t5, t3, s8
                  mul          zero, a7, t4
                  rem          zero, t0, t5
                  mulh         s9, a7, s9
                  fmul.s       fs2, ft5, fs11, rdn
                  or           t3, a4, t3
                  sltiu        a7, a5, -1414
                  fsub.s       fa7, ft11, ft4
                  fsub.s       fs2, ft6, ft4
                  fmv.x.w      s7, fs2
                  lui          t2, 125614
                  fsgnjx.s     ft9, fs9, fa3
                  sltu         s8, t6, a2
                  fcvt.wu.s    zero, fa7
                  or           s1, a5, ra
                  xori         t5, s2, 986
                  fclass.s     s2, fs1
                  and          t6, s9, ra
                  fmv.w.x      ft6, t2
                  auipc        a0, 747299
                  mulhu        s10, a1, t6
                  divu         s7, s2, tp
                  srli         s10, t6, 31
                  mul          gp, a3, a7
                  fsgnj.s      fs4, ft7, ft2
                  remu         s2, s4, s8
                  flt.s        s8, fa7, ft5
                  fcvt.w.s     s5, fs2
                  fmul.s       fs9, ft7, fa2
                  slli         s5, s3, 23
                  fdiv.s       ft8, fs9, fa4
                  sub          s4, a5, t3
                  mulhu        s8, s9, zero
                  lui          a5, 167808
                  rem          t2, s3, a5
                  fmul.s       fs10, fs11, fs4
                  add          a3, a5, s2
                  slli         a2, s6, 30
                  fdiv.s       fa0, fs9, ft8, rtz
                  fdiv.s       ft0, fs8, fa1
                  nop
                  slli         a0, sp, 9
                  slli         s0, t1, 8
                  fsgnjx.s     fa1, fs9, ft9
                  fsqrt.s      ft9, fs3
                  fmv.x.w      t0, fs6
                  slli         a3, s2, 26
                  auipc        ra, 841728
                  mul          s2, a4, s0
                  lui          s9, 232607
                  sub          t0, tp, s0
                  fsqrt.s      fa6, ft4, rdn
                  mul          s1, a2, t4
                  ori          ra, s10, -1757
                  and          s8, a3, s1
                  and          a7, s5, s3
                  fcvt.w.s     t3, fs11
                  auipc        a2, 424114
                  fmax.s       fa6, fa5, fs3
                  remu         a5, s1, s9
                  fcvt.s.wu    fs5, a2
                  fsqrt.s      ft0, fa4, rtz
                  slt          s6, a2, zero
                  feq.s        a3, fs6, fs2
                  srl          a6, zero, ra
                  slti         s8, a2, -1747
                  slti         sp, t4, -1771
                  add          sp, s5, t6
                  sub          t0, s5, s9
                  mulhsu       s4, s9, s8
                  fdiv.s       ft1, ft1, fs5
                  srai         s6, s5, 23
                  mulh         s11, zero, t2
                  sltiu        s7, a3, 648
                  fsub.s       ft0, fs8, fa7, rtz
                  fle.s        s5, ft11, ft10
                  fsgnj.s      ft9, fa4, fs5
                  fclass.s     s8, ft10
                  fcvt.s.wu    fs8, s10, rup
                  remu         t0, s7, s0
                  flt.s        s8, ft11, ft4
                  sltiu        t6, s10, -910
                  fmv.w.x      fs6, a4
                  srli         s0, a4, 6
                  auipc        a1, 224605
                  fmul.s       fs1, fs4, fs11
                  feq.s        a1, ft5, ft4
                  mul          zero, t1, s6
                  fadd.s       fa4, ft11, fs7
                  rem          t6, a6, s6
                  feq.s        t5, fa3, fa2
                  add          t5, t0, sp
                  srl          ra, a4, t4
                  sll          a3, a5, s3
                  auipc        t3, 465269
                  or           a2, a4, t0
                  sll          t0, zero, t4
                  srl          a7, gp, s3
                  slti         s2, tp, -1506
                  srai         a4, a2, 2
                  div          gp, tp, s8
                  flt.s        a2, fs5, ft10
                  sltu         s6, s0, a2
                  sltu         gp, s8, a1
                  fmv.x.w      zero, ft9
                  sra          a7, a3, s0
                  xor          a0, a5, a6
                  sra          s3, t2, a7
                  fdiv.s       ft9, fs6, fa4, rup
                  fadd.s       fa2, fa3, ft6
                  fcvt.s.wu    ft6, s0
                  and          sp, t5, a2
                  fsgnjn.s     fa6, fs11, fs2
                  sub          a6, a6, s8
                  fcvt.w.s     a2, ft8
                  lui          s11, 233528
                  sub          a6, s2, s0
                  fmv.x.w      a3, ft2
                  fadd.s       ft0, fs6, fs2, rtz
                  flt.s        a7, fs7, ft4
                  auipc        t5, 815313
                  fmax.s       ft8, ft0, ft6
                  addi         s3, t0, -162
                  divu         a0, s9, s3
                  sll          a2, s3, t3
                  add          s2, a7, t5
                  fcvt.w.s     s1, ft0, rup
                  ori          s2, tp, 1216
                  rem          s10, t5, s7
                  slt          s4, s1, s6
                  andi         s0, zero, 1216
                  flt.s        s0, fs7, ft10
                  fmin.s       fs7, fs8, ft0
                  xor          s8, tp, a0
                  fdiv.s       fs11, ft2, fa2, rdn
                  srli         s1, t5, 28
                  add          s7, s2, zero
                  fadd.s       fs9, fs1, fs10, rtz
                  fsgnjn.s     fa7, fs4, ft4
                  mulhsu       t6, t4, s11
                  ori          a1, s6, 51
                  rem          a5, t1, s5
                  mul          s9, s0, s2
                  addi         s10, t1, -1310
                  mulhsu       t0, tp, a0
                  fmin.s       fs6, fs1, fs3
                  mulhsu       a5, s1, s1
                  fclass.s     t6, fa4
                  srai         t0, a3, 9
                  nop
                  fmv.x.w      ra, fa5
                  fadd.s       fa7, fs2, fa1, rmm
                  flt.s        t0, fs6, fs0
                  rem          t0, t5, s11
                  fclass.s     ra, ft1
                  srl          s6, s10, t0
                  mul          s5, sp, a3
                  srli         a0, t4, 12
                  fmul.s       ft4, ft6, fs6, rup
                  mulhu        t6, s5, s0
                  sll          a3, a7, s4
                  slt          t5, t2, ra
                  fcvt.s.wu    fa0, s6, rdn
                  fmv.w.x      fs0, zero
                  slt          t6, s0, t0
                  rem          t6, a3, a6
                  rem          s10, s4, a1
                  fsgnjx.s     ft9, ft10, fs2
                  add          t3, s11, a2
                  nop
                  auipc        a7, 432326
                  fsgnjn.s     fa6, fs1, fa0
                  srli         zero, a6, 10
                  fdiv.s       fs3, ft10, ft8, rdn
                  fmv.x.w      a2, ft0
                  sltu         a3, s10, s5
                  and          a2, s7, a2
                  mul          a5, a7, t4
                  fcvt.s.w     ft4, a5
                  fmax.s       ft3, ft7, ft3
                  srli         s1, ra, 21
                  slt          zero, s0, a6
                  fsqrt.s      fs6, ft9
                  fcvt.w.s     s10, ft1, rdn
                  fdiv.s       fs6, ft6, fs5, rtz
                  xori         s11, a4, -528
                  fcvt.s.w     fs10, s11
                  nop
                  and          s8, a3, a5
                  mulh         a0, t2, tp
                  rem          a3, t3, a6
                  nop
                  andi         s9, t6, 1989
                  flt.s        a0, fs1, ft3
                  lui          gp, 610827
                  xor          ra, ra, zero
                  lui          s1, 746210
                  nop
                  fclass.s     s2, ft4
                  fcvt.w.s     t6, fa0
                  fsgnjn.s     fs7, fa0, ft0
                  slt          t0, s11, s11
                  andi         a3, s6, -355
                  fmax.s       fa7, fs2, fs4
                  nop
                  mulh         s6, s11, tp
                  fmin.s       fs10, fa6, fs2
                  fmv.w.x      fa6, ra
                  slt          s10, a7, t3
                  fclass.s     a1, ft1
                  fcvt.wu.s    t2, fs9
                  sltu         gp, s6, s0
                  fclass.s     t3, fs5
                  add          a3, a6, s6
                  mulh         s10, s6, a4
                  div          sp, t1, t6
                  addi         t2, a6, -505
                  srai         s10, t4, 13
                  auipc        a7, 140678
                  fsub.s       ft4, fs6, ft4, rtz
                  fadd.s       fs3, ft3, ft4
                  fclass.s     s0, fs4
                  fmv.x.w      s6, fa7
                  sra          t6, s11, t3
                  mul          a0, s10, a1
                  lui          s11, 808013
                  rem          t2, zero, s6
                  divu         s3, t2, t0
                  fmv.x.w      a7, fa4
                  andi         a2, a7, 1207
                  sra          t5, a3, a3
                  fcvt.w.s     sp, ft1
                  fsgnj.s      ft4, ft7, fs7
                  fsub.s       fa1, ft10, fs1
                  sub          a0, a7, ra
                  mul          sp, a5, s5
                  xori         s10, s4, -490
                  xori         a4, t1, 568
                  div          zero, a2, gp
                  lui          s6, 1037255
                  fcvt.s.w     ft6, s11, rtz
                  srl          a0, sp, t6
                  or           a4, s0, t1
                  feq.s        gp, fs11, ft0
                  srli         a1, sp, 3
                  fmv.w.x      fa1, gp
                  fsgnj.s      ft1, fa3, fa3
                  ori          s10, s8, 241
                  xor          gp, s6, zero
                  sltu         t6, s5, t6
                  fsqrt.s      fs11, fa0, rdn
                  add          zero, s10, t4
                  slt          s6, t5, s7
                  fsqrt.s      fa5, fa6, rdn
                  nop
                  sltu         a5, a4, s10
                  lui          t2, 312619
                  srai         s7, s3, 21
                  fmul.s       ft1, ft1, fa3
                  remu         a6, ra, s5
                  flt.s        a3, fs9, fs10
                  fmv.x.w      s7, ft11
                  fcvt.w.s     t5, ft6
                  srl          s0, t0, t5
                  mulh         s10, a2, s5
                  fcvt.wu.s    s6, fs2, rdn
                  xor          a6, t5, s0
                  sra          a4, s1, s10
                  or           t2, t1, gp
                  fmul.s       ft0, ft1, fs11, rup
                  remu         sp, ra, gp
                  srl          ra, t6, zero
                  xor          s11, s11, tp
                  mul          s2, s4, s6
                  fsgnj.s      fs7, fa5, ft0
                  srl          s2, a3, s7
                  fsgnjn.s     fa3, fa5, fs3
                  mul          a6, a6, a2
                  fadd.s       fa1, ft10, fs0, rne
                  xor          a1, a0, s10
                  rem          s10, t4, a6
                  sll          s3, a5, sp
                  fmv.w.x      fa0, a1
                  fsgnjx.s     fa4, fs7, fa6
                  or           a6, s2, t4
                  mulhu        a7, t1, a2
                  mulh         s10, a2, s2
                  fmv.w.x      fa7, s1
                  nop
                  srai         a5, a5, 28
                  fsqrt.s      fa5, ft10
                  fsqrt.s      fa7, fa5
                  srli         s4, t6, 1
                  srl          a4, tp, a1
                  lui          t5, 981114
                  mul          a6, a6, t6
                  fsgnjx.s     fs10, ft1, fa1
                  fmin.s       ft11, fa1, fs9
                  slt          a6, s9, t5
                  fsgnjn.s     fs0, fs4, ft10
                  sltiu        t0, s1, -1824
                  srl          s4, t0, tp
                  xor          gp, s7, s7
                  fmv.w.x      ft4, t5
                  fmv.w.x      fa0, t0
                  ori          s2, s11, 1750
                  flt.s        t0, fa7, fa6
                  rem          s7, s5, a0
                  addi         s9, t1, 569
                  fsqrt.s      ft7, ft10
                  ori          s0, sp, -227
                  fadd.s       ft3, fs3, fa6, rdn
                  srai         a5, a5, 25
                  divu         s6, s8, t1
                  fdiv.s       fa6, fa3, fa2
                  fcvt.s.wu    ft3, sp, rtz
                  fmul.s       fs10, fa3, fa0, rdn
                  remu         s4, s7, a1
                  mul          s0, gp, s7
                  rem          a4, gp, t4
                  feq.s        a6, ft0, ft7
                  mulhsu       s8, t0, t4
                  and          zero, gp, a7
                  sll          a1, s4, t5
                  fsgnjn.s     fs9, ft6, ft2
                  divu         t5, gp, s6
                  remu         s8, t1, a2
                  fle.s        s9, fa0, ft5
                  fcvt.s.wu    fa7, s7, rne
                  divu         t6, t6, tp
                  fmv.w.x      fa6, t5
                  sltiu        s0, s2, 934
                  fsgnjx.s     fs11, fs6, fs6
                  fdiv.s       fs8, ft9, ft4, rup
                  fsub.s       fs4, fa2, ft0, rtz
                  or           s4, gp, t2
                  rem          a0, s10, s7
                  ori          gp, s1, 5
                  srli         t3, s1, 12
                  fadd.s       ft7, fs7, fs8
                  andi         sp, a2, 1725
                  srli         s11, s8, 10
                  fsgnjn.s     fa5, fa3, ft5
                  slt          s4, s11, a5
                  mul          gp, sp, t6
                  rem          a3, s1, t4
                  mul          a7, a2, a3
                  mulh         s3, s4, ra
                  sltu         a3, tp, sp
                  fle.s        s8, ft3, fs3
                  fsgnj.s      ft11, fs4, ft9
                  mulh         s2, t4, t3
                  rem          t0, s1, s7
                  sltiu        s10, s0, 565
                  and          s7, gp, s11
                  div          s9, t5, a7
                  rem          t5, t6, s9
                  flt.s        gp, fs2, fa7
                  feq.s        t0, ft3, fs8
                  or           s2, a3, s8
                  fclass.s     s5, ft10
                  auipc        s10, 931083
                  mul          s8, a6, s4
                  mulhu        s7, sp, s2
                  lui          s6, 1032392
                  and          zero, s10, a4
                  flt.s        a0, fs10, ft3
                  fle.s        a3, fs7, ft2
                  fsgnj.s      ft9, ft10, ft2
                  xor          s0, s5, s7
                  fsgnjn.s     fs6, ft3, fs0
                  mulhsu       a5, a7, a4
                  flt.s        a5, fa3, ft7
                  fmv.w.x      ft2, s8
                  srli         t3, s8, 22
                  fmul.s       ft0, ft4, fa7
                  div          sp, t2, s6
                  or           s2, t6, t4
                  fcvt.wu.s    s4, fa5, rne
                  srai         s11, s0, 5
                  nop
                  fadd.s       fs5, fa5, fs8, rtz
                  srli         s1, t5, 23
                  or           zero, s9, a0
                  fsub.s       fs7, fs3, ft5, rne
                  div          t5, s3, t5
                  mulh         a6, s5, t3
                  fmin.s       ft2, ft7, ft9
                  mulhu        t5, a0, sp
                  fmv.x.w      t0, fa4
                  addi         s8, a4, 2003
                  slli         s5, a1, 20
                  fsub.s       fs9, fa4, fa6
                  fmv.x.w      ra, fs11
                  fmin.s       ft1, fs7, fs9
                  sub          a7, tp, s4
                  or           a6, a2, a4
                  fadd.s       ft6, fa1, ft11, rtz
                  fsgnjn.s     fs9, fs4, fs3
                  fsgnjx.s     fs6, fs10, fa7
                  fcvt.s.wu    ft11, t2, rmm
                  andi         s1, tp, -653
                  srl          a6, s5, s10
                  fmax.s       fs7, fs6, ft6
                  fmin.s       ft7, ft11, fa6
                  sra          ra, a4, a2
                  srli         t3, a3, 21
                  mulh         t2, s1, gp
                  fmv.w.x      ft3, a0
                  slt          a2, s11, s5
                  fsgnjn.s     ft2, fs11, ft7
                  sra          zero, gp, t3
                  fcvt.s.wu    fa3, s4
                  xori         t6, tp, -1545
                  add          sp, a4, a7
                  nop
                  ori          s11, a5, 2035
                  divu         a5, t6, s2
                  fadd.s       ft1, fa0, ft10
                  srli         s7, t4, 24
                  fsgnjn.s     ft10, fa1, ft9
                  fsgnj.s      fs6, ft1, fa5
                  sltu         s11, ra, a7
                  slti         s9, s4, 1580
                  slti         s5, a7, 989
                  rem          a7, zero, t4
                  mulh         a6, s10, a0
                  addi         s4, a6, -1358
                  srai         t5, s5, 31
                  fadd.s       fa7, fs10, fa5
                  fadd.s       fs11, fs6, fs0, rne
                  slli         s1, a5, 27
                  mulh         a7, s11, a2
                  fsqrt.s      fs7, ft2, rtz
                  xor          t0, t5, t5
                  sra          sp, a0, gp
                  nop
                  srl          sp, s7, t4
                  sll          a5, zero, s9
                  nop
                  sltiu        a6, s5, -979
                  fcvt.s.wu    ft10, a1
                  sra          ra, s9, s11
                  slt          t5, s11, a0
                  sub          t0, t3, t5
                  sltiu        s6, ra, 549
                  auipc        s1, 943384
                  addi         a4, gp, 1073
                  mulhsu       s8, s1, s7
                  lui          s8, 737687
                  fdiv.s       ft3, fs5, ft8
                  fmin.s       fs2, ft7, ft6
                  fsgnjn.s     fa5, ft6, ft9
                  fsgnj.s      fa3, ft0, fa2
                  fcvt.s.wu    fa4, t1, rdn
                  sltu         s9, t6, s11
                  remu         s7, gp, a6
                  slti         s1, s4, 876
                  flt.s        a4, ft3, ft6
                  addi         a5, a4, -1826
                  ori          ra, s7, -148
                  add          s1, s0, zero
                  lui          s6, 121243
                  mul          a5, t5, s7
                  slt          ra, t2, s8
                  addi         t0, t3, -1392
                  and          s9, zero, sp
                  fcvt.wu.s    t6, ft0, rmm
                  sll          a7, s3, a0
                  flt.s        s9, fs6, fs4
                  sll          t3, t1, zero
                  srai         a5, a3, 8
                  feq.s        s1, ft3, fa2
                  srli         a1, t3, 14
                  addi         ra, t6, -91
                  fsgnj.s      fs1, fs5, ft7
                  fadd.s       fa2, fa6, fs7
                  fmv.w.x      fs9, t2
                  ori          zero, a1, 542
                  fclass.s     a7, ft6
                  fcvt.s.w     fs2, a2, rne
                  lui          t6, 340939
                  fmul.s       ft0, fa4, ft11, rne
                  andi         s3, a7, 679
                  flt.s        s4, ft5, fa7
                  remu         s9, zero, t3
                  divu         s10, s7, tp
                  fmul.s       fa3, fa1, fs9, rmm
                  fsgnjx.s     fa2, ft0, fa1
                  auipc        a1, 150876
                  fsqrt.s      ft1, fs10, rne
                  divu         a7, a7, zero
                  andi         s0, s4, -2006
                  sltu         t5, s4, a7
                  mulh         t5, s10, sp
                  fmv.x.w      ra, ft9
                  srl          t0, sp, a4
                  sub          s1, s2, s6
                  or           s6, s1, a3
                  slli         t5, a7, 27
                  slt          a5, s0, s11
                  remu         s2, a0, a1
                  or           t3, s7, s10
                  xor          t2, a6, t1
                  fsgnjn.s     fs1, ft0, ft1
                  sltiu        gp, a0, -1590
                  fclass.s     s8, fa2
                  rem          s3, a0, a6
                  fmax.s       fs3, fa5, fa1
                  fmin.s       fa1, ft4, fa3
                  flt.s        t6, fs4, ft7
                  fsgnj.s      fs7, fs3, fs7
                  mul          s11, s8, t3
                  fsgnjn.s     fs0, ft1, ft5
                  sub          t0, a0, t1
                  fcvt.wu.s    t6, fa6, rup
                  fmul.s       fa7, fs3, fs4, rne
                  srai         ra, a2, 31
                  rem          a6, s8, a4
                  flt.s        s8, ft1, ft4
                  fle.s        ra, ft5, ft0
                  fmin.s       fs8, ft4, fs0
                  srai         zero, a4, 13
                  sltiu        a1, t3, 835
                  add          a7, t1, t0
                  srai         s3, a5, 3
                  xori         t3, s0, 117
                  fsgnjx.s     fs11, ft7, ft0
                  sub          ra, tp, t5
                  fle.s        a2, ft4, fa3
                  fmul.s       ft3, ft0, fs6
                  slli         s11, t6, 29
                  slti         a6, s1, 304
                  fsgnjn.s     ft9, fa4, ft9
                  addi         s7, a5, 262
                  fsgnj.s      ft3, fs4, fs4
                  fsgnj.s      fs4, fs1, ft10
                  ori          s1, s10, -794
                  add          a7, a5, s8
                  fadd.s       ft2, fs10, fs11, rup
                  fmv.w.x      fs2, s1
                  fcvt.wu.s    a5, fs5
                  fsgnj.s      fs4, ft1, ft10
                  fcvt.wu.s    s0, ft8
                  slt          zero, t0, a5
                  slt          t3, t2, t3
                  fsqrt.s      ft10, fs10
                  andi         s5, a1, 1258
                  mulhu        gp, s5, a3
                  fmv.w.x      fs10, a7
                  fcvt.wu.s    gp, fs10, rdn
                  sltiu        s11, s9, 848
                  flt.s        s10, ft11, fs10
                  fsub.s       fs11, fa3, fa5
                  ori          s7, s1, 1717
                  fcvt.wu.s    t3, fa5, rmm
                  sll          s11, t3, a5
                  xor          s5, s4, a4
                  add          s6, a6, s5
                  fsgnjx.s     ft7, fs7, fa1
                  sub          s10, s6, a0
                  div          t2, gp, s9
                  fcvt.w.s     s6, fs2, rdn
                  fmv.w.x      fs5, s9
                  srl          s8, s9, s9
                  nop
                  fmax.s       fs5, fs8, fs0
                  fmin.s       fs8, fa6, fa2
                  remu         a1, t0, a0
                  div          ra, s4, a0
                  andi         s9, s4, -23
                  div          s2, tp, t2
                  fsub.s       fs6, fs1, fs3, rne
                  srli         a2, s3, 26
                  div          s1, a0, s5
                  flt.s        t6, fs10, ft5
                  srl          sp, a1, t5
                  sub          a7, s2, a5
                  lui          t3, 808609
                  fsub.s       fs7, fa0, ft7
                  xor          s3, t2, a0
                  feq.s        a2, ft7, fs5
                  sll          a2, t6, s0
                  mulhsu       a1, s7, a1
                  and          s6, s5, t4
                  rem          a1, t6, a4
                  sra          t3, s10, ra
                  fmv.x.w      s8, ft0
                  fcvt.w.s     a3, ft2
                  auipc        s3, 499156
                  fmax.s       fa1, ft0, fa1
                  fmax.s       fa3, fa4, fs10
                  and          s4, s11, a0
                  feq.s        s9, ft10, fa4
                  fcvt.wu.s    zero, ft4, rup
                  fmax.s       fa6, fs3, fa6
                  sltu         s6, gp, s5
                  fdiv.s       fa2, fa0, fs6
                  feq.s        s10, fs10, fa1
                  srl          a2, s6, s3
                  add          s0, a0, t5
                  auipc        a0, 776494
                  xori         s0, t1, -579
                  and          s2, a6, s9
                  slli         s2, t3, 17
                  slt          t3, zero, s0
                  sltiu        ra, t3, 624
                  fclass.s     a7, fa5
                  flt.s        a6, ft5, ft5
                  rem          sp, s4, ra
                  sub          s9, s2, t2
                  or           s7, t1, a7
                  slli         t3, a0, 25
                  feq.s        zero, fa4, ft7
                  mulhu        a5, a6, gp
                  sltiu        t5, gp, 843
                  mulhsu       zero, ra, gp
                  srl          s9, s7, a4
                  andi         s3, ra, 1037
                  slli         s0, s6, 10
                  ori          s8, t6, 66
                  lui          zero, 616422
                  fcvt.w.s     t3, fa0, rup
                  fsqrt.s      fa6, fa7
                  feq.s        t0, ft1, fs11
                  xori         a7, s11, 568
                  srl          a2, s9, t4
                  slli         gp, a6, 3
                  fclass.s     t5, ft8
                  fmin.s       fs11, fa5, fs5
                  xori         t5, s1, -1158
                  sltiu        t3, s8, 1584
                  fmin.s       fs5, fa5, ft7
                  slt          s4, sp, t1
                  mulhu        a5, t2, t6
                  lui          s3, 379120
                  fsqrt.s      fs8, fa5
                  lui          t6, 794370
                  divu         t0, s8, a4
                  add          s9, s3, s8
                  fadd.s       ft3, ft0, fa3
                  addi         a2, s1, -286
                  fcvt.s.wu    ft7, a4
                  fcvt.w.s     a4, ft10
                  mulhsu       s3, a2, s5
                  sll          a1, ra, s8
                  xori         s2, zero, 1963
                  or           t6, s9, t6
                  fcvt.s.w     ft1, s0, rne
                  fmin.s       ft10, fs8, fa2
                  fsgnj.s      fa4, fa0, ft6
                  fsgnjx.s     fs7, fa4, ft5
                  fcvt.s.wu    fa4, t1
                  fadd.s       fs5, ft9, ft10
                  sra          s5, s8, s5
                  fcvt.w.s     t0, ft3, rne
                  sltiu        s1, zero, 1710
                  fcvt.w.s     s0, ft8, rup
                  fle.s        a2, ft6, fs11
                  fmul.s       ft8, ft1, ft0, rne
                  mulhsu       a0, s11, ra
                  or           s6, s10, t3
                  xori         s8, a1, 625
                  fcvt.w.s     a1, ft5
                  fmax.s       fs1, ft0, ft2
                  ori          s10, t3, 1774
                  nop
                  slli         a0, s3, 25
                  and          t6, s6, s5
                  nop
                  flt.s        t5, fs2, fa7
                  fmul.s       fs1, ft11, ft9
                  flt.s        s10, fs11, fs8
                  flt.s        zero, fs5, fs2
                  fadd.s       ft0, fa4, fa6
                  fle.s        ra, fs4, ft4
                  fclass.s     s3, fs0
                  and          s2, a5, t2
                  divu         gp, a6, s6
                  flt.s        t0, fs4, fs7
                  lui          a3, 876539
                  nop
                  fsgnj.s      fa1, fa7, fs2
                  or           s1, tp, s3
                  remu         zero, t0, t6
                  slti         a7, t1, 61
                  auipc        s6, 1033784
                  slli         ra, tp, 26
                  mulh         s1, s10, s8
                  andi         zero, t6, -283
                  fcvt.wu.s    a0, fa0
                  mulh         gp, a4, ra
                  fsgnj.s      fa4, fs9, ft3
                  fcvt.wu.s    ra, fs10, rmm
                  mulhu        s1, a1, a3
                  slti         t0, t6, 874
                  sra          a3, s5, a6
                  fcvt.w.s     s8, fa0, rmm
                  fcvt.s.wu    fs10, s7, rtz
                  sra          a1, t2, t3
                  ori          sp, s5, 1044
                  srai         s7, s0, 12
                  fcvt.s.w     ft10, t4, rdn
                  sll          s2, s9, s3
                  lui          t6, 892874
                  divu         gp, t5, s0
                  mulhsu       gp, t4, t5
                  xor          s7, tp, t2
                  feq.s        t6, ft6, fa7
                  fsqrt.s      fs6, fs11, rtz
                  fmax.s       ft11, fa5, fs3
                  addi         s0, s6, 589
                  and          s11, a2, t0
                  fsgnj.s      fs9, fs5, ft11
                  fmax.s       fs3, ft8, ft11
                  sub          sp, s6, a5
                  and          t5, a6, t1
                  xor          sp, a2, s2
                  feq.s        s2, ft5, ft2
                  rem          s1, t3, s11
                  xori         t6, t2, -870
                  mul          a7, t1, zero
                  fcvt.s.wu    ft1, t1
                  slt          a7, a4, gp
                  mulhu        s9, t1, a7
                  fmv.w.x      fa1, t6
                  addi         s3, s3, -577
                  addi         t5, gp, -842
                  fmin.s       fa5, ft11, ft7
                  auipc        sp, 776538
                  div          s1, a6, a3
                  slli         a4, t4, 16
                  lui          s10, 122779
                  div          t3, s3, s1
                  fdiv.s       fs0, fs5, ft0, rne
                  andi         s6, t2, 1612
                  fsub.s       fs4, fs3, fs2, rdn
                  rem          a7, s11, s7
                  add          ra, a1, s9
                  fsgnjx.s     fs3, fa0, fa1
                  nop
                  fmin.s       fs2, fs10, fa6
                  fclass.s     a0, ft4
                  div          sp, a7, s7
                  fsgnjx.s     fa4, fa4, ft2
                  fle.s        t6, fa5, ft2
                  mulhu        s5, gp, a6
                  mulh         zero, s7, a5
                  slti         s7, t0, -1344
                  sub          t0, s8, t3
                  sltu         s3, a6, s0
                  rem          s4, a1, a5
                  xor          a6, a0, t3
                  lui          s6, 797820
                  fle.s        s9, fs3, ft3
                  fsqrt.s      fs2, fs2, rdn
                  srli         s9, s7, 3
                  divu         s11, t5, a4
                  fle.s        a4, ft5, fa7
                  flt.s        gp, fs5, ft1
                  mulhsu       t2, a1, t2
                  addi         s8, t2, -1415
                  fmul.s       ft5, fa1, fs3
                  fcvt.s.w     ft10, s5, rup
                  fsgnjn.s     ft9, fs0, fs6
                  and          t6, s0, s9
                  fadd.s       fs1, fs1, fa2, rmm
                  fcvt.s.w     fa3, s10
                  fsgnjx.s     fa6, fs7, ft11
                  slt          a2, t3, t5
                  fsgnj.s      fs8, fs7, fa0
                  addi         zero, t2, -2024
                  feq.s        s11, ft5, fs5
                  srai         a4, a3, 30
                  flt.s        a3, ft1, fs9
                  sra          s5, a3, s5
                  rem          s9, t6, s1
                  fmul.s       fs5, fa5, ft8, rdn
                  fmv.w.x      fa1, a1
                  fcvt.s.w     ft10, s11, rtz
                  and          s9, s6, s10
                  divu         t3, t2, s8
                  auipc        t0, 1026809
                  fcvt.s.wu    fs0, sp
                  fcvt.wu.s    s5, ft3, rtz
                  xori         s9, s1, 1649
                  rem          t0, a5, a2
                  nop
                  fle.s        s1, fa5, fa7
                  fadd.s       fa2, ft10, ft5
                  div          a3, s0, tp
                  fmul.s       fs2, fs11, ft3, rup
                  add          s1, s6, zero
                  fsgnjn.s     fs1, fa3, fs2
                  fsub.s       fs4, ft5, fs5
                  slli         sp, s2, 10
                  rem          s6, s11, s10
                  xori         gp, t0, -1530
                  fsqrt.s      ft4, ft5
                  auipc        zero, 424416
                  fmv.x.w      s3, fa3
                  srli         a5, t1, 12
                  fcvt.wu.s    s2, fs8, rtz
                  and          t6, a6, t3
                  fcvt.wu.s    t2, fs7, rne
                  fcvt.wu.s    s5, fs4
                  remu         a5, tp, zero
                  mulh         s1, t4, a3
                  slli         t6, s4, 24
                  fle.s        t0, ft10, ft3
                  divu         t3, zero, a3
                  fmul.s       fa3, fs8, fa1
                  fsgnjx.s     ft6, ft10, fs0
                  sltu         s1, s2, t6
                  mulhsu       ra, t4, a4
                  xori         t5, t2, 240
                  fsgnjn.s     ft7, fs7, fs6
                  fle.s        s9, fs2, fs10
                  sltu         t2, s6, a7
                  auipc        a1, 556865
                  fsqrt.s      fs1, ft3, rne
                  add          a5, s5, t6
                  div          a1, s3, s10
                  fcvt.s.wu    fs11, tp
                  srai         t2, sp, 0
                  lui          s7, 175354
                  fsgnjn.s     ft1, ft1, ft1
                  remu         s8, s6, t6
                  addi         zero, s1, -1371
                  addi         s8, gp, -1177
                  sll          t5, s3, a7
                  nop
                  mulhu        ra, gp, s0
                  srli         t6, a4, 1
                  srl          a5, s3, a0
                  slt          a0, a2, s7
                  mulhu        a3, zero, s7
                  or           a4, t4, t2
                  sll          s1, a3, a0
                  fsub.s       fa6, ft0, fs1
                  fmul.s       fs8, ft8, fa6, rmm
                  slti         s1, s3, -409
                  slli         s2, a4, 24
                  lui          s8, 634640
                  fmul.s       ft4, ft2, ft7
                  nop
                  slli         sp, s0, 27
                  addi         s4, a2, -1852
                  lui          t0, 941084
                  fsqrt.s      fs1, ft3
                  ori          t3, s2, -993
                  sll          s7, sp, t6
                  fclass.s     t6, fs11
                  sltu         t6, a3, s1
                  sra          s2, t3, s0
                  sltiu        a5, t5, -1502
                  fcvt.wu.s    s11, fs8
                  andi         s10, zero, 394
                  slli         a0, ra, 18
                  and          s8, a7, a7
                  fcvt.s.wu    ft5, sp
                  addi         s2, s7, 1512
                  srli         s3, t4, 10
                  fmv.x.w      a3, fs7
                  or           a4, a1, tp
                  mul          a6, ra, s10
                  fdiv.s       fa0, ft7, fs5, rne
                  fmv.w.x      fa5, s6
                  ori          s2, a5, 688
                  fsqrt.s      fs6, ft0
                  fcvt.wu.s    ra, ft0, rdn
                  mul          t5, a2, a0
                  srl          t5, t2, t0
                  srai         s10, s2, 12
                  lui          s9, 741801
                  rem          s5, t4, gp
                  auipc        t3, 59094
                  fle.s        t0, fa7, ft8
                  mulh         s3, t0, s6
                  sll          t5, s0, gp
                  rem          t2, s7, s3
                  and          a2, s11, a5
                  auipc        a4, 827814
                  fcvt.w.s     s9, ft6
                  fcvt.s.wu    fs9, s5
                  fle.s        gp, fs9, fs4
                  fcvt.w.s     t0, ft10
                  nop
                  nop
                  rem          s0, sp, s3
                  ori          t2, s5, -1550
                  xori         s1, a3, 1718
                  mulh         t2, s11, a1
                  divu         t3, t2, s7
                  add          zero, s5, s2
                  fcvt.w.s     s6, ft5
                  fmax.s       ft10, ft1, fs5
                  fclass.s     s4, ft9
                  fmax.s       ft6, fs6, fs5
                  lui          a1, 888221
                  lui          gp, 202543
                  mulhu        t6, a1, s1
                  mulhu        a2, t2, s0
                  feq.s        s4, fs8, ft3
                  fdiv.s       fs1, fa7, fa1, rtz
                  nop
                  fle.s        s0, fs10, fs1
                  nop
                  feq.s        a6, fa6, fa4
                  fdiv.s       ft3, fs10, ft5
                  andi         a5, s9, -182
                  or           a5, gp, a6
                  div          s3, ra, s7
                  fsgnj.s      ft9, ft11, ft7
                  fmin.s       ft3, fs3, fs9
                  srl          t2, s10, s3
                  fmul.s       fa1, ft8, fs2
                  srl          t5, tp, s10
                  fdiv.s       fa7, fs11, fs1, rtz
                  feq.s        a7, fa7, ft9
                  rem          s8, s5, a1
                  fmul.s       fs4, ft3, fs6, rne
                  divu         s4, a0, t3
                  and          sp, s6, s8
                  sub          a0, a7, a5
                  divu         s3, a7, a4
                  fclass.s     sp, ft0
                  mulhu        ra, a5, s7
                  flt.s        s0, ft4, ft7
                  xori         s6, a1, 1384
                  div          a2, s1, t3
                  fmv.w.x      fs9, a4
                  fmv.w.x      fs5, ra
                  fmin.s       ft0, fs8, ft10
                  fsqrt.s      fs10, fs6, rtz
                  sltu         t2, s11, t3
                  mulhu        a4, s4, a4
                  fcvt.s.w     fs8, t0, rmm
                  fmul.s       ft0, fs4, fs7
                  fsgnjn.s     ft6, fs8, fs7
                  fmul.s       ft8, fa6, ft6, rtz
                  add          s10, s8, sp
                  add          a2, a7, s10
                  fsgnjx.s     fs6, ft1, fa5
                  fcvt.s.wu    fs11, tp
                  fmin.s       ft11, fa6, fa5
                  fsgnjx.s     fa1, ft5, fs7
                  fdiv.s       fa5, ft1, fa7
                  srli         s6, t3, 8
                  mul          a7, a1, a1
                  fcvt.s.wu    fs7, gp
                  sll          t5, s10, t5
                  slti         t2, t2, 871
                  flt.s        s5, fs9, ft4
                  divu         s10, s2, s5
                  fcvt.s.w     ft7, a7, rdn
                  fsub.s       fa4, ft11, fa2, rne
                  fmin.s       ft11, fa6, ft0
                  divu         a6, a7, a6
                  fmin.s       ft1, fs4, fs11
                  sltu         s8, s2, a5
                  srli         t3, t0, 31
                  mulhsu       a7, a0, s10
                  andi         t2, a5, 1372
                  srli         ra, s9, 5
                  andi         ra, s11, -996
                  slti         a0, a6, -2039
                  srl          t5, t2, a2
                  fcvt.wu.s    a6, fs8, rdn
                  sltiu        a7, a4, -314
                  sra          ra, s11, s6
                  srai         s6, a4, 6
                  or           t6, t3, s1
                  feq.s        t5, fa6, fa7
                  feq.s        t3, fs9, ft3
                  fadd.s       fa5, fs8, fs9
                  sub          s3, s11, s8
                  fadd.s       fa6, ft5, fa6, rtz
                  fle.s        sp, fs0, ft2
                  fmax.s       fs5, fa6, fs7
                  fcvt.s.wu    ft11, s3, rne
                  lui          t6, 335024
                  srai         a4, s9, 16
                  fdiv.s       fs11, ft3, fs10
                  sltu         s11, a7, s10
                  or           a2, a2, a2
                  and          a0, sp, t2
                  sub          s6, s10, gp
                  rem          t6, s3, t0
                  sub          s10, s11, s3
                  fsgnj.s      ft0, fs6, fa7
                  fclass.s     a4, ft7
                  sra          s5, t1, a0
                  nop
                  fmin.s       fs11, ft8, fs8
                  fcvt.wu.s    t2, fs2
                  fmul.s       ft11, fa0, ft1
                  feq.s        t6, ft4, fs2
                  fcvt.s.wu    fs9, a4
                  slti         a4, a6, 1071
                  xor          t3, t3, s0
                  addi         a0, a7, 1488
                  fmax.s       fs10, fs7, fs7
                  slli         s6, s0, 15
                  feq.s        t2, fs9, ft10
                  flt.s        s6, fa4, fs6
                  fcvt.w.s     s9, ft11, rne
                  srli         s0, s5, 24
                  nop
                  mulhu        a5, s8, s4
                  xori         t6, a3, -486
                  slt          t3, s1, s11
                  xor          s6, t5, sp
                  auipc        s10, 931185
                  srai         s5, s6, 3
                  flt.s        t2, fs9, ft3
                  srli         s3, s9, 2
                  nop
                  fcvt.wu.s    t0, fa0, rup
                  fcvt.s.wu    ft7, a3
                  fclass.s     s4, fs2
                  fsub.s       fs9, fs0, fa7
                  auipc        t0, 886054
                  fcvt.w.s     t3, fs2, rup
                  fmv.w.x      fs4, a7
                  or           sp, s9, s6
                  fle.s        a1, fs3, fs6
                  divu         t3, s3, t1
                  fsub.s       fs3, fs0, ft6, rmm
                  sll          a1, a3, tp
                  fsgnjx.s     ft1, fs7, ft8
                  or           t3, s11, t6
                  sra          gp, s11, tp
                  flt.s        a1, fs4, ft6
                  fsgnj.s      fs11, fs10, fa5
                  sltiu        a0, s2, -737
                  or           s9, t2, t1
                  fsub.s       fs11, ft11, ft9
                  and          s7, tp, a4
                  fclass.s     a2, ft10
                  fcvt.w.s     s9, ft2, rmm
                  slli         t0, t1, 18
                  srl          s5, s11, s2
                  sub          s3, s4, sp
                  fdiv.s       ft5, fs9, fa6, rtz
                  fsqrt.s      ft11, fs5
                  mulhu        t6, s8, s3
                  feq.s        t6, ft10, fa2
                  fmin.s       fs0, fs3, fs5
                  fmv.x.w      t0, fa3
                  fsgnjx.s     ft3, fs7, fs4
                  fmul.s       fa1, fs2, fs0, rup
                  lui          a5, 792413
                  fcvt.s.wu    ft7, a7, rup
                  slli         zero, gp, 2
                  fsub.s       ft1, fa1, ft2, rmm
                  mul          ra, s6, tp
                  rem          a0, s8, a4
                  slt          sp, s4, a4
                  sub          gp, a6, t5
                  flt.s        t6, fa1, fa7
                  rem          t2, s1, sp
                  fcvt.s.w     fs0, a3, rtz
                  fsgnjx.s     ft9, fs3, ft2
                  nop
                  sltu         a3, t4, s1
                  fmv.x.w      t0, fs4
                  sltu         a5, gp, t5
                  feq.s        a1, ft7, fs0
                  fcvt.s.w     fs11, a1
                  flt.s        s3, fs1, fa6
                  mul          sp, s7, s0
                  slti         s4, t5, 718
                  mulh         a0, a7, s7
                  remu         a5, tp, s11
                  fcvt.w.s     s8, fs0
                  srl          ra, t6, sp
                  xori         zero, s11, 769
                  mul          s9, a7, s1
                  fcvt.s.w     ft1, s2
                  fsqrt.s      ft7, ft4
                  or           t3, s2, gp
                  fdiv.s       fa2, fa7, ft8, rtz
                  slt          ra, s9, s6
                  mul          s10, tp, a6
                  and          a3, s0, s2
                  nop
                  lui          t5, 843604
                  auipc        s10, 680494
                  srli         s4, t0, 5
                  fsub.s       fs0, ft1, fa6, rne
                  and          a6, zero, t6
                  slti         a2, a4, 1533
                  mulhu        t2, a1, a6
                  fsgnjx.s     ft8, ft8, ft7
                  fclass.s     t2, fa5
                  mulh         s6, t1, sp
                  srai         t6, tp, 15
                  and          t6, s11, gp
                  sll          ra, s9, s1
                  fclass.s     gp, fs7
                  fmul.s       ft2, ft2, fs4, rup
                  slti         s9, s7, -1354
                  sltu         a6, ra, s8
                  mul          t6, gp, a3
                  srai         t3, a2, 11
                  add          s8, t1, s7
                  andi         zero, s11, -868
                  sll          a3, gp, a5
                  mulh         s6, s0, a1
                  mulhu        a0, t1, s6
                  fsgnj.s      fa3, fs10, fa1
                  add          t5, zero, a0
                  fmin.s       fa4, fs11, fs6
                  xori         s3, a0, 408
                  addi         a1, t2, -1310
                  srl          t0, s3, a4
                  fsub.s       fa5, ft5, fs10, rtz
                  fadd.s       fa3, ft2, ft2, rne
                  slt          s4, ra, s2
                  fadd.s       fs10, fa5, ft0
                  xor          s7, tp, s0
                  sll          zero, a6, a6
                  fmin.s       ft1, fa6, fs7
                  fmul.s       fs1, fs6, fa0
                  fdiv.s       fs9, fs9, ft10
                  xor          a5, s5, s8
                  fmul.s       fa1, ft0, fa7, rne
                  fle.s        s4, fs0, fs1
                  fmv.w.x      fa0, s11
                  mulh         s2, t1, s5
                  lui          s0, 107641
                  fadd.s       fs7, fa2, fs3
                  remu         s7, s4, a2
                  divu         t6, t5, s4
                  mulhsu       gp, s7, a6
                  fsqrt.s      ft1, fa5
                  sltu         a6, a6, s3
                  fcvt.wu.s    t0, fs1
                  feq.s        s4, fs9, fs7
                  nop
                  fsgnjn.s     fs9, fa1, ft3
                  divu         a1, t3, sp
                  sll          s0, s8, s8
                  sub          a2, a6, t2
                  srai         s8, t6, 10
                  sra          a5, t5, s4
                  fcvt.s.w     fs6, tp, rmm
                  fdiv.s       fa3, ft5, ft8, rmm
                  fsqrt.s      fs4, fs5
                  fmul.s       ft7, fa6, ft6, rup
                  fle.s        a6, fa3, fs2
                  xori         s1, s10, 1629
                  and          t0, a6, s7
                  xori         t3, t4, -663
                  xor          sp, s4, t0
                  addi         s10, s3, 1659
                  divu         zero, tp, s8
                  mulhsu       a5, sp, a1
                  fmv.w.x      ft3, tp
                  fdiv.s       fa7, fa6, fa4
                  sub          a2, a1, s1
                  rem          a2, t3, s0
                  fmax.s       ft10, ft6, fs5
                  fcvt.s.w     fa4, s4
                  feq.s        s0, fa0, ft10
                  fcvt.s.wu    ft4, a3
                  flt.s        s4, fs8, fs1
                  fmv.x.w      ra, fa3
                  mulhsu       t6, s7, gp
                  mul          s2, s5, a6
                  mulhu        t2, a0, tp
                  slt          s6, s3, s7
                  add          sp, a1, a3
                  sltu         a0, a6, a5
                  fdiv.s       ft3, fa5, fa2, rmm
                  mulhu        sp, a1, a5
                  flt.s        t3, fs11, ft9
                  fle.s        ra, ft0, ft10
                  divu         a2, t2, a1
                  slli         a2, s2, 23
                  andi         s6, s6, -1114
                  fcvt.w.s     t5, ft4, rne
                  sll          t3, a0, a4
                  xor          s4, a5, a3
                  mulhu        a5, s6, a7
                  nop
                  fcvt.w.s     gp, fs9
                  andi         s0, a4, -1908
                  rem          t6, sp, s6
                  sltiu        s3, zero, -631
                  fsgnjn.s     fa7, fa2, fa6
                  fmul.s       fs4, fs9, fs11
                  ori          s9, gp, -1918
                  andi         s7, ra, -475
                  fmv.w.x      ft10, zero
                  addi         a5, t3, 399
                  flt.s        t3, fs9, fs8
                  mulh         s2, s6, s5
                  fmv.x.w      s0, ft1
                  mul          a2, tp, a2
                  or           a3, t5, a4
                  sltu         t0, t4, t0
                  mulhsu       s5, a2, t3
                  mulhsu       t3, t6, a4
                  srli         s1, ra, 26
                  sll          s10, s0, gp
                  fdiv.s       fs0, fa6, ft2, rtz
                  mul          s7, s0, t6
                  srli         s1, tp, 11
                  fcvt.w.s     t3, ft4, rne
                  mulhsu       s4, t4, zero
                  feq.s        a6, fa0, fs9
                  sub          s1, t0, a1
                  fsub.s       fa7, fs3, fs9
                  fsqrt.s      ft1, ft2
                  mulhsu       s4, zero, t5
                  andi         a0, s2, 1701
                  fmul.s       fs6, fs3, fs5, rne
                  slt          a2, a0, s3
                  flt.s        s11, fs8, ft8
                  mulhsu       s6, a3, s2
                  fcvt.w.s     t6, fa3
                  slt          zero, a6, s1
                  remu         a5, s9, s1
                  nop
                  fcvt.s.w     fa6, t1, rup
                  nop
                  fsgnjx.s     fa7, ft3, fa2
                  srai         sp, t2, 12
                  mulhsu       s5, s6, t0
                  sltu         a0, sp, t1
                  fmul.s       fs11, ft9, ft3
                  fcvt.wu.s    a7, fa0, rmm
                  xor          a2, t6, gp
                  nop
                  slt          s6, a2, s2
                  sra          s2, t0, s1
                  fadd.s       fs9, fa7, ft8
                  add          s0, s1, t5
                  fsgnjx.s     fa2, ft3, fs6
                  srai         sp, t5, 22
                  slli         t0, s0, 4
                  fsqrt.s      ft4, ft9, rup
                  srli         a5, t1, 16
                  fcvt.wu.s    zero, fs9, rup
                  andi         a6, a2, 1142
                  fdiv.s       ft10, fs7, ft7, rmm
                  nop
                  and          a5, a1, s3
                  fmv.w.x      fa4, s10
                  mulhsu       s10, t2, s11
                  fsgnjn.s     fs8, ft9, fs6
                  fclass.s     a0, ft11
                  fcvt.wu.s    t2, ft11, rne
                  fcvt.s.wu    ft2, s2, rmm
                  divu         s2, s9, a5
                  sll          t2, ra, a4
                  fmv.x.w      s5, ft5
                  feq.s        t6, fs11, fa0
                  mulhu        s7, a0, s7
                  sll          t3, s11, a0
                  fsgnjn.s     ft11, fs5, fs10
                  fle.s        s8, fs2, fs3
                  fcvt.s.wu    fs1, t4, rtz
                  sra          s5, a5, s2
                  fmv.x.w      a2, ft4
                  fcvt.w.s     t2, fa5
                  rem          s3, s7, zero
                  srli         a3, a3, 1
                  mul          ra, s10, s6
                  fsqrt.s      fs1, fa7
                  fmv.w.x      fs5, a1
                  slt          s5, ra, s5
                  fsgnjx.s     ft4, ft3, fa4
                  srl          s4, a2, t2
                  slti         t0, a1, 1229
                  srai         ra, s8, 26
                  addi         a6, a3, 1189
                  flt.s        sp, fs11, ft8
                  mulhsu       s7, s6, tp
                  fdiv.s       fa5, fs5, fs4, rdn
                  auipc        ra, 561213
                  and          s0, a4, a6
                  xori         s11, ra, -668
                  fsgnjn.s     ft9, fs8, ft4
                  nop
                  fcvt.w.s     t5, ft2
                  fcvt.s.wu    ft9, s11, rup
                  srai         ra, s4, 26
                  add          s6, gp, gp
                  srl          s2, s4, t4
                  srai         sp, a3, 13
                  slt          s4, zero, t0
                  srai         s0, s7, 13
                  or           s1, t0, s10
                  mulhsu       s7, s2, t1
                  fcvt.s.w     fs4, a3
                  slti         s6, a0, 1886
                  sub          s11, s1, gp
                  fmax.s       fa7, fs9, fs2
                  fle.s        a7, ft11, ft9
                  sltu         s3, sp, t6
                  fsgnjx.s     fs0, fs2, ft8
                  fadd.s       ft7, fa3, ft4
                  fmv.x.w      s2, ft3
                  add          s6, ra, a0
                  fmax.s       fs5, ft6, fa7
                  fle.s        s6, fa6, fs11
                  andi         t6, tp, -600
                  fmv.x.w      s5, ft9
                  slt          a3, s1, t4
                  flt.s        s8, ft9, fs7
                  divu         a1, t3, a2
                  andi         t5, s3, 2012
                  nop
                  sra          t0, s4, sp
                  sltu         a3, a0, s4
                  fcvt.s.wu    fs5, a4, rdn
                  slti         t6, a3, -237
                  mulhu        a7, a6, t0
                  fmv.x.w      a0, fa2
                  fle.s        s5, fs9, fa6
                  mul          a6, s6, t2
                  feq.s        a7, fs9, ft10
                  mulhsu       t3, tp, s0
                  flt.s        a2, fs3, ft10
                  fcvt.wu.s    s5, fa3, rmm
                  slt          a7, a1, ra
                  xori         s7, s9, 1055
                  fmv.x.w      s11, fa1
                  fcvt.w.s     s3, fs5, rmm
                  and          a4, s10, zero
                  auipc        t0, 114321
                  fdiv.s       ft5, fs8, fa7, rne
                  fclass.s     s7, fa1
                  fsgnj.s      fa5, fa3, ft7
                  sra          zero, s2, t4
                  feq.s        ra, ft7, fs11
                  srli         t6, s8, 2
                  fmin.s       fs11, fa4, fs2
                  rem          a0, sp, s1
                  rem          t2, s2, a1
                  nop
                  fclass.s     s11, fs4
                  nop
                  slli         s7, t4, 31
                  mulhu        a4, a5, s1
                  mulhu        t3, a6, s2
                  auipc        sp, 741613
                  mulhsu       t3, t0, a2
                  xor          s11, t3, t5
                  fcvt.s.wu    fs0, tp, rtz
                  fcvt.w.s     s1, fa6
                  rem          s9, s4, t2
                  mulhsu       s9, a0, s2
                  fcvt.s.w     ft6, a5, rtz
                  fcvt.wu.s    a4, fs3
                  fcvt.wu.s    s0, fs7
                  fsub.s       fs6, fa2, fs2, rdn
                  slli         t0, s7, 29
                  fmv.w.x      fa4, s9
                  sltiu        s2, s7, -1121
                  fsub.s       fa7, fs2, ft8, rdn
                  fmin.s       fs7, fs11, ft5
                  fcvt.s.w     ft10, t1, rmm
                  and          a3, a2, t3
                  fsgnjn.s     ft8, ft8, fs7
                  mulhu        t0, t0, gp
                  or           s9, t2, s0
                  xori         a4, t0, -809
                  sltu         t6, a3, t6
                  divu         s2, gp, s6
                  fmin.s       ft5, fa2, fs1
                  srli         s5, s4, 2
                  slli         s5, a6, 27
                  slli         s1, t6, 1
                  fle.s        t3, fa7, fs8
                  srai         s6, a3, 16
                  mulhsu       a2, t5, s6
                  srli         t0, s6, 6
                  remu         t5, t5, a4
                  sltiu        s2, zero, -338
                  add          s4, zero, a0
                  fmv.x.w      a2, ft10
                  fsgnjn.s     fs3, fs8, fa3
                  xor          gp, t2, a1
                  fmv.w.x      fs1, a6
                  slt          t5, a6, a0
                  andi         s3, s4, -694
                  and          t3, tp, t4
                  andi         s5, s3, -1545
                  fsqrt.s      ft2, fa6
                  slt          zero, s8, t0
                  fclass.s     s7, fs4
                  xori         s8, t4, -1223
                  fsqrt.s      fa0, fa2
                  or           a5, sp, s4
                  fdiv.s       ft9, fs0, ft5, rne
                  mulh         zero, s6, s7
                  mul          s10, a6, s10
                  fcvt.s.w     fa3, s10, rup
                  addi         s0, s1, -258
                  srai         t0, s10, 6
                  fdiv.s       ft3, fa5, ft6, rdn
                  ori          s8, t4, -500
                  fcvt.w.s     t5, ft4, rdn
                  fmin.s       fa6, fs1, fs5
                  slli         a7, a0, 11
                  lui          s8, 234320
                  sub          s3, a5, s6
                  fmax.s       ft4, fa3, fs5
                  ori          sp, s9, -269
                  srai         s7, s7, 17
                  mul          a1, s4, s1
                  sub          a5, s11, tp
                  sub          a5, s3, a0
                  srl          t3, ra, t6
                  fsqrt.s      fs4, ft10
                  fclass.s     gp, fs10
                  fcvt.w.s     a5, fa0
                  fmin.s       fs5, fa7, ft11
                  fmul.s       fs4, ft5, ft1
                  remu         s6, s6, a4
                  fsqrt.s      fa1, ft11, rdn
                  lui          t6, 41079
                  ori          t6, zero, -918
                  andi         t5, t4, -1028
                  nop
                  flt.s        a1, fs1, fs9
                  srai         s2, t1, 1
                  xor          a7, s4, s11
                  addi         t2, t2, -283
                  rem          ra, t4, t2
                  mulhsu       a0, s7, t3
                  mulhsu       s2, a6, t4
                  srai         s6, s0, 14
                  or           t0, a1, t6
                  mul          s9, t4, s4
                  mul          s2, a4, s11
                  sra          s2, ra, t4
                  mulh         s1, gp, a0
                  fmv.x.w      a7, ft8
                  sub          gp, s2, gp
                  sltiu        t3, t6, -1370
                  sra          a6, a5, zero
                  slli         s8, s3, 31
                  sll          a0, sp, a1
                  fcvt.s.wu    fs5, tp, rne
                  fcvt.s.wu    fs6, s11
                  remu         t5, s8, ra
                  or           s0, t1, s0
                  sra          t5, t3, a6
                  fle.s        s2, fs4, fs9
                  sra          a4, t4, zero
                  fmax.s       fs2, ft2, fs1
                  fsgnjx.s     fs3, ft2, fs1
                  fsqrt.s      fs0, fs6
                  xori         a4, a2, -869
                  srai         s6, a0, 6
                  srli         t5, gp, 20
                  fcvt.s.wu    fs3, gp
                  sll          s1, a2, gp
                  fmul.s       fs7, ft9, ft1, rtz
                  fmv.x.w      s10, ft6
                  fmul.s       ft11, fs2, fs6
                  fmv.w.x      fa2, t1
                  fcvt.s.wu    ft4, a2
                  auipc        a2, 100463
                  fclass.s     t0, ft8
                  fmv.x.w      s6, ft6
                  srai         s0, a3, 27
                  sltiu        s5, t0, 1171
                  fle.s        s6, fs7, fs11
                  fsqrt.s      ft8, ft8
                  sltiu        s4, sp, -578
                  nop
                  flt.s        s1, fs3, fs5
                  xori         gp, a6, 792
                  addi         s2, s3, -1269
                  fadd.s       fa1, ft7, fs6
                  nop
                  fsqrt.s      fs0, ft8, rup
                  fclass.s     a4, fs0
                  remu         a4, t5, t1
                  divu         t5, a5, s4
                  fmv.x.w      a0, fa5
                  srli         s10, t0, 10
                  fmv.x.w      a6, fa0
                  slli         s4, t3, 8
                  srai         zero, s4, 16
                  auipc        s6, 759690
                  xor          s1, s9, s0
                  remu         sp, a3, tp
                  mulhsu       t0, sp, t1
                  fcvt.w.s     s9, ft6
                  sltu         s11, s5, s8
                  sll          s0, s8, s10
                  srl          s0, sp, ra
                  feq.s        sp, ft11, ft6
                  slt          s10, a0, a5
                  xori         a6, s9, -798
                  andi         a2, t5, 675
                  fcvt.w.s     t2, ft5
                  mulh         a1, s2, t3
                  fmv.x.w      a0, ft6
                  fmv.x.w      t0, ft6
                  addi         a5, s5, 1766
                  fmax.s       fa7, fa6, ft7
                  fmul.s       fa7, fs0, fa3, rtz
                  slti         a6, s2, 444
                  fle.s        s11, ft7, ft4
                  mul          a3, s4, s5
                  nop
                  flt.s        a0, fs6, fs10
                  remu         s10, t0, s11
                  fle.s        a2, fa5, ft7
                  fsgnj.s      ft11, fs4, fa7
                  lui          a1, 433825
                  fsgnj.s      fa4, ft3, ft5
                  slt          t3, s9, zero
                  srl          a2, sp, s11
                  flt.s        a2, fa1, fa6
                  fsgnjn.s     fs0, ft1, fa7
                  nop
                  add          a4, s10, a0
                  fcvt.s.w     fa4, s7
                  slti         s11, s9, 20
                  lui          s1, 442629
                  sll          t6, sp, t1
                  addi         s10, s1, -1385
                  sltiu        s10, tp, -988
                  slli         sp, s5, 16
                  fmv.x.w      a0, ft3
                  addi         a2, zero, 448
                  feq.s        s7, fa6, fa6
                  or           s9, a6, s9
                  div          s1, t2, sp
                  ori          sp, s10, 916
                  slli         gp, gp, 29
                  auipc        a2, 880453
                  xori         a2, a5, -963
                  feq.s        a4, fs1, ft8
                  fsqrt.s      fs4, fa3, rmm
                  slt          a0, t1, ra
                  mulh         a0, t2, s3
                  slti         s8, sp, -198
                  fmul.s       fs9, fs10, fs2
                  slli         s2, s11, 14
                  mulhsu       s2, zero, a4
                  mulhu        a4, a7, t6
                  slli         t6, a5, 3
                  mul          t3, s8, gp
                  fsub.s       fs5, fa6, fs8, rup
                  slli         t3, s1, 13
                  fsgnjx.s     ft8, ft9, fs10
                  slti         s5, t0, -561
                  mulhsu       t3, s7, sp
                  and          zero, a6, s7
                  feq.s        a7, ft5, ft10
                  fmv.w.x      fs10, s7
                  flt.s        a2, fa7, ft11
                  mulhu        a3, s5, zero
                  fcvt.s.wu    fa1, a2
                  fsgnj.s      fs4, fs0, fs0
                  or           t3, t0, s9
                  srai         a7, tp, 26
                  nop
                  xori         t3, a0, -189
                  fcvt.s.w     fa7, a4, rne
                  sub          s5, s7, a1
                  remu         s8, a0, a1
                  fsgnjx.s     fa5, ft3, fs2
                  slt          s4, s11, gp
                  divu         a6, t2, sp
                  slt          t0, t0, s8
                  fsgnjn.s     fs6, ft10, fs2
                  xori         s10, t3, -325
                  mul          a2, t4, a3
                  div          s6, t1, a2
                  fmv.x.w      s3, ft4
                  fcvt.s.wu    fs9, tp, rdn
                  fmax.s       fs4, fa7, ft10
                  srli         s7, a7, 27
                  mul          a2, a6, t1
                  srl          a4, t1, tp
                  srli         t3, s7, 31
                  slti         a2, a1, -1536
                  lui          a4, 233883
                  add          s5, zero, s9
                  nop
                  and          t2, t1, t5
                  div          a7, zero, a1
                  fmv.x.w      ra, ft11
                  divu         zero, a1, s11
                  and          a3, s4, t6
                  addi         s11, a3, -70
                  fcvt.wu.s    s10, fs4, rne
                  fmul.s       ft7, ft1, fs11, rmm
                  addi         s7, s11, -2025
                  fle.s        zero, fa7, fs2
                  fclass.s     sp, fs5
                  fsub.s       fa3, fs3, fs11, rdn
                  srai         a7, s4, 16
                  and          a1, a1, a3
                  mul          a1, s7, s0
                  or           s10, a0, a2
                  sltiu        s6, a7, 1064
                  add          t0, s7, s9
                  mulhu        t6, a1, t2
                  fmin.s       fs10, fs8, fs4
                  lui          s1, 754155
                  srl          a4, s0, a1
                  fle.s        a3, ft5, ft1
                  fle.s        t5, fs7, fs1
                  fcvt.s.w     ft3, sp, rdn
                  fsgnjn.s     fs0, fs11, ft6
                  fle.s        s7, fa6, fs1
                  fsgnjn.s     fs1, fs9, ft7
                  and          s0, s5, zero
                  fdiv.s       fs8, ft11, ft9, rne
                  or           a2, tp, zero
                  nop
                  mulh         s5, s7, t5
                  fmax.s       fa6, fs5, fa3
                  fsgnjn.s     ft1, ft5, fs10
                  fadd.s       ft6, fs6, ft8, rup
                  xor          t3, s10, s5
                  mulhu        s11, s0, a3
                  fsub.s       ft2, fa1, fs5, rdn
                  fcvt.s.w     fa4, a4, rmm
                  rem          t5, s9, s9
                  mul          s1, t2, s8
                  fmul.s       ft10, fs6, fs10, rmm
                  fcvt.wu.s    zero, ft7
                  slli         gp, s8, 25
                  andi         t3, sp, 624
                  divu         s11, s9, t4
                  div          s9, s2, ra
                  fsub.s       fa3, ft9, fa3
                  rem          s11, s6, a5
                  fmul.s       fa1, ft2, fs1
                  fcvt.s.w     fa6, a6
                  fmul.s       fa2, ft10, ft2, rup
                  div          a6, zero, a6
                  ori          s11, t0, -726
                  nop
                  fmin.s       ft11, ft2, fs9
                  fmul.s       fa7, fa1, fs8, rmm
                  fclass.s     s8, ft9
                  fsqrt.s      fs4, fs7, rne
                  fle.s        ra, ft7, fa3
                  fsgnj.s      fa6, ft11, ft7
                  feq.s        a5, fs8, fs10
                  fsgnjn.s     ft1, fs8, fs1
                  fmin.s       fa1, fs8, ft1
                  fsgnjn.s     fa0, ft0, ft2
                  flt.s        s8, fa2, ft2
                  fdiv.s       fs4, ft8, fs6, rmm
                  fcvt.s.wu    fs0, s8, rup
                  fsub.s       ft8, fs7, ft4, rdn
                  and          s3, s0, t5
                  nop
                  fsqrt.s      fs1, fs1, rup
                  and          s11, t6, s5
                  slti         a0, s2, -72
                  sltu         t6, s2, t1
                  fclass.s     t6, ft11
                  mul          a0, t0, t0
                  fsub.s       fs8, fa5, fs8, rup
                  flt.s        s9, ft6, fs9
                  fmv.w.x      ft11, ra
                  mulhsu       gp, t0, s1
                  xori         s6, t2, -969
                  or           s3, t2, a2
                  fle.s        s7, ft4, fa2
                  fcvt.s.wu    fs4, s3
                  mulhsu       a1, s0, s6
                  mul          a2, t3, t4
                  slt          s2, a5, a4
                  fle.s        s11, fs6, ft9
                  mulhu        s2, a1, a0
                  mul          s11, t4, s11
                  fsqrt.s      fa0, fa3
                  fcvt.wu.s    s11, fs6
                  divu         t2, a2, a7
                  fcvt.wu.s    s3, ft5, rup
                  fsgnjx.s     ft9, fa0, fs0
                  fadd.s       ft0, ft3, fs1, rne
                  fcvt.s.wu    fs6, a0, rmm
                  add          s7, t6, a4
                  fsgnj.s      fs2, ft0, fa3
                  slti         s3, t0, 822
                  lui          t6, 584930
                  div          s11, a1, a3
                  fcvt.wu.s    a4, fs2, rne
                  ori          s3, s1, -1946
                  fmv.w.x      ft5, t0
                  flt.s        s5, fa4, ft10
                  fsub.s       fs4, fa7, ft3, rup
                  fsqrt.s      fs9, ft1, rup
                  fsgnj.s      fa1, ft1, ft6
                  sll          t5, s5, s10
                  sltu         ra, a4, s3
                  sll          a4, ra, s6
                  fle.s        a6, fs9, fs3
                  fadd.s       fs5, fa2, ft7
                  xori         t6, sp, 1047
                  divu         t3, a7, t2
                  and          a7, s3, s9
                  mul          a2, t3, t6
                  fle.s        sp, fa2, fa6
                  slt          t2, a2, a5
                  slt          s10, sp, s6
                  flt.s        s1, fa3, fa4
                  fsgnj.s      fs4, ft2, fs10
                  fsgnjx.s     fs7, fs6, fs6
                  and          a7, ra, s8
                  mulhu        t0, s8, a1
                  feq.s        a5, fa6, ft2
                  fdiv.s       ft8, fs11, fs5, rtz
                  sltu         s2, s3, t5
                  rem          t6, t1, s3
                  fsgnjn.s     fa1, fs8, ft3
                  mul          s6, s8, s5
                  srl          a6, s7, t5
                  slt          a1, t4, a7
                  fcvt.wu.s    t5, fs6, rmm
                  sub          s2, a3, a0
                  fcvt.w.s     a0, fa3, rtz
                  fsgnjn.s     ft3, fa7, fa5
                  feq.s        t5, ft5, ft0
                  fmv.x.w      a7, ft8
                  fcvt.s.wu    ft9, s3, rne
                  slli         s8, s6, 3
                  slti         s4, sp, 1528
                  add          s9, zero, s8
                  fcvt.w.s     s1, ft11
                  divu         ra, s8, s6
                  fcvt.s.wu    fa3, t2
                  fmax.s       ft6, fa7, fa0
                  sra          s7, a7, s0
                  fmax.s       ft1, fs0, ft7
                  fmax.s       fs10, fs9, ft4
                  fsgnjx.s     fa2, fs11, fs1
                  or           a2, t6, tp
                  slt          a5, s9, s8
                  mul          t0, t0, s1
                  fmin.s       fs8, fs6, fa1
                  auipc        a4, 240891
                  or           s5, t1, zero
                  sra          t2, s1, s9
                  remu         gp, s9, s11
                  fadd.s       fs2, ft7, fa7, rtz
                  fclass.s     s3, ft3
                  and          a4, tp, s4
                  sltu         t6, s2, tp
                  fadd.s       fs4, fs6, fs4
                  sll          s2, t4, a0
                  fcvt.w.s     t5, fs3, rdn
                  nop
                  andi         s0, t2, -268
                  lui          t6, 324935
                  sll          s2, t2, s3
                  flt.s        t5, ft0, ft7
                  fmul.s       fs3, fs6, fs4, rne
                  flt.s        s8, ft0, fs11
                  fmul.s       fs10, fs7, ft1, rdn
                  fclass.s     s7, ft5
                  fmin.s       fs5, fa2, fs8
                  ori          a1, s2, 1407
                  ori          t6, a0, -1610
                  auipc        a1, 644064
                  slti         a4, t4, -1817
                  fle.s        t3, fa1, fa4
                  feq.s        zero, ft4, fa5
                  slt          t3, s11, tp
                  and          ra, s0, zero
                  xori         s2, s9, 242
                  divu         s2, s3, s1
                  fmax.s       ft7, fa0, fa5
                  sll          sp, s4, s5
                  remu         a4, s11, zero
                  ori          s3, s10, 332
                  fmul.s       ft8, fa0, fs3, rne
                  sltu         a2, gp, t6
                  slt          a4, a0, a5
                  slti         s8, t3, 526
                  fmul.s       ft5, ft2, fs0, rdn
                  fcvt.s.w     ft0, a3
                  and          a6, s1, a7
                  sltiu        s9, s6, -1498
                  sra          s3, a6, s2
                  fdiv.s       fs3, fs8, fa5, rne
                  divu         s2, s5, s7
                  srli         a3, s10, 17
                  lui          s5, 809789
                  fdiv.s       ft6, ft2, ft6
                  mulhsu       s3, a2, sp
                  fsgnjx.s     fa5, ft9, fs5
                  fmul.s       fa6, fa7, fs9
                  fcvt.s.wu    ft11, a2, rmm
                  slli         gp, t3, 8
                  mulhu        s8, t2, t4
                  sub          t6, t6, t6
                  div          t3, gp, a2
                  srli         a0, s5, 23
                  mul          s2, t6, s6
                  fcvt.s.w     ft4, s9, rne
                  mul          t0, zero, s11
                  mulh         s0, s5, s2
                  fmul.s       fs7, ft1, fs4
                  mulhsu       gp, t2, tp
                  fmv.w.x      fa3, t1
                  fsgnj.s      fa4, fa2, fs6
                  fsqrt.s      ft2, fa2, rtz
                  mul          s9, ra, s7
                  and          a3, s9, a7
                  ori          s2, sp, 1132
                  rem          a7, t5, s10
                  sltu         s2, s10, s8
                  fdiv.s       ft3, ft0, fa0, rtz
                  fsgnj.s      fs3, fa4, ft3
                  fcvt.wu.s    s6, fs5
                  fcvt.wu.s    a5, ft11
                  lui          s1, 617217
                  fsqrt.s      ft8, fs7, rmm
                  mulhu        s6, a7, sp
                  sltiu        s4, t2, -996
                  remu         s5, s6, s2
                  fsgnj.s      fs11, fs4, fs2
                  remu         zero, a0, a7
                  sltiu        s10, a5, -269
                  flt.s        a0, fa1, fs11
                  mul          t0, sp, a1
                  and          ra, t3, a2
                  fcvt.s.wu    fs7, a2, rup
                  or           s3, tp, s2
                  slti         a2, gp, 1050
                  div          s0, a0, t3
                  auipc        s10, 900865
                  remu         s3, s4, a6
                  srai         a4, s9, 19
                  mulhsu       a7, a5, a5
                  sll          s4, t1, a3
                  fmin.s       fs6, ft9, ft3
                  fmv.x.w      t5, fs2
                  fle.s        s6, ft9, ft0
                  fcvt.wu.s    t0, fa3
                  slli         s10, ra, 22
                  fle.s        a4, fs5, fs9
                  sll          a1, a5, zero
                  addi         gp, a1, -1170
                  add          a4, s9, t2
                  srl          s9, s0, sp
                  mulhsu       a0, a1, t2
                  fsqrt.s      ft5, fa5, rmm
                  mulhu        s8, a5, t0
                  remu         s4, a5, t0
                  rem          a3, s2, t1
                  fadd.s       fs1, fa4, ft8
                  sll          ra, a4, s6
                  fmax.s       ft0, fs9, fs2
                  ori          ra, a5, 1971
                  lui          s9, 674912
                  mul          s9, a3, a1
                  fclass.s     a7, fs0
                  lui          gp, 792550
                  slt          s6, a2, s2
                  mulhsu       a1, s3, ra
                  fsub.s       fs3, fs2, fs7, rne
                  nop
                  fadd.s       fs3, ft7, ft8
                  mulhu        s1, t0, s0
                  slt          s10, a0, a5
                  fmul.s       ft10, fs7, fs6, rmm
                  srai         s0, t3, 25
                  fsgnjx.s     fs5, fs5, fs6
                  sra          s4, t2, s1
                  xor          s3, s3, a2
                  xori         sp, ra, -546
                  addi         t0, t4, -1057
                  mulh         s2, s0, gp
                  fsub.s       fa2, fs4, ft9
                  fmv.w.x      ft2, s10
                  feq.s        s8, ft4, fs3
                  srai         s3, s1, 31
                  sub          a0, t5, s4
                  srli         t6, tp, 8
                  addi         s5, a1, 1920
                  slt          s10, s6, s1
                  div          a5, t0, s5
                  mulhsu       a4, sp, a0
                  flt.s        s5, fs4, ft1
                  slti         s8, sp, -1473
                  and          a7, s11, s10
                  sra          t5, s8, gp
                  lui          s9, 312378
                  xori         s9, a3, 1205
                  fclass.s     s3, ft0
                  remu         s1, s5, a2
                  xor          a0, gp, s11
                  fdiv.s       ft8, ft6, fs1
                  lui          sp, 43703
                  fcvt.wu.s    t6, ft11
                  fsqrt.s      ft8, ft6
                  fsgnj.s      ft8, fs6, fs8
                  slti         s6, s11, 1750
                  slt          gp, a6, s10
                  sll          s10, t2, a0
                  nop
                  xor          s8, t3, s6
                  srl          a3, a0, s6
                  mulh         s6, s2, sp
                  fsgnjn.s     fa0, fs11, fs5
                  mulh         t5, gp, t4
                  fcvt.s.w     fs9, a2
                  fcvt.s.w     fs0, s6, rne
                  fmin.s       fa3, fa1, fa6
                  addi         sp, s10, -1016
                  fmv.w.x      fa7, s2
                  divu         a5, s2, s5
                  addi         s8, t5, -294
                  fclass.s     zero, fa1
                  fadd.s       fa2, fs8, fs11
                  nop
                  fadd.s       fs5, fa2, ft1
                  nop
                  ori          t5, a3, -1867
                  fsgnjx.s     fa4, ft7, fa6
                  xor          s10, s5, a1
                  fmv.x.w      a6, ft11
                  srli         a7, t1, 5
                  feq.s        s8, ft10, fs7
                  fmul.s       fa2, fs1, fs0, rmm
                  fdiv.s       fa1, fs4, fa4
                  lui          s5, 621944
                  divu         s0, t0, ra
                  mulhsu       s11, s7, s5
                  slli         gp, a6, 4
                  addi         a6, sp, -787
                  sra          a0, a3, s0
                  nop
                  fmv.w.x      fs8, sp
                  fsgnjn.s     fs0, fa2, ft6
                  fcvt.s.w     fs2, a6
                  and          s1, a6, t5
                  fmin.s       fs6, ft7, fa2
                  fmin.s       fs4, ft4, fs9
                  remu         s3, a1, s8
                  mulhu        t3, s9, t0
                  rem          s4, t5, zero
                  flt.s        a2, ft8, ft0
                  mulh         s8, a0, a0
                  fle.s        sp, fs2, ft4
                  sra          a3, s6, a4
                  fcvt.wu.s    a0, fa1, rmm
                  and          a4, t3, s1
                  sll          a4, t1, gp
                  sltiu        s4, gp, -908
                  sltu         a1, s8, a0
                  fmv.w.x      fa3, s10
                  addi         t0, t1, 1445
                  sltu         t3, a3, ra
                  fsgnjx.s     fa0, fs1, ft4
                  fmv.w.x      fa6, a6
                  fsqrt.s      ft10, fs8, rmm
                  addi         t2, a6, 879
                  or           a6, a6, s5
                  and          zero, zero, s4
                  or           a2, a5, s9
                  fmv.x.w      a5, fs1
                  div          t6, s7, tp
                  xori         zero, a7, 1180
                  and          zero, a6, sp
                  fle.s        a3, ft5, ft10
                  lui          zero, 7075
                  fmin.s       fs10, fa3, ft5
                  sll          s10, s2, s9
                  lui          a6, 560687
                  divu         t6, s5, a4
                  sra          s10, zero, gp
                  mulhsu       a1, ra, s3
                  sltu         a5, s5, s1
                  nop
                  fcvt.wu.s    s8, ft8, rtz
                  fsqrt.s      ft0, ft4
                  slli         s5, t1, 13
                  slti         t2, s2, 981
                  srl          s8, s0, t2
                  slli         t5, t5, 23
                  fclass.s     zero, ft4
                  divu         t3, a2, a5
                  fsqrt.s      fs5, fa1
                  add          s7, s4, a1
                  fcvt.w.s     s4, fs7
                  fsqrt.s      fa2, fs0
                  mulh         s5, t5, s11
                  and          s7, s7, a6
                  fsgnjn.s     fa4, ft0, fs7
                  fsqrt.s      ft11, ft3, rup
                  feq.s        a0, fa7, fa2
                  or           s11, s0, t2
                  or           t3, s3, s6
                  fcvt.s.w     fs2, s6
                  slt          t3, s10, s2
                  flt.s        s2, fs9, fa0
                  sltiu        zero, a2, -1997
                  srai         s0, t6, 12
                  divu         a6, sp, t5
                  auipc        a5, 685884
                  flt.s        sp, fa2, ft6
                  sltu         t5, s4, ra
                  feq.s        t2, ft1, fs0
                  and          s1, s2, t1
                  fmin.s       fs2, ft0, ft3
                  fmin.s       ft10, fs10, fs10
                  fsub.s       fs2, fs1, ft2
                  mul          sp, sp, t5
                  mulh         t3, s4, a3
                  slt          s9, s4, a1
                  srli         gp, zero, 28
                  fmin.s       fs1, ft11, fa6
                  auipc        s3, 299678
                  xor          s3, sp, s3
                  fcvt.w.s     gp, ft6, rne
                  fmul.s       fa1, ft6, fs7, rtz
                  fclass.s     t3, fs5
                  fsub.s       ft3, fa0, ft9, rtz
                  mulhu        sp, a7, s5
                  slt          s1, a2, s3
                  addi         s0, t0, 13
                  sltu         t2, t5, t4
                  fclass.s     a2, ft11
                  ori          s4, sp, -1161
                  fmv.w.x      ft1, a5
                  srl          a6, t3, a5
                  ori          s10, a4, 1290
                  div          zero, s1, s10
                  addi         a0, s2, 1016
                  srai         a2, s4, 27
                  sltiu        s9, s10, -1699
                  fcvt.s.wu    fa1, t0
                  flt.s        t2, fs0, fs1
                  fmin.s       fs9, fa6, fa4
                  sll          a0, s0, a3
                  fmul.s       ft3, ft5, fs4
                  add          a1, t3, s9
                  nop
                  slli         s7, tp, 13
                  or           s3, gp, s6
                  fmv.x.w      t2, fs8
                  fsqrt.s      ft11, ft8, rtz
                  mulh         t5, sp, a7
                  slli         t5, s6, 23
                  div          a1, a1, sp
                  or           s7, sp, s10
                  xor          a7, t1, s11
                  lui          s6, 1027236
                  lui          s8, 803462
                  sltiu        t6, t0, -644
                  sll          s1, s3, t1
                  fcvt.s.w     fs10, s1
                  fcvt.wu.s    a1, fs11
                  nop
                  rem          t6, ra, a5
                  feq.s        s10, fa2, ft5
                  slti         ra, s2, 1687
                  sub          zero, s4, s8
                  fsgnjx.s     ft9, ft3, ft3
                  mul          s3, s11, a4
                  div          a6, a7, a6
                  sub          s7, t4, s2
                  sltiu        s3, a4, -1956
                  feq.s        t6, ft2, fs9
                  nop
                  mulhsu       s1, a4, s4
                  andi         s8, s3, -383
                  div          a7, s11, s9
                  slli         s8, s6, 4
                  fsgnj.s      ft4, ft3, ft9
                  xori         a6, t4, 1775
                  divu         a1, t3, t2
                  mulhu        s5, s9, t4
                  add          s9, t6, s0
                  sltiu        s3, s0, -660
                  fcvt.s.wu    fs10, s3
                  div          a4, ra, a2
                  fclass.s     a3, ft6
                  slli         t6, a5, 22
                  fmax.s       fa3, ft10, ft0
                  fsgnjn.s     ft0, fa1, ft3
                  fadd.s       fa4, fs8, ft5
                  fcvt.wu.s    s7, fa3
                  fcvt.wu.s    a3, fs10
                  slt          a4, a0, gp
                  fmax.s       fa5, fs0, ft7
                  sub          zero, s2, s10
                  sll          a2, t6, s8
                  fmv.x.w      a7, ft0
                  remu         sp, ra, s9
                  flt.s        a5, fa4, fs7
                  addi         s9, gp, 1742
                  fsgnjx.s     ft0, fa3, ft0
                  fmax.s       ft1, fs11, ft5
                  sltu         t0, t1, t4
                  mulhu        s10, t1, s7
                  auipc        a4, 859902
                  fmv.w.x      fa7, gp
                  sltiu        s1, tp, -1084
                  slt          t6, s6, s4
                  fcvt.s.w     fa6, a0, rne
                  sltiu        s1, t3, 1529
                  divu         ra, s1, s10
                  slti         zero, s1, 691
                  fcvt.w.s     a0, ft1, rdn
                  addi         a2, t5, -22
                  fclass.s     gp, ft0
                  div          a4, ra, s5
                  mulh         t6, s9, s10
                  fadd.s       fa2, ft4, ft9, rtz
                  slti         t6, s11, -1635
                  srl          a1, s8, a3
                  fdiv.s       fa6, ft3, fa3, rne
                  fsgnjx.s     fs8, fs11, fa1
                  fclass.s     s3, fs10
                  fcvt.wu.s    zero, fa4
                  sll          s5, a6, a6
                  fmul.s       fs2, ft9, fa7, rne
                  ori          ra, t6, -1532
                  andi         t2, s11, -1173
                  srai         ra, a0, 11
                  fle.s        t3, fa4, ft11
                  srai         s6, t0, 1
                  addi         a2, a2, -150
                  fmax.s       fs7, fa3, fa5
                  srai         s11, a4, 30
                  srl          t2, ra, a0
                  fdiv.s       ft5, ft3, fs7
                  slt          s11, t5, t6
                  sltiu        a3, s4, 1409
                  andi         t3, s5, -698
                  fsqrt.s      fs1, ft5
                  slti         s2, t3, 1981
                  lui          t0, 892511
                  divu         ra, tp, s0
                  auipc        a0, 795634
                  slt          a5, a5, a0
                  nop
                  fcvt.w.s     t6, ft1
                  fsqrt.s      ft2, ft8, rdn
                  sub          a5, s8, s7
                  srai         gp, a1, 30
                  fmv.x.w      a6, ft8
                  fsgnjx.s     ft11, fs3, fs11
                  srl          t5, a0, a1
                  add          gp, t1, a7
                  and          s1, s8, s8
                  fmul.s       fs3, ft1, ft5
                  auipc        s3, 381534
                  fdiv.s       fs9, fs5, ft5
                  srl          t3, s10, a2
                  slli         a4, sp, 3
                  or           s0, a5, t6
                  fdiv.s       ft6, fa7, fs6, rtz
                  div          a7, a5, s10
                  mulh         sp, t3, s3
                  fclass.s     t2, ft0
                  slt          a4, a6, a7
                  divu         a2, s0, a4
                  addi         ra, ra, 1567
                  feq.s        s2, fs10, ft5
                  and          sp, gp, s10
                  fcvt.s.wu    fs6, s0, rdn
                  fsgnj.s      ft11, fs4, fs8
                  fmin.s       fa5, ft2, fa4
                  fmv.x.w      gp, fs6
                  fmin.s       ft3, fs11, ft6
                  srl          s9, s9, s10
                  andi         a2, s7, -1482
                  fle.s        a0, fs2, fs0
                  fmv.x.w      s2, ft10
                  fcvt.s.w     fs9, a0, rdn
                  mulh         t0, s8, a6
                  feq.s        s9, ft10, fs4
                  srl          a4, a1, t4
                  slti         a3, t4, -176
                  sltiu        t2, s7, 1470
                  flt.s        a4, fs2, fs6
                  addi         a3, t5, 200
                  add          t5, zero, s1
                  srli         zero, s7, 25
                  flt.s        s6, fs8, fs2
                  sltu         s7, a6, sp
                  feq.s        s1, fs5, ft5
                  xor          s6, a0, ra
                  rem          t2, s11, gp
                  slti         s1, a7, 327
                  divu         s6, t1, s4
                  fmin.s       fs4, ft9, fs8
                  fdiv.s       ft3, fa2, fs8, rdn
                  fmv.w.x      ft5, t6
                  sltiu        a5, a7, 1263
                  xor          s11, a7, zero
                  mulhsu       s1, s1, a2
                  ori          gp, s2, 259
                  fcvt.w.s     gp, ft9
                  slti         a1, ra, -495
                  fsgnjx.s     fs1, ft8, ft6
                  fadd.s       fs2, fs8, ft11, rdn
                  fdiv.s       fs6, fa5, ft11
                  fclass.s     a4, fs2
                  or           ra, s1, s4
                  slli         t0, s7, 7
                  rem          t0, s11, s11
                  srai         ra, s2, 20
                  fsgnj.s      fs11, ft7, fs5
                  or           t5, s7, ra
                  andi         s0, s6, -404
                  nop
                  andi         t6, s10, 844
                  divu         a4, t5, s7
                  slt          a1, s7, t0
                  auipc        a0, 643842
                  srai         t3, zero, 1
                  lui          gp, 411497
                  mulhu        s9, a5, ra
                  fdiv.s       fa2, fa2, fs2
                  sltu         gp, zero, t0
                  fdiv.s       ft1, ft9, fa0
                  fmin.s       fa4, fs1, fa4
                  fclass.s     t0, ft2
                  fmin.s       ft2, fs5, fa6
                  fsub.s       fa5, ft2, ft6
                  fmin.s       ft8, fa0, ft2
                  srai         a1, a1, 31
                  flt.s        s8, fs2, fa2
                  mulh         t5, s0, s5
                  fmv.x.w      ra, fs0
                  fsqrt.s      fa4, fs7, rup
                  andi         s6, a7, 884
                  fsgnjx.s     fs8, ft4, fa1
                  nop
                  fsgnj.s      ft6, ft4, ft11
                  addi         a6, t1, -1347
                  fsgnj.s      ft11, ft7, fa0
                  fsgnj.s      fs7, fs8, fs3
                  mulhsu       gp, s10, t1
                  fcvt.s.wu    fs7, s1, rne
                  sub          a5, t1, a7
                  fcvt.s.wu    fs8, s6
                  xori         t6, s6, -769
                  mulhu        a4, s0, s5
                  fle.s        t0, ft9, fa3
                  mulh         a4, s2, t6
                  rem          s10, s9, s9
                  andi         s4, t6, -1991
                  fmax.s       fs0, fs11, ft4
                  fsgnjn.s     ft3, fa6, fs9
                  or           t0, t3, a5
                  fmul.s       fs2, ft11, fa1
                  feq.s        s0, fa1, fa5
                  fmv.x.w      t3, ft1
                  fmul.s       fs0, ft11, fa0
                  auipc        sp, 764984
                  xor          a1, s8, s6
                  xor          t0, a4, s7
                  add          a4, s1, a5
                  fadd.s       ft2, fa7, ft1
                  fsgnjx.s     fa6, fs9, ft9
                  fsqrt.s      ft5, ft5, rtz
                  div          ra, t4, s8
                  auipc        a2, 148212
                  fcvt.s.w     fs10, t6
                  fclass.s     zero, ft1
                  fmv.w.x      fs6, t2
                  fclass.s     s5, fs1
                  slt          a2, sp, s6
                  slt          a1, s2, s3
                  srai         s6, t4, 2
                  slti         s10, t1, -2001
                  mul          a7, a1, s2
                  add          a6, s1, a6
                  div          t3, a3, s9
                  fsqrt.s      ft10, ft10
                  fcvt.s.wu    fa6, s1
                  fcvt.s.wu    fa7, t2
                  fsqrt.s      ft8, ft5, rtz
                  slli         s7, s3, 11
                  div          s7, ra, s8
                  slt          s2, s3, a4
                  fsqrt.s      fs5, fs0, rtz
                  fclass.s     s5, fa2
                  fmv.w.x      ft8, s4
                  fcvt.w.s     s6, ft1
                  or           t6, a1, s0
                  mulhsu       s9, a5, a0
                  fsqrt.s      fa7, fs5
                  addi         sp, zero, 1061
                  sra          s8, a6, t1
                  auipc        t5, 670633
                  srai         s1, t3, 22
                  fdiv.s       fa6, ft7, fs9, rmm
                  add          sp, t6, s3
                  mulhu        a5, a0, t2
                  slli         t2, ra, 11
                  add          sp, t5, s2
                  sltiu        ra, zero, -831
                  fle.s        s4, fa7, fa6
                  add          a3, s7, s0
                  fcvt.s.w     ft5, t5
                  fsgnjn.s     ft10, ft1, ft2
                  slti         zero, t2, 134
                  add          s1, s9, s5
                  xori         a6, s3, 1516
                  fcvt.w.s     sp, fa4
                  srai         s7, s9, 10
                  srai         a6, s9, 26
                  mul          ra, s6, s1
                  srai         s3, s11, 23
                  fle.s        s9, fa1, ft9
                  auipc        a4, 909486
                  xori         a6, t5, 327
                  andi         a2, gp, 146
                  fadd.s       fa6, fs8, ft2
                  fcvt.s.w     ft7, tp
                  fsgnj.s      ft6, fa7, fs0
                  mulhu        s6, s2, t0
                  fsgnjx.s     ft7, fs5, fs6
                  fmul.s       ft7, fa6, ft11
                  fle.s        s2, ft2, fs9
                  mulhsu       ra, sp, a0
                  fclass.s     t6, fs5
                  andi         s1, s1, -754
                  fmin.s       ft2, ft6, ft6
                  sll          s7, s1, ra
                  fsqrt.s      ft11, fs8
                  ori          t2, s11, -1393
                  fmv.x.w      t0, fa7
                  fmax.s       fa0, fs4, ft0
                  fcvt.wu.s    s4, fs3, rup
                  lui          s6, 60473
                  fclass.s     a7, fa4
                  remu         a2, a6, a0
                  mul          t0, a7, s6
                  fdiv.s       fs11, ft11, fa1
                  andi         a1, s0, 1828
                  flt.s        s3, ft3, fa2
                  sra          gp, s10, t2
                  fmul.s       fa4, fa5, fs6, rne
                  remu         ra, a1, a1
                  feq.s        t0, fa1, fa6
                  addi         sp, t6, 1802
                  or           s3, s9, t1
                  sltiu        s8, a3, 2004
                  fdiv.s       ft11, ft2, fa4, rup
                  fmax.s       ft0, fs9, fs0
                  srli         s5, a3, 19
                  sra          t2, s9, s3
                  sra          s9, s9, s4
                  lui          s3, 23514
                  fsgnj.s      ft1, fa5, fs8
                  fmax.s       fs9, fs10, ft8
                  fle.s        gp, fs2, ft2
                  fmin.s       fs3, fa4, fs5
                  ori          s4, gp, 1576
                  sra          s5, t1, s2
                  mulhu        a3, gp, a7
                  fmv.x.w      zero, ft8
                  fcvt.wu.s    a3, fs4, rdn
                  srli         ra, t1, 2
                  mulh         s7, s10, a0
                  sub          s0, s4, s4
                  auipc        a2, 1048262
                  lui          a4, 288345
                  fmv.x.w      s3, fa2
                  or           a6, a0, a6
                  fclass.s     t2, fa7
                  remu         s8, s8, zero
                  srl          s7, s4, a2
                  srli         s9, a7, 2
                  addi         t3, t0, -1358
                  rem          s10, a1, a0
                  sltu         zero, s7, ra
                  remu         ra, s2, s9
                  fmin.s       fs1, fa1, fa2
                  fsgnjn.s     ft3, ft0, ft3
                  fmv.w.x      fa2, s6
                  fmin.s       ft11, fs0, fs0
                  fsgnjn.s     fa7, ft6, ft1
                  and          a1, s0, a5
                  sltiu        a4, a6, 328
                  rem          s2, s4, zero
                  sltu         a1, zero, t1
                  srl          s4, a3, a3
                  fclass.s     s11, fs11
                  auipc        a7, 807759
                  divu         s2, s6, a0
                  fmv.w.x      fs4, gp
                  srli         s4, a4, 29
                  mulh         a2, zero, a0
                  nop
                  mul          ra, s0, s0
                  add          t5, t2, s2
                  mulhu        a4, t5, t3
                  mulhsu       s6, t4, a7
                  flt.s        s8, ft11, fs0
                  srl          a3, a6, tp
                  fclass.s     a2, ft9
                  add          a2, tp, t3
                  fmul.s       fs4, fs5, fa6, rup
                  fcvt.wu.s    s2, fs6, rne
                  flt.s        sp, fs11, fs0
                  srl          a6, s7, a7
                  fmin.s       ft5, fa5, fa2
                  slt          s5, t2, t3
                  fmax.s       fa4, fa7, fs11
                  xori         s5, tp, -422
                  nop
                  slt          a1, s11, a1
                  sub          t2, s7, a4
                  remu         s2, a1, s5
                  sll          s7, t5, t4
                  srl          a1, zero, t4
                  fmul.s       fs1, fa5, ft9
                  srai         s2, a4, 8
                  fclass.s     s1, fs6
                  sub          s4, zero, a7
                  fsub.s       fs3, fs10, ft7
                  or           a6, zero, t6
                  andi         a4, s1, -94
                  fadd.s       fa7, ft2, fs8
                  fsqrt.s      fs9, fa2, rmm
                  fmax.s       fa7, ft2, fs1
                  xori         s0, ra, -283
                  fsub.s       ft9, ft5, fa6, rup
                  rem          s2, a1, a5
                  fdiv.s       fa1, fs6, fs3
                  remu         a6, s1, s3
                  ori          a5, t6, -1682
                  mulh         a7, tp, s1
                  fdiv.s       ft9, fs8, fa0
                  fmv.w.x      ft2, s9
                  slli         s2, s7, 22
                  mulh         s6, a3, t4
                  slli         a4, a0, 11
                  slti         t5, gp, 1257
                  fdiv.s       ft8, fa6, ft0, rup
                  mulh         t3, a4, s10
                  remu         a3, ra, t4
                  fadd.s       fs5, fs3, ft4, rup
                  srl          zero, a0, sp
                  fclass.s     a3, fa5
                  srli         t5, a0, 16
                  srl          s7, ra, t1
                  fclass.s     s7, fa1
                  sltu         s0, tp, t6
                  feq.s        t6, fa2, fs3
                  ori          a3, s7, 1890
                  fcvt.wu.s    t6, ft7, rup
                  mulhu        t6, sp, sp
                  sra          s10, a4, a6
                  fmin.s       ft1, fa2, ft8
                  add          s3, tp, s11
                  mulh         a7, sp, s11
                  or           a6, s9, a1
                  mulh         a2, s1, s7
                  auipc        t0, 736788
                  srli         t3, t2, 27
                  fsqrt.s      fs1, ft1
                  sltiu        a2, a4, 1356
                  fmax.s       ft2, ft0, ft8
                  fle.s        s0, ft1, fa3
                  fsqrt.s      fs11, fs3
                  fsgnj.s      ft8, fs10, fs5
                  srai         a7, tp, 27
                  mulhu        s5, s9, s4
                  or           ra, sp, a0
                  feq.s        a2, fa6, fa2
                  and          s7, t4, a6
                  fmin.s       fa1, fa3, fs5
                  xor          a1, gp, s10
                  fcvt.s.wu    ft6, zero, rup
                  ori          s8, s10, 621
                  fsub.s       fs5, fs9, ft2, rdn
                  slt          a6, a6, t4
                  flt.s        a0, fa7, fs11
                  fcvt.wu.s    s6, fa0, rtz
                  andi         a0, s6, 1291
                  feq.s        zero, ft4, ft3
                  fmul.s       fa2, fs4, fs2, rdn
                  addi         zero, sp, 1081
                  sub          s9, s3, s10
                  sltiu        t6, s9, -42
                  remu         a3, s1, a3
                  srli         a3, t6, 7
                  lui          a6, 321594
                  fsgnjx.s     fs5, ft1, ft8
                  fsqrt.s      fs7, ft7
                  sltiu        ra, t3, -1655
                  auipc        s1, 715849
                  flt.s        a1, fa4, ft6
                  fdiv.s       fa0, ft11, fa4, rne
                  fdiv.s       ft3, fa6, fs2
                  slti         s5, s6, 688
                  fcvt.wu.s    a2, ft3
                  sll          a5, s11, gp
                  fcvt.wu.s    t5, fa4, rdn
                  fcvt.s.w     ft11, s2
                  srl          s3, s11, t5
                  or           a4, s11, s3
                  mulhu        zero, sp, tp
                  fmul.s       ft7, fs8, fa0, rne
                  fdiv.s       fa1, ft9, ft7, rne
                  fsgnjx.s     fa4, fs9, fs8
                  fmv.x.w      t3, fa3
                  fsgnjn.s     ft9, fs11, fs2
                  fadd.s       ft5, fs6, fa7, rtz
                  or           t5, a3, s1
                  fcvt.wu.s    s5, fs6
                  sltiu        t2, a0, 278
                  fmax.s       fa5, fs3, ft4
                  mulhsu       s7, t2, a1
                  divu         zero, s0, s6
                  fcvt.s.wu    fs11, t0, rup
                  rem          a7, a5, a2
                  sll          s9, zero, s10
                  slt          t5, t1, s10
                  srl          a0, s1, a1
                  and          t6, s9, zero
                  srl          s0, gp, a0
                  addi         t5, s5, 1919
                  fcvt.s.w     fa0, s11
                  xori         t2, s5, -86
                  fcvt.wu.s    s8, ft0, rne
                  fclass.s     s6, fs11
                  slt          s3, a1, s2
                  rem          gp, s8, s10
                  fmv.x.w      s8, fa3
                  srai         gp, a3, 6
                  sltu         s8, t3, t2
                  fclass.s     a1, fa1
                  or           s10, s1, a1
                  or           a2, s10, ra
                  fle.s        a0, fs8, fa1
                  fclass.s     ra, fs11
                  slt          a5, t1, s6
                  fclass.s     a6, ft3
                  divu         a3, t6, a3
                  fadd.s       fa5, fs8, fa1
                  srai         a6, t4, 7
                  srli         s6, a4, 13
                  xori         gp, t3, 724
                  fmv.x.w      a5, fa2
                  srli         s11, s3, 19
                  fsgnjx.s     fs7, ft7, ft9
                  fsgnj.s      fa5, fs8, ft11
                  fcvt.w.s     s1, fa4, rmm
                  fmul.s       fs6, ft8, ft6, rdn
                  rem          sp, s11, a7
                  fsgnjn.s     fs2, fa5, ft7
                  fmul.s       ft2, ft2, ft2
                  sub          s10, a7, a2
                  fsgnj.s      fs11, ft7, ft7
                  mulhsu       a7, t4, s3
                  andi         a1, s1, 1510
                  fcvt.w.s     s0, fa5, rup
                  and          a5, a3, s5
                  slli         gp, a7, 24
                  fadd.s       fa7, ft9, fs6, rdn
                  mulhu        s3, s8, s9
                  addi         s8, s8, -1717
                  fmv.x.w      a4, fs10
                  fmv.w.x      ft1, a1
                  sltu         s7, s2, s2
                  div          t0, s2, s8
                  divu         s2, s7, s2
                  slt          s0, s0, t6
                  mul          t6, s1, t6
                  fsub.s       ft0, fs8, fs10, rtz
                  feq.s        a1, fs10, ft10
                  fmv.x.w      t3, fa6
                  feq.s        a6, ft6, fs0
                  nop
                  slti         s11, a1, -856
                  fcvt.s.w     fs10, a0
                  or           s6, a0, s10
                  mulhu        t6, ra, s2
                  fle.s        s5, ft7, fa7
                  sltu         t2, a3, t5
                  slti         s3, s4, -1175
                  fcvt.wu.s    a3, ft5
                  mul          s9, t4, a0
                  lui          t3, 913131
                  fmax.s       fs0, ft2, fs9
                  fsub.s       fs1, fs8, ft7, rup
                  fcvt.wu.s    s7, ft6
                  or           t3, gp, a3
                  auipc        s5, 148463
                  fmv.x.w      ra, ft1
                  slt          a6, s0, t6
                  nop
                  or           s3, t6, s10
                  addi         s10, t4, 1651
                  mulhsu       s9, s2, s2
                  add          a2, a2, tp
                  xor          a0, zero, ra
                  remu         gp, t1, a1
                  srai         s8, a5, 26
                  srli         s11, s8, 20
                  mul          zero, a0, a0
                  fcvt.s.w     fa7, s11, rup
                  lui          s10, 302453
                  feq.s        gp, ft8, ft4
                  mulhu        a6, tp, sp
                  fmv.x.w      zero, ft2
                  and          a3, s6, ra
                  flt.s        s11, fs4, fs2
                  auipc        t6, 968665
                  fcvt.s.w     ft4, s8
                  andi         a0, s9, -1059
                  mulh         s2, s5, a7
                  or           s5, s5, s9
                  sub          t6, a7, tp
                  sltiu        zero, s11, 825
                  fmv.w.x      fa3, s0
                  srli         s9, s10, 3
                  xori         s1, a1, -666
                  fcvt.w.s     s6, ft11
                  xor          s10, t4, a7
                  feq.s        a2, fs0, ft4
                  nop
                  fadd.s       fa5, fa0, fs6
                  divu         t3, t3, a0
                  sra          a5, s0, t5
                  fcvt.s.w     fs8, ra, rtz
                  fclass.s     s4, fs5
                  slli         a2, t4, 9
                  slt          s11, zero, s5
                  fcvt.s.w     fs2, gp
                  flt.s        a2, fa5, fs1
                  auipc        t3, 271603
                  feq.s        s5, fs0, fs3
                  slt          t3, a6, sp
                  fdiv.s       fs0, ft0, fa1, rdn
                  fdiv.s       fa0, ft2, fs9
                  mulhu        a1, a1, a3
                  and          s7, gp, s5
                  or           s7, a1, tp
                  fsgnj.s      ft4, ft5, fa7
                  mulhu        s8, ra, s1
                  div          s0, gp, a3
                  mulhsu       a6, gp, s10
                  sll          a3, a2, ra
                  fclass.s     a5, ft6
                  div          t5, a5, t2
                  mulh         a3, s1, s10
                  fcvt.w.s     a2, fa4
                  fcvt.w.s     t0, fa2
                  mul          a3, t0, gp
                  fcvt.wu.s    a2, fs9, rup
                  fcvt.wu.s    gp, ft7
                  fmin.s       ft5, ft2, fs8
                  addi         gp, s7, 2037
                  divu         a6, s0, t2
                  mulhu        t5, s3, a2
                  fsub.s       fs5, fa2, fa0
                  fmv.w.x      ft9, a2
                  sra          a1, zero, t0
                  slti         t2, a7, -1352
                  fmv.x.w      t5, ft1
                  sltiu        ra, t0, -19
                  add          ra, t6, s5
                  andi         ra, s3, 1554
                  fcvt.s.w     ft9, t6
                  nop
                  fmv.x.w      s6, ft11
                  mulhsu       s1, s6, s3
                  add          a1, a2, a0
                  sll          a2, t4, a4
                  add          zero, gp, s1
                  rem          sp, a3, a2
                  fcvt.wu.s    a0, fs4, rup
                  nop
                  fmul.s       fs11, ft11, fs2
                  mulhu        s6, a7, a6
                  fclass.s     t2, fs2
                  sub          s8, a5, s6
                  add          a0, t2, s10
                  mul          ra, tp, a0
                  remu         s10, a4, t5
                  fdiv.s       ft11, fs0, fs10, rne
                  fsgnj.s      ft1, fs5, fs8
                  div          t6, t5, a5
                  add          s7, s9, s7
                  fsgnjx.s     fa6, ft9, fa7
                  xor          s8, s3, tp
                  sltiu        a1, a0, -832
                  fsgnj.s      fs6, fs11, ft11
                  remu         t5, a6, tp
                  andi         a5, s6, 45
                  fmax.s       ft2, fa0, fa1
                  slt          s6, t1, a7
                  fmin.s       fs2, ft1, ft9
                  nop
                  remu         s3, s7, a2
                  sltiu        s8, s2, -338
                  fsgnjn.s     ft1, fa6, fs2
                  flt.s        t0, ft5, fs6
                  fsqrt.s      ft1, fa2
                  feq.s        s2, fs7, ft9
                  add          s7, s6, sp
                  sltu         s4, a7, s1
                  fsgnj.s      fa5, fa1, fa0
                  div          s9, s4, s3
                  fle.s        s7, fs8, fs4
                  addi         a6, a4, -1010
                  sra          a5, s4, gp
                  fcvt.wu.s    s4, ft10, rmm
                  fdiv.s       ft2, ft5, ft8
                  div          s8, a1, a4
                  fadd.s       fs5, ft10, fs9
                  fmul.s       fa0, fs1, fs2
                  addi         s7, s9, -1703
                  sll          s5, s11, a5
                  ori          a0, t2, 898
                  mulhsu       a1, a2, s2
                  fcvt.wu.s    s11, fs0
                  fsub.s       fa5, ft8, fs1
                  fsgnjx.s     fs3, ft2, ft10
                  fcvt.w.s     s4, fs10, rdn
                  addi         s6, t3, 269
                  srl          a0, s11, s9
                  fsub.s       fa2, fs5, fa2, rmm
                  mul          s3, s6, sp
                  remu         s9, t1, a6
                  sltu         s10, a4, tp
                  sra          s1, s3, s11
                  fmul.s       fs3, fs1, fa1, rmm
                  auipc        s5, 438604
                  fle.s        s11, fa0, fs7
                  fsub.s       ft1, ft5, ft4, rup
                  fcvt.w.s     s5, ft10, rup
                  ori          s3, a2, -1358
                  fdiv.s       fs1, fs6, fs10, rne
                  fadd.s       ft8, ft10, ft0
                  sltu         s7, s11, zero
                  mulhsu       t2, s8, a3
                  lui          gp, 261632
                  fmin.s       ft6, ft6, fa3
                  fsqrt.s      ft2, ft7, rmm
                  sra          t0, a2, t1
                  fcvt.w.s     a1, ft2
                  lui          t2, 219653
                  divu         gp, s10, a4
                  fmax.s       fs10, fs3, ft8
                  lui          s2, 119877
                  slt          s10, tp, s3
                  auipc        a5, 472715
                  xor          s1, ra, s4
                  sll          a1, a5, s0
                  xori         t5, a3, 1059
                  sra          t2, t3, a3
                  fmv.x.w      a3, fs10
                  sra          s0, t1, s2
                  mul          t5, s1, t0
                  lui          s1, 437861
                  fcvt.s.wu    fa4, s4
                  sll          s5, t1, t1
                  div          s9, a0, s9
                  add          s5, a4, s5
                  mulhsu       t6, sp, t6
                  fsub.s       ft4, fa0, fs8, rtz
                  mulhu        s9, a1, a7
                  or           s11, t5, a0
                  lui          t2, 499575
                  fmax.s       fs3, fa0, ft7
                  fcvt.s.w     ft11, a0
                  fdiv.s       ft5, fs9, ft5, rne
                  fmul.s       fa2, ft8, ft2
                  rem          s5, gp, a2
                  fcvt.s.wu    fs1, t1
                  feq.s        a2, fa2, fs4
                  fle.s        a6, ft5, ft4
                  nop
                  and          s7, a4, a5
                  divu         s4, t1, s4
                  fadd.s       fs4, ft6, ft10, rdn
                  fmul.s       ft6, fs4, ft6, rmm
                  fdiv.s       fs11, ft0, ft1
                  sll          s4, t2, tp
                  mulh         ra, sp, a2
                  fle.s        s11, fs10, fs10
                  mulhsu       s6, s2, s4
                  slti         t2, t4, 1186
                  fclass.s     t3, fs1
                  xor          s5, s4, sp
                  fmax.s       ft5, ft11, ft6
                  fcvt.s.wu    fa7, s11, rmm
                  fmul.s       fa1, fa2, fs5
                  fmax.s       ft1, fs1, ft7
                  fmul.s       ft5, ft9, fa6
                  sub          s1, ra, a1
                  divu         s11, s10, t4
                  mulhsu       s5, s11, t2
                  fclass.s     s1, ft7
                  mulhsu       t3, s7, t2
                  mul          t2, ra, a0
                  mulhsu       s6, a1, t1
                  slt          s10, t2, zero
                  fmv.w.x      ft11, ra
                  fdiv.s       fs9, fs5, fs11
                  fcvt.s.w     fs10, s4
                  divu         s9, a5, t2
                  fle.s        t5, fs1, fa0
                  add          s2, s3, s6
                  fclass.s     s6, ft1
                  fmax.s       ft4, fs0, fa3
                  fcvt.s.w     fs9, a4, rne
                  fsgnjx.s     fa5, ft9, ft3
                  fadd.s       fa2, fs7, fs10
                  fmul.s       fa6, ft7, fs0
                  fsqrt.s      ft8, fs6, rtz
                  mulhu        s10, a3, s10
                  srli         sp, s7, 16
                  fcvt.s.w     fs4, a3
                  ori          s0, t2, 1164
                  slti         s6, a3, -115
                  fmax.s       ft4, fa1, fs0
                  fcvt.s.w     fa4, sp, rne
                  fclass.s     s0, ft8
                  divu         sp, a6, ra
                  xori         t2, t3, -196
                  and          s7, gp, s8
                  sub          a3, zero, s5
                  fcvt.w.s     a0, fs11, rne
                  xor          s9, a4, s11
                  div          s5, zero, s10
                  fsub.s       ft9, fa7, fs11
                  sltu         s6, t5, a0
                  mulhu        a2, t1, s10
                  srli         a3, t5, 3
                  lui          s6, 689760
                  sltiu        s8, gp, 1976
                  fadd.s       ft4, ft2, ft0
                  ori          a5, sp, 421
                  srl          s3, t0, a0
                  fdiv.s       fa3, ft7, fa4
                  fsgnjn.s     fa2, ft1, fs0
                  fcvt.s.w     ft7, t1
                  slli         s3, t2, 28
                  andi         a3, s0, 703
                  xor          a5, s10, a1
                  fmul.s       fa3, fa7, fs4, rmm
                  srli         a7, s7, 26
                  sltiu        t5, zero, 1045
                  slli         a4, s8, 12
                  auipc        ra, 34687
                  srli         s6, t4, 21
                  xor          s3, a6, t4
                  fclass.s     s7, fs8
                  fsqrt.s      ft8, fs4, rmm
                  sra          a6, zero, s6
                  fsgnj.s      fs0, fs7, fa6
                  mulhsu       a7, s1, a4
                  xori         t0, t0, 362
                  divu         a0, s6, s2
                  slli         s0, t5, 30
                  fle.s        a6, ft7, fa2
                  sra          t6, gp, gp
                  fsub.s       fa4, fs5, fa7
                  fadd.s       fa1, ft5, ft11
                  add          s6, a1, t6
                  fcvt.s.w     ft5, gp
                  fsgnjx.s     fa2, ft5, ft4
                  fadd.s       ft2, fs10, ft2
                  xori         t2, t1, 1041
                  xori         s7, t6, -1114
                  fsgnjx.s     ft10, ft8, fa1
                  fmin.s       ft0, fa3, fa4
                  fmul.s       ft7, ft10, ft3
                  sra          s11, a6, t6
                  fdiv.s       fs9, fa6, fa3, rdn
                  mulh         s0, a2, s11
                  fsgnjn.s     fa7, ft5, fs7
                  slti         t6, s4, -240
                  mulhu        s8, s8, a4
                  fcvt.s.w     fs7, t3
                  srl          s4, t1, s11
                  fclass.s     s6, fs9
                  nop
                  fsgnjx.s     fs3, ft1, fa4
                  slti         s10, ra, -828
                  mulhsu       s3, t0, t0
                  lui          t6, 1010228
                  fcvt.wu.s    a7, fs0, rtz
                  ori          t6, s4, 464
                  ori          a1, s7, 1484
                  fcvt.s.w     fs11, s7
                  fmul.s       ft4, fa0, ft9
                  fcvt.s.wu    ft1, a3
                  slli         t0, t4, 23
                  srai         s3, s4, 3
                  xori         gp, s11, -1339
                  fdiv.s       ft5, ft2, ft11, rne
                  fsub.s       fs9, fa4, fs5, rdn
                  addi         t5, a6, -702
                  mul          a2, tp, t3
                  feq.s        a6, ft11, fs3
                  slti         a5, a1, -1036
                  fmv.w.x      ft8, s7
                  fmin.s       ft1, fs0, fs7
                  fsgnjn.s     fs0, fa6, ft10
                  srli         t6, s5, 28
                  fdiv.s       fa6, ft6, fs1, rup
                  fsqrt.s      fs3, fa0
                  mulh         s10, a0, s3
                  slt          t6, a6, a0
                  fcvt.s.w     ft2, s6
                  ori          sp, a4, -83
                  sltu         a7, s10, s7
                  and          t0, a6, t2
                  addi         t5, a1, 306
                  fadd.s       ft2, fa4, fa5, rtz
                  sltu         a7, a3, a1
                  or           s1, s1, gp
                  div          gp, a0, a1
                  rem          t2, a5, s4
                  fdiv.s       ft6, ft2, ft10, rne
                  fcvt.s.wu    ft10, s8, rup
                  xori         a7, ra, -707
                  mulh         t3, ra, t6
                  auipc        s10, 762481
                  fadd.s       ft1, fa3, ft2, rne
                  sll          zero, sp, a7
                  fcvt.s.w     ft1, s7
                  and          a4, t4, t6
                  fmv.x.w      a5, ft11
                  mul          a2, t3, t0
                  remu         zero, sp, t0
                  sra          t5, t0, a5
                  ori          s4, s0, -24
                  fmax.s       ft6, ft7, fa1
                  add          t2, t4, s6
                  mulh         a7, s10, s1
                  div          s4, gp, s1
                  nop
                  div          s9, s8, a7
                  slli         a7, s8, 4
                  and          a6, zero, s0
                  sltu         a2, s2, s11
                  mulh         gp, ra, s7
                  fmin.s       ft6, ft4, ft2
                  fmin.s       ft9, fs5, fs8
                  flt.s        a1, ft3, ft11
                  fcvt.s.wu    ft10, ra, rtz
                  fadd.s       fs4, ft10, fs11
                  fdiv.s       fs2, fs8, fs5
                  srl          s6, t0, ra
                  slt          s3, a3, a2
                  fmv.x.w      a0, ft4
                  fsub.s       ft3, ft2, fs5
                  and          sp, s9, s8
                  andi         s1, s11, 2012
                  srli         s6, a0, 10
                  fmv.x.w      s1, ft8
                  sll          s6, t0, s5
                  slt          s11, s10, a7
                  slti         sp, a6, -1231
                  fsqrt.s      fs11, fs9, rmm
                  fsgnjx.s     fs3, fs8, ft7
                  fmv.x.w      s5, ft2
                  feq.s        t0, fa5, fs0
                  and          s3, s4, a5
                  andi         zero, t6, -279
                  sltiu        s4, t0, 1051
                  fclass.s     a3, fs6
                  fmv.x.w      t2, ft10
                  mulhsu       s7, a4, s7
                  srli         a2, t5, 16
                  fcvt.s.w     fs1, s9
                  fmax.s       ft4, ft1, fs9
                  divu         zero, a4, a3
                  xor          s5, t3, t2
                  or           s2, s7, zero
                  lui          a7, 774989
                  fsgnjx.s     fs2, fs11, fa6
                  slti         gp, a2, 1820
                  fmv.w.x      fs9, a4
                  fdiv.s       fa4, fa3, fs10
                  srai         gp, s4, 22
                  fadd.s       ft4, fa1, fs3, rtz
                  fcvt.s.w     fs5, zero, rup
                  and          sp, s1, gp
                  sra          ra, t3, s1
                  fmin.s       fa3, fs5, fa1
                  mulh         s1, s5, gp
                  addi         s2, tp, -1446
                  lui          a1, 647743
                  div          gp, a5, s3
                  slti         s4, s11, -1653
                  rem          s2, s9, t4
                  nop
                  or           t6, t4, s2
                  feq.s        s1, ft8, fs10
                  remu         s3, s5, t2
                  flt.s        t3, fs11, fs7
                  mul          zero, a0, s6
                  sll          ra, t4, s11
                  fmv.x.w      s3, ft7
                  slti         s1, a7, -325
                  xori         t0, t2, 1229
                  slti         t3, gp, -1947
                  fsub.s       fa3, fa1, ft4
                  auipc        t5, 44886
                  srli         s5, s2, 5
                  add          s7, a6, s11
                  srli         s2, s9, 12
                  divu         t0, a2, s2
                  fsgnj.s      fs8, ft4, fa7
                  fsgnjn.s     fa2, fa4, fs4
                  andi         t3, s5, 671
                  fcvt.wu.s    a1, fa1, rmm
                  div          a2, sp, a6
                  slli         gp, a0, 2
                  fmv.w.x      fs0, gp
                  rem          s8, t4, gp
                  fsgnj.s      ft8, fa6, fs7
                  fsub.s       ft7, fs6, fa5, rtz
                  fcvt.s.wu    fs2, s11
                  and          s10, t4, tp
                  fle.s        s10, ft11, fa5
                  flt.s        a5, fs0, fa6
                  sltiu        a1, t6, -1377
                  flt.s        a6, fs2, ft3
                  slli         a5, s2, 13
                  fcvt.s.wu    ft8, s7, rdn
                  fclass.s     sp, fa3
                  sra          s8, t2, a1
                  flt.s        s9, ft8, fa1
                  rem          t2, zero, gp
                  rem          a3, s0, tp
                  fclass.s     s0, fa3
                  fcvt.w.s     t0, fs8, rdn
                  fclass.s     s6, fs8
                  fadd.s       ft5, fa2, fs0, rdn
                  add          s1, s6, t1
                  auipc        s8, 501807
                  fadd.s       fa3, ft8, fs4, rmm
                  fcvt.s.w     fs7, tp
                  fmin.s       ft10, fs5, fs0
                  ori          a5, a3, 1218
                  fclass.s     s11, fs11
                  fsqrt.s      ft9, ft10
                  sra          a3, s11, a7
                  fclass.s     s1, fa0
                  fmv.x.w      t0, ft8
                  nop
                  nop
                  and          t3, s4, gp
                  addi         t6, t0, 788
                  xor          s8, t1, t1
                  sltiu        gp, a0, -857
                  fadd.s       fa6, ft4, fa5, rmm
                  mul          a3, a2, t0
                  slt          s3, a4, s7
                  fsqrt.s      fs9, fs7, rup
                  fmax.s       ft1, ft1, fa2
                  slli         a1, s7, 22
                  fsgnj.s      fs11, ft9, ft10
                  sra          t5, a3, t5
                  feq.s        a6, fs3, fa5
                  slli         a6, t1, 23
                  sltiu        s6, sp, -117
                  add          s7, s5, a3
                  sub          t2, a0, s10
                  sltu         gp, t4, ra
                  mul          s5, a2, sp
                  sub          ra, t6, s6
                  divu         t3, a4, t3
                  div          sp, ra, s4
                  mulh         s11, s1, s3
                  fmin.s       ft2, fa6, ft11
                  srai         t3, zero, 6
                  sltiu        a5, ra, -75
                  mul          s10, sp, a6
                  fsub.s       fs8, fs3, fa1
                  fcvt.s.wu    fa1, t1
                  fadd.s       fa6, fs2, fa0, rne
                  nop
                  feq.s        s6, ft11, fs0
                  fsgnjn.s     ft1, fs6, ft1
                  remu         s1, sp, s6
                  fadd.s       ft5, fs1, fa1, rdn
                  fcvt.wu.s    a4, fa4, rtz
                  fsub.s       fa3, ft5, ft6
                  sll          s8, s6, t2
                  fmin.s       fa6, fs1, ft10
                  or           t2, s7, a3
                  fcvt.s.w     ft11, a4
                  fsgnjx.s     fs9, fa6, ft5
                  fclass.s     s2, fs10
                  sub          ra, gp, s5
                  fsgnj.s      fa6, fs9, fa3
                  and          s6, a6, s3
                  flt.s        ra, ft1, fa1
                  andi         a6, a1, -1453
                  fcvt.s.wu    fa4, sp
                  fmv.x.w      s10, fs2
                  addi         t6, s3, -1343
                  fcvt.wu.s    t2, ft3
                  and          s0, gp, s1
                  fcvt.s.w     fa1, a1, rmm
                  slli         t0, a4, 8
                  rem          ra, tp, s11
                  xor          s5, gp, s6
                  flt.s        t2, fs1, fs5
                  fmax.s       ft10, fa3, fs1
                  sll          a5, a6, a6
                  rem          sp, a4, a6
                  fmv.x.w      a4, ft7
                  sltiu        a4, s1, 1576
                  fmul.s       ft8, fs11, fs4, rdn
                  mulhu        a0, t1, gp
                  fsgnj.s      ft8, ft5, fs10
                  fdiv.s       ft9, fs2, fs9
                  fcvt.wu.s    t5, fs8, rdn
                  addi         s9, gp, -569
                  flt.s        s7, fs4, fs4
                  srli         a7, t3, 23
                  add          s1, a7, t4
                  slti         s11, a1, 1223
                  remu         t5, s4, t6
                  fcvt.wu.s    s11, fa7
                  xori         a4, t4, 1886
                  or           a5, a2, t3
                  sub          a5, t0, s11
                  sra          a2, s2, gp
                  sll          s4, t1, s9
                  srai         a6, t2, 10
                  remu         a1, s8, a6
                  fsgnj.s      ft0, fa3, fs5
                  div          a6, s2, t4
                  fcvt.wu.s    t6, fa1, rdn
                  sll          s3, sp, t5
                  mulh         ra, s8, s1
                  fcvt.wu.s    s4, ft2, rne
                  fsqrt.s      fs7, fa0
                  fsub.s       fa6, fs4, fs2
                  fsgnjn.s     ft4, fs0, fa0
                  fsgnj.s      fs2, fa6, fs1
                  fcvt.wu.s    a1, fa4
                  rem          s11, t3, s10
                  fsqrt.s      fs1, fs5, rdn
                  fsgnj.s      fs9, fa4, ft9
                  mulhu        s5, sp, t2
                  srli         s2, t5, 4
                  mulh         s9, s5, s7
                  fcvt.s.wu    ft6, s5, rtz
                  mulhsu       a3, s4, s4
                  fsqrt.s      fs2, ft8
                  auipc        s10, 722610
                  fsub.s       ft2, fa2, ft2, rmm
                  xor          ra, ra, a4
                  remu         ra, t6, sp
                  fle.s        s8, fa6, ft9
                  srl          s9, t0, tp
                  mulhsu       t6, gp, t5
                  fadd.s       ft11, fs4, ft4, rmm
                  divu         sp, ra, a0
                  mulhsu       a5, t0, s10
                  sub          s3, a4, s8
                  nop
                  divu         s1, a1, s11
                  and          zero, tp, s9
                  fsub.s       ft0, ft2, ft2, rdn
                  slli         s8, s9, 16
                  divu         t2, t1, a1
                  fcvt.wu.s    s2, fs0, rmm
                  sra          s4, t1, s10
                  slti         a7, ra, 17
                  nop
                  fmin.s       fs11, fs5, fa2
                  fcvt.wu.s    t3, ft8, rtz
                  fdiv.s       fs3, fa1, fa6
                  mulh         gp, s0, t1
                  fsgnjx.s     fa6, ft6, ft1
                  fsgnjn.s     fs6, ft8, ft8
                  addi         t2, s2, 1801
                  fsub.s       ft7, fa3, fs9
                  addi         a3, s1, -822
                  ori          s8, s11, 947
                  sltiu        s2, t6, -1854
                  fcvt.s.wu    ft3, s8, rdn
                  xor          t6, sp, s4
                  slti         a6, a7, -588
                  div          t6, s11, s9
                  divu         a2, a2, t3
                  add          t2, s10, t0
                  mul          gp, a4, sp
                  fmin.s       ft3, ft10, fs7
                  divu         s1, a3, s9
                  fclass.s     a4, ft8
                  div          a1, t6, t2
                  xori         a7, a6, -132
                  fdiv.s       fs6, fa2, ft2
                  slti         t2, s4, 638
                  mulhsu       a5, sp, s5
                  fsgnjx.s     fs4, fs8, ft11
                  slli         a6, t3, 30
                  fmv.w.x      ft7, a5
                  srl          a3, t6, t0
                  slt          a2, s4, s6
                  xor          gp, a3, gp
                  feq.s        s11, fs8, fs5
                  ori          sp, a3, -1797
                  fsgnjn.s     ft11, fa7, ft6
                  mulh         a0, s9, t0
                  fsgnj.s      fs1, fa0, ft9
                  nop
                  fdiv.s       ft4, ft8, fs2, rmm
                  and          s2, s6, s3
                  fmax.s       ft7, ft8, fs10
                  div          sp, s0, s3
                  divu         s2, a5, a5
                  sltu         t5, t2, ra
                  fmax.s       fa2, fs6, fs1
                  fcvt.w.s     s0, fs3
                  fcvt.s.w     fa4, s5
                  fsub.s       fs0, ft2, fa4
                  fmv.w.x      fs11, s7
                  fmax.s       ft8, fs11, fs8
                  mul          a6, a0, a6
                  sltu         zero, s2, a3
                  sub          t0, a0, ra
                  srl          a5, t5, s2
                  fsgnjx.s     ft8, fs7, fs10
                  fadd.s       fs9, fs3, fa6, rup
                  fdiv.s       fa2, ft11, fs3, rdn
                  srli         zero, t5, 0
                  or           s6, zero, t1
                  fcvt.s.wu    ft11, zero, rup
                  mul          zero, t6, t6
                  divu         t2, s9, t1
                  fcvt.w.s     a2, fa0
                  slli         t2, s0, 24
                  ori          s7, gp, -165
                  and          t3, t2, t3
                  mulhu        s10, s7, a6
                  andi         s11, t0, 1118
                  fadd.s       ft5, ft4, fa4, rdn
                  nop
                  and          s2, t4, s9
                  fdiv.s       ft11, fs8, ft4
                  fmv.w.x      ft4, a6
                  divu         s5, t6, s2
                  fcvt.w.s     s3, ft8, rdn
                  nop
                  remu         sp, s4, s0
                  mulhu        s9, a3, s5
                  fsub.s       fa6, fs1, fa4
                  fcvt.wu.s    s5, ft5
                  sra          a3, tp, s4
                  sltiu        a1, t2, 1973
                  fmin.s       ft10, fa7, fs0
                  sltiu        t3, t4, 1221
                  ori          t6, a3, -1737
                  sll          a6, s7, t3
                  and          a2, s8, s3
                  mulhsu       zero, tp, s1
                  sra          gp, s3, sp
                  fmv.x.w      zero, ft1
                  sra          s10, a5, t2
                  mulhu        t0, ra, s9
                  fmax.s       ft4, fs1, fa4
                  fcvt.w.s     s9, ft0, rmm
                  slt          s1, a2, s1
                  nop
                  slli         s11, s6, 6
                  add          zero, t2, t2
                  mul          s3, s9, a4
                  fsgnj.s      ft6, ft0, fs0
                  rem          s5, t0, a6
                  fmul.s       fa3, fs6, ft9
                  slti         t0, s4, -1878
                  srai         s2, t4, 23
                  mulhsu       s3, s3, s3
                  srl          zero, s10, s5
                  sltiu        a7, s7, -1429
                  fmv.w.x      ft1, s2
                  fsgnjx.s     fs0, fs11, ft9
                  fmax.s       fa0, ft3, ft8
                  nop
                  or           sp, s6, t6
                  fsqrt.s      fa6, ft8, rne
                  auipc        gp, 420232
                  fadd.s       ft8, ft11, ft0
                  sll          a1, a5, s1
                  sltu         ra, s1, s3
                  slt          a6, s11, s5
                  fmv.w.x      ft8, s6
                  rem          a3, tp, s0
                  fmv.w.x      fs9, sp
                  feq.s        t6, fs10, fs11
                  fsgnjn.s     ft8, fa7, fs10
                  srli         s5, zero, 25
                  xor          s2, s6, ra
                  lui          t6, 182121
                  slti         a7, s5, 1475
                  fmul.s       fs8, fa1, fa7, rup
                  fsqrt.s      fs8, ft11, rmm
                  slt          s7, s0, a3
                  fmv.w.x      fs6, a6
                  fsgnj.s      fa7, ft2, ft4
                  sra          zero, s2, tp
                  feq.s        ra, ft5, ft2
                  lui          t6, 895523
                  srl          t6, t2, s6
                  xori         a1, s11, 548
                  lui          s3, 316524
                  ori          a1, gp, -1012
                  sra          gp, a4, s9
                  or           a7, s6, gp
                  fmv.w.x      ft1, s6
                  fmv.x.w      ra, fs6
                  fmax.s       fs2, fa6, ft0
                  fsgnjn.s     ft2, fa4, fs2
                  mulhsu       a6, s10, gp
                  or           gp, sp, s10
                  div          a7, s5, s7
                  nop
                  divu         s0, a1, a3
                  fsgnjn.s     ft8, fs9, ft1
                  nop
                  srai         t2, tp, 4
                  remu         zero, a6, a1
                  fmul.s       ft3, fs4, fs7
                  sltiu        ra, s3, -64
                  sub          s7, a5, t3
                  nop
                  fmul.s       ft6, fs1, ft8
                  srli         s4, a2, 30
                  fcvt.s.w     ft8, gp, rup
                  divu         s8, t0, a5
                  srl          ra, a5, s0
                  fle.s        s0, fa5, fa4
                  slt          s8, t1, t5
                  auipc        s6, 859886
                  fmin.s       fs0, ft0, fs8
                  sub          s3, a6, s10
                  fsub.s       fs10, fa7, ft7
                  sra          a4, s10, s1
                  fmul.s       fs5, fa6, ft2, rne
                  rem          s8, a5, s3
                  xor          gp, a2, tp
                  fcvt.s.w     fs11, t3
                  fcvt.s.wu    fs5, a6, rup
                  div          s7, ra, s11
                  fcvt.w.s     ra, fa7
                  xori         a4, s4, -1992
                  fmul.s       ft11, fa6, ft8, rup
                  xor          s8, s6, a3
                  fdiv.s       ft6, ft3, ft10
                  slti         s5, s4, 1067
                  fmul.s       fa1, ft6, fs2
                  remu         a1, t1, zero
                  fmv.x.w      gp, fa1
                  fsgnjx.s     fa0, fa0, ft3
                  xori         a2, t4, -1981
                  fsub.s       ft1, fs9, fs6
                  slt          ra, s0, t3
                  or           t5, t3, s6
                  fsqrt.s      fs5, fa1
                  slli         t3, a2, 25
                  mulh         a5, tp, t4
                  sra          s4, t1, t2
                  mulhu        t0, s9, t2
                  srli         t5, t3, 1
                  mulhsu       a6, t4, a6
                  sltiu        a7, s4, -382
                  fmul.s       ft0, fs3, fa7
                  fmv.x.w      a4, fs2
                  srai         s6, t2, 19
                  fmul.s       fs7, fs1, fa2, rne
                  sub          a7, s2, s8
                  fclass.s     t6, fs10
                  fadd.s       fs1, ft5, ft8, rne
                  fsgnjn.s     fs8, ft10, fa1
                  xori         t2, s1, -2021
                  auipc        s7, 153818
                  sltu         s2, a3, s6
                  fmin.s       fs4, ft2, fs2
                  slt          s1, t2, ra
                  flt.s        sp, fs0, fa0
                  srl          a1, zero, t4
                  fclass.s     s11, fa7
                  fmin.s       ft7, ft2, ft6
                  nop
                  fcvt.wu.s    gp, fa0, rne
                  srai         ra, s7, 30
                  mulh         s8, t4, a2
                  srli         a7, s0, 20
                  fcvt.wu.s    a3, ft9, rdn
                  slti         s10, t4, -1234
                  fmv.x.w      ra, fa0
                  nop
                  sltiu        s4, sp, -1559
                  fcvt.s.w     ft0, a0, rtz
                  fsgnj.s      fa7, fa5, ft10
                  fmv.w.x      ft4, t3
                  addi         t3, s2, 1474
                  fle.s        t6, fs6, fs1
                  add          s0, s11, a2
                  nop
                  fsgnjn.s     ft2, fs6, ft7
                  sltiu        a3, s11, -777
                  srli         a3, s4, 29
                  fdiv.s       fa3, ft5, ft0
                  fle.s        a2, ft6, ft2
                  add          s4, s6, zero
                  mulh         zero, s1, s10
                  fle.s        ra, ft6, fs0
                  fsgnjx.s     fs4, ft6, fa2
                  rem          s5, a6, a6
                  srli         sp, s5, 28
                  remu         a5, gp, s0
                  nop
                  fmv.x.w      s11, fs5
                  or           a2, a2, s10
                  fcvt.s.wu    ft11, s7, rup
                  srai         gp, zero, 15
                  sltiu        a3, t5, 718
                  slt          s4, ra, t1
                  fsgnj.s      fa0, fs8, fs6
                  andi         a3, s9, -116
                  nop
                  fle.s        t2, fa5, ft0
                  or           s0, s5, a3
                  srli         s5, t5, 26
                  fsgnjn.s     ft0, fs3, fa2
                  sra          s7, a0, a4
                  sltiu        a0, a3, 499
                  fsgnj.s      fs7, fa6, ft8
                  remu         sp, a3, s2
                  remu         s0, ra, s0
                  xori         a0, t1, -1368
                  remu         s6, gp, a2
                  sltiu        t5, s2, -2039
                  lui          t3, 969491
                  fsgnjn.s     fa6, ft1, fs1
                  srli         t2, a5, 28
                  slt          gp, s5, zero
                  fmin.s       fs9, ft5, fs11
                  or           sp, a5, t0
                  remu         s11, t4, t4
                  fclass.s     s1, ft5
                  div          t5, a5, s10
                  srai         t2, s11, 1
                  slti         a2, a3, 1080
                  fclass.s     s11, ft11
                  slli         gp, t0, 16
                  andi         a5, s6, -1782
                  sub          gp, t3, s1
                  srai         t5, s10, 6
                  andi         s3, gp, 1353
                  remu         s5, tp, s11
                  div          a7, sp, ra
                  fdiv.s       fs3, fs11, ft8, rmm
                  sltu         s1, t4, a2
                  lui          a2, 993012
                  fsgnjx.s     ft3, fs8, fa5
                  nop
                  sltu         sp, s9, s0
                  fclass.s     s5, fs1
                  auipc        a6, 571185
                  srl          a1, s10, zero
                  andi         t5, a7, -1290
                  div          s11, a2, s0
                  div          s2, s10, a1
                  fsqrt.s      fs4, ft8, rdn
                  andi         s1, s5, 1175
                  and          s6, t2, a6
                  fclass.s     gp, fs11
                  remu         s3, a4, s3
                  mul          t6, tp, s1
                  sra          gp, t5, a6
                  nop
                  fclass.s     t2, fs10
                  div          zero, a1, s10
                  fsub.s       fa4, fa7, fa2, rtz
                  mulhu        t3, s3, a5
                  div          a3, ra, a6
                  slti         a2, ra, 1523
                  add          s3, s3, s11
                  slli         gp, ra, 16
                  srl          s7, a0, s5
                  xor          s1, s3, ra
                  slli         s9, s10, 14
                  fmul.s       ft10, ft5, fa4, rtz
                  slli         a7, gp, 18
                  fmv.w.x      fa1, s3
                  addi         a6, s0, 205
                  flt.s        a6, ft11, ft11
                  addi         a1, s0, 1162
                  mulhu        a2, s6, ra
                  div          t3, t2, sp
                  fclass.s     s11, ft4
                  srli         s3, s1, 26
                  mulhu        a2, s6, s9
                  sltu         s6, a6, a7
                  ori          t6, t5, 721
                  rem          s3, s1, a3
                  mulhu        ra, ra, t6
                  fsgnj.s      ft11, ft5, fs2
                  fsgnj.s      fs0, ft7, fa3
                  sltu         a1, t1, gp
                  xor          a0, s4, a4
                  mulh         t2, t2, a3
                  fmul.s       fs9, fs2, ft5, rne
                  divu         a7, t3, a2
                  divu         a3, a6, s10
                  mulhsu       a4, t4, t5
                  fmax.s       ft4, fa3, fs2
                  remu         a4, tp, zero
                  andi         t0, s11, 896
                  fle.s        t3, fs3, fs3
                  fsgnj.s      ft11, ft1, ft4
                  fmul.s       ft1, fa4, ft0, rmm
                  feq.s        s2, fs3, fs8
                  fle.s        s11, ft9, ft8
                  slti         gp, s3, 715
                  fcvt.w.s     a4, ft0, rtz
                  lui          t5, 503601
                  xor          s9, s3, a3
                  srl          a0, a5, t1
                  sltiu        a4, s8, -1
                  and          s8, tp, s2
                  srl          a7, s5, s1
                  fcvt.w.s     a0, fa5, rne
                  nop
                  or           s2, s4, a2
                  fclass.s     s8, ft9
                  fsgnjx.s     fs11, fa5, ft7
                  flt.s        a6, fs6, ft9
                  fmax.s       ft10, fs0, fs9
                  ori          s9, ra, 1690
                  ori          s11, a5, -1876
                  fmin.s       fa7, ft0, fs10
                  slt          a2, s3, t0
                  sll          ra, a1, a1
                  fmv.w.x      ft6, t0
                  ori          t5, s3, -1982
                  addi         s10, s4, -1141
                  add          t2, a7, s3
                  slti         t0, a5, 1258
                  fsgnjn.s     fs1, ft1, fa5
                  fcvt.w.s     s1, fa1, rdn
                  mulhsu       a2, s7, s10
                  srl          s6, t0, s7
                  mulh         a2, t5, t3
                  flt.s        s2, ft4, ft0
                  fdiv.s       ft11, ft8, fs8, rdn
                  div          a2, a4, a6
                  sltiu        s8, ra, 1535
                  fsgnjx.s     ft5, ft1, ft4
                  fsub.s       ft7, ft11, fs3
                  mulhu        s11, s11, s6
                  fcvt.s.w     ft1, a7, rmm
                  addi         t0, s11, -1544
                  fcvt.w.s     a2, fs11, rtz
                  ori          a0, a3, 1860
                  fsgnjn.s     fa1, ft2, fa4
                  mul          s11, s7, s11
                  mulhu        t0, t4, t0
                  nop
                  rem          s1, t5, s8
                  srli         s0, a4, 2
                  and          gp, s5, a1
                  or           t6, a6, t5
                  mul          t6, s7, s7
                  fsub.s       fa3, fs2, fs5
                  fsqrt.s      fa1, fa3, rmm
                  fsqrt.s      ft10, fs11, rdn
                  fmin.s       ft10, fs3, ft8
                  fcvt.s.wu    ft1, s7
                  fsgnjn.s     fa5, fs7, ft0
                  fadd.s       ft8, fa4, fs9, rtz
                  srli         a2, ra, 1
                  ori          t2, s0, -431
                  add          s8, t1, s1
                  fsqrt.s      fs1, fa3
                  fdiv.s       ft5, fs9, fa2
                  fsgnjn.s     fs1, fs7, fa6
                  srai         a7, s11, 19
                  xor          gp, t3, s6
                  fsgnj.s      fa5, fs4, ft7
                  fsgnj.s      fs11, ft9, fa1
                  xor          a1, t4, ra
                  fsgnjx.s     ft7, fs1, fa3
                  mul          t3, a1, a1
                  fmv.x.w      s10, fa7
                  fle.s        zero, fs11, fs7
                  add          t3, t5, a7
                  fcvt.s.w     ft4, a5, rmm
                  fsgnj.s      ft1, fs1, fs4
                  fdiv.s       fa3, ft9, ft6
                  mulhsu       s6, s0, s7
                  fsqrt.s      fs2, ft7
                  mulh         s3, s5, s1
                  flt.s        s5, ft9, ft2
                  sub          a1, s6, s11
                  nop
                  fmul.s       fs0, ft8, ft6
                  remu         t6, s6, t4
                  sltu         s8, t5, zero
                  nop
                  sub          s6, s9, t0
                  mulhu        a2, t3, s5
                  mulh         s8, a6, a3
                  fadd.s       ft7, ft8, ft10, rmm
                  ori          a4, a5, 325
                  srl          s2, s7, zero
                  fcvt.w.s     ra, ft9
                  fmv.x.w      s6, ft6
                  add          a7, s11, s2
                  sub          t3, gp, a5
                  fmin.s       fs0, ft4, fa1
                  sra          t5, s10, a6
                  flt.s        s11, fa1, fa7
                  div          a3, gp, t6
                  fmax.s       ft8, fs4, fa6
                  div          s2, t0, a7
                  fsgnjx.s     ft5, fa5, fs10
                  divu         s7, s10, a2
                  xor          a4, gp, s4
                  fsqrt.s      fa6, ft3, rdn
                  fsgnj.s      fs1, ft2, fs6
                  fle.s        s10, fa4, ft8
                  fdiv.s       ft2, fa2, fa5
                  sll          s8, a6, tp
                  feq.s        s7, fs0, ft8
                  fmin.s       fs11, fa1, fs8
                  add          s7, s7, a4
                  srli         a2, a5, 12
                  fsub.s       ft6, fa7, fa2
                  xori         s11, s3, -735
                  fmv.w.x      fs11, t2
                  rem          a5, a0, t0
                  fsgnjn.s     ft6, fs10, ft11
                  slti         a1, a0, -1143
                  ori          a2, s9, -690
                  and          t6, s5, t6
                  sltu         s1, t1, s3
                  mulhsu       s9, t6, tp
                  mulhsu       a1, tp, a0
                  add          gp, t2, zero
                  and          s3, s7, t2
                  lui          s10, 61908
                  fcvt.w.s     s10, fs3, rup
                  lui          a5, 530093
                  fmv.w.x      ft5, s2
                  nop
                  mulhu        s8, s10, s5
                  fmv.w.x      fa2, a2
                  fsgnj.s      fs7, fs0, fs4
                  fcvt.wu.s    s2, ft11, rmm
                  fcvt.w.s     t6, ft11
                  andi         gp, a4, -1021
                  sra          a5, t6, t2
                  sltu         s0, t2, s2
                  fmv.w.x      ft4, a7
                  ori          s3, s3, 258
                  feq.s        a6, ft1, fa5
                  fsgnj.s      fs1, ft7, ft1
                  slti         t2, sp, 1180
                  andi         t3, t5, 197
                  addi         a6, s0, -1447
                  fcvt.w.s     s1, fs6, rmm
                  fsgnjx.s     ft6, fs5, fs4
                  srai         a6, s5, 1
                  mulh         ra, s5, a5
                  mulhu        s6, s5, s1
                  feq.s        s8, fa7, fs1
                  sra          a5, gp, a4
                  fcvt.s.wu    ft8, ra, rmm
                  fmv.w.x      ft6, s2
                  sub          s2, a4, s0
                  fle.s        t3, fa3, ft10
                  nop
                  auipc        a3, 138409
                  fsgnj.s      ft10, fs7, ft7
                  srli         s3, a7, 8
                  sub          a1, tp, s10
                  fdiv.s       fs4, ft9, fa6
                  fdiv.s       fs2, fs4, ft1, rup
                  nop
                  fsgnj.s      fs9, fs8, ft11
                  mulhu        t6, a1, zero
                  rem          t3, ra, s0
                  rem          a1, sp, gp
                  div          t3, s7, tp
                  fmv.w.x      fa6, s1
                  fmv.x.w      t0, ft3
                  fdiv.s       ft2, ft6, ft10, rtz
                  auipc        a1, 1023273
                  fsgnjn.s     fs1, fa3, fs5
                  fcvt.wu.s    a4, ft4
                  fmin.s       ft8, ft3, fs10
                  xor          a2, t5, a4
                  flt.s        a2, fs4, fs1
                  fmax.s       fa3, ft8, fa7
                  mulhsu       s6, t0, sp
                  fsqrt.s      fa1, fa6, rmm
                  sltu         a1, zero, s7
                  andi         s5, s1, -1692
                  fcvt.w.s     s4, fs5, rne
                  feq.s        s9, ft2, ft9
                  mulh         s0, t6, s3
                  and          t6, t3, s0
                  mulhsu       a3, tp, s11
                  slt          a3, s2, t6
                  lui          s6, 915741
                  xor          s2, s2, t0
                  fsgnjn.s     fs5, ft9, fa7
                  fadd.s       ft2, ft10, ft5
                  and          a3, s9, a4
                  divu         s11, s1, a7
                  srli         zero, s2, 7
                  fmin.s       fa1, fs4, fa3
                  sltiu        sp, a1, -1419
                  fmul.s       fa7, ft11, ft0, rtz
                  remu         s7, a3, t3
                  or           a1, tp, t1
                  xori         t6, a4, 765
                  slti         s1, a7, -1309
                  nop
                  fmv.x.w      a4, ft11
                  srl          a6, a6, s5
                  fcvt.s.wu    ft2, s3, rmm
                  fmax.s       fa5, fs5, fa5
                  div          a7, t4, s4
                  divu         t5, a3, t6
                  mulhu        s8, a2, t4
                  fclass.s     t2, ft10
                  or           a4, s7, s8
                  sra          t6, zero, a0
                  and          zero, t6, s2
                  sub          s10, a4, s4
                  fmax.s       fs0, fa2, fa7
                  mul          s5, ra, s7
                  mulhu        gp, s1, t0
                  slt          s4, s0, t5
                  fcvt.w.s     s6, fs7, rmm
                  fsgnj.s      fs6, ft5, fs4
                  srl          s8, tp, s0
                  fmv.x.w      t3, fa3
                  fsgnjx.s     fs0, ft10, ft5
                  slt          s10, s5, a6
                  slti         a6, s2, 1523
                  divu         a0, a1, s7
                  xori         a1, t0, -71
                  add          s0, a3, t1
                  fsgnj.s      fs6, fs4, fs6
                  rem          s7, a0, s0
                  fcvt.w.s     sp, fa2, rmm
                  fcvt.wu.s    sp, ft11, rtz
                  fsgnjx.s     ft4, fs1, fa0
                  xor          a7, s2, a0
                  xori         s4, s7, 1493
                  fsqrt.s      fs6, ft5, rdn
                  flt.s        s1, fa6, ft5
                  fsub.s       fa2, ft6, fa2, rmm
                  rem          s10, s1, s7
                  feq.s        t5, fs5, ft3
                  fadd.s       ft1, ft1, fs7
                  slt          s6, s2, t5
                  sra          a5, sp, a5
                  sub          t0, s3, t1
                  xor          s2, s5, gp
                  fmv.w.x      fs0, a1
                  fadd.s       ft7, fs11, ft9
                  div          s4, t1, a5
                  fsgnjx.s     fs11, ft0, fa6
                  sltiu        t3, s9, -1463
                  fmax.s       ft6, ft2, fs9
                  fclass.s     a2, fs1
                  rem          t2, tp, t5
                  mulhu        a5, t2, s0
                  sltu         s2, t1, s3
                  feq.s        t0, fs6, fs1
                  slli         s1, s6, 29
                  sll          t3, s3, zero
                  srli         ra, s5, 21
                  fmax.s       ft1, ft10, fs4
                  fmv.x.w      a2, fs7
                  and          s8, s1, s11
                  fcvt.wu.s    a0, fs8
                  fmin.s       fs9, ft4, ft3
                  mulhsu       s2, s2, s10
                  or           a6, t5, s6
                  remu         ra, s4, a2
                  fsub.s       fa1, fa3, fa7
                  fadd.s       fs11, fs10, ft8
                  remu         sp, s5, s1
                  fsub.s       fs9, ft0, fs11, rup
                  sltu         s11, s4, t3
                  or           ra, s4, s8
                  mulhsu       sp, t6, a5
                  sra          s3, tp, t0
                  fcvt.w.s     a4, fa2
                  fcvt.wu.s    s11, fs11
                  srai         s5, t2, 9
                  andi         sp, t4, 1052
                  fmax.s       ft11, ft0, fa2
                  add          s7, ra, t3
                  fmax.s       fs6, fa5, ft6
                  ori          t3, a1, -895
                  fsub.s       ft10, fa2, ft9, rne
                  nop
                  fclass.s     s0, fs9
                  fmin.s       fs7, fs3, ft11
                  mul          zero, a3, t2
                  auipc        ra, 740593
                  fcvt.s.w     fs2, ra, rtz
                  div          sp, t4, s2
                  srl          a0, s7, t6
                  sub          s11, s6, s4
                  fcvt.s.w     ft1, a3
                  slt          s4, a4, a3
                  fsgnj.s      ft6, fs8, fa5
                  fmul.s       fs9, fs8, ft8
                  ori          t0, s10, -1283
                  srai         a6, a7, 4
                  srai         s3, s3, 31
                  fcvt.wu.s    s7, fs3
                  auipc        s6, 415574
                  fmul.s       ft2, fs4, ft10, rtz
                  fmax.s       fs5, fs1, ft3
                  fsgnj.s      fs2, fa6, fa6
                  fmax.s       fa0, ft2, fs7
                  srai         a6, s11, 23
                  nop
                  fmul.s       fa3, fs0, ft8
                  fmin.s       fs10, ft7, ft2
                  fcvt.s.w     ft2, s5, rmm
                  andi         gp, s9, 1765
                  rem          a6, t6, t1
                  fle.s        a6, ft7, fs7
                  sra          a0, a1, a3
                  xori         a3, a4, -1283
                  fadd.s       ft7, fs8, fs4
                  sll          a1, s6, a7
                  feq.s        s9, ft7, fs11
                  xori         t5, s9, 1775
                  or           a7, sp, s4
                  mulh         s4, gp, s0
                  fmax.s       fs10, fa2, ft4
                  rem          s3, a1, s7
                  slli         t2, t6, 0
                  fmv.x.w      a2, ft8
                  fsgnjn.s     ft9, ft5, ft7
                  fclass.s     gp, ft9
                  feq.s        t5, fa3, ft4
                  and          s5, s1, zero
                  fle.s        s10, fa5, fa2
                  fsub.s       fa3, fa6, fs8
                  sra          t0, a0, s5
                  fmv.w.x      fs4, s10
                  mulh         s3, a7, s2
                  rem          gp, a5, s5
                  or           a2, s10, a5
                  mul          s8, a2, a2
                  rem          s6, a5, a2
                  nop
                  fsub.s       ft0, fs5, fa1
                  sub          s11, s0, a5
                  srl          t3, t0, s7
                  sll          s0, s8, a5
                  div          ra, a0, a1
                  fadd.s       fs6, fa5, fs7
                  sll          s7, a1, s2
                  andi         t3, t1, 278
                  fsgnj.s      fa7, fs11, ft4
                  and          t0, gp, tp
                  flt.s        s9, fs3, ft9
                  fclass.s     a0, ft4
                  slt          a0, s4, s8
                  fle.s        a3, ft7, ft10
                  divu         s6, s4, a3
                  andi         a4, s7, -984
                  remu         s4, t3, t3
                  sub          s5, a1, s8
                  auipc        s6, 736741
                  fadd.s       ft11, ft1, ft6
                  sll          t2, t1, s7
                  srli         a1, a4, 13
                  fmin.s       ft10, fs7, fs11
                  slti         zero, s1, 2031
                  fmin.s       ft5, fs0, fs7
                  fcvt.w.s     zero, fa1
                  xor          s3, t2, s5
                  div          s8, s9, tp
                  fmv.x.w      a1, ft8
                  fadd.s       fs0, ft3, ft4, rup
                  feq.s        a2, fs1, fa0
                  fcvt.s.wu    fs3, a6, rne
                  srli         s0, gp, 14
                  lui          a1, 893098
                  fclass.s     a6, fa0
                  fclass.s     s1, fs2
                  sltu         s1, t1, a6
                  fsqrt.s      fs0, fs10, rtz
                  xori         ra, s7, 2028
                  sltiu        gp, a5, -207
                  fsgnjx.s     ft11, fa7, fs6
                  fmv.x.w      a1, ft2
                  srai         a3, s7, 11
                  fcvt.wu.s    t3, fs5, rdn
                  fsgnjn.s     fs1, ft10, fa0
                  sub          s4, a6, s5
                  fmin.s       fs5, fs0, fs5
                  ori          t5, a2, -1864
                  fmul.s       fs1, fs4, ft5, rne
                  fmul.s       ft9, ft9, fa6
                  fmv.w.x      ft4, s11
                  fsqrt.s      fs7, ft7, rtz
                  fsgnj.s      ft9, fa7, fa5
                  fcvt.w.s     a5, ft4
                  fsqrt.s      ft6, fa5
                  or           sp, t3, t6
                  mulhu        s9, t0, s2
                  slti         s5, s11, -534
                  andi         s6, s11, -1477
                  fsgnjn.s     fa5, ft2, fa5
                  div          t6, t3, gp
                  srai         sp, gp, 14
                  fsgnj.s      fs8, ft6, fs8
                  divu         zero, a2, t2
                  xori         a4, s2, 1590
                  fmax.s       fs11, fs2, fa4
                  fcvt.wu.s    s8, ft4, rup
                  fmin.s       ft7, fs4, fs4
                  fsgnjn.s     fs10, ft1, fa0
                  srli         a3, t6, 2
                  slti         a6, a2, -1345
                  addi         a5, s9, 1697
                  fmul.s       ft7, ft4, ft3
                  remu         s4, sp, s4
                  fcvt.s.w     fa2, s7
                  fsgnjx.s     ft7, fs2, fs8
                  srli         s10, s10, 10
                  and          t6, s5, a2
                  sub          a1, s4, s10
                  or           a3, a7, a3
                  fcvt.s.wu    fs0, s11, rmm
                  fcvt.wu.s    s3, ft7
                  fsub.s       fs3, ft6, ft1
                  sub          s8, s9, a4
                  fsgnjn.s     fs1, ft8, fa0
                  lui          s5, 442916
                  xor          t6, zero, s11
                  rem          t6, gp, t1
                  div          s8, t4, s2
                  fmul.s       fa7, fa7, fs1, rne
                  fadd.s       fa2, ft7, ft3, rne
                  srai         a5, a3, 5
                  fsgnjx.s     fs1, ft2, ft6
                  slti         s7, s3, -765
                  add          s4, a3, a3
                  fcvt.wu.s    s7, fs3, rmm
                  fcvt.s.w     fa2, s1
                  fmv.x.w      a4, fs6
                  mulh         s4, t0, a7
                  slti         t3, t6, 289
                  srli         s9, ra, 3
                  fmul.s       fa0, fs8, ft11, rne
                  mulhsu       a2, gp, s8
                  srl          a1, ra, a2
                  fle.s        s9, ft4, fa6
                  mulh         s3, s8, t3
                  fmv.w.x      ft3, s2
                  srl          s6, a1, gp
                  fcvt.wu.s    gp, ft2
                  srl          s2, t0, s1
                  fmin.s       fa5, fs0, ft5
                  fsgnjn.s     fs11, fs11, fs11
                  srli         s1, t1, 23
                  andi         s8, a0, -1497
                  andi         t6, gp, -1260
                  fdiv.s       ft1, fs3, fa6, rmm
                  fsqrt.s      ft1, ft5, rmm
                  slti         s6, a7, 629
                  rem          a2, sp, s8
                  fsgnjn.s     fs9, fs0, fs1
                  divu         s0, t6, a5
                  fcvt.w.s     ra, fs2
                  addi         s2, a5, 591
                  nop
                  fsub.s       fa0, ft5, fs0
                  nop
                  sltu         s10, t5, s1
                  mulhsu       s8, t1, s2
                  sra          s5, ra, s1
                  fcvt.w.s     s2, fa4, rup
                  srl          gp, s6, a4
                  fcvt.s.wu    fs3, t6
                  fcvt.s.w     ft8, a2, rmm
                  add          s0, t3, a4
                  or           s2, a5, ra
                  rem          s7, t2, zero
                  fsub.s       fa2, fs2, fs11
                  fcvt.w.s     s1, fa2, rup
                  fsgnjx.s     fs10, fa1, ft0
                  andi         t6, gp, 603
                  xori         s6, tp, -1691
                  sra          a7, a7, tp
                  sltiu        zero, ra, 1665
                  add          s3, t2, a3
                  fmax.s       ft0, fs2, fa5
                  xor          s7, a0, a5
                  slti         s7, s2, -1244
                  remu         ra, t1, a7
                  flt.s        s0, ft7, fa0
                  slli         a6, s2, 13
                  fcvt.wu.s    s1, ft11, rmm
                  mul          s9, a0, t6
                  fcvt.s.wu    fs3, t0, rdn
                  fsqrt.s      ft5, fs0, rup
                  slt          a1, a0, a4
                  fcvt.wu.s    t6, fa4, rdn
                  xor          t6, a3, a5
                  fdiv.s       fa6, fs6, fa6, rne
                  fmul.s       ft11, fs8, fa4, rmm
                  sltu         t0, t0, ra
                  fcvt.s.w     fa7, sp
                  fsgnj.s      ft6, fs0, fs2
                  div          sp, gp, zero
                  xori         a2, s6, 1871
                  fle.s        a6, fs7, ft11
                  fcvt.w.s     a6, ft9, rne
                  fsqrt.s      fa3, fa6, rne
                  fclass.s     gp, ft0
                  slt          s2, s11, s1
                  addi         ra, a5, 927
                  mulhu        a2, t3, a7
                  fmul.s       fs2, fs9, ft7, rtz
                  remu         a6, a0, gp
                  fsqrt.s      fa4, fa5, rup
                  srai         s5, a1, 11
                  fclass.s     s9, ft6
                  fcvt.s.wu    fs9, s4, rne
                  srai         a7, s3, 22
                  fmul.s       fs9, fs2, ft6, rtz
                  fsqrt.s      fa6, fa3, rdn
                  fmax.s       fa4, ft2, fa1
                  add          sp, t4, s10
                  mulhsu       t0, ra, s9
                  fmax.s       ft9, ft10, fs2
                  mul          a5, t1, a1
                  div          s0, s9, t1
                  lui          s5, 339842
                  fmax.s       ft10, fa2, ft3
                  fsgnj.s      ft4, fa4, fs9
                  and          a5, s0, s11
                  fmax.s       fs3, fa7, fa5
                  sltiu        s5, zero, -794
                  slli         a0, s5, 14
                  fcvt.wu.s    s9, fs2, rmm
                  fsqrt.s      fa6, fs8
                  mulhu        s11, a5, t0
                  fmv.w.x      ft9, t4
                  fcvt.w.s     s7, ft2
                  fmin.s       ft7, fs11, ft0
                  fsub.s       fa4, ft2, fa1, rdn
                  nop
                  fsqrt.s      fs4, fs1, rne
                  fadd.s       fa2, fs9, fs3, rtz
                  fmin.s       ft3, fs0, ft10
                  srai         zero, s9, 10
                  auipc        s5, 110529
                  mul          a1, a0, s2
                  fcvt.wu.s    sp, ft7, rtz
                  fsqrt.s      fs3, ft2, rne
                  feq.s        s10, fa5, fa7
                  fmax.s       fa0, fs6, ft8
                  ori          gp, zero, 900
                  fsub.s       ft10, fs11, ft10, rne
                  flt.s        s6, ft4, ft3
                  fsgnjn.s     fs1, fs5, fs10
                  sra          s4, a3, s10
                  ori          s1, s6, -1396
                  srai         t5, a1, 24
                  fadd.s       ft9, ft11, ft11, rdn
                  xori         s10, a3, 1331
                  rem          a2, t5, t3
                  lui          s10, 97966
                  fmv.x.w      a4, fs8
                  srl          a0, a5, a3
                  fmv.w.x      fs9, t0
                  rem          s6, gp, a4
                  remu         s11, tp, s3
                  addi         gp, ra, -2043
                  addi         a7, a7, -1391
                  srai         s2, a2, 24
                  auipc        t0, 1001635
                  sub          s1, a0, s8
                  mulh         a2, t2, s10
                  sra          a2, s11, zero
                  slli         s5, t2, 4
                  fmin.s       ft1, fa2, fs7
                  lui          gp, 1014772
                  nop
                  remu         a3, s10, s10
                  srai         zero, sp, 7
                  sll          zero, t0, t4
                  ori          t3, a0, 191
                  and          s8, s10, s0
                  fsgnjx.s     fa0, ft9, ft9
                  fadd.s       fa5, fa1, fa7, rup
                  auipc        a2, 1046683
                  slli         s8, a4, 7
                  srai         s7, s2, 16
                  feq.s        sp, fs6, ft8
                  sll          a3, t6, ra
                  divu         a4, s5, sp
                  ori          a7, t3, -1117
                  nop
                  fsub.s       fs8, ft9, fa2
                  sll          s4, t4, s6
                  rem          a5, t4, t2
                  fcvt.s.wu    fa4, s0
                  fsgnjn.s     ft8, ft1, fs3
                  fsgnjn.s     fs9, ft8, ft1
                  fsgnjx.s     fs6, fa2, ft5
                  addi         t6, s7, 1742
                  fmax.s       fa7, fa2, fs2
                  srl          t0, s4, s0
                  nop
                  div          s7, s5, ra
                  xori         a0, sp, -936
                  xori         a5, s3, -868
                  sltu         s5, s10, s7
                  mulh         s9, t4, gp
                  andi         ra, a1, -679
                  add          s4, s2, a5
                  nop
                  addi         s4, s11, -1596
                  flt.s        a7, fs7, fa1
                  lui          s4, 201928
                  mul          t3, s2, a7
                  srl          s3, s1, s3
                  addi         a1, zero, 1276
                  sub          ra, s6, t2
                  xor          a4, s1, a0
                  fsub.s       fs3, ft9, fa4, rup
                  sub          a1, zero, t3
                  fcvt.wu.s    a1, ft9
                  fcvt.s.wu    fs5, a2
                  div          a3, ra, s0
                  add          t6, s6, a2
                  andi         t0, s0, -609
                  mulhsu       a7, a2, a3
                  srl          gp, zero, sp
                  auipc        s5, 833640
                  fmin.s       fs0, ft9, fa2
                  fsgnj.s      ft2, ft1, ft11
                  ori          a6, s1, -1672
                  div          a5, t3, s2
                  lui          s8, 639867
                  sub          a7, t2, s7
                  fmul.s       fa7, ft9, fa3, rtz
                  srli         a5, zero, 20
                  fadd.s       fa1, fa3, fs9
                  xor          s1, tp, t0
                  mulhu        gp, s2, a4
                  or           t6, t1, s0
                  sltiu        a7, t4, 779
                  mulhu        sp, t0, s6
                  rem          zero, t1, s0
                  fcvt.wu.s    s10, fa5
                  fmv.w.x      fa5, ra
                  lui          s3, 905863
                  add          s7, zero, t1
                  and          s11, s3, s0
                  fadd.s       fs3, fs7, fa1
                  fmul.s       ft6, fs9, fa0, rmm
                  fcvt.s.wu    fs8, t1
                  div          s10, s8, a6
                  nop
                  mulh         t0, a2, s6
                  fmv.w.x      ft0, s1
                  feq.s        s0, ft9, fa7
                  fsgnjn.s     ft0, ft5, fa4
                  fsgnj.s      fs7, ft0, fs0
                  flt.s        s1, fs8, fa0
                  mul          a2, t2, t6
                  xor          s2, s3, a6
                  or           a0, zero, s0
                  auipc        ra, 251767
                  ori          a0, a5, 1760
                  div          s8, a2, sp
                  fsgnjn.s     fa5, ft5, ft7
                  sra          s0, a5, zero
                  fcvt.s.w     ft6, gp
                  xori         a6, a0, 295
                  srli         s3, gp, 16
                  addi         s0, gp, 1383
                  fmax.s       fa5, fs7, fa1
                  srai         ra, a3, 25
                  sltu         s4, t4, s2
                  fsgnj.s      ft6, fs6, ft9
                  fcvt.s.wu    fa4, a7, rdn
                  fmv.x.w      a6, fs2
                  sltu         a2, t2, s4
                  fcvt.wu.s    s6, fs9
                  srl          s2, s8, t1
                  fcvt.s.wu    fs8, ra, rup
                  fmul.s       fs7, ft9, ft0
                  srl          gp, gp, a1
                  fsub.s       fs8, ft6, fa7
                  fsqrt.s      ft2, fs6, rne
                  fmv.w.x      ft2, a4
                  srai         s0, a0, 2
                  mulhsu       s5, a0, a6
                  fcvt.s.wu    fa3, ra, rmm
                  sub          s2, s1, t6
                  or           s10, t6, s7
                  slt          a1, t0, t1
                  rem          a6, s1, a4
                  srai         a6, s4, 3
                  or           a4, a0, ra
                  fcvt.w.s     s8, fs11
                  sra          s1, s2, s9
                  mulhsu       a6, s5, a1
                  rem          s6, a1, a5
                  fmv.x.w      ra, fa4
                  slt          t0, a3, s2
                  fsgnjn.s     ft0, ft6, ft4
                  slti         t0, t4, 1147
                  slt          zero, s7, s11
                  xori         t0, s5, 1345
                  mul          a3, a6, s6
                  slti         t5, s8, -1688
                  slli         s3, t1, 11
                  div          s1, ra, t0
                  fdiv.s       fs3, ft3, fa1
                  xori         s0, sp, 422
                  fsub.s       ft2, ft11, fa4
                  slti         s11, t2, 1559
                  fdiv.s       ft1, fs2, ft8, rup
                  fmin.s       ft7, fs4, fs9
                  sll          s0, a3, s0
                  ori          s5, t4, -918
                  addi         a1, t4, 701
                  fmv.w.x      fa4, s4
                  sltu         t6, zero, a6
                  and          a3, zero, a2
                  fcvt.w.s     s10, fs11, rtz
                  fle.s        sp, fa4, ft9
                  feq.s        a1, fa1, fa0
                  mulh         s9, t4, zero
                  fmul.s       fa6, fs4, ft0
                  fcvt.wu.s    s0, fs7, rne
                  feq.s        a2, fs5, ft7
                  fcvt.w.s     gp, ft2
                  fsgnjn.s     fs11, ft1, fs5
                  fadd.s       ft9, ft7, fs3, rmm
                  fsub.s       ft4, fa5, ft0, rmm
                  fsgnjn.s     fs9, fs1, fa3
                  fmv.x.w      a2, ft2
                  feq.s        s6, fs5, fa2
                  sltu         s7, t5, a1
                  sltiu        s0, gp, 1441
                  fle.s        t2, ft10, fs9
                  feq.s        t3, fa5, fa6
                  ori          s8, t6, 414
                  fsgnj.s      ft4, fs3, ft5
                  andi         s3, a1, 726
                  nop
                  sltiu        s5, a0, -607
                  xor          a3, a4, t1
                  srli         a5, t5, 31
                  xor          s11, a1, t5
                  fsgnjx.s     fs5, fs5, fs1
                  remu         a2, t6, s7
                  fcvt.s.w     ft11, a7
                  mulhu        s10, s2, a7
                  and          s3, a6, s1
                  fsub.s       ft10, ft2, fs9
                  andi         s1, ra, 519
                  slti         t5, ra, -1377
                  xor          s11, t4, t6
                  fsgnjn.s     fs4, ft6, fs6
                  fsgnjn.s     fs8, fa0, fa1
                  xor          a5, s2, s11
                  fsgnj.s      fs5, ft7, fa7
                  add          a6, s7, s2
                  addi         t5, s10, -1719
                  fclass.s     t3, fs0
                  andi         a5, s10, -300
                  sltiu        s8, s6, 759
                  fmv.w.x      ft6, s8
                  lui          a0, 704267
                  div          t2, s3, s2
                  or           a5, s6, a0
                  sltu         s2, s0, s0
                  sltu         t0, s1, s11
                  slti         gp, t2, -348
                  fmv.w.x      fa1, s5
                  nop
                  andi         a5, a7, 1116
                  ori          t6, s11, 99
                  fsqrt.s      ft8, ft6
                  srli         s6, s11, 4
                  rem          sp, s10, zero
                  or           s1, a3, gp
                  fsgnjx.s     fa4, fa0, fs6
                  fsgnjn.s     fs3, fs11, ft3
                  fsgnjx.s     fs1, fa1, fs10
                  slt          s6, a4, t2
                  fsgnj.s      ft4, ft10, ft6
                  sll          sp, t2, tp
                  slli         s6, a3, 11
                  remu         ra, a7, t5
                  fcvt.s.w     ft5, sp, rtz
                  fcvt.wu.s    s5, ft7
                  mulhu        t3, s11, ra
                  fadd.s       ft0, fa7, fa4
                  sltu         a6, s7, gp
                  fsub.s       ft2, fs2, fs2, rtz
                  nop
                  fsub.s       fa1, ft7, fa6, rmm
                  fcvt.s.w     ft9, s8, rne
                  mulhsu       s0, t0, a2
                  fsqrt.s      ft6, fa0
                  slt          a0, a3, s11
                  ori          a2, s6, -1185
                  fmin.s       ft8, fs5, fs11
                  fadd.s       fs2, fs1, ft2
                  fsgnjx.s     fa3, fs4, ft9
                  mulh         sp, t4, s8
                  fmin.s       ft8, fs2, fs4
                  fcvt.s.w     fa6, s9, rne
                  flt.s        s0, ft4, ft3
                  slt          t2, t2, t1
                  sub          s4, a4, a5
                  divu         a3, a1, t1
                  auipc        s7, 861427
                  mulh         s10, s1, t4
                  ori          ra, t3, 788
                  fcvt.w.s     s7, fa3
                  or           t3, s4, t3
                  sra          a2, a5, zero
                  fmax.s       fa4, fa1, fa0
                  auipc        a6, 930379
                  sra          a1, t1, s10
                  fcvt.s.wu    fs10, s9, rup
                  fsub.s       fs0, fs6, fs2
                  fmv.w.x      fs0, s10
                  sub          a7, a3, s7
                  fmv.x.w      t2, fs11
                  xor          t0, a4, a1
                  fmin.s       fs7, fs6, fs9
                  sub          s0, t0, s6
                  remu         s10, tp, a0
                  fmax.s       fs5, ft3, ft6
                  fsgnjx.s     fs10, ft0, ft3
                  xor          a7, a3, s4
                  fmv.w.x      ft8, s7
                  fsgnjx.s     fa1, ft5, ft4
                  lui          ra, 683139
                  xor          s8, ra, s10
                  srai         a0, s11, 14
                  sra          s8, t5, gp
                  fcvt.wu.s    a7, ft1
                  auipc        s0, 504497
                  fcvt.s.wu    fs8, t6
                  lui          a4, 938192
                  or           a6, a6, ra
                  lui          s5, 692482
                  sra          zero, s9, gp
                  divu         t5, s5, s6
                  andi         a1, zero, -573
                  xori         s10, t3, -633
                  add          s7, s4, s6
                  fmul.s       fs10, fs1, fs6, rne
                  fle.s        t3, fa3, fa6
                  div          s1, a7, t0
                  nop
                  fsgnjn.s     fs6, fs0, ft6
                  fsgnjx.s     fs3, fs2, fs7
                  auipc        t3, 552021
                  ori          t3, t5, 699
                  mulhu        s1, a0, t1
                  mulh         gp, a6, s5
                  fsub.s       ft1, fs7, ft3, rtz
                  fsub.s       fa3, fa0, fs8
                  mul          ra, s5, a0
                  fcvt.wu.s    s9, fa5, rdn
                  sltu         zero, s8, s8
                  auipc        s7, 274623
                  divu         t5, a5, t4
                  sltu         t0, zero, s7
                  fcvt.wu.s    a2, fs10
                  nop
                  fcvt.wu.s    t0, fa0, rtz
                  andi         a2, ra, -800
                  remu         ra, s2, s3
                  fadd.s       fs11, ft10, fa5, rdn
                  auipc        s1, 615968
                  fle.s        t0, ft10, fa0
                  nop
                  fdiv.s       fs11, fa5, fa6
                  fdiv.s       fs8, fs5, fs9, rdn
                  fclass.s     a7, fs10
                  or           s7, a6, s4
                  fcvt.s.wu    fs2, a0, rup
                  fmin.s       ft7, ft0, fs8
                  fclass.s     t3, ft2
                  srai         s8, s10, 19
                  fclass.s     a6, fa7
                  fle.s        sp, ft5, ft7
                  addi         a2, s4, -787
                  feq.s        a7, fa7, ft1
                  sll          a0, t5, a6
                  fsgnjx.s     fa3, ft8, fs11
                  fsub.s       fs5, fa0, fa0
                  ori          a2, s5, -952
                  fcvt.s.w     fa5, t4
                  mul          s0, s10, sp
                  sltu         s8, a6, a1
                  fcvt.s.w     ft7, a0, rtz
                  divu         a5, tp, s1
                  and          a3, s6, s2
                  srai         s2, t5, 8
                  mul          a0, s11, t5
                  mulhu        s7, a4, t1
                  flt.s        a7, fs10, ft5
                  fcvt.wu.s    t3, fa2
                  fmv.w.x      fs3, s10
                  fcvt.s.wu    fa1, a6
                  divu         s8, t5, a3
                  auipc        s11, 98440
                  fsgnj.s      ft11, ft7, ft11
                  fcvt.s.wu    ft6, s2, rup
                  fsgnj.s      fs10, fa2, fs2
                  remu         gp, a2, t4
                  slti         s6, s11, -1527
                  slt          s5, a2, s10
                  slli         a1, a0, 12
                  fsub.s       fs3, fa6, fs0
                  lui          sp, 845992
                  fcvt.wu.s    a4, ft8, rdn
                  slt          s9, tp, s7
                  sll          s7, gp, gp
                  flt.s        a5, fa0, fa6
                  fsgnjx.s     fs7, ft11, fs3
                  fmul.s       ft6, fa1, fs2
                  sub          a1, a4, a5
                  remu         a6, t5, a6
                  fmul.s       fs10, fs2, fs0
                  sltu         a1, t1, s6
                  sra          t2, gp, s11
                  sltu         gp, a0, a3
                  sltu         s1, s10, s4
                  fsgnjn.s     ft9, ft4, fs6
                  fsub.s       fs5, ft8, fa5
                  nop
                  srl          a6, s4, sp
                  nop
                  fmin.s       fs3, fa4, ft9
                  fdiv.s       ft4, fs2, ft3
                  ori          gp, gp, -472
                  srai         ra, t6, 28
                  mulh         sp, a5, sp
                  mulhsu       s11, t1, t4
                  mulhsu       a5, s6, s7
                  divu         a1, a1, t1
                  fmul.s       fa5, fs7, fs7, rdn
                  sll          s8, ra, s1
                  srl          t3, a3, s9
                  xori         a6, a0, -563
                  fsqrt.s      ft11, fs4, rtz
                  sra          s8, zero, s3
                  fmul.s       fs9, fs2, ft1
                  fmin.s       fa4, fs4, fa3
                  rem          s6, a4, s0
                  fmv.x.w      t3, fs9
                  mulhsu       a7, s5, s4
                  andi         t5, s7, 1829
                  divu         s6, t4, a0
                  fsgnj.s      ft8, fa2, fa5
                  srai         s8, ra, 24
                  fmul.s       fs3, fa6, fa7, rne
                  fcvt.wu.s    s9, fs11, rdn
                  div          gp, s4, t1
                  divu         a1, s4, a7
                  slt          s1, t5, gp
                  addi         a0, s5, -517
                  add          sp, s5, s11
                  fmin.s       ft5, fs0, ft7
                  fadd.s       ft1, fa5, fs5, rdn
                  mulhsu       s4, a7, s9
                  rem          a3, sp, gp
                  fcvt.wu.s    zero, fs0, rne
                  feq.s        a5, fa2, fs11
                  xor          s1, s3, a0
                  sltiu        a0, a4, 4
                  flt.s        a5, fs2, ft5
                  flt.s        ra, fs6, fs4
                  fcvt.wu.s    a7, ft0
                  mulhsu       s4, s11, zero
                  fcvt.s.w     fs4, t6
                  slt          t6, a3, s11
                  mulhu        ra, t6, ra
                  sltiu        s9, a6, -1636
                  sub          a2, a3, gp
                  sltiu        a1, s7, 2036
                  fsgnj.s      fs10, fs5, fs8
                  slti         s11, t2, -982
                  flt.s        s11, ft5, fa6
                  rem          s1, sp, a4
                  mulh         s7, a3, a2
                  fsgnjx.s     fa7, ft11, fa7
                  rem          t5, s9, tp
                  srli         s11, t6, 5
                  fcvt.wu.s    s3, fa2, rtz
                  xori         s7, zero, -1232
                  fmul.s       fs5, fs6, fs8
                  div          sp, s9, s1
                  mulhsu       t3, t3, s10
                  fmin.s       fa1, fs11, fs8
                  auipc        a5, 981062
                  mulhsu       a1, a3, t0
                  mulh         a6, sp, s1
                  sltu         a0, zero, t5
                  slti         zero, s4, 1043
                  remu         a4, a3, s10
                  sub          s9, s5, sp
                  slti         a3, a5, 235
                  fle.s        s11, fs6, ft4
                  remu         a3, a0, t5
                  xori         a3, t1, -1583
                  sltu         gp, a5, t2
                  fmv.x.w      a4, fs5
                  xori         gp, t4, 1016
                  fsgnj.s      ft11, fa7, fs10
                  mulhsu       s2, tp, s8
                  nop
                  fmv.w.x      ft2, t6
                  and          s2, a0, gp
                  lui          t5, 470803
                  lui          a2, 346968
                  mulhu        a0, s6, s1
                  auipc        s6, 389158
                  fcvt.s.w     fs2, t0, rtz
                  ori          t6, t2, 1212
                  mulh         a4, s2, t6
                  xori         t3, gp, -1496
                  xor          zero, s7, t3
                  fmv.w.x      ft4, s3
                  lui          s5, 349336
                  andi         a6, s6, 1473
                  fle.s        t0, ft6, fs10
                  slli         a1, s0, 3
                  fcvt.s.w     ft8, s2
                  srai         s7, t2, 16
                  fcvt.wu.s    s2, fa7
                  fmv.x.w      gp, fa2
                  srl          ra, ra, s9
                  fmv.w.x      ft5, s9
                  mulhu        t6, s10, s4
                  fmul.s       ft8, ft11, ft10
                  fmv.w.x      fa3, s10
                  sll          t3, sp, s11
                  ori          gp, ra, -260
                  add          a3, t3, tp
                  add          zero, s2, a3
                  fsqrt.s      ft4, fs5, rdn
                  ori          s10, s5, -873
                  fcvt.wu.s    a4, fs9, rdn
                  fle.s        s7, fs11, ft10
                  and          s10, a4, a0
                  fsgnjx.s     fs2, fs8, fs0
                  rem          t2, zero, gp
                  divu         gp, sp, ra
                  fcvt.w.s     t5, fa6, rmm
                  mulhu        s7, s7, t4
                  add          a4, a6, s1
                  lui          s1, 1924
                  rem          sp, t4, s0
                  fsgnjx.s     fs6, fa5, fs2
                  fcvt.wu.s    t3, fs6, rne
                  divu         a7, a4, t5
                  add          a4, a5, s11
                  xor          a6, s5, t4
                  fsgnj.s      fa3, ft0, fa3
                  fmax.s       ft7, fs3, ft8
                  fmv.x.w      s6, fs2
                  fclass.s     sp, fa5
                  mulhu        a5, a2, t6
                  fsgnj.s      fa3, ft8, fa6
                  sltu         s3, a7, s7
                  fsub.s       fs6, fa6, fa7
                  fle.s        t6, ft11, fs1
                  slli         s9, t2, 31
                  div          s7, s4, s2
                  fcvt.s.w     fs11, a5
                  fsgnjx.s     fs7, ft11, fs0
                  slti         s0, t5, 1335
                  fcvt.s.wu    fs1, a1
                  ori          sp, s11, 2001
                  fdiv.s       ft2, ft1, ft11, rtz
                  fcvt.w.s     s7, ft11
                  or           s8, s5, t1
                  mulh         t5, s6, a6
                  slli         t3, t0, 15
                  fcvt.s.w     ft7, s7
                  fsub.s       fa2, fa4, ft8
                  fsgnjn.s     fa3, fa0, fa2
                  slt          a1, t1, s7
                  fmax.s       ft7, ft9, fs10
                  slt          t0, a5, s4
                  slt          t2, s7, t6
                  sll          s9, s8, a1
                  mul          a6, t6, s9
                  xori         s6, a5, 551
                  fle.s        a5, ft6, ft1
                  fsqrt.s      fs5, fs5, rne
                  addi         ra, a3, -964
                  divu         ra, t1, t5
                  sub          a2, sp, a1
                  slli         a0, a0, 15
                  srli         ra, t6, 7
                  add          s5, t4, s9
                  mulhu        s2, t4, tp
                  xori         t5, a6, 779
                  mulhsu       zero, a7, sp
                  sll          t5, zero, s5
                  nop
                  srli         gp, gp, 14
                  divu         t3, t6, s9
                  srl          s4, tp, a0
                  remu         t3, a2, a5
                  andi         s0, tp, 1328
                  xor          s0, t5, a6
                  srl          t0, s9, t5
                  andi         a3, s11, 688
                  nop
                  fcvt.s.w     fs5, t6, rdn
                  mulh         t3, zero, zero
                  feq.s        s11, ft4, fs10
                  fcvt.w.s     a4, ft2, rtz
                  mulhu        s3, s5, tp
                  slti         sp, s6, -94
                  fsgnjn.s     fa2, ft8, fa4
                  slti         a1, zero, 601
                  flt.s        s9, ft9, fs0
                  fmv.x.w      a4, fs9
                  fmax.s       ft10, fs8, fs6
                  fmv.w.x      ft4, a2
                  fmul.s       ft7, ft4, fs9
                  xori         t2, zero, 1483
                  sll          a2, s11, t4
                  fcvt.s.w     ft1, s8
                  fmul.s       fs7, fs6, ft4
                  ori          gp, gp, 570
                  sltiu        a3, t4, 343
                  xori         s6, s4, 827
                  rem          s8, a7, s2
                  mul          t6, s1, s4
                  fsub.s       ft5, ft5, fa4, rne
                  lui          ra, 616153
                  fsgnjx.s     fa7, ft2, ft3
                  fmin.s       fs5, fa7, fs1
                  feq.s        t5, fa4, fs10
                  fcvt.wu.s    s8, fs5
                  sub          a0, s6, a7
                  fsgnj.s      fa5, fs4, fs3
                  fcvt.s.wu    fs9, s1, rne
                  mulh         a7, t5, zero
                  flt.s        t3, fs4, ft11
                  div          s1, s2, ra
                  or           a0, s4, a6
                  srli         sp, s11, 12
                  fsqrt.s      fs11, ft6
                  lui          a7, 893217
                  andi         t6, s8, -55
                  fcvt.s.wu    fa2, t5
                  xor          s0, s3, t3
                  add          a6, s7, sp
                  fcvt.wu.s    s5, fs6, rne
                  fsqrt.s      fs10, ft0, rup
                  divu         t6, t6, t1
                  addi         s11, zero, -876
                  srai         s8, t6, 9
                  sltu         s10, s2, a6
                  ori          t0, sp, 548
                  mulhsu       t5, s11, s1
                  sll          sp, t1, t6
                  fmv.w.x      ft0, t5
                  fdiv.s       ft2, fa3, fs7
                  fsgnjn.s     ft11, fa4, ft1
                  fclass.s     t3, ft0
                  slt          a3, a0, t2
                  mulhsu       t2, t6, t3
                  fcvt.s.w     ft0, zero
                  fsgnjx.s     ft9, ft8, ft2
                  andi         s3, s6, -562
                  fadd.s       fs9, ft8, ft4
                  lui          s6, 445704
                  nop
                  or           s4, zero, a6
                  mulhu        sp, s1, s8
                  sltiu        s0, s4, -337
                  divu         s11, a7, t2
                  divu         s4, s5, s4
                  addi         s11, s8, 2034
                  sll          s7, t0, s10
                  mul          a5, s4, zero
                  remu         gp, a1, a3
                  srli         s11, tp, 13
                  flt.s        s7, fs1, fs6
                  auipc        a2, 301163
                  fsgnjn.s     fs7, fa6, ft3
                  fsqrt.s      fs9, fa4, rdn
                  fadd.s       fs7, ft1, ft2, rmm
                  srli         gp, a0, 3
                  fcvt.wu.s    s6, ft9, rmm
                  fsgnjx.s     ft1, fs4, fa7
                  sltiu        t5, s5, -1849
                  divu         a1, a5, a7
                  sra          a0, t3, a1
                  rem          sp, s4, a0
                  fclass.s     s1, fs5
                  mul          a0, sp, gp
                  mul          zero, s7, a2
                  mul          s5, s1, t3
                  or           a4, t0, a1
                  rem          a5, s10, t5
                  fsgnjx.s     fa4, fa2, fs8
                  fsgnj.s      ft3, fs1, ft9
                  addi         s10, a0, -1694
                  rem          t0, t3, tp
                  slti         s3, t4, 394
                  mulhsu       a6, s5, t0
                  fmul.s       ft7, fs5, fa2
                  mulhsu       t3, a5, s11
                  fmv.x.w      a1, fs8
                  divu         s6, a2, t1
                  fsqrt.s      fs3, ft5, rtz
                  mulhu        t3, s3, a7
                  fle.s        s6, fa4, fs7
                  auipc        s10, 388310
                  srai         s5, s7, 10
                  sltu         a5, t4, a5
                  sll          a2, t0, sp
                  sltiu        t3, s11, 128
                  add          s6, gp, t4
                  nop
                  sll          s0, a2, s10
                  fmv.x.w      s8, fa2
                  sll          a4, t2, s9
                  add          t6, t6, a0
                  or           s5, s4, s8
                  fmin.s       fa1, ft3, fa0
                  fclass.s     t3, fs2
                  mulhu        s9, s1, zero
                  xori         sp, a3, -705
                  fcvt.wu.s    t3, ft5
                  lui          sp, 76225
                  srli         a6, a6, 31
                  xor          a3, s4, a2
                  ori          a6, s2, 1012
                  mulhsu       a5, s8, zero
                  fmin.s       fs9, ft0, ft3
                  slti         a7, a7, -714
                  fmul.s       fs4, fs1, fs8, rmm
                  sltu         a4, t5, sp
                  div          t5, s2, t5
                  fle.s        s11, fs5, ft0
                  fcvt.s.wu    ft3, tp
                  srli         a5, ra, 1
                  or           s8, t4, s1
                  sll          t0, s0, gp
                  fsgnjn.s     fa2, fa7, fa1
                  fcvt.s.w     ft4, a2
                  fmv.x.w      a6, fs3
                  srai         s0, s4, 2
                  fadd.s       ft0, fs1, ft1
                  or           a0, t2, s11
                  fsub.s       fa5, fs11, ft8, rmm
                  fle.s        s3, fs2, fs0
                  fsgnj.s      fs6, fa7, fa2
                  fle.s        s8, fs11, fa6
                  fcvt.wu.s    s3, ft10
                  fadd.s       ft0, fa5, fa5
                  or           t2, tp, a1
                  or           s11, s3, s6
                  fmul.s       fa1, ft3, fa3
                  auipc        s9, 799279
                  sub          s3, ra, ra
                  srli         s2, a6, 11
                  fsub.s       fs8, fs7, ft5
                  srai         t0, s2, 20
                  lui          sp, 115301
                  fle.s        a7, fa0, fs0
                  or           a0, s4, a2
                  fsqrt.s      ft3, ft11, rup
                  fsgnjn.s     ft0, fa0, fa6
                  auipc        s6, 438245
                  fclass.s     s7, fs10
                  remu         sp, t4, s8
                  or           s5, tp, tp
                  mulhsu       s5, s0, s4
                  fcvt.s.w     fs9, gp
                  fmin.s       fa1, fs5, fs0
                  fadd.s       fa4, fs9, ft4
                  fcvt.w.s     s1, fs5, rtz
                  slt          a7, a0, t4
                  xori         s3, s4, -1894
                  div          a7, s5, zero
                  rem          a6, s2, a5
                  fcvt.s.wu    fs7, s11
                  slli         s0, a7, 28
                  fcvt.w.s     t6, ft4, rmm
                  fsqrt.s      fs0, fs7
                  flt.s        s7, ft9, fa1
                  fdiv.s       fs2, ft8, fa1, rmm
                  srli         sp, a5, 27
                  mulhsu       a5, t0, s4
                  add          s1, s7, s6
                  fclass.s     s9, fs2
                  flt.s        gp, fa2, ft2
                  add          s10, ra, s8
                  sltu         s10, sp, s6
                  fmv.x.w      a2, fa0
                  div          t6, s4, s8
                  sra          t5, gp, s5
                  divu         s4, s5, t3
                  fmax.s       fa0, fa3, fs0
                  andi         s7, s8, 1517
                  sub          s10, t3, a3
                  fsqrt.s      fs1, ft7
                  fmul.s       ft6, ft7, ft11
                  fdiv.s       ft2, fs9, ft1
                  fmul.s       fa6, ft9, fa0
                  fsqrt.s      ft9, fa6
                  auipc        t3, 343997
                  fcvt.wu.s    t3, ft6, rne
                  fcvt.s.wu    fs11, zero
                  add          zero, s7, a4
                  sll          s2, s3, s11
                  fcvt.w.s     s9, ft8
                  fcvt.s.w     fs11, a4, rdn
                  fsgnjn.s     fa1, ft1, fs3
                  nop
                  or           a0, s3, s4
                  mul          s3, s9, zero
                  fsgnjx.s     fa4, fa4, fs2
                  sra          a3, gp, s9
                  feq.s        s3, fs10, fs11
                  slti         sp, s11, 462
                  sra          ra, s10, t6
                  sll          a0, s4, t2
                  divu         a2, s4, t6
                  fmv.w.x      ft8, a2
                  fmax.s       ft0, ft6, ft11
                  ori          sp, a7, -1149
                  or           a2, t1, zero
                  fadd.s       ft2, fa4, ft5
                  ori          a5, zero, 309
                  fsgnjx.s     fa4, ft10, ft11
                  fmax.s       fs1, fs11, ft1
                  xor          t6, t1, sp
                  fsgnjx.s     ft10, fa2, fs5
                  remu         s8, s3, a0
                  remu         s4, t2, s1
                  and          s8, s5, s4
                  flt.s        a7, ft9, fa2
                  mulhsu       s9, t3, a1
                  ori          t2, a3, -145
                  fadd.s       fa4, fa6, ft10, rtz
                  srai         a3, s11, 9
                  fmin.s       fs1, fs2, fs1
                  fle.s        gp, fs4, fs9
                  addi         t5, t0, 1483
                  fle.s        ra, ft9, ft5
                  srai         s5, s4, 19
                  fsgnj.s      fs7, ft3, ft8
                  feq.s        s1, ft11, fs9
                  fcvt.w.s     zero, ft5, rtz
                  auipc        s0, 423511
                  or           s8, t1, ra
                  mul          a3, s4, s6
                  fdiv.s       ft6, ft11, ft11, rtz
                  fclass.s     s2, fs6
                  or           s0, t1, s0
                  fsgnj.s      fa1, fa0, fs0
                  slti         a6, sp, 996
                  sub          t3, gp, a2
                  mulh         s3, t2, s1
                  andi         ra, s7, -542
                  andi         sp, a1, -189
                  lui          ra, 612634
                  fsgnjn.s     ft9, fs4, ft0
                  mul          s10, t2, s6
                  fcvt.w.s     s4, ft8
                  remu         s1, a1, a1
                  slti         t3, t2, 1239
                  fadd.s       ft4, ft2, fa0, rmm
                  fsgnjn.s     ft10, fa3, fs6
                  div          gp, a7, s0
                  flt.s        ra, fs8, ft4
                  andi         s4, s8, 343
                  nop
                  fmin.s       ft1, fs11, fs11
                  add          t5, a0, s11
                  lui          t3, 312083
                  nop
                  fsub.s       fs9, fs8, fs2
                  flt.s        s10, ft6, ft3
                  add          ra, t5, gp
                  auipc        a0, 86591
                  slti         t0, s8, -155
                  xori         t6, t4, -944
                  fsgnjn.s     fa3, fs10, fs2
                  andi         zero, s0, -1247
                  fdiv.s       fs8, fa6, fs2
                  fcvt.w.s     s11, fs0
                  mul          t0, s2, ra
                  slti         s4, s6, -514
                  or           s10, a0, t3
                  fcvt.wu.s    gp, fa2, rup
                  fle.s        s4, ft4, ft4
                  fcvt.s.wu    fs2, t2, rup
                  slti         s3, t3, -1995
                  slti         a2, gp, -121
                  fsgnjn.s     fa2, fs10, fs3
                  mulhu        s5, a3, tp
                  sltu         a3, a2, s9
                  fsgnj.s      ft3, ft1, ft7
                  sub          a7, ra, s6
                  fmax.s       fs3, fa0, fs5
                  fsgnjn.s     fa6, ft5, fa6
                  fcvt.s.w     fa2, a4
                  ori          s4, s0, -807
                  fmul.s       fa3, fa6, fs0
                  sra          t6, a6, t6
                  fcvt.s.w     fs5, a5, rmm
                  fmv.x.w      t5, fs4
                  fclass.s     sp, ft7
                  slli         s6, t6, 4
                  fcvt.wu.s    s5, fs10
                  div          s4, s6, a7
                  or           a7, ra, s0
                  mul          s3, t6, s1
                  fmul.s       fa6, fs2, fs5, rtz
                  fcvt.w.s     a1, ft1
                  addi         a6, s0, -835
                  addi         a4, a7, -455
                  fmin.s       fs3, fa7, fa5
                  srl          a4, gp, t1
                  add          a2, t4, a1
                  srli         t0, ra, 10
                  mulhsu       s8, a6, s6
                  sub          s6, s1, a4
                  slt          ra, s4, s2
                  mulhu        sp, t3, a2
                  fmin.s       ft6, fs0, fs11
                  fmin.s       fa2, ft3, fa0
                  srl          a0, s9, t6
                  fsgnj.s      ft6, fs6, fs0
                  fclass.s     a0, ft2
                  fadd.s       ft4, fs3, ft10, rne
                  andi         a4, t2, -1950
                  fcvt.wu.s    s11, fs1, rup
                  remu         a3, a1, a0
                  mul          s2, a3, s11
                  sra          t6, s4, t4
                  xori         t6, t1, 113
                  sra          s2, s2, a2
                  srli         a2, s0, 18
                  fmax.s       fa6, fs9, fa4
                  xori         zero, s4, 1477
                  sltu         s3, s7, ra
                  addi         s0, t3, 736
                  slli         zero, s10, 9
                  fmv.x.w      a4, fs11
                  fmin.s       ft1, ft4, ft7
                  xori         s3, gp, 29
                  auipc        ra, 251249
                  or           t5, t5, t3
                  andi         a1, gp, -511
                  rem          s6, a4, t2
                  fsub.s       ft2, fa1, fs4
                  fsqrt.s      fs9, ft1
                  mulh         a0, a2, a3
                  sltiu        s9, s1, 512
                  fmv.x.w      s6, ft5
                  fmax.s       ft2, fs3, fs8
                  fdiv.s       fs10, ft7, ft6, rne
                  mulhsu       t0, t3, t0
                  flt.s        s2, fs4, fa6
                  fmv.w.x      ft4, t0
                  nop
                  srai         s8, t6, 3
                  ori          s2, a1, 1345
                  slt          a3, ra, s11
                  mulhu        s6, a5, gp
                  fmv.w.x      ft8, a3
                  divu         s11, t0, a2
                  andi         s8, a7, 68
                  fcvt.wu.s    s1, ft2
                  slti         t2, t5, -1372
                  xori         s1, s11, -312
                  fle.s        a7, ft0, fa1
                  fclass.s     zero, fs7
                  and          a7, tp, a3
                  slli         a2, t5, 22
                  fcvt.w.s     a5, ft2
                  mulh         s2, s9, t5
                  rem          a2, a4, s4
                  andi         s0, a3, -426
                  sra          s3, s1, s2
                  div          s11, zero, s6
                  fmin.s       fs2, ft4, ft9
                  or           sp, t2, a6
                  srai         a7, t6, 23
                  fdiv.s       fs6, ft9, ft10
                  mulhu        t3, s5, a1
                  fadd.s       ft9, ft3, fa7
                  sub          a6, s3, t3
                  remu         s11, a6, t0
                  mul          t3, s8, a1
                  sltiu        s3, t6, -1413
                  mulh         a7, t2, s2
                  fmul.s       fs1, ft5, fs6
                  xor          a7, a6, s9
                  fcvt.s.wu    fa7, s0, rmm
                  auipc        a7, 626021
                  fcvt.wu.s    s7, ft1
                  fcvt.s.wu    ft10, sp, rtz
                  sltiu        s6, t0, 766
                  fdiv.s       ft1, ft4, fs3
                  fcvt.w.s     zero, ft11
                  and          gp, t5, t4
                  auipc        zero, 759264
                  fsgnjn.s     fs10, ft8, ft2
                  sll          s10, s4, gp
                  xor          a6, a3, s11
                  sltu         t2, a2, a6
                  fle.s        s2, ft10, ft4
                  or           s6, s6, t6
                  xori         sp, s3, 1366
                  fmax.s       fs9, ft4, ft4
                  slti         s2, s5, 1071
                  fdiv.s       ft1, fs5, fs4
                  fcvt.wu.s    t2, fs5
                  auipc        a7, 862016
                  div          a6, a0, a1
                  lui          s9, 287830
                  fsqrt.s      fs10, fa2
                  sltiu        s4, s4, -1143
                  feq.s        gp, ft10, ft8
                  fdiv.s       fa0, ft0, fs2, rdn
                  add          a3, a6, t4
                  slli         t5, s8, 5
                  srl          t0, s3, tp
                  andi         s4, t3, -10
                  srl          t5, a5, a0
                  fmin.s       ft7, fa6, fa3
                  sltiu        a4, t2, -1161
                  fsgnjx.s     ft4, ft2, fa7
                  sltiu        a7, a3, 647
                  xori         t0, s2, -1803
                  srl          s10, t2, ra
                  mulhsu       t3, s2, a7
                  srai         s7, s4, 29
                  fcvt.wu.s    a5, fs3
                  addi         s3, t1, -308
                  sltu         s8, s5, a3
                  slli         s0, zero, 8
                  srai         gp, t0, 31
                  fcvt.s.w     fs8, t2
                  fcvt.wu.s    t0, fs9
                  fsgnjn.s     fs8, ft2, ft8
                  fmin.s       fs10, fs7, fs9
                  addi         s3, s11, 302
                  or           a0, s3, a2
                  fmin.s       ft11, ft7, ft1
                  srl          s6, s11, a4
                  fmv.x.w      gp, fs3
                  fcvt.s.w     fa2, s9
                  and          a6, t6, s7
                  fmv.w.x      fs5, s11
                  srai         sp, s7, 22
                  lui          s5, 511725
                  andi         t6, zero, 1729
                  srai         a4, a7, 11
                  slt          a7, t1, a5
                  mulhu        ra, t5, t5
                  fadd.s       ft9, fs11, fs9, rne
                  flt.s        s6, fs5, fa0
                  mulh         s4, s8, t6
                  slt          s7, tp, s3
                  sll          s3, s8, zero
                  srai         s1, s10, 18
                  fmax.s       fa7, ft7, ft9
                  fle.s        s0, fs11, fs4
                  mulhu        s5, t2, s1
                  fmin.s       fa3, fs11, fa3
                  sra          s0, a1, s11
                  slt          a4, s5, t2
                  rem          s0, s0, s0
                  nop
                  nop
                  fsgnjx.s     fs0, fa4, ft6
                  mulhu        a4, s4, s3
                  ori          a4, a6, 1756
                  add          s1, sp, t5
                  feq.s        s9, fs3, fa3
                  fsgnjx.s     ft3, ft7, ft2
                  fle.s        t5, fs4, fs6
                  or           s6, a4, a4
                  fle.s        t3, ft10, fs2
                  lui          a4, 862927
                  fsgnj.s      ft0, fs2, fs5
                  or           t3, a2, zero
                  xori         zero, t6, 599
                  sra          t3, a0, sp
                  slti         a7, a0, -380
                  fdiv.s       fa1, fa1, fs10
                  nop
                  fsgnjx.s     fs8, fa3, ft2
                  ori          a0, tp, 278
                  ori          gp, s0, 1973
                  nop
                  fsqrt.s      fa6, fs4, rne
                  divu         s2, a7, tp
                  and          t0, s7, t4
                  srli         sp, a1, 15
                  slti         s11, a7, 288
                  add          ra, a0, s7
                  fcvt.wu.s    a2, fs3, rmm
                  fcvt.w.s     s6, ft1
                  mulhsu       s11, t2, ra
                  feq.s        s10, fs8, fs4
                  andi         s1, a2, 1380
                  slt          t5, t3, a5
                  mul          t2, t3, s0
                  fmin.s       fa2, ft11, fa4
                  remu         a7, sp, a5
                  mulhsu       a1, t2, a1
                  sra          t2, t6, t1
                  fmul.s       ft1, fa0, fs2, rup
                  fmax.s       fs8, fs4, fs1
                  flt.s        t2, fa7, ft11
                  xori         a5, s10, 1286
                  feq.s        s0, fa1, fs8
                  andi         s9, t5, 414
                  nop
                  fmin.s       fa6, fs4, fs8
                  fmv.w.x      ft2, t5
                  lui          t0, 829924
                  fsqrt.s      fs8, ft2
                  remu         s4, s1, t4
                  feq.s        a7, fs4, ft8
                  fcvt.s.wu    fs6, sp
                  fmv.w.x      ft2, a7
                  fadd.s       ft9, ft4, ft11, rmm
                  feq.s        a7, ft4, fa0
                  sltiu        s8, s6, -102
                  srli         a3, s5, 1
                  flt.s        a7, fs9, fs1
                  fsqrt.s      fs0, fa0, rne
                  rem          s0, s3, sp
                  xor          s5, t6, s2
                  nop
                  sltu         s0, s3, s1
                  fmv.x.w      a6, fa5
                  remu         s9, s4, a4
                  ori          zero, ra, 2022
                  srli         ra, zero, 4
                  lui          s11, 783518
                  fadd.s       ft11, ft6, ft10
                  xor          a4, s9, a1
                  or           a1, t3, a2
                  fmax.s       ft11, ft9, fs10
                  feq.s        sp, ft8, ft8
                  slti         gp, s9, 1075
                  srli         t0, s11, 8
                  fsgnj.s      fa2, ft9, fs11
                  slti         a2, s6, 37
                  addi         s2, s10, -604
                  sra          a1, t3, s4
                  andi         s8, s11, -1745
                  srai         s4, t1, 27
                  fmin.s       fs0, fs10, fa2
                  rem          s4, s3, zero
                  fsqrt.s      fs3, fs7, rup
                  srai         s11, a4, 7
                  fsgnjn.s     ft9, fa5, fa4
                  fdiv.s       ft6, ft9, fs11
                  fadd.s       fs4, ft4, fs10, rdn
                  fadd.s       ft3, fs2, fs6, rup
                  andi         s3, s8, -212
                  rem          s9, t0, s11
                  slti         a2, a6, 1044
                  mulh         a3, a6, t5
                  slli         a2, s2, 12
                  fclass.s     s0, fa4
                  sub          zero, gp, t1
                  xor          t5, s7, s6
                  fmax.s       fs11, ft11, ft8
                  fmul.s       fs2, fs5, fa7
                  fle.s        zero, fs11, ft5
                  xor          s5, a7, a7
                  fcvt.wu.s    s10, ft11
                  mulh         a4, s9, t2
                  lui          ra, 5173
                  mul          t6, t6, t2
                  divu         zero, a0, tp
                  sltiu        s9, t4, 381
                  slti         s6, t0, -979
                  and          ra, s5, s4
                  srl          a7, gp, s8
                  or           s11, s10, sp
                  fsub.s       fa2, fs6, ft6, rne
                  slti         s1, a7, 546
                  srli         t0, s0, 22
                  andi         gp, s11, 879
                  fmv.x.w      a4, fa2
                  sll          s5, sp, zero
                  fmv.w.x      ft10, a1
                  slt          t3, s3, s7
                  ori          s4, a6, -1815
                  lui          t5, 356903
                  lui          a7, 951106
                  sub          s0, s10, t3
                  fcvt.s.w     ft0, s8, rup
                  and          s9, a6, s1
                  fsqrt.s      ft2, fs2, rup
                  sltiu        a2, tp, 1693
                  fcvt.s.w     ft6, tp, rdn
                  srl          s5, tp, a7
                  mulhsu       s4, a2, a5
                  fadd.s       fa7, fs11, fs5, rmm
                  xori         zero, s3, 1619
                  andi         t5, t4, 428
                  srai         ra, a2, 15
                  fsgnj.s      ft8, ft1, fs0
                  xori         a5, tp, -1160
                  fmv.x.w      a5, fs0
                  feq.s        sp, fa5, fs3
                  sltiu        s4, t5, 1666
                  addi         a4, sp, -1523
                  fsgnjn.s     fa1, fs7, fs10
                  or           t0, s4, a3
                  fmv.x.w      s3, fs1
                  sltiu        t5, s5, -208
                  srl          gp, a1, t3
                  fclass.s     ra, fs5
                  or           s2, a2, gp
                  auipc        s6, 51722
                  srl          sp, s9, a3
                  fle.s        s8, fs0, fs5
                  sltiu        t5, t4, 2007
                  fcvt.s.w     fa2, s11
                  fmul.s       fs2, fs3, fs10
                  addi         s10, a7, 1136
                  fmv.x.w      a7, fa6
                  fle.s        t2, fs11, fs7
                  mulhu        t2, a3, sp
                  fsgnjx.s     ft9, ft11, ft9
                  andi         t2, a3, -1505
                  sra          s2, s0, t0
                  fdiv.s       fs10, ft2, fs6
                  nop
                  mulhsu       a2, sp, a1
                  fmax.s       ft7, fs4, fs5
                  srai         zero, a6, 14
                  sub          sp, t0, s10
                  auipc        s7, 427456
                  fsgnjx.s     fa2, fa4, fs8
                  fdiv.s       fa1, ft2, fs1
                  fcvt.wu.s    s11, fs2, rtz
                  fcvt.wu.s    s11, fs10
                  or           s5, s9, s3
                  sra          s2, a6, a2
                  remu         t5, zero, gp
                  fsub.s       fa1, fs4, ft6, rup
                  fcvt.s.w     fs8, s8, rne
                  fmv.x.w      s2, fs6
                  sub          s9, t2, t1
                  srai         gp, s10, 12
                  fmin.s       fs6, fa6, fs0
                  or           s6, zero, t3
                  feq.s        gp, ft3, fa4
                  mulhu        a3, a6, gp
                  sra          s0, gp, tp
                  srai         s4, a1, 20
                  fsqrt.s      fs8, ft8
                  fsqrt.s      ft8, fs1
                  fmv.x.w      ra, ft6
                  srli         s2, a6, 0
                  fcvt.wu.s    s1, ft3
                  andi         s9, gp, -1828
                  sltiu        t6, a1, 411
                  sub          a7, a7, s1
                  fsgnj.s      fs0, ft6, fs6
                  fsgnj.s      fa5, fs10, fs11
                  srl          s0, t3, s4
                  slti         a2, t0, 1078
                  fmin.s       fs6, fs11, ft0
                  fcvt.s.wu    ft3, t1
                  mulh         a2, s5, t1
                  fdiv.s       fa7, fa4, fa1
                  fmax.s       fs2, fa6, ft2
                  fcvt.s.wu    ft10, tp, rdn
                  sltiu        ra, t6, 255
                  ori          t3, a2, -1565
                  srli         s10, ra, 5
                  fcvt.s.wu    ft10, a5, rmm
                  fclass.s     s4, ft6
                  fcvt.wu.s    t0, ft5
                  add          s2, s7, s5
                  add          t0, t0, a0
                  or           s4, sp, a2
                  fsgnjx.s     fa6, fs2, fs0
                  addi         a4, s1, 852
                  nop
                  addi         t6, a1, -948
                  fsgnjx.s     ft5, fa6, fa4
                  fsgnjx.s     fs2, ft9, ft9
                  fle.s        ra, ft11, fs11
                  mulh         t3, t5, t5
                  slt          zero, a7, s9
                  ori          s6, s10, 1903
                  srl          a1, a4, t3
                  slt          a7, a7, s10
                  and          s7, t0, s4
                  and          s9, s2, a4
                  fle.s        a0, fa5, ft0
                  fmv.x.w      s6, fs10
                  xor          zero, gp, s2
                  srai         s11, s3, 9
                  fle.s        s9, ft11, fs1
                  fmax.s       ft5, fs1, fa0
                  sltu         sp, sp, s4
                  fdiv.s       ft9, fa2, fa0
                  fdiv.s       ft9, ft10, ft3, rup
                  slti         a5, a6, 1002
                  fcvt.s.wu    ft4, a7, rne
                  srli         s9, zero, 1
                  srai         t6, a4, 1
                  fle.s        s2, fs10, fs5
                  ori          ra, s10, -1064
                  fsgnj.s      ft8, fs3, ft10
                  sltiu        t0, s9, 247
                  fsub.s       ft6, ft11, fa2, rup
                  fsub.s       ft10, ft2, fa2, rmm
                  mul          a1, s0, a0
                  srli         a1, sp, 16
                  slli         t5, s0, 25
                  fsub.s       ft7, fa1, fs2, rup
                  mulh         zero, a0, a2
                  mulhsu       zero, t3, a0
                  divu         t2, a2, t2
                  xori         a1, s5, -978
                  sltiu        s9, s5, 1833
                  fclass.s     s9, ft10
                  sra          a0, s10, t1
                  fdiv.s       fs6, ft4, fs0
                  mul          zero, a1, a7
                  fcvt.s.wu    fa2, s7
                  nop
                  sltu         s7, s10, gp
                  or           ra, sp, gp
                  mul          sp, tp, s4
                  and          t5, t2, a0
                  fsub.s       ft2, ft5, ft10
                  rem          sp, t4, s9
                  fle.s        s3, fa1, ft8
                  or           t0, t2, s6
                  nop
                  mul          s1, s6, a2
                  flt.s        a5, fa2, ft5
                  mulhu        zero, s2, s11
                  mul          sp, t1, t6
                  fadd.s       ft1, ft3, ft10, rup
                  sltiu        s6, t1, 210
                  add          t2, a5, s9
                  remu         s0, t4, sp
                  srai         t3, t4, 1
                  fsgnjn.s     fa2, ft4, fs1
                  fmv.x.w      a7, ft2
                  fmul.s       fa7, ft5, ft1, rne
                  fsgnj.s      ft4, fs9, ft0
                  sltu         s9, s8, ra
                  rem          a2, s2, a6
                  fcvt.wu.s    gp, ft0, rdn
                  addi         s4, s7, 318
                  sra          gp, a7, zero
                  mulhsu       s8, sp, s6
                  and          a7, s1, s3
                  fmax.s       ft10, fa3, fa2
                  fsub.s       fa5, fa0, fs11, rdn
                  slti         s7, s6, 859
                  fadd.s       fa3, fs4, fs0, rmm
                  add          zero, ra, t4
                  fsqrt.s      ft3, ft2
                  fmax.s       ft2, ft5, ft9
                  add          a7, s8, s0
                  fsgnjx.s     fa5, fa6, fa5
                  and          s7, s8, a0
                  sltu         s7, s9, s3
                  flt.s        s6, ft3, ft0
                  mulhsu       a7, t2, tp
                  fsqrt.s      fs4, fa2
                  fsub.s       fa3, ft1, fa7
                  remu         s5, a2, a6
                  fcvt.w.s     t2, ft3, rdn
                  mulh         a5, s3, s6
                  fmax.s       fa3, ft10, fs6
                  feq.s        s5, ft6, fs4
                  sltu         a4, sp, s10
                  slt          s5, s4, s10
                  fmul.s       fs11, fa7, ft1
                  auipc        s2, 17465
                  fmv.w.x      fs11, s10
                  slt          a4, a3, ra
                  fsgnjn.s     fs3, fs1, ft11
                  mulhsu       s1, a1, s0
                  fcvt.s.w     fa7, s4
                  slli         a7, t3, 5
                  mulhu        a5, s6, zero
                  auipc        s1, 421367
                  mulhsu       a4, ra, s0
                  or           s6, s5, t6
                  or           a1, t4, sp
                  ori          a4, sp, -716
                  andi         t5, gp, 297
                  slli         a6, s0, 29
                  srli         s5, t6, 7
                  fmv.x.w      t3, ft3
                  mulhsu       s7, a4, s9
                  slti         a4, ra, 1619
                  andi         a2, a0, -558
                  fdiv.s       fs1, ft6, fa4
                  feq.s        t3, fs5, fs2
                  slli         sp, zero, 12
                  sll          s6, t3, a5
                  srli         t5, s0, 26
                  fmax.s       fs6, fs9, fa5
                  rem          s8, s3, a1
                  mulhsu       t2, s8, zero
                  and          t3, a7, t0
                  xori         s2, a2, -1211
                  sra          a2, a7, s3
                  add          t6, a1, s11
                  fsgnjx.s     fs5, ft11, fs7
                  fsub.s       ft11, fs6, fs3, rtz
                  fsgnj.s      fa4, fs8, fs3
                  mul          s6, t6, a5
                  or           s9, a3, zero
                  fcvt.wu.s    zero, fs5, rtz
                  fcvt.s.w     fs0, a6, rmm
                  sra          a4, s7, a3
                  mul          sp, s7, t1
                  sra          a0, a1, t2
                  fadd.s       fa4, fs11, ft5
                  mul          t6, a3, a0
                  divu         s6, s1, s7
                  div          s8, s6, a2
                  slti         a1, t6, 1830
                  srli         a6, s4, 2
                  fsgnjx.s     ft7, ft3, ft8
                  fmul.s       ft7, fs3, ft5
                  div          zero, t5, s2
                  div          a4, s3, s1
                  andi         s8, t0, 95
                  slti         a4, a2, -1700
                  fmv.w.x      ft3, s9
                  rem          t0, gp, a3
                  fmv.w.x      fs7, t0
                  fclass.s     zero, fs9
                  sra          s9, s3, t4
                  srl          s7, s4, sp
                  remu         a5, sp, ra
                  remu         s9, s0, t2
                  fsqrt.s      ft11, ft1
                  slli         t5, s8, 31
                  sltiu        s7, s6, 1631
                  mulhsu       s5, s9, t0
                  srl          a7, t2, a6
                  addi         a1, t5, 234
                  fsqrt.s      fs9, fs1
                  slti         a4, t5, 298
                  slti         a3, t6, 1649
                  fmul.s       fa3, ft7, fa5, rmm
                  fcvt.wu.s    a7, ft4, rdn
                  fclass.s     a6, fs3
                  fle.s        s1, fs8, fs8
                  srli         s3, a3, 18
                  fsub.s       ft6, ft1, fa6, rne
                  remu         a2, s5, s3
                  mulhu        s0, s9, gp
                  srli         s11, t3, 31
                  fsgnj.s      ft10, fa7, fs1
                  add          s7, s2, ra
                  rem          ra, a1, s1
                  sra          s0, a5, a4
                  rem          zero, t3, t5
                  slti         t6, s2, 1032
                  feq.s        a3, ft10, ft7
                  fcvt.s.w     ft3, s5, rne
                  fclass.s     s2, ft0
                  sll          s8, s10, t5
                  addi         ra, s3, -1548
                  add          a7, s8, t1
                  andi         s8, s11, -1796
                  fsub.s       ft6, ft2, ft1
                  sub          a2, t2, s1
                  mul          zero, a6, s2
                  srai         zero, s7, 21
                  rem          t3, s8, t6
                  sub          t6, s10, a3
                  sub          s2, s9, s2
                  xori         t2, a4, 1255
                  mulhsu       a6, s6, sp
                  srli         a3, gp, 17
                  sub          a6, a3, s3
                  sub          zero, s5, ra
                  divu         a5, tp, s8
                  mulhsu       a4, ra, t0
                  fle.s        a7, ft0, fs2
                  fcvt.wu.s    s6, fs4
                  sub          s5, t5, t2
                  fsgnjx.s     fs9, fs4, ft0
                  fcvt.wu.s    a0, ft6
                  srai         s0, s10, 2
                  div          s0, s6, t1
                  mul          s6, a5, s1
                  fsub.s       ft6, ft0, ft11, rtz
                  fadd.s       ft7, ft10, fs10, rmm
                  mulhsu       s0, s5, s2
                  or           a3, t0, sp
                  fsgnjx.s     fa1, ft5, fa0
                  fsub.s       fa3, fs2, ft10
                  feq.s        a0, fa3, fs4
                  fcvt.wu.s    t0, ft6, rtz
                  feq.s        ra, fs8, fa0
                  mulhsu       s6, t0, s8
                  fsgnj.s      fs3, fa5, ft4
                  fclass.s     ra, fs7
                  fsqrt.s      ft6, fs0
                  srl          a4, t4, t6
                  slti         s7, t4, 1624
                  feq.s        gp, ft8, fs7
                  srai         t2, a2, 13
                  fclass.s     s0, ft6
                  div          s10, a1, a3
                  fmv.x.w      s8, fa7
                  fle.s        zero, fs8, fs8
                  fmv.w.x      ft9, s4
                  fmv.w.x      fa5, s5
                  remu         a2, ra, s5
                  remu         zero, a0, s0
                  fle.s        t2, fs4, fs8
                  lui          s0, 408006
                  mulhsu       t3, a4, s3
                  fmin.s       ft6, fs7, fs11
                  nop
                  fsgnjx.s     fs6, ft2, ft3
                  andi         a5, s3, 1939
                  addi         a5, a6, -1105
                  sll          a0, s6, s6
                  fdiv.s       fa4, ft8, fs0, rne
                  feq.s        s10, ft9, ft4
                  fcvt.s.w     fs7, zero
                  and          s4, a2, a0
                  fmv.x.w      s0, fa0
                  remu         t5, s0, t6
                  xori         s1, gp, -14
                  fcvt.wu.s    zero, fs7, rne
                  fcvt.s.wu    fa3, s7, rmm
                  fmin.s       fa6, ft11, fs10
                  sltu         a4, a3, s11
                  fmul.s       fs7, ft8, ft4
                  fcvt.wu.s    sp, fs1, rup
                  mulh         s2, s7, s3
                  fsgnj.s      ft3, fa5, fa2
                  fmv.x.w      t3, fa3
                  fsgnjx.s     fs4, ft7, ft10
                  fmv.w.x      ft4, a0
                  slli         s6, ra, 2
                  remu         t5, s6, s4
                  xori         gp, s6, -1598
                  xor          s9, t1, t6
                  fmul.s       fs4, fs10, fs8, rne
                  sll          sp, t2, ra
                  fsqrt.s      fs3, fs4, rdn
                  sll          s8, s0, s11
                  lui          a6, 158752
                  mulhsu       s4, ra, a3
                  nop
                  sltiu        t6, s4, -1137
                  fmv.w.x      fs5, s3
                  mulhsu       a3, s11, a4
                  rem          s9, s8, t2
                  slli         t5, s8, 17
                  fsgnjx.s     fs7, fs4, fa5
                  srl          s2, s0, a1
                  rem          a4, sp, s8
                  fcvt.s.wu    fs6, gp
                  rem          a7, a2, s0
                  fle.s        s6, fa5, ft7
                  slt          s10, a7, gp
                  fclass.s     s10, fa2
                  rem          s5, s0, tp
                  srl          t0, t6, s9
                  sltiu        s1, a2, -1131
                  fle.s        a2, fa4, ft8
                  rem          s10, t4, s2
                  mul          a6, s11, s7
                  fadd.s       fa0, fs0, fs4
                  fsgnjn.s     ft1, fs5, fs10
                  addi         s5, s0, 867
                  fclass.s     ra, fa2
                  fsqrt.s      fa3, ft6
                  slli         a4, s10, 7
                  fle.s        s11, fs10, ft1
                  fcvt.wu.s    a2, ft7, rmm
                  srai         s7, a7, 12
                  fdiv.s       ft4, fa4, ft0, rdn
                  flt.s        s11, ft8, fs7
                  fadd.s       ft5, fs1, fs11, rne
                  fmin.s       fs0, ft6, fa4
                  srli         a4, tp, 16
                  or           t5, a4, t5
                  xori         s8, t2, -1610
                  mulhu        t3, a4, t5
                  fle.s        s0, ft2, ft6
                  fdiv.s       ft1, fa7, fa7
                  flt.s        t6, fa5, fs1
                  lui          s5, 870915
                  sltu         s6, sp, t4
                  xori         s7, a6, -1810
                  mulhu        t6, t1, a5
                  auipc        s2, 579396
                  fsub.s       ft11, fs5, ft6
                  srai         s6, s2, 21
                  nop
                  sltu         s2, s8, t0
                  fcvt.s.w     fa3, s3
                  slli         a7, tp, 16
                  fcvt.w.s     ra, ft7
                  fle.s        s5, fa4, ft4
                  flt.s        a5, fs11, fs10
                  divu         a1, a3, zero
                  lui          a6, 552913
                  sra          s9, s0, s9
                  slli         a1, a2, 0
                  mulh         a2, sp, s10
                  xor          s3, s3, a6
                  fmv.x.w      s8, fs8
                  fmv.w.x      fs1, ra
                  fmax.s       fs0, fs11, fs6
                  sub          a1, s3, t4
                  fmul.s       fs0, ft10, fa1
                  sltiu        a7, s5, -1205
                  fsgnjx.s     fs9, ft3, fs11
                  srli         a3, s5, 1
                  add          s11, t2, s2
                  mulhsu       s3, s3, t4
                  fmin.s       fs11, fa2, fs1
                  xor          s10, tp, t2
                  add          a1, tp, s11
                  fdiv.s       fs0, fa5, ft5, rup
                  fsgnjn.s     ft0, ft0, fs4
                  fcvt.s.w     fa2, t3
                  xori         s1, t6, 354
                  fcvt.s.wu    fa3, zero
                  fsqrt.s      fs5, fs7
                  slt          s10, a5, zero
                  div          t6, s8, zero
                  srl          a7, t3, ra
                  fmin.s       ft7, ft10, ft4
                  lui          t0, 217079
                  mulh         a2, a7, zero
                  fmul.s       fs9, fs11, ft7, rdn
                  fmv.w.x      fs1, sp
                  fmv.w.x      fs8, a4
                  srli         zero, t5, 1
                  remu         t0, t1, s6
                  mul          s6, s11, a5
                  remu         a6, s9, s3
                  fclass.s     sp, fs8
                  feq.s        s7, ft1, ft1
                  sltu         t5, s8, a5
                  mulhu        s6, s4, a0
                  srli         s3, s4, 26
                  rem          t2, t3, t4
                  addi         s0, a3, 884
                  xor          a3, tp, a1
                  fsgnj.s      fs6, fs10, fs4
                  sltu         t5, s5, s8
                  xori         s1, s5, -1071
                  fsgnj.s      ft0, fs7, fa4
                  fcvt.w.s     s0, fa1, rup
                  auipc        a2, 209729
                  fdiv.s       fa7, ft9, fs5, rup
                  fsgnj.s      fs11, fs2, fa5
                  and          a3, s3, gp
                  slli         t2, a6, 5
                  or           s8, s8, a4
                  fle.s        zero, ft0, ft1
                  xor          ra, s11, sp
                  sub          a1, a4, t6
                  sltu         s1, s5, s11
                  fmv.w.x      fs2, s7
                  rem          ra, s4, a3
                  fmv.x.w      s4, ft9
                  flt.s        s10, fs9, fa5
                  rem          t3, t1, a4
                  sltiu        t6, s7, -2036
                  srli         s6, s10, 5
                  addi         ra, s11, -34
                  sub          t2, ra, gp
                  fclass.s     s10, fa5
                  xori         s3, tp, -253
                  sltiu        a6, sp, -1628
                  and          a3, t4, s10
                  fmax.s       fs5, ft8, fs11
                  feq.s        s1, ft10, fa3
                  remu         zero, t5, t3
                  fsub.s       fs7, ft1, fa0, rne
                  lui          t5, 513735
                  mulh         a2, a1, s1
                  or           zero, sp, t5
                  fsgnjn.s     fs11, fs10, fs1
                  sll          s4, s10, zero
                  fmv.x.w      a3, fs4
                  srl          s8, s4, gp
                  feq.s        s0, fs9, fs4
                  divu         t5, s10, s3
                  rem          a6, s3, t0
                  fsub.s       ft1, ft7, fs3
                  rem          t6, s4, sp
                  fmv.w.x      ft10, t1
                  and          s3, t6, a0
                  srl          t3, t3, s7
                  srai         s2, s9, 13
                  fle.s        s1, fa7, fa4
                  fsqrt.s      fa1, ft7
                  mulh         t0, s6, s5
                  fadd.s       fa3, ft11, fs8
                  lui          zero, 979570
                  lui          s1, 450671
                  fsgnj.s      fs6, ft10, ft9
                  sll          t2, s6, sp
                  slt          a5, a1, a6
                  fcvt.s.wu    fa1, s5, rtz
                  sra          a0, s10, s1
                  srai         a7, s4, 29
                  fsub.s       fs8, ft3, fs5, rtz
                  fsub.s       fs11, fs7, fa3, rne
                  fclass.s     s7, fs9
                  xori         a1, a2, -85
                  fadd.s       fs4, fa0, fs1, rtz
                  sub          a2, ra, a1
                  lui          s8, 694742
                  slli         a6, ra, 16
                  andi         s6, a1, -746
                  slli         a7, s10, 0
                  slt          a7, s4, t3
                  lui          s3, 98904
                  fsgnjn.s     ft7, fs0, fa7
                  or           gp, s3, a1
                  fcvt.w.s     t2, fs10, rtz
                  xor          s4, s0, a0
                  fsqrt.s      fs1, ft9, rup
                  andi         s7, s8, 1300
                  feq.s        t0, ft11, fa4
                  auipc        s0, 420684
                  xori         a5, t4, -1525
                  fclass.s     s9, fs0
                  fmin.s       ft3, ft4, ft0
                  slti         t5, s9, -1853
                  or           gp, sp, t5
                  mul          ra, s9, t2
                  slti         t6, a1, 1974
                  feq.s        a3, ft6, ft8
                  or           a4, a5, s10
                  fcvt.w.s     t2, ft0, rne
                  fcvt.w.s     zero, fs5
                  fsub.s       ft7, ft3, ft3
                  srai         a7, t5, 23
                  fsgnj.s      fs7, ft11, ft9
                  feq.s        s5, fa5, fa2
                  fmv.w.x      fs3, a6
                  sra          s9, a5, t6
                  div          a1, a7, s4
                  fcvt.s.w     ft0, a5
                  andi         s5, t5, -1019
                  addi         t6, s8, -1404
                  flt.s        s0, fa2, ft5
                  fadd.s       fa1, ft11, fs1, rmm
                  sltiu        sp, t6, -816
                  fmul.s       fs11, fs10, fs7
                  xor          s9, a7, t4
                  andi         t3, t6, -872
                  flt.s        gp, ft11, fa1
                  sltiu        a6, s4, -258
                  or           ra, a6, tp
                  addi         s10, a4, -248
                  nop
                  fsgnjn.s     fs10, fs7, ft11
                  sltu         t5, tp, s2
                  fmv.x.w      s9, ft7
                  fsub.s       fs5, ft2, fa2, rne
                  fsgnjn.s     fa3, fs0, fs8
                  or           s8, t5, a2
                  srli         s0, s4, 16
                  andi         s1, gp, 1057
                  addi         zero, gp, 2006
                  srli         zero, zero, 5
                  divu         a0, a4, a7
                  andi         a6, t3, 2003
                  slti         a2, a5, 325
                  fmv.w.x      ft0, s0
                  mulhu        a5, ra, ra
                  or           gp, gp, a0
                  feq.s        s7, fs11, fa5
                  feq.s        s7, ft5, ft8
                  fmul.s       ft8, fs7, ft1, rup
                  fsgnj.s      ft6, fs0, ft1
                  fmin.s       fa2, fa2, ft5
                  fmv.x.w      s8, fa7
                  srai         zero, a6, 18
                  fcvt.wu.s    s7, ft7
                  slli         s0, gp, 26
                  fmin.s       fa7, fa6, fa7
                  flt.s        a7, fa3, fa5
                  mulhsu       a1, tp, a4
                  fmin.s       ft8, ft7, fs2
                  ori          a7, s2, -92
                  ori          s11, zero, 741
                  fcvt.s.w     fs6, t6
                  flt.s        s10, fs4, ft7
                  fsgnj.s      fa3, fs7, ft1
                  fclass.s     t2, fs11
                  fcvt.s.w     fs1, a4, rdn
                  div          a5, s4, a7
                  nop
                  div          s2, s7, tp
                  andi         a4, s1, -1677
                  srl          s11, s3, s2
                  fle.s        t0, ft8, fa1
                  auipc        a6, 272981
                  srl          t6, s3, s7
                  ori          s11, s6, 1525
                  fsub.s       fs5, fs0, ft0
                  ori          s9, s7, -1086
                  mulh         s5, t2, a4
                  auipc        a6, 372987
                  fsgnjx.s     fa3, ft1, ft7
                  fsqrt.s      fs10, fa3, rdn
                  xor          a7, a5, s7
                  srai         s2, s2, 23
                  fle.s        a0, ft10, ft2
                  fmax.s       fs10, ft5, fs1
                  feq.s        s9, fs11, fs3
                  fcvt.s.wu    ft11, s11
                  fmin.s       fs1, ft8, fs2
                  addi         a7, a7, 1052
                  div          sp, s4, a4
                  slt          t2, s4, s7
                  slt          s0, s3, t1
                  srli         s5, gp, 22
                  sltiu        s2, sp, -368
                  fadd.s       fa1, ft8, ft1
                  fsqrt.s      fs0, ft11, rne
                  add          s9, s7, a1
                  div          a7, ra, s9
                  sll          s2, t2, s5
                  xori         t3, s7, 1669
                  mulh         s2, s0, s5
                  nop
                  auipc        sp, 1032350
                  mul          a0, a5, a2
                  rem          a4, s6, a5
                  sltu         a6, a1, s8
                  mulhu        a0, sp, a4
                  addi         sp, a2, 98
                  fcvt.w.s     s8, fa3
                  xori         s2, s7, 574
                  fmul.s       fa2, ft2, ft4, rtz
                  andi         s5, s1, -1853
                  divu         t2, s2, t4
                  rem          s9, zero, t5
                  fsqrt.s      fs9, fs0
                  fcvt.s.wu    fs6, ra, rup
                  fmin.s       ft5, fa5, fs10
                  sra          a1, t0, t0
                  fsgnj.s      ft7, fa2, fa7
                  andi         a5, a2, -1764
                  divu         a3, t1, s6
                  and          s2, s1, a0
                  fmax.s       fa7, ft5, fs1
                  sltu         a1, t2, s3
                  fcvt.s.w     fs4, t1, rup
                  fcvt.wu.s    ra, fa0
                  fcvt.s.w     ft9, s0, rmm
                  feq.s        a2, ft2, fs8
                  ori          zero, s9, -1709
                  lui          a4, 382428
                  remu         ra, ra, s6
                  feq.s        a7, fa3, ft1
                  div          gp, s10, s6
                  divu         gp, a3, s1
                  sll          s7, a3, t6
                  mulhu        s9, tp, sp
                  divu         t0, s6, t0
                  rem          s8, s0, s10
                  fsgnj.s      ft2, ft3, ft5
                  slt          s5, ra, ra
                  fsub.s       fs1, ft3, ft3
                  nop
                  fsgnjx.s     fa0, fa2, ft1
                  mulhu        s6, t0, zero
                  fdiv.s       fs8, fa5, ft11
                  mulhsu       a5, t2, a6
                  sltu         t5, t4, s6
                  fsqrt.s      fa6, ft11, rdn
                  fadd.s       ft9, ft6, ft6, rdn
                  mulh         ra, s6, t4
                  slli         s8, a3, 10
                  fle.s        t0, ft11, ft1
                  fadd.s       fa3, fa0, fs11, rne
                  and          a5, s8, s3
                  xor          t2, s1, s11
                  ori          s1, s9, -1295
                  fsqrt.s      ft7, fs7
                  addi         s1, zero, -409
                  mulhu        s8, s9, t5
                  feq.s        a2, fs7, fs8
                  and          t5, s3, a2
                  addi         a6, s0, -663
                  mul          ra, t4, zero
                  mul          a7, a2, a6
                  fcvt.s.w     ft4, ra, rtz
                  mul          sp, s10, a6
                  fmv.w.x      fa0, gp
                  fsqrt.s      fa7, ft2, rne
                  fmv.w.x      fs9, t5
                  sub          s8, s9, s10
                  fcvt.w.s     a3, fs0, rtz
                  sra          a0, s10, s8
                  fmin.s       fs4, fs10, ft4
                  srl          s5, t4, a0
                  srli         sp, a3, 19
                  fmax.s       fa6, ft2, fs2
                  srli         s3, s3, 1
                  fsqrt.s      fa4, ft11, rdn
                  fsgnj.s      fa7, ft0, ft2
                  div          ra, t4, s0
                  fcvt.s.wu    fa5, zero, rdn
                  fdiv.s       fa0, fa7, fa5, rne
                  fmv.x.w      a3, fs7
                  srai         s7, a0, 23
                  srli         a3, s8, 22
                  mulh         s5, s10, a6
                  nop
                  sub          s0, s4, s6
                  fcvt.w.s     s6, fa2, rdn
                  slli         s11, a6, 28
                  fclass.s     s2, ft0
                  slli         s10, s11, 30
                  sltu         gp, t0, t2
                  fmv.w.x      fa3, s5
                  fdiv.s       fs4, fs8, fs1
                  mul          s7, tp, gp
                  flt.s        s2, ft4, fs0
                  nop
                  fdiv.s       fa0, fa2, ft2
                  fmul.s       fs9, ft9, fa6
                  fle.s        a0, ft5, fa0
                  slt          a1, a7, a6
                  sra          a7, t4, t1
                  rem          s8, tp, a7
                  mulh         s11, s4, t3
                  fsub.s       fa6, fs7, fs8, rtz
                  mul          t5, gp, tp
                  xori         sp, a6, -614
                  fmax.s       fs11, fs4, fs11
                  fcvt.s.wu    fs8, a3, rne
                  sra          s10, t4, s0
                  add          t3, t2, s9
                  fcvt.s.w     fa1, t6
                  xor          s5, sp, s3
                  slti         s2, zero, 432
                  ori          s1, s8, -882
                  sra          sp, t4, s9
                  fmv.w.x      fs1, s10
                  and          a0, a0, t2
                  fle.s        s2, fs10, fs3
                  fmin.s       fa3, fa7, fs3
                  fmin.s       fa0, fs6, fs10
                  mulh         a7, s8, t5
                  sub          a0, s4, gp
                  fmv.x.w      s3, fs5
                  fcvt.s.w     fa4, a6
                  andi         s2, t2, 280
                  fsgnjx.s     ft11, fs2, fs5
                  mulhu        ra, s5, gp
                  fsgnjn.s     fs5, fa7, fs9
                  fcvt.wu.s    a0, ft1, rtz
                  srai         t3, a3, 5
                  fmin.s       fa0, fs7, fa7
                  fcvt.wu.s    s3, fa4, rtz
                  mulhu        a1, a3, a5
                  xori         zero, zero, 1207
                  fcvt.wu.s    a2, ft1
                  fle.s        a3, fa3, fa7
                  feq.s        sp, fa6, ft11
                  xori         s8, s8, -1257
                  slti         gp, s5, 1017
                  srai         s10, s7, 1
                  feq.s        s0, fs2, fs0
                  rem          t2, t1, s7
                  fsub.s       fs1, ft9, ft10
                  fclass.s     s7, fa2
                  sub          a5, s9, sp
                  add          t5, tp, a3
                  fsgnj.s      ft5, fs3, fa5
                  fcvt.w.s     a2, fs10, rtz
                  rem          s10, t0, a5
                  xor          t2, a7, s0
                  fmul.s       ft10, fs1, fa5, rup
                  mulhsu       a1, s10, s0
                  xori         s6, a7, 659
                  fsqrt.s      ft3, fa2
                  fsgnjx.s     fa7, ft5, ft4
                  fmul.s       fs5, fs3, ft0, rne
                  fsgnjx.s     fs2, fa7, fs3
                  fmv.w.x      ft6, t3
                  slli         a0, sp, 8
                  fmv.w.x      ft1, s7
                  fsub.s       fs8, fs4, fs7, rne
                  feq.s        a1, fs2, ft0
                  fsgnjn.s     fa0, fs4, fs7
                  feq.s        gp, fs7, fa7
                  fmv.x.w      t2, fa4
                  div          t5, s6, s3
                  auipc        a4, 458434
                  remu         zero, a6, s1
                  feq.s        a2, fs11, ft5
                  srli         ra, a5, 22
                  fclass.s     s10, ft10
                  fmul.s       ft3, fa0, fs8, rup
                  nop
                  fcvt.w.s     s1, ft9, rne
                  fclass.s     t5, fs4
                  add          s9, sp, s4
                  slti         s1, s11, 1782
                  fmul.s       fa0, ft8, ft11, rdn
                  xor          zero, a0, tp
                  fmax.s       ft2, ft11, fa1
                  slli         a3, s4, 17
                  fmin.s       fs7, ft11, fa3
                  fmv.x.w      t3, ft1
                  lui          a4, 29134
                  fsub.s       fs7, ft5, ft8
                  fdiv.s       fs9, ft9, fa0
                  auipc        a2, 150442
                  fdiv.s       fa4, fa6, fs10
                  remu         s4, s3, sp
                  fdiv.s       ft7, ft2, ft1, rup
                  srl          sp, s10, s1
                  fsub.s       fs6, ft11, fa7, rtz
                  slli         s5, s7, 4
                  mulh         s1, s7, s10
                  slt          a0, tp, zero
                  slli         sp, s4, 27
                  ori          gp, a7, -1158
                  fle.s        s10, fs3, fa4
                  divu         ra, t1, a0
                  andi         s10, t5, -616
                  fdiv.s       ft8, ft9, ft10
                  feq.s        a3, fa6, fs2
                  slti         s9, a5, -400
                  ori          s8, s9, 1341
                  fmul.s       fs4, fa6, fs6, rup
                  ori          t0, s8, 459
                  fcvt.s.wu    fs6, t0, rdn
                  fsub.s       ft11, fa1, fs10, rup
                  fle.s        a2, ft10, ft10
                  slli         a4, tp, 31
                  sub          sp, a3, t4
                  feq.s        t6, ft5, fa5
                  sll          s6, a4, zero
                  fsgnjx.s     fa0, fs9, fa2
                  fsgnjn.s     fs0, fs11, fa3
                  fmv.x.w      t0, fs2
                  sltu         a7, a0, a3
                  sll          s7, a6, t3
                  sll          s1, a0, a6
                  div          s0, s3, t6
                  fsub.s       fa1, fs1, ft1, rup
                  rem          a0, s9, a3
                  fle.s        t6, ft0, fa3
                  slli         a2, a3, 1
                  rem          a0, s10, t4
                  sra          s4, a7, tp
                  auipc        s3, 91123
                  mulhu        a5, ra, gp
                  fcvt.wu.s    zero, fa2, rdn
                  xor          t2, s8, a6
                  slli         s4, s0, 18
                  fclass.s     t3, fs9
                  rem          s9, s4, t0
                  fsgnjx.s     fa2, fs1, fa6
                  mulhu        t6, a5, t4
                  srli         t0, s3, 22
                  fmv.x.w      s3, fa6
                  fdiv.s       fs2, fa5, fa4, rtz
                  fsub.s       fs2, fs7, fs5
                  xor          s7, a2, a5
                  auipc        s8, 429204
                  fcvt.w.s     a5, ft2
                  srl          s10, s3, s11
                  fmv.x.w      t5, fs3
                  sub          s11, s11, a2
                  sltu         s6, a0, a6
                  fmv.w.x      fs5, s11
                  sltiu        t2, t5, -22
                  fsgnjx.s     fs2, fa5, fa7
                  slt          s7, a2, a7
                  xor          s1, s3, t4
                  fsgnj.s      ft1, fa3, fa0
                  sra          t6, t6, s2
                  sra          s10, t0, s1
                  srli         s0, s7, 16
                  feq.s        s7, fs0, fa7
                  sll          a3, a6, s1
                  mulhsu       gp, s7, s10
                  or           s10, t6, s4
                  srai         s10, a6, 9
                  srl          t5, a0, a1
                  fle.s        a3, ft9, fa7
                  fclass.s     s1, fa7
                  fcvt.w.s     gp, fs1, rtz
                  fsub.s       fs8, ft1, ft2
                  andi         s10, t1, -336
                  sub          ra, a1, a0
                  xori         a0, t6, 1218
                  addi         s7, s3, 1343
                  remu         s8, t4, a5
                  sltiu        s11, s0, -1215
                  divu         s8, a3, t0
                  mulhu        t2, a4, s3
                  slt          s10, s9, sp
                  sltiu        gp, gp, -841
                  fle.s        s1, fs1, fa2
                  sltiu        s3, t6, 1641
                  sll          s9, a7, t4
                  lui          zero, 608255
                  srai         t5, a1, 7
                  rem          t6, s7, t2
                  sll          a5, s8, gp
                  divu         ra, a4, s8
                  sll          s4, t0, s1
                  fsqrt.s      ft3, ft8, rup
                  fmv.w.x      fa6, a2
                  and          s4, t3, s0
                  fle.s        t3, fs2, fs8
                  nop
                  fmin.s       ft10, fa7, fs2
                  fadd.s       fs4, ft8, fs3, rne
                  ori          s7, s11, 1936
                  fsgnjn.s     ft7, fs8, fa5
                  srli         t3, s2, 29
                  xori         t0, s3, 333
                  div          zero, gp, t4
                  andi         a4, a0, -903
                  mul          zero, a2, a0
                  fclass.s     a6, fs0
                  mulhsu       ra, t2, a2
                  srli         s10, gp, 4
                  mulhsu       t5, t0, s11
                  fcvt.s.w     fa6, a2, rmm
                  fmv.x.w      s5, fa5
                  auipc        s8, 1033559
                  fsqrt.s      ft7, fs0, rne
                  fmv.w.x      ft4, a6
                  fsgnjx.s     fs7, fs10, ft10
                  fclass.s     sp, fa3
                  fmin.s       fs7, fs9, fa7
                  remu         ra, ra, s7
                  fsgnjn.s     fs8, ft9, ft7
                  fle.s        a1, fa1, fs0
                  fdiv.s       fa3, ft6, ft4, rup
                  mulhu        zero, s9, a0
                  slt          t5, s2, s8
                  fmax.s       ft7, ft4, ft4
                  or           sp, a0, s3
                  mul          s8, s3, t4
                  and          a6, s2, s4
                  fmin.s       ft0, fa3, fs7
                  andi         a1, t5, -750
                  mulhsu       gp, a0, s11
                  feq.s        s5, fs4, ft9
                  srai         a1, s5, 26
                  and          s6, s11, s1
                  and          a1, t4, s0
                  sltu         zero, t2, a4
                  fsgnjx.s     ft9, fs6, fs7
                  fcvt.wu.s    s4, fa2
                  fsub.s       fs10, ft5, ft5, rdn
                  fsqrt.s      ft11, ft3, rtz
                  and          gp, s7, t5
                  sltu         a5, t3, s8
                  fmv.x.w      s3, fs11
                  sub          t2, ra, s8
                  add          a7, a5, zero
                  fcvt.s.wu    fs9, a0, rdn
                  addi         a1, a5, -1586
                  fle.s        t5, fa2, ft8
                  fadd.s       fs4, fa3, fa0
                  add          s7, t2, s2
                  fsgnj.s      fa1, fs4, fa3
                  xor          s11, gp, t0
                  fmul.s       fs0, fa7, fs1
                  slti         s5, a3, -476
                  nop
                  xor          a3, sp, s10
                  lui          a1, 671336
                  nop
                  andi         t3, s4, 395
                  fmv.x.w      ra, fs0
                  fsqrt.s      fs11, fa1, rtz
                  lui          t2, 476031
                  fsub.s       ft2, fs3, ft4
                  fcvt.s.wu    fs3, t1, rne
                  fsgnjx.s     fa7, fs1, fa6
                  fcvt.s.wu    fs3, s10, rdn
                  sra          gp, t3, a4
                  sltu         t6, a6, s2
                  addi         s4, a2, 114
                  ori          s9, t5, 566
                  fmv.x.w      ra, ft5
                  srai         s3, s3, 10
                  fcvt.s.w     fs5, s9, rdn
                  srli         s8, t0, 23
                  andi         t2, a3, -2006
                  xor          s0, a2, zero
                  fdiv.s       ft10, fs5, fa2
                  fclass.s     gp, fs2
                  sll          s10, tp, t5
                  feq.s        a5, ft2, fs1
                  addi         t2, t1, -639
                  fsqrt.s      fs6, fs0
                  fsgnj.s      fs2, fs3, fa3
                  slti         s2, s5, 49
                  slli         zero, t1, 3
                  srl          s4, s11, t2
                  slti         t6, a2, 1456
                  fmax.s       fa6, fs6, fs9
                  fcvt.w.s     gp, fs1
                  addi         s3, sp, -1821
                  fcvt.w.s     sp, fa5
                  fsgnjn.s     fa2, ft11, ft1
                  ori          s2, s8, 718
                  rem          a6, t2, s0
                  srli         a0, s6, 29
                  srai         a5, ra, 17
                  auipc        t3, 707227
                  fclass.s     s9, fa5
                  mulh         s9, zero, s9
                  fcvt.s.w     fs8, a4
                  addi         t5, t0, 165
                  xor          a2, s10, tp
                  fclass.s     zero, fs10
                  fclass.s     t2, ft10
                  fcvt.s.wu    fa7, gp, rne
                  and          t2, s1, a1
                  fadd.s       ft3, fs5, fs10
                  fmax.s       fa3, fs7, ft2
                  srl          s3, a4, s4
                  fclass.s     s6, fa3
                  feq.s        s3, ft3, fs9
                  fle.s        gp, fs9, fa4
                  sll          a1, s10, t2
                  fsgnjx.s     fa6, fs10, ft9
                  lui          a0, 653630
                  fmv.w.x      ft2, a3
                  srli         a5, a0, 25
                  slti         ra, s11, 776
                  fsgnjn.s     fs0, fa1, fs10
                  fmv.x.w      t3, fs3
                  ori          a6, gp, -1736
                  fclass.s     sp, ft5
                  fmv.x.w      a5, fs1
                  ori          a3, s8, -2033
                  fmax.s       fs8, ft9, fs3
                  fcvt.wu.s    s1, fs11
                  rem          zero, s3, s3
                  sub          gp, a2, s1
                  srl          s7, zero, t6
                  fsgnjn.s     fs5, fa2, ft3
                  slt          s5, tp, t2
                  xor          s3, t4, tp
                  fle.s        s11, ft2, ft3
                  fclass.s     t2, fa6
                  xori         sp, t4, 610
                  ori          s3, s10, -1774
                  addi         t0, s1, 790
                  auipc        gp, 684084
                  fmin.s       ft3, fs6, ft7
                  fdiv.s       ft4, ft10, fa2, rdn
                  flt.s        s0, fs1, fa0
                  rem          zero, t5, s4
                  andi         s5, a3, 439
                  rem          gp, t4, s7
                  mul          s10, t1, s1
                  sra          s5, t1, s2
                  mulhu        ra, s10, s9
                  fsqrt.s      fs8, ft5
                  fsgnjn.s     fa4, ft8, fs7
                  nop
                  remu         t0, s0, a0
                  xor          t2, s0, s5
                  mulhsu       ra, a0, s9
                  mulh         s8, a2, s0
                  fmv.x.w      s0, fa0
                  srai         a5, t4, 20
                  lui          a6, 640714
                  addi         s1, s11, 1164
                  fmv.w.x      fs0, t0
                  fsub.s       fs9, fs3, ft10
                  feq.s        a3, fs0, ft8
                  andi         gp, a5, 346
                  auipc        a4, 51458
                  fmv.x.w      a1, fa2
                  lui          zero, 666417
                  srl          s9, a7, t6
                  fcvt.s.w     ft9, zero
                  fmin.s       fa4, fa3, fs9
                  slt          s11, a5, s7
                  fcvt.s.wu    fs10, s11, rup
                  xor          t5, t3, s1
                  andi         a2, t0, -1552
                  add          a6, gp, s9
                  add          s6, s5, s2
                  fclass.s     a2, ft9
                  nop
                  andi         s1, t1, 942
                  fcvt.wu.s    a5, fa3, rmm
                  auipc        t0, 452361
                  fsgnjn.s     ft7, fa1, ft1
                  fsgnjn.s     ft2, ft9, fs11
                  fmul.s       fs2, fa6, ft8, rmm
                  fdiv.s       fa4, fs2, ft10
                  or           s3, a7, s5
                  fmv.x.w      s3, fs8
                  rem          a3, zero, s2
                  divu         gp, s11, t4
                  nop
                  srl          s9, s6, s2
                  xori         t2, a6, 405
                  nop
                  fcvt.s.w     ft0, a7
                  fcvt.s.w     ft8, s1, rup
                  auipc        t6, 704641
                  fcvt.w.s     s9, fa6, rne
                  fmax.s       ft8, fa1, ft4
                  fmv.x.w      sp, fa1
                  fdiv.s       fs5, ft0, fs6
                  xor          s9, a2, a2
                  sub          s11, s2, a1
                  srai         a0, s7, 17
                  and          t3, t4, ra
                  slti         t0, t3, -862
                  sltu         gp, t4, a6
                  fsgnjx.s     ft7, fs0, fs2
                  srai         ra, a5, 8
                  fsgnjx.s     fs6, ft5, fa1
                  mulh         s3, a7, t5
                  feq.s        a3, fs1, ft9
                  fcvt.s.wu    fa7, t5, rne
                  and          s6, s6, sp
                  andi         zero, s4, -1475
                  mulh         s4, sp, gp
                  fmv.x.w      sp, ft6
                  fcvt.s.wu    fs11, s11, rdn
                  fmul.s       fa6, fa7, fa0, rdn
                  ori          s11, t2, 95
                  xori         a7, t3, -122
                  fsgnjn.s     fs1, fs7, fs5
                  addi         s10, s8, -117
                  mulhsu       a1, zero, t4
                  add          s3, a1, a2
                  mulh         s4, t3, s5
                  remu         s11, s11, zero
                  slt          a5, s0, t0
                  flt.s        s10, fs5, fa6
                  fle.s        zero, fs9, ft6
                  remu         s5, tp, t4
                  fmul.s       fa3, fs8, fs0
                  auipc        s0, 291959
                  mul          s0, s7, t4
                  fsgnjn.s     ft4, fs4, ft0
                  add          t3, a4, s4
                  remu         a7, a7, s0
                  add          s9, a3, s11
                  fsgnjn.s     fs7, fs8, fs3
                  mulhu        s2, a5, s2
                  srl          s0, t0, s4
                  mulh         a3, gp, t5
                  xori         t5, zero, -495
                  remu         s5, a4, t0
                  div          s3, t2, a5
                  div          sp, s7, tp
                  mulhu        s11, s8, t1
                  mulhsu       s11, a0, s6
                  div          a0, s4, t1
                  fmax.s       ft7, ft8, fs10
                  addi         s8, t4, 685
                  div          s0, s8, s3
                  addi         t6, s7, -1448
                  fcvt.s.wu    fs2, s7
                  feq.s        a6, ft9, ft1
                  rem          s9, t0, t0
                  mulhsu       gp, s1, t3
                  mulhu        t0, a0, gp
                  srl          zero, s8, s4
                  fcvt.s.wu    fs11, s9
                  feq.s        sp, fs9, ft11
                  and          s5, s9, a1
                  sll          a5, a4, s9
                  ori          a3, a1, 1786
                  fmv.w.x      fs7, a6
                  mulhsu       sp, ra, t1
                  fmul.s       fs6, fs10, fs5
                  srai         zero, s10, 14
                  slt          gp, t6, a5
                  sub          t2, s6, a2
                  mul          t5, t6, a3
                  divu         s0, s11, s5
                  slt          s0, s4, ra
                  divu         a0, zero, s9
                  slli         ra, s11, 29
                  sra          a2, gp, s1
                  srai         s1, s6, 28
                  xor          s10, t0, s8
                  fmin.s       ft7, ft3, fs6
                  mul          s2, tp, t6
                  srai         t5, a4, 10
                  sub          a6, t4, t4
                  remu         a7, s9, t5
                  fcvt.w.s     s8, ft5
                  mulhu        s4, t2, a7
                  mulh         s2, a5, s9
                  andi         gp, t0, 118
                  mulh         t6, a1, a1
                  mulh         s1, s7, s3
                  divu         t2, zero, tp
                  sltiu        s7, t2, 910
                  div          s2, zero, t2
                  mulhsu       sp, t5, a4
                  xori         s11, s1, 906
                  fmul.s       fs1, fs4, ft3
                  fadd.s       ft5, ft3, ft2, rtz
                  sra          gp, zero, s9
                  remu         s9, t2, a0
                  fmul.s       ft11, ft10, ft11, rtz
                  xori         t6, a5, -1184
                  slli         a4, t2, 29
                  addi         a7, a3, -759
                  fmin.s       fa4, fa1, fs9
                  remu         a2, s11, s6
                  fsgnjx.s     fa0, ft9, ft1
                  fcvt.wu.s    t3, ft3, rup
                  srai         s10, a7, 4
                  slti         a2, s6, -225
                  fmin.s       fs8, ft0, fa3
                  rem          s11, s2, t6
                  srl          t2, s0, a6
                  srl          s4, s0, a4
                  flt.s        a6, fs11, fa2
                  fsgnjn.s     fs2, fs5, fa0
                  srli         s1, a1, 20
                  xor          s0, a1, s9
                  add          s2, a7, t3
                  divu         a7, t5, s3
                  fcvt.s.w     ft1, t0, rtz
                  fsub.s       fs4, fs1, ft11, rup
                  auipc        s1, 533196
                  sub          s3, zero, s4
                  feq.s        a1, fs7, fa5
                  mul          gp, a5, t4
                  addi         a3, s6, 1711
                  fsgnj.s      ft10, fs3, fs2
                  addi         s6, s5, 1342
                  ori          a3, s11, -1755
                  slti         t2, a1, -1343
                  sltiu        s3, t4, 96
                  divu         s8, gp, t6
                  lui          s0, 125709
                  xor          a6, t1, s0
                  fmv.x.w      a5, fa5
                  and          a1, a6, a6
                  lui          a6, 392088
                  srai         s2, a7, 0
                  nop
                  fmv.w.x      ft7, t2
                  sltiu        a7, t2, 545
                  mulhsu       s4, s4, a1
                  sll          s9, tp, tp
                  auipc        a6, 634932
                  fmin.s       fs1, ft3, fa0
                  xori         gp, s1, 1933
                  slli         s8, a7, 12
                  fadd.s       fs8, fs11, fa6, rtz
                  and          t2, sp, t3
                  fsgnjx.s     fa2, ft5, fa1
                  fmax.s       fa2, fs7, fs7
                  fclass.s     s0, fa0
                  andi         s9, s2, 243
                  fdiv.s       ft9, fs8, fs10
                  mulh         a2, s8, s8
                  mul          s10, s8, a1
                  xor          s0, s2, zero
                  fcvt.s.w     fs2, tp
                  slti         t3, a3, 1965
                  and          a4, s1, s11
                  fmv.w.x      ft0, s0
                  feq.s        a7, fs8, fa0
                  fsgnjn.s     ft3, fa6, ft4
                  fcvt.w.s     a4, ft3
                  slti         s1, t4, -1414
                  fmax.s       fs8, ft4, fs10
                  rem          t0, a3, s3
                  ori          s0, s5, -940
                  sltiu        ra, t0, 1349
                  fle.s        a5, fa7, fs1
                  divu         a3, tp, a0
                  lui          s0, 322704
                  fsub.s       ft2, ft11, fs7, rmm
                  slt          t6, s6, s9
                  ori          a2, a6, -1568
                  fsub.s       ft0, fs6, fa0, rup
                  fclass.s     s0, ft8
                  sltu         s11, t5, s0
                  sra          t5, sp, gp
                  fadd.s       fa7, ft5, ft5, rtz
                  add          s2, a0, a1
                  flt.s        t5, fs5, ft2
                  slti         a7, t4, -2036
                  fmv.x.w      a1, fs9
                  xori         gp, zero, 878
                  slti         s9, s0, 1309
                  fdiv.s       ft10, fa4, ft2, rtz
                  fsub.s       ft0, fs0, ft7
                  or           t5, t4, s6
                  or           t5, s8, s8
                  slt          sp, a5, t3
                  fadd.s       ft7, ft6, fs7
                  fsgnjn.s     fa3, fa7, fs11
                  fsgnjn.s     ft0, fa0, ft4
                  flt.s        t2, fs10, fs6
                  fmax.s       fa1, fs9, fs4
                  andi         s2, s4, -451
                  rem          a1, s7, gp
                  div          s6, a6, s4
                  andi         ra, t4, -1680
                  fmul.s       ft1, fs10, ft5
                  srai         ra, t2, 26
                  feq.s        a6, fa7, ft3
                  nop
                  srl          a5, s1, s8
                  nop
                  addi         s5, a2, -1744
                  fsub.s       ft2, fa7, fa6
                  fclass.s     sp, ft0
                  fle.s        a3, fs10, ft8
                  mulhsu       s1, s6, s11
                  remu         s6, s8, s5
                  slti         s5, gp, 1954
                  fcvt.s.w     fa7, a7, rmm
                  fmv.x.w      zero, fa5
                  mul          zero, s10, s9
                  divu         a5, t3, s0
                  fmax.s       ft7, ft10, fs11
                  fmin.s       fs3, ft2, ft8
                  rem          s3, s7, gp
                  mulhu        s0, gp, s1
                  fsub.s       fs6, fa2, ft8, rne
                  mulhsu       s3, a7, a4
                  sll          a2, tp, a3
                  sll          a5, t2, t6
                  fle.s        s10, ft2, fa4
                  mulhsu       a1, gp, a2
                  sll          s11, t0, s8
                  fcvt.s.wu    ft4, s0, rmm
                  sltiu        a5, s11, -1512
                  fmv.w.x      fa4, s11
                  mul          s5, a0, a5
                  fmul.s       ft9, ft3, fs0
                  rem          a7, s8, sp
                  srai         zero, s11, 13
                  xori         s1, a7, -959
                  auipc        a4, 201955
                  fle.s        s1, ft10, fs1
                  fsgnjn.s     ft5, fs2, fa0
                  mulhsu       gp, a3, a2
                  auipc        a3, 142521
                  fclass.s     zero, fs1
                  lui          zero, 753939
                  nop
                  remu         s10, s0, t4
                  andi         a0, a7, 1421
                  flt.s        t6, fa5, ft6
                  fsgnjn.s     ft3, ft6, fa7
                  ori          s6, t5, 426
                  flt.s        sp, fa1, fs4
                  xori         s7, tp, 440
                  xori         s0, sp, 900
                  sub          a6, a6, t2
                  flt.s        t0, fs1, fa2
                  addi         s4, s7, 1792
                  sub          s4, s3, a2
                  mul          s8, s9, gp
                  srl          s4, a0, sp
                  andi         a6, t6, -2016
                  slli         s9, s0, 1
                  div          t3, a7, s11
                  lui          sp, 517871
                  slt          s3, gp, a1
                  fdiv.s       fa6, fs10, fs7, rdn
                  fmin.s       ft9, fs9, fs5
                  auipc        a6, 470703
                  sra          ra, a6, a4
                  xor          s6, s0, s1
                  divu         t5, s11, zero
                  sra          s9, s7, a6
                  srai         t2, sp, 15
                  mul          s1, t2, s5
                  fclass.s     s1, fs11
                  nop
                  fmv.x.w      t0, ft11
                  sra          a7, s7, a7
                  slt          t2, s4, gp
                  fcvt.s.wu    ft3, a3
                  fdiv.s       ft11, fs11, ft2
                  fle.s        a4, ft10, fa5
                  and          a2, s0, s6
                  srli         a5, a0, 27
                  fclass.s     t0, ft0
                  remu         a6, a5, a0
                  divu         t0, gp, t6
                  remu         s7, a0, a3
                  fdiv.s       ft7, fa3, fs6, rdn
                  divu         s11, zero, t1
                  fmul.s       fa7, fs0, fa5
                  fclass.s     a2, fa2
                  mul          s11, t1, t4
                  mulh         a3, s4, s5
                  fmax.s       fs8, ft10, fa3
                  divu         ra, s3, s3
                  addi         ra, t2, -1039
                  or           a3, a0, s10
                  mulh         s3, t5, s7
                  remu         zero, t3, t1
                  rem          s5, s3, t1
                  remu         s0, s9, gp
                  mul          s1, s3, tp
                  fclass.s     gp, ft11
                  srl          s1, a5, sp
                  addi         t5, s2, 1541
                  sll          s9, t1, gp
                  sub          s1, a6, s6
                  fmax.s       fs11, fa7, ft7
                  fcvt.w.s     s2, ft5
                  ori          s8, a2, 487
                  srli         s0, a0, 1
                  auipc        t6, 939556
                  slli         s4, s10, 4
                  slti         t2, s3, 737
                  fmv.x.w      a7, ft7
                  fsqrt.s      fa2, ft0, rdn
                  fle.s        a4, fa1, fs9
                  mulhu        a0, s5, a0
                  sltu         t6, a0, t6
                  fadd.s       ft6, ft6, fs7, rmm
                  fmv.w.x      fs0, ra
                  rem          a3, t0, zero
                  fmv.w.x      ft7, a4
                  xor          t2, s0, sp
                  srl          t3, a5, a1
                  slti         s7, a2, 935
                  fsub.s       fs4, ft2, fa0, rup
                  mulhsu       s5, s7, s10
                  fle.s        t0, fa0, fs2
                  nop
                  feq.s        s3, ft5, fs8
                  fsgnj.s      ft11, fa5, fs0
                  srai         s8, s7, 22
                  fclass.s     t2, fa6
                  rem          zero, a3, s5
                  sltiu        t3, a1, -1020
                  mulh         s6, zero, a2
                  srli         s10, a6, 12
                  srai         zero, s3, 31
                  fsub.s       ft6, fa2, ft10, rtz
                  remu         t6, a1, zero
                  divu         s10, ra, a1
                  fle.s        s7, ft8, ft5
                  slt          a6, t6, sp
                  ori          s0, zero, -383
                  sra          s0, ra, zero
                  sll          ra, a0, tp
                  fcvt.wu.s    s4, ft7, rne
                  sub          a4, s7, sp
                  rem          s2, t1, t2
                  nop
                  xori         t2, s3, 1180
                  fsqrt.s      fs0, fs0, rtz
                  sll          s2, gp, s8
                  sra          s5, zero, t3
                  auipc        gp, 940301
                  fdiv.s       ft10, fa1, ft7, rtz
                  slli         ra, s7, 9
                  auipc        s4, 69134
                  sltu         s4, t2, tp
                  fadd.s       fs5, fs2, ft0
                  addi         a0, s5, 313
                  sltiu        t6, a4, -1005
                  mulhsu       a7, t6, s9
                  flt.s        gp, fs0, ft6
                  sra          zero, gp, s4
                  slt          zero, t5, a0
                  fsub.s       fs2, fs11, fa2
                  fcvt.w.s     a4, fs9
                  ori          sp, s5, -1306
                  fmv.w.x      ft5, s1
                  xori         t2, t1, -1335
                  mulhsu       a4, a3, a0
                  feq.s        gp, ft4, ft1
                  sltiu        ra, t3, 744
                  fmv.w.x      ft10, sp
                  fcvt.wu.s    ra, fs10
                  mulhsu       s4, s4, s9
                  sra          s0, t2, sp
                  sub          s4, sp, s11
                  slt          a6, a3, s5
                  fsgnj.s      ft1, fs10, fs1
                  fmv.w.x      ft8, s7
                  mul          a1, s4, s5
                  slt          s1, t6, a4
                  flt.s        a1, ft11, fa1
                  and          s6, s4, t2
                  mulhu        a4, s9, a2
                  fdiv.s       ft7, ft7, fs10
                  slli         s6, a2, 21
                  and          s2, s8, a1
                  slt          ra, s8, s7
                  lui          s1, 379254
                  xor          a3, s11, s7
                  lui          ra, 67790
                  fmv.w.x      fs11, t4
                  nop
                  ori          a7, t1, 1612
                  remu         s4, zero, a4
                  slli         s7, a2, 7
                  fsgnjn.s     ft2, fs11, fa4
                  srai         s3, s10, 2
                  sltu         s3, s6, t2
                  mulhsu       s1, a4, t1
                  slli         s10, a0, 1
                  slti         t2, t6, -1664
                  sub          ra, sp, s5
                  mulhsu       zero, s8, s6
                  fclass.s     a7, fs0
                  fle.s        t6, fa7, ft7
                  remu         s8, t0, t2
                  rem          s7, s5, s3
                  fclass.s     s5, fa1
                  srli         s3, t1, 27
                  fcvt.s.w     ft0, s4
                  rem          a5, sp, t0
                  fmul.s       ft8, ft9, fs2, rtz
                  div          s10, t3, s7
                  fadd.s       fs6, ft3, fs10
                  addi         a2, s9, -126
                  fcvt.s.w     fa7, t0, rtz
                  ori          s4, s10, -1708
                  lui          sp, 261756
                  fclass.s     gp, fs8
                  mul          a3, gp, s8
                  fmin.s       ft6, fa6, fa6
                  rem          s11, s4, s8
                  fsqrt.s      fa7, fs7
                  mulh         s10, a5, a5
                  mulh         t0, s7, a5
                  sra          s6, a7, tp
                  fsqrt.s      fa3, fa6
                  lui          a6, 516139
                  fmul.s       fs0, fs6, fa5, rdn
                  fsqrt.s      ft2, fs11, rdn
                  fcvt.w.s     a1, fa3
                  ori          ra, a7, -621
                  flt.s        a4, ft7, fs4
                  sub          a2, s4, a6
                  add          sp, s10, a5
                  auipc        a3, 552111
                  srl          t2, s4, t5
                  xor          a4, t3, s11
                  sltu         s9, a4, gp
                  fclass.s     a1, ft9
                  andi         s11, tp, 1929
                  remu         s1, s6, tp
                  sll          a3, t2, a5
                  fmin.s       fs0, fs8, ft0
                  fcvt.s.wu    fs4, s6, rne
                  sll          s11, t2, s5
                  xori         s8, t3, 186
                  srai         t2, a5, 25
                  fcvt.s.wu    fs0, t1, rmm
                  auipc        t0, 863407
                  addi         t2, s5, 1669
                  fclass.s     t2, fs8
                  fcvt.s.wu    fa1, a7
                  div          s7, s11, a1
                  srl          a5, s0, ra
                  fsub.s       fa2, ft9, ft7, rtz
                  srai         a4, s0, 14
                  fmul.s       ft1, ft6, ft0
                  sltu         s8, t6, a3
                  mul          zero, s2, s10
                  fcvt.s.w     fa4, s2
                  andi         a7, t3, 163
                  flt.s        t3, fa6, fs11
                  xor          t5, t0, s9
                  fmin.s       ft8, ft7, ft9
                  mulh         t6, gp, t6
                  andi         s1, t1, 1
                  sltiu        t5, a5, 1526
                  rem          a3, a4, s8
                  slt          s2, s10, s10
                  xori         gp, s4, -1462
                  or           t3, zero, s10
                  sub          a7, a6, s7
                  mulhu        t6, t5, a2
                  mul          a5, t1, t6
                  mulhsu       a0, a7, sp
                  rem          t6, t1, ra
                  nop
                  andi         a7, t3, 1821
                  fle.s        t6, ft9, ft0
                  fcvt.s.wu    ft1, t6
                  sltiu        s1, t4, 1311
                  and          s7, a2, a5
                  sra          t3, sp, zero
                  andi         t5, s3, -2019
                  divu         s1, s11, t3
                  fsqrt.s      fa3, fs7, rne
                  fcvt.wu.s    ra, fs3, rmm
                  mul          t6, sp, t4
                  flt.s        a1, ft10, fa1
                  nop
                  srai         s8, gp, 21
                  lui          s6, 794092
                  mulh         s7, gp, s8
                  divu         s9, t5, a6
                  fsub.s       ft9, fs6, fa3, rdn
                  xori         s4, s7, 405
                  auipc        t6, 494137
                  fmv.w.x      ft1, s6
                  fsgnjx.s     fs7, ft3, ft2
                  fsqrt.s      fs9, fa3, rtz
                  lui          a4, 1038012
                  flt.s        s9, fs6, ft5
                  fmax.s       fs7, ft5, ft7
                  nop
                  sra          t0, s11, s3
                  fsgnjx.s     fs3, fa6, fa1
                  fmax.s       fa2, fa4, fa2
                  srli         t2, s5, 2
                  srl          s11, a5, a6
                  remu         s1, tp, s5
                  fclass.s     zero, ft11
                  div          s7, a0, t4
                  fadd.s       fs7, fs11, ft0
                  srli         a7, t3, 14
                  slti         a2, s8, -865
                  srai         ra, gp, 31
                  slli         t2, s0, 31
                  fsub.s       ft0, ft8, ft4
                  fclass.s     s0, fs5
                  fsgnjn.s     ft3, fa4, ft1
                  fmin.s       fs10, ft8, fs6
                  fmax.s       fa2, fs8, fa1
                  srl          s6, t3, t4
                  fadd.s       fa1, ft1, fa7
                  nop
                  fcvt.w.s     s4, fa7
                  andi         s6, t2, -620
                  fsgnj.s      fa7, ft10, fa1
                  nop
                  srli         s7, ra, 6
                  mulh         s6, gp, a7
                  fsgnjx.s     fa0, fs0, ft1
                  divu         sp, tp, s10
                  sll          t5, t6, s9
                  mul          t5, a0, t1
                  mulhsu       gp, sp, s10
                  addi         a3, s11, -187
                  fsub.s       ft2, ft7, fa7
                  xor          sp, zero, t2
                  div          a4, s0, t0
                  mulh         s2, t1, t6
                  fdiv.s       ft7, ft11, fa5
                  fmul.s       ft11, fa1, fs4
                  fcvt.s.wu    fa3, s11
                  or           s4, s3, s5
                  fsqrt.s      fs10, fs7, rdn
                  andi         ra, t2, 1657
                  fadd.s       ft7, ft9, ft11, rdn
                  mulhu        s8, a6, t3
                  flt.s        a1, fa4, ft0
                  feq.s        t3, fa0, fs0
                  fcvt.w.s     t0, fs0
                  slt          zero, s10, gp
                  fmax.s       fs11, ft1, fa3
                  rem          s8, a3, tp
                  fsgnjn.s     fs11, ft3, ft6
                  and          s11, s3, a2
                  fle.s        t2, fs5, ft11
                  fsgnj.s      fs3, fa1, ft2
                  mulhu        a5, gp, s5
                  fsub.s       ft5, ft10, fs11, rtz
                  mulhu        a0, t0, t1
                  fmv.x.w      s0, fs8
                  nop
                  lui          s8, 536121
                  slt          s4, s1, s10
                  and          a3, s9, tp
                  fsub.s       fs11, ft1, fs10
                  fadd.s       fs7, fs7, fs2, rdn
                  lui          ra, 768658
                  sub          a1, s8, ra
                  xori         s2, t5, -1659
                  sra          s0, s8, t3
                  fcvt.w.s     s1, ft11, rtz
                  fclass.s     t0, ft2
                  rem          a6, t0, s2
                  rem          s10, t3, t2
                  fmul.s       ft8, ft5, fs8, rne
                  slli         s4, a7, 26
                  sra          a7, a1, a2
                  slli         t6, s9, 12
                  fdiv.s       fs3, fs0, fs3
                  fmax.s       fs3, fs5, fs6
                  sll          t6, t4, s6
                  fmax.s       fs8, fs11, ft1
                  fsgnjx.s     fs3, fa3, fs5
                  srl          a1, s0, sp
                  fmax.s       fs5, fs11, fs10
                  srli         s5, tp, 2
                  fsgnj.s      fs3, fa3, fa2
                  feq.s        s9, ft5, fs8
                  sltu         t5, t3, t6
                  srli         a5, s4, 14
                  fmin.s       ft10, fs2, fa1
                  fadd.s       ft10, ft0, ft0, rdn
                  mulhu        t2, t4, t3
                  fcvt.s.wu    fa1, s7, rtz
                  fmv.w.x      ft9, gp
                  sltiu        s8, s6, 121
                  slt          a3, a2, s2
                  xori         s11, a0, 1312
                  fcvt.s.w     ft4, a7, rne
                  xori         a3, zero, -566
                  fcvt.w.s     a0, ft4, rtz
                  add          s10, s6, s9
                  mulh         a6, s10, s0
                  fmul.s       ft7, ft0, ft4
                  sll          s11, s8, ra
                  or           a7, a6, t1
                  fmin.s       ft0, ft7, fs6
                  nop
                  fdiv.s       ft11, fs9, fs8, rne
                  slt          a4, a1, a5
                  divu         t3, t4, ra
                  fsgnjx.s     fa2, fa0, fs9
                  fsqrt.s      fs7, ft8, rdn
                  sub          s7, t6, a3
                  fmv.x.w      zero, fs10
                  and          gp, s1, s9
                  fmin.s       fs6, fs2, fa3
                  slt          a2, t6, a0
                  fle.s        t5, fs9, fa7
                  xori         a0, a2, -546
                  srl          s3, t3, a2
                  divu         a5, gp, t2
                  fmv.x.w      a0, fs3
                  fsgnj.s      fs8, fs4, ft2
                  auipc        s6, 36841
                  add          gp, a6, s6
                  fclass.s     gp, fs2
                  slt          s6, a6, t1
                  fclass.s     a0, ft3
                  slt          s10, t6, tp
                  mul          s7, a3, a7
                  srli         s2, s10, 12
                  fmv.w.x      ft8, a6
                  fcvt.wu.s    s6, fa1, rne
                  srli         s8, t5, 6
                  mulh         t5, t6, t6
                  fsub.s       ft10, ft2, fs3
                  fle.s        t0, fs6, fa5
                  fmv.w.x      ft11, s10
                  rem          sp, s6, t5
                  or           t3, a3, s0
                  sltu         a0, t3, a3
                  sltu         s7, s10, a4
                  fmin.s       ft1, ft10, fs0
                  fcvt.w.s     a7, fs6, rdn
                  remu         s6, s2, a1
                  mul          a5, t0, s3
                  srai         ra, zero, 8
                  slli         t0, a5, 0
                  divu         a2, t2, sp
                  auipc        a2, 6613
                  sltiu        ra, s9, 613
                  srli         s2, s2, 10
                  fmv.x.w      s0, fs3
                  fsub.s       fs1, fa2, ft5
                  srli         gp, t1, 8
                  sll          a6, ra, s2
                  fmv.x.w      a4, fa2
                  slt          s11, t2, a2
                  xori         s6, tp, 1467
                  fsub.s       fs8, fa1, ft4
                  fcvt.s.w     fa7, t3, rup
                  divu         a2, ra, a1
                  andi         s11, s0, -1166
                  fsgnjn.s     fs3, fa3, ft5
                  remu         a2, s7, a7
                  fcvt.s.w     fs8, s3, rdn
                  xor          t2, a3, s4
                  lui          t3, 268699
                  slli         t0, t3, 6
                  fmax.s       fa5, fa0, fs6
                  fmul.s       ft9, fs9, ft8
                  fclass.s     a1, fa2
                  srai         ra, s2, 20
                  mul          gp, s9, a3
                  fcvt.s.wu    ft5, s1, rup
                  fsgnj.s      fa7, fa4, ft4
                  srli         s5, a3, 7
                  sub          a1, t3, s1
                  mulhsu       a6, a2, s6
                  fmv.x.w      zero, fa4
                  mul          t2, zero, t0
                  srai         a5, t3, 9
                  srai         a5, a1, 1
                  add          s6, sp, t2
                  fcvt.w.s     a3, ft6
                  fsub.s       fa6, ft5, fs6
                  remu         s5, s0, zero
                  fcvt.s.w     fa3, t3, rtz
                  fmv.x.w      t2, fs0
                  xori         ra, s6, 1704
                  nop
                  fmin.s       fa3, fs7, fs5
                  andi         a2, t0, 589
                  nop
                  fcvt.w.s     s7, ft0, rtz
                  mul          a7, t3, s8
                  fsub.s       ft2, fa5, ft11
                  divu         s10, sp, s8
                  fcvt.s.w     ft9, a0, rmm
                  srli         sp, s5, 8
                  fcvt.wu.s    t2, fa2
                  fmv.x.w      s7, fs10
                  mul          a0, s1, a6
                  fsgnj.s      fa4, fa6, ft7
                  fsub.s       fa0, fa4, fs8, rmm
                  and          s10, t0, t6
                  slli         sp, s9, 3
                  fmax.s       ft6, fa7, fa1
                  fsgnjx.s     fs5, fa4, fa5
                  mulh         t3, t2, s3
                  fcvt.s.wu    fs1, a2, rmm
                  fle.s        s6, fa0, fs3
                  srli         t2, s4, 0
                  fsqrt.s      fa4, fs3, rmm
                  sltiu        a4, a2, -1387
                  fmin.s       ft8, fs10, fa7
                  fcvt.s.wu    ft1, s3, rne
                  fmin.s       ft11, ft6, ft6
                  mulhsu       s8, s8, s3
                  sll          s5, s8, s10
                  fcvt.w.s     s4, ft1, rup
                  fdiv.s       ft10, fa6, fs9, rup
                  fdiv.s       fs1, fs4, ft5, rdn
                  fsgnj.s      ft9, fs5, fs2
                  sll          s10, t5, gp
                  lui          s8, 639927
                  sra          gp, a2, a7
                  srl          a7, ra, t5
                  srl          s3, a6, a4
                  auipc        s3, 851129
                  slt          s2, s8, a7
                  divu         s9, a7, s11
                  fmax.s       fa7, ft6, fs3
                  fcvt.w.s     t3, ft6, rmm
                  fsqrt.s      fs7, ft10, rtz
                  rem          a1, s2, tp
                  sltiu        s6, t1, 1390
                  fmul.s       fs3, fs0, fa5
                  fmv.x.w      s6, ft0
                  fsgnjx.s     fa0, fa1, fa4
                  fmv.x.w      ra, fs7
                  and          s0, a6, t6
                  mulhsu       zero, t0, a4
                  fmul.s       fs8, ft8, fa2, rmm
                  fmin.s       ft4, fs0, fa4
                  srai         t0, a6, 12
                  fclass.s     t2, ft11
                  feq.s        ra, fs8, fa6
                  fsqrt.s      ft2, fs6
                  mulhu        s2, sp, sp
                  xori         t0, a1, -1271
                  sub          s4, a0, s0
                  xori         s7, s0, -1278
                  fsgnjn.s     fs0, ft3, ft1
                  mulhsu       s5, t6, tp
                  divu         s9, s11, sp
                  div          a0, zero, t4
                  mulhsu       a5, s10, zero
                  sll          sp, s6, s6
                  fcvt.w.s     a5, fa7
                  fsgnjx.s     ft7, fa1, fa7
                  fcvt.s.w     fs9, a0
                  mul          s10, t4, a1
                  mulhsu       s6, tp, s8
                  flt.s        s5, fs0, fs9
                  slt          t5, s1, t2
                  fmv.w.x      ft5, a2
                  sra          s7, sp, gp
                  or           s10, a3, a6
                  feq.s        a2, ft7, ft8
                  fcvt.w.s     s11, fs11, rup
                  lui          s4, 100862
                  addi         ra, a5, -1511
                  sra          a5, a1, a4
                  fmul.s       fs0, fa5, fs11, rtz
                  add          a1, t6, a6
                  auipc        t2, 755631
                  div          s3, s0, t6
                  fmin.s       fs9, ft1, fa1
                  divu         s0, t0, s8
                  auipc        gp, 202080
                  fsub.s       fa5, ft7, fa0, rdn
                  remu         t3, s7, tp
                  srl          s0, a6, t5
                  fadd.s       fs8, fs1, fa4, rdn
                  fmin.s       fs5, fs6, ft4
                  remu         s8, t4, s1
                  mulhu        s4, s11, s5
                  fclass.s     s0, ft8
                  fmax.s       fs2, fa6, fs2
                  srl          a5, t2, s5
                  fsub.s       fs9, fs11, fs2, rne
                  fsgnj.s      ft7, fa4, ft10
                  fcvt.w.s     s3, ft6, rne
                  addi         s1, a0, -1141
                  fcvt.s.wu    ft0, a6, rtz
                  mulhu        s11, s0, s4
                  divu         s1, t0, t6
                  fdiv.s       fs1, ft10, ft3
                  srai         t3, s6, 23
                  fcvt.w.s     s9, fs10
                  remu         a1, a3, sp
                  fsub.s       fa1, ft8, fa5
                  fdiv.s       fs4, ft9, fs3
                  lui          a2, 877892
                  or           s8, s3, a2
                  rem          a0, ra, tp
                  add          sp, t2, t4
                  andi         t0, s4, -1837
                  srli         t0, s6, 27
                  andi         s11, s8, 1007
                  fmul.s       fs3, fs8, ft4
                  nop
                  fsub.s       ft6, ft0, fs11, rdn
                  slti         a6, a5, 133
                  xor          s1, ra, s3
                  fmax.s       ft8, fs3, fa1
                  fmax.s       fs2, fs4, fs7
                  mulhu        a7, a0, gp
                  srli         ra, t3, 5
                  nop
                  fmv.w.x      fs5, s2
                  mulh         t5, tp, zero
                  sra          sp, t0, s5
                  div          a6, s10, s8
                  nop
                  and          s6, ra, s4
                  divu         sp, tp, s5
                  mulhu        a3, tp, t3
                  feq.s        s1, fs9, fs6
                  addi         s4, t2, -503
                  slli         s3, zero, 0
                  slti         a4, a1, 1433
                  srai         a6, s3, 4
                  fdiv.s       fs8, fs5, ft10
                  and          s5, a2, t1
                  xor          a0, a6, t5
                  sll          s10, a4, s4
                  remu         s3, zero, ra
                  mulhu        a2, s3, ra
                  rem          s8, s7, s4
                  sub          a1, s0, a4
                  divu         ra, t0, t0
                  xori         a4, a3, 1704
                  fcvt.s.wu    fa3, t1
                  slti         t2, s11, 834
                  fsgnjx.s     ft5, fa4, fa7
                  rem          s11, tp, a4
                  sltiu        s11, a3, 1922
                  sub          a7, t6, t4
                  fdiv.s       ft4, fa7, fs9
                  fcvt.s.w     ft6, s3
                  or           a6, s3, a4
                  fle.s        sp, ft6, fs0
                  fsub.s       fa3, fs1, fa0
                  nop
                  mulhsu       a1, a6, t2
                  mulhu        s1, t2, s0
                  fsgnj.s      fs3, ft10, fs10
                  sra          s11, s4, s7
                  fmax.s       ft4, ft2, fa3
                  divu         s8, s0, zero
                  flt.s        a1, fs2, ft2
                  slt          a5, zero, s4
                  ori          t0, zero, 1191
                  srai         t2, s8, 6
                  fsgnjx.s     fa4, fa2, fa0
                  remu         a2, a1, t6
                  sltu         sp, s2, a3
                  ori          s3, tp, -158
                  sltiu        a1, t4, -1007
                  fcvt.w.s     s10, ft9
                  sra          t3, a5, s10
                  fcvt.w.s     a0, fs1, rne
                  slt          s0, s3, s11
                  mul          a2, zero, s3
                  fsgnjn.s     fa6, ft5, fs11
                  rem          s6, t1, s1
                  feq.s        t5, fs0, fs10
                  sltiu        s10, s2, -1256
                  auipc        t0, 771691
                  fsgnj.s      fs10, fa6, ft5
                  rem          a0, t3, a0
                  fmv.x.w      s1, fs7
                  fsgnj.s      fs11, ft5, fs9
                  fclass.s     a2, fs11
                  srl          s4, t0, t5
                  fle.s        t2, fs6, fa5
                  xor          s7, a0, s10
                  fsgnj.s      fs9, fs3, ft11
                  fcvt.s.w     ft5, s8
                  fdiv.s       fs4, fa6, fa4, rmm
                  fcvt.s.w     fs6, t2, rne
                  lui          a6, 34452
                  srli         a5, t3, 0
                  mulhsu       s10, a6, t0
                  addi         s11, a6, -958
                  flt.s        s10, fa5, fs11
                  fcvt.wu.s    s9, fs8, rup
                  rem          a3, t4, t0
                  fmin.s       ft1, ft8, fa5
                  fcvt.s.wu    fs1, a2, rdn
                  fsqrt.s      ft8, fa7
                  xori         t3, s4, 1161
                  andi         t6, ra, 404
                  fcvt.w.s     s7, fs3
                  srli         s6, t1, 28
                  remu         s4, a5, sp
                  fmv.x.w      s7, ft3
                  srai         s11, t2, 11
                  nop
                  slti         zero, t3, -42
                  mulhu        a0, t0, s2
                  ori          s8, s2, 1272
                  add          s7, zero, a4
                  ori          s11, a4, -708
                  remu         s6, t1, s3
                  fsgnjx.s     ft0, fa2, ft10
                  div          a0, t2, sp
                  sll          zero, s11, s3
                  fcvt.s.w     fa1, a0, rtz
                  fsgnjx.s     fa4, fa5, fa6
                  remu         s1, a5, s1
                  feq.s        a2, ft2, fs7
                  xor          s11, t4, s11
                  sub          zero, t4, a1
                  fmv.x.w      s0, fs8
                  fmv.x.w      a5, fa5
                  and          s3, ra, s10
                  remu         s5, s0, zero
                  divu         s11, s3, a7
                  fadd.s       ft2, ft10, fs4, rmm
                  fsgnjx.s     ft2, fs9, ft8
                  fclass.s     a1, fa7
                  andi         s11, s1, -463
                  srl          a1, t5, a6
                  ori          a6, s10, 1890
                  fadd.s       fs3, ft11, fa3, rmm
                  rem          a6, t3, s11
                  fcvt.s.wu    fs2, s9
                  fcvt.w.s     s10, ft8
                  addi         s1, s10, 1343
                  flt.s        s10, fa1, ft8
                  divu         s2, s7, a2
                  div          a5, a2, t3
                  sub          a4, a3, a7
                  slli         s3, ra, 12
                  mul          s6, t0, s9
                  mul          s3, s10, t6
                  or           ra, a2, t6
                  fsgnjn.s     fa4, ft1, fs9
                  div          s8, a3, a7
                  fmv.x.w      s4, ft1
                  nop
                  xor          t6, a5, a0
                  addi         gp, s11, 371
                  or           t2, t3, gp
                  fmv.x.w      s5, fs7
                  slti         t5, s10, -1204
                  fmv.x.w      t2, ft5
                  mulhsu       s4, s7, a3
                  remu         s4, t0, t3
                  lui          s1, 777351
                  auipc        s11, 232999
                  mul          a4, s2, t2
                  srli         s10, a4, 15
                  srli         s2, tp, 16
                  andi         gp, zero, 1771
                  fmv.x.w      t6, fa2
                  mulhsu       ra, gp, s4
                  andi         t0, s8, 1606
                  fcvt.s.w     ft9, t1, rup
                  fsqrt.s      fa2, ft8, rup
                  remu         a1, t2, tp
                  fmv.x.w      a4, fa2
                  feq.s        s5, ft6, fa3
                  slti         a0, a0, 1965
                  div          a7, zero, a0
                  sltiu        gp, a3, 643
                  fadd.s       fs9, ft9, fs2
                  add          s4, t3, s10
                  fmax.s       ft5, fa2, ft11
                  or           sp, s4, s6
                  and          t0, s6, s6
                  auipc        t6, 986108
                  fsqrt.s      ft8, ft1
                  sra          t0, a4, s6
                  fcvt.s.wu    fa1, a3
                  mulh         t5, t6, a2
                  mulh         s4, a3, t5
                  slt          a2, s11, t0
                  fcvt.s.wu    fs4, a2, rmm
                  fsqrt.s      fs11, fs0, rne
                  fle.s        a6, ft8, ft11
                  fcvt.s.w     ft8, s11, rup
                  and          s6, a0, s11
                  xor          s4, s4, s10
                  divu         s0, ra, a0
                  fmv.x.w      s6, ft2
                  fcvt.s.w     fa0, a1
                  addi         t5, a2, 1008
                  fcvt.s.wu    fa4, s2
                  srl          s9, t0, a0
                  ori          a5, s8, -1798
                  fcvt.w.s     t5, fs5, rmm
                  fcvt.w.s     s1, ft1, rtz
                  mulh         s6, s10, s3
                  sra          t2, a6, t3
                  fmv.x.w      gp, fa7
                  feq.s        sp, fa7, fs3
                  addi         t5, s10, 1319
                  fmv.x.w      s1, ft0
                  xori         a1, s3, -229
                  mulhsu       zero, s11, a4
                  add          a4, a4, s6
                  fmul.s       fa0, ft3, ft3
                  sltu         a6, a3, t1
                  remu         s3, sp, t5
                  remu         sp, s8, s3
                  fle.s        a0, fs6, ft9
                  sra          a6, a2, t3
                  add          sp, gp, s11
                  fmv.w.x      fa5, ra
                  slt          t6, a3, s4
                  andi         a3, a6, 1300
                  fmin.s       ft2, fa5, fa3
                  fadd.s       fs7, fs0, ft3
                  srl          ra, s1, s7
                  feq.s        s4, ft10, ft2
                  xor          s7, a4, t0
                  div          t2, s9, tp
                  srai         t5, s11, 27
                  add          s5, a2, s6
                  sll          a1, t4, a0
                  srai         a2, s10, 23
                  div          s10, zero, s4
                  sll          a5, s8, s3
                  fsqrt.s      ft8, fa5, rup
                  fcvt.w.s     t5, fs7
                  div          s8, a1, a3
                  fle.s        s3, fa5, ft10
                  addi         s10, a5, -1953
                  fcvt.wu.s    t6, ft0
                  srai         s1, a1, 24
                  andi         t2, a0, -478
                  xori         s3, t5, 295
                  lui          s5, 424785
                  sll          t2, a6, t1
                  fadd.s       fa0, fs7, fs10, rtz
                  srli         ra, s11, 9
                  flt.s        a5, ft8, fs2
                  fadd.s       ft7, fa5, fs9, rtz
                  or           t0, s10, t4
                  xor          s4, s5, t0
                  fsgnj.s      fa6, fa2, ft9
                  slt          s8, a1, zero
                  and          s0, zero, s6
                  slti         s4, a1, -1337
                  andi         s2, tp, 1833
                  and          ra, s0, s1
                  ori          a2, s4, 210
                  srai         s8, t5, 13
                  fcvt.s.wu    ft1, t3
                  fcvt.wu.s    gp, ft11, rmm
                  fcvt.wu.s    a5, fa1, rdn
                  sll          s1, t2, t4
                  fsub.s       fs1, fs11, fs6, rmm
                  fmin.s       fa2, fa6, fa6
                  xor          a3, a2, s0
                  fcvt.s.wu    ft0, s7, rtz
                  div          a6, t5, t1
                  fdiv.s       fs8, fs1, ft10, rmm
                  divu         a4, s5, s9
                  fsgnjn.s     ft6, fs2, ft0
                  fmv.w.x      ft3, t0
                  fsgnjn.s     fs5, fa2, ft5
                  sltu         s10, t1, a0
                  mul          s4, sp, s8
                  fdiv.s       fs5, ft8, ft9, rtz
                  and          sp, s9, t6
                  srai         sp, t4, 20
                  fmv.x.w      sp, ft0
                  fcvt.s.wu    ft10, gp, rup
                  ori          t0, s9, 1752
                  slt          s9, t4, s7
                  fsub.s       fa5, fs7, ft0
                  xor          s4, a6, tp
                  add          sp, a7, s10
                  fcvt.wu.s    gp, fa6
                  or           a0, s7, t1
                  sll          a6, a7, s10
                  sll          a5, t5, a5
                  sltu         a0, s4, t0
                  fdiv.s       fs3, fs4, fa6, rdn
                  fdiv.s       fs0, fs10, fs1
                  xor          a4, s3, t1
                  sltiu        s7, s0, 687
                  fsub.s       fa0, fa4, fs2
                  sltu         s8, sp, t4
                  sltiu        s1, gp, 1358
                  fclass.s     s8, fs8
                  fle.s        t2, ft6, fa3
                  auipc        s8, 433704
                  srl          s4, s2, a2
                  fmv.w.x      ft2, t4
                  nop
                  fclass.s     t5, fs3
                  slti         s3, a1, -1697
                  fsgnjn.s     fa5, ft2, ft11
                  sub          a2, s0, a0
                  remu         s3, a4, s0
                  mulhu        a6, a3, t6
                  sltu         s1, s7, s9
                  xori         t2, s3, 1996
                  div          s5, s7, s6
                  fclass.s     s8, fs9
                  fcvt.s.w     ft11, t3, rtz
                  slt          s7, a5, ra
                  fclass.s     t2, ft9
                  mul          t0, s10, s6
                  srai         sp, a7, 26
                  fmul.s       fa7, fa5, fs7
                  feq.s        ra, fs1, ft1
                  or           a7, t2, a4
                  fcvt.w.s     zero, ft10
                  fmv.w.x      fa6, s11
                  and          a3, t5, a1
                  slli         t2, s10, 9
                  xor          s5, s0, t1
                  fsub.s       ft1, ft1, fa3, rdn
                  srli         gp, s3, 25
                  srai         s4, s9, 26
                  fadd.s       fs7, fs6, fa5, rup
                  fsgnjx.s     fs2, fs4, ft7
                  fmv.x.w      gp, fa5
                  remu         t3, ra, a3
                  auipc        t2, 923548
                  auipc        s2, 350827
                  fsgnjn.s     ft9, fa3, fs9
                  fclass.s     s2, fs6
                  xor          s10, s6, s5
                  sltiu        zero, t5, 641
                  fmv.x.w      s11, fa6
                  and          zero, a5, t5
                  sub          s0, s7, s5
                  and          s1, a0, s7
                  fsqrt.s      fs3, ft3, rmm
                  fmv.w.x      fa3, a7
                  feq.s        s4, fa1, ft8
                  fcvt.s.wu    fa6, s0, rup
                  srai         s7, t6, 31
                  flt.s        s5, fa7, fa1
                  xori         s8, ra, 652
                  xor          s7, t1, s11
                  fle.s        a5, ft5, fa7
                  fle.s        s1, fa6, fa3
                  rem          s5, s5, a5
                  mul          s9, a2, t2
                  fmv.x.w      s4, ft11
                  rem          s7, t3, s6
                  fadd.s       fs0, fs4, ft1
                  xor          s5, t2, a7
                  fmax.s       ft5, ft1, fs11
                  nop
                  srai         t2, t3, 25
                  slti         s9, t5, -1282
                  fmin.s       fs5, ft2, ft11
                  fcvt.s.wu    fs0, t2, rdn
                  or           s5, a2, t2
                  ori          a3, a0, 341
                  mulhsu       sp, s7, s6
                  sll          t6, a7, a6
                  fsgnjx.s     fa4, ft0, fs2
                  ori          a1, t2, 938
                  fmv.x.w      s0, ft8
                  xor          gp, zero, s9
                  mulhsu       a1, sp, s10
                  fclass.s     a6, ft0
                  fsgnj.s      fs7, fs2, fs1
                  srl          s8, zero, s6
                  mulh         t3, sp, t0
                  fadd.s       fs2, fs1, ft1
                  fcvt.s.wu    fs1, t2, rdn
                  srl          s10, s5, s5
                  ori          s1, t5, -375
                  fadd.s       fs4, fs9, fs7
                  fmin.s       fs2, fs11, fa7
                  fcvt.s.wu    fa6, s6, rtz
                  fmul.s       fa0, fs1, fs6
                  fmax.s       ft11, ft6, ft2
                  fmin.s       fs4, fs0, fa4
                  fmul.s       ft11, fs5, ft9
                  sub          s9, t2, s9
                  fsqrt.s      fs5, fs4, rtz
                  auipc        a4, 91706
                  auipc        a0, 280751
                  fsgnjn.s     ft1, fs8, fs3
                  mulhsu       s9, t0, a3
                  sll          s5, s7, a3
                  fsgnjx.s     ft0, ft1, ft7
                  sra          zero, s5, a6
                  add          gp, a2, s3
                  fmax.s       fs1, fs2, fs9
                  fsgnjx.s     ft1, fs10, ft11
                  xori         a6, a0, -939
                  fcvt.wu.s    s6, fs5, rmm
                  auipc        a3, 174969
                  sra          s9, a2, s2
                  and          gp, a7, s6
                  slti         a2, a3, -1930
                  lui          s5, 320362
                  fcvt.s.wu    ft5, a1, rne
                  flt.s        t3, fa2, fs1
                  fcvt.s.wu    ft3, s6
                  mulh         t5, a7, t0
                  divu         sp, a2, t6
                  addi         s9, ra, 107
                  fmv.w.x      ft10, a4
                  fcvt.s.wu    ft2, a1, rtz
                  and          a7, s4, s3
                  fclass.s     s7, ft6
                  fmul.s       ft3, ft9, fs9, rmm
                  addi         s11, s3, 1470
                  fmin.s       fs2, ft5, fa2
                  fmv.x.w      s0, fs4
                  fcvt.wu.s    t6, fa5
                  sub          s9, a0, t1
                  sltu         s6, s1, s11
                  flt.s        t2, ft0, ft1
                  fsqrt.s      fs3, fs0
                  sltu         t3, gp, tp
                  fdiv.s       ft0, ft2, ft7, rtz
                  div          t2, s1, t3
                  fmv.x.w      t0, fa5
                  fdiv.s       ft11, fs5, ft7, rmm
                  flt.s        s6, fa6, fs1
                  srl          s8, s2, s2
                  sll          t2, t6, a3
                  sra          s8, sp, s9
                  slti         s3, a3, 523
                  slli         a6, s9, 21
                  lui          a5, 935779
                  xori         gp, s8, 973
                  mulhu        s8, tp, s5
                  xor          s0, a7, a3
                  mulhu        s3, a6, ra
                  rem          s5, a2, a5
                  fsgnjx.s     fa6, fa2, fs11
                  fsgnj.s      ft3, fa2, fa6
                  fmv.x.w      s10, fs6
                  fsgnjx.s     fa3, ft7, fa1
                  fsgnjx.s     fa4, ft7, fs9
                  auipc        s1, 95015
                  flt.s        s2, fa6, ft2
                  xor          s4, s8, a5
                  div          s11, a3, ra
                  slt          t5, s6, s3
                  sub          gp, gp, a0
                  fcvt.s.w     fa5, s0, rne
                  fmin.s       fa3, ft1, ft8
                  fcvt.w.s     zero, ft10, rdn
                  fdiv.s       fs4, fs6, fa4, rmm
                  auipc        s6, 834869
                  sll          ra, t1, ra
                  fcvt.wu.s    a4, fs11, rmm
                  fcvt.wu.s    a5, fa7
                  slli         zero, sp, 7
                  and          a6, t2, a4
                  fcvt.s.wu    fa1, s5, rmm
                  feq.s        s6, fa3, fs1
                  fmin.s       ft2, ft6, fa6
                  slt          s9, a5, t2
                  fsgnj.s      fa3, fs3, fs6
                  mul          a3, t0, a1
                  remu         ra, s11, s7
                  and          s5, s11, s9
                  xori         s11, s10, 151
                  fmv.w.x      fs3, s10
                  fsub.s       fa4, ft7, fa6, rup
                  fcvt.s.w     ft10, ra
                  fsgnjx.s     fa1, ft6, ft6
                  div          a5, a3, s0
                  ori          a3, s3, 306
                  slti         zero, s3, -1143
                  sll          s2, s7, ra
                  mul          s4, a6, t1
                  fcvt.s.w     ft1, t4, rup
                  feq.s        s5, fs9, ft8
                  mulh         s3, s9, s9
                  fmax.s       fs1, ft0, ft2
                  fsub.s       ft1, ft8, fs0, rdn
                  feq.s        s11, fs11, fa4
                  sll          s11, s3, s8
                  fcvt.s.w     fa7, a0, rne
                  slti         s9, t5, -85
                  fclass.s     a6, ft2
                  feq.s        s11, fs8, fa4
                  slti         t5, gp, -614
                  fmul.s       fa1, ft10, fs11, rtz
                  fmax.s       fa6, fs11, fs2
                  fmax.s       ft2, fs2, fs7
                  fcvt.wu.s    t0, fa5
                  nop
                  fmax.s       fs0, fs10, fa1
                  fmax.s       ft0, fa5, fs7
                  xor          a6, t5, s3
                  fmin.s       ft11, fs9, ft3
                  srai         a1, s11, 18
                  addi         s4, t3, -648
                  slti         s5, t1, 956
                  fsgnjn.s     fs8, fs10, ft4
                  fsgnjx.s     ft2, ft3, fa5
                  fsub.s       ft6, fa5, fs5
                  lui          s10, 141487
                  rem          a6, a3, s7
                  fsqrt.s      ft4, fs6, rmm
                  mulhsu       ra, a4, s5
                  slli         s2, a3, 30
                  fcvt.s.wu    ft10, a6, rtz
                  addi         a1, s10, 1616
                  sltu         s6, t1, sp
                  slt          zero, a6, ra
                  fle.s        s3, fs8, fa2
                  mulhsu       s1, a4, a1
                  xori         s2, sp, 918
                  fcvt.s.w     ft6, a4, rtz
                  mulh         s9, t2, s3
                  mulhu        t3, gp, a2
                  slt          a0, s2, ra
                  sltu         s3, a3, s8
                  srli         a3, a4, 29
                  sltu         s10, s4, a5
                  fsgnjx.s     ft6, ft0, fs3
                  mulh         zero, a0, zero
                  fmv.w.x      ft9, t1
                  div          s7, s1, t6
                  feq.s        s0, fs1, fa7
                  fcvt.s.w     fs0, a5, rne
                  fmv.w.x      ft5, t6
                  fcvt.wu.s    s9, fa1
                  or           s0, s5, a4
                  fcvt.s.w     fs2, t2, rmm
                  sub          a1, t1, s7
                  nop
                  add          a1, s7, a0
                  mulh         t3, gp, s4
                  fmax.s       fs9, ft5, ft4
                  and          ra, s10, a7
                  lui          a2, 562476
                  fsgnj.s      ft7, fa4, fa2
                  fmul.s       fa4, fs7, ft9
                  slt          s0, s5, s1
                  slli         t2, tp, 8
                  slti         s4, tp, -1667
                  fclass.s     a6, fs11
                  fmax.s       fs7, ft0, fs3
                  sltiu        t3, a5, -698
                  div          s7, gp, s4
                  mulhsu       s8, s0, t6
                  feq.s        t6, fs10, ft6
                  sra          a7, s0, tp
                  rem          t3, t1, t6
                  sll          a6, s5, t5
                  ori          a4, a2, 709
                  fadd.s       fa3, fs1, fa2, rdn
                  rem          a0, s9, s10
                  fsgnjn.s     fa3, ft11, fa3
                  divu         t3, a7, s10
                  divu         t6, t6, a3
                  fmv.x.w      s0, ft8
                  fmv.w.x      fa5, a3
                  xor          s6, s10, sp
                  flt.s        a1, fs9, ft4
                  or           s5, t2, t0
                  sltiu        s1, a4, 1495
                  feq.s        t5, fs3, fs4
                  lui          t5, 534155
                  mulhu        t2, a4, t3
                  fle.s        a7, fs4, fa7
                  fmin.s       fs4, fa4, fs1
                  ori          s2, s6, 1999
                  and          s7, s3, a0
                  sltiu        ra, a5, -266
                  lui          t3, 97623
                  mulh         a0, a7, t4
                  fadd.s       fs6, fa7, fs7, rmm
                  fsgnjx.s     fs8, fa4, ft4
                  srli         gp, a2, 0
                  add          a4, t2, a1
                  fadd.s       ft1, ft11, fa0
                  fmv.w.x      ft7, a4
                  srli         a3, s9, 23
                  fcvt.s.w     fs0, s4
                  fcvt.s.wu    ft8, t3, rne
                  fsgnj.s      fs11, fs3, ft5
                  nop
                  slli         s0, t3, 25
                  lui          s8, 943077
                  xor          s5, ra, zero
                  auipc        s9, 659174
                  slt          gp, s7, sp
                  mulh         a1, t5, s10
                  sub          a0, s7, s6
                  slt          s4, s11, sp
                  andi         a7, a4, 1365
                  fsgnjx.s     ft9, ft3, fs11
                  ori          t0, gp, 1106
                  addi         s8, t1, 1666
                  srli         a7, t4, 0
                  fmin.s       fs9, fs7, fs8
                  and          a2, t1, gp
                  fmv.w.x      ft3, tp
                  flt.s        s1, ft4, fa0
                  ori          sp, s6, 1206
                  addi         s2, s10, 689
                  nop
                  fclass.s     t5, fs3
                  rem          s3, s9, a0
                  sll          t0, gp, a7
                  fsub.s       fs10, fa3, ft8
                  fmax.s       fs10, fs8, ft2
                  sll          a7, s10, s11
                  srli         s4, s3, 20
                  sub          t0, s10, t4
                  flt.s        t3, fs2, fs7
                  ori          s3, a7, 1016
                  xori         a2, t2, 885
                  feq.s        s0, fs9, fs2
                  fmv.w.x      fs1, t5
                  sltiu        a1, a7, -835
                  div          s0, a3, t1
                  xori         gp, a7, 1001
                  lui          a3, 432659
                  mulhu        t2, a6, s2
                  fadd.s       ft11, fs9, ft3, rdn
                  sll          s2, t2, tp
                  fmul.s       ft6, fs2, ft5
                  fdiv.s       ft2, ft8, ft4
                  mulhu        sp, s11, s1
                  fcvt.w.s     s4, ft7, rne
                  srli         gp, zero, 24
                  auipc        t5, 185597
                  fclass.s     a0, fs7
                  div          a4, s11, s7
                  fsgnjn.s     ft1, ft8, fa5
                  sltu         zero, a5, s5
                  fsgnjn.s     ft7, ft8, ft11
                  sltiu        a5, s7, -126
                  remu         t6, s9, a5
                  sll          s5, gp, s4
                  fmin.s       ft9, fs10, fs2
                  sra          t3, t1, sp
                  auipc        a5, 946074
                  srli         s8, ra, 3
                  feq.s        a5, fa4, ft2
                  sll          s4, t5, t0
                  xori         s8, a3, -305
                  andi         s7, a1, 1721
                  add          a0, s7, s8
                  sra          a5, ra, s1
                  fsgnjn.s     fa3, fa2, ft9
                  sltiu        s5, s8, 267
                  sub          s3, s8, t2
                  mul          a4, a4, s9
                  xori         s9, ra, -1303
                  add          s3, s3, s2
                  fcvt.s.wu    ft3, s4
                  fsqrt.s      fs11, fa5
                  mul          a7, zero, s7
                  mulhu        a1, s6, tp
                  fclass.s     a5, ft9
                  fmin.s       ft4, fs0, fs1
                  ori          s1, s5, -1829
                  srl          a6, s6, s11
                  sltu         s2, t6, a3
                  auipc        ra, 774815
                  fsqrt.s      fs11, ft0, rdn
                  srai         a6, s11, 12
                  remu         s5, a3, s0
                  add          t2, sp, t3
                  srli         a2, s2, 31
                  sub          s2, s3, s6
                  fsub.s       ft11, fa5, fs7
                  or           s5, gp, t6
                  fmv.x.w      a7, fs8
                  srl          a2, s9, sp
                  srli         sp, t6, 4
                  fcvt.w.s     s5, fs8
                  addi         a5, s4, -722
                  andi         a5, t6, 557
                  remu         zero, a7, a7
                  mulhu        a2, ra, a0
                  srli         t3, sp, 8
                  auipc        s4, 153457
                  fcvt.wu.s    t0, ft6
                  srl          t5, a7, s0
                  slt          s3, t5, a6
                  fmin.s       fs6, fs11, ft1
                  auipc        t3, 693045
                  andi         a0, s7, 1924
                  slt          t3, a3, a5
                  xor          t5, s11, s4
                  andi         sp, s9, 348
                  feq.s        a1, ft4, fs3
                  slt          s10, s2, t2
                  fsqrt.s      ft0, fs4, rne
                  fcvt.w.s     s3, fs0
                  mul          ra, s1, a4
                  flt.s        a7, fs4, ft8
                  fmul.s       fs0, fs1, ft4
                  sltu         s7, tp, s9
                  slti         s6, s11, -115
                  fsgnj.s      ft8, fs8, fs2
                  remu         s6, s4, s7
                  feq.s        sp, ft1, fa4
                  remu         t6, s6, s10
                  srai         gp, sp, 28
                  xor          t2, s5, s6
                  fsub.s       fs2, fs11, ft3, rtz
                  auipc        s5, 186189
                  fsgnjn.s     ft6, fa6, ft3
                  div          a6, a3, a5
                  and          t3, a2, s9
                  sltiu        t3, gp, -18
                  fcvt.w.s     a1, ft9
                  fclass.s     t5, fs2
                  sub          s8, t3, tp
                  fsub.s       fa2, fs3, fs7, rtz
                  slli         s5, t2, 6
                  slli         a5, a6, 19
                  rem          s3, a1, zero
                  mul          s7, sp, s6
                  srai         sp, t2, 7
                  fcvt.s.wu    ft2, t0, rup
                  nop
                  fmax.s       fs1, ft9, fa0
                  slli         zero, s0, 24
                  divu         ra, s7, ra
                  fclass.s     s9, ft2
                  remu         gp, s11, a2
                  fmv.x.w      sp, fs9
                  srl          a5, s5, s4
                  and          s6, a4, gp
                  fmv.x.w      a1, fs7
                  slli         sp, zero, 26
                  fmax.s       fs9, ft5, fa3
                  divu         t5, t5, s1
                  fsgnj.s      fs6, fa2, fs1
                  slt          sp, a2, s3
                  fsqrt.s      ft4, fa5, rtz
                  fsgnjx.s     ft6, ft8, ft0
                  addi         s0, s10, 2023
                  addi         s5, s4, -782
                  fmv.w.x      ft7, s1
                  fcvt.wu.s    a6, fs4
                  fle.s        zero, fs6, ft11
                  slli         s6, s9, 4
                  nop
                  remu         t0, a7, s3
                  sltiu        t0, s7, 1900
                  sltu         s7, s1, a2
                  fsgnjx.s     ft8, ft4, ft5
                  fmin.s       fs4, ft1, fa1
                  and          s10, a7, s9
                  fcvt.s.wu    fs11, s3
                  fsgnjx.s     ft7, fa3, ft7
                  div          a5, s11, t1
                  fcvt.w.s     t2, ft5, rne
                  fsgnjx.s     fs0, fs11, ft6
                  slti         a3, s2, -963
                  or           a7, a4, s9
                  mul          s2, t0, a0
                  lui          a5, 664492
                  addi         a2, t1, -2014
                  sltiu        s7, t2, -475
                  rem          s2, t3, s2
                  fsqrt.s      ft1, ft11, rup
                  fmv.w.x      ft8, a4
                  fsgnjn.s     fs0, fs10, ft2
                  feq.s        t0, fs3, fa2
                  fdiv.s       ft3, fs0, ft6
                  fmax.s       fs7, fs4, ft0
                  fcvt.s.w     ft6, t6, rup
                  divu         s0, t0, a7
                  fmv.x.w      s6, fa7
                  slt          s8, s5, gp
                  fmv.w.x      fs4, t6
                  fadd.s       fs3, fs4, fa7
                  sltu         s10, s8, s8
                  fclass.s     s9, ft5
                  fsgnjn.s     ft7, fs11, ft10
                  fclass.s     zero, ft3
                  fsgnj.s      fs9, fs10, ft1
                  div          s9, a7, zero
                  sltiu        t0, ra, -1286
                  slt          s10, s0, s7
                  fcvt.w.s     s8, fs3, rtz
                  fmax.s       ft2, ft4, ft9
                  xori         t5, s1, -1393
                  remu         s4, a6, a2
                  fmin.s       fs1, fa6, ft5
                  fcvt.wu.s    zero, fa3
                  fcvt.w.s     a5, fa7
                  slti         a1, s3, -1469
                  nop
                  sltiu        s9, s6, -1629
                  mulhsu       s2, s2, s0
                  div          zero, t3, t0
                  div          a5, a7, t3
                  fadd.s       ft7, fa0, fa1
                  flt.s        a7, fs8, ft5
                  lui          a7, 476179
                  fmv.w.x      ft6, t4
                  fcvt.wu.s    ra, fs6
                  fsqrt.s      fs10, fa6, rup
                  xori         a5, a0, -1538
                  srl          a7, a3, s4
                  auipc        ra, 514686
                  add          s3, s7, t6
                  fcvt.s.w     ft3, a6, rdn
                  flt.s        t6, fa7, ft10
                  nop
                  fle.s        t5, fa5, fs7
                  xori         a4, s5, -1856
                  andi         a4, a1, -1051
                  sra          s5, a0, s1
                  or           s5, t6, s6
                  or           a1, t6, t2
                  mul          s8, a3, s1
                  mulh         s8, s11, s11
                  fsgnjn.s     ft7, fa2, fs1
                  sltu         t6, t0, s1
                  fsub.s       fa7, ft1, fa4, rup
                  fmax.s       ft11, fs0, ft4
                  fcvt.w.s     s9, fa6
                  or           t0, gp, a0
                  remu         s11, a1, a1
                  fmv.w.x      fa7, a4
                  fsgnj.s      fs7, ft10, ft10
                  nop
                  mulhsu       s0, t6, zero
                  fcvt.s.w     fa3, zero, rmm
                  addi         s3, t0, -1812
                  rem          t2, s9, s10
                  fsub.s       ft8, fs5, ft9
                  fdiv.s       fs2, fs1, fa5, rdn
                  and          gp, ra, t2
                  slt          t5, s8, t2
                  addi         s8, tp, 245
                  and          a4, tp, t3
                  srai         s6, tp, 23
                  divu         t0, a0, s8
                  mulh         s11, t5, a1
                  fcvt.w.s     s8, ft0, rdn
                  fmul.s       fs10, fs3, fs8
                  fadd.s       ft8, ft6, ft10, rmm
                  fle.s        sp, fs0, fa6
                  fcvt.s.wu    fs9, a1, rne
                  xor          s8, tp, a4
                  fmv.x.w      s6, fs11
                  mulh         s10, a2, a2
                  nop
                  srl          s6, s6, a5
                  slt          a1, a2, s4
                  xor          s11, ra, s8
                  xor          a2, t3, s3
                  mulh         t0, a2, a7
                  or           t6, t2, t5
                  add          s2, s10, a0
                  mul          s9, s10, s1
                  divu         ra, a1, a1
                  sltiu        gp, s10, -1120
                  mul          s8, a4, t6
                  divu         s9, s7, s9
                  or           s6, t3, s3
                  fcvt.s.wu    ft9, s6, rne
                  srai         s11, a7, 0
                  feq.s        s2, fs11, fa0
                  srli         s1, ra, 26
                  fsgnjx.s     ft4, fs1, ft5
                  sltu         a0, a2, a7
                  auipc        t6, 646060
                  add          a4, s5, a3
                  flt.s        t3, fa5, fa3
                  fcvt.s.w     ft4, s7, rdn
                  srai         zero, t3, 25
                  srli         a0, t3, 9
                  lui          ra, 992832
                  fsgnj.s      fs10, fa2, ft10
                  fsgnjx.s     ft3, ft5, ft3
                  nop
                  fcvt.wu.s    t3, fa3, rup
                  slti         zero, t0, -265
                  sltu         s11, gp, a1
                  fmin.s       fa3, ft4, fs6
                  slti         a5, t4, -1867
                  slti         a7, s3, 245
                  fmv.w.x      fa6, s8
                  or           a7, t5, a7
                  mulhu        a4, t2, s11
                  slli         s6, tp, 27
                  fle.s        ra, ft11, fs7
                  xori         gp, a2, -646
                  fdiv.s       ft1, fa5, fa4
                  fcvt.w.s     a7, fs3, rtz
                  fmin.s       ft10, ft10, ft10
                  remu         a0, a5, s7
                  srai         t5, s2, 3
                  fcvt.w.s     t2, fs0, rtz
                  fsgnj.s      ft4, fs0, fs5
                  mulhu        zero, s9, a7
                  addi         a7, gp, 1072
                  rem          s1, s11, s5
                  ori          s8, sp, -958
                  or           a0, s7, s6
                  mulhsu       t2, s11, s0
                  fmv.x.w      t6, fs3
                  fsqrt.s      fs2, ft4, rdn
                  feq.s        gp, fs5, fs11
                  fsgnj.s      fa0, ft4, fs5
                  fmv.w.x      fs6, a1
                  slt          s9, tp, t0
                  auipc        a2, 220116
                  sra          a3, a3, s6
                  auipc        t3, 945834
                  fsgnjn.s     fs0, fs2, fs7
                  slti         gp, a3, 484
                  auipc        s6, 543586
                  srl          s1, a4, s9
                  fsub.s       ft5, fa0, ft2
                  xor          s5, s0, a0
                  fdiv.s       ft11, ft4, ft6
                  andi         s7, s11, 178
                  add          s7, a0, a2
                  fsqrt.s      fa7, fs7
                  fadd.s       ft9, fs11, ft4, rtz
                  xor          a0, s11, t2
                  div          s5, t3, s4
                  sra          s11, s4, s1
                  fsqrt.s      fa4, ft1
                  sltu         a2, t6, zero
                  mulh         s3, sp, t3
                  ori          a0, s7, 1931
                  sltu         s1, t5, t5
                  mulh         s11, s6, a3
                  auipc        t2, 660140
                  sltiu        sp, tp, 601
                  nop
                  add          s0, s3, a0
                  rem          a2, a2, t0
                  fcvt.s.wu    fs4, a1, rdn
                  fcvt.s.w     ft5, s4, rne
                  and          s1, gp, s3
                  fsgnjn.s     fs7, ft11, fs8
                  andi         a2, a7, -1139
                  slli         a0, s0, 27
                  sltiu        a2, s0, 729
                  fcvt.wu.s    t0, ft5, rup
                  auipc        t3, 787658
                  fcvt.s.w     ft7, s8
                  xori         a4, s5, 1838
                  feq.s        a7, fa0, fs5
                  fsgnj.s      fa5, ft11, fa2
                  fsgnj.s      fa7, fa6, fa0
                  auipc        s7, 154457
                  fmv.w.x      ft1, t1
                  fsgnjx.s     ft2, ft3, ft5
                  fcvt.s.wu    ft9, a7
                  ori          t2, s9, -262
                  addi         a1, t3, -1720
                  fsgnjx.s     ft11, ft0, ft4
                  flt.s        sp, fs3, ft4
                  mulhu        a0, a6, tp
                  xor          a1, s1, t5
                  flt.s        gp, fa5, fa2
                  fcvt.s.w     ft4, a1
                  mul          t3, sp, a2
                  slli         t2, a6, 21
                  auipc        s5, 407973
                  and          a3, tp, sp
                  remu         s0, s6, s4
                  mulhu        s5, s7, s2
                  fclass.s     s8, ft0
                  fcvt.w.s     s3, fs2
                  slli         s8, s1, 0
                  slli         s9, s5, 31
                  fsub.s       ft4, fs3, fa7, rmm
                  fclass.s     t0, fa6
                  add          a3, s8, s6
                  mulh         s3, s11, s11
                  addi         zero, s9, 392
                  mulh         a1, sp, a5
                  xori         s6, t3, 924
                  xor          s7, a7, s9
                  fcvt.s.w     fs0, a2
                  and          t0, s3, s0
                  ori          s7, a0, 728
                  fmv.w.x      fa6, s2
                  fcvt.w.s     t2, fa2
                  andi         a7, sp, 180
                  feq.s        gp, ft8, ft5
                  srli         s2, a2, 29
                  fsgnj.s      fs9, fa3, ft4
                  ori          t0, t1, -1673
                  fmax.s       fs5, ft3, ft5
                  ori          t2, s1, 921
                  nop
                  ori          s5, s6, -277
                  sll          a7, t1, sp
                  lui          t0, 70539
                  mulhu        a4, a4, t6
                  sltiu        a4, s1, -286
                  auipc        s3, 600099
                  add          s10, a4, s0
                  fadd.s       ft8, fa1, fa0
                  rem          t2, s6, s2
                  divu         s6, t4, a1
                  fdiv.s       fs11, fs6, fs3, rne
                  lui          s7, 1032879
                  srl          t3, s5, t1
                  ori          a6, s4, -1476
                  fle.s        a3, ft7, fs8
                  sub          t0, t3, a0
                  srai         gp, ra, 19
                  fmv.x.w      gp, ft4
                  lui          a1, 1003775
                  ori          t5, t0, 986
                  srli         a1, a7, 0
                  flt.s        t6, fs7, fs1
                  divu         s0, s10, s8
                  mul          t2, gp, ra
                  sub          a6, s7, sp
                  add          sp, s9, t5
                  fadd.s       fs2, ft3, ft1, rne
                  auipc        s11, 162546
                  srai         t3, s6, 24
                  srli         t2, sp, 8
                  addi         a3, tp, -839
                  nop
                  sub          s4, s6, s8
                  fcvt.w.s     s7, fa6
                  mulhu        a4, s4, sp
                  feq.s        s1, fs8, fs6
                  slli         t3, zero, 8
                  fcvt.w.s     sp, fs10
                  sub          zero, gp, s7
                  srai         t5, s1, 15
                  mulhu        a4, ra, s10
                  nop
                  fle.s        t3, ft7, ft11
                  fsub.s       fa5, fs2, fa3, rtz
                  addi         t5, a5, 1533
                  mul          s6, s7, a7
                  fcvt.s.wu    ft6, gp
                  sub          a4, sp, gp
                  sll          t6, s8, s4
                  mulhsu       s10, t1, t6
                  fsgnj.s      ft4, fs8, fs3
                  fmax.s       fa7, ft6, ft6
                  sltu         t2, a3, s11
                  sltiu        t0, sp, 310
                  divu         a7, t5, s10
                  flt.s        s9, ft0, fs8
                  andi         s3, a0, -1741
                  sll          s10, s3, a3
                  sub          s0, gp, t3
                  srai         s4, ra, 29
                  feq.s        s11, fs6, fa4
                  sltiu        t6, t5, 615
                  sub          zero, a7, s2
                  nop
                  fadd.s       fs2, fs11, ft1
                  fle.s        s5, ft7, ft0
                  fdiv.s       ft11, fa6, fa6
                  sub          s10, s2, a7
                  andi         a1, t5, 13
                  sub          s5, t6, a7
                  flt.s        t6, fs8, ft9
                  fmv.x.w      a4, ft0
                  lui          a2, 565896
                  divu         s8, s2, s7
                  ori          s5, s1, -1376
                  slt          s8, s6, t2
                  fmv.w.x      fs0, a4
                  sll          sp, s7, s1
                  srli         a5, a4, 26
                  sub          a5, s8, t3
                  srli         a3, s4, 25
                  fmul.s       fa3, fa2, fs7, rne
                  srl          a0, a4, a7
                  fmin.s       fs0, ft0, ft0
                  remu         t3, s4, s2
                  nop
                  xori         s8, t3, 741
                  ori          a0, a7, 25
                  slli         s3, s6, 20
                  fsgnjn.s     ft1, fa4, fs3
                  srai         t2, s7, 21
                  slti         ra, a2, 1041
                  xori         ra, s1, 1487
                  divu         sp, s2, t1
                  fsqrt.s      ft10, fa4
                  srli         t6, a3, 9
                  addi         t3, t2, -1541
                  nop
                  sra          a3, t2, t6
                  slli         s6, s11, 19
                  fsgnjn.s     ft8, fs3, ft5
                  nop
                  srli         t3, a7, 6
                  rem          t5, t0, s2
                  divu         t3, s7, ra
                  slli         s7, t4, 31
                  add          a4, s8, gp
                  divu         s0, a4, a4
                  mulhsu       sp, sp, s0
                  srl          s10, s8, s10
                  andi         a5, t4, -1231
                  lui          t2, 828298
                  addi         s2, a5, 1768
                  fle.s        s9, fs1, ft3
                  fle.s        s0, ft2, fs3
                  fdiv.s       ft11, fa7, fs4, rup
                  srl          t6, a2, t5
                  sltu         a3, a0, s8
                  rem          a0, a2, s3
                  fadd.s       fs9, fa5, ft1
                  slti         a7, s0, -193
                  slti         ra, s8, -2013
                  and          s1, s9, sp
                  and          s0, ra, a7
                  srl          t2, s0, a3
                  div          a4, a0, t0
                  mul          ra, gp, s0
                  fcvt.s.w     fs10, t2
                  fcvt.w.s     zero, fa2, rup
                  mulhu        s3, s6, zero
                  slli         s10, sp, 20
                  fle.s        s8, fs2, fa3
                  fcvt.w.s     a7, fa0
                  slli         t5, s9, 6
                  fsub.s       fa3, fa4, ft0
                  nop
                  remu         a3, s6, s9
                  lui          s11, 50190
                  nop
                  add          t6, t0, s2
                  mulh         t5, tp, t2
                  fsub.s       fs9, fa3, fa4
                  rem          a4, a5, t2
                  mulhsu       a2, t6, s11
                  nop
                  mulhsu       s4, zero, a7
                  fmax.s       fa0, fs8, fa6
                  mulh         t5, s3, s10
                  or           s10, s8, s11
                  flt.s        t0, fa5, ft0
                  fsgnjn.s     fa5, fs1, fs8
                  fmv.w.x      ft0, tp
                  fcvt.wu.s    a0, ft5, rtz
                  addi         s3, tp, -1727
                  fmin.s       fs7, ft11, fs6
                  slt          s2, a0, t5
                  fclass.s     t6, ft8
                  srli         a4, zero, 2
                  flt.s        s0, fa0, fs9
                  fmv.x.w      s9, fa0
                  addi         s3, a3, 1497
                  mulh         s2, gp, t1
                  fmul.s       ft3, ft7, ft11, rdn
                  nop
                  sub          t6, ra, t2
                  divu         gp, t6, a2
                  xori         a5, t5, 1493
                  rem          sp, a5, s6
                  xor          s11, t3, s8
                  nop
                  mulh         s3, t3, a5
                  mul          t3, a2, a6
                  fmin.s       ft3, ft1, fs1
                  fsub.s       ft5, fs4, ft0
                  mulh         a3, tp, t1
                  nop
                  fsgnj.s      fa4, ft8, fa6
                  flt.s        a4, fs10, fs0
                  fmin.s       ft7, fs10, ft10
                  slti         s7, sp, 1635
                  xori         a4, zero, 1813
                  lui          s9, 57953
                  fsqrt.s      ft8, fa0
                  fcvt.s.w     ft10, a0
                  fmv.w.x      fa6, t4
                  srai         a3, s9, 10
                  mul          s4, s11, t2
                  sltiu        a4, a4, 712
                  sub          ra, s9, a4
                  sra          a1, s0, t0
                  xor          a0, tp, sp
                  sltiu        s1, s2, 1772
                  sltu         s10, s9, a2
                  lui          a0, 978180
                  fmv.x.w      t2, ft3
                  fle.s        s10, fs3, fa4
                  auipc        s11, 793918
                  fsgnjn.s     ft0, fa5, ft1
                  fmv.w.x      fs9, s8
                  add          s7, t2, t3
                  fmul.s       ft3, ft0, fa1, rtz
                  slli         t2, a6, 10
                  ori          s11, t1, -207
                  and          t6, a5, s2
                  mulh         s4, t1, s1
                  fadd.s       ft9, ft10, ft0, rdn
                  rem          s2, a6, a1
                  srai         t0, s9, 13
                  nop
                  fadd.s       ft7, fa7, ft10, rdn
                  xori         s0, t4, -6
                  feq.s        s3, fa6, fs11
                  fcvt.w.s     s10, ft4, rup
                  fsgnj.s      fa6, ft2, ft7
                  auipc        a4, 44791
                  sra          s9, s8, t1
                  mulhsu       s9, a4, a0
                  srli         t2, ra, 7
                  fle.s        t2, fa3, ft5
                  div          s10, s6, s6
                  fclass.s     s8, fs8
                  sub          s9, tp, t5
                  sll          s8, s10, a1
                  fmv.x.w      s5, ft1
                  slli         a1, a7, 30
                  remu         sp, zero, s6
                  ori          gp, gp, 1137
                  fsqrt.s      fa0, fs5, rtz
                  add          a5, a4, a7
                  slli         t3, a2, 3
                  fcvt.w.s     a1, fa2, rmm
                  divu         s8, s6, t5
                  sll          a6, t6, t6
                  fclass.s     s4, ft6
                  fmin.s       fs10, fa5, ft6
                  mulhsu       a7, gp, s10
                  div          t3, s2, a6
                  remu         s2, gp, a7
                  fclass.s     a2, fs11
                  div          s1, tp, ra
                  fmv.w.x      ft0, a5
                  slli         s7, tp, 21
                  fsgnjx.s     fa7, fs10, ft1
                  remu         t5, s5, a0
                  mul          s1, s4, t1
                  xor          ra, a3, a6
                  xori         a4, t5, 169
                  remu         s0, t1, a3
                  andi         sp, a3, -1581
                  fmax.s       fs7, fs9, fs8
                  fadd.s       fa6, fa3, fa5, rtz
                  fdiv.s       ft11, fs7, fs4, rtz
                  add          s4, t5, s11
                  xori         zero, s7, -123
                  slti         s8, a5, 1910
                  fsub.s       fa3, ft2, fa7
                  fle.s        s7, fs11, fs3
                  fsqrt.s      ft5, fs10
                  div          a1, a3, a2
                  xori         s9, s6, 371
                  fsub.s       fs4, ft11, ft0
                  ori          a0, s2, 663
                  fmul.s       fa7, ft7, ft4, rne
                  fle.s        a3, ft10, fa2
                  fsgnj.s      fa3, fs6, fs11
                  mul          t3, s1, a4
                  fmv.x.w      s7, fs0
                  fclass.s     s11, fa0
                  fmin.s       ft5, fs9, ft9
                  fcvt.s.wu    fa7, t0, rtz
                  flt.s        s6, ft10, ft6
                  slli         a5, a3, 12
                  nop
                  slt          a0, s0, t6
                  slti         t5, a7, -861
                  mul          s6, t4, s0
                  slt          sp, tp, zero
                  srai         s1, s10, 19
                  fsgnjx.s     fa2, fs3, fs6
                  fsgnjx.s     fa0, ft3, fs3
                  fadd.s       ft8, ft8, ft0
                  feq.s        s4, ft8, fs2
                  srli         s2, a3, 3
                  fadd.s       fa5, fs9, ft8
                  fmul.s       ft5, ft0, fs1, rdn
                  sub          a4, t1, s4
                  mul          gp, s5, ra
                  mulhu        s0, a2, gp
                  rem          s4, s7, t0
                  fmul.s       ft3, ft6, ft3
                  mulhsu       s2, s7, a2
                  mulhu        a7, t2, s4
                  mulhsu       a1, t1, a1
                  auipc        a2, 514081
                  mulhu        s6, s5, tp
                  rem          s1, s6, s8
                  xori         a2, s11, 32
                  xor          t3, s2, t4
                  and          s6, a0, t2
                  fle.s        a4, fa1, ft0
                  fclass.s     s9, ft10
                  slli         s0, s7, 25
                  fadd.s       fs4, fs2, fa5
                  fcvt.s.wu    fs7, a5
                  fmax.s       fa0, fa6, fa0
                  ori          s3, s0, 1200
                  sra          s9, sp, a0
                  nop
                  sra          a7, s4, t2
                  xor          a2, s8, t1
                  andi         s6, s5, -893
                  srai         s9, s6, 30
                  xor          s5, a4, zero
                  mul          s11, s7, s0
                  fmul.s       fs8, ft2, fs4, rne
                  flt.s        s0, fs1, ft6
                  fmax.s       fs2, fs0, fs9
                  sub          t5, s2, s10
                  fcvt.s.wu    fs6, a7
                  slli         a7, t4, 23
                  srli         a1, zero, 0
                  fsgnjx.s     fs3, ft9, ft6
                  mul          s1, a5, t5
                  remu         s3, s9, t4
                  mulhsu       s2, s3, t5
                  fcvt.s.w     fa3, a1, rtz
                  sub          t2, t0, t3
                  remu         s0, t0, a3
                  mulhu        a6, a2, a5
                  auipc        a3, 789476
                  fsgnjn.s     fa0, fs8, ft7
                  fmv.x.w      ra, fs9
                  andi         s9, a3, 1977
                  auipc        s7, 671460
                  fsgnjx.s     fs3, fs5, fs11
                  fcvt.wu.s    t6, ft9, rtz
                  auipc        s3, 999053
                  fmv.x.w      a0, fs4
                  fle.s        t2, ft8, fs5
                  and          t2, t2, a4
                  slt          t3, a2, t3
                  mul          s5, t3, sp
                  fmax.s       fs8, ft4, fs0
                  fcvt.w.s     a4, fs10
                  sll          t2, s9, s9
                  fsqrt.s      ft6, ft6
                  mulhu        a3, s5, t0
                  fcvt.s.wu    fa2, s6
                  xor          s9, s10, t3
                  srl          s11, s11, tp
                  srai         s5, s7, 16
                  remu         a3, a7, a2
                  slli         a3, t0, 6
                  nop
                  mul          s5, s2, ra
                  nop
                  fcvt.s.w     ft3, t6
                  fsgnjn.s     fs2, fs0, fa0
                  sltu         s0, s2, zero
                  slli         ra, s8, 9
                  fsgnjx.s     ft5, fs1, fa5
                  fsgnjx.s     fs1, fs6, fs1
                  fadd.s       fa1, ft10, ft11, rdn
                  slli         a4, t6, 22
                  fle.s        s11, fs6, fs4
                  fmul.s       fs8, fs3, ft0, rdn
                  divu         a4, s6, s11
                  mulh         gp, a3, a5
                  fcvt.s.w     fa3, a6
                  mulhu        t3, t3, a3
                  fsgnj.s      ft10, fs2, fs10
                  fsub.s       ft6, fa2, fs7, rup
                  sltu         a1, a4, a1
                  fmv.x.w      a7, fs6
                  fsub.s       ft8, fs0, fs11
                  srli         s10, t5, 1
                  fmv.x.w      s8, fs3
                  srai         s11, s7, 5
                  mul          sp, t6, s9
                  feq.s        s0, fs8, fs3
                  fdiv.s       fa2, fs6, fa6, rne
                  or           s3, s7, t0
                  fmul.s       fs6, fs3, fs5
                  slli         sp, s4, 12
                  lui          sp, 136247
                  div          t0, a4, t6
                  slt          a1, s5, sp
                  fsgnjn.s     ft8, fs1, ft6
                  xori         ra, t5, 766
                  fmul.s       ft3, fs2, ft7, rup
                  ori          s5, s9, -1697
                  fcvt.w.s     a0, fs7, rup
                  fsub.s       fs7, fs4, fa1
                  sltu         s11, sp, sp
                  fadd.s       fs3, ft5, fa4, rmm
                  fcvt.w.s     a7, ft1, rmm
                  fclass.s     s9, fs5
                  div          s2, s11, t3
                  fmax.s       fs5, fa2, fa1
                  or           t5, a0, a0
                  feq.s        a6, fs3, fs0
                  srl          a1, s3, zero
                  remu         zero, zero, a0
                  fsub.s       fa1, fa0, fa7, rdn
                  sra          s3, sp, t1
                  fsgnjx.s     ft8, ft10, fs11
                  flt.s        s4, fa0, fa0
                  auipc        t5, 269526
                  xori         t6, t5, 119
                  slli         a4, sp, 8
                  fle.s        a5, fa3, ft10
                  srli         s0, a4, 6
                  srl          s2, a1, t0
                  slt          zero, s0, sp
                  srl          s3, t5, a2
                  addi         a5, a3, -190
                  feq.s        ra, ft4, fs3
                  fcvt.wu.s    gp, ft11
                  rem          a1, a5, t6
                  ori          sp, t3, 1447
                  flt.s        a3, fa1, ft4
                  srl          t2, s0, t0
                  mulhsu       a5, s8, s9
                  nop
                  fcvt.s.w     fa6, t2
                  xori         s5, zero, 568
                  flt.s        a2, fs3, ft2
                  fcvt.s.wu    fa3, t3, rup
                  srai         gp, a6, 31
                  ori          s9, s7, 2020
                  srai         s6, t2, 23
                  flt.s        t6, fs9, ft8
                  mul          s11, a3, s9
                  fsgnjx.s     fs3, fs6, fs6
                  fcvt.wu.s    gp, ft8, rdn
                  fdiv.s       fa4, fs6, fs7
                  fcvt.w.s     s11, ft11
                  andi         s1, t0, -489
                  feq.s        t3, fa3, fs4
                  addi         s1, s0, -1859
                  fle.s        a4, fs5, fs9
                  fmin.s       ft11, fa3, ft2
                  sltu         s9, t2, s8
                  fsgnj.s      ft0, ft8, fs11
                  fcvt.wu.s    a1, fs3, rne
                  auipc        s7, 97605
                  fclass.s     s1, fa6
                  rem          s10, s5, t4
                  fadd.s       fs5, fs4, fa5
                  slli         a0, a3, 18
                  fdiv.s       fs5, ft4, fa7, rup
                  xori         t0, s5, 1494
                  fdiv.s       fs8, fs3, fa5
                  fsgnj.s      ft4, fs8, fa5
                  fcvt.wu.s    t0, fs5, rne
                  srl          t0, s3, s4
                  slti         a2, s2, 1057
                  fmul.s       ft0, fa6, ft9
                  auipc        ra, 239162
                  fcvt.w.s     s9, ft1
                  fmax.s       fs6, fa2, fa7
                  remu         s10, a7, a7
                  sll          t0, s8, s1
                  andi         s3, s3, -757
                  auipc        s10, 199953
                  fmv.w.x      fs9, a2
                  fcvt.w.s     s2, fs6
                  xor          a6, t1, s8
                  fmul.s       fs7, fs2, ft6, rmm
                  or           gp, a6, a4
                  fsgnjx.s     fs4, ft3, fs1
                  fmv.w.x      fa7, s5
                  mulhu        t2, t4, t3
                  srai         s9, zero, 25
                  fmax.s       fs4, ft8, fs2
                  sltu         s4, t6, tp
                  fmv.w.x      fs1, t3
                  addi         t5, a4, -62
                  fle.s        t6, fs10, fs4
                  mul          s7, zero, s0
                  and          t3, s2, a4
                  div          s3, t6, s0
                  add          s10, s7, s4
                  flt.s        s7, ft9, fs10
                  divu         t5, t5, a4
                  fmul.s       ft7, ft4, ft1
                  nop
                  fsgnjn.s     fa7, fa2, fs5
                  divu         s0, s2, t5
                  ori          s2, tp, 1756
                  and          s7, s9, zero
                  slt          s0, s1, tp
                  sub          a4, a2, a4
                  add          s1, s10, t1
                  addi         s10, t0, -1889
                  fdiv.s       fs4, fs10, fs4
                  fcvt.w.s     gp, ft2, rup
                  divu         s3, s0, a0
                  fcvt.s.wu    fs10, ra, rdn
                  divu         s11, s8, a4
                  fsgnjn.s     ft9, fa7, fs3
                  fle.s        s6, fa7, fs4
                  xor          a7, a1, ra
                  andi         a7, a2, -1240
                  fcvt.wu.s    s6, fs1, rne
                  srl          s0, a4, a7
                  lui          t0, 262725
                  mulh         a7, s4, s3
                  sltu         s7, s8, zero
                  flt.s        s5, ft9, ft8
                  sub          s4, a4, a7
                  flt.s        s6, fa4, fs5
                  fsgnjx.s     fs6, fs3, fs8
                  sltiu        a6, s9, 970
                  ori          s10, s4, 172
                  sll          s11, a2, t2
                  sltiu        a1, a5, 1332
                  fadd.s       ft0, ft9, fs6, rne
                  fsub.s       ft7, fs5, fa4, rdn
                  slt          gp, t3, s3
                  lui          t3, 419321
                  div          s7, s9, s8
                  fadd.s       fs4, fs11, ft8
                  srl          s3, s7, t5
                  and          a5, s1, gp
                  fmv.x.w      a2, fs5
                  fmax.s       fs10, fs11, fs2
                  slt          s8, sp, t2
                  fsub.s       fa5, ft11, fa7, rdn
                  xor          gp, s4, s9
                  fclass.s     t3, fs4
                  fle.s        a7, ft8, ft3
                  fcvt.wu.s    s2, ft9
                  mulhsu       s1, a2, a2
                  slli         a4, s3, 0
                  xori         s6, zero, -173
                  fle.s        s0, fs4, fa6
                  addi         a5, t1, -449
                  fclass.s     a2, fa3
                  auipc        s5, 236115
                  divu         zero, s4, a4
                  fsgnj.s      fs0, ft5, fs8
                  fmv.w.x      ft7, s6
                  fsgnjx.s     ft6, ft9, fs4
                  flt.s        zero, fs1, ft1
                  fsgnjn.s     ft4, fa6, fs9
                  add          a0, t0, s8
                  fdiv.s       fs11, ft2, fa6
                  fmin.s       fs6, fa5, fs4
                  ori          t5, a7, -115
                  andi         a6, s2, 1426
                  srai         t3, t5, 1
                  srai         a0, s0, 15
                  fsgnjn.s     ft11, fa3, fa3
                  fsgnj.s      ft4, fa3, fa0
                  auipc        s8, 77748
                  add          t3, ra, a7
                  flt.s        t3, fs5, fs11
                  nop
                  fcvt.wu.s    s9, ft9
                  fmul.s       fs2, fa2, ft6
                  slt          s11, s5, s10
                  or           s2, a0, s7
                  fmv.w.x      fs0, a6
                  fcvt.wu.s    sp, ft6, rtz
                  fcvt.s.w     fs0, a4
                  sub          a0, s9, t1
                  slti         s9, gp, 867
                  add          s10, t5, a6
                  sll          s2, t3, t4
                  or           a2, ra, t3
                  sll          s8, sp, s6
                  fle.s        zero, ft0, ft8
                  fsgnjx.s     fs4, fs5, fs4
                  srai         t5, t0, 30
                  fmul.s       fa1, ft7, fs1, rup
                  fcvt.wu.s    a7, ft1
                  slli         s5, s4, 1
                  fmin.s       fs4, ft8, ft7
                  sll          a6, s6, t6
                  fdiv.s       ft2, ft5, ft2
                  lui          s5, 646554
                  feq.s        s2, fa6, fs10
                  fdiv.s       fs0, fs0, fs11, rtz
                  auipc        t3, 294426
                  flt.s        a4, ft10, fs5
                  srai         a3, sp, 6
                  srli         s7, t6, 1
                  remu         s1, s6, s0
                  sll          s2, s8, a1
                  fle.s        gp, fs8, fa2
                  feq.s        s4, fa5, ft5
                  fle.s        s11, fs10, fs9
                  andi         s10, s6, -585
                  mulh         t0, s0, tp
                  fcvt.s.w     ft6, t4
                  ori          a0, ra, 536
                  fcvt.s.w     ft0, s9, rup
                  sll          ra, s7, s11
                  feq.s        t6, ft0, ft4
                  andi         t6, sp, 1775
                  slli         a6, s5, 5
                  fmv.x.w      a0, ft9
                  xor          t3, s0, sp
                  fadd.s       fs7, ft1, fa6
                  div          a6, sp, t1
                  fmv.w.x      ft11, s10
                  fsub.s       ft6, ft10, fs8, rdn
                  fmv.w.x      fa2, s3
                  srai         s6, t2, 9
                  fcvt.w.s     s1, ft3, rtz
                  flt.s        a7, fs11, fs9
                  fsgnjx.s     fa5, fs7, fs0
                  la x6, test_done
                  jalr x0, x6, 0
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
.align           2
mtvec_handler:    
                  addi x4, x4, -4
                  sw  x29, (x4)
                  add x29, x4, zero
                  addi x29, x29, -128
                  sw  x1, 4(x29)
                  sw  x2, 8(x29)
                  sw  x3, 12(x29)
                  sw  x4, 16(x29)
                  sw  x5, 20(x29)
                  sw  x6, 24(x29)
                  sw  x7, 28(x29)
                  sw  x8, 32(x29)
                  sw  x9, 36(x29)
                  sw  x10, 40(x29)
                  sw  x11, 44(x29)
                  sw  x12, 48(x29)
                  sw  x13, 52(x29)
                  sw  x14, 56(x29)
                  sw  x15, 60(x29)
                  sw  x16, 64(x29)
                  sw  x17, 68(x29)
                  sw  x18, 72(x29)
                  sw  x19, 76(x29)
                  sw  x20, 80(x29)
                  sw  x21, 84(x29)
                  sw  x22, 88(x29)
                  sw  x23, 92(x29)
                  sw  x24, 96(x29)
                  sw  x25, 100(x29)
                  sw  x26, 104(x29)
                  sw  x27, 108(x29)
                  sw  x28, 112(x29)
                  sw  x29, 116(x29)
                  sw  x30, 120(x29)
                  sw  x31, 124(x29)
                  add x4, x29, zero
                  csrr x14, 0x300 # MSTATUS
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 31
                  bne x14, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x14, 0x341 # MEPC
                  csrr x14, 0x342 # MCAUSE
                  li x25, 0x3 # BREAKPOINT
                  beq x14, x25, ebreak_handler
                  li x25, 0x8 # ECALL_UMODE
                  beq x14, x25, ecall_handler
                  li x25, 0x9 # ECALL_SMODE
                  beq x14, x25, ecall_handler
                  li x25, 0xb # ECALL_MMODE
                  beq x14, x25, ecall_handler
                  li x25, 0x1
                  beq x14, x25, instr_fault_handler
                  li x25, 0x5
                  beq x14, x25, load_fault_handler
                  li x25, 0x7
                  beq x14, x25, store_fault_handler
                  li x25, 0xc
                  beq x14, x25, pt_fault_handler
                  li x25, 0xd
                  beq x14, x25, pt_fault_handler
                  li x25, 0xf
                  beq x14, x25, pt_fault_handler
                  li x25, 0x2 # ILLEGAL_INSTRUCTION
                  beq x14, x25, illegal_instr_handler
                  csrr x25, 0x343 # MTVAL
                  1: la x6, test_done
                  jalr x1, x6, 0

ecall_handler:    
                  la x14, _start
                  sw x0, 0(x14)
                  sw x1, 4(x14)
                  sw x2, 8(x14)
                  sw x3, 12(x14)
                  sw x4, 16(x14)
                  sw x5, 20(x14)
                  sw x6, 24(x14)
                  sw x7, 28(x14)
                  sw x8, 32(x14)
                  sw x9, 36(x14)
                  sw x10, 40(x14)
                  sw x11, 44(x14)
                  sw x12, 48(x14)
                  sw x13, 52(x14)
                  sw x14, 56(x14)
                  sw x15, 60(x14)
                  sw x16, 64(x14)
                  sw x17, 68(x14)
                  sw x18, 72(x14)
                  sw x19, 76(x14)
                  sw x20, 80(x14)
                  sw x21, 84(x14)
                  sw x22, 88(x14)
                  sw x23, 92(x14)
                  sw x24, 96(x14)
                  sw x25, 100(x14)
                  sw x26, 104(x14)
                  sw x27, 108(x14)
                  sw x28, 112(x14)
                  sw x29, 116(x14)
                  sw x30, 120(x14)
                  sw x31, 124(x14)
                  la x6, write_tohost
                  jalr x0, x6, 0

instr_fault_handler:
                  add x29, x4, zero
                  lw  x1, 4(x29)
                  lw  x2, 8(x29)
                  lw  x3, 12(x29)
                  lw  x4, 16(x29)
                  lw  x5, 20(x29)
                  lw  x6, 24(x29)
                  lw  x7, 28(x29)
                  lw  x8, 32(x29)
                  lw  x9, 36(x29)
                  lw  x10, 40(x29)
                  lw  x11, 44(x29)
                  lw  x12, 48(x29)
                  lw  x13, 52(x29)
                  lw  x14, 56(x29)
                  lw  x15, 60(x29)
                  lw  x16, 64(x29)
                  lw  x17, 68(x29)
                  lw  x18, 72(x29)
                  lw  x19, 76(x29)
                  lw  x20, 80(x29)
                  lw  x21, 84(x29)
                  lw  x22, 88(x29)
                  lw  x23, 92(x29)
                  lw  x24, 96(x29)
                  lw  x25, 100(x29)
                  lw  x26, 104(x29)
                  lw  x27, 108(x29)
                  lw  x28, 112(x29)
                  lw  x29, 116(x29)
                  lw  x30, 120(x29)
                  lw  x31, 124(x29)
                  addi x29, x29, 128
                  add x4, x29, zero
                  lw  x29, (x4)
                  addi x4, x4, 4
                  mret

load_fault_handler:
                  add x29, x4, zero
                  lw  x1, 4(x29)
                  lw  x2, 8(x29)
                  lw  x3, 12(x29)
                  lw  x4, 16(x29)
                  lw  x5, 20(x29)
                  lw  x6, 24(x29)
                  lw  x7, 28(x29)
                  lw  x8, 32(x29)
                  lw  x9, 36(x29)
                  lw  x10, 40(x29)
                  lw  x11, 44(x29)
                  lw  x12, 48(x29)
                  lw  x13, 52(x29)
                  lw  x14, 56(x29)
                  lw  x15, 60(x29)
                  lw  x16, 64(x29)
                  lw  x17, 68(x29)
                  lw  x18, 72(x29)
                  lw  x19, 76(x29)
                  lw  x20, 80(x29)
                  lw  x21, 84(x29)
                  lw  x22, 88(x29)
                  lw  x23, 92(x29)
                  lw  x24, 96(x29)
                  lw  x25, 100(x29)
                  lw  x26, 104(x29)
                  lw  x27, 108(x29)
                  lw  x28, 112(x29)
                  lw  x29, 116(x29)
                  lw  x30, 120(x29)
                  lw  x31, 124(x29)
                  addi x29, x29, 128
                  add x4, x29, zero
                  lw  x29, (x4)
                  addi x4, x4, 4
                  mret

store_fault_handler:
                  add x29, x4, zero
                  lw  x1, 4(x29)
                  lw  x2, 8(x29)
                  lw  x3, 12(x29)
                  lw  x4, 16(x29)
                  lw  x5, 20(x29)
                  lw  x6, 24(x29)
                  lw  x7, 28(x29)
                  lw  x8, 32(x29)
                  lw  x9, 36(x29)
                  lw  x10, 40(x29)
                  lw  x11, 44(x29)
                  lw  x12, 48(x29)
                  lw  x13, 52(x29)
                  lw  x14, 56(x29)
                  lw  x15, 60(x29)
                  lw  x16, 64(x29)
                  lw  x17, 68(x29)
                  lw  x18, 72(x29)
                  lw  x19, 76(x29)
                  lw  x20, 80(x29)
                  lw  x21, 84(x29)
                  lw  x22, 88(x29)
                  lw  x23, 92(x29)
                  lw  x24, 96(x29)
                  lw  x25, 100(x29)
                  lw  x26, 104(x29)
                  lw  x27, 108(x29)
                  lw  x28, 112(x29)
                  lw  x29, 116(x29)
                  lw  x30, 120(x29)
                  lw  x31, 124(x29)
                  addi x29, x29, 128
                  add x4, x29, zero
                  lw  x29, (x4)
                  addi x4, x4, 4
                  mret

ebreak_handler:   
                  csrr  x14, 0x341
                  addi  x14, x14, 4
                  csrw  0x341, x14
                  add x29, x4, zero
                  lw  x1, 4(x29)
                  lw  x2, 8(x29)
                  lw  x3, 12(x29)
                  lw  x4, 16(x29)
                  lw  x5, 20(x29)
                  lw  x6, 24(x29)
                  lw  x7, 28(x29)
                  lw  x8, 32(x29)
                  lw  x9, 36(x29)
                  lw  x10, 40(x29)
                  lw  x11, 44(x29)
                  lw  x12, 48(x29)
                  lw  x13, 52(x29)
                  lw  x14, 56(x29)
                  lw  x15, 60(x29)
                  lw  x16, 64(x29)
                  lw  x17, 68(x29)
                  lw  x18, 72(x29)
                  lw  x19, 76(x29)
                  lw  x20, 80(x29)
                  lw  x21, 84(x29)
                  lw  x22, 88(x29)
                  lw  x23, 92(x29)
                  lw  x24, 96(x29)
                  lw  x25, 100(x29)
                  lw  x26, 104(x29)
                  lw  x27, 108(x29)
                  lw  x28, 112(x29)
                  lw  x29, 116(x29)
                  lw  x30, 120(x29)
                  lw  x31, 124(x29)
                  addi x29, x29, 128
                  add x4, x29, zero
                  lw  x29, (x4)
                  addi x4, x4, 4
                  mret

illegal_instr_handler:
                  csrr  x14, 0x341
                  addi  x14, x14, 4
                  csrw  0x341, x14
                  add x29, x4, zero
                  lw  x1, 4(x29)
                  lw  x2, 8(x29)
                  lw  x3, 12(x29)
                  lw  x4, 16(x29)
                  lw  x5, 20(x29)
                  lw  x6, 24(x29)
                  lw  x7, 28(x29)
                  lw  x8, 32(x29)
                  lw  x9, 36(x29)
                  lw  x10, 40(x29)
                  lw  x11, 44(x29)
                  lw  x12, 48(x29)
                  lw  x13, 52(x29)
                  lw  x14, 56(x29)
                  lw  x15, 60(x29)
                  lw  x16, 64(x29)
                  lw  x17, 68(x29)
                  lw  x18, 72(x29)
                  lw  x19, 76(x29)
                  lw  x20, 80(x29)
                  lw  x21, 84(x29)
                  lw  x22, 88(x29)
                  lw  x23, 92(x29)
                  lw  x24, 96(x29)
                  lw  x25, 100(x29)
                  lw  x26, 104(x29)
                  lw  x27, 108(x29)
                  lw  x28, 112(x29)
                  lw  x29, 116(x29)
                  lw  x30, 120(x29)
                  lw  x31, 124(x29)
                  addi x29, x29, 128
                  add x4, x29, zero
                  lw  x29, (x4)
                  addi x4, x4, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x14, 0x300 # MSTATUS;
                  csrr  x14, 0x304 # MIE;
                  csrr  x14, 0x344 # MIP;
                  csrrc x14, 0x344, x14 # MIP;
                  add x29, x4, zero
                  lw  x1, 4(x29)
                  lw  x2, 8(x29)
                  lw  x3, 12(x29)
                  lw  x4, 16(x29)
                  lw  x5, 20(x29)
                  lw  x6, 24(x29)
                  lw  x7, 28(x29)
                  lw  x8, 32(x29)
                  lw  x9, 36(x29)
                  lw  x10, 40(x29)
                  lw  x11, 44(x29)
                  lw  x12, 48(x29)
                  lw  x13, 52(x29)
                  lw  x14, 56(x29)
                  lw  x15, 60(x29)
                  lw  x16, 64(x29)
                  lw  x17, 68(x29)
                  lw  x18, 72(x29)
                  lw  x19, 76(x29)
                  lw  x20, 80(x29)
                  lw  x21, 84(x29)
                  lw  x22, 88(x29)
                  lw  x23, 92(x29)
                  lw  x24, 96(x29)
                  lw  x25, 100(x29)
                  lw  x26, 104(x29)
                  lw  x27, 108(x29)
                  lw  x28, 112(x29)
                  lw  x29, 116(x29)
                  lw  x30, 120(x29)
                  lw  x31, 124(x29)
                  addi x29, x29, 128
                  add x4, x29, zero
                  lw  x29, (x4)
                  addi x4, x4, 4
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
