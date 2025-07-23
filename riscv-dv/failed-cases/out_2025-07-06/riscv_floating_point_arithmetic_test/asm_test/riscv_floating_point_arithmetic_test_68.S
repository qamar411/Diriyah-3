.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x28, h0_start
jalr x0, x28, 0
h0_start:
                  li x18, 0x40001120
                  csrw 0x301, x18
kernel_sp:        
                  la x6, kernel_stack_end

trap_vec_init:    
                  la x18, mtvec_handler
                  ori x18, x18, 1
                  csrw 0x305, x18 # MTVEC

mepc_setup:       
                  la x18, init
                  csrw 0x341, x18

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x18, 0x3800
                  csrw 0x300, x18 # MSTATUS
                  li x18, 0x0
                  csrw 0x304, x18 # MIE
                  mret
init:             
                  li x18, 4286578688
                  fmv.w.x f0, x18
                  li x18, 4286578688
                  fmv.w.x f1, x18
                  li x18, 3106554171
                  fmv.w.x f2, x18
                  li x18, 2143289344
                  fmv.w.x f3, x18
                  li x18, 2139095041
                  fmv.w.x f4, x18
                  li x18, 2147483648
                  fmv.w.x f5, x18
                  li x18, 3798751273
                  fmv.w.x f6, x18
                  li x18, 2139095041
                  fmv.w.x f7, x18
                  li x18, 106865348
                  fmv.w.x f8, x18
                  li x18, 4986431
                  fmv.w.x f9, x18
                  li x18, 4286578687
                  fmv.w.x f10, x18
                  li x18, 1642820995
                  fmv.w.x f11, x18
                  li x18, 4286578687
                  fmv.w.x f12, x18
                  li x18, 0
                  fmv.w.x f13, x18
                  li x18, 1140437569
                  fmv.w.x f14, x18
                  li x18, 2143289344
                  fmv.w.x f15, x18
                  li x18, 127002519
                  fmv.w.x f16, x18
                  li x18, 0
                  fmv.w.x f17, x18
                  li x18, 2143289344
                  fmv.w.x f18, x18
                  li x18, 4286578688
                  fmv.w.x f19, x18
                  li x18, 2139095039
                  fmv.w.x f20, x18
                  li x18, 933935702
                  fmv.w.x f21, x18
                  li x18, 0
                  fmv.w.x f22, x18
                  li x18, 2147483648
                  fmv.w.x f23, x18
                  li x18, 2147483648
                  fmv.w.x f24, x18
                  li x18, 3369760
                  fmv.w.x f25, x18
                  li x18, 2139095039
                  fmv.w.x f26, x18
                  li x18, 1239023
                  fmv.w.x f27, x18
                  li x18, 2139095040
                  fmv.w.x f28, x18
                  li x18, 2139095039
                  fmv.w.x f29, x18
                  li x18, 2147483648
                  fmv.w.x f30, x18
                  li x18, 0
                  fmv.w.x f31, x18
                  fsrmi 2
                  li x0, 0x80000000
                  li x1, 0xfdbc9e38
                  li x2, 0x80000000
                  li x3, 0xb
                  li x4, 0x80000000
                  li x5, 0xf71b6955
                  li x7, 0x7
                  li x8, 0x28aa6923
                  li x9, 0x0
                  li x10, 0x0
                  li x11, 0x80000000
                  li x12, 0x5054889a
                  li x13, 0x80000000
                  li x14, 0xf727180e
                  li x15, 0xc6b2978b
                  li x16, 0xc
                  li x17, 0x80000000
                  li x18, 0xe31f2b0a
                  li x19, 0x8caf12cd
                  li x20, 0xfbd1876a
                  li x21, 0x0
                  li x22, 0xd
                  li x23, 0xf157b578
                  li x24, 0x8
                  li x26, 0x2
                  li x27, 0x80000000
                  li x28, 0xf506f533
                  li x29, 0x80000000
                  li x30, 0xb
                  li x31, 0x0
                  la x25, user_stack_end
main:             fsgnjn.s     ft7, ft5, fs6
                  fle.s        s0, ft9, fs4
                  fsgnjn.s     ft0, fs0, fs9
                  fmul.s       fa3, fa1, fs8
                  xor          s1, t0, t1
                  slli         t6, s2, 28
                  ori          t4, s6, 2006
                  mulhsu       sp, s11, t3
                  srl          a1, a5, a6
                  fdiv.s       ft1, ft5, fs9
                  slt          a6, ra, s7
                  nop
                  fsqrt.s      fs0, fs11
                  or           s5, a5, a4
                  ori          tp, a6, -1236
                  fclass.s     t0, ft7
                  fsgnjn.s     ft10, fs1, fa0
                  divu         s0, s7, t3
                  srli         s11, t6, 22
                  mul          s2, s6, t2
                  mul          a7, a1, a2
                  fmax.s       fa5, ft10, ft7
                  fsgnjn.s     ft0, fs7, ft9
                  xori         ra, t4, 1512
                  fcvt.s.wu    fs5, a2
                  fdiv.s       fa0, fa2, ft5
                  lui          a1, 160753
                  slt          s3, s10, t0
                  rem          s8, s9, a2
                  rem          zero, s1, a7
                  fmin.s       fs3, fs10, fs7
                  sra          s10, a0, ra
                  fsub.s       ft3, fs10, fs1, rne
                  srl          gp, t0, t3
                  xor          t6, a0, s1
                  ori          gp, t0, -584
                  sra          a3, t0, s0
                  remu         s5, a2, gp
                  sltiu        s2, a3, 663
                  remu         s1, ra, gp
                  remu         t4, s4, sp
                  sub          s3, s5, s9
                  fmv.x.w      zero, ft11
                  fmin.s       fa7, fs5, fs7
                  fsqrt.s      ft4, fa4
                  fmul.s       ft11, ft7, fs1, rne
                  fadd.s       fa6, ft4, fa3
                  srai         s2, tp, 11
                  ori          a3, s1, -793
                  fcvt.s.wu    ft5, s5, rtz
                  ori          a2, s2, -2016
                  div          a2, t4, s7
                  add          s7, a1, s5
                  srli         s0, a3, 14
                  fclass.s     s11, fa0
                  fsqrt.s      ft6, fa3
                  fsub.s       ft0, fs7, fs11, rne
                  fcvt.s.wu    fa5, a3, rmm
                  rem          s8, s1, s6
                  fdiv.s       ft6, fs11, fs2
                  fcvt.s.wu    ft7, a3, rdn
                  fcvt.wu.s    s7, fs0
                  nop
                  sltu         zero, t5, t3
                  div          s3, s0, s9
                  mul          a6, t1, s9
                  mul          s7, t4, a7
                  srl          s1, s5, a2
                  slt          s7, t4, t6
                  fmin.s       ft11, fa1, fa4
                  div          zero, s6, t0
                  auipc        a2, 706466
                  lui          ra, 838068
                  fmin.s       ft10, fa6, fa6
                  mulh         a6, s0, a0
                  lui          s0, 461412
                  nop
                  mulhsu       ra, a0, s3
                  sll          s2, gp, s10
                  srai         s0, s9, 16
                  fsgnj.s      ft9, ft10, fs0
                  slt          gp, a4, a5
                  flt.s        t4, fa1, fs11
                  mul          gp, s6, t0
                  nop
                  fcvt.s.wu    ft10, s2, rdn
                  mulhsu       ra, s9, t4
                  mul          s11, zero, t5
                  andi         tp, a2, 1941
                  mulh         s11, t6, s8
                  srl          s7, s2, s0
                  add          a4, t2, a2
                  sll          tp, t2, a1
                  sltu         t4, a0, s8
                  slt          a3, a7, ra
                  slli         a4, s2, 17
                  fmax.s       fs4, fs7, fa5
                  flt.s        a1, ft9, fa4
                  fsgnjx.s     fa2, fa0, fs6
                  srli         a2, a4, 5
                  fadd.s       fs1, ft0, fs0
                  fmin.s       fs4, fa5, fs4
                  fcvt.s.wu    fs6, ra, rne
                  mulhu        s11, s10, s7
                  fsub.s       ft5, fa6, fa3
                  fmax.s       fs5, ft0, fa5
                  fcvt.s.wu    fs5, t1, rdn
                  fclass.s     a4, fs7
                  fsub.s       fs1, fs9, fa4, rmm
                  nop
                  fmax.s       ft1, fa0, fs0
                  fclass.s     s2, ft5
                  fmul.s       ft5, fs6, fs1, rtz
                  fdiv.s       ft2, fs1, fs6
                  and          zero, a3, s9
                  fcvt.wu.s    s4, ft6
                  slt          a4, s9, s4
                  addi         s7, s11, -493
                  fmv.w.x      fa7, t6
                  remu         s10, t3, zero
                  fle.s        a4, fa1, ft5
                  mulh         t2, s10, s1
                  sra          s5, t4, s6
                  fmul.s       fs4, ft10, ft0
                  rem          t6, a5, gp
                  slti         s1, t3, -1811
                  fsub.s       fa7, fs0, fa1, rmm
                  mulh         s10, s3, a2
                  feq.s        s3, fs3, fs2
                  slt          a4, a1, s5
                  fsqrt.s      fs2, fs2, rup
                  remu         s11, s9, a2
                  fcvt.s.wu    ft7, s10
                  fmv.w.x      ft8, a5
                  xor          t4, s10, t1
                  lui          a3, 735670
                  mulh         tp, a2, t5
                  xori         s0, s10, -591
                  slli         sp, s8, 28
                  sltu         s8, ra, sp
                  fcvt.wu.s    t6, fs8, rup
                  andi         a4, a3, 1399
                  fmv.w.x      ft7, a7
                  div          s2, s3, s3
                  fcvt.s.wu    fs1, s4, rdn
                  mulhu        s10, t5, s7
                  fsgnjn.s     fs9, ft4, fs3
                  sll          s7, s1, s4
                  sltu         t2, s6, a1
                  andi         gp, s2, -96
                  sra          s8, a4, t3
                  remu         zero, tp, t0
                  fsgnjx.s     fs3, fs3, ft6
                  flt.s        a1, ft2, ft6
                  fcvt.w.s     tp, fa2, rup
                  fmul.s       fa1, fa7, ft4
                  remu         t6, tp, t5
                  fsgnj.s      ft11, fs11, ft6
                  srai         zero, s8, 28
                  xori         sp, t0, -379
                  div          t0, s10, t6
                  or           s1, t1, s6
                  addi         zero, sp, 1305
                  srai         a1, t5, 24
                  fcvt.w.s     zero, fa7
                  fmv.x.w      s8, ft11
                  srai         t6, s2, 26
                  add          s8, t4, s10
                  mulh         s5, a4, a1
                  mulhsu       s4, s6, s5
                  xor          a6, a7, s9
                  sra          gp, s11, a1
                  remu         a3, a3, t1
                  fmin.s       fa7, fs11, fs9
                  fcvt.wu.s    s8, fa5, rup
                  srl          zero, a1, ra
                  fmv.x.w      t2, fa6
                  flt.s        t0, ft0, ft9
                  srl          a5, t6, s9
                  remu         a2, a6, t5
                  feq.s        s11, fs8, fs11
                  or           a3, tp, s6
                  or           t6, s1, tp
                  add          t6, sp, t0
                  srli         t6, s7, 30
                  auipc        a1, 146675
                  fle.s        s0, fs9, fa5
                  fcvt.w.s     gp, fa0
                  fcvt.wu.s    a2, ft3
                  or           a5, s7, a5
                  slti         a2, zero, -1649
                  fmax.s       fs5, fa3, fs2
                  div          s6, a0, t2
                  fcvt.s.w     fs8, a6, rdn
                  andi         t4, s3, 1194
                  xor          a6, s0, a6
                  fcvt.s.wu    fa0, t3
                  andi         a4, t4, 830
                  nop
                  div          s10, zero, a0
                  fmax.s       ft8, fa4, fs6
                  xori         a0, sp, -778
                  fmv.x.w      tp, fs5
                  fmul.s       fa4, ft8, ft7, rmm
                  mulh         s6, t5, s10
                  fcvt.wu.s    a2, fs2, rmm
                  fmv.x.w      s3, fs11
                  fadd.s       fa0, fa0, fs8
                  and          tp, gp, t3
                  feq.s        sp, fs3, ft5
                  fsqrt.s      fa2, fs9
                  lui          sp, 927044
                  divu         sp, gp, zero
                  add          a3, s3, t3
                  mul          a0, a5, a7
                  fsqrt.s      ft0, ft2
                  rem          a0, a3, a3
                  lui          t4, 504705
                  sub          s2, a4, t1
                  rem          s1, s1, s2
                  fcvt.w.s     t5, fs3
                  fadd.s       ft1, ft7, fs5
                  srl          gp, s5, t4
                  andi         s6, t4, 16
                  mulh         s3, s7, a4
                  auipc        tp, 886856
                  mulhsu       s11, s10, s8
                  sltu         a4, a3, sp
                  fdiv.s       fs9, ft7, fa1, rup
                  srai         a6, sp, 18
                  fsgnj.s      fa6, fs6, ft4
                  fcvt.wu.s    s7, ft6
                  fsgnjx.s     fs7, fa5, fa4
                  sub          s3, t1, s9
                  and          a2, ra, a4
                  or           a5, a0, a5
                  sltu         s6, s6, gp
                  sltiu        s7, a6, -1600
                  lui          t0, 235985
                  fcvt.s.w     ft4, a5
                  lui          s1, 409493
                  fsub.s       fs6, fa0, fa1, rup
                  fmul.s       ft9, fs3, ft8
                  fcvt.wu.s    s1, fa1
                  srl          t6, a7, s0
                  sll          s6, s11, s9
                  fmv.w.x      fs0, a2
                  andi         s0, a6, 1651
                  xor          s3, a3, s6
                  addi         a7, a3, -796
                  mul          ra, s7, s10
                  fsqrt.s      fs9, fs10
                  fdiv.s       ft5, fa4, ft8
                  divu         ra, s9, a3
                  feq.s        a0, ft0, fs3
                  srai         s6, a6, 8
                  slt          a5, a4, s9
                  nop
                  add          s3, t5, t6
                  mul          a7, s5, a2
                  sltiu        a3, t1, -1250
                  fmv.x.w      sp, fa5
                  slti         a5, a5, -309
                  xori         a5, s10, 446
                  auipc        a7, 349471
                  mulhu        tp, s2, a4
                  sltu         s5, s8, a6
                  slt          s4, a5, zero
                  and          ra, gp, s7
                  remu         t6, t0, sp
                  addi         s10, t1, 1511
                  fsgnjx.s     fs11, fs9, fa6
                  flt.s        tp, ft9, fa6
                  sltiu        a5, t1, 891
                  sub          t0, t2, s3
                  xor          t5, s0, t2
                  sub          tp, a1, t0
                  mulhsu       s1, s7, a5
                  div          s1, s3, t3
                  fmv.w.x      ft3, s7
                  sra          tp, s6, a2
                  and          t4, ra, s7
                  fcvt.s.w     fs5, a2
                  sltiu        a0, t3, -1189
                  fsgnjn.s     fa6, fs0, fs2
                  fsgnj.s      fa5, ft2, fs5
                  mulh         a0, gp, s1
                  fmin.s       fs1, ft5, fa5
                  sltiu        s2, sp, -535
                  xori         gp, t2, -643
                  auipc        s6, 949777
                  mulh         a1, t3, t3
                  mulhu        zero, ra, a3
                  divu         s7, t4, s0
                  auipc        a7, 490577
                  slt          t0, a5, s2
                  slli         t4, s9, 0
                  fmul.s       ft0, fa7, fs9, rdn
                  xori         tp, s0, -1144
                  xori         a7, a5, 1739
                  srl          s2, s6, s6
                  mulhsu       s6, gp, s4
                  remu         a0, a4, s0
                  fmul.s       ft9, fs10, fs2, rmm
                  fmin.s       fs9, fs5, fs9
                  flt.s        s7, fs8, fa4
                  fcvt.s.wu    ft2, t4
                  feq.s        a7, ft10, fs8
                  sltu         s1, t4, t6
                  fsgnj.s      ft3, fs6, ft4
                  lui          zero, 995365
                  fcvt.wu.s    s10, fs9
                  fdiv.s       fs9, fa5, fa0
                  rem          s7, a0, sp
                  or           a5, tp, s4
                  xori         t4, gp, 500
                  and          t4, s11, tp
                  fcvt.s.w     ft6, t1, rne
                  fmv.w.x      ft2, s7
                  mulhu        t6, s8, t5
                  slt          sp, a3, a2
                  lui          a7, 577975
                  fcvt.wu.s    t2, fa2, rdn
                  fsub.s       fa2, fs8, fa7, rdn
                  fcvt.w.s     s4, fs10
                  nop
                  fcvt.s.wu    fs4, s0
                  mul          tp, a3, t6
                  srai         gp, t1, 6
                  slt          gp, s0, s8
                  fmul.s       ft3, fa1, ft6, rtz
                  fle.s        a3, ft4, fa7
                  slti         zero, t0, -931
                  div          a4, a3, t3
                  fsgnjx.s     ft1, ft11, ft7
                  fclass.s     s7, ft9
                  fadd.s       fa3, fa5, fa5
                  flt.s        s5, fs4, ft3
                  auipc        s0, 501342
                  fle.s        sp, fs1, fa3
                  add          a1, t2, t0
                  srli         a5, a0, 7
                  fdiv.s       ft1, fa4, ft8
                  fsgnjn.s     fa5, fs1, fa2
                  fmv.x.w      a2, ft6
                  mulhu        ra, ra, t4
                  fmin.s       fs11, ft4, fa3
                  mulhu        a0, tp, s6
                  divu         t4, s9, a1
                  fadd.s       fa7, ft5, fa6
                  xori         a5, s7, 190
                  mulhu        zero, s9, t5
                  fsgnjx.s     fs1, ft11, ft3
                  sltu         a2, t3, gp
                  fdiv.s       fa5, ft0, fa3
                  fmul.s       fa6, fs4, fa0, rtz
                  fdiv.s       ft4, fs8, fs5
                  nop
                  fclass.s     sp, ft3
                  feq.s        a0, ft9, ft6
                  fmv.w.x      fs11, sp
                  fmax.s       fs10, ft0, fa4
                  fsgnj.s      fa7, fa2, fa3
                  sltu         a1, s9, zero
                  srl          sp, s10, t4
                  xori         zero, s11, -491
                  fcvt.wu.s    s6, fa4, rtz
                  sll          gp, ra, t0
                  fclass.s     s5, fa4
                  mulhu        s5, s7, t6
                  fsqrt.s      ft3, fs3, rne
                  rem          a0, a5, s1
                  andi         t2, a0, 45
                  and          s1, t3, t2
                  fadd.s       fs5, ft0, fs1, rup
                  div          a6, a1, a5
                  auipc        a2, 840849
                  xori         a1, s5, 1938
                  fcvt.s.w     fs0, a6, rdn
                  feq.s        tp, fs5, fs0
                  srli         t2, a2, 18
                  add          s5, ra, a6
                  fcvt.s.wu    fs10, sp
                  flt.s        ra, fs9, fa7
                  and          s2, t0, a5
                  fsub.s       fs0, ft10, ft6, rtz
                  divu         sp, s3, ra
                  fsqrt.s      fa6, ft5
                  fcvt.wu.s    s10, ft6
                  div          t2, a0, t1
                  slt          a2, zero, a0
                  slt          s11, a1, a6
                  rem          a6, t6, t2
                  auipc        s0, 546380
                  or           a6, t2, t0
                  fsgnjx.s     fs0, fa5, fs7
                  or           a6, a5, t3
                  auipc        s7, 304420
                  or           a3, s1, s1
                  xori         t4, s5, -417
                  nop
                  sll          t0, s6, s10
                  fadd.s       ft3, fs9, fa3, rup
                  fmv.x.w      s6, fa4
                  rem          t0, s3, ra
                  fmul.s       ft0, ft2, fs1
                  fsgnjx.s     fs7, fs10, fa5
                  fmul.s       ft8, ft4, fs1, rne
                  fsgnjx.s     ft4, fs9, ft6
                  slli         sp, t4, 30
                  slli         s7, s6, 31
                  remu         s8, s7, t0
                  auipc        a1, 819407
                  fcvt.wu.s    s10, fs11
                  nop
                  fmul.s       fs8, fa0, fs7
                  sltiu        t6, zero, -683
                  and          a5, s8, a5
                  mulhu        s3, s5, a7
                  mulhsu       t4, s4, t3
                  divu         a0, a7, s5
                  xor          s3, t4, s7
                  or           tp, s6, s1
                  ori          s2, a6, -703
                  fsgnjn.s     ft6, fs11, fs7
                  fcvt.wu.s    s5, fa2, rmm
                  slt          tp, a4, s3
                  fcvt.wu.s    s10, ft7, rmm
                  fadd.s       fs11, fs2, ft3
                  div          zero, zero, a7
                  mulhu        a7, tp, sp
                  flt.s        t4, fs10, fa7
                  fsqrt.s      fa0, fs11
                  remu         a1, s2, s10
                  feq.s        t4, fa0, fs4
                  fadd.s       fs0, fa1, ft8, rdn
                  srli         a3, s4, 1
                  slti         a3, a2, 1968
                  auipc        gp, 918219
                  xor          s8, a6, t6
                  sra          a3, s6, a4
                  mulhu        a6, s11, t0
                  slt          a0, a0, t1
                  lui          tp, 839118
                  div          a6, t0, t6
                  sra          s0, a7, t6
                  fmv.w.x      fa4, tp
                  mulh         s6, s11, s7
                  fcvt.s.w     ft2, a5, rup
                  fmin.s       fs10, fs0, ft11
                  mulhu        tp, t5, s1
                  add          t0, s9, a6
                  flt.s        a5, ft1, fs1
                  sra          sp, t0, sp
                  mulhu        a2, a4, zero
                  mulhu        s2, s1, a0
                  auipc        t2, 989141
                  srli         s0, a3, 19
                  sltiu        s1, a3, 1818
                  fcvt.s.w     ft10, t1
                  rem          gp, tp, t4
                  fsgnj.s      fs8, ft6, fa5
                  fmin.s       ft7, fs2, fa1
                  fcvt.s.wu    fs4, s9
                  slli         t0, t0, 28
                  srl          a3, t0, tp
                  lui          a2, 752282
                  fcvt.s.wu    ft4, t2
                  fcvt.wu.s    a2, fa0, rup
                  mul          s5, ra, t0
                  sra          t6, tp, s1
                  mulh         s11, a3, t4
                  fsgnjn.s     ft4, ft7, fs5
                  fsgnjx.s     fs1, ft7, fa6
                  or           s0, s9, ra
                  andi         a4, s5, 771
                  fsqrt.s      fa2, ft1
                  fmv.w.x      fs6, t1
                  srli         s10, s8, 0
                  fsgnj.s      ft7, ft8, fs5
                  fmax.s       fs7, ft5, ft1
                  rem          t2, t4, tp
                  addi         t6, ra, -697
                  xori         a6, s2, -443
                  or           s5, ra, s9
                  slti         s1, tp, 755
                  fmv.w.x      fs5, s5
                  fsub.s       fa2, ft2, ft10
                  sub          a5, s1, t6
                  fcvt.s.wu    fs5, t5, rdn
                  xori         s5, s1, 1670
                  mulhu        a5, a0, t0
                  lui          s7, 820897
                  feq.s        a6, fs9, ft2
                  mulhu        t0, s8, s1
                  slt          a0, s11, sp
                  srl          a4, tp, gp
                  fsqrt.s      fa2, fa2
                  slti         a7, ra, 1421
                  fmv.x.w      a4, fa1
                  mul          s6, s3, t4
                  srai         a5, t2, 12
                  mulhu        zero, t0, s3
                  mulh         s6, t5, t0
                  fdiv.s       fs4, ft7, ft2, rtz
                  srai         a7, s1, 4
                  slli         a6, s7, 7
                  fmax.s       fa5, fs0, fs4
                  fcvt.w.s     a4, ft7, rdn
                  rem          a6, a4, s8
                  srli         tp, a5, 18
                  fdiv.s       ft10, fs1, fa7, rne
                  fmax.s       fa6, fs4, ft8
                  fcvt.w.s     a1, fs8, rup
                  fclass.s     s1, fs2
                  fcvt.wu.s    s7, ft4
                  fsgnj.s      ft4, fs1, fa4
                  fsgnj.s      fa4, fs7, fs11
                  sra          s10, t3, tp
                  ori          t6, tp, 1238
                  divu         zero, s6, t5
                  fdiv.s       ft3, ft6, ft0, rdn
                  mulh         s4, s7, s11
                  lui          s5, 787847
                  fdiv.s       fa4, ft2, fs6, rne
                  flt.s        zero, ft10, fa3
                  fsqrt.s      fs10, ft8
                  sub          a6, a3, t3
                  fmv.w.x      fs0, a5
                  fmin.s       fs3, fa6, fs7
                  nop
                  lui          s2, 658242
                  auipc        s11, 367172
                  remu         zero, s5, a1
                  auipc        s10, 347507
                  fmax.s       fa4, fs5, fs6
                  auipc        a4, 548020
                  slli         zero, t4, 2
                  addi         a0, a5, 1393
                  xor          a3, t0, s4
                  addi         a0, s0, -1763
                  fmv.x.w      s10, ft3
                  feq.s        s6, fa4, ft4
                  sub          t5, s0, a7
                  fdiv.s       fa5, ft5, ft3
                  andi         s10, t1, -1170
                  fcvt.s.wu    ft10, t4, rmm
                  remu         sp, a2, t0
                  fsgnjx.s     fs8, fs5, ft2
                  xori         a6, ra, 765
                  slt          a7, zero, a6
                  fsub.s       ft10, fs0, ft6
                  mulh         s1, a7, a3
                  fsqrt.s      fs0, fs2
                  rem          s7, t6, zero
                  fsgnj.s      ft8, fs2, fs3
                  lui          s11, 506680
                  fclass.s     a6, ft9
                  remu         s10, s9, t4
                  div          t4, t4, s10
                  sra          s0, s3, s0
                  rem          a5, s5, tp
                  add          t4, a0, s10
                  slli         s6, s9, 10
                  mul          s5, a0, s2
                  slti         t0, s10, 917
                  fmul.s       ft5, fs6, ft5
                  or           s4, s0, s6
                  srl          a2, s1, s10
                  or           t5, a5, s1
                  fclass.s     a6, fs8
                  fsqrt.s      fa3, fs8
                  mul          s6, s0, t2
                  andi         t0, s7, -378
                  mulhu        a0, a4, s10
                  srli         t6, t6, 31
                  srl          t6, s11, s3
                  auipc        a2, 133583
                  sub          zero, a4, a7
                  fcvt.s.wu    ft5, s1, rne
                  fmax.s       fs0, fa5, ft9
                  mulh         a6, a5, s9
                  fle.s        a0, fs0, ft8
                  and          t5, t2, a4
                  fcvt.wu.s    zero, fa1
                  fdiv.s       fa3, fs7, ft2
                  fcvt.wu.s    s4, fa0, rmm
                  fcvt.wu.s    s8, fs9, rmm
                  slt          t5, a2, s5
                  or           sp, s9, zero
                  sra          a3, gp, a4
                  slt          t2, t3, a6
                  srli         gp, zero, 15
                  slti         t0, a1, 772
                  sra          s7, s2, s1
                  fcvt.w.s     a3, fs0, rdn
                  fsgnj.s      fs8, ft6, ft8
                  remu         t2, s3, s10
                  auipc        s2, 268216
                  sra          a0, s10, t4
                  fsqrt.s      ft3, ft8, rmm
                  feq.s        sp, fa2, fs11
                  andi         a7, ra, 926
                  mulh         a1, s11, s8
                  fsgnjn.s     fs0, ft0, ft8
                  fsqrt.s      fa5, ft2, rne
                  fle.s        a1, ft1, ft1
                  xori         s3, s10, -611
                  fcvt.wu.s    t5, fs10
                  fdiv.s       ft10, ft2, ft6, rdn
                  sll          tp, s2, s0
                  fdiv.s       fs7, fs3, ft1, rne
                  nop
                  fcvt.w.s     s5, fs9, rtz
                  addi         gp, t6, 1464
                  sll          t0, gp, t1
                  fcvt.s.wu    fa4, ra
                  fle.s        s6, fa1, fa7
                  sub          a1, s9, t6
                  remu         s7, t2, s2
                  sub          t2, t3, gp
                  sll          s5, s2, zero
                  fcvt.s.wu    ft9, s10
                  xori         s0, t3, -627
                  auipc        s6, 957654
                  mulhu        t5, t4, t2
                  fsqrt.s      ft0, ft5
                  mulhsu       gp, a5, s5
                  fsgnjn.s     fs11, fa2, fs9
                  addi         t0, a5, 515
                  sltu         a4, s11, a3
                  fcvt.s.wu    ft4, t3
                  sll          s7, a1, t4
                  fcvt.wu.s    s10, fs2, rmm
                  fcvt.wu.s    a7, ft2
                  addi         zero, s7, -924
                  add          s3, tp, s0
                  fcvt.s.w     ft6, t1
                  flt.s        s3, fs7, fs2
                  srai         s8, t6, 27
                  fsgnjx.s     fs9, ft10, ft5
                  fdiv.s       ft10, ft10, fs2, rmm
                  fcvt.s.wu    fs1, s9, rup
                  div          s10, a7, s8
                  fmin.s       ft3, ft4, fa7
                  fmax.s       fs9, fa2, ft9
                  fmv.w.x      ft3, zero
                  mulhsu       a0, s3, s8
                  fle.s        s3, fs4, ft5
                  slti         sp, gp, 1778
                  div          t0, zero, t2
                  flt.s        s1, ft10, ft8
                  nop
                  fclass.s     tp, fa1
                  lui          gp, 273975
                  xor          s1, s2, a6
                  divu         a6, gp, t4
                  feq.s        s7, ft11, ft4
                  xori         ra, s8, -674
                  fsub.s       fa2, fs9, fs10
                  sub          ra, s9, a4
                  slli         a6, s10, 11
                  fdiv.s       ft0, fs2, fa5, rdn
                  mulh         s1, a1, t3
                  srli         ra, t0, 19
                  and          tp, s8, s8
                  fmul.s       fs1, ft1, ft4
                  fmax.s       fa7, fa2, ft11
                  slti         s3, s5, -230
                  slti         t5, s3, 802
                  mulhu        t2, s11, a5
                  remu         s8, ra, t5
                  feq.s        zero, fa2, ft8
                  add          s2, s11, a6
                  fadd.s       fs1, ft6, fs2
                  fmv.w.x      ft11, tp
                  fsqrt.s      fs0, ft7
                  mulhu        s3, t5, sp
                  sltu         s7, s6, a3
                  flt.s        tp, fs9, fs7
                  nop
                  sra          s6, a2, s11
                  rem          a0, a1, s11
                  srli         a3, s11, 16
                  mulh         s10, s9, s2
                  sub          tp, gp, a2
                  mul          s4, a1, t4
                  fsqrt.s      ft3, fa5
                  fmv.x.w      zero, fs11
                  lui          a3, 516103
                  mulh         s3, s9, a5
                  xor          a4, a4, s2
                  fsgnjn.s     ft8, ft5, fs0
                  ori          a3, s0, -1021
                  fsqrt.s      fa1, ft3, rup
                  fsqrt.s      ft7, fs11
                  remu         a5, t6, s5
                  feq.s        s10, fs8, fs9
                  fmin.s       fs1, ft0, fs2
                  srli         sp, t4, 0
                  fsgnj.s      ft6, fs8, ft3
                  srai         t5, s11, 7
                  mulhsu       sp, s1, s8
                  mulhu        sp, t3, s6
                  fsub.s       ft6, fa6, ft11, rdn
                  feq.s        a7, fs7, fa2
                  xori         a3, s3, -617
                  xori         t2, s4, 249
                  fsub.s       fs2, fa4, fs5
                  sra          s8, zero, a4
                  sll          s4, t4, s9
                  xor          sp, zero, gp
                  xori         s11, a2, 216
                  slt          t6, a3, t2
                  fsub.s       ft4, fa4, fa5, rdn
                  auipc        s2, 1014692
                  add          s3, a3, s3
                  sll          tp, a0, s11
                  srl          zero, t0, s8
                  mulhu        t6, s6, t6
                  or           a2, s0, s5
                  fsgnj.s      fs8, fs5, ft2
                  nop
                  slli         s0, s3, 24
                  mulh         t5, s10, t0
                  slti         t2, s10, 376
                  fsgnj.s      ft8, fs1, ft2
                  fcvt.s.wu    ft11, s6
                  sra          s11, a5, a4
                  srai         t2, zero, 25
                  add          s10, t1, s0
                  div          a7, ra, s4
                  fsgnjx.s     ft7, fs1, ft9
                  add          a6, t1, s8
                  div          s4, a3, sp
                  mul          s5, a7, s0
                  or           a5, t2, s2
                  fadd.s       ft4, ft6, fs3, rup
                  sll          ra, tp, ra
                  xori         s7, a7, 523
                  fcvt.wu.s    a2, fs5, rne
                  srli         a0, zero, 6
                  fmin.s       fs11, fs2, ft0
                  lui          s7, 965092
                  xori         a3, s4, -1028
                  and          s10, t5, a1
                  sltiu        s6, s2, 1146
                  fadd.s       fa6, ft3, fs0
                  or           s1, t6, t1
                  fcvt.w.s     sp, fs6
                  remu         a0, s0, s6
                  fmin.s       ft3, fa2, ft5
                  fmv.x.w      a2, fa6
                  xori         a1, t2, 1250
                  fmul.s       fs7, ft11, ft1
                  fmin.s       ft9, fa2, ft2
                  fmv.w.x      ft2, tp
                  sltiu        t6, t4, -2002
                  fle.s        sp, ft10, ft8
                  srl          s1, a2, gp
                  andi         s2, a7, -51
                  fdiv.s       fs3, fa4, ft3, rtz
                  fcvt.wu.s    a3, fa2
                  sltu         t4, s0, s5
                  srl          t5, s6, a0
                  or           a7, s2, a3
                  rem          t0, gp, t6
                  fsgnjn.s     ft5, fs10, ft6
                  fcvt.s.w     fa4, t6, rtz
                  fsgnjn.s     fs4, fa7, fs7
                  fsgnj.s      ft8, fs1, fs0
                  fdiv.s       fs2, ft11, ft11, rtz
                  andi         s4, s5, 1125
                  fsgnjx.s     fa0, fs9, fs10
                  auipc        sp, 1000463
                  fsgnjn.s     ft6, fa0, fs6
                  fmv.x.w      a6, fs1
                  fclass.s     t0, fa5
                  or           t0, a6, t0
                  fmul.s       fs7, fa7, ft6, rtz
                  or           a5, s0, t1
                  fmin.s       fs6, ft10, ft11
                  srl          s2, gp, s9
                  add          s4, a5, s2
                  srl          a4, sp, s0
                  mulh         s0, s5, a0
                  or           sp, t0, tp
                  addi         tp, s2, -1192
                  fsub.s       fs6, fs1, fa3
                  sra          t4, zero, s10
                  remu         s5, a3, a3
                  slli         t5, sp, 22
                  feq.s        s6, fa1, ft6
                  srai         s8, t5, 8
                  fcvt.wu.s    a2, ft2, rtz
                  fcvt.s.w     fs11, t4
                  fcvt.w.s     gp, fs4, rup
                  mul          a5, s7, tp
                  remu         a3, t1, s11
                  fsgnjn.s     ft1, fa6, ft8
                  srli         s11, t1, 3
                  mulhu        a0, a5, s2
                  slti         t5, s5, -975
                  fsgnjn.s     fs5, fa6, fs8
                  fclass.s     s10, fs2
                  sltiu        sp, s10, -1507
                  fadd.s       ft0, fs3, ft8, rtz
                  xor          s0, s3, a1
                  fcvt.w.s     s3, fs11, rne
                  auipc        s1, 91611
                  mulhsu       a1, t2, s8
                  fdiv.s       fs5, ft7, ft3, rdn
                  fmin.s       fa3, fa5, fs1
                  fcvt.s.wu    fa7, s11
                  sub          s2, zero, t5
                  mulhsu       a4, s10, ra
                  fcvt.s.w     fa1, t5
                  remu         a0, gp, s7
                  auipc        a0, 804272
                  fcvt.wu.s    s6, ft8, rne
                  srai         sp, a5, 12
                  srl          a0, s10, s3
                  fdiv.s       ft9, fs10, fa2, rne
                  nop
                  andi         a7, s11, 84
                  fclass.s     t6, fs1
                  srai         t6, s9, 15
                  mulhu        a2, ra, s8
                  fsgnj.s      ft1, fs0, fa3
                  sltu         a7, t0, s10
                  fsub.s       fa0, fa5, ft11
                  fsub.s       ft1, fa1, ft7, rup
                  sltiu        t2, s1, -639
                  xori         a5, s1, 1101
                  srl          zero, gp, a2
                  div          s5, a1, s10
                  divu         t0, s0, t5
                  xor          ra, zero, a0
                  sltiu        s6, sp, -34
                  sltu         a1, t6, s1
                  fmax.s       fs10, fa6, ft8
                  fsgnjx.s     fs2, fs0, ft3
                  slti         a2, a2, 254
                  fsgnjx.s     fs5, ft8, ft10
                  nop
                  fcvt.s.w     ft5, t5
                  feq.s        a1, fs8, fs2
                  xor          s10, s6, a4
                  addi         t6, s0, -1580
                  fsub.s       ft8, ft3, fs8
                  srli         s3, tp, 5
                  srli         s2, t1, 30
                  slt          t6, t6, zero
                  fsqrt.s      fs8, fs0, rup
                  srli         s10, gp, 24
                  fsgnj.s      fs11, fs8, ft8
                  fcvt.w.s     a0, fa0, rne
                  fsub.s       ft5, fa0, ft10, rup
                  divu         s5, t5, s2
                  fle.s        a1, fa3, fs0
                  feq.s        t0, fa0, fs6
                  fcvt.w.s     tp, fs7
                  fclass.s     s8, fa1
                  fsub.s       fs5, fs10, fa7
                  xori         s1, tp, 1714
                  fmul.s       fs3, fa1, fa1
                  fmul.s       fa6, fa4, ft8, rne
                  addi         a7, sp, -1552
                  feq.s        t2, fa3, ft1
                  fsub.s       fa7, ft0, fs10, rdn
                  fsub.s       fs9, ft2, ft11, rup
                  feq.s        s1, fa3, fa1
                  fsub.s       fa2, ft10, ft5, rne
                  fsgnj.s      fs9, ft6, ft8
                  nop
                  fmv.x.w      t5, ft3
                  srl          zero, s7, s8
                  nop
                  mulh         s10, a3, a0
                  div          a3, t6, s0
                  nop
                  and          zero, t2, sp
                  and          a3, a5, s3
                  ori          s7, t1, 1507
                  fcvt.w.s     ra, fa6, rmm
                  slt          tp, a4, t3
                  andi         s11, a0, -1658
                  mulhu        s7, s11, t4
                  srai         a6, s2, 15
                  fcvt.s.w     ft6, a3, rtz
                  fmin.s       ft4, ft4, ft0
                  fmax.s       fs4, fs10, fs9
                  nop
                  fcvt.wu.s    a0, ft9, rdn
                  sub          t6, s2, gp
                  mulhsu       s0, sp, t6
                  srli         s8, t1, 8
                  fmv.x.w      a1, fs3
                  ori          gp, s5, 144
                  sltiu        a3, a3, 890
                  mulhu        s7, s9, t1
                  srai         a2, a2, 27
                  fcvt.wu.s    a5, fa5
                  divu         sp, a6, tp
                  div          s0, gp, s8
                  sltu         s5, s6, zero
                  andi         s7, ra, -20
                  fcvt.s.wu    ft10, s8
                  fmin.s       ft11, ft8, fs6
                  fdiv.s       ft11, ft11, fs11, rmm
                  fdiv.s       ft6, ft6, ft2
                  fadd.s       fa6, fa2, ft4, rdn
                  mulhsu       a2, a0, t6
                  fle.s        gp, fs9, ft3
                  rem          s10, s1, s9
                  srl          t6, s10, s11
                  slti         a7, s11, -1826
                  ori          t0, s4, 125
                  fsub.s       fa5, fa4, fs4, rup
                  divu         t6, ra, tp
                  sub          t2, a3, t2
                  mul          sp, a5, s8
                  ori          a7, zero, -1134
                  add          s4, t5, a3
                  feq.s        zero, ft6, fa2
                  xori         s7, a1, 631
                  sltu         a1, a2, t5
                  sub          s0, t4, t4
                  srli         a7, s2, 18
                  sltu         s1, a2, t6
                  fclass.s     s11, ft4
                  fcvt.wu.s    ra, fs10
                  slti         a2, t0, 681
                  fsub.s       fs1, ft9, fa1, rup
                  fsgnjn.s     ft11, ft11, fs5
                  slti         s1, s1, -1839
                  auipc        s11, 947892
                  mulh         s0, a1, a2
                  fdiv.s       fa4, fs11, ft4
                  divu         s11, s6, t5
                  slt          a7, a5, a2
                  fclass.s     s3, ft11
                  fsqrt.s      fa6, fs9, rup
                  fsgnj.s      fa7, fs9, fa5
                  fle.s        t6, ft11, fs0
                  auipc        s11, 608368
                  auipc        s6, 228225
                  srli         a4, a1, 17
                  mul          a2, a3, s3
                  fcvt.wu.s    a4, fa2
                  rem          s3, s8, t0
                  feq.s        s5, fa7, fs3
                  xor          a5, a4, s10
                  auipc        gp, 77297
                  fmv.w.x      fa7, zero
                  fadd.s       fs3, fs8, fs6, rdn
                  fsqrt.s      fa1, fa4
                  fmin.s       fs11, fs7, ft9
                  srli         s10, a0, 5
                  fsub.s       ft8, fs8, fa2, rmm
                  srl          s3, s10, s7
                  mul          sp, t3, zero
                  mul          a7, a5, s6
                  fmul.s       fs0, fs10, ft7, rup
                  fmul.s       ft7, fs7, ft5
                  fdiv.s       fa0, fa4, ft3, rup
                  fadd.s       fa2, ft2, ft1, rmm
                  sra          a2, s9, a1
                  fmul.s       fs8, fs2, fa6, rmm
                  sub          s8, s2, s0
                  mul          s1, t5, s4
                  div          t5, s6, t1
                  andi         s8, s6, 466
                  andi         a5, t1, 1612
                  fcvt.wu.s    s4, ft8, rdn
                  slt          tp, t3, s10
                  flt.s        a5, ft6, fs1
                  fcvt.w.s     gp, fa1
                  fsgnjn.s     fs5, fs2, fa7
                  div          s1, s7, a5
                  xor          t5, gp, a6
                  srli         a4, s2, 24
                  fle.s        s4, fs3, ft9
                  fsub.s       fa0, fa1, fa6
                  sltiu        t4, t5, -1583
                  fcvt.wu.s    s5, fs1, rdn
                  fmv.w.x      fa1, a6
                  remu         a6, t1, sp
                  sub          a6, t1, a1
                  sra          s8, s5, s7
                  ori          zero, gp, -168
                  fcvt.w.s     s0, fa4, rdn
                  slti         a3, t4, -693
                  fdiv.s       ft8, fa3, fa6
                  nop
                  fsgnjx.s     ft10, ft6, fs2
                  ori          t4, t2, -1827
                  srai         a4, s11, 23
                  fsgnjx.s     fa6, fa7, fa5
                  or           s6, s2, sp
                  lui          a0, 690597
                  fsgnj.s      ft9, fa4, ft8
                  fsgnjn.s     fs11, ft4, ft9
                  slli         s1, t4, 18
                  xori         s8, s8, -1223
                  srl          t4, s1, s6
                  slt          a1, s5, gp
                  fclass.s     s1, ft7
                  auipc        a1, 544910
                  fmin.s       ft9, fa0, ft6
                  fcvt.s.wu    ft10, a7, rne
                  xori         s11, t3, 708
                  feq.s        t6, fs4, fs7
                  fmv.x.w      a2, ft3
                  srl          t5, a4, s2
                  fcvt.s.w     ft3, t5, rdn
                  fcvt.s.w     fa5, s0, rmm
                  divu         zero, a6, s3
                  mulhu        t2, s2, t3
                  fcvt.wu.s    zero, ft7
                  divu         gp, a1, s7
                  add          a6, s8, t1
                  mulhu        t0, t3, s4
                  xori         s4, t3, 1941
                  srli         t2, t4, 20
                  slli         s11, ra, 20
                  sltu         tp, sp, t0
                  mulh         zero, s7, a6
                  mulh         a4, s8, gp
                  fcvt.w.s     a6, fa4, rmm
                  fcvt.wu.s    s0, ft4, rtz
                  flt.s        t4, fa3, fs6
                  ori          s10, s8, 654
                  slti         a2, a7, -429
                  nop
                  add          t6, s11, t5
                  add          t4, s5, t1
                  flt.s        sp, ft0, fs3
                  fadd.s       ft8, fs10, fa1
                  fcvt.s.wu    ft11, s5, rdn
                  fadd.s       ft9, fs10, fs0
                  mulhsu       s7, t1, sp
                  remu         a4, a7, s7
                  lui          a0, 133822
                  mul          t5, s4, sp
                  flt.s        s11, fs1, fs1
                  ori          s8, zero, 1945
                  fcvt.s.wu    fs11, a1
                  sra          s3, s1, t1
                  slt          s1, s10, s4
                  fsgnjn.s     fa6, ft2, fs6
                  fle.s        a0, fa0, ft3
                  srai         a7, gp, 23
                  fmax.s       fa7, fs4, fa4
                  remu         s2, s9, t0
                  nop
                  fsqrt.s      ft11, fa2
                  mul          s10, t5, tp
                  fle.s        t5, fa2, fs3
                  fmax.s       ft6, fs4, ft10
                  fle.s        zero, fs4, fs2
                  div          s10, s3, t6
                  srai         s1, s5, 26
                  slt          a1, t0, zero
                  fcvt.s.w     ft8, a1
                  fsgnjx.s     ft0, fa4, ft1
                  lui          t6, 251298
                  xori         s2, t3, 1779
                  sltu         t2, s2, s6
                  nop
                  fcvt.w.s     s1, fa2
                  addi         s6, t5, -317
                  sltiu        a5, s7, -1614
                  div          a7, tp, t6
                  fle.s        s6, fs8, fs5
                  fmul.s       fa7, fs8, fa2
                  sltiu        a5, s4, 1305
                  lui          s10, 420948
                  srai         s7, t1, 29
                  srai         t6, tp, 17
                  mul          s1, ra, s10
                  fmv.w.x      ft10, s10
                  srl          s11, t1, t2
                  andi         ra, t3, 1993
                  srl          s5, s0, t6
                  fadd.s       fa5, fa6, fa6
                  slt          sp, t4, gp
                  sub          a7, s10, t5
                  rem          t6, a7, a2
                  fsgnj.s      ft5, ft11, fa2
                  mul          s5, a5, zero
                  sub          ra, gp, tp
                  flt.s        a2, fs2, fs2
                  nop
                  srli         a2, a0, 26
                  srl          zero, a7, t3
                  srl          s5, a5, s9
                  fsub.s       fa1, ft9, fa3, rup
                  fsgnjn.s     fs3, fa2, fs2
                  mulh         s3, t4, s2
                  ori          t2, a1, -1899
                  fmv.x.w      a5, ft4
                  fmax.s       fa2, ft7, fs2
                  fsgnjx.s     fa0, ft10, ft11
                  flt.s        gp, ft0, fa5
                  fcvt.wu.s    s4, ft5
                  fsub.s       ft3, fa3, fs9
                  slt          s10, t0, s0
                  fsqrt.s      ft2, ft9
                  mulhu        s11, gp, a1
                  lui          a3, 575251
                  or           zero, s11, t1
                  div          s7, t3, sp
                  nop
                  fle.s        zero, fa2, ft10
                  mulhu        sp, s4, s8
                  addi         s2, a6, -1043
                  fcvt.s.w     fs8, t6
                  fmv.w.x      ft9, s8
                  fle.s        tp, ft5, fs7
                  divu         tp, s6, tp
                  fcvt.s.wu    fs6, s1, rup
                  fsgnjn.s     fs0, ft10, fs8
                  mulhsu       a1, t4, s5
                  fmv.w.x      ft2, t6
                  srl          s3, s4, s0
                  sltu         sp, t5, s4
                  ori          a2, a7, 195
                  auipc        sp, 534706
                  mulh         a4, s10, s5
                  or           a0, s8, s2
                  or           t6, s2, s0
                  sltu         a6, t5, s10
                  sra          a6, t0, s1
                  andi         t4, s10, 1813
                  mulhsu       s6, s0, s8
                  fadd.s       fa0, ft10, fs2, rup
                  mulhu        s10, s3, s0
                  sub          tp, s8, a5
                  and          tp, a0, s7
                  sra          t6, s10, a1
                  and          t6, s10, a7
                  mulhu        a5, ra, t1
                  fcvt.s.w     fa5, s10
                  srl          a7, s6, sp
                  sub          a3, s7, a7
                  xori         zero, a5, 102
                  fmin.s       fa2, fs7, ft0
                  slt          t5, t6, a6
                  fcvt.s.w     fs6, tp, rup
                  slt          a5, a6, t0
                  slti         a0, tp, 613
                  slt          s8, a5, s9
                  fcvt.s.wu    fs2, a1
                  addi         s5, zero, -1269
                  andi         t6, t6, 1340
                  fcvt.wu.s    s2, fs11, rup
                  srai         t5, s9, 1
                  remu         s5, s0, s2
                  mul          a4, a4, a1
                  and          s8, s6, a3
                  slti         t0, gp, -535
                  mul          s1, a3, s2
                  fcvt.s.wu    fs0, gp
                  fsqrt.s      fa0, ft4, rup
                  divu         zero, t6, t6
                  fsgnj.s      ft9, fa6, ft11
                  fcvt.wu.s    s0, fa5
                  sra          s6, a5, s0
                  fadd.s       fa5, fa2, fa2, rtz
                  div          s1, s4, a2
                  or           s7, a0, t4
                  rem          s11, a3, s5
                  fsgnj.s      fs10, fs7, ft10
                  fcvt.s.wu    fs1, a6
                  srl          s6, s7, s10
                  rem          t5, t3, t0
                  fmv.w.x      ft8, s7
                  addi         s0, t4, -1867
                  fclass.s     a0, ft7
                  divu         s11, s2, t5
                  slt          zero, a0, a6
                  div          tp, s11, t4
                  mul          t0, s5, s4
                  remu         ra, t5, s2
                  mulhu        tp, sp, t3
                  div          ra, s2, s3
                  fcvt.s.wu    fs8, s9, rne
                  sltiu        s0, s9, 502
                  fmul.s       fs1, fs6, fa4
                  sltu         a2, t6, s3
                  fle.s        a7, fa5, fs11
                  mulhsu       a5, t3, ra
                  nop
                  srli         zero, s3, 26
                  fmax.s       ft6, fa3, fa7
                  fmin.s       fs8, fs4, fa4
                  mulh         zero, t1, s3
                  fmul.s       ft2, fa3, fs10
                  mul          tp, t2, s6
                  andi         t5, ra, 793
                  fle.s        t6, fa7, ft2
                  sra          t0, zero, a4
                  fmul.s       ft4, fa4, ft8, rdn
                  nop
                  fmv.x.w      s8, fa3
                  fdiv.s       ft1, fa6, fs3
                  feq.s        t4, ft0, fa0
                  fclass.s     s4, fs5
                  lui          s1, 1004932
                  fdiv.s       ft0, ft0, fa5
                  mulhu        a6, a4, gp
                  sub          s10, a6, gp
                  mulh         a6, a3, s10
                  ori          a3, s7, -1989
                  fcvt.s.w     fa1, tp
                  fclass.s     a2, ft6
                  srl          s8, a2, a1
                  mulhsu       s11, zero, a2
                  mulhsu       a1, s3, a7
                  remu         s4, a4, t2
                  sltu         s2, s2, zero
                  add          gp, s5, t5
                  fmax.s       fs3, fs5, fs9
                  fmv.x.w      t2, ft4
                  fmax.s       fs10, fs1, ft2
                  sltu         s2, s3, tp
                  mulhsu       s6, s11, sp
                  and          s11, a6, t1
                  addi         ra, a0, 1884
                  mul          s1, a2, a5
                  xor          a4, a2, ra
                  fsqrt.s      fa6, fs3, rdn
                  fcvt.w.s     a7, ft4
                  div          s8, tp, ra
                  srli         s3, a4, 23
                  nop
                  sub          a0, t0, s4
                  fsgnjn.s     fa4, fa0, ft8
                  mulhu        a6, a0, t6
                  mulhu        a7, s10, a6
                  fsgnjx.s     fs9, fs4, fs9
                  fcvt.wu.s    a6, ft9
                  addi         gp, t5, 1747
                  and          sp, gp, t4
                  fcvt.wu.s    t2, fa3
                  fadd.s       ft8, fa1, ft8
                  fsqrt.s      ft4, ft9
                  fmax.s       fs11, ft5, fa3
                  fcvt.s.wu    ft7, tp, rdn
                  fcvt.s.wu    fa7, a3, rtz
                  lui          ra, 816560
                  mul          ra, s5, ra
                  mul          s3, s9, s2
                  fclass.s     s4, fa1
                  nop
                  auipc        a4, 784591
                  add          s8, a7, a6
                  add          s10, a3, ra
                  mulhsu       a0, s11, s6
                  slti         ra, a4, -1609
                  sltu         a4, t4, s7
                  fsgnj.s      fs2, ft6, fs3
                  fle.s        a3, ft0, fs8
                  add          gp, a1, s10
                  mulh         a0, a0, t2
                  fadd.s       fs10, fa5, fs9
                  sltu         s11, s11, s2
                  fsub.s       fs5, ft4, ft8
                  xori         t0, ra, -291
                  nop
                  fsgnjn.s     ft4, fs9, ft5
                  or           s8, s5, s9
                  fsgnj.s      ft10, ft0, ft0
                  fcvt.s.w     fs2, a4, rup
                  fcvt.s.wu    ft8, s0, rdn
                  srl          a1, a0, gp
                  fmin.s       ft1, ft0, ft5
                  fmv.x.w      a3, fa4
                  fmax.s       fs3, fa4, fs2
                  mulh         s0, t4, s11
                  fsgnjx.s     fs11, fs8, fs9
                  fcvt.w.s     a6, ft11, rmm
                  mulhsu       s8, t6, t4
                  mulhu        s8, a6, gp
                  xor          a3, s9, s5
                  fsub.s       fs10, fa4, ft6
                  flt.s        s2, ft10, fs1
                  feq.s        s10, ft8, fs5
                  fcvt.s.w     fs9, s10
                  fle.s        s5, fa4, fs9
                  rem          s2, a3, tp
                  xor          s1, s2, s9
                  and          s8, s2, tp
                  fclass.s     a7, fs5
                  divu         s8, t0, t0
                  divu         s3, a0, a7
                  fsqrt.s      fa0, fa5
                  mulhsu       s4, a5, a2
                  fcvt.s.wu    fs8, zero
                  sltiu        a2, a3, 367
                  fmv.x.w      t4, ft1
                  xori         a4, a4, -336
                  slt          s8, s9, s1
                  sltu         s3, t5, t0
                  mulh         s8, s5, s5
                  remu         a6, s6, a5
                  flt.s        gp, fs7, fa0
                  divu         sp, tp, s10
                  fmax.s       fa1, ft10, fs6
                  sub          a6, s1, a6
                  fcvt.s.wu    fs3, a2
                  srl          a3, ra, a2
                  auipc        a5, 464411
                  ori          a4, s9, 1285
                  fsgnjn.s     fs0, fa2, fs3
                  andi         s11, s7, -357
                  sub          a4, ra, a1
                  slt          s0, zero, s11
                  flt.s        a0, fs10, fs10
                  fsgnjn.s     fs3, ft9, ft10
                  fcvt.wu.s    a7, fs10, rup
                  divu         a4, s6, a1
                  flt.s        s6, ft10, fa0
                  fsqrt.s      ft10, fa4
                  andi         ra, s7, 849
                  fclass.s     a7, fs2
                  fsgnj.s      ft10, fs2, fs3
                  fsgnjx.s     fa1, ft9, fs6
                  and          tp, s9, s0
                  or           t2, t3, a6
                  lui          a2, 566312
                  fsgnjx.s     fs10, ft11, fs11
                  mulhsu       s8, s6, a4
                  sll          s5, a7, a7
                  fcvt.wu.s    a7, ft8, rne
                  mulhsu       a6, s7, s3
                  fcvt.s.wu    ft3, s9, rmm
                  sltu         s0, s9, a0
                  fmin.s       fs6, fs4, fs3
                  add          s3, t0, s8
                  xor          zero, s5, s5
                  feq.s        s6, fs0, ft9
                  sll          gp, t2, t2
                  mulh         t2, a3, s8
                  fdiv.s       ft0, ft3, fs8, rup
                  fle.s        a5, fa0, ft10
                  xor          s2, t1, a2
                  fcvt.w.s     s7, ft2
                  srl          a5, s1, ra
                  sra          a7, s2, t3
                  fcvt.w.s     a4, ft9
                  div          tp, s1, t2
                  addi         t5, s2, -1724
                  fcvt.w.s     t4, ft3, rdn
                  slli         t6, t1, 14
                  fcvt.s.wu    fs7, sp
                  mulhu        a6, a0, a2
                  mulhu        t6, s3, s9
                  fle.s        s4, fa1, ft8
                  andi         a6, s1, 433
                  mulhu        s8, s0, a1
                  mulhsu       s10, a1, s6
                  fmv.w.x      fs4, s10
                  slti         s0, a4, 1173
                  div          s5, t1, t0
                  mulh         s11, s2, s5
                  fadd.s       ft4, fa7, fs2, rmm
                  mulhsu       s6, sp, t3
                  sltiu        s3, t4, -1200
                  mulhu        tp, ra, s9
                  sub          s5, s1, t0
                  mulh         t4, s5, s1
                  remu         a0, s4, s1
                  slt          ra, a3, gp
                  feq.s        t2, ft5, fs11
                  lui          t2, 1004081
                  lui          sp, 128968
                  srai         t0, sp, 20
                  fle.s        tp, fa2, fa1
                  andi         a0, s3, -1788
                  fclass.s     a4, ft3
                  nop
                  rem          s0, a6, s7
                  fcvt.s.wu    ft8, s2, rup
                  addi         t0, tp, -1820
                  rem          s10, s4, s8
                  slli         a2, s2, 0
                  divu         s0, a0, gp
                  fmin.s       fa5, fa1, ft6
                  fmul.s       fs8, ft2, fs10, rmm
                  sra          s7, t0, a6
                  slti         s1, sp, 1311
                  mul          t2, s0, t6
                  ori          s6, s5, 1780
                  divu         s0, t4, s7
                  xor          s0, t2, gp
                  ori          s3, a5, 368
                  fcvt.s.w     ft10, a2
                  and          t4, a5, t3
                  fmul.s       ft7, fa4, fs5, rne
                  fmax.s       fa3, fs5, fs6
                  auipc        a6, 19799
                  andi         t2, s3, -299
                  or           tp, t2, s1
                  auipc        s2, 565137
                  fcvt.wu.s    zero, fa1, rtz
                  add          s7, s10, a5
                  addi         s5, s5, 1882
                  addi         a3, s10, -664
                  sltu         s7, s3, s4
                  fmin.s       fa0, fa1, fs5
                  fmv.x.w      t0, fs5
                  fsgnjn.s     ft11, ft8, fa0
                  mul          sp, s8, t5
                  feq.s        s6, fa5, ft8
                  sltu         s7, a0, tp
                  divu         t6, sp, gp
                  ori          gp, s9, -1598
                  fcvt.w.s     tp, fs0, rne
                  fsub.s       fa4, ft2, ft11, rup
                  fcvt.s.wu    ft3, tp, rmm
                  fsqrt.s      ft1, fs9, rdn
                  div          tp, a2, t1
                  divu         s11, t5, s10
                  flt.s        s8, fa3, ft11
                  fdiv.s       ft6, fs8, fa3, rup
                  fcvt.s.wu    fa7, a1
                  remu         s5, a1, t6
                  fsgnjx.s     fs11, fs8, ft11
                  mulhu        a7, a7, s9
                  srl          a1, s1, s5
                  or           s8, s8, s8
                  fsqrt.s      fs6, ft2
                  auipc        t6, 728447
                  fsqrt.s      ft2, fa4, rup
                  lui          sp, 652055
                  div          a6, a5, a0
                  fsgnj.s      fa3, ft8, ft5
                  fcvt.s.w     fa2, a7, rne
                  add          s10, s8, t6
                  xori         a7, t5, 1383
                  fle.s        s4, fs3, ft10
                  fsgnjn.s     fs11, ft10, ft4
                  sltu         ra, t6, t3
                  srai         zero, zero, 7
                  fmv.x.w      ra, ft3
                  slt          s8, t2, t3
                  xori         t2, a1, -668
                  mul          s7, a0, a1
                  slli         t5, a2, 14
                  xor          ra, s11, s3
                  flt.s        a6, fs1, ft8
                  fcvt.w.s     s3, fs8
                  divu         zero, s5, zero
                  fsgnjn.s     fa4, fs8, fa4
                  xor          s2, t2, t4
                  fsgnjx.s     fs1, fs0, fs3
                  slt          t5, t6, t6
                  andi         s6, s10, -398
                  slli         t4, t5, 24
                  sll          s3, s6, a3
                  or           t5, t2, t1
                  srli         tp, s8, 15
                  srli         t5, s2, 13
                  mul          t4, s1, a7
                  sll          a6, a2, t6
                  fsqrt.s      fs9, fa7
                  fcvt.wu.s    s6, fs6, rmm
                  lui          s0, 656309
                  xor          t5, s4, t5
                  flt.s        ra, fa7, fs4
                  fmin.s       fa6, ft10, fs0
                  mulhsu       s0, sp, s11
                  xori         s10, s4, 1052
                  sltu         t6, zero, a5
                  fdiv.s       fs6, ft7, fa4
                  div          s4, t3, t1
                  lui          t5, 842173
                  rem          a6, s6, sp
                  fsqrt.s      fa7, ft3, rup
                  fadd.s       fa7, fs0, fs5, rmm
                  fle.s        s10, fs1, fs2
                  sltu         a6, t5, zero
                  fsgnjn.s     fs10, fs7, fs5
                  auipc        a3, 49204
                  and          s0, s8, s4
                  addi         tp, s1, 1066
                  fmv.w.x      ft10, sp
                  lui          s5, 7894
                  and          t2, t5, a2
                  auipc        ra, 162496
                  fmv.x.w      t5, ft6
                  fsqrt.s      fs11, ft10
                  remu         t2, s3, t6
                  xor          s1, s8, a3
                  xori         s8, s9, 1074
                  sltu         s1, s9, t3
                  nop
                  feq.s        t6, fs10, fa6
                  and          s6, a1, t6
                  sra          sp, s9, s0
                  fcvt.w.s     a1, ft6, rne
                  remu         s11, a4, a6
                  nop
                  slt          s4, a4, s7
                  fcvt.s.w     fa4, a7, rup
                  ori          a2, t4, -847
                  flt.s        gp, fs6, fs6
                  fmv.x.w      s11, ft3
                  fclass.s     a5, ft1
                  fdiv.s       fa1, ft10, fs2, rup
                  xori         tp, t4, -301
                  sltiu        s10, a5, 719
                  auipc        s0, 854330
                  srai         a2, tp, 18
                  andi         t5, s1, -1118
                  srai         sp, s11, 0
                  fadd.s       ft1, ft0, ft11
                  remu         a4, a1, a2
                  nop
                  xor          a7, s7, s9
                  andi         t4, s10, -1610
                  nop
                  fmul.s       fs8, fa0, fs8
                  fcvt.s.w     ft11, tp, rdn
                  feq.s        a5, ft7, ft10
                  fdiv.s       ft2, ft3, fs1, rtz
                  mulhsu       t2, s4, s10
                  srai         t4, gp, 31
                  remu         a7, a6, a7
                  flt.s        s2, fa6, fs2
                  srl          a0, s11, a1
                  remu         t0, t0, s11
                  fsgnjx.s     ft6, fs1, fa6
                  feq.s        a5, fa5, fs11
                  addi         a6, s1, 1555
                  div          s11, sp, t3
                  fadd.s       fs10, ft0, fs3
                  xor          a4, s2, tp
                  sll          s0, s11, t0
                  div          s1, a2, a3
                  feq.s        zero, fa6, fa0
                  fmin.s       fs7, fs4, fa4
                  fcvt.wu.s    t6, fa5
                  srl          tp, a4, a6
                  sll          t6, s8, s10
                  fmin.s       ft8, ft10, ft7
                  fdiv.s       fa0, ft6, fa6, rmm
                  divu         t2, a1, t6
                  mulhu        tp, sp, t5
                  mul          s2, a3, t4
                  fmin.s       fs4, fa3, fs11
                  fcvt.w.s     s7, ft7
                  fcvt.wu.s    s4, fs8
                  nop
                  sub          s4, a6, s8
                  remu         a0, s0, a5
                  fdiv.s       fa2, ft1, fs3
                  xor          t6, t3, t0
                  fmv.w.x      ft8, zero
                  sll          s6, s4, s2
                  slti         a1, s7, -1204
                  mulh         a7, t1, zero
                  fsub.s       ft2, fs5, fs4
                  auipc        t2, 990379
                  addi         s5, s3, 18
                  mul          t6, tp, s1
                  divu         a2, a1, s6
                  fsub.s       fa7, fa6, fa5, rne
                  flt.s        t5, fs7, ft1
                  mulhsu       s1, s5, t5
                  fsqrt.s      ft2, fa4
                  rem          a2, s2, ra
                  fmin.s       fs1, ft3, fa4
                  slli         s1, s3, 18
                  sub          s6, s10, s10
                  fcvt.wu.s    sp, fa4, rmm
                  srl          s2, ra, a1
                  fadd.s       fa3, fs5, fa5, rmm
                  remu         t2, t2, a0
                  srli         a5, ra, 29
                  fmin.s       fs1, fa2, fs0
                  fsqrt.s      ft1, fs5
                  fcvt.s.wu    fs8, a6, rne
                  or           a3, a4, gp
                  fcvt.w.s     t0, ft7
                  flt.s        tp, fs11, ft8
                  fsqrt.s      fa5, fa6
                  mulh         s11, s11, a3
                  div          s10, t1, a4
                  andi         zero, s11, 632
                  fmv.w.x      ft9, a5
                  and          s2, s7, s1
                  and          sp, tp, sp
                  fsqrt.s      fs5, fs2
                  srai         s7, s7, 25
                  mulhu        s1, gp, t5
                  div          t4, s9, a1
                  fmin.s       ft9, ft2, fs6
                  fle.s        s11, fs4, fs10
                  fcvt.wu.s    a4, fa0
                  andi         t2, a3, -1740
                  slt          s8, a6, s4
                  fmv.x.w      s0, fs0
                  lui          s7, 659621
                  div          a2, t5, s1
                  fcvt.wu.s    a2, fs4, rne
                  slti         zero, s0, 51
                  fsub.s       ft5, ft9, fs6
                  fle.s        s0, fa5, ft3
                  mulhsu       s7, t5, t2
                  div          a5, s0, zero
                  remu         s4, a2, a5
                  fcvt.s.w     fs3, s7
                  sltiu        a7, tp, 752
                  auipc        a7, 385194
                  ori          s6, s8, 988
                  sll          s11, s1, t2
                  sra          a3, s7, s5
                  ori          a5, s10, 1302
                  fsgnjn.s     fs1, fs7, ft4
                  fsgnj.s      ft11, ft6, fa7
                  and          a3, ra, a7
                  xori         t0, a1, -657
                  fsub.s       fs2, ft11, fs4, rtz
                  fsgnjx.s     ft11, ft6, fs0
                  fsub.s       fs7, fs2, fs0
                  mulhsu       s4, t6, sp
                  srl          s7, gp, a3
                  srli         s10, s0, 18
                  feq.s        a4, fa0, ft9
                  and          s5, s4, a0
                  fsgnjn.s     ft6, ft7, fa7
                  slt          s8, t4, t2
                  slli         a2, t5, 31
                  fdiv.s       ft2, ft1, fa0, rup
                  fclass.s     s1, fa2
                  fcvt.s.w     fs11, s1
                  sub          a6, s7, tp
                  fclass.s     a6, ft5
                  feq.s        a2, ft0, ft2
                  mulh         a1, a1, a3
                  fcvt.wu.s    sp, ft7, rtz
                  and          a3, gp, t0
                  rem          s0, s6, a3
                  lui          s11, 462026
                  sub          t5, t4, s10
                  or           s4, a4, zero
                  fsgnjx.s     ft1, ft10, fa7
                  fadd.s       fa6, ft6, fs11
                  sub          t5, t1, a2
                  srai         s3, t4, 27
                  fsqrt.s      fs6, ft5, rne
                  fmin.s       fs3, ft9, ft11
                  and          s11, t0, a0
                  fle.s        t0, ft1, fs1
                  srai         t4, tp, 1
                  slt          s11, a1, s9
                  sltu         s2, t0, t1
                  slt          a1, s10, ra
                  mul          t0, t2, s2
                  and          t2, gp, s1
                  slt          s4, a2, a2
                  fclass.s     t0, fs11
                  divu         a5, s4, a5
                  mulhu        a0, ra, a5
                  srli         s6, s4, 12
                  or           s3, a1, s10
                  mulhu        s10, zero, a4
                  mulhsu       sp, s8, t6
                  fdiv.s       ft7, ft4, ft6
                  sra          s7, a2, t3
                  feq.s        a0, fs3, ft11
                  rem          s5, a4, a2
                  divu         s4, s9, s9
                  add          a1, t0, t5
                  remu         s1, a1, a7
                  mulhsu       s10, sp, t3
                  xor          s0, t2, t6
                  fsgnjx.s     fs1, ft7, fa6
                  remu         ra, a7, s2
                  auipc        s2, 739368
                  div          s2, t3, s3
                  fclass.s     s0, fa1
                  fadd.s       fs3, fs11, ft5, rmm
                  fmin.s       ft3, ft8, ft11
                  fcvt.s.wu    ft8, s8, rup
                  slti         a6, t0, 852
                  fclass.s     sp, fs1
                  or           s5, t6, a6
                  auipc        a0, 881921
                  mulh         s4, a4, s1
                  and          t0, zero, gp
                  fmul.s       ft0, ft10, fa2
                  fcvt.w.s     s11, fa6, rup
                  fsqrt.s      fs2, ft10, rdn
                  fsgnj.s      fs8, fs7, ft11
                  lui          t6, 1023545
                  fmin.s       ft6, fs1, fa7
                  sra          s0, a3, sp
                  srli         s7, s6, 7
                  sub          s5, a2, s3
                  xori         t6, s9, -1830
                  feq.s        a0, fa4, ft2
                  sll          ra, t2, s6
                  mulh         a2, a2, zero
                  fsqrt.s      fs11, fs3, rmm
                  lui          zero, 598922
                  slli         t5, zero, 20
                  nop
                  feq.s        t5, fs11, fs2
                  divu         s10, a1, a4
                  rem          a4, s0, s2
                  andi         t2, s6, 937
                  or           s0, ra, t4
                  sltiu        s2, s1, -1626
                  fcvt.wu.s    tp, fs4
                  fcvt.wu.s    s1, fa7
                  nop
                  remu         s2, s5, tp
                  mulh         s4, s7, gp
                  fsqrt.s      fs7, ft3, rmm
                  fmul.s       ft3, fs0, ft3
                  srl          a5, s4, a3
                  feq.s        a2, fs11, fs7
                  fadd.s       fs4, ft5, fa3, rdn
                  mulhsu       s5, a7, t2
                  div          a2, a5, s2
                  fsgnjx.s     ft2, fs8, ft0
                  srli         s3, a5, 25
                  mulh         s10, s10, s3
                  flt.s        s6, fa3, fa6
                  fmul.s       ft7, fs6, fs4, rdn
                  xori         s3, s6, 371
                  mulhu        gp, s11, s3
                  slt          t4, a4, a5
                  add          s10, a1, s3
                  ori          s11, sp, -668
                  fsub.s       fs11, fs2, fa4, rtz
                  sub          a6, gp, t3
                  slt          s0, s8, a6
                  fcvt.s.w     ft7, a7
                  mulhsu       t2, a3, s5
                  sltu         a0, s8, a6
                  fsub.s       ft11, fa7, fa0, rtz
                  xor          zero, s9, a3
                  and          a3, s7, sp
                  mulhu        t4, zero, s7
                  fsgnj.s      fs6, fa7, fs7
                  fle.s        s7, fa2, fs5
                  slti         t4, sp, -695
                  fclass.s     s0, fs9
                  fclass.s     t0, ft7
                  fmv.w.x      fs4, s3
                  auipc        s3, 914990
                  remu         t5, a3, ra
                  rem          a7, t6, s2
                  xor          ra, s2, a6
                  fmin.s       fa7, fs8, ft4
                  or           a1, zero, ra
                  fsgnj.s      fs7, fs5, ft6
                  andi         s2, zero, -1942
                  fclass.s     a2, fs2
                  fmv.w.x      fs11, a2
                  xori         sp, a2, 1894
                  sra          a0, a7, a4
                  fsgnj.s      ft0, ft1, fs10
                  or           a0, gp, zero
                  andi         a5, s1, -1850
                  fle.s        gp, fa1, fa7
                  fsgnj.s      ft3, fs7, ft7
                  sltiu        t6, t5, 149
                  mulh         a1, s1, a1
                  xori         a7, s5, 1783
                  fcvt.s.w     fs7, t1
                  fsgnjn.s     ft7, ft9, fa0
                  fcvt.s.w     fa5, a1
                  div          t6, t6, a3
                  fcvt.wu.s    a6, fs1, rne
                  fle.s        s4, fa2, fs2
                  xor          tp, a2, a3
                  mul          a1, s1, s10
                  divu         s1, t2, s11
                  fle.s        tp, fs3, fa7
                  fle.s        t2, ft9, fa1
                  srai         a6, a1, 4
                  mulhu        a5, a2, s2
                  sll          a0, s1, s2
                  or           t0, s2, a7
                  divu         t4, a6, a0
                  fmv.w.x      fs5, t2
                  fsub.s       ft0, fs4, ft10
                  fmin.s       ft6, fa3, fs3
                  remu         gp, s0, s5
                  flt.s        s11, ft6, fs4
                  fle.s        a0, ft10, fa5
                  and          a3, s6, s0
                  fmin.s       ft11, ft1, fa3
                  srai         s3, a6, 1
                  fsqrt.s      fa1, ft7, rup
                  fsgnj.s      fs8, ft11, fa0
                  srai         a2, t4, 25
                  fle.s        a6, fa0, fs0
                  fdiv.s       ft7, fs1, fa7
                  fclass.s     s2, fs2
                  fle.s        a5, ft2, fs1
                  or           s0, s6, t2
                  fmax.s       ft1, ft6, ft9
                  fdiv.s       fs11, ft0, ft1
                  srli         s8, s11, 3
                  remu         gp, a2, ra
                  div          t2, s6, a0
                  andi         s5, s7, -716
                  fcvt.wu.s    a5, ft2
                  div          s1, t6, ra
                  fmv.w.x      ft10, s0
                  fmin.s       fa1, fs7, ft7
                  andi         tp, s0, 1074
                  mulhu        t5, s2, s6
                  srli         s4, s5, 12
                  srai         sp, gp, 5
                  and          s8, a4, sp
                  fle.s        s4, fa0, fa3
                  slti         gp, s2, -1180
                  addi         a6, t3, -18
                  slt          gp, zero, gp
                  feq.s        t6, ft1, fa0
                  rem          a2, a7, s8
                  ori          tp, ra, 2024
                  fcvt.w.s     s4, ft6, rup
                  nop
                  ori          a4, s3, 1767
                  fmv.x.w      gp, fs5
                  lui          a3, 22591
                  andi         s2, t0, -259
                  sltu         a6, s10, zero
                  mulhu        s3, t0, a2
                  fcvt.s.wu    ft1, s3
                  add          s1, s5, s4
                  sra          a3, gp, t4
                  xori         a6, s3, 1972
                  lui          s1, 729213
                  mulh         ra, s7, t6
                  sra          sp, t4, gp
                  addi         t6, t3, 1839
                  fmul.s       fs8, fs3, ft7
                  div          a2, a1, a4
                  slt          t5, s4, t6
                  or           tp, s8, sp
                  fle.s        a5, ft4, ft7
                  fcvt.s.wu    fa1, s2
                  nop
                  fmul.s       ft10, ft5, fa5, rtz
                  srl          a6, ra, t2
                  fcvt.w.s     zero, fs0, rtz
                  feq.s        s5, fa5, fs5
                  slli         a3, s9, 27
                  srli         gp, t5, 26
                  sltu         sp, s11, t5
                  andi         s6, t5, -1641
                  xor          t6, s8, s5
                  srli         s4, s1, 3
                  add          s2, s8, t2
                  fsub.s       fs3, ft1, ft0, rmm
                  fcvt.w.s     s2, fs4
                  sll          t5, a1, t5
                  add          gp, s11, sp
                  and          s8, s10, a5
                  fcvt.s.wu    fa7, s9, rne
                  fadd.s       fa7, fs7, ft4, rdn
                  fmv.x.w      s1, fs0
                  fmax.s       ft0, fa1, ft5
                  xori         a3, t4, -1290
                  fsgnj.s      fs11, fa4, fa5
                  fsgnjx.s     ft0, ft2, ft0
                  fcvt.w.s     s5, fa4, rup
                  fcvt.w.s     zero, ft10, rmm
                  fmax.s       ft8, fs2, fs0
                  fsgnjx.s     fs1, fs2, fs1
                  fsgnj.s      fa7, fa3, ft6
                  rem          sp, tp, a6
                  fsqrt.s      fs5, fs6
                  fsgnj.s      fa7, fs0, ft4
                  sra          a6, a4, gp
                  fsqrt.s      fs10, ft1, rtz
                  nop
                  fcvt.wu.s    a0, fs7, rtz
                  slt          zero, s6, s7
                  slti         s5, s8, 919
                  fcvt.s.wu    fa2, s10
                  sra          tp, s4, a2
                  mulhsu       s11, t4, t6
                  srli         t2, t0, 15
                  flt.s        a4, fa4, fs10
                  lui          a2, 176551
                  mul          sp, t1, t2
                  fmv.x.w      a5, fa5
                  fsub.s       fs7, ft10, fa0, rmm
                  sll          zero, t6, s10
                  fcvt.w.s     t5, fs0, rdn
                  divu         t4, t0, t6
                  sub          s4, t3, s7
                  fmax.s       fa1, fa6, fs10
                  sra          a3, t3, a7
                  fcvt.s.w     fs4, s4, rne
                  fsgnjx.s     fs2, fs6, ft0
                  slti         s10, zero, 69
                  fcvt.s.w     fs9, t2
                  remu         t4, t6, a6
                  or           t5, t1, t0
                  ori          a7, s10, 167
                  fcvt.wu.s    s4, ft6, rdn
                  srl          sp, t0, a6
                  or           zero, a1, s10
                  fcvt.w.s     s5, fs5
                  srli         gp, s10, 25
                  fmv.w.x      ft0, t1
                  fcvt.wu.s    s3, ft8
                  auipc        t6, 411325
                  fcvt.wu.s    t6, ft1
                  feq.s        a0, fa3, ft6
                  fadd.s       fs7, ft7, fs3
                  divu         a6, s3, s11
                  fsub.s       ft5, fs11, ft1
                  remu         t0, a3, s6
                  sll          s0, a1, gp
                  nop
                  addi         zero, s8, -1384
                  fsub.s       fa2, fa4, fa7, rdn
                  fmax.s       fs6, fs4, ft8
                  flt.s        s7, fa7, fs11
                  slli         s7, t4, 26
                  mul          s3, t3, t6
                  fcvt.s.w     fa5, a0, rup
                  andi         s2, s3, 91
                  sra          s6, t2, s11
                  fmul.s       ft11, ft3, fs8, rdn
                  ori          s11, a3, -1648
                  sra          a1, ra, t2
                  fdiv.s       fs6, fs0, fa0
                  fmv.w.x      fs0, s3
                  add          t6, t4, s8
                  fdiv.s       ft5, fa1, fs1
                  fmul.s       fs11, fa4, fs7, rdn
                  srai         s3, s3, 24
                  fmin.s       fs5, fa7, fa5
                  xor          t6, s8, a3
                  fsgnjn.s     fs8, ft4, ft2
                  flt.s        a0, ft8, fa3
                  fsqrt.s      fs9, ft7, rtz
                  sltiu        sp, s3, -1769
                  fcvt.s.wu    ft0, a5, rtz
                  and          t0, zero, a2
                  fmax.s       ft3, fs4, ft5
                  sra          a7, a2, t6
                  srli         t6, a6, 8
                  fsgnjn.s     fs0, fa5, ft4
                  sll          s6, sp, s0
                  fmax.s       fa0, ft0, fa1
                  div          s1, t4, s0
                  or           gp, s7, zero
                  fmax.s       fa5, fs5, ft11
                  slli         a2, a1, 19
                  andi         s11, a2, 1029
                  srai         a7, a5, 30
                  mulhsu       a5, t5, zero
                  feq.s        s4, ft8, ft4
                  slli         a7, ra, 20
                  addi         a4, s1, -117
                  sltiu        a2, s6, 1937
                  mulhsu       t4, t5, tp
                  sltiu        a5, t6, 724
                  mulhsu       t4, s3, tp
                  fcvt.wu.s    tp, fa4, rne
                  fsgnj.s      fa1, ft1, fa1
                  divu         t2, s11, t5
                  slt          t5, gp, s2
                  fcvt.w.s     s6, fs11, rtz
                  slti         t5, s10, 1949
                  slt          zero, s11, s3
                  rem          s10, s9, s2
                  fsgnj.s      fs11, fs8, ft5
                  mulhsu       t0, a1, s6
                  fadd.s       ft7, ft9, fs10, rtz
                  slti         zero, a5, -1813
                  sub          t0, s0, s10
                  xori         zero, t6, -1768
                  andi         t6, s2, -651
                  fsgnjx.s     ft4, ft1, fs1
                  fsgnjn.s     ft9, ft3, fs9
                  mul          a6, ra, ra
                  or           s6, a5, s1
                  fmv.w.x      ft11, t1
                  fmv.x.w      tp, ft8
                  fle.s        s6, fs3, ft2
                  add          a6, a4, t5
                  fsgnjx.s     ft0, ft3, fs1
                  feq.s        a4, fs8, fs10
                  xor          s2, t1, s8
                  fcvt.w.s     s5, ft0, rup
                  andi         gp, s11, -1131
                  div          s7, s11, t6
                  fcvt.s.w     fs4, a5, rtz
                  srai         s3, s7, 27
                  fmv.x.w      a0, fs3
                  divu         a3, a4, a6
                  addi         s6, s1, -1243
                  srli         s3, t4, 26
                  fmv.w.x      fs0, a6
                  fsgnjn.s     fs7, fs6, fs1
                  div          a7, t3, sp
                  mul          t5, s2, s6
                  xor          s8, s0, a6
                  nop
                  fmv.x.w      a7, fs7
                  andi         a1, t6, 1628
                  addi         a7, s10, 841
                  slti         s4, a6, 1946
                  rem          a3, t2, s7
                  slt          a6, gp, zero
                  fcvt.wu.s    t6, fa1
                  fmin.s       fs6, fa1, fa2
                  fmul.s       fs10, fs10, fa7
                  sll          t2, a0, s10
                  flt.s        t6, fs11, ft3
                  add          s2, s2, t0
                  fsgnjx.s     fa4, ft9, ft1
                  fsgnjx.s     fa7, fs6, ft9
                  fsgnj.s      ft5, ft5, fs4
                  xor          t5, s10, s10
                  fmax.s       fa1, fa0, fs5
                  slli         a3, a3, 21
                  sub          a1, s6, s8
                  mulhsu       a4, a0, ra
                  fmul.s       fs0, ft4, fs2
                  auipc        a3, 948725
                  fsqrt.s      ft3, ft3, rtz
                  sltiu        a3, a0, -1293
                  sltiu        s3, gp, -893
                  or           s4, t3, a2
                  srli         s4, t5, 7
                  flt.s        zero, ft9, fs11
                  fcvt.s.w     fs9, s5
                  srli         a6, a4, 9
                  rem          s5, t6, a0
                  fcvt.s.w     ft6, s10, rmm
                  fcvt.s.wu    ft8, a7
                  fcvt.s.w     fs1, s3
                  slt          ra, a1, a5
                  div          zero, t4, a1
                  fmv.w.x      fa1, a6
                  fcvt.w.s     ra, fs7
                  sra          tp, s9, t5
                  fmv.x.w      a4, ft8
                  fcvt.wu.s    sp, fa7, rtz
                  fadd.s       fs10, fa6, fs2
                  fmul.s       ft1, fs6, ft5, rdn
                  mulhsu       s5, t5, tp
                  div          t2, ra, a3
                  or           a3, sp, s3
                  xor          s10, sp, t6
                  mul          ra, sp, a2
                  ori          t0, a1, -750
                  fsgnj.s      ft7, fs1, ft6
                  fcvt.s.wu    ft9, s0, rne
                  mulh         s6, a2, s4
                  auipc        a2, 774773
                  sub          a4, s10, s5
                  srai         s11, s5, 14
                  addi         s6, t0, 1884
                  fcvt.s.w     fs8, a2
                  addi         s7, t1, 1866
                  fclass.s     tp, fs4
                  mul          a2, t6, ra
                  mulh         zero, s0, s0
                  lui          a4, 354107
                  sub          ra, t1, t4
                  slt          s7, s2, sp
                  srli         s4, a4, 23
                  fmv.x.w      t0, ft4
                  srl          s7, s10, s4
                  flt.s        t4, fs7, fa6
                  fsgnjx.s     ft6, fa0, fa2
                  add          a5, t3, s11
                  rem          s0, s2, ra
                  slli         tp, sp, 20
                  and          a2, s6, s9
                  ori          a2, s9, -1166
                  fmv.x.w      ra, ft9
                  sra          s11, s7, ra
                  sra          gp, s4, t6
                  fcvt.w.s     s10, ft5
                  nop
                  mulhu        s3, s9, s9
                  mulh         s6, s3, t3
                  sll          a4, s2, a4
                  sltiu        a6, s7, -546
                  mul          a3, a5, t4
                  fcvt.s.wu    ft4, zero, rtz
                  ori          s1, t3, 787
                  auipc        t0, 447285
                  mulhu        a2, a7, a4
                  fmv.w.x      fs8, a2
                  fadd.s       fs1, ft7, fa3
                  fmul.s       ft10, fs4, fs7
                  xori         a0, a2, -1369
                  mul          ra, s4, s0
                  divu         sp, s0, s1
                  sltiu        a3, s1, 1945
                  mul          a6, s2, a2
                  andi         a4, sp, 554
                  fmax.s       fa6, fs6, ft6
                  and          t4, a3, t1
                  fmv.x.w      s2, fa1
                  flt.s        s10, ft10, fs5
                  fadd.s       ft8, fa6, fa4
                  rem          t0, s9, a1
                  sub          t4, tp, t6
                  fsgnjx.s     ft10, ft7, ft0
                  sltiu        s1, t0, 759
                  xori         a3, s4, 1224
                  remu         s11, s11, zero
                  fle.s        ra, fs8, ft4
                  fsgnj.s      ft2, ft1, fa2
                  fmv.w.x      ft10, a1
                  slli         s11, s0, 20
                  fle.s        a5, fs10, fa0
                  slt          a6, tp, zero
                  fclass.s     ra, fs2
                  fsgnjn.s     ft6, ft3, ft3
                  or           a1, a0, t5
                  flt.s        t5, ft8, ft3
                  slli         s1, a1, 28
                  mulhsu       a3, s8, s4
                  rem          a5, t6, s2
                  fdiv.s       ft10, ft6, ft11
                  fclass.s     a1, fs10
                  srli         s1, s0, 29
                  fcvt.s.wu    fa3, s7, rtz
                  fcvt.s.wu    fs10, t4, rmm
                  sll          a2, s2, ra
                  andi         a2, a4, 76
                  fmax.s       fs11, fs6, ft0
                  divu         a7, t1, a2
                  fcvt.s.wu    fa4, sp
                  fmv.w.x      ft10, sp
                  andi         s3, a0, -1252
                  remu         s8, a7, s4
                  fmin.s       fs10, fs9, ft9
                  rem          a5, a2, s0
                  remu         s3, a7, t2
                  fsub.s       ft10, fs8, fa7
                  mulhu        s8, t6, tp
                  lui          s0, 261295
                  slti         zero, s9, 1663
                  xori         s8, t6, 118
                  mul          a4, a2, t3
                  or           s4, s6, gp
                  fsgnj.s      ft4, ft8, fs3
                  add          tp, t6, t0
                  div          s8, ra, sp
                  and          s8, gp, s2
                  slli         tp, t2, 30
                  slli         s0, s0, 19
                  add          a2, s9, a0
                  rem          a4, s9, s1
                  fsgnjn.s     ft7, fa0, ft5
                  sltiu        t2, t2, -1402
                  fcvt.s.wu    fa0, tp, rup
                  auipc        s8, 695257
                  fcvt.s.w     fa2, a5
                  xori         s7, a5, -1635
                  slt          s2, a0, zero
                  flt.s        t6, fs5, fs11
                  flt.s        t5, fs8, ft8
                  fclass.s     s7, ft6
                  fcvt.s.wu    ft11, t2, rmm
                  fcvt.w.s     a3, fs8, rtz
                  sll          s8, s5, s0
                  fsgnjn.s     fs7, fa3, ft9
                  mulhsu       zero, a2, t1
                  andi         s5, a1, 1386
                  flt.s        s6, ft1, fa0
                  fmv.w.x      ft11, a1
                  mulhu        ra, s7, s8
                  sltiu        a2, s9, -202
                  fsqrt.s      ft4, ft0
                  fsgnjx.s     fa2, fs11, ft6
                  fcvt.s.w     fa3, a4, rne
                  srl          s7, s8, s0
                  feq.s        a7, fs6, fs2
                  fmul.s       fa4, fs0, ft6, rup
                  fdiv.s       fs11, fa2, fa7, rmm
                  lui          s11, 846302
                  div          a2, a4, s3
                  sra          s3, ra, a6
                  lui          s8, 944310
                  or           t5, t2, tp
                  fmv.x.w      a2, ft7
                  fsgnjx.s     fa0, fa5, fs8
                  fcvt.w.s     gp, fs7, rup
                  mulhu        s4, s5, t0
                  fle.s        t6, fs11, fa4
                  slli         t2, s7, 22
                  remu         zero, s0, s8
                  slt          s2, t6, a0
                  fsqrt.s      fs11, fa7, rne
                  srli         a2, a5, 9
                  sll          t4, s5, t0
                  fmax.s       fa1, ft4, fs1
                  sll          s4, s7, t1
                  fmax.s       fa6, fs7, fs2
                  auipc        a3, 4013
                  fsub.s       ft2, fs0, fa2
                  add          zero, s7, s1
                  sltu         s2, a2, t0
                  slli         s1, a6, 23
                  fsgnj.s      ft5, fa2, ft6
                  mulh         s7, t0, s9
                  mulhsu       s6, a0, sp
                  sll          s3, tp, ra
                  lui          s6, 827328
                  mulhu        s7, t1, a7
                  sra          zero, s6, s1
                  sub          gp, s4, ra
                  auipc        a0, 691008
                  or           s8, s0, s8
                  fcvt.w.s     a0, fs0, rne
                  fcvt.s.w     ft0, a0
                  fmv.w.x      fa1, s1
                  fcvt.s.wu    fs9, s10, rup
                  srl          s4, s10, s8
                  xori         s7, a2, 613
                  slli         sp, t4, 4
                  feq.s        a7, fa4, ft5
                  fadd.s       fs8, fs7, fa6
                  andi         t5, a2, -2029
                  fmin.s       fs2, ft7, ft5
                  srai         s7, t1, 20
                  srl          gp, s11, s5
                  fsqrt.s      fs1, ft6, rdn
                  ori          sp, t3, 464
                  auipc        s4, 114624
                  sltu         s11, gp, zero
                  add          a2, s0, a2
                  mulh         t5, a4, a6
                  fsqrt.s      fa7, fs3, rne
                  add          t6, t4, s6
                  fsgnj.s      fs3, fs3, ft4
                  mul          a1, s5, s3
                  fcvt.w.s     a2, ft8
                  fcvt.w.s     sp, fs2, rne
                  ori          a0, a2, -178
                  fmax.s       fa7, fa2, ft6
                  xori         a0, a6, -1419
                  srai         a6, t5, 7
                  fcvt.w.s     zero, fa6, rdn
                  or           sp, a3, t3
                  feq.s        s7, ft4, fa6
                  andi         tp, t0, -44
                  addi         a7, s3, 672
                  slti         s5, a2, -2036
                  fmin.s       fs9, ft3, ft0
                  and          a0, a5, s1
                  fadd.s       fs9, fa4, fa2
                  sltiu        a0, tp, 1441
                  mulhsu       a3, a2, s7
                  sll          zero, a3, s9
                  div          t2, sp, a3
                  mulhsu       a4, a1, t2
                  sltu         a3, s8, a1
                  slti         s1, a2, 401
                  fsgnjn.s     ft1, ft0, ft11
                  sub          t0, a4, gp
                  fsgnjn.s     ft0, fs5, ft8
                  fcvt.wu.s    a0, fa5
                  fmin.s       ft2, fs8, fa7
                  feq.s        s5, ft7, ft7
                  ori          s8, s3, 219
                  fsgnj.s      fs4, fs7, ft7
                  slti         ra, s0, 11
                  slti         zero, t5, -1367
                  sltu         t2, ra, s8
                  fsgnj.s      fs4, fa7, ft7
                  or           a0, a3, a4
                  slti         t0, s7, 829
                  fle.s        s1, fa7, fa6
                  slti         s0, t1, -1538
                  fcvt.s.wu    ft7, ra
                  flt.s        gp, fs1, fa6
                  srl          s7, s4, s8
                  fsqrt.s      ft4, ft0, rmm
                  addi         t4, a3, -1287
                  fcvt.wu.s    zero, fa7, rup
                  fcvt.s.wu    ft0, t0
                  fdiv.s       fa1, fa7, ft11, rne
                  auipc        s11, 989788
                  slt          s4, a5, s8
                  mulh         a4, s9, a7
                  fle.s        s3, ft8, fs7
                  fsub.s       fa1, fa6, fs2, rne
                  fle.s        s11, fs10, ft10
                  srai         t0, t5, 14
                  slli         t2, gp, 1
                  div          s3, t3, a2
                  sra          zero, t2, a2
                  divu         tp, s7, s1
                  fsqrt.s      fa3, fs2, rmm
                  sra          s3, sp, a1
                  andi         a2, a2, -242
                  mulh         s5, t6, s1
                  flt.s        a3, ft1, fs0
                  divu         s6, t5, s1
                  lui          zero, 445430
                  lui          a4, 328670
                  fcvt.s.wu    ft4, s5, rtz
                  fsqrt.s      fa5, fa6, rup
                  mulhu        s7, t6, t5
                  divu         s4, ra, s4
                  mul          s5, s6, t5
                  slt          t4, a6, a1
                  sub          s7, s11, s5
                  slt          s8, t2, s0
                  fsqrt.s      fs0, ft3
                  sra          s2, a4, s9
                  fcvt.s.w     fa1, s2
                  lui          s2, 245131
                  fmv.w.x      ft7, a1
                  sll          s1, a6, a4
                  fmax.s       fa3, fs3, ft8
                  fsgnjn.s     ft2, fa6, ft5
                  mulhsu       s8, a7, a4
                  fmv.w.x      fa5, t3
                  mul          s4, t3, a5
                  fadd.s       fs11, fa5, ft8
                  fsgnjx.s     fs2, fa4, ft7
                  fadd.s       fa3, ft8, fs1, rup
                  srli         a7, s3, 23
                  fsgnj.s      fs7, fs1, ft0
                  fmv.x.w      t0, fs2
                  and          t6, sp, s0
                  fsgnjn.s     ft8, fs8, fa1
                  fcvt.s.wu    fa6, s7, rup
                  fcvt.s.w     fs8, s10, rdn
                  sra          s4, a0, s4
                  fmul.s       fs11, ft5, fa0, rne
                  sll          t6, sp, t1
                  remu         t5, s2, s2
                  sltiu        t5, s2, -294
                  mul          s5, s1, s2
                  addi         s11, sp, -554
                  add          s1, sp, s11
                  fmv.x.w      sp, fa1
                  slti         sp, s7, 349
                  or           t6, a2, s5
                  sltiu        a7, t3, 1959
                  fcvt.s.w     ft8, a7
                  fdiv.s       ft8, ft0, fa5, rdn
                  addi         a2, a3, 1168
                  xori         a6, gp, 746
                  andi         sp, t1, -215
                  feq.s        a2, fs10, fs0
                  fcvt.w.s     a1, ft11, rne
                  fsub.s       fa4, fa0, ft3, rup
                  fle.s        s6, fa2, fa6
                  sltu         s6, s1, s11
                  fle.s        a2, fa1, fs3
                  remu         ra, a2, s2
                  fmul.s       fa2, fs11, fa6, rtz
                  xor          t4, t5, s6
                  feq.s        a5, fs11, fs7
                  mulh         s6, t5, t2
                  add          a6, a7, a1
                  fsqrt.s      ft1, ft4, rtz
                  auipc        s4, 282852
                  sll          s3, a4, gp
                  fmin.s       ft9, ft4, fa3
                  and          s6, s11, s2
                  srl          ra, a6, a5
                  xor          s3, t0, s1
                  mulh         a6, s11, a2
                  sltiu        a2, a5, -1895
                  div          ra, a4, a2
                  slt          s7, s7, gp
                  slli         s4, s5, 18
                  xori         t5, s9, -1286
                  and          a5, ra, a1
                  flt.s        s8, fs0, fs3
                  fclass.s     t6, fs3
                  fsgnjn.s     fs6, fa7, ft11
                  sub          a4, s0, ra
                  xor          t6, t1, ra
                  fsgnj.s      ft8, fs7, ft10
                  fsgnj.s      ft10, ft7, ft1
                  flt.s        tp, fa6, fs7
                  sra          s11, s7, a4
                  slti         s5, zero, 2030
                  rem          a0, sp, s0
                  feq.s        s8, fs0, fs3
                  fcvt.s.w     ft3, s3, rtz
                  srli         t0, a0, 30
                  fcvt.s.wu    ft11, t4
                  rem          t4, a5, t3
                  sll          s7, t4, a7
                  fclass.s     ra, fa4
                  fsqrt.s      fs3, fs10, rtz
                  andi         a5, a4, -70
                  nop
                  fmin.s       fa3, fs11, ft1
                  srli         s11, t4, 14
                  rem          s1, t1, s0
                  mulh         s4, s3, s9
                  xori         s3, s10, -1054
                  sltiu        ra, s0, 912
                  andi         s4, a2, 761
                  nop
                  lui          a7, 352255
                  or           a5, s1, a3
                  fsgnjn.s     fs9, ft3, fa5
                  fcvt.w.s     s1, ft0
                  fsgnj.s      fa6, fa2, ft3
                  andi         a3, gp, 793
                  remu         t6, ra, a2
                  srli         a1, s10, 2
                  fmv.w.x      fa1, a5
                  fmv.w.x      ft9, zero
                  and          sp, a7, s0
                  fcvt.s.w     ft4, s8
                  fcvt.wu.s    a1, fs0
                  slli         s6, t1, 29
                  fmin.s       ft11, ft9, ft8
                  srl          a1, a2, zero
                  mul          s10, s3, s7
                  fdiv.s       ft11, ft0, fs1, rtz
                  fsgnjn.s     ft11, ft8, ft9
                  fcvt.s.wu    ft3, t5
                  fclass.s     s4, ft4
                  fsgnj.s      fs10, fa0, fs1
                  fmul.s       fs8, ft7, fa4
                  mulhsu       a0, t2, a5
                  fcvt.s.w     fa0, s3, rne
                  or           a0, s7, gp
                  rem          s1, s11, t4
                  flt.s        a3, fs8, fs3
                  fsub.s       fs1, ft8, fs3
                  andi         t5, s2, 1967
                  fcvt.w.s     a4, fa0
                  fcvt.w.s     t2, fa4
                  slli         a0, t2, 13
                  div          t6, s6, s8
                  fcvt.s.w     fs4, s4
                  fcvt.s.wu    fa1, tp, rdn
                  slti         sp, t2, -980
                  fmv.x.w      a3, ft4
                  srai         a1, a6, 22
                  fle.s        a6, ft2, fs3
                  divu         a0, s1, t0
                  srl          s7, s8, ra
                  fmin.s       fs3, ft0, ft6
                  lui          tp, 985304
                  fsub.s       ft3, fa4, ft9, rmm
                  slt          a1, t2, a3
                  feq.s        tp, ft10, ft7
                  add          a1, t4, a3
                  or           a7, t2, ra
                  slt          t2, sp, s7
                  divu         s4, t4, s1
                  fcvt.w.s     a1, fs5
                  fsub.s       fs1, fa7, fs9
                  slt          s2, s4, a6
                  fsgnjx.s     fs3, ft11, ft1
                  fsgnjx.s     fs9, ft0, fs2
                  or           s3, t6, s9
                  fsgnjn.s     ft3, fs4, fs10
                  srli         t2, s9, 22
                  sltu         a4, a5, a2
                  auipc        s2, 630874
                  fadd.s       ft11, fa0, fs10
                  fsqrt.s      ft0, fa7
                  fsgnjn.s     ft5, fa4, ft5
                  and          s0, s3, a1
                  fcvt.wu.s    ra, ft2
                  fdiv.s       ft10, ft3, ft2, rmm
                  mulhu        zero, a1, gp
                  fadd.s       ft7, fs10, ft7
                  xori         s3, a1, 1620
                  add          t2, t3, sp
                  fclass.s     t0, ft3
                  div          gp, s1, zero
                  sub          a1, t0, a4
                  fle.s        s11, fa6, fs6
                  xori         zero, tp, -1487
                  fsgnj.s      fa7, fa0, fa3
                  addi         s4, zero, -531
                  xor          s3, s10, zero
                  fsgnjx.s     fs10, ft3, fs5
                  slt          t0, s3, a2
                  srl          s0, t2, t4
                  fmul.s       fs7, ft2, ft1, rtz
                  mulhu        gp, a2, s8
                  xor          s7, ra, a3
                  fmul.s       ft8, ft9, ft1
                  xori         a7, tp, -1027
                  ori          zero, t1, 953
                  mul          s8, s2, s8
                  fsgnjx.s     fs10, fs6, fs8
                  flt.s        a1, fa5, ft11
                  fmin.s       ft11, fa1, ft11
                  sll          a3, tp, a0
                  xori         t0, t0, 1004
                  feq.s        t4, fa2, fa4
                  ori          s3, a0, -1805
                  auipc        s8, 673797
                  fcvt.s.w     ft3, a1
                  fadd.s       ft7, fs1, fa3
                  add          sp, s11, a4
                  auipc        s0, 646076
                  fmin.s       ft5, fa1, fs4
                  slti         a5, s11, -126
                  fmul.s       ft9, fa7, ft4
                  flt.s        tp, ft11, ft0
                  fmin.s       fa6, fa3, fs2
                  fsgnj.s      fs6, ft7, ft4
                  flt.s        tp, fs6, ft7
                  nop
                  fmv.x.w      s4, fs11
                  or           t5, a6, a6
                  remu         sp, a4, a6
                  slti         gp, s11, 583
                  fcvt.s.wu    fs3, a6
                  ori          a6, t6, 274
                  xori         a0, zero, 343
                  fsgnjn.s     ft10, fa4, fa6
                  or           t0, a6, sp
                  slt          a4, s2, t5
                  slti         s0, a4, -69
                  sra          s6, s3, s10
                  lui          ra, 956433
                  fmin.s       ft0, fs9, fa7
                  lui          a5, 445904
                  add          a5, s6, s10
                  xor          a2, t6, s8
                  fclass.s     a5, fa3
                  remu         a3, s10, s10
                  fadd.s       ft9, ft10, fa3
                  fmin.s       ft8, ft8, ft0
                  lui          s7, 967570
                  srli         a6, a6, 7
                  fsgnj.s      fs2, fa3, fs8
                  mulhu        s11, tp, s0
                  andi         t2, s10, -1915
                  srli         s3, a2, 26
                  xori         a5, t6, -1988
                  mulhsu       sp, s5, t6
                  sub          s8, t0, s0
                  fmv.w.x      ft4, a1
                  srl          s2, t5, t3
                  lui          a0, 833790
                  auipc        s2, 211784
                  divu         ra, tp, s7
                  fmv.w.x      ft7, tp
                  xori         a5, sp, 1362
                  fsqrt.s      fs9, fs5, rne
                  sub          s6, s9, s0
                  fmv.x.w      a2, fs5
                  srl          a4, tp, s6
                  rem          sp, ra, a4
                  xori         gp, s4, -168
                  mulhsu       t6, sp, t2
                  mulhsu       s0, t3, t5
                  fcvt.w.s     s11, fs10
                  div          a4, zero, t3
                  divu         a6, ra, s7
                  sltiu        t0, s9, -1135
                  lui          s4, 372305
                  fle.s        t6, fs0, fa4
                  fmin.s       ft4, ft11, ft11
                  flt.s        a3, ft9, fs0
                  mulh         s4, a0, a6
                  slti         zero, a7, 1613
                  fle.s        t0, fa7, fs7
                  fdiv.s       fs2, fs8, fa6, rtz
                  or           t2, s5, ra
                  rem          tp, t0, s8
                  fsub.s       fs4, fs7, fs0
                  fmul.s       fs8, fs2, fs8, rtz
                  sub          a6, s7, gp
                  divu         sp, tp, s8
                  srli         zero, s7, 15
                  srai         s5, a2, 24
                  feq.s        zero, ft9, ft10
                  ori          zero, s7, 732
                  fmax.s       fa7, fs6, fa2
                  fmv.w.x      fa2, a5
                  fsub.s       fa6, ft6, fs6, rmm
                  fdiv.s       ft10, fa2, ft6, rtz
                  fclass.s     s3, fs4
                  andi         s2, a7, 901
                  fcvt.s.wu    fs1, a6, rtz
                  sra          t5, sp, s1
                  fcvt.s.w     fs3, a1, rdn
                  add          t6, sp, a4
                  fle.s        s5, ft8, fa4
                  srl          sp, s9, sp
                  ori          t5, t0, -1640
                  auipc        s10, 805862
                  fadd.s       fa7, fs0, ft2
                  divu         t6, sp, s1
                  srai         s8, t5, 31
                  sub          zero, s6, s11
                  and          sp, s2, a6
                  srli         s3, s4, 26
                  fmv.x.w      s2, fs1
                  slt          s5, a4, t6
                  srl          t0, s5, a4
                  fsgnjx.s     ft1, ft9, fa1
                  ori          s7, s4, -1395
                  slt          sp, a0, zero
                  fclass.s     ra, fs4
                  slli         s5, zero, 0
                  fadd.s       fs8, fa1, ft6, rdn
                  sll          t5, t6, t0
                  fcvt.w.s     t5, ft1
                  remu         s10, zero, t5
                  fmv.w.x      ft4, tp
                  sll          t4, t0, t3
                  mulhu        s0, a0, tp
                  or           a1, a0, ra
                  fadd.s       fa2, fs5, fs3
                  flt.s        s0, fs1, fa4
                  srl          t5, t3, s5
                  slti         s7, s5, 240
                  fsqrt.s      fa6, fa5, rmm
                  div          a4, t3, t5
                  nop
                  fmin.s       ft10, ft4, ft3
                  sll          t0, s0, tp
                  andi         tp, a5, 1282
                  fle.s        s1, fs9, fa3
                  remu         s6, tp, zero
                  xori         ra, s6, -565
                  xor          s10, a3, a6
                  fdiv.s       fs7, fa2, ft3
                  div          a1, t2, s4
                  fmv.w.x      fs4, s3
                  and          gp, s1, a5
                  mulh         a2, s7, tp
                  fmax.s       fs8, fa5, ft8
                  add          a1, a3, sp
                  fdiv.s       ft1, ft4, fa3, rmm
                  and          t0, a5, s1
                  fmin.s       ft4, fs9, ft5
                  feq.s        a6, ft4, ft11
                  mul          s5, s0, a3
                  or           t0, gp, t4
                  addi         t0, t0, -1748
                  fcvt.s.w     ft3, a0, rup
                  sll          a3, zero, a4
                  fmv.x.w      tp, ft9
                  rem          a6, a0, s3
                  slt          s10, a1, s11
                  fdiv.s       fs5, ft3, ft0
                  fsgnj.s      fs8, fs0, ft11
                  sra          a2, a1, s5
                  lui          s4, 913722
                  mulhu        a0, t2, s9
                  mulhsu       s4, a5, a3
                  fmv.w.x      ft2, sp
                  remu         s4, a5, t0
                  fsgnjx.s     ft2, ft3, fs4
                  divu         zero, zero, t2
                  xor          s11, a5, s5
                  fmax.s       ft10, fa6, fs6
                  slli         a5, a4, 15
                  mulhu        a0, t6, t1
                  sra          t5, a4, a5
                  sll          s2, s4, t3
                  fsgnjx.s     fs9, fs1, fs7
                  rem          a7, s10, t2
                  fcvt.s.wu    ft5, s9
                  addi         a2, s9, -749
                  nop
                  sub          a7, a5, sp
                  sll          ra, s0, t3
                  srai         t5, s10, 26
                  slti         s4, zero, -978
                  fsgnjn.s     ft2, fs4, fs10
                  sltiu        s11, s0, -1196
                  srai         t4, a4, 28
                  fsgnj.s      fs5, ft7, ft10
                  fcvt.s.wu    ft9, s10, rmm
                  fcvt.s.w     ft4, a1, rtz
                  slli         s4, gp, 5
                  fcvt.s.wu    fa4, t6, rne
                  fcvt.w.s     s7, fa6, rup
                  mulhu        a7, s6, a0
                  addi         a5, s6, 1935
                  fsqrt.s      fa6, fa2, rdn
                  srai         a2, t0, 4
                  sltu         t0, s0, s4
                  mulh         ra, s10, a6
                  fmax.s       ft10, fa3, ft5
                  fmax.s       fs10, fs9, fs9
                  fsgnjx.s     fs1, ft7, fs4
                  sub          a4, s5, sp
                  srai         s7, a7, 18
                  fsub.s       ft3, fa7, ft1, rne
                  srl          a2, s7, t3
                  fsub.s       fs1, fs9, ft1, rtz
                  remu         tp, t3, s0
                  ori          s4, zero, 859
                  flt.s        t0, fs2, fs5
                  fclass.s     t4, ft10
                  fcvt.s.wu    fs3, s3
                  fmv.w.x      fs0, s9
                  fmv.x.w      s7, fa6
                  sltiu        tp, a6, 1715
                  fcvt.s.w     fs1, a5
                  fcvt.w.s     s10, ft4, rtz
                  fadd.s       ft1, fs7, fs2
                  lui          s3, 703269
                  divu         a4, s3, s4
                  fsgnjn.s     fa2, fs5, fs6
                  fsgnj.s      ft4, ft1, fa1
                  add          ra, s2, s11
                  fsqrt.s      ft5, fa0, rup
                  mul          s7, a4, gp
                  fadd.s       fa4, fa4, ft11, rup
                  mulhsu       t5, a1, t5
                  srl          s6, a3, s1
                  auipc        t4, 302106
                  andi         a4, t3, -1756
                  srl          s5, ra, sp
                  or           ra, zero, zero
                  xori         s7, a1, -1009
                  fmv.w.x      fa4, t0
                  fmul.s       ft1, fs5, ft9, rne
                  mul          a6, a7, s2
                  flt.s        s1, ft2, fs1
                  addi         s6, a7, 125
                  fsqrt.s      fa7, ft10, rne
                  fmv.w.x      ft10, zero
                  xor          s7, a0, s10
                  fdiv.s       ft4, ft1, fs0, rtz
                  slti         a6, s5, -2030
                  fcvt.wu.s    s5, ft8
                  auipc        s3, 366694
                  remu         s3, a5, a3
                  or           a6, t5, s10
                  mul          a3, a2, ra
                  fsqrt.s      fa6, fa5
                  addi         a1, zero, 718
                  fmv.w.x      ft7, s0
                  srai         s4, s5, 0
                  mulhsu       tp, t0, s6
                  and          s6, s8, s8
                  nop
                  sub          a6, a2, s0
                  mulhsu       a2, zero, a2
                  sra          t2, a6, s6
                  sra          t4, s2, t1
                  nop
                  rem          a2, a3, s3
                  fdiv.s       fs1, ft3, ft0
                  addi         t0, s1, 680
                  mulhu        a2, sp, s2
                  srli         a3, t6, 29
                  sltiu        t5, s10, 1624
                  feq.s        sp, fa5, ft10
                  fdiv.s       fa4, fs9, fa7, rtz
                  fmv.x.w      s11, ft11
                  remu         s7, sp, a2
                  fsgnjx.s     ft9, fs0, fs2
                  fcvt.w.s     t4, ft5, rtz
                  or           s3, a7, a3
                  and          a5, a1, zero
                  fsgnjx.s     fs7, ft4, fa7
                  fmul.s       fa3, fs11, ft5
                  fadd.s       fs9, fa2, fa4, rdn
                  sltu         a6, s8, s10
                  slti         a4, a4, 189
                  fdiv.s       fa6, fa4, ft8, rne
                  remu         a7, a4, s0
                  sltiu        tp, s5, 521
                  add          s0, a7, a2
                  fmv.x.w      s0, ft6
                  auipc        a7, 548169
                  remu         a1, s4, a2
                  ori          tp, t5, -1805
                  mulhsu       a3, t3, t3
                  sra          a1, s1, t4
                  addi         t4, a4, -910
                  nop
                  fsgnjx.s     ft7, ft5, ft5
                  sub          s6, a2, gp
                  div          t2, a7, t0
                  mulhsu       a6, s0, t1
                  feq.s        a5, fa3, ft4
                  fmv.w.x      fs1, ra
                  fmin.s       fa6, ft10, fa7
                  fsgnjn.s     fa5, fa1, fs4
                  or           t0, s6, tp
                  mul          s2, a7, tp
                  divu         s10, t3, s1
                  mulh         s11, a5, t0
                  mul          sp, gp, sp
                  addi         a2, a2, 676
                  divu         s2, t0, tp
                  xori         t5, t4, 430
                  srai         tp, t4, 26
                  fmv.x.w      s0, fa5
                  div          s6, s3, s7
                  sltu         s3, s7, t0
                  fsgnjx.s     fa5, fs9, ft11
                  fcvt.w.s     a0, fa2, rmm
                  sltiu        s1, t0, -1497
                  and          a7, a2, a2
                  auipc        a6, 46329
                  fsgnj.s      fs0, fa5, ft7
                  sub          zero, s1, s2
                  sltiu        s6, t5, -1523
                  fcvt.s.w     fs4, a3, rmm
                  slt          t4, a7, t0
                  mulhu        s3, tp, s7
                  divu         a5, t0, a3
                  sub          a1, a2, t1
                  slli         a1, ra, 9
                  flt.s        t4, fa6, ft9
                  fdiv.s       fa6, fa5, fa1, rdn
                  and          s11, s4, a4
                  srl          a1, ra, t2
                  fdiv.s       ft6, ft7, fa7
                  fmin.s       fs5, fa4, ft6
                  srl          s10, s5, t0
                  feq.s        sp, fs2, fs2
                  fsgnj.s      fa5, fs9, ft9
                  auipc        s10, 681468
                  sra          sp, t5, a5
                  fcvt.s.wu    ft9, t0, rup
                  sltu         s3, t2, zero
                  sll          sp, a5, s3
                  fadd.s       fa6, fs4, fa7, rne
                  fmv.w.x      ft7, s5
                  lui          zero, 57389
                  srl          a1, a5, zero
                  fsgnjx.s     fs4, fs6, fa5
                  slt          s3, a3, a1
                  sub          a3, t3, s5
                  fcvt.wu.s    zero, ft7, rup
                  sra          a2, s10, s9
                  mulhu        a4, t0, s11
                  sra          a6, s4, t3
                  sll          s5, zero, s10
                  divu         s2, t2, ra
                  sltiu        s11, s5, 1001
                  andi         ra, sp, -1788
                  and          a4, s5, a1
                  fclass.s     tp, ft11
                  fadd.s       fs6, fa4, fa5
                  div          gp, s1, s6
                  remu         a7, s9, s4
                  srl          zero, s11, a0
                  fmv.x.w      a6, fa0
                  fsgnj.s      fs2, fs4, ft11
                  and          s11, ra, zero
                  srli         a4, s3, 18
                  fmv.x.w      s5, ft1
                  slti         s10, t0, 909
                  nop
                  remu         ra, t0, a6
                  fmin.s       fs5, ft1, fa4
                  mulh         s3, s1, zero
                  fclass.s     gp, ft0
                  fcvt.s.wu    ft3, ra
                  fmv.x.w      s5, ft6
                  divu         tp, s5, s11
                  xori         a7, s9, 1878
                  fcvt.s.w     ft8, t6
                  ori          a1, s2, 1152
                  rem          s11, s8, a5
                  fsgnj.s      ft10, fs4, fs5
                  sub          s3, a4, a5
                  fmv.x.w      a3, ft2
                  fcvt.s.wu    ft7, zero
                  fsgnjx.s     fs4, fa1, fs9
                  fsgnjn.s     fs0, ft3, ft2
                  fsqrt.s      ft8, ft8, rdn
                  addi         s3, tp, -1544
                  fcvt.s.w     fa0, a5
                  slt          s4, s6, a5
                  divu         t2, s3, t1
                  fadd.s       fs11, fs10, ft4
                  fsgnj.s      ft8, ft8, ft1
                  fsqrt.s      ft3, ft11
                  mulhu        a0, s0, a7
                  srl          t6, zero, tp
                  feq.s        s7, ft0, fa4
                  fcvt.s.w     fa4, t1, rtz
                  sra          a1, s0, t4
                  fcvt.w.s     s4, ft1
                  sll          s8, s0, s4
                  flt.s        a1, fs1, ft8
                  fcvt.s.w     fa3, t6
                  xori         sp, tp, -929
                  fle.s        s1, fs10, fs7
                  slti         s0, s3, -829
                  lui          s8, 33200
                  fsqrt.s      fs4, ft9
                  fmul.s       fs7, ft0, fa0, rdn
                  or           a7, a7, a0
                  fmax.s       fa0, fs7, ft10
                  sltiu        s0, a6, 123
                  sltu         a1, a1, a0
                  sltiu        sp, a6, 1608
                  fadd.s       fa0, ft7, fs3
                  fmul.s       fs3, fs5, ft0
                  feq.s        t4, ft5, fs10
                  fle.s        t4, fa4, fa2
                  fcvt.s.w     fs6, s2, rne
                  fcvt.w.s     s4, fs11
                  xor          a2, s0, a7
                  sll          a1, ra, ra
                  fcvt.s.w     fs4, t6, rtz
                  slti         ra, t2, 785
                  slt          s1, s11, s8
                  fcvt.s.w     fs6, s2
                  rem          zero, a0, a5
                  mulh         zero, s7, s8
                  sub          s2, a6, a7
                  addi         t6, t6, -395
                  mul          s8, ra, s7
                  slti         t2, t0, -83
                  auipc        s5, 855972
                  flt.s        s2, ft0, fs3
                  sltiu        s11, s11, -1258
                  xori         a3, s2, -1460
                  auipc        s11, 856949
                  srli         s4, gp, 21
                  fmin.s       fa7, fa3, fs2
                  fcvt.s.w     ft9, s6, rne
                  xor          t4, a0, a5
                  mul          s10, s7, s7
                  fdiv.s       ft10, fs5, fa0, rup
                  slt          t2, t0, t0
                  fsgnj.s      fs4, ft4, fs10
                  fmv.w.x      fs6, gp
                  mulhu        s10, s0, a1
                  srl          a0, t3, a2
                  fdiv.s       ft4, fs2, fs8
                  and          s7, a5, t0
                  fcvt.s.w     fs1, s4, rup
                  rem          t5, t6, a4
                  div          s7, a5, gp
                  fadd.s       fa1, ft3, fa4
                  fmv.w.x      fa2, s7
                  fcvt.s.w     ft0, s4, rup
                  sra          sp, a6, a7
                  fmv.w.x      fa7, t0
                  ori          s10, s9, -1912
                  ori          s10, s0, 715
                  slli         s8, a3, 28
                  andi         a3, a1, -136
                  flt.s        a3, fa1, fs6
                  sll          s0, a3, s7
                  fclass.s     t6, fa6
                  sll          sp, s2, s4
                  lui          s4, 672021
                  fsgnjx.s     fs0, fs7, ft6
                  addi         s10, s3, -40
                  slli         sp, s10, 29
                  divu         a7, sp, s0
                  sll          gp, s10, s10
                  slti         ra, t1, -206
                  fsgnjn.s     fa4, ft9, fs5
                  addi         tp, a0, -1454
                  fmv.w.x      fs8, a2
                  fmv.x.w      t6, fs8
                  fmax.s       fs8, fs9, fs2
                  slti         tp, tp, 1447
                  xori         t2, s4, -1388
                  auipc        t2, 161747
                  srai         a3, t6, 9
                  fclass.s     t0, fs9
                  sltu         a0, ra, t5
                  mulhsu       s0, s0, s3
                  srl          t0, t2, t6
                  fdiv.s       fs6, ft0, ft11, rdn
                  sltu         gp, a0, a5
                  xori         a7, s7, -396
                  fmax.s       ft1, ft1, fa7
                  andi         a4, t3, 603
                  divu         a7, s9, a3
                  sltiu        a3, s0, 717
                  or           a1, t6, a6
                  srli         t5, t4, 14
                  mulh         zero, sp, t0
                  fsgnjx.s     fa1, ft7, fs9
                  fmv.x.w      s0, ft0
                  fcvt.wu.s    a1, fa0, rne
                  mulhu        s5, a1, s7
                  fcvt.wu.s    sp, fa3, rtz
                  fcvt.s.wu    fs2, t1
                  fsgnjx.s     ft4, fs11, fa0
                  ori          s11, zero, 1708
                  sra          a5, t4, a7
                  fadd.s       fa2, ft3, ft6, rtz
                  slli         s3, s4, 7
                  divu         s11, a3, t4
                  remu         s4, t6, a2
                  slt          sp, s7, s10
                  div          t6, a4, tp
                  slt          s10, a6, s9
                  lui          s2, 689772
                  flt.s        s8, fs10, fa1
                  mul          a3, s5, t1
                  srai         zero, a3, 28
                  andi         t6, s11, 31
                  slt          a6, a0, s1
                  mulhu        a7, s3, s2
                  fmv.x.w      t0, fa2
                  sra          sp, s1, t0
                  fcvt.wu.s    a3, fs3
                  lui          s0, 991705
                  flt.s        t2, fa1, fa0
                  slt          s11, s11, t1
                  or           s8, zero, gp
                  or           s0, sp, s8
                  sll          a1, s0, a0
                  fcvt.w.s     s3, ft4
                  lui          t0, 203665
                  fdiv.s       ft8, ft1, fs2
                  fsub.s       ft8, fs2, fs2
                  slli         a6, s0, 15
                  fdiv.s       ft9, fa7, ft0, rne
                  sub          a3, a3, a6
                  fsgnjn.s     ft0, fs5, ft10
                  fmv.w.x      ft0, s0
                  sub          a1, s8, a3
                  flt.s        s2, fs11, fs6
                  fmax.s       fs4, ft5, ft0
                  mulhsu       tp, zero, sp
                  remu         s4, s7, a0
                  fmv.x.w      s8, fs1
                  mulhsu       zero, t1, a1
                  fsgnjx.s     fs8, fs7, fa0
                  mul          s10, a1, s0
                  auipc        sp, 31785
                  xor          t4, a5, t3
                  mulhu        s10, a7, sp
                  fsgnjx.s     ft9, fa3, fs5
                  fcvt.w.s     a0, ft11
                  sltu         s4, ra, s3
                  add          a1, a2, s8
                  fsqrt.s      fs1, ft0, rmm
                  fcvt.s.wu    fs10, a2
                  fcvt.s.wu    fa4, s1, rne
                  fmax.s       ft1, fs9, fs2
                  divu         tp, a1, t4
                  fcvt.wu.s    a2, ft0, rup
                  sltiu        s5, sp, 2031
                  fmul.s       fs7, ft2, ft9, rup
                  slli         t6, a0, 4
                  slti         t2, a2, -1350
                  fmin.s       ft5, ft9, fs8
                  or           sp, s1, s8
                  ori          a1, s6, 333
                  xor          s7, s9, sp
                  or           s8, t4, a0
                  mulh         a7, t3, s2
                  fmv.x.w      a3, fs4
                  fmin.s       ft4, fs1, fa7
                  div          t0, a2, t5
                  auipc        t4, 890659
                  remu         tp, t0, zero
                  or           a6, t3, t4
                  fmv.w.x      fs7, t5
                  addi         tp, a1, 2024
                  xori         tp, t5, 884
                  fsgnjn.s     fa4, fs7, ft5
                  fmax.s       fs3, fs7, fs7
                  rem          t4, t3, a4
                  fmul.s       fs10, fs3, fs1, rtz
                  fmin.s       fa5, ft6, fs10
                  flt.s        gp, fa7, fs5
                  add          tp, a5, s4
                  sltu         t0, s3, a0
                  nop
                  slli         s0, gp, 20
                  mulh         a7, a4, t4
                  fdiv.s       ft5, fs3, fs3, rdn
                  fle.s        a0, ft8, ft4
                  mul          a4, t6, zero
                  div          s10, a3, a6
                  mulhsu       ra, s2, a1
                  remu         a5, s1, a1
                  xor          t4, t4, s4
                  rem          s11, s1, a0
                  fmv.w.x      fa7, s3
                  fsqrt.s      ft8, fa1
                  fsgnjn.s     ft8, fa2, ft7
                  andi         s0, t3, 118
                  fsgnjn.s     fs6, ft10, ft11
                  divu         zero, tp, s8
                  fcvt.wu.s    t0, fs8
                  fmv.x.w      ra, ft0
                  lui          s2, 334548
                  nop
                  addi         s11, a2, 857
                  fadd.s       fs5, fa3, fa4
                  add          t2, s0, sp
                  fadd.s       fa4, ft11, fa4
                  auipc        a5, 14933
                  fmul.s       ft2, fs2, fa4
                  auipc        a1, 647257
                  fcvt.w.s     s11, fa3, rdn
                  div          a0, s8, sp
                  slli         t4, t4, 26
                  fsub.s       fa5, fa7, fa0
                  flt.s        a6, fs3, fs11
                  fcvt.wu.s    sp, fs4, rdn
                  fsub.s       fs6, fs2, fa6, rdn
                  fcvt.w.s     s8, fs5
                  feq.s        a0, fs6, fa3
                  xori         t2, s5, -871
                  fmv.x.w      a2, fa7
                  fmv.w.x      ft3, a4
                  remu         gp, a3, a6
                  lui          s7, 29307
                  auipc        t5, 822219
                  ori          s11, t2, 1033
                  mulhsu       t0, t3, t6
                  fmul.s       ft4, fs9, fs4
                  fcvt.w.s     s5, ft6
                  fcvt.wu.s    s2, fs4, rdn
                  fmax.s       ft3, fa7, ft2
                  ori          ra, s1, -336
                  fmin.s       fs2, ft3, fa7
                  srl          tp, s0, s9
                  addi         a6, s0, -266
                  fsgnjn.s     fa3, fs9, ft2
                  fcvt.s.wu    fs2, tp
                  fmin.s       ft6, ft1, fa6
                  fcvt.s.wu    ft9, zero, rtz
                  sll          s1, t2, t5
                  divu         s2, t2, s8
                  fmul.s       fa2, fa7, fs2
                  remu         t4, s0, a0
                  fsub.s       fs6, ft3, fa6, rtz
                  fcvt.s.wu    fs11, t5
                  xori         t0, s7, -1080
                  mulhsu       t0, t2, s0
                  xori         s10, t6, -320
                  add          s1, s5, zero
                  fclass.s     t0, fs0
                  fmul.s       fs9, fs6, fs6, rup
                  auipc        a0, 582491
                  rem          ra, t3, a6
                  fmin.s       fs6, ft4, ft2
                  fcvt.s.w     ft11, s5
                  feq.s        t0, fs5, ft2
                  nop
                  andi         gp, tp, -1476
                  slt          s4, a0, gp
                  fcvt.w.s     t4, ft1
                  srl          a4, s4, s11
                  mulhsu       ra, t1, ra
                  andi         s4, t2, 1344
                  srl          a6, a4, a5
                  sra          s7, a0, s4
                  nop
                  fmv.w.x      ft3, t1
                  fmin.s       ft10, fa1, fa7
                  fsgnj.s      fa1, fa1, fa3
                  slti         a6, t4, 913
                  flt.s        a0, ft10, fs3
                  srl          s3, s1, t5
                  flt.s        s5, ft0, ft7
                  mulhsu       a2, s2, s8
                  fcvt.s.wu    ft8, s11, rup
                  div          t6, s4, ra
                  fsgnjx.s     fs1, ft4, fs0
                  slt          gp, t1, s0
                  and          sp, s2, t0
                  fmv.x.w      s10, ft5
                  srli         s7, s10, 11
                  fcvt.wu.s    s6, fa3, rtz
                  mulhsu       s10, s9, t5
                  auipc        s2, 40070
                  srli         t5, a1, 27
                  fmin.s       fs7, ft6, fs4
                  fcvt.w.s     t5, fs3
                  fcvt.s.w     fs4, s0, rne
                  fclass.s     sp, ft3
                  fmax.s       fs3, fa6, fs7
                  add          s4, ra, s6
                  srli         a5, s1, 16
                  fdiv.s       fa3, fs10, fs1
                  fmax.s       fs2, ft2, fs5
                  fcvt.wu.s    ra, ft6, rtz
                  fle.s        t2, fs3, fa0
                  fmv.w.x      fa5, t0
                  slli         s7, s1, 27
                  mulhsu       t4, ra, sp
                  add          a7, tp, s9
                  fcvt.wu.s    s8, fa5, rne
                  divu         ra, a7, a5
                  fsub.s       fs0, fa4, fs5, rmm
                  fsub.s       fa4, ft5, ft6
                  fmax.s       ft9, fa7, fa1
                  mulhu        sp, a2, t3
                  fmv.x.w      s3, ft1
                  srli         a1, a5, 20
                  andi         s4, s6, -1223
                  addi         gp, s2, -1030
                  fcvt.s.wu    ft2, s0, rne
                  srli         s10, t3, 23
                  mul          s5, t5, gp
                  fsgnjx.s     fa4, fs7, fs4
                  sltu         s8, s7, a0
                  fmv.x.w      s8, ft9
                  sll          a4, a4, a5
                  fsgnjn.s     fa7, ft7, fs3
                  sll          t2, sp, s9
                  sltu         ra, s1, sp
                  slli         sp, s4, 5
                  sltiu        sp, a4, 633
                  fmv.w.x      ft9, ra
                  fmax.s       fa0, fs3, fa2
                  rem          s6, t3, t4
                  ori          ra, s4, -1837
                  srl          t6, s1, t5
                  div          a5, a6, s11
                  feq.s        s7, fs11, fa2
                  rem          s6, t1, s1
                  sltiu        s8, s7, 1410
                  ori          s6, s4, 477
                  flt.s        a3, fs10, ft2
                  rem          a7, s2, s4
                  fcvt.s.wu    fs10, zero
                  mul          ra, tp, s0
                  fsqrt.s      fa1, ft0, rup
                  fcvt.w.s     t0, fs0
                  divu         a1, ra, a0
                  xori         s8, a6, 880
                  fcvt.s.wu    ft7, t4
                  srli         t0, a0, 22
                  ori          sp, a3, -914
                  xor          t5, a4, a7
                  and          s1, a3, a7
                  slti         a5, a6, -6
                  divu         t4, s11, tp
                  fsqrt.s      fa4, fa4, rup
                  fmin.s       ft6, ft7, ft4
                  slt          a1, t3, a6
                  or           s5, t4, a5
                  srai         s6, a2, 28
                  sra          t2, t6, a2
                  ori          a0, s6, -70
                  feq.s        t6, fs0, ft9
                  slti         s4, zero, 1294
                  and          t2, t2, a3
                  nop
                  fadd.s       ft10, fs4, fs8, rne
                  fadd.s       ft10, fa6, fa6, rne
                  fdiv.s       ft1, ft8, ft9, rdn
                  rem          s3, s4, sp
                  fcvt.w.s     t5, ft9
                  feq.s        a0, fs6, ft10
                  xor          s7, s11, s0
                  fle.s        s6, ft11, ft9
                  fclass.s     s1, fs0
                  fmax.s       ft7, ft11, ft11
                  and          a1, s10, a6
                  ori          tp, t6, -1678
                  slti         gp, t6, -1518
                  fcvt.s.wu    ft1, s8
                  fsgnj.s      fs9, fs5, ft1
                  div          a2, s6, s2
                  fcvt.s.wu    fs3, t3, rmm
                  mul          s3, tp, t4
                  xori         s4, a6, 220
                  srl          t4, sp, s7
                  xori         tp, a6, -778
                  sra          a3, a3, tp
                  flt.s        s11, fa3, ft6
                  fcvt.s.wu    fs4, a5
                  sub          s3, t6, t3
                  mul          a6, s8, s7
                  sll          a0, t5, s3
                  fmul.s       fa3, fa4, ft11, rup
                  remu         s4, s8, s10
                  sra          a5, t2, s8
                  fcvt.s.wu    fa5, a7, rdn
                  fcvt.s.w     fs9, a3
                  add          ra, t6, s8
                  sltu         s5, a6, ra
                  fdiv.s       fs8, fa1, fs0, rup
                  lui          a2, 1007486
                  div          s7, s2, t2
                  fmv.x.w      a1, fs8
                  srli         ra, s11, 28
                  fdiv.s       ft11, fs2, fs4, rdn
                  fdiv.s       fs3, fs6, fs6, rup
                  addi         gp, a7, -1712
                  mulhu        s7, t1, t1
                  srl          s7, s3, a3
                  add          a4, s9, a4
                  sra          s0, a2, s0
                  fmul.s       fa4, ft5, fs2, rup
                  fadd.s       fs8, ft8, fs7
                  fmv.x.w      ra, ft9
                  sub          tp, s8, t2
                  mulhu        a3, t4, s7
                  rem          t4, s10, s10
                  slt          sp, t1, tp
                  div          a6, s0, a2
                  fmax.s       fa6, fs1, fs0
                  or           a3, a3, t4
                  fmul.s       fs4, fa6, ft0
                  fadd.s       fa7, ft6, fs11
                  rem          a5, t3, s11
                  fmul.s       ft8, fs3, fa2, rtz
                  fcvt.wu.s    tp, fa4
                  sll          tp, a6, s0
                  srli         s1, t2, 16
                  add          s6, a2, s9
                  feq.s        s4, fa1, fs1
                  fsgnjx.s     ft8, ft11, fs2
                  fmv.w.x      fs4, ra
                  fcvt.s.wu    fs8, s4
                  fle.s        gp, fs11, ft0
                  fsqrt.s      ft4, fs4
                  fdiv.s       fa6, fs7, fa1
                  fmax.s       fa0, fs8, fs4
                  fsqrt.s      fs11, fs2, rup
                  fmv.x.w      s0, fs11
                  xor          s3, tp, s9
                  sub          a5, a4, s0
                  mul          a3, a6, tp
                  fsgnjn.s     fa5, fs7, ft7
                  andi         ra, t5, 1609
                  srai         tp, t1, 26
                  and          sp, a7, a7
                  xor          s4, s3, a5
                  fle.s        a6, fs8, ft3
                  fmul.s       fs3, fs7, fs6, rmm
                  fcvt.w.s     s5, ft6, rmm
                  mulhu        a4, s7, zero
                  slt          gp, s8, a6
                  fsgnj.s      fs2, ft11, fs3
                  addi         s1, t2, -1096
                  fcvt.s.w     fs0, a3, rmm
                  remu         ra, s6, a2
                  mulhsu       t5, s2, a7
                  sltiu        a4, sp, -1273
                  auipc        t4, 596504
                  mul          a7, ra, a4
                  slt          ra, a7, s5
                  fmin.s       ft7, fs6, ft4
                  fmax.s       fs6, fa3, fs2
                  lui          sp, 49243
                  sub          a3, t2, s10
                  ori          zero, s4, -249
                  sra          ra, s6, t3
                  or           a2, a4, s10
                  or           t5, sp, a3
                  remu         gp, s0, s4
                  fsqrt.s      fs11, ft0, rup
                  sltu         s0, s8, a0
                  add          a5, s11, a5
                  sltiu        s1, a7, 1111
                  xor          s6, sp, t6
                  fle.s        s10, ft7, fs2
                  lui          a2, 443780
                  sub          a2, a7, s5
                  sub          a7, t5, a2
                  fcvt.wu.s    a5, fs2, rne
                  divu         t2, a2, t2
                  fsgnjn.s     ft2, fa3, fs4
                  sra          a6, s1, tp
                  fsqrt.s      fs2, ft4
                  mulhsu       s5, a2, gp
                  div          a5, s6, a7
                  fcvt.s.wu    ft11, sp
                  sub          s4, a1, s2
                  slli         a4, ra, 7
                  fsgnjx.s     fa0, fa6, fa0
                  fadd.s       ft9, fa0, fa4
                  fle.s        tp, fs10, fs10
                  sltiu        s11, a1, -930
                  fsqrt.s      ft1, fs0
                  fsqrt.s      fa6, fs2, rmm
                  divu         s2, s2, a7
                  fsqrt.s      ft1, fs8
                  div          a4, s9, s1
                  fmv.w.x      ft5, sp
                  srli         a0, a4, 8
                  fcvt.wu.s    s10, ft8, rmm
                  divu         t0, s3, s9
                  or           s7, s4, s10
                  fsgnj.s      ft9, ft10, fs1
                  rem          tp, s4, zero
                  fcvt.s.w     fs4, s7
                  fsgnj.s      fs0, fa2, fa1
                  sra          a1, zero, a1
                  fcvt.wu.s    s10, fa1
                  fmin.s       fa0, fs11, fa2
                  fle.s        s2, fa0, ft5
                  fmv.w.x      fa5, t3
                  lui          a6, 953957
                  add          s0, s11, ra
                  fcvt.w.s     tp, fa0
                  fmv.x.w      t4, ft6
                  divu         a0, zero, s2
                  slt          a3, s6, s2
                  srai         s6, s9, 28
                  fsqrt.s      fs1, ft5, rmm
                  fcvt.s.w     fs2, ra
                  feq.s        s2, fa6, ft9
                  fcvt.s.wu    fs9, a4, rne
                  mulhu        s11, s6, t2
                  fmv.w.x      ft10, a6
                  srl          s2, s0, s7
                  mul          zero, a6, t5
                  lui          t6, 1035885
                  fle.s        s8, fs5, ft11
                  andi         s4, t2, -597
                  slt          s8, t3, a7
                  fcvt.s.wu    fa1, s1
                  ori          gp, ra, 150
                  fadd.s       fs2, ft6, ft10
                  slli         s6, s1, 23
                  slt          gp, a7, a0
                  ori          sp, a3, 960
                  div          t6, s9, a5
                  fcvt.s.w     fs7, t4, rne
                  slt          a4, a0, t3
                  xor          t4, sp, zero
                  mul          s2, s11, s3
                  fsgnjn.s     fa5, ft8, fs6
                  auipc        a0, 698449
                  auipc        tp, 984420
                  add          a3, s11, ra
                  xori         a3, a4, 333
                  flt.s        a7, ft8, fs0
                  fcvt.s.wu    fa2, t0, rmm
                  lui          a1, 941095
                  xori         s6, a4, 486
                  fmul.s       fa0, fs10, ft1, rup
                  flt.s        t5, ft2, fs5
                  ori          s2, t2, -419
                  fadd.s       fs6, fs8, ft10
                  fcvt.w.s     a0, fs1
                  fmin.s       fs8, fa1, fa1
                  fmax.s       fa6, fs1, fs11
                  slt          a2, t4, s3
                  sub          t5, s4, a4
                  fmul.s       fa7, fs2, fs4, rdn
                  sub          t2, zero, a5
                  fcvt.s.wu    ft6, s0, rmm
                  mulhsu       a7, a4, t3
                  mulhu        gp, a4, a2
                  fcvt.wu.s    a6, fs9
                  sltiu        s1, t4, 445
                  divu         s11, tp, a1
                  fsgnj.s      ft1, fs6, fa3
                  fmv.w.x      ft9, t2
                  lui          s7, 325634
                  sll          t6, a2, ra
                  fcvt.s.wu    fa4, s9, rtz
                  mulh         s10, a7, t2
                  srai         ra, a6, 2
                  slli         a3, s3, 4
                  ori          t2, a7, 1681
                  mulh         s6, s4, t5
                  flt.s        a6, ft8, ft1
                  rem          gp, s3, a1
                  slti         a0, t3, 437
                  sub          s7, s5, t0
                  srli         t0, a6, 18
                  fsub.s       ft7, ft11, fs9, rup
                  fmin.s       ft6, fa0, fs4
                  fsqrt.s      fa4, fs10, rup
                  divu         t5, s10, s1
                  fdiv.s       fa3, fs7, fa4, rup
                  fsgnjn.s     ft0, ft9, fa4
                  fmin.s       ft3, fs4, ft3
                  fsub.s       ft5, ft2, ft0, rtz
                  sltiu        s4, a5, -1937
                  flt.s        a4, ft1, ft7
                  fsub.s       fa0, fs0, ft8, rup
                  fsgnjn.s     ft6, fs5, ft6
                  sll          tp, t0, a3
                  fmv.w.x      ft9, a6
                  srli         a6, s11, 0
                  slli         a2, s9, 29
                  sub          s1, a0, s7
                  srai         s1, s10, 17
                  srai         s10, gp, 14
                  mulhu        s5, a4, t3
                  fmin.s       fs9, fs9, ft11
                  add          s6, a0, zero
                  and          a7, a1, a6
                  fsgnjn.s     ft0, fa4, fa1
                  fdiv.s       fs4, ft8, ft4, rup
                  mulhu        s4, t2, s8
                  sltiu        a1, gp, -1252
                  fcvt.w.s     zero, ft3
                  fadd.s       fs1, ft6, ft11, rtz
                  sra          t5, gp, a0
                  divu         zero, a6, tp
                  fmax.s       ft10, ft11, ft1
                  fmax.s       ft4, fa7, fa5
                  flt.s        s2, fs4, ft1
                  mulhsu       t6, a4, a4
                  fclass.s     t2, ft3
                  sra          a4, a3, s6
                  xor          a3, s9, t0
                  lui          s5, 782404
                  auipc        t2, 140458
                  fclass.s     a0, ft9
                  slt          t2, s1, s3
                  andi         t2, a3, 807
                  nop
                  sltu         a6, a0, a4
                  auipc        s0, 158128
                  rem          t5, tp, t0
                  remu         s7, s6, ra
                  rem          zero, s1, a3
                  fcvt.wu.s    t0, fs10, rup
                  sltiu        a0, t3, -1802
                  fsgnjn.s     fs3, ft8, ft3
                  andi         t2, tp, -1603
                  srl          ra, t6, t3
                  slli         a7, t6, 2
                  fle.s        a7, ft8, ft1
                  fle.s        a6, fs3, ft2
                  fclass.s     s6, fs4
                  mul          s8, ra, s4
                  fle.s        a6, ft10, fs1
                  slli         sp, s5, 10
                  fcvt.w.s     s7, fs9, rtz
                  nop
                  or           a0, a7, s4
                  fmax.s       fa7, fs11, fa2
                  xori         t5, ra, -1590
                  fadd.s       fs3, ft2, fa6, rne
                  sltiu        s1, s8, 956
                  ori          a3, s8, -1644
                  sll          t4, s9, t5
                  slli         s4, s7, 30
                  fsgnjx.s     ft11, ft9, fs2
                  fsgnjn.s     fs10, fs2, ft9
                  slli         tp, s11, 6
                  mulh         s2, a3, s2
                  fsgnjx.s     fs5, fa2, fa7
                  fclass.s     s4, fs2
                  fmv.x.w      s0, fa3
                  srli         s10, s3, 14
                  nop
                  fmin.s       ft4, fs4, fs2
                  fmax.s       ft10, ft3, fa1
                  fle.s        tp, fs1, ft2
                  slt          zero, t3, a4
                  fcvt.s.w     fa3, s4, rup
                  slt          a0, ra, t6
                  fcvt.s.wu    fs1, tp, rdn
                  or           a3, s4, s1
                  mulh         t4, a3, t1
                  fmul.s       fa2, ft2, fa1
                  srai         a3, t3, 15
                  fadd.s       ft5, fa1, fs0, rup
                  xor          s2, gp, t3
                  sub          a7, s5, t1
                  slt          s8, s10, t1
                  fdiv.s       fs9, ft5, fs2, rtz
                  fsub.s       fs11, ft9, fs6
                  mulhsu       a4, s8, s10
                  srli         s4, t4, 26
                  fcvt.wu.s    s6, ft5, rmm
                  mulh         a2, sp, t1
                  slt          tp, s10, s10
                  fsgnjn.s     fa0, ft3, fa1
                  srai         ra, s1, 24
                  mulhu        t0, a7, a7
                  mul          ra, t0, s3
                  auipc        a4, 452170
                  fdiv.s       ft9, fa6, fa1
                  fle.s        a7, fa6, ft0
                  mulhu        s4, s11, gp
                  srli         tp, t0, 26
                  fmin.s       fs6, ft2, fs5
                  sltiu        t0, t3, -436
                  sltu         t0, zero, t6
                  mulh         s2, a2, s7
                  feq.s        sp, fs0, fs1
                  and          ra, s9, a0
                  fsqrt.s      fa7, fa6, rne
                  fmin.s       fs1, fa3, ft0
                  auipc        a0, 544354
                  slt          s10, a3, t0
                  feq.s        s1, fa7, ft1
                  srai         s2, sp, 6
                  sll          ra, s10, s10
                  rem          s2, s2, a0
                  sltu         s8, s8, a3
                  fcvt.wu.s    gp, fa5
                  fcvt.s.wu    fs4, a0, rdn
                  div          s7, t0, zero
                  lui          a7, 394924
                  fmul.s       fs6, ft10, fs4, rmm
                  slti         t4, a7, 315
                  div          s2, t3, a3
                  fsub.s       fs8, ft10, fs10, rdn
                  slt          s2, t5, ra
                  sll          a5, s0, a2
                  mulh         s1, s9, zero
                  sltu         t2, a4, t5
                  xori         t4, t0, -1694
                  fsqrt.s      ft1, fs5
                  lui          a7, 448271
                  rem          s1, a4, a2
                  nop
                  div          s10, t5, t6
                  fclass.s     s6, fs5
                  xori         t4, t0, 556
                  fsqrt.s      fs7, fa7
                  fmax.s       ft8, fs0, ft8
                  fmin.s       fa5, fa2, ft5
                  fmv.w.x      ft3, s7
                  fmax.s       fa3, ft1, fs9
                  rem          s11, s8, t3
                  mulhu        a5, a3, a0
                  divu         a7, t0, a7
                  fsub.s       ft4, ft11, fs3, rne
                  fsgnjn.s     fs10, ft11, fa3
                  srli         t0, t2, 7
                  fcvt.s.wu    fs11, a0
                  nop
                  sltu         sp, s4, a7
                  xor          s11, s3, gp
                  nop
                  and          s1, a2, a2
                  mulh         a3, t2, zero
                  flt.s        s4, fs0, ft9
                  remu         s10, a0, ra
                  fsgnjn.s     fs11, ft11, fs10
                  auipc        sp, 441986
                  remu         s0, s8, t5
                  addi         a4, a2, -1547
                  srai         sp, t2, 16
                  flt.s        s6, fs6, fa0
                  fsgnjx.s     fs9, fs9, fs0
                  remu         a4, a0, s9
                  slti         s5, t0, -1998
                  mulhsu       gp, s4, s0
                  fcvt.wu.s    a0, ft6, rup
                  slti         t2, sp, 944
                  nop
                  auipc        t0, 25979
                  sra          t0, t2, a6
                  sub          a2, a4, a5
                  andi         a1, s7, -188
                  add          a2, s3, tp
                  fsgnjx.s     fs1, ft7, fa3
                  srai         ra, t0, 26
                  fmv.x.w      t6, ft6
                  fmul.s       fa0, fs3, fs10
                  mulhsu       tp, a6, t4
                  fle.s        t4, fs6, fs6
                  fmax.s       fa7, fs6, fs0
                  sll          a6, a3, s1
                  slli         s0, a7, 10
                  ori          a6, s3, -1675
                  srli         s8, a1, 7
                  add          a4, zero, a6
                  fsqrt.s      fs10, fa6, rmm
                  fsgnj.s      fa6, fs9, ft8
                  mulhu        t0, t3, s1
                  mulh         a2, s10, s3
                  remu         s1, a2, s10
                  sll          a4, a2, t3
                  mulhu        s11, ra, zero
                  fmin.s       ft0, fa4, ft6
                  fmul.s       fs9, fs3, ft11
                  andi         a3, t6, -610
                  xor          s2, s1, zero
                  xori         a0, s6, -1278
                  fcvt.s.w     fa5, s4, rmm
                  fcvt.wu.s    t0, fa4, rtz
                  fcvt.s.w     fs9, a7
                  addi         s7, a3, 1228
                  fmin.s       fs8, ft8, ft2
                  add          a0, s2, s6
                  lui          a7, 808861
                  slt          s4, s0, s4
                  srai         zero, s11, 18
                  slli         a7, zero, 24
                  auipc        t2, 431358
                  sltiu        gp, t5, 1979
                  fmv.x.w      a6, fs5
                  sltu         t6, a2, a4
                  mul          t2, a6, s0
                  fcvt.s.wu    fs3, t1, rup
                  slti         t6, t1, 216
                  fadd.s       fa3, fs3, ft8, rmm
                  fmax.s       fs9, fs7, fs11
                  fsub.s       fs2, fs10, fs8, rne
                  srl          s4, a3, s3
                  fdiv.s       ft3, fs2, ft4, rtz
                  fsgnjn.s     ft0, fs8, fs5
                  fcvt.s.wu    fs2, t1
                  fsub.s       ft3, ft4, fa0
                  fmv.w.x      fs9, t6
                  lui          a5, 777662
                  andi         s6, s3, 443
                  sll          s10, t2, ra
                  fdiv.s       ft8, fa7, fs7
                  slti         a0, a3, -1368
                  fcvt.w.s     s1, ft11
                  fcvt.w.s     ra, ft4, rdn
                  fsgnj.s      fs10, fa7, ft2
                  divu         s3, a2, s8
                  fadd.s       fa6, fs3, fs3, rne
                  slli         a3, gp, 22
                  mulh         s1, s2, a0
                  sltiu        ra, s5, 736
                  divu         a3, a6, sp
                  fsub.s       ft7, fa1, fs7, rmm
                  slt          s5, s0, sp
                  fdiv.s       ft3, ft9, fs9
                  andi         s1, a2, -1959
                  addi         s3, t2, -300
                  mul          s8, a3, t2
                  auipc        a0, 98041
                  rem          s11, gp, a4
                  srl          tp, ra, s7
                  divu         t0, a1, tp
                  slti         a4, sp, -1923
                  auipc        s7, 466979
                  sltiu        a6, t5, -746
                  fmv.x.w      a3, fa6
                  xor          a3, s8, a6
                  fsgnj.s      ft2, ft0, ft3
                  fcvt.s.wu    fs6, s5, rdn
                  flt.s        a1, ft6, fa1
                  fcvt.w.s     ra, ft10, rup
                  fsgnjx.s     fs10, ft7, fa4
                  srai         a0, t3, 0
                  ori          a0, zero, -1827
                  srai         a6, t4, 27
                  and          s8, s9, s1
                  fcvt.wu.s    s10, ft1, rtz
                  fle.s        a7, ft11, fs11
                  rem          zero, t0, s2
                  sll          s1, s5, sp
                  divu         s0, s0, s10
                  auipc        a5, 852563
                  sltu         s2, zero, ra
                  addi         t0, a5, -974
                  fcvt.s.w     fa4, s8, rne
                  slt          t6, ra, s8
                  remu         a7, t5, s3
                  xori         a4, s9, 1089
                  fmin.s       fs2, fs3, fs5
                  fmv.w.x      fa6, a6
                  sub          s3, sp, s1
                  fle.s        a5, fs7, fs2
                  mulhu        a1, s4, a5
                  nop
                  srai         s2, s1, 17
                  addi         s11, a4, -771
                  srl          zero, a1, s2
                  addi         s11, s2, 1326
                  flt.s        a7, fs11, fa2
                  sub          s11, s2, s0
                  fsgnj.s      ft1, ft9, ft8
                  remu         a1, a3, s3
                  auipc        a4, 271986
                  srli         s5, t6, 23
                  sltu         t0, a6, a0
                  addi         a6, s0, 796
                  lui          a7, 1048415
                  remu         s5, t1, ra
                  ori          a1, zero, 1003
                  addi         gp, a6, -1478
                  fadd.s       ft1, ft7, ft5, rtz
                  remu         a3, a1, a6
                  remu         s8, ra, s2
                  flt.s        s4, fs0, fs2
                  nop
                  fclass.s     a4, fs11
                  divu         s6, a3, s5
                  fdiv.s       ft11, ft8, fa2, rtz
                  auipc        t4, 979578
                  sra          tp, t1, zero
                  mulhu        s3, t0, t0
                  mulhu        s11, t1, t3
                  srli         a4, t0, 19
                  flt.s        s2, ft8, ft2
                  sltiu        a1, gp, 1357
                  fsub.s       ft0, fs10, ft11, rup
                  flt.s        s6, fa7, ft9
                  sltu         t6, s2, t1
                  ori          s7, a5, -10
                  flt.s        ra, ft2, ft1
                  srli         t0, s5, 5
                  ori          zero, a4, 1121
                  ori          t4, t5, -511
                  or           t4, s11, t4
                  fsqrt.s      fa1, fs0
                  auipc        tp, 946288
                  and          tp, t0, s6
                  slt          a7, a3, t2
                  nop
                  rem          t2, a7, t4
                  fmin.s       fs10, fs7, fs3
                  mulhu        sp, t3, s0
                  mulh         s0, s3, s7
                  slti         s5, a7, -1855
                  addi         a3, s5, 1671
                  fmv.w.x      fs3, a5
                  fsub.s       ft0, fs2, fa3
                  mulh         tp, s1, t4
                  fmax.s       fa4, fs9, fs8
                  fcvt.wu.s    a4, fs3, rtz
                  slli         a3, s8, 23
                  rem          s5, t1, a7
                  sub          s8, s11, a0
                  sra          zero, t6, a4
                  sub          t0, s7, t3
                  mulh         s8, t1, t1
                  div          zero, s10, s6
                  sra          a2, a5, s10
                  sltu         a6, a5, sp
                  sll          t2, t2, s11
                  fmin.s       fs2, ft10, ft9
                  and          sp, ra, s10
                  slli         sp, sp, 19
                  mulhsu       t6, tp, t2
                  sub          a3, t3, a0
                  mulhsu       tp, gp, a6
                  addi         s10, s5, 1863
                  addi         a5, s8, 1154
                  srl          a7, s9, s11
                  remu         a1, sp, a5
                  fcvt.wu.s    t6, fs0
                  feq.s        ra, fs9, fa4
                  fsgnjx.s     ft8, ft11, fa3
                  fcvt.s.w     fs3, s4, rne
                  fclass.s     s10, fs8
                  nop
                  div          zero, sp, t1
                  fadd.s       fs0, ft4, ft2, rne
                  fmul.s       ft9, fa7, ft2
                  auipc        s2, 490549
                  srl          t6, s0, s5
                  slli         a5, gp, 15
                  fmv.w.x      fs2, zero
                  fmin.s       fs0, ft0, fs2
                  fcvt.s.wu    ft8, s3
                  srl          s1, t6, a5
                  fclass.s     tp, ft2
                  mulhu        ra, a1, s10
                  add          a6, s7, s4
                  fclass.s     ra, ft6
                  fsub.s       ft7, ft9, fa1
                  fdiv.s       ft10, fs4, ft7
                  mulhsu       gp, s7, t2
                  fmv.x.w      a0, fa5
                  remu         s10, s9, gp
                  fmv.w.x      fs0, t3
                  divu         s7, tp, a6
                  slli         s10, s0, 27
                  add          a4, a7, s10
                  auipc        s11, 443153
                  xori         a6, a2, -1122
                  fmin.s       fa2, fa1, ft5
                  xor          a3, s5, zero
                  sll          s7, a3, zero
                  remu         a1, a6, a4
                  rem          a6, s8, t1
                  fsgnjx.s     ft2, fa4, ft3
                  slli         tp, s4, 31
                  fadd.s       ft11, ft3, ft5, rdn
                  mulhu        s10, a0, s5
                  fmv.x.w      a1, fs2
                  mul          t5, a0, a1
                  srai         s5, t3, 22
                  flt.s        a0, fa0, fs9
                  fmv.w.x      fs0, a6
                  ori          tp, s0, -793
                  fsgnj.s      ft7, fs3, fs5
                  slt          s8, t4, s8
                  mulhsu       tp, a6, a1
                  fsqrt.s      fa6, ft2
                  andi         ra, s1, 987
                  fcvt.wu.s    t4, fa1
                  fsgnjn.s     fa5, ft7, ft11
                  sltiu        s7, t1, -659
                  lui          s10, 176644
                  mulh         a5, s7, t0
                  sub          s0, s11, s4
                  or           s1, a7, s6
                  fcvt.wu.s    a4, ft2
                  fmul.s       fs7, fa4, fs1, rtz
                  ori          t6, s1, 1304
                  ori          s7, s10, -1178
                  auipc        a4, 292561
                  slti         s8, gp, 1029
                  fsub.s       ft1, fa4, ft1, rdn
                  andi         sp, sp, -884
                  xor          a1, s7, s4
                  fcvt.w.s     sp, ft7
                  fmv.w.x      ft6, a5
                  fmin.s       fa3, ft1, fs5
                  fcvt.s.wu    ft0, sp
                  fclass.s     s10, ft10
                  ori          a0, a3, 754
                  fsqrt.s      ft0, fa6
                  rem          s8, s8, s5
                  fle.s        a2, ft6, fa2
                  srai         s1, a0, 30
                  fmin.s       ft5, fa0, fa6
                  feq.s        a5, ft10, fs1
                  xori         s0, a5, -611
                  fsgnjx.s     ft4, fs0, fa1
                  fadd.s       ft9, fs1, ft3, rdn
                  fsgnjx.s     fa7, fa6, fs0
                  fdiv.s       ft0, fs0, ft0, rne
                  rem          s6, s3, t5
                  slti         s4, a2, -555
                  sll          t6, s5, t1
                  fclass.s     a2, fa6
                  fadd.s       fs6, ft5, fa1, rmm
                  srai         s7, s4, 8
                  srl          s4, t1, t0
                  mul          s5, t6, sp
                  nop
                  fcvt.s.w     fs5, sp, rne
                  fsub.s       fs4, fs5, fs11, rdn
                  xori         s4, a5, 831
                  fle.s        s8, fs4, ft9
                  div          t2, ra, a5
                  fsub.s       fs4, fa6, fa6
                  fsqrt.s      fs8, fs0
                  sra          t4, t1, t1
                  lui          ra, 908039
                  add          a7, a7, s7
                  sub          a0, a3, s7
                  mulhu        s8, t4, t2
                  flt.s        s8, fa1, ft2
                  addi         t2, t5, 1694
                  fsub.s       fs8, fs3, fs8
                  fsgnjn.s     fa4, ft6, ft3
                  fmin.s       fs7, ft2, fs0
                  rem          a2, s3, sp
                  fmin.s       ft1, fs1, fs9
                  srai         ra, s10, 3
                  srai         s2, s5, 3
                  add          t2, s10, s0
                  fmin.s       fs6, ft10, fs6
                  mulhu        a3, s1, s4
                  or           s4, s1, s6
                  sltu         t6, s10, s11
                  srli         s10, a2, 3
                  and          t4, t4, a1
                  fsgnj.s      ft3, fa0, ft2
                  fcvt.s.w     fa6, s6
                  remu         a2, t3, s11
                  div          s4, t0, gp
                  fcvt.s.w     fs4, ra, rtz
                  auipc        s4, 943122
                  sltu         a1, a5, t0
                  fmul.s       ft10, ft1, fa5
                  sra          a4, s11, s1
                  add          gp, t0, s0
                  or           tp, s1, a3
                  andi         a4, t3, -1447
                  fdiv.s       ft10, fa1, ft9, rdn
                  fcvt.s.w     ft2, s4, rdn
                  lui          a2, 330411
                  fmax.s       ft11, fa3, fs11
                  fsgnjn.s     fs2, ft8, fa3
                  div          t5, gp, t6
                  slli         s3, t2, 31
                  nop
                  fcvt.s.w     fs4, tp
                  and          s6, a7, s1
                  mulhu        s10, s7, s6
                  srli         tp, s1, 6
                  srli         s8, s9, 7
                  divu         s0, t0, a1
                  feq.s        s4, fs2, fs1
                  fmv.x.w      s8, ft3
                  nop
                  mul          a4, ra, s0
                  srl          a2, a1, t2
                  mul          s5, a4, s11
                  fsqrt.s      fs5, ft11, rmm
                  fsgnj.s      fs2, fa3, fs0
                  slli         s8, t5, 19
                  mul          a6, s0, s8
                  xori         gp, a3, 1607
                  fmv.w.x      ft1, t1
                  div          a5, ra, gp
                  xor          zero, t4, tp
                  slt          a5, t2, tp
                  sll          t2, s5, tp
                  fsub.s       fs9, ft9, fs3, rne
                  fsgnjx.s     fa1, fs6, ft10
                  sub          a0, s8, s9
                  feq.s        a5, fa7, fa1
                  fsgnjn.s     fs6, fs5, fs2
                  fmin.s       fs2, ft8, ft4
                  andi         s6, s9, -1247
                  mulh         s2, a1, a0
                  andi         a1, a7, 278
                  fmv.w.x      ft4, t0
                  fsub.s       ft7, fa7, fs1, rne
                  srai         zero, a5, 8
                  fmv.x.w      t0, ft9
                  xori         s1, t1, 1878
                  divu         ra, a5, sp
                  slti         s8, a6, -308
                  sltiu        s10, ra, 1429
                  feq.s        s0, ft4, fs6
                  remu         a6, tp, a7
                  fsgnj.s      ft3, fs6, fs1
                  sll          s10, s7, zero
                  divu         t5, a7, sp
                  fmul.s       fa2, ft7, fs11
                  feq.s        s10, fs4, fs6
                  xori         a3, s3, 1312
                  srl          zero, s4, s7
                  rem          a3, s2, a7
                  divu         zero, a1, t6
                  addi         a5, s5, 220
                  fmin.s       ft5, fa1, ft0
                  nop
                  srai         t2, a5, 0
                  fmv.x.w      t0, fa7
                  srl          a2, t3, a0
                  slli         s1, gp, 15
                  fle.s        a0, fs5, ft3
                  fsgnjx.s     ft1, ft0, ft8
                  feq.s        ra, ft7, fs11
                  nop
                  mulhsu       s1, zero, a5
                  fmul.s       fa0, fs11, fs8, rtz
                  fsub.s       ft0, fa0, fs5
                  slti         a6, a5, -364
                  fsub.s       fa7, ft6, fa3, rdn
                  fle.s        t2, ft0, fs3
                  slli         t0, a5, 26
                  fadd.s       fa6, fs9, ft1
                  fmv.x.w      s6, fs4
                  mul          t5, zero, t0
                  fmv.x.w      a5, fs10
                  add          a4, t0, t3
                  and          s6, s9, s4
                  divu         t2, a6, t5
                  sltiu        t2, a2, 560
                  sltu         a4, t3, s9
                  fsub.s       fs3, fs11, fs4
                  fdiv.s       ft6, ft10, ft3, rne
                  mulh         a3, a0, s7
                  fcvt.wu.s    t2, ft3
                  srai         tp, tp, 20
                  srli         t6, s6, 17
                  mulhsu       gp, a6, zero
                  add          s6, s8, t5
                  feq.s        s7, ft5, ft9
                  fle.s        t6, fa6, ft11
                  sub          gp, a7, t4
                  fmv.w.x      ft10, t4
                  xor          a2, s2, a2
                  rem          t5, t2, ra
                  fcvt.wu.s    a7, fs10, rup
                  srl          t0, a6, s0
                  rem          s0, sp, a2
                  ori          t5, a0, -2013
                  fcvt.s.wu    fa7, s11
                  fcvt.wu.s    t4, fs5
                  sra          s11, s7, t0
                  sra          t2, s7, s4
                  fadd.s       fa7, ft0, fs6, rtz
                  flt.s        t0, ft4, fa5
                  xor          tp, s11, t1
                  sub          s0, s3, s11
                  mul          ra, a4, s7
                  fsgnj.s      fa2, ft5, ft5
                  flt.s        t6, ft9, ft9
                  sltu         a5, s6, a6
                  fmul.s       fa5, fs6, fa5
                  remu         t2, gp, sp
                  sra          t0, s5, sp
                  xor          zero, s1, a0
                  fcvt.s.w     fs8, ra
                  fmin.s       ft2, fa7, ft5
                  fmax.s       fs11, fs11, fa4
                  or           s10, s2, s2
                  fmax.s       fa6, fs11, fs8
                  fsgnjx.s     ft8, fs8, fs2
                  auipc        s2, 720920
                  fsub.s       fs9, fa2, fs3
                  nop
                  remu         a3, sp, s5
                  fsgnj.s      ft3, fs10, ft10
                  fcvt.s.w     ft4, s7
                  sub          s10, t1, s4
                  slt          s3, t3, s8
                  sll          tp, t2, s0
                  lui          s4, 532160
                  sra          sp, s2, a5
                  flt.s        t2, fa7, ft2
                  mulh         s7, s4, t5
                  fmv.x.w      t2, fs10
                  fclass.s     zero, ft4
                  fsgnjx.s     fa0, fs5, fs3
                  fmul.s       fs7, fs7, ft0, rtz
                  mul          a7, zero, s8
                  add          s11, t6, t6
                  fcvt.s.w     fs8, s10
                  div          a7, a6, s2
                  feq.s        s7, ft11, fs6
                  or           tp, a5, t4
                  fmax.s       ft4, ft3, ft5
                  srl          t4, s7, ra
                  fsgnjx.s     fa6, ft10, ft10
                  fclass.s     s0, ft4
                  fmin.s       ft1, fs2, ft3
                  and          a7, a6, a3
                  fsgnjx.s     fa6, fa5, ft3
                  flt.s        s11, fs3, ft3
                  srai         s5, t3, 18
                  nop
                  slt          s3, s6, s9
                  addi         sp, a1, -997
                  fsgnj.s      ft9, fa5, ft3
                  fsgnj.s      fa1, ft10, fa7
                  mulhu        s5, ra, ra
                  fcvt.wu.s    s5, ft8, rmm
                  fcvt.s.w     fs8, s4
                  add          zero, s0, s0
                  fmv.w.x      ft2, a3
                  srai         gp, s3, 11
                  fmax.s       ft1, ft5, fs3
                  sll          s2, s0, t4
                  sltiu        a4, gp, -1574
                  mul          s3, tp, s9
                  xor          tp, a4, t0
                  rem          sp, s5, s2
                  slt          a2, sp, a1
                  fsgnjx.s     fs5, ft6, ft6
                  mulh         sp, a7, s1
                  add          ra, sp, s9
                  sub          s8, a2, a4
                  sll          t5, t3, s10
                  auipc        tp, 209571
                  sub          a6, s4, a5
                  fmul.s       fa1, ft4, fs2, rdn
                  remu         sp, s2, s3
                  addi         a7, s5, -100
                  mulhu        sp, t5, s9
                  auipc        a6, 280938
                  remu         a0, s11, a1
                  div          s10, zero, s0
                  sltu         s11, t2, a0
                  sltiu        s5, t2, -1723
                  and          t5, a0, s5
                  mul          a3, s5, s10
                  lui          s3, 597523
                  mulh         ra, a4, s9
                  nop
                  or           s0, s0, t5
                  fmul.s       ft8, fs1, fs6, rmm
                  slt          a6, ra, a2
                  andi         a3, t2, 513
                  feq.s        s0, ft11, fa0
                  divu         a4, a6, s8
                  div          s3, s7, a1
                  srli         a6, s10, 8
                  mulhu        gp, s5, a2
                  mulhsu       a1, s6, s1
                  mulhsu       t6, s0, t0
                  remu         s5, t3, s11
                  fmax.s       fs3, ft8, fs9
                  fmax.s       fs6, ft1, ft8
                  sltiu        sp, s0, 1538
                  fcvt.wu.s    s5, fa6
                  fmin.s       ft1, fa6, ft1
                  xor          s5, t0, a2
                  feq.s        tp, fa2, fs4
                  sll          s3, s0, t1
                  sll          t0, a0, a0
                  sll          s11, s3, s3
                  addi         ra, s1, -1978
                  ori          t6, s9, -1161
                  auipc        a4, 826999
                  slt          a5, ra, t0
                  fmax.s       fa2, fs3, ft10
                  xori         a3, t4, -158
                  div          t4, t6, s3
                  sub          t2, t5, t3
                  slt          t6, s11, a7
                  fclass.s     t2, ft8
                  addi         s3, a0, -616
                  remu         a2, ra, a2
                  sltiu        s11, s9, -1914
                  fadd.s       fa4, fs4, fs7, rtz
                  mulh         a6, ra, s3
                  fsgnj.s      fa7, ft3, ft1
                  sll          a6, t0, s10
                  or           t4, t2, s5
                  slti         s2, gp, 1184
                  add          t4, gp, a1
                  mul          ra, a7, t0
                  fadd.s       ft5, fs4, fs5
                  slli         s1, ra, 20
                  add          s8, s5, t1
                  srl          tp, a2, zero
                  fsgnjx.s     ft2, ft5, ft11
                  and          a0, sp, s1
                  fcvt.wu.s    tp, fa4, rtz
                  andi         s0, zero, 1032
                  fsqrt.s      fs2, ft6, rmm
                  fsgnjx.s     ft10, fs10, ft11
                  fmax.s       fs7, ft8, ft2
                  fmax.s       fs8, fs9, ft2
                  sltiu        s11, t6, -1373
                  fmul.s       ft0, fa7, ft5, rdn
                  srl          a6, gp, s5
                  rem          tp, t4, a3
                  feq.s        s5, fs4, ft10
                  auipc        s4, 245144
                  rem          a4, a1, s9
                  srl          a1, s11, s7
                  andi         a6, t1, 1689
                  ori          a4, t3, 1036
                  fdiv.s       fs3, fa5, fa0
                  fcvt.wu.s    s10, fa0
                  fsub.s       fa4, fa6, fa2
                  feq.s        s10, ft8, fs6
                  fclass.s     s3, fs8
                  andi         s5, s6, 1337
                  fcvt.s.wu    fs10, a5
                  add          s8, a6, s3
                  auipc        s11, 553896
                  fsgnjx.s     ft11, ft11, fa4
                  fle.s        t6, ft1, ft10
                  slt          gp, s0, t1
                  fsub.s       fs8, ft0, fs6
                  lui          t5, 359137
                  or           t4, s4, s5
                  srl          tp, zero, t6
                  sll          gp, t4, s2
                  fcvt.s.wu    ft7, tp, rtz
                  sltu         a5, t3, zero
                  sltiu        s8, ra, 240
                  mulhu        s5, a2, s5
                  srli         a0, s2, 12
                  sltiu        s7, s7, 1098
                  addi         s11, s4, -1561
                  andi         s8, a4, 368
                  and          a3, s8, t4
                  feq.s        a7, ft4, fs10
                  fcvt.wu.s    t4, fs9, rmm
                  div          a4, a7, ra
                  fsub.s       ft4, fs2, fa5, rup
                  and          t5, s2, a5
                  fcvt.s.w     ft11, s4
                  andi         sp, s11, 1937
                  srai         a4, t3, 31
                  nop
                  fdiv.s       fs10, fa2, fs6, rtz
                  fmul.s       fs4, ft5, ft7, rup
                  fmv.w.x      fs1, a1
                  fsqrt.s      fs10, ft10, rne
                  fsgnjx.s     fa1, ft10, ft8
                  andi         a1, s6, 668
                  fadd.s       fs9, ft8, fs0, rne
                  fcvt.s.w     fa3, s1, rtz
                  fcvt.s.wu    fs6, ra
                  xor          a6, s3, s6
                  fadd.s       ft10, fa1, fs8, rup
                  div          s6, s1, s9
                  fsgnjx.s     fs4, fs1, fa6
                  fmv.w.x      fa5, sp
                  fsub.s       fs1, fa2, fs4
                  fsgnjx.s     ft11, ft9, fs11
                  fcvt.w.s     s0, ft1
                  fmax.s       ft6, ft8, ft0
                  srli         s1, a2, 22
                  and          s3, a7, t3
                  rem          s1, s4, s1
                  or           t4, a5, s2
                  fcvt.s.w     fs7, t2, rne
                  mulhsu       s4, a2, s9
                  srli         a2, s2, 8
                  fmax.s       ft0, fa6, fs6
                  fmv.x.w      s7, fa0
                  slli         ra, zero, 21
                  sltu         s0, t6, t4
                  fdiv.s       fs3, fs4, ft6
                  add          a6, t2, a6
                  ori          zero, s5, -1973
                  addi         s3, t3, -567
                  addi         s2, t5, -318
                  nop
                  fcvt.wu.s    t5, ft7
                  sltu         gp, s3, a6
                  sub          a4, s10, s1
                  fmin.s       fs3, fa7, fs9
                  or           s4, a2, s4
                  add          s11, ra, s1
                  fmax.s       fs4, fs6, fa7
                  srli         s10, a6, 31
                  fadd.s       ft6, ft3, fs8
                  fcvt.wu.s    t5, fs6, rdn
                  mul          s2, t6, s4
                  slt          a2, s1, s3
                  flt.s        a4, fs4, fa1
                  divu         a3, s11, s0
                  mulhsu       a1, s8, a6
                  srli         s10, s4, 12
                  srli         sp, s7, 19
                  fsgnjn.s     ft2, ft6, ft5
                  fmv.w.x      ft6, ra
                  remu         t4, t2, a7
                  sra          zero, t3, t0
                  fclass.s     sp, fs10
                  fcvt.w.s     s5, fa5, rtz
                  xori         sp, a3, -1792
                  fcvt.s.wu    ft5, s11, rup
                  mulhu        s7, s5, t1
                  fmv.x.w      s3, fs4
                  fcvt.wu.s    t6, ft2, rne
                  mulhsu       a6, tp, s5
                  slli         s11, s9, 19
                  fmv.w.x      fa0, s3
                  nop
                  add          s0, t2, s10
                  fadd.s       fa3, fa0, fa2
                  mul          s10, s5, a6
                  fadd.s       ft0, fs4, ft4
                  fcvt.w.s     t2, ft9, rdn
                  fmin.s       fs5, ft11, fa4
                  srl          a2, zero, s3
                  mul          a3, s6, t5
                  fmin.s       fs6, fa0, ft5
                  fsgnjx.s     fs4, ft4, fs10
                  ori          t4, s11, -1138
                  mulh         s4, a2, s1
                  fcvt.s.w     ft1, s1, rmm
                  fmax.s       fs4, ft6, ft10
                  fadd.s       fs9, fa3, fs4
                  fdiv.s       fs3, fs7, ft4
                  remu         gp, a6, t4
                  feq.s        s10, fa7, ft2
                  nop
                  fsgnjx.s     fa3, fs7, ft5
                  rem          s0, a5, a1
                  fmin.s       fs11, ft4, fs4
                  fsgnjn.s     fa7, ft9, fa2
                  ori          a2, a6, 367
                  xor          zero, t0, gp
                  fsub.s       fs9, ft3, fa6, rne
                  fcvt.w.s     a6, ft7, rmm
                  xor          t2, s8, a7
                  andi         sp, s0, 321
                  fcvt.s.wu    fa2, t1, rne
                  fcvt.s.w     ft10, a2
                  mul          s2, a3, t0
                  addi         t0, t1, 1341
                  fdiv.s       ft11, ft4, ft8
                  feq.s        s11, fs4, fa6
                  fdiv.s       fs11, fs2, fa7
                  fcvt.s.w     fa4, s7
                  andi         t0, s3, 1654
                  fmv.w.x      fs3, a6
                  nop
                  fsgnjx.s     fs1, ft9, ft10
                  srai         s7, s8, 14
                  fmul.s       fa1, ft3, fs10, rmm
                  fcvt.w.s     a5, fs10
                  rem          s5, t1, tp
                  fsgnjx.s     fa5, ft10, ft2
                  slti         t2, s6, 477
                  div          sp, gp, s3
                  and          sp, t3, a2
                  mulhu        a2, t5, t5
                  fmv.w.x      fa0, t6
                  fmul.s       fs6, fs2, fa2
                  addi         tp, a3, -104
                  srl          a0, tp, s5
                  rem          ra, s9, gp
                  mulh         s2, tp, gp
                  mul          a6, s6, t6
                  flt.s        s10, ft2, ft6
                  srli         sp, sp, 19
                  rem          t6, s5, a7
                  and          gp, zero, s4
                  mulhu        a7, s7, s0
                  sltu         t6, t0, tp
                  fle.s        s6, ft6, fs10
                  andi         gp, sp, -455
                  mulhsu       a5, a3, s2
                  fmv.w.x      fa3, s3
                  lui          s6, 129975
                  fsgnjn.s     ft4, ft8, ft1
                  fsgnjx.s     fs2, fa0, ft5
                  fsub.s       ft7, fa6, fs3
                  add          a7, s11, t1
                  fsqrt.s      ft11, fs2, rmm
                  remu         s3, t2, ra
                  lui          t0, 918172
                  mulhsu       t4, zero, s8
                  feq.s        sp, fs11, fs1
                  fmv.x.w      s2, ft2
                  mulhsu       a1, t4, s4
                  fsub.s       ft10, fs6, fa6, rne
                  fcvt.s.w     fa1, s5, rup
                  fsgnjn.s     ft5, fs0, fs2
                  fdiv.s       ft10, fa1, fa6, rdn
                  mulhu        a3, s2, s3
                  mulhsu       a0, s6, t2
                  add          a1, a3, ra
                  andi         s4, sp, 260
                  mulhu        a5, s10, s4
                  addi         s8, a1, 1507
                  andi         s10, t0, 754
                  fcvt.s.w     fs6, t3, rup
                  rem          s8, a3, a6
                  srli         s6, ra, 15
                  fmv.x.w      a5, ft2
                  fmv.w.x      fa3, t5
                  xor          t2, t0, a3
                  fmv.x.w      zero, fa6
                  slti         s11, t6, -1850
                  sltiu        a6, t3, 88
                  fmv.x.w      s4, ft10
                  and          s4, s10, sp
                  fsgnj.s      fs4, ft5, ft1
                  feq.s        t2, fs7, ft6
                  sra          a5, s8, s4
                  fmul.s       fs10, ft3, ft4
                  andi         ra, s1, 148
                  fmin.s       ft3, fa1, ft5
                  sltu         a4, s4, a2
                  lui          s8, 790970
                  feq.s        s5, fs11, fs9
                  srai         a6, s6, 11
                  remu         sp, a0, t1
                  fsqrt.s      fs1, fs1
                  sra          tp, a1, t6
                  div          s4, t5, s6
                  fsgnjx.s     fs3, ft4, fs1
                  sltiu        a3, s7, -111
                  slli         a1, s1, 3
                  addi         a6, s4, 1625
                  sub          a5, zero, sp
                  srli         sp, s1, 25
                  add          zero, s10, tp
                  fdiv.s       ft11, fs7, fs0, rup
                  fmul.s       fs6, ft10, fs8
                  flt.s        a5, fs0, fs8
                  flt.s        gp, fs11, fs9
                  feq.s        a5, ft11, fs1
                  lui          s8, 265990
                  fmin.s       fs3, ft3, ft7
                  and          a0, t4, ra
                  fmv.x.w      a4, ft1
                  fle.s        a7, fs6, fs11
                  fmv.x.w      t0, ft9
                  fmv.w.x      ft9, t2
                  fle.s        s7, fs1, fs10
                  andi         t6, a3, 1378
                  sltiu        a2, ra, 1482
                  addi         s7, ra, -470
                  mulhsu       a5, s4, a7
                  fdiv.s       fs6, fs7, fs7
                  nop
                  fle.s        s0, ft6, fs8
                  divu         s11, a6, a7
                  fle.s        s8, ft10, ft10
                  fmax.s       ft11, fa7, ft5
                  remu         t6, s11, t1
                  xor          s8, s7, ra
                  fmv.w.x      fs6, s2
                  fadd.s       ft11, fa5, ft3, rne
                  nop
                  fmax.s       ft4, fa4, fs11
                  sll          s4, s11, t5
                  sltu         s11, a4, gp
                  slti         a3, zero, -1335
                  fmax.s       fa0, fs11, fs1
                  fmv.x.w      s0, ft6
                  remu         t2, a3, s3
                  mulhu        ra, s9, s5
                  xor          s5, a0, s1
                  mul          s10, a5, t0
                  fsub.s       fs6, fa1, fa2, rup
                  srli         s8, zero, 10
                  fmv.w.x      fs9, a1
                  addi         s1, a0, -233
                  flt.s        ra, fa6, ft10
                  fcvt.s.wu    fs9, a5, rne
                  fmul.s       fa2, ft5, fa5, rmm
                  fle.s        ra, fs9, fs3
                  div          t4, s11, tp
                  xori         s6, t6, -41
                  or           t2, ra, s0
                  fcvt.w.s     a2, ft9
                  sra          t6, t0, s4
                  fcvt.wu.s    a5, fs5
                  flt.s        a2, ft7, fa5
                  fmin.s       fs10, ft3, fs1
                  fsgnjn.s     ft8, ft11, fs4
                  slli         t4, s11, 9
                  div          a2, s1, a5
                  fsgnjx.s     fs3, fs0, fs8
                  mul          s7, s4, s2
                  slli         a0, s10, 23
                  fsgnj.s      ft9, fa0, ft0
                  ori          zero, s5, -173
                  and          sp, s3, s4
                  slt          a5, s2, s3
                  feq.s        ra, ft9, fs5
                  mulhu        zero, t2, s2
                  sra          s7, s11, a7
                  srli         a7, tp, 4
                  nop
                  nop
                  srli         a0, s7, 29
                  mulhu        tp, s6, s9
                  lui          a1, 651390
                  slli         gp, a7, 13
                  fcvt.wu.s    t5, ft2, rup
                  mulhsu       ra, t4, s9
                  fmax.s       ft10, ft9, ft1
                  ori          s5, a7, -1934
                  fle.s        s1, ft11, fa7
                  or           a1, a3, a4
                  xor          t4, s7, s9
                  xor          gp, ra, t4
                  fcvt.w.s     s10, ft2
                  fsgnj.s      fs3, ft6, fs4
                  mul          gp, gp, s8
                  mul          s4, s11, a3
                  andi         s8, s11, 1840
                  remu         a0, gp, s3
                  add          gp, sp, t6
                  srli         s10, t3, 16
                  slt          t5, zero, t2
                  remu         gp, ra, t3
                  mul          s8, t6, t0
                  fcvt.s.wu    fa4, a0, rup
                  fmin.s       fa7, fs1, fs5
                  fsgnjx.s     ft10, fs1, fa6
                  auipc        s11, 184702
                  auipc        gp, 125145
                  fsgnjn.s     ft1, ft3, fs8
                  fle.s        s6, ft0, fs7
                  fadd.s       fs3, fs4, ft6
                  fdiv.s       fs11, ft9, ft4, rne
                  fcvt.wu.s    s1, fs4
                  fmul.s       fa2, fs4, fa3, rup
                  fcvt.s.w     fs11, s10
                  ori          t5, a4, -59
                  remu         a0, a7, s11
                  slt          s7, a6, t6
                  fadd.s       ft11, ft6, fs0
                  fcvt.s.w     fa1, s5, rne
                  srai         gp, s3, 17
                  lui          s6, 140518
                  mulh         a2, t3, t0
                  fsub.s       fs11, ft3, fs2
                  fsqrt.s      fs9, ft0
                  fsgnj.s      fs2, fa3, fs9
                  fmv.w.x      ft4, s7
                  remu         t5, sp, s11
                  fsub.s       fs5, ft1, ft11
                  srai         s3, a3, 22
                  fsub.s       fa7, ft1, ft7
                  slt          a7, a0, t2
                  srai         s1, s8, 25
                  fclass.s     a5, ft10
                  or           a6, s9, s1
                  ori          t0, s7, 652
                  fmv.x.w      s6, fa5
                  feq.s        a4, ft2, ft10
                  mulhsu       s0, s4, t4
                  fsgnjx.s     fa7, ft5, ft4
                  fcvt.s.w     fs0, s9
                  srli         s2, t5, 5
                  nop
                  fmv.w.x      fa1, a7
                  fsub.s       fs3, ft7, fs6
                  auipc        a6, 307316
                  fmv.x.w      s7, ft10
                  mul          tp, gp, s4
                  fdiv.s       fa7, fs11, ft8, rtz
                  feq.s        a0, fs6, fa7
                  or           t0, tp, gp
                  slli         a7, sp, 16
                  fmin.s       fs8, fs10, fs9
                  fsub.s       ft4, ft5, fs10
                  fle.s        a3, ft3, ft5
                  sll          s3, s6, ra
                  fsgnjx.s     ft2, fa2, fs4
                  fadd.s       ft9, fs11, ft2
                  sltiu        tp, s4, 439
                  fsub.s       fs6, ft5, ft9, rtz
                  fsgnj.s      fa4, fs4, fa7
                  xor          s11, gp, tp
                  rem          tp, a5, a3
                  sltu         t4, t3, a2
                  fmul.s       ft4, fa1, ft5, rdn
                  fcvt.s.w     ft2, a1, rup
                  fmax.s       fs2, ft4, fs3
                  mulh         s3, s0, a2
                  sll          t4, s4, t5
                  fsgnj.s      ft3, fs1, fa7
                  fsgnj.s      ft2, fs9, fa4
                  xori         a7, a4, 997
                  and          s1, t6, a0
                  add          s3, a2, s5
                  fcvt.s.w     fs10, a6
                  sll          s5, s4, a1
                  divu         t4, tp, a3
                  fclass.s     a2, ft10
                  srli         s6, s2, 20
                  sll          a0, s0, s4
                  fadd.s       fa5, fa1, fs4
                  sra          s3, s4, t6
                  mulh         s8, s5, zero
                  sll          a4, a2, ra
                  auipc        a2, 872201
                  divu         s8, zero, s1
                  mulh         s10, a4, s7
                  remu         t2, s11, s7
                  slti         a3, s9, -469
                  fsgnjx.s     ft2, ft1, fs10
                  fmul.s       fs1, fa3, ft1
                  auipc        a7, 710779
                  sltu         s5, s1, tp
                  fsgnjx.s     ft5, fs6, fa3
                  fcvt.s.wu    fa1, a4, rtz
                  fmv.w.x      fs5, ra
                  fcvt.w.s     a7, fs5
                  fsqrt.s      fs8, fs9
                  fclass.s     t4, fa5
                  sll          a6, s0, t0
                  fmv.x.w      s10, fs9
                  fcvt.w.s     a0, ft9
                  fmin.s       fs2, ft1, fs2
                  srli         t6, s11, 18
                  remu         a0, s2, s1
                  xori         t2, t5, -859
                  fcvt.s.w     fs5, a6, rmm
                  fsub.s       ft5, fa7, ft9, rtz
                  sll          t4, s6, a6
                  fle.s        s11, ft11, fs3
                  lui          sp, 704215
                  xor          a3, t0, s6
                  auipc        s10, 278160
                  mulh         t4, s10, sp
                  sub          s1, a2, s8
                  or           sp, s9, t5
                  fclass.s     a5, fs2
                  andi         zero, t2, 1657
                  xor          s6, t1, s7
                  add          s2, s8, t3
                  ori          a3, s10, -1335
                  srl          a5, s6, s4
                  fcvt.s.w     fa1, s7
                  mulhsu       a6, s7, s9
                  sra          s4, s11, s6
                  fsub.s       fs8, fa0, fs2
                  slti         s3, a2, 1962
                  feq.s        ra, ft0, ft11
                  sll          t6, s0, s2
                  lui          a6, 218697
                  fcvt.w.s     t0, ft7
                  fmv.x.w      s0, fa5
                  rem          ra, s2, s7
                  fdiv.s       fs7, ft10, fs10, rmm
                  remu         t2, s9, s4
                  lui          t5, 438526
                  fmin.s       fa7, fa0, fs9
                  add          a3, zero, a0
                  fcvt.s.w     fs7, a3
                  fmv.w.x      fs10, a7
                  fsgnjx.s     fa1, fa2, ft2
                  ori          a6, a2, 913
                  fcvt.w.s     tp, fa6, rtz
                  fmv.x.w      a4, fs3
                  fle.s        tp, fa1, fs6
                  fmv.x.w      tp, fs2
                  fsgnjx.s     fs6, fs6, ft8
                  fadd.s       fa0, fs7, fa4, rtz
                  add          t6, a5, s11
                  slti         a0, t4, -1793
                  auipc        a7, 228000
                  sll          s7, t3, t6
                  fmv.w.x      fa4, a5
                  fmv.x.w      s6, fa4
                  xori         s3, a6, 857
                  srai         a0, a7, 7
                  ori          t0, gp, -1455
                  fcvt.wu.s    t0, ft10
                  sltiu        t2, s0, -28
                  sub          s0, sp, tp
                  slt          ra, a3, s5
                  fle.s        a3, fs0, fs0
                  fadd.s       fs0, ft3, ft2, rtz
                  or           s10, a4, s5
                  auipc        tp, 720509
                  ori          s0, s2, 728
                  fcvt.s.wu    fs10, a6, rup
                  fclass.s     s0, fs5
                  fdiv.s       fa2, fa2, ft4, rtz
                  slt          a1, a1, ra
                  flt.s        t4, fa6, fa4
                  remu         s6, ra, t0
                  fmin.s       fa6, ft7, fa3
                  fdiv.s       ft11, fs9, ft0
                  div          s6, a7, s8
                  andi         t0, t2, -268
                  fcvt.w.s     zero, fs11
                  fmv.x.w      ra, ft7
                  auipc        s10, 108950
                  fmv.w.x      ft9, gp
                  fmv.x.w      s1, fs11
                  or           gp, s2, s0
                  sub          zero, s7, a0
                  andi         s8, t2, -1809
                  fcvt.wu.s    t4, ft6, rmm
                  nop
                  fcvt.wu.s    s3, ft1
                  or           s4, a7, t3
                  fcvt.s.w     ft0, a1
                  fcvt.s.wu    fs2, sp, rup
                  fadd.s       fs7, fa4, fs6, rne
                  sub          s2, s7, t2
                  fmin.s       fa3, ft2, fs1
                  srl          s2, t1, s5
                  srli         tp, t1, 5
                  div          tp, tp, s0
                  nop
                  addi         t6, s8, -1701
                  or           s5, zero, s10
                  fadd.s       fa7, fs7, ft10
                  srli         a5, sp, 13
                  sra          t2, gp, t4
                  sll          s8, s5, t6
                  fmv.x.w      s2, fa6
                  sltu         t6, s10, gp
                  srli         a5, tp, 19
                  or           s5, sp, tp
                  feq.s        s1, fa7, fs11
                  slt          s10, s4, a7
                  and          s1, a0, s11
                  srai         a6, s8, 29
                  fmin.s       ft6, fa1, fs3
                  fclass.s     a7, fa7
                  nop
                  fmv.x.w      sp, ft3
                  slti         s0, t2, -1453
                  lui          s4, 117125
                  srai         s11, gp, 31
                  and          s7, s3, s11
                  fmv.x.w      s8, fs9
                  andi         tp, a0, -343
                  fcvt.s.w     ft11, a3
                  or           ra, t1, s1
                  fdiv.s       ft11, fa2, fs0, rne
                  and          s0, s5, s7
                  fclass.s     s4, fa1
                  sra          a4, s0, t4
                  fcvt.w.s     s11, fs11
                  feq.s        zero, fa4, fs8
                  sub          s0, t4, s3
                  slti         a3, s5, -1846
                  slti         a0, a6, -1404
                  fsgnjx.s     fa3, fa2, fs3
                  fmul.s       fs6, fs3, fa2, rne
                  srai         a2, t4, 2
                  sltu         t4, s1, s11
                  sll          t6, s2, a6
                  fcvt.w.s     ra, fs1, rmm
                  slti         a1, s11, -8
                  slt          a0, tp, a6
                  srli         a1, ra, 21
                  fdiv.s       fs8, ft2, fs10, rup
                  nop
                  sltiu        s11, s3, -925
                  remu         s11, s6, t0
                  fsub.s       fs3, ft6, ft2, rne
                  rem          tp, s4, a6
                  and          s5, a5, s9
                  rem          gp, t3, sp
                  fsub.s       fs4, fs11, ft6
                  fmax.s       ft0, fs8, fs5
                  sll          tp, zero, a7
                  fcvt.s.wu    fs5, s4, rup
                  mulhsu       a5, s11, t3
                  srai         s6, t3, 0
                  ori          s6, s7, 1156
                  fcvt.wu.s    a7, fs6
                  fle.s        s5, ft3, ft10
                  fsqrt.s      fs3, fa5, rtz
                  andi         gp, s4, 478
                  fsub.s       fa5, fs3, fs2
                  fle.s        a4, fa5, fs9
                  slti         t6, s9, -1961
                  fadd.s       ft4, ft7, fa2
                  mulh         a3, s8, t1
                  fle.s        s10, ft3, ft9
                  fsub.s       fs8, ft10, fa3, rdn
                  fsub.s       ft10, fs4, fa6, rdn
                  flt.s        a0, fs8, fs3
                  fle.s        s0, fa0, ft7
                  fcvt.s.wu    fs9, t2, rtz
                  srai         tp, a0, 12
                  slt          s4, s11, s3
                  fmin.s       fa3, fs0, fa2
                  rem          s4, a7, zero
                  add          t5, t3, s5
                  sll          t6, s11, s4
                  addi         tp, a2, -1214
                  fmin.s       fa4, fa6, fs2
                  fsgnjn.s     ft0, ft1, ft1
                  slli         s1, s0, 6
                  divu         s2, a7, zero
                  fsgnjn.s     ft1, ft6, fs1
                  fcvt.s.wu    fs9, a3, rtz
                  fmax.s       ft1, fs1, ft1
                  flt.s        s10, ft1, fa0
                  fmin.s       fs8, ft1, fs2
                  mulhu        t2, s10, ra
                  xori         ra, t5, 1578
                  auipc        a2, 445509
                  sltu         a0, tp, a6
                  auipc        t4, 264094
                  addi         tp, t2, -884
                  fmin.s       fs8, fs9, fa0
                  flt.s        ra, fs8, fs0
                  mulhu        ra, s6, zero
                  or           s3, t2, s6
                  sltiu        a2, s6, 1129
                  rem          a1, a3, t6
                  sra          t0, sp, s1
                  slti         gp, s10, 1582
                  flt.s        t6, ft6, ft11
                  srli         t0, a2, 17
                  xor          a2, s1, s4
                  fcvt.s.wu    fs11, t3
                  flt.s        a6, fs8, fa6
                  fmv.x.w      a5, ft0
                  fsgnjn.s     fs3, ft4, fa3
                  mulhu        s11, a7, a5
                  fmv.x.w      s5, fs6
                  slt          t2, ra, s5
                  nop
                  fsgnj.s      fs2, fs8, fs9
                  sra          tp, sp, a2
                  addi         a2, s0, 1835
                  mulhsu       s10, a4, ra
                  andi         s8, t5, 16
                  nop
                  fcvt.w.s     a1, fs2, rtz
                  fcvt.s.wu    ft4, tp, rdn
                  fcvt.s.wu    fa1, s3
                  fclass.s     t5, fa7
                  srli         a6, a6, 27
                  fsgnjn.s     fs7, ft3, ft4
                  mulhu        s0, a0, sp
                  sub          s10, s9, t2
                  fmax.s       fs6, fs0, ft8
                  lui          gp, 182853
                  fsgnj.s      fs0, ft4, ft9
                  nop
                  div          tp, a4, s3
                  auipc        ra, 84349
                  divu         s0, t4, s8
                  auipc        a1, 308136
                  auipc        gp, 321688
                  sltiu        zero, s9, 22
                  fsqrt.s      fs11, fs6, rmm
                  sltu         a1, zero, s7
                  srai         s4, zero, 11
                  andi         a0, s0, -1039
                  fcvt.s.w     fs9, zero, rne
                  addi         zero, s8, -178
                  remu         a0, zero, s6
                  flt.s        s5, ft10, fs4
                  xori         s8, s9, -269
                  fsub.s       fa6, fs9, fs1
                  or           t6, zero, s2
                  fsgnjn.s     ft9, ft9, fs10
                  xori         a4, a7, 853
                  fsub.s       fs8, fs7, fs11, rmm
                  mulhsu       s8, a3, a2
                  fsqrt.s      fa7, fs11
                  remu         ra, t2, a5
                  fcvt.s.w     fs9, t1
                  fmv.w.x      fs10, s5
                  xori         a0, s4, 1946
                  rem          s3, t5, a3
                  fadd.s       fa3, fs8, fa2
                  divu         a6, t6, s3
                  fcvt.s.wu    fa7, s7
                  div          s1, t6, zero
                  andi         zero, t4, -584
                  xori         t5, a3, -214
                  fcvt.s.wu    fs11, a6, rne
                  fclass.s     a7, ft11
                  feq.s        s2, fa4, fs4
                  lui          a4, 854157
                  fsub.s       fs8, fa1, ft8
                  xori         s10, t1, -1307
                  andi         s0, a5, 789
                  rem          t2, s0, a6
                  slti         t5, sp, 2020
                  feq.s        s3, ft9, fa3
                  add          s4, s1, a2
                  mulhu        t4, s4, s0
                  fmv.w.x      ft1, t6
                  ori          s4, s9, 1164
                  and          s3, s11, gp
                  auipc        s1, 208198
                  div          a0, sp, s7
                  divu         s4, s1, a6
                  fadd.s       fs7, fa4, fa7, rup
                  fsub.s       fa3, ft4, ft11, rup
                  fsgnjn.s     ft3, ft7, fs1
                  fsgnj.s      ft7, fs4, fs0
                  nop
                  addi         t2, s3, -697
                  sltiu        s7, a2, -1335
                  fcvt.s.w     fs9, tp, rup
                  slti         t2, s4, -452
                  fmax.s       fs3, fs8, fa1
                  fsgnjn.s     fa5, fs0, ft5
                  andi         s5, ra, -1402
                  fadd.s       fs2, fa0, ft11
                  sltiu        s6, s6, -1103
                  auipc        sp, 296508
                  fmv.w.x      fs8, a2
                  sra          t0, sp, t6
                  fmv.x.w      s6, fa0
                  fmul.s       fs4, ft6, fs0, rup
                  divu         a3, s4, a0
                  fadd.s       ft10, fa7, fa1
                  fsgnjx.s     fa0, fs9, ft7
                  or           a4, sp, t3
                  or           t0, ra, a6
                  mulh         a4, s11, zero
                  fcvt.wu.s    a7, fs3
                  fcvt.wu.s    s4, ft6
                  srai         s5, a2, 10
                  or           a2, a5, t6
                  fclass.s     a6, ft3
                  flt.s        s4, fs1, fs9
                  or           zero, t5, a4
                  auipc        a4, 477783
                  lui          gp, 102260
                  add          t6, t5, t2
                  srai         a1, a3, 14
                  fmul.s       fs0, fs6, fs10
                  feq.s        s7, fa1, fs10
                  fsgnj.s      fa3, ft1, ft6
                  srl          s5, gp, t6
                  flt.s        a7, ft5, ft9
                  fcvt.s.wu    ft7, s4
                  mulh         s5, sp, s9
                  fsgnjn.s     fa7, ft2, fa1
                  mulhsu       s2, a0, a6
                  fsub.s       fa7, ft9, ft6, rtz
                  fsub.s       fs7, ft5, fa6
                  ori          s5, a0, 306
                  flt.s        s2, fa6, fs9
                  fsub.s       fs3, fa5, fa5
                  fsqrt.s      fs6, ft0, rdn
                  fsub.s       ft3, fa2, ft1, rne
                  flt.s        ra, fs8, ft8
                  mulh         s1, ra, s5
                  slt          s6, gp, t2
                  or           a4, a4, gp
                  slt          s1, t3, a7
                  fadd.s       fs9, ft7, fs9, rdn
                  fle.s        t5, fs0, ft3
                  sltu         s11, t6, t0
                  sra          zero, sp, a6
                  nop
                  feq.s        a0, ft9, ft6
                  lui          s3, 661312
                  fadd.s       ft1, fa1, fs6, rtz
                  sra          t5, s6, t0
                  slti         t4, t3, 713
                  fcvt.w.s     sp, fs10, rdn
                  sra          s7, s1, s7
                  fcvt.s.w     fa6, t1, rdn
                  srli         a1, gp, 12
                  fcvt.s.w     fa4, s5, rup
                  srli         s3, t2, 18
                  sll          a4, t0, s11
                  fsgnjn.s     ft6, ft11, fs6
                  remu         a6, gp, t0
                  div          zero, s11, s8
                  sub          t2, s0, t5
                  sltiu        a5, t0, -1522
                  mul          a4, t1, a3
                  fcvt.s.w     fs6, t5
                  fclass.s     s1, ft1
                  fle.s        s6, ft0, ft1
                  rem          s3, s2, tp
                  ori          t5, s2, 186
                  divu         a4, s3, t6
                  xori         gp, a7, -435
                  addi         a5, s1, -1201
                  fmv.w.x      ft3, ra
                  or           t2, s8, a6
                  divu         s10, sp, s8
                  lui          a4, 615168
                  sra          s11, a3, a3
                  nop
                  fmv.w.x      fs10, a2
                  rem          a5, tp, t6
                  fmv.w.x      ft1, t5
                  fsgnjx.s     ft0, ft5, fa4
                  mulh         t2, t1, s8
                  sll          zero, gp, sp
                  mul          s7, zero, tp
                  addi         s7, s4, 252
                  slt          s3, t6, t1
                  fmin.s       ft4, fs5, fa2
                  sltu         t4, s7, s2
                  fsub.s       ft1, fs10, fa3, rup
                  xori         sp, t0, -166
                  fsgnjx.s     fa7, ft6, fs8
                  srl          s4, a6, a2
                  rem          s5, t5, a3
                  sltiu        a7, s4, 328
                  fmv.w.x      fs3, s8
                  fcvt.wu.s    a6, fs0, rup
                  xor          s7, a7, s3
                  feq.s        s5, fa1, fs2
                  srai         t4, a1, 22
                  auipc        a1, 532436
                  add          t4, t5, t4
                  mulh         sp, zero, s3
                  sltiu        a0, ra, -1161
                  fcvt.w.s     s6, fs9, rne
                  sll          a1, a0, t5
                  mulhu        s2, s10, zero
                  fsub.s       ft4, fa7, ft6, rne
                  fmax.s       fa0, fs1, ft10
                  fclass.s     t2, fa3
                  slti         s11, a5, 842
                  fclass.s     sp, fa1
                  nop
                  fcvt.wu.s    a1, fs8, rup
                  fsub.s       ft10, ft9, fa0
                  fsub.s       ft0, ft3, fa3
                  mulh         a7, ra, s10
                  or           tp, sp, tp
                  fmv.w.x      fa5, ra
                  div          s8, t6, t5
                  fsub.s       ft8, fa6, fa5
                  lui          a0, 152153
                  add          s11, zero, s1
                  srl          s0, a0, t6
                  lui          t2, 299219
                  fsub.s       fs7, fa6, ft6, rtz
                  mul          s0, s8, s3
                  sltiu        s10, s8, -122
                  sra          a1, s3, a6
                  fclass.s     zero, fs10
                  sra          a7, sp, a1
                  ori          s8, a1, -1239
                  fcvt.s.wu    fs2, a1
                  fsgnjn.s     ft6, ft5, fs11
                  fmv.x.w      zero, fs9
                  fcvt.w.s     t0, fs1
                  fsgnjn.s     fs7, fs0, ft6
                  feq.s        s2, ft5, ft1
                  mul          ra, t5, s3
                  divu         t2, t6, a6
                  fsgnjn.s     ft4, fs7, fa2
                  slti         t6, t1, 771
                  fcvt.s.w     fa0, a5
                  fmax.s       fs7, fs8, fs9
                  mulh         s1, a3, s9
                  fclass.s     a1, fa6
                  addi         s4, s2, -9
                  andi         s10, a7, 298
                  fmv.x.w      a1, fs0
                  xor          tp, a2, a4
                  fsgnjx.s     fs5, ft5, ft4
                  fsqrt.s      fa1, ft1, rup
                  fcvt.wu.s    s0, fa6, rdn
                  fle.s        a6, ft0, ft11
                  auipc        a0, 184973
                  fmax.s       ft7, fa3, fs1
                  addi         s0, s8, 745
                  srli         s6, a4, 24
                  srai         zero, t6, 9
                  divu         a2, s8, sp
                  andi         a3, s6, 1711
                  addi         s5, a3, 1180
                  fadd.s       fa2, fs9, fa2, rmm
                  fadd.s       ft0, fa3, fs2
                  srai         t6, a6, 14
                  andi         s7, a4, 2029
                  xor          s1, a4, a1
                  lui          a0, 846574
                  fcvt.s.w     fs10, s2, rtz
                  fmul.s       fa0, fa2, fs5, rdn
                  sltiu        s11, t1, 1170
                  lui          s11, 619144
                  feq.s        s7, ft6, ft5
                  srl          s5, s10, s5
                  fmul.s       ft6, fa5, fa7, rtz
                  slt          a4, a5, s8
                  fcvt.w.s     a7, ft1, rdn
                  fdiv.s       ft11, fa6, fa4
                  divu         s7, tp, s4
                  sll          t2, s6, s0
                  mul          t0, a7, t1
                  slti         a0, s6, -339
                  mulh         t4, a7, a6
                  auipc        a4, 754987
                  lui          sp, 238915
                  fsub.s       ft6, ft9, fs8, rup
                  nop
                  mulhsu       s7, a6, s4
                  sltiu        s1, s10, -1758
                  nop
                  fmul.s       fs8, fs11, ft1, rdn
                  addi         a0, a4, 1172
                  fclass.s     t2, fs3
                  sll          ra, t2, s11
                  sltu         s6, t5, s11
                  fmv.x.w      s7, fa7
                  xor          sp, s10, s6
                  sltiu        gp, s0, 76
                  xori         a5, ra, -283
                  fmv.w.x      ft5, s0
                  lui          a5, 974831
                  xor          s6, a6, s4
                  divu         ra, s11, t1
                  fsgnjn.s     fs8, fa7, ft8
                  slti         ra, s6, 485
                  mulh         s1, s5, a3
                  fsqrt.s      ft9, ft9, rmm
                  divu         s8, t2, t6
                  slt          a1, ra, t4
                  mulhsu       s3, s6, sp
                  fmax.s       ft4, ft3, ft3
                  and          s5, a7, zero
                  fdiv.s       ft6, fs2, fa0, rdn
                  fsgnj.s      ft6, ft10, fs9
                  slt          s5, s2, s5
                  fcvt.s.wu    fs0, s3, rmm
                  mulhsu       a3, t6, s3
                  fle.s        a7, fs10, ft4
                  fsub.s       ft5, ft6, fs3, rup
                  fsgnjn.s     ft6, fs6, ft11
                  addi         s4, ra, -1515
                  fmax.s       ft0, ft6, ft4
                  sll          t6, s4, s1
                  fcvt.w.s     t2, ft10
                  fadd.s       fs2, ft10, fs6, rne
                  sll          s3, s10, a1
                  srli         s0, sp, 18
                  sll          t0, t2, t5
                  or           a6, s9, zero
                  slli         a5, s1, 3
                  and          t5, s4, a3
                  fcvt.w.s     t2, ft6
                  lui          s1, 540988
                  fsgnj.s      fs3, ft6, fs8
                  add          zero, s6, t3
                  sltu         s1, s6, a5
                  div          a1, a1, a2
                  fcvt.w.s     t6, fs10, rup
                  xor          t4, s10, s0
                  fsgnjx.s     fa7, ft10, ft0
                  fmv.w.x      ft4, a7
                  fcvt.wu.s    a5, fa1, rtz
                  divu         t2, s5, t6
                  fmax.s       fs0, ft5, ft11
                  feq.s        s7, fa1, ft1
                  fcvt.w.s     s5, ft3, rup
                  fcvt.s.wu    fa1, s8
                  sll          t0, zero, t3
                  sra          ra, t0, t4
                  xor          ra, s8, tp
                  mulhu        a5, t1, s11
                  divu         gp, s3, s0
                  fclass.s     s0, ft0
                  fcvt.s.w     fs9, tp
                  mulhsu       s11, t5, s7
                  sltu         s1, a5, s1
                  fsgnj.s      ft8, ft1, fs9
                  fadd.s       fa4, fs5, fs11
                  remu         s11, s7, a7
                  sra          s4, t0, s3
                  fsqrt.s      ft8, fs3, rdn
                  sub          s1, a1, a2
                  fdiv.s       fa5, ft7, fa4
                  or           s2, s10, t0
                  sub          s8, t4, t6
                  sltiu        gp, s10, -272
                  fcvt.w.s     s10, fa1, rne
                  mul          ra, s9, gp
                  add          zero, a7, a1
                  feq.s        a0, fa2, fs0
                  slti         tp, a4, -355
                  add          s3, a6, a7
                  srai         a4, s10, 13
                  srai         s4, t3, 6
                  fsgnjn.s     ft7, fa5, fs2
                  srl          s10, t5, t3
                  addi         s5, a7, -1799
                  sltu         t6, a6, s11
                  andi         t5, a2, 986
                  srai         sp, a0, 29
                  fmv.w.x      ft3, zero
                  fsgnjx.s     fa3, fs10, fa5
                  fsqrt.s      ft5, ft3
                  fdiv.s       fs1, fs5, fs6, rdn
                  lui          t4, 121413
                  srli         a4, s5, 30
                  fclass.s     a4, ft10
                  sll          s11, t6, t2
                  mulhsu       sp, t3, s1
                  fsgnjx.s     fs11, ft3, ft4
                  srl          a0, a5, s3
                  sltiu        a3, s2, -1678
                  mul          s1, gp, sp
                  fmul.s       fs2, fs6, ft4
                  slt          gp, s10, s0
                  fmul.s       fs3, fs10, fa7, rtz
                  fsgnj.s      fa5, ft7, fa6
                  fcvt.wu.s    a0, fa1
                  mulhsu       s6, a2, ra
                  fsqrt.s      ft7, fs5, rne
                  auipc        a3, 593511
                  or           s5, t0, a6
                  sltiu        s6, gp, -250
                  addi         zero, s10, 1323
                  fmv.w.x      ft7, s10
                  mulhu        s2, a4, t2
                  fcvt.wu.s    a0, ft4, rup
                  fcvt.s.w     fs6, s8, rup
                  srl          ra, ra, s10
                  div          t5, s9, s0
                  fsgnjn.s     fs9, fs3, fs5
                  srli         s3, a4, 23
                  sra          tp, t5, sp
                  srl          t6, t4, a3
                  fcvt.w.s     t5, ft3
                  andi         tp, s8, -1964
                  rem          a3, a6, a5
                  and          t5, a6, s6
                  sll          t2, gp, s5
                  fcvt.s.wu    fs8, s8
                  mulhsu       t5, a2, a5
                  fsqrt.s      ft10, fa0
                  or           t6, a2, s0
                  slt          ra, t6, a5
                  srli         s10, s4, 14
                  srai         s11, a1, 1
                  lui          s5, 861090
                  fcvt.wu.s    a3, ft2
                  fsub.s       fs7, fs3, ft5
                  slli         a4, s3, 2
                  mulhsu       sp, s7, sp
                  sll          s5, a6, zero
                  or           gp, t3, s3
                  auipc        s5, 882029
                  or           s7, s10, s11
                  fclass.s     s0, ft1
                  fclass.s     ra, fa6
                  sra          t0, t5, t4
                  fcvt.w.s     s3, fs4, rup
                  slti         s6, s10, 1992
                  fdiv.s       ft2, fs7, fs10
                  fcvt.s.w     fs10, s3, rne
                  or           s3, s5, s4
                  rem          a4, a6, t3
                  fmul.s       ft4, fs3, fa5
                  fcvt.w.s     a5, fs8, rne
                  srl          gp, t6, sp
                  fcvt.w.s     s0, ft10
                  fmv.w.x      fs11, t2
                  add          s0, s9, a6
                  mulh         s0, t4, a2
                  mulh         s7, s6, a5
                  mulhsu       a2, s10, t4
                  sltiu        s5, t0, -1723
                  sltiu        a4, tp, -1093
                  fcvt.s.wu    ft0, s8, rdn
                  remu         s4, gp, s4
                  auipc        s11, 734497
                  div          zero, ra, t2
                  fcvt.wu.s    s0, fs1
                  remu         t4, a0, a6
                  mulhu        gp, s5, s7
                  fmax.s       fa2, fs7, fs7
                  fmv.w.x      fs5, t3
                  fclass.s     a5, ft6
                  fcvt.w.s     s3, fs0, rdn
                  xori         s1, sp, 456
                  addi         gp, ra, 599
                  div          s8, sp, t0
                  flt.s        s10, ft5, ft9
                  sll          s0, s9, t3
                  sra          s8, gp, t3
                  fadd.s       fa3, fa0, ft11, rup
                  srli         zero, t3, 6
                  sll          t5, s4, t1
                  divu         t6, t0, a6
                  div          a3, sp, a2
                  fsgnj.s      fs9, ft8, ft1
                  slli         t4, sp, 30
                  xori         a0, tp, 1772
                  remu         s10, a7, s3
                  nop
                  srl          tp, a0, zero
                  fmv.x.w      a5, ft1
                  sra          s1, a3, s2
                  xori         s3, s0, -758
                  nop
                  add          t0, a5, t6
                  ori          s5, a7, -527
                  fmul.s       fs6, fa7, ft5, rmm
                  srli         sp, a6, 8
                  sll          t6, sp, s7
                  flt.s        t5, ft2, fa0
                  feq.s        s11, fs10, ft2
                  fmin.s       fs8, fs3, ft4
                  sltiu        s4, s7, 1055
                  mulh         gp, t6, s5
                  xor          a6, s8, s0
                  fsub.s       fs4, fs10, ft8, rne
                  remu         s1, a0, a6
                  mulhu        a3, a5, a0
                  fadd.s       fa1, ft9, fa6, rmm
                  slt          a7, a1, s1
                  add          s0, a1, t1
                  sltiu        t4, s5, 206
                  lui          a3, 911856
                  fmul.s       ft0, fs3, fs1
                  xori         sp, sp, -588
                  fmv.w.x      ft1, s0
                  or           a0, t6, t4
                  xor          a1, s6, s11
                  sltiu        a4, s3, 995
                  fmax.s       ft7, fs2, fs5
                  sltu         ra, a0, a1
                  fcvt.s.wu    fs7, s5
                  fmul.s       fs6, fa1, fa6, rup
                  xor          t2, s10, t5
                  nop
                  fmv.x.w      a4, fs11
                  slti         a3, a0, 1810
                  mul          gp, s11, s0
                  srli         tp, t6, 3
                  slt          a0, t6, a5
                  mulhu        t5, a7, tp
                  mulhu        s1, a3, a5
                  sll          s5, t0, s2
                  sra          s5, s5, s11
                  fsgnj.s      ft11, fa1, fa3
                  slli         t4, a0, 26
                  fmv.x.w      sp, ft4
                  auipc        s7, 622480
                  slt          ra, t5, ra
                  mulhu        t2, t1, s11
                  srai         t2, a6, 31
                  sra          s2, s8, t3
                  srli         s0, s2, 16
                  srli         t6, tp, 5
                  addi         s4, s1, 154
                  mulh         tp, a5, s1
                  fcvt.s.w     fs5, tp, rne
                  fcvt.w.s     s4, fs11, rtz
                  sltiu        t2, s1, 1163
                  xori         s3, a2, -328
                  srl          a5, a1, s3
                  fcvt.w.s     s4, fs2, rtz
                  addi         t0, t6, -627
                  mulh         s8, s9, a6
                  andi         a5, s8, -727
                  fcvt.wu.s    zero, fs4
                  divu         sp, a6, s0
                  srl          s0, s10, s1
                  add          a6, gp, t6
                  fmv.w.x      ft9, s0
                  lui          s11, 259866
                  ori          a5, s3, -97
                  slt          sp, a7, s8
                  fcvt.wu.s    a2, fa1, rdn
                  fle.s        s1, fa1, fs4
                  sra          t4, a7, t0
                  lui          t0, 436892
                  fmax.s       fa3, fs8, fs1
                  div          s6, t4, s11
                  div          ra, s3, a4
                  fcvt.s.w     ft3, s6, rdn
                  or           a1, s6, sp
                  div          s11, s1, s6
                  nop
                  feq.s        t6, fs7, ft8
                  rem          s4, s4, t3
                  fsqrt.s      fa7, fa6, rdn
                  feq.s        a5, fs11, fa0
                  mulh         a4, s7, s10
                  mulhsu       a7, a4, s7
                  fmv.w.x      fs3, s9
                  mul          s4, s2, s4
                  lui          s3, 868988
                  fmax.s       fa5, fs5, fs4
                  auipc        t6, 867786
                  slt          s2, ra, t4
                  sub          s3, t2, s2
                  xori         s11, t4, 210
                  sltu         a5, t0, a3
                  mul          a4, a3, s9
                  add          s11, s1, a2
                  mulhu        s4, t6, t1
                  fcvt.wu.s    tp, ft7, rne
                  fcvt.s.w     fa4, a0, rup
                  andi         s0, a3, -772
                  ori          s8, s10, 1310
                  fsqrt.s      fa5, ft7
                  sltiu        gp, t4, 339
                  fle.s        s8, fa3, fs4
                  nop
                  sub          s7, t3, s1
                  mulh         s4, t3, gp
                  feq.s        gp, fs2, ft4
                  addi         a6, gp, -721
                  fcvt.s.w     fa0, a5, rmm
                  fcvt.wu.s    s2, ft1, rtz
                  fcvt.w.s     a6, fa5
                  remu         s10, s4, a2
                  lui          a7, 153993
                  xor          s7, ra, s3
                  sra          tp, ra, s9
                  flt.s        s11, ft10, fs7
                  lui          s5, 938993
                  fcvt.s.wu    fa3, s1, rup
                  nop
                  mulh         a0, s0, s1
                  mulhsu       a7, a5, t2
                  feq.s        s0, fs9, fs6
                  sra          a3, s10, a6
                  fsub.s       fs11, ft10, ft7
                  mulh         ra, s5, s2
                  fle.s        t6, ft11, ft0
                  fclass.s     s7, fa3
                  sub          s10, s7, s4
                  remu         s7, t6, s2
                  addi         ra, t0, -1028
                  fcvt.s.wu    fa6, s6
                  slti         s4, s0, -1490
                  or           a5, sp, t6
                  xori         s5, a0, 106
                  fsgnjn.s     ft10, ft0, fs8
                  fclass.s     t4, ft4
                  fcvt.wu.s    a1, ft8
                  sll          tp, s10, s0
                  divu         s6, t2, tp
                  fmul.s       ft0, fa7, fs7
                  rem          a7, a2, gp
                  fsgnj.s      fa5, fs8, ft5
                  sltiu        s11, s10, -293
                  fsqrt.s      ft3, ft0
                  mulhsu       s6, t5, a1
                  rem          t0, s8, t5
                  addi         a4, t2, 1818
                  xor          s1, a1, a6
                  mulh         t2, t4, s8
                  mulhsu       a3, ra, s10
                  fmv.w.x      ft6, t2
                  xori         s0, gp, 980
                  fsgnjx.s     ft11, fs1, fs3
                  fmv.w.x      ft9, a4
                  sra          t5, t2, t0
                  srli         s6, zero, 1
                  remu         a6, s7, a1
                  auipc        zero, 702769
                  slli         t0, t3, 28
                  mulh         gp, s4, t6
                  srai         t4, a3, 20
                  fmv.w.x      ft11, a4
                  ori          s6, s8, 1124
                  fcvt.wu.s    a0, fa6
                  fsqrt.s      fs7, ft0, rup
                  remu         sp, t4, a6
                  mulhu        a1, s1, a5
                  fclass.s     a3, ft1
                  and          s1, ra, s9
                  fcvt.s.w     ft2, tp
                  fcvt.s.w     fa4, t3, rne
                  fcvt.wu.s    a7, fs6, rup
                  sll          t6, s3, s11
                  xor          sp, a7, a4
                  or           s6, sp, s3
                  add          s2, s7, s4
                  fmul.s       ft6, ft5, fs10
                  slt          a7, gp, zero
                  fmax.s       ft5, ft7, fs1
                  fcvt.w.s     a4, fs2
                  fclass.s     a1, fa2
                  srli         s3, t3, 10
                  mulhsu       s10, t6, t6
                  fmax.s       ft7, ft2, fs0
                  remu         s11, t4, s10
                  mulhsu       t4, tp, zero
                  fcvt.s.wu    fa5, s2, rne
                  add          tp, t5, a5
                  sltu         a5, t4, a6
                  and          s6, a3, s6
                  mulhu        s0, a0, s1
                  addi         s3, sp, -862
                  mul          a2, s10, s10
                  or           gp, s4, s11
                  rem          s7, s0, tp
                  remu         s11, a1, s10
                  fmul.s       fs1, ft10, ft9, rne
                  sll          s7, t1, sp
                  fadd.s       ft6, fs7, fa3
                  or           t0, a7, t6
                  slti         sp, gp, -1746
                  fsqrt.s      ft9, fs6
                  fadd.s       fa4, fs1, ft11, rtz
                  addi         s6, t4, -2029
                  sltiu        zero, gp, 819
                  fcvt.s.wu    ft0, s8
                  rem          t0, s5, t6
                  sra          t4, s8, t3
                  fmax.s       fa3, fs8, ft9
                  srai         s2, t5, 5
                  lui          t4, 776198
                  srai         t6, a1, 15
                  addi         s2, zero, -1900
                  mul          s5, s11, a5
                  fle.s        t6, ft11, fa0
                  divu         a7, a0, s8
                  sra          a7, a6, s1
                  or           s11, a6, s3
                  lui          s3, 1025087
                  slli         s2, t1, 18
                  or           s11, s0, t1
                  srai         t6, t2, 20
                  fmin.s       fs10, fa4, fs1
                  fdiv.s       fs10, ft9, ft1
                  auipc        s0, 322937
                  andi         a5, t0, -903
                  div          a4, s7, t3
                  fsub.s       fa4, ft8, fs3
                  sll          a2, t2, a3
                  srl          a1, s11, t2
                  fadd.s       fa1, fs2, fs2, rmm
                  fcvt.s.wu    fs4, s9, rne
                  rem          s6, t1, a6
                  fle.s        s2, fs5, ft10
                  fmul.s       fa4, fs11, fs2
                  sltiu        s0, t1, 1099
                  addi         ra, a2, 1223
                  fmax.s       ft4, ft4, fs8
                  fdiv.s       fs5, fa5, fs3
                  rem          t0, sp, t1
                  fle.s        ra, fa3, ft0
                  or           s3, a5, s8
                  addi         a1, s10, 2044
                  divu         a2, t3, sp
                  sub          a6, s0, t1
                  slli         t0, t5, 29
                  sll          a6, a1, t2
                  divu         t5, s4, t1
                  fmax.s       ft2, ft2, fs5
                  mulhsu       t0, s10, t2
                  mulhsu       s5, t4, t2
                  add          a4, s4, s1
                  sll          sp, t5, s4
                  fcvt.s.w     ft11, a6, rmm
                  slti         s6, t3, 788
                  andi         a4, a3, 1142
                  ori          s6, t6, 356
                  fsgnjn.s     fs5, ft11, ft8
                  xori         a2, a1, -845
                  rem          sp, s3, s11
                  fdiv.s       ft10, ft10, ft1
                  slt          s4, t1, t1
                  fmin.s       fa4, fa0, fs6
                  sra          s1, s3, a5
                  fcvt.s.wu    fa3, t2
                  fmv.x.w      a1, ft3
                  add          t5, s0, t1
                  remu         gp, s0, s5
                  xori         a4, a2, 1105
                  sltu         s4, t4, s6
                  fmv.x.w      s8, fa5
                  fmul.s       ft0, ft1, ft6
                  divu         s7, t0, zero
                  fclass.s     sp, ft7
                  fmv.w.x      fa4, s7
                  lui          t0, 956179
                  sltu         s6, ra, sp
                  and          s6, sp, s9
                  slti         a4, a3, -409
                  sltu         t6, s2, a1
                  fsub.s       ft1, ft5, fa6, rne
                  or           zero, s2, s8
                  addi         a7, s11, -983
                  fcvt.s.wu    ft10, s6, rtz
                  div          s10, s0, a7
                  fmv.w.x      fa7, s1
                  sub          s3, s5, a0
                  fmv.x.w      a2, ft0
                  sra          s10, t6, t2
                  lui          s5, 232074
                  rem          t0, a7, t2
                  fcvt.s.wu    ft11, a3
                  divu         s5, t5, s4
                  ori          a0, a7, -1118
                  sltiu        a6, a0, 1938
                  fsub.s       fs11, fs2, fa4, rdn
                  fcvt.s.wu    fa7, t6, rtz
                  slt          ra, sp, a7
                  or           t2, s4, s6
                  fle.s        s11, fa2, ft1
                  fcvt.s.w     ft1, s8
                  slli         a5, a4, 19
                  fcvt.s.w     fs0, s11
                  addi         a0, t2, 715
                  auipc        a2, 194324
                  or           zero, gp, s4
                  fsgnjn.s     fa7, ft1, fs6
                  slli         s6, s8, 22
                  remu         t0, t0, a3
                  sltu         s10, s0, t0
                  sltiu        t0, s2, 884
                  srai         t0, s3, 29
                  srai         a4, t5, 19
                  add          a5, s6, a3
                  srai         zero, s9, 9
                  sra          s1, s10, t5
                  fadd.s       fa7, fs3, fs8
                  fcvt.s.w     ft1, sp, rmm
                  sltiu        s2, sp, 454
                  mul          s1, s10, t2
                  fsgnjx.s     fs7, fs5, fa4
                  div          s10, s6, a3
                  fle.s        t5, fs0, fa2
                  add          a1, a2, t2
                  mulh         t4, s9, tp
                  andi         s1, tp, -551
                  xori         s7, sp, 1655
                  fmv.w.x      fs4, ra
                  fsgnj.s      fs4, fs0, ft11
                  xor          s1, a2, s6
                  mulhsu       ra, s5, s8
                  sub          s10, s1, s6
                  srli         tp, t4, 9
                  slt          s2, a7, ra
                  ori          s0, ra, -1936
                  ori          tp, s1, 1018
                  or           a1, t1, t3
                  auipc        s0, 993291
                  rem          t4, gp, t0
                  slt          gp, t3, t5
                  lui          t4, 550061
                  srli         t6, t1, 13
                  addi         ra, tp, -1491
                  mulhu        a3, a5, tp
                  fsqrt.s      fs10, ft6, rmm
                  srl          t4, ra, a6
                  divu         ra, a5, tp
                  fcvt.s.w     ft0, s9, rmm
                  xor          s7, zero, zero
                  xor          ra, tp, a7
                  sll          t6, t5, s6
                  fmax.s       ft1, fs0, ft11
                  slti         a0, a7, 1188
                  fsgnjn.s     ft2, ft7, fs1
                  srli         s10, s11, 2
                  lui          s1, 374231
                  feq.s        t6, fs9, ft6
                  fcvt.wu.s    a1, fs7, rne
                  srl          s1, t2, t1
                  mulhsu       a4, a0, zero
                  slli         t5, t1, 10
                  mulhu        a1, t1, a1
                  feq.s        ra, ft2, fs5
                  remu         sp, s7, s7
                  sub          t0, a2, a0
                  feq.s        t4, fs1, ft11
                  add          a7, s2, s7
                  fsub.s       fs7, fs1, fs9, rup
                  remu         s6, t6, t2
                  remu         s2, a3, s2
                  slli         a6, zero, 0
                  fsgnj.s      fs10, fs10, fa6
                  remu         a5, sp, s5
                  flt.s        t2, ft2, ft6
                  and          zero, s1, t1
                  slli         tp, s4, 25
                  fadd.s       fs1, ft10, fs8, rdn
                  srli         s5, t6, 20
                  add          gp, t0, t6
                  fadd.s       fs5, fs6, fa0
                  slli         a7, a6, 14
                  fadd.s       fa4, ft3, fa1, rdn
                  lui          t4, 846578
                  fcvt.s.w     ft4, a4
                  fcvt.s.w     fs7, s4, rtz
                  sltiu        s6, a1, -887
                  ori          s4, t6, -2034
                  srl          s0, sp, s0
                  fcvt.w.s     a3, fs3, rtz
                  and          s0, a1, s4
                  remu         a3, tp, s7
                  fmv.w.x      fs5, t1
                  fmul.s       ft2, fa3, fs5, rmm
                  fcvt.wu.s    s4, fs2
                  mulh         s11, s9, t2
                  mulh         s4, s10, t0
                  fsqrt.s      ft3, fa1, rup
                  slt          tp, ra, s0
                  fsgnjn.s     ft1, fs10, fa7
                  mul          tp, t0, tp
                  fdiv.s       fa2, ft2, fs1
                  fclass.s     a1, fs7
                  remu         sp, a7, zero
                  auipc        s8, 207943
                  fmin.s       fs4, fa0, fs3
                  mul          a5, a5, tp
                  or           a1, s6, s9
                  nop
                  and          a1, t2, t4
                  divu         t5, t2, s0
                  fmin.s       ft6, fs6, fs5
                  fsqrt.s      fs0, ft0, rtz
                  fcvt.s.wu    ft11, sp
                  add          t4, a5, s9
                  sltu         t2, t5, t3
                  xori         s3, s5, -854
                  sltu         a4, a4, t1
                  fcvt.s.wu    ft9, t6, rtz
                  sra          a5, gp, s4
                  mulh         t2, t4, s4
                  xori         s11, zero, -1370
                  fle.s        s10, ft5, fs6
                  add          sp, s0, t5
                  mulh         t4, t3, t5
                  slt          s1, t2, t0
                  fmv.w.x      fs11, s10
                  lui          s1, 866988
                  remu         s4, t3, s4
                  mulhu        t0, s4, t5
                  auipc        t4, 961437
                  fsqrt.s      fs7, fa5
                  fsgnjn.s     ft10, ft5, fa7
                  srli         s4, a7, 10
                  rem          t2, s4, s7
                  fsqrt.s      ft10, fs6
                  fcvt.w.s     gp, fs4, rup
                  nop
                  fle.s        s8, fa2, fs5
                  srai         s7, sp, 8
                  fsqrt.s      ft1, ft9, rne
                  fsgnj.s      ft4, fs2, ft1
                  fcvt.w.s     s0, fs5, rne
                  remu         s5, t2, s6
                  fcvt.s.w     ft11, a2, rmm
                  div          a6, gp, a2
                  fdiv.s       ft7, ft9, fs4, rdn
                  srl          t2, a4, s9
                  mulhsu       s8, a6, s3
                  fcvt.wu.s    s7, fs2, rup
                  fsgnjn.s     ft11, fs0, ft9
                  sub          sp, a3, a2
                  xori         a2, a2, -1265
                  fsqrt.s      fs6, ft1, rup
                  remu         s11, a1, s1
                  fmax.s       ft1, ft3, fa0
                  fcvt.s.wu    fs3, s8, rup
                  slt          a4, s6, tp
                  add          a4, t1, s6
                  or           a1, ra, ra
                  auipc        a4, 588423
                  ori          t2, t3, -676
                  sltiu        ra, s0, 145
                  lui          a2, 842018
                  srl          a0, t0, t4
                  fmin.s       ft0, ft1, fa1
                  div          sp, s1, sp
                  xori         s2, sp, 803
                  flt.s        gp, fa7, fs9
                  fadd.s       ft9, fs9, fs7, rmm
                  xor          s8, a6, t0
                  fdiv.s       ft8, fa7, fs11
                  fmax.s       fs6, fs0, fa7
                  fsqrt.s      fs8, fa6
                  div          s3, s11, t2
                  sll          a1, s10, t0
                  sltiu        t2, s6, -56
                  addi         sp, s5, 1374
                  mul          s11, t5, a4
                  andi         zero, s11, -963
                  fcvt.s.w     fa3, tp
                  fsub.s       ft6, ft10, ft6, rup
                  slti         ra, s6, 1309
                  rem          zero, a7, t1
                  divu         a4, a7, sp
                  remu         ra, a4, s7
                  sub          s7, t6, tp
                  and          a0, s9, s0
                  ori          s8, s3, 1416
                  fsqrt.s      fa1, fs5
                  and          t4, a1, a2
                  addi         tp, s11, -1387
                  fsgnjx.s     fa1, ft8, fs6
                  sltiu        a7, s9, 1562
                  fle.s        s1, fa5, fs2
                  srai         sp, s2, 9
                  remu         s11, s6, s11
                  sra          sp, a3, a2
                  srl          t0, gp, tp
                  add          sp, a0, a3
                  srl          a6, s6, s11
                  fclass.s     s4, fa6
                  feq.s        s1, fa4, fa0
                  remu         a0, a5, a6
                  srl          s3, s0, a5
                  fmul.s       fa4, ft11, fs6, rne
                  auipc        s2, 457187
                  fmax.s       ft4, ft7, ft4
                  ori          a6, a0, -1602
                  fadd.s       ft6, fs9, fs2, rtz
                  ori          a7, s4, -1594
                  fmv.w.x      ft8, s3
                  slt          t6, sp, a6
                  srai         a1, s2, 6
                  fdiv.s       fa0, fa4, ft5
                  xor          t4, s5, s11
                  fmax.s       fa6, fa2, ft0
                  fsub.s       fs3, ft9, fs6
                  fsqrt.s      fs8, fs3
                  fmv.x.w      a4, fa2
                  fclass.s     s10, fs8
                  fadd.s       fs3, fs9, ft0
                  fsub.s       fa7, fa0, fa2, rtz
                  xor          s8, t2, tp
                  fmv.x.w      s4, fs10
                  sltu         a7, s7, a1
                  xori         a3, a1, 17
                  fsgnjn.s     ft4, ft10, ft1
                  fsqrt.s      fa7, fs2
                  and          s1, s2, s11
                  srl          s3, t6, t0
                  fsgnjx.s     fs0, fa0, ft11
                  fmin.s       fa2, fs5, fs3
                  nop
                  fsgnj.s      fs0, fs3, fs6
                  or           a6, tp, s6
                  srl          t5, a3, s5
                  fsgnj.s      fa2, fa7, fs10
                  nop
                  fcvt.s.wu    fs5, s11
                  feq.s        s3, fa5, ft8
                  xori         s3, t1, 366
                  srl          a2, s5, a7
                  fsub.s       ft7, fa4, fa7
                  div          t6, a0, ra
                  divu         s6, a4, s7
                  fsqrt.s      ft9, fs2, rtz
                  add          t2, t6, s8
                  auipc        a3, 631001
                  fcvt.w.s     s11, fa6, rne
                  fsgnjn.s     ft3, fs1, fs1
                  feq.s        a2, fs2, ft8
                  div          a3, a5, s7
                  slti         a2, t2, 308
                  fmin.s       ft0, ft0, ft5
                  fdiv.s       fa3, fs6, ft11, rdn
                  fadd.s       ft2, fs6, fs0, rtz
                  fsqrt.s      fa4, fa0
                  remu         a5, gp, zero
                  slt          s5, a4, s0
                  fsgnjn.s     fs7, fs6, fa0
                  divu         s4, s1, s10
                  slli         s0, a4, 10
                  fcvt.w.s     t4, ft5, rmm
                  rem          s1, t5, a1
                  add          tp, s9, s9
                  xor          t5, t2, t2
                  mulh         t0, t3, a3
                  feq.s        s0, fa2, ft8
                  auipc        s11, 413290
                  and          a5, a3, s11
                  div          s6, s5, t4
                  fmul.s       ft2, ft6, ft3, rup
                  fdiv.s       ft6, ft3, fa4, rup
                  fsgnjn.s     fs2, fs11, fa7
                  sub          a4, ra, s2
                  fmul.s       fa5, fs5, ft4, rmm
                  add          t5, t5, t4
                  fmax.s       fa2, fa4, ft0
                  xori         s3, a0, -1136
                  or           s0, a7, s10
                  xori         a3, s5, -1806
                  fmin.s       ft1, fa1, ft8
                  fsgnjx.s     fs2, fa2, fs3
                  fle.s        tp, ft0, ft4
                  sra          s5, tp, a7
                  srl          a5, a7, s11
                  auipc        s4, 87842
                  flt.s        s2, fs7, fs2
                  and          a0, s7, gp
                  fsub.s       ft5, ft0, ft0, rmm
                  mulhu        a1, a6, s2
                  fsub.s       ft9, fs10, fa1
                  fmax.s       ft9, ft5, fs3
                  fmv.w.x      ft8, zero
                  div          s2, ra, s11
                  mul          ra, a7, s10
                  fmax.s       ft5, fs0, fa6
                  mulhsu       a4, s6, a5
                  feq.s        a4, fs10, fs2
                  sub          s4, a3, a7
                  or           a0, gp, t1
                  fcvt.s.wu    fa3, a0, rmm
                  add          s7, s3, t5
                  xori         s3, a2, 1589
                  sltiu        s2, t6, 184
                  mulh         t0, a6, t4
                  remu         s2, a5, a3
                  xor          a1, s6, gp
                  fcvt.s.wu    fa6, a1, rmm
                  xor          a2, s7, s9
                  fcvt.s.wu    ft2, a1
                  fmv.x.w      ra, fa1
                  fdiv.s       fa5, ft8, fa7
                  div          s3, a2, a4
                  mul          a4, t6, t2
                  addi         sp, s2, -1053
                  srai         a0, a1, 31
                  xori         s3, t3, 1816
                  sub          a5, s3, s7
                  and          s0, a1, ra
                  div          s5, s4, s5
                  xor          zero, s11, s4
                  mulhsu       s0, t4, a0
                  rem          s0, a0, t3
                  div          s8, t4, a6
                  and          a0, t6, a3
                  srl          a0, ra, a1
                  divu         s7, s1, s0
                  mulhu        s7, s10, t5
                  fle.s        s6, fa3, ft3
                  feq.s        s4, fs3, ft0
                  fclass.s     t0, ft2
                  fsgnjx.s     fa0, fs10, fa0
                  lui          s0, 665589
                  fmul.s       ft11, fs3, fs0, rne
                  fmul.s       fa0, fa4, ft2, rne
                  fcvt.wu.s    s10, ft2, rup
                  divu         a4, s0, t1
                  slti         tp, s4, 984
                  sltiu        s8, s8, -1749
                  srl          gp, s6, s11
                  slt          zero, ra, s10
                  fle.s        t6, fs7, fs0
                  nop
                  sra          t6, ra, t3
                  auipc        a4, 102903
                  srli         t6, a3, 10
                  fsub.s       ft11, fa5, fa2
                  sll          a4, t1, a0
                  fsqrt.s      fs6, fs0, rdn
                  xori         gp, s6, 689
                  fdiv.s       fa0, fa3, fa2
                  fmul.s       ft1, fs6, ft10, rne
                  fsgnj.s      ft5, ft4, fs2
                  slti         a6, s7, 1304
                  fmax.s       ft8, fs0, ft8
                  fmin.s       ft9, ft4, fa0
                  fcvt.w.s     a4, fa0, rne
                  addi         s1, s6, 713
                  fsub.s       fa3, fa7, fs7
                  flt.s        s0, ft9, fs5
                  addi         s8, s6, -1544
                  fcvt.s.wu    fa1, a1
                  slli         t2, s5, 15
                  rem          s1, a3, a2
                  or           s1, a7, sp
                  fsgnjx.s     fa3, ft4, fs4
                  slti         s4, ra, -1507
                  addi         tp, t6, -1162
                  fcvt.w.s     t6, ft5
                  or           s3, s7, s5
                  srli         t2, a6, 6
                  sra          tp, t3, tp
                  rem          s1, a3, a0
                  mulh         s8, s9, s1
                  fcvt.s.w     fa0, s7, rtz
                  fsgnjx.s     ft9, fs3, fs5
                  ori          s2, a1, 1885
                  fmv.x.w      s2, fs10
                  sltu         tp, t1, s10
                  fmv.w.x      fs9, s10
                  fdiv.s       fs9, fs0, fs1
                  slt          s7, sp, s7
                  xor          s8, ra, t6
                  fcvt.w.s     a4, ft2, rup
                  or           t5, s4, s0
                  rem          a7, a2, a2
                  fdiv.s       ft3, fs9, fa0, rup
                  fmax.s       fs2, fs5, fs4
                  fcvt.w.s     s3, fs4, rmm
                  addi         s11, s11, -1816
                  fmin.s       ft9, fs4, ft0
                  xori         t4, s6, -873
                  fsgnj.s      ft6, fs2, fa6
                  remu         s5, t2, s6
                  rem          a7, a2, t6
                  fdiv.s       ft7, fs7, fs5
                  ori          a4, s3, -970
                  fcvt.wu.s    s0, fs0
                  andi         t0, a3, 233
                  fmax.s       fs10, ft0, fs3
                  fadd.s       ft3, ft1, fa7, rne
                  sltiu        ra, a1, -178
                  fmv.w.x      fa6, t5
                  sltiu        ra, a5, -465
                  fsgnj.s      ft7, ft1, ft11
                  or           s2, s1, t1
                  ori          s0, a4, 795
                  slt          t5, s10, t0
                  add          a5, s10, s11
                  fmv.w.x      fa5, t1
                  sll          s4, t3, t5
                  fsgnjn.s     fs10, fa0, fs1
                  sub          a5, a1, s9
                  slli         s6, s6, 17
                  fclass.s     s6, fa2
                  sltiu        s7, s6, 837
                  divu         t5, s8, s11
                  fmin.s       ft7, ft1, fa6
                  sub          t5, s10, s7
                  or           s11, s8, s0
                  slt          t4, a6, t3
                  fsqrt.s      fa3, fs5
                  fadd.s       ft3, ft1, fa0, rne
                  fcvt.s.w     ft0, s7
                  andi         zero, s9, 754
                  fsgnj.s      ft5, ft1, fs10
                  mulh         s11, a2, s6
                  fle.s        s5, ft1, ft6
                  fcvt.w.s     s7, ft4
                  fsub.s       fs3, ft3, fs4
                  lui          t2, 903583
                  mulh         a4, s7, s7
                  sltiu        a5, a3, -147
                  srl          s3, a1, s1
                  fsub.s       fa6, ft0, ft8, rmm
                  mulhsu       s7, a1, s9
                  fcvt.wu.s    s6, fa5
                  sra          a1, s10, zero
                  srl          t2, zero, t2
                  fsub.s       ft7, fs9, fs4
                  fmv.x.w      s5, fs6
                  div          a1, t6, a6
                  auipc        a3, 304290
                  mulhsu       ra, t3, a3
                  fcvt.s.wu    fa7, t0, rup
                  feq.s        a1, fs8, fs9
                  fcvt.w.s     a1, ft0
                  or           t0, tp, t3
                  mulhsu       s2, s3, s6
                  auipc        t4, 7256
                  srai         a7, s5, 23
                  sra          a6, ra, a7
                  slti         ra, t1, -1403
                  fle.s        s3, ft0, fa4
                  fmax.s       ft1, ft10, ft5
                  xor          zero, a7, s8
                  fcvt.s.w     ft1, a4, rtz
                  mulhsu       a7, a4, t5
                  mulhu        sp, t6, s3
                  ori          s1, gp, 612
                  mulh         s1, s10, s6
                  and          a6, a1, a0
                  flt.s        sp, fs11, ft1
                  andi         t2, s1, -1767
                  sll          a2, s0, s5
                  flt.s        s2, ft6, ft5
                  fmv.x.w      a1, fs8
                  fcvt.s.wu    fa0, a2, rdn
                  srai         s1, t5, 22
                  fsgnjx.s     fs11, fs4, ft10
                  fcvt.wu.s    t4, ft3, rtz
                  fmv.w.x      ft0, a0
                  fsgnj.s      fa4, fs0, fs7
                  xor          s6, s2, a1
                  rem          gp, t6, s5
                  fcvt.w.s     s10, fs11
                  slt          t4, t2, s4
                  andi         a6, s5, 1115
                  rem          t5, t5, t5
                  nop
                  divu         a2, a5, a2
                  fcvt.s.wu    fs11, s6, rne
                  fdiv.s       fa2, fa1, fs11
                  fclass.s     a2, fa0
                  fsqrt.s      fs8, fs8, rmm
                  auipc        s6, 500895
                  slli         s6, s3, 11
                  feq.s        s2, ft2, fa7
                  fdiv.s       ft9, fa7, fa4, rdn
                  mul          a6, t6, a1
                  fcvt.wu.s    s8, fs0
                  div          tp, ra, a1
                  fcvt.wu.s    s5, fa2
                  fcvt.w.s     gp, fa4, rdn
                  mul          s6, s9, a7
                  mul          s8, a6, gp
                  nop
                  srl          s2, s6, s5
                  mulh         s0, t3, s10
                  sll          tp, zero, a5
                  ori          s0, t0, 1391
                  srl          s5, s3, s11
                  fsub.s       fs3, fs6, fa4
                  slti         s2, s5, -1451
                  fcvt.s.wu    fa3, s9
                  auipc        s0, 444018
                  fsgnj.s      ft3, ft3, fs1
                  sub          t2, tp, zero
                  fsgnj.s      ft7, fs6, ft10
                  fclass.s     s2, fs3
                  fmax.s       ft1, fs5, fs3
                  fadd.s       ft10, fa0, ft4, rne
                  mulhu        a5, s7, s11
                  fsgnjx.s     fa7, fs2, fs0
                  sub          t6, t3, s0
                  fsub.s       fs7, ft9, fs7, rmm
                  fadd.s       ft10, fs0, ft11, rdn
                  flt.s        s11, ft10, fs8
                  fmv.x.w      t2, fs10
                  fmv.w.x      fs9, a5
                  fmin.s       fs4, ft0, ft2
                  mulhu        ra, gp, s3
                  fsqrt.s      fa0, fa4
                  ori          s7, s0, -1746
                  sltu         t5, s7, a2
                  sra          a6, gp, t3
                  fsgnjx.s     ft6, ft4, ft2
                  fdiv.s       fs1, fa6, fs2, rtz
                  sltu         a1, t1, t1
                  sll          a2, gp, t0
                  sltiu        s0, t2, 278
                  xori         gp, zero, 74
                  sltiu        s8, s4, 373
                  auipc        a7, 1015875
                  srai         s4, sp, 14
                  sll          ra, t4, a0
                  add          s7, s10, s10
                  mulhsu       tp, s9, t0
                  slt          t4, zero, a4
                  auipc        a4, 506811
                  mul          a6, t2, gp
                  fsub.s       fa1, ft0, ft3
                  slli         a7, s11, 13
                  fmv.x.w      a4, fa3
                  fmv.w.x      fs0, s10
                  fmul.s       fs9, fs3, fs0
                  and          sp, t6, t2
                  fclass.s     t5, ft2
                  flt.s        a1, ft2, fs6
                  addi         s3, s10, -1586
                  fmul.s       ft2, fa6, ft10
                  flt.s        a6, ft2, ft4
                  lui          s3, 734123
                  slli         ra, zero, 17
                  slt          a5, t3, s6
                  ori          t2, s6, -1391
                  fdiv.s       fa0, fa0, ft3, rtz
                  mulh         sp, a0, s4
                  fdiv.s       ft11, fs7, ft9, rmm
                  fmv.x.w      ra, fa1
                  nop
                  fmul.s       fs2, ft10, fa2
                  nop
                  nop
                  fmv.w.x      fa3, a2
                  fmax.s       fa4, ft5, fs2
                  sll          tp, a0, gp
                  fmax.s       ft8, ft11, ft2
                  slti         t4, a6, -1089
                  fmv.x.w      a4, fs11
                  divu         a2, t5, tp
                  sltiu        t2, t5, -449
                  or           zero, a0, gp
                  auipc        s7, 310445
                  fmv.x.w      ra, fs9
                  fmv.w.x      ft9, s6
                  slt          a4, a3, s11
                  fcvt.wu.s    t6, fa7
                  srai         ra, a4, 20
                  flt.s        a0, fs1, fs9
                  add          a4, s5, s8
                  auipc        t4, 33701
                  sra          s0, s2, s9
                  rem          s0, a0, s1
                  add          a2, a5, s2
                  fmax.s       fs11, fs1, fs8
                  slti         a1, zero, -1622
                  divu         a5, t6, t6
                  srli         sp, a1, 14
                  fsgnjn.s     fs9, ft6, fs5
                  fsgnjx.s     ft9, fs11, ft3
                  andi         a5, s0, 1233
                  feq.s        s10, ft2, fa2
                  fle.s        tp, fa4, fa6
                  feq.s        t4, ft5, fs3
                  xor          ra, a1, s3
                  fsgnjn.s     ft0, fs5, fs1
                  fcvt.s.wu    fa7, a2, rmm
                  mul          a2, t3, a1
                  lui          s2, 896321
                  slti         t5, a0, -1352
                  feq.s        s4, fs6, ft7
                  fclass.s     a6, ft5
                  sltu         a2, gp, s9
                  mulhu        s6, zero, t2
                  srai         a1, sp, 3
                  fmin.s       fa5, ft10, ft2
                  fcvt.s.w     fs10, a5, rdn
                  fclass.s     t5, fs9
                  sub          t2, t1, ra
                  fsgnjx.s     ft7, fs10, fs4
                  lui          s2, 439639
                  mulhu        a1, a4, s1
                  fclass.s     zero, ft9
                  mulhsu       a2, sp, a3
                  fmax.s       fa3, fs8, ft7
                  fmin.s       fs8, fs11, fs1
                  mul          gp, sp, sp
                  srl          a1, s0, s1
                  fcvt.s.wu    fa5, a1, rdn
                  mulhsu       gp, t2, t3
                  fdiv.s       ft0, ft8, fs0
                  fmax.s       ft8, fs7, fa7
                  and          a7, s1, s9
                  fclass.s     s7, fa2
                  slti         s0, a2, -1368
                  remu         t6, a1, a3
                  slli         tp, s6, 19
                  feq.s        a2, fa1, fa1
                  srli         s0, a0, 20
                  slli         s3, t5, 15
                  ori          s4, s6, -1433
                  addi         sp, a4, -734
                  lui          a5, 615542
                  mul          a1, t1, a3
                  lui          s0, 895603
                  sltu         s2, s3, s11
                  fsgnjn.s     ft9, fa3, fs4
                  fcvt.s.w     fa7, a2, rdn
                  fcvt.wu.s    tp, ft1
                  fmin.s       fs7, fa5, ft1
                  fle.s        t2, ft11, ft8
                  srl          a7, sp, s9
                  fsqrt.s      fa7, fs7, rmm
                  rem          a1, s11, zero
                  srl          tp, a2, s10
                  remu         a0, t0, a1
                  fcvt.s.w     fs7, s7, rne
                  remu         s5, a2, s6
                  fcvt.s.w     ft5, zero
                  fle.s        a4, fa1, fs0
                  nop
                  fsgnj.s      ft10, ft6, fa6
                  fmin.s       fs5, fa3, fa0
                  divu         sp, s11, s0
                  fcvt.s.wu    fs4, s0, rmm
                  mul          t4, s6, a6
                  fcvt.wu.s    a6, ft1, rne
                  sll          s5, a2, a5
                  nop
                  sra          t4, a0, t6
                  lui          gp, 532236
                  mulh         zero, t2, tp
                  srai         a0, t5, 16
                  mulhsu       ra, zero, t0
                  fadd.s       fa0, ft9, ft1, rne
                  sltu         a6, sp, s3
                  fmin.s       fs6, ft3, fa3
                  and          t6, gp, s7
                  fclass.s     s7, fa7
                  fadd.s       ft1, ft6, fa5, rmm
                  or           a5, s9, t6
                  srl          s11, t1, s0
                  ori          s0, sp, -1888
                  addi         s2, t0, -1521
                  addi         s10, s8, 1404
                  rem          s3, s2, ra
                  nop
                  remu         t6, ra, s11
                  fclass.s     s5, fs2
                  fcvt.wu.s    a2, fa0, rup
                  sra          ra, a2, s10
                  sra          t6, t4, t3
                  remu         a4, t3, s11
                  fcvt.wu.s    t2, fs11
                  fle.s        t4, ft1, fs1
                  add          a4, t4, t2
                  ori          t6, s6, -1923
                  or           s11, a5, s11
                  fsgnj.s      ft0, fs4, ft1
                  fmax.s       fa3, fs10, fs9
                  srai         t0, t4, 9
                  srli         t2, s2, 5
                  slli         t5, a4, 17
                  add          t2, a1, s4
                  divu         t4, a2, a2
                  fsgnj.s      fa1, ft8, ft6
                  slli         s5, gp, 31
                  nop
                  auipc        s10, 730269
                  nop
                  fcvt.s.wu    fs4, s7, rmm
                  mulhsu       a0, sp, t2
                  fmv.x.w      s2, ft2
                  ori          s6, s8, 1934
                  fadd.s       fs2, ft5, fa2
                  fadd.s       fa7, ft3, ft3
                  feq.s        s1, fs10, ft8
                  fdiv.s       ft6, fs3, fs7, rtz
                  mulhu        a3, t1, s0
                  div          sp, t1, zero
                  andi         tp, a6, -1513
                  fcvt.s.w     ft3, sp, rne
                  fmin.s       fs8, ft3, ft0
                  slti         s7, a5, -1246
                  remu         s5, a3, t3
                  srai         t0, a3, 1
                  fsgnj.s      fa3, ft1, fs5
                  rem          a7, t4, s9
                  fmv.x.w      t4, fa4
                  fdiv.s       ft7, fs5, fs3, rup
                  fsqrt.s      fa7, ft11
                  fsgnjx.s     fa1, fs11, fs3
                  fmul.s       fs0, fs5, fs9, rne
                  fadd.s       fs0, ft0, ft4
                  sltu         s4, t0, a2
                  srai         t6, s1, 22
                  slli         s0, s11, 21
                  fcvt.w.s     sp, ft8
                  fcvt.s.w     fa6, ra, rne
                  mulhu        s5, s2, s6
                  fmin.s       fs2, ft7, ft4
                  nop
                  fadd.s       ft10, fs1, fa2
                  srai         s2, a6, 25
                  fmax.s       fs6, ft4, fs5
                  fcvt.s.wu    fs3, t6, rne
                  fadd.s       ft9, ft10, fs0, rdn
                  auipc        a4, 736271
                  and          tp, s8, a7
                  or           s3, t0, s3
                  fle.s        a4, fa2, fs2
                  sra          t0, a2, gp
                  feq.s        a2, fa7, fs5
                  fcvt.w.s     t2, ft9, rne
                  mulhsu       s3, sp, gp
                  flt.s        a3, fs2, ft0
                  fmv.w.x      fa2, s8
                  fmv.x.w      t2, fs7
                  fsgnjn.s     fs2, ft11, fs5
                  fsgnjx.s     fa6, fs2, ft1
                  slti         tp, s3, -205
                  fmin.s       fa4, fa1, fa6
                  fmax.s       ft7, fs6, fa5
                  srl          sp, a7, a1
                  fmv.x.w      a1, fs10
                  add          a4, s8, t1
                  sltiu        a7, zero, -1764
                  fcvt.w.s     s0, ft6
                  remu         s8, zero, s7
                  fadd.s       ft3, fa3, ft10
                  addi         a4, zero, -465
                  fmv.w.x      fa3, s11
                  add          s10, sp, a4
                  sll          tp, a7, s0
                  lui          sp, 324021
                  xori         a2, s6, -1835
                  fmin.s       fs10, fa7, fs0
                  and          s7, s6, s8
                  srai         s4, gp, 23
                  fsqrt.s      fs4, fa0
                  addi         t6, a1, 1259
                  or           s1, tp, t4
                  sltu         s3, t3, s6
                  srai         s7, s4, 30
                  ori          t6, s9, 630
                  div          t6, s2, s8
                  srli         t6, s4, 18
                  fmv.w.x      fs2, a0
                  fmax.s       fs11, ft1, fs1
                  fmv.x.w      a0, fa0
                  mulhu        s1, a5, s6
                  auipc        s2, 84543
                  xor          a7, sp, zero
                  fsgnj.s      fs9, fs7, fs7
                  fclass.s     s4, ft3
                  lui          s11, 181868
                  slt          s2, ra, sp
                  fadd.s       ft7, fa4, ft3, rmm
                  addi         s0, a7, -405
                  div          a0, a4, t4
                  rem          s6, a6, s0
                  mulhu        a7, s0, gp
                  srai         a4, t6, 4
                  fcvt.w.s     s2, ft11, rdn
                  rem          a7, t3, a6
                  addi         s8, s3, 1466
                  fcvt.s.w     fs1, s5, rne
                  flt.s        zero, fs5, fs10
                  fsgnjn.s     ft7, ft6, fs3
                  srli         s8, s10, 15
                  slli         t5, a5, 24
                  fcvt.s.wu    fs10, t6, rne
                  remu         a1, gp, s10
                  fsqrt.s      fa5, fs6
                  fmax.s       fs7, fs4, ft5
                  sub          t6, a5, t4
                  fcvt.w.s     s4, fs0, rtz
                  xor          t5, a0, a7
                  div          s10, s2, s9
                  divu         s8, a1, s5
                  fmv.x.w      a1, ft1
                  fmin.s       ft9, ft11, fa7
                  mulh         gp, s1, s2
                  or           t6, a0, s5
                  fdiv.s       ft9, fs11, fs3, rmm
                  ori          s1, t4, 1563
                  fsgnjn.s     fs9, fa5, ft5
                  fsqrt.s      ft2, ft1, rdn
                  fmul.s       fs3, fa0, fs2, rtz
                  fmin.s       ft1, fs2, ft1
                  fcvt.s.wu    ft8, s0, rdn
                  feq.s        a3, ft9, fs1
                  srli         s11, tp, 20
                  srli         sp, a6, 14
                  srli         t6, sp, 9
                  auipc        a3, 50665
                  nop
                  slti         a2, s2, 1138
                  fsub.s       fa1, fs4, ft2
                  div          a0, t5, sp
                  fmin.s       fs4, ft2, fs11
                  sub          a6, a6, t6
                  fle.s        zero, fs8, fs3
                  mul          s10, a3, sp
                  fadd.s       fs10, ft3, fs6
                  fadd.s       fa5, fa2, fs2
                  srl          s8, a5, a5
                  or           t4, a1, zero
                  fcvt.w.s     a1, fs7
                  fmin.s       fa2, fs11, ft6
                  fmin.s       fs6, ft0, fa1
                  remu         a0, s7, t4
                  remu         s1, s10, a6
                  fmv.w.x      fs2, t6
                  and          a6, t3, s10
                  sltiu        sp, a2, -588
                  srai         a0, s0, 28
                  fmax.s       fa2, ft5, ft10
                  slt          a6, a5, s11
                  rem          a3, s9, a6
                  rem          a5, s9, s4
                  auipc        s6, 731324
                  feq.s        s11, fs5, fs6
                  fcvt.w.s     s4, ft1
                  auipc        a0, 236000
                  fcvt.wu.s    s7, fa2
                  fmv.w.x      ft9, s9
                  fclass.s     s8, fa7
                  slt          s11, t1, s9
                  fsgnjn.s     ft3, ft8, fs10
                  fcvt.wu.s    a1, fs1
                  remu         s3, s6, a0
                  fsgnjn.s     fs0, fs4, fa7
                  fmin.s       fs0, fs9, ft2
                  fdiv.s       fa6, fa7, fa6
                  feq.s        a6, fs2, ft11
                  sltu         s8, s11, s9
                  fdiv.s       fs5, fs2, fa5, rmm
                  add          a2, t0, zero
                  mulh         t4, s9, t5
                  slli         gp, t5, 2
                  xori         t2, a4, -1250
                  fcvt.wu.s    zero, fa3
                  lui          t6, 428821
                  flt.s        a7, fs6, fa6
                  add          a1, s3, s11
                  fcvt.w.s     t6, ft5
                  nop
                  xor          s6, s9, s0
                  ori          a5, t4, 47
                  mulh         a6, zero, s8
                  sll          t2, a4, t4
                  fmax.s       ft2, fa5, ft4
                  fadd.s       fs0, fa1, fs9
                  fcvt.s.w     ft4, a6, rdn
                  addi         s11, s5, 840
                  srl          a0, a7, zero
                  sll          a4, t2, s9
                  lui          a7, 776106
                  nop
                  fsgnjn.s     ft2, ft6, ft2
                  fclass.s     s3, fs8
                  fmax.s       ft8, fs3, fs1
                  sltu         s10, gp, s11
                  xori         t0, ra, -505
                  srl          s7, s3, t4
                  auipc        s0, 1019310
                  feq.s        t5, fs0, fs4
                  sltiu        s7, zero, -1973
                  fcvt.wu.s    ra, ft3, rne
                  sltu         tp, s4, s5
                  fsgnjx.s     ft4, fs4, fa5
                  mulh         t4, a7, t5
                  xor          s3, s6, t1
                  addi         s4, s3, -1145
                  xori         s11, a7, 788
                  ori          a3, a2, 1910
                  srl          t5, t2, t4
                  sll          t6, s8, ra
                  mulh         a5, tp, s10
                  rem          s0, a3, s5
                  nop
                  and          a5, s10, s2
                  auipc        a6, 731301
                  mul          a4, s8, t4
                  slt          s7, t3, s1
                  mulhsu       zero, a5, s0
                  fclass.s     t4, fa4
                  sltiu        s4, t5, 1805
                  andi         s10, s2, 259
                  fcvt.s.w     fs5, t3, rtz
                  fclass.s     s7, fs10
                  addi         s7, a7, 988
                  divu         s10, s1, s3
                  fmax.s       fs7, fs9, fa1
                  andi         a1, s6, -1536
                  fmv.x.w      a7, fs11
                  lui          s7, 620911
                  xor          a3, a3, a5
                  mulh         t0, s1, gp
                  div          gp, s2, s2
                  and          s11, a4, a0
                  fmv.w.x      fs3, a3
                  addi         sp, s6, -601
                  sra          tp, s11, a3
                  ori          t2, a1, 1804
                  fsgnjx.s     fs5, fs8, fa4
                  sltu         s10, s4, t2
                  fmax.s       fa7, fa5, fa4
                  add          tp, s5, t4
                  fsgnj.s      ft0, ft1, fs2
                  fle.s        s0, ft4, fa2
                  and          gp, sp, t6
                  divu         t4, gp, a4
                  remu         a2, t1, s4
                  lui          s8, 314068
                  fcvt.w.s     t2, fs7, rup
                  fmax.s       fa6, fa3, ft10
                  fsqrt.s      fs8, fs6
                  xori         s2, s0, 1194
                  rem          s8, s0, t2
                  xori         ra, zero, 1582
                  mulh         s0, s3, a1
                  or           s0, a4, s5
                  fmin.s       fs3, ft1, ft7
                  srai         a2, t6, 24
                  mulhsu       ra, s2, a6
                  rem          sp, a2, s3
                  fadd.s       fs5, fs3, ft1, rtz
                  auipc        s10, 226218
                  fle.s        s8, fs4, fa3
                  sltiu        s5, s2, -1255
                  nop
                  mulh         s5, sp, s0
                  fdiv.s       ft1, ft1, fa5
                  auipc        a4, 567406
                  mulh         t5, t0, s7
                  fsub.s       ft10, fs8, fa3
                  fdiv.s       fa1, ft10, ft11, rne
                  andi         s0, s8, -288
                  fsqrt.s      ft6, fs6, rdn
                  fle.s        a4, fs10, fs7
                  remu         s11, a7, s6
                  fsqrt.s      ft8, fa0
                  lui          t4, 454484
                  rem          t4, t5, s8
                  ori          t5, s2, -157
                  fle.s        t6, fa5, fs5
                  fcvt.w.s     s0, fs0, rup
                  mulhu        t5, s7, s11
                  mulh         s0, a0, s9
                  divu         s0, tp, s9
                  add          a5, ra, t4
                  divu         s1, zero, tp
                  sltiu        s2, a1, -212
                  mul          zero, t4, t5
                  fcvt.s.w     ft11, a7
                  fdiv.s       ft4, fa5, fs0
                  fadd.s       fs2, fs8, ft0, rne
                  divu         a1, s1, tp
                  div          a6, s7, a7
                  fdiv.s       ft10, fs8, ft9, rne
                  fsgnjn.s     fs9, fa6, ft5
                  slli         s5, s7, 18
                  fcvt.w.s     s8, ft9
                  srai         a1, s7, 9
                  fcvt.w.s     a0, fa4
                  mul          a7, s10, t3
                  fsgnjn.s     fa2, ft0, ft3
                  rem          s2, s2, zero
                  fcvt.s.wu    ft2, a2
                  and          ra, a0, t5
                  xor          s10, tp, t2
                  mulhu        t5, t6, a6
                  srli         s4, sp, 26
                  ori          a0, tp, 111
                  nop
                  slli         a4, a7, 5
                  xor          a2, a7, s0
                  mul          a0, gp, s3
                  xor          s3, s11, t0
                  mulhsu       zero, zero, ra
                  fcvt.s.wu    fs0, zero
                  sltu         s0, s11, s4
                  feq.s        s11, fs9, fs11
                  fle.s        a7, fs5, ft4
                  auipc        a6, 310530
                  xor          ra, a7, a1
                  fcvt.wu.s    t6, ft3
                  sltu         sp, zero, s7
                  fdiv.s       ft11, fs9, fa5
                  fsgnjn.s     fs5, fs8, fa6
                  fmax.s       fa1, fs0, ft3
                  fle.s        s2, ft10, fs10
                  xor          t4, gp, a2
                  xori         a7, a4, -1012
                  feq.s        gp, fa2, ft7
                  srli         a4, s10, 16
                  fdiv.s       fs6, fs4, fa3
                  andi         t6, t2, 995
                  mulhsu       a5, a4, a1
                  xor          a3, t4, s6
                  nop
                  sltiu        s8, sp, 237
                  fcvt.s.w     fa7, s6, rtz
                  andi         t5, s9, -90
                  auipc        s6, 93790
                  fle.s        sp, fa4, fs10
                  srl          s2, s5, s1
                  mulhu        s1, t1, a7
                  fcvt.wu.s    s7, fs11, rtz
                  slti         a1, t6, 113
                  fclass.s     ra, fs8
                  slti         a1, a5, -736
                  fmv.x.w      a5, ft2
                  add          a5, s5, a0
                  sra          a6, a7, s1
                  fsqrt.s      ft2, fs11
                  add          gp, a5, t3
                  fmin.s       fa1, fs5, ft9
                  sra          gp, t5, a3
                  and          s1, s8, s6
                  add          t4, a5, s5
                  fsub.s       fs2, fs1, ft10, rmm
                  sltu         a6, a6, s0
                  mul          s5, a7, t3
                  fsgnjn.s     ft3, fs6, fs5
                  srl          t2, s3, s4
                  feq.s        s5, fs1, ft6
                  fmv.x.w      a3, fs3
                  fsub.s       fa0, ft7, fs8
                  xori         t5, s5, 817
                  fsgnjx.s     fs1, fs1, fa1
                  xori         t5, s9, 531
                  fmv.w.x      fs8, a3
                  nop
                  fmin.s       fa2, fs0, ft7
                  flt.s        a6, ft3, ft1
                  slti         a6, s9, -1153
                  or           ra, s11, s8
                  fcvt.w.s     a0, fa1
                  sra          t2, s0, a4
                  mulhsu       t5, s6, s4
                  srai         t5, s11, 26
                  mulhu        a5, t5, s0
                  fmv.w.x      fa2, a4
                  divu         a6, zero, t2
                  fcvt.w.s     t6, fa5
                  mulh         s0, s6, t2
                  fmax.s       fs7, fs5, fa4
                  xor          t2, s3, a3
                  add          ra, s1, s6
                  remu         tp, t6, s4
                  srl          a7, s3, s9
                  fcvt.w.s     a5, fs10, rdn
                  fmin.s       fs2, ft0, fa6
                  fmin.s       fs5, fs3, ft4
                  srl          ra, s4, a4
                  srai         s8, s5, 23
                  srli         s2, s11, 28
                  fcvt.s.w     fa7, sp, rmm
                  slli         s4, a6, 3
                  sub          a5, s0, s11
                  fsub.s       ft4, fs5, ft3, rtz
                  fmin.s       fa7, fs6, fs1
                  divu         tp, s8, t5
                  fsgnj.s      ft11, fs0, ft10
                  fadd.s       fa5, ft10, fa5, rtz
                  mulh         ra, s1, a4
                  div          s7, a4, t0
                  fsqrt.s      ft1, fs6, rmm
                  addi         a7, s8, 2000
                  sltu         t2, t5, sp
                  fdiv.s       fs10, ft0, ft2, rmm
                  andi         s5, a5, -2030
                  mul          s3, s10, s11
                  feq.s        s8, fs4, ft10
                  fsgnjx.s     ft3, ft5, fs9
                  fmv.x.w      a7, fa1
                  sltiu        s10, ra, -807
                  slt          a2, a6, s1
                  or           a4, gp, a7
                  fdiv.s       ft0, fs1, fs0
                  addi         s4, s11, -129
                  srli         a2, ra, 12
                  fmul.s       ft3, fs5, ft5
                  srl          s0, t1, t5
                  addi         s11, a7, 1411
                  fdiv.s       fa6, fa1, ft10
                  auipc        s1, 573923
                  remu         t2, t3, a5
                  slti         s7, gp, 2021
                  addi         a1, t3, -497
                  slti         a5, s11, -72
                  rem          s8, s9, s9
                  nop
                  add          a2, s2, t0
                  fsqrt.s      ft0, fa7, rtz
                  lui          tp, 658892
                  fcvt.s.wu    fs7, gp, rup
                  flt.s        a7, fs4, fa4
                  fdiv.s       ft4, fs1, fa3, rtz
                  sra          gp, s4, s1
                  fdiv.s       fs9, ft4, fa2, rtz
                  mul          sp, a0, a7
                  fsgnj.s      fs7, fa2, ft11
                  fmax.s       ft9, fs1, fs1
                  fmv.w.x      ft5, a4
                  fclass.s     a7, ft6
                  fcvt.s.wu    fs3, t6
                  fsgnjx.s     fa3, fs2, fs11
                  sltiu        t2, t2, 244
                  slli         sp, gp, 4
                  fcvt.s.w     fs8, gp
                  andi         a5, s2, -1272
                  mulh         s10, a0, s2
                  flt.s        s5, fs11, ft8
                  srl          a6, s6, s0
                  srai         a0, s6, 27
                  sltiu        zero, t1, 1569
                  mul          s5, s3, s10
                  mulhu        zero, s11, a0
                  srai         a3, tp, 7
                  fmul.s       fs4, fa3, fs7
                  fmax.s       fs1, ft8, ft3
                  nop
                  remu         s2, t5, t5
                  ori          s10, s0, -1598
                  sltiu        sp, s4, 25
                  sltiu        s7, s2, 1685
                  fadd.s       fa4, ft9, fa0, rdn
                  nop
                  sltiu        t0, t3, -1494
                  fsgnjn.s     fa7, ft2, fa7
                  fadd.s       fs10, fa2, fs8
                  auipc        s3, 808609
                  fadd.s       ft1, ft3, fa6, rdn
                  fmax.s       ft9, ft1, fs9
                  fcvt.wu.s    zero, fs10, rup
                  fmv.x.w      a3, fa0
                  slli         zero, t0, 5
                  fsgnjn.s     ft6, fa2, ft7
                  divu         a5, gp, a4
                  auipc        s7, 245643
                  sltu         s3, t5, ra
                  fsgnjx.s     fs3, ft2, fs7
                  fclass.s     s5, ft9
                  srai         ra, t3, 1
                  div          a6, a5, t2
                  sra          a7, a5, a6
                  sub          a4, a5, t6
                  fdiv.s       fa4, ft11, fs10
                  fsgnjx.s     fs3, fs3, fa4
                  fclass.s     s5, fs3
                  nop
                  sub          a1, s7, s4
                  fmax.s       fa5, fs0, fs5
                  slt          a0, s4, a6
                  fsgnjx.s     fs6, fs7, ft8
                  fsub.s       fs11, fs11, ft0, rmm
                  rem          a0, a7, s6
                  srli         s7, s1, 13
                  ori          s11, a6, -700
                  fmin.s       fa1, fa5, ft7
                  andi         s0, t1, 807
                  slti         s3, gp, 1643
                  xor          t0, a5, a6
                  fmul.s       fa3, fa1, ft5
                  fadd.s       fa1, fs6, fs2
                  divu         a1, s10, t5
                  ori          s8, a1, 1544
                  fcvt.wu.s    s2, fs1
                  feq.s        a5, ft10, fs9
                  fmul.s       fs1, fs6, fs0, rdn
                  fsgnjx.s     ft11, ft0, fs7
                  mulh         s6, a0, sp
                  fsgnjn.s     fa2, fa3, fs7
                  fle.s        sp, fa3, ft9
                  remu         gp, a1, a3
                  fle.s        s5, ft3, ft3
                  fmul.s       fs7, ft7, ft7, rne
                  slli         tp, s6, 25
                  fmv.x.w      ra, fa1
                  or           s3, s11, gp
                  sltu         t6, a0, a0
                  srai         gp, gp, 28
                  fmv.w.x      fs7, t6
                  lui          s6, 900824
                  fle.s        s11, ft9, ft7
                  mulh         a3, s6, tp
                  or           s3, a6, zero
                  fcvt.s.wu    ft10, a6, rtz
                  lui          sp, 375115
                  mul          a4, s11, t6
                  slli         t0, t5, 4
                  addi         a3, s1, -1155
                  fcvt.s.w     ft3, a0
                  divu         s3, gp, a2
                  fmv.w.x      ft8, zero
                  mulh         t4, t4, sp
                  divu         s3, s1, t1
                  fsgnjn.s     fa2, fs0, fa1
                  add          s3, a3, s10
                  andi         t4, a0, -1126
                  sltu         t5, s9, s2
                  fsgnj.s      ft2, ft10, fs9
                  flt.s        s6, fa2, fa6
                  fmin.s       fa6, fs10, fs5
                  fadd.s       fs8, ft3, ft0, rup
                  fcvt.w.s     s6, fa5
                  divu         a7, a4, t4
                  fdiv.s       ft4, fa7, fs10
                  fle.s        a7, fs5, fs4
                  mulhsu       s1, a1, s2
                  fmul.s       fs9, fs9, fs9, rdn
                  sll          s7, s4, ra
                  fsgnj.s      ft2, ft3, ft5
                  nop
                  xori         a2, zero, -656
                  sra          a3, t6, a1
                  div          s7, s2, s10
                  fclass.s     t2, fs5
                  fsqrt.s      ft6, ft11
                  fsgnjx.s     ft10, ft2, ft4
                  fmv.x.w      s4, fs7
                  fsgnjn.s     ft3, ft11, fa5
                  srli         s8, zero, 18
                  fsgnjx.s     fs10, fa5, fs9
                  srai         t4, a4, 1
                  xor          t2, s2, s9
                  and          s11, t2, s2
                  rem          a6, t4, t0
                  fmul.s       fa4, fs9, fa6
                  divu         s5, t1, a1
                  feq.s        s1, ft0, fs9
                  fsqrt.s      fs5, fs2
                  slli         t6, s7, 0
                  fsgnj.s      ft7, ft11, fs10
                  sltu         s8, t4, t4
                  or           t2, s10, s1
                  flt.s        s11, fa4, ft8
                  nop
                  fsgnjx.s     fa7, fs7, ft2
                  add          t4, a5, s11
                  fadd.s       fs2, ft2, fs0, rtz
                  nop
                  xor          s7, s11, t2
                  fle.s        zero, ft0, fs5
                  and          a1, s2, s0
                  lui          a2, 273747
                  slli         s1, s5, 12
                  fcvt.s.wu    ft9, s2, rne
                  slti         a1, s8, 1278
                  fsgnj.s      ft8, ft8, fa2
                  srl          s3, s0, s7
                  fsqrt.s      ft8, fa5
                  sll          tp, a0, s2
                  sltiu        t6, zero, 1547
                  and          a0, s10, t1
                  srl          t2, ra, a3
                  xori         s3, s4, -2032
                  fadd.s       fa6, fa2, fs1
                  fcvt.s.w     fa7, t0, rup
                  sll          a2, s3, s4
                  sra          a0, t4, t6
                  mulh         zero, t6, s2
                  div          s5, s4, s5
                  nop
                  slt          s8, a4, s8
                  add          s10, t5, s9
                  fsgnj.s      fa2, ft1, fs4
                  fsgnjx.s     ft8, fa0, ft10
                  lui          sp, 389166
                  fclass.s     zero, fs11
                  sll          a7, a1, s10
                  fsgnjx.s     ft7, ft10, fa1
                  flt.s        ra, fa1, fa7
                  fsgnjx.s     fa2, fa3, fa1
                  fmv.x.w      ra, fs0
                  slti         s6, a5, 590
                  slti         zero, a1, 44
                  fsgnj.s      fa3, fa1, fa7
                  divu         s0, a3, a2
                  flt.s        s6, ft4, fa1
                  fcvt.w.s     s7, ft0
                  lui          s1, 557123
                  sll          s6, s10, t6
                  fcvt.w.s     a3, ft9, rmm
                  sltu         s7, a1, ra
                  lui          ra, 659751
                  fcvt.wu.s    s2, ft8
                  fclass.s     a7, ft2
                  slti         s5, gp, -1186
                  feq.s        zero, ft5, fs0
                  sltu         s8, t2, s4
                  fsgnjn.s     ft6, fa0, fa6
                  sra          sp, s9, a7
                  slli         s5, t6, 29
                  mulhu        s8, s7, s11
                  fsub.s       fs6, fs10, fa6, rtz
                  rem          a2, zero, s2
                  fmax.s       ft10, ft4, fa0
                  srai         a2, t2, 26
                  ori          gp, zero, 1531
                  addi         a5, t5, -1726
                  add          s5, s9, a4
                  sltiu        gp, t2, -1913
                  feq.s        s4, fs6, fs9
                  srli         a4, a6, 19
                  mulhu        t2, s5, s10
                  mulhu        s4, s5, t2
                  fsgnj.s      fs1, fa6, ft7
                  fmv.x.w      s1, fs7
                  fsgnjx.s     fs4, fs8, fs0
                  addi         a2, t0, 386
                  andi         gp, zero, 386
                  xori         t0, s7, -870
                  feq.s        zero, ft0, fa4
                  add          sp, a7, a6
                  add          t0, t6, a0
                  fsqrt.s      fs10, fs0
                  fsqrt.s      fa2, fs5
                  srli         t2, s7, 0
                  nop
                  fsgnjx.s     fs4, ft6, fa3
                  fclass.s     s1, ft8
                  div          s1, t0, a7
                  fcvt.s.w     ft4, t4
                  and          tp, zero, a7
                  slli         gp, s2, 20
                  divu         a4, ra, s8
                  sltu         ra, sp, t1
                  fmax.s       ft2, ft1, fa6
                  or           t5, ra, a7
                  fsgnj.s      ft2, fs5, fa5
                  feq.s        t5, fs9, ft5
                  slti         a3, a7, -21
                  fclass.s     s7, ft6
                  div          gp, a2, s2
                  auipc        a7, 998902
                  fcvt.s.w     fs1, s10, rdn
                  fsgnjn.s     ft4, ft7, fs2
                  mulhu        t5, t5, s7
                  fmv.w.x      fs8, t1
                  add          s5, gp, a7
                  rem          gp, s10, t3
                  fsgnjx.s     fs10, fa7, fa6
                  fmax.s       ft2, fa1, ft11
                  fsub.s       ft10, ft9, ft9, rup
                  feq.s        s11, ft0, ft3
                  ori          sp, t3, -797
                  lui          s10, 377672
                  mulhsu       s2, s11, s7
                  or           s5, zero, a4
                  slt          a1, s6, s0
                  div          s3, s10, t1
                  mulhu        s7, a7, a0
                  div          s6, a5, a4
                  andi         a6, t5, -397
                  sub          s10, tp, s3
                  fadd.s       ft6, fs10, ft1, rdn
                  srai         a4, t0, 24
                  fle.s        s2, fa5, fa7
                  sra          t0, s5, s0
                  mulhsu       zero, t1, s5
                  rem          t0, a5, s5
                  fsgnj.s      fs3, fs0, fs1
                  slti         a6, s3, 592
                  mulh         a0, t2, gp
                  fcvt.s.wu    fs1, s1
                  lui          s0, 438124
                  sll          ra, s10, s4
                  nop
                  fsgnjn.s     fs6, ft11, fs11
                  lui          s0, 760910
                  fadd.s       ft5, ft2, ft1, rdn
                  mulhsu       s4, zero, gp
                  ori          s8, s8, 1972
                  slli         a7, a2, 30
                  xor          a6, tp, a7
                  fsqrt.s      fa5, fa5, rup
                  fmin.s       ft2, ft7, fa3
                  rem          a4, s0, s0
                  slli         a3, a4, 30
                  xori         gp, s4, 939
                  remu         a4, s3, s1
                  mulhsu       t0, a0, t1
                  srli         s3, t5, 18
                  slt          sp, t6, t2
                  fmul.s       fs2, ft3, fs11
                  slli         a7, s10, 31
                  fsub.s       ft9, ft6, ft2, rup
                  div          a7, s1, s10
                  addi         zero, s3, 818
                  ori          a1, zero, 1291
                  addi         a1, a7, 164
                  fcvt.s.w     fa0, s10
                  slti         s2, a2, -1958
                  fcvt.wu.s    t0, ft7, rtz
                  fdiv.s       fa2, fs11, ft9, rdn
                  divu         a0, s5, t2
                  fmul.s       fs3, ft9, fs2
                  fmv.w.x      ft10, t0
                  fcvt.wu.s    t2, fs7, rdn
                  fmin.s       ft5, fs0, ft6
                  sltiu        a3, t5, -186
                  srai         a5, s2, 24
                  fsgnjx.s     ft6, fs4, fs5
                  fle.s        s11, fs7, fs10
                  fmax.s       fs8, fs4, fs9
                  divu         tp, s10, sp
                  fsgnj.s      fs5, ft5, fs5
                  and          a3, gp, sp
                  slt          gp, s5, a3
                  rem          t4, a5, s7
                  fmul.s       fa1, fs4, ft2
                  remu         zero, s0, s10
                  sll          a5, s9, t5
                  feq.s        t6, ft1, ft2
                  fmv.x.w      a2, fa6
                  nop
                  mulh         t4, s3, s3
                  rem          sp, s4, a5
                  fadd.s       fs1, ft5, fs0
                  fsub.s       ft11, fa2, fs11, rne
                  fle.s        a2, fa5, fs5
                  slli         s10, s1, 30
                  fmv.x.w      s8, ft4
                  mulh         tp, t6, s8
                  div          ra, s4, a5
                  mulhu        a2, zero, s6
                  fsgnjx.s     fs5, ft3, fa1
                  addi         t4, s5, -560
                  or           s5, t6, tp
                  fmul.s       fs3, ft0, ft6, rmm
                  slli         s0, s7, 1
                  fmv.w.x      ft5, s8
                  rem          a3, s7, t3
                  auipc        gp, 1004961
                  fmv.w.x      fs7, t3
                  mul          t0, a0, a2
                  nop
                  fle.s        a6, ft9, ft8
                  and          t2, a7, t3
                  xor          a5, s5, a4
                  fsgnjx.s     fs6, fa1, fs8
                  ori          zero, t6, 1367
                  slti         s3, s1, 521
                  flt.s        t6, fs4, ft2
                  fadd.s       ft3, fa4, fa7
                  slti         t2, s0, 960
                  sltu         s11, s8, a2
                  fsqrt.s      ft4, ft2, rdn
                  fcvt.s.w     ft6, a3
                  fmv.w.x      ft7, a2
                  mulh         a0, tp, t5
                  mul          s7, a5, ra
                  remu         a2, s0, gp
                  xori         a1, gp, -1891
                  addi         s6, sp, -692
                  fmax.s       ft4, ft5, ft11
                  slli         t2, s10, 31
                  flt.s        a5, ft7, ft7
                  sltiu        a1, t4, 1082
                  fmax.s       fs0, fa7, fs6
                  slti         a0, s6, -1337
                  fclass.s     a7, ft3
                  fmv.x.w      s8, ft1
                  fle.s        s11, fs11, fs3
                  fcvt.w.s     s6, fs1
                  fle.s        s8, ft5, ft0
                  fsqrt.s      fa7, fs10, rne
                  flt.s        a3, ft4, ft11
                  mul          a2, s11, s3
                  fsgnj.s      fa0, ft6, fs2
                  mulh         a3, t2, t4
                  xori         s11, t6, 1281
                  mulhu        s6, t2, s8
                  auipc        s1, 1035324
                  lui          a2, 980849
                  mulhu        a0, s1, a6
                  auipc        s1, 419523
                  auipc        t6, 579667
                  nop
                  fmul.s       fs10, fs4, ft6
                  fcvt.w.s     s1, fs9, rup
                  fmv.w.x      ft3, s4
                  fsqrt.s      fs7, fs4
                  fmul.s       ft3, fa1, ft3, rtz
                  fdiv.s       fs0, fs2, ft10
                  fle.s        a2, ft11, fs9
                  auipc        s0, 162586
                  srl          a3, s10, ra
                  slti         a6, s3, 1388
                  fcvt.w.s     t5, fa2, rmm
                  mul          t6, a3, s2
                  or           a6, t0, t1
                  sltiu        a0, s2, 770
                  fsgnjn.s     ft7, ft3, ft3
                  ori          s0, a7, -1292
                  fclass.s     t5, fs11
                  div          s8, s2, t1
                  add          s4, gp, t0
                  rem          a4, s10, a4
                  fcvt.s.w     fs9, s6, rne
                  feq.s        s1, fs11, fa5
                  sltu         t0, a5, s7
                  slt          s11, s0, gp
                  xori         a1, s4, -1423
                  fsub.s       fs5, ft10, fa6
                  remu         a0, t6, s6
                  fcvt.s.wu    ft3, ra
                  feq.s        t5, ft9, ft4
                  srli         s3, a3, 16
                  sra          s8, t0, a0
                  flt.s        a3, ft7, ft1
                  sltu         s6, s9, a0
                  addi         s1, s8, -1228
                  fmin.s       fs2, fa0, ft9
                  fsqrt.s      fa6, fs1
                  fclass.s     t5, fa5
                  slt          a7, t6, s2
                  flt.s        t4, fs9, fs2
                  fle.s        zero, fs9, fs8
                  or           t6, s3, t0
                  addi         ra, a5, -1734
                  fcvt.wu.s    a6, fs3, rmm
                  fmv.x.w      sp, fs10
                  auipc        s5, 584535
                  fmv.x.w      s6, ft5
                  ori          a5, s5, -1516
                  sll          a4, gp, s0
                  sra          a2, gp, a2
                  fmax.s       ft8, ft3, fs9
                  or           a4, s1, t2
                  sll          s8, a5, t0
                  fmin.s       fs4, fa4, fs0
                  fmin.s       fs1, fs8, fa7
                  and          a2, tp, s4
                  andi         s3, t0, 674
                  fmv.w.x      fs6, s7
                  xori         s0, t6, -1705
                  andi         s1, sp, -1312
                  nop
                  fsub.s       fs5, ft7, fa1
                  xori         s10, a0, 1021
                  fcvt.wu.s    a7, ft8
                  flt.s        s5, fa2, ft10
                  feq.s        s4, ft8, fs5
                  mulhu        s2, s10, ra
                  rem          a5, t2, ra
                  sltu         s3, a4, ra
                  feq.s        a4, fa3, ft8
                  auipc        a0, 293356
                  fmv.x.w      s0, fa1
                  fsgnjx.s     fs9, ft3, ft5
                  lui          a7, 507757
                  mul          a0, s9, a4
                  mulhsu       s5, a2, t4
                  nop
                  mulh         s2, tp, s0
                  fsgnjn.s     fs3, fa2, fs8
                  xor          s8, gp, s5
                  divu         a3, tp, s9
                  lui          t0, 995151
                  andi         t5, a3, -558
                  sltiu        t6, a1, -652
                  fcvt.s.w     fs5, s7, rne
                  slli         t6, t4, 17
                  slt          s3, t6, s0
                  fcvt.s.w     fa1, s7
                  fmin.s       ft9, fa1, fa3
                  fmul.s       ft1, fa7, fs0, rup
                  remu         s1, s7, a4
                  fadd.s       fs0, ft2, fs2, rdn
                  fdiv.s       ft5, fs11, ft0
                  srli         sp, s9, 27
                  mulhu        t5, s3, ra
                  sll          t4, gp, a5
                  fmv.x.w      a4, ft9
                  fmv.w.x      fa5, t6
                  sra          s7, tp, t4
                  fmul.s       ft1, fa0, ft6
                  fsub.s       fs6, ft8, fs6
                  xor          zero, s1, a6
                  slti         s0, s0, 930
                  mul          a2, a5, s5
                  fmax.s       ft7, fa5, ft0
                  fcvt.wu.s    s6, ft0
                  flt.s        s0, ft11, ft11
                  fcvt.s.wu    ft8, t5, rup
                  fmv.x.w      s8, fs11
                  fmax.s       ft1, fs8, ft0
                  fadd.s       ft8, fa6, fa6
                  andi         s1, t5, -1030
                  ori          a2, s5, 22
                  and          a7, sp, t3
                  remu         t4, t1, s11
                  lui          s0, 55647
                  fmv.x.w      a6, ft8
                  remu         a0, s5, a0
                  fcvt.w.s     a3, fs4, rmm
                  remu         a1, t2, a5
                  slli         t5, a4, 8
                  lui          s7, 910094
                  mulh         t2, a3, a0
                  lui          s7, 131954
                  mul          tp, a7, zero
                  slt          gp, s8, s2
                  ori          s3, s9, -1790
                  fmul.s       fs3, ft7, fa7, rtz
                  flt.s        s3, fs1, ft11
                  sll          a5, s6, a1
                  srl          zero, s3, ra
                  slt          a3, ra, s7
                  andi         t5, t0, 997
                  fsqrt.s      fa5, fs2, rmm
                  mulhsu       a6, t1, s11
                  srli         sp, t4, 18
                  fmax.s       fs8, ft6, fs3
                  slti         t4, s11, 996
                  and          a4, t6, a0
                  fsgnj.s      ft5, fs1, fs4
                  fclass.s     s4, fs0
                  sub          a1, s9, gp
                  sub          t4, s9, a4
                  add          t2, s1, t2
                  fdiv.s       ft6, fs9, ft3, rne
                  remu         gp, s6, t3
                  fcvt.w.s     t0, fa3, rtz
                  fsub.s       ft9, fs0, fa5
                  remu         a7, a6, a7
                  nop
                  fadd.s       fs5, ft8, ft10
                  fmax.s       fa1, fa7, fs3
                  remu         s2, t4, t4
                  fclass.s     s6, ft8
                  fcvt.w.s     s1, fs5, rne
                  divu         a5, a7, a6
                  fle.s        gp, fs1, fs4
                  mulh         s10, a6, a4
                  nop
                  sltiu        s7, s5, -129
                  and          a3, s7, t2
                  fsqrt.s      ft3, fs0
                  mulhsu       a6, a0, a0
                  divu         t2, s6, tp
                  lui          s2, 906170
                  remu         t2, s8, s1
                  sra          t5, a4, zero
                  srl          s7, a5, a6
                  mulh         tp, s6, tp
                  andi         s1, s10, -2047
                  addi         s10, a0, 1857
                  fsgnj.s      fs3, fs9, fs11
                  xor          s7, gp, t3
                  sra          s1, sp, s10
                  fcvt.s.w     fs0, a7
                  slt          a7, s4, t4
                  fmv.x.w      t6, ft3
                  srli         a2, ra, 6
                  fsgnjn.s     fa7, ft7, fs5
                  auipc        a4, 628326
                  add          t6, t1, a5
                  fmin.s       fa3, fa2, ft3
                  rem          tp, gp, t2
                  auipc        a6, 138762
                  feq.s        gp, fa4, fa6
                  and          a2, t5, s9
                  div          s5, a7, zero
                  or           t4, s9, ra
                  lui          zero, 456555
                  fmax.s       fa0, fs0, fa0
                  xor          a4, ra, a0
                  fmv.x.w      a6, ft4
                  fcvt.s.w     fa3, a4
                  andi         zero, a5, -1147
                  fmul.s       fa7, fa5, fs3, rne
                  mul          zero, gp, sp
                  sra          s5, s0, t0
                  ori          s11, s8, -528
                  srli         a6, t3, 4
                  auipc        a0, 383589
                  xori         tp, s1, 1073
                  srli         gp, s6, 19
                  or           t2, a7, s10
                  fmv.x.w      s11, ft6
                  and          s7, a0, s2
                  srli         s5, t1, 30
                  sltu         a3, a6, s10
                  ori          s1, s0, 126
                  auipc        a7, 449147
                  lui          t5, 847321
                  lui          gp, 994534
                  slli         a0, s11, 18
                  slt          s6, s6, s2
                  fmax.s       ft5, fa5, fs10
                  sltiu        s8, s5, -1638
                  and          ra, t4, t2
                  add          s3, t6, t5
                  slti         t0, gp, 164
                  fclass.s     s3, fa0
                  andi         s3, zero, -51
                  fsgnjx.s     ft4, fs9, fs8
                  fsgnjx.s     fs1, fs1, fa3
                  div          s4, a7, t3
                  remu         s8, a7, a2
                  and          a4, t0, t2
                  auipc        t0, 945816
                  andi         s10, t4, -37
                  slli         a3, s10, 14
                  srli         ra, a0, 16
                  andi         s3, gp, 716
                  or           s7, t6, t0
                  flt.s        a6, fa5, fa3
                  andi         a5, s9, 1283
                  xor          s11, s10, s5
                  xor          s4, tp, ra
                  or           s1, s8, s4
                  divu         a5, a0, s0
                  auipc        t5, 388055
                  fmv.x.w      t6, ft4
                  fcvt.s.wu    fs4, a0
                  fsgnj.s      fs0, ft1, ft4
                  andi         a5, s4, -1618
                  sltu         t6, a1, a2
                  rem          a5, t6, s3
                  fsgnjn.s     ft10, fs9, fa2
                  feq.s        a0, ft5, ft2
                  slti         s3, t0, -48
                  fadd.s       fs8, ft0, fa6, rmm
                  fmv.x.w      a6, ft2
                  xor          s7, s4, a4
                  srai         t5, s11, 9
                  mulhu        t2, s10, s3
                  add          s8, s10, a7
                  mulh         s1, s1, t5
                  fmv.w.x      fs0, sp
                  fsub.s       fs10, ft11, fa1
                  fsgnjx.s     ft11, ft1, ft6
                  sub          zero, a7, t2
                  andi         s4, t3, 1023
                  and          t5, a1, s0
                  div          s10, t4, ra
                  sll          t6, sp, s5
                  xori         s3, a1, 1237
                  fcvt.s.w     ft8, tp, rdn
                  fmv.x.w      s5, fa2
                  fsqrt.s      fs11, ft7, rtz
                  lui          ra, 445706
                  fmin.s       ft2, fs0, fs8
                  auipc        s4, 840830
                  xor          gp, t5, ra
                  sra          a1, s3, a7
                  div          sp, s6, zero
                  fmv.w.x      ft10, a4
                  fclass.s     a5, ft1
                  sltiu        t6, t6, 2047
                  andi         t6, t2, 238
                  slli         tp, zero, 8
                  srli         s2, gp, 23
                  sll          t5, s9, gp
                  fmin.s       fa7, fa3, fs11
                  sll          s6, a2, a4
                  or           s11, s11, t3
                  rem          sp, s3, t1
                  mul          zero, a2, t4
                  fsgnj.s      fs4, fa2, fs1
                  sub          s11, s1, t4
                  fsqrt.s      ft6, fs7, rtz
                  fmul.s       ft0, ft0, fa1, rup
                  slt          s11, s0, s4
                  ori          sp, t1, -1301
                  xor          a2, s9, s8
                  xor          t4, ra, t5
                  nop
                  srl          a4, s6, a3
                  sltu         s11, s2, s8
                  lui          gp, 809449
                  fadd.s       fs7, ft2, fa6
                  fcvt.s.w     fs6, a6, rmm
                  fsqrt.s      fs3, fs1
                  mulh         a5, a6, zero
                  fdiv.s       ft6, ft6, fa2
                  xori         ra, a4, 212
                  fcvt.s.wu    fa5, s4, rtz
                  sltiu        zero, s1, -279
                  add          s0, a1, s11
                  srai         s8, s8, 25
                  slli         t0, t5, 10
                  rem          s7, s6, s3
                  slti         s1, a4, -588
                  slti         s4, s10, 536
                  sltu         zero, a7, s10
                  srai         zero, a0, 22
                  sra          s0, s1, t4
                  fmax.s       ft9, ft1, fa4
                  xori         s5, s11, -434
                  srl          s11, t1, t1
                  fmin.s       ft0, ft4, fa2
                  fcvt.s.wu    fa0, t5
                  andi         s11, t4, 401
                  div          a7, t5, t2
                  fsub.s       fs9, fa6, fs5
                  remu         a1, a5, s4
                  sra          sp, t1, t6
                  addi         a3, s7, -1905
                  or           tp, t1, t4
                  sltu         t5, sp, s5
                  fmul.s       ft11, fa6, fa2
                  auipc        a1, 677504
                  fsgnjx.s     fs11, fa5, ft3
                  fdiv.s       ft7, ft9, fs3
                  and          a6, ra, t4
                  fmv.x.w      ra, fs1
                  div          a2, a6, s0
                  fmv.x.w      s0, fs1
                  mulhu        a3, s10, t1
                  sll          a4, t3, t1
                  slti         s2, a5, 1721
                  fsgnj.s      fs2, fs11, fs0
                  divu         a6, t5, s8
                  slti         gp, s11, 1746
                  ori          zero, s7, 1528
                  slt          s11, s1, zero
                  andi         s6, s10, 1436
                  srli         s6, s2, 15
                  flt.s        a1, fa6, ft8
                  and          s4, sp, tp
                  fsub.s       ft11, ft10, fa5
                  fsgnjn.s     fa4, fa3, fs7
                  ori          s11, t6, -14
                  fsgnjn.s     fa0, fa4, ft0
                  slt          sp, t0, s5
                  fcvt.s.wu    fs9, s2
                  add          a7, t4, s7
                  lui          a7, 163767
                  slli         s7, sp, 25
                  fsub.s       fs7, fs4, fs11, rmm
                  fmv.w.x      fs0, s7
                  sltiu        t6, a7, -1767
                  fsgnjn.s     fa2, fs3, fs5
                  remu         t6, s2, t5
                  sub          s6, a5, a3
                  srai         a4, s3, 3
                  divu         zero, t1, zero
                  slli         tp, t3, 31
                  auipc        s6, 598056
                  sll          s4, a5, s9
                  fsgnj.s      fa3, ft8, fs4
                  sra          a4, t0, a4
                  add          t6, s0, t3
                  div          s6, s3, t3
                  mulhsu       ra, t6, s6
                  fsqrt.s      fs6, fs5
                  fclass.s     t5, fa5
                  fsgnjn.s     ft9, fa5, fa0
                  auipc        s3, 879023
                  fsqrt.s      fa5, ft9, rdn
                  slli         s4, t0, 24
                  fcvt.wu.s    zero, fa4
                  fmv.x.w      t0, fa7
                  fsub.s       fa1, fa6, ft10
                  mulhsu       t5, s5, t4
                  mulhsu       a5, s5, a4
                  nop
                  fsub.s       ft2, fs7, fs4
                  slti         s3, a2, -1797
                  addi         t2, zero, -1315
                  and          a1, s3, s5
                  fcvt.w.s     t5, fa6, rtz
                  rem          a2, s7, gp
                  srli         a0, s5, 8
                  fsgnjx.s     fs5, fa6, fa7
                  fmv.w.x      fa5, sp
                  slti         s3, tp, 1693
                  divu         s0, s11, t1
                  addi         s3, s8, -1092
                  slt          t4, t0, zero
                  feq.s        a1, fa5, fs5
                  fcvt.s.wu    ft2, s7
                  xori         a2, s3, -273
                  fmv.w.x      fs2, zero
                  fclass.s     t6, ft11
                  mul          t2, ra, sp
                  sltu         a3, s4, sp
                  fsqrt.s      fa6, fs5, rne
                  divu         s10, s1, a4
                  addi         gp, s6, -2026
                  fsqrt.s      fs8, ft7, rdn
                  nop
                  fcvt.s.wu    fa3, a5, rmm
                  auipc        a3, 311067
                  remu         s6, s1, ra
                  div          a2, a0, s6
                  fmin.s       fs5, fs5, fa7
                  lui          a2, 789260
                  sra          t2, a0, s5
                  fsub.s       fs2, ft1, fs8, rdn
                  sra          a4, t3, t4
                  fmin.s       fs8, fa0, ft0
                  lui          t6, 450466
                  srli         a5, a0, 10
                  flt.s        s10, fs8, fs5
                  fsgnjn.s     fs8, fs7, ft6
                  fcvt.w.s     s6, ft11
                  fcvt.w.s     s2, fa4
                  sub          s10, s7, s10
                  divu         a2, zero, a3
                  div          t6, a4, s6
                  divu         zero, a5, t1
                  rem          s3, s11, s6
                  srli         s4, s2, 20
                  srl          t0, a5, s8
                  fadd.s       fa2, ft7, fs1, rmm
                  srli         t2, ra, 4
                  fcvt.w.s     ra, ft11, rne
                  sltiu        s6, sp, -1006
                  mul          s2, s3, t5
                  add          a5, t1, a2
                  fmv.w.x      ft4, s8
                  fsqrt.s      fs7, ft5
                  xor          t5, s4, s1
                  lui          a4, 556297
                  fsqrt.s      fs5, ft2, rne
                  fclass.s     s10, ft6
                  srai         s10, t1, 8
                  slti         sp, a5, -1270
                  xori         a0, s1, -264
                  xori         s2, t1, 688
                  fmv.x.w      s4, fs6
                  ori          ra, s7, 1591
                  slt          s1, s5, s0
                  slli         t6, gp, 1
                  fmax.s       ft3, fa0, fa0
                  fsqrt.s      fs3, ft11
                  fsub.s       ft8, fa1, fs6
                  fsgnjn.s     fs1, fa2, fa2
                  srai         s2, a6, 11
                  ori          tp, a0, 1369
                  sra          s10, sp, t3
                  rem          ra, s9, a6
                  fmv.x.w      t2, ft3
                  fdiv.s       fa2, fs4, ft1, rne
                  feq.s        a1, fs4, fa0
                  add          t2, s8, s4
                  nop
                  slt          s5, t2, a7
                  remu         s11, s2, sp
                  sll          a4, a2, s11
                  fcvt.wu.s    t2, ft0
                  nop
                  fle.s        a7, ft9, fa0
                  fclass.s     a1, ft2
                  fmv.x.w      t5, fs10
                  feq.s        a2, ft7, ft5
                  feq.s        s3, fa4, ft6
                  slti         t4, t1, 1617
                  or           s3, s9, a1
                  fdiv.s       ft10, ft8, fs7, rne
                  fmax.s       fs0, fa6, fa5
                  rem          s1, gp, s11
                  sra          ra, s11, s6
                  fsgnj.s      fs2, fs9, fs2
                  slli         s3, ra, 21
                  fmv.x.w      s8, ft4
                  fcvt.w.s     sp, fs9
                  srl          zero, a0, a2
                  addi         t0, s4, -1500
                  fmin.s       ft2, fs10, ft3
                  sltiu        gp, tp, 1763
                  fdiv.s       fs8, fa1, fs1, rmm
                  fmv.x.w      sp, ft6
                  fmv.x.w      s10, fs5
                  fmul.s       fa3, ft10, fa4
                  srai         s3, s11, 11
                  xor          t2, a3, s11
                  auipc        a2, 278630
                  fcvt.s.wu    ft8, t5, rne
                  lui          ra, 209533
                  rem          a7, gp, a7
                  mulhu        s10, t5, s11
                  fmul.s       fa7, ft0, ft9, rne
                  slti         s4, s4, -1892
                  fcvt.s.wu    ft2, t1
                  mul          t0, a2, tp
                  div          ra, a6, t0
                  fsgnjn.s     fs5, fa7, ft8
                  fmv.w.x      fa1, a7
                  addi         a6, sp, 421
                  fcvt.s.w     fa2, a7
                  fmul.s       fa4, fs9, ft9
                  sltu         s8, s4, s9
                  mulhu        t5, s7, s3
                  fcvt.w.s     t4, fa1, rne
                  fsub.s       ft3, fs0, ft1
                  flt.s        s7, fs11, fa6
                  fcvt.s.wu    fs2, gp
                  fmin.s       ft8, fs10, fs10
                  fdiv.s       ft4, fs2, fs3
                  srl          a3, s11, s5
                  feq.s        a4, fs8, fs4
                  slti         s7, a2, 1588
                  nop
                  mulh         a3, a3, tp
                  fsgnjx.s     fs3, fs6, fs1
                  srai         sp, s8, 5
                  fsqrt.s      fa0, ft10
                  srli         t2, s0, 25
                  xor          t2, a3, s11
                  rem          tp, sp, t0
                  lui          s6, 412852
                  mulhu        s4, ra, t2
                  fle.s        s10, fs10, ft0
                  slt          tp, s6, a0
                  fcvt.s.wu    ft9, s7, rmm
                  fsgnjx.s     fa5, ft4, fs8
                  fmv.w.x      ft9, s9
                  addi         s2, a2, -246
                  flt.s        s10, fs10, fs11
                  sltiu        s8, gp, 303
                  fdiv.s       fs1, ft9, fs5
                  fclass.s     t5, fs3
                  fsgnjn.s     ft11, fs7, fs9
                  srli         s5, t4, 0
                  fmv.x.w      s6, ft11
                  fmv.x.w      sp, fs4
                  ori          zero, s1, -1349
                  sltu         t4, a6, gp
                  fmv.w.x      ft6, t3
                  fsgnjx.s     fs4, fa3, fs9
                  fmv.x.w      a4, ft9
                  srai         a0, ra, 4
                  fcvt.w.s     gp, ft11, rtz
                  xori         a4, a1, 976
                  sra          a1, a5, t1
                  fsgnjx.s     ft9, fs11, fs9
                  fsgnjx.s     fa6, ft9, fa4
                  addi         a0, a2, -1629
                  and          a4, a2, ra
                  add          s2, s4, s10
                  sltu         s8, s11, t2
                  fmul.s       ft1, ft3, ft2
                  fsqrt.s      ft9, fs8, rtz
                  div          a0, ra, a6
                  fsgnj.s      fs2, fa7, fs0
                  slli         a2, t5, 2
                  fmin.s       fa6, ft4, fa7
                  slli         s6, s7, 5
                  xori         t6, s11, 217
                  mul          t0, a6, a7
                  fsgnjx.s     fs2, fa3, ft3
                  srli         t5, a2, 0
                  fmv.x.w      t4, fa1
                  fsgnj.s      ft7, fa4, fs5
                  addi         t5, t3, -1486
                  auipc        t6, 200039
                  fsgnj.s      fs2, ft6, ft2
                  fmin.s       fa5, ft8, ft9
                  fmin.s       fa2, ft4, ft8
                  sltiu        s0, a0, -79
                  ori          t2, a4, 1342
                  xori         a6, zero, 591
                  srl          t6, t3, a2
                  srl          a6, s6, t5
                  sltu         a4, t3, t5
                  fcvt.w.s     a6, fs7
                  fsgnj.s      ft9, ft1, fs8
                  fle.s        s6, ft2, fs7
                  fsgnjx.s     ft3, fs7, fa7
                  fsub.s       ft4, ft7, ft9
                  flt.s        a2, ft7, ft1
                  andi         a7, a5, -1150
                  mul          t5, a7, a7
                  slli         s10, a3, 3
                  mulhu        t4, a1, s7
                  or           s0, s1, t5
                  fdiv.s       fa5, ft6, fs4
                  mulhu        s0, a4, t6
                  fsgnjx.s     fs5, fs10, fa2
                  divu         a1, a7, s0
                  feq.s        t6, fs4, ft2
                  fadd.s       ft3, ft5, fa4, rdn
                  srl          s7, a4, s11
                  srl          a0, t1, s2
                  fsgnjn.s     fa0, fs2, fs5
                  fsqrt.s      fa7, fs5
                  mul          a7, t2, a4
                  fclass.s     s5, fa1
                  divu         t6, s5, s3
                  fmv.x.w      s3, fs3
                  fcvt.wu.s    a4, fa4
                  fmul.s       fs2, fa1, fs7
                  fclass.s     tp, ft0
                  fsqrt.s      fa1, fa5, rmm
                  srli         s2, a4, 29
                  divu         t0, s11, s1
                  mulh         s2, zero, a2
                  srli         s3, s4, 12
                  fcvt.w.s     a3, ft8
                  slli         s4, s10, 17
                  add          s7, tp, a7
                  divu         a3, ra, s7
                  xori         ra, a6, 1706
                  srai         t6, s7, 31
                  sltiu        a7, s6, -363
                  mulh         a7, ra, a3
                  fcvt.s.wu    fs9, s7, rdn
                  xor          s1, s4, t0
                  srl          a3, t3, t2
                  fsub.s       fa4, ft1, fs4, rtz
                  fadd.s       fs11, fs0, fs1
                  fmv.w.x      fs7, zero
                  auipc        s11, 891034
                  slti         a7, s3, -869
                  sltiu        s5, a5, -1976
                  xor          a7, s7, a3
                  sub          s2, a1, s11
                  fadd.s       fa3, ft10, ft3
                  feq.s        a6, fs2, fs7
                  auipc        t4, 214094
                  fsqrt.s      fs0, fs6
                  mulh         s4, tp, a3
                  add          ra, tp, s4
                  remu         s6, a4, t6
                  div          ra, ra, a1
                  xor          gp, s11, a2
                  div          zero, t0, sp
                  fcvt.s.w     fs1, gp, rne
                  fle.s        s5, fs0, fa1
                  remu         zero, t0, gp
                  xori         sp, s10, -1477
                  mulhu        a1, a7, t1
                  addi         gp, s5, 373
                  auipc        a2, 607857
                  and          s4, sp, t2
                  fcvt.s.w     ft5, gp, rup
                  fmul.s       fs11, ft5, fa0
                  divu         t5, a0, s0
                  sll          a6, s2, a5
                  nop
                  fmin.s       fs5, fs1, ft0
                  fcvt.wu.s    s8, fs1, rmm
                  slt          s8, s9, s6
                  slli         t6, sp, 2
                  divu         a1, a3, t2
                  sra          a2, t0, s9
                  fsub.s       fa4, ft3, fa2
                  andi         tp, s8, -228
                  sll          s1, t6, s9
                  xor          s1, sp, s1
                  andi         s6, a2, -1723
                  fsgnjx.s     fs8, fa3, fs4
                  fcvt.wu.s    s1, fs4, rtz
                  lui          gp, 339495
                  fmin.s       fa5, fa7, ft9
                  srai         s6, t5, 2
                  lui          a6, 209833
                  rem          s2, s3, a1
                  nop
                  fsgnjx.s     ft4, fs3, fs6
                  nop
                  sltu         t4, s6, a4
                  fmax.s       ft11, fa2, fs11
                  fdiv.s       fs5, fs8, fa6, rne
                  fsqrt.s      fa2, fs6
                  auipc        a3, 898415
                  mulhu        s6, s5, s10
                  fmv.x.w      s8, ft4
                  fcvt.s.w     fs2, ra, rdn
                  fsub.s       ft7, fs0, fa2, rmm
                  fadd.s       ft8, fs11, ft11, rup
                  fsgnjn.s     ft10, fa3, ft2
                  rem          gp, a4, s2
                  fcvt.w.s     a0, fs1
                  mulhu        s3, tp, a2
                  fclass.s     s4, ft3
                  fclass.s     s3, fa3
                  sltu         s2, tp, tp
                  sll          a2, sp, t1
                  divu         gp, s11, s9
                  fmv.w.x      ft0, s2
                  fcvt.wu.s    a5, ft9
                  mulhu        s11, s2, a4
                  div          zero, gp, s10
                  div          t6, s8, t1
                  fdiv.s       ft10, fa5, fs4, rdn
                  xor          sp, a6, s10
                  fsub.s       fs11, fa7, fa3
                  rem          s1, a7, a7
                  sll          s1, a1, t2
                  addi         s3, t5, 303
                  addi         t4, s10, -1139
                  flt.s        s3, fa1, fs4
                  fle.s        gp, fs8, ft11
                  divu         s7, s9, s1
                  rem          zero, s9, sp
                  fdiv.s       fs7, fa4, fs11, rne
                  slti         s3, t4, -325
                  fcvt.wu.s    a0, fa5, rmm
                  lui          s8, 804563
                  flt.s        s0, fa3, fa3
                  mulh         s4, s2, gp
                  fcvt.s.wu    fs11, tp, rmm
                  fmul.s       ft3, fa7, fa7, rup
                  div          tp, t6, s4
                  mulhsu       a3, t2, t6
                  and          a7, t2, s0
                  fsgnjx.s     fs2, fs4, ft1
                  or           ra, a2, ra
                  mul          a5, tp, t4
                  lui          t6, 215800
                  fmv.w.x      ft10, a2
                  sll          a1, s5, s11
                  fle.s        s11, fa4, fs7
                  rem          s1, gp, s8
                  sll          sp, t2, a7
                  xori         gp, zero, -1981
                  remu         tp, gp, s2
                  fmin.s       ft5, ft10, fs8
                  fle.s        ra, fs5, fs8
                  fclass.s     a0, ft4
                  fsgnjn.s     ft8, fs6, fa7
                  or           t0, ra, s0
                  flt.s        a0, fs8, fs9
                  sltu         t5, t4, s8
                  slti         t4, s2, 455
                  mulhsu       s7, s7, s6
                  feq.s        s8, ft6, fs6
                  fsub.s       ft10, fs8, fs6
                  fcvt.s.wu    ft8, t3, rdn
                  fsgnjx.s     fs6, fs11, fa6
                  fmax.s       fs9, fa5, ft0
                  sra          s5, s5, gp
                  fsgnjn.s     ft6, ft5, fs1
                  fclass.s     s11, ft2
                  fdiv.s       ft0, ft1, ft4, rne
                  flt.s        s3, fa2, ft9
                  fsub.s       fs2, fs4, ft5
                  sltu         gp, s10, t2
                  sub          zero, a6, s3
                  fmul.s       ft10, fs3, fa6, rne
                  fsgnj.s      fs6, fs9, ft2
                  fmin.s       fs10, ft5, fa2
                  divu         s0, tp, a4
                  fmv.w.x      fs1, ra
                  slti         s1, s10, 1977
                  mul          a1, s9, a0
                  rem          s0, a0, s1
                  slli         s3, a7, 20
                  sll          gp, t6, t3
                  fmv.w.x      ft7, t3
                  andi         s7, t4, -1582
                  ori          s3, s5, 670
                  fcvt.s.wu    fs8, tp
                  fcvt.s.w     fs1, a4, rtz
                  andi         s5, s6, 243
                  sltiu        s6, s10, 610
                  slli         s1, t3, 13
                  ori          a7, sp, 1476
                  srli         s7, s1, 20
                  xori         s6, t4, -243
                  fsgnjn.s     fs10, fs0, fa2
                  fmin.s       fs11, ft3, fs2
                  fcvt.w.s     s10, ft10, rdn
                  slt          s0, s4, a2
                  and          s11, s9, sp
                  fsgnjx.s     fs8, ft0, fs4
                  fsgnjx.s     ft6, ft5, fs1
                  mulhu        s0, a1, t4
                  xori         a0, a6, 467
                  fcvt.w.s     s5, fs9
                  mulhu        t5, sp, a6
                  srli         sp, tp, 17
                  fcvt.w.s     s10, ft2
                  sll          s8, t0, s0
                  addi         a2, gp, 133
                  xor          a4, s11, s9
                  fdiv.s       fs5, fa4, ft9, rup
                  fcvt.s.wu    fs0, s10
                  sll          a5, a6, zero
                  auipc        t5, 672687
                  mulh         sp, sp, a6
                  remu         sp, s9, s7
                  fsgnjn.s     fa3, fs11, ft3
                  sll          t5, a6, s11
                  slt          a3, s2, tp
                  mulhu        s4, a0, a6
                  slti         a6, t2, -1080
                  fsgnj.s      fa5, fa4, fa4
                  xori         a2, a4, -1740
                  fmv.w.x      ft10, t5
                  fsgnj.s      ft8, fs3, ft1
                  mul          sp, s8, t2
                  fcvt.w.s     a4, fs1
                  ori          ra, tp, 830
                  xori         s4, s7, 825
                  fle.s        a7, fa6, fa1
                  remu         s4, t6, s6
                  fle.s        t2, fa7, fa3
                  flt.s        a7, fa1, fa5
                  slli         t2, s1, 31
                  xor          s4, sp, t2
                  sltu         s3, t3, a3
                  srli         t4, a1, 22
                  remu         ra, s1, t3
                  fcvt.s.wu    fa2, s6, rmm
                  fclass.s     s10, fs3
                  fcvt.s.wu    ft5, zero, rtz
                  sltiu        s2, t5, -797
                  fdiv.s       ft1, ft5, fa7
                  sub          a7, s2, s4
                  fcvt.w.s     a0, fs2
                  mulhu        t5, s3, s6
                  srai         s6, t5, 11
                  add          t4, tp, s3
                  ori          s10, t6, 656
                  fsub.s       fs11, fs9, fa0, rtz
                  div          a6, t1, s10
                  sltu         t0, t3, t0
                  lui          t4, 364600
                  fcvt.s.w     fs3, s7
                  andi         sp, s6, -7
                  fle.s        a5, ft8, ft3
                  srli         gp, s1, 25
                  slt          s3, sp, t0
                  fclass.s     s11, fs5
                  fclass.s     s4, ft8
                  mul          a3, s0, s4
                  slli         a6, a5, 11
                  fclass.s     zero, ft2
                  addi         ra, t0, 1059
                  addi         s2, s1, 20
                  sltiu        t5, s10, 1379
                  or           s0, s10, t1
                  fmul.s       ft9, fs3, fa3, rup
                  slt          sp, s9, s1
                  xori         a2, s2, -1557
                  sltu         zero, a7, a2
                  fdiv.s       ft10, ft7, fs0
                  add          s4, t5, a2
                  and          s4, s7, s4
                  fcvt.wu.s    a1, ft2, rne
                  mulhsu       gp, s2, s3
                  lui          a1, 926104
                  srl          s3, t3, a0
                  mulhsu       a7, s6, s11
                  fsgnjn.s     ft4, ft7, fs10
                  fsqrt.s      ft1, fs6
                  slti         a5, s8, 486
                  fmv.w.x      fa3, t3
                  mul          a3, sp, a7
                  sltiu        a6, s4, -2013
                  fsgnjn.s     fa1, ft3, fa7
                  fmax.s       fs0, fa3, fa0
                  fsqrt.s      ft4, fs9
                  mulhsu       a1, t3, t1
                  fcvt.w.s     s0, ft8, rup
                  fsgnj.s      fs8, ft7, ft9
                  add          t6, a6, s8
                  fsqrt.s      ft6, ft3
                  srli         s3, t0, 8
                  slli         s0, a0, 3
                  add          s11, a3, s8
                  flt.s        a2, ft8, fs3
                  mulh         ra, s10, sp
                  and          a0, sp, a5
                  fmin.s       fs9, fa6, fa1
                  xor          gp, a4, t6
                  fsub.s       fa1, fa6, ft6, rmm
                  srl          s7, t4, t3
                  fle.s        s3, ft7, ft2
                  fcvt.s.wu    fs9, a1, rmm
                  fmul.s       fa4, fa3, fa7
                  fadd.s       fa6, ft9, fs2, rdn
                  fsgnjn.s     ft1, ft0, fs4
                  fmul.s       ft11, fs10, ft9
                  flt.s        tp, fa2, fs8
                  fsub.s       fs11, fa6, fs3
                  fsub.s       fs9, fa2, fs9
                  mul          s3, s10, s2
                  fsqrt.s      fs7, ft10
                  div          a3, t4, s5
                  sub          s7, a7, gp
                  sra          ra, a5, s10
                  fcvt.wu.s    gp, ft3, rne
                  srli         gp, gp, 13
                  div          t6, ra, t3
                  fcvt.s.wu    ft5, t2
                  fle.s        s11, ft7, fa0
                  fadd.s       fs5, fa3, fs8, rne
                  addi         sp, a7, -577
                  fsgnj.s      fs11, fs8, fs7
                  andi         s7, s6, -505
                  fle.s        t2, fa7, fa1
                  flt.s        a5, fs1, ft2
                  remu         t6, t6, t0
                  lui          s11, 431510
                  mulhu        s3, t5, s8
                  fmin.s       ft1, ft1, ft6
                  or           t0, s8, a0
                  fdiv.s       fs6, fs6, ft10, rmm
                  fsgnjx.s     fs0, fs4, fs1
                  fclass.s     a6, fs5
                  auipc        a3, 428590
                  and          s7, s8, s8
                  fsgnjn.s     ft11, ft8, ft5
                  srai         t2, a6, 17
                  slt          t0, gp, a3
                  remu         s0, s2, sp
                  fdiv.s       ft4, fs0, fa4, rtz
                  fcvt.wu.s    a0, fs2, rup
                  sll          s3, t1, t2
                  and          a4, s5, s2
                  fcvt.wu.s    ra, fs3
                  xori         gp, gp, 517
                  sll          ra, s7, s4
                  fsgnjn.s     ft2, ft7, ft9
                  fdiv.s       ft3, ft9, ft8, rdn
                  fdiv.s       fa4, fs2, fs6
                  auipc        zero, 1003855
                  fcvt.s.wu    fa4, s11
                  sra          s2, a5, t0
                  fcvt.wu.s    t0, fs6, rtz
                  add          a0, tp, tp
                  fcvt.wu.s    a3, fs1, rne
                  sra          a1, t6, a4
                  fsgnj.s      fa5, fs8, fs11
                  sltu         s4, a3, a3
                  fclass.s     s4, fs8
                  nop
                  sub          tp, s7, t6
                  sra          a6, a7, a7
                  fle.s        s2, fs9, fa3
                  fadd.s       ft3, fa0, fs4
                  auipc        s8, 64539
                  fsgnj.s      ft2, fa3, ft4
                  fle.s        s0, ft8, fs10
                  fcvt.wu.s    a6, ft6, rup
                  fmax.s       ft2, fs3, fs10
                  flt.s        gp, fa0, fa6
                  auipc        t5, 550006
                  andi         gp, t4, -1480
                  fcvt.wu.s    s2, fs4
                  sltiu        tp, sp, 1738
                  fdiv.s       fs3, ft11, ft4, rup
                  and          a6, zero, a5
                  fcvt.s.w     fs5, a3
                  fmv.w.x      fs0, tp
                  fsgnjx.s     fs7, ft5, fs7
                  fadd.s       fs5, ft0, ft0
                  or           sp, s3, s4
                  slli         a5, tp, 1
                  fadd.s       fs6, fs3, ft2
                  fmin.s       ft0, fs6, fs2
                  fsgnjn.s     fa5, ft3, fa4
                  mul          t5, ra, t2
                  fsgnjx.s     fa6, fa5, ft4
                  flt.s        a5, ft8, fs3
                  sltiu        t0, a7, -318
                  addi         s0, s7, -1785
                  xori         ra, a4, 358
                  fmul.s       fs1, ft7, fs6
                  addi         gp, a4, -757
                  fcvt.w.s     s3, fs7
                  sll          t4, s10, t6
                  addi         s5, a4, 1656
                  fmv.x.w      s5, ft10
                  fmin.s       fs1, fa6, fa0
                  mulhsu       a0, a1, a3
                  or           a2, t6, t1
                  fmul.s       fa7, fs0, fa4
                  fclass.s     a7, fa3
                  srai         s4, sp, 29
                  fsgnjx.s     fs6, fs2, ft6
                  andi         s0, a5, -1818
                  fmax.s       fs11, fa3, ft9
                  srli         sp, s4, 21
                  fsgnj.s      ft6, ft5, fs11
                  mulh         t5, s6, a6
                  srai         a0, gp, 28
                  fadd.s       fs4, fa6, ft4, rtz
                  nop
                  addi         s1, tp, -205
                  add          t4, s4, s11
                  sra          s7, s9, s3
                  xor          s3, gp, a6
                  fcvt.wu.s    zero, ft0
                  remu         t0, s2, t5
                  rem          s6, sp, s8
                  fmin.s       fs3, fs10, fs4
                  xor          zero, zero, a3
                  nop
                  andi         t5, s7, 287
                  mulhsu       zero, a7, s8
                  fsub.s       fs4, ft11, ft4, rne
                  add          a6, t4, s9
                  slli         a5, s10, 1
                  fclass.s     s6, ft0
                  feq.s        ra, fa3, ft7
                  div          a0, s2, t2
                  auipc        t4, 233084
                  fle.s        a6, fs3, ft4
                  mul          ra, s5, s7
                  flt.s        a2, fs4, fa1
                  fsqrt.s      fs1, fa4, rup
                  addi         a6, a7, -1734
                  srai         s6, s0, 2
                  fsgnjn.s     fs2, fs2, fs3
                  fsgnjn.s     ft5, fs6, fa4
                  fsgnjx.s     fs9, ft1, fa2
                  fcvt.w.s     ra, ft6
                  fsub.s       fs4, ft4, fa3, rmm
                  fcvt.s.w     fa0, a2
                  andi         zero, t1, -1601
                  fclass.s     tp, fs7
                  fsqrt.s      fa4, fs6
                  xor          s1, s0, s0
                  slti         a4, s6, 525
                  mulhsu       a6, t3, a2
                  mulhsu       s6, a2, gp
                  fsgnjn.s     fs7, fs3, fs1
                  fsqrt.s      ft0, fs9
                  fsgnjn.s     ft11, fa6, fs7
                  or           a0, a3, s9
                  mulh         a2, a5, t1
                  xori         a1, a0, 1126
                  srl          sp, a5, a7
                  div          zero, t2, a3
                  feq.s        a2, fs2, ft0
                  fmv.w.x      fs11, ra
                  fclass.s     zero, fa3
                  xori         tp, t1, 371
                  fmin.s       ft2, fs5, ft8
                  fcvt.s.wu    ft4, s6
                  feq.s        sp, fs7, fa5
                  fmv.w.x      fs6, gp
                  fsgnjx.s     ft3, ft10, fa1
                  andi         s4, sp, 64
                  ori          s5, gp, 943
                  flt.s        a6, fa0, fs10
                  ori          zero, s6, -292
                  slt          a4, sp, t3
                  div          t0, a0, s0
                  rem          a2, t0, sp
                  remu         t4, t2, s8
                  fdiv.s       fs11, fa3, fa5
                  fmin.s       fs1, fa2, fa6
                  fsgnjn.s     ft1, fs2, fa4
                  fsgnjn.s     fa3, ft3, fa1
                  sltu         a0, s1, gp
                  fcvt.wu.s    s0, ft3
                  mulhu        a2, t6, t4
                  fmax.s       fs7, fa6, fs4
                  fclass.s     a5, fs3
                  sll          sp, s3, s6
                  slli         t6, t6, 29
                  sltu         a1, s0, s8
                  srl          s6, a7, t1
                  slti         s4, s9, -327
                  fsub.s       fs6, fs5, fs1, rtz
                  divu         s3, t4, zero
                  feq.s        a2, fa2, ft5
                  rem          s5, a2, sp
                  mulhsu       s2, t4, tp
                  fcvt.s.w     fs0, t4, rtz
                  fdiv.s       ft7, fs4, ft9, rup
                  mul          gp, a3, s5
                  andi         t6, s6, 850
                  div          s2, s1, s11
                  srli         a3, s8, 21
                  fsqrt.s      fs0, ft6
                  fcvt.s.w     fa2, ra, rdn
                  fsgnj.s      fs7, fs10, fs5
                  mul          a4, s7, sp
                  rem          a1, a5, t0
                  andi         t6, t3, 1324
                  fcvt.s.w     ft11, s3, rmm
                  mul          s0, a3, s11
                  fcvt.s.wu    fs5, a6, rne
                  fle.s        t4, fs10, ft0
                  srli         t2, s7, 17
                  mulhsu       s7, zero, tp
                  fsgnj.s      fs8, fs6, ft8
                  div          s5, sp, t0
                  mulhsu       a1, a4, a0
                  nop
                  fmul.s       fs1, ft9, fs3, rmm
                  fsgnj.s      fa1, fs4, fa6
                  fcvt.s.w     ft2, t4
                  feq.s        a7, ft6, fa3
                  fcvt.wu.s    s2, fs11
                  xor          a6, s9, s10
                  srl          zero, a1, zero
                  nop
                  div          s11, t0, s2
                  fcvt.w.s     gp, fs0, rdn
                  sll          gp, t5, s8
                  fmul.s       fa1, fa0, fs11
                  srai         a0, s4, 1
                  flt.s        a7, fs11, ft5
                  sub          s3, t0, t0
                  fmul.s       ft7, ft2, fs3, rup
                  lui          s6, 668135
                  fcvt.s.w     ft11, t3
                  fcvt.s.w     fs4, gp
                  sra          s1, t0, a0
                  fcvt.wu.s    a3, ft9
                  sltu         a3, a6, s6
                  srai         s3, s1, 16
                  mul          a5, a4, a1
                  sub          a4, a4, a1
                  sltiu        zero, t1, 228
                  nop
                  divu         s8, s8, t3
                  divu         zero, a0, tp
                  feq.s        a7, fa0, ft7
                  fcvt.w.s     zero, fs2
                  xori         a5, t2, -950
                  mulh         gp, t5, a1
                  slli         t4, s7, 26
                  mulhsu       a4, a4, t5
                  fsub.s       fs6, fs8, fa6
                  fcvt.wu.s    s1, fa4
                  slt          a4, s8, a1
                  and          a4, s5, a5
                  flt.s        t5, fs2, ft7
                  nop
                  fsgnj.s      fs5, fa6, ft6
                  and          t4, s5, a1
                  fsqrt.s      fs1, fs0, rup
                  xori         t6, s11, 388
                  sltu         s7, s10, s10
                  srai         s5, t2, 12
                  mulhu        t4, s8, a4
                  fsgnj.s      fa4, fs4, fs10
                  mul          gp, s7, a7
                  rem          t5, s7, s6
                  nop
                  sltiu        t6, s7, -293
                  addi         s8, tp, -863
                  srl          a0, tp, s7
                  fmul.s       fs3, fa5, ft4, rne
                  and          ra, s0, s11
                  fmv.w.x      ft11, s5
                  fclass.s     s8, ft10
                  fmin.s       fs7, ft10, fs7
                  ori          a0, t0, 1261
                  fsub.s       ft6, fa3, fa2
                  srai         t0, t6, 16
                  fadd.s       ft11, ft0, fa0
                  fmax.s       ft3, fs4, ft7
                  fle.s        a7, ft9, ft10
                  add          s6, a3, s4
                  fsgnjx.s     fs8, fs3, fs6
                  div          a1, a1, a5
                  mul          sp, t2, a6
                  srl          s11, s11, a0
                  fcvt.wu.s    a1, fs8, rmm
                  and          t4, a0, s0
                  fdiv.s       ft3, fs6, fs11, rup
                  srl          a6, a1, s11
                  slli         a4, tp, 4
                  fsgnjn.s     fa1, ft0, fs10
                  fmax.s       fs1, fa3, ft10
                  fcvt.wu.s    s11, fa2
                  remu         t6, s5, s6
                  and          a3, a5, gp
                  flt.s        s6, fa1, fs11
                  xor          gp, t1, s0
                  flt.s        s2, fs4, ft9
                  rem          s5, sp, t2
                  fdiv.s       ft5, fs10, ft7, rdn
                  addi         s5, gp, 149
                  fsgnj.s      fs10, fa6, ft6
                  mulhu        a0, t6, sp
                  mulhu        s10, s3, s1
                  fmv.w.x      fa3, a6
                  srl          a2, s11, t5
                  fadd.s       ft7, ft9, ft3
                  xor          a2, s3, tp
                  fclass.s     t4, ft4
                  ori          a2, s11, 1568
                  slti         s1, a0, -1167
                  andi         s8, a1, 900
                  slt          a5, s0, s4
                  div          s3, s4, a0
                  feq.s        a4, fs5, ft7
                  remu         s10, a3, s4
                  fadd.s       ft0, fs1, ft7
                  or           s0, zero, a7
                  sra          a5, s8, s5
                  divu         s4, tp, s8
                  srai         t5, s6, 17
                  feq.s        gp, ft8, fs5
                  sltiu        t2, a0, 668
                  fmv.x.w      s10, ft3
                  xori         a2, t4, 1835
                  fsub.s       fs2, fa0, ft8, rup
                  slli         a7, a1, 31
                  nop
                  srai         a6, sp, 28
                  lui          t4, 295507
                  fmv.w.x      ft2, t2
                  auipc        s1, 119384
                  lui          s0, 262810
                  fcvt.s.w     fs0, s2, rdn
                  srli         a2, s11, 15
                  feq.s        a7, fs2, fs1
                  add          s11, a4, sp
                  remu         ra, s2, s1
                  fsqrt.s      ft6, fs9
                  fmv.w.x      ft8, a1
                  fadd.s       fs11, fs0, ft1, rtz
                  fsqrt.s      fs7, fs0, rne
                  fmv.x.w      s8, ft1
                  slt          s11, s6, s3
                  fsub.s       fs10, ft11, ft6
                  div          a3, a6, t3
                  fmv.w.x      fa2, s5
                  fmv.w.x      fa2, a3
                  rem          a2, s3, zero
                  add          t0, s3, a3
                  andi         a2, a1, -324
                  and          t6, s0, t1
                  slli         a1, s3, 2
                  lui          gp, 538028
                  div          tp, t1, zero
                  fcvt.w.s     s6, fs10
                  add          zero, s9, tp
                  divu         s1, zero, s5
                  mulhu        s1, zero, s6
                  addi         t2, t0, 1916
                  sra          ra, s7, s0
                  divu         tp, a1, s0
                  fdiv.s       fa4, fs4, ft1, rne
                  add          s11, s11, ra
                  fsqrt.s      fa6, ft10, rup
                  mul          s6, zero, s1
                  sltiu        s1, a4, 1810
                  sltiu        t5, a6, -1542
                  div          a6, t3, s2
                  sltiu        tp, t6, 1288
                  xor          t5, a7, s5
                  sra          s6, a1, a1
                  add          t2, t1, s3
                  rem          t0, a0, t6
                  fsgnjn.s     ft2, fs5, fa3
                  feq.s        sp, ft4, fs11
                  nop
                  nop
                  feq.s        zero, fs5, ft2
                  fcvt.w.s     a3, ft6, rtz
                  ori          s0, s4, 1853
                  fadd.s       fs11, fa6, fs10
                  fle.s        tp, fs11, fa6
                  xori         s0, s10, -518
                  fadd.s       fs3, ft9, fa3, rne
                  mulhsu       a7, t3, s10
                  fsgnjn.s     fs5, ft10, ft6
                  or           a6, t0, tp
                  fsgnjn.s     fa5, fs2, fa2
                  fsgnjx.s     fa5, fs10, fa0
                  slli         s7, s7, 16
                  srli         s0, s3, 15
                  fcvt.s.w     ft9, ra, rup
                  fcvt.wu.s    s10, ft1
                  slli         a1, s4, 8
                  andi         a0, s10, 292
                  ori          t5, a0, 710
                  sltiu        a5, sp, -1514
                  lui          s8, 650836
                  fsub.s       fa7, ft9, fa4, rup
                  fsgnjn.s     fs8, fs5, ft10
                  fsgnjx.s     ft5, ft0, ft6
                  slt          t0, s3, s4
                  fmul.s       fs9, ft4, fs6, rtz
                  mulh         a1, sp, s9
                  fcvt.s.wu    fs0, s3, rne
                  fle.s        a1, ft11, ft5
                  mulh         ra, sp, a1
                  fmv.x.w      s1, ft5
                  fcvt.wu.s    s4, fa4
                  ori          sp, s2, -1272
                  slt          s3, t4, s3
                  addi         s6, a7, -1040
                  fsgnjx.s     ft2, ft0, fa1
                  rem          t2, gp, gp
                  fcvt.w.s     gp, fa6, rmm
                  slli         s4, zero, 16
                  fdiv.s       fa3, ft4, fs6
                  mulhsu       a3, t2, a0
                  remu         s6, t2, t0
                  fmv.w.x      fs7, s2
                  mulhsu       ra, t0, s8
                  fcvt.s.wu    fs5, a3
                  sltu         s6, a2, s0
                  mulhu        s4, gp, s7
                  xor          t6, a2, s0
                  fclass.s     t4, fa2
                  slti         s8, t5, -1693
                  fcvt.wu.s    s8, fs3, rdn
                  and          s8, a0, s5
                  fcvt.s.w     ft8, s7
                  slli         s3, s3, 29
                  andi         sp, t5, -1369
                  fdiv.s       fa6, ft10, ft10
                  lui          a7, 551945
                  srli         a0, sp, 21
                  sra          zero, t2, a1
                  addi         s1, t4, 863
                  remu         a2, t2, a2
                  or           s2, s1, s2
                  fmv.w.x      fs0, t6
                  sltu         tp, t5, t1
                  fsgnjn.s     fa4, ft2, fa6
                  fsgnjn.s     fa4, ft1, fs4
                  srli         t4, s2, 20
                  fcvt.s.wu    ft10, t0
                  and          s0, t4, s3
                  fadd.s       ft1, ft11, fs5
                  fmin.s       ft11, fa1, ft5
                  sll          tp, s2, zero
                  or           t5, t0, s0
                  feq.s        sp, fs9, fs1
                  fcvt.w.s     s4, fs4
                  srl          t0, a0, s3
                  srl          a2, s5, a4
                  divu         s4, gp, zero
                  fmul.s       fa2, ft1, fs0
                  fmax.s       fa7, ft10, fs10
                  feq.s        s3, fa6, fa1
                  fmv.w.x      fs11, s6
                  remu         a5, t1, t5
                  sra          s6, a2, s4
                  fsqrt.s      ft0, ft10, rup
                  slli         s2, s5, 1
                  fmv.x.w      t6, fa4
                  xor          ra, a5, a2
                  addi         tp, a2, 902
                  fcvt.wu.s    a1, ft10, rup
                  fsub.s       ft1, ft4, ft2
                  fsgnjn.s     ft9, fs2, fa2
                  auipc        a6, 102606
                  mulhsu       a1, s4, s4
                  sll          s10, t2, a5
                  srl          s11, zero, s5
                  fsgnjx.s     ft5, fs2, fs9
                  sra          gp, a1, t0
                  sra          a6, s10, s7
                  sltu         ra, s6, a3
                  fsgnjn.s     fs8, fa5, ft1
                  ori          ra, a2, -112
                  remu         a1, a1, a1
                  slt          a5, t0, s0
                  auipc        s3, 486049
                  flt.s        gp, ft4, ft5
                  sub          a1, s6, a2
                  divu         zero, t6, s9
                  mulh         sp, s11, t2
                  fclass.s     s7, ft11
                  slli         a2, a3, 20
                  auipc        gp, 97495
                  fadd.s       ft4, fs3, fs9, rne
                  fmax.s       fs4, ft9, fs1
                  sltiu        s6, s1, -319
                  fsgnjn.s     fs3, fs4, ft7
                  fmv.x.w      t0, fs8
                  fmax.s       fs4, ft11, fa5
                  sra          s5, s8, t6
                  fsub.s       ft2, ft8, fs1, rtz
                  slt          t4, zero, t4
                  sltu         tp, s3, a2
                  fsub.s       ft7, ft0, fs0
                  xori         a4, s8, -338
                  remu         s6, s5, a5
                  fmv.w.x      fs9, s9
                  remu         ra, gp, a2
                  sub          s1, a3, s4
                  mulh         ra, t6, tp
                  fcvt.wu.s    a6, fs11, rne
                  fmax.s       ft5, fs11, ft0
                  xori         a0, a6, -796
                  sltu         a6, a5, t1
                  fadd.s       fa5, ft7, ft2, rtz
                  fsqrt.s      fa6, fs8
                  mulh         a4, s0, a2
                  sra          s5, a0, sp
                  sltu         a2, s4, ra
                  fmv.w.x      fa7, a1
                  fcvt.s.wu    fs8, s9
                  fmax.s       ft8, fa7, fa7
                  fsgnjx.s     ft6, ft4, fa7
                  fmin.s       fs4, fa1, fa1
                  remu         a5, s10, t4
                  fmul.s       fs2, fs8, fs0
                  and          a3, gp, s7
                  mulhsu       s10, s11, a1
                  fmv.x.w      a1, ft3
                  flt.s        ra, fs1, ft9
                  fsgnjn.s     fs2, fa5, fs7
                  lui          t6, 430935
                  flt.s        s4, ft11, fs3
                  srai         sp, s0, 19
                  or           s1, s8, t4
                  mulhu        s10, t6, s1
                  lui          sp, 52098
                  flt.s        a2, ft6, fs1
                  mul          t6, a6, zero
                  fcvt.wu.s    t0, fs1, rmm
                  fmin.s       fs11, ft4, fs6
                  fcvt.w.s     s4, ft1, rdn
                  rem          a5, a5, tp
                  srl          zero, s6, a6
                  fmv.w.x      ft4, ra
                  fmv.x.w      s10, ft2
                  sub          tp, s8, a5
                  xori         a2, s6, 1792
                  andi         t5, t6, 1077
                  div          a3, zero, t0
                  auipc        s3, 860954
                  fmul.s       fs6, ft7, fa4
                  fadd.s       fs1, ft10, fs5, rmm
                  slt          t5, s0, s11
                  andi         a5, a2, -921
                  mulhsu       s4, s11, t5
                  fmv.w.x      fa2, a4
                  sll          a6, s9, gp
                  mulhu        sp, s4, ra
                  sltu         ra, s2, s6
                  fsqrt.s      fs2, ft4, rne
                  srli         s8, t5, 11
                  fcvt.wu.s    a2, fa6
                  fmul.s       fa0, ft2, fa5, rtz
                  fcvt.s.wu    fs6, s0
                  slli         ra, s10, 14
                  fcvt.wu.s    a3, fs9
                  and          tp, t3, s0
                  andi         a6, sp, -884
                  fcvt.w.s     t0, fa7, rdn
                  fsub.s       fs0, ft3, ft9
                  fadd.s       ft0, ft8, fs3, rne
                  sub          s2, s11, t2
                  mulhsu       sp, s10, s8
                  lui          sp, 949228
                  mulhsu       t5, sp, a5
                  nop
                  srli         s6, s10, 9
                  slt          t0, a1, gp
                  slti         zero, t1, 249
                  fle.s        s8, fs11, fa2
                  slti         zero, s7, 162
                  addi         ra, t1, -1559
                  fdiv.s       ft0, ft2, ft7
                  fmax.s       fs2, ft10, fs2
                  fsgnj.s      ft6, fa4, ft7
                  div          s0, s9, sp
                  srli         s4, sp, 10
                  fsgnjn.s     fs5, fs9, fs10
                  sltu         tp, a1, t2
                  divu         s11, a7, t1
                  rem          s3, s6, a5
                  sll          s5, ra, s9
                  fmul.s       ft6, fa7, fa5, rup
                  fclass.s     a5, ft10
                  addi         s3, s1, 340
                  fmv.x.w      a7, ft7
                  mul          s11, s6, a1
                  mulhsu       t2, t5, s8
                  feq.s        a2, ft10, ft6
                  ori          s6, a5, 1799
                  fmin.s       ft2, fs11, ft9
                  fsgnjx.s     fa6, ft9, ft3
                  nop
                  fcvt.s.w     fs10, ra
                  fcvt.s.w     fa0, a0, rup
                  feq.s        a3, fs11, ft8
                  fmv.w.x      ft1, s8
                  mulh         tp, s8, a4
                  fsgnj.s      fs1, fs9, fs4
                  srli         gp, gp, 27
                  fcvt.wu.s    t6, fa7
                  sll          s6, a2, t1
                  fdiv.s       fs2, fa0, fa4, rtz
                  fsqrt.s      ft2, ft1
                  fmv.w.x      fs4, a0
                  fmin.s       ft8, ft7, fa0
                  flt.s        gp, fs6, fa2
                  srai         t4, t6, 0
                  mulhsu       a1, t0, tp
                  fcvt.wu.s    gp, fs4, rne
                  or           a2, ra, t3
                  slli         t4, s1, 22
                  mul          a7, a7, s0
                  sll          s0, s11, a6
                  fdiv.s       ft0, fa5, ft1
                  slti         sp, s6, -1745
                  auipc        zero, 1017935
                  xori         s3, s6, -1588
                  slli         a5, a0, 23
                  rem          s0, s0, t5
                  sltu         t2, gp, gp
                  sub          s7, t3, s11
                  auipc        t0, 922703
                  sra          s1, a1, a7
                  mulhsu       ra, a1, a4
                  srai         s2, a3, 25
                  fsub.s       fs1, fs5, fs5
                  or           zero, s1, t6
                  mul          a7, t4, a1
                  and          a7, a5, t6
                  mulhu        a7, a3, t0
                  mulhsu       a3, a3, s6
                  fsgnjn.s     fs8, fs9, fa0
                  ori          tp, s11, -1747
                  flt.s        t5, fs0, fa3
                  sltu         gp, s4, s5
                  fcvt.s.wu    fs3, a4, rtz
                  fsgnj.s      ft10, fs0, ft0
                  srli         s11, s0, 12
                  fclass.s     s4, fs4
                  fcvt.s.wu    ft3, sp
                  fsub.s       fs11, ft0, fa0
                  remu         a2, t2, s2
                  mulhu        tp, tp, a5
                  mul          t2, t1, t5
                  fsqrt.s      fa6, fa2, rup
                  sltu         sp, t3, a2
                  fadd.s       fa6, fs6, fa2, rmm
                  rem          a4, s8, a7
                  mulhsu       s7, s7, tp
                  feq.s        s3, fa4, fs11
                  fsgnjx.s     fs7, ft11, ft3
                  slli         s2, a1, 6
                  fmax.s       fa2, ft9, ft6
                  fmul.s       fs1, fa6, fs0
                  fmv.x.w      s7, fa6
                  andi         t6, a3, 1496
                  divu         s6, t6, t4
                  remu         a3, a2, a1
                  remu         gp, t3, zero
                  fsgnjn.s     fa7, fa2, ft3
                  xori         gp, t1, -1704
                  feq.s        a3, fa4, fa3
                  fsgnj.s      fs8, ft4, ft6
                  nop
                  fmax.s       ft11, ft7, ft1
                  fsqrt.s      fa4, fs9, rtz
                  fdiv.s       fa1, fs0, fs8
                  sub          ra, t2, s8
                  slli         ra, s6, 0
                  fcvt.s.w     fs9, s0, rtz
                  fsgnjn.s     ft4, fs11, fa5
                  xori         a7, t0, 1725
                  sll          t5, a2, t1
                  fsgnjn.s     fs2, fa1, ft7
                  mul          a4, t3, a5
                  fsgnjx.s     fa4, ft9, fs4
                  fcvt.s.wu    fs5, zero, rmm
                  slt          s4, s1, sp
                  andi         s1, t0, -1298
                  fsgnj.s      fs1, fs2, fs1
                  or           s10, s7, s2
                  fcvt.s.w     fa5, s5, rtz
                  mulhu        a6, gp, a0
                  addi         s0, s4, -816
                  fcvt.w.s     a7, fa2, rdn
                  fmv.x.w      a6, fa3
                  sltiu        sp, s1, -32
                  fsgnjn.s     fa2, fa3, ft5
                  xori         a7, t2, 1217
                  and          s6, s6, a7
                  fmv.x.w      a2, fa2
                  feq.s        s2, fa3, fs6
                  srai         s5, s11, 19
                  mulhu        s4, gp, s1
                  auipc        ra, 273333
                  srl          a6, a1, a3
                  slti         ra, sp, 965
                  srai         a7, t3, 6
                  fmul.s       fs6, fs7, fs1
                  fsgnjx.s     fs3, fs6, fa4
                  and          a7, t5, s2
                  srli         s11, a1, 10
                  fcvt.w.s     s6, ft6
                  add          ra, s9, s6
                  fadd.s       fa0, fa3, ft3, rne
                  and          t5, s10, a1
                  fsgnj.s      fa2, fa0, ft7
                  sub          s2, s10, s4
                  mulhu        t4, a3, tp
                  fsgnj.s      fs11, fs6, ft0
                  fdiv.s       ft11, fs3, fa1, rdn
                  xor          s3, gp, s6
                  fmv.x.w      t2, fs6
                  fcvt.w.s     t0, ft10
                  sll          t4, a0, t4
                  andi         s7, a1, 247
                  sll          sp, s6, t1
                  andi         t2, t1, 1141
                  mulhsu       s5, s3, ra
                  srli         t4, a5, 12
                  fsgnjn.s     fa2, fa3, fs1
                  fsgnjx.s     ft7, fs0, ft2
                  flt.s        s2, fs10, fa5
                  sltiu        s1, a1, -421
                  fclass.s     s6, ft4
                  mul          t0, a7, t0
                  nop
                  div          t0, a7, tp
                  fle.s        s4, ft11, ft1
                  div          t4, s10, a7
                  slli         a0, s3, 1
                  ori          s4, s11, 2043
                  lui          t0, 415367
                  sltiu        s3, s1, -389
                  fmul.s       fa1, ft5, fs0
                  slli         a6, t0, 0
                  sltu         s6, a3, t1
                  fmin.s       ft11, fa1, fs4
                  fsub.s       ft11, fs5, fs10, rmm
                  fsub.s       fs9, fs3, ft1, rne
                  sltiu        s11, t1, 998
                  fcvt.s.w     fa5, t0, rne
                  xor          tp, ra, s0
                  fcvt.s.w     fs3, s1, rtz
                  or           a1, t5, s7
                  sltiu        a0, s7, 326
                  sltu         a2, s4, s0
                  fadd.s       fs2, ft2, fa4
                  fmv.x.w      s7, fs6
                  fadd.s       fs4, ft1, fa6
                  nop
                  ori          a4, t0, 2043
                  srli         s6, s11, 27
                  fcvt.wu.s    t2, ft8, rup
                  add          t0, s4, s5
                  sra          ra, a0, ra
                  or           t2, tp, s7
                  and          ra, t2, t4
                  fdiv.s       fa7, ft5, ft1, rne
                  div          t0, s1, s7
                  fsqrt.s      fs0, ft8, rmm
                  div          ra, t4, a4
                  fdiv.s       ft9, fa1, ft3, rne
                  fadd.s       ft2, fs6, fa4, rdn
                  fsgnj.s      fa6, fs9, ft11
                  fdiv.s       fs9, fs11, fs10
                  addi         gp, gp, 31
                  fcvt.w.s     s7, fs11, rmm
                  sll          a2, tp, a3
                  fsgnjx.s     fs3, fa5, fs7
                  fmv.x.w      s0, fs1
                  fmin.s       fs0, fs8, fs3
                  fcvt.s.w     ft8, a4
                  fcvt.s.wu    ft10, t1
                  sltu         a4, t0, s5
                  sltu         a1, t3, a1
                  fcvt.s.w     ft3, s6
                  flt.s        s2, fa5, fs4
                  fsgnjn.s     fa0, fs9, fa3
                  fcvt.s.wu    fs9, sp, rne
                  feq.s        gp, fa1, ft4
                  sltiu        s3, gp, 1872
                  feq.s        s0, ft0, ft11
                  slli         a3, t0, 22
                  lui          s11, 284878
                  fsqrt.s      ft7, fa5, rdn
                  fcvt.s.w     ft1, s10
                  lui          s8, 152790
                  andi         a6, tp, -2019
                  sll          s7, t3, s4
                  add          s2, zero, a6
                  or           s7, t6, zero
                  nop
                  sll          a3, t6, a6
                  mulhu        gp, t2, tp
                  lui          a0, 463187
                  flt.s        gp, fs0, fs3
                  fmul.s       ft6, fa5, fs1
                  fsqrt.s      ft6, fs3, rtz
                  auipc        a5, 390762
                  mulhsu       t6, s4, t1
                  slli         s1, sp, 9
                  sll          t4, s9, t3
                  ori          zero, t5, 1003
                  rem          s7, zero, t4
                  and          a2, t4, s0
                  fsgnjx.s     fa4, ft9, ft11
                  or           s7, t6, s2
                  divu         zero, s8, s8
                  sra          s6, s1, tp
                  srli         ra, s11, 27
                  mulhsu       s11, t5, s0
                  auipc        a5, 600425
                  fdiv.s       fa4, fs0, fs0
                  div          a4, s1, t2
                  fsgnjx.s     ft3, fa0, ft5
                  feq.s        s2, fa3, fa1
                  sltiu        s1, a5, 1331
                  sltu         t5, ra, s4
                  sll          a6, a0, s0
                  fclass.s     s1, ft9
                  fmin.s       ft4, ft10, fs4
                  srli         a1, t6, 28
                  fcvt.w.s     a2, ft11
                  fadd.s       fs7, ft0, ft4
                  fadd.s       ft11, fa4, fs4
                  mul          sp, t3, s8
                  fmv.w.x      ft2, t4
                  fsqrt.s      ft9, fs9, rdn
                  andi         s7, ra, -1465
                  divu         s10, t3, a3
                  sub          s5, t2, a2
                  fsub.s       ft7, fs6, fs6
                  sltu         s4, s0, a4
                  fcvt.s.w     fs8, s3, rup
                  fle.s        a3, fs0, fs9
                  fcvt.s.wu    ft0, s5
                  mul          t4, a7, a5
                  srl          tp, t1, sp
                  fsqrt.s      fs7, fa5
                  slli         t5, s9, 5
                  srai         gp, s6, 12
                  div          s3, t1, a5
                  slti         t0, s1, 1259
                  fdiv.s       ft8, fa3, fs7
                  fle.s        s2, fs1, fs3
                  srli         s4, sp, 4
                  divu         ra, s1, s0
                  fclass.s     t6, fa0
                  sub          s3, s1, sp
                  divu         a2, a7, t0
                  fsgnj.s      ft7, ft0, fs11
                  fmv.x.w      t4, fs6
                  mul          a6, s5, s10
                  mulhu        ra, a4, ra
                  fdiv.s       ft6, fs2, fs6, rdn
                  fsgnjn.s     ft3, ft5, fs6
                  fsgnjn.s     fs6, fa5, ft2
                  andi         t0, s7, -371
                  addi         a0, ra, -1923
                  sub          s1, s1, t5
                  nop
                  fcvt.wu.s    a3, fs0, rup
                  mulh         a2, a5, tp
                  fmv.x.w      gp, fs9
                  sra          a7, s6, s2
                  mulh         s7, t4, tp
                  fcvt.s.wu    ft2, a3, rtz
                  fdiv.s       fa2, fs7, ft10
                  mulhu        gp, a0, a5
                  rem          s8, a2, tp
                  fadd.s       fa4, fa0, fs11, rmm
                  slt          gp, t2, a6
                  flt.s        s3, ft9, fs4
                  mulhsu       a4, a5, s7
                  sra          ra, s11, a0
                  andi         a1, t4, -1039
                  or           s1, sp, s9
                  sub          a0, t0, t0
                  add          t5, s6, t6
                  and          t5, t1, t1
                  or           a3, s2, t3
                  fsub.s       ft2, fs8, ft5
                  ori          s11, t3, -1698
                  fmax.s       fs0, ft1, fs1
                  feq.s        t6, ft8, fs1
                  add          tp, a1, sp
                  flt.s        s11, ft6, ft0
                  addi         t6, s5, 473
                  addi         t6, a7, 477
                  fsub.s       fa6, fs0, fa7, rup
                  slti         s5, s5, 1274
                  fdiv.s       ft7, ft8, ft4
                  fmv.x.w      s11, fs3
                  and          a6, s1, t3
                  xori         a0, gp, 1078
                  mulh         t6, s1, zero
                  slt          a1, t1, s4
                  feq.s        ra, fs9, fs1
                  andi         ra, a6, -1951
                  mulhsu       s1, ra, a4
                  fle.s        t6, fa1, ft5
                  fmul.s       fa0, fs9, ft10
                  mul          a0, a7, gp
                  sltiu        t6, a0, 1913
                  mul          t2, t0, s9
                  fsgnjx.s     ft7, ft9, fa3
                  sltiu        s10, s6, 522
                  fmax.s       ft10, fa7, fa3
                  divu         a4, s8, a1
                  remu         a7, s10, s7
                  slti         a1, t1, 1117
                  fmv.w.x      fs8, s3
                  andi         a6, t5, -556
                  feq.s        a0, fa3, ft4
                  flt.s        s6, ft9, fa6
                  slli         sp, a6, 9
                  fcvt.wu.s    t6, fs3
                  fsgnjx.s     fs6, fa5, fa4
                  fmin.s       ft6, fa4, fs8
                  mulhu        gp, a3, s1
                  srl          s10, t2, s6
                  mul          tp, s9, ra
                  srai         s4, t5, 0
                  mul          ra, s8, a5
                  sra          a5, s6, a3
                  fmv.x.w      ra, ft6
                  fmax.s       fs10, fs5, fs4
                  srai         s11, a1, 23
                  fmv.x.w      s2, ft0
                  slt          s1, s4, a3
                  fdiv.s       fa6, fs3, ft0
                  slli         t0, a2, 0
                  divu         t0, sp, a6
                  srl          zero, a3, ra
                  feq.s        ra, fs6, fa0
                  srai         t6, s0, 6
                  andi         s0, ra, -595
                  feq.s        s0, fs8, ft6
                  lui          gp, 567871
                  fcvt.wu.s    s0, ft2
                  remu         t6, zero, a2
                  fadd.s       fa2, fa3, ft8
                  fmin.s       ft4, fs0, ft4
                  fcvt.s.wu    ft9, t0
                  remu         ra, tp, a3
                  sltu         s7, a7, a4
                  fclass.s     s7, ft8
                  fsgnjn.s     ft9, ft8, fs1
                  ori          sp, a5, 332
                  add          t6, s1, s4
                  slli         a0, s5, 24
                  fsgnjx.s     fa5, ft5, ft11
                  feq.s        a3, fs6, fa6
                  fcvt.s.w     ft2, s9, rdn
                  div          s4, a4, ra
                  fcvt.w.s     s10, fs9
                  fcvt.s.wu    fa5, s3
                  slli         s8, tp, 25
                  fsqrt.s      fs2, fa2
                  xor          s11, t1, tp
                  rem          s7, s11, s2
                  srl          a1, a6, t4
                  addi         a3, s9, -940
                  rem          a5, gp, sp
                  addi         s1, s2, -1873
                  or           a1, a6, a0
                  fsgnjx.s     fs5, fs11, ft0
                  and          s4, s4, s8
                  fmul.s       ft5, fa7, fa5
                  sub          s1, gp, t3
                  sll          s4, a4, a6
                  srai         s11, a3, 29
                  srl          a0, a7, s10
                  slti         sp, s10, -1778
                  fcvt.w.s     t5, ft7, rmm
                  remu         gp, t0, s2
                  fclass.s     s8, ft11
                  fmax.s       fs5, fa2, fs2
                  divu         s2, t3, t2
                  srai         s2, s1, 30
                  fcvt.s.wu    fa7, a7
                  sltiu        t5, a3, -1191
                  fcvt.w.s     sp, fs8
                  flt.s        a5, ft0, ft0
                  fadd.s       fa3, ft2, fa5, rup
                  xori         a6, gp, -1810
                  slt          s11, s6, s3
                  slt          a5, a0, t0
                  mulhu        t2, ra, gp
                  fcvt.s.w     fa0, a0
                  fsgnj.s      ft2, ft1, ft2
                  add          s3, s7, tp
                  slli         tp, sp, 23
                  fsub.s       fs9, fs9, ft6
                  add          a0, gp, a6
                  nop
                  or           tp, a2, s8
                  xori         a7, s7, 299
                  fmax.s       ft9, fs0, ft4
                  nop
                  remu         a3, s8, t4
                  add          t5, s9, a5
                  sub          s11, a2, a3
                  lui          s0, 809866
                  fmin.s       ft9, ft8, fa2
                  sra          s3, s11, a6
                  slli         s6, s2, 12
                  mulh         a3, a2, s11
                  fclass.s     s0, fa5
                  xor          s8, a0, t2
                  fcvt.s.w     ft11, a4, rup
                  fsgnjn.s     fs8, fa5, ft6
                  addi         s6, t3, 1817
                  fmin.s       fs0, fs9, fs3
                  fadd.s       ft8, ft1, ft2, rdn
                  fcvt.s.w     ft9, a2
                  srl          a0, t5, s0
                  or           zero, a5, s10
                  addi         a4, t2, -267
                  andi         ra, s10, 550
                  sll          s7, a5, s1
                  slli         sp, zero, 16
                  fsgnj.s      fs8, fa3, fs0
                  srai         s5, s2, 20
                  sltu         a3, a2, a7
                  remu         zero, t4, a4
                  srl          s4, s11, a6
                  fcvt.s.w     fs3, t0, rup
                  ori          s1, t0, 398
                  fcvt.s.wu    ft4, t2
                  sub          a4, gp, t2
                  andi         s10, a1, 1755
                  ori          a1, t4, 1684
                  lui          a4, 308639
                  fsqrt.s      ft6, fa3, rdn
                  fsgnjx.s     fs5, fa7, fs11
                  fmul.s       fs8, fa5, ft10, rmm
                  divu         s1, t2, t0
                  fmul.s       ft4, ft9, ft0
                  slti         s5, t0, -186
                  fle.s        ra, ft5, fs1
                  xor          a7, s1, s3
                  sll          t5, s9, a7
                  fmin.s       fs1, fa1, ft11
                  or           s0, s9, a6
                  srl          t6, tp, s7
                  fsub.s       fs8, ft10, ft3, rmm
                  fmv.w.x      fa7, s4
                  fdiv.s       ft10, fa4, fs5
                  and          s0, s7, s1
                  feq.s        a5, fs5, fa6
                  andi         a0, a2, -117
                  fadd.s       fa1, fs2, ft7, rdn
                  fsgnjn.s     fs7, ft0, fa5
                  lui          s5, 806348
                  fclass.s     a3, fs8
                  feq.s        a2, fs7, fs7
                  fdiv.s       fs3, ft4, ft8
                  fadd.s       fs5, fs0, ft10
                  fsgnj.s      fa2, ft11, fs3
                  lui          a3, 964421
                  fsgnjn.s     fa7, ft5, ft7
                  addi         t0, s5, 995
                  sra          s1, t3, s8
                  fmul.s       fa7, ft9, ft1, rne
                  sll          gp, s8, a0
                  nop
                  ori          s3, s2, 2045
                  fsgnj.s      fs10, fs1, ft11
                  fsgnjx.s     fs8, fs11, ft9
                  flt.s        tp, fs7, fa4
                  sub          tp, t1, t5
                  auipc        s1, 531396
                  sll          t6, s3, t6
                  fdiv.s       ft4, fs11, fs4
                  fcvt.s.wu    ft8, t4, rmm
                  slt          s1, a5, s2
                  fcvt.s.wu    fa1, a5
                  fsgnjx.s     ft0, ft8, fs0
                  sll          tp, s5, s11
                  addi         zero, s6, 647
                  fcvt.w.s     s4, ft4, rtz
                  fmv.w.x      ft5, t1
                  or           s2, a0, s9
                  lui          s5, 768845
                  fcvt.s.w     ft5, s6
                  add          t2, s10, s0
                  lui          ra, 477437
                  fsqrt.s      ft4, ft6
                  fmv.x.w      a3, fs8
                  auipc        a4, 352120
                  fadd.s       fa7, fs11, fs1
                  mul          t0, s10, a4
                  sll          s7, s0, t1
                  fdiv.s       fs8, fa2, ft2
                  fsgnjx.s     ft3, fs10, fs8
                  flt.s        s3, fs7, fs2
                  xori         t2, s5, 1461
                  fle.s        ra, fa2, fs1
                  addi         gp, t0, -334
                  sub          a5, s11, t2
                  rem          t5, a0, tp
                  fcvt.wu.s    zero, ft2
                  mulh         a3, a6, t6
                  sltiu        t0, t0, -142
                  or           a7, s4, a3
                  lui          a6, 184775
                  sra          s2, s0, t5
                  feq.s        gp, ft11, fa2
                  slli         t4, a2, 20
                  mul          a1, a5, ra
                  fmv.w.x      ft11, s8
                  mulh         a7, tp, gp
                  srl          s0, s10, s6
                  slt          a7, t6, a6
                  and          a3, gp, s5
                  fsgnjn.s     fa5, ft1, ft0
                  mulhsu       a4, t3, t5
                  sltu         a5, s11, a7
                  and          s8, s3, s9
                  mulh         a7, s0, a4
                  sltu         sp, sp, a0
                  fmin.s       fs10, fs1, ft0
                  nop
                  slt          a4, a3, ra
                  feq.s        s5, fs0, fa5
                  fsub.s       ft10, fs0, fa0, rdn
                  and          a1, a1, a7
                  slt          tp, s11, s10
                  fmul.s       fs1, fa4, fa5, rne
                  fadd.s       fs9, fa5, fs3, rtz
                  fsub.s       fs3, ft8, fs7, rdn
                  fmin.s       fa5, fs9, fs0
                  xori         a4, a0, -1764
                  divu         s11, t1, t5
                  sub          sp, t6, t4
                  fsub.s       fs7, fs11, ft5, rne
                  fsub.s       fs6, fs8, ft5, rtz
                  fsgnj.s      fa4, fs11, fs4
                  fsub.s       fs11, ft7, fs8, rmm
                  auipc        a7, 36740
                  sra          a6, s3, zero
                  fmv.w.x      fa7, t6
                  fcvt.s.w     fa6, t2
                  sltiu        s2, t6, -1871
                  nop
                  xor          a7, tp, t6
                  fsgnjn.s     ft6, ft1, ft6
                  mulhu        a1, zero, a2
                  sltiu        t0, s11, -1683
                  fmin.s       ft4, fs0, ft11
                  rem          a1, a1, s9
                  sltiu        sp, a2, -426
                  div          a1, s2, sp
                  srli         a2, t4, 12
                  sltiu        zero, a3, -684
                  fle.s        a0, fs0, ft10
                  fcvt.s.w     fa7, sp, rup
                  rem          t2, s0, t3
                  sll          a2, t3, zero
                  xori         s7, s4, 107
                  fmin.s       fa3, ft3, ft10
                  andi         s6, s1, 819
                  fle.s        s4, fa2, fa3
                  sll          a0, t6, s0
                  div          t2, ra, t0
                  fcvt.wu.s    s7, fa1, rmm
                  xor          a4, s10, s6
                  fcvt.s.wu    ft1, t2
                  slli         s11, a5, 25
                  nop
                  fsgnjn.s     fa1, fa4, ft9
                  div          t0, s8, t5
                  fdiv.s       fs4, fs2, fa2, rtz
                  and          s1, a4, t4
                  mulhu        t4, s11, ra
                  and          s5, a6, a0
                  ori          ra, a7, 1530
                  sll          t2, a2, ra
                  nop
                  fadd.s       fa1, ft8, ft11, rne
                  fcvt.s.wu    ft2, t4
                  fmin.s       fs10, fa2, fa6
                  lui          s10, 371383
                  fmin.s       ft1, fa2, fs6
                  nop
                  feq.s        t6, fs2, fs1
                  fmv.x.w      s3, fa4
                  auipc        a6, 851957
                  srai         sp, a1, 30
                  fcvt.s.wu    fa6, t2
                  srl          s1, t5, s4
                  sub          s4, a3, s5
                  fsgnj.s      fs9, fa2, fa7
                  fmax.s       ft10, ft1, fa3
                  mulh         ra, s1, a2
                  fmul.s       ft2, ft7, fs1
                  srai         s4, s3, 13
                  fmul.s       fs2, ft6, ft11, rmm
                  add          a4, t1, t4
                  xor          gp, t1, t0
                  sltu         s3, s3, s9
                  fcvt.wu.s    s5, ft4
                  srl          s0, s6, gp
                  sub          a5, s0, s10
                  remu         a5, t5, s6
                  ori          s0, s8, -515
                  fmv.w.x      fs11, t5
                  auipc        s7, 644582
                  fdiv.s       ft7, fs10, fs9
                  rem          sp, s11, t3
                  slt          a2, a5, a1
                  mulhsu       s7, ra, a0
                  fsgnjx.s     fs7, ft7, fa4
                  add          gp, t6, a1
                  ori          a2, a4, 713
                  srl          ra, sp, s8
                  fsgnj.s      ft11, fa4, fs7
                  fcvt.s.wu    fa2, a5
                  fcvt.s.w     fa4, s6, rne
                  fsqrt.s      fa4, ft7, rne
                  srl          s7, a7, t2
                  nop
                  sra          zero, s8, s2
                  mulhu        s10, gp, s5
                  fmv.x.w      s1, fs4
                  fsqrt.s      ft11, fs0, rmm
                  sll          s2, a6, ra
                  srl          sp, a7, s9
                  ori          t5, a1, -1209
                  flt.s        a6, ft3, fs7
                  slt          s0, t3, s0
                  fmul.s       fa7, ft1, ft10
                  addi         gp, s2, 1873
                  fmax.s       fa7, fs5, fa4
                  sra          a5, a3, s10
                  srli         s7, a1, 28
                  mulhu        s3, s5, s6
                  flt.s        s1, ft11, fa2
                  sub          gp, s10, t1
                  rem          s6, t0, gp
                  fdiv.s       fs11, fs7, fs11, rdn
                  slti         s3, a1, 1406
                  sltu         sp, s10, t4
                  fsgnj.s      ft0, fs5, ft8
                  sll          tp, t1, s1
                  fsgnj.s      fs5, ft7, ft3
                  srai         s1, s5, 31
                  flt.s        s3, fa5, fs3
                  fcvt.s.wu    fs10, s9
                  fmv.x.w      t6, fs9
                  auipc        ra, 644581
                  slli         s1, s11, 14
                  fmax.s       fa6, fs6, ft6
                  fcvt.s.w     fa1, s8, rtz
                  mul          t6, a4, a0
                  mulhsu       s7, t6, t4
                  and          a4, t4, s9
                  ori          a3, a5, -128
                  fsgnjn.s     fa0, ft4, fa6
                  and          s8, t3, a4
                  mul          s5, s6, t5
                  fclass.s     a6, fs0
                  addi         a0, a6, -1060
                  add          s4, t2, a1
                  andi         s7, a3, -1260
                  fsqrt.s      fs1, fs7, rne
                  fsgnjn.s     fa5, ft1, fs8
                  fmul.s       fa6, ft11, fs1
                  addi         t6, zero, -1011
                  fsub.s       fa3, fs8, ft11
                  lui          a7, 38030
                  fcvt.s.wu    fs4, s6, rmm
                  fmin.s       fa5, fs5, fs9
                  mulhu        s2, s2, t1
                  fle.s        t5, ft11, fs5
                  slti         t0, ra, -2006
                  and          t6, s9, s10
                  mulh         s7, s11, a6
                  remu         tp, s10, s2
                  nop
                  sltiu        s11, a5, -1056
                  or           s11, t4, s3
                  mulh         a4, a7, t0
                  fmul.s       fa3, fs3, ft5, rdn
                  ori          a0, s5, -1276
                  sltu         a2, a3, s3
                  flt.s        sp, fa2, fa7
                  mul          t5, s7, s4
                  add          zero, a2, s11
                  fmax.s       fa7, ft11, ft9
                  divu         zero, a6, s6
                  mul          a7, tp, zero
                  add          zero, s2, tp
                  fcvt.s.w     fs1, a5, rdn
                  divu         a6, zero, a1
                  feq.s        ra, fa1, ft9
                  slli         a0, tp, 29
                  add          s4, a4, a2
                  srli         s11, a6, 27
                  fsgnjn.s     fs10, fs9, fa6
                  fcvt.s.wu    fa0, ra, rup
                  fsgnjx.s     fs9, fs11, ft0
                  slti         s6, sp, 143
                  fdiv.s       fs9, fa2, ft5, rne
                  fmv.w.x      ft9, a3
                  fcvt.wu.s    gp, fs4, rtz
                  xori         t6, a3, -2008
                  mul          s11, gp, s10
                  andi         a1, ra, -1968
                  fmin.s       fa5, ft5, fs9
                  fadd.s       ft10, ft2, fa1, rup
                  slt          a1, tp, t0
                  slti         a6, s8, -143
                  fsgnjn.s     fs6, fa7, fs0
                  fcvt.s.w     fs2, s7
                  slt          s10, gp, s10
                  sub          a7, t6, t2
                  sll          s2, a2, tp
                  fle.s        a3, fs6, fs10
                  lui          sp, 678418
                  flt.s        t2, fs9, fs2
                  mul          a0, s11, tp
                  div          s7, s6, sp
                  fle.s        s4, ft6, fs1
                  sll          t0, ra, ra
                  rem          a4, t5, a2
                  rem          gp, t1, s9
                  fcvt.s.wu    fa0, s7
                  mulhu        a5, sp, a7
                  fadd.s       fa2, ft5, ft1
                  mul          s2, a0, s1
                  sub          a7, a3, t3
                  srl          s1, s10, t1
                  fadd.s       fs3, fs2, fs11
                  ori          s8, t5, 86
                  fsgnjn.s     ft1, fa3, ft4
                  fle.s        s7, fs4, fs9
                  fcvt.wu.s    a7, ft5, rup
                  mulh         s1, s10, a7
                  sll          a5, a3, s11
                  addi         s4, t4, -1898
                  slti         a5, a7, 521
                  sra          s8, sp, a6
                  fsqrt.s      fs10, ft4
                  fsqrt.s      fa4, fs6
                  srai         gp, a7, 23
                  fmv.x.w      t5, fs0
                  auipc        a0, 22913
                  ori          t0, s4, 1189
                  fsgnjn.s     fa2, fs9, fa1
                  mulhsu       s8, ra, s0
                  auipc        t5, 497825
                  fadd.s       fa2, ft6, fs9
                  fdiv.s       fa0, fs4, ft8
                  xori         s4, t5, -1468
                  add          s0, s10, s1
                  lui          t0, 875948
                  remu         s0, s8, t2
                  feq.s        s11, ft4, fa0
                  fdiv.s       fa1, ft10, ft4
                  remu         a2, s8, a1
                  feq.s        t0, fa2, fs3
                  rem          tp, a3, a1
                  fadd.s       fa4, fs4, ft10, rne
                  xori         zero, a5, 1698
                  fmin.s       fa6, fs6, fs6
                  slt          a1, t5, s6
                  sltu         s8, t0, s2
                  andi         s8, a4, -633
                  xori         a6, s2, -634
                  or           tp, a5, t4
                  add          sp, a5, s9
                  andi         ra, s5, -1262
                  remu         s4, zero, a1
                  or           ra, zero, a5
                  fcvt.w.s     a5, fa0, rne
                  feq.s        a7, ft3, fs3
                  lui          a1, 771850
                  xor          s8, t2, a3
                  sll          s5, s0, t4
                  fcvt.s.wu    ft1, s10, rtz
                  sll          a7, a3, t4
                  slt          a4, sp, a0
                  fmul.s       ft9, fs10, ft3
                  sll          s3, a0, a6
                  sltiu        s1, s6, -1661
                  srl          a5, t5, t6
                  fmax.s       fa1, fs6, fs11
                  sub          sp, zero, s4
                  nop
                  fmul.s       fs7, fa0, fs10, rtz
                  sltu         ra, t2, t4
                  feq.s        zero, ft6, fs7
                  fle.s        tp, fs11, fs8
                  remu         s1, sp, a5
                  add          t6, s5, t4
                  fle.s        s11, ft9, fa1
                  fcvt.w.s     a7, fa0, rmm
                  fsgnjx.s     ft5, fs9, fa5
                  fcvt.s.w     ft3, sp
                  sltu         s11, s8, s2
                  mulhu        t6, t2, s11
                  div          s3, s4, s3
                  feq.s        t2, ft1, ft3
                  sra          s7, a1, a6
                  srl          t4, s0, s2
                  or           gp, s4, a4
                  srl          a7, t0, a1
                  mulhu        a1, t3, t1
                  divu         a1, a7, a7
                  fsgnjn.s     fs7, fa7, ft3
                  sub          a1, t3, s7
                  or           s6, t4, a4
                  fsqrt.s      fs2, ft4, rne
                  mulhu        a4, s2, a5
                  mulhsu       a1, ra, a5
                  fmv.w.x      fs7, a4
                  srai         t5, s1, 16
                  fmul.s       fa1, ft2, fa0
                  sub          ra, s11, a6
                  sltu         s8, ra, t5
                  nop
                  fdiv.s       fs9, ft5, ft1
                  sltu         t6, s8, s0
                  fsub.s       ft7, fs8, fs2, rtz
                  remu         a0, t5, s3
                  rem          a3, t3, s11
                  feq.s        sp, ft10, ft2
                  slli         s2, s0, 15
                  fmv.x.w      t5, ft0
                  fmul.s       ft7, fs8, fa6, rne
                  slti         s4, a0, -419
                  add          a4, s3, s5
                  feq.s        t0, fs5, fs8
                  fsqrt.s      ft9, ft4, rne
                  slti         s3, s0, 797
                  fsub.s       ft10, fs5, fa2
                  fsqrt.s      fa7, ft5
                  fmv.x.w      tp, fa1
                  fadd.s       ft5, fa0, ft1, rup
                  fmin.s       fa0, ft0, ft4
                  mulhu        a4, s3, tp
                  add          s1, t4, gp
                  fsub.s       ft8, fs6, fa7
                  slli         tp, a0, 23
                  slti         tp, a2, 1439
                  sll          s5, s2, t4
                  fcvt.s.w     ft3, s3
                  sra          t0, a0, t0
                  andi         a5, a0, -1024
                  fsqrt.s      ft10, ft0, rdn
                  fmax.s       fa0, fs11, fa5
                  sltu         a3, s0, zero
                  xori         ra, t1, 873
                  fclass.s     a1, ft1
                  xori         a5, a2, 716
                  xor          t2, t3, s5
                  fsqrt.s      fa0, fa6, rdn
                  ori          s8, t0, 1155
                  addi         ra, a1, 74
                  mul          s1, a1, zero
                  slt          t6, a7, a0
                  fsgnjx.s     ft4, ft10, ft4
                  auipc        a6, 107538
                  srli         t4, s6, 12
                  fmin.s       fs11, ft8, fa5
                  fcvt.s.w     fs9, s0
                  andi         s8, a1, -562
                  nop
                  xori         a0, t1, 1396
                  srai         t5, s9, 28
                  div          s10, a2, s11
                  slt          s4, sp, t5
                  srl          a7, s0, t3
                  fmv.w.x      fa4, ra
                  fcvt.s.w     fs1, t4, rtz
                  fclass.s     ra, fs3
                  xor          s1, t0, t4
                  and          t2, a7, s6
                  sra          zero, t2, s7
                  mul          t2, t4, t3
                  fsgnjn.s     fs7, fs1, ft5
                  andi         gp, s1, -272
                  fcvt.wu.s    a1, fs3
                  slli         sp, t5, 22
                  fsgnjn.s     fs4, fs9, fa4
                  nop
                  sra          sp, s11, a7
                  addi         t4, a4, -1005
                  or           s4, s7, a3
                  remu         a5, s10, a5
                  fdiv.s       fs0, fs9, ft10
                  fsgnjn.s     fs4, fs5, ft10
                  andi         s6, t0, 102
                  fsqrt.s      fa3, fs11
                  add          a3, s9, s10
                  slli         a5, t3, 1
                  slt          a5, s2, a4
                  xor          s11, t0, a1
                  fcvt.wu.s    t4, fs9
                  fsub.s       ft4, ft10, fs8
                  fclass.s     a0, fs2
                  srai         gp, s10, 20
                  divu         sp, t1, t4
                  fsqrt.s      fs5, ft11
                  nop
                  fmax.s       fa1, ft9, fs10
                  sub          s11, s2, s7
                  andi         s4, s7, 482
                  fclass.s     s6, ft3
                  fmax.s       fs9, ft8, fa7
                  fle.s        s7, fs11, fa1
                  fdiv.s       ft2, fs7, ft10, rne
                  and          a4, t5, ra
                  auipc        zero, 134871
                  feq.s        a5, fs7, fs10
                  srli         a2, s10, 13
                  mulhu        t2, t6, a2
                  fcvt.s.w     fa0, ra, rmm
                  mul          a7, a2, a4
                  add          a4, t2, tp
                  mulhsu       gp, sp, s3
                  divu         s11, a6, a3
                  fsgnjn.s     ft4, ft8, fs2
                  fadd.s       fa4, fs5, ft2
                  fmul.s       fs3, fa6, ft3
                  fclass.s     tp, ft4
                  mulhu        s1, s2, s3
                  and          t4, t3, a3
                  fmax.s       ft11, fs7, ft10
                  feq.s        s8, fa3, fs9
                  fsgnj.s      ft11, ft11, fa2
                  fmax.s       fs2, fa4, ft11
                  srl          t5, s2, s8
                  auipc        s5, 460058
                  div          t2, s6, s2
                  fsub.s       ft1, fa0, fa0
                  rem          a1, gp, a1
                  fmin.s       fa0, ft8, fs3
                  xor          t0, a1, a0
                  flt.s        s10, fs10, ft9
                  fcvt.s.wu    ft10, t2, rtz
                  sub          s5, sp, a1
                  fsub.s       fa5, fs1, fs9, rdn
                  xor          s2, t3, sp
                  sltu         s0, t3, a3
                  sra          a1, a0, t6
                  mulhsu       gp, t0, s8
                  mulhu        t6, s0, t6
                  and          s5, s6, s2
                  fsgnjx.s     fs5, fs4, ft11
                  auipc        s1, 312713
                  fmin.s       fs5, ft10, fa2
                  slli         s7, s10, 3
                  srli         gp, s4, 22
                  fsgnjx.s     ft9, fs9, ft10
                  sub          s6, a3, a0
                  srli         s4, s6, 14
                  srai         s5, s5, 20
                  fsgnjn.s     fa4, fs5, fs10
                  slt          s2, s4, t4
                  rem          a1, a2, s6
                  or           s0, t5, t4
                  fmul.s       fa6, ft1, fs9
                  srli         tp, a4, 15
                  sra          a3, t3, a0
                  mulhsu       a3, t3, s6
                  fmin.s       fs0, fs11, ft6
                  slt          a2, a6, t4
                  fmv.x.w      a5, ft7
                  sll          s5, a6, s9
                  fmax.s       fs2, fa7, fs6
                  fdiv.s       fa6, fs8, ft7, rdn
                  andi         s2, a1, -873
                  div          s0, s0, s5
                  fmv.w.x      fa3, a3
                  or           ra, gp, t4
                  flt.s        a3, ft3, fs9
                  mulh         s11, zero, ra
                  xor          a7, gp, a1
                  fsub.s       ft6, fs10, fa5, rdn
                  xor          t6, s2, t6
                  fcvt.wu.s    t6, fa1, rtz
                  feq.s        s11, fa7, ft5
                  fsgnjn.s     fa6, ft7, fs4
                  mulh         sp, zero, gp
                  srai         s10, gp, 10
                  srli         a7, s4, 13
                  auipc        s7, 438141
                  srl          a7, a0, a6
                  fsgnjx.s     ft0, fa2, fs0
                  fle.s        ra, fs3, fa1
                  addi         gp, a7, 231
                  add          t4, t2, s7
                  fcvt.s.w     ft8, gp, rmm
                  fsub.s       fs3, fs1, fs0, rtz
                  or           gp, a1, s11
                  srai         a1, a5, 3
                  srl          a2, s1, t4
                  add          t6, s3, a2
                  fcvt.w.s     s3, fa3
                  addi         gp, a6, 1145
                  andi         t5, t1, 975
                  nop
                  fcvt.w.s     a3, fs5, rtz
                  fmul.s       fs4, fa4, fs9
                  flt.s        t5, fa2, fs0
                  sub          a7, s4, a2
                  andi         t2, s7, 1567
                  fcvt.w.s     a3, ft5
                  flt.s        s10, ft6, fa7
                  mulhu        a3, a2, s0
                  slti         a6, a5, -728
                  add          s7, t0, a0
                  addi         s0, a4, -1765
                  fle.s        ra, fa4, ft10
                  ori          s5, t0, 247
                  nop
                  mulhu        t5, s4, s7
                  xor          a3, t6, a2
                  slti         a4, t3, 194
                  srl          s8, sp, t5
                  ori          s5, t4, 109
                  fadd.s       fs5, ft0, fs6, rdn
                  mulh         a2, a6, ra
                  and          gp, a3, t3
                  sll          s1, s6, a2
                  or           a1, s10, a2
                  feq.s        t6, fa7, ft0
                  auipc        s1, 683294
                  fcvt.s.w     ft4, t0
                  fmv.x.w      gp, fs10
                  flt.s        s10, fa7, fs7
                  ori          tp, s2, 1781
                  and          sp, a7, s9
                  feq.s        gp, ft0, fs4
                  slti         a5, t1, 1107
                  slli         t6, t5, 17
                  add          a7, a6, sp
                  slt          a7, s7, s11
                  lui          t0, 1005505
                  and          s8, s7, s5
                  fmul.s       fs9, ft8, fa0, rup
                  fmv.w.x      fs10, t1
                  fcvt.s.wu    fa2, t6
                  fmv.x.w      s11, ft2
                  fmax.s       ft10, fa6, fa4
                  sltu         s2, a4, a6
                  lui          zero, 191310
                  rem          a7, sp, s0
                  fmax.s       ft10, ft6, ft0
                  fmul.s       fa1, fa0, fs10
                  ori          s8, zero, 1593
                  mul          s7, t0, s1
                  mulhsu       t0, a0, a1
                  mulhsu       zero, s4, a1
                  fclass.s     s4, fs0
                  fclass.s     s3, ft0
                  div          t6, a1, t4
                  fcvt.wu.s    s4, ft0, rup
                  fsgnj.s      ft10, fa2, fs9
                  fcvt.w.s     t5, fs0, rne
                  srl          a3, a0, t5
                  mul          s4, s0, s9
                  sltiu        sp, s2, 586
                  mulhsu       a1, a1, a3
                  fclass.s     s1, ft1
                  sub          a1, t3, a0
                  auipc        ra, 680524
                  srli         s3, s5, 26
                  fsqrt.s      ft1, fs1, rne
                  sll          s3, s9, s1
                  fsub.s       ft1, fs0, fs11
                  lui          gp, 965844
                  slt          a7, t4, a3
                  or           s0, s11, t6
                  fsqrt.s      fs4, fa0
                  div          gp, s2, s10
                  sltiu        s4, a5, 487
                  slti         s3, s0, -759
                  sltu         t2, t4, s0
                  mul          tp, tp, s3
                  mulhsu       t5, t2, ra
                  addi         ra, t5, -1028
                  lui          t5, 817680
                  rem          t5, t5, a4
                  slti         a3, s9, -38
                  and          t2, s7, a3
                  fmul.s       ft1, ft7, fs3
                  sltu         a7, s10, t1
                  fclass.s     t5, ft7
                  fsqrt.s      fs1, fs2
                  srai         s6, t4, 31
                  fadd.s       ft6, fs7, fs6
                  srl          a3, t5, a7
                  mulhu        s6, t6, a5
                  fle.s        tp, fs11, fs11
                  fcvt.s.wu    fa6, a6
                  fcvt.s.wu    ft1, a6, rup
                  rem          ra, t4, s4
                  addi         a3, a5, 1246
                  fmul.s       fs10, fs7, fa6
                  slti         a2, tp, -1500
                  sub          s8, t3, s0
                  fsgnj.s      fs7, fa7, fs10
                  fsgnjx.s     ft2, ft5, fa3
                  sra          tp, ra, s10
                  flt.s        ra, ft11, ft4
                  mulhu        s11, gp, s9
                  fmax.s       ft5, fa6, ft6
                  sub          s0, s0, a6
                  srli         s7, t6, 19
                  remu         s4, s4, t2
                  fclass.s     s11, ft3
                  srli         s2, a1, 22
                  fsgnj.s      fs3, ft5, fs4
                  addi         s8, s3, -323
                  mulh         t6, gp, a5
                  ori          s10, t1, -201
                  rem          ra, s11, s6
                  flt.s        zero, fs5, fa3
                  lui          s0, 76274
                  flt.s        a4, fs3, fs3
                  nop
                  fcvt.s.w     fs10, t0, rup
                  nop
                  fsgnjn.s     fs4, ft1, fs5
                  srl          s8, a2, s7
                  fdiv.s       fa2, fa2, ft0
                  srl          s1, a1, a6
                  fmul.s       fa1, fs6, ft10, rup
                  fmv.w.x      fa5, s0
                  sll          s3, zero, a2
                  and          t0, a3, t1
                  remu         zero, s5, s9
                  fcvt.wu.s    s10, fa2, rtz
                  fmin.s       fs0, fs3, ft11
                  xori         s3, zero, 894
                  and          gp, t2, s6
                  slt          s10, s11, s10
                  fmv.w.x      fa2, s0
                  srl          t0, ra, ra
                  feq.s        s6, ft11, fa2
                  fsgnj.s      ft10, fa5, fs10
                  div          s2, a7, a7
                  fle.s        a5, fa1, fa0
                  add          t0, s9, t6
                  xori         s5, s6, 1067
                  fcvt.s.wu    fs0, s8
                  fcvt.s.w     fa4, s10, rne
                  fcvt.w.s     t2, fs4, rup
                  divu         sp, zero, s10
                  feq.s        s6, ft11, ft6
                  fsub.s       fa4, fa0, fa3, rup
                  fsgnjx.s     ft7, fs3, fa7
                  slli         s5, s8, 9
                  xori         a3, a4, 1155
                  fsqrt.s      fs6, ft3
                  sltiu        s8, a3, 1254
                  sll          a5, s6, t3
                  remu         a0, s4, a6
                  fdiv.s       fs10, ft10, fs7, rmm
                  srl          s5, s9, t3
                  mul          s6, t1, a7
                  fcvt.s.w     fs2, s8, rup
                  ori          s6, t6, 186
                  fmv.w.x      fa2, t4
                  lui          s6, 544687
                  sll          s5, tp, s9
                  fdiv.s       fs3, fs11, fs9
                  xor          s6, a0, ra
                  slt          a2, s8, a4
                  srai         t5, sp, 24
                  rem          a2, t4, s2
                  lui          a1, 53018
                  rem          t6, t1, a3
                  xor          zero, s10, s7
                  slti         t4, tp, 152
                  sra          ra, t6, a3
                  fcvt.s.wu    fs2, t4
                  fmv.w.x      fs9, s10
                  add          sp, s6, a3
                  sll          a2, s6, ra
                  andi         s11, t1, 2014
                  srl          s10, s6, t1
                  ori          a6, s0, 1998
                  srl          s7, a6, sp
                  slti         sp, t4, -1148
                  ori          t5, s4, -735
                  fle.s        sp, fs6, fs7
                  remu         s1, s6, t1
                  slti         t5, s3, 379
                  add          t6, s9, t6
                  fcvt.w.s     a7, ft7, rup
                  flt.s        s5, fa3, fs7
                  fmul.s       fa7, fs4, fs9, rne
                  xori         a5, s1, 551
                  slti         t2, s10, 898
                  rem          s2, s0, s5
                  mul          s5, a7, a3
                  mulhsu       t0, sp, s10
                  slt          s7, s2, a2
                  srl          a4, s2, tp
                  xor          t5, s8, t3
                  fcvt.wu.s    a7, fs0, rdn
                  lui          a5, 111761
                  slti         zero, s1, -938
                  sub          a5, s2, s6
                  fcvt.wu.s    s6, ft9, rup
                  fdiv.s       fs0, fs7, ft6
                  fmin.s       fa3, ft8, fs3
                  fsgnjn.s     ft4, ft5, ft2
                  div          s3, t1, gp
                  fsgnjn.s     fa0, fa2, ft10
                  mulhu        s8, tp, t0
                  lui          a1, 711430
                  or           ra, s11, s9
                  xori         s11, tp, 179
                  add          gp, ra, s5
                  div          a3, sp, s7
                  fcvt.s.w     ft2, s7, rtz
                  sltu         t4, s0, t2
                  fadd.s       ft10, fa5, ft5, rtz
                  lui          s4, 322411
                  fcvt.s.w     fs3, zero
                  flt.s        t5, ft8, fs1
                  feq.s        a5, fs10, ft0
                  mulhsu       s7, a1, s10
                  andi         a2, t2, 322
                  srli         t5, zero, 24
                  fle.s        s4, fa4, ft3
                  and          t5, t5, t1
                  fdiv.s       ft7, fs5, fa5, rup
                  auipc        a5, 364881
                  sltiu        t0, ra, 1250
                  xori         s7, s8, -743
                  fclass.s     ra, fa2
                  slt          a3, gp, a1
                  div          a6, t0, s8
                  fle.s        s0, ft10, ft10
                  mulh         s8, s2, s9
                  fmin.s       ft0, ft3, fs11
                  fsgnj.s      ft5, fs1, ft5
                  fmv.w.x      ft2, s10
                  srai         s11, gp, 15
                  fle.s        a5, fa3, fs4
                  fcvt.s.w     fs1, t5, rdn
                  fle.s        a7, fs10, ft0
                  or           t6, t1, a6
                  nop
                  mul          s3, s11, t3
                  fmv.w.x      ft9, s2
                  fmv.w.x      ft11, s3
                  div          t6, s0, s8
                  mulhsu       t6, s0, a6
                  fsgnjn.s     fs9, fs9, fs3
                  flt.s        s1, fs1, ft4
                  mulh         gp, s0, s8
                  sra          s6, tp, s10
                  fcvt.w.s     s5, ft4
                  auipc        a3, 414198
                  mulh         t2, a5, s11
                  fcvt.s.w     ft3, s8, rup
                  div          s6, s5, t5
                  slt          a7, ra, s0
                  fmax.s       ft11, fs9, fs11
                  fmv.x.w      s7, ft2
                  fmv.w.x      fa5, s7
                  fclass.s     a1, fa4
                  sub          s11, zero, a2
                  and          a5, a4, a3
                  sll          a0, a3, a2
                  fmin.s       fa3, ft0, ft7
                  srai         a5, a6, 2
                  fcvt.wu.s    s0, ft3
                  fmul.s       fs3, ft5, ft3
                  nop
                  srl          a7, ra, a2
                  flt.s        t5, fs1, fa3
                  fsgnj.s      fa2, fs8, ft9
                  sltu         s1, t0, s10
                  ori          a0, a6, 437
                  slt          t5, a3, s3
                  div          s1, s7, s5
                  divu         t5, s5, s8
                  lui          t5, 656966
                  fsgnjn.s     fa0, fs3, fa7
                  slti         s1, tp, 1252
                  add          s2, t3, zero
                  divu         s11, a5, a1
                  sltiu        s1, s1, -831
                  sub          s11, s7, s10
                  addi         t6, s5, 761
                  feq.s        s7, ft11, ft7
                  or           a3, s1, gp
                  srai         s7, s9, 7
                  srl          tp, t2, a3
                  srai         zero, s10, 5
                  addi         t4, s3, 1919
                  fsub.s       ft1, fs4, fs1, rup
                  sub          zero, t1, t6
                  ori          s6, a0, -168
                  srli         s10, a1, 25
                  div          s10, s5, s9
                  xor          ra, t4, s6
                  or           s7, a7, s3
                  fcvt.s.w     fa3, t1
                  and          s6, t5, a0
                  fcvt.s.w     fa7, s11, rdn
                  lui          a5, 29939
                  mulhsu       s6, t3, s5
                  addi         a6, s6, 275
                  fcvt.w.s     s2, ft7
                  xor          t0, t1, a2
                  srli         s2, s10, 0
                  mul          a2, a0, a7
                  flt.s        t6, fs0, fs6
                  remu         a4, s1, t2
                  srai         t5, a4, 30
                  fmul.s       ft6, fs10, ft11, rdn
                  mulhsu       a6, t3, t1
                  mulhsu       a1, a3, s0
                  feq.s        s8, ft1, fa3
                  slt          s0, s4, a2
                  fcvt.s.wu    fs7, a6, rne
                  fcvt.w.s     s10, ft0
                  fcvt.w.s     s2, ft7
                  ori          t0, ra, -1021
                  nop
                  addi         a2, t5, -156
                  fsub.s       fs1, fs7, fs11, rne
                  nop
                  remu         s6, s5, s3
                  mulhsu       t6, s3, gp
                  sltu         t6, a7, s5
                  srli         s5, a7, 4
                  fmul.s       fa2, fs0, fs11, rmm
                  remu         t0, s4, t0
                  srl          s8, s9, t4
                  slli         a2, t5, 0
                  xori         s11, ra, -509
                  srli         a7, gp, 9
                  srli         zero, t5, 18
                  la x28, test_done
                  jalr x0, x28, 0
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
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_2:
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_3:
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_4:
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_5:
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_6:
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_7:
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_8:
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_9:
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_10:
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_11:
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_12:
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_13:
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_14:
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_15:
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

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
                  addi x6, x6, -4
                  sw  x25, (x6)
                  add x25, x6, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x6, x25, zero
                  csrr x18, 0x341 # MEPC
                  csrr x18, 0x342 # MCAUSE
                  li x4, 0x3 # BREAKPOINT
                  beq x18, x4, ebreak_handler
                  li x4, 0x8 # ECALL_UMODE
                  beq x18, x4, ecall_handler
                  li x4, 0x9 # ECALL_SMODE
                  beq x18, x4, ecall_handler
                  li x4, 0xb # ECALL_MMODE
                  beq x18, x4, ecall_handler
                  li x4, 0x1
                  beq x18, x4, instr_fault_handler
                  li x4, 0x5
                  beq x18, x4, load_fault_handler
                  li x4, 0x7
                  beq x18, x4, store_fault_handler
                  li x4, 0xc
                  beq x18, x4, pt_fault_handler
                  li x4, 0xd
                  beq x18, x4, pt_fault_handler
                  li x4, 0xf
                  beq x18, x4, pt_fault_handler
                  li x4, 0x2 # ILLEGAL_INSTRUCTION
                  beq x18, x4, illegal_instr_handler
                  csrr x4, 0x343 # MTVAL
                  1: la x28, test_done
                  jalr x1, x28, 0

ecall_handler:    
                  la x18, _start
                  sw x0, 0(x18)
                  sw x1, 4(x18)
                  sw x2, 8(x18)
                  sw x3, 12(x18)
                  sw x4, 16(x18)
                  sw x5, 20(x18)
                  sw x6, 24(x18)
                  sw x7, 28(x18)
                  sw x8, 32(x18)
                  sw x9, 36(x18)
                  sw x10, 40(x18)
                  sw x11, 44(x18)
                  sw x12, 48(x18)
                  sw x13, 52(x18)
                  sw x14, 56(x18)
                  sw x15, 60(x18)
                  sw x16, 64(x18)
                  sw x17, 68(x18)
                  sw x18, 72(x18)
                  sw x19, 76(x18)
                  sw x20, 80(x18)
                  sw x21, 84(x18)
                  sw x22, 88(x18)
                  sw x23, 92(x18)
                  sw x24, 96(x18)
                  sw x25, 100(x18)
                  sw x26, 104(x18)
                  sw x27, 108(x18)
                  sw x28, 112(x18)
                  sw x29, 116(x18)
                  sw x30, 120(x18)
                  sw x31, 124(x18)
                  la x28, write_tohost
                  jalr x0, x28, 0

instr_fault_handler:
                  add x25, x6, zero
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 128
                  add x6, x25, zero
                  lw  x25, (x6)
                  addi x6, x6, 4
                  mret

load_fault_handler:
                  add x25, x6, zero
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 128
                  add x6, x25, zero
                  lw  x25, (x6)
                  addi x6, x6, 4
                  mret

store_fault_handler:
                  add x25, x6, zero
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 128
                  add x6, x25, zero
                  lw  x25, (x6)
                  addi x6, x6, 4
                  mret

ebreak_handler:   
                  csrr  x18, 0x341
                  addi  x18, x18, 4
                  csrw  0x341, x18
                  add x25, x6, zero
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 128
                  add x6, x25, zero
                  lw  x25, (x6)
                  addi x6, x6, 4
                  mret

illegal_instr_handler:
                  csrr  x18, 0x341
                  addi  x18, x18, 4
                  csrw  0x341, x18
                  add x25, x6, zero
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 128
                  add x6, x25, zero
                  lw  x25, (x6)
                  addi x6, x6, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x18, 0x300 # MSTATUS;
                  csrr  x18, 0x304 # MIE;
                  csrr  x18, 0x344 # MIP;
                  csrrc x18, 0x344, x18 # MIP;
                  add x25, x6, zero
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 128
                  add x6, x25, zero
                  lw  x25, (x6)
                  addi x6, x6, 4
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
