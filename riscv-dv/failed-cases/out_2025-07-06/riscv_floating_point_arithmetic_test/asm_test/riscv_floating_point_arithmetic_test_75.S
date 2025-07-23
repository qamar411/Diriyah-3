.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x19, h0_start
jalr x0, x19, 0
h0_start:
                  li x6, 0x40001120
                  csrw 0x301, x6
kernel_sp:        
                  la x11, kernel_stack_end

trap_vec_init:    
                  la x6, mtvec_handler
                  ori x6, x6, 0
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
                  li x6, 4286578687
                  fmv.w.x f0, x6
                  li x6, 4286578687
                  fmv.w.x f1, x6
                  li x6, 2139095041
                  fmv.w.x f2, x6
                  li x6, 4286578688
                  fmv.w.x f3, x6
                  li x6, 2143289344
                  fmv.w.x f4, x6
                  li x6, 4286578687
                  fmv.w.x f5, x6
                  li x6, 4286578687
                  fmv.w.x f6, x6
                  li x6, 2139095039
                  fmv.w.x f7, x6
                  li x6, 2143289344
                  fmv.w.x f8, x6
                  li x6, 4286578687
                  fmv.w.x f9, x6
                  li x6, 2147483648
                  fmv.w.x f10, x6
                  li x6, 2147483648
                  fmv.w.x f11, x6
                  li x6, 0
                  fmv.w.x f12, x6
                  li x6, 0
                  fmv.w.x f13, x6
                  li x6, 2149147297
                  fmv.w.x f14, x6
                  li x6, 2170640086
                  fmv.w.x f15, x6
                  li x6, 4286578687
                  fmv.w.x f16, x6
                  li x6, 2151302173
                  fmv.w.x f17, x6
                  li x6, 4286578688
                  fmv.w.x f18, x6
                  li x6, 4286578687
                  fmv.w.x f19, x6
                  li x6, 2143289344
                  fmv.w.x f20, x6
                  li x6, 2143289344
                  fmv.w.x f21, x6
                  li x6, 3278934
                  fmv.w.x f22, x6
                  li x6, 615173
                  fmv.w.x f23, x6
                  li x6, 4286578688
                  fmv.w.x f24, x6
                  li x6, 5070299
                  fmv.w.x f25, x6
                  li x6, 4286578687
                  fmv.w.x f26, x6
                  li x6, 2143289344
                  fmv.w.x f27, x6
                  li x6, 2143289344
                  fmv.w.x f28, x6
                  li x6, 2149855802
                  fmv.w.x f29, x6
                  li x6, 2147483648
                  fmv.w.x f30, x6
                  li x6, 1517075269
                  fmv.w.x f31, x6
                  fsrmi 0
                  li x0, 0xf1bc2a9b
                  li x1, 0x0
                  li x2, 0x4425a0ab
                  li x3, 0x80000000
                  li x4, 0x80000000
                  li x5, 0xc
                  li x6, 0xf3f44e4d
                  li x7, 0x7
                  li x8, 0xffce2eca
                  li x9, 0x80000000
                  li x10, 0xf39740ae
                  li x12, 0xb6bd046d
                  li x13, 0xf9f9d7fa
                  li x14, 0xfb1f43d7
                  li x15, 0x80000000
                  li x16, 0x0
                  li x18, 0x80000000
                  li x19, 0x1710d712
                  li x20, 0xf16ed97a
                  li x21, 0x0
                  li x22, 0x4316945f
                  li x23, 0xfb6fac53
                  li x24, 0x5
                  li x25, 0x0
                  li x26, 0x80000000
                  li x27, 0x0
                  li x28, 0xf9e02766
                  li x29, 0x67f329b1
                  li x30, 0x80000000
                  li x31, 0x80000000
                  la x17, user_stack_end
main:             slt          a2, s8, a6
                  fsgnj.s      ft8, ft5, fs6
                  mul          t1, s6, t4
                  fsqrt.s      fs10, fs2
                  srai         a6, s4, 31
                  div          zero, t5, s1
                  remu         s10, ra, t3
                  sll          a4, s4, a3
                  mulhsu       s8, gp, s5
                  fle.s        s5, ft6, ft10
                  sltu         a3, s0, t5
                  fmin.s       ft6, fs9, ft6
                  fclass.s     t1, fa6
                  add          s4, t2, s10
                  fmv.x.w      s4, fs2
                  fsub.s       fa6, ft10, fs3, rdn
                  or           sp, s3, t2
                  fdiv.s       fs3, ft0, fs0
                  srai         t3, a7, 30
                  sltiu        s5, tp, -1901
                  fsub.s       fa6, fa3, ft2
                  divu         t5, a3, tp
                  sltiu        a3, s0, -1456
                  or           t6, a7, zero
                  andi         s4, s1, 1280
                  srl          sp, s2, t4
                  fcvt.s.wu    ft11, a2
                  mulhu        s2, s6, s4
                  fsub.s       fa3, fa6, fa4, rtz
                  mul          sp, s4, s10
                  flt.s        zero, fa0, fs3
                  fmv.x.w      a6, fa7
                  mul          ra, s3, t5
                  fcvt.w.s     zero, fs8
                  remu         a2, t3, s1
                  srli         a6, s6, 0
                  sra          a6, t5, a1
                  remu         t0, ra, t2
                  mulhu        a4, a6, s4
                  fmin.s       fs6, ft1, fa4
                  srai         s0, s4, 4
                  andi         s10, gp, 1260
                  or           t6, s0, sp
                  xori         s11, a5, 763
                  feq.s        ra, fs1, fs10
                  xori         a5, s3, 182
                  fmax.s       ft10, fs3, fs9
                  fmul.s       fa3, fa6, fa4, rtz
                  ori          s0, s8, 1861
                  fmul.s       ft0, ft4, fs5, rtz
                  mulhsu       s10, a1, s1
                  addi         t4, zero, 1019
                  addi         a0, gp, -1728
                  lui          t2, 353413
                  xor          s11, a2, t4
                  mulh         t2, s2, t6
                  sra          zero, s6, t3
                  slt          a0, s6, t4
                  fclass.s     t5, fa3
                  fsgnjx.s     fa3, fs3, ft6
                  sltu         zero, a1, a0
                  mul          t3, t1, s8
                  fmv.x.w      s10, ft2
                  fclass.s     s6, fa0
                  nop
                  auipc        s9, 488036
                  mulhsu       s0, s6, t4
                  lui          t0, 492951
                  and          t3, t3, s11
                  andi         a2, gp, -130
                  slt          s4, s11, a3
                  or           t5, t3, a1
                  mul          s8, t2, t1
                  slt          s10, sp, a0
                  fsgnjx.s     fa5, ft3, fa0
                  fclass.s     s8, fs7
                  mulh         s6, a2, s11
                  nop
                  slti         tp, ra, 1923
                  mulhsu       s4, s0, ra
                  addi         a4, a4, -1896
                  fcvt.s.w     fs4, ra, rtz
                  andi         s6, a1, -935
                  mul          s9, a3, a6
                  fcvt.s.w     ft0, a4, rdn
                  fmul.s       ft3, ft6, fs8
                  ori          s5, t0, 1629
                  srli         gp, a4, 18
                  sra          s4, a7, a7
                  srli         s2, t3, 28
                  div          tp, a4, gp
                  xori         s11, a0, 873
                  srl          t5, s4, s1
                  srai         t4, t0, 0
                  fcvt.s.w     ft8, s2, rdn
                  mulhu        t4, s2, s6
                  fsgnjx.s     fs1, ft8, fs3
                  addi         t4, tp, 1531
                  lui          s2, 678078
                  srl          s1, s0, s7
                  fmv.x.w      a5, fs6
                  fle.s        a6, fa6, fs5
                  srli         s9, s7, 29
                  remu         a6, s6, s7
                  fmv.w.x      fs8, s9
                  sra          ra, t2, a2
                  and          a6, gp, t6
                  fmul.s       fs3, ft9, fa0, rdn
                  fmin.s       fa2, fa4, ft0
                  fmul.s       ft1, fs7, ft8
                  xori         t3, t5, 1222
                  fmv.x.w      t5, fs5
                  mulhu        gp, s9, s0
                  addi         a5, t1, -1504
                  slt          t0, zero, t4
                  fsqrt.s      ft10, ft4
                  fcvt.s.w     fs6, s11, rmm
                  or           s1, a5, s3
                  auipc        a5, 633814
                  fsub.s       ft0, ft5, ft1, rup
                  slli         t3, t5, 26
                  srai         a3, a2, 18
                  lui          a6, 910453
                  xor          t4, s9, a5
                  sra          t6, s6, t4
                  rem          a0, s9, t2
                  srli         a0, a1, 4
                  add          s6, t4, s11
                  srai         s1, a7, 2
                  feq.s        tp, fa7, ft0
                  add          s1, s1, zero
                  mul          a6, a3, s3
                  andi         sp, t5, -800
                  fcvt.s.w     fa6, a0
                  fsgnjn.s     fs3, fs4, fs6
                  rem          s6, a0, a6
                  fadd.s       ft5, ft8, ft0, rne
                  fcvt.s.wu    fs6, a5
                  fclass.s     gp, ft0
                  fsgnj.s      fa4, ft11, fs8
                  fadd.s       ft10, fs11, ft2, rup
                  or           t1, s8, s2
                  mulh         s11, tp, sp
                  fcvt.s.wu    fs2, a5, rmm
                  fmv.x.w      s4, fa3
                  fsub.s       ft1, fs8, fs3, rmm
                  slt          s11, s6, t4
                  div          zero, a0, s7
                  srli         s6, s6, 22
                  fle.s        a6, ft8, fs3
                  ori          t4, s2, -1580
                  lui          sp, 450940
                  xor          s10, s0, t0
                  mulh         s10, t2, tp
                  srai         a0, s7, 21
                  or           s10, ra, a7
                  fsqrt.s      ft0, ft10, rne
                  feq.s        t1, ft3, ft10
                  xori         t5, s0, -1094
                  fsgnj.s      fs2, fs2, fa5
                  fmv.w.x      fa2, t1
                  andi         gp, tp, 1717
                  fcvt.wu.s    a0, ft2
                  flt.s        t6, ft11, fa4
                  fclass.s     t4, fs9
                  sub          ra, a1, s1
                  remu         t2, a0, s0
                  remu         a0, s2, t1
                  sub          s10, t2, t6
                  add          a5, zero, t0
                  lui          t6, 872358
                  add          t2, sp, sp
                  fcvt.s.wu    fa3, s1
                  fsqrt.s      fs0, ft0
                  or           a5, s4, s8
                  remu         s6, s11, t0
                  sll          t5, s10, s2
                  fmin.s       fs0, ft2, fs3
                  sll          tp, a0, s10
                  div          t2, t5, t4
                  sltiu        t3, t6, 1528
                  flt.s        s1, fs8, fs7
                  sub          sp, s1, a6
                  srli         a0, t5, 21
                  or           sp, a4, t6
                  mulh         t5, a7, zero
                  fsgnj.s      fa4, ft2, fs1
                  feq.s        s11, ft10, ft3
                  sll          s0, a7, t5
                  xor          s0, tp, s6
                  srai         s0, a7, 18
                  sll          tp, a4, s3
                  fclass.s     t2, ft10
                  div          tp, sp, zero
                  fcvt.wu.s    a4, ft1
                  add          a2, s9, a3
                  flt.s        s7, fa4, fs5
                  xori         t3, a5, 79
                  fclass.s     s7, ft7
                  mulhu        gp, s11, s9
                  fdiv.s       ft6, fs4, ft8
                  fcvt.s.w     fa0, a7
                  lui          a4, 530611
                  slt          s8, a1, t4
                  remu         s8, t0, tp
                  fsgnj.s      ft7, fs4, ft9
                  flt.s        t5, fs1, fa3
                  mulhsu       s10, s7, s9
                  fcvt.w.s     s11, fa4, rup
                  fcvt.w.s     sp, fa3, rdn
                  nop
                  fcvt.wu.s    zero, fa6
                  fmul.s       fa7, ft11, fs0
                  fadd.s       ft4, fs11, ft4
                  srli         s0, ra, 26
                  fsgnjx.s     ft8, fs9, fs4
                  sll          s7, zero, s9
                  fmax.s       fs11, fs2, fs7
                  slli         s0, a4, 6
                  xor          a6, s5, t4
                  nop
                  sltu         s0, a6, a5
                  sub          t3, a4, a4
                  fsgnj.s      ft4, fs4, ft7
                  fsgnjn.s     ft11, fa4, fs2
                  mulhu        a5, a2, a4
                  sltu         s4, s10, a3
                  fsgnj.s      ft4, ft4, fa6
                  div          zero, gp, s11
                  sll          t3, s11, s1
                  mulhu        s9, a4, ra
                  fsgnj.s      fs1, ft10, fa6
                  fadd.s       fa2, fs5, fa4, rtz
                  sltiu        s7, t1, 727
                  flt.s        s11, fs2, fa1
                  fcvt.s.w     fa5, gp
                  srli         s7, a1, 0
                  fsgnjx.s     ft4, ft11, fs4
                  mul          t1, a3, a5
                  remu         a5, s4, s0
                  mul          t2, a1, t2
                  fsgnj.s      ft9, fa2, fa3
                  ori          t0, s0, 1880
                  and          t4, gp, a5
                  srl          a4, ra, sp
                  addi         t1, s0, 691
                  srli         gp, s10, 28
                  fsub.s       fs4, fs9, fs5
                  sub          s10, t3, a5
                  fcvt.w.s     s5, fa5, rne
                  xori         a4, a4, -4
                  srai         a6, zero, 8
                  slt          t3, s2, t4
                  sub          gp, a0, a6
                  auipc        a4, 93192
                  fsgnj.s      fs2, fs9, fa2
                  fmv.x.w      s9, fa4
                  fmin.s       fa2, fs5, fa5
                  addi         a3, a4, -74
                  div          s6, s11, s5
                  srl          a2, sp, t2
                  fmv.w.x      fs1, s0
                  mulhsu       t4, a7, sp
                  lui          s8, 482730
                  fcvt.wu.s    t1, fs1, rmm
                  andi         ra, a6, 1626
                  sltiu        s2, ra, -1769
                  mulhsu       a3, a0, t0
                  fsqrt.s      fa7, fa6, rmm
                  fsgnjx.s     fs6, fa6, ft3
                  addi         s11, a6, 563
                  auipc        t1, 911166
                  sll          t6, a7, zero
                  flt.s        s10, ft8, fa4
                  fadd.s       fs6, fs10, fa1
                  remu         a6, s9, ra
                  fmax.s       fa0, ft6, fs4
                  ori          t0, s4, -1071
                  fsgnjx.s     fs2, fs4, fs1
                  sra          s6, t3, s6
                  slti         t3, s3, -360
                  ori          gp, s0, 735
                  srli         sp, t2, 25
                  slti         a4, a5, 508
                  and          a2, tp, s7
                  fadd.s       ft6, fa6, fs7
                  fsqrt.s      fa2, ft5, rdn
                  remu         s1, gp, a1
                  fmv.x.w      s1, ft5
                  mulhu        a5, t0, a5
                  fmv.x.w      s2, fa6
                  remu         s5, t1, s2
                  xor          s1, t3, s11
                  lui          s6, 174283
                  divu         a4, a0, t1
                  addi         t2, sp, 17
                  sub          a0, s8, s1
                  rem          t1, t5, s2
                  fcvt.wu.s    zero, fs11
                  fmin.s       fs8, ft8, ft6
                  feq.s        t3, fs2, fa2
                  andi         t5, a5, 1200
                  rem          a0, a0, zero
                  lui          a4, 101661
                  rem          ra, s6, gp
                  srl          sp, sp, t5
                  divu         a2, s7, gp
                  mulhu        s7, t1, s6
                  mulhsu       a3, a6, zero
                  fcvt.w.s     s10, ft1, rne
                  mulh         a0, sp, s10
                  and          s9, gp, sp
                  feq.s        a3, ft6, fa0
                  fsgnjn.s     fs4, fa0, ft4
                  fmin.s       fs11, ft1, ft6
                  addi         t5, zero, 1870
                  fsgnj.s      ft8, fs2, ft2
                  fmul.s       fa6, ft8, fa0, rdn
                  fcvt.s.w     fs7, s11
                  div          a5, s1, t2
                  addi         zero, a5, 13
                  sltiu        t3, s6, -301
                  fsub.s       fa1, ft1, fs7
                  fsgnjx.s     fs2, fs6, fa4
                  slt          a0, s5, s2
                  mul          s10, a5, s3
                  fsqrt.s      fa3, fa3
                  remu         t6, a2, zero
                  fcvt.s.wu    fs11, a4, rtz
                  fmv.x.w      sp, ft9
                  srl          t6, a4, s6
                  feq.s        a3, ft5, fa4
                  slti         tp, tp, -1950
                  sub          sp, ra, ra
                  mulh         ra, t1, s10
                  div          t4, a5, sp
                  fcvt.wu.s    t5, ft7
                  andi         a6, s3, -259
                  fsgnjn.s     fa2, fa7, ft0
                  add          a4, s4, gp
                  divu         ra, t1, a2
                  div          ra, t2, t1
                  div          s7, s7, s3
                  fcvt.wu.s    t0, fa6, rmm
                  slt          t5, s10, s10
                  sub          s7, a2, s1
                  sub          a0, t4, a2
                  fdiv.s       fa5, ft9, ft7, rne
                  xori         a6, s9, -109
                  fsqrt.s      ft0, fs5
                  divu         t0, s1, t1
                  srl          s0, s9, s2
                  feq.s        s2, fa1, fa3
                  lui          a2, 578973
                  andi         a4, s3, 1074
                  fsgnjn.s     fs8, ft7, fs4
                  srl          a4, a1, a1
                  srl          a2, sp, t4
                  sra          s8, a0, s10
                  or           t3, s0, s4
                  add          t4, a0, s10
                  fcvt.s.wu    ft8, s0, rtz
                  nop
                  rem          tp, a7, s9
                  mul          a3, a7, s1
                  sll          t4, s5, a4
                  andi         a4, s10, -701
                  lui          s0, 937703
                  div          a3, s1, s11
                  fdiv.s       ft8, fs4, ft9
                  fcvt.wu.s    ra, fs1
                  sltu         s0, a6, s4
                  ori          t3, s10, 713
                  feq.s        t6, fs9, ft3
                  sll          s7, t6, t3
                  fsgnj.s      ft9, fa7, fs9
                  fsgnj.s      fs4, fa5, fs11
                  fcvt.s.wu    fs1, zero, rmm
                  div          a6, ra, s10
                  addi         s11, t5, -249
                  slti         sp, a0, -1317
                  nop
                  fsgnj.s      fs3, ft11, ft6
                  srli         s4, t2, 11
                  sltiu        a0, s3, 1248
                  feq.s        t4, fs0, fa7
                  fmv.w.x      fs4, t3
                  sltu         s8, a6, sp
                  mulh         t3, tp, s10
                  auipc        s7, 695063
                  lui          s4, 842188
                  fmv.x.w      s10, ft9
                  addi         ra, tp, -543
                  srl          t2, s5, ra
                  remu         gp, a4, a6
                  divu         s8, s10, a2
                  slti         s4, s5, -586
                  divu         s7, t4, s2
                  sll          zero, s6, ra
                  add          s2, ra, s1
                  mulhsu       gp, a2, s5
                  srli         sp, a0, 21
                  srli         a0, s9, 2
                  srli         s8, t1, 24
                  nop
                  ori          tp, a3, 1452
                  slti         t4, s1, 1138
                  andi         s4, t0, 999
                  sltu         a6, s0, a1
                  divu         zero, tp, s6
                  nop
                  or           t3, s6, a4
                  ori          s1, t5, -1328
                  fmul.s       ft10, fs5, fa6, rne
                  and          s1, a7, s10
                  fdiv.s       ft7, ft2, fs2
                  slt          t3, t2, s8
                  srl          s6, a5, a0
                  fmax.s       fa1, fa5, fa4
                  fcvt.wu.s    s6, fs9
                  fclass.s     t6, ft11
                  xor          s11, s5, s0
                  fsgnjn.s     ft2, fa5, fa7
                  divu         t6, s1, ra
                  srai         a3, s0, 17
                  fmv.w.x      fa6, t1
                  fmin.s       fs2, fa6, ft0
                  slti         t6, t5, -1233
                  mulh         s10, tp, a1
                  fcvt.w.s     t6, fs8
                  remu         t5, s4, t6
                  fcvt.wu.s    t2, fs2, rtz
                  add          a0, sp, t0
                  xor          gp, s6, s7
                  ori          a0, a3, -628
                  srl          t4, s11, s7
                  mulh         zero, a0, a1
                  sltu         t1, a4, a6
                  fsgnjn.s     ft4, ft10, fs5
                  sltu         gp, s10, t4
                  slt          s6, ra, a2
                  slt          s6, t4, zero
                  fle.s        a0, ft7, ft7
                  slti         a5, tp, -667
                  slti         t5, s11, 788
                  sra          gp, t1, s8
                  mulh         a5, tp, a1
                  fcvt.wu.s    zero, fs0
                  fmv.w.x      ft6, s8
                  fdiv.s       ft1, ft4, ft11
                  fmv.w.x      fs9, t2
                  feq.s        s8, fs5, fa1
                  fmul.s       fs7, ft7, fs10
                  ori          s7, t6, -1423
                  addi         s7, ra, -403
                  divu         s1, t0, a1
                  fsgnj.s      ft0, ft1, ft8
                  fsub.s       ft0, fs7, ft7
                  fle.s        t5, ft3, fs5
                  xor          tp, s5, tp
                  div          t6, a4, ra
                  fmv.w.x      fa2, t3
                  srl          tp, s5, a5
                  fcvt.s.w     fs6, t1, rtz
                  slt          t0, s10, sp
                  fle.s        t2, fs10, ft2
                  fmax.s       ft7, ft11, ft5
                  sltu         s7, t4, s3
                  sll          a2, a7, a3
                  fmin.s       fa4, ft4, fa3
                  sltiu        t3, a5, -1949
                  xor          s2, t6, t1
                  fsub.s       fs3, ft5, ft4
                  lui          s8, 624335
                  fsgnjn.s     fs6, ft9, fa6
                  addi         s11, t3, 1509
                  xor          t1, t5, s1
                  flt.s        s2, ft4, fs5
                  rem          s8, sp, tp
                  fcvt.wu.s    t4, ft2
                  fsgnjn.s     fs2, fs0, fs1
                  fsgnjn.s     fs2, ft7, fa5
                  srli         s9, t3, 10
                  xor          s11, a6, zero
                  fdiv.s       fa1, fs11, ft3
                  xor          s10, sp, t1
                  fmv.w.x      fs10, s8
                  sltiu        a5, ra, 1691
                  fcvt.w.s     tp, fs0
                  fsgnj.s      ft9, fs9, fs0
                  div          a4, t2, sp
                  addi         s4, a2, -978
                  fcvt.s.w     fs5, a2
                  and          t5, t2, s3
                  divu         t6, gp, a7
                  mulhu        gp, s4, t3
                  fle.s        s9, fa7, ft7
                  fle.s        t1, ft11, fa5
                  fcvt.w.s     s11, ft10, rmm
                  fsqrt.s      fa0, fa3, rtz
                  mulh         t2, a0, s0
                  xor          s9, t4, s1
                  add          t3, t0, s8
                  and          t5, a7, t4
                  nop
                  mul          a6, t6, s7
                  fcvt.s.w     fs1, s10, rmm
                  ori          a5, a6, 1708
                  slti         ra, a1, 327
                  fadd.s       fs9, fs6, ft0
                  andi         t5, a1, -620
                  fmax.s       ft5, ft8, ft9
                  flt.s        a2, fa6, fa4
                  feq.s        zero, ft7, ft7
                  fmv.x.w      zero, fa5
                  fmv.x.w      s8, fs0
                  slt          ra, a5, s0
                  sub          s0, t3, sp
                  and          s4, s6, s0
                  fsgnj.s      ft10, ft1, ft7
                  fcvt.s.w     ft1, a6
                  div          a4, tp, s3
                  fle.s        t6, fs6, ft9
                  mulhsu       s2, s7, t6
                  slti         s0, s6, 699
                  div          s1, s8, s11
                  fclass.s     s0, fs11
                  fcvt.w.s     a3, ft11, rtz
                  remu         a6, t3, gp
                  fmv.x.w      t0, ft1
                  fsqrt.s      fs1, fs10, rtz
                  fcvt.s.wu    ft2, t2, rdn
                  fcvt.s.wu    fa5, s6, rup
                  addi         s8, s3, -603
                  flt.s        a5, fs5, fa6
                  add          s1, s4, a1
                  fmul.s       fs1, fs3, fs8
                  or           a4, s9, s7
                  fle.s        gp, fs11, fa6
                  fsgnj.s      fs5, fa0, fs2
                  fclass.s     t4, fs9
                  rem          s4, s1, t6
                  sll          zero, a7, tp
                  mulhu        gp, t0, s9
                  rem          s11, a3, s6
                  auipc        s9, 442096
                  mul          a5, t4, t6
                  mulhsu       s8, s9, a3
                  xori         t0, gp, 1232
                  fsub.s       fs3, ft11, fs10, rup
                  remu         t2, a5, t6
                  divu         t6, a5, s1
                  mul          t3, a7, s3
                  slt          s7, t2, t1
                  rem          t1, s8, zero
                  fsgnj.s      ft1, fs4, ft0
                  fmv.x.w      t3, fs8
                  fcvt.s.wu    fs1, s10
                  slti         s11, s1, 886
                  fadd.s       ft10, ft1, fs0
                  xori         zero, a1, 900
                  add          s0, s7, s1
                  srli         s5, a1, 25
                  fcvt.w.s     sp, ft8, rmm
                  xori         a0, s11, -1909
                  srl          t0, zero, a1
                  fclass.s     t2, ft9
                  fsgnjx.s     fs4, fs8, ft4
                  mul          a2, s7, gp
                  fclass.s     s4, ft2
                  fclass.s     t4, ft1
                  fsqrt.s      fs10, ft0
                  mul          t2, gp, a5
                  slli         a4, ra, 17
                  andi         s2, a5, -413
                  fadd.s       fa2, fs4, fs7
                  sll          sp, a2, t5
                  slti         s2, s9, 599
                  slt          s11, a7, t3
                  and          s4, s7, t3
                  fle.s        t2, fa2, ft1
                  fsub.s       ft2, fs6, fs11
                  fclass.s     t6, ft9
                  fcvt.wu.s    t2, fa4
                  slt          s5, s3, a2
                  fsgnjn.s     fs9, fa6, fa1
                  fsub.s       fa5, ft0, fs0
                  rem          a2, s6, t0
                  mulh         gp, s9, a2
                  xori         s9, a0, -1967
                  fsgnj.s      fs2, ft6, fs9
                  sra          s5, sp, s9
                  add          t3, ra, s0
                  srai         zero, s10, 20
                  srli         s10, gp, 26
                  divu         a2, s1, s9
                  feq.s        tp, fs10, fs11
                  divu         t5, t0, t4
                  mulh         t1, t0, s3
                  fcvt.wu.s    s11, ft5
                  xori         t0, a0, 297
                  mulhsu       gp, s6, a1
                  nop
                  srl          gp, s11, sp
                  fmin.s       fs1, ft3, fs10
                  xori         s9, s9, 1624
                  ori          s1, s3, -936
                  and          s9, s5, gp
                  remu         sp, s5, a2
                  rem          s0, s8, a3
                  divu         a6, ra, a4
                  and          s5, s5, a6
                  auipc        t0, 809242
                  mulh         s1, a0, a4
                  srli         a6, s1, 13
                  srai         a6, s8, 5
                  srai         s11, a1, 4
                  fcvt.w.s     a2, ft0
                  xori         s9, t6, -664
                  feq.s        t0, ft7, fs11
                  fcvt.s.w     ft2, t6
                  ori          sp, s1, -54
                  flt.s        gp, fs2, ft5
                  fmin.s       fs11, ft2, ft7
                  fmv.x.w      a6, fa4
                  fadd.s       ft10, fs0, fs6
                  fcvt.wu.s    s0, fs4, rmm
                  fcvt.s.w     ft10, s1, rne
                  fmax.s       fa7, fs1, ft3
                  mulhsu       zero, s5, a6
                  fsgnjn.s     ft4, fs8, ft8
                  sra          a0, a3, tp
                  fclass.s     s7, ft0
                  remu         gp, a3, t2
                  srai         s5, zero, 9
                  sltu         t3, s0, s6
                  or           gp, t3, s3
                  sll          s5, t3, a0
                  xori         s7, a2, -1214
                  xor          s7, t0, s7
                  sra          s5, s9, a6
                  feq.s        t2, ft10, ft3
                  fmin.s       ft10, fs1, fs10
                  mulh         a4, s6, t3
                  lui          s1, 84550
                  srl          zero, s2, a3
                  slti         s10, a3, -877
                  sll          t1, a6, s9
                  slli         t2, s9, 3
                  xor          a0, s3, s5
                  fle.s        t3, fa2, fs9
                  fclass.s     s7, ft7
                  fmin.s       ft1, ft5, ft3
                  fsqrt.s      fs0, fa6
                  andi         s0, a4, 1683
                  srl          s5, s2, s0
                  flt.s        a4, fa0, fa3
                  or           s10, s2, s2
                  srli         t4, s1, 30
                  fadd.s       fs8, fs2, fa6
                  fcvt.w.s     s2, ft1, rtz
                  sll          t1, t2, ra
                  lui          s7, 594136
                  fsgnjx.s     ft6, ft6, fs8
                  sra          s0, a6, zero
                  slli         t2, a2, 7
                  and          ra, zero, s5
                  fcvt.w.s     a6, fs11
                  srl          s9, s8, a7
                  mulhsu       tp, a0, zero
                  sub          t0, s0, a2
                  mulhsu       ra, a4, t6
                  fsgnjx.s     fa0, ft9, ft1
                  fsqrt.s      ft11, ft3
                  nop
                  sltu         s2, s5, t2
                  fsgnjn.s     ft5, ft2, ft8
                  div          t0, s3, zero
                  mul          t1, zero, s3
                  fcvt.w.s     a3, ft6, rtz
                  fclass.s     a3, fs5
                  fmax.s       fs4, ft0, fa2
                  sub          t0, t3, s0
                  lui          s2, 21310
                  nop
                  mulh         t0, a1, t3
                  fcvt.s.w     fa6, t4, rmm
                  fsgnjn.s     ft10, fs3, ft2
                  lui          t2, 985914
                  xor          a5, s5, s1
                  mulh         t0, t3, a6
                  sll          t3, a4, tp
                  and          s5, t4, s9
                  auipc        a3, 249091
                  fmin.s       ft2, ft3, ft5
                  fle.s        s6, fs8, ft8
                  fadd.s       fs5, fs10, fs1
                  mulhsu       t6, gp, s4
                  slti         zero, a4, 1916
                  sll          a3, a2, a6
                  lui          ra, 44733
                  fmv.w.x      ft9, sp
                  divu         s7, t6, s5
                  flt.s        ra, ft1, fs1
                  fle.s        gp, ft7, fs2
                  sll          zero, tp, s11
                  fcvt.w.s     t1, fa3, rtz
                  fsgnj.s      fs11, fa4, fs10
                  fcvt.s.w     fs1, s11
                  srli         a2, t2, 23
                  or           a3, a4, s3
                  fsgnjx.s     fs2, fa3, fs4
                  srli         t0, s8, 28
                  fmv.w.x      fs8, s7
                  fsub.s       fs4, fs6, fs1, rne
                  fdiv.s       fa1, ft6, ft9
                  fcvt.wu.s    gp, fs2
                  fsub.s       ft4, ft6, fs11
                  mulhsu       s11, a4, gp
                  ori          a4, t3, 682
                  nop
                  xor          s8, s11, a7
                  sltu         t0, t2, s1
                  nop
                  div          t0, s9, t6
                  xor          s9, a1, t6
                  fsgnjn.s     ft0, fa7, fs7
                  fcvt.w.s     t3, fs9
                  fadd.s       fs0, ft8, ft0, rup
                  fadd.s       ft10, fs4, fs3
                  xori         s0, s2, -554
                  slti         s10, s9, 1704
                  fcvt.s.w     ft8, s9
                  fmv.w.x      ft1, a2
                  or           a6, s3, tp
                  sra          s6, s2, ra
                  srl          gp, a2, a2
                  fcvt.w.s     a0, fs6
                  fcvt.wu.s    t5, ft2, rmm
                  srli         a0, s7, 15
                  fmax.s       fa3, fa7, ft10
                  fcvt.w.s     s0, fs5, rup
                  or           a5, t0, t6
                  remu         sp, a1, t6
                  addi         sp, s6, -1274
                  addi         s6, t6, -1458
                  fmv.w.x      ft5, s5
                  fsqrt.s      fa0, ft3, rne
                  srai         tp, zero, 12
                  sll          s5, s8, a5
                  xori         a5, s0, -54
                  slt          gp, t0, t3
                  xori         s9, a6, 1217
                  slti         s8, s0, -499
                  xor          tp, gp, s0
                  auipc        t3, 751554
                  fmax.s       fa3, fs3, fs3
                  sltu         a3, t2, zero
                  add          s11, t1, a1
                  xori         t5, t1, -961
                  addi         a3, s6, 1315
                  fmv.w.x      fs5, a0
                  srli         s9, s9, 28
                  flt.s        t1, fa5, fa4
                  add          a5, tp, s1
                  fmv.w.x      fs4, a3
                  slti         t2, s5, 1061
                  srli         sp, s2, 23
                  fmv.x.w      s1, fs5
                  fcvt.s.wu    ft9, s2
                  slt          a3, s4, s3
                  fmv.x.w      a6, ft3
                  ori          s5, s2, -1760
                  fcvt.s.wu    fs0, s2
                  sltu         s9, s11, s9
                  fmin.s       fs0, fs11, ft2
                  ori          ra, t3, -575
                  slt          t3, a2, s1
                  mul          t0, zero, s4
                  feq.s        a6, fa5, ft11
                  fclass.s     t1, ft8
                  fsub.s       ft10, fa3, fa4
                  andi         zero, s5, 240
                  and          s1, t1, a5
                  fsgnj.s      ft8, fs5, fs2
                  fsqrt.s      fs0, ft7
                  mulhu        zero, sp, s2
                  xori         s7, a1, -421
                  fmv.x.w      gp, ft10
                  fcvt.s.wu    ft0, t4
                  fdiv.s       fs10, fs7, ft10
                  or           t2, s11, a0
                  fsqrt.s      fa0, fs5
                  fcvt.wu.s    ra, ft1
                  fsgnj.s      fs5, fs8, ft6
                  flt.s        a2, fs2, fs6
                  mulh         t5, t3, s1
                  srli         s2, s9, 7
                  divu         t4, s7, zero
                  or           t0, s10, s5
                  slli         sp, s0, 26
                  xor          s8, s9, gp
                  mulh         s5, a1, t1
                  fadd.s       fa7, fs1, fa1
                  div          t2, sp, t3
                  fcvt.w.s     a2, ft8, rtz
                  sltu         s9, s9, s7
                  mul          t6, zero, t2
                  divu         a3, t3, a5
                  fsub.s       fa0, fs9, ft11
                  fclass.s     a0, ft0
                  xori         s11, t4, -310
                  div          t6, s5, s6
                  fcvt.wu.s    t1, ft3
                  fdiv.s       fs0, ft7, ft9
                  fadd.s       fs1, fs7, fs6, rne
                  srli         a6, s8, 1
                  fcvt.wu.s    t0, ft11, rtz
                  slt          s10, a1, s0
                  fmin.s       ft4, ft8, fs7
                  div          zero, s0, t3
                  fadd.s       fs2, fs2, fa0, rdn
                  fadd.s       fs8, ft5, ft8
                  srai         s1, a6, 17
                  and          s9, s2, sp
                  fmin.s       ft4, fs0, fa1
                  and          s4, tp, tp
                  lui          t1, 781494
                  auipc        gp, 22079
                  feq.s        a5, fa2, fs0
                  add          t2, a3, a1
                  mulhsu       t0, s1, a3
                  fsgnjx.s     fs9, fs0, fs4
                  or           t5, a5, t4
                  fsqrt.s      fa4, fa5
                  or           a0, a1, ra
                  fsgnjn.s     ft11, fa1, fs2
                  sll          a4, sp, a4
                  fmax.s       ft5, ft6, fa0
                  fcvt.wu.s    s7, ft0, rne
                  fmv.w.x      fs6, a0
                  xor          s11, zero, sp
                  fmv.x.w      t5, fs5
                  srl          a3, s9, s3
                  andi         s4, a5, -1348
                  divu         t4, t4, s6
                  sltu         t6, sp, s8
                  fmv.w.x      ft8, s7
                  fsgnjn.s     fa7, ft2, fs6
                  fle.s        s2, fs7, fs9
                  fmv.x.w      t6, fa3
                  nop
                  sub          s10, a4, s4
                  div          a6, s7, s2
                  ori          a5, t6, -845
                  fsqrt.s      ft10, fa5, rdn
                  addi         zero, a3, 1067
                  fdiv.s       fa5, ft5, fs4
                  fcvt.s.wu    ft9, s11
                  fsgnjn.s     fs6, fs10, fs11
                  fsgnjn.s     fa0, fs2, fs6
                  fsgnj.s      fa4, fs9, ft4
                  fadd.s       fs9, fa3, ft11
                  xor          s2, gp, a1
                  fmv.x.w      s6, ft5
                  div          t0, a0, s1
                  fcvt.wu.s    t1, ft10
                  fsgnjx.s     ft2, fs1, ft7
                  addi         t4, a7, 2028
                  divu         t6, a4, s9
                  xor          tp, s2, a3
                  slli         a2, a1, 20
                  addi         tp, t1, 1216
                  fclass.s     s2, fs7
                  fle.s        s5, ft9, fs3
                  fsqrt.s      fa1, fs3
                  fmin.s       ft1, fs3, fs2
                  add          t1, t1, a6
                  mulh         t4, t4, a5
                  fsgnj.s      ft7, ft7, fs4
                  lui          t5, 181150
                  xori         t3, t2, 1192
                  fcvt.s.wu    ft1, a3
                  fcvt.wu.s    s0, fs10
                  fmin.s       fs3, ft11, fs9
                  fsgnjn.s     fa5, fs3, fa5
                  lui          a3, 423841
                  sltu         s8, a6, s8
                  fclass.s     s2, fs5
                  sll          t6, t1, s10
                  mul          gp, a0, a4
                  slli         tp, s0, 7
                  ori          s9, s8, 838
                  nop
                  ori          t5, a1, -1839
                  fsgnjn.s     ft1, fs4, ft9
                  sltiu        t2, a2, -1433
                  srli         s7, a6, 11
                  and          t5, s3, t4
                  srai         t0, s0, 22
                  fdiv.s       fa5, fs6, fa1
                  sub          s4, zero, t4
                  fadd.s       fa5, fs5, fs3, rdn
                  xor          s2, gp, s5
                  slti         a6, a5, -1192
                  fdiv.s       ft9, fa6, fa5, rdn
                  fadd.s       ft5, fs4, ft11
                  fsub.s       fs5, fs4, ft6
                  fmv.w.x      fs9, tp
                  slt          t4, s10, a5
                  fle.s        a3, fs11, fs6
                  fmin.s       fa1, ft8, fa2
                  add          t6, s2, s5
                  srl          t4, t6, a7
                  fsgnjn.s     fs0, ft3, fa6
                  fsgnjx.s     ft2, fs7, ft10
                  divu         t3, t3, a1
                  fsgnj.s      ft4, fs10, fs11
                  remu         a5, t0, a3
                  flt.s        t3, fs6, ft1
                  sltiu        s5, t0, 436
                  slti         s0, s0, 1679
                  fmv.w.x      ft8, s2
                  and          s2, tp, t0
                  div          s6, t6, s0
                  fcvt.w.s     a2, fs5
                  mulhsu       a6, tp, s6
                  fdiv.s       fs7, fa1, fs6, rtz
                  srai         t0, t4, 18
                  fmul.s       ft11, ft7, ft11, rne
                  remu         a3, a2, s3
                  divu         s6, a1, a0
                  slti         t1, tp, 1213
                  fmin.s       fa2, fs0, ft1
                  feq.s        s0, fs1, ft0
                  sltu         tp, a0, t3
                  mul          t0, a3, a7
                  fsub.s       ft0, fa6, ft3
                  mulhsu       t5, a2, sp
                  xor          s2, s1, a3
                  xor          t1, s2, s0
                  fsgnjn.s     fs7, fs3, fs7
                  or           s4, s2, s5
                  mulh         sp, a5, zero
                  fmv.w.x      fa3, a7
                  fle.s        a6, ft6, fs8
                  fclass.s     a5, fs1
                  fdiv.s       fs5, ft2, fs3, rdn
                  sltiu        zero, s7, 1077
                  fcvt.s.wu    fs3, a6, rmm
                  fsgnjx.s     ft11, fa6, fs6
                  and          ra, t1, s2
                  fle.s        a2, fs6, fa1
                  sra          t3, s0, s7
                  slt          a2, t1, s10
                  fle.s        s0, fa6, ft11
                  srli         s0, s9, 19
                  add          t2, t6, s6
                  fsgnjx.s     ft8, ft2, ft9
                  slt          t5, s4, a4
                  fcvt.w.s     a4, fa4
                  nop
                  div          s1, t5, sp
                  lui          a5, 977543
                  fcvt.wu.s    s0, ft3
                  fsgnjn.s     fa5, ft10, fa7
                  mulh         s0, t2, s4
                  feq.s        s10, fa3, ft11
                  srli         s5, gp, 24
                  ori          s0, s7, 1593
                  fclass.s     s8, fs7
                  mul          s5, tp, a4
                  fcvt.s.w     ft3, t3
                  slti         a2, t5, 216
                  div          tp, s0, sp
                  fsqrt.s      fa1, ft4
                  fsgnjn.s     fa7, fs7, fs5
                  divu         s0, a1, a5
                  add          s7, tp, s2
                  xor          s1, s6, s9
                  srli         a2, a0, 0
                  fmax.s       fs6, fs11, fa1
                  div          t6, s6, zero
                  fclass.s     s2, fs6
                  andi         tp, a0, -1931
                  fsgnjx.s     fs4, fs4, ft4
                  nop
                  sltu         ra, a7, s4
                  sltiu        sp, s8, -493
                  mulhu        zero, a5, s3
                  fcvt.s.w     fa0, sp
                  xori         t6, t0, 945
                  fmv.x.w      a6, ft10
                  fle.s        tp, fs2, fa2
                  slli         t6, t4, 17
                  lui          t4, 720783
                  fsgnj.s      fs9, ft1, ft6
                  fcvt.s.w     ft9, s8, rdn
                  fadd.s       fa7, ft11, ft10
                  srl          tp, s10, gp
                  andi         s10, sp, 1058
                  xor          a6, t4, t0
                  andi         s9, s0, 1527
                  flt.s        a4, ft3, ft2
                  sltiu        s5, t5, 1473
                  lui          tp, 848187
                  fsgnjx.s     fa4, fs8, fs9
                  fsgnj.s      fa2, fa4, fs0
                  xori         ra, t3, 892
                  and          ra, t3, a0
                  fcvt.wu.s    sp, fs7, rtz
                  sltiu        a2, s1, -1286
                  mulhsu       a5, s9, tp
                  xor          t0, a5, zero
                  fle.s        sp, ft9, ft7
                  add          s7, s5, s6
                  fmv.x.w      s9, fs11
                  mulh         s0, a1, s9
                  remu         s8, a5, t4
                  fsub.s       ft11, fs5, fa3, rmm
                  nop
                  fmax.s       fs5, fa5, fa4
                  mulh         t3, a0, t0
                  fmv.x.w      a2, fs1
                  mulh         t6, gp, a5
                  lui          t5, 185488
                  fsqrt.s      fa7, fs2
                  fmax.s       fs1, ft6, ft4
                  slti         s1, zero, -120
                  fmv.w.x      ft4, s1
                  srli         ra, s4, 18
                  fcvt.wu.s    s2, fa0, rne
                  fmax.s       ft9, fs9, fs8
                  fsgnj.s      ft10, ft1, ft4
                  addi         s0, t5, -519
                  divu         s5, s9, s10
                  nop
                  slli         s6, s0, 2
                  sra          s8, s5, a0
                  fmul.s       fs8, fa3, fa7, rup
                  ori          a3, s10, 1794
                  xor          t1, a3, s8
                  or           s0, a7, a7
                  xori         a6, a5, -1298
                  fle.s        t3, fa0, fs6
                  srl          t5, a1, s10
                  sltiu        gp, s8, -944
                  slt          s11, s1, t3
                  fmin.s       fs3, fs2, fa2
                  fcvt.s.w     ft5, s5
                  xor          s1, s8, zero
                  fmin.s       ft1, fs5, fa7
                  fmv.x.w      t6, ft10
                  xor          ra, zero, t0
                  flt.s        t3, fs9, fs5
                  fmin.s       fs1, fs2, fs11
                  mulhsu       gp, s6, t1
                  ori          t3, s10, -987
                  srl          gp, a5, gp
                  andi         s0, s0, 1296
                  fdiv.s       fs6, ft8, ft8
                  fcvt.s.w     fa1, s5, rtz
                  fadd.s       fs8, ft8, ft10
                  fmv.x.w      a5, ft2
                  div          s1, s0, t2
                  fmax.s       fs9, ft2, fa1
                  fsgnjx.s     ft9, fs11, fs7
                  or           t0, t5, a7
                  divu         sp, t6, t0
                  srl          s7, gp, s6
                  rem          s6, t6, sp
                  divu         a0, s1, a4
                  fmv.x.w      ra, fa2
                  slt          s6, s4, s9
                  rem          a6, s1, a6
                  srai         a4, sp, 1
                  fsqrt.s      ft8, fa2
                  fdiv.s       fa1, ft10, ft2
                  fmin.s       fs4, fa2, fs2
                  mulhsu       a3, s10, sp
                  mulhu        t5, a3, a5
                  fadd.s       fa2, fa3, ft9, rup
                  srli         t6, s2, 6
                  sltiu        ra, t2, -1648
                  fcvt.w.s     s10, ft10, rne
                  fmin.s       ft9, ft6, ft8
                  or           s7, t0, sp
                  xor          sp, sp, t4
                  fmin.s       fs7, ft7, fs2
                  fcvt.w.s     t3, fa3, rtz
                  sltu         t3, zero, s5
                  fsgnjx.s     ft0, ft2, fa4
                  sub          s4, s2, t1
                  sll          gp, gp, s7
                  fle.s        zero, ft7, ft8
                  fsgnjx.s     fs7, fs1, fs8
                  xori         t5, a0, 1003
                  lui          t6, 447007
                  lui          t2, 999240
                  fsgnjn.s     ft1, fa6, fs8
                  fcvt.w.s     s7, fs8, rmm
                  fdiv.s       ft2, fs11, fa7
                  auipc        t3, 73557
                  sra          gp, s3, a7
                  flt.s        t3, fs8, fs10
                  lui          s9, 910183
                  mul          gp, gp, ra
                  fclass.s     s9, fa3
                  div          a5, s7, a1
                  fdiv.s       ft2, fs4, fs3
                  addi         t1, a1, -1630
                  fdiv.s       ft10, fs8, fa3, rmm
                  fcvt.s.wu    fa3, a6, rdn
                  sltiu        a4, a4, 1625
                  remu         s11, t0, t2
                  rem          a5, s0, s5
                  sltu         t1, t6, s1
                  fdiv.s       fs11, fa5, fs11
                  sub          ra, t0, s10
                  mulh         s9, a3, a3
                  fmv.x.w      gp, fa6
                  fsub.s       fs9, fa1, fa7
                  fdiv.s       fa6, fa0, fs9, rdn
                  remu         t5, a0, t4
                  fsgnjx.s     fs4, fs10, fs0
                  mulh         t1, a1, a1
                  addi         t0, ra, 558
                  fadd.s       fa3, ft5, ft10
                  fle.s        gp, fa2, ft2
                  fmin.s       fs7, fa5, fs3
                  sub          tp, s4, t5
                  slti         t4, s7, 1582
                  fcvt.wu.s    a0, fs0, rtz
                  or           a0, s10, zero
                  or           s10, s1, a3
                  and          a3, t0, sp
                  auipc        gp, 441455
                  slti         t3, a6, 368
                  or           s9, a4, a7
                  fsgnjn.s     fs11, fs1, fa7
                  fmv.x.w      t0, fa1
                  fsub.s       fs7, fs1, ft11, rmm
                  fcvt.s.w     ft10, a0
                  fcvt.w.s     s4, fs6
                  fcvt.s.w     ft7, s1, rdn
                  fclass.s     t4, fs4
                  divu         s8, s10, t2
                  mul          a5, s0, s9
                  sra          a2, a1, t5
                  fmax.s       fs5, fs2, fs1
                  fmv.x.w      s9, fs0
                  fmul.s       fs4, ft8, ft4
                  mulhu        zero, a7, a1
                  fcvt.wu.s    a2, fs7
                  div          a0, gp, s2
                  andi         s8, a6, -1439
                  mulhsu       t2, s11, t5
                  fsqrt.s      ft10, ft0
                  sltiu        s11, s8, 429
                  sll          zero, a1, t0
                  divu         gp, a2, s6
                  nop
                  fcvt.wu.s    t6, ft1, rtz
                  mulh         s8, s11, a6
                  remu         s10, s2, gp
                  mulhsu       gp, gp, s5
                  fmv.w.x      fa4, s7
                  addi         t3, a1, 636
                  slti         a2, a6, -1623
                  fdiv.s       fs10, ft1, fs10
                  fmin.s       fs0, fa7, fs0
                  xori         t4, s0, 1301
                  sub          gp, a7, s4
                  srai         s9, s5, 8
                  feq.s        a6, ft6, ft9
                  fcvt.s.w     fs5, s4
                  remu         t6, s3, ra
                  flt.s        s6, fa3, ft8
                  nop
                  xor          a4, tp, a6
                  sltiu        t5, s9, 421
                  add          s4, s0, s6
                  mulh         t1, s6, a5
                  mulhsu       s11, s3, a5
                  addi         a2, s10, -114
                  sll          ra, t1, t6
                  andi         t0, s4, -1884
                  slti         s8, a4, -1495
                  fdiv.s       ft3, fa7, ft6
                  fcvt.s.w     fa0, s9, rtz
                  fcvt.wu.s    s1, fs10, rmm
                  fadd.s       ft10, fa5, fa4, rne
                  fle.s        ra, ft3, fa3
                  divu         zero, s10, ra
                  mul          gp, a6, s3
                  fclass.s     zero, fa4
                  add          s5, zero, t6
                  srai         t5, ra, 1
                  mulhu        tp, tp, s0
                  divu         a5, a3, a6
                  mulh         a5, t0, s6
                  xori         s9, s6, -1691
                  fdiv.s       fs3, ft4, ft3, rmm
                  slli         s7, s1, 2
                  fsgnj.s      fa0, ft8, ft9
                  mulh         zero, s2, a0
                  srli         a6, s8, 23
                  fcvt.w.s     t5, fa6, rtz
                  slli         s2, a6, 11
                  srli         t5, ra, 28
                  mulhsu       tp, a7, s0
                  slli         s1, t4, 9
                  fcvt.w.s     s7, fs9
                  fcvt.s.w     ft4, s3, rtz
                  sltiu        t5, s4, 418
                  div          s10, sp, s9
                  ori          s5, t1, 21
                  fsgnj.s      ft5, fa2, ft9
                  sltu         a6, a1, zero
                  mulh         t3, t4, tp
                  fmul.s       ft11, fs5, fa1
                  remu         a2, t0, t6
                  fsqrt.s      fa7, fs1, rdn
                  mulh         s1, t2, a4
                  sltu         a5, s2, a4
                  fmv.x.w      t1, ft3
                  fcvt.w.s     gp, ft5, rne
                  fcvt.w.s     t5, ft6
                  add          s10, ra, a7
                  slt          t4, zero, t0
                  srl          t2, s5, s9
                  andi         s11, s5, -1968
                  mulhu        a3, a2, s4
                  auipc        sp, 824423
                  fsqrt.s      fa0, fa2
                  sltu         t0, a6, zero
                  rem          s2, zero, a4
                  fcvt.s.w     fs7, a2, rne
                  and          s9, s3, a7
                  srli         t5, a2, 3
                  rem          s0, gp, t6
                  rem          s8, s5, t0
                  sltu         a4, ra, a3
                  srli         t4, tp, 12
                  sltiu        a3, s2, -974
                  sll          a3, s11, s3
                  sltiu        s1, s9, 1180
                  slti         a5, a3, -158
                  sra          s9, s10, gp
                  fmv.x.w      s1, ft7
                  mulhu        s2, a1, a2
                  fsub.s       fa5, fs2, fs4
                  slli         t4, a0, 31
                  ori          s8, s0, -1506
                  sltu         t4, t3, gp
                  fsgnjn.s     fs4, fs5, fs11
                  lui          t0, 346115
                  fmax.s       fa2, fa0, fs2
                  srl          s0, tp, t5
                  xori         s9, s5, -629
                  fmin.s       ft10, ft6, fa3
                  sltu         t3, t4, a2
                  mulhsu       s6, s8, s3
                  nop
                  nop
                  andi         ra, s10, 1782
                  andi         t3, a2, 1971
                  remu         a2, a4, s4
                  fcvt.s.w     fa7, t4, rtz
                  nop
                  remu         a5, t1, a0
                  fdiv.s       fs10, ft1, fs5, rdn
                  add          s9, s6, ra
                  ori          a5, sp, -1475
                  fadd.s       fs10, fs3, ft10, rtz
                  mul          a6, s6, a0
                  sra          s10, a1, s9
                  fsgnj.s      fa4, fs1, ft9
                  ori          a2, zero, 1147
                  sltiu        t5, s1, -1630
                  sltu         s10, s11, a6
                  fsqrt.s      ft10, ft1, rup
                  slli         t4, s9, 13
                  mulhu        s7, s8, t3
                  div          t6, sp, s5
                  fsgnjn.s     fs8, fs6, fa2
                  mulhu        t6, a3, a7
                  fadd.s       fs4, fs8, fa3
                  add          t4, a5, t3
                  slti         t5, s11, -1509
                  srli         a2, t0, 10
                  fcvt.s.wu    fa5, t5
                  sltiu        zero, s9, 639
                  fdiv.s       ft11, fs9, ft6, rup
                  srli         zero, t1, 23
                  sra          s9, t0, a7
                  fsub.s       fs10, fa7, ft4
                  fcvt.s.w     fa1, a0, rup
                  srai         a2, ra, 31
                  srli         s5, a5, 10
                  or           t1, s2, tp
                  mulh         tp, a4, s1
                  sub          t4, s11, tp
                  sra          s6, a3, s10
                  fdiv.s       fs2, ft9, fs0
                  mul          tp, t4, zero
                  fcvt.s.wu    fa0, s11
                  mulhsu       t3, t1, t0
                  flt.s        gp, fs1, ft8
                  slti         s7, s3, 1496
                  fle.s        a3, ft6, fa7
                  mul          ra, s1, ra
                  srai         s2, a0, 12
                  nop
                  rem          t5, s4, s9
                  slli         gp, s2, 15
                  xor          a3, s5, zero
                  fcvt.wu.s    s6, fa2, rne
                  fsgnj.s      fs1, ft0, ft2
                  sub          ra, s6, a1
                  slli         s10, t0, 14
                  auipc        zero, 696187
                  divu         t3, t0, tp
                  fcvt.wu.s    t1, fa0, rup
                  fmv.w.x      fa1, s4
                  div          a6, a3, s8
                  div          t6, a2, s7
                  rem          s11, s4, t4
                  fdiv.s       ft8, fa5, ft2
                  srli         s6, t6, 5
                  fsgnj.s      fs3, ft11, fa7
                  srai         t1, a7, 18
                  fadd.s       fs4, fs3, fa6
                  srli         s6, a6, 14
                  fmin.s       fa7, ft11, fa2
                  xori         t0, s4, 1958
                  fsub.s       ft2, fa0, fa5, rne
                  lui          s11, 1038662
                  srl          t4, a6, gp
                  sub          ra, t2, s8
                  or           a5, s5, t4
                  sltiu        s4, s7, 1567
                  and          t6, s5, a5
                  fcvt.wu.s    s5, fs4, rtz
                  div          s7, s0, zero
                  fsgnj.s      ft10, ft11, fs8
                  fmv.x.w      t6, fs0
                  feq.s        s5, fs5, fs2
                  fsub.s       fs6, fs6, ft4, rne
                  xori         ra, gp, 1204
                  mulhu        t6, s11, sp
                  fcvt.wu.s    s4, fs11, rtz
                  fsub.s       fs5, fs11, ft1
                  fmv.w.x      fs7, a1
                  xor          s11, t4, a0
                  or           s0, s1, tp
                  sub          s6, zero, t5
                  sll          t4, s7, s7
                  remu         t2, s0, s1
                  nop
                  and          s10, s7, a0
                  sra          a0, s10, sp
                  sra          s11, s2, t4
                  sltiu        tp, s5, -1173
                  rem          a5, a5, s3
                  slti         t5, t3, -670
                  fcvt.s.w     fs3, a6
                  fsub.s       ft6, fs6, fa0, rdn
                  fsub.s       ft4, ft0, ft2
                  sltu         tp, t6, a0
                  fmul.s       fa7, fs9, ft8
                  srl          t3, a1, s9
                  fcvt.s.w     fs2, t2
                  srai         a0, t3, 16
                  sll          t0, sp, s10
                  srai         tp, t1, 19
                  mul          tp, a2, s0
                  divu         ra, a6, a6
                  fcvt.w.s     a2, fs10, rup
                  fsub.s       ft9, fs10, ft2, rmm
                  fmv.w.x      fa2, t3
                  srli         t6, zero, 4
                  srai         t4, s4, 6
                  srli         ra, s1, 22
                  fmax.s       ft5, ft9, fs6
                  fmul.s       fs0, ft2, ft9, rup
                  sll          a4, a7, s2
                  fdiv.s       ft4, fs5, ft6, rmm
                  slli         tp, s7, 3
                  rem          ra, t6, s11
                  fmin.s       ft3, ft6, fs11
                  fsgnjn.s     fs3, fs11, fs7
                  srl          t6, s5, s9
                  fsgnj.s      fs3, ft5, ft0
                  fle.s        t0, ft2, fa3
                  feq.s        s8, ft11, ft11
                  fcvt.s.w     fs7, s4
                  fsgnjn.s     fa0, fa4, ft3
                  fcvt.s.wu    fa0, s1
                  srl          a5, a6, s11
                  div          t6, tp, t6
                  fcvt.wu.s    a0, ft5, rup
                  fcvt.s.wu    fs10, s8, rdn
                  fmv.w.x      fa6, a3
                  andi         zero, a5, -484
                  lui          a4, 731456
                  fmul.s       ft11, ft11, ft11, rtz
                  fcvt.s.wu    fa5, ra, rtz
                  andi         sp, t1, 230
                  slti         s5, a3, -516
                  div          t1, a3, a5
                  fmv.w.x      ft6, tp
                  fsgnjn.s     fa2, fa7, ft9
                  slli         a3, a7, 26
                  xor          s0, s10, s7
                  or           zero, t0, s4
                  fle.s        s5, ft6, ft7
                  and          sp, s1, t0
                  fcvt.s.wu    fa0, s5
                  fcvt.w.s     s0, fs9, rtz
                  sltu         t4, a4, a2
                  xor          t3, s7, s8
                  rem          s5, s6, s9
                  flt.s        s4, ft3, ft8
                  sub          zero, t4, s9
                  fcvt.wu.s    tp, fs1, rdn
                  divu         t4, s2, s0
                  fcvt.w.s     s11, ft0, rup
                  fdiv.s       fs2, fs3, fa2
                  xor          sp, s0, s1
                  xori         s8, t1, -1662
                  slli         a5, t1, 18
                  fadd.s       fa1, fa7, ft5, rtz
                  sltu         zero, s0, s5
                  sltu         t1, tp, s11
                  nop
                  fcvt.wu.s    t5, fa4
                  fsqrt.s      fs8, fa4
                  sltiu        s0, s5, -508
                  srai         ra, s7, 18
                  mulhsu       a3, t2, t3
                  andi         t2, a2, 1418
                  div          t1, s1, s5
                  slti         a4, t5, -450
                  slti         s10, t1, -336
                  lui          a6, 487331
                  mul          t6, t2, tp
                  div          a6, t3, t1
                  fclass.s     s7, fs8
                  addi         a3, gp, -1639
                  fmv.x.w      t3, ft9
                  andi         a6, s1, -1765
                  slti         s11, a6, 1291
                  fmv.w.x      ft0, a5
                  srai         t5, sp, 23
                  fsgnjx.s     ft6, fa2, ft6
                  andi         s10, a1, 1952
                  remu         s11, a2, zero
                  div          a0, gp, zero
                  fsgnj.s      fa4, fs0, fa5
                  divu         t5, a7, zero
                  xor          a3, s8, s4
                  mul          a0, gp, s7
                  ori          s5, a4, 2011
                  fsgnjx.s     ft1, ft10, ft9
                  slt          a0, a2, a7
                  fmv.x.w      s1, fs2
                  slli         s11, a7, 23
                  fcvt.s.wu    ft8, a4, rmm
                  slt          a6, t3, t2
                  mulh         s6, s7, gp
                  fcvt.s.wu    ft0, s10
                  or           tp, t0, a4
                  fmin.s       fa3, fa4, ft3
                  feq.s        s7, ft5, fa2
                  sub          s9, a5, ra
                  xor          s11, t6, t3
                  divu         s6, s11, s1
                  fmin.s       fs9, ft5, fs4
                  fle.s        s10, ft1, fs4
                  fmul.s       fa0, fs7, fa3, rdn
                  srli         a2, s4, 28
                  srl          a5, a6, t5
                  fcvt.wu.s    a6, fa6, rdn
                  fdiv.s       fa6, fs0, fa3, rne
                  fmv.x.w      s0, ft3
                  fcvt.wu.s    a6, fs11
                  mulh         t2, gp, s9
                  fmv.w.x      fa2, s9
                  sltu         t3, s8, a4
                  sll          s1, s6, ra
                  ori          a2, a3, 950
                  fmax.s       fs2, fs6, ft7
                  mulh         t3, a7, t5
                  fsgnjx.s     fa1, fa1, fs1
                  fcvt.s.wu    fs5, s5
                  srli         s7, a6, 30
                  addi         s8, s7, 1759
                  fadd.s       fa6, fs4, fa2
                  divu         t1, t4, s1
                  fmul.s       ft4, ft9, fa7
                  fadd.s       fs8, ft11, fa3
                  fmax.s       fa3, ft5, ft0
                  remu         t4, s3, a1
                  divu         a2, s10, ra
                  fcvt.s.wu    fa5, s8, rtz
                  fmul.s       ft3, ft0, fs7
                  feq.s        tp, fs5, fa3
                  fsub.s       fs5, ft3, fs6, rmm
                  sltiu        s5, ra, -1839
                  fsgnjx.s     fs6, ft0, fs4
                  fdiv.s       fa5, ft3, ft10
                  fcvt.wu.s    s9, fs10
                  div          s4, s2, s0
                  fsgnj.s      fs6, fs8, fs9
                  feq.s        a3, ft7, fs2
                  fsqrt.s      ft4, fa6
                  fadd.s       fs4, fs9, fa5
                  divu         t3, s6, t5
                  rem          t6, s10, a4
                  remu         t1, t0, s2
                  xori         gp, s11, 1634
                  slli         t6, t2, 9
                  fmv.w.x      fa6, s7
                  flt.s        s9, ft4, fa1
                  fdiv.s       fs6, fa7, fs7, rmm
                  sub          tp, a3, s8
                  fsgnj.s      fa0, fs10, ft5
                  xori         s11, s9, -359
                  mulh         a2, a2, tp
                  srl          s1, s7, s11
                  feq.s        a4, ft5, fs11
                  auipc        s2, 487956
                  fmin.s       ft11, fs2, fs0
                  fmin.s       fa0, fs0, fs11
                  ori          t4, t2, 1465
                  andi         s0, s8, 1
                  fsqrt.s      ft9, ft9, rdn
                  srl          a3, s8, t3
                  fle.s        t6, fs6, fs11
                  andi         zero, s9, 1107
                  xor          a2, s3, zero
                  rem          t1, a5, t0
                  fcvt.s.wu    ft9, s8
                  slli         s11, a2, 3
                  flt.s        a5, fs7, ft8
                  sltu         a6, tp, a0
                  fmv.w.x      ft11, tp
                  sub          s8, t5, s2
                  mulh         a0, a3, a2
                  sub          s5, s0, a7
                  mul          a4, gp, a6
                  sra          s7, a3, a2
                  divu         s1, t6, t2
                  lui          t0, 391843
                  slti         sp, tp, -694
                  mulh         s10, a1, a3
                  and          s6, s6, a1
                  nop
                  sub          a4, s1, gp
                  div          t5, s1, a0
                  srli         s11, tp, 30
                  fle.s        s8, fa7, ft1
                  fmv.w.x      fa0, gp
                  sltu         a2, a7, ra
                  fsub.s       ft1, ft3, ft1, rne
                  fsgnj.s      ft0, fs5, fa1
                  mulhu        t6, t5, s4
                  sll          s4, s6, s11
                  sra          t0, t6, tp
                  sltiu        a0, t1, -1571
                  fclass.s     t6, ft6
                  remu         s1, a3, sp
                  fle.s        a5, ft2, ft2
                  srai         a3, tp, 15
                  feq.s        a6, fa1, ft1
                  mulhu        s0, t0, s4
                  sll          tp, s1, a2
                  mulh         a5, a3, a2
                  ori          a5, a1, -1612
                  fdiv.s       fs1, fs2, ft5
                  srai         s10, s0, 14
                  fmul.s       fa6, ft10, fa1
                  divu         s2, gp, t1
                  fdiv.s       fa3, ft11, ft0, rmm
                  fmax.s       ft5, fs0, ft2
                  sub          s1, a7, s9
                  add          s11, s0, s2
                  fdiv.s       fa3, ft10, ft5, rmm
                  slt          a4, s11, t5
                  feq.s        a4, fs0, fs8
                  srai         t4, s10, 3
                  and          s4, s0, gp
                  slt          s10, s4, s1
                  slt          s1, gp, gp
                  fmv.x.w      s2, ft3
                  sltu         t0, s11, t1
                  sll          tp, t0, s2
                  lui          s6, 808135
                  sra          t2, zero, zero
                  sll          t5, a0, s10
                  sltiu        t2, s6, 1979
                  srai         s0, s6, 20
                  xor          t5, zero, t6
                  fdiv.s       fa2, fs6, fs3
                  nop
                  srai         t2, t4, 28
                  fcvt.w.s     s4, ft1
                  fsub.s       ft7, fs2, fa6
                  slti         a5, t1, 1861
                  srai         s5, s2, 24
                  fsub.s       ft8, ft6, fs9, rne
                  sra          a4, t5, t6
                  fmin.s       fs10, ft3, fs2
                  slti         t4, s0, 2034
                  nop
                  mulh         a2, a7, s11
                  add          s11, s4, s1
                  fclass.s     a5, fs5
                  addi         t5, a7, 278
                  nop
                  remu         ra, s9, a1
                  fcvt.s.w     fs1, s11
                  mulhu        s0, ra, s6
                  srai         ra, s3, 9
                  mul          t0, t6, a5
                  fdiv.s       ft5, fs8, fs7, rdn
                  divu         t1, s6, s0
                  sltu         s5, s7, a1
                  mulh         s2, a1, a2
                  fadd.s       fs8, ft11, ft0
                  fmul.s       fs4, fa4, fa7
                  remu         s9, s4, s8
                  fsub.s       fs1, fs8, ft5
                  remu         gp, s6, t4
                  divu         s1, sp, a0
                  srli         s7, s7, 16
                  slli         s5, a3, 2
                  div          a3, a3, s7
                  slti         a4, a3, -929
                  addi         s2, s9, 1575
                  fcvt.s.wu    fa0, gp
                  lui          s8, 164081
                  fmin.s       fa5, fs11, ft8
                  xor          t4, s3, s10
                  addi         s8, s7, -566
                  srl          s8, s6, t0
                  xor          s7, ra, a1
                  auipc        t2, 711826
                  and          s11, a5, ra
                  slli         s9, s10, 23
                  fmin.s       ft5, ft2, fs2
                  andi         a6, gp, -1142
                  xori         a4, a7, 1000
                  sra          s0, zero, tp
                  fmv.x.w      a0, ft2
                  divu         a0, s2, s8
                  fle.s        a5, fa3, fa1
                  fsub.s       fs1, ft9, ft11, rup
                  fsub.s       ft6, fs0, fs3
                  slt          t1, a6, t3
                  fdiv.s       fa3, fs10, fs6
                  fsgnjn.s     fs9, fa7, ft4
                  fclass.s     gp, ft8
                  sra          s5, t1, s7
                  fcvt.w.s     s10, fs10
                  mulhu        t0, s10, gp
                  slli         a3, a5, 0
                  xor          s4, t1, s5
                  divu         s5, ra, tp
                  fsgnjx.s     ft9, fa5, ft10
                  andi         s5, t3, 1821
                  fsgnj.s      fs2, fs0, fs1
                  fmv.x.w      t2, fs4
                  srl          s4, t4, s8
                  fle.s        s7, fa2, ft5
                  xor          s10, a2, a7
                  mulhsu       a2, s0, a0
                  mulh         tp, a0, s8
                  srl          t3, a3, s6
                  mulhsu       ra, s1, s8
                  fdiv.s       fa4, ft0, ft5, rdn
                  fsqrt.s      fa0, fs2
                  slli         t3, sp, 5
                  fclass.s     t4, ft3
                  fsqrt.s      ft10, fs5, rne
                  auipc        s4, 639848
                  divu         a2, t2, s7
                  sltu         tp, t4, t5
                  xori         a2, s0, -1044
                  fmax.s       fs9, ft4, ft8
                  sltu         s0, s11, a4
                  slt          s5, s0, s3
                  srli         sp, a1, 0
                  xor          zero, s5, t2
                  slt          t0, zero, s4
                  fsqrt.s      fa1, fs7, rdn
                  sll          zero, a6, t0
                  lui          s10, 279813
                  fclass.s     t3, ft2
                  fcvt.w.s     s5, fa4
                  slli         s0, s5, 3
                  mulhsu       a0, a7, ra
                  andi         a3, s7, -1332
                  rem          s11, t6, a0
                  lui          s10, 113157
                  fsqrt.s      ft7, ft1, rtz
                  fmax.s       ft5, fa4, fs5
                  div          t2, s2, t1
                  flt.s        t6, fa5, fs4
                  auipc        a6, 442790
                  fmv.w.x      fa4, s4
                  lui          a4, 194312
                  slti         a0, a4, 1867
                  ori          s1, s4, -1092
                  fsub.s       ft7, ft7, ft8, rne
                  fadd.s       ft3, fa1, ft11, rtz
                  fsgnj.s      ft9, fa3, fs10
                  divu         zero, t6, s4
                  sltiu        sp, t6, 598
                  auipc        a2, 406615
                  fclass.s     s4, fs5
                  and          a6, s8, t6
                  fadd.s       fa5, fs2, ft1, rdn
                  fcvt.wu.s    a3, fs3, rtz
                  nop
                  fsub.s       fs1, fs3, fs0
                  srai         zero, s7, 7
                  andi         a6, s8, -568
                  fclass.s     s8, fa5
                  fcvt.w.s     tp, fs4, rup
                  mulhsu       a2, a3, t1
                  fsgnjn.s     fa3, ft3, fs9
                  sltiu        t5, s8, 518
                  sub          t1, s8, t2
                  fcvt.w.s     a2, ft9
                  slt          t3, s3, a1
                  rem          zero, sp, ra
                  sub          t5, s4, ra
                  fmin.s       fa5, fs5, fs2
                  fle.s        gp, ft9, ft1
                  fmax.s       fa1, fa4, fa3
                  fclass.s     tp, fs2
                  fsqrt.s      ft1, fa7
                  andi         s0, s7, -1917
                  addi         s4, s2, 1713
                  ori          s10, a7, -1417
                  fsub.s       ft5, ft4, ft0
                  mul          zero, s9, a6
                  fcvt.s.w     fs8, s10
                  sll          ra, s7, s10
                  flt.s        s11, ft9, ft6
                  div          a4, s10, a3
                  remu         ra, a5, gp
                  fmin.s       ft1, fs9, ft6
                  fadd.s       fs2, ft1, fa7
                  andi         t0, s3, 51
                  remu         s1, s10, s10
                  sra          gp, t4, s8
                  mulhsu       a3, a3, sp
                  sltiu        s8, sp, 32
                  fmul.s       ft10, ft3, fs5, rmm
                  slt          s11, t4, t0
                  slti         a3, zero, -1889
                  and          tp, s1, t5
                  fcvt.s.w     fa0, zero
                  fmul.s       ft7, fs10, fa2, rne
                  fadd.s       ft6, ft8, fa7
                  sltu         t6, a0, t2
                  auipc        t2, 318925
                  mulhu        t5, tp, s1
                  fsgnjn.s     fs0, fs8, fa7
                  fsqrt.s      fs1, ft5
                  rem          t3, t3, ra
                  and          s10, s0, t4
                  sltu         s9, a6, t0
                  mulhsu       s11, a5, t4
                  xor          a6, zero, t2
                  mulh         s9, s3, zero
                  sub          sp, gp, s2
                  sub          a0, t0, a1
                  addi         s7, s7, -1930
                  sll          t6, s3, t5
                  flt.s        s0, fa3, ft10
                  or           t6, s6, s7
                  fmax.s       ft11, ft1, ft0
                  fsgnjx.s     fs3, fa1, fs9
                  sub          a0, s11, t1
                  auipc        t5, 648387
                  fmax.s       fs1, fa1, fs6
                  fsgnj.s      ft0, fa4, fa3
                  nop
                  slt          s11, a3, s7
                  flt.s        gp, fs9, fa4
                  slti         s6, a5, 1357
                  divu         s0, t4, a6
                  mulhsu       gp, a1, s3
                  fmv.x.w      a5, fs5
                  mulhsu       a3, t0, t5
                  fsgnjx.s     fa5, ft5, fs1
                  fdiv.s       ft7, fs0, fa5, rne
                  srai         a2, a6, 1
                  remu         t3, gp, s0
                  or           t6, gp, a6
                  fsgnj.s      ft10, ft3, ft5
                  divu         s2, s5, gp
                  mulh         s7, s11, s9
                  lui          a6, 364145
                  rem          t6, t0, t4
                  mul          t2, a2, a7
                  sra          t3, a0, ra
                  ori          s10, gp, -904
                  sltiu        s9, s6, 630
                  sltiu        t6, s6, -1461
                  xori         gp, gp, 402
                  mulhsu       t3, a3, s3
                  fcvt.wu.s    s0, ft2
                  and          t6, sp, a5
                  fsub.s       fa0, fs5, fa0, rne
                  fsgnjn.s     fs10, fa5, ft11
                  feq.s        t6, fs3, fs1
                  sub          gp, ra, s5
                  div          t3, s8, a1
                  andi         ra, s8, -473
                  xor          gp, s4, s9
                  ori          t1, s3, -38
                  addi         s5, sp, -738
                  mulh         a5, t2, a5
                  fmv.x.w      s10, ft4
                  nop
                  lui          zero, 877716
                  fcvt.s.wu    ft7, s2, rdn
                  fmv.x.w      t6, fa4
                  fdiv.s       ft9, fs4, ft0
                  nop
                  andi         s8, a2, 522
                  feq.s        gp, fs11, ft10
                  xori         s2, s0, -31
                  divu         s1, a5, s1
                  sltiu        s4, s0, 2027
                  fcvt.wu.s    a0, fs7, rne
                  nop
                  nop
                  fsgnjn.s     fs1, ft5, fa6
                  fmv.w.x      fs1, s1
                  divu         s6, s1, s7
                  sub          s10, s3, t2
                  div          s7, ra, t4
                  feq.s        ra, ft3, ft4
                  fmv.w.x      fs1, a4
                  fmin.s       fs6, fa1, fs2
                  ori          t3, t1, -91
                  sra          ra, s4, s2
                  srli         s6, t0, 8
                  sltu         ra, gp, a1
                  addi         s8, a4, 276
                  srai         s9, a2, 9
                  and          a2, s3, a7
                  add          s1, s3, sp
                  fsgnj.s      fs10, fa3, ft9
                  xor          zero, t1, t2
                  fadd.s       ft6, fs9, ft2
                  sra          ra, gp, t3
                  srai         t3, s5, 30
                  sltiu        s9, s6, -1595
                  sub          s10, s11, s8
                  andi         s10, s8, -1989
                  fcvt.wu.s    a4, ft9
                  nop
                  nop
                  mulhsu       s7, t2, t5
                  xori         t2, s8, 600
                  flt.s        tp, fs10, fs11
                  fclass.s     zero, fa4
                  fsqrt.s      fa6, fs4, rtz
                  xor          t0, t4, s0
                  srli         t5, sp, 26
                  xor          s9, t2, t2
                  fmin.s       fa7, fs4, fa3
                  fsgnj.s      fs3, fs0, fa6
                  remu         a2, a5, s6
                  xori         a3, t5, 360
                  slti         a2, sp, -187
                  fcvt.w.s     s6, fa4
                  fdiv.s       fa3, fs8, fa1
                  fsgnjx.s     fa4, ft8, fa6
                  fclass.s     s8, fa4
                  mulhu        t3, s1, s10
                  fmin.s       fa7, ft2, fa2
                  fmin.s       fs2, ft8, fa5
                  fcvt.wu.s    ra, fa0, rup
                  add          s10, a0, sp
                  fsgnjx.s     fs5, ft7, ft4
                  fsqrt.s      ft2, fs2, rup
                  and          s1, tp, s1
                  auipc        a6, 596236
                  fcvt.s.wu    ft6, s1, rup
                  mulh         s9, t0, s0
                  addi         t5, t4, 579
                  fsgnj.s      ft6, fa4, ft0
                  fmv.w.x      fs6, s8
                  fsgnjn.s     ft1, ft3, ft9
                  mulhu        t2, zero, s7
                  fle.s        gp, fa6, fs1
                  mulhu        s9, s4, tp
                  fcvt.wu.s    ra, fa1
                  or           s11, s1, s7
                  fclass.s     s5, ft6
                  mulh         s9, sp, s4
                  lui          t2, 584442
                  flt.s        s5, ft5, fs1
                  srli         a0, t1, 29
                  mulhu        t2, gp, s11
                  srl          s2, a1, t2
                  fcvt.w.s     t0, ft3, rne
                  fcvt.s.wu    ft9, gp, rtz
                  slti         zero, a2, 1482
                  slt          s5, s1, s7
                  fsgnjx.s     fs10, ft11, ft11
                  remu         t1, t6, t0
                  andi         s10, s10, 373
                  fmin.s       fa1, fa3, ft11
                  add          s1, s2, t6
                  mulhsu       s11, a3, gp
                  andi         sp, a2, -1175
                  fle.s        s8, ft1, ft8
                  fdiv.s       fs9, fa2, fs1, rup
                  slt          s8, a3, t3
                  fcvt.w.s     tp, ft7, rmm
                  mul          s11, a3, gp
                  slt          s2, a6, t4
                  remu         s4, t4, tp
                  sub          a4, s7, zero
                  fmv.w.x      fa5, t1
                  sub          a5, t0, s10
                  feq.s        s9, fa5, ft9
                  srl          s1, tp, t1
                  fmax.s       ft1, fa0, ft2
                  add          a0, t4, s1
                  fle.s        t2, ft7, ft4
                  sltiu        t0, s7, -1942
                  mulhu        t0, t1, t3
                  sll          gp, a7, a0
                  slti         a4, a6, 1610
                  mul          ra, s9, a6
                  fcvt.s.wu    ft9, s3, rtz
                  fcvt.s.w     fa6, s4, rup
                  add          s0, a4, gp
                  fdiv.s       fa7, ft2, fs4
                  fmv.x.w      s1, ft3
                  fsgnj.s      fa3, ft5, ft0
                  ori          s7, a5, 1564
                  div          s6, ra, a3
                  auipc        t4, 778692
                  fmin.s       fs2, fs11, fa4
                  mul          t0, t2, a6
                  div          a4, s5, s1
                  ori          a2, s11, -1452
                  auipc        t6, 691375
                  fmv.x.w      s6, ft1
                  divu         s1, s4, t0
                  andi         t4, tp, 12
                  fle.s        t1, ft9, ft4
                  sltu         s4, a7, s8
                  addi         t1, s5, -1838
                  fsgnjn.s     fa7, ft8, fs11
                  srl          s8, s5, t3
                  sub          t1, s2, s2
                  andi         s1, a4, -1098
                  rem          s6, s3, s3
                  xor          s5, gp, t5
                  fdiv.s       fa7, fa5, ft11
                  srl          t0, t3, s9
                  divu         t6, t0, a5
                  fmax.s       fs6, fs2, fa1
                  mul          s6, a3, a4
                  fcvt.s.wu    fa2, t3, rdn
                  mulhsu       sp, s1, s7
                  slli         t0, s10, 29
                  rem          a6, s10, a0
                  addi         a3, a7, 1106
                  sltu         t6, sp, a7
                  srai         a5, s1, 21
                  xor          gp, s10, s2
                  slti         s1, a1, -496
                  ori          a6, s10, 5
                  fclass.s     ra, ft4
                  fclass.s     s9, fs6
                  srai         s0, s3, 13
                  slli         t1, s6, 5
                  fcvt.wu.s    gp, ft10, rdn
                  and          a2, ra, s10
                  or           s10, s6, t5
                  addi         s2, s9, 1579
                  div          a2, t3, a4
                  sltu         s8, tp, t3
                  rem          t6, ra, gp
                  fcvt.wu.s    zero, ft10
                  mul          s6, a3, a3
                  ori          tp, s3, 124
                  xori         t1, t5, 267
                  fmv.w.x      ft0, a6
                  sll          s6, t2, t3
                  srl          s11, sp, s10
                  fsgnjx.s     fa6, fs3, ft1
                  mulh         t4, s1, s1
                  fcvt.s.wu    fs9, s8, rne
                  fdiv.s       fa2, fs11, ft6
                  nop
                  auipc        s5, 566405
                  sltiu        t4, s9, 112
                  add          t5, t2, a6
                  slt          s8, a7, ra
                  fadd.s       ft7, fs6, ft1
                  fclass.s     a6, fa6
                  fcvt.s.w     fa2, t5, rmm
                  divu         a0, s6, gp
                  srai         s10, s5, 0
                  xor          s2, s0, s4
                  fmax.s       fs1, fs11, fs7
                  or           sp, s4, s1
                  sltu         s1, a4, s6
                  mulhu        s11, tp, s4
                  slt          a0, s6, sp
                  fsgnjx.s     fa5, fs3, ft10
                  fsub.s       ft0, fs7, ft8
                  fcvt.s.w     fa6, s8
                  fcvt.wu.s    s6, ft2, rne
                  srli         t3, a6, 20
                  feq.s        a4, fa5, fs2
                  addi         tp, s11, -1877
                  fsgnjn.s     ft9, ft3, fs7
                  divu         t1, s5, s4
                  sll          s10, a0, a3
                  mul          tp, a3, t3
                  addi         t6, tp, -1327
                  fcvt.s.w     fa0, a2, rup
                  srli         s0, s10, 30
                  srli         a3, ra, 14
                  div          t1, s2, a1
                  div          gp, t0, s3
                  fsgnjx.s     fs0, fs0, fs4
                  xor          a6, s7, a5
                  sra          sp, t1, sp
                  fcvt.w.s     s10, fs8, rne
                  slli         t4, sp, 16
                  remu         a2, s0, a7
                  xor          ra, t2, s3
                  fsqrt.s      fs7, ft9
                  feq.s        a6, ft5, fa2
                  mul          s7, s8, s5
                  srli         t3, a2, 31
                  fadd.s       ft9, fs7, fs11, rdn
                  fsub.s       fs1, fa0, ft7, rdn
                  srai         s7, s0, 1
                  fadd.s       fs0, fa1, fs11
                  div          s2, a2, s7
                  srl          s0, t5, a4
                  andi         t4, s11, -1750
                  ori          t6, t4, 1802
                  fmv.w.x      fs8, t0
                  fcvt.s.wu    ft0, a1
                  fmax.s       fa4, ft11, fs10
                  fsgnjx.s     fa7, fa4, ft7
                  ori          s11, s7, 1431
                  andi         s8, s9, -1013
                  fle.s        s1, ft2, ft8
                  fmax.s       ft6, ft9, fs7
                  fmax.s       fs7, fa6, fs0
                  mulh         gp, a7, t1
                  slt          tp, t5, t2
                  nop
                  fcvt.wu.s    a5, ft10, rtz
                  rem          s10, s10, a5
                  fmv.x.w      s7, fs7
                  or           a4, s10, t6
                  feq.s        a3, fs11, ft2
                  mulh         a3, a1, a7
                  auipc        t6, 142751
                  fcvt.s.w     fs7, a5
                  lui          gp, 37689
                  ori          zero, ra, -965
                  fsgnjx.s     ft3, ft6, ft1
                  mulhsu       t1, s0, a4
                  fmv.w.x      ft4, s2
                  div          s7, s9, t0
                  nop
                  addi         a0, s9, -1104
                  ori          tp, s1, -1024
                  fmv.x.w      a5, fs9
                  fmul.s       ft7, fs2, ft10
                  and          s2, ra, t5
                  fmin.s       fs8, fs11, fs4
                  sltu         t4, t3, t6
                  fsqrt.s      fs3, fa1, rtz
                  srl          t4, t3, a4
                  fadd.s       ft10, fa2, fs7, rup
                  fclass.s     zero, fs7
                  fsgnj.s      ft3, ft11, ft4
                  fdiv.s       fs6, fa1, fs7
                  srai         s2, s7, 10
                  fdiv.s       fa2, ft6, ft7
                  fmv.x.w      zero, fa2
                  mulhu        a5, sp, a7
                  remu         s5, t2, a5
                  srli         zero, t5, 28
                  fadd.s       fs4, ft5, fa4, rne
                  addi         gp, sp, 1350
                  fmax.s       fs9, fs11, fa2
                  fcvt.w.s     s2, ft9
                  fcvt.s.w     fs8, s6
                  fcvt.w.s     gp, ft10
                  slti         t1, s9, -1817
                  fle.s        s1, fa6, ft9
                  fcvt.wu.s    sp, fa3
                  fcvt.w.s     a5, fs4, rup
                  mulh         t1, t2, a4
                  addi         ra, s11, 248
                  add          s6, a4, tp
                  nop
                  rem          s1, s2, s7
                  lui          t1, 7214
                  fsgnj.s      ft11, ft8, fs3
                  addi         s2, a0, -1431
                  rem          t3, t4, t0
                  slti         a0, s5, -159
                  slli         s4, a7, 17
                  mulhsu       t5, t4, a7
                  sltu         t1, a6, sp
                  fsgnjn.s     ft6, ft10, fa1
                  auipc        gp, 6914
                  fsgnjx.s     ft10, fa3, fs1
                  fmv.w.x      fa3, s1
                  feq.s        s5, ft4, fs11
                  fmv.x.w      t4, fa2
                  addi         t4, t5, -251
                  fsgnjn.s     ft4, fa2, fs8
                  fadd.s       fs2, fs8, fa5, rne
                  sub          a0, a3, a7
                  add          t2, tp, s8
                  xori         s7, t0, -989
                  add          t4, s7, t3
                  fsgnj.s      fa5, fs2, fs11
                  fcvt.s.wu    fa7, a5, rup
                  sll          s9, sp, a5
                  div          s8, tp, a5
                  sltu         a6, a4, t0
                  fsub.s       fa4, fs2, fs10
                  srl          s6, zero, a5
                  div          t1, ra, a6
                  fcvt.w.s     t5, ft10
                  remu         zero, a7, tp
                  srai         t1, zero, 5
                  fadd.s       ft7, fs2, fs4
                  fsgnjx.s     ft5, fa0, fs1
                  nop
                  fclass.s     a3, ft7
                  fmv.x.w      s9, ft0
                  fsgnjx.s     fs10, fs4, fs9
                  fadd.s       fs11, fa1, ft9, rne
                  xor          a2, t0, s10
                  or           t4, s10, zero
                  mul          sp, a0, s3
                  mulh         tp, t5, t4
                  remu         zero, t4, s10
                  srai         s10, a4, 11
                  andi         s1, a0, 1753
                  nop
                  fsub.s       fs6, fa2, fs11, rne
                  srli         s7, a7, 12
                  fdiv.s       fa1, fa0, ft11, rdn
                  fclass.s     s6, ft9
                  slt          a2, gp, t5
                  fcvt.s.w     fs4, s6
                  srl          s0, a5, s11
                  divu         s8, s9, a5
                  fmv.w.x      fa7, gp
                  ori          s1, t2, -30
                  flt.s        zero, fs5, ft4
                  and          t0, a1, t4
                  xor          ra, t3, zero
                  srl          s4, s0, a5
                  fcvt.w.s     s2, ft3, rtz
                  fsub.s       ft5, fs1, fa4, rtz
                  flt.s        t3, fs3, fs10
                  mulhu        s4, t6, a0
                  fclass.s     t3, ft5
                  feq.s        t5, fs6, ft6
                  or           t2, s1, s4
                  lui          s6, 736073
                  xor          t0, t3, a1
                  slt          s6, t0, t4
                  fclass.s     tp, ft7
                  sltu         t5, s3, s4
                  slli         a5, t1, 26
                  sltiu        t0, a5, 808
                  sltiu        t2, a5, -650
                  fmv.x.w      a5, fs0
                  feq.s        s7, fs0, fs10
                  mulhu        a4, a5, s1
                  fmul.s       ft0, fa7, fa0
                  fclass.s     zero, fa6
                  fmv.x.w      s4, ft0
                  srli         a2, t4, 6
                  fsgnj.s      ft9, fs10, fs5
                  fmul.s       ft0, fs0, fs8
                  auipc        t5, 100228
                  fcvt.wu.s    t6, ft5, rup
                  sll          s6, s1, a5
                  fsgnjn.s     fs11, ft1, fs11
                  rem          a5, s4, a5
                  or           s8, ra, t6
                  fle.s        s9, ft9, fs3
                  fle.s        s11, ft4, fs2
                  mul          t6, s0, s7
                  fcvt.wu.s    sp, fa4
                  addi         sp, s2, 934
                  mulhsu       s4, t0, s9
                  ori          tp, a4, 1541
                  mul          s1, s0, t3
                  fmv.x.w      t4, fs4
                  fcvt.w.s     s7, ft3, rtz
                  mulh         s10, gp, a6
                  fmul.s       fs2, fa7, fs7, rmm
                  sub          zero, s11, s10
                  flt.s        s9, fs10, fs11
                  fcvt.w.s     t6, fs3
                  fmv.x.w      a3, ft7
                  nop
                  sub          s10, s1, s5
                  mulhu        a4, t2, ra
                  fmul.s       fs11, ft6, ft7
                  mulhsu       sp, gp, t1
                  add          s9, t0, s11
                  nop
                  and          a0, t3, a0
                  fmul.s       fs5, fa0, ft9
                  xor          t3, t0, s1
                  fsub.s       ft7, ft5, ft9, rne
                  srli         t4, t1, 8
                  sub          s0, t6, tp
                  sltu         s9, a0, tp
                  sltu         t1, s6, sp
                  andi         a5, s10, -2011
                  mulh         s6, t2, tp
                  lui          ra, 987858
                  div          s6, t5, s5
                  fsgnjn.s     fs8, fa2, ft3
                  and          t1, s4, s8
                  fsgnjx.s     ft3, fa3, fs6
                  addi         t0, s6, -661
                  mulhu        tp, s1, a1
                  slti         s9, a1, -1289
                  slti         t5, s8, -1101
                  ori          a2, a2, -1852
                  fmul.s       fs8, ft2, fa4, rmm
                  fcvt.w.s     gp, ft8
                  fcvt.wu.s    s10, ft5
                  slt          gp, a7, zero
                  srli         s0, s9, 9
                  rem          s2, s2, ra
                  sll          s8, s5, s4
                  add          a5, s4, s2
                  fmv.x.w      a3, ft11
                  slti         s6, s6, 1787
                  and          sp, s9, s6
                  fdiv.s       ft4, fs2, ft6, rup
                  fcvt.wu.s    t0, fa6
                  ori          s7, t1, -401
                  rem          a0, s3, gp
                  fcvt.w.s     s4, ft5, rmm
                  lui          s8, 55916
                  fcvt.wu.s    s11, fs0
                  sub          gp, gp, ra
                  lui          gp, 298907
                  fcvt.wu.s    t0, ft8, rdn
                  flt.s        s11, ft1, fs0
                  fle.s        t4, ft8, fa4
                  flt.s        s0, ft0, fs9
                  fcvt.s.w     fa5, a7, rmm
                  addi         t3, s9, -1294
                  mul          ra, s3, a2
                  fsgnjn.s     fs6, fs8, ft4
                  fsub.s       ft3, fa3, fa6, rtz
                  slt          s7, s0, ra
                  fsgnjn.s     ft0, fa2, ft8
                  fdiv.s       fs11, ft5, ft2, rup
                  fclass.s     t4, fa0
                  xor          zero, t2, a3
                  fmv.w.x      ft3, t2
                  ori          t4, t1, 664
                  and          s8, t5, a6
                  rem          ra, s6, s11
                  div          s4, s3, a3
                  fmul.s       ft7, ft3, fs6, rne
                  mulhsu       a3, zero, t4
                  slti         s7, a5, -632
                  fsqrt.s      fs7, fa4, rmm
                  fsqrt.s      ft0, fs5
                  rem          t1, s10, a6
                  fcvt.s.wu    ft2, s2, rdn
                  slt          t4, s11, s3
                  srli         a2, s8, 31
                  lui          s11, 986653
                  sra          s1, t3, s5
                  fsgnjx.s     fs4, fa4, fa5
                  remu         sp, ra, s0
                  sra          s5, s9, t6
                  div          a2, a2, s5
                  fsgnj.s      fa3, fa3, fa3
                  slti         a0, t1, 1216
                  fclass.s     a6, fa4
                  sra          s7, s10, tp
                  sra          s9, s7, s9
                  fsgnjn.s     fa3, fs5, fs3
                  fsqrt.s      fs6, ft11, rtz
                  ori          t3, s3, -73
                  fsgnj.s      ft7, ft0, fa6
                  fcvt.s.wu    ft8, a0
                  fle.s        s2, ft2, ft6
                  ori          s0, a6, -1372
                  slt          s10, s1, t0
                  fsgnj.s      fs0, fa5, fa3
                  mul          a4, s9, s10
                  addi         t2, s9, 1587
                  srl          t3, s10, t1
                  andi         a5, t4, -155
                  add          t3, t3, s7
                  nop
                  fdiv.s       ft10, fs5, fa6
                  fmin.s       ft8, fa3, fa4
                  fcvt.w.s     t5, ft7
                  auipc        s0, 308609
                  sub          a6, t6, tp
                  fmin.s       ft6, fa3, ft10
                  sra          zero, s8, gp
                  srai         t5, ra, 16
                  flt.s        s11, ft11, fs2
                  fsgnj.s      fa6, ft2, fa3
                  fcvt.s.wu    ft8, a5
                  fmin.s       fa3, fs8, ft6
                  feq.s        a0, fa3, fs8
                  fclass.s     s1, fs6
                  srl          a4, a5, s7
                  and          t2, a7, t2
                  andi         tp, a6, -469
                  andi         a3, s9, -1634
                  fclass.s     s5, fs7
                  fsub.s       ft3, fa3, fs3, rup
                  fcvt.w.s     t3, fs6
                  srai         s5, a1, 23
                  fmin.s       ft2, fa5, fa0
                  sltiu        a6, t2, 332
                  remu         s2, s5, a7
                  fmul.s       ft11, ft2, fs9
                  fclass.s     a2, ft6
                  srai         t5, s7, 25
                  lui          s8, 245576
                  sll          t0, a0, s6
                  add          s2, a0, a7
                  fsqrt.s      fs1, ft10
                  and          s10, s11, a4
                  mulh         s0, s4, t5
                  fsgnjx.s     fs9, fs9, fs5
                  fsgnjx.s     fa0, fs4, fa6
                  sra          t5, s5, s1
                  andi         s6, gp, 260
                  fadd.s       fs8, fs4, ft0
                  fsgnjn.s     ft1, fa3, fs1
                  divu         t0, s10, t6
                  slli         s2, a5, 3
                  mulh         sp, t4, zero
                  xor          a3, sp, t1
                  flt.s        s2, ft6, ft5
                  divu         s9, sp, s8
                  addi         a4, a5, 132
                  addi         gp, a4, -1593
                  srli         a0, t2, 10
                  fsgnj.s      ft5, ft4, ft9
                  fsqrt.s      fa5, fs5, rdn
                  sub          s0, gp, s6
                  nop
                  mul          t2, a5, a0
                  srli         a3, t2, 6
                  sra          s5, ra, sp
                  nop
                  fle.s        s4, fs1, ft2
                  feq.s        zero, fa3, fs1
                  mul          t3, sp, t4
                  fcvt.wu.s    t5, fa6
                  sltiu        a3, t2, -70
                  sltu         s7, t6, s3
                  add          a6, a1, a0
                  fadd.s       ft4, fa1, fs2
                  nop
                  sll          a0, t0, a3
                  slti         s6, a0, 1330
                  fmul.s       ft0, fa3, fs10, rup
                  srli         tp, t5, 23
                  div          t6, s1, a7
                  ori          a5, a2, -895
                  srl          s7, s8, t4
                  sll          s8, t1, a5
                  ori          tp, s9, 1113
                  sra          s7, gp, tp
                  sra          gp, tp, t1
                  sra          s7, ra, a0
                  sub          s11, s6, zero
                  ori          a5, a4, -67
                  and          t4, s4, s3
                  div          s7, a6, sp
                  fsgnjx.s     fa5, ft6, fs2
                  fcvt.s.w     fs11, t0, rmm
                  fsgnj.s      fs2, fs1, ft7
                  fsgnjx.s     fs10, fa3, ft10
                  fsgnjx.s     fa0, fs4, ft1
                  sub          s1, s1, s1
                  fsqrt.s      ft4, fa4, rne
                  fmin.s       ft0, fa0, fs3
                  xor          sp, s5, zero
                  fcvt.s.wu    fs10, s5
                  rem          a4, t1, t2
                  auipc        sp, 773838
                  xor          a6, s11, t5
                  and          ra, t1, s8
                  div          t5, t0, t2
                  and          t1, a6, a3
                  slt          t1, t4, s7
                  fmv.w.x      ft6, gp
                  auipc        t1, 31105
                  slli         t0, t4, 5
                  fcvt.s.wu    fs8, t6, rmm
                  div          s9, zero, t4
                  fadd.s       fa4, fs9, ft7
                  fsqrt.s      ft7, fa4, rtz
                  fmv.w.x      fs2, s10
                  addi         s6, t3, -579
                  fsqrt.s      fa6, ft2, rup
                  srl          s8, a2, a5
                  ori          gp, t4, 1634
                  fsub.s       fa0, fa0, ft9
                  srli         sp, t1, 21
                  mulhsu       a0, t6, s1
                  ori          a0, t0, -1481
                  fcvt.wu.s    a6, fa0
                  or           a6, s6, a0
                  and          s2, t1, t6
                  auipc        tp, 377214
                  mulhsu       t6, s11, s4
                  xor          s6, t3, s11
                  fadd.s       ft11, fs4, ft4, rdn
                  fsgnjx.s     fs4, fs2, ft1
                  divu         t3, t3, a6
                  sll          t3, t2, t4
                  fcvt.w.s     s8, ft3
                  srai         zero, a7, 7
                  fsgnjn.s     ft11, fs0, fs5
                  sll          s9, t2, t0
                  fle.s        a5, ft1, ft5
                  fadd.s       ft4, fs9, fa4
                  addi         a3, a7, -1411
                  fadd.s       fs5, ft6, fa1
                  mulh         s5, a6, t5
                  mul          sp, s0, s0
                  srai         s5, a2, 20
                  add          sp, s0, s3
                  auipc        s1, 293386
                  fmul.s       ft3, ft2, fs11
                  slti         a5, a2, 1728
                  slli         tp, t1, 12
                  sub          s6, t1, tp
                  srl          a0, t1, tp
                  fmax.s       fa5, ft6, fs2
                  slt          s9, t2, s11
                  srl          a6, s8, s6
                  andi         sp, a5, 1357
                  mulhsu       t0, a4, a7
                  fadd.s       ft11, fs11, ft2
                  fcvt.wu.s    a2, fs0
                  sltiu        t2, a5, -766
                  rem          ra, a2, s8
                  mulh         a2, t3, zero
                  fmax.s       fs9, ft10, fs9
                  srai         gp, t2, 12
                  rem          s0, s10, t0
                  flt.s        sp, fa7, fs0
                  fadd.s       fs1, ft8, fs10
                  or           a5, ra, a3
                  fmin.s       fa3, fs0, ft3
                  fsub.s       ft5, ft6, fa1, rdn
                  addi         a5, t6, 183
                  fle.s        s9, fa4, ft9
                  slti         s0, t3, 1880
                  slti         a0, a3, -415
                  lui          s11, 477891
                  mulhsu       s1, s3, s8
                  divu         a2, s2, a3
                  sltiu        a5, s11, -714
                  sltiu        a4, t2, -1443
                  remu         a5, s3, t1
                  srl          tp, ra, tp
                  lui          a0, 522867
                  fsgnjn.s     fs4, fa6, fs11
                  fle.s        s0, ft11, fs9
                  and          sp, s2, t1
                  remu         s4, s1, s0
                  srl          a0, s0, t2
                  slli         s7, t0, 10
                  sub          t3, s4, s8
                  fmv.w.x      fs1, t3
                  fmv.x.w      a5, fa3
                  nop
                  fmv.w.x      ft10, a6
                  fsgnjn.s     fs6, fs4, fa5
                  srl          s2, t3, t1
                  slt          t2, s3, a1
                  and          s2, s10, a7
                  mul          gp, t1, zero
                  feq.s        gp, ft0, fa3
                  and          a0, s6, t5
                  sltiu        t6, a4, -884
                  auipc        t3, 547869
                  flt.s        tp, fs6, fa5
                  or           a0, a3, s8
                  fcvt.wu.s    s2, fs0, rdn
                  fmax.s       fs9, fs6, ft10
                  fmv.x.w      t3, fs11
                  auipc        s2, 395640
                  and          s8, ra, a7
                  or           a0, tp, s3
                  remu         a2, s9, s1
                  sub          t0, s11, s10
                  fcvt.wu.s    a3, ft5, rmm
                  feq.s        s1, ft11, fa4
                  slt          s1, a3, a7
                  lui          ra, 501071
                  fsgnjx.s     fa7, fa4, fs5
                  fsgnjx.s     fs1, fs10, fs2
                  sltiu        zero, s11, 1062
                  fmax.s       fs0, ft10, fs3
                  fadd.s       ft8, ft3, ft1
                  divu         a4, s10, a3
                  lui          t6, 615449
                  mulhsu       t6, a5, s9
                  srli         s5, tp, 17
                  slt          t1, a7, sp
                  fclass.s     t2, fs8
                  flt.s        s0, fa2, fa3
                  mulh         s1, s4, s0
                  fmin.s       fa2, fs1, fa2
                  fsgnjn.s     ft8, fa6, fa1
                  flt.s        gp, ft7, fs1
                  srl          tp, t0, tp
                  fcvt.wu.s    a3, ft7, rup
                  divu         t2, t5, sp
                  fmin.s       ft3, fs6, fs9
                  xor          s0, s4, a3
                  and          s9, s1, t3
                  fsgnj.s      ft5, fs4, fs11
                  slti         s2, s3, -747
                  sub          sp, tp, s8
                  slli         s9, t3, 12
                  flt.s        s2, fs3, fs5
                  fcvt.s.w     fs5, gp, rmm
                  mulh         t1, s6, sp
                  feq.s        t1, fa3, ft5
                  remu         s4, a2, s6
                  fadd.s       ft9, ft6, ft0
                  divu         s7, tp, ra
                  and          s7, s5, a7
                  slli         gp, s9, 25
                  fsgnj.s      ft6, fa2, ft0
                  sub          s6, s9, s0
                  rem          a2, t1, t2
                  slt          a5, s4, s6
                  lui          ra, 79673
                  sll          sp, a2, a2
                  div          t4, t1, t3
                  slti         tp, s11, 489
                  add          t3, s6, s11
                  div          s9, s5, a3
                  slli         a4, t5, 14
                  addi         s8, a2, 1570
                  fsqrt.s      fa3, fa7, rup
                  remu         s9, a4, a2
                  fcvt.w.s     t1, ft2, rdn
                  xor          a5, s6, a3
                  xori         t3, sp, 1474
                  mulhu        gp, s3, s2
                  sltu         s5, a3, gp
                  fmul.s       fs8, ft6, fs7, rtz
                  xor          a3, a4, s0
                  fsgnjx.s     fs6, ft4, ft6
                  srl          a0, s6, s4
                  fle.s        t3, ft2, fa7
                  or           ra, gp, s4
                  and          t0, t4, gp
                  lui          a4, 1035352
                  slli         t1, s6, 21
                  sltu         s8, s8, a4
                  fsqrt.s      fs8, fs1, rup
                  andi         ra, t6, -1919
                  fmax.s       ft1, fa0, fs9
                  add          a0, s6, sp
                  flt.s        s11, ft5, fa5
                  fmul.s       fs0, fs10, ft0, rdn
                  fmax.s       ft10, ft3, ft7
                  andi         s2, t1, -1472
                  fsgnj.s      ft10, fa1, ft4
                  slti         a0, s6, -1979
                  sra          s8, t0, a5
                  mulhu        t2, zero, sp
                  and          t0, sp, s10
                  and          s4, a4, t3
                  addi         a6, a7, 24
                  fsqrt.s      fs7, ft2
                  ori          s4, s8, 263
                  fmv.w.x      fs0, tp
                  mul          sp, s10, t3
                  mul          ra, a7, s8
                  flt.s        a5, fs6, fs1
                  fadd.s       fs3, fs8, fa4, rup
                  srl          s9, a4, s8
                  mul          t4, s3, t0
                  srl          a3, a7, a6
                  add          s4, t4, t5
                  fcvt.w.s     s1, fs1, rtz
                  sub          s2, s4, s4
                  fsub.s       fs1, fs0, fs3
                  ori          t1, s11, 582
                  fmul.s       fa5, ft11, fa4, rtz
                  ori          s10, t6, -1534
                  sub          gp, s2, tp
                  fsgnjn.s     fs5, ft9, fs9
                  srai         ra, t1, 11
                  fsgnj.s      fs8, fs5, fs6
                  mul          a5, zero, s4
                  auipc        zero, 39990
                  fmin.s       fs11, fs10, fs10
                  fmax.s       fs2, ft0, ft10
                  sub          s11, a1, t2
                  sll          a0, a5, s1
                  or           a3, a4, sp
                  fsqrt.s      fa2, ft3, rtz
                  mulh         s11, a2, s8
                  andi         t4, s1, 628
                  mulhu        s6, t4, gp
                  sltu         t3, zero, s11
                  fcvt.s.w     ft6, s1
                  divu         s1, a4, s2
                  fdiv.s       fa1, fs1, fs0
                  mulhu        zero, t6, gp
                  mulh         t4, s0, s11
                  fsqrt.s      fs8, ft3, rdn
                  feq.s        s9, fa0, fa1
                  mulh         a5, s11, s3
                  and          zero, a2, tp
                  addi         s6, t3, -1810
                  sll          a5, s7, a2
                  fmv.x.w      t4, fs6
                  fcvt.s.wu    ft8, s9, rup
                  div          a6, t1, s11
                  fsgnjx.s     fs4, fs0, ft7
                  fmv.x.w      gp, ft11
                  xori         t2, gp, -182
                  fle.s        a2, fs3, ft8
                  fadd.s       ft10, fs4, fa0, rup
                  mulh         a3, tp, s2
                  mul          a2, t4, s3
                  mul          t1, ra, s11
                  fdiv.s       fa5, fs0, ft5
                  sra          t3, t4, t3
                  fsgnjn.s     ft11, ft0, ft10
                  or           s0, a1, s11
                  auipc        gp, 290120
                  srai         t2, t3, 11
                  div          a6, zero, t6
                  divu         zero, a2, a4
                  sra          t6, s0, s4
                  fmin.s       ft8, ft11, fs7
                  fmv.w.x      ft10, a7
                  srl          a6, a5, a1
                  fcvt.s.w     fs3, tp, rmm
                  mul          s6, s7, tp
                  fcvt.s.wu    fa6, s1, rne
                  or           s9, zero, zero
                  sltiu        a6, s3, 1133
                  sll          a0, t0, t6
                  sltiu        s2, a5, 1141
                  mul          s8, s7, s11
                  rem          s7, t3, s7
                  fclass.s     sp, fa1
                  fadd.s       ft0, fs2, fa5
                  srai         sp, t2, 8
                  fsgnjn.s     fa3, fs10, ft3
                  and          s9, t2, s1
                  mulhu        a3, a7, a4
                  add          t3, s9, s2
                  fmv.x.w      s8, fa5
                  fmax.s       ft5, fa5, ft11
                  andi         a2, t1, -1484
                  divu         s5, a1, s4
                  ori          t1, t4, 1378
                  and          s5, s3, a1
                  div          sp, t5, s0
                  addi         a6, a4, 925
                  div          s6, t6, s6
                  fadd.s       fs11, fa3, ft6, rdn
                  ori          sp, t2, 1894
                  flt.s        gp, fa4, fs1
                  fmul.s       ft9, fa3, ft4, rmm
                  andi         s5, s8, -1756
                  nop
                  slt          ra, sp, s9
                  sltu         s0, s3, s0
                  fmv.w.x      fs0, sp
                  sll          sp, gp, s8
                  nop
                  fcvt.s.w     ft3, t0, rne
                  fcvt.s.w     ft7, a4, rmm
                  addi         s2, s11, 965
                  fsgnj.s      ft8, ft0, ft11
                  srai         s0, s3, 0
                  ori          s1, t3, 1438
                  fmax.s       fs0, fs9, ft9
                  fcvt.wu.s    t6, ft0, rtz
                  fclass.s     tp, fs3
                  fsub.s       ft8, fa3, fa2
                  fadd.s       fs2, ft0, ft10
                  auipc        s1, 376489
                  fsub.s       ft7, fs3, fa3
                  mulhu        a0, s9, s8
                  fsgnj.s      ft2, fa7, fs5
                  fmax.s       fa5, fs11, fs2
                  fsgnjx.s     fa5, fa5, fa3
                  div          s11, s1, a5
                  sll          s6, s10, s7
                  xori         a3, a7, 632
                  fdiv.s       fa0, fs5, fs9, rdn
                  nop
                  fmul.s       fs5, fs10, fs4
                  fcvt.w.s     a0, fa3
                  nop
                  divu         a0, a0, t6
                  srl          gp, s0, t2
                  mulhsu       t3, gp, t5
                  fsgnjn.s     ft5, fa1, fa3
                  fcvt.s.wu    ft3, a2, rdn
                  fmv.w.x      fa7, s11
                  fsgnj.s      fs7, fs5, fa1
                  fsub.s       fs1, ft1, fa4
                  fcvt.wu.s    sp, fa0
                  mulhu        s6, s8, t3
                  fmul.s       fs6, ft3, ft10
                  xor          t0, s5, t0
                  fcvt.w.s     t0, ft11, rtz
                  addi         s2, t5, -130
                  addi         t5, a7, -1694
                  mul          gp, t5, tp
                  fsgnjx.s     ft0, fs1, fa5
                  mulhu        t5, s7, zero
                  fle.s        a4, fa6, ft10
                  fcvt.s.w     ft5, s6
                  add          a0, s10, t2
                  andi         tp, s0, -719
                  slli         a4, s8, 15
                  or           s6, t4, sp
                  andi         s4, a2, 1713
                  and          a4, s5, s4
                  fcvt.s.wu    ft5, s8
                  fadd.s       ft11, fs0, ft7
                  addi         tp, s9, 559
                  lui          s4, 207758
                  fadd.s       fa2, fs0, ft4, rdn
                  fmul.s       ft8, ft11, fa1, rdn
                  ori          s5, t6, 38
                  fdiv.s       fs1, fs2, ft2, rup
                  sltu         s8, a2, a1
                  add          tp, a4, t3
                  fdiv.s       fa0, fs10, ft4
                  mul          tp, tp, s7
                  fmax.s       ft1, fs4, ft8
                  or           a3, sp, a4
                  feq.s        t0, fs1, fs9
                  slti         a4, t3, -761
                  auipc        s8, 525337
                  mulh         gp, a4, s5
                  sltiu        s4, s2, -883
                  fsgnj.s      fs0, fa4, fa1
                  flt.s        s5, ft2, ft11
                  sll          s2, a5, tp
                  fsub.s       ft6, fs2, ft10
                  srl          s1, t3, s11
                  andi         t5, a4, -339
                  fcvt.s.w     fs8, a5, rmm
                  srai         s1, zero, 29
                  slt          a2, sp, s5
                  fmv.x.w      s4, fs11
                  sra          a4, t1, zero
                  mulh         s11, s9, s2
                  fle.s        s11, fa4, ft1
                  fcvt.w.s     gp, ft7, rup
                  fdiv.s       ft6, fa3, fa6, rne
                  fcvt.s.w     fs2, t6, rtz
                  fclass.s     t5, ft10
                  fdiv.s       ft11, fa7, ft3, rup
                  mulhsu       a5, t6, a5
                  mulhsu       a4, a7, s3
                  sll          ra, a6, a2
                  remu         gp, a0, a7
                  lui          s7, 583461
                  fsub.s       fs7, fs3, ft6
                  xori         t1, a1, -1431
                  remu         ra, t2, s0
                  srl          a2, s9, a5
                  nop
                  fmv.x.w      s9, fs7
                  auipc        a2, 663737
                  fadd.s       fs7, ft10, fa0, rdn
                  fcvt.w.s     t2, ft6
                  fsub.s       ft8, ft11, fa0
                  remu         s1, s10, t1
                  or           t5, zero, s4
                  or           t3, a7, tp
                  xori         t2, a4, -1235
                  slt          t1, t5, a3
                  fsgnj.s      fs8, ft9, fa0
                  slti         t3, t5, 1081
                  fsgnjx.s     fa2, ft5, fa0
                  slli         s10, s3, 14
                  remu         t4, a7, s11
                  fclass.s     s6, ft3
                  fcvt.s.wu    fs4, gp
                  flt.s        s5, fa6, fs9
                  sltu         zero, a1, s7
                  fmul.s       fs11, fs10, fs2
                  remu         s10, a5, s11
                  fmin.s       ft10, fs0, fa7
                  sra          a5, s6, a5
                  fsgnjn.s     ft8, fs8, fa6
                  mul          t1, s9, s5
                  fmv.x.w      ra, ft6
                  ori          ra, t3, 1834
                  fadd.s       fs7, fs3, fa6, rtz
                  fclass.s     s7, fs11
                  slt          t5, a5, t3
                  or           t6, a3, s9
                  fadd.s       fa3, fa6, fs9, rmm
                  slti         s7, a0, -721
                  xori         s0, s6, 1661
                  sltiu        s2, s4, -271
                  xori         a4, s7, 1554
                  slti         s5, a1, 511
                  fmax.s       fa1, ft11, ft8
                  fsgnjx.s     ft6, ft9, ft7
                  flt.s        t5, fa6, fa0
                  fcvt.s.wu    fa2, s10, rmm
                  mulhu        gp, s4, a4
                  fsqrt.s      fs2, ft0
                  xori         t3, t6, 1619
                  xori         a5, zero, 375
                  fsgnjn.s     fa2, fa5, ft6
                  mulhsu       zero, t2, s5
                  slt          t3, s8, s4
                  flt.s        t0, fs3, fs1
                  remu         a3, a3, s5
                  fmv.w.x      ft2, zero
                  auipc        gp, 222763
                  xori         t6, s10, -1402
                  fclass.s     s4, ft5
                  lui          a6, 696233
                  fle.s        s9, ft7, ft0
                  mulhu        a6, t2, s6
                  feq.s        t3, ft3, fs4
                  fclass.s     a5, fs0
                  srl          s11, s4, t6
                  fclass.s     s10, fs10
                  sra          t4, s3, a0
                  fmv.x.w      s8, fa4
                  auipc        s11, 688041
                  andi         t0, s7, -887
                  slti         t3, a1, 1331
                  fmax.s       fa7, fs7, fa7
                  lui          t3, 928027
                  addi         s6, a0, -34
                  and          zero, s4, t3
                  fcvt.s.wu    fa2, s0, rmm
                  slti         t6, s3, -294
                  and          ra, sp, s10
                  fadd.s       fa6, ft0, fa6
                  nop
                  fdiv.s       ft9, ft10, ft8, rtz
                  fcvt.s.w     ft9, tp, rup
                  mul          t0, s1, s0
                  slli         a5, t0, 26
                  or           a2, t0, s11
                  mulhu        sp, s4, a2
                  srai         s2, s10, 5
                  fsub.s       ft8, fa4, fa4
                  fmul.s       fs2, fa6, fa6
                  remu         s7, s3, s11
                  or           zero, s11, s5
                  slt          s7, tp, a4
                  fmv.x.w      s6, fs1
                  fsgnjn.s     fs2, fs5, ft8
                  fcvt.w.s     s4, fa1, rtz
                  andi         a0, s8, -1459
                  lui          t4, 612988
                  xori         s0, s5, -1799
                  div          sp, s4, t0
                  sltu         a4, t4, t6
                  fclass.s     t4, fs8
                  fsgnjx.s     ft4, fa6, fa7
                  fsub.s       ft2, ft1, ft0, rup
                  fsub.s       fs4, ft3, fs8
                  xor          s9, s7, s1
                  addi         t0, a6, 123
                  auipc        t3, 251671
                  slti         a5, s2, -1819
                  sltiu        s0, a5, 173
                  fdiv.s       fs4, fs4, fs3
                  slti         t4, a6, 1623
                  fmin.s       fs11, ft6, fa2
                  sub          s7, a5, a4
                  mulh         t2, s0, s9
                  sub          s6, a3, t6
                  slti         s10, s8, -1767
                  addi         s0, a4, -450
                  andi         t3, t2, 1728
                  fmax.s       ft5, fs3, fs5
                  mulhsu       a6, t2, a4
                  remu         a0, tp, t1
                  fle.s        s1, fa4, fa6
                  sra          s9, t1, s4
                  flt.s        a0, fs1, fs11
                  fdiv.s       ft4, fs4, fs6
                  fmv.w.x      ft0, a3
                  or           t4, t1, t0
                  fcvt.w.s     s8, fs6
                  fsgnjn.s     fs10, fa2, fs11
                  fsgnjn.s     fa1, fa7, fa4
                  fmin.s       fa2, fs11, fa4
                  fsgnj.s      fa5, fs8, fa3
                  feq.s        zero, fs6, ft11
                  srli         t1, zero, 4
                  fsub.s       fa2, ft4, fs0
                  remu         s1, s1, t0
                  fle.s        s7, ft4, fs6
                  divu         s5, a4, s1
                  xori         s7, gp, 755
                  divu         s1, a4, s7
                  fmax.s       fs7, fa0, ft9
                  fsgnj.s      fs10, fa2, fs5
                  sll          gp, t0, ra
                  fcvt.s.wu    fs1, s9, rmm
                  fsgnjn.s     fs6, fa3, fs11
                  feq.s        a2, ft8, fa1
                  add          t3, s10, s5
                  remu         t0, s3, s8
                  ori          t6, s5, 1439
                  fsub.s       fs5, fa4, ft6, rmm
                  mul          t1, s7, s11
                  slti         t0, s9, 427
                  mulhu        ra, sp, s11
                  fsqrt.s      ft10, fa1
                  andi         s1, a0, -1622
                  fcvt.wu.s    t3, fs4, rtz
                  fsub.s       fs11, fs4, fa6, rne
                  fle.s        a4, fs5, ft11
                  and          t6, s0, s2
                  divu         s6, a2, a0
                  fmv.x.w      t3, ft0
                  div          ra, a4, s5
                  remu         t1, t6, s3
                  fcvt.wu.s    tp, fs0
                  fsgnjx.s     ft8, ft5, ft9
                  fmul.s       fa2, ft11, fa6, rdn
                  divu         sp, s4, s7
                  sub          s7, s9, t3
                  fmul.s       ft11, ft11, ft8, rup
                  slli         t6, s6, 23
                  flt.s        t0, ft4, fs4
                  sltu         gp, a0, a7
                  feq.s        s0, fs7, fa4
                  fdiv.s       ft0, fa7, ft1
                  nop
                  fsub.s       fs4, fs8, ft1, rmm
                  remu         gp, t6, t5
                  sltu         a2, t3, s4
                  fmv.x.w      s0, fa3
                  fmv.x.w      s0, fs6
                  sra          tp, a7, s9
                  sra          s6, s8, s2
                  fdiv.s       fs11, fs4, fs3, rtz
                  fsgnjn.s     fs2, fa6, fs0
                  sltu         s2, t2, s7
                  fsub.s       ft2, fs0, fs4
                  feq.s        tp, fs7, ft10
                  sltiu        a6, zero, 366
                  andi         t5, t6, -971
                  slti         a6, t6, 1920
                  fmul.s       fa5, fa3, fs5
                  nop
                  fdiv.s       ft7, fa6, fa0
                  srli         t6, a6, 15
                  fle.s        s9, fs8, ft5
                  or           t0, s8, s5
                  fle.s        s5, fs1, ft8
                  sll          s9, t5, s7
                  fcvt.s.wu    ft0, s7
                  mulh         s0, t3, t2
                  srai         gp, a4, 29
                  fcvt.s.w     fa5, a2, rmm
                  fmax.s       ft7, fa3, fa3
                  divu         zero, sp, s8
                  slli         s6, ra, 25
                  fsqrt.s      fs8, fa6
                  divu         t1, t2, t1
                  add          a0, gp, t0
                  mulhu        a6, s7, s3
                  fcvt.s.w     fs3, s2
                  remu         a0, s0, s4
                  fsqrt.s      fs2, ft6, rne
                  div          t0, s1, t1
                  andi         s6, t4, 572
                  mul          a4, zero, t5
                  fsub.s       fs10, ft6, fa0
                  and          t5, tp, s1
                  fmin.s       ft5, fa5, fs9
                  fsgnj.s      fs9, ft9, ft11
                  sltiu        a0, t3, 942
                  or           t1, zero, a5
                  fmv.w.x      ft10, s0
                  mulh         t2, ra, s2
                  fmin.s       fs10, fa6, fs4
                  slt          a3, t3, s3
                  sub          a0, s8, s10
                  sra          t6, a6, s6
                  andi         a3, sp, 1550
                  fcvt.s.w     ft8, s10, rtz
                  fcvt.s.wu    ft11, ra, rdn
                  mul          s1, tp, t3
                  slti         t6, a6, -737
                  xor          zero, s2, tp
                  flt.s        s6, fs1, fa4
                  fcvt.w.s     a3, fa4
                  fle.s        s8, fs5, ft9
                  sltu         s2, t0, s0
                  sll          a5, a6, s4
                  fcvt.s.w     fs2, s9, rmm
                  fmul.s       ft10, fs7, ft3, rdn
                  rem          t6, a7, s7
                  fdiv.s       ft8, ft9, fs8, rtz
                  and          ra, s10, a0
                  andi         a0, a5, -317
                  slli         t3, a0, 9
                  mulhu        s10, a0, s4
                  rem          a6, s7, a7
                  fclass.s     s11, fs7
                  fsqrt.s      ft9, fa7
                  sub          t4, t1, t4
                  fle.s        s7, fs5, fa1
                  sltu         sp, s0, a2
                  addi         s0, s5, -1124
                  srai         t4, a6, 12
                  xori         a4, a3, 1893
                  fmv.w.x      fs1, ra
                  fcvt.w.s     t2, ft9
                  fmul.s       fs4, fa3, fa7
                  fdiv.s       fs6, fa2, fa6, rmm
                  fsub.s       fa0, fa2, ft11
                  sltu         gp, s8, s1
                  xor          a2, a6, s10
                  mulhu        a6, a5, ra
                  addi         s2, t1, -1177
                  slti         a5, s8, -1470
                  srai         tp, s7, 1
                  rem          a6, t6, s5
                  fsub.s       ft2, ft7, fs9
                  sltu         tp, sp, t0
                  mulhsu       s11, a2, a3
                  add          a6, t3, s2
                  sltu         s0, a5, s8
                  mulh         s1, t2, s8
                  mulh         s6, t1, s3
                  slti         t6, a4, 1503
                  div          t1, s0, s4
                  fsqrt.s      ft9, fs3, rmm
                  xori         gp, s10, -1471
                  nop
                  srai         a3, a7, 5
                  sltu         s4, s1, t0
                  srai         a5, a3, 21
                  fsub.s       fs2, fa4, fa7
                  fsqrt.s      ft9, fa2
                  fcvt.s.w     fs0, a4
                  fcvt.w.s     t1, fa6, rup
                  andi         t1, s5, -1821
                  srai         t1, a4, 2
                  fcvt.s.w     fs2, s11
                  fadd.s       fs10, ft0, fa1, rmm
                  mul          t0, a6, t0
                  sll          zero, a2, s9
                  divu         a4, t3, a0
                  ori          zero, s5, 1806
                  fsgnj.s      fa1, fs4, fs1
                  sltu         t5, a4, s2
                  mul          a0, s0, a1
                  auipc        ra, 322062
                  sub          gp, sp, t6
                  sra          tp, t1, s11
                  fmv.x.w      a5, fs0
                  fmin.s       fs11, ft6, ft1
                  fmul.s       ft11, fs0, fs0, rdn
                  fcvt.wu.s    s4, fs6, rne
                  nop
                  fdiv.s       fs1, ft2, fs8, rdn
                  fcvt.wu.s    t2, ft11, rne
                  fmv.x.w      ra, fs7
                  xori         s1, t2, 1509
                  xori         t2, a7, 1204
                  nop
                  fmul.s       fs7, fa6, ft5
                  add          t4, ra, a7
                  sltu         s10, s4, a4
                  slli         s6, a2, 13
                  fcvt.s.w     fa0, a4
                  or           s0, s0, ra
                  fsub.s       fa4, fs1, fs4
                  fcvt.s.w     fs0, sp, rdn
                  srl          tp, sp, a1
                  addi         s4, s8, -1068
                  slli         sp, t5, 2
                  slt          s11, sp, zero
                  ori          a2, t6, 1175
                  fcvt.s.w     ft6, s11
                  srli         t6, a4, 20
                  sltu         zero, a0, s1
                  fsgnjx.s     ft0, fa3, fa0
                  or           zero, t5, a4
                  rem          t5, a0, s3
                  sra          s9, s5, s3
                  fcvt.wu.s    a0, fs5, rup
                  mul          t2, s3, s1
                  srli         gp, s5, 28
                  feq.s        t5, ft3, fs2
                  mul          t6, a0, t1
                  slt          t6, t2, t3
                  xor          t4, zero, t5
                  slti         sp, a6, -1594
                  div          s8, a5, zero
                  auipc        tp, 710450
                  div          tp, a7, a7
                  fdiv.s       ft11, fs11, fs3
                  nop
                  sll          tp, t1, a4
                  fadd.s       ft5, ft1, ft6, rup
                  andi         t4, gp, 1122
                  rem          s8, s2, s10
                  fsub.s       ft11, fs11, fs1, rtz
                  fcvt.s.w     fa6, s2
                  fdiv.s       fa7, ft3, fs3
                  lui          s4, 435041
                  fcvt.wu.s    s1, fs4
                  sub          t4, a6, zero
                  fcvt.w.s     a4, ft11
                  or           a6, s11, a3
                  fcvt.s.wu    fa4, a5
                  mulhu        s0, a1, zero
                  fsgnj.s      fs6, fs9, ft8
                  fsgnjn.s     fa2, fa4, fs9
                  fcvt.w.s     s6, fs7, rmm
                  srli         gp, t0, 19
                  feq.s        zero, ft7, fs3
                  fsgnjx.s     ft2, fa3, fs3
                  fclass.s     a2, ft1
                  and          s11, ra, s7
                  nop
                  mulhsu       a5, tp, a4
                  nop
                  fsgnjx.s     fs1, fs2, fs9
                  mulhu        a0, a1, t3
                  lui          s7, 477995
                  lui          s9, 471416
                  fmv.x.w      t1, fs6
                  auipc        s0, 71337
                  fcvt.s.wu    fa1, gp, rne
                  fmin.s       ft6, fa0, fs8
                  srl          ra, t4, t3
                  fsub.s       ft6, fs5, fs11
                  sll          a2, s2, t2
                  fsgnjx.s     fs8, ft7, ft7
                  divu         sp, a4, s6
                  ori          t2, t4, 504
                  fmv.x.w      s10, fs3
                  slt          t3, s9, a3
                  fcvt.s.w     fa7, s1, rup
                  fsgnjx.s     fs4, fa7, ft11
                  srli         sp, t6, 14
                  fsgnjn.s     fs11, fa0, ft10
                  fmax.s       fs10, ft9, ft6
                  mul          t1, a1, s7
                  feq.s        t1, fs10, fa0
                  div          t3, s1, a1
                  sltu         t5, t2, a1
                  addi         t6, s4, -1710
                  sltiu        a2, ra, 796
                  fsub.s       fa0, fa0, ft6, rne
                  sltiu        tp, sp, -1315
                  mulhsu       sp, s10, s0
                  fadd.s       fa0, fa5, fs3
                  slt          t6, a2, ra
                  fcvt.s.w     ft6, s2, rdn
                  mulhu        tp, a1, a1
                  and          a6, a3, a0
                  slti         s8, a2, -925
                  fdiv.s       fa2, ft7, fs3, rne
                  fmv.x.w      a4, ft6
                  xor          s7, s8, a0
                  ori          gp, t4, -1836
                  div          t3, s0, t4
                  fsgnjx.s     ft6, fa3, ft5
                  addi         s1, zero, -1194
                  fsgnj.s      fa1, fs6, ft0
                  fclass.s     t5, ft6
                  xori         s7, a7, 1182
                  fmv.w.x      fs2, t2
                  sltu         a3, s5, tp
                  fmv.w.x      fa2, s0
                  rem          a6, a5, a2
                  srli         t3, tp, 1
                  andi         a6, tp, 813
                  auipc        a5, 952447
                  remu         sp, ra, s7
                  lui          a4, 555966
                  fcvt.w.s     s4, fs4, rne
                  fcvt.s.wu    fs11, s1, rmm
                  flt.s        a5, ft4, ft11
                  ori          a2, a6, 402
                  fadd.s       fs5, ft10, fs2
                  flt.s        a6, fs10, ft8
                  srai         t1, zero, 9
                  sub          a6, s11, t4
                  fmv.w.x      fs0, a3
                  rem          s1, s4, sp
                  sub          ra, a5, a0
                  div          sp, a0, s10
                  fcvt.wu.s    t4, fa0
                  ori          s6, t1, -1113
                  fsgnjn.s     fs0, fa4, ft4
                  fmax.s       fs10, fa6, ft0
                  fsgnj.s      ft10, ft9, fs8
                  fcvt.wu.s    s4, fs7
                  fcvt.wu.s    t0, fa5
                  feq.s        s0, fs10, ft6
                  fcvt.s.w     fs3, s10, rne
                  fadd.s       ft11, fs4, fs0, rmm
                  auipc        s0, 500556
                  sltiu        s1, a7, -906
                  fcvt.w.s     gp, fs4
                  sltu         s5, t0, t5
                  feq.s        a0, ft9, ft9
                  slt          s4, s9, gp
                  slli         s7, a5, 25
                  nop
                  feq.s        sp, fa6, fs8
                  srli         s5, t2, 21
                  srli         ra, s1, 4
                  srli         t4, s7, 8
                  rem          t4, t5, t1
                  srli         s4, a2, 14
                  fmin.s       fs9, ft5, fa0
                  remu         t1, s4, s1
                  lui          s4, 378654
                  fmin.s       fa5, fs10, fa5
                  mulhsu       t4, s4, a3
                  fsgnj.s      fs6, fs8, ft5
                  sub          t2, s11, t0
                  fclass.s     a2, ft3
                  andi         s9, t0, -1089
                  fclass.s     t1, fs3
                  fclass.s     ra, ft9
                  lui          t0, 26732
                  flt.s        t4, fs0, ft8
                  srai         a4, gp, 29
                  fsub.s       fs1, ft0, fa2
                  auipc        s8, 438431
                  lui          s6, 46800
                  nop
                  fmin.s       fa1, fa7, fa2
                  ori          s10, a6, -539
                  fclass.s     sp, fs11
                  srai         s2, s5, 24
                  fdiv.s       fa6, ft5, fs6
                  add          s8, a4, t4
                  fmin.s       ft8, fa0, fs8
                  ori          a5, t5, -481
                  mulh         gp, t4, t6
                  fle.s        a3, fs3, fa3
                  srli         s4, s5, 17
                  fdiv.s       ft2, fs2, fa5, rup
                  srli         t0, tp, 30
                  srai         s10, a2, 10
                  div          a4, a2, s3
                  fcvt.s.wu    fa7, a4
                  fdiv.s       fs10, fs7, fa5
                  flt.s        zero, fa4, ft7
                  feq.s        t3, fs1, ft9
                  fdiv.s       fs7, ft10, fa2, rup
                  fdiv.s       fa5, fa3, fa5
                  mulhu        gp, tp, s5
                  xori         ra, s3, 128
                  fmin.s       fs8, fs4, ft10
                  fclass.s     a3, ft3
                  feq.s        s7, fs10, ft8
                  remu         s9, gp, a6
                  mulhu        a3, t1, t6
                  fsgnjn.s     ft10, ft6, ft9
                  fdiv.s       fa5, fs0, fa1
                  fcvt.w.s     ra, ft0, rmm
                  fclass.s     zero, fa4
                  fcvt.wu.s    a4, fs3
                  andi         s4, a3, -1230
                  fdiv.s       fs1, fs3, fs11
                  lui          t5, 442578
                  srl          ra, a0, t6
                  fsgnj.s      fa2, fa0, fs3
                  srli         zero, a3, 9
                  fclass.s     s8, fs0
                  sltiu        t1, s2, -975
                  add          gp, a2, a2
                  fsgnjx.s     ft9, ft9, ft8
                  fcvt.s.w     fa5, t2, rtz
                  mul          t1, t1, s5
                  ori          s8, a0, 1872
                  fcvt.wu.s    s9, ft7
                  fdiv.s       fs4, ft10, fa6, rne
                  fsgnjn.s     fa7, ft8, ft10
                  fmv.w.x      fa2, a7
                  mulhsu       t0, sp, a5
                  and          s7, a6, s10
                  lui          s6, 964107
                  slli         s10, s2, 26
                  fmin.s       ft10, fs0, fa2
                  slti         ra, s8, 983
                  mulhu        zero, t1, s5
                  fcvt.s.w     fs7, a2
                  fmax.s       ft4, fs3, fa2
                  sub          s6, s7, a5
                  xor          ra, zero, s4
                  mulh         s4, a5, ra
                  sub          s5, s2, a4
                  slti         a2, s9, -1420
                  feq.s        sp, ft10, fs0
                  slti         s8, s8, -1803
                  xori         s10, t4, 298
                  flt.s        s11, fa3, fa1
                  fsub.s       ft7, fa0, ft5, rmm
                  feq.s        zero, ft10, fa2
                  slti         s1, s6, 259
                  fsqrt.s      ft8, fs3, rmm
                  sll          t2, s0, s8
                  mulhu        a0, a7, a2
                  slli         t2, s6, 20
                  divu         sp, s8, gp
                  xor          a4, a5, a6
                  andi         s0, s8, -1447
                  xor          a3, a2, a7
                  fadd.s       ft2, fs6, fs9, rup
                  mulh         t0, tp, t0
                  auipc        s10, 373324
                  addi         t6, s1, 677
                  srai         t5, a7, 22
                  remu         sp, s7, s3
                  slli         s0, s7, 3
                  ori          s7, a2, 122
                  srai         zero, t0, 22
                  xori         a3, a6, 1993
                  fmax.s       ft9, fa4, fs5
                  slt          s2, a6, s6
                  or           t4, a4, sp
                  fsqrt.s      fs4, fs3, rdn
                  remu         s1, a3, s5
                  fcvt.s.w     ft8, s8
                  fmv.w.x      ft10, s2
                  fmax.s       fa3, fs10, fs4
                  sll          s0, a5, t5
                  fmax.s       fa3, fs5, ft11
                  fclass.s     gp, ft9
                  and          s5, sp, s0
                  sltu         a5, t4, ra
                  fsgnj.s      ft7, fs1, ft7
                  fdiv.s       fs6, ft9, fs5
                  mulhu        s7, s7, s10
                  mulh         t4, a3, a0
                  or           s11, s11, t4
                  flt.s        s11, ft4, fs10
                  ori          s0, a0, 206
                  flt.s        sp, ft9, ft3
                  xor          tp, t1, a4
                  xor          a0, tp, a2
                  lui          a6, 719429
                  and          a0, zero, a5
                  fmul.s       fs8, ft3, fs7
                  fdiv.s       fs7, fa2, ft7, rdn
                  or           a5, t3, zero
                  fmv.w.x      fs11, s10
                  sub          a5, a4, tp
                  rem          a0, ra, s5
                  feq.s        a6, ft10, fa4
                  fmin.s       fs6, ft4, fs3
                  nop
                  fsqrt.s      fs3, ft6, rdn
                  nop
                  slti         s2, t5, 260
                  fsub.s       ft2, ft9, ft2
                  fmv.x.w      s9, ft6
                  fsgnjn.s     ft10, fa1, fa3
                  mulh         sp, s3, t3
                  ori          s2, a2, 1949
                  slt          s10, s9, t2
                  fsub.s       ft8, fa0, fs10
                  fsqrt.s      fa3, fa5
                  fcvt.s.w     ft8, a5, rdn
                  divu         s11, t4, t0
                  and          tp, s5, s1
                  lui          ra, 4833
                  fadd.s       ft2, fs5, fs6, rtz
                  fmin.s       ft1, fs1, fa2
                  fdiv.s       ft11, ft10, ft7, rne
                  or           tp, s11, s6
                  fsgnj.s      ft9, ft9, fs4
                  fmin.s       ft7, ft2, ft2
                  fcvt.s.w     fs11, s0, rup
                  auipc        a4, 615930
                  nop
                  nop
                  srai         zero, t5, 21
                  and          t1, t2, s7
                  fsqrt.s      fs6, fs4
                  fmv.x.w      zero, ft2
                  sll          t3, a6, t2
                  srl          s2, s3, s9
                  nop
                  fcvt.s.wu    ft11, s0, rne
                  remu         s5, s9, s5
                  nop
                  fsub.s       fs5, ft11, fa5
                  slt          s10, a6, a7
                  xor          s11, t0, a5
                  mulh         gp, t0, s2
                  fsgnjx.s     fs6, fa0, fs6
                  srai         s0, s0, 2
                  ori          s0, a4, -864
                  srl          t5, s2, t0
                  divu         s8, t0, s7
                  fcvt.w.s     s11, fa6
                  fcvt.w.s     a2, ft7
                  fcvt.s.w     ft0, t0, rtz
                  fmin.s       ft10, fs5, fs3
                  lui          s7, 278452
                  srli         t6, s11, 0
                  fsgnjx.s     fs10, fa4, ft5
                  srli         s2, tp, 3
                  fsgnjx.s     fs2, fa2, fs11
                  mul          t4, a1, s5
                  auipc        s7, 384368
                  fcvt.wu.s    t2, fs10
                  slt          ra, a6, s2
                  xori         zero, s2, 873
                  fcvt.wu.s    zero, ft8, rtz
                  slt          t2, s4, a2
                  fcvt.s.wu    fa3, a6, rup
                  add          a5, s2, s1
                  nop
                  slli         t1, t6, 0
                  fadd.s       ft7, fa7, fs3, rup
                  divu         zero, a0, ra
                  or           sp, s2, t1
                  sltiu        a6, ra, 1748
                  fsub.s       fa3, fs9, ft4
                  sra          a4, a3, tp
                  divu         t6, t6, t6
                  andi         t1, a0, -232
                  xor          t6, a0, s10
                  sub          s1, s2, t0
                  add          t0, s2, s5
                  fdiv.s       ft8, ft6, fs0, rdn
                  slli         a6, zero, 20
                  sra          t5, s9, s3
                  and          a0, t3, s2
                  auipc        s2, 456636
                  fdiv.s       fs3, fs11, fa5
                  lui          t0, 619642
                  fcvt.s.wu    ft0, tp, rdn
                  fcvt.wu.s    t5, fa5, rtz
                  srli         t6, s2, 21
                  srli         t2, a3, 23
                  mul          t6, s7, a3
                  add          t0, s7, t6
                  sub          s4, tp, t0
                  srl          s1, a1, a6
                  srli         gp, a7, 5
                  nop
                  div          s10, tp, gp
                  ori          a2, a2, 692
                  div          zero, t6, s9
                  nop
                  lui          zero, 915523
                  fsub.s       fs9, fs2, ft4
                  fsgnj.s      ft6, ft8, ft11
                  div          s5, s9, a5
                  fcvt.s.wu    ft4, t0
                  rem          s4, tp, a7
                  rem          s2, s5, gp
                  srai         a5, a2, 16
                  rem          a0, a3, t0
                  srl          s6, zero, a3
                  mul          sp, s2, zero
                  sltiu        s1, s11, -1745
                  div          s9, gp, t4
                  fmv.x.w      sp, ft10
                  addi         s2, t1, 344
                  fle.s        s7, fa2, ft4
                  fsub.s       fs8, fa0, ft1
                  mulhu        a2, a4, a6
                  fmv.w.x      fs1, t1
                  sltiu        zero, t2, 1647
                  and          s4, s8, a5
                  slt          t2, s5, a1
                  or           a2, a6, a4
                  divu         s7, a1, a5
                  slt          t5, s4, tp
                  mulh         sp, s8, s10
                  fmax.s       ft1, ft3, fs9
                  lui          a6, 460406
                  srai         s2, s7, 6
                  add          ra, a0, s1
                  div          s10, a7, a2
                  slli         t2, a5, 26
                  lui          t2, 1044253
                  srli         t1, t6, 26
                  nop
                  srli         s6, a7, 19
                  rem          s11, s1, a5
                  auipc        s9, 767079
                  fdiv.s       fs6, fs1, fs7, rup
                  sltu         t0, a6, t1
                  fcvt.wu.s    s6, fs10
                  sra          s2, s11, a0
                  rem          t0, s11, t6
                  fcvt.wu.s    s6, fa1
                  feq.s        s5, fs2, ft5
                  srai         t6, a0, 5
                  fsqrt.s      ft11, ft7
                  sltiu        s5, s9, 282
                  fadd.s       ft2, fa6, fs0
                  feq.s        s7, ft11, fs5
                  fcvt.w.s     s7, fa5
                  fcvt.s.w     ft3, t4, rmm
                  mulhsu       s1, t3, tp
                  fadd.s       ft3, fs11, ft6
                  feq.s        a0, ft11, fa5
                  fsgnj.s      fs0, fa1, fs7
                  fsub.s       ft11, ft2, fa7, rup
                  fmul.s       ft11, ft0, ft1, rne
                  fcvt.s.wu    fa0, s8, rmm
                  fsqrt.s      fa5, fa6
                  rem          s10, t5, a7
                  fsqrt.s      ft10, ft0, rup
                  slli         s2, t3, 4
                  lui          s10, 701110
                  srai         s11, s10, 16
                  xori         a3, s7, 1046
                  and          s5, a0, zero
                  fcvt.s.w     ft1, s5
                  fsub.s       fs5, fa1, fs10
                  sll          t3, s3, t1
                  feq.s        a4, fs8, fa7
                  fcvt.s.w     fa0, a5, rmm
                  srl          a5, a6, gp
                  fsgnj.s      ft4, ft1, fs8
                  feq.s        t0, fs4, fs5
                  fsgnj.s      fs10, fs1, ft7
                  fmv.x.w      t0, ft7
                  slli         a6, a2, 20
                  fclass.s     a6, ft2
                  xori         t3, s0, 619
                  or           a4, tp, a2
                  fmul.s       ft2, ft6, fs1
                  divu         s2, t5, s7
                  ori          a0, a4, 282
                  nop
                  remu         t5, s7, a5
                  mul          a3, s0, s5
                  fsgnjx.s     fs6, fs1, fa5
                  auipc        t0, 275913
                  sll          t3, s5, a1
                  fdiv.s       ft3, fs10, ft9, rne
                  slti         t4, s0, -1104
                  feq.s        s4, ft3, fs0
                  fmin.s       fs5, fa1, fs5
                  srl          s7, ra, gp
                  fadd.s       fs8, ft9, fa7, rtz
                  add          s10, t1, s7
                  sra          s10, t1, s4
                  fsgnjn.s     ft10, fs5, fa2
                  remu         sp, a3, gp
                  fmin.s       fa2, fa6, fs9
                  fmin.s       fs10, ft2, fa3
                  mul          s1, s5, a6
                  add          s8, t5, a6
                  feq.s        zero, ft9, ft4
                  sltiu        t0, s10, 212
                  fcvt.s.wu    ft3, a0
                  sra          s5, s6, a5
                  fsgnj.s      fs5, ft0, fa0
                  mulhsu       sp, t3, s10
                  ori          s9, t2, 924
                  fadd.s       ft1, fs8, fs6, rtz
                  or           a4, s6, t3
                  slt          sp, s0, ra
                  mulhu        s7, s9, ra
                  sltiu        s8, sp, 1340
                  ori          s8, gp, 1969
                  auipc        zero, 544142
                  feq.s        a2, fa2, fs0
                  slti         t3, a2, -1927
                  add          t4, a1, s11
                  fsgnj.s      fs2, fa2, fa6
                  fmul.s       ft5, ft7, ft2, rne
                  fcvt.w.s     s5, fs6, rmm
                  nop
                  srl          a6, s0, sp
                  mul          s0, s8, s9
                  divu         s1, t3, s1
                  remu         zero, a6, a4
                  nop
                  or           t4, s0, t4
                  and          s4, a3, s7
                  sll          s7, a2, t0
                  sub          t1, a1, a4
                  fmul.s       ft11, ft0, fs5, rne
                  xori         t2, t0, 722
                  sltiu        s1, a4, -1794
                  andi         t1, tp, -101
                  remu         a4, s5, zero
                  div          s11, t0, a0
                  sll          t3, t2, s8
                  fsub.s       ft7, ft4, fa3
                  sltu         s10, t3, s2
                  slt          s7, s7, s0
                  or           t2, a5, s10
                  nop
                  or           a6, ra, ra
                  xor          gp, s7, zero
                  andi         tp, s0, -731
                  fsub.s       ft7, fs4, ft3, rne
                  xori         gp, a3, 698
                  srl          t1, t0, s7
                  slt          s5, t5, t1
                  rem          t5, s2, t2
                  sltiu        t1, zero, -567
                  fmax.s       fa5, ft9, fs8
                  andi         s7, t0, -25
                  fmin.s       fs0, fs5, ft1
                  feq.s        s10, fs3, fs8
                  fsgnj.s      ft4, ft1, ft8
                  srl          ra, s8, t6
                  srli         a3, t5, 7
                  slt          s0, t6, s6
                  fmax.s       fs9, ft5, fs6
                  fsgnjx.s     ft10, fa3, ft0
                  rem          s7, t6, s2
                  add          tp, a0, s10
                  fle.s        t4, fa3, ft1
                  fclass.s     s2, fs4
                  fmin.s       ft1, fs1, fs10
                  fclass.s     s9, fa3
                  mul          t3, a2, s4
                  fsub.s       fs3, fa1, ft8, rtz
                  sra          t5, s2, s2
                  sra          zero, zero, gp
                  fmv.w.x      fs6, s6
                  fdiv.s       ft9, fs2, fa2
                  or           s0, a7, ra
                  or           s8, ra, t6
                  slti         a3, s11, -1989
                  remu         t5, a1, sp
                  fmul.s       fs6, fs1, fs6, rne
                  fcvt.s.w     ft2, s3, rup
                  srl          t0, a0, t2
                  addi         a2, s11, 508
                  fmax.s       fa4, fs9, ft5
                  fle.s        t0, fs8, fs9
                  xori         s11, a2, -402
                  and          a2, gp, t6
                  auipc        tp, 1041467
                  srai         s8, a6, 26
                  mulhu        gp, s6, tp
                  auipc        a2, 602627
                  fsgnjn.s     fs3, fs3, ft1
                  slti         t1, a1, 2034
                  xori         t2, zero, -1655
                  slt          a5, a6, a2
                  xor          tp, zero, s2
                  xor          sp, s0, ra
                  fsub.s       fa6, fs5, fs4, rtz
                  srl          t6, a0, ra
                  mulhu        a4, s2, t0
                  mulhu        a5, sp, t3
                  fcvt.wu.s    s10, fs2, rdn
                  slti         t4, t0, -610
                  and          t6, t2, a0
                  mulh         t1, s2, a2
                  fcvt.wu.s    s9, ft9
                  remu         t6, a7, zero
                  fmv.w.x      fs2, a0
                  srli         a5, a6, 17
                  fsgnjn.s     fa0, ft6, ft0
                  ori          s5, gp, 1255
                  or           s6, a6, s4
                  or           a4, a4, s8
                  fmin.s       fs7, fs10, ft4
                  fsgnjx.s     ft8, ft8, fa4
                  mulhu        t6, s10, s3
                  and          s9, s4, t6
                  lui          t2, 929631
                  fcvt.wu.s    s6, ft4, rdn
                  fmax.s       ft0, ft2, ft8
                  xor          s0, a4, zero
                  fdiv.s       fs10, fs5, fs11, rdn
                  mulh         tp, t0, s10
                  nop
                  srai         a4, a3, 0
                  mulhu        a2, a0, s10
                  add          s8, s7, a7
                  fmin.s       fa6, fs0, ft3
                  fmv.x.w      s9, fa6
                  srl          s4, a1, a7
                  slti         a0, a0, -227
                  fclass.s     tp, ft1
                  fmin.s       fs3, fs4, ft4
                  addi         a5, t4, -1198
                  nop
                  divu         s9, a5, s11
                  divu         s10, gp, a1
                  fcvt.wu.s    sp, fs0
                  fsgnj.s      ft10, ft2, ft8
                  fsub.s       fa6, fs11, fs7, rdn
                  mulhsu       t3, t5, s9
                  sra          t2, t2, t2
                  srl          s0, a6, s4
                  srai         t5, t4, 23
                  fadd.s       fs9, ft8, fs7
                  xori         a6, t3, 5
                  fcvt.s.w     fa4, s3, rtz
                  div          s11, tp, t2
                  add          s2, s1, zero
                  fcvt.wu.s    s4, fa6
                  mulhsu       zero, t2, s8
                  feq.s        ra, fs6, fa5
                  fmin.s       fs10, fs5, fs9
                  srl          t5, s1, t5
                  fle.s        a0, ft9, fs10
                  fcvt.s.wu    fs3, zero
                  mul          s6, t6, a3
                  sub          t2, s11, t3
                  xor          a6, t6, t4
                  or           a3, a2, s10
                  sltu         t2, a5, t4
                  fadd.s       fs9, ft3, fa3, rtz
                  andi         t6, t4, -1949
                  fmv.x.w      s1, ft4
                  fsgnj.s      fa2, ft10, ft11
                  div          s6, s10, sp
                  xori         a4, gp, -169
                  feq.s        ra, fs9, fs4
                  slt          s4, zero, tp
                  fdiv.s       fs10, fs11, ft4
                  sltiu        t4, t3, -1815
                  flt.s        gp, ft1, ft1
                  or           s11, s1, a1
                  flt.s        a5, fs2, ft3
                  remu         zero, t6, a1
                  slt          s9, t1, t3
                  fsgnjx.s     ft3, fs3, fs2
                  fcvt.s.wu    fs9, t3, rmm
                  addi         t4, s6, -1001
                  lui          s0, 575148
                  fmul.s       fs0, fs3, fs9, rtz
                  mulhsu       a4, a6, s3
                  div          s4, a1, a4
                  fsgnj.s      fa2, ft4, ft6
                  slti         a2, s9, -1577
                  mul          s4, sp, t4
                  ori          gp, ra, 1651
                  divu         a5, s4, s3
                  ori          a5, a5, -546
                  add          a0, s3, s9
                  fadd.s       fa3, ft9, fa7
                  mulh         s5, s1, a2
                  srli         gp, t0, 16
                  auipc        a5, 326227
                  mul          t6, gp, s8
                  fdiv.s       fs3, fa2, ft4, rtz
                  xor          tp, sp, t5
                  fmin.s       fa3, ft10, fs10
                  fsgnj.s      ft6, ft8, fs8
                  sra          ra, s1, t2
                  fmv.x.w      a3, ft9
                  fmul.s       ft4, ft6, ft4, rdn
                  divu         sp, s11, s9
                  div          s11, a4, tp
                  slt          tp, a1, t3
                  flt.s        t1, fa6, ft5
                  mul          a3, t1, a5
                  sll          a0, t6, a6
                  feq.s        s5, fa1, fa1
                  fmul.s       fa0, fs1, fa0
                  mulh         s11, a0, sp
                  div          t1, s10, a2
                  add          s2, s3, a2
                  fsqrt.s      fs5, ft11
                  slt          s10, s7, a7
                  andi         t4, s9, 1731
                  mul          s2, t1, s10
                  andi         s5, gp, -1844
                  ori          tp, t4, -1740
                  xori         t6, t5, 368
                  srli         t1, s1, 7
                  fmax.s       fa0, fa6, fs1
                  sra          a3, gp, s3
                  sll          t5, s5, zero
                  auipc        a3, 744068
                  and          a3, t4, s4
                  sra          sp, ra, a2
                  fle.s        a5, fs0, fa6
                  fcvt.wu.s    sp, ft0
                  fmul.s       fa5, ft7, fs4
                  mulhsu       tp, t3, t4
                  fdiv.s       ft11, fs11, ft10
                  fle.s        t3, fa5, fs6
                  fle.s        sp, ft6, ft6
                  lui          a0, 969864
                  add          t5, sp, ra
                  fmin.s       fs6, fa0, ft3
                  xor          s10, s2, sp
                  and          s8, zero, s10
                  srai         t2, zero, 5
                  fmax.s       fs11, fa1, fs2
                  fcvt.s.wu    ft1, s4, rdn
                  fle.s        a3, fa5, fa1
                  mul          s8, s8, t5
                  sltu         s11, a7, a0
                  slti         a3, t0, 760
                  div          a6, a4, s10
                  mulh         t2, t1, sp
                  fclass.s     a3, fs10
                  sltiu        a5, s4, -977
                  or           t6, s2, a2
                  feq.s        ra, ft11, ft10
                  mulhsu       zero, t5, a6
                  remu         a5, t5, ra
                  slli         s8, s10, 24
                  fclass.s     ra, fs7
                  fle.s        t1, fs1, fs10
                  fcvt.s.wu    ft7, t1
                  xor          t3, s10, s10
                  divu         s8, s3, s4
                  fcvt.s.wu    fa4, t1
                  lui          s10, 272927
                  and          s7, a2, s10
                  lui          s11, 907391
                  fmul.s       ft10, fs0, ft11
                  fcvt.wu.s    zero, fs3, rmm
                  sltiu        a5, s1, 1414
                  fmul.s       ft8, fa1, fa7, rne
                  fsgnjx.s     ft3, fs3, ft11
                  remu         a3, s6, sp
                  ori          s9, s11, 1217
                  fcvt.s.wu    ft10, a1, rtz
                  add          a4, sp, t4
                  fclass.s     a6, ft6
                  sll          s2, a0, sp
                  fsgnj.s      fa4, fa6, fs0
                  slli         s6, gp, 15
                  fcvt.s.w     fa7, s0
                  fmax.s       fs4, fs11, fa6
                  ori          s5, t1, 335
                  fmv.w.x      fs1, t0
                  fsqrt.s      fs0, fa6
                  fmv.w.x      fs11, s0
                  andi         s6, t4, 559
                  fclass.s     s10, ft6
                  xor          a6, a4, s3
                  fmv.x.w      s7, fs9
                  addi         t2, s5, -17
                  fmv.w.x      ft0, t2
                  fclass.s     a3, ft2
                  sll          t6, t0, t5
                  fmax.s       fs8, fa2, fs2
                  rem          s10, a2, sp
                  srai         s9, a3, 8
                  sltu         t0, s2, a6
                  feq.s        s0, ft5, fa1
                  sltiu        a2, s3, 1123
                  fcvt.wu.s    s7, fs2, rup
                  add          t2, s6, t0
                  nop
                  fadd.s       fs10, fa1, fs0
                  slli         a5, s4, 9
                  sll          a5, a5, s6
                  divu         s7, s1, t3
                  div          gp, sp, a2
                  srl          a4, t5, a4
                  mulhsu       tp, a5, s11
                  or           a6, a7, s4
                  fcvt.s.wu    ft3, a1
                  addi         t6, s10, 1160
                  fdiv.s       fs8, fs10, fs3
                  sll          gp, s10, zero
                  divu         s1, s8, t3
                  fmv.w.x      ft3, t1
                  sltiu        t1, t3, 1076
                  ori          s10, s4, 805
                  fmul.s       fa0, fs5, ft4
                  sll          a2, a1, t6
                  nop
                  fmul.s       ft4, fa4, fs2
                  rem          sp, s11, a7
                  auipc        s2, 923710
                  fmin.s       fa7, fs11, ft0
                  srli         t2, sp, 15
                  sub          sp, sp, s6
                  fmv.w.x      fs7, s9
                  sub          s5, t4, s11
                  lui          s9, 651934
                  fmax.s       ft4, fs6, fs7
                  slti         t6, s9, 1916
                  fmv.w.x      fs4, a0
                  fcvt.w.s     zero, fa0, rne
                  srl          gp, t5, a7
                  andi         t6, t1, -604
                  srl          t3, t3, a5
                  flt.s        s4, ft5, ft5
                  fcvt.w.s     zero, fs6
                  add          a5, s4, s5
                  divu         t3, s2, gp
                  slli         zero, a6, 1
                  fdiv.s       fa4, ft1, fa1
                  fsgnjx.s     fs11, fs3, fs1
                  mulhsu       s10, t5, a7
                  mul          s7, ra, s9
                  fclass.s     a2, fa6
                  fmax.s       fa7, ft5, fs1
                  add          t0, t6, s7
                  fsgnj.s      fa5, ft1, fs9
                  slli         a6, tp, 5
                  fcvt.s.w     ft2, s10
                  fcvt.s.wu    ft4, t4, rtz
                  remu         s4, s3, s0
                  nop
                  slli         s10, t0, 5
                  sltu         gp, t6, a1
                  flt.s        s4, ft9, fs9
                  slti         a5, a6, -1963
                  slti         t2, s7, -1435
                  nop
                  and          s5, s0, zero
                  fmin.s       fs0, fs4, ft6
                  sltiu        s1, a6, -451
                  srl          a6, t6, s9
                  divu         t1, s9, t1
                  sltu         s2, a5, a3
                  xor          a5, s8, zero
                  fmul.s       fs11, ft11, fs11, rup
                  andi         t1, zero, -1696
                  sltu         t3, a6, gp
                  srl          s1, s6, s1
                  fmv.w.x      ft4, a7
                  fsub.s       fa0, ft0, ft5, rne
                  fsgnjx.s     ft3, fs11, fs6
                  andi         t1, s4, 540
                  lui          sp, 72886
                  mulh         a3, t5, tp
                  div          s7, s11, t3
                  sub          s6, s3, t1
                  sltu         tp, a6, s1
                  sltiu        a3, s2, -1581
                  sra          a0, t2, tp
                  fcvt.s.wu    fs5, s8, rdn
                  sll          s5, sp, s0
                  fcvt.wu.s    zero, ft3, rdn
                  slt          a6, s5, a1
                  rem          s6, t0, s4
                  mulhu        s2, s10, s8
                  sub          s0, s10, s6
                  and          s2, a0, s10
                  srai         s0, a1, 18
                  auipc        s6, 615679
                  nop
                  fcvt.w.s     a3, fs4, rup
                  divu         a5, s11, t0
                  fmax.s       fs4, fa0, fa6
                  ori          s4, s10, 1912
                  fcvt.s.wu    fs0, s11, rup
                  fsgnjn.s     ft9, ft3, ft11
                  fsgnjn.s     fs11, fa7, fa7
                  or           s0, a3, a6
                  fsqrt.s      fs8, ft9
                  fmul.s       fa5, ft6, fs4, rtz
                  rem          t4, s11, a6
                  div          t0, s6, t3
                  mul          s5, s10, s6
                  fdiv.s       fs1, ft10, ft1
                  lui          s8, 732895
                  fsgnj.s      fa7, ft8, fs5
                  andi         s5, a3, 575
                  sll          s2, t0, s7
                  fle.s        t6, ft2, fa6
                  fcvt.s.wu    fa7, ra, rne
                  srli         t2, a2, 7
                  fsqrt.s      fs3, fa1, rmm
                  fsub.s       fs8, fs6, fs3
                  sra          gp, s1, s5
                  sltiu        t4, a6, -399
                  fadd.s       fa7, ft0, fs10, rdn
                  remu         s10, a4, a0
                  xor          t1, s0, t0
                  xor          t0, tp, s3
                  fmul.s       fs9, fs10, ft0, rdn
                  fsgnj.s      fa1, fs9, fa7
                  remu         s5, s11, ra
                  auipc        s11, 325901
                  mulhsu       s1, t1, s3
                  and          t5, sp, gp
                  fmv.x.w      s2, fs4
                  slt          a2, s1, s7
                  fsgnjx.s     fs7, ft3, ft7
                  fmul.s       fs8, fs10, ft7, rtz
                  mulhsu       a4, s0, a5
                  div          t3, a2, a7
                  fclass.s     s0, fs0
                  div          s11, s6, t4
                  fmv.w.x      fs8, a2
                  or           s0, t2, tp
                  fmin.s       ft8, fa6, fs9
                  fdiv.s       fa2, fs10, ft2
                  slti         s11, a1, -459
                  fle.s        t0, ft9, ft9
                  mulhu        ra, t1, a5
                  fsgnj.s      fs8, ft0, fa1
                  flt.s        s11, fs9, fs3
                  lui          ra, 1475
                  lui          sp, 885672
                  xor          t2, s6, s0
                  mulhsu       t5, s5, sp
                  srl          tp, t3, a7
                  sltiu        s4, t2, -880
                  auipc        t1, 569852
                  xor          t4, s10, tp
                  mulhu        a3, s6, t6
                  flt.s        s9, ft2, fs1
                  fadd.s       fs2, fs5, fs3, rne
                  fsgnj.s      fa4, fs10, ft7
                  sra          a0, s3, s0
                  fdiv.s       fs11, fs3, fs0, rmm
                  slli         a4, s3, 4
                  fmin.s       ft3, ft11, fs8
                  fmul.s       fs3, fa4, ft6, rdn
                  mul          t1, ra, t1
                  fle.s        sp, fa6, fa3
                  mulh         a6, s8, t3
                  xor          s0, s0, a6
                  srl          t0, s6, a6
                  fcvt.s.w     fa6, a2, rmm
                  xori         s6, s3, 1509
                  slti         sp, t0, -1016
                  fmax.s       ft9, fs11, ft6
                  fmax.s       fs3, fs10, ft11
                  srai         s8, a1, 24
                  fsqrt.s      fs2, fa1, rtz
                  sltiu        a5, t3, -1476
                  sltu         s4, t3, t6
                  mulh         t5, a6, s5
                  fsgnjx.s     fa1, fa6, fa7
                  mulhsu       s8, a2, s8
                  slli         s7, s9, 17
                  fcvt.wu.s    t1, ft6
                  fmax.s       fa2, ft10, ft5
                  rem          t0, a3, t3
                  slt          t1, a0, a7
                  divu         s9, s2, t6
                  fsgnj.s      fs7, ft4, fs0
                  fmul.s       ft5, fs1, ft10
                  feq.s        t5, fa6, fa6
                  fcvt.wu.s    tp, fs3
                  and          s1, s11, s0
                  fmul.s       fs0, ft0, fs6
                  fmul.s       fs9, ft4, fs7
                  fle.s        s9, fa5, ft8
                  srli         s10, tp, 14
                  fle.s        a3, fa2, fs0
                  flt.s        t0, fa6, fa7
                  divu         a4, s4, tp
                  remu         s0, zero, s10
                  xori         s2, s2, 1462
                  sltiu        a0, t3, -473
                  lui          s11, 895927
                  feq.s        t1, fs3, ft10
                  fmv.w.x      fa4, a5
                  fcvt.s.wu    ft5, t0, rup
                  addi         t4, a5, 1018
                  fcvt.s.w     ft0, s8
                  fsgnj.s      fs11, ft3, ft6
                  mulh         sp, s6, ra
                  addi         s10, s8, -264
                  slt          s7, s9, a0
                  srl          a4, a5, zero
                  andi         s4, s11, -1397
                  fmv.x.w      a3, ft10
                  fmin.s       fa1, ft9, fs8
                  slti         a3, tp, -1679
                  fcvt.w.s     s4, fs5, rup
                  srli         tp, s8, 8
                  fmul.s       fs8, fa5, ft5
                  flt.s        s7, fs5, ft10
                  mulhu        t5, a4, zero
                  fmv.w.x      ft9, a7
                  fmv.x.w      gp, ft5
                  fsgnjn.s     ft8, fs4, fa4
                  sra          s2, s9, t1
                  fsgnj.s      ft6, fs0, fa2
                  xor          ra, gp, t6
                  fdiv.s       fs9, fa0, fa5
                  fcvt.w.s     t0, fs0
                  mulhu        s2, a4, t2
                  fmin.s       fs11, fs4, fs7
                  mul          a2, s4, a7
                  slti         a5, a3, -349
                  feq.s        t5, fs11, fs1
                  sltiu        a3, t4, -156
                  fmul.s       fs4, fa4, ft8, rne
                  add          s6, s3, a4
                  feq.s        s7, fs5, fs9
                  add          s0, s7, gp
                  sra          t6, t2, a0
                  nop
                  mul          a4, s10, s5
                  slt          t1, a1, s3
                  mulhsu       zero, s1, a0
                  fsgnj.s      fa5, ft5, fs6
                  fcvt.wu.s    s9, fa6, rup
                  mulh         zero, gp, s3
                  fmin.s       ft5, ft2, fs3
                  sll          ra, a4, s8
                  sltiu        a5, t5, -987
                  fadd.s       fs2, ft7, fs2
                  flt.s        ra, fa7, ft8
                  andi         sp, s8, 266
                  auipc        s2, 9312
                  fsgnj.s      ft7, fs3, ft0
                  xori         s0, a2, -1012
                  auipc        t0, 97215
                  fcvt.s.wu    fa3, s3, rmm
                  fsgnjn.s     fa6, ft8, ft1
                  sltu         tp, a1, a6
                  sltiu        t6, a5, 1168
                  fsgnjx.s     fs11, fa3, ft7
                  fsub.s       fs11, fs4, ft4, rmm
                  xor          ra, a1, a3
                  fadd.s       fs0, fs11, ft8
                  xori         t5, t0, -1754
                  mul          s7, s0, ra
                  lui          s0, 943037
                  and          t5, s6, s1
                  rem          s6, a7, t0
                  sltiu        a3, s3, 240
                  fmv.x.w      a5, ft11
                  fmv.x.w      t6, fs2
                  fcvt.s.wu    fs6, s10
                  fmin.s       fa5, fa7, fa5
                  addi         a6, a3, -484
                  xor          s7, t1, gp
                  remu         a4, s1, s11
                  srl          a3, t1, s5
                  ori          a2, t3, -1749
                  mulh         s4, s2, a1
                  mulhsu       tp, sp, t1
                  fmul.s       ft9, fs11, fa0, rne
                  fle.s        gp, fs9, fa4
                  srai         t3, s4, 6
                  rem          s10, ra, s10
                  nop
                  lui          a5, 24171
                  fle.s        t4, fa1, fs6
                  fmul.s       fs11, fs9, fs7, rmm
                  sltiu        s5, a7, -1684
                  mul          s7, ra, a7
                  fcvt.s.w     fs0, s4
                  andi         s5, t5, 872
                  slti         a2, t1, -1960
                  sltiu        t0, a7, -1934
                  fcvt.s.w     fs4, a5, rup
                  or           a4, sp, t4
                  div          t3, gp, s8
                  fcvt.w.s     s1, fs9, rup
                  xori         s4, s5, -1197
                  divu         s0, s3, t6
                  fsgnjx.s     fa4, fs3, ft3
                  fcvt.wu.s    a4, fs8, rdn
                  addi         t5, t1, -1224
                  fmv.w.x      fs3, t6
                  srai         s5, s6, 4
                  fmin.s       fa2, ft5, ft4
                  mulhu        t5, t1, a7
                  sra          a0, a0, tp
                  fclass.s     s10, fs1
                  sub          s6, s0, tp
                  auipc        s5, 725405
                  fmax.s       fs1, fa1, ft10
                  fclass.s     a3, fs0
                  xori         ra, s9, 1350
                  xori         s0, s9, -155
                  fcvt.s.w     fa7, a4
                  feq.s        t6, fs6, ft5
                  srai         s9, a7, 9
                  or           t1, s9, s5
                  srli         t6, s2, 25
                  mulhsu       s6, gp, t5
                  or           t3, s8, tp
                  andi         s5, s1, 1404
                  fmin.s       fa7, fa4, fs5
                  fcvt.w.s     t1, fs9, rtz
                  auipc        s8, 178902
                  fadd.s       fs4, ft6, fa6, rdn
                  and          s6, gp, a5
                  flt.s        t6, ft6, fa5
                  fsgnj.s      fs3, fs3, fa6
                  sltiu        t0, s8, -2023
                  div          s5, t3, t0
                  lui          t3, 548025
                  or           s8, t0, s11
                  mulhu        s9, t3, t6
                  slt          zero, tp, t2
                  fclass.s     t3, fs8
                  feq.s        a3, fs4, ft0
                  slli         a5, tp, 10
                  xori         s6, a1, -13
                  fcvt.wu.s    s5, fs11
                  div          s5, a7, s6
                  and          gp, sp, gp
                  lui          s4, 24521
                  sll          s5, s2, a3
                  srli         a0, a5, 14
                  slli         t4, ra, 6
                  sra          s6, s11, s0
                  mulhu        s9, a0, t1
                  sra          s8, s9, t0
                  add          s0, a6, a2
                  srli         gp, s11, 10
                  div          tp, t2, a2
                  mulh         s5, t6, s1
                  xori         t5, s5, 1793
                  sll          s5, a4, zero
                  fcvt.s.w     ft10, s8, rne
                  slti         s2, s4, 203
                  fsqrt.s      fa1, ft3
                  mul          zero, tp, a2
                  and          s4, t3, t6
                  remu         t0, t2, s3
                  add          a5, ra, ra
                  addi         s1, a4, -340
                  xor          a3, t0, s8
                  sltu         s9, a6, t1
                  div          t3, s9, a6
                  sltu         s9, sp, t3
                  auipc        t2, 578047
                  auipc        tp, 172720
                  sltiu        s7, s1, -1118
                  auipc        a3, 1025924
                  srl          s5, s1, t6
                  fsgnj.s      ft8, fa6, fs1
                  fsgnjx.s     ft9, ft10, ft9
                  slti         s10, t0, -787
                  lui          a0, 411100
                  fmv.w.x      ft7, sp
                  sll          s8, a1, a7
                  fclass.s     a4, ft3
                  addi         s10, s9, -339
                  fmul.s       fa4, fs3, fa1
                  feq.s        s9, fa3, fa7
                  rem          s2, t0, s10
                  andi         zero, a3, 349
                  fsgnjn.s     ft8, fs6, ft7
                  andi         a0, a0, -175
                  xor          zero, t5, a5
                  mulh         a6, a5, a1
                  fcvt.s.w     ft8, s9
                  ori          sp, t4, -170
                  fmin.s       fs6, ft4, ft7
                  xori         t1, s1, 771
                  remu         t6, sp, sp
                  fmv.w.x      fs0, a0
                  fmul.s       ft11, fa7, ft9, rdn
                  sltu         tp, t4, a1
                  feq.s        s4, fa2, fs9
                  fmin.s       fs3, fa2, ft2
                  and          s4, t5, sp
                  divu         s6, a3, tp
                  fmul.s       ft9, fs2, ft5, rdn
                  fcvt.w.s     a4, ft0, rtz
                  srli         t6, a7, 11
                  fcvt.w.s     t2, fs8, rdn
                  sltiu        sp, s0, 1110
                  divu         ra, s6, s10
                  addi         s4, a2, 1928
                  add          a4, a5, t4
                  sub          a6, t6, s7
                  sra          t5, s6, s10
                  mulh         zero, t5, tp
                  add          zero, a0, s7
                  fcvt.s.wu    fs7, t3
                  mulh         zero, s5, s11
                  feq.s        ra, fs1, fs7
                  sub          s7, t2, t4
                  addi         s7, sp, 987
                  fcvt.s.w     fs7, t3
                  auipc        ra, 529106
                  sltiu        t3, tp, -1639
                  fdiv.s       fs8, fs5, fa6, rtz
                  fadd.s       ft8, fs9, fs2
                  and          ra, a2, a5
                  sra          s7, s3, a7
                  fclass.s     gp, ft9
                  fsgnjx.s     ft3, ft8, fs0
                  rem          s11, s2, a7
                  fmv.x.w      a6, fs6
                  fle.s        tp, ft0, ft11
                  and          s11, sp, a6
                  fadd.s       ft2, fa1, ft2
                  feq.s        t5, ft2, ft11
                  fle.s        t1, ft6, fs5
                  xor          t6, s4, a2
                  fmax.s       fa0, ft10, fa3
                  addi         t3, ra, -520
                  fmax.s       fa2, fa2, ft11
                  mulhsu       t6, s7, s7
                  fcvt.s.wu    ft8, a2
                  fsqrt.s      ft4, fa1
                  fsqrt.s      fs2, fs2, rne
                  xor          t5, a3, s8
                  fadd.s       fs1, ft10, fs1, rup
                  remu         s7, tp, t2
                  slli         t1, t1, 5
                  remu         t3, s3, t6
                  fmul.s       ft3, fs1, fa0
                  fsub.s       fs4, fa4, ft5, rtz
                  fsub.s       ft8, fs8, ft7
                  fcvt.s.w     ft9, a5
                  sltiu        sp, s8, 1331
                  auipc        a6, 699306
                  andi         sp, s5, -916
                  fsgnj.s      ft8, ft9, ft1
                  fle.s        a2, fs2, fs1
                  nop
                  remu         s9, gp, tp
                  mul          s6, s8, a1
                  rem          s1, a6, a3
                  nop
                  and          a0, tp, a2
                  fmax.s       ft0, fs6, ft0
                  div          t0, s9, zero
                  fmv.w.x      fs11, zero
                  xori         a5, t3, -135
                  fmax.s       fa0, fs10, fs2
                  sltiu        s2, s11, -1823
                  or           s2, t3, a7
                  mulh         ra, a3, s8
                  fcvt.wu.s    t2, fs9
                  or           t6, a5, a1
                  mulhsu       t0, s3, tp
                  srai         gp, t4, 2
                  mulhu        zero, a4, gp
                  fsqrt.s      ft7, fs3
                  remu         s2, t1, t4
                  auipc        zero, 773052
                  addi         s11, s10, 163
                  fmv.w.x      fs6, s11
                  fsgnjx.s     ft11, ft6, ft5
                  sltu         s0, s9, a5
                  sll          s8, gp, t4
                  fsub.s       fa4, ft11, fs5, rne
                  sll          a0, t0, a7
                  fcvt.w.s     ra, ft2, rtz
                  fadd.s       ft11, fa7, fs8, rup
                  fmul.s       ft7, fs3, ft8
                  andi         s4, t0, 1235
                  slt          t0, ra, t5
                  fmul.s       ft6, ft0, fa3
                  sub          s5, s5, t2
                  fle.s        a4, ft0, ft11
                  and          zero, s8, gp
                  ori          s6, gp, 1251
                  fclass.s     s5, ft6
                  sltiu        t0, a1, -980
                  srli         a6, a0, 18
                  sub          ra, t3, s5
                  or           t5, t3, s4
                  fmul.s       ft5, ft0, fa3
                  fle.s        a6, fs9, ft0
                  fmax.s       fs8, ft7, ft0
                  sltiu        s11, s10, -757
                  fcvt.wu.s    t2, fs2, rup
                  addi         ra, t0, -701
                  mul          a5, s7, s11
                  fmin.s       ft4, fs9, fa6
                  slti         a2, s0, -245
                  lui          zero, 914025
                  mulhu        s7, s2, t3
                  auipc        s1, 21158
                  slti         s10, gp, 1126
                  fsgnjx.s     fs3, ft0, ft11
                  fsub.s       fs10, ft6, fs1
                  fle.s        a2, ft4, fs4
                  fcvt.s.w     fa6, s11
                  and          s0, sp, s8
                  xor          a5, t0, s2
                  mulhu        s9, a3, tp
                  mulhsu       s11, t2, s10
                  slti         t1, gp, -285
                  sltiu        a0, t0, 838
                  fmax.s       fa1, fs10, fa7
                  fdiv.s       ft2, fs0, fs0, rne
                  fmv.w.x      fs1, a4
                  xor          t3, s0, ra
                  fcvt.s.w     fs2, a3, rdn
                  mulhu        s8, t1, tp
                  fmin.s       fa6, fs8, ft9
                  xori         sp, s10, 463
                  fcvt.wu.s    t3, ft9, rup
                  slt          a0, a0, s0
                  fmul.s       fs10, fa0, fs6, rmm
                  fcvt.w.s     zero, fs11, rdn
                  sltiu        s2, a3, 246
                  div          zero, s6, s5
                  mul          t4, ra, a3
                  sra          a3, s11, a0
                  ori          a4, s2, 538
                  mul          s0, a3, a7
                  sltiu        s5, t5, 806
                  fsgnjx.s     fs10, ft5, fa3
                  fcvt.wu.s    t2, fs3
                  srl          a5, s11, s10
                  fclass.s     t0, fa2
                  slli         t5, t6, 30
                  fmin.s       fs2, ft7, fs5
                  srl          ra, a6, sp
                  div          s6, s11, s6
                  mulhsu       s6, zero, s3
                  fmax.s       fs11, fa7, fa4
                  fsgnjx.s     ft11, fs1, fa3
                  add          s0, s10, t4
                  fcvt.wu.s    s8, ft0, rdn
                  ori          s10, s5, -536
                  mulh         t4, s2, s8
                  nop
                  fmax.s       fa1, ft8, ft11
                  fsub.s       fa0, fa2, ft8
                  fsgnj.s      ft6, fa4, fs7
                  andi         sp, gp, 1543
                  auipc        sp, 610062
                  fclass.s     s5, ft8
                  xor          a0, s7, sp
                  div          t5, ra, a0
                  slt          a0, s6, s11
                  mulhu        zero, s11, s3
                  rem          ra, s5, t4
                  srl          t1, a1, tp
                  fle.s        s11, ft6, fa6
                  mulh         s11, a2, s8
                  fdiv.s       fa5, fs5, fs11
                  fsgnjx.s     fa7, fs4, ft1
                  fclass.s     s2, fa2
                  div          t1, s5, s0
                  sltiu        t0, t3, -1563
                  remu         t6, gp, s11
                  fcvt.s.wu    fs7, t0
                  nop
                  flt.s        gp, fa3, ft10
                  fcvt.wu.s    t1, fs11
                  or           zero, s5, t3
                  fdiv.s       fa5, fs10, fs2, rdn
                  addi         a5, a3, -557
                  div          sp, t3, a5
                  xori         a3, s6, -151
                  srl          zero, s7, a7
                  fadd.s       fa2, fa2, fa2, rtz
                  div          s1, tp, a6
                  fcvt.w.s     t1, ft10, rne
                  fmin.s       ft10, fa1, fs5
                  feq.s        s1, fs9, ft5
                  fmv.x.w      t4, ft5
                  rem          a4, s4, tp
                  mulhu        a4, s7, s8
                  xori         a4, t5, -1811
                  sub          s1, a2, t6
                  xori         s7, gp, -1960
                  div          a0, s11, s7
                  fcvt.w.s     t5, ft0, rne
                  srai         s11, s11, 25
                  srai         a0, a1, 31
                  mulh         zero, gp, t2
                  div          tp, t2, t6
                  slti         sp, a1, 833
                  fdiv.s       fa7, fa6, ft5
                  lui          gp, 1018019
                  mul          a0, s4, a6
                  and          sp, t6, a1
                  srai         s5, s11, 14
                  slt          t6, s10, s10
                  fcvt.wu.s    a3, fs0, rne
                  slti         s7, a7, -983
                  auipc        s7, 660333
                  slt          t3, t1, s6
                  mulhu        a4, s4, a1
                  add          t6, t1, s10
                  fsgnjx.s     fs1, fs10, ft6
                  srl          t4, sp, s7
                  feq.s        zero, fa7, fs6
                  sltu         t6, sp, a3
                  nop
                  fsgnjx.s     ft0, fa4, ft0
                  lui          a2, 702268
                  sltiu        s1, s3, 1306
                  fsgnj.s      fs7, ft4, ft3
                  fsub.s       ft10, ft3, fs1, rdn
                  remu         s11, t4, s10
                  sll          a3, s2, a7
                  flt.s        s10, fa3, fs0
                  sll          s0, t1, zero
                  fmv.w.x      fa0, s5
                  feq.s        s10, fs6, fs3
                  slti         t1, t3, 1414
                  fadd.s       ft5, ft1, fa2
                  fmul.s       ft3, ft7, ft6
                  xori         zero, sp, 811
                  fle.s        t0, fs0, fs5
                  fmin.s       fa5, fs5, fa5
                  rem          t3, s3, t1
                  fmul.s       ft1, fa5, fs7
                  xor          s2, t1, a4
                  sltu         s10, t5, a6
                  feq.s        t6, fs5, fa6
                  lui          a3, 254052
                  addi         t5, s11, 578
                  add          t6, t3, t3
                  fcvt.wu.s    t4, fs7, rtz
                  mulhsu       s1, s1, a3
                  xori         t2, t4, 1857
                  fmax.s       ft0, fs2, fs1
                  andi         s1, s6, -790
                  fcvt.wu.s    s1, fs0, rup
                  and          a0, ra, t3
                  remu         s2, a0, gp
                  xor          tp, zero, s8
                  slti         s6, a6, 1878
                  mulh         a6, a3, a2
                  fsgnjx.s     fs0, ft0, fa7
                  ori          sp, zero, -359
                  fmax.s       ft10, fs6, ft0
                  feq.s        s4, fs5, fs4
                  srai         s5, s4, 18
                  lui          a3, 637786
                  mul          a4, s3, t5
                  fle.s        s9, ft0, fs1
                  fmv.x.w      a3, fa3
                  xori         t1, ra, -462
                  mulhu        a4, zero, a6
                  divu         gp, a0, a4
                  fle.s        t5, ft2, ft0
                  or           s6, t6, s1
                  feq.s        ra, ft10, ft1
                  sra          t6, s0, a1
                  fmax.s       ft6, ft1, fs7
                  andi         s7, s9, -1283
                  srl          s0, a0, s7
                  lui          t5, 323474
                  srli         s8, t0, 20
                  fcvt.s.w     fa0, t3, rtz
                  xori         s6, s6, 589
                  sra          tp, a6, s2
                  fmv.w.x      fa5, t0
                  addi         a5, s8, -1007
                  auipc        a5, 567873
                  fcvt.w.s     t1, fs6
                  remu         s10, s3, sp
                  fmul.s       ft3, fa0, fa3
                  mulhu        t4, s10, s8
                  fmin.s       fs10, ft7, fs10
                  fsgnjn.s     ft1, ft6, fs10
                  divu         s6, t5, t5
                  fsub.s       fs1, ft7, fs7
                  fmv.x.w      s7, fs4
                  slt          s1, s1, t3
                  fsgnj.s      fa3, ft7, ft6
                  srl          t0, zero, a7
                  mulh         s4, s4, a3
                  slt          t0, a4, s0
                  div          s11, t4, s4
                  nop
                  fmul.s       ft9, ft7, ft3
                  nop
                  divu         s6, s8, gp
                  fcvt.s.wu    fs3, zero
                  fclass.s     gp, ft9
                  div          sp, s1, a2
                  xor          a3, s2, t0
                  ori          a5, s5, 1455
                  srai         a6, s9, 5
                  auipc        t1, 800839
                  fmv.x.w      tp, ft10
                  sltiu        t0, a7, -1400
                  sltiu        t2, a5, -1544
                  slti         s4, t0, -477
                  fcvt.s.wu    ft6, t5
                  fcvt.w.s     s5, fs10
                  sll          a0, s4, tp
                  lui          s1, 186014
                  mulh         a5, s11, a7
                  or           t5, a7, t5
                  div          t6, s1, s8
                  fmin.s       fa4, ft0, fs0
                  rem          s8, s4, a5
                  fadd.s       fa1, ft10, fa4
                  sltu         s10, a2, s4
                  sub          t3, s8, a6
                  xor          a6, s11, s5
                  fsgnjx.s     ft5, fs0, ft7
                  fcvt.s.w     fa7, gp
                  fcvt.s.wu    ft4, t4
                  fmin.s       fa5, ft11, ft9
                  andi         t6, s5, -1002
                  fdiv.s       ft1, ft7, ft8, rdn
                  and          a3, t0, s11
                  xor          tp, zero, sp
                  fcvt.w.s     t1, ft10, rne
                  xor          s6, s5, s7
                  mulhsu       t1, a4, gp
                  nop
                  srai         s9, tp, 21
                  fmax.s       fs11, fa3, ft8
                  remu         s4, t6, a1
                  fsub.s       fs9, fa3, ft8, rup
                  feq.s        s6, fs11, fs5
                  divu         t2, s7, t5
                  xori         s0, s10, 1117
                  slt          t6, s1, t0
                  mulh         s5, s2, s4
                  sltu         ra, s7, a6
                  nop
                  flt.s        t0, ft3, fs0
                  fmv.w.x      ft1, zero
                  fcvt.s.wu    ft0, a4, rdn
                  fsgnj.s      fs0, fa1, fa2
                  sll          a4, s4, a3
                  mul          s2, a6, a2
                  fsgnjx.s     fs10, ft7, fs1
                  srli         a3, t3, 30
                  mulh         s9, a4, s9
                  fmv.x.w      s5, fs2
                  mul          s5, s8, s4
                  and          s11, s7, s1
                  slli         s9, t0, 2
                  sltu         s10, zero, s3
                  andi         s9, s9, -710
                  fsgnjn.s     fa7, fa0, fa2
                  fsgnjx.s     ft10, fa7, fs11
                  fle.s        s1, fa4, fs9
                  slli         zero, s7, 15
                  mulh         s1, s3, tp
                  mulh         a2, s9, t0
                  fle.s        s11, ft9, fa2
                  sltiu        s11, a2, 561
                  fclass.s     t2, ft10
                  fadd.s       fs10, ft5, fa3, rup
                  fmul.s       fs11, ft8, ft7
                  addi         s9, s6, -952
                  ori          s0, t5, -1799
                  fcvt.s.w     ft4, s9
                  add          a0, a3, s2
                  fsqrt.s      fs11, fs7
                  fmul.s       ft11, ft5, ft1
                  sll          s8, sp, a1
                  fmin.s       fs4, fs2, ft4
                  auipc        a6, 9925
                  andi         s6, t1, 1136
                  fsgnjx.s     fa1, fa7, fs1
                  xori         s1, s2, -146
                  add          s9, t2, s5
                  divu         s7, sp, a7
                  sll          s8, s8, t5
                  fcvt.wu.s    t5, fs0, rne
                  fle.s        s6, fs4, fs0
                  mulhsu       zero, t1, a2
                  fle.s        zero, fs7, ft11
                  rem          ra, a3, a1
                  sltu         s7, a1, s10
                  nop
                  rem          s10, s8, a2
                  sll          s6, t0, t0
                  sll          s1, s0, a7
                  sub          a0, s2, t4
                  sltiu        t2, t1, 1450
                  divu         s7, s10, a3
                  xor          s8, s5, s6
                  feq.s        a6, fs1, ft6
                  flt.s        a5, fs5, ft3
                  mulhu        t2, a0, a3
                  fadd.s       ft10, fs4, fs0
                  xor          zero, t5, t6
                  or           s9, t3, ra
                  divu         t2, s5, a5
                  slti         t5, t0, -1493
                  fle.s        s4, fs10, ft6
                  srai         tp, a1, 13
                  fle.s        tp, ft3, ft3
                  fsgnj.s      ft1, ft7, fs11
                  fmin.s       ft11, fa6, fa0
                  flt.s        a0, fs8, fs11
                  mul          s2, s10, s9
                  fmin.s       fa6, fs8, fs10
                  fcvt.s.wu    fa3, s9
                  sltu         a6, a2, a4
                  flt.s        a4, ft10, fs7
                  auipc        a6, 34971
                  mul          gp, t1, sp
                  auipc        s2, 359189
                  fmin.s       ft6, fs0, fa6
                  feq.s        s4, fs3, fa1
                  fsub.s       fa6, fs7, ft0
                  lui          s0, 910829
                  fle.s        s8, fs2, fs3
                  divu         sp, s5, a1
                  fadd.s       ft2, fa2, ft5, rmm
                  fmin.s       ft6, fs3, ft11
                  sll          t3, t6, t2
                  sll          s11, s4, zero
                  addi         t0, s11, 1115
                  sra          zero, s6, a3
                  sra          s4, a5, t4
                  fcvt.s.wu    fa3, gp
                  fmul.s       fs10, ft5, fs7, rdn
                  remu         s4, ra, t3
                  slt          s10, s0, s6
                  fsub.s       fs8, fa0, fs4, rup
                  fdiv.s       fs4, fs9, fa4
                  fcvt.wu.s    s7, ft10, rdn
                  mulh         zero, s1, s3
                  fle.s        gp, fs3, ft10
                  fdiv.s       fa3, fa1, ft11
                  fmax.s       fs9, ft6, fa7
                  fcvt.s.w     fa3, t1
                  xori         tp, a5, 151
                  srai         t5, a1, 30
                  xori         a3, a1, 654
                  divu         t1, s9, s3
                  fsgnjx.s     fs9, fa0, ft3
                  mulhsu       s11, a7, s11
                  fclass.s     s10, fs10
                  fdiv.s       fs3, fa2, fs10, rne
                  fclass.s     t4, ft2
                  nop
                  add          t0, zero, s9
                  fsub.s       fa5, ft8, ft1
                  mulh         t4, t3, s3
                  sll          t0, gp, s3
                  xor          s0, s10, t3
                  fsgnjn.s     ft6, fs11, ft6
                  sub          t2, s4, a5
                  xori         gp, t0, -1143
                  fcvt.s.wu    fs6, gp, rtz
                  sra          t1, s5, ra
                  fsgnjx.s     fa6, ft6, fs1
                  fsgnjn.s     ft9, fs2, fs9
                  or           s4, s4, ra
                  and          a6, zero, sp
                  div          t4, gp, a1
                  srai         s11, zero, 11
                  sll          t4, s5, t2
                  mul          t4, zero, a5
                  fsub.s       fa6, fa7, fs0
                  slt          sp, s3, a7
                  fcvt.w.s     t5, fs7, rdn
                  slti         t4, tp, -225
                  fcvt.wu.s    s11, fs4
                  fsgnjx.s     fs4, ft4, fa6
                  fle.s        s2, fa1, ft3
                  fmax.s       fs6, fa7, fs0
                  slti         s0, gp, -996
                  fsgnjx.s     fs6, fs6, ft5
                  fcvt.w.s     zero, fa5
                  or           ra, gp, s9
                  mulh         s1, s3, a3
                  lui          s2, 578008
                  addi         t3, zero, 1304
                  mulh         s10, tp, s3
                  sltiu        t0, t5, -1792
                  or           t2, t1, a3
                  fcvt.s.wu    fs6, t2
                  addi         t2, sp, 1109
                  fcvt.wu.s    s8, ft11, rtz
                  add          s2, s0, sp
                  fsgnjx.s     fa7, fa3, ft7
                  andi         s1, s1, 1125
                  rem          sp, s8, a5
                  fsqrt.s      ft5, fa7
                  fsgnjx.s     fs3, fs8, fa6
                  xori         s4, gp, -754
                  slli         ra, t6, 2
                  fsqrt.s      fs1, ft9
                  auipc        s2, 22200
                  nop
                  remu         s1, a3, a7
                  mul          sp, gp, a2
                  fcvt.s.wu    ft0, s11, rne
                  xori         a0, ra, -1992
                  fsqrt.s      fa1, fs10, rtz
                  fadd.s       ft0, ft4, ft5
                  fmv.w.x      fs1, t6
                  xor          t1, s10, s0
                  mulh         t3, s6, s7
                  slli         s8, gp, 15
                  fsgnjn.s     fs0, ft2, ft5
                  fsqrt.s      fs8, fs6, rmm
                  add          a3, s8, sp
                  mulhsu       a0, t5, s2
                  lui          a3, 403094
                  fmv.x.w      t6, fs2
                  slt          s8, t6, s8
                  fmin.s       fs0, fs8, ft1
                  sll          s9, a1, s9
                  fmax.s       ft6, fs4, ft7
                  or           a4, a1, t3
                  add          tp, a0, t5
                  feq.s        a0, fs4, ft7
                  mulhsu       a5, s2, tp
                  sub          a6, s7, s10
                  auipc        t1, 751524
                  fsub.s       ft10, fs6, fs0
                  mulhsu       s7, s1, s6
                  mulhsu       s7, s9, a5
                  srl          a2, a0, a6
                  add          a2, a7, a0
                  fmv.w.x      fa1, zero
                  sltiu        s2, t2, -1505
                  fmin.s       fs7, ft9, ft3
                  fcvt.s.w     fs4, t3, rmm
                  fclass.s     s1, ft2
                  xori         s1, ra, -974
                  fsgnj.s      fs7, ft6, fs3
                  divu         s1, tp, a7
                  fdiv.s       ft2, fs2, fs4
                  mulh         s10, s5, a7
                  fsgnj.s      fs4, fa2, fs11
                  remu         s5, tp, a0
                  fsgnj.s      fs9, fa2, fa3
                  div          gp, sp, a6
                  fcvt.w.s     s2, ft0
                  fmin.s       fa3, fa1, fs10
                  sltu         a2, zero, t6
                  fsgnj.s      ft10, fs0, ft1
                  addi         a5, t2, 1073
                  srli         s5, t1, 27
                  flt.s        zero, fa2, ft6
                  ori          t2, s1, -1189
                  fsgnjn.s     fa5, ft1, fs5
                  fclass.s     s7, fa2
                  srai         t4, s4, 21
                  fcvt.s.w     ft9, a1, rup
                  fcvt.wu.s    a6, fs0
                  sra          s8, a7, s8
                  mulhsu       t6, ra, s11
                  sub          s10, gp, ra
                  srli         a3, zero, 18
                  slti         a5, s0, 1775
                  xor          t2, a4, s11
                  fmul.s       ft3, fa6, ft1, rup
                  slli         s11, t1, 29
                  fcvt.s.wu    fs4, s5, rdn
                  flt.s        gp, fs5, ft6
                  fclass.s     a0, ft1
                  fmul.s       fs2, fa4, fs0
                  fmax.s       fs1, ft5, ft5
                  fadd.s       fa4, fs11, fs4
                  mulhsu       s9, s10, ra
                  mul          s4, t3, s5
                  xor          t4, s4, a3
                  flt.s        gp, fs9, ft11
                  xor          s1, tp, a3
                  fmul.s       ft4, fs9, fs11
                  mulh         t0, a1, a6
                  fmin.s       fs3, ft5, ft8
                  mulh         t4, t6, a4
                  nop
                  fmax.s       fs3, ft1, fs2
                  and          a2, s0, a7
                  andi         ra, s10, 245
                  andi         sp, s11, -1846
                  div          t6, a5, s8
                  nop
                  fmul.s       fa3, fs8, fs3, rdn
                  mul          s2, t4, s8
                  slt          s11, s11, a6
                  feq.s        gp, ft6, fs8
                  fcvt.s.wu    fs7, s6
                  fmax.s       fa3, ft5, ft11
                  slt          ra, sp, s10
                  lui          s9, 273480
                  fadd.s       fa4, fs10, ft3, rup
                  fmax.s       fa3, fa2, fs1
                  andi         s2, a3, -1257
                  fcvt.s.wu    ft10, s5
                  fmul.s       fa6, fs10, fa7, rne
                  fcvt.w.s     tp, fa4, rup
                  sra          a5, t0, s8
                  fcvt.s.w     fa6, ra
                  rem          s5, t5, s7
                  addi         t4, s8, -2039
                  fcvt.wu.s    s2, fs6, rmm
                  fmax.s       fa3, fs0, ft10
                  fle.s        s0, fa1, fa2
                  fclass.s     a0, fs0
                  flt.s        t0, fs10, ft8
                  rem          ra, s1, t2
                  remu         a6, t0, a4
                  srli         ra, sp, 17
                  flt.s        t5, ft6, ft3
                  nop
                  add          s8, t4, t0
                  fsgnjx.s     fs2, fa3, fs9
                  fmin.s       fa1, ft4, fs11
                  fsub.s       ft1, fs3, ft7, rup
                  auipc        s7, 763827
                  fmv.w.x      fs2, gp
                  fdiv.s       ft9, fa5, fs9
                  srl          ra, s10, s8
                  div          sp, s7, a1
                  or           s9, s5, t2
                  rem          t0, t0, ra
                  fclass.s     s4, fs11
                  fcvt.s.w     fs10, a0, rup
                  slli         s0, s3, 24
                  fsgnjn.s     fa4, fs11, fs4
                  fmul.s       fs4, fs9, ft7
                  sub          t6, s0, t1
                  remu         t1, tp, s1
                  slli         a5, s3, 19
                  fmv.x.w      a3, ft10
                  rem          s8, s9, s5
                  srai         s10, a4, 2
                  sub          a6, tp, s3
                  mulhu        a6, zero, s10
                  xori         s10, a5, 178
                  slti         s8, a5, -585
                  fmul.s       fs11, ft8, fs10
                  sltiu        s11, s10, -158
                  ori          ra, s7, 1035
                  fcvt.w.s     t0, fa6
                  fmv.x.w      ra, fs6
                  mulhsu       s0, s9, tp
                  remu         a4, t6, s5
                  auipc        a0, 1003104
                  srl          s9, ra, a6
                  fmv.x.w      zero, ft4
                  mul          ra, t5, zero
                  fmin.s       fa0, fa4, fa7
                  remu         s8, a6, a4
                  slli         s5, s1, 29
                  sltiu        tp, t0, 1605
                  srai         a2, zero, 21
                  fmin.s       ft3, fs0, ft3
                  fmv.x.w      s6, fs3
                  lui          ra, 494712
                  fsqrt.s      fa0, fa7
                  sll          zero, a4, s0
                  add          t6, s2, zero
                  fsub.s       fs7, fs7, fa4, rup
                  slli         s1, a7, 12
                  slli         s10, s1, 22
                  fsgnj.s      ft4, fa3, fa7
                  mul          s10, t4, a7
                  fmv.x.w      a5, ft9
                  slli         tp, s3, 11
                  nop
                  fcvt.s.w     fa2, a0
                  mulhu        t5, t4, zero
                  fsub.s       fs10, fa5, ft6
                  sltiu        a5, t3, 303
                  sltu         tp, a5, s11
                  divu         s9, a3, tp
                  add          tp, zero, s1
                  sll          t3, t3, a4
                  fclass.s     s6, fa0
                  addi         a3, s3, -1913
                  slt          zero, zero, t2
                  add          s5, a1, sp
                  addi         a2, a6, -257
                  mul          t3, sp, a0
                  sll          s0, s7, s3
                  fmul.s       fs8, fa3, ft5
                  feq.s        t2, ft7, ft11
                  sra          s10, ra, s9
                  fle.s        s10, fs2, fs5
                  fsub.s       fa3, fs11, fa7
                  xor          s9, a2, s4
                  fsgnjx.s     fs9, ft4, ft6
                  addi         t3, t4, -1115
                  ori          t4, t6, -321
                  rem          a6, s2, t2
                  flt.s        a0, fa7, ft2
                  fmv.x.w      s8, fs6
                  srl          s9, t4, a1
                  and          t2, a1, t1
                  fsgnjn.s     fs0, fa7, fs7
                  srl          s9, gp, s0
                  add          t2, t6, s1
                  slt          t1, zero, a4
                  sltu         s11, sp, s8
                  xor          s7, t6, s6
                  auipc        s7, 996255
                  mulh         ra, t6, s3
                  sll          a6, s10, a7
                  add          s7, s3, s8
                  fsub.s       ft0, fa1, fa1, rtz
                  fsgnjn.s     fs4, ft0, ft9
                  fclass.s     s9, fs5
                  fsgnjn.s     fs0, fs11, fs10
                  auipc        s10, 538019
                  fsgnjx.s     fs7, ft9, ft4
                  srl          gp, a0, t6
                  fmax.s       fs8, fa1, fs4
                  and          t0, a3, sp
                  mulhu        s4, zero, t5
                  sub          t2, sp, a5
                  slli         a5, a4, 17
                  fmv.w.x      ft10, s5
                  or           t4, s4, s8
                  xori         s0, gp, 159
                  sub          s4, s8, t4
                  ori          ra, s1, 956
                  mulhu        s2, t0, s0
                  fsqrt.s      ft4, fs7, rtz
                  rem          a3, s4, t5
                  srai         s7, a7, 4
                  srai         s5, a3, 13
                  fcvt.s.wu    ft11, s8, rup
                  rem          t1, t6, s6
                  fmv.x.w      s4, ft6
                  fadd.s       fs4, fa5, ft6, rup
                  mulhsu       s9, s7, s5
                  fclass.s     s0, fs6
                  fsgnj.s      fs5, fs4, ft10
                  sub          t6, s6, a5
                  fsqrt.s      fs5, fa6, rtz
                  fmin.s       fa0, ft4, fa2
                  xor          a2, t3, s8
                  fdiv.s       fs3, ft1, ft11
                  fcvt.wu.s    t5, fs6
                  addi         s5, s2, 1475
                  divu         t4, a5, tp
                  rem          s9, s11, s0
                  fsgnj.s      fs8, fs3, fs0
                  fsgnjx.s     ft9, fs8, fs2
                  divu         s9, s2, s8
                  auipc        a6, 819663
                  sll          s1, s0, s7
                  ori          a2, t3, -1869
                  remu         t4, s10, a0
                  sub          a4, s9, s0
                  ori          a0, s9, -1375
                  fsub.s       fa1, fs10, fa7, rmm
                  srai         a6, s11, 13
                  fsgnjn.s     ft2, ft3, fs0
                  xori         sp, a5, -666
                  fsgnj.s      fa3, fa7, ft1
                  mulhu        s0, s4, a2
                  fdiv.s       fs2, ft0, fs2
                  fsgnjx.s     fa4, fa2, ft7
                  sll          t5, s4, a1
                  lui          a6, 564392
                  sll          s8, a5, s8
                  addi         t6, s3, 1711
                  mulhsu       a6, t4, a2
                  rem          s10, tp, t1
                  slli         gp, a1, 15
                  divu         t0, ra, s2
                  remu         t3, t5, a5
                  fmax.s       fa4, ft2, ft8
                  srai         s5, sp, 5
                  fcvt.w.s     a4, ft9
                  slt          a0, s10, zero
                  slti         s0, ra, -108
                  fcvt.s.w     ft9, sp, rtz
                  addi         tp, ra, 1122
                  xori         a6, t0, -1590
                  fle.s        s5, ft1, ft7
                  sltu         t3, t0, s1
                  rem          t4, s5, t0
                  slti         t6, sp, -1199
                  fcvt.w.s     ra, ft4
                  fcvt.w.s     a4, fa2, rmm
                  fsub.s       ft9, fs7, fs8
                  ori          tp, ra, 1440
                  fcvt.s.w     ft6, a6
                  sltiu        gp, s6, 964
                  fadd.s       fs0, ft4, ft2
                  mul          s11, a3, a3
                  nop
                  srl          t3, a2, s10
                  fsqrt.s      fs2, fa0
                  slli         s4, a6, 19
                  mulh         t2, sp, s11
                  sltu         s6, s7, a1
                  slli         a5, s7, 19
                  fsgnjx.s     ft8, ft0, fs7
                  fsub.s       fa3, fa1, ft3
                  mul          t3, t4, zero
                  srli         s7, t3, 29
                  ori          s9, a3, -1306
                  fmv.w.x      fa1, a5
                  lui          a3, 486541
                  fsgnjx.s     ft1, fa7, fa6
                  divu         s5, s9, t2
                  slt          t5, zero, t4
                  andi         t5, zero, -1804
                  fsgnjx.s     fa2, fs3, fa4
                  addi         a6, s8, 1445
                  fclass.s     s1, ft6
                  fsgnj.s      fs10, fa3, fs8
                  fdiv.s       fs1, ft9, fs10
                  add          s11, s11, s3
                  fcvt.s.wu    ft9, a7, rup
                  sub          t3, t6, t5
                  fmv.w.x      fa2, zero
                  sltu         sp, gp, sp
                  xori         a5, s8, -124
                  fcvt.w.s     s6, fs0, rne
                  ori          a0, t2, 1014
                  fcvt.s.w     fs2, t4
                  fcvt.w.s     a2, fs7
                  divu         t6, s7, t6
                  fcvt.s.w     fa4, sp, rmm
                  add          t0, s2, gp
                  divu         s2, s4, ra
                  fmax.s       fa2, fs7, fa6
                  mulh         s0, t3, s10
                  or           sp, t1, s0
                  fsub.s       fs4, fs0, fa4
                  fclass.s     a6, fs6
                  feq.s        s5, fs10, fs0
                  remu         gp, sp, sp
                  div          t0, s3, s7
                  fsqrt.s      fa5, fs5
                  sra          t0, gp, t4
                  fsgnjn.s     ft2, fa2, fs11
                  fmul.s       ft9, ft2, fa7, rdn
                  fcvt.s.w     fa5, t0
                  fsub.s       ft2, ft10, fs4
                  and          s1, ra, s1
                  divu         gp, s11, t2
                  lui          t4, 413690
                  remu         t0, a0, a4
                  xori         a2, s9, -1693
                  feq.s        a2, fs6, fs11
                  divu         t0, s0, tp
                  fsgnj.s      fs4, fs6, ft11
                  srl          s5, a2, s6
                  or           s2, ra, s11
                  fcvt.wu.s    sp, fs6, rdn
                  mulh         a5, gp, t2
                  fcvt.w.s     t4, fs11
                  srl          s9, s0, s2
                  fclass.s     a4, fa0
                  fmul.s       ft9, ft7, ft8
                  or           a4, s0, s5
                  fle.s        tp, fa2, fa1
                  slt          t6, s9, zero
                  mulhu        zero, s10, a4
                  srli         s5, t3, 13
                  fsub.s       ft4, fs4, ft2, rmm
                  or           t1, s6, zero
                  and          a4, s6, t6
                  and          t4, s11, s3
                  ori          t6, a5, -1863
                  mulhsu       s6, s3, s9
                  fadd.s       fs7, ft7, fs0, rdn
                  flt.s        s2, fs0, ft2
                  ori          s6, tp, 200
                  srli         s2, t4, 17
                  fmax.s       fa0, fs5, ft10
                  fcvt.s.w     ft10, s9
                  sll          t4, s7, s3
                  slt          s5, ra, gp
                  add          t3, t4, tp
                  fcvt.s.w     fa5, ra, rdn
                  fmul.s       ft5, fs2, ft6, rdn
                  fmax.s       fa3, fs8, fs10
                  flt.s        t4, fa5, ft5
                  mulhsu       t5, zero, s9
                  nop
                  fcvt.w.s     a2, ft9
                  fsub.s       ft11, fs7, ft3, rup
                  fsgnjn.s     ft1, fa6, fs3
                  ori          t3, t4, -370
                  srl          s4, ra, ra
                  sub          a2, t6, s3
                  fcvt.wu.s    s11, ft10, rne
                  fmax.s       ft9, fs7, fs7
                  slti         s11, t5, 1076
                  divu         sp, t3, s7
                  fcvt.wu.s    s9, ft6, rne
                  slti         s4, t6, -703
                  sll          a5, a1, a5
                  add          s5, gp, a5
                  sltiu        t3, t0, 149
                  fmax.s       ft3, fa0, fs4
                  fcvt.w.s     s7, fs6, rup
                  fcvt.wu.s    a3, ft0
                  fdiv.s       fs1, fs8, ft0, rmm
                  mul          s0, gp, s7
                  div          a6, t3, a0
                  srli         t5, zero, 27
                  srai         a4, t4, 2
                  slli         s6, ra, 18
                  fmax.s       ft5, fs2, fa7
                  sltu         t2, t6, t3
                  fclass.s     t3, ft9
                  slti         s2, s9, 103
                  srli         a4, a4, 21
                  fcvt.s.wu    fs1, s3, rup
                  xori         sp, s7, 1123
                  slt          a0, t5, a6
                  srli         s10, s7, 16
                  feq.s        s11, fs9, fa5
                  sltiu        s2, a7, -234
                  fmin.s       fs10, fa3, ft11
                  fdiv.s       fs5, fa2, ft3, rne
                  fadd.s       fa4, ft8, fa1
                  fmin.s       ft4, ft2, fs5
                  fclass.s     ra, ft0
                  and          t4, a3, s9
                  fsgnjn.s     ft5, fs1, fs4
                  fmin.s       ft7, ft6, ft10
                  sub          t6, sp, s11
                  srai         s6, t2, 12
                  fmul.s       ft7, fa4, fs8, rne
                  mulhsu       s0, s4, s10
                  fmv.x.w      s7, fs9
                  srl          s5, s2, t0
                  sra          a0, s8, zero
                  fsqrt.s      ft4, fs8
                  mulhu        a2, a6, t3
                  fcvt.wu.s    zero, fa5, rne
                  ori          a3, a1, 687
                  andi         ra, t0, 428
                  fcvt.wu.s    a6, fs7, rmm
                  srai         s4, sp, 17
                  xori         a4, a2, 968
                  slli         zero, s11, 21
                  xori         gp, s3, -355
                  fmin.s       fs0, fs11, fs9
                  fmax.s       fa7, fs4, fs0
                  andi         s9, a0, 150
                  sub          a5, a5, t3
                  nop
                  fsgnjn.s     fs3, ft5, fs2
                  ori          t5, s7, 1611
                  rem          s7, t5, t2
                  fmax.s       fs3, fa7, fa3
                  lui          t2, 421405
                  fsub.s       fs10, ft8, ft2
                  fmv.x.w      s11, fa5
                  fsub.s       ft1, ft5, fa2, rup
                  slli         a3, t0, 17
                  fsgnj.s      fs2, fs11, ft1
                  mulh         a5, s10, a4
                  mulhsu       s0, s5, a7
                  ori          a4, t0, 1559
                  auipc        s11, 857663
                  flt.s        s6, fs2, fa3
                  fcvt.w.s     s9, fs3, rup
                  fcvt.s.wu    fs4, t3
                  div          sp, a5, t2
                  srai         t1, a7, 10
                  addi         s5, t3, -1781
                  fle.s        s5, ft0, fa7
                  fclass.s     t0, fa0
                  divu         t4, s5, s5
                  sub          a6, a1, s8
                  or           t0, a7, a5
                  addi         a4, t0, 450
                  fcvt.s.w     fa7, s10, rne
                  remu         a3, a6, t1
                  andi         s1, t2, -227
                  rem          s6, ra, a3
                  divu         t0, s11, t1
                  sra          a5, sp, tp
                  srai         a0, a5, 14
                  fadd.s       fs5, ft4, fa4
                  slt          a2, a1, s10
                  fadd.s       fa3, fs6, fa7, rne
                  sra          s4, s11, zero
                  fclass.s     t3, fa1
                  lui          ra, 23430
                  srai         s10, s8, 10
                  fsub.s       ft5, fs9, fa2, rup
                  andi         t5, s0, -332
                  and          s7, s0, t0
                  xori         a6, a4, -34
                  fsub.s       ft1, ft4, fs10
                  flt.s        t1, fs9, fs9
                  srli         s7, s8, 29
                  divu         tp, t2, a1
                  fcvt.wu.s    t0, fs4
                  fsqrt.s      ft6, ft10
                  sltu         sp, s2, s11
                  rem          s2, a3, s2
                  fcvt.s.w     fs5, s2, rup
                  fcvt.w.s     s8, fs1, rne
                  fcvt.wu.s    a3, fs7, rne
                  ori          t6, a2, -1309
                  div          t1, s11, t4
                  fdiv.s       fs9, fs6, fa7
                  sll          s9, t3, s0
                  div          t1, t1, a3
                  xor          gp, s0, a5
                  mulhu        s11, tp, sp
                  div          t3, s0, s11
                  addi         a3, s1, -1949
                  mulhsu       t6, s11, a6
                  fmv.x.w      s10, ft0
                  fmax.s       ft5, fs3, ft9
                  fmul.s       fa6, ft11, fa2, rtz
                  mulhsu       s8, s10, t2
                  mulhsu       ra, s0, tp
                  slt          a4, a6, a7
                  mulhsu       s9, t1, a1
                  fmul.s       ft6, fs3, ft11
                  fmv.x.w      s7, ft0
                  slli         ra, s4, 8
                  mulhu        ra, s2, t6
                  fmin.s       fs3, fs7, fa5
                  fcvt.s.wu    fa6, s9, rup
                  rem          sp, a4, a1
                  flt.s        t2, fs0, fs5
                  fsqrt.s      ft1, fa3, rne
                  nop
                  srli         a6, a7, 31
                  mulh         ra, s4, t5
                  fsub.s       ft4, ft3, fa0, rmm
                  or           t6, t2, a4
                  fsgnjx.s     fs9, fa5, fs11
                  fmv.x.w      zero, fs1
                  fmv.w.x      ft11, s1
                  feq.s        t4, ft2, fs7
                  fle.s        s7, ft0, ft10
                  sub          a2, t1, t0
                  srli         sp, s0, 14
                  fle.s        a3, fa0, fa6
                  fsub.s       fs3, fs5, ft4
                  fmv.x.w      s7, ft6
                  mulh         t2, s10, tp
                  slli         t4, a5, 24
                  div          a4, s2, t2
                  mul          s1, s11, zero
                  fdiv.s       ft4, fa1, fa0
                  sub          a0, a6, s11
                  add          s1, s10, sp
                  fsqrt.s      ft7, fs3
                  auipc        s1, 252967
                  and          s8, s2, ra
                  fcvt.wu.s    a3, fs4
                  mulhsu       s9, t1, t3
                  srai         tp, s6, 30
                  or           a2, s1, t0
                  andi         s9, s0, -522
                  fsqrt.s      ft0, ft0, rne
                  sll          a4, gp, tp
                  srli         s11, tp, 11
                  slti         s1, s1, -1137
                  mulhu        a4, s1, gp
                  remu         gp, a3, s5
                  andi         a3, t3, 1475
                  addi         a3, a5, -1209
                  fmv.x.w      s9, ft1
                  feq.s        s4, fa4, fa7
                  ori          a3, s3, 669
                  fmul.s       fs0, fs9, fs5, rtz
                  slt          a4, t4, gp
                  fadd.s       ft6, ft1, fa5, rdn
                  xor          s9, a5, t3
                  fmax.s       fa4, fa1, fa7
                  lui          s9, 448053
                  fsgnjx.s     fs9, fs9, fa6
                  ori          s8, s0, -812
                  sltu         s8, sp, tp
                  slti         s2, s1, -1936
                  divu         s1, zero, gp
                  fmv.x.w      s7, fs7
                  slt          t5, s1, sp
                  fmv.w.x      ft6, s10
                  auipc        t5, 589777
                  mulhsu       s2, ra, t2
                  sltu         t3, s3, a0
                  fle.s        a4, fa2, ft8
                  lui          s10, 290257
                  addi         s0, t0, -1444
                  mulhu        a2, s1, a4
                  sra          zero, s0, zero
                  fcvt.s.w     fa6, t1, rne
                  rem          s2, s4, s5
                  add          gp, t1, a7
                  sltiu        s2, a6, 415
                  or           s8, s1, a5
                  fle.s        zero, ft2, fa6
                  fmul.s       fs5, fa4, fs3
                  xor          a0, s0, ra
                  fcvt.wu.s    a0, fs3
                  or           s0, t3, s7
                  mulh         a4, a5, a0
                  sltiu        s11, a0, 280
                  mulhsu       t2, gp, s6
                  addi         a3, s5, -125
                  slti         tp, s0, 1595
                  auipc        s8, 780267
                  mulhsu       t5, s10, sp
                  slt          s2, s7, gp
                  sltu         t6, t0, s4
                  andi         a5, s6, 104
                  div          s1, gp, a5
                  fmax.s       ft9, fs8, ft9
                  sltiu        s8, s2, 1183
                  lui          s10, 356178
                  fcvt.s.wu    ft4, ra, rmm
                  srli         sp, s3, 25
                  fmin.s       ft1, ft9, ft2
                  mulhsu       t6, a7, t3
                  fmul.s       fs1, fa2, fs9, rdn
                  div          sp, t0, a5
                  fsgnjx.s     fs4, fs2, ft0
                  fcvt.wu.s    sp, fa4, rmm
                  feq.s        a3, fs11, fs9
                  nop
                  sltiu        t4, s9, -607
                  flt.s        s7, ft6, fa1
                  srai         gp, a6, 9
                  fdiv.s       ft4, ft10, fa5
                  slti         s8, a2, -763
                  fcvt.w.s     a4, fs10, rdn
                  or           s8, s3, t3
                  fdiv.s       fa6, fs11, fs9
                  sltu         s1, s1, a5
                  fsub.s       ft5, ft5, fs3
                  andi         s4, a4, -1005
                  xor          s2, t3, t3
                  xor          ra, a0, a5
                  fsqrt.s      fs9, fs5
                  div          sp, s5, s11
                  fsub.s       fs10, ft7, ft11
                  mulhsu       t1, s3, s2
                  fmin.s       fa3, ft5, ft11
                  add          a4, a0, s7
                  andi         t1, a4, -810
                  divu         s8, s2, a0
                  fcvt.s.wu    ft7, a7
                  fcvt.s.w     ft0, gp, rmm
                  fmin.s       fs2, fa6, fa3
                  fcvt.s.w     ft6, a6, rdn
                  divu         t5, s5, s10
                  remu         s10, a6, t2
                  fcvt.s.w     fa6, t6
                  sra          a5, s6, sp
                  fcvt.wu.s    s7, fs9, rtz
                  srai         sp, s1, 2
                  sltu         s1, a5, s2
                  srli         s5, s6, 27
                  fsqrt.s      fs5, ft8
                  slt          t6, s4, s2
                  fclass.s     t3, ft5
                  fdiv.s       ft5, ft10, ft11
                  auipc        s10, 629356
                  fdiv.s       fs9, fa3, fs5
                  fcvt.s.w     ft11, s4, rmm
                  fmv.x.w      t0, ft9
                  slti         t3, a1, -481
                  srl          s1, t6, s7
                  slli         gp, s10, 14
                  div          tp, s0, sp
                  fle.s        s4, fs6, fs2
                  slti         s11, ra, 1551
                  fmin.s       fa6, ft0, fs0
                  srli         s10, t5, 25
                  slli         s6, s11, 10
                  mulhu        sp, s10, s7
                  flt.s        t1, ft7, fa2
                  sltu         t5, ra, s6
                  slt          s6, s0, s5
                  fmin.s       fs9, fa0, fa1
                  sra          s0, t4, zero
                  divu         s0, s0, t4
                  fcvt.w.s     gp, fa3, rup
                  xor          t4, s6, a5
                  or           s10, gp, s1
                  and          s0, s3, s11
                  rem          t0, t3, s10
                  fadd.s       fa2, ft6, fs6, rmm
                  fmv.x.w      gp, fs10
                  fcvt.s.wu    fa2, t3
                  mulh         sp, gp, s0
                  ori          a0, t6, 1795
                  fcvt.s.w     fs6, a6
                  fle.s        gp, ft10, fs7
                  srai         s2, sp, 15
                  fsgnjx.s     fs7, ft11, ft10
                  fmax.s       ft1, fs4, fa6
                  fsub.s       ft1, fs10, fs0, rmm
                  sub          s0, a5, s11
                  slt          t5, s5, sp
                  fsgnjx.s     ft0, ft6, ft10
                  fmax.s       fa2, fs3, ft7
                  mulhsu       s11, s1, zero
                  slt          a5, a5, s9
                  auipc        a2, 354891
                  fsgnjn.s     ft8, ft3, ft2
                  or           tp, a0, a2
                  fmul.s       fs0, fs3, fs4
                  mulhu        a3, s6, a5
                  fcvt.w.s     sp, ft8
                  srai         s5, s5, 25
                  fmv.x.w      s0, ft5
                  fle.s        tp, ft8, ft9
                  srl          s7, s6, s10
                  or           s0, s5, s5
                  ori          ra, t0, 1864
                  fsqrt.s      fs2, fs10
                  fcvt.w.s     s5, ft11, rne
                  div          s0, a3, s4
                  or           s2, a5, s10
                  addi         s10, t1, 28
                  fsub.s       fa5, fa6, fa3, rdn
                  lui          gp, 133895
                  sltiu        a6, s1, 562
                  mulhsu       a3, a6, s10
                  xor          t5, a3, zero
                  slli         t5, s7, 10
                  nop
                  fcvt.s.w     fs9, zero, rup
                  fcvt.s.wu    ft10, a5
                  fle.s        gp, fs8, ft10
                  addi         s10, a3, 1474
                  slti         ra, s0, 595
                  xori         gp, t6, -494
                  nop
                  divu         s6, a3, s4
                  andi         s10, s8, -765
                  addi         t2, s11, 593
                  mulhsu       a4, s0, s0
                  fcvt.w.s     s1, fa2
                  fsgnjx.s     ft6, ft9, fa4
                  rem          s5, s8, t4
                  lui          t2, 975643
                  fmv.w.x      fs0, ra
                  auipc        a5, 309454
                  fsgnjx.s     ft5, fs1, fa2
                  fle.s        t6, fa4, fs11
                  fsgnjx.s     fs10, fs0, fs7
                  mulh         t4, gp, tp
                  nop
                  feq.s        s5, fs0, ft7
                  xor          a4, s10, t4
                  srl          s2, t3, tp
                  mulhsu       tp, t4, s6
                  nop
                  lui          t3, 283120
                  fmax.s       ft2, fa3, ft4
                  mulhsu       tp, gp, s4
                  add          t4, s6, a3
                  fmin.s       fs9, fa2, ft8
                  sll          s4, s7, t6
                  slli         s8, s3, 7
                  fadd.s       ft4, ft7, ft7, rup
                  srai         ra, s8, 23
                  sub          s2, t2, s10
                  sltu         sp, a7, a5
                  fsub.s       fs2, fs7, fs7
                  addi         a6, a1, -1680
                  add          a3, gp, s2
                  fcvt.s.w     fs3, a1
                  mulhu        s5, ra, a2
                  sltu         s4, a2, a6
                  or           t3, s4, s6
                  fclass.s     gp, fa2
                  slli         zero, s4, 26
                  mulhu        s5, s5, a7
                  rem          s1, a1, t3
                  fmv.x.w      a3, fa0
                  slt          zero, s11, t4
                  fmv.w.x      fs8, gp
                  fle.s        a2, fa3, ft6
                  or           a4, s3, t5
                  fcvt.wu.s    s0, ft2
                  fcvt.w.s     t4, fa5
                  fmax.s       ft3, fs3, ft10
                  fadd.s       ft9, fa5, fa5, rdn
                  slli         t5, ra, 22
                  xori         s7, a5, 531
                  fsgnjx.s     fs10, ft1, ft7
                  divu         t1, s6, t2
                  auipc        s0, 40127
                  mul          t2, ra, zero
                  nop
                  or           s1, t5, s1
                  divu         a0, t6, s4
                  fmv.x.w      ra, fs10
                  sub          t4, gp, a1
                  ori          t4, s3, 845
                  fcvt.s.wu    fa2, gp, rdn
                  fsqrt.s      fs8, fa2
                  or           a4, t3, s1
                  nop
                  mulhu        gp, a2, t3
                  rem          a5, s6, s0
                  xori         s4, a7, -1682
                  nop
                  fcvt.wu.s    s0, fs7
                  fsub.s       fs1, ft2, ft7
                  and          t2, s11, a1
                  fdiv.s       fs0, ft2, ft1
                  feq.s        s10, fs6, ft2
                  mulh         t5, s9, a2
                  sltu         t5, t3, gp
                  sltiu        s7, sp, 1073
                  mulh         s9, a2, t5
                  fcvt.s.wu    fs7, a5, rmm
                  ori          t1, s3, -2030
                  feq.s        t4, fa7, ft11
                  fsgnj.s      ft0, fs5, fs2
                  fclass.s     s7, ft6
                  fsub.s       fs8, fs3, fa7, rup
                  fmul.s       ft1, ft9, fa7, rne
                  srl          gp, a0, a5
                  ori          s2, gp, 1633
                  fsgnj.s      ft5, fa1, ft3
                  sra          s2, s1, s6
                  fdiv.s       fs2, ft4, fa7, rup
                  srli         t2, a4, 4
                  mulhu        s5, t4, a7
                  rem          t4, a2, t2
                  or           sp, s7, t0
                  sltu         s0, s3, s10
                  fsgnjx.s     fa2, ft7, fs2
                  fadd.s       ft5, fa0, ft6
                  sltu         a5, a5, t2
                  mulhsu       tp, s9, t4
                  slti         t1, s0, 1103
                  srli         t4, s7, 9
                  divu         s9, t6, s11
                  ori          zero, a1, -1736
                  ori          a2, s8, -1940
                  fmv.x.w      a3, fs9
                  fmax.s       ft7, fa6, fs7
                  flt.s        t1, fs6, fs1
                  fmul.s       ft5, ft10, ft1
                  fle.s        t4, fs5, fa6
                  fdiv.s       ft4, fa2, fa0
                  fle.s        t4, ft10, fa5
                  fsgnj.s      fs0, fs4, ft6
                  lui          s0, 627243
                  fclass.s     a2, fs3
                  srli         s4, t0, 31
                  mul          s6, a3, a5
                  fsub.s       fs10, ft7, fs1
                  xor          s8, zero, zero
                  fadd.s       fs3, ft6, ft10
                  slt          t2, s2, a3
                  fcvt.w.s     a6, ft7, rne
                  fcvt.s.w     fa7, a3
                  fcvt.w.s     tp, ft9
                  fmax.s       ft3, fs4, fs6
                  sltu         s7, s2, t5
                  mulhsu       t0, s9, a7
                  rem          s9, s2, s3
                  fclass.s     tp, ft2
                  slti         sp, t0, 726
                  nop
                  nop
                  sll          t1, s0, s3
                  divu         a2, a0, a5
                  fdiv.s       fs3, ft3, ft6
                  fsgnjn.s     fs10, ft4, ft4
                  srli         t5, s3, 4
                  fle.s        s10, fs0, fa6
                  slli         s10, t4, 18
                  feq.s        a4, ft0, ft1
                  divu         t4, a2, t0
                  remu         a6, a3, a0
                  or           tp, s3, t5
                  fmv.w.x      ft5, s11
                  sltiu        t2, s8, 97
                  srl          s2, t0, s8
                  fsqrt.s      fs7, fs2
                  divu         t1, tp, t0
                  sub          a6, s9, zero
                  add          zero, t0, a4
                  sub          s10, s1, s4
                  fsgnj.s      ft7, fa1, fs7
                  fsqrt.s      fs0, fs10, rup
                  xori         a6, zero, -1175
                  fclass.s     s10, fa5
                  fmul.s       fs4, fa2, ft7
                  remu         zero, t1, a7
                  fmv.w.x      ft3, s7
                  xori         t1, t0, 1788
                  addi         t6, a3, -435
                  fle.s        t1, ft1, ft2
                  flt.s        tp, ft3, fs6
                  fmv.w.x      ft8, t3
                  sra          t6, s6, t4
                  feq.s        sp, fs0, fs5
                  fmin.s       fs5, fa1, ft6
                  fsgnjx.s     ft7, ft3, ft11
                  nop
                  fsqrt.s      fs6, ft3, rne
                  fle.s        s8, ft3, fa2
                  fclass.s     s0, fa4
                  nop
                  nop
                  fmax.s       ft6, fs0, fs6
                  fsgnjn.s     fa3, fs10, fs6
                  addi         sp, a1, -1609
                  or           s10, s8, zero
                  nop
                  or           s0, a3, a1
                  fsgnj.s      fs4, ft11, fa5
                  sltiu        ra, tp, 1184
                  ori          s11, s7, 1852
                  nop
                  fsgnj.s      ft11, ft0, fs2
                  rem          sp, s2, a3
                  xori         t3, t1, 465
                  fadd.s       fs11, fs7, fa0, rup
                  sra          a4, s6, sp
                  div          t2, zero, a4
                  fcvt.w.s     s10, fs5, rdn
                  fsgnjn.s     fa6, ft4, ft8
                  fmin.s       fs0, ft8, ft6
                  sub          s11, t0, s6
                  xor          zero, sp, s4
                  xori         t5, ra, 1995
                  and          s2, s0, a1
                  srai         s2, a5, 30
                  mulhu        s9, s9, a4
                  fle.s        a0, fa7, ft0
                  flt.s        s8, ft5, ft10
                  sltiu        t0, s6, 403
                  feq.s        zero, fs11, fs3
                  fsgnj.s      fa6, fa0, fa2
                  srli         t0, s1, 3
                  or           s6, t1, a6
                  mulhsu       s4, s2, t1
                  srai         s7, tp, 28
                  remu         ra, a7, s3
                  slli         s5, zero, 9
                  sub          a4, s6, a3
                  fmin.s       fa4, ft2, fa6
                  fsgnj.s      fs3, fs0, ft8
                  mul          sp, t3, t2
                  or           s4, t6, a2
                  mul          s1, a1, a2
                  div          a2, t2, s2
                  nop
                  slti         s10, a5, -112
                  fcvt.s.wu    fa3, a7, rne
                  slti         s10, gp, -697
                  sll          t5, t4, s7
                  fmin.s       fa5, fa1, ft4
                  div          t2, ra, a4
                  fmax.s       fa2, ft2, fa4
                  slt          s5, s1, s1
                  ori          a6, s6, -356
                  srl          t2, s4, a4
                  fsgnj.s      fs2, fs2, ft3
                  mulh         s0, a4, tp
                  fdiv.s       fa4, fs2, fa1
                  mulhu        zero, s3, ra
                  sltiu        tp, a5, -1392
                  fmv.w.x      fs9, gp
                  or           zero, s1, a3
                  divu         t3, gp, a1
                  or           t3, gp, s10
                  or           s5, s8, tp
                  auipc        s8, 1044769
                  srai         a0, t6, 17
                  sll          zero, s10, t1
                  flt.s        t5, ft11, fs8
                  sltiu        ra, t5, 621
                  sltiu        s11, a2, 127
                  mul          zero, s3, s11
                  fmv.w.x      fs11, s0
                  fadd.s       fa1, ft11, fa6, rmm
                  lui          s9, 527859
                  fle.s        s2, fs4, fs11
                  fcvt.wu.s    t1, fa6, rdn
                  srai         a6, t3, 17
                  andi         tp, a4, 1537
                  fadd.s       fs8, fs6, fa5, rdn
                  auipc        t2, 763870
                  srl          a0, s10, t4
                  addi         t0, s5, 533
                  fsub.s       fs11, ft9, fa0, rtz
                  fdiv.s       fa0, fa3, ft8
                  mul          zero, s7, a4
                  feq.s        s8, ft4, fs7
                  fdiv.s       ft0, fs10, fs11, rtz
                  slti         gp, t5, 713
                  fdiv.s       fa4, fs0, ft7, rtz
                  srli         a4, a0, 13
                  feq.s        t4, fs2, fs0
                  ori          s11, s5, 1011
                  fadd.s       fa1, fa2, fs8
                  mul          a2, t0, s0
                  auipc        s11, 17951
                  srai         sp, s10, 10
                  div          a4, t4, a5
                  fcvt.wu.s    gp, ft10, rmm
                  fcvt.s.w     fa2, a4, rmm
                  sltu         t6, s5, s6
                  mulh         a6, sp, sp
                  sltu         s11, a7, s2
                  sub          s8, s10, tp
                  fsqrt.s      ft5, fa0
                  div          s7, t2, a7
                  fcvt.wu.s    a2, fa6
                  sub          t5, gp, s0
                  fcvt.w.s     s6, ft4
                  fcvt.wu.s    s4, fs10, rne
                  fcvt.s.wu    fs6, s4
                  mul          s6, s7, s8
                  addi         s1, t2, -393
                  fcvt.s.wu    fs0, s5
                  xori         a0, t5, 1688
                  mulhu        s1, a6, a1
                  srai         s0, s1, 20
                  add          gp, t4, s4
                  srl          a3, s7, t4
                  slli         sp, t1, 30
                  slti         zero, s11, -591
                  remu         s2, a5, a3
                  xori         a5, a3, 771
                  fcvt.s.wu    ft11, s7, rup
                  fmin.s       ft7, fs8, fa2
                  fmax.s       fs3, fa3, fs8
                  and          tp, a5, t2
                  slti         a6, s4, 731
                  sll          t5, a5, a6
                  sra          sp, t2, s9
                  sra          s6, s1, s2
                  fsgnjx.s     fa7, fs0, fs11
                  slli         t3, t0, 8
                  fcvt.s.wu    fs7, a6
                  fcvt.wu.s    ra, fa7, rmm
                  or           a3, gp, sp
                  fmax.s       ft1, fa3, fs2
                  sub          ra, a7, s10
                  addi         s1, s2, -601
                  xori         t5, gp, -1760
                  divu         s5, a3, t6
                  fsgnj.s      ft10, fs11, ft6
                  srl          t5, s10, ra
                  slli         tp, t2, 3
                  srai         t1, s9, 29
                  mul          a2, a4, s11
                  fdiv.s       fs8, ft11, fs2
                  fmv.w.x      ft3, s7
                  rem          s6, a1, s6
                  mulhu        s2, a6, s0
                  sltiu        s7, t6, 1225
                  fsgnjx.s     ft8, fa4, fa1
                  sll          s11, s7, t6
                  flt.s        t2, ft9, ft10
                  rem          s6, a1, a4
                  fmv.x.w      a0, ft5
                  fclass.s     t2, fa3
                  mul          a5, gp, s9
                  fcvt.wu.s    gp, fs11, rup
                  fmin.s       fs5, fa1, fs10
                  fmin.s       ft8, fa7, ft7
                  slli         s4, s1, 18
                  mulhu        s4, a6, t2
                  slli         s1, s6, 31
                  fcvt.w.s     s0, fa1, rmm
                  fdiv.s       fa6, fa2, fs1
                  fadd.s       fa2, fa7, ft11
                  fmax.s       ft1, fs5, ft4
                  fsub.s       ft3, fs9, fs1
                  lui          t6, 652165
                  srli         t3, a1, 27
                  fsgnjx.s     fa2, ft11, ft7
                  fmax.s       ft6, fs8, fs5
                  fmv.w.x      fs4, s8
                  fmin.s       fs10, fs11, fs9
                  fsgnj.s      fs1, fa7, ft3
                  srli         a6, a5, 6
                  auipc        tp, 290622
                  mulhu        zero, zero, a4
                  fsqrt.s      ft3, fa3, rne
                  fcvt.s.w     fs2, t0
                  fle.s        ra, ft2, fa4
                  nop
                  fcvt.s.wu    ft4, a4
                  fcvt.s.w     fa5, t3
                  slti         a3, ra, -111
                  feq.s        s2, fs5, ft1
                  fsgnjx.s     fs5, fs8, ft2
                  divu         s5, t1, t6
                  slli         t6, a7, 16
                  sub          tp, s11, t3
                  srai         t2, s7, 25
                  slt          s8, s4, a3
                  xori         gp, sp, -514
                  or           zero, ra, s11
                  fsub.s       fs9, fa0, fa6
                  fle.s        a0, fs9, ft3
                  fmin.s       fs5, fs4, fa7
                  ori          gp, t4, -944
                  fmul.s       ft3, fa2, fa5, rup
                  fsqrt.s      fs2, fs9, rtz
                  slt          s10, s3, tp
                  fsqrt.s      ft4, fs1, rup
                  mulhu        s8, t1, s2
                  fmul.s       fs9, fs0, fs6, rup
                  ori          s1, a1, 1358
                  remu         a3, t2, s1
                  fclass.s     gp, ft1
                  mulhsu       zero, s6, a7
                  slt          t3, s4, t0
                  fmv.w.x      fa7, s9
                  mulhu        s1, t5, gp
                  mulh         s6, a2, a5
                  fsgnjn.s     fs10, fs6, ft3
                  auipc        tp, 339877
                  fmax.s       fs4, fa1, ft3
                  auipc        ra, 30400
                  or           t2, a1, tp
                  addi         ra, s8, -590
                  remu         a0, a1, s9
                  fadd.s       fa4, fa6, fa0, rne
                  fmv.w.x      fs7, a0
                  slt          t6, s5, t6
                  sltiu        a6, s4, 176
                  srli         zero, a6, 23
                  srl          t1, s4, t5
                  fmul.s       ft11, ft1, fa3, rmm
                  fsgnjn.s     ft9, fs3, fs8
                  add          s8, s9, s6
                  rem          t0, s5, zero
                  fclass.s     s4, fs0
                  or           zero, s7, a6
                  fmv.w.x      fs6, t5
                  fcvt.w.s     s0, ft8
                  mulhu        a0, s1, s5
                  mulhsu       s7, t5, a6
                  auipc        t0, 132199
                  fsqrt.s      ft8, fa4, rtz
                  fclass.s     a3, ft6
                  mulhsu       t0, sp, tp
                  srli         sp, s1, 20
                  xor          t6, gp, a6
                  and          s7, s11, a7
                  sll          s10, t6, t3
                  srai         gp, sp, 22
                  fsgnjx.s     fs9, ft10, fs10
                  fmin.s       fs9, fa6, fa2
                  fmul.s       fa5, fs3, ft7, rmm
                  sltiu        gp, gp, 983
                  sra          gp, s1, t5
                  mulh         s11, a7, sp
                  fmv.x.w      a5, ft4
                  fsub.s       fa3, fs0, ft5
                  sltiu        t0, s0, 892
                  or           a3, s4, s6
                  sub          tp, s0, t2
                  fmin.s       fs2, fs1, fs10
                  add          s7, ra, a0
                  fclass.s     a0, fs9
                  feq.s        tp, ft5, fa1
                  xori         a2, t5, -33
                  fsgnjx.s     fs7, fs4, ft3
                  andi         s7, s4, 1219
                  fadd.s       ft0, ft9, fs5
                  fmv.x.w      a5, fs11
                  fcvt.s.w     fa6, s10
                  fmin.s       fs2, fs2, fs10
                  fmv.w.x      fa4, t0
                  add          tp, t6, gp
                  fmul.s       fa7, fs6, fs6, rdn
                  xori         t0, sp, 1130
                  xori         sp, s11, -1934
                  auipc        s10, 909010
                  divu         s5, a5, s6
                  slti         t2, s9, -1563
                  auipc        s6, 894745
                  fsub.s       fa1, fs2, ft5
                  fmax.s       fs10, fs7, fs8
                  fdiv.s       fa7, fa3, fs10
                  fsgnj.s      fa5, ft3, fa3
                  fcvt.s.w     ft0, a0, rmm
                  slti         a5, t4, 2041
                  srl          s10, t5, s7
                  feq.s        t5, fs10, fa1
                  fmul.s       fs2, ft4, fs4
                  sll          sp, s8, sp
                  mulhu        s5, zero, ra
                  fmv.w.x      fs2, t1
                  fclass.s     t2, fa1
                  remu         a4, t5, t6
                  sltu         a2, t5, zero
                  sltu         gp, t0, t2
                  rem          t4, s10, a5
                  fclass.s     gp, ft8
                  fsgnjx.s     fs0, fs9, ft10
                  mulh         a6, s6, a7
                  mulhu        s11, s4, a2
                  fsub.s       fs7, ft10, fs4, rne
                  fcvt.s.wu    fs7, s7, rmm
                  fsgnjn.s     fs11, fs0, ft10
                  rem          s7, s3, s9
                  mul          s11, s5, sp
                  fcvt.s.w     ft5, s7, rne
                  fsub.s       fa0, fa3, ft9, rtz
                  fsgnjx.s     fa7, ft5, ft5
                  fadd.s       fa1, ft1, fa5
                  xori         t1, a1, -880
                  div          s1, s5, s3
                  srli         s9, tp, 23
                  slt          t2, a3, a4
                  fcvt.s.w     fa6, s2, rmm
                  mulh         s8, s7, a4
                  fcvt.s.wu    fs8, a3, rup
                  sltiu        sp, a1, -111
                  ori          s9, tp, 169
                  and          a5, t5, s3
                  ori          t2, s7, -1851
                  nop
                  fadd.s       fa3, ft3, fa1
                  remu         s9, tp, zero
                  fsub.s       ft0, ft6, fs11
                  fsqrt.s      fs3, ft7, rup
                  fsub.s       ft11, fa3, fa3, rmm
                  fsub.s       ft6, ft8, ft10, rup
                  fsgnj.s      fa3, ft5, fs7
                  slli         s6, t4, 30
                  div          a2, a7, ra
                  slti         a3, t4, -60
                  and          t1, s0, s7
                  and          s2, gp, ra
                  fcvt.s.wu    fs4, s11, rtz
                  sub          sp, t3, a0
                  fsgnj.s      fa1, fs6, fa6
                  or           t1, s8, ra
                  flt.s        t1, fs5, fs1
                  fadd.s       ft11, fa7, fs2, rup
                  divu         zero, a1, ra
                  feq.s        s11, ft9, fs10
                  rem          zero, s1, a5
                  lui          s9, 481728
                  remu         s10, a1, zero
                  slli         sp, tp, 21
                  fcvt.w.s     ra, fs2
                  add          ra, t1, t3
                  fcvt.w.s     t1, ft6
                  fcvt.w.s     s2, ft3, rtz
                  add          s2, ra, t3
                  fmin.s       ft2, fs2, fa4
                  fcvt.wu.s    s6, fs7, rtz
                  rem          s9, s6, s0
                  fsgnjn.s     ft11, ft0, ft6
                  nop
                  fcvt.wu.s    s5, fa4, rmm
                  ori          s1, s10, 1102
                  mul          gp, s11, a1
                  slti         s8, t2, 1297
                  mul          t5, ra, t0
                  slti         zero, a1, 1634
                  mulhu        a2, t0, a0
                  mul          t4, s7, t3
                  sub          s7, s7, t1
                  andi         s6, a6, -1443
                  fcvt.s.w     ft1, a7
                  auipc        a4, 719928
                  mulh         t0, ra, s7
                  or           s11, a1, a2
                  fsgnjn.s     ft4, fa1, fs8
                  add          sp, zero, a2
                  fle.s        a0, ft1, fa5
                  remu         zero, s6, zero
                  feq.s        t4, fs9, fa2
                  ori          a2, tp, 1380
                  xori         tp, s0, 1881
                  srl          ra, s0, tp
                  addi         a0, a3, -937
                  fsgnjn.s     fs11, fa1, fa4
                  remu         a0, t3, ra
                  srl          gp, s6, s11
                  sltiu        sp, a5, -1563
                  fclass.s     a6, ft1
                  fcvt.w.s     t4, fa5
                  div          t2, a3, t4
                  sltiu        sp, a2, -494
                  divu         gp, a4, s6
                  andi         s4, t5, -705
                  fcvt.s.wu    ft3, a4
                  fcvt.w.s     s7, fs9, rdn
                  fmin.s       fa5, fa2, ft7
                  sub          s10, t0, t5
                  flt.s        zero, ft5, fa3
                  fdiv.s       ft3, ft0, ft5, rmm
                  fmul.s       fs2, ft7, ft2
                  fcvt.s.w     ft2, s1
                  sll          s5, a1, t5
                  fsgnj.s      fs6, fa3, fs6
                  fmv.x.w      ra, fa4
                  divu         gp, t0, s3
                  auipc        a0, 851503
                  mulhsu       s7, t3, s0
                  xor          gp, t6, a1
                  lui          t3, 892851
                  add          zero, a7, t5
                  mulh         t2, t5, t2
                  fsub.s       ft11, fs8, ft6, rdn
                  mul          a2, a7, sp
                  sra          s8, s0, s6
                  flt.s        s5, fs5, fa6
                  fcvt.s.w     ft4, a1
                  feq.s        t2, fs4, ft3
                  auipc        s10, 151380
                  slli         a4, a1, 7
                  mulhsu       t6, t4, t1
                  mulhsu       zero, s4, t0
                  fsub.s       fa3, ft5, fs3, rtz
                  nop
                  addi         s0, s4, 643
                  add          t2, t6, t0
                  fsub.s       fa5, ft5, ft9, rne
                  srai         a3, t4, 6
                  fsqrt.s      fs2, fa6
                  fcvt.s.w     fa7, t3, rup
                  feq.s        a2, ft10, fs6
                  fsgnjx.s     ft7, fs4, ft0
                  srli         a2, s10, 16
                  flt.s        s1, ft2, fa0
                  slti         sp, sp, -343
                  divu         s10, t5, a2
                  ori          s0, a2, -1206
                  add          s10, s1, gp
                  mulhsu       t5, t2, a7
                  fsqrt.s      ft2, fs5
                  slti         a5, s2, 1447
                  rem          t0, t6, s3
                  fmul.s       fs5, ft6, fa0, rmm
                  mulhu        s8, a7, gp
                  xor          a5, ra, t2
                  slti         a5, a4, -1563
                  fcvt.s.w     ft3, t5
                  flt.s        a6, ft3, fa1
                  remu         t2, a5, s1
                  fdiv.s       fs7, fa2, fs2
                  fmv.x.w      s9, ft0
                  divu         a4, t5, s5
                  mulhu        a3, s5, s5
                  fcvt.s.wu    ft0, a4
                  remu         tp, s11, zero
                  mulh         s6, t6, s6
                  fsub.s       ft5, ft2, fs10, rup
                  flt.s        t4, fa2, fa5
                  fmv.w.x      ft5, a0
                  sltiu        t2, zero, 1676
                  fclass.s     a5, fa0
                  rem          tp, sp, a5
                  sll          s2, t4, a5
                  fmin.s       fs6, ft6, fa0
                  and          s5, a4, s5
                  or           s1, s3, t5
                  flt.s        t4, fa4, ft8
                  auipc        s2, 642639
                  div          ra, ra, t2
                  sra          s8, t4, t1
                  lui          s6, 302404
                  ori          gp, s4, -1312
                  and          t3, a7, s10
                  sll          tp, s3, s8
                  sll          s9, a0, s9
                  xori         t5, s9, 1782
                  srai         t4, a4, 7
                  div          t1, a0, s9
                  flt.s        gp, fs4, ft8
                  divu         s6, t6, t1
                  remu         zero, ra, a6
                  fcvt.wu.s    t3, fs9
                  fmv.x.w      tp, fa4
                  fmul.s       fa7, ft2, ft2
                  div          s11, a4, s8
                  remu         s8, gp, s4
                  mulhu        ra, t1, a3
                  fdiv.s       fs5, ft9, fs6
                  and          gp, a6, a6
                  xor          t1, a1, tp
                  andi         zero, s3, -1606
                  sltu         s4, a0, a2
                  add          a3, s10, s6
                  and          s5, s2, s1
                  fcvt.s.w     fa6, zero, rdn
                  fle.s        ra, ft4, ft1
                  fmv.x.w      a6, fa2
                  auipc        s9, 387082
                  remu         a5, s3, t0
                  fsgnj.s      fs5, fs7, fa7
                  fadd.s       ft3, fs1, fs8, rmm
                  fmin.s       fa1, fs5, fs2
                  slti         s9, tp, 132
                  andi         s10, s7, -1889
                  add          t3, s11, t6
                  fmax.s       ft3, fs5, ft9
                  remu         s8, a1, s9
                  sra          t0, s1, gp
                  div          t2, zero, zero
                  fsub.s       ft1, fs9, ft6
                  feq.s        gp, fs8, fa3
                  fmin.s       ft5, ft2, fs3
                  fsqrt.s      ft0, fs4, rdn
                  divu         s10, t0, t4
                  slli         t5, sp, 22
                  fmax.s       fs9, fa5, ft9
                  remu         s10, s8, a3
                  mul          zero, s10, a0
                  fsgnjn.s     ft8, fs11, fs5
                  fsqrt.s      fa0, fs1
                  addi         t5, s7, 452
                  srl          t0, a0, a7
                  fcvt.s.w     ft4, t6
                  srai         s5, s11, 11
                  mulh         a4, t0, s5
                  mul          s9, s4, s7
                  fadd.s       fs4, ft4, fs9
                  remu         a3, sp, s0
                  divu         a6, gp, s6
                  slli         a4, ra, 15
                  flt.s        a3, fa3, fa4
                  div          t2, s8, a5
                  remu         gp, a3, a7
                  flt.s        t3, fs6, fs2
                  andi         s4, s7, 631
                  sra          t4, s1, s6
                  srl          sp, s8, t3
                  sub          a2, a7, a2
                  fcvt.w.s     s9, ft0
                  andi         s1, t1, -1308
                  xor          s2, a1, a0
                  srai         s0, a0, 15
                  xor          t6, t3, t2
                  slti         s4, s11, 1196
                  fmax.s       ft9, fa6, fa7
                  fsub.s       ft7, fs8, fa4, rup
                  mulhu        t2, s7, s6
                  srl          s9, a2, s3
                  sll          a4, s10, s2
                  ori          gp, s0, 553
                  mulh         gp, t3, s9
                  ori          s4, s5, -1
                  nop
                  fclass.s     zero, ft10
                  fmul.s       fs5, ft6, fs7
                  xori         t1, a3, -2016
                  lui          s7, 814707
                  auipc        t4, 925007
                  fsgnj.s      fa7, fa2, fa4
                  fdiv.s       ft8, fs10, fs5
                  slli         a5, gp, 3
                  andi         t2, gp, -1235
                  fsqrt.s      fs6, fs10
                  srai         a4, a7, 2
                  fle.s        t2, fs4, ft6
                  and          s5, sp, tp
                  mulhsu       s5, t2, s9
                  fmin.s       fs7, fs1, fa0
                  fsgnjn.s     fs3, ft6, fa1
                  slli         t6, t4, 29
                  fcvt.w.s     a0, ft8, rtz
                  fcvt.w.s     s0, ft1, rdn
                  and          a5, s10, t5
                  fsgnj.s      fa0, ft2, fs6
                  sltiu        t4, s7, -666
                  fclass.s     s7, fs9
                  srl          t2, ra, ra
                  srai         a4, s5, 8
                  fcvt.w.s     t6, fs6, rdn
                  fcvt.s.wu    ft4, a2
                  mulhsu       t6, zero, t2
                  fsqrt.s      fa2, fs4, rne
                  fcvt.w.s     s6, fs9, rup
                  andi         t5, s6, 2032
                  slti         a6, t5, -440
                  slli         s9, t5, 1
                  fmv.w.x      fs0, ra
                  sub          s5, a1, t3
                  rem          s9, sp, t6
                  slt          t6, t2, s6
                  rem          t6, t6, s4
                  fsgnjx.s     fa3, fs3, fs9
                  fcvt.s.w     fs4, t2, rmm
                  fmin.s       ft8, fa3, fs7
                  slti         s2, s3, 1467
                  div          a6, s4, sp
                  fcvt.w.s     s1, fa4
                  sltu         a3, a1, tp
                  addi         s10, a4, 644
                  flt.s        a5, ft6, fs6
                  srai         s1, a4, 26
                  fmv.x.w      s11, fa1
                  fclass.s     t5, ft5
                  fsgnjx.s     fa2, fs4, fs0
                  lui          s6, 760850
                  remu         s4, s8, gp
                  div          s11, a2, s6
                  fmin.s       ft6, fs9, ft0
                  addi         a6, gp, -1732
                  flt.s        s7, fa4, fs6
                  fle.s        sp, fa0, fs9
                  ori          zero, a5, 608
                  remu         a6, a7, s11
                  divu         tp, s7, zero
                  srli         s6, a6, 26
                  lui          t2, 178398
                  feq.s        s7, fa5, ft9
                  slt          tp, s5, a0
                  fmax.s       fs5, ft1, ft0
                  fsgnjx.s     ft2, fa0, ft5
                  divu         s0, t6, t6
                  fclass.s     t2, ft5
                  fcvt.s.wu    fa6, a7
                  nop
                  mulhsu       gp, sp, t2
                  fcvt.w.s     s4, fa0, rne
                  div          s2, a1, s11
                  rem          s5, s10, s11
                  auipc        s7, 448791
                  srli         a3, a7, 19
                  auipc        s6, 495716
                  flt.s        a5, fs3, ft11
                  fcvt.s.w     ft7, a4, rup
                  fmv.w.x      ft1, s3
                  fdiv.s       ft2, ft7, ft1
                  and          s4, a6, ra
                  div          s9, s5, a7
                  fsgnjx.s     fa3, fa5, fs11
                  sub          s4, t1, s11
                  fle.s        a2, fs11, fa1
                  mul          s7, s8, sp
                  div          t4, s1, s7
                  mul          t2, tp, s1
                  mulh         s11, a3, t4
                  flt.s        a4, fa0, fs11
                  slti         a5, a4, 1926
                  fdiv.s       fs8, ft4, ft6
                  mul          t6, tp, s3
                  remu         s10, s7, s7
                  fdiv.s       fs11, fs7, ft7
                  feq.s        gp, fs8, ft9
                  div          a5, t4, s4
                  mulhsu       s11, t5, s3
                  addi         s6, t1, -1731
                  addi         a0, sp, -1247
                  flt.s        s2, fs3, fs1
                  fdiv.s       ft7, ft5, fs8
                  fsqrt.s      fa2, ft4
                  slti         a5, t3, -234
                  fsub.s       ft11, fs0, ft0, rmm
                  fle.s        s9, ft6, fs0
                  mulhsu       s5, s5, zero
                  fmax.s       ft2, fs8, ft9
                  auipc        t4, 720369
                  mulh         t0, t6, s6
                  slt          s7, t2, ra
                  and          t6, a4, s8
                  mulhu        t1, t4, tp
                  slti         a3, a6, -273
                  fsub.s       ft8, fs8, fs4
                  fdiv.s       ft7, fs0, fs7
                  sra          t0, t2, a1
                  srli         t6, s1, 7
                  mulhsu       a0, s9, s10
                  fle.s        gp, fs4, ft3
                  mulhu        a2, s8, t2
                  mulhu        s2, t3, a0
                  feq.s        s11, ft11, fs6
                  rem          a3, s6, t1
                  sltiu        t0, zero, -1005
                  div          tp, t5, t4
                  fsgnjn.s     ft5, fa2, ft8
                  slti         sp, a6, -345
                  fcvt.s.wu    ft0, t1, rdn
                  remu         a3, a6, a7
                  fcvt.s.wu    fs0, gp, rne
                  mulhsu       s9, ra, a0
                  fmv.w.x      fs11, a0
                  andi         t1, t5, 849
                  slt          s9, s10, t3
                  auipc        s10, 848283
                  feq.s        gp, fa0, fs4
                  fcvt.s.w     ft8, s9, rdn
                  fclass.s     a5, fs3
                  mulh         ra, a2, gp
                  divu         a2, s6, t6
                  slti         t4, t1, 468
                  ori          s4, a2, 1417
                  xori         tp, ra, 589
                  srli         s10, s3, 6
                  fmul.s       ft2, fs0, fs10, rup
                  fmax.s       ft5, ft4, fa4
                  srl          gp, t6, t0
                  sra          s9, s7, a7
                  srli         a2, s4, 14
                  auipc        t5, 832496
                  slt          s2, s4, gp
                  lui          t4, 778042
                  fmv.w.x      fs1, a7
                  sub          a6, t4, t6
                  fcvt.w.s     t0, ft1, rup
                  auipc        a2, 64538
                  mulh         gp, s10, a1
                  mulh         t2, s9, s2
                  slli         sp, tp, 4
                  fadd.s       fa0, fa7, fs3
                  fcvt.w.s     s8, ft0, rtz
                  fsqrt.s      fs1, fa1
                  rem          s6, a1, sp
                  div          s4, t0, ra
                  xor          a3, ra, ra
                  nop
                  sll          s6, t6, t4
                  srl          a4, s6, sp
                  fle.s        s0, fs7, fs2
                  fsub.s       fa1, ft6, fs9, rtz
                  divu         s5, s1, a7
                  srl          s9, sp, sp
                  divu         a5, a2, s10
                  mul          s11, t4, s4
                  mulh         a3, s1, a4
                  fmin.s       fs4, ft1, ft7
                  sub          gp, s11, s4
                  div          s1, s3, s3
                  rem          s5, t3, s11
                  xor          t4, s10, a4
                  divu         t1, a3, t3
                  sub          t6, t4, s6
                  fsgnjx.s     fs9, fa6, fs9
                  nop
                  slti         sp, zero, -1641
                  srai         s8, s0, 1
                  sltu         a3, s1, gp
                  mul          a0, a0, s2
                  srai         s1, t1, 20
                  fmv.w.x      fs4, t1
                  fsgnjx.s     fa0, fs10, ft0
                  fdiv.s       fa4, fs9, ft5
                  fcvt.s.wu    fs4, a6
                  xor          a5, ra, a0
                  rem          ra, s9, zero
                  slt          s6, t5, s7
                  slt          s7, t5, s2
                  fsgnjn.s     fs9, fa0, fa4
                  fsqrt.s      fs4, fs6
                  slt          s11, t0, s7
                  auipc        s2, 439909
                  fadd.s       fa0, ft11, fs8, rne
                  fadd.s       ft3, ft11, fs1
                  ori          a6, a7, 1264
                  sltu         a3, a0, s2
                  fmul.s       fs3, fs11, ft0, rtz
                  divu         gp, s10, t1
                  ori          s0, tp, -1709
                  mul          t5, a5, s11
                  fmv.w.x      fs5, s1
                  sll          a6, s6, a2
                  mulhsu       s0, s9, s2
                  flt.s        t4, ft7, fs0
                  slli         s11, ra, 26
                  mulhsu       t5, t1, s11
                  fcvt.s.wu    ft1, s1
                  remu         t2, s6, a5
                  mul          a3, t4, sp
                  fadd.s       fs2, ft9, fa5
                  div          a4, a2, a4
                  remu         t4, s2, s7
                  fcvt.s.wu    fs2, s5
                  sltu         s7, t6, s3
                  rem          sp, t4, t2
                  fclass.s     ra, ft1
                  fsqrt.s      ft0, fa6, rtz
                  fdiv.s       fa3, ft2, fa0, rne
                  fcvt.s.wu    fs5, a5
                  andi         t3, s0, 1826
                  sra          s4, a5, zero
                  fmv.w.x      fs2, t1
                  fclass.s     s5, ft4
                  mulhu        t3, t6, s7
                  divu         s7, s1, s0
                  divu         s10, s1, s9
                  fmv.w.x      ft2, a1
                  div          t5, t6, t0
                  rem          s9, a7, t4
                  sltiu        t3, a7, 1887
                  fsub.s       ft8, fs2, fs8
                  mulhsu       s0, a2, t6
                  fsgnj.s      fs0, fs9, fs7
                  slti         sp, s10, -1324
                  sltiu        s0, s5, -749
                  fsqrt.s      fa4, fs6
                  divu         a0, s6, t0
                  fcvt.s.wu    ft3, tp
                  sltiu        t0, t5, 1580
                  srai         s7, a1, 22
                  fsgnjn.s     fa5, fs1, ft3
                  srl          s11, s8, a4
                  srai         t0, a6, 30
                  fcvt.wu.s    zero, fs4, rup
                  fdiv.s       fs6, fs1, ft0
                  fcvt.s.wu    fs2, s5
                  add          s6, s4, s5
                  fcvt.wu.s    a2, fa3, rne
                  slt          a2, sp, s3
                  slti         s4, s7, 1115
                  fmv.w.x      ft9, s10
                  fclass.s     s11, fs9
                  divu         t5, t3, t2
                  fmin.s       fs8, fs1, fs10
                  fcvt.s.wu    fa6, s9, rup
                  fsgnjx.s     fs2, ft3, fs6
                  fadd.s       ft8, fs9, ft9
                  fmin.s       ft0, fs5, fs11
                  fmv.x.w      a0, ft8
                  sltiu        s4, s0, 895
                  sra          gp, a1, a4
                  fsgnj.s      ft7, ft3, fa6
                  xori         s7, t5, -1567
                  auipc        s8, 415920
                  fle.s        t0, fa0, fs7
                  fclass.s     a4, fs11
                  slt          t0, a3, s1
                  lui          s5, 869489
                  sll          zero, t2, a4
                  sltu         a2, s2, s10
                  fdiv.s       ft5, fa4, ft3, rdn
                  xor          s9, s2, t5
                  div          a6, a2, t1
                  lui          gp, 373184
                  slti         s10, a1, 1755
                  fdiv.s       fs8, ft3, ft11, rne
                  ori          a5, a0, 689
                  fsgnjn.s     ft8, fs9, fs7
                  fsub.s       fa5, fs1, fs2, rup
                  fcvt.s.wu    fs3, t2
                  andi         s8, gp, 1985
                  fsgnjn.s     ft0, fs8, fa7
                  auipc        a0, 431306
                  fclass.s     a6, fa5
                  slti         s8, gp, 1376
                  fcvt.s.w     fa5, t1, rmm
                  fcvt.wu.s    a3, ft1
                  fmv.x.w      zero, fs8
                  nop
                  xor          t2, s11, a3
                  fclass.s     a3, ft7
                  rem          s8, s3, t4
                  fdiv.s       fa4, fs3, ft7
                  fsqrt.s      fs9, ft5
                  srl          s0, a3, a3
                  fsqrt.s      fs3, fs3, rdn
                  div          a5, s7, t6
                  nop
                  fmul.s       fs6, ft9, ft9
                  fcvt.s.wu    fs3, sp, rmm
                  remu         s8, a3, s11
                  fdiv.s       fs2, ft4, ft10
                  mul          sp, t2, t5
                  div          s1, s8, t4
                  fcvt.wu.s    t1, fs5, rtz
                  mulhsu       a0, a5, s5
                  slli         t0, t4, 23
                  flt.s        s5, fa4, fs6
                  srli         s11, s10, 19
                  addi         s10, t1, -628
                  fsqrt.s      ft9, ft8
                  remu         a2, t3, gp
                  divu         s4, ra, s8
                  slti         ra, t5, -1928
                  and          a5, a7, s6
                  fmul.s       fa3, ft2, fa4
                  and          s5, s3, s4
                  fmin.s       fs4, ft9, fs3
                  and          zero, ra, tp
                  fsgnjn.s     ft1, ft9, ft1
                  xor          s0, s11, s0
                  fmul.s       fs4, ft6, fs9
                  fle.s        s5, ft5, ft10
                  mulhsu       s5, zero, t0
                  fmv.x.w      tp, fs10
                  fmul.s       ft5, fs2, fs9, rup
                  xori         s9, s4, -1307
                  fsgnjn.s     ft0, fs11, ft10
                  fsqrt.s      ft3, ft3, rne
                  add          s6, s5, t1
                  fclass.s     a4, ft7
                  addi         s0, s5, 1317
                  mulhu        s4, a6, s11
                  slti         t0, zero, 124
                  srl          gp, a0, s6
                  sra          a6, s5, s11
                  ori          s11, a0, -902
                  addi         s10, s11, -1521
                  fsqrt.s      ft3, ft5, rup
                  fmv.w.x      ft5, a6
                  slli         t6, gp, 25
                  lui          s6, 668339
                  fmv.x.w      s4, fa2
                  lui          t2, 201984
                  rem          s6, t5, s3
                  sltu         t6, zero, tp
                  sub          s7, s3, s11
                  srli         s9, t0, 12
                  sra          a6, zero, a0
                  sltiu        s10, t1, 1806
                  sll          s10, a5, ra
                  fle.s        t3, fs2, fs3
                  fsgnjn.s     fa5, ft2, ft4
                  fadd.s       ft7, ft1, fs6, rne
                  nop
                  slti         a0, s11, 1020
                  fdiv.s       fs11, fs5, fa5
                  fcvt.w.s     a3, ft4, rmm
                  fmul.s       ft7, fa6, fa1, rtz
                  nop
                  mul          s11, a5, s3
                  ori          s9, s8, -140
                  srai         s1, s2, 9
                  auipc        sp, 974079
                  mulhu        s0, t3, a6
                  fmul.s       fa6, fs7, fs3, rne
                  remu         s6, s5, gp
                  div          s9, zero, s11
                  sll          t4, t3, s0
                  fadd.s       fs10, ft8, fs11, rtz
                  fsub.s       fs8, fa5, fa5
                  slt          a2, s5, s0
                  or           s0, a7, s3
                  srli         t1, s9, 17
                  fsqrt.s      fs5, fa3
                  sll          a5, s4, s1
                  fadd.s       fa4, fa0, ft4
                  flt.s        t0, fs7, fa5
                  fsgnj.s      fs9, fa5, ft2
                  slt          a4, s8, t1
                  fclass.s     t4, fa6
                  xor          s7, sp, sp
                  nop
                  srai         s7, s5, 28
                  fadd.s       ft6, fs0, fa6, rdn
                  sll          a3, t5, t2
                  fsqrt.s      fa6, ft6, rdn
                  fcvt.s.w     fs11, s6
                  auipc        t3, 815096
                  fcvt.s.wu    ft11, t2
                  mulhsu       a2, s8, s4
                  fmv.w.x      fs2, s8
                  slt          t6, s11, s0
                  fcvt.s.wu    fa6, s6, rdn
                  sub          t4, a0, s6
                  fsgnjx.s     fs2, ft1, ft10
                  mulh         zero, t1, t3
                  sltu         s7, s5, t0
                  sll          tp, zero, s6
                  mulhsu       a0, a5, s7
                  fmv.x.w      a6, fs9
                  srl          a4, s9, t5
                  ori          s4, a4, 7
                  ori          a6, t6, 457
                  mulhu        a4, gp, s0
                  fmax.s       fa0, fs8, ft7
                  fmin.s       fs8, ft8, fa7
                  feq.s        a2, fa1, ft4
                  fcvt.wu.s    s8, ft9, rup
                  slti         t1, t2, -1441
                  fcvt.s.wu    ft3, zero
                  sltiu        a2, s2, -623
                  flt.s        gp, fa0, fa2
                  fmin.s       fa7, fs2, fa4
                  srli         t4, s11, 2
                  and          t4, s9, ra
                  fcvt.s.w     ft7, s0
                  mul          gp, t5, a6
                  mul          s4, t3, a5
                  fcvt.w.s     zero, fs0
                  fsub.s       ft3, ft3, fs8, rne
                  fmv.x.w      a0, fs10
                  remu         s10, s0, a5
                  remu         s9, sp, s6
                  fcvt.wu.s    t3, ft10, rup
                  fcvt.s.w     ft7, gp
                  fcvt.wu.s    sp, fa4
                  addi         a4, t2, -957
                  fmul.s       fa3, fs5, fs11, rtz
                  fclass.s     t1, ft3
                  fle.s        ra, fa3, ft4
                  mul          a6, s3, t1
                  fsqrt.s      fa4, fs4, rup
                  sll          a2, a6, a2
                  flt.s        sp, fs1, ft2
                  xori         t5, t0, 190
                  fmul.s       fa5, fs10, fa1, rup
                  auipc        s0, 375713
                  flt.s        t3, fs0, fa1
                  xor          a4, a5, s6
                  lui          t1, 36850
                  mulhu        tp, a2, s2
                  nop
                  fcvt.wu.s    s5, fa3
                  fsqrt.s      ft6, ft8
                  mulh         s0, t5, gp
                  fsgnjx.s     fs10, fa5, ft7
                  nop
                  mul          a4, t1, ra
                  fcvt.w.s     s1, ft10, rtz
                  divu         ra, s0, s10
                  fsgnjx.s     ft0, ft1, fs3
                  remu         sp, a7, a0
                  srli         a4, s7, 26
                  ori          a4, a0, -1520
                  and          s7, t0, s8
                  sltu         tp, a4, ra
                  fmin.s       fa5, fa7, ft4
                  div          a5, s3, t1
                  sll          a3, t1, s5
                  fcvt.wu.s    a0, fa4, rmm
                  nop
                  srli         a6, s11, 29
                  sra          s11, s8, s3
                  fsgnjx.s     fa7, fs2, fs9
                  rem          a4, s11, t3
                  fcvt.s.w     fa2, gp, rne
                  srl          zero, zero, s11
                  srli         a4, zero, 26
                  remu         s0, a0, tp
                  lui          gp, 96821
                  fclass.s     s4, fs6
                  andi         s5, sp, 1359
                  nop
                  mulhu        t6, t3, t3
                  divu         t3, s3, a3
                  nop
                  and          sp, s7, s11
                  fdiv.s       fa1, ft5, fs8
                  fsgnjn.s     fs9, fa1, fa0
                  fcvt.w.s     a4, fa4
                  mul          s4, tp, a5
                  mulhsu       t6, s9, a3
                  auipc        a3, 867093
                  or           s11, t0, s6
                  slt          a6, s8, a0
                  flt.s        s2, ft6, ft2
                  fsgnj.s      fa4, ft2, fa7
                  fle.s        s10, fa0, fa2
                  sltu         ra, a7, gp
                  feq.s        t4, ft11, fa2
                  fsgnjn.s     fs4, fa0, ft6
                  fcvt.s.wu    fa2, t6, rdn
                  fmax.s       ft10, fs4, ft3
                  fle.s        zero, ft2, fs7
                  slli         t1, sp, 13
                  mulhsu       a4, t5, t1
                  mulhu        t1, a6, s3
                  mul          t3, a5, ra
                  fmv.w.x      fs10, s0
                  slti         t4, s1, 1147
                  srai         s11, s3, 30
                  fsgnj.s      ft11, ft8, ft10
                  fsgnj.s      fs7, ft6, fa2
                  add          sp, t5, t3
                  mulhu        s5, t2, a2
                  mul          s2, t5, t3
                  rem          s6, t4, a3
                  fsgnjx.s     ft4, fs0, fa5
                  fmul.s       fa0, ft5, ft9, rtz
                  andi         a2, s8, -779
                  auipc        s5, 771471
                  div          s0, a3, t1
                  fmv.w.x      fs10, ra
                  fcvt.s.wu    fa2, s10, rtz
                  fcvt.wu.s    a0, fs0
                  ori          s6, t5, 1565
                  remu         t4, s8, s8
                  sub          s5, s0, t5
                  rem          sp, a7, a6
                  fsub.s       ft1, fa6, fa4
                  lui          t2, 210468
                  fdiv.s       ft4, ft10, ft2
                  mulhu        sp, s1, gp
                  ori          a2, ra, 1826
                  fsgnjn.s     ft6, ft1, ft3
                  or           ra, s0, a7
                  srai         a6, a0, 10
                  srai         s8, a6, 11
                  xori         s5, zero, 697
                  div          s4, a7, s7
                  mulhu        a3, s2, s3
                  remu         s6, a5, t5
                  fmv.x.w      s8, ft3
                  addi         sp, s2, 748
                  slt          s8, s9, s0
                  mulh         ra, s5, t2
                  fcvt.s.wu    fa3, a7, rdn
                  flt.s        s2, fs6, fs2
                  sub          t1, t5, a3
                  andi         s2, a6, 1122
                  nop
                  auipc        s9, 1042763
                  remu         a0, sp, ra
                  sra          s1, s1, a0
                  nop
                  fdiv.s       ft8, fa0, ft5, rup
                  fadd.s       fs1, fs11, fa0, rmm
                  fdiv.s       fs0, ft1, fs6, rup
                  fcvt.s.w     fs7, a1, rtz
                  remu         t1, a5, a4
                  mulhsu       t3, s9, a0
                  add          s8, s11, a6
                  srli         t5, a2, 6
                  fmv.w.x      ft11, s8
                  fcvt.s.wu    fs1, a3
                  fcvt.w.s     tp, ft2, rtz
                  fsub.s       fs11, fs10, fs0
                  fcvt.w.s     ra, ft3, rup
                  lui          s9, 848148
                  fsgnj.s      fs9, fa3, fs11
                  remu         tp, a3, t1
                  divu         a5, s6, t3
                  fmul.s       ft1, fs10, fa1, rdn
                  auipc        t2, 946957
                  slli         ra, t0, 20
                  fmul.s       fs4, fs9, fa4
                  fsgnj.s      ft6, fa6, ft9
                  sll          gp, zero, t2
                  mulhsu       s8, s9, t2
                  fsgnjn.s     fa6, fs7, fs2
                  fdiv.s       ft7, ft9, fa6, rup
                  fcvt.w.s     s2, fa4
                  feq.s        t3, ft8, ft3
                  sra          s9, s4, s1
                  andi         t5, sp, -1609
                  fmv.w.x      fa4, s1
                  ori          sp, zero, -98
                  add          a6, s3, t1
                  and          t0, s7, sp
                  sub          t3, t5, s3
                  fsgnjx.s     fs6, fs4, ft4
                  fsub.s       fa1, fs0, ft4, rtz
                  xor          s10, a5, t0
                  srli         t6, t2, 15
                  fcvt.wu.s    s4, fa5
                  sub          s0, t3, t2
                  auipc        a2, 34018
                  fadd.s       fs1, fa2, fa3, rtz
                  auipc        t3, 830322
                  fcvt.s.wu    ft8, s3
                  slt          zero, s8, s4
                  fcvt.s.w     fs2, t6, rne
                  andi         t2, a5, 484
                  sll          a5, t1, gp
                  sltu         s1, a5, tp
                  andi         t4, sp, -676
                  xor          s2, s11, s5
                  rem          s6, s5, sp
                  fsqrt.s      ft7, fs1
                  sll          a5, sp, s10
                  fmin.s       ft3, ft5, ft11
                  srai         s2, a7, 12
                  fsqrt.s      ft5, ft9
                  fmax.s       fs4, fs2, ft9
                  add          t2, t0, sp
                  fsub.s       ft5, fs10, ft4, rtz
                  flt.s        a3, fa5, fs11
                  or           s0, tp, s0
                  sltiu        zero, s1, 1343
                  fmin.s       fs11, ft4, ft9
                  addi         s5, t1, 407
                  add          sp, a1, s1
                  ori          s8, t0, -267
                  xori         tp, s0, 1757
                  fclass.s     sp, ft1
                  mulhsu       a2, a4, sp
                  slti         t2, s5, -148
                  or           s8, a6, a2
                  fsgnj.s      ft11, fs7, ft2
                  sra          a3, t3, t4
                  sll          t5, gp, s5
                  fsgnjn.s     ft11, ft1, fa7
                  addi         t5, s7, 224
                  fdiv.s       fa7, fa3, fs3
                  srai         a6, a6, 3
                  fmv.x.w      t4, fs6
                  lui          t1, 1033915
                  slli         t2, a2, 4
                  srl          a2, t0, t3
                  sra          a3, a0, a4
                  fsgnj.s      fa7, ft8, fa5
                  nop
                  fclass.s     s0, fs1
                  auipc        a5, 186414
                  fdiv.s       ft6, fs8, fs7, rup
                  rem          a0, gp, t6
                  fle.s        gp, ft6, ft3
                  fcvt.wu.s    s8, fs10
                  fmax.s       fs1, fa0, fa7
                  ori          t6, s5, -1721
                  feq.s        t2, fs1, ft6
                  fsqrt.s      fs0, ft9
                  auipc        s1, 117417
                  fmv.x.w      t2, ft10
                  fmax.s       fa7, ft6, fs8
                  fsgnjx.s     fa1, fs5, fs0
                  fcvt.s.w     ft4, t3, rtz
                  sltiu        a3, a6, -391
                  fmul.s       fa7, fs3, fa6
                  fcvt.s.wu    ft9, t5, rup
                  mulhsu       s1, zero, a0
                  lui          t5, 1007991
                  add          a5, gp, a1
                  divu         a2, t5, s9
                  sltiu        s9, a6, -1070
                  fsgnj.s      ft8, ft6, ft5
                  fmin.s       ft2, ft2, ft1
                  feq.s        t3, fa4, fs11
                  sltiu        s11, a1, -1185
                  fmv.x.w      t4, fs4
                  fmax.s       fa4, fs0, fa4
                  addi         a3, a2, 1133
                  mulh         s0, s4, s9
                  nop
                  fdiv.s       ft2, fs6, ft7, rtz
                  fsgnjn.s     fs5, fa0, ft10
                  fmv.x.w      sp, fa4
                  add          sp, s10, s2
                  sub          a0, t5, s4
                  srl          t0, s0, a2
                  or           s0, a7, t5
                  xor          gp, tp, s11
                  xor          sp, zero, s7
                  fadd.s       fa3, fa6, fs9, rne
                  fclass.s     t3, fs6
                  fcvt.s.w     fs6, gp, rne
                  feq.s        t2, fs5, fa6
                  or           s1, s6, sp
                  fmv.x.w      s8, fa4
                  mulh         s4, t1, s10
                  fdiv.s       fa7, fs11, fs1, rmm
                  fadd.s       ft7, fs2, fs7, rdn
                  fmv.x.w      sp, ft2
                  fcvt.s.w     ft10, s4, rdn
                  auipc        tp, 901060
                  srl          s10, sp, t6
                  fcvt.wu.s    s5, fs0
                  fcvt.wu.s    s2, ft0, rne
                  sltiu        s5, s10, -275
                  mulhu        ra, tp, s3
                  addi         s5, t6, -1902
                  sra          s11, s6, s9
                  slti         t0, s5, -1167
                  div          a2, a1, a4
                  fcvt.wu.s    t6, fs11, rdn
                  mulh         s4, s11, a0
                  rem          a6, ra, s7
                  fsgnj.s      ft10, ft0, ft9
                  fmax.s       ft1, ft10, ft6
                  remu         s10, s11, a4
                  sltu         tp, t3, s8
                  fdiv.s       fs3, ft5, fa3
                  or           s7, t3, a4
                  flt.s        zero, fa3, fs5
                  mulhsu       tp, a2, t6
                  srl          t4, t4, t3
                  fmv.w.x      ft10, a6
                  xori         t4, s4, 1031
                  fmax.s       fs4, ft9, fs8
                  divu         sp, tp, a6
                  fmv.w.x      ft4, a7
                  mulh         t5, a5, sp
                  fclass.s     s5, fa7
                  fsub.s       fs6, ft1, fs4, rup
                  mulhsu       s9, s9, s11
                  nop
                  sll          sp, s1, gp
                  rem          t3, t5, s9
                  fcvt.s.wu    ft4, s10, rtz
                  fsub.s       ft11, fa4, ft3, rmm
                  sub          t4, s5, s2
                  fcvt.s.w     fs10, a6, rdn
                  xor          s10, s7, a3
                  xori         t0, s10, -278
                  fadd.s       fs3, fs0, fa6, rtz
                  fadd.s       ft9, fa7, fa3
                  fcvt.wu.s    t3, fs9
                  srli         s6, t6, 2
                  fdiv.s       fa5, ft5, fs2
                  fclass.s     t6, fa2
                  fsgnj.s      fs10, ft11, fs8
                  fdiv.s       fs8, ft4, fa7
                  slli         zero, a1, 15
                  andi         t1, t3, -1116
                  fsgnj.s      ft11, fa7, fs8
                  fcvt.w.s     s2, fs2, rne
                  slt          s8, a2, t3
                  fmv.w.x      fa7, s6
                  add          sp, t2, s9
                  fsqrt.s      fa0, fs10, rmm
                  fmv.w.x      ft6, a3
                  fadd.s       fs6, ft0, fa3, rne
                  slli         ra, tp, 14
                  sra          sp, sp, t6
                  fsqrt.s      fs7, fs2
                  mul          s1, t0, s7
                  fcvt.s.wu    fs11, s7
                  srai         t4, s7, 13
                  slti         t0, t6, 1970
                  lui          s10, 812345
                  xor          s9, tp, t3
                  fcvt.wu.s    s8, fa4
                  fclass.s     t2, ft0
                  fcvt.w.s     tp, ft0
                  fadd.s       ft1, fa1, fs1
                  fcvt.wu.s    s10, fs2, rmm
                  auipc        s2, 517715
                  xori         sp, a4, 454
                  xori         s5, t2, -252
                  fcvt.s.wu    fs3, s5, rmm
                  fdiv.s       fa4, ft6, fa1, rdn
                  flt.s        s0, fs3, ft10
                  mulhu        s11, a5, a4
                  remu         t6, a7, s2
                  nop
                  mulhsu       gp, t1, s6
                  fmv.x.w      a4, fs9
                  div          s9, tp, zero
                  mulhu        t6, a3, a6
                  divu         a2, s3, a3
                  xori         t0, t4, -1534
                  andi         t5, a0, 833
                  fsub.s       fs1, fa4, ft4, rtz
                  srl          zero, s9, gp
                  fadd.s       ft3, fs5, fa4, rdn
                  srli         a5, s2, 30
                  slli         t2, t5, 17
                  rem          s7, zero, t3
                  mulhu        gp, a0, s8
                  fsgnjx.s     fa5, fa0, ft11
                  remu         a2, zero, a0
                  addi         t3, ra, 1405
                  rem          a3, a2, zero
                  fcvt.s.w     fa4, a6
                  mul          t4, s5, t3
                  fdiv.s       ft5, ft0, fa4
                  andi         sp, a1, 719
                  srai         t4, sp, 6
                  mulhu        t5, t6, ra
                  or           s2, s9, ra
                  fsqrt.s      fs9, ft9, rne
                  fmv.w.x      fs11, t1
                  feq.s        s8, fs3, fs9
                  srli         ra, s9, 3
                  fsgnj.s      fa3, fs5, ft9
                  fcvt.w.s     s0, ft6
                  srai         s0, a3, 19
                  fcvt.s.wu    ft10, a2, rtz
                  fmul.s       fs10, ft7, fs9
                  fmax.s       ft4, fs6, fs0
                  fmax.s       fs9, ft3, fs6
                  flt.s        s7, fs8, fa7
                  fcvt.s.w     ft6, a0, rmm
                  sub          ra, s11, s4
                  fmv.w.x      fs8, sp
                  srai         s11, a1, 30
                  fclass.s     s7, fs4
                  flt.s        t0, ft8, fs10
                  fmul.s       fs7, fa6, fs1, rdn
                  andi         tp, s10, -814
                  mulhsu       ra, s4, s4
                  sub          t4, s0, s0
                  lui          s1, 562424
                  srl          t3, t4, gp
                  fsub.s       ft3, fs4, ft4
                  flt.s        ra, fs2, fa4
                  xori         zero, a5, 1197
                  fmv.x.w      t4, fa1
                  mulhsu       t1, a2, s3
                  fmax.s       fa4, fs9, fa3
                  rem          tp, a2, s8
                  fcvt.s.w     fa5, s11
                  xor          s4, a3, a1
                  div          s10, s0, s7
                  fle.s        t6, fa4, ft2
                  and          s0, s10, s7
                  fcvt.wu.s    t5, ft3
                  sltu         ra, s3, s9
                  flt.s        sp, ft4, fa3
                  fle.s        a5, ft2, fs3
                  fsgnj.s      fs3, fa1, fa3
                  flt.s        s5, ft6, fa3
                  fsqrt.s      fs7, fs7
                  fmin.s       fs4, ft2, fs4
                  fsgnjx.s     ft10, fs3, fa2
                  fle.s        s11, fs6, fs4
                  mulh         a2, s6, t2
                  fcvt.s.w     fa7, s8
                  fcvt.s.wu    fs6, sp
                  fcvt.wu.s    a0, ft9
                  fadd.s       fa4, ft4, fs10
                  fmin.s       fa7, ft1, ft8
                  nop
                  auipc        t4, 373411
                  andi         s11, s4, -48
                  sltiu        t6, zero, -393
                  remu         s9, s6, s4
                  fsgnjn.s     fs9, ft2, fa2
                  fcvt.s.w     fs0, t3, rdn
                  fcvt.wu.s    a4, fs9, rup
                  nop
                  fmv.x.w      a0, fa3
                  slli         a5, a4, 17
                  fle.s        s11, ft0, ft9
                  slli         s9, t4, 1
                  fsgnj.s      fa1, fs11, ft3
                  auipc        gp, 880976
                  srli         s2, s9, 2
                  slli         a6, t2, 6
                  xori         s8, s7, -1010
                  fsqrt.s      fs6, ft11
                  lui          t2, 339343
                  fsqrt.s      ft7, fa0, rtz
                  nop
                  fsgnjn.s     fa1, ft6, fa3
                  rem          sp, s0, a4
                  fsgnj.s      ft3, fs7, fa1
                  sll          a2, s0, ra
                  nop
                  addi         a3, a1, 745
                  add          sp, a5, t4
                  fmul.s       ft7, fa0, fa2
                  remu         t4, s11, a6
                  sltiu        t5, a2, 230
                  auipc        s0, 979141
                  div          t4, s1, a6
                  add          t3, s5, a7
                  or           a4, t6, a3
                  fsgnjn.s     fs1, fs10, fa3
                  fmin.s       ft11, ft4, ft5
                  sll          s10, t0, s2
                  sra          tp, s9, s3
                  ori          t0, a2, -1740
                  fcvt.s.w     fs3, s3, rdn
                  slli         ra, t5, 27
                  fdiv.s       ft4, fa2, fa6
                  srai         s11, zero, 22
                  slt          s7, s3, s4
                  addi         sp, a0, -1369
                  fmul.s       ft6, fs6, fs4, rmm
                  fsgnj.s      ft2, fa0, fs4
                  srai         s1, t6, 23
                  fcvt.w.s     t0, fs6
                  xori         sp, a3, 1347
                  addi         a4, sp, -63
                  sra          tp, s5, t5
                  and          s1, s10, sp
                  srli         gp, s2, 11
                  sub          s1, a4, t3
                  xor          sp, t0, tp
                  fcvt.wu.s    s7, ft6, rdn
                  sltu         s4, s11, a7
                  slti         a2, a3, -974
                  fsub.s       fs2, ft1, fa4
                  fsqrt.s      ft2, ft6, rne
                  div          s9, a4, a5
                  fsqrt.s      fs9, ft3
                  mulhu        a3, sp, a2
                  fadd.s       fs10, fa2, ft9, rmm
                  sub          s0, gp, zero
                  fdiv.s       fs11, fs3, fs2
                  fmax.s       fs3, ft4, ft2
                  ori          s1, s7, -993
                  andi         t5, s2, -1166
                  addi         tp, s6, -169
                  fmax.s       fa1, fs1, fa4
                  fsub.s       fs2, fa2, fa3, rdn
                  slli         t4, gp, 15
                  sltu         s6, a0, a7
                  ori          s9, a0, 1035
                  fmin.s       fs10, fs2, fs6
                  fsub.s       fs10, fa3, fs10
                  mul          s8, a3, t1
                  auipc        t0, 324688
                  slli         s9, ra, 17
                  fsqrt.s      ft0, ft0, rtz
                  mulh         sp, a7, t6
                  auipc        tp, 988852
                  andi         tp, ra, -896
                  div          a6, s11, t5
                  mulhu        s8, s2, a6
                  xor          t5, s5, s11
                  sra          s7, t1, tp
                  fcvt.w.s     a0, ft10, rup
                  fcvt.wu.s    s11, ft9
                  srl          a2, t4, tp
                  fmul.s       fs5, ft9, ft8, rmm
                  auipc        t3, 365253
                  fsgnjn.s     fa5, ft8, ft4
                  div          t1, t6, t5
                  fsub.s       ft8, ft3, ft1, rup
                  fadd.s       fs9, ft5, fs10, rne
                  slt          s7, t6, a5
                  fsub.s       fs5, fa3, fs7, rup
                  sra          zero, t0, a1
                  fmax.s       fs1, fa0, fs5
                  slti         t1, a2, -2028
                  fmv.w.x      ft10, gp
                  mul          t3, t3, s4
                  fsgnj.s      fs6, fs5, fs10
                  rem          zero, s9, s0
                  nop
                  fcvt.s.w     ft7, s4
                  fdiv.s       fa3, ft5, fa0, rtz
                  lui          s7, 141112
                  mul          a6, s4, s3
                  fmv.w.x      fa2, a3
                  fadd.s       ft11, fs7, ft8
                  sltiu        a5, a7, 474
                  fmin.s       ft3, fs1, fa1
                  add          s0, t6, a0
                  mulhsu       a4, s5, s4
                  fdiv.s       fs9, fs8, fs5
                  or           s2, a4, a2
                  remu         t2, s8, a7
                  fcvt.w.s     s1, fs10
                  fsub.s       fa1, fa1, ft10, rmm
                  auipc        sp, 165898
                  mul          t1, a7, t5
                  fsgnj.s      fs2, fs3, fa1
                  fcvt.wu.s    ra, ft4, rdn
                  flt.s        s7, fa4, ft11
                  fcvt.s.w     ft1, s8
                  slti         a0, s6, 1022
                  fcvt.s.wu    ft4, tp, rtz
                  fcvt.w.s     s0, fa0, rdn
                  auipc        t1, 443772
                  fcvt.wu.s    sp, ft8
                  mulhsu       s6, t0, s1
                  fmul.s       fa2, fa4, ft4
                  fcvt.w.s     s2, ft11
                  auipc        t2, 488153
                  or           s8, t3, a5
                  remu         s9, s1, a3
                  fcvt.wu.s    t0, fa0, rup
                  sltiu        s7, a5, -719
                  and          a0, t1, a3
                  sltu         a0, s2, a6
                  fmax.s       fs11, fs1, ft10
                  fcvt.s.w     ft8, tp
                  addi         gp, t3, -1697
                  remu         t6, tp, t0
                  fmv.x.w      s1, fs0
                  add          s6, zero, a0
                  fcvt.s.w     fs6, t1, rdn
                  sub          t4, a1, a6
                  fcvt.s.w     fs9, t6
                  fmv.x.w      s11, ft4
                  nop
                  feq.s        zero, fs6, ft10
                  rem          zero, s2, s5
                  fmin.s       fs3, ft11, ft5
                  slli         s4, s3, 17
                  or           a2, a7, sp
                  fsqrt.s      ft11, fs3, rtz
                  flt.s        t6, ft6, fa1
                  fsgnj.s      ft1, fs6, fs11
                  mulhu        s10, s9, a2
                  sltiu        t1, t3, -1793
                  fcvt.s.w     ft6, zero
                  div          a5, t3, a2
                  fadd.s       fs6, fs10, ft5, rne
                  feq.s        s6, ft7, fs2
                  fsgnjn.s     ft11, fa0, ft7
                  sub          s11, a1, s10
                  fsub.s       fs4, ft8, ft2
                  fle.s        a2, fa5, fs4
                  feq.s        s0, fs2, ft0
                  andi         t4, s10, 1927
                  fsgnj.s      fa3, fs4, fs2
                  auipc        s8, 840464
                  fmv.w.x      ft2, gp
                  nop
                  fcvt.s.w     fs6, s4
                  ori          t1, s3, 989
                  srai         s7, s1, 19
                  addi         a5, s3, -458
                  divu         s7, a0, a3
                  mulhu        sp, s6, t3
                  sra          zero, s3, s11
                  ori          s8, s9, -99
                  div          a5, t5, s4
                  fdiv.s       fs9, ft1, fs9
                  fcvt.s.wu    fs5, a6
                  and          t3, s7, s4
                  fclass.s     t4, fs6
                  slli         s8, s8, 2
                  sra          a5, a3, zero
                  lui          t4, 377713
                  srl          a0, zero, a3
                  fcvt.s.wu    ft0, a7
                  remu         s10, s4, s11
                  or           s8, t0, zero
                  andi         s1, gp, -1225
                  fsgnjx.s     ft2, ft8, fs7
                  div          t5, s6, gp
                  fdiv.s       ft10, ft1, fa3, rup
                  fmin.s       fs8, fs3, ft7
                  fsgnj.s      fa7, fa6, ft7
                  feq.s        s6, ft2, fa2
                  fmv.x.w      tp, ft0
                  srl          s5, zero, sp
                  mulhsu       s7, a5, a2
                  sub          tp, s10, t1
                  srli         s11, s1, 22
                  div          a0, t5, tp
                  sub          a2, sp, a4
                  fmv.w.x      ft5, s10
                  nop
                  rem          a3, ra, s7
                  ori          a2, sp, 1490
                  fsub.s       fa1, ft5, ft0
                  slt          a3, s4, s7
                  sltiu        zero, s6, 295
                  fmv.w.x      ft7, s0
                  xor          tp, s6, t6
                  fsgnj.s      ft4, fa6, fs6
                  fsgnj.s      ft10, ft1, ft1
                  sra          zero, a4, a0
                  srli         a2, t3, 12
                  fmul.s       fa7, fa2, fa1
                  fcvt.w.s     s10, fs9, rtz
                  slti         s0, a1, 1731
                  sll          s4, s5, t5
                  srl          tp, s10, s7
                  slti         tp, ra, -521
                  fmv.x.w      s9, fs2
                  mulhu        tp, tp, s8
                  feq.s        t6, fs10, ft7
                  fmul.s       ft11, fs4, fa5
                  slt          tp, s0, t1
                  fsub.s       fs7, fs7, ft7, rtz
                  remu         t6, s4, s9
                  fmul.s       fa2, fs5, fa7, rup
                  fcvt.w.s     s6, fa7, rne
                  fle.s        a2, fa2, fa2
                  mul          sp, a7, t2
                  mulhu        a3, t2, zero
                  or           t4, a2, tp
                  flt.s        sp, ft11, fs9
                  nop
                  mul          s6, s3, a5
                  addi         a4, t0, -992
                  fsqrt.s      fa3, fa0, rdn
                  add          a6, t4, t0
                  sltu         t2, s5, s5
                  mulhu        s0, s7, s5
                  fmv.x.w      a2, fs11
                  divu         s7, s7, a0
                  xori         s6, zero, -513
                  fmul.s       ft9, ft1, fs10, rdn
                  sra          a3, a7, t2
                  srl          ra, a3, a5
                  mulhsu       s7, t1, s0
                  slt          s2, sp, zero
                  sll          a2, a5, t4
                  fcvt.s.wu    ft0, s0
                  fsub.s       fs1, fs7, ft2
                  add          t1, s7, ra
                  fclass.s     t3, ft6
                  slti         gp, a7, -296
                  remu         s2, t4, s8
                  div          a0, s7, a0
                  nop
                  fmul.s       fa4, ft10, fs5, rup
                  slli         a4, sp, 22
                  mulhsu       a5, s3, a1
                  fmv.w.x      fa2, t4
                  and          s11, a1, tp
                  divu         s10, s7, a4
                  sub          t0, t2, t6
                  fmv.w.x      fa6, a0
                  nop
                  andi         a3, s4, -1852
                  addi         s11, t4, -1571
                  fle.s        a0, fa0, ft2
                  flt.s        t0, fs10, fa2
                  mulhu        t2, s2, ra
                  andi         a2, a1, -1574
                  mulhu        ra, a4, t6
                  ori          t5, t5, 1541
                  xor          t3, t4, t5
                  div          t0, t1, t2
                  auipc        s4, 633240
                  fmul.s       fa1, fs10, fs2
                  sltu         t6, a5, s3
                  fle.s        t4, ft2, ft3
                  fmax.s       fa4, fs9, ft2
                  slt          s5, a2, s4
                  fmin.s       fs4, ft9, ft1
                  fsqrt.s      fs5, ft7, rdn
                  fmax.s       fa5, ft3, fs7
                  fclass.s     s11, ft9
                  ori          s9, t3, -1519
                  fle.s        zero, fa1, ft1
                  xori         s6, tp, 1607
                  ori          s2, s0, 1712
                  rem          t6, a7, s8
                  or           a5, s10, a5
                  fsqrt.s      fs2, fa4
                  lui          s6, 531649
                  divu         ra, a4, sp
                  sltu         a3, gp, s6
                  and          s9, t4, s6
                  fle.s        zero, ft1, fs9
                  andi         s11, s4, -237
                  andi         t2, zero, 89
                  sub          t0, s4, s3
                  or           sp, gp, a7
                  fle.s        t5, fs4, fs6
                  mul          s1, a3, t3
                  nop
                  fmax.s       fs5, ft2, ft5
                  slti         a2, s10, 1686
                  fmin.s       fs5, ft0, fs3
                  fle.s        s9, fs10, ft10
                  srai         a0, a2, 22
                  nop
                  fcvt.wu.s    a5, fs6, rne
                  fsqrt.s      ft6, fs6, rtz
                  andi         zero, s5, -1371
                  fsgnj.s      ft9, ft3, fa4
                  fadd.s       fs8, fs2, fs3, rmm
                  fmax.s       ft11, ft8, fs11
                  fsgnjx.s     fa1, fa5, ft11
                  fcvt.s.w     fs2, a3, rne
                  sll          t6, t5, zero
                  fsub.s       ft11, fs8, ft7, rtz
                  slli         t6, s3, 3
                  addi         a2, a7, 650
                  fsub.s       ft10, fs3, ft5
                  sra          s4, a4, a1
                  lui          t3, 1005217
                  and          s1, a6, s1
                  slli         a4, a4, 14
                  fcvt.s.w     ft9, s2, rmm
                  andi         s7, s6, 40
                  sra          t3, a7, s6
                  nop
                  andi         tp, s4, -166
                  fle.s        s11, fs10, ft11
                  fmv.w.x      ft8, t1
                  fclass.s     s2, ft10
                  sub          s5, s11, a7
                  div          s10, a2, s2
                  flt.s        t5, fa7, fs3
                  srai         t5, a2, 28
                  lui          t5, 851067
                  mulh         t2, s9, t1
                  xor          a4, s7, s11
                  sub          t4, a4, a4
                  slli         a3, a0, 0
                  rem          s7, t6, s10
                  rem          s10, s9, zero
                  flt.s        gp, fa5, fa3
                  sra          s7, t3, s11
                  lui          s4, 464066
                  sltu         s0, s1, t6
                  lui          t0, 119823
                  and          t5, s0, t4
                  fcvt.w.s     s10, fs9
                  xori         zero, ra, -1438
                  fsub.s       fs3, ft8, fs4, rne
                  feq.s        sp, ft10, fs9
                  remu         s6, s9, s4
                  rem          t5, a7, s8
                  srai         t5, tp, 7
                  feq.s        s7, fs10, ft1
                  auipc        t4, 310031
                  fclass.s     tp, fs9
                  rem          t6, a5, s5
                  mulh         a5, s3, s11
                  nop
                  fmax.s       fa2, fs7, ft9
                  fmax.s       fs8, fa0, fs7
                  addi         t2, a1, 1905
                  fcvt.wu.s    gp, ft5, rne
                  fmv.x.w      t1, fs2
                  xori         s8, t2, -1392
                  fsub.s       ft8, fs9, ft3, rtz
                  sub          t4, zero, s6
                  add          t2, a7, zero
                  fmv.w.x      fs3, gp
                  and          s7, s0, t6
                  srai         gp, s11, 2
                  nop
                  feq.s        t4, fs4, fs9
                  ori          t5, s11, 1915
                  add          t5, ra, sp
                  rem          t2, s1, s1
                  fsub.s       fa0, ft6, fa0, rne
                  xori         a2, t5, 95
                  sltu         s1, a2, a2
                  fdiv.s       ft5, fs3, ft9
                  fcvt.s.w     fa3, t2
                  add          s5, a3, a5
                  slli         a0, s7, 27
                  fsub.s       ft4, fs5, ft2, rup
                  feq.s        s2, fs11, ft0
                  fcvt.wu.s    t6, ft9
                  fle.s        ra, fa3, fs6
                  slti         t4, gp, -1724
                  divu         t5, zero, a7
                  rem          sp, ra, ra
                  feq.s        a4, fs0, fs1
                  fmax.s       ft4, fs5, ft0
                  sll          ra, sp, t2
                  and          t1, s4, s7
                  sll          s7, s6, tp
                  addi         ra, t3, 32
                  nop
                  sltiu        s9, a4, -1517
                  fsgnjx.s     fa5, ft5, fs1
                  sltiu        a4, t5, -1820
                  addi         a2, a6, 1246
                  sll          t6, a1, s9
                  srai         sp, s4, 5
                  fcvt.s.w     fa4, ra
                  fclass.s     s10, ft0
                  xor          s0, gp, gp
                  slti         a3, ra, 292
                  fsqrt.s      fs7, ft2
                  xori         s1, ra, -188
                  slli         s2, s7, 21
                  fmin.s       fs7, ft1, fs10
                  rem          a0, s5, s3
                  mulh         s11, ra, t6
                  srl          t0, t6, s0
                  sll          a5, s10, gp
                  ori          tp, t3, -150
                  fmin.s       ft10, fs10, fa0
                  fmul.s       ft9, fa3, fa4
                  mulh         t1, gp, t2
                  addi         s0, sp, -804
                  fmv.w.x      fs10, s8
                  fmv.x.w      t3, fa7
                  nop
                  rem          ra, zero, s9
                  sltu         t5, gp, sp
                  andi         t1, s10, -1196
                  ori          a0, zero, -1269
                  sra          s2, t4, t5
                  fmul.s       ft8, ft4, fa0
                  slt          t1, a1, t0
                  lui          t4, 570253
                  sltiu        t1, gp, -1884
                  ori          t5, a2, 110
                  srl          a3, t5, s7
                  addi         s7, s3, -1984
                  nop
                  fcvt.w.s     zero, fs11
                  xor          s5, s9, s10
                  flt.s        s9, ft3, fs2
                  flt.s        a2, ft0, ft2
                  or           t1, t4, s3
                  remu         ra, a5, t5
                  and          s11, s7, a2
                  addi         a4, s6, 1913
                  mulhu        s5, ra, tp
                  slti         t5, s6, 1701
                  lui          tp, 820694
                  srl          a5, s7, ra
                  fcvt.wu.s    tp, ft8
                  andi         s10, sp, 1661
                  sltu         s8, s3, s3
                  fcvt.w.s     s6, fa3, rup
                  flt.s        zero, ft4, fs0
                  lui          ra, 178331
                  fmul.s       ft9, fa3, fa6
                  slli         t5, a3, 1
                  slt          t3, a4, a5
                  sll          t4, sp, a0
                  sltu         t5, a1, s9
                  fclass.s     a4, fs5
                  flt.s        s11, fa4, ft4
                  fcvt.s.w     fa6, s1
                  fsgnj.s      fs1, fa5, fa6
                  flt.s        t5, fs4, fs4
                  fle.s        s1, fs1, ft1
                  srli         a0, s9, 11
                  fcvt.wu.s    t5, fs0
                  fmv.x.w      sp, fs3
                  fmax.s       fs3, fs2, ft8
                  fmv.w.x      fa3, a2
                  div          a5, t0, s5
                  fadd.s       fa2, fs6, fs5
                  divu         s1, tp, s2
                  fsgnjx.s     fa0, ft5, fs1
                  and          zero, s2, a0
                  flt.s        s6, fa1, ft3
                  fsgnjx.s     fs9, fa6, fs6
                  add          s8, s7, a4
                  fmv.w.x      fa1, t0
                  fsgnjn.s     fa2, fs11, fa6
                  xor          s4, t2, s9
                  add          t0, s1, t1
                  fcvt.wu.s    tp, ft5
                  xor          ra, t5, t6
                  mul          t0, a3, s4
                  add          a2, a5, a7
                  lui          sp, 915493
                  feq.s        s9, fs9, ft10
                  fmax.s       ft10, fs1, fa2
                  fclass.s     ra, fs1
                  fdiv.s       ft5, ft6, ft7, rup
                  fsgnj.s      ft1, fa3, fs1
                  and          t6, a2, a0
                  fcvt.w.s     t3, ft0
                  lui          t3, 853021
                  fadd.s       ft7, fs11, ft3
                  fmv.w.x      fs1, a3
                  fsgnjx.s     ft3, ft1, ft6
                  add          t1, t4, t4
                  srli         a3, a1, 25
                  sltiu        sp, a5, 1612
                  sra          a0, a6, t0
                  remu         t3, a6, t0
                  fcvt.w.s     s0, fs7, rmm
                  slti         ra, a4, -216
                  fsqrt.s      ft1, ft2, rne
                  mulh         t1, t4, s6
                  fsgnjx.s     fs3, ft5, ft6
                  srl          t5, t2, s4
                  mulhu        t3, t1, s9
                  auipc        t2, 913402
                  addi         s4, gp, 915
                  sll          s10, a2, t0
                  fadd.s       fa0, ft2, fs2
                  addi         s5, a2, -618
                  lui          t0, 35035
                  xor          t3, a5, s11
                  fmul.s       fs5, ft4, fs2
                  srai         zero, s9, 13
                  or           s4, a1, sp
                  auipc        t0, 182116
                  ori          s9, t1, -800
                  slli         s4, sp, 7
                  add          s5, a0, t3
                  auipc        s1, 566587
                  srl          s5, s2, t5
                  auipc        t4, 923001
                  ori          s8, s9, -483
                  fsgnjn.s     ft11, fs10, fs8
                  mulh         s6, gp, t0
                  fcvt.s.w     ft2, s1
                  xori         s7, a7, 242
                  fsgnjx.s     fs3, fs6, ft7
                  add          a4, a7, a6
                  fcvt.s.w     fs0, a1
                  or           t5, a4, gp
                  fle.s        s1, fa1, fs0
                  fmax.s       fs8, ft3, ft0
                  sll          tp, a0, s2
                  mulh         t6, a5, a0
                  rem          s6, s5, s4
                  fcvt.w.s     a4, fa5
                  srai         t0, s9, 25
                  rem          t4, s2, a4
                  fmin.s       fs5, fa2, ft11
                  slli         a0, s0, 29
                  fcvt.s.wu    fa7, tp, rne
                  fdiv.s       fs6, ft10, fs4, rtz
                  sra          sp, t5, s9
                  auipc        zero, 117518
                  rem          zero, t1, t3
                  fcvt.wu.s    t3, ft8
                  slti         tp, a0, -1401
                  mul          t6, t6, t6
                  sll          s5, s11, gp
                  fmax.s       ft5, fa0, fs0
                  and          s6, s8, s11
                  fsgnj.s      ft1, fs9, fs6
                  addi         t3, a3, -912
                  fsgnjn.s     fs3, fa2, ft9
                  lui          s5, 148622
                  fmv.w.x      fs2, gp
                  feq.s        a3, ft5, ft3
                  sltiu        s2, s4, 537
                  andi         a5, s0, 1218
                  fle.s        t6, ft11, ft2
                  auipc        a4, 538804
                  fdiv.s       ft10, ft9, ft8
                  fdiv.s       ft11, ft11, fs11
                  sub          s8, s1, zero
                  lui          s6, 415833
                  mulh         s2, a5, a5
                  fmin.s       fs10, fa7, fa2
                  sll          t3, a2, t4
                  srl          t3, s11, a0
                  fsgnjn.s     fs6, fa5, fs5
                  fsgnj.s      fa2, fa1, ft5
                  fmax.s       ft1, fa6, ft9
                  fsqrt.s      fa6, fs7
                  slli         a3, s10, 5
                  fdiv.s       ft7, fa1, fs9
                  fdiv.s       fs11, ft3, fs6
                  fsub.s       ft5, ft10, fs3
                  sub          t5, s3, a4
                  fcvt.s.wu    fa2, t0, rup
                  sll          ra, s7, s9
                  fle.s        s8, ft6, fs6
                  remu         s7, a3, s1
                  fmax.s       fs0, ft11, fa7
                  xor          t6, t2, s6
                  remu         s10, tp, a7
                  sltu         a3, gp, gp
                  fsgnjn.s     ft2, fa7, fs3
                  addi         s11, s11, 1002
                  mul          t5, a5, t4
                  and          a3, s0, s2
                  fclass.s     s2, fs0
                  sltu         tp, s0, a6
                  add          a4, a4, s11
                  mulhsu       t2, a5, t6
                  ori          a2, s1, 1778
                  sra          t6, a5, s7
                  mulhsu       s8, a0, s9
                  xor          t3, s6, a3
                  and          t0, a4, a2
                  slti         tp, t4, -241
                  nop
                  and          s9, a1, s0
                  nop
                  sltiu        s4, a1, 1247
                  sltiu        s2, t4, 1674
                  xori         zero, a6, -105
                  srl          s9, t1, t0
                  fmax.s       fs8, fs11, fs3
                  feq.s        t5, fs6, fa0
                  ori          t2, s0, -1862
                  andi         s5, a6, -940
                  xori         s5, gp, 1727
                  andi         s0, s5, 345
                  nop
                  fcvt.w.s     t1, fa1
                  xor          tp, a2, t3
                  fmax.s       fs8, fs9, fs8
                  fcvt.s.w     ft0, a5, rmm
                  sltiu        a6, t5, 1660
                  flt.s        t3, fa0, fa4
                  slli         s5, s10, 3
                  fcvt.s.wu    fa0, sp, rmm
                  xor          s6, s4, t3
                  mulhu        s6, a3, t2
                  mulh         s9, gp, s11
                  divu         a0, sp, s4
                  remu         t3, s1, t0
                  fmv.x.w      t0, fa2
                  sub          gp, s11, a0
                  nop
                  fmv.x.w      gp, fs4
                  auipc        tp, 453157
                  fmax.s       ft6, ft10, fs6
                  slti         s11, s1, -523
                  slt          s6, a3, a7
                  fmv.x.w      t1, fs11
                  slti         a5, a2, -1438
                  fadd.s       fs0, ft10, fs4
                  sll          t2, t3, a3
                  divu         s5, s9, t6
                  srli         tp, s0, 1
                  fsub.s       fs10, fa2, fs3
                  fcvt.s.wu    fs4, t0
                  fsub.s       fa6, fa3, ft11, rmm
                  srli         s7, a3, 22
                  andi         s8, t2, 670
                  add          a0, t4, s5
                  fsqrt.s      fs5, ft5, rup
                  fclass.s     a3, fa6
                  fclass.s     a6, ft8
                  remu         t4, a7, gp
                  lui          a4, 322624
                  nop
                  ori          s7, t3, 577
                  nop
                  and          s6, s2, s11
                  fle.s        tp, fa3, ft0
                  xor          a2, sp, sp
                  lui          s2, 311536
                  divu         ra, a0, s7
                  xor          t1, zero, ra
                  mulhu        a6, tp, s9
                  auipc        t5, 330638
                  srai         a5, tp, 8
                  xori         s7, t1, 1456
                  fmv.x.w      s9, ft4
                  fmin.s       fa1, ft11, ft0
                  srli         a2, s2, 1
                  feq.s        s10, fs10, fa4
                  remu         s5, s9, s3
                  mulhu        a6, a3, t4
                  srl          s4, a2, sp
                  xori         gp, t6, 1937
                  rem          t1, s9, gp
                  fmin.s       ft4, ft2, ft4
                  fmul.s       ft4, ft3, ft5, rne
                  sltiu        gp, s0, 551
                  addi         s4, s11, 1389
                  sltiu        sp, a0, 73
                  slt          t3, s8, s7
                  fdiv.s       ft8, fs5, fs8
                  remu         s1, a0, ra
                  fsgnjx.s     ft3, ft0, ft2
                  sll          t3, s5, s4
                  mulh         sp, sp, a4
                  fsgnj.s      fa3, fs6, fs0
                  auipc        t2, 579838
                  srli         a6, s1, 14
                  auipc        t3, 113930
                  fsgnj.s      fa5, fs9, fa4
                  ori          t3, a1, 53
                  and          t6, zero, t4
                  fcvt.s.wu    fs3, tp, rup
                  sltiu        s10, s4, 1693
                  fcvt.w.s     ra, ft5, rup
                  ori          s10, a5, -1581
                  and          s6, a7, gp
                  fsqrt.s      fs0, ft11, rdn
                  fmv.w.x      fa6, t0
                  and          s6, s7, sp
                  mulh         ra, t2, sp
                  andi         s0, a0, 1571
                  fcvt.wu.s    a0, ft1, rtz
                  mul          s7, a5, a1
                  nop
                  feq.s        s11, ft3, fa4
                  lui          t2, 423934
                  sub          t0, a4, t5
                  lui          s0, 381528
                  fsgnjn.s     fa4, fa3, fa7
                  fcvt.w.s     s9, ft10
                  remu         tp, s10, a1
                  slti         t1, s11, -1678
                  fsgnjx.s     fs4, ft1, fs0
                  xor          s5, a7, sp
                  mul          s10, s1, ra
                  fdiv.s       ft2, fs1, fa7, rdn
                  andi         t2, a2, -376
                  fadd.s       fs1, fa7, ft7, rup
                  fcvt.wu.s    a6, fs11, rne
                  xori         t0, a3, -1421
                  srli         tp, s7, 20
                  mulhsu       s6, ra, a1
                  fadd.s       ft3, ft1, fs1, rne
                  nop
                  fcvt.w.s     sp, ft6, rup
                  fmv.w.x      fa5, s7
                  fcvt.s.w     ft9, s7, rne
                  nop
                  rem          t1, s11, t2
                  fsub.s       fs3, ft3, ft9
                  fsgnjx.s     ft11, ft9, fs3
                  nop
                  and          t5, s4, s0
                  and          t4, s4, t1
                  fcvt.w.s     tp, ft11, rdn
                  fsub.s       fa0, ft3, fa0, rup
                  fadd.s       ft2, fa7, fa4, rmm
                  remu         a6, t2, s11
                  and          s2, t4, t6
                  and          s9, a4, t4
                  fsqrt.s      fs6, fs11
                  mulhsu       s4, ra, gp
                  feq.s        t5, ft1, fa3
                  addi         sp, s0, -1910
                  fsqrt.s      ft10, ft9
                  divu         t1, s1, a7
                  sltiu        t5, sp, -816
                  fcvt.s.w     ft9, a4, rup
                  fmax.s       fs3, fs8, fs8
                  fmv.w.x      fa2, a4
                  fclass.s     t6, ft9
                  mulhu        t2, t4, a7
                  slt          ra, t3, s9
                  fdiv.s       ft10, fa6, fs9, rup
                  fsgnj.s      fa4, fa0, fa6
                  and          t4, a1, a0
                  fadd.s       fs8, fs1, fs3, rup
                  andi         s4, ra, 1344
                  or           s10, tp, ra
                  flt.s        s0, fs8, fs9
                  fmax.s       fs7, fa7, fs10
                  fsqrt.s      ft6, ft2
                  fmul.s       fs0, fs11, ft1
                  andi         t1, zero, 1422
                  fmul.s       fa0, ft4, fa5, rne
                  fcvt.wu.s    ra, fa6
                  slli         ra, t6, 17
                  fcvt.w.s     s11, fs11, rtz
                  fmax.s       ft2, fs11, ft1
                  addi         s9, t3, -1797
                  srai         s11, s11, 15
                  mulhsu       a6, a6, s9
                  xori         t6, t5, -295
                  flt.s        t5, fs6, fs1
                  sra          t5, s8, a7
                  add          s8, s0, zero
                  sra          a4, t1, a2
                  sra          s2, s3, s8
                  srli         t1, s3, 11
                  div          zero, s10, t2
                  auipc        s0, 5468
                  or           t1, a2, t3
                  fdiv.s       fa7, fa7, fa3
                  xor          gp, zero, s5
                  fmax.s       fa5, fa2, ft1
                  flt.s        s1, fa3, ft9
                  fmin.s       fs0, fa4, ft2
                  ori          ra, a0, -1034
                  fmin.s       ft6, ft3, fs6
                  fle.s        s4, ft0, ft9
                  fmul.s       fs0, ft6, fs2
                  or           t4, s7, t6
                  fclass.s     a5, fs8
                  mulhsu       t0, s8, a6
                  fmv.x.w      tp, fa0
                  fdiv.s       ft7, fs6, fs11, rmm
                  mulh         t4, t1, s4
                  sltiu        a3, a3, 1026
                  fmv.x.w      s10, fs1
                  fmax.s       ft6, ft4, fa6
                  mulhu        s1, t1, a0
                  fsgnj.s      ft5, fs4, fs5
                  slti         ra, sp, 1882
                  fsqrt.s      ft2, fs2, rup
                  feq.s        a4, ft5, ft0
                  ori          s9, t3, 1933
                  mul          s9, s3, s3
                  slt          s10, s9, a7
                  auipc        a3, 413656
                  sub          s10, a4, s4
                  fadd.s       fs5, ft6, fa6
                  mul          t4, t4, ra
                  remu         zero, a1, t5
                  mulhsu       tp, t0, sp
                  fclass.s     s6, ft10
                  mul          a4, tp, t5
                  fsub.s       fs11, fa0, ft11, rne
                  feq.s        t1, ft0, ft3
                  feq.s        t5, fa7, ft1
                  sltiu        a6, a4, -1754
                  fcvt.w.s     gp, ft6
                  divu         a2, s10, t6
                  sub          s11, a0, s11
                  auipc        t4, 136089
                  slti         s7, s10, -2040
                  fle.s        tp, ft8, fa5
                  mulh         s4, t1, s11
                  slti         t3, zero, -1214
                  slt          t1, t0, s8
                  and          zero, s6, ra
                  fcvt.w.s     t6, ft7
                  srl          s8, s6, t5
                  fmax.s       fs5, fs0, fa7
                  fmul.s       ft9, fa3, fa2
                  fcvt.w.s     tp, fa4, rdn
                  nop
                  flt.s        a4, ft7, fs11
                  sll          t2, t1, s6
                  or           tp, sp, a1
                  srli         s5, a5, 2
                  fle.s        s11, ft9, fa0
                  add          s7, zero, a1
                  and          s0, a0, t2
                  feq.s        a5, ft2, fs11
                  slti         gp, s6, 1632
                  fsgnj.s      ft3, ft5, ft11
                  divu         zero, s4, t2
                  div          s11, t6, s3
                  mul          a2, s11, s11
                  sra          s11, a2, t2
                  fsgnjx.s     fa6, fs3, ft4
                  fmv.x.w      a4, ft5
                  divu         a6, s0, a3
                  flt.s        t4, ft2, ft7
                  sra          a6, s5, s8
                  fmv.x.w      t2, fs2
                  fsub.s       fs5, fs6, fa4, rmm
                  fcvt.s.w     fa0, a3
                  fmax.s       fs4, fa2, fs6
                  fmin.s       fa0, fa0, fs1
                  flt.s        a5, ft0, fa7
                  fmv.x.w      ra, ft2
                  fmax.s       ft3, fa0, ft0
                  divu         a6, t4, a6
                  xori         a5, tp, -246
                  fsgnjx.s     fs7, fs2, fs7
                  xori         t0, a1, 1772
                  fmv.w.x      fs9, s0
                  fmax.s       ft2, fs8, fs5
                  add          a5, s9, a7
                  or           a4, a3, a6
                  feq.s        sp, fa0, fs0
                  xori         gp, t1, 1558
                  fclass.s     zero, ft8
                  fmv.x.w      ra, fs10
                  fsqrt.s      fa3, ft0, rdn
                  fmv.w.x      ft9, gp
                  or           t6, tp, a7
                  srai         s5, s5, 7
                  remu         s10, a7, a3
                  sltu         a0, a7, tp
                  fcvt.wu.s    s6, ft8, rmm
                  fmin.s       ft5, fs11, fa1
                  feq.s        t2, fa1, ft0
                  mulhu        s8, t2, s11
                  fadd.s       ft2, fs11, fs2, rne
                  sll          s7, a7, a1
                  feq.s        a3, fs8, fs3
                  slli         zero, a3, 3
                  mulh         s4, tp, s0
                  fmv.w.x      fs8, t6
                  srai         zero, s10, 11
                  ori          t4, t5, -520
                  lui          sp, 954242
                  flt.s        t5, ft7, fa2
                  nop
                  fsgnjn.s     fs5, fa4, fs6
                  fcvt.s.wu    ft4, t2
                  sltu         a3, a3, t1
                  or           a2, s6, s9
                  sll          t4, a2, a0
                  divu         s4, s4, s10
                  ori          s0, t2, -1428
                  flt.s        t2, fs10, fs9
                  sltu         s8, a5, s6
                  srl          sp, gp, a1
                  feq.s        a5, ft10, ft7
                  fclass.s     s7, ft11
                  feq.s        s7, fs2, ft10
                  srli         s6, a6, 8
                  lui          s4, 300473
                  sll          sp, a2, ra
                  slli         zero, t1, 30
                  fadd.s       ft3, ft0, ft3, rne
                  slt          sp, a6, t5
                  remu         t1, t1, t1
                  fsgnjn.s     fs9, ft6, fs8
                  fmul.s       fs6, ft10, fs6, rup
                  fadd.s       fa1, fs1, ft7
                  rem          sp, s9, t6
                  sll          a3, gp, s2
                  andi         s4, s0, -1362
                  mulh         a3, t1, t3
                  andi         t4, a4, 96
                  or           s7, t3, a4
                  remu         s1, s3, a2
                  sra          t6, sp, gp
                  flt.s        sp, ft4, fa0
                  feq.s        s5, fa1, fa2
                  sub          a5, s9, s1
                  fmax.s       ft9, fa5, fa7
                  feq.s        s9, fa5, ft5
                  feq.s        s5, fa5, fs0
                  fcvt.wu.s    t4, ft2, rtz
                  fsqrt.s      ft11, ft7, rmm
                  fcvt.w.s     a4, ft6, rdn
                  remu         s5, s8, t4
                  fsub.s       ft11, fa0, fa4, rup
                  ori          s5, a5, 568
                  fsgnjx.s     fa3, ft11, fs3
                  xor          t6, t0, s1
                  fmv.w.x      fs9, s2
                  nop
                  sltiu        s10, s10, -1959
                  fcvt.s.wu    fs0, t1
                  auipc        s0, 942657
                  addi         t3, s10, 1462
                  lui          t6, 1023590
                  mulhu        s4, s8, s11
                  divu         t1, a2, a0
                  fcvt.s.w     fa2, t2
                  addi         zero, s1, -303
                  and          t4, t1, s1
                  or           a6, s2, s7
                  mulh         tp, a3, s7
                  xor          tp, t1, zero
                  sltu         t2, s4, sp
                  div          s11, a4, a0
                  fmul.s       fs7, ft7, ft0, rne
                  mulhu        t2, s6, gp
                  fle.s        a0, fs0, ft4
                  fsub.s       ft11, ft7, ft10, rtz
                  srai         s4, sp, 8
                  fmax.s       fs0, fs10, ft11
                  fclass.s     s2, ft9
                  remu         a3, s2, t4
                  fsqrt.s      ft11, fa5
                  mul          t6, sp, a0
                  mulhu        t2, s10, a4
                  xor          a4, s2, s3
                  fsgnjx.s     fs7, ft4, fa0
                  fsgnjx.s     fa3, ft7, fs9
                  fclass.s     a5, fa3
                  fsgnjx.s     ft4, ft1, fs1
                  sra          a6, s4, gp
                  xor          s6, a5, ra
                  xor          s6, s4, s0
                  fcvt.w.s     a6, fa6, rtz
                  sub          t6, s8, t6
                  fadd.s       ft5, fs8, ft4, rdn
                  fsgnjx.s     fa5, fa5, fs6
                  slt          s4, gp, t2
                  xori         sp, s4, 1695
                  andi         t3, t0, 1963
                  mul          ra, s10, t6
                  div          s11, s10, s7
                  slti         s1, a6, -1841
                  fmin.s       ft9, fs3, ft1
                  sll          t4, s5, s9
                  slli         t0, a7, 21
                  nop
                  fclass.s     s11, fs5
                  fcvt.wu.s    a0, ft10, rtz
                  fsgnjx.s     ft6, ft6, fa7
                  sltu         gp, s7, t1
                  fmul.s       fa4, fa5, ft2
                  div          t6, s10, s10
                  fcvt.s.w     fa3, t1, rmm
                  fmin.s       ft3, ft8, ft1
                  mulhsu       s0, t4, s3
                  sub          a4, a2, s1
                  fsgnjn.s     ft0, fs5, fa1
                  srai         s11, s5, 28
                  fmul.s       fs0, fs10, fs2
                  fmv.w.x      ft8, s3
                  andi         a6, t2, 1083
                  add          a3, ra, ra
                  or           a3, s4, gp
                  remu         s4, a5, a5
                  fcvt.s.wu    fs10, s8
                  flt.s        s9, fs11, ft1
                  add          a6, tp, s3
                  divu         sp, a3, t5
                  lui          s6, 187665
                  feq.s        t4, fs3, ft8
                  sltu         s4, s7, s0
                  remu         t5, s10, a3
                  mul          s6, a0, a7
                  fclass.s     t4, ft0
                  fclass.s     sp, fa1
                  flt.s        s2, ft3, fs9
                  fclass.s     gp, fs5
                  sltiu        t2, t2, 1347
                  and          a4, s7, sp
                  fadd.s       ft11, fs9, fs8, rdn
                  feq.s        sp, fs11, ft8
                  mulhsu       s9, s11, t3
                  srli         t3, s0, 8
                  or           s4, ra, t3
                  fcvt.s.w     fs1, s7, rmm
                  add          t1, gp, a7
                  fsqrt.s      fs7, fa0, rdn
                  fle.s        s6, ft0, fa1
                  fsqrt.s      fs9, fa5
                  fcvt.s.wu    ft8, a6, rdn
                  srai         s9, ra, 6
                  fmv.x.w      s1, fa1
                  fsgnjx.s     fs2, fa3, ft4
                  sltiu        a5, t4, -1419
                  fmin.s       fs2, fa7, fa6
                  fsgnjx.s     fs0, fs2, fs6
                  sub          gp, t1, s8
                  slti         t4, tp, -1402
                  fmv.x.w      t4, fa5
                  slli         a6, s7, 0
                  add          a2, a5, t0
                  nop
                  sltu         s6, t2, t3
                  srai         s4, sp, 15
                  slti         s4, a4, -1015
                  sll          a3, ra, tp
                  nop
                  remu         s1, a1, t6
                  fcvt.wu.s    a0, ft8, rtz
                  ori          t1, t0, -1059
                  fsub.s       fs0, fa2, ft4, rup
                  and          s11, tp, a3
                  fadd.s       fs3, fa5, ft9, rdn
                  rem          a6, a0, tp
                  lui          s11, 56036
                  ori          a4, s11, -459
                  fclass.s     s4, ft8
                  fcvt.w.s     t0, fs10, rne
                  ori          s6, s11, -939
                  or           s4, a3, t2
                  and          a3, t4, sp
                  sll          t2, s3, a7
                  sltiu        t3, t0, 923
                  addi         s10, gp, -2032
                  fsqrt.s      fs8, fs4, rup
                  fcvt.s.wu    ft5, sp
                  fclass.s     a5, fs9
                  slti         s6, a2, 265
                  xori         s5, s9, -516
                  andi         sp, a5, 271
                  fmv.w.x      ft9, a1
                  fsgnj.s      ft10, ft4, fs1
                  fdiv.s       fs4, fs9, ft3, rtz
                  fle.s        sp, fa7, fs7
                  sra          gp, a6, t0
                  fmul.s       fa7, fs9, fs1
                  srl          a5, t2, s2
                  fcvt.w.s     a4, fs8
                  fmv.w.x      fa0, s0
                  srl          t4, s0, s4
                  lui          a3, 490683
                  srl          s4, t3, a5
                  fsqrt.s      fa2, ft10, rtz
                  fsqrt.s      fa5, ft2, rup
                  fadd.s       fs8, fs10, ft4, rne
                  fsub.s       ft2, ft2, fa6, rup
                  fmul.s       fs2, fs7, fs7, rne
                  fmul.s       ft8, fs2, fs5
                  sltiu        s9, s0, -1692
                  rem          a4, a1, tp
                  sub          t2, s11, a3
                  lui          t1, 257380
                  srl          tp, a2, s2
                  xori         t0, a6, -1625
                  fdiv.s       fa2, fa0, fa4, rtz
                  fle.s        s8, fs2, ft4
                  divu         t5, a6, s2
                  fle.s        gp, fs1, fa2
                  sltiu        sp, t3, -1861
                  remu         sp, gp, t3
                  divu         a5, t1, s0
                  fsqrt.s      fs6, fa0, rmm
                  fmv.x.w      sp, fs7
                  addi         s7, a3, 809
                  fsub.s       ft7, ft8, ft2, rtz
                  fle.s        s6, fs10, fs10
                  rem          s5, t5, a6
                  fclass.s     a2, fs0
                  fsqrt.s      fa5, fs0, rmm
                  fsub.s       fa7, fa3, fs1, rne
                  fcvt.wu.s    s5, fa5
                  slti         gp, a6, 548
                  fcvt.s.wu    ft7, s10, rup
                  srai         t1, s6, 4
                  slli         s11, a2, 20
                  srli         a3, t3, 4
                  fdiv.s       fa3, ft0, fs11, rtz
                  divu         s9, s3, a1
                  fsqrt.s      fa7, fa2, rup
                  slt          t3, t2, zero
                  fcvt.s.w     fs4, sp
                  fsub.s       fa4, fs10, ft0, rdn
                  fdiv.s       ft6, fs0, ft9, rmm
                  slli         s7, t6, 14
                  fle.s        t6, ft0, fa1
                  sltiu        a5, s6, 1808
                  sltiu        gp, a1, -26
                  sltiu        t2, s2, 496
                  fcvt.wu.s    t4, fa3, rdn
                  divu         a4, s8, s10
                  fle.s        a5, ft11, fs5
                  srli         t3, s0, 24
                  srl          t2, s11, s5
                  xori         s10, a5, -233
                  fsgnjx.s     fa5, ft2, ft0
                  xori         a4, a7, 690
                  mulh         s9, a0, a6
                  slt          tp, s4, t1
                  divu         a4, s1, s4
                  slti         t6, zero, -804
                  mulh         a5, tp, t5
                  divu         a6, s6, ra
                  and          t4, a0, sp
                  divu         zero, a6, sp
                  fmul.s       ft9, fa7, ft3, rdn
                  xor          t1, zero, t0
                  srl          a4, s9, sp
                  fsqrt.s      ft6, fs7, rne
                  fcvt.wu.s    s1, fa7, rdn
                  fmul.s       ft9, fs5, ft8
                  fsub.s       ft6, fs10, ft11
                  fdiv.s       fs0, fa5, fs9, rtz
                  srl          gp, a3, s8
                  fadd.s       ft3, fs7, ft11
                  nop
                  auipc        t3, 615961
                  mul          a0, t6, a5
                  slt          a6, t5, t5
                  srli         s0, a1, 5
                  fcvt.w.s     s8, ft9
                  mulhu        s4, t6, a7
                  srli         t5, s5, 8
                  sltu         t6, a1, gp
                  sra          s11, s11, s9
                  fsgnj.s      ft9, ft6, ft9
                  mulhu        s10, gp, t3
                  fcvt.s.wu    ft3, s1
                  slti         s5, a0, -1700
                  andi         s8, t6, 1144
                  fdiv.s       fa5, fs5, ft4, rup
                  sltiu        sp, a5, -1735
                  or           sp, a1, a5
                  fcvt.w.s     s10, ft5, rup
                  mulhsu       a6, a1, s11
                  auipc        t3, 1002073
                  sub          t1, a4, t5
                  xori         sp, tp, -172
                  and          t0, a1, a6
                  nop
                  fmul.s       fs8, ft6, fs8, rup
                  xori         a4, s8, -1822
                  auipc        s9, 597415
                  divu         a6, t4, s4
                  fclass.s     t4, fs10
                  nop
                  fdiv.s       ft10, fa6, fa1
                  divu         s6, t0, a0
                  remu         a0, t2, s6
                  slli         s6, s5, 29
                  slt          s6, sp, a6
                  xor          a3, s6, s4
                  fcvt.s.w     fs11, sp
                  fadd.s       ft4, ft10, fs4, rtz
                  fsqrt.s      fs0, fs4
                  nop
                  srli         t6, a7, 16
                  fcvt.s.wu    fs0, s0
                  feq.s        ra, fs10, fs8
                  slti         s2, tp, 621
                  xor          s7, t3, s11
                  feq.s        a4, ft10, ft6
                  slti         t4, ra, 1631
                  fmax.s       ft0, ft7, fs9
                  fmv.w.x      fs9, zero
                  fclass.s     s6, fs6
                  fmv.x.w      s6, fa7
                  sra          tp, t1, s10
                  lui          zero, 381792
                  or           t6, a2, s10
                  fadd.s       ft7, fs3, ft9
                  fsub.s       fa5, ft5, fa1
                  fsgnj.s      ft1, fs2, ft8
                  slt          s11, a3, sp
                  andi         s8, s10, 1571
                  and          t6, t6, sp
                  sra          s10, ra, s9
                  rem          t1, s3, a6
                  fsgnj.s      fs5, ft3, ft3
                  fadd.s       fa0, ft10, fs3, rtz
                  mulhu        s2, s4, a2
                  mul          a4, a3, a1
                  fdiv.s       fs1, fa1, ft4, rup
                  flt.s        s2, fs2, fa1
                  fsgnjx.s     ft10, fa5, fs6
                  fadd.s       ft7, fa1, ft6, rdn
                  fcvt.s.w     ft7, s6
                  xor          t3, s7, tp
                  fcvt.w.s     s11, fa1
                  divu         t0, a4, s11
                  fadd.s       ft11, ft5, fa0
                  fsgnj.s      ft11, fa3, ft4
                  mulhsu       s0, s5, t5
                  remu         s5, tp, gp
                  fsgnj.s      ft1, fa5, ft9
                  sub          a4, s0, zero
                  srli         a0, t1, 25
                  srli         t2, s1, 15
                  fmv.w.x      ft11, a0
                  sltiu        t0, s11, 31
                  div          s7, t3, s6
                  sltiu        a3, s5, 414
                  lui          gp, 439425
                  fcvt.s.wu    fa6, t3
                  sltiu        a4, s6, 1924
                  ori          s8, a7, 197
                  flt.s        zero, fa3, fa5
                  sltiu        tp, s5, 1562
                  fmv.x.w      t4, fs8
                  flt.s        gp, fs10, ft5
                  mulhsu       tp, s0, a6
                  fadd.s       ft11, ft10, fa0
                  sub          s7, s11, t1
                  fadd.s       ft10, ft9, ft2, rdn
                  remu         t0, a1, ra
                  fmax.s       fa3, ft5, fs11
                  fmax.s       fs9, fa0, ft4
                  fle.s        s4, fs9, fa3
                  fmax.s       fs0, fa2, ft0
                  fmv.x.w      t6, ft5
                  fcvt.wu.s    t2, fs8, rup
                  sltu         a3, a1, zero
                  slli         s4, a0, 3
                  andi         s4, a0, 1275
                  nop
                  auipc        a6, 388047
                  slti         s5, sp, 1299
                  srai         s2, s10, 21
                  mulhu        s1, zero, a0
                  divu         a4, s10, a1
                  mulhu        a4, gp, gp
                  xori         a4, a5, -949
                  fsqrt.s      ft9, fa5, rmm
                  fmin.s       fs1, fs8, ft2
                  add          tp, t1, s7
                  add          s8, t5, a0
                  xor          t3, a1, s5
                  and          t3, t4, a4
                  lui          a3, 851808
                  fclass.s     a2, fa6
                  andi         s5, t2, -404
                  mul          sp, s9, a6
                  fcvt.s.w     ft2, s4, rdn
                  fle.s        s1, ft4, ft6
                  fcvt.s.wu    ft6, s8
                  fsub.s       fs5, fs9, ft4
                  flt.s        a4, ft10, ft4
                  and          s7, a0, s10
                  xori         s8, t4, -714
                  andi         s6, s7, -1315
                  auipc        ra, 352162
                  srli         s6, s2, 17
                  fsgnjx.s     fs2, fs6, ft8
                  add          s0, tp, a5
                  mulh         s0, s11, a2
                  xor          t5, zero, s4
                  fcvt.wu.s    s6, fa2, rne
                  slti         s0, t2, -824
                  slti         s2, s7, -2043
                  and          s4, s0, a2
                  mulh         s5, t2, s6
                  sub          t5, a5, s9
                  mul          a6, s2, t4
                  srai         s4, s5, 30
                  srli         s7, s6, 20
                  xor          ra, zero, s7
                  auipc        s7, 479531
                  nop
                  sub          t4, t2, t6
                  sltu         t0, a0, t1
                  ori          t4, a7, -352
                  mulh         s9, t0, s10
                  fcvt.wu.s    t5, ft9, rtz
                  auipc        t5, 529519
                  mul          s11, s0, gp
                  div          a6, t1, gp
                  add          t4, sp, a4
                  xori         tp, zero, 363
                  fsub.s       ft10, ft2, fa2, rne
                  divu         t2, a4, tp
                  fcvt.w.s     gp, fs6, rdn
                  nop
                  fle.s        t6, ft7, fa6
                  auipc        a0, 77452
                  lui          a5, 14557
                  sra          s2, a6, s4
                  sra          a0, s8, s1
                  nop
                  slt          t4, a3, sp
                  fdiv.s       ft9, ft4, ft9
                  fmax.s       fs4, fa0, fa0
                  fdiv.s       fa1, fs1, ft4, rdn
                  ori          s1, t2, 195
                  fcvt.w.s     gp, fs6, rmm
                  fcvt.s.w     fs3, zero, rne
                  nop
                  xor          a4, a7, a0
                  divu         tp, t1, s9
                  fmv.w.x      ft10, a1
                  srai         t4, a0, 20
                  div          ra, gp, t6
                  fsgnj.s      fs7, ft8, fa0
                  addi         t3, ra, 1450
                  rem          t2, s3, s3
                  mulh         t1, s10, s9
                  mul          zero, s0, t1
                  addi         t6, sp, 1800
                  fmv.x.w      a2, ft6
                  fsgnjx.s     fs2, fa6, fa3
                  fcvt.s.wu    ft2, t1, rup
                  add          s7, s11, a7
                  mul          s1, t3, a4
                  fsgnjn.s     ft9, ft9, ft7
                  auipc        s4, 66904
                  fsgnj.s      ft1, fa7, fs7
                  and          s2, a5, s0
                  fsgnj.s      fa7, ft2, fa7
                  fadd.s       fs5, fs11, fs5, rdn
                  and          ra, a3, a6
                  fadd.s       fa7, fa6, ft9, rmm
                  lui          t4, 123676
                  flt.s        a4, fs9, ft8
                  feq.s        s0, fs9, fa7
                  fcvt.w.s     s11, fs9
                  rem          s4, s5, s1
                  sll          t4, s4, zero
                  fsgnjn.s     fs1, fa4, fa0
                  fsgnj.s      fs0, fs8, ft0
                  mulhu        t5, t0, s1
                  remu         gp, a5, sp
                  fmul.s       fa7, fs6, fs1
                  fmv.x.w      t6, ft6
                  sltiu        a2, s4, -537
                  xori         ra, a6, -975
                  fsqrt.s      fs5, fa6
                  fcvt.s.w     fs10, t4
                  fsub.s       ft6, fs11, ft3, rdn
                  fdiv.s       fa6, fs4, ft5, rup
                  mulhu        s11, s8, s10
                  addi         a2, gp, 1294
                  fmv.x.w      s11, fs4
                  fcvt.s.w     fa2, a0, rmm
                  fmul.s       fa4, ft7, fa4
                  srai         t2, a1, 21
                  fsqrt.s      ft1, fs3, rne
                  rem          s5, s0, a0
                  feq.s        t2, fs5, ft2
                  lui          s4, 253751
                  flt.s        s2, ft2, fa2
                  fmin.s       fs6, fs8, fs11
                  mul          s11, s8, s5
                  remu         t5, s9, a1
                  or           t0, tp, sp
                  fcvt.s.wu    fs3, s1, rmm
                  and          t1, a7, s7
                  srl          tp, t0, t4
                  feq.s        s0, ft0, fs10
                  divu         a5, t2, s4
                  fsqrt.s      fs2, fs4
                  rem          a5, t4, s11
                  srl          sp, tp, s1
                  andi         tp, t6, 478
                  auipc        s5, 818917
                  sll          a0, a0, t5
                  xor          a6, s7, a3
                  fsub.s       fa6, fs0, fs4
                  srli         s7, a1, 18
                  srai         t4, ra, 0
                  fsgnjn.s     fa6, ft8, fa0
                  fcvt.w.s     a0, ft1
                  fmul.s       fa4, fs6, fs4, rtz
                  fsub.s       ft5, fs7, fa3
                  fadd.s       fs3, fs4, fa1, rup
                  fcvt.s.wu    fs10, s8
                  fmax.s       fs5, ft2, fs6
                  ori          s11, s8, 1606
                  or           a4, t5, a2
                  fclass.s     ra, ft6
                  fle.s        sp, fs6, fs0
                  ori          t5, sp, -1499
                  fadd.s       fs3, fa5, ft6
                  xor          s0, a3, t6
                  fdiv.s       fs0, ft5, fs8, rmm
                  slt          s10, s6, t1
                  fmax.s       ft5, fa6, fa6
                  rem          a0, a2, s2
                  fmin.s       fs4, ft6, fs10
                  srai         zero, tp, 4
                  slt          ra, t0, t0
                  feq.s        gp, fs7, ft10
                  slli         t3, zero, 3
                  div          a4, sp, t1
                  xori         a2, s9, -173
                  fsgnjx.s     fa5, ft5, fa4
                  fmin.s       fs8, ft10, ft2
                  sltu         s10, s3, t0
                  fcvt.w.s     a3, fs8, rdn
                  fsqrt.s      fs8, ft7
                  sltu         tp, sp, zero
                  feq.s        s0, ft9, ft11
                  fsgnj.s      fa5, fs0, ft9
                  rem          a0, t4, s8
                  fcvt.w.s     s0, ft0
                  fle.s        s6, ft6, fs2
                  slli         s6, s6, 29
                  sub          a6, s4, t0
                  fle.s        s5, fs9, fa4
                  mulhsu       tp, s11, t5
                  lui          a0, 455387
                  nop
                  xori         s10, a7, 541
                  mulhu        a5, t5, s9
                  and          s4, s6, a2
                  srl          sp, s8, s0
                  sltu         s5, a7, s8
                  srai         t1, a2, 1
                  fmin.s       fs10, fs5, fa7
                  feq.s        a3, ft5, ft11
                  fmin.s       fs9, ft8, fs0
                  fmv.w.x      ft8, tp
                  srli         s5, s6, 9
                  fmin.s       ft4, fs2, ft9
                  rem          s11, s3, t1
                  fcvt.wu.s    t2, fs6
                  mulhsu       s10, tp, t3
                  or           a0, s7, a0
                  mulh         gp, tp, t2
                  fcvt.s.wu    ft2, s4
                  fadd.s       fs11, fa2, ft1, rmm
                  fsub.s       fs7, fa0, ft1
                  xor          s8, a6, s1
                  sltu         a0, a2, s0
                  fmv.x.w      s1, fa5
                  fcvt.s.wu    fa2, s3, rdn
                  sltiu        gp, a4, 937
                  auipc        a0, 12345
                  sll          a6, t0, t2
                  xori         a0, t0, -725
                  feq.s        s2, fa4, fs6
                  andi         a5, s10, -1880
                  rem          s10, tp, s0
                  fsgnj.s      fa0, ft2, fs8
                  mulh         t0, s1, t1
                  lui          t6, 361545
                  nop
                  fsub.s       fa1, fs11, fa0
                  xori         s7, s6, -291
                  add          s11, s10, s2
                  mul          s0, s7, a0
                  xor          sp, gp, t2
                  sra          a5, t6, sp
                  nop
                  rem          gp, tp, s2
                  slli         s0, t5, 12
                  fmv.w.x      fs0, a3
                  mulh         s5, s10, t4
                  fle.s        s4, fs10, ft3
                  and          s10, s11, t5
                  mulh         s2, s6, a5
                  srai         s11, t0, 10
                  sltu         s11, s7, s5
                  slti         a3, s2, -1295
                  rem          t5, a3, a0
                  nop
                  sltu         t1, s10, a6
                  fmin.s       fa2, fs11, ft8
                  sltu         t4, a6, zero
                  srai         s7, s10, 28
                  fsub.s       ft10, fa4, ft10, rdn
                  xor          t6, s0, s7
                  div          t4, s0, t3
                  fcvt.wu.s    s0, ft4
                  fcvt.s.wu    ft2, s5, rdn
                  addi         ra, a7, -1678
                  mulh         gp, s5, a0
                  fmv.w.x      fs9, s8
                  mulhsu       s5, a1, s6
                  fcvt.s.wu    fa2, s10
                  sltiu        a0, ra, 1734
                  nop
                  div          s4, sp, a0
                  div          a0, a5, t1
                  fsqrt.s      fa0, fa0, rtz
                  mul          a3, a0, s8
                  xor          s0, t2, a5
                  srl          tp, s9, t0
                  fmax.s       ft0, fa0, ft7
                  mulh         s1, a7, ra
                  feq.s        s6, ft1, fs3
                  or           zero, a2, a6
                  sll          t4, s9, s3
                  sltiu        a0, s9, -969
                  fcvt.s.wu    fa0, t3
                  fclass.s     t5, fa6
                  sltiu        s4, a6, 896
                  nop
                  fcvt.s.w     ft0, a4
                  slt          t3, t1, s3
                  srai         a5, t6, 1
                  divu         zero, s5, s1
                  andi         a0, s10, 857
                  nop
                  mulh         s6, a1, a6
                  flt.s        a5, ft11, fs8
                  xori         s11, zero, -1580
                  sra          s11, a1, a2
                  nop
                  fcvt.w.s     a6, fs2, rdn
                  sltiu        s1, t3, 1107
                  fmin.s       fs10, fs0, ft7
                  lui          s2, 1032555
                  auipc        a2, 682392
                  srli         t1, s2, 20
                  add          s10, s9, a7
                  andi         a3, s11, 1568
                  sra          t0, t6, t4
                  fsgnjx.s     fa0, ft6, ft3
                  addi         s2, t2, -141
                  nop
                  fsgnjn.s     ft1, ft4, fa0
                  or           ra, sp, s4
                  mulhsu       a0, s8, a2
                  flt.s        t0, fa1, fa4
                  remu         a2, a5, gp
                  mulhu        s0, a0, a1
                  srli         a6, s10, 3
                  fsgnjn.s     fs0, ft10, fs2
                  remu         s8, t4, s0
                  mul          t2, t4, t4
                  xor          s11, a6, t2
                  sll          t1, a2, s4
                  sll          t4, s5, zero
                  sra          a3, s8, a4
                  srli         s11, a0, 30
                  flt.s        a0, fs5, ft10
                  fsgnjx.s     ft5, ft10, ft10
                  sll          s9, a0, gp
                  fle.s        s1, fs9, fs4
                  add          sp, zero, a0
                  fsqrt.s      fa0, ft3, rtz
                  nop
                  xor          a6, t2, s11
                  mulh         tp, sp, zero
                  fle.s        s8, ft3, fa0
                  remu         t4, t6, tp
                  fle.s        ra, ft7, ft4
                  addi         t2, s2, -535
                  fsgnjx.s     ft9, ft8, ft5
                  sll          s8, a7, t5
                  and          t3, s5, a6
                  fmul.s       fa5, ft6, ft6, rup
                  fmul.s       fs5, ft9, fs7, rtz
                  add          t0, s5, s11
                  fcvt.s.wu    fs4, s11
                  sltu         s0, s10, sp
                  sltiu        ra, a2, 826
                  slti         s6, a2, -356
                  srli         s6, s5, 25
                  xor          s2, a0, s9
                  fmin.s       fs8, fs2, fs9
                  add          t1, s5, s3
                  fcvt.w.s     s2, fs9
                  slt          zero, s1, s3
                  andi         t5, t2, -804
                  div          s0, a0, a3
                  auipc        s2, 1030945
                  sra          t4, t4, a4
                  srl          s7, s8, ra
                  fcvt.s.w     ft0, a1, rne
                  srli         a4, ra, 6
                  fsgnj.s      ft0, fs9, fs1
                  fsgnjx.s     fa5, fs10, ft8
                  fsgnjx.s     fs3, ft2, fs11
                  sltu         t5, t5, t2
                  xor          t5, a3, s3
                  or           t4, s9, a0
                  fmul.s       fa6, fa1, fa0
                  ori          a4, t0, -1669
                  fsgnjn.s     fa4, fa0, fs8
                  or           s5, s11, s0
                  sll          zero, s4, s8
                  sra          t4, s2, s6
                  mul          s6, s10, t0
                  fmin.s       ft3, fa7, fa0
                  srl          t3, s9, t2
                  slt          s5, t6, t1
                  fmax.s       ft10, fa2, fs5
                  lui          a0, 352966
                  rem          a2, sp, t2
                  fmin.s       fa1, ft9, ft10
                  or           s9, zero, a0
                  fclass.s     zero, fs11
                  div          a2, s2, s9
                  auipc        s7, 435375
                  fcvt.s.wu    ft1, gp, rne
                  rem          a0, s7, ra
                  fsgnjx.s     fa3, fa0, fs6
                  fmv.x.w      s7, fs0
                  mul          a6, s4, s11
                  sltu         s8, a2, s5
                  addi         s4, s3, 214
                  remu         t6, t3, s11
                  fcvt.s.wu    ft2, tp, rmm
                  divu         a2, ra, s9
                  divu         a0, t1, s3
                  mulh         s9, tp, gp
                  srli         s6, s3, 8
                  rem          ra, a1, a1
                  mulhsu       a0, gp, s4
                  fclass.s     t1, fs9
                  fmin.s       fa4, ft4, fs0
                  fmv.x.w      a5, ft10
                  ori          a3, s1, 1867
                  mulhsu       a0, a5, a6
                  sltu         t5, s5, t0
                  mulh         s7, s1, s1
                  slt          s1, t1, a0
                  fsqrt.s      ft6, fs8
                  fclass.s     a4, fs10
                  fsgnjx.s     fa3, ft7, fa0
                  fclass.s     s4, ft8
                  slt          a0, gp, t0
                  xori         t2, s3, -242
                  add          s0, t4, s0
                  add          s5, s4, sp
                  fmv.w.x      ft7, s3
                  fle.s        tp, fa4, ft9
                  flt.s        a6, fs8, fs9
                  feq.s        s2, fa5, fs4
                  ori          gp, a2, 1607
                  fmax.s       ft6, fs1, fa0
                  fcvt.w.s     tp, ft8, rmm
                  andi         gp, t1, 1989
                  fmul.s       fs1, fs1, fa5, rmm
                  and          gp, t3, zero
                  fsqrt.s      fa1, ft2, rne
                  flt.s        t5, fs3, ft2
                  sltiu        a5, s11, 957
                  fmin.s       fs10, fs5, fs1
                  srl          s9, a5, t0
                  srli         s8, s1, 31
                  xor          s11, s10, t6
                  div          s7, tp, s6
                  fcvt.wu.s    a6, ft11
                  nop
                  fclass.s     t4, fs0
                  fmax.s       fa0, ft2, fa6
                  srl          s4, ra, a6
                  fsub.s       fa3, fa2, ft5
                  mulhsu       s2, tp, a2
                  sll          s7, zero, zero
                  fsqrt.s      fs1, fa0, rne
                  andi         s5, ra, 1530
                  fsgnjn.s     fs8, ft10, fa7
                  srai         s5, s8, 4
                  xor          s6, a2, t0
                  slt          s7, s7, s5
                  fsgnjx.s     ft2, fa2, fa1
                  fcvt.wu.s    s1, fs2, rne
                  mulhu        gp, s10, s10
                  fmin.s       ft8, ft10, ft11
                  fcvt.w.s     t0, ft8, rdn
                  mulhu        a0, s6, t2
                  fadd.s       ft7, ft8, fs2
                  slli         a3, gp, 11
                  srl          t4, t1, t1
                  srli         t4, a3, 15
                  xori         t0, s2, 1907
                  mulhu        s0, s0, s8
                  fmax.s       fs5, fs5, ft0
                  sll          s5, a2, s2
                  addi         s2, s1, 777
                  fcvt.wu.s    a4, fs2
                  srai         s9, s4, 3
                  fcvt.w.s     s2, fs0
                  fadd.s       fa4, ft9, fs11
                  slti         s0, s8, 914
                  sltiu        s9, s8, 398
                  fsgnjx.s     fs10, ft1, fa6
                  fmv.x.w      a2, fa4
                  sub          t6, ra, t5
                  add          s2, t4, sp
                  slti         a0, s0, -1658
                  xori         t4, s6, -386
                  fcvt.wu.s    a4, ft1
                  mulh         s8, s10, t1
                  sra          t5, a5, a1
                  srai         t6, s5, 1
                  and          t6, ra, s1
                  fcvt.wu.s    t3, fs2
                  mul          a0, tp, a6
                  fcvt.s.w     fa6, zero
                  fmul.s       fa7, fa6, fs8, rdn
                  add          s8, s7, t4
                  fsub.s       fs11, fa3, ft1, rne
                  slti         a6, a1, -800
                  fmv.x.w      t1, ft7
                  add          s5, t6, s8
                  xor          s2, t5, zero
                  rem          s0, a7, a7
                  fmv.x.w      s2, fs1
                  sra          t0, t1, a4
                  fcvt.s.w     fs2, s7, rtz
                  fcvt.s.w     fs9, t0
                  fcvt.s.w     ft5, s3
                  sra          t2, a7, s8
                  mulhsu       s6, a4, t3
                  srli         t1, tp, 24
                  addi         s6, s10, 1097
                  mulhu        s2, s2, a2
                  fcvt.s.wu    ft5, t2, rtz
                  sra          t3, s5, t6
                  flt.s        a4, ft1, ft4
                  fsub.s       fa7, ft3, ft0
                  fmv.x.w      tp, ft0
                  mulhsu       t2, a3, t1
                  ori          sp, s2, -357
                  remu         s10, a3, a3
                  fmv.w.x      ft6, a6
                  fcvt.s.w     ft3, s10
                  fsub.s       ft7, ft6, fa7
                  mulh         t0, a5, a3
                  fsqrt.s      ft2, fa2
                  slti         sp, a7, 1252
                  flt.s        t6, fs5, ft2
                  flt.s        t5, fs10, fs1
                  rem          gp, s1, s0
                  slli         t1, t3, 18
                  fsgnjn.s     fs4, ft8, ft10
                  xori         s10, zero, 1337
                  sra          a2, t4, gp
                  and          s7, s1, s7
                  sra          a6, gp, a5
                  slli         a2, a2, 22
                  add          s1, a0, sp
                  nop
                  rem          t3, s9, t4
                  sll          a5, s11, a7
                  fmul.s       ft8, fa1, ft8
                  fsqrt.s      fa0, fs9
                  fsgnjn.s     ft11, ft0, fa4
                  sll          s1, a4, a6
                  fsub.s       fs9, fs0, ft1, rtz
                  slt          tp, s3, t4
                  or           a4, a6, s11
                  fcvt.w.s     a6, fa3, rne
                  slt          a6, s11, a1
                  lui          a6, 1011421
                  lui          zero, 1006297
                  fcvt.s.w     fs6, s9
                  sll          ra, t2, t1
                  flt.s        t1, ft2, fa7
                  addi         ra, s11, -1773
                  mul          a0, s1, s2
                  srai         zero, s6, 23
                  fcvt.s.wu    ft3, zero
                  auipc        gp, 881614
                  rem          t0, a6, s6
                  flt.s        zero, fa0, fs7
                  fsgnjx.s     fs0, fa6, fa0
                  div          a0, s3, zero
                  fcvt.wu.s    s1, ft8
                  slti         a2, t0, 1439
                  srai         a6, s3, 4
                  div          s0, s3, zero
                  mulh         s1, a6, s11
                  fmax.s       fa6, fs10, ft9
                  auipc        gp, 65068
                  mul          t1, s4, tp
                  fsgnjx.s     ft4, fs3, fs11
                  fmax.s       fs11, fs8, ft2
                  add          s11, s3, t4
                  fmin.s       fs2, ft2, fs11
                  feq.s        t1, fa4, fs6
                  auipc        a3, 406432
                  divu         s4, ra, zero
                  fcvt.s.wu    ft7, tp, rtz
                  sra          s8, s2, a5
                  fdiv.s       fa0, ft3, ft2
                  fsgnj.s      fa2, fs9, fs4
                  mulh         s6, t0, a0
                  nop
                  fcvt.s.wu    fa1, sp
                  fmax.s       fs6, ft2, ft8
                  ori          t0, s7, 608
                  mul          a2, ra, a3
                  addi         a5, gp, 797
                  fmax.s       fa1, ft11, fs0
                  sra          zero, gp, s8
                  and          s11, s7, a6
                  fcvt.w.s     a2, ft5, rdn
                  rem          a0, s5, s0
                  mulhsu       s0, t1, a3
                  divu         t0, t2, s2
                  auipc        a3, 346718
                  andi         t0, s11, -188
                  mulh         t6, a5, gp
                  fmv.x.w      zero, ft11
                  mulh         t3, gp, t1
                  fcvt.s.w     fs7, a2
                  fmul.s       fa1, fa6, fa1
                  divu         s10, t6, t3
                  ori          a6, gp, -1269
                  fsqrt.s      fs0, ft2
                  fcvt.wu.s    s8, fa2
                  fle.s        s6, fs4, ft11
                  fclass.s     a4, ft3
                  sra          t0, a7, s4
                  srli         s5, s5, 6
                  remu         s6, t3, s4
                  auipc        tp, 186096
                  andi         t1, a1, -1342
                  fdiv.s       fs1, ft11, ft9, rtz
                  fsgnj.s      fa4, ft11, fa5
                  fdiv.s       fs0, fs2, ft3, rdn
                  sra          s7, sp, s2
                  fsgnjx.s     fa3, ft1, fs9
                  nop
                  fsqrt.s      ft4, fs2, rtz
                  fsgnj.s      ft0, fs0, ft4
                  fmv.x.w      sp, fa0
                  fsgnj.s      fa6, fs6, fa4
                  sra          s7, t0, sp
                  slli         s1, s0, 16
                  divu         s4, a3, s0
                  auipc        t1, 36528
                  fsgnj.s      fs11, ft2, ft7
                  feq.s        s9, ft7, ft1
                  slt          t4, s7, t4
                  fsgnj.s      ft6, fa1, ft2
                  fmul.s       ft5, ft4, fs2, rmm
                  flt.s        t1, ft8, fa4
                  fmv.w.x      fs9, s10
                  and          a6, s1, tp
                  slti         a2, a3, 1537
                  fmv.x.w      s10, fa0
                  fsgnjx.s     fs7, ft0, ft3
                  rem          a5, t0, s6
                  fsgnj.s      fa2, fs4, fs8
                  fsgnj.s      fa0, fa4, ft1
                  fsub.s       ft10, ft2, fs9, rup
                  add          s10, s9, s6
                  fsub.s       fs6, fs10, ft11, rmm
                  xor          a5, a7, t5
                  divu         t2, s6, s10
                  fmv.x.w      s6, ft7
                  add          tp, gp, s3
                  feq.s        s1, ft3, ft8
                  fdiv.s       ft3, ft10, fa0, rne
                  sll          a2, t1, s1
                  addi         s1, s3, 1501
                  feq.s        t4, fs2, fa5
                  fsgnjx.s     ft1, ft8, fs10
                  or           a0, a3, a6
                  sltu         a6, s6, s1
                  add          s0, s0, t0
                  sra          t3, t3, sp
                  addi         s10, t6, 799
                  fcvt.s.wu    ft2, s10, rne
                  fmul.s       fa4, fs6, fs0
                  fmin.s       fa3, fs2, fa5
                  mulhsu       a4, zero, gp
                  add          a2, s0, a2
                  remu         s1, s4, a6
                  fcvt.w.s     a3, ft4, rne
                  fcvt.wu.s    s5, fs0
                  auipc        t3, 253539
                  fadd.s       fs9, fs10, ft4
                  srli         zero, s1, 4
                  add          s4, a3, a4
                  mulhsu       s8, s11, s4
                  fclass.s     s6, ft8
                  xori         t3, s9, -710
                  fcvt.s.w     fs1, s10
                  rem          s5, s5, s2
                  feq.s        t3, fa2, fs9
                  div          a0, a1, s8
                  div          ra, s5, a7
                  fmul.s       ft6, ft7, fa2, rdn
                  mulh         gp, s5, a6
                  fcvt.wu.s    gp, fs11
                  mulh         tp, gp, a3
                  sra          tp, s1, t0
                  remu         ra, a5, s5
                  nop
                  fcvt.wu.s    zero, fs8, rtz
                  srli         t6, s8, 18
                  and          s5, a6, s9
                  xor          s8, s6, a3
                  xori         t3, t0, 319
                  addi         sp, a2, 1606
                  fmax.s       ft6, fs1, fa2
                  slli         t6, s1, 15
                  sra          a0, t2, t0
                  fmax.s       ft5, fs9, ft5
                  sltu         t0, s0, zero
                  srli         a6, s11, 13
                  sltu         s8, a0, a0
                  sltu         a2, s8, a6
                  ori          a3, t1, 1128
                  fmin.s       fs0, fa7, fs2
                  flt.s        s5, fs4, fa0
                  srli         t4, s2, 28
                  andi         t0, s10, -1685
                  mulhu        t5, s6, a1
                  xor          s1, s2, zero
                  fmv.w.x      ft9, s0
                  addi         zero, s5, -70
                  mulh         s1, a6, a1
                  or           s0, s11, a7
                  and          s0, sp, tp
                  sll          a4, s0, t1
                  and          t5, s5, t0
                  mulhu        a2, s1, s2
                  fdiv.s       fs5, fs2, ft11
                  feq.s        s7, fa6, fa0
                  mulhu        s2, a4, s5
                  or           t1, s1, t4
                  fsgnjx.s     fs6, ft0, ft8
                  fcvt.s.wu    fs5, a5, rtz
                  sltu         s6, zero, s10
                  flt.s        s8, fs5, fa3
                  fsgnj.s      fs3, ft4, fa4
                  fcvt.s.wu    ft0, s8, rmm
                  slli         s6, s10, 0
                  fsqrt.s      fs9, ft5
                  fcvt.wu.s    s1, fa0
                  xori         a3, s3, 1018
                  srai         s2, t6, 31
                  fcvt.w.s     s2, fs8
                  fsqrt.s      fa1, ft4, rne
                  fsqrt.s      fs3, fs6
                  andi         s6, a7, -1523
                  div          s4, a4, a2
                  div          tp, zero, s1
                  fsub.s       ft4, fs8, fs0, rdn
                  xor          zero, t0, s1
                  fcvt.w.s     s5, fs7, rmm
                  sll          s1, a6, a3
                  mulhsu       s4, gp, s5
                  lui          s0, 909913
                  sub          t1, t1, t5
                  sra          s5, s5, tp
                  or           s6, a5, s9
                  fsqrt.s      ft3, fs2, rtz
                  fcvt.wu.s    s7, ft2
                  div          a2, s8, s5
                  fmul.s       ft9, ft11, fs10
                  fcvt.s.wu    fs5, t4, rdn
                  slti         s1, t1, -64
                  auipc        t1, 804315
                  add          a3, a2, t4
                  slti         ra, s3, 1022
                  fadd.s       ft2, ft4, fa2, rne
                  mulhu        t0, t0, s0
                  fle.s        s6, fa3, ft5
                  lui          a3, 860594
                  div          t5, a5, zero
                  fmin.s       ft2, fs3, ft7
                  or           t1, a3, tp
                  fdiv.s       fs6, ft5, fa5, rne
                  and          s9, s4, s0
                  fsqrt.s      fa3, ft4
                  slti         zero, a3, -794
                  xori         s9, s11, 1081
                  fcvt.s.wu    fs10, s9
                  mulhsu       s2, t4, zero
                  fdiv.s       fs1, ft9, ft7
                  fcvt.w.s     zero, fs5
                  ori          tp, a0, -725
                  sltiu        a2, zero, -1280
                  div          t2, t2, a6
                  andi         tp, s4, 1642
                  rem          s0, s10, s1
                  lui          a0, 200294
                  fmv.x.w      zero, fs9
                  fsgnj.s      fs7, fa7, fa0
                  add          s7, t5, a6
                  fcvt.s.w     fs0, a0, rtz
                  fcvt.wu.s    tp, fs5, rne
                  fdiv.s       fs4, fs6, ft5, rne
                  slt          s5, s5, t5
                  auipc        s2, 190864
                  xori         s1, t4, -717
                  mulhsu       s1, sp, s7
                  mul          a3, t3, t0
                  fcvt.s.w     fa7, s5, rne
                  fsgnj.s      fs8, fs2, fs10
                  rem          a3, sp, a5
                  fsgnjn.s     fs3, ft6, ft10
                  fsqrt.s      ft1, ft1
                  auipc        s4, 469531
                  ori          a0, s5, -199
                  mul          sp, t4, a5
                  slt          s11, a1, a5
                  flt.s        tp, fa7, fa3
                  nop
                  fmax.s       fs6, fs2, fs1
                  nop
                  slli         t6, a5, 18
                  rem          a3, s0, s4
                  fsqrt.s      fs10, fa7, rmm
                  fle.s        t4, ft2, fa6
                  fsub.s       fs9, ft8, ft4
                  fmax.s       ft1, ft0, ft10
                  div          gp, a1, s10
                  mulh         a4, tp, s2
                  fle.s        a5, fa0, ft11
                  fmv.x.w      t1, ft6
                  fdiv.s       fs3, fs2, ft4
                  srl          s1, s0, s4
                  fclass.s     s7, ft9
                  fdiv.s       ft2, ft6, ft1
                  srli         s1, a7, 0
                  srli         s10, s0, 10
                  sll          tp, s8, s11
                  mulhsu       a3, t1, gp
                  sra          s10, s8, s8
                  fle.s        t2, ft11, ft3
                  fmv.x.w      ra, fa4
                  fcvt.w.s     ra, fa6, rup
                  mulhu        t3, s0, sp
                  fmin.s       fs7, ft4, ft1
                  fcvt.s.wu    fa3, s6, rmm
                  sll          a0, s3, s5
                  fmv.w.x      ft7, gp
                  fcvt.wu.s    s5, fa1
                  feq.s        s7, fs10, ft8
                  fadd.s       fs7, fa7, ft9
                  fadd.s       fs2, ft7, ft5
                  sltiu        s4, s8, -443
                  addi         ra, s3, -905
                  fmax.s       ft4, fa4, ft6
                  addi         a4, s6, 1339
                  fmv.w.x      ft10, s0
                  fmin.s       fa5, ft7, fs11
                  srli         a0, t6, 7
                  slti         t2, t1, 705
                  feq.s        tp, fs11, ft5
                  mulhu        sp, gp, s5
                  fdiv.s       fs5, ft9, fa0, rmm
                  fsgnj.s      fs1, fs6, ft7
                  or           s1, tp, a7
                  fmv.x.w      s6, ft6
                  sll          s11, s8, s9
                  slt          s9, s11, a3
                  fsgnj.s      fa3, fs6, ft3
                  fsgnj.s      fs3, fs5, fs2
                  xori         t3, s7, -1793
                  xori         sp, zero, -102
                  sra          a6, s8, s1
                  fmv.x.w      t2, fa6
                  srai         s0, s8, 2
                  div          a2, zero, a7
                  fsqrt.s      fa2, ft7
                  slt          s9, tp, a7
                  fsgnjx.s     fa3, fa1, fs10
                  flt.s        s9, fs0, fa3
                  fdiv.s       fs1, ft4, ft2, rup
                  fcvt.s.wu    fa2, ra, rmm
                  fmax.s       fa2, ft1, ft0
                  fcvt.s.wu    ft4, a4
                  sltiu        s10, s6, 981
                  fsqrt.s      fa0, fs9, rup
                  fsub.s       fs0, fa2, fa0, rtz
                  rem          t3, sp, a6
                  srli         s6, gp, 23
                  addi         s6, sp, 1423
                  or           ra, s10, t1
                  flt.s        a0, fs7, ft10
                  xori         zero, a1, 1332
                  srl          s7, s5, a1
                  flt.s        s8, ft10, ft3
                  mulhsu       ra, s3, s8
                  rem          tp, s10, a1
                  mulhu        s8, ra, s4
                  sltu         s2, s11, gp
                  divu         t4, t0, t1
                  remu         s7, a1, a2
                  fmul.s       ft8, fa6, ft10, rne
                  feq.s        a3, fs2, ft8
                  fmin.s       ft6, fs1, ft3
                  slt          a5, s1, t4
                  fle.s        t1, fs7, ft11
                  nop
                  fcvt.w.s     a0, fa0
                  mulh         sp, s2, s11
                  auipc        s8, 8372
                  mulh         tp, a0, s9
                  fmul.s       ft10, fs3, ft0, rne
                  fadd.s       ft2, fs0, ft10
                  fclass.s     zero, ft4
                  nop
                  fmv.w.x      fs6, s2
                  slt          t0, t3, a1
                  lui          s5, 1346
                  flt.s        s10, fs0, fa1
                  fmul.s       fs1, fs11, fa2, rne
                  slt          s0, s7, s0
                  rem          t2, ra, sp
                  auipc        gp, 778016
                  and          sp, s9, ra
                  sltu         a3, t2, sp
                  fcvt.w.s     t4, fa2
                  fsqrt.s      ft4, ft4
                  fadd.s       fa1, fs0, fs10, rmm
                  xori         t6, s5, 1004
                  rem          s0, t4, t0
                  sltiu        t0, s3, 578
                  sltiu        s1, t6, 91
                  fmv.w.x      fa4, a0
                  slli         t0, a7, 21
                  fsgnj.s      ft5, ft9, ft5
                  srl          t3, s5, s2
                  srai         sp, s11, 24
                  auipc        s5, 45910
                  slti         t3, a7, 163
                  fmul.s       ft7, fs1, ft5
                  fdiv.s       fa2, fa0, ft11
                  andi         s5, a0, 859
                  fcvt.s.w     fa1, a5, rtz
                  fcvt.s.w     fs9, a3, rtz
                  divu         a4, s0, s9
                  nop
                  fcvt.s.wu    fs7, ra
                  sub          a5, t2, s4
                  fcvt.w.s     s7, ft2, rtz
                  mulhsu       tp, s6, s8
                  mulh         ra, s3, t0
                  srli         a6, s6, 21
                  srl          s8, a6, tp
                  fsgnjn.s     fa7, fa7, ft2
                  sll          a2, t0, ra
                  fcvt.s.wu    fa2, zero, rne
                  sltiu        a2, s1, 1846
                  andi         a4, a3, 2038
                  div          tp, s6, t3
                  ori          a2, tp, -1510
                  fsgnj.s      fa0, fa1, fs4
                  fcvt.w.s     a2, ft7, rup
                  flt.s        t3, fs0, ft8
                  divu         s5, s4, ra
                  sub          sp, s8, a0
                  add          a2, s7, s1
                  sll          a5, t4, s8
                  auipc        a0, 534559
                  fclass.s     s6, ft9
                  xori         t3, t4, -789
                  slti         t4, s5, 114
                  slt          t1, s3, s7
                  sra          t0, s4, a7
                  fcvt.s.wu    fa6, s11
                  srl          s1, s0, t2
                  or           gp, s6, a1
                  rem          a3, a4, t4
                  fmul.s       ft8, fa4, ft5, rup
                  feq.s        t2, fa4, ft10
                  or           s4, a0, a2
                  fadd.s       ft0, fa1, ft4
                  fmv.x.w      t0, fa6
                  divu         t4, tp, t4
                  fadd.s       ft4, ft1, ft1, rdn
                  fcvt.w.s     a4, fa5, rne
                  fcvt.w.s     s11, fs4
                  fcvt.w.s     t0, ft1
                  add          s9, s10, a7
                  slli         t6, s2, 3
                  fcvt.wu.s    t1, ft11, rup
                  fsgnj.s      ft1, ft4, ft11
                  fsgnjx.s     fs5, ft6, ft10
                  fsgnj.s      fs3, fs2, ft7
                  addi         t4, t2, 734
                  flt.s        s9, ft6, fs8
                  mulhsu       t4, zero, s1
                  add          t2, sp, t2
                  lui          s2, 691744
                  sra          s0, s1, s6
                  sltiu        t5, a4, -1126
                  remu         s7, a4, tp
                  and          s9, a7, t1
                  xor          s0, tp, zero
                  lui          a6, 706879
                  add          t2, a0, s7
                  auipc        t6, 447472
                  slli         s6, a4, 13
                  auipc        s8, 378613
                  auipc        t0, 876814
                  fle.s        gp, ft9, fa4
                  fmv.w.x      ft10, s9
                  sub          s11, t2, a5
                  and          s9, zero, a2
                  andi         s9, s10, 775
                  fclass.s     zero, fa3
                  slti         a2, s4, 1152
                  divu         a2, s3, a0
                  fsgnjn.s     ft10, ft2, fs9
                  add          a6, s1, s1
                  ori          a3, a6, 1007
                  fcvt.s.w     fs0, s5, rne
                  sub          s10, tp, s9
                  fsgnjx.s     fs3, fa4, ft3
                  sltu         s0, s1, s1
                  srai         t0, s5, 31
                  fmin.s       fs9, fa0, fa3
                  nop
                  fmin.s       ft10, fs3, ft7
                  slt          s1, s1, a5
                  fsqrt.s      fs0, fs3
                  div          t6, t1, s11
                  fcvt.s.w     fs0, a2
                  add          t2, a7, tp
                  slti         s10, s5, -1133
                  lui          t4, 121995
                  fclass.s     a6, fa0
                  fsgnjx.s     fa0, fs9, fs8
                  feq.s        s8, fa3, fa7
                  sltu         s7, gp, s6
                  auipc        s11, 150221
                  slli         t6, a0, 31
                  slti         s10, a5, 1386
                  fmax.s       fs8, fs1, fs2
                  and          tp, s4, t5
                  sub          a6, tp, s7
                  fcvt.s.w     ft6, t0, rne
                  fcvt.w.s     zero, ft11
                  srai         s6, a2, 24
                  fsgnjx.s     fs11, fs9, fs4
                  fmin.s       ft10, ft1, ft7
                  xori         a5, s3, -644
                  sltiu        t0, s1, -573
                  slti         t4, a0, 1582
                  and          t3, a3, s9
                  or           s8, s7, a2
                  xor          s9, s11, s6
                  sra          s9, a2, s3
                  auipc        s9, 709628
                  and          t5, t1, ra
                  fmin.s       fs2, fs1, fs0
                  fclass.s     s5, ft5
                  and          a3, t0, a0
                  nop
                  fcvt.s.w     ft5, s2, rup
                  sll          zero, t3, t5
                  fclass.s     a4, fa4
                  or           s4, a7, s1
                  andi         sp, t3, 1095
                  fmv.w.x      fs1, s9
                  sll          s4, s2, t2
                  sltu         tp, s7, t6
                  lui          s7, 147387
                  rem          a4, t4, s8
                  sltu         s0, s7, a3
                  mul          s5, a2, s4
                  mul          t1, zero, zero
                  mulhsu       t5, sp, s3
                  srl          t5, a0, a2
                  fle.s        a3, fa1, fs4
                  nop
                  fdiv.s       fs11, ft0, fs0, rtz
                  fmv.w.x      fa4, s3
                  fdiv.s       fs1, ft7, ft7
                  andi         t1, s10, 1836
                  fsgnjn.s     fa4, fs4, ft8
                  fle.s        s11, fa3, fs5
                  slti         s7, a3, 966
                  xori         s11, t6, 1141
                  sll          s5, t3, a4
                  fmv.w.x      ft10, t3
                  nop
                  slt          s0, s8, gp
                  srai         t2, s3, 31
                  fsqrt.s      fs4, fs5, rmm
                  auipc        s9, 854510
                  div          t6, a2, t2
                  fcvt.s.wu    ft9, s9, rdn
                  or           ra, s8, tp
                  fle.s        a5, fs1, ft1
                  flt.s        ra, ft8, fa4
                  auipc        t5, 434670
                  fsgnjn.s     ft4, fa3, fs8
                  fclass.s     s9, ft5
                  sll          t4, t1, a6
                  mulhsu       a3, s8, s11
                  lui          s5, 645620
                  fmv.x.w      s4, ft7
                  rem          gp, s10, s8
                  slli         gp, t2, 6
                  fmax.s       fa2, ft2, ft5
                  feq.s        tp, fs7, ft8
                  sltu         t3, s2, t5
                  fcvt.s.w     fa0, t0
                  ori          s10, t4, 1917
                  addi         gp, s4, 927
                  mulh         t4, a2, t2
                  and          t5, a7, s6
                  mulhsu       tp, s11, s9
                  auipc        s8, 723302
                  fclass.s     s6, ft11
                  sub          s9, s5, s3
                  fcvt.s.w     ft10, t5, rtz
                  xor          s4, t1, s2
                  sub          tp, a2, t5
                  sub          s1, ra, a2
                  fmv.x.w      s0, fs2
                  fcvt.s.wu    ft2, s8, rne
                  remu         t5, a3, s1
                  slli         gp, tp, 5
                  fmv.x.w      a5, ft3
                  fsgnj.s      fs8, ft1, fs11
                  fsub.s       fs11, fs6, fs6, rtz
                  mulhu        s11, s2, a3
                  fsgnj.s      fa7, fs1, fs4
                  fmv.w.x      fs0, s4
                  mulhsu       s7, s1, s6
                  fsqrt.s      ft2, fs2, rmm
                  fcvt.s.wu    ft6, s9, rmm
                  fcvt.s.w     fs7, ra, rmm
                  sub          t2, gp, a3
                  auipc        t3, 452070
                  fcvt.w.s     a5, fs1
                  xor          s7, a1, s1
                  addi         s11, tp, 1772
                  lui          s6, 533805
                  auipc        s11, 524666
                  mulhu        s2, sp, s9
                  fclass.s     ra, fs4
                  divu         s8, ra, s3
                  rem          t0, t1, a2
                  srli         tp, s7, 16
                  fcvt.s.wu    ft0, zero, rup
                  fmv.x.w      t4, fs4
                  fdiv.s       fs1, fs10, ft0
                  div          s7, s4, zero
                  mul          a6, a1, t2
                  feq.s        s2, fs6, ft11
                  divu         s1, a6, s6
                  srli         sp, t0, 20
                  sra          gp, t1, s7
                  div          s0, gp, s3
                  fmin.s       ft1, ft9, ft1
                  fmin.s       fs11, fs6, ft10
                  or           a0, s4, tp
                  fsgnjn.s     ft3, ft9, ft9
                  div          t4, a7, s5
                  fdiv.s       ft10, ft3, fa1
                  flt.s        t0, fa5, ft0
                  fcvt.s.w     fs7, t5
                  srli         s7, s2, 23
                  fsgnj.s      fa5, fs6, fs8
                  addi         s10, s0, 1648
                  fmax.s       ft4, ft7, fs3
                  fsgnjn.s     fa2, fs1, fs2
                  or           a5, t4, s2
                  flt.s        s7, fs10, fs9
                  srai         ra, a3, 19
                  auipc        ra, 121497
                  nop
                  add          gp, s6, t5
                  slti         s0, t3, 1514
                  fcvt.w.s     a0, ft5
                  fclass.s     a3, ft7
                  fsub.s       fa7, ft11, fs3, rne
                  fmul.s       ft2, ft0, fa2, rtz
                  div          s2, s0, s1
                  srai         s10, a7, 4
                  fcvt.w.s     a5, fa3
                  fsub.s       ft0, fs9, ft6
                  add          ra, t2, s0
                  sll          t6, s5, s7
                  fmv.x.w      t1, fa6
                  flt.s        s6, fa3, fs10
                  lui          s4, 445095
                  xor          sp, a5, a7
                  fsub.s       ft8, ft9, ft4
                  ori          s9, s0, -1773
                  srai         ra, a0, 26
                  srli         a3, s0, 10
                  fsqrt.s      fa4, fs8, rmm
                  fsub.s       ft10, fs4, fs3, rup
                  fcvt.s.w     fs9, a5
                  fdiv.s       fs4, ft2, fs8
                  xori         t2, t2, 1038
                  slti         a3, t0, 748
                  xor          s6, tp, a5
                  fsgnjn.s     fs0, fs3, fs0
                  fsgnjx.s     ft5, fs11, fa6
                  divu         a0, s9, t3
                  sll          s4, s8, t0
                  fcvt.s.wu    ft11, ra
                  feq.s        s4, ft1, ft9
                  fmv.x.w      t6, fs1
                  mulh         t3, s2, a1
                  slli         sp, a0, 26
                  or           ra, t0, s0
                  or           s9, a0, s2
                  divu         t4, t5, t4
                  mulhu        s9, s6, sp
                  fsgnjx.s     fa6, fa7, ft11
                  or           s1, t4, t2
                  mulhsu       t1, t1, ra
                  mul          t3, s10, s10
                  slt          a5, t3, a3
                  sltu         s2, t5, s3
                  fcvt.s.wu    ft8, a7, rtz
                  fmax.s       fs2, fs6, fa5
                  fadd.s       fa4, fa2, fa4, rup
                  fsqrt.s      ft3, ft3
                  xori         a6, s6, -2000
                  xor          a2, a3, t1
                  fcvt.s.wu    fs1, s3, rdn
                  fcvt.wu.s    t0, fa7
                  fsgnjx.s     fs7, fa7, ft11
                  sll          a2, s4, t4
                  flt.s        tp, fs3, ft4
                  fsub.s       fs3, fs0, fs3
                  addi         s9, a1, -1812
                  fsgnjn.s     fa5, ft7, fs5
                  fmv.x.w      a3, fs5
                  fle.s        t6, fa2, fa6
                  fcvt.wu.s    s5, fs7
                  sltiu        s10, s3, 1569
                  sltiu        a6, zero, 1133
                  fmin.s       fs5, fs11, fa3
                  or           a0, a1, a3
                  xori         t4, s3, 853
                  mulhsu       s6, s1, s3
                  fle.s        s2, fs5, fa7
                  fcvt.w.s     s4, ft11
                  slt          ra, a4, t1
                  fmv.x.w      gp, fs3
                  mulhu        s4, s3, s7
                  nop
                  sra          t4, a3, a6
                  mulh         t4, t5, t2
                  or           s6, gp, s9
                  add          a4, ra, s5
                  sltu         t6, a6, t2
                  mulh         s4, t5, s5
                  feq.s        s0, fs10, fs1
                  fmv.x.w      s9, fs9
                  flt.s        s2, fs4, fa2
                  fmax.s       fa3, fa5, fa7
                  addi         s0, ra, -1751
                  fmax.s       fs0, ft11, fa6
                  fsgnj.s      fa5, ft5, fs5
                  feq.s        gp, fs0, ft11
                  auipc        t2, 31606
                  mulh         t4, a5, a3
                  div          ra, t4, t0
                  fcvt.wu.s    s2, fa7, rup
                  fcvt.w.s     t2, fs7
                  remu         t5, t1, s6
                  lui          s6, 520494
                  xor          a6, s9, a1
                  lui          a3, 944246
                  mulhu        s7, s1, a1
                  fle.s        t6, ft9, ft0
                  fmv.x.w      t6, fs7
                  remu         a4, tp, zero
                  mulh         s2, a6, t0
                  fsgnjx.s     fs5, ft2, ft3
                  mulhsu       t0, a2, tp
                  srai         t6, s10, 17
                  fadd.s       fa2, fa2, fs4, rne
                  fcvt.wu.s    a0, fa0, rmm
                  fcvt.s.wu    ft10, a3, rne
                  addi         s2, s11, 925
                  fcvt.s.w     fs2, t0
                  divu         s7, s2, s5
                  fdiv.s       fs4, fa1, fa1, rtz
                  xor          t4, sp, a2
                  lui          s8, 698038
                  fsgnjx.s     ft4, fa5, fs8
                  fsub.s       fa3, fs10, fa1, rmm
                  sll          a0, t2, t3
                  andi         s4, t3, 1528
                  fmin.s       ft1, fa0, ft9
                  fmv.x.w      t3, fs0
                  add          a2, ra, gp
                  slli         sp, a4, 11
                  rem          a5, a0, s3
                  srli         t1, ra, 26
                  fcvt.wu.s    s9, fa0, rup
                  add          t0, t1, s0
                  srli         s9, a6, 12
                  fsub.s       ft5, fa5, fa6, rmm
                  srl          a5, t2, a7
                  rem          tp, a5, t0
                  nop
                  srl          t4, t1, s2
                  fmin.s       fa7, fa4, fs9
                  rem          s1, s7, a4
                  fcvt.w.s     s4, fs10
                  fcvt.wu.s    a5, fa6
                  mulhu        tp, s3, a4
                  and          s6, t5, a3
                  mulhu        s7, s11, a7
                  feq.s        s1, fs5, fa6
                  fmin.s       fa1, ft10, ft8
                  xori         s1, t0, -1735
                  fcvt.wu.s    s11, fs4
                  fmax.s       fa0, fa7, fs9
                  fsub.s       fa6, fs8, fa2
                  sltiu        ra, zero, -1959
                  mul          s5, s0, t0
                  srli         sp, tp, 15
                  nop
                  div          s0, t2, s6
                  rem          t3, a5, s8
                  fle.s        s0, fa3, fs2
                  sra          s5, t5, a7
                  fcvt.s.wu    fs3, s3
                  slli         t5, sp, 18
                  nop
                  addi         s5, a0, 1927
                  fmul.s       fs0, fs2, ft5, rmm
                  fmv.w.x      ft3, t4
                  or           ra, zero, s0
                  add          sp, zero, s11
                  mulh         a0, s8, s11
                  mulhu        zero, t3, a1
                  fsub.s       fs7, fs10, fa1, rdn
                  srli         t2, s8, 16
                  xor          t1, s11, a0
                  fadd.s       ft11, fa4, fs9
                  mulhu        s7, sp, t5
                  fcvt.w.s     ra, fa2, rup
                  remu         a5, a2, s7
                  fmv.w.x      fa7, s5
                  fsgnjn.s     fs10, fs6, fs1
                  and          a4, s2, t6
                  fdiv.s       fa5, fs7, fs6, rmm
                  or           s5, s8, a0
                  sub          s2, s6, s2
                  fcvt.w.s     s5, fa7, rup
                  nop
                  mul          a5, a6, zero
                  sub          s9, a5, a0
                  mulhu        tp, a0, t2
                  fcvt.s.w     ft8, s3, rdn
                  fsgnjx.s     fs2, ft8, fa0
                  srli         s6, a6, 5
                  slti         s1, sp, -1692
                  sltu         zero, t0, a4
                  fcvt.s.w     fa0, ra, rdn
                  mul          s11, t0, zero
                  slli         s11, ra, 21
                  slti         tp, s8, -817
                  srl          t6, a2, s1
                  fclass.s     s8, ft6
                  or           s8, s5, s9
                  fcvt.s.w     fa0, s1, rtz
                  remu         t5, t2, a5
                  div          a6, s5, t5
                  xor          s8, a3, tp
                  addi         a4, tp, -844
                  fclass.s     ra, fa0
                  fmax.s       fs5, fa5, fa7
                  andi         a3, t5, 437
                  fsqrt.s      ft6, fa5
                  or           a3, s8, s1
                  fadd.s       ft9, fs11, fa0
                  fsqrt.s      fs9, ft10, rup
                  andi         s5, t5, -327
                  mulhu        a3, t3, s11
                  xor          s6, t2, s0
                  fcvt.s.wu    fa4, ra
                  mulhu        s11, t6, t3
                  rem          a5, ra, s1
                  addi         s1, s2, -2039
                  xor          a0, a2, s8
                  fmv.w.x      fs0, s3
                  feq.s        s9, fa5, ft2
                  ori          tp, sp, -207
                  fsgnjn.s     fa3, fs10, fa6
                  fcvt.s.wu    fa7, s10, rdn
                  slt          t0, s8, t5
                  fadd.s       fa7, ft1, fa1, rne
                  feq.s        a5, ft8, fa7
                  mulhsu       t5, t3, s4
                  mulhu        zero, t2, a3
                  fcvt.s.wu    ft7, s3
                  mulhu        s1, t0, gp
                  auipc        s9, 18650
                  fcvt.w.s     s0, ft2, rdn
                  fcvt.s.wu    fs3, s10
                  lui          s8, 949498
                  lui          a0, 478284
                  fmax.s       fs0, fs10, fs0
                  srl          s6, t6, a4
                  add          t4, s6, s4
                  fclass.s     s10, fa5
                  auipc        t6, 313550
                  auipc        tp, 520344
                  slli         s5, a2, 11
                  fmin.s       fs10, ft0, fs5
                  mulhsu       s5, t6, s10
                  remu         t4, ra, a4
                  div          a5, a7, s1
                  mul          a4, zero, s8
                  nop
                  slli         s4, s11, 6
                  slti         s9, a3, -2009
                  fmax.s       ft3, ft4, ft2
                  or           a5, a7, s2
                  srai         ra, a7, 6
                  auipc        a4, 154268
                  fadd.s       fs9, fs4, fa0
                  nop
                  slti         s7, s1, 1485
                  mul          s10, s11, s5
                  fmax.s       ft2, ft2, ft8
                  fclass.s     a2, ft3
                  feq.s        s5, fs11, fs9
                  xori         a2, t3, 954
                  slli         s9, a4, 22
                  fcvt.s.w     fa7, a7
                  srl          t4, s0, ra
                  xor          a6, t4, s0
                  fmin.s       fs8, fa6, ft2
                  sltu         s6, s5, a7
                  and          s9, s7, zero
                  fsqrt.s      fs1, ft0
                  auipc        s11, 381455
                  or           gp, sp, a3
                  fsgnjx.s     fs4, fa6, fa2
                  xor          sp, t4, t5
                  sub          t2, t2, a7
                  srl          s7, t3, sp
                  sub          s5, s5, a4
                  add          s6, s11, s7
                  fmv.x.w      s4, fs1
                  fle.s        s7, fs7, fa0
                  fsgnj.s      ft10, ft3, ft0
                  rem          s11, s8, gp
                  fadd.s       fs3, fa6, fa2
                  fcvt.s.wu    fa1, a2, rmm
                  slti         s1, t5, -1692
                  addi         s9, ra, -351
                  addi         tp, a7, -511
                  or           s4, s11, s8
                  xori         a4, s3, 912
                  fcvt.w.s     a4, ft8, rmm
                  fcvt.s.wu    ft6, s2, rup
                  fcvt.s.wu    fa2, a7
                  divu         gp, t4, sp
                  sll          a2, sp, a4
                  fsgnjx.s     ft0, fs10, ft1
                  sub          a0, gp, s5
                  flt.s        s8, ft3, fs11
                  fcvt.s.w     fa1, s0
                  slli         t3, t5, 19
                  and          s6, s2, zero
                  fsub.s       fa4, fa3, ft4
                  srli         s6, a1, 2
                  addi         t0, a2, 2004
                  sll          t5, s6, t2
                  sll          s0, s0, s0
                  fdiv.s       fa6, ft5, fs8, rdn
                  srl          a3, t3, t0
                  fsgnjx.s     ft8, fa1, ft3
                  fle.s        s2, fs10, fa2
                  fsgnjn.s     fs4, fa7, fs11
                  fmin.s       fs1, ft3, ft5
                  fcvt.wu.s    t0, ft2, rtz
                  ori          s9, a6, 606
                  srl          a3, s8, tp
                  fsgnj.s      fa2, fs4, fa3
                  xori         t6, sp, -1442
                  mulh         s2, tp, sp
                  fsgnjn.s     ft4, ft0, ft1
                  fdiv.s       ft0, ft3, fs2
                  feq.s        t2, ft3, ft6
                  fcvt.w.s     s7, fa7
                  slti         gp, s3, -1515
                  slti         gp, sp, 530
                  fcvt.s.wu    fs10, s2, rtz
                  xori         a5, t1, 1393
                  addi         t0, t4, -1944
                  sra          gp, t1, gp
                  srl          zero, s5, t4
                  fsgnjx.s     fa4, fs0, fs7
                  andi         t3, s7, 941
                  sub          t1, t5, s0
                  xori         s6, s4, 880
                  slti         a6, s11, 1105
                  div          a0, s1, tp
                  fmax.s       fs3, fs2, ft0
                  fadd.s       fa6, fa1, fs3
                  sra          a2, t1, t0
                  sra          t4, s4, s10
                  srli         t1, a5, 2
                  xori         s8, s2, 811
                  sltiu        tp, t4, 1453
                  div          zero, t3, t4
                  fmul.s       ft3, ft7, fs8
                  div          s2, s3, a7
                  sub          s4, a3, a0
                  srl          s2, a5, a6
                  or           t0, t0, s4
                  xori         t6, s6, -578
                  fsub.s       fs7, ft3, fs7, rup
                  fsgnj.s      ft6, fs0, fa6
                  xori         a0, gp, 1759
                  fsub.s       ft7, fs4, ft3
                  add          a0, a5, a0
                  and          t2, s3, gp
                  fsgnjx.s     fs5, fs4, fa2
                  fle.s        a3, fs6, ft2
                  fsub.s       fa1, fa2, fa7
                  fcvt.w.s     t0, ft11, rne
                  fsub.s       fa2, fs4, fa2
                  xori         a4, a0, -462
                  fcvt.w.s     a4, ft5, rup
                  fdiv.s       ft1, fa4, fa3
                  add          s5, a6, s3
                  mulh         t4, a0, t6
                  srl          s10, t1, a3
                  fsgnjn.s     fa0, ft8, fa0
                  sub          a6, a5, s2
                  srli         s4, tp, 1
                  fmin.s       fs2, fs9, fs3
                  fdiv.s       fa5, fs6, fs3
                  addi         a2, s8, -1996
                  xori         s5, a0, -914
                  remu         s7, ra, s6
                  sltu         t1, t0, t0
                  fle.s        t4, ft6, ft2
                  srl          t3, a2, a3
                  srl          s1, a3, s5
                  addi         t2, s7, -1124
                  ori          t3, s2, 172
                  andi         t4, s0, -1158
                  slti         s5, s9, 1609
                  fcvt.s.w     fs5, s10
                  fcvt.wu.s    a3, fa0, rmm
                  slli         a6, s2, 27
                  xori         tp, s6, -415
                  srai         ra, a1, 6
                  fcvt.wu.s    s6, fs10
                  fsgnj.s      fa0, fa1, fs0
                  srl          s10, a2, s9
                  rem          tp, gp, a1
                  mulh         t1, s3, a3
                  mulh         ra, sp, s9
                  sltiu        s8, s1, 171
                  xor          s7, s3, a3
                  sltu         a6, s10, zero
                  mulh         t1, a5, s11
                  fadd.s       fs1, ft4, ft8, rdn
                  add          t3, s5, zero
                  sra          s0, t6, a3
                  fclass.s     s0, ft0
                  addi         t1, t6, -1002
                  sltu         t2, gp, tp
                  sra          a5, s5, a2
                  flt.s        s11, fa3, ft8
                  fsqrt.s      fs9, fs9, rmm
                  fadd.s       ft0, fs5, fa0, rne
                  sltu         ra, gp, a3
                  or           t4, a6, t6
                  ori          a6, zero, 1222
                  fdiv.s       fa2, ft8, ft6, rmm
                  sll          s8, a1, t4
                  fcvt.w.s     s6, fa1, rtz
                  feq.s        s2, fa6, fs6
                  srli         s2, t6, 16
                  add          ra, t6, t0
                  fsqrt.s      ft7, fs4
                  fadd.s       fa6, fs8, fs11, rtz
                  fmv.w.x      ft7, s0
                  mul          s4, a5, s9
                  fmin.s       fs5, ft8, fa2
                  sll          t6, s6, s1
                  fadd.s       ft7, ft1, fs8
                  sra          t1, a1, s10
                  mulh         a4, s3, s11
                  fdiv.s       fs3, fa4, ft0
                  fadd.s       fa0, ft1, ft4, rne
                  addi         s6, a4, 557
                  fsub.s       fa7, fs8, fs1, rup
                  sra          zero, s9, s7
                  rem          zero, s4, s10
                  fmax.s       fs7, ft4, ft5
                  fclass.s     a4, ft10
                  divu         t2, s10, ra
                  srai         a0, a6, 8
                  sub          s4, s3, s1
                  auipc        s1, 933653
                  fdiv.s       fa5, ft9, fs0
                  la x19, test_done
                  jalr x0, x19, 0
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
                  addi x11, x11, -4
                  sw  x17, (x11)
                  add x17, x11, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x11, x17, zero
                  csrr x6, 0x300 # MSTATUS
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 31
                  bne x6, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x6, 0x341 # MEPC
                  csrr x6, 0x342 # MCAUSE
                  li x4, 0x3 # BREAKPOINT
                  beq x6, x4, ebreak_handler
                  li x4, 0x8 # ECALL_UMODE
                  beq x6, x4, ecall_handler
                  li x4, 0x9 # ECALL_SMODE
                  beq x6, x4, ecall_handler
                  li x4, 0xb # ECALL_MMODE
                  beq x6, x4, ecall_handler
                  li x4, 0x1
                  beq x6, x4, instr_fault_handler
                  li x4, 0x5
                  beq x6, x4, load_fault_handler
                  li x4, 0x7
                  beq x6, x4, store_fault_handler
                  li x4, 0xc
                  beq x6, x4, pt_fault_handler
                  li x4, 0xd
                  beq x6, x4, pt_fault_handler
                  li x4, 0xf
                  beq x6, x4, pt_fault_handler
                  li x4, 0x2 # ILLEGAL_INSTRUCTION
                  beq x6, x4, illegal_instr_handler
                  csrr x4, 0x343 # MTVAL
                  1: la x19, test_done
                  jalr x1, x19, 0

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
                  la x19, write_tohost
                  jalr x0, x19, 0

instr_fault_handler:
                  add x17, x11, zero
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 128
                  add x11, x17, zero
                  lw  x17, (x11)
                  addi x11, x11, 4
                  mret

load_fault_handler:
                  add x17, x11, zero
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 128
                  add x11, x17, zero
                  lw  x17, (x11)
                  addi x11, x11, 4
                  mret

store_fault_handler:
                  add x17, x11, zero
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 128
                  add x11, x17, zero
                  lw  x17, (x11)
                  addi x11, x11, 4
                  mret

ebreak_handler:   
                  csrr  x6, 0x341
                  addi  x6, x6, 4
                  csrw  0x341, x6
                  add x17, x11, zero
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 128
                  add x11, x17, zero
                  lw  x17, (x11)
                  addi x11, x11, 4
                  mret

illegal_instr_handler:
                  csrr  x6, 0x341
                  addi  x6, x6, 4
                  csrw  0x341, x6
                  add x17, x11, zero
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 128
                  add x11, x17, zero
                  lw  x17, (x11)
                  addi x11, x11, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x6, 0x300 # MSTATUS;
                  csrr  x6, 0x304 # MIE;
                  csrr  x6, 0x344 # MIP;
                  csrrc x6, 0x344, x6 # MIP;
                  add x17, x11, zero
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 128
                  add x11, x17, zero
                  lw  x17, (x11)
                  addi x11, x11, 4
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
