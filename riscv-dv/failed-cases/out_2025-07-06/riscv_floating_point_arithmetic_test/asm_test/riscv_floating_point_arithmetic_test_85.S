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
                  li x24, 0x40001120
                  csrw 0x301, x24
kernel_sp:        
                  la x6, kernel_stack_end

trap_vec_init:    
                  la x24, mtvec_handler
                  ori x24, x24, 1
                  csrw 0x305, x24 # MTVEC

mepc_setup:       
                  la x24, init
                  csrw 0x341, x24

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x24, 0x3800
                  csrw 0x300, x24 # MSTATUS
                  li x24, 0x0
                  csrw 0x304, x24 # MIE
                  mret
init:             
                  li x24, 1456007619
                  fmv.w.x f0, x24
                  li x24, 2139095040
                  fmv.w.x f1, x24
                  li x24, 2149666679
                  fmv.w.x f2, x24
                  li x24, 2139095040
                  fmv.w.x f3, x24
                  li x24, 2139095041
                  fmv.w.x f4, x24
                  li x24, 2152240156
                  fmv.w.x f5, x24
                  li x24, 2143289344
                  fmv.w.x f6, x24
                  li x24, 2139095039
                  fmv.w.x f7, x24
                  li x24, 2139095040
                  fmv.w.x f8, x24
                  li x24, 2139095040
                  fmv.w.x f9, x24
                  li x24, 0
                  fmv.w.x f10, x24
                  li x24, 4286578687
                  fmv.w.x f11, x24
                  li x24, 2108658549
                  fmv.w.x f12, x24
                  li x24, 2143289344
                  fmv.w.x f13, x24
                  li x24, 2143289344
                  fmv.w.x f14, x24
                  li x24, 906525587
                  fmv.w.x f15, x24
                  li x24, 2139095039
                  fmv.w.x f16, x24
                  li x24, 2139095040
                  fmv.w.x f17, x24
                  li x24, 6684695
                  fmv.w.x f18, x24
                  li x24, 4286578688
                  fmv.w.x f19, x24
                  li x24, 2152408122
                  fmv.w.x f20, x24
                  li x24, 2139095040
                  fmv.w.x f21, x24
                  li x24, 2143289344
                  fmv.w.x f22, x24
                  li x24, 4286578687
                  fmv.w.x f23, x24
                  li x24, 2143289344
                  fmv.w.x f24, x24
                  li x24, 2143289344
                  fmv.w.x f25, x24
                  li x24, 2143289344
                  fmv.w.x f26, x24
                  li x24, 2139095041
                  fmv.w.x f27, x24
                  li x24, 1018860270
                  fmv.w.x f28, x24
                  li x24, 2147483648
                  fmv.w.x f29, x24
                  li x24, 4286578688
                  fmv.w.x f30, x24
                  li x24, 2143289344
                  fmv.w.x f31, x24
                  fsrmi 4
                  li x0, 0xd
                  li x1, 0x80000000
                  li x2, 0x9c144f70
                  li x3, 0xec093b4a
                  li x4, 0xf179e2ea
                  li x5, 0x7eb424d5
                  li x7, 0x7
                  li x8, 0x0
                  li x9, 0xd
                  li x10, 0x0
                  li x11, 0x80000000
                  li x12, 0x4
                  li x13, 0x671672e
                  li x14, 0x80000000
                  li x15, 0x0
                  li x16, 0x5
                  li x17, 0x80000000
                  li x19, 0x0
                  li x20, 0xf21017ad
                  li x21, 0x9
                  li x22, 0xb557b05d
                  li x23, 0x7
                  li x24, 0x0
                  li x25, 0x0
                  li x26, 0x4
                  li x27, 0xc6b146be
                  li x28, 0xace10748
                  li x29, 0xe
                  li x30, 0xec5313c0
                  li x31, 0xfb7c9a9f
                  la x18, user_stack_end
main:             fmin.s       ft10, fs1, ft3
                  remu         s10, s8, t4
                  fsgnj.s      fs3, fs10, fa7
                  flt.s        a1, fa6, ft5
                  fcvt.s.w     fs2, a6, rup
                  mulhsu       ra, t2, s5
                  slli         a1, s10, 25
                  div          a0, gp, s0
                  div          s5, s5, s6
                  andi         zero, s2, -1638
                  slti         s0, s8, -1512
                  sra          tp, t5, s9
                  fdiv.s       fa5, fa4, ft1, rdn
                  add          tp, s6, a2
                  srli         t3, a6, 12
                  divu         a0, t0, tp
                  add          t2, s8, a2
                  addi         a4, t1, 1195
                  srl          t6, t3, s3
                  fmin.s       ft4, fs7, fa2
                  srai         t0, a5, 28
                  sltu         t0, t1, s7
                  sltiu        a0, a1, -562
                  add          a5, a0, a2
                  divu         s4, t5, t2
                  fmax.s       fa6, fs5, fa5
                  rem          t2, gp, a6
                  fsub.s       fs11, ft8, fs0
                  slli         s10, sp, 15
                  fmv.x.w      tp, fs0
                  fsgnjx.s     fa5, ft11, fs8
                  fcvt.w.s     s9, fa1, rdn
                  fclass.s     t3, ft8
                  fadd.s       ft1, fs5, fa3, rdn
                  add          s4, t0, t4
                  fdiv.s       fa2, fs9, ft11
                  div          ra, t1, a7
                  andi         t0, tp, -94
                  fadd.s       fa0, fs8, ft0, rup
                  rem          zero, s1, a1
                  fcvt.s.w     fs0, s2, rdn
                  fle.s        a1, fs4, ft10
                  xori         s7, t1, 1282
                  divu         s4, a1, t6
                  fcvt.w.s     s10, ft3
                  fmv.x.w      s6, fs11
                  fmv.w.x      fa3, a4
                  lui          s7, 203880
                  mulhu        a1, tp, a6
                  fmv.x.w      a6, fs3
                  div          t2, t5, zero
                  fdiv.s       ft8, fa6, fs8
                  fcvt.w.s     s3, ft9, rne
                  flt.s        a7, fa6, fa4
                  fclass.s     a0, fa6
                  fcvt.s.w     ft9, s0, rup
                  sltiu        a7, t0, 259
                  andi         a5, tp, 623
                  auipc        s9, 343776
                  nop
                  sltu         zero, a1, gp
                  srai         a6, s11, 22
                  sltu         a2, t3, ra
                  fsqrt.s      ft3, fa3, rdn
                  nop
                  fcvt.s.w     fa4, t0, rne
                  fcvt.wu.s    s6, ft1, rtz
                  srl          s4, s2, s11
                  sltiu        s11, t3, -1513
                  add          s10, a7, t1
                  add          s5, s1, s0
                  fsub.s       fa4, fa7, fs4
                  div          s0, tp, s8
                  fle.s        s9, fa4, fs10
                  andi         zero, a2, 1256
                  fle.s        t2, fs9, ft2
                  auipc        ra, 1012801
                  fadd.s       fa2, fs9, fa2, rne
                  and          a7, s7, ra
                  fcvt.s.wu    fa4, a7, rtz
                  srli         t3, t3, 14
                  fmax.s       fs11, fs4, fa0
                  fclass.s     s5, fs1
                  slti         s8, a0, 1891
                  fmin.s       fa6, ft1, fs2
                  fsqrt.s      ft8, ft7, rdn
                  fdiv.s       ft7, fs0, fs0, rmm
                  sub          sp, t6, s8
                  fcvt.s.wu    fs2, s8
                  fclass.s     s0, fs3
                  fmin.s       fs11, fs6, fs5
                  fclass.s     tp, ft6
                  fcvt.s.w     fs4, s9
                  fcvt.wu.s    s4, fs2
                  sub          s5, t4, gp
                  fadd.s       ft11, fa5, ft11, rtz
                  fcvt.w.s     s7, fs8, rne
                  lui          s6, 805245
                  ori          t3, sp, 1216
                  fsgnjx.s     ft8, ft9, fs8
                  sra          a1, s8, s9
                  fsgnjn.s     ft4, fa4, ft9
                  fcvt.w.s     t4, fs1
                  fcvt.s.w     ft9, gp
                  fcvt.w.s     s5, ft2
                  or           t0, s6, a2
                  rem          s8, s9, a0
                  fcvt.w.s     a0, fs11
                  auipc        t3, 146055
                  rem          a1, s11, a4
                  fsub.s       ft5, ft0, fs1, rdn
                  fmax.s       ft7, fa4, fa6
                  add          a5, s11, a1
                  ori          t0, a1, 903
                  xor          s1, s4, s3
                  addi         t4, ra, -708
                  fle.s        tp, fs0, ft2
                  auipc        s3, 892617
                  fle.s        sp, fa6, ft10
                  xori         ra, a5, 518
                  fmul.s       fa3, fs5, fs11, rtz
                  mul          t3, t3, s5
                  feq.s        a7, ft10, fa4
                  sltiu        s6, t4, 442
                  fsqrt.s      ft6, fs5, rmm
                  srl          s1, a2, s11
                  div          zero, s7, a2
                  fsgnjx.s     ft11, ft2, fs2
                  fmin.s       fs3, fs9, fs7
                  fcvt.w.s     s11, fs8, rmm
                  xori         a2, t3, -451
                  slli         s5, gp, 19
                  sltiu        a5, a7, 818
                  mulh         s7, s11, a7
                  mulh         a4, tp, t1
                  fsub.s       fa4, fs3, ft6, rtz
                  add          ra, t1, t3
                  sltiu        s11, a1, -1202
                  fmv.w.x      ft2, gp
                  divu         a2, s11, tp
                  divu         s8, a4, a1
                  fsgnj.s      fs5, fa5, ft10
                  addi         s1, a4, 356
                  slt          a3, t3, t0
                  mulhu        s3, t4, a1
                  divu         a5, a6, a0
                  fmul.s       ft4, ft8, fs1
                  sub          s0, t3, t5
                  auipc        s1, 583980
                  fclass.s     t6, ft8
                  fmv.w.x      ft5, a1
                  divu         a3, sp, a5
                  mulh         s10, s7, t1
                  sltiu        t3, s9, 1360
                  srai         a3, ra, 9
                  lui          a1, 707020
                  lui          ra, 349622
                  slti         s6, t6, -1247
                  add          s10, t2, s2
                  fsqrt.s      fs6, fa4, rtz
                  fdiv.s       fa2, ft11, fa5
                  xori         tp, s4, 809
                  fcvt.wu.s    t4, ft9, rup
                  remu         s4, a5, s6
                  fsub.s       fs4, fs11, fs6, rup
                  sltu         s7, s1, s4
                  add          a7, gp, a4
                  slt          a5, t2, t1
                  fsgnjx.s     fs0, ft9, fs2
                  fsqrt.s      ft1, ft6, rtz
                  mul          a4, ra, s10
                  remu         t4, a6, s3
                  rem          t0, a2, a4
                  xor          t2, t0, tp
                  mul          s8, ra, a6
                  sra          s5, s6, a5
                  and          ra, s10, s3
                  fcvt.s.w     ft7, s0
                  divu         gp, a7, a4
                  xori         a0, t2, 894
                  auipc        t6, 763185
                  or           t3, a0, t0
                  fdiv.s       fa2, ft0, fs11
                  mulhsu       gp, s6, s10
                  fdiv.s       ft0, ft1, fs0, rmm
                  add          s10, s1, s0
                  fmul.s       fs10, fa6, fs11, rmm
                  feq.s        a3, ft4, ft7
                  rem          s8, s2, t3
                  flt.s        t3, fa7, fa0
                  addi         s0, a2, -1484
                  fdiv.s       fs0, ft0, fa5, rtz
                  or           a7, t1, a5
                  divu         s9, a7, t2
                  fsub.s       fs5, ft4, ft6
                  and          s0, s4, s2
                  fdiv.s       fa2, fs7, fs11
                  fsgnjn.s     fa2, ft11, fa0
                  fmul.s       ft0, fs8, ft9
                  remu         tp, t3, a4
                  fsgnjn.s     fa4, ft5, fs8
                  fclass.s     zero, ft3
                  sltu         s4, t6, s0
                  fsub.s       fa1, ft7, fs7, rdn
                  nop
                  sltu         t0, t3, s9
                  fmin.s       fa4, fs3, fa5
                  mulhu        zero, t1, s11
                  fmv.x.w      a4, ft0
                  fmax.s       fs8, fs1, fs11
                  fsgnjx.s     fs3, ft8, fa1
                  auipc        a2, 780906
                  mulhsu       s5, s10, t6
                  mulh         tp, s1, a2
                  fcvt.s.w     fs5, s7, rne
                  sub          a4, t6, t6
                  lui          s1, 389220
                  slt          s1, s6, a2
                  fsgnjx.s     fa3, ft9, ft6
                  fadd.s       fs7, ft0, ft5, rne
                  srli         s1, t0, 18
                  fsgnjx.s     fa7, ft11, fa0
                  and          s7, a6, s10
                  fsgnjx.s     fs1, fs3, fs1
                  feq.s        a4, fs4, fs1
                  add          a3, a4, tp
                  fcvt.wu.s    tp, ft2, rtz
                  remu         s3, t5, s10
                  or           tp, t1, s2
                  srai         s3, s7, 20
                  srli         s6, a2, 30
                  sll          s1, a3, a1
                  slt          s10, ra, a5
                  fcvt.s.w     ft3, a6, rne
                  fcvt.wu.s    s11, ft2
                  or           s4, s3, t6
                  xor          a0, s5, s3
                  remu         t3, s0, a7
                  mul          s4, s0, ra
                  xori         a4, t6, -1458
                  fmin.s       fa2, fs4, fs6
                  mul          s8, a2, t3
                  sltiu        s8, s8, 701
                  fmv.x.w      zero, ft7
                  mul          s3, sp, s4
                  xor          t6, s6, a5
                  srai         t0, s5, 6
                  auipc        a3, 782469
                  sltu         s7, s8, t0
                  slt          s8, t4, s8
                  div          ra, t5, s2
                  fmul.s       ft2, ft1, fs4
                  rem          s8, t6, t6
                  andi         gp, s8, 1059
                  fcvt.s.wu    fs5, a3, rmm
                  fsub.s       fs11, fa4, fs2
                  fdiv.s       fa4, fs2, ft11, rmm
                  or           gp, s7, a6
                  add          a7, s11, t6
                  fsgnj.s      ft9, ft10, ft8
                  div          ra, tp, s9
                  sub          s4, s10, t5
                  sll          s1, t1, a5
                  and          s8, a6, t6
                  fmv.w.x      fs5, t5
                  fsgnjn.s     fs3, ft2, fs10
                  fsgnj.s      ft10, fa2, fs1
                  xor          s5, s6, sp
                  mulhsu       s7, a4, a0
                  xori         s11, s11, 302
                  srli         ra, zero, 31
                  or           a4, t5, s11
                  fsub.s       fa2, ft1, ft2, rtz
                  divu         gp, gp, s2
                  srai         s1, a2, 8
                  mul          s7, sp, zero
                  flt.s        s7, fa6, fs1
                  auipc        a3, 192902
                  fcvt.w.s     t4, ft7
                  fmin.s       fa7, fa2, fs1
                  mulhsu       a5, sp, t2
                  mul          zero, s3, ra
                  addi         s1, a2, 448
                  sra          ra, s11, s11
                  xori         a5, s4, 1500
                  srai         tp, s7, 30
                  mulhsu       s7, s2, s9
                  mulhsu       a4, s9, t4
                  and          s3, s11, s0
                  lui          s10, 878359
                  fsqrt.s      ft11, fa5, rup
                  flt.s        a4, fa5, fa6
                  xori         a4, s4, -518
                  andi         a1, a2, -1465
                  fmv.x.w      s8, fa1
                  addi         a6, s7, -1855
                  fdiv.s       fa4, fa2, fa4, rtz
                  xor          sp, s2, sp
                  flt.s        s5, ft7, ft1
                  fclass.s     s11, fa0
                  or           tp, zero, a6
                  andi         a6, a0, 1360
                  srai         zero, tp, 10
                  addi         s8, t1, 465
                  divu         a1, s9, s7
                  andi         s10, t2, -1269
                  mulhu        s9, a5, s6
                  fsub.s       fa4, fs10, fa6, rup
                  mulhu        s7, s4, a3
                  fle.s        s10, ft10, ft3
                  xor          s5, s11, s0
                  nop
                  sltiu        s3, s7, 488
                  slli         s1, t6, 20
                  div          s10, s9, s9
                  srl          a5, t4, s1
                  sra          s10, s11, s6
                  fsub.s       fa1, fs7, fs11
                  lui          s5, 186324
                  sll          a4, s11, a0
                  mul          a5, s6, t1
                  slt          t6, s10, s7
                  fmv.x.w      a1, fs6
                  xori         t3, a3, 1625
                  remu         a3, t1, s4
                  fmax.s       fa4, ft6, ft4
                  slti         sp, t6, -396
                  fclass.s     gp, ft6
                  mul          s10, s5, sp
                  fcvt.s.w     fs5, s5, rdn
                  fcvt.w.s     s9, fa5
                  flt.s        ra, fs7, ft5
                  sra          sp, s8, a7
                  fcvt.s.wu    ft10, a7
                  srl          t6, t1, t0
                  fsqrt.s      fs10, ft5, rdn
                  fdiv.s       fa2, fs3, fs4
                  fcvt.s.wu    fa5, zero, rup
                  feq.s        s0, ft3, ft11
                  lui          a7, 1041240
                  fsgnj.s      fs5, fs4, fs6
                  mulhu        s10, t1, t3
                  addi         s4, a1, 245
                  rem          a0, s6, ra
                  slti         sp, t1, -10
                  sll          a1, s10, s3
                  fmax.s       fa5, fa1, fs4
                  fmv.x.w      sp, fa5
                  div          a3, s9, a1
                  nop
                  srl          sp, s2, t0
                  slt          s11, gp, a0
                  srli         s8, t4, 28
                  slt          s9, t6, s11
                  fadd.s       fa3, ft1, fa7
                  slli         a7, a1, 26
                  sra          a3, a7, t2
                  flt.s        sp, fs8, ft11
                  flt.s        a3, fs4, ft9
                  feq.s        s9, fs1, fs9
                  srli         a4, sp, 1
                  div          a0, t6, s4
                  fsub.s       fa4, fs7, fs6, rmm
                  sra          a6, s1, a1
                  fmv.w.x      ft1, s4
                  fsqrt.s      ft5, ft5
                  fle.s        a5, ft9, ft2
                  mulhsu       t3, s7, s9
                  fclass.s     t2, fs0
                  mulhu        a5, a7, a3
                  slti         a0, a0, -1456
                  fclass.s     s11, ft2
                  fle.s        a2, fa3, fs3
                  mulhu        a1, zero, t1
                  fmul.s       ft4, fa6, fs0, rne
                  rem          t3, a6, a2
                  sltiu        s5, s1, -1570
                  fcvt.w.s     s1, fa3, rmm
                  slli         a0, s9, 13
                  addi         tp, s1, -2044
                  sub          s3, a4, a0
                  or           t4, t1, t5
                  divu         zero, tp, s9
                  xori         s8, tp, -1586
                  mulhsu       a1, s9, s11
                  nop
                  srai         s0, a7, 8
                  lui          t0, 594008
                  auipc        a6, 601612
                  sltiu        t3, zero, 1870
                  sra          a1, a0, zero
                  xor          s6, s4, t2
                  srli         t0, t1, 22
                  feq.s        sp, fs7, ft8
                  fcvt.wu.s    a5, fa1, rdn
                  lui          s3, 597314
                  srli         ra, a2, 7
                  and          s10, sp, a0
                  mulh         t3, s5, t2
                  auipc        t6, 979557
                  fcvt.w.s     gp, ft3
                  mulhu        a7, s3, s6
                  mul          tp, a1, t3
                  sll          a3, s2, t5
                  andi         a1, a5, -1294
                  feq.s        a1, ft8, ft8
                  fcvt.w.s     a2, fa3, rup
                  feq.s        zero, fa2, fa4
                  nop
                  sltu         a3, a2, t1
                  flt.s        s5, ft6, fs11
                  fclass.s     zero, fa2
                  divu         t6, s11, ra
                  xor          t2, t0, s7
                  fmax.s       fs2, fs8, fa3
                  mulhsu       ra, s2, a1
                  sltiu        a6, a2, -657
                  sll          gp, s1, t1
                  fsub.s       fs11, ft11, fs10
                  sub          s6, a5, s8
                  fmv.x.w      s4, fa0
                  and          s0, s8, s11
                  xor          ra, a0, a4
                  sra          t3, t6, s0
                  fcvt.s.wu    fs2, s2, rup
                  fcvt.w.s     s9, ft8
                  fmv.w.x      ft9, a7
                  srli         t4, s5, 7
                  lui          s6, 809253
                  sltu         t2, ra, s3
                  sltiu        t6, t3, 452
                  fclass.s     s11, ft4
                  fle.s        s6, fs6, fa2
                  slt          tp, a1, ra
                  srai         s0, t0, 22
                  feq.s        tp, ft10, ft10
                  auipc        a3, 994762
                  and          a5, sp, t2
                  flt.s        a4, fs5, ft9
                  divu         s9, zero, s5
                  fsgnjn.s     fa4, ft6, fa1
                  mulhu        a4, s5, s6
                  fsqrt.s      ft2, fs7, rne
                  fcvt.wu.s    s8, ft9
                  fsgnjn.s     ft4, ft3, fs0
                  fclass.s     a0, fa2
                  fcvt.wu.s    t0, fs10, rmm
                  fmin.s       ft5, ft1, fs0
                  divu         sp, t2, s11
                  div          t6, a5, t5
                  add          s0, a2, zero
                  feq.s        ra, ft8, fs4
                  divu         s0, t2, a3
                  sltiu        s3, t4, 425
                  fle.s        s7, fa0, fs5
                  mulh         s10, s10, t6
                  fcvt.s.wu    fs1, s2, rup
                  xor          ra, s4, a6
                  divu         s1, a2, sp
                  sub          s1, zero, s7
                  sltiu        a7, s1, 1924
                  flt.s        t4, ft3, fs0
                  sll          t2, a7, a7
                  fdiv.s       fs0, fs11, ft0
                  fmin.s       fa7, fa4, ft6
                  auipc        a0, 534376
                  sltu         s7, s4, t4
                  rem          s0, s1, t1
                  xori         s3, s4, 1213
                  sltiu        s9, tp, 1161
                  sltu         t3, a6, s7
                  auipc        a4, 496172
                  ori          s4, t6, -1259
                  xori         a0, s8, 333
                  mul          a4, a3, a5
                  xor          t3, s4, t5
                  lui          t0, 200694
                  slti         s6, s11, 765
                  fmin.s       fs1, ft10, ft9
                  div          sp, t3, s9
                  fmin.s       fa3, fa0, fs8
                  mulhsu       zero, s9, s1
                  ori          t4, a7, -420
                  sltu         s9, s7, a5
                  and          a5, a6, a4
                  sra          s1, s11, t6
                  xor          a2, t2, gp
                  rem          s4, a0, ra
                  fmin.s       ft7, fs5, fs11
                  fcvt.s.wu    fs9, s2
                  div          s6, s3, gp
                  and          s6, t4, s9
                  and          zero, a6, s9
                  mulhu        a3, s0, s0
                  sltiu        zero, a4, -337
                  lui          s9, 616754
                  nop
                  fsgnj.s      fs6, ft11, ft10
                  fmv.w.x      ft4, t6
                  sltu         s0, t1, s8
                  fmul.s       ft7, ft3, fa5
                  fsgnj.s      ft4, fs6, fa5
                  fsgnjx.s     ft5, fa6, ft0
                  remu         s1, t6, a1
                  srl          a4, s3, t5
                  srl          s11, s8, s4
                  feq.s        s8, fs9, ft1
                  andi         gp, t5, 728
                  addi         t6, s2, 1269
                  sltiu        t6, t1, 1606
                  slti         s3, a1, -219
                  lui          t0, 805556
                  nop
                  fcvt.w.s     t3, ft9, rmm
                  flt.s        s0, ft6, fa1
                  fcvt.s.w     fa4, s9
                  mulhu        s9, t1, a2
                  fcvt.s.wu    fa4, s9
                  fle.s        t2, ft7, ft0
                  divu         t3, a4, s3
                  addi         s8, tp, 955
                  remu         s9, s7, s11
                  fmul.s       fs4, fs9, ft1, rne
                  auipc        t4, 915715
                  slli         s6, s6, 25
                  feq.s        s7, fa4, ft8
                  fcvt.s.w     fa1, t1, rtz
                  addi         t0, s1, -1433
                  ori          t4, s1, -783
                  ori          s0, s6, 1729
                  xori         a0, s0, -1951
                  fdiv.s       ft9, fs11, fs4
                  or           a3, s4, s6
                  fle.s        s9, ft7, ft0
                  remu         s1, s0, tp
                  ori          s6, t1, -484
                  fsqrt.s      fs7, fa1, rdn
                  fcvt.s.w     ft7, a1
                  auipc        s5, 456324
                  lui          tp, 473775
                  lui          a1, 48496
                  nop
                  slti         t4, tp, -1362
                  fclass.s     s11, ft2
                  nop
                  mulhsu       t6, s2, zero
                  or           s3, t2, a6
                  fsgnj.s      fs10, fs5, fs3
                  srai         t0, t0, 22
                  fsgnj.s      ft5, fs5, fa0
                  sltiu        t3, t5, -128
                  srli         ra, a6, 10
                  fcvt.w.s     a4, fs2, rmm
                  andi         s11, s1, 1428
                  fclass.s     s8, fa2
                  nop
                  xor          t2, a1, ra
                  srai         a5, tp, 16
                  fcvt.wu.s    a1, fa3
                  fsgnjn.s     fs11, fa3, fa7
                  mulh         a7, s11, a2
                  fsgnjx.s     ft9, fs9, ft3
                  fmul.s       fs1, ft0, ft3
                  fmax.s       ft11, fa4, ft3
                  addi         t3, t0, 906
                  fmax.s       fs9, fs3, fs0
                  fcvt.wu.s    t0, ft6
                  lui          s8, 226101
                  mulh         t4, a3, t3
                  fclass.s     tp, fs1
                  mul          t3, a2, t2
                  fmax.s       fa2, fs2, ft5
                  feq.s        a5, fs11, fs7
                  srl          s10, s3, t2
                  lui          s8, 807725
                  divu         s1, s8, a2
                  feq.s        a0, fs2, fs4
                  fsqrt.s      fs4, ft3, rdn
                  slli         tp, s1, 13
                  fsub.s       fa2, ft0, fa4
                  feq.s        s10, ft3, ft8
                  srli         s1, s9, 6
                  fclass.s     a4, fa3
                  mulh         s3, t2, t2
                  fmul.s       fs10, ft8, ft3
                  fsgnj.s      ft0, ft6, ft2
                  fcvt.wu.s    s1, fa2, rdn
                  fmv.w.x      fs4, s2
                  fclass.s     t3, ft6
                  auipc        a2, 120463
                  fmax.s       fs2, fa2, fs5
                  fadd.s       fs7, fs11, ft7, rdn
                  andi         s3, s7, -990
                  fle.s        s5, ft4, fs6
                  feq.s        s11, ft10, ft2
                  srai         s1, s9, 24
                  mul          a2, s8, zero
                  fmul.s       fa0, ft0, fs11, rdn
                  fadd.s       fa0, fs1, fs8, rup
                  flt.s        a5, ft1, fs2
                  or           t4, ra, s5
                  slti         s10, a6, 1973
                  fsgnjx.s     fs11, fs2, ft0
                  fcvt.w.s     a3, fa1, rtz
                  or           sp, s5, a0
                  srli         gp, s10, 9
                  fsgnjx.s     fa1, fs0, fs3
                  and          s6, s0, s0
                  mul          s10, s1, t1
                  lui          gp, 649384
                  srl          s4, s6, t4
                  fcvt.wu.s    s6, fa6, rtz
                  fsgnjn.s     fa1, ft8, fa4
                  fclass.s     t6, fa1
                  fsgnjn.s     ft7, ft9, fa7
                  xor          t6, t5, s4
                  xor          t4, t0, a4
                  srli         s4, s5, 16
                  or           tp, s3, s1
                  add          s11, s8, a0
                  fsub.s       fs0, ft1, fs8
                  add          a4, a6, sp
                  add          s10, tp, tp
                  addi         tp, s9, 866
                  mulhu        s6, a7, a4
                  slli         s11, s11, 11
                  sltu         a4, t3, t3
                  fsgnjx.s     fs5, ft7, fa2
                  addi         t2, s4, -70
                  ori          s0, a7, 1702
                  fclass.s     s8, ft10
                  srli         t3, s5, 20
                  lui          s8, 278100
                  fsub.s       fs10, fs2, ft5
                  fsub.s       fs8, ft4, fs1
                  fsub.s       ft5, fa1, fa7
                  fmul.s       fs5, fs8, ft1
                  lui          a3, 321364
                  auipc        a0, 1003213
                  xor          a5, s1, s2
                  or           s0, a0, s2
                  sll          a2, s0, tp
                  flt.s        a1, fa2, fs3
                  or           s4, s6, t2
                  fsgnjx.s     ft7, fs2, fa7
                  mul          s6, a1, s3
                  srl          s6, a3, t0
                  fcvt.w.s     a6, fs2, rtz
                  sltu         s1, a6, s7
                  srl          zero, s11, t4
                  slli         a5, a0, 22
                  rem          s11, t6, gp
                  fcvt.s.wu    ft0, a2, rdn
                  fmv.w.x      ft6, zero
                  srli         a3, tp, 17
                  andi         a4, t3, -1496
                  add          t4, a6, gp
                  mulhu        a7, s8, a6
                  fle.s        s0, fa1, ft7
                  rem          s3, s0, s7
                  mulhsu       gp, gp, t1
                  fsgnjn.s     fs0, fa2, fs1
                  srli         t6, a3, 20
                  fcvt.s.w     ft8, a5, rup
                  xori         s3, gp, 1415
                  srli         gp, a3, 19
                  fle.s        t3, ft4, fs8
                  sub          s3, t6, a7
                  fmin.s       ft5, fs7, fa0
                  remu         a4, a5, t5
                  fmul.s       ft9, fs8, fs2
                  fmax.s       fa6, ft4, fa6
                  feq.s        sp, ft3, fa7
                  mulhsu       zero, a6, t1
                  fcvt.wu.s    s8, ft11
                  mulhu        sp, a6, s0
                  nop
                  andi         tp, s10, -1094
                  addi         s11, s5, 1728
                  fcvt.s.w     fs8, ra
                  fmin.s       fs4, fa5, fa3
                  srai         a3, a0, 6
                  slt          a0, ra, s4
                  fsgnjn.s     ft6, ft9, ft9
                  fcvt.s.w     ft1, a7
                  nop
                  fsgnjx.s     fs9, fs8, ft2
                  fcvt.s.w     fa2, s0
                  mulh         a2, gp, s4
                  or           a5, s11, a0
                  fclass.s     a7, ft4
                  nop
                  feq.s        t0, fs9, ft6
                  divu         s0, a1, t1
                  xori         a2, s1, -1952
                  fsgnjn.s     ft5, fa7, ft8
                  slti         s6, t6, 1231
                  mul          a1, s2, t2
                  mul          gp, a0, s0
                  fdiv.s       ft1, fs6, ft0, rup
                  fcvt.s.wu    fs1, s2
                  fmin.s       ft0, ft6, ft10
                  fmv.x.w      a6, ft7
                  xor          a2, a4, t2
                  xori         s10, ra, 777
                  fmv.x.w      s6, ft8
                  div          s9, ra, sp
                  fclass.s     s1, fa4
                  auipc        ra, 325784
                  fclass.s     s8, ft9
                  srai         a3, t6, 6
                  fmax.s       fs4, fa4, ft9
                  slli         s1, sp, 2
                  slt          a6, t6, s0
                  fcvt.wu.s    a7, ft4
                  lui          s7, 748170
                  fsub.s       ft6, ft0, ft3, rne
                  sltiu        t0, t0, 1920
                  remu         s7, a6, gp
                  nop
                  add          s0, t2, zero
                  slt          zero, s11, a7
                  slti         a4, a7, -1848
                  srl          t6, t0, t5
                  andi         t3, s10, 1646
                  ori          s10, t3, 377
                  add          s1, s10, s0
                  slti         a0, t6, -2
                  sll          a4, sp, s11
                  rem          sp, a1, s5
                  sra          s7, t5, tp
                  srai         s5, t5, 27
                  sll          tp, a1, s11
                  lui          tp, 456418
                  sra          s11, s4, s11
                  fmin.s       fs6, fs6, fa6
                  sll          t4, s7, a0
                  fsub.s       fa5, ft8, fs5
                  srli         t3, s11, 27
                  slt          t6, t2, t2
                  fsgnj.s      fs10, fa2, ft0
                  andi         a3, s4, 163
                  slli         ra, s6, 4
                  slt          a7, s7, gp
                  fsgnjx.s     fa1, fs10, ft8
                  div          t4, s3, t0
                  rem          s9, a4, gp
                  addi         t3, s3, 749
                  fmax.s       ft0, ft1, fs1
                  fsgnj.s      fa2, fs6, ft2
                  nop
                  fclass.s     t4, ft2
                  fmv.w.x      ft4, s2
                  slti         t3, s4, 1362
                  andi         sp, t3, 1344
                  fmax.s       ft7, fa6, fs5
                  fsgnjx.s     fa6, fa5, ft4
                  and          s11, s2, t2
                  mulh         s0, s9, t0
                  fsgnj.s      ft4, fa4, ft1
                  ori          s3, a5, 267
                  mulhsu       s11, t0, s2
                  remu         s11, s7, t3
                  auipc        gp, 186501
                  remu         s11, a5, t6
                  fsqrt.s      fa5, ft9
                  sub          s6, t2, ra
                  mul          zero, t1, t5
                  fmv.x.w      s10, fs2
                  lui          tp, 422392
                  ori          a5, s4, -1255
                  fmax.s       fs9, ft2, ft7
                  ori          t2, t4, 222
                  addi         a4, s4, -1585
                  srli         t4, s8, 11
                  fcvt.w.s     s5, fs2, rne
                  fcvt.w.s     s11, fs7, rtz
                  fdiv.s       ft0, ft5, fs11, rne
                  or           s1, a4, a3
                  srli         a5, s11, 6
                  fcvt.wu.s    zero, fa1
                  ori          a5, a7, -1925
                  addi         s1, a2, 1639
                  fmin.s       ft2, ft7, fa3
                  fclass.s     t4, fa3
                  sub          a6, s6, a5
                  fcvt.w.s     t3, fs1
                  sltiu        a6, s10, 648
                  flt.s        s8, ft9, fs2
                  fsgnjx.s     ft2, fa6, fs10
                  fmax.s       ft3, fa2, ft5
                  xori         sp, a3, 1203
                  and          s7, a5, gp
                  nop
                  andi         gp, a1, -540
                  sra          a3, s10, t6
                  sub          tp, s6, tp
                  sltu         s3, s7, s5
                  fcvt.wu.s    a6, fa1
                  fsgnjx.s     fs11, ft11, fs4
                  lui          sp, 382845
                  feq.s        a2, fs10, fs0
                  srli         a1, t3, 18
                  and          zero, s3, a5
                  and          a0, a0, s8
                  auipc        a2, 1038112
                  sltiu        a5, a2, 509
                  xori         t0, a0, 499
                  fsgnjx.s     ft5, fs5, ft0
                  fcvt.s.w     ft3, zero
                  fle.s        s7, ft4, fa4
                  auipc        a1, 286523
                  sltu         s10, s5, a5
                  or           s11, t1, sp
                  mulhu        s4, a0, s11
                  sra          s7, tp, s2
                  rem          tp, a0, s7
                  fsgnjn.s     ft6, ft11, fs4
                  mul          s1, sp, ra
                  fsqrt.s      ft2, fs2, rup
                  fle.s        ra, fs7, fs11
                  fle.s        t0, fa0, ft8
                  flt.s        ra, fa3, fs8
                  xori         t2, ra, -778
                  fcvt.w.s     a3, fs7
                  xor          a2, a4, tp
                  fadd.s       ft6, fs4, ft4
                  sltu         s10, ra, t6
                  sltu         s3, a6, tp
                  sra          a3, t4, s2
                  fdiv.s       ft2, fs8, fa4, rne
                  xori         s4, s8, -844
                  fcvt.s.w     fs9, s6, rup
                  div          a5, s1, a4
                  sll          a1, ra, s10
                  fsgnjx.s     fs8, ft2, fa3
                  fmin.s       fa0, ft10, ft8
                  addi         t6, a6, -428
                  fsub.s       fs7, fs11, ft11
                  fsgnjn.s     fa4, fa3, fs11
                  or           a2, s2, t3
                  mulh         tp, s3, a3
                  fsgnj.s      fs5, ft6, ft4
                  fmv.x.w      t4, fs1
                  slti         a5, t3, -509
                  mul          zero, gp, a1
                  auipc        t6, 406005
                  fmv.w.x      ft3, t2
                  fdiv.s       ft0, ft4, ft2
                  remu         s9, a2, ra
                  fcvt.s.w     fa6, t6, rtz
                  addi         s6, a0, 541
                  and          s8, ra, s7
                  fclass.s     s4, fs8
                  fdiv.s       ft2, fa5, fa1, rmm
                  fadd.s       fa7, ft1, fa4
                  andi         s9, a7, 70
                  srai         a6, ra, 29
                  fcvt.w.s     a3, ft10, rne
                  div          s0, zero, s8
                  fcvt.w.s     a3, fs7
                  fmv.w.x      ft0, a2
                  fmul.s       ft5, ft9, fs3, rdn
                  sltu         ra, s8, s3
                  sltiu        a1, s10, -1627
                  sltiu        tp, a6, 741
                  fcvt.w.s     s11, fa5, rdn
                  fmin.s       ft2, ft4, fs8
                  fmin.s       ft11, ft4, fa0
                  slti         a4, t2, 646
                  andi         s3, s7, 796
                  srl          t2, s2, t6
                  fcvt.wu.s    t0, fa1
                  srli         t3, s5, 22
                  addi         t2, a0, 940
                  slt          t6, a5, a3
                  sub          t3, s9, a4
                  add          tp, t4, ra
                  fsgnjn.s     fs9, ft9, fa3
                  sra          t3, a3, a7
                  srl          t3, s1, s10
                  fclass.s     s9, fs9
                  and          a3, s7, a7
                  fdiv.s       fs1, fa3, fs10, rdn
                  mulhu        tp, a6, a0
                  addi         a4, s8, -1413
                  sltiu        a4, a5, 1302
                  add          t4, t6, t6
                  fdiv.s       fa4, ft7, ft5, rup
                  mulhsu       s8, a7, s3
                  fcvt.wu.s    t6, ft0, rdn
                  rem          s0, s0, s1
                  fmin.s       fa6, fs1, fa0
                  slli         s9, s3, 7
                  fmul.s       ft10, fa4, ft6
                  fcvt.s.wu    fa2, s11
                  auipc        s8, 976048
                  fmin.s       fa0, fs10, fa7
                  fcvt.w.s     t2, fs5
                  fsgnj.s      fs7, ft1, ft2
                  slt          s3, tp, a6
                  andi         t6, s1, -1933
                  fcvt.s.wu    fs8, ra, rne
                  fmin.s       ft5, fa4, fs7
                  fmin.s       ft9, fs3, fs8
                  fclass.s     a2, fs6
                  feq.s        s8, fs10, fs11
                  addi         t0, s7, 1210
                  divu         s11, t6, t3
                  fsgnjn.s     ft11, ft4, ft3
                  slt          t6, a2, ra
                  feq.s        s0, ft10, fs11
                  fmv.w.x      fa2, a7
                  fsgnj.s      fs11, fs10, ft0
                  sra          a3, a4, s5
                  ori          t0, a1, 516
                  fle.s        t0, ft6, ft1
                  nop
                  srli         a6, a2, 19
                  nop
                  fsgnj.s      ft7, ft11, fs8
                  sltu         s1, s4, s6
                  xori         a0, a2, -589
                  ori          s10, s3, -1353
                  mulh         s8, t0, a4
                  fsgnj.s      ft0, fs7, ft5
                  sltu         s6, s11, t1
                  auipc        t2, 267044
                  and          a7, s11, a7
                  or           s6, gp, a3
                  nop
                  srl          s8, s8, a3
                  fcvt.s.w     ft0, s4, rne
                  mulhsu       t2, s2, s11
                  fmax.s       ft2, fa6, fs1
                  srli         a5, t6, 2
                  div          s8, s1, s3
                  fsgnjn.s     fa0, fa4, fs8
                  flt.s        zero, fs3, fs10
                  andi         a2, t6, 813
                  srli         t3, t5, 0
                  feq.s        a6, ft1, fs0
                  sub          t3, sp, tp
                  rem          t4, s8, t6
                  fmax.s       fa4, ft3, fs11
                  sll          a2, s10, s0
                  feq.s        s1, fs11, fa7
                  xor          a4, s1, a5
                  mulhu        t2, a7, a4
                  or           s6, a2, a5
                  fmax.s       fs7, ft3, fs10
                  xori         t2, t1, 1749
                  addi         t4, zero, 1492
                  mulhu        a5, a2, a5
                  sll          gp, a6, a6
                  fmax.s       fa6, ft10, fs5
                  div          s4, s3, tp
                  sltiu        t6, s7, 1040
                  fclass.s     s6, fs4
                  fle.s        gp, fs6, fs3
                  sltu         s3, s9, t5
                  and          s9, zero, s10
                  remu         a4, gp, s7
                  flt.s        t6, fa4, fs7
                  fsub.s       fs0, ft3, ft1
                  mulh         t4, s7, s10
                  fcvt.w.s     s5, fs9
                  flt.s        tp, ft4, ft2
                  add          a0, t6, s1
                  slli         s3, a1, 1
                  ori          a7, s3, -196
                  fmv.x.w      t4, fs10
                  srli         s7, t2, 23
                  fcvt.s.w     fs3, a5, rdn
                  div          s4, a3, zero
                  mul          s9, s1, a7
                  fmv.x.w      s6, ft0
                  sll          tp, t5, zero
                  mulhu        s1, a3, s5
                  xori         a1, zero, -1432
                  flt.s        a2, fs4, ft2
                  sltu         a1, s11, a1
                  fmul.s       fs9, fs4, fs1, rne
                  mulhsu       s1, s9, s1
                  or           s4, zero, a2
                  fmv.x.w      sp, fs0
                  fmax.s       ft3, ft5, fs7
                  feq.s        sp, ft5, ft9
                  xor          s5, s1, s5
                  div          a2, a5, s5
                  fle.s        s3, ft0, fa7
                  fmax.s       fs1, fs7, fa0
                  lui          s5, 917238
                  sra          s9, s3, gp
                  mulhu        s11, ra, ra
                  fcvt.wu.s    s1, fa0
                  mulhsu       t6, a5, ra
                  and          s4, s8, t4
                  fle.s        a4, fs9, fs6
                  or           s7, a2, s7
                  fadd.s       ft4, ft5, fa1
                  fadd.s       fs1, fs7, ft11, rtz
                  nop
                  slti         s5, ra, 921
                  fmv.w.x      ft1, gp
                  xori         s8, tp, 1315
                  fmul.s       ft4, ft11, ft4, rmm
                  fcvt.s.wu    fs5, a0
                  slt          a7, s7, s8
                  fdiv.s       fa1, fa2, fs0
                  fadd.s       ft10, ft10, ft11, rne
                  srli         a0, s0, 16
                  srli         t0, s9, 0
                  feq.s        t3, fs4, ft8
                  andi         s6, t1, -1786
                  rem          s11, zero, s1
                  fmv.w.x      fs5, t2
                  fsqrt.s      fa7, ft0
                  fcvt.w.s     s0, ft5
                  fsgnjx.s     fs9, fs5, fs8
                  fmax.s       ft9, ft6, fa5
                  rem          s0, a2, s2
                  fsub.s       ft7, ft5, fa1
                  fdiv.s       ft11, fa5, fa2, rmm
                  add          a4, gp, s7
                  add          t4, t0, a7
                  addi         gp, t1, -1903
                  auipc        s4, 138020
                  fcvt.wu.s    a7, ft2, rdn
                  fsqrt.s      ft10, fs1, rup
                  mulhsu       s4, a0, t1
                  fmv.x.w      a6, ft5
                  fclass.s     s1, fa1
                  slti         a0, t2, 520
                  rem          a3, a7, tp
                  fcvt.w.s     ra, ft1
                  mulhsu       a0, a0, a0
                  fmax.s       fa0, fs10, fa0
                  and          zero, s3, sp
                  add          t3, s5, a4
                  mul          t3, s2, s3
                  fsgnjx.s     fs0, fs9, fs6
                  fsgnj.s      fa3, fs11, ft5
                  fsqrt.s      ft6, ft5, rtz
                  mul          a4, t1, s0
                  sub          a1, s11, t2
                  fcvt.s.w     fa6, s11, rtz
                  xori         zero, a3, 1610
                  slli         t6, s4, 21
                  div          a4, a2, s1
                  fsgnjn.s     fa1, fa2, ft2
                  flt.s        a3, ft3, fs3
                  fclass.s     t2, fs3
                  fmax.s       ft5, fs9, ft8
                  slli         t0, t6, 22
                  sltu         a1, s11, a4
                  srl          s7, tp, zero
                  remu         s0, s8, s8
                  andi         ra, gp, -1491
                  srai         s11, s11, 9
                  sll          tp, t6, sp
                  slti         t6, a0, -323
                  slt          a3, s1, a0
                  srli         ra, t3, 0
                  fsqrt.s      ft11, ft2
                  divu         a6, s3, a2
                  sltiu        s0, s2, 427
                  add          t2, t5, a6
                  srli         a3, s1, 11
                  fmv.x.w      a0, fs3
                  divu         s6, s3, gp
                  fsgnj.s      fs5, fa4, fa2
                  sltu         t4, a1, s9
                  fmul.s       ft11, fs5, fs11, rtz
                  fmin.s       fs8, ft5, fs6
                  add          a5, t4, a5
                  flt.s        a2, fa7, fa5
                  auipc        s1, 910437
                  and          a7, s8, sp
                  andi         sp, a2, 1299
                  mulhu        a0, zero, s7
                  fle.s        s9, fa4, ft0
                  fcvt.w.s     a5, fs3, rmm
                  fcvt.w.s     t4, fs4
                  srl          t2, t3, t5
                  nop
                  add          tp, a5, s8
                  fmv.x.w      t2, ft5
                  fmv.x.w      s5, ft1
                  fle.s        s6, fs10, fa5
                  fmin.s       ft0, ft9, ft5
                  xor          gp, s4, a0
                  mul          s8, gp, a4
                  nop
                  fsgnjx.s     fs9, fs5, ft11
                  fsgnjn.s     fs8, fs6, ft11
                  fcvt.w.s     s1, fa2, rdn
                  fcvt.w.s     zero, fs11, rup
                  slli         a7, t3, 13
                  xori         a4, a1, -475
                  nop
                  mulhu        s10, s8, s10
                  fclass.s     a6, fs3
                  divu         a6, t5, s2
                  slt          s5, t0, a3
                  feq.s        t6, ft1, ft11
                  ori          t0, a5, -578
                  fcvt.s.w     ft0, s6, rne
                  srl          s11, s1, ra
                  slli         t3, t5, 3
                  xor          a2, s7, t4
                  lui          a5, 498255
                  sll          s8, t4, s8
                  xori         s9, a6, 1569
                  fle.s        a0, fa3, fa5
                  srai         s1, s3, 29
                  add          sp, s11, t6
                  feq.s        s6, fs11, ft6
                  fmv.x.w      t0, ft3
                  fcvt.wu.s    a6, fs9
                  addi         s0, t2, -2018
                  xori         s3, a0, 2000
                  xor          a4, t6, tp
                  xori         s10, s9, 898
                  fmul.s       fs1, ft7, ft9
                  fadd.s       ft10, ft4, ft1
                  fcvt.s.w     fa6, t6
                  fmv.w.x      fa3, s8
                  fmv.x.w      s8, ft10
                  slli         a3, s6, 1
                  sltu         a5, a6, zero
                  fsgnj.s      ft7, fa3, fa7
                  lui          a2, 4118
                  fmax.s       ft1, fa1, ft11
                  sll          s9, a0, t6
                  fsqrt.s      fs11, fa4, rdn
                  rem          t4, a1, s5
                  add          t6, a0, sp
                  xori         s8, a3, 356
                  slli         a3, s4, 22
                  sub          t6, a6, a7
                  xor          a5, s7, t2
                  slti         sp, tp, -1447
                  fcvt.s.wu    ft11, t1, rne
                  srl          t2, ra, t3
                  fadd.s       fa5, fs10, fa1, rmm
                  fdiv.s       fs11, ft2, fa0
                  fmin.s       fs8, ft9, fa7
                  and          sp, a3, ra
                  addi         a3, s6, 1237
                  fdiv.s       fs10, ft7, ft10
                  flt.s        s1, fa1, fa7
                  slt          ra, s5, a2
                  sltu         a7, s1, tp
                  andi         t2, a5, -1524
                  fsqrt.s      fa5, ft1
                  ori          t3, s1, -941
                  feq.s        s9, fa2, fs7
                  mul          ra, t0, t1
                  fcvt.w.s     t2, fs5
                  fcvt.wu.s    s3, fs7, rtz
                  slli         s3, a7, 12
                  andi         t2, ra, -213
                  fclass.s     a1, fs3
                  sltu         a1, s1, s0
                  addi         a4, s4, -1671
                  srai         a3, t0, 29
                  sub          a1, t4, s9
                  sra          a7, t3, s8
                  fmul.s       fs5, ft7, fs1
                  fcvt.s.wu    fs0, s1
                  fmv.w.x      fs4, s3
                  mulh         zero, t4, a6
                  sub          a1, s1, s3
                  fmul.s       ft6, ft7, fs8
                  fmin.s       fs11, fs2, ft11
                  fmax.s       fa0, fs9, fs11
                  and          tp, s6, a0
                  fsgnjn.s     fa3, fs9, fa1
                  fle.s        t0, fs0, fa3
                  slt          t3, a5, t3
                  rem          gp, s11, s10
                  mul          a7, a6, s5
                  mulh         s4, t1, a0
                  divu         t0, t0, tp
                  fmax.s       fs5, ft9, fa1
                  flt.s        t3, ft11, fs1
                  fmv.w.x      fa1, s10
                  fsub.s       fs8, fa1, ft8, rup
                  mulhu        s10, a3, t5
                  fle.s        zero, fs8, fs3
                  fsgnjx.s     ft7, fs0, fs8
                  auipc        s0, 213492
                  addi         t4, s5, -451
                  srli         s7, t6, 14
                  feq.s        t0, fa0, fs4
                  fdiv.s       fs8, fs9, fa4, rtz
                  mulhu        a6, a4, gp
                  addi         s8, s11, -1363
                  fcvt.s.wu    ft4, tp, rdn
                  fsub.s       ft0, ft7, fs11
                  and          a6, s6, t5
                  slt          s9, s9, s7
                  fcvt.wu.s    t4, ft9, rtz
                  slli         s8, s5, 16
                  srli         a7, s9, 21
                  feq.s        a4, fs6, fa2
                  div          s5, ra, a4
                  mul          t6, t2, t0
                  feq.s        t4, fs3, ft3
                  sll          zero, gp, a7
                  mulhsu       a0, s11, a5
                  fsgnjx.s     fs2, fs7, fs5
                  sltu         sp, a2, s6
                  srli         s11, a4, 12
                  fadd.s       fs10, ft5, ft10
                  fcvt.wu.s    t6, ft11
                  rem          s4, t4, t3
                  slti         a2, t4, -591
                  addi         s0, s10, -817
                  srli         s6, ra, 23
                  fsub.s       ft7, ft8, ft9
                  or           s5, a4, s0
                  srai         t4, s10, 12
                  xori         s11, s4, 324
                  xor          zero, gp, a6
                  and          t4, a6, sp
                  sll          t6, t3, t1
                  divu         s7, t2, a1
                  flt.s        t2, fa1, ft1
                  ori          a7, s10, -448
                  fclass.s     a4, ft5
                  fmv.x.w      a4, fs10
                  feq.s        zero, fa5, fa3
                  sra          t3, sp, s6
                  fcvt.wu.s    t0, ft5, rup
                  fsgnjx.s     fs7, fs0, ft7
                  fcvt.w.s     zero, fs10, rup
                  fmax.s       ft6, ft10, fs9
                  fcvt.s.wu    fa6, s4, rtz
                  or           s10, s2, t0
                  div          a3, s8, s1
                  fle.s        s4, fs9, fa0
                  flt.s        a0, ft3, fs11
                  divu         a4, t0, s6
                  auipc        t3, 912586
                  fadd.s       ft9, fs10, ft6, rdn
                  mulh         s4, sp, s4
                  lui          t4, 824274
                  xori         a6, t6, 224
                  fmv.x.w      t2, ft11
                  fsgnjn.s     fs5, ft3, fs0
                  xor          s6, s5, s1
                  fmv.w.x      ft2, zero
                  fsub.s       fs10, fa0, fs11, rmm
                  fadd.s       ft6, fs7, fs2
                  mul          s3, s2, s11
                  fmv.x.w      s9, fs10
                  remu         sp, s4, t3
                  slt          a6, s6, a2
                  fmv.x.w      t4, fs3
                  mulhu        s0, s5, gp
                  addi         s10, t4, -1113
                  slt          t2, s4, a1
                  and          zero, t0, s0
                  srli         s4, s6, 28
                  addi         a1, s9, -1953
                  slti         a7, s0, -897
                  and          a5, t3, a7
                  fsgnjx.s     fs0, fs7, ft9
                  lui          s9, 721322
                  xor          s4, t0, a7
                  mulhsu       a3, a7, s7
                  flt.s        s3, ft2, ft8
                  ori          s6, s7, -1641
                  sll          s3, s5, a3
                  mul          a2, t2, a0
                  fcvt.wu.s    a0, fs6, rtz
                  lui          s9, 314319
                  nop
                  fmul.s       ft10, fs0, fa1, rmm
                  fsgnj.s      fs3, ft4, fa2
                  mul          t4, s4, s5
                  sltu         s3, s11, s2
                  flt.s        ra, ft5, fa5
                  sub          s6, t2, zero
                  srl          a2, t2, s6
                  lui          s7, 266161
                  srli         s11, a5, 10
                  sltiu        s4, a2, 1652
                  flt.s        t2, fs7, ft7
                  sub          a0, s1, a3
                  fmv.x.w      ra, fs1
                  divu         t4, tp, s2
                  fsgnjn.s     fa1, ft1, fs10
                  xor          s8, s0, t3
                  mulhu        t2, sp, a1
                  mulhsu       a4, a6, s5
                  add          a1, s11, s1
                  sub          t4, s9, t2
                  nop
                  slti         a0, sp, -1261
                  nop
                  and          a7, gp, a4
                  fsgnj.s      fs5, fa7, ft3
                  sub          s7, s8, s6
                  fmul.s       fa6, ft5, fs1
                  fsub.s       fa4, ft5, ft8
                  mulh         t0, s11, t0
                  slt          ra, a7, s0
                  fsgnj.s      fs10, fs0, ft0
                  div          sp, a2, ra
                  sltu         s6, a5, s2
                  srli         a3, s1, 4
                  fmv.x.w      t0, fa6
                  sltiu        zero, sp, -874
                  and          s0, s8, s10
                  fle.s        a3, fs2, fa0
                  nop
                  fsub.s       fa3, ft7, fs6, rup
                  sltiu        t0, gp, 421
                  slli         zero, s0, 8
                  and          t3, s11, s9
                  andi         t0, s5, 1406
                  mulhsu       a1, s10, t5
                  and          tp, a3, a2
                  fsub.s       fs0, ft8, fa5
                  slt          s5, s9, a7
                  andi         a3, a7, 323
                  fdiv.s       fa1, fa3, fs10, rmm
                  fcvt.w.s     t3, ft0, rup
                  and          s7, a6, s5
                  mulh         sp, a7, gp
                  fsgnjx.s     fa0, ft10, ft7
                  rem          t2, s8, a7
                  fmv.x.w      ra, fs9
                  or           s7, s5, t5
                  xor          ra, t1, sp
                  sra          s3, a6, sp
                  fcvt.s.wu    ft1, t2
                  mulhu        gp, t5, t1
                  nop
                  fdiv.s       ft10, fa0, fa7, rdn
                  fsgnj.s      fs8, fs4, ft8
                  add          a2, t1, t4
                  andi         s9, t1, 1350
                  addi         gp, s11, 1345
                  fmul.s       fs5, ft9, ft10
                  fsqrt.s      ft9, fs2, rmm
                  fsgnjx.s     ft4, ft8, fs2
                  nop
                  fle.s        a3, fs4, ft5
                  mulh         s5, a2, t2
                  auipc        sp, 70906
                  ori          a2, zero, -549
                  fsub.s       ft4, ft11, fa4, rdn
                  srl          s3, t2, tp
                  flt.s        s5, fs10, ft4
                  sub          t2, s10, s11
                  fmax.s       fs7, ft11, fa1
                  div          s3, t2, t2
                  fsqrt.s      fs11, fs7
                  lui          s7, 510564
                  sltiu        a7, t4, 1916
                  fsub.s       ft1, ft3, fs4, rup
                  nop
                  or           tp, zero, s4
                  xor          t4, s8, a1
                  xori         t2, s1, -1485
                  lui          gp, 701935
                  and          s10, a4, t4
                  fclass.s     zero, ft9
                  fmv.x.w      gp, fs4
                  sra          s1, tp, t2
                  add          t4, ra, zero
                  fsub.s       ft3, ft8, fs11
                  addi         t2, s10, 91
                  fcvt.s.w     fa2, a4
                  or           s3, s8, s6
                  xori         a1, gp, -503
                  sltu         a0, a4, tp
                  mulh         a7, t3, s1
                  fsgnjn.s     fs11, ft10, ft7
                  slt          tp, a7, t2
                  flt.s        a4, fs1, fs4
                  srl          s7, s2, t1
                  flt.s        s9, fa0, ft9
                  sub          a0, a7, a2
                  mulh         s4, t3, s8
                  fmv.x.w      s0, ft0
                  fdiv.s       fa0, ft2, ft2
                  fsqrt.s      fs1, ft7, rne
                  feq.s        t3, fs2, ft11
                  fcvt.w.s     s0, fa3, rtz
                  fsgnjn.s     fs0, ft0, ft7
                  feq.s        s7, ft11, ft8
                  fcvt.wu.s    s5, fa1
                  fmv.w.x      ft1, s2
                  lui          s4, 826465
                  fsgnjx.s     fs6, ft5, ft11
                  mul          a4, ra, t1
                  divu         s10, a7, ra
                  sll          s7, a6, s0
                  sltiu        s4, s10, -654
                  divu         a3, s7, ra
                  xor          zero, a4, s0
                  mulhsu       ra, t1, s3
                  sll          s9, s4, a3
                  nop
                  fmul.s       fa1, ft0, fs9
                  xor          t3, s2, a4
                  fclass.s     sp, fs4
                  div          s5, s6, a6
                  slti         s10, a3, -1871
                  remu         s4, sp, t2
                  fcvt.s.wu    ft3, s7
                  fle.s        gp, fs6, ft11
                  slt          sp, s1, a4
                  slt          t0, t4, s5
                  fadd.s       ft6, fs6, ft5, rtz
                  lui          zero, 653853
                  remu         s7, t2, a4
                  addi         s0, s6, -1793
                  feq.s        s6, fa5, fs7
                  divu         s3, sp, s2
                  ori          sp, a5, 709
                  fadd.s       ft4, fa3, fa0, rne
                  xor          s5, s10, a3
                  fadd.s       fs9, fa5, ft0
                  ori          s1, s6, -1364
                  fcvt.s.wu    fa5, ra
                  remu         s1, a6, a5
                  fcvt.w.s     a0, fa1, rne
                  srl          gp, s4, zero
                  xori         s3, s1, -1397
                  fmv.x.w      a0, fs7
                  sub          gp, a7, s3
                  div          s3, t4, s4
                  fmv.x.w      s7, fs6
                  remu         s3, t4, a3
                  sltiu        a2, a2, 1891
                  and          s11, s2, t1
                  divu         s9, a7, t3
                  mul          s4, a0, a1
                  flt.s        t3, fs6, ft2
                  sltu         s3, a3, s3
                  mul          t0, s2, zero
                  mul          s6, s11, s1
                  ori          s3, s11, -1214
                  slti         s4, gp, 839
                  fclass.s     t6, ft7
                  xori         s4, t0, -2043
                  fmv.x.w      a2, fa3
                  fle.s        s11, fa5, fa3
                  remu         t6, zero, gp
                  fsub.s       fs9, ft2, fa4
                  add          s11, t3, a4
                  fcvt.w.s     a0, ft9
                  slli         a4, t1, 13
                  fcvt.wu.s    t0, fs9
                  andi         a0, t4, 1376
                  srai         tp, s7, 7
                  slt          sp, zero, zero
                  add          a7, s5, t6
                  mulh         a3, t4, s3
                  fadd.s       fs9, fs4, ft10
                  fle.s        sp, fa0, fs7
                  fle.s        a0, fa5, fa7
                  xor          t6, t0, s5
                  srli         a7, s8, 30
                  feq.s        sp, ft8, ft3
                  fmin.s       fs8, fs5, fs5
                  fmax.s       fs1, fs5, fs7
                  fmul.s       ft7, fs11, fa1, rup
                  mulhu        ra, s0, a5
                  nop
                  and          a5, a7, tp
                  fsub.s       fs1, ft6, fa4, rtz
                  fmv.x.w      ra, fs7
                  divu         a2, t5, s1
                  fmv.w.x      ft2, t3
                  slli         zero, s3, 28
                  fsqrt.s      fa3, fs1, rdn
                  mulhu        s3, t6, s2
                  srli         zero, a1, 14
                  fcvt.s.wu    fs0, ra, rmm
                  addi         gp, s7, -954
                  fadd.s       fs2, fs6, ft1, rmm
                  fmin.s       fs10, fa3, fs0
                  mulhsu       s5, tp, t5
                  fcvt.s.w     fs8, s11, rdn
                  lui          sp, 509094
                  fclass.s     a4, fs9
                  slli         a5, tp, 7
                  fmin.s       fa3, ft11, fs10
                  fsgnj.s      fs11, fs4, fs5
                  fcvt.s.wu    ft9, s5
                  fcvt.s.wu    ft2, a6, rne
                  addi         t4, s8, 638
                  nop
                  fcvt.s.wu    ft10, a1
                  sll          s9, t1, a6
                  fsgnjn.s     ft9, fa2, ft0
                  feq.s        s11, fa1, fs10
                  fsqrt.s      fa6, fs9, rmm
                  add          gp, s3, t1
                  and          s0, s11, s11
                  fsgnjn.s     fs4, fs11, fs7
                  sltiu        a0, a0, -1446
                  remu         s4, t6, a6
                  mul          t4, a7, a0
                  add          a2, t3, tp
                  srli         s11, a2, 16
                  fclass.s     s0, fa2
                  srli         s1, a6, 1
                  fsgnjn.s     fa5, fs7, fa0
                  remu         s9, s3, tp
                  fle.s        t6, fa2, fs5
                  flt.s        t2, fa1, fa2
                  auipc        s0, 743775
                  sub          s8, a6, a3
                  fcvt.w.s     s1, ft8
                  remu         tp, zero, t3
                  auipc        s1, 379881
                  fadd.s       ft5, fs6, fs6
                  remu         a2, a4, sp
                  flt.s        a5, fs1, fa1
                  mul          s0, t4, s0
                  feq.s        s8, fs10, fs10
                  mulh         s5, t0, a5
                  auipc        t2, 303180
                  fle.s        ra, ft10, ft7
                  fmv.x.w      t0, ft2
                  fsub.s       fs0, fa4, fs9, rmm
                  nop
                  fcvt.wu.s    s9, fs2, rne
                  fdiv.s       fs5, fs5, ft1, rdn
                  fmv.w.x      fs8, a5
                  fmax.s       fs9, fs5, ft1
                  srai         a6, s6, 24
                  rem          sp, a5, tp
                  lui          a3, 136259
                  srl          ra, t4, t4
                  mul          a1, s1, gp
                  divu         s7, a4, a4
                  add          sp, s3, t1
                  fmin.s       fs1, ft5, fa7
                  mulhu        t0, t5, s7
                  mulhsu       s8, s7, t5
                  add          s7, zero, s3
                  div          s1, s2, a4
                  div          a2, t5, a0
                  nop
                  remu         s10, t4, t2
                  nop
                  nop
                  flt.s        t4, fs9, fa7
                  mulhsu       a7, a0, t4
                  remu         s4, a4, s3
                  fsgnjn.s     fa5, ft9, fs2
                  auipc        t4, 747799
                  sra          s9, s5, s11
                  fmv.x.w      t3, fa6
                  fmv.w.x      ft8, a0
                  srli         s6, a1, 5
                  slt          a6, s4, ra
                  rem          t2, ra, t5
                  flt.s        t6, ft5, fa5
                  divu         a6, s6, ra
                  mul          ra, tp, a7
                  rem          s4, gp, a0
                  auipc        t3, 965256
                  slti         a6, t6, -1978
                  feq.s        s1, fa5, fs11
                  fclass.s     a3, ft7
                  mul          a0, t1, a4
                  fsgnjx.s     fa0, fa4, fs0
                  remu         s4, a3, s9
                  fcvt.wu.s    t4, fs10, rmm
                  slti         t2, s1, -1768
                  auipc        sp, 770630
                  mulh         s9, a6, a1
                  srai         s1, s0, 8
                  fle.s        s10, fs9, fs11
                  fle.s        zero, ft7, fs10
                  fsub.s       ft8, fa0, fs11, rup
                  rem          s0, a0, t0
                  nop
                  mul          t6, s10, s1
                  fadd.s       ft1, fa6, ft5, rdn
                  add          zero, s1, t6
                  sltiu        s4, t2, -1005
                  xor          s6, t4, s7
                  mulhu        tp, a1, a2
                  and          t6, gp, s1
                  xori         s6, zero, 939
                  mul          s6, s8, t1
                  slti         a6, t3, 416
                  ori          s9, s11, 1224
                  lui          s10, 974641
                  fsqrt.s      fs7, ft0, rup
                  fcvt.s.wu    fs6, zero, rup
                  divu         s5, t4, a0
                  auipc        s10, 450244
                  fsub.s       fs8, fs8, ft7
                  fmv.x.w      s8, fs3
                  rem          zero, a0, s11
                  fcvt.w.s     s11, ft5, rtz
                  ori          s10, a6, 1891
                  ori          t2, s6, -234
                  fsub.s       ft8, fa3, fa0, rup
                  sltu         a7, a2, t0
                  sltu         s11, sp, ra
                  fmv.w.x      ft11, s9
                  fdiv.s       ft10, fs0, fa5
                  sub          tp, s8, a2
                  fcvt.w.s     s5, fa1
                  fclass.s     s8, fs10
                  flt.s        zero, fs2, fs11
                  xor          s4, a6, s4
                  fsub.s       ft3, fs11, ft5, rne
                  sra          s4, s3, zero
                  add          a5, a2, a6
                  xori         s1, s4, -703
                  and          s10, s0, a7
                  fmax.s       fs2, ft4, ft6
                  and          a6, s5, s5
                  divu         s0, s6, zero
                  fsgnjx.s     fs5, fa0, ft10
                  sra          a2, s0, sp
                  fcvt.s.w     fa7, a2
                  sltu         t0, sp, ra
                  fclass.s     sp, fa4
                  fadd.s       fs4, fa2, fa2, rne
                  fcvt.s.w     fs11, t4, rtz
                  slli         s5, s8, 21
                  srai         s0, a1, 17
                  fsgnj.s      fa2, fs10, ft0
                  fclass.s     ra, fs4
                  ori          s4, s2, 1741
                  srli         s4, gp, 31
                  fmul.s       fs6, fa4, fs6, rdn
                  fmv.w.x      fa5, a1
                  sra          s4, t1, s7
                  xori         a1, s2, -886
                  div          t6, s11, a7
                  or           s0, t3, t5
                  mul          s4, s10, s2
                  div          s3, s9, a6
                  sll          t3, t3, a0
                  fsgnjx.s     fs4, ft11, ft8
                  srl          s10, s11, t2
                  xori         t2, a1, 365
                  srai         t2, gp, 20
                  fcvt.wu.s    s11, ft9
                  slt          s6, t1, s2
                  fmax.s       ft2, fs0, fs11
                  slti         s7, a5, -844
                  srai         tp, t6, 0
                  fadd.s       fa4, ft1, ft5, rtz
                  fsgnjx.s     fs0, fa5, ft1
                  rem          ra, s0, a5
                  fsqrt.s      ft1, fa3
                  fcvt.w.s     s5, fs3
                  srli         s0, s2, 18
                  sub          sp, s4, tp
                  fsgnjx.s     fs1, fa2, fs8
                  sltiu        s5, ra, 418
                  and          s7, t3, s8
                  fcvt.wu.s    ra, fs5, rne
                  srl          s3, sp, t3
                  sra          s3, s8, s2
                  slt          sp, t4, s9
                  sll          s4, s8, a2
                  fcvt.s.wu    fa5, t4, rmm
                  sub          ra, s4, s7
                  fdiv.s       fs2, ft6, ft0
                  addi         s10, ra, 1657
                  flt.s        s8, fs4, fa4
                  and          t3, a5, s10
                  ori          t6, s2, 268
                  auipc        s1, 893417
                  xor          a1, s1, s10
                  or           a7, s2, s10
                  fsgnjx.s     fs1, ft5, ft0
                  mulhsu       a5, a3, t4
                  fmul.s       fa3, fa7, fa0
                  fle.s        s0, fs1, ft11
                  fsqrt.s      ft2, fs9, rdn
                  addi         s8, a6, -724
                  fsgnjx.s     fa1, fs0, fs11
                  andi         a5, s9, 1894
                  slt          a4, s10, s0
                  fmv.x.w      a0, ft7
                  sll          gp, s2, a2
                  slli         t3, s0, 26
                  fle.s        t3, fa5, ft10
                  fclass.s     a3, ft8
                  srli         s3, s5, 1
                  srli         ra, s3, 21
                  div          s6, a6, s5
                  sltu         t6, a1, ra
                  fcvt.s.wu    ft2, t5
                  srli         s5, s5, 22
                  srl          a6, s4, s4
                  fdiv.s       fa4, fa2, fa6, rdn
                  slli         s11, s11, 29
                  fcvt.wu.s    a6, ft0, rtz
                  fsub.s       fs10, fs2, ft7
                  fsub.s       fs4, fs0, fa5, rtz
                  add          tp, t1, a7
                  sra          s8, s10, s9
                  rem          t3, t6, s1
                  srli         s11, a1, 0
                  fadd.s       fa2, ft4, fs0
                  andi         s11, s4, -1514
                  fsub.s       ft9, fs9, fs6
                  srl          sp, t1, t2
                  sltu         t4, s10, a2
                  nop
                  slt          s4, s6, t5
                  lui          ra, 866976
                  fmul.s       ft3, fa6, fs1
                  fadd.s       fa0, fa5, fa2, rtz
                  fsub.s       fa2, fs10, fs2, rtz
                  and          s6, a2, zero
                  add          a1, a6, t1
                  srai         a4, s7, 15
                  fmul.s       ft10, fa5, fa2, rmm
                  fmv.x.w      a5, fs3
                  add          s4, tp, ra
                  srl          a2, s6, a0
                  fmv.w.x      fa1, s4
                  srai         t0, t4, 6
                  sll          s9, t5, t5
                  srl          a3, a7, s10
                  sltiu        a3, t6, -1574
                  mulhsu       s10, gp, tp
                  fsgnjx.s     ft2, fs7, fs8
                  fcvt.s.wu    fs11, s9, rne
                  rem          s8, s3, zero
                  sll          s8, tp, t6
                  sub          a1, s10, t4
                  fmv.w.x      fs8, gp
                  fsub.s       ft2, ft1, fa2, rup
                  and          sp, tp, a1
                  fcvt.w.s     a4, fs7, rdn
                  fcvt.w.s     s1, fa5
                  xor          s11, s7, s2
                  fmv.x.w      s10, fs5
                  ori          a5, t1, -219
                  slti         s5, a3, -610
                  sll          a5, t0, a4
                  and          sp, zero, s11
                  sra          s9, a5, s3
                  sra          t3, gp, t2
                  fcvt.w.s     s11, ft0, rtz
                  fadd.s       fa4, ft5, ft11, rmm
                  srl          ra, gp, t2
                  fcvt.s.wu    ft2, zero
                  slti         t6, s0, 126
                  xor          s11, t3, tp
                  sltu         a3, ra, zero
                  remu         tp, sp, a6
                  or           s11, a4, s2
                  srl          s10, a3, s3
                  nop
                  sll          a3, s8, a0
                  mul          t3, s4, a5
                  lui          a1, 936028
                  mul          a2, a5, t3
                  fsub.s       fs7, fs10, fa1
                  fcvt.wu.s    s8, fa3, rtz
                  slli         tp, t6, 8
                  nop
                  fsub.s       fs6, ft7, fs11
                  fcvt.w.s     a7, fs4, rup
                  fmv.w.x      fs3, a1
                  fadd.s       fs6, ft7, fs7
                  nop
                  fle.s        a0, ft10, fa5
                  or           s6, a3, a6
                  add          tp, a7, s9
                  div          ra, s11, t2
                  srl          s5, t2, s9
                  fclass.s     tp, fs2
                  mulhu        t0, a1, t4
                  fcvt.w.s     s0, fs9, rdn
                  div          t2, t4, s7
                  fmin.s       ft1, fs10, fa7
                  ori          s5, s8, -1248
                  fmax.s       ft7, fs0, fs6
                  xori         a7, ra, -218
                  mulhsu       t4, a0, s9
                  nop
                  slti         a6, a0, -285
                  sltu         a3, s8, sp
                  addi         gp, t6, 1579
                  xori         sp, s2, 1049
                  fsgnjn.s     ft8, ft11, fa5
                  addi         t6, s11, -1718
                  auipc        a6, 385778
                  fmv.x.w      s6, fs8
                  andi         s10, s11, -455
                  fadd.s       fa0, fa2, fa2, rmm
                  fmv.w.x      fs8, t5
                  fmax.s       ft8, ft5, fa0
                  auipc        t2, 711807
                  fadd.s       fa1, fs6, ft9
                  fcvt.s.w     ft7, t0, rtz
                  mulhu        s6, s5, a0
                  div          t3, ra, s3
                  div          s0, s4, s10
                  remu         t6, s5, s6
                  fcvt.s.w     ft9, a2, rup
                  fmin.s       fa4, ft9, fa7
                  flt.s        sp, ft0, fs1
                  fsgnj.s      fs0, ft3, fs2
                  fmul.s       fs7, fa2, fa3
                  sub          a4, a3, a6
                  slt          s10, s10, a3
                  fclass.s     s1, ft9
                  srli         a5, s1, 27
                  div          tp, s3, s9
                  xori         s9, s3, 1752
                  mulh         a3, a6, s11
                  and          a2, t3, s8
                  mulhu        a2, a3, sp
                  fclass.s     a4, ft5
                  lui          zero, 374527
                  andi         s7, t2, 481
                  fmv.x.w      s4, ft1
                  lui          t3, 358260
                  flt.s        gp, fs9, fs4
                  fmv.w.x      fs10, s8
                  rem          a2, s10, sp
                  xor          t4, t4, gp
                  and          s0, t2, ra
                  addi         a7, a0, 946
                  fcvt.wu.s    a5, fs5
                  sltu         tp, t6, s2
                  fsqrt.s      ft5, fs5, rdn
                  nop
                  fmax.s       fs2, ft0, ft3
                  fmax.s       fs10, fa0, fa6
                  slli         a1, a4, 16
                  fmv.w.x      fa7, s5
                  sub          a6, s9, s0
                  sltiu        s1, zero, -1418
                  srl          t2, t2, s0
                  fmul.s       ft8, ft4, ft7
                  fsgnj.s      fs10, fs7, fs9
                  feq.s        s4, ft3, fs9
                  fsub.s       ft6, fs6, ft2, rmm
                  flt.s        t0, fa4, ft2
                  auipc        ra, 877258
                  fmax.s       fa5, fa3, ft4
                  mul          a4, a5, gp
                  fmax.s       ft9, ft11, ft2
                  fmv.w.x      fa1, s1
                  fcvt.s.w     ft6, s6
                  fcvt.wu.s    s1, fa6, rtz
                  fcvt.wu.s    t3, ft5
                  fdiv.s       ft0, ft1, ft8
                  div          s3, s8, a1
                  fadd.s       fs11, fs11, ft6
                  fsgnjn.s     ft1, fa7, ft4
                  divu         a2, a2, a4
                  fsgnjn.s     fs9, fs7, fs5
                  addi         t3, s7, 504
                  fsqrt.s      ft1, fs5, rne
                  srl          sp, s2, zero
                  nop
                  remu         a4, a3, t2
                  fadd.s       fs3, ft9, ft3
                  or           gp, a4, gp
                  sub          t2, s4, a5
                  fmax.s       fs2, fa1, fs11
                  or           s5, t0, s9
                  fsqrt.s      fa6, ft9
                  sub          s11, sp, s4
                  flt.s        a6, ft2, fs11
                  fmv.x.w      a7, fa0
                  addi         t0, t2, -654
                  slli         s5, s10, 23
                  fsqrt.s      fs6, ft6, rmm
                  andi         a2, s0, -2009
                  xor          a0, t5, a5
                  fcvt.wu.s    s10, ft9, rup
                  fsqrt.s      fs5, ft11, rmm
                  auipc        tp, 503052
                  srai         a6, tp, 4
                  fadd.s       fa6, fs1, ft4
                  andi         t4, gp, 628
                  fmv.w.x      ft1, t3
                  fmul.s       fs7, fs5, ft6, rup
                  fmul.s       fs4, fs11, ft2, rmm
                  add          a5, s7, zero
                  fmv.x.w      t0, ft11
                  fcvt.w.s     a7, ft6
                  xor          a7, t4, a2
                  mulhsu       s7, s1, a6
                  fadd.s       fa6, ft9, ft8
                  fsgnj.s      ft8, fa1, ft3
                  fmv.w.x      fs7, zero
                  nop
                  fmul.s       fa0, fa7, fa0, rtz
                  fsgnjn.s     fs10, ft5, fs4
                  fsgnjn.s     fa2, fa0, fa0
                  fdiv.s       ft11, ft6, ft7, rdn
                  mulh         a6, s5, t4
                  fcvt.s.w     fs8, ra
                  andi         s4, s11, -483
                  xori         sp, a2, -1699
                  fmax.s       ft3, fa3, ft1
                  sll          a7, zero, tp
                  srli         s8, a7, 7
                  addi         a4, t1, 820
                  fsub.s       ft4, fs2, ft9
                  mul          a6, t0, s2
                  fadd.s       ft9, fa6, fa0, rtz
                  sltu         s7, s2, s3
                  mulhsu       s7, t6, s10
                  fdiv.s       ft2, fa5, fa3
                  sub          gp, t6, a0
                  or           t3, s7, a2
                  fcvt.wu.s    a0, fs8
                  fmv.x.w      t0, fs3
                  fsgnjn.s     fs7, ft2, ft1
                  divu         tp, s4, a0
                  ori          a1, s1, 1700
                  fle.s        gp, fs5, ft5
                  srli         s7, a7, 29
                  mulhu        a1, s8, a3
                  fsqrt.s      fs9, fa3, rtz
                  divu         t0, t5, a2
                  sra          s1, s8, a7
                  fsgnj.s      ft11, ft10, ft9
                  fmin.s       ft6, fs8, ft2
                  slti         s11, s11, -208
                  fdiv.s       ft0, fs9, ft11, rmm
                  add          a3, a1, s5
                  sra          s3, t5, s2
                  div          zero, s3, s10
                  sltu         ra, s0, s1
                  fsgnj.s      fa3, ft3, fs4
                  addi         s10, t0, -482
                  sra          gp, zero, zero
                  fsgnjx.s     fa6, fs0, fa4
                  sltu         t0, s6, a7
                  fdiv.s       fs0, fa1, fs8, rmm
                  fsgnjn.s     fs3, fs11, fa0
                  fsgnjn.s     fs9, fa3, ft2
                  fcvt.s.wu    fs5, s7
                  auipc        s0, 231708
                  srl          a7, s9, t3
                  div          s6, s0, t4
                  srli         s1, t5, 10
                  fmax.s       fs11, fa0, ft0
                  div          t3, gp, s5
                  slti         s11, s4, -1951
                  fmul.s       fa7, fs11, ft11, rdn
                  fcvt.s.wu    fa0, zero, rne
                  mulhsu       s4, s7, a4
                  sra          t3, a6, s5
                  or           gp, s9, a3
                  or           t2, s2, a7
                  fclass.s     zero, ft11
                  srai         s1, s2, 14
                  sll          s5, s3, a4
                  mulhsu       s7, s3, a7
                  auipc        a1, 564127
                  fle.s        a1, ft0, fa2
                  divu         s9, a5, s0
                  feq.s        s1, fs10, fs7
                  mul          s5, s5, a1
                  mul          ra, s9, t6
                  fsgnjx.s     ft6, fs11, ft7
                  mul          ra, zero, gp
                  fmul.s       fs2, fa4, fa1, rdn
                  slt          s0, s7, t0
                  lui          zero, 697200
                  rem          s11, a1, ra
                  fsgnj.s      fs4, fa2, fa3
                  fsgnj.s      fs9, fa0, fa3
                  remu         s4, a3, t6
                  sra          s7, t6, s9
                  fclass.s     gp, ft8
                  fsub.s       fs11, fa6, fa5
                  sltiu        a2, tp, -518
                  feq.s        s3, ft6, fs1
                  nop
                  xor          s9, a5, a3
                  fclass.s     s8, fs4
                  xori         ra, a2, -1059
                  sltu         tp, s10, tp
                  fmax.s       fs10, ft7, fs10
                  sub          a1, gp, a3
                  fmin.s       ft7, ft5, fa4
                  mulhu        s3, s7, t4
                  and          t6, s5, a0
                  fsgnj.s      fa3, ft5, fa3
                  fmax.s       ft5, ft0, fs3
                  slt          a6, t2, gp
                  fsgnjn.s     fa3, fs11, fs8
                  andi         s4, s8, -413
                  xori         t4, s7, -940
                  fsqrt.s      fs1, fa6
                  fsub.s       fs9, fs8, fs11
                  sltu         tp, s1, t5
                  mulhsu       t6, t3, s7
                  xor          tp, t5, a7
                  fmv.w.x      fa5, a4
                  sub          s3, a1, s8
                  sltu         a4, s0, sp
                  fcvt.s.w     ft2, a2
                  srli         a2, s9, 17
                  sra          tp, t2, a3
                  srai         a6, a4, 5
                  remu         a2, a2, t6
                  div          s3, a5, t6
                  fmax.s       fs9, fs9, fs5
                  fcvt.w.s     t2, ft7
                  fmul.s       ft9, fs11, ft11
                  nop
                  mul          s4, t3, s6
                  fmul.s       fs3, ft8, fs6
                  addi         a7, t4, -1159
                  slti         s5, t1, -1328
                  and          s4, s0, t4
                  mulh         s4, s7, t2
                  slt          a4, tp, a6
                  srli         s4, zero, 23
                  fsub.s       fs3, fs1, fs8, rtz
                  slti         t4, s7, -1540
                  sltu         a5, s10, s8
                  flt.s        s9, ft10, fs8
                  addi         s8, t5, 1581
                  srai         s1, t6, 2
                  srai         s9, t2, 2
                  lui          s4, 805092
                  xori         a1, t2, -328
                  flt.s        t0, ft0, ft3
                  sub          sp, s8, a5
                  fdiv.s       ft2, ft3, fa1, rdn
                  fsub.s       fa3, ft7, ft2, rmm
                  feq.s        t6, ft9, fs8
                  fmul.s       ft5, fs2, ft3, rmm
                  fcvt.s.wu    fs10, gp
                  add          a1, a3, zero
                  flt.s        tp, fa6, fa0
                  fsgnj.s      fs4, fs2, fs3
                  slt          a3, s11, t0
                  fcvt.wu.s    a4, ft4, rne
                  fclass.s     t0, ft9
                  sltiu        s8, t5, 767
                  fmax.s       ft0, ft11, fs5
                  remu         gp, s2, gp
                  sub          t3, a2, a6
                  slt          s5, s7, t6
                  sll          a0, t2, s10
                  fcvt.s.w     ft10, s7
                  fsgnjn.s     fs2, fs1, fs11
                  ori          t3, s10, 2022
                  auipc        zero, 469522
                  fcvt.s.wu    fa5, s2
                  fmv.x.w      a3, fa4
                  fsgnj.s      ft5, ft0, fs8
                  flt.s        s8, fs7, fa1
                  sltu         s4, zero, t4
                  fdiv.s       fa5, fa5, fs7
                  fadd.s       fs1, ft11, fs6
                  sltu         a0, s6, s8
                  fdiv.s       fa1, fs5, fs0
                  fmv.x.w      gp, fa6
                  sltu         zero, a4, s11
                  slt          t6, s7, ra
                  remu         s9, s9, a3
                  fsgnjn.s     fa5, ft3, fs11
                  fdiv.s       fs3, fa2, fa5
                  fsgnj.s      ft4, fs5, fa1
                  fsgnjn.s     fs1, fs2, ft6
                  mulh         a6, t1, s5
                  slti         s5, s8, 1245
                  fcvt.wu.s    t2, fa2, rdn
                  fsgnjn.s     ft10, ft2, fa7
                  feq.s        a3, ft3, fa3
                  mulh         s8, s2, t5
                  sra          s4, s8, a1
                  ori          s1, a4, -1848
                  add          s11, s0, s8
                  slt          t2, s3, s0
                  slt          a3, t3, t0
                  sltiu        s4, s9, 474
                  mulhu        sp, s3, t2
                  auipc        s9, 414930
                  fadd.s       ft5, ft2, ft10, rup
                  fle.s        a3, fa5, ft1
                  feq.s        s11, fs8, fa7
                  mulh         a5, a5, t1
                  fmul.s       fa4, ft8, fa5, rup
                  fmv.w.x      fa3, s8
                  fadd.s       ft3, ft8, ft10
                  auipc        s5, 52631
                  div          s5, a3, a0
                  ori          s4, a1, 1766
                  xor          a7, a3, t5
                  mul          ra, a0, a3
                  mulh         a2, s1, a0
                  flt.s        tp, fs1, fa6
                  sll          a7, s11, s3
                  lui          s11, 865097
                  fcvt.s.w     ft4, t4, rmm
                  add          t0, tp, t1
                  fmv.w.x      fa3, s9
                  fclass.s     a6, ft8
                  fsgnjx.s     fa4, fs7, fs5
                  or           sp, a1, tp
                  fcvt.w.s     s4, ft11
                  xor          s0, a2, t5
                  fsgnj.s      fa6, ft7, fs8
                  mulh         t3, zero, s4
                  and          zero, t0, s8
                  sra          s5, t1, t0
                  mulhu        s4, s2, t5
                  fmin.s       fs3, ft2, fs7
                  srli         a5, s9, 7
                  ori          t2, a5, -890
                  fcvt.w.s     t4, ft9
                  fadd.s       ft10, fa2, fa0, rup
                  remu         s6, tp, t2
                  remu         s1, t5, s10
                  slti         s3, s9, 1556
                  ori          a1, s6, -984
                  ori          zero, a3, -1461
                  slt          a1, s0, a2
                  lui          s1, 191173
                  fmv.w.x      ft4, a3
                  div          s3, t5, s5
                  mulh         s8, t6, a7
                  xor          t3, a6, t6
                  addi         a3, s5, 304
                  srai         gp, s0, 28
                  remu         s9, s4, a2
                  fle.s        s10, fs7, fs9
                  fsqrt.s      fa4, ft11
                  fsgnjx.s     fs5, ft2, fa2
                  sra          a1, ra, s11
                  fcvt.wu.s    s7, fs9
                  flt.s        s11, fs8, ft4
                  nop
                  sll          t2, t5, a2
                  fsqrt.s      fa6, fs7, rne
                  ori          a4, a5, 23
                  fcvt.w.s     t3, fa5, rup
                  fsgnj.s      ft0, ft5, fs6
                  srai         s1, a7, 9
                  fmul.s       fs8, ft10, fs10, rdn
                  nop
                  divu         s4, s11, t4
                  ori          a2, a4, -70
                  mul          s0, s2, t2
                  div          s1, sp, zero
                  srai         tp, a7, 22
                  andi         s6, s1, -499
                  sll          s0, s1, s1
                  andi         s3, t2, 53
                  auipc        a4, 280256
                  fmv.w.x      ft1, zero
                  fsgnj.s      fs3, fa1, fa2
                  flt.s        a6, ft7, ft0
                  fsgnjx.s     fs10, fs9, ft0
                  rem          s7, t0, t3
                  nop
                  srl          t2, s4, s4
                  fcvt.s.w     fs1, a4
                  or           tp, tp, tp
                  fsgnjn.s     ft6, fa3, fa2
                  mul          s8, s4, a1
                  fclass.s     s5, fa1
                  fcvt.wu.s    ra, fs8, rne
                  mulhu        a6, t6, s0
                  lui          ra, 220087
                  fclass.s     t6, fa4
                  sra          t2, a7, s2
                  auipc        s11, 731394
                  mulh         a7, sp, s7
                  nop
                  xor          s7, tp, s2
                  fsgnjx.s     ft5, ft6, fa6
                  slt          s5, sp, a1
                  srl          tp, s9, a4
                  flt.s        s0, ft2, ft5
                  fmul.s       ft11, fs4, ft7
                  fsqrt.s      ft0, ft6
                  fsgnjx.s     ft3, fs2, ft9
                  xor          s4, t3, t1
                  sltu         a7, t5, s0
                  remu         s4, t5, s8
                  slli         gp, s8, 13
                  fmax.s       fa3, fs6, fa0
                  mul          t6, s7, s10
                  sub          a2, s8, t4
                  fcvt.wu.s    s5, ft1, rne
                  slli         sp, s6, 17
                  flt.s        a7, fs9, ft11
                  fadd.s       fa6, ft5, fs9, rmm
                  div          t0, gp, s11
                  fcvt.s.w     fs0, t2, rup
                  srl          s1, a1, a6
                  fsgnjx.s     fa2, fa5, fs0
                  slli         a5, t1, 4
                  fmv.x.w      a5, ft9
                  fmin.s       ft7, fa7, fs5
                  fcvt.s.wu    fa3, tp
                  srli         s1, a7, 10
                  lui          a0, 360731
                  mulhu        gp, t1, t1
                  mulhsu       a2, a0, s1
                  slli         t3, a7, 25
                  fcvt.s.w     fa5, a3, rne
                  fclass.s     ra, ft9
                  xori         zero, t3, 1636
                  nop
                  fmax.s       fa5, fs4, fa3
                  mul          a2, s3, a7
                  feq.s        a4, fa3, ft4
                  lui          t4, 670626
                  sll          ra, t0, a6
                  lui          s8, 255634
                  addi         s9, s11, 1504
                  srli         s1, s5, 21
                  divu         t3, t6, a2
                  fmul.s       fa1, ft1, fs9
                  flt.s        a7, fs9, ft10
                  fmin.s       ft6, fs5, ft10
                  feq.s        a5, fa2, ft6
                  srli         s9, s9, 25
                  sub          s4, s3, s4
                  srai         s6, s6, 9
                  fmul.s       fs2, fa6, fs6
                  fmin.s       fa7, fa0, fs5
                  fcvt.s.w     fa4, sp
                  fmv.x.w      a6, fs11
                  andi         a1, a6, 2022
                  sra          a0, s7, s0
                  fle.s        a5, fs0, fa3
                  rem          s5, s0, t4
                  fmax.s       ft0, ft5, fs1
                  slti         t0, t6, -1047
                  fsub.s       ft3, fs6, fs11, rmm
                  divu         tp, t3, a4
                  sltiu        a5, zero, 382
                  fmv.w.x      fs10, t0
                  fsgnjx.s     fa4, ft5, fa4
                  fmv.w.x      ft10, s0
                  srl          t0, a6, s3
                  mulhu        a4, t5, t0
                  mulhsu       t6, a7, a2
                  slt          t6, s4, a1
                  fcvt.s.wu    fa5, s9
                  slli         a6, s11, 15
                  fsgnj.s      ft4, fa1, ft10
                  sra          s8, s11, t4
                  divu         a7, t1, t5
                  fclass.s     s8, ft7
                  andi         s7, tp, 81
                  slt          t3, s11, a0
                  fsgnjn.s     fa5, fa3, ft2
                  srli         s8, s4, 2
                  lui          t6, 1019797
                  fsub.s       ft2, fs2, fa3
                  fmv.x.w      a7, ft9
                  and          s7, zero, a0
                  xor          a2, t6, sp
                  sltiu        ra, s3, -431
                  sra          t6, a2, s2
                  fmin.s       fa7, fs1, ft11
                  rem          s11, sp, s5
                  div          s11, s0, s8
                  xori         a1, t1, 715
                  srl          t0, sp, zero
                  xor          tp, t3, a6
                  fdiv.s       fa5, fs2, fa5
                  fle.s        s5, fs6, fa7
                  mulhu        s9, a7, a0
                  fmv.x.w      s6, ft2
                  srl          s3, sp, ra
                  remu         s3, a3, t2
                  mul          t3, sp, s1
                  xori         a4, a4, 1003
                  lui          s1, 237353
                  fsgnj.s      ft9, fs10, fa7
                  fmv.x.w      s11, fa1
                  sltu         a3, gp, a4
                  sra          s4, t1, s2
                  fsgnj.s      fa0, fs6, ft9
                  sltu         s11, a1, a0
                  fsgnjx.s     fa5, ft5, ft3
                  slti         ra, s1, 687
                  sltiu        zero, s10, -1898
                  fsgnj.s      ft2, ft5, fa6
                  sra          s10, s3, t2
                  fclass.s     t3, fs11
                  srli         t0, t0, 28
                  fsgnjx.s     fs2, ft6, ft10
                  andi         s11, s1, -794
                  xor          t0, a6, t3
                  divu         zero, s6, s9
                  andi         a7, s11, 957
                  slli         ra, tp, 9
                  feq.s        ra, fa2, fs7
                  xori         t0, a2, 303
                  mulh         s9, s6, a5
                  fcvt.w.s     a4, ft6, rtz
                  sltu         t4, a2, a6
                  feq.s        t2, fs3, fa4
                  addi         a6, a7, 2031
                  xori         s10, a3, 378
                  srl          t2, a2, ra
                  mulhsu       s7, t1, gp
                  fle.s        t0, fs4, fs9
                  sra          a7, a5, t5
                  fsgnjn.s     ft6, fa2, fs11
                  sra          s11, tp, a7
                  fsgnjx.s     fs9, fs3, fs6
                  xori         s3, gp, 442
                  sub          a6, sp, s9
                  divu         s0, s6, a0
                  feq.s        a7, fa2, ft3
                  addi         a7, s6, -392
                  sltu         s6, s5, t0
                  mulhu        s8, ra, s8
                  and          t2, a2, s8
                  flt.s        a2, ft11, fa6
                  mul          a6, s3, s11
                  mulhu        a1, a7, s6
                  sra          tp, t4, t6
                  and          s0, s9, s2
                  mulhsu       a2, t1, t6
                  xor          s10, t4, tp
                  ori          a5, s3, 1159
                  sltu         a5, s7, s8
                  fsqrt.s      ft0, ft10
                  andi         a6, t2, 537
                  fmax.s       fa6, fa3, fs5
                  or           ra, tp, s8
                  nop
                  fmul.s       fa5, ft5, fs1, rup
                  mulh         a2, a7, s9
                  sra          s5, a0, a4
                  fmul.s       fs9, fa0, ft1
                  xor          a1, a4, s11
                  fsqrt.s      fs10, fa6, rdn
                  divu         gp, s4, s1
                  mulh         s11, s11, a7
                  add          t3, a6, a7
                  auipc        a4, 986064
                  slli         t2, t5, 22
                  and          sp, t3, sp
                  xori         s3, s3, 627
                  fcvt.w.s     a3, fs3
                  fmv.x.w      gp, fs1
                  fmin.s       ft0, fa4, fs6
                  addi         t2, t4, 1942
                  mulhu        a4, ra, a0
                  sra          t3, sp, gp
                  fcvt.w.s     s8, fs1, rmm
                  fmax.s       fa3, fs4, fs3
                  flt.s        s8, ft10, ft7
                  fmul.s       fa3, fa5, fs1, rmm
                  flt.s        s5, ft1, fs0
                  xori         tp, s6, 920
                  srli         a2, a0, 18
                  mulh         a3, s3, a0
                  fsub.s       ft5, ft5, ft7, rdn
                  sll          t0, t5, t0
                  mulhu        s10, s10, a1
                  sub          s8, a1, s0
                  fmv.x.w      sp, ft5
                  fcvt.s.w     fs7, s7, rtz
                  fmv.x.w      zero, fs11
                  and          zero, s5, t6
                  fcvt.s.w     ft5, s8
                  xori         t0, s4, 1116
                  fclass.s     a0, ft1
                  fsqrt.s      fs7, fs6
                  nop
                  fcvt.w.s     a0, ft1, rdn
                  xori         sp, t0, 772
                  flt.s        a7, fs1, fs1
                  div          s5, s2, a0
                  sra          a6, s5, s3
                  div          s4, tp, ra
                  fmv.w.x      fs4, a6
                  sltiu        a3, t5, 1672
                  sll          s3, s2, s10
                  slt          a0, a6, a4
                  srl          tp, t6, a0
                  remu         tp, gp, zero
                  xori         s1, a6, 1914
                  rem          a6, a7, gp
                  srl          s3, s11, s0
                  feq.s        zero, fs7, ft0
                  sra          s1, a4, s5
                  fclass.s     s1, fs8
                  fmv.w.x      fs9, t0
                  addi         t6, s8, 1169
                  fmin.s       ft4, fa6, ft6
                  lui          a1, 712141
                  fsqrt.s      ft8, ft10, rdn
                  addi         s4, a1, 1029
                  addi         a3, zero, 134
                  andi         t4, t0, -2000
                  addi         s5, s6, 1424
                  mulhu        a7, tp, t2
                  fsgnjn.s     fs11, fa7, ft5
                  sltu         s10, s6, a6
                  srli         a5, s3, 7
                  fcvt.s.w     fs11, a6
                  sra          sp, tp, t6
                  srai         a7, t3, 28
                  fsgnj.s      ft1, fa2, fs8
                  fmv.x.w      s7, ft9
                  ori          s5, s8, 1678
                  fmax.s       fa7, fs7, fs2
                  mul          t2, ra, s3
                  and          a6, a6, t0
                  xor          s6, s6, t2
                  and          t3, t4, a5
                  srl          ra, s1, a2
                  remu         a1, s6, s5
                  srl          s8, a0, ra
                  mulhsu       tp, s6, t1
                  fclass.s     s8, ft10
                  fmul.s       fa7, fs0, fs8
                  sltu         t0, t4, zero
                  fclass.s     s3, fs5
                  fsub.s       fa4, fs2, ft8, rne
                  xor          a1, a3, gp
                  feq.s        t6, ft2, fa2
                  fmv.x.w      a1, fa1
                  fsqrt.s      ft2, ft1
                  fsgnjx.s     fs4, fs9, fs11
                  mulhu        s3, a0, a1
                  fle.s        s8, ft0, ft8
                  fmv.w.x      ft1, s1
                  sll          gp, ra, s7
                  fclass.s     sp, fs9
                  xor          s11, a0, a3
                  xori         s8, gp, -1503
                  sub          a1, sp, sp
                  feq.s        s10, fa5, fs4
                  srl          s1, s4, a0
                  nop
                  fsqrt.s      fs4, fa0
                  div          s9, s5, s2
                  slti         zero, a1, 1818
                  div          s0, s4, s1
                  fcvt.w.s     t2, fa7, rmm
                  mulhsu       a6, s4, t5
                  rem          zero, a3, t6
                  remu         s4, s6, s10
                  fsgnj.s      fa5, ft9, fs10
                  fle.s        a1, fs9, fs0
                  lui          s4, 665302
                  sll          a2, a1, s9
                  sra          a6, s0, s11
                  nop
                  fadd.s       fa0, fa2, ft2
                  slli         s4, t2, 1
                  fmv.w.x      ft4, a5
                  fcvt.w.s     a4, fs4, rmm
                  mulhsu       a0, sp, a4
                  fcvt.wu.s    s11, ft10
                  fadd.s       ft1, ft6, fs2
                  slt          a7, s3, a5
                  andi         tp, zero, -71
                  nop
                  srai         a1, a5, 19
                  divu         s11, a1, s4
                  nop
                  and          a0, t4, s4
                  add          s6, a3, t3
                  fmv.x.w      s8, fs8
                  fadd.s       ft0, ft3, ft4
                  sra          a6, t0, s10
                  slt          a1, s6, t6
                  remu         t6, t1, tp
                  fcvt.w.s     s8, fs3, rup
                  sra          s7, ra, t0
                  fsgnjn.s     fs5, fa0, fs9
                  slti         s10, s9, -1414
                  slt          s11, a7, ra
                  sub          t2, a1, a2
                  add          s9, a7, s1
                  fcvt.w.s     zero, fs4, rdn
                  fclass.s     t2, ft6
                  fsqrt.s      ft1, fs4
                  srl          sp, s5, a4
                  ori          s10, a5, 1451
                  nop
                  slti         tp, s11, 1957
                  sltiu        tp, zero, -920
                  div          a6, s10, s7
                  fmul.s       fa0, ft0, ft6
                  rem          s0, a0, a6
                  fsgnjn.s     fs11, fs0, fs4
                  fmax.s       fa2, fa2, fs9
                  fadd.s       fs4, fs10, ft0
                  fsgnjn.s     fs8, fa6, fs2
                  sltiu        t2, s5, -1374
                  fmv.w.x      ft7, t0
                  add          s6, s10, gp
                  srai         tp, s6, 18
                  fsgnj.s      ft3, ft4, fs4
                  sub          a7, zero, a4
                  fsub.s       fa6, fs10, ft8, rmm
                  auipc        a1, 839847
                  fsgnjx.s     ft5, fs10, ft4
                  fadd.s       ft4, fs9, ft5
                  sra          t2, s9, a4
                  mulhsu       a3, a7, ra
                  and          a5, t3, s0
                  fmv.w.x      fs7, s5
                  fmul.s       fa1, fa7, fs5
                  sltiu        s6, s0, 924
                  addi         t2, t5, -1390
                  fsqrt.s      ft5, fs6
                  sll          s8, s1, a2
                  sltiu        a0, a1, 1493
                  and          gp, a6, sp
                  ori          s11, s3, 1417
                  fcvt.wu.s    t0, fs0
                  and          gp, a0, t6
                  flt.s        a0, ft6, fs11
                  mulh         s7, t4, t0
                  mulh         t6, s0, s7
                  fsgnjn.s     ft7, fs1, ft9
                  fsgnj.s      ft4, ft9, ft8
                  xori         ra, a0, 948
                  and          zero, s6, ra
                  rem          s11, a7, s3
                  xor          a4, s9, a1
                  sra          s11, sp, s1
                  fcvt.wu.s    a5, ft3, rne
                  nop
                  fclass.s     a7, fa3
                  srli         gp, a2, 25
                  slt          s3, t5, s0
                  fmul.s       ft2, fa6, fa4, rmm
                  mulhsu       t4, t5, t0
                  fmul.s       fa6, ft2, fs6
                  auipc        s6, 774118
                  fclass.s     t0, fa2
                  nop
                  mulhu        s1, s9, a1
                  rem          s5, a3, gp
                  fsgnjn.s     fs9, fa0, ft6
                  fcvt.s.wu    fa4, a0, rdn
                  mulhu        t3, zero, s1
                  fsgnjn.s     ft9, ft6, ft9
                  addi         s10, t0, -950
                  fcvt.w.s     s5, fs4
                  fsub.s       fs8, ft8, fs0, rtz
                  fmin.s       fs4, fa0, ft6
                  sub          s4, s8, tp
                  slli         t4, zero, 23
                  fmin.s       fs10, fa7, fs1
                  fsgnjn.s     ft0, fa0, fs3
                  fcvt.s.w     fs4, ra, rtz
                  fsub.s       fa6, ft3, fs11, rmm
                  fmv.w.x      ft7, s11
                  srli         a2, a1, 14
                  mul          s0, ra, ra
                  fdiv.s       fa7, fs8, fs4
                  fsqrt.s      fs5, fs7, rup
                  fsub.s       fs0, fs3, fa2, rtz
                  fcvt.s.wu    ft0, a7
                  flt.s        t3, ft11, fa1
                  fcvt.s.wu    fa3, s5, rne
                  fmv.w.x      fa6, s9
                  fcvt.w.s     s5, fa1
                  sll          s11, s7, t6
                  fclass.s     t2, ft7
                  add          s8, s8, zero
                  fadd.s       ft7, fs10, fa3, rup
                  slt          s11, s2, s4
                  add          t4, t5, sp
                  fmv.w.x      fs6, s6
                  fsgnjn.s     fa4, fa7, fs5
                  slli         s11, t4, 19
                  divu         tp, a6, a2
                  mul          s7, s10, a5
                  fcvt.w.s     s5, fs7
                  fclass.s     s5, fs1
                  xor          t4, s10, a5
                  slli         sp, s3, 5
                  slli         s7, a2, 6
                  and          s4, a3, s11
                  fadd.s       fa6, fa3, fa1
                  and          a3, a5, t6
                  fsqrt.s      fs1, fs9
                  fle.s        s3, ft7, fs10
                  andi         a6, a7, 1265
                  srai         t3, tp, 21
                  remu         t3, a1, tp
                  sub          s11, a3, a5
                  mulhu        s7, sp, t1
                  fle.s        t4, fa1, fa0
                  and          ra, gp, s6
                  fclass.s     t0, ft0
                  mulh         t3, s8, s7
                  andi         t4, s5, -1574
                  fcvt.wu.s    a1, fa1, rne
                  sra          a6, s0, s3
                  fmul.s       fs4, fa3, fs2
                  auipc        a7, 947929
                  divu         s9, s2, sp
                  fmv.x.w      s10, fs2
                  fsub.s       ft1, fs3, fs3, rmm
                  andi         s5, a1, -1212
                  mulhu        a2, t3, a6
                  fcvt.s.w     fs7, a5, rdn
                  fle.s        s0, fa6, ft3
                  xor          a0, t0, s10
                  xor          gp, s1, a3
                  nop
                  sll          a5, a6, a1
                  addi         a6, s6, 1231
                  fsgnjx.s     fs2, fs2, fs10
                  fmax.s       fs3, ft2, fs2
                  div          a6, s11, zero
                  fadd.s       ft4, fs8, ft6
                  srli         a6, gp, 31
                  fsgnj.s      fs6, fs3, ft9
                  fclass.s     s10, ft8
                  ori          sp, a7, 379
                  lui          a6, 146890
                  nop
                  mulhu        s10, a0, t6
                  fdiv.s       ft0, fs11, fa6
                  srli         a2, t6, 12
                  andi         s11, s5, -235
                  srai         t3, a5, 31
                  slli         s10, s0, 3
                  fmul.s       ft7, ft9, ft2, rmm
                  sra          sp, s9, a1
                  flt.s        s4, ft4, ft11
                  srli         a5, s9, 22
                  fmv.w.x      fs8, s6
                  mulh         a0, a3, a7
                  flt.s        a1, ft2, fs7
                  xori         s0, a6, 1564
                  fcvt.s.w     fa4, t5, rup
                  div          a5, s4, zero
                  fsub.s       ft3, fs6, fa6
                  fmv.w.x      fs11, sp
                  add          zero, s4, t3
                  fsgnjn.s     fs3, ft3, ft0
                  fmv.w.x      fs6, t4
                  fmv.w.x      fa6, a4
                  fcvt.wu.s    a4, fs9, rne
                  div          tp, s5, t0
                  and          a3, s3, t3
                  rem          s4, zero, s5
                  sltu         a7, t5, t6
                  fmax.s       fs3, fa2, fs6
                  flt.s        zero, fa2, fa7
                  xor          s10, t1, s0
                  sltu         a4, s5, t2
                  fsgnj.s      fa1, fa7, fa6
                  sltu         a6, t6, t5
                  fcvt.wu.s    t0, fs9, rne
                  srai         t0, t1, 30
                  remu         a5, tp, t5
                  slli         ra, a5, 14
                  sltiu        gp, zero, -522
                  fmul.s       fa1, fa1, fs4
                  fmax.s       ft7, fs11, fa7
                  lui          s7, 500844
                  rem          a0, s0, s1
                  sra          a2, s4, t4
                  and          ra, s0, s5
                  fmv.w.x      fs10, sp
                  fsgnjx.s     ft6, ft3, ft7
                  xor          a0, s7, t3
                  mulhsu       t3, s4, gp
                  fcvt.s.w     fs2, s11, rdn
                  srl          tp, s2, zero
                  srli         a2, a1, 9
                  div          tp, a7, t6
                  div          t2, t5, t6
                  add          s5, s7, s0
                  fcvt.w.s     t3, ft4, rne
                  remu         sp, s0, a2
                  srl          zero, a3, a2
                  srai         t6, a3, 26
                  remu         zero, s6, s5
                  sltiu        s0, s6, 1540
                  divu         s3, s6, a4
                  feq.s        gp, fa0, fs9
                  flt.s        s7, fa6, fa0
                  xori         s0, sp, 1370
                  fmv.w.x      fa6, zero
                  fmul.s       ft0, fa5, ft6
                  fsgnj.s      fa4, ft10, ft8
                  andi         a6, s4, 849
                  fmul.s       ft0, fs9, ft0
                  fmax.s       ft4, fs6, ft8
                  fadd.s       ft0, fs7, ft0
                  fcvt.s.wu    fs4, a7
                  divu         a4, gp, s6
                  mulhsu       s8, gp, zero
                  fsqrt.s      fa1, ft1
                  fsqrt.s      fs2, ft9
                  lui          a5, 556197
                  sltu         t3, s11, s6
                  fcvt.s.w     fa6, s11
                  rem          s9, a5, t2
                  fcvt.s.w     fa4, s11, rup
                  sra          t4, s11, a7
                  sltu         sp, s6, ra
                  slli         t4, sp, 8
                  srli         a6, s10, 26
                  addi         s9, a4, -1113
                  sub          s9, a4, s2
                  andi         s3, a4, 659
                  slt          zero, t6, zero
                  slti         a3, s8, -829
                  sra          a2, t5, a0
                  srai         s11, s4, 30
                  srl          a2, ra, s1
                  fmv.x.w      t4, ft8
                  srai         a6, s2, 24
                  fmul.s       fa1, fa2, fa7, rdn
                  fcvt.s.wu    fa0, sp, rne
                  flt.s        s0, fa7, fa0
                  srai         s3, s3, 28
                  mul          a2, t5, t2
                  fcvt.s.w     fa3, t1
                  slt          tp, zero, s9
                  auipc        a1, 160982
                  xori         t3, s6, 430
                  fsub.s       fs10, fs3, fa7, rdn
                  fmin.s       ft6, fa2, ft0
                  slli         t2, gp, 0
                  mulhu        s3, s10, t3
                  fdiv.s       fa3, fs0, fs0
                  or           s11, tp, t5
                  divu         a0, s2, t2
                  slt          s9, t6, s8
                  fmv.w.x      fa7, s2
                  auipc        tp, 1017048
                  xori         t6, sp, 1409
                  fadd.s       fa6, fa3, ft11, rtz
                  xori         a3, sp, -1835
                  fsgnj.s      ft10, fa7, fs3
                  mulhu        ra, a4, a3
                  fmv.w.x      ft7, t1
                  or           t0, zero, s0
                  fmax.s       ft0, ft5, ft7
                  andi         sp, t2, 1482
                  mulhsu       t6, s9, s7
                  sltu         t4, s7, s3
                  sll          ra, a1, gp
                  andi         zero, ra, -1088
                  fmv.w.x      fa5, t4
                  fsgnjn.s     fs9, ft10, fs10
                  fmv.w.x      fs5, s3
                  slli         a0, s4, 8
                  auipc        s6, 683157
                  fsgnjn.s     ft1, fa7, ft4
                  rem          a6, a1, tp
                  mulhsu       s4, a7, ra
                  fclass.s     ra, fa5
                  fsgnjn.s     fa6, fs8, fs8
                  fsgnjn.s     fs9, fa5, fs1
                  fdiv.s       ft5, fa2, ft3, rne
                  sltu         s6, a6, s3
                  fdiv.s       ft0, fs9, fs1, rne
                  mulhu        ra, s3, t5
                  fdiv.s       fs10, ft5, fa1
                  auipc        a0, 830278
                  fmin.s       fs1, fa1, fa6
                  fsgnjx.s     ft10, fs11, fa3
                  sub          a6, s2, s6
                  fmv.w.x      ft8, s2
                  fclass.s     s6, fa3
                  fadd.s       fs2, ft6, ft4
                  slt          s3, s10, t0
                  fle.s        s10, ft3, fs3
                  lui          s11, 826422
                  fcvt.s.w     fa4, s9
                  slti         sp, s8, -815
                  or           s11, a7, s4
                  fmv.x.w      sp, ft0
                  slti         gp, tp, -181
                  slli         s9, s0, 1
                  and          t3, s8, s4
                  andi         sp, s4, -1096
                  sltu         s7, zero, a4
                  or           s4, s6, a4
                  fle.s        s9, fs10, fa6
                  fmax.s       fs8, fs10, ft7
                  srli         s8, s3, 17
                  sltu         s0, a1, t4
                  xori         t3, a1, 737
                  xor          a6, a5, a5
                  fsqrt.s      fs0, fs1
                  nop
                  lui          s9, 817635
                  mulh         s4, s1, ra
                  feq.s        ra, ft5, ft10
                  fle.s        a7, fa3, fs1
                  mul          s5, t5, s11
                  fsqrt.s      ft8, ft7
                  sra          s7, t2, t5
                  flt.s        s5, fa2, fa3
                  fcvt.w.s     a3, fs2, rne
                  sltiu        tp, s6, 298
                  fmin.s       ft3, fa2, fs10
                  ori          sp, t5, 1271
                  fdiv.s       fs4, fs1, ft6
                  fcvt.w.s     zero, fs0, rmm
                  feq.s        s3, ft7, fs7
                  fcvt.s.wu    ft1, a4
                  rem          s8, zero, s11
                  xor          s4, t0, t1
                  xori         t3, s1, 1242
                  rem          s3, a2, zero
                  rem          s5, s10, ra
                  srli         s11, s10, 1
                  srai         t4, gp, 1
                  fsqrt.s      fs5, fs7
                  mul          t3, t5, t5
                  slti         tp, a3, -886
                  remu         a5, s5, a2
                  and          s10, t0, gp
                  srli         zero, t0, 18
                  fcvt.wu.s    t0, ft4
                  auipc        s6, 1042781
                  fdiv.s       ft6, fa4, ft3
                  addi         a2, ra, -555
                  flt.s        a2, ft0, ft8
                  add          s4, a7, t3
                  fsub.s       ft11, fs5, fa4, rup
                  fsgnjx.s     ft2, fa2, fs9
                  fdiv.s       ft11, ft1, ft4
                  nop
                  fmv.x.w      s10, ft3
                  divu         a4, s7, s9
                  fcvt.wu.s    a6, ft4, rmm
                  fcvt.s.wu    fs3, s0, rne
                  sll          s4, t5, tp
                  fle.s        ra, ft3, fa7
                  fsgnjn.s     ft4, fa6, fa6
                  sltiu        t4, s11, 87
                  mulhu        a3, a2, s1
                  feq.s        a4, fs4, ft4
                  srai         a4, t3, 5
                  andi         s9, a1, -12
                  mul          a5, t3, s10
                  slt          s0, gp, s7
                  fadd.s       fs0, fs2, ft8
                  slti         ra, ra, -907
                  srl          s5, sp, s11
                  lui          s6, 296500
                  fmv.x.w      t0, ft0
                  sub          s3, ra, s11
                  fmul.s       fs1, fa4, ft8
                  sltu         s5, a0, t2
                  lui          a0, 780494
                  feq.s        s4, fs8, fa2
                  mul          ra, gp, s10
                  flt.s        s4, fa0, ft0
                  mulhsu       s8, a3, a0
                  xor          t6, s7, ra
                  feq.s        gp, ft11, ft4
                  fdiv.s       fs8, fs6, fa4, rdn
                  add          zero, s11, s1
                  fsgnj.s      fa2, ft5, ft4
                  auipc        ra, 910808
                  fdiv.s       ft10, fa2, fa3, rup
                  mul          s9, a7, a7
                  fdiv.s       fs2, fs5, fs11, rne
                  fmul.s       ft5, fs3, fs11
                  slt          s5, a7, t6
                  and          s11, s9, s3
                  slli         s7, s3, 11
                  and          zero, a3, s8
                  and          s11, a3, a1
                  fsub.s       fs4, ft5, fa4, rmm
                  fmax.s       fa7, ft11, fa2
                  fle.s        s4, ft3, ft10
                  fsub.s       fa3, fa4, ft2
                  sub          a1, tp, s1
                  fmv.x.w      t4, ft11
                  sll          s4, zero, s9
                  or           s1, zero, t3
                  fcvt.s.w     fa4, s10
                  flt.s        s6, ft2, ft10
                  fclass.s     a5, fs0
                  nop
                  fmv.x.w      t4, ft5
                  rem          t0, s1, t6
                  remu         s10, t4, sp
                  addi         s8, zero, -1377
                  fmax.s       fa3, ft3, fs4
                  fsgnjx.s     fa5, fa4, fa5
                  slli         s4, a0, 14
                  div          sp, sp, a7
                  fmin.s       fs4, ft9, fa0
                  slt          t6, s3, s11
                  xori         a7, a6, -1530
                  sltiu        s0, t4, -1699
                  fcvt.s.wu    ft2, s4
                  fmax.s       fa3, fs2, fs0
                  fmv.x.w      t6, fs2
                  div          s3, a6, s4
                  mul          s5, t2, a3
                  fadd.s       ft8, fa3, fa0
                  or           s11, a5, s1
                  sltu         s6, a7, zero
                  sub          t3, zero, s5
                  sub          t2, tp, a6
                  fsqrt.s      ft5, fs4, rup
                  sra          t3, s1, t5
                  fclass.s     s10, ft3
                  fcvt.s.wu    ft1, gp, rtz
                  fmin.s       ft6, ft9, ft2
                  flt.s        t2, ft1, ft3
                  fcvt.w.s     s6, fs11, rtz
                  mulh         s0, t0, s5
                  mulh         s10, t0, t1
                  ori          s0, s7, -1664
                  mulh         a5, a0, ra
                  add          s4, s7, tp
                  nop
                  auipc        s1, 526947
                  or           a7, a2, s8
                  sub          s1, s6, zero
                  srai         tp, s0, 8
                  div          s8, a4, a6
                  remu         a4, a4, a0
                  fsgnj.s      fa0, fa3, ft6
                  sltu         t2, t5, a6
                  mul          t2, s2, a1
                  sra          s9, a5, t3
                  fcvt.s.w     ft6, s9, rne
                  addi         s5, a2, 1641
                  slli         gp, s3, 25
                  addi         a2, s6, -532
                  ori          s11, s6, -324
                  fcvt.s.wu    fs4, a7, rdn
                  fdiv.s       fa6, fa2, ft4
                  slti         a1, s1, -1798
                  fsgnjn.s     ft9, ft8, fs1
                  rem          s4, a0, t2
                  mul          s7, s1, s10
                  feq.s        a5, fs3, ft9
                  and          tp, s5, a5
                  fclass.s     a2, fs1
                  mul          t6, a5, t5
                  sub          a5, s5, ra
                  fcvt.s.wu    fs3, a6
                  rem          s3, t2, s2
                  fsgnjx.s     fs10, fs4, fs5
                  fadd.s       fs7, ft4, ft8, rtz
                  srl          a3, s8, s11
                  fadd.s       fs9, ft8, ft4
                  fcvt.w.s     a1, ft4, rdn
                  fmul.s       ft10, fa2, ft7
                  fclass.s     tp, fs7
                  remu         tp, s11, s11
                  sltu         gp, s8, t2
                  div          a0, t3, s10
                  fadd.s       fa7, fs4, ft10
                  remu         sp, s11, s11
                  fcvt.s.w     fs0, t5
                  fcvt.wu.s    a7, fa0
                  and          s7, a5, t3
                  remu         s10, t6, zero
                  feq.s        s8, ft1, ft3
                  mulh         ra, a2, a7
                  feq.s        tp, fs7, ft6
                  fmin.s       ft7, fs6, ft4
                  sltiu        a5, s5, -529
                  flt.s        s8, fs4, fs7
                  slt          s3, s7, tp
                  auipc        s4, 188621
                  fcvt.w.s     s1, fs0
                  fle.s        t0, fa5, fs4
                  fmv.x.w      t0, fs6
                  fmul.s       fs8, ft5, ft7
                  div          a1, a5, t3
                  mulhu        t6, t3, a5
                  nop
                  sltu         s0, s6, s2
                  slt          ra, gp, a4
                  fcvt.w.s     s6, ft5, rmm
                  sltu         a2, a0, t5
                  fdiv.s       fs4, fs3, ft8
                  div          a6, ra, a0
                  fcvt.s.wu    ft7, tp
                  fmax.s       ft10, ft5, fs9
                  fmv.x.w      a1, fs4
                  mulh         s8, gp, a7
                  fmv.x.w      t6, ft7
                  and          s7, sp, s3
                  add          s3, t2, t2
                  sll          s7, a7, a1
                  auipc        sp, 828865
                  fsgnjn.s     fa3, ft8, ft4
                  sltiu        s0, s8, 1914
                  xori         tp, s11, -1680
                  fsgnjn.s     fa3, fa2, ft0
                  mul          sp, s8, a4
                  fcvt.s.w     fa7, s0, rdn
                  slti         gp, gp, 498
                  fsgnjn.s     ft1, fa6, fs5
                  slli         s10, a5, 31
                  feq.s        a6, ft8, ft6
                  sltiu        a4, t3, 1412
                  slt          t3, a1, s7
                  fmin.s       fa4, ft1, fa1
                  fmv.x.w      gp, ft9
                  add          t3, s5, s1
                  remu         s6, s2, s6
                  srl          s7, t5, zero
                  and          s1, sp, s11
                  remu         a0, a4, gp
                  fsub.s       ft1, fa7, fs1, rmm
                  xori         s4, t4, 1039
                  fsub.s       ft5, ft3, fs6, rne
                  sll          s9, ra, a0
                  srai         zero, t5, 19
                  fclass.s     t2, ft6
                  flt.s        t4, fs3, ft9
                  sltiu        sp, s3, 668
                  add          tp, t1, s3
                  slti         s0, s9, 78
                  mulhsu       a0, s9, t4
                  sltu         a6, a6, t4
                  remu         t6, t3, s0
                  fsub.s       fs9, fa2, fs5, rup
                  add          a7, ra, a4
                  xori         s6, t0, -1004
                  xori         s11, s11, 121
                  fsqrt.s      fa2, fa4, rtz
                  add          a5, a4, ra
                  fle.s        t6, fa4, fa2
                  mulhu        s9, a5, a0
                  or           a0, t1, s9
                  divu         s9, t3, s10
                  andi         s8, t4, -14
                  fsub.s       fs2, ft11, ft1
                  ori          s0, a3, 109
                  fsgnjx.s     ft4, ft5, fs8
                  fmul.s       fs9, fs4, fs6
                  remu         a2, a6, s10
                  fsgnjx.s     fa1, ft2, fs8
                  fsub.s       fs8, ft3, fs1, rmm
                  andi         a5, s1, 1287
                  ori          t3, zero, -1061
                  addi         s0, t4, -411
                  flt.s        t2, fs1, ft4
                  fmin.s       ft7, fs11, fs9
                  fmin.s       ft3, fs3, fa1
                  flt.s        s11, fs6, ft0
                  sra          sp, a6, s11
                  mulhsu       a0, a2, t0
                  srl          t3, t1, a6
                  mulh         a1, s10, s7
                  and          gp, a7, a4
                  or           t3, s3, t2
                  slt          s3, gp, a5
                  fmv.x.w      t3, ft6
                  add          t6, a2, tp
                  slti         s7, a3, 998
                  feq.s        sp, fa4, fs9
                  fsgnjn.s     ft4, fa1, fa6
                  fadd.s       fa6, fa3, ft1
                  fle.s        t0, fs8, fa3
                  fmax.s       fa5, fa4, fs8
                  fmin.s       fa3, fs0, fa5
                  fsgnjn.s     ft7, ft11, fs3
                  remu         s8, s9, s7
                  fsgnjn.s     fa4, fa5, fs3
                  fclass.s     ra, ft0
                  rem          t3, a4, a2
                  fadd.s       fs8, fa2, fs0
                  fadd.s       ft4, fs7, fs8
                  slt          s7, s8, a2
                  xor          a3, t6, t6
                  mulhsu       s8, sp, s1
                  auipc        a3, 345787
                  xor          a1, a3, s9
                  srli         a3, s2, 9
                  auipc        sp, 793335
                  sltiu        tp, a2, 1452
                  fmin.s       fa7, fs8, ft7
                  fcvt.s.w     fs9, sp
                  remu         a1, s1, t6
                  sltu         a3, a4, zero
                  fmax.s       fs4, ft9, fs1
                  srli         a2, ra, 15
                  fsub.s       fa2, ft10, ft5
                  fcvt.s.wu    fs2, a6, rdn
                  fcvt.w.s     s7, ft6, rmm
                  slti         a0, t6, 1334
                  fmv.x.w      s0, ft4
                  srl          ra, s6, a2
                  add          a0, s4, t2
                  flt.s        a2, ft6, fa3
                  add          s6, a4, s1
                  mulh         a3, t2, zero
                  add          t2, a4, s4
                  xori         s11, s10, -419
                  add          ra, s11, t6
                  sub          zero, ra, s4
                  rem          t6, t0, s6
                  fmax.s       fa5, fs7, fs6
                  feq.s        ra, fs3, ft10
                  fcvt.s.wu    ft7, t2, rtz
                  mulhu        sp, a6, ra
                  xor          a6, s8, zero
                  and          s1, t6, t1
                  fsgnj.s      fs10, fs6, fa0
                  auipc        s10, 189227
                  remu         t6, s1, s10
                  andi         s8, a6, -1878
                  srai         s8, s9, 22
                  fdiv.s       ft11, ft2, ft7, rtz
                  and          t4, s8, s0
                  auipc        s11, 894075
                  andi         s1, t3, 122
                  slli         s9, s5, 21
                  auipc        tp, 693468
                  fcvt.s.w     ft11, s7
                  slli         t0, s1, 25
                  sra          a5, sp, sp
                  feq.s        ra, fs6, ft10
                  fcvt.s.w     fa6, a0, rmm
                  fcvt.s.wu    fa7, gp, rne
                  lui          tp, 173983
                  srl          t4, zero, t1
                  fcvt.s.wu    fa4, s9, rtz
                  fsgnj.s      fa6, fs8, fs5
                  mulhsu       t4, sp, s8
                  fcvt.w.s     s11, ft1
                  slt          s9, sp, sp
                  divu         t2, s2, a3
                  fmv.x.w      a0, fa1
                  rem          s5, s5, a6
                  slti         s4, a0, 62
                  slti         sp, t6, -1271
                  mulh         gp, a4, a7
                  flt.s        s10, fa2, ft2
                  srai         t6, a5, 10
                  fsgnjn.s     fs6, fs9, fa7
                  fmv.w.x      fa4, s10
                  slt          gp, a7, s8
                  fcvt.w.s     a5, fs6
                  fmin.s       fa6, ft10, ft1
                  or           s6, s0, s11
                  flt.s        s11, fs9, fa0
                  fsub.s       fs8, fa4, fs5
                  rem          t6, a3, t4
                  fcvt.s.w     fs4, a2
                  flt.s        s7, fs3, fs9
                  xori         a4, a6, 104
                  fcvt.s.wu    fs0, tp, rup
                  fmv.w.x      fs11, s4
                  mulhu        s4, a5, sp
                  fmax.s       ft6, ft6, fa3
                  sub          s5, t0, a2
                  mulhu        s11, s5, t1
                  xori         t2, s2, 158
                  fdiv.s       fs7, fa3, fs9
                  nop
                  and          a5, s8, a1
                  fmin.s       fa3, fs2, ft10
                  mulh         s0, zero, s11
                  or           a1, t4, a0
                  fsqrt.s      ft2, ft7
                  fcvt.w.s     s7, fs10, rtz
                  lui          sp, 389483
                  div          s0, s3, a1
                  fmv.x.w      a2, ft4
                  srl          a4, s9, s8
                  or           ra, s1, sp
                  and          s7, a4, a7
                  fclass.s     a0, fs11
                  xori         s1, s3, -203
                  andi         s7, s11, 2002
                  nop
                  fadd.s       fa4, ft6, fs5, rup
                  mulhu        s0, a0, s6
                  addi         s10, a4, 701
                  flt.s        a2, fs3, ft6
                  fcvt.wu.s    a7, ft9
                  auipc        t4, 445141
                  remu         s7, t3, t2
                  sra          s9, t2, s5
                  auipc        s3, 918411
                  fadd.s       fs3, fs7, ft7, rdn
                  fsgnjx.s     ft8, fs5, ft11
                  feq.s        t0, fs4, fa3
                  feq.s        a2, ft6, ft6
                  remu         s10, tp, a2
                  sltiu        s6, a5, 788
                  fmv.w.x      fa1, s6
                  fcvt.wu.s    s9, ft9
                  sltu         gp, s6, s6
                  flt.s        t3, fa1, ft1
                  lui          s8, 654011
                  flt.s        s7, fs0, fs10
                  addi         s4, s10, 727
                  div          a6, sp, ra
                  srai         a2, t2, 2
                  sra          gp, s2, sp
                  slt          t6, s2, s9
                  ori          s7, t0, 1864
                  fcvt.s.w     fs8, t4, rup
                  fmv.x.w      a3, ft2
                  xori         a0, s10, 1943
                  fmin.s       fa0, fa4, ft0
                  and          a4, s1, s10
                  fmul.s       fa7, fs4, fs10
                  mulh         t6, s0, s0
                  divu         t6, a4, t3
                  fle.s        s10, fs9, fa2
                  fsqrt.s      ft0, fs1
                  sub          a0, t0, a0
                  xori         tp, t2, -15
                  lui          zero, 136118
                  fsub.s       ft0, ft1, fs5
                  fsgnjn.s     ft4, ft7, fs7
                  div          gp, a7, s10
                  addi         s10, zero, 1072
                  fmul.s       fa3, fs7, ft5, rdn
                  flt.s        t2, fa1, ft4
                  mulhsu       t3, s10, a3
                  fcvt.s.w     fs11, s8
                  ori          s4, a7, -884
                  fadd.s       fs1, ft3, ft8, rdn
                  rem          s6, s6, a5
                  lui          s11, 1026997
                  fsub.s       ft7, fa2, fa0
                  mul          s6, s10, s1
                  sub          sp, ra, a3
                  fcvt.s.w     fs2, s4, rdn
                  srli         a0, s6, 3
                  feq.s        t4, fs9, ft2
                  fadd.s       fs2, fs4, ft9
                  fmul.s       ft10, ft2, ft0
                  rem          s10, s9, s11
                  mul          s7, s2, t6
                  div          t3, tp, tp
                  fle.s        s11, ft7, ft6
                  fsgnj.s      ft2, fa4, ft0
                  slti         s10, a1, 642
                  fcvt.w.s     tp, fa3, rne
                  or           ra, s4, s0
                  xor          t2, s0, a3
                  auipc        s9, 1019786
                  fdiv.s       fs3, fa5, ft5, rup
                  fcvt.s.wu    fs7, s5, rmm
                  fle.s        gp, fs9, fs8
                  srai         a3, a6, 4
                  lui          s7, 271614
                  fsub.s       fs8, ft3, fs1, rmm
                  fclass.s     ra, fs1
                  xori         s5, s9, 995
                  remu         t3, t4, t4
                  fclass.s     s5, fs11
                  slti         s5, sp, -325
                  srli         t6, s8, 8
                  srai         a3, s6, 16
                  mul          s5, s1, s6
                  fsqrt.s      fa1, ft4, rup
                  mul          s1, a5, t4
                  slt          s5, s0, a2
                  nop
                  fcvt.wu.s    a7, fa3, rup
                  or           s1, a2, s2
                  flt.s        s11, ft11, fa1
                  fmv.x.w      s0, fs1
                  sll          s3, s6, a2
                  feq.s        s11, ft11, fs6
                  lui          a1, 888967
                  nop
                  div          a6, t1, zero
                  xori         gp, s1, 1036
                  fsgnjx.s     fa6, ft11, fs4
                  and          t4, a7, s6
                  fmax.s       fa4, fs4, fs3
                  flt.s        a7, fs8, fs10
                  fcvt.s.w     fs3, a3
                  mul          s1, t5, a6
                  srl          t0, s9, gp
                  divu         s10, a5, s8
                  andi         a4, s6, -559
                  srli         t2, s5, 26
                  slli         t2, a1, 16
                  fsgnj.s      fa3, fs11, fs4
                  fmin.s       ft9, fa2, ft4
                  srli         a6, s10, 7
                  flt.s        a2, ft4, fs0
                  andi         a6, s11, 1420
                  srai         a2, a5, 30
                  fmv.w.x      fa1, s4
                  xori         t4, gp, 1029
                  auipc        zero, 752053
                  fcvt.w.s     s9, fs7, rdn
                  feq.s        s8, fs9, fa5
                  addi         s11, a4, -88
                  fmul.s       fs7, fa5, ft1
                  div          ra, zero, tp
                  auipc        a5, 599201
                  remu         a5, s9, a6
                  remu         a5, s4, s5
                  fcvt.w.s     a0, ft5
                  sltu         t3, s8, t6
                  slli         sp, s8, 27
                  sltu         a2, a7, s7
                  sltiu        s0, gp, -165
                  sra          a3, a7, ra
                  feq.s        a2, fa5, fs8
                  sltiu        s8, a5, 238
                  fadd.s       fs11, fs9, fa4
                  slt          a6, s11, a7
                  addi         gp, t2, 194
                  sra          tp, zero, s9
                  fsqrt.s      ft1, fa1, rtz
                  sub          a3, s7, s0
                  ori          s7, s6, -2011
                  fsub.s       ft5, ft6, fs3, rup
                  sll          tp, t5, s3
                  fcvt.w.s     s7, fa2
                  fsub.s       fa5, ft4, ft6
                  mul          t2, s2, t2
                  or           a3, s7, a4
                  srli         a1, a6, 1
                  divu         ra, s9, ra
                  fsqrt.s      fs0, ft11, rup
                  fsgnj.s      ft8, fs10, ft6
                  fcvt.s.wu    fs7, sp
                  slti         a7, a1, -22
                  add          a5, s5, a6
                  fmax.s       ft2, fa6, fs2
                  srai         tp, s0, 4
                  lui          a0, 580973
                  fsub.s       ft7, fa3, fa5
                  xor          s1, s10, ra
                  divu         ra, gp, a5
                  srl          t0, s5, s10
                  fmv.x.w      a3, ft11
                  fcvt.w.s     a7, ft6, rmm
                  sll          t3, t1, ra
                  feq.s        s10, fs0, ft3
                  fdiv.s       fs4, fa5, fa7, rne
                  ori          s5, t1, 436
                  rem          a4, t3, s11
                  fcvt.wu.s    s4, fs3, rtz
                  slti         t4, a1, 1289
                  xor          a5, t6, t3
                  remu         s3, s6, sp
                  fsgnj.s      fa0, ft7, fs0
                  sra          t6, s6, a7
                  flt.s        a5, fs8, fa2
                  sltu         ra, t5, a1
                  and          s4, a4, s7
                  sra          s8, sp, s11
                  divu         s5, s10, s0
                  sll          s10, s2, zero
                  sra          ra, s5, t2
                  mulhu        s7, a2, a0
                  fsgnj.s      fa2, fs0, fa1
                  sra          s4, a5, s11
                  fcvt.w.s     s4, ft3, rtz
                  xori         s10, s3, 1269
                  fsqrt.s      ft2, ft3, rne
                  nop
                  flt.s        zero, fs10, fs2
                  slli         t3, s3, 20
                  auipc        zero, 904816
                  fmul.s       fs7, fs8, fa2
                  fle.s        t6, fs5, fa5
                  rem          s3, a2, a2
                  fcvt.s.w     fs9, s5
                  ori          s9, s2, 1189
                  xori         t0, t6, -1058
                  feq.s        t0, fa1, fs7
                  slli         s0, sp, 2
                  fsgnjx.s     fs11, fa0, ft2
                  srai         s8, tp, 22
                  nop
                  sra          s11, s11, s2
                  addi         a1, s8, 1218
                  fmv.x.w      s7, fs7
                  mul          s10, s9, a0
                  fdiv.s       fs8, fa2, fs1, rtz
                  mul          s9, t1, ra
                  mulhu        a4, sp, t5
                  fcvt.wu.s    t3, fs11
                  sll          a5, gp, t4
                  fmv.w.x      ft0, a3
                  fmv.x.w      s4, ft0
                  srli         s9, a1, 25
                  sra          s7, t2, t5
                  fclass.s     t0, fa5
                  sltiu        a5, a4, 977
                  feq.s        a6, fa7, fa5
                  fmul.s       fs5, fa0, fs7
                  fcvt.w.s     s4, ft4, rne
                  add          s5, s9, t3
                  sra          a1, s4, s7
                  auipc        sp, 169408
                  rem          a7, a5, a2
                  sub          s0, a4, t1
                  and          s6, a7, a5
                  slli         s10, s11, 27
                  fdiv.s       fs9, fa0, ft5, rne
                  slli         tp, a0, 17
                  rem          tp, s0, t3
                  slli         s4, s2, 26
                  nop
                  sltiu        a0, s7, -1178
                  fsub.s       ft0, ft1, fa0
                  fle.s        a0, fa0, fs0
                  remu         a2, s1, s8
                  mul          t4, s6, gp
                  addi         gp, s1, -992
                  srli         s10, tp, 18
                  lui          gp, 775740
                  slt          s4, s11, s10
                  sll          ra, sp, t4
                  sra          ra, t2, a4
                  fsgnjx.s     fs3, fs8, fs2
                  srl          s7, s4, s3
                  slli         a6, a2, 5
                  fcvt.w.s     s6, fs7, rtz
                  mulhu        a2, sp, t6
                  feq.s        ra, fa0, fs7
                  rem          a2, t0, t1
                  mulhsu       a6, sp, t3
                  sltiu        t3, s3, 1315
                  nop
                  fsgnjn.s     ft10, ft2, fs7
                  srl          s4, tp, ra
                  slli         s3, s8, 2
                  nop
                  fle.s        a5, ft0, ft3
                  srli         a5, zero, 21
                  sltu         sp, s5, a5
                  fmul.s       fa6, ft10, fa1, rne
                  fmax.s       fs2, fs8, ft9
                  auipc        s3, 1048280
                  mulh         tp, a0, gp
                  fdiv.s       ft4, ft3, fa7
                  or           tp, a3, s4
                  slli         a0, a7, 0
                  auipc        a4, 986914
                  addi         a7, s11, -241
                  fadd.s       fs6, fa6, ft3, rtz
                  fsgnjx.s     fa4, fs11, fs10
                  fcvt.w.s     gp, fs0, rne
                  divu         ra, s9, s7
                  srl          s8, t2, tp
                  div          a7, ra, gp
                  fclass.s     a0, ft7
                  andi         s5, s3, -1220
                  feq.s        s8, fs2, ft8
                  lui          t4, 611610
                  xori         gp, ra, -1977
                  slti         gp, s11, 583
                  srai         a7, t6, 14
                  remu         s9, sp, a1
                  srli         ra, a3, 4
                  fadd.s       fs8, ft0, fs0, rmm
                  fle.s        a6, fs1, fs6
                  fclass.s     a6, ft4
                  mul          a7, gp, a5
                  addi         gp, a0, -1404
                  add          a6, s2, a6
                  fclass.s     a1, fs9
                  fsgnj.s      ft8, fs9, ft7
                  mulhu        s1, t2, a0
                  rem          s11, t5, ra
                  fmv.x.w      s4, ft7
                  and          s5, s10, sp
                  fcvt.s.w     fs5, a1
                  sll          s8, s7, s1
                  fsqrt.s      fs3, fs4, rne
                  mulh         s10, t3, a2
                  slti         a7, s1, 1114
                  fadd.s       fa1, ft3, ft9, rmm
                  fsgnjx.s     ft9, ft7, fs4
                  ori          ra, sp, -1769
                  mulh         a3, s7, s10
                  fcvt.w.s     sp, ft5, rne
                  slti         a7, t3, -1673
                  xor          s0, a3, s5
                  lui          a0, 119056
                  fsqrt.s      fs4, fs6
                  ori          s0, t3, -1078
                  flt.s        s8, fa2, fs0
                  xori         a1, s8, -1088
                  fcvt.s.w     ft9, zero, rmm
                  fle.s        zero, fa3, ft1
                  fcvt.wu.s    a2, ft6, rne
                  slti         s8, s7, -746
                  nop
                  fsgnjn.s     fa7, fa3, fs10
                  add          zero, a7, t5
                  sra          t3, a5, t4
                  srai         s8, t0, 3
                  fcvt.w.s     s7, ft1, rne
                  fcvt.w.s     sp, ft1
                  sll          s4, a7, t2
                  slti         s11, a1, -568
                  slti         t3, ra, -1397
                  sltiu        a5, gp, 1579
                  fadd.s       fs7, fs2, ft1
                  andi         t4, a7, 45
                  fmax.s       ft9, ft10, fa2
                  add          a0, s9, a0
                  auipc        s7, 601820
                  fmul.s       fa7, fs0, fs7, rdn
                  slti         a1, t6, 1096
                  remu         t3, s8, t1
                  feq.s        a5, fs11, fs4
                  fmax.s       ft1, fs0, fs10
                  fmax.s       ft1, ft8, fa4
                  sltu         s6, sp, s10
                  divu         s1, t5, t4
                  sra          a2, tp, a6
                  fcvt.wu.s    t3, ft4
                  fcvt.wu.s    s8, ft3
                  lui          gp, 705195
                  andi         tp, ra, 377
                  fdiv.s       ft9, fs3, fs8
                  mulhsu       tp, t2, s0
                  addi         s0, a2, 1008
                  fsgnj.s      ft6, fa5, ft2
                  srai         a0, a3, 23
                  fdiv.s       fa7, ft1, ft8, rmm
                  sll          s8, a4, sp
                  fadd.s       fa7, ft4, fa2
                  divu         s4, t1, a6
                  fsgnj.s      fa0, fs0, fs1
                  lui          t0, 566926
                  fcvt.w.s     s6, fs8, rmm
                  andi         s8, ra, 729
                  feq.s        s3, ft11, ft1
                  fsgnj.s      fs3, fa7, fs2
                  and          s6, t3, zero
                  auipc        tp, 474408
                  fcvt.s.wu    ft11, s2, rmm
                  mulh         a6, s6, sp
                  fadd.s       fs0, fs2, ft5, rdn
                  fmv.w.x      ft9, t0
                  mulhu        gp, s0, a0
                  lui          zero, 313845
                  ori          s10, a4, -576
                  fsgnjn.s     ft10, fs4, ft9
                  xori         s8, tp, 21
                  fclass.s     s4, fa7
                  fmul.s       fs0, ft1, fs4, rmm
                  nop
                  fadd.s       fs4, ft3, ft0, rtz
                  fmv.x.w      t6, ft3
                  fcvt.w.s     a2, ft10
                  xori         s3, a4, 1
                  rem          s7, a2, ra
                  remu         s1, a6, a1
                  fsgnjx.s     fs2, fs2, fs6
                  sll          a3, s7, s2
                  fadd.s       ft4, ft10, ft3, rne
                  fmin.s       fs6, ft5, fa6
                  fclass.s     a3, ft11
                  fcvt.wu.s    s7, ft11
                  fclass.s     t2, fa5
                  fmv.x.w      t4, ft10
                  slli         s1, s2, 5
                  fmv.w.x      ft0, tp
                  addi         a6, s11, -1837
                  mulhsu       t6, a2, s2
                  sltiu        a5, s0, -377
                  fsgnj.s      ft6, ft0, ft1
                  fle.s        a7, ft2, fs3
                  srli         s1, ra, 13
                  xori         tp, s10, 627
                  fcvt.w.s     t0, fs0, rup
                  sltu         s0, a4, a4
                  sra          s0, s6, sp
                  lui          ra, 153124
                  fle.s        t6, ft11, ft4
                  srli         gp, tp, 25
                  sltu         tp, a4, s5
                  fsgnj.s      ft1, fa4, fs11
                  fclass.s     s6, ft8
                  xori         a5, a5, -785
                  mul          s6, a2, s5
                  sra          s8, a6, a7
                  sll          s4, s6, s3
                  fclass.s     a5, fs8
                  remu         s5, t5, a3
                  fsgnjx.s     fs8, ft11, fa2
                  slli         s4, s8, 14
                  auipc        a7, 323365
                  rem          ra, s9, s5
                  fmax.s       fs7, fs11, fs11
                  slti         tp, s7, -1399
                  fcvt.wu.s    s11, fa6
                  fsub.s       fs0, ft11, ft3
                  fadd.s       fs8, ft4, fs9
                  slli         s10, ra, 6
                  addi         s11, t2, -792
                  fcvt.s.wu    fa3, t0, rne
                  lui          s9, 656214
                  fsub.s       ft3, fs9, ft5
                  add          t3, tp, a2
                  fsgnjx.s     fs5, ft7, ft8
                  addi         gp, a1, 1647
                  srai         s6, s11, 16
                  div          a2, s7, a1
                  sltiu        s0, s11, -265
                  fsgnjn.s     ft8, fs4, ft8
                  fmv.x.w      s7, fa4
                  fsqrt.s      fs10, ft5
                  sltiu        s4, s6, -1999
                  nop
                  sll          s3, a6, sp
                  fmv.x.w      a0, ft7
                  fmax.s       fs6, fs3, fs0
                  mulhu        a6, t3, s2
                  fmv.w.x      ft2, s4
                  mul          t2, s8, tp
                  fcvt.s.w     fs4, t2
                  fsgnj.s      ft5, fs10, fs4
                  fmul.s       fa4, fs7, fs10
                  fmin.s       fs10, fs9, fs5
                  srai         ra, s0, 5
                  feq.s        s8, ft11, fs10
                  rem          s10, a1, s4
                  mulh         a5, a6, a7
                  and          a3, s11, s6
                  nop
                  or           t3, a1, a4
                  fcvt.wu.s    s9, ft2, rmm
                  fcvt.s.wu    fs2, a6, rne
                  lui          t3, 57525
                  fsgnjx.s     ft11, fa0, fs10
                  mulh         t4, s11, t4
                  xor          a3, a1, t5
                  fsgnjn.s     fa3, fa1, ft0
                  fle.s        a2, fa0, fs8
                  sra          s3, a6, t2
                  slt          a1, s10, s1
                  slti         a1, a2, -935
                  andi         s9, s10, 339
                  divu         sp, t4, t6
                  fcvt.s.w     fa4, a2
                  remu         a2, t3, a3
                  fclass.s     s7, ft0
                  fadd.s       fa6, ft10, ft9, rne
                  slli         gp, s0, 26
                  nop
                  fmul.s       fs0, fa0, fs0, rmm
                  fmv.w.x      fs7, s10
                  mulhsu       s3, t6, t2
                  div          t0, zero, s0
                  ori          ra, a1, -1967
                  slt          sp, ra, s4
                  lui          zero, 377029
                  lui          t6, 642134
                  feq.s        t0, fs4, ft11
                  mulhsu       a5, t0, a2
                  addi         t4, zero, -1603
                  xor          zero, t3, t0
                  fcvt.wu.s    s7, ft5
                  slli         s9, s3, 4
                  slt          s11, a2, s3
                  fsgnjx.s     fa2, ft0, ft3
                  fsqrt.s      fa6, fs9
                  mul          gp, zero, s6
                  remu         s3, sp, a2
                  ori          t6, s10, -1283
                  ori          s7, a0, 900
                  fsub.s       ft7, ft0, fs8
                  or           a4, s8, s6
                  fmv.x.w      a1, ft7
                  fdiv.s       ft10, fs0, fa1
                  div          s9, t2, sp
                  srl          t6, s4, s0
                  fcvt.w.s     a7, fs6
                  div          t3, t1, sp
                  fcvt.w.s     t0, fa7
                  fsub.s       fs1, fa6, ft9
                  srli         s1, a0, 28
                  mulhu        tp, t4, s4
                  srli         zero, s1, 28
                  srl          a2, t1, t3
                  ori          gp, t0, -1853
                  fcvt.w.s     s5, fa4
                  feq.s        s11, fa7, fs2
                  sll          s6, s3, s11
                  sltiu        t2, tp, 1510
                  fclass.s     s3, fs8
                  divu         zero, t6, t1
                  fcvt.w.s     t2, ft0, rup
                  xor          a3, s0, s10
                  rem          gp, gp, a3
                  mulhu        a2, s9, t5
                  mul          s9, t5, s5
                  fmv.w.x      ft3, s7
                  fclass.s     s6, fs5
                  ori          s6, t4, 514
                  addi         s0, a6, -773
                  sra          a2, s1, t4
                  fle.s        s9, ft3, fa0
                  sra          s9, s10, a6
                  fmax.s       fs4, fa5, fs3
                  fadd.s       fa3, ft6, ft7
                  fmax.s       ft5, fa6, fa1
                  feq.s        a0, fs1, ft2
                  div          s9, a5, s9
                  sll          s5, ra, s4
                  fsgnjx.s     fs3, fs6, fa4
                  sll          s3, a0, s2
                  fmax.s       fs10, fa5, fs4
                  mulhu        zero, t6, t6
                  mulhu        t2, a4, s3
                  auipc        s4, 553735
                  div          ra, a7, s0
                  mulh         s1, t0, t4
                  fsgnj.s      ft4, ft3, ft10
                  fclass.s     t0, ft11
                  auipc        a3, 540452
                  and          a3, gp, a6
                  nop
                  fcvt.wu.s    a6, fs2, rmm
                  sltiu        a5, s1, 1859
                  fmul.s       ft6, ft11, fs10
                  rem          s4, s10, s1
                  fmax.s       ft6, ft8, fs6
                  fsgnjn.s     fs8, fs7, fa5
                  sub          s4, s4, s5
                  rem          gp, t1, t5
                  mulhu        t6, ra, s7
                  sll          t2, gp, s3
                  andi         tp, s2, 164
                  or           a0, a7, s10
                  auipc        a3, 835687
                  srai         a7, s8, 19
                  add          a3, t4, sp
                  sll          t2, s0, t6
                  sll          t6, t5, s7
                  sltu         s9, s5, s4
                  fcvt.wu.s    s10, ft7
                  fcvt.wu.s    t0, fa2
                  sub          t4, t3, zero
                  fcvt.w.s     s6, fa1
                  srli         t6, t6, 29
                  xor          s4, s3, a4
                  fsqrt.s      fs10, fs11
                  fmv.w.x      fs10, t0
                  andi         s9, t2, 474
                  remu         t4, a4, s9
                  fcvt.s.w     fs0, s3
                  div          s1, s2, t5
                  sll          s6, s11, s8
                  fsgnjx.s     ft7, fs8, fs8
                  mulhu        s1, s7, a5
                  ori          a4, t4, -383
                  fsgnjx.s     ft2, fs1, fs6
                  xor          ra, s11, t4
                  flt.s        a0, fs6, fs9
                  slli         s10, t5, 30
                  mulh         zero, s10, t0
                  fadd.s       ft9, ft2, ft7
                  and          s1, zero, a4
                  fadd.s       ft5, fa7, ft2
                  mul          a0, s7, s10
                  sltiu        s3, a6, -1666
                  ori          s5, s4, 1536
                  mulhu        zero, s4, gp
                  slli         ra, gp, 4
                  slt          a2, a1, t1
                  xor          t4, s3, a5
                  fsgnjx.s     fa6, fs8, ft0
                  slti         ra, t4, 1819
                  divu         s1, t4, s8
                  fdiv.s       ft2, fs1, ft3
                  ori          ra, t4, -403
                  fdiv.s       fa6, ft6, ft7, rne
                  fcvt.s.wu    ft11, s10, rtz
                  rem          s5, s11, a5
                  mul          a1, tp, a2
                  sltu         s7, s7, s7
                  feq.s        s11, fs11, ft11
                  or           t6, s1, s7
                  xor          a2, t0, s9
                  sltu         ra, a4, tp
                  mul          a6, s11, s0
                  fcvt.wu.s    s10, fa6, rup
                  fcvt.s.w     ft0, t2
                  fcvt.wu.s    t6, ft4
                  fclass.s     ra, fa7
                  fcvt.s.wu    fs7, s5, rne
                  sll          s7, s8, zero
                  slti         s1, a1, 91
                  fmax.s       fs4, fs9, ft2
                  mul          gp, t6, t0
                  srl          sp, t0, a2
                  fadd.s       fs2, fs3, ft8, rne
                  fclass.s     t2, ft4
                  div          a4, s0, s0
                  mulh         s9, a3, s1
                  fcvt.w.s     s11, fa5, rmm
                  slt          t0, tp, zero
                  fmul.s       fa4, fs0, fs9
                  fsgnjx.s     fs11, fs8, fa6
                  fadd.s       ft7, fa6, fs8
                  fadd.s       fs7, ft4, ft9
                  add          s8, t5, s10
                  srli         s0, s6, 25
                  fsgnj.s      fs4, ft2, fa7
                  ori          a1, tp, 1465
                  sltu         a2, ra, t5
                  sub          s4, a4, s8
                  xor          t6, zero, ra
                  div          a1, t5, t2
                  fcvt.wu.s    t6, fs4
                  divu         s11, zero, s3
                  sll          s9, s10, s1
                  sra          s7, t0, zero
                  fadd.s       ft0, fs7, ft1
                  andi         s4, zero, -572
                  fcvt.w.s     s8, ft9
                  div          a1, s6, s7
                  fsgnjn.s     ft2, ft5, fa1
                  fmv.x.w      tp, fs9
                  fcvt.s.w     fa4, t6, rup
                  sll          t0, s4, a3
                  mulhu        zero, s4, t4
                  sub          a7, s2, zero
                  fcvt.s.w     fa2, a0
                  mulhsu       s6, a5, a1
                  fsgnjn.s     ft7, fa6, fa3
                  srai         a2, a4, 8
                  fsqrt.s      ft2, fa4
                  fmv.x.w      a1, ft10
                  mul          a4, sp, gp
                  addi         tp, s2, 374
                  fcvt.w.s     s8, ft1, rmm
                  slli         s4, a2, 6
                  srli         a4, t5, 16
                  fadd.s       fa1, ft3, fs1, rne
                  fsqrt.s      ft11, fs6, rup
                  sll          s8, s10, a5
                  div          a1, a7, s1
                  slt          s5, s5, s6
                  and          gp, s2, t6
                  mulhu        a1, a6, a2
                  div          s10, a1, t0
                  fsgnj.s      fs5, ft11, fs3
                  div          a0, gp, s0
                  add          a4, s6, s7
                  sra          a4, a2, s3
                  mulhu        a1, s11, s7
                  fcvt.w.s     s1, fa5, rtz
                  mulhsu       s7, t2, s0
                  xor          s7, s2, t6
                  srl          a4, t5, t6
                  divu         s1, s1, zero
                  auipc        t2, 153557
                  fsgnjn.s     fa3, ft9, ft6
                  fsgnjn.s     fa6, ft6, fs0
                  and          t4, a4, a5
                  ori          a2, t5, -1062
                  ori          a2, gp, 801
                  sltiu        s8, t3, 121
                  fsgnj.s      ft10, ft5, fa6
                  slt          t2, sp, s9
                  or           a3, s1, t0
                  nop
                  slli         a3, t1, 20
                  fcvt.s.w     ft7, s8, rmm
                  divu         s9, t1, s4
                  fmv.x.w      gp, ft11
                  add          t2, t6, a6
                  and          t6, s8, s7
                  fsgnjn.s     fs9, fs3, fa1
                  remu         s9, t0, s6
                  rem          s0, tp, a0
                  mulhsu       t4, gp, s2
                  fcvt.s.wu    ft5, s4
                  fle.s        s6, ft3, fa4
                  feq.s        a6, ft3, ft6
                  slti         a0, ra, -945
                  fcvt.w.s     s3, fs2, rne
                  mulh         s4, t0, tp
                  sltu         a7, s7, s11
                  srl          a6, a1, a4
                  fsqrt.s      ft5, ft2
                  xori         a5, s2, -1088
                  mulhsu       a4, s9, s1
                  flt.s        a7, fs1, fs4
                  sra          t3, a7, s11
                  fcvt.wu.s    s5, ft7, rtz
                  fcvt.s.wu    ft8, s7
                  srai         a2, t1, 19
                  fmv.x.w      s3, fa6
                  mulhsu       s0, sp, s7
                  nop
                  srli         a3, s0, 7
                  rem          s8, a5, a7
                  mul          a4, a4, t4
                  fcvt.wu.s    zero, ft3
                  divu         a7, s10, t0
                  fcvt.wu.s    t3, ft1, rdn
                  nop
                  sltiu        s3, s7, -414
                  sub          t0, t2, s11
                  sra          s3, s1, a0
                  remu         s0, s8, a1
                  rem          t4, s0, s1
                  fdiv.s       fa1, fs3, fs11
                  xori         a6, s5, 644
                  sltiu        a1, t6, 1342
                  fcvt.s.wu    fa7, sp, rtz
                  andi         s1, a4, 13
                  fcvt.s.w     fa6, t3, rmm
                  ori          s3, t2, -1265
                  fsgnjx.s     ft10, fs2, fa5
                  fsgnjn.s     fa5, fs5, fa5
                  add          s10, s11, t6
                  fmul.s       fa6, ft1, ft1, rup
                  srl          a0, s4, s8
                  srl          s4, a4, zero
                  addi         ra, zero, -1075
                  fcvt.w.s     a4, ft2
                  fmin.s       fs9, fa5, fs0
                  ori          s11, a5, 1751
                  fmin.s       fs4, ft5, ft11
                  xori         t6, a5, -1282
                  fcvt.wu.s    a1, fs10
                  auipc        s10, 708889
                  fcvt.wu.s    ra, fa5
                  and          ra, t4, sp
                  auipc        s8, 472812
                  sub          gp, t4, s2
                  ori          a7, s7, 1599
                  slli         t0, a2, 9
                  fmin.s       ft4, fs7, fs4
                  rem          t4, s2, ra
                  srli         tp, s2, 22
                  fmv.x.w      s10, fa6
                  divu         a6, s2, s6
                  srai         s6, a7, 22
                  fmul.s       fs8, fs2, fs6, rmm
                  fmin.s       fs1, ft3, ft4
                  sltiu        s11, a2, 1152
                  auipc        s6, 381906
                  ori          gp, a1, -166
                  sra          s8, a4, t4
                  srai         s3, t1, 19
                  fmv.x.w      s4, fa6
                  srai         s7, a2, 27
                  fsgnj.s      ft7, fa6, fa0
                  mulh         s4, s11, ra
                  addi         sp, t4, -1558
                  fcvt.s.wu    fs2, s0
                  fdiv.s       fa7, fa2, fs4, rtz
                  sra          a0, ra, t2
                  and          t0, a4, a6
                  fcvt.s.w     ft4, gp, rtz
                  auipc        s5, 845239
                  sltiu        s4, s7, 2027
                  feq.s        a2, ft7, ft1
                  srl          s11, t0, a7
                  fsqrt.s      fs8, fa7, rdn
                  flt.s        t6, fs8, ft3
                  fsgnj.s      ft9, fs4, fs4
                  feq.s        s8, ft9, fs10
                  srai         s5, gp, 26
                  slti         s4, a3, -1806
                  mul          s0, t6, sp
                  xori         s6, s7, -1823
                  srl          s3, t5, gp
                  fdiv.s       fs0, fs5, ft0
                  sltiu        s11, ra, -958
                  add          t6, s11, a2
                  sll          t3, s7, t5
                  fdiv.s       fa0, ft4, ft11, rdn
                  fadd.s       fa7, ft8, fs3, rup
                  andi         a2, t3, -1925
                  addi         a1, s2, -792
                  sub          s10, a3, a7
                  sll          t2, s4, t3
                  fsub.s       ft11, fs3, fs5
                  mulhsu       ra, a0, a4
                  sltu         s8, t2, a5
                  slli         s8, a5, 25
                  rem          a4, ra, ra
                  sltiu        t3, a1, -450
                  addi         s7, gp, 479
                  fsqrt.s      fa5, fs5
                  fmv.x.w      t4, ft7
                  mulhu        a6, s8, s5
                  xori         ra, s6, 1887
                  fmv.w.x      fs5, s7
                  fsgnj.s      ft9, ft4, ft11
                  mulh         s5, ra, t0
                  fle.s        s6, fs6, fa4
                  mulhu        s0, zero, s7
                  fcvt.wu.s    a6, fs3
                  or           a3, s10, sp
                  sltu         gp, s7, s5
                  fcvt.wu.s    tp, ft5
                  srl          a2, s3, a6
                  div          a5, t5, ra
                  add          t2, s11, s11
                  add          a2, tp, s2
                  sub          s11, s8, a3
                  fadd.s       fa7, fa1, fs8, rne
                  slt          a4, s1, a0
                  remu         tp, s10, sp
                  slt          s4, t5, s0
                  sub          a1, s2, a3
                  sltu         a7, zero, s10
                  fdiv.s       ft4, fs0, fs1, rmm
                  ori          s0, s7, 24
                  xori         s7, s9, -938
                  rem          a3, t1, zero
                  fmv.w.x      ft1, s1
                  sra          tp, a7, s0
                  slli         tp, ra, 7
                  sra          s6, s6, a3
                  lui          a7, 315245
                  sub          a0, t1, t2
                  xori         zero, s6, -669
                  fadd.s       fa1, fa4, fa0, rup
                  xor          s4, tp, s5
                  sltu         a0, s6, ra
                  div          t6, t4, s6
                  sltiu        a4, s6, -1497
                  lui          s11, 540349
                  srai         ra, a1, 30
                  fmv.x.w      s4, ft3
                  srli         s4, a7, 11
                  sltu         tp, a0, sp
                  sll          sp, s3, zero
                  fdiv.s       fs4, ft4, ft0, rtz
                  sub          t4, t6, t1
                  fclass.s     s7, fs3
                  srli         t6, a6, 10
                  srli         s6, s7, 9
                  fmax.s       fs1, ft7, fa5
                  fmv.w.x      fs0, t4
                  add          s1, a3, t0
                  flt.s        a3, ft5, ft0
                  auipc        zero, 359473
                  remu         zero, s1, t6
                  fsgnj.s      fa0, ft2, ft9
                  fdiv.s       fa5, fs1, fa3
                  fmul.s       fa4, ft5, fs6
                  fmul.s       ft11, ft1, fa6, rdn
                  fdiv.s       fs9, fs11, fa1, rup
                  fmax.s       ft9, fa1, ft10
                  srli         t3, t6, 18
                  mulhsu       a5, tp, s0
                  srai         s11, s11, 2
                  fmin.s       fs4, ft2, fa1
                  fmin.s       fs11, fa0, ft5
                  slt          t0, s8, s2
                  fclass.s     s4, fs10
                  flt.s        t0, fs0, ft9
                  fcvt.s.wu    ft5, s1, rmm
                  xori         a1, s7, -1440
                  lui          a5, 325613
                  fcvt.w.s     s6, fa6
                  nop
                  slli         a3, s6, 3
                  fcvt.s.w     ft0, s6, rmm
                  sra          s4, s0, s4
                  fmax.s       ft10, ft2, ft7
                  sra          zero, s0, t1
                  slli         s8, gp, 3
                  mul          t2, s2, a5
                  sltiu        s3, a3, 409
                  fsub.s       ft10, ft3, fs3, rdn
                  sll          gp, s8, t0
                  ori          a1, a6, 28
                  fsgnjx.s     ft7, fa2, fa0
                  or           ra, s3, s4
                  remu         t4, a4, t5
                  fmv.w.x      fs5, s11
                  slti         s1, s4, 1812
                  fle.s        s1, ft0, fs9
                  sra          s11, a5, s6
                  mulhsu       t2, sp, t3
                  fsqrt.s      fs9, ft11
                  lui          s11, 445719
                  mulhu        s10, t1, s3
                  or           gp, s2, a1
                  fdiv.s       ft5, fs4, ft9
                  lui          s10, 145058
                  fsqrt.s      fs2, ft10
                  fsgnjn.s     fa5, fa2, ft0
                  sltu         a6, t2, s2
                  slti         t4, a0, -369
                  fdiv.s       ft8, fa5, fa7
                  rem          s9, a3, a3
                  fsgnj.s      fs9, fa2, fs10
                  mulh         t3, t3, t4
                  fle.s        t6, ft11, ft7
                  lui          t3, 401555
                  fcvt.w.s     s7, fs2
                  mulhu        a0, s3, s5
                  fsub.s       fa0, fa4, fs0
                  add          a6, s3, a6
                  fmv.x.w      a7, ft0
                  andi         s1, a2, 80
                  rem          s11, a4, ra
                  fclass.s     s7, ft3
                  divu         a3, a0, a1
                  sra          s4, s9, t2
                  mulh         s9, a4, gp
                  remu         s5, s9, t3
                  fsub.s       fs8, fa1, fs6
                  xori         t0, t4, 2041
                  fmv.x.w      s3, ft6
                  slt          s3, s4, a7
                  and          ra, s0, a2
                  feq.s        s5, ft6, fa0
                  fcvt.s.wu    fs0, a6
                  div          s1, sp, s0
                  fsub.s       fs7, ft11, fa2
                  fmv.x.w      a1, ft0
                  lui          zero, 928811
                  fsqrt.s      fs6, fs3, rne
                  sub          s10, t3, s1
                  fcvt.s.w     ft2, t4, rtz
                  srli         s4, t0, 8
                  fsub.s       fa4, ft10, ft8, rmm
                  fcvt.s.wu    fa3, a2, rup
                  sra          a4, s2, t4
                  fcvt.s.wu    fa1, a2, rup
                  srli         a6, a7, 21
                  sra          s9, s11, t1
                  andi         s0, s1, 665
                  fsqrt.s      fa1, ft11
                  srli         s8, t1, 27
                  nop
                  fsgnjx.s     ft9, fa7, ft1
                  fdiv.s       ft9, ft3, fs0, rmm
                  fmul.s       ft11, ft3, ft1
                  feq.s        tp, ft5, ft1
                  auipc        s8, 1041013
                  andi         a5, tp, -1105
                  fsgnj.s      ft10, fa2, fs10
                  sltu         s6, t6, t6
                  addi         a0, s0, 644
                  slt          s0, a6, s8
                  xori         a2, a2, -601
                  auipc        a3, 986837
                  addi         ra, s4, 763
                  nop
                  slti         zero, t1, 1706
                  sub          a0, t1, s7
                  fmax.s       fs5, fs10, fa2
                  fsgnj.s      fs8, fs2, fs2
                  auipc        s10, 660797
                  slti         ra, s4, 139
                  rem          s3, gp, s1
                  nop
                  add          s11, s8, a7
                  ori          s1, t4, -443
                  flt.s        t3, ft0, fs8
                  fcvt.w.s     t2, fa3
                  mulhu        a0, s3, s5
                  fsgnjn.s     fs7, fa2, fs0
                  mulhsu       t4, t4, ra
                  sll          t3, s3, a4
                  or           a1, a5, s10
                  fsqrt.s      fa7, fs4, rtz
                  or           a5, t0, tp
                  fcvt.wu.s    gp, fs11, rne
                  fsgnj.s      fs1, fs5, fs7
                  or           s1, sp, s7
                  lui          s7, 588952
                  fcvt.wu.s    s8, fa0
                  fsgnj.s      fs2, fa3, fs0
                  srli         sp, t3, 10
                  slli         a4, a1, 2
                  fcvt.w.s     s1, fs5, rdn
                  xori         s7, tp, 1397
                  fcvt.w.s     s4, fs8
                  xori         zero, s11, 406
                  sltiu        sp, a3, 1457
                  slt          s0, t5, s6
                  fle.s        a1, ft5, fa0
                  mulhsu       s4, a5, t2
                  rem          gp, t5, s10
                  ori          s4, s5, -1085
                  add          a1, a7, a4
                  div          tp, ra, s4
                  fsgnj.s      fa5, fs0, fs9
                  fcvt.s.wu    fs10, t6, rtz
                  fsgnjn.s     ft4, fs9, fs7
                  fcvt.s.wu    fs10, t6
                  lui          tp, 441723
                  xor          s8, a0, sp
                  feq.s        s7, fs6, fs0
                  sltu         s8, a5, a3
                  fcvt.wu.s    tp, fs3, rtz
                  fsgnjn.s     ft6, ft1, ft10
                  rem          t3, t1, s6
                  xor          s3, t0, a3
                  fmin.s       fs4, ft8, ft8
                  mul          t4, a0, a3
                  slt          a3, ra, t2
                  fmv.x.w      s1, ft9
                  xori         t3, s3, 18
                  fdiv.s       ft0, fs0, fs2, rne
                  fmin.s       fa7, fs1, fa2
                  srli         s4, s5, 27
                  fcvt.s.w     ft7, s10
                  slt          a7, s9, s9
                  remu         s5, a5, s2
                  nop
                  slt          s4, zero, sp
                  xor          t2, a5, t0
                  mulh         s7, s3, s0
                  fmv.x.w      zero, fs2
                  fdiv.s       ft1, ft1, fs10, rtz
                  fcvt.wu.s    sp, fs11, rup
                  add          zero, t0, s10
                  fmin.s       fa5, fs10, fs4
                  and          s3, t5, t6
                  sltiu        t4, t5, 1193
                  fsgnj.s      fs9, ft7, fs10
                  sra          s10, ra, s3
                  sltiu        ra, t0, 1608
                  add          s8, s7, sp
                  fcvt.s.wu    fs3, s6, rdn
                  fcvt.s.wu    ft4, t2
                  srai         ra, t5, 0
                  and          a6, a6, a7
                  remu         s4, a5, sp
                  auipc        s6, 111838
                  fcvt.wu.s    t3, ft8
                  fsgnjn.s     fs9, fa1, fs1
                  fmin.s       fs11, fs5, fs7
                  fclass.s     s6, fa2
                  fcvt.wu.s    s7, fs8, rdn
                  fmax.s       fs0, ft3, fa1
                  slli         s5, t6, 0
                  fadd.s       fs9, ft3, ft2
                  auipc        ra, 503245
                  div          a3, sp, a6
                  fsgnjn.s     ft6, fa5, fa4
                  fcvt.s.w     ft10, ra
                  fcvt.s.w     fa0, a5, rtz
                  and          ra, s3, t2
                  xori         gp, s10, 1755
                  srl          a0, a1, t5
                  fsgnj.s      fa1, fa4, fa5
                  fmul.s       fs2, fs8, fa4, rdn
                  flt.s        gp, ft5, fa6
                  remu         t3, t5, s5
                  sltu         a6, t0, a7
                  fclass.s     a4, ft11
                  fsgnjn.s     fa0, fa0, fs1
                  fmv.w.x      fs2, s9
                  xori         s9, s2, -1208
                  sra          s3, a3, t2
                  divu         s1, t6, t3
                  srl          a2, t3, a5
                  sub          gp, s11, s4
                  fsub.s       ft11, fa1, fs7, rne
                  auipc        s6, 365382
                  fsqrt.s      fs7, ft7
                  slli         s11, s8, 0
                  xor          s7, t3, t4
                  auipc        s11, 281787
                  mulhsu       tp, a2, tp
                  xor          a4, s3, t2
                  or           a5, s4, s10
                  add          a7, gp, tp
                  fmax.s       fa4, fa0, fs11
                  slti         s10, tp, 1003
                  divu         a6, a2, s0
                  fclass.s     s5, fs0
                  fdiv.s       ft6, ft3, fs11
                  fdiv.s       fs4, fa5, ft1, rmm
                  fmax.s       fs2, ft7, fa5
                  fmin.s       fs2, ft8, ft2
                  fle.s        t6, ft2, ft11
                  auipc        a5, 27398
                  fsgnjn.s     fa2, fs7, ft11
                  srl          s8, t6, s9
                  fmin.s       ft10, ft5, ft4
                  xor          a0, s1, s7
                  xori         a7, gp, 501
                  flt.s        ra, fa1, fa5
                  sra          a2, a1, a1
                  slti         a7, s4, -1186
                  divu         a7, s4, sp
                  nop
                  auipc        a1, 7666
                  sltu         t6, s4, gp
                  xori         s3, t4, 1438
                  fmax.s       fa2, ft0, ft9
                  fmv.w.x      fs5, a3
                  srai         t6, s11, 29
                  addi         zero, zero, -1386
                  nop
                  addi         t3, t4, -646
                  fsgnj.s      ft2, fa2, fs6
                  andi         a4, s3, -1386
                  fmul.s       ft7, fa7, ft11
                  fadd.s       fs1, ft3, ft4, rup
                  fsqrt.s      fa2, fa7, rmm
                  fdiv.s       fa2, fa4, fa6
                  or           s4, s4, a3
                  fsqrt.s      fs2, fa6
                  or           a0, s1, t0
                  fcvt.wu.s    a2, fa5, rtz
                  fmul.s       ft5, fs2, ft6
                  fsgnjn.s     fs11, fs10, fs7
                  xor          ra, s7, ra
                  sltu         t4, zero, a6
                  fcvt.s.w     fa3, s2
                  srai         s10, s11, 21
                  add          ra, t6, s9
                  sub          a4, s7, s4
                  mul          s8, t6, s0
                  fle.s        a7, ft6, fa6
                  slti         t0, s11, 511
                  mulh         s11, s7, a1
                  fmax.s       fs6, fs2, fs10
                  auipc        s10, 950348
                  add          ra, a5, a5
                  divu         s3, t0, gp
                  fmul.s       fs0, fs4, ft7
                  srl          t3, a7, s5
                  addi         a3, s8, -179
                  xori         s11, t4, -143
                  fcvt.w.s     s5, fs9
                  lui          t3, 873204
                  mulhsu       a6, s8, s0
                  divu         a3, s3, sp
                  ori          s8, s6, -141
                  fsgnj.s      fs10, fa3, fs1
                  sltu         s6, a4, tp
                  fadd.s       fs5, fs8, fa2
                  add          sp, t0, sp
                  fsub.s       ft2, fa7, ft2
                  sra          s0, zero, a0
                  fcvt.w.s     t2, fa2
                  fmul.s       fa0, fa0, fa6, rdn
                  flt.s        a1, fs7, ft7
                  mulh         s9, t1, a0
                  slti         ra, a1, 118
                  ori          a6, a4, -1878
                  sra          ra, s3, a1
                  fle.s        a0, fs10, ft6
                  fsgnjn.s     fa0, ft10, fa0
                  sub          s0, s4, a0
                  fsgnjx.s     ft11, fs0, ft10
                  remu         zero, s11, t3
                  or           zero, a3, s8
                  fmin.s       fa3, ft9, fs11
                  addi         t4, a7, -1675
                  nop
                  fmax.s       ft6, ft10, ft6
                  lui          s3, 34065
                  add          zero, t6, a0
                  slt          s5, t4, s10
                  fcvt.s.w     fs3, s1
                  srai         t2, s2, 3
                  srai         t0, a7, 3
                  fmv.w.x      ft4, a2
                  fsgnjn.s     fa5, fs9, fa0
                  fcvt.wu.s    t6, ft6, rmm
                  fcvt.s.wu    fs1, s10
                  mul          a4, s6, zero
                  sra          s5, a0, s1
                  fmv.x.w      s8, ft10
                  slt          s7, s11, t1
                  fdiv.s       fs11, fa7, fs6
                  sll          ra, s4, gp
                  fsgnj.s      ft5, ft3, ft11
                  or           s11, s7, a1
                  srl          s4, t1, t0
                  sra          s5, s9, a6
                  fsqrt.s      ft9, fa4
                  slli         t0, t6, 3
                  fmv.x.w      ra, fa3
                  rem          a0, zero, s2
                  andi         a6, s3, -863
                  lui          a5, 841529
                  fcvt.wu.s    s3, fs9, rup
                  fcvt.wu.s    a2, fs6, rtz
                  srai         a4, s7, 23
                  fle.s        t6, ft9, ft5
                  sltu         s7, t0, s7
                  fle.s        a4, fs2, fs1
                  ori          a0, a6, 612
                  fcvt.s.wu    fs1, ra
                  fmul.s       fs8, fa0, fa6, rtz
                  sltiu        s7, s7, -844
                  sra          s11, tp, s6
                  srli         a0, tp, 0
                  addi         t2, s0, -1394
                  fclass.s     s10, fa0
                  fsqrt.s      ft1, ft4
                  fsqrt.s      ft8, ft9, rdn
                  fadd.s       ft8, fa0, ft2
                  mulh         s1, s3, s7
                  rem          s7, a6, t2
                  sltiu        s9, a3, -1800
                  srai         a0, s3, 17
                  sub          s9, s1, a2
                  fmax.s       fa6, ft8, fs0
                  slti         s10, s8, 595
                  slt          gp, a2, a4
                  slti         s11, s1, 709
                  fmax.s       fs0, fa1, fs4
                  addi         s5, s0, 467
                  remu         tp, s6, ra
                  xori         a1, t2, 1185
                  fsgnjn.s     fs4, fs4, fs5
                  feq.s        t2, fs7, fs11
                  ori          a2, t0, 1861
                  addi         sp, sp, 947
                  lui          s3, 304631
                  rem          a2, sp, t0
                  add          ra, t1, s0
                  fsgnjn.s     fs11, fa5, ft0
                  slti         s3, tp, 599
                  srli         a2, a7, 28
                  fmv.w.x      ft0, s9
                  fmax.s       ft0, fs2, fs2
                  andi         a1, ra, 1153
                  fsqrt.s      fa1, fa6, rne
                  feq.s        s9, fs1, fa1
                  fsqrt.s      fs4, ft3
                  fsgnjn.s     ft1, fs1, fs0
                  xori         s11, zero, -1855
                  andi         t3, s9, -1833
                  fclass.s     s10, fs4
                  or           s6, s7, t6
                  sltu         s4, s2, gp
                  fsgnjn.s     fa1, fa5, fa5
                  fcvt.wu.s    a5, fs5, rmm
                  sltu         t4, s7, s6
                  fsub.s       ft1, ft4, fs8, rmm
                  nop
                  srli         t0, s3, 23
                  or           s4, s0, t3
                  fmax.s       ft6, fs11, ft9
                  sltu         t0, a4, s8
                  fcvt.w.s     s7, ft8, rne
                  mulh         a2, tp, s9
                  fmin.s       fa2, ft9, fs9
                  addi         a6, t4, -370
                  slti         a6, ra, -1987
                  addi         s10, gp, -1419
                  sltiu        tp, a7, -1447
                  slti         s6, t4, -1218
                  fdiv.s       ft3, ft5, ft0
                  fmin.s       ft2, ft10, ft8
                  fcvt.s.wu    fa5, s6
                  fmv.w.x      ft4, t5
                  nop
                  slli         sp, s8, 6
                  mulh         gp, s9, gp
                  fcvt.s.wu    ft5, t3
                  fsgnjx.s     ft11, fs6, ft0
                  sll          zero, s7, s9
                  addi         a5, a7, 1907
                  ori          a2, a5, 1789
                  fclass.s     tp, ft7
                  and          a4, tp, s6
                  fcvt.s.w     fs7, a3
                  fmax.s       fs6, fs3, ft1
                  fcvt.w.s     a2, ft10, rup
                  sra          s1, t3, t0
                  feq.s        t2, fa1, fs8
                  fcvt.w.s     s3, fa2, rup
                  auipc        s11, 175571
                  srli         a3, s4, 30
                  mulhsu       a3, s4, a3
                  div          gp, t5, a0
                  feq.s        s8, fs0, ft4
                  srai         gp, s10, 2
                  andi         s8, s5, -220
                  feq.s        t4, ft8, fa7
                  xor          a4, s1, t0
                  add          s0, a0, a3
                  flt.s        t6, fs6, ft0
                  fsub.s       fa0, fs5, ft6
                  nop
                  fdiv.s       ft7, ft8, fs9
                  rem          s0, s6, sp
                  fsub.s       ft10, fs3, ft0
                  sub          a5, s5, s6
                  fcvt.w.s     s0, ft6, rdn
                  feq.s        s4, fs7, ft8
                  fcvt.s.wu    ft5, a4
                  fmax.s       fa3, fa5, fa0
                  and          a2, a1, zero
                  fcvt.w.s     tp, fs4, rne
                  fsub.s       ft1, ft0, ft1, rup
                  fcvt.w.s     a5, ft4
                  mul          a5, s9, s7
                  fmin.s       ft0, fs5, ft10
                  fmul.s       fa0, fs1, ft5
                  mul          s3, a6, tp
                  mul          a1, t2, s2
                  fadd.s       ft1, fs4, ft4, rup
                  sll          t4, s1, s3
                  feq.s        s3, ft0, fa6
                  mulhu        s5, s11, s9
                  srli         t6, gp, 12
                  fle.s        t6, fs9, ft8
                  fmin.s       ft1, fs9, fs11
                  fsqrt.s      ft2, fs0
                  fle.s        s7, ft4, fa3
                  sltu         a1, a2, s9
                  andi         s4, zero, 813
                  fmv.x.w      a0, fs10
                  slli         a4, s11, 28
                  fcvt.wu.s    a1, ft7
                  rem          s7, zero, t0
                  fle.s        gp, fs11, ft7
                  fmv.x.w      zero, fs10
                  sll          s4, a6, a7
                  rem          t6, gp, zero
                  lui          s1, 181900
                  remu         gp, a7, s3
                  sltu         t0, s5, s0
                  fmax.s       fs3, fs8, fa2
                  remu         sp, s3, a5
                  fmul.s       fa3, fa5, fa4, rdn
                  and          s8, s7, s3
                  remu         s0, a0, s11
                  mulhu        a2, a6, tp
                  slt          s4, s8, t5
                  fcvt.w.s     t6, fa4
                  fmv.w.x      ft6, a3
                  fcvt.s.wu    fs3, gp
                  fadd.s       ft9, fs11, fs5, rne
                  addi         s0, s7, -1899
                  fmv.w.x      fs8, a7
                  fmv.w.x      ft1, ra
                  sra          zero, t0, tp
                  xor          s6, gp, gp
                  mulhu        a1, s6, s8
                  feq.s        a5, ft6, fs9
                  add          s8, a5, a4
                  lui          t6, 897049
                  fsgnjx.s     fs11, fs3, fs7
                  sltiu        s1, a0, 1938
                  flt.s        a5, fa4, ft11
                  auipc        ra, 614688
                  sltiu        s4, s2, -1863
                  fmv.w.x      fa6, s9
                  sltu         a1, s6, a0
                  fcvt.w.s     s7, fs7
                  fmax.s       ft2, fs0, fa3
                  fmin.s       fa7, ft3, fs9
                  fclass.s     s1, fs7
                  srl          a5, a4, a5
                  flt.s        a6, fa1, fs10
                  fclass.s     s6, ft4
                  srai         s4, t0, 21
                  fsqrt.s      ft0, fs4, rne
                  addi         a6, a4, -1577
                  mulhu        a7, s1, t6
                  feq.s        a7, fs2, fs4
                  remu         s7, a2, s4
                  slli         ra, t6, 20
                  fadd.s       fa0, ft0, fa0
                  fadd.s       fs5, ft2, fs2, rne
                  sltu         t0, s8, t5
                  sra          s4, a4, s1
                  addi         s5, s1, 628
                  lui          s4, 871789
                  fsub.s       ft11, ft5, fa2, rmm
                  fcvt.s.wu    fs5, ra
                  fsgnjx.s     fs1, ft2, ft9
                  fsgnjn.s     ft3, ft3, ft1
                  mul          s9, gp, ra
                  fsqrt.s      fa6, ft6, rne
                  fsgnjx.s     fa5, ft11, fs5
                  mulhu        s4, sp, a0
                  fclass.s     a1, ft10
                  addi         t2, ra, 1773
                  slt          a7, s7, s3
                  srai         a7, a3, 24
                  nop
                  flt.s        s10, fa0, ft10
                  feq.s        gp, fa5, ft2
                  ori          zero, t2, 1990
                  fcvt.s.w     ft7, s0
                  fmv.w.x      ft8, t3
                  auipc        s9, 746300
                  slti         s3, s4, -748
                  feq.s        s5, ft1, fs6
                  ori          s10, t3, -1236
                  fdiv.s       fs5, ft6, fa4, rmm
                  fcvt.w.s     s1, fa6
                  fmul.s       fs3, fs3, fa3
                  or           t6, s7, s7
                  sub          t2, s7, s8
                  ori          s10, t4, -1751
                  addi         t6, s0, 1763
                  mulhu        s8, gp, s1
                  remu         s6, s1, a2
                  or           zero, t1, ra
                  nop
                  srl          t6, t2, s6
                  fcvt.wu.s    a4, fa0, rmm
                  fmv.x.w      s9, ft6
                  fcvt.w.s     t2, fa1, rmm
                  fclass.s     s3, ft11
                  fsqrt.s      ft8, fs10
                  fsgnj.s      ft11, fa1, ft7
                  or           t2, s3, a1
                  sub          s7, a4, a0
                  fmax.s       ft9, ft1, ft3
                  fmax.s       fa5, ft2, ft5
                  fclass.s     a0, fs10
                  rem          zero, s10, s4
                  fsgnjn.s     ft11, fa0, fs9
                  fcvt.w.s     a4, fa0
                  fdiv.s       fs9, fs0, ft9, rne
                  fmul.s       ft7, fs8, fs8
                  slt          sp, a2, s6
                  fle.s        s1, fs7, fs6
                  srai         a1, s6, 19
                  mul          gp, gp, a7
                  fsqrt.s      fa5, ft0, rdn
                  fmin.s       fa4, ft6, ft2
                  fcvt.s.wu    fa7, s1, rdn
                  sll          s0, s1, t6
                  mulh         s10, a0, t2
                  fle.s        s11, fa5, fa1
                  srl          a6, a7, t5
                  srl          a0, t0, a0
                  ori          a3, s10, 1280
                  sltiu        s7, a3, -732
                  fsqrt.s      fs0, ft2, rne
                  fdiv.s       fa7, fa6, ft10, rne
                  feq.s        s5, fs8, fa2
                  fmin.s       ft4, fs11, fs0
                  sltiu        t2, a5, 1653
                  slt          s1, s1, t4
                  fle.s        s8, ft1, fa1
                  fclass.s     s3, fs6
                  add          s1, t2, a2
                  slli         t2, s8, 23
                  xori         s1, s3, 930
                  fmv.x.w      s10, fs2
                  fmul.s       ft2, ft11, fs9
                  slti         t2, sp, 1645
                  mulhu        t0, t4, a7
                  fcvt.wu.s    a2, ft10, rtz
                  mulh         s1, gp, t3
                  fsgnjx.s     ft6, ft7, fa1
                  lui          s8, 418513
                  rem          zero, t6, tp
                  flt.s        zero, fs7, fs8
                  fsub.s       fa2, fs2, fs2
                  fsub.s       fs7, ft10, fs4
                  fclass.s     s5, ft9
                  flt.s        tp, fs9, ft3
                  fsgnjx.s     ft8, fa0, ft7
                  divu         t3, s1, s8
                  slti         s8, s5, 1116
                  add          s10, t2, t0
                  feq.s        t4, ft8, fs5
                  fdiv.s       fs5, fs8, fa1
                  fle.s        s9, fs11, fa2
                  slti         a5, s2, -364
                  mulh         t6, s1, t5
                  fle.s        s3, fa7, fa5
                  sltiu        sp, a5, 1807
                  or           a5, a2, s7
                  fle.s        a0, ft3, fs6
                  ori          t2, s6, 1120
                  sub          a1, t0, t3
                  sra          s10, a4, t4
                  mulhsu       s3, a2, s2
                  fsgnjx.s     fs5, fs7, fa2
                  srli         s9, s11, 11
                  slt          s7, a5, a3
                  fmin.s       fs8, fs10, fs7
                  and          a0, s3, a5
                  rem          a5, s3, a3
                  sub          a0, s6, gp
                  andi         sp, ra, 1814
                  xor          s6, a3, a3
                  remu         s4, s7, a1
                  srai         a0, a3, 5
                  fdiv.s       fa1, fs11, fs7
                  flt.s        gp, ft7, fa7
                  fsgnjx.s     fs9, ft1, fa4
                  fclass.s     a3, ft8
                  fle.s        t2, fa0, fa1
                  fsgnj.s      fa2, fs8, ft4
                  auipc        s11, 439786
                  fadd.s       fs6, ft2, ft2
                  mulh         a5, s3, a4
                  and          t0, s9, a1
                  fmul.s       ft8, fa0, ft10
                  slt          sp, s2, t0
                  ori          s6, t6, -1910
                  fmul.s       fa4, ft2, fa7, rtz
                  fsqrt.s      fa3, ft9
                  fsqrt.s      fa5, ft0
                  slti         a3, t4, 263
                  slti         tp, a6, -1680
                  srl          t2, a0, s7
                  fmul.s       fs10, ft5, fa6
                  slli         a0, zero, 6
                  sltu         zero, s7, s11
                  fle.s        s4, ft11, fa6
                  xor          s8, sp, s8
                  sltu         s3, t1, s3
                  fsqrt.s      fs7, ft6
                  slt          ra, a3, a7
                  andi         t6, a2, 1253
                  auipc        gp, 865991
                  nop
                  srli         s7, a3, 27
                  mul          a2, s3, s9
                  andi         s5, t3, 1721
                  slt          t2, s6, s2
                  srai         t2, t4, 20
                  srl          s5, s6, s9
                  sub          a2, t2, a3
                  xor          a3, a6, s5
                  sltiu        a6, s5, 337
                  fmv.w.x      fs2, a7
                  srl          tp, t0, tp
                  nop
                  lui          a5, 190463
                  auipc        t6, 707102
                  divu         t0, t3, s6
                  fmax.s       ft7, fs6, fs0
                  sra          a2, t3, s4
                  sra          s10, a2, s10
                  fsgnjx.s     fs1, ft10, fs5
                  fcvt.wu.s    sp, fs3
                  and          ra, t5, gp
                  xori         gp, a2, 731
                  srai         gp, a3, 9
                  fsgnjx.s     fs8, fa0, ft8
                  fcvt.w.s     s0, fs4, rup
                  fcvt.s.wu    fs3, s11, rmm
                  fsub.s       fs9, ft7, ft2
                  fclass.s     a4, fs3
                  fcvt.wu.s    s4, ft1, rne
                  mul          a2, ra, zero
                  add          a3, zero, a1
                  mul          t3, s6, tp
                  fsgnjn.s     fs5, ft10, ft5
                  sub          s11, a2, t4
                  srli         s9, s2, 19
                  flt.s        a7, fs10, fs5
                  lui          s8, 281286
                  slti         s11, s6, 264
                  div          s8, t3, s5
                  fsgnjn.s     fa5, fa4, ft5
                  fmv.x.w      gp, fs11
                  fsub.s       ft10, fs5, ft4, rmm
                  srl          a2, s0, t6
                  ori          a2, a1, 87
                  addi         a4, t5, 1007
                  fsgnjn.s     fa5, fa4, fa5
                  remu         s6, a4, t5
                  fsub.s       fa2, fs6, fs2, rmm
                  sra          a2, t6, tp
                  fmv.x.w      s5, fs6
                  fmax.s       ft0, ft8, ft3
                  srli         t3, a5, 15
                  addi         s9, a0, 1456
                  mulhu        s4, s5, s11
                  fcvt.s.wu    fs4, a5, rup
                  fmv.x.w      a6, fs9
                  or           s6, a5, s5
                  fadd.s       ft8, fs5, fs8, rmm
                  flt.s        s3, ft6, ft6
                  xor          t2, tp, s6
                  fsqrt.s      fs5, fa1, rdn
                  mulh         a1, s4, a6
                  andi         s1, s10, 100
                  fsgnjx.s     fa1, fs9, ft8
                  mulhu        zero, t5, s1
                  ori          s1, s5, -1216
                  mulhsu       s6, s4, s3
                  mul          s1, s11, a2
                  ori          t6, a4, 623
                  or           s6, t4, t2
                  slli         s5, a7, 1
                  fsgnj.s      ft11, fs4, fs7
                  nop
                  add          gp, a5, s4
                  mulh         ra, s7, t6
                  lui          a3, 275167
                  div          zero, a1, a3
                  addi         ra, s4, 1429
                  fmin.s       ft8, fa2, ft4
                  fsgnjx.s     ft7, ft11, fa4
                  mulhsu       tp, s4, s11
                  fcvt.wu.s    s10, fs2, rtz
                  slti         t4, s3, -1971
                  fsgnj.s      fs11, fs6, fa5
                  fcvt.s.w     fa1, s1
                  srai         a0, s11, 17
                  addi         s8, t0, -1570
                  fcvt.s.wu    fs2, sp
                  fcvt.wu.s    a0, ft8, rtz
                  fcvt.wu.s    a4, fa7
                  fmv.w.x      fs5, t3
                  remu         s6, t3, t0
                  fle.s        s4, fa5, fa2
                  xor          t0, a6, a7
                  srai         a5, a0, 30
                  fsub.s       fa7, fs5, ft4
                  fsgnjn.s     ft7, fs8, fa0
                  srli         s4, t3, 5
                  sub          a1, a1, tp
                  add          a0, t2, a0
                  fsgnjx.s     fa2, fs11, fs6
                  slli         s3, t3, 30
                  flt.s        a4, fs6, fs10
                  flt.s        s8, ft2, ft6
                  fclass.s     a2, fs10
                  fmax.s       fa5, fa4, fs9
                  slti         a6, a7, 180
                  fcvt.wu.s    s5, ft4
                  fmv.x.w      s0, ft10
                  sltu         a2, a2, s7
                  fsgnj.s      ft1, fa2, ft9
                  div          s10, a1, a7
                  fle.s        s6, ft4, ft0
                  xor          s7, a5, t3
                  fcvt.s.w     fs5, a6, rne
                  divu         t4, s5, s9
                  rem          s11, a4, t3
                  fcvt.w.s     s10, ft2, rne
                  or           t3, a0, a5
                  fcvt.w.s     s5, fa1
                  sub          gp, t5, zero
                  fsgnjx.s     fs4, fa6, fs2
                  slli         s8, s2, 13
                  addi         s5, ra, 212
                  divu         s0, a2, zero
                  mulh         tp, a0, tp
                  divu         t4, s1, a5
                  fsqrt.s      fs5, ft11
                  mulhu        s0, s8, a0
                  fsgnj.s      fa0, ft2, fs9
                  fclass.s     s0, fa6
                  rem          s0, a4, s6
                  fadd.s       fs3, fs5, fs3
                  fcvt.s.w     fa7, t1, rmm
                  sltiu        s6, a7, -25
                  fdiv.s       fs3, fa0, fs0, rdn
                  addi         gp, tp, 1882
                  fmul.s       fa7, fa5, fs7
                  remu         s3, sp, a3
                  fmax.s       fs0, fs4, fs6
                  div          t0, s5, a6
                  nop
                  sra          s10, t0, s10
                  mulhsu       sp, t4, s1
                  fmv.w.x      fs2, sp
                  fdiv.s       ft5, ft6, fs2, rmm
                  srai         s6, s11, 28
                  fsgnjn.s     ft8, ft5, fs9
                  fsub.s       fs1, ft9, ft8, rmm
                  srl          a4, t2, a6
                  divu         a0, a2, gp
                  flt.s        s5, fs9, ft5
                  ori          t0, a7, -943
                  remu         t6, gp, s4
                  mulh         t3, a3, t3
                  addi         tp, t4, -643
                  sltu         s5, gp, t4
                  addi         s1, ra, 0
                  slli         zero, a7, 7
                  slti         tp, t0, 2028
                  fmv.x.w      zero, fs3
                  slti         a0, s7, 613
                  srl          sp, t2, tp
                  xori         a7, s5, 1569
                  mulhu        t2, a6, a6
                  sll          s9, s1, gp
                  xor          a5, s4, a7
                  slli         s1, s6, 7
                  fsgnjx.s     fs4, ft6, fa2
                  srli         s0, s9, 7
                  sub          s1, a2, tp
                  andi         s10, s3, -993
                  fsgnjx.s     ft2, fa7, fa1
                  flt.s        a5, ft0, fa1
                  fmv.w.x      ft0, a7
                  and          s10, zero, t5
                  fmv.w.x      fa4, a1
                  ori          a4, s1, -1811
                  fmv.x.w      tp, ft9
                  fsqrt.s      fs8, fs8, rmm
                  sltu         t3, t3, a0
                  fmv.x.w      tp, fs7
                  fsgnj.s      fa4, fs7, ft5
                  sll          s1, s6, s1
                  fmul.s       fs8, fa3, fs6, rdn
                  srai         sp, t6, 1
                  ori          a0, s4, 2032
                  ori          gp, s4, -1918
                  sra          tp, a2, a4
                  mul          s5, s11, t3
                  fcvt.wu.s    s4, ft10, rdn
                  mulh         t6, t6, a3
                  add          s9, sp, a6
                  slt          t2, gp, s1
                  mul          tp, s8, s2
                  add          zero, a3, s4
                  fsgnj.s      fa1, ft3, ft10
                  fmul.s       fa5, fa6, fs3, rne
                  feq.s        t0, fs0, fa3
                  xor          a7, tp, ra
                  sltiu        s8, a1, 403
                  slt          s4, t0, a4
                  fmv.w.x      fa4, s4
                  sltiu        s5, gp, -1485
                  fmul.s       ft1, ft1, fs4, rmm
                  slli         a3, gp, 21
                  sra          ra, t4, s2
                  fcvt.w.s     s5, fa0, rdn
                  fmax.s       fs10, ft1, fs2
                  or           t6, t2, s6
                  and          s6, t2, s6
                  fmax.s       ft9, ft3, fa2
                  mulhu        t4, ra, sp
                  mulhu        s11, s10, a6
                  ori          ra, ra, -1150
                  mul          a2, a2, a4
                  xori         tp, tp, 1744
                  mul          t3, s0, s3
                  fsub.s       ft4, ft4, fs6, rmm
                  fmv.x.w      s10, ft4
                  srl          sp, sp, t6
                  sra          a2, gp, a3
                  divu         s5, sp, s11
                  mulhsu       s4, gp, t3
                  slli         t4, zero, 2
                  fsgnjn.s     fs5, fs11, fs6
                  slli         t4, zero, 26
                  fcvt.w.s     zero, fs10, rdn
                  add          gp, s1, s4
                  mulhu        t0, a4, s6
                  fle.s        s9, ft5, ft10
                  fmul.s       ft7, fa6, fs0
                  divu         s0, s10, s11
                  fle.s        a2, fs11, fa6
                  slt          s9, t6, s3
                  slli         zero, t4, 30
                  slt          a2, gp, s9
                  fcvt.s.w     fa5, s8, rup
                  slt          s0, sp, a1
                  lui          t6, 365633
                  xori         s3, tp, -610
                  nop
                  fadd.s       fa3, ft11, ft1
                  fmul.s       ft4, fa3, fa4, rne
                  rem          s8, a4, a1
                  fsqrt.s      fa4, ft3, rup
                  srl          s1, s2, s5
                  slti         t4, ra, -1739
                  lui          a7, 771814
                  fcvt.s.wu    fs7, s1
                  mulh         a4, sp, s8
                  or           s9, a6, a7
                  fsgnjn.s     fs10, ft11, fa1
                  slti         a7, a1, 2009
                  rem          a4, sp, a4
                  fdiv.s       fs4, ft11, fs3, rmm
                  fdiv.s       fa7, fs3, ft1
                  mulhsu       tp, s7, s0
                  mul          sp, s8, t4
                  fsqrt.s      fa6, fa3
                  or           s6, zero, s11
                  fclass.s     gp, fs10
                  fmv.w.x      ft8, sp
                  divu         a3, s1, zero
                  srl          s9, ra, t4
                  sltiu        a2, t0, -892
                  sub          s11, s2, s7
                  lui          a7, 181869
                  div          t6, ra, s1
                  slt          s3, a3, s3
                  fcvt.s.w     fs8, a3, rtz
                  srai         s5, s9, 12
                  srai         s9, t1, 21
                  fsgnjx.s     ft1, fa6, fa0
                  fadd.s       ft6, fs9, fa4
                  fsgnj.s      fs9, ft3, ft10
                  sltu         a1, a2, a6
                  fsgnjx.s     fa6, fs3, ft1
                  fsgnj.s      fa3, ft10, fs9
                  div          s4, s11, s3
                  sub          zero, t6, s8
                  fsgnjx.s     ft11, ft10, fs6
                  fcvt.wu.s    gp, fs7, rtz
                  mulh         s6, a7, s6
                  slt          a4, a5, a3
                  sll          a3, t0, s0
                  fcvt.s.wu    fa4, s5, rdn
                  rem          ra, a7, t5
                  fle.s        t4, ft6, fa7
                  sltu         s5, a3, ra
                  sra          s0, s10, s4
                  fsgnjn.s     fs10, fs9, fs0
                  srli         s3, a1, 25
                  auipc        s8, 679924
                  sll          s4, t4, s6
                  srli         tp, a7, 1
                  fcvt.wu.s    a4, ft4, rmm
                  sltiu        a3, a2, -1254
                  fmv.w.x      fa0, a6
                  mulh         gp, s11, t0
                  fcvt.wu.s    zero, ft10
                  auipc        a6, 303073
                  fcvt.wu.s    t3, fs2
                  xor          s5, t1, tp
                  slli         ra, s0, 30
                  divu         sp, s10, s10
                  fcvt.s.w     ft3, a7, rne
                  and          s4, s6, t1
                  xori         t3, s11, -628
                  fcvt.w.s     a4, ft6, rne
                  fsgnj.s      fa3, ft7, fs10
                  srl          t4, s8, a3
                  remu         ra, a0, ra
                  ori          t4, s1, 1685
                  fcvt.w.s     t3, ft6, rdn
                  slli         a5, ra, 18
                  fmax.s       ft11, fs0, ft9
                  lui          t2, 70627
                  fmax.s       ft8, fs0, fs6
                  fmax.s       ft9, fs4, fa1
                  fmin.s       ft2, ft5, fs11
                  remu         s4, s8, s2
                  xori         a5, s1, -215
                  fsgnjn.s     fs1, fs2, ft5
                  sub          t3, s5, t5
                  andi         a1, s8, 734
                  fcvt.w.s     s9, fs1
                  nop
                  sll          t3, a6, t4
                  fsgnj.s      fa3, ft4, ft9
                  fsgnjn.s     fs7, fs6, fs10
                  and          t4, a0, t6
                  lui          t0, 349369
                  mulhu        a3, t5, s10
                  flt.s        t3, fs10, ft0
                  mulhu        s3, s4, s7
                  auipc        t2, 381889
                  flt.s        t0, ft9, fa3
                  fmax.s       fa0, fa3, ft0
                  sltu         s4, t3, t2
                  fmv.w.x      ft0, a0
                  fmin.s       fa5, fa5, fs9
                  sltu         gp, gp, gp
                  sltu         t2, s11, s9
                  srai         a4, t5, 17
                  ori          s0, s1, 103
                  xor          zero, s7, a6
                  fsgnj.s      fa6, fs6, ft7
                  fsqrt.s      fs3, fa0, rne
                  fmax.s       fs3, fa2, fs10
                  mulhsu       t3, s2, s9
                  fle.s        tp, fa3, ft4
                  and          s7, gp, s3
                  fmin.s       fa2, fs6, fa2
                  fmul.s       ft5, fa4, ft7
                  fsgnj.s      fs1, ft9, fs0
                  mulhsu       sp, s11, sp
                  and          gp, s2, zero
                  fcvt.s.w     fs11, gp, rdn
                  mulhsu       a6, s0, s2
                  fcvt.s.w     ft6, s2
                  xori         a3, a3, -703
                  fsgnj.s      fs11, ft1, fs1
                  div          sp, t2, s6
                  mul          s4, s1, ra
                  xori         s8, s3, -987
                  fadd.s       fs2, ft9, fa7, rdn
                  fmv.x.w      s0, fs0
                  fsub.s       fa2, fa7, ft8
                  sub          s7, t5, a4
                  fsqrt.s      fa3, fs9
                  rem          a6, t1, a6
                  slli         s9, t4, 0
                  srli         a3, s4, 10
                  addi         ra, s0, 190
                  or           tp, t1, a5
                  mulhsu       s0, s10, gp
                  and          s4, s11, a4
                  srli         t0, s6, 12
                  fmul.s       fs8, fa2, ft10
                  sltu         t6, s6, a4
                  slli         s9, s2, 2
                  slt          s7, t1, s8
                  mulh         s4, a2, t3
                  lui          gp, 223045
                  fmin.s       fs5, ft6, ft5
                  nop
                  srl          s1, s6, s2
                  fsqrt.s      ft3, fa2
                  fmv.w.x      fs10, s6
                  lui          a6, 610775
                  fsgnjn.s     fa7, ft5, fs9
                  ori          zero, s1, 205
                  remu         ra, gp, s7
                  fsqrt.s      fa5, ft0, rtz
                  andi         a0, t3, 1701
                  fle.s        s4, ft3, fa5
                  mul          a7, a7, a4
                  flt.s        s3, fa7, fs6
                  fmv.w.x      fs10, tp
                  div          s10, s0, t6
                  fcvt.s.w     fa7, tp, rup
                  slli         sp, a4, 5
                  feq.s        a2, ft0, ft5
                  mulh         s11, a4, tp
                  add          s1, s10, t2
                  nop
                  addi         a1, s4, -881
                  slli         a6, s0, 6
                  fmax.s       ft2, fa6, fs5
                  fcvt.w.s     s1, ft3
                  fmin.s       fs5, ft5, ft3
                  fcvt.w.s     sp, fa0, rtz
                  mul          tp, tp, a0
                  and          a3, a0, a7
                  or           s4, s1, tp
                  nop
                  addi         t6, gp, 1410
                  xor          zero, s9, s11
                  fdiv.s       fa0, ft2, ft2, rne
                  fclass.s     s9, fa2
                  fmv.x.w      t0, fs4
                  sub          s4, a6, s7
                  fcvt.s.w     fs10, ra, rup
                  mulhu        s4, s2, t3
                  fle.s        t3, ft11, fa1
                  fcvt.wu.s    gp, fs3, rtz
                  remu         gp, t5, s2
                  ori          s7, s6, -1146
                  srli         s11, t3, 20
                  flt.s        s3, ft5, ft3
                  divu         a7, s4, sp
                  fsgnjn.s     ft8, fa4, fs6
                  srl          gp, s7, s8
                  mulh         s5, a3, tp
                  fsgnjn.s     fa0, ft0, fa5
                  srli         a6, s0, 27
                  fle.s        a0, ft11, ft6
                  mulh         t3, a7, t4
                  div          s9, s4, s11
                  remu         s4, a2, s4
                  fcvt.s.w     ft6, t3, rtz
                  mulhsu       s4, a4, s1
                  div          a4, s10, gp
                  slt          s4, a1, a5
                  fmin.s       fs2, fa2, ft1
                  sll          s7, zero, a5
                  fclass.s     t3, ft1
                  srl          s5, s0, a3
                  fmin.s       ft5, fa6, fs2
                  slt          s6, s8, s10
                  flt.s        zero, fa6, ft6
                  and          s3, s3, t3
                  fcvt.s.w     fs5, s3
                  nop
                  slt          t6, t0, a6
                  fcvt.wu.s    a6, fs4
                  slli         gp, t2, 11
                  xori         s3, gp, -321
                  fsub.s       fa6, fs2, fs10, rmm
                  xor          t4, t5, s10
                  fcvt.s.w     fa3, s3, rtz
                  remu         a7, s4, tp
                  rem          ra, s8, s7
                  fdiv.s       fa6, ft11, ft0, rtz
                  addi         t6, s2, -654
                  fmv.x.w      a2, ft4
                  fcvt.wu.s    sp, ft6
                  fsgnjx.s     fa5, fs3, fs1
                  fclass.s     t6, ft5
                  div          s10, t3, s2
                  fcvt.wu.s    s8, fs2, rtz
                  fmul.s       ft9, ft6, ft4
                  fmv.w.x      ft2, s9
                  slt          t4, a6, tp
                  sra          a0, t0, a2
                  fsqrt.s      fa2, fs2
                  nop
                  or           gp, s2, a7
                  ori          s11, t4, 1739
                  fcvt.s.wu    fs7, s2, rup
                  mulhu        a6, a0, t3
                  or           a3, s0, a2
                  mulhu        a6, s9, sp
                  sll          s6, a2, s10
                  fsgnjx.s     ft1, fs7, fa0
                  sll          a5, s0, a4
                  fsgnjn.s     ft3, ft8, ft0
                  fmv.w.x      fs7, t1
                  lui          s1, 764472
                  and          s5, a7, s4
                  sub          a5, s6, t2
                  remu         s4, tp, s7
                  srai         s5, zero, 12
                  sll          a7, gp, ra
                  add          t0, s5, a2
                  sra          s6, tp, s7
                  fadd.s       ft4, ft8, fa5
                  remu         s3, a1, s11
                  lui          a0, 256418
                  mul          t0, a1, zero
                  srai         s11, ra, 24
                  slti         a7, t4, 865
                  fdiv.s       fs7, ft10, fs8, rne
                  sub          a5, a4, a2
                  nop
                  fadd.s       fs8, fa3, ft3
                  fcvt.s.wu    ft1, t3
                  xori         s6, a4, -837
                  flt.s        s11, ft4, fa0
                  fsqrt.s      fs5, ft1, rtz
                  mulh         gp, s11, s4
                  sltiu        a0, tp, 743
                  fmv.w.x      ft7, ra
                  xor          s0, a7, zero
                  flt.s        ra, fs7, fa0
                  fdiv.s       fa4, ft2, fs1, rmm
                  divu         s9, a1, gp
                  fsgnjx.s     fs11, ft9, fs10
                  slli         a6, t6, 28
                  feq.s        a6, fa6, fa6
                  fsgnj.s      fa2, ft4, ft1
                  fmax.s       ft2, fa3, fs3
                  fmul.s       fa0, fa6, fs11
                  rem          tp, zero, s11
                  andi         t6, s5, -1623
                  and          t4, ra, gp
                  fle.s        s10, fa5, fs4
                  fsgnj.s      fs9, fa7, fs10
                  srai         s6, tp, 19
                  xori         tp, zero, 408
                  fsub.s       ft2, ft0, ft3
                  fclass.s     s10, fa2
                  fcvt.w.s     s11, fs3
                  fclass.s     s0, ft6
                  fle.s        a1, fa4, ft4
                  addi         s5, sp, 1743
                  fcvt.w.s     s3, ft9
                  feq.s        s9, ft9, fs11
                  srl          s1, ra, gp
                  srli         a7, t0, 28
                  xor          s1, a3, a1
                  or           s5, s10, ra
                  andi         t2, a3, -1828
                  slti         s1, a4, -646
                  mulhsu       tp, t5, s7
                  sub          zero, ra, s8
                  fsub.s       fs0, ft11, ft0
                  and          s4, t5, gp
                  xori         s8, s3, 1031
                  fmul.s       fs6, fs6, fs9, rtz
                  mulh         a0, s2, tp
                  fmin.s       fs5, fs10, fs5
                  ori          s10, s9, 1769
                  slt          s10, s4, t4
                  and          s6, s9, t2
                  or           s3, s1, t4
                  sll          a3, sp, s7
                  mulh         s8, a0, s9
                  sltu         s9, s6, a4
                  mulhsu       s8, sp, a3
                  fsub.s       fs11, fa4, fs4
                  and          t6, s10, s2
                  divu         t4, t6, s2
                  xor          a0, t3, s9
                  fsgnj.s      fs5, ft11, ft6
                  fmul.s       fa3, ft1, ft6
                  div          a6, s3, a7
                  or           s11, sp, s11
                  fmv.x.w      s7, fs9
                  srli         a3, a1, 19
                  fmv.x.w      s3, fa1
                  slt          sp, a7, t4
                  or           s9, tp, s6
                  fle.s        s6, fs4, fa2
                  fmin.s       fa1, fs11, ft8
                  fsgnjx.s     fs0, fa5, ft1
                  fsgnjx.s     fa5, ft1, ft8
                  fcvt.s.w     ft9, s3
                  mulh         a2, ra, gp
                  andi         zero, s8, 409
                  sra          a1, a7, t0
                  or           a1, s4, a5
                  ori          a6, a7, 1276
                  sub          s11, s4, s11
                  mulhsu       s4, a1, t3
                  fmul.s       fa4, fs9, fs1
                  srli         s0, a3, 20
                  fmin.s       fs11, fs4, fa2
                  fsgnjn.s     fs11, fa5, ft11
                  mulhsu       t4, a7, a4
                  or           a2, ra, s4
                  addi         a1, s4, -31
                  fcvt.s.wu    ft9, sp
                  fclass.s     s5, fs8
                  mul          a7, t6, sp
                  fdiv.s       ft9, ft4, fs6, rne
                  or           zero, a7, s7
                  fmin.s       fs8, fs7, fa3
                  fcvt.w.s     a4, ft3
                  slt          s9, s3, s3
                  feq.s        s4, ft8, fs5
                  fcvt.wu.s    a5, fs3
                  fmv.x.w      t4, fa0
                  mulh         s9, tp, tp
                  slt          s11, s3, a0
                  fsqrt.s      ft10, fs10
                  addi         sp, ra, -204
                  sltu         a7, a2, a1
                  sltu         a1, a2, s6
                  fsub.s       fs1, ft3, ft4
                  sra          t2, t5, a0
                  sltu         a6, s11, gp
                  mulhu        a2, t2, s8
                  fcvt.s.wu    ft3, s2, rdn
                  andi         s0, s11, 781
                  srl          a6, s5, sp
                  lui          s8, 262337
                  slt          a3, t6, t6
                  xori         s8, tp, -1395
                  mulhsu       gp, t3, t2
                  fadd.s       fa6, fa1, ft11
                  div          t4, s1, t0
                  xor          s9, a0, s5
                  fle.s        a3, fa1, fs1
                  fsub.s       fa6, fs2, fs3
                  mulhu        t3, a6, s8
                  srli         s8, s10, 18
                  andi         a3, s8, -699
                  mulhu        s9, ra, gp
                  fsgnj.s      ft4, ft10, fs11
                  lui          t3, 102151
                  divu         t3, s1, a5
                  fadd.s       ft0, ft3, fa1, rmm
                  srai         a3, s8, 31
                  slt          sp, t0, s7
                  fsub.s       fs10, fa5, ft1, rmm
                  sltu         s1, s9, a5
                  srai         t3, a7, 4
                  add          a7, s1, a1
                  slt          a5, tp, s3
                  mulh         a4, gp, a3
                  sll          s0, s9, t2
                  fle.s        a7, fs7, ft9
                  fcvt.s.w     ft8, s2, rdn
                  rem          s7, t5, s9
                  auipc        a5, 615848
                  fmv.x.w      tp, ft11
                  slti         a6, t3, 1124
                  xori         a6, s3, 93
                  fmin.s       ft6, fa7, ft2
                  fmul.s       ft10, ft3, fs2
                  andi         a7, t6, 1329
                  mulhsu       t0, t3, a0
                  mulhsu       s7, a0, s5
                  fclass.s     s9, fa6
                  or           s9, a1, s4
                  sub          s1, a1, s0
                  fsqrt.s      ft7, ft1, rmm
                  remu         a2, t0, s5
                  andi         gp, s4, 89
                  and          t2, t2, s2
                  remu         s3, s3, t4
                  fsgnj.s      fs4, fs5, fa1
                  addi         s3, s1, 1265
                  mulhsu       a6, s8, s10
                  fsub.s       fs1, fs3, ft1, rdn
                  fsqrt.s      fs8, ft1, rtz
                  fsgnjx.s     fs3, ft7, fa1
                  fle.s        s10, fs6, fs8
                  remu         s3, a5, a0
                  lui          t3, 271448
                  mulhsu       s7, a1, gp
                  fmax.s       ft6, fa2, fs10
                  srl          s1, tp, t0
                  auipc        a3, 225052
                  and          t4, a1, a5
                  mulh         s8, a5, a0
                  fclass.s     gp, fa6
                  srl          a3, a1, a4
                  mulhsu       s6, s4, s7
                  fmv.x.w      t0, ft5
                  srli         a7, s4, 2
                  fadd.s       fs2, fa6, fs2
                  sltu         a6, t5, t1
                  addi         t3, a6, -1340
                  fsub.s       fs2, ft5, fa6
                  fmax.s       fa6, ft9, fs6
                  fadd.s       fa3, fs3, fs3, rmm
                  mulhsu       a0, t2, t1
                  auipc        a0, 23929
                  addi         s6, t2, 1176
                  srl          gp, t6, a3
                  fmin.s       ft3, fs7, fa3
                  mulhsu       t2, t0, a5
                  sltu         t0, tp, a2
                  flt.s        s10, fa5, fs2
                  fsgnj.s      ft2, fa4, ft10
                  slti         a2, s3, -160
                  rem          a1, t3, t6
                  div          ra, t6, s0
                  flt.s        s3, ft1, ft0
                  auipc        a4, 60961
                  ori          s10, a0, 541
                  fcvt.s.wu    fa6, ra, rmm
                  fcvt.s.wu    ft9, gp, rdn
                  ori          s4, a0, 508
                  slti         s8, s4, 826
                  fmv.w.x      fa7, a7
                  xori         a5, s3, 647
                  fdiv.s       ft1, fa6, fs5
                  xor          t4, a0, s1
                  mul          sp, zero, t6
                  xor          a1, t4, t4
                  sll          s7, t1, s9
                  fmul.s       fa4, ft1, fs10
                  xori         gp, a4, -608
                  addi         s10, a1, -864
                  fcvt.wu.s    tp, ft8, rmm
                  slli         t3, s6, 31
                  fcvt.wu.s    a2, fs11, rmm
                  fcvt.w.s     s8, ft11
                  mulhu        s8, s6, s9
                  slti         s10, t3, -540
                  flt.s        gp, fs9, ft2
                  ori          s9, a2, -1819
                  srai         s3, a2, 10
                  fmin.s       fs8, ft11, ft3
                  fcvt.wu.s    s9, fs11, rne
                  lui          s8, 697298
                  remu         a3, s9, a5
                  fadd.s       fa6, fs11, fs2, rmm
                  sra          s7, s5, t2
                  divu         s9, t0, a6
                  div          s0, a1, sp
                  add          s7, s0, tp
                  srl          a1, a2, ra
                  lui          t4, 103057
                  slli         t0, sp, 14
                  mulhu        a5, t4, a4
                  mulhu        t2, t4, s5
                  nop
                  add          a6, s6, s0
                  sll          s9, s2, s10
                  fmv.w.x      fa2, a6
                  fmax.s       ft3, ft7, fa3
                  fclass.s     gp, fs8
                  nop
                  srli         t2, a0, 6
                  fmin.s       ft6, fs10, fs10
                  divu         t6, s6, gp
                  nop
                  fmv.w.x      ft0, a5
                  fcvt.s.w     fa4, a1, rmm
                  divu         sp, s4, t3
                  sll          s8, a2, a3
                  feq.s        a0, fs11, fs5
                  mulhu        t3, s7, a4
                  fdiv.s       ft3, fs3, fs3, rdn
                  andi         a4, t2, -1313
                  fsgnjx.s     ft5, fs6, fs3
                  add          s5, s8, a1
                  rem          ra, s10, t4
                  sra          gp, s0, t1
                  fmax.s       fa0, fs1, fs11
                  mulhsu       s5, a7, s9
                  fmv.w.x      fs11, s4
                  andi         a6, t1, -265
                  auipc        a4, 969697
                  lui          a5, 962138
                  xor          t0, t5, s7
                  and          s4, a7, s2
                  lui          s5, 259036
                  fmv.x.w      s1, ft6
                  fmax.s       fs7, fa1, fs1
                  flt.s        s0, fs3, ft5
                  fcvt.wu.s    t2, fa6
                  fclass.s     gp, ft2
                  nop
                  slli         s10, t3, 6
                  nop
                  addi         t2, a4, -1548
                  fmin.s       ft11, fs3, fa5
                  div          s0, s10, a5
                  fsqrt.s      fa6, fa6, rtz
                  fcvt.w.s     t0, ft4
                  fsgnj.s      fs11, ft9, fs9
                  fclass.s     s1, fs10
                  slt          t0, s4, s4
                  sra          s11, s5, s0
                  slti         a5, a0, -530
                  mul          a3, tp, s4
                  sltu         s10, t5, a1
                  mulhu        t4, s9, s8
                  srai         s3, a4, 9
                  ori          s10, t1, -1824
                  or           a0, s6, a3
                  sltu         s10, ra, t6
                  andi         a3, a7, 2043
                  srl          a5, s2, s6
                  or           t6, a3, t0
                  srai         a4, t2, 18
                  or           t3, a7, a1
                  addi         a5, s10, -1018
                  divu         t6, t3, s6
                  sra          s9, a4, a1
                  div          tp, s3, a3
                  fsqrt.s      ft1, fs2
                  andi         s1, ra, -1448
                  fcvt.wu.s    zero, fs9
                  or           s0, sp, t0
                  fsgnjx.s     ft10, ft6, fa0
                  lui          t6, 221501
                  divu         s6, s1, s5
                  add          s6, s1, t0
                  srl          a5, s4, a7
                  sub          a0, zero, s4
                  remu         s7, a4, zero
                  fcvt.s.wu    ft1, s5
                  rem          a3, s11, zero
                  sub          t4, ra, t5
                  auipc        sp, 928179
                  fmax.s       fa3, ft5, fs2
                  xori         a2, s4, -1296
                  slti         s11, zero, 1601
                  auipc        s7, 724533
                  mul          t2, s4, s8
                  mulh         t2, gp, t5
                  remu         a1, sp, a7
                  slti         s9, a1, 1564
                  flt.s        s10, ft1, ft4
                  andi         s8, gp, 717
                  srai         s5, s4, 11
                  auipc        zero, 597903
                  sll          a2, s10, t6
                  fclass.s     s1, ft5
                  fclass.s     zero, fs6
                  sltu         t2, s9, s3
                  add          t6, t1, s2
                  ori          s10, s6, 508
                  fle.s        t4, fs7, ft0
                  sra          a4, a1, s1
                  fdiv.s       ft8, ft6, fs0, rmm
                  fsgnj.s      fs4, fa5, fa0
                  sra          s9, t4, t3
                  andi         sp, a3, 383
                  divu         tp, s10, t3
                  sltu         sp, s5, t5
                  fsub.s       fs11, fs2, fa0
                  fsgnj.s      fa7, fs6, fs2
                  addi         s11, s9, -340
                  sltu         s4, s8, s9
                  andi         s3, s2, -734
                  sltu         t3, t6, a6
                  fle.s        t4, ft7, ft10
                  srai         a7, t3, 19
                  lui          s11, 245558
                  srai         a3, a7, 29
                  feq.s        s10, ft10, fs6
                  feq.s        a3, ft5, ft3
                  sltu         zero, zero, s6
                  srl          a7, t2, s2
                  sll          sp, ra, s8
                  ori          sp, t2, 1015
                  fmv.x.w      s5, fs0
                  sll          s9, s3, t0
                  fmax.s       fs1, ft6, fs0
                  srai         a0, a7, 2
                  slt          a1, t2, s0
                  srl          s8, s9, t3
                  fcvt.s.w     ft7, a1, rtz
                  fmax.s       fa2, fa7, ft6
                  lui          t2, 667591
                  fcvt.s.w     fs11, s4, rup
                  fcvt.wu.s    t4, fa5
                  fmul.s       fs6, fs11, ft3, rtz
                  ori          s6, t1, 455
                  fsqrt.s      fs3, fs5, rtz
                  xori         s3, t6, 97
                  srai         sp, a4, 5
                  fsgnjn.s     fs9, fs1, fs9
                  sra          s8, t0, t6
                  remu         gp, t5, a6
                  sltiu        s1, s11, 239
                  and          tp, t5, t5
                  or           s6, a7, s11
                  divu         s4, t1, s9
                  and          t3, a1, a1
                  or           s11, s8, a7
                  add          s8, a4, a7
                  sltiu        a5, s0, -1641
                  fcvt.s.w     fa6, t0, rne
                  fcvt.w.s     s10, fs4, rne
                  fle.s        a1, ft6, ft5
                  slti         s6, s6, -1643
                  divu         s11, t3, a3
                  mulhu        ra, a6, s9
                  fcvt.s.w     fs5, t2
                  flt.s        s0, fs8, ft10
                  srai         s4, t3, 21
                  slt          t3, s0, t1
                  srai         t2, t1, 20
                  and          a2, zero, a2
                  mulhsu       a1, t0, s1
                  slli         s11, a7, 30
                  xor          a4, s1, zero
                  fmv.w.x      fs8, t6
                  fmin.s       ft3, fa3, fs11
                  fsgnjn.s     ft2, fa0, fa0
                  fsgnjx.s     fa3, ft8, fs3
                  remu         s11, s7, s9
                  mulhsu       a6, tp, a1
                  div          t4, s5, t0
                  andi         s8, a1, -275
                  xor          s6, s9, a4
                  lui          s0, 132082
                  fmax.s       fs8, ft4, fs6
                  sltu         sp, sp, a0
                  mulhu        a2, s8, s7
                  fsqrt.s      ft11, ft7
                  fmin.s       fs2, ft3, fa6
                  flt.s        s3, fs7, fs9
                  fle.s        a0, fa3, ft11
                  flt.s        ra, ft9, fa1
                  sub          t6, s4, tp
                  slt          s5, a1, t6
                  fmul.s       fa0, fa0, fs3, rup
                  and          sp, s3, s2
                  and          s0, s2, a3
                  sltu         a0, t3, a7
                  fmin.s       ft7, fa7, fa5
                  sra          s7, t1, a3
                  mulhsu       t0, s5, a5
                  fsqrt.s      fs4, ft3, rdn
                  div          gp, s2, gp
                  fsub.s       ft1, fs2, ft8
                  slti         a2, s2, 1824
                  fle.s        a0, ft1, fs3
                  fcvt.s.w     fs7, t5, rdn
                  slt          s4, s4, s5
                  fcvt.s.w     ft3, gp
                  srai         ra, t4, 21
                  fle.s        a7, ft0, ft1
                  rem          a0, s0, a1
                  sltu         s1, s3, s3
                  fsqrt.s      fs7, fa0, rne
                  fsgnjn.s     fa1, ft0, fa7
                  feq.s        s7, ft8, ft10
                  slt          a7, s9, sp
                  rem          t2, s8, zero
                  fsub.s       fs4, fs0, fs1, rne
                  lui          s8, 693686
                  sub          a5, tp, a5
                  fle.s        t2, fs2, fs11
                  mulhsu       zero, zero, t5
                  andi         t4, tp, -1923
                  fcvt.s.wu    ft1, t2, rmm
                  fsgnjx.s     fa1, ft9, fs1
                  flt.s        s9, fs3, ft7
                  fmv.x.w      s10, ft8
                  addi         t2, s7, 838
                  andi         a6, t1, 569
                  fsgnjn.s     ft9, ft6, ft4
                  fdiv.s       fs3, fa2, ft9
                  fcvt.w.s     tp, fs0
                  nop
                  fdiv.s       ft11, fs7, fa4, rmm
                  fmin.s       ft6, ft10, fs1
                  sra          t6, a4, gp
                  remu         s11, s1, t1
                  fle.s        s11, ft5, fs8
                  sra          s1, s4, t4
                  sltu         sp, a4, t4
                  and          s0, t6, a1
                  or           sp, t6, a2
                  auipc        tp, 69450
                  srli         s11, t1, 10
                  sll          s5, a6, zero
                  rem          a3, s6, s8
                  auipc        s11, 799400
                  srl          s3, t5, tp
                  mulhu        s8, s3, tp
                  sltu         t6, s3, s4
                  fle.s        ra, fs8, ft9
                  fsgnjn.s     fa0, fs9, fs7
                  and          a4, t3, a2
                  fcvt.w.s     s3, ft1
                  ori          ra, s3, 1115
                  fmax.s       fa0, fs9, ft5
                  fmv.x.w      t4, fs10
                  sltu         a6, ra, t3
                  fmv.w.x      fs6, s4
                  fsub.s       fa6, fs1, ft10, rtz
                  fmv.x.w      a6, ft5
                  add          s9, s0, a5
                  fmul.s       fa7, ft9, fs10, rtz
                  fsgnjn.s     fa2, fs9, ft4
                  fcvt.s.w     fa4, a5
                  fcvt.w.s     s1, ft5, rup
                  addi         a7, a3, 1754
                  fcvt.s.w     fs4, a3, rdn
                  andi         s10, s0, -382
                  fcvt.s.w     ft3, ra
                  feq.s        s4, fa1, fs9
                  feq.s        s5, ft9, fs10
                  mulhsu       s7, s3, s11
                  sub          gp, t4, s10
                  fcvt.s.w     fs9, s6
                  fcvt.wu.s    a6, ft0
                  div          s10, s0, s3
                  fcvt.s.w     ft5, a3, rmm
                  fsqrt.s      ft11, fa0
                  addi         sp, s1, 1241
                  nop
                  fsgnjx.s     ft2, ft1, ft2
                  srli         a5, ra, 17
                  sub          s11, s4, s6
                  fmv.w.x      fs6, t3
                  fsub.s       fs9, fs4, fs7
                  fsgnj.s      fa5, fa7, fs3
                  fadd.s       fs9, ft2, ft10
                  fmul.s       ft11, fa6, ft7
                  sub          a1, a2, a6
                  sra          s8, t0, s7
                  sra          a5, t6, s2
                  fadd.s       ft6, ft10, ft10
                  fmv.x.w      sp, fs9
                  fsgnjn.s     fa3, ft2, fs5
                  sll          s11, t4, s11
                  remu         s1, s10, a4
                  divu         s1, a3, s9
                  fcvt.s.w     fs10, a0
                  fsgnj.s      ft0, ft10, fa7
                  mul          a0, s6, t6
                  fclass.s     a5, fs6
                  fsgnjx.s     fa0, ft8, fa0
                  fmv.x.w      s5, fs3
                  div          t2, t3, s2
                  andi         gp, t2, -1823
                  fcvt.s.wu    fa0, s8
                  fmin.s       fa1, fa4, ft7
                  fmul.s       fa7, ft11, ft3, rne
                  and          a3, s4, t2
                  xor          t0, s2, a7
                  sltu         s6, s4, a0
                  xori         s5, t5, 1394
                  fdiv.s       ft8, fs2, fs8, rdn
                  fadd.s       fs2, fa4, fs1, rup
                  feq.s        sp, fs9, fs4
                  slti         t3, t5, -1724
                  xori         t0, a2, -1196
                  and          t6, t3, gp
                  fcvt.s.w     fs8, a2, rne
                  srai         t4, a4, 20
                  fcvt.s.w     ft3, a5
                  fmin.s       fs5, fa5, fa0
                  srl          zero, s1, t6
                  feq.s        a0, ft10, ft8
                  and          a5, t3, tp
                  fcvt.s.w     fa2, s2, rmm
                  sra          t4, tp, t6
                  fclass.s     s7, ft9
                  srai         zero, ra, 18
                  sll          ra, a7, a4
                  fsgnjx.s     ft1, fs9, fs5
                  mul          a6, t1, sp
                  sra          a6, ra, t6
                  srli         sp, t3, 0
                  sra          s0, sp, t5
                  flt.s        gp, ft8, fa6
                  mulh         s1, a3, a1
                  fsgnjx.s     fa2, fs0, fs4
                  xori         t4, s8, 1799
                  fsqrt.s      ft10, fs5, rdn
                  fsgnjn.s     ft5, fs8, fa1
                  srai         s7, s5, 13
                  flt.s        ra, ft4, fs4
                  fsqrt.s      ft10, ft1, rtz
                  addi         a0, s3, 191
                  slt          ra, s3, s0
                  div          t2, a6, a7
                  fsub.s       ft2, fs3, ft11
                  lui          s9, 56948
                  fclass.s     a6, ft5
                  fmv.x.w      t4, fa7
                  slt          a2, a3, t2
                  sltu         a2, t2, s2
                  mulhsu       s10, t2, t3
                  fle.s        tp, fa6, fa4
                  lui          a2, 634011
                  slt          s3, s7, s5
                  fsgnjn.s     fa3, fs10, fs11
                  fsgnjn.s     ft6, fs0, fs7
                  div          a5, a1, a5
                  auipc        t4, 241856
                  sltiu        s0, t4, 362
                  mul          a1, s11, a6
                  flt.s        sp, fa6, fs2
                  fsgnj.s      ft4, fs9, ft2
                  sll          a6, s10, s8
                  rem          a2, a5, t0
                  flt.s        t6, fs7, fa2
                  fmv.x.w      s4, fa0
                  lui          a3, 903306
                  and          ra, t2, a2
                  sra          s10, tp, s11
                  xor          a3, zero, sp
                  slt          s9, gp, a2
                  sra          a0, a0, ra
                  remu         t0, s9, s2
                  or           s5, s9, sp
                  fmax.s       fa2, fa6, ft4
                  fcvt.s.wu    fs4, a0, rtz
                  fadd.s       fa2, fs9, ft7, rtz
                  srli         s11, a2, 15
                  fcvt.s.wu    ft9, t1
                  fclass.s     t0, fs10
                  sll          s3, s5, s10
                  remu         gp, s9, t4
                  fsqrt.s      fs8, fs11, rdn
                  sll          a0, t5, a0
                  fdiv.s       fs2, ft1, fs0, rmm
                  remu         t4, a0, s7
                  sltu         tp, s11, t1
                  ori          s6, t6, 722
                  fclass.s     t3, fa4
                  add          gp, s10, s10
                  fadd.s       fs3, ft6, fa7
                  fdiv.s       fs9, ft1, fs5, rup
                  fmul.s       ft5, fs0, fs2, rdn
                  feq.s        s11, ft7, ft10
                  mulhu        a4, s0, t0
                  fsub.s       ft11, fa3, ft0, rtz
                  fclass.s     t2, fa4
                  srai         s5, s7, 19
                  fsqrt.s      fs8, fa0
                  slt          s3, a1, s5
                  fsqrt.s      fs0, ft0
                  slli         s9, a6, 20
                  xori         tp, gp, -1307
                  fmv.w.x      fa5, s11
                  add          s5, a4, gp
                  fcvt.s.wu    fa5, s1
                  ori          s6, a0, -2038
                  divu         gp, zero, s9
                  srai         t4, a3, 23
                  fmin.s       fs5, ft8, ft1
                  xori         tp, t6, 1953
                  mulhsu       s4, ra, t3
                  slti         t4, zero, 828
                  fcvt.w.s     gp, fa7, rup
                  sltu         a2, s10, t1
                  fdiv.s       fa5, fa1, ft9
                  fsgnjn.s     fs3, fs5, fs5
                  slti         a6, t1, 101
                  sltiu        t0, s1, 1168
                  add          s10, ra, s2
                  sltu         t4, s5, s1
                  fmax.s       fa4, fs3, ft5
                  sub          t0, a2, tp
                  fmv.w.x      fs8, t1
                  slti         t4, gp, 1957
                  fmul.s       fs3, fs6, fs4
                  or           gp, s7, t4
                  fmax.s       ft11, ft10, fa5
                  remu         a0, s1, s0
                  fsgnjx.s     fa2, fs5, ft1
                  and          s7, s0, a3
                  rem          zero, s5, s5
                  xor          a5, s1, gp
                  remu         a7, a5, s10
                  fmin.s       fa7, ft4, ft3
                  srai         a0, a5, 11
                  fcvt.s.w     fs11, gp
                  fmul.s       fa2, fs7, ft7, rup
                  fsgnj.s      fs1, fs7, fa3
                  fdiv.s       ft1, ft6, ft10
                  div          ra, t1, s6
                  fsqrt.s      fa3, fa3
                  sltu         a5, t5, ra
                  remu         sp, t5, t2
                  srl          a2, s8, s8
                  xor          a3, zero, a4
                  fsgnjn.s     ft5, ft5, ft4
                  rem          s0, a1, s4
                  slti         a5, a5, -153
                  feq.s        a2, ft2, fs9
                  or           s6, a0, t4
                  srai         a3, a2, 25
                  mul          s9, t1, s3
                  fsqrt.s      fa7, ft10
                  xori         t6, a2, -811
                  feq.s        t3, ft1, fs4
                  xori         s1, s10, 896
                  or           s8, t0, a7
                  sltiu        t0, a6, -1036
                  divu         a1, a7, s5
                  slti         a4, s2, 1423
                  fcvt.wu.s    gp, fa7
                  fsqrt.s      fs9, ft10, rup
                  srai         s0, t5, 8
                  fclass.s     t3, ft3
                  fmv.w.x      fs3, t1
                  fsgnj.s      fs3, fa2, fs2
                  lui          a3, 31167
                  fsgnj.s      fa2, fa1, ft5
                  fsgnjn.s     fs5, ft1, ft7
                  fsqrt.s      ft2, fs11, rup
                  slti         a5, t0, -165
                  mulhu        s7, zero, s9
                  sltiu        s5, s4, 90
                  fmul.s       ft8, fs1, fs10
                  mulhu        a1, s3, a7
                  and          a7, s4, t1
                  div          s9, t6, a6
                  fsub.s       ft5, fa5, fa0, rdn
                  fadd.s       ft6, fs0, fs9
                  divu         s1, s11, s7
                  slti         s8, a2, -433
                  sltiu        t3, a0, -644
                  and          tp, t3, s8
                  fsgnjx.s     fs3, fs8, ft4
                  sltiu        t2, s5, -1687
                  sltiu        s0, t6, -1045
                  remu         a2, a0, a1
                  slti         s3, s1, 1023
                  sltiu        a5, zero, -1510
                  fmin.s       ft0, ft8, fa0
                  fsgnjn.s     ft1, fs0, ft0
                  auipc        a1, 899911
                  add          s1, s7, s2
                  andi         s8, s8, 400
                  fcvt.w.s     a3, ft3, rdn
                  sltiu        a7, s1, 1420
                  fdiv.s       fs5, fa4, fa2
                  mulhu        a6, t3, s5
                  mul          a5, s2, a4
                  mulhsu       gp, tp, a1
                  srli         ra, a3, 13
                  sltu         s7, s10, s0
                  fadd.s       fs11, fa3, fs0, rup
                  srai         a6, ra, 8
                  rem          gp, a4, zero
                  fadd.s       fa4, fs6, ft8, rmm
                  fcvt.wu.s    a5, ft0
                  sra          zero, s10, tp
                  sll          tp, t0, tp
                  sll          s4, s9, a0
                  and          a2, s5, s10
                  mulhu        t0, gp, s11
                  srl          s1, t1, ra
                  srai         ra, s1, 16
                  fcvt.s.wu    fa0, a2, rtz
                  fmin.s       fa7, fa5, ft8
                  fcvt.w.s     gp, fs0
                  fmul.s       ft3, fs7, ft9, rtz
                  sub          t4, s6, gp
                  xori         a5, t1, -530
                  sltu         t2, s10, t0
                  fsub.s       fs11, fs2, ft1, rdn
                  srai         ra, s6, 19
                  slt          s9, s11, s4
                  divu         s0, t0, s4
                  slt          t0, s0, t5
                  mulhsu       a4, s4, gp
                  mulh         t0, t4, t4
                  fsgnj.s      fa2, ft0, ft2
                  ori          s0, s6, -997
                  srli         a0, s5, 20
                  mul          a4, tp, s5
                  fcvt.s.w     fs6, a3
                  fmv.w.x      fa2, sp
                  fsgnj.s      fs11, fs4, fs1
                  div          t2, s1, t6
                  rem          s3, a1, sp
                  srai         s3, s4, 8
                  slt          t6, s0, zero
                  remu         a5, tp, a0
                  mul          t4, s2, t4
                  srli         s9, gp, 28
                  fadd.s       fa1, fa2, fa7, rdn
                  fcvt.w.s     s7, fa6, rne
                  xori         tp, s8, 1056
                  fsgnjx.s     ft0, fs11, fs10
                  fcvt.s.w     ft5, t1, rup
                  sra          a2, s0, a3
                  fcvt.s.w     fa4, s2, rup
                  fcvt.wu.s    a3, fa4, rtz
                  div          s3, tp, t4
                  fmv.w.x      fa3, a3
                  fdiv.s       fs10, fs5, fa7, rne
                  fsub.s       ft9, fs4, ft3, rmm
                  fcvt.w.s     gp, ft0, rup
                  fmin.s       ft3, ft5, fa0
                  auipc        s9, 59916
                  divu         s0, ra, t2
                  xor          t0, t3, a2
                  fcvt.wu.s    t0, ft7
                  fmin.s       fs10, fs7, fs10
                  addi         t4, s9, -1893
                  fmin.s       ft10, ft1, fs9
                  fmin.s       fa2, ft9, fs4
                  fdiv.s       fs5, ft0, ft6
                  fsqrt.s      ft0, fs5, rtz
                  fmv.x.w      s6, fs11
                  srai         s3, a7, 25
                  xor          s7, t2, s5
                  sltu         a0, a0, s10
                  mulh         s5, s11, s7
                  slli         a7, a3, 9
                  fcvt.s.w     fs4, a3, rne
                  slt          a3, s10, s4
                  and          s5, zero, s0
                  auipc        s9, 667611
                  fadd.s       ft11, ft5, ft11, rup
                  fsgnjn.s     ft10, fa6, fs5
                  fmv.w.x      fa6, gp
                  mul          t0, a0, s8
                  slli         a5, s6, 7
                  mulh         a4, a6, t4
                  mulhu        zero, a3, s1
                  feq.s        a2, fs10, fs3
                  fle.s        gp, fa1, fa6
                  slli         a1, t2, 11
                  ori          a2, s9, 350
                  lui          s5, 705326
                  srai         s4, t0, 17
                  nop
                  fsqrt.s      ft7, ft5, rtz
                  fle.s        s10, ft11, ft7
                  fmax.s       ft11, fa5, fa3
                  fclass.s     a4, fs10
                  srl          a3, s3, s9
                  fmv.w.x      fs0, t2
                  mulhu        tp, t0, a1
                  fsub.s       fa4, fa7, fa2, rdn
                  fle.s        s11, fs0, fa1
                  fmax.s       fa4, fs5, ft11
                  xor          s10, s5, t1
                  or           s7, t4, s1
                  fcvt.s.w     ft7, gp, rmm
                  or           s8, t3, s5
                  fsgnjx.s     fa6, ft3, fs8
                  fmv.w.x      ft9, a3
                  srl          sp, a4, a3
                  fsub.s       ft6, ft3, ft6
                  fcvt.w.s     a0, ft4
                  auipc        s6, 832812
                  slt          t6, s9, s3
                  div          s5, sp, s0
                  auipc        zero, 119487
                  or           t6, ra, t4
                  andi         a4, s6, 139
                  srli         s10, a2, 14
                  fsgnjn.s     fa0, ft11, fs7
                  lui          tp, 683568
                  fcvt.s.wu    ft4, s3, rne
                  fsgnjx.s     ft11, fa4, ft6
                  fmv.x.w      a6, fa2
                  fcvt.wu.s    a6, fs10
                  sltiu        t2, a2, 1072
                  fcvt.s.wu    ft8, s10, rne
                  fcvt.wu.s    t4, ft3
                  fmv.x.w      s5, fa5
                  addi         s11, s8, 1130
                  sub          a7, zero, a4
                  fsgnjn.s     ft6, ft10, ft1
                  fclass.s     s1, ft7
                  nop
                  fmv.x.w      t0, ft3
                  fcvt.s.w     fs5, t4
                  rem          a0, s10, t0
                  fmv.w.x      fs11, zero
                  srl          ra, t6, t2
                  xori         a2, ra, 317
                  feq.s        t4, fs10, fa7
                  fcvt.wu.s    s11, fs4, rmm
                  flt.s        t6, fs11, ft10
                  sra          s10, t6, a5
                  sub          a5, sp, t6
                  addi         t0, t6, 1831
                  fmv.w.x      fa1, s1
                  mulhsu       a7, a6, s3
                  fmv.x.w      s10, ft4
                  srli         t0, zero, 14
                  auipc        tp, 100925
                  fsgnjn.s     ft2, ft0, ft8
                  srli         ra, t4, 27
                  fsgnj.s      fs5, fa1, ft10
                  fsqrt.s      ft9, fs7, rdn
                  fcvt.wu.s    a2, ft6
                  sltu         a5, t5, a4
                  fmul.s       ft11, fa5, ft3, rdn
                  fsgnjx.s     ft8, ft11, fa2
                  div          a0, gp, s7
                  fcvt.s.w     fs4, a6, rne
                  fcvt.wu.s    t4, fs9
                  or           a2, t2, a7
                  sltu         zero, a4, a3
                  fmv.x.w      tp, ft2
                  sra          a2, t6, a7
                  mul          s3, s3, s11
                  srl          s1, t4, t5
                  divu         s1, s7, tp
                  slt          gp, s6, s4
                  slt          t3, ra, s6
                  mulhu        s8, s11, t2
                  mul          a7, s6, s10
                  fmv.w.x      fs5, s3
                  sll          a4, a4, s9
                  sub          tp, t4, t4
                  remu         t6, s2, s9
                  andi         s1, t5, 367
                  fsqrt.s      fs7, fa3
                  fadd.s       fa7, fa7, fs1, rtz
                  fcvt.s.wu    ft10, s11
                  xor          t6, s3, s3
                  fle.s        s1, fa3, ft1
                  mulhu        a1, s2, s9
                  sub          sp, a1, s1
                  div          a2, a0, a5
                  sra          s7, s10, s4
                  fsgnj.s      fa6, ft2, fs11
                  xori         s9, tp, -1398
                  add          s7, s0, s8
                  add          a3, sp, t2
                  fadd.s       ft11, ft11, fa1, rup
                  mul          sp, s0, ra
                  fmin.s       ft8, ft1, fs3
                  ori          a6, t2, 682
                  feq.s        s7, fa0, fs9
                  sltiu        a0, t2, -307
                  fsub.s       fa3, fs2, fs10, rdn
                  sltu         sp, a7, t2
                  fsgnj.s      fs2, fs0, ft1
                  sra          s3, a1, s7
                  divu         t0, s0, t2
                  xor          s5, a7, t0
                  ori          s6, ra, 285
                  flt.s        a2, fs4, ft10
                  fcvt.s.wu    fa3, ra
                  or           s9, gp, t0
                  sll          a2, a1, t5
                  fcvt.wu.s    a6, fs8
                  or           t6, t2, a2
                  mul          s9, t6, sp
                  mulhu        tp, a6, zero
                  mulh         a1, t5, a1
                  fsgnjx.s     fa2, ft5, ft10
                  sltu         a5, s9, a0
                  flt.s        s1, fs7, fa1
                  fcvt.w.s     a0, fs3, rup
                  fsub.s       fs7, fa6, fa6
                  and          a0, s9, a5
                  slti         s7, t6, 1689
                  fmv.x.w      a4, ft4
                  fsqrt.s      ft4, fs11
                  fsgnjn.s     ft10, fs6, ft1
                  fmin.s       fs1, fs6, fs0
                  srl          a1, a7, s9
                  div          s10, a7, s6
                  fcvt.w.s     s11, fa6
                  fle.s        t4, fa1, fs0
                  fdiv.s       ft5, fa5, ft4
                  fmax.s       fs6, fs0, fa6
                  fsqrt.s      fa5, ft4
                  lui          ra, 668456
                  fmv.w.x      fa0, s6
                  mul          s9, a6, s8
                  sltu         t6, s11, a1
                  or           ra, a2, s8
                  fdiv.s       ft9, fs7, ft4, rne
                  fle.s        s6, fs1, fa4
                  div          s1, s0, s8
                  mulhu        sp, s4, s5
                  fcvt.s.w     fa2, s8
                  srai         t3, gp, 30
                  slt          s4, a7, s5
                  xor          a2, t4, sp
                  addi         t6, a1, -475
                  slt          a2, s0, s1
                  rem          zero, a0, a0
                  slti         a6, t6, -1292
                  auipc        a3, 879163
                  sltu         s1, gp, a1
                  sra          ra, a7, t0
                  fcvt.wu.s    t4, ft3, rup
                  div          s0, s1, a0
                  or           a6, a7, sp
                  fsgnjn.s     fa1, fa5, fs10
                  srl          s9, t0, t1
                  divu         s6, s1, s8
                  slti         a5, a4, -1026
                  or           gp, s6, ra
                  auipc        s8, 418109
                  xor          s1, a4, gp
                  xori         a5, a7, 1234
                  mulhu        s1, a7, a3
                  xori         gp, tp, 1084
                  mulhu        s11, a3, s1
                  fsgnj.s      fa7, fa6, ft3
                  fsqrt.s      ft7, fa4
                  or           s0, s11, a4
                  fmin.s       fa5, fa1, fs7
                  auipc        t4, 246695
                  fcvt.wu.s    a1, ft0
                  fsub.s       ft0, ft7, fs8
                  fsgnjx.s     fa1, ft0, fa2
                  fadd.s       ft8, ft9, fs8, rtz
                  srli         s8, t6, 0
                  fdiv.s       ft5, fa4, fs3
                  fclass.s     a6, ft8
                  addi         gp, gp, 60
                  addi         a3, s9, -492
                  feq.s        a2, ft2, ft10
                  slt          a2, sp, a6
                  fdiv.s       ft6, fs3, ft4, rne
                  fmul.s       fs5, ft9, fa0, rne
                  fsgnjx.s     fs2, fs1, ft9
                  fsgnjn.s     ft9, fa4, ft3
                  fsub.s       fs11, fa0, fs7, rmm
                  xor          s8, a6, s9
                  mulhsu       t4, t1, t5
                  mulhu        a5, t0, a7
                  xori         tp, zero, 1834
                  andi         a7, t2, 1222
                  srai         sp, a3, 6
                  ori          s10, s7, 1899
                  srai         t3, s9, 8
                  sub          a4, s8, a7
                  slt          t3, s5, a5
                  nop
                  fmv.x.w      s4, ft9
                  mulhu        a0, t5, tp
                  div          ra, a1, gp
                  andi         t0, t5, -1689
                  fsgnj.s      fa2, fa3, ft8
                  fle.s        s6, ft4, fs8
                  addi         tp, tp, -1298
                  sll          t0, t0, t6
                  sltiu        a5, t1, 345
                  srai         s0, s10, 22
                  auipc        s7, 408221
                  fsgnjx.s     fa4, ft11, fs9
                  fle.s        s5, fs10, ft10
                  fmul.s       ft7, ft2, ft0, rtz
                  remu         t0, a7, a6
                  srli         t3, gp, 25
                  xori         a2, s11, -28
                  rem          t6, a4, t6
                  fcvt.s.wu    fs10, a4
                  fsqrt.s      ft3, ft0
                  sltu         ra, t1, s7
                  xor          tp, a4, s3
                  sra          a5, a5, a5
                  or           a5, s0, s9
                  or           s6, s8, t5
                  fsgnj.s      ft0, fa2, fa5
                  slli         s10, s4, 3
                  fmax.s       ft10, ft6, fs10
                  rem          a0, s7, ra
                  fmul.s       fa4, ft5, fa3
                  fsqrt.s      fa5, fs9, rup
                  rem          s0, s11, t1
                  slti         s11, t5, 1719
                  sltiu        s0, tp, 1956
                  srli         s10, s6, 4
                  srai         s3, a2, 2
                  divu         a5, s10, t2
                  sltiu        sp, a1, 1617
                  slt          a0, s11, sp
                  srai         sp, a1, 22
                  sub          sp, s0, a3
                  fmv.x.w      gp, fa1
                  xor          t3, s6, a3
                  or           t6, s6, tp
                  fsub.s       fs9, ft2, ft7
                  xor          a6, a6, t5
                  sll          s6, s3, a3
                  div          t2, a7, zero
                  fsgnjn.s     ft9, fs11, ft6
                  sub          a1, a1, s11
                  fclass.s     a0, fa1
                  fsgnj.s      fa2, fa2, fa2
                  addi         s6, t5, -506
                  xor          ra, s0, t1
                  fcvt.s.wu    fs4, a6, rdn
                  auipc        s4, 497959
                  fmv.x.w      sp, fs2
                  fcvt.s.wu    fs3, zero
                  slt          a2, s4, s2
                  mulhu        s10, t1, a2
                  and          gp, a2, t6
                  fmv.w.x      fs5, t0
                  xori         t6, t6, -1537
                  nop
                  fsgnjx.s     ft7, fa7, fs11
                  fle.s        s7, ft4, ft3
                  fsgnjx.s     ft4, fa3, ft0
                  mulh         sp, s0, gp
                  srl          zero, zero, s2
                  fsgnj.s      fs7, fa1, fs3
                  sltu         a3, a4, a7
                  xori         a3, s3, 459
                  xori         tp, a3, -1276
                  fmv.x.w      s8, fs1
                  sra          a2, t4, a2
                  fmv.w.x      ft0, a1
                  fclass.s     t4, fa1
                  sll          ra, a6, a3
                  fmul.s       fa2, fa2, ft4, rup
                  sltiu        t4, s11, -70
                  divu         a3, t3, s10
                  srai         t3, s9, 24
                  remu         a5, t2, ra
                  remu         s3, t5, t3
                  mulhu        t4, a6, s1
                  addi         s1, a1, -1670
                  fsgnjx.s     ft5, fs2, ft3
                  div          s10, tp, s9
                  feq.s        t2, fa5, fs4
                  rem          s0, s8, s4
                  lui          a3, 514215
                  fcvt.w.s     s0, fs8
                  fcvt.s.wu    fa7, s4, rmm
                  fcvt.s.wu    fa1, a1
                  fcvt.wu.s    a7, fa6
                  slti         a1, t3, 1354
                  xori         a0, t2, 595
                  sll          s9, s0, gp
                  div          s6, t2, t3
                  ori          ra, s5, -1941
                  divu         t3, zero, s5
                  fsgnjx.s     ft5, fs9, fa1
                  sra          gp, gp, s0
                  mulh         s10, a3, t5
                  fsgnjx.s     fs3, fs6, fa1
                  sltu         t0, s7, t3
                  fsub.s       fa1, fs7, fs0
                  addi         a3, sp, 855
                  sra          zero, a7, a1
                  fmv.w.x      ft8, t3
                  xori         s3, t1, -478
                  xori         s3, t3, -81
                  andi         t0, sp, 1029
                  fmax.s       ft9, fs6, fa4
                  srl          ra, t0, gp
                  fsqrt.s      ft11, fs6, rdn
                  xor          t4, sp, s6
                  rem          s5, gp, t2
                  add          s1, t2, s6
                  slti         a7, t5, 746
                  fclass.s     a7, fa1
                  feq.s        s0, fs8, fs5
                  flt.s        sp, fs0, fa3
                  fsgnj.s      fa2, ft6, fs3
                  srli         s9, s11, 27
                  auipc        s4, 692853
                  mul          s1, zero, t0
                  rem          s11, ra, a4
                  fcvt.s.w     fa0, zero
                  fcvt.wu.s    tp, ft9
                  srli         a1, t5, 4
                  srl          s3, a4, ra
                  fdiv.s       ft9, ft3, fs11, rtz
                  sll          ra, a6, a5
                  sll          a4, tp, t6
                  mulh         a4, a5, gp
                  fsgnjn.s     ft2, ft9, fs0
                  lui          s8, 696669
                  div          a1, s3, zero
                  fmv.x.w      s6, fa5
                  fcvt.s.w     fs1, t5, rtz
                  fsgnj.s      ft10, ft10, ft1
                  div          t6, t3, s11
                  fle.s        s3, ft4, ft4
                  fmv.w.x      fa5, s5
                  fsub.s       ft2, ft11, fs4, rtz
                  xor          s8, ra, t0
                  fdiv.s       fa5, fs7, fs11, rtz
                  sra          s1, t0, ra
                  mulh         s9, s2, sp
                  fmin.s       ft2, ft11, fa7
                  fsub.s       ft5, fa6, fa6
                  xor          a1, a4, s11
                  or           s10, t5, s5
                  div          s7, a2, sp
                  mulhu        ra, s4, s10
                  fcvt.s.wu    ft4, a7
                  fsgnjx.s     ft3, ft8, ft1
                  sltiu        a2, s0, 426
                  fle.s        s1, fs11, fs10
                  add          t3, a0, zero
                  fmv.w.x      ft8, zero
                  feq.s        s7, ft8, fs7
                  feq.s        s7, fs9, ft2
                  sltu         s7, a0, t0
                  remu         s0, a4, s3
                  lui          s3, 869034
                  and          s1, tp, t2
                  rem          s6, t5, s8
                  fsqrt.s      fs11, ft5, rmm
                  fsgnjx.s     ft4, fs11, fa2
                  fcvt.s.w     fs2, s2
                  fle.s        a5, fs7, ft1
                  mul          sp, s8, a7
                  fdiv.s       ft7, ft1, ft11, rmm
                  fcvt.s.w     ft0, a0
                  mulhu        t3, s1, t1
                  fle.s        a7, fa4, fs1
                  slti         a0, s11, 1238
                  sltiu        zero, s6, 1235
                  sll          s7, s4, a0
                  fclass.s     s3, ft4
                  sltiu        t6, a3, 146
                  andi         t6, ra, -859
                  fmv.w.x      fs8, a6
                  auipc        tp, 519668
                  srai         s8, a2, 24
                  and          s4, t5, s2
                  fclass.s     a0, fs0
                  mul          s7, s5, s8
                  mulhu        s11, ra, t0
                  sra          a4, a1, t1
                  nop
                  sra          sp, zero, a0
                  fmul.s       fa1, fs8, fa1
                  fadd.s       fs5, fa1, ft11
                  or           s7, s1, s8
                  fmv.w.x      fs5, s4
                  ori          a7, a6, -1260
                  div          ra, s1, t0
                  flt.s        a1, fa2, fs7
                  sltiu        s6, a7, 555
                  srai         s6, gp, 11
                  sub          t0, a1, t6
                  feq.s        s10, ft0, fs9
                  remu         s3, s9, a1
                  slti         tp, s2, 1501
                  fsqrt.s      ft7, fs7
                  fle.s        s7, ft3, fs6
                  fdiv.s       fs3, fa0, fs2, rtz
                  mul          s6, a7, a2
                  add          a1, a3, a3
                  fcvt.s.wu    fs11, zero
                  fmv.x.w      s10, ft9
                  rem          s9, a3, s7
                  fcvt.s.wu    fs3, t2, rmm
                  slli         t2, s5, 6
                  sll          a2, t6, gp
                  fsgnjx.s     fs4, fa1, fa4
                  xori         a2, sp, -1363
                  remu         s9, s0, t5
                  fcvt.s.wu    ft11, t1, rup
                  divu         s5, t5, s1
                  rem          s9, t3, s3
                  sra          a5, a5, s5
                  auipc        t3, 486397
                  fmul.s       ft6, fa4, fs4, rtz
                  fclass.s     tp, ft4
                  add          s9, t2, a0
                  srai         a7, s7, 7
                  sub          s11, t3, s5
                  addi         a0, a7, -1935
                  ori          s10, t5, -1303
                  fcvt.s.wu    ft0, ra
                  nop
                  div          a3, t6, s7
                  fmv.w.x      fa6, s1
                  fdiv.s       fa6, ft11, ft3
                  slt          a4, s5, s6
                  fmul.s       fs6, fa0, fa7
                  fsgnj.s      ft3, ft2, fs7
                  fcvt.w.s     s11, ft11
                  fdiv.s       fs0, ft4, ft7, rup
                  slli         a6, s7, 28
                  sra          t4, a5, s2
                  nop
                  fsgnjn.s     fs1, fa2, fa4
                  lui          a1, 2119
                  srl          a4, s5, tp
                  fsqrt.s      ft4, fs3
                  ori          a1, s8, 742
                  fmin.s       fa2, ft5, fa3
                  fmv.w.x      ft6, t0
                  xori         a6, zero, 275
                  fsgnjx.s     fs3, fa3, fa7
                  mulhsu       sp, t0, s1
                  remu         s0, a7, s10
                  divu         s4, t6, a1
                  feq.s        a2, fa7, fs2
                  slti         t3, a3, 231
                  fdiv.s       ft2, ft0, fa1, rup
                  fsqrt.s      fs1, fs1, rdn
                  fsub.s       fs5, fa6, ft6, rne
                  lui          gp, 871578
                  fmax.s       ft9, fs3, fa6
                  and          s8, ra, t4
                  or           s5, a4, tp
                  fcvt.wu.s    sp, ft4
                  mulh         s5, gp, s0
                  srl          s3, s11, t4
                  fmv.w.x      fa6, tp
                  addi         s9, s0, 1796
                  sll          s7, a1, a1
                  andi         s0, s10, -1333
                  and          s4, a4, s6
                  fmv.x.w      a1, fs6
                  slti         t4, s2, -1172
                  div          s7, s9, s5
                  sra          tp, t5, t6
                  fmv.w.x      fs1, sp
                  mulh         a1, sp, gp
                  fcvt.s.wu    ft11, s5, rtz
                  mul          s9, s5, t2
                  fclass.s     zero, fa2
                  sltiu        a6, t4, -329
                  add          s9, gp, t5
                  fdiv.s       ft6, fs1, ft2
                  slti         a2, t0, 464
                  fmax.s       fs1, ft10, ft7
                  fmv.x.w      s0, ft10
                  auipc        a7, 430963
                  srl          a5, t1, s4
                  sll          a0, a0, a3
                  fsub.s       fs2, ft7, fa3, rtz
                  andi         a2, tp, -979
                  xori         s8, s0, 1078
                  srai         ra, t1, 21
                  mul          a0, gp, s4
                  slti         gp, a7, 445
                  mulhu        t3, s10, t4
                  fdiv.s       ft2, ft5, fs7, rtz
                  fdiv.s       ft9, ft3, fs3, rmm
                  add          sp, s3, t3
                  and          s11, a7, a0
                  fsub.s       fs6, ft11, ft7
                  mulh         a0, a5, s5
                  sra          t6, tp, a1
                  fclass.s     s6, fa2
                  fsub.s       ft5, fs3, ft8, rdn
                  srli         t4, a1, 19
                  remu         a1, s0, t1
                  lui          s9, 1001944
                  auipc        a5, 300990
                  fmax.s       fs11, ft0, ft1
                  rem          a0, s11, s0
                  slli         s11, a1, 10
                  or           a7, s5, a6
                  remu         ra, tp, s6
                  fclass.s     a6, ft10
                  srl          t4, s1, s6
                  sra          s9, a2, s9
                  sll          a4, a0, s2
                  mulhu        s9, t6, zero
                  fadd.s       fs0, fa6, fs7, rdn
                  mulh         s10, t5, ra
                  ori          a3, s8, -1217
                  sltiu        t3, t2, -344
                  or           s5, t1, a5
                  fsgnjn.s     fs8, ft7, fs6
                  fcvt.wu.s    a5, fs4, rne
                  fle.s        zero, fa6, fs1
                  and          sp, a3, s8
                  flt.s        t6, fa2, ft3
                  fclass.s     a6, fs2
                  feq.s        gp, fa3, ft3
                  sra          a6, t5, a1
                  fcvt.s.wu    ft8, a0
                  fmin.s       ft9, fa2, ft5
                  fmv.w.x      ft9, s9
                  nop
                  fle.s        s3, ft6, fs7
                  andi         s3, t3, -1373
                  slti         a3, sp, -317
                  remu         s9, s7, s4
                  mulh         tp, tp, t4
                  flt.s        a7, fs10, fs8
                  sub          s1, s0, s2
                  fmax.s       ft9, ft6, fs2
                  sll          ra, a0, t5
                  sra          s5, s10, ra
                  sra          s9, a3, a1
                  slli         a4, t3, 19
                  slti         s1, s5, -1961
                  ori          a0, s7, -1096
                  srl          s11, s0, ra
                  fclass.s     s10, fa0
                  srli         t2, a4, 16
                  slli         a6, s0, 17
                  slli         a6, s10, 4
                  fsgnjn.s     fs4, fs9, ft8
                  slti         t3, t5, -1512
                  addi         a3, gp, 1486
                  rem          a5, s0, s2
                  divu         s10, a2, s11
                  slti         s3, a6, -1307
                  sltu         a5, tp, t0
                  fclass.s     s4, fs2
                  fle.s        s11, fs7, ft4
                  sltu         tp, a7, s8
                  srai         s11, s0, 12
                  andi         a5, a0, -1573
                  fclass.s     t4, ft10
                  fcvt.s.w     ft11, tp, rup
                  mul          gp, a6, s3
                  fadd.s       fs11, fs10, fa6
                  fmv.w.x      fs11, a3
                  fsgnj.s      ft9, fs7, fa1
                  mulhsu       s9, t6, a3
                  srl          s0, a4, a4
                  and          a3, a5, ra
                  auipc        t2, 197670
                  srli         ra, s9, 29
                  fcvt.s.w     fs5, t4
                  sll          a7, a7, a4
                  sll          s6, s9, t1
                  fcvt.wu.s    t3, ft1
                  nop
                  fadd.s       fs5, fs5, fs1, rne
                  add          sp, t0, t0
                  addi         s11, t4, -551
                  remu         s3, s6, t4
                  sra          s4, s4, t2
                  div          t6, zero, a5
                  fsqrt.s      fa4, fa0
                  slt          t0, t2, s10
                  fmv.x.w      a6, fa2
                  or           s9, tp, tp
                  srli         tp, t2, 6
                  feq.s        a0, fa5, ft0
                  sll          s8, s5, s10
                  nop
                  mulhsu       t0, s8, a7
                  sub          ra, ra, s7
                  srai         a6, s3, 14
                  nop
                  srli         s9, a7, 9
                  div          t4, a0, a3
                  andi         a1, zero, 1024
                  fcvt.w.s     s1, fs5, rup
                  ori          a5, s6, 606
                  and          zero, s7, a0
                  fmv.x.w      s4, ft0
                  slti         s4, sp, -131
                  flt.s        a0, fs1, fs9
                  fmv.w.x      fa6, s11
                  mul          a3, s5, a0
                  fmv.w.x      ft6, s6
                  add          a3, a0, a0
                  fmax.s       fa7, ft6, fs6
                  fclass.s     zero, fa4
                  mulhu        s3, s11, ra
                  mul          gp, a2, t6
                  fmv.w.x      ft0, s1
                  fmul.s       fa3, fa7, ft4, rdn
                  fcvt.s.wu    ft11, s0, rmm
                  fmv.w.x      fs6, t2
                  remu         s10, a5, s8
                  slti         s6, s10, 1521
                  slli         t6, tp, 23
                  sll          s0, s7, a1
                  fsub.s       ft9, fa5, fs11
                  sltiu        s9, sp, 31
                  fcvt.wu.s    a5, fs11, rdn
                  sltu         s1, s11, t2
                  div          ra, sp, zero
                  nop
                  remu         zero, t5, t4
                  sub          a2, s5, s4
                  mulhu        s5, s1, t1
                  mul          s0, a3, s7
                  fmv.x.w      s9, fs2
                  mul          sp, gp, a3
                  and          a2, s10, s2
                  fcvt.w.s     t0, ft11, rtz
                  fle.s        s7, ft3, ft6
                  or           a4, s9, a0
                  mulhsu       tp, t5, s11
                  fsqrt.s      fs10, fs4
                  auipc        s3, 706104
                  fadd.s       ft6, fa4, fs0, rdn
                  xor          zero, zero, t5
                  mulhu        a3, s11, t2
                  fmul.s       fs9, fs3, fa2
                  fmin.s       fs10, fs10, ft0
                  slti         s5, t6, -73
                  slli         s1, zero, 5
                  fdiv.s       ft0, fs8, fs5
                  fcvt.s.wu    fs1, a3
                  ori          a0, tp, 218
                  add          a3, a0, s3
                  srli         s10, s2, 27
                  mul          a6, s4, sp
                  andi         a0, s2, 6
                  fmax.s       ft2, ft2, fs10
                  lui          s1, 260184
                  srl          t4, gp, a2
                  fmin.s       ft2, ft11, ft3
                  mulhu        tp, s5, s4
                  xor          s9, s4, s7
                  fcvt.w.s     a4, fs10
                  fsgnj.s      fa0, ft3, fs0
                  fmul.s       fa7, ft11, ft3, rmm
                  fsgnjn.s     ft8, fs6, ft0
                  auipc        t4, 323145
                  slti         ra, s9, 899
                  slt          t6, s6, s9
                  sltiu        a5, a4, -945
                  xori         gp, s7, 1834
                  feq.s        zero, fs1, fs4
                  xor          a7, ra, t0
                  feq.s        tp, fs6, fs5
                  ori          s6, s1, 1845
                  mulh         a0, t5, t4
                  sltiu        a4, t2, 1489
                  fle.s        a5, fs8, ft0
                  nop
                  fadd.s       fs2, fs8, fs4
                  fsqrt.s      ft10, ft11, rdn
                  fcvt.wu.s    a5, fa0, rtz
                  flt.s        s3, fs1, fs7
                  add          t2, ra, tp
                  sltu         a5, tp, a1
                  addi         s1, a3, -511
                  and          s1, s6, a6
                  fmul.s       fs1, fa1, ft1, rdn
                  xor          t6, a1, sp
                  fdiv.s       fs10, ft10, ft1
                  andi         t0, s4, 893
                  xori         s9, s5, 1564
                  xor          a4, t2, t0
                  fclass.s     s8, fs2
                  slt          ra, s3, s11
                  fsub.s       ft3, fs11, fs5, rup
                  fadd.s       fa4, fa4, fs5
                  fdiv.s       ft6, ft5, ft7
                  auipc        ra, 1001188
                  nop
                  slti         s1, t4, 920
                  fmv.x.w      a3, ft9
                  fadd.s       fa6, ft7, ft6
                  slli         zero, t1, 29
                  slti         s0, a6, 1981
                  mulh         s8, zero, ra
                  fmin.s       ft1, fa4, fa3
                  add          s8, s5, a6
                  fmin.s       ft1, fa2, ft9
                  fsqrt.s      ft3, ft10, rup
                  add          s7, s0, tp
                  div          a1, t0, s5
                  sub          a1, s3, s11
                  add          gp, s5, t4
                  slti         s6, a4, 915
                  mulhu        a7, zero, a1
                  mulhu        ra, t4, s7
                  slli         a5, a4, 7
                  fcvt.s.wu    ft9, gp
                  or           gp, s10, s4
                  fsqrt.s      ft7, fs0
                  feq.s        a0, fs3, fa2
                  srai         s7, s6, 13
                  slli         a6, zero, 2
                  fcvt.w.s     s4, fs8
                  fmv.x.w      s10, ft3
                  add          a3, s7, s10
                  feq.s        t2, fs0, fa5
                  ori          zero, t1, 780
                  slti         s0, a5, 757
                  mul          a1, s8, t1
                  xor          sp, a6, a1
                  fcvt.s.w     ft8, sp
                  srl          s11, s7, sp
                  ori          s3, a6, -1898
                  sltu         s9, sp, a4
                  rem          tp, t4, a5
                  sub          s9, tp, ra
                  flt.s        a3, ft6, ft3
                  srli         tp, s8, 11
                  srai         t3, zero, 11
                  fsgnj.s      fa4, ft10, ft7
                  xor          sp, gp, s1
                  fmul.s       ft2, fs10, ft10
                  fcvt.w.s     a5, ft10
                  remu         t2, tp, s8
                  and          a4, a0, t0
                  fclass.s     t4, ft9
                  lui          a3, 758400
                  auipc        a5, 544833
                  fmv.x.w      t3, fs2
                  nop
                  ori          s8, a7, -1905
                  add          a4, s3, s4
                  feq.s        t4, ft8, fs4
                  sltiu        s9, a3, -1576
                  andi         ra, t1, 1972
                  sltu         a5, t5, t0
                  sltu         s5, tp, s2
                  mul          ra, sp, s0
                  fcvt.s.wu    fs2, s9
                  addi         s3, s11, -2018
                  flt.s        s10, ft5, ft3
                  fsub.s       fs5, fs1, ft10, rne
                  fdiv.s       fs1, fs8, fa1, rne
                  fsgnjx.s     fs2, fs6, fs8
                  mul          a7, s3, ra
                  xori         a4, s1, 1123
                  sub          s8, t0, a4
                  fmv.x.w      s6, fa3
                  addi         t2, s4, -1809
                  slt          t2, t5, s3
                  nop
                  andi         s7, zero, -1300
                  fmv.x.w      a5, fa2
                  mul          ra, s3, t5
                  remu         s0, t5, s5
                  add          a6, t6, a2
                  sra          sp, zero, t2
                  mul          t3, tp, s9
                  feq.s        s1, fs11, fa3
                  nop
                  mulh         t4, t2, s2
                  div          a5, a4, s5
                  sra          a3, t0, a7
                  fmv.x.w      a1, fs7
                  andi         t3, a5, -889
                  xori         s3, s1, -466
                  mul          a0, a0, s7
                  fle.s        s6, ft6, fa2
                  mulh         s4, s10, s1
                  remu         s9, s9, a0
                  sll          s8, a0, a3
                  fle.s        zero, fs9, ft5
                  fsqrt.s      fs3, fs11
                  ori          s11, tp, -984
                  rem          s1, a1, s6
                  divu         t4, s0, gp
                  divu         s8, s9, s4
                  slt          s11, s7, a3
                  slt          t3, s6, a4
                  fcvt.w.s     t4, fa7
                  mulhu        s3, tp, t4
                  fmv.w.x      fa7, s7
                  addi         t4, t4, 1022
                  sll          gp, t5, t5
                  mulhu        t2, a3, s3
                  ori          t0, s7, 910
                  fmv.x.w      s4, fs6
                  rem          t2, tp, t3
                  fmax.s       fs5, ft4, fs11
                  srai         a3, s9, 31
                  fclass.s     s6, fa0
                  srl          s1, gp, ra
                  fadd.s       ft4, fs1, fa5
                  fmax.s       fa6, fs5, fa0
                  feq.s        zero, fs3, fs5
                  mulhsu       s7, t4, a3
                  fcvt.s.w     ft0, t1
                  divu         ra, s2, s11
                  fcvt.wu.s    s1, ft9, rdn
                  sub          s11, s4, t6
                  feq.s        a4, fs11, fa3
                  rem          gp, a3, t2
                  fmv.x.w      t2, fa6
                  fsub.s       ft0, fs2, fs0, rmm
                  fmv.x.w      ra, ft6
                  slti         a2, s8, 992
                  divu         t2, a4, s10
                  sub          t6, t3, ra
                  flt.s        t4, fa2, fs3
                  fmax.s       ft4, fs7, fa6
                  srli         a6, s2, 17
                  add          t6, t2, a2
                  fcvt.s.wu    fs1, a7, rup
                  slt          a0, s6, s9
                  feq.s        s9, ft3, fs4
                  fcvt.wu.s    s10, fa2
                  fle.s        a7, ft8, fa6
                  fmax.s       fs1, ft3, ft7
                  fmin.s       ft11, fa4, fs11
                  fsqrt.s      ft2, ft2, rne
                  fmin.s       fs4, ft11, ft6
                  xor          s8, t3, a0
                  rem          tp, zero, t2
                  fmul.s       fs1, fs4, fs7, rmm
                  xori         s4, s9, 675
                  slli         s1, s0, 8
                  mul          s6, s8, s4
                  srai         t4, a5, 21
                  feq.s        s4, fs2, ft9
                  fle.s        s1, ft11, fs2
                  nop
                  xori         sp, t2, -2001
                  fsgnjn.s     fa4, fs0, ft7
                  sra          s11, a6, s0
                  add          s3, a7, s11
                  slti         s0, s3, -901
                  sub          s0, t3, a1
                  fsgnjn.s     ft11, ft6, ft6
                  fcvt.wu.s    s4, ft1
                  fsub.s       fs9, ft5, fa5
                  sll          s10, a6, sp
                  fsub.s       fs3, fa3, fa3
                  fsgnjx.s     fs5, fs5, fa7
                  and          s0, tp, t2
                  mulhsu       a6, a4, a2
                  fmul.s       ft11, ft7, ft1
                  fmul.s       fa0, fs8, ft7, rdn
                  fcvt.s.wu    fs11, s0
                  fmax.s       fs0, ft4, ft0
                  fcvt.s.w     ft4, a5
                  lui          a4, 754487
                  sltu         s5, t5, a4
                  sll          a0, a1, s2
                  and          a1, zero, t2
                  and          a3, a4, a5
                  sub          s9, s2, s5
                  lui          a3, 903569
                  slli         s7, s10, 15
                  flt.s        ra, fa5, fs11
                  fcvt.s.w     fa1, ra
                  mul          a6, a6, a7
                  sra          a6, t2, t6
                  srai         a1, s11, 4
                  divu         tp, a6, a7
                  nop
                  fsgnjn.s     fa2, ft0, ft6
                  fmv.x.w      ra, fs9
                  mulhu        a7, ra, s9
                  fmul.s       fs5, fa2, fs9, rup
                  ori          zero, t6, -248
                  ori          t2, zero, -74
                  fsub.s       ft6, fa3, fa4, rup
                  rem          a1, t4, t6
                  nop
                  fsub.s       fs6, ft6, fa7
                  srl          a7, s11, s3
                  fmax.s       fs4, fa3, ft4
                  fsgnj.s      fs5, fa0, fa3
                  slli         a4, a3, 22
                  flt.s        a4, fs6, fa5
                  sltu         a2, t3, s10
                  remu         s6, a2, t2
                  remu         sp, t2, t6
                  fmv.x.w      s8, fs3
                  srl          s11, t0, s8
                  fsgnjn.s     ft4, fa7, fa0
                  andi         a1, a3, -223
                  fcvt.wu.s    s8, fa2
                  fcvt.s.w     fs8, s4, rmm
                  fmul.s       fs6, ft0, fs9
                  auipc        s7, 619009
                  xor          s8, a3, a7
                  fadd.s       ft10, ft5, fs5
                  fmv.w.x      ft11, zero
                  mulh         tp, s11, t5
                  sltu         a4, t3, s7
                  fdiv.s       fs4, ft1, ft8, rtz
                  fmax.s       fa6, ft3, fs1
                  divu         a0, s6, sp
                  fsqrt.s      fs5, ft0, rdn
                  fle.s        a0, fs1, ft2
                  and          a0, a3, a1
                  flt.s        t6, fa7, fa3
                  mulhsu       s6, s8, t4
                  remu         a1, a6, a6
                  fdiv.s       fa6, fa7, fa0, rtz
                  divu         s7, s10, s5
                  fmax.s       fs2, fs7, ft3
                  fmin.s       ft8, fs8, ft3
                  ori          s11, a0, 1614
                  mulhsu       t0, t4, s2
                  sub          a5, s2, a3
                  fcvt.s.w     ft6, ra, rmm
                  fmul.s       fa0, fa4, ft11
                  mulhsu       s10, t5, t5
                  srli         t0, t4, 2
                  mulhu        s11, t2, s8
                  mulhu        s4, s10, s9
                  feq.s        t3, fa7, ft3
                  sltu         s8, s11, sp
                  sra          t0, s0, t5
                  fsgnjx.s     fa1, fa4, fs11
                  fle.s        s1, fs11, fa7
                  div          s6, s3, a4
                  xori         a6, t5, -1669
                  srli         s7, zero, 17
                  addi         a3, t4, -1833
                  feq.s        s11, fa4, fs4
                  srli         a4, a3, 26
                  andi         a1, ra, 1049
                  mulh         s1, s8, a4
                  andi         tp, gp, -85
                  addi         sp, s6, 1523
                  flt.s        t2, ft4, fs11
                  or           tp, t4, gp
                  addi         s10, s1, -1978
                  fcvt.s.wu    fa7, a7
                  nop
                  fmv.w.x      fs0, t3
                  feq.s        s8, ft11, fa2
                  andi         t0, t5, -247
                  fsgnjx.s     fs2, fs10, fa3
                  mulhsu       t6, s0, s6
                  srai         s11, a0, 2
                  div          s11, ra, a5
                  sltiu        a2, gp, 1653
                  fsgnjx.s     fa1, ft1, ft0
                  sltiu        gp, a0, 1297
                  mulhu        a5, t5, a7
                  slli         a6, a2, 23
                  fadd.s       ft1, fa3, ft6
                  srli         t2, s2, 19
                  xori         a2, ra, -1417
                  srai         t2, a1, 24
                  sltu         t4, s5, sp
                  xor          s10, a1, t5
                  sll          a3, s4, s9
                  fcvt.s.wu    fa3, t2, rtz
                  srl          t4, t2, s2
                  fcvt.wu.s    a4, fs2
                  ori          t6, a6, 1390
                  fmin.s       ft6, fa1, ft2
                  srl          s1, gp, a7
                  nop
                  fmul.s       fa3, ft6, ft6
                  fsub.s       fs1, fs5, ft3, rdn
                  fcvt.s.w     ft8, t4, rup
                  fsgnjn.s     fa6, fs7, fa0
                  srl          s7, t6, s3
                  xori         t4, s2, 1166
                  nop
                  addi         s5, t3, 656
                  fmax.s       fa1, ft4, fs5
                  feq.s        t4, ft8, ft2
                  fcvt.s.wu    fs3, ra
                  feq.s        ra, ft0, fa2
                  nop
                  andi         s7, s3, -674
                  slti         t0, a3, -1726
                  mulhsu       gp, zero, t6
                  addi         t2, s8, -1193
                  add          t3, a6, tp
                  fclass.s     s0, fa5
                  addi         a1, s1, 777
                  rem          s10, s0, ra
                  srli         t0, a4, 16
                  fcvt.w.s     t4, ft10
                  fsgnj.s      fa0, fs11, fa4
                  slli         a0, a4, 14
                  nop
                  fadd.s       fa5, fa2, ft10, rne
                  fclass.s     t3, fs10
                  sra          zero, t0, zero
                  fmul.s       ft10, fa3, fs6
                  srai         a6, s7, 12
                  fcvt.s.wu    ft5, s3
                  fcvt.s.wu    fs11, s4
                  fdiv.s       fa1, ft6, ft5, rdn
                  div          s3, a7, s7
                  andi         t4, s3, -1504
                  feq.s        s8, ft1, ft1
                  feq.s        ra, fs6, ft1
                  mulhu        s1, s9, a2
                  and          a5, s1, s10
                  mulhu        t2, a5, t3
                  fsub.s       fs7, ft3, fa3
                  fadd.s       fa5, ft6, ft11, rmm
                  mul          s9, a0, s10
                  and          t2, t5, s0
                  fcvt.w.s     t6, fs7, rmm
                  fsgnjn.s     fa7, fa2, fa4
                  sub          sp, s9, s11
                  srl          s4, a6, s0
                  fclass.s     ra, fa1
                  mulhsu       s7, s9, s4
                  and          a4, s9, s6
                  sll          a5, a0, a3
                  srl          a0, s9, s9
                  and          gp, s6, a0
                  fmax.s       fs3, fs7, fa2
                  feq.s        a5, fa5, ft10
                  srai         t0, a2, 21
                  remu         s10, s7, s9
                  sll          s9, s2, t2
                  fmul.s       fs8, fs1, fa0, rne
                  fmv.x.w      a3, fs3
                  mulhu        a6, s3, t0
                  srl          a7, ra, a4
                  ori          t2, t2, 1949
                  rem          s4, s2, t3
                  remu         s0, s3, s9
                  nop
                  srli         s1, ra, 29
                  fmax.s       fs3, ft0, fa0
                  fcvt.w.s     s7, fs4, rdn
                  lui          t4, 488036
                  fcvt.s.wu    fs6, s7
                  sra          s10, a1, t2
                  fmax.s       fs5, ft10, fs1
                  srai         s10, s11, 30
                  flt.s        s8, ft3, fs8
                  mulh         s6, a6, t6
                  fmul.s       ft3, fs6, fs1
                  fsgnjn.s     fs5, ft0, ft9
                  fmin.s       fs0, fa2, fs8
                  addi         s0, s2, 1427
                  fmv.x.w      s5, fs8
                  mulhu        t0, s4, s7
                  xor          gp, t1, a7
                  fsgnjx.s     ft10, fs0, ft4
                  fclass.s     s8, ft10
                  srai         a3, a7, 21
                  slti         s4, t5, -436
                  rem          a0, ra, sp
                  xori         a2, s4, 1912
                  remu         a3, tp, s3
                  mulh         t3, a7, s0
                  fsqrt.s      fs5, fs7
                  fmul.s       fs9, fs7, ft2, rne
                  fsgnjx.s     ft4, fa7, ft0
                  fcvt.w.s     a3, ft4, rmm
                  sra          a0, s7, zero
                  srli         a1, a6, 20
                  add          a0, s9, s10
                  fmul.s       ft5, ft9, fa7, rup
                  fclass.s     t0, fs6
                  fcvt.s.w     ft9, a2
                  srl          s10, t3, s11
                  fsqrt.s      fs3, fs5
                  andi         s7, s4, -2046
                  fdiv.s       ft11, fs8, ft2
                  fsgnj.s      ft8, fs9, fs8
                  fmv.x.w      sp, fa7
                  srl          t0, gp, s8
                  div          a0, t2, s10
                  mulhu        a6, ra, a3
                  mulh         t4, s5, a6
                  flt.s        s3, fs6, fs0
                  fmv.w.x      fs0, a1
                  sltu         a4, s0, a2
                  fcvt.s.w     fa1, t0
                  sub          t2, s2, s11
                  fadd.s       fa3, fs7, fs3, rup
                  mulhu        a2, s3, t6
                  srli         a7, s1, 31
                  sub          s0, s3, s10
                  addi         s5, s1, 450
                  sltu         s9, s5, s2
                  rem          s4, a6, a2
                  fmv.x.w      t3, fa7
                  sltu         t0, t1, tp
                  andi         t0, gp, -1955
                  add          s9, a7, s8
                  fdiv.s       ft1, ft8, fa5, rtz
                  fcvt.s.wu    ft1, t6, rne
                  fadd.s       fs6, fa7, fa6, rup
                  feq.s        s5, ft4, ft4
                  fcvt.wu.s    s7, ft7
                  sltu         a2, t6, ra
                  mulhu        s1, t4, s7
                  mul          t3, a2, a7
                  andi         s8, t3, 1460
                  mulhu        s11, s0, s3
                  fcvt.s.w     ft0, a6, rmm
                  auipc        s1, 766806
                  add          s1, a1, a6
                  feq.s        s9, ft6, fa1
                  fmin.s       fs6, fa2, ft8
                  sll          s7, t2, s10
                  fclass.s     s10, ft3
                  andi         s9, t3, 206
                  srai         s7, a7, 30
                  slti         t0, a4, 1449
                  fcvt.wu.s    s1, ft1
                  fsgnjx.s     ft8, fa0, ft0
                  fsqrt.s      fs9, ft10
                  slti         a2, a0, -574
                  mulhsu       s8, s9, t4
                  or           s4, zero, s0
                  sub          gp, s11, a3
                  fmul.s       fa0, fa5, fs1, rtz
                  remu         tp, gp, s1
                  mulhsu       sp, t3, s2
                  srai         s9, a4, 28
                  lui          zero, 230252
                  slt          s0, sp, tp
                  remu         gp, t3, s6
                  ori          s1, a5, -1186
                  div          gp, s11, t0
                  fdiv.s       fs8, fa2, ft0
                  rem          ra, s3, t6
                  fcvt.wu.s    a0, fs10, rup
                  fsub.s       fa1, ft3, fs9
                  rem          a2, t6, a4
                  flt.s        t3, ft9, fa5
                  fcvt.s.wu    fs0, a2, rup
                  addi         a2, t6, -1463
                  lui          t3, 377472
                  fmv.w.x      ft10, s6
                  fsgnjx.s     ft1, ft0, ft2
                  fsub.s       fa0, fa7, fa4
                  mulhsu       t3, a1, gp
                  sra          a0, t1, a7
                  sltiu        a2, s5, 1460
                  slli         gp, s6, 22
                  feq.s        t4, fs7, fa7
                  fcvt.wu.s    a2, ft4, rup
                  srli         ra, t5, 7
                  rem          t6, a4, s10
                  fmul.s       ft7, fa0, fa1, rdn
                  fcvt.s.wu    fs7, a1
                  andi         s7, s8, -320
                  fmax.s       fs0, fs1, fa3
                  auipc        a2, 479216
                  addi         t6, a1, -620
                  slti         a4, sp, 1126
                  sra          a1, s3, s10
                  xor          sp, sp, a4
                  fsub.s       fs4, fs3, fs6
                  flt.s        a5, fa1, fa3
                  auipc        s6, 297378
                  andi         s8, t2, 562
                  fmax.s       fa4, fs4, ft9
                  fadd.s       fs2, ft6, fs10
                  feq.s        a4, fa4, fa1
                  add          sp, t6, tp
                  fsgnjn.s     ft9, fs6, fs1
                  fmv.x.w      a7, fa2
                  fmax.s       fs8, ft9, ft8
                  fmin.s       ft11, ft1, fs2
                  mulh         s0, s0, a3
                  fclass.s     t3, fa3
                  fmul.s       fa1, fs6, fa0
                  or           a3, a0, t2
                  fcvt.w.s     s9, ft1, rtz
                  or           s9, ra, a3
                  lui          t4, 1003493
                  fclass.s     t6, ft9
                  lui          sp, 785102
                  sltiu        s5, t6, -1313
                  fmv.w.x      ft3, s11
                  srai         a7, t2, 5
                  fmv.x.w      s8, fs2
                  sra          s9, s2, gp
                  fmul.s       fa3, fa7, fa5
                  fmul.s       fa6, ft6, fs5
                  srli         s9, a5, 6
                  lui          a3, 829453
                  slli         s1, s6, 27
                  fsub.s       fa1, fa4, fs10, rdn
                  sltu         s4, s2, s9
                  mul          t4, s7, a3
                  mulhu        a3, s8, a0
                  addi         s10, t1, 1052
                  mul          sp, t1, s3
                  fdiv.s       fs8, fs1, fa3, rup
                  srai         a1, s6, 17
                  srl          gp, a3, t2
                  auipc        s1, 503465
                  remu         gp, s5, tp
                  xor          s8, a4, s8
                  feq.s        a5, ft0, ft2
                  add          t6, a0, a5
                  add          tp, s3, a7
                  feq.s        s0, fs9, ft11
                  srai         tp, t2, 30
                  mul          s6, a4, a3
                  fmv.x.w      s7, ft10
                  srai         a5, sp, 19
                  fmax.s       fa2, fa0, ft11
                  fsgnj.s      fs3, fa6, fa5
                  fmv.w.x      fa1, s11
                  andi         a5, s0, 596
                  flt.s        s3, ft0, ft8
                  slli         sp, t4, 5
                  mulhu        tp, zero, s10
                  fsgnjx.s     fa5, ft0, fa7
                  fmul.s       fs6, fa5, fa1
                  fcvt.s.wu    ft0, gp, rne
                  andi         gp, s8, -472
                  mulh         zero, t5, s4
                  remu         a4, s9, s11
                  fsqrt.s      ft3, fs8
                  andi         t4, s3, 174
                  slt          s4, t4, t0
                  fmv.x.w      s6, fs4
                  fle.s        s6, fs10, ft2
                  mulhu        s11, t3, a1
                  add          s6, a3, s5
                  fmin.s       ft8, fs6, fa4
                  sub          t3, a1, a0
                  fsgnjx.s     fa2, fs1, fs5
                  mulhsu       s6, s6, s2
                  srli         s1, zero, 11
                  sltu         ra, t3, ra
                  slli         a1, s8, 8
                  mul          t0, t3, a4
                  fsqrt.s      fs7, fs4
                  fsgnjx.s     fs4, ft0, ft10
                  mulhu        t6, s0, t6
                  andi         ra, s2, -350
                  sltiu        s4, a7, -689
                  div          s11, t4, a4
                  mulhu        a1, s1, s6
                  div          s4, s8, ra
                  feq.s        s3, ft5, ft0
                  fsqrt.s      fs1, fa1, rne
                  remu         a6, tp, a2
                  nop
                  srai         s0, a5, 31
                  fmul.s       ft4, fs0, fs4
                  slli         a4, a1, 29
                  mulh         s6, s3, s4
                  xor          t4, s6, s1
                  srai         a6, a7, 4
                  fsqrt.s      fs1, ft1, rdn
                  feq.s        ra, ft6, fs5
                  slt          s5, a5, s9
                  lui          t6, 302583
                  fsgnj.s      fs10, fa7, ft10
                  sra          t0, gp, ra
                  fcvt.s.wu    fs1, t4
                  sltu         tp, a6, s6
                  sltiu        a4, a0, -859
                  lui          t3, 303339
                  fcvt.s.wu    ft5, t3, rtz
                  fmax.s       fs0, fa4, ft2
                  fsgnjn.s     fa7, fa5, fs0
                  mulhsu       a0, s7, t2
                  slli         s4, zero, 28
                  fmul.s       fs8, ft8, fa5, rne
                  fle.s        t2, ft1, fs4
                  sltu         t6, t1, t5
                  srai         ra, sp, 9
                  fsqrt.s      fs7, ft4
                  srli         s3, a1, 8
                  fdiv.s       ft10, fa2, fa3, rmm
                  mulhu        s6, a5, t3
                  fsub.s       ft0, ft6, fs1, rne
                  sra          s7, a6, a6
                  fadd.s       ft1, ft11, ft2, rdn
                  add          s11, t5, s7
                  rem          t2, s9, s11
                  slli         t3, t3, 6
                  fmv.w.x      ft8, t1
                  fmin.s       ft2, fs7, ft3
                  auipc        ra, 743978
                  fsub.s       ft9, fa6, ft4, rtz
                  mulh         s1, gp, a7
                  div          a6, a2, s5
                  add          s1, t5, s0
                  srai         s9, t2, 8
                  fdiv.s       ft9, fs10, fs7
                  addi         s9, s6, -1554
                  feq.s        a6, fa3, fs11
                  mul          a7, t3, gp
                  fle.s        s6, ft6, fa3
                  xori         t2, ra, 1491
                  slti         s10, sp, -304
                  fsgnjn.s     fa6, fs0, fa1
                  rem          s5, tp, t2
                  addi         a0, s10, 573
                  sra          s6, s8, a7
                  fmul.s       fa5, ft4, fa5, rne
                  fcvt.s.w     ft4, a3, rtz
                  and          a5, a1, t5
                  xor          zero, a3, t6
                  remu         s4, a4, s4
                  srai         s9, s7, 8
                  and          s1, s7, a5
                  slt          ra, gp, tp
                  fsgnjn.s     ft10, fs5, fs5
                  sll          t3, a6, a7
                  auipc        t4, 674675
                  fsgnjn.s     ft0, fa4, fs8
                  fclass.s     s9, fa0
                  nop
                  fmul.s       fs7, fa5, fa6, rup
                  andi         a6, ra, 102
                  add          s4, s8, s6
                  xor          s7, s6, gp
                  xor          t6, s11, t0
                  srli         gp, a3, 22
                  sltiu        s9, a2, 1177
                  remu         s7, s10, s2
                  fcvt.s.wu    ft8, s8
                  fcvt.s.wu    fa4, tp, rne
                  fclass.s     s8, fs11
                  sltu         ra, s3, a7
                  lui          s9, 118527
                  xori         s3, zero, -937
                  xor          s11, s8, s4
                  slt          zero, s5, sp
                  fmv.w.x      fa6, t3
                  sltiu        t2, sp, -1098
                  fmul.s       fs6, ft0, fs0, rne
                  andi         s5, t5, -841
                  mulh         t3, s6, t1
                  mul          s8, a5, s10
                  auipc        t6, 383958
                  sll          s11, t4, s5
                  mulhu        s1, s11, a6
                  auipc        gp, 709816
                  div          s0, s10, zero
                  mulhu        a5, a1, s0
                  fmv.w.x      fa1, a3
                  srai         a2, s1, 9
                  fsgnjn.s     ft3, ft4, ft1
                  sltu         t0, s5, a6
                  slli         a2, s8, 23
                  slt          t3, t5, ra
                  fmv.x.w      zero, fa2
                  fmul.s       fs7, fs8, fs9, rup
                  sub          a2, a4, s7
                  sltu         t3, s5, t2
                  add          t2, a7, s4
                  ori          s5, s3, -605
                  rem          a3, a5, a2
                  sltiu        s11, s11, -763
                  sltu         s10, gp, t5
                  divu         a0, a0, t6
                  xor          s0, s10, s7
                  nop
                  fclass.s     t6, ft10
                  fsgnj.s      ft3, ft4, fs10
                  fsgnj.s      fa2, fs1, ft0
                  addi         tp, zero, 1001
                  mul          s8, s8, t6
                  fmin.s       fa4, fs6, fs7
                  fle.s        zero, ft9, fa5
                  auipc        t0, 420774
                  andi         s10, a2, 1920
                  slti         a4, s5, 379
                  mulhsu       a7, t6, a1
                  fle.s        gp, ft8, fa6
                  fsgnjx.s     fs3, fs10, ft7
                  fcvt.s.w     fa6, gp, rdn
                  remu         s6, s7, s8
                  slt          s3, s3, s9
                  add          a6, t4, s1
                  fsqrt.s      ft5, fs10, rmm
                  fcvt.s.w     ft4, s1, rdn
                  fclass.s     s10, fa1
                  sltu         s1, s0, s10
                  slti         a1, t2, 125
                  fsqrt.s      ft10, fs6
                  fclass.s     t2, fs9
                  nop
                  fcvt.s.w     fa2, s5, rmm
                  fsgnjn.s     fa5, fs7, fs7
                  fsgnj.s      ft7, ft9, fs2
                  fsgnj.s      ft10, fa0, ft11
                  slti         s6, s10, 646
                  mulhsu       s8, gp, s3
                  fsgnjx.s     fa4, fa3, fa7
                  auipc        gp, 256021
                  fcvt.s.wu    fs6, a0, rne
                  slt          sp, ra, a2
                  xor          s9, a7, s3
                  xor          s11, t3, t6
                  srl          t4, t6, a2
                  sra          s3, s6, s11
                  lui          s1, 943652
                  divu         t2, t3, tp
                  sltu         t2, s7, s0
                  sub          ra, a5, sp
                  rem          s3, s11, a1
                  mulh         s7, ra, s0
                  ori          s1, a6, 60
                  addi         a4, ra, 76
                  sub          a0, s10, a7
                  auipc        s5, 178849
                  auipc        a4, 176110
                  auipc        gp, 859181
                  feq.s        ra, fa4, ft5
                  srli         a3, a7, 31
                  add          s8, a5, s0
                  srli         a1, t1, 3
                  fmax.s       ft11, ft0, ft8
                  and          s8, s10, s2
                  remu         t6, s11, s7
                  fmv.w.x      fs9, a4
                  and          t3, s6, s6
                  slli         ra, tp, 19
                  fsgnjn.s     fs6, fa0, fs2
                  and          s10, s10, sp
                  div          zero, a1, a6
                  srl          a7, a3, s10
                  fsgnj.s      ft7, fa7, fa4
                  fcvt.s.wu    fs4, tp, rne
                  feq.s        a4, ft9, fa6
                  flt.s        a0, ft5, fa5
                  slti         s6, a4, -1590
                  lui          s5, 992733
                  fle.s        a0, fa2, fs2
                  sltiu        s6, s1, -232
                  mulh         s0, a5, s0
                  sltiu        ra, a1, -940
                  mulhu        a1, a1, s11
                  fcvt.s.w     fa4, s6, rne
                  or           t2, t2, a6
                  mulh         s9, t1, s2
                  fsgnj.s      fa0, ft2, ft4
                  mul          s5, t6, s1
                  fadd.s       fa3, fs8, ft6
                  slti         a0, t1, -1903
                  remu         a6, s7, t3
                  fsgnj.s      ft6, ft3, fs5
                  sltiu        s6, a5, -1223
                  fcvt.wu.s    t0, ft5
                  sltiu        s7, t5, -1433
                  sltiu        a1, t6, -331
                  fmv.x.w      a2, fs2
                  divu         s4, s10, a5
                  fsub.s       fs5, ft0, fa3
                  mul          s3, s1, t5
                  nop
                  div          t6, s9, t3
                  mulh         s4, a2, s9
                  fmin.s       fa7, fa5, fa7
                  mulhsu       s3, t2, s0
                  andi         t0, t6, 1920
                  fle.s        t4, fs9, ft7
                  fdiv.s       ft11, fs8, fa6, rup
                  rem          t2, a7, tp
                  sll          t4, a3, a3
                  nop
                  remu         s11, s1, s9
                  fmin.s       ft10, ft7, ft9
                  srli         s9, s2, 28
                  sll          a6, s5, a0
                  sub          a7, t6, t0
                  and          s1, t0, t6
                  mulhu        a0, a0, a6
                  sra          t0, tp, a1
                  fmv.w.x      fs5, s5
                  fadd.s       fa7, fs1, ft11, rup
                  srli         a4, s2, 20
                  fcvt.s.wu    ft2, s5
                  slt          a5, s2, zero
                  mulh         a0, a5, s0
                  fsgnjn.s     fs10, ft8, fs4
                  sltiu        s3, t4, -1488
                  ori          a2, s7, -1893
                  fmv.w.x      fs8, s10
                  slti         a7, s4, 723
                  srl          t0, s10, s11
                  xori         s7, a6, -547
                  fsgnjn.s     fs8, fs1, ft11
                  fsgnjn.s     fa1, fs6, fs10
                  slti         s4, t6, 1470
                  auipc        sp, 381926
                  fsub.s       fa0, ft7, fs2, rne
                  xor          t6, s3, s2
                  or           a4, s9, a2
                  fsgnjx.s     fs9, ft3, fs5
                  add          s8, a3, a1
                  addi         t6, a3, 952
                  ori          t0, sp, -1687
                  fle.s        s10, fs6, fs10
                  mulh         a4, s9, s4
                  fle.s        tp, fs7, fs9
                  fsgnjn.s     ft10, fs10, ft8
                  fcvt.w.s     s5, ft1
                  sltiu        a3, t5, 1344
                  sub          s9, sp, t3
                  flt.s        a6, ft9, fs1
                  and          s8, s3, t6
                  flt.s        sp, fa1, fa5
                  mul          s9, a6, s8
                  or           t4, s0, zero
                  fsqrt.s      ft6, fs3
                  sltu         a7, s4, t5
                  fdiv.s       fs4, fa1, fs1, rtz
                  fsub.s       ft3, fa7, fa2, rmm
                  fcvt.wu.s    ra, fa6, rne
                  mulhsu       gp, s0, a7
                  fcvt.w.s     a0, ft5
                  slti         t2, t4, 1709
                  lui          zero, 182559
                  fsgnjx.s     fs7, ft6, ft2
                  fsub.s       fa0, fa0, fs7, rtz
                  fle.s        s1, fa2, ft9
                  div          s4, a1, ra
                  divu         s4, s0, a7
                  fsgnjx.s     fs7, fa3, fs11
                  sll          ra, gp, a7
                  fdiv.s       fs0, ft11, ft0
                  fcvt.wu.s    gp, fs1
                  addi         a5, gp, 766
                  mulhu        s5, a5, s8
                  mulhsu       s5, s10, s2
                  fcvt.s.wu    ft1, s9
                  fclass.s     a5, fs2
                  sub          t2, s0, s6
                  fsgnj.s      ft5, fa1, fa6
                  mulh         a4, a3, s4
                  fmax.s       fa2, fa5, fs2
                  or           a6, s11, s11
                  srl          a2, t5, s4
                  rem          s5, s10, s4
                  fdiv.s       ft4, ft9, fs9
                  flt.s        a2, ft11, ft1
                  fmv.x.w      a4, fs1
                  addi         s7, s6, -675
                  addi         a1, s4, -177
                  remu         s8, ra, a2
                  fsub.s       fs5, fs6, fa5, rdn
                  flt.s        t6, fs3, fs0
                  slt          s8, a3, t5
                  and          s9, a0, s5
                  fsgnjx.s     fa3, ft5, fa6
                  xori         sp, s1, 823
                  add          s9, a3, s4
                  lui          a3, 166158
                  remu         s8, s5, s1
                  slt          s3, s11, s0
                  fadd.s       fa5, ft3, ft0, rup
                  and          s4, a4, s5
                  fsgnjx.s     fa2, ft11, ft0
                  xori         a2, s9, 1194
                  div          s6, s10, t1
                  fsub.s       ft2, fs10, fs3, rtz
                  fsgnjn.s     ft9, ft9, fs6
                  andi         s4, a6, -1729
                  rem          t4, s9, s6
                  fclass.s     a1, ft6
                  sltu         a1, t0, a2
                  fcvt.s.wu    ft11, a5, rup
                  slt          a5, t6, a2
                  sra          ra, s8, a6
                  srli         a4, s6, 3
                  sub          a5, t6, s4
                  flt.s        s9, fs3, fa3
                  fcvt.s.wu    fs11, t5, rne
                  rem          a5, a1, a6
                  slt          t3, s7, s3
                  sub          s4, sp, s3
                  fadd.s       ft10, fa3, ft11
                  xori         a3, t1, 1798
                  slli         a4, s1, 8
                  sub          a5, a7, t0
                  lui          zero, 983788
                  or           s8, s2, a2
                  rem          s10, t6, t1
                  xor          s7, t6, a7
                  and          sp, t3, a5
                  sltu         s1, s10, s6
                  ori          a1, a7, 1374
                  fsgnjx.s     fs11, fa6, ft9
                  auipc        a6, 697567
                  feq.s        s8, fs10, ft3
                  fsqrt.s      fs8, fa0
                  slti         a4, s5, 1539
                  fsub.s       fs11, ft8, fa2
                  sll          s10, s5, s0
                  fsqrt.s      fa0, fa3, rup
                  mulhsu       s11, s4, a4
                  sltu         a5, s5, t0
                  fmax.s       fa1, ft6, fs3
                  fdiv.s       ft11, ft5, fs9, rmm
                  sltu         s8, sp, s8
                  srai         t4, t3, 14
                  fmax.s       ft2, fs7, fs3
                  fmul.s       fs3, fs3, fs4
                  xor          t2, a0, s3
                  div          a6, a5, s1
                  fsqrt.s      fa3, fa6
                  srl          a1, a6, tp
                  or           tp, t4, s4
                  fsub.s       ft6, ft5, fa4, rmm
                  flt.s        a7, fs10, ft1
                  fmin.s       ft1, fs5, fs8
                  rem          s11, a2, a4
                  rem          t4, s2, a3
                  slti         a4, sp, 926
                  srl          a0, zero, a1
                  fsgnjx.s     fs1, fs5, fa0
                  slti         s3, t5, -45
                  fsgnjx.s     fa3, fa5, fs11
                  fcvt.w.s     t3, fa0
                  fdiv.s       ft6, ft5, fs8
                  xori         s6, s10, 1442
                  slt          sp, s5, s1
                  fclass.s     a7, fs2
                  fcvt.w.s     s7, fa0, rmm
                  fmin.s       fa0, ft5, fa0
                  fcvt.w.s     s7, fa1, rdn
                  fle.s        a5, fa3, ft8
                  fclass.s     a0, fa7
                  remu         a3, gp, zero
                  lui          ra, 996567
                  flt.s        s5, ft9, fs3
                  slti         gp, sp, -295
                  fclass.s     gp, fa4
                  feq.s        t2, fa6, ft5
                  slli         s1, gp, 17
                  fcvt.w.s     t3, fs0
                  ori          t6, a4, 510
                  slt          s7, s10, t4
                  fsgnjn.s     ft11, fs7, ft8
                  fsgnj.s      ft6, fs4, fa6
                  fle.s        s1, ft10, ft6
                  lui          t6, 756005
                  auipc        s4, 346806
                  and          t3, a3, s7
                  fcvt.s.w     fs8, a1, rtz
                  srl          a1, a0, a5
                  fsgnjn.s     ft5, fs9, ft0
                  fsub.s       ft9, fa2, ft8, rup
                  slti         ra, s8, 1013
                  slt          zero, t1, t6
                  fcvt.w.s     s0, fs6
                  xori         a1, zero, -1837
                  sll          a3, s8, s0
                  mulhsu       tp, a5, t1
                  rem          s8, a1, a2
                  fclass.s     a6, ft8
                  mul          a7, s11, t4
                  srli         s3, ra, 2
                  remu         s5, t4, a5
                  fcvt.wu.s    a4, fa1
                  lui          a5, 702468
                  ori          s4, a0, 1821
                  fcvt.s.wu    ft9, a0
                  and          zero, s11, sp
                  div          gp, t6, s6
                  fmv.w.x      ft2, a0
                  fmax.s       ft0, ft8, ft9
                  fmv.w.x      fs0, s2
                  fsgnjx.s     fa7, fa2, ft3
                  fmul.s       ft4, fa5, ft6
                  fcvt.s.wu    ft8, s11, rdn
                  lui          t3, 82354
                  slt          a3, s11, s9
                  andi         ra, s1, 2019
                  sll          t4, a5, a5
                  fsqrt.s      fs3, fa0
                  add          zero, s1, a1
                  mulh         a4, s5, s0
                  fmax.s       fs10, fs8, fa2
                  flt.s        tp, ft7, ft7
                  sra          a1, s5, a6
                  sub          s9, zero, a0
                  ori          a3, a5, -23
                  slt          tp, t6, a4
                  addi         zero, s2, 1767
                  auipc        s1, 1012821
                  fcvt.w.s     s0, ft7, rne
                  rem          a1, a2, tp
                  mulhu        a0, s0, a7
                  fsqrt.s      fs1, fs4
                  div          s9, s5, t2
                  fcvt.w.s     s1, ft3, rdn
                  fmv.x.w      s7, fs4
                  fsub.s       ft1, ft5, fs4
                  or           zero, s6, s7
                  fcvt.s.wu    fs9, a4
                  fsgnj.s      fa5, fs8, fa2
                  fmin.s       ft2, fa2, fs0
                  fdiv.s       fs5, fa7, ft10, rmm
                  add          a6, t6, s5
                  fmv.x.w      gp, fs7
                  lui          a7, 182518
                  xor          s8, t0, s1
                  srl          s1, t4, t1
                  sltu         s10, s0, tp
                  xor          gp, s2, s9
                  srl          t4, a1, a6
                  or           s10, t1, ra
                  add          a4, t1, t2
                  fdiv.s       fs1, fs10, fs3
                  fmin.s       fa2, ft2, ft3
                  xori         s4, s11, -1409
                  andi         gp, a2, 446
                  sltiu        s3, s4, 358
                  remu         a3, t3, s6
                  slli         a5, a7, 12
                  sltu         a1, tp, a2
                  slt          t3, t4, s9
                  divu         t6, sp, a0
                  fcvt.s.w     fa1, ra
                  slt          s5, zero, s10
                  fsgnjn.s     ft0, fs7, fs9
                  fcvt.w.s     s5, ft6, rup
                  fcvt.wu.s    zero, fs1, rne
                  fmul.s       fa0, fs7, ft2, rne
                  slti         s1, tp, -1311
                  div          s5, s0, s2
                  fcvt.s.w     ft2, a7
                  fmv.w.x      ft2, s7
                  fsub.s       fs3, ft1, fa5
                  mulh         t4, a3, a2
                  addi         t2, s2, 72
                  xori         s11, a5, -1844
                  fmin.s       fs9, fa3, fa3
                  fsqrt.s      fa4, fa4
                  fclass.s     gp, ft4
                  sltu         s10, s7, a2
                  slti         a7, tp, -1313
                  xor          s4, tp, s4
                  sll          s7, tp, s5
                  slti         s7, a0, 184
                  and          t6, s1, s4
                  fsgnjx.s     ft11, fa4, ft1
                  mulhu        s9, s6, t1
                  fle.s        a6, fs8, fs11
                  or           a3, s7, t3
                  auipc        t0, 44393
                  rem          a5, t1, sp
                  div          s8, t0, s1
                  rem          tp, s5, a7
                  addi         a6, a5, -1366
                  divu         s3, s7, t2
                  srai         a4, s0, 24
                  fcvt.w.s     a6, ft7
                  sll          a1, zero, t0
                  fmin.s       fs9, fs10, fa6
                  fsub.s       fa4, ft5, fa2, rne
                  fmv.w.x      ft3, s0
                  sltiu        a6, s7, -428
                  mulhu        ra, gp, a0
                  flt.s        s0, ft2, fa0
                  fadd.s       fs6, fs2, fa6, rup
                  fmul.s       ft0, fs8, ft4, rup
                  xori         s1, a2, 1454
                  fmv.x.w      sp, ft6
                  mul          a4, t0, t3
                  fdiv.s       fa4, fs2, fa6
                  sub          a6, t5, s1
                  remu         a5, s5, t4
                  fmv.x.w      s11, ft3
                  feq.s        s6, fa5, ft1
                  auipc        t4, 916165
                  flt.s        t6, ft5, ft11
                  fclass.s     t4, ft9
                  xor          gp, a4, t4
                  sll          a4, t2, a3
                  srli         s9, a2, 4
                  fclass.s     s4, fa4
                  fadd.s       ft9, fa5, ft10
                  xor          sp, t5, s7
                  sltiu        s6, a5, -848
                  sll          a0, s2, a3
                  fcvt.wu.s    sp, fs3, rtz
                  fsqrt.s      fs9, fs5, rup
                  divu         s9, s4, a0
                  mulhsu       s10, a2, s8
                  srai         s8, a4, 30
                  fmv.w.x      fs2, s11
                  sub          a3, s4, s0
                  and          s1, t3, a6
                  fcvt.w.s     zero, fs10, rmm
                  fsgnj.s      fa0, fs2, fa4
                  srai         s9, a3, 6
                  mulhu        tp, a4, t2
                  sltiu        t0, s6, 1461
                  mul          zero, a1, s0
                  divu         a1, t0, a6
                  sltu         s4, s7, s11
                  add          s7, t0, s3
                  sll          s7, a0, t0
                  fcvt.s.w     ft0, s7, rtz
                  addi         s0, t2, 1257
                  fclass.s     a5, ft8
                  sltu         tp, a4, t6
                  sra          a4, a4, tp
                  fsgnjx.s     ft6, fs2, fs1
                  xor          a2, t0, t1
                  andi         a4, a5, -423
                  slt          t4, sp, a0
                  fmin.s       ft9, ft9, fs6
                  srl          t6, ra, s6
                  slli         sp, s4, 19
                  xor          s8, ra, t5
                  fsub.s       fa4, fs5, fa6, rup
                  xori         s3, t6, -1250
                  fsgnjx.s     fs5, fs7, ft9
                  flt.s        s3, fs9, fa4
                  sll          s5, s0, t0
                  slt          s4, t2, t3
                  fadd.s       fs2, fa3, ft4
                  lui          s6, 596016
                  xori         a4, a5, 486
                  fsqrt.s      ft2, fa2, rdn
                  andi         t4, s1, -946
                  fle.s        s11, fs1, fs11
                  flt.s        s11, fs5, fs10
                  fcvt.w.s     s1, fa6
                  mulhsu       sp, s3, ra
                  and          s7, t2, ra
                  mul          a0, tp, tp
                  auipc        a2, 561578
                  mulhu        sp, s4, tp
                  fmv.w.x      ft5, a2
                  fsgnjx.s     fs11, ft6, fs8
                  mulh         a1, s11, t1
                  feq.s        s3, fs7, fs9
                  add          s11, t6, a5
                  mulhsu       s10, a5, s1
                  fmv.x.w      a4, fs9
                  srl          ra, t6, t1
                  sltiu        s1, tp, 1056
                  fsqrt.s      fs1, ft4, rup
                  auipc        s1, 295154
                  auipc        s11, 255270
                  lui          a3, 359823
                  fsub.s       ft6, fa7, fs7, rne
                  srl          s5, s4, s3
                  rem          s5, ra, s9
                  sub          a3, a7, t0
                  remu         s6, s4, t1
                  mulhsu       s5, s6, s7
                  slti         a0, a4, 302
                  auipc        s8, 775010
                  nop
                  mulhu        s9, t0, s8
                  feq.s        a6, ft6, ft7
                  sltiu        t2, gp, 697
                  xor          s4, s3, s0
                  srl          t4, t6, a4
                  andi         tp, s11, -1061
                  fcvt.w.s     a6, ft7
                  sltu         a4, t5, a0
                  fsgnj.s      ft5, fa2, ft4
                  fadd.s       ft9, fs10, fs11
                  fmax.s       fa7, fs5, fa7
                  slti         s8, a1, -1792
                  flt.s        t2, fs1, ft7
                  slti         t3, a6, 569
                  fmax.s       fa5, fs5, fs11
                  mul          s3, tp, t6
                  fsqrt.s      fs4, fa0
                  mulh         s8, s4, s1
                  divu         a7, t1, s3
                  xori         s1, s1, -1095
                  srli         a2, a1, 26
                  xor          s1, s0, zero
                  slti         gp, t6, -1983
                  sltu         a2, t6, t0
                  rem          s5, t2, s0
                  addi         a2, s4, 1382
                  xori         s10, tp, 1632
                  add          s0, s5, ra
                  sub          gp, tp, s9
                  sltiu        t2, s9, -656
                  fsgnj.s      fs3, fs7, ft11
                  fsqrt.s      fs1, fs0
                  mulh         a3, s3, s3
                  nop
                  fsgnj.s      fa6, fs6, ft2
                  fmv.x.w      s7, ft11
                  fsgnj.s      fa4, fa7, ft3
                  ori          a5, a0, 1013
                  divu         s8, zero, t0
                  slli         t2, t2, 27
                  slt          a7, s8, s0
                  slli         s9, zero, 24
                  fmin.s       fa0, fs10, fa3
                  mulhu        a4, s8, a6
                  fsub.s       fs6, fs6, fs4, rdn
                  xori         a2, s4, -1725
                  sltiu        t2, a7, 141
                  slti         gp, tp, -1180
                  srai         s10, s7, 22
                  fle.s        s1, fs0, fs11
                  fsgnj.s      fs2, fa1, fa2
                  addi         sp, t5, -178
                  addi         s3, a5, -681
                  slli         s7, s6, 20
                  andi         t0, t4, 128
                  feq.s        sp, ft4, ft0
                  fsgnj.s      ft3, fs7, fa4
                  sltu         t4, s10, sp
                  remu         t2, t3, s3
                  sltu         s10, s11, s1
                  fmul.s       ft9, ft1, fa5, rmm
                  and          ra, s4, zero
                  ori          gp, s0, -171
                  fsgnjn.s     fa1, fs11, fs11
                  sub          ra, t6, s10
                  xori         s1, s11, -1852
                  fclass.s     zero, fs6
                  fsub.s       fs3, ft8, fs3
                  rem          ra, s10, s7
                  and          a6, s1, a3
                  fmax.s       ft4, fs11, ft5
                  sub          t2, s2, a1
                  fdiv.s       fa3, ft8, ft6, rup
                  remu         sp, t3, s9
                  sra          a6, a7, t4
                  feq.s        a0, fa0, fs1
                  fclass.s     ra, ft6
                  slti         a2, a3, 1347
                  xori         s10, s11, 1978
                  srai         sp, sp, 29
                  remu         s11, s5, a6
                  fmin.s       ft6, fs3, fa4
                  feq.s        a6, fa6, fs8
                  addi         t6, gp, -348
                  fcvt.s.wu    fs9, a5, rmm
                  fcvt.w.s     a7, fs7, rtz
                  remu         s4, gp, t0
                  fcvt.w.s     gp, fs5, rup
                  and          s10, s6, ra
                  and          sp, t6, t1
                  divu         t0, t5, t1
                  mul          s5, tp, t3
                  slli         s0, t0, 11
                  fdiv.s       ft10, fa6, fa3, rne
                  div          t6, s7, t5
                  andi         a5, a0, 561
                  sra          ra, a3, s4
                  sltiu        s4, a5, -1023
                  sltu         a4, tp, a5
                  fle.s        tp, fs11, ft8
                  add          s10, t5, s9
                  fsgnjn.s     fs6, ft1, fa0
                  fcvt.s.wu    fs9, tp
                  fsqrt.s      fs3, fa5, rdn
                  mulhsu       a3, t3, s10
                  fdiv.s       ft8, ft5, ft0, rdn
                  lui          a5, 214619
                  divu         t2, a0, tp
                  fsgnjx.s     fa6, ft1, ft0
                  feq.s        t4, fa0, fs5
                  or           zero, s11, a6
                  flt.s        a2, fs7, fa1
                  fadd.s       fs7, fa5, fa3
                  feq.s        a7, ft1, fa3
                  srli         a2, a4, 24
                  fcvt.wu.s    a1, fs11, rup
                  sltu         s0, t3, a2
                  lui          a7, 604088
                  remu         a3, t4, s7
                  fmax.s       ft7, ft5, fs0
                  fdiv.s       ft0, fs10, fa0
                  xori         s1, gp, 1648
                  add          a6, t5, t0
                  fsgnj.s      fs3, fs5, fa1
                  srl          a1, zero, t5
                  fmv.x.w      s6, fa7
                  fclass.s     t6, fa5
                  fmul.s       fa4, fs7, ft4
                  feq.s        s6, fa3, fa0
                  fmax.s       fs4, fs11, fs9
                  fmv.x.w      s7, fa5
                  srli         t4, s0, 25
                  ori          a4, s1, 1258
                  slt          t2, a5, a2
                  slli         a1, t2, 8
                  mulhu        gp, s3, sp
                  slt          a6, t0, a1
                  or           s8, a4, t0
                  slli         a2, s3, 17
                  addi         ra, a2, -1404
                  fadd.s       ft10, fs9, fs6
                  add          t2, s4, s11
                  flt.s        s3, fa5, ft0
                  rem          a7, s11, t0
                  ori          s1, s4, 1446
                  auipc        tp, 54545
                  sltiu        s1, zero, 1359
                  or           a0, a3, t2
                  fdiv.s       fs1, ft0, fs6, rup
                  mulhu        a7, s2, a2
                  mulhsu       a0, a5, s5
                  mulhu        a1, t2, s7
                  fadd.s       ft5, fs1, fs3, rmm
                  auipc        s8, 982544
                  slli         a2, t2, 25
                  xori         a5, s10, -729
                  fsgnjx.s     fa4, fs5, ft9
                  fmv.x.w      zero, ft2
                  sltu         a1, gp, s5
                  remu         a7, a2, a4
                  fcvt.w.s     t4, fs4, rdn
                  auipc        a7, 601513
                  fmv.x.w      s3, fs11
                  sub          a6, s7, a4
                  fmv.x.w      a4, ft11
                  lui          s3, 830402
                  fmv.x.w      s11, fs5
                  and          a7, a4, s7
                  fsqrt.s      fa2, fs2
                  divu         a6, zero, s0
                  fcvt.w.s     t6, fs4, rup
                  mulhu        t6, a2, a4
                  rem          s9, a3, t0
                  fmv.x.w      s3, fs2
                  div          t3, s4, tp
                  fadd.s       fs9, fs7, ft5, rup
                  fsgnj.s      fa1, fa5, ft3
                  slt          t6, s11, s0
                  div          t0, a2, t5
                  sll          s7, a1, zero
                  flt.s        s7, fs1, ft1
                  fdiv.s       ft5, ft3, ft5
                  mulhsu       a7, sp, a3
                  andi         gp, s3, 1120
                  slli         s11, a5, 20
                  or           gp, t5, s6
                  srli         t0, t1, 20
                  fsqrt.s      ft5, fs1, rtz
                  srl          t6, a1, s6
                  sltiu        s10, a3, 400
                  fsqrt.s      ft8, ft11, rtz
                  div          a5, tp, a3
                  sra          s0, a7, ra
                  sra          s10, gp, a6
                  addi         s1, a7, 691
                  sltu         ra, s6, t2
                  fcvt.s.wu    ft11, t4, rdn
                  mul          gp, s3, a5
                  fle.s        a4, fs9, fs9
                  mulhsu       s0, t0, t6
                  fcvt.s.wu    ft7, tp, rne
                  fcvt.wu.s    t6, ft8
                  slt          s8, s11, a7
                  nop
                  fcvt.wu.s    a4, fs6
                  srl          a3, a6, t2
                  mulh         gp, tp, a1
                  div          a2, t2, s7
                  lui          s7, 494986
                  fsqrt.s      ft2, fs1
                  mulh         gp, s7, a6
                  sra          a3, s0, t1
                  fsqrt.s      ft11, ft8
                  remu         s5, s6, s4
                  fcvt.s.w     ft6, a6
                  andi         zero, s10, -248
                  fsgnj.s      ft2, ft4, ft8
                  fcvt.s.wu    fa5, s5
                  fcvt.w.s     s3, ft0
                  xor          a7, s3, a7
                  addi         t2, s1, -1159
                  mul          s11, s5, a3
                  xori         s3, ra, 534
                  divu         s7, s0, t1
                  sll          a3, a6, ra
                  fcvt.wu.s    s10, fa2
                  lui          t0, 190922
                  mul          a5, s9, a7
                  andi         s6, a2, -706
                  fmv.w.x      fs8, a6
                  fmul.s       ft10, fa3, ft2, rmm
                  ori          a6, t6, 1594
                  rem          tp, s10, a2
                  and          t6, s10, a0
                  rem          tp, s4, t6
                  fcvt.s.wu    ft11, a0
                  or           s0, s3, s2
                  remu         s4, gp, s6
                  div          a1, s4, s7
                  ori          t2, s11, 563
                  fsgnjn.s     ft8, fs2, fs0
                  fclass.s     a0, fs3
                  srai         a7, t0, 27
                  fsgnjx.s     fa2, ft8, fs9
                  fsgnj.s      fa7, ft2, ft3
                  srl          s9, a6, a4
                  sub          ra, s7, a0
                  div          a1, t3, s0
                  fcvt.s.w     ft0, a0
                  fle.s        s10, ft0, ft11
                  fle.s        gp, ft8, fa4
                  fmul.s       ft1, fa7, fs11
                  andi         s6, a4, 993
                  div          t4, s10, t6
                  lui          s3, 581909
                  divu         ra, a1, s10
                  slli         s4, a1, 17
                  slti         s5, ra, -366
                  xori         sp, gp, -106
                  fsub.s       ft5, fa0, fa7
                  fcvt.s.w     fs4, a1, rdn
                  srai         a6, s0, 31
                  fmax.s       fa5, ft6, ft0
                  lui          tp, 180275
                  srli         s9, s3, 10
                  srli         s6, s0, 11
                  fsub.s       ft3, fs2, ft8, rmm
                  fclass.s     s10, ft1
                  mulhsu       s10, zero, s8
                  sub          s1, a2, a6
                  fsgnjx.s     fa4, fa5, fa0
                  fclass.s     t2, fa2
                  andi         a6, s8, 9
                  sra          t2, a0, a6
                  fsgnj.s      ft8, fs2, fa4
                  fmin.s       ft1, fs11, fs6
                  addi         t0, s8, 1791
                  fle.s        s1, fs1, fs5
                  mulhsu       a6, s2, tp
                  remu         s0, s11, a3
                  fadd.s       fs8, ft9, ft8
                  fadd.s       ft5, ft4, fs11
                  fmax.s       fa3, fs9, ft3
                  fsgnjn.s     ft9, fa6, fa6
                  sub          zero, s8, a7
                  rem          s7, a0, s4
                  flt.s        t2, fs1, ft6
                  lui          t3, 380511
                  mulhsu       tp, a1, a7
                  xori         a2, a1, 1437
                  fmul.s       fa3, ft0, ft3
                  remu         t3, a7, sp
                  auipc        s0, 998140
                  flt.s        a6, ft1, ft3
                  sra          s4, ra, t4
                  sra          ra, a1, a7
                  srl          a7, s8, s2
                  fcvt.wu.s    zero, fa1
                  srl          gp, ra, t4
                  slti         a4, t4, -1779
                  flt.s        a7, fa0, fa1
                  srai         s8, s2, 9
                  fmax.s       fs8, fs3, fa6
                  divu         s3, s7, a6
                  fcvt.s.wu    ft10, gp
                  fclass.s     t2, ft10
                  fsgnjn.s     ft1, fa4, fa1
                  sll          t0, gp, s6
                  fmv.w.x      fa0, s7
                  fclass.s     t3, ft4
                  sra          t3, s10, s6
                  sltiu        a3, s1, 345
                  nop
                  rem          s3, t4, a5
                  flt.s        s11, fa5, fs8
                  fcvt.w.s     t4, fs1
                  mulhsu       a2, t2, a2
                  fmv.x.w      t2, ft2
                  remu         a2, ra, s7
                  mulh         t0, s5, a3
                  flt.s        t2, fs7, fs9
                  sll          gp, t0, s7
                  srl          tp, tp, t6
                  fsqrt.s      fa6, fs3
                  fclass.s     t0, ft7
                  sub          sp, s1, t4
                  srai         t3, t0, 16
                  fclass.s     s4, fs10
                  divu         a0, a0, a2
                  sltu         s5, a5, ra
                  fsqrt.s      fa3, ft0, rup
                  fcvt.s.w     ft8, s5, rne
                  slti         a1, s10, -221
                  fle.s        s5, ft0, fs11
                  fcvt.s.wu    fa6, t1, rne
                  mul          gp, a6, a5
                  fsgnj.s      fs7, fa4, fa4
                  slti         a3, ra, 362
                  flt.s        s6, fs10, ft7
                  xori         a0, s9, 220
                  add          s11, s6, a1
                  slli         a5, t5, 19
                  srai         s3, t2, 6
                  ori          tp, gp, 615
                  mulhu        s5, s11, a1
                  fadd.s       fa3, fs0, fs4, rmm
                  andi         a7, t6, -107
                  sll          t6, s11, gp
                  fmv.w.x      fs2, t1
                  divu         s5, s9, a4
                  srai         t4, s10, 16
                  fmv.w.x      fs3, s1
                  srai         sp, s3, 31
                  sll          a3, s4, s10
                  mulhu        t3, t2, s1
                  srai         s6, gp, 14
                  sltiu        tp, sp, -631
                  feq.s        s11, fa7, fs10
                  fcvt.wu.s    s10, ft11
                  add          s0, ra, t4
                  fmv.w.x      fs5, s9
                  fmin.s       ft3, ft9, fa1
                  sltu         t4, t4, s3
                  fclass.s     a2, ft9
                  fsgnjn.s     fs0, ft2, fs10
                  mul          tp, t3, gp
                  or           ra, a0, s10
                  fcvt.s.w     ft2, ra, rup
                  sra          a1, a1, t1
                  srl          zero, t2, t0
                  slt          s5, gp, s11
                  and          s6, a2, a1
                  fcvt.wu.s    s3, ft8
                  xori         ra, a7, 656
                  fcvt.wu.s    t2, fs9, rne
                  fsqrt.s      fs5, fa2, rmm
                  add          a7, s10, s0
                  sub          s6, t3, a1
                  srli         t2, s5, 30
                  slti         a1, zero, 1600
                  xori         zero, ra, -1848
                  sltiu        ra, a1, 1275
                  sltiu        a1, a0, -1069
                  auipc        t0, 35981
                  srli         s3, s7, 19
                  fcvt.wu.s    a4, fa6, rne
                  srli         s11, s8, 15
                  slti         a4, s1, 1467
                  remu         s8, sp, s7
                  mul          a3, zero, a4
                  fcvt.wu.s    a3, ft11, rne
                  fmv.x.w      a7, ft9
                  fmin.s       fs3, ft8, ft2
                  fclass.s     a4, fa6
                  slti         ra, a6, -1514
                  mulhu        a5, a7, s7
                  andi         a3, t5, 1283
                  fsgnjx.s     fa4, fs8, fs3
                  fsgnjn.s     ft6, fa6, fs0
                  fmin.s       fs10, fs0, ft9
                  mulh         zero, a0, t3
                  slti         s4, zero, -411
                  fsqrt.s      fs7, fa6
                  fsqrt.s      fs9, fa5, rne
                  fcvt.s.wu    ft4, s8
                  fclass.s     s6, fa1
                  fsgnjn.s     fs1, ft5, fa2
                  sltu         s1, s11, t0
                  nop
                  fmul.s       fa1, fs10, ft4, rne
                  fmv.x.w      s6, fs1
                  fdiv.s       fa5, fa6, fs8
                  ori          s10, a4, -527
                  srl          s1, s4, s9
                  slt          s10, s7, a2
                  fclass.s     ra, ft1
                  fsgnjx.s     ft1, ft6, fa3
                  fdiv.s       fs2, ft6, ft3, rdn
                  xor          s11, s11, s8
                  mulh         tp, s5, s5
                  remu         t3, t6, sp
                  rem          t3, a5, gp
                  slli         a0, a1, 6
                  slti         s6, a3, -182
                  fmin.s       fs10, fa3, ft1
                  slli         s0, a7, 1
                  fmax.s       fs2, ft0, fa1
                  mulhu        t6, a6, s7
                  mulh         s1, s10, zero
                  mulhu        zero, gp, s11
                  add          zero, s8, s0
                  srl          t4, a2, a1
                  mulhsu       a1, a4, a1
                  fle.s        s11, fa7, ft4
                  mul          a0, gp, a4
                  rem          s11, t0, s0
                  fmv.w.x      ft6, ra
                  fmax.s       fa6, fa6, ft10
                  sltu         s0, t0, ra
                  fcvt.s.w     ft5, t3, rmm
                  divu         s9, zero, t0
                  rem          ra, gp, s5
                  slt          a5, a3, s6
                  srai         t2, s0, 17
                  fdiv.s       ft6, fa1, fs3
                  fcvt.wu.s    s8, fs2
                  slti         t4, s8, -778
                  remu         s4, a5, ra
                  fsgnjn.s     fs8, ft5, fs1
                  mulhu        a7, a0, t0
                  fmv.x.w      s7, fa5
                  or           s8, s5, tp
                  mulh         t3, s2, t3
                  fmv.w.x      ft2, a0
                  div          t2, s1, s5
                  sltu         zero, s3, ra
                  fmin.s       fs8, ft10, fs11
                  mulh         t2, s9, ra
                  remu         sp, a0, a1
                  fcvt.s.wu    ft3, gp, rmm
                  remu         s6, s10, a6
                  and          s9, a3, s4
                  fsub.s       fs1, fa4, ft0
                  srli         t2, tp, 25
                  sll          t6, s5, a1
                  sub          a1, s9, a2
                  lui          tp, 267375
                  fmin.s       ft4, fs11, ft1
                  fsgnjn.s     ft1, fs8, fs2
                  divu         s9, t1, a5
                  mulh         s11, s6, a3
                  fsgnjx.s     fa7, fs10, ft0
                  auipc        s4, 729949
                  or           sp, s8, t2
                  xori         a2, a2, 46
                  slti         a5, s3, 1176
                  fmax.s       fs5, ft9, ft5
                  fmax.s       ft4, ft7, fs6
                  sra          s6, s7, s5
                  divu         sp, s2, s6
                  fmv.w.x      fs8, sp
                  addi         ra, sp, 1028
                  mulhsu       sp, a3, t1
                  fmin.s       fs6, fa2, fa4
                  fmv.x.w      tp, fs0
                  mulh         a1, s7, t4
                  fmul.s       ft1, ft2, fs0, rup
                  slti         t6, t4, 951
                  rem          t3, t1, s3
                  fmv.w.x      fs10, s3
                  fcvt.s.wu    fs9, t5
                  remu         s1, s2, tp
                  mulhsu       s10, s1, a1
                  fmin.s       ft1, fa7, fa2
                  andi         ra, s6, -508
                  slli         s10, s10, 9
                  fadd.s       fs2, fa6, fa2
                  srl          a4, t2, t4
                  divu         t4, a7, sp
                  fle.s        s5, fs11, ft8
                  fsgnj.s      ft2, fa3, ft4
                  fclass.s     t0, fa4
                  sltu         s0, s3, s0
                  feq.s        a4, ft3, fs4
                  auipc        tp, 914824
                  slt          a6, a6, zero
                  fcvt.s.w     ft7, gp
                  fdiv.s       fs10, fs8, ft4, rne
                  xor          t3, s2, s10
                  ori          s8, s4, -1352
                  fdiv.s       fs6, fs0, fs7
                  add          s5, a0, s10
                  mulhsu       a3, s4, s7
                  fsgnj.s      fs9, fs6, fs5
                  fmul.s       fa5, fa1, fa6
                  fcvt.w.s     sp, fs2, rdn
                  mulhsu       tp, sp, t4
                  fmv.x.w      t4, fa3
                  fcvt.s.w     fs1, s0
                  fsgnjn.s     fs11, fs2, fs0
                  fmul.s       fs3, ft6, ft7, rup
                  or           ra, s11, s7
                  sll          zero, a0, t0
                  rem          a7, s1, s11
                  srl          a5, t6, s5
                  fadd.s       ft10, fa1, fs11
                  andi         a2, a0, 153
                  nop
                  mul          t4, s6, a6
                  fsub.s       fs9, fs3, fs3
                  slti         a1, s7, 1654
                  fsgnjx.s     ft1, fa2, ft10
                  feq.s        a5, fa6, fs6
                  srl          s10, ra, a2
                  xori         s10, gp, -216
                  srli         zero, a5, 6
                  fle.s        a6, ft8, ft3
                  srai         t2, t0, 9
                  add          s4, s1, ra
                  sub          s0, t0, s0
                  sltiu        a5, t1, -1144
                  lui          s0, 922792
                  sub          t6, t3, tp
                  fadd.s       fa4, fs0, ft9
                  mulhu        s8, s0, t2
                  and          s3, a5, s9
                  sltu         s5, a5, a0
                  sll          tp, a6, a1
                  remu         a0, a3, s2
                  feq.s        a0, fa5, ft2
                  feq.s        a2, ft7, fs8
                  addi         a1, s0, 1484
                  lui          s11, 992733
                  mulhsu       t4, s10, a1
                  flt.s        ra, ft1, ft10
                  fmv.x.w      sp, fs0
                  feq.s        t2, ft11, ft9
                  fdiv.s       fs8, ft3, fs11, rmm
                  andi         a5, t3, -1412
                  auipc        a2, 779026
                  flt.s        s1, ft6, fa4
                  or           s1, a0, s1
                  flt.s        a7, fs8, fs7
                  srl          s8, a3, s11
                  rem          a5, a1, sp
                  rem          sp, t0, a1
                  fadd.s       fs7, fa6, fa0, rne
                  fsqrt.s      fs1, fs10, rmm
                  fcvt.s.w     fs8, s7
                  fcvt.s.wu    ft0, s11, rdn
                  fsgnjn.s     fs2, fs1, ft4
                  fmv.w.x      ft10, a6
                  feq.s        a5, fa3, ft9
                  feq.s        s1, fs3, ft4
                  fmv.w.x      ft2, t3
                  addi         s0, a5, -1435
                  slli         s0, s4, 4
                  sra          a4, t4, t1
                  fmax.s       ft9, ft9, fa7
                  fsgnjn.s     fs1, fs10, ft10
                  slti         sp, t6, -1252
                  andi         a0, s6, -1141
                  auipc        s4, 854559
                  divu         a3, a2, s5
                  fsgnjx.s     fs10, ft11, ft9
                  and          s1, t2, s9
                  fcvt.wu.s    s6, ft8, rdn
                  mul          t0, s11, tp
                  div          a4, ra, s10
                  fclass.s     a7, ft5
                  flt.s        zero, fs8, fa6
                  fsqrt.s      fs4, ft3
                  fsub.s       ft2, fs3, ft8
                  fcvt.s.w     fs11, a5
                  fcvt.s.w     fa3, gp
                  slti         a0, a3, -2040
                  srli         s5, s4, 22
                  sltiu        a5, a3, -1231
                  srl          t6, zero, a5
                  fsgnj.s      ft11, fa2, fs2
                  fmax.s       fa6, fa7, fa5
                  ori          t3, s4, 250
                  fmul.s       ft10, fs2, ft5
                  remu         s3, t1, a5
                  xori         s9, s8, -1259
                  ori          t3, t3, -554
                  fcvt.wu.s    t0, ft2, rtz
                  flt.s        t2, fa0, ft7
                  fmin.s       ft5, ft2, ft5
                  or           t0, ra, a6
                  feq.s        s0, fa5, fa1
                  nop
                  mulhsu       t3, s8, a6
                  fmv.w.x      ft3, t6
                  fmax.s       ft1, ft3, ft4
                  fmax.s       ft9, ft1, ft4
                  nop
                  xor          a5, a0, s8
                  fcvt.s.w     fs1, t2
                  fcvt.s.w     fs3, gp, rtz
                  mulhsu       s4, s7, t2
                  xori         a6, s8, -1526
                  and          t3, sp, sp
                  fle.s        a6, fs5, ft0
                  slt          a7, a1, t4
                  srli         s1, s9, 8
                  remu         t4, s11, t3
                  fsgnj.s      ft10, ft3, fs2
                  mulhsu       s0, t3, s1
                  and          t0, t2, a3
                  fadd.s       fs11, fa2, fs10
                  rem          s1, a2, s8
                  slt          t6, sp, a0
                  sub          s0, s8, t1
                  xori         a7, ra, 1504
                  and          a1, gp, t0
                  div          a0, t1, s10
                  mulhsu       sp, s0, a5
                  fsgnjn.s     fa2, fs5, fa1
                  and          s0, s7, s0
                  nop
                  fmv.x.w      t4, fs9
                  sub          ra, s10, s0
                  sltu         a1, t1, s8
                  flt.s        s10, ft11, ft10
                  sub          a0, s4, s8
                  fle.s        t4, ft2, ft11
                  fadd.s       ft11, ft7, fs8, rtz
                  flt.s        s5, fs4, fs10
                  lui          a0, 155864
                  mulhu        s0, s8, t3
                  ori          a1, t1, 23
                  fsgnjn.s     fs0, fs11, ft9
                  divu         a7, a2, s9
                  srl          t3, s3, s3
                  nop
                  and          t6, s8, t4
                  fcvt.s.w     fa2, t4, rup
                  sub          ra, a7, s4
                  sltiu        s1, s0, -1778
                  fsgnjn.s     ft6, fs1, fa6
                  fmv.x.w      a5, fs7
                  fcvt.s.w     fa6, gp
                  or           a4, s1, s3
                  xor          sp, s7, a5
                  xor          t4, ra, t2
                  fcvt.wu.s    s3, fs1
                  fcvt.s.wu    fs10, a1, rdn
                  ori          a3, t6, -2043
                  divu         a7, s1, ra
                  fclass.s     t3, fs10
                  srai         a3, t5, 15
                  fadd.s       ft8, fs0, ft7
                  and          s9, t6, a2
                  fmv.x.w      s4, fa0
                  srai         s4, s8, 2
                  fmul.s       ft1, fs10, fa0, rtz
                  sll          s5, t1, s5
                  xori         s1, a1, 1181
                  or           a1, a0, s4
                  lui          s0, 657986
                  sll          t0, t0, s10
                  fmin.s       fs5, ft8, fs3
                  mulhsu       s10, t1, ra
                  nop
                  andi         s0, s0, -994
                  lui          zero, 672502
                  slt          zero, gp, a6
                  fsgnj.s      fa6, ft3, fa0
                  fmin.s       fs5, fa2, ft4
                  remu         s7, s3, zero
                  mulhsu       s4, t0, a4
                  auipc        a4, 109498
                  fcvt.wu.s    s4, ft7, rtz
                  sltu         a2, s11, zero
                  mulhu        ra, t3, s10
                  fsgnj.s      fs2, fa5, fs9
                  srl          s3, a5, s7
                  slt          a6, t2, s10
                  xor          a5, t2, s8
                  sll          tp, t6, sp
                  mulhsu       t0, s1, a0
                  xori         a5, s4, -1202
                  and          a0, a5, s3
                  fcvt.s.w     fs11, t5
                  divu         sp, a4, s6
                  fle.s        a0, fs3, ft11
                  fdiv.s       fs11, fa0, ft3
                  rem          s4, a6, a6
                  slli         s5, s2, 4
                  add          s10, s4, sp
                  add          s9, s5, s8
                  fmax.s       fs5, fs8, ft8
                  mul          s8, s7, t0
                  sll          a6, t2, t2
                  slti         t3, a5, -1080
                  mulhsu       s4, t0, sp
                  fcvt.w.s     a3, ft11, rdn
                  lui          a7, 433813
                  auipc        s3, 585968
                  fclass.s     s11, fs0
                  fcvt.w.s     a4, ft9, rmm
                  or           t0, t0, s6
                  fadd.s       fa0, fs11, fs2, rmm
                  fcvt.s.wu    ft7, s5
                  fcvt.s.w     fa3, s10
                  sll          s3, t2, t1
                  fsub.s       ft7, fs4, fa4
                  fsgnjx.s     ft7, fa3, ft4
                  fadd.s       ft0, fs11, ft9, rdn
                  srl          t0, s6, s8
                  ori          a1, t1, 1261
                  fmax.s       ft0, ft6, fs0
                  andi         a7, s11, 632
                  lui          s6, 667966
                  ori          s5, t1, -536
                  sll          t6, a3, a5
                  fsub.s       fa7, ft10, fa3, rne
                  srai         a0, s3, 11
                  sra          t6, t5, s7
                  fle.s        s6, fa7, ft1
                  rem          sp, a4, a6
                  xori         zero, s3, 1956
                  add          ra, t4, s5
                  fsgnjn.s     ft2, ft7, fa4
                  fsgnjn.s     fs11, fs0, fs7
                  slli         s3, s7, 3
                  feq.s        s0, ft0, fa4
                  fsgnj.s      fs5, ft11, fa3
                  fdiv.s       ft9, fs7, ft2, rne
                  fmv.x.w      a4, fs0
                  remu         s11, t5, t4
                  xor          s0, t2, a5
                  fcvt.wu.s    s0, ft6, rup
                  fsgnj.s      ft8, fs10, ft10
                  fmv.w.x      ft2, s1
                  sll          t2, a4, t4
                  xori         s10, s10, -620
                  xori         t4, t6, 913
                  fsgnjx.s     ft8, fs11, fs8
                  mulhu        s6, t6, ra
                  add          a4, a7, zero
                  fsgnjn.s     fs11, fs7, fa1
                  remu         ra, s10, gp
                  srai         s1, s8, 6
                  fcvt.s.w     fs6, t4, rtz
                  slli         a2, s3, 1
                  mulhsu       s5, a1, a3
                  mulhsu       ra, zero, s11
                  div          sp, a4, t0
                  fsub.s       fs10, ft11, fs5, rup
                  rem          ra, ra, s3
                  fdiv.s       fs4, ft3, fa6, rmm
                  sll          gp, s7, t4
                  mulh         zero, s3, t3
                  fmul.s       ft3, fs5, fs11
                  fcvt.w.s     t6, fs5
                  mulh         a7, s11, s10
                  fsqrt.s      fa7, fa0
                  fsqrt.s      ft1, fa1
                  fmv.w.x      fs10, t4
                  mul          a3, s3, sp
                  mulh         ra, s7, sp
                  fle.s        s3, ft9, fs9
                  flt.s        a1, fa3, ft8
                  fmul.s       fa3, ft10, ft5
                  fcvt.wu.s    s1, fs10, rup
                  ori          tp, tp, -1427
                  mulhu        tp, s8, a3
                  nop
                  srai         a4, a6, 31
                  fadd.s       fs5, fs11, ft2
                  ori          t0, t3, 108
                  fsgnjx.s     ft4, ft5, fs6
                  remu         s6, gp, a5
                  fmv.w.x      fa4, a5
                  mulh         s6, s3, s8
                  fsub.s       fa7, ft7, fa6, rdn
                  fmin.s       ft10, fa4, fa3
                  andi         a5, t5, 1845
                  xori         a7, a2, 488
                  and          s0, a6, s3
                  fmin.s       ft0, fs5, ft1
                  fdiv.s       fs4, ft1, ft0
                  slt          a6, a2, t6
                  fcvt.w.s     a3, fa2
                  div          a6, a4, s9
                  remu         tp, t3, s5
                  add          t6, s4, t2
                  mulh         tp, s4, a3
                  fmul.s       fs11, fs3, fs8
                  srai         s7, t0, 5
                  and          s3, s11, tp
                  remu         a5, a1, gp
                  fmv.x.w      tp, ft5
                  and          s6, s3, a3
                  andi         s10, s8, -567
                  addi         t2, a5, 741
                  fcvt.s.w     fa4, t2, rne
                  auipc        t6, 628185
                  fsgnjn.s     ft9, ft9, fs5
                  andi         zero, t4, -990
                  fmin.s       fs7, ft1, fs8
                  fsgnjx.s     fs0, ft9, fa7
                  mulhsu       gp, s0, s1
                  fmin.s       fs11, fs3, fs6
                  fmv.x.w      t6, fa5
                  fle.s        sp, ft5, fs11
                  slt          zero, a2, a5
                  slt          a4, tp, s1
                  addi         a4, s8, 923
                  fcvt.s.w     fa7, a4
                  auipc        a2, 119984
                  srai         t0, t1, 14
                  and          t4, zero, a4
                  fcvt.s.w     ft9, t2
                  srli         a4, a5, 12
                  auipc        t2, 595717
                  fmv.w.x      fa0, gp
                  xori         gp, s1, -749
                  addi         t0, a6, 1116
                  fdiv.s       fa4, ft5, fa4, rne
                  fadd.s       fs8, fa6, fa7, rup
                  ori          a7, a3, 1926
                  addi         s11, s9, -1759
                  mulhu        s9, ra, t6
                  sll          s7, s7, t0
                  fsgnjx.s     fa3, ft8, fs3
                  fcvt.s.w     ft0, s3
                  mul          a1, t1, t3
                  fsgnjx.s     ft2, ft10, ft10
                  fsub.s       ft7, ft2, fa2
                  feq.s        t3, fa1, fs8
                  fmul.s       ft3, ft2, ft5
                  sltu         s10, a4, s4
                  lui          a1, 34644
                  add          a0, s11, a2
                  feq.s        s10, ft1, ft0
                  srli         s3, t1, 2
                  fsgnjx.s     fs10, fa2, fa3
                  rem          zero, a2, s6
                  remu         a0, zero, t1
                  fsqrt.s      ft0, fa1
                  fsub.s       fa4, fa5, fs2, rmm
                  sub          sp, gp, ra
                  fmv.x.w      sp, fs0
                  srai         s5, t2, 25
                  fcvt.w.s     s0, fa3, rne
                  srl          a4, s0, t2
                  fsub.s       fs1, fa6, fa4
                  div          s8, zero, s1
                  fle.s        a0, ft11, fa3
                  fcvt.s.w     ft2, t1, rup
                  fcvt.s.w     ft7, gp
                  addi         sp, s0, -72
                  fcvt.s.w     ft7, a6
                  sll          s5, a3, s4
                  fle.s        a7, fs1, ft4
                  rem          t6, t4, s2
                  mulhu        a3, gp, t5
                  fmv.w.x      fa3, s11
                  rem          t3, gp, a4
                  srl          t2, s1, a5
                  sra          t6, s2, s6
                  mulhu        t3, t6, a7
                  fmax.s       ft1, ft10, fa5
                  remu         s4, ra, s9
                  fmv.w.x      fa7, s2
                  sltiu        a3, zero, -370
                  sltiu        s10, a0, 895
                  fclass.s     s9, fs4
                  srai         t6, a7, 21
                  fadd.s       fs5, fs5, fs0, rne
                  feq.s        t6, ft7, ft4
                  sltu         s5, s5, a4
                  fadd.s       ft5, fa3, fa1
                  sltu         t0, t0, s3
                  fcvt.wu.s    s0, fa4
                  feq.s        t6, fs0, ft1
                  mulhsu       zero, zero, s1
                  sub          a6, a3, t0
                  xori         t4, s3, 1090
                  sub          a6, a0, s0
                  slt          s9, a3, s5
                  fadd.s       fs5, fs7, fa5, rne
                  fmul.s       ft7, ft11, fa2
                  fcvt.s.wu    fs9, tp
                  or           s0, s7, s9
                  fadd.s       ft11, fs10, fa4, rne
                  mul          t6, s0, a2
                  ori          tp, s4, -291
                  remu         a1, s10, ra
                  and          t4, t5, t0
                  fcvt.w.s     s0, fa5
                  auipc        t3, 714469
                  slt          a4, a2, s7
                  feq.s        s8, fa6, fs5
                  or           s9, a3, s9
                  sltu         s9, t6, s10
                  rem          s3, t4, s0
                  fadd.s       fs4, fs8, fa3, rtz
                  fsgnjx.s     fs10, fs0, fa2
                  fle.s        a2, fs7, fs10
                  fdiv.s       ft11, ft4, ft8
                  and          s1, s0, tp
                  fmv.w.x      fs0, t1
                  fsgnjn.s     ft1, fa5, fs1
                  and          a0, tp, t6
                  fcvt.s.w     fa4, tp, rmm
                  remu         s0, s11, s7
                  fle.s        gp, ft3, fs6
                  flt.s        a0, ft0, fs3
                  fsgnj.s      ft8, fs3, fs11
                  fsgnjx.s     ft4, fs3, fa0
                  fmax.s       ft9, fs0, fa4
                  fcvt.s.w     ft5, t4, rup
                  divu         s0, s10, sp
                  add          t0, a1, tp
                  mulhsu       t4, s4, s7
                  feq.s        a4, fs2, ft6
                  srli         sp, gp, 24
                  slli         s4, sp, 5
                  mulh         s4, gp, zero
                  lui          ra, 1035254
                  fcvt.w.s     s0, ft0
                  fmv.w.x      ft1, s5
                  fsgnjn.s     ft7, ft7, fs1
                  fdiv.s       fa2, ft9, ft1, rtz
                  sll          gp, a6, s9
                  ori          tp, s11, 2019
                  auipc        t0, 713136
                  mulh         a3, s11, t4
                  sll          a5, t3, s4
                  xori         s7, a7, 520
                  fsub.s       fa5, fa7, fa2
                  fle.s        a0, ft1, ft7
                  sra          ra, s11, t0
                  mulhsu       t6, ra, tp
                  ori          s6, a0, 966
                  srl          s0, a0, a7
                  fadd.s       fs4, fs0, fs4
                  fcvt.w.s     t0, fa7, rdn
                  sra          t4, a2, t1
                  slt          s1, s11, a7
                  fclass.s     s9, ft5
                  fcvt.s.w     fa1, s8, rtz
                  fmv.w.x      ft5, zero
                  sra          s6, t0, s6
                  fcvt.s.wu    ft6, s6
                  fcvt.wu.s    s0, fa1, rmm
                  xori         s7, a6, 610
                  or           s8, zero, a6
                  andi         s1, s3, 1880
                  fmax.s       ft7, fs4, fa3
                  sub          s1, s1, s3
                  sub          t2, s0, t0
                  rem          s5, t1, a2
                  xor          s9, a2, ra
                  lui          s1, 874306
                  fdiv.s       fs10, fs1, ft6, rup
                  fsqrt.s      ft2, ft11, rtz
                  fsub.s       fs0, ft9, ft6, rne
                  fmin.s       ft6, fa6, fa1
                  flt.s        s7, fa0, fs10
                  lui          a1, 688347
                  divu         s1, a0, s7
                  mulhu        a7, s1, a3
                  fcvt.wu.s    s10, ft10, rmm
                  rem          s3, t1, s5
                  addi         s11, a0, -1630
                  fclass.s     s8, fa6
                  mulhsu       s1, s3, s5
                  slli         s1, zero, 23
                  fcvt.wu.s    a5, fs0
                  fsgnjx.s     fs2, fs9, ft8
                  fmin.s       fs7, fa2, ft6
                  or           s0, s8, t2
                  fcvt.s.wu    ft2, tp, rdn
                  and          s0, s3, s2
                  srli         gp, t1, 27
                  feq.s        a4, fa7, fs6
                  xor          sp, a6, tp
                  mulhsu       t3, t2, s11
                  and          a5, t6, a3
                  rem          a7, t6, a7
                  fdiv.s       ft4, ft5, fs4
                  div          sp, a4, a1
                  srai         a2, t3, 7
                  srai         t3, a4, 15
                  mulh         a4, t4, a1
                  sll          a3, s4, gp
                  fsgnjx.s     fa5, fa7, ft3
                  fcvt.s.wu    ft5, s2, rup
                  fadd.s       fs8, fa4, fs4
                  fsgnj.s      fa1, fs1, fs5
                  auipc        a4, 13225
                  slli         s8, a3, 22
                  fmin.s       ft4, ft2, fs5
                  fcvt.s.wu    fs7, t1
                  mul          zero, t0, s6
                  and          t2, t1, s5
                  fsgnj.s      fs5, ft7, ft0
                  fmul.s       ft5, fs9, fs11
                  mulhsu       t6, t2, s3
                  mulhu        s5, t6, t6
                  fdiv.s       fs6, fa1, fa7, rtz
                  fle.s        t6, fs6, fa2
                  addi         a7, s9, 461
                  mulh         a2, ra, s3
                  fmv.x.w      t0, ft9
                  div          s10, s6, zero
                  sub          t0, t0, t6
                  sub          a1, t2, gp
                  fmv.w.x      fs11, s1
                  sltu         a7, a6, a3
                  slt          s11, sp, a3
                  sltu         tp, t5, t0
                  nop
                  fcvt.s.w     ft5, a3, rtz
                  fcvt.wu.s    sp, ft1
                  lui          s11, 72528
                  ori          t3, a4, 22
                  and          s9, s10, a5
                  and          s6, t6, t1
                  sltu         a0, t5, tp
                  fcvt.s.w     fs4, tp
                  remu         s4, s6, s8
                  sltu         a5, s3, s6
                  nop
                  auipc        a1, 328843
                  rem          s1, a6, t4
                  srli         t0, sp, 23
                  slti         t2, a1, 1986
                  fcvt.w.s     s5, fs7
                  and          a6, t5, a0
                  and          zero, t3, tp
                  xori         sp, t3, -861
                  fsqrt.s      fs10, fa0
                  fcvt.w.s     zero, fa4
                  auipc        t2, 235172
                  addi         a3, s4, -503
                  fcvt.wu.s    t3, ft6, rne
                  fsub.s       ft9, ft4, fs0, rmm
                  add          a7, gp, gp
                  divu         s7, s0, t4
                  add          s6, s8, zero
                  fsub.s       ft0, fs3, ft11, rne
                  addi         s7, gp, 1755
                  fmul.s       ft3, fa4, fs5
                  sra          zero, s9, t3
                  fmv.x.w      a6, ft6
                  fadd.s       ft10, ft4, fs10, rmm
                  sra          a3, t4, s8
                  xori         zero, sp, -1194
                  nop
                  fcvt.s.w     fs7, t3
                  fsqrt.s      fs2, ft6
                  remu         s6, t2, t5
                  divu         a7, sp, gp
                  fsqrt.s      fa4, ft4
                  sra          a4, a5, t6
                  lui          s4, 962619
                  fsgnj.s      fs7, ft3, ft5
                  remu         t4, s11, a2
                  fcvt.w.s     s5, ft0, rmm
                  feq.s        s11, fs7, fa4
                  fcvt.s.w     ft6, tp, rup
                  fsub.s       ft0, ft4, ft3
                  mulhu        s3, s11, tp
                  fmin.s       fa2, fa3, fs1
                  fle.s        s8, fs10, ft6
                  divu         s10, a2, s11
                  sub          a2, a2, t3
                  and          t2, t2, a6
                  fle.s        t4, fa6, fs5
                  fsub.s       ft7, ft2, fa3
                  divu         t2, s8, s10
                  flt.s        s7, ft2, fa0
                  rem          a7, t3, s11
                  fmax.s       fa6, fa1, fa5
                  andi         t2, a4, 222
                  flt.s        a6, fa3, fs7
                  fclass.s     s10, ft3
                  feq.s        s5, ft9, fa4
                  addi         s1, a4, 2030
                  fadd.s       fs0, fs5, ft6, rtz
                  fdiv.s       ft3, fa7, fs6
                  slti         ra, a4, 21
                  divu         a3, a6, s0
                  fmv.w.x      ft4, tp
                  fmul.s       fs6, fa4, fa1, rmm
                  nop
                  fcvt.s.wu    ft11, a5
                  fclass.s     a0, fa1
                  auipc        s5, 745417
                  div          s5, s0, s4
                  flt.s        s3, fs4, fa4
                  remu         t0, a7, a5
                  xor          a1, s3, tp
                  remu         a2, s8, a2
                  fmv.x.w      s3, ft1
                  divu         s9, s0, a2
                  nop
                  or           a1, s10, s7
                  sltu         s11, gp, s11
                  fclass.s     a4, fs4
                  fmv.w.x      ft7, gp
                  fcvt.wu.s    s11, fs4
                  srli         s11, s8, 26
                  srai         a5, a5, 25
                  andi         zero, s6, 1776
                  mulhsu       tp, t6, t0
                  andi         s4, s5, 1951
                  sra          t0, t1, t3
                  fcvt.w.s     a0, fa4, rdn
                  srli         ra, t5, 27
                  fmv.w.x      fa7, s8
                  xor          sp, a5, a0
                  or           s4, zero, a0
                  rem          ra, a6, sp
                  nop
                  fcvt.s.wu    fs9, zero, rtz
                  fcvt.s.wu    fa3, a2
                  srli         a0, t5, 0
                  div          s6, t5, a5
                  fsgnjx.s     fa5, fs11, fs3
                  fmv.x.w      t6, ft5
                  fsqrt.s      ft7, fa7, rup
                  fsqrt.s      ft1, fs6
                  fmin.s       fs4, ft0, fs2
                  sll          t3, t2, s11
                  srl          s7, s3, s2
                  fcvt.s.w     ft11, a5, rup
                  and          gp, t5, s2
                  sltiu        tp, a4, -1269
                  xor          s4, a1, t6
                  srai         a4, tp, 3
                  fmv.w.x      ft4, a5
                  fsqrt.s      ft5, ft0
                  feq.s        a5, fs6, ft8
                  addi         t6, s8, 1798
                  slti         zero, s0, -1983
                  or           s8, a6, s9
                  fmul.s       fs3, ft1, ft0
                  fle.s        gp, fa5, ft9
                  xor          gp, t1, s8
                  srl          tp, t2, s5
                  fcvt.s.w     fa2, s0
                  or           zero, a5, t3
                  divu         tp, a0, s9
                  fclass.s     s1, fa4
                  sltiu        t2, t3, 1663
                  srli         a2, a0, 26
                  auipc        t0, 572299
                  srai         a7, s8, 4
                  addi         s11, s0, -1647
                  mulh         t3, s6, a6
                  fsqrt.s      fs1, fs10, rdn
                  div          s10, s5, t1
                  slli         s5, a7, 15
                  ori          t3, ra, 1050
                  fadd.s       ft1, ft1, fs4
                  mulhu        t3, sp, ra
                  srli         t2, sp, 18
                  xor          a7, s10, a5
                  fsgnjx.s     fs7, ft9, ft1
                  remu         zero, t3, s1
                  fmv.w.x      fa1, a4
                  fclass.s     ra, fs3
                  xori         t4, s1, 1450
                  fmul.s       fa4, ft3, ft8
                  sltiu        t4, gp, -845
                  add          a7, a2, s6
                  sltu         a1, gp, t6
                  srl          tp, ra, s1
                  mulhu        s7, s9, t5
                  fmax.s       ft9, fa6, fa2
                  sltu         ra, sp, a5
                  xori         s1, s7, -417
                  fmax.s       ft1, fs6, fa6
                  fsgnjx.s     fa0, ft9, fs2
                  fsgnjx.s     ft11, fa1, fs10
                  fmin.s       fa0, ft11, fa1
                  fmv.x.w      t0, ft11
                  andi         a1, s0, 397
                  sub          s1, s11, s9
                  mulhu        s3, s10, t0
                  feq.s        a6, ft7, ft0
                  or           a2, a2, s0
                  mulhu        s10, t2, t2
                  fcvt.s.w     fs9, sp, rup
                  mulhu        tp, s5, t6
                  fclass.s     s0, fs2
                  slti         a3, s1, -1014
                  fcvt.s.w     fs7, s7, rup
                  srli         a3, s3, 21
                  srai         t6, zero, 14
                  slt          t2, zero, gp
                  slli         sp, t3, 19
                  addi         a4, t6, -1184
                  sltiu        zero, a2, 770
                  fclass.s     a2, ft3
                  fcvt.wu.s    a1, ft2
                  ori          t4, s8, -270
                  fsqrt.s      fa1, ft10, rmm
                  rem          t2, t6, t1
                  sltiu        a5, a3, -805
                  ori          t0, sp, -1945
                  fmul.s       ft2, fa7, fs0, rup
                  fdiv.s       ft5, fa4, fs4, rdn
                  fmax.s       fs10, fs6, fs8
                  andi         tp, ra, 826
                  fadd.s       ft6, fs5, fa6, rup
                  sub          t0, a5, s10
                  sltiu        s10, a2, -1774
                  and          s3, a7, gp
                  fcvt.s.wu    fs5, sp
                  xor          a1, a4, a7
                  divu         tp, s5, t3
                  slt          s4, a7, s5
                  and          t6, a0, s0
                  or           t4, a4, tp
                  rem          s5, s7, s4
                  nop
                  mulhu        s5, s7, s10
                  fcvt.w.s     t2, fa5, rmm
                  addi         t3, t1, -781
                  mulh         s9, t6, a6
                  flt.s        s4, ft8, fa5
                  fsgnjx.s     fs0, ft0, ft5
                  fmv.x.w      s3, fs5
                  sltiu        t6, a2, -1260
                  fadd.s       fs6, ft7, ft5, rne
                  add          t3, a4, s5
                  nop
                  mul          tp, a7, s0
                  fcvt.wu.s    zero, fs6
                  flt.s        t0, fa5, ft2
                  srai         ra, s1, 9
                  slti         s11, a5, 879
                  nop
                  fcvt.s.wu    fs11, a0, rdn
                  fmul.s       fs9, ft3, ft6
                  ori          s11, s4, -829
                  xor          gp, t0, ra
                  srai         a1, s11, 26
                  flt.s        s5, fa3, ft10
                  srl          s7, sp, a2
                  sll          s10, s5, s11
                  remu         s0, t2, s7
                  mulh         t3, a4, s3
                  auipc        sp, 267837
                  ori          a0, s7, 1781
                  fsub.s       ft4, fa3, fa3
                  mulhsu       s0, zero, sp
                  ori          a7, a3, 992
                  fadd.s       fs2, fs6, ft10
                  add          t4, s5, a5
                  fmv.x.w      t0, fs10
                  sltu         s10, a6, s6
                  sltu         t4, s11, s4
                  lui          a3, 465078
                  rem          a5, a4, t1
                  fsqrt.s      ft10, fa5
                  srai         a5, t1, 13
                  mulhu        s11, tp, zero
                  or           s1, s0, a3
                  or           sp, s9, s8
                  fclass.s     s4, ft0
                  srai         sp, a7, 1
                  fcvt.w.s     a4, ft10, rne
                  fsgnjn.s     fa7, ft8, ft4
                  xor          sp, s6, s6
                  andi         gp, s5, 185
                  add          a7, s3, t6
                  mul          s7, s6, s10
                  slli         s5, a7, 18
                  fmv.w.x      fa3, a3
                  fcvt.s.w     ft8, a6
                  div          a0, gp, a6
                  fcvt.s.wu    fa2, s7
                  addi         s1, s1, -910
                  srai         s1, s10, 13
                  andi         a2, s1, -1758
                  fcvt.w.s     s7, fa5
                  mul          a4, s7, s10
                  divu         t0, s4, s5
                  fclass.s     s3, fs10
                  fcvt.wu.s    s9, fa1
                  remu         gp, t0, zero
                  remu         s4, t0, s2
                  add          a0, s6, s2
                  fsub.s       fa1, ft1, fs9, rmm
                  sltu         a3, a4, zero
                  sub          s5, a2, s2
                  srli         t6, s1, 24
                  mul          zero, t5, s10
                  mulhsu       s8, s6, s10
                  div          a4, t2, a1
                  fsub.s       fs8, ft8, ft0, rtz
                  remu         gp, t6, a1
                  remu         s5, s11, t0
                  fsgnj.s      ft7, fs8, fa4
                  fsgnj.s      ft4, fa7, fa7
                  or           s5, s9, a2
                  fsgnjn.s     fa5, fa1, fs10
                  mulhsu       a6, a1, a2
                  add          t3, a0, t6
                  mulhu        s7, a6, s8
                  divu         gp, a2, s8
                  andi         sp, ra, -1815
                  feq.s        s9, ft8, fs5
                  xori         ra, t2, -1596
                  srli         a5, t2, 31
                  sra          s7, s1, a5
                  mulhsu       t3, t5, t4
                  fcvt.wu.s    a1, ft9
                  fmv.x.w      a0, fs3
                  or           a7, a2, s4
                  lui          s4, 674416
                  mulh         s3, ra, s0
                  or           a6, gp, sp
                  fmul.s       fs1, fs6, fa3, rtz
                  fle.s        s7, fa6, fa2
                  div          a1, ra, t3
                  fmin.s       fa3, ft1, fs7
                  flt.s        a2, fs0, fa4
                  addi         s0, s6, -102
                  div          zero, a5, s10
                  sll          s9, t5, gp
                  slt          s3, a0, s4
                  fcvt.s.w     fs7, a4, rup
                  sltiu        s10, s9, 1903
                  fclass.s     t6, ft7
                  sll          zero, s1, s7
                  divu         t0, s5, a7
                  fcvt.wu.s    s0, fa6
                  xor          t4, sp, t0
                  auipc        t2, 800292
                  ori          s7, a0, -742
                  sra          sp, t3, s5
                  srl          a3, t4, s6
                  fsgnj.s      fs0, fa5, ft5
                  fsgnj.s      fs8, ft5, fs10
                  auipc        t3, 118357
                  mul          t4, ra, s8
                  mul          s0, t0, s1
                  fmv.w.x      fs5, s0
                  andi         sp, a6, 1726
                  fadd.s       ft8, fs0, fs8
                  andi         s1, t6, 96
                  srai         t3, s2, 30
                  sll          ra, s7, t3
                  fmax.s       fs5, ft7, fa2
                  feq.s        s0, fa7, fs0
                  fadd.s       fs7, fa1, ft5, rdn
                  and          a5, zero, t3
                  slt          t4, s2, s2
                  xor          s0, a3, s9
                  xor          t0, ra, sp
                  sltiu        s6, s1, -514
                  sltiu        s1, sp, -178
                  div          s6, t3, t6
                  rem          t4, a4, a1
                  fsgnjx.s     fs8, fs4, ft4
                  add          t0, a1, s0
                  sra          a7, t0, a7
                  fcvt.s.wu    fa2, t5, rdn
                  flt.s        s10, fs3, fs5
                  mul          s5, s10, a5
                  fcvt.wu.s    s5, fs9, rmm
                  divu         s4, a5, a0
                  fle.s        s7, fa1, fs1
                  div          ra, sp, a4
                  sra          t2, a2, s3
                  add          s1, s8, a5
                  feq.s        a7, ft4, fs4
                  addi         s1, s3, 648
                  slli         a0, s11, 19
                  fmax.s       fa2, fs4, fs6
                  srl          t3, t3, t1
                  slti         s7, ra, 1954
                  sll          gp, a4, t1
                  fmv.x.w      s3, fs10
                  mulh         a1, s8, a4
                  fclass.s     gp, ft9
                  slti         s3, t6, -1097
                  fmul.s       ft8, ft6, fs4, rtz
                  sltiu        a7, t5, -915
                  slti         a2, a5, 1442
                  slli         s5, t4, 12
                  and          t0, a4, s5
                  fcvt.s.wu    fs6, t1
                  fmv.x.w      a2, fs0
                  fmv.x.w      s8, fs11
                  fmul.s       fs3, ft11, fs2, rtz
                  fsgnj.s      fa7, fs11, fs6
                  fcvt.w.s     a1, fa0, rdn
                  slli         gp, s7, 15
                  add          s3, sp, ra
                  div          a3, s1, t5
                  xori         gp, s7, 1474
                  fcvt.wu.s    s0, ft6
                  slti         s7, a4, -1303
                  slti         t0, ra, -7
                  or           t2, s9, s4
                  andi         a7, s0, 44
                  fmax.s       ft5, fs10, fa3
                  div          s8, zero, sp
                  or           t0, s8, t0
                  lui          s11, 88096
                  fmul.s       ft5, ft3, ft11
                  fsgnj.s      fs0, ft2, fa3
                  divu         a7, sp, sp
                  andi         zero, gp, -901
                  sub          a1, gp, s3
                  sub          t2, s2, s1
                  xori         tp, s0, 1763
                  andi         s10, a6, 1405
                  srl          a6, a2, a5
                  mulhsu       sp, a2, t3
                  mulhu        zero, tp, s3
                  lui          t6, 21816
                  mulhu        s4, a0, a3
                  fle.s        s5, ft7, ft5
                  fcvt.w.s     sp, fs1
                  or           a5, a2, a1
                  mulhu        s3, s4, a2
                  srl          s3, s9, s3
                  fmul.s       fs4, fa7, fs3, rne
                  slt          a4, t1, a0
                  sll          s6, s4, zero
                  rem          a7, s6, s9
                  fmax.s       ft0, ft4, fs11
                  andi         t4, t2, -958
                  fsgnj.s      ft11, ft7, ft7
                  srai         s5, gp, 27
                  addi         a7, s8, -53
                  feq.s        t3, ft11, fs7
                  andi         s8, t6, 1706
                  mul          s7, t5, s1
                  slti         ra, a4, 81
                  fcvt.wu.s    t0, fa1
                  fadd.s       fs9, fa2, ft11
                  fsub.s       ft2, fa4, fs3
                  nop
                  rem          a3, s1, s7
                  mul          s11, s2, t6
                  fle.s        s1, fa6, ft4
                  lui          a3, 114345
                  fsub.s       ft0, fs10, fa0
                  fclass.s     zero, fs8
                  slli         ra, s10, 26
                  andi         a1, tp, -920
                  feq.s        t2, fs6, fa6
                  fmv.w.x      fs3, s6
                  divu         s10, s1, a1
                  fsgnj.s      ft7, fs6, ft4
                  lui          zero, 521532
                  mulhu        tp, s4, s3
                  nop
                  fmin.s       fs4, ft11, fa0
                  andi         ra, s4, 202
                  sltiu        a7, t3, 550
                  slti         zero, t2, 1249
                  sltiu        s9, s11, 1242
                  divu         t3, a6, zero
                  srli         s5, t6, 11
                  fmax.s       ft1, fa0, fs10
                  divu         a4, s1, t1
                  andi         s9, s5, -414
                  fmax.s       ft6, fs5, fa5
                  fcvt.s.w     fs0, a0, rne
                  fcvt.w.s     tp, ft0
                  slt          s9, s10, a7
                  add          a7, s3, a1
                  flt.s        a3, fs2, fs11
                  rem          a4, zero, a4
                  fmv.w.x      fs9, a7
                  fdiv.s       fa3, fs2, ft2, rne
                  fadd.s       fs8, fs1, ft7
                  srli         zero, a7, 24
                  fle.s        s8, ft5, fa6
                  srli         a2, s10, 20
                  rem          t2, s5, t6
                  srli         t3, a0, 26
                  feq.s        zero, ft4, ft2
                  addi         t3, s5, 1457
                  fadd.s       fa0, fs5, ft1, rmm
                  divu         a6, t6, s10
                  or           t3, t1, s8
                  fmul.s       fa3, fa1, fs7, rne
                  mul          a2, s6, sp
                  flt.s        s1, ft0, ft5
                  fsgnj.s      fs6, fs8, fa1
                  fmv.w.x      fa1, zero
                  mul          tp, t4, tp
                  fcvt.wu.s    a0, fs10, rmm
                  slli         t0, s8, 17
                  fcvt.s.w     fs3, s0, rdn
                  fsgnjn.s     fa1, fs0, ft6
                  xori         a2, t6, -315
                  divu         s1, s6, s10
                  fcvt.w.s     s3, ft11
                  fclass.s     s1, fs4
                  ori          s8, s6, 1938
                  auipc        a3, 622785
                  feq.s        s3, fs1, ft11
                  xor          s10, s7, s7
                  mul          ra, s10, s6
                  fcvt.s.w     ft7, s6
                  mul          s9, a4, t4
                  mulh         s7, s2, t5
                  div          s9, t2, s9
                  feq.s        s11, fa1, fa1
                  mulhsu       s10, s8, s3
                  fmv.w.x      ft9, t1
                  fadd.s       fs2, ft8, ft4, rtz
                  fsqrt.s      fs11, ft1
                  mulhsu       s9, t1, s11
                  or           s3, ra, a4
                  fmv.x.w      s7, fa7
                  fcvt.w.s     a0, fs1
                  fadd.s       ft5, ft5, fa3, rmm
                  xori         t6, a0, 1838
                  sltu         t4, a1, s0
                  auipc        s4, 942797
                  fdiv.s       ft2, fs4, ft7
                  flt.s        s8, fs9, ft9
                  slli         s10, a3, 27
                  mulhu        a5, a7, t5
                  fcvt.s.wu    fa0, a0, rup
                  rem          s8, s6, s1
                  slli         a4, s9, 14
                  mulh         a2, s9, s4
                  xor          a3, s9, s6
                  lui          a6, 1711
                  divu         t2, t1, t3
                  div          a4, s9, t4
                  sltu         t4, zero, a2
                  fmax.s       fa5, fs4, fs10
                  fle.s        sp, fa1, fs4
                  fle.s        a5, fs5, fs10
                  fmv.x.w      a4, fs5
                  sll          ra, gp, t0
                  slti         s6, a2, -556
                  fcvt.wu.s    s3, fs8, rmm
                  sll          a3, t5, gp
                  mulh         s9, s6, s8
                  xor          s3, a0, t2
                  div          s9, s9, tp
                  fadd.s       fa3, ft11, fa1
                  fle.s        s3, fs1, fa0
                  fmv.w.x      fs10, s8
                  fdiv.s       fs8, fa2, ft10, rmm
                  srai         t6, t3, 15
                  fmin.s       fa4, ft8, fs11
                  fmul.s       ft7, fa3, ft3
                  fsgnj.s      fs2, ft11, fs2
                  fmv.x.w      a4, ft11
                  and          t4, t6, zero
                  fmul.s       fa4, fs0, fa4
                  andi         t2, t3, 1143
                  ori          s8, t0, -1603
                  sll          gp, s10, a5
                  addi         gp, a7, -183
                  mulhu        a0, t3, t5
                  fmax.s       fa2, fa2, fs9
                  fmax.s       fa2, fs8, ft7
                  fsgnjx.s     fs10, fa4, fs2
                  fmul.s       fa1, ft0, fa5
                  rem          s0, s11, sp
                  fmul.s       fs8, ft2, ft0, rne
                  div          sp, s9, a5
                  fle.s        t0, fa5, fs9
                  fmul.s       fs1, fs4, fs3, rtz
                  slli         s9, s10, 28
                  fdiv.s       fa3, fs2, fs9
                  or           s1, a5, gp
                  fadd.s       fs11, fa5, fa0, rtz
                  or           s10, a5, a6
                  srai         t4, a4, 16
                  lui          a6, 572665
                  mulh         s0, s5, s7
                  divu         a1, t4, s3
                  mulhu        a2, s9, s8
                  sra          gp, s11, s3
                  sll          s10, t2, s4
                  fsgnjn.s     fs8, fs7, fs6
                  remu         t6, s11, t3
                  fmul.s       ft6, fs2, fa7, rmm
                  fsgnj.s      ft3, ft10, ft6
                  srl          a5, t1, a4
                  feq.s        s3, fa1, ft9
                  srli         t3, a7, 16
                  xor          s6, s11, a6
                  sll          s7, a5, tp
                  srli         zero, s10, 3
                  addi         a2, t2, 1676
                  fclass.s     s8, fa4
                  fcvt.wu.s    s8, fs5, rmm
                  add          a5, t5, t6
                  slti         s11, a7, -1716
                  slti         a1, a5, -1704
                  srai         sp, ra, 23
                  fcvt.wu.s    s11, fs5, rne
                  fcvt.s.wu    ft8, s8, rup
                  fsgnjn.s     ft6, ft9, fa7
                  fcvt.s.w     ft3, t5, rdn
                  sub          s1, s7, a3
                  andi         gp, s11, -213
                  fmul.s       ft8, fa2, fa0, rtz
                  fsub.s       fa4, fs9, fa5, rup
                  remu         a2, s4, s8
                  sltiu        s7, gp, -1524
                  rem          s9, s4, s10
                  mulhu        s9, a3, a2
                  fmv.x.w      t0, ft5
                  fsgnjn.s     fs0, ft0, fs7
                  auipc        t3, 230608
                  fclass.s     s8, fa6
                  fdiv.s       fa7, fa2, ft11
                  srl          s6, s11, s9
                  slti         gp, s2, -88
                  remu         s1, a5, s11
                  sra          s8, s3, zero
                  auipc        a3, 150038
                  fsgnjx.s     ft4, fa3, fs10
                  srli         s4, s11, 28
                  fmax.s       fa7, fs0, ft3
                  srai         a7, s11, 25
                  sub          s10, ra, a7
                  xor          s8, s4, t1
                  flt.s        a2, ft11, ft0
                  add          s3, a2, s7
                  or           s8, s3, s6
                  and          a5, s1, s5
                  lui          tp, 839046
                  fcvt.s.w     ft8, zero
                  sub          s7, sp, s4
                  sltiu        s5, t6, -1546
                  sll          s1, s9, a0
                  xori         sp, s10, 425
                  fsgnj.s      ft5, fa5, fs8
                  fsgnjx.s     fs3, fa3, fs3
                  fle.s        a7, ft7, fs2
                  fmul.s       ft10, fs3, ft3, rne
                  fcvt.s.w     fs3, s3, rdn
                  fsub.s       fs3, fs11, fs3
                  srl          s4, a5, s0
                  slti         ra, s2, 460
                  mulhu        a3, a6, t4
                  srl          a2, s3, a4
                  fdiv.s       fa7, ft6, fs3, rne
                  fclass.s     s4, fa2
                  fdiv.s       ft3, ft4, fs6, rmm
                  mulhu        s0, ra, a6
                  srai         a4, t6, 15
                  fmax.s       ft11, fa7, ft7
                  srai         t3, a7, 10
                  ori          gp, s4, -44
                  feq.s        a6, fs3, fs4
                  fmv.w.x      ft7, a1
                  remu         a5, a2, s9
                  nop
                  flt.s        s10, fs8, ft0
                  ori          s1, s8, -825
                  fsqrt.s      ft8, fs10
                  xor          t3, a3, s11
                  sll          t0, s9, a2
                  mulh         a1, a4, zero
                  slli         s10, t4, 6
                  fsub.s       fs5, fa4, fs6, rdn
                  fmv.x.w      s8, fs9
                  fadd.s       fs5, fa5, fs1, rup
                  fmv.w.x      fs11, s0
                  remu         a6, a0, a3
                  fsgnjx.s     fa5, fs4, fa6
                  fmin.s       fs10, fs7, fs8
                  fsub.s       fs10, ft4, fs6, rdn
                  rem          t0, t5, s10
                  fmv.x.w      a4, ft2
                  fcvt.s.w     ft1, s2
                  slt          s11, zero, a1
                  srai         s0, s2, 21
                  fsgnjx.s     ft7, ft3, fs10
                  fadd.s       fa4, fs11, fa7
                  sltu         s6, s3, a4
                  fle.s        sp, fs2, ft1
                  mul          t2, s7, t0
                  flt.s        a2, ft6, ft7
                  srai         s3, a5, 28
                  addi         t6, s5, 1316
                  andi         s5, ra, 1574
                  sll          a4, s6, t0
                  feq.s        a6, fs1, fa1
                  slt          zero, s3, s4
                  or           s1, t4, s10
                  mul          s3, t1, a5
                  add          tp, t3, s0
                  fmin.s       fa5, fs9, fa6
                  fcvt.s.wu    fa6, s2
                  ori          t2, a0, -1122
                  add          sp, a2, a2
                  fsqrt.s      fs0, fs3
                  rem          tp, s9, t2
                  mulhsu       sp, ra, s3
                  fadd.s       ft8, fs2, ft4, rdn
                  sll          zero, s4, gp
                  or           t3, zero, s4
                  fsgnj.s      fs11, fa1, fs1
                  fmul.s       fs11, fs0, fa5, rtz
                  fmv.x.w      s5, ft8
                  remu         t2, sp, t2
                  fcvt.w.s     s10, fs10, rup
                  sll          t3, t5, s0
                  fclass.s     t3, fs0
                  lui          s6, 741037
                  sub          s6, s9, t3
                  feq.s        gp, ft3, ft6
                  fclass.s     gp, ft2
                  flt.s        s8, fa0, fa1
                  fclass.s     s9, ft8
                  lui          a0, 990669
                  fsub.s       fs3, ft8, ft0, rne
                  fsgnjn.s     fs7, fa3, ft8
                  rem          s5, s2, s8
                  srai         s0, a2, 15
                  srli         s4, s8, 27
                  and          a6, a4, sp
                  remu         gp, t5, s11
                  nop
                  addi         t0, tp, 2021
                  srai         s10, gp, 7
                  fcvt.w.s     s10, fs7, rdn
                  mulh         s0, sp, a5
                  fadd.s       fs6, fs5, fs7
                  fmul.s       fs6, fs1, ft2
                  fmul.s       fa6, fs9, fa1
                  fdiv.s       fa5, ft8, fa5
                  fsgnj.s      fs1, fa5, fs10
                  andi         sp, s9, -79
                  fcvt.wu.s    t3, ft0
                  fcvt.s.wu    ft7, s0
                  sub          s9, s4, a4
                  flt.s        a7, fa6, fs10
                  fmv.x.w      tp, fs0
                  fmv.w.x      fs3, s0
                  addi         a1, t1, -1331
                  fadd.s       ft11, fs6, fs6
                  mulh         s0, s4, s0
                  fmin.s       fs8, ft0, ft7
                  fcvt.s.wu    ft3, s3
                  fcvt.s.w     ft5, s8
                  fsgnj.s      fa4, ft7, fs4
                  auipc        a3, 252798
                  flt.s        s7, fa5, fa7
                  xori         t4, a3, 1893
                  fcvt.w.s     ra, fa1
                  slt          zero, s2, ra
                  sltu         s8, s8, a6
                  div          s9, a4, a6
                  mulh         s0, s4, t0
                  fle.s        s1, ft4, fs11
                  fclass.s     a7, fa4
                  fle.s        a1, ft3, fa0
                  lui          s8, 946058
                  mulhsu       t6, t1, a2
                  sub          a1, a1, a5
                  divu         ra, t3, s6
                  fdiv.s       fa2, fa4, fs7
                  fcvt.w.s     s7, fa4
                  fmul.s       fs7, fa5, ft4
                  mulhsu       s3, s4, a3
                  srli         a6, a5, 2
                  srli         t4, s6, 4
                  sltiu        s3, t1, -458
                  lui          s8, 1035940
                  add          gp, s2, t2
                  addi         tp, s0, -1480
                  mulhsu       a2, t6, s7
                  srl          a5, s3, ra
                  fsgnjn.s     fs9, ft6, fa6
                  fcvt.w.s     a2, ft7, rtz
                  srai         s4, s6, 20
                  fsgnj.s      ft10, fs2, fa1
                  fadd.s       fs9, fs1, ft3, rdn
                  ori          s11, s8, 1451
                  feq.s        s5, ft1, fs9
                  fsub.s       fa7, fa7, fa0, rne
                  fmin.s       ft4, fs3, ft5
                  fsgnjx.s     fa5, fs5, ft0
                  fsub.s       fa4, ft2, fs9
                  fle.s        a2, fs2, fs1
                  div          a0, gp, s11
                  mulhsu       a2, a0, a3
                  fclass.s     t3, fa7
                  feq.s        a1, fs6, fs2
                  xor          s4, s1, zero
                  ori          s6, a2, 1896
                  sltiu        t6, s0, 1393
                  sub          a6, s10, t6
                  fcvt.w.s     s11, ft8, rne
                  feq.s        ra, fa0, ft11
                  ori          zero, a0, 312
                  mulh         a3, s9, s11
                  sra          t4, s1, tp
                  srl          tp, s11, tp
                  or           a1, s0, a5
                  or           a6, s5, a5
                  sltu         a2, a0, s9
                  flt.s        a3, ft7, ft1
                  fcvt.wu.s    a6, ft4
                  mulh         t3, t3, a7
                  divu         s5, t4, s6
                  fmin.s       fa1, ft10, ft0
                  sub          t3, s11, tp
                  fsqrt.s      ft3, fs7, rtz
                  xor          s9, s6, a2
                  fcvt.s.wu    ft4, a7
                  remu         a2, s10, a5
                  or           t0, a2, ra
                  fmax.s       fa4, fa0, fa2
                  rem          s0, a7, a6
                  fsqrt.s      fs6, fa1, rup
                  fcvt.s.wu    fs1, s1, rne
                  fmax.s       fs1, fs3, fa7
                  ori          s10, zero, -1210
                  remu         sp, s7, a0
                  or           t2, s11, a2
                  slt          s6, s8, ra
                  andi         zero, t6, -890
                  add          s6, a1, s0
                  fsqrt.s      fa1, fs2, rdn
                  fsqrt.s      ft8, ft3
                  fle.s        gp, ft6, fs5
                  mul          s0, a3, sp
                  rem          s1, s2, a4
                  fsgnjx.s     fa1, ft2, fs4
                  lui          ra, 988873
                  mulhu        sp, a6, a2
                  sltu         gp, a4, a2
                  fmv.x.w      ra, ft2
                  div          ra, t2, s0
                  fcvt.s.wu    fs7, a3
                  divu         s1, t2, t1
                  fmul.s       fa3, fs5, fs5, rne
                  xor          a6, ra, s7
                  mulhu        a6, t1, s6
                  add          a6, a2, a6
                  srli         a4, a4, 14
                  sll          a4, s0, t0
                  remu         s11, s9, a7
                  srl          s1, s3, s3
                  feq.s        t4, fa6, fs3
                  fmul.s       ft5, fa3, fs7, rne
                  lui          s1, 362013
                  fsgnjn.s     ft10, ft10, fa7
                  fle.s        s0, ft9, fa3
                  divu         s9, s3, a2
                  fdiv.s       fa6, fs5, ft5, rmm
                  fcvt.wu.s    a0, ft1, rne
                  xori         a7, s9, -1653
                  add          tp, a1, t0
                  and          s6, s1, tp
                  divu         t2, t0, s9
                  sll          a1, a5, a7
                  addi         t3, s11, -1931
                  slti         a7, a2, -742
                  fsqrt.s      fs1, fs5
                  mulhsu       ra, s10, t0
                  sltu         s11, s8, s3
                  xor          s7, a3, s9
                  fsgnjx.s     ft5, fs2, fa3
                  mulh         s0, s2, s9
                  fcvt.s.wu    fa4, s5
                  slti         s10, s4, -1343
                  fle.s        s4, fa6, fa5
                  fcvt.s.wu    ft7, s7
                  remu         s9, s4, a1
                  fle.s        a6, ft11, ft8
                  div          a6, t1, s1
                  and          s6, a0, a2
                  fcvt.wu.s    a2, fs10
                  fclass.s     t4, fs7
                  fadd.s       ft10, ft8, ft4, rdn
                  xor          s11, a7, tp
                  add          t3, zero, t0
                  xor          t2, s3, a3
                  fmin.s       ft2, fa4, fa1
                  and          s8, s5, a1
                  feq.s        a4, fs7, fs0
                  fsgnjn.s     fa1, fs7, fs11
                  fsgnjx.s     fs10, fa5, fs3
                  sll          a5, gp, s5
                  sltu         s9, t5, t6
                  fle.s        s5, ft4, ft4
                  add          s11, a0, tp
                  fadd.s       ft10, fa2, fs9, rne
                  fcvt.wu.s    ra, fa6
                  auipc        s10, 577091
                  or           a5, a0, t6
                  lui          t3, 738330
                  srli         gp, gp, 26
                  srai         zero, s5, 25
                  fmin.s       fa7, fs9, ft6
                  fsub.s       fa6, ft3, fs6, rtz
                  fcvt.wu.s    s11, fs10
                  mul          s10, s3, t1
                  mul          a2, t5, s2
                  fle.s        t2, fa1, ft4
                  fsgnjx.s     fa2, fs0, fa6
                  auipc        t0, 738907
                  and          a6, a2, gp
                  divu         a4, a3, sp
                  fcvt.s.w     ft7, a3
                  fadd.s       fs5, fs5, fs6, rtz
                  div          sp, t5, s11
                  andi         t6, s6, 2003
                  div          s3, a7, s6
                  fmv.x.w      t4, ft6
                  fsqrt.s      fa5, fs4, rtz
                  fdiv.s       fa2, fs10, ft2, rtz
                  fmul.s       fa1, ft3, ft8, rdn
                  fcvt.s.wu    ft4, a7, rup
                  slti         t3, s9, -1135
                  lui          s5, 1005161
                  sll          a5, s6, s8
                  fsgnj.s      fs9, ft6, ft6
                  flt.s        a3, fs4, fa0
                  flt.s        ra, fs2, ft2
                  sub          a0, t5, t2
                  sub          a0, s8, sp
                  fsgnj.s      fs8, ft8, fa4
                  sra          t2, t3, t6
                  xor          t6, t1, a1
                  fsub.s       fs6, fs5, ft4, rmm
                  rem          a3, t4, t5
                  slli         t3, a0, 31
                  xor          s10, s4, s1
                  mulhu        t4, zero, s7
                  divu         s4, t1, t6
                  fsgnj.s      fs10, ft9, ft7
                  auipc        s0, 282568
                  andi         a7, s11, 972
                  fmax.s       fs4, fs8, ft2
                  fcvt.wu.s    ra, fa6
                  div          t2, a6, a6
                  or           a6, a3, sp
                  fsgnj.s      ft4, fs4, fa3
                  fsgnj.s      fa4, fa4, fs0
                  fcvt.wu.s    t4, fa3, rmm
                  mul          a1, zero, t3
                  slti         s6, s11, 274
                  mulhu        a0, a2, t2
                  fmax.s       fa7, fs6, fs2
                  and          s1, s4, ra
                  slt          a1, t2, a5
                  fle.s        gp, ft11, ft10
                  fdiv.s       ft1, ft2, ft2, rmm
                  fadd.s       fa3, fs5, fa2
                  xor          zero, s3, s1
                  fadd.s       ft5, fa3, fs5
                  sltiu        gp, t5, -1449
                  fmul.s       fs3, ft2, ft4
                  fsub.s       fa2, fs10, fs6
                  nop
                  mulhu        a0, t2, zero
                  divu         t4, t2, t4
                  fmv.x.w      s3, fs2
                  slli         s10, t2, 6
                  mulhsu       s11, gp, s0
                  slti         t2, a2, -1926
                  andi         a1, s7, -1813
                  flt.s        t6, ft8, fa0
                  fcvt.s.wu    fs9, t3, rtz
                  srai         s3, s11, 16
                  ori          s8, s4, -1875
                  fmul.s       fa1, fa3, ft8
                  fmv.x.w      a7, ft11
                  fcvt.s.w     fs4, a1
                  fmv.w.x      ft6, s11
                  sub          tp, t6, gp
                  srl          a6, t6, s4
                  sub          s4, a6, s2
                  slt          s0, s0, zero
                  flt.s        t4, fa1, fs11
                  rem          a0, t3, a4
                  lui          s1, 351399
                  sltu         s3, s5, a7
                  nop
                  mulhu        t4, t6, gp
                  xor          t6, s0, s9
                  fcvt.s.wu    ft9, a4
                  and          t6, a6, s5
                  fmul.s       ft11, ft1, ft4
                  fdiv.s       fa3, ft9, fa1
                  fdiv.s       ft9, ft7, ft10, rdn
                  fsgnjn.s     fs7, ft5, ft3
                  fsub.s       fs2, fa3, fs11, rup
                  fmv.x.w      a4, ft5
                  add          s9, t0, t5
                  div          t6, a5, t2
                  fmv.x.w      t3, fs6
                  srli         s0, t4, 18
                  sltiu        t3, a1, 841
                  fcvt.s.w     fs2, t1, rdn
                  add          tp, s0, s10
                  divu         s1, t4, s4
                  srl          t4, s4, t5
                  fsgnjn.s     fs6, ft10, ft11
                  srai         s5, a3, 5
                  sltiu        a7, a4, -1072
                  fcvt.s.w     fs7, a1, rne
                  fsgnjx.s     ft3, fs2, fs3
                  fadd.s       fs2, ft0, fs2, rmm
                  sub          a3, tp, a1
                  fmv.w.x      fs2, a6
                  fsgnjn.s     fs11, fa7, ft0
                  fmv.x.w      t6, fs0
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
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_2:
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_3:
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_4:
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_5:
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_6:
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_7:
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_8:
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_9:
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_10:
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_11:
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_12:
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_13:
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_14:
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_15:
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
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
                  addi x6, x6, -4
                  sw  x18, (x6)
                  add x18, x6, zero
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
                  add x6, x18, zero
                  csrr x24, 0x341 # MEPC
                  csrr x24, 0x342 # MCAUSE
                  li x9, 0x3 # BREAKPOINT
                  beq x24, x9, ebreak_handler
                  li x9, 0x8 # ECALL_UMODE
                  beq x24, x9, ecall_handler
                  li x9, 0x9 # ECALL_SMODE
                  beq x24, x9, ecall_handler
                  li x9, 0xb # ECALL_MMODE
                  beq x24, x9, ecall_handler
                  li x9, 0x1
                  beq x24, x9, instr_fault_handler
                  li x9, 0x5
                  beq x24, x9, load_fault_handler
                  li x9, 0x7
                  beq x24, x9, store_fault_handler
                  li x9, 0xc
                  beq x24, x9, pt_fault_handler
                  li x9, 0xd
                  beq x24, x9, pt_fault_handler
                  li x9, 0xf
                  beq x24, x9, pt_fault_handler
                  li x9, 0x2 # ILLEGAL_INSTRUCTION
                  beq x24, x9, illegal_instr_handler
                  csrr x9, 0x343 # MTVAL
                  1: la x30, test_done
                  jalr x1, x30, 0

ecall_handler:    
                  la x24, _start
                  sw x0, 0(x24)
                  sw x1, 4(x24)
                  sw x2, 8(x24)
                  sw x3, 12(x24)
                  sw x4, 16(x24)
                  sw x5, 20(x24)
                  sw x6, 24(x24)
                  sw x7, 28(x24)
                  sw x8, 32(x24)
                  sw x9, 36(x24)
                  sw x10, 40(x24)
                  sw x11, 44(x24)
                  sw x12, 48(x24)
                  sw x13, 52(x24)
                  sw x14, 56(x24)
                  sw x15, 60(x24)
                  sw x16, 64(x24)
                  sw x17, 68(x24)
                  sw x18, 72(x24)
                  sw x19, 76(x24)
                  sw x20, 80(x24)
                  sw x21, 84(x24)
                  sw x22, 88(x24)
                  sw x23, 92(x24)
                  sw x24, 96(x24)
                  sw x25, 100(x24)
                  sw x26, 104(x24)
                  sw x27, 108(x24)
                  sw x28, 112(x24)
                  sw x29, 116(x24)
                  sw x30, 120(x24)
                  sw x31, 124(x24)
                  la x30, write_tohost
                  jalr x0, x30, 0

instr_fault_handler:
                  add x18, x6, zero
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
                  add x6, x18, zero
                  lw  x18, (x6)
                  addi x6, x6, 4
                  mret

load_fault_handler:
                  add x18, x6, zero
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
                  add x6, x18, zero
                  lw  x18, (x6)
                  addi x6, x6, 4
                  mret

store_fault_handler:
                  add x18, x6, zero
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
                  add x6, x18, zero
                  lw  x18, (x6)
                  addi x6, x6, 4
                  mret

ebreak_handler:   
                  csrr  x24, 0x341
                  addi  x24, x24, 4
                  csrw  0x341, x24
                  add x18, x6, zero
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
                  add x6, x18, zero
                  lw  x18, (x6)
                  addi x6, x6, 4
                  mret

illegal_instr_handler:
                  csrr  x24, 0x341
                  addi  x24, x24, 4
                  csrw  0x341, x24
                  add x18, x6, zero
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
                  add x6, x18, zero
                  lw  x18, (x6)
                  addi x6, x6, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x24, 0x300 # MSTATUS;
                  csrr  x24, 0x304 # MIE;
                  csrr  x24, 0x344 # MIP;
                  csrrc x24, 0x344, x24 # MIP;
                  add x18, x6, zero
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
                  add x6, x18, zero
                  lw  x18, (x6)
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
