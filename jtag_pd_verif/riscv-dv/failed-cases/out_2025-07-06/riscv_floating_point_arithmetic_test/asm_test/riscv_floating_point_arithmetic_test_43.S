.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x30, h0_start
jalr x0, x30, 0
h0_start:
                  li x6, 0x40001120
                  csrw 0x301, x6
kernel_sp:        
                  la x12, kernel_stack_end

trap_vec_init:    
                  la x6, mtvec_handler
                  ori x6, x6, 1
                  csrw 0x305, x6 # MTVEC

mepc_setup:       
                  la x6, init
                  csrw 0x341, x6

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x6, 0x3800
                  csrw 0x300, x6 # MSTATUS
                  li x6, 0x0
                  csrw 0x304, x6 # MIE
                  mret
init:             
                  li x6, 2139095041
                  fmv.w.x f0, x6
                  li x6, 1610017076
                  fmv.w.x f1, x6
                  li x6, 4243008072
                  fmv.w.x f2, x6
                  li x6, 2147483648
                  fmv.w.x f3, x6
                  li x6, 5222598
                  fmv.w.x f4, x6
                  li x6, 242865517
                  fmv.w.x f5, x6
                  li x6, 2139095040
                  fmv.w.x f6, x6
                  li x6, 0
                  fmv.w.x f7, x6
                  li x6, 4286578688
                  fmv.w.x f8, x6
                  li x6, 2139095040
                  fmv.w.x f9, x6
                  li x6, 730733674
                  fmv.w.x f10, x6
                  li x6, 0
                  fmv.w.x f11, x6
                  li x6, 4286578687
                  fmv.w.x f12, x6
                  li x6, 2139095041
                  fmv.w.x f13, x6
                  li x6, 2139095041
                  fmv.w.x f14, x6
                  li x6, 3265410002
                  fmv.w.x f15, x6
                  li x6, 2987558
                  fmv.w.x f16, x6
                  li x6, 2139095040
                  fmv.w.x f17, x6
                  li x6, 3294006
                  fmv.w.x f18, x6
                  li x6, 4868442
                  fmv.w.x f19, x6
                  li x6, 2139095040
                  fmv.w.x f20, x6
                  li x6, 5508247
                  fmv.w.x f21, x6
                  li x6, 0
                  fmv.w.x f22, x6
                  li x6, 2139095041
                  fmv.w.x f23, x6
                  li x6, 2150733648
                  fmv.w.x f24, x6
                  li x6, 2150154990
                  fmv.w.x f25, x6
                  li x6, 2153673007
                  fmv.w.x f26, x6
                  li x6, 4286578687
                  fmv.w.x f27, x6
                  li x6, 2143289344
                  fmv.w.x f28, x6
                  li x6, 2139095040
                  fmv.w.x f29, x6
                  li x6, 4286578688
                  fmv.w.x f30, x6
                  li x6, 4286578688
                  fmv.w.x f31, x6
                  fsrmi 3
                  li x0, 0xf95051a7
                  li x1, 0xb310d8c5
                  li x2, 0x6
                  li x3, 0x0
                  li x4, 0x0
                  li x5, 0xf83b4e17
                  li x6, 0xf438e86b
                  li x7, 0x80000000
                  li x8, 0xf65c13f6
                  li x9, 0x4
                  li x10, 0xf0218735
                  li x11, 0x9
                  li x13, 0xa4b77fe1
                  li x14, 0xc
                  li x15, 0x5d51a2ec
                  li x16, 0xc1fe26ec
                  li x17, 0x0
                  li x19, 0x80000000
                  li x20, 0xf95428ad
                  li x21, 0x0
                  li x22, 0x80000000
                  li x23, 0xf9dddfbf
                  li x24, 0xf62a6f88
                  li x25, 0xfcc555e3
                  li x26, 0x1
                  li x27, 0x9
                  li x28, 0x80000000
                  li x29, 0x80000000
                  li x30, 0x6
                  li x31, 0xe3bfe5ee
                  la x18, user_stack_end
main:             rem          a4, a6, t3
                  andi         t1, s6, 1180
                  mul          s1, zero, zero
                  fcvt.s.wu    fs5, s9
                  fcvt.wu.s    a6, fs4, rdn
                  feq.s        t0, fs11, fs8
                  or           zero, t3, s10
                  mulhu        s10, s0, s1
                  fmul.s       fs4, fs0, fs6
                  fsgnj.s      ft2, fa3, fs4
                  remu         a1, s2, a4
                  or           sp, t2, t5
                  auipc        s11, 289334
                  mulhu        s1, s7, sp
                  mul          tp, s1, s4
                  andi         t4, s2, -943
                  fsgnj.s      ft2, fa7, ft5
                  slli         s11, ra, 27
                  fle.s        s7, fs5, fa3
                  fcvt.s.wu    fs6, sp, rmm
                  srli         s0, ra, 20
                  srli         s10, a6, 16
                  sub          t3, t1, s7
                  fsgnjn.s     ft1, ft8, fa7
                  nop
                  addi         t1, t4, -1504
                  srai         a3, gp, 17
                  fsgnj.s      ft11, ft8, ft6
                  srl          s3, s5, t4
                  slt          s8, s4, t4
                  xor          sp, s10, a6
                  fsqrt.s      fs2, fs9
                  addi         s0, a1, -764
                  fcvt.w.s     s0, fs2
                  mul          a5, a7, zero
                  andi         s7, a4, -315
                  flt.s        zero, fs11, ft5
                  mulh         a5, t5, a3
                  sll          tp, s9, t3
                  addi         a7, sp, 1067
                  mulhu        s8, a6, sp
                  srli         sp, t4, 25
                  fsgnj.s      fs10, ft4, ft5
                  sltiu        a6, a6, -669
                  slti         gp, a5, -665
                  remu         s1, gp, s3
                  sltu         s4, a6, t5
                  ori          tp, s11, 241
                  fmax.s       ft0, fa1, ft6
                  feq.s        a3, fs5, fs2
                  srli         s7, ra, 15
                  flt.s        a5, fs0, ft0
                  fcvt.wu.s    a5, fa3
                  fcvt.s.w     fa2, s1
                  addi         t3, t4, -1312
                  flt.s        s3, fs6, fs10
                  fsqrt.s      fa1, fs8
                  sltiu        s3, a2, -689
                  or           s11, s5, t0
                  mulh         a4, gp, s11
                  ori          a7, a2, -708
                  sltiu        s1, a1, -1200
                  divu         ra, t0, s2
                  fadd.s       fa2, fs4, fs4, rtz
                  fdiv.s       fs11, fs2, fa2, rtz
                  ori          gp, t6, -1045
                  fle.s        tp, fs11, ft0
                  and          a5, s11, s10
                  fcvt.s.w     ft5, a4
                  and          t1, s4, a0
                  rem          s8, a2, t4
                  fle.s        s3, fa0, fa3
                  andi         t0, t0, -1492
                  fcvt.wu.s    ra, fs7, rtz
                  add          a7, t3, a4
                  fle.s        a7, ft1, ft7
                  mulh         t4, t4, s7
                  fcvt.s.w     fa5, a1
                  sra          s1, a4, a2
                  add          a0, s6, s7
                  fmv.x.w      s9, fs1
                  mul          t3, a7, t4
                  ori          a0, a3, -148
                  fsgnj.s      fs6, ft10, fa2
                  srl          zero, a0, sp
                  slti         t1, t5, 70
                  ori          s10, s3, 1490
                  feq.s        t1, fa5, ft8
                  mulhsu       gp, a5, a0
                  mul          s5, s4, s10
                  fdiv.s       fa4, ft6, fs2, rup
                  fsub.s       ft1, ft4, fa6
                  fsqrt.s      fs10, fa3, rmm
                  nop
                  srli         sp, s8, 0
                  xor          t0, s5, s11
                  fsqrt.s      fs10, fs10, rne
                  fcvt.wu.s    s11, fs11, rtz
                  slt          tp, s6, t1
                  fle.s        s5, fs7, fs10
                  fmul.s       ft5, fs3, fa1
                  remu         sp, a1, a7
                  fcvt.w.s     a7, fs1, rmm
                  flt.s        gp, fs0, ft5
                  fcvt.s.w     fa4, a5, rtz
                  fmv.w.x      fs6, s3
                  nop
                  fmin.s       fa4, fs2, fs5
                  srl          tp, s10, s5
                  fcvt.s.w     fs11, a5, rne
                  fle.s        s7, fa3, ft4
                  feq.s        s3, fs7, ft9
                  srl          s3, a5, tp
                  div          tp, s1, s6
                  xor          s0, t6, gp
                  sltiu        s10, a3, -1566
                  sltu         s0, a5, a7
                  srl          t2, a2, zero
                  slt          s0, s5, tp
                  fcvt.w.s     s9, fa7, rtz
                  lui          s11, 708330
                  slt          s4, s8, a3
                  addi         tp, sp, 1399
                  mulhu        t4, s2, ra
                  flt.s        s9, fs4, fs2
                  xor          a6, s10, s1
                  divu         tp, s6, zero
                  rem          a7, t0, s5
                  fdiv.s       fa6, ft11, fs5, rmm
                  fmax.s       fa4, fa7, ft8
                  slti         s10, gp, 1534
                  slli         a6, sp, 22
                  sra          t0, a2, tp
                  mulhsu       a4, s2, s4
                  and          t1, s3, t0
                  feq.s        s10, fa0, fa1
                  xor          s11, s10, a7
                  xori         a7, s6, 1682
                  mulh         t4, s0, t3
                  remu         t2, t2, a1
                  srai         s7, t2, 31
                  fcvt.s.wu    fa6, t5, rtz
                  fmv.w.x      ft9, t6
                  xori         s6, s7, -1035
                  ori          s5, s11, -665
                  srai         t1, a6, 23
                  srl          s3, a5, a3
                  feq.s        tp, fs11, fs5
                  lui          t3, 666473
                  sub          t0, t5, s0
                  fsqrt.s      fs6, fs0, rdn
                  mul          a1, s5, a1
                  remu         sp, sp, t0
                  fmv.x.w      a3, fa3
                  mul          s0, tp, ra
                  or           s5, t0, a4
                  fsgnjx.s     fa1, fa0, ft3
                  rem          t0, s3, s7
                  fmv.x.w      s5, ft9
                  srai         s7, a4, 15
                  srl          a6, a1, tp
                  mulhu        a7, s0, zero
                  fmv.x.w      t0, ft7
                  xori         gp, s4, -1866
                  slti         s11, zero, -341
                  fsgnjn.s     fa6, ft6, fa3
                  srli         s10, a3, 5
                  fsgnjn.s     fs0, fa7, fs7
                  fsgnjn.s     fs7, fa3, fs9
                  ori          t0, s1, 773
                  slti         ra, t6, 1744
                  rem          a6, t5, s5
                  remu         s5, s1, a0
                  slti         s7, a1, 2030
                  xori         s10, tp, -266
                  mul          s9, zero, s11
                  lui          t4, 763119
                  sra          t3, tp, s9
                  feq.s        s1, fa3, fs2
                  fmul.s       fa5, fa6, fs11
                  rem          s1, a3, ra
                  andi         s11, zero, 54
                  srl          s3, gp, t2
                  div          a6, s4, s11
                  fdiv.s       fs11, fa6, ft8
                  fsgnj.s      ft4, ft4, ft1
                  div          s10, s9, s10
                  srl          s3, s7, s5
                  div          t0, s7, t3
                  div          s3, s5, t5
                  srli         a0, s9, 6
                  slt          tp, ra, a7
                  sll          s9, a6, s1
                  div          a1, s3, gp
                  fmul.s       ft0, ft1, fs5
                  slt          sp, s8, a2
                  div          s0, s5, a7
                  div          a1, ra, a0
                  auipc        a0, 398138
                  lui          s1, 141054
                  feq.s        gp, ft8, fs4
                  div          s10, s3, a1
                  xori         a5, t5, 1413
                  mulhu        sp, t5, t5
                  slt          s5, a3, a4
                  mul          a4, a3, zero
                  fadd.s       fs5, ft1, fs3, rdn
                  srai         zero, s4, 29
                  ori          t3, gp, 1416
                  flt.s        s4, ft10, fa3
                  xor          s8, t6, gp
                  slli         s1, t5, 30
                  fsgnjx.s     fs9, fs8, fs11
                  fcvt.w.s     a1, fs4, rne
                  div          a7, a0, s2
                  auipc        s6, 536283
                  ori          t3, s0, 1509
                  ori          s1, t5, -452
                  remu         a5, s0, a2
                  fcvt.wu.s    t6, ft10, rne
                  add          s5, a0, t5
                  sltiu        s11, s5, -44
                  auipc        t2, 534553
                  divu         s6, a6, t4
                  andi         s4, a4, -938
                  sltu         zero, s0, sp
                  add          sp, a4, t1
                  sub          s7, t5, a4
                  addi         s5, t3, 1571
                  srai         a6, a7, 5
                  add          t2, zero, t0
                  fsgnjn.s     fs0, fa5, fa6
                  sltu         ra, s6, a3
                  or           a0, t2, a4
                  fle.s        ra, fa1, fs2
                  sltu         t4, a4, t3
                  fsgnj.s      fs7, fs10, fs6
                  flt.s        s10, ft11, ft6
                  ori          s11, t4, 459
                  fmv.w.x      ft4, a2
                  fcvt.w.s     s9, ft11
                  fsgnjx.s     fs10, ft4, ft11
                  nop
                  div          a3, t1, t2
                  rem          s5, t6, t4
                  sub          s4, s0, s9
                  sra          s7, t2, a1
                  srai         s7, s8, 29
                  fcvt.wu.s    tp, ft8, rne
                  auipc        s0, 769099
                  fdiv.s       ft7, ft5, ft10, rne
                  sll          s7, t4, s4
                  xor          zero, zero, a0
                  fsqrt.s      fs2, fs1, rtz
                  and          a0, gp, s11
                  add          t0, zero, s10
                  andi         s11, a3, 1386
                  fsgnjn.s     fs0, fa3, fs2
                  fsgnjx.s     ft10, fa3, fs9
                  fsub.s       fs1, fa5, ft2, rdn
                  fsqrt.s      ft1, ft0
                  xor          t1, a4, a2
                  div          gp, a7, t5
                  fsgnjx.s     fa7, fa3, ft4
                  fcvt.w.s     a0, fs4
                  fsqrt.s      ft0, fa3
                  fsgnjx.s     fs8, fs1, fs7
                  add          t0, s4, a4
                  rem          s9, a5, t4
                  lui          s6, 424033
                  auipc        a5, 148376
                  slt          t1, s9, t0
                  fcvt.s.w     fa5, t6
                  xor          s7, t3, gp
                  slt          a0, s0, a5
                  fcvt.s.w     ft3, s4
                  fsgnjn.s     fs11, fa3, fs5
                  fsgnjn.s     ft8, fa6, fs9
                  slli         tp, sp, 12
                  fmul.s       fs1, fa4, fa3, rne
                  fsgnjx.s     ft10, ft3, ft9
                  auipc        tp, 501846
                  mulhsu       a0, ra, t6
                  sub          s8, s2, s1
                  fmul.s       fa7, fa0, fa7
                  xori         a0, gp, 766
                  fcvt.wu.s    s10, fa4
                  fcvt.w.s     s9, ft8, rtz
                  mulh         t4, tp, s2
                  andi         s1, t5, -101
                  div          s3, s1, t3
                  andi         s4, t4, -1221
                  srl          s7, s4, sp
                  or           t0, a4, a6
                  srl          s3, s11, t6
                  fcvt.s.wu    fa1, a7
                  lui          gp, 759553
                  add          a6, t0, s2
                  fsgnjx.s     fs2, fs1, fs5
                  divu         zero, t0, s1
                  andi         a3, t1, 1202
                  srai         t3, gp, 4
                  sub          a1, s6, a7
                  fmin.s       fa6, fa6, fa5
                  fmin.s       ft9, fa1, ft0
                  fle.s        a0, fa7, ft2
                  sltiu        t1, s5, -2024
                  sll          a0, s9, a1
                  fsgnjn.s     ft0, fs9, ft2
                  fcvt.wu.s    t1, fa7
                  addi         sp, a3, 1534
                  sltu         sp, a1, a4
                  sub          s3, gp, t3
                  fsgnjx.s     fs4, fs11, ft0
                  lui          s11, 610886
                  fsqrt.s      fs8, fs6
                  ori          s4, tp, 846
                  fmin.s       fs11, fa1, fa5
                  divu         s5, a7, a5
                  or           s0, t0, s1
                  fsub.s       fa6, ft7, fs0, rtz
                  ori          a5, a3, -291
                  fcvt.s.wu    fs1, s1
                  mulhu        s10, gp, ra
                  fmul.s       fs7, fs7, fs10, rup
                  fcvt.wu.s    s10, fs5
                  fsgnjn.s     fs0, fs7, fs5
                  fsgnj.s      ft5, ft3, fs9
                  fsgnjx.s     fs10, fs10, fs7
                  slt          a1, t5, a4
                  slli         s7, ra, 27
                  or           t1, s9, a6
                  fdiv.s       ft4, ft9, ft0, rmm
                  divu         s11, a7, t4
                  auipc        s1, 547675
                  fcvt.wu.s    s10, fs6
                  sltu         s11, a3, t1
                  srai         t3, a7, 19
                  feq.s        a3, fa7, fs9
                  fmin.s       fs11, ft4, fa3
                  fsgnjx.s     fa3, fs5, fa3
                  addi         t6, t3, -1172
                  sltu         zero, a0, a0
                  sltiu        ra, s6, -234
                  flt.s        s5, fs4, fs6
                  nop
                  fsgnj.s      fa7, ft9, fs6
                  srli         zero, s6, 1
                  fcvt.s.w     fs11, a0
                  andi         tp, s11, -329
                  fmv.x.w      a6, ft9
                  srai         s5, s8, 0
                  and          s5, s8, a1
                  sub          t4, s6, a1
                  flt.s        a0, fs6, fs10
                  rem          s7, a4, s9
                  auipc        s7, 409248
                  remu         a6, s1, a4
                  srli         t0, s0, 19
                  add          t3, a2, gp
                  fmax.s       fa0, fa5, fa7
                  fmin.s       fs2, ft10, fs1
                  fcvt.w.s     ra, ft8
                  fmv.w.x      fs8, ra
                  srli         s11, a3, 2
                  sll          gp, gp, t0
                  fmul.s       fs10, fs8, ft5, rtz
                  fcvt.w.s     s7, ft8
                  and          a3, s11, t5
                  andi         t4, s7, -296
                  andi         ra, ra, 1786
                  xor          s4, s5, s5
                  fsqrt.s      fa3, ft1
                  srli         t1, s4, 19
                  mulhu        s4, t5, s6
                  addi         t4, a6, -1043
                  fsgnj.s      fs10, ft2, fs1
                  divu         t0, s5, s5
                  fclass.s     s3, fa0
                  fmul.s       fs0, fa4, ft4
                  mulhu        s8, gp, a7
                  fcvt.wu.s    s11, ft6
                  fmin.s       fa3, ft4, ft6
                  fsgnjx.s     fs8, ft0, ft10
                  or           s9, t0, a2
                  sub          a4, t2, s0
                  sll          s4, a5, tp
                  xori         a5, s4, 1188
                  addi         t6, s2, -1509
                  lui          s4, 443817
                  flt.s        t3, fs1, ft8
                  slli         ra, t6, 0
                  add          s9, s4, s0
                  mulh         s11, s8, a1
                  fle.s        a0, ft9, ft9
                  fsgnj.s      ft4, ft1, ft11
                  srli         sp, a6, 10
                  fcvt.s.wu    fs3, a0, rtz
                  and          t6, s4, s2
                  fsgnjn.s     fa2, fs7, fs6
                  remu         s6, a1, gp
                  fadd.s       fs2, fa5, fs5, rtz
                  srli         s9, s0, 17
                  fle.s        s6, ft8, ft11
                  fsgnjx.s     ft1, fs0, ft6
                  fsgnj.s      ft9, fs4, fa0
                  ori          s5, a4, -991
                  fmax.s       fs0, ft8, fa7
                  remu         s3, gp, t0
                  fcvt.wu.s    s8, fa3, rup
                  fle.s        s7, fs1, fs3
                  sll          s6, gp, s11
                  fcvt.s.w     fs2, s1, rup
                  srl          a0, a1, s2
                  mulh         s9, t0, s1
                  fmax.s       ft11, ft6, ft0
                  fclass.s     tp, fa4
                  auipc        s3, 438010
                  div          s10, s9, s2
                  fcvt.wu.s    s11, fs6, rne
                  fmul.s       fs2, fa1, ft10
                  srli         t4, a2, 17
                  fle.s        zero, fs2, fa0
                  lui          s7, 686797
                  sltiu        s6, s2, -708
                  mul          s7, a3, a3
                  srai         zero, a6, 7
                  fcvt.w.s     tp, fs3, rmm
                  add          zero, s0, s7
                  fsgnjn.s     ft10, ft11, ft2
                  lui          a7, 237056
                  mul          a6, s10, a3
                  fmin.s       fs5, fa4, fs3
                  addi         s11, t4, 643
                  xor          s3, s11, a4
                  xor          s5, a0, gp
                  srli         s8, a6, 16
                  srai         s10, s2, 25
                  andi         a7, a6, 1280
                  nop
                  sltu         t4, t2, s6
                  andi         a7, t6, -1000
                  fmax.s       ft7, fa3, ft11
                  slt          t4, a6, s8
                  fcvt.w.s     a4, ft1
                  andi         s10, s7, 1975
                  srli         gp, s3, 8
                  sll          s10, t1, s8
                  sra          s6, s4, gp
                  fmax.s       fa3, fs5, fa1
                  xor          s8, a5, s1
                  mul          s6, s1, t0
                  srai         s4, a3, 20
                  sub          a0, s2, s0
                  mulh         a4, s8, s0
                  mulh         s6, ra, a2
                  sub          s3, a1, t1
                  slt          s8, s9, a2
                  andi         s10, a4, -871
                  mul          a6, a3, t2
                  fmv.x.w      t1, ft7
                  fsub.s       fs11, fs9, fs1
                  fsgnj.s      ft6, fa0, ft10
                  srl          gp, s2, s2
                  remu         s4, a4, a7
                  fmax.s       fa4, ft2, fs10
                  or           s0, ra, t3
                  sll          sp, a3, s3
                  addi         s5, s7, -1826
                  or           s1, a1, sp
                  sltiu        s4, zero, -1498
                  fsgnjx.s     ft1, fs2, fs5
                  flt.s        t6, ft7, ft5
                  sltu         s8, s3, a7
                  andi         a7, s3, -1044
                  div          s9, s2, t0
                  sltu         s10, s3, s7
                  fmv.x.w      s11, fa5
                  srai         s8, s11, 21
                  and          t1, s11, s8
                  addi         ra, a1, 37
                  fle.s        s6, fs4, fa0
                  lui          ra, 451886
                  fclass.s     t2, ft4
                  sub          s0, s4, a2
                  sll          ra, t3, s8
                  fclass.s     s7, ft9
                  fsqrt.s      ft8, fa7
                  fcvt.w.s     s8, ft1, rmm
                  div          t4, t5, gp
                  remu         a7, t1, a1
                  sub          zero, a3, ra
                  srai         sp, t2, 21
                  or           a4, ra, s10
                  fsgnjn.s     fs6, ft9, fs5
                  fsgnjx.s     fs11, ft11, fa4
                  mul          ra, t0, t1
                  mulhsu       ra, ra, s10
                  fsgnjn.s     fs5, fs1, ft8
                  flt.s        ra, fa6, fs8
                  fmv.w.x      fa2, a6
                  sltiu        s10, s2, 1370
                  rem          s10, s8, t1
                  srai         t0, s2, 25
                  srai         t1, a6, 6
                  mulhsu       s8, s7, a7
                  remu         s1, t2, s10
                  fsub.s       fs0, ft11, fs7
                  fadd.s       fa1, fa6, fs2, rup
                  fsgnjx.s     fs10, ft10, fa1
                  sltiu        t4, t0, -1768
                  fmv.w.x      fs4, s9
                  addi         t6, a5, -1059
                  fadd.s       fs6, fa0, fa6
                  divu         a7, a7, s3
                  fmul.s       ft0, ft6, fs8, rdn
                  auipc        a0, 354207
                  flt.s        s1, fa4, fs4
                  fmv.w.x      fs10, s1
                  xor          gp, sp, s0
                  fmin.s       fs10, fs4, fs9
                  nop
                  add          s3, t6, a3
                  fsgnjx.s     ft2, fs3, ft8
                  fsgnjx.s     fs1, fa0, ft0
                  fcvt.w.s     a0, ft11
                  rem          s4, a4, a6
                  div          s6, s9, s11
                  nop
                  sltu         t3, t5, s11
                  andi         t6, a2, -112
                  andi         s3, s7, 1864
                  fmv.w.x      fa5, s1
                  fmv.w.x      fs1, a2
                  xor          a5, s5, s5
                  remu         s6, s4, a2
                  sltu         s1, s4, a6
                  fsqrt.s      ft2, ft6, rup
                  sltiu        s1, gp, 656
                  div          a0, t3, gp
                  fmin.s       fs5, fa4, ft1
                  mul          s6, sp, sp
                  mulhsu       s0, s9, s8
                  remu         s0, t5, t3
                  div          a6, s11, a5
                  xori         s3, sp, 1264
                  fmv.x.w      sp, fa3
                  nop
                  srl          s1, t4, t6
                  fsgnjx.s     ft4, fs4, fa2
                  fmv.x.w      t3, fs6
                  xori         a6, s4, 189
                  fcvt.wu.s    s3, ft10, rup
                  fmv.w.x      fs8, t0
                  feq.s        t3, ft6, fs9
                  fmv.w.x      ft11, s0
                  fdiv.s       ft6, fs3, ft3, rmm
                  ori          tp, gp, 1356
                  fadd.s       fa0, ft5, fs8
                  ori          s1, s1, 627
                  fsqrt.s      fa3, fs4
                  fsgnjx.s     ft3, fa7, ft6
                  xori         s0, s2, 1294
                  xori         s5, s11, 1817
                  slt          s1, tp, a2
                  ori          sp, a4, -1686
                  fmv.w.x      fs1, s2
                  fmax.s       fs9, fs10, ft0
                  sll          t4, t4, ra
                  divu         sp, a0, t4
                  auipc        a6, 381630
                  slli         s7, a1, 15
                  sll          a7, t6, t3
                  mul          a3, s2, a7
                  fmax.s       ft9, fa4, fs4
                  andi         s11, t4, -1707
                  sltiu        a7, t5, 362
                  sub          a4, a7, s8
                  add          a5, t0, a4
                  xori         zero, s4, -659
                  mulhsu       a1, t2, s3
                  slti         s7, gp, -1006
                  sra          zero, t6, s0
                  mulhu        s0, s9, s10
                  fadd.s       ft2, ft10, ft3
                  flt.s        a5, fa0, ft1
                  mulh         t1, t2, s9
                  mulhsu       s8, t5, s8
                  lui          a6, 903507
                  lui          a3, 525419
                  fle.s        a0, fs5, ft11
                  auipc        t3, 276439
                  rem          t6, t5, a0
                  xori         a1, s10, -599
                  fmv.x.w      s9, fs6
                  fmax.s       fs10, fa4, ft4
                  srli         tp, s5, 24
                  slli         s4, a3, 21
                  fdiv.s       fs2, ft4, ft3
                  mulh         a3, a3, a1
                  sra          s9, ra, t4
                  fmv.x.w      t2, fs11
                  xori         s8, sp, -1838
                  and          s7, t0, s2
                  remu         t1, t6, s4
                  fcvt.s.wu    fa4, a2, rdn
                  add          t6, a5, t1
                  mulhsu       a3, t0, s6
                  srai         a7, a7, 6
                  divu         s0, a4, s11
                  or           s3, s1, s2
                  addi         a3, a4, -238
                  remu         s1, ra, ra
                  lui          s11, 586357
                  fadd.s       ft9, fs4, ft1
                  slt          t4, a3, s2
                  mulhu        a0, s10, sp
                  srl          zero, s11, t1
                  fsgnjn.s     fs0, ft4, fs1
                  sra          tp, t1, a2
                  rem          s5, s9, t1
                  sll          s3, ra, ra
                  ori          a7, t3, -191
                  or           tp, s11, s6
                  fclass.s     a7, fs4
                  fsub.s       ft4, fs5, ft10
                  fmin.s       ft8, fa3, fs9
                  add          s0, t6, ra
                  mul          a7, tp, t5
                  fdiv.s       ft0, fa5, ft5, rne
                  feq.s        s5, fs1, ft0
                  sra          a3, s6, t1
                  divu         a1, s1, t2
                  sra          s7, ra, s0
                  andi         sp, t1, -26
                  mulhsu       t4, s7, a1
                  fmv.w.x      ft9, s11
                  fcvt.wu.s    s10, ft9, rdn
                  fdiv.s       ft8, fs11, ft2, rne
                  mulhu        a7, s3, t1
                  fmv.w.x      fs3, s3
                  div          a1, t0, s5
                  fdiv.s       fa5, fa1, ft8
                  flt.s        s8, fa4, fs5
                  fclass.s     t6, ft6
                  sra          sp, sp, a4
                  ori          s7, sp, 1847
                  mul          s7, t5, a1
                  fdiv.s       ft10, fs5, fa3
                  fclass.s     s10, fs3
                  srai         s4, s3, 6
                  xori         s5, s1, -431
                  ori          tp, a2, -1672
                  fsgnjn.s     fa1, ft6, fa0
                  nop
                  andi         s9, s0, 313
                  srai         a4, s11, 1
                  mulhsu       s6, a5, ra
                  and          s5, s6, s1
                  or           a3, a1, s6
                  remu         gp, s2, s6
                  sltu         s9, s10, t6
                  sltiu        a3, s5, -138
                  fsgnjx.s     fs9, fa4, ft10
                  fsgnj.s      fs10, fs9, fa2
                  fcvt.s.wu    fs9, t0, rtz
                  sub          gp, zero, gp
                  fcvt.w.s     s9, ft0
                  divu         s8, ra, s11
                  rem          s11, a6, s2
                  fmin.s       fa0, ft3, fs0
                  or           a4, s3, zero
                  fadd.s       fs6, ft7, ft4
                  remu         a7, gp, a7
                  slti         s3, ra, -405
                  fsgnjx.s     fs8, fs5, fa4
                  sll          t6, tp, s6
                  and          a0, a7, s7
                  sltiu        ra, t2, 891
                  sll          sp, s9, s11
                  srl          s7, s1, t3
                  mulhsu       a4, s7, zero
                  nop
                  rem          t4, s11, s8
                  or           s3, t1, gp
                  feq.s        t2, ft2, fa2
                  fmin.s       fa5, fs2, fa3
                  add          gp, s4, ra
                  sll          t3, t5, s0
                  fsub.s       ft9, fs1, fs6
                  mulh         sp, s8, t3
                  fsgnjn.s     ft8, ft7, ft3
                  fcvt.s.wu    fa7, s11, rdn
                  sltiu        gp, t3, -153
                  sra          s6, s1, s0
                  nop
                  slli         s11, sp, 15
                  xor          a6, a5, ra
                  rem          t4, s7, t2
                  mulhu        s11, a6, s11
                  and          ra, s5, s11
                  fsqrt.s      fa1, fs0
                  ori          ra, gp, -708
                  fcvt.s.wu    fs3, zero, rmm
                  fcvt.wu.s    t3, ft7, rmm
                  fle.s        s3, fs11, ft4
                  div          sp, s3, t5
                  sltiu        t6, tp, -303
                  flt.s        zero, ft8, fs3
                  slti         t4, s3, -1220
                  sltu         a4, s8, zero
                  fcvt.w.s     gp, ft3
                  flt.s        s11, fa2, fs8
                  fmul.s       fa5, fs1, ft8, rdn
                  srli         s3, t4, 14
                  fcvt.s.w     fs0, a1
                  fmv.x.w      a1, ft0
                  slti         s8, a5, 1991
                  fmul.s       fa2, fa7, fs4
                  add          t4, zero, gp
                  sltu         a1, gp, t2
                  or           tp, gp, s11
                  xor          t4, s2, a6
                  fle.s        s6, fs10, fs11
                  sll          s8, s10, t2
                  addi         t2, t1, 628
                  ori          tp, s3, 1140
                  divu         a0, zero, t1
                  fle.s        s3, ft9, fa5
                  andi         s9, s7, 1611
                  rem          a6, a1, s0
                  fsub.s       fs4, fs0, fa7, rmm
                  fcvt.s.w     ft2, t6
                  or           s8, s11, t1
                  mulhu        s4, a5, s2
                  auipc        s1, 858160
                  lui          s5, 592230
                  and          a1, t1, sp
                  fadd.s       fs1, ft7, fa2, rmm
                  mul          s0, s8, a6
                  fcvt.s.wu    ft5, t2
                  sltu         t4, a3, s9
                  fsgnjn.s     fa5, ft6, fs9
                  xori         gp, s9, -2037
                  fsub.s       ft6, fa2, ft1, rtz
                  nop
                  rem          a3, gp, s4
                  andi         s8, s11, -1715
                  sltiu        t0, s8, -447
                  xor          s7, t3, t1
                  divu         ra, t4, t1
                  fclass.s     tp, fa3
                  xor          s1, s8, s5
                  srai         s5, s7, 6
                  fle.s        s7, fa0, fs1
                  fcvt.s.wu    fs10, zero
                  fsgnjn.s     ft10, fa7, fs3
                  sra          s10, ra, tp
                  fadd.s       ft10, fs4, fs7
                  fsgnjx.s     fs10, fs8, fs6
                  fcvt.wu.s    tp, ft1
                  xor          s5, a5, s11
                  fmv.w.x      ft2, s0
                  mul          t3, a4, s2
                  sub          a3, s11, s0
                  mulh         t4, s0, s1
                  fsgnjn.s     ft10, fa3, ft4
                  slti         s8, t3, 1432
                  fdiv.s       fa2, fa3, fs2, rmm
                  fmin.s       fa1, fa3, ft6
                  feq.s        a0, fa1, ft2
                  fsub.s       ft10, fa4, fs9, rtz
                  fcvt.s.wu    ft0, s8
                  mul          a5, s1, a0
                  fsqrt.s      fs11, fa7
                  fcvt.s.w     fa5, a1
                  lui          s3, 995912
                  fmin.s       fs3, ft11, ft6
                  lui          sp, 443978
                  sub          s8, t2, s1
                  fcvt.wu.s    t2, ft5, rmm
                  fsgnjn.s     fs9, fs2, ft6
                  nop
                  fdiv.s       fs1, fa2, ft2, rne
                  slt          a0, a5, s8
                  slt          s10, a6, s2
                  or           s3, a6, t6
                  fle.s        t4, fs6, fs10
                  fsgnjx.s     fs9, fs8, fs7
                  mulhsu       ra, a0, s0
                  fcvt.w.s     s9, fa5, rtz
                  fmul.s       fa2, fs4, fs0, rdn
                  fmul.s       ft8, fa0, ft9
                  and          a6, s5, t5
                  or           s3, a1, a7
                  and          t2, a1, sp
                  mulh         s10, a2, gp
                  flt.s        t0, ft1, fa3
                  fcvt.wu.s    t4, fa6, rdn
                  fdiv.s       ft4, fa7, fa3, rup
                  fcvt.wu.s    t1, fs5
                  fsqrt.s      fa2, fs2
                  fmin.s       ft8, fs10, fs4
                  lui          a3, 611763
                  flt.s        a1, fs11, fs0
                  mul          s9, a3, s5
                  lui          a0, 663751
                  add          s5, tp, tp
                  fsqrt.s      ft4, ft9
                  auipc        zero, 550368
                  fmv.x.w      zero, fa0
                  fmax.s       ft0, fs7, fa4
                  slt          s4, t5, a5
                  srai         s9, s3, 28
                  or           s11, t1, s11
                  slli         zero, t2, 14
                  fsgnjn.s     fs8, ft3, ft6
                  slt          gp, ra, gp
                  fsub.s       fs6, ft1, fs1, rup
                  mulh         t4, s6, a7
                  slti         s4, a5, -1526
                  div          t1, s4, t3
                  add          t6, ra, zero
                  fle.s        gp, fs1, fa0
                  xor          a0, t3, s1
                  fmv.x.w      a4, fa0
                  ori          a3, s4, 1529
                  addi         t6, a0, 363
                  fmul.s       ft6, fs2, ft5, rmm
                  sll          s5, a3, gp
                  fdiv.s       fa0, ft1, fs11
                  add          s7, t2, s1
                  fsub.s       fa1, ft1, ft9, rtz
                  remu         s9, s7, t1
                  fmax.s       fs11, fa4, ft7
                  fcvt.s.w     fa5, a4
                  div          t4, t3, tp
                  fsgnj.s      fa7, ft10, ft3
                  xori         s9, s10, 1287
                  nop
                  xori         s3, t5, 818
                  fcvt.wu.s    s0, fs7
                  fsqrt.s      fa5, fs8, rtz
                  sra          s1, s11, a7
                  fsgnj.s      ft11, fa2, fa7
                  fsgnjn.s     ft6, fs10, fs7
                  mulhsu       s5, zero, a4
                  slli         t3, s3, 1
                  srli         a0, s10, 14
                  srli         a4, t2, 29
                  srl          t6, s7, t3
                  flt.s        s4, fa0, fa1
                  or           s10, a7, gp
                  fdiv.s       fa2, fs9, fs9
                  nop
                  fcvt.wu.s    t2, fa3, rne
                  sltiu        sp, s3, -646
                  fclass.s     ra, ft8
                  fmax.s       fs11, fa1, fa7
                  rem          s7, s9, t5
                  fcvt.w.s     s7, fa4, rtz
                  sra          s9, s6, a1
                  remu         s7, s7, t3
                  slt          s4, s6, t4
                  srai         t3, t4, 20
                  xori         a6, t6, 588
                  fmul.s       fs2, fs11, fa4
                  fsub.s       fa5, fa5, ft0, rup
                  srli         a5, a1, 22
                  auipc        s10, 815371
                  fcvt.w.s     t6, fs0, rup
                  mulh         s10, s3, t0
                  auipc        t0, 1013619
                  slli         t0, tp, 26
                  fmin.s       fa4, fa3, ft6
                  fmul.s       fs6, ft9, fs7
                  fsgnjn.s     fs0, fa2, fs6
                  mul          t0, s3, s11
                  addi         s0, gp, 817
                  andi         sp, t5, -162
                  xor          s11, t3, s7
                  auipc        s7, 977189
                  and          t2, s10, t6
                  xor          sp, a3, t3
                  auipc        a3, 815973
                  sub          s9, t4, sp
                  fsgnjx.s     fa5, fa2, fs1
                  fcvt.s.w     fs6, a1
                  fsgnjx.s     ft2, fs9, ft11
                  fsub.s       ft3, ft3, fs3
                  div          tp, ra, s8
                  slt          s3, a5, a5
                  addi         a6, s7, 46
                  xori         a5, sp, 209
                  fcvt.s.wu    ft9, s0, rup
                  srai         s0, ra, 22
                  ori          s5, a5, 1053
                  sub          t2, a1, s6
                  xor          s4, s5, s5
                  addi         s1, t6, 1189
                  mulhsu       a4, s4, a3
                  sltiu        s8, t5, -362
                  fsgnjx.s     fa5, fs8, ft2
                  xor          s10, s1, gp
                  fclass.s     a7, ft3
                  sub          s8, s9, t0
                  slt          tp, t6, s7
                  remu         t4, a6, s0
                  mulhsu       s6, sp, s11
                  fmv.x.w      s10, fs1
                  fsub.s       fs8, fa1, fs11, rne
                  fmul.s       fs10, ft10, fa7
                  fsgnjx.s     fs4, fs3, fs6
                  sltiu        a3, s1, 1135
                  auipc        a1, 849174
                  fsgnjn.s     fs7, ft10, fa5
                  sll          tp, t3, a2
                  xor          zero, t4, s2
                  fmv.w.x      fs4, sp
                  auipc        s11, 483130
                  fmin.s       ft7, fa7, ft0
                  fmax.s       fa3, fa3, ft5
                  add          a1, t6, s4
                  fle.s        a4, fs0, fa0
                  nop
                  remu         a0, tp, t5
                  fsgnj.s      fa7, fa4, fa2
                  auipc        sp, 521081
                  divu         t6, a0, gp
                  fdiv.s       fs0, ft1, fa2, rne
                  lui          ra, 604463
                  fsqrt.s      fs0, fs3
                  slti         a3, s8, 769
                  fdiv.s       fa7, ft0, ft0
                  fsub.s       ft3, ft4, ft4
                  or           t2, s9, t3
                  fmul.s       fs6, ft7, ft8, rne
                  fmin.s       fa3, fs4, fa2
                  srai         a6, a3, 11
                  feq.s        s6, fa5, fs10
                  fmul.s       ft5, fs1, ft7, rne
                  divu         s11, s3, tp
                  sltiu        s11, s3, -894
                  fsub.s       fs2, ft1, fs1, rtz
                  fadd.s       fs6, ft8, ft7
                  feq.s        t2, ft3, fs0
                  srl          tp, a2, t1
                  mulhu        s4, t0, s8
                  slt          s7, t3, tp
                  fcvt.s.w     ft2, a1
                  add          t4, a0, s11
                  andi         t3, s3, -1620
                  fadd.s       ft3, fs8, fa0, rtz
                  fsgnjn.s     ft5, fs11, ft6
                  fcvt.s.w     ft1, s11, rmm
                  srli         a6, a1, 19
                  fmin.s       ft5, ft4, fs0
                  fclass.s     s8, fa0
                  srli         s3, s2, 17
                  srli         t1, s10, 30
                  fsub.s       fa3, fa1, fs3
                  fsqrt.s      fa0, fs5
                  fmin.s       fs6, ft7, fs8
                  lui          sp, 98167
                  lui          s1, 236104
                  fclass.s     ra, fs10
                  ori          s10, a6, 1938
                  fcvt.s.wu    fa1, s10, rtz
                  fmul.s       ft2, ft5, fa0
                  fcvt.wu.s    a1, fs1
                  fmul.s       fa1, ft10, fa4, rmm
                  fcvt.s.w     fs8, s6, rtz
                  mul          a6, s0, s5
                  ori          a4, s11, -1507
                  fsgnjn.s     ft9, ft2, fa4
                  and          s9, sp, gp
                  slli         s9, s10, 17
                  srai         a5, t5, 28
                  sra          s4, t0, a3
                  addi         a6, t4, 1711
                  slti         a1, a1, -933
                  srli         gp, a5, 30
                  srli         gp, tp, 7
                  divu         t3, s4, s2
                  fcvt.s.wu    ft9, s7
                  srl          s9, a7, a3
                  nop
                  ori          s6, t6, -1565
                  fsgnjx.s     fa0, fs6, fa6
                  fle.s        a4, fs5, fa4
                  auipc        s7, 344335
                  fmv.w.x      ft9, t3
                  fmv.x.w      s7, fa3
                  srl          t3, gp, t2
                  add          s8, s2, s3
                  fcvt.s.w     fa5, s10, rtz
                  sll          t0, t4, s1
                  sltu         a3, t6, s2
                  addi         s4, t0, -1684
                  remu         ra, t0, t0
                  fsgnjx.s     fs0, ft10, ft10
                  fmv.w.x      fa4, a4
                  sub          t2, a3, a7
                  fcvt.s.wu    fs1, s4
                  fsgnjx.s     fs9, fs10, fs9
                  fsqrt.s      ft2, ft3, rtz
                  srli         t3, t0, 11
                  slt          a5, s6, t5
                  mul          t2, t3, a2
                  rem          s7, t4, a3
                  feq.s        t6, fs1, fs2
                  sltiu        s8, t5, 1998
                  mul          a0, t6, tp
                  sltiu        s11, t3, 1807
                  srl          s9, a5, tp
                  addi         s3, t0, -1318
                  srli         gp, sp, 12
                  slt          s1, s1, s0
                  div          a1, a6, zero
                  remu         s1, a0, a3
                  fsqrt.s      ft0, ft5, rmm
                  sltiu        a5, s5, 1346
                  fsub.s       fa4, fs10, ft4, rne
                  xor          s10, s6, t6
                  nop
                  xori         s0, t3, -203
                  fmin.s       ft11, fs4, ft7
                  fsgnj.s      fs11, ft1, fs4
                  fsgnj.s      fa7, fa4, fs11
                  slt          s9, gp, s9
                  rem          s5, s9, t5
                  fmv.w.x      ft7, s6
                  fclass.s     s8, ft3
                  mulhsu       tp, s7, s5
                  fsgnjn.s     ft3, ft5, ft0
                  fmax.s       ft6, fa5, fs1
                  fcvt.wu.s    gp, fa3
                  fmul.s       ft5, ft11, fs8
                  flt.s        gp, fs0, fs4
                  fdiv.s       ft10, fa3, fs0
                  fle.s        a3, ft9, fa6
                  srl          ra, s11, a4
                  fmax.s       fs9, ft9, fs7
                  sltiu        a7, t3, -1423
                  fclass.s     a0, ft11
                  fmv.x.w      a7, ft4
                  fcvt.w.s     t1, fs6, rtz
                  and          t0, a6, s4
                  fclass.s     zero, fs0
                  mul          s5, s0, ra
                  ori          s5, a3, 675
                  nop
                  add          s6, t2, s2
                  or           a7, a4, s9
                  sltu         t2, a6, a2
                  ori          s10, a3, 311
                  fmax.s       fs7, fa2, fs4
                  fsgnj.s      fs3, fs10, ft2
                  ori          s0, s6, 1108
                  srai         s7, a2, 5
                  auipc        t1, 475761
                  fcvt.s.w     ft6, s6
                  fmax.s       fs6, fa1, fs6
                  fmv.x.w      a5, fs1
                  fsgnj.s      fs7, fs8, fa2
                  lui          t0, 637268
                  sra          s5, s11, zero
                  flt.s        s4, ft0, fa2
                  fmv.x.w      t3, fs7
                  fmax.s       fa4, ft11, fs3
                  andi         s8, s7, 822
                  fcvt.s.w     fs10, s10
                  fsgnjn.s     ft2, fs3, fs3
                  remu         t2, s1, s1
                  and          a0, t1, gp
                  fmv.x.w      s6, fa0
                  nop
                  and          a3, zero, t4
                  fclass.s     s8, fa3
                  xori         a5, tp, -1524
                  sll          a4, s5, t4
                  fdiv.s       fa1, fs6, fs3, rtz
                  sltiu        s3, ra, -1891
                  slti         s1, t2, 537
                  sltiu        t0, a1, 1802
                  remu         s4, a2, a3
                  fcvt.s.wu    fs3, zero
                  fcvt.s.w     fs10, a1, rmm
                  fmax.s       fa7, fs3, fs7
                  fmin.s       fs4, ft2, ft1
                  fmul.s       ft1, ft9, fs4, rne
                  fdiv.s       fa3, ft7, fa1, rup
                  xor          a6, a7, s6
                  flt.s        t6, fa5, fs5
                  fcvt.s.w     ft8, a3, rmm
                  rem          a3, s0, s1
                  mul          a6, t1, s2
                  srl          s0, s7, t3
                  rem          a3, s7, s11
                  fcvt.w.s     s5, ft11
                  fcvt.s.w     fa3, a0
                  mulh         a3, t3, s2
                  fcvt.s.wu    ft2, gp, rup
                  fsgnjn.s     fs5, fs10, fs11
                  feq.s        a3, fs1, fs11
                  fmax.s       fs9, ft5, fa6
                  fcvt.s.w     fa6, a7, rup
                  xori         t3, zero, 833
                  slti         s10, t1, 783
                  fadd.s       ft1, fa1, fa4, rup
                  srai         a1, s1, 19
                  fadd.s       fa2, fs0, ft10
                  fdiv.s       fs10, fs9, ft6, rne
                  fsgnjn.s     fa1, ft1, fs10
                  mulhsu       sp, s11, t5
                  sltu         a0, t5, s0
                  remu         a6, a6, s4
                  slti         zero, t6, 543
                  slt          s10, s10, t4
                  sltu         a5, t5, t4
                  mulh         sp, a0, t2
                  remu         ra, s0, t0
                  lui          a5, 614497
                  addi         sp, t5, -200
                  fclass.s     t4, fs4
                  or           a0, s2, zero
                  fclass.s     a4, ft8
                  flt.s        a5, ft3, ft7
                  rem          s5, t4, s10
                  mulhsu       s10, t0, tp
                  lui          s0, 744952
                  fmax.s       ft10, fa5, fa3
                  feq.s        a7, ft10, ft6
                  feq.s        s11, ft5, fa4
                  or           t0, s6, ra
                  xor          a1, a4, t2
                  addi         s0, s6, 346
                  mul          sp, t2, s4
                  fdiv.s       ft9, fs6, fs4, rne
                  sub          s3, s5, ra
                  fsgnjx.s     fs3, ft4, fs6
                  srai         s7, t6, 18
                  srli         s8, t3, 20
                  div          a7, s4, a4
                  flt.s        s11, fs5, ft4
                  auipc        s6, 597705
                  remu         s4, zero, a3
                  sub          s0, ra, t5
                  addi         t3, a3, 731
                  fclass.s     sp, ft3
                  and          s1, ra, t2
                  nop
                  fle.s        ra, fs10, fs6
                  sltu         t0, s10, ra
                  srli         ra, s2, 28
                  xori         sp, s11, 200
                  slli         t3, s9, 22
                  slti         s6, a0, 1570
                  mul          s7, a5, s0
                  fcvt.wu.s    t4, ft0
                  xori         a3, sp, -367
                  lui          a0, 197378
                  sll          s5, s8, a5
                  div          s0, zero, s6
                  remu         t6, a5, sp
                  srai         s1, a0, 5
                  fmin.s       fs10, fs10, fs0
                  fmin.s       fa1, fs0, ft9
                  ori          t3, s11, -667
                  fcvt.wu.s    a5, ft4
                  fle.s        s0, fa4, ft1
                  sub          s4, a3, s0
                  fmax.s       ft5, ft5, ft5
                  slt          s3, s2, t5
                  fadd.s       fa2, fs3, ft2
                  slti         s7, t0, 887
                  slt          s6, s8, t3
                  sub          s7, s9, t0
                  mul          t1, s6, s9
                  fadd.s       fs7, ft10, fa1, rup
                  lui          a7, 740688
                  xori         s5, a0, 921
                  ori          s11, t1, 1546
                  mul          t3, s3, ra
                  ori          s0, s6, 547
                  add          s9, t4, a5
                  mulh         a6, t2, a4
                  slti         a0, ra, 1126
                  mulh         tp, a5, s3
                  srli         s4, s3, 25
                  nop
                  fmin.s       fs6, fs9, fs6
                  srl          a4, t6, s2
                  slt          s5, t3, s0
                  flt.s        a3, ft1, fa5
                  add          t3, s10, t1
                  addi         sp, a7, -1248
                  srai         ra, t6, 12
                  ori          s4, a2, 1097
                  fcvt.w.s     t2, ft11, rdn
                  and          s8, ra, t1
                  fcvt.w.s     a7, ft4
                  feq.s        t3, ft5, fa6
                  xor          s3, a6, s5
                  srl          a1, t0, s5
                  fcvt.wu.s    s8, ft9
                  or           a3, a2, s4
                  ori          a0, s1, -1646
                  mulhsu       s7, t0, s7
                  sra          sp, t6, s7
                  div          a6, tp, t0
                  fmin.s       fs9, fa1, fs3
                  sra          a0, s5, zero
                  slli         a4, a6, 13
                  fsgnj.s      ft6, ft11, ft7
                  remu         t6, s1, t5
                  mulhu        t6, a5, a7
                  slt          a3, a7, a2
                  fclass.s     a5, ft8
                  feq.s        s4, fa7, ft1
                  xor          a3, ra, a4
                  remu         a1, s5, a4
                  nop
                  fsgnj.s      fs8, fa2, fs7
                  fmin.s       fs9, fa7, fa0
                  mulhu        a7, s9, s7
                  sltu         t6, s7, a4
                  fsqrt.s      fs1, fs6, rmm
                  ori          t2, s1, -1749
                  fdiv.s       fa2, ft4, ft3, rtz
                  add          a1, t2, zero
                  addi         sp, sp, -117
                  fmv.x.w      a1, fs0
                  xor          tp, s3, t0
                  slli         a6, t6, 26
                  fmv.w.x      fa0, s8
                  fcvt.wu.s    tp, fa4, rne
                  fsgnjn.s     ft5, fa4, ft1
                  srli         a7, a2, 14
                  add          a3, t6, s9
                  sub          a7, s8, a5
                  srai         a0, t5, 21
                  nop
                  fcvt.s.wu    ft5, t2
                  remu         zero, ra, s3
                  sll          sp, t6, gp
                  fdiv.s       fs10, fs11, fs2
                  fsub.s       fs10, fa3, ft7
                  mulh         s10, s2, a5
                  slt          sp, s9, s2
                  or           a5, ra, zero
                  mul          a0, s7, gp
                  fsgnjn.s     fa4, ft2, fa1
                  fcvt.w.s     s6, ft1, rtz
                  slti         sp, s8, 618
                  mulhsu       s9, zero, s8
                  fsqrt.s      fs0, ft2
                  sltiu        s5, s8, 477
                  srl          s11, zero, s9
                  rem          a6, t2, s5
                  mulhu        s5, s11, ra
                  fdiv.s       fs7, fs6, ft10
                  slti         a0, t3, 695
                  srai         s0, ra, 18
                  fcvt.wu.s    t4, fa0
                  slti         t4, s7, 1660
                  fcvt.wu.s    t2, fs11, rup
                  fsgnj.s      fs3, fa0, fs11
                  fcvt.s.w     fs5, t3
                  divu         s1, a2, s11
                  lui          t4, 10968
                  and          a7, t1, s4
                  fdiv.s       fa5, fa2, ft2
                  fcvt.s.w     fs3, s10
                  fcvt.w.s     a3, fs1
                  add          s0, tp, t6
                  slti         zero, s1, 1544
                  fsqrt.s      ft8, fs6, rdn
                  srl          zero, s6, t6
                  fle.s        s5, ft7, fs11
                  slli         gp, a2, 26
                  fmax.s       fa5, fs5, ft4
                  fsgnj.s      ft8, ft11, ft5
                  flt.s        s8, fs0, fs11
                  and          t0, gp, tp
                  remu         a0, s8, s11
                  slli         s4, t6, 11
                  mul          a4, s3, a7
                  div          ra, t1, s5
                  fclass.s     a7, fs3
                  srai         gp, t6, 7
                  xori         s5, s6, -158
                  sltu         a7, s0, s1
                  fadd.s       ft10, fa5, fs1, rdn
                  fclass.s     s8, fs9
                  or           a6, s3, t4
                  mulh         a0, s4, t1
                  fcvt.s.wu    fs7, s3, rne
                  sub          t4, a6, a3
                  and          s7, s8, sp
                  div          t6, sp, zero
                  divu         tp, s11, a0
                  fcvt.w.s     s8, ft11, rup
                  div          a5, ra, zero
                  flt.s        s10, fs3, fs4
                  sltu         a6, a7, a6
                  sltiu        s11, zero, 638
                  divu         a4, s7, s4
                  srai         t4, t2, 13
                  fcvt.wu.s    s1, ft0
                  ori          a3, t4, -876
                  sra          tp, s10, s3
                  srli         t1, t3, 23
                  fmv.x.w      t6, ft11
                  ori          t4, zero, -1861
                  srai         sp, t2, 17
                  fmax.s       ft1, ft1, fs3
                  srl          s9, t2, s9
                  slli         s11, ra, 30
                  fmin.s       ft11, fs8, ft3
                  and          t2, t2, s10
                  fadd.s       fs3, fs7, ft1, rne
                  sltiu        s1, tp, 728
                  sub          a0, a4, a3
                  feq.s        t3, fa1, ft1
                  fcvt.s.w     fs4, tp, rne
                  divu         s11, tp, s0
                  fcvt.w.s     zero, fs2
                  fsgnj.s      ft1, fs9, fs8
                  fsub.s       fs4, fa0, ft1
                  flt.s        t6, fs11, fs6
                  fle.s        t1, fs7, fs0
                  mulh         t3, t2, a7
                  fle.s        t4, ft7, ft10
                  and          a0, t1, tp
                  fdiv.s       fs0, fa7, fs9, rmm
                  andi         s10, a1, 2032
                  lui          s1, 571479
                  fcvt.w.s     t2, fs7, rup
                  fsgnjn.s     ft11, fa0, fs0
                  fclass.s     tp, fs0
                  fsgnjx.s     ft9, fa5, ft11
                  fcvt.s.w     fs9, s8, rne
                  fsqrt.s      fs5, ft0, rtz
                  andi         t6, s0, 917
                  fadd.s       fa1, fa6, ft8, rne
                  fcvt.s.w     fs8, a0, rne
                  mulhsu       s4, s4, sp
                  fmv.w.x      ft9, ra
                  rem          t4, t5, gp
                  fcvt.s.w     fa6, a7
                  fclass.s     tp, ft7
                  sll          t4, a0, a3
                  sltiu        a7, s7, 1659
                  slti         s11, a7, -454
                  srli         s4, t2, 6
                  rem          s4, s3, gp
                  nop
                  mul          s10, zero, a4
                  fmv.x.w      s7, ft5
                  fsgnj.s      ft0, ft3, fa4
                  xori         zero, ra, -536
                  fmax.s       fs3, ft2, fs3
                  fmul.s       fa4, fs4, ft3
                  xor          a7, s8, a2
                  srl          s8, t0, s9
                  flt.s        a3, ft6, ft9
                  fcvt.s.w     ft11, t0, rmm
                  ori          zero, s0, -1992
                  fcvt.s.wu    fa0, ra, rup
                  fmul.s       fa5, fs5, ft11
                  fcvt.s.wu    fs11, s0
                  mulhsu       a0, a7, t6
                  fsgnjn.s     fa5, fs5, fa5
                  rem          s4, s9, a2
                  xor          s7, s11, s5
                  nop
                  rem          a7, gp, s6
                  fcvt.w.s     t2, ft0, rup
                  fmul.s       fs7, ft11, ft4
                  slli         sp, t3, 20
                  fadd.s       fs2, fs3, ft2
                  fsgnj.s      fa6, ft0, fa2
                  fsgnjx.s     ft9, fs6, fa0
                  fadd.s       ft7, fa3, fs0
                  lui          a1, 955363
                  fmin.s       ft1, ft1, fa6
                  lui          sp, 720489
                  sll          s0, sp, a5
                  add          a6, s6, s6
                  xor          ra, a5, s8
                  divu         zero, s8, t0
                  mulhu        s6, a1, s4
                  fcvt.w.s     a5, ft5, rtz
                  fmv.w.x      fs1, zero
                  fcvt.wu.s    sp, ft8
                  slti         s6, s3, 80
                  fcvt.w.s     t0, ft0, rdn
                  fmax.s       fs2, fa2, fa3
                  mulhu        a7, s5, ra
                  fmin.s       fa0, ft5, ft9
                  slt          s6, zero, s8
                  divu         a6, t4, sp
                  sltu         a3, t2, a2
                  fcvt.s.w     fa7, zero
                  mulhu        t6, s5, t5
                  fadd.s       fa3, ft10, ft1
                  addi         tp, a2, -1804
                  fmv.x.w      tp, fa2
                  fclass.s     s10, fa5
                  fmax.s       fs4, ft10, ft5
                  srl          a4, a6, a6
                  fadd.s       fs0, fa0, ft0
                  sra          a4, a7, a1
                  fcvt.s.wu    ft9, t6
                  addi         a5, a1, -695
                  rem          t1, s2, t5
                  fcvt.w.s     t1, fa7, rne
                  fclass.s     s5, ft7
                  fdiv.s       ft0, ft3, fs7
                  mul          a4, a3, t3
                  sra          zero, t5, ra
                  mulhu        gp, s10, a0
                  fcvt.w.s     s1, fs8, rup
                  fsub.s       fa5, ft10, ft6, rmm
                  fle.s        gp, fs1, fa6
                  sra          a0, s8, a7
                  fcvt.s.wu    fs1, s8, rup
                  fsgnj.s      ft6, ft3, ft5
                  sll          s6, a3, sp
                  or           tp, t3, s2
                  fsqrt.s      fs8, fs2
                  fcvt.s.wu    ft4, s7
                  srai         t3, s5, 7
                  lui          a7, 98631
                  fsqrt.s      fa6, fs3, rup
                  slt          t3, s3, s11
                  mulh         s6, a1, a5
                  fclass.s     t6, fa5
                  fsgnjn.s     fs0, fs2, fs4
                  sra          t4, t5, t5
                  remu         t6, sp, tp
                  xor          zero, s5, s9
                  fsgnj.s      ft11, fs1, ft0
                  fcvt.wu.s    a1, fs7
                  xor          s6, s3, s2
                  fsgnjx.s     fs8, ft5, ft3
                  xor          a5, tp, s5
                  rem          s1, s0, a5
                  fclass.s     s8, ft4
                  mul          gp, tp, s11
                  fclass.s     a6, fs3
                  fmul.s       ft10, fs5, fa0, rdn
                  fmul.s       fa5, fs5, fs5
                  fsgnjn.s     ft11, fs3, fs11
                  slti         t2, a0, -1265
                  mulhu        a1, a2, s7
                  fmv.x.w      s7, fs7
                  srl          sp, s1, s6
                  mulhsu       a3, s2, tp
                  sll          sp, s6, ra
                  divu         a1, s8, s8
                  sub          t3, zero, a0
                  fmv.w.x      fs0, a4
                  fsub.s       fs8, ft7, fs5, rup
                  fsgnjn.s     ft7, ft8, fa2
                  fcvt.wu.s    zero, fa2, rup
                  fmv.x.w      gp, fs5
                  add          a4, t2, t0
                  slti         t6, s4, -1771
                  mulhsu       s0, s1, s7
                  or           sp, a2, t3
                  or           t6, s1, a2
                  slli         s10, t4, 11
                  sub          sp, s3, s8
                  addi         t1, t2, -1185
                  fsgnjx.s     ft4, ft5, fs10
                  fmul.s       fa3, fa6, fs10
                  addi         s3, a1, -1322
                  slt          t1, s7, a4
                  fcvt.wu.s    t6, fs2
                  fadd.s       fa2, fs7, ft10
                  fsgnj.s      ft7, fa4, fs5
                  fsgnjn.s     ft0, fs10, fa0
                  fdiv.s       fs10, ft3, fs9
                  srli         t2, s7, 13
                  fsub.s       fa6, fa4, ft5
                  add          a4, s5, t6
                  slli         a4, s3, 19
                  srai         ra, ra, 27
                  xor          tp, a6, s4
                  addi         gp, s11, 1611
                  fsgnj.s      fa5, fa1, ft1
                  fsgnjn.s     ft8, ft2, fs11
                  fmv.w.x      fs2, a2
                  fmax.s       fa3, fa3, fa2
                  sll          t1, s5, t0
                  remu         s3, s8, a5
                  sub          gp, s6, s2
                  fcvt.s.wu    fs9, t0
                  fmul.s       ft2, fa1, fs1, rdn
                  fmin.s       fa2, fa7, ft2
                  sll          t2, t5, sp
                  mulhsu       ra, s2, s6
                  remu         t6, s2, a3
                  srli         t1, s8, 9
                  fcvt.s.w     ft3, sp, rmm
                  and          t1, t2, t2
                  sub          gp, s5, tp
                  fsgnj.s      ft8, ft8, ft7
                  fmin.s       fs1, ft10, fa5
                  add          sp, s1, t1
                  addi         gp, s4, -811
                  rem          a6, ra, a3
                  xor          a1, gp, a3
                  or           s6, s9, t4
                  sra          t3, t5, s7
                  nop
                  fcvt.s.wu    fa6, sp, rtz
                  mulhsu       t3, a2, s8
                  fsgnjn.s     ft9, ft1, ft0
                  fmin.s       ft1, fa4, ft8
                  sltu         t3, a5, s11
                  sub          a0, s11, t1
                  fsqrt.s      fa2, fs8
                  fsqrt.s      ft10, ft0, rtz
                  slli         t1, a3, 26
                  add          t2, t2, t2
                  srai         s3, t5, 24
                  slli         s11, s7, 26
                  addi         zero, a7, -1954
                  add          ra, a6, zero
                  slt          s4, a4, a2
                  mulhu        s10, t2, s1
                  fcvt.s.wu    ft9, t4
                  fsqrt.s      fa5, ft11, rmm
                  fcvt.w.s     t2, ft3
                  rem          zero, s10, s9
                  sub          a7, s11, ra
                  nop
                  fcvt.w.s     s1, fa6
                  nop
                  remu         t1, s11, zero
                  fmin.s       ft6, fa6, fs8
                  nop
                  fsgnj.s      ft11, fa2, ft2
                  flt.s        tp, ft3, fs3
                  fdiv.s       fa3, ft5, ft10, rtz
                  fcvt.w.s     s5, ft1, rup
                  rem          a7, zero, s7
                  remu         zero, t6, sp
                  xori         t3, t0, -1736
                  feq.s        s1, fa1, fs7
                  slt          a1, s1, t4
                  lui          t3, 204028
                  remu         sp, s8, sp
                  andi         gp, t6, -1291
                  fadd.s       fs1, ft4, ft10, rne
                  or           s0, a2, s9
                  mulhu        tp, a1, a0
                  fle.s        s1, ft4, fs10
                  addi         tp, t0, 474
                  mulhu        s10, gp, s7
                  mulhsu       a3, s2, s11
                  srl          a6, a4, s5
                  slt          s0, t0, a6
                  srl          s6, s7, a1
                  sll          a4, s5, gp
                  fsgnjx.s     fa3, ft11, ft1
                  mul          t1, s8, t3
                  fmax.s       fs1, ft11, fs4
                  slt          s8, s4, s10
                  auipc        s11, 492791
                  xori         a6, a3, 743
                  xor          s6, a7, t2
                  remu         t1, s6, a3
                  andi         a4, t6, -1550
                  fsgnjn.s     fa4, fa0, fs2
                  andi         zero, zero, 1451
                  srl          a7, s10, a2
                  srli         s9, s7, 23
                  fsgnj.s      ft0, fs9, fa1
                  srl          s6, s6, s0
                  slli         t1, s6, 27
                  fsub.s       fs11, ft9, fs6, rup
                  slli         a1, s7, 11
                  fcvt.s.wu    fa5, s10
                  fsgnjn.s     ft4, fs9, fa3
                  srl          s3, zero, t0
                  fadd.s       fs4, ft11, fs10, rup
                  fmin.s       fs3, fs11, fa7
                  fmul.s       fa2, ft6, fs2, rup
                  ori          a1, t5, 16
                  andi         tp, s1, 917
                  flt.s        t3, ft8, fa3
                  or           a5, s7, a3
                  divu         s1, s5, s9
                  sltu         t1, sp, ra
                  ori          a0, s9, 1856
                  flt.s        s9, fa6, fs0
                  fmul.s       fs11, fs6, fa1, rup
                  mulhsu       tp, s2, s1
                  feq.s        s0, ft11, ft2
                  fcvt.s.w     fs5, t2, rdn
                  fsub.s       fs4, fa7, fs10
                  fadd.s       fa6, fs7, fa1
                  slt          s7, a0, s1
                  fle.s        a7, ft8, fs10
                  srai         a3, s5, 2
                  slt          s7, s11, a4
                  add          a7, ra, s2
                  lui          s1, 936865
                  ori          s6, s1, -133
                  slti         a3, t5, 1644
                  flt.s        a0, fs2, fs5
                  fsqrt.s      fs9, ft10
                  fsgnjx.s     fs7, fs8, fs0
                  mul          a3, t0, a5
                  fcvt.wu.s    s11, fa1, rtz
                  fcvt.w.s     a4, fa4, rne
                  div          s3, zero, s0
                  fdiv.s       fs2, ft1, fs2, rmm
                  fclass.s     t2, fa1
                  fcvt.w.s     s4, ft9
                  rem          t4, t3, s6
                  add          ra, s5, s11
                  remu         ra, s7, t0
                  slli         t4, s9, 10
                  fsgnjn.s     ft4, fs1, fa3
                  mul          a6, s10, a6
                  fcvt.s.wu    fa2, s10, rmm
                  fadd.s       fs2, fa3, fs1, rtz
                  or           s7, gp, a3
                  div          t3, a6, tp
                  fdiv.s       fa6, fa3, fs11
                  fmax.s       ft0, ft3, fs8
                  fcvt.wu.s    a7, ft0, rne
                  fsgnjx.s     ft4, fs8, fs6
                  rem          a6, t5, s8
                  srl          a6, t3, s0
                  xor          s3, a5, s11
                  fsub.s       ft10, ft3, fa6
                  fcvt.w.s     a1, ft5, rtz
                  fmax.s       ft1, fa1, ft9
                  srai         t6, a2, 12
                  mulh         s3, t4, t2
                  flt.s        s0, fs5, ft7
                  fsgnjn.s     fs11, fs7, fa0
                  slt          a7, t1, a6
                  sltiu        a0, s6, -935
                  fsgnjx.s     ft11, ft0, ft2
                  slt          a6, s2, s1
                  mul          s1, t6, a1
                  fadd.s       ft0, fs1, fs6
                  fmul.s       ft11, fs0, ft10, rup
                  fle.s        ra, fs1, fs10
                  fdiv.s       ft11, fs4, fs3
                  fle.s        t2, ft5, fa3
                  and          a4, a2, a3
                  fle.s        s1, fa1, fa5
                  mulh         a1, a5, s3
                  ori          ra, s9, 1735
                  fclass.s     s9, ft9
                  flt.s        a0, fs4, ft7
                  fsgnjx.s     ft2, fa0, ft7
                  fsub.s       fs11, fs2, fs1, rmm
                  andi         t2, a6, -1056
                  feq.s        s9, fa0, ft11
                  lui          s3, 611501
                  slt          a5, a7, t3
                  fle.s        zero, ft3, fs9
                  fmv.x.w      t0, fs0
                  sll          s10, s10, a2
                  auipc        tp, 550733
                  fmin.s       fs8, fs4, ft6
                  fsgnjn.s     fs5, fa3, fs7
                  fsub.s       fa6, ft4, fs11
                  sra          ra, a0, s4
                  fclass.s     t0, fs2
                  srli         ra, s6, 2
                  lui          s8, 416462
                  addi         a4, tp, -348
                  fle.s        t1, fs5, ft7
                  xor          s7, s5, s11
                  fsub.s       ft4, fs5, fs8, rup
                  fsgnjx.s     fs10, ft0, ft4
                  sltu         s3, t5, t5
                  div          s8, s5, t0
                  mulhsu       tp, a0, a1
                  fsgnjx.s     fs7, ft6, ft1
                  andi         ra, a0, 584
                  fadd.s       fs0, ft0, ft2
                  sltu         ra, gp, s11
                  fle.s        a5, fs7, ft11
                  fsqrt.s      ft8, fa5
                  fsgnjn.s     fs7, ft11, ft8
                  srli         zero, zero, 14
                  fclass.s     s4, fa2
                  fdiv.s       ft5, fs1, ft4, rtz
                  flt.s        s5, fs0, ft9
                  srli         s9, s4, 24
                  auipc        sp, 1030693
                  fsgnjn.s     fa6, ft2, ft11
                  nop
                  mul          s6, a5, s8
                  flt.s        s10, fs5, fa7
                  slti         s3, a2, -1603
                  feq.s        t4, fa0, fa2
                  sltiu        t6, t3, -1320
                  fcvt.s.wu    fa2, s10, rup
                  srl          s9, s1, t4
                  addi         s5, t1, -564
                  xor          t2, tp, a0
                  fadd.s       fa3, fa4, fs9, rup
                  fsqrt.s      fs2, ft2, rmm
                  sll          s8, s8, s1
                  andi         a6, t1, 454
                  fadd.s       ft7, fs9, fs0
                  divu         s7, t2, s5
                  xor          s0, ra, t0
                  fsgnj.s      fs2, ft5, fa7
                  flt.s        a1, fa7, ft10
                  flt.s        s5, fs11, fa0
                  nop
                  mulhsu       s4, a1, a0
                  divu         ra, t1, s4
                  srl          ra, a2, a7
                  slt          s9, t1, t4
                  sub          a0, s10, ra
                  fdiv.s       fa4, fs1, ft2
                  fcvt.wu.s    a0, ft5
                  feq.s        s3, fs3, fs10
                  sltiu        zero, s0, -1420
                  fcvt.s.wu    fs2, a7, rtz
                  xori         t6, a1, 1069
                  divu         t6, a0, s10
                  fsub.s       fs5, fs4, fs1, rtz
                  feq.s        t3, fa4, fs0
                  fsub.s       fs7, fs11, fs7
                  mulh         t1, s3, t2
                  fmv.x.w      zero, ft7
                  fcvt.w.s     s4, ft10, rdn
                  slt          a0, tp, t2
                  fmv.x.w      s4, ft9
                  sltu         t4, s4, t5
                  fmin.s       fs6, fs1, fs7
                  sra          zero, ra, s7
                  lui          a3, 999119
                  sub          t1, s1, s2
                  and          t4, t2, s8
                  sub          s1, ra, a6
                  feq.s        a0, ft2, fa0
                  fmax.s       fa7, fa2, fa4
                  and          s3, t4, s8
                  fadd.s       ft1, fa7, fa5, rtz
                  fcvt.wu.s    a7, fa7, rdn
                  fmul.s       ft6, ft2, fa3
                  add          a1, s1, a3
                  sltiu        t2, s9, 1800
                  fcvt.s.w     fa3, s0, rne
                  mul          a4, s7, s11
                  and          s3, s0, a7
                  rem          s11, t3, a5
                  or           s9, sp, t1
                  mulhsu       t6, t5, s0
                  srl          s4, s7, s9
                  fmv.x.w      t2, fs6
                  andi         s3, sp, -1989
                  fmul.s       ft5, ft0, ft9
                  srai         a1, s10, 17
                  sra          gp, a1, t5
                  fcvt.s.w     fs1, sp
                  lui          s7, 436162
                  sll          t1, s1, zero
                  div          t1, a0, s6
                  sll          t0, s1, s1
                  fcvt.w.s     s11, ft0
                  andi         a6, s9, -784
                  remu         s4, a1, zero
                  srai         s4, s2, 17
                  div          s8, a3, zero
                  mul          ra, a5, t4
                  sll          a4, t5, a4
                  fsgnj.s      ft8, fs4, ft0
                  srai         t1, s1, 22
                  fmv.w.x      ft6, t3
                  ori          tp, tp, 27
                  fcvt.s.wu    fa5, sp
                  srli         a6, gp, 9
                  sll          s6, a4, s2
                  fdiv.s       fa2, ft0, ft7
                  fsub.s       fa6, fs11, fs0
                  fdiv.s       fa6, fs4, fs8
                  addi         a4, s6, 683
                  fdiv.s       fs4, fa5, ft3
                  sll          ra, a6, a0
                  fsub.s       fs5, fs6, fa7
                  fdiv.s       fs7, fs3, fs2, rdn
                  srli         s11, t5, 31
                  fsub.s       fa4, fa4, fs2, rtz
                  divu         t4, t5, s0
                  and          t0, t2, a3
                  remu         a7, tp, a4
                  fsgnj.s      ft8, fs4, fa2
                  fsgnjx.s     fs1, ft11, ft3
                  fdiv.s       ft11, fs10, fa6, rne
                  sll          sp, a7, sp
                  mulhu        s8, s10, s0
                  fdiv.s       fa4, ft8, fs2, rdn
                  fclass.s     zero, ft3
                  or           s8, s3, t6
                  fmv.w.x      fs3, t1
                  andi         a1, t5, 1987
                  fsgnjn.s     fs7, ft2, ft9
                  ori          s4, s7, -687
                  sltu         s0, gp, s6
                  feq.s        s11, ft1, fs7
                  srli         zero, a7, 3
                  rem          a1, s11, t3
                  mulhsu       a4, a0, t6
                  feq.s        a5, fa0, ft2
                  mulhsu       a0, a3, t0
                  fadd.s       ft6, ft5, ft3
                  srai         t3, t3, 20
                  flt.s        gp, ft10, ft4
                  slti         s9, s5, 612
                  fsgnjn.s     ft5, ft4, fs6
                  xori         a4, s10, -774
                  fcvt.s.wu    fs1, s5, rdn
                  slli         s4, t2, 30
                  mulhu        t6, a0, s3
                  fsub.s       ft8, ft3, ft4, rdn
                  slti         a4, s8, -1788
                  xori         s3, s9, -51
                  srl          t2, a0, a2
                  fmul.s       fs5, ft6, fa3, rdn
                  slli         s5, tp, 28
                  divu         s10, s9, t6
                  srai         ra, a4, 19
                  fsqrt.s      fs8, fs6, rmm
                  flt.s        s8, ft6, ft8
                  srai         gp, t4, 8
                  fadd.s       fs9, fs10, fs8, rmm
                  ori          a1, a0, 212
                  or           s4, zero, t4
                  or           s10, a1, s0
                  mul          t1, a7, t4
                  fsub.s       fa7, ft6, ft10
                  sltu         s0, s4, gp
                  nop
                  fmin.s       fs5, ft2, ft8
                  flt.s        t2, ft1, ft3
                  srl          s1, a6, a5
                  add          t2, a2, s10
                  srl          a5, a4, a5
                  xor          t2, t3, ra
                  or           s8, ra, a7
                  mulh         t6, t3, s5
                  divu         t3, s2, t0
                  fmv.w.x      fs11, tp
                  lui          s0, 986951
                  nop
                  sub          s0, a5, t1
                  divu         a4, ra, s3
                  fle.s        sp, fs5, ft2
                  rem          s10, sp, tp
                  slti         t1, a2, -677
                  sll          s8, s2, s10
                  ori          a3, zero, -1035
                  sltiu        s4, t3, 356
                  fsgnjx.s     ft4, ft6, ft2
                  and          a3, a6, t4
                  fsgnj.s      ft4, ft9, ft0
                  lui          s7, 673035
                  fsgnjn.s     ft4, fs10, fs0
                  mul          s0, t0, t6
                  addi         s4, s10, -1861
                  sltiu        s11, t1, -1301
                  fmin.s       fa7, fa3, fa6
                  fcvt.s.wu    fa0, s6
                  auipc        s3, 1000144
                  fsgnj.s      ft9, fa5, fa7
                  slli         s5, a0, 19
                  rem          s0, t3, s6
                  add          s9, s7, t5
                  fsgnj.s      fa2, fa5, ft11
                  feq.s        t4, fs8, fs4
                  ori          s3, t2, 957
                  fsqrt.s      fs10, fs8, rmm
                  fcvt.wu.s    s3, fs7, rtz
                  fmax.s       fa6, ft0, fa2
                  sub          s4, a5, t2
                  srl          t1, s0, a6
                  feq.s        t3, ft1, ft10
                  sub          s0, a4, t3
                  sltu         a7, s3, a7
                  fsgnjx.s     fs7, fa3, fa0
                  sltu         a3, gp, a3
                  andi         s1, a0, -578
                  fle.s        ra, fs2, fs2
                  rem          t4, t3, t6
                  fsqrt.s      fs2, ft3, rtz
                  or           s11, s6, a5
                  auipc        s9, 781736
                  fsgnjn.s     fs11, fs1, fa1
                  fle.s        t6, fs2, fa7
                  mul          zero, s5, gp
                  mulhu        t6, a2, t6
                  sltiu        s8, a2, -707
                  and          zero, a4, a6
                  fmin.s       fs2, fs11, ft3
                  fadd.s       fs6, ft10, fs0
                  fmin.s       fs5, fs6, fs0
                  srli         a6, t2, 17
                  slt          tp, s5, a3
                  xor          s8, t2, zero
                  xor          t3, t1, s0
                  xori         s4, s1, -1460
                  flt.s        a4, ft6, fs1
                  fmv.x.w      t6, ft0
                  andi         a3, a3, -1806
                  mulhu        t0, a3, a3
                  fsub.s       ft11, fa7, ft0, rmm
                  remu         a6, gp, s8
                  slt          a0, s9, t0
                  sra          a4, tp, a3
                  mulh         t4, a6, t2
                  mulh         t0, s3, gp
                  srl          s0, s5, s5
                  srl          ra, a1, ra
                  srli         s0, a3, 18
                  fclass.s     a7, fs10
                  fmv.w.x      fa0, a6
                  fmv.x.w      s10, fa1
                  or           sp, s9, a3
                  auipc        zero, 883210
                  sltu         zero, a6, s11
                  flt.s        s10, fa5, fs5
                  fmin.s       fa4, fa5, ft3
                  slli         ra, t2, 21
                  ori          ra, a2, -1354
                  flt.s        a1, ft4, fa3
                  slti         s1, s6, -1
                  sltiu        a7, s7, -1495
                  srai         s9, s11, 11
                  sltu         s4, zero, t1
                  sll          a1, ra, t2
                  mulhsu       t4, s6, s8
                  add          s7, s5, t5
                  sra          s8, a5, gp
                  sra          zero, s1, a5
                  nop
                  mul          ra, a2, t6
                  fmin.s       fa2, fs3, fs0
                  fcvt.wu.s    a7, ft10
                  fle.s        t6, fs2, fs3
                  fsgnj.s      ft6, ft9, ft3
                  mulhu        s4, s1, zero
                  fmul.s       fa4, fs5, fs10
                  fmax.s       fa0, ft4, ft4
                  ori          tp, gp, -949
                  fsub.s       fs7, fa4, ft3, rdn
                  fle.s        a0, ft8, fs4
                  fle.s        s1, fs11, fs6
                  fsgnjx.s     fs5, fs7, fs0
                  sltu         s6, t3, s5
                  fcvt.wu.s    s3, ft3, rne
                  and          s10, s6, t3
                  fdiv.s       ft10, fs1, fs9, rmm
                  fdiv.s       ft4, ft8, fs2
                  fmul.s       fa3, fa7, ft0
                  sltiu        t1, s4, 540
                  lui          a5, 568831
                  fcvt.wu.s    gp, fs5, rne
                  remu         ra, s7, sp
                  mulh         a4, s1, tp
                  fmv.w.x      ft5, a3
                  fdiv.s       ft5, fa4, fa4, rne
                  feq.s        t2, fa2, ft1
                  nop
                  fsub.s       ft5, fs10, ft9
                  slti         gp, s0, 101
                  fmul.s       ft4, ft6, fa5, rtz
                  and          ra, t1, t2
                  fmul.s       fa4, fs8, fs3, rdn
                  slt          s6, s0, ra
                  xor          s0, t6, t2
                  mul          a5, sp, s2
                  sra          t3, a7, s8
                  auipc        ra, 191284
                  and          s6, t0, a5
                  fcvt.s.wu    ft11, t0
                  fdiv.s       ft5, fs10, fa0
                  or           s1, t1, t4
                  andi         s4, t3, -361
                  fcvt.s.w     ft8, t3
                  mulhsu       gp, tp, s0
                  fclass.s     a0, fs7
                  mulhsu       t0, a5, sp
                  mulhu        t1, s11, s6
                  flt.s        a4, fs6, fa2
                  xor          a3, t2, s8
                  divu         a0, gp, a4
                  sll          ra, tp, t5
                  sra          s8, tp, a2
                  srli         s6, t0, 22
                  fsgnjx.s     ft3, fs2, fa7
                  srl          a1, a3, s1
                  sltiu        t2, a2, 345
                  or           s5, sp, a5
                  fsub.s       fs6, fa0, ft2
                  srl          a7, t3, s0
                  sra          s5, s9, s9
                  divu         t0, s0, s2
                  fcvt.s.wu    fa6, a5
                  fcvt.s.w     fa3, s0, rdn
                  fmin.s       ft7, ft6, fa3
                  rem          a7, a5, s11
                  fsgnj.s      fs4, ft6, fs1
                  fsgnjx.s     fs7, ft2, fa4
                  divu         s8, a3, t4
                  flt.s        s4, fs7, fa2
                  remu         sp, a1, a0
                  xori         s8, s1, 109
                  mulhsu       s7, s0, a6
                  fmv.w.x      fs1, t6
                  xor          a5, s3, s9
                  xor          t1, s5, s10
                  slti         s0, t2, -854
                  slti         s9, s2, 1006
                  srl          a0, t5, s9
                  srai         a3, a0, 3
                  and          t0, s9, t0
                  ori          sp, s5, -1712
                  sub          s1, a6, s5
                  ori          s3, zero, 307
                  divu         t0, s0, t3
                  fsgnjx.s     fa2, fa1, ft1
                  nop
                  mulhsu       s6, a0, a3
                  mul          a7, t0, s3
                  fdiv.s       fs4, ft6, fa7
                  flt.s        t1, ft2, fs4
                  mul          s6, s5, s1
                  feq.s        a0, ft6, fs1
                  fmin.s       fa1, ft4, fs1
                  sra          s3, tp, t2
                  ori          t2, s3, 1318
                  fsgnj.s      ft3, ft1, ft0
                  fcvt.s.w     fa0, s11, rdn
                  fsgnj.s      fa7, fs1, fs7
                  feq.s        s3, ft1, fs1
                  fsgnjx.s     fa7, fs6, ft3
                  mulh         a4, t2, a6
                  flt.s        a5, fs11, fa4
                  fadd.s       fa4, fa4, fa2
                  fle.s        s5, ft6, fs2
                  mulhu        zero, s10, t3
                  nop
                  fmul.s       fa0, ft4, fs5, rtz
                  andi         s10, s1, -1871
                  mulhsu       t1, t6, zero
                  fsgnjn.s     ft8, fs8, fs10
                  mul          gp, a0, tp
                  add          t6, a2, t5
                  feq.s        a0, fa2, fa4
                  fcvt.s.w     ft1, s7
                  remu         t2, s8, s1
                  fclass.s     s8, fs0
                  fmax.s       fs10, fs6, fs3
                  srl          t6, t5, s7
                  mulhsu       s5, t0, t2
                  fcvt.s.w     fs6, s8
                  fcvt.wu.s    sp, ft8, rmm
                  fsgnjn.s     ft4, ft10, ft6
                  fle.s        ra, ft4, fa3
                  fsqrt.s      fs10, ft10, rtz
                  srai         s5, s2, 29
                  fcvt.w.s     s7, fs6
                  fmax.s       fs4, fs0, fs6
                  xori         s11, s5, 943
                  fle.s        s7, fa7, ft9
                  srl          a5, tp, a1
                  slti         s1, s11, -774
                  or           zero, s5, s6
                  slli         t1, gp, 24
                  and          t1, t2, t4
                  slt          t4, t2, s4
                  divu         a5, t1, s1
                  sub          gp, ra, s6
                  mulhu        a5, t0, s6
                  mulhu        a4, s9, a2
                  fmul.s       ft4, fs9, ft3
                  slti         t3, a7, -1894
                  srai         s4, a5, 22
                  fcvt.wu.s    a6, ft5
                  fclass.s     s5, ft9
                  fcvt.s.wu    fs11, zero, rup
                  auipc        t4, 8622
                  sltu         s0, t2, t5
                  fclass.s     t0, fa0
                  fcvt.s.wu    fs8, s0
                  fsub.s       fa2, ft11, ft2, rup
                  flt.s        s3, fs8, fs4
                  srai         a4, s9, 9
                  feq.s        t6, fa2, ft11
                  fcvt.s.wu    ft11, s5, rdn
                  srl          t2, a1, s4
                  sra          s11, a3, a5
                  fadd.s       ft11, fs4, ft8, rdn
                  div          s10, s5, a4
                  fsqrt.s      ft10, fa5, rne
                  slt          s3, t1, gp
                  fmax.s       fa4, fs0, fs1
                  fadd.s       fs4, fs10, fa0, rup
                  add          zero, t4, a4
                  fclass.s     zero, fs2
                  divu         gp, tp, a7
                  fsub.s       fs7, fs8, fa4, rmm
                  sub          s1, ra, s2
                  fcvt.s.w     fs11, a6, rdn
                  fsgnj.s      ft0, fa4, fa6
                  fsgnj.s      ft6, fa5, fs3
                  andi         t6, s4, -676
                  fmax.s       ft6, ft8, fs5
                  fcvt.s.w     ft9, a7
                  ori          a3, tp, 680
                  fsgnjx.s     fa1, fs8, ft8
                  or           zero, a2, sp
                  fle.s        sp, ft7, fs5
                  fmax.s       fs5, ft8, ft1
                  mulhsu       t0, a0, s3
                  fle.s        s5, ft10, fs0
                  fsqrt.s      fa1, ft0, rne
                  sub          ra, s5, zero
                  and          s3, sp, s2
                  fsgnj.s      fs6, fa0, fs9
                  fmv.w.x      ft2, t6
                  and          a7, a0, tp
                  mulh         a7, a6, zero
                  andi         a1, s7, 1852
                  slli         s10, a4, 20
                  sltu         t4, a0, a5
                  sub          a0, a0, t1
                  sll          s4, t3, t1
                  remu         t6, a7, tp
                  slli         s11, t2, 5
                  fmin.s       fs4, ft2, ft0
                  slt          a4, tp, t1
                  fmin.s       fs0, fa5, fa3
                  lui          gp, 359833
                  lui          s6, 248074
                  ori          gp, t0, 420
                  fcvt.w.s     s10, fa7, rmm
                  flt.s        a7, ft9, ft9
                  sll          t1, s3, t1
                  srli         s9, s4, 21
                  divu         gp, s1, t1
                  fsgnjx.s     fs6, fa5, fa3
                  sltu         s9, sp, t2
                  mul          tp, a2, s5
                  fadd.s       fs10, ft9, ft2
                  and          s3, s7, s6
                  remu         s3, ra, a4
                  mulh         sp, s10, tp
                  srai         s9, sp, 12
                  rem          ra, tp, s3
                  and          t0, tp, t6
                  xor          s1, t3, sp
                  srli         t4, zero, 10
                  fadd.s       fs3, ft9, fs3, rtz
                  fsgnjn.s     fs11, ft11, ft1
                  fsgnj.s      fs0, fa1, ft3
                  slt          t2, a0, a2
                  nop
                  fmv.x.w      gp, fs5
                  fdiv.s       ft9, fs2, fs6
                  fmv.x.w      s10, fs2
                  fsub.s       fa1, ft11, ft6
                  sll          a7, t0, sp
                  lui          s11, 974985
                  sltiu        s8, t6, 309
                  xor          s6, t5, tp
                  sltiu        a6, s0, -762
                  fmv.x.w      s8, ft7
                  xor          s6, s6, s4
                  lui          t1, 31738
                  srl          s10, t1, t2
                  div          tp, a0, sp
                  mulhu        gp, t2, gp
                  fcvt.wu.s    ra, fa6, rmm
                  andi         t4, s8, 736
                  mulhu        s4, s2, s7
                  fadd.s       fa7, fa7, ft8, rmm
                  fsgnjx.s     fs10, fs7, ft10
                  fsub.s       ft6, fa4, ft3
                  div          s11, a5, gp
                  mulh         a6, t5, s4
                  remu         s10, a5, s8
                  sll          s7, t3, t6
                  fadd.s       fs11, ft4, fs9
                  fcvt.wu.s    a5, ft6
                  lui          s10, 276722
                  fle.s        s11, ft10, fs10
                  fcvt.w.s     a3, ft3
                  fclass.s     s0, fs7
                  fsgnjx.s     ft10, fa1, fs4
                  fcvt.wu.s    s8, ft8
                  sltu         s0, t4, s3
                  slli         gp, s2, 22
                  auipc        zero, 531536
                  divu         s0, s6, s1
                  mulhu        t1, a3, a0
                  sra          s8, s6, t2
                  fsgnj.s      fs1, fa4, ft5
                  auipc        t1, 267875
                  mulh         a7, a7, sp
                  feq.s        a0, fs0, fs0
                  fcvt.wu.s    a6, ft10, rdn
                  feq.s        s4, fa7, ft4
                  fadd.s       ft9, fa0, ft4
                  fle.s        a7, fa4, fa2
                  auipc        t0, 585760
                  xor          t1, t3, s11
                  fsgnj.s      fs5, fa2, fs0
                  sltiu        t4, a7, -507
                  and          a6, a2, a5
                  addi         a1, s6, 1555
                  xor          s10, gp, s7
                  fmv.x.w      a6, ft2
                  and          t1, sp, a0
                  add          s4, s4, t0
                  fmax.s       ft0, fa4, fs0
                  mulhsu       s4, s0, t6
                  fmax.s       fa7, fs11, ft1
                  mulhu        a5, a0, s11
                  fcvt.s.wu    fa7, t6
                  fmax.s       fs11, ft4, ft10
                  ori          a3, t3, -1738
                  fcvt.s.wu    ft2, gp, rtz
                  flt.s        t2, fa3, ft9
                  fcvt.wu.s    t4, fs10, rup
                  slli         a3, s9, 17
                  slt          s3, a5, a1
                  srli         a5, t0, 22
                  nop
                  fsgnjx.s     fs3, ft10, ft8
                  mulh         s0, s6, s6
                  fcvt.wu.s    s5, fa3, rup
                  div          t3, t6, t6
                  fcvt.s.wu    fs5, s1, rdn
                  rem          t4, t2, s6
                  fmul.s       fs1, ft5, ft3, rup
                  fle.s        t6, fs7, fa2
                  mulhu        a3, a7, sp
                  mulh         gp, s10, tp
                  slli         ra, zero, 16
                  andi         ra, a7, -802
                  sll          s11, s2, t3
                  sub          a5, t6, zero
                  fcvt.w.s     zero, fs10, rtz
                  nop
                  mulh         a5, s9, s3
                  lui          t1, 122685
                  slti         s11, t6, -170
                  fcvt.s.w     fs0, s1
                  xori         s6, tp, 835
                  fsgnjn.s     fs5, fa6, fs9
                  mulh         t1, a3, t5
                  fsgnjn.s     fa7, ft11, fs9
                  sltiu        t6, t0, 573
                  slti         s11, a5, -1060
                  sltu         zero, s0, s6
                  mulhu        s10, a0, s6
                  ori          a0, ra, -1548
                  sub          t2, a3, s11
                  flt.s        s8, fs6, fs5
                  sub          s1, s11, s3
                  lui          t6, 339802
                  xor          s11, gp, s8
                  fsqrt.s      ft10, fs1, rne
                  fsub.s       fs3, fs8, ft1, rup
                  rem          s11, a6, s5
                  and          s0, s10, a3
                  fle.s        a3, fs3, fs5
                  andi         t3, sp, 1803
                  mulh         t0, s5, s6
                  mulh         s1, a2, gp
                  flt.s        ra, fa3, ft0
                  fcvt.s.wu    fs4, gp
                  remu         s10, a5, t0
                  fsub.s       ft10, fs1, fa1
                  lui          s5, 125898
                  slli         s9, a1, 17
                  nop
                  mulhsu       zero, t1, ra
                  flt.s        zero, ft8, ft0
                  fmin.s       fs3, ft4, ft3
                  nop
                  mulh         a5, gp, a7
                  divu         a7, t1, gp
                  srai         s9, s4, 25
                  fcvt.w.s     t4, fs11, rtz
                  sll          s10, a2, s0
                  mulhu        s0, a7, s6
                  fmv.w.x      ft3, t1
                  divu         s11, a6, s2
                  sra          s3, t1, s5
                  slli         a3, s8, 26
                  feq.s        s6, fs9, ft2
                  mul          a4, t0, s6
                  fmul.s       ft1, ft5, fa7, rne
                  mul          a5, a3, a3
                  addi         s7, t2, 235
                  remu         a0, a0, s10
                  fmul.s       fs11, fs7, ft11
                  fdiv.s       fa1, fa3, ft3
                  fsgnjn.s     ft4, ft5, ft7
                  fcvt.wu.s    s3, ft2
                  xor          a4, a4, s9
                  fcvt.wu.s    sp, fa2, rtz
                  lui          tp, 934401
                  fmin.s       fs5, ft9, fa2
                  mulhu        s7, a4, zero
                  fsgnj.s      fs11, fs7, fs0
                  fdiv.s       ft3, fs2, fs7, rup
                  or           s6, t3, s5
                  slli         s11, t2, 0
                  addi         zero, sp, 1929
                  slli         t4, s5, 23
                  fcvt.w.s     s8, fa7, rne
                  fdiv.s       fa4, fa0, ft8
                  addi         s1, t0, 1781
                  fcvt.wu.s    ra, fs8, rdn
                  fmin.s       fs4, fs1, fs11
                  fsgnj.s      fs10, ft3, ft7
                  remu         a4, a4, a6
                  divu         zero, s6, t5
                  mul          a0, zero, a3
                  fsgnjx.s     fa2, fs1, ft4
                  sltu         s3, a1, s2
                  mulhsu       s1, a5, s7
                  addi         s0, t6, -1387
                  srai         zero, ra, 6
                  fcvt.wu.s    a0, ft11, rtz
                  fclass.s     s5, fs5
                  fmv.x.w      s3, fs0
                  fsub.s       ft9, fs1, ft2
                  fcvt.wu.s    a5, ft10, rdn
                  fmv.x.w      gp, fs3
                  and          t3, gp, a2
                  and          sp, gp, s6
                  slt          s5, t5, a4
                  xori         s1, t0, -715
                  fdiv.s       ft1, ft0, fa4, rne
                  xor          s7, a1, zero
                  sll          a0, s4, gp
                  divu         a3, s8, ra
                  fmax.s       ft2, fs11, fa1
                  fsqrt.s      ft8, ft8, rup
                  divu         t1, t2, a2
                  fmin.s       ft8, ft5, fs10
                  fcvt.w.s     s7, fs8
                  nop
                  fmax.s       fa2, ft3, ft7
                  mulhu        s9, s9, s7
                  mulhu        s10, sp, a4
                  fmin.s       ft3, fs8, fs0
                  feq.s        t2, fa2, fs8
                  mulhu        a6, t4, s0
                  fmin.s       ft7, fs6, ft3
                  fsgnjn.s     ft9, fs1, ft8
                  xor          gp, t4, s2
                  mulhu        t1, s8, a4
                  sub          t4, t4, a6
                  flt.s        a7, fa3, fa3
                  andi         t0, t4, -841
                  remu         t6, t6, gp
                  and          t2, t5, a0
                  add          s7, a5, s7
                  rem          s1, gp, a3
                  slli         t2, a6, 19
                  slli         t2, s3, 6
                  mulhu        t2, tp, a4
                  fsqrt.s      fa0, fa5
                  fsgnjx.s     fs11, fs9, fs4
                  slli         a5, t5, 2
                  nop
                  fmv.x.w      ra, fa2
                  srl          s10, s6, t4
                  fadd.s       fs9, fa4, ft4
                  mulh         s0, s3, s1
                  sltiu        s1, tp, -653
                  fmul.s       ft5, fs9, fa7, rne
                  andi         s5, s11, 1113
                  fclass.s     zero, fs1
                  addi         t2, a7, -1132
                  mulh         tp, s1, zero
                  mulh         t4, t4, s2
                  xori         t1, a2, -1705
                  sltiu        a1, s2, -1585
                  fsgnj.s      fs0, fs10, ft6
                  slli         s8, tp, 30
                  fcvt.s.w     ft5, t3, rdn
                  divu         s9, a4, t4
                  and          s4, s6, s6
                  mulhu        tp, gp, a3
                  srl          s8, a3, tp
                  fmin.s       fa7, ft9, fa7
                  fsgnjx.s     ft5, fa5, fa6
                  xori         a5, a5, -2023
                  fcvt.wu.s    t0, fs1
                  fadd.s       fa5, fs7, fs3
                  add          sp, s5, s0
                  divu         zero, a5, gp
                  slli         s3, t1, 10
                  fsgnj.s      ft4, ft7, ft10
                  slt          zero, a7, s5
                  fsub.s       ft11, fa7, fa6
                  sltiu        ra, s10, -1283
                  srai         gp, t2, 4
                  fsgnjn.s     fa0, fs1, ft6
                  auipc        s3, 944167
                  lui          s3, 511011
                  add          s0, s2, a3
                  slti         a3, a3, 807
                  flt.s        ra, fs5, ft3
                  mulh         s11, s8, gp
                  srl          s10, s8, t0
                  add          s10, a4, a1
                  or           a6, a0, ra
                  xor          t0, s7, s4
                  fsub.s       ft6, fs2, fa7
                  xor          t2, t5, t2
                  slli         zero, a7, 8
                  xor          s1, gp, s9
                  slti         t6, tp, -158
                  fmv.w.x      fs10, t6
                  mulhsu       gp, ra, tp
                  add          s1, t0, tp
                  lui          s6, 341911
                  sltu         a7, a2, s9
                  srl          s1, t1, t1
                  fcvt.wu.s    sp, fs1
                  fadd.s       fa1, fa3, fs10, rne
                  mulh         a7, t6, t4
                  fmv.x.w      tp, ft9
                  mulhsu       a5, t6, t1
                  flt.s        a3, fs4, fs1
                  fdiv.s       fa1, fs9, fs2, rtz
                  mul          t0, s5, s0
                  sra          tp, tp, a1
                  and          zero, s6, tp
                  sltu         a4, s9, a7
                  srli         t6, s4, 30
                  sub          s0, gp, a1
                  srl          s5, s0, t5
                  lui          gp, 434160
                  sra          s3, s7, a5
                  remu         t6, s0, s4
                  fsgnjx.s     fs8, fa6, fa1
                  addi         s9, s8, -632
                  addi         s6, s5, 255
                  ori          a1, a5, -605
                  srai         t2, t1, 3
                  srl          sp, t6, s2
                  fsqrt.s      fa1, ft6, rup
                  mulh         s8, t1, s2
                  fcvt.s.w     ft11, s9
                  sll          a7, s4, s5
                  fmv.w.x      ft7, s0
                  mul          a6, s1, t3
                  flt.s        s0, fs8, fs9
                  fsgnjx.s     fa2, fs3, ft1
                  fcvt.s.w     ft6, a2
                  and          s11, t4, a6
                  srl          s0, tp, a7
                  srli         t4, ra, 12
                  fsgnj.s      fa6, fs4, ft9
                  fadd.s       fa1, fs5, fa1
                  mulhu        s7, a4, a3
                  srl          zero, a3, a6
                  auipc        t2, 617775
                  fsub.s       fs11, ft6, fs4
                  fsub.s       fs8, ft2, fa1
                  sltu         a6, s1, a6
                  mulhu        t6, t5, t1
                  srl          t2, s5, s1
                  fsgnjx.s     fs6, fa4, fs1
                  xori         sp, s10, -1823
                  nop
                  fcvt.s.w     fs2, a2
                  fmv.w.x      fs6, zero
                  sub          gp, ra, s9
                  slt          s9, s9, t2
                  auipc        t6, 277507
                  fsgnj.s      ft9, ft9, fa6
                  fmv.x.w      zero, ft6
                  fmul.s       ft10, fs9, fs6, rdn
                  fle.s        t4, ft10, fs0
                  lui          gp, 473580
                  fclass.s     s11, ft5
                  andi         a7, ra, -1149
                  fsub.s       ft7, ft3, fs4, rmm
                  remu         t0, s0, s10
                  auipc        s1, 566790
                  lui          t0, 170325
                  sltiu        s9, s4, -169
                  sll          gp, s0, a3
                  srli         t2, a2, 5
                  fadd.s       ft9, ft1, ft5, rmm
                  slli         sp, s1, 2
                  fsgnj.s      fs8, fa7, fa1
                  sub          a7, t6, s11
                  fcvt.s.wu    fa1, t6, rtz
                  fsgnjn.s     ft3, ft9, ft0
                  fclass.s     t2, fs8
                  flt.s        t2, fa5, ft11
                  srai         zero, t0, 31
                  ori          a4, s5, 1460
                  fsgnj.s      fa5, ft1, fs6
                  sltiu        s7, t0, -259
                  sub          s4, s6, a1
                  andi         t3, a4, -1334
                  fclass.s     a0, fs11
                  mulhsu       s10, s4, s1
                  xor          t1, s10, a7
                  flt.s        t2, fa2, fa5
                  fadd.s       ft2, ft2, ft5, rne
                  fcvt.s.wu    fs1, sp, rne
                  add          t3, zero, a7
                  srli         s10, t4, 8
                  srli         s7, t0, 13
                  xor          s0, gp, t4
                  srli         s9, s7, 14
                  feq.s        s6, ft5, ft0
                  fsgnjn.s     fs7, fs3, fs4
                  fmv.x.w      tp, ft3
                  mulhu        a0, s7, t0
                  fmin.s       ft7, fa7, ft7
                  sra          s11, a3, s5
                  sub          a4, ra, s4
                  fcvt.w.s     t3, fa6, rne
                  flt.s        s9, fs3, ft11
                  sub          s10, s11, t2
                  fcvt.s.w     fs10, a0, rtz
                  fle.s        s4, fa5, ft6
                  divu         sp, tp, s3
                  fcvt.s.w     ft7, a7
                  remu         gp, s4, s7
                  or           s7, a2, a1
                  slt          a6, s7, sp
                  srai         a1, t3, 17
                  fmax.s       ft10, ft5, ft7
                  srl          s3, a1, t1
                  rem          s4, a0, a0
                  xori         a6, a5, 324
                  addi         t2, s9, 724
                  rem          ra, a6, t5
                  or           gp, s8, s4
                  fsub.s       ft11, ft1, ft4
                  sub          a1, a5, ra
                  add          a1, a7, s2
                  fsgnjx.s     fa7, ft4, fa4
                  fmv.x.w      tp, ft10
                  mulhsu       s3, t6, s1
                  fadd.s       fs7, fs8, ft1
                  div          s9, s9, a2
                  remu         a5, s3, a6
                  mulhu        s10, s2, ra
                  nop
                  lui          a0, 492158
                  mulh         a3, zero, s7
                  mulh         t6, s5, ra
                  srai         zero, s11, 23
                  add          ra, a1, t6
                  slli         a0, a7, 0
                  sll          t1, gp, sp
                  fclass.s     ra, fa6
                  srli         s3, s6, 27
                  xor          s9, zero, s4
                  sub          ra, a6, a3
                  fadd.s       ft5, ft5, fs7
                  fsgnj.s      ft10, fa2, ft7
                  fsgnjn.s     fs11, fa3, fs2
                  sltu         s3, t1, s2
                  auipc        t2, 748705
                  sltu         t2, zero, a2
                  sltu         t6, s2, s9
                  xori         s9, a3, -225
                  fdiv.s       fs2, ft11, fs11
                  add          a5, s4, zero
                  or           a4, s0, a4
                  fle.s        a4, fa2, fs7
                  fcvt.s.w     fs3, ra
                  slti         a0, s11, -899
                  fsgnjn.s     fs8, ft6, fa3
                  mulhu        a5, t4, gp
                  fmin.s       ft3, ft6, fs5
                  addi         ra, s8, -1531
                  slt          t2, s5, t0
                  nop
                  srli         t3, s6, 7
                  slli         a6, a3, 20
                  fsgnjn.s     fs8, fa6, ft7
                  xor          t4, a4, ra
                  srli         zero, a7, 7
                  fclass.s     gp, fa2
                  fmin.s       ft8, ft3, fs5
                  fmin.s       ft7, fs5, fa1
                  mulhsu       zero, s2, s4
                  sra          t6, tp, a3
                  slli         a7, a0, 1
                  fadd.s       fs2, fa6, fs3, rup
                  nop
                  sub          a7, s3, tp
                  fmax.s       ft3, fs1, ft0
                  feq.s        a4, fs0, ft8
                  fdiv.s       fs1, fa4, fa5
                  srl          s0, a1, t2
                  fsqrt.s      fa0, ft3, rdn
                  rem          a7, s2, s10
                  addi         tp, a4, 1447
                  fsgnj.s      fa0, fa0, ft7
                  fmv.x.w      s1, fa6
                  fclass.s     s8, ft9
                  mul          a1, a7, t1
                  addi         t3, s10, -961
                  rem          s11, tp, sp
                  addi         t4, t3, -1543
                  divu         t1, sp, t4
                  srli         tp, a2, 4
                  slti         t0, t2, 118
                  sra          a5, t1, t0
                  sra          s11, s1, t0
                  fsgnj.s      ft0, fs7, fs10
                  sltu         s10, s0, t1
                  slti         t6, a2, -796
                  auipc        zero, 267737
                  addi         s1, s11, 1286
                  fmul.s       fa0, fs4, ft8, rmm
                  slt          t3, a5, t0
                  sltu         s5, s4, t1
                  fdiv.s       fs5, fs1, ft10, rtz
                  srai         a5, a7, 11
                  fmv.w.x      fs9, a6
                  nop
                  andi         s9, t5, -429
                  slti         s9, t5, -1948
                  fclass.s     a0, fa6
                  sltiu        s7, s3, 257
                  or           s10, a7, t0
                  fmax.s       fs5, ft1, ft3
                  fsqrt.s      fa7, fs6, rdn
                  feq.s        s4, ft3, ft1
                  sub          t4, t0, t6
                  fsgnjx.s     fa6, ft10, fa6
                  lui          tp, 585626
                  fcvt.w.s     a7, fa5, rtz
                  nop
                  slti         s9, a3, 1561
                  fsub.s       fa7, fs0, ft1, rdn
                  sra          s11, s4, a5
                  fcvt.s.wu    fa6, t0, rmm
                  fsub.s       fs4, ft0, fs10
                  fmv.w.x      fs10, a3
                  fsgnj.s      fs9, ft3, fa4
                  addi         zero, sp, 59
                  xori         t4, s9, -702
                  xori         a5, s7, 1794
                  fsqrt.s      ft0, fs1
                  fcvt.w.s     t3, fa0, rmm
                  nop
                  rem          tp, t5, t4
                  fsqrt.s      ft3, ft10, rmm
                  fmin.s       fa7, fa7, fs8
                  rem          a1, ra, s6
                  slt          t0, s1, a7
                  srai         t3, ra, 15
                  fmv.x.w      a7, fs5
                  feq.s        s9, fs10, ft3
                  fcvt.s.w     fa2, t3
                  lui          ra, 172779
                  fcvt.s.wu    fs11, s6, rtz
                  fmax.s       fs11, fs0, ft3
                  or           a7, gp, t3
                  fsgnjn.s     ft10, fs3, fs9
                  addi         s6, tp, -1649
                  srli         gp, s2, 10
                  addi         s0, a6, -1018
                  fclass.s     a7, ft10
                  fmv.x.w      s6, ft8
                  flt.s        t2, ft6, ft2
                  fcvt.s.w     ft8, gp, rne
                  fsgnjx.s     fs5, ft10, fa7
                  xor          sp, a2, a5
                  fmin.s       fs4, ft0, ft0
                  sltiu        s0, s11, 387
                  xor          t6, s0, s11
                  fsub.s       fa0, fa6, ft0, rtz
                  and          a7, gp, sp
                  slt          a6, s4, s5
                  sub          s4, s4, gp
                  feq.s        s8, ft8, ft4
                  lui          tp, 323654
                  fmv.w.x      ft8, s1
                  fmv.x.w      t4, fs11
                  remu         s11, t6, t6
                  srai         a0, a1, 8
                  ori          t4, s10, 1828
                  slti         a6, t6, -444
                  remu         t3, a4, a2
                  fcvt.s.wu    ft0, s2, rup
                  andi         t0, t2, 406
                  lui          s1, 905611
                  slli         t0, a4, 10
                  sltiu        s10, a6, -1711
                  sra          a1, t6, a4
                  sltu         s11, s2, a5
                  fdiv.s       fa3, fa7, ft9, rup
                  divu         a4, a6, gp
                  slt          s1, a0, t2
                  slli         t3, s10, 9
                  sltu         s9, s4, t3
                  fcvt.w.s     s8, ft1, rtz
                  fclass.s     zero, ft7
                  divu         s5, s7, s10
                  add          s4, s1, t0
                  fmin.s       fa0, fa5, ft2
                  ori          a0, s6, -276
                  slti         zero, gp, 1899
                  or           s3, s5, s4
                  sltu         t4, a3, tp
                  sltiu        s6, a0, -1815
                  fcvt.w.s     t4, fs0, rdn
                  or           t2, tp, tp
                  fsub.s       ft6, fs2, fa6, rtz
                  fmax.s       ft11, fs11, ft0
                  fclass.s     s6, ft11
                  fle.s        t2, ft5, fs11
                  fadd.s       fa3, fs11, ft11
                  ori          t1, a1, 1776
                  mulhsu       t2, s0, s3
                  fmul.s       ft7, fs9, fa3
                  add          a1, s9, t3
                  sra          t4, a2, t1
                  fdiv.s       fs4, ft9, fa1
                  add          s6, s1, a2
                  lui          t0, 595305
                  srai         sp, t5, 4
                  andi         s6, s6, -757
                  srli         a4, s2, 21
                  xori         tp, s2, -1046
                  sra          s9, s2, s1
                  fcvt.s.w     fs3, tp
                  fmv.w.x      fa4, s10
                  fcvt.s.w     ft3, s5, rup
                  fmax.s       fs10, fs5, ft5
                  fmax.s       ft2, fa5, fa0
                  fle.s        t6, fs6, fs1
                  slt          a3, zero, a2
                  mulh         s10, a5, t4
                  fcvt.s.w     ft3, t6, rmm
                  mulhu        gp, a5, s7
                  auipc        s6, 266001
                  nop
                  sll          s3, a1, s2
                  fclass.s     a7, fa3
                  srai         s9, t3, 29
                  mulhu        s6, s5, a2
                  fcvt.w.s     a5, ft1, rmm
                  fsgnjn.s     fa7, ft8, ft3
                  and          a4, t0, a4
                  div          s10, s1, t0
                  fmv.x.w      t1, ft0
                  fclass.s     a6, fa3
                  sra          tp, s2, a4
                  sub          s8, s7, gp
                  mulhsu       s5, a7, a0
                  fsgnjx.s     fs8, fs11, fs1
                  mulhu        s9, t0, a3
                  fsgnjn.s     ft3, fs1, fs0
                  xor          s0, zero, a5
                  fadd.s       fa3, fa4, fa2
                  fmul.s       fs2, ft11, fs4
                  remu         a4, sp, t5
                  feq.s        a7, ft1, ft10
                  fle.s        a6, ft7, ft8
                  sll          ra, s3, t0
                  mulhsu       gp, a5, a6
                  fsgnjn.s     ft0, fa3, fs2
                  xor          s10, a4, a0
                  addi         a4, a2, 1245
                  andi         tp, s2, -1510
                  sltiu        a7, s1, -1251
                  fclass.s     s3, fa3
                  fadd.s       fs11, ft11, ft2, rup
                  srli         a3, t5, 25
                  add          ra, a6, s11
                  fclass.s     ra, ft6
                  nop
                  ori          s0, t4, -636
                  fsub.s       fa2, ft10, fa1
                  fsgnjx.s     ft9, ft3, ft8
                  feq.s        s4, fa1, fs2
                  mulhu        s0, s2, t5
                  fsgnj.s      fs9, fs1, fs9
                  sltiu        a1, a7, 1899
                  fclass.s     s11, fa3
                  fmin.s       ft6, ft8, ft6
                  slli         a0, zero, 22
                  and          s3, s8, s4
                  xori         t0, t0, -694
                  and          a7, sp, t5
                  xor          s1, t0, s10
                  fmv.w.x      fs0, zero
                  sltiu        s10, t6, 1719
                  or           sp, s9, s2
                  fadd.s       fs7, fs10, fs5
                  sub          s7, s8, t5
                  nop
                  fmax.s       ft4, ft1, fs11
                  srai         a6, ra, 10
                  xor          zero, a7, t2
                  flt.s        s6, fa6, fa0
                  addi         s5, t6, -1327
                  fmax.s       fa5, ft9, fs0
                  srai         t0, s7, 9
                  fdiv.s       fs7, ft3, fa5
                  fcvt.s.w     fs11, gp
                  mulhsu       s6, sp, t0
                  feq.s        s9, fs5, ft4
                  div          a7, t5, a2
                  or           sp, t0, zero
                  sll          zero, t4, s11
                  rem          a6, s0, ra
                  fcvt.s.wu    ft6, gp, rne
                  fcvt.w.s     sp, fs9
                  or           s7, s8, s7
                  addi         a4, s0, -1716
                  and          s1, t4, s3
                  fmin.s       ft11, ft10, fa6
                  divu         s3, a5, t3
                  fmax.s       fs2, fs6, fa2
                  sll          s10, s6, s3
                  fcvt.s.w     ft5, s1
                  addi         s1, sp, -1815
                  slti         a5, a2, 555
                  sltiu        t1, t5, 395
                  fmax.s       fa1, fs1, ft6
                  fmul.s       ft8, fa3, fs9
                  add          t2, t6, a1
                  divu         a7, a5, s1
                  fmv.x.w      s4, fa4
                  fmin.s       fa3, fa0, fs10
                  fmv.x.w      t3, fa4
                  fmax.s       fa7, ft10, fa0
                  mul          s8, t1, s4
                  div          s4, t1, t2
                  and          a3, t0, gp
                  flt.s        ra, ft11, ft7
                  slti         s8, s4, 1733
                  xor          a6, s1, s8
                  fcvt.wu.s    t2, fs3
                  mulhu        s3, s3, a2
                  fmul.s       fs11, fa7, fs5, rmm
                  fsub.s       ft6, ft3, fs11, rup
                  xor          gp, tp, a1
                  divu         a1, sp, s3
                  fsgnjx.s     ft0, ft0, fa3
                  lui          tp, 342274
                  fsgnjn.s     fs0, fs5, ft5
                  remu         t6, tp, a7
                  auipc        sp, 224223
                  ori          a7, a2, 740
                  rem          a1, s5, a1
                  mul          t1, gp, t6
                  sltu         t6, t4, a4
                  fsgnjx.s     ft10, fa0, ft1
                  fsub.s       fs3, ft3, fs10, rtz
                  sub          a7, a5, a1
                  xor          a3, t0, a3
                  mul          t0, s2, t5
                  sub          a5, sp, a7
                  srli         t2, t5, 9
                  add          zero, s11, s2
                  add          t1, t2, t5
                  fle.s        s1, fa0, ft4
                  fmin.s       fs1, fa4, ft2
                  fmul.s       fs10, ft8, ft2, rtz
                  fle.s        sp, fs5, fs7
                  fsgnjn.s     ft0, fs1, fs5
                  slli         a3, s5, 2
                  nop
                  fmv.x.w      s11, fs5
                  fsub.s       fs5, fs2, ft1
                  fcvt.w.s     s9, ft9
                  fcvt.wu.s    a6, ft5, rdn
                  mulh         t4, sp, ra
                  fsgnj.s      fs8, fa5, fs1
                  fmul.s       fs10, fs11, fa6, rne
                  fsgnjx.s     fs3, fa5, fs9
                  sltiu        s7, s11, -2037
                  fclass.s     s11, fs3
                  mulhsu       s1, s5, s10
                  div          t3, a6, gp
                  srl          a4, ra, s0
                  sll          tp, s9, a0
                  slt          a6, s11, a6
                  sltiu        ra, a1, 1149
                  or           t0, gp, t5
                  fclass.s     a3, ft2
                  slti         zero, t6, 1526
                  srai         sp, s1, 19
                  fmax.s       fa2, fa2, ft10
                  fmv.w.x      ft8, t6
                  srai         s0, tp, 29
                  or           gp, s9, zero
                  flt.s        tp, fs5, fs8
                  fadd.s       fs2, ft10, ft5, rup
                  fdiv.s       ft11, fs0, ft1, rne
                  slli         a4, a7, 17
                  slli         zero, a0, 5
                  fsub.s       ft10, fs5, fa5, rdn
                  fsgnjn.s     fs10, fs0, ft1
                  fmin.s       fs10, fs6, fa4
                  fmul.s       fs9, ft6, fa5, rtz
                  and          a4, a3, t1
                  fadd.s       ft8, ft5, ft6, rtz
                  slt          s3, s9, s2
                  fclass.s     sp, ft1
                  fsgnjn.s     ft3, ft2, ft6
                  mulhsu       s0, a5, a3
                  flt.s        t1, fa5, ft2
                  fsub.s       fa7, fs8, ft6
                  srli         a6, a2, 12
                  rem          a3, t1, s4
                  sra          t1, s4, a6
                  divu         t0, s2, t5
                  fsgnj.s      fa7, fs8, fa6
                  fsgnjx.s     fa7, fs5, fa3
                  xori         t6, s5, 2019
                  rem          s3, s10, sp
                  fsgnjx.s     ft5, fs1, fa3
                  ori          s11, a2, -733
                  fcvt.w.s     s8, ft7
                  slt          sp, t4, t0
                  srai         s5, s9, 12
                  divu         t3, a2, t4
                  fadd.s       ft2, fs8, fa7
                  xori         s8, a7, 1421
                  fmv.x.w      t1, fs1
                  mulh         t3, t1, a0
                  srl          ra, s10, s8
                  andi         a3, t0, -792
                  fsqrt.s      ft9, fs3, rup
                  or           s4, sp, s7
                  feq.s        a4, fa1, ft11
                  fsqrt.s      ft6, fa0
                  lui          s11, 807853
                  slt          a4, t2, s11
                  fcvt.wu.s    s6, ft5
                  ori          a6, t0, 973
                  fcvt.wu.s    s9, ft11
                  fsgnj.s      fa6, ft10, fa4
                  fle.s        zero, fa1, fs0
                  slli         ra, s1, 17
                  fmax.s       ft3, fs3, ft10
                  fsqrt.s      ft7, ft8
                  fsgnjn.s     fs7, fa0, fs11
                  andi         s1, s3, 1909
                  fcvt.wu.s    t0, fa3, rtz
                  fcvt.w.s     a1, ft11, rne
                  mulh         sp, s8, a3
                  fsgnjn.s     fa5, fa2, fa7
                  mulhu        s0, a6, t4
                  fmul.s       ft7, ft3, fs3
                  fcvt.s.wu    fs2, t4, rdn
                  and          a7, a5, zero
                  remu         t6, a1, a1
                  flt.s        a1, fa5, fa5
                  fcvt.w.s     sp, fs11
                  sll          sp, t4, t3
                  flt.s        t4, fa5, ft4
                  div          a5, t0, s6
                  flt.s        t1, fs10, fa5
                  fmv.w.x      ft8, t4
                  fmin.s       fs10, ft7, fs7
                  srai         t2, t3, 3
                  lui          zero, 893062
                  fcvt.wu.s    a0, ft10, rdn
                  rem          t6, s8, tp
                  auipc        s6, 315167
                  fcvt.wu.s    a5, ft7, rdn
                  auipc        a4, 636948
                  or           a5, t2, s6
                  fmul.s       fa2, ft2, ft7, rmm
                  andi         s0, t4, 1120
                  add          a6, s10, a3
                  xori         t1, s7, -975
                  divu         a7, t5, s4
                  mul          t6, a1, s11
                  lui          a7, 584253
                  fsgnjx.s     fs5, ft2, fs3
                  fcvt.s.w     fs1, s9
                  sltu         s8, tp, gp
                  ori          s9, zero, -1702
                  mulhu        a5, s3, s6
                  srl          a4, s2, s0
                  fle.s        a7, fs4, fs3
                  fsgnj.s      ft11, ft9, fs0
                  fmax.s       fs6, ft11, fa2
                  andi         a5, sp, -794
                  mulhsu       s8, a5, a5
                  or           s11, a3, t6
                  andi         a5, s9, -901
                  xori         t0, a5, 2047
                  fdiv.s       fs8, fs8, fa2, rup
                  srai         t3, a2, 16
                  fsgnjx.s     fs5, ft6, ft10
                  sra          sp, s10, t5
                  mul          t6, a7, a5
                  fsgnjn.s     fs4, ft3, fs9
                  srli         a1, sp, 4
                  slli         a7, s3, 0
                  fsgnj.s      ft6, fa7, fs8
                  nop
                  slli         s1, s10, 12
                  srai         ra, s3, 2
                  sltu         s7, s1, t0
                  slti         s6, tp, -1026
                  fsub.s       ft7, fs9, fa7, rtz
                  divu         t3, t5, a7
                  fle.s        t2, fa5, ft4
                  fclass.s     t2, fa2
                  add          s5, t1, s7
                  mulhu        a6, s4, a6
                  fadd.s       fs9, fa2, fs4, rne
                  fclass.s     a5, ft7
                  addi         a3, s4, -1486
                  slti         zero, s8, -1312
                  and          s7, a4, s0
                  fcvt.s.wu    fa5, a7
                  sub          t6, t3, s7
                  add          s3, s10, s1
                  andi         s7, s6, -633
                  srai         s4, t5, 17
                  sub          s6, t6, t5
                  fcvt.s.wu    fs10, t2, rne
                  rem          s5, a1, s8
                  sltu         s6, s10, ra
                  fclass.s     tp, ft10
                  fcvt.wu.s    tp, fa5, rtz
                  slt          a6, t6, s1
                  fle.s        s11, ft8, fa2
                  fsqrt.s      fa5, fa3, rtz
                  nop
                  mulhu        s9, t0, a4
                  mulhsu       a0, s8, t2
                  mulhu        t6, a5, t3
                  fsgnj.s      ft9, ft1, ft11
                  fmv.w.x      fs9, s3
                  lui          t4, 75018
                  fcvt.s.w     ft2, t3
                  slli         a7, t0, 23
                  divu         t6, a5, t5
                  addi         t4, t5, -1909
                  divu         t0, tp, a5
                  sub          t0, s11, t5
                  auipc        a1, 570016
                  sub          a4, s8, tp
                  srl          sp, s7, s9
                  fcvt.w.s     s6, ft6
                  fle.s        s6, fs6, fa2
                  divu         gp, tp, t2
                  div          a4, tp, tp
                  lui          s10, 729639
                  lui          t6, 973380
                  fle.s        s8, fa7, fa2
                  auipc        ra, 2002
                  fsgnj.s      fs8, ft7, ft7
                  slli         a0, s5, 17
                  fsgnjx.s     fs4, ft9, fa2
                  sra          a6, s5, s4
                  xor          s9, t5, t2
                  add          t0, zero, t6
                  sll          s3, s8, tp
                  remu         t1, a3, s10
                  sltiu        t6, t3, 1803
                  fsqrt.s      ft3, ft9, rmm
                  fadd.s       fs4, fa7, ft0, rmm
                  mulhu        s1, s9, s6
                  fsgnjx.s     fs4, fs6, fs1
                  srai         t0, s9, 11
                  sra          a0, s9, zero
                  rem          a4, gp, s3
                  fmv.w.x      fs5, a1
                  fmv.x.w      a3, fa4
                  srli         a4, s8, 29
                  fmul.s       ft5, fs2, fs0
                  xor          a7, a5, s3
                  mulhu        s9, s8, a4
                  mulhu        ra, a7, s10
                  sra          s5, s2, s0
                  xori         gp, s2, 1079
                  fmul.s       fs4, fs8, fs0
                  lui          s10, 211076
                  fsgnj.s      fs4, fa4, ft11
                  slt          s3, t5, s11
                  sltu         a4, a7, s8
                  auipc        a4, 264989
                  slli         s7, s3, 4
                  mul          t0, zero, s0
                  div          t0, s7, tp
                  ori          s7, s2, -1367
                  sltiu        s9, s8, -635
                  sltiu        a1, s5, 781
                  slti         s6, t6, 508
                  mulh         a3, s0, t6
                  fcvt.wu.s    t4, fa3, rdn
                  addi         s4, s10, -264
                  feq.s        t1, fa2, fs4
                  xor          t0, t1, zero
                  fcvt.s.w     fs4, s2
                  mulhu        s11, t4, a6
                  mulh         t4, s10, a3
                  fsub.s       ft9, fs4, fs5, rne
                  fcvt.s.wu    fs3, s2, rne
                  fmul.s       ft11, fs11, ft5
                  srli         a1, t2, 24
                  lui          s11, 800868
                  lui          s4, 567610
                  or           s3, s11, t2
                  fclass.s     s1, ft2
                  flt.s        a0, fa6, fs3
                  fmax.s       ft7, ft7, ft9
                  mul          a0, s2, s0
                  fsgnjx.s     fs10, fs6, fa1
                  srli         s10, t3, 17
                  nop
                  ori          t6, s3, 1701
                  fcvt.s.wu    fs2, a4, rne
                  nop
                  lui          gp, 843033
                  fsgnjx.s     ft5, fs5, fs1
                  fmv.x.w      sp, ft4
                  fadd.s       ft10, fa6, fs3, rdn
                  divu         t0, s4, tp
                  fle.s        s0, ft9, fa7
                  ori          s7, t6, 1902
                  mulh         a7, t0, s0
                  sll          s0, s1, s5
                  fclass.s     s8, fa6
                  addi         s5, t2, 1975
                  srai         t6, s2, 29
                  fclass.s     a0, fs5
                  slt          s9, ra, t6
                  add          s1, t5, s11
                  srli         t6, sp, 0
                  fcvt.s.w     fs1, a1
                  srl          a3, a7, t4
                  sub          s9, a3, s3
                  div          a7, s0, s5
                  fdiv.s       ft2, fs1, fs10
                  addi         s3, sp, 1954
                  slt          sp, s8, t5
                  slt          t6, a5, s8
                  sltu         a7, s11, t5
                  slti         s4, a2, 890
                  mulh         tp, s6, t1
                  xor          a5, t4, s11
                  mulhsu       s10, t3, t2
                  sra          s7, t3, a1
                  fcvt.wu.s    gp, fa0
                  add          tp, s11, s5
                  mulhu        tp, a7, t1
                  div          t6, s4, a5
                  fsgnjx.s     fa6, ft10, fs6
                  andi         sp, a2, -1541
                  fdiv.s       ft4, fs6, fs7
                  and          s0, a0, t3
                  fclass.s     t4, fs7
                  xor          tp, t4, s8
                  slt          s4, a4, gp
                  sra          s4, a7, a0
                  fcvt.s.w     fs4, zero, rmm
                  andi         tp, s6, 1104
                  fadd.s       fa0, ft2, ft3
                  slt          a0, t5, s9
                  mulh         s3, s4, a0
                  nop
                  rem          t3, t4, a4
                  remu         t2, a4, t4
                  fcvt.wu.s    t0, fa6, rup
                  nop
                  lui          sp, 1046294
                  slti         s1, s3, -1485
                  add          a6, tp, t5
                  xori         a5, t2, -1568
                  mulhsu       zero, t6, a1
                  divu         s11, ra, gp
                  fmv.w.x      fs10, t1
                  fsgnjn.s     fs6, fa2, fs0
                  mul          s7, gp, s0
                  fcvt.wu.s    t3, ft4, rup
                  addi         t6, s0, -371
                  ori          s0, a4, -830
                  fclass.s     t1, ft7
                  nop
                  fsgnjn.s     fa6, fa2, fa1
                  div          a0, a6, s11
                  mulhsu       s0, a0, s11
                  mul          t4, zero, s7
                  nop
                  sll          t0, s7, s0
                  fmul.s       fs7, fs7, fs1, rdn
                  mulhsu       s6, a6, s6
                  sltu         zero, s4, s11
                  srli         t6, t0, 29
                  auipc        s11, 1032006
                  div          gp, t5, s6
                  fcvt.s.w     ft6, s1, rdn
                  fle.s        a4, fa7, fs10
                  fsub.s       ft5, ft4, fs2
                  fmax.s       ft6, fa2, ft8
                  mulhsu       t3, s3, a2
                  mulhsu       a7, s6, s4
                  fcvt.w.s     gp, ft2
                  lui          s1, 881739
                  fcvt.s.wu    fa1, s4, rup
                  fcvt.s.w     fs10, tp
                  sltiu        a3, a6, 1344
                  andi         s10, s11, -1260
                  fsub.s       fs0, fs5, fs8
                  slti         a5, s6, -1961
                  add          zero, a6, a6
                  fclass.s     s5, fs9
                  fsqrt.s      fs5, fa5
                  srli         t1, t2, 20
                  fmul.s       fa4, fa6, ft8, rmm
                  xori         a7, a5, 1360
                  div          a5, s8, s11
                  remu         s7, a1, sp
                  fadd.s       ft6, fa4, ft7
                  slli         t2, t0, 16
                  or           s8, s9, s8
                  fcvt.wu.s    s1, ft1
                  fadd.s       fs1, ft9, fs6, rne
                  fsgnjx.s     fa2, fs4, fa3
                  div          s11, t4, s7
                  fmul.s       fa5, fs9, fs7
                  fmv.w.x      fs0, a1
                  fle.s        s6, fa3, fs5
                  fmul.s       fs7, ft1, fa3
                  mulhsu       a7, s8, a4
                  fsub.s       fs4, ft10, ft5, rup
                  sll          s10, tp, a3
                  fle.s        t0, fs10, ft10
                  addi         s10, a4, 309
                  fcvt.w.s     s9, fs4, rne
                  fsgnjn.s     ft10, fa5, ft6
                  auipc        a0, 685401
                  flt.s        a4, fa5, ft11
                  fcvt.wu.s    s11, fs10
                  fle.s        s11, ft1, fs3
                  fle.s        s3, ft7, fa7
                  addi         tp, s2, -543
                  srl          t3, s8, a7
                  fle.s        zero, fs10, fa4
                  fle.s        a1, fs3, fs11
                  sra          t3, s5, s7
                  sub          tp, a5, s5
                  fmv.w.x      ft4, t5
                  div          s10, s3, a0
                  srl          a1, s5, a7
                  sra          s11, a1, gp
                  slt          s3, s9, gp
                  sltu         a6, t5, gp
                  addi         s10, s1, 1141
                  mulhsu       s1, t0, s4
                  lui          tp, 901068
                  srli         s0, s9, 22
                  remu         t1, a0, s11
                  xori         tp, a5, 794
                  fsgnjx.s     fs2, fs7, fa6
                  xori         s1, a7, 381
                  slti         s7, a0, -899
                  fcvt.wu.s    zero, ft10, rdn
                  mulhsu       ra, s7, s7
                  mulhu        a5, s6, zero
                  divu         a7, a1, a2
                  fle.s        a6, fa2, fs5
                  ori          t2, s2, -822
                  sll          a5, s1, s1
                  sll          t3, a3, zero
                  fle.s        t4, fs4, fs9
                  fsub.s       ft10, ft3, fs11
                  divu         a3, s10, t6
                  addi         t3, a3, 965
                  div          zero, t0, sp
                  sll          a5, s10, tp
                  srl          s9, t1, s1
                  fcvt.wu.s    sp, fs4
                  fsgnj.s      fs2, fs9, fa4
                  mul          a3, t1, s2
                  fmul.s       ft6, fs9, ft9
                  srai         a7, s0, 2
                  fcvt.s.w     fs8, t6
                  fle.s        ra, fa5, ft9
                  fmax.s       fs7, fa2, fa4
                  fdiv.s       fa4, fa1, ft1
                  xori         s1, s5, 1662
                  slli         s11, s8, 8
                  or           t3, t5, t3
                  and          s11, ra, a7
                  fsgnjx.s     ft4, fs8, fs10
                  ori          s9, s4, 281
                  fsgnjn.s     fa2, fa2, fs5
                  fcvt.s.wu    ft4, s3
                  fmin.s       ft5, fa3, fs6
                  and          t6, t2, s6
                  fsgnjx.s     ft10, ft5, fa1
                  slti         s0, tp, -1931
                  fmax.s       fs4, fa1, ft9
                  fsgnjn.s     fs3, ft6, fa1
                  sra          zero, s0, s4
                  sra          a3, a6, t0
                  xor          t1, a0, ra
                  mulhu        a7, s2, s5
                  mulhu        s3, s5, sp
                  srl          a0, a1, tp
                  fmul.s       fs5, ft2, ft7, rdn
                  andi         t0, t3, 654
                  fdiv.s       ft5, ft2, ft1, rmm
                  fle.s        a6, ft1, fs1
                  andi         s5, tp, 181
                  slti         t1, t5, 149
                  fsub.s       ft7, fs11, fa3
                  fsgnjn.s     fa7, ft7, ft4
                  remu         sp, a2, s2
                  fadd.s       fa3, fs7, ft8
                  fcvt.s.wu    ft8, a7
                  fadd.s       ft7, ft7, fa0
                  fmv.x.w      s3, fs2
                  fcvt.s.w     fa3, s3
                  mulhsu       a3, s5, a7
                  fcvt.wu.s    gp, fa6, rne
                  sll          tp, a3, a3
                  srli         s8, t3, 0
                  fle.s        s4, fs10, ft11
                  slt          a6, s2, s3
                  sll          gp, ra, s8
                  fmv.x.w      a5, fs8
                  divu         s5, s6, sp
                  mulhu        a5, a7, s6
                  sub          s11, s0, s8
                  ori          s1, a2, 958
                  rem          s8, a0, s10
                  fmin.s       fa7, fa3, ft4
                  remu         a3, tp, s7
                  div          s1, s0, s0
                  fcvt.s.wu    fs7, tp, rtz
                  fle.s        s5, ft4, fs2
                  fmul.s       ft7, fs5, ft11, rdn
                  fadd.s       fa5, ft3, ft1
                  mulhsu       a3, t0, a1
                  xori         t0, sp, 1868
                  sub          t6, t6, s10
                  mul          s10, s3, tp
                  sra          s9, a4, gp
                  fsgnjx.s     fs5, ft5, fs3
                  flt.s        s6, ft8, fs0
                  ori          t2, a0, -1567
                  fmv.w.x      fa3, s7
                  lui          s6, 689714
                  fsub.s       fs5, fa5, fa2
                  rem          s6, gp, a6
                  auipc        s0, 922748
                  fsgnj.s      fs5, ft7, fa7
                  feq.s        t3, fa5, fs1
                  fadd.s       ft1, ft1, ft1
                  srai         a4, sp, 4
                  fsgnjx.s     ft10, fs6, fa0
                  rem          a5, gp, s6
                  sub          s6, s10, s1
                  srai         a3, s5, 13
                  fsgnj.s      fs8, fs6, ft2
                  nop
                  ori          t2, tp, -908
                  rem          t2, a7, s0
                  xor          s5, s0, s7
                  sltiu        a0, s5, 820
                  xori         zero, sp, -1757
                  fmax.s       ft6, ft3, ft1
                  fclass.s     a7, ft11
                  mul          a0, a6, s1
                  fclass.s     a7, fa1
                  fsgnjx.s     ft1, fa0, ft1
                  fmv.x.w      s1, fs6
                  fmv.x.w      a7, fs7
                  sra          t6, sp, t3
                  ori          s6, gp, 970
                  mulh         a1, t5, a3
                  lui          t4, 1045162
                  ori          s9, a0, -73
                  fcvt.w.s     a4, fa5, rup
                  fdiv.s       ft10, fa0, fa5, rdn
                  sub          sp, t1, tp
                  sltiu        sp, s1, -1508
                  fadd.s       ft9, ft9, fa3
                  fle.s        s5, ft5, fs7
                  fmul.s       fa0, ft5, fs11
                  lui          s11, 168516
                  fmv.w.x      ft8, s11
                  mulhu        s5, t0, gp
                  fsub.s       ft4, ft6, ft9, rmm
                  sub          a6, a7, s1
                  srai         a5, sp, 6
                  div          s6, t4, s5
                  xor          t6, t1, t1
                  divu         zero, t6, a7
                  mulh         tp, s8, sp
                  andi         a7, t0, 145
                  fcvt.s.wu    fs0, s6
                  fmv.x.w      t2, fa1
                  xor          s3, s1, zero
                  ori          a7, a3, -199
                  divu         t0, s4, tp
                  sra          s1, gp, t2
                  mulhsu       a7, s7, s0
                  mul          a4, zero, t0
                  rem          a0, sp, t6
                  fmul.s       fs1, fs10, fa4, rne
                  fmax.s       fs4, ft6, ft7
                  fcvt.wu.s    s11, ft10, rtz
                  slti         tp, sp, 808
                  divu         gp, t5, t4
                  srli         a7, s2, 26
                  add          a5, sp, s10
                  remu         t3, zero, s11
                  addi         t1, gp, 929
                  nop
                  mulh         a5, a3, a3
                  fsgnjn.s     fs2, fs8, fs4
                  sltu         a3, sp, a4
                  srli         a3, t5, 7
                  fcvt.wu.s    s0, ft6
                  mulhsu       s5, a7, s7
                  divu         t2, t4, s10
                  fcvt.s.wu    fa3, s4
                  sll          a1, tp, gp
                  fcvt.wu.s    s7, fs4, rup
                  slti         t2, a5, 301
                  mulhu        a1, a1, t0
                  sltu         t0, t3, a4
                  srai         s3, tp, 1
                  fle.s        t6, fa4, fs11
                  divu         t0, a2, s9
                  auipc        s5, 585783
                  sltu         a6, a1, a6
                  sra          tp, s1, sp
                  flt.s        s10, fs5, ft9
                  and          a3, tp, s6
                  addi         t0, s2, 1766
                  andi         t1, gp, -730
                  mulhu        zero, s5, ra
                  fcvt.w.s     s4, fs6
                  fclass.s     s1, fa3
                  rem          tp, a3, s5
                  fcvt.s.wu    fs4, s6
                  flt.s        s7, fs1, fa7
                  mulhu        s6, s9, t4
                  xor          s6, a7, ra
                  slti         a0, gp, -1018
                  fsub.s       fs0, fs3, fs6, rup
                  xori         a4, a7, -1076
                  andi         a4, a3, -1095
                  fclass.s     sp, fa0
                  sra          t1, s6, s9
                  fsqrt.s      ft0, ft0
                  feq.s        t0, ft1, fa7
                  xori         a4, s1, -540
                  divu         t2, t6, a2
                  mulhu        s10, ra, gp
                  fsgnjx.s     ft5, ft7, fs1
                  auipc        tp, 905350
                  add          s6, a4, t6
                  xor          s3, t5, t1
                  fsgnjn.s     fs6, fa1, fa4
                  rem          s0, s6, s10
                  sll          t0, s0, s2
                  fmv.w.x      fs1, a2
                  srl          a3, ra, s2
                  div          a5, a6, s3
                  slti         s0, a0, 1533
                  mulhu        s0, tp, t0
                  div          s1, t2, a6
                  fmv.x.w      s11, fs0
                  fclass.s     t0, ft7
                  slt          t3, t4, s5
                  auipc        a0, 39586
                  sub          s10, s4, a5
                  sra          t0, s6, t3
                  ori          gp, a7, 88
                  fmul.s       fs2, fa2, ft10, rne
                  slli         t3, t6, 11
                  fsgnj.s      fs0, fa4, fa1
                  fsqrt.s      ft8, fa3, rdn
                  sra          s8, s4, s11
                  xor          s6, ra, s0
                  slt          zero, s10, t1
                  nop
                  fmax.s       fa4, fa7, fa6
                  slli         t0, tp, 22
                  sll          s10, t5, a3
                  fmax.s       ft3, fs8, fa7
                  fcvt.s.wu    ft1, s10, rmm
                  andi         gp, a1, -986
                  fmv.x.w      t1, fa4
                  xor          a7, t4, a5
                  fcvt.w.s     a4, fs9, rmm
                  fle.s        ra, fs3, ft7
                  mulhsu       s3, a0, t5
                  divu         s1, s7, t3
                  srai         s9, t2, 31
                  slt          a1, a4, s7
                  ori          s10, a3, 21
                  fsub.s       fa4, fs1, fs0
                  fsgnj.s      fs2, ft10, fs3
                  xor          s8, s11, s3
                  sltiu        a3, a2, 221
                  mulh         t0, gp, gp
                  nop
                  sub          s1, s4, a3
                  rem          s9, t5, gp
                  fclass.s     t6, ft4
                  fle.s        tp, fs0, fs10
                  rem          a3, a5, t2
                  sltu         t2, s11, a4
                  lui          a6, 290386
                  fcvt.wu.s    t4, fs0
                  auipc        s10, 419572
                  mulh         s6, s3, s1
                  and          t3, a0, a6
                  srli         zero, s4, 20
                  slt          a5, a5, s2
                  sra          s0, s0, a2
                  feq.s        gp, fa5, ft5
                  add          a7, tp, a6
                  feq.s        s0, fa0, ft3
                  sra          s5, a6, s1
                  andi         t6, s2, 1121
                  fclass.s     s4, fs1
                  fcvt.s.wu    ft1, tp
                  fmax.s       ft2, ft9, ft6
                  slli         s4, s11, 3
                  xor          a3, s3, zero
                  lui          gp, 769445
                  ori          a6, a6, 1067
                  or           t0, s8, gp
                  nop
                  add          a6, s10, a5
                  fcvt.s.w     fa7, s2
                  fsgnjn.s     fs0, fs3, fa4
                  sub          t2, s8, t1
                  auipc        s4, 141885
                  mulhu        a7, a7, s4
                  mul          s9, a7, tp
                  auipc        s1, 382190
                  div          s11, s6, t4
                  fclass.s     t6, fa7
                  addi         a4, t4, -457
                  ori          t6, a2, -171
                  fdiv.s       fs8, ft11, ft8, rmm
                  srli         s6, a3, 21
                  ori          gp, s10, 217
                  fsgnjx.s     fs8, ft4, fs1
                  srai         a3, s10, 29
                  add          t0, s10, a3
                  fsgnjx.s     fa7, fs8, fs2
                  slt          t2, t3, t5
                  or           tp, a5, tp
                  sub          t3, s1, s0
                  fsgnj.s      ft2, fs5, fs10
                  fsqrt.s      ft6, ft9
                  remu         tp, s10, a3
                  auipc        a6, 1038890
                  fsqrt.s      ft3, fs8, rup
                  sltiu        s8, t0, 575
                  div          s11, a3, s7
                  ori          a3, s3, -66
                  mulhu        a0, s0, s7
                  andi         s1, a0, 1237
                  andi         t6, a3, 1013
                  and          a5, a7, s7
                  srli         a3, a3, 14
                  or           a7, t2, gp
                  mulhu        a3, t5, s3
                  fclass.s     s8, fs1
                  fcvt.s.w     fs5, gp, rmm
                  ori          s3, t6, 1263
                  addi         a7, a6, -1927
                  fsgnjn.s     ft10, fa4, fs8
                  mul          s11, t1, t0
                  divu         sp, s11, a0
                  or           s9, s0, t3
                  fadd.s       fs1, fs8, fa7
                  andi         t3, zero, 1042
                  fcvt.wu.s    a0, ft8
                  flt.s        t4, fs4, fa6
                  sltu         s7, t3, a2
                  and          t2, s2, a3
                  or           s8, zero, s6
                  fsqrt.s      ft7, fs5, rmm
                  fmv.x.w      ra, fs8
                  xor          a6, t2, s9
                  sll          a1, s4, s9
                  fsqrt.s      fa3, ft8
                  srai         a5, sp, 8
                  divu         a6, t2, s1
                  srli         t3, t4, 9
                  srl          s8, t4, s10
                  fmax.s       ft8, ft7, fa1
                  rem          a1, t1, a2
                  feq.s        s11, fs11, ft11
                  addi         s1, s0, 1649
                  fsgnj.s      ft9, fs9, fa6
                  andi         t3, s9, 1768
                  fcvt.s.wu    fs9, s9, rdn
                  sltu         a0, a3, ra
                  div          t6, a7, t0
                  fdiv.s       fs8, ft7, ft0
                  feq.s        s4, ft11, fa6
                  sub          gp, a7, tp
                  fmin.s       fs10, fa2, ft7
                  lui          t0, 313458
                  srai         s4, s5, 30
                  mulhsu       zero, s8, s9
                  sll          gp, t6, s3
                  xor          a4, a0, s1
                  fcvt.s.w     fs10, s2, rmm
                  fsgnjx.s     fa7, fs11, ft2
                  fdiv.s       ft2, ft2, fs4
                  sub          t4, t4, s4
                  fcvt.s.wu    fa1, gp, rup
                  xor          t3, a5, a5
                  fmv.w.x      ft4, t4
                  fclass.s     tp, fs4
                  andi         s0, tp, 1073
                  fsgnjx.s     fs11, ft4, ft5
                  fmul.s       ft0, ft7, ft2
                  flt.s        tp, fa0, ft0
                  mul          zero, ra, t1
                  fcvt.s.wu    fa6, a4, rne
                  addi         a7, a7, -1051
                  remu         t2, a2, zero
                  xor          t6, s8, zero
                  fcvt.s.wu    fs8, zero, rup
                  slli         s7, a3, 3
                  fsgnj.s      fs4, fa4, ft7
                  srai         s8, t2, 2
                  sub          a0, s5, a2
                  sltu         s10, s6, s9
                  divu         t3, s7, t2
                  fmv.w.x      fs6, s9
                  add          a6, a2, a2
                  fmv.x.w      s9, fa6
                  fsgnjx.s     fa0, fs3, fa7
                  mul          s7, ra, t5
                  fsgnj.s      ft1, fs8, ft6
                  fdiv.s       fs9, ft2, ft3, rup
                  slt          gp, s10, s0
                  fsqrt.s      fa6, ft8
                  sra          s4, t4, s4
                  add          t4, a6, s2
                  div          t1, t4, tp
                  fcvt.wu.s    t2, fs2
                  fcvt.wu.s    zero, ft10, rne
                  fadd.s       fa7, ft1, ft0
                  slli         t4, s2, 16
                  srl          ra, s10, t3
                  div          s9, s11, a2
                  divu         s7, s7, ra
                  slli         s10, t0, 20
                  lui          s3, 303671
                  sltu         t6, a1, a4
                  rem          a4, s11, tp
                  fsub.s       ft8, ft8, ft8
                  add          t2, a4, gp
                  mulh         a0, s1, a4
                  mulhsu       ra, t6, s8
                  xori         a4, a1, 117
                  andi         t1, s3, 741
                  mul          gp, t3, s1
                  fmin.s       ft10, fs11, fs4
                  fsgnjx.s     fa6, ft10, ft0
                  nop
                  fclass.s     s1, fa7
                  lui          gp, 719897
                  fadd.s       fa4, ft10, fs0
                  fmax.s       fs9, fs1, ft6
                  fsgnjx.s     fa5, fa0, fa5
                  fmin.s       ft9, fa5, fs0
                  sra          gp, t4, s10
                  fcvt.wu.s    a3, fs7
                  fmv.x.w      tp, fs5
                  fclass.s     s7, fs2
                  fmv.w.x      fs11, t1
                  sub          s8, s6, a2
                  mulh         s7, s6, s10
                  sll          t0, s7, t2
                  slli         a0, t1, 3
                  nop
                  mulh         s3, tp, a0
                  mulhsu       sp, t6, a4
                  addi         s4, s8, -456
                  fsqrt.s      ft11, fs6, rtz
                  or           a5, t1, s6
                  lui          tp, 327408
                  fsub.s       ft8, fs6, ft1
                  fsqrt.s      ft8, ft1
                  mulh         s8, t6, a4
                  fdiv.s       ft10, fa0, fs11, rmm
                  mulh         a1, ra, t0
                  fcvt.s.w     fs5, sp, rne
                  srli         s10, a2, 5
                  fcvt.s.w     ft5, s8, rtz
                  sra          t0, s7, a7
                  sub          a1, s9, s2
                  fsqrt.s      fa0, fs4
                  flt.s        s10, ft7, ft5
                  slti         s11, a4, 1059
                  flt.s        s6, fs10, fs4
                  srai         s6, zero, 26
                  mulhsu       a7, s2, tp
                  fmax.s       fs2, fs1, fa3
                  add          s7, a7, s8
                  fadd.s       ft3, fa7, fs9
                  sra          s10, zero, zero
                  fsqrt.s      fs4, fs3
                  srai         s6, s2, 27
                  fcvt.s.wu    ft0, a6, rdn
                  lui          s9, 748824
                  fmul.s       fa7, ft4, ft4
                  fsgnjn.s     fa4, fs6, fs5
                  mulhu        t4, s9, s2
                  mul          t1, a7, t4
                  fadd.s       fs2, fa6, fs0
                  sub          a7, t4, a5
                  fcvt.s.wu    ft0, s8, rup
                  fmax.s       fs3, ft3, fs9
                  mulhsu       t2, t1, s3
                  fmul.s       fa6, fs0, fs10
                  ori          t0, t1, 1919
                  rem          s9, t0, s10
                  sra          a1, s5, a5
                  fdiv.s       ft10, ft5, fa5, rmm
                  fadd.s       fa7, fs2, fs1
                  remu         s5, s1, gp
                  andi         s4, s10, -443
                  srai         t6, a6, 8
                  sltu         a4, a1, t2
                  nop
                  fsqrt.s      fa4, ft10
                  fsgnj.s      ft4, fs2, ft0
                  andi         a0, s9, 491
                  fcvt.s.w     ft8, s3
                  fsgnj.s      fa2, ft2, ft3
                  fmul.s       fs9, fa0, fs11
                  fcvt.s.w     fs3, ra
                  sll          a6, s1, a1
                  fle.s        s8, fa0, fa5
                  sll          s1, s10, s4
                  rem          a1, a3, tp
                  nop
                  srli         a0, a6, 4
                  lui          a7, 931301
                  sra          t2, t0, s6
                  fsgnjn.s     ft9, fa0, fa0
                  fsub.s       fa5, fs2, ft10
                  fdiv.s       ft2, ft7, fa0, rup
                  andi         t1, t6, -968
                  mul          s10, a4, s6
                  and          t3, a7, a2
                  slt          gp, t3, s2
                  fcvt.wu.s    gp, ft6
                  fmin.s       fa2, ft2, ft8
                  xori         a1, a0, 201
                  sll          s1, sp, s8
                  auipc        a3, 317227
                  fsgnjx.s     fa6, ft9, fs0
                  fcvt.w.s     a7, ft3, rdn
                  fle.s        a1, ft0, ft7
                  fsgnjn.s     fs0, fs10, fs9
                  fadd.s       ft10, fs0, fa3
                  fmax.s       fs8, fa2, ft8
                  mulhsu       s4, a4, a6
                  fsgnjx.s     fs3, fs1, fs11
                  fdiv.s       ft2, fa1, fs0
                  fcvt.s.w     ft2, a6, rne
                  fcvt.s.w     ft6, a4
                  fclass.s     ra, ft7
                  xor          a6, s11, s4
                  mulhu        s9, s11, t3
                  sll          s8, s5, s11
                  sltu         s7, s8, s7
                  slti         t2, s4, -1126
                  fmax.s       fs8, fs2, ft4
                  addi         tp, tp, -125
                  fmv.w.x      fs8, t3
                  sltiu        t1, a7, -969
                  mulhsu       t6, a6, zero
                  div          s6, s2, s9
                  nop
                  ori          zero, a5, 1796
                  fsgnjn.s     fs8, fa1, fa7
                  mulhsu       ra, a6, a0
                  sra          t4, s11, a6
                  fsqrt.s      fa3, fs8
                  andi         a7, s1, 1732
                  rem          s0, s6, t6
                  srl          gp, t0, s10
                  fmax.s       fa3, ft11, fs2
                  mulhsu       t2, a6, a0
                  fcvt.w.s     s8, fa7
                  fmv.w.x      ft11, zero
                  mul          t1, a2, t4
                  srai         t6, s2, 12
                  sra          s11, s2, t2
                  fmin.s       ft7, ft7, fs0
                  andi         gp, t3, 1510
                  fcvt.s.wu    fs0, s11
                  div          a1, t3, s2
                  or           sp, ra, s1
                  fsqrt.s      ft7, ft8
                  fmv.x.w      t2, ft6
                  fle.s        gp, fs1, ft7
                  sra          t3, t3, t1
                  mul          gp, t1, s10
                  fclass.s     zero, fs1
                  sltu         s11, s6, a5
                  slti         t0, a3, -516
                  add          s8, t2, tp
                  fmax.s       fa7, fa2, ft3
                  andi         s9, tp, -985
                  fsqrt.s      fa3, ft9
                  fsgnj.s      ft6, fs9, fs4
                  divu         s11, a3, s3
                  mul          s0, tp, tp
                  nop
                  fcvt.s.wu    fs2, a4, rup
                  sra          a5, s1, s9
                  sltu         a4, t4, s1
                  srl          a1, s0, t2
                  mulh         t2, zero, a3
                  fmv.x.w      tp, ft11
                  fsgnjn.s     fa2, fa4, fs3
                  fsqrt.s      ft4, fs8, rup
                  divu         s11, t4, a3
                  fle.s        s6, fs11, ft7
                  sll          t3, tp, t1
                  fclass.s     a6, fs0
                  flt.s        t1, ft0, ft3
                  lui          sp, 491886
                  fcvt.wu.s    s7, ft10
                  or           t3, s11, s5
                  remu         s10, s7, s2
                  sltiu        s4, a1, 1770
                  fcvt.w.s     tp, ft0
                  sltiu        s1, t4, -744
                  auipc        a0, 605493
                  sub          a7, a2, t5
                  divu         t0, s0, s1
                  auipc        s11, 958154
                  or           sp, s7, t0
                  flt.s        s9, fs3, ft0
                  slli         ra, t1, 17
                  ori          t1, t5, 890
                  div          sp, a1, zero
                  add          a1, s3, tp
                  or           t6, zero, s7
                  sltiu        tp, a5, -483
                  ori          zero, t4, 1679
                  srl          t6, s3, a0
                  lui          a6, 1035854
                  fcvt.s.wu    ft4, t4, rmm
                  andi         s11, s4, 967
                  andi         s1, gp, -590
                  slti         a5, t6, -1883
                  remu         zero, t0, s6
                  rem          s7, ra, s7
                  sltu         t2, a6, s4
                  sra          t1, a5, t2
                  div          s10, t5, s1
                  andi         s3, t4, 711
                  slti         a5, s9, -551
                  div          s0, s10, sp
                  fsgnjn.s     fs0, fs7, fs11
                  andi         s7, tp, -989
                  fsgnj.s      fs4, fs10, ft9
                  nop
                  fmul.s       ft2, ft0, fs2
                  fmv.x.w      a1, ft3
                  fadd.s       fa3, fa3, ft5, rne
                  rem          s10, t6, t0
                  flt.s        ra, ft5, fs3
                  ori          s10, s7, 1673
                  rem          t2, s3, a3
                  xor          s1, s7, s3
                  nop
                  ori          t4, zero, 1160
                  srli         s8, s2, 26
                  mul          s5, t4, t3
                  feq.s        t4, fa0, fs5
                  add          s7, t0, t5
                  feq.s        t0, fs10, fs7
                  xor          t0, a1, s2
                  or           s4, a0, zero
                  divu         s3, s1, t4
                  fcvt.s.wu    fs6, gp, rdn
                  fclass.s     t4, fs0
                  fmv.w.x      ft10, sp
                  mul          s9, t6, s0
                  mul          s5, zero, a1
                  sll          s11, a4, a2
                  fmv.w.x      fs4, s8
                  fsgnjx.s     fa7, fs0, fs3
                  fcvt.s.wu    ft7, t6, rup
                  fsgnj.s      ft9, fa7, fa5
                  fcvt.w.s     t1, ft7, rne
                  xor          a7, zero, a6
                  mul          s8, t0, tp
                  fsqrt.s      ft11, fa3
                  andi         tp, t0, -1630
                  feq.s        a3, ft3, ft7
                  fdiv.s       ft11, fa0, fs10, rtz
                  fsgnj.s      ft11, fa1, fs0
                  flt.s        zero, fs10, fa6
                  flt.s        a5, fs10, fa2
                  fmv.w.x      fs3, a4
                  fmin.s       fa1, ft6, fs3
                  or           t6, a3, a2
                  fsub.s       ft2, ft5, fs1, rne
                  divu         t3, a5, a2
                  fclass.s     s0, fa6
                  mulh         a5, t4, a5
                  fdiv.s       ft4, ft6, fs7
                  mulhsu       s7, a3, s1
                  feq.s        a5, fa0, ft4
                  fcvt.wu.s    s6, fa4, rne
                  fcvt.s.wu    ft0, s9, rne
                  fmin.s       ft10, fa1, fa2
                  srl          s11, s10, t1
                  divu         t6, t3, t4
                  fmv.w.x      ft9, t1
                  rem          t1, t5, t3
                  sra          a3, s1, s0
                  flt.s        s0, ft3, ft6
                  srli         tp, gp, 23
                  fmin.s       fs5, fa5, ft9
                  mulhu        a1, t3, t2
                  srl          s10, s7, a0
                  mul          s7, s8, s0
                  flt.s        s1, fs7, fs10
                  slli         s9, a2, 20
                  sltiu        s3, t0, 1209
                  fsgnjn.s     ft2, fa4, ft8
                  andi         s11, sp, 51
                  fmul.s       fs3, ft1, fa3, rtz
                  nop
                  add          s7, s6, zero
                  add          t6, s10, s3
                  flt.s        a0, fs7, fs4
                  fsub.s       fs10, fa4, ft8
                  xori         s5, s1, -1310
                  sra          s4, s7, s7
                  add          ra, zero, s8
                  fsgnj.s      ft10, fa4, fs2
                  fclass.s     a5, fs7
                  fcvt.s.wu    ft4, s10, rne
                  fsgnjx.s     fs9, fs3, ft11
                  fdiv.s       fs11, ft0, ft2
                  addi         s6, s7, 271
                  fmv.w.x      fa4, s7
                  ori          a3, a7, -240
                  sltu         zero, t6, t4
                  feq.s        s6, fs0, ft6
                  fdiv.s       ft0, fs1, fa1
                  remu         t0, gp, ra
                  fsub.s       fa3, ft10, ft0
                  lui          s9, 564742
                  slt          a7, t0, t6
                  lui          t1, 38932
                  ori          t3, s6, 1113
                  mulh         s10, s4, gp
                  feq.s        t3, fs3, ft2
                  fmul.s       fs7, fa3, fs8
                  add          s3, a6, s10
                  div          gp, s2, s4
                  srli         zero, s1, 26
                  sub          a7, a6, ra
                  divu         s8, s4, ra
                  addi         s11, a1, -935
                  fcvt.w.s     s10, fs4, rne
                  fle.s        t6, fa3, fs4
                  divu         t2, s2, ra
                  fcvt.s.wu    fs11, s3, rmm
                  xori         t6, t1, -919
                  flt.s        t6, ft8, ft11
                  fsgnjn.s     fs9, fa1, fa7
                  xori         a0, s8, -361
                  flt.s        a1, ft10, fs4
                  nop
                  ori          tp, s4, -1931
                  feq.s        a4, fa5, ft5
                  or           zero, s1, ra
                  fadd.s       fs7, fa5, ft5, rup
                  feq.s        t1, fa5, ft4
                  fclass.s     t3, fa5
                  fsub.s       ft0, fa0, ft8, rtz
                  fcvt.s.wu    fa5, t2
                  sltu         a6, ra, tp
                  fcvt.wu.s    zero, fa1
                  mulhu        ra, s10, a4
                  fmul.s       fs1, ft6, ft10, rup
                  fsgnjx.s     fs4, fs6, fs9
                  mulhsu       a3, a6, t3
                  rem          s1, s0, ra
                  fadd.s       fa0, fs8, fs0
                  add          s11, a4, s1
                  sltiu        a6, ra, 675
                  ori          s6, a4, 189
                  remu         s3, t0, a3
                  andi         sp, s5, 1583
                  ori          t0, t4, -1855
                  fmul.s       fa5, fa5, ft6, rne
                  mulhsu       s1, a1, a1
                  mulhu        t0, t2, t1
                  addi         ra, s0, 1472
                  sll          tp, s2, s0
                  fsgnj.s      fa1, ft4, ft2
                  auipc        s10, 251685
                  srai         a5, s8, 6
                  srl          s11, s2, t4
                  auipc        a5, 893259
                  remu         s8, t4, s2
                  fmv.w.x      fa1, a6
                  div          t6, s2, s11
                  slt          s9, t6, ra
                  lui          sp, 456208
                  sub          a6, s4, a1
                  add          s10, s9, s8
                  rem          a6, s1, t2
                  feq.s        gp, ft8, fa7
                  sub          tp, s8, a2
                  fsqrt.s      ft0, fa4, rtz
                  or           s5, t1, t1
                  andi         t2, a3, -1365
                  div          gp, t2, s3
                  slt          ra, t6, s2
                  add          t0, s0, t5
                  flt.s        s1, fs10, ft9
                  fsqrt.s      ft1, fs5, rup
                  srl          a0, t6, t3
                  fmv.x.w      t2, ft4
                  auipc        s1, 470121
                  fcvt.wu.s    s9, fs5, rne
                  remu         s0, s8, s3
                  auipc        s11, 480659
                  mul          gp, tp, t1
                  fdiv.s       ft8, fa2, fs3, rne
                  mulhu        s3, s6, a1
                  xori         a1, ra, 700
                  fmin.s       ft4, fa4, ft2
                  fdiv.s       ft6, fs0, fs11
                  addi         s10, t1, -1734
                  rem          a5, a1, t5
                  fsgnjx.s     fa6, fa7, ft3
                  ori          t1, a5, -1791
                  addi         a5, t3, 1720
                  fdiv.s       fa7, ft6, fs4, rup
                  ori          t2, s10, -915
                  mul          s8, s4, t2
                  slt          ra, a6, s3
                  div          a1, t5, a1
                  feq.s        s8, fa0, fs8
                  and          s0, s0, t4
                  xori         a7, s9, 2038
                  fsqrt.s      fs9, fs10, rdn
                  fmax.s       fs5, ft8, fa4
                  andi         ra, s10, -1184
                  fdiv.s       ft2, fs5, fa3, rdn
                  divu         s1, s1, s8
                  rem          s1, s0, s2
                  divu         sp, a5, a2
                  sub          a5, gp, s9
                  fmv.w.x      fs0, s11
                  sll          ra, a2, sp
                  fmax.s       fs9, ft8, ft4
                  fcvt.s.wu    ft10, s7
                  slli         gp, t1, 13
                  addi         t1, t6, -1077
                  fsgnjn.s     ft4, fs5, fs11
                  remu         sp, s7, s0
                  fmv.x.w      s0, ft6
                  remu         a7, a6, s5
                  feq.s        s0, fa4, fs5
                  mul          s1, a6, a2
                  xor          s1, t1, t0
                  remu         sp, s8, t3
                  fsub.s       fa6, fa6, fa2, rtz
                  fmv.x.w      t1, fs11
                  fsub.s       fs3, fa4, fs10
                  mulhsu       s6, a2, s11
                  feq.s        zero, fs8, fs6
                  mulhu        s6, t6, t4
                  fle.s        s8, fs4, ft5
                  srl          s10, s9, a2
                  slt          a0, ra, t4
                  lui          ra, 509705
                  slli         a3, s6, 9
                  fmv.w.x      fs5, zero
                  fsqrt.s      fs5, ft9
                  xori         s8, ra, -1368
                  feq.s        s4, fs6, fs8
                  sub          sp, t4, a6
                  addi         s4, zero, 599
                  srai         s4, s3, 29
                  slli         a5, a1, 2
                  add          t4, t6, a6
                  fadd.s       fs8, fa2, ft7, rne
                  fsgnjn.s     ft6, ft2, ft5
                  fsgnjn.s     fa6, ft9, ft3
                  lui          a7, 95871
                  sltu         t1, zero, t1
                  sub          gp, s10, s9
                  fsgnjn.s     ft4, fs11, fs10
                  add          s7, tp, s6
                  divu         a4, a0, t0
                  addi         a0, s1, -1934
                  fsub.s       fs8, fs0, fs0
                  sltu         ra, s11, s8
                  fadd.s       fs7, fs3, ft5
                  slt          t4, t4, a6
                  fmul.s       fs0, ft4, fs5
                  fadd.s       ft1, fs4, fs6, rdn
                  fle.s        ra, ft2, fa0
                  fmax.s       ft8, fa7, fs11
                  fmin.s       fs10, ft8, fa0
                  sll          s4, t1, a7
                  fsub.s       fa3, fa6, ft1
                  fcvt.s.wu    fs7, s0
                  srl          a1, t1, s11
                  fmul.s       ft4, fs5, ft10, rup
                  fmax.s       ft11, ft8, ft2
                  lui          a4, 315052
                  fmv.x.w      s6, ft6
                  rem          a6, tp, gp
                  addi         s10, s2, -1730
                  mulhu        s10, s11, tp
                  mulh         a3, zero, a6
                  fmv.w.x      ft7, s4
                  fdiv.s       fs0, ft1, ft2
                  xor          s4, tp, tp
                  fsgnjx.s     ft3, fs2, fs9
                  lui          s1, 53728
                  fsqrt.s      ft3, ft5
                  fcvt.w.s     t4, fs0
                  sltu         s0, s9, s9
                  fmul.s       ft0, fs2, fa5, rup
                  fsgnjn.s     fs9, fs4, ft5
                  fcvt.s.w     ft0, a6
                  slti         s4, a7, 1620
                  or           sp, zero, sp
                  fsqrt.s      fs8, ft0, rne
                  xori         s0, t3, -701
                  fdiv.s       fs11, ft10, ft6
                  rem          s1, tp, tp
                  srli         s8, s8, 7
                  fadd.s       ft10, fs9, ft1, rmm
                  fsqrt.s      ft5, fa2, rmm
                  fcvt.w.s     a1, fs5, rup
                  ori          t2, gp, 1125
                  sub          sp, a0, a0
                  fmin.s       fa0, fa6, fa2
                  fsub.s       fs9, fs0, ft7, rne
                  div          s9, tp, s5
                  fmul.s       fa5, fa0, ft0
                  rem          s5, t5, a4
                  slli         ra, zero, 26
                  fsgnj.s      fa5, ft11, fs5
                  fmv.x.w      a5, ft9
                  remu         a0, a3, s9
                  fclass.s     s5, fs7
                  addi         s6, s10, 1441
                  fle.s        t2, fs9, fa7
                  fmul.s       ft8, fs9, fa0
                  divu         s5, s8, s2
                  fclass.s     s11, fa0
                  auipc        t3, 616294
                  divu         s7, sp, s9
                  add          a5, s4, s6
                  srl          t3, ra, s5
                  and          s0, s4, t4
                  fdiv.s       fa4, ft5, fs3
                  fmv.x.w      sp, fs8
                  fmv.x.w      s9, fa5
                  slt          a5, gp, t4
                  fmax.s       fs3, fs0, fs10
                  xor          a0, s4, s11
                  add          zero, t0, ra
                  sltiu        s9, zero, -1495
                  or           s3, s10, t2
                  fcvt.s.wu    ft0, t5
                  add          s5, a0, s1
                  srai         gp, s8, 14
                  fsub.s       ft6, fs7, fs9
                  ori          s11, s2, 1117
                  fsub.s       fa1, ft8, fs7, rne
                  fsub.s       fs8, fs7, fs2
                  mulhsu       a4, s5, s4
                  nop
                  flt.s        t2, fa0, ft5
                  feq.s        t0, ft9, fa0
                  or           a1, s2, a3
                  nop
                  fmv.x.w      s4, fa4
                  andi         a0, a5, 1500
                  mulhu        sp, a2, a4
                  fmul.s       fs5, fa0, fs11
                  mul          s7, s9, t6
                  sltu         gp, s0, t4
                  sll          a4, a7, t2
                  xor          zero, a3, t3
                  sra          s0, a4, s6
                  fmul.s       fa7, fa1, fs3, rmm
                  sub          t1, s6, a4
                  sra          ra, sp, t5
                  fmv.x.w      a1, fa2
                  and          s4, t4, t5
                  divu         s7, t4, ra
                  slti         t6, t4, -1960
                  andi         t0, sp, -947
                  div          s8, a1, tp
                  slt          t4, a0, a5
                  lui          s10, 693361
                  sra          t6, s4, t2
                  mulh         zero, a7, a0
                  ori          t3, a1, -1087
                  remu         s10, a4, t3
                  fmv.w.x      fa3, t3
                  slti         s7, sp, 300
                  flt.s        ra, fs7, ft11
                  lui          s4, 687538
                  srai         t4, s7, 21
                  flt.s        s11, ft0, fs1
                  sra          t1, s3, sp
                  srl          s3, gp, a1
                  fcvt.wu.s    t1, fs2
                  slti         t0, t5, 1709
                  add          s1, a3, a7
                  srai         zero, t3, 20
                  or           zero, a4, zero
                  sltu         a1, a1, s10
                  andi         s10, a6, -1152
                  divu         s9, a6, t2
                  fsub.s       fs10, ft3, fa3
                  slli         s7, ra, 4
                  fclass.s     s11, ft6
                  add          s1, tp, a0
                  and          s10, t0, t1
                  mulhu        sp, tp, s4
                  fsqrt.s      fa1, fs6, rup
                  ori          t3, s9, 302
                  or           s0, t4, s10
                  mulhu        zero, s10, sp
                  fcvt.wu.s    a6, fs6
                  slt          gp, ra, s8
                  fdiv.s       ft11, fa3, fa2, rmm
                  and          ra, tp, s1
                  fcvt.w.s     a5, fa5
                  ori          a4, s6, -1361
                  xor          s9, s10, a0
                  sra          a7, a0, s3
                  srai         sp, s4, 14
                  fmin.s       ft6, ft8, fs7
                  fdiv.s       fs4, fs1, ft6, rne
                  fcvt.wu.s    s10, fa7, rne
                  fmul.s       ft0, fs10, ft5
                  mul          t3, t3, s8
                  div          a0, a2, s4
                  ori          s6, s11, 695
                  fmax.s       ft11, fs7, ft11
                  fadd.s       ft2, fa0, fs11
                  xor          s9, s1, a3
                  slti         s0, s3, 1772
                  slti         s11, t2, -528
                  sltu         a0, a1, s1
                  fsgnjn.s     fa4, ft9, ft3
                  fsub.s       ft2, fa7, fs10
                  fmax.s       ft7, fa5, fa6
                  fcvt.s.w     fs6, a3
                  div          t3, a6, t0
                  sra          t3, s2, t6
                  srli         a4, t1, 7
                  nop
                  fmax.s       fa7, fs1, ft6
                  slti         t4, s3, -1970
                  sub          t3, t3, a2
                  fmv.w.x      fa4, t2
                  addi         a4, s4, 1134
                  slti         tp, s4, -456
                  fmul.s       fa1, fs5, ft1
                  fcvt.s.wu    ft2, s0, rmm
                  rem          t1, s5, a0
                  fcvt.s.wu    fs11, s5
                  fclass.s     tp, ft3
                  fle.s        gp, fa6, ft11
                  slli         s5, s6, 21
                  fcvt.s.w     fs8, s7, rup
                  fsgnj.s      fs10, ft0, fa4
                  fmv.x.w      gp, ft7
                  nop
                  sll          a6, a2, a5
                  div          t2, t6, s1
                  slli         s5, t3, 24
                  slt          s1, t5, sp
                  sra          s9, a6, t2
                  remu         a0, a4, t3
                  divu         t6, s8, a0
                  feq.s        gp, ft9, fs0
                  lui          s7, 417435
                  divu         gp, s3, a3
                  srli         a6, s0, 16
                  rem          s4, s4, s6
                  rem          s4, a6, ra
                  fadd.s       ft8, ft10, fa1, rmm
                  fmul.s       fs0, ft9, ft7
                  rem          gp, tp, a4
                  fmv.w.x      fa5, tp
                  sltiu        gp, s3, 843
                  sll          s10, s3, a5
                  ori          s10, a7, 838
                  auipc        s8, 588860
                  sll          ra, s9, a2
                  fmax.s       fa3, ft6, fa3
                  add          s11, s9, a0
                  and          a7, a6, s7
                  fmv.x.w      s6, ft2
                  fsqrt.s      ft8, fa5, rne
                  mul          gp, s0, s10
                  fdiv.s       ft3, fs0, fa2
                  xor          s1, tp, a5
                  fmv.x.w      t3, fs1
                  srl          a1, a1, s3
                  or           gp, s3, zero
                  fcvt.s.w     fa0, s2, rup
                  fcvt.s.wu    fa4, t3
                  sra          s8, a1, s9
                  fsub.s       ft9, fs10, ft4
                  mulhsu       t3, a0, t3
                  fsgnjx.s     fs1, fa5, ft8
                  fmax.s       fs10, ft7, fa2
                  mulh         t6, s7, t3
                  sll          s4, a1, a4
                  srl          s9, a0, t0
                  sra          t0, a3, s8
                  fmv.x.w      a5, fs1
                  fmin.s       ft5, fs8, ft6
                  fsgnjn.s     fa6, fs6, ft11
                  and          t0, t4, s3
                  srli         s1, t5, 1
                  remu         s9, t1, t3
                  div          gp, s9, s8
                  srl          s0, s7, s4
                  fmul.s       fs2, fs6, ft8
                  fmax.s       fa5, fa5, ft5
                  add          s6, t1, sp
                  srl          s7, s10, s1
                  slli         s9, tp, 9
                  fcvt.s.w     fa0, s4, rmm
                  nop
                  feq.s        zero, fs3, fs0
                  fcvt.wu.s    a1, fa5
                  mulhu        t3, s11, s0
                  sll          s8, a2, s1
                  fsgnjn.s     fs3, fs4, fs0
                  fmul.s       ft4, ft2, ft4, rtz
                  mulhsu       s5, s0, t1
                  slli         s3, ra, 15
                  sltiu        s5, s3, -2018
                  or           t0, a5, s0
                  sra          s11, s4, t4
                  slli         a5, sp, 7
                  fadd.s       ft11, ft7, ft3, rup
                  srai         s1, t0, 31
                  sltu         s4, a5, tp
                  feq.s        t3, ft8, fs7
                  and          s11, s9, t4
                  slti         a7, s1, 883
                  slt          a4, s1, sp
                  and          gp, a7, s3
                  fcvt.s.wu    fs1, t0
                  sltu         s9, s5, t4
                  nop
                  rem          s6, a0, a1
                  sltiu        a4, t2, 1459
                  xor          a6, tp, t1
                  sub          tp, s9, s11
                  fmv.w.x      ft8, s2
                  auipc        t0, 991968
                  sltiu        s10, s9, -278
                  add          t3, a6, s3
                  fcvt.s.wu    fs7, zero, rmm
                  ori          t3, t4, -206
                  fsgnjx.s     ft7, ft4, fs6
                  divu         s11, a7, a7
                  ori          a0, t0, -212
                  remu         a6, a1, a7
                  xori         s1, sp, 1036
                  fsgnj.s      fa0, ft7, fa1
                  fmax.s       ft2, fs6, ft6
                  fsqrt.s      fa5, ft7, rmm
                  slti         gp, s7, -589
                  xori         a0, gp, 1616
                  srai         s8, t2, 28
                  fdiv.s       fa4, fa4, fs2, rmm
                  sub          s10, t1, s7
                  andi         t0, t3, 1768
                  fsgnjx.s     fs2, ft7, fs1
                  fmin.s       ft0, ft10, fs10
                  fmv.x.w      ra, fs4
                  srai         a7, gp, 28
                  fmin.s       ft1, fa1, ft0
                  remu         t1, s0, s6
                  fdiv.s       fs8, ft1, fs2, rdn
                  srl          s11, a1, s6
                  fle.s        s9, fa2, ft1
                  fdiv.s       ft10, ft3, ft6, rtz
                  slti         s4, tp, 1973
                  mulhu        s7, s8, t5
                  xori         t6, s11, -965
                  or           s11, ra, t5
                  slt          s8, t0, s2
                  fsqrt.s      fs0, fs4
                  fmul.s       ft5, fa4, ft6, rup
                  xor          t3, a7, a0
                  andi         a4, a4, 527
                  remu         t4, s6, gp
                  sltu         t2, tp, s5
                  and          sp, a5, s7
                  auipc        a4, 1021536
                  fsub.s       ft0, ft7, ft8
                  xori         gp, zero, -1098
                  sub          s7, s4, gp
                  ori          s1, s10, 599
                  andi         s4, t0, -1230
                  fsqrt.s      fs4, fs4
                  fsgnj.s      ft7, ft6, fs11
                  fcvt.wu.s    s11, fa0
                  mul          zero, gp, s1
                  fsub.s       ft2, fs8, fa3, rne
                  sltiu        s8, s11, 2006
                  sra          a5, a2, zero
                  fcvt.s.wu    ft11, s8, rmm
                  xor          a4, tp, t3
                  srai         sp, t3, 3
                  sltiu        a3, t1, -143
                  srli         s4, t2, 2
                  fcvt.s.wu    fs10, t3, rmm
                  andi         s0, t2, -1516
                  fcvt.wu.s    s9, fs8
                  mulh         t2, a5, a2
                  fcvt.w.s     a4, ft0
                  ori          t6, s10, 263
                  srai         a5, s5, 17
                  andi         a7, s7, -1023
                  sltiu        a1, s0, 1782
                  slt          s10, a6, a4
                  fsgnjx.s     fs8, fa3, fs3
                  auipc        t2, 818964
                  fcvt.w.s     t4, ft5, rup
                  fsgnjn.s     fs11, fa6, fa6
                  sll          a0, t3, zero
                  fsqrt.s      ft5, fs3, rne
                  xor          gp, s4, a7
                  mulhsu       s1, s8, s5
                  sub          s6, t2, s1
                  sll          tp, a7, s10
                  div          t6, s5, s1
                  fcvt.s.wu    fs7, t2
                  ori          a5, ra, 1649
                  sub          s0, s11, a0
                  fdiv.s       ft3, fs6, fs11
                  fsqrt.s      ft10, ft2, rup
                  fsub.s       ft11, ft4, ft11
                  sll          sp, gp, s6
                  sra          t2, t4, s3
                  xori         s9, s2, 203
                  remu         a1, s0, tp
                  fclass.s     a6, fa6
                  fsqrt.s      fs9, fa1, rdn
                  flt.s        s0, fs4, fs5
                  sll          a7, s5, t1
                  slt          s9, t0, ra
                  slti         a1, t6, 460
                  feq.s        s11, ft0, ft3
                  xori         s8, sp, -686
                  fsgnjx.s     fs0, ft7, fs1
                  fsub.s       ft2, fs2, fs2
                  fsgnjn.s     fa4, fa2, ft0
                  mulhsu       s5, t6, t1
                  xori         zero, t3, 887
                  flt.s        ra, ft4, fs8
                  mulh         a1, a6, a5
                  fcvt.w.s     s3, fs8, rdn
                  div          zero, a0, a5
                  fsgnjx.s     fs1, ft11, fa4
                  fmv.w.x      ft3, s8
                  xori         sp, a0, 705
                  srai         a4, a0, 0
                  andi         s9, t2, 559
                  mulhsu       gp, a5, s0
                  fcvt.w.s     s11, fa5, rmm
                  nop
                  divu         gp, sp, sp
                  mulhsu       a7, gp, s1
                  div          a3, s3, a1
                  srl          s9, sp, a2
                  divu         s11, a6, s6
                  srli         zero, sp, 17
                  mulh         s11, gp, s1
                  flt.s        t6, ft1, ft6
                  fsgnj.s      fs9, ft8, fa1
                  mulhsu       gp, a3, s5
                  flt.s        t1, ft6, fs0
                  fcvt.s.wu    fs1, a2, rtz
                  auipc        s0, 468470
                  nop
                  slli         a4, zero, 13
                  divu         a4, sp, a5
                  srli         s10, a0, 5
                  slli         a5, s2, 14
                  rem          tp, a4, s11
                  srl          ra, a6, s3
                  fle.s        t1, ft2, fs9
                  ori          a0, gp, 202
                  srli         s4, a2, 1
                  xor          a1, a7, s1
                  divu         a6, a1, s1
                  sra          s9, a1, t1
                  mulhu        s0, a1, a5
                  fsgnjx.s     fa6, ft4, fa6
                  sra          gp, s0, s5
                  fmv.w.x      fs2, s10
                  fcvt.s.w     fs11, s2
                  fcvt.s.w     fs0, a6, rmm
                  addi         s0, a5, 750
                  xor          s11, s8, s6
                  feq.s        t0, ft2, ft8
                  sltu         t6, s10, s9
                  mulh         ra, gp, a6
                  srli         s5, a6, 22
                  xor          s1, s0, s1
                  fadd.s       ft9, fa6, fs7
                  or           s6, a3, s11
                  fcvt.w.s     t1, ft5, rmm
                  fmv.w.x      fa1, sp
                  add          sp, s1, s4
                  fcvt.w.s     s1, fs4
                  or           tp, s10, a7
                  auipc        t1, 694051
                  srli         s3, t6, 7
                  fsub.s       ft8, fs0, fs11
                  div          t6, a0, s5
                  and          a4, s3, t2
                  andi         s10, s11, -1079
                  div          s7, s10, a3
                  remu         s8, s9, sp
                  sltiu        a5, s2, -927
                  fdiv.s       fs7, fa5, fa0, rdn
                  fle.s        a6, fa5, fa4
                  auipc        t1, 878079
                  fmul.s       ft3, ft5, fs10
                  and          gp, s10, s0
                  slti         zero, a7, 508
                  nop
                  mulh         s7, a0, zero
                  auipc        a0, 790694
                  mulh         a7, s9, s2
                  xori         a7, a6, 1593
                  srai         s7, s7, 18
                  mulhu        s10, a3, t6
                  fmv.w.x      fs2, s0
                  addi         s3, a0, 1340
                  slt          s11, t0, s6
                  sub          t4, a7, s5
                  fmul.s       ft1, fs3, ft10, rup
                  sltiu        s0, a5, 1682
                  srai         zero, tp, 25
                  mulhu        gp, a4, t4
                  fdiv.s       ft2, fa1, fs4, rne
                  sub          t3, t4, t2
                  slt          ra, a2, s9
                  andi         s5, a2, 71
                  srai         a6, s11, 16
                  fdiv.s       fs2, fs8, ft6
                  lui          s7, 910410
                  flt.s        zero, fa7, fa6
                  fcvt.s.wu    fa6, a3
                  add          a5, s1, s0
                  fmv.x.w      gp, ft5
                  fcvt.s.w     ft7, gp
                  mulhsu       ra, a3, zero
                  mulhu        t6, a0, a4
                  slli         a5, s5, 20
                  lui          s3, 362675
                  fclass.s     t3, fa4
                  sltiu        s1, s8, -437
                  flt.s        s8, fa0, ft6
                  fsgnj.s      ft10, fa6, fs11
                  divu         s4, s11, s0
                  sll          s6, zero, t0
                  mulh         a5, s0, gp
                  fmax.s       fs1, fs5, fs2
                  fmax.s       ft4, fs11, fs5
                  fsgnjx.s     fs9, ft8, fs6
                  addi         s6, ra, -665
                  fmv.w.x      ft4, t1
                  andi         tp, tp, -291
                  fsgnjn.s     fa1, fa2, fs5
                  fmin.s       fa6, ft8, ft1
                  mulh         a6, ra, tp
                  andi         a7, s6, -1044
                  fsub.s       fa0, fs4, ft7
                  fmul.s       fa0, ft5, fs6, rtz
                  andi         t6, s2, 1585
                  flt.s        t2, fa5, fs4
                  fmul.s       fs3, ft11, ft2, rdn
                  div          a1, sp, t6
                  fcvt.w.s     t1, ft6, rup
                  srli         a4, s3, 21
                  sra          s7, a2, t0
                  fmv.w.x      fs10, t1
                  andi         s5, gp, 1503
                  sll          s8, s11, s7
                  addi         s1, a3, -1576
                  rem          t2, a2, a3
                  lui          s3, 477796
                  fcvt.w.s     s7, fs11, rup
                  mulhu        sp, a3, a4
                  slt          gp, a0, s1
                  mulhsu       t1, s10, a4
                  srai         s1, t2, 6
                  or           s11, s8, gp
                  srl          s6, a3, s4
                  slli         s6, a3, 8
                  rem          tp, a3, t5
                  fmin.s       fa2, fs3, fa0
                  div          t2, a1, s4
                  sltu         s9, zero, t1
                  srai         ra, a2, 19
                  fsgnjn.s     fs9, fs6, fs8
                  fle.s        s6, ft10, ft10
                  flt.s        s1, fa4, fs9
                  fle.s        a0, fs2, fa2
                  fsqrt.s      fs2, fa1
                  fmul.s       ft4, fs10, fs11
                  fcvt.w.s     t3, fs0
                  fsgnjx.s     fs2, fa2, fa0
                  fclass.s     s5, fs9
                  fcvt.s.w     fs11, s7
                  mulh         s10, ra, s5
                  slti         tp, a0, 1080
                  remu         a6, ra, s9
                  auipc        s8, 190189
                  auipc        a1, 305512
                  fsub.s       fs6, ft2, fs11, rdn
                  andi         tp, sp, 585
                  div          a5, s10, s7
                  add          gp, s4, a7
                  fdiv.s       ft7, fa6, fs5, rdn
                  fcvt.wu.s    s9, ft7, rdn
                  mulh         t0, t4, s11
                  fmul.s       fs3, fa2, fs4, rne
                  feq.s        zero, ft0, ft5
                  lui          ra, 274900
                  flt.s        t0, ft8, fa7
                  fclass.s     t4, ft8
                  div          s8, t2, gp
                  srli         ra, t2, 14
                  and          tp, a2, t2
                  mul          gp, s1, a5
                  fcvt.wu.s    t6, fs11
                  mulhu        s5, s4, t0
                  sll          s11, a0, a6
                  fsgnjx.s     fs0, ft4, fs11
                  remu         tp, sp, a6
                  srl          t3, s9, s6
                  fmin.s       fs1, ft7, fa3
                  fdiv.s       fs0, fs5, fs9, rup
                  rem          s4, s9, gp
                  sltu         ra, a2, s9
                  sra          s3, t1, zero
                  slli         tp, t4, 6
                  slt          zero, a5, s6
                  sra          t6, s1, s7
                  fmv.w.x      fs11, s6
                  fsgnjn.s     ft0, fa3, fs8
                  fadd.s       ft5, ft11, fs5, rmm
                  slt          sp, s7, s3
                  fmv.w.x      ft7, s8
                  addi         s5, a1, -1297
                  mul          s0, s11, t1
                  fcvt.s.wu    ft1, a2, rmm
                  flt.s        zero, ft2, ft0
                  nop
                  srli         a0, t1, 28
                  divu         a3, t2, s1
                  slti         t1, t3, -339
                  fadd.s       fs6, fs7, fs4, rmm
                  srli         sp, a4, 7
                  add          a3, a2, s1
                  slli         sp, t5, 14
                  flt.s        gp, fs7, fa0
                  lui          s0, 824262
                  xori         gp, t1, 454
                  mul          s10, t6, s5
                  sltiu        s7, ra, -1889
                  ori          ra, a6, -645
                  sub          t1, s0, a2
                  fcvt.w.s     a4, fa7, rup
                  mulhsu       ra, a7, a6
                  lui          t4, 192743
                  fcvt.w.s     t6, fa2, rmm
                  fmv.x.w      s8, fs1
                  xor          t0, s9, a5
                  fcvt.s.wu    fs7, t2
                  feq.s        s8, fa7, ft6
                  fsub.s       ft9, fa0, fa4
                  rem          a5, tp, a3
                  addi         s11, s11, 1458
                  xor          a0, t1, s8
                  fmax.s       fs4, ft0, ft2
                  srli         t2, tp, 2
                  fsub.s       ft2, fs3, fa6
                  auipc        a3, 508282
                  add          gp, s1, ra
                  mul          t3, t0, s0
                  srl          s8, s2, s10
                  sub          t1, s10, a2
                  rem          s11, s11, s7
                  sub          s5, sp, t0
                  sra          a4, zero, tp
                  andi         tp, s6, 1344
                  feq.s        a1, fa7, fa5
                  flt.s        a5, ft2, ft7
                  srai         s5, t6, 23
                  fsgnj.s      ft6, fs10, ft10
                  fsgnj.s      ft6, fs5, fa0
                  xori         s11, s1, 356
                  fsgnjx.s     fs11, fs9, fs5
                  srl          s1, s5, s8
                  mulhsu       s9, s10, t2
                  fmv.x.w      s6, ft9
                  remu         t4, s11, a2
                  slt          s1, s9, sp
                  feq.s        a4, fs0, fa2
                  fmax.s       fs3, ft8, fs11
                  fmv.w.x      fs10, s3
                  feq.s        s7, fs3, fs6
                  fsub.s       fs7, ft9, fs0, rdn
                  slti         t1, a1, -1079
                  fmv.w.x      fs6, t2
                  ori          t2, t1, 225
                  lui          s6, 588836
                  fadd.s       fs10, fs1, fs6
                  fcvt.s.w     fa0, t0, rup
                  lui          s0, 533656
                  slli         s6, t6, 30
                  fmul.s       fs10, fa4, ft4
                  fmax.s       ft2, fs6, fa1
                  srai         s8, a1, 21
                  slli         t3, a7, 6
                  or           a4, a4, a4
                  mulhu        gp, s7, s9
                  fmax.s       fs1, ft2, fs7
                  div          s6, a5, s11
                  sll          s4, tp, s6
                  divu         a7, s0, s9
                  fclass.s     a3, ft11
                  slli         s1, s5, 23
                  mulhsu       s8, s3, a1
                  xor          tp, t3, t0
                  slli         t2, t3, 4
                  slti         t2, a2, 305
                  srl          t1, t6, s9
                  addi         sp, t2, -598
                  or           t3, t5, s5
                  divu         s9, s3, t0
                  slt          ra, s2, s9
                  xor          s6, t1, s6
                  fmax.s       ft6, fs1, fs7
                  xori         s11, t1, 497
                  fclass.s     sp, fs10
                  fsgnj.s      ft7, fa0, ft0
                  sra          t3, a0, a6
                  fcvt.s.wu    fs3, a1
                  sltu         s11, tp, t2
                  fcvt.s.w     fs0, a3
                  ori          s8, s8, 1015
                  slti         a1, t4, 1226
                  fsgnj.s      ft0, ft1, fa5
                  fadd.s       ft10, ft8, fs1, rne
                  sltu         t0, s11, tp
                  addi         t4, t2, -1171
                  auipc        s0, 1001058
                  slt          a4, tp, s11
                  slti         tp, s7, -1167
                  slli         gp, s5, 29
                  xor          gp, s3, a4
                  srai         s9, s4, 4
                  sub          sp, s8, t5
                  srai         t0, sp, 31
                  fclass.s     t2, fs4
                  fcvt.wu.s    t1, fs11
                  ori          t2, s8, -418
                  sltiu        s3, t2, 296
                  lui          sp, 599940
                  fcvt.w.s     s3, fs8
                  fcvt.wu.s    ra, ft9
                  srl          t2, s8, s6
                  mul          s6, t5, a5
                  srl          a0, s8, tp
                  fle.s        s6, fa6, fa2
                  fmin.s       fa7, ft3, fa4
                  sub          s7, s8, t5
                  fsgnjn.s     fa4, fa0, fs11
                  slt          s0, s4, s3
                  and          a4, s0, s7
                  rem          a1, a6, t2
                  fle.s        s10, fa3, ft5
                  fcvt.wu.s    s10, fa5, rmm
                  add          t2, s2, t5
                  xori         t4, s9, -1489
                  add          t2, s6, t2
                  rem          s9, ra, s4
                  add          a5, s3, t0
                  div          s10, s9, a4
                  fsgnjn.s     fa5, fs9, ft6
                  fmul.s       ft9, fs2, ft8, rne
                  fadd.s       ft9, ft9, fs10, rtz
                  sltu         s3, t0, t5
                  ori          t0, s0, 1422
                  divu         gp, s2, s9
                  slti         t1, s3, -203
                  or           a6, s8, t1
                  slt          s5, s5, t3
                  mul          s1, ra, s3
                  feq.s        ra, ft10, fa7
                  xori         s9, t5, -653
                  sltu         s10, a3, a2
                  xor          t2, s5, a2
                  srai         s10, tp, 2
                  fcvt.s.wu    ft2, s10, rmm
                  fclass.s     s7, fs4
                  sltiu        s10, sp, -1179
                  divu         sp, t4, s8
                  srl          s0, s7, t6
                  fmul.s       fs6, ft2, ft10
                  mulhsu       s7, s5, a2
                  addi         s9, gp, -311
                  fsgnj.s      fa5, fs0, ft2
                  fclass.s     s0, fs10
                  andi         a3, a1, -1542
                  fcvt.wu.s    s10, ft7
                  slt          gp, s8, t6
                  fsqrt.s      fs0, fa1
                  srli         s4, gp, 6
                  mulhsu       a3, s9, s7
                  fcvt.wu.s    a5, fa4
                  fmax.s       fa0, fa6, fa4
                  slti         ra, s3, -872
                  mulhu        s7, a1, a4
                  flt.s        t4, ft11, fa0
                  srl          s9, tp, s11
                  mulh         a3, s7, a6
                  div          t4, sp, a5
                  xori         s3, zero, 1203
                  add          s3, a4, tp
                  mulhu        a1, s2, t6
                  fsqrt.s      ft3, fs6
                  sll          a1, s4, s10
                  sra          s6, s0, a7
                  fcvt.w.s     t4, ft0
                  fsgnj.s      fs4, fa4, fs9
                  fsub.s       fs0, ft3, fa6
                  sra          s6, s9, a5
                  andi         a7, s1, -1930
                  xori         t4, zero, 263
                  remu         tp, s6, s8
                  sltiu        zero, t4, -1732
                  sra          s11, sp, s9
                  fsgnjx.s     fa4, ft5, ft6
                  addi         s9, ra, -1405
                  addi         gp, tp, -1229
                  mulhu        s5, t6, a3
                  andi         a0, s0, -1759
                  srl          t0, a0, a1
                  fle.s        t6, fs7, fa0
                  fle.s        s4, fa4, fa5
                  or           tp, t1, s5
                  slti         s8, s0, 1600
                  fmin.s       fs11, fa4, fs2
                  addi         s7, s5, -414
                  fsgnjx.s     ft4, fs8, fa7
                  fmv.x.w      gp, ft3
                  fmin.s       ft0, fa2, fa7
                  srai         t6, s10, 6
                  srli         s6, s11, 31
                  fsqrt.s      ft6, fa3
                  addi         s11, s3, 725
                  auipc        t3, 642391
                  or           s8, a5, s11
                  xori         t3, t5, -1622
                  fdiv.s       ft6, ft1, fa0
                  fcvt.s.wu    fs5, zero
                  remu         gp, s8, t0
                  fmin.s       fs7, fs7, fs0
                  feq.s        s10, fs10, ft4
                  andi         t3, s4, -1777
                  srl          s1, t0, ra
                  flt.s        tp, ft11, fa7
                  lui          sp, 899909
                  srl          s7, s0, a6
                  remu         s1, t5, t2
                  feq.s        t0, ft11, ft2
                  fsgnj.s      fa4, fs1, ft3
                  fsub.s       ft4, fa7, ft0, rup
                  sltiu        a3, t0, 579
                  slti         s11, a7, 1595
                  xor          t2, s0, t2
                  srli         ra, t2, 9
                  auipc        gp, 155943
                  sub          s6, tp, s11
                  rem          a4, s10, s10
                  rem          s7, t1, s4
                  auipc        zero, 883435
                  fadd.s       ft4, fa2, fs8
                  fcvt.w.s     a1, fs10
                  sltu         t3, s1, t4
                  slli         t1, a5, 9
                  remu         s0, a2, a1
                  fsub.s       ft7, fs7, ft5, rup
                  fclass.s     ra, fs2
                  fmv.w.x      ft7, a2
                  ori          s10, a2, 1159
                  fsgnjn.s     fs2, fs0, fs6
                  divu         s10, s1, s2
                  andi         t3, ra, 1816
                  ori          s1, t6, -800
                  fle.s        t2, fs9, ft10
                  fcvt.s.wu    ft3, s11
                  slti         s9, sp, 1214
                  fle.s        a7, ft7, ft7
                  fsub.s       fs1, fa6, fa2
                  ori          s7, ra, -1008
                  fle.s        a1, fs3, ft4
                  fle.s        a6, fa4, ft10
                  fsgnjx.s     ft9, ft9, fa4
                  sltiu        tp, sp, 1126
                  fclass.s     gp, ft11
                  xori         a3, s4, -20
                  divu         s5, sp, t4
                  fcvt.s.wu    fs10, gp
                  fsqrt.s      fs8, fa0
                  fcvt.wu.s    zero, ft6, rne
                  fsgnj.s      fa2, fs0, fa6
                  fsqrt.s      fs3, ft11
                  sltiu        t2, ra, 1113
                  rem          t0, t0, gp
                  fcvt.w.s     a7, ft2
                  sub          s8, t4, t5
                  fsub.s       fs1, fa3, fs6, rtz
                  rem          t0, s8, t2
                  srai         s3, s4, 26
                  flt.s        s4, ft10, ft1
                  flt.s        t6, fs7, fs9
                  rem          t1, a0, t4
                  ori          s8, tp, 1186
                  flt.s        s5, fs0, fa3
                  fmax.s       fs6, fs3, ft3
                  sltu         a5, t2, sp
                  sltiu        ra, a3, 380
                  lui          gp, 37916
                  fmax.s       fa1, fs8, fa1
                  ori          zero, tp, -502
                  fsqrt.s      fs10, fa0
                  auipc        a4, 1033032
                  srl          zero, t3, s11
                  fmax.s       ft3, ft9, fa6
                  or           s5, zero, s11
                  mulhu        s11, s5, a3
                  mulhsu       a5, s5, a6
                  nop
                  remu         a5, s4, a5
                  slli         zero, tp, 23
                  fcvt.s.wu    fs4, a2
                  slli         s3, gp, 23
                  nop
                  xori         s11, t3, 42
                  sltu         a4, t0, s8
                  srl          sp, gp, s9
                  mulhsu       s1, s4, s4
                  fcvt.w.s     t2, fs8, rup
                  fmv.w.x      ft10, t0
                  slti         s0, zero, -132
                  sltiu        a7, tp, 1011
                  fle.s        t4, fa0, fa1
                  fsqrt.s      fs4, fs2
                  fsgnjn.s     ft9, ft5, fa6
                  sltu         a7, a5, s0
                  fclass.s     a3, fs4
                  sra          ra, t1, s1
                  fdiv.s       fs10, fa4, ft3
                  slli         s8, s5, 27
                  mul          s9, sp, t3
                  or           tp, s3, s4
                  divu         s9, a3, t5
                  fsgnjn.s     fs1, ft0, fs2
                  fmv.x.w      s9, ft6
                  fmul.s       fa6, fs2, ft9, rup
                  srli         s0, s3, 27
                  sll          tp, s5, a0
                  fsgnjx.s     fa3, ft11, ft4
                  fmv.w.x      fs4, s8
                  rem          s11, t1, a6
                  sub          tp, a6, s4
                  srl          s0, t4, s7
                  andi         tp, s4, -1898
                  nop
                  slti         a5, a4, -1862
                  srai         s4, s4, 10
                  rem          s6, a1, t1
                  srli         gp, a0, 6
                  slti         a5, a4, -973
                  fcvt.s.wu    fs6, t6, rmm
                  div          zero, s6, t5
                  divu         t6, s5, s3
                  fsgnjx.s     fa7, fs6, fs4
                  fmv.x.w      a5, fa7
                  fcvt.s.w     fa5, a2, rtz
                  fmin.s       fs7, ft9, ft6
                  fcvt.w.s     t6, fa5, rtz
                  slt          t6, s11, s10
                  and          s5, s5, s2
                  fmin.s       ft10, ft5, fa5
                  divu         s4, a0, s8
                  fsub.s       ft6, ft10, fa1, rtz
                  lui          s8, 893129
                  rem          s3, a5, s11
                  addi         s4, a1, 1026
                  mulhsu       zero, s4, s7
                  div          a0, t3, a3
                  fcvt.s.w     ft1, s1, rmm
                  remu         zero, a3, s2
                  fsgnjn.s     fs1, ft6, fs8
                  ori          s0, t2, 34
                  sltu         gp, a6, ra
                  fadd.s       ft6, fs9, ft10, rup
                  fmin.s       ft7, ft3, ft3
                  div          s9, s5, t6
                  fcvt.s.w     ft6, t5
                  slt          a6, s2, t0
                  rem          s10, s6, s6
                  fsub.s       fs9, fs4, ft9, rtz
                  remu         tp, s7, s6
                  fadd.s       fs3, fs0, ft6, rtz
                  rem          s1, t1, t6
                  slli         a1, tp, 0
                  fsqrt.s      ft2, fs3, rne
                  fsgnj.s      fs11, fs10, fa2
                  fsub.s       fa1, fa5, fs8, rmm
                  divu         zero, t1, s8
                  flt.s        s0, fa4, fa1
                  or           a3, gp, s10
                  mulhsu       a4, s7, gp
                  andi         s6, s0, 259
                  ori          a5, a5, -1916
                  sltu         s5, t4, a1
                  srl          ra, a3, gp
                  mulhu        s4, tp, s10
                  or           a0, a4, zero
                  andi         s7, t0, 778
                  srai         a7, a0, 8
                  divu         s10, s3, s8
                  andi         s5, t6, -1651
                  fcvt.wu.s    s11, fs10
                  slt          s1, t6, a5
                  auipc        t6, 835918
                  sub          ra, s8, s10
                  fsub.s       fa6, fs5, ft8, rne
                  add          s10, s0, a7
                  auipc        s6, 145040
                  slli         s1, s7, 3
                  fcvt.s.w     fs4, s7
                  fcvt.wu.s    tp, ft5, rdn
                  xor          s9, a4, t3
                  srl          a6, a7, a2
                  and          a7, t2, a2
                  fsub.s       fs4, ft2, fa5, rtz
                  flt.s        gp, fa2, ft2
                  add          ra, a0, s6
                  divu         a7, a4, s3
                  or           s5, a6, s4
                  fmax.s       fs8, fs6, fa3
                  flt.s        t1, ft4, fs7
                  and          a1, s8, a5
                  slt          a5, a4, t5
                  fdiv.s       fs0, fs9, ft9
                  srli         a4, t1, 13
                  xor          s7, s3, s2
                  addi         s10, a0, 1552
                  fdiv.s       fs11, ft11, fa6, rtz
                  fcvt.w.s     s10, ft1, rup
                  mul          t6, t0, t4
                  fmin.s       ft2, ft10, fa1
                  fdiv.s       ft2, fa3, ft2, rup
                  fcvt.s.wu    ft1, tp, rtz
                  slli         a1, t2, 11
                  fmax.s       fs2, ft8, ft2
                  divu         a4, t0, a7
                  fadd.s       fa1, ft2, fa5
                  srli         gp, s9, 2
                  slt          a0, a3, a2
                  fcvt.s.wu    fs5, t5
                  srl          a5, t6, zero
                  fsgnj.s      ft4, fa3, fs11
                  fadd.s       ft2, fs8, ft9
                  and          gp, a1, t4
                  fcvt.w.s     gp, fs9, rdn
                  fmax.s       fs7, fs10, fa4
                  fclass.s     s8, ft5
                  srai         zero, t0, 6
                  fdiv.s       ft5, fa7, fa2
                  fcvt.wu.s    s7, ft10
                  sltu         sp, t4, s7
                  sub          s10, s0, a2
                  sll          s8, s2, tp
                  fmin.s       ft3, fa3, fs10
                  sra          s8, gp, s8
                  srl          a1, a2, a6
                  fsgnjx.s     ft0, fs6, fa3
                  fmul.s       fs1, ft7, ft10
                  fsgnj.s      fa0, fs11, fa7
                  sll          zero, tp, gp
                  auipc        ra, 363347
                  rem          t4, s11, s4
                  sll          a0, t2, zero
                  fle.s        a1, fs4, fs3
                  ori          a6, s7, 1516
                  sltu         s7, s5, ra
                  mulhsu       s5, s2, s6
                  remu         s4, s5, s11
                  fcvt.s.wu    fa6, a2, rup
                  ori          s0, s3, -1405
                  fsub.s       fs5, ft3, ft7, rne
                  srl          s8, t5, a5
                  srl          t6, s9, t1
                  sltiu        s0, a7, 796
                  fmul.s       fa3, ft6, ft8
                  sltiu        t0, a0, -1704
                  slt          sp, a5, t6
                  fadd.s       fs3, fs9, fs11, rup
                  fmin.s       fa5, ft7, ft2
                  remu         t3, s1, t0
                  nop
                  divu         t0, gp, s9
                  fsqrt.s      fa2, fs9
                  fmul.s       fs5, fa2, fs0, rdn
                  fmv.x.w      t4, fa7
                  slt          a3, tp, t0
                  srai         s9, a1, 27
                  slli         zero, s11, 7
                  ori          a7, s10, -553
                  srli         t6, a0, 9
                  ori          s6, s4, -1997
                  fcvt.s.wu    fs4, t6
                  fmv.w.x      fs1, s9
                  slt          a1, t3, t3
                  srli         s3, s6, 17
                  div          t4, s2, s9
                  xor          zero, t1, a5
                  xori         s11, a7, 1705
                  fcvt.w.s     s7, fa6
                  fcvt.w.s     s9, fs10
                  fclass.s     s3, ft1
                  xor          a1, a0, t1
                  div          s11, a1, s8
                  divu         ra, t5, s8
                  xori         s4, tp, -1809
                  fle.s        t6, fa7, ft0
                  flt.s        s9, fa0, ft1
                  sltiu        s5, s7, 1308
                  fmv.w.x      ft6, t2
                  fcvt.w.s     a6, fs11
                  andi         s4, t6, 358
                  mul          a3, t4, a3
                  mulhu        a3, t6, s2
                  sll          t3, t2, t1
                  feq.s        t6, fa1, fa7
                  feq.s        sp, fs0, fa0
                  fcvt.s.w     ft5, a1
                  fdiv.s       fs9, fs6, fa7, rmm
                  srai         s3, a6, 18
                  fmul.s       fs11, fs10, ft10, rup
                  mulhu        s7, a5, t3
                  and          t6, a2, s6
                  andi         a5, s5, 1246
                  fsqrt.s      fs5, ft7, rne
                  fmin.s       fs7, fa2, fs9
                  xori         zero, t4, 976
                  sub          gp, a5, s2
                  mulhu        s10, s11, t2
                  or           a5, s0, s11
                  remu         tp, s1, a7
                  fmin.s       ft2, fa4, ft2
                  slt          a3, s1, t0
                  add          t0, s8, a4
                  auipc        s1, 12176
                  fsqrt.s      fs4, fs9
                  slt          sp, a0, t4
                  mulhu        t0, sp, a1
                  srli         zero, a7, 21
                  fcvt.w.s     a4, fa1, rdn
                  ori          a7, a5, 910
                  fmv.x.w      ra, fs10
                  fmv.x.w      tp, fs0
                  flt.s        a6, fs5, fs1
                  fadd.s       fa0, fs4, fa2
                  slt          s10, s1, s10
                  fadd.s       ft0, fa1, ft6
                  fsgnj.s      fa0, ft6, ft11
                  nop
                  add          sp, s5, zero
                  srli         t4, t3, 17
                  nop
                  fmv.w.x      fa2, a2
                  fdiv.s       ft6, fs10, fs7, rne
                  fcvt.wu.s    s9, fa1
                  fsgnj.s      fs2, fa0, fa7
                  slli         zero, s11, 21
                  fle.s        s10, ft11, fs1
                  fmv.x.w      a4, fa0
                  fmul.s       ft8, fs7, fs1
                  fmv.x.w      zero, ft1
                  mulh         a6, sp, s11
                  fdiv.s       fs2, fa4, fs3
                  srli         s11, s9, 19
                  mul          s1, s11, s11
                  nop
                  slli         zero, a4, 23
                  xor          t3, a2, a2
                  mul          a7, s8, t6
                  mulhu        a1, s3, a3
                  remu         a7, s2, a6
                  mulh         s6, s5, ra
                  or           a7, tp, a2
                  fclass.s     s5, ft5
                  add          a5, a2, t1
                  fsqrt.s      ft0, fs9
                  fmv.x.w      gp, fs0
                  xori         s4, a1, -846
                  fmin.s       fa5, fs1, ft9
                  fmv.w.x      fs4, zero
                  slli         a4, a5, 0
                  div          s11, a7, s7
                  fcvt.w.s     a5, ft2
                  fsgnjn.s     fa2, fs10, fs7
                  ori          s8, s6, -514
                  andi         s10, t5, -830
                  fmax.s       ft2, fa1, ft4
                  feq.s        ra, ft0, ft4
                  fcvt.w.s     s10, fs2
                  or           a4, a7, t2
                  fmul.s       ft7, ft9, fa6, rup
                  sra          t3, s10, a1
                  fsgnj.s      ft4, ft8, ft1
                  add          t0, a5, s10
                  nop
                  divu         a0, s5, s7
                  sltu         sp, t0, s11
                  fmax.s       ft4, fs10, ft11
                  fsgnjn.s     ft9, fa7, ft9
                  ori          s10, a0, -1227
                  feq.s        t4, fa5, fs1
                  andi         sp, t1, 2035
                  fsgnj.s      fs6, fa3, ft3
                  auipc        tp, 966474
                  addi         s1, s10, -1698
                  xori         s1, ra, -1017
                  div          t4, t6, s11
                  srli         s8, s3, 3
                  sub          t4, s11, s6
                  fcvt.s.wu    ft9, ra, rtz
                  fmul.s       fs9, fa7, fs6, rup
                  fcvt.wu.s    s4, ft0
                  fmin.s       ft8, fa3, ft4
                  or           t0, a2, a6
                  fdiv.s       fa6, fs4, fa1
                  fcvt.wu.s    t2, fa3, rmm
                  sra          s0, s6, t4
                  fcvt.s.wu    fs3, s1, rdn
                  mul          s3, a1, s8
                  and          a0, a4, s2
                  remu         a4, a5, tp
                  fcvt.s.w     ft11, s1, rne
                  ori          s5, gp, 1379
                  fmv.w.x      ft5, t0
                  fdiv.s       fs6, fa6, fs4, rmm
                  slti         s11, s9, -1518
                  srli         s7, a5, 13
                  or           t2, t2, a5
                  slti         t0, a2, 1980
                  xor          a0, a5, s11
                  sra          tp, s2, s11
                  or           s5, a5, t2
                  sra          s8, sp, s5
                  fcvt.wu.s    gp, ft10
                  slli         s10, sp, 1
                  fcvt.s.wu    ft10, a1
                  mulhsu       t3, t5, s11
                  srai         gp, t0, 25
                  fsgnjn.s     fa3, ft2, fs4
                  remu         a4, a1, t6
                  fmax.s       ft9, fs4, fs9
                  fmax.s       fs9, fs10, ft8
                  fle.s        ra, fs4, ft0
                  fsqrt.s      fs10, fs0
                  srli         t3, a4, 18
                  fcvt.s.w     fa6, a6, rup
                  fsgnjn.s     ft3, ft8, fa2
                  srli         s10, a2, 28
                  fdiv.s       ft11, ft7, fs1, rmm
                  xor          s3, s1, a4
                  fadd.s       ft3, ft3, ft11, rup
                  fdiv.s       fs6, ft10, ft6
                  fsqrt.s      fa1, fa2, rdn
                  flt.s        s0, fs1, ft4
                  srli         a7, a0, 6
                  sub          s10, a4, s10
                  slli         a0, s1, 9
                  lui          t3, 775080
                  flt.s        s3, fa2, fs8
                  fcvt.wu.s    sp, fs11
                  addi         s8, s7, -1100
                  srli         t0, sp, 9
                  sra          t2, gp, t5
                  srl          ra, s9, ra
                  fcvt.s.w     fa1, t6, rtz
                  slli         tp, t0, 26
                  flt.s        a4, fs5, ft8
                  slli         tp, a4, 10
                  div          tp, s11, s10
                  fcvt.w.s     s3, fs8
                  srli         t2, sp, 17
                  fsgnjn.s     fs9, ft7, ft11
                  srai         t0, t2, 9
                  lui          t3, 676970
                  divu         s8, t0, t6
                  slti         s8, a6, -557
                  sltu         a1, s4, s9
                  fsub.s       fs5, fs8, ft1, rmm
                  fsqrt.s      fa3, fa3
                  fadd.s       ft2, ft0, fa4, rdn
                  sll          t4, tp, a3
                  srai         zero, s4, 0
                  fsqrt.s      ft7, fa4, rdn
                  srli         s3, gp, 1
                  feq.s        s0, ft11, fs10
                  fsgnj.s      ft4, fs5, ft10
                  slt          gp, s1, s0
                  fcvt.s.wu    ft10, s0, rup
                  fcvt.wu.s    a3, fa2
                  mulh         a7, s11, t4
                  sra          a4, s2, s8
                  slt          tp, s0, a2
                  flt.s        zero, fa5, fa2
                  fcvt.s.w     fs8, s8, rdn
                  srl          sp, zero, s2
                  or           a0, s5, s4
                  sltu         a0, t5, t5
                  flt.s        t0, ft10, ft10
                  fsgnjn.s     fs7, ft8, fs5
                  sltiu        t6, gp, -630
                  fsgnjn.s     fs8, ft5, ft7
                  fsgnj.s      ft5, fs7, ft7
                  sll          a0, t6, a2
                  flt.s        s6, ft5, fa4
                  slti         a7, t1, 1699
                  fsub.s       fa5, fa7, fs10
                  addi         tp, t4, 1771
                  andi         s10, t3, 69
                  slli         s5, a3, 12
                  slli         gp, t1, 30
                  sltu         s7, s9, s7
                  mulhu        s7, s5, a6
                  xor          s8, s7, a3
                  fcvt.w.s     s10, fs8, rup
                  fmin.s       fa2, fs4, fs5
                  fcvt.s.w     fs1, gp
                  xori         t4, t3, 395
                  srl          s6, s1, s1
                  sltu         s1, t5, t2
                  feq.s        a3, ft4, ft0
                  fcvt.wu.s    t6, fs9
                  fsgnj.s      ft9, ft1, ft7
                  fle.s        s5, fs9, fs4
                  fmax.s       ft6, ft6, ft10
                  rem          t2, s1, zero
                  srl          a5, s3, s9
                  fclass.s     s0, fs5
                  sltiu        ra, t3, 981
                  fadd.s       ft2, fs6, fa7, rdn
                  xor          a4, sp, t0
                  fsgnjx.s     fs0, ft4, fs11
                  ori          s1, ra, -1318
                  srl          a4, s11, t3
                  div          a5, a4, sp
                  ori          s4, s1, -1874
                  fcvt.s.wu    ft8, a5, rdn
                  xori         zero, s4, 915
                  fcvt.w.s     s8, fa7, rne
                  srai         t1, s4, 17
                  slli         s0, s6, 24
                  fmv.x.w      a3, ft5
                  fmv.x.w      t2, fa4
                  sll          a3, t2, tp
                  fcvt.s.wu    fs7, s6
                  sll          gp, t3, s7
                  xor          t4, t3, s0
                  sra          t3, a3, sp
                  mulhu        s10, t2, t3
                  fsgnjx.s     fa0, ft11, fa2
                  srli         s1, s9, 2
                  feq.s        s0, fs5, ft4
                  or           a1, a7, a3
                  fsqrt.s      fs2, fs11, rup
                  fle.s        t2, fa0, ft5
                  auipc        gp, 448910
                  slli         s3, a4, 19
                  xor          gp, a1, t0
                  slt          s7, s0, s6
                  srli         t6, s8, 26
                  lui          t0, 337395
                  sltu         s3, a0, s0
                  remu         s10, t0, s10
                  sltu         s9, s11, s3
                  xor          tp, s8, s8
                  add          s1, gp, a4
                  remu         t1, t3, s9
                  feq.s        a0, fs8, fa2
                  mul          s10, s9, a4
                  ori          a7, s0, 559
                  srl          s7, ra, a1
                  srli         s11, s0, 9
                  fcvt.w.s     s11, fs1
                  srl          tp, a0, t3
                  mulh         s1, a1, tp
                  fsgnjn.s     fa7, fs4, fa2
                  srai         t1, a4, 2
                  fadd.s       fa2, fs4, fs4, rne
                  fsub.s       fs11, fa3, fa3
                  fsqrt.s      fa1, fa0
                  rem          a5, s1, s9
                  auipc        zero, 945916
                  slt          s11, a1, sp
                  sltu         t2, ra, t6
                  sub          s11, s4, s4
                  fcvt.s.wu    ft6, a5, rup
                  fmax.s       fa2, fa7, fs1
                  fsqrt.s      fs5, fa2
                  fcvt.s.w     fs11, s5, rup
                  xori         s7, t1, 1921
                  add          a5, s5, t2
                  sub          a3, s0, a3
                  slt          a0, a3, s4
                  or           gp, t6, s4
                  slli         ra, tp, 31
                  xor          t3, t4, t4
                  mulhu        a4, s1, t0
                  mulhu        t6, a5, t1
                  fclass.s     s10, ft2
                  lui          s6, 871940
                  sra          s1, a2, s2
                  auipc        a5, 361023
                  lui          t1, 143329
                  fsgnj.s      fa0, fs11, fs4
                  mulhsu       t3, a2, t0
                  or           a7, t3, ra
                  mul          s5, a1, t4
                  sra          sp, t5, a2
                  sltu         t3, t3, s4
                  fdiv.s       ft0, fa2, ft3
                  fcvt.s.w     fs2, sp, rup
                  ori          s3, a6, 872
                  feq.s        tp, fs3, fs7
                  fcvt.s.w     fs6, a2
                  xori         s9, s11, 424
                  add          s11, zero, s4
                  fcvt.s.w     ft5, a0
                  xor          s6, a4, ra
                  mul          a4, a6, s3
                  fcvt.s.wu    fa0, s10
                  xori         s4, s0, 938
                  lui          s9, 308562
                  slli         t3, a7, 3
                  fsgnj.s      fs2, fs1, fa1
                  fle.s        s9, fa1, ft6
                  fcvt.wu.s    s9, ft6
                  fcvt.w.s     t3, fs6
                  slti         t0, a5, 641
                  mulhsu       t2, t4, s1
                  feq.s        s3, fs5, fs11
                  mul          a6, s8, zero
                  slt          t6, t2, s6
                  fsub.s       fs3, ft4, ft6
                  srli         s7, a7, 10
                  mulhsu       gp, s8, zero
                  addi         t6, t5, -400
                  nop
                  andi         a3, t6, -948
                  nop
                  addi         a1, s8, -49
                  fle.s        a5, ft5, ft0
                  sltiu        t0, tp, -1321
                  srai         s4, t6, 5
                  remu         s5, s11, s6
                  fmul.s       fa3, ft6, fa7
                  fcvt.s.w     fa3, s5, rup
                  fmul.s       fs9, ft5, ft11
                  remu         a6, s3, s0
                  divu         s10, s11, a2
                  fmv.x.w      t0, ft3
                  fsgnj.s      fa0, fs6, ft8
                  addi         ra, s1, 613
                  fmv.x.w      s0, ft0
                  fclass.s     t1, fa7
                  slti         s3, s3, -1206
                  sltiu        t6, s5, -67
                  slli         a7, sp, 17
                  andi         sp, tp, 1235
                  rem          zero, s11, s3
                  addi         t4, s7, 1578
                  add          a3, t3, s4
                  slt          s4, t0, zero
                  fdiv.s       ft2, ft11, fa5, rdn
                  fcvt.w.s     s4, ft1, rup
                  fcvt.w.s     s0, ft2, rne
                  fclass.s     s7, ft11
                  fclass.s     zero, fa1
                  and          s5, t4, s10
                  fmv.w.x      ft9, s11
                  sub          sp, t2, t0
                  sltiu        t0, s10, 277
                  fle.s        sp, ft8, ft8
                  fsqrt.s      ft2, ft0
                  nop
                  srli         s7, s2, 20
                  mulh         a3, s10, s5
                  fmul.s       ft1, fs10, fa1
                  flt.s        sp, fa5, fa5
                  fmin.s       fs10, fs0, fs10
                  fcvt.s.w     fs6, a2
                  xori         ra, a5, -889
                  fcvt.wu.s    t6, ft11
                  fsgnjn.s     ft8, ft10, ft3
                  fsgnj.s      fs3, ft4, ft1
                  slti         a5, tp, 1530
                  fsqrt.s      fa5, ft0
                  fmul.s       ft10, ft7, fs0
                  ori          t6, s5, 206
                  mulh         t1, sp, sp
                  auipc        zero, 251369
                  div          s4, zero, a4
                  lui          tp, 487525
                  and          a3, t2, sp
                  srai         s11, s0, 10
                  srl          t1, a6, ra
                  divu         tp, t6, s8
                  fsgnj.s      ft11, ft6, fa7
                  slt          s8, t5, a0
                  flt.s        s6, fs10, fa3
                  flt.s        s8, fs1, ft1
                  auipc        a0, 728420
                  fmax.s       fs4, ft7, fs3
                  srl          sp, a5, s4
                  srai         s3, s10, 10
                  div          a6, s9, zero
                  and          a3, a3, t4
                  or           t2, s6, s1
                  nop
                  fsqrt.s      ft5, ft2
                  xori         a5, t5, 115
                  fmul.s       ft4, fa3, ft1, rup
                  srl          t1, s7, a0
                  srli         t1, s6, 15
                  andi         gp, gp, -1624
                  srl          ra, tp, s4
                  fmv.w.x      fs9, s2
                  fclass.s     s5, fs6
                  lui          zero, 41276
                  fle.s        s11, ft4, ft8
                  slt          s6, s5, t3
                  fmax.s       fa2, fa5, ft4
                  mulhsu       a7, tp, s1
                  ori          s6, s5, 361
                  slti         s10, s6, -1353
                  sltu         t3, gp, a3
                  add          a6, t2, a2
                  andi         s10, t5, -509
                  fsqrt.s      fs11, ft1, rtz
                  flt.s        zero, fs1, ft8
                  remu         s11, ra, t1
                  fadd.s       fa2, ft5, fa4, rne
                  srai         sp, a6, 30
                  fcvt.s.w     fs11, s1
                  fsgnj.s      fa6, ft7, fa3
                  slli         a1, t0, 18
                  slt          s3, s4, zero
                  nop
                  mulhu        zero, s4, s5
                  sra          a3, s4, a6
                  addi         s8, a5, 625
                  fmv.x.w      ra, fs7
                  sltu         zero, t6, a4
                  slti         t1, ra, 1746
                  xor          s4, tp, a0
                  or           zero, a6, s9
                  and          a3, gp, t0
                  sltiu        a3, t4, -432
                  addi         s3, t0, -603
                  ori          a4, t1, -1879
                  feq.s        zero, fa1, fa2
                  andi         s3, gp, 1303
                  fmin.s       fa2, fs0, fs11
                  divu         t3, a1, t4
                  feq.s        ra, ft9, fs3
                  slt          tp, t1, s2
                  addi         s1, t5, 2018
                  fmv.w.x      fs3, zero
                  div          s4, ra, t1
                  sltiu        s5, a0, 829
                  mulhu        tp, zero, gp
                  sltiu        a1, zero, 1167
                  ori          t2, s4, -1926
                  fmv.w.x      fa1, zero
                  ori          sp, s4, 792
                  ori          s3, a6, -684
                  slt          s5, s3, s10
                  fcvt.s.w     fa7, s7, rdn
                  auipc        s0, 498677
                  divu         s0, a2, sp
                  addi         ra, gp, -113
                  fmul.s       fa6, fs8, ft9
                  sra          a6, zero, s10
                  add          s0, a0, s10
                  sll          a5, s5, zero
                  sll          tp, a2, a3
                  mulhu        s0, a7, a3
                  divu         s8, ra, s5
                  lui          t0, 1007597
                  or           s4, s11, a6
                  lui          t1, 774672
                  fcvt.s.wu    ft3, t4
                  slli         a3, s10, 17
                  div          s8, s11, a3
                  andi         a6, t6, 264
                  fsqrt.s      fs8, fs8, rtz
                  mul          zero, s7, t3
                  fsgnjn.s     fs1, ft6, ft9
                  ori          s7, t5, 400
                  divu         a6, s9, s7
                  fmv.w.x      ft2, a2
                  fsgnjn.s     fs4, fa6, fa3
                  andi         s1, s6, -1806
                  fcvt.w.s     a0, ft6, rup
                  fmv.x.w      s4, fs11
                  mulhsu       s4, s9, ra
                  fmul.s       fa2, fs1, fs5
                  fcvt.w.s     t4, ft11, rup
                  fmax.s       ft7, ft1, ft5
                  sub          s7, a1, zero
                  div          gp, s3, ra
                  fmv.w.x      fs6, a2
                  fmv.x.w      tp, fs8
                  and          s9, a4, s11
                  addi         s10, t0, 1674
                  fcvt.s.wu    fa0, s5, rtz
                  fmin.s       fs1, fa0, fs8
                  remu         s9, s6, s0
                  fmin.s       fs1, fs3, fs10
                  nop
                  remu         t3, a2, t1
                  sll          s3, t4, s11
                  and          s10, s3, s11
                  addi         s10, gp, 324
                  add          s8, t1, a7
                  sub          t6, s4, t1
                  xori         sp, gp, -1542
                  fcvt.s.w     ft8, a5
                  srli         s10, s6, 2
                  slt          t0, t3, t6
                  fcvt.w.s     tp, fs10
                  sll          s5, sp, s3
                  srai         t0, a5, 8
                  auipc        s11, 657677
                  fle.s        a5, fa1, ft11
                  fadd.s       fs11, fa6, ft8, rup
                  divu         s10, t1, sp
                  slli         zero, a5, 24
                  div          t4, s3, s2
                  fadd.s       fa1, ft9, ft9, rmm
                  slli         zero, s2, 2
                  addi         t6, sp, 1821
                  fmv.w.x      fs8, s2
                  fsqrt.s      fs9, fs8
                  slt          t4, s11, a2
                  fcvt.w.s     s1, fs7, rdn
                  srai         t6, t3, 1
                  slti         a4, sp, 576
                  srli         s6, gp, 28
                  xor          a6, a0, t2
                  sub          t6, t5, a0
                  sltu         ra, a3, t5
                  add          a1, sp, s3
                  and          zero, a6, s7
                  fsub.s       ft0, fs11, fs2
                  fsub.s       fs3, fa3, ft10, rdn
                  sra          s5, a6, t5
                  mulhu        tp, a2, t4
                  fsqrt.s      fs5, ft10, rne
                  sll          s6, s3, s2
                  fclass.s     s9, ft3
                  remu         s1, t0, t2
                  fmv.w.x      fs9, t6
                  lui          a0, 82560
                  fsgnj.s      fa6, fs6, fs4
                  mulhsu       t1, s10, s7
                  fsgnj.s      fa1, fs6, fs5
                  fcvt.wu.s    s6, fs5, rdn
                  or           s10, t5, s10
                  fadd.s       ft2, fs6, fs3
                  mulh         s0, a4, s0
                  slti         t6, s4, -923
                  slli         s0, a6, 23
                  fcvt.s.w     ft4, t4
                  fadd.s       fa6, fa7, fs8
                  srli         s5, s8, 2
                  fmv.w.x      fa2, a2
                  fcvt.w.s     tp, fs5
                  sltu         s1, ra, tp
                  feq.s        t3, ft6, fs1
                  srl          t0, a5, a0
                  div          s10, t6, zero
                  nop
                  fcvt.s.wu    ft4, sp
                  fadd.s       fs2, fs9, ft7, rup
                  and          t2, s0, ra
                  remu         t2, s11, s2
                  fsub.s       fs1, ft8, fs7
                  srli         s8, s9, 31
                  flt.s        s6, fs10, fs4
                  fclass.s     s7, fa5
                  fmv.x.w      a5, fa6
                  fsqrt.s      fs5, fa2, rne
                  fsqrt.s      fs0, fs4
                  addi         t6, a3, 650
                  fmv.x.w      s3, fs8
                  slli         a3, s7, 15
                  sll          a0, s1, s2
                  fle.s        ra, ft8, ft8
                  andi         s3, t3, 671
                  fle.s        s10, fa6, ft6
                  sltiu        a1, ra, -2026
                  sltu         s1, zero, ra
                  mulhsu       s0, gp, s2
                  srai         a5, t2, 20
                  fadd.s       fs10, ft9, fa7, rmm
                  xori         s5, gp, 915
                  srai         zero, a6, 0
                  fcvt.w.s     t2, fa7, rdn
                  fcvt.s.wu    ft9, s3
                  ori          s3, s3, -136
                  srli         a7, s7, 25
                  div          t3, t5, gp
                  sra          a7, s2, s5
                  fcvt.w.s     a4, ft11, rup
                  fcvt.wu.s    t4, ft2
                  or           ra, s5, s7
                  and          tp, s6, a3
                  fmv.w.x      ft3, t1
                  divu         a5, s7, t2
                  slt          a0, s11, a6
                  mulhsu       ra, gp, t1
                  sll          zero, s4, a1
                  fmax.s       ft1, fa5, fa4
                  divu         s7, s7, s0
                  flt.s        a6, ft1, fs9
                  fmin.s       fa2, fa5, fs7
                  fadd.s       ft2, fa0, ft0, rup
                  slt          ra, s9, s0
                  mulhsu       sp, t2, a0
                  fmin.s       ft9, fa5, ft6
                  fsgnjx.s     fs9, ft5, ft2
                  andi         s9, s9, -986
                  flt.s        ra, ft8, ft0
                  mulhsu       s1, sp, s10
                  divu         s6, s1, s8
                  ori          t3, s2, 1312
                  fcvt.s.w     ft7, s8
                  fmin.s       ft9, fs11, fs3
                  mul          t1, a6, t1
                  nop
                  auipc        tp, 557109
                  fsgnj.s      ft5, fs11, ft7
                  srai         s8, t1, 17
                  sub          t3, t0, ra
                  flt.s        s10, ft3, ft8
                  fcvt.s.w     fa4, sp
                  slti         s0, s7, -1139
                  fsqrt.s      fs11, fs1
                  sltiu        s9, s11, 1829
                  and          a0, gp, s8
                  rem          t1, t3, a4
                  or           a5, a0, a7
                  fsgnj.s      fs11, fs9, ft2
                  fle.s        zero, fs10, ft1
                  or           s3, t5, s9
                  or           t4, zero, a5
                  sltiu        sp, t0, 796
                  fmv.x.w      s1, ft6
                  fle.s        zero, fs6, fa3
                  fsgnjx.s     ft7, ft7, fa7
                  fclass.s     s8, fa4
                  fcvt.w.s     a0, ft3
                  add          a5, t2, s10
                  fcvt.s.w     fa5, t0, rne
                  divu         t6, a6, s1
                  fadd.s       fs7, fa6, fa4, rup
                  srli         t2, zero, 11
                  fmul.s       fs7, fs8, ft1, rne
                  fmin.s       fs10, fs2, ft11
                  fclass.s     s7, fs4
                  auipc        s3, 301076
                  fsgnjx.s     fa5, fa1, ft11
                  fmul.s       fs0, fs5, fs6, rup
                  auipc        tp, 898652
                  fmax.s       ft3, ft11, fs6
                  nop
                  xori         s11, s8, -1522
                  and          gp, tp, sp
                  slti         t1, t4, -1681
                  fadd.s       fs1, fa4, fs1, rup
                  sub          s0, ra, t3
                  nop
                  divu         gp, a6, s10
                  slli         t6, t1, 4
                  div          gp, t6, s2
                  andi         a4, sp, -1164
                  feq.s        t6, ft2, fa7
                  remu         a3, s9, s2
                  divu         a0, t5, a3
                  rem          a4, t4, a3
                  fdiv.s       ft0, ft0, ft8, rmm
                  fsgnjx.s     fs5, fs8, fs5
                  fdiv.s       fs6, fs7, fa0, rmm
                  andi         t1, t4, 260
                  addi         a6, s7, 1964
                  fsgnjx.s     fa0, ft3, fs0
                  addi         s6, s3, -805
                  fcvt.w.s     s11, fa1
                  div          t2, s8, t6
                  nop
                  fcvt.s.w     fs11, s4
                  fle.s        t0, fs9, ft7
                  sra          a4, s8, tp
                  fcvt.wu.s    t1, fs5
                  sltu         s0, s1, s2
                  sltiu        a1, s7, -867
                  ori          a0, a4, -2004
                  fmin.s       fs0, fa5, ft10
                  fsqrt.s      fs4, fs2, rup
                  or           sp, a5, s11
                  sub          a5, s0, s8
                  xor          s7, s10, s0
                  fclass.s     ra, fa0
                  sll          s1, s7, zero
                  ori          s5, t5, 1722
                  rem          a1, t2, t5
                  add          a0, t4, a6
                  fsgnjx.s     ft3, fs3, fs10
                  fcvt.s.wu    fa1, s8
                  fmul.s       fa6, fs3, fs6
                  fcvt.s.w     ft8, s9, rne
                  andi         a4, a4, -868
                  ori          ra, t1, -687
                  or           s1, t4, gp
                  fsqrt.s      ft10, fs0, rtz
                  fmul.s       fa0, fa3, fs8
                  auipc        s10, 187814
                  fsgnj.s      ft9, fa1, fs10
                  sll          a7, s9, a4
                  fmax.s       fa3, fs3, fa2
                  mulh         s3, t0, a7
                  mul          a1, sp, a2
                  xor          ra, ra, a0
                  fclass.s     s11, ft9
                  fsgnj.s      fs8, ft11, fs3
                  sub          a3, s7, s3
                  fclass.s     tp, fs2
                  feq.s        s11, fs4, ft6
                  fmul.s       ft6, fs0, ft6
                  fmul.s       ft1, fs0, ft1
                  fclass.s     t1, fs7
                  sll          a6, s0, t4
                  slti         a0, a1, -821
                  mulhsu       s7, s0, a7
                  div          a3, s8, sp
                  mulhsu       tp, tp, a0
                  slt          s8, s1, t4
                  sll          s0, t2, s2
                  srai         a3, s6, 10
                  remu         ra, s4, a2
                  fclass.s     s11, fs6
                  fcvt.w.s     a7, fs3
                  nop
                  mulhu        s7, t5, gp
                  add          a3, t2, zero
                  fcvt.w.s     a4, fa4, rmm
                  fsgnjx.s     fs3, fs2, ft0
                  andi         s6, s6, 915
                  fsgnj.s      ft11, ft10, ft8
                  slli         s3, s8, 23
                  fle.s        sp, fa4, ft7
                  mulhu        a7, t2, s4
                  feq.s        a6, fa2, fa0
                  fmv.x.w      a4, ft6
                  fadd.s       ft4, fs4, ft10, rdn
                  fsub.s       fa2, fa2, fa4
                  slti         t1, t1, -1575
                  andi         t1, a3, -1226
                  srai         s4, a6, 17
                  fsqrt.s      ft1, fa4
                  feq.s        s8, fa7, ft0
                  fmin.s       fa5, fs4, fa1
                  and          ra, t5, a0
                  fcvt.s.w     fa3, t5
                  remu         s10, s0, t0
                  fadd.s       fa3, fa7, fs10
                  sltiu        s5, s7, 1726
                  add          s0, a6, a6
                  sltu         zero, s2, zero
                  ori          t2, t3, 1661
                  fcvt.w.s     zero, fs1
                  fmin.s       fs2, fs5, fa2
                  srai         t4, s8, 5
                  fcvt.s.w     ft8, s10, rne
                  sltiu        sp, s0, -1949
                  remu         a7, s1, t1
                  sltu         gp, t0, s7
                  srl          sp, a2, s9
                  fmv.w.x      ft2, s7
                  fcvt.s.w     fa7, t3
                  fsgnjn.s     ft0, ft6, ft4
                  fle.s        a5, fa3, ft3
                  fsgnjx.s     fs2, fa3, fa7
                  nop
                  fsub.s       ft6, fs0, fs0
                  fle.s        t1, ft6, fs2
                  xori         t0, t6, 1591
                  auipc        s4, 785996
                  div          a5, s1, a3
                  mulhsu       t2, a2, sp
                  sra          s1, t0, s8
                  flt.s        ra, fa6, fs10
                  fsgnjn.s     fa5, ft3, fs6
                  fclass.s     t3, ft5
                  fmin.s       fa6, fs6, fa0
                  sra          a4, a0, a6
                  fmax.s       fs2, ft10, ft3
                  fmv.x.w      t3, fs6
                  mulhsu       a6, a5, s1
                  slti         s11, s4, 1621
                  fcvt.s.w     fa5, s4
                  mul          s7, tp, s7
                  divu         a6, s5, t6
                  fmin.s       fs7, ft10, fa3
                  fsub.s       fs3, fa0, fs5, rdn
                  srli         a6, t2, 31
                  fcvt.s.w     fs2, s3
                  slt          s7, s2, tp
                  sll          s3, t5, s0
                  add          s10, t3, a1
                  fcvt.s.wu    ft2, t0, rtz
                  sra          a7, s4, a0
                  fsgnjn.s     ft9, fa4, fs11
                  srl          sp, a2, zero
                  rem          ra, t4, zero
                  fclass.s     s1, ft11
                  sltu         a6, s10, zero
                  sll          tp, a4, a4
                  flt.s        sp, fa1, fs8
                  srli         tp, s11, 15
                  auipc        t6, 134439
                  srli         a0, s10, 7
                  rem          s4, a3, s3
                  fmax.s       fa3, fa7, ft9
                  andi         s11, a2, -1822
                  srai         s1, a4, 3
                  fmv.w.x      fs8, ra
                  add          t6, t2, a5
                  mul          s0, t1, a3
                  fcvt.s.w     fs5, s4
                  fmv.x.w      a7, ft5
                  sltiu        a0, zero, -1335
                  xor          zero, a4, t0
                  rem          a6, t0, tp
                  fsub.s       ft8, ft8, fs2, rdn
                  mulhu        s5, t4, t4
                  div          a7, a7, s11
                  srli         t3, a5, 0
                  or           s9, gp, gp
                  fcvt.wu.s    sp, fa2
                  slti         ra, zero, -183
                  div          tp, t1, t1
                  mul          tp, ra, t6
                  mulhu        ra, t6, t5
                  slli         s5, a1, 26
                  fsgnjx.s     fs10, fs0, ft9
                  slli         tp, s10, 18
                  xor          a1, s6, t1
                  sltu         s10, s2, s3
                  fcvt.s.wu    ft3, a5, rne
                  fsgnjn.s     ft7, ft8, fa5
                  sra          s10, s6, t6
                  fdiv.s       fs11, fa6, fs4, rdn
                  fsub.s       ft6, fa4, fs10
                  sltiu        s3, a1, -1484
                  andi         s5, s9, -1256
                  fsqrt.s      fs10, fa2
                  fsgnjx.s     fs11, ft1, fa2
                  fcvt.s.w     fs9, s5, rmm
                  sltu         s9, t5, a1
                  fadd.s       fs8, fa5, ft4, rne
                  fsgnj.s      ft11, ft4, fa5
                  srai         t1, t2, 27
                  fmul.s       fa4, fa1, ft7
                  nop
                  sra          s7, s4, tp
                  addi         t4, s11, 485
                  fcvt.s.wu    ft2, s6
                  fsub.s       fa4, fs0, ft7, rup
                  flt.s        a3, fs6, fs1
                  sub          a0, a4, t6
                  slti         a7, s9, 1575
                  fcvt.wu.s    s6, ft2, rmm
                  fmv.x.w      s7, ft11
                  lui          zero, 721490
                  fclass.s     s10, ft4
                  sltiu        a1, a7, 334
                  sltu         a7, a1, zero
                  slti         a0, s8, -582
                  lui          s4, 862823
                  fle.s        t4, fa7, ft9
                  lui          tp, 178062
                  addi         zero, gp, 908
                  fcvt.w.s     t3, fs8, rne
                  nop
                  fdiv.s       fs4, fs7, fa1, rmm
                  fcvt.s.wu    fa5, a5
                  fclass.s     a5, ft9
                  xori         t4, s11, 1311
                  fcvt.s.w     fs2, a2
                  sub          s1, s6, t3
                  ori          a3, s6, 1528
                  fsgnjx.s     fa7, fa6, fa1
                  rem          zero, s9, t3
                  sra          a3, s3, a0
                  fmax.s       fs6, fs2, fs11
                  srli         a7, s8, 7
                  fmin.s       ft2, fa3, ft2
                  fcvt.s.wu    fs0, s2
                  fsub.s       fs8, fs6, ft10
                  ori          ra, sp, 920
                  fsub.s       ft0, ft8, fa7, rdn
                  fmin.s       fs10, ft2, fs6
                  auipc        s9, 588506
                  mulh         a3, s4, tp
                  lui          t2, 129917
                  fdiv.s       fs4, fs9, ft0, rmm
                  fclass.s     t2, fa3
                  and          s10, s3, a1
                  fcvt.wu.s    s0, ft7
                  fmin.s       ft2, fs9, ft3
                  xori         a7, a5, 1640
                  addi         s0, a6, 117
                  slli         t2, a6, 18
                  andi         s4, s7, 39
                  flt.s        t3, fs3, fs3
                  fsqrt.s      fs3, fs6, rmm
                  fmin.s       fs1, fa7, fs11
                  feq.s        s6, fs11, ft5
                  remu         s4, s4, a2
                  mulh         t3, t0, t4
                  fcvt.wu.s    ra, fs7, rmm
                  fmul.s       ft2, fs4, ft7, rdn
                  lui          a6, 541484
                  fmul.s       fs0, ft2, fs2
                  srl          s11, s8, t0
                  fmax.s       fs1, fa3, fa0
                  xori         a3, a6, -2031
                  sltu         s3, sp, t4
                  fsqrt.s      ft10, ft6, rmm
                  slli         t2, tp, 19
                  nop
                  and          t2, s2, s10
                  fmax.s       ft3, fa6, ft7
                  fmin.s       fa7, fa3, fs2
                  fadd.s       ft3, ft6, ft2, rne
                  fcvt.wu.s    t6, fa4, rtz
                  srli         a6, a3, 27
                  add          a0, a6, a3
                  fsub.s       ft10, ft1, ft5
                  mulhsu       a4, t2, s11
                  fmv.w.x      fa4, t3
                  fmax.s       fa2, ft2, ft4
                  mul          s4, t0, a7
                  fle.s        s10, fs0, fs6
                  xor          gp, s2, s1
                  remu         s7, t0, s10
                  nop
                  fsgnjx.s     ft2, fs1, fs3
                  slt          a4, t5, s8
                  sra          zero, s8, tp
                  fcvt.w.s     s8, fs4, rmm
                  fadd.s       fs6, ft7, fs6, rup
                  sra          t6, t6, a5
                  div          a5, s9, s10
                  fmv.w.x      fs6, sp
                  fsub.s       fa7, fa7, fa1
                  fcvt.s.wu    fa6, s10, rup
                  remu         s7, a5, a5
                  fclass.s     s1, fs7
                  mul          s3, gp, s6
                  auipc        t0, 237426
                  mulh         a1, a7, a5
                  srai         s1, t2, 20
                  fcvt.s.w     ft6, t6, rdn
                  mulh         s10, t3, t0
                  fmv.x.w      t3, fa7
                  fadd.s       fs3, fs8, fs1, rdn
                  fadd.s       fa4, ft8, fs0
                  srai         s4, gp, 2
                  fcvt.s.w     fs9, a7
                  fmv.w.x      fa6, t5
                  sltiu        a3, zero, -1152
                  div          s3, sp, a7
                  fsqrt.s      ft9, ft11, rne
                  or           gp, ra, s2
                  mulhsu       ra, a1, s5
                  fmin.s       fa2, fa5, fs0
                  sll          t4, ra, s10
                  fsgnj.s      ft2, fs0, fs6
                  remu         t1, a7, s6
                  fmv.w.x      ft9, s5
                  fsub.s       ft6, fa0, fa6
                  xor          s9, a6, s3
                  sll          t4, a1, s0
                  sub          s6, s10, a0
                  fcvt.s.wu    ft5, s9
                  fmv.x.w      a7, fs8
                  slli         s3, s5, 13
                  feq.s        tp, ft1, fs1
                  fsgnjx.s     ft8, fs8, fa7
                  fsqrt.s      fs6, fs5, rdn
                  fsgnjn.s     fa0, fa2, ft6
                  fsgnj.s      fa2, ft0, ft8
                  slli         a7, s9, 11
                  or           a3, a7, ra
                  nop
                  add          t6, s7, ra
                  fsgnjx.s     fs2, fa1, ft11
                  fcvt.s.w     fs0, s10
                  slti         a6, s11, -375
                  sltiu        s6, s6, 1065
                  sub          s6, t5, a0
                  mul          gp, a0, a2
                  sltu         s3, t5, tp
                  fsqrt.s      fa3, fs11
                  slti         s8, zero, 146
                  fle.s        s6, ft1, ft0
                  mulh         t4, a1, s1
                  rem          s11, t3, s0
                  lui          s5, 300561
                  xori         t0, s5, -739
                  divu         a0, s6, tp
                  mulh         a7, a4, s10
                  divu         zero, tp, a5
                  fle.s        t4, ft2, fa4
                  fcvt.w.s     s5, fs6
                  fsub.s       fs6, ft6, fa0, rup
                  sll          t2, sp, t6
                  nop
                  nop
                  or           a0, a0, a0
                  fcvt.w.s     t0, fs5
                  divu         t4, s2, s3
                  fcvt.s.wu    fa1, s8
                  fsub.s       ft11, ft1, fa2, rup
                  sra          s5, t4, a3
                  fmax.s       fs2, fs4, ft10
                  srli         a6, a6, 4
                  sltiu        a3, a3, -2038
                  xori         t1, a3, -1439
                  mulhu        s6, s8, sp
                  mulhu        s11, s10, a7
                  mulhsu       a4, t1, tp
                  fmv.x.w      t3, fs4
                  mulh         a4, ra, zero
                  fdiv.s       fs8, fs11, ft3, rne
                  flt.s        a0, fs1, ft8
                  auipc        s5, 837261
                  xor          s3, t5, zero
                  fadd.s       ft0, ft3, ft8, rne
                  mulhsu       s0, s4, ra
                  fsgnj.s      fs8, fs0, ft8
                  srli         sp, s6, 3
                  flt.s        t4, ft7, ft9
                  mulhsu       s11, a0, a7
                  div          s0, s9, a3
                  sltiu        t0, s8, 1518
                  fmax.s       fs11, ft8, fs4
                  mul          s3, s3, ra
                  fsub.s       fa3, ft3, fs8, rmm
                  div          gp, t3, s8
                  fadd.s       fs3, fs7, fs2
                  fmin.s       ft8, fa3, fs4
                  srl          t4, a2, s2
                  andi         a3, s11, 635
                  addi         a3, a3, 1602
                  flt.s        sp, ft10, ft9
                  fclass.s     sp, ft9
                  fmv.x.w      a4, fa7
                  fmv.w.x      fa1, t3
                  auipc        s6, 856321
                  srli         t4, a5, 21
                  auipc        gp, 55179
                  fsqrt.s      ft0, fa1
                  fmv.x.w      a7, fa6
                  sltu         s7, a7, s8
                  slti         a6, a3, -1923
                  fclass.s     t1, fs11
                  add          t3, zero, s10
                  srai         a4, a7, 22
                  fcvt.w.s     t3, ft6
                  mul          a4, s11, t2
                  mul          s9, s2, t0
                  rem          s11, s3, s5
                  mulhu        ra, s10, t0
                  fle.s        s0, fs3, fs11
                  xor          a3, tp, s10
                  ori          sp, s0, 1381
                  fcvt.wu.s    s3, fa0, rdn
                  fadd.s       ft1, ft10, fa5, rtz
                  xor          s6, s2, zero
                  fdiv.s       fs7, ft3, fa5
                  mulhsu       s8, s6, t5
                  srai         a5, s11, 6
                  fcvt.s.w     fa3, tp
                  auipc        t0, 842199
                  andi         sp, s7, -566
                  srli         s1, a6, 11
                  fsgnjx.s     fa3, fs3, ft0
                  mulhu        gp, a0, t0
                  auipc        a4, 904189
                  nop
                  fsqrt.s      fa0, fs9
                  fcvt.wu.s    t4, fs7
                  fmv.x.w      s9, fs9
                  mulhu        t6, t3, s8
                  sub          t2, a5, s9
                  fsgnjn.s     fs7, fa2, fs5
                  and          gp, s1, t6
                  addi         a1, s6, -1282
                  addi         a7, s1, -27
                  fcvt.wu.s    s8, ft5
                  sltiu        s0, s2, -704
                  divu         t2, s9, s7
                  flt.s        a3, fa4, fa4
                  sltu         s1, t2, s2
                  addi         s1, zero, -1763
                  or           tp, s6, s8
                  auipc        gp, 735961
                  fcvt.s.w     ft3, a7
                  fmin.s       fa5, fa0, fs1
                  and          s8, tp, ra
                  srl          s8, s4, gp
                  andi         a1, a0, -1819
                  fle.s        s11, fa4, ft8
                  nop
                  sra          sp, tp, t3
                  or           t1, gp, s2
                  mul          ra, a0, gp
                  fdiv.s       fa0, ft6, ft3, rne
                  sra          s11, a3, t4
                  slti         s11, s3, 2004
                  fle.s        a7, fa4, fs10
                  xori         a3, t4, -910
                  srl          s11, s0, a3
                  mulh         s9, s3, sp
                  remu         s3, a2, a7
                  srl          t0, t3, t5
                  addi         s1, tp, -985
                  fclass.s     t4, fa7
                  ori          a5, t3, -2034
                  or           s7, a7, a5
                  and          t2, a2, s11
                  srai         t2, s5, 18
                  fmv.x.w      s4, ft8
                  fclass.s     t6, fs5
                  or           t6, s10, a1
                  or           s8, s5, a4
                  fmin.s       fs3, fs2, ft9
                  fmv.x.w      s0, ft8
                  rem          s1, t3, t1
                  addi         s1, tp, 1159
                  fcvt.s.wu    ft6, s4, rup
                  mulhu        ra, t5, s3
                  fmin.s       fa1, ft3, fs0
                  srl          a6, a1, a2
                  mulhu        s6, t0, t1
                  sltu         a3, t5, t0
                  flt.s        s10, fa6, ft9
                  mulhu        sp, s5, t1
                  or           s11, t5, a2
                  fsgnjx.s     fa4, fs11, fs0
                  sltiu        s1, s1, 2032
                  fmul.s       fs1, fa5, fa1
                  slt          a1, t2, a2
                  srl          a7, s2, a2
                  or           tp, t2, s11
                  add          gp, ra, tp
                  fsqrt.s      fa0, fs11
                  mul          a1, a2, t6
                  mulh         ra, a2, a5
                  feq.s        t3, fa3, ft1
                  ori          zero, s7, 1303
                  mulh         a4, s8, t6
                  srl          a0, t2, ra
                  add          t1, s1, t0
                  fle.s        a6, fs0, ft10
                  fcvt.wu.s    a1, ft1, rtz
                  and          s11, s8, ra
                  div          s5, t3, a0
                  fcvt.s.w     fa3, t0
                  sltu         a3, s4, a6
                  mulhsu       sp, s1, t1
                  xori         ra, gp, -140
                  fcvt.s.w     fs6, gp, rmm
                  mulh         s8, s11, a7
                  fle.s        zero, fa4, ft1
                  andi         s0, s10, -1629
                  or           a3, s9, sp
                  fcvt.s.wu    ft11, t5, rtz
                  fdiv.s       ft5, fa6, fa2, rup
                  sll          a4, s9, t6
                  fmv.w.x      fs5, a4
                  fcvt.w.s     s3, fs5
                  sltiu        a4, s4, -1278
                  sub          t1, a6, s2
                  remu         a6, s1, s10
                  fmax.s       ft5, fs3, fa2
                  srai         a3, t2, 27
                  sltiu        gp, ra, 1975
                  fmul.s       fa2, fs6, fa2, rmm
                  fdiv.s       fs10, ft3, ft7, rmm
                  fsgnjn.s     ft10, fs7, fs9
                  sll          gp, s2, a6
                  mul          s10, t5, s2
                  xori         s7, s7, 1496
                  addi         t4, s4, 1901
                  slti         s7, a6, 1857
                  mulhu        t2, s6, s6
                  fcvt.w.s     s8, fs11
                  xor          sp, ra, s6
                  srl          s8, zero, a3
                  fmin.s       fs7, fa4, fs9
                  fsub.s       fa2, ft8, fa6
                  mulhsu       t2, zero, t4
                  fsgnj.s      fs4, fs9, ft10
                  add          s10, s9, sp
                  sltiu        t2, tp, 1171
                  nop
                  fsqrt.s      fs10, fa2, rtz
                  fmin.s       ft6, fa4, fs5
                  fmv.x.w      s3, fs8
                  addi         t2, s7, -1307
                  xori         s3, a5, -826
                  sltu         zero, t5, s5
                  srli         gp, tp, 29
                  fclass.s     a5, fa0
                  fsgnj.s      ft10, fa7, fa0
                  srai         a3, s3, 23
                  fcvt.wu.s    a6, fa3
                  fsub.s       fs4, fs1, ft4
                  fmv.x.w      a5, fs9
                  fcvt.s.w     fa2, zero, rne
                  slli         s3, s10, 29
                  add          t2, s0, a1
                  add          t3, s5, ra
                  slt          a0, s7, ra
                  fmin.s       fs10, ft9, fs6
                  fsqrt.s      fa3, fs2
                  mulhu        s8, s10, t6
                  feq.s        a3, fs9, ft6
                  mulhu        s11, s4, s0
                  or           sp, t4, s9
                  fdiv.s       ft4, ft7, fa1
                  mulh         s8, sp, a1
                  nop
                  fmv.x.w      t3, ft0
                  fsgnjn.s     fa3, ft10, fs8
                  rem          t1, tp, gp
                  sltu         s6, a0, tp
                  fmv.w.x      fs1, t6
                  fsqrt.s      ft10, ft5
                  feq.s        a6, fs6, fa2
                  fmul.s       fs7, fa2, fs2
                  fmax.s       fs10, fs10, fs7
                  sltu         s3, t6, t4
                  div          t6, t5, t2
                  nop
                  slti         ra, t0, 1930
                  addi         tp, a0, -1029
                  remu         s8, sp, t5
                  add          tp, a0, t3
                  mulhu        t6, s2, t3
                  andi         t4, tp, 1347
                  fle.s        s5, fa0, ft3
                  sll          t3, a0, s11
                  fmv.w.x      fs3, s2
                  srli         s11, t5, 13
                  slti         t0, tp, 1028
                  nop
                  fsub.s       fa4, fa4, fs2
                  fdiv.s       fa5, ft1, fs4, rdn
                  fcvt.s.w     fs8, s6, rtz
                  mulhsu       s9, a2, gp
                  ori          s5, a7, -1812
                  sltiu        a1, a1, -1521
                  ori          a5, a3, 1778
                  fcvt.s.w     fa2, s11
                  fmul.s       fs8, ft4, fa1
                  fsgnj.s      fs0, ft3, fs8
                  fmv.x.w      ra, fs10
                  feq.s        t6, fs2, ft8
                  xori         s10, a4, 587
                  slt          sp, a3, s9
                  andi         s4, a7, 1663
                  fmax.s       fa0, fa4, fa1
                  fsub.s       fs10, fs8, fs3
                  mulhu        s0, t3, a7
                  fcvt.wu.s    a0, fs8
                  auipc        s1, 715183
                  fclass.s     tp, fa5
                  add          a7, a3, t4
                  mulhsu       s10, s1, s11
                  fcvt.w.s     t4, fs11
                  mul          t6, s5, s4
                  xor          a6, s3, zero
                  fcvt.s.w     ft4, s8
                  fdiv.s       fs5, ft0, fs10, rup
                  mulhu        s4, zero, t3
                  sub          s6, a1, s5
                  fmv.w.x      fa5, s3
                  fsqrt.s      fs3, fa3
                  fmv.w.x      fs6, s10
                  xor          s0, gp, a3
                  xori         tp, t1, -515
                  rem          t6, s6, a6
                  remu         ra, s9, s1
                  fdiv.s       fs1, fs8, fs5, rdn
                  srl          t1, s11, s8
                  rem          a3, s8, s5
                  fsgnjn.s     fs9, fs8, fs3
                  srai         a3, zero, 20
                  mulhsu       ra, tp, gp
                  auipc        s3, 736744
                  addi         tp, a3, 618
                  nop
                  auipc        a5, 485341
                  fcvt.s.wu    ft4, s5, rup
                  sltiu        s5, a6, 694
                  slt          a1, a3, t1
                  fadd.s       fs11, ft0, fa4
                  fsgnjx.s     fs11, fs7, fs1
                  lui          s11, 989893
                  fsqrt.s      fa7, ft9, rdn
                  fle.s        s4, fs7, ft6
                  rem          s1, s1, a0
                  nop
                  fmul.s       ft8, fs5, ft0
                  fdiv.s       ft10, ft1, fa3, rne
                  fcvt.s.w     fa6, t6, rne
                  srli         t4, t0, 6
                  mulh         s10, a1, s8
                  xori         zero, s7, 1207
                  srl          t4, t1, s11
                  sra          a7, zero, s10
                  fsgnj.s      ft2, ft8, fs5
                  fdiv.s       ft7, fa4, fs1
                  mulh         s6, s8, t6
                  fclass.s     s5, ft8
                  fmax.s       ft6, fs6, fs0
                  srl          sp, t3, s1
                  xor          t3, s1, a2
                  sll          t3, sp, t5
                  fsub.s       fs11, fa1, ft9
                  fle.s        t3, fa1, ft5
                  fle.s        t1, fa4, fs9
                  fmul.s       ft4, ft3, ft7
                  fcvt.w.s     s11, fa6
                  sltu         gp, s11, a0
                  fadd.s       ft6, fs7, ft1
                  mulhu        tp, s4, ra
                  fsgnj.s      fa4, fs4, ft2
                  fsqrt.s      fs3, ft5, rup
                  sltiu        a3, a1, 818
                  divu         t4, t5, s0
                  srli         t4, s5, 18
                  slli         t3, s5, 28
                  feq.s        ra, fa4, fs3
                  ori          a3, t6, -1830
                  fsgnjn.s     fs7, ft11, ft11
                  fle.s        s3, ft7, fa7
                  fdiv.s       ft3, ft1, ft8
                  fsub.s       ft4, fa1, ft8
                  or           s3, t1, a2
                  sltiu        s0, a0, 928
                  sltiu        s7, s2, 1261
                  sra          s1, a5, s6
                  mulhu        t2, s2, t3
                  mulhsu       t1, a7, zero
                  auipc        a4, 407074
                  srai         a6, gp, 19
                  fsgnj.s      fs6, fs0, fa0
                  slli         tp, ra, 3
                  fmv.x.w      s1, fs9
                  flt.s        t4, ft9, fs10
                  rem          s10, ra, a1
                  sub          zero, a7, s0
                  sra          t0, t6, tp
                  mulhu        s9, s1, s2
                  fsgnj.s      fa5, ft10, fa4
                  mul          ra, t5, s0
                  rem          a5, s1, a1
                  divu         a0, t4, s3
                  auipc        t3, 1006260
                  flt.s        a1, fs5, ft1
                  sub          t4, s5, t6
                  sub          a3, t4, s10
                  or           t6, a4, s11
                  lui          s0, 910179
                  fsgnjx.s     ft6, fa3, fs5
                  fsub.s       fa7, fa5, ft7
                  srli         a5, a4, 5
                  sub          t0, s2, s0
                  sltiu        s5, t1, 1991
                  fmax.s       fa2, fs8, fs4
                  fcvt.w.s     a6, fs8, rne
                  fcvt.wu.s    s0, ft6
                  fcvt.w.s     a5, ft11
                  andi         zero, s7, -1126
                  mulhu        s5, s2, s0
                  mul          a5, s7, s9
                  ori          a5, s4, -1482
                  xor          s9, t4, s9
                  mulhu        s0, t4, t2
                  slti         s8, s0, -1474
                  remu         s5, s6, s0
                  fle.s        s5, fa6, fa4
                  fle.s        t0, fa2, fs6
                  fmax.s       ft6, fs6, ft6
                  rem          ra, s2, t3
                  fclass.s     s9, fs6
                  xor          ra, a6, gp
                  fsgnjn.s     fa5, fs5, ft8
                  fle.s        s11, fs6, fa6
                  andi         s5, s7, 1170
                  lui          t1, 182336
                  fcvt.w.s     ra, fa2, rne
                  srai         a6, s1, 14
                  sub          t4, sp, tp
                  srli         t2, s11, 24
                  fmv.x.w      a6, fa3
                  fle.s        a6, fa3, fa6
                  fcvt.wu.s    gp, fs1, rup
                  fle.s        t0, ft7, fs10
                  nop
                  fclass.s     t1, ft5
                  fmv.w.x      fa1, t0
                  andi         s4, t1, 895
                  add          s5, t6, t6
                  fsgnjn.s     fs7, fs9, fs10
                  remu         a1, s2, t3
                  fclass.s     t0, fs1
                  fle.s        s1, fs7, ft9
                  fmul.s       ft10, fa0, fs4, rdn
                  sra          s10, s5, s5
                  sltiu        s6, s2, -1067
                  fcvt.w.s     t1, fa0
                  srl          s7, sp, s3
                  xor          t2, sp, sp
                  mul          t6, s11, s4
                  fsqrt.s      fs4, fs10
                  mul          t6, a5, s2
                  feq.s        a6, fs7, fa1
                  fmv.w.x      ft11, t1
                  fmv.x.w      t0, ft9
                  slt          a1, t4, s4
                  sub          s7, zero, a1
                  fcvt.wu.s    ra, fa4
                  fmul.s       fs9, fs4, fs11, rtz
                  or           a3, tp, a0
                  feq.s        t4, ft5, ft1
                  fsqrt.s      fa0, fs0, rtz
                  div          t1, t0, sp
                  mul          zero, s3, a7
                  fadd.s       fs0, ft1, fa3, rne
                  andi         tp, t3, -403
                  fclass.s     s5, ft6
                  sltu         t0, a7, t1
                  fmul.s       fa7, ft9, ft1
                  sub          t1, t0, t5
                  slti         a1, s3, 994
                  fmin.s       fa6, fa4, ft4
                  fsgnjx.s     fs0, ft3, fs2
                  sra          s5, a2, t0
                  fsgnj.s      ft7, ft9, ft8
                  sltu         a7, sp, s7
                  add          s3, s4, t4
                  feq.s        s9, ft7, ft4
                  fclass.s     t2, fs4
                  auipc        zero, 844101
                  auipc        s3, 930737
                  fle.s        zero, ft10, fa2
                  srli         s8, s3, 15
                  mulh         zero, s5, a2
                  flt.s        s9, ft8, fs5
                  fsqrt.s      ft2, ft3
                  fdiv.s       fs5, fs2, ft8
                  fdiv.s       ft10, fs8, ft8
                  slti         s9, sp, 1520
                  fcvt.s.w     fa6, a7
                  addi         t4, s5, -986
                  fmax.s       fs5, ft6, fs8
                  sltu         s9, s11, a1
                  fmin.s       fs8, fa7, ft7
                  fcvt.s.w     fa1, t0, rmm
                  fmul.s       ft8, fs4, fs8, rmm
                  fmul.s       ft5, fs6, fa2, rup
                  remu         s3, s10, a4
                  sub          a0, s1, tp
                  sra          a0, t1, a7
                  sra          s6, tp, t0
                  fdiv.s       fa4, ft7, fs8, rup
                  srai         a7, gp, 15
                  fsub.s       fs8, fa4, ft2, rne
                  fdiv.s       ft11, fa1, fa6
                  slli         s4, s11, 8
                  mulhu        zero, ra, s10
                  slli         tp, a6, 13
                  sll          a4, t0, sp
                  sub          t3, a4, a6
                  div          s10, t4, zero
                  div          t4, s11, gp
                  or           sp, a6, s7
                  div          s0, s5, a5
                  fclass.s     s4, ft5
                  ori          s9, gp, -745
                  fclass.s     s9, fs4
                  or           t1, s5, a0
                  fdiv.s       fa3, ft5, ft8
                  mulh         a5, zero, s10
                  mul          a6, t3, s9
                  fcvt.s.wu    fa6, s1
                  fclass.s     a1, ft8
                  feq.s        a3, fs6, fs4
                  fdiv.s       fs5, fs8, ft2
                  sltiu        ra, tp, -978
                  auipc        t3, 453831
                  fcvt.s.w     fa4, a3, rtz
                  lui          sp, 605864
                  fsgnj.s      fa1, fa3, fs6
                  fcvt.w.s     s0, fa4
                  fmv.x.w      s10, ft0
                  sub          s11, t4, t3
                  fsgnjn.s     fa6, fa3, fa7
                  fmin.s       fs3, fa0, fs2
                  remu         s11, s7, tp
                  and          a4, t4, t2
                  lui          s8, 187681
                  sub          t6, a4, t2
                  divu         t1, a6, s2
                  srli         s5, a5, 25
                  srl          gp, a3, t0
                  slti         t4, a7, 289
                  fsub.s       fa7, fs9, ft9, rup
                  sltu         s0, s4, t5
                  addi         s8, s7, -1703
                  fsgnjn.s     ft7, fs2, fs10
                  divu         t0, s6, t4
                  lui          s10, 862472
                  fcvt.s.wu    fa1, s8
                  lui          s5, 5522
                  mulhu        s0, s3, s11
                  rem          s1, t4, s4
                  mulhu        s1, t0, s3
                  fle.s        s7, fs6, fs7
                  fadd.s       ft1, ft10, fs0
                  divu         t6, sp, s5
                  fcvt.w.s     t1, ft8
                  fsub.s       ft8, fs9, fs11, rmm
                  fsqrt.s      ft3, ft1, rtz
                  fcvt.s.wu    ft1, s2
                  div          ra, s0, t3
                  add          s9, s8, s2
                  divu         t4, s6, a7
                  fclass.s     s1, ft6
                  fle.s        sp, ft4, fs0
                  fmv.x.w      a7, ft5
                  fadd.s       fs10, ft7, ft6
                  fsgnjx.s     fs11, ft5, fa1
                  slti         s0, zero, 309
                  fsgnjn.s     ft10, fa6, fs6
                  fsgnj.s      fa4, fa4, fs10
                  fcvt.w.s     tp, ft7
                  fcvt.s.wu    fa5, t6
                  flt.s        ra, fs8, ft4
                  fcvt.s.w     fa5, s5, rmm
                  sltu         s3, a5, a0
                  sll          t3, s8, sp
                  sra          t6, s5, a4
                  fsgnjx.s     ft0, ft2, fa6
                  or           gp, t1, t2
                  srli         s5, s2, 6
                  feq.s        s9, fa6, ft6
                  srli         a3, ra, 26
                  fsgnj.s      fs5, fa7, ft10
                  fsqrt.s      fs2, fs5, rtz
                  fadd.s       fs6, ft10, fs8
                  xor          s5, a3, a0
                  auipc        tp, 587317
                  div          s4, t5, s8
                  fdiv.s       fa6, fs9, ft5
                  add          s3, s4, a1
                  fmv.x.w      t0, fa2
                  andi         s10, s1, 1399
                  ori          t4, s10, -485
                  srl          a0, t0, ra
                  nop
                  fcvt.w.s     t4, fa0, rdn
                  sub          s1, t0, t4
                  add          gp, s8, a0
                  slti         a7, t3, 166
                  fsub.s       ft1, fs2, fs8
                  srl          ra, s9, tp
                  fcvt.s.w     fa3, a1
                  slli         a4, s6, 4
                  divu         s4, sp, s4
                  auipc        s9, 1000584
                  fle.s        tp, ft4, fa4
                  srl          gp, zero, t2
                  fmin.s       fs0, fs4, fs8
                  addi         s0, a7, -214
                  mulh         gp, a7, gp
                  fsgnj.s      ft5, fa5, fa3
                  fmin.s       ft7, fs3, fs9
                  sll          sp, s9, t1
                  fle.s        s4, fa5, fs3
                  sll          a5, sp, s2
                  ori          ra, s11, -638
                  slti         t0, s11, 1933
                  fcvt.s.w     fs1, s11, rne
                  auipc        ra, 175823
                  fmax.s       fs10, fs8, fs2
                  addi         sp, t3, 1065
                  fle.s        s6, ft2, fa4
                  rem          gp, a7, a2
                  ori          sp, gp, -642
                  rem          t6, t5, sp
                  remu         s3, t3, t0
                  remu         s5, a5, t4
                  fmv.x.w      a3, fs1
                  add          a6, s2, t5
                  fsgnj.s      fs7, fs2, fa6
                  fmin.s       fa3, ft4, ft4
                  nop
                  xor          tp, s9, s0
                  srai         t0, t0, 28
                  fcvt.s.w     fa3, t2, rdn
                  fmax.s       fs4, ft2, ft0
                  xori         t2, a4, -653
                  lui          gp, 941374
                  fclass.s     tp, fs7
                  fmin.s       fa3, fs1, ft10
                  fle.s        t2, fs6, ft3
                  fmv.x.w      s9, fs5
                  sll          a1, ra, a2
                  fle.s        tp, fa2, fs6
                  fmul.s       ft7, fs6, fa7
                  fcvt.s.w     fa2, s10, rtz
                  sll          s10, t5, a0
                  fsgnjx.s     ft2, fa2, ft9
                  fmin.s       fa4, ft0, fs6
                  sra          a3, s6, s11
                  fsgnjx.s     fs5, fa0, fs7
                  mulh         t2, s6, s8
                  fadd.s       ft1, fs11, fs5, rdn
                  fsgnj.s      ft10, fs4, fa6
                  sltu         a7, t4, t4
                  srl          t2, tp, s0
                  xor          s10, a3, s5
                  sub          s0, s5, s3
                  and          gp, a1, s0
                  fdiv.s       ft7, ft5, fs3, rdn
                  fmul.s       fs7, fs3, fa5
                  fcvt.wu.s    s8, ft2
                  srai         a3, s8, 6
                  add          t3, s7, t2
                  or           a1, s2, s6
                  fcvt.w.s     s4, fs6, rne
                  fcvt.wu.s    s7, ft6, rmm
                  sltiu        zero, t0, -1405
                  slti         a7, tp, -1293
                  ori          zero, s0, 1417
                  fle.s        s10, ft7, fs2
                  slt          s5, gp, s10
                  flt.s        s11, ft4, ft6
                  srli         s3, a7, 13
                  divu         s1, t1, a4
                  sra          a1, a1, t0
                  flt.s        s8, fa5, fa0
                  xor          s8, s8, s10
                  slt          s1, a2, tp
                  addi         s4, t4, 1142
                  div          ra, t0, s11
                  flt.s        tp, ft4, fa4
                  mulhu        a5, s10, s2
                  ori          s1, a5, 1395
                  fmin.s       fs9, fs6, fa4
                  remu         t0, a1, sp
                  sra          s10, s1, t0
                  fcvt.w.s     a7, ft2, rup
                  fcvt.w.s     a6, fa7, rup
                  fmax.s       ft10, fs9, fa3
                  remu         a7, a6, tp
                  or           t6, a5, t0
                  sll          t2, s0, s8
                  fmin.s       fa2, fa7, ft10
                  nop
                  add          s9, s10, s4
                  ori          zero, a1, -1781
                  srai         zero, t6, 9
                  fcvt.w.s     s1, ft9, rtz
                  fmin.s       fs1, ft3, fs6
                  fle.s        t1, fs2, fs11
                  sra          s1, s6, s7
                  feq.s        s4, fs0, fa6
                  fle.s        gp, fs0, fs0
                  fcvt.s.wu    fs10, t3, rne
                  fcvt.s.w     fs11, tp, rtz
                  flt.s        a3, fs4, fs4
                  fclass.s     sp, ft5
                  xor          s10, s4, t3
                  ori          a7, s6, 155
                  fadd.s       fa7, fs3, ft8, rne
                  sra          s5, a5, s8
                  nop
                  fmul.s       fa2, ft6, fs4, rtz
                  fclass.s     t1, fs9
                  sub          a4, sp, s2
                  or           t0, a1, sp
                  ori          t6, a2, 2029
                  divu         ra, t0, s3
                  sltu         tp, a3, a2
                  fcvt.wu.s    a5, ft8, rtz
                  mul          a4, t4, s7
                  lui          a4, 1018157
                  xori         t4, s4, 168
                  fle.s        s6, ft2, fs11
                  fcvt.s.w     fs7, a2, rdn
                  fsgnj.s      fs11, fs6, ft1
                  ori          s5, zero, 1908
                  div          s11, a2, gp
                  fclass.s     gp, ft0
                  or           a4, a6, ra
                  fcvt.wu.s    a7, fs6, rne
                  ori          gp, s6, -1867
                  xori         a7, sp, 1955
                  andi         s8, s4, -1440
                  fcvt.s.wu    fa6, s5, rdn
                  sll          s9, s7, t5
                  fcvt.s.wu    ft8, s1, rup
                  srli         tp, a4, 27
                  rem          t3, s4, s5
                  feq.s        s11, fa3, fa2
                  ori          a7, s11, 346
                  remu         s7, t3, s4
                  slti         s5, a2, -1811
                  lui          sp, 187556
                  rem          a6, a7, a7
                  sub          a0, s7, t1
                  auipc        a1, 198069
                  lui          s4, 1044311
                  nop
                  div          a3, s6, s11
                  fdiv.s       ft11, fa0, fs11
                  fle.s        a4, fs11, ft8
                  flt.s        s4, fs11, fa4
                  div          zero, s6, s6
                  fmv.x.w      zero, ft11
                  fsgnjn.s     fa2, fa3, fs3
                  sltiu        a3, a4, 1631
                  fmv.w.x      ft1, s6
                  fsgnjn.s     fs0, fs4, fs8
                  add          tp, a7, a3
                  auipc        s6, 663787
                  srl          a5, s5, a3
                  sltiu        t1, gp, -1630
                  fmv.w.x      fs3, a7
                  flt.s        a0, ft3, ft6
                  auipc        a0, 864535
                  or           tp, a5, t1
                  mulhsu       a6, s6, gp
                  fsub.s       fa2, fs11, fa7
                  andi         sp, t5, -885
                  andi         s5, s3, 1959
                  fdiv.s       ft7, ft2, fs1, rup
                  fle.s        s10, fs4, ft8
                  srli         gp, sp, 8
                  fcvt.s.w     ft8, ra, rne
                  xor          t6, s0, s8
                  fsub.s       fs1, fs10, fs4
                  flt.s        s4, ft8, fs8
                  fsqrt.s      ft4, ft6, rmm
                  fmin.s       fs3, fa2, ft11
                  slti         a4, t4, -317
                  fsgnjn.s     fa0, fa1, ft4
                  slt          a5, s5, ra
                  sub          t6, s11, s9
                  divu         s5, s9, s0
                  fadd.s       fs4, fa2, ft10, rne
                  addi         a6, t6, -774
                  slli         a4, a6, 13
                  ori          ra, t0, -1263
                  fcvt.s.w     fa7, t3, rmm
                  andi         a3, s6, 842
                  fclass.s     gp, fa3
                  or           ra, a2, s1
                  fmv.x.w      s8, fs9
                  fsgnj.s      ft1, ft3, fs11
                  mulhu        a0, t1, t1
                  fsgnj.s      ft5, ft3, fs0
                  addi         tp, t3, -1839
                  ori          t4, s5, -2046
                  remu         s3, a7, a0
                  divu         s11, s1, s5
                  auipc        s10, 569380
                  mulhu        t6, s9, gp
                  mulh         a3, zero, s10
                  and          s3, sp, a6
                  flt.s        sp, fa2, ft11
                  add          s7, t6, t4
                  sub          gp, s6, s10
                  fsqrt.s      fs3, fa3
                  add          a7, t1, s3
                  fcvt.w.s     a4, fa0, rup
                  mulhsu       zero, sp, a4
                  or           a4, gp, a0
                  add          s5, t6, t0
                  mulhsu       s1, a5, s9
                  fmv.x.w      s6, ft8
                  sltiu        t0, gp, -633
                  fmv.x.w      s4, fa5
                  fcvt.w.s     a3, fs6, rtz
                  xori         s11, a7, -314
                  fsgnjx.s     fa7, ft5, fs2
                  fadd.s       ft4, ft1, ft0, rmm
                  rem          a7, s0, t6
                  fadd.s       fa7, fs4, fa3
                  sltu         a6, tp, s7
                  fmv.x.w      a5, fs0
                  andi         ra, s5, 544
                  xor          a1, t1, s10
                  fdiv.s       fa7, ft8, ft11, rmm
                  fsgnjx.s     fs6, fa0, fa1
                  xor          a4, a1, s11
                  sra          t3, s1, t0
                  sll          ra, a7, zero
                  fmv.w.x      ft8, ra
                  fsub.s       fs9, ft0, fa4, rdn
                  mul          a6, s11, t2
                  remu         a7, a7, s2
                  fclass.s     sp, fs0
                  srli         ra, s4, 16
                  fmul.s       fs5, fa7, fs10, rne
                  srl          t4, s4, gp
                  fdiv.s       ft5, ft0, fa1, rtz
                  fcvt.s.wu    ft8, s0, rmm
                  fmul.s       fs10, ft0, fa5
                  slti         a0, a1, -61
                  nop
                  fcvt.s.w     fs6, a7
                  sltu         t2, t0, ra
                  addi         s3, a6, -1851
                  fadd.s       fs0, fa0, ft6
                  slti         t3, a0, 1533
                  srl          a7, s3, t2
                  srl          t2, a0, gp
                  sltu         t2, t6, s0
                  ori          gp, t6, -321
                  andi         t3, s0, 1528
                  add          a4, s3, t2
                  fmax.s       fa6, fs4, ft1
                  nop
                  fsgnj.s      fs7, ft8, fa2
                  slli         t1, s4, 11
                  fsgnjn.s     fs7, fs6, fs4
                  sltiu        a0, a5, -981
                  sub          t1, s10, a4
                  auipc        s7, 148032
                  rem          t0, sp, t3
                  auipc        zero, 777821
                  flt.s        a0, fs4, ft6
                  flt.s        a3, ft1, fa6
                  fclass.s     a7, fs9
                  fclass.s     s10, fa1
                  slt          a7, s5, a0
                  fmv.w.x      fa7, a2
                  remu         s1, t4, s2
                  xori         t3, s1, -462
                  srl          a3, s1, s1
                  fadd.s       fs10, ft6, ft8
                  mulhsu       s11, a0, t1
                  nop
                  andi         s5, t0, 1772
                  sltiu        a4, t0, -112
                  fdiv.s       fs0, fa6, ft2, rmm
                  xor          s4, s10, zero
                  slti         t3, s7, -557
                  fmv.w.x      fs5, t2
                  fsgnjn.s     fa0, fa5, ft0
                  sra          a3, s0, a7
                  nop
                  fcvt.s.wu    fs1, s2, rmm
                  fcvt.wu.s    s11, fs7
                  addi         s8, t5, 1988
                  slli         s3, s0, 27
                  divu         s0, a0, s5
                  fadd.s       fa3, fs6, fa0
                  srai         ra, s7, 16
                  srl          a3, s3, s2
                  fcvt.s.wu    ft2, a1, rmm
                  remu         sp, sp, tp
                  fsub.s       fs5, fs4, fs5, rne
                  fcvt.s.w     fa6, s1
                  fcvt.wu.s    s5, fs11
                  mulhu        a3, s1, a7
                  fmv.x.w      zero, ft8
                  andi         tp, a4, -1991
                  mulh         s1, t4, t3
                  fsgnjn.s     fs1, ft4, fa2
                  remu         a0, s9, s11
                  divu         s3, a5, s5
                  srli         t4, a3, 9
                  divu         t0, s6, s5
                  fsub.s       fs1, ft1, ft7
                  auipc        s4, 395470
                  fsgnjn.s     ft7, ft6, ft3
                  nop
                  div          zero, gp, t4
                  auipc        a1, 523166
                  remu         a5, s0, a6
                  sll          t6, a0, t6
                  flt.s        s8, fs6, fs1
                  fmv.w.x      fs10, a0
                  fcvt.s.w     ft4, s3
                  mulhu        s5, a3, a0
                  or           t0, ra, s1
                  div          s0, sp, s10
                  mulh         s7, s6, a2
                  nop
                  sll          a0, s10, zero
                  addi         s10, s1, 776
                  sltiu        gp, s1, -317
                  xor          s3, s6, tp
                  rem          t0, t1, s0
                  sub          t1, s3, a1
                  feq.s        t4, ft2, ft11
                  remu         a1, a7, t0
                  rem          a4, a5, gp
                  sltu         s0, s6, t4
                  mul          s7, a6, ra
                  fmin.s       ft6, fa3, ft2
                  andi         s9, s4, 1840
                  fsgnj.s      ft6, ft0, fa5
                  rem          s10, s0, t1
                  fsgnjn.s     ft8, fa7, fa7
                  mulhu        s6, s1, s3
                  andi         s6, a6, 1997
                  divu         s4, s10, a6
                  slt          zero, s0, s7
                  slli         s10, s6, 10
                  sll          s4, t0, ra
                  mulh         s9, ra, a7
                  ori          s7, sp, -1558
                  fmul.s       ft7, ft4, ft5
                  xor          a1, s5, tp
                  auipc        t0, 317340
                  fclass.s     s9, ft10
                  xori         s7, a1, -1493
                  slt          sp, t5, s6
                  mul          s10, a2, a3
                  sra          t1, sp, s4
                  fsqrt.s      ft5, ft9
                  sltiu        s0, a6, 1639
                  fsgnjx.s     fs6, ft1, ft10
                  fsqrt.s      fs1, fs5, rmm
                  fadd.s       ft0, fa2, fs6, rup
                  andi         t4, t2, 1917
                  fmv.w.x      ft10, t0
                  ori          sp, s0, 484
                  sra          a0, tp, s3
                  fmul.s       ft10, fs3, fs7
                  fcvt.s.w     fa7, s1, rup
                  andi         s7, s10, -1400
                  fdiv.s       ft2, fa5, fs1
                  or           t3, sp, s11
                  divu         a4, zero, zero
                  fcvt.s.w     fs4, s7, rup
                  sra          s11, gp, s0
                  fmv.x.w      zero, ft3
                  sltiu        t0, s0, -1492
                  fle.s        t4, fs1, ft5
                  div          s1, s7, ra
                  lui          s5, 201213
                  or           tp, a0, t0
                  or           a7, a1, t5
                  fcvt.s.wu    fs6, s3, rtz
                  srli         s7, a0, 1
                  remu         s11, s11, s10
                  sltu         t6, t5, s9
                  fsgnj.s      fs0, fa3, fa6
                  xori         a7, t0, 230
                  add          t4, s5, a3
                  fmv.x.w      t2, fa6
                  nop
                  lui          s10, 610182
                  xori         s3, s11, -1112
                  srai         s8, zero, 16
                  sra          a5, zero, zero
                  fdiv.s       fs2, fa3, fa6, rne
                  fsqrt.s      fs0, fs6, rtz
                  fcvt.wu.s    a5, fs4, rne
                  ori          s3, a6, -348
                  fdiv.s       fs5, fs8, fa6
                  mul          s8, t6, s10
                  divu         s1, s4, t6
                  fsqrt.s      ft3, fs10, rne
                  divu         gp, s0, t0
                  fmv.x.w      a6, fs3
                  fsgnjx.s     ft1, fa2, fs9
                  fcvt.w.s     s8, ft5, rdn
                  fmv.x.w      t6, fa4
                  fsgnjx.s     fs8, ft1, fs8
                  fcvt.wu.s    t4, ft3
                  fmax.s       fa0, fa5, fs8
                  rem          a1, t0, s2
                  andi         s8, s4, -1978
                  fcvt.w.s     a3, ft0, rdn
                  fsqrt.s      fs7, fa1, rdn
                  fmv.w.x      ft7, a2
                  mulh         t0, s2, zero
                  srli         a7, t1, 21
                  slt          t0, zero, s0
                  sltiu        s4, s0, -632
                  fsqrt.s      fs0, fs8
                  xor          s1, a1, s7
                  fsub.s       fs7, fs11, fs7, rmm
                  auipc        s10, 957598
                  remu         t3, t3, s8
                  slli         a4, a2, 18
                  slti         s10, t1, 1151
                  add          s1, s4, s6
                  mulhu        s10, t2, a6
                  mul          s11, t5, s11
                  fadd.s       ft3, ft9, fs2
                  srai         s10, s10, 8
                  srli         a1, a4, 27
                  xori         s7, ra, 1834
                  ori          t2, a2, 925
                  fclass.s     t6, fa6
                  andi         a6, a3, 1040
                  sub          t4, a0, a4
                  mul          t2, t5, ra
                  divu         s7, s1, ra
                  srli         sp, a0, 24
                  feq.s        gp, fa3, fs10
                  srl          sp, sp, s1
                  fdiv.s       fs11, fs3, fs11
                  mulh         s1, a3, s6
                  lui          a3, 130519
                  xori         a7, t5, 1943
                  auipc        s4, 338644
                  mul          s3, t5, s2
                  mulhsu       s0, s1, a4
                  fmv.w.x      ft2, a6
                  rem          s7, t0, gp
                  sra          a3, a4, a6
                  fcvt.w.s     s7, fs7
                  fcvt.s.w     ft2, a3, rtz
                  sll          a5, t2, t5
                  feq.s        s7, fa5, ft0
                  sra          gp, a1, t3
                  sltu         s8, t0, a0
                  div          s3, s8, s10
                  slti         a5, t1, -1991
                  srli         a6, s6, 31
                  sltu         a4, a2, a7
                  and          s0, s6, s6
                  fcvt.wu.s    s10, ft1, rne
                  fadd.s       fs10, fa0, ft3, rup
                  fmin.s       ft9, fs7, fa4
                  sll          gp, s1, a0
                  fsgnj.s      ft3, fa6, ft0
                  ori          s9, s0, 739
                  fcvt.w.s     a7, fs0, rup
                  fmax.s       fa4, fs7, ft3
                  add          gp, s11, tp
                  fsgnjn.s     ft8, fs6, ft2
                  andi         s11, t6, -1031
                  slli         a1, s9, 8
                  fclass.s     s8, ft7
                  addi         s11, s1, 989
                  sra          t1, t0, t5
                  feq.s        sp, fs2, ft2
                  feq.s        t4, ft9, fa7
                  fcvt.s.wu    ft2, sp
                  fsub.s       fs0, fs9, fs11, rtz
                  div          s0, t5, s8
                  fmul.s       ft0, ft6, fs1, rne
                  xor          t2, sp, s10
                  fmv.x.w      a7, fa0
                  andi         zero, t5, -796
                  fclass.s     s10, fs0
                  fmax.s       fs0, fs3, fs7
                  fsqrt.s      ft6, fa0, rdn
                  flt.s        s10, fs11, fs9
                  fcvt.s.wu    fa4, s0
                  srl          a4, t2, s6
                  fdiv.s       fs10, fa2, fs2
                  fcvt.s.wu    fs0, a7, rdn
                  or           t3, s7, sp
                  fdiv.s       fs10, fs9, ft7, rtz
                  sltiu        t2, s11, 991
                  mulh         a1, t1, a1
                  fclass.s     t3, ft10
                  fmax.s       fa0, ft3, fs9
                  div          s6, t6, a5
                  fsqrt.s      fs2, fa6
                  fcvt.w.s     t2, ft6
                  fcvt.wu.s    a6, fa3, rne
                  fle.s        ra, fs4, fa5
                  fadd.s       fs5, ft10, fs5
                  mulh         a1, a6, a5
                  fmul.s       ft4, fa3, fs7
                  fcvt.wu.s    a3, fa4
                  feq.s        s7, fs1, fs5
                  sub          s11, s7, a7
                  fsub.s       fa7, fs1, fs8
                  xor          t3, s0, t2
                  auipc        s9, 585810
                  mulh         s11, s4, t0
                  fadd.s       fs3, ft7, ft11
                  div          s8, t0, s1
                  fcvt.w.s     t0, fs4
                  slli         t3, t1, 21
                  sll          s5, t0, s3
                  slti         s9, s10, 463
                  addi         t2, a3, -1546
                  mulhsu       a7, a5, a7
                  flt.s        a4, ft10, fa6
                  fsub.s       fa7, fs0, fs7, rmm
                  and          s9, t2, sp
                  fcvt.w.s     tp, fa4
                  div          s5, s7, s3
                  slli         s5, s6, 12
                  divu         a4, t3, a7
                  fmul.s       ft3, ft6, ft8
                  andi         t1, s8, 1915
                  and          s8, s2, s11
                  mulh         s5, s0, sp
                  ori          a6, t0, 283
                  xori         zero, s3, -665
                  sltiu        ra, a3, -1545
                  nop
                  fmul.s       ft9, ft0, fs4
                  ori          s8, s4, 1724
                  fcvt.s.wu    fs3, a0
                  sll          a0, t4, s10
                  xor          t2, s5, sp
                  slt          s9, s2, tp
                  sub          t1, a0, s7
                  sltu         s8, s4, t3
                  fmul.s       fa2, ft9, ft0, rne
                  div          a6, t4, s0
                  fsgnjn.s     ft5, ft5, ft6
                  remu         t2, zero, s11
                  andi         s9, a3, 176
                  fsub.s       fs6, fs0, fs6
                  fmax.s       ft7, ft3, fa0
                  xor          s4, tp, sp
                  and          s5, s6, t2
                  mulhsu       a0, s0, tp
                  div          a0, a3, t3
                  slli         a3, a4, 18
                  xori         s5, s10, -944
                  divu         zero, gp, s10
                  srli         s4, a2, 7
                  lui          s5, 823159
                  fcvt.s.w     fs3, t0, rne
                  fclass.s     t0, ft7
                  fmul.s       fs9, fs11, ft8, rne
                  mulhsu       a1, t5, s0
                  slli         a5, a0, 21
                  add          s9, t1, t1
                  fsgnjn.s     fa6, fs3, ft3
                  fclass.s     gp, ft3
                  slli         s10, s10, 28
                  and          t2, t0, t6
                  fmv.x.w      a6, ft6
                  sra          s0, t0, a0
                  andi         t6, s8, -1540
                  remu         t0, s3, t2
                  mulhsu       t2, a5, gp
                  auipc        s6, 5258
                  divu         t6, tp, s5
                  fcvt.s.w     fs10, t6, rne
                  fclass.s     s1, fa4
                  divu         s10, gp, a4
                  fcvt.s.w     ft7, t6
                  sra          a5, s0, a6
                  andi         tp, t4, -117
                  nop
                  fmv.w.x      ft5, a3
                  mulhu        a1, s10, s8
                  slli         a0, s10, 7
                  fsgnj.s      fa1, fs7, fa2
                  nop
                  sltu         zero, s3, t3
                  mulhsu       t3, t4, a7
                  mul          a4, s11, a5
                  fcvt.s.wu    fa3, a0
                  addi         t4, t2, -749
                  lui          t0, 60269
                  rem          s0, a6, t2
                  sltu         a3, a0, s0
                  slli         s1, t0, 19
                  nop
                  xori         s5, a1, 561
                  fcvt.s.wu    ft3, t6, rmm
                  remu         s0, t5, a1
                  fmin.s       fs3, fa6, ft11
                  fmv.w.x      fa5, sp
                  srai         t6, t5, 27
                  mulhsu       a1, s8, a4
                  srai         t0, s11, 25
                  slti         s4, s7, -1084
                  fsqrt.s      fs11, fs11, rmm
                  slli         a5, t4, 3
                  fclass.s     ra, fs5
                  auipc        s1, 729330
                  slli         s10, s4, 27
                  sub          t1, a4, t3
                  srai         s9, s7, 5
                  srli         ra, t6, 12
                  fsgnj.s      fa4, ft7, ft9
                  lui          sp, 229563
                  fmv.x.w      t3, fs0
                  divu         s4, a5, sp
                  div          a7, s8, t2
                  fmv.w.x      fs11, a2
                  divu         t2, gp, a1
                  add          gp, t0, s11
                  srl          sp, s5, a4
                  divu         s10, a6, ra
                  fadd.s       ft1, ft10, ft8, rup
                  rem          s8, t3, s6
                  div          t2, s0, a0
                  fcvt.s.w     ft1, s9
                  fsqrt.s      fs1, fs5
                  fsgnj.s      ft5, fs3, fs0
                  fsqrt.s      fa6, fs6
                  mulhsu       s5, t5, s6
                  fsgnjx.s     ft0, fa4, fs4
                  fclass.s     s1, ft2
                  fadd.s       ft9, ft10, fs10
                  fle.s        s6, ft11, fs5
                  sll          s0, zero, a4
                  and          a1, t1, a1
                  mulhu        s11, a0, s7
                  fsub.s       ft4, fa2, fa3, rdn
                  fcvt.s.w     fs3, t4, rup
                  fsgnj.s      fs7, ft5, ft1
                  or           t1, a4, s11
                  fmv.x.w      a7, ft2
                  fadd.s       ft7, fa5, ft7, rtz
                  srl          t6, s1, t5
                  andi         s9, s10, -420
                  auipc        a3, 477596
                  mulhu        s3, a6, gp
                  sub          s5, s10, s3
                  div          zero, zero, s6
                  fmax.s       fs2, ft10, fa0
                  or           a1, a5, t0
                  add          t0, s1, gp
                  fadd.s       ft2, fs7, fs8
                  fsgnj.s      fs1, ft5, fs3
                  fle.s        s3, ft6, ft8
                  sll          t1, a7, a1
                  slli         s10, s2, 22
                  sltu         t3, tp, t4
                  or           sp, s8, a2
                  fsgnjn.s     ft8, ft6, fs10
                  fmv.w.x      fa2, ra
                  flt.s        t6, fa6, ft7
                  ori          t1, s10, -863
                  and          s7, s11, ra
                  fmax.s       fs11, ft11, fs5
                  xori         s10, s11, -1134
                  mulhsu       s7, gp, t6
                  div          s1, s11, s9
                  srl          a1, t5, t0
                  fcvt.s.w     fs1, a1, rdn
                  fcvt.w.s     t4, fs0, rup
                  add          t0, t6, s6
                  fsgnj.s      ft4, fs6, fs5
                  fadd.s       ft1, fa2, fs3
                  fcvt.w.s     s7, ft6, rne
                  fcvt.wu.s    t2, ft7
                  andi         zero, a3, -576
                  slt          s3, s10, s0
                  fmin.s       ft1, fs0, fa1
                  auipc        t6, 779244
                  fsgnjn.s     fa7, ft4, fs8
                  feq.s        t1, ft10, ft11
                  slti         s6, s4, 1525
                  auipc        s3, 471817
                  slli         zero, sp, 31
                  fadd.s       ft11, fa0, ft10, rtz
                  srli         s1, s2, 17
                  fdiv.s       ft9, ft6, fa4
                  auipc        s7, 1000068
                  nop
                  sll          t3, s4, gp
                  mul          a5, a6, t2
                  fsqrt.s      ft5, fa0, rup
                  nop
                  fmin.s       ft9, fs10, fa7
                  div          tp, s0, s11
                  fcvt.s.wu    fs0, s4
                  fcvt.w.s     s1, fs9
                  fcvt.w.s     tp, fs4
                  fadd.s       ft5, fs0, ft9, rmm
                  addi         t4, a5, 1806
                  rem          s9, a4, gp
                  auipc        a0, 643890
                  addi         a7, a4, 1792
                  srai         t1, t1, 28
                  sltiu        s1, s1, -1172
                  sltiu        ra, s1, -184
                  srai         tp, ra, 6
                  fsgnjn.s     fa7, fs11, fs7
                  and          t4, a1, ra
                  fle.s        s11, fa2, fs2
                  sra          t0, t3, s2
                  fsqrt.s      ft5, ft5
                  mul          s9, a4, a0
                  fle.s        gp, ft8, fa0
                  fcvt.s.wu    fs11, s4, rtz
                  fsgnjn.s     fs1, fs4, fs3
                  fcvt.s.wu    ft6, tp
                  fclass.s     sp, fs2
                  sltu         s4, s2, t2
                  div          gp, s5, t0
                  fmv.w.x      ft2, t5
                  xori         t1, t6, -578
                  nop
                  srli         zero, t1, 21
                  nop
                  fadd.s       ft4, ft11, ft5
                  fsgnjn.s     ft3, ft11, fs8
                  fmin.s       fa1, fa0, fs1
                  fmul.s       ft6, ft8, fa5, rdn
                  fsub.s       ft4, fa2, fs5
                  andi         s3, a7, 139
                  feq.s        t1, ft2, ft1
                  fmv.x.w      gp, fa4
                  fcvt.s.wu    fa6, a1
                  fcvt.w.s     t3, fs0, rne
                  sltiu        a5, gp, 1580
                  slli         s4, a0, 28
                  addi         a4, zero, 821
                  mulh         s0, a1, s0
                  srl          s5, t1, a1
                  fsgnjn.s     ft4, fa5, ft8
                  lui          a1, 428621
                  srli         s6, t0, 11
                  fsub.s       ft0, fa4, fs1
                  andi         ra, a2, 1992
                  fmv.w.x      fa7, t6
                  mulh         a0, tp, t2
                  fle.s        a3, fs7, fs5
                  mulhsu       t6, tp, t6
                  fclass.s     a4, ft5
                  fsgnj.s      fa1, ft5, fa0
                  mulhsu       s0, a7, s1
                  and          s8, a1, gp
                  sra          s10, s2, a3
                  add          s5, s7, a0
                  feq.s        a7, fs0, fs9
                  srli         a3, ra, 19
                  feq.s        a5, fs3, fs9
                  srli         s8, s11, 26
                  xori         t2, sp, 232
                  fmv.w.x      fs2, ra
                  fmul.s       fs2, fs6, fs2
                  srl          a5, a4, s3
                  and          a7, a6, s5
                  xor          s0, s3, a0
                  sltu         s9, zero, s10
                  fsgnj.s      fs1, fs7, fs1
                  fclass.s     gp, fs8
                  addi         s9, s9, 698
                  fadd.s       fs3, fs7, fs8, rmm
                  mulh         a0, s5, s3
                  slt          a3, a7, a2
                  and          a5, a2, s6
                  srai         sp, a6, 19
                  slt          s9, a0, s11
                  divu         s6, a0, s0
                  or           s6, a2, s1
                  auipc        t0, 13531
                  nop
                  and          a7, a0, s10
                  auipc        ra, 480563
                  mulhu        s6, sp, sp
                  fcvt.wu.s    s4, fa6, rup
                  fmin.s       fa6, fa6, fs7
                  addi         s3, s7, 1384
                  and          s9, s11, s4
                  slti         zero, a3, -763
                  sra          ra, sp, s0
                  slti         s0, a5, 1219
                  srai         t6, t5, 15
                  lui          s4, 224123
                  or           t1, a2, a1
                  andi         s11, a2, 1025
                  srai         a1, s3, 12
                  flt.s        a3, ft6, fs4
                  sub          a3, s7, s3
                  lui          a4, 321078
                  fclass.s     sp, fa6
                  srai         s6, a4, 27
                  mulh         s6, a3, t0
                  divu         t0, s3, s4
                  fclass.s     tp, ft3
                  xori         zero, t4, -2026
                  fmv.x.w      s5, fs9
                  srai         a0, s4, 13
                  fmax.s       ft11, fs1, fs5
                  lui          a3, 968934
                  sltiu        a3, s2, -708
                  and          t6, tp, a6
                  sra          a5, t4, t0
                  or           a7, zero, s2
                  fmul.s       ft7, fs6, ft2, rne
                  feq.s        a3, ft8, fa4
                  add          tp, tp, s9
                  fcvt.w.s     s7, fs6, rne
                  feq.s        a5, fs11, fa7
                  sll          sp, t6, a5
                  mulh         t2, s5, a6
                  fdiv.s       fa4, ft9, fs11
                  fcvt.wu.s    a7, fa1
                  sra          a3, ra, s9
                  fle.s        s11, fs4, ft3
                  fsgnjn.s     ft4, ft7, fs11
                  xor          s5, t1, s4
                  fmax.s       fa5, fs7, fs7
                  fsub.s       fs6, fa6, ft3
                  sltu         a5, s2, a2
                  mulhsu       a3, t0, s3
                  fmax.s       fs6, fa4, fs1
                  fsgnjn.s     fs0, fa6, ft11
                  remu         s4, t3, a1
                  fcvt.wu.s    s8, ft4
                  fmv.x.w      s6, ft11
                  feq.s        t4, fs9, fs1
                  mulhu        a0, a4, s8
                  mulhu        a7, ra, s0
                  fadd.s       ft8, fa3, fs1
                  fadd.s       ft0, ft1, fs11
                  fdiv.s       ft8, fs5, ft1, rdn
                  slti         s5, s10, 1374
                  or           a7, a5, a3
                  fadd.s       fa1, fa2, fs6
                  mulhsu       a6, s7, sp
                  andi         s8, s9, 839
                  fsgnjx.s     fs5, fa5, ft0
                  slti         ra, a1, 350
                  add          t6, s1, a7
                  mulh         tp, s9, s10
                  remu         s4, a5, s11
                  mul          a3, a3, a0
                  feq.s        t4, fs2, fa4
                  fadd.s       fa0, ft4, ft11
                  slti         ra, tp, -656
                  add          t2, a2, t5
                  feq.s        sp, ft2, ft2
                  auipc        ra, 264425
                  fmv.x.w      sp, ft0
                  srai         a4, a6, 31
                  remu         a6, s11, a2
                  fle.s        zero, fa5, fs11
                  sra          t3, t6, tp
                  srl          tp, a0, t6
                  rem          s1, s6, s3
                  xori         s1, t5, 1425
                  srai         s10, s0, 16
                  fmin.s       fs6, fs10, fa4
                  add          s0, tp, s7
                  slli         s4, s4, 8
                  fadd.s       fa4, fa2, fs5
                  fsgnjn.s     fs4, fs3, fa3
                  sra          ra, a4, tp
                  fsgnj.s      ft4, fa4, ft0
                  sltu         zero, t0, s5
                  andi         s9, a7, 1264
                  fsgnjn.s     fa2, fa2, ft2
                  fcvt.s.w     fa4, a0, rdn
                  xori         s9, tp, -1321
                  sltu         s4, a3, s3
                  fclass.s     s4, fs5
                  and          zero, zero, t1
                  andi         t6, s5, 103
                  sub          ra, s1, a0
                  fclass.s     s1, fa6
                  slli         s0, sp, 1
                  fmv.x.w      a7, ft5
                  mulhu        t1, a6, s2
                  fmax.s       fa2, fs3, fs3
                  srli         s6, s9, 1
                  fmin.s       fs0, fa2, fs3
                  mulhu        t6, t2, a4
                  sll          s7, a4, a1
                  fsqrt.s      fa5, fa5, rne
                  fmv.x.w      s3, fs1
                  fsgnjx.s     fs5, ft7, fs9
                  fsgnj.s      fs8, fs2, fs0
                  flt.s        a0, ft3, fa6
                  divu         a4, a4, a2
                  sltu         a1, a5, sp
                  fmul.s       fs9, fs8, ft7, rup
                  fdiv.s       ft10, fs9, fs10
                  slli         sp, a6, 11
                  fclass.s     t0, fa2
                  flt.s        a1, fs9, fa2
                  div          s1, s5, t3
                  fmax.s       fs6, fs0, fs8
                  feq.s        a6, ft3, fs3
                  auipc        a3, 26203
                  srl          gp, s1, t1
                  flt.s        t4, fs3, ft9
                  sltiu        s4, ra, 1963
                  fcvt.s.wu    ft2, s10, rtz
                  fclass.s     a3, fa5
                  sub          a5, a0, s9
                  fcvt.s.wu    fs9, t6, rmm
                  fcvt.s.w     fs0, a3
                  divu         t6, t5, t5
                  srl          t0, s1, a3
                  sra          t3, t1, s6
                  sub          s0, s4, s3
                  flt.s        t1, fs0, fa4
                  fdiv.s       ft0, fa4, fs4, rup
                  slt          ra, s8, sp
                  fmin.s       fs1, fs2, ft10
                  divu         sp, t1, zero
                  sltu         a4, s9, s8
                  srli         sp, s11, 10
                  fmin.s       fa7, fs8, ft1
                  fmv.x.w      t6, ft11
                  fsgnjn.s     fa4, fs1, fa7
                  mul          sp, a3, t2
                  and          a3, t4, t2
                  mulh         s11, t6, s7
                  rem          a7, a2, s7
                  flt.s        s0, ft1, fa5
                  remu         s5, a5, s4
                  and          sp, a6, gp
                  xori         a3, a1, -539
                  sub          a0, s7, s0
                  fmin.s       ft1, fs4, fs6
                  ori          gp, gp, -82
                  andi         t4, ra, -39
                  sra          s3, ra, a5
                  slti         tp, gp, 1119
                  fclass.s     s5, ft8
                  fclass.s     s5, ft11
                  divu         a6, s6, s7
                  fsgnjx.s     ft7, fs2, ft4
                  feq.s        t4, fs3, fs10
                  slt          t2, zero, s1
                  flt.s        s0, fs8, ft7
                  sltu         s1, t3, a4
                  sltu         s8, t1, t6
                  fcvt.s.w     fa3, s9
                  fadd.s       ft11, ft9, ft0
                  xori         s3, t1, -1684
                  mulh         tp, s11, s4
                  fle.s        s10, fa6, fs6
                  fsgnj.s      fs1, ft0, fs5
                  fcvt.wu.s    a4, ft9
                  addi         zero, s0, -1376
                  fmin.s       fa7, fs2, fs0
                  fsub.s       fs5, fa0, ft11, rne
                  fcvt.s.w     fs4, t1
                  sltiu        tp, t4, 1233
                  fsgnjx.s     ft3, fs5, fs1
                  srli         s0, s3, 26
                  fclass.s     a7, fs5
                  fcvt.wu.s    s5, ft1, rmm
                  sra          s9, s11, s6
                  divu         a5, tp, zero
                  fmv.x.w      t1, ft4
                  nop
                  remu         t2, s9, a1
                  fmul.s       fs3, fs4, fs6
                  add          t1, s3, ra
                  slli         gp, a0, 25
                  fmv.x.w      a4, fa4
                  xor          t2, t6, a0
                  mul          a1, a2, t0
                  fcvt.wu.s    s7, fa2, rdn
                  remu         s3, a7, s8
                  fadd.s       ft11, fa7, ft1
                  fsgnj.s      fs6, fa1, fs0
                  flt.s        gp, fs4, fa0
                  srli         s4, a7, 24
                  and          gp, a4, t0
                  or           t1, t4, a2
                  divu         a3, a7, s5
                  fcvt.wu.s    s5, ft10
                  and          a6, a2, a5
                  andi         t2, tp, -577
                  xor          s8, s8, a4
                  div          s8, a3, a1
                  fsgnjx.s     fs6, ft0, ft0
                  fdiv.s       fs8, fs3, ft2
                  mulhsu       a6, t3, a0
                  fdiv.s       fs8, fa0, fa0, rmm
                  sll          t1, a5, t1
                  sltu         s8, a3, t3
                  or           gp, t5, sp
                  sub          t4, s6, a3
                  mulhsu       a7, s7, a2
                  mulhsu       a0, s10, s11
                  fclass.s     a6, ft10
                  fmul.s       ft8, ft6, fs8, rne
                  ori          s1, s1, 1147
                  or           a3, t1, ra
                  fcvt.w.s     tp, fs11, rup
                  and          a4, t2, a6
                  fdiv.s       ft10, fa5, fa6
                  slli         gp, tp, 19
                  ori          s4, s0, 1599
                  fmv.w.x      fs8, a3
                  fsgnjx.s     fs10, fs10, ft2
                  srli         s5, s10, 12
                  fmin.s       fs8, ft5, ft2
                  fcvt.w.s     s0, ft1, rdn
                  fcvt.s.w     fs5, a2
                  fdiv.s       ft3, fs3, fs6
                  sltu         s10, s6, a5
                  rem          s11, a7, s6
                  sltiu        s5, s9, -1569
                  sltiu        s1, a0, 1073
                  xori         a7, a6, -1261
                  rem          t2, t6, tp
                  slt          t3, s8, t5
                  slti         tp, t0, -1283
                  sll          t2, a6, s8
                  fsgnjn.s     ft6, fs4, ft10
                  fcvt.s.wu    fa5, t6
                  fmin.s       fa6, ft8, ft10
                  srl          t3, t6, s2
                  fle.s        s6, ft10, fa1
                  fmin.s       ft7, fa4, fa6
                  fadd.s       fa1, ft5, ft3, rne
                  div          s8, t2, s4
                  add          ra, a5, a7
                  fmin.s       fa6, fs8, ft7
                  fadd.s       fs2, fs11, fs8, rmm
                  fmax.s       fs7, fs1, ft5
                  feq.s        a7, ft7, fa1
                  fmul.s       fa2, fs2, ft5, rmm
                  fle.s        a7, fa0, fs6
                  add          ra, tp, t1
                  fmin.s       fa7, ft6, fs4
                  sll          a0, t1, a2
                  srai         s7, s7, 16
                  fmax.s       ft6, ft2, fs9
                  fsgnj.s      fs6, fs5, fa5
                  fdiv.s       fs2, ft10, ft6
                  sltiu        tp, s1, 750
                  srl          a4, a2, a7
                  ori          a1, s5, 1407
                  fsub.s       ft0, fs11, fa3, rne
                  xor          s4, t4, t5
                  fcvt.w.s     zero, fs5
                  fsub.s       fs3, ft0, fa1, rtz
                  fsgnjx.s     fs8, ft11, ft6
                  fsub.s       ft3, fs11, fa0, rup
                  sll          s0, s8, ra
                  srli         s11, s1, 25
                  rem          a5, s3, s11
                  fcvt.s.wu    fs6, t1
                  mulh         a7, s1, a7
                  andi         s0, a2, -1761
                  fsqrt.s      fs8, fa5, rmm
                  divu         ra, t2, t0
                  flt.s        a7, ft10, fa6
                  slti         ra, s1, -1576
                  fcvt.s.wu    fs11, t4
                  xori         t6, a7, 186
                  ori          a3, s0, 1689
                  div          gp, t5, s2
                  fmv.w.x      fs1, t0
                  fle.s        a1, fa1, ft6
                  fcvt.w.s     s5, fa3
                  div          gp, tp, sp
                  flt.s        a7, ft7, fs6
                  srli         a3, a4, 11
                  fmin.s       fa5, fs5, ft7
                  fsub.s       ft1, ft8, fs2
                  sltu         a1, s6, t5
                  feq.s        s7, ft6, fa7
                  fle.s        s5, fa6, fa6
                  feq.s        t4, ft11, fa2
                  and          s7, s8, s1
                  fmv.w.x      fa1, a1
                  slt          t6, t2, a2
                  sll          a5, a1, a1
                  mulhsu       t6, s5, t3
                  or           t2, a2, t5
                  add          s11, s0, a5
                  ori          s4, a4, 1012
                  srl          s5, zero, zero
                  slt          s7, s3, t1
                  sub          s7, s5, s6
                  fclass.s     s10, fa5
                  remu         tp, s9, s2
                  fcvt.s.wu    fa7, a0, rmm
                  srli         s10, a4, 16
                  and          gp, s0, s1
                  fsqrt.s      ft9, fs8
                  sub          t0, s8, a6
                  and          t2, a2, s11
                  ori          a7, a2, -304
                  fcvt.w.s     a0, ft8
                  remu         s7, a1, a7
                  andi         t0, s9, -960
                  fsub.s       ft2, fa3, fs3
                  fmv.x.w      t3, fs5
                  ori          s10, t6, -1033
                  or           s6, s1, s1
                  fmax.s       ft1, fa7, fa4
                  feq.s        t3, ft4, fs9
                  lui          s5, 840880
                  remu         s8, s4, a3
                  fmul.s       fs11, fs1, fs4, rne
                  sltu         s0, a5, t3
                  flt.s        s10, ft4, ft10
                  xori         a6, t2, 365
                  fcvt.wu.s    a6, fa1
                  fcvt.s.w     fs0, t3, rtz
                  fcvt.wu.s    t1, fs10, rdn
                  srli         tp, t6, 9
                  fclass.s     s9, fs2
                  lui          ra, 207890
                  fmv.x.w      s1, fs1
                  flt.s        gp, fa4, ft8
                  fmin.s       ft1, fs1, fa2
                  fmv.x.w      s10, fs11
                  fadd.s       fa4, ft9, fa1, rmm
                  fcvt.s.wu    fs8, s1, rdn
                  div          a4, a2, a7
                  and          s6, t3, a3
                  nop
                  rem          s10, s5, a5
                  slli         s7, zero, 25
                  feq.s        a5, ft6, fs4
                  sub          tp, s5, ra
                  divu         s3, s10, ra
                  lui          t3, 375479
                  xori         t3, s10, -1304
                  fadd.s       fa6, fa3, fa5, rdn
                  andi         t1, s0, -1895
                  and          a0, gp, ra
                  sltiu        s7, t4, -1746
                  div          a3, a3, t0
                  add          a0, t1, a1
                  ori          a5, s1, -821
                  feq.s        s4, ft8, fs0
                  fadd.s       fs8, ft0, fs4
                  fadd.s       fs9, fa4, fs7
                  fmin.s       fs6, ft3, fa1
                  srli         t0, s4, 2
                  sltu         sp, a3, s10
                  fcvt.s.w     fa3, s3, rne
                  xor          a1, s8, a7
                  slli         t0, s0, 0
                  fmax.s       ft0, fa3, ft8
                  srl          gp, t6, s8
                  divu         a4, s7, tp
                  lui          a1, 660355
                  srl          s9, t3, a3
                  sub          t3, s2, s6
                  auipc        a5, 883813
                  fmin.s       fs9, ft11, fs1
                  div          t1, s2, s11
                  slti         ra, s1, -644
                  sra          t2, a5, s0
                  fsub.s       fs9, ft4, ft3
                  sra          a3, s0, tp
                  fcvt.wu.s    s10, fs0, rup
                  xori         sp, s2, 580
                  addi         a6, s9, -1448
                  fsgnjx.s     fa2, fs5, fs5
                  add          a7, s10, a7
                  and          a1, s3, zero
                  add          s10, gp, s6
                  fcvt.s.wu    fs4, t3, rtz
                  sltu         t2, s4, a1
                  fcvt.s.wu    ft3, t5
                  sltiu        t3, a5, 1529
                  fmv.x.w      s3, fa6
                  auipc        s11, 159489
                  fmul.s       fs10, fs2, ft4, rdn
                  sltiu        ra, t1, -81
                  fcvt.w.s     a1, ft7, rdn
                  fclass.s     s10, fa6
                  lui          t2, 141991
                  fdiv.s       fs8, fs11, fa3
                  and          a0, s6, s5
                  andi         a7, s3, 1993
                  sltu         a6, zero, a6
                  fmv.w.x      ft9, a7
                  sub          s0, s5, a6
                  addi         a0, a3, 1146
                  fmv.x.w      s10, fs4
                  fsgnj.s      ft9, ft9, ft9
                  xor          a7, a6, s0
                  lui          s4, 408443
                  feq.s        s8, ft0, ft0
                  srai         s4, t1, 6
                  fdiv.s       ft2, ft10, fs6, rdn
                  mul          s0, a0, s8
                  flt.s        s10, fs11, fs2
                  sltiu        zero, t2, 1114
                  sll          s8, a0, s3
                  auipc        s11, 166572
                  and          t3, s5, a5
                  fcvt.s.wu    fs8, zero, rmm
                  fcvt.s.w     ft3, ra, rdn
                  fmv.w.x      ft4, s2
                  srai         t3, s3, 9
                  fmv.x.w      t2, fs5
                  fmv.x.w      s9, ft8
                  fcvt.w.s     gp, fa3, rne
                  fle.s        sp, fs4, fa3
                  fmax.s       ft5, ft3, ft9
                  flt.s        gp, ft9, ft6
                  add          s4, a0, t5
                  xori         a5, zero, 577
                  nop
                  fdiv.s       ft4, fa0, fa2
                  auipc        s6, 49718
                  fcvt.wu.s    s10, ft0, rmm
                  mulhu        s1, t0, s2
                  fmv.x.w      a4, fs9
                  nop
                  fmin.s       fs1, fs11, ft8
                  fadd.s       ft1, fa5, fa6
                  sltiu        t0, s1, 383
                  slli         s1, a1, 1
                  srai         s5, t5, 22
                  rem          s5, a7, s8
                  remu         a7, s5, t4
                  xori         a1, s4, -1084
                  divu         s0, zero, a5
                  sltiu        gp, tp, 1641
                  flt.s        s10, ft9, fa2
                  auipc        a6, 825679
                  fmul.s       fs4, ft8, fa1
                  fcvt.s.w     fa4, ra, rup
                  fadd.s       fa2, fa0, ft6, rne
                  fsgnjn.s     ft5, ft3, fa0
                  slti         sp, s9, 1455
                  mulhsu       s10, s6, s3
                  sltu         s6, t2, a2
                  fsub.s       ft5, ft4, fa0, rdn
                  andi         s5, s9, 765
                  fsgnjx.s     fa4, fs11, fs9
                  fsgnj.s      fs6, fa1, ft0
                  div          s5, zero, a7
                  rem          t0, a0, s6
                  fmv.w.x      fa6, s3
                  addi         t4, s1, -214
                  fcvt.s.w     fs6, s1, rtz
                  andi         s0, ra, 27
                  fcvt.s.w     ft10, s8
                  mulhsu       ra, a6, t6
                  fsgnjn.s     ft3, fs5, fs2
                  feq.s        t6, fa4, fs9
                  or           zero, s0, a4
                  slli         s10, s7, 12
                  mulhsu       s5, s8, s10
                  fsgnjn.s     fa7, ft3, fa4
                  fcvt.s.wu    ft7, gp, rtz
                  fle.s        t3, fs9, ft7
                  srli         tp, s11, 1
                  sub          a6, s9, a2
                  fcvt.s.w     ft6, gp, rne
                  fsgnj.s      fs0, ft0, ft5
                  slli         s8, t0, 27
                  sltiu        a6, a7, -362
                  fadd.s       fs1, ft8, fa6
                  mul          s3, s2, s4
                  sub          s4, s5, s10
                  fmul.s       fa4, fs0, fs2, rup
                  fsqrt.s      fs7, ft0, rmm
                  srai         t1, s10, 23
                  nop
                  fdiv.s       fa2, fa2, ft7
                  ori          t4, a2, 1632
                  fmv.w.x      fs4, s3
                  mulhsu       s6, s10, a6
                  rem          s5, s2, t1
                  mulh         s10, ra, t3
                  srl          gp, gp, s0
                  fmax.s       ft11, ft3, ft1
                  fcvt.w.s     t4, fs5
                  or           a6, gp, s2
                  flt.s        s9, ft2, fs10
                  srai         zero, a5, 23
                  fcvt.s.w     fa6, t2
                  fcvt.w.s     a1, fs2
                  fsgnj.s      fa5, fa7, fs3
                  sub          a0, a5, s7
                  mul          ra, s5, t0
                  fmv.w.x      fs1, gp
                  fmv.x.w      a1, ft6
                  fmax.s       ft0, ft0, fa1
                  auipc        s11, 693864
                  sll          t6, s5, a7
                  sra          a6, gp, t4
                  fcvt.s.w     fa7, t5, rmm
                  remu         a7, s1, s9
                  fsgnjn.s     fs2, fs9, fs7
                  slt          a1, a3, a5
                  fsgnjn.s     fa1, ft7, fa1
                  sub          t1, zero, a4
                  fcvt.wu.s    t4, fs4, rdn
                  fmin.s       fs5, ft10, fs11
                  fmv.w.x      fa6, a4
                  fsqrt.s      fa5, fs7
                  remu         t0, ra, zero
                  fsqrt.s      fa2, fs2
                  fcvt.s.wu    fa3, t1
                  fmv.w.x      fa6, s5
                  remu         s3, s10, t5
                  and          s4, s10, t2
                  fmul.s       fa7, fs9, ft8, rdn
                  slli         a4, s6, 9
                  srl          gp, s6, s8
                  nop
                  nop
                  add          ra, s8, a1
                  fcvt.s.wu    fs0, s6, rne
                  andi         s7, a7, -1131
                  sltu         s4, t1, a0
                  feq.s        t1, fs2, fa2
                  fcvt.s.w     fa4, t4
                  xor          ra, t0, ra
                  divu         t1, a3, s4
                  lui          a3, 697720
                  fsub.s       ft10, ft1, fs3, rne
                  fdiv.s       fa0, fs0, ft1
                  or           zero, t0, a4
                  divu         t1, t6, a2
                  fmin.s       fs0, fs9, fs2
                  fcvt.s.wu    fs1, s11
                  add          t3, a2, t5
                  fclass.s     s8, fa2
                  fcvt.s.wu    fs4, s6, rmm
                  fmin.s       fa5, fs2, fs4
                  sub          a7, t1, t5
                  sltu         a7, s1, zero
                  or           a6, t0, ra
                  flt.s        a5, fs7, ft11
                  div          a4, gp, t4
                  fsgnj.s      fs3, fs8, fs5
                  andi         s10, a2, -81
                  or           s11, s9, zero
                  nop
                  add          t3, a7, a7
                  nop
                  fcvt.s.w     fa7, s9, rdn
                  fmv.x.w      a1, fs5
                  mulhsu       a4, s2, tp
                  mulh         t2, tp, a5
                  nop
                  sra          t1, s6, s10
                  fmv.x.w      tp, fs2
                  auipc        s4, 279752
                  fcvt.w.s     a3, fs9, rmm
                  sltu         gp, s7, s3
                  andi         s4, a6, -2024
                  rem          s8, gp, s10
                  fcvt.wu.s    t3, fs1, rmm
                  fcvt.s.w     fa3, s2
                  lui          a7, 236354
                  srl          s1, t5, t0
                  slt          s1, t5, s3
                  fsqrt.s      ft4, ft0
                  sltu         s4, a0, t1
                  nop
                  fsgnjx.s     fs0, fa1, ft4
                  andi         t3, s5, 1580
                  remu         s5, t2, s0
                  fmul.s       fs10, ft5, fa0
                  fsqrt.s      ft6, fs7, rmm
                  fcvt.wu.s    s7, fa1, rup
                  fcvt.wu.s    a4, fa1, rne
                  mul          a3, zero, a1
                  mul          zero, a3, s9
                  fcvt.s.wu    ft0, s4, rmm
                  srai         ra, a3, 16
                  xori         a4, s8, -537
                  mulhsu       a5, a3, a0
                  fcvt.s.w     ft4, s3, rup
                  slli         a1, t4, 14
                  flt.s        s0, ft3, ft10
                  andi         t1, s7, -1465
                  fclass.s     gp, fa6
                  fdiv.s       ft10, fs1, ft7
                  srai         ra, s5, 14
                  fsgnjn.s     ft2, fa6, fa0
                  remu         a1, s1, s10
                  ori          s9, s4, 1928
                  xor          t0, s10, gp
                  fcvt.s.wu    fs0, s4
                  feq.s        a0, fa5, fs11
                  sub          gp, s9, s1
                  fsgnjn.s     ft4, ft10, fs9
                  fsgnjx.s     ft1, fa4, ft5
                  xori         a7, a1, -1685
                  or           a7, s10, s1
                  or           a4, a5, a6
                  fcvt.s.wu    fs2, s2
                  fmv.x.w      s4, fs11
                  flt.s        s6, ft7, ft1
                  sltu         a5, ra, tp
                  slti         tp, gp, 401
                  fsgnjn.s     fa3, fs11, fs11
                  fsgnjn.s     fa5, ft11, ft8
                  xori         s10, a0, -208
                  fmv.x.w      a3, fs1
                  fsub.s       fs7, ft2, fa2
                  fsgnjx.s     ft0, ft2, ft0
                  fle.s        a7, fs1, fs6
                  addi         s7, s6, -1948
                  srai         s4, zero, 3
                  fmax.s       fa0, ft10, fs9
                  fmv.x.w      a4, ft3
                  lui          t4, 677880
                  nop
                  fcvt.s.wu    ft9, t0
                  fclass.s     t2, fa1
                  mulh         a7, s9, t3
                  slti         s10, s0, 2020
                  fsgnjn.s     fa2, fa4, fa2
                  mulhsu       s11, sp, s3
                  remu         a1, t0, ra
                  fmin.s       ft10, fa6, fs5
                  fmul.s       fa1, ft2, fs11, rne
                  fadd.s       fa5, fa0, ft10
                  fsgnjx.s     fa7, fs3, fs6
                  slli         s1, s4, 15
                  slt          s9, t5, s9
                  slli         s7, s1, 7
                  fle.s        a3, fs7, fs6
                  divu         s3, s9, a1
                  fmv.x.w      a0, ft3
                  flt.s        s1, ft3, ft1
                  slti         sp, t0, 820
                  feq.s        ra, fa3, fa3
                  fmv.w.x      fa7, sp
                  fcvt.s.wu    fs6, s7, rup
                  fmv.w.x      ft11, a2
                  mul          t2, gp, s3
                  fsqrt.s      fa3, fs10, rtz
                  fclass.s     s4, ft2
                  divu         ra, s4, a7
                  xori         s7, s5, 519
                  srl          a6, tp, a6
                  fclass.s     gp, fs0
                  srli         a0, a7, 11
                  mulh         a6, a5, s6
                  fle.s        a4, fa3, fs3
                  fclass.s     t6, fa5
                  fsgnjx.s     ft4, ft4, ft9
                  fadd.s       ft4, ft3, fs8, rdn
                  div          s7, s6, sp
                  flt.s        gp, fs1, ft1
                  slt          s5, zero, a6
                  xor          t2, a1, s1
                  fclass.s     t3, ft11
                  andi         s11, s8, 1449
                  add          a1, s0, s11
                  add          s11, ra, s3
                  fsgnjn.s     fa7, fs9, fs11
                  fclass.s     a4, ft1
                  fmv.x.w      s5, ft5
                  and          a3, s1, s2
                  sra          a1, t3, s5
                  fdiv.s       fs1, ft7, ft0
                  mul          s9, s0, tp
                  srli         zero, s7, 22
                  fmv.x.w      s8, fs2
                  slti         a6, s2, -7
                  fclass.s     zero, ft5
                  fsqrt.s      fa1, fa5
                  sra          s10, sp, gp
                  fcvt.s.w     ft7, s2, rne
                  fsub.s       ft10, fs11, ft9
                  mulhu        s10, s4, s7
                  andi         t1, tp, -1385
                  slti         zero, sp, -264
                  mulh         tp, s11, a7
                  sub          s4, a5, s9
                  fmul.s       ft1, fs6, fs0
                  rem          zero, a4, t6
                  mulhsu       sp, s3, ra
                  div          s0, a1, s9
                  feq.s        t6, fa7, ft11
                  fclass.s     ra, fa5
                  fsgnj.s      fa5, fs7, ft9
                  fmv.w.x      fa4, sp
                  fsqrt.s      fs7, fa7
                  srai         s5, sp, 23
                  fsgnjx.s     ft2, fs1, fa2
                  sltu         s10, t2, s3
                  rem          a7, s7, t2
                  divu         t4, t6, t0
                  mulhu        t3, ra, s0
                  fmul.s       fa0, fs10, ft6, rmm
                  fmin.s       fs1, fs10, fs4
                  fcvt.wu.s    a4, ft8, rup
                  srli         t6, s3, 28
                  slt          t1, a4, a7
                  flt.s        s6, fs4, fa3
                  or           s8, t2, t0
                  fle.s        zero, fa7, ft11
                  or           s4, a2, a7
                  feq.s        zero, ft3, fs1
                  add          a0, a1, s5
                  fsub.s       ft9, fa3, ft10
                  rem          a3, a5, s11
                  slti         s0, s5, 60
                  flt.s        a5, ft4, ft7
                  xori         zero, tp, -1807
                  slt          ra, s3, s5
                  fcvt.wu.s    tp, fa4, rtz
                  slt          s1, ra, t5
                  sltiu        t6, s3, 646
                  fcvt.w.s     s7, fs6
                  nop
                  fcvt.s.w     fa6, s0, rtz
                  sltu         t6, sp, s1
                  slli         s11, t0, 8
                  fmul.s       fs10, ft4, fa4
                  srai         a4, a2, 2
                  mulh         s10, gp, s9
                  andi         s0, s10, -742
                  fle.s        s9, fs4, fs10
                  remu         s11, s11, t2
                  div          t1, a2, t2
                  fle.s        s10, fs10, fa1
                  xor          tp, s5, t5
                  mulh         a4, a6, a4
                  fcvt.wu.s    s11, ft5, rup
                  xori         s7, s10, 1461
                  mul          s6, zero, a6
                  fmin.s       ft7, ft4, fa7
                  fclass.s     s9, fs0
                  remu         t6, t4, t3
                  xor          s11, a1, t0
                  slti         s9, t4, 1485
                  fcvt.w.s     t4, ft0
                  slt          s4, s6, s4
                  fcvt.wu.s    s5, fa3, rne
                  lui          sp, 631712
                  fdiv.s       fa7, ft7, fa5, rup
                  div          t6, tp, t3
                  fadd.s       ft4, fs3, ft0
                  fsqrt.s      fs1, fa3
                  fclass.s     t3, ft6
                  addi         s10, gp, -664
                  fmin.s       fa7, ft11, ft4
                  nop
                  auipc        sp, 692109
                  andi         s10, s0, -2041
                  andi         s0, s9, 392
                  fsgnjx.s     fs7, fa7, ft0
                  div          a5, s9, a2
                  rem          t3, s10, s6
                  slli         t6, a5, 19
                  sltu         t2, a2, s0
                  fmv.w.x      fa1, t5
                  fcvt.s.w     fs1, t2, rne
                  xori         a5, a6, 2044
                  ori          ra, a6, 1790
                  fcvt.s.wu    ft0, s6, rup
                  srli         s9, s8, 24
                  fmul.s       ft0, ft7, fs9, rmm
                  fle.s        sp, ft10, fs2
                  fmin.s       fs1, fa2, fa6
                  remu         s8, s4, s3
                  ori          s3, t5, -55
                  sltiu        s4, t1, 255
                  sll          s6, a2, gp
                  xor          s8, s4, a7
                  fcvt.wu.s    t2, fs5
                  fdiv.s       fs10, ft9, fs5
                  fle.s        t4, ft8, fa0
                  srl          ra, sp, s3
                  fcvt.s.w     ft6, a0
                  andi         s10, gp, 76
                  div          t3, sp, s10
                  fcvt.w.s     sp, fs7, rtz
                  fmul.s       fs7, ft5, fs8
                  fsgnj.s      fs1, fa1, ft4
                  fdiv.s       fs4, ft11, fs11, rtz
                  slti         ra, a7, 1501
                  and          s0, s11, a1
                  and          a0, a4, a2
                  fsgnjx.s     fs10, ft5, fs7
                  fmin.s       ft11, fa6, ft7
                  fadd.s       fs1, fa0, ft5
                  xori         s7, tp, -287
                  lui          t3, 334302
                  fclass.s     t6, ft5
                  auipc        a4, 937845
                  andi         zero, t5, -387
                  divu         s10, zero, s7
                  feq.s        s4, ft0, fs4
                  fmul.s       ft9, fs11, fs6
                  div          s8, t6, tp
                  flt.s        s9, fa1, fs5
                  sra          s6, s4, sp
                  addi         a5, a5, -1798
                  fsgnjx.s     ft3, fa7, fa1
                  fcvt.s.wu    ft11, s0, rup
                  ori          a7, a5, -1943
                  mul          a0, s7, t4
                  div          a5, s1, a0
                  mulh         t2, a0, s7
                  mulhu        a1, s10, t3
                  fcvt.w.s     t0, fs7, rmm
                  ori          a3, s9, -480
                  slti         a0, zero, -1654
                  feq.s        ra, ft8, ft0
                  fcvt.w.s     s11, ft5, rne
                  fmv.x.w      a6, fa3
                  sll          s7, a7, s4
                  nop
                  add          s4, t6, s4
                  fsgnjx.s     fa4, fa7, fs4
                  sltiu        s6, ra, 1298
                  and          s5, a2, s6
                  fle.s        a3, fs3, fs8
                  fcvt.s.w     fa5, s6
                  slli         s11, t4, 29
                  sltiu        s1, a1, 1082
                  or           sp, s4, s9
                  sub          a1, s7, s3
                  slli         a4, t2, 23
                  fmv.w.x      fs11, sp
                  sltu         t0, s9, t6
                  fmul.s       ft2, fs3, fs2, rup
                  divu         s6, s9, t0
                  slli         s1, s1, 20
                  fmul.s       fs1, fs9, ft4, rup
                  ori          a0, t5, -131
                  lui          a7, 188524
                  mul          tp, a5, t0
                  fsub.s       fs9, fs5, fa3, rmm
                  mulh         tp, gp, s0
                  mulhu        s1, s10, t6
                  flt.s        a0, fa3, ft6
                  srli         s11, a6, 17
                  fdiv.s       fa4, fs7, ft9
                  div          t4, s7, zero
                  fmin.s       ft4, fs10, fs0
                  fmv.w.x      ft9, a4
                  fsgnjn.s     fs3, fs0, ft5
                  fadd.s       fa2, ft5, ft0
                  addi         s1, t1, -1070
                  sub          a5, t4, a1
                  slti         t6, s1, -2012
                  xor          ra, s10, ra
                  fsgnj.s      ft2, fa1, fs4
                  div          t4, s4, a0
                  slti         s3, s6, -1047
                  sltu         s11, s3, t2
                  xori         a6, t2, -538
                  and          s5, t3, t1
                  fsub.s       ft10, ft2, fa0
                  fadd.s       fs2, ft11, ft1, rne
                  sltu         sp, s11, s5
                  fcvt.s.wu    fs5, s6, rdn
                  fcvt.s.wu    fa7, s8, rne
                  lui          s8, 953266
                  sll          s0, t1, t1
                  fsub.s       ft8, ft9, fs8
                  fdiv.s       ft10, ft2, ft11, rmm
                  sltiu        s7, s5, -1522
                  fmv.w.x      fs2, s7
                  fcvt.s.wu    fs5, s11, rup
                  fadd.s       fs11, fs10, fa0
                  sltiu        a3, s4, 303
                  srai         t4, s7, 7
                  remu         s0, zero, t6
                  divu         t3, zero, a7
                  xor          s10, ra, t4
                  slt          s10, s0, s1
                  fcvt.w.s     a5, fs8, rne
                  fadd.s       fs11, fa5, fa7, rmm
                  slt          s11, a5, t3
                  slli         s5, tp, 11
                  xor          s3, s8, t0
                  fmax.s       ft1, fa1, fs8
                  remu         s3, s8, a7
                  fcvt.wu.s    a3, ft9
                  sltiu        s11, s11, 610
                  and          s10, a7, s7
                  feq.s        s9, ft8, ft0
                  fmul.s       ft4, ft7, ft6
                  fcvt.wu.s    gp, ft4, rne
                  fmax.s       ft8, fs3, fa4
                  mulhu        a6, gp, t2
                  fmin.s       ft8, fa4, ft11
                  fsub.s       ft4, fs3, fs6, rne
                  lui          gp, 840262
                  fcvt.s.wu    fs5, s7, rtz
                  fdiv.s       fa4, fs5, fa7, rmm
                  fle.s        zero, fs4, fs6
                  fmv.w.x      ft9, s4
                  sll          s10, a2, s2
                  fmul.s       fs8, fa5, ft11, rup
                  fmv.w.x      ft6, t5
                  fclass.s     t3, ft0
                  sra          a1, a7, t6
                  fcvt.wu.s    s4, ft9, rtz
                  xor          t3, ra, gp
                  srli         s10, a1, 9
                  slli         s7, t6, 9
                  fsqrt.s      ft9, fa0, rne
                  sub          s1, s9, t1
                  andi         t2, s9, 551
                  fmv.w.x      fa7, t2
                  rem          sp, s0, s6
                  andi         a7, a6, 530
                  or           t1, s5, a0
                  fmin.s       fs8, fs8, fa7
                  slti         t4, a3, 621
                  fsgnjn.s     fa7, ft3, fs3
                  divu         a3, s8, s9
                  slti         tp, t6, -1482
                  fcvt.s.w     ft11, a6, rne
                  sra          s1, sp, s5
                  fsub.s       fa6, fa3, fa2, rmm
                  or           s9, s4, s6
                  sra          a4, tp, t2
                  srli         tp, a4, 7
                  srl          a5, zero, a1
                  remu         s10, s6, a6
                  fsgnj.s      fa2, ft3, fa0
                  srli         t3, zero, 7
                  fcvt.w.s     t6, ft11
                  fdiv.s       ft0, ft10, fa3
                  fdiv.s       fa4, ft0, fa3, rmm
                  srl          s5, t5, a4
                  xori         s10, t2, -423
                  auipc        a7, 677062
                  fle.s        s6, fs8, ft5
                  rem          ra, a0, t3
                  fsgnj.s      ft9, fa3, ft1
                  fsgnjn.s     fs10, fs5, fs10
                  add          a0, t6, s7
                  xor          a5, s0, t3
                  andi         t6, gp, -954
                  xori         s10, s2, 718
                  rem          s0, t4, gp
                  addi         a5, s6, -1588
                  sltiu        s3, s1, 138
                  srli         a4, tp, 24
                  slti         t4, s5, 1028
                  fsub.s       ft4, fs5, fs2
                  andi         s0, s7, 964
                  fsgnjx.s     fs8, fs10, fa0
                  fcvt.wu.s    s4, ft0, rne
                  slti         t1, s4, 536
                  slt          t1, s11, a6
                  fmin.s       fa4, fa2, ft9
                  fsgnjx.s     ft9, fa7, fs3
                  sll          gp, t6, s10
                  slt          a0, t5, gp
                  srli         t4, a4, 22
                  fadd.s       fs7, fa0, ft1, rne
                  slli         t6, s1, 9
                  slt          s8, s2, t5
                  fcvt.w.s     a0, ft8
                  or           s9, s11, s5
                  mul          ra, t0, a7
                  remu         s6, s6, s2
                  fmv.x.w      s4, fa2
                  div          s6, a6, t5
                  xor          s8, ra, a2
                  sltiu        a3, t4, 215
                  fclass.s     t6, fs8
                  fadd.s       ft1, fs4, ft0
                  sub          a6, s11, s5
                  srli         a1, ra, 19
                  fsgnjx.s     ft4, fa1, fa7
                  fcvt.wu.s    s0, fa4
                  fmul.s       fa7, ft4, fs4
                  mulhsu       a5, s0, s5
                  lui          a7, 966069
                  fadd.s       fs6, fs10, ft10
                  xor          t4, a4, a1
                  add          a4, t1, t2
                  ori          s10, s4, 1363
                  fmax.s       ft10, fa1, fa1
                  fsgnjn.s     ft11, fa5, fs11
                  remu         ra, s7, s1
                  xor          s1, a0, sp
                  xor          t2, a4, gp
                  fdiv.s       fa0, fa7, ft3, rup
                  fsgnj.s      fa1, fs9, ft5
                  ori          s3, ra, -1887
                  remu         a4, ra, a3
                  fcvt.w.s     zero, fs7
                  flt.s        s3, ft11, fa0
                  flt.s        zero, ft6, fs9
                  sll          s0, s3, a6
                  fmv.w.x      ft3, a1
                  fcvt.w.s     s8, fs2, rmm
                  fsub.s       ft8, fs11, fs1
                  divu         s8, a6, a6
                  slli         t2, gp, 7
                  fmv.w.x      fs7, ra
                  fcvt.s.wu    fa5, t6, rne
                  remu         t2, s4, a4
                  fcvt.s.w     fa2, a0
                  fclass.s     a3, fs1
                  mulhu        a0, a5, a2
                  add          a6, s8, s0
                  auipc        a6, 1039885
                  slt          s9, s10, s10
                  fsgnj.s      fs9, fa0, ft5
                  lui          s3, 993052
                  srl          a7, a5, t5
                  fmax.s       fa4, fa5, fa6
                  slti         a6, tp, -972
                  fclass.s     s5, fs7
                  slt          tp, t3, s9
                  feq.s        a1, fa2, fa5
                  fmul.s       fa2, ft9, fs5
                  sltu         s9, t2, s7
                  sll          zero, sp, a2
                  fle.s        t6, fs8, fs10
                  nop
                  fcvt.s.w     fs0, a6, rne
                  fcvt.wu.s    ra, fs4
                  addi         a6, t1, -1883
                  fmin.s       ft9, ft0, fs3
                  fsqrt.s      ft4, ft7
                  sll          s1, s0, a2
                  fcvt.wu.s    tp, fs6
                  fcvt.wu.s    s4, fs1, rdn
                  fmv.x.w      sp, ft6
                  divu         t4, s4, t6
                  xor          s10, a3, a0
                  fmv.x.w      s3, ft6
                  fdiv.s       ft6, fa1, fs5, rdn
                  sub          s4, a5, a0
                  srl          t4, a6, s1
                  fadd.s       fs9, fs11, fa5
                  fmin.s       fa7, ft6, ft1
                  slli         a4, t5, 2
                  fmv.w.x      ft2, s6
                  mulhu        ra, t4, t2
                  and          s0, a7, t4
                  slt          ra, t3, s2
                  fsgnj.s      ft4, ft7, ft1
                  remu         t2, a0, gp
                  fsgnjx.s     ft3, fs4, fs1
                  mulh         t1, a2, t4
                  fclass.s     ra, fa6
                  mulhu        a1, a3, t0
                  add          s7, s1, t5
                  fsgnjx.s     fa1, fa2, fs7
                  srl          a7, s2, a1
                  fmv.x.w      a7, fs6
                  addi         s4, a7, 63
                  fmax.s       ft1, ft4, ft4
                  flt.s        t3, ft2, ft2
                  fmax.s       fa2, fs5, ft2
                  xori         gp, a0, -1082
                  flt.s        s11, ft6, ft1
                  xori         a4, a0, -1281
                  addi         s6, t3, -223
                  fmin.s       ft0, fa2, fs2
                  srl          t2, t0, t0
                  fmul.s       ft0, ft8, fa3, rtz
                  srl          tp, s10, gp
                  ori          s0, s1, -851
                  sltiu        s3, s8, 947
                  fle.s        t6, fa1, fs1
                  fcvt.s.w     fs2, t1
                  fsgnj.s      ft8, fa2, ft3
                  fcvt.s.wu    fa7, t2
                  sltu         s3, a4, s1
                  or           a5, s7, a2
                  mulh         s7, a7, ra
                  fadd.s       ft10, fs5, fa3
                  sltiu        a6, a0, 950
                  fsub.s       ft3, ft9, fs2, rdn
                  fcvt.s.wu    fa4, t4
                  fadd.s       fa0, fa4, ft10, rtz
                  fsgnjn.s     ft2, fs5, fs4
                  fcvt.s.wu    fs2, t4, rtz
                  sra          t0, t1, t4
                  fcvt.wu.s    a6, fa1, rmm
                  fsqrt.s      fa5, fs1
                  fsgnjn.s     fs7, ft7, fa7
                  or           s5, zero, gp
                  sltu         a0, s9, s9
                  fmv.w.x      ft7, s2
                  fsub.s       fa1, fs5, fs9
                  sltu         s5, s2, s0
                  fclass.s     s0, ft9
                  flt.s        s9, fa5, fa7
                  fcvt.w.s     a5, ft10
                  fcvt.w.s     t4, fa0, rup
                  or           s8, s4, a0
                  auipc        sp, 422845
                  sub          s10, a0, tp
                  fadd.s       fs7, fs11, fs4
                  sll          a6, s11, s0
                  fcvt.w.s     s5, fs10
                  srl          a0, s2, t4
                  and          t0, s9, s8
                  slli         s1, t1, 14
                  mulh         a5, a6, ra
                  mulhu        t3, s3, s11
                  slti         s6, s8, -697
                  divu         sp, s6, gp
                  flt.s        s8, ft9, fa0
                  sub          t4, t4, s11
                  fcvt.w.s     s10, fa5, rne
                  add          s1, a7, a4
                  fclass.s     s3, fs0
                  xor          gp, s8, t1
                  sltiu        t4, sp, -1801
                  fmv.x.w      zero, ft10
                  remu         s4, a2, t5
                  sll          t0, s1, s8
                  add          ra, gp, sp
                  flt.s        s6, fs8, fa2
                  fdiv.s       ft5, fs5, fs10, rne
                  slt          sp, s10, t5
                  slt          s10, a3, a5
                  rem          gp, s11, sp
                  srli         s0, s2, 23
                  srli         t1, zero, 27
                  srli         a5, a1, 3
                  sltiu        s11, sp, 887
                  fcvt.s.w     fa7, t2
                  fmv.x.w      s5, fa0
                  slli         s10, s9, 14
                  sub          s11, s7, a0
                  nop
                  fcvt.wu.s    a0, fa2
                  slli         sp, s9, 12
                  fcvt.w.s     a3, ft0, rmm
                  fle.s        s0, ft10, ft1
                  fsub.s       fs2, ft6, ft10
                  srl          t6, s0, a0
                  fcvt.wu.s    t2, fs10
                  srai         s1, s11, 8
                  divu         s0, sp, a0
                  fle.s        sp, fa6, ft2
                  fcvt.wu.s    t4, fs11
                  fle.s        t3, ft4, ft5
                  fsgnjn.s     fs3, fs6, fa2
                  fsgnjn.s     fa5, fs11, ft6
                  fsgnjn.s     ft1, fa2, fa3
                  ori          a0, t0, -1669
                  fmax.s       fa0, fs2, ft5
                  srai         s1, t0, 12
                  fcvt.s.wu    fs9, t2
                  ori          a0, a0, -1571
                  fcvt.w.s     a1, fa4, rmm
                  fmv.x.w      s0, ft4
                  ori          t2, s3, 705
                  srli         t1, t0, 12
                  mul          t1, s10, sp
                  auipc        a0, 269267
                  or           s1, s11, zero
                  mulhu        s8, a4, a4
                  sra          t3, t1, t6
                  add          t0, a0, t5
                  fsub.s       fs11, fs4, ft2
                  fcvt.wu.s    s10, fs8
                  fdiv.s       fs2, fs11, fs11, rdn
                  fsgnj.s      fa2, fa3, ft1
                  fmv.w.x      ft4, a6
                  slli         tp, t6, 26
                  fsgnjn.s     fs3, ft3, ft7
                  fdiv.s       ft5, fs6, fa7, rtz
                  fsgnjx.s     ft2, fs6, ft1
                  fsqrt.s      fa7, ft5
                  fsgnjx.s     ft3, ft11, fa2
                  addi         tp, t4, -1874
                  mulh         s7, s9, a7
                  auipc        tp, 993869
                  fmax.s       fa7, fs3, fs9
                  lui          a6, 56312
                  fdiv.s       ft4, fa3, ft4, rtz
                  mulh         s0, s4, s10
                  auipc        s7, 383316
                  fcvt.s.w     fa6, s3, rup
                  divu         sp, a6, s7
                  slti         a0, zero, -384
                  lui          s6, 286199
                  add          a1, s3, t6
                  srai         t4, t0, 30
                  addi         s1, gp, 1453
                  add          t4, s11, ra
                  div          a7, tp, t1
                  slli         a3, t5, 15
                  fdiv.s       ft2, ft2, fs7
                  remu         s7, a7, t6
                  andi         a3, a6, -1633
                  sub          tp, a7, a2
                  slt          s4, s10, s11
                  xor          a3, a5, ra
                  srli         t2, a4, 8
                  mulh         s3, s4, t5
                  rem          s1, s8, t4
                  slli         t3, s0, 13
                  add          sp, t5, a4
                  add          s3, a0, t0
                  remu         t4, zero, t5
                  fmin.s       fa4, fs9, ft11
                  slt          a1, gp, s5
                  fcvt.w.s     s5, fs7
                  sltu         s11, a3, s1
                  slt          gp, gp, a7
                  fmv.w.x      fs8, s4
                  flt.s        t3, fa5, ft4
                  fsgnjn.s     ft0, fs1, fs9
                  flt.s        a1, ft8, ft6
                  sltu         s10, a6, sp
                  mulhu        s8, s2, t3
                  mulhsu       s8, s11, s11
                  mulhsu       gp, ra, s2
                  fadd.s       fa2, fa6, fa3
                  fmin.s       ft7, ft11, fa6
                  fle.s        t6, fa7, ft1
                  auipc        a5, 31666
                  nop
                  mulhu        gp, s4, a4
                  sltu         tp, t0, a3
                  xor          t4, sp, a6
                  sltu         t0, t4, a2
                  addi         s9, t6, -1901
                  fclass.s     a0, fa3
                  mulhu        s1, t4, a2
                  xor          a0, t4, t6
                  fle.s        tp, ft10, fs11
                  or           s3, a2, t6
                  fcvt.w.s     a5, fs0
                  fsgnj.s      fa5, fs1, fa5
                  mulhsu       s6, t0, a5
                  slti         s0, t6, 1343
                  addi         s3, s10, -1396
                  fmv.x.w      s10, fs9
                  srli         zero, gp, 9
                  slli         a1, sp, 18
                  div          t2, s11, a2
                  flt.s        tp, ft9, ft3
                  lui          s5, 284775
                  div          t1, s10, s11
                  sll          gp, t5, t2
                  sub          zero, zero, s8
                  xor          a0, a0, s7
                  slti         a6, s7, 1785
                  fcvt.s.wu    ft1, a3
                  fmv.w.x      ft9, s1
                  fle.s        s6, ft7, fs6
                  fmv.w.x      ft11, s3
                  slt          s5, s6, t5
                  fsub.s       ft11, fa7, ft0
                  fclass.s     a5, ft0
                  mulhu        t6, ra, s9
                  remu         s5, s2, s8
                  sub          s8, a3, gp
                  fdiv.s       fs5, fa1, fs11
                  mulh         a1, t4, s0
                  sub          s3, s11, s5
                  slli         t0, s3, 19
                  sub          a6, s3, tp
                  sltu         s4, t5, t5
                  slli         a7, t0, 23
                  fsub.s       ft0, ft1, ft0, rmm
                  sub          zero, a7, s6
                  nop
                  or           ra, a3, t6
                  fclass.s     t0, fa7
                  fmul.s       ft2, ft10, fa4
                  fcvt.w.s     s3, fs11, rdn
                  remu         s11, tp, sp
                  xori         t1, s0, -374
                  feq.s        tp, ft3, ft8
                  fclass.s     t6, fa3
                  fcvt.s.w     fa1, s2
                  addi         sp, a3, -61
                  sra          t3, a7, a5
                  fsgnjx.s     ft9, ft8, fs10
                  addi         t2, s7, -2037
                  lui          s7, 266313
                  fmv.w.x      fs10, zero
                  sub          s0, zero, t5
                  fcvt.s.wu    fa1, s1
                  and          s9, sp, gp
                  remu         tp, s6, a1
                  sltu         s7, s8, s5
                  fclass.s     t4, fs8
                  fcvt.s.w     ft4, a7
                  lui          s7, 255969
                  fsgnj.s      ft9, ft9, fs5
                  fsqrt.s      ft2, fa1, rdn
                  divu         s10, s2, t4
                  andi         sp, t5, 1361
                  fclass.s     gp, fa4
                  srai         zero, a5, 24
                  addi         s4, t4, 1773
                  add          s8, t5, a2
                  sub          ra, a7, s4
                  fdiv.s       ft9, fa3, fa3, rtz
                  auipc        s11, 1007749
                  xori         t1, a5, -1719
                  fmv.x.w      a3, fa6
                  rem          a5, a0, s5
                  fle.s        s9, fs10, fs3
                  remu         sp, ra, t3
                  sltu         a0, s1, a5
                  sra          a7, s9, s7
                  remu         t6, s9, s0
                  or           a0, s7, a0
                  fadd.s       fs2, ft4, ft8, rmm
                  fdiv.s       fa4, fs11, ft5
                  fsgnj.s      ft11, fs9, fa1
                  mulhsu       a4, sp, a4
                  sltiu        t3, s2, -1583
                  fmax.s       ft2, fs8, fa3
                  fsub.s       fs2, fa7, fs8
                  or           a6, a6, t1
                  fsgnjx.s     fs10, fa7, fs10
                  fmul.s       fs2, ft0, ft8
                  srai         s6, ra, 6
                  sub          t3, s7, s9
                  fcvt.s.w     fa1, s9, rtz
                  fclass.s     s8, fs3
                  fmax.s       fs6, fs11, fs0
                  div          s9, a2, s3
                  sll          s10, t5, a5
                  fmv.w.x      fa0, a7
                  lui          s8, 112464
                  fsgnjn.s     fa7, fa0, fa3
                  addi         s1, s11, 959
                  add          t0, s3, s5
                  fsgnjx.s     fs4, ft4, fs4
                  srl          tp, s9, a5
                  remu         gp, t3, t3
                  ori          s7, s5, -1894
                  xor          s10, a0, s4
                  fcvt.w.s     ra, ft0, rdn
                  sltiu        t1, s4, -700
                  srai         t3, t0, 23
                  slli         s8, s2, 14
                  feq.s        s6, fa2, ft8
                  fcvt.s.wu    fa0, s9, rne
                  fdiv.s       ft11, fa4, ft6, rdn
                  xori         s7, s5, 1361
                  andi         sp, a7, -125
                  slti         s9, t3, 1574
                  fclass.s     sp, fs1
                  fdiv.s       fa7, fs4, fs3, rne
                  add          s5, t6, a7
                  slt          zero, s11, t5
                  fclass.s     s9, ft11
                  auipc        s7, 900083
                  mulh         t2, gp, a3
                  mulh         a6, s5, ra
                  sltu         t3, gp, a1
                  xor          a0, a0, t0
                  add          t6, t3, s1
                  srl          sp, s8, s11
                  fclass.s     s4, ft7
                  or           gp, t4, s10
                  fsqrt.s      ft5, ft5
                  fsqrt.s      fs0, ft7, rup
                  add          sp, s4, a1
                  srli         s9, t6, 27
                  fclass.s     gp, ft9
                  mulhsu       a6, s10, sp
                  flt.s        t6, ft10, fs3
                  sub          a3, s0, gp
                  fmul.s       ft7, ft8, fa2, rup
                  feq.s        sp, fa1, fa6
                  fcvt.wu.s    s6, fs6, rdn
                  sra          s9, t2, t1
                  fsub.s       ft4, ft10, fs8, rup
                  div          s5, s4, s2
                  mulhu        t2, s7, s9
                  nop
                  divu         s1, a3, a4
                  srl          zero, s0, t4
                  fcvt.wu.s    s6, ft8, rmm
                  feq.s        t2, fs6, fs3
                  sltiu        t1, a4, -1276
                  andi         s0, s4, -196
                  sll          a1, a0, s8
                  and          gp, t1, a6
                  slti         s1, tp, 630
                  fsgnjn.s     fa3, fs3, fs8
                  lui          s5, 588088
                  fmax.s       fs2, fa6, fs1
                  fsgnj.s      ft7, ft6, fs2
                  lui          t6, 457205
                  feq.s        a3, ft8, fa1
                  fmul.s       fs10, fs0, fa2
                  fdiv.s       fs8, fs4, fa1, rmm
                  add          s11, s4, t1
                  ori          zero, t1, 1634
                  fdiv.s       fs4, ft10, fs10
                  slti         sp, s4, 800
                  div          s5, s2, s10
                  andi         t2, ra, -919
                  xori         s11, s10, -48
                  fmin.s       ft8, fs1, fa4
                  fsub.s       fs9, ft9, ft0
                  ori          s4, s8, 31
                  div          t3, s8, gp
                  addi         zero, a4, 1645
                  fmv.w.x      fa1, a0
                  feq.s        a7, fa3, ft2
                  fcvt.s.wu    ft5, ra, rne
                  nop
                  sltiu        gp, sp, -1656
                  mul          ra, a4, t1
                  fcvt.s.w     fa6, a0
                  mulhu        t6, s0, a5
                  xori         t4, tp, 740
                  and          t0, s0, gp
                  fsgnjn.s     ft5, ft4, fs10
                  fmv.w.x      fa3, a7
                  fle.s        s10, fs11, fa1
                  auipc        t3, 805939
                  sltu         s4, s1, a2
                  slti         a4, a3, -3
                  fcvt.s.w     fs4, s3, rtz
                  div          ra, zero, s10
                  fmv.x.w      t6, ft4
                  fsgnjn.s     ft9, fa2, fa6
                  fadd.s       fa7, fs5, ft9
                  and          s8, a3, a4
                  mulhsu       zero, a5, t6
                  and          t2, t5, a1
                  add          a3, s9, zero
                  fsgnjn.s     ft3, ft4, fa1
                  fmv.x.w      s8, fs9
                  sltu         s1, t0, a6
                  fcvt.s.w     fa4, s6, rtz
                  fsqrt.s      ft7, ft10
                  mulhsu       a3, a0, t6
                  fcvt.w.s     a0, ft7, rup
                  addi         s5, s8, 1037
                  fcvt.s.wu    ft0, s2
                  slli         s8, a7, 26
                  rem          s8, t1, a0
                  fcvt.s.w     fs9, a2
                  fmv.w.x      ft0, t1
                  divu         a1, s4, a6
                  fcvt.w.s     a7, fs10
                  sub          s3, s10, t0
                  mul          s11, s2, s4
                  fmv.x.w      a6, ft10
                  fmv.w.x      ft2, s11
                  mulhsu       t3, a7, t4
                  fmv.x.w      s0, fs11
                  sra          a5, ra, s2
                  addi         a3, s1, 896
                  sra          a1, s1, t3
                  auipc        s5, 406377
                  fsqrt.s      fs5, ft10
                  nop
                  ori          t6, t4, 1923
                  slli         a5, a2, 8
                  xori         s11, s8, 834
                  nop
                  srai         a0, zero, 12
                  fcvt.s.w     ft1, t1, rup
                  srai         sp, s9, 26
                  addi         s10, s6, 1496
                  fmax.s       fa3, ft0, fs6
                  mulhsu       a5, t5, gp
                  auipc        s8, 974952
                  fcvt.s.w     fs8, a4, rne
                  nop
                  fcvt.wu.s    a6, ft1, rup
                  flt.s        tp, ft6, ft0
                  mul          s7, s10, a0
                  feq.s        zero, fs5, fa3
                  mulh         a4, s5, zero
                  fcvt.s.wu    fs6, s7, rup
                  fdiv.s       ft10, fs10, fs8
                  fsgnj.s      ft3, fa3, fa5
                  sra          s6, t2, s9
                  fsgnj.s      ft10, fa3, fa2
                  mulh         s6, s5, a3
                  srli         a7, s4, 29
                  ori          s4, a2, -1831
                  fsgnjx.s     fs3, fa4, ft4
                  fmul.s       ft4, ft11, ft0
                  div          s7, s8, a5
                  rem          s9, s4, a2
                  slt          t4, s8, a1
                  sltiu        t2, t6, 1509
                  fsub.s       fa0, ft8, fs4
                  xori         t3, t3, -1345
                  sltu         s11, a0, s3
                  mulh         a0, s0, s10
                  fcvt.s.wu    ft0, t6
                  fmin.s       ft9, ft10, fa5
                  mulhsu       t1, a6, s6
                  or           a4, s4, s5
                  fcvt.s.w     fs4, t2, rtz
                  and          s1, s7, t0
                  slt          s10, a3, a6
                  srli         zero, s1, 31
                  fsgnjx.s     ft10, ft4, fs3
                  fmv.x.w      a6, fs4
                  fcvt.w.s     t3, ft7, rtz
                  fcvt.w.s     a5, fs0, rdn
                  mulhsu       s5, s4, a3
                  or           ra, a6, s3
                  remu         s4, t6, t6
                  fdiv.s       fa4, ft1, ft4
                  rem          s1, t5, t4
                  mul          ra, s11, t1
                  div          ra, ra, a0
                  fmv.w.x      fs5, s11
                  fclass.s     a5, ft5
                  sub          a5, a2, s4
                  nop
                  fle.s        a1, fa0, fs10
                  fsgnjx.s     ft8, fs6, fs6
                  fmin.s       ft9, fa5, fa3
                  fsgnjx.s     ft3, fs1, fs0
                  sltiu        sp, tp, 1819
                  addi         a5, t4, -798
                  fcvt.wu.s    a7, fs3, rmm
                  div          gp, t6, s4
                  fsub.s       fs11, ft5, ft3, rup
                  xori         s0, t5, -1215
                  mulh         t3, s9, s4
                  slt          ra, t4, s11
                  srli         s11, s2, 3
                  add          a7, a2, t2
                  flt.s        s3, ft4, ft11
                  fcvt.s.w     ft11, t3
                  remu         t4, s4, sp
                  auipc        s6, 949692
                  fcvt.wu.s    sp, fs2
                  fcvt.w.s     s5, fa5
                  fdiv.s       ft5, fs3, ft4, rdn
                  srli         s10, t4, 8
                  feq.s        sp, ft10, fs10
                  fcvt.w.s     s3, fa4, rne
                  div          s1, a0, t4
                  fmax.s       ft0, ft8, fs6
                  srl          s11, s4, s9
                  remu         tp, a1, s7
                  mul          s4, t4, a2
                  fmax.s       fs11, ft9, fs0
                  sub          s10, zero, s6
                  slt          s0, t3, a3
                  slt          s9, s11, a5
                  rem          s9, t5, a6
                  lui          t2, 900330
                  auipc        a0, 829459
                  mul          a3, t0, s2
                  fsub.s       ft1, fa4, fs8, rne
                  fmax.s       fs6, ft8, fa0
                  sltiu        s4, a4, -1057
                  or           ra, tp, t5
                  slti         a4, s6, -1835
                  sub          ra, t2, a2
                  rem          a5, a4, a3
                  or           a1, s6, t4
                  xor          t6, t1, s1
                  and          tp, s3, t1
                  mulhsu       s9, s2, s9
                  mul          s10, sp, s9
                  srli         s5, s10, 1
                  fmax.s       ft9, ft5, fs9
                  srl          a7, a6, zero
                  fclass.s     gp, fs5
                  or           a1, sp, s3
                  fsgnjx.s     ft4, ft5, ft5
                  slli         s9, a1, 28
                  fdiv.s       fa1, fs9, ft9, rne
                  xor          a0, zero, s4
                  or           t1, s0, s3
                  fsgnjn.s     fs11, fs2, fs4
                  fdiv.s       ft2, fa1, ft6
                  fsub.s       ft1, fs6, fa5
                  flt.s        zero, ft6, fa6
                  div          s10, t0, a4
                  lui          t0, 312573
                  fmin.s       fs10, fs9, fs7
                  sll          s9, t2, a4
                  ori          s11, t5, 377
                  fsqrt.s      fs11, ft10, rup
                  fsgnjx.s     ft6, fa4, ft0
                  rem          s0, s5, s10
                  mul          s9, a3, s3
                  fsgnjn.s     fs2, fa1, fa1
                  fmin.s       fs8, fs2, fs7
                  fmin.s       ft10, fs4, fa4
                  fmv.x.w      s0, fs8
                  ori          a7, t2, 174
                  fsub.s       ft3, fs9, fs6
                  xor          ra, ra, t3
                  fle.s        a4, fs2, fs5
                  nop
                  fadd.s       ft3, fa7, fs6
                  auipc        t1, 603388
                  sltiu        t2, t2, -158
                  fsgnjx.s     fa2, ft3, fa7
                  mul          t3, t2, t1
                  ori          gp, t3, 209
                  feq.s        s10, ft11, fs11
                  fadd.s       fs1, ft4, fa5
                  sll          a6, s7, tp
                  add          t6, t0, s5
                  sltu         s9, zero, s8
                  divu         s7, a6, s7
                  flt.s        s8, ft4, ft2
                  srl          sp, a5, a7
                  slli         s7, a3, 27
                  fsgnjx.s     fa4, fs3, fa6
                  slti         s9, t6, 551
                  and          s7, gp, zero
                  mulhu        a7, s2, a2
                  fmv.w.x      fa0, a2
                  fclass.s     tp, fs6
                  div          t0, t6, zero
                  fcvt.s.wu    ft7, s7, rup
                  or           s9, s5, s9
                  fsub.s       ft8, fa4, fs5, rdn
                  fdiv.s       fa5, ft5, ft3
                  fmv.x.w      s6, fa0
                  fsqrt.s      fs8, fa3
                  fcvt.w.s     a6, fs8
                  or           s11, t4, a2
                  mulhu        ra, a1, t5
                  slt          t1, t1, s11
                  divu         s6, s11, s1
                  xori         s10, t5, 1079
                  fmul.s       fa5, fs10, fa3
                  addi         t3, gp, -470
                  sltu         s6, s2, s9
                  fsgnjn.s     ft9, ft9, ft6
                  srl          sp, a6, sp
                  fcvt.w.s     t3, fs9
                  fmin.s       fa1, ft1, fa1
                  fmv.x.w      t2, fs11
                  sltiu        t6, s5, 1628
                  lui          a4, 590252
                  fmv.w.x      fs1, a3
                  mul          s8, t1, s4
                  mulhsu       s0, a4, s11
                  sll          a4, gp, t5
                  add          s9, ra, a0
                  divu         t2, a3, s6
                  fcvt.s.w     fs1, a2
                  sll          t1, s9, t4
                  srl          zero, t2, s2
                  lui          sp, 478553
                  srai         s8, s7, 16
                  xor          a7, s11, s4
                  fsgnj.s      fs3, fa3, fs1
                  divu         t2, t1, t0
                  mulhsu       t3, s11, t6
                  fcvt.s.wu    fs5, t6, rtz
                  sltu         s0, a0, s10
                  sll          a5, sp, t5
                  remu         a4, s6, s11
                  fsgnjn.s     ft11, fs6, ft9
                  sll          ra, tp, t5
                  fmv.w.x      ft3, t2
                  div          gp, t6, a4
                  sra          s7, s2, s7
                  fsgnjn.s     ft7, fs6, fs2
                  add          t4, s4, a2
                  div          a4, sp, sp
                  fmin.s       ft1, ft3, fs3
                  ori          s0, t6, -750
                  srai         a0, a4, 2
                  srai         s7, a6, 13
                  srai         s5, s8, 15
                  slt          s4, a1, a5
                  fsqrt.s      ft7, fs11, rmm
                  mulhsu       t1, sp, gp
                  mulhu        sp, t1, t6
                  fsgnjx.s     fa7, fa2, ft8
                  nop
                  srai         t4, a2, 1
                  fadd.s       ft9, ft10, fa1, rne
                  fcvt.s.wu    ft2, s0, rne
                  fmv.x.w      s8, fs9
                  mul          a5, s4, t0
                  fcvt.s.w     ft10, s4, rtz
                  fsqrt.s      fa7, ft8
                  fcvt.s.wu    ft1, gp
                  fcvt.wu.s    t4, fa0, rmm
                  fmv.x.w      s3, fa1
                  fclass.s     gp, fa1
                  nop
                  divu         s7, zero, t5
                  fmin.s       fs5, ft0, ft3
                  mulhsu       s6, s9, s5
                  nop
                  lui          t1, 255414
                  andi         a0, t5, 1048
                  sub          t0, s9, a6
                  srli         s8, s5, 2
                  divu         s1, s2, a5
                  auipc        s3, 585140
                  mulh         s11, a7, s0
                  mul          a7, t0, s5
                  fle.s        t2, ft0, fa3
                  slti         ra, s5, 495
                  fclass.s     t0, fs2
                  fmin.s       fa4, fs10, fs3
                  feq.s        ra, fs2, fs7
                  remu         s6, s9, tp
                  sltiu        a3, a1, 212
                  sub          s9, t0, a3
                  ori          s0, a6, 760
                  xor          t1, s5, t2
                  slt          sp, gp, s9
                  fsgnj.s      ft11, fs11, fa0
                  fmv.w.x      ft1, ra
                  fmv.x.w      a3, fs9
                  fsgnjx.s     fa3, fa0, fs2
                  srai         t3, a2, 1
                  fcvt.w.s     s11, ft9
                  fle.s        s1, ft6, fs3
                  fsgnjx.s     fs7, fa0, ft1
                  fcvt.w.s     a6, fs6, rtz
                  fcvt.s.wu    ft8, zero
                  fsqrt.s      ft8, fs3
                  or           a1, s0, a6
                  fclass.s     sp, fs2
                  fmv.w.x      ft5, t3
                  fmv.x.w      t1, fs3
                  slti         t4, s5, 1903
                  fcvt.s.w     fs8, t5, rup
                  fdiv.s       fa3, fs2, fa7, rdn
                  fadd.s       fs8, fs0, ft5, rmm
                  sltu         s11, sp, a0
                  fsgnjx.s     fs10, fa5, fa6
                  remu         zero, a3, a1
                  srli         s1, t0, 7
                  flt.s        a3, fs5, fs7
                  sltiu        a1, s0, 579
                  fsub.s       fs6, ft3, fs8
                  divu         sp, s10, t3
                  flt.s        a3, fs7, fs8
                  divu         a6, a7, gp
                  sltu         t4, s4, t3
                  fadd.s       fa5, ft2, fa2
                  slti         s4, t2, 662
                  nop
                  mulh         s0, s5, t3
                  slt          s6, a2, t5
                  nop
                  and          s6, a0, sp
                  remu         s4, s1, t2
                  slti         t1, a2, -1833
                  fsub.s       fs10, fa2, fa2
                  fdiv.s       ft0, fs7, ft5, rtz
                  fcvt.w.s     s4, fa3
                  mulhu        a3, a4, s1
                  srl          t4, a2, zero
                  fadd.s       ft1, fs2, ft7, rdn
                  fcvt.w.s     s4, fs10, rtz
                  andi         t6, a3, 156
                  srli         s4, a6, 23
                  slti         a3, s10, 1203
                  mulhsu       s8, s8, s2
                  srl          a3, tp, a7
                  and          s8, s5, a1
                  mulh         sp, a3, sp
                  fmin.s       fa1, fs4, fa6
                  fclass.s     a7, fs5
                  srai         a0, s3, 24
                  fdiv.s       fs7, fa4, ft10
                  nop
                  rem          a6, s0, a3
                  fadd.s       fs7, ft9, fs2
                  fclass.s     s7, ft4
                  fmul.s       fs0, fa3, ft8
                  srli         s5, a2, 19
                  lui          tp, 890810
                  andi         t6, s0, -1917
                  fsgnjx.s     fs1, ft3, fa1
                  divu         s1, s2, t1
                  sltiu        s5, s2, -1888
                  sra          s7, a5, t2
                  slli         a3, a2, 0
                  sub          a3, t0, s9
                  mulh         tp, t1, s4
                  addi         a0, t4, 1941
                  fcvt.w.s     a4, ft4, rdn
                  srli         s8, zero, 7
                  sra          s6, s5, t2
                  slli         a5, s4, 20
                  fcvt.s.w     fs10, s8, rne
                  sub          t1, t4, s6
                  fcvt.wu.s    a6, fs11
                  srai         a6, s0, 27
                  ori          t6, a3, 1418
                  divu         a1, s8, s4
                  fclass.s     a5, fa6
                  fle.s        t0, fa5, fa5
                  fadd.s       fs6, ft4, fa5
                  mulh         ra, s2, a3
                  sra          t3, tp, gp
                  fle.s        ra, ft6, ft2
                  srai         s9, a3, 10
                  fcvt.s.w     ft7, tp
                  sub          s4, t1, s0
                  fcvt.s.wu    fs2, s9, rdn
                  fmax.s       ft4, fa7, fs2
                  fdiv.s       ft2, ft7, ft8, rne
                  auipc        a6, 512764
                  mulhsu       sp, s10, a0
                  nop
                  srl          t6, t6, s4
                  fcvt.s.wu    ft11, a4
                  fsqrt.s      ft2, fa5
                  ori          a5, s2, -1745
                  flt.s        t3, fs2, fs10
                  xor          a5, t5, t4
                  sll          a1, a4, zero
                  fmv.x.w      zero, fs4
                  xor          s5, a1, s7
                  add          a0, s11, s3
                  auipc        tp, 762475
                  sltu         t2, a6, t6
                  addi         s10, a6, 1323
                  fmax.s       fs3, fa5, ft2
                  or           a4, tp, s4
                  rem          s9, t3, t3
                  fcvt.s.w     fa1, a4
                  xor          s0, t4, a3
                  fmul.s       fs11, fs6, fa5
                  mulhu        t4, s9, a4
                  fclass.s     s9, ft3
                  slti         a5, t2, -1792
                  and          sp, t4, s1
                  mulh         gp, zero, s4
                  xor          a1, s11, s1
                  remu         sp, a5, a7
                  addi         t2, zero, 182
                  fcvt.s.wu    fa5, a2
                  xor          t0, a1, s6
                  srl          a3, a0, zero
                  slli         s0, s4, 7
                  addi         s6, s2, 1115
                  fcvt.wu.s    a0, fa1
                  andi         tp, a4, 25
                  slt          gp, s0, s3
                  fmv.w.x      ft2, s1
                  fadd.s       fs0, ft2, fa2, rtz
                  auipc        t3, 37375
                  mulhu        t1, s6, a1
                  fmin.s       ft8, fs1, fa0
                  remu         s9, a1, sp
                  nop
                  fcvt.w.s     s7, fa1, rtz
                  fmul.s       fa2, fa0, fs9, rne
                  srai         gp, a0, 4
                  slt          s10, s2, a7
                  sltiu        t0, s5, 1164
                  fsgnjn.s     fs1, fa1, ft4
                  lui          t4, 912998
                  sltiu        a3, a6, -1011
                  fmv.w.x      fs11, t6
                  feq.s        a3, fs6, ft2
                  andi         s4, t0, 1847
                  auipc        gp, 600750
                  fclass.s     s7, ft8
                  fle.s        s4, fs7, ft6
                  fdiv.s       fs1, fa4, fs11, rtz
                  fmax.s       fa0, fa4, ft4
                  slti         s7, s1, 437
                  feq.s        t4, ft6, ft6
                  auipc        t4, 806756
                  andi         s11, a5, -136
                  fcvt.s.wu    fa4, gp, rup
                  divu         s0, s2, a5
                  rem          t6, t6, s9
                  mul          s7, t2, t5
                  lui          t2, 569648
                  fsgnj.s      fs11, fa3, ft0
                  flt.s        sp, ft0, fs10
                  srl          s3, s1, a1
                  srli         a1, a1, 12
                  sltiu        s3, s9, -528
                  fmv.w.x      ft1, a1
                  div          s0, t5, s9
                  fsub.s       fs3, fs5, ft10, rtz
                  and          zero, s9, tp
                  lui          s9, 280917
                  fcvt.wu.s    t2, fs0
                  lui          t2, 275021
                  fmin.s       ft11, ft10, fa0
                  fmv.w.x      ft9, ra
                  xor          a3, s5, a1
                  slt          a6, s9, a1
                  fcvt.s.w     fa4, t4
                  sra          s9, zero, s6
                  sub          a7, t2, a5
                  auipc        s5, 186846
                  fcvt.s.w     fs9, s1
                  nop
                  feq.s        a4, ft9, fa6
                  rem          s6, t6, sp
                  sll          tp, s6, t0
                  div          t6, zero, zero
                  slli         s7, tp, 16
                  sll          a1, tp, t3
                  mulhu        t1, s7, t6
                  fcvt.s.w     ft5, s11, rdn
                  or           s1, tp, a5
                  div          t6, s8, gp
                  sll          a6, ra, a0
                  fcvt.w.s     a5, fa6, rne
                  fcvt.s.wu    fa1, t0
                  add          t3, s11, a1
                  fclass.s     t2, fs4
                  lui          t0, 983077
                  xori         a5, gp, 1075
                  remu         s3, a2, s9
                  fcvt.s.w     fs1, tp
                  addi         s0, gp, 187
                  divu         a1, s9, s5
                  fsgnj.s      fs10, fa3, ft1
                  mul          s10, s8, tp
                  sltu         sp, t6, s11
                  mulh         a7, a1, ra
                  mulhsu       a6, t3, s2
                  fcvt.s.wu    fs4, t6, rdn
                  divu         t1, zero, s7
                  fmv.w.x      fa6, s2
                  fcvt.s.wu    ft10, s11
                  add          t0, a0, t4
                  fsgnjn.s     fs4, ft7, ft10
                  fcvt.s.wu    ft6, s1
                  srai         gp, a0, 4
                  and          s8, s5, a3
                  fmax.s       ft9, fs1, ft6
                  nop
                  mul          s3, gp, t4
                  fle.s        s11, fs2, fs8
                  sltu         s11, s4, s1
                  mul          t6, tp, s10
                  add          s7, s5, ra
                  slli         ra, s10, 3
                  fsgnj.s      fs11, fs4, ft4
                  fmax.s       ft0, fa7, fa6
                  andi         a7, a0, 737
                  fcvt.s.wu    ft2, s3, rup
                  ori          sp, a0, 540
                  fclass.s     t2, fa3
                  slli         sp, s0, 4
                  srli         s7, tp, 7
                  mulhsu       ra, a0, gp
                  fsqrt.s      fa2, fs4, rdn
                  fsub.s       fa2, ft8, fa6
                  sll          t4, a3, ra
                  mul          s6, s4, a5
                  auipc        t6, 718530
                  fsqrt.s      fs6, fa3
                  fcvt.w.s     gp, ft2, rdn
                  sll          t1, gp, s0
                  rem          tp, a7, s11
                  fmv.w.x      fa2, t5
                  slt          a6, zero, s11
                  fsgnjn.s     fs5, ft1, ft11
                  slt          t6, s7, t4
                  sra          t1, s11, a0
                  feq.s        a6, fs10, ft4
                  fsqrt.s      fa4, fs4
                  fmul.s       fs8, fa6, fs11
                  remu         s11, t5, a0
                  mulhsu       s8, a1, a2
                  xori         ra, a3, -912
                  mul          tp, t2, zero
                  fsgnj.s      fs11, fa6, fs4
                  sltu         a5, t4, a4
                  mulh         s4, t5, s0
                  lui          a1, 725435
                  slti         s8, s10, -1849
                  andi         s10, t3, -335
                  srli         s0, s3, 29
                  divu         s0, t2, tp
                  srli         a4, zero, 3
                  fsgnj.s      ft5, fa3, fs2
                  fsqrt.s      fa1, fs5
                  fsgnj.s      fs4, fs0, ft9
                  flt.s        s8, ft4, fs4
                  remu         s9, a2, t3
                  fclass.s     a7, fs2
                  mul          s8, s8, t3
                  andi         s11, t4, -666
                  slt          a1, a7, gp
                  sra          a3, s11, a1
                  xori         a3, a3, -462
                  fcvt.w.s     s8, fa0
                  fmax.s       ft5, fs8, ft11
                  fmax.s       fa7, fs3, fa7
                  fsgnjn.s     ft2, fs10, fs7
                  xor          t0, sp, a6
                  slli         s4, s7, 24
                  addi         s6, a6, -316
                  fcvt.s.wu    ft9, t0
                  srli         t1, sp, 0
                  andi         t1, s3, -1560
                  div          ra, a1, gp
                  sltiu        s1, s6, -333
                  slt          s3, a1, t2
                  slli         s8, gp, 29
                  fsub.s       fs5, ft9, ft11, rtz
                  feq.s        a1, ft10, fs0
                  or           t0, s5, sp
                  nop
                  and          a0, t3, t4
                  srli         s11, t4, 0
                  xori         a3, ra, 1963
                  fdiv.s       ft2, fa2, ft2, rup
                  fmv.x.w      s10, fs1
                  fdiv.s       fs0, fa6, fs1
                  slli         t0, a3, 17
                  div          s10, s9, s1
                  srli         a4, t2, 0
                  mulhsu       s5, t5, a1
                  fmul.s       ft6, fs8, fs11
                  fcvt.wu.s    s6, fs10
                  auipc        s4, 794458
                  srli         a4, s4, 12
                  fcvt.w.s     s10, fs10, rmm
                  fsgnjn.s     ft6, fa0, ft7
                  srai         t2, t6, 30
                  slti         sp, s5, -1614
                  or           s7, tp, s5
                  auipc        s1, 441971
                  add          gp, sp, a6
                  nop
                  andi         s10, s10, -1954
                  fdiv.s       fs0, fa4, ft6
                  or           gp, a6, a1
                  sra          t4, sp, a2
                  flt.s        t1, fs8, fa7
                  fmv.x.w      s1, fs3
                  fsgnj.s      ft0, ft5, ft0
                  fmax.s       fa6, fs9, fs2
                  slt          s4, a0, t2
                  auipc        s7, 268762
                  srli         s9, s11, 8
                  mulh         s11, a5, t2
                  andi         gp, s2, -981
                  sra          t1, gp, s11
                  div          s3, s3, s2
                  xori         t2, t5, -450
                  srl          s7, t2, s8
                  mulhsu       a4, a7, gp
                  fmax.s       ft10, fs7, fa4
                  flt.s        s10, ft0, ft8
                  fclass.s     s0, fs4
                  fsgnjn.s     ft7, fa7, fs1
                  slt          a6, s8, s10
                  xor          s3, s7, t5
                  xor          s10, sp, zero
                  srai         s0, s3, 26
                  nop
                  fmv.x.w      sp, fs9
                  fle.s        a6, ft1, fs11
                  mulhu        s0, zero, s10
                  slti         s4, a5, -923
                  fcvt.wu.s    sp, fs11, rdn
                  sub          a0, s3, s11
                  mulhsu       s3, t6, t4
                  fcvt.s.wu    ft10, ra, rdn
                  slli         s0, s9, 30
                  fmv.w.x      ft4, a2
                  slli         s4, t3, 11
                  fcvt.wu.s    t2, fa7, rmm
                  div          a3, s0, s4
                  sltu         a3, tp, a3
                  rem          s0, s3, a1
                  andi         s1, t1, -1234
                  fclass.s     t0, fa7
                  fcvt.w.s     s0, ft11, rup
                  fcvt.wu.s    s4, ft5
                  lui          t2, 240098
                  remu         t1, t3, a1
                  srli         t4, a0, 5
                  fmax.s       fa5, fa2, ft8
                  rem          s7, s9, a5
                  ori          s4, zero, -898
                  fsgnjx.s     ft8, ft5, fs5
                  fadd.s       ft5, fs9, fa5, rmm
                  ori          s10, a3, 1488
                  fcvt.s.w     ft8, a4, rdn
                  fadd.s       fs4, fs6, fa3, rtz
                  divu         s4, t3, a7
                  feq.s        s11, fs1, ft11
                  fadd.s       fs5, fa6, fs10
                  sub          s7, s7, zero
                  slti         s9, zero, -1860
                  fcvt.s.wu    fa2, t4, rmm
                  or           s6, s7, s6
                  flt.s        a5, fs4, ft1
                  andi         ra, a4, -1965
                  sub          s11, a7, sp
                  remu         a5, a2, s4
                  fcvt.s.w     fs11, a4
                  fsgnjn.s     fs6, ft9, fa7
                  mulh         s9, s7, s6
                  xori         s10, a3, 640
                  slt          s10, s11, ra
                  sub          ra, s8, zero
                  fmin.s       fa6, fs1, fs2
                  nop
                  remu         s0, t2, s1
                  fmin.s       fs10, fa6, fs11
                  slt          t6, a5, t2
                  fmv.w.x      ft9, t2
                  xor          t6, a1, a1
                  sra          s0, s7, tp
                  fmax.s       ft5, fa5, ft3
                  nop
                  addi         tp, t4, 1366
                  lui          zero, 92465
                  mulh         t4, a3, s9
                  xori         t6, t1, -1476
                  slti         s8, a6, 518
                  remu         zero, s4, t2
                  fcvt.s.w     fs0, s2, rtz
                  fsub.s       ft3, fs4, fs1, rtz
                  remu         a7, a6, t6
                  srl          s6, s9, s10
                  auipc        t4, 322929
                  flt.s        ra, fa1, fa6
                  fcvt.wu.s    s5, ft2
                  xori         s11, a7, 961
                  xori         a0, s10, 1634
                  or           t1, s4, s5
                  xori         a3, tp, -2012
                  fcvt.w.s     ra, fs1
                  remu         s10, s5, t6
                  fsub.s       ft6, fs7, ft8
                  srai         a5, tp, 15
                  remu         t0, t4, s1
                  div          t2, s8, ra
                  add          s0, a2, t5
                  addi         s8, s1, 1374
                  srl          s11, s1, a6
                  fsgnjn.s     ft11, ft4, fa4
                  mulhu        zero, t0, s2
                  rem          sp, sp, s3
                  add          s0, s8, a3
                  fcvt.s.wu    fa2, t4
                  fmax.s       fs4, ft8, fa7
                  fcvt.s.wu    ft3, s9, rne
                  fmv.x.w      sp, ft2
                  fcvt.wu.s    s1, fs1
                  fsgnjx.s     fa2, fa2, ft0
                  fcvt.wu.s    t1, ft1, rne
                  and          a7, s1, s1
                  mul          s8, t1, tp
                  fdiv.s       ft9, fs8, ft4, rup
                  fcvt.wu.s    s3, ft7, rdn
                  fmv.w.x      ft3, a7
                  slt          s1, s0, s5
                  fsqrt.s      fa0, fa6
                  add          a5, s1, a7
                  sub          s9, t2, s6
                  fcvt.wu.s    a0, fs1
                  mul          t6, s7, s2
                  auipc        s10, 918936
                  andi         a5, s6, 1228
                  or           s10, a5, s10
                  srai         a3, a6, 25
                  mulh         a6, s4, a5
                  divu         a7, t6, s5
                  divu         t0, t3, a6
                  fsub.s       ft1, fs4, fs11, rmm
                  and          s4, tp, s2
                  sltu         s11, t1, s7
                  fadd.s       ft1, fs3, ft2
                  fsgnjn.s     ft1, ft1, fa2
                  fcvt.s.wu    ft6, s10, rmm
                  srl          a1, gp, tp
                  fmv.w.x      ft8, a6
                  mulhsu       s6, gp, t6
                  sltu         s6, a3, a5
                  fmax.s       ft2, fa4, ft9
                  fmv.x.w      t4, fa7
                  sltu         a0, s11, ra
                  flt.s        s9, fs7, fs4
                  sll          a1, s5, t5
                  slt          s8, s6, t1
                  fdiv.s       fs7, fs11, ft6, rmm
                  feq.s        sp, ft9, fa4
                  sltu         s0, s1, t3
                  feq.s        t0, ft0, fa1
                  flt.s        a0, fa7, ft8
                  auipc        a1, 292389
                  slti         t6, a0, 1846
                  flt.s        s1, fs8, fs0
                  fcvt.wu.s    t4, fs10
                  ori          a7, t2, -371
                  lui          t3, 686077
                  fsub.s       fs0, fs3, fa5
                  fcvt.s.wu    ft5, a5, rdn
                  fcvt.s.w     fa5, t3
                  xori         s0, s3, 256
                  sltu         tp, a7, t3
                  fsgnjn.s     fs9, fs10, fa3
                  fcvt.w.s     a4, fa7
                  fclass.s     s3, fa2
                  fsgnj.s      fs5, ft11, ft4
                  fmin.s       fa0, fs7, fs5
                  auipc        t4, 424071
                  lui          s3, 567816
                  and          a6, gp, t6
                  fcvt.s.wu    fs2, s1, rne
                  sltu         s7, s0, s9
                  fsgnj.s      ft8, fs10, ft4
                  fsqrt.s      fs10, fa3
                  sra          s3, a0, a2
                  lui          gp, 891868
                  auipc        sp, 200986
                  fcvt.wu.s    t1, ft10
                  srli         s1, s2, 22
                  slli         s10, t1, 28
                  fcvt.w.s     a0, fa6, rmm
                  mulhu        s7, t1, a5
                  fcvt.s.wu    ft11, s11
                  xor          t2, t3, s2
                  sltiu        t4, t6, 519
                  fadd.s       fa0, ft4, fa1, rdn
                  rem          sp, t2, s5
                  slt          s6, s10, s6
                  xori         s6, s3, -1990
                  fcvt.wu.s    s5, fs5
                  fmax.s       ft9, ft1, ft8
                  mulhu        s3, sp, a6
                  fle.s        a4, ft4, fs8
                  add          gp, a5, a3
                  rem          s7, t3, sp
                  lui          s8, 34803
                  mulhsu       sp, ra, a3
                  add          t3, t4, s11
                  sll          s4, s4, t4
                  fmul.s       fs5, fa4, ft4, rne
                  fmax.s       fs3, fa5, fs9
                  remu         t2, a3, a0
                  fsqrt.s      ft8, ft7, rdn
                  mulh         s3, a2, s6
                  fmul.s       fs1, fs9, ft8, rup
                  srl          s5, a1, t4
                  sub          s3, s0, s7
                  fcvt.s.wu    fa7, a4
                  addi         t4, zero, 346
                  fdiv.s       ft2, fs1, fs3, rmm
                  fmul.s       fa1, ft10, fa5
                  and          a5, s9, gp
                  addi         s0, t1, -1851
                  div          sp, a5, t6
                  fsgnj.s      fa4, fa5, ft7
                  fsgnjx.s     fa6, ft10, ft5
                  div          a7, t0, t5
                  fmin.s       ft9, fs11, fs4
                  slt          s9, s4, sp
                  fdiv.s       fa1, fs0, fs3
                  fcvt.s.w     ft0, t0
                  fsub.s       fs1, fs0, ft5
                  sltu         a3, a1, a6
                  srli         s10, a2, 18
                  srli         sp, zero, 18
                  sltiu        s0, a7, 1747
                  fcvt.wu.s    a6, fa2
                  fsgnj.s      fs0, ft9, fs2
                  xor          t4, s1, t5
                  divu         a1, gp, a5
                  fsqrt.s      fa1, ft9
                  slti         s9, s1, 1866
                  fdiv.s       ft1, ft11, ft2
                  fcvt.s.wu    ft3, s10, rdn
                  fmax.s       ft3, fa6, ft1
                  sltu         s3, t5, gp
                  slli         a5, s5, 1
                  srai         s3, t2, 16
                  srai         s9, a2, 11
                  mulh         a5, a5, s3
                  fcvt.s.w     ft4, gp, rdn
                  fclass.s     gp, fs10
                  andi         s4, a5, 461
                  srl          s1, t5, a4
                  fsgnj.s      fa1, fs7, fs6
                  srli         ra, s3, 14
                  fsqrt.s      ft5, fa2, rmm
                  mulh         a0, s10, t2
                  addi         t3, sp, 566
                  fcvt.wu.s    ra, ft1
                  feq.s        a6, ft10, ft1
                  fcvt.s.wu    fs10, a0
                  ori          t4, t2, -1794
                  fadd.s       fs7, ft6, fa7
                  fcvt.s.wu    ft9, s11
                  fdiv.s       fa3, fs2, fa0
                  fmax.s       ft9, fs3, ft11
                  sub          tp, s10, a6
                  auipc        s11, 731924
                  sltiu        s10, s3, -1667
                  fcvt.s.w     fa7, s10
                  fmax.s       fs4, fs2, ft8
                  rem          a6, a5, a1
                  auipc        a3, 694071
                  fsgnjn.s     fs1, fa1, ft11
                  fsgnjx.s     fs6, fa1, fs10
                  remu         s10, a7, s10
                  fsub.s       fa1, ft9, fa7
                  sra          t4, s5, ra
                  fcvt.s.w     fs3, s4, rne
                  feq.s        t6, ft2, ft11
                  feq.s        a5, fs4, ft5
                  sra          a7, s2, s4
                  fmv.x.w      ra, fs9
                  sll          a0, s9, a1
                  fsgnjn.s     fs0, fs8, ft11
                  div          t0, t4, t5
                  or           a7, s6, a0
                  nop
                  or           s1, s0, s0
                  slli         zero, t6, 21
                  fle.s        t6, fs0, fa6
                  fdiv.s       ft1, ft4, fa1
                  fle.s        a4, ft10, ft0
                  mulh         t6, t1, sp
                  div          tp, a0, s0
                  and          s3, s7, s9
                  fsgnjx.s     fs6, fa4, fs10
                  addi         a4, a1, 544
                  fdiv.s       ft6, fs3, fa0
                  fmax.s       ft0, fs3, fa0
                  fadd.s       ft5, fa5, ft8, rdn
                  andi         a7, t4, 415
                  feq.s        s0, fs3, fa4
                  div          t6, s7, a6
                  fsgnj.s      fs5, fs0, ft2
                  xor          s1, s1, s4
                  rem          a5, s9, s11
                  flt.s        s9, fa3, fs11
                  mulh         a6, t0, a1
                  srli         t0, a1, 19
                  divu         a6, s6, sp
                  fsgnjx.s     ft10, fs2, fs3
                  slt          a1, s11, t0
                  auipc        a4, 779344
                  sltu         t2, t3, t0
                  feq.s        s3, fs4, ft11
                  and          a6, sp, s9
                  add          s1, s7, s1
                  fmv.x.w      s4, ft6
                  fmv.x.w      a0, fa4
                  fle.s        t1, fs5, fs9
                  fmul.s       ft8, fa5, fa0
                  mul          s4, s4, t0
                  fmul.s       fs8, ft0, fa0
                  sltiu        s9, a4, -1658
                  fmul.s       ft11, fa0, fs4, rdn
                  mulh         t3, s9, a3
                  fsgnjn.s     ft6, ft3, fs0
                  sra          s7, s9, a4
                  fle.s        a5, ft6, fa5
                  fclass.s     a0, fs0
                  and          t6, s6, s10
                  fmul.s       ft4, ft9, ft11, rne
                  fle.s        s6, fa2, ft11
                  fmax.s       fa7, fs6, ft10
                  nop
                  nop
                  fclass.s     s11, ft10
                  fsub.s       fa7, ft11, fa5, rup
                  fdiv.s       fs6, fa4, fa3, rmm
                  fcvt.s.wu    fa5, s7
                  fdiv.s       fa5, ft2, fs10
                  sub          sp, s3, t4
                  slt          s7, tp, t1
                  sltiu        t3, s7, 1532
                  fsqrt.s      ft10, ft5
                  ori          s3, s7, -1048
                  xor          t2, s8, t1
                  add          s4, t2, t6
                  slli         a1, a0, 20
                  srl          a3, a6, a7
                  fadd.s       fs1, fs1, fa2, rup
                  feq.s        a1, fs0, fa5
                  fcvt.s.wu    ft0, a2
                  sub          s3, s7, tp
                  srli         a1, t0, 31
                  or           ra, s7, s8
                  mulh         s7, gp, s1
                  srai         t4, s1, 24
                  fclass.s     t0, fa7
                  fsqrt.s      fs6, fa6
                  fsqrt.s      fs6, ft2
                  sub          ra, s3, a7
                  fsgnj.s      fs4, fa3, ft9
                  and          s3, s11, s1
                  fle.s        s4, fs0, fs8
                  fmv.w.x      fs5, s11
                  la x30, test_done
                  jalr x0, x30, 0
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
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_2:
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_3:
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_4:
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_5:
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_6:
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_7:
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_8:
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_9:
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_10:
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_11:
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_12:
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_13:
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_14:
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_15:
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

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
                  addi x12, x12, -4
                  sw  x18, (x12)
                  add x18, x12, zero
                  addi x18, x18, -128
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  add x12, x18, zero
                  csrr x6, 0x341 # MEPC
                  csrr x6, 0x342 # MCAUSE
                  li x10, 0x3 # BREAKPOINT
                  beq x6, x10, ebreak_handler
                  li x10, 0x8 # ECALL_UMODE
                  beq x6, x10, ecall_handler
                  li x10, 0x9 # ECALL_SMODE
                  beq x6, x10, ecall_handler
                  li x10, 0xb # ECALL_MMODE
                  beq x6, x10, ecall_handler
                  li x10, 0x1
                  beq x6, x10, instr_fault_handler
                  li x10, 0x5
                  beq x6, x10, load_fault_handler
                  li x10, 0x7
                  beq x6, x10, store_fault_handler
                  li x10, 0xc
                  beq x6, x10, pt_fault_handler
                  li x10, 0xd
                  beq x6, x10, pt_fault_handler
                  li x10, 0xf
                  beq x6, x10, pt_fault_handler
                  li x10, 0x2 # ILLEGAL_INSTRUCTION
                  beq x6, x10, illegal_instr_handler
                  csrr x10, 0x343 # MTVAL
                  1: la x30, test_done
                  jalr x1, x30, 0

ecall_handler:    
                  la x6, _start
                  sw x0, 0(x6)
                  sw x1, 4(x6)
                  sw x2, 8(x6)
                  sw x3, 12(x6)
                  sw x4, 16(x6)
                  sw x5, 20(x6)
                  sw x6, 24(x6)
                  sw x7, 28(x6)
                  sw x8, 32(x6)
                  sw x9, 36(x6)
                  sw x10, 40(x6)
                  sw x11, 44(x6)
                  sw x12, 48(x6)
                  sw x13, 52(x6)
                  sw x14, 56(x6)
                  sw x15, 60(x6)
                  sw x16, 64(x6)
                  sw x17, 68(x6)
                  sw x18, 72(x6)
                  sw x19, 76(x6)
                  sw x20, 80(x6)
                  sw x21, 84(x6)
                  sw x22, 88(x6)
                  sw x23, 92(x6)
                  sw x24, 96(x6)
                  sw x25, 100(x6)
                  sw x26, 104(x6)
                  sw x27, 108(x6)
                  sw x28, 112(x6)
                  sw x29, 116(x6)
                  sw x30, 120(x6)
                  sw x31, 124(x6)
                  la x30, write_tohost
                  jalr x0, x30, 0

instr_fault_handler:
                  add x18, x12, zero
                  lw  x1, 4(x18)
                  lw  x2, 8(x18)
                  lw  x3, 12(x18)
                  lw  x4, 16(x18)
                  lw  x5, 20(x18)
                  lw  x6, 24(x18)
                  lw  x7, 28(x18)
                  lw  x8, 32(x18)
                  lw  x9, 36(x18)
                  lw  x10, 40(x18)
                  lw  x11, 44(x18)
                  lw  x12, 48(x18)
                  lw  x13, 52(x18)
                  lw  x14, 56(x18)
                  lw  x15, 60(x18)
                  lw  x16, 64(x18)
                  lw  x17, 68(x18)
                  lw  x18, 72(x18)
                  lw  x19, 76(x18)
                  lw  x20, 80(x18)
                  lw  x21, 84(x18)
                  lw  x22, 88(x18)
                  lw  x23, 92(x18)
                  lw  x24, 96(x18)
                  lw  x25, 100(x18)
                  lw  x26, 104(x18)
                  lw  x27, 108(x18)
                  lw  x28, 112(x18)
                  lw  x29, 116(x18)
                  lw  x30, 120(x18)
                  lw  x31, 124(x18)
                  addi x18, x18, 128
                  add x12, x18, zero
                  lw  x18, (x12)
                  addi x12, x12, 4
                  mret

load_fault_handler:
                  add x18, x12, zero
                  lw  x1, 4(x18)
                  lw  x2, 8(x18)
                  lw  x3, 12(x18)
                  lw  x4, 16(x18)
                  lw  x5, 20(x18)
                  lw  x6, 24(x18)
                  lw  x7, 28(x18)
                  lw  x8, 32(x18)
                  lw  x9, 36(x18)
                  lw  x10, 40(x18)
                  lw  x11, 44(x18)
                  lw  x12, 48(x18)
                  lw  x13, 52(x18)
                  lw  x14, 56(x18)
                  lw  x15, 60(x18)
                  lw  x16, 64(x18)
                  lw  x17, 68(x18)
                  lw  x18, 72(x18)
                  lw  x19, 76(x18)
                  lw  x20, 80(x18)
                  lw  x21, 84(x18)
                  lw  x22, 88(x18)
                  lw  x23, 92(x18)
                  lw  x24, 96(x18)
                  lw  x25, 100(x18)
                  lw  x26, 104(x18)
                  lw  x27, 108(x18)
                  lw  x28, 112(x18)
                  lw  x29, 116(x18)
                  lw  x30, 120(x18)
                  lw  x31, 124(x18)
                  addi x18, x18, 128
                  add x12, x18, zero
                  lw  x18, (x12)
                  addi x12, x12, 4
                  mret

store_fault_handler:
                  add x18, x12, zero
                  lw  x1, 4(x18)
                  lw  x2, 8(x18)
                  lw  x3, 12(x18)
                  lw  x4, 16(x18)
                  lw  x5, 20(x18)
                  lw  x6, 24(x18)
                  lw  x7, 28(x18)
                  lw  x8, 32(x18)
                  lw  x9, 36(x18)
                  lw  x10, 40(x18)
                  lw  x11, 44(x18)
                  lw  x12, 48(x18)
                  lw  x13, 52(x18)
                  lw  x14, 56(x18)
                  lw  x15, 60(x18)
                  lw  x16, 64(x18)
                  lw  x17, 68(x18)
                  lw  x18, 72(x18)
                  lw  x19, 76(x18)
                  lw  x20, 80(x18)
                  lw  x21, 84(x18)
                  lw  x22, 88(x18)
                  lw  x23, 92(x18)
                  lw  x24, 96(x18)
                  lw  x25, 100(x18)
                  lw  x26, 104(x18)
                  lw  x27, 108(x18)
                  lw  x28, 112(x18)
                  lw  x29, 116(x18)
                  lw  x30, 120(x18)
                  lw  x31, 124(x18)
                  addi x18, x18, 128
                  add x12, x18, zero
                  lw  x18, (x12)
                  addi x12, x12, 4
                  mret

ebreak_handler:   
                  csrr  x6, 0x341
                  addi  x6, x6, 4
                  csrw  0x341, x6
                  add x18, x12, zero
                  lw  x1, 4(x18)
                  lw  x2, 8(x18)
                  lw  x3, 12(x18)
                  lw  x4, 16(x18)
                  lw  x5, 20(x18)
                  lw  x6, 24(x18)
                  lw  x7, 28(x18)
                  lw  x8, 32(x18)
                  lw  x9, 36(x18)
                  lw  x10, 40(x18)
                  lw  x11, 44(x18)
                  lw  x12, 48(x18)
                  lw  x13, 52(x18)
                  lw  x14, 56(x18)
                  lw  x15, 60(x18)
                  lw  x16, 64(x18)
                  lw  x17, 68(x18)
                  lw  x18, 72(x18)
                  lw  x19, 76(x18)
                  lw  x20, 80(x18)
                  lw  x21, 84(x18)
                  lw  x22, 88(x18)
                  lw  x23, 92(x18)
                  lw  x24, 96(x18)
                  lw  x25, 100(x18)
                  lw  x26, 104(x18)
                  lw  x27, 108(x18)
                  lw  x28, 112(x18)
                  lw  x29, 116(x18)
                  lw  x30, 120(x18)
                  lw  x31, 124(x18)
                  addi x18, x18, 128
                  add x12, x18, zero
                  lw  x18, (x12)
                  addi x12, x12, 4
                  mret

illegal_instr_handler:
                  csrr  x6, 0x341
                  addi  x6, x6, 4
                  csrw  0x341, x6
                  add x18, x12, zero
                  lw  x1, 4(x18)
                  lw  x2, 8(x18)
                  lw  x3, 12(x18)
                  lw  x4, 16(x18)
                  lw  x5, 20(x18)
                  lw  x6, 24(x18)
                  lw  x7, 28(x18)
                  lw  x8, 32(x18)
                  lw  x9, 36(x18)
                  lw  x10, 40(x18)
                  lw  x11, 44(x18)
                  lw  x12, 48(x18)
                  lw  x13, 52(x18)
                  lw  x14, 56(x18)
                  lw  x15, 60(x18)
                  lw  x16, 64(x18)
                  lw  x17, 68(x18)
                  lw  x18, 72(x18)
                  lw  x19, 76(x18)
                  lw  x20, 80(x18)
                  lw  x21, 84(x18)
                  lw  x22, 88(x18)
                  lw  x23, 92(x18)
                  lw  x24, 96(x18)
                  lw  x25, 100(x18)
                  lw  x26, 104(x18)
                  lw  x27, 108(x18)
                  lw  x28, 112(x18)
                  lw  x29, 116(x18)
                  lw  x30, 120(x18)
                  lw  x31, 124(x18)
                  addi x18, x18, 128
                  add x12, x18, zero
                  lw  x18, (x12)
                  addi x12, x12, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x6, 0x300 # MSTATUS;
                  csrr  x6, 0x304 # MIE;
                  csrr  x6, 0x344 # MIP;
                  csrrc x6, 0x344, x6 # MIP;
                  add x18, x12, zero
                  lw  x1, 4(x18)
                  lw  x2, 8(x18)
                  lw  x3, 12(x18)
                  lw  x4, 16(x18)
                  lw  x5, 20(x18)
                  lw  x6, 24(x18)
                  lw  x7, 28(x18)
                  lw  x8, 32(x18)
                  lw  x9, 36(x18)
                  lw  x10, 40(x18)
                  lw  x11, 44(x18)
                  lw  x12, 48(x18)
                  lw  x13, 52(x18)
                  lw  x14, 56(x18)
                  lw  x15, 60(x18)
                  lw  x16, 64(x18)
                  lw  x17, 68(x18)
                  lw  x18, 72(x18)
                  lw  x19, 76(x18)
                  lw  x20, 80(x18)
                  lw  x21, 84(x18)
                  lw  x22, 88(x18)
                  lw  x23, 92(x18)
                  lw  x24, 96(x18)
                  lw  x25, 100(x18)
                  lw  x26, 104(x18)
                  lw  x27, 108(x18)
                  lw  x28, 112(x18)
                  lw  x29, 116(x18)
                  lw  x30, 120(x18)
                  lw  x31, 124(x18)
                  addi x18, x18, 128
                  add x12, x18, zero
                  lw  x18, (x12)
                  addi x12, x12, 4
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
