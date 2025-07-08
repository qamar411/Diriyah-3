.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x12, h0_start
jalr x0, x12, 0
h0_start:
                  li x17, 0x40001120
                  csrw 0x301, x17
kernel_sp:        
                  la x5, kernel_stack_end

trap_vec_init:    
                  la x17, mtvec_handler
                  ori x17, x17, 1
                  csrw 0x305, x17 # MTVEC

mepc_setup:       
                  la x17, init
                  csrw 0x341, x17

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x17, 0x3800
                  csrw 0x300, x17 # MSTATUS
                  li x17, 0x0
                  csrw 0x304, x17 # MIE
                  mret
init:             
                  li x17, 1327530378
                  fmv.w.x f0, x17
                  li x17, 2147483648
                  fmv.w.x f1, x17
                  li x17, 2139095039
                  fmv.w.x f2, x17
                  li x17, 4286578688
                  fmv.w.x f3, x17
                  li x17, 3290066026
                  fmv.w.x f4, x17
                  li x17, 2139095041
                  fmv.w.x f5, x17
                  li x17, 2001631718
                  fmv.w.x f6, x17
                  li x17, 2139095039
                  fmv.w.x f7, x17
                  li x17, 2143289344
                  fmv.w.x f8, x17
                  li x17, 2620755
                  fmv.w.x f9, x17
                  li x17, 4161761206
                  fmv.w.x f10, x17
                  li x17, 2139095040
                  fmv.w.x f11, x17
                  li x17, 2139095039
                  fmv.w.x f12, x17
                  li x17, 2147483648
                  fmv.w.x f13, x17
                  li x17, 4877510
                  fmv.w.x f14, x17
                  li x17, 2200793499
                  fmv.w.x f15, x17
                  li x17, 4286578688
                  fmv.w.x f16, x17
                  li x17, 2143289344
                  fmv.w.x f17, x17
                  li x17, 4286578687
                  fmv.w.x f18, x17
                  li x17, 4286578687
                  fmv.w.x f19, x17
                  li x17, 2139095039
                  fmv.w.x f20, x17
                  li x17, 1411439
                  fmv.w.x f21, x17
                  li x17, 2050410653
                  fmv.w.x f22, x17
                  li x17, 2147483648
                  fmv.w.x f23, x17
                  li x17, 2139095039
                  fmv.w.x f24, x17
                  li x17, 2147483648
                  fmv.w.x f25, x17
                  li x17, 4286578688
                  fmv.w.x f26, x17
                  li x17, 4286578687
                  fmv.w.x f27, x17
                  li x17, 3326117567
                  fmv.w.x f28, x17
                  li x17, 4286578688
                  fmv.w.x f29, x17
                  li x17, 2147483648
                  fmv.w.x f30, x17
                  li x17, 2139095039
                  fmv.w.x f31, x17
                  fsrmi 4
                  li x0, 0x80000000
                  li x1, 0xf
                  li x2, 0x80000000
                  li x3, 0x80000000
                  li x4, 0x5
                  li x6, 0x80000000
                  li x7, 0xf5886b58
                  li x8, 0xcacdeb0
                  li x9, 0xf3cd3d04
                  li x10, 0x0
                  li x11, 0xf1c3f7b0
                  li x12, 0x80000000
                  li x13, 0x80000000
                  li x14, 0x56aff0c6
                  li x15, 0x0
                  li x16, 0xc
                  li x17, 0x80000000
                  li x18, 0x80000000
                  li x19, 0x80000000
                  li x21, 0xf3d7679a
                  li x22, 0x1
                  li x23, 0x80000000
                  li x24, 0x80000000
                  li x25, 0xd
                  li x26, 0x80000000
                  li x27, 0xada2f121
                  li x28, 0x7c503112
                  li x29, 0xf30d0fce
                  li x30, 0xb
                  li x31, 0x9
                  la x20, user_stack_end
main:             slti         t5, t1, -1776
                  fsub.s       fs6, ft9, ft5, rtz
                  slti         s5, s11, 286
                  slli         a6, a6, 23
                  nop
                  flt.s        zero, ft4, fs0
                  fmv.w.x      fs3, a4
                  nop
                  fcvt.s.w     ft11, s8
                  div          t1, s7, s4
                  xori         t6, a1, 828
                  sltu         s5, t5, ra
                  ori          tp, s7, 1845
                  ori          a4, a7, 62
                  fmv.w.x      fa0, zero
                  remu         a7, a6, a3
                  fsgnj.s      fs6, fs2, ft3
                  sra          s9, s1, s11
                  fdiv.s       fa4, fs5, ft10, rup
                  auipc        tp, 1014178
                  fsub.s       ft2, fs6, fs7
                  nop
                  auipc        a1, 801085
                  slti         sp, a4, 23
                  add          s3, zero, s0
                  fsgnj.s      fs2, ft6, fa3
                  add          s0, a5, a1
                  fmul.s       ft5, fa7, fs7
                  nop
                  flt.s        gp, fs7, ft9
                  mulhsu       a3, t4, s0
                  lui          a1, 908407
                  remu         s1, s11, ra
                  fsgnjn.s     ft0, fs6, fs4
                  sra          s10, a6, s9
                  srli         s0, t6, 24
                  fmin.s       fa5, ft7, fa1
                  fmv.x.w      t1, ft1
                  remu         t6, s4, s9
                  fsgnj.s      ft6, fs11, fa6
                  mulh         a4, sp, a1
                  srai         t2, t4, 22
                  fcvt.s.wu    fs3, t1
                  fadd.s       ft8, ft3, fs1, rne
                  auipc        a1, 952068
                  fmax.s       fa7, ft0, ft5
                  slt          t2, s4, s6
                  fsgnjx.s     fa1, fa3, ft11
                  sltiu        s7, t5, 671
                  fclass.s     s11, fa6
                  sra          s1, s6, s6
                  fadd.s       fa4, fs10, fs7, rne
                  fmv.x.w      s8, ft3
                  fcvt.wu.s    tp, ft6
                  fmv.x.w      s9, fs3
                  sltiu        a3, t1, 1638
                  srli         ra, t6, 7
                  divu         ra, t6, s3
                  fle.s        a5, fs2, ft4
                  rem          a1, zero, sp
                  slt          ra, a2, a1
                  add          ra, sp, a2
                  slti         gp, s4, -1133
                  fdiv.s       fa1, ft7, fs9
                  mulhu        s7, a0, s7
                  slti         a4, s2, -1885
                  fsqrt.s      fa0, ft1, rdn
                  fsgnj.s      fs5, fs9, ft3
                  andi         a7, a1, 1188
                  fclass.s     s3, ft1
                  fmul.s       ft3, ft4, fa2
                  fcvt.s.w     fs3, s3
                  fle.s        a7, fs9, fs6
                  sub          a4, t1, s8
                  fcvt.wu.s    a7, ft6, rtz
                  fclass.s     s8, fs2
                  fsgnjx.s     fa3, ft10, ft1
                  sra          t3, a2, a1
                  fle.s        ra, fa3, ft6
                  feq.s        t6, fa6, fs9
                  fsgnjn.s     ft9, fa3, fs0
                  fsgnjn.s     ft3, fs11, fs3
                  mul          t1, t2, s9
                  fcvt.wu.s    a4, ft7
                  sll          a1, gp, t1
                  sll          ra, sp, sp
                  slt          a3, t6, s10
                  srai         t5, t2, 9
                  auipc        s8, 575776
                  sltu         s6, a4, a0
                  sub          a4, s1, a3
                  fsgnj.s      fs2, ft8, ft5
                  flt.s        a7, fs9, fs0
                  fcvt.wu.s    t2, ft9
                  mul          a6, a1, a3
                  and          s10, s8, a3
                  sltiu        s10, s8, 651
                  sub          s7, s6, t6
                  fle.s        zero, fs10, fs9
                  addi         s8, s2, -1539
                  nop
                  xor          a0, t6, tp
                  rem          a1, t6, t2
                  fle.s        gp, fs2, ft2
                  fmv.w.x      fs8, s0
                  xor          t4, a3, s3
                  sub          a0, s4, s4
                  or           t6, t6, ra
                  div          s0, a5, t5
                  add          a1, s8, s6
                  nop
                  fle.s        tp, fs7, fs7
                  mulhsu       tp, s3, ra
                  mulh         s3, t4, s2
                  srai         t3, a6, 12
                  mulhu        gp, s7, t4
                  fcvt.wu.s    a0, fa0
                  slli         gp, a2, 4
                  slt          a0, a0, t4
                  fcvt.s.w     ft9, s0, rdn
                  fmul.s       fs6, fs4, ft2, rup
                  fadd.s       fs6, ft8, fs8, rtz
                  feq.s        a1, fa1, ft4
                  fmax.s       fs9, fa4, fs0
                  ori          s5, s8, -1910
                  slli         s5, zero, 20
                  fmv.w.x      fs5, s8
                  remu         t4, s3, tp
                  fadd.s       ft3, ft9, fa1
                  and          a7, ra, gp
                  fadd.s       ft0, ft3, fa6, rup
                  auipc        zero, 369868
                  srai         t4, t5, 12
                  addi         sp, a2, -1085
                  fmin.s       ft1, fa7, fa2
                  fcvt.s.wu    fa3, s11, rmm
                  ori          sp, s11, 42
                  ori          gp, t4, -910
                  sltiu        t3, a0, 471
                  fdiv.s       ft6, fs8, ft3, rmm
                  sll          a7, gp, t0
                  fle.s        a5, fa6, fa0
                  remu         t4, t2, s0
                  feq.s        t2, ft5, ft5
                  or           ra, a5, a1
                  slti         gp, a1, 280
                  fsqrt.s      fa7, fa7
                  remu         a3, ra, zero
                  mulhsu       tp, a6, t0
                  sltiu        s7, a5, -1383
                  sra          gp, ra, s4
                  or           t4, s10, s0
                  or           s7, s4, s8
                  sltiu        t3, ra, 810
                  sltiu        a4, t2, -760
                  fmax.s       fs4, fa7, fs10
                  lui          ra, 510645
                  slli         s3, a1, 26
                  sltiu        a7, t2, -1352
                  fcvt.wu.s    sp, fa6, rne
                  slli         t2, t5, 18
                  fmv.w.x      fs2, a7
                  or           a1, a1, a3
                  andi         s1, gp, -798
                  fmax.s       ft7, ft1, fs7
                  fmv.x.w      a4, ft1
                  mulh         s5, tp, tp
                  sra          s8, sp, t2
                  fsgnjn.s     fs11, fa6, fs2
                  and          s7, t3, a0
                  fle.s        s7, fs7, fs6
                  fcvt.s.wu    ft11, a4
                  fcvt.w.s     s10, fs6, rtz
                  sltiu        a4, a4, 635
                  sltu         gp, s7, a0
                  fsgnjn.s     fa0, ft9, ft5
                  rem          s9, s5, s9
                  sub          t1, t3, s1
                  lui          s3, 720091
                  sltu         t3, s5, s7
                  srli         s1, ra, 19
                  slti         t6, ra, 507
                  add          a7, a0, a0
                  ori          a4, a0, -420
                  andi         s1, s4, -1412
                  mulhsu       a0, s8, s1
                  sltiu        tp, a2, -1101
                  sltiu        a1, s10, 1406
                  slli         s7, s1, 13
                  slti         a5, s11, 144
                  addi         t1, s4, 60
                  fsgnj.s      ft2, fs10, fs3
                  xori         t2, a2, 1754
                  xor          t5, s9, tp
                  ori          s5, s8, 1109
                  srai         ra, s11, 7
                  fmv.w.x      ft10, t6
                  sll          s0, a3, s10
                  nop
                  slli         t4, a5, 13
                  fsgnjx.s     ft7, fs7, ft10
                  fmv.x.w      a1, fa7
                  remu         s2, gp, t2
                  sltiu        a0, a6, -839
                  and          a4, s10, t3
                  sra          s11, s6, t0
                  srli         s10, t3, 18
                  sltu         t4, a5, t3
                  fcvt.s.wu    fs1, s2
                  ori          t3, s9, 997
                  ori          sp, s6, -275
                  fadd.s       ft0, fa1, fs0
                  or           s11, a1, tp
                  div          s10, s6, t3
                  srli         s10, s9, 13
                  fcvt.wu.s    a0, fa7
                  mul          t3, a3, t1
                  rem          tp, a0, t4
                  flt.s        t1, ft10, ft4
                  fadd.s       fa1, fs2, ft3, rne
                  addi         t5, t1, -1692
                  fmul.s       ft3, ft10, fs5
                  sltu         a5, s1, gp
                  rem          tp, a7, t1
                  mulhu        s1, s0, a6
                  mulh         gp, a5, s0
                  fsqrt.s      ft0, fs3, rup
                  fle.s        s9, fa4, ft11
                  nop
                  fmax.s       fs2, ft11, ft4
                  andi         sp, s4, 1784
                  srai         s6, a5, 20
                  fmv.w.x      fs5, s3
                  fsgnj.s      fa6, fs5, fs4
                  add          s7, zero, s11
                  lui          s0, 249219
                  xori         s1, s3, 1420
                  mulhu        a6, t3, s10
                  fdiv.s       fa4, ft5, ft9
                  sra          a4, t2, a6
                  nop
                  mulhu        s2, t3, a1
                  fcvt.w.s     a7, fa1, rmm
                  fsgnjx.s     fa4, ft9, fs4
                  ori          tp, ra, 1614
                  rem          s9, s6, s10
                  srl          s6, gp, t0
                  addi         s0, s2, 351
                  fdiv.s       fs11, fa1, fa4
                  fadd.s       fa4, ft4, ft4, rmm
                  fsgnjn.s     ft9, fs8, ft0
                  fmv.w.x      fs8, s2
                  fcvt.wu.s    s2, fa3
                  remu         s3, s0, tp
                  xori         a5, t1, -729
                  slt          zero, s2, sp
                  or           a1, s0, t5
                  fsgnjx.s     fa4, fs1, fs9
                  sll          s5, s9, s2
                  fdiv.s       fs11, fs1, fa0, rmm
                  fadd.s       fs1, fa2, fs11, rne
                  addi         a1, a1, -78
                  remu         gp, t4, s8
                  slt          t1, a7, a3
                  mul          sp, s11, zero
                  andi         tp, a2, 1696
                  mulhsu       a3, a1, s6
                  xor          s11, s0, t1
                  fsqrt.s      ft4, fa6
                  fmin.s       ft10, ft3, fs7
                  mul          a0, s4, t6
                  fsgnjx.s     ft6, fa1, ft9
                  add          t2, a6, s4
                  xor          a7, s8, s3
                  fcvt.s.wu    ft4, a6, rne
                  fmin.s       fs0, ft9, fs10
                  lui          s7, 506969
                  fcvt.s.wu    ft7, s6, rup
                  fmul.s       fs8, ft6, fs4, rup
                  sltu         t3, t2, s6
                  mulh         s0, t0, sp
                  ori          ra, t3, -1043
                  fmin.s       fs8, fs4, ft7
                  ori          t5, s6, -527
                  fmax.s       fa2, ft8, fs3
                  and          s1, t2, t2
                  xori         t3, s7, -324
                  nop
                  fmv.x.w      a1, fa5
                  andi         a3, s4, -1838
                  slt          t1, t6, a3
                  lui          zero, 137990
                  lui          tp, 304726
                  sll          a7, a3, gp
                  fclass.s     s6, fs0
                  srai         sp, a5, 2
                  fle.s        t4, fa6, fa5
                  fmv.w.x      ft2, t3
                  ori          a3, t2, 1695
                  fsgnjx.s     fs2, fs11, ft4
                  nop
                  nop
                  sltu         t3, s9, sp
                  srli         s0, sp, 22
                  slli         t2, s7, 3
                  andi         t2, a7, -1806
                  and          s11, a4, a1
                  flt.s        t6, fa1, ft8
                  srli         t4, s10, 25
                  divu         a3, a3, gp
                  fsgnj.s      fs8, fs8, fa4
                  fsgnjx.s     fs6, fa2, ft10
                  mulh         t3, t0, a7
                  slti         s6, s11, -925
                  feq.s        s9, ft0, fs10
                  fmul.s       fs4, fa6, fs5, rmm
                  fsgnjx.s     fs10, fs1, fa0
                  sltu         s0, s10, sp
                  fmul.s       fs5, ft3, fs0
                  mulhsu       a5, s1, zero
                  lui          zero, 931998
                  sltiu        t1, s5, 98
                  andi         s2, a4, -254
                  or           s3, s9, gp
                  fle.s        a7, fs11, ft8
                  div          s11, s3, tp
                  auipc        a0, 428752
                  fsqrt.s      fa5, fa5
                  slti         s3, ra, 815
                  srl          s1, s1, a4
                  fsqrt.s      fa6, ft5, rmm
                  mulh         t2, a7, t4
                  slli         a0, t2, 11
                  fsgnjx.s     fs3, fa5, fa4
                  fadd.s       fa1, ft5, fa5, rup
                  fcvt.wu.s    s8, fa2, rup
                  fmv.x.w      s0, ft10
                  flt.s        t6, fs4, fs7
                  xori         s11, gp, -385
                  ori          s1, a5, 1463
                  fsgnj.s      fs1, ft3, fs4
                  rem          a1, a3, t2
                  andi         a5, t0, -1236
                  fclass.s     s0, ft3
                  fmv.w.x      ft7, a0
                  slt          a6, s5, sp
                  fdiv.s       fs1, ft2, ft1, rtz
                  fcvt.s.wu    ft8, s9
                  div          s5, s6, a4
                  fmul.s       fa2, ft6, fa4
                  fsgnjn.s     fa6, ft0, ft2
                  slti         sp, s7, -1614
                  mulh         t4, t0, t0
                  feq.s        tp, fa7, ft7
                  addi         t1, a3, -1958
                  sra          s5, s4, t1
                  lui          s3, 589071
                  fmax.s       fs10, ft3, fa1
                  xori         s8, s4, -124
                  fle.s        t5, fa0, fa2
                  fsgnjx.s     ft3, fa5, ft4
                  fmul.s       fa0, ft3, ft4
                  slt          zero, s9, tp
                  sltiu        t6, zero, 333
                  lui          t4, 471407
                  addi         ra, t3, -1776
                  fsgnj.s      fa3, ft3, fa5
                  lui          s11, 897372
                  fsgnjn.s     fs11, fa0, ft7
                  fclass.s     s8, ft11
                  fsgnjn.s     ft0, fa0, fa4
                  div          ra, t3, t4
                  fle.s        t1, ft6, fs1
                  fmul.s       fs5, ft8, fa1
                  slti         a4, s9, 1162
                  mulh         s3, s8, t0
                  mulhu        s8, s9, a6
                  slli         t2, t0, 17
                  srl          s1, s7, t2
                  sll          s9, t4, t2
                  sltiu        s1, s7, 785
                  sltiu        zero, t2, -1115
                  ori          t6, s4, -934
                  and          s1, s3, a3
                  divu         t2, s10, s10
                  add          s1, t5, s10
                  fmv.w.x      fs4, tp
                  xor          a0, a1, s4
                  srl          a6, t4, t1
                  srai         s9, a5, 11
                  fcvt.w.s     gp, fa5, rup
                  nop
                  addi         s10, s6, 1008
                  xor          a7, a3, s5
                  mulh         t1, s2, zero
                  fsqrt.s      fa0, ft10
                  fmv.w.x      fs2, a4
                  sll          a7, a2, t4
                  mulh         s2, tp, s11
                  and          a1, s9, s2
                  fmax.s       fs0, fs8, fa3
                  auipc        s7, 706612
                  fdiv.s       fs7, fs8, fa1, rne
                  or           s1, s2, a7
                  fmv.w.x      fs10, t1
                  fsub.s       ft4, fs7, ft1, rtz
                  nop
                  fle.s        s9, fs3, fs11
                  fmax.s       ft10, fs5, ft1
                  auipc        t1, 56199
                  auipc        a6, 174050
                  srli         s6, a6, 22
                  div          s1, s6, s1
                  ori          a6, a4, 277
                  srli         a3, gp, 10
                  srai         s3, t6, 21
                  fcvt.wu.s    s6, fs9
                  sub          a1, t5, t3
                  fmax.s       ft8, fa6, fa3
                  mul          s8, ra, s4
                  flt.s        s2, ft0, fs11
                  fsgnjx.s     fa2, fa3, fs0
                  or           t3, t3, s2
                  fadd.s       fs7, fs6, fs0, rne
                  srl          t1, a3, a6
                  fdiv.s       ft4, fa4, fs7, rne
                  mul          s3, ra, a5
                  sub          t1, s11, a4
                  or           s3, gp, a0
                  ori          t5, t2, -1037
                  sll          sp, a4, a7
                  fcvt.s.wu    ft4, sp, rtz
                  xori         s11, a1, -1824
                  sltiu        s6, s5, -1552
                  ori          s5, t0, 857
                  fmin.s       fs3, fs5, ft8
                  and          t1, a6, s6
                  addi         a6, a3, -179
                  sltu         gp, a2, ra
                  fsgnjx.s     fs9, fs5, ft5
                  nop
                  add          s1, a2, t5
                  fcvt.s.wu    fs8, s10, rmm
                  slli         s0, t4, 23
                  fadd.s       ft3, fs9, fs11
                  nop
                  xori         t1, t5, -1952
                  fsgnjx.s     fs0, fs1, fa2
                  sra          s5, sp, a2
                  fsgnj.s      fa3, fa2, ft9
                  sra          gp, a6, s11
                  fmul.s       fa4, ft0, fs10
                  or           s7, s9, a3
                  fsqrt.s      ft2, fs9, rup
                  div          tp, a2, a4
                  fdiv.s       ft7, fs4, fa5, rne
                  slti         s8, s5, 892
                  slti         a5, t1, -262
                  xor          zero, t4, s11
                  ori          s11, ra, 1955
                  fcvt.w.s     tp, fa7, rdn
                  fclass.s     s3, fs2
                  slli         s0, t0, 12
                  nop
                  and          a4, t5, t0
                  addi         tp, s7, 420
                  xor          a0, sp, t2
                  xori         gp, tp, -1955
                  mulhsu       s11, t2, s9
                  fmul.s       ft9, fs4, ft2, rne
                  fsqrt.s      fs11, ft6, rtz
                  rem          t2, s0, s0
                  sra          a1, a6, s10
                  fsgnj.s      ft8, fs10, ft2
                  slli         gp, s1, 20
                  sltiu        s0, t5, 1079
                  addi         s10, a5, 1608
                  nop
                  auipc        s10, 713866
                  xori         a6, t3, 1241
                  slli         t2, a5, 13
                  sltiu        s1, s5, 681
                  fmin.s       ft1, fa2, fs11
                  fsgnjx.s     fa1, ft5, ft7
                  ori          sp, s2, -143
                  xor          t4, t2, zero
                  remu         t2, t1, s8
                  fdiv.s       ft6, fs10, fs10, rdn
                  srl          t4, a7, zero
                  xor          a7, s7, t2
                  rem          tp, zero, s2
                  fadd.s       fa6, fa3, fs5
                  slti         t4, t4, -1328
                  mul          s2, sp, s11
                  rem          s5, t3, a1
                  fmin.s       ft1, ft3, fs8
                  fmul.s       ft1, ft0, ft11, rup
                  srai         t1, t6, 12
                  mulhsu       zero, t3, a4
                  sra          ra, a2, t6
                  sltu         gp, a2, a6
                  fle.s        a1, fs1, fa1
                  fmax.s       fa1, ft11, fs10
                  fcvt.s.wu    ft5, t2
                  flt.s        a3, fs8, ft3
                  ori          a7, s4, 839
                  fmin.s       ft9, fs11, fa1
                  flt.s        t3, fs2, fs9
                  fmv.w.x      fa7, s3
                  divu         t5, t1, s7
                  slli         a6, a3, 13
                  auipc        tp, 962463
                  remu         s7, a7, s2
                  rem          s2, s3, tp
                  fsgnjn.s     fs6, fs3, ft11
                  fcvt.s.w     fs0, s1
                  fcvt.w.s     t5, ft3, rdn
                  fcvt.s.w     ft3, t3
                  fadd.s       fs6, fa1, ft9, rne
                  sub          a7, a1, ra
                  srl          ra, t0, a5
                  fsgnj.s      ft0, fa5, fs5
                  sll          a0, zero, a5
                  fcvt.w.s     a3, ft3
                  fsqrt.s      fa5, ft7
                  flt.s        s9, fs1, fs4
                  mulhsu       s10, zero, t5
                  fmax.s       ft9, fa2, fs5
                  sltu         zero, sp, s6
                  fcvt.s.wu    fs2, sp, rtz
                  srl          a5, s0, a0
                  fmin.s       fs4, fa2, fs9
                  srli         sp, t1, 12
                  sra          s3, s2, t5
                  sra          s5, s9, s10
                  feq.s        a5, fs2, ft1
                  sll          s6, a7, t6
                  and          s11, t1, a0
                  ori          s7, s10, -283
                  srli         tp, s3, 11
                  srl          a0, t1, a3
                  fcvt.w.s     s10, fs10
                  sltiu        a5, s2, -1516
                  fmax.s       fs2, ft1, fa1
                  flt.s        t3, ft2, fs5
                  fsgnjn.s     ft10, fa1, fs0
                  and          s1, s9, t2
                  srl          s5, t2, a4
                  fle.s        s0, fa3, ft9
                  mulh         ra, s5, s5
                  fcvt.s.wu    ft1, a0
                  slli         s0, s2, 27
                  nop
                  or           t4, s4, s6
                  fclass.s     t3, fs9
                  nop
                  fsgnj.s      fs11, fa0, fs1
                  add          t4, t5, a1
                  flt.s        s7, fs6, fs7
                  or           t1, s4, ra
                  divu         a3, a1, s11
                  fcvt.s.wu    ft1, zero, rmm
                  andi         a5, s5, -2014
                  srai         a3, s1, 4
                  srl          s1, t4, s3
                  sll          t4, tp, t3
                  sub          s1, t3, zero
                  mulhu        s6, sp, s7
                  fclass.s     s1, ft8
                  andi         s2, t5, 1266
                  add          sp, s6, s6
                  or           a7, s3, t0
                  sll          a4, sp, t2
                  slli         t5, zero, 31
                  remu         t5, a3, a7
                  andi         s10, tp, -2033
                  add          s1, s7, t1
                  xor          sp, t2, a6
                  xori         tp, s10, 1324
                  remu         t1, t4, a2
                  fcvt.w.s     s2, fs4
                  xori         s6, t6, -599
                  fle.s        a5, fs2, fs7
                  sra          t3, a6, sp
                  ori          s1, s2, 1750
                  slti         a1, t0, 287
                  addi         t1, tp, -646
                  sltu         a7, s5, ra
                  mulhsu       t2, s9, s7
                  fcvt.w.s     a1, fs4
                  flt.s        a7, fa7, fa6
                  sll          ra, s6, s1
                  ori          s10, a1, 2028
                  fsgnjx.s     fs10, ft2, fa5
                  mulhu        s1, t2, sp
                  fmul.s       fs5, fa3, fs0
                  remu         s0, ra, a0
                  lui          s5, 212476
                  fcvt.wu.s    a3, fs11
                  slli         a6, s0, 14
                  srl          s8, a3, sp
                  mul          a5, s7, a4
                  slli         a1, t1, 4
                  sll          s0, a1, ra
                  mulhu        a6, s8, s9
                  or           s6, zero, a4
                  flt.s        a7, ft6, ft5
                  slt          gp, ra, zero
                  ori          t2, t3, 120
                  fmin.s       ft5, fs5, fs4
                  andi         ra, s8, -1439
                  fsgnjx.s     ft4, fs0, fa5
                  and          sp, t2, t6
                  fcvt.s.w     fs0, t3, rtz
                  slt          sp, a7, a6
                  fcvt.s.wu    fa4, t1, rmm
                  fadd.s       ft8, fs11, fs0, rmm
                  nop
                  srl          s6, s10, s5
                  andi         s1, s11, 604
                  ori          a7, s4, -1542
                  fdiv.s       fa7, fa5, fs10
                  feq.s        s11, fs8, ft1
                  slt          t4, a3, s9
                  sra          a4, a0, s7
                  lui          a5, 118516
                  sll          s5, s4, a4
                  mulhsu       ra, s5, t1
                  slti         gp, a5, -1336
                  mulh         a6, s1, a2
                  sll          a1, s9, gp
                  add          s3, s5, s3
                  xori         t1, a3, 915
                  fcvt.w.s     t5, ft7, rne
                  xor          a1, zero, a5
                  sll          a7, t6, a1
                  fcvt.s.wu    fs3, s1
                  flt.s        a1, fs11, fs9
                  fcvt.s.w     fs3, tp, rmm
                  nop
                  slli         zero, ra, 9
                  slti         gp, t6, -1164
                  div          a6, s8, a3
                  slti         s10, s8, -1404
                  sra          a6, t2, s2
                  nop
                  fclass.s     s8, fs0
                  xor          gp, t6, s3
                  remu         a7, t1, a2
                  xor          a0, t1, t6
                  flt.s        gp, fs8, ft6
                  mul          s6, s9, a0
                  fcvt.w.s     t4, fs3
                  srai         a6, s6, 6
                  fmv.x.w      s0, ft2
                  xor          s10, s10, a3
                  fmul.s       ft10, ft11, ft11
                  fsgnjx.s     ft2, fs0, fs3
                  ori          tp, t6, 839
                  fdiv.s       fa3, fs5, ft5
                  lui          tp, 887237
                  ori          t4, tp, 1712
                  sltiu        a7, a2, -244
                  fcvt.wu.s    a4, fa2, rup
                  fmv.w.x      fs2, a3
                  lui          s7, 81783
                  lui          ra, 791239
                  fsgnjn.s     fa3, fs2, ft11
                  nop
                  div          t5, s1, t3
                  srai         t6, zero, 19
                  fcvt.wu.s    a6, ft7
                  mul          s5, ra, t3
                  and          t3, s8, s8
                  fsgnjx.s     ft8, fa6, ft9
                  fmv.w.x      ft11, t6
                  fsgnjx.s     ft10, fs1, fa4
                  fsgnjx.s     ft6, ft10, ft3
                  add          zero, t6, s4
                  fdiv.s       ft5, ft5, fa6
                  fcvt.s.w     fa3, t5
                  fcvt.s.w     fa2, a5
                  div          a6, s9, a3
                  mulhu        sp, tp, s7
                  fcvt.w.s     s6, fs3, rne
                  fsub.s       fs6, ft4, ft9
                  srl          t6, s1, t4
                  feq.s        s0, ft5, fs9
                  andi         t3, a7, -1910
                  fsgnjn.s     fs0, fs7, fa0
                  slt          s11, a7, s8
                  mul          s10, a3, tp
                  slt          s1, t6, gp
                  fdiv.s       ft10, fa7, ft7
                  sll          ra, zero, s5
                  fadd.s       ft8, fa2, fs0
                  remu         s8, a1, s9
                  fmin.s       ft0, fa6, ft4
                  div          s11, ra, s10
                  fmul.s       fs11, ft5, fs9, rne
                  sub          a4, t6, a0
                  ori          s10, tp, 1004
                  sltu         s1, t5, t6
                  div          s5, t0, t0
                  slt          s6, s4, t1
                  fdiv.s       fs6, ft5, fs0
                  fclass.s     s5, fs1
                  xori         a1, s3, 1649
                  fsqrt.s      fs11, ft1
                  and          a7, s3, s10
                  sll          s1, s8, s3
                  fdiv.s       fa6, ft4, ft3
                  srai         s11, a7, 7
                  add          a6, t6, zero
                  fcvt.s.w     ft2, t3
                  fsgnjn.s     fs9, ft7, fa0
                  mulhsu       a1, s8, s9
                  fsgnj.s      fa1, ft6, fs0
                  addi         zero, t6, -983
                  sltu         t6, t0, s10
                  srli         a4, t5, 5
                  or           s1, s4, s0
                  fsgnj.s      ft2, fs11, fs2
                  xori         t2, s8, -1722
                  sltiu        sp, zero, -81
                  mul          s1, s9, a6
                  xor          s10, t0, t6
                  slt          a5, s8, tp
                  fdiv.s       fs0, fa7, fs10, rmm
                  fdiv.s       ft1, fa1, ft0, rup
                  fsgnjn.s     fs8, fa4, ft10
                  fsgnjn.s     fa5, ft2, fa7
                  sltu         s5, s9, a2
                  add          s0, s0, t0
                  ori          t6, s2, -515
                  fadd.s       ft4, ft4, ft7
                  mul          a1, s8, a4
                  xor          gp, s8, t2
                  slli         t1, a7, 20
                  slli         t6, t2, 21
                  fcvt.wu.s    s3, ft8
                  feq.s        s0, fa3, fs9
                  srai         a5, s5, 24
                  fmax.s       fa7, fa2, fa0
                  srli         ra, s9, 7
                  fle.s        ra, fa4, fs5
                  fsub.s       fs3, ft2, fs3
                  sltu         s8, a3, t2
                  fsgnjx.s     ft0, ft3, fs4
                  slti         tp, s5, 1010
                  xor          t5, a1, t0
                  slt          s7, sp, s3
                  srai         zero, t3, 1
                  fclass.s     a3, fs8
                  fmin.s       ft0, fa7, ft7
                  slli         t1, ra, 13
                  mul          t1, t3, a1
                  fcvt.s.w     fa5, zero, rdn
                  fsgnjx.s     fa0, ft5, fs5
                  and          s0, a5, t1
                  fsub.s       ft5, fa6, fs8
                  fcvt.s.w     ft2, a6
                  div          s1, t1, s4
                  xor          sp, t3, s6
                  fmul.s       fs7, fs6, fs7, rmm
                  xori         s9, s6, 604
                  or           sp, a3, t0
                  fmax.s       fs2, ft9, ft5
                  and          a3, s2, t2
                  flt.s        a0, ft6, fs9
                  mul          s1, t3, zero
                  nop
                  sltiu        a4, s4, 608
                  rem          a5, t4, t1
                  div          s6, t1, a7
                  sra          a4, s11, zero
                  fmin.s       fa7, fs6, fa1
                  fmul.s       ft8, fa0, fa2
                  fle.s        t6, fs1, fs3
                  mulhu        a1, s0, t1
                  add          t1, s8, gp
                  sra          gp, s9, s2
                  mul          s6, a6, s8
                  fsqrt.s      fs5, fa0
                  xori         tp, s3, 1447
                  ori          a7, a3, 1278
                  fsgnj.s      fs4, fs11, ft1
                  sra          s0, a6, t4
                  fmul.s       fa1, ft3, ft7, rne
                  fmv.w.x      ft1, a2
                  fmax.s       fs9, fs4, fs10
                  mul          a4, s11, s8
                  nop
                  fdiv.s       fa3, fs3, ft10
                  divu         a0, s10, s5
                  fmv.x.w      s1, ft3
                  addi         t1, s5, 759
                  fcvt.s.w     fs10, s4, rmm
                  fsgnjn.s     fs9, ft8, fs6
                  sltiu        s1, t0, -1169
                  sll          a1, a7, t2
                  sub          s7, a3, t2
                  fsgnj.s      fa5, fs7, fs8
                  rem          s1, gp, a2
                  sll          s1, s8, t3
                  add          ra, s3, s1
                  remu         s3, a0, t5
                  slti         a1, ra, -973
                  lui          t3, 89545
                  feq.s        zero, ft3, ft2
                  and          ra, a0, a7
                  fsgnjn.s     fs3, ft9, ft4
                  slt          a3, a6, a1
                  lui          s6, 65745
                  fsgnjx.s     fa6, ft7, fs6
                  remu         a1, s8, s5
                  mulh         t5, t3, a0
                  fclass.s     s7, fa2
                  fmax.s       ft9, fa3, ft0
                  mulh         t6, t2, zero
                  fmv.x.w      s0, ft2
                  and          t3, t4, a1
                  ori          t3, s7, -153
                  addi         s2, t3, 750
                  sltu         a3, ra, a1
                  xor          s11, s5, t3
                  mulhu        gp, sp, t3
                  mul          a7, t1, t4
                  slt          ra, s6, s8
                  srai         gp, sp, 10
                  fmin.s       fa1, fs2, ft11
                  fclass.s     t3, ft9
                  sub          a5, s1, zero
                  mulhu        s9, t0, t5
                  mulhsu       sp, t3, a3
                  lui          s3, 411788
                  xor          s0, t0, a3
                  mulh         a5, s11, a5
                  nop
                  fmv.x.w      t3, fs4
                  andi         a7, s6, -380
                  mulhsu       t3, s1, a7
                  srli         s3, a2, 12
                  fcvt.s.w     fs0, t6
                  sll          sp, s11, gp
                  fsgnjx.s     fa7, fs9, ft11
                  mul          s9, s0, a5
                  fmv.w.x      fs6, t4
                  fcvt.s.w     fs0, ra
                  srl          ra, t6, a7
                  feq.s        a5, fs6, fs3
                  mulhu        a1, sp, a1
                  fdiv.s       fs9, ft9, fs4, rmm
                  nop
                  fcvt.s.wu    ft8, t6
                  slti         s6, s2, 906
                  fcvt.w.s     s1, fa5
                  fmin.s       ft7, fs3, ft3
                  sub          s10, s3, t0
                  srli         s7, t1, 3
                  fcvt.w.s     a5, fs5, rtz
                  fmax.s       fs4, fa5, fa0
                  slt          a0, tp, s0
                  fcvt.wu.s    t5, fs11
                  remu         a1, tp, s9
                  fsqrt.s      fa5, ft6
                  xor          ra, s10, a3
                  or           a4, s5, ra
                  nop
                  fsgnjx.s     fa0, fs4, ft9
                  fmv.w.x      fs7, a7
                  mulh         a4, s10, t3
                  add          t2, s6, s5
                  fmul.s       ft4, fs4, ft8
                  addi         t6, a1, 1449
                  nop
                  fmv.x.w      s1, fs0
                  sra          t6, s2, a7
                  xor          a1, t3, s9
                  sltiu        s6, a1, -562
                  fle.s        s7, fs0, fa0
                  andi         s11, s2, 1593
                  fsgnjn.s     ft5, fs4, ft8
                  divu         s8, s10, t3
                  mul          tp, s7, s2
                  feq.s        t1, ft0, fs10
                  fdiv.s       fa7, ft7, fs10
                  sra          s3, a4, s2
                  fsqrt.s      fs10, ft11
                  sub          s6, zero, s0
                  slti         s6, s7, 84
                  slt          t3, s10, s9
                  feq.s        s8, ft8, fs11
                  slt          sp, t1, ra
                  fcvt.s.wu    ft10, t6, rne
                  xori         a0, t4, 623
                  fsgnjn.s     fa3, ft11, ft2
                  fclass.s     a3, fs11
                  mulh         t1, a5, ra
                  fle.s        a7, ft5, fs1
                  xori         t6, a2, 1969
                  slli         sp, s3, 22
                  xor          a1, s7, a1
                  fmv.w.x      fs3, t1
                  or           gp, a7, t6
                  fsgnj.s      fs3, ft7, fa4
                  fmv.w.x      ft11, gp
                  srl          zero, s7, ra
                  mulhu        s10, s7, s0
                  divu         s9, t3, s11
                  sub          a1, s6, s10
                  slti         s11, ra, -1098
                  fclass.s     s10, ft9
                  div          s2, s10, s9
                  fsgnj.s      ft0, fs6, ft6
                  fmin.s       fs8, fs3, fa3
                  fsgnjn.s     fs3, fs6, ft7
                  mulh         a3, s4, a0
                  fclass.s     t3, fs7
                  nop
                  mulhu        a6, a1, a6
                  lui          a7, 332297
                  slti         tp, t2, 572
                  fmv.x.w      a5, fa0
                  slli         a0, s0, 8
                  add          tp, s11, s9
                  lui          s11, 242603
                  sub          s9, tp, a0
                  sltiu        s10, t4, -348
                  flt.s        s11, ft8, fs3
                  fsgnjn.s     ft8, ft4, ft9
                  lui          t6, 314276
                  divu         s0, s0, s4
                  and          a7, a4, t4
                  or           s2, s5, t6
                  fmul.s       fa3, ft10, fs8, rdn
                  mulhu        s0, a5, tp
                  add          t3, s2, sp
                  fmv.w.x      fs8, s0
                  addi         ra, s1, -144
                  fcvt.wu.s    zero, fs3, rdn
                  rem          a6, t6, a5
                  fsub.s       ft10, ft10, ft3
                  srl          s9, s0, t4
                  fcvt.s.wu    ft5, s6, rup
                  feq.s        a3, ft6, fa0
                  fcvt.s.w     ft0, s4, rtz
                  rem          t2, a0, a6
                  feq.s        sp, fs3, fs7
                  srl          a0, ra, a5
                  fmul.s       ft3, fa0, fa7, rmm
                  divu         s0, t2, tp
                  sub          gp, t4, s8
                  xori         s5, a1, -1162
                  fclass.s     a4, fa1
                  rem          t6, a7, t0
                  fsgnj.s      fa1, ft8, ft9
                  sra          a0, gp, t6
                  fsub.s       ft11, fs4, fa1, rtz
                  fcvt.w.s     t1, fs5
                  mul          a1, ra, a0
                  fdiv.s       fs0, ft10, fa4, rtz
                  sltu         s7, s4, s7
                  flt.s        a7, fs11, ft1
                  fcvt.s.w     fs9, a0, rmm
                  srl          ra, s2, t5
                  sra          a3, a7, s10
                  mulh         tp, s11, a1
                  fle.s        t3, fs7, fa6
                  andi         s6, s6, 305
                  andi         a5, ra, 265
                  sltu         s11, s10, t6
                  div          a1, s10, s2
                  srl          s8, t2, a1
                  divu         a6, s0, a4
                  andi         a3, a1, 347
                  nop
                  fcvt.s.w     ft8, s0, rup
                  rem          s6, s6, s4
                  ori          t3, gp, 1669
                  sll          ra, s7, tp
                  auipc        a5, 1033796
                  fle.s        t4, fs11, ft9
                  mul          t1, tp, s10
                  xori         s7, zero, 458
                  lui          t4, 894896
                  nop
                  srl          s2, tp, t4
                  fmul.s       ft3, ft0, ft1
                  andi         t3, ra, 572
                  fsqrt.s      fa6, fs4, rne
                  mulhsu       s10, s5, t4
                  srl          ra, sp, s11
                  srli         a6, a4, 18
                  ori          s11, s6, 1212
                  remu         sp, a5, s6
                  nop
                  slt          s6, tp, zero
                  sub          sp, sp, s11
                  mulhsu       a6, s10, s2
                  add          a3, t4, a4
                  div          a0, t4, a2
                  fsub.s       ft9, ft9, fa6, rdn
                  fmv.w.x      fa0, a1
                  div          sp, s8, a0
                  xori         t5, zero, -334
                  nop
                  addi         t2, a2, 1760
                  fmv.x.w      zero, ft9
                  auipc        s3, 570935
                  fmv.w.x      fs11, t5
                  fcvt.w.s     gp, ft7, rdn
                  fclass.s     ra, ft9
                  mulhu        t4, s1, s2
                  xori         gp, tp, -779
                  rem          a5, tp, a7
                  nop
                  fsub.s       ft4, ft5, fs3, rtz
                  srl          s9, t2, s7
                  srli         t1, t0, 15
                  slti         t6, a1, -958
                  sub          a4, s9, s7
                  rem          zero, a3, tp
                  mulhu        a4, s11, s2
                  fsgnj.s      fs8, ft5, fs1
                  fmv.w.x      fs10, s5
                  mul          s10, s9, t0
                  sll          a3, s5, t5
                  sra          s8, s7, s10
                  mulhu        s10, tp, s4
                  slti         s0, gp, -397
                  srai         s1, s1, 10
                  xori         s8, s2, -892
                  sll          zero, a2, a7
                  andi         sp, a0, -1091
                  divu         a6, s5, s8
                  sltiu        tp, a6, 1575
                  flt.s        a0, fs10, fs8
                  fcvt.wu.s    s1, ft10
                  srai         tp, a3, 9
                  remu         a3, a3, s10
                  sra          s1, s4, a1
                  and          a7, s9, t0
                  fadd.s       ft3, ft10, fs0
                  remu         a0, t2, zero
                  mulhu        s8, t6, t6
                  sltu         gp, a0, t5
                  srl          a3, t6, t0
                  or           s6, s8, a1
                  fclass.s     a6, ft9
                  fcvt.w.s     a5, ft3, rmm
                  ori          a3, t2, 991
                  rem          s10, a7, t3
                  xor          a0, s5, sp
                  srai         s7, t5, 23
                  fmv.x.w      sp, ft6
                  srai         s2, ra, 18
                  fmax.s       fs11, fs3, ft3
                  and          s6, s11, sp
                  flt.s        t4, fs9, fs5
                  fsgnjn.s     fs0, ft1, fa5
                  srai         a6, t6, 12
                  lui          s6, 188035
                  fle.s        s1, ft4, fs8
                  fcvt.s.w     fs4, s5, rne
                  xori         t6, t4, -219
                  fmv.w.x      fa1, a6
                  div          s3, t0, s8
                  nop
                  fcvt.s.w     fs4, t6, rmm
                  addi         a3, a2, 909
                  sub          s8, s9, s4
                  fmin.s       ft5, fs3, fs8
                  add          gp, s4, a7
                  lui          s6, 25649
                  fsqrt.s      ft9, ft9
                  nop
                  fcvt.s.wu    ft11, a3, rup
                  remu         t2, a3, a5
                  mul          s1, s6, s2
                  fcvt.s.w     ft11, t1, rtz
                  rem          t5, s4, s11
                  fmin.s       ft3, ft1, fs0
                  lui          a3, 834135
                  fmul.s       fa1, ft5, fa4, rdn
                  sra          s2, a7, a5
                  slt          t2, zero, s6
                  fcvt.w.s     a7, ft6, rne
                  fcvt.wu.s    t6, fa4
                  fsgnjn.s     fs1, fs4, ft1
                  feq.s        s0, fs5, fs2
                  fmul.s       ft4, fa4, fs9, rtz
                  andi         s1, s2, -11
                  div          a1, t0, sp
                  fmv.w.x      fs7, s1
                  sll          gp, a7, tp
                  sll          s3, sp, s11
                  addi         a4, t6, 1492
                  div          s6, s4, a3
                  lui          t5, 707501
                  addi         t4, a7, 1827
                  fadd.s       fs3, fa4, ft8, rne
                  fmul.s       fa4, fa4, fs9
                  fsgnjn.s     fs8, fs3, ft5
                  divu         t5, t6, t4
                  slti         a4, a6, -1502
                  sltu         gp, t2, a0
                  mul          zero, a7, t2
                  or           a6, gp, a6
                  add          t2, s2, t4
                  sll          t4, a5, s2
                  add          a0, a4, s11
                  fmul.s       fa3, ft2, ft8, rdn
                  fmax.s       fs2, fs0, ft11
                  fmv.w.x      fs3, a1
                  slt          t2, s6, a2
                  mulhu        t4, s5, sp
                  fcvt.w.s     zero, fs3, rmm
                  mulhsu       gp, sp, a4
                  and          t6, s1, a6
                  fmax.s       ft3, fs7, fs0
                  xori         a3, ra, -1879
                  lui          t2, 506586
                  sra          t4, s11, s6
                  fmax.s       fa6, fa1, fs9
                  mulh         s11, a1, t3
                  fcvt.wu.s    s2, fs10
                  sll          t3, a7, t2
                  sltiu        a6, s4, -412
                  fmul.s       fs0, fa5, fs11, rdn
                  fcvt.w.s     t3, fa0, rdn
                  sll          s8, a7, s4
                  andi         s8, s0, 67
                  fadd.s       fs4, fs10, fs5, rup
                  srai         s8, t6, 16
                  auipc        s6, 422258
                  auipc        a4, 279677
                  slti         a1, s1, 532
                  rem          a7, t5, t4
                  fdiv.s       ft2, ft9, fs1, rup
                  sltu         t3, s8, s3
                  xori         a4, s5, -287
                  fmul.s       ft9, fs11, fs10, rdn
                  slli         s5, zero, 11
                  fadd.s       fs10, ft1, fs0
                  fdiv.s       fa3, fa5, fs3
                  fmin.s       ft2, fa0, fs11
                  fcvt.w.s     tp, fs3, rup
                  fcvt.wu.s    t1, fs4
                  add          gp, t1, t5
                  addi         s8, sp, 1484
                  fcvt.w.s     t5, fs10, rdn
                  xor          s10, s10, a3
                  fsgnjn.s     fs1, fa4, fa0
                  slt          s3, t1, gp
                  flt.s        t2, fa6, fa5
                  rem          ra, s9, ra
                  sltiu        s6, t5, 1337
                  fsgnjn.s     fa6, fa7, fs11
                  fcvt.s.wu    ft3, t0, rmm
                  feq.s        t1, fs1, fa2
                  xor          s2, gp, tp
                  nop
                  fclass.s     t4, fa7
                  fsgnj.s      fa1, fs1, fs5
                  divu         gp, s3, a0
                  fsgnjx.s     fs3, ft3, fs10
                  sltiu        s11, sp, -1227
                  slt          zero, s8, s9
                  sra          s7, s1, s5
                  nop
                  fmul.s       ft4, fs5, fs0
                  srli         s9, s5, 5
                  mul          t4, s11, s1
                  fcvt.wu.s    gp, ft5, rdn
                  auipc        s10, 291841
                  auipc        t1, 911492
                  fmin.s       fa3, fs1, fs2
                  slti         s8, tp, 1520
                  sltu         t3, s0, s6
                  fsgnjn.s     fa5, fa3, fa4
                  fmax.s       fa2, fa2, fa7
                  fsgnjx.s     ft3, fs7, ft2
                  fsqrt.s      ft5, ft5
                  fcvt.s.wu    ft10, t1
                  fdiv.s       ft9, fa4, ft11, rdn
                  srai         ra, s8, 27
                  add          s3, s4, a6
                  fadd.s       fa3, fs6, ft3, rup
                  auipc        s2, 318132
                  fmin.s       fs7, fs2, fs11
                  and          a4, s3, s6
                  srai         s9, sp, 3
                  fclass.s     s5, ft9
                  fmv.x.w      ra, ft11
                  fsgnjx.s     ft11, fa0, fs10
                  fclass.s     a6, ft7
                  andi         a4, t1, -572
                  flt.s        t1, ft1, fs2
                  div          s7, a2, zero
                  fcvt.w.s     a5, ft11
                  sltiu        s10, t6, 782
                  fadd.s       fs10, fs2, ft1
                  add          s0, sp, s7
                  mulh         t1, a5, a5
                  auipc        s0, 238529
                  sra          s2, ra, s3
                  divu         t6, s7, t3
                  xori         a6, s10, 668
                  nop
                  sll          s10, gp, s7
                  fsub.s       ft10, ft2, ft0
                  divu         tp, a3, s6
                  fsgnjn.s     ft10, ft3, fa5
                  slt          s2, a5, gp
                  fcvt.s.wu    fa1, a5
                  auipc        a7, 14443
                  xori         a3, s5, -441
                  fdiv.s       ft2, fa1, ft8, rne
                  ori          s2, gp, 730
                  mulhsu       s3, ra, a0
                  fmin.s       fa6, fs6, ft8
                  srli         s8, s5, 16
                  xori         s7, s0, -119
                  lui          s11, 59933
                  andi         ra, t5, 1068
                  fdiv.s       ft9, ft5, ft11
                  rem          a5, zero, t3
                  or           s7, s3, a5
                  slli         sp, s8, 25
                  rem          s8, a0, s7
                  mulhsu       a5, a3, s3
                  or           s1, s2, s10
                  slli         s6, s1, 11
                  add          s10, a6, s2
                  addi         a1, zero, 1353
                  add          a3, s5, a2
                  fsgnjn.s     fs7, fa5, fa3
                  slt          a4, t2, s3
                  addi         s0, tp, -1145
                  fcvt.w.s     t3, ft6
                  auipc        s11, 95779
                  andi         s2, a4, -253
                  flt.s        a3, fs11, ft2
                  slti         s7, t6, 1783
                  fadd.s       fa7, ft2, fa0, rup
                  fsqrt.s      fs11, fs9
                  slli         t5, a4, 17
                  mulhu        s8, a1, s0
                  divu         s1, s0, s4
                  mul          a7, sp, zero
                  sra          s8, a7, t4
                  nop
                  xori         s0, s1, 341
                  fcvt.w.s     s3, fs6
                  fcvt.wu.s    s2, ft0, rne
                  srli         zero, s11, 0
                  srli         s11, s9, 29
                  slt          s10, ra, tp
                  fcvt.s.wu    fs6, a5
                  srai         gp, s5, 5
                  fmax.s       fa1, ft9, ft5
                  fsub.s       fa7, fs2, ft5, rup
                  div          zero, tp, s11
                  flt.s        s5, fs3, ft0
                  nop
                  xor          zero, s6, tp
                  sll          s9, t6, s7
                  remu         t6, s7, s10
                  fsgnjn.s     fa1, fa2, fs0
                  andi         s0, t0, -292
                  slli         a7, s5, 26
                  ori          a5, s10, 1677
                  sll          s11, s8, s10
                  or           t1, t5, s10
                  mul          s2, t0, a5
                  slt          tp, s0, a0
                  andi         s7, tp, -955
                  div          t2, t0, a2
                  fmin.s       ft11, fa4, ft9
                  fsqrt.s      ft1, fa4, rne
                  or           s0, ra, s0
                  ori          s7, s4, -1519
                  fsub.s       fs3, fs7, ft6
                  fcvt.wu.s    a1, ft3
                  fdiv.s       fs3, ft8, ft6
                  mul          sp, s9, s9
                  remu         t4, s7, a4
                  slli         tp, sp, 7
                  srai         s0, t4, 19
                  addi         s8, a2, 380
                  fadd.s       fs0, fa5, fs3
                  and          t5, s2, a3
                  or           ra, a6, a5
                  xor          s3, s0, s0
                  fmin.s       fa3, fs4, ft5
                  fcvt.s.wu    fs3, t3
                  fsgnjn.s     ft11, ft5, fa0
                  lui          s7, 323966
                  div          a6, s7, s3
                  divu         tp, gp, a4
                  fsgnjx.s     ft5, ft3, fa0
                  srai         gp, a1, 22
                  remu         t1, t2, t0
                  fclass.s     tp, ft4
                  fsqrt.s      ft5, fs7, rup
                  mulhu        t3, a2, ra
                  slt          s3, a3, a4
                  sltu         tp, t6, a4
                  feq.s        t6, ft4, ft10
                  sub          s11, s0, s4
                  fsub.s       ft6, fa3, fa5
                  fsub.s       fs8, ft6, fs5, rtz
                  fsub.s       fa3, ft10, ft1, rtz
                  fclass.s     ra, fs1
                  srli         s11, a6, 29
                  fadd.s       ft5, fs2, fs1
                  feq.s        s2, fa6, ft6
                  sra          t2, s7, t4
                  flt.s        t4, fs10, fs7
                  fclass.s     zero, fs1
                  andi         s2, a0, -752
                  add          a7, s3, s8
                  fsqrt.s      ft4, fs8
                  ori          a5, s8, 342
                  mul          s11, s9, a4
                  ori          s11, a7, 713
                  fsgnj.s      fa2, fs8, ft0
                  flt.s        t4, ft6, ft0
                  slti         t4, s5, -1276
                  srl          t3, tp, s9
                  or           t6, s3, s9
                  fmul.s       fa4, fa7, ft9
                  mulhu        tp, s0, a3
                  fcvt.wu.s    s10, fs3
                  ori          a4, s3, -570
                  fmin.s       fs6, fa0, ft10
                  fmax.s       fs2, fa1, ft2
                  ori          a3, s8, 1191
                  fadd.s       ft9, fa3, fs2
                  fcvt.s.w     ft8, s9
                  fmin.s       ft6, fs3, fs11
                  lui          a7, 442939
                  fadd.s       fs0, ft8, fs10
                  srli         ra, s4, 7
                  lui          s0, 999149
                  fsqrt.s      fs4, ft1, rdn
                  srli         a0, zero, 6
                  or           s8, s7, t3
                  xori         t3, s4, -1738
                  fcvt.s.w     ft9, s7
                  andi         t1, s0, -1498
                  remu         s11, a1, sp
                  sll          a0, s7, sp
                  nop
                  addi         s3, zero, -1840
                  fsgnjx.s     fs11, fa7, ft2
                  rem          t4, s0, t5
                  addi         s9, zero, 1059
                  and          t5, s10, t6
                  sltiu        a3, s1, -1611
                  sll          s7, s11, s11
                  remu         gp, a2, a7
                  fsgnjx.s     fa5, fa6, fs9
                  div          gp, a2, a3
                  mulhu        a5, t6, s1
                  mulhu        a3, s3, gp
                  mulhsu       a7, a2, s11
                  or           t5, a5, t4
                  rem          s7, a5, a2
                  sltiu        tp, gp, -1020
                  fmin.s       fa5, fs2, fs11
                  andi         s11, s5, 2025
                  fmul.s       fs11, fa7, fs8, rtz
                  ori          s11, a0, -1735
                  divu         s2, a5, t3
                  fmv.x.w      sp, fa2
                  mulh         a7, a4, s4
                  auipc        a1, 961004
                  divu         s5, a6, a6
                  or           s2, gp, t1
                  srai         t3, zero, 23
                  auipc        s1, 679593
                  remu         a5, a5, s0
                  mulh         a5, s10, t3
                  add          t5, t6, s11
                  fcvt.w.s     a1, ft7
                  fsgnjx.s     fs6, ft3, fa1
                  divu         s1, s11, a6
                  fmul.s       ft6, fa6, fa1
                  slti         s10, t1, -1666
                  remu         s7, t2, t0
                  auipc        a6, 621552
                  feq.s        a1, fa3, fs9
                  slti         s1, s3, 1701
                  sll          s8, t6, a0
                  slli         t5, a4, 8
                  srai         a7, a5, 28
                  xori         a3, a6, -470
                  xor          sp, s4, s10
                  fmv.w.x      fs4, s4
                  mul          s0, a3, a6
                  lui          s8, 99383
                  fsgnjn.s     fs7, fs10, fs11
                  fsub.s       fs5, fa1, fa5, rne
                  fsgnjx.s     fa1, fs2, fs1
                  fsgnjn.s     ft6, fs11, fs10
                  fsgnjx.s     fa5, fa0, ft10
                  fdiv.s       ft3, fs10, fa5
                  fmax.s       fa7, ft5, ft11
                  xori         t4, a7, -538
                  andi         ra, a0, -1369
                  flt.s        tp, fs6, fa7
                  fmin.s       fa3, fa2, fa7
                  fmin.s       fs5, fs5, fs0
                  fle.s        s7, fs6, fa1
                  fmin.s       fa7, ft0, ft10
                  fcvt.w.s     s6, fa1, rtz
                  fcvt.s.w     fa2, t0, rmm
                  andi         a1, s6, 701
                  fsgnjn.s     fs4, fa6, ft1
                  slti         a0, a4, 27
                  andi         s8, t3, 408
                  xori         t6, sp, 549
                  sltu         s1, zero, a0
                  xori         t6, s3, -774
                  fle.s        t3, fs9, fa7
                  xori         a5, a4, -624
                  divu         t2, t5, s5
                  and          t6, t2, t2
                  fsgnjx.s     fa6, fs0, fs5
                  fcvt.s.w     fa3, s7, rup
                  fle.s        s10, fa0, ft9
                  feq.s        a3, ft0, fa3
                  divu         s7, s10, s8
                  divu         sp, s6, s9
                  rem          t4, s0, t6
                  fmax.s       ft8, ft4, fa4
                  feq.s        zero, fs11, fs7
                  srai         s10, a4, 0
                  fsgnjn.s     fa4, fa4, fs8
                  ori          a5, s3, -374
                  xor          a6, sp, s3
                  fsgnjx.s     ft1, fa0, fs9
                  fcvt.s.w     fs11, a0, rtz
                  rem          s7, a5, t0
                  fcvt.s.wu    fs8, t6, rmm
                  xor          ra, s10, s9
                  slti         gp, tp, 232
                  srl          a0, a1, tp
                  lui          a5, 343849
                  feq.s        ra, fs10, ft8
                  xor          s1, s2, a5
                  fmin.s       fa0, fs2, ft8
                  divu         t6, t2, s10
                  addi         a0, t5, -1005
                  mul          t3, t2, s3
                  sltiu        t6, s6, -1679
                  ori          s7, a6, 841
                  sra          s2, tp, s2
                  fclass.s     t1, ft7
                  fsgnjx.s     fs0, fs9, ft8
                  lui          t3, 407263
                  rem          t5, a1, t2
                  fcvt.s.w     fa6, s0, rdn
                  fle.s        s7, fa7, ft9
                  fmin.s       fa5, fa1, fs2
                  lui          s9, 90278
                  auipc        s6, 747544
                  and          s1, s4, s10
                  fmin.s       fs11, ft6, ft3
                  fmul.s       ft8, fs3, fs3, rdn
                  or           s7, sp, s6
                  fmin.s       fs9, ft8, fs4
                  and          s10, s4, a7
                  fclass.s     t3, fs0
                  mulh         s5, s8, s9
                  fmul.s       fs5, ft4, fa2, rdn
                  rem          a0, s5, s7
                  srl          a4, s3, s3
                  sra          s11, a7, a4
                  auipc        s6, 787620
                  sltu         zero, s5, a5
                  fsgnj.s      fa5, fs5, fa5
                  fmv.w.x      ft5, a4
                  srai         a4, s2, 3
                  rem          s7, a6, t1
                  fsub.s       ft1, fa5, fs2, rmm
                  andi         s8, ra, -744
                  fmax.s       fa2, ft6, ft10
                  srl          s9, s1, t0
                  ori          s9, s7, 543
                  remu         s0, a2, s0
                  andi         s9, t3, -232
                  fcvt.w.s     t5, ft2
                  addi         t6, s2, -761
                  remu         s8, s3, t2
                  srai         a3, t3, 28
                  sub          sp, a5, a5
                  fsgnjx.s     fa2, ft0, fs11
                  ori          s9, a4, 1563
                  slt          tp, t3, a0
                  remu         a0, s8, gp
                  auipc        s3, 9404
                  srai         t4, s9, 10
                  xor          s7, s6, s7
                  fdiv.s       fa7, fs3, fs9, rdn
                  sltiu        s5, ra, -1711
                  slli         s3, s5, 25
                  divu         t3, t1, s4
                  fsgnjn.s     ft3, ft1, fs10
                  or           s6, a1, ra
                  div          s2, a5, a1
                  fadd.s       fs0, fa1, fs3, rmm
                  nop
                  fle.s        s3, fs4, fs0
                  flt.s        s5, fa7, ft8
                  fclass.s     a4, fa5
                  flt.s        ra, fa7, ft10
                  slt          t1, a1, a3
                  fcvt.w.s     t4, fs7
                  srai         t5, s8, 6
                  fmax.s       fs6, ft3, fa0
                  divu         s7, s10, a1
                  fcvt.s.wu    fs4, a5
                  fclass.s     sp, fs11
                  fsgnjx.s     ft6, fs8, fa6
                  sltiu        a6, s1, -1696
                  andi         ra, tp, -1155
                  fcvt.w.s     zero, ft2, rtz
                  fsqrt.s      fs2, fs4
                  rem          s1, s8, t1
                  fsgnj.s      ft11, ft11, fs5
                  fdiv.s       fa2, fs5, fs0
                  fclass.s     s1, fs8
                  fcvt.s.wu    fa1, a1, rdn
                  fdiv.s       fa1, ft11, fs6, rup
                  mulh         tp, zero, t2
                  fclass.s     s1, fs1
                  addi         t2, s1, -706
                  fcvt.s.w     fa1, t5
                  xor          a3, s2, a5
                  srl          s7, a2, s1
                  fsub.s       ft6, fs2, fa7, rne
                  slt          t5, t1, s1
                  or           s9, t4, t5
                  slti         s7, s1, -1079
                  andi         a1, t6, 1629
                  div          a5, a5, a0
                  remu         s0, gp, s10
                  fcvt.wu.s    t1, fa2, rdn
                  fsub.s       ft10, fa0, fs7, rne
                  addi         a0, a2, 1418
                  divu         t1, ra, s8
                  ori          a3, s7, -350
                  div          gp, a5, a4
                  fmv.x.w      s11, ft1
                  fmax.s       fs1, ft1, fs9
                  slli         s11, a2, 13
                  sub          s5, a4, s5
                  sra          s10, t0, s3
                  slt          sp, zero, gp
                  fsqrt.s      fa1, ft8, rmm
                  fmin.s       ft11, ft0, ft9
                  srl          a5, s10, s9
                  xori         s3, t1, 978
                  fsqrt.s      ft9, fs11, rup
                  fmul.s       ft8, fs8, fs5
                  sra          gp, t3, ra
                  mulhu        t5, a4, t2
                  auipc        s8, 417642
                  fsgnj.s      fa2, ft11, ft4
                  mulhu        t1, a3, a4
                  fcvt.s.wu    fs3, t3, rdn
                  fmul.s       fs0, ft10, fa6, rup
                  rem          s7, a5, t5
                  fmin.s       ft9, fa2, fa2
                  feq.s        t1, fs11, ft0
                  fcvt.s.w     ft2, s6, rne
                  fmul.s       fs5, ft10, fs6
                  fcvt.wu.s    s8, fs1, rne
                  addi         a6, a6, -935
                  fdiv.s       fs1, fa2, ft7
                  srl          t2, t3, s1
                  fle.s        s2, ft6, ft3
                  fle.s        s2, fs10, ft10
                  srli         a0, a4, 19
                  fcvt.w.s     tp, ft4
                  sra          gp, s3, gp
                  feq.s        a0, ft2, fa7
                  sll          s9, t6, t1
                  fmul.s       fs4, ft1, fs11
                  fsgnjn.s     fs8, fa3, ft6
                  ori          zero, tp, -182
                  sltiu        a3, a4, -611
                  mulhu        tp, s11, s7
                  fcvt.s.wu    fa5, s9
                  mulh         a6, s10, gp
                  fmin.s       ft1, fs11, fs11
                  fmv.w.x      fs3, s10
                  mul          zero, a0, a5
                  mul          s8, t6, zero
                  srai         s10, t4, 29
                  fcvt.s.wu    fa4, a2
                  sltiu        s5, t5, 1675
                  rem          s1, a5, s5
                  auipc        a5, 1031447
                  sltiu        s6, t2, 1895
                  fsgnjx.s     ft4, ft3, fs2
                  slli         t2, a3, 21
                  fmv.x.w      t3, fa1
                  srli         a6, sp, 3
                  fmv.w.x      ft4, t3
                  add          t4, a0, a5
                  fsub.s       fa3, fs4, ft7
                  andi         s1, t3, 1199
                  fclass.s     sp, ft7
                  slli         a7, a0, 13
                  flt.s        a0, fs5, fa5
                  and          a4, t4, a0
                  rem          s1, a5, s3
                  fadd.s       fs0, fa3, fs10
                  mul          gp, s3, s7
                  fsgnj.s      ft10, fs5, fs10
                  nop
                  srli         a1, sp, 20
                  sub          t6, t3, a5
                  fsub.s       ft6, fs2, fa4, rmm
                  sub          s7, s5, s10
                  fcvt.w.s     s1, fa0
                  fcvt.s.w     ft3, s3, rtz
                  fle.s        zero, ft5, fa4
                  divu         t3, gp, zero
                  andi         a6, a6, -522
                  fsgnjn.s     fa7, fa3, fa7
                  fle.s        a6, ft2, fs0
                  divu         a7, t2, t2
                  or           s10, a4, a1
                  sltu         s8, a6, t6
                  fmv.x.w      ra, fa5
                  divu         s10, tp, t6
                  flt.s        t6, ft2, ft6
                  sll          s5, t1, s7
                  add          a5, t1, s10
                  remu         s6, s11, a2
                  nop
                  nop
                  xor          a1, sp, a5
                  feq.s        s5, ft2, fa6
                  fcvt.w.s     ra, ft11
                  sub          t4, s4, a3
                  nop
                  fcvt.s.w     fs8, s4, rtz
                  nop
                  sub          s10, tp, zero
                  fcvt.wu.s    s5, ft7
                  mulh         t4, tp, a3
                  andi         s2, t4, -1739
                  fcvt.wu.s    a4, ft11
                  addi         t5, s11, -1118
                  sll          a7, ra, tp
                  xori         t1, t1, -1273
                  slt          s11, a1, a6
                  and          t6, s7, t6
                  fmv.x.w      a7, fa0
                  and          s9, t2, s4
                  fmv.x.w      t2, ft0
                  div          t3, s7, a0
                  fsub.s       fa6, fa3, fa1
                  andi         t2, a2, -154
                  fdiv.s       ft8, fa4, ft2
                  andi         s10, t4, 1506
                  ori          s11, s5, -514
                  xor          s9, t1, s4
                  fdiv.s       fs8, fs10, ft1, rne
                  and          a5, t1, t4
                  fsgnjn.s     fs0, fs6, ft5
                  fsub.s       fs5, fs4, fs3, rne
                  mulh         gp, s5, sp
                  fmul.s       fa5, fa5, fs6, rdn
                  fsgnjx.s     ft0, fs9, fs4
                  feq.s        zero, ft7, fs6
                  fmul.s       ft1, ft8, ft4, rdn
                  lui          a3, 1045958
                  slt          a5, s5, gp
                  fle.s        t4, fs10, fa5
                  slt          t3, s3, s5
                  slt          t1, a6, s11
                  fcvt.wu.s    s10, fs8, rne
                  srl          a1, s2, sp
                  andi         t5, t6, 1641
                  fsub.s       fa5, fs11, fa1, rne
                  fsgnjx.s     ft8, fs0, fs9
                  fcvt.wu.s    ra, fa6, rup
                  sub          s9, s10, s4
                  remu         s5, s2, tp
                  xori         s3, ra, -747
                  ori          ra, s6, 686
                  sra          s1, t0, t0
                  fclass.s     t4, ft11
                  srl          t4, tp, s6
                  xor          a0, s11, t1
                  fadd.s       fs8, ft6, ft2, rtz
                  sltu         s9, t2, s9
                  fcvt.wu.s    a3, fs6
                  sll          gp, s2, a7
                  auipc        a1, 409959
                  fcvt.w.s     s6, fa7, rup
                  fsgnjx.s     ft1, fs3, ft8
                  fmin.s       ft8, fa7, ft8
                  fcvt.w.s     a0, ft5
                  sll          s8, a4, a7
                  sltu         s7, s10, sp
                  sub          t3, s10, t5
                  mulh         t5, s10, ra
                  divu         a4, a4, a2
                  fsgnj.s      fa3, fa2, fa2
                  and          a0, s7, a3
                  fle.s        sp, ft7, fs4
                  flt.s        s8, fs10, ft11
                  div          zero, s4, a4
                  feq.s        s0, ft3, fs11
                  fsgnj.s      fs11, fa3, fs8
                  slt          t1, s7, s9
                  remu         tp, s1, s3
                  sll          s11, t0, tp
                  remu         a1, s1, s4
                  fmax.s       fs6, fs8, fa1
                  mulhsu       s11, s4, t5
                  auipc        s7, 758830
                  div          a0, s8, a2
                  fcvt.s.wu    ft2, t4
                  fsub.s       fs5, fa7, fa1, rmm
                  feq.s        a1, fs8, fs4
                  and          t6, t3, a2
                  sra          ra, s5, s2
                  lui          tp, 192833
                  mulhsu       a6, tp, ra
                  fmax.s       fs5, fs7, fs10
                  addi         t5, s3, 1463
                  fle.s        sp, fs8, fa2
                  fmul.s       fs2, fs2, fs8, rdn
                  srli         t1, a1, 28
                  sra          tp, s5, s11
                  or           t2, a7, sp
                  sra          s1, zero, s3
                  slti         a3, a6, 1658
                  mulh         a5, gp, s5
                  lui          a4, 820115
                  fcvt.wu.s    s9, fa1
                  fdiv.s       fs2, fa6, fs8, rtz
                  feq.s        t4, ft0, fs8
                  slti         a4, s6, -296
                  andi         t4, tp, 873
                  flt.s        t4, fs0, fa3
                  sltu         a3, zero, s9
                  lui          s11, 416999
                  addi         t3, t1, -959
                  remu         t5, t4, s8
                  and          a4, a3, a6
                  flt.s        a4, fs8, ft3
                  add          s2, a2, s10
                  fcvt.w.s     t1, ft2
                  srl          s6, zero, t1
                  addi         s1, a4, 1242
                  flt.s        a7, fs2, fs10
                  xor          s2, a0, t1
                  sra          s6, a0, s0
                  rem          s0, a7, a0
                  fmin.s       fa4, fa2, fs6
                  sll          s9, s11, a6
                  slli         s6, s7, 31
                  slli         s3, t6, 13
                  divu         s8, a2, t3
                  sll          t5, s11, a6
                  add          a3, s4, s0
                  fmv.w.x      ft0, t0
                  fadd.s       fs3, ft2, fs11
                  srli         t4, a6, 19
                  sub          s8, s8, sp
                  flt.s        ra, fs2, ft7
                  mulhu        zero, a5, a1
                  fsqrt.s      fs2, ft10, rmm
                  andi         a0, a1, -1408
                  fadd.s       ft7, fs11, fa3
                  fclass.s     t3, fa4
                  fsgnj.s      fs10, fa7, fa4
                  slt          s3, s5, s4
                  add          s8, s8, t0
                  srai         zero, s7, 22
                  fmv.w.x      ft0, t6
                  flt.s        a1, fs3, fa4
                  ori          s7, t3, 1198
                  fsub.s       fs7, fa0, ft1, rtz
                  slli         t6, s3, 14
                  sltu         tp, s0, tp
                  feq.s        s6, fs3, fs7
                  fcvt.wu.s    t3, fa5, rne
                  fmin.s       fs4, fa4, fs10
                  slli         s3, a2, 2
                  rem          ra, s3, s3
                  sra          tp, s1, s1
                  fcvt.s.w     fa2, t3
                  ori          t4, s0, 1139
                  nop
                  fcvt.wu.s    a6, ft8, rup
                  fmul.s       ft3, fs4, ft1, rdn
                  srl          t5, s9, ra
                  srl          s9, s9, a2
                  srai         s6, a3, 11
                  divu         s6, t0, s6
                  srli         a0, a3, 0
                  flt.s        zero, ft2, fs3
                  fsqrt.s      ft0, ft8
                  slti         s7, s8, -1935
                  fcvt.s.wu    fa4, t0, rne
                  fmv.w.x      ft7, a6
                  slli         a3, ra, 6
                  andi         s1, t4, 1834
                  sra          s10, t5, t1
                  andi         a3, s6, 531
                  divu         a4, s11, t1
                  or           s7, a1, s10
                  sltu         s7, s7, s1
                  feq.s        s9, fs11, fa6
                  fsub.s       fs1, ft8, fs0
                  sra          s2, s4, s6
                  addi         a3, a6, 1330
                  fmin.s       fa0, ft5, ft5
                  fsub.s       fa3, ft4, fa2, rtz
                  fdiv.s       fs1, ft0, fa0
                  fcvt.s.wu    ft10, s6, rmm
                  andi         s9, s1, 825
                  srli         s9, t2, 23
                  ori          sp, zero, 1098
                  lui          s5, 334272
                  fcvt.w.s     zero, fs9, rtz
                  auipc        s3, 320120
                  fcvt.w.s     s5, ft7
                  fsgnjx.s     fs4, ft2, ft9
                  fmax.s       fa2, ft11, fs7
                  fcvt.s.wu    ft1, s6
                  ori          ra, t5, -1650
                  fmv.x.w      sp, fs4
                  sltiu        s10, a6, -88
                  sltiu        zero, t6, 1570
                  andi         a6, a3, -1327
                  srai         s10, s9, 2
                  fmax.s       fa0, fa5, fs9
                  mulhu        s2, ra, s1
                  fmv.x.w      s5, ft3
                  fmin.s       ft1, ft2, fs0
                  auipc        a4, 815948
                  fmin.s       fs8, fs0, fs6
                  mulhu        s5, a1, s3
                  slli         zero, s7, 9
                  fclass.s     a5, ft1
                  rem          s8, t0, t1
                  fsub.s       fs8, fs11, fs6
                  addi         t6, s2, 2020
                  srli         a3, s2, 23
                  srl          s2, s10, t5
                  mul          sp, s2, s5
                  lui          t5, 4589
                  fmv.w.x      fa2, a2
                  fcvt.s.wu    ft6, s4, rne
                  sub          a4, a0, s0
                  fmax.s       ft1, fa6, fa0
                  lui          s7, 269646
                  add          zero, s7, a1
                  fadd.s       fs5, ft6, fa2, rmm
                  fsgnjn.s     fs3, ft10, fa2
                  xori         sp, s6, 1835
                  slli         s0, t4, 14
                  srl          s6, sp, s10
                  fsqrt.s      ft3, fs7, rup
                  fcvt.s.w     fs6, s2
                  sltiu        s6, t6, -108
                  mulhu        t2, t5, t6
                  fcvt.s.wu    fa0, gp
                  lui          s2, 302283
                  srli         a4, s10, 29
                  ori          s9, t2, -421
                  fclass.s     s7, fs8
                  flt.s        s5, fa5, fa7
                  fcvt.s.w     ft2, a4
                  fsgnjn.s     fa3, fs7, fs7
                  mulhsu       zero, a1, sp
                  fcvt.s.w     ft3, t6, rtz
                  srli         a7, s0, 1
                  sll          zero, t0, gp
                  divu         s2, a1, a1
                  xor          a6, t1, s7
                  sltiu        s7, a1, -278
                  fmin.s       fs11, fa6, fs10
                  fcvt.w.s     s3, fs5, rdn
                  feq.s        s11, ft5, fs11
                  addi         gp, a0, -1551
                  sra          a5, a1, a0
                  sll          s6, s3, s1
                  ori          s8, s2, 1827
                  sll          s0, s6, s3
                  fadd.s       ft8, ft8, ft2, rup
                  flt.s        t6, ft7, fa7
                  fcvt.s.w     ft2, zero
                  addi         s1, tp, -255
                  fdiv.s       fs11, fs7, ft6, rtz
                  add          t3, s1, a4
                  fcvt.wu.s    s1, fs10
                  fmax.s       ft11, fa5, fs3
                  fclass.s     a3, fa3
                  ori          t6, s7, 1614
                  divu         a7, a6, s10
                  feq.s        t3, fs9, fs0
                  and          s7, a7, s9
                  addi         a4, s11, -644
                  fmul.s       ft7, ft11, fs4
                  fsgnjn.s     ft7, fa4, ft6
                  xori         t6, t3, -1409
                  mulhu        t5, a5, s6
                  feq.s        t2, ft2, ft4
                  fadd.s       fs5, ft10, fs3, rtz
                  fadd.s       ft8, fs2, fs8
                  ori          s9, a2, -1570
                  sra          s3, a6, t5
                  flt.s        gp, fa4, ft3
                  auipc        ra, 731211
                  add          tp, zero, s1
                  fcvt.w.s     a1, ft6
                  lui          a6, 691859
                  fmin.s       fa0, fa4, fs3
                  sltiu        a3, s3, 707
                  or           s3, a6, a4
                  fcvt.wu.s    a7, ft0
                  sltiu        s10, s1, 680
                  mulhsu       gp, ra, zero
                  fcvt.s.w     fs10, ra
                  nop
                  slli         a4, t0, 14
                  sub          t4, a7, t2
                  fclass.s     a3, fs1
                  div          s10, sp, sp
                  fmin.s       ft1, fs6, fa0
                  mul          gp, t4, s9
                  lui          gp, 406771
                  flt.s        s1, fa6, fa1
                  sra          t2, t6, a5
                  andi         s8, a6, 1636
                  srai         a6, a3, 22
                  fmul.s       ft5, fs5, fa0
                  srl          ra, t0, sp
                  nop
                  srl          t6, s10, s3
                  srl          s0, a1, s2
                  nop
                  slt          sp, s0, s10
                  fsub.s       fs10, fs9, fs3
                  and          gp, zero, zero
                  sll          t5, s3, t2
                  fcvt.wu.s    s11, ft4, rmm
                  sub          a6, a6, s6
                  xor          a3, sp, t5
                  divu         s10, s3, t5
                  add          sp, sp, s6
                  sra          s10, t0, s3
                  mulhu        s3, s5, a6
                  or           s11, s9, tp
                  sll          sp, sp, sp
                  fcvt.s.w     fs6, t4
                  fsub.s       fs3, ft11, fs8
                  mulhu        s0, gp, s7
                  mulhu        s5, t6, s5
                  fmul.s       fa1, ft11, fs4
                  fmax.s       fs8, ft7, fs1
                  addi         a5, a1, 1035
                  fmv.w.x      fs2, a3
                  sra          a6, s11, s9
                  fmv.w.x      fs2, t5
                  add          s10, s9, s3
                  srli         a1, s3, 2
                  feq.s        s3, ft2, ft7
                  fcvt.wu.s    sp, fa4, rne
                  sra          t1, sp, s11
                  addi         s11, ra, 636
                  mulh         sp, t3, gp
                  div          a0, s10, a4
                  fclass.s     a1, ft5
                  fmv.w.x      fs4, s2
                  fclass.s     s6, fs6
                  fdiv.s       fs9, ft0, ft5
                  fsub.s       fs0, fs10, fs2
                  nop
                  srli         s9, t0, 15
                  fsgnjx.s     fs4, fs3, ft11
                  sltiu        a1, t1, 1332
                  sll          a1, t3, s2
                  srl          ra, a7, s7
                  fmin.s       ft11, fs7, ft11
                  or           s8, t0, t0
                  sltu         a1, s0, a5
                  or           sp, a4, s2
                  srli         s2, s1, 7
                  lui          gp, 485931
                  slli         s3, s10, 12
                  and          sp, s2, a5
                  rem          s2, s0, s9
                  srai         s7, a0, 10
                  sub          t5, sp, t1
                  fsgnj.s      fa6, ft1, fs5
                  slli         s9, s3, 27
                  fsgnjn.s     fs5, fs9, ft6
                  flt.s        s3, fs4, ft6
                  mul          s0, t1, tp
                  fmax.s       fs1, fs0, ft11
                  feq.s        gp, fs2, ft4
                  remu         ra, s5, t0
                  fmin.s       ft5, fs7, fa1
                  fcvt.s.wu    ft4, s9
                  srli         a6, s9, 27
                  andi         a0, zero, 957
                  auipc        a6, 179216
                  auipc        sp, 164283
                  fmv.w.x      fa5, t2
                  rem          sp, tp, a1
                  fsqrt.s      ft9, fs10
                  fmv.w.x      ft4, ra
                  sll          a7, sp, s6
                  xori         gp, s6, -879
                  fcvt.s.wu    fs10, a5, rmm
                  fsqrt.s      fa2, fa6
                  srli         ra, s6, 17
                  fadd.s       fa4, fs6, ft4
                  rem          s2, ra, s3
                  ori          a0, t1, -1107
                  fcvt.w.s     t1, fs0
                  addi         t3, s3, 1379
                  rem          s11, zero, a6
                  fcvt.w.s     a1, ft1
                  fdiv.s       fs9, fs3, ft0
                  auipc        s10, 874279
                  mulh         s6, sp, a4
                  auipc        a7, 878380
                  fcvt.wu.s    ra, fa5, rne
                  fadd.s       ft7, fa5, fa6, rdn
                  rem          s0, s8, a0
                  add          a1, t6, a5
                  fcvt.s.w     ft10, s3, rne
                  mulhsu       s1, s7, s10
                  srai         t6, s6, 27
                  fcvt.wu.s    t3, ft4, rne
                  sub          s7, a5, t0
                  fmv.x.w      s2, ft4
                  lui          s10, 346798
                  sltu         a6, t4, t1
                  srli         t2, a5, 21
                  slli         t6, a2, 28
                  sltu         a1, t0, t4
                  add          s7, s2, t6
                  div          s10, a0, s5
                  addi         zero, a5, -232
                  sltu         s7, a0, s4
                  sltiu        a7, a6, -1251
                  rem          s3, s0, s2
                  fmax.s       fa1, ft5, fa7
                  sub          s11, s4, a1
                  fle.s        s1, fs7, fs7
                  sll          t5, s6, a5
                  srai         a3, s2, 5
                  sltu         a0, s0, s5
                  fsqrt.s      fs9, fs11
                  fmin.s       fs5, ft5, ft1
                  xor          zero, t3, a5
                  mulhu        t5, t6, t3
                  fsqrt.s      fs1, fs9
                  fsgnjn.s     fs6, fs9, ft8
                  slt          tp, s8, t3
                  andi         s11, t1, 24
                  ori          s0, gp, -683
                  srli         ra, s5, 3
                  fmax.s       ft2, fs7, fa6
                  div          s7, s5, a4
                  sub          s7, t0, s11
                  sltu         a1, a1, s11
                  fsgnj.s      fs3, ft5, fs11
                  sll          t3, a5, sp
                  rem          a7, s2, a3
                  fcvt.wu.s    a1, fs6, rdn
                  fmax.s       fa5, fs3, fs1
                  remu         t6, zero, s2
                  feq.s        t5, fs5, ft8
                  fmv.x.w      sp, fa7
                  mul          s7, t4, t4
                  fcvt.wu.s    a5, fs0, rtz
                  rem          t5, s11, a7
                  xori         tp, ra, 1340
                  add          s11, s3, s2
                  fmul.s       fs10, ft2, fs2
                  fmin.s       fa0, fa5, ft11
                  slti         s11, s3, 178
                  fclass.s     t4, fs8
                  fsgnjx.s     fs5, fs4, fs7
                  auipc        s9, 364792
                  mul          a1, s2, t3
                  srli         a4, s5, 15
                  fle.s        s0, fa7, fa3
                  auipc        s3, 227520
                  andi         s7, s5, -1285
                  sltu         sp, gp, t6
                  sub          s11, a7, t3
                  srai         t5, t0, 20
                  ori          t4, t0, -509
                  mulh         s9, t3, sp
                  fsgnjn.s     ft8, ft7, fs10
                  div          a1, s3, t2
                  fadd.s       fs3, ft2, ft5
                  or           s3, s5, s4
                  fcvt.s.w     fa0, gp, rup
                  fdiv.s       fa6, ft7, fs8
                  sra          s11, a5, a0
                  divu         s8, tp, s3
                  sltu         s3, t6, a3
                  fle.s        a6, fa6, fa4
                  remu         s5, a6, tp
                  or           tp, sp, ra
                  fsub.s       fs8, fs8, ft0
                  and          s6, zero, t2
                  nop
                  div          s6, s8, a0
                  slt          t1, s11, s8
                  slti         a7, t2, 327
                  fmv.w.x      ft1, a1
                  xori         t3, a7, 192
                  sltu         t4, a6, a7
                  fsqrt.s      fs9, ft7
                  ori          gp, tp, 145
                  srl          t6, a0, a7
                  srl          t2, t0, a4
                  fcvt.wu.s    a1, fs8, rtz
                  auipc        s3, 963185
                  slti         s7, sp, -285
                  fdiv.s       fa0, fs5, fa4
                  fcvt.w.s     s9, fs4, rup
                  mulh         s6, s2, s3
                  nop
                  slli         s3, a1, 10
                  fmin.s       fa6, ft5, ft8
                  mulh         t6, zero, a7
                  slti         gp, a0, -1747
                  fsqrt.s      fa6, fa3, rmm
                  sltiu        s10, a2, -1304
                  mulh         a1, s4, a2
                  fmax.s       fs7, fa0, fs3
                  mul          s10, s2, a0
                  and          s0, s4, t2
                  fmul.s       fa1, ft11, fs1
                  fmv.w.x      fa1, tp
                  fsgnj.s      fs1, fa0, ft6
                  div          s7, a5, sp
                  sll          gp, t3, s0
                  nop
                  slti         gp, zero, 806
                  auipc        a7, 1014008
                  mulhu        t1, s9, a6
                  slti         t5, s6, 1790
                  sltu         a1, gp, tp
                  mulh         zero, t5, s11
                  fmv.x.w      t5, ft8
                  fsgnjn.s     ft9, ft7, fa4
                  srl          a3, t4, a0
                  sltu         t6, s9, a0
                  nop
                  addi         t6, s4, 107
                  flt.s        ra, fa2, ft11
                  mul          a7, s3, t2
                  rem          s9, gp, a2
                  flt.s        ra, ft4, ft8
                  fcvt.wu.s    a3, fs5, rne
                  sub          t3, t2, a0
                  divu         t4, s4, a5
                  auipc        a5, 611625
                  fcvt.w.s     sp, fa2
                  addi         t1, a2, -419
                  fdiv.s       ft7, fa7, fa6, rdn
                  rem          t2, t6, a3
                  fcvt.w.s     s6, fs3
                  fsgnj.s      fa7, ft1, ft1
                  or           s6, s3, s3
                  fmax.s       fs0, ft10, ft10
                  rem          sp, t4, s10
                  srl          zero, a7, s7
                  fcvt.w.s     a5, fs0, rtz
                  sltu         t3, sp, tp
                  slti         s6, t4, 1098
                  fsub.s       ft2, ft8, fa7
                  fmv.x.w      sp, ft1
                  remu         t4, a4, ra
                  feq.s        ra, ft1, ft0
                  div          s6, a5, a5
                  andi         zero, a6, 1190
                  fcvt.s.w     ft10, t1
                  sll          sp, ra, a2
                  sltu         a7, s5, ra
                  fsqrt.s      fa2, fa7, rtz
                  srli         s1, t2, 19
                  div          t4, s2, s9
                  xori         t3, a5, 434
                  fsub.s       fs3, ft10, fs4
                  fdiv.s       fa5, ft5, fs6, rdn
                  or           t4, gp, a1
                  fdiv.s       fs1, fs7, fa7, rdn
                  slt          s9, t3, t2
                  addi         s0, s11, 539
                  fmv.x.w      s9, fa4
                  sltiu        t4, a1, -1594
                  mulhu        t4, tp, a5
                  or           s11, t4, a3
                  or           s1, s4, tp
                  fmul.s       ft4, fa6, fa4, rdn
                  add          a7, s5, t5
                  divu         s5, s3, s9
                  sltu         s6, a7, s8
                  srai         s0, a0, 29
                  xori         s1, s4, -846
                  ori          t1, s7, -264
                  fmv.w.x      fs7, t3
                  slli         a1, t6, 20
                  sra          t4, s3, a7
                  nop
                  sra          s0, a4, a0
                  mul          s7, a1, a1
                  remu         t2, s2, tp
                  srai         s2, s8, 30
                  rem          a5, a1, a6
                  xor          s7, a5, tp
                  mul          tp, ra, t1
                  slti         s2, s1, 1808
                  fcvt.wu.s    s11, fs5, rne
                  div          s11, a0, sp
                  sub          t6, s0, tp
                  fmax.s       ft11, fa4, ft9
                  fsgnj.s      ft6, fs6, fs0
                  xor          s5, a5, tp
                  mul          s11, s7, a4
                  add          s2, t1, tp
                  or           tp, a0, s6
                  fclass.s     a4, ft3
                  mul          s1, s9, sp
                  srai         gp, t2, 11
                  fmv.x.w      s8, ft2
                  mulhu        s5, gp, tp
                  auipc        gp, 120346
                  feq.s        t5, fa3, fs0
                  fmul.s       ft7, fs9, fs4
                  sra          a1, s3, s4
                  or           s10, s11, sp
                  flt.s        a3, fa4, fa1
                  and          t3, tp, a0
                  srl          gp, a1, s5
                  and          s1, s11, a1
                  sub          tp, a0, tp
                  srli         a5, gp, 14
                  fmv.x.w      a0, fa6
                  slli         t2, t0, 1
                  sltiu        t3, t3, 2020
                  fcvt.s.wu    ft7, a2, rdn
                  sll          t1, t1, s5
                  or           s6, t5, a0
                  fmv.x.w      s11, ft2
                  srl          t4, t2, a7
                  ori          s3, a6, -1408
                  slti         s0, s7, 548
                  sltu         s1, a6, s10
                  slt          s1, sp, a2
                  sltiu        a4, s6, -1764
                  fsqrt.s      fa6, ft11, rne
                  sltiu        s11, s5, -1053
                  fle.s        s6, fs6, fs1
                  fmax.s       fs8, fs3, fa6
                  fcvt.w.s     a7, fa2
                  fsgnjx.s     ft11, fs10, ft6
                  rem          sp, s8, t6
                  fsqrt.s      fa7, fa1
                  srli         t4, t2, 30
                  mulhsu       a5, t5, a3
                  andi         t5, s11, -1951
                  andi         s3, t5, -1953
                  mul          s6, a4, a1
                  slli         s1, tp, 6
                  fmv.x.w      a1, fa1
                  and          s11, s0, t4
                  feq.s        t6, ft9, ft6
                  sra          a5, a1, s10
                  or           s9, s10, s9
                  mulhu        gp, t5, a1
                  fle.s        gp, ft1, ft0
                  fmv.x.w      s11, fa6
                  ori          s0, s5, -1998
                  and          s9, t5, a4
                  mulhu        s10, s4, s5
                  fmv.x.w      t3, ft9
                  flt.s        s1, fs10, ft9
                  div          a4, a6, a7
                  fsgnjx.s     ft3, ft7, fa1
                  sra          t4, s11, t6
                  sltu         s1, s9, s9
                  fsub.s       ft6, fa1, fa6
                  sra          t2, t3, t6
                  add          s0, s0, tp
                  sra          a6, s9, a7
                  fsqrt.s      fs6, ft11, rup
                  fsgnjn.s     fs0, fa2, fs2
                  fcvt.w.s     zero, fs4
                  fsgnj.s      ft0, ft1, ft8
                  sll          tp, a4, a6
                  or           t2, a6, a4
                  lui          s7, 109001
                  slt          a6, s3, t1
                  nop
                  fsgnjn.s     ft6, ft5, fa3
                  andi         t1, s7, 161
                  sub          s10, a5, ra
                  fmv.x.w      a0, fs6
                  fmul.s       fa5, ft0, ft4, rtz
                  or           s8, t4, a5
                  add          sp, ra, a0
                  fcvt.s.wu    ft6, t1, rmm
                  divu         tp, gp, a3
                  slli         a7, a1, 8
                  fmv.x.w      a5, fs5
                  lui          a4, 974901
                  mulhsu       sp, s5, s5
                  fcvt.s.w     ft1, a3
                  xori         s8, a0, 948
                  fmax.s       fs5, fs10, fs0
                  remu         t2, t4, s9
                  sltu         s1, sp, s3
                  sub          s2, s3, s6
                  sltiu        t2, s7, 2005
                  flt.s        tp, ft4, ft11
                  fsgnjn.s     ft2, ft1, fs11
                  feq.s        s5, fa0, ft3
                  sll          a5, zero, a0
                  fmin.s       fs9, fs8, ft11
                  auipc        sp, 2924
                  srl          s11, s4, s10
                  sltiu        t3, ra, 323
                  sll          s3, s0, a7
                  slti         s1, a2, -813
                  ori          zero, a3, 879
                  fadd.s       fa2, fs10, ft1, rmm
                  feq.s        s2, ft8, fa3
                  remu         a3, a2, s10
                  xori         s10, a1, -1733
                  ori          a5, t4, 1279
                  div          a7, t5, t0
                  srl          zero, t6, tp
                  fsgnjx.s     fa3, fs1, fs7
                  mulh         s9, t5, a3
                  or           t5, a7, s10
                  or           s10, a6, zero
                  srai         a3, gp, 3
                  and          a6, s8, a0
                  srl          s11, zero, s4
                  fmv.w.x      ft10, t1
                  sll          s7, t2, t1
                  add          tp, t2, a4
                  fsgnjx.s     fa7, fa5, ft6
                  srai         s10, t2, 23
                  auipc        t4, 561552
                  sltiu        zero, tp, 1990
                  fmin.s       ft0, fs8, ft8
                  divu         t2, t4, s11
                  fmv.w.x      ft1, t6
                  fadd.s       fa4, ft11, fa0, rmm
                  srli         a6, gp, 22
                  feq.s        s11, fs9, fa3
                  auipc        t4, 767651
                  flt.s        a0, fa6, ft9
                  srai         t3, s1, 16
                  srai         s1, s5, 3
                  fsub.s       fs6, ft5, fs11, rne
                  sltiu        s11, zero, -886
                  srli         t5, sp, 28
                  remu         s6, s0, tp
                  addi         t3, t0, 1604
                  fadd.s       fa4, fa6, ft10, rtz
                  mul          ra, ra, s8
                  xor          t5, t3, s11
                  xori         a7, s1, -347
                  flt.s        t1, fa7, fs8
                  mulhsu       s1, s9, tp
                  nop
                  fcvt.wu.s    s8, fa5
                  fsgnjx.s     fs7, fs6, ft7
                  fdiv.s       ft1, fs10, fs8
                  slt          s9, s0, t6
                  divu         a0, s7, s4
                  fcvt.s.w     fs6, s1
                  nop
                  xori         s5, tp, -1820
                  sll          sp, zero, zero
                  fle.s        s7, fa6, fa1
                  srai         s8, a7, 31
                  slli         s10, a5, 22
                  fmax.s       fa3, ft11, fa7
                  fcvt.w.s     a6, fa5
                  fmv.w.x      fs10, s4
                  nop
                  slt          a7, sp, s10
                  srl          t2, gp, s1
                  xori         a7, s3, -955
                  fmin.s       fa4, fs1, fs10
                  srli         tp, sp, 11
                  srli         s1, a1, 22
                  sltiu        zero, s10, 404
                  addi         a3, s3, 1007
                  remu         t5, t2, t5
                  add          a4, s1, s6
                  fcvt.s.w     fa6, a6, rtz
                  add          t2, s1, t0
                  fsgnjx.s     fa4, ft8, fa2
                  sll          a4, a7, gp
                  fcvt.wu.s    t2, ft2, rtz
                  divu         ra, a0, t1
                  fmv.w.x      fa4, s6
                  fdiv.s       ft9, ft9, ft2
                  ori          t4, sp, -1434
                  and          zero, t0, s7
                  fmul.s       fs6, fs4, ft11, rtz
                  fsgnjn.s     fs8, fs11, fa0
                  fcvt.s.w     ft0, a1
                  andi         s6, s11, 875
                  fmax.s       ft7, ft4, fs3
                  flt.s        s7, ft0, ft1
                  lui          a0, 287658
                  fsgnjx.s     ft7, fs11, ft2
                  fmv.x.w      t2, ft11
                  fmv.x.w      a7, fa4
                  nop
                  fsgnj.s      fs5, fa2, fs3
                  fadd.s       fa4, fs4, fs3, rmm
                  fmul.s       ft3, ft4, fa3
                  fcvt.s.wu    ft4, s2, rup
                  and          s10, gp, a3
                  sra          tp, a5, t3
                  fdiv.s       fs10, fs9, fa5
                  fcvt.s.wu    fa5, a7, rmm
                  xor          s9, s10, t4
                  or           s7, s5, a0
                  fle.s        s3, ft0, fs9
                  auipc        s0, 380005
                  remu         s0, gp, zero
                  fcvt.s.w     fs6, s3
                  sub          t4, sp, s5
                  slt          ra, s9, t1
                  mul          t2, a5, s8
                  xori         sp, s6, 907
                  fcvt.wu.s    ra, fs4, rup
                  fsgnj.s      fs0, fs1, fa3
                  fsgnjn.s     fa4, ft3, fa5
                  fsgnj.s      fs9, fs9, ft4
                  fle.s        s0, fa1, ft3
                  sltiu        s7, s2, -772
                  srai         a5, s9, 20
                  mulhu        sp, s6, a2
                  add          s9, s11, ra
                  addi         t2, sp, 66
                  flt.s        s3, ft10, fa2
                  nop
                  xori         gp, a3, -784
                  remu         a3, t1, s2
                  fsub.s       fs9, ft8, ft4, rne
                  slt          tp, ra, t3
                  fle.s        tp, fs6, fs10
                  fsgnjn.s     ft8, fa5, fa5
                  srai         gp, s10, 21
                  fsqrt.s      fa1, fs5
                  sltiu        gp, s11, 1933
                  fcvt.w.s     t6, ft9, rtz
                  mulhsu       a0, s2, ra
                  divu         s6, zero, a5
                  sub          ra, a3, tp
                  slt          t5, a1, sp
                  add          a7, s7, a5
                  sltu         zero, s3, s3
                  addi         t1, sp, -1227
                  fsqrt.s      fs0, fa4
                  rem          a6, s3, t1
                  fsqrt.s      fs5, fs5
                  fsgnj.s      ft5, fa0, fa1
                  mulhu        zero, t1, s1
                  flt.s        a6, fs1, fs11
                  and          s0, t6, zero
                  xor          s0, a0, s0
                  fcvt.w.s     s6, fa2, rdn
                  sll          a0, s8, t1
                  mulh         s7, s4, s10
                  rem          t2, tp, t2
                  add          s7, s10, zero
                  srli         a7, zero, 11
                  sltu         zero, gp, s5
                  rem          a6, a7, gp
                  mulh         t6, t5, s0
                  xori         zero, a6, -1672
                  srl          s10, s7, t2
                  fcvt.s.wu    fs11, s6, rup
                  fsgnj.s      ft4, fs8, fa1
                  fsgnjn.s     ft8, fs10, fa4
                  fle.s        ra, ft11, ft3
                  slti         s2, a2, -792
                  andi         a7, t2, -1454
                  slti         s9, ra, 622
                  mulhsu       s9, a4, a6
                  sub          a6, s7, s11
                  fmv.x.w      s9, fa2
                  fmul.s       ft8, fs0, ft0
                  slt          a4, t4, s6
                  addi         t1, zero, -1850
                  feq.s        t4, fs11, fa2
                  srli         ra, gp, 29
                  xor          s3, a5, a4
                  ori          a5, sp, 308
                  flt.s        ra, fs11, ft10
                  fmul.s       fa3, fs11, fs1
                  sltu         t3, a2, t0
                  mulhu        ra, a1, a0
                  fmax.s       fa6, fa1, fa1
                  sltiu        t2, a3, -662
                  fsgnj.s      fs0, ft1, ft8
                  feq.s        tp, ft2, ft3
                  sltu         s8, a2, s9
                  fcvt.s.w     ft6, s6, rtz
                  fclass.s     s1, ft4
                  add          s7, a3, t6
                  mul          s7, s3, s0
                  fsgnj.s      fs7, ft7, ft6
                  fmv.x.w      s6, fs1
                  sll          s5, s11, s0
                  fadd.s       fs11, ft9, ft10
                  fsub.s       fs1, fs2, fa2, rdn
                  fsgnjn.s     ft8, fa3, ft7
                  feq.s        s8, ft8, fa6
                  mulh         s6, s0, a0
                  xor          a3, t0, t5
                  fmul.s       fs2, fs5, fa3, rdn
                  fcvt.w.s     a6, ft8, rmm
                  fdiv.s       fs0, fs11, fs3
                  andi         a3, t2, -1902
                  fcvt.s.w     ft10, s5
                  mulhu        a6, a0, t3
                  sub          sp, a6, s2
                  flt.s        s1, fa1, ft2
                  fcvt.s.wu    ft9, a5, rtz
                  flt.s        a5, ft2, fs9
                  fmax.s       fs8, ft1, fs9
                  sll          s5, a3, s8
                  fmv.w.x      fa0, s8
                  fclass.s     s7, ft1
                  fle.s        ra, fs1, fa1
                  fcvt.w.s     a7, fs4
                  or           s11, s11, a1
                  addi         s1, s8, 1135
                  fsqrt.s      ft7, fs8
                  sll          sp, s1, tp
                  fle.s        t3, ft8, fs7
                  addi         t1, s0, -2043
                  flt.s        zero, fs9, fa7
                  div          s7, s1, ra
                  sub          t4, t5, a5
                  remu         s1, a1, s10
                  fsgnjx.s     ft10, ft3, fs4
                  sltu         s9, a2, a4
                  sra          a6, tp, s9
                  flt.s        s9, ft0, ft7
                  fmin.s       fs9, fs5, ft2
                  lui          tp, 275026
                  fcvt.s.w     fs5, a1, rmm
                  add          tp, zero, a5
                  fcvt.wu.s    s10, ft11
                  fmul.s       fa5, ft6, ft11
                  sltu         a4, t3, t3
                  fsgnj.s      fs5, fa6, ft1
                  rem          gp, t3, t3
                  mulhsu       a0, tp, s1
                  remu         t6, t1, t0
                  div          s6, t6, s1
                  fcvt.s.w     fa1, a2, rup
                  srl          t3, s6, s0
                  fsgnjx.s     fs4, ft10, ft1
                  sltu         a1, s3, t5
                  and          s0, t5, s2
                  fcvt.wu.s    s1, fs6, rdn
                  fcvt.s.wu    fa6, a3, rup
                  sra          tp, t4, s0
                  fcvt.w.s     s3, fs9
                  slti         s8, t6, 82
                  fclass.s     s0, ft11
                  fadd.s       fs0, fs1, fs8
                  rem          a5, s2, zero
                  divu         s6, ra, s5
                  fmv.x.w      s2, ft10
                  fdiv.s       ft8, fa6, fs7, rne
                  fcvt.s.w     ft4, a1, rtz
                  add          ra, s10, t4
                  fclass.s     sp, fs5
                  fmv.w.x      ft7, s5
                  mulhsu       t1, s1, t6
                  srl          t5, s9, t4
                  fmax.s       fs2, fa7, ft5
                  add          sp, t0, t1
                  sltu         t3, t2, a0
                  fsgnj.s      fs11, fa1, fs5
                  mulh         tp, a1, tp
                  mulhsu       zero, a6, s5
                  mulh         s7, t4, s9
                  div          t6, s5, a0
                  feq.s        t5, ft5, fa1
                  slt          s9, s0, a7
                  mulhu        t3, s9, t2
                  slli         tp, a2, 7
                  rem          s3, s4, sp
                  lui          a5, 42665
                  fsgnjn.s     ft4, fa4, ft2
                  mulhsu       s3, a6, a7
                  sub          s10, s4, t3
                  add          s1, a7, s2
                  fcvt.wu.s    s10, fs6
                  fcvt.s.wu    fa1, t2
                  mul          s10, s4, s0
                  fsgnj.s      fa5, ft9, fa1
                  divu         gp, s10, tp
                  ori          t2, t5, 1276
                  fsgnj.s      fs11, fa6, fa7
                  mul          s6, s7, s4
                  nop
                  fmv.w.x      fs2, a5
                  slli         s5, ra, 28
                  slti         a6, a0, -205
                  xori         a0, tp, -1928
                  add          s6, s0, s10
                  fcvt.wu.s    t4, fs9, rdn
                  remu         s6, t5, s0
                  mulh         a5, a1, s5
                  ori          a7, sp, 8
                  fle.s        gp, fa7, fs7
                  rem          a3, gp, a5
                  srl          s3, s7, s5
                  mulh         t2, a6, a6
                  fsqrt.s      ft11, fs3
                  addi         t6, s4, 1272
                  add          s11, s5, a7
                  xori         a1, s3, 227
                  srai         sp, a5, 28
                  mulh         a7, s9, a4
                  srl          s1, s2, gp
                  fclass.s     t6, fa1
                  fmv.x.w      a0, fa7
                  xori         a6, a3, -148
                  remu         s10, s4, t2
                  fsgnjn.s     fs8, fs11, fs2
                  slli         t1, s5, 5
                  slt          sp, sp, s0
                  fsgnj.s      fs1, fs11, fs11
                  addi         gp, s2, -1693
                  feq.s        a7, fa2, fa4
                  auipc        a3, 833252
                  slti         s3, t0, 497
                  fcvt.w.s     s3, fa6, rtz
                  sll          s7, s8, t4
                  fcvt.wu.s    s6, ft10, rdn
                  mul          s9, s2, s6
                  sll          ra, s4, s4
                  sltu         zero, tp, a2
                  mulhsu       s9, a7, s7
                  divu         s8, ra, t4
                  fclass.s     s3, ft7
                  nop
                  sltiu        s10, s11, -270
                  sub          t1, a0, s6
                  mulhsu       t4, a3, s9
                  fsub.s       fa4, ft2, fa3, rdn
                  fsub.s       ft0, fs6, fs6, rdn
                  auipc        gp, 37338
                  feq.s        ra, ft3, ft0
                  srai         zero, a5, 21
                  sltu         gp, s6, s3
                  nop
                  addi         s3, s10, -348
                  sra          t1, s5, s7
                  fmv.x.w      sp, fa3
                  xori         s9, t0, 1026
                  fsub.s       fs10, fa4, fa7
                  lui          s9, 366566
                  lui          a6, 385624
                  fclass.s     t4, ft10
                  and          t5, s4, s7
                  fle.s        t1, fs6, fs8
                  xor          s0, s6, tp
                  div          t3, sp, s9
                  addi         s7, t1, 1700
                  auipc        zero, 28746
                  slli         ra, a7, 31
                  auipc        gp, 904076
                  slt          t1, s8, s9
                  fle.s        t3, fa5, fs6
                  or           s11, ra, a6
                  fsub.s       fa5, fs7, fa3
                  rem          ra, t3, gp
                  fcvt.s.w     fa6, gp
                  sltu         s10, a3, s2
                  fmax.s       fs4, ft8, fs6
                  addi         s8, t4, -630
                  slt          s7, sp, zero
                  fdiv.s       fa1, fa3, fs10
                  or           a1, a6, t6
                  slt          s10, a3, a3
                  or           t3, a6, t0
                  sltiu        s8, t4, -1947
                  srai         ra, s1, 2
                  nop
                  addi         a6, a3, 525
                  fdiv.s       fs7, ft11, fs2
                  xor          s1, a7, t0
                  andi         tp, a0, -1428
                  nop
                  mulhu        s2, s1, t2
                  fadd.s       ft3, ft7, ft8
                  addi         s10, s8, -64
                  fdiv.s       fs5, ft1, fa5
                  fcvt.s.wu    ft4, t5, rtz
                  srl          t6, gp, t4
                  sltu         a5, s6, a1
                  fsgnj.s      fa1, fs9, fs9
                  sra          sp, s1, s9
                  sll          a6, s8, s10
                  fcvt.s.w     fs10, a2, rup
                  fcvt.w.s     sp, ft8, rup
                  srli         sp, t4, 15
                  lui          t2, 249243
                  ori          s10, gp, 1361
                  fsgnj.s      fa6, fa2, fs10
                  or           t4, s7, a0
                  fle.s        a0, fs2, ft7
                  fmv.w.x      ft10, s5
                  srl          a1, s9, s10
                  lui          t3, 96309
                  fmin.s       ft11, fs10, fs9
                  fcvt.s.w     fa2, t6, rne
                  sll          a0, t3, t6
                  fsgnjn.s     ft8, fa3, fa3
                  mulhsu       a7, t3, t0
                  fdiv.s       ft1, ft8, fa4, rmm
                  mulh         t1, a3, s0
                  flt.s        t2, ft4, fa6
                  sub          gp, t4, s8
                  divu         sp, t3, t4
                  divu         s3, tp, tp
                  or           zero, tp, s8
                  nop
                  mul          s10, a2, t5
                  srl          s11, gp, t2
                  div          s11, a2, a3
                  slt          ra, t5, a0
                  xori         a0, sp, -1977
                  add          s8, gp, t4
                  srai         s0, t3, 2
                  xor          sp, s9, s9
                  rem          a1, gp, a4
                  fmax.s       fs2, ft0, fs6
                  or           t5, ra, a1
                  fcvt.wu.s    s3, ft4, rne
                  andi         gp, s5, -616
                  mul          s5, a4, t0
                  srl          t6, s4, s0
                  fmax.s       fa5, ft11, ft9
                  mulhu        a6, s3, a4
                  mulhu        s1, a2, t1
                  and          s5, s8, a7
                  ori          t6, zero, -1626
                  fsub.s       fa0, ft4, fs9
                  fsgnj.s      fs2, fa2, fa6
                  fcvt.w.s     t2, fa6, rup
                  nop
                  mulhu        a5, tp, t2
                  divu         gp, sp, a2
                  fsqrt.s      fa0, fa0
                  fsgnjx.s     fa0, ft0, ft6
                  sub          zero, a6, t2
                  srl          s10, a5, a1
                  fsgnj.s      fs1, ft3, ft11
                  mulhu        tp, ra, a0
                  fmv.x.w      s6, ft5
                  fmax.s       ft5, fs7, ft4
                  fcvt.w.s     t2, ft1
                  or           s7, t3, zero
                  fsqrt.s      ft7, ft3
                  fcvt.s.wu    fa5, s9
                  sub          gp, a5, s5
                  xori         s1, ra, 526
                  fmax.s       fs11, ft0, fs8
                  fcvt.wu.s    s1, fs5
                  srli         t6, a1, 30
                  fadd.s       ft11, fs6, fs10, rdn
                  fmin.s       ft1, ft9, fs9
                  andi         s6, a4, 1989
                  rem          s11, t5, t1
                  feq.s        s9, ft3, fs11
                  andi         s0, a3, 1611
                  fcvt.s.wu    fs3, a1
                  mulh         s7, a3, sp
                  fmin.s       fa2, fs11, fs3
                  remu         s6, a3, sp
                  and          a4, t6, s3
                  xori         s9, s0, 1055
                  fmin.s       fs11, ft3, fs3
                  sltiu        t2, a4, 224
                  xor          ra, t2, gp
                  fsgnj.s      fa0, fs6, ft5
                  ori          sp, ra, -791
                  srai         a1, s5, 9
                  add          s11, s3, s3
                  divu         tp, ra, t6
                  andi         t4, t2, -1904
                  sub          a7, a6, a0
                  slti         t3, t3, 1065
                  fsgnj.s      fs5, ft10, ft8
                  fmin.s       ft9, ft3, fs3
                  xor          s0, a1, ra
                  lui          s6, 688287
                  xor          t2, s2, tp
                  and          s2, s4, ra
                  div          a3, zero, t1
                  fmax.s       ft3, ft3, fs5
                  fmin.s       ft7, fa6, ft5
                  flt.s        a5, fa1, ft6
                  add          t5, s8, zero
                  sll          a6, a3, zero
                  add          s6, a1, sp
                  srl          s0, t3, s0
                  sltu         a1, t4, a2
                  nop
                  sltiu        t4, t5, -929
                  rem          s0, t1, t1
                  sra          s5, s3, t3
                  slt          t1, t4, t4
                  mulhu        s1, a7, a5
                  srl          a7, s1, a5
                  fmin.s       fs3, fa6, ft7
                  fdiv.s       ft7, fa0, fs1
                  srl          t3, t0, s1
                  mulhsu       s5, gp, t2
                  fadd.s       ft9, ft11, fa4
                  fsgnjn.s     fa7, ft10, fa2
                  addi         s2, s2, 1257
                  fcvt.s.w     ft7, ra
                  divu         s7, tp, s3
                  fcvt.wu.s    t5, fa3, rup
                  fmul.s       fa0, fa4, fa0
                  sltiu        s8, s1, 1095
                  rem          s6, s9, s8
                  lui          s7, 1000077
                  fmax.s       fa5, fs11, fs9
                  fsqrt.s      fs3, ft2, rmm
                  mul          s0, s2, a4
                  feq.s        s0, ft10, fs0
                  or           sp, tp, s0
                  ori          a4, t2, -1908
                  fcvt.wu.s    a1, fs3, rne
                  flt.s        a7, fs2, fs2
                  mulh         sp, gp, t1
                  fcvt.w.s     a4, ft7, rdn
                  fsqrt.s      fs11, fa0, rup
                  auipc        a0, 435644
                  sltiu        s1, s6, -546
                  addi         t2, a4, 1371
                  fsgnjx.s     fa3, fa2, ft11
                  or           s7, s5, s11
                  slti         s6, gp, 397
                  feq.s        s9, fs3, fa7
                  flt.s        tp, ft3, fs3
                  andi         t6, a7, 1466
                  or           s5, s5, a2
                  sub          t3, a3, s1
                  fmin.s       fa3, fs4, fs3
                  divu         s6, t0, zero
                  mulh         s1, s0, a3
                  mulhu        s6, a5, s11
                  fclass.s     s2, fs3
                  fdiv.s       ft5, fa1, fs10, rtz
                  fmv.x.w      a3, ft8
                  addi         a5, t0, 432
                  divu         a3, a2, a3
                  fcvt.w.s     tp, fs6
                  add          t4, t6, a7
                  mulh         a4, t3, t6
                  and          a1, s8, s2
                  sub          s0, s10, s1
                  fsqrt.s      fa5, fs4
                  feq.s        a4, fa6, ft10
                  divu         a7, t6, t0
                  sltiu        a3, a4, 1688
                  srai         zero, a6, 2
                  nop
                  mulhu        a3, a7, s1
                  div          t5, a5, s0
                  fmax.s       ft1, fs5, fs1
                  fmax.s       fs8, fa2, fs3
                  add          a4, s1, sp
                  slt          gp, a0, a7
                  mulhu        ra, s8, a6
                  add          a5, t4, gp
                  fcvt.s.w     ft7, t0, rmm
                  slli         a6, a3, 3
                  mulh         ra, t0, a0
                  or           s9, t6, s6
                  nop
                  fcvt.wu.s    a0, fs6, rne
                  fadd.s       ft0, fa7, fa2
                  andi         a5, t6, -525
                  fmv.w.x      fa3, t5
                  fdiv.s       ft2, ft4, fs7, rmm
                  fcvt.s.w     ft11, t1, rmm
                  fsgnjx.s     ft11, fs10, ft2
                  slti         s6, s8, -460
                  feq.s        s7, ft0, fa2
                  fcvt.s.w     ft3, t4, rmm
                  ori          s7, t2, 817
                  fcvt.s.w     ft3, s2
                  lui          gp, 73412
                  fmv.w.x      fa0, s1
                  fclass.s     ra, ft10
                  add          t3, s11, a4
                  mulhsu       s5, tp, a1
                  add          t2, t1, ra
                  xor          a7, t6, s7
                  addi         t6, s6, -1730
                  srl          a4, t3, t4
                  rem          s7, a2, t2
                  fsqrt.s      ft4, fs4
                  fsub.s       ft8, fs4, fs10, rup
                  fsqrt.s      ft9, ft9
                  or           s11, a4, ra
                  fsgnjn.s     ft4, fs0, ft6
                  mulhu        t2, t3, t4
                  fle.s        a7, fs1, ft6
                  add          a1, t6, t4
                  fclass.s     a6, fs6
                  fsgnjx.s     ft0, fs7, fa2
                  nop
                  add          s2, a6, ra
                  auipc        gp, 303284
                  fsgnjx.s     ft11, fs9, fa3
                  mulh         s2, sp, s5
                  nop
                  fdiv.s       fa1, ft3, ft5, rup
                  mulhsu       s6, a6, t0
                  sltiu        s10, a0, 1209
                  ori          gp, t0, 324
                  fcvt.w.s     t3, fs7
                  mul          s11, s10, ra
                  sll          t1, a3, s6
                  fmul.s       fs10, fa6, fs3, rne
                  fcvt.s.w     fs0, zero, rmm
                  fcvt.s.w     fs2, ra, rne
                  fdiv.s       ft1, ft6, ft9, rne
                  fcvt.wu.s    s10, ft8
                  lui          s3, 137518
                  fsub.s       ft11, ft4, fa1, rmm
                  auipc        s9, 965900
                  fsgnj.s      ft3, ft7, ft6
                  fcvt.s.w     fs1, s6
                  mulhsu       ra, s11, a2
                  mulhu        s11, s10, s6
                  lui          zero, 451970
                  div          s2, s6, t6
                  fmul.s       ft8, fa4, ft1, rdn
                  fcvt.s.wu    fs6, t5
                  slt          s10, s5, sp
                  fmv.x.w      a5, ft9
                  fsgnjn.s     ft7, fa7, fs4
                  slli         a7, a3, 23
                  add          ra, a5, a1
                  rem          a5, a3, t6
                  mulh         t2, s0, sp
                  fmax.s       fs6, ft9, fs2
                  add          a4, s3, t1
                  fadd.s       fa4, fs4, fa0, rne
                  mulhu        a7, gp, a4
                  sub          s0, a1, gp
                  fle.s        s10, fa0, ft9
                  fcvt.wu.s    s9, fa3
                  srli         s2, a6, 1
                  and          tp, t4, s10
                  ori          t2, t5, 1843
                  fmul.s       ft1, fs1, fa3
                  fclass.s     a4, fs4
                  fcvt.w.s     s7, fs8
                  mul          s5, s6, s1
                  add          s7, t0, a3
                  divu         sp, a2, tp
                  and          a3, t6, sp
                  mulh         t6, gp, t0
                  add          t6, t5, gp
                  auipc        s6, 147935
                  fmin.s       fs2, fa1, fs9
                  or           sp, tp, s7
                  fsgnjn.s     fa0, ft1, fs11
                  sub          s1, sp, a2
                  fclass.s     gp, fs6
                  srl          t1, a4, s8
                  addi         s11, s2, -1102
                  or           sp, s9, s11
                  srai         gp, s1, 24
                  lui          t2, 494445
                  fmul.s       ft0, fs1, fs10
                  mul          s10, gp, a6
                  fcvt.w.s     t5, fs0
                  xor          s9, t1, s5
                  slti         a1, s4, 492
                  fmin.s       fs9, fs9, fs2
                  mulhsu       tp, s8, sp
                  fsgnjn.s     ft5, fs7, ft5
                  srl          a5, a6, ra
                  slt          s0, s11, a3
                  rem          s9, t2, s4
                  sltu         s11, t2, a5
                  xor          t3, s0, a4
                  feq.s        t6, fa6, ft10
                  slti         sp, a0, 802
                  sltu         tp, s0, s11
                  fmul.s       fs6, ft4, ft3, rmm
                  sltu         ra, a4, t6
                  slt          ra, a3, sp
                  slti         t5, s9, -1168
                  sra          s11, sp, ra
                  fsqrt.s      fa5, ft3
                  divu         sp, t1, s0
                  xor          s7, t0, s0
                  fsgnjn.s     fs4, fs5, fs2
                  mul          a4, a6, s5
                  feq.s        t1, fs6, fa1
                  sub          a4, s9, t6
                  xori         a1, t4, 584
                  fsub.s       fs5, fs8, ft6
                  fsgnj.s      ft10, ft3, ft4
                  mulhsu       tp, tp, s3
                  fsgnjx.s     ft4, ft5, fa7
                  sll          s8, s2, s2
                  fsgnjx.s     fa4, ft0, ft6
                  srli         a4, a7, 19
                  slt          s3, s9, s1
                  auipc        s6, 730634
                  sltiu        sp, a1, 1317
                  sra          tp, ra, s0
                  sub          s8, s3, s9
                  nop
                  fdiv.s       ft7, fa1, fs5
                  fsub.s       fs4, fs5, ft11
                  andi         s10, ra, -910
                  mulhu        a0, s2, a3
                  xori         t2, s10, -114
                  feq.s        s0, fs10, fa5
                  fsgnjn.s     fs6, ft6, ft9
                  auipc        a1, 677820
                  srl          t4, s11, sp
                  addi         tp, s10, 1903
                  feq.s        t3, fs1, fa6
                  fsub.s       fs8, ft8, ft9, rup
                  fmul.s       fa0, fs8, fs6
                  sra          t5, a0, a3
                  slt          tp, s3, s6
                  rem          gp, gp, a1
                  fsgnjn.s     fs8, fs4, fs7
                  fsgnj.s      fa2, ft4, ft10
                  xor          t1, t3, a0
                  fsub.s       fa5, ft11, fs5
                  slti         s11, s5, 991
                  mulhu        s8, t4, t4
                  divu         t4, s5, t1
                  sltu         tp, t4, a4
                  slt          gp, s4, tp
                  mulhsu       t2, s7, a1
                  xor          t4, a5, a2
                  fle.s        a0, ft8, fs6
                  slli         t4, s10, 27
                  fadd.s       ft9, fa7, fa5
                  ori          s0, a5, -983
                  divu         ra, a4, ra
                  fcvt.wu.s    a4, fs8, rup
                  sll          t4, a0, a3
                  addi         sp, a6, -363
                  xor          ra, s7, t1
                  fmv.x.w      s11, fs7
                  fdiv.s       fs7, fs9, fa7
                  srli         s8, a0, 26
                  add          a0, a7, s4
                  sra          a0, gp, t5
                  flt.s        a5, fs9, fs11
                  rem          sp, a1, ra
                  xor          s1, s5, a3
                  remu         zero, a5, s3
                  fclass.s     a1, ft8
                  slti         s3, t1, -1298
                  sltu         t5, a7, s8
                  fdiv.s       fs0, fa5, fs3, rne
                  fsqrt.s      fs11, ft1, rmm
                  fmul.s       fs9, ft10, fs1
                  fcvt.wu.s    t3, ft2
                  fsgnjn.s     fa0, fa6, fa4
                  fclass.s     t5, fa2
                  fmin.s       ft2, fa2, ft7
                  fsqrt.s      fs2, ft2, rmm
                  fmin.s       ft8, ft2, fa5
                  feq.s        a3, fs9, ft1
                  fcvt.wu.s    gp, fs1, rne
                  remu         t4, t4, s7
                  addi         a4, s5, 744
                  fsgnjx.s     fa3, ft0, fa1
                  sra          ra, a6, s4
                  slt          t5, s10, tp
                  fcvt.wu.s    t4, ft11
                  div          s2, t5, ra
                  mulhu        t3, a2, a6
                  nop
                  nop
                  div          gp, tp, a7
                  sra          gp, zero, gp
                  fmv.w.x      ft9, s9
                  fsub.s       ft5, ft9, fs5, rdn
                  srl          s8, s2, t6
                  feq.s        a4, fs3, fa3
                  mulh         s6, s6, t1
                  sltiu        s10, ra, 2026
                  fsgnj.s      fs9, ft6, fa1
                  sll          a5, a5, t3
                  sll          gp, a4, t5
                  mul          s9, s10, a1
                  flt.s        t6, fa5, fa0
                  fmv.x.w      a6, fs6
                  sub          a7, s4, zero
                  mulhu        a1, s1, a0
                  xor          t6, t1, s3
                  flt.s        s9, fa7, fs10
                  fcvt.w.s     gp, fa4, rdn
                  sltiu        t1, t5, -1529
                  sltiu        s3, s0, -1636
                  fsgnj.s      fs3, fs6, fa1
                  fmax.s       ft4, fs9, fs8
                  fsgnjx.s     ft6, ft0, fs5
                  slti         t1, ra, 393
                  andi         s6, t1, 52
                  feq.s        a7, fs5, ft3
                  slti         s10, s11, -1581
                  or           s10, s10, t6
                  srli         s3, t5, 1
                  lui          s10, 301638
                  slt          t6, s3, a7
                  lui          sp, 565334
                  divu         t3, t3, zero
                  srai         zero, s4, 12
                  nop
                  add          s5, s11, a0
                  fcvt.s.w     ft4, s11
                  fmax.s       fs4, ft1, ft5
                  fcvt.wu.s    a1, ft8
                  sltu         a3, t3, a0
                  fsqrt.s      fa3, fs3
                  fcvt.s.w     fa3, s5, rtz
                  fsqrt.s      ft2, ft0, rup
                  ori          t5, a2, 997
                  fcvt.w.s     s0, fs0
                  add          t2, a6, s11
                  fsgnjn.s     ft5, fs6, ft7
                  fadd.s       fa4, fs3, fs6
                  fsgnjx.s     ft3, fa0, fs7
                  sra          t6, t1, s9
                  fmin.s       fa1, fa5, fa5
                  sra          t6, a4, s7
                  sltiu        a6, s7, -1333
                  mul          s6, a7, s9
                  xori         s9, tp, -1887
                  fsqrt.s      fa5, fs9, rup
                  fsgnjx.s     ft0, fa3, fs1
                  mulhu        s3, gp, s8
                  sltu         a6, tp, s3
                  srai         ra, t5, 29
                  fle.s        t1, fa7, fs8
                  rem          s10, a6, a3
                  lui          s6, 379560
                  slt          gp, gp, t4
                  fle.s        s6, ft4, fs9
                  xori         t6, sp, 1068
                  and          s3, a0, a3
                  fle.s        tp, fs9, fs2
                  fmv.w.x      fa1, s8
                  andi         s1, a2, 568
                  rem          a5, a0, s9
                  feq.s        tp, fs8, ft9
                  mulhsu       t2, t4, s0
                  and          t5, s3, s0
                  fsgnjx.s     fs11, fs6, fs10
                  or           a0, a6, t2
                  fclass.s     a3, fs5
                  fcvt.wu.s    t6, fs1, rup
                  lui          s7, 436703
                  andi         s5, sp, 1340
                  mul          s2, a5, s2
                  sltiu        tp, t5, -1734
                  fsqrt.s      fs7, ft11
                  slli         tp, t3, 23
                  fclass.s     t5, fa2
                  mul          s11, a4, tp
                  ori          t5, a7, 1398
                  auipc        t4, 679394
                  feq.s        t2, fa1, fs4
                  or           t5, ra, s8
                  fclass.s     gp, ft6
                  addi         t4, s10, 155
                  nop
                  mulhu        t4, s1, a3
                  add          s10, t6, a4
                  auipc        a3, 542785
                  remu         s2, a7, s7
                  lui          s2, 760349
                  sltiu        a3, s3, -1265
                  addi         sp, s4, -1672
                  srl          gp, s11, ra
                  fcvt.w.s     a7, ft8, rmm
                  mulhsu       ra, t0, s1
                  fcvt.s.wu    fa2, s11, rup
                  auipc        a6, 193729
                  slt          a6, s4, t0
                  fcvt.w.s     t1, fs3
                  andi         t5, s3, 731
                  or           zero, t0, s9
                  add          zero, t1, t5
                  fmv.w.x      fa6, a1
                  xori         t5, t5, -582
                  fclass.s     s11, fa0
                  sra          a7, t6, t0
                  fsqrt.s      ft11, ft9, rmm
                  sub          s2, t4, s11
                  feq.s        t6, fa1, fs0
                  rem          tp, s11, zero
                  addi         s10, s6, -229
                  sra          tp, s6, s0
                  sll          s9, s1, a5
                  fmv.x.w      t4, fa7
                  fcvt.s.w     ft9, s6
                  xor          a1, s9, a1
                  feq.s        s7, fa1, ft4
                  sub          s8, t5, s9
                  fmax.s       ft3, fa6, fa0
                  feq.s        s8, fa5, ft5
                  fsgnjn.s     fs10, ft9, ft8
                  divu         t3, s7, s0
                  add          t4, s9, t0
                  sll          s0, s9, t6
                  srai         a5, s4, 30
                  fcvt.s.w     fa7, t0
                  fcvt.s.wu    fs8, t0, rtz
                  fmv.w.x      fa5, s9
                  fmv.x.w      s1, ft4
                  fsqrt.s      fs0, ft7
                  fsqrt.s      fa6, fa1
                  fmv.x.w      t5, ft3
                  rem          a4, ra, t1
                  or           s1, s8, a1
                  xor          t4, t0, tp
                  fmul.s       fs10, fa6, fs5
                  fcvt.wu.s    s1, fs4, rup
                  div          a0, t6, s1
                  and          s0, s4, s1
                  nop
                  fmin.s       ft1, fs11, fs1
                  fadd.s       fa6, fs1, fa1
                  andi         gp, a4, 228
                  fsqrt.s      ft2, ft1
                  or           tp, s4, zero
                  mulh         s7, t5, t1
                  mulh         a4, s0, s3
                  fadd.s       ft7, ft4, ft5
                  addi         s5, ra, -1167
                  remu         s9, s4, s0
                  sra          s8, t0, s8
                  slti         a5, t3, -1063
                  feq.s        gp, fs2, ft6
                  divu         t4, a2, a7
                  mulhu        s10, gp, t4
                  fmv.w.x      fs6, t5
                  fcvt.s.w     fs2, s7, rtz
                  sra          a1, s3, ra
                  fsgnjn.s     fs2, fa5, fa0
                  fsqrt.s      ft1, ft5
                  srai         t4, t2, 14
                  mulh         a0, s5, s5
                  fsub.s       fa7, ft7, fs9
                  remu         a4, t4, a4
                  mulhsu       t5, s8, t6
                  remu         a5, s0, a6
                  and          s9, t5, a0
                  fmul.s       ft9, fa6, ft1, rtz
                  fmv.w.x      fs4, a3
                  feq.s        t3, fa7, ft7
                  xor          a1, s2, a4
                  feq.s        ra, ft3, fa0
                  srl          a4, s11, tp
                  divu         s10, t6, zero
                  sub          ra, zero, s10
                  fmin.s       ft2, fs9, ft5
                  fcvt.s.w     fa5, zero, rmm
                  fsgnjn.s     fs10, fa5, fs0
                  xori         sp, s2, -210
                  srl          t1, t5, a1
                  divu         s7, sp, t5
                  fmv.x.w      a4, fa1
                  xor          a6, zero, t2
                  div          s3, s9, t0
                  fmv.x.w      t6, fa3
                  fmv.w.x      fa4, t5
                  fcvt.w.s     a6, fs4
                  feq.s        s2, fs4, fs4
                  sltu         s10, s5, s10
                  sltu         a3, sp, a1
                  fmul.s       fs11, fs6, fa5
                  nop
                  slti         zero, ra, 317
                  rem          s8, t0, a0
                  slt          a6, s0, s6
                  nop
                  fclass.s     t6, fs6
                  fsgnjn.s     fs5, ft0, fa3
                  fcvt.wu.s    a7, ft6
                  sra          ra, t4, t1
                  slli         s6, a7, 17
                  srli         t1, a3, 3
                  remu         s1, t4, s2
                  div          t4, t6, t5
                  fsqrt.s      ft11, ft6
                  and          s2, a6, a0
                  slti         ra, s9, 1220
                  or           s1, a3, t2
                  slt          s3, s0, a1
                  divu         t4, a5, t5
                  fclass.s     s0, ft5
                  fsgnjx.s     ft4, fs7, ft5
                  fsgnjn.s     fs1, fa5, fa6
                  ori          tp, tp, 1281
                  ori          gp, t1, -1044
                  fsgnjn.s     ft7, fs4, fa5
                  fsgnjx.s     fs7, ft11, fs0
                  fcvt.wu.s    s10, fa3, rdn
                  add          a0, s2, a5
                  ori          s7, s7, -982
                  srl          a0, a7, t3
                  and          t4, a7, t3
                  fmax.s       fs3, ft6, fa7
                  fmv.x.w      s6, fa5
                  slt          t6, gp, s9
                  lui          s9, 619085
                  or           a6, ra, ra
                  sltiu        s10, s0, -1469
                  fcvt.s.w     ft1, a4
                  mulhsu       s10, ra, t1
                  fmin.s       fa2, fs10, ft9
                  sub          t5, t3, a4
                  divu         a3, s0, a2
                  srl          s7, a5, s1
                  fmul.s       fa3, ft5, ft10
                  rem          a5, a7, t1
                  slt          s0, t5, sp
                  fmin.s       fs8, ft7, ft7
                  xor          s0, t6, s11
                  fcvt.s.wu    ft2, a6
                  fsgnjx.s     fs8, ft6, fs8
                  lui          s5, 668548
                  fsgnjn.s     fs5, ft0, ft3
                  divu         t3, a4, ra
                  remu         a0, sp, t3
                  fsgnj.s      ft11, fa1, ft5
                  slt          ra, t0, s11
                  srai         t2, s1, 15
                  fadd.s       fs9, ft2, fs9, rtz
                  divu         sp, s5, t1
                  remu         s10, a0, a0
                  sub          sp, zero, s11
                  addi         a1, s5, 889
                  slli         s1, s10, 23
                  lui          t5, 656290
                  fmv.w.x      ft9, s5
                  fcvt.wu.s    s3, fa4, rne
                  fcvt.wu.s    s3, fa2, rtz
                  sltu         s6, t2, ra
                  remu         a4, t3, s7
                  addi         a1, s4, -793
                  mulh         a5, a5, a1
                  xori         s8, sp, 1320
                  fsgnj.s      fs10, fs9, fa5
                  sra          a6, s3, s1
                  andi         t5, s3, -1838
                  fmax.s       fa6, fa0, fa7
                  mul          t4, gp, a7
                  slt          s8, s11, sp
                  nop
                  fcvt.s.wu    fs1, s0, rdn
                  sra          s3, s0, t5
                  srl          s2, a3, a3
                  fcvt.w.s     s5, fs1
                  addi         a6, a3, -1710
                  fsub.s       ft10, ft3, fs6, rne
                  fsqrt.s      fa3, fa1
                  mulhu        s7, t5, t3
                  lui          t5, 120614
                  auipc        s10, 50652
                  flt.s        s6, ft11, ft10
                  or           s2, a5, sp
                  auipc        s11, 862936
                  divu         t4, s4, sp
                  slt          gp, s2, t2
                  fmul.s       fs9, fs8, ft6
                  fadd.s       fs1, fs10, fa3
                  slli         t2, a1, 16
                  fadd.s       fa7, ft9, ft11, rmm
                  and          a3, t6, s11
                  feq.s        s0, fa3, ft3
                  sub          s8, a5, sp
                  fmax.s       ft3, fs2, ft6
                  divu         s5, t1, a1
                  flt.s        t3, fa5, ft3
                  feq.s        t2, fa0, fa0
                  lui          s1, 322839
                  and          a7, a5, t6
                  mulhu        t4, t1, t5
                  fcvt.wu.s    a5, fs11
                  mulhsu       s10, s8, a1
                  sltu         s1, zero, s8
                  andi         s8, a4, 1068
                  nop
                  xor          gp, t3, t6
                  fle.s        s3, fa5, fa1
                  nop
                  feq.s        s8, ft7, fs5
                  mulhu        t3, s8, a5
                  mulhsu       a3, s10, a0
                  sltiu        s1, s2, -162
                  ori          s3, s3, 2007
                  sll          t4, s10, gp
                  flt.s        gp, ft4, ft7
                  ori          sp, a1, -1237
                  fsgnjn.s     ft1, fs9, ft9
                  slti         a1, a3, -113
                  mulh         sp, t3, a4
                  slti         s8, a3, -1564
                  sub          s3, s6, a1
                  slti         s10, a7, 1858
                  fcvt.s.w     fa7, a5
                  sub          t5, t5, sp
                  srl          s3, s2, t5
                  srli         a4, a6, 18
                  fcvt.wu.s    s8, fa7
                  divu         s1, sp, s9
                  div          s3, gp, s10
                  fle.s        t6, fs9, ft0
                  ori          a5, gp, -240
                  mulh         a3, a4, a6
                  fmv.w.x      fa6, sp
                  fsgnjx.s     fs9, fa6, fa4
                  slti         a7, a0, -298
                  feq.s        a4, ft0, fs4
                  divu         sp, s7, a6
                  fmin.s       ft4, ft10, fa5
                  mulhsu       s10, ra, a6
                  sltiu        s3, a3, 786
                  mulh         s6, s6, t4
                  sll          zero, a0, ra
                  auipc        ra, 1019754
                  fcvt.wu.s    s11, fs4, rtz
                  fle.s        s5, ft2, ft11
                  fmax.s       fa2, fs9, fs5
                  mulh         s9, s5, s3
                  fcvt.s.wu    ft7, gp, rmm
                  fcvt.s.wu    ft4, t0
                  fmin.s       fa7, fa5, fs10
                  and          t6, s9, s0
                  lui          s3, 622413
                  fmv.x.w      a0, fs2
                  fmv.w.x      fs11, a3
                  mul          s7, s5, s9
                  srl          a5, s2, s10
                  fmul.s       ft8, ft10, fa5, rne
                  sub          sp, s6, s5
                  fdiv.s       ft3, fs0, fs5, rtz
                  auipc        t1, 328520
                  fsub.s       ft9, ft3, fa4, rne
                  rem          t4, s8, a1
                  div          a3, a3, a7
                  sra          t6, s8, s6
                  sltiu        tp, t1, -1291
                  fsgnjx.s     fs4, ft1, ft6
                  add          a1, a5, a0
                  ori          a4, a2, -903
                  remu         s9, t1, s9
                  add          ra, a3, s10
                  andi         s6, sp, -551
                  fmv.x.w      tp, fs6
                  slti         t2, t1, 1571
                  sra          t1, t6, sp
                  fdiv.s       ft10, fs7, ft9
                  mulhsu       zero, s8, t4
                  rem          s6, tp, t5
                  srai         gp, ra, 13
                  xor          s11, s3, a6
                  fclass.s     s8, fa7
                  fmax.s       ft4, fa4, fs3
                  sltiu        a0, a3, -1630
                  fle.s        a3, fs2, fs9
                  fcvt.s.w     fs8, s9
                  slt          a0, s6, a2
                  sltu         s3, a2, zero
                  slti         s3, s5, -787
                  slli         s9, s2, 2
                  divu         s1, tp, a7
                  feq.s        ra, ft2, fs7
                  slti         t6, s11, 1750
                  fcvt.s.w     fa0, a7, rup
                  fcvt.w.s     s8, fs5
                  mulhu        s7, a3, s5
                  fcvt.w.s     s2, fs1
                  slt          s8, gp, a4
                  fmin.s       ft10, fs7, fs8
                  slti         a1, s6, 1462
                  slli         t2, t2, 3
                  remu         s7, t0, s3
                  div          gp, t3, t5
                  slli         t4, a7, 12
                  and          s10, s10, t6
                  fmax.s       fs9, fa0, fa7
                  fcvt.s.w     fs9, a4
                  fsqrt.s      ft0, fa6
                  fle.s        s10, fs7, fs10
                  sub          a7, s1, t5
                  sltu         s9, s1, t6
                  xor          sp, s3, sp
                  mulhu        a4, a0, s11
                  sll          ra, s0, a6
                  slt          s10, s11, a6
                  mulh         t4, s4, a7
                  auipc        s11, 387599
                  fle.s        a5, ft5, fs0
                  fdiv.s       fa1, fa7, ft10, rne
                  srli         a4, s7, 10
                  mulh         s2, s3, a0
                  rem          s8, s10, t4
                  slti         t6, t6, 1885
                  addi         s0, t1, 1090
                  fsgnj.s      ft6, fs9, ft7
                  fmin.s       fs2, fs9, fa2
                  sltu         s9, t2, s6
                  mulhu        t6, t2, a2
                  div          sp, t1, t2
                  mulhsu       a6, gp, a7
                  rem          tp, a2, t2
                  fmul.s       fa6, fa7, ft10
                  sub          s9, a4, t0
                  slti         s8, tp, 1787
                  sltiu        t6, s1, -649
                  mul          s1, s2, s10
                  slt          a5, s1, t0
                  mul          sp, s2, s11
                  div          a0, s8, s6
                  auipc        t3, 271308
                  fle.s        ra, ft4, fs10
                  fsgnjx.s     ft6, fa5, fa7
                  fsub.s       ft7, ft5, ft9
                  fcvt.w.s     s1, fa2
                  fle.s        s9, ft6, ft10
                  fcvt.s.wu    fa0, a7, rne
                  sra          s10, zero, t3
                  fmv.x.w      t6, ft2
                  fmv.x.w      s11, fa0
                  mulh         sp, t6, s6
                  lui          s7, 452659
                  fcvt.w.s     a5, ft4, rne
                  fmax.s       ft8, fa0, fs5
                  fcvt.s.w     fs2, a2
                  fle.s        zero, fs0, fa7
                  nop
                  lui          zero, 748958
                  fmul.s       fs10, ft8, ft8
                  fcvt.s.wu    fa7, tp
                  slli         tp, s10, 13
                  srli         a1, a6, 20
                  fmax.s       fa4, fs11, fa0
                  rem          t6, s4, s3
                  srl          s10, ra, a0
                  auipc        ra, 251314
                  mulhsu       s7, a4, tp
                  fcvt.wu.s    a5, fa4
                  mul          t4, zero, zero
                  lui          s8, 294629
                  mulhsu       s1, s4, t6
                  divu         s9, a1, s6
                  srli         t6, t1, 5
                  rem          s8, t5, a4
                  fmv.x.w      s1, ft2
                  sra          t4, a4, s0
                  fsgnjx.s     fs1, fs2, fs11
                  srai         s11, s5, 6
                  fcvt.s.wu    fs6, t6
                  fmax.s       fs6, fs10, ft9
                  mulhu        t5, t0, tp
                  mulh         a1, t5, s7
                  fsgnjx.s     fs4, ft9, ft5
                  div          zero, s3, a0
                  mulhsu       a5, t3, s6
                  fsgnj.s      ft7, ft5, fs10
                  xori         sp, t6, -1418
                  srl          s0, t5, s7
                  fsgnjn.s     fa2, ft9, ft7
                  fcvt.wu.s    a3, ft4
                  mulh         gp, s7, s8
                  fmax.s       fa1, ft5, fs5
                  fmax.s       fs10, ft2, fs8
                  slt          tp, ra, t2
                  fmin.s       ft1, ft5, fs8
                  slti         sp, sp, 1522
                  slli         sp, a0, 9
                  mulhu        t3, s6, s7
                  fsqrt.s      fa3, ft1, rmm
                  fmax.s       ft0, ft11, ft10
                  sltu         sp, s9, a1
                  auipc        s7, 651805
                  slti         t4, a7, 355
                  fcvt.s.w     fs6, t5, rdn
                  mulh         s7, s0, s0
                  slli         a5, s2, 16
                  sub          a3, sp, a0
                  fmv.x.w      t2, ft7
                  srai         a3, s11, 6
                  srl          s1, tp, s9
                  flt.s        ra, fs5, fa7
                  and          t5, s2, a5
                  fmul.s       fa5, ft10, ft2, rup
                  fmv.w.x      fs9, s8
                  fmin.s       ft11, fs9, fa4
                  slti         s6, ra, -672
                  addi         t6, ra, -170
                  flt.s        a7, ft6, fa1
                  divu         s11, a4, t4
                  xori         a0, s6, 1839
                  sltiu        zero, t0, -72
                  divu         sp, a3, s0
                  fsqrt.s      ft0, fa5
                  mulhu        s7, s11, a1
                  fmv.x.w      a7, fa1
                  remu         tp, t6, s11
                  fsgnjx.s     fa6, fa5, fs7
                  and          a0, s10, s7
                  sra          a4, s1, s11
                  fcvt.wu.s    a7, fs2
                  fsgnj.s      fs10, fa1, fs6
                  slti         s3, t4, 1363
                  fsgnjn.s     fa1, ft1, fs4
                  fsub.s       ft0, fa6, fa7, rne
                  div          a1, a7, s5
                  addi         a5, s4, 445
                  srli         zero, a0, 17
                  feq.s        s6, ft10, fs9
                  xor          zero, a2, t5
                  srl          a0, zero, t0
                  slti         a3, s2, -834
                  sub          a5, zero, a6
                  slt          t6, a1, sp
                  sub          t3, s3, s4
                  sltu         s1, a6, s10
                  fcvt.w.s     a6, ft6, rtz
                  srl          t5, s0, t0
                  mulhsu       a6, s11, t3
                  div          tp, s10, s3
                  rem          t2, s0, s3
                  xor          t4, a7, t3
                  fmax.s       fs4, ft4, ft10
                  auipc        t3, 540288
                  div          t4, s7, s0
                  fmin.s       fs10, fs0, ft9
                  feq.s        s0, fs3, fs1
                  fadd.s       fs7, fa6, fa4
                  addi         a7, a1, -737
                  fmv.w.x      ft0, a6
                  mulhsu       a1, t4, a6
                  addi         t3, a1, -1120
                  lui          s9, 650289
                  ori          a7, t6, -1609
                  fclass.s     s5, fs7
                  andi         s10, s9, 1334
                  mul          s1, s3, s1
                  mulhu        s0, t3, s7
                  mulhu        a3, t0, a6
                  fclass.s     s6, fa4
                  mulh         t1, s2, s11
                  fsgnj.s      ft6, fs8, ft9
                  fmax.s       ft6, fa5, fa0
                  fsgnj.s      fs10, fs11, ft3
                  fmv.x.w      a7, fa6
                  slli         s0, t0, 7
                  fcvt.wu.s    zero, fa5
                  lui          t3, 958387
                  fsqrt.s      ft0, fa3
                  srl          a3, a0, t3
                  srli         gp, t1, 1
                  fmv.x.w      a0, ft8
                  mulhsu       gp, a7, s2
                  fadd.s       fa3, ft10, fs4
                  fsgnjn.s     ft4, fa3, fs5
                  mulhu        t6, s4, s8
                  slli         s11, s5, 13
                  fdiv.s       fa4, ft10, fa2, rne
                  fcvt.wu.s    s3, fs8, rtz
                  sltu         tp, s2, s6
                  sll          s8, s4, s0
                  and          s7, t5, zero
                  addi         t5, a0, -2043
                  sub          s6, s3, a7
                  addi         s9, s8, -1361
                  sra          a7, s7, zero
                  remu         s11, a5, s11
                  fle.s        s2, fs5, fa2
                  xori         s5, t3, -1129
                  fmin.s       fs1, fa0, ft4
                  fclass.s     s11, fs5
                  div          sp, tp, a3
                  fle.s        t1, fa6, fs4
                  mulhu        s2, a2, a5
                  sltiu        t5, s10, 1936
                  sltu         tp, t1, a4
                  srli         s7, a0, 20
                  slt          a6, s10, a2
                  fmv.w.x      fa3, s5
                  sll          t1, a5, a5
                  slt          t2, s0, s5
                  fle.s        t2, ft4, ft0
                  and          gp, t3, s0
                  mulh         t3, s6, gp
                  divu         a4, a4, s4
                  mulh         sp, gp, zero
                  mul          s6, tp, a1
                  fdiv.s       fs10, fs9, fs8, rdn
                  fsgnjn.s     ft9, fs11, ft10
                  slti         zero, s3, 202
                  fsgnjx.s     fs3, fa5, fs7
                  srl          s1, t2, t4
                  fsgnj.s      fs4, fa4, ft11
                  mulh         a3, t1, a4
                  fsub.s       fs4, ft0, fs7
                  slli         s2, s7, 3
                  addi         ra, s10, 32
                  fclass.s     s7, fs11
                  addi         ra, a7, -426
                  fclass.s     zero, fs11
                  mulhu        t5, s0, sp
                  mulh         a6, t1, a6
                  fmv.w.x      fs4, tp
                  mul          s2, a6, s4
                  mulhsu       s1, t3, a1
                  fcvt.wu.s    s2, ft10
                  andi         a7, s0, 731
                  auipc        zero, 906007
                  lui          zero, 909961
                  fsgnjn.s     fa7, ft9, fs7
                  ori          gp, s2, -1697
                  sll          a6, a5, a5
                  lui          s10, 662215
                  divu         s9, ra, a1
                  fcvt.s.wu    fa2, s6
                  fsgnjn.s     fa7, ft11, fa0
                  rem          a3, t6, s5
                  xori         gp, ra, -467
                  fcvt.s.wu    ft0, s6
                  fcvt.s.w     ft3, s5
                  fmax.s       ft5, fs6, fs11
                  fcvt.s.w     ft8, s3
                  fclass.s     a3, ft8
                  andi         tp, gp, 1763
                  fdiv.s       ft4, fa5, ft4, rdn
                  sub          a6, t3, s4
                  sub          ra, a7, tp
                  fsgnjn.s     fa3, fs3, fs10
                  and          t5, s5, s6
                  fcvt.s.wu    ft10, t5, rup
                  fmin.s       ft7, fs0, ft1
                  fadd.s       fa1, ft3, fa4, rup
                  rem          sp, gp, gp
                  fle.s        s10, fs4, ft0
                  sltu         t5, t1, a6
                  fcvt.s.wu    ft10, t6
                  flt.s        t6, fa4, fa6
                  fadd.s       fs0, ft8, fa5, rup
                  sltu         s8, s4, t0
                  add          t2, a4, s2
                  sub          a6, zero, gp
                  srl          sp, a2, a2
                  sll          s7, a4, s2
                  sltiu        t5, tp, -2044
                  fcvt.s.wu    ft7, s8, rtz
                  mul          s0, ra, s3
                  fcvt.s.w     fs1, s3, rup
                  add          s0, a2, a4
                  flt.s        s7, ft8, fs2
                  slt          s11, a6, s6
                  feq.s        s8, fs7, fs0
                  fsub.s       fa3, fa3, fs0
                  and          a7, gp, s5
                  fcvt.s.w     fs0, t3
                  fcvt.s.wu    fa4, s11
                  fsub.s       fs6, fs10, fa2
                  mulhu        a5, t6, s3
                  mulh         s2, a6, t5
                  auipc        s10, 948575
                  xori         t1, s0, 1768
                  fcvt.wu.s    s2, ft10
                  mulhsu       t4, a5, t2
                  nop
                  feq.s        s2, ft4, fa7
                  or           s10, a6, s8
                  fdiv.s       ft6, fa6, fa3, rtz
                  mul          s1, s1, t6
                  fmin.s       fa6, fs5, fa4
                  fmv.x.w      s11, ft11
                  fcvt.s.wu    fa3, t2, rup
                  slli         t5, a6, 17
                  fsgnjx.s     ft4, fs2, fs11
                  remu         t2, s9, a4
                  sltiu        t6, t4, -360
                  fsub.s       fa5, ft4, fs11
                  sltu         s11, s4, sp
                  slti         s2, s0, 1214
                  or           t6, ra, a0
                  fmax.s       ft8, ft9, fa4
                  fmin.s       fs9, fs3, fa5
                  fmin.s       fa4, fs3, ft5
                  sltiu        s7, a4, 1256
                  or           t3, s8, t2
                  sltu         a0, sp, a3
                  mulhu        s11, tp, t5
                  fsgnjx.s     ft0, fa1, fa3
                  sll          tp, s8, s8
                  fcvt.wu.s    s5, fs4
                  fcvt.w.s     s1, fa7, rup
                  fclass.s     a6, fa6
                  fsgnjn.s     fs10, fa3, ft10
                  fsqrt.s      fa6, ft2
                  sll          a5, a4, t1
                  sltiu        s7, s9, 1890
                  nop
                  add          gp, sp, s3
                  divu         t4, a5, a7
                  divu         t4, s9, s8
                  divu         s8, a2, t6
                  fcvt.s.w     fa6, t3
                  fcvt.s.w     ft3, a0
                  fsqrt.s      fs1, fa7
                  fmul.s       ft11, ft4, fs8, rmm
                  fmv.x.w      a7, ft8
                  fmin.s       ft4, fs9, fs9
                  mul          s1, s10, t4
                  mulhu        t6, s4, a1
                  slt          s8, s11, a0
                  fmv.x.w      ra, ft8
                  fcvt.w.s     t3, fa7, rne
                  sltiu        t4, t5, 826
                  sra          a0, t5, a0
                  fsqrt.s      fa6, fa0, rdn
                  slt          s3, t6, gp
                  slli         t5, gp, 21
                  fmax.s       ft1, fa6, fa2
                  fcvt.w.s     a4, fs2
                  fsgnjn.s     fs5, fs1, fs11
                  andi         a4, a0, 140
                  fmul.s       ft3, ft11, fa4
                  fsqrt.s      ft11, fs10, rup
                  flt.s        s3, ft10, fs8
                  mulh         s6, s2, a0
                  mul          a0, s8, t5
                  slt          t5, a6, a0
                  remu         s6, s9, t3
                  lui          zero, 491610
                  fmv.w.x      ft5, a2
                  and          a3, t4, a0
                  srai         s9, zero, 5
                  div          s8, s6, s1
                  addi         a1, t1, 490
                  fsqrt.s      fa5, ft9
                  fmax.s       ft9, ft2, fs3
                  fadd.s       fa2, fa1, fa6
                  fle.s        t5, fs1, fs4
                  slti         s6, t1, 1967
                  fcvt.w.s     a4, fs7
                  mul          s0, s3, sp
                  sltiu        s2, zero, 1788
                  fsgnjn.s     fs7, ft6, fa5
                  srl          a3, t2, tp
                  fcvt.wu.s    a7, fa5, rmm
                  divu         a6, s10, s4
                  sltiu        t4, t3, 1383
                  sltu         t4, t5, a0
                  sll          sp, a1, a5
                  sltiu        sp, zero, -273
                  fsgnjn.s     fa3, fa1, fs10
                  flt.s        s11, fa7, fa1
                  mulhu        s9, tp, sp
                  fcvt.w.s     t5, fs8
                  and          s5, a2, s7
                  mul          a6, t3, a3
                  flt.s        s6, fa2, fs8
                  xor          s5, zero, s0
                  auipc        s6, 1009035
                  sub          s8, s7, s11
                  flt.s        sp, ft9, fa1
                  sll          s9, ra, s10
                  slti         a0, a6, -2007
                  feq.s        s5, ft7, fa7
                  fsgnjn.s     fs6, fs3, fa2
                  fmv.w.x      fs11, t0
                  addi         zero, t6, 1360
                  mul          s8, ra, a5
                  fsgnjx.s     fa4, ft2, fs3
                  fmv.w.x      fa3, s10
                  flt.s        a5, ft10, ft11
                  fmv.w.x      fs10, a0
                  lui          s1, 715196
                  feq.s        zero, fs8, fs3
                  flt.s        a5, fs9, fs7
                  fcvt.s.wu    fa0, s10
                  fmax.s       fs8, fs3, ft4
                  fclass.s     tp, fs2
                  fdiv.s       ft9, fs6, fs10, rne
                  fcvt.s.wu    fs10, t1
                  sra          zero, t3, tp
                  or           s0, s2, a6
                  fmv.w.x      fa1, s9
                  ori          a3, ra, 1226
                  or           t5, s3, a3
                  fmv.x.w      t2, fa4
                  fmv.w.x      fs7, s11
                  remu         t2, s1, t3
                  fsgnjx.s     fa5, fs6, fs4
                  auipc        a3, 373875
                  rem          t6, a4, sp
                  remu         s0, t5, zero
                  fsgnj.s      ft7, fa1, fs7
                  sub          t6, s7, a6
                  fcvt.w.s     a5, fs7, rtz
                  fsgnjn.s     fs8, fa2, ft1
                  flt.s        s10, fa7, fa6
                  srli         s2, t4, 3
                  fsub.s       ft10, ft10, ft10, rmm
                  div          t6, s2, s11
                  auipc        s2, 821173
                  mul          s3, gp, t4
                  fsqrt.s      ft6, ft7
                  and          t4, s7, a0
                  mulh         tp, s2, tp
                  fcvt.s.wu    fs3, tp
                  andi         a0, s4, -17
                  fcvt.wu.s    t3, fa5
                  fmin.s       fa2, fa3, fa0
                  divu         tp, s4, t0
                  srai         ra, t0, 29
                  div          s8, s4, a7
                  lui          s0, 165782
                  fsqrt.s      ft10, fa2, rmm
                  div          t3, s2, ra
                  fadd.s       fa7, ft9, ft10, rup
                  fadd.s       ft10, fs8, fa7, rmm
                  mul          a4, a2, s6
                  fle.s        s5, fs0, fa7
                  srli         s11, a2, 18
                  nop
                  xori         t6, s9, 1719
                  fmax.s       fs8, fs11, fs10
                  fcvt.wu.s    gp, fs4
                  rem          s2, a7, tp
                  and          t2, s10, s1
                  addi         s2, t4, 993
                  rem          s11, a1, tp
                  divu         s6, ra, a1
                  fadd.s       fa4, fa4, fa4
                  fmv.w.x      fs9, a0
                  addi         s1, s11, -141
                  divu         a7, a3, a2
                  sll          a4, zero, s9
                  flt.s        a7, fa2, fa5
                  fcvt.s.w     fs11, s0
                  srl          t1, s5, s11
                  fsgnj.s      fa4, fa5, ft8
                  fmv.w.x      ft10, a3
                  andi         gp, t1, 177
                  fle.s        s3, ft1, ft4
                  fdiv.s       fs3, fa3, fa0
                  and          tp, a1, s8
                  mulhu        s8, t2, s4
                  fcvt.wu.s    a0, fs9, rne
                  fle.s        a0, ft11, fs9
                  and          t2, a3, s0
                  slt          a1, a0, t1
                  add          s2, t1, s6
                  xor          t6, s3, a4
                  fsgnj.s      fa2, ft0, fs6
                  and          tp, a7, t5
                  fsgnjn.s     fs2, ft3, fa5
                  fsqrt.s      fa6, fs0, rdn
                  mulhsu       t2, ra, t4
                  slli         s2, s8, 0
                  mulhu        s11, s3, s8
                  sll          t1, s2, a3
                  fadd.s       ft4, fa3, fa7
                  fmv.x.w      tp, ft10
                  auipc        a0, 1030915
                  sra          a3, a5, s11
                  xori         s5, s10, -761
                  slti         ra, a7, -460
                  fcvt.s.wu    fa1, t3, rtz
                  fcvt.wu.s    ra, fs11
                  mul          a6, tp, a6
                  rem          t6, a0, s11
                  fmv.w.x      ft3, ra
                  sub          ra, s3, a1
                  fcvt.wu.s    s5, fs5, rtz
                  fsqrt.s      fa6, ft10
                  fcvt.w.s     sp, ft11, rup
                  rem          tp, s5, t6
                  mulh         t6, s10, t1
                  nop
                  ori          t2, a2, 1434
                  fadd.s       fs11, fa5, fs1, rne
                  sra          t5, s4, a1
                  slli         t2, t2, 9
                  add          s7, t0, tp
                  fdiv.s       ft2, ft7, ft7, rtz
                  divu         s7, sp, tp
                  srai         s2, t1, 24
                  div          a6, a7, a5
                  mulhu        a1, s0, s2
                  nop
                  mulhsu       s2, s8, s10
                  div          s1, s5, s2
                  or           t2, s4, zero
                  or           s6, tp, a5
                  sltu         s8, ra, tp
                  fcvt.wu.s    a5, ft6
                  fsqrt.s      fs5, fs2
                  fsqrt.s      ft8, fs10
                  sra          a3, s9, s7
                  fsgnjn.s     ft3, fa6, fa7
                  add          s6, s5, tp
                  flt.s        a7, fs9, fa2
                  fsgnjx.s     fa3, ft2, fs10
                  xor          t4, zero, a4
                  fsqrt.s      fs10, fs11, rtz
                  slti         a4, s1, -1900
                  nop
                  div          t3, s11, t6
                  ori          zero, s6, -1060
                  fsgnj.s      fs3, ft8, fs10
                  srai         a1, s6, 25
                  fmv.x.w      a4, ft9
                  srai         s9, a5, 19
                  sra          gp, a1, t2
                  fmv.w.x      fa3, a7
                  srai         a7, sp, 1
                  div          a4, a3, sp
                  fsgnjx.s     ft8, fs1, ft10
                  and          t6, s8, sp
                  fsqrt.s      ft5, ft1, rdn
                  mulh         s7, gp, a1
                  or           t2, t3, zero
                  auipc        s6, 534088
                  fadd.s       ft1, ft3, fs10
                  fsgnjx.s     fs2, fs7, fs10
                  nop
                  rem          t6, s1, t3
                  xori         a1, t3, 884
                  slt          s6, t3, a7
                  mulhu        s10, a3, a7
                  sltu         s10, zero, a5
                  auipc        s2, 207960
                  mulhu        t4, a7, s9
                  fsgnj.s      fa6, ft7, fs5
                  fsgnjx.s     ft10, fa1, fs9
                  fcvt.wu.s    s3, ft10, rdn
                  xor          s5, ra, s4
                  mul          t2, s1, a4
                  fle.s        t3, ft8, ft4
                  fcvt.s.w     fa2, t0, rne
                  mulhu        t4, a5, a1
                  flt.s        a1, fs4, ft0
                  divu         s2, tp, s1
                  ori          a4, t5, 1910
                  remu         s0, a0, a2
                  rem          a3, s8, s9
                  fclass.s     s9, fa2
                  fmax.s       fs4, ft11, ft6
                  slti         ra, t4, 10
                  fsgnj.s      fa3, fa1, ft5
                  mulhu        t1, a6, t0
                  sub          t6, t0, a0
                  add          t1, a0, s3
                  sub          s7, a0, a2
                  andi         s9, a3, 77
                  or           t4, s10, s4
                  sltiu        s9, s9, -1501
                  sra          s11, sp, a2
                  ori          t6, s10, 1375
                  mulh         s9, a4, tp
                  sll          s9, a0, s2
                  srli         zero, s6, 28
                  slt          a4, s2, t0
                  fsgnj.s      fa1, ft5, fs5
                  add          a7, a0, t6
                  mulhsu       a4, a7, s1
                  srli         s11, s11, 24
                  slti         s5, a6, 1608
                  mul          a5, t3, a1
                  auipc        t2, 1024050
                  nop
                  slt          t6, s8, s9
                  fmul.s       fs7, fs10, ft3
                  and          zero, tp, a3
                  andi         s0, sp, 1311
                  flt.s        s7, ft7, fs2
                  fcvt.s.w     ft4, s4, rtz
                  sll          gp, s10, t0
                  fadd.s       ft5, ft3, fs6, rne
                  fsgnjx.s     fa5, fs1, ft8
                  fclass.s     t5, fs7
                  feq.s        a4, fs3, fs11
                  feq.s        tp, fa4, ft7
                  fle.s        s6, fa2, ft7
                  addi         zero, s5, 588
                  or           a7, s10, sp
                  sltu         a4, s9, a1
                  mulhsu       sp, a3, s3
                  fmv.w.x      fs2, sp
                  and          s11, t0, s4
                  slli         t4, a4, 28
                  fmin.s       fa2, fs5, fs4
                  sub          a0, gp, a5
                  fcvt.s.wu    fs2, s11, rup
                  srli         t5, t1, 29
                  fcvt.s.w     ft9, a5, rtz
                  fmax.s       fa3, fs9, fa2
                  fcvt.s.w     ft9, s0
                  rem          ra, s5, s9
                  lui          s8, 634519
                  slt          t2, s0, a5
                  sltiu        a0, a4, 113
                  fmv.w.x      fs11, s4
                  srl          sp, s4, t4
                  fsqrt.s      ft8, fs6
                  mulhsu       s2, a2, t3
                  fmin.s       fs2, ft7, fs7
                  divu         t3, s2, a6
                  sra          sp, tp, tp
                  and          a6, a0, s7
                  lui          zero, 778302
                  sltiu        s0, t4, -1544
                  fmax.s       fs11, ft2, ft9
                  ori          t4, t6, -1755
                  div          a5, t5, a3
                  flt.s        t3, ft10, fs10
                  fmv.w.x      ft4, s0
                  slt          t2, s0, gp
                  fmin.s       fs6, ft7, fa4
                  sra          t4, s1, s0
                  addi         t1, t2, -580
                  sltiu        s6, a1, 1948
                  nop
                  fmv.w.x      ft2, t3
                  mul          s8, s9, s5
                  fle.s        zero, ft7, ft11
                  andi         a5, s9, 1427
                  nop
                  fmax.s       ft6, fs1, fa3
                  fsqrt.s      fs5, fa2, rtz
                  fcvt.s.wu    fs4, sp
                  slli         a4, zero, 31
                  xori         a3, s6, 1932
                  divu         a0, s9, s3
                  sll          tp, t6, t5
                  sra          a4, s10, t2
                  fcvt.s.wu    fs1, a5
                  srai         gp, zero, 20
                  auipc        t5, 19888
                  sltu         t6, t3, sp
                  andi         t2, sp, 863
                  fsub.s       fa6, fa7, fs9, rup
                  mulhu        t2, a7, t1
                  fsgnjn.s     fs2, fa4, ft3
                  fsgnjn.s     ft7, fs4, ft1
                  srl          tp, a4, a3
                  fcvt.s.w     fa1, t5
                  auipc        s0, 245430
                  slli         a0, s0, 3
                  slti         s1, a0, -1205
                  div          a5, t2, t1
                  sra          a6, s7, a6
                  mul          a7, t3, s6
                  fmv.w.x      ft9, t3
                  fcvt.s.w     ft5, t5
                  sub          s3, s10, t0
                  mul          s9, s7, s0
                  fcvt.w.s     s5, ft5
                  auipc        ra, 49930
                  fsgnjx.s     fa0, fa1, fs1
                  slti         s2, a5, 892
                  rem          s11, s2, t4
                  fsgnjx.s     fs5, fs6, fs9
                  fsgnjx.s     ft2, fa0, ft11
                  fcvt.s.w     fs4, s9, rup
                  andi         s2, gp, 1894
                  mulh         s0, a0, s9
                  fcvt.w.s     a3, fs5, rne
                  mulhsu       gp, t0, t1
                  fclass.s     sp, fa3
                  feq.s        s7, fs10, ft10
                  fcvt.s.w     ft1, a4
                  sub          a7, ra, sp
                  fadd.s       ft9, ft10, ft4, rne
                  addi         tp, a5, 1057
                  or           a5, t5, tp
                  lui          a0, 894732
                  fcvt.wu.s    a7, fa3, rne
                  fcvt.s.w     fs9, a3
                  fsgnjx.s     ft10, ft11, fs0
                  xor          s11, zero, t6
                  ori          s7, s9, 474
                  mulhsu       zero, s9, s5
                  fadd.s       fs2, fa6, fa3, rtz
                  fmax.s       fa3, fs9, fs4
                  srl          t5, s7, s11
                  fcvt.s.w     fa7, t4, rne
                  sltiu        t2, s7, 48
                  mulhu        t2, s4, tp
                  fcvt.wu.s    a1, fs5, rup
                  sub          s11, t0, a2
                  fmul.s       ft10, ft11, fs0, rmm
                  ori          a3, s2, -1539
                  div          a5, s4, a0
                  fsub.s       ft6, ft5, ft11
                  fmin.s       ft9, fa6, ft9
                  fsqrt.s      ft8, fa3
                  xori         t6, a5, 220
                  srl          t2, t2, t2
                  sra          t6, s11, s4
                  remu         s6, a2, a5
                  fdiv.s       fa5, fs5, ft10
                  srl          a1, ra, t4
                  fmul.s       fs11, fa5, ft4, rne
                  xori         s2, a7, -1125
                  sll          t5, t5, a4
                  feq.s        s7, ft9, ft11
                  add          a7, a7, a7
                  mulh         s6, s9, t3
                  sltiu        t4, a2, 1248
                  slt          t5, s10, zero
                  divu         s11, t0, a4
                  fcvt.wu.s    sp, fa7, rne
                  srl          a7, s6, t3
                  sra          a3, t0, a3
                  fmv.x.w      gp, fa0
                  fsqrt.s      ft10, ft7, rne
                  slt          t5, tp, s4
                  slt          s9, a5, tp
                  fcvt.w.s     t1, fs5
                  fcvt.wu.s    s10, fs6
                  slt          a1, a3, s8
                  fmv.x.w      s0, ft8
                  or           sp, tp, a3
                  addi         ra, s2, -1439
                  xori         s2, a2, -881
                  fsgnjn.s     fa3, fs1, fa3
                  flt.s        a6, fs11, fa3
                  nop
                  slt          a3, t4, s4
                  fmv.w.x      ft4, t3
                  mulhsu       sp, sp, a6
                  sll          t3, a1, a7
                  sll          s11, a6, tp
                  div          t1, s0, a1
                  slti         t3, a7, -1296
                  fadd.s       fs7, ft11, ft5, rtz
                  fdiv.s       fs2, fs9, ft0, rup
                  fcvt.s.w     fs4, a3, rtz
                  feq.s        sp, fs3, fa4
                  mulh         a4, ra, gp
                  flt.s        s7, fa6, fs5
                  fadd.s       fs11, ft5, fs5
                  fdiv.s       fa0, fs2, ft0, rtz
                  divu         a1, a4, a4
                  srli         t2, t5, 13
                  or           tp, zero, s0
                  fmv.w.x      fa2, s11
                  fsub.s       fa4, ft2, ft9
                  sll          s0, a2, s9
                  andi         a5, a0, 1854
                  lui          s3, 309633
                  addi         t2, zero, -1059
                  fmv.x.w      s7, fa5
                  sltiu        s3, s10, -2025
                  fsub.s       ft1, ft1, ft10
                  andi         a5, s4, 796
                  srli         gp, t3, 24
                  or           a1, a5, sp
                  fcvt.s.w     fs6, ra
                  srai         ra, s10, 2
                  mulhu        s1, t3, s9
                  fsgnj.s      ft10, fs11, fs3
                  slti         a6, t2, -569
                  sltiu        s3, s8, 1816
                  and          tp, tp, s3
                  slt          zero, s6, sp
                  mul          t4, t3, ra
                  fsub.s       ft11, fa5, ft9
                  slli         zero, a5, 31
                  fsgnj.s      ft2, fs10, ft10
                  fcvt.wu.s    a6, ft11, rdn
                  xori         s7, a0, -908
                  fsqrt.s      fs0, fs0
                  sltu         s7, a3, a5
                  srl          a7, s7, s6
                  sll          s2, t5, s7
                  fmul.s       fs5, ft2, fa4
                  fcvt.s.w     ft5, ra
                  and          t3, s8, a7
                  div          s8, sp, t3
                  addi         a6, s8, 379
                  slti         ra, tp, -810
                  sub          s7, s11, a0
                  fmul.s       ft1, fa1, ft10, rmm
                  feq.s        s6, ft10, ft4
                  and          a1, s0, a3
                  fmul.s       ft11, fa7, fa7, rdn
                  slti         s11, a4, 1784
                  xor          t4, ra, gp
                  srli         s3, s1, 7
                  fmul.s       ft7, ft2, fs10
                  nop
                  remu         t5, zero, t0
                  fclass.s     s6, fa0
                  fdiv.s       ft1, fa3, fs8, rmm
                  srl          s2, a1, s11
                  remu         a3, t2, s9
                  xori         s2, t2, -1920
                  fmax.s       fa4, fs4, fs3
                  divu         s10, s0, t4
                  sltu         a0, s8, s5
                  fcvt.wu.s    zero, ft9, rmm
                  mulhu        t4, s0, s2
                  slli         t1, s8, 3
                  fsgnjn.s     fs1, fs7, fs2
                  or           t2, a1, a4
                  fmin.s       ft11, ft9, ft5
                  fcvt.s.wu    fs6, a2
                  nop
                  add          s8, a6, t4
                  srl          a6, s10, gp
                  mul          tp, a0, t5
                  and          s10, a6, s4
                  xor          t3, gp, tp
                  sub          t5, s2, gp
                  nop
                  fsgnjx.s     ft8, fs1, fs7
                  fsgnj.s      fa3, fa5, fa3
                  fsgnj.s      ft9, fs1, fa0
                  fsgnj.s      fa7, fa1, fa7
                  slti         a3, a4, 50
                  fsgnj.s      ft0, ft4, fs9
                  slt          s9, s3, t4
                  fmin.s       fa6, fs6, ft5
                  remu         s2, s0, a0
                  mulhsu       s5, a6, t2
                  flt.s        s11, fa3, ft1
                  div          a4, s11, a5
                  fsgnjn.s     ft8, ft5, fs10
                  fmax.s       fs2, ft9, ft1
                  sll          gp, t1, s8
                  fle.s        t3, fs6, fs2
                  div          a7, a4, s3
                  fle.s        a5, ft11, ft6
                  addi         a7, s8, 515
                  slli         a4, s10, 7
                  srl          s11, zero, t4
                  feq.s        t3, ft1, ft8
                  fcvt.s.w     fs0, t1
                  slti         s2, t4, 1464
                  xori         t5, zero, 1425
                  slli         s0, a4, 13
                  fsub.s       fs0, fa0, fs5, rmm
                  mulhu        a6, a4, t2
                  and          s8, a7, a3
                  fmin.s       fa0, ft8, ft2
                  srl          s2, s0, ra
                  fcvt.s.w     fs2, s11, rmm
                  div          t3, a0, ra
                  nop
                  fle.s        s1, fs2, fs4
                  mulhu        s9, ra, gp
                  add          s10, a2, a0
                  fcvt.wu.s    a3, ft2
                  fsgnjx.s     fa4, fa4, fa4
                  xor          t6, a3, t2
                  fsqrt.s      fs4, fa7
                  sll          s6, tp, t0
                  mul          s6, t5, s11
                  auipc        s11, 734129
                  lui          s5, 740263
                  fcvt.s.w     ft5, t6
                  fcvt.wu.s    tp, ft10
                  fdiv.s       ft1, fa4, fa7
                  srl          s8, s9, s3
                  and          s10, t3, t5
                  slli         t2, t1, 28
                  or           t3, a6, a1
                  mulhsu       zero, t2, s9
                  srl          s2, t6, t2
                  fsgnj.s      fs8, fs4, ft6
                  rem          s0, s4, zero
                  sub          gp, s3, zero
                  fclass.s     s7, ft11
                  lui          a3, 193577
                  rem          a3, s8, a1
                  fclass.s     t2, fa3
                  fclass.s     s10, fs1
                  mul          s11, s7, t4
                  sll          s9, t3, a5
                  or           a4, tp, t3
                  add          a0, s3, a1
                  fmul.s       ft7, fa5, fs10
                  or           a4, a0, t6
                  fsgnjn.s     fa4, fa7, fa3
                  slt          s8, s11, a1
                  sll          a4, s10, t3
                  mulh         a4, s9, gp
                  sltiu        a4, sp, 1074
                  divu         a0, a4, a0
                  ori          t1, s9, -618
                  srl          t3, a1, ra
                  fmin.s       fs10, fs9, fs5
                  mul          a4, a6, s9
                  fmin.s       ft11, ft6, ft10
                  fmul.s       fs5, ft10, fs4
                  srai         a6, t1, 22
                  fcvt.wu.s    t6, fs10, rtz
                  mulhu        t4, t5, t5
                  ori          s6, s6, 1978
                  nop
                  feq.s        ra, fs4, ft10
                  add          a0, s8, tp
                  sll          t5, s2, a4
                  fadd.s       ft5, fa1, fa0
                  fsgnjn.s     fa1, fs11, fa4
                  fmin.s       ft11, fa7, fs2
                  nop
                  rem          zero, t0, s2
                  feq.s        a6, ft11, ft11
                  mul          s5, s0, a5
                  fcvt.w.s     s0, fa1
                  fcvt.wu.s    t2, ft0, rmm
                  fsgnj.s      ft3, ft4, ft5
                  fsgnjn.s     fa0, fs0, fs4
                  auipc        s3, 246775
                  xori         s1, a7, 281
                  auipc        s11, 972975
                  fmv.x.w      t4, fa1
                  sltiu        ra, s8, 1744
                  fclass.s     a0, fa2
                  fcvt.wu.s    t1, fa6
                  divu         s7, a5, t0
                  feq.s        s11, fa5, fa4
                  flt.s        gp, ft8, fs7
                  ori          s11, a2, 325
                  fcvt.w.s     s5, ft3, rmm
                  feq.s        s1, fa0, ft4
                  fmul.s       ft7, fa4, fa5
                  flt.s        a4, ft4, fa1
                  fle.s        s6, ft9, ft5
                  remu         s3, s10, a6
                  fsub.s       fa4, ft10, fa5, rne
                  and          tp, s6, s3
                  slli         t1, tp, 19
                  srl          tp, a6, a7
                  fsgnjn.s     fs10, fs0, fa0
                  sra          a5, s0, t0
                  nop
                  mulhu        s10, s11, t2
                  fsgnjx.s     ft10, fa0, fa2
                  rem          s3, a1, t3
                  nop
                  sub          s11, s0, s11
                  fadd.s       fs6, ft0, fs10, rmm
                  fmax.s       ft2, ft2, fa3
                  fadd.s       fs6, fa3, fs2
                  fsgnjn.s     ft2, ft6, fa5
                  slt          s10, t1, t4
                  nop
                  xori         gp, s1, -1423
                  andi         t5, a1, -1455
                  feq.s        tp, fa2, fs10
                  mulhsu       t1, t4, s11
                  sra          s8, a3, s8
                  mulhsu       sp, sp, s2
                  ori          s10, tp, -1809
                  or           gp, s8, t6
                  ori          s1, a0, -1977
                  add          gp, s11, s7
                  add          t1, sp, gp
                  mul          a0, s11, a5
                  sltu         s2, s2, a7
                  fmv.w.x      fs2, tp
                  sra          a5, s2, a7
                  fcvt.w.s     a1, fa1
                  feq.s        a4, ft11, ft7
                  fmv.x.w      a6, fs2
                  sra          s5, s10, a3
                  fsqrt.s      ft9, fs2
                  fcvt.s.wu    ft1, s10, rdn
                  mulhsu       t3, t1, s2
                  fdiv.s       fa5, ft6, fs11
                  nop
                  fdiv.s       fs5, fs2, fs0
                  slli         sp, ra, 12
                  feq.s        t6, fs11, ft11
                  fsqrt.s      ft7, ft5
                  auipc        t4, 346610
                  sll          s10, s11, s1
                  fcvt.wu.s    s5, ft3, rtz
                  sll          s3, a5, sp
                  fmv.x.w      ra, fa5
                  remu         s8, s2, s10
                  add          s1, t6, a3
                  slli         s10, t5, 25
                  andi         t3, a2, 884
                  remu         a0, tp, a5
                  flt.s        a7, fa0, fa7
                  fsqrt.s      ft9, ft2
                  fsgnj.s      ft6, fs6, fs3
                  slli         a3, t3, 28
                  mulh         s0, t0, t2
                  sll          a1, zero, a1
                  sltiu        s2, s10, 980
                  fadd.s       fa6, fa4, fa6
                  fclass.s     a3, fa3
                  remu         t1, s4, t2
                  fsgnjn.s     ft3, fa6, ft1
                  slt          ra, a5, s6
                  fsqrt.s      fs3, ft2
                  slti         t3, a5, 293
                  fmul.s       fs9, fs11, fs6, rne
                  div          s8, s11, s5
                  div          s0, a6, t1
                  fsub.s       fs2, fs2, ft7, rne
                  sra          s11, a5, gp
                  mulh         t5, a6, a0
                  fclass.s     s8, fs10
                  srli         ra, a3, 18
                  fadd.s       ft6, ft4, ft7, rtz
                  feq.s        s8, fs0, fa7
                  feq.s        s2, fs7, fa6
                  fadd.s       ft6, ft8, fs10, rtz
                  xori         s7, a5, -490
                  div          a0, s0, t4
                  and          a7, ra, s6
                  mulh         s2, a2, t4
                  fle.s        a5, ft8, fs0
                  fmin.s       fa4, fa1, ft5
                  sltu         a1, a5, s6
                  fsqrt.s      ft4, fa7, rdn
                  slt          s2, t6, s3
                  fsgnj.s      fs5, fs9, ft7
                  xor          sp, t6, s3
                  lui          t4, 666027
                  fmax.s       fs3, ft10, ft1
                  add          s11, t0, a2
                  feq.s        a7, fa1, ft6
                  slti         s2, t4, -1159
                  slt          s3, t0, t0
                  mulhu        s5, s7, a5
                  fmin.s       fa5, ft7, fa2
                  fcvt.s.wu    fs9, s8
                  fmv.w.x      ft11, a5
                  srai         s11, gp, 12
                  slt          gp, a6, t5
                  add          s9, s11, gp
                  fmv.x.w      ra, fa0
                  divu         s2, s10, t2
                  remu         zero, s10, s11
                  andi         gp, s11, -1332
                  fmv.w.x      fa6, ra
                  fcvt.w.s     s10, fa5, rne
                  srl          s9, t4, a2
                  fsqrt.s      fs7, fs5, rdn
                  remu         s3, s1, ra
                  fsgnjx.s     fa1, ft8, fs3
                  fsgnjx.s     ft9, fs1, fs10
                  srai         s2, s10, 23
                  fmin.s       ft0, fa4, fs5
                  fmin.s       fs2, fa3, fa7
                  or           s0, a5, s10
                  fle.s        a1, ft0, ft2
                  fsgnjx.s     fa6, ft4, fa4
                  fadd.s       fs3, fs11, fs5
                  slli         a0, s10, 21
                  xor          s10, a5, a1
                  fmv.w.x      ft3, a2
                  srli         s6, a3, 14
                  fdiv.s       fa6, ft8, fs5, rne
                  fcvt.s.wu    ft9, a2
                  fmv.w.x      fs5, a6
                  remu         s6, s8, a5
                  mulhu        gp, t4, t4
                  mulh         s5, s4, ra
                  andi         s7, ra, -425
                  fclass.s     zero, ft10
                  fsgnjx.s     ft10, ft8, fs11
                  remu         a7, s0, a6
                  add          t5, s5, a2
                  sltu         tp, s9, zero
                  sltiu        s3, s3, -346
                  lui          t4, 42420
                  and          s1, tp, t6
                  fcvt.w.s     s10, ft9
                  srli         t3, s3, 28
                  fmin.s       fa7, fs1, ft9
                  sra          s11, t0, a7
                  mul          s3, zero, a3
                  fadd.s       ft11, fa0, fa0, rup
                  fle.s        t4, ft3, fs10
                  mulhsu       ra, zero, gp
                  fsgnjx.s     fa1, fs6, fa3
                  fcvt.w.s     ra, ft6, rmm
                  mul          sp, tp, s1
                  rem          s7, a6, s8
                  mul          a7, zero, t1
                  mulhsu       t2, t4, s11
                  srai         t6, zero, 17
                  lui          s7, 175162
                  fsgnj.s      fs5, fs6, ft1
                  divu         t6, sp, s8
                  fsub.s       fa4, ft5, fa6
                  add          s1, s2, gp
                  fcvt.wu.s    s6, fa7
                  slli         a4, s6, 8
                  rem          t1, s7, t5
                  slti         s5, zero, 122
                  fcvt.s.w     fs5, t0, rne
                  xor          s5, s1, a5
                  fcvt.s.w     ft1, t2, rup
                  fsqrt.s      ft9, fs9
                  fadd.s       fs7, fs6, fs10, rdn
                  xori         a6, t3, -1544
                  fclass.s     s7, ft1
                  fmax.s       fa6, fs5, ft10
                  sll          s7, a7, a0
                  andi         s0, s1, 1017
                  flt.s        t6, fa2, fs9
                  fcvt.w.s     a1, fa7
                  div          s7, a7, s1
                  andi         s5, a4, -619
                  fcvt.wu.s    s7, fa7, rup
                  mulhu        s11, a5, tp
                  srai         a6, t3, 27
                  fclass.s     s9, fs0
                  and          s3, ra, a0
                  slt          t2, a5, s7
                  andi         s10, s5, -172
                  fsgnjx.s     fa2, fa4, fs4
                  addi         a6, zero, 537
                  div          s1, s2, t2
                  andi         s10, t6, 984
                  srl          t5, a7, tp
                  feq.s        t5, fs8, fa2
                  ori          s7, s5, 85
                  rem          s11, s6, zero
                  fmv.x.w      s7, fa6
                  rem          a3, t1, t1
                  lui          t1, 186959
                  fmv.w.x      ft10, s0
                  slti         t3, sp, 1182
                  srai         s8, t2, 9
                  feq.s        sp, ft2, ft1
                  div          s3, gp, t5
                  fclass.s     s1, fs11
                  fcvt.s.wu    fa2, s2, rdn
                  fmv.x.w      s10, fa2
                  fcvt.s.w     fs10, s9, rup
                  srl          a3, a1, s6
                  fadd.s       ft7, ft2, fs2, rtz
                  fsub.s       fa4, ft2, fs9, rup
                  fcvt.wu.s    t6, ft7
                  feq.s        a5, fa3, ft5
                  xor          s10, s5, s2
                  or           t1, a1, s8
                  remu         a6, t4, a0
                  ori          a6, s3, 375
                  mulhu        s3, t4, s7
                  srai         a5, s10, 3
                  addi         a1, a0, -826
                  fmv.x.w      a3, fa0
                  mulhu        a6, tp, t4
                  nop
                  fmax.s       fs6, fs5, ft2
                  fsgnjn.s     fa2, ft6, fs4
                  fcvt.wu.s    t6, ft5
                  srl          t2, t5, s10
                  ori          a1, s6, 68
                  fsgnjx.s     fa6, fs10, ft1
                  fle.s        a0, fs9, ft4
                  fsqrt.s      fa3, ft7
                  andi         t2, t6, -1175
                  flt.s        s2, ft11, ft9
                  mul          t4, s7, t0
                  rem          s8, t3, a0
                  mulh         a7, zero, gp
                  fsqrt.s      fs2, fs10, rup
                  xori         t5, t3, 388
                  srl          s10, t2, zero
                  sltu         s5, s0, s9
                  slli         t1, t5, 1
                  srl          s0, a0, t5
                  slt          s3, a6, a7
                  divu         s9, s4, s4
                  lui          t4, 399345
                  fdiv.s       fa6, fs11, fs5
                  feq.s        s5, fa0, fa6
                  srai         t3, s2, 22
                  xori         s11, a0, 1421
                  fmul.s       fs1, fs1, ft9, rne
                  fle.s        s6, ft1, fs3
                  mulh         t2, s2, gp
                  lui          a6, 610243
                  fsgnj.s      fs9, fa3, ft3
                  mul          s1, sp, t1
                  mulh         a6, s0, t3
                  rem          a3, gp, gp
                  sll          ra, s11, ra
                  div          s10, a0, s9
                  fmv.x.w      a7, fa0
                  div          s6, s9, tp
                  xori         s5, tp, -449
                  srl          s10, s5, s9
                  sltiu        t6, s2, -1498
                  or           s1, a2, a0
                  fmv.w.x      fs9, s11
                  slt          a7, t1, a3
                  fcvt.w.s     a1, fa1, rtz
                  slt          t6, t5, t6
                  flt.s        s2, fs4, ft6
                  mulhsu       s9, s3, t1
                  mulh         a7, t3, s5
                  sltu         tp, s9, a6
                  fsqrt.s      fa3, fa7
                  fcvt.s.w     ft6, zero, rtz
                  and          a7, s0, s1
                  mul          t3, ra, gp
                  div          a6, s1, s8
                  nop
                  nop
                  sltiu        s1, a6, -1547
                  remu         a4, tp, a4
                  and          tp, t6, a1
                  rem          a7, a4, a1
                  xori         t3, s11, 16
                  fsgnjx.s     ft8, fs6, fa2
                  fmax.s       fs11, ft6, fa3
                  xori         a1, s11, -624
                  andi         t6, a5, 1051
                  srl          s2, a5, s6
                  andi         gp, s8, 31
                  slli         t3, zero, 18
                  div          s11, a7, ra
                  srai         s3, s8, 16
                  mul          a7, a6, zero
                  slt          s7, t5, sp
                  fclass.s     s8, fs6
                  mulh         t2, t3, t3
                  fcvt.wu.s    sp, fs10
                  fmin.s       ft4, ft10, ft7
                  srl          t5, gp, t5
                  and          t1, s6, a2
                  sltu         tp, a5, t0
                  sll          a4, t6, a3
                  mul          s10, gp, a1
                  fclass.s     a0, fs5
                  sub          s10, t3, t2
                  fmin.s       fs0, fa4, fs10
                  auipc        s10, 106040
                  fdiv.s       ft2, fs1, ft0, rtz
                  srl          s3, s9, s0
                  slt          s11, t6, s7
                  or           gp, a5, s4
                  slt          t6, t2, s5
                  slli         a3, ra, 27
                  fmul.s       ft9, ft4, ft11
                  and          s8, s5, s10
                  rem          s8, s1, s5
                  rem          gp, a0, s0
                  slti         a5, a0, 1814
                  ori          tp, a3, -1770
                  xori         t1, s8, 411
                  divu         a0, s2, s0
                  fsub.s       fs8, ft8, fa6
                  fcvt.w.s     s0, ft11, rne
                  fsgnjn.s     fa1, ft4, fa1
                  rem          s9, s9, s11
                  fadd.s       fa7, ft1, ft3, rmm
                  fsub.s       ft5, fs10, ft4, rup
                  fsgnj.s      fs10, fs5, fs10
                  fadd.s       fa6, ft1, ft10
                  rem          a6, s1, s6
                  flt.s        s11, fs0, ft1
                  and          a7, s11, s3
                  srl          a3, zero, t2
                  fadd.s       fa7, fs7, fs8
                  div          s10, gp, tp
                  fadd.s       ft1, fa1, fs8, rmm
                  fadd.s       ft2, ft11, fs5, rmm
                  feq.s        t3, fs3, fs6
                  fsqrt.s      fa0, fa2
                  slli         gp, s5, 11
                  fsub.s       fs5, fa5, fa0
                  ori          a0, s9, 1468
                  fmin.s       fs6, ft8, fs1
                  fcvt.wu.s    a7, fa1, rne
                  fcvt.s.w     ft4, t4
                  xori         s6, a7, 649
                  sll          a1, t5, a6
                  or           a6, a2, t4
                  srli         s0, zero, 5
                  slti         zero, s0, -694
                  add          s9, a2, zero
                  fle.s        a1, ft10, fa7
                  fmax.s       ft0, fs1, ft1
                  sra          a1, t6, a4
                  fmv.w.x      ft8, ra
                  sltu         s6, s5, s11
                  lui          sp, 597532
                  mulh         s6, tp, a1
                  fle.s        ra, fs1, ft2
                  and          s0, ra, a3
                  fdiv.s       fs7, fs11, fa0, rmm
                  sra          a5, t5, s5
                  fsgnjn.s     fs6, fa3, fa7
                  fsgnjn.s     fs3, fs1, ft2
                  slti         t1, ra, -1004
                  fsgnjx.s     ft3, ft9, fs10
                  fadd.s       ft10, ft4, fa4
                  fcvt.wu.s    a0, fs4
                  fmv.w.x      fs9, a3
                  fmv.w.x      fa2, zero
                  fdiv.s       ft8, fa4, fs6
                  div          t3, gp, a1
                  mulhu        a1, a5, t3
                  srl          a5, t3, s9
                  srai         s1, a5, 28
                  auipc        t3, 935246
                  div          a1, s7, s4
                  sltiu        zero, s3, 171
                  fmax.s       ft8, fs5, fs2
                  nop
                  fmv.w.x      fa5, s0
                  feq.s        s1, ft2, ft7
                  lui          s3, 902992
                  fmin.s       ft9, fs1, fa4
                  fle.s        s2, ft10, fs10
                  slti         tp, t2, -371
                  fadd.s       fa5, fa0, ft0
                  addi         a4, s10, 1367
                  addi         t6, t5, 1164
                  addi         t3, a5, 866
                  fcvt.w.s     a7, ft5
                  fsgnj.s      fs10, fa7, ft0
                  xori         s8, a4, -28
                  sll          t6, ra, a0
                  fmv.w.x      ft2, s1
                  divu         t3, t3, s3
                  mulh         s11, s3, t3
                  mulh         t1, s7, zero
                  fdiv.s       fa4, fa6, fs0
                  srai         s2, s2, 17
                  fle.s        s7, fs1, ft5
                  fmin.s       fa1, ft11, fa6
                  fdiv.s       ft6, fs6, ft8
                  sll          s7, s0, a6
                  fcvt.w.s     s1, ft0, rne
                  mulhu        ra, a6, s10
                  mulhu        a0, a5, s2
                  div          s3, a7, s9
                  fsgnjn.s     fs6, fa2, fa6
                  addi         s8, a5, -757
                  sltiu        s11, t5, 464
                  sub          s6, t4, s10
                  fadd.s       ft6, ft9, fa3
                  fmin.s       fa2, fa7, fa3
                  fadd.s       fa7, ft10, fs0
                  ori          sp, a2, -1435
                  srl          ra, t1, t4
                  sll          s8, t2, t3
                  lui          a1, 851947
                  lui          s8, 235111
                  ori          a5, a3, -1740
                  srl          s2, s1, t5
                  fdiv.s       fs10, ft9, fs10
                  divu         s5, s5, t6
                  fmul.s       fs10, fs3, fa4, rmm
                  feq.s        s8, fa1, fs7
                  fsgnjn.s     fs8, fs4, ft6
                  srai         t2, t2, 29
                  add          sp, t2, a5
                  slti         t3, t6, 1956
                  srai         s5, t4, 21
                  feq.s        s10, ft9, fa3
                  divu         s3, s5, s11
                  addi         zero, ra, -1936
                  rem          a5, s8, a5
                  fcvt.w.s     t4, fa4
                  or           sp, ra, a5
                  auipc        ra, 941569
                  mul          s9, tp, sp
                  fadd.s       fs8, fa6, ft7, rup
                  srl          s11, t0, s0
                  feq.s        a3, fs9, fa5
                  fsgnjn.s     ft4, fs6, fa4
                  lui          sp, 890683
                  slti         s6, s2, 688
                  div          s5, s5, gp
                  mulh         s0, t0, s6
                  lui          t3, 296815
                  fsgnj.s      fs7, fa7, ft10
                  slli         t6, a2, 31
                  mulhsu       s7, zero, t4
                  srai         s1, a3, 11
                  fmul.s       fa6, fs10, fs6
                  and          a0, s11, s1
                  divu         a4, tp, s3
                  fmv.x.w      s5, ft9
                  xor          s10, s1, s10
                  fsgnjn.s     fs2, fs6, fa7
                  andi         ra, s5, -1817
                  srli         s1, t4, 18
                  add          sp, gp, a6
                  fsgnj.s      ft3, fs1, fa3
                  fsqrt.s      ft10, fa3
                  slti         a4, t5, 2018
                  rem          t3, t2, gp
                  andi         t6, sp, 261
                  remu         t6, t3, t6
                  or           s7, s11, s4
                  addi         s1, a4, 26
                  fclass.s     gp, fs9
                  feq.s        a1, ft10, fs5
                  xori         ra, t2, -191
                  mul          s8, s8, a0
                  mulhu        s10, sp, gp
                  xori         zero, s10, -838
                  addi         s7, s10, -31
                  mul          s10, a0, s1
                  xor          s9, a5, t1
                  slti         s2, sp, 757
                  xor          s6, t2, tp
                  fsgnjn.s     fa5, fs5, fs0
                  sub          a0, s1, s4
                  sll          t1, s9, a1
                  divu         t1, s9, zero
                  lui          ra, 741845
                  mulh         t3, sp, zero
                  srli         s3, s4, 8
                  srl          a5, s4, s2
                  fsgnj.s      fa5, ft5, fs2
                  slli         s0, zero, 7
                  xori         ra, s1, -918
                  fsqrt.s      ft9, fa5
                  ori          s0, a7, 1309
                  xor          ra, s11, s6
                  mulhsu       a6, gp, zero
                  flt.s        a7, ft1, ft8
                  srl          s2, a0, a5
                  or           s3, t4, t1
                  fmin.s       fs3, fa6, fs0
                  rem          zero, s11, t6
                  sltiu        a5, a2, -1752
                  fcvt.w.s     s6, ft4
                  fmv.x.w      t5, fs3
                  fcvt.wu.s    sp, ft3, rtz
                  fadd.s       fs2, ft8, fa0, rtz
                  fsgnjn.s     ft6, fs7, fs8
                  srl          t4, t2, t1
                  sra          s2, gp, ra
                  fclass.s     t4, fs3
                  sra          s2, a6, s8
                  fcvt.s.w     fs6, a6, rne
                  mulhu        tp, zero, s4
                  andi         a1, a3, 63
                  sra          t4, tp, a4
                  lui          s11, 696008
                  fsqrt.s      ft7, fs11, rtz
                  remu         s10, s10, t5
                  or           a0, zero, s4
                  or           s5, s3, zero
                  remu         a7, t6, zero
                  andi         s6, a3, 1982
                  fmv.w.x      ft4, a7
                  auipc        t3, 492397
                  sub          t6, a1, s9
                  ori          t4, t6, 1499
                  slti         a0, t2, 1199
                  slt          a5, t2, zero
                  andi         s10, s2, -46
                  fmax.s       fs2, ft4, fs7
                  xor          s7, zero, t3
                  fmin.s       ft4, fs9, fa3
                  xor          a0, s9, gp
                  flt.s        s1, ft0, fa1
                  sub          a5, s7, s2
                  fcvt.s.w     ft10, t3, rup
                  srai         ra, t0, 15
                  sll          t5, s1, t1
                  fmin.s       fs8, fs5, fa4
                  mulhsu       sp, s9, t1
                  nop
                  sltiu        t4, sp, -747
                  srli         s1, t0, 30
                  or           s1, sp, s0
                  mul          s8, a1, t0
                  fcvt.w.s     s2, fa7, rtz
                  rem          a3, s8, a4
                  rem          s8, s4, s11
                  divu         s1, t1, s10
                  slt          a7, s8, gp
                  sltu         tp, a5, a5
                  mul          s8, a4, s4
                  srai         gp, t4, 28
                  ori          t5, t0, -1849
                  fsgnjx.s     fs1, fs8, fs4
                  slti         t1, ra, 1006
                  remu         t4, tp, s0
                  xor          a0, t6, s3
                  feq.s        zero, ft3, fs11
                  slt          s9, s2, a4
                  sub          a5, t6, t1
                  mul          s6, s7, a7
                  fsgnj.s      fs2, fs5, fs3
                  flt.s        sp, fs2, ft11
                  fmax.s       fs6, fs11, fa5
                  mulh         t2, ra, a7
                  fcvt.w.s     s10, ft8, rup
                  slti         s6, zero, 1069
                  mulh         a3, a4, s0
                  xori         s9, s9, 984
                  fadd.s       fs3, fs8, fa1
                  sra          s2, zero, t1
                  fadd.s       ft10, ft5, fs10
                  sub          s11, s0, ra
                  fmax.s       ft1, ft8, fs11
                  lui          a3, 936894
                  mulhsu       ra, zero, s0
                  and          sp, s7, a7
                  addi         zero, a4, 869
                  nop
                  slt          t1, a5, a3
                  fmin.s       ft10, fa2, ft6
                  lui          a5, 597001
                  sra          t2, s11, t2
                  fmv.x.w      a6, ft4
                  sub          t6, a2, s1
                  divu         s7, s2, s1
                  fdiv.s       ft0, ft2, fa7
                  mulh         s3, a7, t3
                  fsub.s       fs0, fa6, ft10, rmm
                  fle.s        s5, ft2, fs3
                  fsgnj.s      fs4, fa5, fs7
                  mulh         s8, t2, a7
                  fsgnjn.s     ft7, fa6, fa3
                  remu         s8, t0, a5
                  fmin.s       fs7, fs3, fs6
                  or           t3, sp, a5
                  divu         a1, s3, s8
                  fsqrt.s      fs6, fa6, rmm
                  addi         a3, s2, -1537
                  fcvt.s.w     fa1, s3, rne
                  xori         s8, s5, -895
                  sltu         t3, t4, ra
                  fle.s        s5, fs6, ft0
                  mulhsu       ra, s2, a6
                  or           s10, tp, a7
                  sra          s9, a0, ra
                  fdiv.s       ft2, fs8, ft7, rne
                  auipc        a7, 714352
                  xori         s11, gp, -953
                  fcvt.s.w     ft2, s6, rup
                  mul          s1, zero, t4
                  nop
                  ori          sp, a0, 2020
                  fmv.x.w      a6, fs2
                  slti         s2, s8, -469
                  mulhu        ra, s3, a6
                  andi         t3, sp, -1288
                  sltiu        gp, t1, -1698
                  fsqrt.s      fa4, fs10, rdn
                  auipc        s5, 419610
                  fcvt.s.wu    ft7, s4
                  sub          gp, s3, zero
                  auipc        t1, 631813
                  slti         tp, zero, 911
                  fsub.s       fs9, ft11, fa7, rne
                  remu         t3, a5, s10
                  srli         s5, t6, 28
                  lui          a0, 922334
                  div          s8, s5, t4
                  rem          t5, tp, gp
                  mul          a3, s1, a3
                  addi         s7, zero, 199
                  fsgnjn.s     fs6, fs4, fs8
                  fle.s        t6, ft7, fs7
                  feq.s        sp, ft1, fs1
                  div          a3, t6, s5
                  flt.s        gp, fa4, ft2
                  fsgnjn.s     ft5, fs1, ft9
                  fmax.s       fs5, ft0, fs6
                  sltu         s8, t5, s1
                  fcvt.wu.s    a3, fa0
                  slli         t5, s6, 27
                  ori          s6, s7, -1028
                  mul          gp, sp, gp
                  sltiu        s3, tp, 1628
                  mulhu        t5, s10, a2
                  fdiv.s       ft9, ft10, ft10, rmm
                  slti         t6, a1, 23
                  fcvt.s.w     fa4, s8
                  lui          s9, 730077
                  fcvt.s.w     ft11, t1
                  ori          s5, tp, 1657
                  mul          a5, gp, t3
                  fcvt.s.w     ft9, s11
                  remu         s7, s10, s10
                  andi         a5, a3, 1495
                  srai         a3, s10, 27
                  and          a6, s2, s6
                  lui          s1, 695170
                  ori          s7, s1, 665
                  auipc        t5, 803457
                  remu         t4, a7, a5
                  lui          a0, 584458
                  and          s10, s6, t3
                  ori          s6, t2, -1372
                  xor          t4, a5, s10
                  fle.s        a4, fs2, ft1
                  fmul.s       ft10, ft9, fa7, rup
                  mulhsu       a7, s0, gp
                  xor          t6, s0, t3
                  remu         a4, s2, t4
                  xori         tp, s9, 293
                  div          sp, t2, s6
                  xori         a5, sp, -1389
                  fadd.s       ft2, fs3, fa4, rup
                  auipc        a7, 1025071
                  feq.s        zero, fs3, fa7
                  fsgnjn.s     ft10, fs0, fs11
                  sra          a1, t5, ra
                  fsub.s       fa3, fs7, ft6, rtz
                  fsgnjx.s     fs7, fs4, fs1
                  fcvt.wu.s    t1, fs3
                  sub          s7, s4, s5
                  slti         zero, a3, 1705
                  xori         zero, s5, -734
                  nop
                  srl          t1, t4, s6
                  srli         s0, s4, 15
                  fcvt.w.s     s3, fa7
                  xor          t5, a1, tp
                  fadd.s       ft1, fa0, fa6, rdn
                  rem          s0, a1, t5
                  mulhsu       a3, sp, a5
                  flt.s        a1, ft1, fa0
                  feq.s        sp, fa5, fs0
                  auipc        a4, 1008388
                  mulhsu       a1, gp, a6
                  add          gp, s11, a1
                  fle.s        s10, ft5, fa7
                  fmv.x.w      a3, fs8
                  fsgnj.s      fa3, ft10, fa5
                  fmv.w.x      fs1, a1
                  slt          t4, s1, a3
                  srai         s1, s0, 7
                  feq.s        t6, fs1, fs3
                  andi         t2, a6, -926
                  fadd.s       fs7, ft1, fs8
                  srl          a7, t3, a3
                  rem          a0, s6, s10
                  fdiv.s       fs9, fs1, ft0, rne
                  fcvt.wu.s    zero, fa5, rmm
                  fcvt.wu.s    gp, fs10, rne
                  and          gp, s5, s1
                  divu         a4, s2, a4
                  fdiv.s       fa7, fa3, fa0, rdn
                  fsub.s       fa3, ft11, fs7, rmm
                  or           a0, a7, tp
                  fadd.s       ft0, fs1, fs4
                  fmv.x.w      a1, fs5
                  fmv.x.w      a1, ft0
                  fcvt.s.w     ft6, a0
                  fcvt.s.w     fa1, t6, rmm
                  fcvt.w.s     t2, ft2, rup
                  feq.s        a6, fs5, ft10
                  mulhsu       t2, a3, sp
                  slti         s10, sp, -1185
                  mulh         a4, s7, ra
                  mul          s8, a1, s5
                  div          a3, s5, sp
                  mulh         a1, t3, s11
                  fdiv.s       ft3, fa6, fa6, rtz
                  auipc        t6, 966560
                  auipc        a6, 280097
                  fsgnj.s      ft2, fs8, ft1
                  fcvt.w.s     t2, fs3
                  div          s2, t3, sp
                  fcvt.s.wu    ft3, t3
                  fmv.x.w      t1, ft11
                  fmax.s       fa0, ft6, fs10
                  sub          s8, s10, a0
                  slli         t2, a7, 28
                  fsgnjx.s     ft11, ft7, ft5
                  xor          tp, s6, zero
                  xori         s10, s6, -1473
                  fsgnjn.s     fs8, fa4, ft3
                  srl          s10, a6, sp
                  and          s1, t4, a7
                  fsgnjn.s     fs8, fa3, fs2
                  fmul.s       ft4, fs10, ft6
                  fmax.s       fa4, fs8, fs9
                  and          tp, t6, a3
                  mulh         tp, s10, a7
                  fsub.s       fs10, fa5, ft7
                  auipc        s5, 858558
                  fmv.w.x      ft8, s0
                  rem          a4, s10, a4
                  fmax.s       fs5, fs1, ft3
                  fcvt.s.w     fa1, a5
                  remu         t2, s0, t3
                  divu         s10, a0, t4
                  remu         tp, gp, a0
                  remu         s2, s11, s2
                  lui          s5, 76371
                  fsgnj.s      fa7, ft10, ft1
                  fmin.s       fs7, fs0, ft7
                  srl          s2, ra, s11
                  fsub.s       fs1, ft5, fs3
                  sll          a7, s6, s6
                  mul          a0, s7, s0
                  flt.s        s0, ft10, fs0
                  fmin.s       ft8, fs11, fa5
                  sll          a1, s6, ra
                  divu         s3, s9, s0
                  rem          s7, t6, t1
                  sll          a4, s2, s2
                  addi         t6, t0, -1420
                  sltu         s0, gp, s4
                  srai         sp, t4, 31
                  fcvt.w.s     s10, ft4, rmm
                  sltiu        gp, t1, -1949
                  remu         tp, t5, t1
                  div          s5, t0, s5
                  fcvt.w.s     t1, fa6
                  fle.s        a5, fa4, fa7
                  slt          s3, a7, s0
                  fsgnj.s      fs5, fa2, fs8
                  xori         t5, s6, 1829
                  lui          a7, 636694
                  sub          a5, tp, a7
                  slli         s7, a5, 24
                  slli         gp, a7, 25
                  divu         t2, a7, t1
                  fsgnjn.s     ft11, fa5, fs0
                  fdiv.s       ft4, ft11, ft4
                  fsgnjn.s     ft0, fs9, ft7
                  slli         s2, t2, 5
                  slti         t5, sp, 1579
                  fmv.w.x      ft7, a0
                  fmax.s       fs5, fs11, fs9
                  fdiv.s       fa4, fa6, fs4, rmm
                  fsub.s       ft4, fs3, fa0, rdn
                  fclass.s     t6, fs7
                  fcvt.s.wu    fs5, a2, rup
                  fmin.s       fs7, ft11, ft6
                  flt.s        a6, ft10, fs6
                  slt          t2, t4, t2
                  remu         a4, sp, t3
                  fcvt.s.wu    ft7, gp, rtz
                  feq.s        ra, fa7, fa5
                  sra          a3, sp, s7
                  slli         zero, t6, 14
                  sltiu        t1, s9, -671
                  remu         zero, s11, a6
                  fsqrt.s      fs2, fs1, rdn
                  srli         sp, a6, 31
                  sll          gp, t2, s0
                  nop
                  mulh         a4, a3, s2
                  sra          ra, a4, ra
                  and          s1, t5, a4
                  srli         t6, a1, 10
                  sltu         a1, s7, a6
                  fdiv.s       ft3, ft9, ft7
                  fsgnjx.s     ft4, fs5, fs11
                  ori          tp, s2, -282
                  fsgnj.s      fa4, fa6, fa5
                  sltiu        t3, s11, 449
                  fcvt.wu.s    a4, ft3
                  mulh         s2, s6, s8
                  nop
                  slti         s6, t6, -560
                  divu         t1, a0, s5
                  fmv.x.w      s10, ft1
                  remu         a1, t4, tp
                  fle.s        a1, ft0, fa4
                  flt.s        s3, ft10, ft0
                  addi         t3, t6, -1597
                  fcvt.s.w     ft1, a2
                  remu         s0, s4, s8
                  remu         s8, s4, s6
                  div          s7, t6, t4
                  fsub.s       ft7, fa6, fs10
                  rem          s8, s10, a6
                  fmv.w.x      ft3, tp
                  sltu         a6, ra, t2
                  xori         a3, s1, 547
                  fmv.w.x      fa4, s2
                  feq.s        s9, fs3, ft7
                  srli         ra, s6, 15
                  fsgnjn.s     ft1, fs11, fa6
                  fmv.w.x      fa0, tp
                  sra          s9, s3, s6
                  fmv.x.w      s3, fs2
                  fsgnjx.s     fa3, fa0, fs11
                  fclass.s     t5, fa6
                  fsgnjx.s     fa2, fs11, ft10
                  feq.s        a7, fs11, fs8
                  fsqrt.s      ft7, ft4
                  or           t6, a3, t6
                  sltiu        s9, s9, -463
                  ori          a5, a3, 665
                  ori          zero, ra, 1694
                  feq.s        s7, ft1, ft6
                  mulhu        t6, t1, a6
                  fsub.s       ft5, fs2, fs0
                  slt          a5, s3, ra
                  srai         sp, a3, 10
                  sra          s6, gp, a1
                  remu         s10, a3, t4
                  ori          ra, a3, -246
                  xor          a1, s4, t4
                  xori         s5, s2, 182
                  flt.s        sp, fs2, ft2
                  fmax.s       fs0, ft4, ft11
                  xori         a1, s6, 696
                  fsgnj.s      fs6, fa1, fa0
                  fsub.s       ft3, fs3, fs4, rmm
                  fmax.s       ft4, fs5, ft5
                  xori         a3, s11, -915
                  lui          s11, 602385
                  xori         zero, s5, -1409
                  fsgnjx.s     ft1, fa3, fs3
                  srli         a1, t4, 9
                  mulhsu       s3, t4, s6
                  rem          a1, t6, s0
                  sra          t4, t0, s10
                  sltu         gp, a7, s11
                  mul          s2, s2, t5
                  ori          a6, s2, -1925
                  fsgnj.s      fa1, fs7, fs5
                  srai         s1, s7, 0
                  or           s8, t0, a3
                  fclass.s     s5, fa5
                  fadd.s       fa3, fs3, fs6
                  sll          t5, a0, s0
                  fsgnjn.s     ft0, fs9, fs5
                  or           a7, s11, a5
                  fclass.s     s6, fs5
                  slti         t6, s9, -408
                  sra          s9, s2, s8
                  srai         zero, s8, 15
                  slli         s8, s9, 25
                  add          ra, s8, s11
                  fsgnj.s      fs10, fa1, ft3
                  slt          s1, s10, s8
                  fsgnjn.s     fs11, fs1, fa1
                  addi         t1, a0, -1513
                  fmv.w.x      fs4, s11
                  lui          t5, 903683
                  mulh         t5, s2, t6
                  fcvt.s.wu    ft7, ra, rmm
                  slti         t1, a6, 1365
                  remu         s11, t6, s4
                  and          a4, a4, a4
                  sra          a1, tp, zero
                  or           s8, sp, a1
                  mul          a5, a7, a4
                  and          gp, s0, a1
                  xori         sp, s6, -1148
                  fsqrt.s      ft6, fa5
                  fsub.s       fa4, fs7, fa5, rdn
                  feq.s        t2, fa1, ft2
                  mul          tp, s0, s7
                  fle.s        a3, ft8, fs9
                  fmin.s       fa4, fs1, fa5
                  mulhsu       t6, s5, gp
                  auipc        sp, 208255
                  and          s11, ra, t0
                  andi         s0, ra, -831
                  slti         s5, s8, -626
                  rem          s3, t0, s10
                  divu         s1, s11, a1
                  feq.s        sp, ft9, fs0
                  srl          t6, a6, zero
                  fadd.s       fs9, fs5, fa5
                  nop
                  slt          a1, ra, a2
                  addi         s6, t5, -723
                  mulhsu       s6, a3, s7
                  rem          s5, s11, a2
                  fmax.s       ft4, fa3, fs4
                  nop
                  srli         tp, ra, 12
                  sltu         t2, a5, t3
                  rem          s8, ra, t5
                  nop
                  fmv.w.x      fs8, t1
                  slli         s6, s2, 26
                  remu         a0, a1, a6
                  fsgnjx.s     fs5, ft6, ft6
                  nop
                  mul          s0, a7, t0
                  auipc        t2, 83595
                  fmul.s       fa0, fa0, fa1, rmm
                  slti         t3, s7, -1460
                  sltiu        a1, s7, -1133
                  sll          gp, t4, s10
                  slli         s2, ra, 13
                  fsgnjx.s     ft1, fs5, fa3
                  fsgnjn.s     fa6, fa3, fs5
                  xor          s11, t3, s9
                  addi         zero, a7, 1839
                  fcvt.w.s     a7, fs2
                  remu         a1, ra, s1
                  fdiv.s       fa3, fs10, ft2
                  divu         zero, a5, t4
                  slt          s3, a3, t4
                  srli         s5, sp, 4
                  flt.s        sp, fs1, fa2
                  or           s6, zero, t1
                  div          s9, a1, t6
                  fcvt.w.s     t1, fs9
                  divu         s0, t2, sp
                  feq.s        s11, ft9, fs10
                  fmax.s       ft3, ft1, ft3
                  fsgnjx.s     fs8, fa6, fa3
                  sltu         a6, t6, a2
                  mulhsu       s7, sp, t2
                  or           tp, tp, a6
                  auipc        s10, 915738
                  fmv.x.w      a1, fs6
                  fsgnjn.s     ft3, fs4, ft11
                  fclass.s     tp, fs11
                  xor          a4, s1, tp
                  sra          s1, s0, s8
                  fmv.w.x      ft0, t5
                  nop
                  fmv.x.w      s11, fa6
                  fcvt.s.wu    fs10, zero, rmm
                  fcvt.wu.s    s2, ft8, rtz
                  mul          t4, a0, a5
                  sltiu        s1, s5, -329
                  fmv.w.x      ft9, a6
                  fmax.s       fs8, fa5, ft10
                  mulhsu       t2, a1, s4
                  auipc        s1, 1012846
                  and          t2, a0, s4
                  mulhsu       a4, t6, t5
                  slti         ra, s8, 206
                  fmv.x.w      zero, fa4
                  flt.s        s9, ft11, fs1
                  addi         tp, a1, -1433
                  lui          a4, 413217
                  mul          s1, t0, t0
                  fadd.s       ft2, fs3, ft1
                  or           a5, tp, s11
                  mulhsu       s6, s9, s8
                  nop
                  fsgnjx.s     fs1, fs8, fa6
                  slli         s6, s4, 20
                  fsub.s       fs5, fa1, fs2, rup
                  lui          t3, 263473
                  fdiv.s       ft4, ft0, ft11
                  sub          s3, s6, gp
                  sra          s7, s6, a5
                  ori          a6, s2, -1688
                  flt.s        gp, fa7, fs1
                  srl          a6, t1, s1
                  fsub.s       fa5, fa5, ft10, rdn
                  fsub.s       fs4, fa2, ft4
                  xor          s10, s6, s11
                  sltu         ra, t1, a4
                  slti         zero, s5, 945
                  fmul.s       fs6, fs7, fa4, rdn
                  fclass.s     t2, fs11
                  xor          sp, t2, a0
                  sltiu        s9, t2, 1080
                  fcvt.s.wu    fs10, a5, rdn
                  div          t5, t6, a6
                  div          a1, s4, tp
                  fcvt.wu.s    tp, fs11
                  sll          zero, gp, zero
                  fsgnjx.s     fs1, ft1, fs3
                  div          s9, s9, ra
                  div          a4, s6, t6
                  sll          s11, s2, s0
                  remu         tp, a4, t0
                  fsub.s       fs4, ft4, ft6
                  fadd.s       fa2, ft7, fa7, rmm
                  slli         t6, a4, 22
                  sltu         a1, t0, t4
                  nop
                  fcvt.wu.s    gp, ft5
                  fcvt.w.s     s5, fa7
                  ori          a3, s3, -153
                  and          a1, gp, t6
                  sub          s0, a5, s6
                  fle.s        s7, fa4, fa4
                  feq.s        s7, fa2, fa6
                  sltiu        s2, gp, -1266
                  mulhu        s5, t0, s5
                  remu         t6, s0, s7
                  rem          s8, s5, tp
                  fcvt.s.wu    ft1, sp
                  fcvt.s.w     ft8, s8
                  fsqrt.s      ft9, ft9
                  sltu         zero, gp, t1
                  lui          s8, 878983
                  and          a6, a3, t1
                  or           t5, t5, a6
                  fcvt.s.w     fa3, tp
                  srl          tp, t3, a1
                  xor          s8, s0, a3
                  andi         t1, s8, -1596
                  xori         sp, a3, -1023
                  fsgnjn.s     fs2, fa5, fs10
                  fle.s        s7, fs8, ft10
                  fsgnjx.s     ft0, fa7, fs0
                  fdiv.s       ft7, ft4, ft0, rmm
                  add          s2, s0, s7
                  lui          t5, 504466
                  sltiu        t6, t6, -1296
                  sll          a5, t5, s4
                  fmv.x.w      ra, fa3
                  xori         a4, a5, -1398
                  ori          s10, t6, 1592
                  fsub.s       fs2, fs3, fs2
                  fmul.s       fs10, ft11, ft6
                  xori         t3, gp, -679
                  mul          s2, s2, s0
                  fcvt.s.w     fa7, t2
                  fcvt.s.w     fa3, a2
                  fsqrt.s      fa7, ft0, rdn
                  mulhsu       a3, t2, a4
                  fmv.w.x      fa4, t2
                  xor          s6, t2, a5
                  and          a6, t0, s4
                  sra          a5, s7, t6
                  srai         a5, s9, 24
                  xor          s7, a5, s9
                  divu         s9, zero, gp
                  nop
                  fadd.s       fs11, fa7, fs9, rmm
                  fsgnjn.s     fs8, fa0, ft9
                  fmul.s       fs10, fa2, fs5, rdn
                  fsgnjn.s     fs11, fa1, fa6
                  addi         t1, s1, -591
                  flt.s        a4, fs2, ft0
                  srai         tp, s8, 17
                  mulhsu       a1, gp, a5
                  fsgnjx.s     ft5, fa2, ft10
                  fmin.s       fs11, ft8, fs1
                  srl          t4, t0, a3
                  slt          t2, s7, t6
                  fsub.s       fa4, ft3, ft8, rtz
                  auipc        a0, 235261
                  fclass.s     t4, ft6
                  or           a1, s5, t4
                  lui          s5, 477962
                  xori         t3, s1, 1279
                  fadd.s       ft2, fs4, fa7
                  sub          s8, s8, s3
                  fdiv.s       ft10, fs11, ft11
                  andi         t1, t2, -628
                  slti         a1, t5, -1550
                  fcvt.s.wu    ft1, a6
                  fmin.s       ft8, fs11, ft10
                  fsub.s       fs10, fs5, ft2, rtz
                  mulhsu       s7, s5, s2
                  fdiv.s       fs0, fs5, fs0, rtz
                  xor          a0, sp, a1
                  remu         t3, s6, s3
                  srli         sp, a5, 14
                  fcvt.wu.s    a3, fa5
                  xor          t5, s0, ra
                  slli         ra, s10, 31
                  fsgnjx.s     fs5, ft9, fa2
                  slli         t4, s2, 1
                  fclass.s     t6, fs0
                  and          t5, s5, t4
                  slt          a3, t0, gp
                  fcvt.s.w     fa6, s0, rup
                  ori          s7, t5, -1886
                  add          a3, gp, t5
                  srl          a7, a6, zero
                  slli         a0, a3, 14
                  mulhsu       a4, s5, tp
                  fsqrt.s      fa4, ft7
                  xor          t2, a0, s11
                  sub          s9, a6, ra
                  fsgnjn.s     fa5, fs7, ft9
                  fcvt.s.w     fa3, a3, rtz
                  fmv.x.w      a1, fs2
                  addi         a1, s7, -407
                  mulh         a1, t4, ra
                  fmv.w.x      fs3, a3
                  fsgnjn.s     fa4, ft6, ft5
                  addi         s0, a6, -1145
                  fcvt.w.s     t2, fa5
                  fsqrt.s      fa4, ft2, rup
                  sll          ra, t2, s0
                  divu         a7, t6, tp
                  xori         a1, a6, 1095
                  mulhsu       t5, s6, s5
                  fsub.s       ft9, ft1, fa0, rup
                  auipc        zero, 629237
                  mulhu        t1, s1, s3
                  fsgnj.s      ft0, ft4, ft8
                  auipc        a7, 1009624
                  mulh         s2, a5, a3
                  fcvt.s.w     fs4, s10
                  slt          s2, t4, s6
                  fcvt.s.wu    fs10, s11
                  fmax.s       ft5, fa7, fs4
                  divu         a7, tp, a6
                  remu         t5, s11, s3
                  addi         a3, s9, 1802
                  slli         t4, ra, 27
                  fsgnj.s      ft7, ft1, fs6
                  slt          t3, a2, a6
                  fclass.s     t1, fs3
                  slli         s9, t2, 30
                  fdiv.s       fa4, ft6, ft6, rup
                  fsub.s       ft8, fa6, ft0
                  srl          a6, s2, t6
                  mulhsu       t4, t0, s10
                  fcvt.wu.s    gp, fa3
                  fsgnjn.s     ft11, fs1, ft3
                  fsub.s       fs2, ft3, ft3
                  and          a0, ra, s2
                  srl          a6, s11, gp
                  sll          a5, a3, a4
                  fdiv.s       fa3, fs8, fa5
                  fmin.s       fs5, fs1, fs9
                  ori          t5, a5, -1729
                  addi         a6, a5, 750
                  flt.s        a6, fs1, ft11
                  sll          a7, s7, a4
                  fclass.s     a6, ft10
                  feq.s        t2, fs11, fa6
                  fmv.w.x      fs3, t0
                  mulhsu       s5, t3, t3
                  fmv.x.w      t1, ft6
                  fsqrt.s      fa6, ft1
                  fsgnj.s      ft1, fa7, fs6
                  sra          s0, t1, a2
                  fsub.s       ft10, fs3, fs2, rmm
                  fdiv.s       fa0, ft9, fa0, rup
                  or           s7, t6, s2
                  nop
                  fsgnjx.s     ft4, ft0, fs4
                  slt          s8, a6, s9
                  sra          s8, a7, a7
                  fle.s        s6, fa4, fa2
                  mulhsu       s3, a6, t1
                  auipc        a5, 551118
                  fsgnjx.s     fs9, fs2, ft5
                  fle.s        t5, fs1, fa1
                  srl          t2, sp, tp
                  xori         a4, a5, -266
                  feq.s        s1, fs1, fa5
                  divu         t2, a5, t6
                  fdiv.s       fs9, fs10, fa3
                  fcvt.w.s     t5, ft11, rtz
                  fsub.s       fs8, fa2, fs1, rup
                  slti         a6, t6, 1741
                  srai         t2, a1, 7
                  or           s0, gp, s6
                  mul          s6, s5, tp
                  andi         t3, gp, 1743
                  fsqrt.s      fs5, fa2, rdn
                  remu         s6, s7, a4
                  divu         s7, s1, a0
                  fle.s        s11, fs8, fs8
                  fmin.s       ft10, fa7, ft9
                  srli         a5, s7, 19
                  srl          s7, t6, s5
                  and          t1, t6, s2
                  auipc        s7, 466387
                  fclass.s     t5, fs1
                  fsqrt.s      fs2, ft4, rmm
                  fsgnjx.s     fs6, ft6, fs11
                  mulhsu       gp, s9, s3
                  sll          s6, a2, a6
                  fsub.s       ft3, fs9, ft8, rne
                  ori          a3, s10, -1588
                  div          t1, s2, tp
                  fsqrt.s      ft10, fs0, rmm
                  fcvt.w.s     sp, ft5
                  and          s10, s7, s2
                  or           s11, t2, a2
                  fclass.s     a0, fa5
                  fdiv.s       ft4, fs6, fs5
                  xori         s6, a2, -857
                  feq.s        t6, ft1, fa6
                  or           zero, s9, s2
                  feq.s        a3, fa4, fa4
                  feq.s        s10, ft9, ft3
                  add          a0, a5, t5
                  slt          s0, s10, s11
                  or           t5, s9, s9
                  fcvt.wu.s    s1, ft5
                  ori          s5, a3, -561
                  fsgnjx.s     ft2, fs4, fa1
                  lui          ra, 374009
                  fdiv.s       fa2, fs11, fa3, rtz
                  fsub.s       ft11, ft3, fs4, rne
                  fcvt.s.wu    fa3, s10
                  fsub.s       fs1, fa2, fs2
                  or           t4, a3, s7
                  xori         a5, s5, 1277
                  ori          s9, a0, -1324
                  auipc        t2, 1040301
                  sub          sp, s9, s5
                  fsgnjn.s     fs7, ft11, ft11
                  fmul.s       fs9, fs9, fa3
                  fmin.s       fs2, ft1, ft7
                  rem          t4, t5, t6
                  fcvt.wu.s    a0, fa6, rdn
                  fsub.s       ft7, ft5, ft1, rup
                  nop
                  fle.s        a1, fs10, fs1
                  fcvt.s.wu    fs3, a2, rne
                  slli         s0, a4, 16
                  fmul.s       fs7, ft11, fs0, rne
                  fle.s        t2, fa2, ft9
                  fmax.s       fa2, fs3, fs2
                  srl          t3, s4, gp
                  fclass.s     s6, ft0
                  fmin.s       fs5, ft7, fs4
                  slt          t3, s9, t0
                  slti         a5, a3, -577
                  fsgnjn.s     ft6, fa4, fs11
                  feq.s        t5, fa2, fa7
                  fmin.s       fs0, ft2, ft0
                  slt          a5, sp, tp
                  auipc        a5, 309980
                  fle.s        t5, ft6, ft2
                  fcvt.s.w     ft10, t0
                  remu         zero, zero, gp
                  fmax.s       fs8, fs1, fs6
                  remu         a5, s10, s11
                  or           a1, a5, a5
                  fadd.s       fs3, ft11, ft5, rne
                  sll          s0, t2, t5
                  fsqrt.s      fs8, fa4
                  fsgnj.s      fa6, fs9, ft11
                  fmax.s       fs5, ft8, ft7
                  mul          a0, s8, tp
                  mulhsu       t4, a6, s11
                  fmv.w.x      fs11, a1
                  fcvt.w.s     a4, fs11
                  fle.s        t5, fs5, fa0
                  rem          s9, s1, s1
                  fdiv.s       fa4, ft9, fs11, rne
                  slli         s3, zero, 29
                  fcvt.s.w     ft8, s2, rup
                  sltu         s2, t0, t5
                  feq.s        s0, fa7, fa7
                  fsgnjn.s     ft10, fa5, ft8
                  feq.s        s3, fa1, fs7
                  and          s7, t0, a4
                  addi         a5, s4, 1803
                  remu         t5, a4, a7
                  add          a7, t5, t1
                  fmax.s       fs9, fs1, ft11
                  fcvt.s.wu    ft6, s0
                  xori         tp, a5, -1139
                  mulhsu       s1, a0, a3
                  slti         t6, tp, -1988
                  ori          s6, sp, -605
                  or           a4, a3, gp
                  lui          t2, 757554
                  fmv.x.w      t6, fs2
                  fclass.s     s1, fa4
                  fdiv.s       ft7, ft8, fa7, rmm
                  sra          t4, zero, s1
                  slti         s0, gp, -745
                  or           a7, t5, s9
                  sltu         a3, s0, a0
                  xori         s7, a0, -1852
                  and          s5, t1, a2
                  add          ra, t2, a4
                  slli         a4, t0, 23
                  mulhu        s7, s5, t5
                  sll          t2, a4, ra
                  auipc        a1, 73037
                  lui          t5, 994766
                  fmv.x.w      s3, ft5
                  srli         t4, a3, 12
                  feq.s        a4, fs3, ft6
                  addi         a5, a2, -127
                  addi         a4, s6, -1580
                  add          s8, s8, ra
                  ori          a4, t2, 1869
                  auipc        a4, 430233
                  fcvt.s.w     fa7, sp, rmm
                  nop
                  divu         s1, t1, ra
                  and          t5, a5, s1
                  xor          t1, s0, s1
                  slli         s5, a5, 26
                  fle.s        a7, fs10, fa4
                  fcvt.s.w     fa5, a7
                  add          s0, ra, ra
                  fdiv.s       fs11, ft1, fs4, rup
                  fsub.s       fa1, fs5, fs3
                  fmul.s       ft3, fa7, ft11, rup
                  fmin.s       ft6, ft5, ft2
                  fsqrt.s      ft11, ft8
                  sltu         ra, a6, s11
                  fsgnjx.s     fa5, fs5, fs7
                  fsgnj.s      ft4, ft8, fa1
                  mul          t5, s6, s9
                  fadd.s       fa0, fs5, fa4, rmm
                  xori         t4, s6, 561
                  fcvt.w.s     s0, ft3, rtz
                  slti         a4, a4, 1626
                  fmax.s       ft11, fs0, fs10
                  mulh         a5, a7, s6
                  fsgnjx.s     ft0, fa7, ft4
                  and          a1, t1, sp
                  fsgnj.s      fa2, fa6, fs7
                  nop
                  lui          s5, 301009
                  srai         s2, a7, 8
                  sltu         s8, s11, s9
                  fmul.s       ft9, fs6, fa6, rmm
                  fmv.x.w      ra, fa1
                  xor          s6, t5, t3
                  feq.s        s5, fs0, fs7
                  fadd.s       fa2, fs4, fa4, rtz
                  sub          s10, s5, t4
                  fmax.s       ft0, ft6, ft7
                  fcvt.s.w     ft10, t6, rup
                  fcvt.s.wu    ft9, t2, rup
                  xor          s11, s9, a2
                  fcvt.s.w     ft0, tp, rmm
                  fsgnjx.s     fa5, fs5, fa4
                  slli         a5, a3, 7
                  ori          s2, a2, 567
                  fmin.s       ft7, fs7, ft8
                  xori         sp, tp, -383
                  xor          a7, s4, s4
                  sltiu        t5, a7, 922
                  fsub.s       ft5, fa1, ft4
                  fmv.x.w      t6, fa0
                  flt.s        a6, fa1, ft3
                  srl          s7, s5, s9
                  mul          ra, sp, sp
                  sub          a5, a4, s11
                  fadd.s       fs1, fs5, fs7
                  and          a3, t0, t0
                  sll          s11, s6, a2
                  sra          a3, sp, t4
                  slt          a5, t3, t4
                  fdiv.s       fs1, ft0, fa7
                  mul          t2, s10, t3
                  mul          tp, t5, zero
                  fmul.s       fs9, fa6, ft7, rtz
                  mul          t6, s1, s8
                  mulhsu       a0, t5, s8
                  fcvt.s.wu    ft11, a1, rne
                  fsgnjn.s     ft6, fa4, ft5
                  sll          t1, sp, s2
                  mulhsu       ra, a2, a2
                  fsgnjx.s     ft5, ft11, fs7
                  fsub.s       ft9, ft10, fa0
                  divu         a4, tp, a2
                  auipc        s9, 999147
                  srai         s10, a6, 19
                  slti         s6, s5, 2034
                  sra          s10, a0, a3
                  add          tp, s4, t2
                  fmax.s       fs0, fa0, ft0
                  sltu         t6, s5, a0
                  fle.s        a4, fs1, fa0
                  srl          s2, a7, s8
                  fcvt.w.s     s7, fs6, rne
                  sll          s0, s11, s11
                  mulhu        s3, a7, a7
                  fclass.s     sp, fa1
                  fadd.s       ft11, ft7, ft11, rup
                  fcvt.wu.s    s2, fs9
                  fadd.s       fa7, ft0, ft11
                  sra          s9, t5, a5
                  fsqrt.s      ft4, fs5, rne
                  slt          a0, t1, s11
                  slli         s10, ra, 17
                  fsgnj.s      fa5, fa6, fs6
                  fsub.s       fa0, fa3, fa5
                  fmv.w.x      ft9, s7
                  add          a7, ra, s1
                  add          t5, t3, gp
                  fsgnjn.s     fa6, fs8, fs4
                  fsub.s       fs8, fs9, ft9, rtz
                  slli         sp, s9, 11
                  mul          t6, sp, a0
                  fcvt.w.s     a3, ft6, rtz
                  sra          sp, a7, s8
                  add          a7, t1, t1
                  sub          t3, a7, a5
                  feq.s        t4, ft10, fs6
                  mulhsu       a6, ra, s1
                  fsqrt.s      fa7, fa7
                  fcvt.s.wu    fs11, s6
                  fsub.s       fs11, ft5, fa2
                  slt          a6, s0, s6
                  fsgnjx.s     fs3, fa7, ft11
                  lui          tp, 913389
                  andi         sp, s8, 1122
                  mulhsu       zero, s3, sp
                  fmul.s       fs2, ft5, ft6
                  divu         s9, ra, a1
                  srl          s8, a3, a5
                  fmax.s       fs2, fa1, fs3
                  fle.s        t6, fs0, fs10
                  mulh         t3, s0, a4
                  fmax.s       ft11, fa5, fa7
                  auipc        sp, 1027884
                  or           s7, t1, a3
                  auipc        a5, 531516
                  auipc        s9, 122839
                  fmul.s       fs6, fa2, ft3
                  fcvt.s.w     fs6, gp
                  rem          s6, s9, s10
                  and          s6, sp, s9
                  fsqrt.s      ft6, ft9
                  srli         a3, s9, 8
                  nop
                  ori          a7, zero, 490
                  slt          zero, s10, s9
                  sll          t1, s4, a6
                  fmul.s       ft5, ft9, fs1, rmm
                  slti         a3, a4, -1438
                  mulhsu       gp, t2, s0
                  fcvt.wu.s    a5, ft4, rtz
                  slt          a4, s7, t0
                  fsgnjn.s     ft11, fa5, ft3
                  srai         a7, a7, 0
                  fsgnjn.s     fa2, fa7, ft4
                  mulh         a1, t0, s5
                  nop
                  fsgnj.s      ft9, fa7, fs2
                  srli         t5, s5, 6
                  slt          s10, t3, gp
                  fclass.s     ra, ft5
                  sltiu        s7, t6, 529
                  mulh         a0, a4, t6
                  andi         gp, t1, 1048
                  nop
                  sub          s8, gp, s9
                  fsub.s       fs11, fs11, fs1
                  add          zero, s4, t2
                  rem          s6, t1, t4
                  or           s6, zero, s0
                  sub          sp, t4, sp
                  mulhsu       a5, zero, s8
                  fsgnjx.s     fa0, fa3, fa4
                  fle.s        a6, ft4, fs4
                  or           a1, s6, s10
                  srli         s9, t3, 14
                  mul          s6, s9, a2
                  fmv.w.x      ft10, s1
                  add          s0, a3, a0
                  fsgnjx.s     ft11, fs1, ft1
                  fmv.w.x      ft3, t1
                  fcvt.s.w     fa7, s0
                  fsgnjn.s     fa0, fs1, fa6
                  fclass.s     a3, ft9
                  slti         a4, s9, 181
                  addi         a1, a6, 259
                  add          s8, tp, s4
                  feq.s        t3, fs7, ft3
                  slli         t2, a4, 16
                  fclass.s     t4, fa5
                  srl          s1, a1, a5
                  or           a5, a5, a5
                  fle.s        s9, fs8, fs11
                  sub          ra, s8, s11
                  sltiu        a1, t3, 821
                  remu         a1, t5, s3
                  sltiu        s0, a4, -265
                  fclass.s     a5, ft9
                  auipc        s0, 750027
                  mulhu        t1, s7, s8
                  fsgnjx.s     fs7, ft6, ft0
                  auipc        s1, 237829
                  sra          a0, t4, t2
                  sll          s2, t5, tp
                  fcvt.w.s     s5, fa4, rdn
                  andi         s8, a7, -333
                  slli         s1, a6, 23
                  mulh         s3, t4, s10
                  mulhsu       a7, s4, a6
                  xor          s1, s7, a4
                  mulhu        s3, s3, ra
                  slti         a3, s0, -114
                  slli         gp, a3, 27
                  sltiu        s8, s4, -1037
                  fcvt.w.s     a7, fs10
                  feq.s        a3, fs8, fs1
                  fsgnj.s      ft8, ft8, fa7
                  sra          a4, t6, s9
                  mulhu        t2, a3, a0
                  div          a0, s6, s9
                  rem          sp, a3, a4
                  addi         s7, t5, 616
                  sub          s6, a2, t5
                  srli         a7, s10, 19
                  sra          s0, a7, ra
                  mulhu        a1, s11, t1
                  fsub.s       ft4, fa7, ft0
                  xori         gp, a1, 917
                  fcvt.wu.s    s6, fa6
                  mulhsu       t4, t6, s8
                  xori         a0, a0, -811
                  fcvt.wu.s    zero, fs8
                  remu         s3, t2, ra
                  andi         zero, t3, -1578
                  sll          s6, s5, t2
                  sltiu        s7, t1, -1496
                  ori          a4, a7, -1327
                  mul          s5, a1, a3
                  remu         gp, t3, a2
                  sra          zero, a2, s0
                  fsgnj.s      ft9, ft10, ft3
                  fcvt.s.wu    ft11, zero
                  slt          a4, s8, t6
                  lui          t1, 763445
                  mulh         s9, t2, t5
                  fmv.x.w      t5, fa4
                  srai         t4, sp, 15
                  mulhu        t6, sp, s6
                  mulhsu       gp, s2, ra
                  fmv.w.x      fa2, a4
                  fcvt.w.s     sp, fa3, rmm
                  sltiu        tp, t3, -1844
                  fmv.x.w      a5, ft11
                  fsgnj.s      ft2, ft7, ft2
                  fcvt.s.wu    fa1, a4, rtz
                  feq.s        s1, ft8, ft4
                  mulhu        a7, a5, sp
                  fsqrt.s      fs1, fa1, rne
                  divu         gp, a2, s9
                  fmax.s       ft9, fs4, fs6
                  fclass.s     ra, fs11
                  fcvt.wu.s    s6, ft7
                  mulhu        ra, s11, s10
                  add          s7, a6, s3
                  fdiv.s       fa2, ft11, fs9, rdn
                  fsgnj.s      fs6, ft3, fs11
                  fmin.s       ft9, fa3, ft10
                  auipc        a0, 375201
                  rem          t2, t3, s3
                  sltu         ra, s0, a6
                  fclass.s     t6, fa1
                  sra          t3, t5, t6
                  divu         s6, s5, s2
                  fcvt.w.s     ra, fs11
                  mulhu        ra, ra, tp
                  slt          a7, a7, a2
                  lui          t3, 537738
                  sub          s0, s3, a2
                  sll          a7, s11, a6
                  slli         a0, t2, 24
                  feq.s        s11, fa4, ft1
                  fmv.x.w      s5, ft5
                  or           s3, s5, t4
                  xori         t4, s6, -448
                  feq.s        t5, fs2, ft0
                  remu         a1, s10, s3
                  fsqrt.s      fs0, ft10, rmm
                  or           s1, s5, a7
                  xor          a3, t5, gp
                  lui          zero, 600491
                  slt          t5, t2, t1
                  fcvt.w.s     a4, fs5, rtz
                  xor          t4, a2, a7
                  ori          gp, a0, 1839
                  fsqrt.s      ft2, fs0
                  remu         s5, s10, s5
                  mulhu        s9, t3, a5
                  remu         s9, s7, s8
                  xor          s9, t3, tp
                  mulh         a5, s11, t4
                  fsgnjn.s     fs11, fa4, fs5
                  sra          s5, s3, tp
                  srai         t2, a0, 26
                  sll          s2, t6, ra
                  fcvt.wu.s    zero, ft5
                  fdiv.s       fs11, ft10, ft11
                  xor          s10, t1, s2
                  fadd.s       fs10, fa0, fs10, rne
                  fsgnj.s      ft2, fa1, ft1
                  mulh         a4, s4, gp
                  andi         a0, s6, -1702
                  lui          a4, 21284
                  fmin.s       ft7, ft2, ft5
                  fsgnj.s      ft9, fa3, ft8
                  mulh         s2, s5, t2
                  fmul.s       fa5, fs8, ft0
                  fdiv.s       fa0, ft11, fs8
                  or           s11, s9, a0
                  fmin.s       fa4, ft2, fa3
                  flt.s        sp, ft3, fa3
                  feq.s        a7, fa0, fa7
                  fdiv.s       ft5, ft8, fs2
                  xori         a4, a0, -6
                  lui          a7, 192699
                  fdiv.s       ft10, fs6, ft9
                  nop
                  addi         t5, s1, 100
                  fmax.s       fa7, fs10, fs6
                  mulh         s11, t5, ra
                  fcvt.wu.s    s9, ft7
                  fmax.s       ft2, fs5, fs11
                  divu         t6, a7, t1
                  sub          s10, a0, t3
                  fcvt.s.w     fa6, s5, rtz
                  flt.s        t6, ft3, fs10
                  fcvt.w.s     s5, fs1, rdn
                  fmul.s       ft5, fa3, fa3
                  or           s3, s1, s9
                  divu         t1, t0, s10
                  fclass.s     s11, fa4
                  auipc        zero, 982802
                  fsqrt.s      ft4, fs2
                  fclass.s     s7, ft0
                  fmv.w.x      fa5, s7
                  sltiu        t2, t5, 1627
                  rem          s7, t2, t1
                  fadd.s       ft3, fs8, ft9, rdn
                  andi         sp, s0, -1278
                  fsgnjn.s     fs10, fs6, ft0
                  fclass.s     s11, fa1
                  fmin.s       fa5, ft3, fs3
                  andi         t4, t0, 1895
                  mulh         a5, s7, a4
                  and          a7, ra, s5
                  srai         t2, t5, 10
                  fmul.s       fa5, ft2, ft11, rne
                  fsub.s       fa5, fa4, ft5, rup
                  srai         s10, t0, 9
                  mulh         s11, zero, a4
                  fdiv.s       fs3, fa4, ft10, rne
                  sub          s11, t3, a1
                  fmax.s       ft6, fs10, ft10
                  slti         s0, a3, -1950
                  fsub.s       fa7, fa3, fs3, rtz
                  sra          s9, a2, ra
                  fle.s        a7, ft3, fa2
                  xor          s8, s3, sp
                  and          a3, t0, a7
                  fle.s        s8, ft5, fa1
                  srai         s0, s3, 20
                  sltu         a6, t6, s8
                  or           s6, a5, gp
                  mulhu        s11, ra, s4
                  ori          a6, s0, 1701
                  mulhsu       t4, gp, ra
                  andi         s8, s7, 1264
                  or           t3, s11, s7
                  feq.s        t5, ft10, fa2
                  sra          a4, t0, gp
                  srli         a6, a5, 22
                  fsgnjn.s     fs5, ft1, fs7
                  mulhsu       ra, gp, s3
                  mulh         s2, a2, t6
                  rem          s5, a2, t2
                  xori         a5, ra, 139
                  fcvt.w.s     tp, fa2
                  sub          s5, a3, a2
                  lui          s3, 169635
                  fdiv.s       fs7, ft0, fa4
                  fclass.s     s3, ft8
                  fsgnjx.s     ft8, fs2, fs1
                  srli         s9, s2, 21
                  fcvt.s.w     fa7, s6, rup
                  fadd.s       fs0, ft7, fs4, rdn
                  and          s10, s5, tp
                  nop
                  fsgnjx.s     fa0, ft0, fs2
                  fsgnjn.s     fs4, fs6, fa3
                  or           s11, s4, tp
                  fsgnj.s      fa1, fs9, ft8
                  fcvt.w.s     t1, ft1, rup
                  remu         s6, a3, t1
                  fmin.s       ft3, fa5, fa5
                  or           s0, zero, s6
                  fmax.s       fa7, ft7, fa1
                  slli         s5, a4, 30
                  mulh         t1, a1, a3
                  sll          s8, s0, t0
                  mulh         sp, tp, a3
                  div          s3, a6, a4
                  fle.s        s7, fs6, ft10
                  sltiu        s9, gp, -896
                  fadd.s       fa3, fs6, fa4, rdn
                  or           s11, s3, s3
                  mul          s8, s11, tp
                  remu         a5, t6, t6
                  rem          t2, a3, a3
                  fmv.w.x      ft11, s3
                  srai         s5, a6, 22
                  div          a5, t4, a0
                  fcvt.w.s     a0, ft2
                  sra          a0, a7, tp
                  fclass.s     s0, ft6
                  fadd.s       ft7, fs4, fa0, rne
                  andi         s0, t3, 407
                  fclass.s     t6, fa2
                  fmul.s       fs7, fa4, fs1, rup
                  fsqrt.s      fs2, fs3
                  srli         t6, sp, 14
                  sltiu        a5, t1, -1566
                  fsgnj.s      fa0, ft4, ft8
                  andi         s11, zero, 1843
                  sub          s6, s3, t4
                  fmul.s       ft1, fs7, fa1
                  fadd.s       fs11, ft5, fs9, rne
                  or           s8, t1, zero
                  fsgnjn.s     fs8, ft10, fa2
                  rem          s8, gp, s6
                  or           s5, tp, s2
                  addi         a3, s0, -586
                  fclass.s     a0, fa5
                  fcvt.s.wu    fa3, t5
                  xor          a0, a2, s11
                  divu         a3, sp, s1
                  divu         t3, a4, s2
                  fsgnjn.s     fa5, fa6, fa2
                  nop
                  fcvt.s.wu    ft10, a6, rne
                  fsqrt.s      ft7, ft11, rtz
                  flt.s        zero, fa5, ft8
                  fmin.s       ft6, fs9, fs1
                  fcvt.s.wu    fa3, s5
                  srli         s2, s10, 24
                  fsgnjx.s     ft8, ft4, ft7
                  and          a6, tp, a7
                  add          a6, zero, s11
                  fmul.s       fs5, fs5, ft9, rtz
                  sra          s2, gp, s3
                  nop
                  sltu         t4, s2, s2
                  nop
                  fadd.s       ft7, fs4, fs9, rdn
                  fsgnjn.s     fs2, fs7, fs9
                  mulhsu       t1, t4, s5
                  sub          s0, s8, s9
                  mulhu        a7, a3, t5
                  slti         s10, t6, -1168
                  flt.s        s0, fa7, fs10
                  fclass.s     s0, fa5
                  fmax.s       ft6, ft2, fs9
                  slli         s8, s9, 17
                  fcvt.w.s     s2, fs7
                  addi         a1, t5, 1804
                  fcvt.s.w     ft7, a7
                  sub          s2, a7, a7
                  srli         s5, s11, 16
                  fmv.w.x      ft9, a6
                  slt          zero, s10, s3
                  sra          t2, tp, t6
                  fmax.s       fs0, ft7, fa1
                  fmax.s       fa7, ft5, ft11
                  fcvt.wu.s    s8, ft3, rne
                  andi         s10, a1, 1051
                  fdiv.s       ft10, fa5, fs1, rtz
                  sltu         s6, s3, s6
                  fmul.s       ft10, ft0, fs2, rtz
                  fle.s        s2, ft8, ft9
                  remu         s9, s9, s0
                  srl          a1, t3, t0
                  nop
                  slt          t6, ra, s5
                  auipc        t5, 609539
                  sll          gp, t0, ra
                  auipc        t6, 859204
                  mul          a6, a7, gp
                  fcvt.s.w     fs11, a6
                  fmin.s       ft9, fa1, ft2
                  fsqrt.s      ft9, fa2
                  addi         tp, s5, 1156
                  sll          a7, t6, a0
                  nop
                  ori          s3, tp, 353
                  fcvt.w.s     s2, ft1
                  mulh         a1, s2, t4
                  and          a3, t5, zero
                  fcvt.s.w     ft6, a3, rup
                  slli         tp, a3, 14
                  add          t4, a3, a7
                  sll          a3, s8, t1
                  or           t3, s1, zero
                  or           t1, t3, tp
                  sra          s11, a6, a3
                  ori          s0, s3, -1834
                  div          t3, zero, s3
                  sra          s5, a6, s6
                  sub          t3, t3, s10
                  andi         s8, a2, 905
                  sra          s9, s8, tp
                  sra          s3, t2, a5
                  fcvt.s.wu    fs6, s1, rne
                  srli         a0, gp, 3
                  fsgnjx.s     fa5, fa2, fa1
                  add          tp, s10, a7
                  srl          a6, a6, tp
                  lui          a0, 238952
                  andi         s8, sp, -1437
                  flt.s        s6, ft5, fa2
                  sra          t6, t3, s2
                  divu         a1, a2, s4
                  fsgnj.s      ft8, fs4, fs2
                  fmv.w.x      fs2, ra
                  fadd.s       fa5, ft5, ft6
                  fmv.w.x      ft9, a5
                  flt.s        s5, fs1, ft0
                  sra          t3, s8, s0
                  fmv.w.x      ft3, s5
                  fsqrt.s      fs2, ft8
                  fcvt.s.wu    ft0, sp, rup
                  div          a0, s7, a5
                  fcvt.s.w     ft11, s4, rtz
                  flt.s        s7, fa2, ft0
                  fmv.w.x      fs1, a3
                  xori         s3, t4, -129
                  add          s8, t2, s3
                  lui          s9, 464985
                  fsub.s       fa7, ft9, fs0
                  xor          tp, s5, t4
                  srai         s6, t4, 0
                  fmin.s       ft5, fa3, fa0
                  fsgnjn.s     ft6, fa7, ft8
                  fcvt.s.w     fs11, ra, rdn
                  addi         a7, t3, -482
                  divu         s2, a5, t5
                  lui          zero, 460279
                  fcvt.wu.s    s7, ft3
                  div          a7, s11, a7
                  fsgnjx.s     ft10, fs9, fa1
                  sltiu        s9, s3, 867
                  fcvt.w.s     a3, fs5, rup
                  fsgnj.s      ft6, ft11, ft6
                  mulhsu       a7, s3, t3
                  or           tp, ra, s8
                  fmin.s       ft11, ft11, fa2
                  sll          s10, s8, a5
                  ori          s0, t4, 729
                  rem          s3, a3, t0
                  lui          s6, 387445
                  fsgnj.s      fs9, fa1, ft11
                  xori         sp, a6, -604
                  srli         a5, s9, 29
                  fmax.s       fs0, fa3, ft3
                  fmax.s       ft5, fa2, ft2
                  slti         t3, s5, -1835
                  ori          tp, s7, -1841
                  sub          s10, a7, a1
                  sll          t2, sp, s7
                  and          s7, t3, t0
                  feq.s        t4, fa6, fa0
                  mul          t2, s2, s3
                  sub          s0, a3, s6
                  or           a7, a6, a4
                  flt.s        a4, fs11, fa0
                  fmv.x.w      s7, ft1
                  sub          t6, a3, s8
                  fadd.s       fs3, ft0, fs10, rmm
                  fmin.s       ft0, ft8, ft7
                  lui          s6, 506454
                  slli         a7, tp, 1
                  fclass.s     tp, fs10
                  nop
                  fsgnjn.s     ft11, fs8, ft4
                  flt.s        s9, fs0, fs10
                  andi         s6, t5, -1647
                  fmv.x.w      a6, ft4
                  add          s8, t1, gp
                  fle.s        s7, ft7, fa5
                  mul          ra, t6, zero
                  fsgnj.s      fs10, fa3, fa0
                  slli         gp, a3, 18
                  mulhu        t5, tp, s5
                  sub          t1, ra, s2
                  srli         a5, s9, 8
                  andi         t6, t0, 941
                  fmv.w.x      fs6, ra
                  divu         a1, a2, gp
                  fmv.x.w      s0, fa7
                  auipc        s8, 834754
                  feq.s        s0, ft6, ft0
                  fsgnj.s      ft4, fs9, ft3
                  mulhsu       s10, t3, t3
                  fcvt.s.w     fa4, gp, rtz
                  fdiv.s       fs0, ft9, fs10
                  fsgnjx.s     ft4, fa4, fs6
                  fclass.s     t1, ft6
                  div          t5, s2, t1
                  fcvt.w.s     t2, ft10, rtz
                  fmax.s       ft9, fs2, fs4
                  fmul.s       fs6, fs2, fa4, rup
                  div          s11, s5, s8
                  fmax.s       fs11, fs11, ft6
                  fmv.x.w      s6, ft0
                  fsgnjx.s     fs5, ft6, fs5
                  add          a1, a5, a1
                  auipc        a0, 874067
                  auipc        s9, 561205
                  fadd.s       fa1, fa7, fs1
                  fcvt.s.wu    ft10, t4, rne
                  fadd.s       fs0, fs1, ft10, rne
                  lui          t3, 52273
                  sltiu        s6, t6, -1993
                  fmin.s       fa1, ft11, fa6
                  auipc        a7, 796467
                  nop
                  divu         s3, a7, t3
                  srl          a5, s3, a0
                  fcvt.s.wu    fs6, sp, rdn
                  divu         t4, s10, t1
                  ori          s3, t5, -1795
                  slti         t5, ra, 1047
                  addi         s7, s11, 613
                  mulhu        a0, a7, t0
                  srli         zero, t0, 14
                  nop
                  fcvt.w.s     s2, ft5
                  feq.s        a7, ft1, ft10
                  fmv.w.x      fs3, t0
                  fdiv.s       ft2, fa2, fa3
                  srai         s11, s2, 30
                  fmv.w.x      ft9, t5
                  fcvt.s.wu    fa3, t6
                  fsqrt.s      fs7, fs1, rdn
                  fcvt.w.s     s2, fs8
                  div          s9, a4, s7
                  or           s3, s9, t4
                  fcvt.s.w     fa5, tp, rne
                  ori          a6, t6, 258
                  addi         a1, a6, 183
                  fadd.s       fa1, ft11, ft8, rdn
                  sltu         a4, a4, a5
                  sltiu        s0, s5, -79
                  srai         s7, ra, 23
                  sltiu        a7, s8, -1617
                  sub          a0, a5, a1
                  fcvt.w.s     a6, ft10, rdn
                  rem          s9, s11, t2
                  srli         a0, a3, 9
                  feq.s        a3, fs9, fs3
                  flt.s        t4, fa6, ft7
                  fmv.w.x      ft1, zero
                  mulh         s3, t0, sp
                  and          t1, zero, a2
                  mul          a6, a7, t4
                  fsgnj.s      ft7, ft8, ft4
                  add          a4, s5, s5
                  fsgnj.s      fs3, fs3, ft5
                  mulh         a3, t3, zero
                  fmv.x.w      s2, fa7
                  fdiv.s       ft2, ft6, fa0, rtz
                  andi         t5, t3, -294
                  fmax.s       ft1, ft5, fs9
                  fsqrt.s      ft7, fa1
                  nop
                  srai         sp, s1, 28
                  fle.s        t4, fs11, ft11
                  fmax.s       fs0, fs2, fs7
                  nop
                  add          a0, a0, zero
                  mulhsu       a4, s7, s1
                  fdiv.s       fs7, ft7, fs6
                  div          zero, t3, a3
                  fcvt.s.w     ft6, t4, rmm
                  srai         t3, a5, 8
                  fcvt.wu.s    t2, ft8
                  slli         s0, s9, 11
                  rem          s3, a5, a7
                  addi         s5, s6, -1159
                  mul          t1, a5, s7
                  fsgnjn.s     ft3, ft1, fa4
                  sll          s11, s3, gp
                  fcvt.w.s     t4, fs9
                  andi         s1, s8, 1500
                  xor          t2, a0, a6
                  fcvt.w.s     s5, fs5
                  fclass.s     s0, ft7
                  srai         t2, s1, 2
                  mulhu        s6, sp, s0
                  mulh         s10, t2, s0
                  sll          t4, s3, a6
                  ori          ra, s9, 200
                  xori         s0, s0, 233
                  div          a4, s4, s0
                  mulh         t1, s6, a6
                  fsgnjx.s     ft5, ft7, fs9
                  srl          sp, t4, s11
                  slli         t3, t3, 14
                  and          gp, t6, ra
                  fcvt.wu.s    s5, fa4
                  fadd.s       ft1, ft11, fs3, rdn
                  fsqrt.s      fa6, fa6, rup
                  fmul.s       fa7, ft9, ft8, rmm
                  srai         t4, a1, 20
                  srl          ra, s10, a1
                  fcvt.s.w     ft11, a7
                  fadd.s       ft8, fa1, ft2, rtz
                  flt.s        gp, fa4, ft4
                  sll          s8, a6, a6
                  fcvt.s.w     fs6, t4, rup
                  fdiv.s       fs6, fa2, ft2, rtz
                  xor          sp, s4, s8
                  mulhu        a6, a7, s6
                  srli         t3, s4, 25
                  flt.s        t6, fs7, fa1
                  fsub.s       ft3, ft10, ft9, rdn
                  sub          a7, s10, t2
                  sltu         a0, ra, t5
                  fclass.s     zero, ft1
                  srl          s8, s8, s3
                  mulhsu       s0, sp, s10
                  flt.s        gp, fa5, fs10
                  addi         s9, s5, 560
                  fadd.s       fs0, ft6, ft10, rup
                  fcvt.s.wu    fa2, t2, rup
                  fmax.s       fs8, fs1, ft11
                  fcvt.s.w     ft7, a7, rup
                  fclass.s     s10, fa0
                  fcvt.wu.s    a0, fa6
                  fsgnjn.s     fa2, ft4, fs5
                  auipc        t3, 1019826
                  fmv.w.x      ft11, a0
                  fdiv.s       fs3, ft8, fs2, rup
                  sltu         a6, a5, a1
                  fle.s        a3, ft7, fs10
                  slt          sp, t6, s0
                  feq.s        t2, ft4, fa2
                  slti         gp, a7, -1759
                  srai         t2, s6, 13
                  sll          s6, t3, gp
                  fmax.s       fs3, fs2, ft1
                  and          a7, a3, t5
                  mulhu        a7, tp, a1
                  fsgnj.s      ft0, fs7, fa7
                  fmv.x.w      s8, ft5
                  remu         a1, s0, t2
                  feq.s        t1, fs3, ft2
                  srli         s9, a7, 21
                  fsgnj.s      fa3, ft9, ft3
                  fmax.s       fs5, ft4, fa0
                  lui          a4, 860937
                  fmul.s       fa7, fs1, fs10
                  div          a5, s4, s9
                  sltiu        a0, s5, -1112
                  or           t1, t2, t4
                  sll          a5, s7, t3
                  fdiv.s       fs8, fs5, ft6, rtz
                  fmul.s       fa4, fa7, fs5
                  mulh         zero, a0, s11
                  xor          sp, a1, a1
                  fsgnjn.s     ft5, ft10, ft2
                  fmv.x.w      s11, fa5
                  and          zero, a7, t4
                  sll          s1, s9, ra
                  sra          s11, a7, s1
                  fmv.x.w      s9, fs2
                  fsgnj.s      ft6, ft9, fs2
                  fclass.s     s0, ft2
                  and          s8, a7, tp
                  lui          a7, 279512
                  fmul.s       fa3, fa3, fs3, rtz
                  ori          t2, a4, -1306
                  srl          t5, a5, a6
                  srai         t1, a4, 1
                  slt          ra, gp, a2
                  sltu         t1, s9, a3
                  sub          s9, a5, s0
                  slti         s10, s10, -1415
                  fcvt.s.w     fs1, a2, rne
                  slti         a0, gp, -328
                  ori          t5, s7, -19
                  fsqrt.s      ft6, fa3, rmm
                  flt.s        tp, ft4, fs11
                  fsub.s       ft5, fs0, fs4
                  fcvt.s.w     fs8, a4
                  srai         t3, gp, 12
                  fsgnjn.s     fa0, fa4, fs2
                  fsub.s       fa3, ft11, fa5, rup
                  fcvt.w.s     t1, fs10
                  fcvt.wu.s    s9, ft8, rtz
                  mul          s6, a3, a0
                  sltiu        s8, a7, -1659
                  fdiv.s       fs8, ft9, fs10, rtz
                  divu         s0, s5, a1
                  addi         a5, s1, 1141
                  fadd.s       ft2, fa7, fs7, rtz
                  fmv.w.x      fs4, a0
                  sltu         a5, a7, a1
                  remu         s5, a5, s8
                  div          s6, a2, s8
                  nop
                  auipc        s1, 705489
                  sltiu        a6, s3, -1394
                  slt          s11, t6, a2
                  slti         s8, a5, -753
                  fmv.w.x      ft4, a1
                  srai         s1, sp, 21
                  fmax.s       fa2, ft11, fa7
                  fsqrt.s      ft9, fa4, rmm
                  andi         s6, s2, 1297
                  fmax.s       fa2, ft11, ft4
                  fsgnjx.s     ft7, fs4, ft3
                  slti         s2, s0, -402
                  fsgnjx.s     fa6, fa6, fa1
                  remu         t1, s8, s4
                  fadd.s       fa3, fa3, fa2, rdn
                  auipc        ra, 236740
                  fcvt.wu.s    a0, fa7
                  sll          s8, t2, t5
                  srl          a3, t4, sp
                  addi         zero, t6, 497
                  fsub.s       ft7, fs6, fs2, rne
                  lui          s3, 193900
                  fmin.s       ft10, ft6, fa3
                  srai         s6, zero, 0
                  fmv.x.w      s6, fs6
                  fadd.s       ft11, fa0, ft11, rup
                  flt.s        t4, fa5, ft5
                  ori          s3, s1, 1678
                  srai         s10, s3, 15
                  feq.s        sp, fs10, fs3
                  fadd.s       fs9, fa1, ft8, rtz
                  remu         t2, s11, s11
                  fsgnjn.s     ft1, ft8, ft11
                  lui          a1, 491912
                  fmax.s       fs7, fs2, fa7
                  nop
                  fmv.x.w      t4, fs10
                  slti         t6, s0, -497
                  and          s8, t2, t6
                  remu         s1, a2, gp
                  fcvt.s.w     fs11, s2
                  fsgnjx.s     ft1, fa5, fa6
                  srli         tp, t6, 12
                  lui          t6, 937868
                  and          sp, t0, s3
                  sltiu        s5, t4, 754
                  mulhsu       gp, gp, s0
                  sll          s0, s8, s1
                  slt          a1, gp, zero
                  sra          s7, s5, s6
                  addi         s1, s4, 1359
                  fmv.x.w      tp, fs8
                  flt.s        s11, ft3, fs10
                  mulh         t6, s6, a3
                  auipc        a7, 580208
                  mul          sp, t6, t5
                  fmv.w.x      ft7, tp
                  add          t2, a5, s4
                  fmin.s       fs11, fa5, fs5
                  slli         a7, s6, 10
                  ori          sp, a3, 978
                  mulhsu       a7, s3, t2
                  slti         a0, sp, -408
                  slt          zero, s10, a3
                  fmax.s       fa6, fs4, fa7
                  srai         t5, s7, 10
                  lui          t1, 498206
                  rem          tp, s1, s8
                  srli         s8, s0, 23
                  feq.s        t3, fs9, fa2
                  slt          a6, s0, t6
                  fadd.s       ft4, fa0, fa3
                  fsgnjn.s     fs8, fs5, fa6
                  srl          s10, s4, s4
                  andi         s6, t1, -1155
                  mulhu        tp, a0, t4
                  fmin.s       fa5, fa2, ft11
                  divu         s2, t6, t5
                  fadd.s       ft9, fa4, ft9
                  fsgnjn.s     fs8, fs7, fs9
                  fmv.w.x      ft5, a1
                  fcvt.s.wu    fa2, t0
                  fclass.s     t3, fs8
                  mulhsu       s0, t2, s3
                  mulhsu       a4, a1, s7
                  sll          s10, s2, sp
                  sltu         s8, t5, a3
                  fsub.s       ft1, fa7, fa5
                  sra          t2, s10, a2
                  sub          s11, t1, sp
                  slli         s9, s6, 10
                  andi         s0, s6, -548
                  ori          s3, gp, -278
                  flt.s        t5, ft5, fs8
                  mulh         s11, s5, s11
                  rem          a6, t1, gp
                  srl          s7, a1, a5
                  ori          t2, s9, -1984
                  fcvt.wu.s    t4, fs4
                  add          s6, a1, a5
                  srli         a5, t6, 15
                  div          t3, s0, t4
                  auipc        a4, 796109
                  mulh         a6, a3, s2
                  fcvt.s.wu    fs2, gp, rmm
                  fmin.s       fa5, ft9, fs5
                  fmax.s       fs6, fs9, fs11
                  fcvt.s.w     fs9, s6, rmm
                  fsgnjx.s     fs7, ft9, fa3
                  srli         t6, a4, 16
                  lui          t5, 364561
                  add          s2, s1, s2
                  fcvt.wu.s    zero, ft5, rdn
                  feq.s        s10, fa1, fa2
                  ori          sp, s1, 1955
                  rem          t5, t2, ra
                  mulhsu       s5, a7, s10
                  sra          zero, s10, s8
                  sltu         ra, t5, zero
                  fcvt.s.w     fa2, a5
                  fmv.w.x      ft6, s0
                  srli         s3, t3, 9
                  auipc        s5, 953582
                  fsqrt.s      fs9, ft8
                  fmul.s       fa3, fa7, ft9
                  sltu         s6, s6, a0
                  flt.s        a7, ft5, fa5
                  mul          t2, s11, ra
                  nop
                  mul          s9, t2, a1
                  fclass.s     t6, fs9
                  fclass.s     t5, ft8
                  fclass.s     t6, ft8
                  slti         s2, gp, -1886
                  flt.s        s1, fs10, fa0
                  ori          s11, tp, 344
                  slt          t4, zero, sp
                  fmul.s       ft1, ft8, fa6, rne
                  rem          tp, t6, s0
                  fcvt.s.wu    fa3, s6
                  rem          a1, s10, t0
                  ori          a4, s6, -439
                  sra          s1, s5, s11
                  srl          s5, sp, t2
                  or           gp, s8, a6
                  slt          t2, tp, gp
                  or           s8, a3, t2
                  andi         a0, s3, -1602
                  srai         a7, a1, 24
                  slli         a5, s0, 1
                  div          s1, a2, s1
                  div          gp, s9, gp
                  andi         zero, s8, -509
                  fmv.w.x      fs5, ra
                  fsgnjx.s     fs3, fs0, fa4
                  add          t4, t4, s10
                  slli         t4, t0, 29
                  ori          t1, s5, 127
                  sra          t1, a1, t0
                  srli         t5, t4, 26
                  flt.s        a6, ft1, fs1
                  fmv.x.w      t1, ft1
                  sra          sp, t0, zero
                  fmul.s       ft2, fs7, fs5, rne
                  fmv.x.w      s5, fs5
                  fadd.s       fs5, fs0, ft5, rne
                  fcvt.s.w     fs7, s8
                  flt.s        sp, ft9, fs9
                  fsub.s       fs6, fa5, ft10, rdn
                  fclass.s     a1, fs9
                  auipc        s3, 777341
                  mul          t2, a0, t0
                  fsqrt.s      fs10, ft11
                  or           s5, ra, s10
                  slt          s1, zero, s4
                  mulhu        t2, s2, ra
                  fle.s        s9, fs11, fs4
                  srli         s3, s10, 28
                  fle.s        s7, ft11, fs11
                  div          t3, s3, a2
                  srli         a4, s9, 21
                  fle.s        s5, ft7, fs9
                  add          s10, s7, s7
                  fcvt.s.w     fs5, s8, rtz
                  fadd.s       fs0, ft11, fa1
                  fmin.s       fs3, ft3, ft4
                  fcvt.w.s     s2, ft11, rtz
                  sll          a1, s4, t5
                  addi         ra, a5, 13
                  slt          s3, s3, a4
                  mulhu        s6, s5, a2
                  rem          a7, a4, t2
                  fsgnj.s      ft8, fa4, ft7
                  srl          t5, t2, s4
                  flt.s        a4, ft9, fs11
                  fclass.s     tp, fs5
                  sll          s9, a4, gp
                  ori          s0, s1, 1801
                  and          s0, sp, t5
                  auipc        a5, 217707
                  mulh         s0, a7, t4
                  fmin.s       fs5, fa1, fa3
                  fmv.w.x      ft1, s1
                  and          s9, tp, s11
                  sub          gp, s8, t6
                  or           a5, a3, tp
                  add          s11, a5, tp
                  mulhsu       gp, s11, t3
                  fdiv.s       ft0, fs5, fa7, rup
                  remu         s2, a5, s8
                  feq.s        t3, fa1, ft4
                  fcvt.w.s     t1, ft7, rtz
                  remu         s10, a1, t0
                  divu         a3, t2, a3
                  fsqrt.s      ft5, fa4
                  fsqrt.s      fs1, fa6
                  fle.s        t1, fa4, ft6
                  fsgnjx.s     fs4, fa6, fs9
                  fadd.s       fa6, fs2, fs1
                  sll          t2, s8, a0
                  andi         tp, a7, 1183
                  fle.s        zero, ft10, ft11
                  fmin.s       fa1, ft8, fa6
                  sub          s8, t1, s4
                  and          s11, a0, s6
                  fcvt.w.s     s8, ft4
                  slli         a6, ra, 0
                  mulhsu       a0, a2, s0
                  sltu         t4, s5, s2
                  andi         s1, a5, 22
                  ori          a0, t4, 100
                  auipc        a7, 669634
                  lui          a0, 771076
                  fmul.s       ft7, fs4, fa1
                  fcvt.w.s     tp, fs3
                  srl          a0, a5, a2
                  sll          s1, a3, a5
                  fcvt.s.w     ft0, a2, rdn
                  div          a5, s3, s7
                  fcvt.wu.s    s7, ft2, rup
                  fclass.s     zero, fs0
                  addi         s9, s8, 1485
                  slt          t6, a3, a6
                  xor          s1, t6, a5
                  mulh         a3, ra, t3
                  srai         t2, s2, 13
                  sltiu        s0, a6, -1595
                  fsub.s       fs1, fs0, fs2
                  xor          s9, t2, tp
                  srl          s3, a5, t3
                  fsgnj.s      ft8, ft1, ft4
                  slt          t6, a5, a5
                  fcvt.wu.s    t3, fs1, rne
                  fmax.s       fa4, ft5, fa1
                  add          s2, a1, s9
                  sltu         s7, t4, s10
                  mul          s7, t5, s9
                  ori          gp, t3, -1884
                  and          a4, s0, a4
                  fmax.s       fa5, fs7, fs11
                  slt          t1, s6, t2
                  mul          s2, s5, a3
                  mulhsu       a7, s5, a3
                  fmul.s       fs5, ft0, fa0
                  or           ra, t3, s4
                  sll          a4, s0, t2
                  srl          a6, s3, a7
                  auipc        a7, 932697
                  srl          s11, t3, t3
                  fmv.x.w      a0, fs10
                  flt.s        t6, ft0, ft10
                  nop
                  fcvt.s.w     fs4, s4, rtz
                  rem          a1, ra, s7
                  fcvt.w.s     t4, ft10
                  fcvt.w.s     t5, fa4, rdn
                  fcvt.wu.s    t5, ft6
                  mulhsu       s9, a4, t1
                  fcvt.s.wu    ft3, s7
                  fadd.s       fa7, fa5, fa6
                  remu         a5, a5, a7
                  lui          t2, 493159
                  feq.s        s8, ft9, fa4
                  fmin.s       fs2, ft4, fa1
                  flt.s        s11, fa4, fs4
                  auipc        a6, 479004
                  sll          a5, s10, s1
                  srli         ra, s8, 3
                  xor          ra, a0, s0
                  sltiu        s2, s0, -1608
                  fsub.s       fa5, fa2, ft0
                  slti         a1, s11, 464
                  srl          s6, a0, t1
                  divu         t3, t6, s4
                  rem          a5, t1, s0
                  fmul.s       ft1, ft5, fa2
                  fcvt.s.wu    fa4, s11, rdn
                  fsgnj.s      ft9, fs3, fa4
                  mul          gp, ra, s9
                  andi         s3, s6, -345
                  fadd.s       fa2, fs3, fs9, rdn
                  srli         ra, s10, 28
                  divu         t2, a3, a7
                  xori         a3, s8, -1772
                  and          a0, s0, a5
                  fsub.s       ft1, fs3, fa3
                  fsqrt.s      fa0, ft7
                  slti         s1, s9, -1439
                  fsub.s       ft4, fs1, fs0
                  feq.s        sp, fs11, fa7
                  fmax.s       ft7, fs11, fa4
                  div          s11, zero, a6
                  fclass.s     a0, ft1
                  fsgnjn.s     ft7, ft2, ft0
                  divu         sp, s9, tp
                  add          zero, s9, s5
                  fmul.s       fa6, fa3, ft6, rdn
                  srl          a6, sp, s1
                  fmin.s       ft4, ft5, fa4
                  fmul.s       fs5, ft0, fs6, rtz
                  fmul.s       fs0, fa6, fa6, rne
                  remu         s0, tp, a7
                  nop
                  remu         t3, a1, s4
                  and          a4, s2, s5
                  fle.s        t4, fs9, fs6
                  fsqrt.s      fs6, fs6, rne
                  sll          s3, a2, zero
                  fmv.w.x      fa6, a7
                  nop
                  slti         a4, a0, -108
                  fmv.w.x      ft10, sp
                  fcvt.wu.s    s5, fa0, rne
                  fle.s        s5, fa5, fs8
                  slli         a5, s4, 8
                  mulhu        s0, s10, sp
                  andi         a4, t5, 440
                  divu         s2, s1, s6
                  feq.s        a0, fa7, fs5
                  fsub.s       fa3, fa6, fs1
                  flt.s        sp, fa0, fa0
                  sra          t2, s10, gp
                  fmin.s       fs6, ft4, fs1
                  auipc        t3, 239056
                  remu         s8, t3, a3
                  fle.s        s9, ft2, ft5
                  sltiu        s0, s1, -1696
                  fsgnjn.s     fa6, fa6, fs9
                  sltu         a6, s3, sp
                  addi         a7, a0, -1953
                  or           s0, a7, s1
                  fsgnjn.s     fa3, ft3, ft9
                  fsgnjn.s     fs10, fs8, fs9
                  mulh         a4, s10, zero
                  sltu         s9, t5, s6
                  mulhu        a7, s3, t1
                  srl          s7, s11, a4
                  mulh         tp, t6, t4
                  xor          t6, t6, a0
                  fadd.s       ft7, ft9, fa1, rdn
                  remu         s8, s3, a2
                  rem          t1, a3, t2
                  fadd.s       fs10, fs2, ft3, rmm
                  fmv.x.w      s10, fs1
                  mulhu        s1, sp, s2
                  mulh         zero, s10, s10
                  fadd.s       fs2, ft6, ft5
                  fadd.s       fa6, fs3, ft1, rup
                  lui          zero, 614433
                  fle.s        a4, fs3, ft0
                  mul          zero, t3, s0
                  slli         s7, a0, 1
                  fcvt.s.wu    fa0, s4
                  sub          s7, s6, s0
                  fcvt.s.w     fs8, s9
                  fsqrt.s      fa0, fa1
                  mulhu        zero, s4, a2
                  fmul.s       fa2, fa6, fa4
                  fmin.s       fs5, ft3, ft9
                  fcvt.wu.s    t6, ft8, rtz
                  lui          s7, 665509
                  add          s6, a5, t5
                  and          t4, s4, ra
                  addi         a5, s11, 849
                  ori          s8, s10, -1095
                  divu         t4, a1, t3
                  feq.s        s3, fs3, fa6
                  lui          zero, 227175
                  fmul.s       fs8, ft2, fs9, rdn
                  fcvt.wu.s    t4, fa4, rmm
                  or           a1, s5, a4
                  fclass.s     a7, ft2
                  fcvt.w.s     t6, fa2
                  add          zero, s2, t4
                  nop
                  sll          sp, a6, tp
                  fadd.s       fs7, ft4, fs6
                  fle.s        s6, fs7, fs10
                  fsgnjn.s     ft11, fs4, fa6
                  auipc        s8, 237212
                  sub          t3, a0, s6
                  auipc        a0, 789829
                  add          s10, t3, sp
                  xori         a6, s7, 353
                  fcvt.wu.s    a3, ft2
                  mul          a4, s6, a0
                  fmax.s       ft3, fs6, ft10
                  fmin.s       ft4, fs3, ft1
                  fclass.s     gp, fs7
                  feq.s        t1, ft0, fa1
                  div          sp, s0, zero
                  srli         s8, t2, 9
                  lui          ra, 437975
                  srli         a0, t0, 22
                  fdiv.s       ft1, ft7, ft6
                  auipc        t6, 741575
                  mulhsu       ra, a4, t6
                  srai         s8, a5, 2
                  andi         s2, a5, 1208
                  fsub.s       fs5, ft11, ft11, rdn
                  srai         t2, s7, 9
                  fclass.s     s10, fa3
                  auipc        s2, 171329
                  fmax.s       ft11, fs7, fa3
                  fclass.s     s1, fa4
                  fmin.s       ft8, fs6, fs3
                  feq.s        s7, fa6, ft5
                  or           s6, s7, zero
                  slt          s10, t4, a5
                  fmax.s       fs8, ft1, fa2
                  srl          s11, s10, s5
                  sub          zero, t5, t2
                  slt          a3, zero, a2
                  fsqrt.s      ft5, ft8, rmm
                  fmax.s       ft9, fa0, ft4
                  fmul.s       ft6, ft11, fa3, rne
                  fsgnjx.s     ft1, fa5, ft7
                  slt          a3, s2, a5
                  xori         a4, sp, -654
                  fsgnjx.s     ft1, ft4, ft7
                  ori          s6, gp, 1484
                  fclass.s     a6, fs3
                  slti         s10, a7, -825
                  fsqrt.s      fs4, fs10
                  mulhsu       t5, t0, t4
                  fcvt.wu.s    t5, fs11
                  fmv.w.x      ft1, s0
                  rem          s6, t0, t6
                  remu         t1, s11, a4
                  sub          s8, t2, a5
                  auipc        t5, 460508
                  sub          sp, t5, t6
                  fle.s        s5, ft7, fs4
                  and          a5, s4, s2
                  feq.s        s9, fa3, ft7
                  mulhu        a0, t4, ra
                  add          t5, s7, sp
                  fdiv.s       ft10, fs0, fs10, rmm
                  srli         s5, s2, 5
                  divu         t2, t6, s0
                  sub          a7, sp, a3
                  fsgnj.s      ft11, fs4, ft2
                  slt          s9, a5, t2
                  mulhsu       s2, s2, a3
                  fsgnj.s      ft5, fs10, ft11
                  fsub.s       ft10, ft0, fa4, rtz
                  sub          a6, s2, a4
                  xor          t1, t4, sp
                  mul          a0, a6, t0
                  xori         a0, s10, 1276
                  divu         tp, a7, t1
                  div          t3, s7, t6
                  flt.s        zero, fs0, ft1
                  slt          a6, t0, a6
                  mul          a6, s0, a2
                  mulhsu       s3, a5, s9
                  sub          zero, zero, a2
                  mulhsu       t4, s2, a0
                  fle.s        s7, fa1, fs1
                  sltiu        ra, t6, 1445
                  fmv.w.x      ft4, zero
                  slt          a4, a0, s5
                  fmv.x.w      s9, ft0
                  fle.s        s5, ft5, fs3
                  srai         a5, gp, 28
                  sll          s11, a7, s7
                  ori          s6, s2, -1131
                  nop
                  srl          t2, s9, a7
                  fmul.s       ft7, fs10, ft0, rdn
                  slti         a5, t6, -1193
                  fcvt.s.wu    fa0, t4, rmm
                  slli         t1, s7, 29
                  rem          a5, a2, t3
                  sra          a3, t1, t5
                  slti         s0, t4, 1343
                  add          tp, t0, s4
                  sltu         s11, t3, s5
                  and          a4, t2, s3
                  fdiv.s       fa7, fs2, fs0
                  sltiu        sp, s10, -1603
                  fsub.s       ft4, fa1, fs1
                  fmv.x.w      zero, ft3
                  sltu         s6, a4, a4
                  fsgnj.s      fs0, ft6, fa1
                  mulhu        a0, s5, tp
                  fadd.s       ft7, ft10, fs5, rtz
                  fsqrt.s      ft0, fa7
                  fsub.s       ft3, ft10, fs0, rmm
                  mul          t6, a7, sp
                  mul          s0, t5, t1
                  divu         a4, a2, s9
                  srl          gp, s4, a0
                  nop
                  fle.s        a1, fs4, fs7
                  flt.s        tp, ft10, fa5
                  slli         a1, s9, 25
                  fcvt.s.wu    ft3, a5
                  flt.s        s10, ft4, ft3
                  fcvt.wu.s    tp, fa1, rtz
                  fmax.s       fs2, fs2, ft8
                  fmin.s       fs5, fa6, fs7
                  srai         s10, ra, 27
                  mulh         s2, a4, gp
                  sub          t4, a1, s2
                  slt          t3, s7, gp
                  sltiu        t4, a7, 543
                  auipc        s10, 695982
                  fsgnjx.s     ft7, ft9, fs4
                  fmin.s       fs11, ft2, ft6
                  feq.s        t2, fs4, fa3
                  fmv.w.x      fa1, t1
                  fcvt.s.wu    ft11, s3, rtz
                  fsqrt.s      fa3, fs7, rne
                  mulhsu       a6, s3, a4
                  feq.s        t1, fs1, fs11
                  div          s7, s9, t0
                  remu         s5, a7, s2
                  fclass.s     s1, fa5
                  sltiu        ra, s1, -1084
                  xori         sp, a6, 10
                  remu         s11, a4, s0
                  fcvt.s.wu    fs6, t0, rtz
                  fadd.s       fs0, fs1, fa1
                  slli         a5, a4, 3
                  fcvt.w.s     a0, ft10
                  remu         t3, s8, s4
                  andi         s10, s8, 208
                  srl          sp, a0, a7
                  fcvt.w.s     s8, fa4
                  fsub.s       ft7, ft9, fs3, rne
                  fmul.s       fa3, fa2, ft8
                  addi         a6, t3, -1370
                  fdiv.s       ft9, fa6, ft3
                  fdiv.s       ft0, fa5, ft8
                  andi         a6, a4, -998
                  divu         a1, s5, a4
                  srli         zero, t6, 31
                  sltu         s0, s1, s9
                  fcvt.wu.s    a5, fs7, rup
                  fcvt.wu.s    t2, ft10
                  slli         a7, tp, 27
                  slli         a4, gp, 17
                  sltiu        s6, a2, -1062
                  srli         a5, t1, 28
                  fsgnj.s      fs3, fs11, ft7
                  addi         t4, s8, 1157
                  fadd.s       ft4, fs3, fs9
                  fcvt.wu.s    t3, ft1
                  slli         t1, t6, 23
                  slt          t6, s5, zero
                  sub          t2, t3, s4
                  fcvt.w.s     s2, fs3, rtz
                  mulhsu       s11, a3, t6
                  srl          t3, s8, a1
                  add          ra, s9, s4
                  mulhu        a7, gp, a5
                  remu         s2, a2, t1
                  divu         t4, zero, a7
                  nop
                  sll          t6, a1, a2
                  fmv.x.w      gp, fs11
                  fcvt.w.s     a3, fa6, rup
                  addi         s6, s6, -1954
                  mulh         t5, a6, s4
                  fsgnjx.s     fa0, fa6, fa5
                  andi         s3, tp, 309
                  rem          a7, t5, s7
                  fmul.s       ft0, ft8, fa1
                  fadd.s       ft10, fs11, ft4
                  srli         s6, zero, 20
                  xori         sp, a1, -726
                  ori          sp, t3, 910
                  xor          s9, a3, t5
                  sltiu        s9, s3, 1553
                  srli         s0, s9, 26
                  fcvt.w.s     ra, ft9, rmm
                  srl          s0, s10, t6
                  sltiu        zero, tp, -1704
                  feq.s        t3, fs7, fs10
                  addi         gp, s10, 2042
                  fmin.s       fs4, fa2, fa4
                  lui          s11, 293644
                  slli         s11, ra, 17
                  mulh         tp, t6, tp
                  addi         s11, s9, 1835
                  mul          s11, a1, a6
                  or           s9, a6, s9
                  xor          sp, t4, s4
                  ori          tp, s7, 471
                  fmv.x.w      s0, fa7
                  xori         s8, sp, -652
                  sub          t5, t2, t0
                  fcvt.s.wu    fa0, a3
                  mulh         zero, s2, t0
                  sll          s5, s0, tp
                  add          t2, s1, s1
                  fcvt.s.w     fs6, t6, rne
                  and          s0, t2, zero
                  fdiv.s       fs9, fs11, fs3, rmm
                  fmul.s       ft10, fs1, ft8, rne
                  sltu         s9, tp, a7
                  mulh         a1, t4, a6
                  sltu         s3, a4, t5
                  div          a3, t0, s6
                  srli         ra, s7, 23
                  fcvt.s.w     ft4, s2, rdn
                  fcvt.s.w     ft9, s11, rdn
                  srli         s3, s4, 26
                  fcvt.wu.s    s2, ft0, rne
                  fmv.x.w      s3, fs0
                  fclass.s     ra, ft11
                  fcvt.s.w     ft4, s3, rmm
                  addi         t4, s1, 1620
                  andi         t6, t5, 1169
                  fsub.s       fa5, ft5, fs1, rmm
                  mulh         a1, s7, s2
                  flt.s        a0, fs11, fs7
                  srl          a7, tp, t6
                  andi         a5, a0, 2042
                  slti         t2, t6, -1934
                  fcvt.s.wu    ft2, a7
                  nop
                  fmin.s       fs6, fa7, ft9
                  remu         s7, s1, s3
                  fle.s        t4, ft2, fs1
                  fsqrt.s      ft4, ft5, rtz
                  fle.s        s10, fs2, ft4
                  fdiv.s       ft7, fs11, fa0
                  srl          t2, s0, s7
                  sltiu        a1, ra, -1940
                  fsgnjx.s     ft11, fa6, ft2
                  srli         a7, a5, 31
                  fle.s        a3, ft10, fs10
                  slli         a6, a3, 20
                  fsub.s       ft8, fs1, fa4
                  or           s0, s9, sp
                  fsgnjx.s     ft8, ft8, ft6
                  or           s6, t5, s4
                  fcvt.w.s     t2, ft7, rdn
                  sra          t2, gp, sp
                  fmin.s       ft4, fa4, fa1
                  fdiv.s       fa4, fa1, ft0, rup
                  lui          a4, 86584
                  fcvt.s.wu    fs0, t1, rup
                  fdiv.s       fs1, fs5, fs10
                  fsgnj.s      fs7, fa3, fs4
                  feq.s        t5, ft3, ft6
                  fdiv.s       fs4, fs2, fs9, rne
                  fsgnjx.s     fa7, fs9, fa7
                  fadd.s       fa6, fs2, fs9, rtz
                  fsub.s       fs2, fs4, fa7
                  fsgnjn.s     fs0, ft6, ft11
                  fmv.w.x      fs6, t2
                  fcvt.wu.s    s7, ft5
                  srli         t5, a4, 28
                  xor          sp, s11, t2
                  xor          s3, t3, gp
                  fmin.s       fa4, ft4, fa5
                  fcvt.s.wu    fa1, gp, rne
                  slti         t1, s7, 1594
                  fcvt.s.wu    ft8, zero, rtz
                  fmv.x.w      gp, ft3
                  slti         a1, a2, -152
                  or           s6, a6, s2
                  addi         s10, t2, -828
                  fle.s        a3, fa4, ft8
                  fmax.s       fa1, fa7, ft9
                  addi         s9, a5, 215
                  mulh         a4, t1, s5
                  fdiv.s       fs11, fs1, fs9, rmm
                  fclass.s     a5, ft6
                  fsgnj.s      fs8, fa7, ft4
                  lui          a0, 484951
                  addi         s2, a4, 988
                  ori          s7, s3, -1705
                  slt          a3, tp, a7
                  fle.s        zero, ft9, fa5
                  sltu         tp, tp, ra
                  mulhu        gp, t6, zero
                  fmul.s       ft11, ft10, ft5, rne
                  add          t3, s10, a2
                  sub          t5, t2, t4
                  mulhu        a7, a3, t1
                  xor          tp, s8, a6
                  fcvt.w.s     a1, ft4
                  srai         t5, a4, 29
                  rem          a6, s7, t6
                  fdiv.s       fa7, fa2, ft0
                  feq.s        a5, fs8, ft11
                  slli         s11, s4, 13
                  fmax.s       fs10, ft0, fa7
                  sltiu        a5, t2, 335
                  fmv.x.w      s6, fa1
                  fsgnj.s      fa7, ft9, fa4
                  nop
                  xori         s9, a0, -292
                  feq.s        s2, fs2, ft1
                  rem          s5, a4, s0
                  ori          s10, a6, 1891
                  slti         a4, t5, -1239
                  remu         s1, a0, zero
                  fmul.s       ft4, fs4, fa4
                  slt          a4, gp, t0
                  mul          s11, sp, t1
                  fsub.s       ft8, fa5, fs0
                  rem          a0, t4, a3
                  slt          s1, gp, s1
                  fmv.x.w      t2, ft6
                  srl          s2, t3, zero
                  fmv.w.x      ft10, a3
                  andi         gp, ra, -1396
                  fadd.s       fs10, fa4, fs3
                  sra          a5, s3, t3
                  slti         a6, s1, 824
                  sll          s3, tp, s3
                  fmv.w.x      fs2, s2
                  mulh         t5, zero, s11
                  fsgnjx.s     ft5, fa4, fa5
                  fsgnjn.s     fs6, fs2, fa2
                  mul          ra, t2, t3
                  fsub.s       ft5, fa6, ft3
                  srai         zero, a2, 24
                  fmin.s       fs0, ft0, fs2
                  sll          a0, t2, a7
                  nop
                  mulhu        t5, s6, sp
                  fsgnjx.s     fs1, fa7, fa0
                  fle.s        a1, fs0, fs5
                  fsub.s       fa5, ft10, fs7, rmm
                  sra          s6, gp, ra
                  fmul.s       ft5, fs3, fs4
                  flt.s        a6, ft6, fs8
                  fdiv.s       ft7, fa0, fs1
                  xori         s3, s11, 629
                  andi         zero, t1, -1031
                  addi         a1, t5, 528
                  fmv.x.w      a4, fs3
                  sltiu        s2, a3, -1571
                  fmv.x.w      s0, ft3
                  sra          s6, a7, a7
                  xori         s5, t3, -691
                  mul          t5, s11, a2
                  slt          sp, a3, a0
                  divu         a7, t0, a0
                  fcvt.w.s     s8, fa6, rup
                  and          gp, s8, s8
                  fadd.s       fs7, fa0, ft8
                  slt          s6, s10, s5
                  sltu         s10, a5, s3
                  fmax.s       fs8, fa3, fs11
                  slli         a7, a6, 22
                  fmul.s       ft1, fs8, fs0, rmm
                  nop
                  auipc        s9, 35074
                  lui          t3, 1036548
                  fsgnjn.s     fs4, fs11, fs2
                  slti         zero, s11, -1740
                  or           s10, zero, s1
                  flt.s        s5, ft10, ft11
                  fadd.s       ft2, fa7, fa3, rne
                  remu         s6, s5, t5
                  fsub.s       fs8, fa5, fs0
                  nop
                  fmv.x.w      t1, fs2
                  fsqrt.s      fa2, fa5
                  mulhu        a7, a3, t1
                  mulhu        a5, a6, a1
                  slli         a4, s9, 9
                  slti         t5, s0, -246
                  mulhu        s2, zero, t0
                  fclass.s     s8, fa3
                  mulhsu       t1, s10, tp
                  fadd.s       fs2, ft4, ft2
                  fmin.s       fa7, ft8, ft8
                  and          zero, s10, a1
                  ori          a4, t5, -800
                  andi         t4, s10, 1790
                  fcvt.s.w     fa0, a5
                  fsgnjx.s     fa6, ft3, fa2
                  fmin.s       ft11, fs1, fa2
                  fmin.s       ft0, ft8, ft7
                  flt.s        s5, fs9, fs2
                  fmv.x.w      a4, ft10
                  fmax.s       ft6, fa0, fa5
                  sltu         t4, a3, a6
                  fsqrt.s      ft10, fs6, rmm
                  or           a3, t4, t0
                  mulhu        gp, s5, s5
                  sra          s9, s2, t6
                  and          s9, s8, gp
                  mul          t5, s1, ra
                  nop
                  add          a6, a2, t2
                  fmv.x.w      s2, ft7
                  fle.s        t2, fs4, ft4
                  xor          s9, a3, a0
                  fsgnjx.s     fa2, fs1, ft8
                  slt          s7, t0, s7
                  sub          a6, a0, gp
                  fmv.x.w      s0, ft3
                  rem          a7, t1, t6
                  fsgnj.s      ft10, ft3, fs2
                  srl          zero, s0, t3
                  auipc        s8, 178980
                  auipc        s0, 279007
                  nop
                  nop
                  srli         t5, gp, 22
                  mulhu        s5, a6, a2
                  addi         s3, t3, -1548
                  nop
                  fcvt.s.w     fa1, t3, rne
                  fcvt.wu.s    s10, ft10
                  fcvt.s.w     fs7, gp, rmm
                  flt.s        s7, ft9, fa6
                  fmv.x.w      s9, fs2
                  auipc        s7, 179666
                  slli         tp, gp, 25
                  add          s2, t5, t1
                  fmul.s       ft5, fa1, fs6, rtz
                  fsqrt.s      ft6, fa5, rdn
                  fsub.s       fs6, ft0, ft9, rtz
                  div          ra, t6, a3
                  xor          a5, s0, a7
                  andi         a3, t6, 1469
                  nop
                  flt.s        s7, fs8, ft8
                  fcvt.s.wu    fs9, a6, rmm
                  fmv.x.w      a1, fs1
                  andi         s8, a6, 1020
                  fmul.s       fs3, fa0, fa1
                  srl          a6, s7, t3
                  divu         s10, gp, s6
                  fcvt.w.s     s1, fs8
                  addi         a1, t3, -1412
                  div          s7, tp, t1
                  mulhsu       sp, a4, t0
                  remu         zero, a2, a3
                  sltu         gp, s8, a7
                  mul          a3, a7, a2
                  feq.s        ra, fs8, ft7
                  nop
                  fsqrt.s      fa7, ft10, rdn
                  xor          s10, s3, a3
                  add          s5, zero, a2
                  add          ra, s2, s1
                  srli         sp, a4, 21
                  feq.s        gp, fa5, ft5
                  sltu         s3, a4, a5
                  fclass.s     t3, ft1
                  rem          a5, a6, s11
                  fcvt.w.s     tp, ft10
                  slt          t3, ra, zero
                  fmv.x.w      a0, fs5
                  fcvt.s.wu    fs4, a5
                  xori         s5, t0, -1731
                  mulhu        a7, t4, s8
                  mul          s10, a5, s3
                  ori          ra, a7, -1662
                  sub          ra, a2, t1
                  fsgnjn.s     fa6, ft8, ft5
                  mulhu        s6, a2, s1
                  mulh         a0, s9, a7
                  mulh         a7, s4, s9
                  andi         t6, s11, -647
                  rem          s3, s9, t6
                  fsqrt.s      ft3, ft10, rup
                  srai         a4, s6, 19
                  fsgnjn.s     fs7, fa4, fa3
                  mulh         a1, sp, t3
                  andi         ra, s4, 349
                  fmul.s       ft1, fs7, fs3
                  fmv.x.w      a4, fa3
                  fmul.s       fs6, fa7, ft1
                  fclass.s     t2, fs10
                  sub          a7, s6, t5
                  fcvt.s.wu    fa3, a1
                  rem          tp, t6, a3
                  remu         s9, t0, a4
                  fsub.s       ft3, ft3, ft11
                  fmax.s       fa3, fa0, fa7
                  srli         tp, s5, 29
                  or           tp, a7, s11
                  fsgnjn.s     ft8, fa6, fa7
                  divu         s11, s8, t5
                  sra          a4, a5, s11
                  andi         s8, t4, -1534
                  flt.s        a7, fs10, fa4
                  and          t5, zero, a0
                  fsqrt.s      ft1, fa2, rtz
                  div          t3, t3, a1
                  ori          ra, zero, 1850
                  fsqrt.s      ft9, ft8, rtz
                  rem          a5, s11, t5
                  ori          s5, a6, 116
                  fcvt.wu.s    a0, ft4, rmm
                  xor          a3, ra, s3
                  fadd.s       fs4, fa6, ft9
                  mulhu        t4, s8, a7
                  fcvt.s.wu    ft7, s2
                  addi         a6, t4, -1216
                  sltu         a5, t5, s4
                  addi         ra, gp, 1381
                  srli         tp, s11, 4
                  fadd.s       fs5, ft5, ft7, rmm
                  srl          s2, t6, s2
                  auipc        tp, 1026977
                  divu         t3, a0, a6
                  fle.s        a7, fa5, fa2
                  remu         gp, s1, t3
                  sll          a3, s10, ra
                  lui          s11, 69152
                  mulh         s7, zero, zero
                  fsgnjx.s     fs0, fa1, fa1
                  ori          s0, t6, -885
                  srl          a3, t5, a7
                  fcvt.s.wu    ft2, s3, rne
                  or           a1, sp, a5
                  fmv.x.w      t5, fs7
                  or           s5, s3, tp
                  rem          s8, a0, a6
                  slli         s7, s11, 3
                  fmin.s       ft8, fs1, fa3
                  ori          t5, t5, -831
                  mul          ra, t3, a5
                  fcvt.wu.s    s1, fs11
                  addi         gp, s2, 846
                  mulh         s6, t1, s10
                  mulhsu       s6, zero, zero
                  fmin.s       ft8, fs6, ft2
                  andi         a4, tp, -1327
                  feq.s        t5, fa0, fs9
                  mulh         a6, a2, a2
                  fcvt.w.s     gp, fs4, rne
                  slli         sp, s5, 17
                  fmin.s       fa3, fa0, fs7
                  fmax.s       fa1, ft4, fs8
                  slt          s9, s1, s11
                  sltiu        s8, a6, -299
                  fsgnj.s      fs1, fs9, ft4
                  mulhsu       s1, a3, sp
                  or           a0, a1, a4
                  fmul.s       fa7, fs7, ft9, rne
                  ori          s8, s7, -1743
                  flt.s        s1, fa2, fa4
                  divu         t3, a6, s0
                  fcvt.s.w     ft2, t1
                  slti         a3, a4, -1461
                  slti         a3, a4, -1529
                  div          s3, s0, t5
                  fmax.s       ft10, fs8, fs1
                  srli         zero, s4, 9
                  fsgnjn.s     ft3, fs1, fs0
                  flt.s        t2, fs5, ft7
                  and          s6, s0, a1
                  fsqrt.s      fs5, fs4
                  fcvt.w.s     s9, fs0
                  srai         s2, a3, 2
                  rem          tp, t2, t5
                  srai         a3, t0, 0
                  fclass.s     a3, ft5
                  fsgnjx.s     fs9, fs4, fa4
                  mulhu        a3, a1, t5
                  div          zero, s11, t0
                  auipc        t1, 913918
                  flt.s        s0, fs6, fa5
                  sltiu        zero, zero, -1523
                  mul          t5, s2, t0
                  fcvt.w.s     s6, fs1
                  fcvt.s.w     ft11, s7
                  auipc        t1, 186565
                  srai         t3, a7, 5
                  feq.s        t2, fs10, fa0
                  div          s0, a3, s2
                  fmax.s       fa4, fs6, fa7
                  fcvt.s.wu    fs11, zero, rmm
                  ori          ra, ra, -1253
                  lui          a4, 544578
                  fmv.w.x      ft6, t1
                  ori          a5, a5, -2039
                  mul          ra, t6, t3
                  fmax.s       fa1, fa2, fa0
                  slti         s5, s0, -1932
                  slt          s1, sp, s10
                  fclass.s     a5, fa6
                  div          zero, a4, t2
                  sra          s3, t0, a3
                  fmin.s       ft8, fa6, ft8
                  mulh         t3, a5, s3
                  fcvt.s.wu    ft3, t6, rmm
                  fle.s        s7, ft10, fs5
                  mulhsu       t2, s2, ra
                  fsgnjx.s     fa1, fa4, fs8
                  auipc        tp, 155910
                  rem          t1, zero, t5
                  srl          s9, s0, s10
                  srli         s3, t6, 27
                  xor          s7, t4, a3
                  mulhu        s1, t3, ra
                  fsgnj.s      fs0, fs11, fs8
                  ori          ra, s8, 327
                  or           s11, a7, s4
                  fsqrt.s      fs10, fa3, rne
                  fdiv.s       ft1, ft8, ft0
                  add          t1, gp, s11
                  fmax.s       ft11, fa3, ft3
                  srl          t1, t4, t2
                  sra          a4, ra, s8
                  srl          a4, s7, a7
                  srl          gp, t6, s0
                  fcvt.s.w     fa7, s9
                  srl          s7, t3, t1
                  srl          a1, a0, zero
                  sltiu        gp, t5, -272
                  add          s3, a2, s6
                  and          t2, a1, tp
                  srai         s0, s5, 11
                  fsqrt.s      fs6, fs5
                  fcvt.s.w     ft3, t1
                  fadd.s       fs2, ft2, fs2, rtz
                  add          tp, s5, s7
                  fcvt.s.wu    fs6, s8
                  flt.s        a4, fa4, fs9
                  fsgnjn.s     fs3, fs0, fa7
                  xori         sp, t3, -190
                  nop
                  addi         sp, a5, 679
                  mulhu        s5, t2, ra
                  or           t6, s5, s3
                  andi         zero, a4, -936
                  feq.s        gp, fs9, fs5
                  fmul.s       fa6, ft11, ft0, rup
                  mulhsu       s8, t6, t4
                  fadd.s       fs0, ft0, fs8, rne
                  xori         t5, s10, -329
                  fsqrt.s      fs4, ft6, rmm
                  auipc        s2, 187208
                  remu         tp, gp, a4
                  feq.s        a1, ft6, fs7
                  slt          a1, sp, s2
                  fmv.w.x      fs7, s11
                  sub          t5, s9, s1
                  rem          s0, t3, s5
                  remu         gp, t1, a4
                  flt.s        s0, ft7, fs4
                  xor          t3, gp, ra
                  fcvt.s.w     ft1, t4
                  fsgnjx.s     ft7, fs3, ft0
                  add          a1, s11, a1
                  fsgnjn.s     fs8, fs4, ft8
                  slt          a3, s11, t3
                  sra          s11, s1, t0
                  feq.s        gp, ft9, fa5
                  fsgnjx.s     ft0, fs2, ft4
                  slli         t5, a2, 31
                  mulh         a3, s11, s11
                  fsqrt.s      fs11, fa0
                  fmin.s       ft4, fa3, fa4
                  sll          ra, zero, s0
                  add          a3, zero, s1
                  slli         t6, s2, 27
                  fcvt.s.wu    ft4, s1, rup
                  div          t4, s10, tp
                  fcvt.s.wu    ft9, s7
                  auipc        a5, 162681
                  fmin.s       ft7, fs1, fs10
                  lui          tp, 855836
                  sltiu        a4, s4, 789
                  rem          s10, s1, s9
                  mulh         s7, a6, t0
                  fcvt.s.wu    fs3, s10, rne
                  srli         s7, a1, 4
                  fsqrt.s      ft2, fa0
                  addi         a4, s10, -1130
                  fmv.w.x      fa0, t1
                  fle.s        a4, fs6, ft7
                  srl          s5, a7, t6
                  ori          a6, t5, 575
                  sra          a6, s1, s2
                  divu         s8, zero, s0
                  mulhu        t3, t4, a3
                  fsgnjn.s     ft5, fs0, fa5
                  fdiv.s       fs2, fs7, fa3, rmm
                  xor          t1, zero, t0
                  xori         a4, a2, -122
                  sub          a0, a3, a5
                  fadd.s       ft10, ft8, fs5, rtz
                  fadd.s       ft4, ft10, fa7, rup
                  remu         t1, sp, s4
                  xor          t4, t0, gp
                  and          a7, a5, s5
                  sltiu        s8, s0, -608
                  fmv.w.x      ft8, s2
                  sltiu        sp, s4, -980
                  fsgnj.s      ft3, fs11, fa7
                  nop
                  mulh         s3, s11, t6
                  fmv.x.w      a6, fs0
                  fadd.s       fs4, ft1, fs0, rmm
                  andi         a4, s10, 1741
                  nop
                  fcvt.w.s     s9, ft2, rup
                  fmv.x.w      s7, fs6
                  sltu         a4, t2, sp
                  xor          t2, sp, t4
                  slli         s11, s10, 7
                  auipc        t5, 724148
                  fmv.w.x      ft11, t0
                  slt          a6, s5, t6
                  remu         t3, s4, ra
                  sll          zero, t4, s5
                  slt          tp, a1, t4
                  fclass.s     s2, ft1
                  fsgnjx.s     fs7, ft10, fs4
                  rem          s3, zero, a5
                  lui          a0, 451629
                  fclass.s     a5, fa1
                  fclass.s     s11, ft9
                  or           s1, a4, s7
                  srl          t1, a3, tp
                  fmin.s       fs6, fs8, ft1
                  fsub.s       ft5, fs11, fa5, rtz
                  flt.s        a3, ft11, fa7
                  fdiv.s       fa4, ft3, fs9
                  fcvt.s.wu    ft9, s3, rtz
                  sub          gp, s8, ra
                  slt          s1, t1, tp
                  fsgnjx.s     fs3, fs2, ft3
                  ori          a3, t0, -367
                  or           t5, s1, t3
                  andi         t5, t3, 451
                  fsub.s       fs6, fs9, fs8
                  nop
                  xor          ra, t6, s8
                  flt.s        a7, fs1, fa7
                  fle.s        s2, fs1, fs4
                  divu         s3, s2, s6
                  mulh         s11, s1, s4
                  xori         a1, s6, 1280
                  sub          t6, t3, a4
                  slli         a1, t2, 17
                  nop
                  xor          a7, zero, tp
                  fmax.s       fa1, fs3, fs7
                  andi         ra, s6, 9
                  fle.s        zero, fa7, fs7
                  sub          s9, zero, s9
                  mulh         s6, t3, ra
                  fcvt.s.w     fs1, s2
                  srl          s6, s6, t1
                  fclass.s     s6, fs5
                  srli         tp, s0, 13
                  mul          sp, a2, t5
                  and          t4, t6, t3
                  remu         t6, t4, a5
                  feq.s        s7, ft7, fs4
                  sltiu        t5, s2, -1259
                  or           t4, s1, s7
                  srai         s3, a6, 25
                  sltiu        tp, s11, -1847
                  fmin.s       fa4, fa6, fa4
                  addi         a7, s6, 1641
                  and          s8, a2, gp
                  fcvt.w.s     a3, fs6, rtz
                  fcvt.w.s     s1, fs7, rmm
                  fsgnj.s      fs11, fs6, fa0
                  andi         ra, a4, -533
                  slli         s7, t5, 17
                  add          a4, s11, t6
                  remu         tp, ra, s0
                  sll          s7, t6, gp
                  sltiu        t4, s5, -1242
                  fadd.s       fa7, fs7, fs6
                  xori         s11, sp, 1854
                  andi         s7, t3, -455
                  ori          t4, t0, 1749
                  div          s2, a4, t3
                  fcvt.w.s     gp, ft9
                  xori         s9, s7, 786
                  fcvt.w.s     zero, fs9, rne
                  add          t6, s8, t4
                  fmv.w.x      fa1, t1
                  fmul.s       fa3, ft3, fs3, rdn
                  xori         zero, t5, 523
                  feq.s        s0, fs0, fs2
                  div          zero, t6, t5
                  fmin.s       ft4, ft0, fs0
                  fmv.w.x      fa1, a7
                  xori         s3, s5, -400
                  and          a1, s4, sp
                  rem          s1, a0, a5
                  andi         a7, s6, 1597
                  flt.s        a0, fa4, fs10
                  sra          s0, s2, t2
                  srai         s5, s7, 19
                  mulh         s10, a4, a2
                  fsgnjx.s     fa2, fs9, fs3
                  remu         s5, t0, t0
                  fcvt.s.wu    ft8, t1, rtz
                  srl          a0, t3, tp
                  slt          a5, t6, a5
                  srl          t5, s6, a5
                  ori          s6, s5, 7
                  fsgnjn.s     ft5, ft2, fa0
                  flt.s        gp, fs8, fs7
                  fcvt.s.w     ft8, s10, rne
                  add          zero, t0, a0
                  sltiu        zero, sp, 243
                  fsub.s       fs0, fa2, ft4
                  add          s2, t4, ra
                  srli         a4, t5, 18
                  or           a7, t4, a5
                  sll          sp, s5, a0
                  fcvt.s.w     fa6, a1
                  sll          sp, s3, tp
                  flt.s        a3, fs1, fa6
                  add          t4, t2, ra
                  fsub.s       ft11, fs8, ft6, rmm
                  fmul.s       fs0, ft10, ft9, rmm
                  fsgnjx.s     fa1, ft5, ft1
                  fmv.w.x      ft5, gp
                  slti         a4, a0, -288
                  fsgnjx.s     fs6, fs9, fa6
                  fmax.s       fa0, ft4, fs2
                  mulh         s10, t6, a0
                  sll          sp, s11, s7
                  mul          t4, s9, ra
                  fsgnjn.s     fs6, fa2, fs7
                  fmax.s       fa4, fs7, fs0
                  fadd.s       fa7, fs6, ft5
                  sll          s1, a2, ra
                  auipc        a5, 616689
                  fcvt.s.wu    fs6, s8, rup
                  fcvt.w.s     tp, ft8, rtz
                  lui          a4, 482985
                  addi         a0, a6, -593
                  or           a5, ra, t6
                  fmax.s       ft11, fa3, fa3
                  addi         t5, t6, 553
                  addi         a7, s7, 2006
                  feq.s        s1, fa0, fa6
                  rem          t1, s8, s1
                  fadd.s       ft9, fs8, fs1
                  fcvt.s.wu    fs4, gp, rup
                  fsgnjx.s     fs0, fa6, ft1
                  srli         t4, t5, 27
                  remu         t4, a5, a5
                  nop
                  fmul.s       fs9, fs4, fs10
                  fclass.s     a0, fs0
                  add          t4, s0, a2
                  rem          t5, a3, a2
                  add          t1, gp, gp
                  fcvt.s.wu    ft2, s2
                  andi         tp, tp, -473
                  xor          gp, ra, sp
                  fcvt.wu.s    t3, fs6, rmm
                  fdiv.s       ft5, ft11, fa6, rup
                  and          tp, a0, s10
                  slti         ra, s11, -1964
                  fle.s        a0, ft3, fa0
                  fsub.s       fs2, fa2, fs9
                  fmul.s       ft3, fs9, ft5, rne
                  sltu         s7, s6, sp
                  mulhsu       s0, sp, t4
                  xor          t4, tp, t3
                  and          t6, t6, s6
                  addi         a4, s8, 1912
                  fsqrt.s      fs3, fs4
                  sub          t6, a2, s1
                  fsgnj.s      fs6, fs11, fs8
                  sra          a5, t0, s2
                  fcvt.s.w     ft9, s2, rmm
                  lui          t5, 359608
                  andi         tp, s4, -1989
                  fcvt.wu.s    s2, fs0
                  sub          s5, s6, s8
                  srl          s5, t1, t6
                  fmax.s       fa7, ft2, fs1
                  fcvt.w.s     gp, fs2, rup
                  fmv.w.x      ft7, t1
                  slt          a3, s11, sp
                  ori          a5, t4, 1384
                  slt          gp, s5, s0
                  flt.s        zero, fs0, fs7
                  fcvt.s.wu    ft0, s4
                  fsgnjx.s     fa0, ft2, ft9
                  sub          a0, t4, s3
                  fsgnjx.s     fa6, fs4, fs3
                  fclass.s     gp, fs1
                  fsgnjx.s     fs3, ft3, ft5
                  sub          s2, a1, s7
                  fcvt.s.w     fs2, s8
                  divu         a4, t4, a7
                  div          t5, s10, zero
                  srli         zero, a3, 29
                  slli         gp, s0, 20
                  fsgnj.s      ft7, ft5, ft6
                  and          s0, s1, tp
                  rem          s11, zero, s6
                  sub          s7, s7, gp
                  divu         t4, s9, t6
                  or           a4, s10, a5
                  slti         t1, sp, -1752
                  fclass.s     a0, fs9
                  fmul.s       ft10, fs10, ft11, rdn
                  fdiv.s       ft8, fs4, ft4, rup
                  fmv.x.w      gp, fs7
                  add          t6, s6, s10
                  mulhsu       a6, a1, a2
                  fle.s        t4, fs3, fa3
                  sub          s3, a1, a3
                  sltiu        t4, s1, -1989
                  xori         sp, s3, -325
                  flt.s        a5, ft7, ft11
                  srl          s7, a7, t6
                  fmul.s       fs11, ft1, ft2, rup
                  or           s11, s3, a0
                  fcvt.s.wu    fs6, t3
                  srl          a5, t3, a6
                  feq.s        t5, fs0, fs7
                  fcvt.s.wu    ft8, a7
                  fsub.s       fs11, fa2, ft7, rmm
                  divu         s10, s3, t4
                  lui          s0, 63086
                  or           a5, t2, a2
                  fcvt.w.s     a6, ft8, rup
                  remu         s1, a0, s1
                  div          a6, s3, s8
                  mulhu        ra, t1, ra
                  fsgnjx.s     ft1, fs10, fa4
                  fsgnj.s      fs9, ft7, ft5
                  xori         gp, sp, -67
                  fle.s        gp, fs0, ft11
                  addi         t1, t5, -2028
                  fle.s        s3, fs9, ft8
                  mulhsu       s1, sp, t3
                  div          s7, s6, s7
                  rem          s3, t6, a7
                  fmax.s       fs7, ft7, fa4
                  flt.s        zero, ft11, fa1
                  sub          s10, s8, ra
                  fmv.x.w      s8, fs7
                  add          s0, t2, t4
                  fcvt.wu.s    s2, ft11, rmm
                  lui          t5, 281229
                  and          a5, a2, a2
                  div          a5, s4, s9
                  fcvt.w.s     s0, fs3
                  fmax.s       ft4, fs7, fa3
                  fsgnjx.s     ft6, fa4, fs10
                  fclass.s     a7, fa7
                  fsgnjn.s     fs3, fs1, fs4
                  fmul.s       fs4, ft11, fs11, rup
                  fclass.s     s5, fs10
                  flt.s        a4, fs4, fs0
                  sltiu        t1, s10, 1309
                  lui          t4, 634405
                  sub          a7, t6, a5
                  mulh         s7, a1, a5
                  fsqrt.s      fa3, fs7
                  slt          s5, ra, s7
                  fmul.s       fs9, fs8, fa5
                  fcvt.wu.s    a0, ft1, rdn
                  sll          t5, a0, a2
                  sll          s1, s10, t4
                  fcvt.s.w     fs9, a6, rmm
                  or           s11, s8, t2
                  xor          a7, s0, s8
                  xori         s0, s10, -184
                  add          t4, a3, s5
                  fcvt.wu.s    t1, ft10, rmm
                  sra          s5, sp, tp
                  fcvt.s.w     ft3, t4, rne
                  add          a6, s6, s1
                  mulhu        s11, a0, t4
                  ori          t1, a5, 722
                  xor          t5, s5, s10
                  fmv.x.w      a1, fa4
                  and          s8, tp, s8
                  slli         s9, s1, 13
                  sub          t4, s11, a5
                  srl          a7, s10, t3
                  fmax.s       fs3, fa0, fs8
                  and          t4, s4, s11
                  mulhsu       t4, t5, a5
                  fsqrt.s      fs1, fs11
                  add          s3, a2, a3
                  flt.s        gp, ft2, ft6
                  andi         s7, s1, -1683
                  rem          t6, s10, s11
                  div          ra, s9, s7
                  or           s6, ra, s11
                  fclass.s     t1, fa5
                  div          t5, tp, a0
                  mul          s0, a3, tp
                  sltiu        gp, t2, 1871
                  divu         s9, a6, a3
                  sll          s7, s11, zero
                  ori          s7, sp, 674
                  sltu         s5, s11, sp
                  slt          s5, a6, a5
                  fsgnj.s      fs10, fs10, ft1
                  srli         s10, s3, 5
                  fdiv.s       ft9, ft4, ft0
                  sra          a4, t2, t3
                  srli         zero, s4, 8
                  mulhu        s9, a2, t2
                  remu         a0, a6, s6
                  slli         gp, a0, 5
                  fmul.s       fs11, ft11, fa3
                  fmv.x.w      zero, fs3
                  sub          a4, a3, t0
                  add          t3, s4, s2
                  fsgnjx.s     fa0, ft5, ft4
                  xor          zero, s2, sp
                  sll          ra, s8, a3
                  remu         s5, t2, a5
                  sub          t6, s10, t6
                  sub          s10, s0, a0
                  remu         t1, s3, a4
                  sll          s5, s6, sp
                  sltiu        s9, s11, -1275
                  remu         a4, s11, s10
                  fdiv.s       ft0, ft4, fs6, rup
                  slti         ra, a4, 1047
                  add          t5, t3, t4
                  fsgnj.s      ft8, fs5, ft4
                  mulh         s11, s9, a3
                  fdiv.s       fs0, ft4, fs10
                  xor          s9, s3, t6
                  fdiv.s       fa1, fs11, fs7, rup
                  fclass.s     s5, ft9
                  mulhsu       tp, t6, t3
                  sltiu        s10, zero, -1984
                  auipc        t2, 211190
                  fmv.w.x      fs7, a0
                  mulhsu       s6, s1, s6
                  fmv.w.x      fs11, s9
                  addi         a1, a0, -1901
                  srli         a1, s1, 3
                  slt          ra, tp, t4
                  nop
                  rem          a3, s7, a0
                  remu         s8, s1, s2
                  mulhu        t4, sp, t1
                  divu         a0, t3, t5
                  rem          sp, a3, s8
                  addi         sp, t3, -193
                  fsgnjx.s     ft5, fs8, fa1
                  auipc        a6, 847313
                  fcvt.w.s     a1, ft3, rne
                  remu         s6, t4, t3
                  ori          s11, s10, 1245
                  mulhu        s3, s7, s3
                  fsgnjx.s     fs5, fs1, ft6
                  fsgnjn.s     fs9, ft10, fs6
                  srai         zero, zero, 1
                  feq.s        tp, fs11, ft8
                  srli         sp, t5, 15
                  div          s11, s11, zero
                  fcvt.s.wu    ft5, a7
                  fsgnjn.s     fa4, fa2, fs0
                  divu         t1, t5, s11
                  sltiu        zero, ra, 1466
                  xori         sp, t6, -928
                  srai         t6, a7, 28
                  div          s1, ra, t1
                  divu         t3, a5, t4
                  sll          s9, s0, a3
                  mulh         t2, t6, s0
                  srai         t4, s10, 18
                  sll          tp, s5, t6
                  fmv.x.w      a1, ft5
                  auipc        a4, 101718
                  fsqrt.s      fs8, fa5
                  add          zero, s5, s0
                  xor          s1, a5, a4
                  sra          a3, a3, s4
                  slt          t3, s3, ra
                  xori         gp, a1, -66
                  or           t1, s8, tp
                  or           sp, s9, sp
                  fmax.s       fs2, ft2, fs6
                  xori         s5, t2, -967
                  fadd.s       ft9, ft9, fs5
                  auipc        s1, 823414
                  fmv.w.x      fs4, a4
                  nop
                  lui          s3, 785
                  fsub.s       fa1, fs7, ft0
                  andi         t4, tp, -1833
                  fcvt.s.w     ft5, s0, rmm
                  sll          a5, a7, a4
                  fmin.s       fa3, fs0, fs1
                  or           tp, a1, a0
                  mulhsu       t3, a6, a1
                  divu         tp, gp, a1
                  flt.s        s10, fa7, ft6
                  fcvt.wu.s    s1, fs11
                  fmul.s       ft11, ft1, ft3
                  mul          a4, a0, t2
                  fcvt.w.s     a1, fs10
                  divu         a7, s7, gp
                  andi         a5, s4, -508
                  fsgnjn.s     fa4, fs4, ft0
                  rem          s7, s2, a1
                  fmax.s       ft1, fs3, fs5
                  mulhu        s1, a4, a4
                  div          s7, sp, s0
                  fmv.x.w      t2, fs10
                  or           a4, zero, a0
                  lui          a3, 651344
                  rem          s3, t2, zero
                  remu         t1, t2, t6
                  lui          s1, 951403
                  mulhsu       t5, a3, a0
                  slti         t4, a2, -231
                  mul          sp, s0, a6
                  srl          tp, ra, s4
                  srli         t4, s6, 28
                  fdiv.s       fs11, ft8, fs6
                  fsub.s       ft3, fs1, ft10, rup
                  fmv.x.w      a3, ft0
                  feq.s        s2, ft8, ft6
                  divu         a0, t3, s1
                  xori         t5, s8, 1258
                  flt.s        s0, fs8, fs3
                  mulhu        s8, s3, tp
                  mulhsu       ra, t2, a4
                  xori         a5, zero, -1133
                  sltiu        s5, t2, 383
                  slti         tp, t1, -1591
                  add          sp, s1, s6
                  fsqrt.s      ft11, ft5, rmm
                  div          s3, gp, a5
                  fsgnjx.s     fa3, ft4, fs6
                  mulhsu       s2, s7, ra
                  sra          ra, s5, a0
                  flt.s        a7, ft4, ft7
                  mulhu        a1, a6, s7
                  lui          a5, 899018
                  rem          ra, sp, s9
                  feq.s        t2, fs10, fa5
                  lui          a3, 450389
                  fsqrt.s      fa3, fs8
                  fcvt.w.s     s5, fa5, rne
                  divu         s5, s8, a2
                  div          s6, s3, gp
                  xori         s8, t1, -952
                  fmax.s       fs9, ft9, ft2
                  fsqrt.s      fs0, fa1, rtz
                  fmin.s       ft5, fa0, fs4
                  slti         s3, gp, 699
                  feq.s        a7, fs2, ft6
                  and          gp, s10, a6
                  srai         a4, s0, 11
                  fsgnjx.s     fa5, ft10, fa5
                  fclass.s     a5, fa6
                  sltu         s8, tp, s7
                  feq.s        t4, fs7, fs10
                  lui          t2, 81873
                  sltiu        s6, a1, -1988
                  fmax.s       ft2, fs8, fs8
                  mulhsu       zero, a6, t4
                  addi         tp, s9, -1255
                  fsqrt.s      fs8, ft8, rmm
                  srli         s10, t3, 1
                  slt          s0, s2, t0
                  feq.s        t4, ft4, fs5
                  srai         zero, t3, 3
                  fclass.s     a4, ft10
                  fmv.x.w      s7, fs8
                  sltu         gp, a7, s0
                  addi         gp, a3, 616
                  fcvt.s.w     fa1, t0, rup
                  sra          a3, sp, s7
                  sra          s9, a1, a7
                  or           s9, a0, a3
                  sltiu        s3, gp, -713
                  fmax.s       fa0, ft7, fa2
                  remu         a3, s10, s5
                  fsub.s       fs10, fa0, fs0, rmm
                  fle.s        gp, fa1, fs9
                  slt          zero, s8, t5
                  mulhsu       s11, t6, a3
                  divu         a7, s11, a7
                  sra          s2, t3, t2
                  feq.s        t1, ft8, ft0
                  srai         a7, s10, 9
                  auipc        t3, 336099
                  mulhu        a0, t0, s3
                  fcvt.s.wu    fs10, s8
                  sltiu        t3, s8, 1003
                  slt          s5, sp, t5
                  fclass.s     a6, fs8
                  rem          ra, t2, a3
                  fclass.s     t1, fa1
                  fadd.s       fs0, fa5, fa6
                  rem          s9, s5, a5
                  slti         s9, t1, -557
                  fmul.s       ft8, fs11, ft1
                  add          s11, gp, s7
                  auipc        a4, 157974
                  andi         tp, a0, -1564
                  slt          s5, t0, t6
                  slti         t6, s4, 686
                  fsgnj.s      fs0, ft11, ft11
                  fdiv.s       ft7, fs3, fs0
                  divu         s2, s11, a0
                  slt          a0, a3, a4
                  or           a5, a0, t6
                  sltiu        t3, s2, -2003
                  div          s6, t5, s0
                  fdiv.s       fs6, fa0, fs10, rmm
                  fcvt.w.s     ra, fa0
                  add          s1, s6, s2
                  srli         s5, s5, 3
                  fsub.s       fs5, ft5, ft8, rne
                  sltiu        t4, s2, 1039
                  fmv.w.x      fa2, t0
                  fclass.s     s3, ft3
                  sltiu        sp, s9, 11
                  flt.s        s10, ft11, fs5
                  add          s0, s1, s4
                  feq.s        s8, fs7, ft2
                  fcvt.s.w     fa4, a7, rdn
                  fmax.s       ft3, fa4, fs7
                  fsub.s       ft11, fs6, ft11, rdn
                  fsgnjn.s     ft8, ft11, ft5
                  fle.s        s2, fs1, fs11
                  mulhu        s10, s2, s4
                  fcvt.s.wu    ft7, s3
                  and          s9, sp, s0
                  slt          s10, a1, t5
                  mulhsu       zero, a4, a3
                  lui          zero, 576146
                  remu         s10, s11, a0
                  ori          s5, s9, -164
                  fsgnjn.s     fs6, ft3, ft3
                  srl          t6, a3, zero
                  slti         s7, s2, 1019
                  ori          s8, s0, 576
                  rem          t5, a2, s5
                  fcvt.s.w     ft3, a6
                  fle.s        s3, ft9, ft6
                  nop
                  fmin.s       fs5, ft7, ft9
                  fcvt.s.wu    fs1, s2, rdn
                  add          s5, a0, a7
                  fcvt.wu.s    s6, fa2
                  div          gp, s4, t3
                  auipc        t4, 682903
                  xor          a3, s6, s4
                  slli         s5, a0, 13
                  fcvt.s.w     fa6, s5, rtz
                  ori          s9, s11, 1981
                  sll          a4, s0, gp
                  srai         s11, gp, 30
                  mulhu        s7, t4, s9
                  fsgnj.s      fs11, fa6, fa6
                  slli         a6, s4, 14
                  slt          ra, a6, zero
                  fcvt.w.s     a6, fa1, rne
                  sltu         s11, s1, s5
                  addi         s1, gp, 1803
                  lui          a1, 146012
                  or           s10, a4, a2
                  fsub.s       fs0, fa5, fs4
                  rem          s8, s8, t6
                  mulhsu       t5, s4, a2
                  sub          sp, s3, s10
                  feq.s        s0, fa2, ft1
                  sra          a5, gp, sp
                  slt          s10, t2, s2
                  flt.s        t1, fa5, ft5
                  slti         s8, s7, -565
                  fcvt.wu.s    s2, ft9, rmm
                  and          s3, zero, t3
                  fmin.s       fs0, fs1, fa5
                  srli         s0, s11, 18
                  fsub.s       fs0, fa4, fa5
                  slli         s5, t1, 10
                  mulh         s8, a2, a1
                  and          gp, s0, ra
                  fsgnjx.s     fs4, ft9, fs7
                  rem          sp, s2, s5
                  fcvt.s.w     fs10, t6, rne
                  sll          tp, a0, s4
                  fadd.s       ft2, fs7, fa3
                  mulh         s10, t6, t5
                  srai         s0, a3, 25
                  remu         gp, t5, a6
                  fsqrt.s      fs1, fs8
                  divu         a1, t3, a6
                  fsub.s       fa3, ft7, ft10, rdn
                  mulh         t3, zero, a2
                  remu         s10, a3, tp
                  addi         s3, a5, -236
                  fmv.x.w      a0, fs4
                  sltiu        a7, a1, 1609
                  div          t4, s6, s7
                  nop
                  srai         s6, a0, 7
                  flt.s        ra, fs9, fs4
                  remu         a5, s3, t2
                  slti         s5, s1, -623
                  xor          s0, s6, ra
                  or           zero, s2, a3
                  fclass.s     s10, ft1
                  fsgnjn.s     ft9, fs8, ft11
                  mulhu        a6, tp, zero
                  sltu         s6, t2, ra
                  andi         t5, t0, -1245
                  fmv.x.w      zero, ft9
                  andi         a7, s6, -1072
                  fle.s        s1, fa5, ft5
                  fdiv.s       ft9, fa2, ft5
                  mulhu        gp, a4, gp
                  fsgnjx.s     fa6, fs2, fs5
                  xor          t5, s1, t5
                  fcvt.w.s     s7, fs0
                  fcvt.wu.s    s2, ft6
                  sra          zero, a7, a6
                  fmin.s       fa2, ft4, ft6
                  add          s3, gp, sp
                  fcvt.s.w     fs6, zero, rne
                  div          s1, t6, t2
                  div          t6, sp, a7
                  fsub.s       ft7, ft9, fs5
                  sltu         a7, s8, s7
                  fmul.s       fs5, ft10, fs3, rtz
                  remu         t2, a3, s5
                  mulhu        gp, s8, s0
                  sll          ra, s10, a2
                  sra          s6, ra, t3
                  slti         a3, s8, 1021
                  add          s5, t3, gp
                  fsgnj.s      fa0, ft7, ft5
                  xor          s2, s6, t2
                  slt          s8, a1, s4
                  fmv.w.x      ft7, s2
                  slli         ra, zero, 17
                  mulhsu       a1, s2, t2
                  sll          t4, a1, ra
                  fsgnjn.s     ft2, fs4, fa7
                  flt.s        s1, fs11, ft11
                  mulhu        sp, s6, tp
                  rem          tp, tp, s3
                  auipc        s10, 69661
                  div          a7, tp, a0
                  div          a4, a6, a0
                  fsgnjx.s     fs5, ft0, ft5
                  fcvt.s.wu    fs7, s1
                  auipc        s1, 408784
                  slli         t1, a0, 21
                  rem          t1, sp, t0
                  addi         s3, s4, -160
                  fsgnj.s      ft3, fa3, ft0
                  sub          a3, t6, a2
                  divu         s5, a1, t1
                  flt.s        s5, ft10, fs9
                  slt          a6, a3, a4
                  fcvt.wu.s    a6, ft7
                  slti         t5, t3, -664
                  sra          s11, a2, s6
                  fcvt.s.w     fa0, s7, rdn
                  auipc        t1, 189579
                  add          s11, a4, s4
                  sltiu        a6, s0, -1840
                  fclass.s     t2, fa0
                  fmul.s       fs7, fa6, ft0
                  fcvt.s.wu    ft1, a7, rmm
                  fsub.s       fs7, ft0, ft0
                  fclass.s     t6, ft4
                  xor          s8, tp, s3
                  slti         sp, t1, 1124
                  xori         s5, t5, -1760
                  fmv.x.w      s6, fs7
                  fclass.s     gp, fs7
                  fle.s        s1, ft11, ft6
                  add          s9, t2, a3
                  lui          s1, 433026
                  fcvt.s.wu    fs8, t1, rdn
                  sll          s10, a1, a4
                  nop
                  fle.s        s9, fa4, fa6
                  fsqrt.s      ft1, fa0, rmm
                  sltiu        sp, s3, -1264
                  nop
                  divu         sp, a4, a4
                  fdiv.s       fs7, ft4, fa2
                  xor          a4, a6, t6
                  fsub.s       fa3, fa7, ft8, rtz
                  addi         t2, sp, -1195
                  mulh         sp, t3, a6
                  or           t1, sp, s10
                  fsgnjn.s     fa7, fa1, ft7
                  fsgnjn.s     fa0, ft6, fs7
                  fcvt.s.wu    fa0, s2
                  mulhu        zero, ra, t3
                  fle.s        s10, ft10, fs0
                  sll          a5, t6, s11
                  fsgnj.s      fs2, fa6, fs8
                  fmax.s       fa0, fs6, ft10
                  div          gp, t3, t0
                  lui          s0, 736199
                  divu         a6, s7, s3
                  sltiu        a0, t3, -1565
                  and          a4, zero, a1
                  fclass.s     t4, ft7
                  slt          s11, t3, t6
                  srli         a5, s6, 17
                  fcvt.w.s     s7, fs9
                  or           s6, t6, a2
                  or           a7, s1, a7
                  fdiv.s       fs3, ft11, ft3
                  fsgnjx.s     ft11, fa7, fs1
                  fmv.x.w      s9, fa1
                  fcvt.wu.s    gp, ft3, rdn
                  sra          a7, s4, a6
                  div          sp, a5, t6
                  feq.s        zero, fs0, fa6
                  slt          s0, a6, a2
                  remu         a5, s8, s8
                  fsgnj.s      fs1, ft8, fs8
                  sra          a7, s7, zero
                  fmv.x.w      tp, ft3
                  slt          t2, sp, a6
                  mul          a5, a2, a0
                  fmin.s       ft10, fa2, fa2
                  fdiv.s       ft5, fa4, fs2, rtz
                  lui          a7, 894926
                  auipc        tp, 494289
                  mulhu        a0, s4, t0
                  fmv.w.x      fs10, s8
                  mul          a5, s4, a3
                  fcvt.s.wu    fs9, sp
                  or           t3, s10, s5
                  div          s10, a1, a1
                  fadd.s       fs11, fs2, fa1
                  feq.s        s0, ft3, fa7
                  andi         a0, a7, -1965
                  auipc        s0, 513098
                  sltiu        s3, a6, -317
                  divu         t6, a2, s6
                  mulhu        s2, a3, s8
                  divu         s0, a6, s9
                  fle.s        s9, fs5, fs8
                  or           a6, s5, s11
                  mul          s8, t5, a5
                  divu         t5, zero, a3
                  fsub.s       fa5, fs1, fs0, rne
                  addi         a6, s1, -1340
                  remu         s6, s3, a3
                  xori         t5, s8, 848
                  divu         t1, t3, s3
                  srl          a5, s8, a7
                  fcvt.s.w     fs7, gp, rmm
                  mul          a5, s6, t0
                  xori         s11, s0, 746
                  sll          a1, s6, zero
                  addi         a6, a0, -323
                  srai         t4, s0, 3
                  fsqrt.s      fs7, fa5
                  mulhu        a7, a4, a0
                  fclass.s     s6, fs4
                  fcvt.w.s     t5, fs5, rtz
                  sub          a1, gp, s4
                  srli         gp, ra, 4
                  fsgnjx.s     fa2, fs7, ft5
                  ori          t4, zero, -569
                  or           s0, tp, a7
                  div          a0, a3, a5
                  mulh         s0, s1, s3
                  divu         s0, s4, gp
                  fmin.s       fa3, fa4, fs4
                  mulh         s3, t5, a6
                  remu         t2, s9, s8
                  fsgnjn.s     fs5, ft7, ft2
                  srai         s2, s11, 15
                  fclass.s     s9, fs7
                  fcvt.s.w     fs7, a6, rdn
                  andi         s11, s5, -996
                  mulhu        gp, a1, tp
                  xor          zero, ra, a5
                  fdiv.s       fa0, ft7, fs11, rmm
                  xori         s2, s4, 206
                  mulhsu       t6, t5, ra
                  fadd.s       ft10, fs4, fs9, rup
                  fsub.s       fa2, fa4, fa1
                  mulh         t1, s11, s8
                  slli         s11, t0, 31
                  addi         t2, s4, 532
                  mulh         s8, s9, s1
                  srli         s7, s0, 2
                  fmin.s       fa1, ft9, ft7
                  fcvt.s.wu    ft11, t3
                  mulhsu       t2, a4, s9
                  rem          s2, s0, zero
                  mul          s5, s4, s3
                  fcvt.s.w     fa1, a2, rup
                  fsgnjx.s     fs3, fs7, fs4
                  feq.s        t3, ft1, ft7
                  fmul.s       ft2, fs11, fa7, rdn
                  mul          a0, t4, a6
                  slt          zero, t3, s11
                  fclass.s     s7, fs10
                  fmul.s       fa6, fa4, ft5
                  fmin.s       fs2, fs10, fa5
                  srl          t4, s2, s5
                  fsgnj.s      fa2, ft1, ft7
                  fmin.s       ft0, ft6, fs2
                  fsgnjn.s     fs7, fs1, fs1
                  fmul.s       ft11, ft1, fs11, rup
                  fclass.s     gp, fa1
                  add          a4, s9, t3
                  srai         s0, s10, 31
                  lui          s9, 22673
                  fdiv.s       fa1, fs2, fa1, rne
                  fcvt.wu.s    a7, ft3
                  slt          t2, t0, s1
                  lui          a4, 1003387
                  fmul.s       ft10, fs0, ft9
                  fdiv.s       fs8, fs8, fs2
                  srai         s10, tp, 15
                  fsgnj.s      ft8, ft7, fa4
                  mulhsu       t5, a6, a3
                  fmax.s       fs1, fa5, fa7
                  fle.s        s10, fs10, ft2
                  fcvt.wu.s    zero, ft8, rtz
                  auipc        tp, 418533
                  or           t2, zero, ra
                  fdiv.s       ft7, fs9, fa0
                  remu         a3, t2, t1
                  xori         t5, a6, 1184
                  fdiv.s       fa0, ft11, fa3, rup
                  sltu         a4, a0, s6
                  rem          a6, s8, t1
                  fmax.s       ft11, fs0, fa2
                  mulh         s8, tp, gp
                  fcvt.wu.s    a4, ft3, rup
                  feq.s        s7, fs10, ft1
                  or           a0, a2, a7
                  slt          a1, zero, t4
                  fsgnjx.s     fs9, fs8, fs0
                  xori         a1, a0, -1978
                  fmin.s       ft5, fs11, fa4
                  mulh         s1, gp, s6
                  or           sp, a5, t3
                  fmax.s       fa1, ft5, fa0
                  fdiv.s       fa6, ft6, ft5, rup
                  slt          t5, s10, a3
                  lui          s3, 969851
                  sltu         s6, sp, s10
                  nop
                  fcvt.s.wu    fs2, s5
                  auipc        a6, 960783
                  slt          a1, t2, s11
                  auipc        a7, 457320
                  fmul.s       fs0, fs6, ft4
                  sra          tp, a6, a6
                  auipc        s10, 129909
                  mul          a3, t3, a3
                  add          t5, ra, s11
                  fadd.s       ft5, ft1, ft9
                  fcvt.wu.s    a0, ft11
                  sltu         a0, t1, zero
                  srli         a4, s1, 27
                  mulhu        s2, t6, a1
                  xor          a0, zero, t2
                  fmv.w.x      fa3, t6
                  mulh         s10, t1, t5
                  fsqrt.s      fs5, fa5
                  xori         a5, s7, -1297
                  fsgnjx.s     fs6, fa4, ft9
                  fcvt.s.wu    ft1, t2
                  ori          s7, s5, -1597
                  srl          s3, sp, s11
                  fdiv.s       ft10, fs10, fs11
                  fdiv.s       fs8, ft4, fa4
                  fsgnjx.s     fs11, ft4, fs4
                  fsgnjx.s     fs0, fs10, ft3
                  fclass.s     tp, fs4
                  srai         a7, a1, 18
                  sltiu        s8, s11, 1328
                  auipc        t2, 140919
                  fcvt.s.wu    fs11, tp, rtz
                  add          t2, a0, a2
                  fle.s        t5, fa3, ft5
                  sll          a0, a0, zero
                  srl          t2, s6, s5
                  mulh         s3, s4, s4
                  ori          zero, t5, 1252
                  fmin.s       fs9, fa7, ft3
                  div          s2, a1, tp
                  fsub.s       fa5, fs4, ft9
                  srl          sp, s6, t5
                  sltiu        t4, zero, 375
                  fmv.w.x      fs11, s8
                  srli         a0, s10, 9
                  flt.s        zero, fa5, fa4
                  divu         a0, s11, t4
                  fdiv.s       ft2, fs11, fa3
                  fsgnj.s      ft4, ft2, ft11
                  mulh         zero, tp, t3
                  mulhu        t3, a1, a5
                  sub          a0, a7, tp
                  xori         a0, gp, -1155
                  xor          s3, s6, sp
                  auipc        s9, 671537
                  fmax.s       fa7, fs1, fs0
                  flt.s        a1, fa3, ft0
                  fsgnj.s      fs11, fs11, fs8
                  fcvt.w.s     a5, fs2
                  sra          a5, s4, a6
                  slt          s5, s6, s6
                  flt.s        sp, fs0, ft4
                  fsqrt.s      ft8, ft5
                  srl          ra, a7, a7
                  fsqrt.s      ft7, fs0
                  div          s3, t3, s9
                  sltiu        s11, t5, 1253
                  slti         s11, s7, -903
                  fsgnj.s      fa5, ft0, ft0
                  fadd.s       fs9, fa2, fs7
                  slti         a1, t3, -2
                  fsqrt.s      ft1, ft10
                  slt          s10, s1, a7
                  srli         gp, ra, 23
                  slt          a0, a6, t1
                  slt          a3, zero, a0
                  fmax.s       fs6, ft0, ft2
                  fdiv.s       ft7, fs6, fa3, rup
                  fdiv.s       fs3, fa1, fs4
                  fcvt.wu.s    s0, fa3
                  or           gp, t3, ra
                  fadd.s       ft0, ft6, ft8, rne
                  andi         s7, sp, -148
                  xori         t4, s0, 1961
                  divu         ra, s7, t0
                  xor          sp, s8, a5
                  fmax.s       ft8, ft8, fs0
                  fle.s        t6, ft0, fs4
                  fmax.s       fs5, fa4, fs10
                  mulh         a1, t0, a1
                  fmul.s       fa1, ft11, fs5
                  feq.s        sp, fa3, fa3
                  slli         a3, zero, 4
                  or           a1, a7, t3
                  sra          t6, s2, a7
                  sltu         a4, tp, gp
                  nop
                  feq.s        a3, ft0, fs0
                  fcvt.w.s     a7, ft0
                  andi         gp, sp, -163
                  auipc        s0, 207159
                  add          a6, s9, s4
                  fcvt.w.s     a1, ft7
                  fcvt.w.s     s9, fa4
                  mulhu        s6, tp, zero
                  fle.s        s11, ft9, ft3
                  srli         tp, a4, 12
                  fle.s        a0, ft9, fa5
                  slli         gp, a0, 28
                  slli         s11, s5, 7
                  sltiu        a6, s0, -61
                  or           a4, a4, s6
                  fdiv.s       ft0, ft1, fs4, rtz
                  fsub.s       fa0, fs4, fa2, rup
                  fclass.s     s0, fs2
                  slli         s2, a7, 10
                  fmin.s       ft6, ft2, fs10
                  fsqrt.s      fa2, fs4, rdn
                  fsub.s       fs11, ft5, fa7, rtz
                  mul          t3, t4, sp
                  fsub.s       ft5, ft2, ft10, rdn
                  lui          s6, 850096
                  fdiv.s       ft6, fs3, fa6
                  or           t3, s2, zero
                  fcvt.w.s     a4, fs1
                  add          a3, s8, s1
                  andi         a6, a4, 1582
                  and          s1, s3, a2
                  sra          a0, s8, t4
                  rem          s10, s5, a1
                  slli         gp, zero, 19
                  slti         s11, s4, -412
                  sll          gp, t3, t4
                  fsgnj.s      ft6, ft8, fa0
                  feq.s        s2, fs9, fa4
                  fmin.s       fs9, ft9, ft8
                  addi         sp, t6, 2004
                  fcvt.wu.s    s3, fa5
                  addi         s3, tp, -2
                  fcvt.s.w     fs1, s6
                  fadd.s       fs4, ft2, ft11
                  slti         s3, s2, 1744
                  sll          t6, s6, s0
                  fcvt.s.wu    fa1, t2, rne
                  fmv.w.x      fs8, s0
                  and          s7, zero, s3
                  fcvt.w.s     s0, fs2, rtz
                  srli         s2, a3, 21
                  srl          a1, a7, a4
                  slti         t4, s9, 784
                  feq.s        s10, fs2, fs7
                  sub          a6, s2, s10
                  mulhu        a5, tp, a4
                  fadd.s       fa1, fa3, fs1, rup
                  fmv.w.x      fa4, s6
                  fsub.s       fa5, fa3, fs2
                  fcvt.s.w     fs1, t6
                  fcvt.wu.s    a4, fs11, rup
                  divu         t1, t4, a1
                  fsgnjn.s     fa6, fs11, ft7
                  fmin.s       ft7, fs1, fa0
                  or           a1, s11, s6
                  add          a1, tp, t0
                  ori          gp, s0, 337
                  ori          t2, t1, 1686
                  slti         t6, s5, 454
                  addi         t4, a7, 454
                  mulhu        t5, gp, a3
                  fdiv.s       fs3, ft11, fa2
                  mulh         t2, t4, s1
                  fdiv.s       fa5, fa2, fa2, rmm
                  flt.s        a4, fa3, fs1
                  sra          t3, ra, t0
                  lui          t5, 858524
                  fdiv.s       fs3, fa5, ft1, rdn
                  fsgnj.s      fs0, fs7, fa5
                  div          a4, s5, s9
                  fcvt.wu.s    a1, ft3
                  auipc        a7, 540092
                  xor          t5, tp, t1
                  feq.s        tp, fs11, ft11
                  flt.s        s9, ft4, fa4
                  fsgnjx.s     ft9, fa5, ft2
                  fdiv.s       fa3, fs1, fs2
                  srai         a7, s5, 22
                  mul          sp, zero, ra
                  srli         s8, a6, 25
                  fdiv.s       ft3, ft5, fs6, rdn
                  andi         s10, s1, 798
                  feq.s        s0, fs6, fa1
                  lui          s11, 516938
                  sub          s2, a1, s8
                  xori         tp, t1, 1512
                  fmv.w.x      fa3, s10
                  lui          s10, 385455
                  srai         s7, s2, 25
                  fmv.w.x      fa2, a1
                  fcvt.w.s     a7, ft2, rmm
                  sll          ra, gp, s2
                  fclass.s     s6, ft10
                  rem          a4, a1, tp
                  mul          t4, a0, s5
                  nop
                  remu         t5, s1, sp
                  auipc        a5, 975992
                  fcvt.w.s     s10, fs3
                  slli         t3, s2, 25
                  xori         zero, s10, 1030
                  slli         a1, s4, 28
                  fmin.s       fa7, ft9, fs11
                  fdiv.s       fa3, fs4, fs6
                  fsub.s       fa2, ft5, fs1
                  sra          s6, a7, s6
                  add          s2, s2, s6
                  fadd.s       fs3, ft4, fs7
                  fadd.s       ft7, ft8, ft5
                  addi         t5, s5, 885
                  fcvt.w.s     ra, fs1, rdn
                  fcvt.s.wu    ft7, a7
                  sll          t1, a4, ra
                  fcvt.wu.s    a3, fs8
                  feq.s        s10, fs4, fs11
                  slt          t2, s8, t5
                  srl          a6, s8, s0
                  fmv.x.w      t2, ft4
                  fclass.s     a0, ft10
                  fmul.s       ft5, fs3, fa7
                  sub          a3, a5, a7
                  divu         a6, a7, a0
                  srl          t6, t3, t2
                  slti         s11, s10, 1542
                  or           a7, s1, s5
                  sub          sp, tp, gp
                  slli         t2, tp, 9
                  sub          tp, a4, t2
                  and          a6, t4, s10
                  ori          a1, t4, -472
                  rem          t3, a7, s0
                  fadd.s       fs2, ft5, ft2
                  fsub.s       fa1, fa7, ft0
                  fsqrt.s      fs9, fa0, rne
                  fle.s        a4, ft4, ft7
                  fclass.s     zero, fa4
                  sra          s0, a2, zero
                  sltiu        t6, a2, -905
                  and          tp, s5, zero
                  lui          a3, 750663
                  mul          s1, a2, t0
                  fclass.s     t4, fs4
                  mulhsu       t2, s11, s5
                  addi         t3, s1, 1508
                  sltu         a0, a6, t0
                  fsub.s       fa6, fs11, fs5, rtz
                  mul          s2, a2, a4
                  auipc        t6, 655388
                  srai         sp, s4, 22
                  remu         s0, a0, s10
                  fcvt.s.wu    fa4, ra
                  fsgnj.s      fs1, fa5, fs10
                  srl          a7, a2, s2
                  srli         s8, tp, 9
                  fsub.s       fs6, fa3, fs8
                  rem          zero, t3, s0
                  slli         t4, gp, 13
                  fcvt.w.s     t5, ft4, rdn
                  fdiv.s       fs7, fs2, fa1
                  remu         t5, s4, s9
                  mulh         t1, a1, t2
                  mulhu        t1, s10, ra
                  ori          t5, t5, -953
                  fadd.s       fs1, fs6, fs9, rup
                  and          a6, a4, t3
                  srai         a4, a4, 11
                  feq.s        a0, fa3, ft4
                  flt.s        s6, ft3, ft7
                  srai         s1, gp, 11
                  fsgnjx.s     ft4, fs0, fs0
                  rem          s0, a0, a6
                  fsgnj.s      fs5, fs9, fs3
                  fclass.s     s1, fs9
                  mul          t2, sp, a4
                  divu         t4, a6, t3
                  remu         a6, sp, a6
                  fmin.s       fa6, fs9, fs3
                  fcvt.s.wu    fa5, s5
                  srai         s8, s0, 23
                  mul          a5, sp, a4
                  xori         s1, t0, -222
                  xori         t6, s1, 859
                  addi         s1, a7, 1287
                  srai         s11, s5, 27
                  fsub.s       fa5, ft1, ft11, rmm
                  feq.s        zero, ft3, ft1
                  nop
                  add          s8, s5, a7
                  flt.s        a6, fs7, ft2
                  fcvt.s.wu    fs2, s5
                  fcvt.s.wu    ft10, zero, rup
                  fsgnj.s      ft11, fs7, ft0
                  sub          sp, s4, s11
                  sub          a1, s10, s3
                  srai         a4, t1, 18
                  sub          t1, s6, s9
                  fmul.s       fa5, fs2, fs9
                  fcvt.s.w     fa7, tp
                  andi         s8, a6, -1900
                  fmin.s       ft11, ft9, fa2
                  fsgnjn.s     fs3, fa0, fa2
                  or           t4, t3, s7
                  fmv.x.w      a7, fs2
                  fsgnj.s      fa3, ft0, fs6
                  fsub.s       fs10, fa0, fs3, rne
                  fadd.s       fa5, ft7, ft6, rtz
                  or           s2, s6, s9
                  add          gp, a6, s1
                  slt          s3, sp, s7
                  sra          a4, s3, t2
                  nop
                  srli         s5, a3, 23
                  fle.s        a3, ft3, fa2
                  fmax.s       fa4, ft10, ft1
                  ori          a0, s10, -299
                  sltu         t3, gp, a0
                  sltu         sp, a0, a7
                  srai         t6, t3, 31
                  feq.s        s3, ft6, fs0
                  sra          s7, t3, t5
                  andi         a4, tp, 1385
                  fmin.s       fs9, fa1, fs3
                  fsgnjn.s     ft3, fs1, fs3
                  ori          a3, t4, -1223
                  fmin.s       ft0, fs7, fa7
                  remu         a5, tp, s5
                  fcvt.s.w     fs1, a1
                  sub          gp, s1, a6
                  fmv.x.w      zero, fa6
                  ori          s1, a0, 73
                  slli         ra, s11, 6
                  nop
                  sub          s6, t3, zero
                  sll          sp, a4, a7
                  auipc        a5, 769500
                  srli         s1, s11, 11
                  slli         t6, s0, 14
                  andi         t6, t3, -1449
                  fmv.x.w      s1, fs3
                  fcvt.s.wu    fa0, zero, rdn
                  xori         t4, a1, 499
                  sltu         a7, tp, zero
                  fcvt.wu.s    t4, fs11
                  fsgnjx.s     fs8, fs9, ft10
                  mulhu        t3, t6, t4
                  mulhu        a0, s3, s7
                  mulhsu       t1, s7, a6
                  sra          t3, a7, zero
                  and          a4, s7, t1
                  fcvt.s.wu    fa6, s0, rne
                  ori          s5, t0, 176
                  fadd.s       fa6, fa3, fs10, rup
                  fdiv.s       ft8, fs0, ft11, rtz
                  fmin.s       fs6, fa7, fs2
                  slli         t4, sp, 26
                  sra          s7, s2, a3
                  srl          a6, s2, s5
                  and          t3, zero, zero
                  fsqrt.s      fa6, ft7
                  xori         t2, t4, -628
                  feq.s        ra, ft4, fs9
                  mulhsu       t4, t1, t3
                  sra          s3, tp, s10
                  srai         s9, gp, 23
                  srai         sp, t0, 6
                  fsqrt.s      fa3, fs1
                  feq.s        s7, ft2, ft6
                  or           s0, t3, s3
                  feq.s        s7, fs10, fa1
                  mulh         t1, a6, s2
                  fmax.s       ft11, fa4, fa2
                  fcvt.s.w     ft7, s8
                  fclass.s     s11, ft0
                  fmin.s       fa3, ft4, ft0
                  auipc        s10, 144825
                  sll          t4, t1, s9
                  remu         a7, a3, t5
                  fcvt.s.w     fs5, gp
                  fmv.w.x      ft3, a1
                  xor          a0, t5, s3
                  or           a4, s10, s3
                  xor          sp, t4, s2
                  mulhu        s6, t6, zero
                  or           s2, t1, a2
                  feq.s        t3, fa7, fs0
                  slt          s0, s2, a1
                  srai         ra, t5, 18
                  mulhu        tp, a0, s2
                  fmin.s       fs9, fa5, ft6
                  srl          t6, zero, t3
                  auipc        s11, 168414
                  fmv.w.x      fa0, s2
                  srl          tp, a4, s9
                  nop
                  fmax.s       fa4, fa3, ft6
                  ori          t2, t6, -1951
                  addi         t1, gp, 769
                  flt.s        s9, fa1, fs7
                  fcvt.wu.s    t6, ft9, rtz
                  divu         a7, sp, s5
                  fmul.s       fs5, fa1, ft10
                  fle.s        s8, fs9, fs9
                  divu         s6, gp, s11
                  fcvt.wu.s    t4, fs10, rne
                  ori          tp, t2, -1555
                  fsgnj.s      fs1, fa3, ft7
                  xori         s8, s1, -124
                  auipc        a6, 9457
                  fsgnj.s      ft1, fa6, fa0
                  fsgnjx.s     fs8, ft2, ft6
                  xori         t1, a7, -1116
                  divu         sp, s9, a2
                  nop
                  fmax.s       fs1, fs6, fs10
                  sltiu        t1, s9, -1755
                  add          s8, a2, tp
                  feq.s        s7, fa5, fa6
                  fadd.s       fs10, fa7, fs9
                  fcvt.wu.s    t1, fa1, rdn
                  feq.s        a1, ft0, fa0
                  sltiu        t4, tp, -395
                  fcvt.w.s     s5, fs8, rdn
                  sra          s8, a6, s8
                  auipc        t1, 1013459
                  mulhsu       a7, a7, s9
                  srai         a3, t1, 19
                  rem          s5, s1, a2
                  mul          s9, t6, s1
                  andi         s2, s2, 1187
                  addi         t3, s2, -909
                  remu         s0, a3, s8
                  mulhu        a7, s2, a7
                  lui          s10, 81328
                  xori         a5, a2, 1586
                  div          a1, t4, s6
                  addi         t5, s6, -46
                  auipc        t5, 288131
                  slli         s5, s0, 15
                  slli         s7, gp, 4
                  xor          s5, s8, ra
                  slti         a3, s3, 1191
                  sub          a5, ra, t6
                  auipc        sp, 399757
                  and          a7, t6, s2
                  fmax.s       fs9, fs11, fa3
                  add          a3, s0, s7
                  fcvt.w.s     a6, fs11
                  fcvt.s.wu    ft10, t4, rne
                  srl          s2, t2, a4
                  fmv.x.w      s8, ft2
                  fcvt.s.w     fs7, a1, rup
                  xor          a7, s6, t3
                  fmin.s       ft6, fs0, fs8
                  xori         s1, a5, 1498
                  fsgnj.s      ft4, fs0, fs4
                  fcvt.w.s     s2, fs7, rne
                  add          a1, gp, s1
                  div          t2, t6, s1
                  sub          a4, gp, s5
                  mul          s3, sp, s6
                  div          a3, s8, s11
                  mulhu        s10, s5, t3
                  fmv.w.x      fs7, s9
                  add          s2, s7, t5
                  nop
                  fcvt.s.wu    ft6, a7, rne
                  slti         s5, a5, -1105
                  nop
                  fadd.s       ft3, fa6, fa4
                  div          t4, a7, s1
                  add          s1, tp, s0
                  slt          s7, t2, t6
                  remu         t6, s11, s4
                  sub          a5, t0, gp
                  auipc        sp, 265406
                  feq.s        zero, fa2, fs2
                  sra          s0, s9, t6
                  fcvt.s.w     fs6, s1, rtz
                  srai         s11, a6, 9
                  sltiu        gp, a6, -871
                  sub          a5, s10, s1
                  mulhu        s9, a7, t3
                  nop
                  andi         a4, t5, -1764
                  add          s8, tp, a7
                  andi         s0, t5, 1954
                  fmv.w.x      fa7, a3
                  addi         a5, t5, 1107
                  or           s7, gp, a6
                  fle.s        a4, ft4, ft6
                  fle.s        ra, fs0, ft1
                  slli         s2, s11, 17
                  addi         s2, s8, -787
                  sub          s5, t4, a3
                  fclass.s     sp, ft5
                  fcvt.s.wu    fs2, s7
                  fsgnjn.s     fa4, ft8, fs1
                  flt.s        s2, fs5, fs2
                  auipc        gp, 226166
                  sltiu        s0, a0, -641
                  fcvt.s.w     ft0, sp, rtz
                  fcvt.s.wu    fs9, t5
                  fsub.s       ft1, fs3, ft2
                  mulhsu       s7, a4, t3
                  slti         s9, a2, -456
                  fadd.s       fs7, fs8, ft6
                  lui          t3, 116824
                  slt          s6, t1, s8
                  srli         s5, s11, 29
                  sll          t1, gp, ra
                  fsub.s       fa6, fs4, fa0, rtz
                  sll          s1, t0, a0
                  fcvt.s.w     fs4, s1, rdn
                  flt.s        a7, ft6, fs9
                  sra          a3, s2, s5
                  slt          s3, gp, ra
                  auipc        s9, 678052
                  fsqrt.s      fa3, fa3
                  rem          zero, t2, a0
                  div          s1, s6, gp
                  mulh         s2, s3, s4
                  xori         s10, a0, -470
                  auipc        a3, 71043
                  remu         zero, a2, t5
                  divu         t4, s0, a2
                  fcvt.s.w     fs4, a1
                  sltu         s0, a5, s9
                  fmax.s       fa1, ft9, fs0
                  andi         t4, t4, -1260
                  fsqrt.s      ft7, ft10, rtz
                  ori          sp, zero, 941
                  flt.s        s3, fa6, fa4
                  auipc        s0, 653615
                  srl          zero, a7, t4
                  sra          t1, gp, t5
                  remu         zero, s8, t3
                  fmax.s       ft4, fs5, fa5
                  fdiv.s       fs6, fa7, fs0, rdn
                  fmin.s       ft8, ft6, ft10
                  sltiu        s5, s8, -97
                  fmin.s       fa2, ft3, fs3
                  fadd.s       ft10, fa7, ft11
                  divu         tp, ra, s8
                  fdiv.s       fs4, fa1, ft8
                  fclass.s     t2, ft10
                  fle.s        t4, fs5, ft7
                  addi         t5, t6, 944
                  sub          ra, s3, a4
                  addi         s9, a3, -471
                  fsqrt.s      fs10, ft1
                  add          t6, a5, sp
                  fdiv.s       ft11, ft11, fs11
                  divu         s5, zero, ra
                  xor          ra, sp, t3
                  sll          s1, a5, t6
                  lui          tp, 975105
                  sltu         a3, s3, s3
                  divu         ra, ra, s10
                  addi         s1, s7, 281
                  sub          s7, s4, a2
                  srai         a6, s5, 20
                  xori         t2, s11, 133
                  fcvt.wu.s    a1, fa3
                  fmin.s       fs8, ft10, ft1
                  mulhsu       s11, t1, t0
                  flt.s        s0, ft8, ft9
                  srai         ra, s2, 9
                  sltu         t1, s3, s9
                  mulhu        t4, a7, tp
                  fdiv.s       ft2, ft7, fs11
                  fsgnjx.s     ft11, ft7, fs3
                  mulh         t5, s1, s9
                  add          s5, s0, tp
                  fdiv.s       fs5, fs11, fs1, rdn
                  sra          t2, s0, a1
                  or           s7, a6, a2
                  fsgnjn.s     ft9, ft1, fa6
                  fsgnjn.s     ft2, fa3, ft4
                  fcvt.s.w     fs5, s11
                  sub          t2, s9, a6
                  mulhsu       s3, a5, a2
                  sra          s8, s4, s0
                  feq.s        ra, fs8, fs2
                  fsub.s       fs2, ft10, ft4, rmm
                  xori         s11, s6, 255
                  fclass.s     s6, fs0
                  remu         s10, s11, ra
                  fsgnj.s      fs9, fa1, fa1
                  slli         ra, a7, 4
                  fsqrt.s      fs4, fs4
                  fle.s        s5, ft4, ft6
                  fcvt.s.wu    fa1, t5, rne
                  fadd.s       fs3, fs1, fs11
                  sltiu        a1, s3, 979
                  fsub.s       ft5, ft3, ft4
                  fdiv.s       fs11, fs2, ft9, rdn
                  fsgnjn.s     ft0, fs8, ft4
                  auipc        a0, 375024
                  mulh         s6, sp, t2
                  xor          s0, a2, gp
                  fcvt.s.w     fs8, a0
                  xor          s10, a7, t2
                  and          s3, t3, s11
                  sra          a5, sp, s0
                  fsgnjx.s     fs6, ft4, ft1
                  fcvt.s.w     ft9, s6, rmm
                  sltu         s8, a6, a4
                  sub          s3, a3, t1
                  fsgnjn.s     fs7, fa6, ft10
                  srai         a4, t5, 0
                  add          gp, s11, s5
                  fle.s        s10, ft5, fa7
                  mulhsu       s7, s9, tp
                  divu         s11, a5, a4
                  sltiu        t3, t3, 256
                  fle.s        ra, ft11, fs8
                  fmul.s       fs1, fa1, fs6, rne
                  sltiu        s9, a6, -1525
                  fsgnj.s      ft9, fa5, ft8
                  fcvt.w.s     s0, ft1
                  fmin.s       fs9, fs1, ft4
                  slt          s2, a6, a0
                  andi         s3, a4, -1773
                  fcvt.s.w     fs6, a4
                  feq.s        s5, fs6, ft0
                  mulh         ra, s7, a4
                  srli         s11, t2, 9
                  sltu         s10, a6, s11
                  andi         a4, a2, 1800
                  fmin.s       fs8, fs4, fs3
                  fmax.s       fs9, fa2, fa5
                  fclass.s     s0, ft1
                  xor          sp, s10, t4
                  fclass.s     a7, fs10
                  fadd.s       fs10, fs5, ft8
                  nop
                  srai         s0, t3, 9
                  divu         s11, s3, t6
                  sltiu        a1, a1, 1083
                  fsgnj.s      ft3, ft0, ft1
                  xor          gp, t3, s9
                  xor          s11, s2, s0
                  srli         t4, a5, 20
                  xor          a4, s0, a2
                  fsgnjn.s     ft11, ft4, fa5
                  auipc        s10, 943932
                  sltu         ra, gp, s6
                  fmv.x.w      a1, fa6
                  and          a3, t5, t4
                  or           gp, s2, a7
                  fsub.s       ft2, fs1, fs11
                  sltiu        zero, a6, -1878
                  fsgnjx.s     fa2, fa4, fa3
                  xor          t4, sp, s0
                  xori         a4, t2, -1753
                  fdiv.s       fa3, ft9, fs5, rmm
                  mulhsu       zero, gp, a3
                  fle.s        sp, fs4, fs9
                  fdiv.s       fs10, fs7, fs6, rmm
                  sub          a0, s10, a6
                  remu         s7, s3, s10
                  fle.s        s2, ft10, fa7
                  slli         s11, t6, 25
                  fmin.s       ft1, fs7, ft6
                  feq.s        zero, ft3, ft8
                  fsgnj.s      fs5, fs2, ft10
                  slt          a1, a2, s3
                  fdiv.s       fa3, fa4, fs6, rtz
                  mulh         t4, s8, s4
                  addi         s9, sp, -1825
                  xor          t5, s10, s7
                  mulhsu       a1, gp, a0
                  andi         t1, tp, 373
                  remu         s7, s11, a6
                  sltu         s6, s5, a3
                  fsgnj.s      fs1, fs4, fs3
                  div          a1, zero, a1
                  mulh         t1, s7, zero
                  slli         a1, t6, 14
                  fadd.s       fa7, ft6, fs5, rne
                  feq.s        s0, fs7, fs10
                  sltu         s11, sp, a3
                  fmin.s       fs5, fs8, fs1
                  xor          s5, a6, t0
                  slti         t5, gp, -278
                  lui          t2, 751513
                  slt          s10, t3, a3
                  fmax.s       fs0, fa5, fs1
                  fcvt.s.w     ft4, a7, rmm
                  fcvt.w.s     t2, fa3, rne
                  rem          s0, s1, s1
                  fmul.s       ft6, fs4, fa5, rmm
                  fsgnjx.s     fs5, ft6, ft9
                  sll          a4, s3, a6
                  rem          t5, s7, gp
                  fsgnj.s      fa7, fs11, fa3
                  slti         t2, a2, -631
                  flt.s        s9, fs7, fs2
                  fcvt.s.wu    fa5, s6, rdn
                  fcvt.s.w     fa4, a0
                  srl          a0, s10, s5
                  remu         a4, t0, s7
                  ori          a3, sp, -1575
                  fdiv.s       ft9, fs2, fs2, rtz
                  srli         s0, t4, 26
                  fcvt.wu.s    s5, ft5
                  slli         a0, s7, 29
                  nop
                  add          s3, t1, s1
                  add          a4, t4, a3
                  srai         tp, gp, 18
                  xor          a7, a4, a0
                  div          s6, s4, a7
                  flt.s        t1, fa5, fs7
                  srai         gp, a0, 26
                  srli         t3, s6, 4
                  fcvt.s.w     ft9, s10
                  fsgnjx.s     ft7, ft5, fs9
                  fdiv.s       fs2, fs8, fs6, rne
                  fclass.s     a3, fa3
                  fmv.x.w      s0, fs0
                  mulhu        tp, s11, t6
                  and          t2, t0, a7
                  and          t4, a0, a4
                  fsgnj.s      fs0, ft3, fs6
                  fsgnjx.s     fs1, fs10, fa0
                  fadd.s       fa3, fs5, fa4
                  flt.s        a5, ft11, fs6
                  rem          a4, s2, s1
                  fmin.s       fs11, fs3, fs4
                  div          s11, t5, s2
                  fcvt.s.wu    fs2, t3, rmm
                  fmul.s       fs6, fs10, ft6, rmm
                  div          gp, t6, s8
                  rem          s5, s10, s9
                  add          t1, a1, s6
                  mul          t3, zero, s7
                  fmv.w.x      fs8, t2
                  and          t4, s9, ra
                  fmv.w.x      ft5, s11
                  fle.s        a3, fa6, fa6
                  fsgnjn.s     ft10, ft8, fs7
                  fmv.x.w      s8, fa0
                  feq.s        a0, fa3, ft11
                  flt.s        sp, ft2, fa3
                  divu         tp, a5, s11
                  sub          s6, s1, s3
                  flt.s        tp, fa0, fa5
                  mul          s10, s2, s7
                  feq.s        tp, ft1, fa0
                  divu         s0, s6, s0
                  flt.s        zero, fa2, fs6
                  fsqrt.s      fa5, fa4
                  fclass.s     s1, fs0
                  sra          s2, a4, sp
                  ori          t3, s0, 799
                  fcvt.w.s     s9, fa5, rdn
                  fsgnjn.s     fa3, fs1, fa6
                  sra          gp, ra, tp
                  fadd.s       ft7, ft1, ft0
                  fcvt.wu.s    sp, fa2
                  slli         s7, s2, 21
                  mul          s6, t1, t1
                  mul          s2, t0, s1
                  fmax.s       fs2, ft0, ft5
                  ori          a0, a7, 456
                  fdiv.s       fs2, fs10, fs10, rtz
                  fadd.s       ft5, fs6, fa6, rne
                  rem          s1, a6, s0
                  feq.s        s6, ft6, fs10
                  fsgnjx.s     fs1, ft3, ft7
                  fsgnjx.s     ft3, fa4, ft3
                  xor          s10, s6, s5
                  slti         ra, s9, -816
                  or           t4, t4, t1
                  remu         a5, t3, a7
                  fmin.s       fs1, fs3, fs4
                  divu         s7, a5, a3
                  srli         s10, t0, 29
                  fcvt.s.w     fa3, s10
                  rem          a7, zero, t4
                  sll          t1, s4, a5
                  ori          s11, a3, 144
                  xori         ra, t1, 1907
                  fsgnjn.s     fs7, fs11, fa2
                  fle.s        a1, fs5, fs7
                  sltiu        s8, a2, 1510
                  mulhsu       a3, s7, a6
                  fadd.s       ft11, fs8, fs3, rdn
                  divu         t4, t3, tp
                  srl          s9, s3, a0
                  fle.s        gp, ft0, fs1
                  fsgnjx.s     fs11, fs1, fs6
                  remu         a4, a7, t6
                  fsub.s       fs7, ft0, ft1, rne
                  mulh         a4, a3, t1
                  srl          s6, a1, t6
                  fmin.s       fs11, ft4, fs3
                  fmax.s       fs6, fa2, fs1
                  div          t3, s7, s11
                  fclass.s     t1, fs8
                  nop
                  mul          t2, t3, s8
                  remu         a0, s0, s4
                  fmul.s       ft1, ft10, ft1, rdn
                  xori         s10, a1, 573
                  slti         s10, gp, 1122
                  fle.s        s3, fs8, fs10
                  sltu         t3, a4, t4
                  srai         t6, a6, 26
                  sra          t4, t5, a2
                  srai         ra, a0, 31
                  mulhu        s10, a6, a1
                  fle.s        a0, fs10, fa1
                  fsub.s       fa5, fs6, fs0, rne
                  nop
                  fcvt.w.s     s8, ft3, rdn
                  and          t5, t5, s9
                  nop
                  ori          a4, zero, -1455
                  fdiv.s       ft10, ft10, fs6
                  fclass.s     s7, fs10
                  mulhu        s8, s11, a6
                  fmin.s       fs9, ft2, fs5
                  remu         a1, s11, ra
                  xor          s2, a1, a6
                  srli         a7, t0, 16
                  fcvt.s.w     ft10, gp
                  xori         t3, s11, 414
                  fmax.s       fs2, fs5, fa6
                  mulhsu       s8, a5, t6
                  sra          a0, ra, s4
                  fclass.s     s9, fs11
                  sra          s7, s6, t3
                  mulhsu       t2, s2, a7
                  sub          t4, s4, s10
                  fle.s        sp, fs0, fs6
                  fle.s        s10, ft7, fs4
                  sltu         s0, gp, s7
                  mulhsu       s7, a1, s1
                  divu         t2, s4, t1
                  srai         s5, a7, 6
                  mulhsu       sp, ra, t4
                  slli         a7, a6, 15
                  feq.s        a1, fs11, fs4
                  fcvt.wu.s    t2, fs1
                  srl          t3, s9, a0
                  fcvt.wu.s    sp, fs3, rne
                  or           t1, s0, s2
                  sll          s0, t3, s6
                  fcvt.s.w     ft3, t2
                  xor          s10, a5, s3
                  xor          a6, s6, s3
                  andi         a6, a1, -1307
                  srli         sp, t3, 10
                  nop
                  slt          s8, s6, tp
                  sltiu        a5, t4, 4
                  add          s11, s0, s6
                  ori          a6, gp, -2025
                  fmax.s       fs6, fa5, ft3
                  fle.s        s3, ft11, ft8
                  sltu         s7, tp, s4
                  fmin.s       fs8, fa4, fa0
                  sra          a6, zero, s3
                  sub          s8, tp, s4
                  nop
                  fcvt.s.wu    ft2, s8
                  auipc        t1, 976325
                  fmul.s       ft1, fs9, ft11, rdn
                  sra          gp, s0, t3
                  sra          sp, a7, s9
                  fmv.w.x      fa1, s2
                  fclass.s     s10, ft1
                  auipc        a3, 13144
                  fcvt.wu.s    s6, ft1
                  srai         a3, s7, 1
                  fmv.w.x      fs3, s10
                  mulh         tp, tp, s9
                  srl          a0, a6, a2
                  fsgnjx.s     ft9, fa7, fa1
                  fmax.s       ft8, ft10, fs3
                  sll          t3, t0, a4
                  fcvt.s.w     fs11, t0
                  sltu         s9, sp, s2
                  flt.s        t1, fa2, fa7
                  lui          a3, 991211
                  flt.s        a5, ft1, fs7
                  fclass.s     t1, ft7
                  fcvt.w.s     zero, ft5, rup
                  fsqrt.s      fa0, fa5, rmm
                  divu         ra, a0, s7
                  lui          a3, 91464
                  add          s9, a7, zero
                  sra          t1, a4, s8
                  fmax.s       fs6, fs0, fs4
                  sra          a6, s9, a4
                  fsub.s       fs10, ft10, fa5, rup
                  lui          a0, 128372
                  nop
                  and          s6, gp, s6
                  fmin.s       fa2, fa4, ft5
                  sub          s11, s6, t0
                  fle.s        s6, ft3, fs7
                  lui          s1, 823561
                  slti         t2, a7, 352
                  fsqrt.s      fs7, fa4, rup
                  fsqrt.s      ft2, fs1, rdn
                  lui          t2, 768227
                  remu         t2, a7, s11
                  ori          t3, s8, -128
                  fmin.s       fa6, fs8, fa0
                  fsgnjx.s     ft10, fa0, fa2
                  fsqrt.s      fs8, fa2
                  fcvt.w.s     s5, fs0
                  fcvt.wu.s    s6, fs2, rmm
                  divu         ra, s3, zero
                  sra          s8, s5, t0
                  or           t6, a1, t3
                  fsub.s       fs6, fs7, fs8
                  fmv.w.x      ft4, sp
                  mul          s5, t6, a7
                  addi         t5, s0, -634
                  fsgnjx.s     ft7, ft4, fs3
                  flt.s        t1, fs0, fs3
                  fcvt.w.s     sp, ft9, rup
                  fcvt.s.wu    ft1, gp
                  fmv.x.w      s7, fs1
                  fclass.s     t1, fa7
                  nop
                  flt.s        s10, ft2, ft3
                  fclass.s     tp, fs7
                  srai         sp, s2, 18
                  fsub.s       fs1, fs10, fa7, rtz
                  or           a5, a1, a5
                  fle.s        a3, fa7, fa5
                  fmv.x.w      a7, fs6
                  nop
                  fsub.s       fs4, ft2, fs8
                  addi         t3, t4, 1033
                  fclass.s     t5, ft1
                  fcvt.w.s     s9, ft9
                  fdiv.s       fa0, fa3, fs9, rup
                  sltu         zero, tp, ra
                  xori         t2, s0, 665
                  mul          gp, tp, s2
                  div          a6, t3, t3
                  sra          s6, s5, tp
                  or           a4, t0, t2
                  ori          t3, s8, -1802
                  sltiu        s9, s11, 1717
                  or           s10, tp, ra
                  fmax.s       ft7, fs2, ft5
                  rem          s2, s9, gp
                  fmv.x.w      tp, fa7
                  fadd.s       fs11, fs2, ft1, rne
                  sll          a6, a0, s4
                  and          a7, s8, t0
                  srai         s0, s5, 8
                  mulhu        tp, s10, s3
                  fsqrt.s      fs0, fs4, rup
                  andi         a3, s7, -1396
                  slt          t6, s7, t3
                  fmv.x.w      s0, ft5
                  lui          s9, 416373
                  fsgnj.s      ft8, fa7, fs11
                  srli         t2, a4, 12
                  lui          a1, 500503
                  sltiu        tp, t2, -741
                  mulhu        s7, s1, t0
                  or           t3, a4, t6
                  fmax.s       fa3, ft9, fs6
                  fcvt.wu.s    t6, ft11
                  fmv.x.w      a4, ft8
                  mulh         t2, gp, t1
                  addi         a4, gp, -985
                  andi         s9, sp, 356
                  fsub.s       ft10, fs3, ft8, rup
                  fle.s        s5, fs3, fs0
                  fmv.x.w      s7, fs3
                  fmul.s       fs8, fa6, fa3
                  fmin.s       fs11, fs9, fs8
                  fcvt.s.w     fs3, a5
                  fcvt.s.wu    ft8, s9
                  ori          s10, s6, -352
                  lui          s3, 920947
                  fmin.s       fa0, ft4, ft2
                  flt.s        tp, ft2, fa4
                  flt.s        s0, ft0, fs2
                  andi         tp, sp, 1730
                  fmv.x.w      s1, fs5
                  srl          a6, gp, gp
                  fmin.s       fa4, fs4, fs8
                  feq.s        t4, ft6, ft11
                  srai         sp, a6, 23
                  fcvt.wu.s    ra, fa1, rup
                  nop
                  slt          s11, t0, s5
                  mul          s0, a7, t3
                  mul          gp, zero, s5
                  or           a4, a0, t1
                  remu         a5, t2, t5
                  feq.s        s1, fa5, fa2
                  nop
                  remu         zero, a5, s8
                  srai         s3, s3, 30
                  nop
                  srli         ra, t3, 1
                  fcvt.s.w     ft8, s3, rne
                  nop
                  feq.s        a4, ft6, fs9
                  slti         tp, t1, 934
                  mulhsu       t3, a4, a4
                  fsub.s       ft4, fa0, ft4, rne
                  addi         s10, s4, 1640
                  sll          t2, s0, s5
                  fcvt.s.wu    fs0, a4, rne
                  fmv.w.x      ft6, s6
                  ori          t4, a6, -1719
                  addi         s6, s2, 1475
                  fsgnjx.s     ft5, fs6, fs3
                  srl          t1, t1, s0
                  srli         a3, s4, 2
                  fclass.s     t5, ft11
                  fsgnj.s      fa7, ft6, ft9
                  xori         a4, tp, 685
                  rem          s10, a2, t5
                  rem          sp, s10, s8
                  ori          tp, tp, 1495
                  feq.s        t3, fs7, ft8
                  fcvt.w.s     s8, fa5
                  slt          s2, tp, t0
                  fsgnjn.s     ft0, ft0, fs11
                  or           tp, t3, s8
                  fle.s        a0, fa2, fa6
                  fsqrt.s      ft11, ft11, rne
                  div          s3, gp, a6
                  mulhu        a5, s10, s1
                  fcvt.s.w     fs0, a4
                  srai         t4, t2, 18
                  sll          a3, s5, a2
                  fmul.s       fs2, fs0, fs2
                  fcvt.s.w     fs4, s6, rne
                  slt          a3, a1, t1
                  fmv.w.x      ft3, s5
                  lui          s2, 872691
                  lui          a4, 69819
                  flt.s        a0, fa3, fa0
                  fcvt.s.wu    ft10, ra
                  slli         s0, s6, 12
                  feq.s        t4, ft7, fs8
                  flt.s        a3, ft0, ft1
                  srli         a4, s7, 21
                  remu         ra, s8, t1
                  sltiu        s3, s9, 1233
                  fcvt.s.wu    fs10, s7
                  fsub.s       fa1, fs5, ft4
                  fclass.s     a4, fa1
                  xor          tp, s6, sp
                  fsqrt.s      fs2, fs3
                  remu         a0, a6, s1
                  fsgnjn.s     fs4, ft11, fs8
                  mulh         a7, s8, s2
                  fcvt.s.wu    ft11, a6
                  feq.s        a5, fs5, fa2
                  add          s7, s8, t4
                  sll          ra, a6, t2
                  fmul.s       fa7, fa4, ft10
                  fsgnj.s      fs0, fs9, fa3
                  xor          t1, ra, s3
                  fmin.s       fs3, fs3, ft7
                  divu         s0, s7, s3
                  div          ra, s1, s2
                  srl          s8, t5, a1
                  fle.s        t1, fa2, fa0
                  fmin.s       ft0, ft2, fa1
                  or           ra, tp, s1
                  slli         zero, a4, 26
                  fmv.x.w      s0, ft4
                  xori         s2, a0, 1724
                  fmin.s       fs0, ft0, fa7
                  mulh         s11, s4, a3
                  sra          a7, s11, a7
                  add          a0, s7, a3
                  auipc        s3, 158299
                  mul          s2, a0, gp
                  rem          s9, ra, t0
                  fdiv.s       ft6, fa0, ft5, rup
                  sub          s0, s7, t6
                  auipc        s3, 568763
                  mulh         s10, a6, tp
                  fcvt.w.s     a3, ft10, rmm
                  slti         t4, s7, 899
                  ori          s7, a0, -1023
                  add          a5, tp, t5
                  sltiu        a3, s9, 1090
                  fsgnj.s      ft6, fs9, fa6
                  sub          t4, s5, t3
                  fcvt.s.w     fa3, s8, rdn
                  lui          a6, 514797
                  remu         t6, a1, s6
                  fclass.s     s0, ft5
                  sra          gp, t3, sp
                  slt          s8, t5, t0
                  srai         t3, s2, 16
                  flt.s        ra, fa1, fa1
                  fmax.s       fa5, ft10, fa5
                  fsgnj.s      fa2, fs0, fa6
                  fsgnj.s      ft9, ft5, ft6
                  add          sp, s0, s10
                  fsub.s       fa6, ft8, fs5
                  mulhsu       t2, s3, t3
                  fclass.s     s5, fa1
                  sltu         ra, tp, a1
                  xori         s10, tp, 14
                  sll          a0, a2, t4
                  fmv.x.w      s8, ft5
                  sub          s0, t6, s1
                  remu         gp, tp, s11
                  feq.s        a4, fs6, fa5
                  andi         gp, a5, 661
                  fclass.s     t4, ft4
                  fsgnjx.s     fs10, fa0, fs11
                  fle.s        a7, fs3, fs0
                  auipc        t5, 639780
                  fcvt.wu.s    s3, fs8, rtz
                  fmax.s       fs4, ft5, fs8
                  fsgnj.s      fs10, fa6, ft0
                  fsgnjx.s     fs7, fa4, fa1
                  addi         t6, a2, -1056
                  sltiu        s1, a3, 2039
                  sra          s0, s5, a1
                  add          sp, a6, sp
                  add          a4, zero, tp
                  mul          s7, a6, s1
                  xori         gp, s4, 431
                  div          s1, s2, t6
                  mulh         s0, t1, s1
                  feq.s        s10, ft11, fa5
                  add          a7, a0, s3
                  fsgnj.s      ft4, fa3, fs4
                  ori          s8, ra, 1897
                  srai         t4, a3, 16
                  fcvt.s.wu    fa2, sp
                  flt.s        s6, fs1, fs1
                  sub          zero, t1, s3
                  srli         a0, sp, 20
                  mulhu        s11, t6, s10
                  fsgnjn.s     ft4, ft11, fs3
                  fmul.s       ft5, fa0, fs5, rup
                  auipc        a1, 809296
                  fsgnj.s      ft8, fs3, fs3
                  andi         s9, s8, 1753
                  srli         a0, a1, 0
                  fdiv.s       fs0, ft3, fs4, rtz
                  ori          a0, sp, 643
                  div          s9, a3, a6
                  div          s3, t3, t2
                  fdiv.s       fs1, ft3, ft6, rup
                  addi         t3, a7, -1297
                  flt.s        s3, fs7, fs6
                  fsgnjn.s     ft10, ft7, ft1
                  fdiv.s       fs7, fs5, fs6
                  fsqrt.s      fa0, fa0
                  sltu         a4, t0, a4
                  fmv.w.x      fs10, s8
                  fle.s        s10, fa2, ft4
                  sltu         s5, a1, t5
                  slti         a6, t0, 926
                  slti         a6, sp, 637
                  fcvt.wu.s    sp, ft9
                  or           s5, a5, s9
                  fadd.s       fa7, ft4, fs10
                  fsgnjn.s     fs4, fa5, fs10
                  fsgnjx.s     fa5, fs7, ft3
                  fsqrt.s      fs11, ft11
                  fle.s        s7, fs10, fs6
                  fcvt.w.s     s11, fs4
                  sltiu        t4, a3, 1423
                  mul          s0, s7, t0
                  srai         a7, s0, 4
                  fadd.s       ft7, fs5, ft1, rtz
                  fmv.x.w      t1, ft10
                  fsgnjx.s     fs11, ft1, ft6
                  fcvt.w.s     a6, ft2, rmm
                  fsgnjx.s     fs7, fa0, fs1
                  sltiu        s11, gp, 934
                  add          t3, s2, t2
                  fsgnjx.s     fs3, ft9, fs2
                  flt.s        t6, ft8, fs3
                  div          a5, s9, s0
                  fsub.s       fs11, ft1, fs9, rne
                  mulhsu       ra, zero, a6
                  fcvt.s.w     ft3, s10
                  mulhu        t5, t3, sp
                  fcvt.w.s     t6, fs10, rtz
                  flt.s        t1, ft10, fa3
                  fsgnj.s      fs3, fa3, ft3
                  fsgnj.s      fs4, ft11, ft10
                  fmin.s       fa1, fa1, ft2
                  fsgnjn.s     ft7, ft2, ft10
                  sltiu        s9, a2, 275
                  slt          s6, s10, s1
                  slli         a1, tp, 11
                  sra          a5, a4, tp
                  fsgnjx.s     fs7, fs11, fa5
                  auipc        a0, 868548
                  mulhsu       a7, a5, sp
                  srli         a0, t4, 21
                  fsub.s       fs5, fa1, ft11
                  fclass.s     s10, ft7
                  lui          s0, 173325
                  divu         a1, t1, s0
                  sltiu        gp, a5, -1586
                  add          s10, ra, s3
                  slti         s5, sp, 1738
                  fsgnjn.s     fs3, fs3, fs7
                  slt          a1, t1, a6
                  nop
                  srl          a3, a7, a3
                  fadd.s       fa0, fs2, ft11
                  fadd.s       fs8, ft5, fa4
                  fcvt.s.w     fa3, t6
                  lui          a4, 435515
                  rem          zero, s11, s6
                  slt          s10, sp, tp
                  mulh         a4, gp, t4
                  div          s11, t3, a2
                  xori         s5, t4, -937
                  nop
                  lui          s5, 60311
                  andi         a5, t4, -325
                  nop
                  fcvt.s.w     fs9, s6, rmm
                  srl          t1, s4, s0
                  feq.s        s7, fa6, fs3
                  fmax.s       ft7, fs8, fs8
                  or           tp, s7, s0
                  divu         a7, s1, t5
                  fle.s        s1, ft5, ft4
                  addi         a0, t0, -1208
                  srli         s11, a3, 22
                  addi         a3, t6, -752
                  div          a6, s6, t0
                  sra          s3, zero, a1
                  fcvt.w.s     sp, fa7
                  or           a6, s5, gp
                  mulhsu       t1, s5, ra
                  fle.s        t2, fs6, ft10
                  slti         t1, t1, -1773
                  fmul.s       ft10, fs4, fa0
                  andi         s0, s7, 1051
                  feq.s        ra, fs6, fa5
                  fsub.s       fa5, ft6, fs10, rne
                  add          t3, s1, t0
                  sub          s5, t0, t6
                  mul          t6, t3, a6
                  sra          t3, a7, s2
                  ori          gp, tp, -1028
                  or           tp, s1, sp
                  fcvt.wu.s    s1, fs9
                  remu         s1, t6, t4
                  mulhsu       t4, zero, s4
                  mulh         a6, s6, t1
                  srli         s6, sp, 14
                  fmax.s       fa7, fs4, ft10
                  fcvt.s.w     fs11, sp, rdn
                  fle.s        s2, ft11, ft10
                  sra          s5, s5, a4
                  slli         t6, s1, 7
                  sltu         sp, s7, s2
                  fmv.x.w      a7, ft11
                  sll          a0, zero, t4
                  flt.s        gp, fs8, ft9
                  divu         a0, s3, s4
                  andi         t2, s11, -1785
                  fcvt.s.wu    fa5, t1, rdn
                  fsgnj.s      fa4, fs3, fa4
                  fdiv.s       fs0, ft8, ft2
                  mul          t4, t6, s8
                  xor          s0, s7, t4
                  div          a5, a7, a3
                  andi         t1, a0, 139
                  and          ra, ra, t0
                  fmv.w.x      fs4, s6
                  fsgnjn.s     ft3, fa6, fs2
                  mulh         s6, tp, ra
                  fdiv.s       fs0, fa1, fa4
                  ori          s0, tp, -1631
                  andi         a6, t4, 820
                  sltu         t4, t0, t6
                  mulhu        gp, t4, a5
                  rem          a5, s9, ra
                  sra          a3, t3, t1
                  fdiv.s       fs8, fs1, fa2, rup
                  flt.s        s3, fs3, fs7
                  fsgnj.s      ft4, fa7, fs0
                  srai         s0, gp, 3
                  or           t1, s8, s10
                  mul          ra, a0, t5
                  slt          a1, a6, sp
                  slli         t1, s9, 12
                  fdiv.s       fa6, fa7, fs7, rtz
                  xori         s2, a0, 1431
                  fmin.s       ft4, fa4, fa7
                  mulhu        s9, a6, s5
                  auipc        t4, 715123
                  srli         s11, s8, 21
                  remu         ra, a5, gp
                  fclass.s     a6, fa4
                  mulhu        s6, a0, s1
                  sltiu        ra, s11, -1138
                  rem          a4, a0, s7
                  fmul.s       fs9, fs10, ft6, rup
                  fdiv.s       fa5, fa6, fs4, rmm
                  mulhsu       a7, t0, a3
                  feq.s        s6, fs6, fa6
                  fadd.s       fa3, fs6, fa2
                  ori          a0, s4, -1113
                  fdiv.s       fs0, ft7, ft11
                  and          ra, a4, s4
                  rem          t3, zero, a2
                  xori         s6, t6, -1982
                  fmv.x.w      s3, fs9
                  andi         zero, s10, 698
                  fsgnjn.s     fa3, ft0, fs2
                  mulhsu       a1, s6, s10
                  slti         s9, a3, -281
                  xor          sp, a2, a5
                  remu         s3, zero, t1
                  mulhsu       s3, zero, t4
                  srl          t5, a3, s8
                  fsgnjn.s     ft8, ft4, ft5
                  srl          sp, s11, a4
                  fcvt.w.s     a6, fa0
                  fsgnjx.s     fa5, fs10, fs0
                  mulh         t3, t0, a0
                  ori          a7, sp, -815
                  fcvt.s.wu    ft5, t1, rdn
                  sll          t6, a6, a4
                  mulhu        a7, t1, a6
                  mulh         a6, a1, sp
                  fcvt.s.w     fs11, t6
                  sra          s2, s5, sp
                  divu         t3, s0, a0
                  nop
                  and          a4, t6, t2
                  slli         s10, gp, 8
                  srli         s7, t3, 2
                  feq.s        t5, fs2, ft11
                  fcvt.s.w     fa3, a1
                  fsgnjn.s     ft8, fs7, fa1
                  add          gp, s8, t5
                  fcvt.s.w     fs9, t1
                  auipc        s3, 670866
                  sltiu        a0, t4, 489
                  sltiu        s3, sp, -1480
                  and          s1, gp, s9
                  fsgnjn.s     fs3, fa0, ft9
                  fle.s        tp, fa3, fa3
                  sra          sp, sp, tp
                  addi         a6, a0, 116
                  andi         ra, s8, 2045
                  or           s9, t5, t5
                  divu         s3, a3, a1
                  flt.s        s6, fs1, fs1
                  divu         zero, a5, s5
                  fsgnjx.s     fs0, fs0, ft4
                  mulhsu       s3, a0, s3
                  fmul.s       fs1, ft4, ft11
                  srai         gp, s4, 24
                  fsgnjn.s     ft9, fs4, ft6
                  fcvt.s.w     ft0, a4, rtz
                  la x12, test_done
                  jalr x0, x12, 0
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
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 0x1f
                  beqz x17, 1f
                  j mmode_intr_handler
                  1: la x12, test_done
                  jalr x0, x12, 0

mmode_intr_vector_2:
                  addi x5, x5, -4
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 0x1f
                  beqz x17, 1f
                  j mmode_intr_handler
                  1: la x12, test_done
                  jalr x0, x12, 0

mmode_intr_vector_3:
                  addi x5, x5, -4
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 0x1f
                  beqz x17, 1f
                  j mmode_intr_handler
                  1: la x12, test_done
                  jalr x0, x12, 0

mmode_intr_vector_4:
                  addi x5, x5, -4
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 0x1f
                  beqz x17, 1f
                  j mmode_intr_handler
                  1: la x12, test_done
                  jalr x0, x12, 0

mmode_intr_vector_5:
                  addi x5, x5, -4
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 0x1f
                  beqz x17, 1f
                  j mmode_intr_handler
                  1: la x12, test_done
                  jalr x0, x12, 0

mmode_intr_vector_6:
                  addi x5, x5, -4
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 0x1f
                  beqz x17, 1f
                  j mmode_intr_handler
                  1: la x12, test_done
                  jalr x0, x12, 0

mmode_intr_vector_7:
                  addi x5, x5, -4
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 0x1f
                  beqz x17, 1f
                  j mmode_intr_handler
                  1: la x12, test_done
                  jalr x0, x12, 0

mmode_intr_vector_8:
                  addi x5, x5, -4
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 0x1f
                  beqz x17, 1f
                  j mmode_intr_handler
                  1: la x12, test_done
                  jalr x0, x12, 0

mmode_intr_vector_9:
                  addi x5, x5, -4
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 0x1f
                  beqz x17, 1f
                  j mmode_intr_handler
                  1: la x12, test_done
                  jalr x0, x12, 0

mmode_intr_vector_10:
                  addi x5, x5, -4
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 0x1f
                  beqz x17, 1f
                  j mmode_intr_handler
                  1: la x12, test_done
                  jalr x0, x12, 0

mmode_intr_vector_11:
                  addi x5, x5, -4
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 0x1f
                  beqz x17, 1f
                  j mmode_intr_handler
                  1: la x12, test_done
                  jalr x0, x12, 0

mmode_intr_vector_12:
                  addi x5, x5, -4
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 0x1f
                  beqz x17, 1f
                  j mmode_intr_handler
                  1: la x12, test_done
                  jalr x0, x12, 0

mmode_intr_vector_13:
                  addi x5, x5, -4
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 0x1f
                  beqz x17, 1f
                  j mmode_intr_handler
                  1: la x12, test_done
                  jalr x0, x12, 0

mmode_intr_vector_14:
                  addi x5, x5, -4
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 0x1f
                  beqz x17, 1f
                  j mmode_intr_handler
                  1: la x12, test_done
                  jalr x0, x12, 0

mmode_intr_vector_15:
                  addi x5, x5, -4
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 0x1f
                  beqz x17, 1f
                  j mmode_intr_handler
                  1: la x12, test_done
                  jalr x0, x12, 0

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
                  sw  x20, (x5)
                  add x20, x5, zero
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
                  add x5, x20, zero
                  csrr x17, 0x341 # MEPC
                  csrr x17, 0x342 # MCAUSE
                  li x4, 0x3 # BREAKPOINT
                  beq x17, x4, ebreak_handler
                  li x4, 0x8 # ECALL_UMODE
                  beq x17, x4, ecall_handler
                  li x4, 0x9 # ECALL_SMODE
                  beq x17, x4, ecall_handler
                  li x4, 0xb # ECALL_MMODE
                  beq x17, x4, ecall_handler
                  li x4, 0x1
                  beq x17, x4, instr_fault_handler
                  li x4, 0x5
                  beq x17, x4, load_fault_handler
                  li x4, 0x7
                  beq x17, x4, store_fault_handler
                  li x4, 0xc
                  beq x17, x4, pt_fault_handler
                  li x4, 0xd
                  beq x17, x4, pt_fault_handler
                  li x4, 0xf
                  beq x17, x4, pt_fault_handler
                  li x4, 0x2 # ILLEGAL_INSTRUCTION
                  beq x17, x4, illegal_instr_handler
                  csrr x4, 0x343 # MTVAL
                  1: la x12, test_done
                  jalr x1, x12, 0

ecall_handler:    
                  la x17, _start
                  sw x0, 0(x17)
                  sw x1, 4(x17)
                  sw x2, 8(x17)
                  sw x3, 12(x17)
                  sw x4, 16(x17)
                  sw x5, 20(x17)
                  sw x6, 24(x17)
                  sw x7, 28(x17)
                  sw x8, 32(x17)
                  sw x9, 36(x17)
                  sw x10, 40(x17)
                  sw x11, 44(x17)
                  sw x12, 48(x17)
                  sw x13, 52(x17)
                  sw x14, 56(x17)
                  sw x15, 60(x17)
                  sw x16, 64(x17)
                  sw x17, 68(x17)
                  sw x18, 72(x17)
                  sw x19, 76(x17)
                  sw x20, 80(x17)
                  sw x21, 84(x17)
                  sw x22, 88(x17)
                  sw x23, 92(x17)
                  sw x24, 96(x17)
                  sw x25, 100(x17)
                  sw x26, 104(x17)
                  sw x27, 108(x17)
                  sw x28, 112(x17)
                  sw x29, 116(x17)
                  sw x30, 120(x17)
                  sw x31, 124(x17)
                  la x12, write_tohost
                  jalr x0, x12, 0

instr_fault_handler:
                  add x20, x5, zero
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
                  add x5, x20, zero
                  lw  x20, (x5)
                  addi x5, x5, 4
                  mret

load_fault_handler:
                  add x20, x5, zero
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
                  add x5, x20, zero
                  lw  x20, (x5)
                  addi x5, x5, 4
                  mret

store_fault_handler:
                  add x20, x5, zero
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
                  add x5, x20, zero
                  lw  x20, (x5)
                  addi x5, x5, 4
                  mret

ebreak_handler:   
                  csrr  x17, 0x341
                  addi  x17, x17, 4
                  csrw  0x341, x17
                  add x20, x5, zero
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
                  add x5, x20, zero
                  lw  x20, (x5)
                  addi x5, x5, 4
                  mret

illegal_instr_handler:
                  csrr  x17, 0x341
                  addi  x17, x17, 4
                  csrw  0x341, x17
                  add x20, x5, zero
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
                  add x5, x20, zero
                  lw  x20, (x5)
                  addi x5, x5, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x17, 0x300 # MSTATUS;
                  csrr  x17, 0x304 # MIE;
                  csrr  x17, 0x344 # MIP;
                  csrrc x17, 0x344, x17 # MIP;
                  add x20, x5, zero
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
                  add x5, x20, zero
                  lw  x20, (x5)
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
