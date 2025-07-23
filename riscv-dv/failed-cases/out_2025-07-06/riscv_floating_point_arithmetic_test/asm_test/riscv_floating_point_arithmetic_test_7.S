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
                  li x23, 0x40001120
                  csrw 0x301, x23
kernel_sp:        
                  la x4, kernel_stack_end

trap_vec_init:    
                  la x23, mtvec_handler
                  ori x23, x23, 0
                  csrw 0x305, x23 # MTVEC

mepc_setup:       
                  la x23, init
                  csrw 0x341, x23

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x23, 0x3800
                  csrw 0x300, x23 # MSTATUS
                  li x23, 0x0
                  csrw 0x304, x23 # MIE
                  mret
init:             
                  li x23, 1566115
                  fmv.w.x f0, x23
                  li x23, 765741
                  fmv.w.x f1, x23
                  li x23, 2147483648
                  fmv.w.x f2, x23
                  li x23, 4286578687
                  fmv.w.x f3, x23
                  li x23, 2143289344
                  fmv.w.x f4, x23
                  li x23, 2139095039
                  fmv.w.x f5, x23
                  li x23, 2150309731
                  fmv.w.x f6, x23
                  li x23, 2147483648
                  fmv.w.x f7, x23
                  li x23, 1356065269
                  fmv.w.x f8, x23
                  li x23, 330591542
                  fmv.w.x f9, x23
                  li x23, 4286578687
                  fmv.w.x f10, x23
                  li x23, 2139095041
                  fmv.w.x f11, x23
                  li x23, 2139095040
                  fmv.w.x f12, x23
                  li x23, 2139095040
                  fmv.w.x f13, x23
                  li x23, 2866052
                  fmv.w.x f14, x23
                  li x23, 0
                  fmv.w.x f15, x23
                  li x23, 2155127702
                  fmv.w.x f16, x23
                  li x23, 2139095040
                  fmv.w.x f17, x23
                  li x23, 6095291
                  fmv.w.x f18, x23
                  li x23, 4286578687
                  fmv.w.x f19, x23
                  li x23, 2139095040
                  fmv.w.x f20, x23
                  li x23, 4286578687
                  fmv.w.x f21, x23
                  li x23, 3768794249
                  fmv.w.x f22, x23
                  li x23, 2143289344
                  fmv.w.x f23, x23
                  li x23, 2139095041
                  fmv.w.x f24, x23
                  li x23, 2147483648
                  fmv.w.x f25, x23
                  li x23, 0
                  fmv.w.x f26, x23
                  li x23, 1589345250
                  fmv.w.x f27, x23
                  li x23, 4286578687
                  fmv.w.x f28, x23
                  li x23, 2153028985
                  fmv.w.x f29, x23
                  li x23, 0
                  fmv.w.x f30, x23
                  li x23, 2155029396
                  fmv.w.x f31, x23
                  fsrmi 1
                  li x0, 0x4
                  li x1, 0x0
                  li x2, 0x80000000
                  li x3, 0xf9c9a9a1
                  li x5, 0x80000000
                  li x6, 0x2
                  li x7, 0x0
                  li x8, 0x80000000
                  li x9, 0x7
                  li x10, 0x8
                  li x11, 0xc
                  li x13, 0x80000000
                  li x14, 0x80000000
                  li x15, 0x0
                  li x16, 0x0
                  li x17, 0x8e76f8e7
                  li x18, 0x0
                  li x19, 0x80000000
                  li x20, 0x0
                  li x21, 0x0
                  li x22, 0x0
                  li x23, 0xff0aa2fb
                  li x24, 0x250fe5cd
                  li x25, 0x0
                  li x26, 0x0
                  li x27, 0x7
                  li x28, 0x7
                  li x29, 0x0
                  li x30, 0x80000000
                  li x31, 0x80000000
                  la x12, user_stack_end
main:             sra          t1, sp, s8
                  mulhu        s0, s7, s6
                  flt.s        sp, fa6, fa2
                  xori         s3, s0, -229
                  mulh         s3, sp, s4
                  auipc        s11, 50367
                  andi         s11, s6, 1460
                  fclass.s     s0, fs0
                  slti         a6, t0, -1995
                  mulh         t2, zero, s10
                  feq.s        s9, fs8, fa3
                  mulhsu       s6, s2, t6
                  div          a1, s9, ra
                  slti         s11, s2, -538
                  fsub.s       fa4, fs3, fa7, rtz
                  sltiu        gp, s8, 1821
                  add          s4, s1, t6
                  sll          t6, a2, s1
                  addi         s1, sp, 1835
                  rem          zero, s6, ra
                  remu         s6, a6, s6
                  fmin.s       fs0, ft4, fs1
                  slli         s11, a2, 10
                  srli         s2, a3, 7
                  slt          s5, t1, s4
                  fsub.s       fa5, fa1, fa2
                  and          ra, s9, s3
                  fmul.s       fs11, ft5, ft1
                  fmv.x.w      t5, ft9
                  srai         a6, s2, 11
                  fcvt.wu.s    t5, fa7
                  fmin.s       ft9, fs7, ft1
                  mulh         s5, t3, s9
                  fmv.x.w      t4, fa4
                  fdiv.s       fs3, ft0, ft3
                  divu         a6, tp, a2
                  ori          a5, a1, -830
                  or           s3, s1, a3
                  div          ra, a6, s6
                  ori          zero, t0, 12
                  fle.s        s8, fs6, ft3
                  fle.s        gp, ft5, fs7
                  fcvt.w.s     s7, ft2, rdn
                  xor          a1, a3, ra
                  div          s2, s0, zero
                  fsgnj.s      ft2, fs8, ft9
                  fcvt.w.s     s3, fa6, rup
                  ori          s4, t4, 232
                  rem          s7, t4, s8
                  sub          gp, s2, a2
                  slli         a6, ra, 2
                  fle.s        s0, ft10, fs9
                  mulhsu       s4, s4, s9
                  fsqrt.s      fs6, fa7, rne
                  andi         s10, s5, -395
                  or           s5, s4, gp
                  fsgnjn.s     fa4, fs10, fs1
                  ori          s0, s5, -341
                  auipc        a4, 595866
                  mulh         s0, gp, a1
                  ori          s11, t3, 1578
                  mulh         zero, t2, t3
                  xori         s7, t6, -614
                  fclass.s     s11, fs4
                  flt.s        s9, ft8, fs9
                  fmv.x.w      s6, ft3
                  mulhu        s1, t3, t3
                  lui          a7, 616541
                  auipc        s11, 1031186
                  fle.s        s6, ft7, ft10
                  fsub.s       fa5, fs11, ft6
                  fcvt.s.wu    ft0, gp
                  divu         t0, s11, t0
                  slli         s2, a4, 16
                  sra          s4, s9, s10
                  fmv.x.w      t4, fs2
                  sra          a6, a5, s6
                  sra          s9, s7, s1
                  mulhu        t1, s9, tp
                  mul          a6, gp, s10
                  fsqrt.s      fs7, ft7, rdn
                  fcvt.s.wu    ft0, t6
                  flt.s        s4, fs1, fs7
                  srl          a4, s1, s1
                  fdiv.s       fs2, fs4, fs10, rne
                  fdiv.s       ft6, ft3, fs2, rtz
                  fmin.s       fa0, fs0, fa5
                  ori          sp, s7, -968
                  mulh         s5, t4, a1
                  srli         zero, t0, 9
                  divu         s7, s10, a7
                  fdiv.s       fs8, ft3, fs11
                  add          a5, ra, s8
                  srai         s3, s7, 14
                  fsgnj.s      fa1, ft7, ft5
                  sub          s10, gp, zero
                  fmax.s       fs2, ft4, ft2
                  fcvt.wu.s    sp, fs5
                  andi         t0, t0, -1267
                  fclass.s     s10, fs3
                  sub          s2, ra, s9
                  remu         a3, s1, s2
                  fdiv.s       ft0, fs6, ft1, rup
                  sll          a5, a3, a1
                  sra          a7, gp, t0
                  xori         a0, a2, 60
                  mulhsu       a5, sp, s2
                  div          s11, sp, a0
                  fcvt.w.s     a4, ft4
                  andi         t6, a5, 2046
                  add          s5, t2, a0
                  fle.s        s2, fa1, ft0
                  sltiu        s9, t5, -792
                  nop
                  andi         a3, t3, -722
                  fcvt.s.wu    fs7, s8
                  add          s7, a2, zero
                  fcvt.s.wu    ft2, a1, rup
                  fcvt.w.s     s0, fa7, rne
                  fmax.s       fs0, fa1, fa6
                  fsgnjx.s     ft8, fs10, fs7
                  fmin.s       fa7, fs7, ft2
                  lui          a5, 451412
                  fsub.s       fa0, fs3, fs3
                  feq.s        t6, ft0, fa2
                  fcvt.w.s     s11, fs0, rmm
                  nop
                  fcvt.s.wu    fs8, ra
                  fcvt.w.s     ra, fs9
                  fadd.s       fs2, ft0, fs4, rtz
                  srai         t6, sp, 11
                  fcvt.s.w     fa2, t0, rup
                  or           s2, zero, a2
                  sra          s6, a6, s6
                  or           t2, s11, s9
                  fcvt.s.w     fs3, a3
                  mulh         s6, a0, s8
                  remu         s11, a4, gp
                  sub          s5, s4, s9
                  addi         t5, t0, 1042
                  fmin.s       ft11, ft5, fs2
                  sra          t4, s0, s5
                  div          s1, a3, a1
                  ori          a0, s2, 550
                  divu         t4, s9, s9
                  fcvt.s.wu    fs10, s2, rne
                  add          s4, t1, gp
                  fcvt.wu.s    t0, ft8, rmm
                  fmv.w.x      fa2, t1
                  div          t0, ra, s3
                  xor          s10, t6, gp
                  add          a0, a3, s2
                  div          s0, a0, s10
                  slli         s11, s9, 15
                  fadd.s       fs5, ft8, fs6
                  fsgnjn.s     fa7, fa0, ft9
                  fmax.s       fa4, ft9, fa7
                  fmin.s       ft11, ft8, fa6
                  mulhu        a1, s6, s8
                  rem          zero, a5, t0
                  mulhu        a6, a7, s9
                  mul          sp, a2, s11
                  fsgnj.s      fs11, fa2, fa2
                  sra          t6, t0, a1
                  slli         t5, t1, 27
                  addi         s11, tp, 1256
                  lui          s2, 520121
                  fsgnjn.s     ft9, fa5, fa6
                  fsqrt.s      fa4, fs3
                  or           a7, a6, a3
                  sltiu        a5, ra, -938
                  fdiv.s       ft4, ft11, fs3
                  sltu         t0, s4, a1
                  sll          s11, t3, s8
                  auipc        s0, 948249
                  mulh         s8, zero, s0
                  slt          a6, s11, s5
                  xori         a6, a4, 1580
                  fsgnjn.s     fs2, ft11, fs8
                  and          s3, ra, a6
                  flt.s        s5, ft2, fa5
                  fmul.s       fs10, ft7, ft7
                  div          s0, t2, zero
                  nop
                  fclass.s     s6, fa7
                  srai         t6, s8, 12
                  mulhu        s10, a2, s0
                  fsqrt.s      fa4, fa4
                  nop
                  flt.s        t2, ft6, fs11
                  add          zero, t6, s10
                  sub          s1, s5, t4
                  lui          a3, 739147
                  slti         ra, s4, 876
                  nop
                  flt.s        t4, ft4, fs10
                  fsgnjn.s     fs5, fa0, ft0
                  auipc        s4, 895383
                  slti         s4, zero, -1815
                  fcvt.w.s     s11, fa6, rup
                  or           s9, gp, a4
                  fmax.s       fa0, fa7, ft3
                  rem          s0, a1, s6
                  fsub.s       ft11, fs10, fa6, rmm
                  fcvt.s.w     ft9, a2
                  fmul.s       ft5, fa4, ft8
                  fmul.s       ft4, ft6, fa1, rne
                  ori          s4, t5, 1789
                  fclass.s     zero, fs7
                  sra          s3, ra, t6
                  xori         t5, s10, 1639
                  nop
                  lui          a0, 461872
                  nop
                  fcvt.wu.s    a3, fs10, rne
                  remu         a4, a0, s2
                  xori         s10, s0, -171
                  auipc        sp, 1045553
                  fcvt.w.s     a5, fa0, rup
                  fsqrt.s      ft10, ft0
                  srai         s6, s4, 25
                  mul          ra, s4, t2
                  fadd.s       fa2, fs5, fa6
                  slli         a5, s11, 25
                  add          s2, a2, t2
                  sltiu        s5, sp, -1856
                  andi         a4, t1, -1066
                  auipc        a1, 537710
                  andi         s11, a3, -353
                  fmv.w.x      fa7, a1
                  nop
                  fadd.s       fs0, ft10, ft4, rmm
                  remu         a5, t6, t3
                  sub          s1, s5, s11
                  remu         sp, a4, t5
                  fsgnjn.s     fa0, fs8, ft8
                  sltu         gp, s11, zero
                  sltiu        s5, a3, 2039
                  fmv.w.x      ft6, tp
                  sltiu        s5, ra, 336
                  fsqrt.s      ft5, fa5, rdn
                  fmv.w.x      ft5, t2
                  srli         s2, s7, 15
                  feq.s        s1, ft3, fs8
                  srl          t4, t5, s9
                  feq.s        t4, ft0, fs3
                  mulh         t5, a5, s9
                  mul          zero, t3, sp
                  xor          gp, zero, a4
                  and          s0, s4, s2
                  slti         s6, a7, 812
                  fcvt.s.w     ft2, s11, rtz
                  fcvt.w.s     zero, fa3, rup
                  srl          a1, a4, a6
                  fcvt.s.wu    fa1, s2, rmm
                  mul          a0, t2, tp
                  sra          s2, s9, s1
                  divu         t2, a6, tp
                  srl          s0, a0, t3
                  fsgnjx.s     ft8, fs5, ft8
                  sltu         t0, s5, a6
                  srli         s2, t4, 18
                  sltiu        t1, zero, 448
                  slti         a5, t2, 690
                  fmin.s       fs10, ft2, fs10
                  fsqrt.s      fs5, ft9
                  fsub.s       fa0, ft1, fa6, rne
                  mulh         zero, a3, s5
                  sltu         t0, t4, s11
                  fclass.s     ra, ft8
                  mulhu        s5, sp, t5
                  srai         s5, t1, 2
                  fclass.s     a0, fs4
                  srai         a3, gp, 21
                  flt.s        ra, fs11, ft0
                  mulhsu       s4, tp, s6
                  and          s6, t0, t4
                  fcvt.s.wu    ft10, s9
                  and          t5, a4, t1
                  fmax.s       fa6, ft9, ft8
                  sltiu        s11, t3, 515
                  div          t6, ra, a6
                  fcvt.wu.s    s7, ft4
                  or           s10, s11, s2
                  srli         s5, s2, 26
                  fsqrt.s      fa0, fs9
                  srl          a5, a5, s9
                  lui          s0, 755307
                  slt          t2, a6, a7
                  fcvt.s.wu    ft11, s3, rne
                  fcvt.s.wu    ft1, a1
                  fdiv.s       ft5, fs7, ft9, rtz
                  auipc        s8, 286242
                  mul          t5, a4, a0
                  fcvt.wu.s    t0, fs3
                  mulhsu       s5, s2, s6
                  srl          s11, sp, s9
                  fsqrt.s      ft8, ft11, rtz
                  fsub.s       fs11, ft11, fs11, rne
                  fcvt.w.s     s6, fa5, rtz
                  fmax.s       fs3, ft8, fs2
                  fclass.s     gp, ft0
                  fcvt.w.s     t5, fs1, rmm
                  fsub.s       fs4, ft7, fs4, rup
                  fmax.s       fs0, fa1, ft4
                  fsub.s       fs4, ft4, ft0, rup
                  fcvt.w.s     a7, fa6
                  sub          a5, a0, a6
                  fcvt.w.s     a5, ft2
                  auipc        s3, 346240
                  fadd.s       fs4, fa7, fa2, rmm
                  slli         zero, s5, 22
                  mulh         s0, a2, sp
                  fdiv.s       fs8, fs11, fs4, rmm
                  mulh         s1, a7, t1
                  fcvt.w.s     t6, fa6, rdn
                  fle.s        a6, fa7, fs4
                  sltu         s9, t1, tp
                  fclass.s     a0, fa5
                  fcvt.w.s     a3, ft1, rne
                  fclass.s     t4, fs7
                  flt.s        s10, fa4, ft0
                  sltiu        t5, sp, 105
                  sltu         s4, s3, s4
                  fsqrt.s      ft11, fa5, rdn
                  lui          s5, 1035320
                  slti         a3, t1, 769
                  fcvt.wu.s    t1, fs6
                  fmv.w.x      fs6, s11
                  sub          t1, ra, a5
                  flt.s        a5, ft10, fs9
                  div          a0, a7, tp
                  and          t2, t0, s4
                  fcvt.s.w     fa4, t6, rne
                  xori         ra, t5, -1114
                  fcvt.wu.s    s9, fs9
                  srl          zero, a4, s1
                  fsgnjn.s     ft4, ft8, ft8
                  fle.s        s11, ft3, ft7
                  slt          a5, s11, t5
                  fle.s        s3, fs9, fa5
                  fmv.x.w      s10, fs8
                  fdiv.s       fa0, fs6, ft11, rne
                  fdiv.s       ft6, ft8, ft3, rmm
                  fsub.s       fa4, fa2, fs7, rdn
                  slt          s6, t0, s9
                  srli         sp, a3, 18
                  divu         zero, gp, tp
                  or           sp, s8, s4
                  srli         s10, sp, 21
                  sltu         zero, ra, t2
                  add          t4, s4, sp
                  fmin.s       ft9, fa6, ft3
                  slt          s7, t5, s1
                  slti         s8, a1, -986
                  fmul.s       fs10, fs3, fa3
                  fcvt.wu.s    s1, fa6, rtz
                  fsub.s       fa3, ft7, fs8, rup
                  slli         a1, sp, 14
                  addi         t6, t4, 55
                  fmul.s       ft2, ft10, ft11
                  fcvt.s.w     fs4, s3, rmm
                  divu         s6, t2, zero
                  fsgnjx.s     fs3, fs7, fs4
                  remu         t0, s10, a0
                  fmul.s       fs4, ft11, fs6
                  remu         a4, gp, s11
                  sll          a0, a0, tp
                  lui          a7, 46547
                  fsgnjx.s     ft1, fs11, fa4
                  lui          t4, 245679
                  flt.s        s6, fs4, fs3
                  srai         t2, s7, 31
                  xori         t0, a5, -77
                  fsgnj.s      fs4, ft2, fs8
                  div          t1, s6, gp
                  and          a1, zero, t1
                  fsgnjx.s     ft10, fs6, fa3
                  div          s7, s0, a6
                  slt          a0, tp, t1
                  fsqrt.s      ft7, ft3
                  fsgnjx.s     ft0, fa5, fa5
                  ori          t6, s0, 750
                  addi         t5, s3, -894
                  slti         s2, s7, 903
                  and          t1, s7, s1
                  remu         t4, s8, s0
                  fmax.s       fs7, ft2, ft9
                  xori         a1, s5, 967
                  or           s0, a0, a4
                  srai         s2, s4, 31
                  fmax.s       fs2, fa6, fs0
                  xor          zero, s10, t5
                  remu         a5, tp, gp
                  nop
                  fsgnjx.s     ft2, fa2, fs8
                  addi         a7, tp, 1119
                  fmv.w.x      ft3, a6
                  addi         s11, t4, -833
                  fmv.x.w      ra, fs4
                  mulhsu       a5, gp, a0
                  fmax.s       fs8, fs0, ft5
                  fdiv.s       fa0, ft9, fs0
                  rem          s7, t1, a7
                  fsgnjn.s     fs10, fa1, ft3
                  sltu         a3, a4, s8
                  mulh         t2, s5, t3
                  fcvt.s.w     fs8, a0, rdn
                  fclass.s     s0, fs7
                  add          s9, a2, a4
                  slli         t4, s5, 2
                  fmul.s       fs4, ft4, fa0
                  fsgnjx.s     ft3, fs6, fa2
                  sub          t4, ra, a4
                  fdiv.s       fs11, fa5, fs6
                  fmv.w.x      ft0, s5
                  mul          a0, s6, s2
                  fmax.s       fs11, ft9, ft7
                  slli         t1, t3, 4
                  remu         gp, gp, a3
                  auipc        s9, 109259
                  lui          ra, 1041684
                  fsgnjn.s     ft2, fs7, ft4
                  sub          a0, t2, a5
                  auipc        gp, 487262
                  sltiu        s6, a1, -1744
                  rem          a7, s5, a2
                  fcvt.w.s     s1, ft1
                  feq.s        a4, fs7, fs5
                  flt.s        t2, fs3, fa2
                  fmul.s       ft11, fs7, ft1, rup
                  mulh         sp, t0, s5
                  fsgnj.s      fs1, ft8, ft1
                  mulh         s0, a0, t5
                  mul          a0, a7, s10
                  fmax.s       fa6, fa3, ft4
                  fadd.s       fs2, fa1, ft3, rne
                  sll          s0, s11, t6
                  or           s4, t0, s5
                  slti         a1, s6, 577
                  fmin.s       fs0, fa6, fa4
                  fcvt.wu.s    s7, fs1
                  nop
                  xori         s5, a7, -445
                  sub          s9, a6, s8
                  divu         s10, t3, s5
                  or           a0, tp, s2
                  sra          s1, s5, s1
                  rem          t0, t2, t4
                  fmv.x.w      zero, ft1
                  fcvt.s.w     fs6, a2, rmm
                  fdiv.s       ft2, ft10, fs3
                  xor          t2, t1, a1
                  div          s10, t6, s0
                  div          zero, t1, s2
                  srl          a3, a4, s8
                  sltu         a5, s5, a1
                  xori         a7, s2, -1705
                  auipc        a0, 290067
                  srl          s2, t2, t0
                  fmul.s       fs7, fs9, fs10
                  fle.s        gp, fs4, fs2
                  mulh         gp, t4, a0
                  sra          a6, tp, tp
                  fclass.s     s9, fa0
                  remu         gp, a0, a7
                  fmv.w.x      ft8, t6
                  xori         a4, s7, -1588
                  fmax.s       ft0, ft11, fa6
                  flt.s        s1, ft10, fa1
                  mulhu        s4, a7, gp
                  sltiu        a1, a2, 167
                  fdiv.s       ft5, fa0, ft5, rdn
                  flt.s        s1, fs10, fs8
                  remu         s4, s3, t3
                  fle.s        s11, fa3, ft1
                  fmv.w.x      ft7, t3
                  fmax.s       fa6, fs4, fa5
                  fcvt.s.wu    fa1, t6, rne
                  remu         s8, zero, t2
                  sltu         t5, a2, sp
                  fmv.w.x      fa7, s5
                  fmul.s       fs2, fs4, fs4
                  fmin.s       fa1, ft10, ft7
                  nop
                  andi         s3, t6, 1848
                  fmv.x.w      s1, ft3
                  fmv.w.x      fs0, s2
                  mulh         t5, t4, s7
                  fclass.s     s1, ft0
                  fle.s        s0, fa6, fs6
                  nop
                  lui          a3, 825161
                  slli         s11, t2, 8
                  fcvt.w.s     t1, ft5, rdn
                  fclass.s     sp, ft7
                  auipc        s1, 603969
                  lui          t2, 1042120
                  sltiu        a3, s8, 1179
                  div          a6, s4, t4
                  fmv.x.w      s6, ft2
                  fmv.w.x      ft3, s11
                  xori         s7, zero, -1710
                  fcvt.s.wu    fs11, s5, rdn
                  mulhsu       a7, a3, t0
                  fsgnjn.s     fa3, fa1, fa5
                  fle.s        s8, fs6, fs10
                  fle.s        t0, fs9, fa0
                  xor          t4, a2, s2
                  and          ra, s10, s4
                  fclass.s     s9, ft10
                  andi         zero, gp, 184
                  fadd.s       fs6, ft1, fs9
                  fcvt.s.wu    ft6, ra
                  flt.s        a6, fs9, fa7
                  fsgnjn.s     ft7, fa1, ft9
                  feq.s        s4, ft10, fs0
                  auipc        s9, 991
                  div          s4, t0, t1
                  srl          s10, s8, t1
                  srli         s8, a6, 24
                  flt.s        s2, fa4, fs4
                  mulh         a7, t4, s7
                  flt.s        a4, fa2, ft4
                  fsgnj.s      fs2, fs2, fa4
                  fmv.w.x      fs11, a5
                  divu         a0, t1, t5
                  sub          a4, s0, a2
                  mulhsu       t6, a3, tp
                  fadd.s       ft11, ft1, fs10, rtz
                  fclass.s     t0, fa1
                  srl          s8, a7, a2
                  mulh         a1, s1, gp
                  add          ra, a2, s10
                  and          ra, s4, s5
                  fmax.s       fa6, ft10, fa3
                  fsub.s       fa2, fa2, fs10
                  addi         s0, s9, 1064
                  auipc        gp, 40648
                  fmax.s       fa7, fa4, fs11
                  fmv.x.w      t4, fa4
                  fdiv.s       fa2, ft1, ft3
                  fsgnjx.s     fa0, ft6, fa1
                  sub          s7, s1, t6
                  fdiv.s       ft0, ft7, ft5, rne
                  sub          s8, zero, t1
                  or           zero, zero, s9
                  fmul.s       ft7, fa5, fa0
                  fcvt.s.wu    ft6, t6, rdn
                  fcvt.w.s     s11, fs9, rtz
                  fsub.s       fa7, ft2, ft3, rup
                  mulh         s3, s11, s11
                  div          t5, a6, t5
                  lui          s3, 241358
                  or           t4, a5, a0
                  fsub.s       fa6, ft11, fs2, rtz
                  fclass.s     s3, fs9
                  sll          t2, a4, t1
                  fmv.x.w      s7, fs5
                  flt.s        gp, ft4, fa5
                  mulh         zero, a4, s7
                  div          s5, a2, a7
                  fmax.s       ft3, ft9, fs9
                  srai         a6, s4, 6
                  ori          t5, t5, 647
                  fmv.x.w      ra, fa3
                  auipc        t0, 970116
                  ori          gp, t6, -157
                  srli         sp, s1, 14
                  and          zero, a4, t4
                  srli         t4, s7, 17
                  fsub.s       fa7, fs5, fs9, rne
                  fsqrt.s      fs6, fs1, rdn
                  fsgnjx.s     fa2, fs1, ft11
                  lui          t0, 789519
                  slli         a6, s0, 25
                  xor          s3, s6, a3
                  sra          s4, s11, t6
                  sub          s2, sp, a0
                  fmax.s       ft9, fa2, fa7
                  fsgnj.s      ft7, fs11, fs9
                  xor          ra, a5, s9
                  fdiv.s       fs0, ft8, ft4, rup
                  rem          t0, s2, t3
                  addi         s6, a6, -641
                  slti         gp, a0, -1203
                  mulhsu       t6, s5, a7
                  srli         s2, ra, 28
                  fsub.s       fs10, fa1, ft3, rmm
                  add          a6, a2, a2
                  or           s4, a6, t3
                  fsgnj.s      fa6, ft6, fs3
                  fmin.s       ft3, fs1, fs0
                  flt.s        s6, fs6, ft2
                  remu         s7, a7, zero
                  srli         s11, s7, 8
                  srli         sp, s6, 13
                  rem          s11, t3, a7
                  fadd.s       fs4, ft5, ft11
                  srli         gp, tp, 12
                  lui          t4, 1003924
                  mulhsu       ra, t0, tp
                  srai         s11, a6, 1
                  fsgnjn.s     fs7, fa4, fs10
                  rem          s4, a2, a1
                  fmul.s       fs0, ft10, ft1
                  mulh         s4, a6, a1
                  sltiu        s8, a4, 223
                  sltu         s9, s1, s9
                  divu         s5, zero, ra
                  mul          s10, s8, s0
                  add          a6, s9, a6
                  sub          s2, a3, s0
                  fcvt.s.wu    fs11, sp
                  mulhu        s10, zero, a3
                  fcvt.s.w     fa6, s10
                  fmul.s       fs6, fs4, fs5, rup
                  lui          a5, 376496
                  feq.s        ra, fs0, ft8
                  nop
                  sll          t1, s11, sp
                  fmv.x.w      a7, ft0
                  sll          s8, tp, t6
                  fmin.s       fs7, fs6, ft3
                  fsgnjx.s     fs11, ft6, fa7
                  andi         s11, s9, -483
                  or           a6, t3, t3
                  fsub.s       fa1, ft0, fs11
                  fcvt.s.wu    fs4, a3
                  mul          t4, a0, s0
                  ori          s7, s9, -848
                  fcvt.w.s     s3, fs10, rup
                  fsqrt.s      fa0, fs0, rup
                  fadd.s       fs7, ft5, ft5, rne
                  fcvt.s.wu    fs6, tp
                  slt          a3, zero, t5
                  fcvt.s.wu    ft11, t4, rtz
                  sltu         a6, s4, s1
                  fcvt.wu.s    s5, fa0, rup
                  sltiu        t0, s1, 532
                  fsgnj.s      fs0, fs4, fs4
                  fsgnjn.s     ft5, fs1, fa2
                  fclass.s     s6, fs8
                  divu         t5, t0, s2
                  srli         a6, s8, 2
                  slli         s10, s0, 8
                  mulhsu       ra, s5, sp
                  feq.s        t5, ft8, ft2
                  add          s5, t0, s0
                  fsgnj.s      fa6, fa5, fs3
                  fle.s        s11, ft10, fs11
                  mulh         t2, t3, t5
                  fsgnjn.s     ft4, fa5, ft9
                  div          a1, s8, gp
                  fsgnjn.s     ft0, fs1, ft9
                  fsqrt.s      ft5, fs1, rtz
                  fle.s        t1, fs11, fs1
                  fadd.s       ft1, fs10, fa0
                  ori          a7, s6, -1804
                  div          a4, a4, s7
                  fmv.w.x      fs11, s10
                  ori          s11, ra, 792
                  nop
                  sltiu        a0, a0, 1328
                  mulhu        s6, s11, a1
                  divu         a1, a7, a7
                  divu         t0, tp, s11
                  sub          s5, s1, a7
                  srl          t1, s9, s2
                  fmul.s       ft11, fa4, fa5
                  feq.s        s10, fa3, ft11
                  or           t4, s10, s6
                  fadd.s       ft11, fs8, fa6, rtz
                  fclass.s     t4, fa5
                  fsub.s       fs5, ft11, fs10
                  sra          t0, s0, t4
                  fdiv.s       ft2, fs2, ft8
                  slt          s1, s7, s9
                  fmv.w.x      ft7, a5
                  mulh         s7, a5, gp
                  mul          ra, s6, sp
                  sra          s0, s4, s10
                  flt.s        s2, fs11, fs11
                  lui          s2, 936478
                  srl          t0, sp, sp
                  flt.s        a7, ft0, ft2
                  srai         s9, s7, 15
                  lui          a5, 354068
                  addi         t2, t1, -620
                  fmin.s       fa6, fa3, ft3
                  mulhsu       s9, s2, t5
                  auipc        t0, 583881
                  fcvt.w.s     a3, fs6
                  lui          s6, 34192
                  div          s0, t0, s2
                  fcvt.w.s     a4, fa3
                  fsqrt.s      fs10, ft10
                  divu         a5, t0, s2
                  srai         s9, s5, 14
                  fcvt.s.w     fa1, s9, rmm
                  div          s5, a1, a6
                  fsub.s       ft11, fa0, fs9, rmm
                  fcvt.s.w     ft0, sp
                  feq.s        a3, fs7, ft4
                  xor          s10, t2, t2
                  xori         sp, s4, -997
                  slli         s4, a2, 29
                  divu         s0, a3, t6
                  fsgnjx.s     fa3, fs3, fs0
                  andi         s6, t0, -1890
                  sll          t5, s7, a1
                  divu         ra, s9, s3
                  rem          sp, a1, s6
                  fcvt.s.w     fs1, t2
                  or           s2, t4, s0
                  fcvt.w.s     a5, fs3
                  slti         s11, s9, -1306
                  sltu         a0, s10, t3
                  addi         a7, a3, 474
                  xori         t1, s1, 108
                  feq.s        t0, fa3, ft2
                  fsgnjn.s     ft1, fs11, fs10
                  xori         a1, t5, 1428
                  fsgnj.s      fa7, fa7, fa7
                  fmax.s       ft3, fs2, ft0
                  fclass.s     s2, fa4
                  fmax.s       ft4, ft4, ft7
                  slli         s2, s8, 4
                  rem          s0, t0, s6
                  and          t0, sp, t5
                  xor          s0, a6, s5
                  sub          t1, a5, a3
                  flt.s        s9, ft6, fa1
                  fmax.s       fs11, fs6, fs2
                  fmv.w.x      fa0, t0
                  srai         s11, sp, 19
                  rem          s4, sp, s11
                  fsgnjx.s     fa2, ft5, ft6
                  fdiv.s       fa0, fa5, fs1, rdn
                  divu         a0, a1, t2
                  remu         t0, t5, t0
                  fsgnjx.s     fs11, fs2, fa4
                  mulhu        s9, sp, s8
                  srai         s4, t1, 29
                  and          t6, ra, t2
                  fmul.s       fa7, fs7, ft5
                  fmv.w.x      fs6, a0
                  slli         zero, s4, 8
                  nop
                  slti         s5, a1, 754
                  fmv.w.x      fs2, t6
                  srli         s11, s2, 16
                  srl          t1, sp, s11
                  fsgnj.s      fs3, ft9, fa4
                  fcvt.s.wu    fs7, s5
                  fcvt.s.w     fa7, sp, rup
                  ori          s11, sp, -112
                  div          t6, s5, s3
                  sub          s0, t1, s1
                  remu         a4, s4, ra
                  sub          s5, gp, zero
                  fsub.s       fs11, ft7, fa5
                  fadd.s       ft6, fs7, fs5
                  fmin.s       fa7, fa0, fs10
                  rem          s2, s3, s6
                  fcvt.wu.s    s5, fs0
                  flt.s        a4, fs7, fa6
                  feq.s        a7, ft8, fa5
                  fcvt.w.s     a1, fs7
                  srli         s8, s5, 15
                  fsub.s       ft2, fa6, ft8
                  fcvt.w.s     s7, fs10, rmm
                  mulh         s5, sp, a4
                  fmul.s       fa7, fs11, fs5, rdn
                  fclass.s     s0, fa6
                  fmv.x.w      a4, fs5
                  sltiu        s8, a6, -1172
                  fmv.x.w      s11, fa7
                  mulhsu       s10, t2, a4
                  srl          s0, s1, a6
                  lui          t6, 194168
                  fmv.w.x      fs2, s1
                  fmv.x.w      s2, fa5
                  fcvt.w.s     a7, ft10, rtz
                  nop
                  ori          s11, a5, -920
                  or           t2, gp, t1
                  fsqrt.s      fa0, fs8, rmm
                  fle.s        s7, fs6, ft2
                  fsub.s       ft7, ft0, ft9
                  feq.s        t5, fs2, ft8
                  mulhu        s10, zero, t6
                  fmv.w.x      ft10, s11
                  mul          s0, a0, s1
                  fmv.x.w      s7, fa6
                  mulhu        t1, zero, s7
                  and          a6, a5, a7
                  sub          t6, a3, t2
                  srai         t1, s2, 15
                  fcvt.s.w     fs11, t5
                  xori         a1, t1, 114
                  mul          a6, s6, gp
                  lui          a3, 320063
                  sra          sp, zero, t2
                  addi         s11, s1, 1660
                  auipc        s7, 19360
                  fsub.s       ft9, fa5, fs6
                  slt          sp, s11, t6
                  fmin.s       ft5, fs7, ft3
                  sll          s8, gp, t1
                  slli         t1, s8, 29
                  flt.s        t6, ft2, ft11
                  fadd.s       fs9, fa6, ft1, rtz
                  fmax.s       ft2, fa2, fa1
                  fadd.s       fa7, ft10, ft9, rup
                  sltu         a7, a2, t0
                  andi         sp, t2, 1111
                  fmul.s       ft7, fs8, ft3, rtz
                  add          a3, s8, s2
                  and          ra, s3, t3
                  fsgnjx.s     fa3, fs6, fs11
                  fmv.x.w      s7, ft4
                  xori         a1, a6, -92
                  sub          s3, a5, a6
                  feq.s        a3, fs2, fs9
                  fadd.s       fs3, ft0, ft7, rdn
                  auipc        a1, 813623
                  sltu         t4, t3, a0
                  nop
                  fsqrt.s      fa6, fa1
                  fcvt.s.wu    fa3, a2, rup
                  rem          s0, a2, a1
                  slli         a4, gp, 13
                  rem          s0, s8, a3
                  sltu         s4, gp, s4
                  sub          s9, s3, s3
                  feq.s        zero, fa2, fs8
                  divu         s10, zero, zero
                  fcvt.s.w     ft4, a1
                  add          a0, a2, s11
                  fmv.w.x      fa1, gp
                  fsgnjx.s     ft1, ft10, fs4
                  srai         s3, s4, 7
                  divu         gp, s2, t2
                  add          t4, a4, s6
                  fadd.s       fs7, ft8, ft2, rup
                  fmv.w.x      fs3, s9
                  lui          a4, 411358
                  sub          s7, a4, t5
                  fcvt.w.s     t0, fs6, rup
                  fcvt.s.wu    ft10, s11
                  lui          s3, 404247
                  mul          a0, s9, s4
                  fsgnjn.s     fs9, ft4, fa5
                  srai         s1, a2, 6
                  slt          a0, zero, s4
                  sltiu        s11, t1, 118
                  mul          t0, a6, a7
                  srai         ra, tp, 15
                  nop
                  sra          a4, zero, s2
                  srli         gp, t6, 4
                  fcvt.s.w     ft10, t0, rmm
                  flt.s        a4, ft0, ft2
                  slli         ra, s10, 23
                  fadd.s       fs2, fs6, fs8
                  xori         s5, t0, 1136
                  xor          a6, sp, s11
                  fsub.s       ft4, fs10, fs6, rne
                  sll          t2, a5, s10
                  feq.s        t0, fs6, fa4
                  fsgnjn.s     ft11, fs5, fs2
                  lui          t6, 967074
                  fcvt.s.wu    fs6, a1, rup
                  srli         s5, s6, 13
                  fclass.s     t1, ft6
                  divu         s5, tp, a7
                  fcvt.s.w     fs6, a2
                  sra          s11, s9, a4
                  sll          s0, a2, s9
                  addi         s9, a3, -596
                  lui          s8, 651577
                  fsgnjx.s     fa0, fa1, ft6
                  andi         s6, t4, -1061
                  fsgnjn.s     fa7, fa5, fs4
                  and          a4, a6, t3
                  lui          t1, 395651
                  srl          s10, s8, a4
                  and          s0, a3, s1
                  sub          a0, s10, t5
                  srai         a4, s9, 7
                  or           a1, a1, a1
                  fmax.s       ft7, fs6, ft6
                  fmv.w.x      ft10, sp
                  fadd.s       fa1, fs1, ft1
                  fmin.s       fa3, fa0, ft2
                  fcvt.s.wu    fs8, t3, rtz
                  fsgnjx.s     ft3, fs6, fs2
                  xori         ra, t3, 356
                  auipc        a4, 733064
                  xor          gp, t5, ra
                  andi         s3, a2, -1158
                  and          s1, t4, a7
                  addi         s2, a7, 876
                  or           s5, s9, t2
                  rem          sp, ra, s9
                  add          s11, a3, t1
                  divu         s9, gp, s4
                  rem          a6, t3, s5
                  fdiv.s       ft7, fa7, fs11
                  xor          a3, t6, s7
                  lui          t4, 524011
                  xor          a0, a4, a0
                  fmul.s       fs7, fa6, ft0
                  slti         a5, s6, -1895
                  srai         s4, s11, 15
                  add          t6, a5, a5
                  srai         s10, t2, 30
                  fmax.s       fa2, ft0, fa3
                  fle.s        a3, ft10, ft6
                  fsqrt.s      fa0, ft3, rne
                  fcvt.s.w     fs0, s0
                  fcvt.wu.s    s4, fa6
                  xori         gp, s7, -1747
                  fdiv.s       fa6, ft11, ft9
                  fsgnjn.s     ft3, ft6, fa7
                  auipc        a1, 299040
                  fdiv.s       fa6, fs9, ft4
                  sltu         a6, t6, s1
                  fcvt.s.w     ft3, a2, rmm
                  fdiv.s       ft8, fa7, fa0, rdn
                  addi         s6, s4, -907
                  fcvt.s.w     ft1, a6
                  andi         s0, a5, 1872
                  remu         s4, t1, s6
                  xor          a1, s5, a0
                  and          s6, t2, s6
                  mulhsu       zero, s8, s11
                  sll          s0, t1, t1
                  fsgnjx.s     fs1, fa6, fs3
                  mulh         zero, t2, s4
                  xori         a6, s9, -1417
                  fsgnj.s      fs10, fa3, fs10
                  mulhu        a5, a3, t4
                  divu         ra, a7, t2
                  or           s0, ra, s4
                  slti         s4, t3, -1038
                  xor          s6, t1, a3
                  sll          s8, a7, s2
                  fmv.w.x      ft1, a5
                  and          zero, ra, a5
                  sra          gp, s9, s3
                  sub          ra, ra, a2
                  feq.s        s9, ft5, ft5
                  sll          zero, t4, s3
                  mul          t5, s9, s0
                  sub          t2, sp, s7
                  ori          gp, s7, 222
                  srai         s2, s1, 5
                  fsqrt.s      fs1, fs3
                  fsgnjx.s     ft4, fs8, fa5
                  srl          t1, s0, a0
                  lui          gp, 622708
                  flt.s        s3, fa7, fs3
                  fle.s        gp, fa1, fa6
                  mulhsu       t5, t5, s9
                  fsgnjx.s     ft3, fa4, ft0
                  ori          s3, gp, 738
                  fadd.s       fs6, fs9, fs0, rne
                  sub          ra, ra, s6
                  auipc        t5, 255732
                  fcvt.s.wu    ft6, s6
                  fcvt.s.w     ft10, t2
                  mulhsu       t4, ra, a7
                  fcvt.s.wu    ft1, a5, rtz
                  mulhu        a6, t4, zero
                  fsgnjx.s     ft3, ft4, fs0
                  fmin.s       ft1, ft1, fa0
                  sra          a6, s9, t1
                  fmin.s       fa3, fa2, ft8
                  fmax.s       fs6, ft3, ft8
                  lui          s10, 720963
                  fsgnjx.s     fs2, fa4, ft8
                  xor          s11, a5, s9
                  fsgnjx.s     fs8, fs11, fs8
                  auipc        ra, 48250
                  fmv.x.w      t1, ft0
                  fcvt.wu.s    a4, ft1
                  fle.s        t0, fs11, fs5
                  srli         t5, a2, 26
                  fcvt.w.s     sp, ft7, rmm
                  nop
                  sltu         s3, s2, t6
                  fclass.s     s11, ft3
                  fmv.x.w      s0, fs1
                  sll          s9, a6, s2
                  divu         a0, t0, gp
                  divu         gp, tp, s11
                  andi         s9, sp, -967
                  fcvt.w.s     a4, ft9, rmm
                  sra          a7, t3, a4
                  mulhsu       s8, t4, s10
                  fmul.s       fa7, fs8, fa6, rtz
                  div          a3, s11, tp
                  xori         s10, s3, 1960
                  fmv.x.w      zero, fa7
                  and          s8, a3, a3
                  fmin.s       fs3, fs7, ft8
                  fsgnjn.s     ft1, fs4, fs8
                  srl          s1, gp, a5
                  srai         t2, a4, 29
                  fadd.s       ft8, fs9, fs9
                  fmax.s       ft5, fs9, fa3
                  fclass.s     a4, ft11
                  fcvt.wu.s    a7, fs6, rup
                  xori         s5, t1, 891
                  nop
                  sra          s6, t0, s10
                  fmv.w.x      fa3, a7
                  mulh         t1, t2, a2
                  and          a3, s0, a0
                  xor          s2, t1, t5
                  fmax.s       fs9, fa5, fa0
                  sltu         gp, a4, a1
                  fsgnj.s      ft8, ft8, ft1
                  fcvt.w.s     t0, fa4
                  mulhu        zero, a0, s1
                  sll          a1, sp, a6
                  slti         s11, t2, -1499
                  fsgnj.s      ft9, ft9, fa2
                  ori          t0, tp, 1919
                  fcvt.w.s     a7, fs3, rne
                  and          t6, a4, s5
                  mulhsu       a3, s11, sp
                  add          a3, a4, t5
                  rem          s3, a5, t5
                  srli         s3, s10, 31
                  srai         t6, tp, 21
                  sltiu        s7, a2, -1193
                  fsgnjn.s     ft9, fa5, ft0
                  fclass.s     a3, ft6
                  fmin.s       ft2, fa5, fs5
                  fle.s        zero, fs7, fa0
                  rem          s8, a3, s3
                  mul          t2, s7, t4
                  mulhsu       s5, t3, s7
                  fcvt.s.wu    fs10, s9
                  fsqrt.s      fs6, fa3, rup
                  xori         a4, t1, -324
                  fmv.x.w      s6, ft4
                  slti         zero, t0, -1503
                  fmv.x.w      s6, fs0
                  srai         s7, t6, 11
                  ori          t0, a3, 1084
                  mul          s8, tp, a3
                  srai         t0, s8, 28
                  fcvt.s.wu    fs3, t2, rmm
                  slti         s5, a6, -1482
                  sll          a4, s7, tp
                  ori          t5, s8, -971
                  fmv.w.x      fa5, zero
                  sltu         s7, tp, s0
                  fmv.x.w      s6, ft1
                  fsqrt.s      fs0, fs9, rup
                  nop
                  sub          gp, s1, a7
                  lui          s2, 132916
                  fmv.x.w      s1, fs9
                  fle.s        t5, fs1, ft4
                  rem          a6, a4, a3
                  feq.s        s10, ft4, fs5
                  slti         s9, sp, -67
                  sra          s6, s1, s0
                  fdiv.s       fs7, fa5, ft0, rne
                  mulhsu       t2, a3, t4
                  fsgnjx.s     fs10, fs1, ft9
                  auipc        s0, 479203
                  remu         a7, s8, sp
                  sltu         s4, a2, s0
                  srai         s2, t5, 7
                  fmul.s       ft6, fa2, fs2, rdn
                  srli         a1, a5, 13
                  slli         s10, t2, 12
                  fmin.s       ft6, ft4, ft10
                  sltiu        a5, s1, 1677
                  andi         a0, a2, 1358
                  fle.s        t0, ft6, fs1
                  fsub.s       fa2, fa6, fs7
                  remu         gp, tp, a3
                  addi         s1, s1, -960
                  xor          s3, s0, gp
                  xor          t2, s8, s11
                  xori         zero, s3, -763
                  or           a7, a7, a1
                  fsgnjn.s     fs8, fs3, fs7
                  fle.s        t1, ft9, ft5
                  mulhsu       t4, s5, t4
                  fmv.x.w      t1, fs2
                  ori          gp, s10, 214
                  srai         s11, s2, 6
                  ori          t0, s0, 973
                  fmul.s       fa1, ft6, ft2
                  fsgnj.s      fs4, fs10, fs7
                  srai         s3, s5, 25
                  fsgnjn.s     fs3, ft8, ft10
                  mulhu        a6, a0, a6
                  fadd.s       ft2, fs10, fa4, rup
                  lui          s3, 812987
                  srai         s0, s4, 12
                  addi         s10, zero, 865
                  flt.s        a7, fs6, ft0
                  flt.s        s11, fs4, fa1
                  rem          a1, s4, zero
                  remu         t4, s9, t2
                  sltiu        s11, a6, 1358
                  srli         a3, s5, 19
                  remu         s9, a4, a6
                  fmax.s       fa5, ft10, ft11
                  fle.s        t4, fa0, fs3
                  fmul.s       ft4, fs5, ft9, rmm
                  mulh         s3, t6, t1
                  mulhsu       s3, s8, s6
                  andi         t5, a5, 1982
                  fdiv.s       ft7, fa6, fa7
                  sub          s2, t6, a7
                  rem          a1, s3, t1
                  andi         s0, ra, -770
                  sltiu        s4, s4, -630
                  slli         s10, a1, 26
                  fcvt.w.s     s1, fa3, rmm
                  fcvt.s.wu    fa6, t5, rmm
                  rem          s5, t1, s11
                  sra          s5, t2, t2
                  mulhsu       s0, t5, a6
                  andi         t5, s0, -1872
                  mul          zero, s10, t6
                  fsub.s       fa5, ft2, fa3, rne
                  srl          t2, a7, s5
                  ori          a7, s5, 442
                  add          t0, a4, s0
                  and          zero, s3, s1
                  slt          a0, s2, s0
                  fsgnj.s      fa4, fa1, ft4
                  fsgnj.s      ft9, fa0, fa4
                  div          a0, tp, s5
                  fmv.w.x      fs2, sp
                  sra          s4, s10, s8
                  div          a6, t3, ra
                  lui          ra, 841773
                  lui          s3, 606869
                  lui          s11, 247894
                  and          s8, s7, s7
                  slli         s0, a6, 16
                  or           t4, t3, s4
                  fmax.s       fa4, ft4, ft2
                  mulhsu       s11, s6, s6
                  fclass.s     s5, fa3
                  addi         s5, s6, 367
                  mulhsu       zero, s6, t0
                  addi         t5, a6, 1892
                  xor          s2, s2, zero
                  fmv.w.x      ft7, t1
                  sra          t4, s11, t3
                  div          sp, a7, s10
                  mulh         s2, a5, s6
                  fcvt.s.w     ft2, t0
                  fsub.s       fs8, ft3, fa6, rup
                  fsgnjn.s     ft11, fs1, ft0
                  srl          zero, a7, t6
                  add          t0, a1, s9
                  fmul.s       ft3, fs5, ft5
                  fsub.s       fa5, fs9, fs3
                  divu         s1, a0, s9
                  sub          s7, s5, s4
                  mulh         t5, a3, s3
                  slt          sp, a6, s5
                  nop
                  fsgnjx.s     ft5, fs1, fa4
                  mulhu        a0, ra, s3
                  addi         s0, ra, 1086
                  rem          s9, a1, s3
                  slti         a0, a3, 283
                  mul          zero, s10, t4
                  xor          s2, s1, t4
                  fle.s        s4, fa0, ft11
                  srl          sp, s11, a4
                  fsub.s       fs4, fs5, ft9, rup
                  fclass.s     t1, ft11
                  fmul.s       ft1, ft8, fa7
                  srl          s6, t3, zero
                  srl          s2, gp, t5
                  mulh         gp, t3, gp
                  fclass.s     s9, fs7
                  div          s7, t1, a2
                  fsgnjx.s     ft1, ft10, fs7
                  fcvt.s.w     ft5, s0, rne
                  mul          s10, a2, s8
                  auipc        s11, 304958
                  fcvt.wu.s    t1, ft9
                  lui          s8, 610394
                  add          gp, s4, s6
                  add          a3, zero, t6
                  flt.s        s3, ft2, ft7
                  fadd.s       fs9, fs7, ft3
                  auipc        s9, 734424
                  slti         s5, s11, 1484
                  or           a3, s7, s1
                  fcvt.s.wu    ft11, s1
                  fcvt.wu.s    t1, fs11
                  fsgnjn.s     fs10, ft1, ft5
                  mul          s9, ra, s0
                  auipc        s3, 36754
                  lui          a3, 938210
                  fcvt.w.s     ra, ft10
                  rem          s0, s10, a0
                  andi         s9, s6, -315
                  fcvt.s.wu    fa5, s0, rmm
                  fsub.s       fs6, fs1, fs3, rmm
                  feq.s        a5, fs0, fs4
                  sub          a7, t2, s6
                  mul          t2, ra, t1
                  sra          s10, a4, t6
                  fle.s        a5, fs7, fs10
                  srl          zero, a2, t1
                  fmax.s       ft7, fa1, fs0
                  nop
                  rem          t6, a0, a6
                  andi         t5, t5, -602
                  sll          s7, s3, s7
                  fdiv.s       fs2, fs3, fs9
                  slt          gp, t4, a6
                  remu         zero, t4, sp
                  fmax.s       fa2, fa7, ft7
                  andi         s4, a0, -1596
                  sltiu        sp, sp, -568
                  fsub.s       ft5, fs2, fs7
                  feq.s        s6, ft3, ft8
                  srai         s11, s11, 31
                  fsgnjx.s     fa2, ft3, ft9
                  fclass.s     s8, fa5
                  fadd.s       ft11, fs11, ft9
                  sltu         t4, s3, s7
                  and          s0, s3, s9
                  slli         s9, ra, 31
                  add          s9, a5, s8
                  slti         sp, a4, -1132
                  andi         s6, a4, 1076
                  srai         t1, tp, 22
                  fmin.s       fa5, fa3, fa7
                  feq.s        s6, fs3, fs10
                  add          t5, ra, t1
                  flt.s        t5, fs8, ft4
                  fmax.s       fa6, fs7, fs3
                  slli         s10, ra, 7
                  ori          a4, t6, 739
                  fsgnjn.s     fa3, fa7, ft5
                  srl          ra, s3, t0
                  fsub.s       fs11, ft11, fs11
                  nop
                  remu         t0, a3, s11
                  sub          a5, s5, a7
                  fclass.s     a5, ft10
                  slti         s1, a2, -1307
                  sltu         s0, sp, s7
                  fsgnj.s      fs0, fs5, fa0
                  fdiv.s       ft8, fa5, fs11, rmm
                  fsqrt.s      fs10, fs1, rtz
                  rem          a7, s5, a7
                  divu         t4, s0, tp
                  fsub.s       fs1, ft5, ft0
                  fmul.s       fs9, ft8, fs0, rtz
                  lui          a1, 125663
                  sltiu        s2, ra, 836
                  srai         sp, t2, 2
                  fsgnj.s      fs2, fs11, fs3
                  sub          t1, a0, sp
                  fsgnj.s      fa1, fa3, fa1
                  fcvt.wu.s    ra, fs5, rtz
                  ori          s11, a2, -1375
                  sltiu        a1, a2, 1914
                  div          s5, a7, s10
                  addi         t6, s3, 1521
                  add          ra, ra, a7
                  sltiu        s6, t1, 1109
                  fmv.x.w      s3, fa3
                  sltu         ra, s9, t2
                  divu         t0, s11, s5
                  slli         s5, t6, 5
                  rem          s10, ra, s0
                  fadd.s       fs8, ft9, fs10
                  fmin.s       fa5, ft2, ft7
                  fdiv.s       fs9, fs3, fa2, rtz
                  fsub.s       fs6, ft11, fs10
                  fadd.s       ft6, fs9, ft4, rup
                  slt          sp, a2, a2
                  auipc        a5, 57676
                  fsqrt.s      ft7, ft6
                  ori          s5, t4, -60
                  sltu         t6, s4, s5
                  auipc        sp, 1046558
                  auipc        sp, 105382
                  flt.s        t4, fs2, ft1
                  mulh         t1, a4, gp
                  fmv.w.x      fs11, ra
                  srl          t1, s3, s7
                  srai         a3, a5, 12
                  xori         a3, s2, -1821
                  fmv.w.x      fa2, s2
                  slti         t5, s11, 486
                  fmul.s       fa3, fs9, fa6, rup
                  slt          t1, s6, t5
                  mulhu        a6, tp, a7
                  fmv.x.w      a7, ft2
                  fclass.s     a1, fs7
                  srl          a4, a2, s3
                  slt          t2, t3, s7
                  fsqrt.s      fs3, ft6
                  fmax.s       fa6, fs0, fs1
                  mul          s5, s7, s5
                  sub          a3, sp, s7
                  fcvt.wu.s    t6, fs5
                  lui          t1, 1039968
                  fcvt.s.w     fa4, s5, rdn
                  xori         a0, a2, -264
                  and          t5, s5, s6
                  nop
                  div          s6, s6, a7
                  fadd.s       fa3, fa5, fa0, rtz
                  fmv.w.x      fs1, zero
                  rem          s2, s3, a2
                  fmax.s       fs2, ft0, fs4
                  xor          gp, t4, zero
                  fclass.s     a7, ft5
                  fsgnjx.s     fa3, fs9, fa2
                  and          s9, a1, s6
                  fmv.x.w      s7, fs0
                  fmax.s       ft9, fs10, fs3
                  fmv.x.w      s4, fs5
                  fmin.s       fa6, fs6, fa2
                  xori         s10, ra, 1594
                  fsgnjx.s     fa3, ft7, ft4
                  fsub.s       ft0, fa7, fs6, rmm
                  fmv.w.x      fa2, t1
                  feq.s        s6, fs10, fa1
                  fmv.w.x      fa7, t3
                  fle.s        sp, fs9, fa1
                  slt          s11, s10, s10
                  rem          t2, t4, a5
                  fdiv.s       fs2, fs10, fs0
                  mulhsu       zero, s3, s5
                  divu         t2, t1, t2
                  slt          t5, a2, t4
                  div          a1, tp, gp
                  fcvt.s.w     fa4, s3, rtz
                  fcvt.w.s     s2, fs1
                  fle.s        t2, fs3, fs6
                  srl          a3, t6, sp
                  fmv.x.w      s10, fa3
                  and          sp, t5, t3
                  fclass.s     gp, fs7
                  sltu         s1, zero, a6
                  fcvt.wu.s    s1, fa7, rne
                  addi         zero, s2, 405
                  srai         s3, t3, 2
                  fmul.s       ft11, fa4, fa5, rne
                  fclass.s     s9, fa0
                  feq.s        s0, ft9, ft8
                  srl          t1, s3, a7
                  fmv.w.x      fa6, ra
                  fsgnjn.s     ft4, fa4, ft0
                  fsub.s       fs9, fa6, fs10
                  remu         t6, s6, s11
                  fmax.s       fa4, fa2, fs3
                  fsqrt.s      ft11, fs8, rmm
                  andi         gp, zero, -1016
                  fadd.s       fa0, fa2, ft8, rdn
                  or           t1, a0, a4
                  mulhu        a1, s10, s0
                  slti         t5, t3, -1493
                  mulh         gp, s1, s0
                  fsgnjx.s     ft10, fa0, ft5
                  fsgnjn.s     ft4, fs9, fa4
                  feq.s        s11, ft4, ft11
                  sra          a3, a0, a2
                  ori          a6, a0, -1082
                  rem          s11, t2, gp
                  srli         s11, a0, 29
                  fmv.w.x      ft2, s4
                  fsqrt.s      fa3, fs11
                  fdiv.s       ft3, fs4, ft6, rdn
                  add          a6, s6, a1
                  sltiu        t6, a5, 1448
                  sll          s1, t3, s8
                  addi         a6, s1, 367
                  fdiv.s       ft5, ft4, ft11
                  xor          ra, s3, s5
                  fmul.s       fs3, ft7, ft4, rne
                  srli         ra, t0, 13
                  remu         t0, a1, ra
                  fsgnj.s      fs2, ft4, fs4
                  lui          s1, 494970
                  xori         t2, a0, 1157
                  srai         ra, t3, 14
                  div          t6, t2, a6
                  fsub.s       ft6, ft7, fs10
                  fsgnjx.s     ft8, ft4, ft1
                  mulhu        s0, s10, zero
                  add          a4, a5, gp
                  mulhsu       s5, a1, s10
                  srl          t0, a2, a4
                  fsgnjx.s     fs3, ft1, fs6
                  fmv.w.x      fs7, t5
                  fmv.x.w      zero, ft6
                  sltiu        s8, s1, 1415
                  fsgnjn.s     fs10, fa1, ft6
                  fmax.s       ft3, fa7, fs9
                  remu         t4, a0, a3
                  fsub.s       ft8, fs9, fs7
                  ori          sp, a7, 951
                  fsqrt.s      fs1, fs11
                  lui          s5, 695719
                  slti         a3, ra, -461
                  mul          t1, tp, s3
                  auipc        s7, 219539
                  xor          zero, s11, t4
                  lui          s7, 621884
                  feq.s        t6, fa5, ft0
                  srl          t2, a5, a1
                  sltiu        a3, tp, 1800
                  fcvt.s.wu    ft5, t3
                  fsgnj.s      ft0, fa6, ft5
                  fcvt.s.w     ft11, a4
                  fsgnjx.s     fs11, fa1, ft7
                  fmv.w.x      fs1, t1
                  add          a0, t4, s2
                  sub          a6, a2, a7
                  fclass.s     t5, ft11
                  sra          zero, s10, gp
                  fmv.x.w      a1, fa5
                  sra          gp, s5, s5
                  andi         a0, a4, -1271
                  addi         gp, a1, -1053
                  fle.s        t6, fs11, fs0
                  fsgnj.s      ft6, fa2, ft5
                  slli         sp, s8, 31
                  mul          s8, zero, a1
                  xor          t1, s1, t5
                  fcvt.wu.s    t5, fa5
                  fsgnjn.s     fs7, fa7, fa2
                  feq.s        ra, fs2, fs0
                  fmv.w.x      fa0, sp
                  sll          a6, a7, s4
                  sltu         s0, sp, sp
                  rem          sp, t6, zero
                  fsqrt.s      fs8, fs9
                  slti         a0, t1, 1332
                  nop
                  fsgnj.s      ft11, fa1, fs11
                  fmv.w.x      fs3, a7
                  mulhsu       t6, t6, t6
                  or           a0, a3, s5
                  lui          gp, 403581
                  fsqrt.s      fs7, fa1
                  fmax.s       fa1, fs5, fs4
                  addi         t0, a3, 1318
                  srli         ra, a0, 10
                  fmv.x.w      a6, fa5
                  slt          s2, sp, s10
                  fmv.w.x      fa5, s4
                  fsgnjx.s     ft5, fa7, fa4
                  fmul.s       fa0, fs1, fa5
                  fsqrt.s      ft9, ft10, rne
                  sll          s1, tp, t5
                  fmv.w.x      fs0, t2
                  fcvt.w.s     ra, ft9, rmm
                  fmv.w.x      ft5, t2
                  fsgnjn.s     ft10, fa2, fa6
                  fmul.s       ft11, fs4, fs10
                  mulh         s0, a2, t4
                  nop
                  fsgnjx.s     fa2, fs4, fa6
                  mulh         t6, s2, s4
                  mulhsu       s2, s10, s11
                  ori          t4, s0, -463
                  or           s8, s1, s2
                  fdiv.s       ft5, ft6, fs3, rtz
                  sra          ra, s4, s8
                  fsgnjn.s     ft0, fa2, fa4
                  flt.s        a7, ft10, fa7
                  addi         t4, t3, -726
                  fsqrt.s      fa6, fs9
                  addi         a5, s7, -1290
                  fsub.s       fs4, ft1, fa3
                  xor          s3, s3, s1
                  fclass.s     s2, ft4
                  srl          a4, s3, zero
                  divu         s9, a1, a7
                  slti         a4, s9, -316
                  fcvt.w.s     s1, ft6, rup
                  slti         gp, tp, 720
                  fmul.s       ft3, fs5, fs5, rne
                  slli         ra, t4, 19
                  and          a5, s0, a7
                  sub          a0, s8, a5
                  fmv.w.x      fs2, s2
                  slti         a5, s2, -939
                  slt          a4, a3, s3
                  sra          t4, s2, s0
                  fclass.s     s11, fs0
                  fadd.s       fs5, fs7, fs5, rtz
                  fsgnj.s      ft3, ft9, fa4
                  fmv.w.x      fa0, t1
                  or           s5, s1, t4
                  nop
                  mulh         s4, a2, s5
                  slti         a6, s9, 1154
                  sra          s5, s0, s0
                  auipc        s1, 743688
                  fdiv.s       fs8, fa3, ft11, rdn
                  fsgnjn.s     fs11, fa3, ft11
                  or           a7, s3, s1
                  remu         a4, ra, s9
                  fle.s        s9, ft2, fs7
                  slli         t2, ra, 5
                  lui          a3, 619821
                  srai         s5, t5, 20
                  fle.s        a6, fs3, ft6
                  mul          s2, s3, s5
                  mulh         t5, s7, t5
                  fdiv.s       ft0, fa3, fs10
                  fcvt.s.w     fs9, a3, rne
                  fsub.s       fa4, fs9, fs2
                  ori          s10, s0, -790
                  sra          t6, s2, a4
                  and          s4, a1, s1
                  ori          gp, t4, -845
                  fmv.x.w      a6, fs11
                  mul          a0, t4, t3
                  addi         t6, s2, 872
                  or           s5, s0, t1
                  sub          t2, t6, s3
                  fmv.x.w      a7, fs2
                  addi         s2, a0, 2001
                  mulh         s8, s6, sp
                  auipc        t2, 893620
                  fclass.s     s10, ft4
                  fle.s        s11, fs10, ft6
                  srli         s2, a2, 21
                  fadd.s       ft2, fs7, fa5, rtz
                  fmv.w.x      ft7, s7
                  feq.s        t5, ft6, fs8
                  fmv.x.w      a0, fs2
                  andi         t5, zero, 515
                  and          ra, t0, tp
                  fsgnjx.s     ft9, ft3, ft3
                  fle.s        s3, fa4, fa0
                  fcvt.w.s     a0, ft8, rtz
                  srl          s11, s1, t1
                  sra          s3, s0, t2
                  div          s5, a1, t6
                  fsgnjn.s     fs5, ft10, ft2
                  add          sp, zero, s2
                  divu         a3, ra, s11
                  srli         s8, s3, 27
                  lui          t2, 806030
                  sltiu        gp, t0, 537
                  fle.s        s7, fs7, ft3
                  fmin.s       ft3, ft3, ft9
                  divu         s0, gp, a4
                  fmax.s       ft4, ft9, fa0
                  fcvt.wu.s    a7, fs11, rmm
                  fadd.s       fa0, fs8, fs9, rne
                  feq.s        s3, fs4, fa1
                  feq.s        sp, ft1, fa1
                  fcvt.wu.s    sp, ft1, rup
                  andi         a0, t4, -1815
                  andi         a5, t3, 1650
                  fadd.s       fs9, fs3, ft0
                  sltiu        zero, a5, -390
                  sll          s3, a7, s0
                  mul          s9, s3, s5
                  fmv.x.w      sp, fa7
                  fadd.s       fs0, fa1, fs8, rtz
                  slli         s6, t2, 11
                  flt.s        sp, fs6, fa0
                  nop
                  fle.s        s2, fa3, fa5
                  sltiu        t2, t2, 980
                  remu         a0, zero, s11
                  mul          a1, a7, t2
                  mulhsu       a3, a4, s2
                  mulhsu       a3, a2, a6
                  mulhu        s11, a6, a3
                  nop
                  fadd.s       ft1, ft8, fa3, rmm
                  sub          s0, t5, s3
                  slli         s7, t5, 2
                  sll          a0, sp, a5
                  fcvt.s.w     fs11, sp, rdn
                  fcvt.wu.s    s11, ft2, rne
                  fdiv.s       fa7, ft11, fa4, rtz
                  fmin.s       fa3, fa3, ft0
                  fle.s        a5, fs1, fa2
                  feq.s        gp, fs2, fa1
                  sltiu        ra, a0, 144
                  sra          s10, a3, s3
                  xor          a6, s11, t3
                  remu         a0, a6, a0
                  fmul.s       fa2, fa0, fs11
                  fsqrt.s      fs1, fs9, rmm
                  fsgnj.s      ft3, ft10, ft1
                  add          t0, a7, s0
                  fle.s        a0, ft5, fa7
                  or           s0, s3, t3
                  fcvt.wu.s    s11, ft1, rne
                  mulhsu       a0, t5, s5
                  fsub.s       fa1, ft1, fs8, rdn
                  fsub.s       fa6, fa1, fs4, rup
                  slli         s2, a5, 15
                  fsgnjn.s     fs1, ft11, ft10
                  fsgnj.s      ft8, fs10, fa4
                  fclass.s     sp, fa5
                  sra          s7, s2, a3
                  sll          sp, t3, a2
                  fcvt.s.w     ft7, s10
                  sub          s0, ra, s11
                  auipc        sp, 339529
                  mul          s11, t1, s4
                  fsub.s       fs3, fs7, fs5
                  fcvt.s.w     fa4, zero, rup
                  fdiv.s       fa1, fa4, ft2, rne
                  mulhsu       a7, a4, tp
                  fclass.s     t6, fs3
                  fcvt.s.wu    fa3, s1, rdn
                  srl          s0, a5, s8
                  fcvt.w.s     a0, fs4, rtz
                  fsqrt.s      fa7, fs10, rdn
                  ori          s4, sp, 559
                  fclass.s     s11, fs9
                  fsgnjn.s     fs6, fs4, ft4
                  fsgnj.s      fa5, fs10, fs0
                  xor          a6, t2, t4
                  xor          gp, s11, gp
                  fle.s        sp, fs11, ft6
                  sltu         t1, sp, s1
                  remu         a3, t5, a5
                  mulhsu       gp, ra, sp
                  slt          a6, a1, t2
                  fdiv.s       fa0, ft7, fa2
                  slli         s0, s3, 27
                  mulhu        t2, s0, s3
                  srl          a0, sp, t2
                  nop
                  flt.s        s6, ft1, ft3
                  ori          s1, sp, -403
                  srai         t1, t0, 10
                  fsqrt.s      fs1, fa4, rdn
                  feq.s        s9, fs2, fa6
                  remu         t4, s9, s6
                  xor          a6, s4, s4
                  nop
                  or           a0, s1, a4
                  srai         s5, s0, 28
                  mulh         s0, s6, t6
                  fcvt.s.wu    ft8, s10, rdn
                  mulhu        t4, s11, ra
                  ori          s5, a5, -35
                  div          gp, s0, a1
                  sub          t2, t1, t0
                  fcvt.w.s     s1, ft4
                  fsgnj.s      fs4, fs3, ft8
                  div          t1, gp, s3
                  slt          t2, s5, t4
                  lui          zero, 825896
                  fsgnjx.s     fs8, fs4, ft8
                  fcvt.s.wu    fs6, s11
                  sub          a4, a7, s2
                  fcvt.s.wu    ft3, a3
                  fcvt.s.wu    fs8, tp, rdn
                  fclass.s     t5, fs2
                  sll          a7, s8, a3
                  xori         a0, zero, 1445
                  fsgnj.s      fs10, fa4, fs9
                  fle.s        s10, fs9, fs5
                  and          s9, gp, t5
                  fdiv.s       fs8, fs3, fs6, rtz
                  mulh         a7, s9, s10
                  srai         zero, sp, 20
                  ori          t2, a0, -1258
                  srl          t2, t2, ra
                  sltiu        zero, a3, 73
                  divu         t0, s8, s0
                  srai         sp, t0, 1
                  fmv.x.w      s0, ft7
                  fmv.x.w      a4, fa5
                  fcvt.s.w     ft11, s0, rdn
                  div          a4, a3, s6
                  div          t0, zero, t1
                  or           s11, a5, t2
                  remu         sp, a6, t0
                  fsqrt.s      ft9, ft8
                  fmv.w.x      fa1, gp
                  xor          sp, a0, a2
                  feq.s        s0, fa4, fa6
                  xor          a3, s7, s11
                  fcvt.w.s     t1, fa0
                  mulhsu       s8, a4, t0
                  sltiu        a6, tp, 94
                  fcvt.s.w     ft8, t4, rne
                  fclass.s     a5, fs8
                  fsgnjx.s     fs8, ft0, fa1
                  fcvt.w.s     ra, ft8
                  fmv.x.w      t6, ft5
                  addi         a7, s2, -512
                  srli         s3, s2, 12
                  xori         t0, a6, -99
                  fsgnj.s      fs7, ft3, fs9
                  srli         t0, s0, 12
                  sra          s0, a5, a5
                  slti         ra, t0, -977
                  fmin.s       ft2, fs8, ft9
                  srli         a1, s7, 14
                  fmv.x.w      s0, ft1
                  nop
                  fdiv.s       ft6, fs4, fa7
                  slli         t4, t5, 31
                  sub          t6, gp, t2
                  mulhu        a0, ra, s2
                  or           sp, t4, t1
                  slli         t2, tp, 22
                  sltiu        s9, t6, 223
                  feq.s        t6, ft11, fs10
                  fcvt.w.s     s3, fs3, rmm
                  slti         s10, a0, 1370
                  fcvt.s.w     fa7, a5
                  div          s10, s2, a7
                  fadd.s       fs10, ft5, fa5
                  fcvt.w.s     sp, ft11, rmm
                  slli         t4, s2, 16
                  xor          s4, t1, a5
                  divu         ra, s7, a6
                  fle.s        s1, ft7, ft4
                  mul          ra, a1, s0
                  sll          a3, t2, s3
                  mulh         t6, s5, a6
                  fmv.x.w      a0, fa2
                  fmv.w.x      fs6, a1
                  ori          s5, zero, 1607
                  fsub.s       ft1, ft5, fs4
                  nop
                  remu         t0, s2, a6
                  flt.s        ra, ft6, fa2
                  slli         t0, s7, 19
                  mulh         ra, gp, sp
                  srli         sp, s6, 12
                  rem          t0, a4, a6
                  xor          t6, a4, s8
                  divu         a5, a5, s11
                  sltiu        t4, t2, -869
                  fcvt.s.w     ft0, tp, rdn
                  fmax.s       ft7, fa7, fa5
                  or           s7, s8, t1
                  lui          t6, 891139
                  sltu         s10, a3, s6
                  lui          a6, 705925
                  fadd.s       fs9, fs10, fs5
                  sll          t0, a7, a7
                  fdiv.s       fs5, ft10, ft3
                  fdiv.s       ft6, fa7, fa4
                  slti         a5, s2, 915
                  fsqrt.s      fs7, ft2, rmm
                  mulhu        a4, a5, t6
                  srl          s8, s2, tp
                  sll          a1, zero, tp
                  feq.s        t4, ft6, ft8
                  xor          t5, t1, s9
                  flt.s        t6, ft0, fs10
                  remu         s9, s5, a5
                  sll          a5, tp, t1
                  addi         gp, s8, 911
                  xori         sp, a6, -474
                  slti         s3, t0, 209
                  or           ra, s11, s2
                  fadd.s       fa0, fa2, ft9, rmm
                  fadd.s       ft9, fs3, fa3, rup
                  feq.s        s2, ft9, ft4
                  xori         t6, s9, 1008
                  slti         a7, s4, 1204
                  fsqrt.s      fa4, ft6
                  mul          a0, a7, t1
                  fclass.s     s4, fa7
                  fmax.s       fs9, fs8, fs3
                  fcvt.wu.s    a7, fa7, rtz
                  fclass.s     a5, fa2
                  mulhsu       s8, t4, s11
                  fsub.s       fs5, fs10, ft7
                  fcvt.w.s     s9, ft1
                  nop
                  divu         ra, s7, ra
                  fsub.s       fs5, fa0, ft2, rup
                  fmax.s       ft9, ft11, fa1
                  sltiu        s5, t1, -131
                  fsgnj.s      ft2, fs3, fs6
                  fcvt.wu.s    s0, ft8
                  rem          t6, s11, t2
                  sltu         gp, s6, a1
                  nop
                  mulhu        t1, t3, gp
                  mulh         sp, a2, t5
                  fcvt.s.wu    fs8, a2, rtz
                  fmv.x.w      s4, fs6
                  fmul.s       fs8, fa4, fs4
                  feq.s        s6, fs4, fs5
                  xori         zero, s1, -1629
                  fsgnjx.s     ft2, fs1, fs3
                  andi         t2, s2, -733
                  fsub.s       fa4, fs11, ft8, rne
                  fmin.s       fs4, fs10, ft7
                  fcvt.s.wu    ft10, s7, rmm
                  fmv.x.w      a5, fa3
                  fmax.s       fs10, fs10, fs10
                  fcvt.s.wu    fs11, s0
                  srli         s4, a1, 18
                  slli         s5, t2, 26
                  xori         a3, t1, -811
                  fmax.s       ft10, fa2, ft11
                  fsgnjx.s     ft3, ft9, ft7
                  remu         ra, s1, s4
                  fadd.s       ft8, ft9, ft5, rtz
                  sra          s8, s9, t3
                  divu         a1, a7, s0
                  add          t5, a0, a2
                  lui          s2, 632009
                  rem          a6, t3, a5
                  fsgnjx.s     fs3, fs6, fs11
                  fsgnjx.s     ft6, fa5, fs1
                  fmin.s       ft2, fs10, fs10
                  fcvt.s.wu    ft1, t6, rne
                  fcvt.w.s     s2, fs5
                  remu         t2, a0, t3
                  fmv.w.x      ft5, s8
                  mulhu        a7, t6, a3
                  fsgnj.s      fs5, fs6, fs8
                  fmax.s       ft6, ft5, fs4
                  fcvt.wu.s    s4, fa4, rup
                  mulhsu       s10, a7, t3
                  fle.s        s6, fs6, fa7
                  mul          s7, t5, s8
                  flt.s        a0, fs11, ft11
                  fsgnjx.s     ft3, fs10, ft6
                  fsqrt.s      fs8, fa4
                  div          s8, s3, sp
                  sra          a0, tp, s6
                  sll          a4, t2, a0
                  sltu         t0, t2, a6
                  sra          s10, t2, s1
                  fsgnjn.s     fs3, fs11, fs10
                  nop
                  addi         s3, t0, 1107
                  rem          a1, s0, t4
                  fmin.s       ft7, fs9, fa5
                  and          a4, s9, zero
                  slti         s2, a4, -1654
                  fle.s        t1, fa1, fa3
                  sltu         s3, s3, t2
                  sltu         s5, sp, zero
                  mul          a1, s2, a3
                  fsgnj.s      ft9, ft3, fa7
                  remu         s9, s6, s6
                  sltu         a4, a2, a7
                  slli         a7, s0, 23
                  fmul.s       ft5, ft11, ft6
                  mulhu        a7, a7, t4
                  fcvt.s.w     fs6, t2
                  fcvt.w.s     s8, fs3
                  slt          s6, s11, s11
                  mul          ra, s6, a0
                  lui          zero, 888931
                  srai         t2, s10, 6
                  auipc        a3, 263238
                  rem          a6, t4, a2
                  fsgnj.s      ft3, fs1, ft4
                  fmin.s       fs9, fa0, ft6
                  div          s9, t5, a1
                  fsqrt.s      ft0, ft5, rdn
                  fdiv.s       ft2, fs1, fs9, rmm
                  fsgnjx.s     fa5, fs3, ft1
                  ori          t2, sp, 1527
                  fmul.s       fa0, fs10, fa3
                  fclass.s     s0, ft8
                  nop
                  rem          s10, s11, a5
                  fcvt.s.w     ft8, sp, rne
                  srli         s8, s5, 4
                  xor          s4, t6, a7
                  mul          t5, t4, a1
                  fmin.s       fs8, ft6, fs9
                  divu         sp, t5, s11
                  sll          s4, sp, a3
                  xor          s2, gp, t3
                  mul          t0, ra, zero
                  fsgnjn.s     ft2, ft3, fs9
                  fcvt.w.s     s1, ft5
                  xor          s7, s1, ra
                  fsgnjx.s     fs2, ft1, fa5
                  sltiu        a1, s11, 902
                  mul          s6, t1, a7
                  mulhu        ra, a2, gp
                  slli         t4, a4, 16
                  fcvt.w.s     s5, ft2
                  divu         s2, tp, t1
                  sub          a6, a6, s10
                  xori         s11, s11, -651
                  fmv.w.x      fs10, t6
                  fmax.s       fa6, fs1, fa3
                  mulhu        a3, t3, t5
                  fdiv.s       fs10, fs11, ft9
                  mul          t6, t0, s7
                  fmul.s       fa5, fs3, fa5, rtz
                  fmul.s       fs8, ft0, fs6
                  sra          zero, s6, t5
                  fclass.s     ra, fs11
                  xori         s11, a2, 997
                  fcvt.s.wu    fs2, t0
                  sltiu        s2, s11, 572
                  fsgnjn.s     fa1, fs7, fs6
                  fmin.s       fa7, ft8, ft5
                  fadd.s       ft1, fa1, fs6, rtz
                  srai         s0, t0, 12
                  sra          a7, a1, a4
                  and          s4, t4, a3
                  fmv.x.w      s6, fa7
                  fadd.s       fs3, ft11, fs3
                  mulhu        s7, a4, s0
                  mul          s8, t6, s1
                  xor          s5, s8, s2
                  srli         gp, s3, 20
                  fcvt.w.s     t2, ft2, rtz
                  sll          a1, t3, t1
                  slti         s11, s3, 1072
                  remu         t2, a6, a2
                  xor          s5, s8, tp
                  and          s1, s10, s4
                  divu         t0, a2, s0
                  fmax.s       ft6, ft3, ft6
                  feq.s        ra, fs0, ft4
                  fsub.s       fs6, fa5, fa4, rne
                  fsub.s       fs3, fs2, fa4, rup
                  slli         s10, s7, 6
                  sltiu        a6, t0, -1255
                  fmul.s       ft6, fs8, ft8, rdn
                  fcvt.w.s     sp, ft8, rdn
                  srli         zero, a0, 23
                  sub          s9, a6, a1
                  fmax.s       ft6, fs0, fa7
                  mulh         zero, tp, a6
                  fclass.s     s2, fa7
                  ori          t5, s4, 415
                  fsgnj.s      ft7, ft5, fa3
                  xori         gp, a0, -230
                  xori         s5, sp, -440
                  sltiu        a5, s9, 764
                  fsgnjx.s     fa0, ft6, fs5
                  slti         t0, s1, -227
                  flt.s        s0, fa6, fs0
                  fle.s        s10, ft1, ft8
                  xori         a7, s0, 2014
                  slt          a0, a7, t3
                  or           sp, s6, a6
                  fsqrt.s      ft3, fa7, rmm
                  fcvt.s.w     fs8, s1
                  nop
                  addi         ra, zero, -556
                  fcvt.wu.s    t0, fs6, rmm
                  andi         s2, t5, -198
                  fsqrt.s      ft10, fs2, rne
                  rem          s0, a2, a4
                  fsgnjn.s     ft0, fs5, ft6
                  sltiu        s6, s3, 414
                  lui          s3, 709910
                  fsub.s       ft1, fa3, ft3
                  sub          s8, t5, s8
                  and          zero, s2, tp
                  fcvt.wu.s    t0, ft11
                  fdiv.s       fs0, fs4, fs1, rmm
                  mul          t2, t4, t5
                  fsqrt.s      fa5, fs6, rmm
                  mulhsu       a5, a7, s0
                  fcvt.wu.s    s8, ft4, rne
                  xor          s0, t2, gp
                  mulhsu       zero, a3, t4
                  srl          s9, s8, ra
                  addi         s7, t6, -837
                  sra          a4, s2, t2
                  andi         a6, tp, 1802
                  fle.s        gp, ft1, ft0
                  or           a1, t4, gp
                  fdiv.s       fa3, ft1, fs8
                  fmin.s       ft5, ft11, fs0
                  fle.s        sp, fs8, ft7
                  fmv.x.w      s5, ft5
                  mul          s6, s1, a5
                  div          s2, a1, a0
                  fdiv.s       fa6, ft1, fs1, rdn
                  andi         t4, t4, -1807
                  slti         s3, s5, -1098
                  mulhsu       s5, ra, a4
                  fmul.s       ft1, fs5, fa6, rmm
                  fclass.s     a3, ft3
                  fsqrt.s      ft6, fa6, rtz
                  fclass.s     a1, ft1
                  fsub.s       fs10, fs8, fa7, rne
                  sra          gp, t6, t2
                  fsgnjn.s     ft11, ft1, ft11
                  fsqrt.s      fs8, ft9, rmm
                  fsgnjn.s     fa4, fa3, ft3
                  auipc        s4, 578431
                  andi         a7, s11, 1535
                  fmin.s       fa7, ft3, ft7
                  xor          a0, a5, s6
                  fsqrt.s      fs7, fa0, rtz
                  fmin.s       ft5, fs2, fa4
                  slti         s4, a7, -1060
                  feq.s        s5, fa7, fs0
                  auipc        s9, 776984
                  srl          s7, tp, t0
                  fmax.s       ft9, ft6, fs8
                  sra          ra, s11, t2
                  sltu         s0, s2, s11
                  sltu         gp, t2, s9
                  mulhsu       s9, s9, zero
                  mulhu        s2, s0, t0
                  rem          s2, t4, t3
                  xor          s8, s4, a7
                  fsub.s       fs2, fs3, fa6
                  fsgnjx.s     fa3, ft11, fa6
                  andi         sp, ra, 50
                  fcvt.w.s     a7, fa5, rmm
                  fdiv.s       fs10, ft10, ft10, rup
                  div          a4, a6, s0
                  sub          a4, tp, a5
                  sltu         t1, t0, s9
                  fcvt.wu.s    t2, fs5
                  sltiu        s4, s0, -1824
                  fadd.s       ft1, fs10, ft10
                  fcvt.s.w     fa6, a3
                  mulh         s11, ra, s9
                  feq.s        t5, fs6, ft3
                  sltu         s2, tp, s0
                  fcvt.w.s     t6, fs4, rne
                  sltiu        a1, t3, -614
                  fsub.s       fs2, fs0, ft9, rdn
                  and          s2, t2, s4
                  nop
                  auipc        s0, 233840
                  sll          s5, s11, a1
                  sub          s10, s1, a0
                  fdiv.s       ft8, fs8, fs6
                  fcvt.s.wu    fs3, a2
                  auipc        a0, 153670
                  fsgnjn.s     fa4, fs1, fa3
                  remu         a3, a0, s1
                  slt          s4, t5, a3
                  srai         a6, t3, 18
                  xor          gp, zero, a2
                  divu         t6, s10, zero
                  mulhu        a1, t2, a6
                  srai         a1, t0, 30
                  fsgnj.s      ft2, fs11, fs5
                  fadd.s       ft3, fs9, ft7
                  sltiu        a6, s8, -1894
                  sll          s10, t4, zero
                  sub          a5, s6, a3
                  slti         a5, zero, 1358
                  slti         s5, s3, 472
                  fdiv.s       fs3, fa5, ft0, rup
                  sltu         s11, s6, s2
                  sll          s11, ra, s7
                  andi         t6, t1, 407
                  srl          s3, t4, t5
                  fle.s        s0, fa1, fs2
                  fsgnjn.s     ft9, fs10, fa7
                  fsgnjn.s     fs5, fa2, fs9
                  fdiv.s       ft9, fs2, ft1, rne
                  fmv.w.x      fs11, t1
                  lui          s6, 443155
                  srai         s1, ra, 26
                  fsub.s       ft9, ft3, fs10
                  remu         s11, s11, t1
                  divu         t0, a4, t6
                  fclass.s     t1, fs10
                  fsgnjn.s     fs2, fa6, fs10
                  srl          s11, a2, a3
                  sll          t2, s1, tp
                  auipc        s6, 723818
                  addi         a6, t1, 1920
                  sltiu        a4, a7, -202
                  fcvt.s.wu    fs4, s3
                  fle.s        a1, ft7, ft10
                  slti         a6, t4, 1854
                  ori          a7, s11, 1347
                  slti         a4, sp, 1716
                  sll          s6, s9, a4
                  flt.s        s7, ft10, fs6
                  nop
                  sub          t1, ra, t6
                  srl          zero, t3, sp
                  fsgnjx.s     fa4, ft9, ft1
                  sltiu        zero, t5, 304
                  or           a1, s7, a0
                  fsub.s       fs7, fs11, fs0, rup
                  and          a7, s5, s9
                  fmax.s       fs8, fa3, fs4
                  slti         gp, gp, -57
                  fsqrt.s      fs6, fa0, rdn
                  flt.s        sp, ft6, ft10
                  fcvt.s.wu    fs8, tp, rup
                  mulhu        s0, zero, s3
                  or           a3, s6, s10
                  fclass.s     a6, fs8
                  fmin.s       fs4, fs6, ft9
                  fsub.s       ft7, fs6, ft7, rne
                  nop
                  fmv.w.x      fa2, a1
                  remu         s6, s5, s2
                  slt          sp, s2, t2
                  fsgnjn.s     ft3, ft9, fs3
                  srai         a0, s8, 4
                  slt          s9, a7, sp
                  and          s11, a0, s10
                  nop
                  fdiv.s       ft1, fa1, fs0, rdn
                  or           gp, s2, s3
                  flt.s        s2, ft1, fs1
                  sra          gp, s3, s9
                  slt          s11, tp, ra
                  slt          a1, s3, t2
                  sltu         zero, a2, s1
                  mulh         s10, t2, t1
                  mulh         sp, t0, s2
                  nop
                  srai         s6, a5, 3
                  fclass.s     a4, fa1
                  fmul.s       fs10, fs7, fa0
                  sltu         a7, a2, s6
                  fsub.s       fs10, ft9, fs10
                  fcvt.wu.s    s11, fs2
                  sltu         sp, a5, t5
                  slli         t0, zero, 17
                  srli         ra, s11, 21
                  slli         t1, tp, 3
                  lui          t1, 612309
                  fmax.s       fa4, ft7, ft1
                  lui          ra, 103419
                  mulhu        t4, t5, t5
                  fdiv.s       fa4, ft11, fa6
                  fcvt.s.w     ft5, a0, rdn
                  fsgnjn.s     ft1, ft9, ft9
                  feq.s        s10, ft3, fs10
                  fadd.s       fs0, ft6, fa7, rmm
                  fcvt.wu.s    t6, ft8, rne
                  flt.s        t2, ft10, ft5
                  fdiv.s       ft6, fs1, ft0, rup
                  div          s0, a0, s2
                  fcvt.s.wu    fs10, a4, rdn
                  ori          s4, gp, -749
                  slti         s8, s2, -254
                  feq.s        s4, ft5, ft8
                  fsgnjn.s     fa0, fa0, ft1
                  slli         a5, t3, 21
                  sub          s8, t1, ra
                  flt.s        sp, ft7, ft0
                  sra          a3, s10, s2
                  and          s5, s6, tp
                  fsub.s       fs1, fs2, ft3, rne
                  or           s2, a4, s6
                  fclass.s     sp, fs5
                  div          a5, s2, s0
                  nop
                  fsgnj.s      fs9, ft3, fs4
                  andi         t2, a2, -1555
                  sub          s8, s1, a6
                  xor          t1, t6, t0
                  srli         t0, s9, 25
                  fle.s        s5, fa5, ft7
                  rem          ra, s0, s1
                  fmin.s       fa3, ft0, fa7
                  flt.s        s3, fs3, fs2
                  mul          t4, a2, a0
                  fcvt.s.w     fs10, t5, rup
                  addi         ra, a3, 278
                  fsub.s       ft6, fa4, ft9
                  fsgnj.s      ft2, ft9, ft10
                  lui          s3, 9775
                  mulh         a3, s4, gp
                  and          zero, a1, t2
                  xor          s1, s2, s4
                  ori          gp, t2, -931
                  fcvt.w.s     s6, ft9, rmm
                  fmv.w.x      ft6, gp
                  auipc        t1, 99606
                  fsgnjx.s     fs10, fs11, fs4
                  feq.s        s2, fa6, ft2
                  remu         s0, ra, zero
                  ori          t5, a5, 1232
                  fcvt.s.w     fa7, a3
                  sll          s1, sp, a3
                  nop
                  andi         a0, gp, 1274
                  mulhu        s8, s11, a4
                  fsgnj.s      fs3, fs6, fs5
                  remu         t0, s8, s5
                  fsgnjx.s     fa4, fs1, ft9
                  lui          s10, 49011
                  fcvt.w.s     a7, fa1, rmm
                  lui          s7, 577218
                  mulhu        t0, ra, t0
                  fsgnjx.s     fa1, fs2, ft5
                  srli         t0, s1, 31
                  mulhsu       gp, s5, s11
                  fclass.s     s1, fa5
                  rem          zero, tp, a3
                  slt          s2, sp, tp
                  fmv.w.x      fa1, t2
                  feq.s        sp, fa7, fs7
                  fcvt.w.s     t0, ft6, rne
                  mul          s3, t5, ra
                  fsqrt.s      fs4, ft6, rne
                  ori          s1, s11, -1062
                  fdiv.s       fs5, fs5, ft11, rtz
                  andi         s0, s3, 1212
                  remu         s4, t0, s4
                  fmin.s       ft0, fa7, ft11
                  mulhu        s8, t0, a6
                  xor          ra, s8, s4
                  lui          s1, 698371
                  xori         gp, s5, -108
                  fadd.s       fs5, ft4, fa7, rup
                  slt          ra, a7, sp
                  fcvt.s.wu    ft5, t2, rne
                  fsqrt.s      ft6, fs2, rtz
                  fdiv.s       ft2, ft1, fa0, rne
                  fclass.s     s10, fa7
                  fcvt.wu.s    a7, fs4, rtz
                  sra          s9, ra, t5
                  fmax.s       fa3, fs3, fa6
                  sltu         s5, a4, s0
                  fsqrt.s      fs0, ft2
                  srl          s1, s4, a6
                  addi         t4, t2, 1823
                  nop
                  mulhsu       t4, t2, a4
                  fclass.s     zero, ft6
                  srl          zero, s10, s5
                  fmul.s       fa6, fs2, fa3
                  mulhsu       a6, s9, s7
                  nop
                  fadd.s       fs6, fa4, fa4
                  mul          t0, t0, s0
                  fcvt.wu.s    zero, ft10
                  rem          t0, a6, ra
                  remu         t6, t2, s0
                  srl          a5, t4, a4
                  lui          s0, 720750
                  fclass.s     t5, ft10
                  mulhsu       t5, a7, s9
                  sll          s8, a3, gp
                  fcvt.s.wu    ft0, t2
                  slli         s4, a0, 20
                  fsub.s       ft5, fs2, fs9
                  rem          t1, a6, a2
                  fdiv.s       fs2, fs9, fa5, rup
                  fsgnjn.s     fs0, fs7, fs4
                  ori          s3, s3, -1496
                  mul          a7, s9, t3
                  fmv.x.w      s10, ft11
                  andi         s4, s11, 577
                  fclass.s     s9, fs6
                  slt          t4, s7, a7
                  divu         t2, a6, s7
                  slli         t6, s0, 18
                  slti         s1, s0, -1574
                  sub          zero, s6, a5
                  fsgnjn.s     ft9, fa2, fa4
                  addi         s8, s7, -1247
                  fcvt.s.wu    fs4, s3
                  xor          t2, s10, ra
                  srli         s11, s0, 28
                  fsgnjn.s     ft2, fs4, fs2
                  addi         s10, s4, -587
                  flt.s        s1, ft4, ft3
                  rem          a3, t4, s0
                  mulhu        a0, s4, zero
                  mulhu        s0, s6, a2
                  fmv.w.x      fs5, s5
                  fcvt.s.w     fs8, t4
                  slt          a4, s1, s0
                  fcvt.s.wu    fs2, s0, rtz
                  sub          s0, sp, t1
                  srl          t0, a1, s8
                  fle.s        a5, ft10, fa6
                  fmin.s       fs6, fa4, ft10
                  fadd.s       fa7, ft0, ft10, rtz
                  fsgnj.s      ft4, fs8, fs10
                  fadd.s       fs1, fa1, ft9
                  lui          a3, 802755
                  fdiv.s       fs1, ft7, fa3, rne
                  xor          t5, s5, a4
                  fsgnj.s      ft6, ft8, fs8
                  xor          s1, s9, s7
                  feq.s        s0, fs5, fa4
                  sra          a5, ra, t1
                  nop
                  remu         s2, a2, a1
                  fsgnj.s      ft7, fs3, ft5
                  fle.s        s0, fa7, fs2
                  lui          a1, 817176
                  fcvt.s.wu    fs0, s11, rne
                  addi         a1, t6, 1108
                  or           a0, s2, s11
                  div          sp, a6, tp
                  lui          t6, 810293
                  fsgnjn.s     ft10, fa6, ft5
                  sub          s2, a7, gp
                  slli         t0, s7, 22
                  fsub.s       fa5, fa0, fa1
                  mulhu        s11, s2, s10
                  feq.s        t4, fs3, fa5
                  mulhu        s11, t0, t4
                  fsqrt.s      fa3, ft11, rtz
                  fle.s        t4, fs9, fa2
                  mulh         a1, s5, s11
                  addi         a5, s6, 1888
                  fcvt.s.w     ft7, tp, rdn
                  feq.s        t0, fs10, fa0
                  fcvt.s.w     fa6, t1
                  fcvt.s.wu    fa6, a7, rne
                  fmv.w.x      ft11, s0
                  slti         ra, s2, -183
                  fcvt.s.wu    fa0, t5
                  and          s1, s7, s11
                  fcvt.s.wu    fs3, s2, rup
                  xori         sp, ra, 1066
                  auipc        t0, 428270
                  fcvt.wu.s    a0, ft8, rtz
                  fsub.s       fs1, ft11, fs3
                  or           s2, a4, t3
                  rem          a3, a3, s4
                  fadd.s       fs9, ft7, fa5, rup
                  fmul.s       fa3, fs8, fa5
                  fsqrt.s      ft3, ft5, rne
                  fcvt.w.s     t6, fa1
                  fsub.s       fs2, ft7, fs0, rne
                  feq.s        t0, fa5, ft2
                  fclass.s     s10, ft5
                  fmax.s       fs6, fs3, fs4
                  sltiu        a1, s0, 1685
                  fmv.x.w      s2, fa3
                  fcvt.w.s     a5, ft2
                  feq.s        gp, fa1, fa2
                  sll          t4, t3, t6
                  mulh         s9, a5, tp
                  flt.s        a5, fa5, fa1
                  xor          t1, gp, t4
                  addi         ra, s5, 1294
                  sltiu        s0, a6, -563
                  xori         t0, zero, 999
                  div          s2, t2, s4
                  andi         t2, s6, 1823
                  xori         a5, t0, -579
                  xori         t1, s7, 86
                  fdiv.s       fs4, fs6, fa2, rmm
                  fcvt.w.s     a0, ft11, rup
                  fsqrt.s      ft9, ft1
                  sra          s11, t3, t3
                  mulhsu       s6, gp, a0
                  fsqrt.s      fs11, fa5, rup
                  add          s10, zero, s9
                  xori         t4, tp, -84
                  srl          a1, tp, ra
                  nop
                  slli         gp, zero, 26
                  fsgnjx.s     ft2, fs7, ft1
                  fcvt.s.w     fs10, a7, rtz
                  sll          t2, s10, s6
                  fcvt.s.wu    fs3, s5, rne
                  auipc        s9, 81299
                  fsqrt.s      fs7, fa4
                  div          s9, t6, t4
                  slli         a3, a7, 15
                  xor          s0, s9, t3
                  ori          t6, ra, 703
                  addi         s3, s9, -612
                  mul          s2, s11, ra
                  fadd.s       fs1, ft4, ft2, rtz
                  lui          t5, 553654
                  xor          a4, a2, s4
                  mulh         s5, s6, s6
                  mulh         s10, s1, s4
                  flt.s        t2, ft7, ft11
                  andi         a6, s3, -1253
                  fmin.s       fs4, ft1, fs8
                  nop
                  fcvt.wu.s    sp, fs4
                  fdiv.s       fa0, fs1, ft3
                  slti         s4, s9, 484
                  srli         t0, a7, 8
                  divu         s10, t0, t3
                  fmin.s       ft9, ft2, ft1
                  fmv.x.w      s5, ft3
                  flt.s        a0, fs2, fs1
                  xor          t0, a2, a3
                  mul          t6, s7, s9
                  sra          s1, s4, a2
                  nop
                  fsgnjn.s     fa2, ft3, fs9
                  mulh         s4, t1, s0
                  slti         s8, s6, 359
                  fmax.s       ft4, fa5, fa2
                  add          s8, s2, t1
                  nop
                  fmv.w.x      fs11, a0
                  sltiu        sp, a3, -84
                  and          s4, s9, s5
                  and          s5, a7, a4
                  fmin.s       ft8, fs8, fs7
                  mul          s3, s6, a1
                  addi         a4, a3, 1443
                  lui          s11, 989575
                  fle.s        gp, ft11, ft5
                  mulhsu       a4, sp, s11
                  fadd.s       fa1, fs3, fa4
                  fmin.s       fa7, fa1, ft6
                  rem          t4, a2, a3
                  mulh         a5, ra, t3
                  fdiv.s       ft5, ft2, ft9
                  fdiv.s       fs5, fa7, fs1, rdn
                  slt          s8, s2, s9
                  sra          s11, a5, s6
                  fcvt.s.w     fs3, s1
                  lui          t0, 485053
                  fsgnjn.s     fa7, fs5, fs5
                  fsqrt.s      fa4, ft5, rtz
                  fcvt.w.s     s3, fs7
                  div          a0, a5, s1
                  div          t2, t1, s10
                  sltiu        s1, t0, -1202
                  fcvt.w.s     s6, ft7
                  nop
                  mul          a0, a0, s9
                  addi         s4, s2, -1304
                  rem          zero, t5, t6
                  mul          s7, s1, s7
                  fmax.s       fa4, fs1, fs2
                  sra          s3, s9, a3
                  flt.s        a5, fs10, fa1
                  fadd.s       ft7, fs5, ft10
                  sltu         t0, a0, s4
                  nop
                  add          zero, gp, gp
                  slli         s5, s8, 22
                  or           a5, t4, a3
                  fcvt.wu.s    a4, fa4, rmm
                  xor          zero, a0, s10
                  divu         zero, s1, t6
                  sltu         s8, s0, a0
                  slt          s3, s3, s2
                  fle.s        t2, fa5, fs10
                  divu         t2, s11, s5
                  fcvt.s.w     ft7, a3
                  mulh         s4, s7, t5
                  srai         sp, sp, 30
                  and          s3, t1, a1
                  feq.s        t2, fa1, fa3
                  mul          s5, gp, s9
                  fmin.s       fa0, ft4, fs3
                  sltiu        s0, a2, -1291
                  remu         zero, s5, s9
                  auipc        sp, 820039
                  nop
                  sltiu        a5, s8, 326
                  fcvt.s.wu    ft1, t2, rup
                  sltiu        t4, s6, 107
                  xori         s9, t3, 665
                  ori          s8, a0, 535
                  srl          a3, s10, a1
                  rem          t2, tp, sp
                  sll          s2, s0, t1
                  auipc        a3, 974761
                  fsgnjn.s     ft9, fs3, fa4
                  lui          s8, 510007
                  remu         t1, a3, s7
                  rem          a1, t5, s1
                  mulh         s2, s6, a5
                  auipc        s3, 866074
                  sll          s11, s0, tp
                  sub          s1, s4, a2
                  fsgnjx.s     fs0, fa5, ft0
                  fmv.w.x      ft9, t0
                  slti         t6, t2, 1713
                  fmv.w.x      fs11, s0
                  fsgnj.s      fs11, fa7, ft1
                  flt.s        s7, fs8, fa1
                  fsgnjx.s     fa3, fa4, fs5
                  mulhu        a6, t6, t2
                  fcvt.wu.s    t6, fa2, rne
                  srai         s3, t3, 18
                  fcvt.w.s     s5, fs9
                  xor          gp, s4, s1
                  srli         a4, t3, 16
                  fsgnj.s      fs9, ft1, fs0
                  xor          a5, a6, a6
                  fmv.w.x      fs9, t2
                  fmul.s       fa5, fs7, fa2
                  mulhsu       s1, s5, a5
                  mul          ra, s6, t5
                  ori          s11, s7, 1195
                  srai         sp, s8, 23
                  srl          s7, s3, a2
                  fsgnj.s      fs6, ft10, fa6
                  fcvt.s.w     fa5, s3
                  sltu         a0, a6, s3
                  lui          a4, 949814
                  fsgnj.s      ft0, ft5, fa1
                  slli         t4, a3, 20
                  sra          t2, ra, a1
                  lui          a6, 291661
                  srl          s5, gp, a0
                  fcvt.s.w     ft10, s8
                  srai         s3, s11, 15
                  fmv.w.x      ft4, s11
                  flt.s        t1, fs8, fs1
                  slli         s4, t0, 2
                  mulhu        sp, s2, s6
                  mul          s8, s0, a3
                  addi         s10, t0, -972
                  mulhu        s3, zero, a6
                  mulhu        s10, s4, t6
                  fsqrt.s      ft8, ft6
                  fmax.s       fa1, fa6, fa1
                  fmv.x.w      s4, fs3
                  srl          s5, t0, t1
                  sltiu        a0, a2, 293
                  andi         a3, gp, -1321
                  xor          ra, s7, gp
                  divu         t1, a1, zero
                  fdiv.s       fa6, fa4, fa3
                  fsub.s       fa5, ft7, fa3
                  srl          ra, zero, zero
                  slt          s6, a0, a1
                  xor          s6, a7, t2
                  xori         s3, sp, -1112
                  addi         s8, sp, 53
                  sll          s0, t6, a5
                  fadd.s       fs0, fs8, ft5, rup
                  div          gp, t3, a4
                  or           zero, s9, t4
                  flt.s        a1, fa6, fs1
                  rem          s6, s9, s4
                  fsgnj.s      fs4, fa4, ft9
                  sll          a0, s6, a0
                  divu         a7, t0, s10
                  fmin.s       ft11, fs0, ft3
                  fcvt.s.wu    fs7, a1
                  fsgnjx.s     fs1, fa2, fa5
                  fsgnjx.s     ft4, fs9, fs0
                  sltiu        a7, s2, 1030
                  fcvt.s.w     ft9, s3, rtz
                  slli         s8, t0, 13
                  fmul.s       fs6, ft6, ft11, rmm
                  srai         a4, gp, 11
                  mul          t1, s5, s8
                  mulh         zero, a2, t5
                  srl          t4, s4, s6
                  mulhu        gp, s4, s2
                  mul          gp, gp, a3
                  fdiv.s       fa1, fs0, ft7
                  fmin.s       fa3, ft3, ft0
                  feq.s        sp, ft7, ft9
                  andi         a3, s9, 1560
                  fmin.s       fs1, ft0, ft3
                  lui          s0, 780121
                  rem          a1, ra, s4
                  rem          s7, s7, s10
                  fle.s        s4, fa5, ft9
                  nop
                  mul          s2, s3, t5
                  xor          ra, t4, t5
                  and          a7, a6, ra
                  sra          a3, gp, s11
                  mulhu        s8, s6, s10
                  addi         t1, s5, 1014
                  flt.s        ra, fs5, ft10
                  fdiv.s       fs1, fs1, fa3, rtz
                  mul          t6, a3, tp
                  sltiu        gp, s0, 337
                  mulh         s7, tp, s6
                  sll          a6, a2, a0
                  flt.s        s0, fs8, fs4
                  fsgnjn.s     fs1, fa2, ft4
                  xor          t2, a2, s4
                  rem          s7, s9, t6
                  fdiv.s       fs8, fs5, ft7, rdn
                  mul          s8, s9, a1
                  fsgnjn.s     fs6, fs3, fs5
                  fsqrt.s      ft2, ft0, rdn
                  flt.s        s0, ft6, ft9
                  sltu         s9, s6, s2
                  fsgnjn.s     ft8, fs7, fa0
                  feq.s        s3, fs2, fa5
                  fcvt.s.w     ft5, t4, rdn
                  addi         a5, s3, 507
                  xori         a4, a4, 282
                  srl          zero, s0, a4
                  divu         t1, ra, a7
                  fcvt.s.wu    fa7, a6, rne
                  fsqrt.s      ft5, ft11, rmm
                  and          t4, t1, s10
                  auipc        s9, 221670
                  fle.s        s7, fs9, fs5
                  srli         s5, s11, 28
                  fcvt.s.w     fs4, a6
                  srl          s9, s4, a5
                  and          s8, a7, t6
                  flt.s        s2, fs7, ft4
                  fadd.s       fa1, fa0, fa6, rup
                  mul          t1, s9, s9
                  fcvt.s.w     ft9, t4
                  mulhsu       s4, t4, t0
                  xor          s4, s7, t5
                  sltu         s2, a1, a7
                  div          s11, t2, a3
                  fsub.s       ft6, fa3, ft10
                  div          s8, a0, a5
                  srl          s4, s10, a2
                  sltu         t4, sp, t0
                  divu         s5, s2, zero
                  rem          s1, a4, s1
                  ori          s5, s6, -1843
                  nop
                  or           t1, ra, t1
                  addi         a0, gp, 232
                  fclass.s     s11, ft11
                  fsgnjn.s     fa2, ft1, fs2
                  feq.s        t1, fa7, fs9
                  fadd.s       fa3, fs9, ft1, rmm
                  fmax.s       ft10, fa0, fa2
                  fcvt.wu.s    t6, ft9
                  fmax.s       ft11, fs7, fs7
                  mulh         a1, a0, a7
                  sltiu        a0, s5, 128
                  divu         t0, s0, t2
                  div          s1, a7, s2
                  sra          s8, s3, gp
                  fsgnj.s      fa7, ft7, ft5
                  srai         s9, s9, 28
                  or           gp, s3, t6
                  sra          s5, gp, a2
                  srli         s10, s2, 25
                  sltu         t5, t3, a7
                  addi         a1, gp, 1616
                  srai         ra, a6, 6
                  fmv.w.x      ft8, s8
                  fle.s        s8, ft8, ft1
                  fmul.s       ft3, ft9, fa1
                  xori         a0, s0, 164
                  fle.s        t1, fs5, ft10
                  fmax.s       fs3, ft6, fs3
                  sra          s0, sp, s4
                  sltiu        s9, t0, -1216
                  xori         a1, s9, -153
                  xor          a1, s2, s5
                  sll          ra, t5, s5
                  add          t5, a2, a6
                  fsgnj.s      fa0, fs7, ft6
                  add          s1, t6, s2
                  mul          a1, a0, ra
                  fclass.s     t2, ft7
                  mulhsu       s3, a7, s9
                  nop
                  mul          t6, s4, s0
                  srl          t2, s8, s2
                  fsgnj.s      ft0, ft6, ft4
                  fsgnjx.s     ft6, fs7, fa1
                  xori         t1, s4, -1010
                  mulhsu       s9, a5, a1
                  lui          s0, 472252
                  lui          s7, 892888
                  fclass.s     s1, fs2
                  ori          t1, a7, -1234
                  sltiu        a0, zero, 1821
                  add          t2, a4, t4
                  nop
                  srl          a6, a5, s0
                  feq.s        a5, fs7, fa4
                  fmax.s       fs0, ft10, fs0
                  fmv.x.w      t0, ft6
                  srli         s10, s0, 13
                  fsgnjn.s     fa5, fs11, ft5
                  sltu         s11, s7, t1
                  fadd.s       fa4, fa5, fa5
                  fsgnj.s      fa2, ft4, ft0
                  srli         s0, s11, 27
                  fmul.s       ft8, fa4, ft1
                  or           s9, s8, ra
                  fsqrt.s      fs1, fs1
                  srai         s11, t6, 11
                  mul          s3, a2, a2
                  fcvt.s.wu    fa4, s1, rmm
                  xori         a1, a6, -41
                  fclass.s     a1, fa3
                  lui          ra, 936586
                  xori         a5, s6, 1633
                  addi         t6, sp, 1367
                  sltu         a7, s8, t1
                  fsgnjn.s     fa7, fa3, fs0
                  fmin.s       ft10, fs1, fs2
                  fmv.w.x      fa7, s2
                  divu         s11, s11, s8
                  fmv.w.x      fs6, a7
                  fcvt.w.s     s10, fs6
                  feq.s        zero, fs1, ft9
                  ori          s4, s7, 1126
                  andi         zero, a7, -1152
                  rem          a6, a6, a4
                  fcvt.wu.s    a7, fs2
                  fcvt.s.wu    fs1, sp
                  addi         s11, t2, -853
                  fcvt.wu.s    s1, fs10, rdn
                  fmv.w.x      fa2, s3
                  flt.s        s1, fa6, ft10
                  auipc        t5, 903464
                  div          a7, t1, s5
                  mulh         s9, t0, s6
                  fmv.x.w      s6, fs4
                  nop
                  fsgnj.s      fs2, fa4, ft0
                  addi         s2, sp, -119
                  fdiv.s       fa5, ft6, fa5, rne
                  fdiv.s       ft1, ft8, ft2
                  fcvt.wu.s    s1, fs3
                  srl          a1, gp, s10
                  fmin.s       fa3, fs10, fs8
                  ori          sp, a6, -408
                  addi         s6, t0, 74
                  flt.s        t6, fa5, fa5
                  sub          s4, a7, s4
                  fmin.s       ft7, ft6, ft2
                  andi         s0, s4, -1009
                  sltu         s2, s6, a2
                  fmv.w.x      ft8, s0
                  flt.s        s3, fs9, fs0
                  fsgnj.s      fs8, fs0, fa2
                  fcvt.wu.s    sp, fs3, rtz
                  fcvt.w.s     a6, fa7
                  fmul.s       ft7, ft0, ft7, rne
                  srli         s1, a5, 8
                  fsgnjn.s     ft11, fa1, fs9
                  ori          ra, tp, 1098
                  ori          a6, a6, -237
                  fsqrt.s      ft9, fs7
                  div          s4, t1, s5
                  ori          a3, t1, 30
                  fsgnj.s      fs10, fs10, ft0
                  sub          s8, a2, a6
                  divu         t2, s9, a5
                  sltiu        sp, s9, 1479
                  fsqrt.s      ft3, fs10, rne
                  divu         a5, s7, t6
                  mul          s0, t2, s0
                  slti         a6, s0, -1154
                  fle.s        t0, fs11, fs7
                  fcvt.s.w     fa5, a1
                  fsgnj.s      ft2, ft0, fs1
                  lui          ra, 370530
                  or           s10, ra, gp
                  srl          t6, tp, ra
                  fmv.x.w      s10, fs3
                  nop
                  divu         gp, a4, s6
                  fcvt.wu.s    s3, fs0
                  fmul.s       fs5, fs5, fs3, rtz
                  fsgnjn.s     ft9, fa6, fs3
                  fcvt.s.wu    fa6, s7, rne
                  feq.s        s11, fs10, fa0
                  fcvt.s.w     fa0, t3, rdn
                  addi         t0, t0, 1103
                  and          s6, t0, t4
                  rem          a5, s4, a2
                  fsgnjx.s     fa6, fa5, ft4
                  rem          t1, s2, s11
                  andi         s7, s6, -250
                  fmul.s       fs7, fa0, ft1, rmm
                  remu         a7, s4, a0
                  fcvt.wu.s    sp, ft7, rdn
                  xori         s9, s10, 521
                  fsub.s       ft6, fa7, ft4, rdn
                  fsgnjn.s     fs4, fa7, fs11
                  div          t0, s11, a1
                  slt          s8, t1, s4
                  div          t4, s7, t4
                  div          ra, ra, s4
                  sltiu        gp, a6, -1500
                  andi         s1, t0, 1524
                  rem          a5, s10, a2
                  mulh         sp, s2, a1
                  fcvt.w.s     s2, fs11, rne
                  fsgnj.s      fs6, ft6, ft8
                  fmin.s       ft10, fs5, ft5
                  add          t0, s0, s8
                  fcvt.w.s     t6, fs4, rdn
                  ori          s7, a5, 881
                  xor          a5, tp, a6
                  or           a5, a3, s3
                  lui          a3, 503519
                  mulh         s11, a3, a0
                  slli         s3, a7, 4
                  nop
                  fmv.x.w      s7, ft9
                  ori          s2, s7, 1161
                  fadd.s       fs2, fa7, fs10
                  add          s5, s10, t3
                  xori         s5, a7, 80
                  fcvt.w.s     gp, fs6
                  srai         a3, sp, 29
                  srai         s7, t1, 2
                  slt          t6, a2, gp
                  mulh         t2, s5, s6
                  fclass.s     s10, ft3
                  sltiu        a6, t6, 1151
                  fmin.s       fa1, fa1, fs1
                  fmv.x.w      t2, ft2
                  andi         s7, s5, -1144
                  fle.s        t0, fa3, fs10
                  addi         s10, t0, 1866
                  fcvt.w.s     s11, fa2, rtz
                  mul          a0, t0, s0
                  fmv.w.x      ft2, a6
                  fsqrt.s      fa7, fs7
                  fsub.s       fs1, ft9, fs5, rdn
                  div          s6, s7, t0
                  fcvt.wu.s    a6, fs8
                  sra          a4, t5, s1
                  andi         sp, s3, 766
                  fmv.x.w      a5, ft5
                  sra          t6, gp, s0
                  fmin.s       ft3, ft7, ft9
                  rem          s7, t3, gp
                  fsgnj.s      fa2, ft0, fs1
                  fadd.s       fa4, fs7, ft2
                  lui          a3, 1003979
                  fsgnjn.s     ft11, fs11, ft8
                  remu         a7, a6, a4
                  fcvt.w.s     s9, ft3
                  sll          a4, a0, ra
                  srai         t5, a4, 15
                  div          s4, t5, s9
                  andi         gp, a1, 1150
                  sra          a4, a4, a1
                  add          s2, t6, zero
                  srli         a0, a6, 16
                  or           gp, a1, a0
                  fdiv.s       fa3, fs8, fs6, rdn
                  andi         a7, s7, 917
                  fmv.w.x      ft6, sp
                  mul          a6, tp, tp
                  fsgnjn.s     ft0, ft6, ft8
                  sll          a6, s7, s4
                  fcvt.s.wu    fs7, t2, rne
                  fle.s        ra, ft1, ft11
                  mulhu        s8, s10, a3
                  rem          s5, sp, a6
                  fmv.x.w      gp, ft11
                  fcvt.wu.s    gp, ft3, rne
                  add          a3, sp, s9
                  slli         t1, a5, 19
                  addi         s11, a0, -161
                  mulh         s1, s0, a5
                  sll          s4, t5, s1
                  fsgnjx.s     fs8, fs7, fa7
                  fsqrt.s      fa5, fa7
                  rem          zero, ra, gp
                  ori          zero, s8, 1023
                  fclass.s     s1, ft8
                  ori          s11, a6, -820
                  nop
                  mulhsu       s2, t3, a5
                  fmax.s       fs6, fs10, fs5
                  fsgnjx.s     ft8, ft9, ft10
                  srli         s10, a6, 6
                  xori         s11, s11, 123
                  addi         s2, ra, 693
                  fadd.s       fs11, fs6, fs3
                  auipc        s1, 525209
                  srl          s6, a7, a7
                  fcvt.wu.s    s1, fa6, rne
                  auipc        gp, 775153
                  remu         a0, tp, sp
                  fle.s        t1, fa4, ft0
                  fmv.x.w      sp, fs3
                  fmul.s       ft5, fs10, ft8
                  andi         a0, t5, 1184
                  auipc        s4, 7053
                  divu         sp, zero, a1
                  sll          a1, s5, s8
                  fclass.s     s5, fs6
                  sltiu        s8, s3, -901
                  auipc        s11, 503695
                  srli         sp, s8, 19
                  sltu         sp, a6, s4
                  fsgnjn.s     fs9, ft9, fs6
                  ori          a4, s9, -1645
                  fcvt.s.w     ft5, a0, rne
                  divu         s0, s9, a3
                  fle.s        t1, fs3, ft10
                  and          t1, s4, ra
                  divu         t1, s9, s4
                  fmul.s       ft7, ft8, fa0, rne
                  srai         t6, s11, 13
                  flt.s        s7, fa7, fs7
                  fmv.w.x      fs1, zero
                  slli         s7, a5, 10
                  fsgnjn.s     fa5, fs8, ft5
                  sra          sp, s8, t3
                  sltiu        s10, a3, -1363
                  sltiu        s0, s3, 1798
                  fcvt.s.wu    fs2, a3
                  rem          t1, s5, s10
                  lui          s11, 220468
                  sltiu        a5, a2, 551
                  fclass.s     a6, fs11
                  or           gp, s3, zero
                  or           s1, t6, tp
                  mul          s5, t6, a1
                  fcvt.wu.s    s11, fs5
                  remu         t1, t2, a1
                  slti         t4, a7, 2022
                  mul          t0, s2, ra
                  add          s0, a3, a1
                  nop
                  fsgnjn.s     fa1, fs6, fa4
                  fsub.s       fs4, fs1, ft6
                  fmul.s       fs4, ft6, ft0
                  auipc        s11, 220810
                  srai         a4, s6, 20
                  and          a7, a4, a6
                  srli         a1, t2, 7
                  fmv.w.x      fs5, a4
                  fcvt.s.wu    fs0, a2
                  xor          zero, s9, a6
                  fcvt.s.wu    ft1, a4, rne
                  sub          t6, t2, ra
                  fsgnjx.s     fs5, fa1, fs9
                  sltu         ra, a7, a2
                  fmin.s       ft8, fs5, fa6
                  srl          t6, s11, s7
                  fmv.w.x      fa7, t3
                  fmv.x.w      s7, ft10
                  sll          zero, a6, a7
                  addi         s7, s11, -1994
                  mulhsu       s4, s5, s2
                  fmul.s       fs11, ft2, fa7, rdn
                  sll          s1, s10, t2
                  fcvt.s.wu    fa7, s5, rtz
                  srl          ra, s2, t3
                  xor          a1, a3, zero
                  srl          s11, t4, s7
                  srl          t6, zero, t3
                  sll          s7, s6, gp
                  or           a5, s10, gp
                  xor          t4, t3, s6
                  xor          t1, s2, t4
                  nop
                  slt          s1, tp, t1
                  fdiv.s       fs0, fa1, fs6
                  auipc        a3, 7307
                  fsub.s       fs5, ft6, fa2
                  fmax.s       fs0, ft10, fs0
                  fcvt.s.w     ft5, a5
                  rem          s10, a6, t5
                  flt.s        t6, fs3, fa1
                  add          a4, s11, t3
                  xor          s0, s6, s3
                  fmv.x.w      a6, ft7
                  or           t2, a6, t3
                  fcvt.wu.s    sp, fs9, rdn
                  add          s8, t4, a6
                  sra          ra, a3, a1
                  fcvt.w.s     s2, ft5
                  fcvt.s.wu    ft8, s9
                  fcvt.wu.s    a1, fs11, rup
                  sub          s0, s9, t2
                  div          s10, t4, gp
                  sub          sp, zero, s11
                  remu         a4, s11, s9
                  xori         s4, s4, -799
                  nop
                  mul          s6, s10, t2
                  sub          a3, a3, s4
                  fcvt.w.s     a5, fs8
                  slti         s6, gp, -965
                  fdiv.s       fs0, fs5, fa0
                  sltu         s8, t0, s8
                  slti         s6, zero, -1408
                  fsub.s       fa7, fa5, ft2, rne
                  add          gp, s11, s10
                  auipc        zero, 399778
                  sll          zero, a6, t5
                  slt          gp, s9, a0
                  sra          zero, s7, s11
                  fcvt.s.wu    fs1, t0
                  add          a5, s0, s8
                  or           a6, s8, s7
                  addi         s5, t2, -640
                  auipc        a7, 471099
                  fadd.s       fs6, fa0, fs2, rmm
                  lui          t5, 176923
                  flt.s        s8, ft3, ft0
                  slli         s0, ra, 2
                  fle.s        a3, ft5, ft11
                  fadd.s       fs1, ft5, fs7, rtz
                  fsqrt.s      fa0, fs3
                  fsub.s       fa4, ft7, ft11, rmm
                  auipc        t0, 607740
                  sltiu        s6, s5, 968
                  addi         ra, t4, -1049
                  nop
                  rem          s3, s9, s0
                  mulhu        t4, s10, t3
                  fsgnjn.s     ft8, fa5, fa0
                  andi         t4, s8, -1010
                  sra          a5, a0, t1
                  xori         s8, sp, -1096
                  mulhsu       a4, s11, s0
                  fsgnjx.s     fa4, ft1, ft11
                  mulhu        a6, t1, a2
                  fcvt.s.w     fa0, tp, rmm
                  sll          a6, s9, tp
                  srli         s7, s3, 8
                  srl          t1, a6, t4
                  flt.s        s6, fs9, ft8
                  mul          a3, s3, t6
                  fmax.s       fs11, ft7, fs4
                  fle.s        t6, fa0, ft1
                  mulh         s9, a7, s1
                  fmv.w.x      fa1, t2
                  fsgnj.s      fs9, fa0, fs1
                  ori          a0, s0, -871
                  srli         s7, t6, 26
                  fle.s        s6, fs11, fs8
                  divu         s2, s1, s4
                  flt.s        a0, fa2, fs0
                  fcvt.wu.s    t1, ft6, rtz
                  sub          zero, s9, gp
                  fcvt.wu.s    s0, fa5, rdn
                  fdiv.s       fs2, ft3, fs11, rmm
                  fcvt.s.wu    ft5, s0
                  fsqrt.s      fs5, fs0
                  flt.s        s2, fa7, ft10
                  fle.s        s2, fa5, fa4
                  mulhu        t1, t6, s2
                  sub          a5, zero, s10
                  slli         s0, a5, 30
                  slli         a4, s11, 0
                  fcvt.s.w     fa7, s4, rtz
                  fsgnj.s      ft11, fa5, fs0
                  fsub.s       fs2, ft11, ft0, rne
                  fcvt.s.w     fa1, a4
                  sub          t2, s6, s9
                  sltu         t0, s9, a2
                  auipc        s1, 384118
                  slti         s9, s11, 676
                  flt.s        s9, ft4, fs0
                  srli         a4, s8, 1
                  auipc        t2, 414312
                  lui          s7, 336567
                  or           t5, s4, t4
                  slt          a3, a6, s0
                  ori          a1, t1, -1016
                  mulhsu       t2, s7, s9
                  remu         a7, a1, s1
                  lui          a1, 770606
                  fclass.s     ra, ft0
                  fdiv.s       fs6, fs0, fs10, rup
                  fmax.s       ft2, fa2, fa7
                  and          s8, tp, s1
                  fcvt.s.w     fa3, t3, rtz
                  remu         t1, tp, s0
                  mulh         a3, s5, a2
                  sll          t0, s10, s1
                  fadd.s       ft9, fa7, fs8, rdn
                  div          ra, a0, s10
                  slli         s2, s10, 27
                  fmv.w.x      ft6, s9
                  xori         a7, s8, 705
                  fsub.s       fs3, ft4, fs2
                  fcvt.s.wu    ft6, s0, rmm
                  fmul.s       ft3, ft3, ft4
                  flt.s        s9, fs9, fa5
                  srli         s4, t1, 4
                  mul          t1, a5, s8
                  mul          s3, t3, a7
                  srai         s1, zero, 8
                  divu         a0, s2, s10
                  auipc        s2, 188927
                  slti         s6, s3, -1216
                  sra          s6, a0, s6
                  fsub.s       fs0, fa3, ft11, rne
                  fmin.s       fs11, fs11, ft0
                  fcvt.wu.s    sp, fa5
                  mulhsu       s10, s4, s9
                  ori          s11, a7, 640
                  divu         t1, a2, a2
                  flt.s        s3, fs9, fa2
                  fadd.s       ft11, fa3, fs3, rtz
                  sub          gp, ra, t5
                  xori         a1, a6, -1547
                  fmin.s       ft0, fa6, fs10
                  sltu         zero, s7, s9
                  fdiv.s       fa7, fs8, ft7
                  addi         s3, s8, -1671
                  fcvt.s.wu    ft0, t1, rmm
                  sll          s10, s10, s1
                  sltu         a0, t2, t2
                  fsgnjn.s     fa6, ft8, ft8
                  fsqrt.s      ft3, ft6
                  remu         t1, t4, a7
                  fsgnjn.s     fs5, ft0, fa0
                  sub          s1, s5, t1
                  fmv.w.x      fa7, a2
                  xori         s1, a7, -1018
                  remu         a3, tp, a4
                  ori          s8, s9, 1306
                  or           t6, gp, s3
                  fcvt.s.w     ft0, t5
                  fadd.s       fs1, fs6, ft0
                  fsgnjx.s     fa4, ft8, fs4
                  slt          zero, s4, s2
                  fsgnjn.s     fs8, fa2, ft7
                  slli         zero, t1, 15
                  add          a0, s9, a0
                  srai         s10, s7, 28
                  fsgnj.s      fs0, fs0, fa0
                  add          t4, s11, t4
                  fsgnjx.s     fa4, ft4, fa5
                  fadd.s       ft3, fs4, fa5
                  feq.s        s6, fs11, fs9
                  andi         s11, s10, -1268
                  slti         s7, s2, 1109
                  fmin.s       fs7, ft10, ft6
                  fcvt.w.s     t1, ft1, rup
                  fcvt.s.w     fa7, s6
                  fmv.x.w      t5, ft9
                  fmv.w.x      fs11, t1
                  and          sp, t1, t3
                  fsgnjn.s     fa7, ft4, ft0
                  or           s9, t6, t0
                  feq.s        t1, ft4, fa2
                  xor          s4, t4, s8
                  fcvt.wu.s    a7, ft6
                  rem          s7, ra, s11
                  remu         t5, s9, s4
                  lui          s8, 631911
                  slli         t0, a7, 14
                  nop
                  xor          s11, s0, ra
                  and          sp, t2, sp
                  fmul.s       ft1, fs5, fs11, rdn
                  rem          sp, a0, a7
                  sltiu        a3, t3, -925
                  mulhsu       t1, s7, s3
                  fsub.s       fs7, ft11, ft0
                  srl          s0, a5, tp
                  fadd.s       fa6, fs4, fs2
                  lui          s0, 918794
                  nop
                  srl          s10, t2, a5
                  sub          s3, s2, t3
                  div          a7, a2, sp
                  sltu         t6, t6, t3
                  xori         t0, t3, 370
                  fsgnjx.s     ft9, ft8, ft2
                  remu         s2, a5, a2
                  fcvt.s.w     ft1, t3, rdn
                  auipc        s6, 518405
                  or           zero, s3, t3
                  fsqrt.s      fs10, fs10, rtz
                  mul          a4, s8, t6
                  fclass.s     gp, fs0
                  fadd.s       fs2, fs8, fs1, rtz
                  slli         s10, a4, 3
                  fsgnjn.s     fs3, fa6, ft9
                  fmul.s       fs11, fa7, fs1
                  fmin.s       fs2, fs1, fs6
                  flt.s        s4, fa6, fs0
                  fcvt.s.w     ft10, sp, rup
                  fmax.s       fs3, fa4, ft7
                  fmul.s       ft7, fa5, ft11
                  fsub.s       ft11, fs4, fs7
                  divu         sp, sp, a1
                  fcvt.s.wu    fs6, a1
                  divu         a0, s1, t5
                  sub          t4, t4, ra
                  divu         s8, s8, tp
                  fclass.s     t1, ft11
                  flt.s        t6, fs4, ft5
                  fmv.w.x      ft6, s5
                  fmv.w.x      ft0, t3
                  fle.s        s9, fs0, fa2
                  mul          s4, s4, tp
                  mulhsu       s4, t6, t3
                  fmax.s       fs11, ft7, fs9
                  sltiu        s11, s6, 16
                  auipc        a7, 496816
                  div          s4, s4, zero
                  fsgnjx.s     ft0, fa1, fa3
                  andi         sp, zero, -1713
                  xor          t5, s9, a7
                  or           s5, s2, s5
                  flt.s        s3, fs5, ft5
                  fcvt.w.s     ra, ft7
                  flt.s        s3, fa3, ft7
                  slt          a7, s11, s6
                  fmul.s       ft11, ft4, ft4
                  auipc        gp, 750348
                  ori          t0, s7, 415
                  slli         t1, s10, 30
                  fcvt.s.w     fa3, a1
                  fmul.s       fs2, fs0, fa7
                  divu         t5, tp, t4
                  slti         s7, sp, 989
                  xor          t4, s5, ra
                  rem          t5, a0, a5
                  fsgnjx.s     ft11, fs5, fa5
                  fsub.s       ft7, fs0, fs1
                  mulh         s3, t3, tp
                  or           t1, a4, a4
                  divu         s2, a1, a3
                  feq.s        a3, fs4, fa4
                  fsqrt.s      fs4, ft1, rtz
                  fmul.s       fa5, ft3, fs3, rup
                  fsgnjn.s     ft0, fa5, ft1
                  sub          gp, t5, s5
                  mulhu        s11, gp, s8
                  fsgnjn.s     fa0, fs6, fa6
                  fcvt.wu.s    s1, fa2
                  flt.s        t1, ft8, ft7
                  div          s5, t1, a0
                  fcvt.w.s     t4, fs3
                  sll          s8, a1, s1
                  remu         s10, t2, s2
                  mul          s10, a5, s6
                  add          gp, s2, a5
                  fsqrt.s      fa7, fs6, rdn
                  fcvt.w.s     a7, ft1, rmm
                  srl          s4, a2, t2
                  srli         a7, t4, 1
                  fsgnjn.s     ft9, fs6, fa3
                  addi         a0, s10, -1307
                  sll          t0, sp, t3
                  srli         s2, s7, 28
                  mulh         a1, a4, s5
                  fdiv.s       fs9, fs10, fs11
                  lui          s3, 650515
                  andi         a4, a3, -2006
                  slli         t5, ra, 28
                  xori         gp, sp, -1056
                  mulhsu       t6, s10, s6
                  slli         sp, a0, 25
                  add          a1, t6, zero
                  sub          s5, gp, s0
                  fsgnjx.s     fs6, fa2, fa1
                  fle.s        a0, fa5, ft8
                  add          t6, a5, s0
                  andi         s6, s4, -1858
                  slti         s6, t1, 763
                  slli         s8, s4, 11
                  andi         t5, s4, -821
                  fadd.s       fs1, ft7, ft2
                  xor          s4, s7, tp
                  srai         s6, s4, 18
                  ori          a3, ra, 721
                  fsgnj.s      fa1, fs3, fs5
                  feq.s        s1, fa0, ft4
                  fsub.s       fa6, fs2, fa6
                  fsgnjn.s     ft6, fs7, fs6
                  srl          s2, s10, s4
                  feq.s        t2, ft1, ft4
                  mulhsu       s2, s9, t6
                  srl          s2, s0, gp
                  fmul.s       fa7, ft11, ft11, rdn
                  mul          a3, ra, s2
                  fle.s        s11, fa4, ft4
                  fclass.s     a3, fs4
                  srli         gp, a6, 1
                  rem          s7, a6, a0
                  fmul.s       fa6, fs7, fa7
                  fsgnj.s      fs1, ft0, ft8
                  fmin.s       fs1, ft11, fs10
                  flt.s        s11, ft11, fs2
                  xori         s3, t6, 1200
                  add          s2, a3, a4
                  fmv.x.w      t5, fs0
                  lui          a3, 6364
                  slli         a0, s5, 24
                  fmul.s       ft7, fa2, fs11, rtz
                  srl          s6, a1, s5
                  fmin.s       ft8, ft8, fa1
                  xori         a3, s10, -649
                  slli         s2, s0, 24
                  or           a3, s2, s10
                  add          ra, t5, s11
                  mulhsu       a6, a3, s10
                  fsgnj.s      ft0, ft6, ft8
                  or           a3, s2, tp
                  fmv.w.x      ft3, sp
                  fclass.s     s5, ft0
                  mul          a3, gp, a0
                  sub          t6, a4, a3
                  fmv.x.w      s4, ft0
                  rem          s10, s1, zero
                  divu         s0, s4, t5
                  slti         s0, zero, -1115
                  nop
                  lui          a7, 614566
                  fadd.s       fa5, ft10, fs8
                  mul          a0, s9, s1
                  flt.s        t4, ft4, ft5
                  slli         s9, t4, 6
                  fmin.s       fs3, ft3, fa3
                  sltu         ra, s5, t0
                  fmul.s       fs11, fs3, ft9, rmm
                  fcvt.w.s     s11, fa1
                  xori         s4, s2, 500
                  slti         a0, a7, -636
                  mulhsu       a4, s10, a4
                  fmin.s       fa7, fs6, fs10
                  fsgnjn.s     fs4, fa6, fa0
                  fsub.s       ft6, ft3, fa2
                  mul          a0, a3, a5
                  feq.s        s8, fs7, fa0
                  fmin.s       fa2, fs6, fs3
                  feq.s        s11, fs6, fa3
                  feq.s        a6, ft9, ft7
                  fsgnjn.s     fa3, ft8, fs4
                  or           zero, sp, s11
                  fdiv.s       fa5, fs7, ft3, rtz
                  fmv.x.w      a6, fa0
                  xori         s9, s2, -603
                  slli         s11, sp, 6
                  and          s10, zero, a4
                  fsqrt.s      fa6, ft7
                  srai         s11, s6, 27
                  srl          s3, t3, a3
                  xori         s3, s9, 627
                  sub          ra, t6, a4
                  fclass.s     s10, ft2
                  fmax.s       fa6, fa0, fs10
                  sltu         s0, a7, a6
                  add          s3, a5, s5
                  slt          s2, zero, s4
                  fclass.s     s4, fs6
                  fcvt.w.s     sp, fa0, rdn
                  ori          a1, s5, 1412
                  ori          s8, a6, -1268
                  fmv.x.w      ra, ft7
                  div          s10, t2, s10
                  sll          a5, s6, gp
                  fmin.s       fs3, fs2, ft2
                  divu         gp, s6, a5
                  sub          a4, s9, s7
                  slti         ra, t6, -708
                  slti         a5, t3, -685
                  feq.s        s3, ft1, ft9
                  slli         t1, a3, 1
                  fmv.w.x      fs3, s2
                  addi         t4, t2, 1106
                  sub          s8, s6, s6
                  fsgnj.s      fs8, fa4, ft6
                  fsqrt.s      fs0, fa1, rne
                  sra          s5, ra, s0
                  fmax.s       ft8, fa0, ft4
                  mulhu        sp, s4, a7
                  mul          a7, t2, a1
                  fmv.x.w      gp, fs11
                  fle.s        t4, ft5, ft9
                  srai         s11, a4, 3
                  sll          s6, s10, s2
                  fsgnj.s      fa3, fa1, fs8
                  fdiv.s       fs8, ft10, fa0, rdn
                  add          s9, s6, tp
                  and          t2, s1, s9
                  div          gp, s2, s1
                  sub          s5, a4, s3
                  nop
                  fsub.s       ft1, ft6, fs0
                  slli         s0, s1, 9
                  feq.s        t2, fs10, fs5
                  slt          s1, sp, t1
                  or           a7, s1, t0
                  feq.s        a5, fs0, ft10
                  mul          zero, a4, a0
                  fcvt.w.s     s4, fa3
                  lui          t4, 859313
                  sll          t6, tp, a5
                  xor          s8, a1, t2
                  fdiv.s       fs5, fs1, fa5
                  sltiu        t5, s6, 1633
                  mulhsu       s6, a5, t3
                  rem          a7, t1, t4
                  fcvt.s.wu    ft5, tp
                  fsgnjx.s     fa6, fs2, fa3
                  fcvt.w.s     s2, fs8
                  divu         a7, t5, t4
                  mulh         s1, t1, s0
                  fmax.s       fa5, ft5, ft2
                  flt.s        ra, fs7, ft2
                  fmin.s       fs6, fa4, ft6
                  srl          s4, s9, s3
                  fadd.s       fs8, fs8, fs5
                  andi         t5, a5, -1766
                  fclass.s     zero, ft9
                  mulhu        t4, s6, s5
                  fsub.s       fs4, ft8, fa5, rtz
                  div          s0, s8, a4
                  srai         a6, sp, 16
                  fmul.s       fa7, fs0, fa7
                  lui          s0, 1012081
                  srl          t4, a0, a4
                  fdiv.s       fa5, fs7, fa2, rtz
                  xori         s7, t1, 907
                  remu         t1, s10, t5
                  fsqrt.s      ft0, fa3
                  sltiu        sp, zero, 1051
                  xor          zero, t6, a3
                  feq.s        t0, fa4, fs0
                  nop
                  srai         s4, s6, 15
                  fsgnjx.s     fa3, fs3, ft7
                  fsgnjx.s     fa6, fs9, fa3
                  fdiv.s       fa1, ft8, ft4, rne
                  lui          s4, 382162
                  sra          s4, s11, zero
                  nop
                  add          s1, a2, a6
                  fle.s        s9, fa5, fs4
                  sra          a1, a7, s0
                  or           a5, t2, a0
                  remu         s4, s9, t2
                  slt          s11, a1, s4
                  feq.s        t4, ft7, fs0
                  slt          t5, s3, a1
                  sra          s5, t1, sp
                  or           a3, s2, a0
                  lui          s6, 576547
                  srai         a3, a7, 3
                  sltiu        sp, tp, 23
                  sra          s9, t1, tp
                  fclass.s     a3, fs11
                  feq.s        a5, fs1, fs11
                  remu         t1, gp, t6
                  feq.s        a6, fa7, fa3
                  lui          s9, 404587
                  fsub.s       fs7, fa1, ft8, rup
                  feq.s        s8, fa0, fa7
                  remu         a4, s1, s10
                  fsgnjn.s     ft4, fa0, fs3
                  or           a5, a7, t1
                  sub          t6, t1, s11
                  slt          s4, a5, s8
                  fsgnjn.s     fs6, ft6, ft9
                  slt          s4, a3, s2
                  fcvt.w.s     gp, fs7
                  add          a4, s4, t4
                  nop
                  fmv.w.x      fs8, t5
                  srl          t5, a7, a4
                  fcvt.wu.s    s7, fs4, rmm
                  sub          s10, a5, t3
                  fmax.s       ft0, ft10, fs1
                  fsub.s       fa3, fs2, ft8, rmm
                  slt          a7, s8, t4
                  addi         a0, gp, 1329
                  sub          s7, s9, s11
                  fle.s        a3, fa6, fa1
                  sll          gp, t3, s4
                  sltiu        s10, s11, 1326
                  and          t2, a1, a5
                  remu         t1, t0, s10
                  fsgnj.s      fa7, fs0, fs3
                  fsgnjn.s     fa2, ft5, ft9
                  srl          s2, ra, a2
                  fle.s        s5, fs8, fs2
                  add          s8, t2, zero
                  xor          s2, a4, a6
                  add          gp, t0, a2
                  fclass.s     s3, fs1
                  andi         a0, t4, -4
                  andi         a7, sp, -875
                  fcvt.wu.s    s4, ft10, rdn
                  fclass.s     a4, fa6
                  mulh         s11, s10, t6
                  fmul.s       ft1, fs4, fs0, rmm
                  fmul.s       fa0, fa2, ft9, rmm
                  mulh         s7, a0, a7
                  fsgnjn.s     fs4, fs10, fs11
                  div          zero, a5, s7
                  xor          s5, a4, gp
                  mul          t2, s0, tp
                  fsqrt.s      ft1, ft2, rup
                  sltu         s5, a6, t2
                  mulhu        a4, a7, t6
                  and          zero, s5, a3
                  feq.s        a1, ft0, fs6
                  fdiv.s       fs3, fa2, ft4
                  fsgnjn.s     ft4, fs0, ft1
                  rem          s9, t3, s2
                  fcvt.s.w     ft7, s6, rmm
                  mulhsu       a5, a4, s8
                  fcvt.w.s     s5, fa7, rne
                  andi         s11, t6, -1661
                  srli         ra, a0, 23
                  slt          t1, s1, s5
                  slti         s4, t2, -2044
                  lui          s8, 821705
                  fmv.x.w      t1, fa3
                  and          s10, s1, t6
                  mulhsu       s3, t6, t1
                  xori         t4, s3, 1923
                  xor          ra, s2, a4
                  sra          s9, a3, s11
                  fdiv.s       fs0, ft11, ft9, rdn
                  fcvt.wu.s    s8, fa5, rtz
                  andi         a1, t2, 1285
                  fle.s        s3, fs10, fs2
                  fmul.s       fs9, ft4, ft10
                  rem          s1, s4, s0
                  fcvt.s.w     fa1, t5, rmm
                  fmul.s       fs6, fa1, ft2, rne
                  slti         ra, a6, 223
                  fmax.s       fa0, ft0, fs4
                  sll          a5, t0, s6
                  addi         s1, t5, 1805
                  fmax.s       fa1, ft2, fs5
                  mulhsu       a1, t3, s5
                  fcvt.s.wu    fs8, s2
                  auipc        s6, 538982
                  mulh         zero, s6, a5
                  ori          t6, a6, 130
                  fmin.s       ft7, ft2, fa3
                  mulh         gp, s1, t6
                  slli         t5, t3, 8
                  flt.s        t2, ft11, fs7
                  fmax.s       fa3, fs7, fs6
                  sub          s4, ra, s10
                  fcvt.wu.s    s6, fa7, rdn
                  fcvt.s.wu    ft7, gp, rne
                  ori          sp, s2, 1913
                  srli         t1, a2, 25
                  fmv.w.x      fs10, t5
                  or           t2, s7, a6
                  fcvt.s.w     fs11, s4
                  srli         s0, s0, 1
                  ori          t5, t4, 456
                  sltiu        s0, t4, -1603
                  auipc        zero, 50504
                  feq.s        s7, fs8, ft2
                  sub          s8, t3, tp
                  fdiv.s       fs0, fa1, ft7
                  srai         t2, s5, 25
                  fsgnj.s      fa7, fa4, ft6
                  feq.s        s10, ft10, fa7
                  fcvt.w.s     gp, ft3, rtz
                  slti         a0, ra, 1329
                  feq.s        s6, fa1, fs5
                  mulhu        s6, t1, t1
                  slli         ra, a1, 2
                  fsub.s       ft1, fs5, fs10
                  xor          a5, s10, s1
                  sra          a0, s6, t6
                  slt          s4, a3, s3
                  auipc        a5, 198085
                  sra          s11, s3, a0
                  fadd.s       ft7, fa6, ft5, rup
                  fsgnjn.s     fs4, fs2, fa1
                  fsgnjn.s     fa5, ft7, fa3
                  mulh         a3, s5, a3
                  xori         t4, s3, 946
                  fcvt.wu.s    s11, fa1, rmm
                  fmax.s       fs6, ft4, ft6
                  sll          s7, ra, sp
                  xor          a4, sp, a4
                  fmv.x.w      s3, fa7
                  mulhsu       a1, a5, t3
                  fmax.s       fs0, ft3, fa2
                  fmul.s       ft6, fs2, fs7
                  addi         a5, ra, 798
                  xori         t2, s1, 317
                  feq.s        a7, ft1, ft0
                  fmul.s       fa2, fs11, fs3
                  auipc        a6, 914975
                  fmv.w.x      fs8, a4
                  sub          s2, ra, s5
                  slt          a1, s10, a4
                  fadd.s       fa7, fa1, ft2
                  remu         s3, a7, t6
                  fcvt.w.s     gp, ft4, rmm
                  sltu         s2, s0, s1
                  add          s4, s8, s1
                  fmin.s       fs10, fs4, fs6
                  feq.s        a6, fa3, ft7
                  fcvt.w.s     s2, fs11
                  flt.s        a3, fs3, fs0
                  addi         a5, a7, 15
                  fmv.w.x      fs7, t6
                  or           s6, a6, a5
                  sltu         s1, ra, s7
                  fmax.s       ft0, fa2, fs8
                  slti         ra, gp, -1815
                  fcvt.s.wu    fa6, s6
                  flt.s        s3, fs4, fa4
                  fle.s        s7, fs3, ft2
                  div          t4, a2, a3
                  fsgnj.s      fa6, fs5, fs6
                  mulh         s7, s1, a7
                  or           t6, ra, s11
                  rem          s4, t3, gp
                  or           s2, t6, a5
                  fclass.s     a4, fa5
                  fmv.w.x      fs9, tp
                  fle.s        s11, ft4, ft10
                  slti         s2, s1, -81
                  or           s7, gp, a3
                  feq.s        t6, fa2, fs9
                  addi         a5, a7, 1578
                  fcvt.s.w     ft11, s5
                  xori         s7, a5, 735
                  fsqrt.s      ft8, fa1, rtz
                  and          a1, gp, s6
                  fcvt.w.s     s11, fs6
                  fsub.s       fs11, ft4, fs8, rmm
                  fmv.w.x      ft2, t3
                  fcvt.w.s     t2, fs6
                  fmul.s       fa1, ft10, fs9, rdn
                  mul          s9, gp, ra
                  feq.s        t4, ft7, fa1
                  andi         s11, s10, -1475
                  fadd.s       ft8, fa3, fs0
                  fcvt.wu.s    a5, fs8
                  mulh         s8, a2, a4
                  fsgnjn.s     ft6, fs7, ft6
                  fclass.s     s7, fs9
                  feq.s        s0, ft11, ft2
                  fcvt.s.w     ft3, a3
                  slli         a5, t6, 15
                  xori         a1, s11, 1587
                  sltiu        s6, s6, -1242
                  nop
                  mulh         t2, a4, ra
                  sub          zero, s4, s3
                  add          a5, s8, a3
                  fmv.x.w      a1, ft9
                  feq.s        gp, fs2, fs10
                  fmul.s       fa3, fa2, fs10, rdn
                  div          ra, ra, t3
                  fadd.s       fs3, fa5, ft11
                  fdiv.s       ft8, ft10, ft4
                  or           s1, sp, s5
                  xori         s7, s8, -1538
                  add          t0, s6, a4
                  lui          s2, 302484
                  ori          s3, s8, 211
                  srai         a3, t0, 26
                  and          s1, a1, t5
                  fsgnjn.s     fs3, fa2, fs5
                  remu         t4, a6, s6
                  fdiv.s       fs10, ft2, ft5, rne
                  addi         a1, s4, 376
                  srai         s11, gp, 13
                  feq.s        t1, fa2, fs11
                  ori          s11, a6, 764
                  divu         t5, s3, a7
                  sll          ra, a1, sp
                  fdiv.s       fs5, fs8, ft8, rne
                  fadd.s       ft11, fs10, fs4, rup
                  sub          a4, s6, s6
                  xor          a0, gp, s10
                  xor          s11, zero, a5
                  xori         a0, a3, -313
                  rem          a6, s2, s7
                  sll          s3, zero, s8
                  ori          s7, s9, -301
                  fmin.s       ft2, fa7, ft6
                  sltu         a6, s8, a1
                  xor          s7, t4, tp
                  sub          gp, s1, a3
                  fmv.w.x      fs10, s3
                  or           a1, t2, s4
                  sra          s11, a1, s10
                  fmin.s       fa1, ft0, fa1
                  nop
                  ori          s11, a5, -107
                  slt          t2, s7, t1
                  xori         s6, s10, 1335
                  fsqrt.s      fa1, fs11, rmm
                  flt.s        t6, fs9, ft4
                  fdiv.s       fa2, fa5, fs5
                  ori          t5, gp, -1659
                  fsgnjx.s     fs1, fa5, ft0
                  mul          a6, s11, zero
                  fmin.s       fs2, ft6, fa5
                  mul          t5, zero, tp
                  fle.s        s4, fs5, ft2
                  feq.s        s9, ft3, ft1
                  fcvt.s.wu    fa0, a7, rdn
                  mulh         t0, t2, s8
                  fsub.s       ft6, fa5, ft10, rmm
                  feq.s        s11, fa5, fs1
                  mulh         t5, a7, t0
                  xor          sp, a1, s0
                  srl          t4, tp, a4
                  fclass.s     s1, ft2
                  lui          s9, 745028
                  div          s10, t0, s11
                  fcvt.s.w     fs5, a0
                  fle.s        t1, ft7, fs0
                  andi         s6, s8, 1913
                  fcvt.wu.s    s9, fs3
                  divu         s10, s5, t0
                  srl          t0, t2, a4
                  remu         a5, t0, s9
                  fadd.s       fa2, ft1, fs11
                  srai         s0, t4, 26
                  mulhsu       t6, a4, s9
                  slti         a4, tp, 467
                  ori          s9, t5, 241
                  fclass.s     s10, fs7
                  sub          t5, s1, ra
                  srai         sp, t3, 12
                  addi         t4, a7, 536
                  fsgnjn.s     fs1, fs4, ft0
                  fclass.s     a1, fa3
                  auipc        a0, 349185
                  fsgnjn.s     ft10, ft3, fs3
                  srai         t6, a0, 30
                  and          t6, a7, ra
                  mul          t4, s1, s4
                  srli         t1, gp, 26
                  ori          s10, s3, 1649
                  fcvt.s.w     fs7, s2, rtz
                  slt          s11, t6, a1
                  sub          s1, a6, t6
                  mulhsu       s10, a7, s8
                  lui          a5, 579734
                  fcvt.w.s     s8, fs8, rdn
                  sra          t4, s11, t2
                  fsub.s       fs8, ft5, fa3
                  rem          s1, s9, tp
                  fmin.s       fa4, ft3, ft7
                  fsgnjn.s     fa4, ft5, fs11
                  andi         s1, t2, -1118
                  mulh         t4, ra, a4
                  addi         s11, s2, -865
                  div          s4, s10, s2
                  fadd.s       fs5, ft7, ft10
                  fmin.s       fs2, fa7, ft8
                  lui          s10, 456435
                  mul          s6, s9, a6
                  addi         a1, s9, -76
                  fsub.s       ft0, fs10, ft11, rne
                  sltiu        s5, t1, -39
                  mulhsu       s11, a7, s1
                  add          a4, t4, a3
                  slli         gp, t2, 5
                  sub          s9, a1, a6
                  fmin.s       fs1, fs7, ft8
                  fmv.x.w      s10, fs8
                  srli         s4, a6, 1
                  mulhsu       s9, s7, s2
                  srai         s5, zero, 30
                  fle.s        s4, ft8, fs8
                  fmul.s       fs8, fa7, fa2, rmm
                  slli         a6, s2, 14
                  feq.s        s0, ft6, ft11
                  fle.s        s10, ft9, fs7
                  ori          t1, ra, -2023
                  fcvt.wu.s    s1, ft11
                  fmax.s       fs6, ft2, ft5
                  fmul.s       fs3, ft5, ft0, rtz
                  sll          s9, t1, s6
                  fmv.x.w      t2, fs8
                  ori          s3, t4, -1039
                  sub          t6, s11, a5
                  fsgnj.s      fs9, fs1, ft3
                  slt          a1, a5, a3
                  add          a1, gp, a2
                  rem          s5, s2, a0
                  fle.s        s5, ft11, ft4
                  fcvt.wu.s    t4, fs5, rtz
                  ori          s7, s6, -1497
                  fsub.s       fs4, fs11, fs10
                  fsqrt.s      ft4, fa6, rtz
                  mulhu        t4, t0, s4
                  divu         s6, a2, s10
                  fsgnjx.s     fs7, fs5, ft8
                  add          t2, s5, t2
                  mul          a1, s2, s8
                  fcvt.s.wu    fs5, a1, rup
                  fle.s        s1, ft0, ft3
                  fmv.x.w      a4, fs4
                  fmax.s       fs4, fa1, fs9
                  fclass.s     s8, ft3
                  and          a6, t2, s4
                  div          s4, a7, a3
                  fcvt.s.wu    fa6, t6, rtz
                  fsgnjx.s     ft10, ft7, ft2
                  addi         t1, s7, -195
                  fclass.s     s5, fs7
                  rem          a6, s10, t4
                  fsgnjx.s     ft6, fa4, fs10
                  or           t4, s6, s0
                  or           s3, s11, s9
                  mulh         a0, s0, sp
                  fmv.w.x      fs5, a3
                  fmul.s       fa0, ft9, ft1
                  fsgnjn.s     fa0, fa6, ft9
                  remu         a5, a4, t4
                  xori         t6, a7, 591
                  divu         t0, a2, t6
                  fcvt.w.s     s4, fs11, rmm
                  srli         a6, a7, 0
                  fmv.x.w      t1, fa3
                  mulhsu       gp, s8, a3
                  fsqrt.s      fs9, fs9, rne
                  mulhsu       s3, a1, s5
                  sltiu        t1, t3, -299
                  slli         a7, s5, 13
                  fle.s        sp, fa3, ft9
                  slli         t4, gp, 6
                  fcvt.s.wu    fs2, a3
                  feq.s        s1, fs11, ft0
                  fsgnjx.s     fs2, fa0, ft8
                  fmin.s       ft10, ft8, fs7
                  mul          s4, s0, s3
                  slti         a3, s5, 1836
                  rem          s11, t2, t6
                  fcvt.wu.s    a4, fs2, rmm
                  feq.s        a3, ft3, ft9
                  fcvt.s.w     fs5, sp
                  fmin.s       fs3, ft4, ft10
                  auipc        s11, 881553
                  sra          t6, t3, tp
                  fcvt.wu.s    t6, ft1
                  slti         a3, a3, 1980
                  fsgnj.s      ft10, fs10, fa7
                  fsgnj.s      ft6, fs1, fs8
                  ori          a1, t3, -1047
                  fsgnj.s      fs3, fa7, fs11
                  fcvt.s.w     fs2, s10, rne
                  fle.s        s5, ft11, fs5
                  sltiu        a3, a4, 9
                  rem          s9, a6, a7
                  nop
                  remu         t1, s10, zero
                  sll          a4, a4, a0
                  and          a1, a0, t2
                  fcvt.w.s     sp, ft7
                  slt          t0, gp, t5
                  flt.s        a5, ft8, fa7
                  mulhsu       s7, t2, s2
                  fmax.s       ft3, fs7, ft1
                  slti         t2, s7, -490
                  div          a6, s5, s6
                  divu         s1, ra, t2
                  div          s4, gp, s5
                  fcvt.s.w     ft3, a6
                  fsqrt.s      fs6, fs10, rtz
                  srli         s10, sp, 11
                  fmax.s       ft1, fa3, ft0
                  sll          t1, a1, sp
                  fcvt.s.w     ft3, a5, rdn
                  divu         s3, sp, a7
                  sltu         zero, a1, t5
                  fmv.x.w      a5, fs6
                  lui          s5, 182310
                  sltiu        zero, s6, 1463
                  mulh         gp, tp, t1
                  remu         t1, s2, s1
                  mulh         a7, s7, a2
                  mul          s11, a5, s10
                  remu         s6, t0, s10
                  andi         a3, ra, -406
                  fmin.s       ft10, ft10, ft9
                  fmv.w.x      ft4, a4
                  srai         s9, s4, 23
                  or           s6, a6, s4
                  fmv.w.x      ft10, s1
                  fdiv.s       ft6, fa2, fa0, rup
                  xori         a4, a7, 1252
                  fmax.s       fs8, fs6, fa6
                  mulhsu       a3, a4, a5
                  mulh         s6, s1, s4
                  fmv.w.x      ft6, s9
                  fsgnj.s      ft10, fs2, fs10
                  and          a4, t1, t6
                  fsub.s       fs4, fa7, fa4
                  fmv.w.x      fs8, s8
                  slli         a7, t1, 22
                  srai         gp, s5, 24
                  divu         s7, a5, t5
                  auipc        a0, 153731
                  fle.s        t1, fa4, fs10
                  sltiu        s5, s2, 15
                  slti         s2, t5, 1015
                  sltu         t4, s0, a1
                  fcvt.s.w     ft8, t3
                  fmul.s       fs10, fa7, fa5
                  div          gp, t0, a2
                  fmul.s       fa5, ft9, ft5, rmm
                  slt          zero, a3, t1
                  fsgnj.s      fs7, ft4, ft3
                  andi         t2, s3, 1602
                  fmin.s       ft3, fs2, ft6
                  xori         s8, t5, -346
                  sll          t6, s3, t4
                  sra          t0, a1, zero
                  fmax.s       fa0, fs10, fs7
                  fcvt.s.wu    fs10, a7, rdn
                  fsgnj.s      ft7, ft2, fs4
                  sub          gp, t0, s7
                  fsqrt.s      fa1, fs8
                  sub          s10, a3, a5
                  feq.s        a0, fa3, fa2
                  fadd.s       fa7, fs4, fa5, rne
                  lui          s6, 291919
                  fmul.s       ft0, fs0, ft7
                  fcvt.s.w     fs4, t2
                  remu         a4, s0, t1
                  mulh         sp, a6, a2
                  and          ra, t4, zero
                  fsgnjx.s     ft4, fa0, ft2
                  and          a0, a1, gp
                  fadd.s       fs8, ft7, fs3, rup
                  slli         zero, zero, 0
                  srai         a3, s8, 13
                  fmax.s       fs4, ft11, ft6
                  mul          s6, a2, s7
                  fsgnj.s      ft4, fs3, ft11
                  feq.s        s1, fs11, fa7
                  div          t1, t1, t6
                  nop
                  lui          a7, 963192
                  fsgnj.s      ft6, fs9, ft8
                  nop
                  srli         s5, a3, 26
                  slli         t1, gp, 10
                  auipc        gp, 866382
                  mulh         a6, a2, s11
                  fcvt.s.wu    fs8, t6
                  or           a7, s10, t3
                  fsqrt.s      fa2, ft5, rne
                  fadd.s       fs1, fs0, fs10
                  ori          gp, s11, 1599
                  mul          a6, a4, a0
                  mul          s5, t4, s4
                  fsub.s       ft3, fs1, ft1
                  slt          s9, a4, a5
                  sltiu        a3, s3, 1084
                  mulhu        t5, s1, a3
                  mul          sp, gp, s2
                  fsqrt.s      fa0, fs5, rtz
                  andi         zero, s1, 1997
                  slt          a1, a4, ra
                  fmul.s       fa1, fa3, fs9, rne
                  srai         a6, a3, 25
                  auipc        s8, 406629
                  srl          s10, t1, a4
                  sltu         a4, s9, s7
                  fsub.s       ft10, fs5, ft3
                  fadd.s       ft7, ft3, fa2
                  xori         a6, s3, -1130
                  flt.s        a1, ft1, fs11
                  sub          a7, ra, t5
                  fadd.s       ft1, fa4, fa3
                  fmv.x.w      t4, fs5
                  sltu         zero, tp, a1
                  fdiv.s       fa0, fs5, ft0, rtz
                  sltu         t4, a2, t4
                  mulh         s8, tp, s2
                  fcvt.w.s     t4, fs5, rne
                  fsqrt.s      fa3, fs5
                  divu         t4, gp, t3
                  srli         a1, s6, 18
                  fmin.s       fa2, ft4, fs8
                  fsqrt.s      fs9, fa7, rdn
                  fcvt.w.s     sp, fs0, rup
                  fadd.s       ft6, fs2, ft6, rtz
                  andi         s10, t3, 786
                  sub          s5, s11, s3
                  fsgnjn.s     fa3, fa2, fs1
                  fmax.s       ft4, fs7, ft4
                  flt.s        s1, fa3, fs8
                  fsqrt.s      fa4, ft6, rne
                  sll          s8, a2, s6
                  sltu         a5, a5, t1
                  mulh         s10, tp, a7
                  fdiv.s       ft6, fs11, ft8
                  fmv.w.x      fs10, tp
                  fmax.s       fs0, ft9, ft11
                  feq.s        a0, fa4, fa3
                  slli         t1, s8, 28
                  sra          t4, t1, s2
                  sll          gp, zero, s9
                  fclass.s     sp, fs0
                  fcvt.s.w     ft1, t4
                  sra          a5, t1, t2
                  sll          ra, a1, s4
                  feq.s        s8, fa3, fs2
                  or           t4, s3, t6
                  and          a4, a7, a4
                  mul          zero, t2, a0
                  divu         a6, a0, ra
                  fsgnjx.s     fs6, fa3, ft11
                  div          ra, s6, a1
                  feq.s        a6, ft0, ft9
                  sub          gp, tp, tp
                  srai         t6, s1, 13
                  fmv.w.x      fs8, a7
                  fmv.x.w      s7, fs0
                  remu         s7, s4, s4
                  fadd.s       fa0, ft2, fs11
                  mulh         s8, t5, s10
                  fsgnj.s      fa7, ft9, ft8
                  feq.s        sp, fa3, ft10
                  fmv.w.x      fa3, t1
                  sra          a5, s9, gp
                  srli         s4, a7, 27
                  fcvt.s.w     fs6, t0, rup
                  xor          t0, a1, a6
                  slt          s2, s2, s1
                  fclass.s     ra, fa1
                  fmul.s       fa2, fa1, ft8
                  nop
                  fadd.s       fa6, ft11, ft2, rmm
                  fcvt.w.s     a3, fa5
                  remu         s10, a5, a3
                  fmul.s       fa5, fa1, fa7
                  sltiu        t4, s3, -1341
                  or           s4, a2, a2
                  slt          a3, s5, t0
                  fcvt.s.w     fs3, s3, rtz
                  div          s0, t1, s3
                  srl          zero, sp, t4
                  or           s2, a1, sp
                  fmax.s       ft6, fa4, fa5
                  auipc        s7, 1043424
                  addi         s9, s7, 1529
                  fmv.w.x      ft7, s8
                  fmv.w.x      ft11, gp
                  fle.s        a3, fs0, fs7
                  or           s4, t4, t1
                  ori          t6, a5, 281
                  mul          s0, s2, gp
                  mul          a3, s9, tp
                  sltiu        a5, tp, 1950
                  xori         s5, ra, -719
                  xori         s1, s11, -34
                  div          s3, a0, tp
                  fcvt.w.s     t0, fs9
                  fcvt.wu.s    s8, ft5
                  or           s1, t6, s9
                  slli         a1, s2, 17
                  sltu         s5, t4, s0
                  sll          s5, t0, a6
                  fsgnj.s      fs8, fa7, fa0
                  fcvt.wu.s    a1, fs9, rmm
                  fmul.s       fa6, fa7, fs5
                  slti         s1, a1, -201
                  slli         a6, a4, 2
                  ori          sp, s6, 732
                  feq.s        t2, fa5, fs1
                  fcvt.s.w     ft2, s10, rne
                  mulh         a7, s6, sp
                  andi         a0, t5, -1079
                  feq.s        s9, fs6, fs10
                  fle.s        a1, ft0, fs6
                  fmin.s       fa1, fa0, fs0
                  fcvt.s.w     ft10, t0
                  fsub.s       fa2, ft11, fa5, rtz
                  andi         t0, s3, -1465
                  fsqrt.s      fs0, fa3, rmm
                  sra          s10, s3, a2
                  sub          a0, t2, s10
                  sll          ra, a3, a0
                  sltiu        s4, tp, -32
                  fdiv.s       fa3, ft10, fs7, rtz
                  fadd.s       fs4, fs0, fa4
                  fcvt.w.s     a5, fs11
                  auipc        a3, 395798
                  fmin.s       ft5, ft2, fa1
                  fmin.s       fa5, fs2, fs1
                  fclass.s     s8, fa1
                  remu         t2, s6, a0
                  flt.s        t5, fs7, fa6
                  xor          t1, s10, s8
                  srl          zero, a6, s0
                  or           a5, ra, s4
                  slt          ra, t0, s8
                  or           a4, a7, t3
                  lui          s0, 203791
                  srai         t1, tp, 3
                  fcvt.s.w     fs6, a1
                  fcvt.w.s     t6, fs7, rtz
                  fcvt.s.w     ft7, s7
                  div          t2, t1, s10
                  sra          s11, a2, s1
                  fclass.s     s1, ft0
                  and          gp, tp, t5
                  fcvt.w.s     t6, fs5
                  fmv.x.w      s8, ft2
                  fsub.s       fs8, fa4, ft0
                  fcvt.s.wu    fs6, s11
                  xori         sp, s2, 1451
                  srli         s1, s2, 30
                  fadd.s       fa5, fs3, fa1
                  sll          t4, t2, s3
                  xor          a6, t4, s0
                  feq.s        s2, fs4, fs8
                  addi         t4, a6, -1495
                  fsgnjn.s     fs4, ft11, ft1
                  feq.s        t4, ft9, ft9
                  auipc        s8, 619245
                  lui          a5, 466513
                  sltu         s6, a1, zero
                  slt          t6, a1, s1
                  xor          zero, s7, s2
                  mulh         a7, s7, t1
                  mulhsu       t6, t4, a6
                  auipc        s0, 407605
                  fadd.s       ft0, ft8, fs2
                  fcvt.s.wu    ft4, s5
                  fsgnjx.s     ft10, fs9, fs1
                  mulhsu       s0, a5, s6
                  fadd.s       fs9, fa2, ft5, rdn
                  sltu         t2, t5, s10
                  flt.s        s10, fs7, fa0
                  srl          s2, s5, ra
                  mulhsu       s3, zero, t4
                  feq.s        s8, ft0, ft10
                  fadd.s       fs10, ft1, fa2
                  and          a0, s8, s0
                  fclass.s     gp, fs10
                  sltu         t4, s5, s3
                  sub          a7, t2, s4
                  ori          s11, s7, 1902
                  srli         a7, t3, 13
                  fsqrt.s      ft3, fs8
                  fmv.x.w      a7, fs8
                  fsgnj.s      fa5, fs5, fs6
                  or           a1, s5, t5
                  fle.s        s6, fs5, fa4
                  srli         s0, s10, 8
                  mulhu        s6, gp, tp
                  fle.s        s9, ft4, fa1
                  add          a7, s10, gp
                  fadd.s       fa6, ft4, fa0, rmm
                  divu         s0, tp, s4
                  sra          s10, zero, s10
                  srl          t2, sp, a5
                  add          a4, s0, s0
                  fcvt.wu.s    a6, fa7
                  fdiv.s       ft4, fs1, ft7
                  srai         ra, a7, 13
                  fmax.s       fa0, fa7, ft3
                  or           s1, a2, a4
                  sub          s2, zero, s5
                  fmv.w.x      fa1, s10
                  feq.s        t6, fs11, fs2
                  fle.s        a3, fs11, fs8
                  div          s4, a4, s8
                  fdiv.s       fa7, fa6, ft3
                  slti         t5, ra, 82
                  mulhsu       gp, s11, s11
                  srli         s1, a1, 25
                  auipc        s8, 895835
                  fsgnjn.s     fs3, ft3, fa0
                  sltu         a6, sp, s11
                  sltu         s11, a2, s4
                  fsgnj.s      fs9, ft9, fa4
                  fcvt.w.s     s10, fs10, rdn
                  mul          a4, tp, s9
                  fdiv.s       fs11, ft6, ft5
                  fclass.s     s5, fs10
                  mul          gp, ra, s9
                  srl          t5, s7, ra
                  or           a4, s5, t0
                  fcvt.s.w     fa1, sp
                  mulh         a6, s1, a6
                  mul          s9, s9, s8
                  feq.s        s11, fa1, fs11
                  fsgnjn.s     fs4, ft5, ft4
                  fcvt.s.wu    ft6, a0
                  srl          t0, a5, s9
                  mul          s3, s4, s2
                  fle.s        zero, fa1, fs9
                  fsgnjx.s     fs0, fs2, ft7
                  addi         t5, a1, -1513
                  mulhsu       s10, t3, t0
                  fadd.s       fs1, fa1, fs8, rdn
                  flt.s        s0, fs10, ft9
                  sll          a5, t3, gp
                  fmv.x.w      s2, ft5
                  fadd.s       fa1, ft6, fa3
                  mulh         s9, a7, s3
                  fsub.s       fa4, fa2, fa5
                  srai         a0, s10, 28
                  ori          s5, a5, -931
                  fmv.x.w      t5, fa5
                  fcvt.wu.s    s9, ft3
                  srli         s5, a0, 12
                  fsqrt.s      ft4, fa2
                  remu         s1, s0, s3
                  mulhsu       a6, s3, s1
                  sltu         s4, s3, s4
                  add          t6, ra, zero
                  fsqrt.s      fs10, fs4, rtz
                  xor          t0, s2, s8
                  fsub.s       fa0, fs7, fa3
                  ori          s4, t1, -852
                  andi         a3, a0, 226
                  fsgnjx.s     fs5, fs10, fs5
                  rem          s5, a2, s3
                  srai         t6, s7, 19
                  sra          t2, s9, s4
                  mulhsu       t1, zero, a7
                  slt          s4, t4, s6
                  srli         a5, sp, 10
                  remu         a4, s9, a7
                  fsgnjx.s     fs3, fs10, fa5
                  flt.s        a4, fs7, fs4
                  fcvt.s.wu    fs9, s11
                  addi         s3, a0, 406
                  fdiv.s       ft6, fs8, ft8, rne
                  fcvt.s.wu    fs1, gp, rne
                  mul          a1, a4, s1
                  srli         a0, t6, 23
                  fsub.s       ft10, ft6, ft6, rdn
                  fmax.s       ft3, ft3, ft6
                  fcvt.s.w     fa1, s1, rup
                  slti         a0, a2, -1649
                  fmul.s       fs8, fs10, fa1, rdn
                  flt.s        s9, fs10, ft3
                  mul          t1, a1, a5
                  fcvt.w.s     a4, fs4, rtz
                  fmul.s       fs11, ft2, ft4, rne
                  fcvt.s.w     fs8, ra, rtz
                  feq.s        s10, fs4, fs5
                  srai         t6, s5, 14
                  or           t2, ra, s3
                  fdiv.s       fa2, ft10, ft0
                  fmv.w.x      ft2, t1
                  flt.s        ra, ft6, fa3
                  slli         a5, s5, 11
                  auipc        s7, 545481
                  flt.s        t1, ft2, fs5
                  or           a5, s6, a4
                  fclass.s     s1, fs6
                  xori         s2, s4, 808
                  srl          gp, tp, a3
                  srai         a5, t3, 12
                  fsgnj.s      fs3, ft9, ft8
                  feq.s        s3, ft8, fs8
                  fsub.s       fs5, ft6, ft3
                  auipc        s10, 484027
                  fsqrt.s      ft3, ft1, rdn
                  andi         s6, s4, -903
                  and          s0, tp, zero
                  rem          t6, a5, a5
                  slli         a0, s1, 21
                  fmin.s       ft4, fa5, fs9
                  lui          s5, 334965
                  mul          t4, a4, s4
                  xor          s10, s6, s9
                  fadd.s       ft9, ft0, fs1
                  fdiv.s       fa3, fa1, fs11, rup
                  slt          s4, t5, s11
                  slt          sp, a3, s2
                  fmv.w.x      ft10, t2
                  fcvt.s.w     ft6, s11, rmm
                  rem          a7, t5, t1
                  mulhu        a7, s7, s4
                  slli         ra, t3, 15
                  fsqrt.s      ft8, fs9, rtz
                  fclass.s     s11, ft10
                  fdiv.s       fa6, fs3, fs3
                  sub          s1, s9, s1
                  ori          a7, a4, 2026
                  andi         s11, t4, 911
                  fle.s        s8, fa3, fs3
                  mulhsu       s3, s6, t6
                  srli         s3, a2, 31
                  fle.s        gp, fa1, ft9
                  slt          t0, a1, t3
                  mul          s9, a3, a2
                  sll          t6, s9, t4
                  slli         t0, s0, 22
                  sltiu        sp, a4, -1513
                  fdiv.s       ft6, fs0, fs4
                  mulhu        zero, s9, t1
                  sub          ra, a5, s4
                  div          s10, sp, s9
                  fclass.s     s2, fs7
                  fcvt.wu.s    s3, fa5
                  slt          s7, a7, s0
                  slt          a3, t3, a6
                  sltiu        t4, s6, 466
                  fsgnjn.s     ft6, fs5, ft1
                  srli         s6, a4, 27
                  fcvt.s.wu    fa5, t1, rdn
                  fcvt.w.s     s3, fs2, rup
                  srai         ra, t1, 4
                  nop
                  fsub.s       fs0, fs9, fs8
                  fmv.x.w      s2, fs6
                  fsgnjx.s     fs11, ft5, fa3
                  fcvt.wu.s    s1, ft7
                  sltiu        s2, a1, 818
                  div          s4, s3, s10
                  srai         s0, a1, 30
                  fadd.s       fa7, ft4, fs7, rtz
                  lui          s3, 373075
                  slti         s0, t0, -688
                  remu         t2, s3, tp
                  fmax.s       ft4, fa3, fs0
                  fcvt.w.s     t5, fa0
                  mulh         s9, tp, s0
                  rem          s7, s5, a6
                  flt.s        s9, ft8, fa5
                  fcvt.s.wu    ft3, s8, rup
                  andi         s11, sp, 1843
                  fadd.s       fs2, fs11, fs9, rmm
                  fcvt.s.w     fa4, s7, rne
                  sra          gp, a2, t4
                  rem          s2, a0, s2
                  divu         s7, s7, a2
                  sll          a3, t4, s11
                  fcvt.wu.s    a0, fs2, rdn
                  fcvt.w.s     s9, fa1, rtz
                  fmul.s       fa6, fa4, fs2, rmm
                  fcvt.s.wu    ft6, t3, rne
                  fsgnj.s      ft8, ft0, fs5
                  feq.s        zero, fs3, fs7
                  mulhsu       t1, a0, a5
                  slt          a5, a3, a7
                  div          s0, t2, a3
                  fmv.x.w      ra, fa3
                  fsgnj.s      fa2, fs0, fa1
                  fcvt.s.wu    fs11, s9
                  fsgnjx.s     ft9, fs4, ft1
                  remu         s0, a7, t6
                  or           a6, s9, t3
                  fmul.s       fs0, ft0, ft2
                  lui          t5, 288897
                  sltiu        t5, s11, 1612
                  rem          s0, a2, s8
                  fsqrt.s      ft8, fa3
                  fcvt.s.wu    ft4, ra, rmm
                  sll          a1, t2, s8
                  flt.s        s11, fs0, ft7
                  fsgnjn.s     ft10, fa0, fa0
                  fcvt.w.s     zero, fs10
                  sub          zero, a2, s1
                  fadd.s       fs7, fa0, ft9
                  fcvt.s.w     fs8, s5, rne
                  fsqrt.s      fs1, fs5
                  fsgnj.s      ft8, fs11, fa2
                  fmv.x.w      s2, fs2
                  fmin.s       fs0, fa1, fs5
                  srai         gp, a2, 29
                  sltu         s11, tp, t6
                  sra          sp, t0, a1
                  mul          a6, sp, s5
                  sltu         s2, s9, a4
                  fsgnjx.s     ft7, ft9, ft8
                  divu         s0, t2, a1
                  fmul.s       fs10, fs4, ft5, rne
                  fsqrt.s      ft7, fs2, rmm
                  and          a7, a3, a0
                  mulhsu       s0, s11, s10
                  add          sp, a7, t1
                  fsqrt.s      fa4, fa7
                  fclass.s     s9, fs8
                  fclass.s     s9, fa2
                  fmv.x.w      a0, fa4
                  mulhsu       s10, s10, t2
                  mulhu        s11, t1, s7
                  lui          t0, 419892
                  fsqrt.s      fa0, fa5
                  addi         s3, t2, -1556
                  fdiv.s       fs4, fs8, ft11
                  slli         t2, s3, 17
                  sltu         s6, tp, a3
                  mulh         s6, s7, a7
                  auipc        ra, 1044936
                  nop
                  slli         a5, s4, 20
                  feq.s        t1, fa4, fs5
                  fle.s        a4, ft8, fa1
                  sra          s8, s1, s6
                  slt          a7, a7, a3
                  srli         s3, s6, 15
                  fdiv.s       ft3, fs8, ft2
                  sub          t6, t2, s6
                  remu         s1, a6, gp
                  addi         ra, a1, -1393
                  fclass.s     zero, fa0
                  and          s1, t2, t5
                  fcvt.s.wu    fs7, a3
                  slli         s4, s7, 19
                  mulhsu       t0, tp, a6
                  mulhu        zero, s6, t2
                  srl          t4, tp, tp
                  fmin.s       ft7, fs9, fa2
                  sltu         s6, a2, t4
                  fclass.s     gp, fs7
                  xori         a7, s4, -1081
                  fsgnjx.s     ft8, fs7, ft11
                  xori         t2, s8, 1003
                  fadd.s       ft5, fa0, fa5, rdn
                  fmin.s       fs2, fs9, ft6
                  mulhu        zero, s2, t2
                  div          s11, s10, s3
                  feq.s        s4, fs9, ft10
                  fmv.w.x      fa2, t5
                  mulhu        s3, s2, t6
                  mulhu        sp, s5, s8
                  fcvt.s.wu    ft8, a1, rne
                  slli         a4, s1, 20
                  sra          a4, a3, t3
                  andi         s7, gp, 2012
                  sltiu        s1, a5, 960
                  nop
                  or           s1, t4, s0
                  mulhsu       t2, a2, s6
                  xor          a7, sp, a0
                  remu         t5, gp, gp
                  addi         s1, a4, 1661
                  mul          s5, s4, s7
                  fdiv.s       ft8, fa0, fs2, rup
                  auipc        t2, 892758
                  fsgnjx.s     fs9, fs9, fs7
                  fsqrt.s      ft3, ft0
                  add          s2, t6, s7
                  fsgnjn.s     ft7, fs5, fa6
                  fcvt.s.wu    fa2, a1
                  fle.s        t1, fs2, ft10
                  fcvt.s.wu    ft11, t2, rdn
                  sra          a4, a4, tp
                  mulh         s1, a0, a6
                  fmv.x.w      s0, fs8
                  add          t4, s0, t3
                  fsgnj.s      fa4, fs11, fs3
                  fcvt.wu.s    a4, ft0, rne
                  fdiv.s       fs8, ft1, fs11
                  fsub.s       ft7, ft6, fs1
                  add          a4, zero, s6
                  sltu         s8, s4, s6
                  fmax.s       ft9, fs4, fa4
                  mulhsu       ra, sp, s9
                  srl          s10, a2, t6
                  divu         gp, s0, t1
                  fcvt.w.s     s3, ft5
                  and          s6, a6, s1
                  auipc        s0, 807940
                  slt          sp, a6, s9
                  fsub.s       fs1, fs9, fa3, rtz
                  fmv.w.x      fs0, a7
                  and          s0, tp, s10
                  sltiu        s9, t2, -2042
                  srli         a1, s5, 23
                  mulhsu       s11, a3, a0
                  mulh         t1, t2, a4
                  sub          s2, a7, a7
                  srai         t2, ra, 16
                  fclass.s     s4, ft7
                  fsgnjn.s     ft7, fs10, fa7
                  fcvt.s.wu    fa1, gp, rne
                  auipc        s5, 424750
                  auipc        s2, 924103
                  fmin.s       fs1, fs3, ft6
                  mulh         t0, t4, t5
                  mul          s8, s11, s6
                  fsgnjx.s     fa7, fa6, fa2
                  nop
                  fmv.x.w      ra, fs9
                  xor          gp, t6, s10
                  srl          a7, t4, t1
                  ori          s1, s7, -1242
                  slt          a0, s4, s10
                  fcvt.s.wu    fa6, a2, rne
                  fcvt.s.w     fs1, s9, rmm
                  slti         s9, t2, -223
                  mulhu        a7, a4, a3
                  xori         s9, s7, 1360
                  fmul.s       fs1, ft8, fs9
                  fmax.s       fs8, ft5, fa6
                  slli         ra, ra, 18
                  slti         t5, a5, -85
                  andi         t0, s3, 461
                  srl          s11, s11, s10
                  ori          s1, s8, -349
                  fdiv.s       ft6, ft10, fa6
                  srli         t6, a1, 26
                  fsub.s       ft10, fs2, ft6, rdn
                  xori         t5, s4, -237
                  mulh         a4, t1, t5
                  sub          a0, s4, a6
                  flt.s        t0, fa7, ft1
                  xor          t5, s6, s5
                  srl          s0, s9, a0
                  div          t0, a0, a3
                  mulh         a7, s7, t3
                  slli         a3, ra, 15
                  slti         t2, t5, 1671
                  sll          s10, a0, a0
                  fadd.s       fa3, fs0, ft3
                  andi         a7, s1, 896
                  fsub.s       fa2, ft7, fa3
                  or           s10, s9, ra
                  fsgnj.s      fs2, fa7, fs0
                  srai         ra, a1, 18
                  sub          t6, s2, a2
                  mulhsu       a0, gp, s6
                  fmv.x.w      s4, fa3
                  fmax.s       ft5, ft11, fs1
                  remu         s5, t6, s6
                  fcvt.w.s     a6, ft10
                  fsqrt.s      fs8, fa5
                  fsub.s       ft7, ft3, fs6, rmm
                  andi         t6, t4, 956
                  remu         t0, s2, s5
                  srli         a0, s8, 28
                  mul          s11, a0, s4
                  mulhu        a5, s5, a2
                  fmv.x.w      a5, fs7
                  fsub.s       ft9, fs2, fs9, rdn
                  fdiv.s       fs9, fs8, ft0
                  sub          s2, a3, a7
                  fdiv.s       ft8, fs3, ft11
                  auipc        s2, 756285
                  fsgnjx.s     fa1, fs7, fa4
                  fsgnjx.s     ft1, ft10, fs3
                  fsgnjx.s     fa3, fs9, fa3
                  sub          zero, s10, a5
                  mul          gp, a3, a5
                  fadd.s       ft8, fa1, fs5
                  fdiv.s       fs9, fs8, fa7, rdn
                  fmv.x.w      ra, fs11
                  mulhu        s1, s2, t2
                  divu         a0, a5, t6
                  fcvt.s.wu    ft3, tp, rtz
                  fsgnjn.s     ft11, ft1, fa1
                  sra          s4, s0, t5
                  nop
                  rem          s0, s5, tp
                  srl          t5, t4, a5
                  flt.s        t6, fs1, ft4
                  addi         gp, t0, -965
                  and          t2, sp, s11
                  remu         s10, zero, t4
                  fcvt.s.wu    ft0, t0
                  fadd.s       ft7, ft7, fs8
                  or           t2, s10, t1
                  fmax.s       fa5, ft7, fs0
                  fdiv.s       ft5, fa1, fs8, rne
                  and          s9, a3, t0
                  mulhsu       a6, s0, a0
                  fcvt.wu.s    a1, ft3, rup
                  divu         a0, a6, a0
                  slli         a0, s1, 20
                  sltiu        s1, s8, -1216
                  sltu         t2, s0, t3
                  fmax.s       ft6, ft2, fs11
                  slti         s10, s8, 947
                  andi         a0, s11, 994
                  sra          t2, tp, s3
                  slli         a4, a4, 20
                  sub          t5, s2, s1
                  or           a3, tp, t0
                  slti         ra, t6, -25
                  or           t4, ra, sp
                  remu         t4, s11, sp
                  ori          s6, t2, -351
                  fle.s        s5, fa1, fa3
                  fcvt.s.w     fs2, a4
                  rem          s0, s11, a2
                  auipc        s1, 356935
                  srli         a7, s11, 4
                  srl          gp, s1, s9
                  or           s7, sp, t1
                  slli         s3, s1, 18
                  fcvt.w.s     s7, fs5, rup
                  sra          s8, s7, t6
                  fcvt.wu.s    sp, fa1, rup
                  addi         t4, s2, -1395
                  remu         s8, s6, s3
                  mulh         a1, ra, a5
                  fsgnjx.s     ft5, fs3, fa0
                  add          a3, t3, a5
                  auipc        a4, 224199
                  sll          s9, t3, gp
                  fsqrt.s      fa0, fs2, rtz
                  fmax.s       fa7, ft3, fs7
                  xor          t1, s5, t2
                  fmax.s       fa1, fs0, fa1
                  fsgnjn.s     fs0, ft11, fs1
                  fsgnjn.s     fs5, fa5, ft0
                  fdiv.s       ft7, ft6, ft5
                  fcvt.w.s     t0, ft1
                  fcvt.w.s     t1, ft3
                  fcvt.s.w     fa4, t4
                  fcvt.w.s     a5, fa6, rdn
                  addi         t1, s0, -474
                  divu         a3, gp, t3
                  sltu         s4, s9, a6
                  srl          s7, zero, t6
                  fmin.s       fs4, fs7, fs2
                  fclass.s     s4, fs2
                  slt          s7, gp, s1
                  fsgnjn.s     fa6, ft8, fs7
                  srai         s10, t4, 3
                  sltiu        t4, s11, -1792
                  fmul.s       fs10, ft9, ft8
                  sltiu        a6, a1, -1482
                  sll          s8, t4, s1
                  feq.s        zero, ft11, fa2
                  sltiu        s10, s7, -76
                  fmv.x.w      gp, fs1
                  slti         a6, t5, 1482
                  sub          s8, a3, a1
                  srli         s11, a5, 3
                  fsqrt.s      fs10, fs6, rne
                  lui          s0, 464013
                  srai         a4, s8, 26
                  srl          gp, a7, s10
                  fmv.w.x      fa5, a0
                  srai         sp, a6, 1
                  rem          s5, s11, s5
                  lui          s8, 757671
                  slli         s8, a7, 8
                  fadd.s       ft3, ft4, ft6, rne
                  srl          s8, s8, s9
                  srl          s2, a3, a4
                  sra          s9, s3, s1
                  fcvt.s.wu    fa1, s9, rmm
                  fmul.s       fs3, fa7, ft1, rdn
                  sll          s9, t6, s4
                  xor          t4, a0, s1
                  or           a6, t6, a0
                  fcvt.w.s     s3, ft0
                  fcvt.w.s     t4, fs4
                  fdiv.s       fa0, ft8, ft4, rne
                  fsgnjx.s     fs6, fs1, fs11
                  fsqrt.s      ft4, fs7
                  nop
                  fsqrt.s      fs5, fs1
                  fdiv.s       ft2, fa2, fa1, rmm
                  slli         ra, a7, 31
                  sltu         s9, s4, t0
                  fmv.w.x      ft9, s8
                  mulh         a6, s10, t3
                  fclass.s     t1, fs4
                  add          a0, s4, s1
                  fcvt.s.w     fa1, s6
                  ori          a3, s11, -1300
                  fle.s        s2, fa7, fs6
                  fmax.s       ft8, fa0, fs3
                  mulh         s5, t5, a2
                  mulh         s4, s2, s3
                  flt.s        s1, fa1, fa6
                  srai         t2, t0, 9
                  fdiv.s       fa7, ft4, fa6, rup
                  srl          s4, s11, a6
                  slti         gp, t6, -1587
                  srai         t5, s6, 24
                  fsgnjn.s     ft5, ft4, fs8
                  sltu         a0, s3, a4
                  divu         s2, tp, s8
                  fcvt.wu.s    s0, fs0
                  and          s4, gp, a4
                  fcvt.s.w     fs5, a6, rup
                  addi         sp, a1, 755
                  divu         s7, sp, tp
                  fcvt.s.wu    fs1, gp
                  fdiv.s       fs5, fs4, fa7, rne
                  nop
                  slli         a5, a3, 3
                  slli         s1, a1, 30
                  fmul.s       ft7, ft9, fs7
                  flt.s        ra, ft0, fa3
                  nop
                  sra          a5, t6, sp
                  sra          gp, ra, s1
                  rem          t0, a3, gp
                  div          s9, a3, s11
                  srai         s6, s10, 31
                  fsgnjn.s     fa0, ft7, ft8
                  or           a4, t0, a7
                  mulhu        s2, t5, zero
                  fclass.s     s7, fs3
                  srli         s3, t6, 24
                  and          s10, tp, s5
                  fle.s        s6, fs5, ft10
                  add          a6, a1, t0
                  fsgnj.s      fs4, fs2, fs7
                  feq.s        a3, fa1, ft10
                  remu         s1, s10, tp
                  divu         s8, s9, a3
                  sra          a5, zero, s10
                  or           a1, a7, gp
                  fmin.s       fs8, fs10, ft4
                  xor          s9, t2, a7
                  fmax.s       fs6, fs9, ft2
                  srl          s1, t2, s0
                  fclass.s     s1, fs1
                  and          s6, sp, a1
                  divu         a7, a4, t1
                  fadd.s       ft0, fs8, ft9, rmm
                  flt.s        s2, fa6, fs8
                  fmv.w.x      ft6, sp
                  mulhu        s1, tp, s8
                  fcvt.wu.s    s1, fs10
                  fle.s        s7, ft5, fa5
                  fcvt.s.w     fs9, s11
                  div          t5, a5, t4
                  addi         a7, s2, 851
                  fclass.s     a4, fa4
                  fadd.s       fs2, fs6, fs2, rup
                  slt          s8, a7, t4
                  fmv.x.w      a0, fa7
                  fsgnjn.s     fs10, fs9, fa3
                  sra          t0, a3, tp
                  sra          s6, ra, ra
                  fmul.s       fa1, fa0, ft5
                  sub          s8, a6, s8
                  remu         s10, s10, t2
                  srli         a7, a5, 17
                  fmv.w.x      fs5, ra
                  mulhsu       s4, gp, tp
                  mulhu        s10, s3, t0
                  slti         sp, ra, -694
                  auipc        s3, 599002
                  addi         s3, a1, -1991
                  remu         a3, a0, gp
                  or           a0, a4, s0
                  mulhu        a5, s0, s0
                  fsgnjx.s     ft9, fa0, fa6
                  remu         s7, gp, ra
                  rem          t1, a5, t3
                  fsqrt.s      fa7, ft11, rmm
                  divu         s0, t1, s7
                  srli         ra, ra, 0
                  and          zero, a2, a0
                  addi         s9, t3, -1615
                  mulhsu       a6, sp, t5
                  sll          t2, a7, a1
                  fsub.s       ft4, fa5, fa5
                  mulh         a0, s0, t2
                  mulhu        t5, t4, a7
                  sll          t5, s11, s8
                  div          a4, a0, sp
                  fdiv.s       fs0, ft2, fa0, rdn
                  sll          t2, ra, a2
                  slli         s3, a7, 15
                  add          s10, s8, a6
                  srl          ra, a6, s9
                  fmin.s       ft10, fs10, fa5
                  sub          ra, s9, t3
                  ori          t4, a4, -706
                  add          a4, s6, s7
                  fcvt.w.s     s8, ft4, rdn
                  fmin.s       ft9, fa2, ft8
                  fdiv.s       fa5, ft4, fs6
                  feq.s        s11, ft3, fs2
                  fcvt.wu.s    s6, ft3, rne
                  fmv.w.x      fs3, a3
                  feq.s        s8, fs11, fs6
                  auipc        t2, 230749
                  srai         s4, gp, 24
                  fmin.s       ft11, fa6, fa3
                  fsqrt.s      fa5, fs9, rdn
                  srai         s9, tp, 13
                  and          t0, s9, s9
                  xor          a3, gp, a1
                  fclass.s     s4, fa2
                  mul          s3, a4, t4
                  fcvt.s.w     fa2, a3, rtz
                  and          a5, s9, t6
                  sltiu        s10, t1, 931
                  mulhsu       a6, t1, s8
                  add          zero, t6, tp
                  srli         a3, s3, 15
                  fadd.s       ft0, fa2, fs1, rdn
                  sra          s4, gp, s10
                  sltiu        s8, a7, 216
                  sltu         a0, a7, a0
                  sltiu        s11, s10, 1959
                  fsgnj.s      fs2, fs2, fs5
                  fcvt.wu.s    t1, fa2
                  div          t2, s4, t6
                  fsgnj.s      fs3, fa7, fs1
                  mulh         s2, s3, t1
                  sltu         a4, s11, t4
                  fle.s        gp, fa1, ft7
                  flt.s        s6, ft8, ft4
                  fclass.s     sp, fa2
                  xor          s8, zero, a4
                  or           t1, t2, s2
                  slli         zero, s5, 3
                  sub          t2, a6, t0
                  sra          s9, a4, tp
                  fsqrt.s      ft5, ft10
                  sub          s1, a3, s5
                  slli         a4, a7, 0
                  fmv.w.x      fa2, s8
                  fcvt.s.w     fs3, s8, rdn
                  fmin.s       fs2, fa6, fa7
                  fmv.x.w      t5, ft3
                  andi         t1, t1, 301
                  slli         t4, t5, 19
                  flt.s        s8, ft6, fs3
                  fsgnjx.s     fa2, ft1, fs11
                  fadd.s       fa1, ft2, fa2, rtz
                  sll          a4, zero, s0
                  fcvt.s.w     fs5, a3
                  fcvt.s.w     fs11, s7
                  fsgnj.s      fs6, fa4, fs4
                  mulhu        a0, zero, s8
                  sltiu        sp, zero, 58
                  remu         s0, s10, a4
                  sll          gp, s5, s0
                  sltu         a6, s6, s8
                  or           s1, s11, a2
                  fdiv.s       ft10, ft5, ft2
                  andi         s7, t2, 1108
                  srl          s2, sp, gp
                  fsgnjn.s     ft4, ft5, fs4
                  mulhu        t1, s11, t6
                  fmv.x.w      s10, fa0
                  fmul.s       fs11, ft5, ft2
                  feq.s        t2, ft2, fa1
                  mulh         gp, t3, s9
                  mul          s11, t4, a2
                  addi         s7, a2, -998
                  fcvt.s.w     ft10, t4
                  sub          a7, s10, t4
                  or           s0, a2, s6
                  sltiu        a6, s11, 897
                  and          t0, s0, ra
                  xor          s1, a6, a3
                  div          a7, s3, s0
                  sll          s4, a0, t5
                  mulh         a1, s9, s7
                  remu         zero, s7, zero
                  ori          a3, s2, -2009
                  fadd.s       ft9, ft7, ft11
                  and          t5, t3, s0
                  fclass.s     a5, fs2
                  fcvt.s.w     fa6, t2
                  mul          t2, s11, s10
                  fsgnjn.s     fa7, fs3, fs3
                  divu         s0, s0, t1
                  lui          s5, 820211
                  auipc        s2, 563115
                  flt.s        s9, fs6, ft1
                  add          sp, gp, t6
                  fclass.s     s5, fa4
                  rem          sp, a1, t3
                  fcvt.s.wu    ft11, s0
                  fadd.s       ft0, ft10, fa7, rtz
                  fsgnj.s      fa0, ft4, ft4
                  and          t6, t2, s4
                  fsgnjn.s     fs9, fs11, fs7
                  addi         a0, t3, -1341
                  nop
                  div          s10, a6, s8
                  fle.s        gp, fa7, fa1
                  fcvt.s.wu    ft8, s9
                  srli         a6, s8, 17
                  sra          s8, s7, a4
                  fdiv.s       ft1, ft9, fs1, rmm
                  srai         s1, s11, 9
                  fsub.s       fa6, ft11, ft5, rne
                  add          sp, t3, s11
                  fcvt.s.wu    fa4, a6, rdn
                  div          s8, s3, s1
                  lui          gp, 229234
                  fsub.s       fa7, ft4, fs3, rne
                  fcvt.s.w     fa1, t1, rdn
                  lui          s6, 750336
                  fcvt.w.s     s7, fs7, rmm
                  srli         s7, a4, 24
                  sub          s4, sp, s11
                  add          a7, s7, a2
                  divu         s7, zero, t1
                  srl          t6, s8, t5
                  fclass.s     t2, fa4
                  srai         s3, a5, 15
                  xor          t0, a6, t0
                  slti         a1, a3, -46
                  fmv.x.w      s1, fs2
                  fsgnjx.s     ft5, fa1, fa5
                  mulhu        s1, s3, a2
                  mulhsu       a1, a2, s2
                  fsgnjn.s     fs3, ft3, ft5
                  mulhu        a0, gp, s9
                  fmv.x.w      t1, ft7
                  xor          a7, s9, s8
                  add          s11, a3, s3
                  or           a1, s10, t0
                  sltiu        s10, sp, 1264
                  fsgnjn.s     fs0, ft1, ft0
                  srai         t5, s5, 4
                  sll          s10, s2, t4
                  fmv.x.w      a5, fs1
                  fcvt.s.w     fa0, a7
                  slli         gp, a4, 31
                  feq.s        s10, ft8, fs5
                  auipc        s7, 944372
                  auipc        s10, 672550
                  sra          t6, s6, a6
                  fcvt.wu.s    zero, fs1
                  remu         a3, s7, a3
                  sra          a0, a3, s6
                  fdiv.s       fa1, ft8, fa2
                  sub          a1, a4, tp
                  mulhu        s5, a4, s3
                  sll          gp, s3, a6
                  mulhu        s5, t0, s1
                  mulh         s9, ra, sp
                  sub          s0, s0, ra
                  fcvt.s.w     ft8, s5, rmm
                  fdiv.s       ft3, fs10, ft10
                  sll          a5, a2, a5
                  feq.s        s6, fs2, ft3
                  sltu         t5, t3, a6
                  remu         s7, s1, t5
                  sltu         s3, a6, s2
                  slti         s4, s2, 918
                  fsgnjn.s     fs9, ft1, ft7
                  rem          t2, a7, a2
                  sltu         zero, a4, s3
                  fcvt.s.w     ft2, a3
                  fcvt.w.s     s4, fa0
                  sub          s5, s7, t3
                  feq.s        s7, ft8, fs8
                  fmv.x.w      t6, fs0
                  fsgnj.s      ft6, ft6, fs10
                  sub          a5, s3, a1
                  fsgnj.s      fs4, fs1, fa0
                  fmv.x.w      s0, fs3
                  or           zero, t2, s3
                  add          a1, s4, t3
                  fsqrt.s      ft10, ft5, rtz
                  fcvt.wu.s    a3, fa1, rtz
                  and          s0, sp, s10
                  srl          s4, a7, a0
                  sll          s4, a2, a0
                  xor          s9, s4, a4
                  fmax.s       fs4, fs11, ft6
                  xori         s8, t4, 959
                  sltu         a5, t2, a3
                  srl          a1, s5, t1
                  fsgnj.s      ft6, ft6, ft1
                  fdiv.s       ft4, ft11, fs4, rne
                  fsgnjn.s     fa3, fs4, fs8
                  div          a4, s9, tp
                  auipc        ra, 191921
                  fadd.s       fa3, ft3, fa6, rne
                  fmv.w.x      fa1, a6
                  fmul.s       fs1, ft2, fa5
                  mul          zero, a0, sp
                  divu         a3, t2, a0
                  fcvt.wu.s    s8, fa1
                  xori         t2, s6, -894
                  sltu         t6, a4, tp
                  fdiv.s       fs1, ft9, ft3, rne
                  fcvt.w.s     t6, fa0, rmm
                  fcvt.s.wu    fs5, t0
                  mulhu        s5, t4, zero
                  fmv.x.w      a0, ft7
                  fmin.s       ft2, fa5, ft11
                  slti         a1, gp, 2027
                  fmax.s       ft10, fa6, ft3
                  sltiu        s3, s5, 954
                  or           s4, ra, a3
                  fle.s        a7, ft1, fa4
                  srl          s0, s10, t2
                  remu         s10, a3, t3
                  srai         s3, gp, 8
                  mulhsu       s1, t1, s1
                  feq.s        a4, fa3, ft10
                  fcvt.wu.s    gp, fs6, rdn
                  srl          gp, zero, t5
                  sll          s3, a2, gp
                  sltiu        a1, s8, -775
                  lui          a1, 207445
                  fmul.s       fa3, fs11, ft10
                  addi         t1, t3, 655
                  fsgnjx.s     fs1, fs6, ft4
                  remu         t6, t3, a1
                  remu         a1, gp, t4
                  xor          s1, a4, zero
                  xori         s2, a5, 46
                  lui          s5, 643887
                  mulhu        a7, ra, t2
                  fmv.w.x      fa6, s7
                  mulhu        a6, t5, s10
                  sra          t2, a1, s4
                  mulhsu       s2, s7, s9
                  fsgnj.s      fs6, ft4, fs3
                  slti         a0, s6, -118
                  fcvt.s.wu    fs5, s2, rdn
                  sll          s9, gp, tp
                  sra          s9, t0, a7
                  sltu         ra, ra, t2
                  sltu         s10, s5, t0
                  flt.s        s8, fs7, fs4
                  lui          a5, 798013
                  fmax.s       ft8, fa2, fs11
                  fcvt.w.s     s1, fa7
                  srli         gp, s5, 25
                  divu         s10, a6, s9
                  flt.s        t6, fs4, fs4
                  srli         t5, t5, 9
                  lui          a1, 641959
                  slli         s8, s11, 30
                  fsqrt.s      fs8, fs8
                  srl          a7, a0, s9
                  nop
                  fcvt.w.s     t5, ft4, rne
                  srai         t2, s5, 23
                  slt          a6, a3, s4
                  addi         t1, a2, -1638
                  mulh         s9, gp, t3
                  sub          a1, a5, t5
                  fsgnjx.s     ft5, fa0, fs0
                  auipc        s3, 500961
                  mul          t0, t2, ra
                  xor          t1, t2, s5
                  fdiv.s       ft6, fs4, fs6, rdn
                  fmv.x.w      ra, fs7
                  srli         a5, s1, 1
                  auipc        s4, 408619
                  sub          s11, sp, sp
                  srli         s7, s0, 9
                  sub          gp, t1, t1
                  fcvt.wu.s    a3, fa6
                  slli         t4, a4, 16
                  fmv.w.x      fs11, s10
                  flt.s        s2, fs0, ft3
                  fmax.s       fs8, fs10, ft10
                  srli         zero, gp, 7
                  xor          gp, s10, s5
                  fcvt.s.wu    ft1, s4
                  mulhsu       gp, s6, t5
                  fcvt.w.s     a4, fs7, rdn
                  fsub.s       ft6, ft8, fa6
                  fsgnjx.s     ft4, ft6, ft2
                  fsgnjn.s     fs5, fa6, ft3
                  flt.s        t5, fs5, ft1
                  sra          s1, a6, a7
                  fclass.s     t5, ft3
                  or           a4, a5, s3
                  srai         s11, tp, 10
                  fcvt.s.wu    ft1, ra, rup
                  addi         a6, s5, 673
                  div          a4, a5, s11
                  fsub.s       ft4, fs0, fs0
                  srai         s4, t6, 28
                  xor          t6, t6, a2
                  fadd.s       ft3, ft4, fs2, rup
                  feq.s        a4, ft3, ft5
                  xor          s5, s0, tp
                  andi         t0, s9, 1329
                  fcvt.wu.s    s7, fs7, rne
                  nop
                  or           ra, t3, t4
                  divu         t1, s10, a2
                  fclass.s     t4, fs3
                  sll          s3, s2, a1
                  div          a1, s0, a6
                  fmin.s       ft8, fa4, ft8
                  remu         s10, a2, s8
                  add          s4, s5, s11
                  fle.s        s11, fa4, fs6
                  fsub.s       ft9, fs7, fa0, rmm
                  fsgnjx.s     fa7, fa7, fs11
                  fle.s        a7, fs2, ft5
                  fmv.x.w      a5, fs5
                  add          a0, s5, gp
                  fle.s        a7, fa4, ft5
                  ori          s4, s2, -237
                  xori         t1, s1, 94
                  sub          t5, t0, t1
                  sltiu        a7, t2, -1747
                  divu         a5, t4, t3
                  srli         zero, zero, 28
                  sra          s4, a4, s0
                  fmax.s       fs5, fs9, fs10
                  addi         s10, a1, -806
                  or           s1, s11, t4
                  addi         s9, s10, 243
                  slt          zero, s9, s4
                  fcvt.s.wu    fa0, s9
                  sll          s7, s4, s1
                  fmax.s       ft4, ft5, fs10
                  srai         s6, tp, 16
                  fsgnjx.s     fs10, fs3, fa3
                  div          s10, s1, a3
                  mulhsu       s5, s6, t6
                  fmax.s       ft10, ft4, fs10
                  and          t4, t2, t5
                  fcvt.wu.s    t5, fa3
                  addi         a3, a6, -1091
                  xori         s5, s10, 1408
                  sra          t4, s7, zero
                  slti         t4, t1, -1311
                  fcvt.wu.s    t1, ft9, rmm
                  fcvt.wu.s    a4, fa4, rup
                  add          s0, s3, s3
                  slli         sp, sp, 23
                  srl          t1, s6, gp
                  ori          s3, s4, 994
                  sltu         s9, s10, gp
                  ori          t6, sp, -1850
                  fdiv.s       fa5, fa2, fa1, rup
                  sll          s6, s10, s6
                  addi         a4, s0, 754
                  sra          s0, a1, a7
                  lui          a6, 579087
                  mul          gp, s10, a1
                  feq.s        a7, fa1, ft3
                  div          a0, sp, a0
                  srai         s1, a0, 30
                  fmin.s       ft2, fs2, fa1
                  sltu         s9, tp, t6
                  mul          s5, s0, a4
                  fsub.s       ft9, fa6, fs1
                  fcvt.s.wu    fs9, a2
                  fdiv.s       fa6, fa7, ft11, rdn
                  flt.s        s8, ft7, fs8
                  addi         s1, a4, 1188
                  fsgnj.s      ft8, ft7, fs8
                  fdiv.s       fs6, ft4, fa7, rup
                  auipc        a5, 757284
                  or           t6, s10, s9
                  fmv.x.w      s2, fa2
                  or           t0, a3, t2
                  fsgnjx.s     fs2, fs7, ft10
                  add          s2, tp, s8
                  sll          zero, s11, gp
                  mulhsu       t6, t0, t4
                  flt.s        s7, ft3, ft4
                  fmin.s       ft10, fa5, fs7
                  sll          t4, s6, s6
                  fadd.s       fs7, fs1, fs10, rmm
                  flt.s        t2, fs1, fs8
                  srli         t0, t4, 0
                  auipc        s3, 497469
                  sltu         s3, s8, s6
                  fsgnj.s      ft10, fa0, fa7
                  fcvt.s.wu    ft8, t2, rdn
                  fsgnjn.s     ft0, fs8, fa7
                  srai         a1, a6, 21
                  fmax.s       ft3, fa5, ft7
                  fsgnjx.s     fs9, fs9, fs3
                  mulh         t2, s11, s2
                  fle.s        s8, fs10, fs1
                  addi         s10, s6, 1259
                  srl          s5, s9, sp
                  mulhu        a0, t6, a1
                  or           a7, s0, t4
                  fadd.s       ft2, ft5, ft11, rmm
                  or           t2, s4, s1
                  mul          s5, t3, s11
                  fle.s        t4, fa3, ft1
                  addi         s4, a7, 1706
                  sltiu        t6, t5, 875
                  fcvt.s.w     ft8, tp, rdn
                  mulhsu       s6, a2, s5
                  sra          a6, a3, s8
                  xori         s1, a4, 1586
                  fdiv.s       fs0, fa4, fa2
                  sltu         gp, t1, tp
                  srai         s4, a3, 26
                  sltu         a3, a0, t4
                  mulhsu       a5, s1, s5
                  srl          a5, t0, a2
                  sltu         s6, s4, s9
                  fdiv.s       fs0, fa0, fs1
                  divu         a6, s10, sp
                  xori         s2, t3, -1636
                  fle.s        s8, fs10, fs5
                  fsqrt.s      ft9, ft1, rmm
                  fadd.s       ft4, fa3, fa2
                  fle.s        s2, ft3, ft10
                  fmax.s       fs8, fa5, ft3
                  ori          t4, s1, 1609
                  fsqrt.s      fa0, fs4, rdn
                  slti         t5, s11, 840
                  srai         s2, t4, 27
                  or           t0, zero, tp
                  add          s4, s3, s7
                  sltu         s0, t5, a6
                  auipc        s8, 258424
                  xori         s11, s11, 1899
                  sra          zero, zero, t3
                  flt.s        s8, ft1, fs4
                  sub          zero, t6, a1
                  and          a5, t4, a2
                  fadd.s       ft7, fa5, ft0
                  fcvt.s.w     fa0, a2
                  mul          a3, s4, s1
                  andi         t0, tp, -686
                  and          s7, zero, gp
                  fadd.s       ft11, ft6, ft3
                  sltu         t4, s8, s5
                  fclass.s     a6, ft0
                  fmin.s       ft2, fa5, fs9
                  srli         s10, tp, 17
                  rem          s3, t5, zero
                  fmax.s       ft11, ft5, fa3
                  add          t4, t4, ra
                  fcvt.s.wu    fs4, s2, rup
                  ori          gp, a4, -1910
                  fmul.s       ft9, fs0, ft2
                  fadd.s       ft5, fa0, fa7
                  auipc        t4, 77916
                  and          s3, tp, ra
                  fsgnjn.s     ft6, fa7, ft7
                  feq.s        t0, fa0, fs9
                  sltiu        t1, t0, 631
                  sll          sp, s3, s3
                  feq.s        s7, fs8, fs2
                  fsgnj.s      fs5, fs4, ft0
                  nop
                  remu         a4, t6, sp
                  fmv.w.x      fa0, a5
                  and          t6, t6, a1
                  mulh         s4, t5, ra
                  xori         s1, a1, -539
                  fmv.w.x      ft8, s2
                  rem          a6, s7, a7
                  sltu         s10, s8, s1
                  fmax.s       fs5, fs10, ft3
                  div          s8, a5, s9
                  ori          a1, s8, 108
                  slt          a7, s2, s3
                  slti         a1, a3, -1517
                  slti         s6, gp, -238
                  flt.s        a4, ft2, fs4
                  mulhsu       s0, t4, s9
                  div          a7, s4, s5
                  xori         a0, a1, 254
                  fle.s        a3, fs6, fs4
                  fcvt.s.w     ft8, t0
                  div          a4, s11, s7
                  fmax.s       ft0, fs8, fa4
                  fmul.s       fa5, fs7, ft7
                  fsgnjn.s     fa0, ft3, ft2
                  fsgnj.s      ft0, ft3, ft8
                  add          zero, a1, s2
                  srl          t4, s0, s5
                  srl          s11, s9, ra
                  fmul.s       ft5, fs1, fs4, rtz
                  xor          sp, t2, s0
                  fsqrt.s      fs7, ft11, rdn
                  fsgnj.s      ft3, fa3, ft11
                  ori          s4, s6, 302
                  add          s0, zero, a4
                  srl          s2, zero, t4
                  mulh         a7, t1, s5
                  flt.s        s6, ft4, fa5
                  fsgnjn.s     fs4, ft8, ft3
                  sltu         s8, zero, t1
                  flt.s        t4, ft6, fa3
                  and          t2, s3, t1
                  slt          ra, s4, s1
                  fadd.s       ft6, ft3, fs9, rup
                  fle.s        a3, fa1, fa6
                  sub          a3, s9, s11
                  fmul.s       ft4, ft0, ft1, rup
                  fcvt.wu.s    a3, ft11
                  fcvt.s.w     fs11, a5, rmm
                  xori         ra, a5, -1055
                  sltiu        s9, a5, -1958
                  srl          s7, t1, t2
                  fmax.s       fs7, ft9, ft3
                  auipc        s6, 978076
                  fmul.s       ft9, fs4, fs6, rmm
                  or           a7, a7, sp
                  ori          s5, zero, 1034
                  fmv.x.w      a3, fa5
                  srl          s4, ra, s3
                  remu         a3, s3, s6
                  fadd.s       fs11, fa5, fs5, rtz
                  remu         a0, s4, t6
                  sltu         a4, s3, zero
                  fadd.s       fa7, fs5, fs8, rup
                  sub          a0, a0, a0
                  addi         s3, s0, -1090
                  remu         a4, a6, zero
                  fmul.s       ft6, ft5, fa0, rmm
                  srai         a4, s8, 6
                  ori          a6, a2, -178
                  fcvt.s.w     fs5, t3, rup
                  fmin.s       ft2, fs6, ft5
                  fsgnjx.s     ft7, fs9, fs0
                  fcvt.w.s     s2, fs8, rtz
                  fclass.s     s1, ft8
                  sltiu        s6, sp, -1260
                  fcvt.s.w     fs1, a7, rup
                  srai         s5, a2, 31
                  fsqrt.s      fa5, ft6
                  fle.s        t5, ft7, fa6
                  andi         s0, s6, -575
                  fsgnjx.s     fa4, fs7, ft8
                  fle.s        t1, fs3, ft6
                  slt          s6, t3, t5
                  mulhu        a7, a7, a4
                  mulh         a7, s7, s8
                  mulh         s3, s1, t1
                  fmax.s       ft9, fa7, fs5
                  fle.s        a7, fs1, fa6
                  mulhu        ra, t2, s7
                  divu         s4, tp, s1
                  srai         t4, s6, 0
                  or           sp, gp, s6
                  fdiv.s       fs6, fa3, ft7
                  sltu         s11, a2, a1
                  fmax.s       fa0, ft3, ft11
                  and          s2, t3, a2
                  fcvt.s.w     fs5, s11
                  sll          s3, t1, t3
                  slli         t1, t4, 0
                  addi         gp, s9, -377
                  fsqrt.s      fa2, ft7
                  fmin.s       fa0, ft4, fs2
                  rem          t1, t1, t3
                  mulh         s9, t4, ra
                  fdiv.s       ft0, fs8, fs0, rtz
                  rem          s6, t3, t0
                  fsgnj.s      fs7, fa4, fa3
                  fmv.x.w      s2, ft10
                  mulhu        ra, t6, s11
                  slti         sp, s5, -491
                  remu         t1, gp, a6
                  fclass.s     t1, ft0
                  srli         a1, a1, 15
                  add          a6, s4, t0
                  nop
                  fsgnj.s      fa7, ft3, fa1
                  sra          t5, s11, a4
                  mulhu        a6, t1, t2
                  fsgnj.s      fa6, ft5, ft11
                  sltiu        gp, a7, -269
                  fsqrt.s      fs2, fs9
                  sub          s9, ra, s3
                  fcvt.wu.s    s2, ft0, rmm
                  sra          s6, a7, a3
                  auipc        a6, 771763
                  sltu         zero, t2, gp
                  sltiu        s7, s0, 959
                  sub          s0, s3, a1
                  fcvt.w.s     t4, fs8, rdn
                  ori          a3, a2, -576
                  sll          t2, t2, ra
                  mul          s4, a1, s10
                  fmin.s       fs8, ft11, ft9
                  fmax.s       fs7, fs2, fa7
                  mulhsu       t0, s0, a7
                  sltiu        a7, t4, -1986
                  slti         a1, s3, 56
                  mulhsu       s4, a1, s6
                  mulhsu       ra, zero, a5
                  fle.s        a0, fs8, fa3
                  fmax.s       fs5, fs10, fa2
                  fclass.s     a3, fa0
                  fdiv.s       fa4, fs6, fs9, rtz
                  auipc        s10, 441421
                  fmax.s       ft9, fa4, fs0
                  sltiu        t1, a0, -1257
                  add          t6, s10, s4
                  ori          s1, t1, 821
                  div          s7, zero, t4
                  and          sp, s0, a4
                  fmv.w.x      fs5, s0
                  addi         t4, s11, 1272
                  andi         t5, a3, -455
                  fsgnjx.s     ft4, fs11, fs2
                  nop
                  mulhu        s3, gp, gp
                  fcvt.w.s     a7, ft0
                  slt          t6, ra, t3
                  fle.s        gp, fs1, ft9
                  sll          s1, s11, s2
                  fmul.s       fa4, fa5, fs7
                  remu         zero, s3, t4
                  xor          a0, s1, s10
                  slli         t1, s6, 4
                  mulh         sp, t6, s10
                  or           s10, s0, s6
                  sub          t5, s8, s6
                  div          ra, a5, s4
                  feq.s        s1, ft3, ft6
                  mulh         s9, s7, s7
                  fmin.s       ft5, fs3, ft5
                  or           sp, s2, s5
                  fadd.s       fs2, ft4, fs1
                  andi         gp, a6, 610
                  fmin.s       ft4, fa6, fs9
                  fmin.s       ft8, fa2, fa0
                  nop
                  fcvt.s.wu    fs9, tp
                  slli         a3, s11, 25
                  fdiv.s       fa7, fs1, ft6
                  fmin.s       ft3, fa2, ft5
                  feq.s        s8, fs6, fa0
                  divu         s4, a0, ra
                  sub          s4, a4, s4
                  fsqrt.s      ft4, ft8
                  xor          sp, t1, a7
                  or           sp, a1, a2
                  fsgnjx.s     ft6, ft6, fs2
                  fmul.s       fa6, ft8, ft9
                  flt.s        t4, ft9, fs9
                  mulhsu       gp, s9, a1
                  sltiu        sp, s3, -504
                  mulh         t4, a1, a7
                  feq.s        sp, ft1, fs3
                  mulhsu       s8, gp, a6
                  fle.s        s4, fs5, fa7
                  mulhu        a0, gp, t4
                  sltiu        s9, s11, -1197
                  and          t0, sp, sp
                  andi         t5, a7, -204
                  nop
                  fmv.x.w      a7, ft5
                  div          a6, s11, s6
                  or           t1, s1, s4
                  ori          a7, s10, -108
                  fle.s        zero, fs8, ft8
                  div          a6, s3, zero
                  div          s9, s4, a3
                  fsub.s       fs10, fa3, fa2
                  div          s9, gp, t0
                  sub          s4, s8, s6
                  fcvt.s.wu    fs4, t5
                  mulhsu       t6, s10, s11
                  srai         a7, s2, 29
                  mulhsu       gp, t0, s10
                  slli         a1, gp, 16
                  divu         a6, sp, s7
                  fcvt.s.wu    fs9, t0
                  fsgnj.s      fa2, fs7, fs8
                  nop
                  srl          ra, s10, gp
                  nop
                  sltu         s7, s9, s7
                  feq.s        t5, fs4, fs10
                  sub          s8, a1, a2
                  fcvt.s.wu    fa5, gp, rmm
                  fclass.s     s10, ft1
                  mulh         s5, s4, a7
                  sub          sp, s8, ra
                  slli         t1, s8, 20
                  sra          a3, t0, gp
                  fcvt.s.w     fa4, a2, rmm
                  slli         t5, s7, 28
                  addi         s9, s1, 555
                  xor          a4, a5, sp
                  nop
                  divu         sp, t0, t5
                  fcvt.s.wu    fa6, s4, rne
                  flt.s        s2, ft8, ft0
                  mul          a6, a6, gp
                  mulh         a0, a7, zero
                  div          a6, s3, a5
                  lui          s3, 349773
                  or           s5, a2, s4
                  sltu         t4, sp, zero
                  fsub.s       fs9, fs1, ft0, rtz
                  mul          a4, a6, t0
                  div          s6, s7, s0
                  fsqrt.s      fs6, fs1, rtz
                  or           s0, t1, s3
                  xori         s1, s4, -1135
                  srli         t4, s11, 3
                  mulhsu       s1, a7, sp
                  fmul.s       fs0, fa1, ft10
                  mulhsu       t1, tp, s5
                  sltu         t6, t0, ra
                  fmul.s       fa5, fs0, fs0
                  mulhu        t0, t6, t6
                  sll          t5, a4, s7
                  fmv.x.w      sp, ft8
                  andi         s3, a4, 1055
                  fsub.s       fs2, fa6, ft9
                  slli         a5, s10, 4
                  divu         s5, t6, s11
                  fadd.s       fs7, fs4, fs11, rdn
                  xori         s1, s2, 1299
                  fcvt.wu.s    gp, fa0, rne
                  mulhsu       s7, s2, tp
                  fsub.s       ft10, fa6, fs3
                  rem          t1, sp, s1
                  add          a0, tp, s7
                  fsqrt.s      ft8, fa5, rup
                  srl          s2, zero, a0
                  fcvt.s.w     fs10, s10, rmm
                  sra          a1, s1, s3
                  srli         zero, zero, 7
                  mulhsu       s9, t3, a7
                  nop
                  mulhsu       t5, s1, s0
                  sltiu        zero, s11, -1833
                  ori          s9, s8, 1301
                  fsqrt.s      ft1, ft4, rdn
                  srai         a4, t1, 3
                  ori          zero, s7, 499
                  slli         s6, s4, 13
                  add          a4, s2, a6
                  flt.s        s10, fs4, fs9
                  fsgnjx.s     ft1, fs2, fa6
                  add          s5, s1, gp
                  fmin.s       ft7, fs11, fs0
                  fcvt.wu.s    t1, ft4, rup
                  mulh         s5, t1, t4
                  mul          s5, s7, t0
                  fmul.s       fa0, fa4, fs4
                  mulhu        t0, tp, a6
                  fmv.x.w      s2, fs1
                  and          s3, s9, tp
                  or           s3, t1, ra
                  fdiv.s       fs5, ft3, fa6, rdn
                  and          s8, t0, a7
                  fsgnjx.s     ft9, fs7, fs4
                  fclass.s     s10, ft2
                  fcvt.s.wu    ft4, a3, rup
                  fdiv.s       fs10, fs10, ft5, rtz
                  slli         s4, t1, 0
                  slti         t4, t2, 829
                  xori         s2, s7, 1875
                  andi         s3, a1, -360
                  sub          t5, a5, t0
                  fsqrt.s      ft5, fa6
                  xor          s10, a5, a3
                  srl          a0, s9, s5
                  fmax.s       fs4, fs5, fa7
                  ori          s2, s6, -1883
                  andi         s3, s0, -1758
                  mulh         a5, s8, s8
                  slti         a5, sp, -1345
                  add          a1, t6, a3
                  fmv.w.x      ft4, a6
                  auipc        a6, 128436
                  auipc        s3, 116367
                  divu         sp, a7, s1
                  and          t6, s8, t5
                  slli         t4, s7, 10
                  fcvt.s.w     ft1, t5, rmm
                  fdiv.s       ft8, fs11, fa5, rup
                  fcvt.wu.s    s3, fs3
                  div          s9, t2, a4
                  slt          t1, s9, t4
                  sll          a1, t4, s0
                  fsub.s       fa0, fa7, fs10, rmm
                  divu         a3, t2, s2
                  lui          s2, 404764
                  add          a5, t1, s9
                  mul          s2, s0, s4
                  mulhu        s5, s1, s6
                  flt.s        t2, ft9, ft4
                  mulhu        s5, t6, s8
                  fle.s        s2, fa4, fs11
                  sltiu        zero, a7, 409
                  slt          s11, s1, t0
                  slli         a7, s5, 5
                  srl          t2, s1, a0
                  fsgnjx.s     fa5, ft5, ft3
                  mulhsu       a3, a4, t4
                  andi         s2, s5, -1462
                  fcvt.s.wu    ft7, t4
                  feq.s        t5, ft3, fa5
                  ori          s11, s11, 210
                  fadd.s       fa0, fa7, fs4
                  slti         ra, s11, -657
                  fle.s        s11, fs7, fs8
                  fsgnjn.s     fa1, fa4, ft8
                  sra          s0, s10, a1
                  and          ra, a0, s2
                  xor          s7, a7, a2
                  add          s7, t0, s2
                  fdiv.s       ft0, ft4, fa5, rdn
                  auipc        s5, 730034
                  fadd.s       fs5, fs8, fs9
                  ori          a6, t4, 1955
                  fadd.s       ft3, ft10, fs1
                  and          t0, a1, s7
                  srai         s2, a5, 29
                  fsgnj.s      ft0, fs10, fs8
                  fmin.s       ft11, ft2, ft6
                  fclass.s     ra, fs1
                  lui          t2, 905960
                  mulhu        s3, t5, t4
                  fadd.s       fs11, ft0, fs9
                  mul          a1, s11, tp
                  fsqrt.s      fa2, ft3
                  fmv.x.w      s1, ft2
                  sub          t1, t0, a7
                  fsgnj.s      ft2, ft2, fa7
                  fsgnjx.s     fs8, fs2, ft6
                  xori         t0, s0, 1992
                  fcvt.s.wu    fs10, s9
                  feq.s        t0, fs2, ft5
                  div          s5, a5, ra
                  fclass.s     s1, fa3
                  auipc        a6, 292853
                  fmv.x.w      s10, fs2
                  mul          a6, a0, a0
                  xori         t0, t2, -904
                  fmax.s       ft1, fs7, ft10
                  fsgnj.s      fa5, fs5, fa5
                  nop
                  remu         s4, a3, s0
                  fcvt.wu.s    s10, fs9
                  fmax.s       ft8, fs8, ft8
                  feq.s        t5, ft4, ft4
                  fcvt.w.s     gp, ft8
                  fmul.s       fa1, fs7, ft6, rdn
                  sltiu        t6, s11, -2021
                  fsqrt.s      ft10, ft10, rdn
                  xor          s11, a0, s8
                  and          a7, t1, s6
                  fclass.s     t4, fa2
                  and          a4, s9, s5
                  fmax.s       ft1, fa3, ft11
                  fadd.s       ft11, fa1, fs9
                  mulhsu       s5, ra, ra
                  srli         a5, a3, 2
                  xori         t6, s3, 1656
                  nop
                  fcvt.s.w     fa3, s6, rup
                  fsub.s       fa1, fs3, ft2
                  mulh         s2, zero, a0
                  fclass.s     ra, fs9
                  xori         a3, s8, -2042
                  slti         a1, t4, -1524
                  fmul.s       fs3, fs0, fs6
                  fsgnjn.s     fs10, fs2, fs9
                  fcvt.s.wu    fs3, t2, rdn
                  add          t5, a0, t1
                  fmv.x.w      s4, fs1
                  fmv.x.w      t6, fa3
                  fclass.s     s0, ft1
                  slt          a7, a2, a5
                  and          s7, t6, sp
                  or           t2, s11, s4
                  fcvt.s.w     fa5, t4
                  fsgnjx.s     ft10, ft9, ft11
                  fmv.x.w      t6, ft2
                  or           s5, s10, t2
                  flt.s        s3, fs8, fs6
                  mulhsu       s2, s0, s2
                  fdiv.s       ft2, fa4, fs11
                  fsgnjx.s     fs1, fs3, fs5
                  ori          ra, s10, -857
                  fmv.w.x      ft2, s9
                  xori         s4, s5, -284
                  fmv.w.x      ft1, s0
                  slti         t1, s9, 2009
                  srli         t1, s7, 2
                  srl          s1, t3, a5
                  xori         gp, a1, 1678
                  divu         s1, s8, s9
                  slti         a6, t3, 1001
                  fsgnjn.s     ft3, fs11, fs9
                  mulhu        s8, tp, sp
                  slli         s8, s2, 6
                  slti         gp, s6, 710
                  rem          s2, gp, s2
                  srli         s2, ra, 31
                  slt          s6, s10, zero
                  mulhsu       t1, s8, s10
                  fmax.s       fa6, fa2, fa0
                  sltu         sp, sp, s5
                  sltu         s1, s0, a2
                  srai         s11, t1, 2
                  sltu         a6, zero, t3
                  fmin.s       ft4, fa3, ft9
                  xori         a7, a5, -1151
                  remu         s2, s7, a0
                  fmax.s       ft4, fs3, fs5
                  slt          a5, t4, tp
                  fle.s        a1, ft6, fs7
                  fcvt.w.s     ra, ft8
                  fsub.s       fs0, fs7, fa7
                  ori          zero, t6, -284
                  xor          s3, t5, a3
                  srli         s6, ra, 23
                  fsgnjn.s     fs5, fs0, ft11
                  srl          s1, ra, a0
                  srl          s2, a0, s4
                  remu         a5, s7, t0
                  fcvt.wu.s    s7, fs9
                  fcvt.wu.s    sp, ft1, rdn
                  fcvt.s.wu    ft11, t4
                  fdiv.s       fs5, ft5, ft9
                  and          s0, s7, t0
                  fmv.x.w      ra, fa5
                  srl          a0, s10, t6
                  fcvt.w.s     a3, ft0
                  fadd.s       fa4, ft10, fs3
                  ori          t2, s6, 1347
                  fsgnjn.s     ft7, ft11, ft3
                  fle.s        a3, ft9, fs8
                  srai         a5, a1, 24
                  srli         s9, t3, 9
                  fclass.s     s4, fs5
                  fsgnj.s      fs0, ft10, fs9
                  fsgnjx.s     fa5, fs2, fa7
                  srl          a7, gp, sp
                  addi         s6, a7, 544
                  div          a1, a4, t3
                  fsqrt.s      fs10, fs8, rtz
                  fcvt.wu.s    t2, fa6, rne
                  slti         t5, s4, -1926
                  srai         s5, a5, 29
                  mulhsu       s0, a0, s1
                  auipc        s8, 9995
                  fclass.s     a3, fa1
                  fmax.s       fa6, fs1, fa1
                  lui          a4, 798090
                  ori          zero, s2, -1720
                  fmul.s       ft0, fs10, ft11
                  srli         s1, sp, 14
                  fcvt.w.s     a7, ft9, rdn
                  fsqrt.s      fs4, fs11
                  flt.s        s8, ft10, fa5
                  sltu         s3, s6, a0
                  lui          sp, 11683
                  fmv.x.w      s6, fs8
                  fsub.s       fs9, fa5, fs10, rne
                  fmv.x.w      t4, fs3
                  sll          s5, a3, a6
                  fclass.s     t5, fs11
                  nop
                  fcvt.wu.s    t6, ft9, rdn
                  mulhu        s0, sp, t2
                  add          t6, a3, s3
                  sltu         s3, t1, t2
                  mulhsu       t1, s1, t0
                  srai         a4, t6, 12
                  slli         a6, s10, 21
                  slti         s2, sp, -1935
                  fsgnj.s      ft6, fs10, fa0
                  xori         t4, a0, 1729
                  fsgnjx.s     ft4, fs2, fs9
                  mul          s11, ra, zero
                  fclass.s     s8, fa4
                  fmul.s       fa0, fa7, ft5
                  fmv.x.w      sp, fs11
                  nop
                  fmax.s       fs5, fs5, ft11
                  fclass.s     s7, fs0
                  mulh         a3, sp, s2
                  xor          a7, s1, t6
                  ori          a5, a0, 782
                  fsqrt.s      fs9, fa4, rdn
                  slli         s10, t2, 12
                  and          s1, t0, a1
                  remu         s2, s10, s2
                  ori          t4, sp, 1356
                  sra          s5, s10, s1
                  fdiv.s       fa4, ft3, fs4, rne
                  rem          s11, s2, a4
                  sltiu        a0, s6, 275
                  nop
                  mulhsu       s8, a2, a2
                  sub          s11, a4, s11
                  srli         s7, s6, 6
                  fcvt.w.s     t0, ft2
                  slt          a1, s6, zero
                  fcvt.w.s     s1, fa4
                  fcvt.w.s     a4, ft11
                  flt.s        s4, fs0, fs4
                  slt          gp, a1, s2
                  mulhsu       a4, t4, s6
                  sltu         a3, a7, a4
                  feq.s        s9, ft10, ft1
                  fadd.s       fs10, fs1, ft5, rtz
                  slti         a5, s9, 691
                  fmin.s       fs11, fa6, ft10
                  add          a3, sp, s7
                  slli         s10, t1, 28
                  fsgnjn.s     fs10, fs9, fs4
                  feq.s        sp, fs0, fa6
                  sltu         s9, a4, a2
                  srl          t1, tp, a1
                  mulh         a7, a6, s6
                  fadd.s       ft6, ft5, ft1
                  and          s5, tp, a0
                  add          s10, gp, zero
                  fmv.w.x      ft2, t5
                  slti         a3, s7, -1639
                  add          a1, zero, a2
                  sra          s2, s7, s5
                  fcvt.wu.s    s6, ft6, rmm
                  slti         t6, gp, 1103
                  srai         s9, a4, 1
                  mulhu        s10, s3, sp
                  remu         s4, a7, s1
                  slti         t2, s5, -1300
                  fmul.s       fs2, ft11, fs9, rdn
                  fcvt.w.s     s3, fa0
                  slt          s3, t0, a7
                  ori          t1, s1, -264
                  remu         t4, a4, ra
                  ori          t1, t0, 200
                  slti         gp, t5, -1621
                  fsgnjn.s     ft1, ft10, fs7
                  feq.s        a5, fa0, ft2
                  slt          s3, a5, s3
                  fcvt.s.wu    fs2, s0
                  xori         t0, a3, 390
                  fsub.s       fa0, fs11, ft11
                  slli         s2, s0, 7
                  fdiv.s       ft3, ft1, fs3
                  fmul.s       fa1, fs7, ft9, rmm
                  divu         s4, ra, t3
                  nop
                  slt          s4, a4, a7
                  div          t4, s9, a5
                  or           a0, a7, ra
                  ori          a3, gp, -1930
                  and          t6, t3, s11
                  divu         s4, s11, t4
                  add          t4, ra, s9
                  slti         a4, s0, -1207
                  sra          s8, ra, t1
                  sub          a7, a2, s6
                  fmax.s       fs4, ft3, ft0
                  fmul.s       ft4, fa7, fa1, rdn
                  fsgnjx.s     fa1, fa5, fs0
                  fsqrt.s      fa3, fa7, rne
                  fmin.s       ft6, ft4, fs10
                  divu         s9, t6, s3
                  rem          t4, sp, s4
                  sub          s11, a6, s9
                  rem          a3, a2, s5
                  nop
                  xori         s4, a4, -15
                  mulhu        t0, s6, t6
                  sub          s2, a7, s5
                  div          a4, s11, t3
                  sub          a4, sp, tp
                  srl          s10, tp, a4
                  feq.s        a3, fs2, fa3
                  feq.s        s2, fs4, fa1
                  srli         s0, s10, 22
                  divu         zero, a4, s6
                  or           s5, t6, s4
                  fsgnjx.s     ft9, fa0, fa3
                  fsub.s       ft1, fa0, fs4, rup
                  feq.s        s11, ft8, fs8
                  sltu         a6, t2, s8
                  fmin.s       ft6, ft0, fa3
                  and          a6, t5, tp
                  fmv.w.x      ft2, sp
                  fdiv.s       ft5, fs9, ft8
                  sltiu        a6, a3, 1172
                  addi         s4, s10, -2026
                  divu         a5, t6, s1
                  rem          t0, s4, a5
                  fsub.s       ft10, ft9, ft5, rup
                  divu         t5, tp, t4
                  fmin.s       ft9, fs10, fa3
                  mul          t2, a2, t1
                  andi         s0, t5, 1916
                  fmax.s       ft0, fs10, ft10
                  fcvt.w.s     sp, fa5, rup
                  nop
                  mulhsu       s2, s7, a3
                  or           zero, t1, a7
                  sltiu        a7, s9, 1201
                  fmv.w.x      fs11, s8
                  div          t2, tp, t1
                  sltu         s9, t1, s4
                  fdiv.s       ft6, fs11, ft3
                  or           s5, zero, a5
                  divu         s10, a3, gp
                  fcvt.wu.s    s3, ft1
                  ori          s7, s6, -1021
                  and          a0, zero, sp
                  nop
                  srai         t0, s9, 6
                  fmax.s       ft10, fa2, fa2
                  div          s9, a1, s1
                  nop
                  fcvt.wu.s    a3, fs7, rdn
                  fcvt.s.wu    ft8, ra, rtz
                  srl          a3, a0, s1
                  add          s1, s1, s9
                  slti         a0, s9, -1540
                  fcvt.wu.s    zero, fs5, rne
                  fsqrt.s      ft10, fa1, rup
                  slli         a6, a4, 11
                  lui          s9, 605788
                  sub          s3, zero, s7
                  mulh         s1, t0, s8
                  ori          t5, a7, -1450
                  mul          s8, s10, s2
                  mulhsu       t1, a5, s6
                  slt          zero, t3, a7
                  fsgnj.s      fa3, fa5, fs7
                  addi         t0, s5, 503
                  sub          s6, s9, s0
                  slli         s5, a5, 16
                  xori         s5, sp, -1084
                  mulh         s10, a7, t4
                  sltu         t4, s3, s10
                  mulhu        a3, a6, t0
                  lui          t4, 397021
                  fmv.w.x      fa0, a3
                  fmv.w.x      fa4, t1
                  add          a4, t3, s3
                  fmul.s       fa0, ft0, ft5, rmm
                  ori          t5, gp, -822
                  divu         t2, a1, t2
                  srai         s8, a2, 29
                  or           sp, zero, s7
                  slt          a5, a3, a7
                  mul          t5, s6, a2
                  mul          sp, t3, s9
                  and          s5, s5, s6
                  addi         zero, s6, 1698
                  sub          s6, s8, a2
                  div          sp, s2, a4
                  fmin.s       fs1, fa5, ft1
                  slli         ra, ra, 29
                  or           t4, t1, gp
                  fcvt.w.s     zero, ft0
                  rem          s11, t0, zero
                  sub          a5, t4, a3
                  and          t1, s11, s4
                  lui          a6, 51273
                  srl          a7, s7, a4
                  sub          a4, s10, s8
                  fmul.s       fa4, fa1, ft0
                  fsgnjx.s     fs3, ft3, ft2
                  andi         s4, s9, -2018
                  fcvt.w.s     a1, fa3, rup
                  rem          s0, s9, a0
                  sltu         s2, t2, t6
                  xor          t4, a2, a1
                  fcvt.s.w     ft10, t6
                  sra          a7, s2, s11
                  srli         t1, s11, 30
                  sra          s2, a3, t3
                  sub          sp, s10, s7
                  fcvt.s.wu    fs6, s7, rup
                  fsgnjx.s     fs3, ft9, fs6
                  remu         a6, a5, a5
                  rem          s2, s7, s7
                  fmv.w.x      fs4, s5
                  ori          t6, s8, 1248
                  fmul.s       ft6, fa4, fs4, rdn
                  fadd.s       ft7, fa2, ft6, rtz
                  fadd.s       fs2, fa0, ft10, rtz
                  add          s3, s6, s10
                  mulhsu       t1, s8, gp
                  feq.s        s9, fa3, fs11
                  xor          a4, gp, s9
                  srai         ra, gp, 7
                  fsub.s       ft8, fa6, fa1
                  fsqrt.s      fa4, ft8, rtz
                  fadd.s       fa4, fs7, fa0
                  mulh         s11, s6, s2
                  sltiu        s0, s9, 1961
                  mul          a6, a0, s8
                  sra          t0, s0, a0
                  sll          s0, a1, zero
                  nop
                  slli         ra, a5, 6
                  fmax.s       fs3, ft2, fs3
                  sll          t2, a4, s7
                  fclass.s     ra, fs5
                  fmul.s       ft7, fa6, fs0
                  fclass.s     s9, ft4
                  nop
                  sltiu        a0, s7, -908
                  sll          t1, a4, s1
                  mul          ra, s10, s4
                  nop
                  mulhu        s5, a5, s9
                  sll          t5, s8, t3
                  sll          s8, t1, a3
                  slt          s0, t6, a5
                  fcvt.w.s     a1, fa4, rtz
                  fmax.s       fs9, fs10, ft9
                  fmax.s       fs3, fs8, fs11
                  sltu         ra, s10, s0
                  srai         s2, zero, 29
                  fsgnjx.s     ft2, ft5, fa7
                  or           t0, s11, t3
                  fsgnjn.s     fs10, fs8, fs7
                  addi         t1, s5, -1986
                  fcvt.wu.s    a3, fs10
                  rem          a7, tp, a3
                  fsub.s       ft1, fs0, ft10, rne
                  add          t5, s7, sp
                  add          t4, t3, a2
                  feq.s        t4, fs6, fs7
                  andi         a3, a3, 1786
                  fcvt.w.s     gp, fa4, rup
                  ori          a0, a5, 1985
                  fmin.s       fs3, fa0, fs5
                  sll          t4, t3, a2
                  fmv.w.x      ft11, a0
                  ori          s11, ra, 828
                  sra          ra, sp, s4
                  xor          s7, t0, t5
                  rem          s7, s9, t1
                  divu         s8, s9, t3
                  remu         s3, t1, s1
                  fsub.s       fs2, ft5, ft4
                  ori          t0, s0, -2003
                  fmin.s       fa5, fs10, fs2
                  flt.s        s6, ft7, fs9
                  mulhsu       s1, a3, s3
                  flt.s        a7, fs1, fs5
                  fcvt.w.s     s0, fa3
                  slti         a4, t3, 1443
                  div          a3, s10, a6
                  fcvt.s.w     fa1, s11
                  flt.s        s10, fs1, fs2
                  fsqrt.s      fs1, ft10
                  auipc        s2, 109725
                  or           a4, a4, gp
                  slli         s8, s10, 5
                  auipc        s11, 345457
                  fadd.s       ft3, fs5, fs0, rtz
                  sltiu        zero, t4, 509
                  srl          s8, a7, t1
                  fmv.x.w      sp, fs9
                  fmul.s       ft2, fs0, fs10
                  fcvt.wu.s    s5, fa1
                  ori          t1, s0, 1615
                  fmul.s       fs4, ft9, fs5, rup
                  xori         a7, tp, 921
                  ori          t1, s11, -1436
                  nop
                  srli         ra, s3, 16
                  mul          s3, ra, s1
                  fclass.s     a7, ft6
                  or           s6, zero, zero
                  fmin.s       ft8, fa3, fs3
                  srai         zero, tp, 26
                  mulhsu       t6, a7, a6
                  fmul.s       ft4, ft8, ft5
                  fdiv.s       fa4, fs3, fs8, rdn
                  fmul.s       fa2, fs10, ft5, rmm
                  sll          s7, a4, t1
                  slti         t2, s4, 2014
                  remu         a1, a2, s2
                  fsub.s       ft3, ft9, fs7, rup
                  nop
                  feq.s        t5, fa0, fs2
                  ori          s3, s5, 321
                  sll          t2, tp, sp
                  add          t6, s11, s4
                  srai         gp, zero, 2
                  lui          t2, 28848
                  feq.s        a7, ft2, ft5
                  mulhsu       s5, t5, s2
                  add          a4, a4, a2
                  lui          a1, 164023
                  and          t2, t3, s5
                  mulhu        t5, t2, s7
                  flt.s        t1, fs6, fs9
                  srli         t2, s2, 9
                  srl          gp, zero, a0
                  div          a3, s2, s11
                  slt          a7, tp, t6
                  fmv.x.w      s1, ft2
                  andi         t1, s2, -1426
                  fsgnj.s      ft10, ft1, fa4
                  or           s0, ra, s11
                  fmin.s       fa4, fa0, fs4
                  fsqrt.s      fs4, fs10
                  slli         t4, a4, 23
                  sltu         t4, ra, a0
                  divu         s11, s9, s3
                  xor          s3, a6, s4
                  fadd.s       ft7, ft4, ft10
                  xori         ra, t2, -159
                  fmul.s       ft0, ft8, fs5, rtz
                  fle.s        sp, fa4, ft11
                  div          zero, s5, t5
                  nop
                  mulhsu       a7, a2, ra
                  slti         s7, s10, -1234
                  rem          s3, tp, s2
                  fcvt.w.s     t1, fs5, rmm
                  srli         s5, s0, 29
                  sltu         a7, s0, s2
                  and          t2, a2, s5
                  andi         s5, gp, 345
                  fsgnjn.s     fa1, fs11, ft8
                  mul          a1, t1, a2
                  divu         s1, t3, sp
                  srai         a7, sp, 4
                  ori          s5, s7, -258
                  fmv.w.x      fs6, t0
                  add          a5, s5, t2
                  ori          ra, a0, 470
                  slt          t4, t4, t0
                  slt          s7, a4, a6
                  fmul.s       fs0, fa7, fa1, rtz
                  fmv.w.x      fa0, a4
                  mulhu        s4, t2, a0
                  fcvt.w.s     ra, ft10
                  fle.s        s4, fs6, fa6
                  fdiv.s       fs10, ft4, ft10
                  fsqrt.s      ft2, fs8
                  fcvt.s.wu    fs11, s11, rup
                  fadd.s       ft10, fs5, fs1
                  fcvt.s.w     fs7, s2, rup
                  fcvt.wu.s    a3, fs1, rne
                  div          a5, t4, s8
                  fmul.s       fs8, fs0, fs5
                  fle.s        a6, fa7, fs3
                  mulhsu       s0, t0, a5
                  fmul.s       fs2, fs7, fa1
                  divu         a7, zero, s5
                  fmax.s       fs6, fa0, fa0
                  nop
                  slti         s2, s8, -5
                  flt.s        s2, fs11, fs5
                  fmul.s       fa0, fa5, fa6, rup
                  fmv.x.w      s8, fa3
                  fle.s        s10, fa7, fs4
                  fmax.s       fs4, fa6, fs4
                  fsub.s       fa1, fa6, fa6, rmm
                  slt          t4, s3, s4
                  fsgnjn.s     ft3, fs3, ft2
                  fsub.s       fs9, fs0, fs8, rdn
                  fadd.s       fa5, ft2, fa4
                  rem          t6, s7, a2
                  mul          a6, a4, s0
                  fcvt.s.wu    fs10, s6, rup
                  fsub.s       fa0, fs1, ft2, rdn
                  slt          s2, s8, t2
                  sub          t2, tp, zero
                  and          s7, s3, a1
                  slt          sp, s0, s9
                  xor          t4, t4, tp
                  fsgnjx.s     fs9, ft0, fa6
                  ori          t4, a4, -1919
                  div          s5, t5, t6
                  divu         s1, s7, sp
                  sub          t6, t3, a0
                  fcvt.s.w     ft3, t2, rne
                  sub          s10, tp, s11
                  sra          s1, s8, s8
                  slt          gp, sp, s8
                  flt.s        t6, fs11, ft6
                  slti         s10, t2, -506
                  sltiu        s3, a5, 606
                  mulhu        ra, ra, s6
                  fle.s        a0, fa1, fs8
                  fsqrt.s      ft10, fs6, rtz
                  fmv.x.w      sp, fs0
                  sub          s11, t0, t6
                  add          s9, zero, t5
                  auipc        t0, 458515
                  divu         s5, t0, s6
                  srl          s1, t5, sp
                  slt          s9, s9, s4
                  fadd.s       fa4, ft11, ft1
                  fle.s        t1, ft0, fa7
                  sltu         s11, t5, t2
                  or           s7, s5, t1
                  sra          s10, a3, a0
                  fmin.s       fs4, fa5, ft6
                  feq.s        s3, fs7, fs11
                  fsqrt.s      ft9, ft5, rne
                  slt          t2, s3, s8
                  fmax.s       fa4, fa6, ft6
                  fsub.s       fa7, ft8, fs1
                  fadd.s       fs4, fs9, fa3
                  fclass.s     gp, ft5
                  fmv.x.w      s8, ft1
                  fcvt.w.s     s5, fs5, rtz
                  div          gp, s0, s8
                  rem          a7, a2, s1
                  slt          s9, s1, a4
                  fmin.s       ft2, fs4, fs11
                  flt.s        zero, fs5, ft8
                  rem          a6, a1, t6
                  mulhu        s9, s11, t0
                  rem          a0, t2, t0
                  mulhsu       a7, s11, s11
                  lui          a7, 953671
                  fdiv.s       ft0, fa7, fa4, rmm
                  xor          s2, t2, sp
                  slti         t2, a2, 1322
                  divu         s3, t2, s0
                  fsqrt.s      fs4, fs3
                  mul          t5, s2, a5
                  mulhsu       t6, a0, s9
                  sub          s7, t0, s3
                  fcvt.s.w     fs3, s0, rne
                  xor          s2, t0, t6
                  fmin.s       fa1, ft0, fs3
                  andi         zero, a6, 1987
                  sll          s6, s4, s9
                  lui          a0, 821252
                  fmul.s       ft8, fs3, fs3, rne
                  xor          sp, s7, a4
                  div          gp, a2, zero
                  slti         a3, s7, 182
                  fclass.s     gp, fa6
                  fsgnjx.s     fs0, ft4, fs8
                  sltiu        gp, a1, 166
                  srli         t6, t1, 10
                  auipc        s4, 463770
                  fcvt.s.wu    fs9, t3, rup
                  fdiv.s       ft0, fa3, fa7, rup
                  sll          s1, s0, s1
                  divu         s4, s10, a4
                  nop
                  slt          t5, tp, a5
                  srai         s6, a3, 20
                  remu         t5, s8, s11
                  rem          t6, a4, a5
                  div          s11, s9, a1
                  fdiv.s       fa5, ft1, fa6
                  fmin.s       ft11, ft0, fa2
                  remu         s5, s10, s8
                  fmv.x.w      a7, fs11
                  fsgnjn.s     fs8, fs0, fa0
                  sra          s7, s10, ra
                  slli         a6, t1, 24
                  fadd.s       fa4, ft1, fs5, rmm
                  divu         a4, a0, sp
                  mulhu        s4, a5, tp
                  ori          t4, s3, 881
                  and          s9, ra, ra
                  mulhsu       s6, t4, s10
                  mulhu        t1, a6, t6
                  fclass.s     s10, fs7
                  fcvt.wu.s    t1, ft10, rtz
                  fcvt.s.w     fs6, a2, rup
                  mulhu        t0, s9, a7
                  sltiu        s10, t2, -303
                  xor          s2, s8, s7
                  fsgnj.s      ft7, fs9, fs10
                  mulhsu       sp, t6, t2
                  add          t1, a7, s5
                  rem          a0, s0, t5
                  fcvt.s.wu    fs3, t3
                  fcvt.w.s     a0, ft6
                  srli         s0, ra, 10
                  rem          s10, a7, sp
                  fcvt.s.w     fa3, t1
                  rem          a0, s2, s4
                  slt          t2, a2, s1
                  srl          t1, a5, t6
                  fcvt.w.s     s5, fa4, rmm
                  mulh         a5, a6, t2
                  remu         a3, s11, t5
                  slt          s9, s11, a5
                  slt          s8, s4, s5
                  sra          t5, a5, s9
                  fle.s        a4, fs2, fa6
                  sub          s10, a5, s8
                  fle.s        s0, fa4, fa0
                  srai         t5, s1, 26
                  nop
                  fadd.s       fs8, fs9, ft5
                  addi         a1, t6, 1979
                  fmul.s       fa5, fa0, fa3, rne
                  xor          ra, s8, s6
                  add          s4, tp, t5
                  flt.s        a6, fs11, fa4
                  sub          s5, a5, a5
                  srai         gp, ra, 11
                  div          t1, t0, gp
                  add          s2, gp, t5
                  fmul.s       fs2, fs3, fs0
                  srli         t4, t2, 5
                  fsgnjn.s     ft3, ft9, ft2
                  fcvt.wu.s    s5, ft11, rne
                  divu         a3, s1, sp
                  fcvt.s.wu    fs7, zero
                  feq.s        a7, fs5, fs8
                  mul          a0, s11, a7
                  xori         a1, tp, 184
                  fmv.x.w      s1, fs7
                  fmul.s       fa2, fa0, ft1, rtz
                  fadd.s       ft8, fs1, fa2
                  slti         zero, s6, -195
                  fadd.s       fs8, fs6, ft10
                  fdiv.s       ft3, ft4, fs10, rne
                  mulhu        s5, t0, tp
                  feq.s        a4, fa6, ft8
                  slt          s11, t2, t0
                  fsqrt.s      ft7, fa6, rdn
                  sra          s2, s6, s3
                  xor          a3, s3, ra
                  divu         sp, s6, t6
                  mulh         gp, t4, a2
                  lui          t4, 705213
                  sltu         t0, s6, t4
                  fsgnjn.s     fa6, fs11, ft11
                  mulhsu       a7, gp, ra
                  addi         s1, s5, 1459
                  sltiu        s2, s8, 2014
                  srli         s6, a4, 8
                  divu         t1, s8, t0
                  fcvt.s.wu    fa2, s4, rne
                  fsgnjx.s     fa2, fa6, ft9
                  div          s0, t4, sp
                  fcvt.s.wu    fa1, t3, rtz
                  fcvt.w.s     a0, fs8, rdn
                  and          a3, s5, s8
                  fsgnj.s      fa7, fs7, fs6
                  xori         sp, t3, 530
                  addi         s8, s4, -1335
                  slli         s6, t4, 3
                  fmv.w.x      ft7, t0
                  fsub.s       fa1, ft6, fa3, rup
                  fcvt.wu.s    t2, ft4, rdn
                  feq.s        gp, ft1, fs5
                  lui          s5, 142832
                  fadd.s       ft9, fa5, fs6
                  fadd.s       ft1, ft11, fs4, rdn
                  or           a5, s11, t3
                  slt          s8, a4, t6
                  srli         a3, s4, 12
                  xor          t1, s0, a7
                  mulhsu       s2, a0, a6
                  fclass.s     s9, ft1
                  feq.s        t2, ft0, fa2
                  fsub.s       ft8, fa6, fs0, rtz
                  fsub.s       fs3, fa4, fa4, rdn
                  or           t1, a7, zero
                  mulh         a0, t4, tp
                  nop
                  addi         s0, a2, -1624
                  fmax.s       fa7, fs4, fs9
                  fcvt.s.wu    fs4, s7
                  and          a7, a4, s3
                  xori         t5, t1, -1547
                  feq.s        sp, fs5, fs11
                  fcvt.s.wu    ft3, s6
                  flt.s        s0, fs2, fs9
                  sub          t5, a2, a7
                  fcvt.wu.s    t2, ft7, rup
                  fsgnj.s      ft2, fa3, fs3
                  sll          zero, tp, a2
                  lui          a1, 828644
                  sltu         t5, s2, s7
                  srai         s3, ra, 15
                  fclass.s     t5, ft11
                  mulhsu       s8, tp, t5
                  sltu         a7, t1, s7
                  fclass.s     s2, ft8
                  fclass.s     s11, ft0
                  sll          s9, sp, s1
                  sltiu        t5, zero, -1582
                  div          s10, a7, s8
                  remu         a3, t4, gp
                  fsgnjx.s     fs4, ft7, fs5
                  rem          gp, s0, t1
                  srl          a5, gp, a6
                  and          s10, t5, a4
                  fmin.s       fa3, fs9, ft3
                  slt          s0, s0, s6
                  feq.s        s5, fs4, fs7
                  fcvt.wu.s    sp, ft4
                  slt          a1, s7, a4
                  fcvt.w.s     a1, fs9
                  or           gp, t5, a4
                  fmv.w.x      ft9, gp
                  auipc        s4, 302721
                  fcvt.s.w     ft10, s7, rup
                  addi         a0, s11, -671
                  feq.s        a1, ft8, ft6
                  sub          t2, t5, s9
                  fcvt.s.w     fa7, ra, rmm
                  or           t4, a4, t2
                  lui          s4, 769357
                  and          ra, s6, t2
                  mulh         a7, s5, t3
                  mul          s2, t6, s1
                  mulhsu       s4, ra, zero
                  fcvt.w.s     s3, fa1, rmm
                  fcvt.w.s     s6, fa1, rtz
                  fmv.w.x      ft10, a5
                  fcvt.s.wu    fs6, s9
                  fsqrt.s      fa7, ft9
                  fcvt.s.w     ft6, a7
                  slti         a1, a2, 856
                  fmul.s       ft7, fs3, ft2, rmm
                  nop
                  fdiv.s       ft8, ft9, fa5, rne
                  sra          s10, t6, ra
                  ori          a4, s5, 1739
                  div          s0, a0, s7
                  fsgnj.s      ft10, fa6, fs11
                  fadd.s       fa1, fs2, fa2, rdn
                  sra          t0, s1, t0
                  fadd.s       ft10, fs7, fs11
                  slti         s5, s6, 1150
                  remu         t6, sp, t3
                  sltu         a7, s0, s4
                  andi         s4, t6, 1468
                  mulhu        s6, t2, a7
                  nop
                  auipc        s8, 293003
                  sub          t2, s8, t6
                  xori         s4, s2, -126
                  andi         s10, a4, 691
                  fle.s        t2, ft6, fs9
                  fclass.s     s10, fs7
                  fmax.s       ft6, fs6, fs7
                  sltu         a4, t5, zero
                  sra          zero, zero, s3
                  auipc        a3, 170692
                  fcvt.s.wu    fs11, s10
                  sltu         t6, s2, t6
                  mulhu        a3, zero, s4
                  fmv.w.x      fa0, a6
                  and          s2, a0, s2
                  srli         t1, s11, 14
                  div          s11, s5, t0
                  mul          a7, t1, zero
                  lui          s8, 847212
                  slli         t0, sp, 3
                  fcvt.w.s     s0, fa0
                  srli         a1, s11, 15
                  slli         s6, t3, 10
                  mulhsu       ra, t0, a0
                  addi         a4, s3, 456
                  sll          s7, a4, t5
                  remu         t0, t0, sp
                  fcvt.wu.s    s3, fa5, rup
                  fmv.x.w      t0, fs6
                  srli         s9, zero, 2
                  srl          s3, s3, t1
                  rem          zero, a3, t3
                  or           zero, s4, s2
                  fsub.s       ft4, ft4, fs6, rne
                  fmul.s       ft6, fs6, ft11
                  andi         t1, s10, 54
                  fcvt.w.s     s3, fs6, rdn
                  fclass.s     s9, fs7
                  srai         a6, a2, 6
                  slli         t2, sp, 13
                  remu         t0, t3, a4
                  fcvt.w.s     sp, ft3, rmm
                  div          sp, ra, s11
                  fadd.s       ft6, fs10, ft4, rup
                  sub          s6, a2, a7
                  nop
                  fcvt.wu.s    a5, ft0
                  fmv.w.x      ft1, s4
                  slti         t2, a6, 410
                  slt          t2, ra, a7
                  fsgnj.s      fa1, fa2, ft8
                  fcvt.w.s     s10, ft10
                  sltiu        s5, t3, -1659
                  mulhu        s5, t0, s4
                  srl          s11, t3, s6
                  mulhu        a3, gp, sp
                  div          t5, a5, s2
                  or           s11, t6, ra
                  sra          s7, gp, s10
                  xori         t6, t1, 944
                  fadd.s       ft5, fs10, fs8, rup
                  fle.s        s4, fa3, fs3
                  fmul.s       fs2, fs6, fs0
                  srl          a3, t2, s8
                  fcvt.w.s     a5, fs0
                  sll          s0, zero, a6
                  sub          s4, a7, s4
                  srai         t5, s6, 0
                  fmul.s       ft2, ft5, fs5, rtz
                  andi         a5, s9, -1635
                  fmin.s       fs7, ft1, fs1
                  sub          t0, s4, sp
                  fmul.s       fs3, ft4, fs5, rdn
                  slt          s9, sp, s0
                  remu         s6, s9, t2
                  fmin.s       ft11, fa6, ft6
                  ori          t5, a4, -768
                  fcvt.s.w     ft11, s8
                  srli         s8, s2, 10
                  xor          s3, s2, s8
                  fmul.s       fa6, ft3, fs3
                  sltiu        a1, t3, 1608
                  fsub.s       fa0, ft7, fs9, rmm
                  xor          a6, s1, a7
                  sltiu        s9, t1, -574
                  fle.s        s4, ft1, fs2
                  mul          a6, a2, t3
                  fsub.s       ft11, fs9, ft2, rdn
                  srl          a5, t1, a3
                  fsqrt.s      fs7, ft2, rdn
                  fle.s        gp, fs2, ft11
                  fclass.s     a0, ft7
                  fmin.s       ft9, ft5, fs11
                  xor          a1, t2, zero
                  srli         a3, a6, 12
                  fcvt.s.wu    fs2, t3
                  fsgnj.s      fa6, fa1, fa2
                  fmax.s       fs5, fa6, fs3
                  slt          t1, zero, s11
                  auipc        a0, 49781
                  flt.s        zero, ft8, fs6
                  mul          a3, a1, s8
                  rem          a0, t1, s8
                  srai         gp, s7, 14
                  sll          a1, a2, a0
                  remu         s11, sp, s4
                  fmv.w.x      ft7, a0
                  div          zero, s1, t0
                  add          a6, s5, gp
                  add          a6, a1, s9
                  fdiv.s       ft0, fs1, fs1
                  and          s9, sp, t0
                  fsub.s       fs7, fs11, ft1, rdn
                  fmul.s       ft3, fs8, ft3, rmm
                  srl          zero, t1, a2
                  fle.s        s7, fs1, ft9
                  fcvt.s.w     ft5, s9, rne
                  remu         s3, s6, s6
                  fadd.s       fs4, fa6, fa4, rtz
                  fcvt.wu.s    t0, ft5, rup
                  div          a6, a0, t0
                  mulh         s6, s6, t3
                  xor          s10, s0, s0
                  mulhsu       a4, gp, s2
                  srl          a7, s3, s8
                  lui          s9, 225173
                  fclass.s     s0, fs0
                  add          a5, t1, s4
                  ori          gp, a0, 1091
                  rem          a6, a0, gp
                  fsgnj.s      fs4, ft3, fa1
                  fsub.s       fa5, ft11, ft8
                  feq.s        a0, fa7, fs0
                  fsgnjx.s     ft5, ft8, ft10
                  fmv.w.x      fs2, t2
                  mulh         t1, t6, s7
                  xor          s3, s6, s4
                  sub          a4, s7, s2
                  mulhsu       a1, s10, s5
                  fcvt.s.w     ft3, a4, rne
                  mulhu        t2, a1, s4
                  fcvt.wu.s    zero, fa2
                  sra          ra, t5, s3
                  auipc        s0, 569754
                  fmin.s       fa6, fs8, fa2
                  fsgnj.s      ft7, ft2, fa1
                  xor          a6, s0, s5
                  flt.s        s3, fs2, fs10
                  slt          s6, t2, sp
                  addi         sp, a3, -874
                  feq.s        s8, fa1, ft9
                  fsgnj.s      fs4, fs7, ft2
                  add          t5, a6, zero
                  sltu         s6, s8, a7
                  fmul.s       fs3, ft9, ft3
                  fcvt.s.w     fs0, s10, rtz
                  divu         t6, s10, a5
                  sltiu        s6, s7, -461
                  lui          s5, 857790
                  fclass.s     s4, fa3
                  fsqrt.s      ft2, fa6, rdn
                  remu         zero, tp, t5
                  slt          t2, a6, t6
                  fle.s        gp, fs9, fa0
                  slt          t2, a7, zero
                  fle.s        a7, ft7, fa7
                  mulhsu       t2, s5, a5
                  srl          a7, s6, s7
                  srl          t2, t6, s3
                  fcvt.w.s     a7, fs4, rne
                  flt.s        t2, ft11, fa0
                  slt          s2, s10, zero
                  fmin.s       ft10, fs7, fa5
                  mulhu        s3, a7, t1
                  xor          t2, sp, t2
                  ori          s4, t3, 1231
                  slli         s0, ra, 25
                  srli         a0, s5, 5
                  sra          zero, s5, sp
                  addi         a5, a4, -1352
                  slti         t0, s2, 1625
                  fcvt.s.w     fs7, a6, rmm
                  fsqrt.s      fa2, fs6, rmm
                  sll          s9, a7, s1
                  xori         a1, s9, -1987
                  mulhu        a7, t0, s5
                  slt          s7, s4, ra
                  remu         ra, t0, t1
                  feq.s        s8, fa0, fa3
                  srai         a5, a5, 17
                  nop
                  lui          sp, 794683
                  andi         s4, a3, 1632
                  srli         sp, s0, 12
                  xori         s11, a6, -966
                  slti         s3, a0, 1186
                  srai         a6, a0, 3
                  srai         zero, s5, 23
                  srli         s6, s7, 7
                  sltu         s3, s4, ra
                  fcvt.s.wu    fa6, a3, rdn
                  mulh         s11, gp, a6
                  fcvt.wu.s    t1, fa3, rne
                  divu         s0, s8, tp
                  fmin.s       ft2, fs3, fs7
                  feq.s        s7, fs11, fa2
                  sll          s2, s5, s0
                  auipc        t2, 326498
                  or           t2, s2, s2
                  srli         s8, a6, 16
                  nop
                  fsgnj.s      ft4, fs1, ft4
                  sub          s4, s8, ra
                  and          t5, t3, a7
                  sltiu        s4, t2, -768
                  fsgnj.s      fs10, ft4, ft8
                  divu         a1, s2, t5
                  xori         s2, t4, 1594
                  fmax.s       fs3, ft2, ft2
                  fsgnjx.s     fs8, ft0, fs0
                  xori         t4, a3, 1774
                  ori          zero, a7, -1470
                  or           a4, t1, s4
                  fcvt.w.s     a1, ft10, rtz
                  slt          a1, s10, t6
                  feq.s        a1, fs1, fs1
                  sltiu        t5, s1, 853
                  fsgnjx.s     fs0, ft10, fs0
                  srai         a4, a5, 25
                  fle.s        s3, fs8, ft7
                  fsub.s       ft6, ft11, fs7
                  fmul.s       fs1, fa4, ft6
                  fsqrt.s      fs2, ft6
                  slli         s2, a5, 12
                  divu         zero, a4, s2
                  sltu         s6, a0, a4
                  mulhsu       t6, s9, t2
                  auipc        ra, 1013881
                  mulhsu       s8, a2, gp
                  mulhsu       a7, a0, s9
                  sra          s3, s7, t1
                  slti         a0, s1, 1071
                  fclass.s     t2, fs10
                  fsgnjn.s     fs10, fs0, ft3
                  sltiu        a7, a1, -2011
                  fsqrt.s      fs4, fs11
                  sltiu        s5, t4, -935
                  add          s1, sp, s4
                  fsub.s       fa5, ft1, ft11, rdn
                  fmul.s       ft1, ft8, fa0, rtz
                  fmax.s       ft9, fs7, ft11
                  slli         s7, t6, 23
                  fle.s        sp, ft6, ft11
                  andi         s4, t4, 754
                  fadd.s       ft10, fs2, fa0
                  auipc        s7, 124007
                  srai         sp, t1, 3
                  and          a1, s6, a4
                  fcvt.s.wu    fs4, a2
                  slt          t4, s2, s4
                  fsub.s       ft8, fa5, ft9, rdn
                  nop
                  fsgnjx.s     fs4, fs8, ft0
                  and          s2, a1, zero
                  sra          t4, s11, t6
                  fcvt.wu.s    s10, ft1, rdn
                  fsgnjx.s     fs6, fs11, ft8
                  mul          t6, t0, t5
                  fcvt.w.s     s5, ft8
                  divu         s11, gp, a4
                  fcvt.s.wu    fs1, t4
                  mulhsu       t2, s3, gp
                  fle.s        sp, fa4, fs8
                  add          s5, s8, t0
                  slti         t1, s4, -606
                  fsgnj.s      fa7, fa4, ft9
                  mul          s8, s10, s1
                  fmax.s       ft7, ft11, ft1
                  lui          ra, 932040
                  slt          t5, a0, a7
                  mulhu        t5, ra, a5
                  fmin.s       fs4, fa7, fa3
                  sub          s11, s10, sp
                  fadd.s       ft3, ft1, fs8, rup
                  fsub.s       fa5, fs7, ft6, rtz
                  flt.s        s7, fs3, fs2
                  nop
                  div          a5, t4, s2
                  fsqrt.s      ft3, fs8
                  fcvt.s.w     ft9, a3
                  fmin.s       fs4, fs3, fs1
                  mul          a5, s2, a6
                  mulh         s11, s0, a3
                  and          s7, sp, t5
                  and          s2, s4, a3
                  sub          a3, a1, a6
                  fcvt.wu.s    zero, fs6
                  addi         s4, s10, 1611
                  fmin.s       ft5, fa3, fa4
                  mulh         s7, t5, tp
                  fmul.s       fs5, fa6, fa6
                  div          t0, a1, s9
                  srl          a0, s6, a5
                  rem          a0, a1, s8
                  flt.s        s1, fs4, fa7
                  fsgnjx.s     fs3, fs4, ft10
                  xori         s3, a5, -1827
                  mulhsu       ra, tp, t3
                  fsgnj.s      fa7, ft10, fs7
                  lui          a5, 956777
                  mulhu        s1, t4, a5
                  fclass.s     a1, fs8
                  rem          a4, t5, gp
                  sra          t6, s7, t3
                  fsub.s       fs1, fa0, ft0
                  fmin.s       fs3, fs10, ft6
                  mulhu        s10, s0, zero
                  ori          s5, s8, 957
                  fclass.s     s2, fs2
                  flt.s        t0, ft4, ft4
                  addi         gp, s0, 120
                  fmax.s       ft3, ft9, fs11
                  andi         t2, a6, -2000
                  fcvt.s.w     ft10, s10, rup
                  mulhu        zero, s9, t3
                  lui          gp, 143502
                  fcvt.s.w     ft9, s1, rdn
                  fmax.s       fs2, fs6, ft5
                  fsgnj.s      ft8, fs10, fa4
                  and          t0, t3, a7
                  srai         ra, a3, 1
                  fsqrt.s      fs9, fa3
                  slli         a7, sp, 23
                  or           sp, a2, s7
                  feq.s        s3, ft8, ft4
                  flt.s        ra, fs2, ft9
                  slli         gp, t2, 21
                  fle.s        zero, fs10, fa0
                  mulh         s10, a0, t3
                  slli         s11, s0, 6
                  flt.s        s8, fs10, ft3
                  mulh         t5, s10, s10
                  sra          s4, s2, a5
                  xori         s7, s4, 1489
                  rem          s1, t6, t1
                  fcvt.wu.s    s9, fs2, rmm
                  andi         a5, t0, 1848
                  mulhsu       zero, sp, t6
                  mulhsu       a0, s8, s4
                  fsgnjn.s     fs11, fs8, ft6
                  slt          a5, a0, s8
                  flt.s        s2, ft11, ft2
                  srli         sp, gp, 2
                  fsqrt.s      fa1, fa0
                  fsgnj.s      fa2, ft6, fs4
                  fsgnj.s      fa6, fa5, fs2
                  flt.s        s5, fs9, fs2
                  lui          s2, 533225
                  fmv.w.x      ft9, a1
                  ori          a1, zero, 312
                  divu         ra, s4, zero
                  fmax.s       fs6, fs9, fs10
                  sltu         a3, s4, a1
                  fmv.x.w      s6, ft10
                  fsub.s       fs0, ft8, fs9, rtz
                  slli         a3, t1, 2
                  fcvt.w.s     s7, ft5, rtz
                  sltiu        s9, zero, 1846
                  fmv.x.w      t5, ft2
                  feq.s        a1, fs0, fs10
                  or           t0, t0, ra
                  xori         s11, t0, 231
                  fmv.w.x      fs3, s10
                  fsqrt.s      fs5, fs11, rup
                  feq.s        s5, ft1, ft3
                  mul          ra, gp, sp
                  xori         t4, zero, 893
                  fsub.s       fa0, ft4, ft5
                  fsub.s       fs6, ft8, fs11, rtz
                  remu         s9, s8, t1
                  fsgnjn.s     fa6, fs8, fa3
                  fsgnj.s      ft8, ft8, ft10
                  div          s7, s9, a6
                  sll          gp, s0, t5
                  flt.s        a5, fa1, fs10
                  fcvt.w.s     t1, ft5
                  fmv.w.x      fs1, t6
                  fsgnjx.s     fs10, fs3, ft10
                  xor          s4, s9, t5
                  srl          a1, t3, a7
                  fsgnjn.s     ft6, fs11, ft2
                  fsgnj.s      fs6, fs5, fa5
                  ori          t6, t2, -1822
                  fcvt.s.w     fs6, a3
                  mul          a6, s1, s8
                  and          a3, ra, a4
                  slti         s5, a2, -1795
                  andi         t2, t3, -1220
                  fsgnjn.s     ft6, fa0, ft1
                  fadd.s       fa3, fs9, ft0
                  add          s4, s8, a2
                  fsub.s       ft11, fa5, fa5
                  fle.s        a1, ft6, ft8
                  andi         s8, a3, 1592
                  slt          a7, s5, t2
                  fadd.s       fs10, fs2, fs4, rne
                  fsgnj.s      fa4, fs6, fa6
                  sltu         s4, a1, t6
                  fle.s        s4, fa6, ft8
                  fcvt.wu.s    s11, fs10
                  fadd.s       fs1, fs5, fs4, rmm
                  srli         a0, s8, 15
                  add          a7, t0, a7
                  fmin.s       fa4, fa5, fa1
                  fle.s        s0, ft5, ft0
                  nop
                  div          a5, t3, ra
                  mulhu        t0, a3, s5
                  feq.s        s0, fa0, fa0
                  slt          a6, a2, s11
                  fmul.s       fs2, ft10, fa1
                  lui          s10, 228544
                  fmv.w.x      fa3, gp
                  rem          s8, s7, s3
                  mulh         gp, t5, a7
                  rem          zero, s11, a1
                  slti         a6, t3, -16
                  andi         ra, s5, 216
                  srai         t6, a1, 17
                  fsub.s       ft7, fa1, fs4, rmm
                  fadd.s       fs5, fa1, fs10, rdn
                  auipc        s8, 99047
                  fadd.s       fs1, fs9, fa3, rmm
                  and          a4, s8, s0
                  fclass.s     gp, fa3
                  ori          s0, s10, -202
                  remu         s0, s10, a1
                  sltu         s6, s5, t0
                  sltiu        s8, s5, 960
                  mulh         zero, ra, t1
                  srli         s0, zero, 2
                  rem          s0, s2, a1
                  fclass.s     s6, fs5
                  and          t0, tp, a0
                  nop
                  fmv.w.x      ft0, a2
                  sltu         s10, s4, s0
                  fmax.s       ft8, fs10, fa1
                  srai         sp, ra, 8
                  feq.s        s11, fs1, fs1
                  divu         s3, s7, sp
                  fmv.w.x      fs2, s1
                  fsgnjx.s     ft3, fs7, fs4
                  slti         s7, t2, -1533
                  div          s9, t2, t2
                  fsqrt.s      fs8, fs1
                  or           gp, t1, zero
                  srl          a6, t6, s9
                  div          s5, s6, t2
                  mulhu        gp, s1, a7
                  mul          s4, s5, t0
                  flt.s        s10, fs11, ft10
                  sub          t5, s8, t6
                  fsqrt.s      ft8, ft2, rup
                  divu         t4, a3, s2
                  ori          t1, s10, -1681
                  fdiv.s       fa0, fs6, fa6, rdn
                  fle.s        s6, fs11, ft8
                  fsqrt.s      fa7, fa1, rne
                  mulhu        s7, t3, s6
                  fle.s        ra, ft1, ft5
                  fle.s        s10, fs9, ft9
                  flt.s        a1, fa3, fs1
                  fmax.s       fs0, ft10, fa1
                  fsqrt.s      ft1, ft7, rup
                  lui          ra, 1035522
                  and          a1, t4, t0
                  xori         gp, a5, -446
                  fcvt.w.s     s8, fs7
                  add          s11, s5, t6
                  fsgnjx.s     fs11, fa6, fs11
                  sra          t1, s5, s3
                  sra          s5, s2, s4
                  sltu         s10, zero, s5
                  fsgnjx.s     fs5, fs3, fs1
                  srli         a7, s7, 10
                  fcvt.s.w     fs5, tp
                  ori          s4, s0, -1636
                  fle.s        s2, ft3, ft6
                  srai         t1, s7, 0
                  fsub.s       ft10, ft9, fs4, rmm
                  add          s2, s6, sp
                  andi         a1, s0, -1606
                  div          s4, a4, t2
                  xori         t4, s11, 1955
                  sub          sp, a7, t4
                  nop
                  add          gp, s1, t2
                  fclass.s     t0, fs1
                  slli         s5, t2, 21
                  fsgnjn.s     fa7, fa5, fs4
                  and          a6, zero, a6
                  remu         a7, a5, s6
                  sra          s7, s10, s7
                  rem          s6, s9, a6
                  sltiu        a0, ra, 1678
                  slti         a7, tp, -549
                  fmv.x.w      a5, fs11
                  fcvt.s.w     fs7, gp
                  srai         s9, s5, 4
                  slli         s0, t1, 30
                  fmax.s       fs1, fs8, fs2
                  slt          t4, a6, a4
                  lui          a3, 250454
                  fsub.s       ft4, fs0, fs9, rne
                  feq.s        gp, fs1, ft8
                  fmin.s       ft2, fa4, fa6
                  auipc        t5, 924606
                  sltiu        a1, s10, 1547
                  mulhsu       zero, s11, s2
                  fclass.s     t1, ft10
                  fcvt.s.wu    ft8, sp
                  sub          t2, s9, t2
                  add          gp, a7, s6
                  feq.s        a3, fs5, fa0
                  nop
                  srai         t5, zero, 16
                  fsub.s       fs1, fa4, fs0
                  fsgnjx.s     fs4, fs4, ft0
                  div          zero, a1, t3
                  auipc        t2, 160185
                  slli         a0, ra, 23
                  feq.s        zero, fs0, fs7
                  fmul.s       fs6, fa2, fs4
                  fsgnj.s      ft1, fs7, ft6
                  mulh         s8, sp, s9
                  or           ra, a0, s9
                  div          t4, s10, s10
                  slt          a5, ra, s6
                  fmax.s       fa3, ft10, fs8
                  rem          s8, ra, a2
                  flt.s        a0, ft10, ft6
                  fadd.s       fs1, fs2, fs11, rtz
                  slt          s10, s10, s10
                  fsgnjn.s     ft2, ft11, fs2
                  fcvt.s.wu    fs8, s4, rne
                  mulhsu       a6, s2, ra
                  addi         t5, t3, 1189
                  sra          sp, s4, t4
                  and          s4, s9, a0
                  srl          a1, t1, s0
                  andi         a4, s11, 56
                  fmv.w.x      ft2, gp
                  xor          s10, s2, a0
                  sltu         t6, tp, s2
                  or           t6, s10, a4
                  fsgnjn.s     fs0, fs7, fa6
                  fadd.s       ft7, fa1, fs2, rdn
                  fmax.s       fa3, ft10, ft7
                  sub          s1, t3, sp
                  srai         a0, t2, 3
                  fmv.w.x      ft8, s9
                  fdiv.s       ft8, fs8, fs9, rmm
                  rem          gp, ra, s7
                  sub          ra, s8, a2
                  fmv.w.x      ft1, sp
                  sll          a5, s5, a1
                  addi         a7, a0, -435
                  mulhsu       s10, a1, s5
                  srai         s2, t3, 20
                  mulh         a4, t6, s4
                  srl          a0, gp, tp
                  fmv.x.w      s4, fa0
                  and          a0, t4, t2
                  srai         s2, t0, 23
                  fsqrt.s      fs6, fa6, rtz
                  fclass.s     s2, fa5
                  fmax.s       ft6, fs0, ft7
                  sltiu        a7, s0, -663
                  xori         zero, sp, -1231
                  flt.s        a5, fs8, fa2
                  ori          s8, s2, -89
                  fmul.s       fs2, fa3, fs2, rtz
                  xori         s8, s9, -1162
                  rem          s1, ra, s8
                  remu         sp, zero, s8
                  slt          a4, s2, t6
                  add          s1, t5, s9
                  feq.s        t1, fa6, fa7
                  fsqrt.s      fs2, ft4
                  srli         t2, t5, 21
                  divu         s10, zero, s0
                  mulhu        s2, a6, t2
                  sll          a0, t0, ra
                  feq.s        s1, fs11, fa1
                  srai         a4, a1, 26
                  fsub.s       ft3, ft4, ft3
                  auipc        s5, 298055
                  fcvt.wu.s    t5, ft4
                  xori         t4, a6, -773
                  sub          s0, t5, ra
                  fsgnj.s      fs11, ft2, fs1
                  sra          a0, s8, t4
                  fclass.s     t4, fs2
                  fle.s        sp, fa6, fs10
                  fmv.w.x      fs6, ra
                  sltu         a7, zero, s7
                  sub          zero, s10, a4
                  fmax.s       fa4, ft2, fs10
                  divu         t4, s5, s2
                  or           t5, t4, s5
                  srli         a1, a2, 10
                  fmin.s       fs7, fs8, fs10
                  fsqrt.s      fs2, ft9, rdn
                  fsgnjx.s     ft11, ft8, fa7
                  flt.s        t4, ft11, fa7
                  fmin.s       ft4, fs6, fs10
                  add          s7, a4, t4
                  mul          t4, t2, t4
                  slti         t5, s1, -832
                  fle.s        s0, ft0, ft11
                  or           a3, s11, t5
                  slli         a3, a7, 28
                  fmv.w.x      fa3, s8
                  sltu         s7, t2, tp
                  fsgnjx.s     fa7, ft7, fs9
                  fsgnj.s      ft0, ft3, fs6
                  fmv.w.x      fs10, s4
                  xori         zero, s11, 609
                  auipc        a3, 577591
                  and          s9, s2, a3
                  divu         t2, sp, s7
                  fmax.s       fs11, fs6, fa6
                  mul          zero, a1, t3
                  fsgnj.s      fa4, fs2, ft6
                  sll          s1, t2, s5
                  slli         s9, t4, 18
                  fmv.x.w      a4, fa3
                  fcvt.s.wu    fa5, gp
                  mulhu        t6, a6, s8
                  fsqrt.s      ft2, ft9, rmm
                  xor          s4, s6, a5
                  div          s6, t2, t3
                  slt          s10, s6, a4
                  fadd.s       fa1, fs9, ft1
                  fsub.s       fa5, fs4, fs8, rne
                  mulhsu       s5, gp, t4
                  div          s6, t5, s4
                  andi         t1, s11, -708
                  fcvt.s.w     fs5, s3
                  sltiu        t1, s4, 704
                  divu         s7, a7, a6
                  fmv.x.w      s3, ft9
                  fmv.w.x      fs7, sp
                  fmv.w.x      fs1, t4
                  flt.s        s0, fs5, ft6
                  flt.s        s5, ft7, ft5
                  mulhu        a5, t3, s3
                  sltiu        a1, s7, -300
                  auipc        a6, 437200
                  and          s6, ra, a5
                  sltiu        s6, t1, 899
                  sltiu        t2, s0, -1922
                  fmul.s       fa2, fs4, ft2
                  srli         a1, tp, 5
                  ori          a5, s4, 1426
                  slti         s9, t1, 1234
                  fcvt.s.w     fs10, zero, rmm
                  ori          zero, tp, 1519
                  slli         t5, tp, 18
                  fcvt.s.w     fs5, t2
                  slli         s5, sp, 12
                  fadd.s       fs7, ft1, ft8, rup
                  add          t6, zero, t1
                  mulhsu       t1, s6, tp
                  mulhsu       s8, s0, t5
                  fcvt.s.wu    fa6, a7
                  sltiu        a4, a4, -925
                  auipc        a5, 312707
                  feq.s        a1, fs7, ft6
                  andi         ra, s1, -1039
                  slli         s1, s1, 12
                  fmax.s       ft4, ft7, ft3
                  fcvt.s.wu    fs9, t4
                  ori          gp, a3, -1300
                  sltu         zero, a4, a6
                  mulhsu       s6, a1, s11
                  fcvt.w.s     s0, fs10
                  fle.s        s10, ft8, ft6
                  fcvt.wu.s    s1, fs9, rne
                  sub          zero, s9, a0
                  sra          a7, s5, s2
                  mul          s10, a4, ra
                  mulh         a6, s7, s0
                  slli         a6, s4, 9
                  rem          t5, a2, a6
                  or           s9, s4, s11
                  fmul.s       fa1, fs8, fs7, rdn
                  slli         a6, a5, 17
                  div          t5, t0, t5
                  fsgnjn.s     ft4, fs3, fa3
                  fsgnjx.s     ft7, fs7, fs7
                  feq.s        a4, fs1, fa3
                  fadd.s       fs8, ft0, ft7, rne
                  srl          t0, s2, t0
                  nop
                  fle.s        a3, fs0, ft10
                  andi         s1, a4, 66
                  fmax.s       fa4, fs5, fs5
                  xori         a4, s8, 1778
                  fmv.w.x      fa2, a3
                  mul          a3, s1, sp
                  sub          s0, a0, s4
                  add          t0, s4, a2
                  fcvt.wu.s    s9, ft9, rdn
                  fsub.s       fs6, fs3, fs3
                  fcvt.w.s     gp, fs4, rne
                  feq.s        s4, fs8, ft0
                  mulhsu       s10, ra, s5
                  fmul.s       fs1, fs2, fs11
                  fle.s        sp, fs3, fa5
                  sra          t2, tp, a3
                  slti         s4, s3, -696
                  fsqrt.s      ft9, ft6
                  fsgnj.s      fa2, ft10, fs6
                  fcvt.wu.s    a5, ft4
                  flt.s        ra, ft3, ft2
                  mul          a3, s4, a5
                  rem          s8, s6, s2
                  fsgnj.s      fa2, fs1, fs5
                  divu         a7, a5, gp
                  remu         t6, a5, s3
                  fcvt.s.w     fs8, t5
                  addi         s7, s1, 1526
                  slt          s8, a3, a4
                  xori         t6, s2, -923
                  fmin.s       fs0, ft7, fs9
                  andi         s11, a2, -1595
                  fle.s        s4, fs2, fs2
                  fcvt.w.s     a7, ft10
                  nop
                  slt          s2, t1, s4
                  sll          ra, s10, s7
                  div          t5, t5, s10
                  fmv.w.x      fs9, t4
                  sub          t2, s10, s4
                  fsgnjx.s     ft7, fa3, fa0
                  srai         s4, a7, 23
                  slt          s4, s3, s0
                  auipc        s1, 922448
                  fdiv.s       ft3, fa3, fs0, rdn
                  fcvt.s.wu    fs8, s11, rtz
                  slti         zero, t4, -1255
                  mulhu        s5, s7, a3
                  sltu         s8, a1, a0
                  fsgnj.s      fs8, fs11, ft8
                  sltiu        a6, a4, 1383
                  slti         s6, s8, -1377
                  sub          s6, a2, s4
                  and          s0, gp, s9
                  add          s1, zero, s11
                  fmv.x.w      a0, ft4
                  and          t4, a3, s11
                  srli         s5, s6, 23
                  fcvt.w.s     zero, ft7, rmm
                  fcvt.w.s     a1, ft1
                  fcvt.s.w     ft0, s9
                  fcvt.wu.s    a1, fa6
                  fmv.w.x      fs11, t5
                  mulhu        t5, ra, a1
                  sll          s5, a2, ra
                  fsgnj.s      fa5, fs6, fs4
                  fmul.s       fs2, ft8, fs0, rne
                  mulh         s0, t1, tp
                  flt.s        s4, fs7, fs11
                  flt.s        s7, fa1, ft10
                  or           s9, t3, a0
                  fclass.s     a5, fs11
                  fmin.s       fa1, fa6, fa1
                  fsub.s       ft5, fs2, ft4, rmm
                  srl          s5, t0, s8
                  nop
                  fsgnjx.s     ft4, fs1, ft6
                  slt          sp, t6, s7
                  feq.s        t2, fa2, ft7
                  divu         ra, a7, s11
                  slt          sp, s6, t4
                  fmul.s       fa6, fa7, fs5
                  auipc        s11, 128500
                  fmax.s       fs8, fs2, ft11
                  sltu         s7, s1, s0
                  addi         s4, a1, 1031
                  sra          t2, s4, a2
                  divu         gp, a0, a7
                  fsgnj.s      fa3, fa3, fa3
                  remu         a3, s5, t5
                  fcvt.s.w     fa4, s8, rdn
                  addi         a4, tp, 92
                  or           ra, s8, s9
                  fcvt.wu.s    s10, ft2, rdn
                  add          s9, s10, t5
                  sra          s11, ra, t2
                  lui          t5, 102082
                  rem          t0, t3, a2
                  divu         s5, ra, s8
                  mulhsu       s11, t3, gp
                  lui          s2, 74972
                  fsub.s       fa5, fs1, ft7
                  div          s3, s11, s1
                  slti         t5, s3, 1813
                  auipc        t1, 40611
                  fcvt.wu.s    a6, ft10
                  fsgnjn.s     fa6, fs11, ft9
                  sltu         sp, s7, s2
                  sltiu        s2, a1, 344
                  flt.s        a1, ft0, ft5
                  fcvt.s.w     fs5, t3, rdn
                  fadd.s       fa2, fs11, fs5, rmm
                  fcvt.wu.s    s0, fs9
                  div          t0, ra, a6
                  xor          t1, a4, t4
                  flt.s        s7, fs4, ft0
                  add          t2, zero, s11
                  lui          t5, 794344
                  fdiv.s       fs5, fs2, fs10, rdn
                  fmin.s       fa7, fs10, fs9
                  fsgnjx.s     fs8, fs8, fa2
                  mulh         s6, s0, s8
                  andi         t0, t6, 350
                  fsub.s       ft3, ft6, fs3, rdn
                  fmax.s       fs0, ft9, ft5
                  fmv.x.w      t1, fs5
                  xori         a4, s9, 1003
                  slti         t2, a7, -1746
                  fcvt.w.s     s10, fs5, rne
                  fadd.s       ft1, ft9, ft8, rtz
                  sll          a0, s2, sp
                  mul          zero, s2, a3
                  sltiu        t4, zero, 1424
                  mulhu        a7, t5, t6
                  remu         s10, t3, t0
                  fadd.s       ft11, fa6, ft7
                  sub          gp, a5, a3
                  fcvt.wu.s    a1, fa4
                  fsgnjx.s     fs3, fa3, fa6
                  fdiv.s       fs9, fa4, fs0
                  slt          s7, s0, a4
                  fmv.x.w      t0, ft7
                  fcvt.s.w     fa2, tp
                  fcvt.w.s     ra, ft0, rup
                  div          s11, a2, a4
                  sll          s10, s11, t3
                  or           t1, a2, s5
                  sltiu        sp, a5, -106
                  fsgnj.s      ft7, fa5, fs1
                  remu         s1, t2, zero
                  remu         a6, gp, a4
                  divu         a7, t5, a4
                  srli         a4, gp, 19
                  feq.s        gp, fa6, fs2
                  fcvt.s.wu    ft0, a2, rne
                  mulh         s0, s1, gp
                  srai         s4, s4, 0
                  sra          t6, t6, t3
                  xori         gp, a6, 1922
                  fmul.s       ft10, fs8, fs3
                  fle.s        s9, fs8, ft3
                  sra          t6, t6, s9
                  ori          s7, s1, 1310
                  add          sp, a4, a0
                  div          t2, s11, a7
                  nop
                  srli         t0, zero, 6
                  mul          a0, a3, a5
                  fmul.s       fa4, fs2, fs7, rdn
                  sll          a1, s3, t2
                  slli         a5, s4, 13
                  ori          s10, zero, 349
                  xori         s0, a5, -1096
                  add          zero, a1, s2
                  slli         s1, t3, 28
                  fsub.s       fs8, ft9, fa4
                  add          t5, a1, t3
                  xori         a5, s2, -1633
                  fsgnj.s      fs4, fa2, ft2
                  andi         s2, a0, 802
                  mulhu        a7, s4, t4
                  xori         s0, a5, -127
                  fcvt.wu.s    s7, fs8, rup
                  sra          zero, s7, s2
                  nop
                  fmv.x.w      s6, fs6
                  fmin.s       fa6, fs10, ft0
                  fcvt.s.w     ft9, t1
                  ori          t0, a3, -1067
                  mulhu        s11, a0, a2
                  fmv.w.x      fs0, tp
                  slt          s5, t2, s2
                  addi         t2, t3, 1712
                  lui          a1, 897837
                  div          s1, t1, s11
                  fsgnjn.s     fa6, fa5, ft6
                  srl          gp, s3, s6
                  fsub.s       ft0, ft10, ft2
                  xor          a0, s3, s4
                  mulh         a3, s1, a4
                  remu         s9, tp, t0
                  mulhsu       t5, sp, s1
                  fclass.s     a5, fs5
                  fadd.s       fs0, fs2, ft11
                  sll          t2, a6, t2
                  and          s9, s6, t6
                  sll          s2, zero, tp
                  fmul.s       fa6, ft10, fs6
                  addi         a7, t1, -682
                  nop
                  feq.s        a0, fa3, fs5
                  fmv.x.w      s4, ft7
                  xor          a1, s6, a6
                  sltu         s6, tp, s10
                  sltu         a7, t4, s4
                  fsgnjx.s     fs1, fs2, fa7
                  srli         ra, s4, 21
                  mulh         s8, gp, zero
                  add          s3, a6, s7
                  slti         s0, t6, 1980
                  fsgnjn.s     fs9, ft1, fs10
                  mulh         t5, t3, s4
                  andi         t6, a2, -764
                  addi         sp, a1, 19
                  fcvt.s.w     fs6, s2, rup
                  fmv.w.x      ft6, t0
                  fdiv.s       ft6, fs1, fs6, rne
                  slti         t0, a4, 873
                  remu         s4, s9, a1
                  fsqrt.s      ft7, ft3, rmm
                  fmin.s       fa5, ft8, fs6
                  mulhsu       zero, s7, a7
                  slti         a6, s5, 636
                  and          s9, s6, a4
                  srai         a3, s5, 19
                  and          sp, t1, s7
                  add          a3, t6, s4
                  fmv.w.x      fa6, a3
                  auipc        s9, 704800
                  fsgnj.s      ft6, fs9, ft11
                  sltiu        t6, s0, -5
                  fsgnjn.s     fa5, fs3, fa7
                  sltu         t1, s10, s2
                  sra          a3, tp, s0
                  fclass.s     a3, fa0
                  srli         s7, s1, 28
                  fcvt.wu.s    s9, fs11
                  xor          s3, a1, a2
                  fsgnjn.s     fs11, fs3, fa7
                  fmv.x.w      s3, fs0
                  srli         t1, a6, 28
                  lui          s7, 946379
                  mul          t5, t5, t4
                  sll          sp, s7, s8
                  sll          s3, a3, t0
                  slli         s5, a4, 16
                  fmv.w.x      fa2, t1
                  mulhsu       a3, s10, ra
                  andi         zero, t0, 961
                  nop
                  or           t0, s9, s2
                  lui          s11, 3300
                  and          a7, s3, s9
                  fcvt.s.wu    ft11, t6
                  fsgnj.s      fs8, ft6, fa7
                  mulhsu       t2, s1, s8
                  flt.s        s0, fs2, ft2
                  andi         a7, a6, 1607
                  fmin.s       fa1, ft9, fa7
                  fsub.s       ft1, fs7, fs7, rmm
                  andi         s6, t1, -1377
                  slli         a7, t3, 28
                  slti         s0, a5, 1516
                  srai         a7, a3, 16
                  or           t5, s3, t3
                  add          t1, a0, a5
                  remu         s4, s4, t4
                  lui          s3, 425696
                  fadd.s       fs10, fs11, ft6
                  nop
                  auipc        s11, 143290
                  xori         s11, s8, 1931
                  srai         a7, a4, 13
                  fadd.s       fs6, fa0, fs5
                  sltiu        a5, a7, 1132
                  add          t2, a4, a4
                  fmv.w.x      fa5, a6
                  fclass.s     s10, fs6
                  addi         a5, s7, -1700
                  fcvt.s.wu    fs8, s11
                  add          s11, s2, a1
                  or           s8, t2, tp
                  addi         t0, t6, -1630
                  srl          a4, s5, s9
                  fmv.w.x      fs4, t6
                  slt          ra, a6, s1
                  fadd.s       fa5, fa6, fs3, rmm
                  fsgnjx.s     ft2, fs0, fs1
                  nop
                  mulhu        s3, s7, s8
                  sltiu        s10, t2, 368
                  add          zero, a2, s9
                  sub          s1, t6, a3
                  fmin.s       fs2, ft10, ft5
                  fcvt.wu.s    s7, fs1
                  fle.s        s5, fa5, fa2
                  sra          s10, a5, s11
                  sltu         a4, s5, t3
                  fsgnj.s      fa4, ft11, fa2
                  divu         s1, a4, a2
                  fsgnjx.s     fa7, ft6, ft6
                  divu         t4, t4, a3
                  addi         t6, s3, 1671
                  srl          a1, s0, t0
                  fsgnj.s      ft8, ft3, fs4
                  or           a0, s1, a5
                  flt.s        s5, fa5, ft10
                  feq.s        s7, fs0, fs5
                  mulh         sp, a5, a1
                  divu         a5, s4, gp
                  rem          s0, s9, s2
                  fadd.s       fa7, ft4, fs3, rtz
                  fsgnj.s      fs1, ft2, ft2
                  fsqrt.s      ft6, fa2, rtz
                  fcvt.wu.s    t5, ft5, rmm
                  slt          a1, a4, s10
                  srai         t5, a7, 22
                  fdiv.s       fa3, fa0, fa2, rup
                  fclass.s     t2, fa1
                  mulhu        ra, s4, t5
                  fsqrt.s      ft6, fs3
                  ori          a4, s3, 1733
                  srli         sp, t5, 28
                  sltiu        t1, s0, 14
                  srai         t0, a1, 4
                  slt          s10, s11, t0
                  fcvt.s.wu    fa4, s5
                  slt          t2, gp, a6
                  ori          s6, s0, -1952
                  slt          s9, t1, a2
                  auipc        t5, 308120
                  mul          ra, a1, s0
                  rem          sp, t2, a2
                  flt.s        zero, ft10, ft10
                  or           a7, gp, s6
                  add          s9, t1, s3
                  rem          a5, s4, s8
                  fsgnjx.s     fa1, fs8, fs6
                  fsgnj.s      fs6, ft3, fa4
                  mulhu        a0, s3, s8
                  fdiv.s       fa3, fs9, fs8, rdn
                  slti         t0, s1, -96
                  xor          t6, s1, s9
                  mulhu        zero, s9, s10
                  flt.s        a3, fa4, fs1
                  fmul.s       fs7, fs8, fs6, rtz
                  feq.s        t5, ft1, ft9
                  mulh         a4, a5, a7
                  or           ra, a4, t5
                  fsgnjn.s     fs10, fs9, fa1
                  fcvt.s.w     fs4, a6, rmm
                  fsqrt.s      fs3, fa6
                  fcvt.s.wu    fa4, s0, rmm
                  add          s8, sp, a6
                  rem          ra, a0, s3
                  mulh         s11, a3, s2
                  srl          a1, a2, a4
                  feq.s        a4, ft1, fs2
                  sra          a0, s11, zero
                  divu         s5, a7, t0
                  sra          s1, s11, gp
                  slt          a6, tp, a6
                  flt.s        t0, ft11, ft9
                  fsgnj.s      fs2, fa6, fs0
                  auipc        a1, 202641
                  fmv.x.w      a3, fa5
                  lui          gp, 240335
                  slt          sp, t0, s6
                  auipc        a6, 709362
                  sltiu        s7, t6, 370
                  srli         t0, a2, 31
                  rem          s8, a4, a6
                  srl          s6, s6, a2
                  srai         t2, s7, 9
                  fdiv.s       fa6, ft9, ft3
                  xor          s7, a2, a6
                  lui          s7, 322211
                  slt          t6, ra, s2
                  fcvt.s.w     fs5, s1, rmm
                  fmax.s       ft11, ft10, fa5
                  lui          a7, 348791
                  auipc        ra, 13985
                  fsqrt.s      ft8, fs0, rdn
                  lui          s2, 547010
                  or           a0, t5, s7
                  fsqrt.s      fs10, fs0
                  fsgnj.s      ft0, fa3, ft8
                  andi         t0, t4, 1884
                  fsgnjx.s     fs5, fa1, fa7
                  sltiu        t2, t1, -371
                  fsub.s       fa4, ft8, fs3, rdn
                  mulh         s2, t3, a6
                  mulhu        s1, t2, a0
                  sub          t4, t0, a4
                  slli         sp, t4, 5
                  sll          gp, s9, a4
                  mulhsu       t6, a2, t5
                  fdiv.s       fs0, fa5, ft11
                  fmax.s       fa5, fs3, ft8
                  mulhu        s8, a7, s6
                  nop
                  sltu         s5, s5, a1
                  xor          a0, t5, t0
                  andi         s7, zero, 1526
                  remu         s2, t4, tp
                  fmv.x.w      a4, ft1
                  mul          s4, s9, t0
                  fle.s        a0, fs3, fa0
                  div          a0, t5, s6
                  div          s10, s6, s7
                  srl          t6, s11, a6
                  srli         s8, gp, 4
                  mulhsu       zero, s5, a0
                  remu         s10, s4, s10
                  fsgnj.s      fs0, fs4, fs1
                  rem          s11, s10, s3
                  fsgnjx.s     fs6, ft2, fs0
                  div          t4, t5, a6
                  addi         zero, ra, 619
                  fsub.s       fs11, fa4, ft1, rne
                  divu         zero, s0, a6
                  slti         t2, a2, -1543
                  fcvt.s.w     ft7, a1, rne
                  mulhsu       s7, a2, t6
                  lui          s5, 959724
                  fcvt.wu.s    a0, fs3, rtz
                  xor          s3, a7, t3
                  sltiu        a1, s8, -627
                  nop
                  addi         s8, t0, 634
                  mulh         s2, sp, t0
                  lui          a0, 490060
                  remu         t4, a4, zero
                  fmv.w.x      ft11, zero
                  srai         t6, zero, 12
                  fsqrt.s      fs9, fs2
                  sra          s7, s1, s6
                  feq.s        s1, fs5, ft1
                  srai         a3, t6, 0
                  fcvt.s.wu    ft3, s7, rup
                  fcvt.wu.s    s6, fa5, rdn
                  fcvt.s.wu    ft4, a1, rne
                  fmin.s       fa3, ft7, fs10
                  slt          s9, t5, s2
                  mulh         s0, t6, s7
                  slt          s10, zero, s9
                  fsqrt.s      ft5, ft9, rtz
                  fmax.s       ft6, fs9, fs11
                  fcvt.s.wu    ft10, a1, rtz
                  mulhu        s6, a7, gp
                  andi         a5, ra, -1459
                  add          s1, s6, a1
                  mulh         t2, t4, s11
                  fmax.s       fs11, fs2, fa3
                  fle.s        t1, fa6, fs4
                  lui          a0, 933167
                  fmin.s       fs0, ft9, fs9
                  fsgnjn.s     fs3, ft11, ft7
                  mul          s9, t4, s7
                  nop
                  fmul.s       fs4, ft10, fa1
                  sra          s2, a7, a0
                  xori         s2, zero, -518
                  sub          s11, s9, t2
                  srai         s6, t5, 7
                  fcvt.s.wu    fs3, s7, rup
                  srl          a4, s8, a3
                  fclass.s     a3, ft1
                  rem          a4, a0, t0
                  mulh         t4, s6, s11
                  auipc        s11, 19349
                  ori          a0, ra, 1761
                  lui          a7, 451690
                  xori         s7, t1, -1151
                  fclass.s     s10, fa2
                  slli         s8, tp, 6
                  fmv.w.x      fa2, s7
                  mulhsu       s2, s9, zero
                  rem          ra, s3, a7
                  flt.s        zero, fs1, ft4
                  fsgnjx.s     ft6, ft4, ft10
                  srl          s2, t2, s8
                  divu         a7, s7, t1
                  sltiu        s9, t1, -925
                  sltiu        a6, s9, 1304
                  nop
                  sltu         t6, gp, tp
                  xori         s0, t2, 1054
                  srl          s5, t1, a6
                  sub          t0, a0, tp
                  fmax.s       fs9, ft9, fa5
                  sra          s5, a6, t1
                  fsqrt.s      fs1, ft5
                  fmax.s       fs0, ft10, fa2
                  mul          s2, s1, a0
                  nop
                  add          s10, a6, s5
                  mulhu        t5, sp, s2
                  fmv.w.x      fa6, t6
                  slt          s9, s4, sp
                  fsgnjn.s     fs3, ft0, fs9
                  remu         t0, sp, s7
                  srli         t4, t5, 0
                  auipc        t1, 385108
                  fcvt.s.w     fs6, zero, rtz
                  div          s5, s5, t5
                  sltiu        s3, a3, 697
                  fcvt.wu.s    s8, fa3, rmm
                  nop
                  xor          a6, gp, s11
                  mulh         s4, zero, a2
                  mul          zero, ra, gp
                  fmv.x.w      a1, ft1
                  and          t5, t5, s3
                  div          t2, s6, sp
                  addi         a3, a2, 935
                  div          s1, s10, s5
                  lui          t6, 638048
                  srl          s0, t1, t1
                  sll          s2, t6, tp
                  fsgnjn.s     ft4, ft0, ft2
                  srli         s5, s2, 22
                  feq.s        s8, ft0, fa5
                  ori          s5, zero, 353
                  fadd.s       fs8, fs8, fs9, rmm
                  andi         a0, t3, -1748
                  flt.s        a1, fs1, fs3
                  mul          s4, s0, s8
                  andi         s1, s6, 1457
                  fsgnjn.s     ft11, ft9, fa3
                  addi         s8, s0, 422
                  fsgnjn.s     fa0, fs2, ft11
                  fle.s        t5, ft1, fs5
                  andi         gp, s5, -1588
                  add          s9, s7, zero
                  auipc        a1, 718273
                  mulhu        s5, s2, a6
                  fcvt.wu.s    a1, ft6
                  fclass.s     s0, ft7
                  or           s4, s6, s10
                  feq.s        s2, ft4, fs8
                  srai         a1, gp, 14
                  fle.s        a3, fa4, ft3
                  fcvt.s.w     ft9, s4, rne
                  fle.s        a1, ft5, ft7
                  fcvt.s.w     ft3, a2, rne
                  sltu         t6, t4, ra
                  xor          t5, sp, t2
                  remu         a4, gp, t3
                  divu         s10, s3, t1
                  fclass.s     s6, fs0
                  nop
                  remu         s7, s3, s1
                  fmax.s       ft1, fs7, ft0
                  or           s10, a2, s5
                  fmin.s       fs3, ft9, fs5
                  sub          s2, t0, s0
                  fsgnjn.s     fs10, ft1, ft4
                  div          s7, a5, t3
                  slt          a7, t1, t3
                  remu         s2, s11, s7
                  andi         s5, t1, 650
                  fcvt.s.wu    fs11, a7
                  add          a6, zero, s3
                  sra          s2, s6, sp
                  and          s6, s9, s7
                  mulhsu       s0, t1, s7
                  mulh         s7, s5, t2
                  fmax.s       fa1, fa5, ft9
                  fclass.s     s1, fa0
                  slti         gp, a4, -1476
                  slli         t1, s7, 26
                  mul          s11, s6, a0
                  nop
                  flt.s        gp, ft4, ft11
                  sltu         s11, gp, a0
                  srl          a4, zero, a1
                  addi         s10, a2, -761
                  fcvt.s.w     ft5, t4
                  fsub.s       fs8, fa7, fa7, rdn
                  andi         a4, a6, -1740
                  fle.s        s1, fs1, fs11
                  ori          s11, a4, 386
                  srl          s9, a3, a4
                  srai         ra, s9, 24
                  divu         a4, a2, s6
                  mulh         s2, s0, t6
                  fadd.s       ft9, ft10, fa2, rup
                  fcvt.s.wu    fa5, t2, rmm
                  fmin.s       fs0, fs1, ft11
                  fcvt.s.w     ft6, s4
                  flt.s        s5, fa4, fs11
                  slli         t0, ra, 29
                  fsub.s       ft6, fs6, fs0
                  srli         s3, sp, 7
                  fmul.s       fs8, fs5, fs3
                  fle.s        s10, fs1, fa1
                  mulh         ra, a3, s9
                  remu         a3, ra, zero
                  and          ra, s6, s2
                  mulh         s11, s1, a5
                  fmul.s       fs0, fs3, fs3
                  feq.s        s4, fa5, fs4
                  ori          a7, ra, 1723
                  auipc        a5, 328796
                  fcvt.s.w     ft0, t6, rtz
                  nop
                  fmax.s       fa2, ft7, fs8
                  fsgnjx.s     fs1, ft2, ft11
                  fsub.s       fs11, fs10, fa2
                  slti         s0, zero, 513
                  and          a5, s7, s3
                  feq.s        a5, ft6, fs11
                  lui          s8, 908693
                  feq.s        ra, ft8, ft5
                  addi         t5, gp, 1020
                  and          a5, a3, zero
                  srl          a1, t0, s9
                  fsgnjx.s     fs10, fa3, ft9
                  fclass.s     s10, fa2
                  fsgnj.s      fs5, ft11, ft4
                  fcvt.s.w     fs9, t2
                  sra          s1, a0, t6
                  fclass.s     ra, ft8
                  rem          s5, s0, s2
                  remu         t4, zero, s8
                  fmin.s       ft2, fs7, fs2
                  nop
                  lui          t5, 706909
                  srai         ra, t1, 16
                  fsgnj.s      fs7, ft1, ft2
                  fle.s        t5, fs11, fs8
                  fmin.s       fa6, fs2, fa3
                  sra          t5, s5, t0
                  ori          zero, s3, -718
                  fmv.x.w      sp, fs5
                  fmul.s       fs9, fa7, fs1, rup
                  remu         s7, a5, s3
                  sub          s9, s2, s10
                  mulh         s1, s2, zero
                  fcvt.w.s     t4, fs5
                  or           a1, t2, zero
                  slti         s9, sp, 724
                  fsub.s       ft4, ft2, fs8
                  fmin.s       ft8, ft4, fa5
                  fcvt.s.wu    fa0, t1
                  andi         s11, a2, -311
                  divu         t6, s5, a4
                  rem          s0, s2, s6
                  slli         a0, s6, 0
                  fcvt.w.s     a6, ft1, rne
                  mulh         s5, s11, a5
                  slti         a4, s6, 223
                  slt          t5, a4, s8
                  fclass.s     t4, fa0
                  auipc        a4, 952583
                  addi         s9, s3, -1636
                  div          s9, t6, t0
                  auipc        s4, 557443
                  fmv.x.w      s10, ft5
                  div          s9, s3, a2
                  remu         t5, s11, a6
                  fmv.w.x      ft0, a1
                  sra          s1, t0, s3
                  add          t6, s4, s8
                  addi         s10, s3, 711
                  fmax.s       fs6, ft3, ft1
                  addi         t5, zero, 1993
                  or           a3, s6, a7
                  sll          a4, a5, s7
                  xor          a4, a1, s1
                  add          zero, t0, sp
                  srli         a5, a4, 29
                  srli         t6, zero, 23
                  auipc        a4, 889206
                  div          s7, a6, a0
                  ori          s3, s1, -897
                  sltu         s0, t4, s3
                  slti         s8, a5, -1614
                  and          s9, tp, s0
                  fmv.x.w      t4, fs8
                  fsqrt.s      ft10, ft4
                  remu         t0, a3, s2
                  slt          s7, t6, zero
                  or           s3, t6, a6
                  srai         s3, a2, 16
                  remu         t2, a5, a1
                  feq.s        s1, ft5, ft9
                  feq.s        s7, fs7, fa0
                  xor          a0, s9, t0
                  sltu         s7, s0, s8
                  and          t0, tp, a3
                  fsgnjn.s     fa0, fs3, ft1
                  fadd.s       fs9, fs3, ft10, rtz
                  fsqrt.s      fs8, ft11
                  mulhsu       s8, a7, t1
                  andi         a6, sp, -1944
                  lui          t2, 966112
                  slli         s5, ra, 24
                  fsqrt.s      fa0, ft10, rdn
                  ori          t5, s0, -727
                  addi         s1, t4, 396
                  fmin.s       ft1, fs6, ft3
                  divu         zero, a6, s4
                  addi         t5, t6, -1689
                  flt.s        s8, fs10, ft0
                  add          t1, t3, s0
                  srai         s1, a0, 16
                  fcvt.s.w     fa5, s5
                  sltiu        ra, t2, 1514
                  nop
                  xor          s7, t5, a6
                  slli         s3, a0, 17
                  fsgnj.s      ft7, fs2, ft0
                  slli         t2, t5, 10
                  and          a1, a6, ra
                  mulhsu       s0, zero, s1
                  fcvt.w.s     t2, fa2
                  divu         t0, t1, sp
                  fmv.x.w      s5, fs8
                  add          s9, s11, a7
                  fcvt.w.s     t5, fs0
                  srli         s3, a0, 14
                  fcvt.s.w     fa1, zero
                  divu         s11, a5, t5
                  srli         s7, t1, 14
                  or           t6, s11, t3
                  fsgnjx.s     fs2, ft1, fs11
                  remu         a0, s1, s9
                  mulhsu       s10, s1, t6
                  srli         s7, s11, 5
                  fclass.s     a4, ft10
                  fdiv.s       ft5, fa3, fs0
                  add          a6, zero, sp
                  addi         a1, a0, -1533
                  fdiv.s       fa7, fs11, fa0, rne
                  andi         ra, t4, 1181
                  andi         s1, t3, 1503
                  slti         t4, a7, -231
                  mulh         a5, a7, a5
                  mulhsu       s7, a2, a4
                  auipc        a5, 746360
                  rem          a5, ra, a4
                  fmv.w.x      ft10, a2
                  sltiu        a3, s8, -1850
                  lui          s6, 505764
                  add          a7, s10, s8
                  add          sp, t1, s10
                  fdiv.s       ft10, fa0, fa5, rdn
                  xori         a4, t0, -1178
                  sltu         t2, a2, a4
                  mul          t0, a0, s3
                  srai         a5, t6, 1
                  remu         ra, t3, a5
                  fsgnj.s      fa2, fa7, ft0
                  remu         s6, sp, a1
                  or           a7, s8, s0
                  srl          gp, a7, s4
                  fle.s        a0, ft0, ft7
                  fle.s        gp, ft9, fa5
                  addi         t2, s4, -564
                  xor          gp, a3, s5
                  flt.s        t1, ft3, ft11
                  flt.s        zero, fs7, ft9
                  addi         a6, a6, 178
                  slli         a5, s10, 13
                  addi         t2, a4, -763
                  slti         s6, s6, -618
                  sll          zero, a1, ra
                  fmin.s       ft9, ft11, fs4
                  div          a0, t4, t2
                  and          gp, s10, s5
                  fclass.s     t4, fs8
                  fmax.s       ft5, fa3, ft7
                  fsqrt.s      ft3, ft5
                  sll          a3, a4, s6
                  fsub.s       fs0, ft2, fa3
                  fmv.x.w      s9, ft7
                  fmin.s       fs4, fs2, fa1
                  fmax.s       fs11, ft3, fa2
                  sll          t5, ra, sp
                  srl          t4, a3, s0
                  mulh         t4, s7, a6
                  fsgnjn.s     ft5, ft2, fs1
                  fdiv.s       fa1, fa2, fs9, rdn
                  fmul.s       ft8, fa3, ft0
                  feq.s        a4, fa3, fs6
                  nop
                  and          s4, s5, a7
                  fmv.w.x      fs7, t1
                  rem          a3, s7, s3
                  div          zero, t2, a4
                  fcvt.w.s     sp, ft6, rtz
                  fcvt.s.w     ft8, sp
                  fmax.s       ft3, ft0, fs6
                  fcvt.s.wu    fs7, a5, rup
                  sll          a4, a1, a0
                  xori         a0, t1, 1667
                  remu         s9, s11, s9
                  auipc        sp, 260585
                  xor          s4, t2, a3
                  mul          s8, t5, sp
                  lui          a0, 360020
                  sub          t0, t5, a2
                  xori         gp, s5, -1477
                  fcvt.s.w     fa2, gp, rne
                  slli         s11, a5, 19
                  fcvt.s.wu    fa2, zero, rmm
                  fsqrt.s      fs3, fs6
                  fmin.s       fa1, ft2, ft6
                  slt          s3, a3, t0
                  slt          t0, t0, zero
                  sltu         zero, a2, a0
                  sltu         s5, t5, tp
                  fsub.s       ft0, fs7, fa1, rmm
                  mulhsu       s0, t1, a3
                  fmv.x.w      s11, ft5
                  sltu         t5, t3, s7
                  fsub.s       ft3, ft1, fs5, rmm
                  fsub.s       fs3, fa3, fs10
                  fsub.s       fa0, ft2, ft3
                  auipc        a6, 107777
                  remu         t1, s2, zero
                  xor          s6, tp, t0
                  fsgnjn.s     fs8, ft9, ft11
                  srai         s4, s9, 22
                  xori         sp, s7, -914
                  fdiv.s       ft4, fa1, fs3, rup
                  srai         ra, a3, 17
                  fclass.s     s8, ft5
                  div          s10, s5, a1
                  ori          a5, s3, -32
                  fle.s        s1, fs4, fs10
                  fcvt.s.w     ft1, s11, rdn
                  xori         t6, a3, 1004
                  or           t0, s0, t6
                  div          t0, s6, a1
                  slli         t4, a4, 29
                  and          a6, t4, s6
                  fcvt.wu.s    s8, ft4, rup
                  div          s10, s3, t3
                  lui          t5, 375323
                  sub          a3, s9, a5
                  slti         a4, a7, -1675
                  rem          t1, s9, s10
                  srl          a5, a7, s1
                  mulhsu       s9, t5, t4
                  fsgnj.s      fs7, ft9, fs0
                  xori         s2, t3, 236
                  fcvt.s.w     fa7, t4, rne
                  xor          t6, a3, s1
                  sra          ra, tp, s3
                  slli         s7, gp, 20
                  feq.s        a3, ft2, fs8
                  srli         t2, s11, 29
                  sub          s8, a7, a1
                  feq.s        a5, fs4, fa3
                  fdiv.s       fs6, fa1, fa3, rdn
                  fcvt.s.wu    fs9, a4
                  fmv.w.x      fa7, t3
                  srl          s4, ra, t4
                  fadd.s       fa0, fs7, fa2
                  and          s1, s3, zero
                  fmv.x.w      s0, fa2
                  fadd.s       ft7, fs1, fs4
                  fadd.s       fs4, fs10, fs10, rtz
                  fmv.w.x      fs4, s3
                  lui          s7, 34006
                  xor          s7, t3, t0
                  fmax.s       fa2, fs5, fa6
                  slti         t6, s11, 670
                  srai         s1, tp, 28
                  fcvt.w.s     t0, fs9
                  fmv.x.w      ra, fs4
                  slt          t4, a0, a0
                  fadd.s       ft8, fa7, fs0, rtz
                  fcvt.s.w     ft2, s7
                  ori          s6, a7, 1456
                  fmin.s       fs8, fa7, fs8
                  fsgnjn.s     fa4, fa6, fs6
                  mul          a6, a3, s11
                  fmin.s       fa7, fa2, ft8
                  auipc        a7, 954928
                  slli         s6, s8, 3
                  andi         s11, a3, 247
                  fmv.w.x      fs10, t2
                  fcvt.w.s     s4, fs2
                  flt.s        s9, fa3, fs10
                  fsqrt.s      fa5, fs7
                  and          t5, t2, sp
                  fle.s        s4, ft5, ft2
                  srl          a1, s1, s7
                  srai         zero, gp, 22
                  srai         t5, a3, 15
                  ori          s6, s2, -627
                  auipc        a0, 180943
                  mul          a1, t1, s2
                  xor          s6, s0, t2
                  mulhsu       ra, zero, s5
                  fdiv.s       fa2, fa4, fs5, rmm
                  andi         t6, gp, 958
                  fsub.s       fa4, fs9, fs10
                  nop
                  mulhsu       a7, s0, a3
                  div          t4, s3, a1
                  fmax.s       fs9, fs10, fa3
                  slt          s2, s8, t5
                  addi         s1, s0, -664
                  slli         t5, s10, 6
                  mulhu        a3, s2, s0
                  add          t1, gp, s5
                  or           a4, t3, a0
                  xori         a6, s11, -1133
                  sll          s10, s10, s10
                  fadd.s       ft11, fs10, ft1, rne
                  sltiu        s4, a3, 209
                  fle.s        t5, fs4, ft10
                  fle.s        a3, ft10, fs6
                  fcvt.wu.s    a1, fs3, rne
                  andi         t2, s10, -1716
                  divu         s0, s0, s9
                  fmin.s       ft1, ft1, fa2
                  and          s2, a6, a5
                  fsqrt.s      fs8, fa4, rup
                  feq.s        a7, ft0, ft5
                  fmax.s       fa0, fa6, ft9
                  mulhsu       t5, a5, ra
                  fmul.s       fs1, ft3, ft8, rne
                  fsgnjn.s     fa4, ft5, fs6
                  fadd.s       ft2, fs5, fa6, rmm
                  fsgnjx.s     fs3, fs4, ft11
                  slti         s2, zero, 1007
                  fsqrt.s      fa5, ft8
                  auipc        zero, 28257
                  mul          s8, s3, t0
                  divu         zero, a5, s4
                  fsgnjx.s     ft6, ft8, fs11
                  sltiu        s4, tp, 1851
                  sltu         s8, s11, t1
                  fmv.x.w      a5, fs0
                  sltu         s8, gp, sp
                  fle.s        a0, fs0, ft0
                  sll          a4, s4, t6
                  fmin.s       ft1, fa6, ft5
                  remu         s11, a7, s4
                  mulhu        t1, s3, tp
                  fcvt.s.w     fs9, a2
                  fmv.x.w      t4, ft11
                  feq.s        s10, fa6, ft3
                  fcvt.w.s     sp, fs10
                  addi         s9, s0, -895
                  nop
                  rem          t1, t6, s8
                  fmin.s       fs3, fa0, fs11
                  addi         a1, s8, -2027
                  ori          t1, s0, -573
                  fmax.s       ft4, fs4, fa5
                  div          a1, ra, s0
                  fsgnj.s      ft11, ft0, fa4
                  sltu         a4, s9, sp
                  auipc        s6, 612697
                  fadd.s       fs0, ft7, ft5, rup
                  srai         s8, t3, 26
                  srli         a1, zero, 31
                  auipc        s7, 621354
                  srl          s0, tp, a7
                  sub          s3, s2, t5
                  andi         t4, t6, 1053
                  srl          a0, s9, t0
                  fmin.s       fs6, ft3, fs9
                  fcvt.w.s     s1, ft8, rdn
                  mulh         s3, t1, t4
                  fsgnjn.s     ft8, fs11, fa0
                  flt.s        t2, fs0, fs10
                  fmin.s       ft10, ft3, ft10
                  div          s0, ra, gp
                  fmax.s       fs7, fs11, fs2
                  fdiv.s       fs1, fa0, ft2, rtz
                  sltu         s0, s1, s7
                  andi         s6, zero, 625
                  mulhu        s6, s0, s1
                  and          a1, a6, a2
                  xori         s9, s5, 2045
                  fle.s        a7, ft7, fs5
                  fle.s        a6, fs2, ft5
                  fmul.s       fa5, fa2, fa7, rup
                  fmin.s       fs5, ft6, fa7
                  ori          s3, s9, -930
                  slt          s11, a4, a1
                  mulhu        a6, t1, t2
                  fsgnj.s      fs0, fa6, ft11
                  fsqrt.s      ft5, fa6, rdn
                  slt          s3, a5, a0
                  fmul.s       ft4, fa6, fa0, rtz
                  xor          s7, s2, a0
                  fmin.s       fs4, ft4, fa7
                  fadd.s       fs10, fs0, fs2, rne
                  fmv.w.x      ft5, s8
                  remu         a0, a2, sp
                  lui          s7, 774184
                  mulhu        sp, a7, s11
                  mulhu        zero, zero, sp
                  auipc        a1, 889317
                  fsgnj.s      fa1, ft3, fs2
                  lui          s0, 147933
                  slt          s6, s8, s6
                  sub          zero, s11, s11
                  or           a0, a5, a5
                  srl          sp, t5, s10
                  fcvt.s.wu    ft2, a6, rmm
                  and          s8, a4, a6
                  fcvt.w.s     s4, fs10, rdn
                  divu         a7, t0, s5
                  slt          t6, a3, t6
                  fmv.x.w      s1, ft7
                  srai         a4, sp, 0
                  sll          s9, t2, a2
                  ori          t2, s9, -1152
                  srli         s1, s2, 21
                  sll          s9, a1, t6
                  fmv.w.x      fa1, a0
                  flt.s        s3, fa0, ft3
                  fclass.s     a3, fa7
                  lui          s10, 12315
                  fsgnjx.s     fs5, ft6, fs8
                  srli         a4, zero, 1
                  slli         t6, s7, 10
                  sltu         t6, t0, t0
                  xori         t5, a2, 488
                  mulh         s7, s8, t5
                  fdiv.s       ft5, fs2, ft5
                  fmv.w.x      ft3, tp
                  srl          a6, s9, t2
                  fsgnjn.s     ft4, ft6, ft10
                  lui          s4, 913186
                  fmax.s       ft8, fs5, fs3
                  srai         s10, a5, 4
                  fmul.s       ft3, fs8, ft2
                  slli         a5, sp, 30
                  remu         s1, s3, tp
                  slti         t1, s1, -501
                  mulh         t1, s4, s9
                  ori          a7, t5, -2044
                  and          a1, a5, t3
                  add          s0, t2, a4
                  fsgnj.s      fa5, fs2, fa7
                  mulhu        s4, t6, s4
                  div          t6, a5, a4
                  sll          s4, zero, s0
                  slti         ra, t6, 1103
                  mulhu        s11, gp, t1
                  slli         a0, t5, 24
                  mulhu        s5, s7, s8
                  fsqrt.s      ft9, fa6
                  fsgnjx.s     fa0, fs2, fs7
                  fsgnj.s      fs4, ft7, ft6
                  fmin.s       ft9, ft2, fs3
                  fdiv.s       ft2, fa1, fs6
                  fcvt.wu.s    t4, ft6
                  srli         t4, gp, 21
                  fsgnj.s      ft2, fs6, fs8
                  srli         s6, zero, 31
                  sra          t0, a3, a0
                  fmul.s       fa2, fa0, fa1, rmm
                  add          s11, s9, s11
                  fcvt.wu.s    a4, ft11
                  fsub.s       fs11, ft1, ft7, rdn
                  fsgnjn.s     fs11, ft7, fs7
                  fmin.s       ft5, fa1, ft4
                  slt          gp, a3, t2
                  fcvt.s.wu    ft11, s10, rdn
                  sltu         s6, t2, s8
                  fmul.s       fs10, fa6, fs7, rne
                  fsgnjx.s     fa7, fs10, fa1
                  fcvt.wu.s    a3, ft3
                  fcvt.wu.s    s9, fs8, rne
                  or           a5, ra, s2
                  fmv.x.w      t1, fa5
                  auipc        t0, 179192
                  srai         zero, zero, 25
                  sra          a4, s7, sp
                  flt.s        a1, ft9, fs10
                  fmv.x.w      s9, fs2
                  xori         t0, s1, 1018
                  srl          t2, s5, t6
                  fclass.s     a5, fa2
                  ori          a0, a1, -996
                  div          s8, a6, a0
                  feq.s        t5, ft5, fa7
                  srl          s1, a0, t0
                  fsqrt.s      fs3, fs4, rdn
                  slli         s11, s1, 21
                  flt.s        t0, fs1, fs6
                  fcvt.w.s     a3, ft0
                  rem          t0, t0, t2
                  fsgnjx.s     ft4, fa6, fs4
                  divu         s2, s7, s9
                  mulhsu       t5, a0, t1
                  or           s11, s3, t0
                  sltu         a4, a7, t6
                  fcvt.w.s     a1, fs6, rtz
                  srl          t2, s10, s8
                  lui          zero, 128874
                  fmv.w.x      ft10, zero
                  auipc        s0, 400399
                  fsgnjx.s     fa5, ft3, ft8
                  mulhu        s5, s1, s5
                  ori          s6, s9, -624
                  sub          s9, zero, s2
                  divu         a5, t4, a0
                  sltu         s7, s4, s10
                  or           a0, s11, zero
                  fdiv.s       ft1, fs3, ft10
                  slti         t2, s4, 1425
                  fadd.s       ft9, ft0, fa0, rdn
                  slli         s10, s10, 11
                  divu         t4, a3, s5
                  feq.s        s5, ft0, fa1
                  fsub.s       fs4, fa6, ft6
                  fsgnj.s      ft4, ft4, fs6
                  fmul.s       fs8, fs3, ft8
                  nop
                  fcvt.s.wu    fs1, a1
                  rem          t1, s4, a2
                  sltu         s3, a3, a4
                  fsgnj.s      fa5, ft3, ft3
                  fmv.w.x      ft1, ra
                  fdiv.s       fa6, fs9, fa5, rmm
                  fsgnjx.s     ft8, ft9, fs3
                  fmax.s       ft11, fs0, fs11
                  sra          s1, s6, s2
                  nop
                  fsgnjx.s     fs7, fs0, ft10
                  slti         t5, s4, 1807
                  mulhu        t6, s0, a2
                  slli         s0, a0, 29
                  sll          a5, t2, s3
                  srli         s2, a2, 8
                  add          s3, sp, s2
                  auipc        s7, 368359
                  add          a5, tp, s2
                  sra          s8, t5, a2
                  mulh         s11, s8, tp
                  srli         sp, t6, 5
                  fmin.s       ft11, fs10, fs7
                  rem          t2, a4, a0
                  auipc        t0, 750918
                  mulh         s11, t4, s4
                  slt          t0, s11, a4
                  sra          gp, ra, t6
                  addi         a3, s2, -1485
                  auipc        gp, 260795
                  sra          s1, a7, a4
                  fsqrt.s      fs11, fs7
                  slt          a0, a6, s7
                  srl          s5, a2, s4
                  ori          s4, s6, 863
                  slti         t2, tp, 1910
                  divu         zero, t5, a7
                  fadd.s       ft6, ft0, ft2, rup
                  fcvt.s.w     fa2, t3, rdn
                  mulhsu       s5, t6, t4
                  div          gp, s10, t2
                  feq.s        s0, fa5, fa0
                  slt          s7, a2, s4
                  mul          s8, a1, s0
                  srl          ra, s1, s6
                  rem          zero, s6, a7
                  sub          a6, a1, ra
                  fmax.s       ft0, fa4, fa6
                  fsqrt.s      fa3, ft4, rtz
                  auipc        s7, 388938
                  sub          s1, tp, a0
                  addi         t4, s7, 171
                  fsub.s       fa6, ft1, fa7
                  fadd.s       fs10, fa3, ft1
                  srli         s6, a7, 16
                  fmax.s       fa5, ft0, ft9
                  mulh         s5, s2, a7
                  srl          a1, t1, t6
                  fclass.s     zero, fa4
                  ori          s11, t3, 1622
                  xor          a7, a1, t5
                  and          t0, ra, s7
                  xor          t4, a2, zero
                  sll          s7, s0, s8
                  mulhu        t6, sp, s8
                  srli         s4, sp, 19
                  rem          s0, t0, ra
                  fmv.w.x      ft2, t4
                  div          a0, s10, a5
                  fcvt.w.s     s5, fa0
                  remu         a1, gp, t5
                  fadd.s       fs9, ft0, ft1, rtz
                  fdiv.s       fs5, fa0, fs4
                  auipc        ra, 511538
                  fsgnj.s      fs9, fs2, fa7
                  fsgnjn.s     ft8, fs7, fa3
                  fmv.w.x      ft10, s7
                  xor          t1, s4, s7
                  fclass.s     s2, fs1
                  fsgnj.s      ft10, fs6, fs10
                  fsgnj.s      ft2, fs6, fs11
                  ori          gp, a4, 451
                  slli         a3, t6, 5
                  flt.s        s3, fs9, ft8
                  fclass.s     t2, ft6
                  fsqrt.s      ft3, ft11
                  fle.s        s5, ft1, fs5
                  fle.s        zero, fs6, fa5
                  sub          s0, s10, t3
                  slti         s2, s3, 293
                  fsub.s       ft1, fa4, fa4, rne
                  fsgnjn.s     ft11, ft9, ft9
                  flt.s        a4, fs9, ft7
                  fcvt.s.wu    ft4, s6, rdn
                  fcvt.wu.s    a3, fs3, rmm
                  slti         t0, s9, -953
                  sltiu        s7, a4, 396
                  srai         s8, a2, 7
                  fcvt.s.w     ft0, s8, rdn
                  add          a1, s2, sp
                  divu         s7, a6, t0
                  add          a6, a3, a2
                  fsub.s       ft6, fa0, fs1, rne
                  ori          t5, a3, -1549
                  addi         s6, t6, -1220
                  srli         a5, t1, 0
                  sub          sp, t2, s7
                  fmin.s       fs0, fs2, fs0
                  fclass.s     a4, fa4
                  rem          t4, t3, a7
                  fsub.s       fs6, ft10, fs3
                  sll          s7, s11, a0
                  ori          s9, t6, 1489
                  srai         s3, s11, 6
                  fclass.s     zero, ft2
                  fsgnjn.s     ft5, fa4, fa7
                  mulh         s7, t4, t0
                  andi         t5, t2, 1468
                  auipc        a1, 183883
                  mulhu        s3, s1, s0
                  addi         s4, s5, -1971
                  fsub.s       ft11, ft1, ft4, rtz
                  fcvt.s.wu    ft1, zero, rmm
                  divu         a0, s0, t5
                  fle.s        gp, fs9, fs0
                  fmin.s       ft7, fs7, fa1
                  fclass.s     a5, ft1
                  fsgnjx.s     fs9, fa2, fs8
                  fadd.s       fa2, ft11, fs2
                  slti         s8, a3, -287
                  fcvt.s.wu    fs7, s10, rup
                  feq.s        t4, fa4, fs7
                  mul          a7, s8, t6
                  fsgnjn.s     fs9, ft10, fs4
                  slti         a6, s2, -1935
                  sltiu        ra, tp, 1699
                  fmin.s       fs5, fs8, fs2
                  sub          s10, s3, a5
                  add          gp, s10, s6
                  lui          s6, 502880
                  lui          t4, 661963
                  fmul.s       ft8, fs9, ft2, rne
                  slti         s0, a5, 152
                  fcvt.s.wu    fa3, t6, rtz
                  fsgnj.s      ft4, fs1, fs11
                  fmin.s       fa7, fa7, ft8
                  auipc        ra, 571930
                  fsgnjx.s     ft11, fs3, fs7
                  sub          s11, ra, s8
                  fsgnj.s      fs1, fs11, fa1
                  mulh         a5, s1, a7
                  mul          sp, ra, tp
                  mul          s7, tp, t3
                  fcvt.s.w     ft11, s2, rtz
                  addi         t4, t5, -2045
                  mulhu        s5, s4, s4
                  srli         s9, ra, 28
                  srl          t1, t2, s9
                  fsgnjx.s     fa0, ft8, ft7
                  add          zero, s1, s2
                  fmin.s       ft9, ft8, fs11
                  slti         t2, a0, 1256
                  srai         s5, t1, 24
                  div          t5, ra, t0
                  sltiu        s7, s1, 52
                  and          t6, s7, t5
                  fcvt.s.w     fs9, s4, rdn
                  fsgnj.s      fs0, fs2, fs11
                  xor          a3, a1, a1
                  or           s8, ra, s8
                  fsub.s       fs3, fs2, fa1, rmm
                  fcvt.s.wu    fa4, s9
                  mulh         s6, t5, a7
                  feq.s        s8, ft4, ft11
                  div          t2, s5, s0
                  nop
                  fsgnjn.s     fs2, fa4, fs0
                  srai         t6, gp, 3
                  remu         s8, t6, t6
                  ori          s10, s0, -1601
                  fcvt.s.w     fs8, s6, rmm
                  flt.s        gp, fa1, fs7
                  sll          s8, s4, t2
                  xori         a0, zero, 550
                  fcvt.s.w     fa3, s11, rmm
                  fmin.s       fa5, ft8, fs6
                  addi         s11, a5, -542
                  addi         sp, a1, 1176
                  div          a7, s1, s4
                  sub          zero, a2, s1
                  fcvt.wu.s    zero, ft7
                  rem          a6, sp, t6
                  lui          s11, 840500
                  xori         sp, t0, -1096
                  srai         t4, gp, 6
                  slt          s2, s7, s9
                  auipc        a7, 116582
                  fcvt.s.w     fa6, t2
                  add          t2, ra, t4
                  addi         t6, a2, -869
                  and          s3, a7, a2
                  feq.s        s0, ft11, fa3
                  fclass.s     s7, fa3
                  mul          t6, tp, a1
                  mulh         s6, s9, a2
                  sltiu        s7, s2, -1403
                  fmax.s       fa4, fa5, fa1
                  sll          s8, s11, zero
                  fsub.s       fa1, ft6, ft6, rup
                  fsqrt.s      ft8, ft0, rtz
                  fle.s        t4, fa7, ft9
                  fmul.s       ft9, ft4, fs3
                  xori         a4, t1, 276
                  fsgnjn.s     ft4, ft6, ft11
                  mulhsu       a7, s2, s11
                  srl          ra, t6, s11
                  sltiu        t0, sp, -1560
                  remu         s0, s10, s0
                  sub          zero, s0, tp
                  mulh         s9, ra, s5
                  add          sp, zero, s9
                  mulhu        t0, s9, a4
                  nop
                  fcvt.wu.s    a7, fs5
                  feq.s        s10, ft4, ft7
                  fmul.s       fs3, fa6, fs11
                  div          a7, a6, s0
                  sra          sp, s1, t1
                  mulh         s6, a0, t1
                  mulh         zero, ra, t2
                  feq.s        sp, fa7, fs8
                  fcvt.s.wu    fs9, zero
                  fcvt.wu.s    t4, ft1, rdn
                  and          t4, sp, s7
                  addi         s1, t6, -1965
                  sub          a6, a7, s9
                  sltu         t1, t0, a6
                  sltiu        t4, t3, 284
                  andi         s7, a2, -2034
                  sltu         s11, ra, s6
                  fsqrt.s      fs3, fs0, rmm
                  slti         t0, t5, -829
                  sltiu        a6, s3, 1193
                  or           zero, s11, a4
                  div          gp, ra, gp
                  sra          t6, a4, s8
                  auipc        t2, 664719
                  remu         t6, t5, zero
                  ori          t1, ra, 265
                  fsub.s       fs6, fa6, fs1
                  fmin.s       fa5, fs6, fa1
                  fsgnjx.s     ft10, fa5, fs9
                  or           a6, a7, a2
                  mulhu        s11, s6, s0
                  srl          a7, t1, a6
                  auipc        a1, 109269
                  fcvt.w.s     a3, ft0
                  fcvt.s.w     fa6, t1, rdn
                  feq.s        t2, fs4, fs4
                  fsub.s       fs1, fs1, fa4
                  fadd.s       ft1, fs11, fs8, rdn
                  addi         s8, s10, 1424
                  ori          a6, s4, 1941
                  xor          s4, a6, s1
                  or           t2, gp, s9
                  xori         t4, tp, 131
                  fmin.s       fs8, ft1, fs3
                  sltiu        t5, a0, 1855
                  sub          t6, a5, t6
                  divu         t6, ra, s8
                  fsqrt.s      fa4, fa7, rdn
                  srai         t4, t1, 26
                  auipc        t2, 819926
                  fmv.w.x      ft9, t0
                  nop
                  srli         s7, s8, 28
                  lui          t6, 863392
                  auipc        gp, 681756
                  xor          s11, gp, s0
                  srli         sp, t3, 16
                  sltiu        s11, t1, 1718
                  fsgnjx.s     ft5, ft11, fs8
                  sltu         a3, s10, a7
                  fmv.w.x      ft4, s3
                  fcvt.wu.s    t1, ft11
                  mulh         t1, sp, zero
                  mulhsu       a6, a7, ra
                  add          s9, a5, t6
                  lui          s7, 343783
                  mul          a4, ra, t3
                  fmin.s       ft6, ft11, ft9
                  divu         s7, s0, a1
                  divu         a6, t1, s1
                  fsub.s       fa1, fs3, fs6
                  mulhu        a1, a4, s7
                  fsgnj.s      ft4, fa1, fa5
                  fclass.s     s7, ft1
                  remu         s1, s1, s10
                  fsgnjx.s     fa4, fs0, ft10
                  remu         sp, t1, s5
                  fcvt.wu.s    a6, ft8
                  fle.s        t0, fs11, ft0
                  sub          s0, t3, s7
                  fcvt.w.s     s11, ft9, rne
                  sltu         gp, s1, t3
                  mul          s3, s4, s9
                  fcvt.w.s     s0, ft11
                  fmv.w.x      ft4, s3
                  sub          t0, s5, s2
                  fle.s        sp, fs11, ft11
                  feq.s        sp, fs10, fa1
                  slli         s9, s6, 25
                  sltiu        t0, t1, -543
                  feq.s        sp, ft2, ft0
                  lui          s1, 776583
                  fmul.s       fs5, fa7, fs3
                  nop
                  fmax.s       fs0, fa7, fs4
                  nop
                  andi         a6, s10, -1686
                  sll          a7, ra, s7
                  fclass.s     s3, fa2
                  andi         gp, sp, 906
                  fmin.s       fs5, fs9, fa0
                  fdiv.s       ft2, fs9, fs7
                  sll          s9, a5, s8
                  mulhu        a0, a1, t5
                  slti         a3, t5, -1213
                  fdiv.s       ft4, fs4, ft3, rne
                  fmax.s       ft10, ft3, ft1
                  sll          gp, a5, t1
                  addi         gp, a7, 1640
                  fdiv.s       fa3, ft9, fa4, rne
                  feq.s        s1, fs7, fa3
                  slli         sp, s11, 24
                  add          gp, a2, t4
                  mul          gp, s4, gp
                  or           a3, s10, s2
                  addi         gp, s0, 27
                  fmin.s       fa4, fs10, fa0
                  srl          t5, zero, t1
                  feq.s        t5, fs10, ft10
                  lui          gp, 1047561
                  fmv.x.w      s11, ft5
                  rem          t2, s4, s2
                  fmul.s       ft9, fs3, fs0
                  fsub.s       ft3, ft3, fs1, rmm
                  fmin.s       ft1, ft0, fs10
                  fadd.s       ft5, ft0, fs1, rup
                  nop
                  fcvt.w.s     s7, ft4, rdn
                  sll          a1, t0, s4
                  fmv.x.w      s11, fs4
                  sltiu        t0, gp, 147
                  srai         a6, t4, 19
                  ori          a1, t3, -1698
                  fadd.s       ft11, ft2, ft1
                  srli         t5, t0, 0
                  mul          zero, t0, tp
                  fcvt.w.s     t5, ft5, rdn
                  fcvt.wu.s    zero, fa7, rtz
                  auipc        a3, 232531
                  mulh         a4, a6, s9
                  add          a0, s7, s6
                  andi         t6, s7, -1603
                  xor          s11, s0, s4
                  add          t6, s11, t1
                  fcvt.w.s     a5, fs2, rmm
                  fsqrt.s      fs7, fs2
                  divu         t6, a3, a1
                  slt          a4, s5, ra
                  sub          s8, s0, s2
                  xor          s5, ra, a1
                  div          a5, s5, s8
                  srli         s4, s8, 5
                  andi         s0, a7, -1264
                  mulhu        t1, a5, s3
                  fclass.s     s4, fs4
                  fsub.s       fa4, fs5, fs2, rtz
                  fmul.s       fa1, fa6, fs1
                  sltiu        a5, t6, -1055
                  fcvt.wu.s    s11, fa5, rmm
                  srl          t2, t3, sp
                  auipc        t1, 243429
                  flt.s        s7, fs5, ft11
                  add          t5, s4, s3
                  lui          s10, 887653
                  fmv.w.x      fa5, a5
                  fsgnjn.s     fa1, ft10, ft5
                  fsgnj.s      fa5, fa1, fs0
                  fmax.s       fs5, fs6, fs11
                  fmv.w.x      fs1, t5
                  ori          s6, a2, 1654
                  fmv.x.w      t1, fa5
                  slti         a4, gp, -931
                  fadd.s       fa4, fa1, ft8, rtz
                  or           a4, s5, s6
                  mulhsu       gp, s5, sp
                  srli         a7, s6, 30
                  sub          ra, s1, a7
                  lui          s1, 228620
                  fsgnjx.s     fs5, fs11, ft7
                  or           a1, zero, s11
                  sra          s6, s4, gp
                  fle.s        s5, fs2, fs2
                  srli         t5, a0, 4
                  fdiv.s       fa1, ft1, fa0, rmm
                  fsub.s       fs10, fa6, ft6
                  sll          sp, s9, t6
                  srai         t5, s11, 4
                  srli         sp, s4, 23
                  fcvt.wu.s    a4, fa2
                  slti         s2, a6, 1841
                  rem          ra, zero, s1
                  fle.s        a5, ft4, ft3
                  slli         s1, t0, 14
                  sub          a6, a7, t5
                  fmv.x.w      t4, ft11
                  sltiu        s8, t1, -1324
                  slli         a1, a5, 24
                  fsgnjx.s     ft6, ft4, ft2
                  fsgnj.s      ft11, fa6, fa3
                  fmv.x.w      t6, fa3
                  mulhsu       s8, a3, a6
                  addi         s1, gp, -1135
                  div          s8, t0, s1
                  fmul.s       fs8, ft1, fs10, rdn
                  feq.s        s6, fs7, fs5
                  slt          s0, t4, s9
                  sub          a1, a0, s6
                  divu         a4, a2, a5
                  fadd.s       fs11, fs10, ft5
                  fle.s        t2, fa4, fs2
                  addi         s0, t2, -1247
                  sltu         s8, a7, s0
                  fadd.s       ft8, ft10, fa3
                  fdiv.s       fa6, ft3, fs5, rtz
                  or           gp, a6, a3
                  fdiv.s       ft2, fa3, ft6, rne
                  sltu         t6, gp, s5
                  div          a1, s9, tp
                  mulh         s10, s8, a3
                  srl          s3, sp, t6
                  srai         a0, a5, 9
                  srli         s8, sp, 4
                  sltiu        t0, t0, 1160
                  div          s11, s6, s11
                  slt          s2, a4, ra
                  fsgnjx.s     fs10, fs10, ft10
                  sra          t0, t3, t4
                  mulhu        t4, s4, sp
                  slti         s4, zero, 995
                  sll          a6, s0, t2
                  feq.s        s6, fa2, ft7
                  fmv.x.w      s0, fs11
                  fle.s        a0, ft11, ft5
                  addi         s9, t2, 731
                  fmax.s       fs4, ft7, ft11
                  ori          a0, a2, -152
                  fadd.s       fa6, fa0, ft1
                  add          t4, s4, ra
                  feq.s        s6, ft8, fs3
                  mulh         s3, s7, s11
                  fsgnjn.s     fs0, fa1, ft3
                  mulhsu       s2, gp, s11
                  srli         s9, s5, 26
                  mulhu        s4, t6, s1
                  fcvt.s.w     fs11, zero
                  flt.s        gp, ft6, ft5
                  fclass.s     t6, fs10
                  fmax.s       fa7, ft1, ft9
                  xori         t1, zero, 1385
                  auipc        t2, 665257
                  feq.s        t0, ft0, fs9
                  andi         t4, s9, 1779
                  mulhu        s4, s1, s11
                  srai         s9, a5, 2
                  fmv.x.w      s0, ft6
                  srli         a7, a1, 19
                  and          a3, a2, t6
                  sub          s4, s10, t3
                  remu         gp, tp, a6
                  xor          zero, s1, t0
                  ori          s10, s1, -70
                  addi         t4, s4, -1653
                  slt          t2, s10, t5
                  fsgnjx.s     ft11, ft1, fa7
                  div          t4, s11, tp
                  rem          a7, s7, s5
                  fcvt.w.s     s9, fs1, rne
                  sltiu        gp, gp, -430
                  fsub.s       ft2, ft11, fa1
                  slt          s2, t0, sp
                  mulhsu       s3, t6, a7
                  fsub.s       fs11, fs3, fs10, rne
                  srli         s6, tp, 19
                  lui          s3, 1002652
                  srl          zero, a1, t3
                  remu         a6, a3, a3
                  fsqrt.s      fs10, ft2
                  mul          s0, t5, gp
                  xor          ra, zero, s6
                  rem          s7, zero, a1
                  rem          s10, a1, s9
                  xor          a0, t2, a7
                  fmin.s       ft0, fs11, fs3
                  fmax.s       fs5, ft10, fs0
                  andi         gp, s0, -672
                  add          zero, a1, a3
                  fle.s        t2, ft2, fs8
                  flt.s        s11, ft10, ft2
                  nop
                  add          s0, s7, s1
                  fsgnjn.s     fs7, ft11, fs6
                  fmv.x.w      s5, ft6
                  or           a5, s0, s1
                  ori          s5, t1, -703
                  srl          a5, gp, t2
                  fmin.s       ft0, fs3, ft6
                  fsgnjx.s     fa7, fa5, fs8
                  rem          t6, zero, s1
                  mul          gp, s7, ra
                  fdiv.s       fs2, fa0, ft8, rdn
                  add          a5, t0, s9
                  fadd.s       fa7, fs1, fs11
                  sltiu        s10, a4, 1598
                  and          s6, s6, s2
                  fadd.s       ft11, ft11, fs8, rtz
                  addi         s1, s7, 1375
                  div          t4, s5, s7
                  sll          zero, s10, t1
                  fdiv.s       fs6, ft4, fs2
                  sltiu        s11, s6, -105
                  slti         s1, zero, 256
                  addi         s10, sp, -1593
                  divu         gp, a0, tp
                  rem          sp, a7, t6
                  divu         s5, a3, a5
                  auipc        t0, 99628
                  sltiu        s8, s0, 203
                  srl          s10, a6, s3
                  fcvt.s.w     fs1, a1, rtz
                  fmul.s       ft10, fs9, fa3
                  ori          s2, sp, 1665
                  mul          t4, s1, a7
                  fsgnjn.s     ft3, fs11, fs2
                  slt          s5, tp, zero
                  sll          a1, zero, a3
                  add          s9, s5, sp
                  fmax.s       ft9, fa4, ft7
                  fdiv.s       fa5, fs1, ft7, rdn
                  fsgnjx.s     fa2, fs9, fs5
                  fmul.s       ft2, fs1, ft7, rtz
                  xori         s7, s0, 547
                  fdiv.s       fa4, ft3, ft7, rtz
                  xor          a5, s3, t4
                  fle.s        s0, ft9, ft8
                  slli         t1, t1, 14
                  mulh         s5, a3, s11
                  ori          s0, s4, -23
                  fdiv.s       ft3, ft0, fs5, rne
                  auipc        s4, 742320
                  fmv.w.x      fs1, s4
                  mulh         sp, sp, a0
                  fmul.s       ft0, fa5, fa0
                  feq.s        a6, fa3, fs7
                  srl          t1, t0, a7
                  sra          s11, t5, a2
                  fsub.s       ft9, fa4, ft0
                  sltiu        t0, a2, -1637
                  slti         ra, zero, 806
                  mulh         ra, s3, s11
                  fsgnjn.s     fa0, fa0, fa4
                  or           a1, ra, t0
                  fsqrt.s      fa2, fa6
                  srl          a7, t1, t1
                  fcvt.wu.s    s11, ft1, rdn
                  add          zero, s2, t2
                  sra          zero, s2, s7
                  fsub.s       fa0, fa4, fs2
                  addi         a5, t1, 132
                  srai         t2, a3, 4
                  sub          s10, s11, gp
                  sra          s4, s11, t5
                  flt.s        gp, fs8, fs10
                  div          s2, s6, s6
                  fsgnjx.s     fa6, ft5, fs8
                  andi         t6, t1, -1624
                  fclass.s     gp, fs8
                  sub          s5, s1, tp
                  fsqrt.s      ft8, ft1, rup
                  mulhu        a4, t0, a5
                  sltiu        a5, s4, -1259
                  fmin.s       ft2, fa2, fs0
                  nop
                  fdiv.s       fs2, fs4, ft5
                  fmv.x.w      t5, fs11
                  feq.s        s6, ft7, fs0
                  fsub.s       fs9, fa3, fs6
                  sra          t2, t6, s3
                  rem          zero, t6, zero
                  sltiu        t5, gp, -1354
                  sltu         a0, s10, s0
                  fsgnj.s      ft7, ft1, fs0
                  lui          s9, 632996
                  fsgnjn.s     fa7, ft3, ft5
                  fadd.s       ft3, ft4, fs5, rtz
                  fcvt.wu.s    ra, ft3, rtz
                  auipc        t2, 359235
                  fmv.w.x      fs0, a0
                  mulhu        s3, a2, s4
                  fcvt.w.s     s5, ft11, rmm
                  slli         s4, a3, 30
                  fmul.s       ft0, ft3, fs1
                  sra          a7, tp, s1
                  fsgnj.s      fs7, ft3, ft2
                  auipc        s5, 593988
                  mulhu        t1, t2, t2
                  fdiv.s       fa4, ft6, fs11, rup
                  fmv.x.w      s1, fa5
                  flt.s        t5, fs2, ft8
                  or           s7, t6, s3
                  mulhu        s3, ra, s8
                  srl          t1, t3, a3
                  fsgnj.s      fs1, fs1, fs8
                  flt.s        t0, ft3, fs2
                  divu         a3, s4, sp
                  fdiv.s       fa6, ft0, fa1, rne
                  fclass.s     s3, fs1
                  sltiu        a4, a0, -1210
                  fsgnjx.s     ft4, fs3, ft2
                  auipc        s5, 631298
                  srli         a6, a6, 7
                  lui          t0, 1039131
                  divu         s5, s10, t2
                  fsqrt.s      ft3, fa5, rup
                  slt          t1, s7, t3
                  div          gp, s11, t6
                  fadd.s       fs5, ft0, fa5
                  fcvt.s.wu    ft7, zero, rmm
                  xor          s11, s10, t5
                  fle.s        sp, ft1, fs4
                  srai         s2, a6, 7
                  fmin.s       ft11, fs6, ft4
                  flt.s        a6, fs2, fs6
                  feq.s        s3, fs4, ft6
                  flt.s        s2, fs1, ft0
                  mulh         a5, a0, sp
                  fdiv.s       fa1, fa7, fa4, rup
                  fmv.w.x      fs10, s5
                  fcvt.wu.s    s8, fs1, rtz
                  fsub.s       fs5, fa1, fs10
                  srai         s10, s3, 30
                  fsub.s       fa6, ft7, fs11, rup
                  srai         s5, sp, 10
                  remu         s11, t0, s0
                  fclass.s     zero, fa3
                  fcvt.wu.s    zero, fs4, rdn
                  slti         t1, s7, -149
                  nop
                  sltu         a5, t6, a5
                  feq.s        a1, ft9, fa7
                  fclass.s     s2, ft8
                  auipc        a3, 561311
                  fmul.s       fs10, ft6, fs10, rmm
                  rem          s6, t5, t5
                  mulhsu       a3, a4, a6
                  slt          a5, t5, sp
                  fcvt.s.wu    ft6, a0
                  divu         t2, s7, t3
                  fsub.s       fs9, fs10, ft7, rdn
                  fmax.s       ft11, ft3, fs4
                  feq.s        s9, ft10, ft4
                  sra          s1, s11, t1
                  fsgnjx.s     fs5, fa3, fs1
                  fcvt.s.w     ft8, s8
                  sll          t4, a6, zero
                  mul          s3, s8, s0
                  fsub.s       fs7, fa3, fs4
                  fclass.s     t1, fa1
                  mul          ra, zero, s7
                  fsgnjn.s     fa4, fs7, fa7
                  lui          a7, 976014
                  fsgnj.s      ft7, fs10, fs8
                  xori         s6, s5, 1919
                  fcvt.wu.s    t0, fs8
                  srai         t2, s10, 20
                  add          s2, a0, t2
                  xori         t6, s10, 1488
                  nop
                  fsgnjx.s     ft2, ft11, fa3
                  auipc        s7, 808840
                  mulhu        a1, t3, a3
                  add          a0, a3, s3
                  div          s5, a1, a1
                  fcvt.wu.s    t0, fa3, rne
                  srl          s11, s5, t6
                  div          s10, gp, a4
                  fcvt.wu.s    s6, ft3, rup
                  sra          t0, s7, s1
                  lui          a7, 395770
                  slli         s1, tp, 29
                  div          a0, tp, a2
                  sltu         s2, sp, t5
                  fmv.w.x      fs5, a4
                  sltiu        s6, a6, -498
                  fcvt.s.wu    fs2, s8, rne
                  andi         s11, a6, 1172
                  srli         t2, s8, 23
                  fdiv.s       ft4, ft7, fs5, rdn
                  sra          s6, s8, s3
                  slt          s7, s6, s0
                  feq.s        t6, fs8, fa4
                  fdiv.s       ft0, fs11, fa4
                  fmv.x.w      s6, fs11
                  feq.s        t5, ft5, fs1
                  divu         a6, t0, t6
                  slt          s7, t3, s2
                  sll          a4, zero, s11
                  ori          a5, s0, -1274
                  fsgnjx.s     fa1, fs3, fa6
                  xor          t4, a7, s6
                  sll          s8, t5, a5
                  and          a1, s11, zero
                  fclass.s     s4, fa6
                  fclass.s     s11, ft0
                  add          s10, t3, s6
                  fcvt.w.s     s2, fa4
                  sltiu        s0, t6, 1106
                  fcvt.s.w     fa1, sp
                  xor          s5, s9, s3
                  fsqrt.s      fs2, fa0, rup
                  slt          a3, a2, s0
                  lui          t0, 425031
                  fmv.x.w      a3, fa7
                  srli         a3, t4, 29
                  fmul.s       ft8, ft11, ft8, rne
                  fdiv.s       ft11, ft10, ft9
                  mul          t0, t2, a2
                  and          s10, a6, a1
                  fmul.s       fs8, fa2, fs8, rup
                  fcvt.s.wu    fs3, a2
                  sll          a7, t4, t3
                  fsgnjn.s     fa3, fs0, fs9
                  sltiu        s0, s5, -757
                  fsqrt.s      fs11, fa7, rtz
                  add          ra, s6, t6
                  flt.s        a4, fa4, fa7
                  mulhu        s10, s1, s4
                  xor          a3, t4, s6
                  fcvt.s.wu    fa3, t3
                  xor          s1, s1, a0
                  lui          s10, 1013160
                  srli         s9, t0, 27
                  sltu         s4, s6, tp
                  and          a5, s7, s1
                  xor          zero, a6, s7
                  srli         t5, t5, 5
                  or           a3, s1, a1
                  fmin.s       ft11, fs7, fa4
                  or           s9, s3, sp
                  fsgnjn.s     fs6, ft6, ft3
                  fdiv.s       fa3, ft0, ft0, rup
                  rem          s6, s10, s9
                  ori          s10, s3, 1563
                  auipc        t1, 333760
                  nop
                  fcvt.s.wu    fa2, zero, rdn
                  sltu         gp, ra, a0
                  mulhu        a4, t1, s11
                  mul          zero, zero, s11
                  fcvt.wu.s    a6, ft9
                  fmul.s       ft7, fs2, fs8
                  fle.s        s6, ft6, ft4
                  add          ra, sp, a5
                  addi         a7, s4, 2014
                  fsgnjn.s     fs3, fa2, fa5
                  fcvt.s.w     fa6, s2, rne
                  lui          a0, 770817
                  lui          s8, 627905
                  fsub.s       fs2, fs0, fa4
                  slti         zero, s5, -390
                  div          t2, a4, s1
                  flt.s        t2, ft2, fs7
                  slli         a6, a1, 7
                  sltiu        zero, a5, 887
                  fsgnj.s      ft1, fs8, fa4
                  nop
                  lui          s4, 751023
                  sltiu        s1, s8, 680
                  fdiv.s       fs9, ft2, ft2, rdn
                  and          t5, ra, a7
                  nop
                  feq.s        t5, fa2, ft11
                  fle.s        s6, ft8, fs5
                  remu         sp, s9, s2
                  xor          t4, t5, t6
                  fsgnjn.s     ft10, fa2, fs1
                  fcvt.wu.s    a3, fs7
                  fmul.s       fs3, ft10, fs0
                  sltu         s0, a0, ra
                  sll          t6, t1, t5
                  fmax.s       fs8, fa3, ft3
                  lui          t5, 568326
                  remu         a4, a6, s2
                  mulhu        sp, a5, a4
                  srai         s11, s7, 0
                  slt          s10, t6, a3
                  sub          t5, gp, s7
                  fsqrt.s      ft6, ft4, rtz
                  ori          t4, a2, -1519
                  divu         a5, t3, a3
                  fsgnjx.s     ft10, fa6, ft11
                  fcvt.s.wu    ft0, sp
                  feq.s        ra, ft4, fa1
                  lui          a4, 675254
                  fcvt.s.wu    fa6, s9, rtz
                  slli         s8, zero, 11
                  fmv.x.w      s3, fs6
                  remu         a3, s4, a7
                  fcvt.wu.s    s3, ft3
                  flt.s        zero, ft2, ft11
                  fcvt.s.wu    fa5, gp
                  fcvt.wu.s    t6, fs0
                  div          t0, s1, a2
                  srl          s6, a5, a3
                  lui          t0, 228147
                  flt.s        a4, fa2, fs6
                  sll          s7, s6, a4
                  fsgnj.s      fs7, fs11, fs4
                  remu         s6, s10, t6
                  rem          t6, gp, s3
                  fclass.s     s7, ft1
                  slt          s3, s3, tp
                  divu         s9, s1, s10
                  fcvt.w.s     s11, fa1
                  fclass.s     t4, ft9
                  fcvt.w.s     sp, fs9
                  auipc        sp, 75981
                  fclass.s     sp, fs4
                  mulh         t1, t5, a0
                  rem          s9, s3, s11
                  andi         t2, sp, -424
                  andi         a7, s4, 222
                  ori          a1, gp, 847
                  sltiu        a7, a5, -681
                  nop
                  remu         zero, t2, s0
                  sll          t6, zero, a6
                  divu         s11, s3, s9
                  srl          s2, a5, s0
                  lui          s9, 642696
                  fsqrt.s      ft5, fa5
                  mulh         a0, s4, a1
                  flt.s        t5, fs6, fs9
                  add          t4, s0, s4
                  fsub.s       fa7, fs1, ft7
                  mulh         a5, ra, s9
                  fsgnjn.s     ft4, fs1, fs6
                  slt          t4, s5, sp
                  rem          t2, a3, tp
                  fcvt.wu.s    a7, fa2, rdn
                  mulh         s2, t4, a4
                  andi         s0, sp, 1236
                  fmv.w.x      fs3, sp
                  fle.s        gp, fa5, fa3
                  flt.s        s3, fs9, fs0
                  fcvt.wu.s    sp, fs2, rtz
                  srai         a1, s9, 0
                  fmv.w.x      fs2, a0
                  fsgnj.s      ft10, fs0, fs5
                  or           a0, a5, gp
                  nop
                  slti         t1, s9, -1673
                  feq.s        sp, fs4, fs3
                  lui          ra, 764199
                  lui          s7, 751585
                  feq.s        a3, ft7, fs6
                  divu         t4, a2, s2
                  fmul.s       fs10, ft2, fa0, rtz
                  sub          s10, a4, s9
                  nop
                  and          s1, a5, a6
                  srl          s9, s11, a6
                  sra          t6, t6, s4
                  slt          a4, t4, s2
                  rem          a0, a4, a0
                  slli         s2, a0, 15
                  or           sp, a4, s4
                  fsgnjn.s     fs10, ft0, fs5
                  mul          s7, gp, t5
                  slt          s5, s1, a6
                  fsub.s       ft10, fs1, ft1
                  fdiv.s       ft3, ft11, fs10, rdn
                  xor          s6, s0, s6
                  rem          a6, a7, zero
                  fmv.w.x      fs11, s4
                  rem          s0, t4, t0
                  mul          s5, s1, s3
                  fadd.s       fa4, ft9, fa5
                  fsub.s       ft0, fs5, fs7
                  and          s1, s8, ra
                  sll          s5, s7, s7
                  fdiv.s       ft1, ft4, ft3
                  slti         s1, tp, -628
                  sra          s11, a0, a6
                  fcvt.s.w     ft8, tp, rdn
                  fdiv.s       ft10, ft2, fs4, rne
                  srl          s11, s4, s4
                  fsgnj.s      ft7, fa5, fa0
                  flt.s        sp, ft10, ft5
                  flt.s        sp, fs5, fs6
                  fcvt.s.w     ft10, t2
                  mul          t2, s8, s3
                  add          a0, s4, a3
                  auipc        t4, 1041584
                  srai         a1, t2, 3
                  fdiv.s       ft4, fs10, ft2, rmm
                  fmin.s       fs10, fs5, ft0
                  srl          s1, zero, t6
                  fsgnjx.s     fs9, fa4, fs5
                  xor          t1, a6, a1
                  fsub.s       fs2, ft0, fs1, rtz
                  mulhu        t6, s6, a4
                  fadd.s       fs7, fa0, ft9
                  sltu         gp, s0, zero
                  andi         a4, s2, -936
                  slti         s11, gp, -786
                  flt.s        s5, ft8, fs11
                  divu         s2, sp, t0
                  ori          ra, t4, 771
                  srli         a0, s4, 2
                  ori          t6, ra, 1582
                  xor          sp, a0, tp
                  slli         t2, a0, 26
                  sltu         a5, a1, t3
                  auipc        ra, 322181
                  sll          s2, t4, s10
                  fcvt.s.wu    ft0, t1, rne
                  fcvt.wu.s    s11, fs11
                  fsub.s       fs4, fa4, fs3, rup
                  fsgnjx.s     fa6, fa1, ft2
                  fsub.s       fa5, ft5, fs4
                  auipc        s1, 677846
                  nop
                  fadd.s       fs11, fs9, fs7
                  divu         a6, sp, s9
                  slti         zero, s8, -897
                  xori         a3, s4, -47
                  xor          t2, s6, s1
                  auipc        s9, 819067
                  sra          s3, s9, t0
                  sub          t5, s3, s5
                  div          a7, s2, s8
                  addi         s1, s3, 1977
                  fsgnjx.s     ft0, fs6, ft7
                  srai         s2, t0, 31
                  fsgnjx.s     fs2, fa0, fs5
                  mul          zero, t1, sp
                  slli         t2, s10, 26
                  srl          gp, s7, sp
                  sra          s10, t2, t3
                  add          sp, a5, t1
                  sltu         s0, gp, s7
                  or           t0, a5, a2
                  fsgnj.s      fs1, ft5, ft5
                  mulh         t0, a6, s7
                  slli         ra, a7, 22
                  fmul.s       fs9, fa7, ft5, rup
                  mul          gp, gp, s7
                  mulhsu       s8, s6, s8
                  fsgnjn.s     fs9, fs6, fs6
                  sub          gp, t0, s10
                  fmv.x.w      s8, fs2
                  slti         zero, s10, -728
                  fmv.w.x      fs4, s10
                  nop
                  lui          s11, 617383
                  srli         ra, a5, 23
                  and          s7, t1, s7
                  lui          s3, 879331
                  fsub.s       fa0, ft9, fa0
                  or           a7, ra, t6
                  xori         s2, s4, 532
                  slt          t0, sp, zero
                  remu         s1, ra, s6
                  remu         gp, s2, t0
                  fcvt.s.wu    fa3, ra
                  ori          a1, ra, -323
                  fmin.s       fs5, fa3, fa0
                  fmv.w.x      fa2, a7
                  fcvt.wu.s    ra, fa3
                  fmv.x.w      s10, ft8
                  fdiv.s       fa6, fs6, fs8
                  nop
                  fmul.s       fa4, ft4, fs3, rmm
                  rem          s1, a0, tp
                  fsqrt.s      fs11, ft3, rup
                  fadd.s       ft2, fa6, fa4
                  fcvt.s.wu    fs5, a3, rup
                  ori          a6, a6, -1248
                  addi         s10, a1, -1191
                  and          s6, s4, s11
                  auipc        s10, 573225
                  fsgnjx.s     ft11, fs9, fa7
                  fcvt.w.s     s1, fa3, rtz
                  mulhu        s10, s4, a4
                  mulh         a5, s6, t6
                  fadd.s       ft10, fa5, fs5, rne
                  fadd.s       fs9, fs0, ft6, rne
                  srli         gp, t3, 18
                  fsgnjx.s     fs1, ft3, fs0
                  mul          s1, a4, s6
                  or           t2, a7, s2
                  fadd.s       fs3, ft11, fs4
                  mulhu        ra, sp, t2
                  auipc        s5, 252209
                  srl          t0, s6, t6
                  fmul.s       ft2, ft8, ft1
                  fclass.s     s11, fs6
                  sltiu        s6, a7, -1261
                  addi         s3, a1, 308
                  slli         s2, s6, 28
                  fsub.s       fs2, ft6, ft6, rup
                  fsgnjn.s     fs0, ft5, fs10
                  feq.s        t2, fs0, ft7
                  fsgnjn.s     fs7, ft1, ft2
                  xor          a7, a4, s6
                  divu         a7, s1, a7
                  fcvt.s.w     ft6, ra, rmm
                  ori          t1, a1, 1510
                  rem          a0, s10, gp
                  slli         s6, s10, 9
                  srli         s3, s5, 1
                  sltu         a5, gp, t6
                  fle.s        s4, fs11, fa7
                  fsgnjx.s     fs0, fs10, ft11
                  nop
                  fclass.s     s10, fs4
                  fcvt.wu.s    t6, ft6
                  sltu         a1, a5, t0
                  xor          a4, a7, t4
                  nop
                  srli         zero, t4, 21
                  srl          gp, t6, sp
                  ori          ra, a4, 1350
                  remu         sp, t4, a1
                  nop
                  remu         t1, tp, tp
                  rem          a4, a6, t1
                  xori         s2, ra, 1699
                  remu         ra, a2, s10
                  fsgnjn.s     fa6, fs7, ft5
                  slli         s6, s7, 7
                  xor          s0, ra, s5
                  fsgnjx.s     ft1, fs5, fa6
                  fle.s        s3, ft7, fs7
                  slt          s3, t6, t4
                  rem          t4, s5, a6
                  fsgnjx.s     fa3, fa5, fs6
                  feq.s        t6, ft3, ft4
                  srai         a0, tp, 22
                  mul          zero, ra, t3
                  srli         t5, s5, 5
                  andi         a7, a2, -1708
                  fle.s        a1, fs3, fa0
                  sub          t5, t1, ra
                  slt          s11, s0, sp
                  divu         zero, s11, a7
                  lui          t1, 719539
                  fsgnjx.s     ft3, fs11, fa4
                  slti         t0, s9, -2018
                  fcvt.s.wu    fs5, t6, rne
                  fsub.s       fa7, ft5, fa3
                  rem          a5, sp, s7
                  fmax.s       ft1, fs5, ft7
                  fcvt.s.w     fs4, t6, rmm
                  fmax.s       fa6, ft9, ft8
                  fsgnjn.s     ft1, fa0, fa3
                  fsgnjx.s     ft6, fa7, ft7
                  sll          t5, s10, t1
                  andi         s0, s11, -1051
                  andi         t4, zero, -435
                  fsgnjx.s     fa1, fs3, ft8
                  srai         s11, a5, 15
                  fcvt.w.s     t6, ft5
                  sltu         ra, t6, s8
                  lui          s10, 614116
                  fcvt.w.s     t2, fa5, rmm
                  fcvt.w.s     t5, ft5
                  fadd.s       fs10, fa1, fs5
                  fcvt.wu.s    gp, fs3
                  ori          s7, s2, -188
                  or           a7, gp, ra
                  sra          s1, s7, a7
                  xor          a3, s7, s8
                  sll          a7, zero, tp
                  or           s9, a0, ra
                  remu         ra, t0, tp
                  mulh         s0, t5, t0
                  sltiu        s7, s10, -1735
                  addi         s8, a4, 1553
                  srli         a5, a7, 30
                  div          t1, t0, ra
                  slt          s4, a2, s5
                  fmax.s       fa0, fs7, ft1
                  xori         s1, a6, -2024
                  sra          ra, s11, t4
                  fmul.s       ft8, ft3, fa5, rup
                  srai         s6, a7, 14
                  fmin.s       fs9, fs3, fa2
                  fcvt.w.s     s2, ft10
                  sll          s4, t1, a5
                  fcvt.w.s     s4, fs3
                  fsgnjx.s     ft0, fs4, fa7
                  nop
                  fdiv.s       ft6, fa3, fs2
                  fmv.w.x      ft5, a4
                  fcvt.w.s     s0, fs6
                  fmul.s       ft1, ft2, fs6, rup
                  rem          a1, t2, t2
                  fsub.s       fs4, fs6, fa2
                  fadd.s       ft8, fs4, fs5
                  sll          zero, s8, a0
                  fcvt.w.s     s6, fa0
                  divu         a7, a3, a0
                  remu         zero, t0, s3
                  srl          s9, a5, s11
                  remu         s0, a3, a6
                  auipc        a7, 966070
                  andi         t6, t0, 1341
                  fsqrt.s      ft8, fa7
                  andi         ra, t3, -1484
                  fmv.w.x      fa5, a7
                  fmv.w.x      fs8, s10
                  rem          s2, a7, a5
                  srai         t1, s5, 26
                  mulh         a1, a2, sp
                  srli         t4, s10, 11
                  fmv.w.x      fs11, t5
                  mulhu        t4, s2, s2
                  fadd.s       ft3, ft3, fs11, rne
                  slt          sp, s11, s1
                  nop
                  fsqrt.s      fa1, ft7, rup
                  fcvt.wu.s    s2, ft9
                  divu         s11, s1, a7
                  fmin.s       ft4, fa6, ft3
                  mulhu        zero, s6, a4
                  fdiv.s       ft3, ft10, ft0
                  fdiv.s       fs6, fa3, fs1
                  rem          t6, t4, s8
                  fsgnjx.s     ft7, ft9, ft0
                  feq.s        s2, fs2, ft1
                  fcvt.wu.s    s4, ft6
                  rem          s6, s10, a1
                  mulh         a5, t2, t6
                  slti         t2, a0, -468
                  nop
                  remu         t0, s8, a4
                  auipc        s8, 963166
                  fmv.x.w      a4, fa1
                  sltu         t4, a0, a1
                  slli         t4, s7, 22
                  srl          s1, s6, t6
                  fsgnj.s      ft0, fa5, fa0
                  sll          a0, s5, gp
                  sltiu        t4, t3, -846
                  slt          a0, t5, t2
                  sltiu        t1, t1, -1871
                  sra          s1, t4, s8
                  fsgnjx.s     ft6, fa2, fa0
                  sltiu        ra, s8, 370
                  fsqrt.s      fa2, fa7, rtz
                  fle.s        ra, fs0, fs1
                  fdiv.s       fa3, ft3, ft0, rup
                  fsub.s       fs0, fa2, ft6, rup
                  sra          a7, a3, s9
                  sra          ra, s4, t0
                  fsgnjn.s     fs0, fa1, fs3
                  auipc        s11, 962818
                  remu         s2, ra, tp
                  slt          s3, s7, a2
                  sltu         ra, t3, sp
                  fsgnjx.s     fa7, fs11, fs7
                  fmv.x.w      a6, fa1
                  sltu         t1, s2, t0
                  fmv.x.w      t0, fs9
                  mulh         s10, s4, a5
                  sll          a7, s3, zero
                  divu         a6, s4, t3
                  fmin.s       ft0, fa1, fs3
                  sltu         s2, a3, s9
                  srl          s0, a4, s10
                  div          t4, s1, t6
                  nop
                  remu         s9, s1, s2
                  xor          t4, t1, zero
                  fsub.s       ft7, ft5, ft2, rtz
                  fcvt.w.s     s4, fs6, rdn
                  or           t2, s7, a7
                  xori         s9, t3, -1280
                  fcvt.s.wu    ft2, s1, rtz
                  mulhsu       a5, s7, a1
                  flt.s        a6, fa3, fa6
                  srai         s6, s3, 28
                  fmul.s       ft7, fa5, ft9
                  fsub.s       fa1, ft10, ft10, rup
                  fle.s        a1, ft1, ft8
                  fle.s        sp, fa2, ft0
                  sltiu        s2, t6, -1037
                  fsqrt.s      fa6, fa6
                  fcvt.w.s     a0, fs9, rne
                  slti         a3, a4, -392
                  xori         a7, gp, 717
                  xori         a6, a1, -483
                  slti         s3, s3, 2018
                  or           s11, s4, a1
                  sll          t6, gp, a7
                  add          a5, s0, t4
                  andi         s4, s11, -1663
                  fmv.w.x      ft3, s10
                  srli         a7, a1, 6
                  feq.s        s0, fs1, fs9
                  flt.s        s10, fs0, ft5
                  sll          sp, s10, s10
                  fmv.x.w      a4, fs0
                  fmul.s       fa3, fa7, ft1, rne
                  addi         zero, tp, 1922
                  sltu         s8, s4, gp
                  srl          s1, a0, s7
                  mulhsu       s1, s11, s0
                  rem          s3, s8, s5
                  fsgnjn.s     fs10, ft11, fa5
                  fadd.s       ft3, fa4, fs11, rdn
                  srl          sp, s6, s5
                  mulhu        a7, s10, s4
                  fcvt.s.w     fs5, tp, rup
                  xori         s8, a5, -164
                  div          gp, a7, s9
                  fclass.s     gp, ft10
                  fclass.s     zero, fa2
                  lui          s6, 530713
                  andi         t6, a1, 1135
                  remu         a1, s1, a2
                  fcvt.wu.s    a1, fa7
                  slli         t6, t3, 8
                  fcvt.s.w     ft11, t2, rtz
                  slt          s6, s1, a1
                  fsgnjn.s     fs7, fa0, fa7
                  remu         s9, s3, s9
                  slli         t1, a6, 11
                  fsgnjn.s     fa3, fs9, ft7
                  xori         a5, t6, -1794
                  fle.s        t5, ft11, fs7
                  fcvt.s.wu    ft1, s1
                  fmv.w.x      fs6, s2
                  fcvt.wu.s    s4, fs11
                  andi         s9, t3, 1934
                  div          s4, a0, s11
                  mul          s1, sp, t4
                  feq.s        s1, fs1, fs0
                  fsub.s       fa4, fa7, ft2
                  slt          a1, a3, s3
                  fsqrt.s      ft4, fa0
                  fmv.x.w      a0, fs2
                  nop
                  add          s10, t2, s3
                  remu         s9, a0, s10
                  andi         a1, tp, -504
                  xor          s4, s8, t3
                  xori         t5, t1, -789
                  mulhsu       sp, s8, t4
                  add          a6, a7, a4
                  sll          sp, t3, a0
                  fsgnjx.s     fs10, fs7, fs7
                  sub          a6, a6, t5
                  flt.s        t4, ft0, fs4
                  sra          a0, t4, s11
                  divu         s7, s3, t6
                  fsgnj.s      fs3, fs11, fs1
                  sltiu        s8, s9, -1939
                  srl          a0, a2, s11
                  fdiv.s       fs10, ft7, fs4, rtz
                  fle.s        t5, fs3, ft2
                  auipc        zero, 1046294
                  sll          s8, t6, s11
                  sll          t6, sp, s7
                  fclass.s     a0, fa0
                  fcvt.w.s     t5, fa3, rup
                  slli         s1, a7, 19
                  fsgnj.s      fs0, ft3, ft7
                  andi         t2, s6, -1062
                  rem          s1, t5, s7
                  fmin.s       fs4, fs1, fs9
                  fclass.s     a6, fs10
                  fcvt.s.w     ft5, s11
                  slli         s9, s11, 3
                  fsub.s       ft9, fa7, fs11
                  fsgnj.s      fs6, fa7, fs2
                  sltu         a6, a3, a4
                  mulhsu       zero, s6, s10
                  mulhu        t0, t5, gp
                  sltu         t6, s9, s3
                  remu         a5, a6, s0
                  fsgnj.s      fa6, ft11, fa2
                  fcvt.s.w     fs1, s11, rne
                  fclass.s     t0, fa5
                  fadd.s       fs1, fs11, fa5, rdn
                  or           s1, t4, s5
                  fcvt.w.s     s5, fs8
                  or           t6, s5, t6
                  fsqrt.s      ft11, fs6, rmm
                  rem          s8, a7, s9
                  fcvt.w.s     s5, fa6, rup
                  sltiu        s11, s5, 16
                  srli         s0, a1, 15
                  slt          t6, a1, a6
                  srl          a3, tp, t1
                  fsgnjn.s     ft6, fs10, fa0
                  add          s9, s10, s2
                  fcvt.s.wu    fa4, a4
                  add          t6, s7, t4
                  fsqrt.s      fa6, ft7
                  fmax.s       fa7, fa2, fs9
                  slt          s9, t5, s10
                  slt          a0, s7, a0
                  sub          sp, a4, tp
                  fle.s        s4, ft10, ft8
                  remu         a1, t0, s7
                  andi         s6, a6, 1938
                  fcvt.s.wu    fa2, a6, rup
                  sll          sp, s5, s9
                  remu         s10, s9, a6
                  divu         s9, a0, s6
                  fmax.s       ft3, fs6, fs10
                  fcvt.s.w     ft4, tp, rne
                  fmv.x.w      a7, fs2
                  fsub.s       ft9, fa2, fs8, rdn
                  srai         s10, a1, 15
                  nop
                  fsgnjx.s     ft1, fa5, fs11
                  srli         t6, a3, 5
                  fadd.s       ft6, ft11, fs6, rtz
                  mulh         a7, a2, a6
                  feq.s        s6, ft5, ft10
                  andi         s10, s0, -688
                  slli         s11, a3, 24
                  fsqrt.s      fs11, ft9
                  add          s7, t3, t2
                  fmax.s       ft6, ft11, fs7
                  fdiv.s       fs2, ft10, ft4, rne
                  lui          s11, 876442
                  mul          s11, s3, s3
                  fsub.s       ft10, fs10, ft6, rtz
                  rem          t6, s1, zero
                  srli         a6, sp, 29
                  fsub.s       ft0, fs9, fs5
                  mulh         t1, s6, t1
                  mulhsu       a1, zero, a0
                  lui          gp, 37797
                  fclass.s     s0, ft8
                  fcvt.s.w     ft6, s4
                  sll          a5, t2, a2
                  fmv.w.x      fs3, t6
                  fsgnjx.s     ft8, fa1, fs4
                  mulh         gp, sp, a7
                  fcvt.w.s     t0, fa2
                  srli         a0, a7, 7
                  nop
                  fmax.s       ft2, fa6, ft8
                  divu         gp, s8, s2
                  fsgnjn.s     ft5, fs5, ft8
                  sltiu        a0, s8, -1612
                  fdiv.s       ft3, ft0, fs0, rmm
                  lui          s9, 96844
                  sub          t5, s3, t5
                  fsgnjx.s     fs2, fs6, ft11
                  fdiv.s       ft0, ft1, fs0
                  nop
                  mulhu        s4, a6, a6
                  fle.s        s11, fs0, fs1
                  xor          s9, s6, s5
                  sltiu        s6, zero, 756
                  sltu         s11, tp, s6
                  fdiv.s       fa3, ft10, ft2, rdn
                  fmax.s       fa5, fs11, fa7
                  sltiu        s11, s10, 1105
                  fsqrt.s      fa5, fa5
                  ori          a7, s4, 555
                  fsgnjx.s     fa2, fa0, fa3
                  fcvt.s.w     fa3, sp
                  or           sp, zero, t6
                  fle.s        s4, ft10, fs4
                  fsub.s       fs11, fa0, ft1, rmm
                  rem          t4, a1, t0
                  feq.s        t4, fa1, fs0
                  addi         gp, zero, 680
                  andi         t4, sp, 427
                  mul          t6, t0, s9
                  divu         s7, s4, s4
                  fcvt.w.s     a7, fs0
                  div          sp, s10, s4
                  ori          t4, s4, 1303
                  fsgnjx.s     ft2, fs9, ft6
                  fcvt.wu.s    a3, ft4
                  mulhu        a3, t5, s7
                  fsub.s       fs8, fs7, fa5
                  fmv.x.w      t1, fs7
                  fmv.w.x      fs2, t0
                  slt          s5, ra, t5
                  srli         gp, a2, 6
                  mulh         s0, a3, gp
                  xori         s2, s10, 881
                  fclass.s     s3, fs9
                  fmax.s       fa5, fa3, ft6
                  rem          s9, t5, t1
                  mulhu        s11, sp, a4
                  xori         a7, a1, 442
                  fsgnjx.s     ft5, ft9, ft4
                  sra          s0, s1, s2
                  sltiu        t5, gp, 1799
                  fle.s        t2, fa5, fs9
                  remu         s10, t5, a7
                  fadd.s       fs2, ft9, ft8, rne
                  fcvt.wu.s    sp, fs1
                  fclass.s     ra, ft3
                  slt          s8, s0, s10
                  and          s3, zero, tp
                  xor          s7, a3, t5
                  fmv.w.x      ft6, t5
                  fmax.s       ft9, fa1, fa0
                  fclass.s     a1, fs4
                  flt.s        a5, fa3, ft4
                  flt.s        s11, ft2, fa7
                  fmul.s       fa0, fa0, ft8
                  mul          s2, t2, tp
                  fmin.s       fs7, fs8, fs4
                  andi         t1, s5, 255
                  sll          s4, ra, s10
                  fsqrt.s      ft11, fs11, rmm
                  slti         s6, a4, 240
                  divu         s9, t5, s11
                  fmv.x.w      a5, ft10
                  mulh         s1, t2, sp
                  sra          gp, t1, a3
                  fmin.s       fs0, ft4, fs2
                  sltiu        s9, t4, -733
                  div          t0, a0, zero
                  srai         s5, t3, 28
                  slli         s6, s0, 4
                  fadd.s       ft6, ft0, fs0
                  sll          a3, t4, a5
                  fle.s        s1, fs6, ft1
                  slli         s0, t2, 22
                  nop
                  add          t5, s8, t0
                  divu         t1, s7, a1
                  auipc        t5, 934855
                  fmul.s       fs8, fa7, fs1, rdn
                  fsgnj.s      ft7, fs8, ft11
                  fcvt.s.w     fa0, t5
                  sra          t4, s0, s5
                  sra          s11, s8, s11
                  addi         a7, s1, 671
                  slti         s3, s3, -540
                  xori         t4, gp, -585
                  srl          s3, a3, s10
                  sra          t1, s9, s6
                  sltiu        s10, t4, 1545
                  addi         s6, t2, -894
                  fmax.s       fs7, fa7, ft2
                  add          gp, a5, s3
                  fmax.s       fs10, fs10, ft1
                  lui          t6, 214587
                  sra          t6, s7, a2
                  ori          ra, a1, 1161
                  fsgnj.s      fs7, fs0, fs8
                  fmv.x.w      t6, ft11
                  slti         a3, a4, 1251
                  fle.s        gp, ft4, fa1
                  xori         s0, s3, -1062
                  fmv.w.x      ft3, a2
                  fle.s        gp, fs10, fs11
                  addi         s0, a7, 2
                  fadd.s       fa1, fs0, fs7, rup
                  fmv.w.x      fa5, gp
                  fdiv.s       fs6, ft5, fs7
                  andi         zero, ra, 150
                  slti         s5, ra, 23
                  and          gp, t0, s8
                  fclass.s     ra, fs2
                  ori          a4, s8, 1304
                  fmv.w.x      ft3, s4
                  nop
                  sll          t1, s11, s5
                  fsub.s       fs8, fa0, fs6
                  xor          s8, ra, a3
                  andi         a4, a5, 243
                  fmv.x.w      t5, ft7
                  sub          a0, a7, s9
                  sll          sp, s11, a2
                  srli         t5, t3, 13
                  fsgnj.s      fa4, ft10, ft10
                  fsub.s       fa6, ft1, ft3
                  slli         a4, t5, 29
                  sltiu        t0, tp, 691
                  xor          t6, a7, a3
                  xori         s10, s5, 2008
                  add          a3, zero, s6
                  srai         t4, tp, 27
                  fmul.s       fa4, ft8, fs1
                  fmv.x.w      a1, fs8
                  sltiu        s11, t4, -1029
                  fclass.s     a7, fa0
                  fsqrt.s      ft8, fs1, rne
                  or           a1, a0, s4
                  fmax.s       ft7, fa2, fs10
                  mul          a3, zero, s6
                  fmv.w.x      ft4, a5
                  fcvt.s.wu    fs9, t6, rmm
                  div          t4, tp, a6
                  srl          s0, a0, t1
                  div          t2, gp, t5
                  sltu         s5, a3, a5
                  mulh         s3, a7, t0
                  auipc        a7, 186024
                  fmv.w.x      fs9, t1
                  srai         a5, a7, 24
                  xor          s5, a7, s7
                  remu         s4, zero, a6
                  fsgnj.s      fa0, fs4, ft1
                  andi         a7, tp, 366
                  fclass.s     s1, fs3
                  flt.s        s6, fs0, fs4
                  xor          s2, s0, a2
                  addi         gp, t3, 390
                  slt          a1, s6, s6
                  sll          t5, a6, a0
                  fsgnj.s      fa2, ft1, fa0
                  add          a0, a1, s5
                  mulhu        t2, a0, t2
                  fclass.s     s7, ft5
                  fle.s        s11, fa1, fa3
                  fclass.s     s11, fs3
                  lui          s2, 143273
                  fdiv.s       ft10, ft3, ft10, rmm
                  fsgnjx.s     ft3, ft10, fs9
                  fsub.s       fa0, ft5, fa4, rup
                  flt.s        sp, fa6, fa7
                  slti         s6, a2, 1702
                  xori         s0, s5, -1033
                  fsgnj.s      fa1, fa2, fa4
                  rem          a1, a7, a5
                  mulhu        ra, a4, s1
                  feq.s        s1, ft8, fs5
                  addi         a4, a2, 946
                  lui          t5, 638727
                  remu         s7, s5, tp
                  fmin.s       fs10, fa3, fa2
                  fmin.s       ft11, fa5, fs9
                  fclass.s     a0, ft2
                  srli         a0, t2, 3
                  fclass.s     sp, fs8
                  fmv.x.w      t4, fs11
                  srli         s3, a2, 29
                  slt          s9, s10, s11
                  fle.s        s5, fs0, fa3
                  lui          t6, 188991
                  fdiv.s       fa7, fa1, fs6
                  fsgnjn.s     fa7, ft7, fs7
                  fdiv.s       ft9, ft5, fs0
                  srl          s2, s8, s0
                  addi         gp, s11, -68
                  slli         s8, gp, 6
                  div          a7, s0, a6
                  fcvt.s.w     fs1, a4
                  xori         t4, a2, -581
                  sltiu        s5, s11, 730
                  slt          s9, zero, t1
                  sra          s5, s7, t3
                  fadd.s       fs6, ft2, ft9, rup
                  add          s9, a7, zero
                  fdiv.s       ft7, ft8, fa7, rne
                  fsqrt.s      ft5, fa3, rtz
                  fsub.s       ft7, fa3, fs4, rtz
                  fmin.s       ft5, fs9, fs7
                  fmv.w.x      fa4, s5
                  xori         a3, t4, 1833
                  sra          a0, ra, s2
                  sub          t0, a2, t0
                  srai         ra, s11, 9
                  lui          s5, 435039
                  or           a1, gp, s2
                  and          t0, s11, s3
                  fdiv.s       fs7, fs9, fs3, rtz
                  nop
                  fsgnjn.s     ft10, fs8, ft0
                  addi         s3, t6, -867
                  auipc        s9, 190748
                  xori         t6, a2, 378
                  slti         s3, a2, 965
                  fcvt.s.w     fs3, t4
                  auipc        a5, 538782
                  sll          a6, s5, t1
                  sltu         t5, s8, a4
                  xori         s1, a7, -223
                  srl          t5, t6, s10
                  fsub.s       fa7, ft11, ft8, rne
                  slli         s1, a4, 24
                  fcvt.s.wu    fs6, s7
                  mulh         zero, s6, gp
                  lui          t5, 402954
                  sub          ra, s10, t1
                  srai         gp, a3, 7
                  mulhsu       t5, s8, t3
                  fsqrt.s      ft10, fs3, rmm
                  srl          t1, a7, a3
                  fsub.s       ft11, fs3, fs2, rdn
                  fclass.s     s6, fs9
                  addi         gp, a4, 466
                  andi         t5, t1, -1830
                  fcvt.wu.s    s4, fs4, rdn
                  xor          a1, t5, s11
                  sub          s6, a3, t3
                  andi         s1, a7, 1533
                  remu         s5, t3, s5
                  fdiv.s       fa0, fs11, fa6, rmm
                  andi         s1, a2, -264
                  fmv.w.x      fs8, a3
                  fcvt.s.wu    ft8, s9, rne
                  add          s4, s4, sp
                  slti         gp, gp, -470
                  fsgnjx.s     fa0, ft7, fs10
                  fcvt.wu.s    a0, fa3, rup
                  fclass.s     a1, fs2
                  srli         s9, a5, 24
                  div          zero, s7, t6
                  addi         a5, t3, 1458
                  fle.s        a5, ft11, fs5
                  xor          a5, a3, a3
                  fsgnj.s      ft10, ft7, fs10
                  mulh         s7, s3, s3
                  divu         s0, s6, a7
                  ori          a6, t2, 976
                  addi         gp, s7, -160
                  fmv.x.w      s5, fa4
                  rem          s11, s11, s11
                  and          s1, s8, a5
                  mulh         t5, t6, t3
                  flt.s        ra, ft0, fa2
                  mulh         s10, a4, a5
                  nop
                  fmax.s       ft11, ft1, fs1
                  mulh         s3, s2, s11
                  sltu         zero, tp, s4
                  fclass.s     s10, ft11
                  srai         a6, a4, 8
                  sltu         t5, t6, a6
                  sub          s8, s7, a6
                  sra          gp, a7, s11
                  xor          ra, t5, t5
                  sltiu        zero, a3, -694
                  div          s6, sp, s4
                  srai         t1, s6, 11
                  divu         sp, s7, a3
                  fsgnjx.s     ft11, ft2, fs6
                  fcvt.w.s     t6, ft2
                  fmin.s       fs4, fa2, fa7
                  mulh         s0, t5, a2
                  fsqrt.s      fa5, fs7
                  fsqrt.s      fs2, fa2, rup
                  srai         zero, a3, 27
                  fcvt.s.wu    fa2, s9
                  srai         s10, sp, 3
                  xor          a0, s11, t6
                  divu         t5, s8, s6
                  fle.s        s8, ft0, fa2
                  slli         a5, s8, 13
                  mul          s3, s8, t0
                  fmv.w.x      fs10, s7
                  fmul.s       fa7, fs9, ft8
                  ori          a3, s2, 1434
                  fmax.s       ft2, fs7, fs11
                  slt          t1, t5, s6
                  sltiu        t6, t6, 1198
                  andi         gp, s2, 2003
                  nop
                  slti         s1, s6, 84
                  mulhu        t1, s7, s5
                  and          a5, s7, t0
                  sltiu        a6, sp, 631
                  srli         a5, a4, 27
                  fle.s        a3, ft8, ft3
                  fmax.s       ft11, fa2, ft8
                  srai         t0, s1, 28
                  fsgnjn.s     fs4, fs6, fs7
                  sltiu        s7, s11, 1283
                  fdiv.s       fs9, ft11, fa4
                  flt.s        s10, fa5, ft1
                  fdiv.s       ft1, fa7, ft10, rne
                  mulhu        s11, s2, s8
                  auipc        a0, 12301
                  divu         a7, s9, a2
                  fadd.s       ft0, ft9, fa6
                  flt.s        a0, fa6, fs7
                  slli         a0, t0, 18
                  sltu         s11, a1, s2
                  and          zero, s10, a6
                  fle.s        t0, fa6, ft1
                  nop
                  mul          s11, s1, t1
                  fmv.x.w      gp, fs0
                  slt          s1, a4, t3
                  remu         a3, s0, s0
                  mul          t1, a4, zero
                  sltu         s2, t5, ra
                  slli         s6, t3, 15
                  sltu         a3, a3, zero
                  fle.s        zero, ft1, fa7
                  divu         s1, a0, s5
                  slt          s6, s9, a5
                  fsgnjn.s     ft6, fs3, fa6
                  mulh         s7, t1, a7
                  andi         t2, s2, 181
                  flt.s        s0, ft2, fa0
                  fcvt.s.w     ft10, t5, rmm
                  fmin.s       ft11, fa4, fs9
                  div          s3, a1, s10
                  andi         a1, s3, 2004
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
.align           2
mtvec_handler:    
                  addi x4, x4, -4
                  sw  x12, (x4)
                  add x12, x4, zero
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
                  add x4, x12, zero
                  csrr x23, 0x300 # MSTATUS
                  csrr x23, 0x342 # MCAUSE
                  srli x23, x23, 31
                  bne x23, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x23, 0x341 # MEPC
                  csrr x23, 0x342 # MCAUSE
                  li x19, 0x3 # BREAKPOINT
                  beq x23, x19, ebreak_handler
                  li x19, 0x8 # ECALL_UMODE
                  beq x23, x19, ecall_handler
                  li x19, 0x9 # ECALL_SMODE
                  beq x23, x19, ecall_handler
                  li x19, 0xb # ECALL_MMODE
                  beq x23, x19, ecall_handler
                  li x19, 0x1
                  beq x23, x19, instr_fault_handler
                  li x19, 0x5
                  beq x23, x19, load_fault_handler
                  li x19, 0x7
                  beq x23, x19, store_fault_handler
                  li x19, 0xc
                  beq x23, x19, pt_fault_handler
                  li x19, 0xd
                  beq x23, x19, pt_fault_handler
                  li x19, 0xf
                  beq x23, x19, pt_fault_handler
                  li x19, 0x2 # ILLEGAL_INSTRUCTION
                  beq x23, x19, illegal_instr_handler
                  csrr x19, 0x343 # MTVAL
                  1: la x28, test_done
                  jalr x1, x28, 0

ecall_handler:    
                  la x23, _start
                  sw x0, 0(x23)
                  sw x1, 4(x23)
                  sw x2, 8(x23)
                  sw x3, 12(x23)
                  sw x4, 16(x23)
                  sw x5, 20(x23)
                  sw x6, 24(x23)
                  sw x7, 28(x23)
                  sw x8, 32(x23)
                  sw x9, 36(x23)
                  sw x10, 40(x23)
                  sw x11, 44(x23)
                  sw x12, 48(x23)
                  sw x13, 52(x23)
                  sw x14, 56(x23)
                  sw x15, 60(x23)
                  sw x16, 64(x23)
                  sw x17, 68(x23)
                  sw x18, 72(x23)
                  sw x19, 76(x23)
                  sw x20, 80(x23)
                  sw x21, 84(x23)
                  sw x22, 88(x23)
                  sw x23, 92(x23)
                  sw x24, 96(x23)
                  sw x25, 100(x23)
                  sw x26, 104(x23)
                  sw x27, 108(x23)
                  sw x28, 112(x23)
                  sw x29, 116(x23)
                  sw x30, 120(x23)
                  sw x31, 124(x23)
                  la x28, write_tohost
                  jalr x0, x28, 0

instr_fault_handler:
                  add x12, x4, zero
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
                  add x4, x12, zero
                  lw  x12, (x4)
                  addi x4, x4, 4
                  mret

load_fault_handler:
                  add x12, x4, zero
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
                  add x4, x12, zero
                  lw  x12, (x4)
                  addi x4, x4, 4
                  mret

store_fault_handler:
                  add x12, x4, zero
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
                  add x4, x12, zero
                  lw  x12, (x4)
                  addi x4, x4, 4
                  mret

ebreak_handler:   
                  csrr  x23, 0x341
                  addi  x23, x23, 4
                  csrw  0x341, x23
                  add x12, x4, zero
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
                  add x4, x12, zero
                  lw  x12, (x4)
                  addi x4, x4, 4
                  mret

illegal_instr_handler:
                  csrr  x23, 0x341
                  addi  x23, x23, 4
                  csrw  0x341, x23
                  add x12, x4, zero
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
                  add x4, x12, zero
                  lw  x12, (x4)
                  addi x4, x4, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x23, 0x300 # MSTATUS;
                  csrr  x23, 0x304 # MIE;
                  csrr  x23, 0x344 # MIP;
                  csrrc x23, 0x344, x23 # MIP;
                  add x12, x4, zero
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
                  add x4, x12, zero
                  lw  x12, (x4)
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
