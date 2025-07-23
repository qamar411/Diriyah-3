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
                  li x6, 0x40001120
                  csrw 0x301, x6
kernel_sp:        
                  la x14, kernel_stack_end

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
                  li x6, 2139095039
                  fmv.w.x f0, x6
                  li x6, 0
                  fmv.w.x f1, x6
                  li x6, 4286578688
                  fmv.w.x f2, x6
                  li x6, 2139095040
                  fmv.w.x f3, x6
                  li x6, 2147483648
                  fmv.w.x f4, x6
                  li x6, 2143289344
                  fmv.w.x f5, x6
                  li x6, 0
                  fmv.w.x f6, x6
                  li x6, 4286578688
                  fmv.w.x f7, x6
                  li x6, 2139095040
                  fmv.w.x f8, x6
                  li x6, 0
                  fmv.w.x f9, x6
                  li x6, 2139095040
                  fmv.w.x f10, x6
                  li x6, 1982237
                  fmv.w.x f11, x6
                  li x6, 2143289344
                  fmv.w.x f12, x6
                  li x6, 2152455383
                  fmv.w.x f13, x6
                  li x6, 2139095040
                  fmv.w.x f14, x6
                  li x6, 2143289344
                  fmv.w.x f15, x6
                  li x6, 2139095040
                  fmv.w.x f16, x6
                  li x6, 2139095041
                  fmv.w.x f17, x6
                  li x6, 1307806572
                  fmv.w.x f18, x6
                  li x6, 2143289344
                  fmv.w.x f19, x6
                  li x6, 0
                  fmv.w.x f20, x6
                  li x6, 2139095039
                  fmv.w.x f21, x6
                  li x6, 4286578688
                  fmv.w.x f22, x6
                  li x6, 4286578687
                  fmv.w.x f23, x6
                  li x6, 2213877833
                  fmv.w.x f24, x6
                  li x6, 2154520920
                  fmv.w.x f25, x6
                  li x6, 2148374554
                  fmv.w.x f26, x6
                  li x6, 4286578688
                  fmv.w.x f27, x6
                  li x6, 6484396
                  fmv.w.x f28, x6
                  li x6, 2147728586
                  fmv.w.x f29, x6
                  li x6, 3519036522
                  fmv.w.x f30, x6
                  li x6, 0
                  fmv.w.x f31, x6
                  fsrmi 2
                  li x0, 0x0
                  li x1, 0x8
                  li x2, 0x80000000
                  li x3, 0xf
                  li x4, 0xf
                  li x5, 0xf7b63772
                  li x6, 0x0
                  li x7, 0xb0cd3dda
                  li x8, 0xfdba7acd
                  li x9, 0x80000000
                  li x10, 0xb
                  li x11, 0xe70495b1
                  li x13, 0x0
                  li x15, 0x0
                  li x16, 0x59ad0507
                  li x17, 0x9
                  li x18, 0x324953b3
                  li x19, 0x0
                  li x20, 0x6
                  li x21, 0xceabcec3
                  li x22, 0x0
                  li x23, 0x9
                  li x24, 0x7b4b3338
                  li x25, 0xc
                  li x26, 0x0
                  li x27, 0x80000000
                  li x28, 0x0
                  li x29, 0x80000000
                  li x30, 0xfa726291
                  li x31, 0x80000000
                  la x12, user_stack_end
main:             sll          t2, zero, a6
                  fmv.x.w      s4, ft4
                  sltiu        s1, ra, -4
                  mul          s9, a5, a2
                  srl          s8, sp, s5
                  srai         a1, s2, 10
                  slt          s11, s2, s3
                  remu         gp, zero, t2
                  add          a1, a5, s5
                  add          s0, s9, t1
                  mulhsu       t4, s7, s9
                  fsgnj.s      fs7, fa2, fa2
                  mulhsu       a6, s6, s9
                  slti         tp, a1, 1979
                  fmv.w.x      fa1, a0
                  fmv.x.w      s11, fs9
                  fclass.s     s7, fs8
                  xori         ra, s0, 1279
                  or           s3, s3, a4
                  feq.s        s9, ft2, fs7
                  sra          s0, a1, ra
                  addi         t1, s8, -1550
                  nop
                  fcvt.w.s     a3, fs2, rup
                  sll          s6, t5, a6
                  and          zero, a1, s4
                  fcvt.s.w     fa7, a2
                  srai         s3, gp, 7
                  rem          s4, s8, tp
                  fclass.s     s9, fs11
                  remu         a6, a4, t0
                  srli         a0, a4, 2
                  fcvt.wu.s    t0, ft8, rmm
                  fcvt.wu.s    s9, fa3, rne
                  srl          s6, ra, a5
                  srai         s0, zero, 18
                  sub          t6, s1, t1
                  fclass.s     s1, ft3
                  srai         zero, a4, 2
                  flt.s        s7, fa7, ft1
                  sub          a5, t6, s0
                  divu         s1, s5, s0
                  remu         a5, s9, s2
                  remu         t0, s4, s2
                  xor          t1, s1, a2
                  fmv.x.w      gp, ft6
                  fmax.s       fs3, fa4, fs5
                  fcvt.wu.s    s4, fs7, rup
                  fsub.s       ft2, ft11, fs9
                  feq.s        t4, fs11, fs0
                  sll          gp, s8, s2
                  fcvt.w.s     t4, fa4
                  auipc        s10, 927285
                  fmax.s       fs2, fs7, fs1
                  andi         ra, a2, 1417
                  fmv.x.w      s4, ft4
                  mulhu        sp, a3, a0
                  fsgnjn.s     fs1, ft0, fs0
                  nop
                  remu         s4, a1, a4
                  fmax.s       fs7, fa5, fs1
                  fsub.s       fs9, ft11, ft9
                  sltu         s9, a0, s11
                  mulh         gp, a7, gp
                  fadd.s       fs9, ft5, fs10
                  xori         tp, s2, 194
                  fle.s        ra, fs0, fa5
                  slli         t6, t4, 18
                  andi         zero, s1, -1326
                  addi         a6, a2, -1158
                  rem          t1, sp, s5
                  slti         gp, s4, 1550
                  mul          s10, t6, a7
                  slt          gp, t1, s1
                  srai         s10, t0, 10
                  nop
                  fmv.w.x      fs7, s9
                  sub          s2, s9, a5
                  srli         s9, s8, 18
                  mul          s0, t2, zero
                  nop
                  add          s0, s6, t6
                  xori         s11, a4, -893
                  fcvt.s.wu    fs5, s2, rup
                  auipc        zero, 390795
                  slt          t6, t5, s1
                  fmul.s       ft4, fs10, fs8, rup
                  divu         a3, a4, tp
                  fcvt.s.wu    fs9, s1
                  sra          s5, t5, a7
                  auipc        a0, 246626
                  remu         a7, gp, s1
                  mul          a3, t5, a2
                  fsub.s       fa3, fs3, fa2, rtz
                  div          s7, s2, a3
                  auipc        a7, 361372
                  xor          a5, a1, s4
                  add          s4, s0, tp
                  fsqrt.s      fs7, fa0
                  fmv.w.x      ft1, a2
                  fsgnj.s      ft10, fs5, fs3
                  fcvt.w.s     a7, ft4, rtz
                  fsgnjx.s     fa2, ft7, ft3
                  div          s6, t6, t3
                  sll          t2, ra, s0
                  fmv.w.x      fs11, t2
                  sltiu        a0, s2, -1246
                  fcvt.wu.s    s11, fs11
                  slt          s6, s2, sp
                  sra          s4, tp, a4
                  sltu         s5, s4, s1
                  auipc        t2, 259298
                  mulhu        s0, a3, s7
                  lui          s5, 363140
                  mulh         s2, s7, t0
                  fmul.s       fs7, fs9, ft0
                  addi         a3, a1, -1340
                  sll          s0, a4, a5
                  sll          s0, s8, t6
                  fcvt.s.wu    fs6, s8
                  fclass.s     s3, ft1
                  mulhu        a5, t3, zero
                  fcvt.w.s     t5, fs5, rtz
                  or           s7, s10, a2
                  sltu         a0, t4, a1
                  fsgnjx.s     ft1, fs1, fs5
                  fmv.w.x      fs6, t3
                  remu         s10, s9, a5
                  slti         s2, s3, 1361
                  fsgnjn.s     fs6, ft10, ft0
                  srli         a3, a7, 14
                  fmin.s       fa0, fs10, ft2
                  srai         a5, a3, 10
                  flt.s        a7, fa2, fs4
                  fcvt.w.s     s0, fs3
                  srl          ra, sp, s7
                  div          tp, s8, s9
                  srli         a5, t5, 13
                  nop
                  srli         s3, a5, 28
                  fdiv.s       fa2, fa1, fs9, rmm
                  fcvt.s.w     ft11, s10, rne
                  mulh         t4, s7, t5
                  lui          s11, 795727
                  fmv.w.x      fa4, a4
                  fmin.s       fa6, fa6, ft9
                  fdiv.s       ft11, fs6, ft7, rne
                  sltiu        s0, s8, -879
                  mulhsu       s2, a2, a5
                  fclass.s     t0, fs9
                  srai         tp, s7, 10
                  fcvt.wu.s    s7, ft5
                  srai         s5, s7, 4
                  slti         t6, a1, -1004
                  slt          s3, a6, s8
                  sub          s3, tp, t1
                  slli         s9, s2, 1
                  mulh         t5, s11, t4
                  sll          s7, t6, s9
                  sltiu        t1, sp, 1976
                  fcvt.s.w     fs2, sp
                  fmul.s       fs5, ft5, fs7, rtz
                  fclass.s     a7, fs2
                  fmin.s       ft7, fs3, fs11
                  xor          t1, t1, s3
                  fmv.x.w      zero, fa0
                  fsgnjn.s     fs10, fa2, fs9
                  xor          s11, s6, t2
                  auipc        s9, 612270
                  fmax.s       fa4, ft1, ft9
                  mulhsu       t4, gp, zero
                  fsgnj.s      ft5, fa6, ft7
                  srai         s10, s2, 30
                  mulhu        t4, s7, s11
                  sll          tp, a7, s11
                  div          t4, zero, s6
                  div          s1, s8, a4
                  add          ra, gp, s4
                  div          s0, s10, t3
                  xor          t4, s6, sp
                  slt          a6, a5, a2
                  fmv.w.x      fs6, s4
                  div          a3, s2, s9
                  or           t0, sp, s7
                  auipc        a6, 411915
                  fadd.s       ft0, fs7, fs8
                  mulhu        s8, s1, s10
                  and          t0, a0, gp
                  divu         t1, t0, t2
                  fmv.x.w      t2, fs2
                  fsgnjn.s     fa4, ft4, fa2
                  and          t5, a3, t2
                  div          zero, t6, a2
                  sltiu        s10, a6, 1123
                  remu         t2, sp, tp
                  fdiv.s       ft4, fa4, fa0, rdn
                  fsgnjn.s     ft4, fa0, ft5
                  fclass.s     t5, ft9
                  xori         a6, t0, 1347
                  rem          t0, s2, s8
                  add          a6, s4, t6
                  divu         t2, a2, s8
                  sll          s7, a1, s0
                  fsub.s       fs11, fa0, fa3
                  sub          t5, t0, t4
                  fsqrt.s      fs6, fs0
                  sll          gp, a7, a6
                  remu         t2, a4, a5
                  srl          t6, a1, a5
                  fmv.x.w      t0, fs6
                  fcvt.wu.s    s0, ft5, rtz
                  fmin.s       fa0, fa6, fa1
                  mulhu        s1, tp, s6
                  sra          a3, s2, s10
                  srl          t6, a0, t5
                  fle.s        a3, fs5, fs9
                  fmul.s       fs2, fs8, fs0
                  fsqrt.s      fs10, fs11, rne
                  fsgnjn.s     fs5, fa5, fs9
                  mulh         s9, t1, a0
                  xori         s6, gp, -1502
                  fmax.s       fs8, fa5, fs0
                  and          t6, s5, a2
                  srli         s1, t6, 7
                  fcvt.wu.s    s7, fs6, rmm
                  sltu         s8, a3, t1
                  sub          zero, s4, ra
                  or           ra, t3, a2
                  fcvt.s.wu    fa3, a7
                  sra          a1, s6, s8
                  fsqrt.s      fa6, ft4
                  xor          t1, s3, t4
                  sra          t4, s6, ra
                  mulhu        a6, a2, s6
                  xor          a7, t6, s2
                  mulhsu       s0, t6, a5
                  feq.s        s7, fa0, fa3
                  div          ra, t5, s9
                  lui          a7, 603539
                  and          s1, tp, t3
                  fmin.s       fa3, fs6, fa5
                  srli         t0, a7, 7
                  fcvt.w.s     t1, fa7
                  fsqrt.s      ft10, fa6, rdn
                  nop
                  mulh         zero, t6, s7
                  slli         zero, zero, 28
                  fmv.w.x      ft4, s8
                  mulhsu       a5, gp, a4
                  and          s1, s2, s8
                  fcvt.s.wu    ft10, t2, rup
                  sra          s0, t5, a7
                  fcvt.s.w     ft5, a5, rne
                  xor          zero, s9, s5
                  fmin.s       ft8, fs2, ft11
                  mulh         t6, t3, s3
                  add          t6, t1, a1
                  rem          t5, s6, t5
                  mulhu        s9, s2, s1
                  fcvt.wu.s    s4, ft10, rdn
                  mulh         ra, s4, a4
                  fmv.x.w      s7, ft9
                  fadd.s       fs9, fs3, fs3, rup
                  ori          zero, s5, 1823
                  slt          ra, a4, a2
                  or           s0, a3, zero
                  xori         zero, s4, -1630
                  fsqrt.s      ft5, ft8
                  flt.s        zero, ft5, ft9
                  fsgnjx.s     fs4, fs1, fs10
                  feq.s        tp, ft5, fa4
                  or           t2, zero, s11
                  rem          a7, a3, s4
                  div          t1, a0, a0
                  sra          ra, tp, s10
                  fcvt.s.w     ft8, t6
                  srai         s5, a0, 1
                  mulh         s9, s9, s6
                  fdiv.s       fs3, ft11, fs0
                  andi         zero, s10, -1458
                  fsub.s       fs0, fs3, fs7
                  sub          a0, a1, a5
                  fdiv.s       ft8, ft10, fa5, rup
                  fcvt.wu.s    s1, fs6, rtz
                  andi         sp, s1, -166
                  fsgnjn.s     fs5, fs1, fs4
                  mul          zero, a4, s7
                  fcvt.s.w     ft7, s7
                  ori          s10, a3, -1467
                  fclass.s     s4, fs0
                  auipc        s7, 267538
                  fsgnj.s      ft4, ft0, fa1
                  srai         t5, ra, 28
                  feq.s        s5, fs0, fa2
                  or           s1, zero, t1
                  sltiu        a3, s2, 588
                  fmul.s       ft7, fs1, ft4
                  fmin.s       ft8, ft5, fa5
                  sltiu        s4, ra, -869
                  sltu         s9, s5, t1
                  fdiv.s       fs8, ft9, fa2
                  slt          a1, a5, a5
                  fclass.s     ra, fa1
                  srl          s4, a5, a3
                  remu         s0, a0, s8
                  fsgnjx.s     fs1, ft0, fs9
                  fcvt.s.wu    fs10, s4
                  fsgnj.s      fs7, fa2, ft11
                  mulhsu       a3, tp, a5
                  addi         t0, s6, -1911
                  mulh         ra, ra, zero
                  sub          s0, a3, a1
                  srl          tp, t0, t2
                  and          s2, t0, s0
                  fcvt.s.w     fs4, a2
                  fadd.s       fa5, fs9, fs9
                  fle.s        s3, fs10, fa6
                  xori         s3, t0, -500
                  add          s2, a7, a1
                  slti         t5, sp, -1990
                  srai         tp, s6, 3
                  mulhsu       s8, s7, tp
                  slt          a3, t6, t2
                  add          s11, ra, s9
                  andi         a5, s8, 1447
                  xori         t6, a3, -1176
                  fsgnj.s      ft6, fs3, fs1
                  fmv.x.w      a7, ft3
                  and          s2, s6, t4
                  ori          a0, a3, 768
                  mulhu        t5, ra, s10
                  slt          a0, t5, t0
                  fadd.s       fa2, ft4, fs4
                  flt.s        t4, fs5, ft0
                  fclass.s     a3, fs2
                  fdiv.s       fs3, fa2, ft6, rmm
                  fcvt.wu.s    s2, ft10
                  sll          ra, s5, s8
                  fclass.s     t2, ft2
                  fadd.s       ft9, fa4, fa4, rup
                  fsqrt.s      fs6, fs1, rtz
                  andi         a6, s8, -1253
                  slti         s3, s6, -431
                  srl          s11, s10, t6
                  fcvt.w.s     t0, ft6
                  fcvt.s.w     fa6, ra, rtz
                  slt          s3, a2, a1
                  mulhsu       a0, s2, gp
                  fle.s        s1, ft7, ft9
                  fsgnjx.s     ft0, fa3, fs11
                  sltiu        a0, s3, 1198
                  auipc        t4, 916699
                  sltiu        tp, sp, -1005
                  xor          s8, a0, a6
                  mulhsu       s11, gp, s1
                  srl          a3, s11, a0
                  mul          sp, s11, ra
                  sltu         s10, sp, t4
                  mulh         t4, s1, s0
                  fsub.s       fs5, ft10, fa2, rmm
                  fsub.s       ft0, ft5, fs4, rdn
                  xor          t6, a7, t0
                  fcvt.w.s     s0, fs9
                  srl          s1, t1, t5
                  mulh         t2, s2, zero
                  fmv.w.x      fs5, a3
                  and          s8, t3, s7
                  mulh         sp, zero, t4
                  ori          t2, s2, -83
                  fadd.s       fs2, ft8, fs0
                  fadd.s       fs2, fs1, fa3
                  divu         s7, s5, a4
                  addi         s4, s11, 537
                  fsgnjn.s     fs2, ft11, fs2
                  xori         ra, s9, 1497
                  fcvt.s.w     fa7, s10, rdn
                  fcvt.wu.s    sp, fs11, rne
                  fcvt.wu.s    a6, fs4, rne
                  andi         gp, a4, 148
                  fsgnj.s      fa5, fs7, fs4
                  and          t0, a5, s3
                  div          t5, a4, s10
                  fcvt.s.wu    fs9, s4
                  fmv.w.x      fa5, s7
                  srai         t5, a5, 31
                  sra          a3, s5, ra
                  xori         t6, s6, -1747
                  fadd.s       fs3, fa7, fa4
                  slt          t4, s7, s8
                  fmin.s       ft11, ft2, ft6
                  remu         s6, a0, a7
                  slti         s7, s3, 285
                  remu         zero, sp, s2
                  fcvt.s.w     ft5, t1, rtz
                  sll          s2, a4, a7
                  slli         s0, s3, 3
                  flt.s        s11, fs5, fs1
                  fsgnjn.s     ft1, fs8, fs10
                  ori          zero, s7, 902
                  slli         s4, s0, 8
                  fmul.s       fs11, ft0, ft6
                  mul          a5, t3, t6
                  sub          zero, a5, ra
                  divu         a5, s3, a0
                  srl          t0, t3, s10
                  auipc        a0, 161247
                  remu         s0, s3, t3
                  fle.s        a6, ft0, ft1
                  fsub.s       ft8, ft8, fs9
                  fcvt.wu.s    t1, fs4
                  fclass.s     s10, fs10
                  slli         t0, a7, 7
                  fclass.s     tp, ft8
                  add          s5, t3, sp
                  fsqrt.s      fa0, ft6
                  fdiv.s       ft2, fa0, fs2, rmm
                  and          a1, t1, s9
                  remu         t6, t2, s10
                  mul          s3, s4, s3
                  rem          s8, a4, a0
                  or           s10, a3, a3
                  lui          t6, 506554
                  srli         s9, t4, 7
                  add          zero, a5, t2
                  fmax.s       ft3, fa1, ft9
                  fdiv.s       fs0, fs7, ft3, rmm
                  fsgnjx.s     ft1, ft11, ft4
                  sub          s5, t0, t1
                  fdiv.s       fs6, fa1, fs5, rne
                  sll          s4, s4, t4
                  sra          a1, s11, s3
                  fmin.s       ft2, fs2, fa0
                  fcvt.s.w     fa3, zero
                  mul          s7, s0, a2
                  sltiu        ra, s9, -1894
                  slli         s2, t5, 3
                  lui          t0, 781462
                  fmv.x.w      t6, fa2
                  srli         a5, t0, 18
                  fmv.x.w      s4, ft10
                  slt          ra, a1, s8
                  fmax.s       fs7, fa7, fs9
                  addi         s8, t0, 568
                  fsgnj.s      fs0, ft5, ft2
                  div          t2, a5, ra
                  auipc        a1, 974569
                  fsgnjx.s     fs6, ft5, fa4
                  auipc        t4, 530959
                  sltiu        s5, s4, 414
                  fsgnj.s      ft7, fs8, ft2
                  srl          zero, s0, s3
                  sltu         tp, a6, t3
                  fsgnjn.s     ft7, fs2, ft5
                  srli         ra, a3, 24
                  remu         t1, a5, gp
                  lui          t1, 78395
                  fmv.w.x      fa1, t0
                  fsub.s       fa4, ft8, fa4, rne
                  sub          a1, s5, s3
                  fmv.w.x      fs7, s2
                  fclass.s     s1, fs1
                  fsgnjx.s     fs9, fa3, ft3
                  srai         s4, s0, 14
                  rem          tp, a0, s11
                  fcvt.w.s     s1, ft3, rmm
                  and          s6, a2, s6
                  lui          s4, 188589
                  fsub.s       fa1, ft6, fa7
                  or           t4, a7, s1
                  xor          ra, t5, a3
                  andi         a3, a0, -1289
                  mulhsu       gp, s7, s0
                  fmul.s       fa6, ft6, fs6, rmm
                  sll          sp, zero, tp
                  add          t5, s1, s6
                  mulhsu       a0, s9, s5
                  fmul.s       fa4, ft2, fs4
                  and          a6, t3, t5
                  flt.s        s2, fs9, ft11
                  fdiv.s       fs8, fs2, fs7, rmm
                  remu         a3, s3, a3
                  fsqrt.s      ft11, ft1
                  fsub.s       ft2, fa5, ft11, rtz
                  auipc        s9, 195194
                  fle.s        a1, ft2, ft3
                  fsqrt.s      ft10, fs9
                  srli         t1, s2, 8
                  rem          t4, s9, t2
                  flt.s        gp, fs7, fa3
                  mulhsu       s8, s9, a6
                  and          a0, gp, t0
                  fle.s        sp, fa2, fs0
                  or           t2, a4, s1
                  srai         a7, ra, 4
                  addi         a1, zero, -1141
                  fsgnjx.s     fa2, ft1, ft2
                  flt.s        s6, fs8, fs5
                  fsgnjn.s     fs1, fs9, fs3
                  fmax.s       fa0, fs6, ft9
                  sub          tp, a5, sp
                  and          tp, t3, a1
                  mulhsu       s10, s7, a3
                  fcvt.s.wu    fs9, a3, rdn
                  auipc        s9, 418577
                  fcvt.s.wu    fa2, a4
                  fclass.s     a0, fs10
                  and          a3, s3, t0
                  fcvt.s.w     fs9, s0, rtz
                  slt          s10, s0, s3
                  mul          a3, a3, t3
                  srl          s11, s11, t2
                  srl          s10, gp, t1
                  mulhu        s11, a0, s4
                  sra          zero, s10, ra
                  div          a5, a7, a1
                  fmul.s       fs2, ft2, fa4
                  fsgnj.s      ft10, fa6, fs1
                  slli         s0, t2, 30
                  fsgnjn.s     ft8, fa3, fa0
                  fsqrt.s      fs5, fs7
                  fmin.s       ft8, fs6, fa3
                  flt.s        a5, ft1, ft4
                  fmax.s       fs6, fs4, ft5
                  fle.s        a7, fa2, fa5
                  fmin.s       ft4, fs1, fs2
                  andi         s10, s9, -1897
                  sltu         t1, s2, a0
                  nop
                  srli         t5, a4, 13
                  sll          a6, s1, t2
                  srli         s9, t6, 29
                  fadd.s       ft3, fs8, fs5, rne
                  fmin.s       ft3, ft2, ft7
                  sltu         t6, s3, tp
                  fmul.s       fs4, ft7, fa2
                  flt.s        s8, ft1, fa1
                  fmax.s       fa4, ft11, ft2
                  fmul.s       ft9, ft2, fs7, rdn
                  sra          a3, a3, a7
                  sll          s11, a0, s0
                  fsgnj.s      fs2, ft6, ft8
                  fmv.x.w      s6, ft9
                  sll          a7, s7, s0
                  flt.s        a1, fs11, fa5
                  slt          s7, t5, gp
                  sltu         s8, gp, t5
                  slti         s6, tp, 1085
                  feq.s        t5, fs8, ft6
                  slli         s1, s5, 13
                  and          t1, s7, t4
                  slt          s6, a0, t4
                  and          s4, s9, a0
                  flt.s        a6, fs3, fs11
                  fmul.s       ft11, fs11, ft1
                  srai         a5, t5, 11
                  fadd.s       ft3, fa6, ft0
                  divu         s6, a6, a6
                  ori          zero, zero, -858
                  sub          s1, t0, t6
                  mulhsu       s4, t0, a2
                  fsub.s       fa2, fs1, ft11, rne
                  and          s3, s5, s4
                  fadd.s       ft7, fs7, ft7, rup
                  ori          s4, ra, -707
                  sub          a3, a1, t2
                  addi         zero, a2, -23
                  div          a5, t6, s9
                  addi         t1, s9, -1693
                  fle.s        a7, fa2, fa4
                  fmul.s       fa6, fa6, ft5, rdn
                  fsgnjx.s     ft8, fs10, ft4
                  fle.s        a5, ft5, ft10
                  fclass.s     s6, ft3
                  sra          a7, s9, s9
                  or           a1, gp, s2
                  fclass.s     a7, ft3
                  fle.s        s7, fs3, fa0
                  and          s10, s1, s0
                  srl          zero, a2, a0
                  or           t1, t2, s1
                  andi         s8, a7, 1912
                  auipc        sp, 590587
                  fadd.s       fa2, fs10, ft10, rmm
                  fmv.w.x      ft7, sp
                  and          s2, a5, s0
                  xor          a7, s1, s6
                  sll          s2, t5, a5
                  divu         s3, s4, s6
                  or           a5, a7, a2
                  xor          s4, s5, a7
                  or           s10, zero, s4
                  fclass.s     a1, ft10
                  add          t0, s5, t1
                  remu         ra, s6, s4
                  srl          t1, a2, t1
                  auipc        a3, 564429
                  fsqrt.s      ft9, fs1, rne
                  fmv.w.x      fa7, a3
                  fcvt.w.s     a7, fs4
                  fadd.s       fa4, fa2, fa2, rne
                  flt.s        t0, fs2, fa3
                  fcvt.s.w     ft4, t2
                  mul          zero, s1, s3
                  fmax.s       ft7, fa2, ft0
                  fclass.s     t4, fs5
                  addi         t4, a1, -1238
                  div          a5, s4, s4
                  fcvt.s.wu    fs1, gp
                  srli         s8, gp, 13
                  xor          tp, s0, t0
                  sub          a6, ra, t1
                  fsgnj.s      fs3, fa4, ft3
                  fmax.s       fs6, fa3, fa5
                  slt          s6, t5, t2
                  fmv.w.x      ft7, a0
                  andi         tp, s4, -765
                  div          s11, s3, a0
                  auipc        sp, 191226
                  fcvt.wu.s    t0, ft5, rmm
                  fsgnj.s      fa5, fs2, fa0
                  auipc        s4, 898027
                  mul          sp, a1, s2
                  auipc        t5, 618075
                  addi         t0, sp, -449
                  fmv.w.x      fs5, s5
                  fmv.w.x      fa4, tp
                  fsgnjx.s     ft10, fa0, fs3
                  slli         s6, s6, 7
                  srai         t1, a0, 5
                  fcvt.s.wu    fs7, s1, rmm
                  mulhsu       s7, t1, t1
                  fcvt.wu.s    s8, ft4
                  sltiu        a5, s6, 261
                  sltu         s2, s6, s10
                  srli         a5, sp, 12
                  flt.s        s10, ft8, fs8
                  auipc        s9, 934761
                  andi         t0, sp, -660
                  fsqrt.s      fa1, fa7
                  mul          t0, s0, t2
                  fle.s        s6, ft9, ft8
                  or           s3, t1, t6
                  flt.s        s4, ft4, ft6
                  lui          s10, 173196
                  sltu         t4, sp, a4
                  or           s4, s5, t1
                  fmv.w.x      ft3, s8
                  fdiv.s       ft11, fs11, ft11, rtz
                  fclass.s     sp, fs8
                  slt          s9, a6, gp
                  mul          tp, a5, gp
                  fmv.w.x      fs9, tp
                  fle.s        t5, fs1, ft4
                  lui          s8, 856558
                  add          s7, t5, s8
                  srai         s9, s9, 22
                  fcvt.s.w     fs8, a4
                  fadd.s       fs0, fa2, fa4
                  mul          t1, s5, tp
                  feq.s        a0, ft5, fa5
                  fcvt.wu.s    zero, ft8, rmm
                  sltu         t2, a2, a1
                  addi         s5, zero, 362
                  fsgnjn.s     fs11, ft4, ft1
                  fmul.s       fa0, fa6, ft0, rne
                  ori          t1, t2, -1631
                  fmul.s       ft5, fa2, fs2, rdn
                  fsgnj.s      fa0, fs9, fs6
                  feq.s        a5, fs2, fa5
                  sltiu        sp, t2, 120
                  mul          s7, s6, a3
                  ori          s7, s2, -318
                  andi         a5, t3, 795
                  fmin.s       fs10, fa5, fs1
                  fclass.s     a5, fa1
                  ori          a0, s4, -1117
                  fcvt.wu.s    s11, ft0
                  fsqrt.s      fs7, fa6
                  fdiv.s       fs5, fa3, ft5
                  fmv.x.w      a5, ft2
                  addi         a5, t0, 1290
                  fsgnj.s      fa6, fa4, ft9
                  fadd.s       fa7, fa4, ft8, rdn
                  srai         t1, s6, 21
                  fdiv.s       fs7, fs6, ft10, rne
                  mulhsu       s5, s3, sp
                  fmin.s       fs11, ft3, fs3
                  andi         s0, t3, 559
                  fmv.x.w      a5, ft6
                  fsqrt.s      fs5, ft5, rdn
                  fsgnjx.s     ft6, fs9, fs4
                  fsgnjx.s     fs7, fs7, fa3
                  xori         s1, s2, -1082
                  mulhu        t2, s3, s9
                  sub          s10, t3, ra
                  lui          a0, 39937
                  mulhu        s4, t1, a6
                  rem          s8, s3, t5
                  fmv.w.x      fa2, s2
                  fcvt.s.w     ft10, a5
                  sltu         s5, t4, s8
                  fsub.s       ft6, fs0, fa4
                  fcvt.wu.s    s0, fs5, rmm
                  xor          t4, s2, s6
                  sltu         a6, t2, s6
                  sltu         s1, zero, s0
                  xor          sp, t6, t2
                  auipc        ra, 1040265
                  lui          s4, 640574
                  fmin.s       ft9, ft10, ft6
                  nop
                  mulhsu       t5, s2, t2
                  fcvt.w.s     a0, fs1
                  nop
                  srai         s3, t1, 17
                  nop
                  fsub.s       fs5, fa3, ft8
                  srl          a3, t3, s7
                  fmul.s       fs4, fa5, ft8, rtz
                  mul          a0, s8, s4
                  and          s3, a3, s0
                  fmax.s       fs10, ft9, ft6
                  mulhsu       sp, a5, zero
                  fle.s        s1, fs0, ft7
                  and          s0, s6, tp
                  srai         a3, tp, 4
                  fadd.s       ft1, fs9, ft6
                  fmv.w.x      ft10, t3
                  divu         zero, a6, s3
                  fadd.s       fa2, ft1, ft4
                  feq.s        ra, fa4, fs6
                  or           s2, s3, a2
                  sltu         s8, s10, zero
                  sll          s7, a0, s0
                  fcvt.s.w     fs8, zero
                  fclass.s     gp, ft10
                  sltiu        a6, s0, -137
                  fclass.s     s0, fs7
                  srai         s8, s9, 20
                  divu         t2, zero, t5
                  fcvt.s.w     ft11, s2, rne
                  sub          tp, s0, a2
                  fmax.s       ft5, fa6, fs2
                  xor          s2, s9, a7
                  xor          zero, a1, s8
                  fle.s        s1, fa0, fs11
                  fsub.s       fa3, ft0, fa7, rtz
                  fcvt.wu.s    s5, ft4
                  sub          s5, a5, s8
                  fmv.w.x      fs0, gp
                  sltiu        s4, a3, -1044
                  or           s2, s0, s11
                  fsqrt.s      ft7, fs4
                  fcvt.s.wu    fs5, a2
                  fsgnj.s      fa7, ft9, fs1
                  sub          a3, t0, zero
                  sltiu        s8, a2, -1925
                  sra          ra, t5, a6
                  sll          ra, a7, s1
                  fdiv.s       fa4, ft2, fa3, rdn
                  andi         s5, a7, -1737
                  xori         s1, ra, -1140
                  fmin.s       fs5, fs2, fs0
                  or           t0, s8, t6
                  fsqrt.s      fs4, ft8, rmm
                  fmin.s       ft11, ft5, ft8
                  flt.s        s6, fa5, fa6
                  fsgnj.s      ft9, fs1, ft11
                  rem          sp, s6, a1
                  fmv.x.w      s2, fs9
                  fcvt.w.s     s8, fa1, rne
                  fmin.s       fs1, ft5, ft9
                  flt.s        t1, ft1, ft7
                  fle.s        s6, fa4, fs4
                  slti         t1, s8, -186
                  andi         a1, ra, -1066
                  slti         a5, s9, 750
                  rem          t6, t6, a2
                  fsub.s       fs7, ft3, fa3
                  flt.s        s6, fa5, ft9
                  fcvt.s.wu    ft2, s3, rdn
                  fsub.s       fa2, fs0, fs5
                  mulhu        s9, s8, a6
                  sll          s11, t2, s10
                  slli         a6, t4, 15
                  xori         s1, s4, 164
                  fdiv.s       fs1, ft4, fa7, rdn
                  slli         t0, zero, 14
                  mul          t1, gp, t4
                  sltiu        a5, s10, 1596
                  fmin.s       fs8, fa3, fs0
                  sltiu        t2, s4, -299
                  remu         s0, a1, s6
                  sltiu        a3, t3, 1857
                  addi         t0, ra, 977
                  xori         s9, tp, -1078
                  fsgnjn.s     fa6, fa5, ft3
                  fmv.w.x      fa2, s8
                  fclass.s     s4, fs1
                  sll          gp, t4, t4
                  sll          t2, s6, t1
                  mulh         zero, a0, t6
                  fsgnj.s      fs5, fs1, ft9
                  fmul.s       fs6, fa7, fs3
                  srai         s7, t6, 1
                  fsub.s       ft1, fs10, ft9, rup
                  fdiv.s       fa2, fa0, fs4
                  srai         s6, s4, 25
                  xor          zero, a4, t1
                  mulhu        a6, s0, a1
                  auipc        a7, 638198
                  andi         s0, a0, 632
                  fmul.s       ft1, fs0, fs7, rmm
                  addi         s9, sp, 796
                  fmul.s       ft5, fa7, fs3, rup
                  or           s10, s1, t3
                  fmax.s       ft10, fs10, fs2
                  lui          t2, 277544
                  srli         t0, s4, 0
                  fcvt.wu.s    s3, fs10, rtz
                  sub          a1, s0, s4
                  fsgnjx.s     ft8, ft8, fa6
                  nop
                  nop
                  sltiu        t6, a2, -405
                  srl          s9, s7, t2
                  fsgnjx.s     fs3, fa5, fs3
                  mul          a5, s10, s7
                  and          t2, s8, t2
                  fsub.s       fa0, fa6, fs4
                  and          a7, t0, t0
                  slt          s6, ra, sp
                  lui          tp, 947063
                  nop
                  sltu         s1, t5, a3
                  mul          a6, s4, t4
                  fcvt.s.wu    ft4, a0, rdn
                  slli         s4, tp, 0
                  fsgnjn.s     fs7, fa3, fa7
                  fmul.s       fa1, ft3, fa3
                  andi         s3, t3, -1261
                  sll          zero, a4, s2
                  fsgnj.s      fs3, fa3, fa2
                  fmul.s       ft0, ft3, fs7, rup
                  andi         s11, a7, 660
                  and          tp, s7, t6
                  and          s6, t2, s6
                  fclass.s     a6, ft5
                  srl          a1, t1, s5
                  fcvt.s.wu    ft0, t6, rmm
                  flt.s        t4, ft2, fs11
                  fcvt.wu.s    t4, fs6, rtz
                  fclass.s     s7, fs2
                  sub          a7, s3, a7
                  auipc        s9, 968720
                  xori         t0, t2, -139
                  addi         s0, a0, -235
                  slti         s0, a1, 1247
                  fsgnj.s      ft6, ft0, fs4
                  slt          tp, zero, s6
                  fcvt.s.wu    ft3, s1
                  fsqrt.s      ft3, fa1
                  sltu         s4, a3, zero
                  fmax.s       fs10, fa2, ft2
                  fsgnjn.s     ft4, ft0, ft8
                  ori          zero, s3, -1639
                  addi         t6, s2, 1785
                  mulhu        t0, t2, a0
                  rem          s0, zero, a3
                  fcvt.wu.s    s8, fs6
                  add          t4, t0, s9
                  remu         tp, s5, s9
                  srli         t6, s2, 0
                  sll          s1, tp, ra
                  xori         gp, sp, 121
                  lui          s2, 533564
                  sltu         t0, s11, s6
                  fsgnj.s      ft0, fa7, ft3
                  mulh         a7, a6, s10
                  rem          s0, t4, s1
                  mulhsu       t0, s4, tp
                  div          a3, t3, s10
                  srai         ra, a3, 11
                  slt          s9, s8, t2
                  slti         t2, a3, 21
                  fmin.s       fs4, fa5, fs4
                  srai         s0, a4, 28
                  mulh         a1, a1, a4
                  divu         tp, a5, t5
                  divu         s3, s3, s1
                  fmv.x.w      a3, fs11
                  fclass.s     s1, fs1
                  srl          sp, t4, a3
                  fadd.s       fs1, ft9, fa4
                  srli         a5, ra, 12
                  fmax.s       fs0, ft10, fa4
                  addi         t0, s9, 1791
                  fle.s        a6, fs7, ft7
                  auipc        sp, 287668
                  remu         ra, t4, gp
                  fmv.w.x      ft6, t5
                  fsgnj.s      fa4, fs4, fa4
                  fcvt.s.w     fa7, a2
                  mulhsu       s8, s5, tp
                  mulh         s7, a3, a2
                  fsgnj.s      fa5, fa5, fa0
                  nop
                  ori          tp, a0, 608
                  andi         t5, s3, -616
                  fmax.s       fs2, ft10, ft8
                  fsgnjn.s     ft7, fa3, fa5
                  fcvt.wu.s    s1, ft9, rdn
                  auipc        t2, 526504
                  or           s11, a5, t2
                  sltiu        a7, s10, 261
                  fmin.s       ft2, fs5, fa0
                  sll          a1, t3, a5
                  slli         t6, t1, 10
                  fcvt.wu.s    s6, fs9
                  flt.s        s2, fa7, fs5
                  sll          t2, a5, s0
                  fcvt.w.s     a5, fa1, rup
                  lui          s5, 472215
                  fcvt.w.s     sp, fs3, rup
                  fsgnj.s      fs1, fa5, ft3
                  fmv.x.w      s6, fa7
                  srai         a6, a7, 28
                  sub          s1, s4, s11
                  fsgnjx.s     fa6, fs9, fs9
                  fle.s        s0, fa7, fa5
                  fsgnj.s      fa2, ft1, fs5
                  fmax.s       ft1, ft0, ft9
                  fsub.s       ft1, fa7, fs0
                  fmv.w.x      ft4, s7
                  slt          zero, a3, t4
                  fsub.s       ft1, ft5, fa6, rdn
                  fle.s        sp, fs10, fa5
                  or           s3, s9, a3
                  srai         a6, s9, 21
                  sltu         tp, s6, zero
                  sra          t6, a5, zero
                  auipc        s5, 724121
                  fcvt.wu.s    a6, ft2
                  fmv.x.w      t4, fa4
                  and          sp, s4, s10
                  fdiv.s       ft8, ft0, ft2, rdn
                  mul          s0, s4, s0
                  divu         t0, a0, t4
                  rem          s6, t2, s10
                  add          t0, t6, a2
                  fmax.s       ft5, fs3, ft5
                  feq.s        t0, fs6, ft2
                  sltiu        sp, ra, 76
                  div          s11, s1, t1
                  fsqrt.s      fs8, fs11
                  fsgnjx.s     ft6, fs3, fa4
                  flt.s        t0, fs9, fs10
                  fmax.s       fs0, fa0, ft9
                  sll          gp, s9, s7
                  sltu         s1, a7, s6
                  mul          t1, s0, t2
                  sra          s6, a5, t6
                  flt.s        s8, fs7, fs8
                  xor          a0, ra, t2
                  flt.s        a3, fa3, fs3
                  srl          a7, s0, a4
                  sltiu        s9, s2, -360
                  fcvt.s.w     ft11, tp, rne
                  slt          t6, a1, s2
                  fdiv.s       fs4, fa5, ft6
                  sll          s1, s10, t6
                  fcvt.wu.s    s7, fa2
                  auipc        t1, 888613
                  mulh         s0, s6, a0
                  add          s0, t5, a6
                  auipc        a5, 231007
                  srli         a7, t5, 9
                  fmin.s       fa0, fa1, fa2
                  fcvt.s.w     fa5, s0, rup
                  srl          s3, a7, zero
                  fsgnjx.s     fs0, fs3, fa3
                  and          s9, s1, s7
                  flt.s        s5, fa4, fs0
                  auipc        s0, 1004986
                  sltu         s6, a5, s11
                  remu         tp, zero, s0
                  auipc        sp, 482921
                  fsgnjx.s     fs4, fs1, ft8
                  sll          s6, s10, t6
                  sll          gp, a4, ra
                  mulhsu       s2, t4, t1
                  nop
                  fmin.s       fs8, ft1, ft6
                  addi         s0, zero, 78
                  sub          s6, a2, t6
                  fmul.s       fa1, ft5, fa3, rup
                  fmax.s       fs5, ft2, fa7
                  fclass.s     ra, fa4
                  remu         s4, t2, s1
                  fsqrt.s      ft6, ft1, rup
                  slt          s9, s5, s2
                  fdiv.s       ft3, fa0, fs5
                  fadd.s       fa0, ft0, fs8
                  nop
                  fsgnjn.s     fs4, fs0, fs4
                  flt.s        gp, ft6, fs8
                  srli         a0, gp, 17
                  fmax.s       ft8, fa2, fs10
                  or           s4, a5, s6
                  fmul.s       ft2, fs1, fa7
                  fcvt.w.s     t5, ft3, rup
                  srai         s4, t3, 10
                  div          t1, s11, a5
                  sub          s1, zero, t6
                  xori         s8, s7, -717
                  lui          zero, 395139
                  fcvt.s.w     ft0, t3
                  slti         s5, s6, -592
                  fsgnjn.s     fs1, ft1, ft7
                  div          ra, s2, s11
                  fmin.s       fs9, ft6, fs3
                  sll          s1, a6, gp
                  xor          tp, a4, a1
                  sll          t5, s5, s1
                  srai         a1, t6, 20
                  fsgnjx.s     fa0, ft5, ft5
                  srai         a5, s10, 0
                  fle.s        a5, ft0, fa2
                  fclass.s     t1, fs1
                  and          s2, s6, a1
                  fsgnj.s      fa2, fa1, fs4
                  fadd.s       fs0, ft0, ft5, rmm
                  or           s9, gp, s5
                  remu         s2, zero, gp
                  sltu         t0, s4, sp
                  mulhu        t4, a6, ra
                  andi         t6, a6, -644
                  fmv.w.x      ft3, a6
                  srl          t4, s4, s1
                  or           ra, t3, t0
                  fsgnjx.s     ft2, ft8, ft11
                  xori         a0, s5, 1898
                  xor          t6, t6, zero
                  fcvt.s.wu    ft6, s10
                  mul          t0, t0, a7
                  slti         zero, a3, -230
                  fle.s        ra, fs7, ft4
                  ori          a0, s8, -590
                  fle.s        t4, ft8, fa7
                  fcvt.w.s     s7, fs5, rdn
                  sltiu        s7, gp, -1028
                  mul          s7, a6, sp
                  and          a3, a7, a3
                  div          s0, s6, a1
                  fsub.s       fs8, ft9, fs5
                  slli         gp, t1, 25
                  fsgnjn.s     fs10, fs8, ft5
                  fcvt.wu.s    s2, fs2
                  fclass.s     a3, fs10
                  auipc        t2, 584526
                  and          t5, s4, t2
                  div          a0, a3, a5
                  divu         t6, a3, sp
                  fcvt.s.wu    fa4, s2
                  fmv.x.w      a7, ft8
                  fmv.w.x      fs6, s3
                  and          t2, s11, t3
                  fadd.s       fs4, ft11, ft2
                  mulhu        s6, s11, a7
                  srl          sp, t2, a6
                  mul          s4, s11, a1
                  mul          tp, t5, s10
                  xor          t5, t6, a7
                  fmax.s       fs3, fa4, ft2
                  sltu         ra, a5, s0
                  mulhu        a7, s7, t1
                  rem          s5, t5, t2
                  sltiu        sp, s11, -155
                  fdiv.s       ft9, ft2, ft3
                  fsub.s       fs1, ft7, fs0, rmm
                  fcvt.w.s     t5, fa3, rmm
                  fdiv.s       fs5, fs10, fa3
                  fmul.s       fs6, ft0, fs11, rtz
                  fcvt.wu.s    a6, fs11, rdn
                  andi         a0, gp, -330
                  or           zero, s3, s8
                  rem          s7, a4, a1
                  and          s6, s8, t2
                  auipc        s7, 852181
                  slt          s2, s8, a5
                  rem          a0, a1, sp
                  fsqrt.s      fs1, ft1
                  flt.s        s4, fs5, fa0
                  fmv.w.x      ft0, t6
                  add          s3, s0, a4
                  fmax.s       ft1, ft4, fs11
                  remu         s11, s3, s1
                  or           s7, t5, a5
                  fsgnjn.s     fa7, ft5, fs8
                  fmin.s       fa0, fs9, ft11
                  fcvt.wu.s    s3, fs8, rup
                  and          a7, a3, s0
                  fcvt.wu.s    s10, fa4, rdn
                  fmax.s       ft3, fs1, fs3
                  slti         s1, t3, -1353
                  fcvt.s.w     fs1, t1, rmm
                  srai         ra, s4, 22
                  fmax.s       ft1, fs10, ft2
                  fle.s        s11, fs6, ft0
                  fmul.s       fs3, ft2, ft9
                  fsgnjx.s     fs10, fs4, ft3
                  xor          a0, s1, t6
                  divu         t4, t1, a6
                  div          t6, a1, s1
                  fcvt.w.s     a0, fs2
                  sltiu        s2, s6, -1005
                  mulh         a7, a5, a1
                  srai         t6, s6, 31
                  fle.s        a5, fa0, ft3
                  sltiu        s6, a5, 1540
                  auipc        t2, 41163
                  rem          sp, s10, s0
                  xor          t2, s8, s6
                  fcvt.s.w     fa6, s4, rtz
                  fdiv.s       fa7, ft3, fa2
                  fmv.w.x      fa0, t5
                  fadd.s       fs6, ft5, ft0
                  fmax.s       fs8, fs5, fs4
                  fmax.s       fa5, ft11, ft5
                  divu         s2, s4, ra
                  lui          s1, 845173
                  div          s2, s4, s8
                  and          s7, s0, a0
                  fmv.x.w      a6, fs0
                  mulhsu       t1, t2, a2
                  slt          t5, s3, a6
                  fle.s        t2, fs8, fs2
                  add          s0, s4, t4
                  mul          s4, sp, t3
                  mulhu        tp, s7, t4
                  mul          tp, s11, sp
                  fsqrt.s      ft3, fa3
                  xori         s11, t6, 759
                  rem          s11, ra, gp
                  fsub.s       fa3, ft0, ft5
                  slt          s10, s3, s9
                  slti         a6, t3, -1005
                  rem          s4, t6, sp
                  fadd.s       fa4, fs6, ft5, rmm
                  mulhsu       s9, a1, t2
                  and          a3, s5, a1
                  sra          a7, gp, t6
                  sra          t0, gp, t1
                  nop
                  ori          t2, a1, -1693
                  nop
                  divu         s3, t2, s0
                  mul          t0, t1, t1
                  remu         a7, t5, t2
                  mulhu        s11, a7, zero
                  slti         s0, a7, -1224
                  fsub.s       ft10, ft2, fa1, rtz
                  nop
                  feq.s        t4, fa4, ft11
                  remu         t6, s4, a1
                  fsqrt.s      fs3, fs10, rmm
                  mulhsu       t1, gp, s2
                  add          a6, a6, a2
                  fcvt.s.wu    fa1, s6
                  fcvt.w.s     t0, fa4, rne
                  slti         s0, sp, 1194
                  mulhu        s7, a2, s2
                  srl          ra, s10, s0
                  sltiu        s11, s4, 151
                  lui          t5, 680758
                  fcvt.s.wu    ft11, s6
                  feq.s        a3, fa5, fa3
                  and          t2, tp, t5
                  div          s3, a1, s10
                  or           t5, a2, a1
                  fmul.s       fs11, fs7, fs0
                  sll          t1, ra, ra
                  sltiu        a6, s2, -1874
                  flt.s        t0, ft8, ft7
                  lui          s1, 239481
                  sub          t6, s0, s1
                  xor          zero, a6, s4
                  ori          a5, s0, 1765
                  srli         s0, gp, 14
                  fsqrt.s      fa7, ft5
                  mul          a5, t2, a0
                  slli         a0, t6, 31
                  fclass.s     s2, fs3
                  fcvt.s.wu    fs6, t3
                  mulhsu       gp, sp, s8
                  xori         a3, gp, -1176
                  fsub.s       fs1, ft5, fs3
                  feq.s        t0, fa7, fs2
                  xor          a5, tp, s5
                  sra          t2, s8, s5
                  mulhu        s1, s1, t0
                  remu         ra, a7, s5
                  fmv.x.w      s4, ft10
                  lui          tp, 82918
                  xor          a6, t4, t1
                  fcvt.wu.s    a7, fs6, rup
                  remu         s6, t1, zero
                  xori         a1, s9, -1387
                  fsub.s       fa7, fs5, fs2
                  fmax.s       fs9, ft3, fs2
                  mul          sp, s9, s5
                  fsub.s       ft11, fa5, fs5
                  mulh         s3, s6, ra
                  fsgnjn.s     ft6, fs9, fs6
                  addi         s0, t5, 1440
                  fcvt.w.s     a7, fa4, rdn
                  fcvt.s.wu    fa6, t3
                  flt.s        a1, ft9, ft0
                  div          a0, a6, s8
                  slt          t2, a2, t5
                  divu         s1, s5, t5
                  xori         t0, a2, -217
                  auipc        sp, 868981
                  mulhu        zero, s5, s9
                  fcvt.w.s     s2, fs0
                  fadd.s       fa3, ft0, fa5, rup
                  fcvt.s.wu    fs0, s1, rne
                  and          a1, a7, t1
                  fdiv.s       fs7, fa6, fs3, rup
                  slli         sp, sp, 6
                  fsgnjn.s     fs0, ft6, fs10
                  flt.s        t1, fs9, fa2
                  fsgnjx.s     fs0, fs0, fa4
                  sra          t5, t4, t5
                  fmul.s       fs8, fa7, ft11
                  slti         tp, s6, -855
                  fsgnjx.s     fa4, ft0, fs6
                  nop
                  auipc        a7, 551132
                  mulhsu       a1, t2, t1
                  remu         a6, t6, gp
                  fcvt.s.wu    fa5, t3
                  fmv.x.w      s9, fa2
                  rem          s7, a6, t6
                  div          t0, t4, s4
                  srai         zero, a0, 13
                  auipc        s2, 241777
                  fmv.x.w      a0, ft6
                  fsgnjx.s     fs4, ft5, ft11
                  fle.s        s8, fa6, fs1
                  fdiv.s       fs4, ft4, fa4, rup
                  mulhsu       t6, s4, t5
                  sltiu        sp, s1, 1338
                  slli         a5, a0, 24
                  sltiu        s9, s2, 1922
                  ori          t6, tp, -464
                  fcvt.w.s     s6, ft7
                  fdiv.s       ft10, fs7, ft0, rmm
                  xori         s5, a1, -53
                  fmv.w.x      fs5, t2
                  mul          a0, s6, s10
                  div          s11, a0, s7
                  fmul.s       fs9, fs10, ft10
                  fsqrt.s      ft3, fs8, rdn
                  mulhsu       s1, s6, s3
                  divu         s11, a5, tp
                  fclass.s     s9, ft0
                  mulh         s7, t2, sp
                  fmax.s       fa5, fs1, fs9
                  addi         s8, gp, 887
                  fsgnjx.s     fs6, fs3, fs4
                  srai         s3, s0, 16
                  srl          t2, zero, tp
                  fmax.s       ft2, ft0, fs6
                  div          zero, t0, a0
                  fsgnjn.s     ft5, ft3, fs11
                  fadd.s       ft3, fs11, fa0, rdn
                  fcvt.s.w     ft0, s7, rtz
                  xor          s0, s8, ra
                  flt.s        s11, fs8, fa4
                  nop
                  srl          s2, sp, t6
                  fmax.s       fa0, fs10, fa7
                  mulhsu       s5, tp, a0
                  mul          s3, s4, zero
                  ori          s4, a3, 1319
                  sra          zero, s6, ra
                  fmin.s       ft4, ft9, fa5
                  feq.s        s0, ft8, fs0
                  fclass.s     t6, fs2
                  xori         ra, t2, 292
                  auipc        s2, 227704
                  sll          s10, zero, t2
                  fsgnjn.s     fa7, ft1, fa3
                  ori          s10, zero, 607
                  fle.s        t5, ft2, fs6
                  auipc        s3, 794364
                  fsqrt.s      ft6, fs11
                  srl          a5, s7, s0
                  flt.s        a5, fa1, fs8
                  mul          s8, sp, zero
                  sub          s10, s11, sp
                  div          a6, t1, s3
                  sll          s0, t5, a2
                  fcvt.w.s     a1, fa6, rtz
                  fsgnj.s      fs7, fs7, fs4
                  mulh         a6, s2, s6
                  auipc        t4, 290701
                  fadd.s       ft10, fs7, fs6, rmm
                  add          t4, s1, a7
                  slti         s9, s8, -1273
                  and          s8, a2, t1
                  sltiu        t1, s9, 1014
                  fadd.s       fs0, fs5, fa0
                  flt.s        t5, fa3, fs10
                  srl          s3, s0, a4
                  div          s4, gp, t6
                  fsgnjx.s     fs8, fs2, ft4
                  lui          t2, 712906
                  sltu         a0, t0, a7
                  div          t0, a4, s6
                  mul          a3, zero, tp
                  andi         t5, s8, 564
                  fmin.s       fs1, ft6, fs7
                  fsgnjx.s     ft2, ft8, fa2
                  srai         s7, a1, 0
                  fsqrt.s      fs1, fa1
                  auipc        s10, 533570
                  sltu         s10, zero, a7
                  slt          s4, t4, a4
                  sra          s1, s6, s11
                  mulh         s4, s8, zero
                  fsqrt.s      ft10, ft3
                  fsgnjx.s     fs0, fa7, ft5
                  fcvt.w.s     sp, fs7
                  fsgnj.s      fa7, fa7, fs1
                  sll          sp, s0, a7
                  div          zero, t5, s11
                  addi         s7, s1, -640
                  remu         s11, s3, t1
                  fcvt.s.w     ft3, s8, rup
                  and          s10, t6, s2
                  fmv.x.w      a7, fs7
                  mulh         s8, s5, a5
                  and          s4, s2, a1
                  fcvt.s.w     fs1, t4, rup
                  fdiv.s       fa3, ft9, ft11
                  sra          t4, a0, a7
                  rem          a5, s6, a4
                  fsqrt.s      fs9, ft6
                  or           sp, a4, sp
                  nop
                  rem          s4, t1, gp
                  xor          s3, s3, s4
                  sltu         tp, t3, t3
                  xori         t6, s5, 1591
                  fsub.s       ft1, ft3, ft0, rup
                  feq.s        sp, fs0, fs6
                  srli         s1, s10, 0
                  fsgnjn.s     fs1, fs7, ft8
                  fmax.s       fa3, fa0, fa4
                  xori         s9, s11, 1778
                  fmv.w.x      ft9, t3
                  sltiu        s6, a5, 1686
                  xor          a3, a6, a3
                  fcvt.wu.s    zero, ft9, rtz
                  fclass.s     zero, fa7
                  fmin.s       fa2, fs5, fa3
                  mulhsu       s8, s11, t1
                  sltiu        t0, a7, 491
                  ori          s4, a4, -1230
                  fadd.s       ft7, fs0, ft5, rne
                  slli         s8, s10, 2
                  sltiu        t2, a2, -1833
                  auipc        t4, 329130
                  fmv.w.x      ft5, a6
                  fcvt.wu.s    sp, fa6
                  div          s4, a6, a3
                  sltiu        s11, ra, 378
                  mul          s9, gp, s11
                  sub          s8, s7, ra
                  fcvt.s.wu    ft3, t4, rmm
                  fsgnjn.s     fa5, fs11, ft8
                  fsub.s       ft0, fs6, fa5, rdn
                  add          a7, t1, t4
                  srli         ra, t6, 0
                  srli         s1, s8, 13
                  fmv.x.w      t5, fa1
                  nop
                  mulh         s7, s6, a5
                  slli         s11, a0, 6
                  srl          s8, s8, a7
                  sll          s5, s11, s0
                  flt.s        t5, fs11, fa3
                  mulhu        s8, t2, s1
                  sra          t0, t1, a0
                  fsgnjx.s     ft11, fa1, ft10
                  fle.s        a0, fs7, fa3
                  feq.s        zero, ft3, fa5
                  slti         t1, ra, 1226
                  fclass.s     s10, fs7
                  srl          t5, s1, ra
                  remu         s0, s4, s5
                  feq.s        a1, fs3, ft7
                  fmv.x.w      sp, ft9
                  fmax.s       fs4, fa6, fs0
                  or           s0, zero, sp
                  mul          s3, a6, s6
                  lui          zero, 499023
                  srli         s1, t4, 19
                  feq.s        s1, ft5, ft6
                  fsgnjx.s     fs4, fs9, ft1
                  sltiu        s1, s8, 1896
                  fsgnj.s      fa2, fs9, ft1
                  feq.s        a0, ft1, ft2
                  slt          tp, t6, a6
                  fsgnjn.s     fa2, fs2, fs8
                  addi         s1, s4, 1408
                  rem          ra, t2, s8
                  div          s7, s7, t6
                  rem          a1, t4, t1
                  fadd.s       fa7, fs7, fa3, rne
                  srai         s10, a2, 20
                  andi         gp, s3, 1944
                  fcvt.s.wu    fa2, a5, rdn
                  fmv.x.w      zero, fs2
                  flt.s        gp, fs3, ft4
                  fsgnj.s      fs2, ft4, fs6
                  fle.s        s4, ft10, fs11
                  fsqrt.s      ft9, ft0, rup
                  remu         a3, a2, a1
                  xor          s3, t3, sp
                  xor          tp, t3, s9
                  auipc        a1, 126788
                  slti         s1, gp, -1003
                  and          s1, gp, zero
                  ori          a5, a1, 417
                  fmax.s       fa1, ft8, fa1
                  fcvt.s.w     fs4, a7, rmm
                  lui          tp, 626535
                  sub          s10, zero, s4
                  fclass.s     zero, fa3
                  fle.s        t1, fs10, ft8
                  fdiv.s       ft10, fa2, ft7
                  and          s9, s6, gp
                  fmv.w.x      fs8, t0
                  mulhu        s11, a0, a2
                  nop
                  fmax.s       fs7, fa7, fs8
                  fmax.s       ft6, fa3, fs1
                  addi         s5, t5, 1540
                  div          s9, t0, s7
                  srai         t6, a1, 24
                  lui          tp, 474467
                  nop
                  fmv.x.w      s6, ft1
                  auipc        t5, 811242
                  fmul.s       fs1, fa2, ft11, rmm
                  fcvt.s.wu    fs4, a6, rtz
                  mulhsu       s10, t0, s7
                  add          s3, t4, t6
                  mulhu        a6, t3, a4
                  fmin.s       fa4, fs0, fa2
                  mul          a6, t5, t2
                  fcvt.s.w     fs10, a1
                  xori         s1, s0, -330
                  fclass.s     s5, ft7
                  fcvt.s.wu    ft10, t5
                  rem          t2, a7, t4
                  mulhsu       s10, tp, a7
                  fcvt.s.w     fs10, t0, rmm
                  lui          s10, 303880
                  sltiu        a7, a2, 625
                  fsgnjn.s     fs8, ft1, ft8
                  mulhsu       s1, a0, t3
                  fadd.s       fs2, fa4, fa6, rmm
                  or           ra, a2, a1
                  or           zero, t0, a4
                  feq.s        t4, fs2, fs2
                  fsgnjn.s     fs2, fs8, fs5
                  srl          sp, a7, ra
                  fmul.s       fs0, fs6, fa3, rtz
                  srl          s6, s7, s10
                  fcvt.s.w     fa5, s8, rdn
                  mul          a1, tp, s5
                  rem          s4, s11, s0
                  sra          t1, s9, a6
                  lui          t2, 193620
                  xor          s11, s7, t1
                  fcvt.s.w     ft0, a1
                  fmv.x.w      a0, fa6
                  remu         sp, t4, s11
                  fcvt.w.s     s7, fa0, rup
                  ori          tp, t1, -124
                  slli         a7, t2, 31
                  fsub.s       ft6, fs1, fs2, rtz
                  rem          s1, t6, s1
                  add          s8, sp, zero
                  sub          s5, t5, s2
                  mulh         s4, s0, a0
                  remu         a5, s8, ra
                  fsgnj.s      fa5, fs8, ft0
                  sll          s9, s0, s6
                  fsgnjn.s     fs11, fa4, ft6
                  rem          ra, t3, s0
                  fmv.w.x      fs2, a7
                  ori          s7, t4, -494
                  addi         gp, t3, -878
                  mulhsu       s5, t0, s1
                  feq.s        t5, fa5, ft9
                  fmv.w.x      ft3, t4
                  fdiv.s       fs10, ft10, ft3
                  sra          zero, s11, s2
                  sltiu        t6, t1, -527
                  fmin.s       fs11, ft0, ft9
                  fsqrt.s      ft2, fs7, rmm
                  remu         gp, a7, a0
                  slt          t1, t0, s4
                  fmin.s       fs11, fs11, ft11
                  fmin.s       fs4, ft0, ft11
                  nop
                  sll          zero, a2, s4
                  fmax.s       fs10, fs5, fa4
                  fcvt.wu.s    a6, fa0
                  divu         t6, t5, t2
                  srli         a5, t2, 5
                  sltu         t4, s4, a3
                  ori          gp, s0, 1075
                  lui          s6, 119342
                  slli         a6, s10, 25
                  mul          s4, a1, s11
                  mulhsu       a7, s5, a4
                  srli         ra, a5, 16
                  add          a7, t1, a0
                  sltu         a0, s5, s6
                  fadd.s       fs0, ft3, fs8
                  mulhsu       a3, a5, sp
                  slt          a1, t4, a3
                  mulhsu       sp, s7, s7
                  mulhsu       s0, s0, gp
                  auipc        a5, 347766
                  ori          a1, a1, 58
                  andi         t1, s9, 1210
                  sub          a1, t5, s9
                  and          s1, s1, s2
                  slt          s6, t0, s10
                  addi         s3, a4, -803
                  fclass.s     t5, fa5
                  srai         t4, s8, 1
                  flt.s        a5, fs8, fs6
                  andi         s1, s2, 980
                  mulhu        s11, t2, tp
                  sub          a7, a0, ra
                  slli         s11, s9, 25
                  fsqrt.s      ft10, ft2
                  xori         t2, tp, -1456
                  srai         s4, a5, 4
                  fcvt.w.s     a6, ft11, rtz
                  rem          gp, t5, s7
                  sltiu        s1, t5, -338
                  fcvt.s.wu    fa1, s1, rne
                  fdiv.s       fa6, ft1, fs11, rdn
                  or           a0, t2, a3
                  and          t4, gp, a2
                  add          s9, t1, s8
                  fadd.s       ft5, fa7, fs5, rmm
                  srai         a7, t3, 20
                  add          s1, a2, ra
                  fcvt.wu.s    t6, fs8
                  div          s10, s9, s1
                  add          gp, a2, s5
                  sll          s8, s2, s1
                  fle.s        s0, ft5, fa7
                  fsgnjx.s     ft7, fs5, fs10
                  fsub.s       fs1, fa2, ft9, rne
                  lui          s6, 607534
                  addi         a5, s9, -1163
                  fsgnj.s      ft8, ft9, ft4
                  fmv.w.x      fs8, t1
                  and          sp, s3, s2
                  fcvt.w.s     t2, fs8
                  mulh         s5, s2, t4
                  fsgnjx.s     fs4, fs0, fs1
                  sll          sp, s8, t0
                  fadd.s       ft6, fs11, fs8
                  slti         t2, s8, -1288
                  srli         s3, a4, 27
                  fcvt.wu.s    s2, fa0, rdn
                  fsgnjn.s     ft9, fs5, fs3
                  fsgnj.s      ft11, ft5, ft8
                  fcvt.w.s     zero, fs9
                  ori          s8, t2, 1767
                  divu         tp, s9, tp
                  fmin.s       fa6, ft3, fs5
                  fadd.s       ft11, fa6, ft11, rup
                  mulhu        t0, ra, sp
                  srl          t5, t2, s1
                  fsgnjx.s     fs6, fs7, fa7
                  fcvt.s.w     fs9, t4, rup
                  fclass.s     sp, ft1
                  flt.s        s2, fs2, ft2
                  lui          s3, 405105
                  fcvt.s.wu    fa1, a4
                  xori         s7, s1, 1133
                  slti         s0, t4, -41
                  srai         s8, s0, 0
                  slti         a3, t4, 845
                  fcvt.wu.s    t4, ft10, rne
                  fsgnjx.s     ft1, fa2, ft1
                  srai         s6, zero, 16
                  addi         tp, s7, -706
                  slt          a6, t1, s2
                  fsgnjn.s     ft11, fs2, fs4
                  xor          s6, s0, s3
                  lui          a7, 679524
                  srai         zero, a3, 19
                  fclass.s     t1, fs1
                  divu         t0, s5, ra
                  srai         s2, s8, 17
                  addi         s1, s10, 1557
                  lui          t4, 751132
                  fsgnjx.s     ft8, fs6, fa1
                  slt          gp, t2, tp
                  fsgnj.s      ft7, fs1, fa5
                  flt.s        s8, fs8, fs4
                  sltiu        s7, s3, 869
                  sltu         zero, t2, s1
                  fdiv.s       fa7, fs1, fa2
                  ori          t5, a5, -1202
                  lui          a3, 823419
                  fle.s        s9, fs0, fa1
                  add          a7, a2, s5
                  fdiv.s       fa4, fs6, fs4, rmm
                  add          s3, ra, s0
                  fsgnjx.s     ft0, fs10, fs9
                  xor          s2, s3, a5
                  fmul.s       fs4, ft8, fa3
                  addi         t2, s2, -657
                  mulh         zero, a0, a3
                  xor          sp, gp, zero
                  fsgnjn.s     fa3, ft3, ft10
                  fmax.s       fa0, fa6, fs2
                  sltiu        a7, t6, -1548
                  fadd.s       ft6, fa1, fs1, rmm
                  ori          s10, t6, -401
                  fsgnjn.s     fs6, fs5, ft9
                  fmax.s       ft3, fs4, fa0
                  mulhsu       s10, zero, s9
                  fmul.s       ft1, fs1, ft4, rmm
                  fmv.w.x      ft9, a2
                  mul          t5, s9, s5
                  and          t0, t3, s0
                  fsgnjn.s     ft6, ft5, fa2
                  div          s4, s2, s0
                  sltiu        s3, a6, 161
                  nop
                  rem          a0, s5, t3
                  fle.s        t1, ft5, fs0
                  or           tp, sp, a0
                  srl          s6, t1, s3
                  fsgnjx.s     fs10, ft11, fa7
                  srli         s11, s8, 28
                  divu         t1, s8, t3
                  and          s1, zero, s9
                  srli         s4, s4, 29
                  fmax.s       fa7, fs0, fs3
                  and          ra, t2, t1
                  fsqrt.s      fa2, ft10, rtz
                  add          t1, t5, a3
                  sll          s2, s11, a3
                  addi         gp, s7, 1907
                  fsgnjn.s     fa0, fa5, fs9
                  addi         s10, zero, 1667
                  addi         s7, s2, 358
                  rem          s1, tp, a2
                  div          s5, tp, s8
                  ori          ra, a7, 1413
                  sltiu        a0, s2, -1207
                  fcvt.s.w     fs2, t5, rne
                  fsgnjn.s     fa5, fs0, fa6
                  mulhsu       s6, tp, tp
                  slti         s10, zero, 1393
                  fle.s        a5, fs7, fa4
                  fmv.w.x      fa7, s4
                  fsqrt.s      ft8, fs10, rne
                  xor          a3, t2, a5
                  lui          ra, 185436
                  sub          s2, t3, a2
                  lui          t1, 134972
                  fle.s        t4, fa7, fa6
                  div          tp, t2, s1
                  fsgnj.s      fa3, fs11, fs10
                  fmin.s       fs7, fa2, fs10
                  fsgnjx.s     fa2, fa5, fs11
                  sltu         a3, a5, a4
                  divu         s8, s11, s10
                  fmul.s       ft5, fa7, ft3
                  fsqrt.s      ft6, fa7, rdn
                  auipc        s4, 3772
                  fmax.s       ft0, fa5, fs6
                  mulh         a7, a4, s7
                  div          s3, gp, t0
                  sll          ra, ra, s1
                  fmax.s       fs6, fs11, fs10
                  fmv.w.x      fa1, tp
                  fmax.s       ft11, fs1, fa0
                  feq.s        a5, fs11, ft0
                  feq.s        t2, fs1, ft7
                  slti         tp, a1, 1087
                  sltu         s11, a7, a7
                  slt          a7, a5, s7
                  mulh         s11, zero, tp
                  fsgnjn.s     fa1, ft3, fa1
                  fcvt.wu.s    s2, fa4, rne
                  mulhsu       tp, a4, t3
                  add          a1, s0, ra
                  fmax.s       fs10, ft1, fs0
                  xor          ra, s9, gp
                  rem          s10, a6, s1
                  fadd.s       fa1, fa6, ft6
                  slli         t2, t0, 7
                  addi         a6, a6, 759
                  flt.s        tp, ft7, ft10
                  sll          s7, a7, gp
                  slt          s11, s8, s8
                  srai         s9, t2, 28
                  fmax.s       fs5, fa0, fa6
                  mulhu        a6, a7, s0
                  divu         t6, s8, a6
                  fsub.s       ft8, fs1, ft1, rdn
                  slti         s0, a2, 1569
                  srai         t2, s11, 4
                  feq.s        s9, ft11, fs11
                  sll          s0, tp, s11
                  or           ra, s7, a6
                  xor          a1, t4, t3
                  auipc        s8, 482399
                  sub          s4, tp, s8
                  slti         ra, s8, 875
                  fclass.s     s11, ft2
                  fsgnj.s      ft10, fs0, fa5
                  slli         s10, t3, 19
                  flt.s        tp, fa7, fs7
                  srai         a3, t6, 5
                  fcvt.s.wu    ft2, s5, rtz
                  fsub.s       ft6, ft5, fs6
                  fsgnj.s      fs4, fs8, fa4
                  srl          s6, s10, gp
                  srli         a0, t2, 14
                  sltu         a1, s6, a7
                  flt.s        zero, fa2, fs1
                  lui          ra, 624812
                  fmul.s       fs10, fs8, ft7, rdn
                  fsqrt.s      fa0, ft11
                  sltu         s2, t2, a3
                  fmin.s       fs4, ft0, ft11
                  fsub.s       fa6, fa4, fs9
                  lui          a6, 323131
                  ori          a1, s3, 2030
                  xori         s8, a6, 540
                  fmax.s       fa5, ft7, ft9
                  srl          s0, t1, tp
                  mul          a5, t1, s2
                  remu         a5, t4, s7
                  sll          s10, s3, s8
                  fdiv.s       fs5, ft0, ft5
                  slt          a5, a6, t4
                  andi         a0, a3, -110
                  fsub.s       ft1, fa7, ft4
                  fmax.s       fa5, fa5, fs11
                  mul          a1, s10, s2
                  div          t6, gp, t0
                  fdiv.s       fa7, ft5, fs5, rdn
                  nop
                  feq.s        a7, fs9, fa7
                  remu         a5, s3, s2
                  fsgnj.s      fs6, ft4, ft1
                  fle.s        s8, fs0, fa5
                  sltu         s3, s0, s10
                  fclass.s     sp, fs4
                  fmax.s       ft10, fs8, fa3
                  sub          sp, t0, a1
                  fcvt.wu.s    s6, ft7
                  ori          t4, t2, -1197
                  srli         t6, s10, 20
                  or           a0, a0, t4
                  lui          sp, 718245
                  xor          a1, s9, s2
                  srai         tp, t4, 17
                  xor          t2, s4, t2
                  sll          t2, a2, a5
                  fcvt.wu.s    s0, fa7
                  fsqrt.s      ft6, ft5
                  fsub.s       fa4, ft5, ft9, rmm
                  sub          s7, a3, s6
                  addi         s11, s10, 1845
                  fmul.s       ft0, fs3, ft10
                  add          s8, s10, tp
                  fcvt.w.s     tp, fa5, rup
                  fmv.w.x      fs5, zero
                  fsgnjn.s     fa5, ft3, ft11
                  mul          a0, s8, s11
                  fsub.s       fa6, fa5, fs0
                  xori         gp, a5, -1618
                  srli         s2, gp, 7
                  fsgnj.s      fa6, ft11, fa5
                  lui          t6, 458019
                  div          t4, zero, a7
                  xori         s3, a5, 1071
                  fsgnjx.s     fs7, ft8, fs5
                  fclass.s     a6, ft4
                  divu         s5, s7, ra
                  addi         s2, a1, 1510
                  sltu         sp, s0, a7
                  mulhsu       s11, s0, sp
                  fsgnj.s      fs9, ft5, fs5
                  fdiv.s       ft7, fa6, fa4, rtz
                  fmin.s       fa3, ft1, ft5
                  xori         a1, s4, 1675
                  feq.s        s2, ft8, fs8
                  fmul.s       ft8, fs9, fa6
                  andi         gp, t3, -2007
                  xori         s8, s2, -678
                  srai         t6, s10, 3
                  auipc        s7, 833299
                  srl          t6, sp, t5
                  add          s3, t0, a1
                  fsqrt.s      ft4, fs10
                  sra          a6, s2, t6
                  slli         t0, gp, 8
                  slt          a1, t3, ra
                  fcvt.s.wu    ft10, s5
                  mulh         t6, s7, gp
                  fdiv.s       fs4, fs4, fa2, rne
                  lui          sp, 883152
                  fmin.s       fs8, fs6, fs4
                  nop
                  xor          a6, zero, t4
                  fcvt.wu.s    t6, fs7, rdn
                  slli         t2, a7, 26
                  divu         s6, t3, s11
                  mul          s6, s3, a2
                  mulhsu       a7, t1, s6
                  rem          t2, a5, sp
                  mul          a0, a2, t5
                  fdiv.s       fs6, fa4, ft6
                  sra          s3, a6, s11
                  fsub.s       ft2, fs8, fs9, rne
                  fmul.s       ft2, fs5, fs4
                  slti         t5, s9, -1110
                  sltu         a0, a5, a2
                  sltiu        s1, s4, -1076
                  srai         s9, t4, 6
                  auipc        a7, 337533
                  srl          s5, a6, gp
                  add          t2, s3, sp
                  fsgnjx.s     fs8, fs5, fs1
                  sltu         s4, s7, t0
                  sra          s9, zero, a0
                  mulh         s6, t0, zero
                  sltu         a5, t0, ra
                  fsgnj.s      fa7, fs6, fa4
                  fsgnj.s      fa5, fa1, ft9
                  div          t6, s5, t3
                  fmin.s       fs0, ft0, ft5
                  flt.s        tp, ft0, ft4
                  addi         a6, t2, -1431
                  mulhsu       s2, t1, a2
                  sltiu        a3, s9, -872
                  ori          a0, a1, 446
                  fcvt.wu.s    t1, ft10
                  fclass.s     a5, ft3
                  srai         a1, t2, 22
                  fsgnj.s      ft5, fa3, fa4
                  fdiv.s       ft6, ft1, ft4
                  fadd.s       fa1, fs2, fa0, rne
                  fmv.x.w      s11, ft9
                  fsqrt.s      fa6, fs4, rdn
                  sll          sp, a5, s2
                  lui          zero, 522069
                  addi         s2, s8, -1413
                  fsgnjx.s     ft8, fs2, fa5
                  sltu         s5, a0, s8
                  slt          s4, tp, gp
                  sub          s8, t2, a6
                  or           s1, a3, t2
                  lui          t1, 171297
                  fsgnjn.s     fa3, ft9, fs4
                  fsgnj.s      fa6, fs1, fs5
                  rem          sp, s5, gp
                  fdiv.s       fa6, fa7, ft1
                  fadd.s       fs1, ft6, ft0
                  fmin.s       fa4, ft9, fs7
                  slli         a3, a2, 8
                  srl          t4, a1, s2
                  xori         t6, t5, -272
                  fcvt.wu.s    t5, fs0, rmm
                  andi         ra, s3, -96
                  fmin.s       ft2, fs11, fa5
                  fcvt.wu.s    s5, fs7
                  sll          s7, s6, tp
                  nop
                  or           s7, a4, t3
                  slt          t1, zero, s1
                  fclass.s     s11, fs0
                  flt.s        t2, fa7, ft8
                  fle.s        t4, ft7, ft9
                  auipc        a3, 447646
                  slti         tp, a7, 1525
                  fdiv.s       fs7, ft10, fa2
                  fclass.s     s0, ft7
                  addi         s4, s3, 1101
                  fsgnjn.s     fa3, ft3, ft8
                  sltu         s5, s2, a1
                  fcvt.s.w     ft5, ra, rne
                  srai         a3, s2, 15
                  div          zero, a7, sp
                  fmax.s       ft3, ft8, fs6
                  rem          s7, s11, tp
                  div          t6, s0, t3
                  auipc        a5, 487139
                  mulhu        s0, s4, s1
                  fmax.s       fa4, fs9, fa2
                  slli         t6, t3, 16
                  mulh         a0, s7, s7
                  andi         s11, t6, -1224
                  srli         a7, sp, 6
                  mulh         t2, s3, s9
                  slt          gp, a2, a2
                  fadd.s       fa5, fs7, ft7
                  fmin.s       ft4, ft0, ft3
                  fadd.s       ft9, fs11, fs2, rdn
                  fmin.s       ft8, fa4, fs1
                  fcvt.wu.s    a0, fs3, rmm
                  nop
                  srli         gp, t3, 23
                  xori         t2, ra, 1959
                  fmin.s       ft2, fa4, ft8
                  sltiu        s9, s2, -423
                  fsgnj.s      fa0, ft0, ft0
                  xori         a3, a3, -522
                  fsgnjx.s     fa2, fa2, ft4
                  srai         s11, tp, 6
                  nop
                  andi         a6, s5, -334
                  remu         t2, a4, sp
                  srl          s3, t6, a0
                  fmax.s       fa3, fa1, ft8
                  fclass.s     tp, fs7
                  remu         s7, a3, t3
                  sltu         s8, sp, tp
                  fsqrt.s      ft11, fs7, rne
                  fdiv.s       fs2, ft1, fs1, rmm
                  feq.s        ra, fs6, fa6
                  sub          sp, s3, a0
                  srli         s1, s8, 3
                  remu         ra, s4, sp
                  slti         a0, a6, -28
                  auipc        a7, 359081
                  fsub.s       ft3, fa6, ft9, rmm
                  slti         s0, s9, -1693
                  and          s9, t0, a0
                  andi         a3, s1, -521
                  fmv.w.x      fs9, t4
                  fdiv.s       ft10, fs2, fs4, rtz
                  ori          t2, s2, -1067
                  auipc        s3, 640768
                  slt          s5, s0, a3
                  fadd.s       ft1, fs10, ft5
                  flt.s        zero, fa4, fa0
                  rem          a6, tp, t6
                  add          a1, a7, zero
                  xor          s11, a7, a1
                  fsgnjn.s     fa7, ft10, ft6
                  rem          s5, s9, tp
                  mulh         s10, t3, s0
                  fcvt.s.wu    fs1, t4
                  mul          s10, a0, s4
                  sub          a3, t3, a1
                  mulh         t5, s2, t2
                  feq.s        s7, fa1, ft3
                  slli         s5, a1, 1
                  srli         t4, s1, 15
                  fsgnjx.s     fa1, fs2, fa3
                  sltiu        a6, s3, 1591
                  fsgnj.s      fa5, fs2, fs4
                  mulhu        t1, s7, t0
                  srli         sp, s0, 14
                  fsqrt.s      ft9, fa2, rne
                  fsgnj.s      fa1, fa0, fa4
                  fmin.s       fs2, fa2, fs9
                  mul          a7, s7, ra
                  fmv.w.x      ft3, s7
                  fsgnj.s      fa6, fs3, fs11
                  fcvt.w.s     t6, ft2
                  remu         a0, s2, t3
                  srai         sp, a0, 23
                  fmv.w.x      fs5, a2
                  div          t4, t5, s1
                  sltiu        a0, t2, -1995
                  fmin.s       fs0, fs5, ft2
                  fclass.s     t2, ft3
                  fmin.s       fs5, fa0, fa7
                  fmax.s       ft11, ft5, ft4
                  rem          t6, t2, ra
                  sra          s9, s4, s2
                  and          a6, a3, s0
                  fclass.s     s2, ft2
                  fmin.s       fs6, fs1, fs3
                  fsgnjx.s     fa5, ft7, ft8
                  fcvt.s.w     ft0, t6
                  ori          s10, s6, -516
                  add          s2, s1, t4
                  ori          t4, a7, -929
                  slti         s7, t4, 1675
                  andi         t1, a0, -1393
                  xori         t5, s8, -101
                  rem          a5, s7, s8
                  slli         s9, s1, 12
                  nop
                  flt.s        s5, fa2, fa0
                  fcvt.w.s     a5, fs1
                  andi         s10, s6, -1209
                  mulhsu       s9, s1, sp
                  divu         s8, s6, s2
                  ori          t2, s3, -1650
                  fadd.s       fa2, fa2, fs4, rup
                  fdiv.s       fa3, fs11, fs7, rdn
                  rem          t6, ra, t2
                  mulhu        s7, t0, zero
                  xor          a6, s9, a7
                  sll          t4, tp, gp
                  andi         s4, s10, -48
                  add          sp, a5, s2
                  sltiu        tp, t2, -44
                  fcvt.w.s     s11, ft1, rmm
                  fmul.s       fs6, ft3, ft3, rdn
                  fcvt.w.s     sp, fs11, rup
                  srli         ra, s3, 0
                  nop
                  fmul.s       fa7, fa3, ft0, rtz
                  fcvt.w.s     ra, fa5, rdn
                  fcvt.w.s     gp, ft3, rdn
                  slti         zero, s10, -1083
                  mulh         s5, s5, s7
                  slti         gp, a1, 957
                  divu         a6, t1, a7
                  slt          s4, s11, a5
                  mulhu        s2, a3, t6
                  sra          s5, sp, zero
                  mulh         t5, t5, a4
                  xor          t1, s5, a3
                  slti         s8, s7, 452
                  slli         t4, s0, 1
                  feq.s        tp, ft5, fs8
                  fmv.w.x      fs1, a6
                  sll          a7, s8, s2
                  sltiu        t4, tp, -1291
                  fmv.w.x      ft11, s5
                  sltiu        s0, s9, -300
                  sra          a6, s4, t5
                  fmax.s       ft3, ft3, ft5
                  fmv.x.w      s9, ft4
                  flt.s        a5, ft11, fa6
                  srli         sp, s9, 9
                  fsgnjx.s     fa7, fs5, fs5
                  fadd.s       fs4, fa4, fs1
                  auipc        s11, 865817
                  auipc        s3, 870271
                  mulhu        t6, s9, t1
                  auipc        s6, 701824
                  mulh         s9, ra, s5
                  fmv.w.x      fs7, a4
                  fsgnj.s      ft11, ft6, ft5
                  flt.s        s10, ft9, fs4
                  rem          t5, s3, s9
                  fsgnjn.s     ft8, fa3, fa5
                  and          ra, t1, t6
                  sltiu        s8, gp, 1481
                  slti         s4, a7, 838
                  sll          t4, t5, s11
                  fmv.x.w      s11, fs11
                  fsgnj.s      ft1, fs3, fs11
                  fle.s        s2, ft8, fs1
                  xor          a7, s11, s10
                  fcvt.wu.s    a7, fs8
                  fclass.s     s7, fs5
                  ori          s8, a3, 1735
                  slli         s6, sp, 5
                  srl          tp, t3, a0
                  andi         s4, tp, -1464
                  divu         s5, a5, s0
                  srli         t0, s7, 11
                  or           zero, gp, t0
                  fdiv.s       ft8, fs10, fs11
                  mulh         a7, s9, s7
                  fmul.s       fa2, fs7, ft8, rmm
                  sll          tp, a1, s5
                  srl          a1, s6, a7
                  srai         a6, a2, 29
                  fcvt.w.s     s3, fs6, rmm
                  sub          t4, s4, t4
                  slli         a1, a4, 5
                  fmv.x.w      s6, fa0
                  divu         t0, t2, a5
                  fsqrt.s      fs4, fa6, rtz
                  rem          t1, a5, s3
                  flt.s        t0, ft4, fs3
                  ori          s8, t6, -1892
                  xor          t5, zero, s5
                  fcvt.s.wu    fs5, t3, rtz
                  fsqrt.s      fa4, fs5, rne
                  slli         s10, s3, 16
                  sub          a7, s11, a2
                  sub          s2, s7, t0
                  fsgnjx.s     ft6, ft0, fs4
                  slli         t5, a7, 11
                  xor          a7, s11, a0
                  rem          ra, a2, a2
                  feq.s        s0, fa5, fs4
                  fcvt.s.w     fa4, tp, rmm
                  nop
                  add          t6, s0, t0
                  fcvt.s.wu    fs2, a7, rtz
                  fsgnjn.s     ft10, ft11, ft7
                  sll          t1, t4, a3
                  srl          t2, sp, s1
                  fmin.s       fa6, ft6, ft6
                  mul          s5, a3, s1
                  fcvt.wu.s    s0, ft5
                  sra          s10, a0, s3
                  fadd.s       fs2, ft4, fa0
                  nop
                  divu         tp, s10, t3
                  slti         s9, t0, 1492
                  remu         sp, s9, zero
                  srl          a5, a5, s1
                  srl          a7, a1, s7
                  div          s6, s8, t0
                  fmin.s       ft11, fs3, fa3
                  rem          s11, a4, s2
                  or           t5, ra, zero
                  fcvt.s.wu    ft7, s5
                  remu         t2, t4, s9
                  fsub.s       fs8, ft3, fs3
                  fsgnjn.s     fs5, fs5, ft3
                  xori         t0, a4, -1015
                  fsgnjx.s     fs9, ft2, ft8
                  flt.s        t6, fa4, fa0
                  sub          s3, s9, a6
                  fsgnjx.s     ft8, fa0, fs5
                  fmul.s       fs7, fs0, fs5
                  sra          s4, s0, s1
                  mulhu        t6, t2, t3
                  fmax.s       ft9, ft0, fa0
                  fcvt.wu.s    ra, ft10
                  mulh         t2, s9, s7
                  fsub.s       fs2, ft7, fa2, rmm
                  fsgnj.s      fs2, ft8, fs11
                  slt          a1, sp, s7
                  fmax.s       fa5, ft5, ft9
                  fdiv.s       fa7, fa2, fs10, rdn
                  flt.s        sp, fs2, fs3
                  rem          s6, zero, t4
                  srai         a1, s3, 28
                  fsgnj.s      ft1, fs5, fs0
                  fmin.s       fa7, ft9, fs0
                  sll          tp, t0, t2
                  srai         s5, s8, 0
                  add          s4, t1, ra
                  remu         s0, s5, s1
                  fadd.s       fa5, ft0, fa0
                  fsub.s       fs4, ft7, fs2
                  mul          zero, s6, a2
                  nop
                  srli         s7, a0, 16
                  fmax.s       fs5, fs11, fa6
                  fsub.s       fs11, ft10, fs0
                  rem          a6, s2, t3
                  fcvt.s.wu    fa3, s5
                  mul          gp, tp, s10
                  sltu         zero, a7, tp
                  nop
                  remu         tp, t5, s1
                  fsgnjn.s     fs4, ft10, ft0
                  and          a6, s0, s4
                  fsgnjx.s     ft2, fa5, fa7
                  xori         gp, a2, -714
                  feq.s        zero, fs7, fs4
                  fsgnj.s      fa4, fa7, fs5
                  fmul.s       fs6, fs0, fa5, rup
                  fsgnj.s      fs7, fs8, fs5
                  slt          a7, ra, s11
                  fsgnj.s      fa1, ft5, fs7
                  srli         a5, a4, 22
                  fmin.s       ft1, fa0, ft2
                  xori         t0, a0, 375
                  feq.s        a3, ft4, ft7
                  feq.s        a0, ft7, fa0
                  sltiu        ra, s3, -1182
                  srai         t2, s0, 15
                  mul          t5, s6, a6
                  and          t2, a1, s0
                  fmv.w.x      fa3, a0
                  fdiv.s       fa6, fa0, fs5
                  sll          s4, a7, t1
                  fcvt.s.w     fs8, s7
                  mul          zero, a5, sp
                  remu         t5, a1, s6
                  ori          s9, s3, 1925
                  sra          s3, a3, tp
                  sub          s3, t4, s11
                  and          zero, t3, t4
                  fcvt.s.w     ft9, zero
                  or           s4, t4, sp
                  sltiu        gp, zero, -1686
                  fmul.s       ft8, fs10, fs7
                  fsgnj.s      fs1, fa7, fs5
                  fdiv.s       ft5, fs7, ft8, rmm
                  addi         s7, a0, -1772
                  mulh         s1, a5, a7
                  lui          s10, 651117
                  lui          s10, 62692
                  mulh         sp, s3, a2
                  sltu         s11, a7, a5
                  mul          s10, a0, a1
                  fmv.x.w      s8, fa1
                  xor          a7, t2, a7
                  fsqrt.s      fs3, ft3, rdn
                  slli         s10, sp, 1
                  ori          s9, zero, -701
                  and          sp, s6, s4
                  sll          a6, a4, s2
                  fclass.s     gp, ft3
                  xori         a3, t6, 694
                  fcvt.s.w     fs3, s0
                  slli         s8, ra, 17
                  sltu         t1, t5, zero
                  fle.s        a6, ft6, ft0
                  fsgnjn.s     ft9, fs2, ft3
                  xor          s0, s8, t6
                  fmv.w.x      fs11, gp
                  nop
                  srl          s10, t3, a7
                  fcvt.w.s     t6, fs2, rdn
                  srl          a5, a3, s11
                  fadd.s       fs0, fs4, ft8
                  sra          s7, t5, t0
                  and          s9, s11, s0
                  xori         t6, tp, -1501
                  xor          a3, s9, s0
                  mul          s6, ra, s7
                  divu         a7, t2, t2
                  addi         sp, a5, 1169
                  fcvt.s.w     ft0, t4
                  fmin.s       fa6, fs7, fa2
                  fdiv.s       ft1, ft5, fs1
                  fdiv.s       fs7, ft6, ft8, rmm
                  fcvt.w.s     s8, fs5
                  fmv.x.w      zero, fs6
                  fsgnjx.s     ft2, fs10, ft2
                  andi         t5, a4, 1009
                  ori          t6, s6, 1706
                  rem          t1, a5, s7
                  fclass.s     a7, fs0
                  sub          zero, s11, t4
                  fmul.s       ft9, fs1, ft10, rup
                  lui          gp, 864212
                  fle.s        a3, fs11, ft6
                  auipc        s4, 441196
                  nop
                  fdiv.s       ft11, ft9, ft1
                  fdiv.s       fa2, fs9, fs11
                  fcvt.s.wu    fs1, t4, rdn
                  mulh         s2, t4, s8
                  fclass.s     a6, ft7
                  fclass.s     a0, fs1
                  sltiu        s3, tp, 548
                  remu         t5, t5, a5
                  add          a5, tp, a0
                  fsub.s       fa4, fa7, fa2, rne
                  slti         s4, gp, 165
                  mulh         s11, gp, t5
                  and          s2, s6, s11
                  sll          t4, sp, s10
                  flt.s        t2, fs3, ft7
                  slt          s3, t6, s2
                  fle.s        t2, ft9, fs9
                  sub          t4, s0, s8
                  fmul.s       fs1, ft11, fa4, rne
                  mulhsu       s4, a1, t4
                  slli         s2, a5, 12
                  and          t4, t1, s0
                  flt.s        a0, fs2, fs0
                  fmul.s       ft2, fa1, ft9, rne
                  slli         a0, tp, 20
                  fdiv.s       fs11, fa7, fs6, rmm
                  fcvt.w.s     ra, ft6
                  xori         t4, a3, -155
                  rem          t0, t0, s10
                  fmax.s       fs8, fa0, ft5
                  mulh         s3, t1, tp
                  fmul.s       ft1, ft6, ft8
                  fclass.s     a5, fs10
                  slli         s2, s4, 8
                  fmv.x.w      a7, ft6
                  mulhu        a7, t2, s3
                  fcvt.s.w     ft3, gp, rtz
                  fclass.s     s7, fa5
                  fsgnjx.s     ft10, fs0, ft10
                  auipc        a3, 798957
                  sra          s10, s8, t4
                  fadd.s       fa3, fs7, fs10, rne
                  fle.s        zero, fa7, ft10
                  fmin.s       ft4, fa2, fs8
                  fcvt.s.w     fa2, a7
                  fsgnj.s      fs9, ft1, fs9
                  fmv.x.w      s9, fs10
                  fmv.w.x      fs10, s4
                  fsgnj.s      fs9, fs7, fa1
                  sll          a3, s4, a6
                  fcvt.s.w     fs5, t4
                  sltiu        t6, s5, 163
                  slt          s2, s8, s0
                  mulhsu       s3, sp, t3
                  srai         ra, a4, 17
                  xor          a7, tp, s11
                  slti         a1, s4, 698
                  slli         s3, s1, 4
                  fcvt.w.s     gp, fs9
                  remu         a3, a7, s11
                  mulhu        a1, tp, s4
                  fsqrt.s      ft5, ft1
                  sra          s3, a1, t4
                  sll          s2, s11, a5
                  fclass.s     t2, ft11
                  fle.s        t6, ft10, fs3
                  fcvt.w.s     a0, fs9
                  fmin.s       fa4, ft9, fa0
                  div          t1, s8, s0
                  slti         gp, t6, -1432
                  fsgnj.s      fa1, ft4, ft2
                  addi         s7, s7, -1766
                  fsgnj.s      fa3, ft2, ft11
                  fcvt.s.wu    fa3, gp
                  divu         s3, s6, t5
                  mulh         a3, a3, a2
                  divu         a0, s8, s4
                  fclass.s     sp, fa3
                  srl          sp, a2, t1
                  fmv.w.x      fs6, a5
                  sra          t4, ra, a4
                  fadd.s       fs3, fa2, fs0, rup
                  fle.s        t1, ft11, fa6
                  fmv.x.w      s6, fa5
                  ori          t2, s0, -605
                  fsub.s       fs9, fs7, fs1, rdn
                  auipc        a6, 539705
                  xor          s8, s5, t5
                  mul          s7, a3, a5
                  and          s6, a1, t3
                  flt.s        gp, fa0, fs6
                  lui          a3, 356387
                  fmv.w.x      fs1, t1
                  fsgnjx.s     fa6, fa4, ft2
                  sltu         a0, t6, a7
                  mulhsu       s0, t4, s2
                  add          zero, t3, s2
                  sra          t4, s1, s5
                  srai         t4, t2, 25
                  lui          a5, 616779
                  sltu         t0, a6, s8
                  fcvt.s.wu    ft4, t4, rup
                  mulhsu       s0, t5, t3
                  lui          s1, 589515
                  fcvt.s.wu    fa4, s0, rup
                  slt          t0, a7, t6
                  slli         s8, t4, 7
                  sll          s0, a5, a2
                  mul          a6, s3, a1
                  fdiv.s       fs3, fs3, fs11
                  fmin.s       ft8, fs4, fa3
                  fmin.s       fs7, fa3, fa0
                  divu         t2, s11, s8
                  xor          tp, a2, s1
                  fsgnjx.s     ft11, fs3, fs3
                  fcvt.w.s     s2, fa1
                  sub          t0, zero, s10
                  srai         a5, s4, 18
                  mulhu        s6, a0, a3
                  fsgnjn.s     ft0, fa0, ft4
                  div          s8, a7, s0
                  fmv.w.x      fs0, a4
                  lui          s4, 254034
                  fcvt.s.wu    fs7, zero, rmm
                  fmax.s       fs9, ft0, fa5
                  rem          ra, a0, s7
                  fadd.s       fs10, fs8, ft5, rne
                  sub          t6, t0, t0
                  fcvt.s.w     fs1, s0, rtz
                  div          s2, tp, gp
                  fsgnjn.s     fa6, ft4, fs8
                  andi         ra, t4, -1050
                  fcvt.wu.s    ra, fs2, rmm
                  srl          s3, a7, tp
                  rem          s3, a2, t1
                  nop
                  slti         s9, s10, -423
                  mulhu        a0, s10, gp
                  nop
                  lui          a0, 1041889
                  nop
                  fcvt.wu.s    s1, ft5
                  mulh         s8, t4, a5
                  remu         t2, s8, gp
                  fcvt.s.w     fs1, s3, rup
                  fcvt.wu.s    a7, fs1, rdn
                  fadd.s       ft7, ft3, fs9
                  fclass.s     a5, fa4
                  fmv.x.w      t4, ft2
                  xor          s6, s2, tp
                  fcvt.w.s     s10, ft10
                  flt.s        t5, ft11, fa2
                  fmv.x.w      zero, ft1
                  ori          tp, a2, -1998
                  fmin.s       fa1, fa2, ft0
                  slt          gp, a1, t5
                  andi         s6, s5, -22
                  fcvt.s.wu    fs9, t4
                  fmax.s       fa0, fs6, fa2
                  fdiv.s       ft2, fs3, fa1, rup
                  fle.s        gp, fa6, ft8
                  addi         sp, a7, -1871
                  fcvt.wu.s    a1, ft2, rne
                  fdiv.s       fa2, fa0, ft3
                  fcvt.w.s     t0, ft11, rtz
                  fclass.s     t5, fs8
                  nop
                  fmv.w.x      fs11, t5
                  remu         s7, s6, s1
                  fmv.x.w      s4, ft8
                  fmax.s       fs7, ft10, fs11
                  fcvt.s.w     ft1, s7
                  fcvt.s.wu    ft8, s3
                  slt          zero, t6, a5
                  andi         s10, ra, -535
                  fcvt.wu.s    a5, fs10, rup
                  xori         s8, s4, -2026
                  auipc        a3, 223697
                  feq.s        s10, fa3, fs9
                  sltiu        t1, s0, -1077
                  fmin.s       ft6, fa7, fa3
                  flt.s        s2, ft4, fs8
                  mulh         zero, t6, sp
                  fle.s        s7, fs11, fa7
                  srl          zero, s5, gp
                  fcvt.s.wu    fs1, s3
                  slli         tp, t4, 29
                  fle.s        ra, ft11, fa2
                  xori         s10, gp, -265
                  ori          t2, s5, -1190
                  slti         a1, s6, -415
                  feq.s        sp, ft0, ft1
                  fdiv.s       fa2, fs2, fa0, rne
                  mulhu        sp, a6, t3
                  fsgnjn.s     fa6, ft5, fa0
                  fmax.s       ft10, fs5, fa0
                  fmax.s       ft4, ft4, fa0
                  fmin.s       ft2, ft2, ft7
                  fclass.s     s1, ft9
                  mul          t1, s9, zero
                  fclass.s     s3, ft11
                  fmv.w.x      fa5, gp
                  mulhsu       sp, s9, tp
                  fcvt.wu.s    t5, fs5, rtz
                  sub          t6, s0, t4
                  mulhsu       s9, s1, t2
                  srl          a3, t1, a6
                  fmul.s       ft8, fs11, fs0
                  fdiv.s       ft11, fs7, fa6, rup
                  fcvt.wu.s    s0, fa1, rne
                  xori         s5, s11, 1375
                  ori          t6, s5, 587
                  fmax.s       fs6, fa5, ft11
                  andi         s5, t1, 1237
                  or           t4, t4, s4
                  ori          t6, s2, -102
                  divu         a3, sp, a3
                  fsqrt.s      fa6, fs0, rup
                  fsgnjx.s     ft8, ft4, ft6
                  fcvt.s.w     fa3, t0, rup
                  fclass.s     t1, ft1
                  fsgnjn.s     fs9, fs10, fa3
                  nop
                  fmin.s       fs10, fa1, fs8
                  fadd.s       ft3, ft6, fs9
                  fmax.s       fs3, ft10, ft2
                  andi         a0, s0, -1815
                  mulhsu       t6, s1, a3
                  xori         s3, t4, -1541
                  srli         s6, a6, 10
                  fadd.s       ft3, fs6, fs2
                  fmv.w.x      fs0, s3
                  divu         t1, zero, s11
                  or           s9, a6, zero
                  srai         s1, a5, 15
                  srli         s5, t4, 28
                  divu         t4, tp, a4
                  and          a5, t3, a2
                  fsub.s       fa7, fa2, fs4, rdn
                  fcvt.w.s     a0, fs10, rmm
                  mulhu        t5, zero, sp
                  xori         s1, t1, 150
                  fmv.w.x      fa2, s9
                  fmin.s       fs11, ft7, ft0
                  feq.s        tp, fa6, fs3
                  slli         tp, t2, 12
                  rem          a6, a7, a6
                  fsgnjn.s     ft7, ft8, fs3
                  mulh         s10, s0, s4
                  mulh         t0, t6, a3
                  fsub.s       ft9, ft7, fs3, rup
                  fadd.s       ft4, ft11, fs1, rdn
                  and          gp, tp, a5
                  fcvt.s.w     fs1, t0, rmm
                  fsgnj.s      fs9, fa1, fa2
                  sll          s5, s10, t1
                  fmv.w.x      fs8, s3
                  sra          s0, s9, s5
                  fcvt.wu.s    s7, fa4, rup
                  feq.s        ra, ft11, ft0
                  fmul.s       ft5, fs7, fa5
                  ori          sp, s4, -1829
                  fsgnjn.s     fs2, ft6, ft7
                  feq.s        s8, ft11, fs1
                  fadd.s       fa5, ft9, fa4, rdn
                  fsgnjn.s     fs7, ft5, ft2
                  fle.s        a1, fa5, ft11
                  add          t2, t3, s2
                  fcvt.s.wu    ft5, sp, rmm
                  srli         gp, a2, 26
                  fcvt.s.w     fa0, a0
                  slt          tp, a2, t6
                  lui          tp, 400341
                  fcvt.s.w     fs11, t2, rtz
                  srli         s5, a3, 26
                  srl          s8, t4, t3
                  mulhu        a5, s1, t2
                  fsgnjn.s     ft4, fs5, fs8
                  fmax.s       fa0, fa6, ft1
                  fmv.w.x      fs1, s0
                  slli         sp, s0, 24
                  fsgnj.s      ft10, ft8, fa4
                  sltiu        t0, t3, 1917
                  fsub.s       fs0, ft1, fs6
                  fmv.x.w      t1, fs3
                  fsqrt.s      ft1, fs11, rdn
                  sub          s6, t5, s5
                  mulhu        tp, a1, s4
                  xori         a5, t0, -321
                  fdiv.s       fs3, fs1, ft0
                  fsgnjn.s     ft10, ft7, fa0
                  or           s11, a3, s10
                  sltiu        gp, a3, -1191
                  fmin.s       fs6, ft5, ft5
                  fmv.x.w      s7, fa0
                  remu         t2, s11, s9
                  fadd.s       ft3, fs11, ft7, rup
                  fcvt.wu.s    a6, ft0, rdn
                  sltu         a3, tp, t5
                  sltiu        gp, t6, 200
                  fadd.s       fs0, fa7, ft0
                  add          a6, a0, zero
                  fcvt.s.wu    fs1, s5
                  ori          s7, t0, -1553
                  feq.s        a1, fs9, fa5
                  fadd.s       ft4, ft0, ft6, rmm
                  div          tp, a5, s2
                  fcvt.w.s     t0, fs7
                  fclass.s     sp, fa4
                  sll          a0, a5, s7
                  fcvt.w.s     s2, ft3, rmm
                  srl          s6, s7, t2
                  fmv.x.w      s0, ft10
                  fdiv.s       fs0, fa3, fa5
                  srai         t5, a2, 4
                  fmv.w.x      fs8, a0
                  slt          s10, t5, s8
                  sub          t1, s5, s1
                  feq.s        a1, fs9, fs6
                  sltu         a1, t5, a6
                  fmin.s       ft10, ft6, fs5
                  fsqrt.s      fs6, ft8
                  and          a7, s0, sp
                  sltiu        s0, s6, -1521
                  fsgnjx.s     ft10, fa1, fa5
                  mul          s8, s8, s3
                  lui          s10, 322160
                  ori          s6, a0, -780
                  sra          t5, s6, s10
                  fmv.w.x      fa1, a1
                  sltiu        s8, tp, 871
                  fmv.w.x      fa0, a7
                  fmv.w.x      fa1, t5
                  divu         a1, s8, s8
                  sra          sp, s0, s4
                  fmax.s       fs4, ft7, ft11
                  mul          sp, gp, a3
                  fcvt.s.wu    fa5, a1, rmm
                  fsqrt.s      fa7, ft4
                  auipc        a5, 434516
                  fmv.w.x      fs6, t6
                  mulhu        t2, a7, tp
                  mulhsu       t2, s8, t3
                  addi         t5, tp, -1346
                  sltiu        gp, t5, 349
                  add          s9, a1, t4
                  flt.s        zero, fs4, fs8
                  or           s5, s4, t2
                  sltiu        s11, s8, 1440
                  fcvt.wu.s    t4, fa5, rne
                  srl          a3, a3, s0
                  sll          zero, t5, s11
                  mul          t4, s2, t2
                  and          t4, a5, s6
                  fmv.w.x      fs6, sp
                  mulhsu       s11, a7, a6
                  rem          ra, s10, zero
                  xori         s10, a6, -1596
                  feq.s        s3, ft4, fs6
                  sra          ra, s4, a1
                  fcvt.s.wu    fa2, t6, rtz
                  slli         s9, a1, 24
                  or           s0, a1, s8
                  mulhu        t1, a5, s4
                  or           s6, s10, s10
                  fcvt.w.s     s1, fs3
                  or           s6, a1, a2
                  fmv.x.w      a0, ft9
                  fsub.s       fs3, ft1, ft2, rne
                  srli         t0, a7, 29
                  fclass.s     a1, fs1
                  addi         s10, t2, -808
                  fmv.w.x      fs5, zero
                  fsgnj.s      fs10, fa1, fa0
                  mulhu        s8, s8, t3
                  rem          t2, t5, s8
                  slt          s3, s8, s1
                  sll          s3, t1, a0
                  fsqrt.s      fs4, fs11
                  ori          s4, a7, 1482
                  srli         t0, zero, 18
                  fsub.s       fs8, fa0, fs6
                  nop
                  fmv.w.x      fa6, s4
                  fmin.s       fs5, ft1, fs8
                  srl          a6, s2, a1
                  fcvt.wu.s    t0, fa5
                  mul          s6, t6, s3
                  sltiu        a1, a7, 1030
                  andi         t2, s10, -1663
                  fle.s        s11, fs7, fa0
                  mul          a6, a6, zero
                  fsgnjx.s     fs11, fs11, fs11
                  sub          s9, tp, ra
                  slli         a5, a5, 28
                  slti         s11, s6, 425
                  sll          a3, t1, t4
                  fmul.s       fs8, ft3, fs4
                  fclass.s     a6, ft9
                  fcvt.w.s     s10, fs7, rup
                  slli         s3, s9, 5
                  fmin.s       fs0, ft11, fs1
                  feq.s        s0, fs11, ft2
                  sltu         s0, a4, s8
                  flt.s        a5, fs11, fa7
                  divu         a3, s7, s2
                  addi         t2, t0, 1989
                  fcvt.w.s     t0, fs0
                  and          ra, t6, t2
                  fsgnjx.s     fa7, fs1, ft9
                  fcvt.wu.s    t2, fs4
                  fmul.s       fs4, fa5, fs4, rup
                  remu         a3, t3, a2
                  div          s4, a4, s3
                  addi         s6, t1, 1655
                  srl          gp, s10, sp
                  slli         a3, a1, 13
                  divu         a5, t4, a6
                  fmax.s       ft11, fs3, ft0
                  fmv.x.w      s5, fs7
                  sub          s4, s5, a5
                  fsqrt.s      ft9, fs2, rtz
                  fmin.s       ft7, ft10, fs5
                  fmv.x.w      t4, ft10
                  sltu         tp, s9, s0
                  srai         s8, s7, 27
                  fmv.w.x      fa6, a3
                  or           s6, s9, t5
                  sll          t6, zero, t2
                  mul          sp, t0, a7
                  add          zero, a4, zero
                  fmv.w.x      ft4, s10
                  mul          s8, s8, s1
                  slli         a5, a3, 3
                  fcvt.s.w     ft5, ra
                  fmv.x.w      s7, fs3
                  or           s5, s0, zero
                  fle.s        t5, fs6, fs6
                  mul          t5, tp, t5
                  fmax.s       ft0, ft5, fs0
                  xori         s9, s7, 1135
                  feq.s        s9, fa5, fa6
                  slti         a0, a7, 1716
                  lui          tp, 751454
                  remu         a3, a7, a2
                  fmv.x.w      sp, fs5
                  flt.s        s3, fs11, ft1
                  sll          t0, s5, t4
                  mulh         a3, s3, s6
                  mulh         gp, gp, a1
                  sltu         t5, a7, t2
                  feq.s        s6, fa0, ft2
                  sll          a1, t4, a3
                  fcvt.s.wu    fs9, t1, rtz
                  sltu         s3, t4, t0
                  remu         s7, a2, s7
                  divu         s7, a4, s11
                  addi         s6, a5, 73
                  fsgnjn.s     fs8, fa2, ft1
                  fmul.s       ft5, fs8, ft8, rtz
                  divu         a5, s4, a2
                  srai         s0, s6, 19
                  div          s3, s4, a1
                  slt          t0, gp, ra
                  remu         a3, t2, t1
                  fmul.s       fs0, fa7, fs11
                  xor          s8, zero, s7
                  xori         s10, a4, -1449
                  addi         a7, t6, -1652
                  mulhu        s0, a2, ra
                  mulhsu       zero, s6, s6
                  srl          a5, s8, a4
                  fsqrt.s      fa5, ft11
                  sub          s2, t2, t1
                  ori          a5, a0, 899
                  fcvt.wu.s    t4, ft6, rdn
                  andi         sp, a5, -630
                  lui          s8, 562419
                  fcvt.s.w     fa2, a7, rne
                  slt          t4, s11, a7
                  auipc        s5, 759566
                  fsqrt.s      fs11, ft0, rmm
                  andi         a1, gp, 5
                  sub          s5, t2, t4
                  div          s1, gp, s1
                  fadd.s       fs8, ft10, fs2
                  fclass.s     s8, ft6
                  fmax.s       ft1, fs11, fs3
                  mulhu        s0, gp, s5
                  slli         t4, a7, 22
                  slli         t4, tp, 28
                  fclass.s     t6, ft10
                  lui          a3, 1035175
                  fclass.s     t6, fs11
                  sub          t1, s4, a4
                  mulhu        t2, s10, s7
                  srli         t1, s6, 0
                  srai         tp, t1, 30
                  feq.s        sp, fs2, fs1
                  sltu         t6, zero, t0
                  xori         a5, s5, 1390
                  fsgnjx.s     fs4, ft0, ft5
                  mul          tp, t4, t2
                  slli         s0, s4, 18
                  fcvt.wu.s    s0, ft7, rmm
                  andi         ra, a4, -1307
                  fmin.s       ft11, fa3, fa1
                  mulhsu       s6, ra, a4
                  sub          t0, t5, a0
                  ori          tp, a5, -432
                  add          t5, s6, a0
                  fsgnjn.s     ft4, fa0, ft10
                  fmv.w.x      ft3, a4
                  or           a7, a1, a7
                  fsgnjx.s     fs7, fs11, ft8
                  sll          s0, t4, a7
                  fmul.s       ft9, fa4, fa7, rdn
                  flt.s        s11, fa4, fs10
                  srli         s6, s0, 2
                  flt.s        s7, ft4, fs11
                  div          a0, t0, a2
                  srl          zero, s2, t3
                  fmv.w.x      fa3, t4
                  flt.s        t2, fs5, fa7
                  fcvt.wu.s    gp, fs6
                  slt          a3, s11, t4
                  srli         tp, t2, 31
                  fcvt.wu.s    a0, fs1, rup
                  fle.s        s0, ft4, fs5
                  divu         a7, s11, a7
                  add          s10, a4, gp
                  fsgnjn.s     fa7, ft0, ft5
                  auipc        s8, 991657
                  sub          t1, s4, a2
                  slli         ra, gp, 8
                  sra          s10, s9, gp
                  andi         a0, s10, 523
                  divu         tp, sp, t1
                  fsub.s       fa7, ft3, ft0, rmm
                  xori         ra, t0, -1119
                  addi         s11, t3, -1034
                  mulhu        gp, sp, s0
                  and          s9, tp, a5
                  flt.s        s4, fa5, fs5
                  fsqrt.s      fs8, fs3
                  auipc        a5, 1028389
                  mul          s7, s4, s1
                  and          ra, t4, a4
                  fmax.s       fa2, fs9, fa5
                  fmv.x.w      s5, fs5
                  add          t0, s11, s10
                  sub          a0, tp, t0
                  mulhsu       s3, s11, s10
                  fsgnj.s      fs2, fs8, fs8
                  fmv.x.w      s7, fs7
                  slli         a1, t5, 31
                  sll          gp, tp, s5
                  fsgnjx.s     ft3, fs7, fa2
                  fsqrt.s      ft11, fa2
                  nop
                  sll          a1, s0, t0
                  fcvt.wu.s    s5, ft5, rup
                  fmin.s       ft3, fa2, ft7
                  srai         s5, s3, 27
                  mulhu        t5, a1, s4
                  fsub.s       fs8, fs7, fa1, rtz
                  srl          t6, s3, s5
                  fmv.x.w      a0, fa1
                  srli         t2, s4, 18
                  slti         a7, s5, -304
                  mulhsu       s8, ra, a4
                  mul          t6, gp, t6
                  and          a0, t6, t3
                  divu         s6, a6, t6
                  srl          s9, s9, t2
                  mulh         t2, s8, s8
                  srl          t0, s10, sp
                  sltiu        t1, tp, 1083
                  fsub.s       fs11, fs1, fs9, rne
                  fcvt.wu.s    a6, fa0, rmm
                  fsub.s       ft10, fs7, fs10, rup
                  fadd.s       fs1, fs1, ft1, rup
                  flt.s        a7, fa4, fs1
                  slli         s3, s6, 6
                  sub          s9, s0, s8
                  fadd.s       fs2, fs10, fa3, rtz
                  add          a7, s9, s8
                  sub          s2, s1, a1
                  remu         s5, s7, a6
                  fle.s        t5, ft7, fa2
                  fcvt.s.wu    fs6, s7
                  add          a6, a0, a4
                  sltu         a1, a1, s11
                  sra          tp, gp, t5
                  and          a6, zero, ra
                  sra          t5, s0, t4
                  srai         s2, s11, 24
                  fle.s        s0, ft1, ft0
                  xor          s8, sp, s10
                  feq.s        s1, ft7, fs3
                  ori          t6, s10, -1606
                  fsqrt.s      fs4, fa4, rup
                  fmul.s       ft0, ft10, fs8
                  andi         s3, a4, 1507
                  feq.s        a6, fs4, fs1
                  auipc        s0, 110482
                  fmax.s       fa7, ft2, ft5
                  auipc        sp, 511223
                  fle.s        t0, ft3, fs4
                  mulhsu       a6, tp, s3
                  slli         s7, t2, 8
                  fcvt.wu.s    a6, fa3
                  srl          t4, t2, s7
                  add          a5, tp, s10
                  sub          t1, s9, s2
                  addi         s6, t2, -1275
                  fcvt.s.wu    ft1, a0, rtz
                  fmv.x.w      t6, ft9
                  slt          a3, t6, a6
                  fmax.s       fs5, ft1, fa7
                  srli         a0, zero, 27
                  slti         gp, a7, 1690
                  mulhu        t2, zero, s10
                  srl          s4, s4, a4
                  fmul.s       fa7, ft4, ft0
                  slti         s5, s3, 1975
                  or           gp, t2, a2
                  or           a3, t2, s4
                  mulh         s1, a3, t3
                  sub          zero, s8, s10
                  auipc        s1, 98021
                  and          a0, a7, s6
                  slti         t1, a6, -725
                  sra          t4, a5, s4
                  divu         a7, t3, t2
                  or           gp, a4, t1
                  add          a3, a3, ra
                  fmax.s       fa5, fs9, ft11
                  srli         a0, t6, 12
                  ori          a5, a4, 1076
                  fsgnj.s      fs0, fa5, fa7
                  div          s5, a7, t2
                  fsub.s       fs10, fs2, ft6, rdn
                  sltiu        t2, t3, 784
                  mulhu        s6, t4, zero
                  srli         s4, t1, 19
                  fcvt.w.s     s11, fa0, rtz
                  fmul.s       fs0, ft0, fa0, rup
                  fmv.x.w      t1, fa5
                  mulhu        s4, a6, a7
                  xor          t1, a2, s0
                  fdiv.s       ft11, fs6, fa4
                  and          s10, s6, zero
                  sra          sp, s2, a1
                  fsqrt.s      ft0, fs0
                  fcvt.s.w     fs9, a0
                  fadd.s       fa1, ft7, ft3
                  addi         a1, gp, 2027
                  fsgnjx.s     fa2, fs6, fa5
                  lui          s0, 509848
                  andi         s0, t5, -1227
                  feq.s        a5, ft10, fs9
                  fcvt.s.w     fs8, s6, rmm
                  fsgnj.s      ft11, ft11, ft1
                  auipc        a6, 63775
                  sll          ra, a3, s7
                  fmv.w.x      ft6, gp
                  fsgnj.s      ft6, ft7, fa7
                  xor          a7, s2, t1
                  remu         a1, s5, a4
                  addi         gp, t0, 1368
                  fcvt.w.s     ra, ft11, rtz
                  fsgnjn.s     fa5, ft4, ft9
                  or           s3, s5, a2
                  mulh         s2, s2, gp
                  sub          t2, a0, t6
                  mulhu        s6, zero, gp
                  xori         s9, s9, 439
                  fcvt.s.wu    ft0, t4
                  andi         zero, a6, -50
                  srl          s1, t6, t2
                  fcvt.s.wu    ft10, s10
                  sll          s4, s1, s1
                  fmul.s       ft2, ft4, ft0, rdn
                  remu         ra, t2, s11
                  fadd.s       fs5, fs4, fs3
                  divu         t6, a1, s6
                  srl          a7, tp, a3
                  div          s5, t4, s2
                  fadd.s       ft2, ft2, fa6, rmm
                  fmv.x.w      t0, ft6
                  add          s4, t1, t5
                  or           a5, a2, a6
                  sub          a3, s11, tp
                  fsub.s       ft10, fs3, fa2
                  sltiu        t6, tp, -743
                  fmul.s       fs5, fa6, ft9
                  sra          t4, s11, s10
                  div          s3, a1, sp
                  fmv.x.w      s5, ft8
                  srli         s3, s2, 7
                  slti         ra, s1, -1977
                  sltu         s10, t4, a5
                  sub          s5, s1, s5
                  fsgnjn.s     ft3, fs0, fs10
                  slt          t6, t6, s10
                  fsgnjn.s     ft2, fs10, ft9
                  rem          t5, s1, a2
                  mul          a6, tp, t4
                  xori         s3, a4, -870
                  and          s11, t0, sp
                  fclass.s     t2, ft5
                  mul          s4, a1, sp
                  fcvt.w.s     t0, ft11
                  fcvt.w.s     s10, fa4, rne
                  fsqrt.s      fs11, ft10, rmm
                  srl          s3, s5, a1
                  mulhsu       s1, s9, s11
                  sra          s0, s4, s4
                  xor          s2, s5, s7
                  slti         t2, s7, -311
                  srli         s6, s8, 5
                  slt          s11, t3, s0
                  sltu         a3, t3, sp
                  mul          a6, s8, t5
                  srai         t1, s10, 12
                  div          s3, t0, s7
                  slt          s0, s0, s6
                  srl          s0, ra, s10
                  fle.s        a6, ft1, fs10
                  sltu         s4, s2, gp
                  sltiu        a5, a6, -521
                  andi         s11, t1, 781
                  fmul.s       ft7, fa1, ft1
                  rem          a1, a0, s11
                  mulh         a7, a0, a1
                  mul          s0, t3, t4
                  slti         a1, t1, 121
                  fmv.w.x      ft8, zero
                  mulhsu       a0, a7, a1
                  mulhu        s10, s2, s1
                  fsub.s       fs0, ft5, fs7, rne
                  sll          ra, sp, t4
                  fmv.x.w      ra, fa6
                  nop
                  or           s7, s2, a6
                  fdiv.s       fs2, fa0, ft9
                  slt          s3, s3, t3
                  fsqrt.s      ft6, fs0, rdn
                  fmax.s       ft0, fa1, fs6
                  fcvt.wu.s    tp, ft8
                  fdiv.s       ft9, fs5, fs0
                  slt          s6, s6, s4
                  fsgnjx.s     fs7, ft5, fa7
                  nop
                  fsgnjn.s     ft2, fs3, fa0
                  fle.s        s4, fs4, ft7
                  fcvt.w.s     s10, fs5, rtz
                  sll          s8, t1, t6
                  fcvt.s.w     fs7, s9, rdn
                  xori         t2, a6, 576
                  mulhu        s3, s4, s0
                  lui          s8, 51019
                  remu         a3, s0, s4
                  mulhsu       s10, a7, a3
                  slli         ra, s2, 22
                  fsgnjn.s     fs5, fa0, ft6
                  andi         s10, t6, 291
                  fmul.s       fa1, fs8, ft8, rdn
                  addi         s6, a4, -931
                  fcvt.s.wu    fs9, zero
                  sltiu        s5, s10, -1349
                  or           s0, ra, s3
                  mulhu        s4, s10, a5
                  lui          s4, 468761
                  andi         a1, s7, -1379
                  divu         t0, s7, a2
                  remu         s5, a1, a7
                  mul          a5, sp, zero
                  or           a7, s11, s1
                  fadd.s       ft11, fa5, ft8
                  fle.s        tp, ft11, ft1
                  mulhu        t2, t0, a7
                  fmul.s       fa6, fs2, ft6, rtz
                  srl          t1, t5, t1
                  fsub.s       ft7, ft9, ft5
                  srai         a5, s10, 19
                  fmin.s       fs8, fs0, ft0
                  auipc        t5, 161245
                  fle.s        s8, ft2, fs1
                  lui          zero, 286023
                  remu         s10, t2, gp
                  sra          tp, s0, a3
                  rem          s0, a0, a6
                  fmin.s       fa6, ft11, fs6
                  lui          a6, 182628
                  mul          a5, s5, a1
                  fsgnjn.s     fa1, fa6, ft7
                  fsub.s       fs1, fs5, fa0, rne
                  xor          t5, s8, a6
                  or           t1, t3, t4
                  rem          t5, t6, s1
                  mulh         s11, a1, tp
                  fmv.x.w      s4, fa7
                  sltiu        a3, s1, 1493
                  srai         t4, s9, 30
                  fsgnjx.s     ft11, fa1, ft4
                  mul          a6, t3, s7
                  sltiu        a6, sp, 217
                  fcvt.s.wu    ft2, s9, rtz
                  sltiu        s7, t6, 1451
                  slti         t5, s10, -1808
                  div          t5, s9, s9
                  fsgnjx.s     fs6, fs10, fs7
                  mul          s0, s7, tp
                  nop
                  fsgnjn.s     fs1, fs5, fa6
                  divu         s8, s1, s6
                  fsub.s       fs10, fs6, ft0, rmm
                  rem          a1, s10, s11
                  fcvt.s.wu    fs1, t1, rdn
                  ori          s2, s5, -1622
                  xori         t6, s10, -73
                  fcvt.s.wu    fa3, t1, rtz
                  fmul.s       ft6, ft3, ft9
                  fdiv.s       fa0, fs1, fs1
                  fsgnj.s      ft3, ft8, ft8
                  fsgnjx.s     ft2, fa6, fs1
                  xor          s1, s11, a6
                  or           a5, s7, a0
                  mulh         s9, t6, a1
                  addi         zero, s0, 284
                  fmin.s       ft5, ft11, fs8
                  sll          gp, s0, s1
                  fle.s        t1, fs8, fs10
                  sll          s4, s5, ra
                  fmv.w.x      fs6, t3
                  mulh         s9, s1, s1
                  sra          a3, s9, sp
                  sub          a7, t6, sp
                  feq.s        a5, fa3, fs4
                  fsgnjn.s     ft3, fs9, fs6
                  fadd.s       fa7, ft11, fa1, rup
                  sub          a3, gp, tp
                  xori         s8, a1, -1608
                  srli         zero, a3, 24
                  fadd.s       ft4, ft2, ft3
                  auipc        s5, 162365
                  xori         a6, a3, -1612
                  mulhu        t0, s0, t3
                  fadd.s       fa3, ft11, fa5, rne
                  fdiv.s       ft7, fs0, fs0, rmm
                  mulhu        a1, s10, a0
                  remu         gp, t5, t5
                  slti         s0, s11, 600
                  xor          t4, s5, t3
                  fmax.s       ft5, ft4, fa5
                  mulh         s0, s6, a5
                  fmv.x.w      t4, fs0
                  fsgnjx.s     fa2, fa5, ft7
                  fcvt.s.w     fa1, t4
                  div          t4, t5, t1
                  fcvt.s.wu    ft8, s4
                  slti         a5, a1, -1508
                  fcvt.s.wu    fs6, s10, rmm
                  fmax.s       fs4, ft8, ft4
                  fclass.s     gp, fa0
                  fmv.w.x      fs3, s4
                  sltu         s7, s7, s5
                  fsgnjn.s     fa0, ft8, ft0
                  fdiv.s       ft0, fa6, ft0
                  sltiu        sp, s2, 907
                  fmul.s       ft9, fs4, ft1
                  mulh         gp, a1, t5
                  mulh         s1, s1, gp
                  fdiv.s       fa1, ft7, ft5
                  nop
                  fle.s        t2, fa4, ft4
                  sltiu        s7, s11, -1813
                  fsgnj.s      ft4, fs8, fa0
                  fle.s        s7, ft5, ft3
                  slt          s11, gp, ra
                  fclass.s     gp, fs2
                  mulh         s4, s10, ra
                  fmv.x.w      s7, ft0
                  fmin.s       fs7, fa6, ft8
                  sub          s5, s3, t1
                  remu         s9, a3, a3
                  sra          s10, s10, t1
                  fsgnjx.s     ft2, fa4, ft3
                  and          a7, s8, t0
                  slti         t2, t4, 1537
                  srli         s8, a5, 14
                  flt.s        s1, ft1, fs10
                  sltiu        t5, t0, -93
                  sra          ra, t2, s0
                  fsub.s       ft6, ft2, ft5
                  add          s6, t5, s8
                  xor          ra, t1, ra
                  mulh         s5, s4, s1
                  add          s1, t3, s0
                  slti         t2, s2, 33
                  sltiu        sp, s9, 1157
                  slli         s4, s7, 4
                  slli         a7, s3, 8
                  xori         s7, a0, -72
                  fsqrt.s      ft5, fs11, rmm
                  sltu         t6, a1, a2
                  slli         gp, ra, 12
                  mulh         s2, sp, t4
                  fsgnjn.s     fs3, ft0, ft4
                  srl          s10, s2, s5
                  sltiu        s9, a0, 1616
                  mulh         a1, t1, s4
                  fsgnj.s      ft9, fs6, ft5
                  fsgnjn.s     fa0, ft7, fa4
                  div          s8, ra, s1
                  xor          t4, a5, sp
                  mulhu        a6, s6, t6
                  fsgnjx.s     fs3, fa7, fa6
                  srli         s6, s1, 9
                  fcvt.s.wu    ft9, a6
                  flt.s        s4, fs7, fs0
                  sub          s9, a2, sp
                  fsub.s       fa7, ft3, fa7, rmm
                  fcvt.s.wu    ft0, t1
                  fsgnjn.s     fa5, ft11, fa0
                  xor          t6, a4, s6
                  sll          s5, tp, tp
                  fmul.s       ft11, fs2, fa4
                  fle.s        a6, ft7, fs11
                  sub          s0, t2, tp
                  auipc        ra, 646353
                  fmin.s       fs10, ft7, fs3
                  sltu         s1, t6, s8
                  andi         s8, a7, 1779
                  and          a5, t0, s10
                  fmax.s       ft1, fs8, ft1
                  sltiu        s11, t0, 294
                  feq.s        t2, fa1, ft3
                  sll          a1, a2, ra
                  slt          t1, s11, s4
                  remu         t1, a1, a4
                  fclass.s     s9, ft8
                  fdiv.s       fa0, fs6, ft6
                  fdiv.s       fs9, fa3, ft4
                  sltiu        ra, a2, -1656
                  srl          t4, a4, a5
                  fadd.s       ft6, fs1, fa1, rne
                  fdiv.s       fa1, fs6, fs9, rtz
                  slt          tp, a7, s11
                  fsqrt.s      fa2, fs0
                  xori         s2, t0, 86
                  fcvt.s.wu    fs10, a5
                  sra          s10, t3, a5
                  fsgnjx.s     ft2, ft9, ft4
                  auipc        s4, 432518
                  and          s10, ra, t3
                  addi         t4, a1, 408
                  slti         s2, s2, -1215
                  mulh         s5, a5, t3
                  srai         sp, s6, 20
                  andi         s11, a6, 1198
                  srli         s9, t1, 2
                  sra          a0, a6, t4
                  lui          s1, 945547
                  srl          ra, s7, t1
                  fsqrt.s      fa5, ft1, rup
                  fmax.s       ft9, ft9, fa5
                  sltu         t6, s10, a2
                  fsgnjx.s     ft0, ft7, fa7
                  auipc        tp, 367093
                  remu         t4, a5, s10
                  fsgnj.s      fa2, ft11, ft9
                  fcvt.wu.s    s11, fs9
                  addi         s9, a0, 1156
                  fsqrt.s      fa1, ft5, rmm
                  sll          s5, a5, a5
                  slli         t6, t2, 9
                  mulhu        s4, t5, a7
                  sltiu        s9, t2, -100
                  srai         a7, a2, 21
                  srl          s5, zero, t3
                  sll          t0, s4, s9
                  ori          s3, sp, 1290
                  remu         tp, s8, a5
                  lui          ra, 705194
                  fmv.x.w      s11, fa3
                  div          s0, s8, a4
                  addi         s4, a5, -226
                  or           t4, t0, a0
                  fadd.s       fa2, fs3, ft1, rmm
                  fmv.w.x      ft2, a0
                  divu         s1, s3, ra
                  fclass.s     a1, fs1
                  fsgnjx.s     ft4, fs11, fa1
                  remu         s5, a0, s2
                  srl          a1, s5, a6
                  or           t5, s1, t0
                  sub          a3, s3, a2
                  auipc        s11, 831580
                  xori         s1, t6, -1732
                  fmv.x.w      sp, ft8
                  sra          zero, a5, gp
                  sub          sp, t0, t1
                  fsgnjn.s     fs9, fa4, ft2
                  fdiv.s       ft10, fs9, ft1, rup
                  or           t6, a6, a7
                  fsgnjx.s     fs4, ft4, fa4
                  fsgnjx.s     fs5, fs6, fa0
                  sub          tp, a1, a2
                  fmv.w.x      fs0, ra
                  remu         s11, a3, gp
                  mulhu        s5, zero, a2
                  and          a5, s0, s7
                  fsub.s       fs6, fs2, ft10
                  mul          s1, gp, tp
                  sra          a6, t0, s0
                  andi         s2, a2, 1516
                  ori          s1, s7, 729
                  or           t1, a5, s6
                  fsqrt.s      fs2, fs4, rne
                  srai         s5, a3, 15
                  fmul.s       fa3, ft4, ft0
                  srai         t6, a0, 29
                  rem          s8, gp, a7
                  fsgnj.s      ft9, fs1, ft2
                  fcvt.s.wu    fs4, s9
                  fsgnj.s      fa6, ft7, ft3
                  fmax.s       fs8, ft1, ft10
                  slli         a7, s11, 27
                  mulh         sp, zero, a5
                  fdiv.s       fa0, ft1, fa0, rne
                  fle.s        t2, fa2, ft6
                  sra          s9, s8, t0
                  flt.s        gp, fa5, ft2
                  addi         a6, ra, -1734
                  sltu         a7, s7, ra
                  fsgnjx.s     ft10, ft9, fs1
                  fclass.s     s10, fs0
                  srli         t6, a0, 28
                  andi         t5, s9, 576
                  fadd.s       fa4, ft5, fs11
                  add          s1, s1, t4
                  fsgnj.s      fs5, fs7, fa7
                  and          gp, t5, s1
                  and          s1, s10, s6
                  xor          a5, a5, zero
                  fsgnj.s      ft5, fs0, ft10
                  fsgnj.s      ft3, fs11, fa1
                  xori         tp, t0, -1459
                  fsgnjn.s     fs1, ft2, ft11
                  fsgnj.s      ft7, ft7, fa6
                  fsub.s       fa4, fa4, ft9, rmm
                  fcvt.s.w     ft8, a2
                  slti         a5, s6, 1439
                  add          s8, s11, a6
                  or           a7, s6, s2
                  slti         s9, a2, 421
                  fcvt.w.s     gp, fs2
                  lui          tp, 510529
                  fsqrt.s      fa2, fa3, rdn
                  lui          t5, 392185
                  mulhu        s3, s9, s5
                  add          t4, s1, zero
                  fle.s        t5, fs6, fs2
                  add          a3, a5, s7
                  fle.s        ra, fs7, fs8
                  sltiu        s4, s6, 383
                  fcvt.wu.s    a1, fa4
                  mulh         a5, a6, s0
                  and          a5, a3, t1
                  sltu         a7, s1, t4
                  andi         a3, s3, 803
                  sltu         a6, gp, a1
                  mul          a0, zero, s8
                  fmin.s       fs5, fs6, fa5
                  sub          t0, a3, s5
                  fcvt.s.w     fa5, s8, rdn
                  mulh         gp, t4, a5
                  srl          s11, gp, ra
                  srl          s8, s7, s10
                  fmul.s       ft6, fs0, ft9
                  sra          a3, s3, a1
                  auipc        s9, 528965
                  auipc        a0, 616627
                  fmv.x.w      a7, ft6
                  fsgnj.s      ft10, ft5, ft4
                  flt.s        s4, fs7, fs1
                  div          s8, a4, s5
                  ori          t4, a4, 185
                  xor          s2, sp, a2
                  feq.s        s1, fs4, fs10
                  srai         s11, t5, 30
                  mulhu        t4, t2, s10
                  fmin.s       fs7, ft7, ft11
                  remu         ra, zero, a6
                  fle.s        t1, ft1, fa0
                  fcvt.s.wu    fs5, sp
                  divu         s10, s0, a5
                  sltiu        s6, t2, -1438
                  fmv.x.w      s3, ft9
                  divu         t1, t3, t0
                  fmax.s       ft4, ft0, ft4
                  sltu         t6, t6, s9
                  fsgnjn.s     ft7, ft2, ft10
                  fsqrt.s      fs4, ft9
                  add          ra, a1, zero
                  fmv.w.x      fs1, t0
                  fsub.s       fs7, fs0, fa4
                  fmul.s       fs8, fs6, fs6
                  div          s11, s8, s7
                  remu         t6, a3, s11
                  mulh         s0, t0, a0
                  ori          t4, t0, -1360
                  slt          a5, a7, s10
                  fcvt.s.w     fs0, zero, rne
                  fadd.s       ft7, ft1, ft3
                  fdiv.s       ft6, ft11, fa5
                  sll          a7, t3, a2
                  feq.s        ra, ft4, ft3
                  mulh         t5, s5, s8
                  div          a6, s4, s9
                  or           t4, a1, s5
                  slt          tp, s2, t2
                  fmax.s       fs7, ft1, fs5
                  ori          s11, a6, 1692
                  fclass.s     s5, fa7
                  fclass.s     tp, fs3
                  slt          s4, s2, gp
                  fsub.s       ft0, ft5, fa7, rup
                  fadd.s       fa1, fs7, fa6
                  sll          a1, gp, ra
                  rem          s11, gp, s3
                  sra          t0, t0, t2
                  srl          gp, s0, s11
                  mulh         s7, s9, a7
                  sra          s9, t2, a4
                  divu         s10, s1, a3
                  xori         gp, a4, 1602
                  fclass.s     t1, fs6
                  fcvt.s.wu    ft7, a0
                  add          t6, zero, a5
                  remu         s5, ra, s10
                  fsgnjx.s     fs4, ft1, fa6
                  slli         s3, t4, 11
                  sra          sp, t1, s5
                  fcvt.wu.s    s4, fs5, rup
                  fmv.x.w      s0, fs10
                  sub          t6, a3, a1
                  slli         gp, gp, 24
                  fmv.x.w      s5, ft7
                  lui          s0, 225363
                  fcvt.wu.s    a5, ft9
                  divu         s2, s9, a5
                  fmv.w.x      fs4, a2
                  sltiu        t0, t3, -815
                  sltu         t4, s7, a2
                  srli         s10, t0, 21
                  fmax.s       fs4, ft4, fa5
                  slt          s6, t4, s0
                  ori          s11, a7, -92
                  slti         t1, s7, 1491
                  fsub.s       fs2, fa2, ft6
                  sll          sp, t6, t3
                  xor          t0, t5, a7
                  fcvt.w.s     s8, ft8
                  mulhu        s3, zero, s1
                  and          a3, ra, a4
                  srai         a5, s8, 7
                  sltu         s4, s7, sp
                  sra          s9, tp, s6
                  rem          tp, t1, a6
                  and          s7, s6, a7
                  fle.s        a3, fs3, fs11
                  rem          zero, s4, a7
                  fcvt.w.s     ra, ft5
                  andi         s8, t5, 473
                  mulhu        a5, tp, s10
                  fsqrt.s      fs11, fs1
                  flt.s        t0, fs9, fa4
                  fmax.s       fs4, ft4, fa5
                  addi         a6, s5, -1720
                  fdiv.s       fs7, ft8, fa4
                  srl          a6, a7, t2
                  fmv.x.w      s6, fa6
                  fmax.s       fs10, fs0, fs1
                  fcvt.w.s     a1, fs5
                  fsgnj.s      fa3, fa0, fs2
                  srli         s9, tp, 8
                  slti         a6, s11, 1912
                  fsgnjn.s     fs6, fs9, fa0
                  fsgnj.s      fs2, ft10, fs6
                  fcvt.wu.s    s10, ft10, rup
                  div          t2, s0, a7
                  slt          sp, s2, t3
                  addi         s6, a6, -806
                  sra          sp, a0, t2
                  fcvt.wu.s    t2, ft10, rmm
                  xori         s7, t6, -1958
                  fdiv.s       fa4, ft6, ft4
                  fsgnjx.s     fs7, fs0, fa1
                  fdiv.s       ft10, fs8, fs9, rtz
                  rem          s11, t5, a4
                  fmul.s       ft6, fa7, ft9, rup
                  mulhu        sp, t1, gp
                  fsub.s       fs3, fa0, fa6, rtz
                  srai         a5, s1, 19
                  fcvt.wu.s    s4, ft10, rne
                  fcvt.s.w     fs5, s8, rup
                  fcvt.wu.s    s8, ft2, rmm
                  andi         a1, t0, -1653
                  fclass.s     s9, ft4
                  feq.s        t4, fa6, fs11
                  fdiv.s       fs7, fs7, fs8, rmm
                  andi         gp, t1, 187
                  rem          a7, s3, t4
                  fmv.w.x      ft8, a1
                  fdiv.s       fa5, ft10, fs9
                  fmv.x.w      s5, fa2
                  mulh         s8, t3, a3
                  remu         s9, s8, s9
                  mulh         sp, zero, a5
                  fcvt.wu.s    zero, fa5, rdn
                  fcvt.wu.s    zero, fs4
                  fmv.w.x      fs4, t1
                  fmv.w.x      fs11, a4
                  srli         gp, s0, 21
                  fcvt.s.wu    fa5, s9, rdn
                  andi         s7, gp, -1325
                  slti         s7, s2, 329
                  srai         s7, a2, 29
                  auipc        s1, 982950
                  rem          s1, sp, s11
                  sll          a0, t4, a3
                  fmv.x.w      ra, ft2
                  addi         s2, t3, 698
                  fclass.s     t1, ft0
                  xor          t6, t0, s6
                  fmul.s       fa3, ft3, fs2, rup
                  sra          a3, s1, gp
                  lui          t1, 456919
                  sub          t6, s2, zero
                  slti         s3, sp, -1743
                  fadd.s       fs6, ft6, fa6, rdn
                  fcvt.s.wu    fs2, a1
                  sltiu        t5, t0, -1614
                  fmin.s       fs3, fs6, fa7
                  flt.s        t4, ft6, fs1
                  fadd.s       ft5, fs9, ft6
                  fadd.s       ft6, ft1, ft9
                  srai         a0, gp, 29
                  fcvt.s.w     fa7, a4, rmm
                  fclass.s     s8, fa7
                  sltu         t4, s0, s6
                  slt          t1, s0, s5
                  fadd.s       ft5, fa1, fa7
                  fcvt.s.wu    fs1, s4
                  fcvt.s.w     fs6, s11
                  slti         s8, s2, 501
                  slli         t0, s2, 2
                  fadd.s       fa1, ft1, fa5, rup
                  add          t0, s8, a1
                  mulh         sp, t4, s3
                  fsgnjn.s     ft9, ft0, ft1
                  fmul.s       fs0, fs2, ft3, rne
                  mulhsu       a7, a6, t4
                  fsub.s       fa4, fs5, fs2
                  fsgnjn.s     fa3, ft6, ft0
                  ori          t5, t1, -1932
                  fsgnj.s      ft9, fs1, fa4
                  flt.s        a7, fs6, fs0
                  sra          s2, a4, s11
                  xori         s8, a0, 1107
                  feq.s        s9, ft2, fs1
                  or           t5, t4, s6
                  slti         s1, a0, 1831
                  or           s0, a1, a4
                  fle.s        a3, ft6, fs2
                  fmin.s       ft7, fs11, fa4
                  srli         s3, ra, 30
                  fsub.s       ft1, ft10, ft4, rtz
                  fmv.x.w      a3, ft11
                  sll          ra, s8, a2
                  mulhu        a7, a5, s1
                  sub          s1, tp, sp
                  slli         s9, s10, 24
                  sra          a6, a1, a4
                  flt.s        t1, fs5, fa4
                  xor          s10, s11, s1
                  slt          s3, s9, sp
                  mulh         a3, s5, a1
                  and          t6, s9, s6
                  ori          gp, s4, 758
                  andi         s2, t3, -639
                  fdiv.s       fs2, ft11, fs8, rmm
                  nop
                  nop
                  fmv.x.w      a1, fa7
                  mul          sp, t1, s10
                  srli         t0, s5, 21
                  fsqrt.s      fs8, fs2
                  fcvt.wu.s    tp, fs7
                  and          s0, t3, t1
                  mul          s8, t4, t1
                  fmv.x.w      s5, ft7
                  fclass.s     a1, fa2
                  slt          zero, a7, zero
                  mulhu        gp, t5, sp
                  fsqrt.s      fa6, fa3, rne
                  add          t6, s5, s4
                  nop
                  and          s10, s8, tp
                  rem          s4, s6, t0
                  fsqrt.s      fa2, fs7
                  xori         tp, ra, 549
                  sll          a3, s3, t1
                  ori          t6, s0, -1901
                  mulhu        t0, t0, a5
                  sll          a0, s11, t5
                  fsub.s       fs11, ft3, fs2, rtz
                  mulhu        s9, gp, sp
                  sltiu        zero, a6, 786
                  mulhsu       a6, s10, t6
                  fsgnjn.s     fs8, ft11, fs10
                  remu         s0, zero, s11
                  slli         a6, a4, 17
                  fsub.s       ft2, ft2, ft3
                  slli         s4, t3, 3
                  fsgnjx.s     fa6, fa6, fs4
                  flt.s        gp, fs9, fs8
                  sub          t4, t0, a5
                  lui          s0, 259511
                  fsgnjx.s     fa7, ft4, fa4
                  add          sp, a5, s7
                  fcvt.s.w     fs1, s0
                  srl          t5, s4, s10
                  feq.s        a1, ft5, ft10
                  fmv.w.x      fs0, s10
                  ori          s0, s11, -1688
                  add          sp, s3, a2
                  fclass.s     a5, fs4
                  slt          s0, tp, t3
                  rem          a3, t0, s7
                  auipc        s1, 929634
                  feq.s        s4, fs6, fa1
                  slli         s7, t0, 1
                  sltu         t6, s10, t2
                  fsgnjn.s     fs10, fs11, ft11
                  fsgnjx.s     fa1, fa6, ft11
                  add          a5, s9, a4
                  auipc        tp, 321419
                  fsqrt.s      fs4, ft4, rmm
                  mul          s3, s8, s3
                  divu         s11, tp, a7
                  slti         s5, t3, 246
                  fcvt.s.wu    ft7, t1, rtz
                  sub          a6, a5, a1
                  fcvt.s.wu    fa7, a7, rup
                  slli         a5, sp, 1
                  fsqrt.s      ft1, fs5, rne
                  lui          s7, 179853
                  addi         s11, gp, -1452
                  fcvt.wu.s    a0, fs5
                  fle.s        gp, ft8, fs5
                  fsgnjx.s     ft1, fs6, fa1
                  divu         s9, tp, a2
                  andi         a0, s4, -335
                  sltiu        a0, sp, -1768
                  mul          tp, s9, a6
                  lui          s1, 765869
                  or           t0, gp, a0
                  fcvt.w.s     s2, ft10
                  fsqrt.s      fa5, ft5
                  xor          s7, zero, s9
                  fcvt.wu.s    t5, ft11
                  slt          s6, t6, s5
                  slli         tp, s7, 14
                  fcvt.s.w     ft3, t3
                  fsgnjn.s     fs9, fa4, ft6
                  sll          s8, s1, t1
                  fmax.s       fa4, fs3, ft4
                  sra          ra, a1, gp
                  andi         s7, t4, -1369
                  and          s3, s6, s11
                  or           a6, tp, t5
                  fsub.s       fs3, ft7, ft11
                  fsgnjn.s     fs0, fs7, ft8
                  slli         s3, t1, 7
                  mul          s11, zero, t5
                  fdiv.s       ft3, ft9, fs9, rmm
                  flt.s        sp, fs3, ft11
                  feq.s        t5, fs8, ft5
                  xori         t0, a1, -688
                  mul          s5, s4, t4
                  fmv.x.w      t6, fs0
                  fsub.s       fs0, ft1, ft6
                  fcvt.w.s     a5, fs2
                  sltu         s6, gp, a5
                  auipc        tp, 905801
                  fsqrt.s      fa5, fa7, rup
                  srl          s0, a2, a5
                  andi         a3, s2, 1514
                  fmv.x.w      sp, ft0
                  fsgnjn.s     ft8, ft7, fs9
                  fdiv.s       ft8, ft9, fs10, rtz
                  fmax.s       ft10, ft5, ft10
                  ori          sp, a1, 763
                  fsqrt.s      ft1, fs5, rup
                  fsgnjn.s     fs4, fs10, fs4
                  fsub.s       fs10, fs8, fs2
                  auipc        s0, 326681
                  and          t1, s1, s1
                  sll          s11, a4, s8
                  fmul.s       fa3, fs3, ft10
                  rem          s3, a7, s7
                  slt          a6, s10, a6
                  lui          t2, 725872
                  fadd.s       ft0, fa2, ft10, rup
                  xor          s10, a5, s10
                  fcvt.s.wu    ft1, s4, rne
                  fle.s        gp, fa5, fa4
                  fsqrt.s      fs4, ft8, rtz
                  nop
                  fmax.s       fs4, fa5, fs9
                  fmv.w.x      fs7, a6
                  srl          t1, zero, a4
                  nop
                  slli         t6, s0, 14
                  fsgnj.s      fs10, ft11, fa5
                  srli         s10, s5, 27
                  fcvt.w.s     zero, ft9, rtz
                  fmv.w.x      fs1, s3
                  xor          gp, s3, t4
                  add          s1, s6, s9
                  sra          sp, s4, a2
                  fdiv.s       ft4, fs0, fs11
                  mulhu        s8, s4, a4
                  and          a7, t4, a1
                  divu         s6, t3, s2
                  fdiv.s       fa7, ft9, fa4
                  and          t2, a2, t2
                  fsqrt.s      fa7, fs1, rmm
                  srl          tp, a5, s6
                  fsub.s       ft1, fs10, fa5, rmm
                  ori          s6, sp, 1026
                  fsgnjx.s     ft6, fs6, fs8
                  fsgnjx.s     ft7, ft8, fs11
                  srli         ra, t4, 8
                  fcvt.s.wu    ft6, a2, rup
                  fsgnj.s      fs4, fs0, fa6
                  slti         s0, t2, 1944
                  rem          s0, t5, s9
                  ori          s2, s8, -1163
                  xori         s8, s2, -279
                  fle.s        s9, ft11, fa2
                  div          s2, t4, a3
                  rem          s0, s3, t1
                  fsgnjx.s     ft0, ft2, fs11
                  add          zero, a5, a6
                  fle.s        s7, fa1, ft4
                  andi         s3, a6, 452
                  add          s1, s10, t0
                  fmul.s       ft0, fs8, ft6
                  and          zero, a6, s0
                  sltiu        s11, a5, 1726
                  mulhu        a7, gp, a7
                  feq.s        t2, ft7, ft6
                  addi         s2, a0, 1261
                  flt.s        zero, fa2, fs10
                  fmv.w.x      fa3, gp
                  xor          a3, a3, s9
                  mulh         s10, s11, a3
                  srl          s6, a4, s11
                  addi         s6, t5, 900
                  fclass.s     a3, ft5
                  fcvt.s.w     fs7, s1, rdn
                  fcvt.w.s     t0, ft2, rne
                  nop
                  fsqrt.s      fs11, fs8
                  fmax.s       ft10, ft4, fs4
                  srl          t1, sp, gp
                  srl          ra, s5, s4
                  rem          s9, ra, t3
                  sltiu        a3, s4, 1970
                  fmax.s       ft7, fa7, fa3
                  slti         s10, s3, -771
                  fcvt.w.s     s7, fs8
                  fclass.s     t4, ft4
                  slli         s4, t2, 5
                  fclass.s     s2, ft9
                  fmv.w.x      ft2, s9
                  mulhu        s3, t4, s0
                  fsgnjx.s     fs0, ft0, fs7
                  remu         s2, t4, a3
                  addi         s9, s10, 1548
                  mul          a5, s4, a3
                  srli         s11, s11, 1
                  fcvt.s.w     fa6, gp, rmm
                  srai         a3, ra, 26
                  div          a0, t4, a7
                  sra          s6, t5, s1
                  fcvt.s.wu    ft7, ra
                  mul          tp, s5, a4
                  fcvt.wu.s    s2, ft1, rmm
                  fsqrt.s      fs2, fa0, rne
                  sltu         a6, s11, t5
                  fmax.s       fs7, ft7, fs4
                  remu         s11, a3, s7
                  fle.s        s7, ft11, fs2
                  divu         s3, zero, t1
                  remu         t2, t3, t6
                  fmv.w.x      fs4, s8
                  fsgnj.s      ft6, fs11, fa2
                  sltiu        tp, t4, 1937
                  sltiu        s1, a2, -1603
                  srli         a7, a0, 17
                  fsgnjn.s     ft11, fa1, fs6
                  mulhu        ra, s9, gp
                  ori          s2, s5, -1530
                  fsgnj.s      fs1, fs3, fa1
                  nop
                  add          tp, sp, s7
                  fcvt.wu.s    s8, fs2, rmm
                  flt.s        gp, fa1, fa4
                  mul          s10, t1, t1
                  mulh         s2, tp, s5
                  addi         s0, t3, 1733
                  andi         s6, s5, -783
                  slti         s7, sp, 1999
                  sltu         s3, s4, s2
                  sra          s4, a5, s1
                  fcvt.wu.s    s11, ft3, rne
                  fmul.s       ft3, ft3, ft4, rtz
                  sltu         t0, a3, a1
                  fmul.s       fa3, fs2, fs6
                  fsqrt.s      fs5, fs11, rup
                  fmv.x.w      s1, fa3
                  mul          tp, s4, zero
                  add          a6, s2, a5
                  addi         t0, s11, -1990
                  sltiu        gp, tp, -1566
                  and          s7, a3, a3
                  mulhu        a1, a3, a5
                  fsub.s       fs1, fs4, fs10
                  mul          s8, t6, s1
                  fcvt.s.w     ft11, gp, rdn
                  fmv.w.x      ft8, a1
                  addi         t0, ra, 992
                  sll          zero, s11, s5
                  fmin.s       fa4, ft2, fa0
                  fclass.s     a5, fs8
                  xori         a1, s0, 1826
                  fsgnj.s      ft8, fs4, fa4
                  feq.s        s0, fs6, ft7
                  slli         a6, s9, 29
                  divu         s10, s5, s5
                  srli         ra, s1, 3
                  sll          a1, s4, t4
                  fsgnjx.s     fs10, ft6, fa1
                  andi         s4, a6, 882
                  sub          s5, s5, s9
                  or           t1, t1, a6
                  fcvt.s.w     fs11, a3
                  div          sp, a0, s5
                  srl          s10, s4, t4
                  srli         s4, gp, 4
                  nop
                  addi         ra, s9, -57
                  sub          a3, a4, s3
                  fsqrt.s      fs8, fs6
                  fsgnjx.s     ft5, fa4, fs10
                  and          t6, a1, a6
                  mul          t1, s5, t6
                  sra          s2, sp, t5
                  fsgnjx.s     fs10, fs10, ft10
                  fsqrt.s      fa2, ft11, rdn
                  xori         t5, zero, -999
                  srai         s3, s10, 17
                  fmin.s       ft9, fs3, fs0
                  fcvt.s.w     fs9, t4, rtz
                  srai         s0, s3, 2
                  fmv.w.x      fs1, t2
                  fcvt.wu.s    s7, ft9
                  fmin.s       fa5, ft8, fa5
                  andi         a7, a1, 786
                  fcvt.s.w     fs1, ra, rne
                  fsgnjx.s     fs1, fs9, fa4
                  sub          s10, a6, s6
                  fcvt.s.w     fs5, a1
                  mulh         tp, a0, s9
                  nop
                  fsgnj.s      fs3, fs5, fs9
                  fsgnjx.s     fa7, ft7, ft9
                  sltu         s2, a5, s1
                  srai         a1, s5, 15
                  fmul.s       ft5, fa0, fs0, rmm
                  add          t5, zero, s2
                  sub          s7, ra, t4
                  lui          a3, 539256
                  remu         ra, a1, s8
                  xor          t5, t6, t6
                  addi         t4, tp, -363
                  ori          tp, s11, -1246
                  mul          s11, zero, t5
                  fmin.s       fa0, fa5, fa6
                  nop
                  fmv.w.x      fa7, t5
                  ori          a3, a6, 1747
                  fcvt.wu.s    t5, fs5, rup
                  addi         sp, tp, 778
                  mulhu        ra, s4, t5
                  sltiu        s3, a1, 614
                  srl          zero, t2, t5
                  sub          t0, gp, t2
                  flt.s        s8, fs3, ft5
                  fmv.x.w      s10, fa2
                  xor          s10, t4, a5
                  fdiv.s       fa4, fs0, ft0
                  and          a5, t3, a1
                  andi         s4, s11, 966
                  fcvt.w.s     s2, ft11, rdn
                  addi         s6, s10, -1028
                  div          a0, a4, a0
                  fadd.s       ft4, ft5, fs7, rdn
                  lui          a0, 112466
                  feq.s        s0, ft9, fs8
                  auipc        t4, 808500
                  div          s11, tp, a3
                  sltu         gp, a4, t2
                  mulh         a1, s11, a4
                  mulh         a3, gp, s2
                  fdiv.s       ft6, fa4, ft3
                  auipc        a5, 452133
                  fmv.x.w      s7, ft2
                  mulhsu       s5, t5, s6
                  fsgnj.s      ft10, ft6, ft4
                  feq.s        s9, fa0, fs2
                  rem          a6, t6, s9
                  srai         ra, s3, 16
                  remu         t2, s9, s10
                  fmin.s       fa2, fs8, fs6
                  rem          tp, t3, tp
                  mulhsu       s8, a0, t0
                  slti         a6, s8, -1393
                  fsub.s       ft1, fs10, fa0, rtz
                  add          s11, t1, a2
                  slli         tp, s8, 22
                  fadd.s       fa3, fs8, fa7
                  sra          a5, zero, s1
                  fadd.s       ft11, fa0, fa3
                  xor          a7, a0, s4
                  fcvt.wu.s    tp, ft8, rne
                  xor          s8, gp, s6
                  fle.s        zero, fs1, ft4
                  fadd.s       fs11, fs2, fs7, rdn
                  srli         sp, a3, 10
                  srl          s3, t0, zero
                  slt          a6, t1, s10
                  fsub.s       fs3, ft4, fa2
                  fsgnj.s      ft2, fa3, ft7
                  fmul.s       fa0, fa5, fa5, rdn
                  fadd.s       fa1, ft2, fs3
                  fcvt.w.s     s5, fs5
                  mulh         t0, a7, t2
                  andi         t6, a1, -883
                  remu         zero, s0, t0
                  andi         t4, t6, 823
                  rem          a5, a5, s7
                  andi         s4, a5, -931
                  mulh         s1, a3, a3
                  sub          s9, s0, s4
                  srai         a5, a5, 13
                  sub          t1, s2, a2
                  nop
                  mul          s1, a4, a3
                  flt.s        t2, ft1, fa5
                  flt.s        s11, ft7, fs11
                  sltiu        t6, s3, -351
                  div          t2, s1, t1
                  srli         a6, s6, 10
                  mul          a5, s5, zero
                  slti         t6, a0, -771
                  srai         t2, t4, 10
                  fsgnjn.s     ft1, fa4, ft3
                  sub          s3, t3, s5
                  fdiv.s       fa3, fa3, ft3, rtz
                  nop
                  xor          s11, t0, a6
                  fmv.w.x      fs7, gp
                  fsub.s       fa0, fs2, fa3
                  fcvt.w.s     sp, ft5, rup
                  div          s1, s11, zero
                  mulhsu       a5, ra, t6
                  slti         zero, s8, -502
                  fdiv.s       ft5, ft1, ft11
                  srl          a7, t6, a6
                  addi         t6, a5, 1047
                  mul          t5, s9, a1
                  ori          s10, s10, -1116
                  feq.s        s3, fa4, ft2
                  add          a0, tp, s10
                  andi         a0, tp, 67
                  feq.s        a0, fs1, ft2
                  fcvt.s.wu    fa1, s5
                  fclass.s     a3, ft3
                  fadd.s       fs11, ft4, ft4
                  sll          a0, zero, t4
                  srli         t1, zero, 28
                  fadd.s       fa3, fs8, fs9
                  sub          a5, a0, t0
                  srai         s5, t6, 8
                  andi         t6, s8, 1217
                  rem          a5, s7, t1
                  xori         t2, sp, -411
                  fcvt.w.s     gp, fs1
                  fclass.s     s2, ft8
                  fmax.s       ft11, ft0, ft0
                  auipc        s10, 248063
                  sub          a3, a5, a5
                  sra          a0, s5, s11
                  srl          t0, s8, ra
                  feq.s        a7, ft3, ft11
                  slti         t5, a5, 1443
                  andi         sp, t0, -1429
                  fmv.w.x      ft0, a6
                  fsqrt.s      fs9, ft2, rne
                  mulhsu       s11, s4, a0
                  srl          zero, t2, t4
                  srai         s1, t3, 9
                  sra          a0, t5, t3
                  fmv.x.w      t2, fa5
                  fmax.s       fs1, ft9, fa1
                  fsgnj.s      fs3, fs11, ft7
                  fsgnjx.s     fs0, fa0, fs8
                  fadd.s       fa1, fa5, fa7
                  and          s9, gp, a0
                  nop
                  srli         a6, gp, 6
                  fmul.s       ft3, fa3, ft11
                  fmax.s       fa7, fa4, fa1
                  remu         s11, t3, s10
                  fsgnj.s      fs11, fa5, fs7
                  addi         s4, a4, 435
                  srai         t6, t4, 2
                  and          sp, gp, s0
                  fle.s        tp, fa6, ft11
                  fsgnjn.s     fa1, ft11, fs7
                  divu         ra, s4, a4
                  fsgnj.s      fa1, fs1, fa4
                  srli         s11, a0, 6
                  sltiu        a0, s9, -1976
                  addi         gp, s8, 1345
                  slti         s3, s8, 304
                  fcvt.w.s     t2, fa4, rdn
                  fcvt.s.wu    ft6, s5, rdn
                  mulh         s3, tp, a7
                  fcvt.s.wu    ft4, s8, rup
                  fsqrt.s      ft6, ft1, rup
                  mulhsu       a3, ra, t5
                  fmin.s       fa1, fa1, fa3
                  ori          s6, a5, -159
                  fsgnjx.s     fa5, ft8, ft7
                  fsgnj.s      fs5, fs1, ft0
                  remu         s8, s1, t4
                  fdiv.s       fs11, fs0, fs2
                  nop
                  srl          t0, a1, t3
                  feq.s        s7, ft9, ft5
                  mulh         t0, a1, a6
                  auipc        tp, 571702
                  fcvt.wu.s    t6, fa4
                  nop
                  fsgnjx.s     ft7, ft2, ft9
                  fmax.s       fs5, ft3, ft10
                  auipc        s5, 946881
                  fmin.s       fs6, fs2, fa1
                  auipc        t1, 164404
                  xori         sp, s2, -726
                  divu         a6, s9, a5
                  fsgnjx.s     ft9, fa4, fa3
                  ori          s11, s9, 22
                  mulh         t0, s6, s6
                  sltu         s10, s3, a6
                  sltiu        t2, a1, -862
                  remu         ra, s7, s1
                  fmin.s       fa5, ft10, fa7
                  sltiu        a5, t2, 133
                  sltiu        s5, s8, -1870
                  fsub.s       ft3, fs5, fs3
                  fadd.s       fs6, fs10, fs3
                  fsqrt.s      fa6, fa1, rne
                  mulh         s10, s10, s10
                  nop
                  fmv.w.x      ft8, zero
                  fmul.s       fa2, fs10, ft7, rmm
                  fsqrt.s      fs7, fs10, rup
                  fmin.s       fa5, ft6, ft8
                  or           t1, a5, a5
                  fsgnjn.s     fs4, fa1, fa0
                  andi         tp, tp, -1910
                  sltu         t5, s6, t5
                  ori          t0, t3, -1660
                  sub          a5, sp, a3
                  sll          s8, t6, t1
                  fcvt.s.wu    ft8, t0, rup
                  mul          a1, s2, ra
                  srl          s7, sp, t4
                  sll          s7, t0, gp
                  fmin.s       fa5, ft9, fs3
                  fsub.s       fs1, fs2, ft8, rtz
                  fclass.s     s2, ft3
                  or           tp, s3, a1
                  fclass.s     s0, ft7
                  mulhsu       a5, s10, t2
                  fcvt.wu.s    a5, ft2, rtz
                  div          a0, a5, s0
                  fsqrt.s      fs9, fs9
                  fsgnjx.s     ft9, fa0, ft2
                  fsgnj.s      fa4, ft11, fa5
                  mul          s10, s6, t5
                  addi         s9, a3, -468
                  slt          a7, s7, ra
                  srl          t4, a6, s11
                  or           s6, t4, ra
                  and          s4, s11, s10
                  mul          a6, ra, tp
                  fsqrt.s      ft3, fa5
                  slt          t6, s8, tp
                  srai         s7, s4, 27
                  xor          t5, s4, a6
                  fmv.w.x      fs1, s8
                  fcvt.w.s     s8, fs0
                  fdiv.s       ft8, fa6, fs2
                  or           t1, a7, s2
                  fsgnjx.s     fs5, ft1, fs6
                  lui          s4, 634657
                  flt.s        t0, fs1, fa2
                  auipc        s6, 481941
                  mul          s6, a1, s1
                  fle.s        s9, ft10, ft7
                  fmv.w.x      ft3, a0
                  fcvt.s.wu    fs5, tp, rtz
                  xor          gp, t6, a2
                  sltu         s6, a5, t0
                  mulh         t1, gp, a3
                  mul          s10, a5, s10
                  fdiv.s       fs7, ft0, fs5, rne
                  srl          t4, a6, s4
                  auipc        s8, 109021
                  fmv.x.w      sp, ft11
                  sra          s6, a1, a5
                  fmin.s       ft7, fs2, ft6
                  sub          s11, gp, t2
                  slt          s1, s11, ra
                  auipc        t6, 953291
                  fle.s        a3, fa1, fs9
                  sra          tp, a7, s6
                  xor          s1, sp, a7
                  mulh         gp, zero, a1
                  sll          s6, s6, s2
                  div          ra, a6, s6
                  fmax.s       ft4, fa5, ft0
                  nop
                  auipc        tp, 357133
                  fadd.s       ft11, ft7, ft5
                  addi         a0, a7, -506
                  fle.s        s3, ft9, fa4
                  fmin.s       ft1, ft8, fa1
                  fcvt.s.wu    fa7, t3, rdn
                  andi         a0, a7, -696
                  feq.s        a3, ft7, ft10
                  or           s3, a0, sp
                  fsgnj.s      fs6, fa0, ft8
                  sll          a6, ra, s2
                  mul          gp, t2, a5
                  fle.s        tp, fs6, fs9
                  nop
                  xori         zero, t3, 623
                  flt.s        sp, fs11, fs3
                  fmin.s       fa3, fs1, fs1
                  sll          s6, ra, a4
                  fmin.s       fs7, fa0, ft9
                  fmv.x.w      tp, ft11
                  slt          s0, t4, t6
                  fmul.s       fs6, fa4, fa0
                  flt.s        t4, fa1, fs3
                  fcvt.s.wu    fs6, s9
                  fsgnjx.s     fs1, fa4, ft11
                  mulh         t0, t6, a4
                  xori         t2, s9, 1352
                  fdiv.s       fs5, fa0, fa0, rmm
                  rem          t2, t1, s6
                  fsgnjx.s     fs9, fs1, fs8
                  mul          a1, a4, t4
                  fmul.s       fs4, fa4, fs9
                  flt.s        s5, fa4, ft11
                  add          s7, t2, t6
                  sll          s6, s9, gp
                  srl          s10, s1, s11
                  mulhsu       s7, s7, sp
                  sltu         a0, gp, t3
                  fsgnjx.s     ft2, ft1, ft10
                  xor          sp, t1, t2
                  fsub.s       fa1, fs9, fs10
                  sltiu        s11, t4, -1051
                  mulhsu       s7, s10, a2
                  fmul.s       fa1, ft7, fs10
                  fmv.x.w      a5, ft3
                  andi         s7, t1, 536
                  sll          a5, a1, a4
                  fcvt.wu.s    a6, ft9
                  fsgnjx.s     ft8, ft6, ft11
                  mulhsu       a5, t1, t4
                  slti         ra, ra, 15
                  sll          s2, s2, s10
                  sltu         s6, s1, a1
                  xor          s1, zero, gp
                  sll          s8, tp, s7
                  fmv.w.x      ft7, s11
                  feq.s        s0, ft2, fs11
                  fmin.s       fa2, ft9, fa0
                  fcvt.wu.s    sp, fa3
                  xor          a6, s11, zero
                  fsgnjn.s     fa1, ft1, fs2
                  nop
                  and          s3, s3, s9
                  slti         a6, a7, -392
                  fsub.s       ft10, fs9, fs10
                  fclass.s     s4, ft3
                  fclass.s     t4, ft11
                  fsqrt.s      ft9, fs5
                  mul          s2, a4, gp
                  fsqrt.s      fa1, fa6
                  fmax.s       fa5, fs3, fa0
                  fsgnjx.s     fs9, ft1, ft5
                  fle.s        s4, fa2, fs0
                  mulhu        s3, ra, a3
                  sltu         t2, s3, a7
                  sub          a0, t4, t0
                  slli         a7, s6, 21
                  divu         zero, t1, s5
                  remu         s8, a3, s5
                  fadd.s       ft6, ft0, fa4, rdn
                  sll          s3, a7, gp
                  mulhu        s1, s10, t2
                  andi         t6, s0, -2010
                  srl          s4, t3, s0
                  fmv.w.x      fa3, s11
                  add          a0, s7, s1
                  fcvt.wu.s    s6, ft8, rmm
                  sltu         s2, a3, s3
                  fsqrt.s      fs8, ft4, rtz
                  fcvt.wu.s    s3, fs11
                  srli         ra, s6, 11
                  fmax.s       fs9, fa3, fa3
                  fmv.x.w      a7, fs8
                  srli         zero, gp, 25
                  slli         t2, a1, 18
                  xor          s3, zero, s5
                  fsgnj.s      ft4, fs10, fa2
                  fmin.s       fs0, fs5, fs7
                  mul          a3, t6, s9
                  xor          a3, tp, a5
                  mulh         a3, a1, s0
                  mulhsu       s11, a0, t6
                  andi         a1, s3, 1671
                  ori          t6, s8, -1297
                  divu         s8, a5, t1
                  fsub.s       fa2, fs7, ft0
                  mulh         sp, t0, a1
                  or           tp, s4, a7
                  divu         a6, t2, s3
                  ori          a7, s9, 1002
                  srai         tp, a5, 23
                  auipc        s10, 384265
                  rem          zero, t4, s1
                  slli         t0, a2, 1
                  sltiu        sp, a4, -1653
                  srl          s9, s4, tp
                  slt          t0, s6, a6
                  auipc        a3, 459816
                  srli         s0, s10, 8
                  fmv.w.x      fa7, t0
                  andi         s3, a1, 936
                  srl          a6, a3, s5
                  slli         a1, a3, 25
                  add          a0, a7, gp
                  fdiv.s       ft4, fs11, ft5, rmm
                  srli         s2, t4, 8
                  add          s4, tp, a1
                  fmv.x.w      gp, fs0
                  fcvt.s.wu    fa5, s3, rne
                  fcvt.s.wu    ft10, t2, rdn
                  fmv.x.w      s2, fa1
                  sra          zero, a7, s8
                  fdiv.s       fa5, fs3, fs7, rmm
                  div          a3, s11, gp
                  fcvt.wu.s    zero, ft9
                  fmul.s       fa4, fa4, fa3
                  fdiv.s       fa2, fa5, fs1
                  fsgnjx.s     fs3, ft1, ft9
                  sltu         s11, s7, s3
                  add          a5, ra, s1
                  srai         t1, t6, 13
                  lui          a7, 567259
                  fmul.s       fs3, ft10, ft7, rup
                  rem          s5, ra, s7
                  xori         s8, a7, -1990
                  mulhsu       gp, s7, a3
                  fclass.s     s7, fs6
                  andi         s2, t5, -1468
                  add          a3, s10, t5
                  slti         s6, s11, 1304
                  fsub.s       fa3, fs6, fa1
                  fmin.s       fs2, ft5, fs4
                  flt.s        t0, fa4, fa1
                  lui          zero, 396641
                  fmv.w.x      fa0, a4
                  fmin.s       fs0, fs2, fa2
                  fmv.w.x      fs3, s2
                  add          s1, zero, a5
                  nop
                  slt          s6, a7, s11
                  andi         t4, t4, -1542
                  fmv.w.x      fs8, a5
                  sltiu        s4, t5, 1076
                  remu         s0, s3, t5
                  fmin.s       fs1, ft11, fs4
                  fmul.s       fa0, ft11, ft1
                  fsgnjx.s     fs10, fs2, fa3
                  ori          t1, s5, -1964
                  slt          s9, a0, t6
                  and          s3, s2, s7
                  sra          s8, t3, s0
                  fcvt.w.s     s11, ft7
                  slli         a7, a1, 9
                  lui          a6, 273083
                  fclass.s     t1, ft3
                  srai         s11, t3, 16
                  fclass.s     ra, fa1
                  fmin.s       fa0, fs11, fa2
                  sub          a3, s5, t4
                  fmax.s       ft7, fs6, ft11
                  srli         s3, s11, 6
                  addi         s7, sp, 1643
                  fmin.s       fa7, fa4, ft0
                  mulhsu       t1, t4, s6
                  divu         t0, s0, s7
                  ori          s10, a5, -677
                  fadd.s       fa2, fs2, ft1, rdn
                  fsgnjx.s     ft6, fa2, fa6
                  andi         t5, s0, -20
                  feq.s        ra, fs2, fs9
                  rem          zero, a3, a4
                  sltu         t6, t3, s1
                  remu         a6, a5, t0
                  xori         s7, s11, 90
                  sltiu        t6, s3, 269
                  add          t0, s1, a1
                  lui          s2, 149331
                  fsub.s       ft3, fs7, ft5, rdn
                  xor          s9, t2, ra
                  auipc        s4, 695912
                  fle.s        s1, ft6, fs4
                  addi         a1, s7, 132
                  fsub.s       fa0, ft3, fa2, rup
                  and          s7, s0, zero
                  or           s9, s1, s11
                  flt.s        s1, ft10, fa7
                  slti         a3, t1, -494
                  lui          s7, 653022
                  srli         s3, a3, 31
                  sltu         gp, s2, s11
                  fsgnjx.s     fa5, ft8, fs11
                  mulhsu       t0, a6, t5
                  flt.s        a3, fa2, ft9
                  fmv.w.x      fa4, s3
                  addi         s5, t6, -504
                  rem          s8, s1, s0
                  fdiv.s       fs9, ft10, fa7, rdn
                  slli         s0, t5, 6
                  fmv.w.x      fs2, s7
                  mulhu        s5, t1, sp
                  sltiu        a7, a4, -1611
                  sltu         ra, s2, zero
                  divu         s5, t6, a6
                  mulhu        a3, zero, s2
                  mulhsu       s4, gp, s9
                  div          s1, s10, s9
                  nop
                  srli         s5, s9, 23
                  fclass.s     gp, ft10
                  fcvt.w.s     s4, fs8, rne
                  fsqrt.s      ft0, fa3, rmm
                  addi         s1, s11, -1896
                  feq.s        t2, ft11, fa2
                  remu         t1, s0, s10
                  add          s1, s7, s7
                  slli         a1, s7, 21
                  add          t5, s0, gp
                  sltiu        s3, s10, -757
                  ori          s11, s4, -1525
                  sltu         a6, a6, a5
                  sltiu        s11, t5, 2016
                  xor          ra, a1, s8
                  mulhsu       t0, t4, s5
                  remu         s1, tp, s9
                  div          s4, t2, s0
                  add          s8, s3, t0
                  or           s4, t3, s6
                  add          s9, tp, a4
                  fmax.s       fa1, ft3, fs8
                  addi         s10, a3, 732
                  fclass.s     a7, fa1
                  fcvt.s.w     fa5, a2, rup
                  xor          s1, t6, t6
                  slt          t6, s10, s0
                  mulh         t2, a5, s10
                  nop
                  fmv.x.w      s4, ft1
                  xori         s2, t4, 588
                  lui          gp, 908156
                  fadd.s       fs7, fa1, fs10, rtz
                  fsgnjn.s     fs4, ft9, ft8
                  fmax.s       fs4, ft5, fs3
                  xor          s7, s0, s3
                  xor          s8, a1, s11
                  fmin.s       fs7, fa7, fs1
                  lui          a0, 694987
                  div          s3, s10, s8
                  rem          s6, a6, s3
                  feq.s        s4, fa4, fs6
                  auipc        t4, 761062
                  sub          t2, s5, ra
                  remu         a0, a7, t5
                  ori          s10, a4, -1106
                  fsgnj.s      fs9, ft2, fs3
                  slli         gp, s0, 13
                  srai         s8, a6, 24
                  xor          sp, s5, gp
                  sltiu        gp, s5, 665
                  srl          a1, zero, a6
                  fcvt.wu.s    s9, ft4
                  fsub.s       fs7, ft3, fa7, rtz
                  flt.s        t4, fa4, fs5
                  fdiv.s       fa7, fa5, ft0
                  srai         s8, s0, 30
                  xori         s8, zero, -1726
                  xor          s6, gp, a0
                  fcvt.s.wu    fa5, t6
                  feq.s        t2, ft0, fa6
                  fsgnjn.s     fa4, fs10, ft1
                  fcvt.wu.s    t6, fa0, rne
                  nop
                  nop
                  feq.s        s11, ft0, ft3
                  fmin.s       fa7, fs10, fa3
                  rem          a5, s0, a3
                  mul          tp, s10, s9
                  sll          s9, s5, gp
                  fle.s        ra, ft3, ft5
                  divu         t0, tp, a6
                  mulhsu       t6, t2, a4
                  auipc        a3, 997753
                  fmv.w.x      fs11, s5
                  andi         a7, a2, 1126
                  mul          s9, s10, a6
                  fclass.s     t2, ft7
                  fcvt.s.wu    fs3, t1
                  srai         gp, tp, 10
                  fdiv.s       fa5, ft10, fa7, rdn
                  fcvt.wu.s    a0, fs2
                  sub          sp, a1, s11
                  fmv.x.w      s6, fs4
                  slt          s6, s5, s11
                  auipc        s11, 117383
                  rem          a1, a2, s5
                  fmul.s       ft10, fs4, ft1
                  add          a5, a5, s6
                  fsgnj.s      ft8, fs5, ft1
                  srai         s2, a1, 27
                  fcvt.wu.s    a3, fs4
                  flt.s        t5, ft6, fs1
                  fcvt.s.wu    fs8, ra, rup
                  fsqrt.s      fs0, ft6
                  fcvt.s.wu    fa6, a0, rtz
                  fcvt.w.s     s2, fa5, rtz
                  nop
                  xori         a1, t6, 1573
                  sltiu        tp, t3, 1237
                  mulh         gp, tp, s2
                  xor          s0, s3, a5
                  or           sp, t0, a5
                  rem          s8, s3, a6
                  fsgnjn.s     ft0, fs11, fs8
                  fmv.w.x      ft9, s0
                  and          s3, t3, s9
                  fcvt.w.s     t5, ft6, rne
                  xori         s1, s9, -397
                  auipc        s6, 9556
                  flt.s        sp, fa1, fa6
                  or           t2, t2, sp
                  fclass.s     s6, fa4
                  fcvt.wu.s    a3, fa6
                  ori          s6, s0, -730
                  sra          s9, s4, a7
                  fmin.s       ft1, fs2, fa6
                  flt.s        tp, fs2, fa7
                  mulh         gp, tp, ra
                  fcvt.s.wu    fa3, t4, rne
                  add          a0, t5, t3
                  fmax.s       fs5, ft10, fa4
                  nop
                  fmv.w.x      ft5, s11
                  remu         s11, s6, t4
                  andi         t4, sp, -1861
                  srl          a0, zero, s3
                  sltiu        t0, s10, 576
                  xori         s1, gp, 1240
                  fmv.w.x      ft0, sp
                  lui          s1, 234337
                  fcvt.s.w     ft5, tp
                  fcvt.wu.s    tp, fs7
                  slt          t0, a3, s11
                  slti         gp, s4, -99
                  mul          s5, a5, s1
                  fmul.s       ft8, fa1, fs2
                  srai         s1, s7, 15
                  addi         s8, sp, -1253
                  auipc        a1, 104501
                  srli         ra, a6, 17
                  divu         s11, a5, a5
                  mulhu        sp, a0, a2
                  fmax.s       fa4, fa7, fs3
                  sub          t5, s6, t1
                  sra          t6, s1, gp
                  sub          tp, a4, a3
                  fadd.s       fa1, fs5, fa2, rup
                  lui          tp, 396229
                  fle.s        sp, fa4, fs10
                  slti         a0, s7, 1868
                  fmax.s       fs2, fs4, fa0
                  sltiu        gp, t6, -190
                  rem          s10, a6, s0
                  and          s11, a5, a3
                  or           sp, gp, sp
                  add          s0, sp, s5
                  fmul.s       fa6, fs7, fs3, rup
                  sub          t2, t0, t1
                  slt          s10, t0, t2
                  or           ra, tp, s5
                  fle.s        t5, fa6, ft3
                  fmv.w.x      fs4, s8
                  xor          a3, a5, s10
                  or           s8, s8, s8
                  fclass.s     t0, ft5
                  mulhsu       a5, a5, t2
                  xor          a6, t3, t2
                  add          sp, zero, a0
                  or           a1, tp, zero
                  fadd.s       ft6, ft3, ft0
                  sltiu        gp, s3, 681
                  fadd.s       ft10, fs1, ft5, rtz
                  or           a1, s7, t1
                  div          s4, s5, s11
                  fsub.s       fs0, fa5, ft6, rmm
                  slli         ra, a1, 20
                  fmul.s       fs1, fa1, ft4
                  fsgnj.s      fa1, fs10, fs2
                  addi         a1, zero, 888
                  srai         s0, t6, 14
                  div          t0, sp, t5
                  sltiu        a0, t3, 458
                  slli         s7, zero, 9
                  fle.s        t6, ft5, fa6
                  slti         s11, t2, 6
                  fsgnjx.s     ft0, fa2, ft2
                  fcvt.wu.s    t1, fa5, rne
                  fsgnj.s      ft3, fs5, fs7
                  slli         s6, a1, 6
                  fcvt.s.w     ft3, a7, rmm
                  fmul.s       ft8, fa7, ft11
                  sltu         s1, s6, a2
                  slt          s11, s6, s5
                  lui          a1, 705590
                  fcvt.s.wu    ft10, s0
                  fsgnjx.s     fs11, fa0, fs4
                  sra          a0, tp, t6
                  srai         a6, a6, 0
                  fmv.w.x      fa3, t6
                  sra          s1, ra, ra
                  xor          tp, t3, ra
                  fsgnjn.s     ft9, fs7, fa4
                  fsqrt.s      fs6, fa7
                  sub          s10, s5, s5
                  or           a1, a1, gp
                  fdiv.s       ft5, fs6, ft6
                  sltu         s2, zero, a1
                  or           s11, s1, s2
                  fadd.s       ft2, fa3, ft9, rmm
                  mulh         a6, s2, s8
                  ori          s11, a4, -779
                  divu         t4, a1, t0
                  fsqrt.s      fa3, fs8, rmm
                  and          a0, s3, s9
                  sltu         ra, s1, a1
                  fsgnjx.s     fa1, ft2, ft0
                  mulh         a0, t6, s5
                  sub          s10, s8, s5
                  nop
                  add          zero, sp, s9
                  fmin.s       ft5, fa2, fa2
                  and          gp, sp, s3
                  flt.s        t0, fa2, fs7
                  feq.s        s0, fs2, fs8
                  feq.s        gp, fs4, ft6
                  fmv.w.x      ft11, s4
                  mulh         s6, t0, zero
                  auipc        a1, 869623
                  and          s4, s10, a3
                  div          s10, a2, s4
                  xori         s0, a5, 1722
                  slti         s0, sp, 1116
                  sll          gp, a4, t5
                  slti         sp, a2, 1476
                  fdiv.s       fs9, fs10, fs6, rne
                  sltu         s4, s8, a1
                  sub          t6, s6, a6
                  andi         s10, a6, 648
                  mulhsu       s6, a4, t6
                  feq.s        s5, fs11, fs8
                  sub          t0, s11, sp
                  mulhsu       s5, zero, t5
                  add          gp, t0, s4
                  divu         a7, t1, a2
                  auipc        a7, 1017755
                  slti         sp, s5, -1042
                  slt          s9, a1, ra
                  addi         a6, ra, 1344
                  fmin.s       ft11, fa2, fs9
                  fmul.s       fs1, fa0, ft4
                  srl          s8, s9, s3
                  fmv.x.w      t6, ft6
                  sltu         gp, s4, s9
                  ori          s3, s5, -1064
                  slli         s7, tp, 19
                  andi         t5, a3, -2014
                  slt          s10, t4, s6
                  xor          s5, a0, t0
                  feq.s        t1, fa7, ft3
                  srli         sp, a1, 23
                  slti         ra, s0, 443
                  fmin.s       ft5, fs9, ft4
                  lui          s4, 498550
                  sll          a7, s6, a5
                  fsqrt.s      fa3, fs8
                  addi         a5, sp, -1227
                  sub          s3, a7, a6
                  sub          s9, s5, t1
                  mul          gp, a5, a2
                  fdiv.s       ft10, fs11, fs3, rup
                  andi         zero, ra, 754
                  fcvt.w.s     a7, fa4
                  slti         t5, t6, -764
                  fdiv.s       fa3, ft7, fs2, rup
                  srl          a5, s4, s2
                  andi         t4, a6, 1090
                  flt.s        s1, fs5, fa1
                  fmv.w.x      fa4, a0
                  divu         t0, s10, ra
                  feq.s        t5, ft7, ft2
                  slt          a0, s1, zero
                  slli         zero, s6, 13
                  fcvt.w.s     t1, ft6
                  fdiv.s       fs9, ft3, ft11, rup
                  srai         t4, a1, 7
                  div          s4, s1, a0
                  sub          s4, t1, s6
                  rem          tp, sp, a3
                  fmin.s       ft4, fa2, fa3
                  or           a6, t5, s2
                  srl          ra, ra, gp
                  fsqrt.s      fs1, fs8
                  srai         s0, t5, 10
                  fcvt.s.wu    ft3, a3
                  sra          a3, t2, s1
                  fcvt.s.w     fs2, t4, rne
                  fsgnjn.s     fs3, fs8, fs8
                  fle.s        t5, ft2, fs7
                  fcvt.w.s     s6, fs6, rup
                  sltu         t4, t6, a6
                  slti         gp, t3, 1466
                  slt          t5, s8, t2
                  remu         s6, s7, s3
                  add          s9, a1, s0
                  sra          zero, t5, gp
                  slt          t2, tp, t6
                  fcvt.s.w     fa2, s11
                  auipc        s3, 380594
                  fdiv.s       ft6, fs3, ft4
                  and          s5, a7, s0
                  fclass.s     s2, fa7
                  srli         gp, t4, 19
                  sub          a5, gp, t6
                  fsgnj.s      fs8, fa2, ft5
                  fdiv.s       fs4, fs7, ft0, rtz
                  sltu         s2, a5, a6
                  xori         s10, zero, -1928
                  and          ra, a1, s10
                  slti         tp, s7, -1904
                  feq.s        a5, fa5, ft7
                  fcvt.s.w     ft7, s7, rmm
                  addi         sp, a7, 1224
                  fsgnjx.s     fs4, fs2, fa4
                  addi         t1, tp, 1829
                  fmin.s       ft3, fa1, fs2
                  sub          s2, s6, t3
                  feq.s        s9, fa2, fs5
                  nop
                  fmax.s       ft8, fs11, ft8
                  or           s10, tp, t0
                  fcvt.w.s     t0, ft8
                  fmv.w.x      ft11, a4
                  mulhu        s11, t3, t6
                  mulhsu       a5, a0, t4
                  fdiv.s       fa7, fs3, fa1
                  fle.s        s9, fa2, ft2
                  sub          gp, a4, s3
                  addi         sp, s3, 1496
                  lui          s8, 524970
                  sltiu        s3, t4, 1738
                  slli         s9, t4, 10
                  flt.s        s1, ft6, ft6
                  fsgnjn.s     ft7, fa0, fs10
                  divu         a1, a5, t6
                  sra          a0, a4, a2
                  mulhu        s0, t2, t4
                  slli         sp, s5, 30
                  fle.s        s3, fa7, fs5
                  fmul.s       ft9, fs5, ft3, rne
                  fadd.s       fa2, fs9, fs2, rne
                  remu         s1, t4, t1
                  fsgnjx.s     ft3, fs10, fa7
                  div          s1, t3, zero
                  fdiv.s       ft10, ft8, fs1, rmm
                  auipc        zero, 63835
                  or           s6, a5, a0
                  srli         ra, s0, 17
                  flt.s        t2, fs1, ft8
                  sltu         s1, zero, zero
                  slli         s2, zero, 26
                  srl          a3, t3, t4
                  xor          s4, t6, t5
                  divu         s1, s2, t4
                  slt          gp, s8, a6
                  fsgnjn.s     ft7, fs3, fa4
                  fsgnjn.s     fs5, fa6, ft11
                  fle.s        t4, fs5, fs9
                  xori         s4, s1, -1758
                  fcvt.s.w     ft6, a6
                  fmin.s       ft7, fa7, ft8
                  fcvt.s.w     fs6, t4
                  srli         s8, t6, 22
                  remu         s8, gp, a0
                  nop
                  ori          t2, a6, -1593
                  sub          s0, s8, ra
                  lui          tp, 982470
                  fsqrt.s      fa3, fa5, rdn
                  fsub.s       ft11, fs2, ft2, rup
                  fmv.w.x      fs11, s6
                  rem          t4, a1, s9
                  auipc        s9, 959291
                  slt          a3, a0, t1
                  addi         s2, t4, 198
                  div          s8, s6, tp
                  slli         a7, zero, 8
                  or           a0, s8, a0
                  rem          zero, zero, tp
                  or           a6, s8, s7
                  fsgnjn.s     fa6, fs7, fs8
                  remu         a6, zero, s8
                  sltu         a1, s0, t6
                  remu         gp, ra, t2
                  xor          t1, t4, s8
                  mulh         s10, gp, zero
                  fcvt.wu.s    t2, fa3
                  fmin.s       fa2, fs4, ft7
                  remu         zero, t6, s5
                  mulhsu       gp, s9, tp
                  fmin.s       fa1, fs0, fs3
                  lui          t2, 647138
                  flt.s        t0, ft1, fa5
                  mul          s8, s3, a5
                  slli         a0, s0, 9
                  add          zero, a7, gp
                  fmv.x.w      s7, fs4
                  fmul.s       fs11, fs7, fa2, rtz
                  fcvt.w.s     s11, ft5
                  divu         s5, s9, s8
                  fle.s        a6, ft10, fa7
                  mulhsu       s3, s10, ra
                  fsgnjn.s     fa3, fs0, fs3
                  feq.s        t4, fs9, ft6
                  remu         s4, t4, a0
                  slti         s10, a1, -955
                  fcvt.w.s     t2, ft6, rdn
                  srai         a5, t6, 30
                  nop
                  andi         s1, a4, -1303
                  lui          a6, 405664
                  mulhsu       a5, a6, tp
                  srai         s5, s4, 7
                  flt.s        t2, ft1, fs5
                  auipc        s5, 419031
                  or           a7, a0, s3
                  fcvt.w.s     gp, ft6, rtz
                  srai         sp, zero, 26
                  fmax.s       ft7, fs4, fs9
                  fsgnj.s      ft0, fa6, ft3
                  srai         t4, tp, 22
                  fcvt.s.wu    fs5, a2
                  slti         s7, t6, 1067
                  lui          s4, 600135
                  addi         a6, t0, -1631
                  fcvt.wu.s    s0, ft7
                  nop
                  fsgnjx.s     ft3, ft4, fs6
                  fle.s        tp, fa5, ft6
                  fmv.w.x      ft0, sp
                  or           s11, s11, a5
                  fcvt.wu.s    sp, fs2
                  div          s8, s4, gp
                  mulh         gp, s5, t5
                  add          s11, zero, s11
                  mulhu        a6, t1, s1
                  slli         s4, s1, 17
                  fmax.s       fs0, fa2, fa7
                  flt.s        a7, fs5, fs8
                  auipc        zero, 807808
                  sltiu        s3, a4, -773
                  divu         t2, t0, tp
                  and          gp, t0, t1
                  fmin.s       fs4, ft7, fa2
                  fcvt.s.w     fs11, ra
                  srl          s3, a5, ra
                  fmv.x.w      s7, ft11
                  auipc        a3, 1019831
                  addi         s6, s11, 1322
                  fclass.s     s6, fs8
                  andi         s10, s11, -540
                  fmul.s       ft6, fa1, fa3, rtz
                  andi         s5, s9, 403
                  fadd.s       ft2, ft1, ft6, rmm
                  slt          a5, s5, t5
                  flt.s        s9, fs1, fs4
                  rem          a7, sp, a7
                  mulh         a7, a4, a1
                  lui          t5, 77888
                  fcvt.w.s     t2, fs4, rne
                  slt          t4, s3, t1
                  fmin.s       ft5, fa5, ft6
                  fclass.s     s0, fs10
                  ori          ra, a3, -634
                  fcvt.wu.s    s4, fa2, rup
                  fcvt.w.s     t0, fs0
                  fmv.w.x      ft5, gp
                  sub          s0, s1, ra
                  sll          sp, s2, s10
                  and          s1, zero, a3
                  fmax.s       ft10, fa0, ft6
                  xor          t0, a7, a4
                  addi         a6, a0, 240
                  fcvt.s.wu    ft8, s6
                  flt.s        a7, ft6, fs5
                  mulhsu       t0, t0, t5
                  srli         s2, t0, 16
                  mulhsu       s2, s9, a3
                  fsqrt.s      fs7, fa4, rne
                  fle.s        a5, ft9, ft9
                  fle.s        s1, fs3, ft9
                  and          s9, a0, s8
                  sub          zero, a5, s0
                  srai         a5, t5, 14
                  fmul.s       ft9, ft1, ft3, rup
                  srl          s0, a3, sp
                  fdiv.s       ft3, fs10, fs8, rmm
                  sub          t6, t3, a3
                  mulh         s1, a0, t2
                  slli         a0, s8, 2
                  sll          s6, a5, s4
                  nop
                  xor          a1, s5, s3
                  remu         sp, a5, s3
                  fcvt.s.w     fa7, t1
                  fmin.s       ft3, ft9, ft8
                  slt          sp, s3, s10
                  andi         a6, s0, 1472
                  divu         s6, s8, s7
                  fcvt.wu.s    s9, ft5
                  sltiu        ra, a2, 643
                  sll          s7, s8, s10
                  slli         s8, t0, 17
                  mulh         s0, a2, tp
                  slt          a0, s5, tp
                  add          sp, s0, s3
                  andi         a1, s11, -1718
                  fadd.s       ft2, fa2, fa1
                  mul          t6, zero, s1
                  fmin.s       ft1, ft0, fa6
                  fmv.w.x      fs11, a0
                  lui          gp, 176551
                  divu         s11, a1, s2
                  auipc        s7, 596483
                  slt          a1, gp, a4
                  fmin.s       fs4, ft3, fs8
                  fmv.w.x      fs6, a1
                  fmv.x.w      a1, fs6
                  srli         s6, a5, 5
                  fsgnjx.s     fa2, fs3, ft10
                  fmin.s       ft1, fs11, ft3
                  flt.s        tp, fs2, fa6
                  fcvt.s.w     fs7, s7
                  fsgnj.s      fs5, ft3, fa4
                  add          a3, s6, s0
                  slt          s0, s7, s9
                  srl          t4, gp, a1
                  flt.s        tp, fa0, ft1
                  divu         s7, sp, s9
                  fmin.s       fs11, fs11, ft1
                  fmin.s       ft10, fa7, ft2
                  fsgnj.s      ft4, fs1, ft3
                  xor          a1, s1, gp
                  fcvt.s.w     ft0, ra, rup
                  fmul.s       fs4, fs6, fs5
                  sll          a7, a2, t5
                  fmul.s       ft0, ft9, ft5, rmm
                  andi         s5, s3, 1783
                  flt.s        s0, fs5, ft1
                  divu         zero, a0, tp
                  mulh         s8, ra, t4
                  sll          t6, s1, t0
                  remu         ra, t2, s4
                  rem          t2, a0, zero
                  or           s5, s8, s1
                  fsgnjx.s     ft3, fs1, fa5
                  fcvt.s.w     ft6, s4, rmm
                  andi         gp, a3, 741
                  and          s8, t1, s6
                  mulh         s4, a3, s7
                  fmin.s       fs4, ft10, ft10
                  fcvt.s.w     fs0, s7, rdn
                  fcvt.s.w     fs11, s3
                  nop
                  rem          ra, s0, t0
                  fsub.s       fs0, ft5, fa6
                  xor          ra, a6, t4
                  xori         a6, s5, 353
                  slli         sp, tp, 23
                  fadd.s       fs0, fa6, ft0, rtz
                  fsub.s       ft1, fa6, fs2
                  ori          s3, t4, -316
                  mulhu        t1, s7, ra
                  sltu         s2, t2, s5
                  fmv.w.x      fa4, s9
                  feq.s        s0, fa4, ft6
                  and          zero, t4, a5
                  sltiu        s7, sp, -526
                  fcvt.wu.s    s11, ft4, rdn
                  fsub.s       fs9, fs5, fa1
                  slti         s1, sp, -519
                  flt.s        s7, ft2, fs0
                  add          s6, a1, s7
                  addi         t0, gp, 1928
                  feq.s        s6, fs5, fs6
                  fsub.s       fa6, ft0, fs5
                  auipc        s3, 666346
                  ori          sp, tp, -1652
                  ori          tp, a2, 480
                  slti         s0, s8, -552
                  mulhu        s3, a2, s2
                  mulhsu       a5, s0, s1
                  fsgnj.s      ft11, fs10, ft7
                  srl          s9, s10, s2
                  nop
                  add          a5, t5, a5
                  fmul.s       fa5, ft10, fa7
                  slt          s9, a2, sp
                  fclass.s     s11, ft5
                  sll          a7, t5, s9
                  fmv.w.x      ft0, a3
                  mulhsu       t0, s8, a0
                  fsgnjx.s     ft3, fa2, fa0
                  sub          t0, s10, t4
                  slli         t6, s5, 9
                  feq.s        a6, ft8, ft7
                  auipc        s0, 438769
                  nop
                  fadd.s       fs1, fa2, ft5, rdn
                  fcvt.w.s     a5, fs1
                  slli         t4, zero, 22
                  srai         s7, a4, 6
                  fcvt.wu.s    sp, fa1, rdn
                  srli         t1, a2, 20
                  xori         a1, s10, 1997
                  slt          s2, a1, s10
                  addi         s7, t1, -392
                  srl          s7, s8, zero
                  nop
                  fsqrt.s      ft2, fs8
                  add          a7, t4, t3
                  fsqrt.s      ft1, ft7, rmm
                  div          s3, t3, s3
                  div          sp, a6, s0
                  divu         t6, s11, s1
                  slt          s0, s6, a3
                  nop
                  fsgnj.s      fa2, fs11, fs11
                  fcvt.s.wu    fs3, a0
                  nop
                  fcvt.s.w     fa2, zero, rup
                  fcvt.s.w     ft0, a2, rtz
                  mulh         s2, ra, s5
                  srai         s4, tp, 1
                  fsgnjn.s     ft4, fs9, fs2
                  rem          s4, tp, s9
                  mul          ra, a0, t5
                  rem          t6, t2, a2
                  fmin.s       fs5, ft6, ft1
                  mulhsu       s6, a6, t1
                  srl          t4, sp, a5
                  andi         s8, a5, 1363
                  div          s11, s8, s10
                  sub          s5, a6, zero
                  mulhu        sp, t3, zero
                  srai         s3, t0, 18
                  or           s11, s3, tp
                  fsub.s       fs6, fa5, ft1, rdn
                  fsgnjx.s     ft3, ft0, fs1
                  auipc        s11, 821930
                  mulhu        t6, a0, s5
                  fmin.s       fa1, ft9, fs11
                  fle.s        zero, fa1, fs7
                  rem          a5, t0, ra
                  fle.s        a0, fa5, fa6
                  mul          zero, ra, a5
                  fsub.s       ft10, fa5, ft10, rne
                  srli         t6, s1, 16
                  sltu         s4, zero, a7
                  slli         a7, t2, 12
                  fsgnj.s      ft3, fs1, fs6
                  mulhsu       a7, a3, s5
                  mulhu        s1, t6, ra
                  fcvt.s.wu    fa7, a2
                  sub          s9, s0, s6
                  rem          t2, s7, t4
                  fsub.s       ft2, ft0, fs10, rne
                  and          a7, s1, a6
                  addi         a5, a1, -1482
                  rem          a0, t2, a1
                  srai         tp, s5, 2
                  xor          s2, t1, s2
                  nop
                  rem          ra, a7, a4
                  fcvt.wu.s    s7, ft2
                  fcvt.w.s     a7, fs10, rne
                  srai         s0, t2, 4
                  fsgnjx.s     fs4, fa6, fs3
                  mulh         s7, a5, s6
                  sll          a5, ra, s5
                  mulhsu       s7, tp, s1
                  srl          s6, t3, t1
                  sltu         sp, s0, s7
                  slti         tp, sp, 1080
                  add          s11, t2, t5
                  fsgnjn.s     ft8, ft9, fs4
                  slti         s8, a4, -1517
                  fsgnjn.s     ft2, ft7, fs11
                  slt          a3, s8, a2
                  sltiu        s6, tp, -1923
                  div          gp, s11, zero
                  sll          a0, s5, s7
                  andi         s10, s0, 230
                  slt          a5, s10, s2
                  fcvt.s.wu    ft7, tp, rne
                  sub          a6, s1, s4
                  fsgnjx.s     ft5, ft6, ft1
                  srl          s9, a0, s9
                  divu         s2, t5, a0
                  srli         s1, zero, 27
                  or           s6, a1, gp
                  lui          s6, 611843
                  slti         s11, t5, 670
                  rem          gp, s11, a1
                  fmax.s       ft9, fa0, ft8
                  mulhsu       a0, t2, s10
                  slt          t6, s8, s1
                  xor          t6, t6, s8
                  xor          a0, t6, a7
                  fclass.s     t0, fa3
                  mulhu        s5, t1, a3
                  mulhu        s5, zero, s2
                  feq.s        t6, ft6, fs5
                  fcvt.s.wu    fa3, t2
                  sltiu        tp, gp, 541
                  sll          s5, t3, t2
                  xori         t5, a6, -1814
                  fle.s        t1, fs5, fa0
                  fcvt.s.wu    fa1, s10
                  fsub.s       fa0, ft4, fa2
                  sll          s4, a1, s10
                  fsgnjn.s     fs1, ft6, fs8
                  addi         a5, s1, -673
                  fmin.s       fa7, fs7, fs8
                  mulhu        t5, s3, s10
                  srl          t1, s7, a2
                  rem          gp, t2, a4
                  flt.s        s3, fs6, fs10
                  lui          s10, 853131
                  rem          s8, s4, a3
                  flt.s        zero, fs2, fs6
                  rem          t2, t3, a6
                  fcvt.wu.s    s9, ft9, rdn
                  flt.s        a3, fs8, fa2
                  mulh         ra, s11, s8
                  fle.s        t5, fs10, fs5
                  fcvt.wu.s    s6, ft1
                  mulh         gp, a6, t5
                  fcvt.s.wu    fs3, t3
                  mul          s9, t5, a1
                  fsgnjx.s     ft11, ft0, fs7
                  feq.s        t0, fs9, ft9
                  feq.s        s7, ft7, ft8
                  fmul.s       ft6, fa3, fa4, rne
                  andi         a1, a1, -155
                  feq.s        ra, ft5, ft5
                  div          a0, a3, ra
                  xor          s1, s2, s7
                  slti         a3, t2, 1161
                  fmin.s       fs10, ft4, ft11
                  fmin.s       fs9, ft11, fa0
                  and          sp, s5, t2
                  fmax.s       ft4, fs8, fs10
                  fcvt.s.wu    fs5, a0
                  fsqrt.s      fs1, fs11, rup
                  rem          ra, s4, s10
                  mulhu        s0, a7, a7
                  fsgnjn.s     ft7, fa3, fs5
                  andi         sp, s3, 861
                  addi         t6, a1, 1960
                  xor          s11, t1, a2
                  nop
                  auipc        a6, 287665
                  fmax.s       ft11, fs7, fs10
                  andi         s1, s11, -1180
                  mulhsu       ra, a4, a2
                  srai         a0, s10, 1
                  andi         a3, s6, -44
                  fsgnj.s      ft0, fs6, ft1
                  fsqrt.s      ft0, ft10
                  sltu         a3, s8, a6
                  nop
                  add          a3, a3, sp
                  fle.s        t2, fs3, ft0
                  fclass.s     s9, ft3
                  xori         t5, s2, 1606
                  fadd.s       fs10, fs5, fs10
                  or           t6, a7, t0
                  xor          t4, a1, a7
                  srl          zero, a1, s7
                  slt          s4, t5, t6
                  slti         t1, a5, -1082
                  fmul.s       fa1, ft7, fs3
                  lui          a5, 696950
                  mulhsu       a3, a3, s6
                  fcvt.w.s     ra, fs1, rup
                  addi         a7, a4, 1463
                  remu         s7, gp, a1
                  fsqrt.s      fs6, fs6, rup
                  sub          s10, s11, s8
                  srai         a7, a7, 22
                  fcvt.s.w     fa0, s7, rdn
                  fmv.w.x      fs3, s11
                  div          t5, t3, zero
                  div          zero, gp, t1
                  fmul.s       fs1, fs4, ft4
                  fmin.s       fa3, fa6, fs7
                  fcvt.s.wu    ft2, s8
                  remu         a3, a4, s8
                  srli         a0, t6, 2
                  fmax.s       ft6, ft1, fs6
                  fdiv.s       fs2, ft4, ft3, rdn
                  lui          a5, 787982
                  and          s2, t5, zero
                  fmax.s       ft9, fa4, fa6
                  div          a0, s6, t6
                  and          a0, tp, t1
                  or           s6, t0, s2
                  fmv.w.x      fs6, t3
                  sltu         s6, t5, t6
                  lui          tp, 567436
                  feq.s        t5, fa4, fs8
                  slt          sp, t4, t2
                  fmin.s       fs4, fs4, fs2
                  fclass.s     t1, fa2
                  fclass.s     s11, fa5
                  fdiv.s       fs11, ft7, fs7, rne
                  auipc        s8, 489288
                  addi         t5, a6, 2008
                  fsgnj.s      ft9, fa5, ft11
                  fmax.s       fa4, fa7, fa0
                  slt          t6, s10, t5
                  ori          a5, t1, 796
                  fcvt.w.s     a7, ft4, rmm
                  slli         s6, a6, 28
                  divu         s9, sp, gp
                  fcvt.w.s     t5, fs9, rdn
                  nop
                  mulhsu       t0, a2, s0
                  flt.s        t2, ft2, fs0
                  auipc        s10, 376655
                  fmin.s       fa3, ft1, ft9
                  xor          s5, a1, gp
                  sub          s1, s9, a6
                  srli         s10, t6, 2
                  xor          s0, zero, t3
                  rem          gp, t6, tp
                  slt          t4, s5, a5
                  fcvt.w.s     s6, fs8
                  or           s11, s6, s3
                  fmul.s       ft0, fs8, ft11, rmm
                  fsub.s       fs9, fs2, fs3
                  sltu         s2, s0, s0
                  flt.s        zero, fs3, ft10
                  rem          s7, t6, a5
                  fmv.w.x      ft1, a6
                  fmin.s       ft3, fs7, fs1
                  fmul.s       fa1, ft11, fa3
                  slti         s5, a2, -1350
                  div          t6, s3, t0
                  feq.s        ra, ft7, ft5
                  sltiu        t1, s6, -730
                  and          s2, a0, t5
                  add          a1, s10, gp
                  fsgnj.s      fs3, fa6, fs2
                  ori          a5, zero, 391
                  srai         zero, a2, 12
                  flt.s        s11, fa1, fa2
                  sltiu        s4, s0, -246
                  fle.s        a6, ft8, ft3
                  slti         s1, s9, -1444
                  add          s0, t2, sp
                  xori         a6, tp, 1912
                  andi         s1, s7, 955
                  fcvt.w.s     ra, ft8
                  fle.s        a6, ft4, ft10
                  mulh         t6, sp, s5
                  fmv.w.x      ft1, a2
                  fsqrt.s      fs10, fs11, rup
                  fdiv.s       fa5, fs11, fs8
                  fsqrt.s      fa3, fs9
                  sub          gp, s9, ra
                  div          a1, a6, t4
                  addi         s1, s7, 102
                  sltu         a0, sp, s6
                  sub          s2, ra, a3
                  and          a6, s9, s11
                  fsqrt.s      fs7, fs4, rtz
                  ori          s6, s5, 1429
                  remu         a5, a5, t0
                  remu         t1, t6, tp
                  srai         s9, zero, 1
                  fmv.w.x      ft3, s11
                  flt.s        sp, ft11, fs9
                  xor          a3, a0, t2
                  srai         s11, s0, 23
                  divu         s6, t0, t5
                  div          s4, a3, s10
                  feq.s        s2, ft11, fs9
                  fsgnjn.s     fa2, ft8, ft0
                  xori         s1, t6, -1648
                  slti         a5, s8, -593
                  divu         a1, tp, a3
                  slli         a3, s10, 16
                  mulhu        a3, a1, s5
                  addi         t6, s9, -1291
                  xor          s1, t2, s5
                  xori         s5, sp, -201
                  fmv.w.x      ft7, gp
                  srai         tp, s9, 3
                  xori         s7, t0, 1549
                  fsqrt.s      ft2, fs7
                  or           a3, a0, s2
                  fmv.w.x      fs2, s3
                  auipc        s9, 453845
                  mul          s3, t0, a4
                  sltiu        ra, a2, -148
                  rem          t0, a6, s6
                  mulhu        a5, t1, s1
                  mulh         t4, a2, t2
                  mul          t5, s7, s4
                  rem          a7, s6, t0
                  fsqrt.s      fs9, ft2, rup
                  fsqrt.s      fa4, ft4, rdn
                  fmul.s       fs5, ft4, fa7
                  fcvt.s.wu    fa2, s1, rmm
                  mulhu        a0, s4, t4
                  sra          s3, s4, t6
                  add          s10, ra, a2
                  fmin.s       fa3, ft4, ft6
                  mulhu        s4, s11, t1
                  fcvt.s.w     fa7, a4, rup
                  ori          s10, t6, -1160
                  mul          gp, sp, s4
                  slti         s8, s2, -1264
                  nop
                  rem          a6, tp, s0
                  fcvt.s.w     ft6, t4
                  feq.s        s6, ft8, ft8
                  sltiu        a0, s3, 1534
                  fsgnjn.s     ft7, ft7, ft4
                  srli         t2, tp, 21
                  fcvt.s.w     ft0, t5, rup
                  fsgnjx.s     fs2, fs0, ft1
                  sltu         a6, t4, t2
                  fcvt.s.wu    fa5, a6
                  nop
                  fmax.s       fs4, fs8, ft9
                  fadd.s       fs0, ft2, fa4, rmm
                  mulhu        t5, a4, a5
                  addi         a1, ra, 1206
                  div          a3, s8, t4
                  nop
                  fle.s        s1, fa3, ft1
                  addi         s4, s10, -363
                  rem          s10, t6, s3
                  remu         a7, t1, t0
                  slt          a5, s3, t2
                  fmax.s       ft4, fs5, ft6
                  sltu         a3, zero, s5
                  fsgnjn.s     fs5, fa6, ft11
                  fcvt.w.s     s10, ft2, rne
                  fsgnj.s      ft6, fs2, fs2
                  fmin.s       fa6, fa1, fs5
                  add          a0, a4, a7
                  fsgnj.s      fa7, fs6, fa3
                  fcvt.s.w     ft3, zero
                  fmv.x.w      gp, ft9
                  fsub.s       fs5, ft4, fs8
                  mulhu        ra, s3, t2
                  fmv.w.x      ft2, t5
                  fsqrt.s      fa5, fs9, rne
                  fmul.s       fa6, fa3, fs3
                  fcvt.w.s     t5, fa6
                  fcvt.s.w     ft0, s9
                  fmul.s       fs4, ft7, fa1
                  sltiu        a1, gp, -1873
                  mulhu        s2, s11, s3
                  addi         tp, tp, 1668
                  andi         tp, t2, -1152
                  sltu         gp, s2, s11
                  fcvt.wu.s    a0, fa1
                  sll          s3, s1, s2
                  fcvt.s.wu    fa1, sp, rne
                  fsqrt.s      fs3, fs10
                  xori         s6, t3, 886
                  slti         a0, s8, -1159
                  xor          zero, gp, t1
                  fsgnj.s      ft3, fs1, fs4
                  rem          s3, ra, a0
                  sll          s10, s6, a5
                  fsgnjx.s     ft3, fs1, fa6
                  fmul.s       ft4, fa5, fs2, rdn
                  sltu         s5, s0, s2
                  slt          a6, a6, gp
                  addi         t1, a3, -604
                  fsub.s       ft2, ft10, fs7, rtz
                  ori          gp, s1, 2036
                  fcvt.s.wu    fa7, a7
                  sltu         s7, a2, t4
                  fsub.s       fs7, fs3, fs10
                  fcvt.s.w     ft11, s3
                  fcvt.s.w     ft5, s6, rdn
                  sra          t5, sp, s8
                  sra          t5, t0, s10
                  slli         s2, zero, 9
                  sltiu        s4, a4, 954
                  fle.s        t2, fs4, ft9
                  flt.s        a6, ft6, fs6
                  ori          s8, s1, 426
                  xor          sp, s8, a1
                  mulhsu       a6, s2, t4
                  fcvt.wu.s    t4, fs8, rdn
                  fsqrt.s      fs8, fa1, rup
                  nop
                  fdiv.s       fs8, ft6, fa1
                  sub          t5, a2, a4
                  srai         s1, t3, 24
                  mulhsu       a6, a6, a2
                  remu         t4, s0, s8
                  sub          tp, s9, t2
                  mulhu        a1, t5, zero
                  fsgnj.s      ft8, fs11, fs9
                  srai         a1, a3, 12
                  nop
                  sltu         t4, a0, s6
                  slti         ra, a3, -1339
                  ori          s4, sp, 1083
                  and          t5, a1, gp
                  mulhu        s8, s6, s11
                  sltu         zero, s7, s8
                  flt.s        s7, ft1, fa2
                  fsub.s       ft11, fs4, ft9, rtz
                  fclass.s     t2, ft9
                  fmv.w.x      fa3, t6
                  sltiu        s0, sp, 705
                  fmv.w.x      ft4, t4
                  mulhsu       s7, a0, s2
                  mulh         s11, t1, s11
                  fdiv.s       fs1, fs2, fs6, rtz
                  fcvt.s.w     fs9, s2
                  fadd.s       fs10, ft0, fs7, rmm
                  ori          zero, s3, 381
                  fsgnjn.s     fs5, fs3, ft5
                  xori         gp, s10, -1979
                  fsgnjx.s     ft11, fa1, fa1
                  sll          t1, s8, t1
                  feq.s        tp, fs10, fa3
                  xori         s4, zero, -1133
                  fmul.s       ft3, ft11, ft5, rtz
                  auipc        a5, 1012045
                  mulhu        a3, s5, a2
                  div          s1, t3, t4
                  fmv.w.x      fs7, zero
                  fdiv.s       ft9, fa2, fa3, rtz
                  fdiv.s       fs6, fa3, ft9, rne
                  mulhu        tp, ra, t1
                  xor          s10, a6, ra
                  fmax.s       fs3, fs0, fs9
                  fsgnjx.s     ft4, ft10, ft4
                  sub          tp, a5, a2
                  fcvt.w.s     s10, fa6, rmm
                  feq.s        a3, fs5, ft10
                  fmv.x.w      s7, ft6
                  mulhu        s11, ra, s10
                  feq.s        a5, fa0, fa4
                  fsqrt.s      fs1, fs1
                  sll          sp, s11, a0
                  fmv.w.x      ft7, s10
                  divu         a6, s4, s5
                  mulhu        a5, t1, s6
                  rem          s6, a6, a6
                  mulhsu       s5, s2, tp
                  fsgnjn.s     fs11, ft10, fa2
                  lui          t4, 174261
                  srai         s8, a3, 17
                  nop
                  fclass.s     s3, fs5
                  slli         t4, gp, 1
                  and          s10, a4, sp
                  feq.s        a5, fa0, fs9
                  addi         s1, s11, -1717
                  remu         s3, t5, a1
                  fmul.s       fs2, ft2, fa2, rtz
                  mulh         s0, a3, s9
                  lui          s3, 905715
                  andi         s9, s6, 172
                  sub          s11, s3, gp
                  sll          t0, a3, t3
                  fadd.s       ft0, ft11, ft9
                  fsqrt.s      fa0, fs9
                  auipc        t5, 661326
                  sll          a3, a6, gp
                  fsgnjx.s     ft4, fa1, fs9
                  remu         s2, s6, a2
                  fmv.w.x      fs9, t6
                  srli         s11, a1, 1
                  fmax.s       fa1, fs2, fs4
                  fmv.w.x      fs2, t5
                  fclass.s     a7, fs11
                  fcvt.w.s     s0, fa2
                  fcvt.wu.s    a3, fa3, rmm
                  and          t2, s6, t1
                  fdiv.s       fa1, fs10, ft1
                  fcvt.wu.s    zero, fa3
                  slli         s2, t4, 27
                  auipc        s5, 388074
                  fmv.w.x      fa4, s4
                  fmax.s       fs6, fa6, ft5
                  mulhsu       s7, tp, a1
                  fdiv.s       fs1, fs11, ft9, rne
                  srai         sp, t5, 10
                  xor          s10, s1, s9
                  fdiv.s       ft5, fa2, fa3, rdn
                  fcvt.wu.s    a0, fs5, rtz
                  add          s1, s3, zero
                  sra          gp, a1, a5
                  slli         s8, s7, 12
                  flt.s        sp, fs2, fs1
                  or           s4, t3, gp
                  or           t1, s3, t2
                  fdiv.s       fs0, fs7, fs9
                  slt          tp, s10, s5
                  fsqrt.s      fa2, ft5, rtz
                  fadd.s       fs1, fa7, fs8
                  fdiv.s       fs7, ft10, ft1, rne
                  or           t1, s4, s4
                  xori         gp, s10, -1412
                  fmv.x.w      a7, ft2
                  fle.s        s1, fa5, ft3
                  feq.s        sp, fa3, fs7
                  srli         s5, s7, 24
                  fsub.s       fa0, fs0, ft1, rup
                  fmv.w.x      fa6, s10
                  remu         t1, a7, a2
                  lui          a0, 654937
                  mulhu        a7, s4, a3
                  auipc        t1, 454071
                  and          s7, s4, s11
                  slli         a1, s3, 26
                  mulh         sp, a6, a5
                  sltiu        s8, a0, 1268
                  fmv.x.w      s9, ft6
                  flt.s        s1, ft6, ft0
                  and          s4, t5, zero
                  and          a0, t1, s0
                  srli         tp, tp, 23
                  addi         s0, s9, 1530
                  mulhsu       sp, s2, s11
                  fmv.w.x      fa2, s11
                  fcvt.s.w     fa0, t1, rtz
                  fadd.s       ft7, fs6, ft1
                  addi         t2, s10, 99
                  fcvt.w.s     t0, fs8
                  fcvt.s.wu    ft8, s0
                  fclass.s     t2, fs7
                  ori          s10, a0, -582
                  fsgnjx.s     fa4, fs9, fs0
                  sltiu        a3, s11, -705
                  sltiu        t6, t0, -343
                  feq.s        t1, fs9, ft1
                  sltu         s0, a6, sp
                  sll          s8, s10, t6
                  fmul.s       ft3, ft3, fs5
                  fcvt.s.w     ft2, a5
                  fmv.x.w      zero, ft9
                  fcvt.s.w     ft8, s0, rdn
                  fcvt.w.s     a3, fs6
                  fcvt.s.wu    fs10, a5
                  fcvt.s.wu    ft6, a2, rup
                  mulhu        a6, s10, t3
                  fle.s        a6, fa6, fa1
                  fsgnjn.s     fa3, ft7, fs9
                  ori          a5, ra, -237
                  andi         t6, s6, 99
                  sltu         a6, s4, a1
                  fsqrt.s      fa6, ft5
                  addi         s6, t4, -483
                  andi         a3, s5, -1064
                  div          t0, a6, s2
                  fsub.s       ft8, ft3, fa1
                  and          t2, tp, gp
                  fmv.w.x      fa2, s0
                  auipc        t4, 507470
                  fcvt.s.w     ft0, s9
                  slt          s1, zero, t3
                  sll          zero, s1, t4
                  and          sp, t1, s4
                  fmax.s       ft2, ft7, fa1
                  feq.s        tp, ft5, fa4
                  ori          a1, s9, -452
                  fcvt.s.wu    fs8, sp
                  slti         a0, a2, 1459
                  fmv.x.w      s3, ft6
                  xori         a6, t2, 184
                  sltu         ra, t3, zero
                  fmv.w.x      ft10, a6
                  xor          t5, t0, gp
                  fadd.s       fs1, fs3, fs10, rtz
                  ori          a7, s7, 433
                  ori          s3, t4, -1358
                  auipc        s3, 381389
                  fcvt.wu.s    t1, ft0, rup
                  fcvt.s.wu    fs11, zero, rmm
                  flt.s        t0, fa2, ft0
                  fsgnj.s      ft2, fa4, ft1
                  slti         s11, a7, 624
                  sltiu        a7, s8, 492
                  xor          a5, s9, s0
                  rem          s1, t1, s1
                  fsgnjn.s     ft9, fa3, fs5
                  addi         s7, sp, -505
                  slt          s1, t4, s8
                  slti         zero, a5, -1788
                  sltiu        a7, s9, -646
                  divu         ra, t4, gp
                  add          sp, t2, a5
                  mulh         zero, s3, t4
                  fmv.w.x      ft0, s9
                  fsgnjx.s     fs2, ft5, fa6
                  fcvt.wu.s    ra, fs0
                  and          s11, s3, s6
                  or           a3, s0, a1
                  xor          sp, a0, gp
                  slli         s6, s5, 22
                  flt.s        s4, fs5, fa6
                  fclass.s     s0, fs8
                  add          a3, s6, t5
                  div          a3, t3, gp
                  fcvt.s.wu    fa0, a3, rup
                  fmax.s       fs10, ft8, fs5
                  and          a0, a6, s9
                  fsgnjx.s     fa3, fa0, fa2
                  rem          tp, t2, s5
                  sltiu        s6, tp, 185
                  and          t1, s11, a6
                  slt          s8, t3, a5
                  fmul.s       ft5, ft9, fs3
                  flt.s        a6, fs8, fa2
                  fcvt.w.s     t1, ft1, rmm
                  xor          zero, s10, a4
                  fmin.s       fa3, fs2, ft5
                  fmin.s       ft3, fs6, ft7
                  fsgnjn.s     fa1, fa1, fa6
                  rem          a1, s0, a2
                  mul          a3, a4, s8
                  addi         t0, a1, 395
                  feq.s        s2, ft8, fs5
                  or           a1, s7, a2
                  sra          ra, s2, t3
                  sll          t1, s4, s8
                  fsgnjn.s     ft11, fs2, ft5
                  fcvt.wu.s    t0, fa6, rdn
                  fclass.s     s9, fs5
                  srli         tp, s11, 13
                  feq.s        a3, fs4, fs0
                  mul          s6, s10, s6
                  srl          gp, t0, a6
                  auipc        a6, 26438
                  slt          t4, s10, t2
                  fcvt.s.wu    ft1, a5
                  mulhu        s9, s7, s2
                  sub          t5, t1, t2
                  andi         s8, a1, 696
                  div          s11, t1, s6
                  fmul.s       fa6, fs0, fs1, rup
                  fclass.s     s8, fa7
                  fmax.s       fs3, fa7, fa6
                  xori         s2, s11, -1749
                  sltu         t5, s4, a4
                  fmax.s       fs8, fa5, fs4
                  fle.s        zero, fs9, ft8
                  slt          zero, s6, gp
                  or           gp, a7, s0
                  sub          t2, s7, t6
                  fcvt.w.s     a3, ft7
                  sra          t6, s8, t6
                  slti         s9, t6, 948
                  rem          ra, s3, s3
                  srli         s3, zero, 3
                  add          t0, s8, s11
                  xor          s10, t4, sp
                  fsqrt.s      fa2, fs0
                  fclass.s     t4, ft4
                  fmin.s       fs0, fs5, fa6
                  slli         a5, a0, 24
                  addi         sp, t3, 554
                  fsqrt.s      fa3, ft5
                  sll          s7, t3, a6
                  srli         t6, a4, 5
                  srl          s9, s8, s1
                  fmv.w.x      fs5, zero
                  fmin.s       fs5, fa3, ft6
                  sltu         s9, s8, s11
                  fle.s        s3, ft6, fs11
                  nop
                  fle.s        a0, ft0, ft8
                  fsub.s       ft4, fs2, ft6, rne
                  fsgnjn.s     ft1, ft10, ft11
                  fcvt.s.w     fs5, tp
                  fsqrt.s      fa1, ft5
                  fmv.w.x      fa7, s0
                  addi         sp, s4, -817
                  fsub.s       fs2, fs7, ft2, rdn
                  andi         t6, a0, -1553
                  sltu         s5, ra, t2
                  fdiv.s       fa3, fa1, fs6, rup
                  nop
                  addi         t5, t6, 1482
                  sltiu        t5, s10, -256
                  fcvt.s.wu    ft1, a5, rmm
                  slt          s10, s8, s8
                  srl          s1, s6, s5
                  slti         s2, s10, 1144
                  lui          t2, 388312
                  mulhu        a0, a1, a6
                  fcvt.w.s     a7, ft2, rmm
                  fsgnjx.s     fa3, fs0, ft8
                  sra          s10, s10, tp
                  divu         s8, a7, t5
                  remu         s1, s7, a5
                  fmin.s       ft10, fs5, ft10
                  mulhu        t1, a0, a1
                  mulhsu       s0, a4, t3
                  add          s6, zero, t1
                  fsgnjx.s     fs11, fs11, ft7
                  fadd.s       fa2, fs2, ft8
                  mulhu        t0, sp, tp
                  add          s2, a2, tp
                  and          t1, a4, s11
                  or           a5, a5, tp
                  fcvt.w.s     tp, ft5
                  fmul.s       fa1, fa1, fs3, rdn
                  rem          a7, s9, s5
                  fmul.s       ft5, ft10, fa4, rdn
                  fle.s        sp, fa1, fa6
                  rem          gp, a5, ra
                  mul          a5, s2, a1
                  add          zero, a2, t4
                  srai         t5, a0, 12
                  sra          zero, ra, s6
                  fclass.s     s11, fs7
                  fmul.s       fs9, ft10, ft0, rne
                  ori          s4, s10, -32
                  or           a7, s1, s8
                  sll          s8, a3, t5
                  sub          tp, t3, a4
                  mul          a0, s8, sp
                  fsgnjx.s     ft7, ft2, fa1
                  nop
                  div          a5, s2, s1
                  mul          a6, tp, t2
                  sltiu        s11, s6, -282
                  sltiu        gp, a4, 912
                  fclass.s     a1, fs5
                  fmin.s       ft11, fa5, fs5
                  remu         a0, s4, sp
                  sll          t2, t5, s11
                  rem          t0, tp, gp
                  sra          s7, s4, s2
                  mulhu        s3, a3, a1
                  fmax.s       fa1, fa5, ft6
                  addi         s2, s7, -621
                  srli         s0, a3, 12
                  and          s8, s4, t3
                  fclass.s     s6, fa1
                  srl          t4, s5, s5
                  sra          s5, s9, gp
                  or           s7, s11, sp
                  fclass.s     s1, fa7
                  fsgnj.s      fs6, fs11, ft1
                  and          t0, s6, s1
                  add          a7, s9, s9
                  fmv.w.x      ft8, s11
                  rem          s2, a2, tp
                  fcvt.s.w     fs0, a0, rdn
                  sll          s0, s6, s7
                  fsqrt.s      fs8, fs6
                  slt          tp, t1, a0
                  addi         t2, s10, -464
                  mulhu        a0, s5, s4
                  srl          t2, t4, s5
                  sub          s0, a1, a6
                  srai         t5, a6, 13
                  divu         a5, s11, s0
                  fsgnjn.s     ft1, ft0, fs10
                  fmax.s       fs3, ft9, fa0
                  lui          t6, 648423
                  add          gp, t6, s8
                  xori         t0, t6, 1568
                  xor          s1, s2, a5
                  srl          s5, s4, gp
                  fsub.s       ft8, fa5, ft4, rup
                  fcvt.w.s     s3, fs11
                  srai         gp, s7, 9
                  fcvt.s.wu    fs8, gp, rdn
                  fsub.s       ft11, fa1, ft7
                  sra          a7, s7, t1
                  fsub.s       ft6, fs5, fa4, rmm
                  fadd.s       ft10, ft11, ft9, rmm
                  lui          s0, 671029
                  andi         t2, s7, 1843
                  srli         gp, s1, 22
                  fmv.w.x      fs7, gp
                  srl          s1, s6, t5
                  fmax.s       fs3, ft2, ft1
                  sll          a5, s5, s5
                  fsgnjn.s     fa3, fa6, ft5
                  fsgnj.s      fa1, fs9, ft3
                  fcvt.s.w     fa7, a1, rmm
                  mul          a6, ra, s0
                  srl          a5, t0, s0
                  fcvt.s.wu    ft6, s3, rtz
                  fsgnj.s      fa6, ft1, fs5
                  auipc        a7, 603811
                  fsgnj.s      fa0, fs2, ft9
                  srli         sp, s8, 0
                  flt.s        t1, fa4, fa5
                  sll          s2, a4, t1
                  fmv.x.w      a0, ft3
                  fsub.s       fs10, fa2, fs8, rdn
                  fmul.s       ft10, fa7, fs2
                  fcvt.s.wu    ft0, s11, rtz
                  fmul.s       fs4, fa1, fa3
                  nop
                  fmin.s       fs11, fs9, ft3
                  slt          s9, zero, a6
                  fsqrt.s      fs11, ft5
                  lui          s7, 568391
                  fclass.s     t6, fs6
                  sltiu        s6, t6, -1013
                  xori         s0, a1, 1616
                  rem          tp, s1, s11
                  sltu         s4, a1, s10
                  flt.s        gp, fs7, fs11
                  slti         t2, gp, 969
                  srl          a7, a3, a2
                  nop
                  fsgnjn.s     ft2, fa3, ft2
                  andi         a1, s0, -57
                  fmul.s       fs11, ft5, ft8, rdn
                  fsgnjn.s     fs10, ft7, fs6
                  mulhu        t2, a2, t6
                  sra          a1, t5, s6
                  slti         sp, a7, 570
                  add          a6, gp, s11
                  fmv.w.x      fs10, s6
                  add          s9, s0, s8
                  auipc        s7, 758692
                  fle.s        s6, fs2, ft10
                  fmin.s       fs3, fa3, ft4
                  feq.s        s3, ft3, fa7
                  fsqrt.s      fa0, fa1
                  fcvt.s.w     ft2, t5
                  xori         t6, a1, -36
                  fcvt.s.w     fa5, t1
                  feq.s        t2, fs9, fs0
                  srli         t1, a7, 12
                  sltiu        tp, ra, -1156
                  fsqrt.s      fs0, fs9, rtz
                  slti         a1, t4, -1732
                  fmv.w.x      ft2, s1
                  fsub.s       ft1, ft10, fs9
                  fmin.s       fa2, fs8, fs11
                  fsqrt.s      fs2, ft8
                  xori         a7, s7, -575
                  lui          s10, 518303
                  fsgnjn.s     ft2, ft0, ft3
                  lui          s0, 581531
                  ori          s1, s11, 1714
                  sll          zero, zero, t5
                  mulh         a7, a4, t1
                  fle.s        zero, fs11, ft3
                  sll          t5, gp, s7
                  fmin.s       fa3, fs9, fa0
                  srl          s6, ra, s8
                  fadd.s       fs6, fs4, fs6
                  fdiv.s       fs0, fs1, ft10
                  and          zero, t6, s7
                  mul          s10, s0, a5
                  rem          s9, t5, s2
                  srai         s11, t1, 2
                  and          t2, s1, s4
                  sub          gp, t0, s6
                  slt          ra, gp, a1
                  xori         sp, a0, -1116
                  fmv.w.x      ft7, s0
                  mulhu        tp, a1, s4
                  xori         s10, a2, 1614
                  xori         s6, t2, -1250
                  sltiu        s1, a3, 1597
                  ori          sp, a7, 1212
                  mulhu        s4, a7, ra
                  andi         t2, t1, 2040
                  sltu         t5, a0, s3
                  fmv.w.x      fa3, s11
                  auipc        t5, 279997
                  remu         a1, a5, a4
                  mulhu        s6, sp, ra
                  fcvt.w.s     s8, ft7, rne
                  sra          zero, t2, s6
                  div          s8, s2, s7
                  sltu         t1, s1, a7
                  fsqrt.s      fs10, ft4
                  addi         s9, s7, -1914
                  mulhsu       gp, s4, tp
                  feq.s        t6, ft3, fa2
                  sltu         t4, s11, t5
                  srl          s1, t6, s9
                  fdiv.s       fs0, ft4, fa5, rne
                  mulhsu       s6, gp, s9
                  xor          s10, s5, t5
                  srl          s0, tp, s1
                  mulhu        sp, s3, tp
                  nop
                  feq.s        tp, ft8, ft8
                  div          s5, s1, t5
                  srai         s7, s0, 8
                  flt.s        zero, fs4, fa2
                  fcvt.wu.s    s6, fs2, rne
                  add          t5, t4, s2
                  div          a1, s2, s6
                  xor          ra, s4, s4
                  rem          t1, t1, s11
                  fle.s        s5, ft3, ft11
                  mulhu        a6, s5, tp
                  andi         t6, s7, -287
                  divu         s5, s9, a6
                  divu         s0, t2, s4
                  div          s8, t5, tp
                  divu         s9, s5, a7
                  mulhu        s0, a5, t4
                  mulh         t1, a2, s2
                  lui          s4, 453083
                  sltiu        t1, a0, -1895
                  mulh         s2, s2, sp
                  fmin.s       ft3, fs9, ft1
                  fmv.w.x      ft2, s10
                  fmin.s       fs10, fs11, fs3
                  fcvt.wu.s    tp, ft2, rtz
                  fle.s        t4, fs2, fs8
                  fsub.s       ft4, fs7, fa1, rdn
                  sll          a3, s2, t0
                  fsub.s       fa3, ft0, fs11, rne
                  fsqrt.s      fs0, fs1, rmm
                  slt          s3, a0, s9
                  mulhu        s1, s10, zero
                  ori          t2, a6, 605
                  and          a0, s11, ra
                  fmul.s       fa6, ft10, fs6
                  srai         s1, tp, 14
                  xori         s1, ra, -827
                  sltu         t5, a2, tp
                  or           a3, s1, t4
                  sra          s8, t5, a7
                  fmul.s       fs6, fs5, fs2
                  fmin.s       fa7, ft3, fs0
                  fsgnjx.s     fa0, fs10, ft2
                  fsgnjx.s     fa0, ft5, ft4
                  divu         zero, zero, t3
                  sltu         t1, t6, sp
                  divu         t6, a0, zero
                  div          a6, s2, s9
                  sltiu        gp, t2, 1825
                  fadd.s       ft5, ft7, fa2
                  flt.s        s2, fa7, fs0
                  fmv.x.w      a1, ft3
                  fcvt.s.w     fa3, gp
                  fsqrt.s      fa6, fs0, rup
                  srl          s4, a4, s1
                  xori         tp, gp, -143
                  fmax.s       fs11, fs1, fa4
                  sltiu        s1, s6, 38
                  remu         t6, a0, s10
                  fcvt.w.s     a3, ft9
                  srl          a6, sp, a4
                  sltu         s8, s7, t0
                  fcvt.s.wu    fs7, s7, rmm
                  auipc        s1, 801249
                  mulhsu       t6, s6, t0
                  srl          s5, tp, t2
                  fsqrt.s      fs4, ft9, rmm
                  divu         s9, a0, t6
                  sub          s10, a2, a4
                  mul          a0, t1, s4
                  sub          a3, s2, s7
                  lui          s9, 544500
                  and          t5, t2, s6
                  xori         s2, s4, 510
                  slli         s1, t4, 27
                  div          a5, t3, t1
                  mul          t0, a5, ra
                  divu         t0, t5, t6
                  fsub.s       ft0, fs11, fs6, rne
                  fsgnjx.s     fa0, fa1, ft1
                  flt.s        s11, fs5, fs9
                  fmv.x.w      a0, fa0
                  sltiu        s10, s10, 1620
                  andi         a6, s0, 71
                  div          a5, s10, a6
                  fmv.w.x      ft6, a4
                  fmax.s       fs8, fs4, fa2
                  and          a7, s9, s5
                  lui          s5, 277983
                  fdiv.s       ft4, fa7, fs8, rup
                  fdiv.s       fa3, fa5, fs7, rup
                  fsgnjx.s     fs11, fs5, ft6
                  fdiv.s       ft6, ft0, ft1, rne
                  fsub.s       ft8, ft8, ft0
                  ori          sp, s9, -666
                  mulhsu       a1, t1, a0
                  fsqrt.s      fa2, ft3
                  sltiu        a1, a3, -953
                  mulhsu       t2, a4, a3
                  flt.s        a6, fa4, fs2
                  mul          s8, a5, t0
                  srl          s6, t5, s9
                  sltiu        t4, s9, -1689
                  and          t0, s5, s7
                  fadd.s       ft11, ft6, ft0, rtz
                  mulh         s10, t6, s3
                  sub          sp, ra, t0
                  remu         s10, s3, s3
                  fle.s        tp, fs11, fs0
                  auipc        tp, 578388
                  fle.s        zero, ft10, ft7
                  slti         t5, s9, -1125
                  fsgnjn.s     fs2, ft2, fs8
                  or           t6, t1, s4
                  fmv.w.x      ft8, t6
                  and          s5, sp, s1
                  fmax.s       fa5, fs2, ft0
                  or           ra, a7, ra
                  add          t2, s7, s3
                  flt.s        s3, fs1, ft8
                  andi         a0, t4, -1034
                  sra          s0, a7, a3
                  remu         s10, a7, t2
                  srli         tp, t0, 10
                  and          s3, s1, a7
                  fle.s        t2, ft9, fa3
                  fsub.s       fs7, fs3, fa2, rne
                  sra          s8, a2, a0
                  mulhsu       s2, a1, gp
                  fmul.s       ft3, fs7, fs0, rup
                  srai         a0, gp, 6
                  fadd.s       ft3, fa0, ft1, rne
                  fsgnj.s      ft6, fs6, fa1
                  fle.s        t4, ft9, fs11
                  fsqrt.s      ft4, ft2, rup
                  sub          t2, s2, ra
                  ori          a1, t0, -1618
                  lui          s5, 402616
                  fcvt.wu.s    a1, fs6, rup
                  xor          ra, sp, t3
                  fmv.x.w      s7, fs9
                  feq.s        s0, fs7, fa7
                  and          zero, a1, s8
                  sltiu        s4, zero, 400
                  fmv.x.w      s2, fs3
                  fmin.s       ft5, fs7, ft11
                  fclass.s     t2, fa4
                  fmax.s       fs8, ft3, ft9
                  fmv.x.w      gp, fs4
                  addi         ra, a1, 833
                  auipc        s6, 696765
                  fmul.s       fs1, fa2, fs4
                  fmin.s       ft9, ft8, ft6
                  fsub.s       fa7, fa4, ft10
                  auipc        s8, 880634
                  mulhu        t6, a0, a0
                  divu         a1, tp, a5
                  or           s4, s10, a0
                  nop
                  srli         sp, a1, 27
                  slti         s5, t2, -1756
                  mulh         a6, s10, s7
                  fadd.s       ft7, ft11, fs7
                  fcvt.w.s     t2, fs6
                  srl          s8, s6, s7
                  mulhu        s3, s10, tp
                  slt          a5, ra, s1
                  slli         sp, gp, 22
                  ori          s11, s11, -565
                  fmul.s       ft1, fs2, fs2
                  fcvt.w.s     t5, ft6
                  fcvt.s.w     ft4, a3
                  srl          t4, a7, tp
                  addi         s4, s10, -946
                  fsub.s       fs6, fs9, fs8, rmm
                  fclass.s     a7, ft8
                  lui          tp, 934731
                  fsgnj.s      fa3, fs2, fs7
                  srl          a5, s7, s9
                  sltiu        t6, t4, -1696
                  fle.s        t5, ft9, ft11
                  or           s2, s6, a4
                  mul          t0, s0, t5
                  ori          t2, t1, 503
                  feq.s        a6, ft10, fa4
                  auipc        s8, 901736
                  fle.s        s7, fs9, fa4
                  srl          s6, s6, s7
                  srai         tp, t4, 29
                  fcvt.s.wu    fs2, sp
                  fle.s        sp, fs8, ft7
                  slt          t1, s5, s6
                  fmv.w.x      fs3, gp
                  mul          s7, ra, a1
                  addi         t2, a1, 561
                  fmv.w.x      fa7, a7
                  slt          a5, t0, s3
                  andi         s3, s10, -1238
                  fle.s        a3, ft9, fs11
                  fsub.s       ft7, ft2, ft5
                  xori         s2, a4, 1751
                  sra          s5, gp, t4
                  div          s8, a6, sp
                  fsgnjx.s     fs3, ft11, fs4
                  fsub.s       fa6, fs8, fs4
                  and          gp, a7, s7
                  divu         s11, a2, a6
                  auipc        a5, 54394
                  div          s10, t1, a4
                  and          t4, tp, s6
                  fmv.x.w      s7, fs10
                  fadd.s       ft2, fs4, ft11
                  slli         s2, a1, 25
                  srl          zero, s0, s4
                  sll          tp, a6, s0
                  slti         s11, sp, -1558
                  and          s4, a2, ra
                  fclass.s     ra, fa0
                  mulhsu       s10, s6, a1
                  flt.s        s6, fs2, fs6
                  fmax.s       fs0, fs4, ft4
                  remu         t1, zero, a7
                  or           a1, s6, s5
                  fmv.x.w      sp, ft2
                  mulhsu       t5, sp, a3
                  mul          s8, a6, s7
                  nop
                  srl          s9, s0, t1
                  fadd.s       fa6, ft11, ft10, rtz
                  rem          a1, a2, t4
                  remu         zero, a6, ra
                  andi         t1, t5, 179
                  sra          s4, a2, s7
                  auipc        t6, 697047
                  sltiu        t4, t5, -1808
                  mulhu        zero, gp, tp
                  fsgnj.s      fa0, fa1, ft8
                  flt.s        s7, fs10, fa2
                  fmv.w.x      fa1, t3
                  fmul.s       fs7, ft4, fs4
                  flt.s        s4, fs4, fs8
                  fcvt.s.w     fa6, a4, rmm
                  fle.s        a0, fa3, fs4
                  fsgnjn.s     fa5, fs1, ft0
                  fdiv.s       ft8, ft0, fs9
                  or           s8, s9, ra
                  fsgnjn.s     fs8, fa5, fs9
                  ori          t1, a6, -1335
                  sub          s3, a6, s6
                  lui          t4, 407670
                  srl          s5, a3, s8
                  mulhu        s6, s0, gp
                  fmin.s       ft8, fs7, ft3
                  rem          s7, a2, s9
                  fcvt.s.w     ft11, s3
                  slti         t2, a2, 1660
                  fmin.s       fs4, ft0, ft1
                  fmin.s       fs0, ft0, fa3
                  fsgnjn.s     fs0, fa1, ft9
                  slt          t5, gp, tp
                  sltiu        a3, t5, -1229
                  mulhsu       t2, s10, t2
                  fmin.s       fa0, fs3, ft1
                  fmv.x.w      t6, ft7
                  fclass.s     a1, ft7
                  auipc        s4, 676560
                  sub          t0, t0, s6
                  srai         a7, t6, 4
                  divu         gp, gp, a6
                  fle.s        s11, fs2, fs1
                  mulh         s7, t4, a3
                  fsgnjx.s     fa6, fs8, fs1
                  remu         s3, t0, s7
                  or           a6, a5, t6
                  fdiv.s       fs4, fa7, ft7
                  fmul.s       ft4, ft7, fa4
                  rem          s9, a2, s6
                  andi         s11, a4, 1110
                  nop
                  fcvt.s.wu    fs0, t3, rne
                  fsub.s       ft1, fs7, fs9
                  rem          s9, t0, s4
                  mulhsu       zero, s11, s5
                  fcvt.s.wu    ft5, t0
                  fmv.x.w      s0, ft6
                  fsgnjn.s     fs7, ft10, fa3
                  fmin.s       ft10, fa2, fs1
                  sra          t6, t5, s5
                  addi         s5, a6, 655
                  mulhsu       s3, t6, s10
                  remu         t2, tp, zero
                  nop
                  fmul.s       fs2, fs4, fs3
                  slli         t2, t6, 7
                  andi         a1, s7, 1078
                  fdiv.s       ft10, fs8, fa5, rup
                  srl          a6, a0, a4
                  fclass.s     s1, ft9
                  fsqrt.s      ft6, fa2, rdn
                  fsqrt.s      ft3, fs7
                  fmax.s       ft10, ft11, fs4
                  remu         t5, sp, zero
                  ori          t5, s11, 841
                  fmv.x.w      zero, ft6
                  fsgnj.s      ft2, ft9, fs0
                  fsgnjn.s     fs7, fs2, fs5
                  sltiu        gp, a1, -2015
                  remu         tp, a5, a3
                  fsgnjx.s     fa3, fs1, fa6
                  ori          t0, s0, 2026
                  fmax.s       fa3, fs2, ft7
                  fmul.s       ft2, ft5, fa0
                  add          a1, s2, tp
                  fmv.x.w      a0, fs2
                  fcvt.w.s     t4, ft10
                  andi         a0, ra, -1787
                  fsgnj.s      fs9, ft2, ft3
                  fcvt.w.s     s4, fs0, rup
                  nop
                  slti         gp, s0, -2005
                  fdiv.s       ft11, fs11, ft5, rmm
                  xor          a3, a2, t5
                  fmin.s       fs3, fs7, fs6
                  sll          t4, tp, s9
                  lui          s10, 344070
                  fmin.s       fa5, ft10, fs9
                  fle.s        s1, fs10, fa0
                  fsqrt.s      ft1, ft11, rtz
                  and          s1, zero, s2
                  andi         t5, a3, -1359
                  divu         s0, s6, s9
                  xor          tp, s7, s3
                  fmax.s       fa2, fa5, fs11
                  fmax.s       fs9, fs4, fa0
                  auipc        s4, 1005124
                  mulhsu       s10, a0, zero
                  mulhu        t1, gp, t5
                  mul          s1, a2, s5
                  or           s2, s4, t3
                  xori         t6, a5, -503
                  lui          a7, 896746
                  fmul.s       ft8, ft4, fa1
                  xor          a6, s3, a3
                  fsgnjn.s     ft1, fa2, fs2
                  sub          t1, t4, s2
                  fsqrt.s      fa1, fa1, rdn
                  feq.s        a3, fs8, fs10
                  flt.s        a0, fa7, ft2
                  and          s6, s6, s2
                  fmv.x.w      sp, ft0
                  fsgnjx.s     fa4, fs2, ft5
                  fcvt.s.w     fs6, a1, rne
                  mulhu        s2, s5, tp
                  ori          s3, s10, 1224
                  fmul.s       ft3, ft7, fs5
                  fsqrt.s      fs3, fs11, rmm
                  xori         a0, sp, 1783
                  fle.s        gp, ft5, fs11
                  fcvt.wu.s    t2, ft9
                  fcvt.wu.s    t1, ft5
                  sra          t2, t1, a0
                  fsgnjn.s     fs6, fa7, ft3
                  fmv.w.x      fs4, gp
                  sltiu        a7, gp, 2032
                  and          zero, s7, a2
                  flt.s        s1, fs10, fs5
                  auipc        sp, 195709
                  srai         tp, zero, 27
                  srli         s0, a4, 4
                  fsgnjn.s     fa2, ft0, fs11
                  mulhsu       a5, s4, a0
                  sltu         a3, a0, s3
                  srli         tp, a4, 23
                  fle.s        a0, fs1, fa5
                  fcvt.s.wu    fs3, s8
                  xor          t5, t0, t1
                  lui          t4, 588247
                  add          sp, t1, s5
                  or           s9, a5, s5
                  sll          a0, s10, a1
                  fdiv.s       ft7, fa2, fs10, rne
                  lui          a5, 828848
                  or           tp, s1, t2
                  fmax.s       fs0, ft5, fs8
                  xori         t5, a3, -342
                  xor          s0, t6, a5
                  ori          gp, s7, 1764
                  sub          gp, t3, t6
                  divu         s0, s7, s2
                  mul          a1, tp, s10
                  fcvt.s.wu    ft8, s6
                  mulhu        t1, t2, a1
                  mul          t4, s5, s0
                  srl          s1, s3, s2
                  sll          t5, ra, gp
                  fsub.s       ft0, ft5, fa2, rup
                  sra          s8, a1, t2
                  fcvt.s.w     fa5, tp, rdn
                  sll          s7, sp, a0
                  fsqrt.s      fs10, ft0
                  fcvt.s.w     fs10, gp
                  nop
                  fcvt.s.wu    fa6, gp
                  or           s11, t3, s3
                  nop
                  fsub.s       ft4, fs9, fa6, rne
                  fmv.x.w      s5, ft1
                  sub          s5, s9, gp
                  feq.s        s8, fs11, ft4
                  sll          s6, a3, ra
                  fsub.s       ft4, ft10, fs11
                  srli         t4, t5, 29
                  slt          a6, s7, s10
                  add          s11, zero, a7
                  flt.s        a7, fs8, ft10
                  fcvt.wu.s    t4, fs2
                  sub          a0, t6, s6
                  fcvt.w.s     s10, fs6, rup
                  sub          s9, s0, s7
                  fcvt.wu.s    t5, ft3
                  fcvt.s.w     ft8, s9, rtz
                  fle.s        s0, fa4, ft11
                  xori         s2, t3, 434
                  fdiv.s       fs3, fs9, ft3, rmm
                  mul          s2, t0, s10
                  fmax.s       fa1, ft8, fs3
                  nop
                  rem          a6, t2, s7
                  sub          a6, zero, a0
                  mulhu        t2, t6, s2
                  fcvt.s.wu    fa7, s8, rtz
                  slt          t6, s2, s7
                  fsgnjn.s     ft7, fs11, ft7
                  lui          a1, 167696
                  slt          t6, a2, a7
                  remu         s8, tp, a5
                  fmul.s       ft10, ft10, fa5
                  div          t5, t2, zero
                  xori         t4, s8, 178
                  sra          s5, sp, s2
                  fsqrt.s      ft0, fs7, rmm
                  srl          s9, a2, a7
                  fcvt.wu.s    t6, fs10, rtz
                  slli         s9, a3, 28
                  fcvt.s.wu    ft7, s5
                  fle.s        a7, ft0, fs3
                  fmv.w.x      fs0, zero
                  fmul.s       fs3, ft2, fa2
                  add          s11, s2, a0
                  slt          s8, a7, ra
                  fcvt.s.wu    ft1, s11, rtz
                  fsub.s       ft11, ft1, fs1
                  ori          s2, t5, -85
                  fcvt.w.s     t1, ft7
                  srai         s6, t4, 14
                  slti         s7, a2, 1382
                  srai         gp, s2, 0
                  fsub.s       fa0, ft6, fs6, rup
                  addi         s10, s11, -1090
                  xor          a7, gp, t3
                  fmv.w.x      ft11, a5
                  fle.s        s2, ft7, fa0
                  sra          t4, a0, s2
                  fcvt.w.s     zero, ft0
                  fcvt.s.wu    fs5, t3, rmm
                  fmax.s       ft2, fs7, ft1
                  fsgnj.s      fs0, ft1, fa0
                  fcvt.s.wu    fs9, sp, rmm
                  srl          a5, t4, t1
                  fcvt.w.s     s11, fs10
                  andi         a1, s6, -8
                  fle.s        s2, ft3, ft2
                  fdiv.s       ft5, fs9, fs1
                  slt          zero, a4, s5
                  mulh         a3, s3, a7
                  nop
                  divu         s8, t5, a5
                  slti         s11, zero, 745
                  flt.s        a0, fs4, fs9
                  slti         a5, a4, -527
                  fcvt.s.wu    fa6, a3, rdn
                  sltiu        s2, a4, 1094
                  or           a6, s5, s5
                  sltiu        s3, a5, 736
                  xori         gp, t4, 1079
                  sltiu        s2, s9, 917
                  or           s2, s8, a4
                  fadd.s       fs3, fa5, fs7
                  remu         zero, a7, s5
                  fcvt.w.s     s11, fa6
                  fsgnjn.s     fs8, ft3, fa6
                  fsgnj.s      fa7, fa6, fs8
                  mulhu        ra, s8, s1
                  sra          gp, s3, a0
                  slti         ra, a0, -203
                  mulhsu       ra, t1, s11
                  fcvt.s.wu    ft1, a0
                  srai         s5, a0, 29
                  fmv.w.x      ft0, t4
                  fmv.x.w      s4, ft6
                  fcvt.w.s     s2, fs11, rne
                  fsgnj.s      fa4, fs4, ft5
                  fmin.s       ft11, fs7, ft9
                  div          t5, s1, t5
                  divu         a0, s4, t5
                  mul          s7, a2, tp
                  fdiv.s       ft9, fa2, ft4
                  srai         a0, a7, 12
                  fsqrt.s      ft3, fa3
                  slli         a0, gp, 0
                  xori         a3, s1, 2010
                  slli         s6, gp, 11
                  fsqrt.s      fs1, fs7, rne
                  andi         s5, gp, 1736
                  addi         s10, a2, 80
                  lui          s7, 127181
                  addi         s5, s10, 154
                  fsub.s       fs0, fa6, ft3, rtz
                  fmin.s       ft9, ft1, fs1
                  divu         t0, s6, t0
                  auipc        s4, 890817
                  fle.s        s9, fs10, fs8
                  and          s3, a4, a2
                  mulhu        t1, a5, s9
                  nop
                  fmul.s       fs0, ft4, fs8
                  lui          s11, 573366
                  mulhsu       s2, s10, sp
                  addi         sp, a6, -501
                  flt.s        a6, fa7, fs5
                  slti         t5, a2, 746
                  mul          s2, s2, t6
                  add          s0, tp, s0
                  nop
                  srl          zero, t0, a3
                  fcvt.w.s     s3, fs8
                  auipc        a5, 211795
                  fmv.x.w      t4, ft10
                  fcvt.wu.s    t4, ft8
                  remu         tp, a6, a0
                  fcvt.s.w     ft3, tp, rne
                  flt.s        a1, fa7, ft1
                  fsgnjn.s     ft7, ft1, fs1
                  fdiv.s       ft8, fs0, ft1, rtz
                  fcvt.s.wu    fs0, t0, rne
                  div          s4, a5, a0
                  slli         a5, t2, 22
                  fsub.s       fs0, fs9, ft3
                  flt.s        a0, ft10, fs6
                  fadd.s       ft9, fa7, ft5, rtz
                  add          s10, a3, zero
                  sltiu        s7, s10, 1670
                  nop
                  mulhu        a6, zero, a6
                  or           s3, t6, t6
                  or           s11, sp, s2
                  fmv.w.x      ft9, a5
                  slt          a3, t0, t1
                  srai         a1, ra, 11
                  srai         gp, tp, 31
                  fclass.s     s1, ft3
                  fmax.s       fs2, fs9, ft7
                  xori         s6, s11, 558
                  fsub.s       fs4, ft8, fa6, rdn
                  mulhu        a1, s9, a4
                  sub          t5, a5, s4
                  sltiu        sp, s9, -917
                  fcvt.wu.s    s11, fs4, rne
                  feq.s        s7, fa2, fs7
                  lui          tp, 24344
                  lui          s6, 218698
                  fsub.s       ft2, fa1, ft11, rne
                  addi         s9, s10, 1226
                  fmax.s       fs4, fa1, fa2
                  fsgnjx.s     ft7, fs0, ft6
                  add          s6, t1, t2
                  mulh         a5, tp, s3
                  div          a5, zero, a1
                  sra          t0, sp, s4
                  srai         s11, t1, 14
                  srl          sp, s8, t2
                  fmul.s       ft4, fs0, ft10
                  sltu         t5, t2, t3
                  mul          sp, s11, t3
                  fcvt.wu.s    zero, fa0
                  fsgnjn.s     ft1, fa5, ft3
                  fsgnj.s      fs5, ft6, fs9
                  fadd.s       fa2, fa1, fs11
                  slti         a3, t6, -1079
                  fmul.s       fs0, fs3, ft7
                  fdiv.s       ft7, ft9, fs4, rup
                  feq.s        a0, fs1, fa7
                  slti         s11, s5, -1413
                  fclass.s     a1, fs3
                  sub          s5, s7, a4
                  fcvt.s.wu    ft9, a2
                  srai         a6, a1, 25
                  divu         t6, s2, t5
                  srai         a6, t4, 9
                  or           gp, s9, s3
                  fcvt.s.wu    fa7, s11
                  fsqrt.s      fa5, fs1, rdn
                  sltiu        s6, gp, -209
                  fsgnjn.s     fa5, fs6, fa1
                  fcvt.w.s     ra, ft2, rup
                  mulh         s2, s6, t2
                  flt.s        a7, fa7, ft11
                  fsgnj.s      fs4, ft7, fa6
                  mulh         s10, s8, ra
                  fcvt.s.wu    fa0, a0
                  sra          t4, t4, gp
                  fcvt.s.w     ft3, s10, rmm
                  ori          tp, ra, 1019
                  sltiu        s10, sp, -1512
                  slt          s11, s1, t6
                  xor          t4, a7, t6
                  fcvt.w.s     s8, fs1, rne
                  remu         s0, s9, a1
                  add          s4, a1, sp
                  slli         t1, t5, 31
                  flt.s        s0, ft2, ft8
                  fcvt.s.wu    ft8, s7
                  sltu         s9, s7, s4
                  fdiv.s       fs8, fs8, fs4
                  sra          s8, s8, s11
                  fclass.s     s4, fs1
                  fmv.w.x      ft1, s6
                  addi         s11, t4, -71
                  srl          s3, sp, zero
                  srai         s0, s11, 30
                  feq.s        s8, ft8, fs3
                  fmax.s       fa3, fa1, ft9
                  fsub.s       fs5, ft7, ft6
                  fsgnjx.s     fs10, ft11, fs2
                  lui          t0, 447303
                  fcvt.s.wu    ft7, t4
                  divu         t1, s4, s1
                  slt          ra, s10, t6
                  fsqrt.s      ft6, fs6, rmm
                  mulhsu       s2, s7, s10
                  mulhsu       s4, a5, s7
                  sltiu        s5, t2, -1719
                  fsgnjn.s     fa1, ft2, ft3
                  fmv.w.x      fs0, tp
                  fmin.s       ft9, fa4, ft6
                  fsqrt.s      ft6, fa7, rtz
                  fmul.s       fs7, fa6, ft10
                  srl          t0, t5, zero
                  fcvt.s.wu    fa3, a1, rne
                  andi         zero, s11, 419
                  add          t0, a5, s1
                  srai         a3, s4, 1
                  slt          t4, a7, s11
                  sll          s4, s5, t6
                  fmax.s       fs2, ft3, fa4
                  fmv.w.x      ft0, ra
                  rem          s5, t6, a2
                  srli         t2, a0, 22
                  fsgnjx.s     ft7, fs6, fs11
                  fsqrt.s      ft4, ft11
                  fsqrt.s      ft6, fs11, rtz
                  fcvt.s.w     ft2, t2
                  divu         s10, a3, s7
                  mulh         s6, t2, a0
                  flt.s        s0, fs1, ft5
                  sltu         tp, a4, s11
                  slli         sp, s2, 12
                  fmax.s       fs2, fa0, fa6
                  xor          a1, s10, s6
                  mulhu        s4, t0, s5
                  fmul.s       ft10, ft4, fs10, rne
                  sub          a0, s11, s6
                  andi         a1, a7, -1463
                  fle.s        a1, fs1, fs5
                  fle.s        a1, fa7, ft3
                  div          t5, s10, gp
                  fsub.s       fa6, fs0, fa0, rtz
                  fsqrt.s      ft2, ft4, rtz
                  srli         s9, a2, 24
                  srl          s6, t3, a4
                  feq.s        gp, fs4, fs0
                  fcvt.s.w     fs8, a0, rne
                  fsgnjn.s     ft5, fa5, fs9
                  or           s5, t1, sp
                  slt          zero, tp, s6
                  mulh         zero, t0, a2
                  fsqrt.s      ft8, ft1
                  slli         s8, s9, 30
                  andi         tp, s0, -1473
                  fcvt.w.s     t6, fs6, rne
                  fsgnj.s      ft3, fs8, ft10
                  add          s2, a3, t1
                  xori         t2, s11, -471
                  fsgnjx.s     ft2, ft11, fs1
                  sll          tp, s1, ra
                  divu         t5, s2, a6
                  flt.s        a1, ft5, fs9
                  ori          a5, t1, -1971
                  fsgnj.s      fs5, ft11, fa4
                  rem          t2, t0, ra
                  auipc        t4, 745490
                  ori          gp, a5, 614
                  fcvt.s.w     fs11, s0, rmm
                  sub          zero, t4, s11
                  fmin.s       fa0, ft8, ft8
                  mulhu        a3, s6, t2
                  sub          a5, a7, s6
                  addi         s10, gp, -1600
                  fdiv.s       fs4, fa1, fs7
                  fsgnjn.s     fa3, ft7, fs6
                  rem          gp, t1, tp
                  fcvt.s.wu    fs2, s11
                  addi         ra, zero, 1075
                  xori         s2, s3, -1167
                  div          s7, a6, t0
                  divu         s0, a5, s9
                  sll          t1, a4, ra
                  fsub.s       fs2, ft1, fs10
                  fmin.s       fs11, fa2, ft7
                  slli         zero, a3, 13
                  sltu         t1, gp, t6
                  mulhu        s3, a1, a0
                  slti         gp, s3, 691
                  remu         s8, t1, s0
                  fsgnjn.s     ft7, ft9, ft2
                  sltu         a1, a5, s10
                  xori         t0, s4, 787
                  mulh         t4, s2, s5
                  divu         zero, s10, t0
                  srl          s2, s9, s4
                  mul          a7, s4, gp
                  or           s3, s6, a4
                  srl          a6, a2, s10
                  srai         t6, t3, 21
                  sltiu        s3, sp, 1761
                  fsgnj.s      fs6, fa6, fa0
                  and          t4, s5, s6
                  and          s3, s2, a4
                  fmul.s       fs6, fa4, ft10
                  div          s1, a1, s8
                  srl          t6, s11, s5
                  slli         gp, s6, 5
                  xor          s5, a2, t2
                  srl          s1, t5, a0
                  fcvt.w.s     s9, fa5
                  nop
                  fsgnjn.s     fs8, ft8, fa5
                  fcvt.s.wu    fa6, sp, rne
                  and          s11, s4, t1
                  slt          t0, t2, s1
                  fmin.s       fa5, fa0, fs1
                  fclass.s     sp, ft8
                  div          a3, s7, tp
                  fsgnj.s      fs2, fs8, fs4
                  sltu         a6, s11, s8
                  and          s10, sp, a7
                  fadd.s       ft4, fs8, ft5, rtz
                  srl          gp, ra, s1
                  fsgnj.s      fs10, fs4, fs5
                  fsgnj.s      fs5, fa3, fs6
                  fcvt.w.s     a5, ft5
                  flt.s        s7, fs0, ft2
                  fsqrt.s      fs6, ft6, rmm
                  lui          s2, 519275
                  mulhu        s3, sp, s7
                  remu         ra, a2, s4
                  sltiu        s3, s9, 2036
                  flt.s        a1, fs9, fa3
                  add          a7, t3, s11
                  sub          s4, a6, s5
                  auipc        a5, 138029
                  divu         sp, s0, t5
                  sub          sp, t3, t4
                  fmax.s       fs6, fs8, fs9
                  fsgnj.s      fa3, fs6, fa7
                  flt.s        a7, ft9, fa7
                  fmin.s       fs6, ft3, fa6
                  andi         s3, s0, -176
                  srai         s7, t2, 16
                  and          t4, s11, t4
                  slti         t5, tp, 1492
                  fmul.s       fs9, fs4, fs9
                  slt          ra, gp, a0
                  mulh         s4, a7, gp
                  fle.s        zero, fs2, fa1
                  remu         zero, a2, t1
                  xori         s7, a5, 913
                  fmv.x.w      s7, fs9
                  mulhu        s4, s9, s1
                  slt          t0, t5, s7
                  sub          s6, s2, a6
                  add          a1, s9, s1
                  flt.s        s10, fa2, ft5
                  fmv.x.w      zero, fs11
                  fcvt.wu.s    t4, ft8
                  fsqrt.s      fs7, fs2, rne
                  flt.s        a6, fa5, fs8
                  addi         t4, t4, 1419
                  fmv.w.x      fa7, ra
                  fmul.s       fa3, fs8, ft7
                  sra          s6, t5, sp
                  nop
                  sra          sp, sp, a1
                  andi         s8, a4, 1615
                  divu         zero, a1, a3
                  auipc        t1, 742086
                  flt.s        a0, fs8, fs7
                  feq.s        t0, fs3, fa3
                  sll          t2, ra, t4
                  srli         s11, a2, 1
                  divu         zero, s5, s1
                  fsgnj.s      fs1, ft7, ft10
                  mulhu        s2, t5, s2
                  fsgnjx.s     fs6, fs8, fs5
                  mulhu        t4, t6, s3
                  remu         s11, s0, s9
                  lui          s6, 344256
                  mulhsu       s5, a4, t1
                  fsqrt.s      fs8, fa6, rup
                  mulhsu       s8, a2, s7
                  nop
                  srai         a1, s11, 9
                  feq.s        ra, fa5, fs6
                  lui          a1, 749741
                  fcvt.s.w     ft11, a3
                  fmv.x.w      gp, ft4
                  slli         t0, a1, 28
                  ori          zero, t4, -1838
                  mulh         s6, s6, a7
                  auipc        a7, 50828
                  or           s6, tp, a1
                  remu         a7, gp, t5
                  div          s8, t6, t0
                  addi         a7, t0, -1896
                  remu         tp, s7, ra
                  ori          s7, a7, 837
                  fsgnjx.s     fa4, ft3, ft7
                  sltu         s4, t1, gp
                  mulh         t2, a4, t5
                  fcvt.s.wu    fa1, gp
                  sra          sp, t2, s10
                  xori         s10, zero, -1487
                  fmv.x.w      s2, ft8
                  flt.s        s0, fa5, fa0
                  remu         t4, zero, t1
                  fsgnjx.s     fs6, fs6, ft3
                  fdiv.s       ft6, ft10, fs2
                  fadd.s       ft1, ft7, ft10, rne
                  and          s9, a3, a0
                  srai         s4, s0, 23
                  fsqrt.s      fs3, fa7
                  remu         t5, a1, s3
                  andi         s11, s10, -294
                  fmax.s       fs11, fa1, fs7
                  andi         sp, s11, -1397
                  mulh         s2, s8, s1
                  sltiu        a5, a3, -1825
                  xor          t4, t1, a5
                  remu         a1, sp, t1
                  sltiu        gp, t1, 2005
                  addi         s10, t2, -215
                  fclass.s     a0, fs11
                  fcvt.w.s     t1, fs3, rtz
                  fmax.s       fs3, fa5, ft0
                  sll          s0, ra, s7
                  mulh         t1, gp, s9
                  lui          t0, 663805
                  auipc        s3, 419706
                  xori         s0, t2, -1259
                  xor          s9, t4, t1
                  rem          s2, s1, s1
                  srli         s6, s9, 0
                  lui          s5, 583002
                  xori         s3, a3, 1770
                  fdiv.s       ft10, ft1, ft3, rdn
                  feq.s        a7, ft11, ft7
                  sub          s8, a4, a1
                  fcvt.wu.s    t6, fa1
                  slt          s3, t2, s4
                  nop
                  lui          a6, 390313
                  flt.s        s1, fa4, ft2
                  fsgnjn.s     fs1, fa0, fs0
                  ori          sp, a3, -100
                  mulhu        t4, tp, s8
                  remu         t1, a5, s3
                  rem          t0, s11, s5
                  fcvt.s.w     ft6, s5, rmm
                  fmul.s       ft2, fs9, fs9, rup
                  add          ra, s5, a6
                  divu         s11, s6, a0
                  sub          t0, sp, a3
                  andi         s9, tp, 1090
                  feq.s        s9, ft1, fa4
                  fdiv.s       fs11, fs2, ft8
                  feq.s        zero, fa0, fa5
                  fdiv.s       fs1, fs1, fs4, rdn
                  feq.s        t2, ft9, ft7
                  fmin.s       fs0, ft5, fa6
                  srli         s5, t1, 10
                  sra          s5, s5, t3
                  fmv.w.x      ft0, t1
                  xor          a3, zero, s2
                  xori         t6, s4, -264
                  fcvt.s.w     ft0, a0, rmm
                  fmax.s       ft8, ft8, fa7
                  lui          s9, 49600
                  fsqrt.s      fs1, fs0
                  divu         s7, a1, t5
                  feq.s        s8, ft3, fs7
                  rem          a6, s6, t6
                  fsgnj.s      ft5, fs0, ft5
                  or           s5, a4, s2
                  fmv.x.w      s11, fa0
                  fmul.s       fs10, fs6, fs0
                  fsub.s       ft0, ft9, fs2
                  srli         t0, a1, 19
                  fsub.s       ft1, ft4, ft9, rdn
                  fle.s        t6, ft7, ft10
                  fcvt.w.s     a0, fa2, rdn
                  andi         sp, t6, 1952
                  srli         t2, s1, 5
                  sll          a3, a2, t4
                  and          a3, zero, a6
                  and          s6, s10, s0
                  remu         a7, s4, a5
                  xori         t6, s0, 1187
                  srli         gp, s10, 3
                  sll          a6, t1, a3
                  mul          s10, gp, a5
                  add          s8, a4, t3
                  fmul.s       ft11, fa7, fs4, rne
                  sra          gp, sp, s11
                  srai         s4, t6, 15
                  fcvt.w.s     s2, fa5
                  sll          s8, s7, s2
                  fsub.s       ft1, fs3, fa4, rtz
                  nop
                  feq.s        s3, fs10, ft5
                  sra          t5, s1, s1
                  slti         t4, s7, -289
                  fdiv.s       ft3, ft7, fs10
                  remu         a1, s8, t3
                  rem          s1, tp, tp
                  fcvt.w.s     s7, ft8, rtz
                  mulhsu       t0, a1, a1
                  nop
                  fcvt.s.w     ft8, gp, rmm
                  add          s2, t2, t5
                  fadd.s       ft6, fs1, ft6
                  fdiv.s       fs11, fa4, ft7
                  addi         t4, s4, 387
                  fsqrt.s      fa4, fs1, rup
                  fsgnj.s      fa7, fs8, fa1
                  fmv.x.w      s9, fa1
                  sra          s3, s4, a2
                  divu         s2, a6, a0
                  sltu         a0, gp, a4
                  fadd.s       fs4, fa3, ft4, rup
                  mulh         t2, s4, a0
                  andi         s5, t6, 1465
                  feq.s        a3, fs10, ft0
                  fsub.s       ft3, ft11, fa4, rup
                  nop
                  and          a3, a4, a1
                  fsgnjn.s     fa3, fs5, ft11
                  rem          t5, t2, t2
                  nop
                  sll          s3, ra, ra
                  and          s3, sp, t5
                  fclass.s     t0, fs8
                  add          ra, t2, s7
                  feq.s        s8, fs11, fs8
                  mulhu        sp, s9, s8
                  andi         ra, a5, -583
                  fle.s        s9, fa0, fs11
                  fmul.s       fs0, fs0, ft7
                  rem          a1, t0, a5
                  xori         tp, s3, -1906
                  fclass.s     gp, ft8
                  srl          s7, t2, a1
                  ori          a3, t4, -306
                  fsgnjn.s     fs0, ft0, fs7
                  divu         s8, s9, a6
                  fdiv.s       fs11, fa3, fs9
                  fcvt.w.s     a3, fs7, rne
                  div          a5, t1, s10
                  fcvt.s.wu    fa3, a4
                  mulh         a1, t2, zero
                  addi         a7, s9, -489
                  flt.s        s0, ft2, ft11
                  slt          a7, a2, s11
                  andi         a6, a0, -1919
                  fmv.w.x      ft7, a4
                  fsqrt.s      fs4, fs2
                  fle.s        a7, fs7, ft7
                  divu         s1, a1, s11
                  fcvt.s.w     fa4, s11
                  remu         t4, s10, a6
                  rem          t6, s1, zero
                  andi         s4, a1, 1586
                  fadd.s       ft10, fs3, ft2
                  fcvt.w.s     s7, fa5, rtz
                  fsgnj.s      fs11, ft6, fs5
                  srli         a3, t4, 13
                  mulh         s10, s3, s11
                  remu         gp, s8, s2
                  rem          s3, t4, s1
                  ori          a3, zero, -598
                  or           s2, s4, t3
                  srai         s4, gp, 2
                  mulhu        s0, tp, a3
                  srli         a0, a4, 5
                  sub          s7, t1, tp
                  add          s0, s3, t5
                  remu         gp, s2, t2
                  fadd.s       fs8, ft10, fa6, rup
                  mul          t5, a5, s1
                  fsgnjx.s     fa6, fa6, fa6
                  mulhsu       s2, s11, a1
                  fmin.s       ft9, fs7, ft8
                  fsgnjx.s     fs0, ft9, fa6
                  sub          s4, a2, a7
                  remu         s6, s0, t3
                  sltu         t0, sp, zero
                  slli         s9, s11, 22
                  fle.s        s4, fa0, fs2
                  srl          t6, ra, ra
                  and          t6, s9, t4
                  fsub.s       fs4, fs9, ft8, rmm
                  lui          t1, 382525
                  fclass.s     a6, fs11
                  srai         a0, s0, 6
                  fdiv.s       ft3, fs11, fa2, rmm
                  divu         s10, t6, t3
                  nop
                  fmin.s       fs11, fs1, ft10
                  mulhsu       t4, s5, a7
                  remu         s1, a4, tp
                  fsgnjn.s     fa4, ft4, fs0
                  lui          s0, 612087
                  fdiv.s       fa5, ft11, fa7, rmm
                  and          s6, gp, s9
                  srai         s2, s5, 28
                  sra          s9, a5, s2
                  fsgnjn.s     fs1, fa0, ft11
                  mulhsu       s8, a5, a2
                  xori         a7, t0, -1548
                  andi         tp, a3, 1606
                  sltu         s4, a2, a2
                  xori         t6, t0, -1204
                  fclass.s     a1, fs8
                  add          s3, t2, s8
                  fsgnjx.s     fa4, ft0, fa7
                  fcvt.s.w     fs6, tp
                  fdiv.s       fs4, fs3, ft5
                  slti         s7, s11, -1830
                  mul          t2, t4, t3
                  sltu         s3, a0, t2
                  srai         t4, a4, 13
                  rem          s1, gp, s4
                  fmul.s       ft0, fs4, fs3
                  slt          s8, t2, gp
                  fsqrt.s      fa6, fs1, rmm
                  fadd.s       ft0, fs3, fs8, rdn
                  fmv.x.w      tp, fs2
                  srai         a7, a7, 27
                  srli         t4, t2, 11
                  ori          a6, s3, -1671
                  fadd.s       ft6, ft8, ft2
                  slli         t2, a0, 3
                  remu         s0, s1, t1
                  andi         s4, t1, 687
                  srl          a6, t0, s7
                  fsqrt.s      ft10, fs10, rne
                  ori          s3, a6, -547
                  srli         t6, gp, 24
                  fmv.x.w      sp, fa0
                  or           sp, a2, t6
                  fcvt.s.w     fs6, s11, rtz
                  sub          s8, sp, zero
                  slli         sp, tp, 23
                  sltu         s9, s4, s7
                  fcvt.w.s     s6, ft2, rmm
                  or           s5, s10, t5
                  sltiu        s9, tp, -179
                  srl          s1, s8, s6
                  lui          t1, 503136
                  fmax.s       fa5, fs10, ft7
                  fcvt.s.wu    fa4, gp, rmm
                  mulhsu       sp, s10, t4
                  sltiu        s10, t0, -1785
                  srli         t1, s9, 11
                  flt.s        a0, fa4, fs1
                  sltu         t2, s4, s9
                  flt.s        ra, fs6, fs8
                  remu         t4, s11, s4
                  rem          a5, s0, s8
                  mulh         s2, a5, s8
                  fsgnjn.s     ft0, ft1, ft4
                  remu         t1, a3, a0
                  remu         a0, s5, s4
                  add          a6, a5, a0
                  sra          t5, s4, gp
                  srli         s7, a2, 25
                  sll          t0, t4, a3
                  fdiv.s       fs7, fs3, fs8, rtz
                  mul          a5, s2, s10
                  fle.s        t0, ft7, fs0
                  nop
                  and          t0, a2, tp
                  add          a3, s2, tp
                  fmv.x.w      s2, fs11
                  fsgnj.s      fa4, fs2, fs5
                  srai         t6, ra, 25
                  add          a7, a3, s11
                  fcvt.s.w     ft4, s11
                  fmv.x.w      t5, fa7
                  div          ra, a2, s1
                  sub          s7, zero, s9
                  or           s3, s7, s9
                  andi         s2, t3, 0
                  sll          gp, t0, a7
                  fadd.s       fa2, ft4, ft0, rne
                  fcvt.w.s     a7, fs7, rne
                  fcvt.s.wu    ft4, a0
                  fle.s        s3, fs1, fs2
                  fmv.w.x      ft5, s6
                  fmul.s       fa3, fa6, ft0, rmm
                  fcvt.wu.s    t5, ft9, rup
                  sra          t0, s8, s3
                  div          a3, s10, tp
                  fle.s        s9, fs0, fs11
                  fsgnj.s      fa4, ft6, fs7
                  feq.s        s8, fs10, fs4
                  addi         s5, sp, -824
                  fsqrt.s      ft2, fa7, rdn
                  xori         t1, ra, 720
                  addi         gp, s3, -1386
                  slt          gp, t6, sp
                  rem          zero, a3, a7
                  fcvt.wu.s    s6, fs3, rne
                  slt          t0, t1, t2
                  nop
                  slli         t2, a7, 3
                  slli         s11, ra, 27
                  fsgnjx.s     fs10, fs4, ft6
                  srai         s10, t0, 31
                  and          t6, t5, s2
                  divu         tp, a5, t6
                  or           s5, a0, a6
                  fcvt.s.w     ft8, tp, rne
                  lui          s2, 1042740
                  feq.s        s4, fs10, ft10
                  fadd.s       fa3, ft3, fs6
                  fdiv.s       fa4, fa2, ft7
                  sltu         a5, t0, s9
                  mulh         s3, t3, a0
                  andi         a3, t2, -1491
                  srl          t4, t3, a4
                  andi         t0, s9, 1764
                  fmin.s       fa4, fa4, fs9
                  sra          s8, a6, a7
                  feq.s        tp, fs10, fa6
                  feq.s        gp, ft9, fa5
                  and          t4, t3, sp
                  lui          t4, 960533
                  fmv.w.x      fs11, s7
                  sltu         t2, s10, zero
                  sll          sp, t6, s9
                  sub          t6, t6, t2
                  fsub.s       fa5, ft10, fs3
                  fmin.s       ft9, fa6, fs7
                  ori          a3, s9, 1919
                  or           s11, s9, a3
                  or           t1, t6, a2
                  fcvt.wu.s    s11, fs4
                  fsqrt.s      fa2, ft6
                  mul          s8, s1, tp
                  mul          t4, t1, sp
                  sra          s5, a0, a6
                  feq.s        t0, fs5, ft4
                  fmin.s       fa7, ft0, fs11
                  mulhu        a5, s5, t0
                  auipc        t2, 777460
                  srl          s5, ra, s8
                  ori          t5, t3, -1768
                  lui          s3, 972249
                  slli         t2, a6, 13
                  slti         sp, s1, 2028
                  rem          s3, a0, t1
                  sll          s6, t3, tp
                  fcvt.s.w     fa7, t0
                  fcvt.wu.s    zero, ft9, rne
                  or           a7, s10, t5
                  slli         t2, s4, 1
                  fsqrt.s      fa1, fs2
                  addi         s1, a3, -1262
                  fmv.w.x      fs6, t4
                  divu         s7, s2, a1
                  mul          zero, s2, s5
                  srli         a5, t5, 3
                  ori          a1, s0, 930
                  fsgnjn.s     fs8, fs2, fa0
                  divu         t2, t5, t5
                  fsgnjx.s     fs10, fs10, ft6
                  div          s8, t6, s8
                  xori         s11, a6, -1615
                  slti         t4, a3, -291
                  fadd.s       ft10, fa0, ft1, rmm
                  fmin.s       fs9, ft9, fs7
                  auipc        gp, 159977
                  andi         s3, a3, -610
                  fcvt.wu.s    tp, fa4, rup
                  fmv.x.w      sp, fs5
                  addi         s4, a7, -106
                  auipc        ra, 130862
                  fmin.s       ft8, fs5, fs4
                  fdiv.s       ft8, fs4, fs6
                  fsub.s       fs10, fs1, fa1, rne
                  lui          a3, 6585
                  fsgnj.s      ft2, fa5, fa5
                  fdiv.s       fs4, ft9, ft1, rtz
                  sltiu        s4, sp, -650
                  srai         s5, a5, 5
                  slli         s8, s8, 12
                  lui          s11, 724554
                  fcvt.s.wu    fa5, t4
                  mulhsu       t5, gp, s6
                  fmin.s       fa3, ft10, ft9
                  div          t6, zero, s6
                  fsgnjn.s     fa0, ft10, ft3
                  mul          t5, s9, t1
                  fsgnjx.s     fs0, ft0, ft10
                  nop
                  slt          t4, a3, t6
                  mulhsu       s9, s9, a5
                  fsgnj.s      ft3, ft9, ft3
                  nop
                  fmin.s       ft3, fa3, fs2
                  fcvt.w.s     gp, ft2
                  fcvt.wu.s    s10, ft9
                  srl          zero, ra, sp
                  mul          s4, t6, t4
                  sub          zero, s5, t4
                  rem          t6, s9, s3
                  slli         s0, s9, 12
                  sltu         a5, a7, s9
                  fle.s        a7, fa0, ft9
                  sltu         a7, t1, sp
                  slli         s7, gp, 29
                  mulh         s0, a5, a6
                  fmv.x.w      gp, fs0
                  fcvt.s.wu    fs2, a2, rne
                  add          t6, s4, t2
                  fmv.w.x      fs7, a4
                  fcvt.w.s     s9, fa6, rmm
                  sll          s7, s9, s4
                  sra          sp, t4, s0
                  addi         t4, t3, 764
                  fadd.s       fs11, ft3, fs10, rtz
                  remu         t0, a6, s0
                  srl          s9, s10, s10
                  div          s11, tp, sp
                  auipc        s10, 569733
                  andi         s6, t1, -114
                  fsub.s       fa3, fs2, fs6
                  slli         a0, s1, 23
                  srai         t4, s3, 13
                  fdiv.s       fs1, ft0, fs0
                  xori         a1, t0, 1210
                  sub          s6, s6, s0
                  fsgnjx.s     fa6, fa1, ft8
                  fdiv.s       fa7, fa7, ft11
                  slli         s3, a5, 24
                  fle.s        s8, fs6, fs9
                  addi         a3, s11, 1476
                  nop
                  sll          t5, s10, sp
                  lui          a5, 895678
                  srli         a1, a2, 10
                  sll          s7, ra, a0
                  srai         a0, s8, 20
                  slt          s1, zero, s6
                  srai         s8, a2, 23
                  srl          tp, t3, t3
                  fcvt.s.wu    ft6, s7
                  mulhu        t1, s9, a1
                  srai         s0, s2, 8
                  fmv.w.x      fs5, a3
                  addi         sp, t2, 1762
                  flt.s        t4, fa0, fs7
                  ori          t5, t4, -1767
                  remu         sp, a4, gp
                  xor          a5, t3, a0
                  fcvt.s.w     ft4, gp
                  fdiv.s       fs5, ft5, ft8, rup
                  remu         s11, s6, s7
                  sll          s10, s1, s6
                  slti         s1, a2, 1692
                  sll          s11, a5, a0
                  nop
                  fsgnjn.s     ft4, fs3, fs9
                  fclass.s     a6, fs11
                  nop
                  flt.s        ra, fa5, ft9
                  mulh         s6, s6, sp
                  sltu         s4, t2, a4
                  or           s2, t0, s6
                  sub          a3, s3, s0
                  add          a1, s3, s2
                  div          ra, s5, s1
                  slli         t6, s3, 20
                  srai         a5, a5, 23
                  add          s0, t4, sp
                  slli         s6, a5, 30
                  srli         s8, gp, 31
                  srai         a0, t4, 28
                  addi         a1, s2, -449
                  div          t4, ra, s11
                  sltu         a6, s0, a7
                  ori          s1, a1, 140
                  slt          s3, a5, s10
                  divu         s2, t3, t3
                  fmv.w.x      ft0, t0
                  fdiv.s       ft9, ft0, fa0
                  fclass.s     s8, fa0
                  mulhsu       a5, s7, s2
                  sub          s9, a4, a0
                  slt          t0, s7, t5
                  mulhsu       t5, a2, t3
                  andi         s10, ra, 862
                  and          tp, t6, a3
                  remu         s7, gp, zero
                  fdiv.s       ft6, ft9, fa4, rtz
                  fcvt.w.s     a7, ft2
                  fadd.s       ft0, ft8, fs9, rtz
                  slt          s2, s4, s9
                  sltiu        a3, s4, 1784
                  xor          a1, zero, s7
                  sub          s3, s9, gp
                  slt          s3, t0, a3
                  mulhsu       a1, t4, s0
                  divu         s3, a3, s0
                  sltu         t6, s9, s9
                  or           a3, t4, gp
                  mulhu        a1, t0, s7
                  slti         s6, a6, -2021
                  fsgnjx.s     fa0, fs0, fa0
                  slti         s5, s9, -312
                  fmv.w.x      fa2, a3
                  lui          t5, 708178
                  and          a1, sp, s3
                  fcvt.s.wu    fa5, tp
                  srai         s6, t4, 8
                  xor          s11, a3, a3
                  mulhu        s2, t4, ra
                  sltiu        gp, t6, 701
                  fsgnjn.s     ft9, fs2, fa4
                  fsgnjn.s     fs4, ft10, fa7
                  mulhu        t5, t4, a7
                  fle.s        t1, fs5, fs11
                  mulhsu       sp, s4, s7
                  and          s1, a7, tp
                  srli         s0, a0, 18
                  slt          ra, s11, a2
                  sltiu        s2, a0, -1751
                  mul          a1, gp, sp
                  ori          s6, a7, 804
                  remu         a5, t2, a4
                  srai         s4, t5, 2
                  fsgnjx.s     fs10, fa4, fs9
                  flt.s        t2, fs2, fs4
                  fsgnj.s      fa3, ft10, ft5
                  divu         t2, s3, gp
                  mulhu        t6, gp, s7
                  sra          s7, sp, s11
                  slt          s10, a5, s2
                  sll          ra, a4, ra
                  xor          sp, s3, t2
                  feq.s        a6, fa5, fs0
                  mulhu        t6, s9, t4
                  fmax.s       fs10, ft8, fs0
                  div          t2, s10, a7
                  fclass.s     a3, fa4
                  srli         a7, s1, 2
                  fcvt.w.s     a0, fa5
                  fdiv.s       ft6, ft7, fa1
                  sub          a7, a5, t0
                  rem          t0, s5, sp
                  fsgnjx.s     fs7, ft2, ft11
                  fadd.s       ft8, ft2, fs9, rup
                  fmax.s       ft7, ft9, fs3
                  lui          ra, 28631
                  fmv.x.w      a5, fs9
                  fsqrt.s      fa5, fa4, rne
                  slli         a1, a1, 0
                  add          t4, a6, a7
                  rem          s4, s5, a2
                  fmul.s       ft11, fa4, fs3, rup
                  and          s1, s8, t2
                  srl          gp, t6, a2
                  fmax.s       ft11, ft7, fs11
                  srli         s11, t5, 29
                  fsqrt.s      ft10, fs11, rup
                  andi         zero, a3, -1720
                  fsqrt.s      fs3, fa6, rdn
                  fsgnjn.s     fa4, fs8, fs2
                  fmax.s       fs5, fs9, ft0
                  sltiu        s4, sp, -866
                  fcvt.w.s     t1, fa1
                  xori         sp, t4, 1316
                  fsgnjn.s     fa3, fa6, ft9
                  andi         s2, s0, -259
                  sltiu        sp, s1, 1938
                  fcvt.wu.s    s7, ft10, rne
                  fmul.s       fs8, fs8, fs5
                  fadd.s       fs9, ft0, fs5
                  fmax.s       ft6, fa6, ft0
                  add          s3, s2, t3
                  slli         s2, a6, 7
                  sll          s0, t0, a4
                  fcvt.wu.s    s10, ft5
                  xor          tp, s2, a2
                  mulhu        t4, s5, t5
                  sub          gp, s0, a7
                  remu         s1, t0, sp
                  fmv.w.x      fs10, t1
                  fclass.s     sp, fa1
                  and          t1, t6, a7
                  fsgnjn.s     fs7, fs5, ft7
                  mulh         t5, s11, t2
                  srai         ra, t5, 8
                  fcvt.s.wu    fa0, a5, rup
                  sll          t1, s11, t4
                  mul          t1, t0, ra
                  slli         s11, t1, 20
                  andi         s2, s3, -1373
                  flt.s        s3, fs8, ft8
                  slti         s1, s11, 264
                  lui          s3, 649380
                  slti         t6, a1, 73
                  fsgnjx.s     fa6, ft6, fs9
                  fcvt.wu.s    a5, fa6
                  auipc        s6, 798705
                  fmv.w.x      ft4, a4
                  nop
                  mulh         sp, s0, s8
                  sub          a7, zero, s6
                  or           t1, t0, s5
                  slt          s4, gp, s0
                  fmul.s       fs10, ft10, fs4, rdn
                  or           t4, t0, a7
                  fmv.x.w      s4, ft5
                  ori          a6, s8, 1720
                  div          t2, tp, a3
                  srai         s3, a4, 1
                  fdiv.s       ft3, fs11, ft10
                  fcvt.wu.s    t4, fs5, rup
                  mulh         ra, s5, s1
                  fsgnjx.s     fs0, fa5, ft1
                  xor          s7, t6, s8
                  slti         s5, t2, 1477
                  slt          s7, s9, s5
                  fle.s        s0, ft10, fs0
                  and          s1, a6, s10
                  slti         a6, sp, 1579
                  div          s7, ra, s3
                  auipc        a7, 774569
                  or           t4, s5, a0
                  fsgnj.s      fa6, ft9, fa2
                  srli         s9, s9, 11
                  divu         a0, s1, s8
                  fsgnj.s      ft5, ft1, ft3
                  fcvt.wu.s    t2, ft4
                  srli         s7, t4, 21
                  add          s8, s10, a2
                  fdiv.s       fs6, ft4, fa2, rmm
                  mulhsu       s10, s9, a3
                  fmax.s       ft3, fa6, ft11
                  slti         a3, t3, -1264
                  slt          t6, s8, t1
                  or           ra, t0, a3
                  sltu         t4, gp, t5
                  xor          a0, s8, s10
                  nop
                  nop
                  flt.s        t1, fs8, ft9
                  add          sp, a5, s10
                  sub          gp, a7, a1
                  xor          t2, a6, s10
                  mulhsu       t5, s5, a1
                  sltiu        s10, t0, -1518
                  mulh         s0, s1, a1
                  feq.s        s1, fs7, fs4
                  fsgnjx.s     fs0, fs0, fa2
                  srli         s11, sp, 18
                  fcvt.s.w     fs9, s0, rdn
                  mul          s2, a3, s8
                  fsub.s       fs1, ft1, ft1
                  slt          t0, zero, a3
                  fcvt.s.w     ft2, s3
                  fmv.w.x      ft2, a7
                  xor          a3, gp, t1
                  mulhu        a0, ra, a7
                  fsqrt.s      ft10, ft9, rup
                  sll          a3, t6, s4
                  sra          t0, a4, s11
                  andi         a3, a6, -1524
                  addi         sp, a3, -822
                  srl          s9, a3, zero
                  add          s8, a7, a1
                  sltu         a3, s2, s11
                  mul          s6, sp, t6
                  or           s4, s3, s11
                  andi         s10, s9, -1758
                  sll          s2, t4, t2
                  fcvt.s.wu    ft10, t4, rmm
                  lui          zero, 1039605
                  fsgnj.s      fa0, ft1, ft6
                  fclass.s     t6, ft10
                  or           t5, s3, a0
                  fcvt.w.s     t4, fs8
                  fadd.s       fs0, fa5, ft9, rtz
                  fcvt.s.w     fa3, tp
                  sub          t1, s0, s5
                  slti         a6, s11, 397
                  or           s3, ra, t5
                  remu         zero, t0, t3
                  fmin.s       fa6, ft8, fs0
                  fadd.s       ft5, fa0, fs10, rtz
                  rem          a5, ra, s6
                  fmin.s       fa6, fs2, fs2
                  srl          a1, ra, tp
                  sra          a5, s0, a1
                  lui          a7, 715097
                  xor          s9, zero, s11
                  mul          s5, s10, a7
                  sltu         s6, s0, s8
                  auipc        t0, 695909
                  xori         a5, a5, -74
                  mulhsu       t1, s2, sp
                  fmin.s       fs1, fs11, fa3
                  mulhsu       t0, t4, s0
                  slti         a5, t5, -1095
                  fcvt.s.wu    ft4, t4
                  fcvt.wu.s    a0, fs3, rne
                  feq.s        s4, fs10, fs3
                  fcvt.s.w     ft0, s11
                  slt          zero, t1, s7
                  add          t5, t3, s2
                  or           s10, t6, t0
                  nop
                  fsqrt.s      fs9, ft1
                  fcvt.s.wu    ft2, s11
                  fcvt.wu.s    tp, fs7
                  rem          s2, s7, a4
                  fcvt.s.w     fs9, s8, rne
                  fsgnjx.s     ft8, ft6, fs3
                  fcvt.w.s     s11, fa0
                  rem          s8, a4, a4
                  auipc        s8, 647214
                  fsub.s       fa0, ft11, ft5
                  rem          s1, s10, a2
                  fle.s        s1, fa2, ft0
                  andi         s11, tp, -1719
                  sltiu        s7, gp, 1005
                  fdiv.s       ft11, fs2, fa5, rmm
                  slli         a5, ra, 15
                  or           t0, ra, a2
                  fcvt.wu.s    a0, ft1, rne
                  mulhu        t0, sp, tp
                  fmv.w.x      ft11, gp
                  fmax.s       ft4, ft8, ft2
                  fclass.s     t5, fs10
                  fcvt.w.s     s8, fs2
                  fmin.s       fs0, ft3, fs1
                  slti         s11, s2, -1298
                  auipc        a0, 761354
                  fsgnj.s      ft1, ft6, fs1
                  and          a5, sp, gp
                  slli         a6, a2, 16
                  fsqrt.s      fs0, fa0, rup
                  mulhu        a3, a2, a2
                  fmv.w.x      ft10, t3
                  feq.s        sp, fa0, fs11
                  fcvt.s.wu    ft6, s3, rdn
                  fcvt.w.s     s3, ft2, rtz
                  remu         ra, ra, a0
                  fsqrt.s      fs4, fs6, rdn
                  mulh         a5, ra, s10
                  fadd.s       ft11, fs3, fa5
                  srl          gp, sp, a1
                  fmax.s       ft3, ft1, fa4
                  fsgnjx.s     ft3, ft5, ft0
                  srai         a3, s0, 26
                  addi         s5, t1, -365
                  fmax.s       fs5, ft10, fa0
                  slli         t6, s3, 30
                  nop
                  fmax.s       fs7, fs9, fa1
                  fcvt.wu.s    s11, fs8
                  feq.s        ra, fs5, fa4
                  xori         a0, s3, -455
                  flt.s        s7, fs1, fs5
                  addi         ra, t0, -1850
                  remu         ra, sp, zero
                  fcvt.s.wu    ft1, gp, rtz
                  fdiv.s       fs9, fa7, fs11, rup
                  fcvt.s.w     fs5, sp
                  fsgnjn.s     fs2, fa2, ft0
                  remu         s0, a4, tp
                  sra          a7, s3, t4
                  mulhsu       t1, t0, t2
                  addi         ra, s5, -468
                  fsub.s       fa0, fa0, fa4, rne
                  fmax.s       ft6, fs8, fs4
                  fsgnj.s      ft8, fa4, fs11
                  divu         gp, s4, a2
                  srl          t5, s6, t1
                  sll          t4, t0, a2
                  or           gp, s2, s6
                  fmax.s       ft9, ft4, fa3
                  sltiu        s6, t4, 252
                  fcvt.w.s     zero, ft7
                  fmin.s       ft7, ft8, fs8
                  auipc        ra, 228692
                  fmv.w.x      fs2, a4
                  fsub.s       fa0, fs8, ft3
                  xor          s2, zero, a1
                  mul          s11, s5, s11
                  slt          t2, a6, s6
                  or           ra, ra, s3
                  fmax.s       fa5, fa4, fa6
                  sltu         zero, t3, s11
                  and          ra, s2, s1
                  fcvt.wu.s    gp, ft9
                  sltu         t2, s4, s6
                  feq.s        a5, ft7, fs3
                  slti         a3, t1, 986
                  fmul.s       fs4, fa0, fa2
                  feq.s        s11, fs10, fs7
                  sra          t5, a0, t1
                  flt.s        zero, fs0, fs3
                  fcvt.s.wu    fa7, s10, rdn
                  mulh         s7, s5, s2
                  mul          s8, a5, a0
                  ori          tp, a2, 1211
                  fcvt.s.w     fs7, a3, rmm
                  or           a3, t6, a0
                  rem          s0, t0, s11
                  fsgnjx.s     fs10, ft6, fs9
                  xori         s8, s6, 1031
                  fcvt.wu.s    s0, fs2
                  mulhu        s1, sp, t3
                  fcvt.s.wu    fa1, a0, rdn
                  xor          a0, tp, s10
                  slti         a6, a4, 20
                  and          gp, ra, s5
                  andi         s7, s4, -461
                  remu         t2, s4, t1
                  auipc        t2, 765420
                  feq.s        s2, ft7, fs11
                  fmin.s       ft11, fa2, ft3
                  sll          s1, t6, t3
                  nop
                  srl          a5, t6, sp
                  feq.s        zero, ft10, fs8
                  fsgnjn.s     fs9, ft11, fs6
                  fsqrt.s      fs5, fs4, rne
                  lui          t4, 532439
                  sra          t1, ra, s9
                  fsgnj.s      fa5, fs5, ft8
                  fdiv.s       ft3, fs1, fs4
                  ori          t2, s7, -1677
                  slt          sp, s7, zero
                  xori         s4, a0, 385
                  fadd.s       fa4, fs8, fa6, rtz
                  addi         gp, a3, 464
                  fle.s        s4, fa3, fs5
                  fsgnjn.s     fa1, fa2, ft0
                  fsgnjx.s     ft2, fs0, fa7
                  div          s7, s11, s1
                  xor          a1, a6, sp
                  sll          s0, a0, tp
                  fcvt.s.w     ft10, a4, rne
                  nop
                  lui          s0, 323819
                  flt.s        s6, ft2, fs6
                  mulhu        s0, s5, t3
                  flt.s        t1, ft4, fa4
                  sltu         s3, s8, s1
                  sra          t4, zero, s8
                  fcvt.wu.s    t0, fa7, rup
                  fmul.s       fs7, ft3, fa7
                  fsqrt.s      ft1, fa4, rmm
                  fmv.x.w      a6, fs4
                  fadd.s       ft10, fs0, fs8, rtz
                  add          s4, s0, t5
                  fmax.s       ft2, ft4, fs1
                  andi         s3, a2, -1701
                  slt          s4, t4, t0
                  fdiv.s       ft7, ft5, fs6, rmm
                  remu         tp, s9, s1
                  or           a6, t2, s7
                  srl          s1, a3, zero
                  div          s11, t5, gp
                  div          s6, tp, s2
                  fadd.s       fa7, fa2, ft10, rup
                  fclass.s     a0, fa7
                  fle.s        s10, fs6, ft7
                  sll          zero, ra, a4
                  fadd.s       fa2, ft2, fs8
                  fcvt.s.w     fa6, t4
                  fcvt.wu.s    a3, fs7, rne
                  and          a5, a1, s5
                  xori         t0, gp, -985
                  fmax.s       fs9, fs3, fa5
                  mul          s10, a6, s1
                  srai         s8, a7, 22
                  fclass.s     zero, fa4
                  fmv.x.w      a0, fs1
                  fmin.s       ft8, ft2, fa4
                  flt.s        t2, fa0, fs10
                  fsgnj.s      fs5, fa7, ft4
                  andi         s7, s6, -816
                  fadd.s       ft0, fs9, fs1
                  xor          s0, t4, t0
                  fmv.w.x      ft2, s0
                  rem          t5, s1, t1
                  fdiv.s       fs10, fs9, fs9
                  fmax.s       fs0, fs5, fa2
                  or           s1, tp, a5
                  fcvt.w.s     sp, fa7
                  sub          s1, a3, s3
                  flt.s        s10, fs6, fs10
                  fsgnjn.s     fa1, ft3, fa4
                  fsgnjx.s     fs4, ft9, fa0
                  andi         a5, a7, -355
                  or           s3, a6, s1
                  fmv.w.x      fa4, s1
                  sll          s9, s5, s8
                  fadd.s       fs11, ft8, ft10
                  lui          t6, 960200
                  sll          t2, a7, s8
                  ori          a1, sp, -1314
                  fmin.s       fs1, ft2, fs1
                  fsgnj.s      fa0, ft5, fs6
                  fsgnjn.s     fs1, fs6, fa7
                  sll          a0, s1, t5
                  slt          s6, s4, s7
                  nop
                  fcvt.s.w     fs9, tp, rtz
                  fadd.s       fs8, ft6, ft2, rup
                  divu         t2, t4, s10
                  sub          a5, s3, s1
                  fcvt.s.w     ft8, gp, rtz
                  rem          s1, t5, a4
                  fcvt.w.s     tp, ft7
                  mulhu        s2, s11, s7
                  fmv.w.x      ft7, s4
                  auipc        s3, 52235
                  fcvt.w.s     a7, ft4, rdn
                  mulh         zero, t2, t6
                  fsgnj.s      ft9, fs4, fa2
                  mulhu        s7, sp, s3
                  feq.s        s6, fs11, ft0
                  slti         s8, s1, -525
                  and          t1, t3, s1
                  nop
                  slli         t2, t1, 9
                  fmin.s       fa4, fs8, fa0
                  feq.s        gp, fs3, fs1
                  fcvt.wu.s    s11, fs0
                  srli         ra, a2, 26
                  andi         a0, t2, -773
                  fmin.s       fs4, ft7, fs11
                  and          s7, s6, a3
                  fmv.w.x      fs5, t6
                  fmv.x.w      s0, fs3
                  srai         s11, a6, 16
                  sub          a1, t6, a1
                  srl          t1, a6, tp
                  srli         gp, a4, 5
                  fle.s        s10, fa0, fs11
                  remu         t0, tp, s2
                  sra          t5, s8, s1
                  sltu         t6, s10, a6
                  flt.s        a5, ft4, fa3
                  remu         s10, s6, sp
                  feq.s        zero, ft1, fs4
                  sub          t5, ra, ra
                  fmul.s       fa6, fa4, fa1, rmm
                  div          s7, a0, t4
                  mulhsu       s4, tp, t3
                  fmax.s       fs6, ft10, fa7
                  fclass.s     t2, fa2
                  mulh         tp, gp, s10
                  nop
                  slli         s9, t0, 23
                  sltiu        a3, s6, 881
                  sub          ra, s8, s3
                  fsgnjn.s     fs4, fa5, fa1
                  fsgnj.s      ft6, fs0, fa3
                  div          t2, s9, sp
                  fcvt.w.s     a7, fa4, rne
                  slli         gp, gp, 27
                  divu         s9, t3, s7
                  mul          t6, a2, s11
                  fsgnj.s      ft3, ft8, fa7
                  and          s1, s5, a4
                  and          s8, t5, tp
                  slti         s3, s3, 836
                  mulh         ra, t6, sp
                  and          sp, t0, ra
                  mulhu        s1, t0, s10
                  fcvt.wu.s    ra, fs4, rdn
                  xor          s8, a0, a4
                  sll          a0, s11, t2
                  feq.s        a5, fa2, fs9
                  fsub.s       fa1, ft11, fs0
                  srai         t5, s0, 29
                  div          s4, a2, a4
                  srai         s11, tp, 28
                  remu         a5, t3, s9
                  remu         a7, s1, s10
                  slli         ra, s11, 28
                  srai         s0, zero, 14
                  fmv.x.w      s2, fs4
                  mulh         s4, t6, ra
                  feq.s        ra, fs1, ft3
                  rem          s2, t5, a6
                  fmax.s       fs11, ft2, ft6
                  srai         s8, s2, 24
                  mul          tp, a6, s3
                  flt.s        a6, fa6, fs7
                  srli         s10, s3, 5
                  feq.s        tp, fs0, fa7
                  fadd.s       fa3, ft6, fa7
                  mulh         s9, s11, s11
                  fmv.w.x      fs5, s4
                  fmin.s       ft4, ft3, fs1
                  fmv.w.x      fs6, a4
                  fmax.s       ft2, fs4, fa1
                  ori          a0, s11, 638
                  fcvt.s.wu    fa2, t3
                  fmv.w.x      fs1, t6
                  slti         s11, a7, 895
                  srl          a3, t5, s2
                  mulh         t1, a7, a2
                  mul          s2, sp, s2
                  addi         s3, s7, -9
                  fclass.s     t5, ft9
                  fsgnjx.s     fs10, fa2, ft6
                  fcvt.wu.s    ra, fs9
                  fle.s        a3, fs1, fs9
                  fsgnjn.s     fa1, fa7, ft10
                  add          t4, a6, a5
                  fmv.w.x      fs11, a5
                  fcvt.s.w     fs6, t0
                  fsub.s       ft2, ft7, fs7
                  or           s6, t4, t1
                  divu         s0, s4, ra
                  fadd.s       ft10, ft0, ft11
                  add          t2, s9, tp
                  div          s10, s9, sp
                  fmin.s       ft9, ft10, ft3
                  fcvt.s.wu    ft4, a2
                  feq.s        s0, fa1, fa7
                  fdiv.s       ft10, fs7, ft10
                  xor          s8, s7, s0
                  fsub.s       fa6, fa2, ft10
                  slt          tp, s11, s3
                  remu         s10, t5, ra
                  nop
                  and          s11, t6, s7
                  remu         s0, a3, a2
                  sltu         a6, s5, t0
                  divu         t6, s2, s11
                  div          a6, t0, a0
                  fsub.s       fs8, fa1, fa6, rmm
                  fsgnjx.s     fa6, fa0, ft1
                  div          t0, t1, s0
                  sra          ra, s3, t3
                  auipc        s7, 470901
                  sll          s0, s10, sp
                  fsub.s       fa0, fs8, ft2, rne
                  mulh         s4, t4, a5
                  fcvt.s.w     ft2, t1
                  fsgnjx.s     ft1, fs2, ft11
                  slti         s5, a5, -585
                  mulhu        s5, a6, a3
                  flt.s        t6, fs10, fa5
                  fdiv.s       ft11, fa5, ft7, rne
                  xori         s9, a6, -1274
                  fmv.w.x      ft11, s6
                  fsgnjx.s     ft0, fs7, ft11
                  sub          s1, t3, s2
                  fcvt.s.wu    ft4, t6, rtz
                  fmv.w.x      fa6, t5
                  fmin.s       fs3, fa3, fa0
                  divu         a3, sp, s2
                  ori          s5, s7, -803
                  fmv.x.w      s2, fa5
                  fsgnjx.s     ft2, ft6, ft10
                  feq.s        zero, fs5, ft2
                  rem          a0, t4, t6
                  nop
                  fmul.s       ft3, ft1, fs11
                  or           s0, a4, s3
                  div          zero, t4, s3
                  ori          a3, a7, -1756
                  fle.s        s11, fa2, ft7
                  fsub.s       ft9, fs8, fa1, rup
                  addi         sp, zero, 1635
                  slt          a7, zero, a6
                  fmul.s       fs11, fa2, fa6, rne
                  srai         tp, gp, 15
                  fsgnjx.s     fs10, ft10, fs3
                  fsgnjn.s     fa6, fs1, fs9
                  nop
                  srai         t6, t1, 13
                  feq.s        tp, fs11, fs1
                  addi         s11, t5, 2001
                  fsub.s       ft8, fa1, fa2, rtz
                  ori          zero, s2, 1280
                  fmax.s       fs9, ft1, ft4
                  fmv.x.w      s1, ft6
                  andi         s5, zero, -859
                  xori         s5, s6, -1112
                  sltiu        a0, sp, -1843
                  or           zero, t3, zero
                  flt.s        s10, ft5, ft6
                  slt          a6, sp, t4
                  sub          s5, s8, s10
                  rem          a0, t1, a4
                  mulh         s0, s2, a0
                  andi         gp, s11, -1453
                  andi         s6, a0, 1661
                  fle.s        zero, fs1, ft2
                  slti         gp, s10, 369
                  fsgnj.s      ft6, fa6, fa3
                  sub          a0, s0, s1
                  add          zero, s2, a0
                  mulhsu       sp, tp, s0
                  fmv.w.x      fs11, a4
                  feq.s        a3, ft1, ft6
                  divu         gp, a0, ra
                  fcvt.wu.s    ra, ft10, rmm
                  lui          s5, 298061
                  fcvt.s.w     ft7, a0, rne
                  mulhu        s5, zero, t0
                  mulhsu       a1, s8, s9
                  mulh         t2, tp, t0
                  flt.s        s0, fs6, fs1
                  mulh         a5, a7, a4
                  xori         s9, a4, -975
                  auipc        t0, 194669
                  srai         s11, zero, 7
                  xor          ra, s0, t5
                  andi         ra, s4, 401
                  feq.s        t1, fa5, ft3
                  andi         a0, a7, -1849
                  remu         s5, s6, s1
                  fmv.w.x      ft8, gp
                  feq.s        s9, ft1, fs5
                  sltu         s10, a1, t0
                  xori         a6, s0, -1970
                  fsub.s       fa1, fs9, ft8
                  fmax.s       fs9, ft11, fs2
                  div          a7, zero, s1
                  fsub.s       ft2, ft2, ft9
                  fcvt.s.wu    ft5, t1, rtz
                  fsub.s       ft6, ft10, fs5
                  sltu         t5, a2, a3
                  mulhu        a7, t4, a4
                  fcvt.wu.s    sp, ft7, rdn
                  addi         a7, t0, 956
                  srl          t5, s7, t1
                  lui          s4, 856976
                  sll          a0, tp, gp
                  fle.s        s6, ft2, fs6
                  sltu         t6, s7, s9
                  add          gp, gp, t5
                  and          zero, t1, s7
                  fdiv.s       fs4, fs8, fs8, rdn
                  fsub.s       fa7, ft3, ft10, rdn
                  fmv.x.w      s1, fa0
                  fcvt.w.s     t2, fs4
                  ori          gp, t5, -9
                  fsgnjx.s     fa6, fs11, fs2
                  rem          s2, a5, s4
                  fcvt.wu.s    s9, fa3, rtz
                  lui          gp, 668731
                  slti         s2, t4, 1095
                  flt.s        s4, fa0, fa4
                  lui          s0, 566225
                  fle.s        t6, fs0, fs11
                  sll          s1, s0, a2
                  ori          s2, a7, 844
                  srai         ra, s9, 16
                  fmin.s       fs8, ft4, fs1
                  fcvt.wu.s    t1, fs0
                  fcvt.s.w     ft9, s5
                  fsgnj.s      fa1, fs7, ft6
                  divu         a3, s7, zero
                  slti         gp, s0, 447
                  sltiu        ra, s9, 1087
                  sltiu        s4, a5, -1380
                  divu         s4, s1, a2
                  xori         s11, s9, -684
                  fadd.s       ft5, fa5, ft2
                  fmul.s       fs4, ft7, ft11, rmm
                  fmax.s       fs10, ft10, ft9
                  fadd.s       fs2, fs9, ft5, rne
                  fcvt.s.w     fs5, a0, rup
                  fsgnj.s      ft2, ft9, ft11
                  sll          a0, t1, zero
                  feq.s        t5, fa7, fs3
                  div          s0, tp, sp
                  nop
                  fadd.s       fs3, ft1, ft11, rdn
                  sra          t2, a6, a2
                  fadd.s       ft3, fs3, fa6, rtz
                  slli         t1, sp, 30
                  sub          tp, tp, a6
                  slt          t0, s6, s7
                  flt.s        s2, fs9, fa2
                  sll          a1, s2, t1
                  sltu         t0, ra, t5
                  fdiv.s       ft6, ft1, ft4
                  fle.s        a0, ft6, fs2
                  remu         s5, s8, zero
                  fsgnjn.s     fs3, fa3, ft5
                  fsqrt.s      ft8, fs0, rtz
                  xori         s5, sp, -1504
                  rem          s10, s8, s3
                  slli         sp, t3, 29
                  auipc        t4, 782209
                  remu         ra, a3, t3
                  mulhsu       t2, t4, sp
                  mulhu        ra, s11, ra
                  srai         a6, s0, 18
                  sltiu        s11, t4, -412
                  fmax.s       ft2, fa5, ft1
                  mul          s2, t4, t2
                  mulh         zero, a2, s10
                  flt.s        t1, ft6, fs4
                  remu         s0, a7, a4
                  fmul.s       ft9, fs5, ft10, rtz
                  fle.s        t6, ft5, ft4
                  fcvt.s.wu    ft5, zero, rup
                  addi         t6, s9, -583
                  fadd.s       ft11, ft3, fs1
                  rem          a3, s10, a2
                  slt          tp, a7, s8
                  fmv.w.x      fa6, s6
                  sltiu        s4, t1, -566
                  fmin.s       fs7, fa4, ft5
                  sltu         gp, s0, t5
                  ori          t0, s2, 534
                  rem          s11, a5, s10
                  fmin.s       ft0, fa3, ft0
                  nop
                  srai         ra, a5, 29
                  fadd.s       ft11, fa7, fa5
                  sltiu        sp, t0, -1433
                  nop
                  fcvt.s.wu    fs7, zero, rup
                  div          s10, a1, s9
                  fmv.w.x      fs5, s2
                  mulh         a7, a6, t3
                  fmax.s       fs7, fa3, fs10
                  fadd.s       fs10, fa6, fa1
                  andi         sp, a6, -1144
                  fcvt.w.s     zero, fs4
                  andi         sp, t5, 647
                  xor          s1, a0, zero
                  fcvt.wu.s    a0, ft11, rtz
                  add          sp, a3, s3
                  remu         s0, s1, ra
                  sltiu        a1, s6, -1781
                  srli         t4, ra, 24
                  sub          a5, s6, s8
                  slt          s1, s5, t2
                  divu         t0, tp, sp
                  fle.s        s7, ft6, fs6
                  mulhu        a7, t4, s3
                  fmin.s       ft10, fs4, ft2
                  mul          s4, tp, s2
                  slt          s5, a4, s5
                  rem          zero, a3, zero
                  srl          a3, gp, t2
                  fcvt.s.wu    fs8, gp, rmm
                  fsub.s       fa6, fs0, fs3, rdn
                  fdiv.s       fa2, fs6, ft11
                  flt.s        s3, fs4, fs9
                  andi         s0, s10, -1973
                  slti         sp, a2, -1796
                  mulhsu       s2, a1, s11
                  sub          s6, t1, s3
                  fle.s        ra, fs10, fa7
                  sltu         a6, s9, gp
                  fsgnjx.s     fs7, fa5, fs3
                  lui          a6, 161577
                  xor          a0, s6, t0
                  auipc        a3, 14798
                  srli         tp, s8, 13
                  fclass.s     s1, ft2
                  fsgnjx.s     ft1, fa6, fa6
                  fcvt.w.s     s2, ft1
                  sltiu        ra, s2, 2045
                  div          a0, s4, s10
                  slt          tp, t2, a5
                  xori         ra, s0, -1174
                  andi         s8, t0, 1743
                  fdiv.s       fa1, fs1, fa2, rmm
                  fsub.s       ft10, fs3, fs4, rne
                  feq.s        s2, fa4, ft9
                  fmv.w.x      fs8, s2
                  nop
                  sltu         s9, t1, ra
                  addi         s10, ra, 1814
                  lui          a6, 844077
                  div          s1, t4, a0
                  fsqrt.s      fs1, ft6
                  fdiv.s       fa6, fa5, fs0
                  mulhsu       sp, tp, a6
                  fcvt.w.s     s3, fa0
                  xori         t6, gp, 1468
                  sltiu        a5, t6, 1127
                  and          s0, s5, s6
                  slt          s11, ra, s4
                  fcvt.wu.s    a6, ft0
                  fcvt.wu.s    s5, ft0
                  fle.s        zero, fs7, fs3
                  fdiv.s       fs2, fs7, fa1, rtz
                  fcvt.w.s     s3, fs3, rmm
                  fadd.s       fa0, fs5, ft3
                  srli         t6, s3, 11
                  mulhu        s4, t3, tp
                  fmv.x.w      a5, fa2
                  fsgnjn.s     fs8, ft10, fs2
                  fcvt.wu.s    s0, fa2
                  mulhu        s9, a3, t4
                  fcvt.w.s     a5, fs9, rtz
                  addi         a1, a5, -448
                  fmul.s       fs11, fa3, ft2, rmm
                  sll          s10, s3, t1
                  rem          s1, t5, s6
                  fsgnj.s      fa7, ft0, fa4
                  mulhu        a7, a6, t1
                  rem          s6, gp, t6
                  fdiv.s       fa2, fa7, ft7, rup
                  addi         a3, gp, 206
                  slli         a5, s1, 15
                  andi         s3, a1, 1724
                  fle.s        s6, ft5, ft5
                  div          t1, a6, sp
                  slli         a3, t1, 27
                  addi         a5, s3, 169
                  nop
                  addi         tp, s0, -889
                  fsgnjn.s     ft8, fa2, fa6
                  fcvt.wu.s    a6, fa4, rne
                  fsgnjn.s     ft11, ft7, ft3
                  fmin.s       ft1, fs4, ft7
                  xor          a7, s11, s9
                  mulhsu       s9, s6, a2
                  lui          a5, 380523
                  fmul.s       ft2, fs9, fa5, rdn
                  rem          s11, s5, a6
                  addi         a5, s2, -312
                  xori         a3, s11, -397
                  mulhsu       t0, s1, t3
                  xor          t6, a2, s2
                  nop
                  fmv.x.w      s4, ft1
                  and          t5, s2, s5
                  fmin.s       fa1, fs3, fs0
                  mul          s5, t2, s5
                  sltu         s0, s4, sp
                  divu         a5, t1, s8
                  fsqrt.s      ft1, fa2
                  sltiu        s11, s7, -322
                  sub          a1, a4, a0
                  fcvt.s.wu    fs4, t0, rup
                  fmin.s       ft10, ft1, fs11
                  slli         s5, a7, 25
                  flt.s        a3, fs11, ft7
                  fsgnj.s      fa6, fa1, fa0
                  fsqrt.s      ft9, fs11
                  sra          t4, t0, t0
                  fmv.x.w      s3, fa5
                  or           s1, a3, s7
                  xori         a5, s5, 887
                  fmul.s       ft4, fa4, ft5
                  srli         s1, a2, 2
                  auipc        ra, 732767
                  add          a7, s4, s11
                  lui          t4, 641993
                  ori          s8, s7, -7
                  fle.s        a7, fa3, fa3
                  fsgnjn.s     fs2, fa5, ft6
                  fsgnjn.s     ft1, fa0, ft11
                  sltu         s6, s5, t5
                  fmv.x.w      t1, fs1
                  fmax.s       fa4, fs6, ft6
                  sub          s3, s10, s1
                  mulhu        s5, a4, t2
                  ori          t1, a7, 1109
                  fmul.s       fs1, ft10, fs6
                  mulhsu       s5, a4, s11
                  srai         s5, s0, 22
                  fsqrt.s      fs6, ft7, rmm
                  mulhsu       t2, a6, t1
                  sra          ra, s6, sp
                  fadd.s       ft4, ft2, fa0
                  fmv.w.x      fs10, a6
                  andi         t4, s6, 1579
                  mulh         t0, s8, s11
                  fmv.x.w      a3, fa3
                  fsgnjx.s     ft3, ft0, ft4
                  andi         ra, tp, 816
                  andi         a7, gp, 1164
                  remu         sp, zero, s8
                  sra          t2, s8, s1
                  lui          t1, 816533
                  or           s5, gp, t5
                  ori          s6, t1, 1129
                  fle.s        s2, fa4, fs0
                  andi         t6, zero, 1385
                  fcvt.wu.s    a7, ft7
                  fsgnj.s      fs4, fs5, fa7
                  srl          a6, zero, t4
                  fsgnjn.s     ft5, fs10, fa0
                  slli         a0, s8, 16
                  ori          s7, s0, -1255
                  auipc        s9, 43622
                  ori          ra, t4, 1917
                  fmul.s       fs0, ft0, fa1, rne
                  fcvt.wu.s    a5, ft1, rne
                  div          s2, s7, a1
                  fcvt.s.wu    ft8, s5, rne
                  fsgnjn.s     fs1, ft4, fs2
                  slti         t5, s9, -819
                  fsgnjx.s     fa6, ft8, ft3
                  fmin.s       fa1, fs9, fs8
                  xori         s6, a4, -780
                  fsgnjx.s     fs10, ft11, fa1
                  nop
                  addi         a1, t6, 746
                  mul          s6, s0, a7
                  fcvt.s.w     ft2, t2, rmm
                  sltiu        t2, s1, 370
                  fcvt.s.wu    fs11, t4
                  fsub.s       fs9, fa0, fs7, rmm
                  mul          t5, a5, s7
                  and          gp, t6, s10
                  addi         s5, s7, -1340
                  srai         t5, s5, 21
                  sra          tp, a6, gp
                  and          zero, t6, a4
                  sltu         a6, a4, a1
                  mulhu        s11, t0, gp
                  mulhsu       a5, a4, s3
                  add          zero, s1, sp
                  srli         zero, s0, 18
                  add          s8, a7, s7
                  fmul.s       fs7, ft8, fa3, rmm
                  andi         s7, s5, -748
                  and          a1, a5, s0
                  fsgnjx.s     fs4, ft3, fs7
                  fmul.s       fs2, ft6, ft7
                  sll          s1, t2, a7
                  feq.s        sp, fa2, fs8
                  auipc        t0, 431074
                  fsgnj.s      fs9, ft5, ft0
                  fdiv.s       fa2, fs8, fa2, rup
                  xor          s0, a6, s6
                  lui          s10, 385061
                  fcvt.wu.s    t6, ft6
                  fadd.s       ft11, fa5, fa1
                  fcvt.w.s     gp, fa2
                  fsgnjn.s     fs1, fs11, fs1
                  mulh         t6, a4, t1
                  fsqrt.s      fa6, ft7
                  remu         ra, tp, s3
                  sltu         s2, s7, s3
                  fsgnj.s      ft10, fs4, ft1
                  feq.s        tp, ft11, ft0
                  auipc        s1, 21431
                  fle.s        s7, fs11, fa2
                  mulhu        t2, a4, s9
                  flt.s        s4, fs11, ft6
                  sub          s7, s1, s2
                  fsqrt.s      ft10, ft9, rdn
                  fle.s        a0, fs6, fs11
                  flt.s        t1, fa1, fs10
                  slli         s8, t5, 3
                  fcvt.w.s     t0, fa1, rne
                  and          t4, s2, t3
                  ori          t2, gp, -1834
                  mulhu        s3, t3, sp
                  divu         t4, a0, t2
                  mulhsu       a5, gp, a5
                  mulhu        a6, s9, t0
                  fcvt.s.wu    ft10, s1, rup
                  add          a0, t2, s1
                  fsub.s       ft7, ft3, fa3, rdn
                  fmin.s       fs11, fa1, fs0
                  fadd.s       fs3, fs3, fs4, rup
                  mulhu        gp, t6, s5
                  fmv.x.w      s2, fa6
                  feq.s        gp, ft9, ft2
                  fdiv.s       fs5, fs4, fs8, rdn
                  fsgnjx.s     fa7, fa0, ft10
                  fcvt.s.w     fs2, t1, rtz
                  srli         ra, t5, 4
                  fmax.s       fs0, fa7, fs0
                  srai         t0, a5, 15
                  auipc        s3, 1043719
                  srai         a3, s2, 26
                  andi         s10, s4, -403
                  slt          zero, a2, a0
                  flt.s        ra, fa1, ft1
                  lui          s2, 80372
                  fmul.s       fs6, ft6, fa1, rdn
                  fmin.s       ft0, fs8, fs7
                  auipc        t6, 712680
                  mulh         s0, t4, a3
                  fdiv.s       fa5, fs6, ft3, rup
                  fcvt.s.w     fa4, t2
                  slti         s10, t1, 554
                  xor          a6, a3, s9
                  fmul.s       ft11, ft2, fs0, rmm
                  fmax.s       fa1, fa7, fs1
                  nop
                  fmul.s       ft2, ft4, ft0, rdn
                  fsgnjx.s     fs3, fs8, ft3
                  auipc        s8, 468685
                  add          s6, s6, sp
                  fsqrt.s      ft1, fs1, rdn
                  remu         s7, s1, tp
                  fcvt.wu.s    t0, fs1, rne
                  or           gp, s4, t6
                  sltu         t1, t2, s7
                  remu         t5, s7, a1
                  fcvt.w.s     t5, fs3, rmm
                  mulh         s9, s6, a7
                  addi         a1, t6, -1226
                  fcvt.s.wu    ft4, t2
                  srl          a6, a3, ra
                  xor          s10, s9, sp
                  andi         t5, t2, -702
                  fsgnjn.s     fs3, fs9, fa2
                  fsgnjn.s     fs4, ft10, ft11
                  add          t0, a4, zero
                  fcvt.wu.s    s11, fs8, rup
                  mulhsu       zero, sp, tp
                  fsgnjx.s     ft0, ft10, ft8
                  fdiv.s       fs3, fa2, fa0, rup
                  fadd.s       fs2, fs0, ft2
                  fcvt.s.wu    fs0, a3
                  mulhsu       s10, a2, sp
                  fcvt.w.s     t6, ft4
                  lui          t0, 441637
                  sra          a0, s11, zero
                  fdiv.s       fa1, fs2, ft11, rtz
                  slt          a3, t1, t6
                  fmul.s       fs2, ft10, ft7
                  mulh         a6, ra, a3
                  addi         a3, a0, -842
                  sll          gp, t2, s7
                  fcvt.s.wu    ft7, t2
                  fcvt.s.wu    ft3, a3
                  srai         t4, s0, 4
                  nop
                  slti         a0, tp, -559
                  sra          s4, s11, s8
                  feq.s        zero, fa3, ft2
                  divu         tp, a6, s9
                  fclass.s     a6, fs2
                  fmv.x.w      s6, fs11
                  slt          a0, s6, a4
                  fmv.w.x      fs5, t2
                  fle.s        s5, fa2, ft0
                  feq.s        a0, ft9, ft0
                  mul          t4, zero, s5
                  srl          t5, s9, s2
                  rem          tp, ra, s4
                  flt.s        s10, fs1, fa7
                  rem          s2, a4, t2
                  fcvt.w.s     t6, fs5
                  fsgnjx.s     fs1, fa2, fa1
                  rem          s7, a3, s1
                  mulh         t1, t2, s1
                  fmv.w.x      ft11, s2
                  and          s3, ra, s8
                  sltiu        t2, ra, -1413
                  fle.s        sp, fa3, fs0
                  slti         s7, t2, 226
                  or           t4, t6, s6
                  sra          s11, s10, s6
                  or           s1, s4, s2
                  fmul.s       fs3, ft2, fs7
                  xori         s0, t1, -584
                  xor          t4, a7, t6
                  add          tp, tp, s0
                  srai         a0, s7, 5
                  fsgnjn.s     fs5, ft1, fs4
                  slt          a7, t6, s1
                  fmv.w.x      fs5, s9
                  auipc        s3, 632111
                  auipc        s10, 399165
                  nop
                  fdiv.s       fa3, ft5, ft5, rmm
                  fsgnj.s      fa1, fa0, ft4
                  fmin.s       ft3, ft5, ft7
                  sltiu        s9, t3, 1802
                  slli         gp, s7, 14
                  fmv.w.x      fs6, a7
                  sltiu        s6, a3, -1918
                  fle.s        zero, fa4, fa3
                  nop
                  xori         t2, s7, 456
                  fcvt.s.w     fa1, s2, rne
                  add          a6, a6, s0
                  slli         s9, t4, 29
                  mulh         s8, s1, s1
                  sltiu        t5, a6, 514
                  fmv.w.x      fs4, t3
                  srli         a5, s5, 15
                  slti         a5, a4, 1958
                  mulh         sp, s0, s6
                  and          gp, a2, a2
                  andi         t6, s3, 670
                  fmul.s       ft2, fa0, ft1
                  xori         t4, s3, -1175
                  sltiu        t0, a1, -956
                  rem          s10, a2, t2
                  srl          s2, gp, t6
                  fcvt.wu.s    t2, ft2, rne
                  add          s1, zero, t1
                  and          t6, sp, a2
                  rem          tp, t5, s8
                  xor          a0, s9, a7
                  srli         s10, s6, 16
                  or           s9, t6, s6
                  mulh         s8, t1, t2
                  fsqrt.s      fs11, fa4, rtz
                  fcvt.w.s     a7, fa3
                  mulh         t0, s10, s11
                  fmul.s       fa6, fs7, fs0, rtz
                  fmv.x.w      s1, fa5
                  and          s7, s0, s3
                  fsgnjn.s     fs8, fa7, fs0
                  fcvt.s.wu    fa0, sp
                  ori          s0, t2, 876
                  srl          s11, sp, s7
                  divu         t0, s8, t5
                  sltiu        t4, a4, -1525
                  fle.s        gp, fa1, ft0
                  fsgnjn.s     ft2, ft4, ft11
                  fsgnj.s      fs10, fa1, ft0
                  fle.s        s8, fa2, ft1
                  sltu         s2, s8, a3
                  sra          t1, t3, s2
                  and          zero, t3, t4
                  nop
                  add          t2, a5, t3
                  fsgnjn.s     fs5, fs2, fa4
                  and          t1, a4, s1
                  xor          a7, s1, s9
                  or           a1, s9, s3
                  fsqrt.s      ft11, ft7
                  lui          s10, 259255
                  sltu         gp, a0, s7
                  rem          s3, a6, s2
                  fmax.s       ft0, fs4, fs5
                  nop
                  fmul.s       ft3, fs5, fs7
                  fclass.s     s2, fa5
                  fsub.s       fa7, ft5, ft0
                  fsqrt.s      fa0, fa4
                  addi         s5, t2, -625
                  mulh         zero, s8, sp
                  fmax.s       fa2, fa6, fs10
                  mulhu        s11, sp, a3
                  mulhsu       gp, s1, s8
                  addi         a5, ra, 1805
                  ori          s5, t2, -225
                  fcvt.s.wu    fs10, t3
                  fmax.s       fs0, fa5, ft5
                  fcvt.s.w     ft4, s5
                  srai         t2, zero, 22
                  fsub.s       fa2, fs9, fa2, rmm
                  srai         sp, t0, 21
                  fcvt.s.wu    fa2, a6, rmm
                  fmin.s       fa3, ft5, fa6
                  remu         s10, t4, t5
                  slli         s0, t3, 18
                  and          s5, a7, a6
                  xori         t5, s1, 1446
                  srai         s2, a0, 5
                  fcvt.wu.s    tp, fs0, rmm
                  fmax.s       fs9, fa3, ft6
                  fcvt.s.w     ft9, s4, rtz
                  and          ra, sp, s10
                  fmin.s       fa6, fs2, fs8
                  fsgnjx.s     fs4, fa5, ft2
                  sra          a7, s5, s2
                  div          s11, s2, t4
                  sub          gp, s5, t0
                  fclass.s     s10, ft4
                  sra          s8, sp, s10
                  fdiv.s       fa4, fs9, fs8, rtz
                  fle.s        s11, fs9, ft10
                  fcvt.s.w     fs6, t1
                  fsqrt.s      fs6, fs2, rne
                  nop
                  divu         s0, sp, s4
                  flt.s        t5, ft3, ft1
                  srli         s5, s5, 31
                  sltu         t0, s1, a0
                  or           tp, a3, t1
                  fmax.s       fs1, ft6, fa7
                  fcvt.s.w     fa0, sp
                  divu         a5, t4, s5
                  fdiv.s       ft4, fs5, ft5, rup
                  addi         t6, s7, 542
                  auipc        s1, 896626
                  xori         s9, s4, 985
                  fmul.s       ft7, fs0, ft5
                  lui          ra, 953909
                  mulhu        a0, s7, sp
                  fsgnjn.s     ft0, fs4, ft5
                  div          s11, s6, s1
                  fadd.s       ft9, ft9, fs9
                  fmul.s       ft6, fs5, fs1, rmm
                  mulh         tp, a3, s1
                  slt          s0, t3, t2
                  fmin.s       ft4, ft9, fa4
                  nop
                  fdiv.s       ft1, ft0, fa1
                  xor          t0, a1, gp
                  sltu         s7, a7, s6
                  auipc        ra, 290230
                  div          s0, s9, s5
                  sll          t6, s5, t6
                  auipc        sp, 344628
                  mulh         s7, gp, a5
                  add          s4, s11, a7
                  rem          t5, s7, t0
                  sra          s11, a7, t6
                  fcvt.s.w     fs0, s0, rmm
                  nop
                  fsgnjn.s     ft9, ft5, ft2
                  mulh         a1, s1, s6
                  andi         s2, s1, 1539
                  fadd.s       fa4, ft2, fs8, rup
                  fsqrt.s      fs9, fa2
                  srl          t4, s2, t1
                  fsgnj.s      fs4, fs4, ft6
                  lui          gp, 866949
                  fsqrt.s      ft0, ft1
                  fmin.s       ft3, fs2, ft0
                  fmin.s       fs5, fs3, fa5
                  fmin.s       fa4, fs3, ft9
                  auipc        s11, 720280
                  fmul.s       fa0, fs10, ft9
                  fcvt.wu.s    s4, fs8, rtz
                  fcvt.w.s     a7, ft11
                  fmv.w.x      ft5, s8
                  srli         s0, s9, 14
                  andi         s7, s11, -1132
                  andi         t4, t6, 704
                  or           a6, s0, tp
                  slti         sp, sp, -490
                  srl          t0, t0, s1
                  fsgnjn.s     ft5, fs8, fs0
                  sltiu        s1, t5, 1484
                  mulh         s11, a3, t6
                  sra          zero, s8, a1
                  remu         a7, s0, a0
                  div          s2, s5, a0
                  fsgnjn.s     ft1, ft5, ft4
                  fcvt.wu.s    s1, fs8
                  or           s1, t0, t2
                  rem          sp, ra, a7
                  sll          t2, tp, a4
                  mulh         a0, a6, s5
                  fdiv.s       ft3, fs6, fs1, rdn
                  fcvt.w.s     t5, fs4, rup
                  srai         s1, a4, 4
                  fadd.s       ft0, fa0, ft7
                  mulhu        s7, t0, a6
                  flt.s        t0, fs10, fs0
                  sll          a3, t2, sp
                  sltu         tp, t1, a5
                  fsgnjn.s     ft11, ft7, fs10
                  remu         s10, s5, s8
                  and          s9, a4, s5
                  fmv.w.x      ft4, t1
                  fsqrt.s      fs5, fs11
                  fdiv.s       ft11, fs0, ft0
                  fcvt.s.w     fs10, s11, rmm
                  lui          s6, 282098
                  fcvt.s.w     ft2, a6
                  fadd.s       ft9, fs7, fs11
                  andi         s0, t1, 1498
                  feq.s        s4, ft3, fs10
                  mulhu        s1, t4, a3
                  fsgnjx.s     fs9, fs4, ft6
                  lui          a1, 830956
                  fcvt.w.s     a0, ft9
                  nop
                  mulhu        sp, a2, tp
                  fcvt.wu.s    a3, fs4
                  ori          ra, t3, 307
                  feq.s        s4, ft8, ft6
                  fmv.x.w      s5, fs1
                  fmul.s       fa7, fa1, ft5
                  fdiv.s       ft3, fa1, fa4
                  fdiv.s       fs8, ft11, ft0, rne
                  fmax.s       fs6, fs0, ft2
                  fle.s        sp, fs9, fa0
                  addi         t6, t4, 64
                  remu         s5, t3, s9
                  srli         s2, t1, 15
                  fle.s        t6, fs0, fa4
                  rem          gp, s1, a3
                  fmin.s       fs2, ft2, fs8
                  fclass.s     ra, ft1
                  fcvt.wu.s    a0, fs7, rup
                  fclass.s     s7, fs7
                  remu         s1, t4, gp
                  mulhu        s8, s10, s11
                  fmul.s       fs2, fs9, fa0
                  fle.s        a3, ft7, fs9
                  mulhsu       t2, t1, s6
                  add          s10, t5, t1
                  fsub.s       fs6, ft8, ft2
                  fmv.w.x      ft2, s11
                  fsub.s       fs6, ft4, ft5
                  addi         s7, s9, 218
                  xori         s3, a5, 1293
                  srl          t5, s11, t3
                  srl          s8, a1, a3
                  fadd.s       fa1, ft0, ft3
                  srli         s8, s4, 29
                  mulh         a3, t4, a2
                  fmin.s       ft10, fs11, fa3
                  divu         s2, t6, s4
                  sltu         t0, zero, t0
                  fsqrt.s      fs6, ft7
                  sub          ra, t0, s4
                  srai         s1, s6, 26
                  remu         a7, s6, gp
                  fcvt.w.s     tp, ft7, rmm
                  ori          s0, a6, -1944
                  fsgnjx.s     fs0, ft11, fa1
                  fsqrt.s      fs9, fa6
                  divu         a5, t5, t6
                  mulhu        a1, a0, t6
                  xor          s11, s9, t2
                  rem          s0, s8, gp
                  or           s5, s3, s7
                  slt          s10, s6, t0
                  mulhu        t5, t0, s8
                  fcvt.w.s     s7, fa6, rne
                  add          s4, gp, s7
                  fsgnjn.s     fa1, fs10, ft3
                  slli         s8, a7, 17
                  add          sp, s3, s9
                  div          t1, t3, t3
                  andi         t5, ra, 1357
                  fsgnjx.s     fa3, fs7, ft7
                  add          s0, s5, a6
                  sltiu        a7, t2, 1227
                  fsgnjn.s     ft5, fa2, fa4
                  fdiv.s       ft1, ft11, ft10
                  mulhu        a0, a3, sp
                  fsqrt.s      fs2, fs11, rdn
                  fcvt.s.w     fs3, a4, rdn
                  fle.s        a1, fs4, fs5
                  fcvt.w.s     ra, ft8
                  srl          s3, a4, sp
                  rem          t0, sp, s9
                  fle.s        s6, ft2, ft1
                  fmax.s       ft7, fa3, fs0
                  fsgnjx.s     fs5, ft1, ft3
                  fmv.w.x      fs10, t2
                  srli         s10, a1, 1
                  and          ra, a0, t3
                  sra          s1, gp, t0
                  nop
                  sltu         t0, s1, s1
                  fle.s        t5, fs4, ft10
                  xori         a6, zero, -441
                  fcvt.s.wu    fs8, a3
                  fmv.w.x      ft7, s3
                  rem          s0, sp, s4
                  sra          a5, s11, s10
                  srli         s1, gp, 24
                  xor          gp, t6, s8
                  srai         s0, a0, 20
                  sra          s6, t5, a2
                  fmax.s       fs2, fs3, ft10
                  fclass.s     s7, fs11
                  fdiv.s       fs8, ft7, ft9
                  sltiu        s4, t2, -901
                  fsqrt.s      ft0, ft6
                  sltiu        t1, s9, 1623
                  fmin.s       fa2, ft11, ft7
                  flt.s        s8, ft6, fs6
                  flt.s        zero, fa7, fs2
                  mulh         a1, s1, t1
                  sll          t5, t1, t2
                  slli         s8, s8, 27
                  mulh         a6, a3, a3
                  auipc        s0, 194940
                  mulh         s11, a5, t2
                  feq.s        s8, ft1, ft5
                  ori          s6, a6, 1960
                  fsgnjx.s     fa1, fa5, fs10
                  and          s8, a0, s7
                  srli         a1, tp, 29
                  or           a3, s4, ra
                  and          s7, t3, a2
                  sll          a5, sp, s0
                  div          a7, s10, zero
                  andi         a1, t3, -230
                  sub          s9, a6, sp
                  fsgnjn.s     ft9, fa6, fa3
                  rem          a0, t4, gp
                  fsgnj.s      fa6, fs7, fa5
                  andi         s5, a5, 1462
                  fsgnj.s      fs8, ft11, fa7
                  div          a3, t1, s1
                  fcvt.wu.s    a6, ft6
                  slt          sp, sp, zero
                  fdiv.s       fs7, fa4, fa2, rup
                  xor          a6, a4, a4
                  ori          a7, s2, -1287
                  fdiv.s       ft10, fs5, fs4, rtz
                  srl          s4, s7, zero
                  fmax.s       ft7, fa3, ft3
                  xor          zero, a0, s3
                  ori          s6, s2, 837
                  ori          s6, t2, -1520
                  fsgnjx.s     ft0, fa6, ft9
                  slti         ra, a6, 206
                  sll          a1, a3, s3
                  fcvt.w.s     t0, fs2
                  fcvt.w.s     t2, fs2
                  rem          t1, t5, a0
                  addi         t4, s2, -1129
                  andi         ra, t4, 1612
                  sll          gp, s3, a2
                  fsqrt.s      fs1, ft11
                  slli         sp, gp, 3
                  auipc        gp, 860328
                  srli         s11, s2, 6
                  fsqrt.s      ft2, fs0
                  fadd.s       ft5, fs10, ft6
                  srai         s5, s0, 5
                  mulhsu       t2, s1, t5
                  fsgnj.s      ft6, fs5, fs4
                  sltiu        s7, a2, 666
                  slti         s2, a3, 826
                  fcvt.wu.s    a3, fs9, rup
                  addi         a1, t1, -708
                  mulhu        zero, s0, s9
                  or           tp, t2, t6
                  ori          t5, a7, 261
                  fadd.s       fa7, ft5, fs11
                  fmax.s       ft4, fs11, fs7
                  nop
                  fdiv.s       ft11, fa3, fs0, rdn
                  rem          s2, a7, a4
                  lui          t4, 532772
                  fmin.s       fs3, fs2, fa3
                  mul          s9, s7, a7
                  fadd.s       fa0, ft2, fa3
                  slt          s6, a7, a7
                  remu         a1, s7, s4
                  fadd.s       fa1, ft4, ft8
                  fsgnjn.s     fs1, fa7, fs4
                  sltu         tp, t1, s3
                  fcvt.wu.s    zero, fa4
                  fclass.s     t2, fa0
                  nop
                  auipc        t6, 334230
                  fcvt.s.wu    ft9, s2
                  slli         s4, a4, 26
                  fcvt.w.s     a6, fs4
                  fclass.s     zero, fs10
                  slli         t2, s5, 14
                  mulh         tp, sp, a4
                  xori         ra, s7, -233
                  fmax.s       ft1, fs6, fs11
                  fsub.s       ft7, fa2, ft1, rup
                  fcvt.w.s     tp, ft7
                  fmv.w.x      fs7, t5
                  remu         t4, s3, a0
                  fdiv.s       fa0, fs10, ft10, rne
                  fmin.s       ft11, fs0, ft3
                  xor          t4, s4, s0
                  fsgnjx.s     fa3, ft9, ft9
                  nop
                  mulhsu       s1, gp, t1
                  sll          t5, a7, s9
                  fsub.s       fa3, fs1, ft10, rdn
                  xor          a5, s4, s4
                  add          t5, a6, s4
                  slli         tp, a5, 0
                  slti         s6, ra, 745
                  rem          s0, ra, s3
                  rem          gp, t6, s7
                  mulhsu       a6, a3, s9
                  fsgnjx.s     fa0, ft10, ft2
                  mulh         sp, t4, tp
                  sub          a3, s11, a3
                  auipc        s4, 913687
                  remu         a7, s8, s8
                  fsub.s       ft5, ft6, fa2, rup
                  slt          s9, s10, s10
                  fdiv.s       fs3, ft8, fs0, rmm
                  slti         a0, a6, -725
                  fsgnj.s      fa7, fs1, fa2
                  mulhsu       t4, a5, sp
                  mulhu        a0, t2, s0
                  feq.s        s1, fa3, fs0
                  srl          sp, s2, s7
                  fsqrt.s      ft5, ft5
                  sltu         gp, s6, s1
                  fsgnj.s      fs3, ft7, fs0
                  mulhu        s3, s3, s9
                  fle.s        a3, ft4, fa6
                  srli         t4, s4, 24
                  mulhu        s8, s1, ra
                  fdiv.s       ft10, fa4, fs8, rdn
                  andi         zero, t0, 583
                  and          s3, s11, a1
                  or           s3, a1, a2
                  srli         s1, a1, 4
                  fcvt.s.w     fa2, a1, rne
                  srl          s5, a4, zero
                  slti         s3, a6, -1206
                  fmul.s       ft3, fa5, fs7, rmm
                  or           s7, s4, a3
                  sub          s3, s11, s11
                  and          s7, sp, a5
                  mul          t6, a0, s3
                  flt.s        t4, ft9, fs10
                  sltiu        s3, s2, 1223
                  fclass.s     s8, fs6
                  fdiv.s       ft8, fs6, ft4, rne
                  add          s5, a1, a3
                  feq.s        zero, fs0, ft8
                  fmul.s       ft9, fs4, fa7
                  fcvt.s.w     fs3, s8, rup
                  fcvt.s.wu    ft11, t2, rne
                  fmul.s       fs0, ft5, fs2
                  sltiu        s4, s0, 495
                  sltiu        s9, a0, -103
                  fcvt.w.s     s0, ft0
                  fmax.s       fa6, fs9, fs6
                  mulhsu       a3, s7, a4
                  ori          zero, s8, -593
                  mulhsu       s1, ra, a4
                  fmv.w.x      fs2, s1
                  andi         a7, a6, 1546
                  fmin.s       ft6, fs2, fs8
                  div          a1, ra, s1
                  ori          gp, t4, 831
                  fcvt.s.w     ft8, t5
                  addi         t1, a6, -1468
                  nop
                  fmv.w.x      ft4, a1
                  nop
                  fclass.s     s6, fs2
                  slli         s0, s2, 31
                  fsgnj.s      fs8, fs10, fa7
                  fmax.s       ft8, fa7, ft11
                  and          t6, s8, a7
                  sltiu        s8, a7, -1103
                  fsqrt.s      fa1, fs8, rtz
                  fsqrt.s      fs3, ft7
                  mulhu        s11, sp, ra
                  fmax.s       ft3, ft3, ft6
                  fsgnj.s      fs0, fa1, ft8
                  fclass.s     sp, fs7
                  divu         s6, ra, t0
                  fdiv.s       ft11, fa1, fs9, rdn
                  fcvt.s.w     fs7, s5
                  ori          s3, s11, -1036
                  slli         a5, s11, 24
                  fsgnj.s      fs11, ft7, fs6
                  fsgnjx.s     fs7, fs5, fa1
                  nop
                  div          s7, a0, zero
                  fsgnjn.s     fa1, fs9, fs1
                  xori         s5, s7, -1529
                  xori         s9, a2, 348
                  fle.s        tp, fa3, fa5
                  mulhsu       t6, a2, tp
                  xori         t1, t2, -1687
                  fsgnjx.s     fa7, fa6, ft10
                  xor          t0, s3, s4
                  slti         t0, t0, 988
                  fmv.w.x      fa2, ra
                  fsgnjn.s     ft2, ft4, fs8
                  slli         sp, ra, 3
                  fclass.s     s5, fs5
                  mulhsu       tp, ra, gp
                  mulhu        t1, a5, tp
                  mulh         s3, sp, t5
                  sll          s0, a0, a1
                  fsgnj.s      fs8, ft7, ft2
                  sltu         s2, a3, a0
                  slli         t5, s10, 21
                  fsgnjn.s     fs3, fa1, ft1
                  rem          a0, t1, s2
                  sltiu        t2, t6, 889
                  feq.s        sp, fs5, fs11
                  lui          a1, 45637
                  fmin.s       ft0, ft1, fa3
                  div          s10, t4, a1
                  fsqrt.s      ft5, fa3
                  fcvt.w.s     a0, fa2, rtz
                  slti         s1, t2, -1352
                  fsgnjn.s     fs7, ft5, fs9
                  sltu         tp, gp, a0
                  flt.s        s2, fs7, ft6
                  fmv.w.x      fa2, t4
                  fsgnj.s      fa1, fs8, ft4
                  slt          s3, a1, s7
                  fmv.x.w      a6, fs3
                  fmv.w.x      ft10, t6
                  div          tp, s8, a2
                  fmv.x.w      s6, ft3
                  and          s9, s5, s10
                  srl          t2, s2, s1
                  fmv.x.w      t6, fs3
                  sra          zero, t2, s8
                  flt.s        s6, fs0, fs11
                  sll          t2, s7, t5
                  sltiu        a7, t5, 720
                  or           s1, a1, s10
                  fcvt.w.s     s4, ft4, rdn
                  fclass.s     a6, ft9
                  mulhu        tp, tp, sp
                  fadd.s       fs7, ft7, ft9
                  fsgnjn.s     ft5, fs6, fs9
                  fmul.s       fs7, fa0, fa5
                  fmin.s       fs11, ft8, ft2
                  mul          s3, s0, s4
                  sra          s11, a4, a0
                  fsgnjx.s     ft0, fa0, fs0
                  fsqrt.s      fs11, ft6
                  mulh         t1, s9, s7
                  rem          s1, ra, gp
                  slti         t2, ra, 986
                  sltiu        s10, s2, -1186
                  fsqrt.s      fs6, fs3, rdn
                  mulh         a1, zero, gp
                  and          t0, t2, t3
                  mulhsu       s4, sp, a0
                  divu         s10, ra, s5
                  add          t0, a2, gp
                  fmul.s       ft5, fs2, fs8, rmm
                  rem          s11, a7, ra
                  srli         zero, s3, 14
                  fcvt.w.s     s9, ft9
                  fadd.s       fa1, fs2, ft4
                  srai         t1, tp, 13
                  fmax.s       fs10, ft7, fs3
                  srl          a7, s6, tp
                  divu         t1, zero, t4
                  fmv.w.x      fa4, s2
                  or           tp, tp, s7
                  srli         a5, zero, 26
                  sltiu        s7, s10, -1407
                  srai         t4, s6, 5
                  divu         t0, sp, a4
                  fcvt.wu.s    a6, fs10, rmm
                  fcvt.s.w     fs7, t3
                  sltiu        sp, tp, 1200
                  add          t1, gp, t4
                  fsgnjx.s     fs9, fs0, fs1
                  srai         t1, a3, 18
                  fmul.s       ft1, ft4, fa4, rtz
                  sltu         gp, a3, a3
                  fmin.s       fa7, fs2, fs4
                  fmul.s       ft5, fs10, fs8, rtz
                  xori         s8, s2, -1749
                  div          zero, t0, s10
                  fsgnjx.s     ft11, fa0, fa1
                  fsgnj.s      fs4, fa7, fa7
                  srli         s5, s6, 13
                  remu         a3, s3, t1
                  slt          t4, s11, tp
                  fcvt.wu.s    s8, fs6, rup
                  slli         a7, s1, 21
                  sltiu        a7, t1, 678
                  slt          t2, t2, s6
                  lui          a3, 764722
                  fmax.s       ft2, fs10, fs9
                  fmax.s       fs5, ft4, fa6
                  fmv.w.x      fs2, t5
                  slt          s7, s10, gp
                  xori         s4, t2, -707
                  fcvt.s.w     ft4, t5
                  slt          s0, s3, t6
                  fsgnjn.s     ft0, ft10, fa4
                  fcvt.wu.s    tp, fs8
                  fsub.s       ft2, ft3, fs9
                  fmin.s       fs11, fs1, ft10
                  fadd.s       fs2, ft0, fa3, rne
                  sub          s2, a7, a1
                  fcvt.s.wu    fs1, a5, rup
                  andi         s4, a4, -830
                  sltu         gp, s7, t3
                  sltiu        s9, a3, -560
                  fcvt.s.wu    fs0, a0, rdn
                  fcvt.w.s     t6, ft8
                  fsgnj.s      ft7, fs4, fa2
                  add          t4, a0, sp
                  sra          zero, zero, zero
                  fmin.s       fs3, fs8, ft3
                  lui          s10, 37506
                  mulhu        zero, sp, ra
                  fsgnj.s      fa5, ft4, fs6
                  auipc        a7, 932436
                  div          s5, tp, a3
                  sub          t4, t2, t1
                  lui          ra, 183062
                  mulh         s5, tp, t0
                  xori         a3, tp, -150
                  sltiu        s2, a3, -1523
                  fcvt.s.w     fa6, s3
                  fadd.s       ft11, ft1, fs6, rup
                  fsgnjx.s     ft7, fa4, ft10
                  mulhsu       tp, a0, s11
                  sub          s1, s8, s10
                  fsgnjn.s     fa7, fs10, fa2
                  sltiu        a6, s2, -1426
                  fcvt.s.w     ft6, s8
                  fle.s        gp, fs3, ft2
                  sltiu        tp, s2, 1731
                  sltu         s8, a4, a4
                  mulhu        s10, s11, a5
                  fsgnjx.s     ft9, ft1, fs5
                  remu         t1, s4, t3
                  fmax.s       fs11, fs1, fs2
                  rem          s11, ra, s7
                  slti         s4, t5, -1908
                  fdiv.s       ft1, ft2, ft5
                  nop
                  slt          s9, zero, t5
                  flt.s        s1, fa7, fs3
                  add          a1, s8, t2
                  ori          s10, s2, 757
                  sub          s10, sp, gp
                  fmv.w.x      fs6, s6
                  slti         a0, s6, 461
                  sub          s9, s7, t6
                  mul          zero, t6, a3
                  andi         s11, s2, 310
                  sub          s5, a3, s5
                  fclass.s     ra, ft0
                  lui          gp, 560958
                  fmax.s       ft5, fa4, fs4
                  srai         a7, a0, 23
                  feq.s        s6, fa5, fa0
                  sltiu        t6, s6, -597
                  srli         s9, a1, 2
                  lui          s0, 998653
                  fcvt.s.w     ft0, t0
                  fadd.s       fs2, ft2, fa5, rup
                  fcvt.wu.s    s0, ft9, rne
                  addi         a5, t5, -1519
                  fsub.s       ft1, ft1, fa6
                  sra          a7, s10, t2
                  fcvt.s.wu    fa5, t6
                  fcvt.s.wu    ft6, zero, rne
                  fsgnjx.s     ft11, fa6, ft9
                  slti         t0, s8, 1253
                  mul          gp, a6, t0
                  fsqrt.s      fa6, ft4
                  flt.s        s4, fa6, fa1
                  sub          s1, s8, t3
                  fle.s        t4, fa4, fa1
                  fmin.s       ft11, fs3, fa4
                  auipc        sp, 305281
                  mulh         s4, zero, s4
                  andi         s11, t5, 1524
                  fclass.s     t6, ft10
                  fmin.s       ft0, fs10, ft1
                  sra          s11, a5, t0
                  fmin.s       ft8, fa0, ft4
                  fmax.s       fa6, fs9, fa1
                  feq.s        zero, fs10, fs2
                  xori         s6, a1, 439
                  nop
                  fle.s        ra, fs1, fs5
                  fmv.w.x      ft0, t1
                  sub          s0, t4, ra
                  srai         zero, t3, 31
                  divu         s7, a2, a2
                  fclass.s     a6, fs10
                  xor          s6, s9, a3
                  divu         s2, t3, s7
                  auipc        s11, 1024688
                  nop
                  mulhu        s6, s2, t4
                  fcvt.s.wu    fa4, tp, rdn
                  fadd.s       fs8, ft5, fs10
                  mul          a6, t1, a5
                  fdiv.s       ft7, fa3, fs3
                  mulhu        s0, zero, tp
                  sltu         s2, a2, gp
                  lui          s9, 219940
                  fsqrt.s      ft6, fa5, rup
                  xor          s3, t1, ra
                  slli         a6, a5, 25
                  fmax.s       fa3, fs4, fa3
                  xor          a0, s8, a4
                  fmv.w.x      fa5, sp
                  slti         s5, tp, -1377
                  slti         s10, t1, -737
                  rem          s6, t4, zero
                  fmv.w.x      ft11, s6
                  fcvt.w.s     s7, ft4, rdn
                  divu         s7, t5, tp
                  fcvt.s.wu    fa0, a1
                  fadd.s       fa3, ft6, fa6
                  sll          t5, a4, t4
                  fadd.s       ft11, fs3, ft10
                  divu         ra, a5, t4
                  fcvt.w.s     ra, fs1, rtz
                  remu         t6, t5, s11
                  mul          t1, s5, t3
                  srli         a6, sp, 13
                  auipc        t0, 102989
                  ori          s11, s7, -1242
                  mulh         s2, s10, s0
                  fmin.s       ft10, ft10, fa4
                  fle.s        s8, ft9, fs1
                  nop
                  srl          a6, s9, t1
                  fmax.s       ft10, ft3, fs1
                  xori         t0, zero, 1471
                  lui          tp, 577969
                  nop
                  fmul.s       ft9, ft2, ft3
                  sltiu        a7, a0, -328
                  fmax.s       fa7, ft5, ft1
                  fle.s        t1, fa0, fs4
                  nop
                  sub          s4, s1, zero
                  fsqrt.s      fs2, ft10
                  mul          s10, t5, t5
                  fmax.s       ft7, fa1, fa5
                  fclass.s     t1, fs4
                  mulhu        t0, t2, s6
                  fcvt.wu.s    a3, ft9, rup
                  feq.s        a6, fa6, ft3
                  or           s1, a0, s1
                  and          s0, t0, s10
                  mulh         a6, t5, tp
                  fcvt.s.wu    fs8, gp
                  fcvt.wu.s    ra, fs10, rtz
                  mulhu        a1, a5, gp
                  srl          t2, s9, s9
                  fmul.s       ft1, fs5, ft7, rne
                  auipc        s5, 1016278
                  mul          s11, s3, a4
                  sll          gp, s9, t0
                  slli         s0, a4, 2
                  fmv.x.w      s5, fs0
                  fcvt.wu.s    t1, ft6, rtz
                  add          s2, t3, a3
                  fmul.s       fa3, fa0, ft0
                  sub          sp, zero, s2
                  slt          gp, s11, a0
                  fmin.s       fa7, fa4, ft8
                  add          s10, a7, s1
                  sll          s4, a1, s4
                  fsgnjx.s     fa5, fs5, fa2
                  fmin.s       fa1, fs4, ft2
                  slti         tp, gp, -1778
                  andi         a1, zero, 703
                  lui          s7, 1007142
                  and          t2, t0, t6
                  slti         s2, s3, 1101
                  fcvt.w.s     s9, ft5, rmm
                  fle.s        t5, fs2, ft9
                  fmv.w.x      fa4, s10
                  fmv.x.w      s7, ft11
                  flt.s        s6, fs8, ft3
                  div          a5, ra, s3
                  feq.s        s2, ft9, fa1
                  nop
                  xori         zero, gp, -1997
                  addi         s1, s7, -1277
                  nop
                  xor          a1, a0, s0
                  andi         s3, a2, -1742
                  xor          t5, tp, s10
                  fmv.w.x      ft8, t1
                  slli         gp, s2, 20
                  slli         t6, a0, 10
                  fle.s        a5, fa6, ft3
                  fmv.w.x      fa5, a6
                  remu         t6, a3, tp
                  fcvt.w.s     a5, fs2
                  auipc        s7, 10833
                  sra          t0, gp, sp
                  fsqrt.s      ft10, fs11, rmm
                  fcvt.s.wu    ft4, t1, rup
                  fsgnj.s      ft4, ft8, ft10
                  fle.s        s0, ft10, fa3
                  mulhu        s5, s9, s3
                  sltiu        t2, s2, 748
                  fmv.w.x      ft8, tp
                  mul          s7, s1, t4
                  fsgnj.s      fa5, fs4, ft7
                  add          t2, t0, a5
                  srli         s10, s2, 29
                  fsub.s       fa1, fa3, fs7
                  mul          a5, a5, t4
                  and          t1, a5, t1
                  add          gp, s10, s8
                  and          a5, s5, zero
                  slti         gp, a2, 1508
                  add          s2, s3, sp
                  div          s3, gp, t6
                  fle.s        s10, ft3, fa6
                  fmax.s       fs9, fs7, fa6
                  ori          s0, s10, 1018
                  andi         s10, tp, -475
                  divu         t6, s9, s0
                  flt.s        a6, fs0, ft2
                  slt          s10, zero, t3
                  fmv.x.w      s8, fa2
                  fmax.s       fs10, fa0, ft10
                  sll          t1, gp, s3
                  fsgnjn.s     fa6, fs0, fs7
                  and          s11, tp, t3
                  fmv.x.w      s4, fa6
                  auipc        s1, 497037
                  addi         a1, s5, -1251
                  rem          s4, a6, t0
                  fmin.s       fs1, fs1, fa4
                  srli         a1, s0, 16
                  sra          a0, sp, s6
                  add          s5, t6, s2
                  fdiv.s       ft4, ft3, fs4, rne
                  mulhu        a0, tp, sp
                  div          t4, s3, gp
                  remu         zero, s8, t1
                  fadd.s       ft1, fs6, fs10, rup
                  feq.s        a7, ft3, fa3
                  sltiu        s9, s4, -1736
                  auipc        s9, 803962
                  div          s9, t0, a7
                  fcvt.s.w     ft4, gp
                  fsqrt.s      fs8, fs2, rmm
                  srl          s8, t0, s7
                  nop
                  fcvt.s.w     fs10, a3, rup
                  sub          a5, s9, a3
                  and          ra, s4, zero
                  slli         a6, t4, 18
                  fmv.x.w      s6, fs11
                  srli         s5, t4, 17
                  sub          s11, s1, t3
                  sltu         s1, s3, a4
                  feq.s        a3, ft5, fs4
                  slt          sp, s2, tp
                  mulhsu       s11, a6, s10
                  fcvt.s.wu    ft9, t5
                  fsub.s       ft7, fa1, fs4
                  auipc        sp, 997327
                  addi         s1, t4, 1687
                  fmv.w.x      fa5, s6
                  fle.s        a5, fs9, fa3
                  nop
                  sra          tp, a4, s11
                  mulhsu       gp, s8, t6
                  srl          t4, t6, a4
                  mul          t6, t3, s11
                  slti         t4, s8, 1301
                  sra          tp, a1, s5
                  fadd.s       fs9, fa0, ft9
                  slli         t2, t5, 9
                  mulhsu       t5, s7, a1
                  mulhu        s9, s7, s0
                  fdiv.s       fa1, fa6, ft6
                  sra          t4, s2, tp
                  lui          tp, 689858
                  mulhu        ra, a2, t4
                  fclass.s     a0, fa3
                  fsgnj.s      ft9, ft9, fa0
                  ori          s9, s0, 1275
                  fle.s        s8, fs10, fs10
                  fcvt.s.wu    ft5, s6, rup
                  fsgnjx.s     ft2, fs5, fa3
                  sub          t1, s10, t6
                  fmul.s       fa2, fs10, fs10
                  and          a7, s3, s4
                  mulh         s6, s1, s11
                  xor          zero, a3, s4
                  fcvt.s.w     fa3, a2, rdn
                  fmax.s       fs9, fs9, fs1
                  add          t4, t2, a2
                  fmul.s       ft5, fa2, ft10, rup
                  fmv.x.w      s3, ft0
                  fdiv.s       fa3, ft11, fs9, rdn
                  addi         s11, t1, 705
                  sltiu        t2, s4, 850
                  andi         tp, s8, -1397
                  andi         s7, a4, -425
                  flt.s        a0, fs5, fs0
                  fle.s        sp, ft11, ft2
                  slt          t4, s0, a1
                  fsqrt.s      fs0, fa2, rne
                  rem          ra, t3, zero
                  fsub.s       fs8, fa2, ft7, rne
                  mulh         a3, t0, s6
                  fsqrt.s      fs4, fa4, rup
                  remu         gp, s3, t6
                  fcvt.w.s     tp, fs0, rdn
                  slt          sp, tp, s11
                  and          t0, a6, s7
                  remu         sp, s6, tp
                  rem          t4, s1, t3
                  feq.s        gp, ft5, ft8
                  fdiv.s       ft6, fs6, fs6, rup
                  ori          a7, a5, 39
                  slli         t0, a6, 20
                  fsgnjx.s     fs2, ft5, fs5
                  xor          s6, s8, a7
                  fsub.s       fs10, fa2, ft2, rup
                  srai         a3, t6, 13
                  and          t5, ra, a4
                  nop
                  rem          a7, s3, t1
                  fcvt.w.s     tp, ft3
                  sltu         ra, s8, a5
                  sll          tp, s6, a7
                  ori          a0, a2, -459
                  andi         s7, s0, 261
                  fmv.x.w      s8, fs9
                  sll          t4, a3, t2
                  fcvt.wu.s    s5, fs7, rne
                  sltiu        a6, a1, 1719
                  rem          gp, s8, a3
                  ori          t2, t2, 878
                  fmv.w.x      ft3, s4
                  fdiv.s       fa7, fs7, fa6
                  ori          s3, tp, 1820
                  andi         s9, a6, -211
                  rem          sp, s3, gp
                  fdiv.s       fs0, fs6, ft9, rup
                  fmv.w.x      ft0, tp
                  fsgnj.s      fs11, ft0, ft3
                  add          t2, s8, zero
                  sltu         s11, s9, a1
                  or           a6, a4, zero
                  divu         t4, s3, t0
                  remu         s8, s5, sp
                  feq.s        t4, fs5, fa6
                  fsgnjn.s     fs11, ft1, fa1
                  sltu         sp, s8, t1
                  srai         s1, s9, 18
                  fcvt.s.w     ft3, t5, rdn
                  fsqrt.s      fs10, fa2, rup
                  fmv.x.w      s0, ft7
                  fmv.x.w      s4, ft0
                  slli         s9, s0, 20
                  flt.s        a5, ft5, fa1
                  andi         a0, s6, -386
                  divu         a3, t1, s7
                  auipc        s1, 675107
                  fadd.s       fa7, ft11, ft4, rne
                  mul          t4, a7, s7
                  srai         a1, gp, 27
                  fmul.s       fa5, fs9, ft6
                  srli         s0, s7, 7
                  sll          t1, a3, s2
                  sltiu        a1, t3, -398
                  sltu         s10, a3, a2
                  sltiu        a3, sp, 331
                  srli         t2, a0, 12
                  div          s7, t5, sp
                  divu         a3, t6, s9
                  fsqrt.s      ft9, fs5
                  fmax.s       fa0, ft1, fs9
                  auipc        zero, 491545
                  mulh         ra, s1, s1
                  fclass.s     s11, ft2
                  divu         t0, zero, s7
                  fmax.s       fs6, ft7, ft6
                  fcvt.s.wu    ft5, a4, rtz
                  divu         s1, gp, a5
                  fsgnjx.s     fa6, ft0, fs11
                  rem          a3, a1, a4
                  fcvt.w.s     sp, ft0
                  fsqrt.s      fa1, fs2, rne
                  fadd.s       ft4, fs4, ft10
                  or           gp, t5, s0
                  xori         s9, s9, -844
                  fsgnjx.s     ft11, fs6, fa7
                  sra          ra, t1, t2
                  addi         a6, s2, 828
                  xori         t6, tp, 1729
                  fclass.s     t1, fs8
                  divu         t6, a3, gp
                  mulhu        t0, t6, tp
                  and          s2, s9, t5
                  feq.s        a6, fs7, fa7
                  mulh         t0, a5, t6
                  add          t6, s1, s5
                  or           a3, a5, s3
                  addi         s9, s8, 1963
                  srl          s5, s0, a6
                  fmv.w.x      ft3, s10
                  fsub.s       ft11, fs2, fa6, rdn
                  fmv.w.x      ft0, a4
                  slti         gp, a3, -1627
                  fcvt.wu.s    s1, fa4, rmm
                  fcvt.wu.s    s11, fs3, rup
                  slli         ra, t3, 22
                  slti         t5, t4, 593
                  fcvt.s.wu    fs5, s6, rdn
                  fsgnjx.s     fs6, fa7, ft9
                  slti         tp, s5, -1419
                  fclass.s     s0, fa5
                  lui          s4, 753025
                  sll          t6, t4, ra
                  addi         a0, zero, -1388
                  fsqrt.s      fa1, fs2, rup
                  sub          a5, s8, tp
                  xor          s6, s4, a2
                  xori         s5, a3, -1000
                  rem          gp, t5, a7
                  fclass.s     t4, fs4
                  ori          s5, t3, -545
                  rem          t4, a0, a6
                  mulhsu       t2, t6, a6
                  fsgnjx.s     fa7, fs6, fs7
                  srai         s5, t3, 15
                  or           a5, t2, a5
                  sll          s4, t5, a1
                  div          s5, s4, a4
                  fsgnjx.s     fs11, fs1, fa6
                  fadd.s       fs3, fs2, ft10
                  sub          tp, t1, s9
                  and          tp, a7, a7
                  fmul.s       ft6, fs4, fa2, rdn
                  addi         sp, gp, -1424
                  sltiu        s10, zero, 1014
                  sll          t1, t0, t3
                  mulhsu       s7, s3, tp
                  fcvt.s.w     fs4, s5, rtz
                  sltiu        s3, s11, -1155
                  fsgnjn.s     ft10, ft4, fs5
                  srli         s4, s6, 27
                  fsub.s       ft4, fs1, ft8
                  slti         t0, s8, 1522
                  rem          s6, tp, a5
                  fclass.s     s2, ft8
                  fmv.w.x      ft4, s5
                  flt.s        s10, ft3, fa1
                  fsgnj.s      fs5, fa1, ft10
                  sub          s8, a6, a4
                  fmul.s       fa2, ft1, fa0
                  ori          t6, s9, -1987
                  xor          t4, s1, t4
                  flt.s        s10, fa7, fs8
                  fmul.s       fa5, fa7, fs4, rne
                  fmul.s       fs7, ft4, ft8
                  fcvt.s.wu    ft3, zero
                  fle.s        a3, ft0, ft3
                  feq.s        t0, ft4, fs6
                  div          a0, tp, t4
                  remu         a1, a7, s9
                  fsgnjn.s     fs7, ft4, fs10
                  fcvt.wu.s    s0, fs11, rmm
                  or           s11, t6, s7
                  sub          t1, a6, a2
                  slt          s5, s8, a3
                  or           sp, s2, s8
                  fdiv.s       ft11, ft2, fs7
                  divu         s6, a7, a7
                  fsgnj.s      fa0, fs4, fa3
                  slli         tp, s1, 26
                  fsgnjx.s     ft7, fa1, fa7
                  addi         s1, a2, 1256
                  xor          a0, s0, s11
                  fcvt.w.s     s9, ft9
                  fmul.s       fs8, fa2, ft4, rmm
                  sltu         ra, s0, s8
                  sltu         t4, t4, s10
                  fmax.s       ft8, fs11, fa7
                  sll          zero, zero, t1
                  xor          s0, s11, s8
                  add          sp, s11, a0
                  fmv.x.w      s11, fs0
                  fcvt.w.s     t5, ft7
                  srai         t4, s10, 28
                  fmin.s       ft3, ft7, ft0
                  sll          t4, a0, s1
                  fmul.s       fs7, fs0, ft5, rmm
                  ori          s11, s7, 1533
                  addi         sp, a0, -1709
                  fdiv.s       fs6, fs6, fs1, rmm
                  fdiv.s       fs11, ft2, fs4, rup
                  fsgnj.s      ft8, ft11, fs5
                  xori         tp, a7, 1670
                  xor          s2, s5, s7
                  fmul.s       fs4, ft4, fs3, rne
                  mulhsu       t2, t0, a5
                  div          zero, a7, s10
                  fmv.x.w      t5, fa7
                  fcvt.s.wu    fs10, ra, rup
                  fmv.w.x      ft8, s9
                  or           t2, t1, zero
                  remu         zero, s1, a6
                  fsgnjn.s     ft10, fa3, fs4
                  fsgnjx.s     ft2, fs5, ft6
                  srli         t6, s10, 14
                  auipc        s1, 318318
                  feq.s        s9, ft7, fs8
                  feq.s        a3, ft7, ft0
                  srli         t0, gp, 16
                  mulh         t6, a5, t6
                  sltiu        s6, t1, -788
                  fdiv.s       fs0, ft7, fs1
                  srl          t0, s8, s6
                  remu         a1, s2, s0
                  remu         gp, a6, s8
                  srai         s5, zero, 12
                  nop
                  mulh         s10, s4, t0
                  sltu         ra, t2, t0
                  and          s4, s1, a6
                  fsub.s       ft1, fs2, ft4
                  mulhsu       s3, a0, a0
                  addi         s11, a4, 1865
                  divu         s5, t1, t0
                  slt          a7, zero, s8
                  nop
                  xori         s0, t4, -1468
                  or           s3, s0, t6
                  sltiu        s9, s8, 1119
                  addi         sp, a7, -1312
                  mulhsu       tp, a5, s10
                  mulh         t2, s4, s8
                  or           s7, tp, s2
                  rem          t2, t0, s9
                  fsqrt.s      fs9, fa6
                  srai         t0, a6, 28
                  fmv.x.w      zero, fa1
                  fsgnjn.s     fa3, ft5, fs4
                  fdiv.s       fa5, fs11, fs0, rne
                  fdiv.s       ft0, fa7, ft2
                  remu         a7, t0, t5
                  fsgnjx.s     fs1, fs2, fs4
                  sub          s9, a0, a5
                  fclass.s     s3, fa4
                  fmv.x.w      s0, ft2
                  fmv.x.w      a5, fa1
                  addi         s11, sp, 831
                  fsgnj.s      ft11, ft9, fs3
                  fsgnj.s      fs6, fa3, fs9
                  remu         a6, t6, a1
                  mul          t2, t0, s8
                  and          a3, s6, t6
                  mulhsu       a5, t5, a0
                  srai         sp, s7, 1
                  slli         t2, t1, 16
                  and          s0, s7, t1
                  mulh         t4, a7, t6
                  andi         t2, s10, 104
                  fdiv.s       fs9, ft8, fs7, rup
                  fmul.s       fs3, fs2, ft9, rup
                  fadd.s       fa0, ft9, ft8
                  mulhsu       s10, s7, s6
                  fsgnjn.s     ft1, fs1, ft7
                  sub          a0, s9, sp
                  sra          s6, ra, t5
                  fcvt.w.s     t6, fa0
                  or           s4, s10, s1
                  add          s7, a1, a0
                  ori          t1, s5, 883
                  mul          t2, t1, a4
                  addi         s11, s4, 842
                  andi         ra, t4, -1552
                  or           t1, s5, s10
                  add          t2, a1, zero
                  fcvt.w.s     a1, fa7
                  rem          s5, t3, zero
                  sltu         s1, a3, s4
                  mulh         tp, s7, gp
                  xori         a7, s6, -974
                  rem          ra, s1, s11
                  fclass.s     a1, ft9
                  or           a5, s4, tp
                  fsqrt.s      fs9, ft2, rne
                  auipc        s2, 462096
                  sltiu        s3, t3, -817
                  mulh         t5, s2, t4
                  fdiv.s       fs6, fs11, fs8
                  sltiu        a7, a0, 1301
                  fsub.s       ft6, fa4, ft6, rdn
                  ori          s10, a0, -535
                  fmax.s       ft11, ft3, ft5
                  fadd.s       ft10, fa4, fa6
                  mul          s4, t5, t2
                  fclass.s     gp, fs1
                  sub          t2, s3, a4
                  fmv.x.w      s10, ft1
                  fsgnjn.s     fs7, fa5, ft1
                  xori         s1, t6, -1086
                  srli         s10, s1, 25
                  andi         s6, s10, 632
                  sltiu        t2, s10, 1601
                  fsub.s       fa0, fa5, fs10
                  auipc        s0, 131197
                  sll          s11, ra, a7
                  fmv.x.w      a3, fs5
                  mulhu        a5, s8, s2
                  srli         t4, a7, 9
                  fsub.s       fa4, fs8, fs11, rup
                  auipc        s6, 667520
                  ori          t5, a6, 52
                  slt          t6, s6, a5
                  fmul.s       fa7, fs10, fs4, rmm
                  slt          s4, a5, t5
                  sra          tp, a1, s7
                  remu         s4, t3, ra
                  fmin.s       ft10, fa4, ft9
                  add          s2, ra, a6
                  sltiu        sp, s4, -938
                  srl          a1, t2, a1
                  lui          s6, 207977
                  srl          tp, t4, zero
                  fcvt.s.wu    fa2, s2, rdn
                  fcvt.s.wu    fs10, a6, rmm
                  fsgnjx.s     ft4, fa6, fs2
                  or           t4, a4, s5
                  auipc        s3, 30744
                  mulhsu       a3, t2, t5
                  div          s6, s9, s9
                  fmin.s       fa5, fs1, fs0
                  mul          a7, s2, t0
                  sub          gp, sp, ra
                  nop
                  or           gp, s10, sp
                  slt          s9, a2, t2
                  mulhsu       s0, a0, t0
                  divu         s6, a0, s7
                  sub          a0, sp, s11
                  slli         s0, sp, 14
                  lui          a0, 1007400
                  slt          t6, s4, ra
                  fdiv.s       ft2, fa6, fa5, rmm
                  fcvt.s.w     fa0, t6
                  fsgnj.s      fs0, fs4, fs11
                  or           s1, s4, a2
                  sra          sp, s4, s8
                  slt          a1, s4, tp
                  fmax.s       ft7, fa2, fs1
                  sll          s6, gp, t4
                  or           s4, s2, s2
                  slt          a1, t6, t5
                  auipc        s5, 494272
                  slt          a5, a2, a7
                  fsgnjn.s     ft3, ft11, ft1
                  srl          a6, a5, zero
                  srli         ra, a0, 18
                  auipc        t2, 548143
                  div          zero, s1, t1
                  mul          s1, s1, gp
                  divu         s1, a6, a1
                  srli         t2, s3, 23
                  mulhu        s3, s8, s11
                  fmul.s       fs1, fa5, fs0
                  mul          a1, a5, a2
                  sltiu        t0, a5, -1147
                  mulh         sp, t4, a4
                  fsgnjx.s     ft8, fs7, ft1
                  andi         sp, s4, 659
                  or           ra, s10, a1
                  slt          zero, a5, t2
                  xor          s7, t0, s6
                  remu         t6, s4, s8
                  fclass.s     s0, fs0
                  fsub.s       fs2, fs11, ft2, rup
                  xori         t4, a2, 512
                  srai         s3, tp, 10
                  fmin.s       ft9, ft1, fs1
                  fcvt.s.w     fa6, a6
                  feq.s        s8, fs6, ft7
                  slti         s11, a6, 1901
                  and          s4, s9, s2
                  mul          t2, t3, a1
                  mulh         s5, a1, t5
                  slli         t2, a6, 26
                  sltu         t6, a7, a4
                  slti         s4, zero, -803
                  feq.s        s4, fs5, ft4
                  fsgnjn.s     fs6, fs6, ft10
                  sub          s6, a0, s7
                  fclass.s     s1, fs9
                  mulh         tp, t5, t3
                  or           s4, a0, a4
                  fadd.s       fa0, fs6, fa3, rtz
                  lui          s10, 170397
                  fmax.s       fa6, fa0, ft9
                  rem          a3, a7, a5
                  fcvt.w.s     a7, fs2, rtz
                  sltiu        s11, s8, -1509
                  nop
                  mulhsu       t1, sp, s3
                  addi         sp, s0, 1979
                  fadd.s       fa6, fs5, fs10
                  fle.s        s9, fa4, ft10
                  fle.s        s2, ft4, ft7
                  andi         s11, s9, -1381
                  fcvt.w.s     s8, fs6, rup
                  nop
                  slti         s7, s4, -1348
                  fclass.s     sp, fs9
                  sll          s2, t0, a6
                  fsgnjx.s     fs2, fs10, ft9
                  flt.s        s10, ft2, fs5
                  fmul.s       fa6, ft6, fs4
                  fle.s        s5, fs4, fs7
                  fadd.s       fs0, fa6, ft5, rmm
                  fmul.s       fs0, fs10, fa2, rne
                  div          t4, tp, t4
                  mul          s1, s5, s9
                  fcvt.s.w     ft10, t0
                  fmv.w.x      fa2, s8
                  fsqrt.s      fs6, fs7, rtz
                  ori          t0, a5, 1981
                  fsgnjn.s     fa5, fa7, fs8
                  fsub.s       fa4, fs6, fs10
                  mulh         s8, s10, ra
                  lui          ra, 1030459
                  lui          s3, 1012396
                  auipc        s5, 681136
                  flt.s        s11, fs0, fa2
                  add          s7, s3, s1
                  fcvt.s.w     ft5, s9
                  mul          t2, s9, gp
                  fmin.s       fs8, ft3, ft3
                  rem          s3, a4, a7
                  srai         t0, a7, 12
                  fmax.s       fs4, fs6, fa1
                  addi         t4, a4, -948
                  add          tp, s5, s3
                  fmax.s       fa0, fa2, ft2
                  fmin.s       fs8, ft4, ft11
                  sra          t0, ra, sp
                  sub          t5, zero, t4
                  fmv.w.x      ft1, gp
                  flt.s        s3, fs11, fs10
                  fclass.s     ra, fa5
                  or           s10, s9, s0
                  srl          t1, t2, a1
                  fsqrt.s      fa7, fa1
                  srli         s4, zero, 22
                  srl          s3, sp, a3
                  fsub.s       ft5, fs3, ft0, rmm
                  remu         s1, s1, s10
                  mulh         s1, s9, a1
                  flt.s        s4, ft8, ft8
                  fsgnj.s      fs4, fa2, ft3
                  fcvt.s.w     fa3, s0, rtz
                  nop
                  fclass.s     zero, fa1
                  fadd.s       ft7, ft11, fs4, rup
                  sll          sp, ra, s6
                  mulhsu       a3, gp, s1
                  srli         s11, a5, 13
                  mul          s2, tp, s5
                  mulhu        s2, a4, a6
                  fmax.s       ft9, fa0, fs1
                  srai         s10, s5, 10
                  fclass.s     a1, ft10
                  fclass.s     t6, fs5
                  andi         a5, a5, -921
                  fsub.s       fs4, ft11, fs11, rup
                  auipc        a6, 778051
                  fcvt.wu.s    s4, fa3, rup
                  sub          s8, s4, t6
                  fsgnjx.s     ft11, ft0, ft8
                  flt.s        a3, fs11, fa7
                  ori          s10, a0, 822
                  xori         s6, s1, -76
                  fcvt.w.s     s9, fs1
                  srl          gp, t6, s4
                  slti         s6, s0, -1572
                  or           ra, zero, t5
                  fmv.w.x      fs10, a5
                  auipc        gp, 673150
                  fadd.s       fs6, fs7, fa2
                  fcvt.wu.s    s7, fs8
                  sltu         s4, a2, s7
                  fmv.x.w      t6, ft1
                  fcvt.s.w     ft2, s4, rup
                  fsub.s       fs8, ft2, fs5
                  div          a6, gp, ra
                  xori         a6, a0, -500
                  fcvt.s.wu    fs2, s7
                  and          s6, tp, s6
                  andi         t0, t0, -1762
                  fsgnj.s      ft6, fa2, fa4
                  nop
                  fcvt.w.s     s11, fs11
                  fmul.s       ft10, fs6, fs5
                  fcvt.w.s     t4, ft5
                  fmin.s       fa1, fs0, fa7
                  sltiu        zero, s4, -1604
                  srli         t0, t5, 18
                  slti         s1, s7, -1287
                  fcvt.wu.s    t6, fa3, rmm
                  feq.s        s5, fs8, ft11
                  srl          s5, t4, sp
                  or           t1, t5, s5
                  sra          t0, a5, ra
                  sra          s1, gp, a2
                  srai         ra, t3, 8
                  fdiv.s       ft3, fs4, fa5, rtz
                  sltiu        gp, a3, 1189
                  divu         s7, s3, t4
                  fsgnj.s      fs5, fs3, fs6
                  fclass.s     a6, fs5
                  sub          s4, s10, s6
                  mulhu        s9, s0, a7
                  slli         t5, s2, 25
                  feq.s        s7, fa3, fs2
                  sub          s4, a7, zero
                  fsqrt.s      fs2, ft2
                  fmv.w.x      ft5, gp
                  remu         a0, s3, t5
                  sub          a5, s6, s10
                  sra          s8, t6, s6
                  srli         s7, a0, 11
                  srl          s1, a7, s7
                  div          sp, a6, s8
                  fcvt.s.wu    fs2, s5, rtz
                  fmax.s       fa1, ft9, ft0
                  fclass.s     t2, fa5
                  sltu         t6, a0, s10
                  fmv.w.x      fs8, s6
                  divu         a3, s6, a0
                  mulhsu       zero, a0, s3
                  slti         s7, s5, 723
                  mulhsu       a1, t3, t0
                  fsgnjn.s     fa6, fa5, ft10
                  sra          sp, t0, s0
                  addi         s8, a3, -144
                  fadd.s       fs0, fs8, fs0, rtz
                  slli         s1, s7, 5
                  slti         tp, s1, -491
                  xor          s1, sp, zero
                  rem          a0, t5, t1
                  fsgnjn.s     fs6, ft3, fa6
                  andi         s1, zero, -1855
                  fcvt.w.s     a6, ft11, rup
                  flt.s        ra, fa7, ft5
                  fcvt.wu.s    a7, ft8
                  fmul.s       fs1, fs7, fs5, rup
                  feq.s        s6, fs4, fs3
                  and          s0, sp, t2
                  feq.s        a1, fs0, fa3
                  fmv.x.w      t0, ft1
                  div          tp, s7, ra
                  or           s10, t3, a5
                  fmv.w.x      fa1, a2
                  fmv.x.w      t0, fs6
                  mulhsu       a7, t0, s7
                  mul          s11, s9, a3
                  slt          sp, s8, s10
                  flt.s        s5, fs4, fa0
                  fmax.s       fa3, fa6, ft8
                  srl          s5, zero, a2
                  fsgnjn.s     fa5, fs2, fs9
                  fcvt.s.w     fa5, a6
                  sltiu        s7, t0, -1183
                  fmin.s       fa0, fs0, fs10
                  fcvt.s.w     fs2, a2, rup
                  mulhsu       s9, s2, t1
                  andi         t0, a7, 1394
                  mulhu        s4, ra, t5
                  fsgnjx.s     fs9, fs9, ft1
                  add          t5, t3, s8
                  andi         t0, a7, 972
                  sltu         t1, ra, t2
                  fmax.s       fs2, ft10, fs4
                  fmul.s       ft4, ft4, fs5
                  rem          s8, t6, a3
                  divu         t0, s4, a7
                  fsub.s       ft7, ft6, fs10, rtz
                  or           s11, s8, t2
                  fcvt.w.s     s5, fa6
                  sltiu        s1, sp, -1192
                  ori          tp, s6, 714
                  and          s4, t0, t0
                  fmv.w.x      fa5, ra
                  remu         s6, tp, t6
                  fsub.s       ft7, ft7, fa3
                  sra          s9, s3, zero
                  fsgnj.s      ft0, fa2, fs4
                  fsgnjx.s     fa4, ft9, ft5
                  mul          s6, s8, t3
                  add          s6, t3, t5
                  fdiv.s       fs5, fs4, fa1, rmm
                  nop
                  fmax.s       ft6, fs2, fs9
                  fmin.s       fs0, fs6, fa0
                  xori         t0, s3, 144
                  remu         s9, gp, sp
                  fmv.x.w      s11, fs9
                  fsgnj.s      fa7, fs8, fs5
                  sra          a5, t4, a2
                  mul          s7, a0, s11
                  srai         t5, gp, 6
                  xor          s5, s9, sp
                  fsqrt.s      ft6, ft8, rup
                  fmax.s       ft0, ft9, fs0
                  xor          s8, a6, a6
                  mulhsu       s7, a5, s11
                  xor          s2, s0, tp
                  fmv.w.x      ft11, t2
                  mulhu        t5, s7, a5
                  fclass.s     s8, fs0
                  mulhsu       s3, zero, s1
                  fsgnjn.s     fa3, fs9, ft5
                  auipc        t1, 948410
                  sub          a3, t4, s3
                  fsgnjn.s     ft6, fa2, fa5
                  auipc        ra, 115483
                  fcvt.w.s     s6, ft11
                  fmv.x.w      ra, fs11
                  nop
                  divu         s0, a6, t5
                  remu         zero, t3, t3
                  nop
                  fle.s        a3, fa6, fa6
                  div          s7, t4, a2
                  andi         a7, s0, 1609
                  fle.s        t5, fs8, fa6
                  fsgnj.s      ft11, fa6, ft7
                  mul          a7, t0, a0
                  sltiu        a3, a5, 1835
                  fsqrt.s      fs9, fa7
                  mulhsu       t6, s10, t0
                  slt          t5, a2, a7
                  mulhsu       s0, a6, t6
                  fcvt.wu.s    a0, fa4, rdn
                  lui          gp, 873624
                  fcvt.w.s     s5, fs10
                  lui          a6, 387989
                  fcvt.w.s     t5, fs1
                  fadd.s       fs5, fs1, fs6
                  rem          t5, s2, s5
                  fclass.s     s0, fs9
                  div          s8, s0, s7
                  srl          a7, t3, s1
                  andi         s2, s3, -1999
                  xori         s5, t6, -163
                  fmv.w.x      fa5, a2
                  fmax.s       ft11, fs5, ft2
                  srai         s2, a3, 26
                  slli         a0, s3, 28
                  add          s8, tp, s11
                  andi         s9, s1, -688
                  nop
                  div          t6, a6, s9
                  sub          s10, s1, t3
                  srai         s3, s7, 31
                  feq.s        s3, ft10, ft4
                  sll          s7, s7, zero
                  mulhu        s5, s5, s9
                  ori          tp, s9, 687
                  sll          s11, a4, s5
                  fle.s        s9, ft10, fa1
                  mulhsu       t2, s3, s4
                  fcvt.wu.s    s6, ft8, rdn
                  auipc        s2, 653206
                  srli         s11, zero, 30
                  fle.s        s3, ft1, fa0
                  feq.s        s5, fs2, fs5
                  slli         t4, s6, 2
                  fsgnjx.s     ft1, ft5, fs3
                  ori          t6, s3, -1772
                  rem          a1, zero, s11
                  sll          gp, s0, a1
                  mulhu        zero, a0, a3
                  divu         s5, s7, s8
                  fmv.w.x      fa7, t1
                  fcvt.w.s     s1, fs4
                  fsqrt.s      fa5, fa4
                  sltiu        sp, t2, -1054
                  slt          s10, t0, s9
                  lui          t5, 617207
                  fclass.s     s3, ft7
                  and          t6, t1, gp
                  divu         a6, t1, s7
                  sra          a3, s4, t4
                  mulhsu       t2, t4, s4
                  div          t6, t1, gp
                  addi         a3, a1, -19
                  mulhu        a3, s3, s7
                  fsgnj.s      ft8, ft11, ft1
                  mul          zero, t3, s7
                  or           s11, a6, sp
                  lui          s8, 396641
                  addi         s3, s11, 1391
                  fsgnjn.s     fs9, fs6, fa0
                  sll          a0, a7, a7
                  ori          t1, tp, 699
                  fmin.s       fs9, ft3, fa1
                  nop
                  mulhu        t6, t1, s5
                  mulhu        sp, ra, gp
                  mulhsu       s9, s6, s11
                  fdiv.s       fs9, fs1, ft2
                  sra          s5, s6, a6
                  slti         gp, s8, 1272
                  fsqrt.s      fs10, fs4
                  fclass.s     a3, fs9
                  sltu         s8, t1, s7
                  sra          s5, t0, t1
                  or           s2, s10, s5
                  feq.s        a5, ft9, fs0
                  remu         s5, s11, gp
                  slt          s8, s0, zero
                  mulhu        a0, zero, ra
                  ori          a1, a5, -1383
                  fdiv.s       fs6, fa0, fs1
                  fsgnjn.s     fa4, fs10, ft10
                  fcvt.s.w     ft2, s2, rne
                  fle.s        t0, fa5, fs9
                  or           s1, a2, a2
                  slt          a1, a1, t5
                  mulhu        t2, t3, s10
                  mulhu        a5, t2, s11
                  sltiu        s7, zero, -737
                  add          a5, t5, a4
                  fclass.s     s5, ft5
                  fsgnjn.s     ft6, ft9, ft2
                  andi         a7, gp, 637
                  div          s8, t1, s1
                  nop
                  fcvt.s.wu    fs7, a6, rdn
                  mulh         t2, tp, a0
                  fmax.s       fs2, ft8, fa2
                  sll          s5, a7, a0
                  fclass.s     s8, fs0
                  fsgnj.s      ft5, fa2, fa2
                  andi         s9, s6, 488
                  fsub.s       fa5, ft5, ft6, rdn
                  sub          t1, a6, zero
                  fcvt.w.s     a6, fs6, rne
                  srl          s7, t2, a1
                  mulh         zero, t1, gp
                  fsgnj.s      fs6, fa5, fs11
                  fadd.s       fa6, ft0, ft1
                  fdiv.s       ft4, ft8, fa3, rup
                  fmin.s       ft7, ft0, fa7
                  slti         s4, s4, -547
                  xori         s3, s7, 1665
                  add          s6, s10, s5
                  srli         s10, sp, 1
                  mulh         ra, s9, s5
                  mul          s3, a6, s1
                  fsgnjn.s     ft9, ft1, fs4
                  auipc        s2, 434641
                  fdiv.s       fa4, fs4, fa0, rup
                  flt.s        s11, fs9, fa5
                  fsub.s       fs7, fs1, ft8, rtz
                  lui          s2, 500324
                  rem          s3, s2, s1
                  flt.s        a7, ft11, fa3
                  fadd.s       ft7, ft4, fs8, rne
                  fsqrt.s      fs4, fa7
                  andi         s10, ra, -753
                  fclass.s     s0, fa7
                  fclass.s     s7, ft6
                  addi         a3, s0, 235
                  fsgnjn.s     fs11, fs6, ft10
                  and          s1, zero, s4
                  mul          s2, t0, s10
                  addi         s2, s6, -1642
                  srl          t5, gp, s5
                  or           t5, a3, t6
                  fsgnjx.s     ft4, ft9, fs1
                  fcvt.s.wu    fa4, s0, rmm
                  lui          t6, 480214
                  xori         zero, t5, -1203
                  or           s6, tp, t4
                  srai         t0, sp, 25
                  sltu         s5, a2, a1
                  fdiv.s       ft9, fa4, ft2
                  sltu         zero, t3, s11
                  sltiu        t6, a1, -892
                  fsub.s       fs1, fa1, ft1, rup
                  fcvt.w.s     s4, ft8, rmm
                  slti         t5, s9, -1866
                  sra          a7, ra, a3
                  fsgnj.s      ft3, fa2, fa7
                  div          s0, sp, s2
                  fmin.s       fs7, fa0, fs9
                  fle.s        gp, ft0, fs0
                  sub          a6, gp, s6
                  fmul.s       ft2, fs7, fs2, rmm
                  mulhsu       sp, a1, s11
                  fcvt.w.s     a3, ft3, rmm
                  remu         t5, tp, s9
                  srli         s5, s3, 29
                  xor          s10, gp, a2
                  mul          a0, a5, gp
                  flt.s        a5, fs10, fa2
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
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_2:
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_3:
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_4:
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_5:
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_6:
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_7:
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_8:
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_9:
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_10:
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_11:
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_12:
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_13:
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_14:
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_15:
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
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
                  addi x14, x14, -4
                  sw  x12, (x14)
                  add x12, x14, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x14, x12, zero
                  csrr x6, 0x341 # MEPC
                  csrr x6, 0x342 # MCAUSE
                  li x30, 0x3 # BREAKPOINT
                  beq x6, x30, ebreak_handler
                  li x30, 0x8 # ECALL_UMODE
                  beq x6, x30, ecall_handler
                  li x30, 0x9 # ECALL_SMODE
                  beq x6, x30, ecall_handler
                  li x30, 0xb # ECALL_MMODE
                  beq x6, x30, ecall_handler
                  li x30, 0x1
                  beq x6, x30, instr_fault_handler
                  li x30, 0x5
                  beq x6, x30, load_fault_handler
                  li x30, 0x7
                  beq x6, x30, store_fault_handler
                  li x30, 0xc
                  beq x6, x30, pt_fault_handler
                  li x30, 0xd
                  beq x6, x30, pt_fault_handler
                  li x30, 0xf
                  beq x6, x30, pt_fault_handler
                  li x30, 0x2 # ILLEGAL_INSTRUCTION
                  beq x6, x30, illegal_instr_handler
                  csrr x30, 0x343 # MTVAL
                  1: la x28, test_done
                  jalr x1, x28, 0

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
                  la x28, write_tohost
                  jalr x0, x28, 0

instr_fault_handler:
                  add x12, x14, zero
                  lw  x1, 4(x12)
                  lw  x2, 8(x12)
                  lw  x3, 12(x12)
                  lw  x4, 16(x12)
                  lw  x5, 20(x12)
                  lw  x6, 24(x12)
                  lw  x7, 28(x12)
                  lw  x8, 32(x12)
                  lw  x9, 36(x12)
                  lw  x10, 40(x12)
                  lw  x11, 44(x12)
                  lw  x12, 48(x12)
                  lw  x13, 52(x12)
                  lw  x14, 56(x12)
                  lw  x15, 60(x12)
                  lw  x16, 64(x12)
                  lw  x17, 68(x12)
                  lw  x18, 72(x12)
                  lw  x19, 76(x12)
                  lw  x20, 80(x12)
                  lw  x21, 84(x12)
                  lw  x22, 88(x12)
                  lw  x23, 92(x12)
                  lw  x24, 96(x12)
                  lw  x25, 100(x12)
                  lw  x26, 104(x12)
                  lw  x27, 108(x12)
                  lw  x28, 112(x12)
                  lw  x29, 116(x12)
                  lw  x30, 120(x12)
                  lw  x31, 124(x12)
                  addi x12, x12, 128
                  add x14, x12, zero
                  lw  x12, (x14)
                  addi x14, x14, 4
                  mret

load_fault_handler:
                  add x12, x14, zero
                  lw  x1, 4(x12)
                  lw  x2, 8(x12)
                  lw  x3, 12(x12)
                  lw  x4, 16(x12)
                  lw  x5, 20(x12)
                  lw  x6, 24(x12)
                  lw  x7, 28(x12)
                  lw  x8, 32(x12)
                  lw  x9, 36(x12)
                  lw  x10, 40(x12)
                  lw  x11, 44(x12)
                  lw  x12, 48(x12)
                  lw  x13, 52(x12)
                  lw  x14, 56(x12)
                  lw  x15, 60(x12)
                  lw  x16, 64(x12)
                  lw  x17, 68(x12)
                  lw  x18, 72(x12)
                  lw  x19, 76(x12)
                  lw  x20, 80(x12)
                  lw  x21, 84(x12)
                  lw  x22, 88(x12)
                  lw  x23, 92(x12)
                  lw  x24, 96(x12)
                  lw  x25, 100(x12)
                  lw  x26, 104(x12)
                  lw  x27, 108(x12)
                  lw  x28, 112(x12)
                  lw  x29, 116(x12)
                  lw  x30, 120(x12)
                  lw  x31, 124(x12)
                  addi x12, x12, 128
                  add x14, x12, zero
                  lw  x12, (x14)
                  addi x14, x14, 4
                  mret

store_fault_handler:
                  add x12, x14, zero
                  lw  x1, 4(x12)
                  lw  x2, 8(x12)
                  lw  x3, 12(x12)
                  lw  x4, 16(x12)
                  lw  x5, 20(x12)
                  lw  x6, 24(x12)
                  lw  x7, 28(x12)
                  lw  x8, 32(x12)
                  lw  x9, 36(x12)
                  lw  x10, 40(x12)
                  lw  x11, 44(x12)
                  lw  x12, 48(x12)
                  lw  x13, 52(x12)
                  lw  x14, 56(x12)
                  lw  x15, 60(x12)
                  lw  x16, 64(x12)
                  lw  x17, 68(x12)
                  lw  x18, 72(x12)
                  lw  x19, 76(x12)
                  lw  x20, 80(x12)
                  lw  x21, 84(x12)
                  lw  x22, 88(x12)
                  lw  x23, 92(x12)
                  lw  x24, 96(x12)
                  lw  x25, 100(x12)
                  lw  x26, 104(x12)
                  lw  x27, 108(x12)
                  lw  x28, 112(x12)
                  lw  x29, 116(x12)
                  lw  x30, 120(x12)
                  lw  x31, 124(x12)
                  addi x12, x12, 128
                  add x14, x12, zero
                  lw  x12, (x14)
                  addi x14, x14, 4
                  mret

ebreak_handler:   
                  csrr  x6, 0x341
                  addi  x6, x6, 4
                  csrw  0x341, x6
                  add x12, x14, zero
                  lw  x1, 4(x12)
                  lw  x2, 8(x12)
                  lw  x3, 12(x12)
                  lw  x4, 16(x12)
                  lw  x5, 20(x12)
                  lw  x6, 24(x12)
                  lw  x7, 28(x12)
                  lw  x8, 32(x12)
                  lw  x9, 36(x12)
                  lw  x10, 40(x12)
                  lw  x11, 44(x12)
                  lw  x12, 48(x12)
                  lw  x13, 52(x12)
                  lw  x14, 56(x12)
                  lw  x15, 60(x12)
                  lw  x16, 64(x12)
                  lw  x17, 68(x12)
                  lw  x18, 72(x12)
                  lw  x19, 76(x12)
                  lw  x20, 80(x12)
                  lw  x21, 84(x12)
                  lw  x22, 88(x12)
                  lw  x23, 92(x12)
                  lw  x24, 96(x12)
                  lw  x25, 100(x12)
                  lw  x26, 104(x12)
                  lw  x27, 108(x12)
                  lw  x28, 112(x12)
                  lw  x29, 116(x12)
                  lw  x30, 120(x12)
                  lw  x31, 124(x12)
                  addi x12, x12, 128
                  add x14, x12, zero
                  lw  x12, (x14)
                  addi x14, x14, 4
                  mret

illegal_instr_handler:
                  csrr  x6, 0x341
                  addi  x6, x6, 4
                  csrw  0x341, x6
                  add x12, x14, zero
                  lw  x1, 4(x12)
                  lw  x2, 8(x12)
                  lw  x3, 12(x12)
                  lw  x4, 16(x12)
                  lw  x5, 20(x12)
                  lw  x6, 24(x12)
                  lw  x7, 28(x12)
                  lw  x8, 32(x12)
                  lw  x9, 36(x12)
                  lw  x10, 40(x12)
                  lw  x11, 44(x12)
                  lw  x12, 48(x12)
                  lw  x13, 52(x12)
                  lw  x14, 56(x12)
                  lw  x15, 60(x12)
                  lw  x16, 64(x12)
                  lw  x17, 68(x12)
                  lw  x18, 72(x12)
                  lw  x19, 76(x12)
                  lw  x20, 80(x12)
                  lw  x21, 84(x12)
                  lw  x22, 88(x12)
                  lw  x23, 92(x12)
                  lw  x24, 96(x12)
                  lw  x25, 100(x12)
                  lw  x26, 104(x12)
                  lw  x27, 108(x12)
                  lw  x28, 112(x12)
                  lw  x29, 116(x12)
                  lw  x30, 120(x12)
                  lw  x31, 124(x12)
                  addi x12, x12, 128
                  add x14, x12, zero
                  lw  x12, (x14)
                  addi x14, x14, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x6, 0x300 # MSTATUS;
                  csrr  x6, 0x304 # MIE;
                  csrr  x6, 0x344 # MIP;
                  csrrc x6, 0x344, x6 # MIP;
                  add x12, x14, zero
                  lw  x1, 4(x12)
                  lw  x2, 8(x12)
                  lw  x3, 12(x12)
                  lw  x4, 16(x12)
                  lw  x5, 20(x12)
                  lw  x6, 24(x12)
                  lw  x7, 28(x12)
                  lw  x8, 32(x12)
                  lw  x9, 36(x12)
                  lw  x10, 40(x12)
                  lw  x11, 44(x12)
                  lw  x12, 48(x12)
                  lw  x13, 52(x12)
                  lw  x14, 56(x12)
                  lw  x15, 60(x12)
                  lw  x16, 64(x12)
                  lw  x17, 68(x12)
                  lw  x18, 72(x12)
                  lw  x19, 76(x12)
                  lw  x20, 80(x12)
                  lw  x21, 84(x12)
                  lw  x22, 88(x12)
                  lw  x23, 92(x12)
                  lw  x24, 96(x12)
                  lw  x25, 100(x12)
                  lw  x26, 104(x12)
                  lw  x27, 108(x12)
                  lw  x28, 112(x12)
                  lw  x29, 116(x12)
                  lw  x30, 120(x12)
                  lw  x31, 124(x12)
                  addi x12, x12, 128
                  add x14, x12, zero
                  lw  x12, (x14)
                  addi x14, x14, 4
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
