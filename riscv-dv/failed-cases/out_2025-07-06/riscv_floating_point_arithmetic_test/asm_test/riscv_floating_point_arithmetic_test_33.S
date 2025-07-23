.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x5, h0_start
jalr x0, x5, 0
h0_start:
                  li x7, 0x40001120
                  csrw 0x301, x7
kernel_sp:        
                  la x23, kernel_stack_end

trap_vec_init:    
                  la x7, mtvec_handler
                  ori x7, x7, 1
                  csrw 0x305, x7 # MTVEC

mepc_setup:       
                  la x7, init
                  csrw 0x341, x7

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x7, 0x3800
                  csrw 0x300, x7 # MSTATUS
                  li x7, 0x0
                  csrw 0x304, x7 # MIE
                  mret
init:             
                  li x7, 0
                  fmv.w.x f0, x7
                  li x7, 2139095041
                  fmv.w.x f1, x7
                  li x7, 2139095039
                  fmv.w.x f2, x7
                  li x7, 2742652950
                  fmv.w.x f3, x7
                  li x7, 148279615
                  fmv.w.x f4, x7
                  li x7, 2147483648
                  fmv.w.x f5, x7
                  li x7, 2139095041
                  fmv.w.x f6, x7
                  li x7, 2143289344
                  fmv.w.x f7, x7
                  li x7, 2139095040
                  fmv.w.x f8, x7
                  li x7, 2143289344
                  fmv.w.x f9, x7
                  li x7, 2139095040
                  fmv.w.x f10, x7
                  li x7, 0
                  fmv.w.x f11, x7
                  li x7, 1639941
                  fmv.w.x f12, x7
                  li x7, 4286578687
                  fmv.w.x f13, x7
                  li x7, 2139095039
                  fmv.w.x f14, x7
                  li x7, 2143289344
                  fmv.w.x f15, x7
                  li x7, 4286578687
                  fmv.w.x f16, x7
                  li x7, 2147483648
                  fmv.w.x f17, x7
                  li x7, 2155194514
                  fmv.w.x f18, x7
                  li x7, 2139095039
                  fmv.w.x f19, x7
                  li x7, 2152443216
                  fmv.w.x f20, x7
                  li x7, 2153506169
                  fmv.w.x f21, x7
                  li x7, 3324532902
                  fmv.w.x f22, x7
                  li x7, 0
                  fmv.w.x f23, x7
                  li x7, 3290058
                  fmv.w.x f24, x7
                  li x7, 4286578688
                  fmv.w.x f25, x7
                  li x7, 0
                  fmv.w.x f26, x7
                  li x7, 2139095040
                  fmv.w.x f27, x7
                  li x7, 4286578688
                  fmv.w.x f28, x7
                  li x7, 2152259723
                  fmv.w.x f29, x7
                  li x7, 4286578687
                  fmv.w.x f30, x7
                  li x7, 2150999892
                  fmv.w.x f31, x7
                  fsrmi 4
                  li x0, 0x0
                  li x1, 0x3
                  li x2, 0x1
                  li x3, 0xe
                  li x4, 0x0
                  li x5, 0xf4564f51
                  li x6, 0x0
                  li x7, 0x80000000
                  li x8, 0x0
                  li x9, 0x80000000
                  li x10, 0x0
                  li x11, 0xfc22a2f0
                  li x12, 0x9033ae4c
                  li x13, 0x8
                  li x14, 0x0
                  li x15, 0x0
                  li x16, 0x0
                  li x17, 0x0
                  li x18, 0x80000000
                  li x19, 0x9
                  li x20, 0x6
                  li x21, 0x0
                  li x22, 0xe41eef30
                  li x24, 0x80000000
                  li x25, 0x0
                  li x26, 0xfb5a1a60
                  li x27, 0x80000000
                  li x28, 0x80000000
                  li x29, 0x0
                  li x31, 0xf51b4843
                  la x30, user_stack_end
main:             addi         t1, s5, 1094
                  sltiu        sp, ra, 1779
                  fsgnjx.s     fs8, ft7, fa5
                  fclass.s     a7, fs0
                  remu         sp, t2, t2
                  fsgnj.s      fa3, ft4, ft0
                  fsgnjn.s     ft1, fs0, fa1
                  srai         s4, ra, 20
                  srai         a1, s5, 21
                  divu         a2, t5, t0
                  fmax.s       fa4, fa6, ft6
                  fdiv.s       ft3, fs0, fa5, rdn
                  sra          a0, tp, sp
                  mulhu        s0, gp, t6
                  fdiv.s       ft1, fa7, fa6, rne
                  fsgnj.s      fa1, ft7, fa2
                  feq.s        sp, fs8, fa7
                  fmv.x.w      a7, ft5
                  mulh         a5, t0, sp
                  sltiu        a5, s1, 1263
                  fsqrt.s      fs1, fa3
                  add          a4, s11, s8
                  fcvt.s.wu    fa1, gp
                  fle.s        t1, ft10, ft8
                  fsgnjx.s     fa6, ft2, ft7
                  fcvt.s.wu    ft5, t5, rup
                  mulh         zero, s11, a5
                  srl          t6, a5, t1
                  slti         t6, a0, 496
                  fle.s        s2, fa2, ft0
                  fsgnj.s      fa5, fs7, ft7
                  fsgnjx.s     fa0, ft9, fs5
                  and          t1, s3, t1
                  mulh         t1, s11, ra
                  fclass.s     t6, ft0
                  sra          s3, s11, s7
                  auipc        a3, 463816
                  slli         a4, a3, 14
                  fmin.s       fs2, ft7, ft8
                  andi         t3, s3, -532
                  nop
                  fmin.s       ft5, fa6, ft11
                  nop
                  srai         s1, s4, 8
                  fcvt.s.wu    ft11, s1, rmm
                  flt.s        s3, fs2, ft1
                  fsgnjx.s     fs10, fa7, ft11
                  fclass.s     t4, fs6
                  fcvt.wu.s    s6, fa2, rup
                  xori         s6, s9, 2033
                  xor          t3, t3, t0
                  mul          sp, a7, a0
                  fle.s        gp, fs11, ft10
                  sltiu        a3, a1, 1876
                  auipc        s9, 76475
                  fsub.s       ft11, fs2, fa0
                  srai         a7, a5, 15
                  fcvt.wu.s    a2, fs8, rup
                  fmv.x.w      s9, fs1
                  fsqrt.s      ft3, fa7
                  slti         a0, t6, -85
                  fmin.s       ft10, fa2, ft9
                  nop
                  fmv.w.x      ft8, sp
                  fsub.s       fs10, fa4, fs9
                  andi         s6, t5, 473
                  mulhu        s10, s8, s4
                  mulhu        a5, a2, t1
                  slti         t1, s8, 1802
                  fclass.s     sp, fs4
                  xor          a6, t4, a0
                  fclass.s     s9, ft8
                  feq.s        a6, fa5, ft9
                  auipc        s11, 31685
                  ori          s3, a0, 406
                  flt.s        a7, fs1, fa4
                  srli         s3, s3, 4
                  mulhu        s6, t6, a3
                  fdiv.s       fs0, fs7, ft6, rtz
                  fcvt.w.s     ra, fa6, rne
                  sll          t4, tp, s5
                  rem          a2, s0, s0
                  sub          tp, a5, a2
                  andi         a5, zero, 245
                  xori         s11, a3, -1943
                  fcvt.s.w     ft7, t5
                  and          tp, s8, s6
                  fcvt.s.wu    fa6, t1, rtz
                  mulh         a4, s1, t5
                  fsgnj.s      fa7, ft6, fs10
                  slti         s0, tp, 1835
                  fsqrt.s      fs1, fs5, rdn
                  fcvt.w.s     t3, ft11, rup
                  fdiv.s       ft11, ft7, fs6
                  fcvt.w.s     s3, fs0
                  mul          a2, t1, gp
                  fmax.s       ft8, fs1, fa6
                  sltiu        a5, zero, 969
                  srli         t1, s11, 25
                  rem          a4, t5, s6
                  fdiv.s       ft6, fa5, ft0
                  slt          ra, t5, t1
                  fmv.x.w      t1, fa2
                  fsgnj.s      ft4, ft10, fa1
                  add          t4, a6, t1
                  slt          s0, a0, t2
                  rem          a4, t1, tp
                  rem          a4, a0, ra
                  add          t3, ra, t4
                  sra          s9, s5, ra
                  rem          s10, a3, s10
                  lui          t6, 853946
                  mulh         s3, t0, t2
                  slt          s4, t2, s7
                  divu         t1, s9, t4
                  fclass.s     a6, fa6
                  addi         s8, zero, 1467
                  div          s3, a1, a2
                  rem          a2, s2, s4
                  fsgnjn.s     fa1, ft1, fs8
                  fsqrt.s      fs8, fs10, rdn
                  fsgnj.s      fa3, fa4, fa1
                  fdiv.s       fa2, ft11, ft8
                  fmax.s       ft3, fa1, ft6
                  fcvt.w.s     s9, ft6
                  fmin.s       ft7, fs11, fs5
                  sub          a1, s6, zero
                  slt          sp, t1, ra
                  nop
                  and          a4, gp, zero
                  remu         t6, a3, a0
                  sub          a6, a3, s5
                  fmul.s       fs9, fs6, fs4
                  feq.s        a4, fs1, ft6
                  fsub.s       fs2, fs7, ft2, rmm
                  fcvt.s.w     fs11, sp, rdn
                  fcvt.w.s     s4, ft10, rdn
                  nop
                  xor          s5, s5, sp
                  addi         s3, s8, -505
                  feq.s        t1, fs3, ft10
                  slt          tp, s2, a4
                  rem          s3, s7, a7
                  xor          s5, zero, ra
                  fmv.x.w      s2, fs5
                  fle.s        s6, fs8, fs6
                  rem          s5, t4, s5
                  fmv.w.x      fs8, s8
                  fle.s        s3, ft5, fs5
                  addi         s9, s7, 537
                  srai         s9, a0, 4
                  feq.s        t3, fs2, ft1
                  fsgnj.s      fs3, ft3, fs3
                  and          a1, s1, a7
                  andi         a5, ra, 511
                  divu         s8, zero, t2
                  fsub.s       ft2, ft10, ft4
                  or           tp, t1, a4
                  fadd.s       fs10, fa5, fs2
                  fsgnjn.s     fs7, fs6, ft11
                  fcvt.s.w     ft0, s11
                  fmax.s       fs3, fs3, ft2
                  fclass.s     t3, fa4
                  xor          a0, ra, s6
                  divu         t6, s6, s10
                  remu         tp, t6, s4
                  fadd.s       fs11, fa0, fa2
                  fmax.s       fs3, ft2, fa2
                  sub          a5, t6, t0
                  remu         a7, t1, s6
                  auipc        a7, 955866
                  sltu         s11, tp, a0
                  fsub.s       ft11, fa7, ft3
                  fmax.s       fs7, fs3, fs10
                  srl          s6, s6, s1
                  fmin.s       fa2, fa7, fs11
                  mul          t3, a2, a6
                  fsgnjx.s     fs11, fs7, fa0
                  fsgnjn.s     fs7, ft3, fs9
                  fclass.s     s3, fa6
                  sltu         s3, tp, s5
                  fcvt.w.s     s10, fs9
                  fsub.s       fs9, fa5, fa2
                  remu         t6, t5, a5
                  sll          a3, s11, a4
                  mulhu        ra, sp, zero
                  fmin.s       fs2, fs6, ft1
                  slli         s1, t0, 22
                  fsqrt.s      ft1, ft7, rne
                  flt.s        t6, fs5, fs8
                  fcvt.s.wu    fs10, s9
                  fclass.s     zero, ft8
                  addi         a2, ra, 423
                  sub          a3, s7, t2
                  sltiu        s10, t1, 1904
                  slli         s9, tp, 10
                  remu         a5, s4, a6
                  xori         t3, a0, -828
                  rem          s5, zero, t4
                  divu         a0, sp, a3
                  fmax.s       fa3, ft2, ft10
                  xori         t1, s5, 421
                  feq.s        a4, fs6, fa6
                  xor          s11, ra, t2
                  mulh         s9, t5, s8
                  feq.s        s5, fa5, fs0
                  div          gp, tp, t0
                  fclass.s     t4, fs0
                  fmv.x.w      a2, fs0
                  fsub.s       ft9, fa4, fa5
                  srai         gp, s3, 17
                  fmv.w.x      fs3, s5
                  fle.s        s3, fa5, ft1
                  mul          s5, a7, ra
                  add          t6, t0, s5
                  mulhu        ra, a7, a4
                  feq.s        zero, fa5, fs2
                  addi         t3, a1, 1407
                  srai         tp, s1, 10
                  fadd.s       ft11, fs4, fa7
                  remu         a6, a3, s5
                  divu         t2, s7, t4
                  sltu         s9, s0, s10
                  add          tp, a4, a1
                  slti         a6, s5, 399
                  srl          ra, a7, a0
                  fsqrt.s      fs1, ft10, rmm
                  fdiv.s       fs10, ft3, fs5, rmm
                  xori         t6, s2, -104
                  sltu         a6, a1, a6
                  fsgnj.s      fs9, ft5, fs0
                  fsgnjx.s     fs0, fs0, ft7
                  sltu         zero, t1, a0
                  mulh         s0, a5, s2
                  slti         a7, t5, -1077
                  or           a1, s4, ra
                  mul          tp, t5, a6
                  slt          s0, t4, a3
                  or           s0, a2, tp
                  remu         a1, a1, t4
                  mulhsu       s1, t2, s7
                  fdiv.s       fa4, fa0, ft3
                  xor          a4, a4, a0
                  or           a2, t4, s5
                  fsgnjn.s     fs1, fs1, ft1
                  fmax.s       fa0, ft6, fa4
                  fdiv.s       fs8, ft4, fs5, rne
                  flt.s        s10, ft4, ft0
                  nop
                  mulhsu       s10, s5, ra
                  srai         s9, ra, 16
                  flt.s        t6, fs3, fs4
                  mulh         s0, tp, a0
                  fmul.s       fs9, fs8, fa0, rtz
                  andi         s8, s10, -1788
                  fmul.s       fs8, fa2, fs6, rup
                  slt          a7, a6, a6
                  mulh         a5, s9, s0
                  sll          ra, ra, s10
                  fcvt.w.s     s2, fa1
                  sltiu        t4, s10, 1565
                  fsgnjx.s     fa4, ft8, fa0
                  sub          zero, sp, a7
                  fmin.s       fs7, fa7, fa5
                  fmax.s       ft0, fa1, fa0
                  rem          a2, a5, a2
                  nop
                  fmul.s       ft8, ft4, fa1
                  fcvt.wu.s    zero, fs10
                  remu         s5, s8, s9
                  sub          zero, a2, s6
                  srli         s9, t6, 6
                  fsgnj.s      ft1, fs11, fa1
                  addi         a3, t0, 1712
                  sra          s1, a7, s10
                  fmv.w.x      ft2, t0
                  sll          a4, a4, a6
                  fsgnj.s      ft8, fs5, fa1
                  fsgnjn.s     ft3, fa5, fa0
                  fsub.s       fs7, fs3, ft9, rdn
                  flt.s        a7, ft1, ft5
                  divu         t2, a7, sp
                  fcvt.wu.s    s8, ft10
                  fcvt.s.wu    fs6, s2
                  flt.s        t3, fs8, fa2
                  flt.s        t1, fs11, fs4
                  srai         ra, gp, 25
                  remu         s9, t4, t3
                  lui          s6, 263343
                  sll          a4, zero, a5
                  sll          s1, s6, ra
                  srai         s1, s5, 21
                  feq.s        sp, fa5, fs6
                  fsgnj.s      ft5, fs10, fs2
                  fle.s        ra, ft2, fs3
                  mulhsu       t3, s6, t6
                  srai         sp, t6, 25
                  slt          t3, s7, s6
                  fsgnjn.s     ft4, fs1, ft5
                  slt          a6, zero, a6
                  sltu         sp, sp, t3
                  fcvt.w.s     s3, fa5
                  fsqrt.s      ft6, fa0
                  fcvt.w.s     t6, ft3
                  feq.s        s3, fa5, ft3
                  divu         ra, s11, a2
                  addi         gp, s4, -1096
                  sra          a3, a1, sp
                  srai         t4, s5, 16
                  slt          s5, t1, s6
                  fadd.s       fs10, fa6, ft2
                  flt.s        a1, fs1, fa1
                  lui          s8, 534655
                  xor          s2, a4, ra
                  sra          zero, a7, zero
                  lui          tp, 812625
                  mulh         t4, gp, tp
                  fcvt.s.wu    ft6, a5, rtz
                  fclass.s     a4, ft8
                  srai         a1, s3, 19
                  fcvt.w.s     s6, fs11, rtz
                  auipc        t3, 154960
                  xor          gp, t0, t6
                  auipc        s9, 451536
                  nop
                  ori          t6, t5, -313
                  rem          s1, s9, a7
                  xori         t4, s9, 811
                  lui          a4, 661451
                  fmin.s       ft0, ft7, fs9
                  fadd.s       ft8, ft9, ft2, rtz
                  sltiu        a0, s0, 411
                  slti         ra, t2, -1900
                  addi         t2, t4, -518
                  xor          s2, t4, a7
                  fsgnj.s      fs2, fs8, fa7
                  sra          a6, s3, s4
                  fdiv.s       fs9, fs4, ft10
                  fle.s        a0, fa6, fs0
                  feq.s        s3, fa3, ft4
                  fmv.w.x      ft8, s10
                  add          s11, gp, gp
                  sll          s6, s1, s1
                  fcvt.w.s     a5, fs5, rtz
                  addi         sp, a1, -372
                  srli         s8, s9, 3
                  sub          s1, s3, s11
                  addi         s6, a1, 1
                  fle.s        a7, ft8, fs5
                  mulh         s0, t1, a0
                  xori         a5, s8, -1027
                  fcvt.s.wu    fs9, s7
                  feq.s        tp, ft9, fs3
                  divu         sp, a4, t0
                  fsqrt.s      fs10, fs6
                  xor          s9, s9, s5
                  fsqrt.s      fa4, fs8
                  xor          sp, s3, s5
                  fadd.s       fa0, fs7, ft9, rtz
                  addi         s11, t3, -1149
                  flt.s        s3, fs6, ft2
                  sltiu        s11, tp, -2019
                  sltiu        t2, t6, -301
                  auipc        zero, 597073
                  fmax.s       ft4, ft2, fs8
                  lui          a5, 566264
                  or           a5, a0, s4
                  fsub.s       ft10, fa7, ft11, rdn
                  fcvt.s.wu    ft5, t3, rup
                  xor          a7, t3, s10
                  srai         a6, s2, 12
                  sltiu        a7, tp, -1129
                  lui          s5, 870835
                  remu         a1, a4, s1
                  auipc        s8, 976371
                  or           t1, s10, s8
                  fsgnj.s      fs8, fs4, fa3
                  fmv.w.x      fs10, s1
                  or           a5, a7, s7
                  fcvt.s.wu    fa3, a0, rne
                  srli         zero, t6, 31
                  sub          t6, gp, s10
                  mul          t4, a5, s11
                  fmv.x.w      s3, ft8
                  and          a4, s4, s8
                  fsgnj.s      ft8, fs5, fa1
                  mulhsu       t4, s10, s7
                  ori          sp, a5, 1777
                  fmv.x.w      t2, fs3
                  sll          a6, t0, s0
                  fmax.s       fs5, ft8, fs11
                  add          s3, a1, a5
                  mulh         s4, s6, t2
                  addi         s8, sp, 1810
                  slti         t4, t2, -963
                  fcvt.s.wu    ft10, ra
                  feq.s        a2, fs11, fs3
                  fmul.s       fs5, ft4, fs2
                  fadd.s       ft7, fs6, fs10
                  sll          s6, t0, zero
                  ori          s11, a5, -1778
                  fcvt.wu.s    s0, fa2
                  fcvt.w.s     a7, fs6
                  nop
                  auipc        s2, 543058
                  sll          s10, t3, s4
                  sll          tp, a1, a2
                  fcvt.w.s     a7, ft2
                  addi         zero, a3, -1189
                  rem          s10, s10, s7
                  mulh         s0, t0, s5
                  nop
                  andi         t2, sp, 624
                  mul          t4, t6, a4
                  fmul.s       fa1, ft3, fs5, rne
                  div          s3, t2, zero
                  andi         s2, a2, -1485
                  fsqrt.s      fa5, ft5, rtz
                  fsgnjn.s     fs6, fa7, fa7
                  add          zero, s1, s8
                  lui          a2, 891664
                  slli         ra, sp, 7
                  ori          t3, s11, -204
                  srl          tp, s10, ra
                  fsub.s       fs9, ft0, fa6, rdn
                  rem          s5, a5, s1
                  sll          a0, t5, a5
                  mulhu        a0, t3, tp
                  fmin.s       ft9, fs4, ft6
                  fmax.s       ft8, fs9, fa2
                  sll          a6, s2, s4
                  fcvt.w.s     t4, ft6, rup
                  rem          a2, s0, t1
                  add          t1, a5, a6
                  fmul.s       fs2, fa5, fs7
                  or           ra, a3, a6
                  fclass.s     a4, ft2
                  fmax.s       ft0, ft4, fa3
                  auipc        s0, 707850
                  srl          s10, ra, a0
                  fcvt.wu.s    a4, fs11, rtz
                  add          gp, t3, t0
                  slli         s11, t1, 17
                  fsgnjn.s     fs10, fs9, fa5
                  fsqrt.s      ft0, ft0
                  ori          t4, t6, 859
                  andi         a5, s0, -1312
                  and          a2, s10, s3
                  xori         a7, t0, 1561
                  lui          t3, 549454
                  xor          s3, s6, s8
                  xori         s10, t0, 470
                  fmv.w.x      fs10, sp
                  xor          t6, s3, a3
                  srai         gp, s4, 26
                  fsqrt.s      fs11, fa4
                  addi         t4, t4, 753
                  fcvt.w.s     a7, fs6, rtz
                  sra          t3, t2, s6
                  fmv.w.x      ft2, t1
                  fmv.x.w      tp, ft0
                  feq.s        s8, fa2, ft8
                  sra          ra, a6, gp
                  or           s11, a7, a4
                  div          s4, a1, t6
                  auipc        t4, 321046
                  sra          t1, a4, t2
                  slt          s3, a7, s0
                  fmv.w.x      ft6, ra
                  fsgnjn.s     fs2, ft9, fa5
                  sll          t1, s9, t3
                  or           t1, t5, a7
                  fcvt.s.w     fs1, zero
                  fsgnj.s      ft6, fs6, fs7
                  mul          tp, t5, a5
                  mul          s8, sp, t1
                  flt.s        s3, ft5, fs10
                  fmv.w.x      fa0, a2
                  fsgnjn.s     fa2, ft0, ft4
                  mul          gp, s2, zero
                  srai         s6, s11, 24
                  xor          t6, a2, s2
                  fdiv.s       fs9, fa7, fa0, rdn
                  sltiu        a5, s8, -1556
                  fsqrt.s      fa0, ft0, rne
                  slti         s5, s9, -55
                  sll          t3, s11, gp
                  lui          s8, 711364
                  rem          s10, s6, s4
                  fcvt.wu.s    s6, fs4
                  srli         s10, s1, 29
                  fcvt.s.w     ft0, t4
                  andi         s8, s7, -1422
                  srai         a2, s0, 18
                  divu         a7, t3, s3
                  mulhu        s1, s5, a6
                  nop
                  slt          s8, t0, s5
                  fadd.s       ft6, fs1, ft11
                  div          a3, s2, s10
                  fsgnjn.s     fs10, ft2, fs11
                  fmax.s       ft1, fs7, fs10
                  sub          a6, a2, t5
                  fmin.s       fs4, fa4, fs2
                  fle.s        s5, ft4, fa2
                  auipc        s6, 342006
                  mulh         a1, t2, s6
                  ori          ra, tp, -1563
                  fmax.s       ft2, ft3, fa6
                  fsgnjn.s     fs9, fs10, fa7
                  div          ra, zero, a0
                  sra          a7, s10, ra
                  rem          zero, a3, t3
                  mul          s10, sp, t6
                  slti         gp, s2, 1346
                  xori         tp, a1, -1298
                  add          s4, a3, a2
                  fsgnjn.s     fs1, ft9, fs1
                  xori         tp, tp, -609
                  fclass.s     a3, fs1
                  srai         a4, s11, 24
                  mulhsu       s3, t2, a7
                  fmin.s       fa1, ft11, ft11
                  remu         a5, tp, s6
                  fsgnjx.s     fa7, fs0, fa2
                  srl          a2, s8, a1
                  fadd.s       fs6, ft1, ft6
                  auipc        s2, 196541
                  slti         s0, s3, 1263
                  fsgnjx.s     ft6, fa6, fa3
                  fmul.s       fs4, fs9, fs10, rtz
                  sltiu        gp, s7, 769
                  slli         a1, tp, 26
                  slt          ra, sp, s0
                  andi         t3, s4, 320
                  fsub.s       ft10, fs5, fs6, rmm
                  remu         s4, a2, a2
                  nop
                  srl          t3, a6, t5
                  divu         s9, t0, t0
                  slt          tp, s10, t4
                  fmv.w.x      ft10, s6
                  fmax.s       fs6, fs1, fs7
                  fdiv.s       fa3, ft5, fs0, rtz
                  divu         a4, t0, s11
                  mulh         a1, t3, s11
                  fcvt.s.wu    fs2, s4
                  fsub.s       ft4, fs3, ft10, rup
                  slli         s1, a7, 14
                  fsgnj.s      fs0, ft9, fs3
                  slti         s8, s5, 1319
                  andi         a2, gp, -957
                  fadd.s       fa0, ft7, ft8
                  andi         s11, a5, 1707
                  fmin.s       ft10, fa0, fs9
                  mul          t6, s6, s4
                  addi         t4, t2, -997
                  fmv.x.w      s6, fs5
                  mulhu        a7, gp, a7
                  sub          t1, a4, s8
                  addi         ra, t3, 937
                  slt          tp, a1, t3
                  fclass.s     s11, ft9
                  nop
                  mul          sp, s3, s5
                  fsgnjx.s     fs6, fa0, fs5
                  mul          a7, t0, s9
                  lui          a5, 908985
                  sll          a1, ra, a6
                  xori         s2, s3, 365
                  fmin.s       fa1, fs1, fa3
                  fcvt.w.s     s0, fa7, rne
                  srl          a0, s0, a3
                  lui          tp, 851672
                  fadd.s       fa2, fs9, fs9
                  fsqrt.s      fs9, ft3
                  sltu         s8, a7, s11
                  fmv.w.x      fs4, s7
                  addi         zero, t2, -476
                  fle.s        zero, fs2, fs4
                  nop
                  fmul.s       fs9, fa3, ft5, rup
                  lui          s4, 846323
                  fsqrt.s      fs6, fs8
                  fcvt.wu.s    a5, fa2, rne
                  fcvt.wu.s    t2, fs5
                  srai         s8, a3, 21
                  or           t4, s10, s5
                  fsqrt.s      fs1, fa4
                  sltu         a4, s4, s10
                  divu         a1, sp, a0
                  fmin.s       ft4, fa4, fs3
                  fsub.s       ft1, fs7, ft11
                  remu         a1, ra, a1
                  fsgnjx.s     ft5, fs11, fs10
                  srl          s11, t5, s7
                  mulhsu       t6, s10, s2
                  sub          a0, a3, t0
                  srli         a5, s9, 28
                  xori         a7, a3, -1424
                  fsgnj.s      ft11, fa7, fa7
                  fcvt.wu.s    a2, ft11
                  fdiv.s       fa6, ft7, ft8, rtz
                  srai         s4, s7, 21
                  fmul.s       fs3, fs5, fa2, rne
                  fcvt.s.w     ft1, t2
                  fmul.s       fs5, fs5, fs5, rmm
                  xor          tp, t4, s11
                  add          s1, ra, t1
                  divu         s8, a2, t2
                  fmv.w.x      fs4, s8
                  rem          a6, t3, t2
                  mulh         a0, s1, t2
                  mulhu        s9, t2, s10
                  fle.s        ra, ft10, fa3
                  fsqrt.s      fa4, ft9, rdn
                  slti         a4, ra, -231
                  fsub.s       fa1, fs9, fa3
                  sltiu        zero, t0, -565
                  srl          s5, s5, t5
                  sll          s6, s6, s1
                  slti         a4, s8, -1160
                  mulh         a2, sp, t3
                  nop
                  div          sp, s4, zero
                  add          a4, s1, t4
                  fsgnj.s      ft1, fa3, ft11
                  divu         a5, a2, a2
                  fcvt.wu.s    a4, ft1
                  nop
                  slli         s4, gp, 6
                  sltu         a3, ra, a1
                  lui          gp, 332196
                  srli         s0, gp, 27
                  fadd.s       fs8, fa1, fa2, rup
                  and          a3, s6, s3
                  srai         gp, s1, 11
                  fcvt.w.s     a2, ft7, rup
                  fsgnjn.s     ft8, fs2, fs9
                  or           a6, t3, s4
                  sll          a5, s11, t3
                  fclass.s     s11, fs8
                  and          s0, s10, s9
                  fmul.s       ft5, fa5, ft7, rtz
                  sltiu        s5, sp, -507
                  fmv.x.w      a4, fs6
                  addi         s4, s2, 1558
                  srai         s9, s0, 29
                  fmv.w.x      ft1, t6
                  srl          ra, t5, s8
                  mulh         s4, s2, s2
                  add          t1, t1, ra
                  sub          s11, s10, s9
                  fdiv.s       fs7, fa2, ft0, rup
                  fmul.s       ft6, fa2, fs3, rup
                  add          zero, s1, a4
                  fmin.s       ft2, fa3, ft4
                  fsgnjx.s     fa5, fs6, fs6
                  fmin.s       fa4, fa2, ft8
                  slt          a3, t1, s10
                  sll          a0, s10, t0
                  fcvt.w.s     t4, fs4, rmm
                  sltiu        a1, t0, 1216
                  fcvt.s.wu    fs9, t1
                  divu         gp, a5, t4
                  fcvt.s.wu    ft10, s11
                  fsgnj.s      ft0, ft11, fa3
                  slli         a4, t6, 5
                  fmv.w.x      fs10, a1
                  slti         a2, a5, -357
                  fsqrt.s      fs7, fa6
                  fcvt.wu.s    a7, ft4, rtz
                  remu         s5, s3, s3
                  fmul.s       fs5, fa3, fa1, rdn
                  auipc        a7, 309788
                  fclass.s     s8, ft10
                  feq.s        s5, ft11, ft3
                  div          t3, t3, tp
                  fcvt.s.wu    ft10, gp
                  xor          s2, a1, a2
                  div          s1, s3, a4
                  andi         t1, t1, 1377
                  fsgnj.s      fs4, ft10, ft11
                  auipc        gp, 1040928
                  addi         a6, s5, 1760
                  fsgnjn.s     fs1, ft2, fs0
                  fadd.s       fs11, fs2, ft1, rup
                  sll          a5, a0, tp
                  fsub.s       fs3, fs7, fs7
                  fsqrt.s      fs11, ft0, rmm
                  add          ra, t6, a3
                  fadd.s       ft0, fs4, fa7
                  sltiu        s11, a4, -127
                  fmax.s       fs0, fs2, ft4
                  fcvt.s.w     fs1, s0
                  fcvt.s.w     fa0, a2
                  slti         s11, gp, 501
                  fcvt.wu.s    tp, ft2
                  feq.s        sp, ft5, fa7
                  fsgnj.s      fs8, fa2, ft9
                  fcvt.s.wu    fs4, a4
                  slli         ra, a7, 31
                  flt.s        a6, ft4, fs5
                  div          t6, a4, t4
                  mulhu        t1, t3, a7
                  srai         s10, t0, 28
                  lui          a0, 37489
                  sll          t1, ra, a5
                  feq.s        s9, fs3, fs11
                  fclass.s     s3, fs5
                  ori          s0, gp, -1312
                  fsgnjx.s     ft5, fs2, fs9
                  xori         s0, a7, -1411
                  auipc        a4, 947304
                  fsgnjn.s     fs0, fs4, fs2
                  fclass.s     a7, ft4
                  or           t4, t5, t3
                  fcvt.w.s     ra, fs3
                  fle.s        t1, fa3, fa3
                  fsub.s       fa2, ft11, fa6
                  srai         ra, s8, 15
                  remu         a4, a5, t3
                  mulh         s0, s11, a0
                  and          a0, a4, s4
                  fsub.s       fa7, ft4, ft5
                  fcvt.s.wu    fs6, s4, rtz
                  fadd.s       ft11, fa4, fs3
                  addi         s8, t6, -892
                  fsgnjx.s     ft8, ft8, ft1
                  nop
                  srl          s1, a0, sp
                  sll          a1, t6, s10
                  fsgnjn.s     ft11, ft11, fa2
                  sll          s11, a4, a6
                  fsgnjx.s     fs0, ft5, fa3
                  xor          a1, a7, a0
                  add          s10, zero, a5
                  fcvt.s.wu    ft7, a0, rup
                  andi         s4, s1, 1363
                  divu         tp, s10, t3
                  sll          t2, t1, s8
                  fcvt.s.w     fs8, s9
                  mulhu        tp, t4, a0
                  fsub.s       ft8, ft6, fs8
                  ori          ra, t5, -1214
                  lui          a4, 769462
                  addi         t1, s7, 1208
                  sll          s1, a0, s5
                  fcvt.w.s     t4, fs3, rne
                  fadd.s       fs4, ft7, ft11
                  fsub.s       ft9, fs1, fs5, rdn
                  or           s9, a3, t0
                  div          a5, s9, s8
                  lui          t2, 1019622
                  fcvt.s.wu    ft7, a6
                  fadd.s       fa4, ft11, fa1, rup
                  srl          s8, s6, t4
                  ori          a5, t1, 1706
                  fmv.w.x      fa3, a5
                  mul          a5, t2, a7
                  fmax.s       ft1, fs5, fa0
                  sra          t6, t5, s11
                  add          a6, t4, sp
                  flt.s        a2, fs1, fs7
                  fsgnj.s      ft9, fs5, fs5
                  mul          a4, ra, sp
                  fsgnjn.s     ft11, ft0, fa7
                  xor          a6, t0, s5
                  srl          ra, s2, a2
                  fcvt.wu.s    t3, fs11
                  rem          a2, a5, ra
                  srli         s10, s11, 26
                  andi         s5, a1, 512
                  slt          gp, tp, s10
                  addi         s1, a3, -1438
                  srai         a3, a1, 21
                  fmv.x.w      a5, fa4
                  xor          t6, gp, t6
                  mulh         s2, s11, a4
                  addi         s1, s4, 640
                  fclass.s     a7, ft8
                  fcvt.s.wu    ft6, a2, rdn
                  fmax.s       fa2, ft0, fa7
                  flt.s        s9, fs10, ft7
                  flt.s        a3, ft1, fs2
                  and          s11, s7, gp
                  fsqrt.s      fa2, ft5, rup
                  fmv.x.w      a5, ft10
                  lui          s9, 485764
                  nop
                  sra          zero, t2, s4
                  fdiv.s       ft7, fs5, ft5
                  slt          s2, s3, s11
                  srli         sp, s8, 20
                  add          s10, a4, t5
                  mulhu        a4, s7, t5
                  fle.s        t4, fs9, ft1
                  mul          t1, a5, a4
                  fmax.s       fs5, ft4, fs10
                  fadd.s       fs6, ft1, ft3
                  sra          tp, s8, s7
                  sra          t1, a4, a2
                  sltiu        tp, sp, -266
                  fcvt.w.s     s4, fa3
                  fmv.w.x      fs2, ra
                  fcvt.s.wu    fs1, s0
                  fclass.s     s6, ft7
                  auipc        t4, 381677
                  mulh         s8, s0, a1
                  fmv.x.w      a1, fs7
                  fdiv.s       ft9, fs0, fs1
                  flt.s        a7, ft3, ft2
                  sltiu        s10, a6, -789
                  srai         a6, s10, 7
                  andi         s11, s9, -1300
                  remu         a4, a4, t3
                  fsgnjx.s     ft1, ft2, fa4
                  ori          a2, a1, -1288
                  mulhu        t3, a3, a7
                  xor          a4, t6, t6
                  fsgnjx.s     ft8, ft3, fs0
                  div          t6, t0, s1
                  slti         s6, s7, -842
                  sll          a0, a6, t2
                  auipc        a4, 88160
                  srai         s9, ra, 23
                  lui          a7, 829790
                  slti         t2, t1, 1470
                  sub          a6, sp, s8
                  fcvt.w.s     s10, ft3, rtz
                  slt          t4, t6, a6
                  mulh         t6, s6, s3
                  sra          a5, s1, t4
                  sub          s1, s5, gp
                  sltu         s1, tp, zero
                  fadd.s       ft4, ft7, fs6
                  mulhsu       gp, s0, t5
                  fmv.w.x      fa3, ra
                  slt          a3, s5, a0
                  fmv.x.w      s9, ft3
                  and          a3, a2, t6
                  fmv.w.x      fs8, s10
                  srli         a4, s6, 23
                  addi         t4, t6, 395
                  fsgnjx.s     fa4, fa2, ft10
                  fcvt.s.wu    ft10, s6, rne
                  lui          t2, 770911
                  srli         s10, tp, 28
                  auipc        a6, 550976
                  fcvt.w.s     s1, fa3
                  div          s0, a1, t3
                  sll          a6, t1, a5
                  andi         gp, a2, 808
                  addi         s10, s9, -722
                  add          gp, s5, s6
                  fsqrt.s      fs10, fs5, rtz
                  add          s4, t6, s8
                  add          a7, sp, s1
                  fmin.s       ft8, fa0, fs11
                  fsqrt.s      fa2, fa4
                  divu         sp, t0, s5
                  fclass.s     t4, ft6
                  fmv.w.x      fs5, s8
                  fsub.s       ft3, ft1, fa7, rtz
                  slt          s5, s3, ra
                  nop
                  mulhsu       a5, t5, t2
                  mul          tp, t4, a2
                  add          s1, s9, s11
                  fcvt.wu.s    t2, fs6, rdn
                  fsgnjx.s     fs10, fa1, fa5
                  remu         t2, t5, sp
                  ori          a4, s3, 1510
                  feq.s        a0, fs11, fa2
                  fdiv.s       fs7, fs3, ft3
                  fmv.w.x      fa0, s2
                  slti         s0, s8, 1901
                  divu         s4, s4, a2
                  sub          s3, a7, s8
                  sra          s1, a4, a5
                  xori         t6, a0, -1760
                  fmv.w.x      ft2, s5
                  fsgnjn.s     fa7, fa4, ft3
                  sub          t3, sp, a1
                  fmv.w.x      ft8, a7
                  and          s2, t0, a5
                  sltu         a1, s5, a0
                  flt.s        t1, fa4, fs7
                  fclass.s     tp, fs7
                  fmv.x.w      s9, ft8
                  fmul.s       fs8, fs9, ft0
                  lui          a5, 418403
                  xor          t2, s6, t2
                  fmv.w.x      fs11, t5
                  fcvt.w.s     s6, fa1
                  slli         a4, zero, 2
                  fmax.s       fa4, fs7, ft1
                  nop
                  lui          s1, 425672
                  fmin.s       fa2, ft8, ft1
                  sltu         s11, t5, s8
                  fadd.s       ft5, fs2, ft4, rup
                  fmv.x.w      s10, ft3
                  fmv.x.w      t2, fa3
                  slt          s5, s3, ra
                  fsgnj.s      fa4, fs6, ft6
                  ori          a6, a6, 641
                  andi         t3, s5, -1939
                  sltiu        t6, s7, 694
                  fsgnj.s      ft3, ft0, fs7
                  auipc        t4, 152581
                  fcvt.w.s     sp, ft5
                  fsub.s       ft3, ft7, ft8
                  fle.s        a7, ft0, fa0
                  sll          a0, s2, s6
                  feq.s        s1, ft11, ft9
                  remu         s6, s5, gp
                  fcvt.w.s     t4, ft5, rtz
                  remu         t6, a3, s6
                  remu         s9, t3, s6
                  div          t4, t6, t4
                  auipc        t6, 670680
                  addi         s0, a4, -1727
                  and          tp, a3, a6
                  rem          s4, a4, a4
                  fsgnj.s      ft1, fs4, ft3
                  rem          s5, a2, zero
                  mulhsu       sp, a0, ra
                  xor          s3, a0, t0
                  sltu         a6, a5, s9
                  andi         zero, s11, -1161
                  xori         t6, s3, 141
                  xor          a5, s11, s7
                  andi         a5, t0, -861
                  fcvt.s.wu    ft6, a0, rmm
                  fmv.w.x      ft11, t3
                  fmul.s       fs9, fs10, ft4
                  sll          a6, a5, a2
                  fmv.w.x      ft10, t4
                  fsgnjn.s     fs6, ft3, fa4
                  lui          gp, 194649
                  fdiv.s       fa5, ft0, ft0
                  sll          s5, a0, s9
                  fcvt.w.s     a4, fa0, rtz
                  divu         t2, s3, t5
                  fsgnjx.s     fs2, fs7, fa0
                  divu         a1, s5, gp
                  or           s2, s8, t4
                  fsgnjn.s     fs10, ft9, ft9
                  auipc        ra, 221
                  remu         s6, tp, zero
                  and          a1, t0, t6
                  xor          a7, t6, s10
                  divu         sp, a1, s3
                  feq.s        a7, fs1, fa2
                  fcvt.w.s     a7, fs8, rup
                  slt          a0, a6, a2
                  sltiu        s2, a2, 1454
                  fle.s        a2, fa2, ft7
                  sra          a2, t1, t5
                  flt.s        tp, ft9, fa7
                  remu         s3, zero, a2
                  fsgnjx.s     fs4, fa7, fa3
                  fmul.s       fs0, fa4, fs1
                  fmin.s       fa2, fs10, fa6
                  lui          a3, 442114
                  srli         a1, a2, 30
                  sra          ra, t3, a5
                  rem          t2, t3, ra
                  fcvt.w.s     s10, fs11, rmm
                  srai         a1, zero, 12
                  fdiv.s       ft6, ft2, fa7, rne
                  auipc        sp, 377714
                  ori          t2, a4, 551
                  auipc        a6, 974100
                  sll          t4, t2, s10
                  fmv.x.w      t1, fa5
                  feq.s        a5, ft0, ft3
                  add          t3, s7, a0
                  sra          t6, t5, t0
                  sltu         s1, s10, a4
                  fcvt.s.wu    ft10, gp, rtz
                  fcvt.s.w     ft10, a4, rmm
                  fadd.s       ft3, ft5, ft5, rtz
                  sltu         t3, s11, gp
                  fsgnjn.s     fa6, ft0, fs10
                  andi         s1, s9, 255
                  lui          s9, 1012069
                  mulh         t6, t3, s6
                  sltiu        a7, a6, 109
                  fcvt.wu.s    tp, fa7, rmm
                  fmv.w.x      fs0, a7
                  sll          t3, s10, t6
                  ori          t4, a3, -1157
                  auipc        s2, 623523
                  flt.s        s1, fa6, fs9
                  fcvt.s.w     fs7, s6
                  fdiv.s       fs0, ft2, fs11
                  auipc        s5, 735092
                  mul          a4, ra, a1
                  sub          t4, ra, t3
                  andi         t6, a6, 597
                  addi         s5, t5, -1304
                  ori          t2, a3, -666
                  nop
                  fle.s        s3, fs0, fa4
                  flt.s        zero, ft8, fa0
                  srai         s5, s4, 15
                  mulh         s2, t5, a4
                  fmin.s       ft2, fa4, fs10
                  sra          s10, a7, zero
                  feq.s        s10, fs9, ft0
                  fmul.s       fs8, fs6, fs4
                  ori          s1, t0, 1593
                  fsub.s       fs3, fs1, ft2
                  fadd.s       fa2, ft7, ft10
                  fclass.s     tp, ft4
                  lui          s0, 544331
                  auipc        s10, 1013961
                  andi         t4, a7, 228
                  sltiu        t6, a7, 844
                  rem          a3, t3, sp
                  divu         a1, a0, s6
                  mulhsu       tp, sp, a0
                  nop
                  fcvt.s.w     fs1, s11, rup
                  nop
                  sra          t4, a2, t4
                  fsgnj.s      fs6, fa4, fa6
                  fcvt.s.w     fa3, a6, rmm
                  srai         s6, t0, 25
                  slti         a5, t3, 1034
                  fmin.s       ft10, ft0, fs6
                  fcvt.wu.s    s5, fa1
                  fcvt.wu.s    s6, fs4
                  rem          s10, t6, s8
                  fmv.x.w      s4, fs3
                  fsub.s       ft3, fa2, ft8, rtz
                  sub          s0, s0, s2
                  mulhu        t4, a4, t0
                  nop
                  fclass.s     ra, fa1
                  andi         a3, a2, -1788
                  fdiv.s       ft6, fa2, ft2
                  mul          t2, s5, s2
                  fsgnjn.s     ft1, fa5, ft3
                  nop
                  fsgnjx.s     fs7, ft8, fs0
                  feq.s        a5, fa2, fs9
                  fmax.s       fs1, ft0, fs5
                  or           a7, t1, s11
                  sltiu        s2, gp, 971
                  slli         s6, a7, 24
                  fmv.w.x      fa3, ra
                  fsgnjn.s     fs9, ft5, ft1
                  flt.s        a7, fs10, fs3
                  rem          s2, s5, s5
                  srli         tp, ra, 25
                  fsub.s       ft3, fa7, fs2
                  feq.s        a5, ft6, fa2
                  flt.s        t6, fs6, fs10
                  fcvt.s.wu    ft6, ra
                  rem          t6, a0, t1
                  fle.s        a0, fa3, ft10
                  fsqrt.s      fa1, fa7
                  lui          s11, 999504
                  fsgnj.s      fs8, ft4, ft7
                  ori          s0, a3, 1398
                  addi         sp, t2, 837
                  srli         s9, s1, 19
                  fcvt.wu.s    a1, fa2
                  lui          t6, 688289
                  fsub.s       ft10, fs1, ft4
                  sltu         s8, t5, t0
                  fsgnjx.s     ft6, fs8, fs4
                  mulh         a5, s6, s2
                  sltiu        s1, a0, 664
                  div          a7, a7, s11
                  fsqrt.s      fs9, fs1, rtz
                  mulhu        s3, s4, s10
                  srl          t1, t0, zero
                  sra          s11, a1, tp
                  slt          s4, t4, t2
                  fclass.s     s0, fs0
                  fmax.s       ft5, fs1, fa2
                  fadd.s       ft3, fs10, fa1
                  fsqrt.s      fa7, ft0
                  nop
                  sra          s11, tp, s9
                  lui          s2, 213263
                  mulhu        s8, s8, s0
                  fcvt.s.w     fs3, zero
                  sll          t4, gp, s8
                  xor          s2, s8, a6
                  xori         sp, a1, -530
                  slli         tp, s2, 23
                  fcvt.w.s     s3, ft4, rdn
                  xor          zero, tp, s5
                  sltiu        t6, sp, 1731
                  fmv.w.x      ft8, a1
                  fsgnjn.s     fs10, fa1, ft3
                  fmin.s       ft6, fs8, ft5
                  rem          s1, t6, s6
                  fsgnj.s      fa1, ft11, ft0
                  mulh         a3, s11, s9
                  fsqrt.s      ft3, fa0, rmm
                  flt.s        s2, fa7, ft10
                  and          s8, s5, s1
                  xor          s3, gp, a7
                  flt.s        s2, ft9, ft9
                  slti         t4, a5, -1239
                  feq.s        a3, fs11, fs6
                  nop
                  sra          t1, a0, a7
                  mulhsu       a7, s2, tp
                  fmax.s       ft10, ft0, ft8
                  fdiv.s       ft3, ft8, ft8
                  mulh         s10, a1, a0
                  fmv.x.w      s3, fs8
                  fsgnj.s      ft9, fs10, ft0
                  addi         a4, s7, -1780
                  srai         s3, s6, 15
                  fcvt.s.wu    ft7, a1
                  div          a5, a3, s1
                  xori         t6, t3, 1286
                  mul          a5, sp, t3
                  mul          a4, a3, t4
                  fcvt.s.wu    ft5, t0
                  sra          s0, s7, s7
                  slli         t1, t3, 20
                  fcvt.wu.s    s0, ft4, rne
                  fcvt.s.wu    fs4, a0, rmm
                  mul          s1, s0, t3
                  andi         ra, s4, 2024
                  remu         a2, t0, a1
                  mulh         s2, a5, a1
                  mulh         t1, t6, tp
                  fsqrt.s      fs10, ft4
                  xori         ra, a1, 621
                  fsgnjn.s     fs10, fa3, ft8
                  flt.s        zero, ft8, ft6
                  mulh         a3, t5, gp
                  ori          s6, s8, 969
                  fsgnj.s      ft10, ft4, fa2
                  fsgnj.s      ft3, fs7, fa5
                  fcvt.s.w     fs10, a5, rdn
                  and          s4, a7, s6
                  auipc        s6, 512894
                  fmv.w.x      fs5, t6
                  andi         t1, s4, -141
                  fclass.s     s4, fs2
                  flt.s        s4, ft0, fs7
                  mulhsu       t6, a6, a0
                  fsqrt.s      fa2, fs9, rdn
                  srli         a5, s5, 23
                  fdiv.s       fs6, ft10, fa5, rne
                  srli         t1, s0, 27
                  nop
                  add          a0, t0, tp
                  remu         sp, ra, s9
                  xori         a2, a6, -1261
                  fcvt.w.s     t3, ft8
                  addi         s9, a1, -1397
                  srai         a6, s3, 27
                  mulhu        ra, t4, a6
                  fcvt.s.w     fa3, t6
                  xor          s10, sp, s6
                  mulhsu       t1, s1, a1
                  sub          s5, s3, a2
                  slt          s6, a3, a3
                  fmul.s       fs0, ft1, fs8, rmm
                  lui          s2, 97383
                  lui          s3, 989880
                  xor          a3, s9, s10
                  fsgnjn.s     ft5, fs4, ft4
                  andi         s0, tp, 1332
                  fcvt.w.s     s8, ft4
                  fadd.s       fs4, ft3, ft1, rmm
                  srli         s6, a7, 14
                  srl          s11, ra, s1
                  srl          s6, a2, a5
                  auipc        s6, 286536
                  auipc        s6, 170480
                  slti         a7, t4, -1430
                  fsgnjn.s     fa2, ft0, ft10
                  nop
                  and          s4, s11, t2
                  fcvt.wu.s    s10, fs0, rtz
                  slti         a7, s10, -978
                  sll          a2, a5, ra
                  fsub.s       fs0, fs0, fa6
                  mulhsu       zero, s11, s7
                  fcvt.s.wu    ft0, s1, rne
                  sltu         t4, a6, zero
                  mulhu        a2, a2, a5
                  fsgnjn.s     ft8, ft11, fs4
                  mul          s10, sp, t3
                  auipc        zero, 910321
                  feq.s        a7, ft1, fs0
                  sub          s8, t5, s4
                  fadd.s       ft1, ft4, ft5
                  slti         s9, a6, 161
                  fmv.x.w      s4, fs5
                  and          a1, s1, gp
                  xor          a6, t1, t0
                  divu         t4, a4, t2
                  slli         s9, t3, 1
                  fcvt.s.w     ft8, t3, rmm
                  andi         sp, a2, 1222
                  sra          a0, s5, s11
                  rem          a2, zero, t3
                  andi         s11, s1, 1413
                  fmv.x.w      a7, fs9
                  xor          s8, a3, s1
                  andi         tp, s3, 809
                  sltu         s11, s3, s5
                  addi         ra, a3, -564
                  sra          s6, gp, s4
                  mulhu        s11, tp, t6
                  flt.s        s6, fa5, fa2
                  feq.s        tp, fa7, ft11
                  flt.s        s4, fs0, fa5
                  auipc        s3, 730354
                  fsgnjn.s     fs10, ft2, fs10
                  slli         tp, t3, 31
                  fclass.s     a1, fa2
                  fsgnj.s      ft10, fs10, fs8
                  sltu         tp, t5, a2
                  sll          s10, zero, s9
                  rem          t6, a3, t3
                  srl          t1, t3, t5
                  and          t3, t0, a1
                  andi         s9, s3, 539
                  remu         a3, s10, sp
                  fcvt.w.s     s6, fs10
                  add          s10, s11, s0
                  mulhsu       a1, t3, s0
                  fsgnjx.s     fs9, ft1, fs5
                  fsgnjn.s     fa0, fa2, ft2
                  sltiu        s10, s0, 443
                  fsgnj.s      fs11, fs7, fs2
                  addi         t4, a1, 1950
                  fcvt.wu.s    a6, ft1
                  fmul.s       ft5, ft5, fs2
                  fsgnjn.s     ft1, ft10, ft2
                  xor          s10, t3, s5
                  mulhsu       s4, a1, tp
                  xori         a2, a7, 508
                  mul          s5, ra, t0
                  ori          a2, a4, -1688
                  add          s2, t5, s4
                  fle.s        s1, ft9, fs4
                  or           a6, s6, s7
                  xori         s0, zero, 812
                  andi         s9, t5, 1448
                  add          a5, a2, a6
                  fsgnj.s      ft6, fs4, fa4
                  div          a4, t2, a6
                  fsgnjx.s     ft6, ft5, fs1
                  sub          a0, a6, a5
                  div          s4, t4, t3
                  slt          s4, t3, s1
                  fmul.s       ft2, fs6, fs7
                  sltu         a7, t4, t0
                  fsgnjn.s     ft6, fs11, ft5
                  addi         a6, s5, -705
                  fdiv.s       fs1, fs2, ft2
                  or           tp, s11, a2
                  sub          t1, gp, s4
                  mul          s0, s2, s6
                  mulhsu       s10, zero, t1
                  fmul.s       fs9, ft5, fa1
                  fcvt.wu.s    sp, fs7
                  mul          tp, ra, tp
                  fcvt.s.w     fs0, a3, rne
                  slt          a1, t0, s2
                  mulhu        t1, a0, a3
                  sub          s9, s5, a3
                  srl          s9, a3, s2
                  fmv.w.x      ft1, ra
                  fmin.s       fa3, fs1, ft9
                  fmv.x.w      a7, ft10
                  flt.s        sp, fa7, fs7
                  andi         s2, gp, 913
                  fsub.s       fs9, fa2, fs0
                  or           t1, sp, t4
                  xor          sp, a6, tp
                  xori         s6, a2, -214
                  fmv.w.x      ft10, t2
                  or           s9, t5, a1
                  mul          s11, t6, a5
                  srl          t6, a0, t0
                  xor          s6, a4, a4
                  fcvt.wu.s    s3, ft7
                  remu         t2, s6, a5
                  mulhsu       s10, a6, t4
                  remu         s1, zero, s6
                  mul          zero, t4, s9
                  andi         s4, s5, 1860
                  fmul.s       ft0, fs1, ft9, rmm
                  fsgnjx.s     fa4, fa4, fs2
                  fle.s        a4, fs1, fa6
                  xori         s3, a5, 1278
                  fmax.s       fs1, fs5, fa6
                  fsub.s       fa6, ft6, fa1, rtz
                  fdiv.s       fs3, ft2, ft8
                  mulhsu       s5, s9, ra
                  lui          a5, 132530
                  ori          tp, s10, -54
                  slti         t2, t3, -1709
                  slti         t2, zero, 56
                  or           s2, t0, a4
                  fcvt.s.w     fa3, t0, rup
                  mulhsu       s4, a5, a1
                  addi         t6, t3, 1043
                  fmul.s       ft1, fs7, ft1, rtz
                  srai         a7, a1, 24
                  fmul.s       ft0, ft4, ft11, rdn
                  slli         t3, tp, 6
                  fsgnjn.s     fs1, fa0, fs11
                  slli         a5, s11, 24
                  fcvt.s.wu    fs1, s2
                  fclass.s     a1, fa1
                  srai         s6, s2, 25
                  fmv.x.w      t6, ft2
                  fsgnjx.s     ft4, fs8, fa4
                  mulhu        s3, t3, s1
                  mulhsu       s0, s4, t2
                  add          s8, s8, t5
                  fcvt.s.w     fa2, s6
                  srli         s0, a5, 22
                  addi         zero, tp, 1951
                  fadd.s       ft7, fs0, fa0, rtz
                  xor          ra, t1, t4
                  feq.s        t3, ft11, fs0
                  mul          s9, a4, s4
                  or           s3, a4, t2
                  fsub.s       fs10, fa2, fs1
                  sltu         t3, s1, a1
                  fsgnj.s      ft0, ft10, ft3
                  fmv.x.w      t2, fs10
                  mul          a5, t2, s3
                  sra          a5, s3, s6
                  ori          sp, s9, -513
                  sra          t6, t0, tp
                  divu         t3, s0, a2
                  mul          s8, t6, s1
                  fclass.s     s3, ft8
                  fdiv.s       ft9, ft5, ft5
                  mulhu        s4, s0, tp
                  xori         t6, a7, 2035
                  slti         s0, s7, -260
                  srai         t4, sp, 24
                  fdiv.s       fs5, fa7, fs2, rdn
                  slti         a1, ra, -1080
                  mulhu        s6, a0, a1
                  mulhsu       s11, s1, s8
                  add          zero, a2, s2
                  srl          a7, gp, s5
                  fsub.s       fs8, fs9, fa3, rdn
                  flt.s        a1, fa1, ft3
                  fmax.s       fa7, fs3, fs6
                  mul          s3, t6, s9
                  andi         a7, s10, -1230
                  fsqrt.s      ft7, ft1
                  fsgnjx.s     ft11, fa6, ft3
                  fmv.x.w      a5, ft4
                  ori          tp, t4, -291
                  fle.s        s6, fs0, fa1
                  fcvt.s.w     fs7, gp
                  slti         s8, s2, -1941
                  slt          s0, t3, t5
                  lui          t3, 936005
                  nop
                  div          t3, s0, s7
                  fcvt.s.w     ft9, a5, rmm
                  slti         t1, a0, 1989
                  rem          t4, a7, t6
                  div          gp, t6, s9
                  fsqrt.s      fa2, fs1
                  slti         s3, s11, -42
                  fcvt.w.s     a3, ft11
                  fsqrt.s      fs3, ft11
                  fmin.s       fs2, ft2, ft0
                  mul          a0, sp, s9
                  xori         s3, s8, 353
                  fadd.s       ft2, ft11, fs0, rmm
                  fmax.s       fs4, fs10, fa0
                  flt.s        zero, ft5, fa1
                  fcvt.s.w     ft8, a1, rup
                  fsub.s       fs0, fs0, fa7, rmm
                  mulhu        a6, s2, t5
                  fmv.w.x      fs2, a0
                  remu         a4, s7, sp
                  lui          gp, 869927
                  fclass.s     a1, fa0
                  mulhu        s9, s3, s9
                  auipc        a5, 724784
                  andi         s4, ra, -1618
                  fsqrt.s      fs6, ft7, rdn
                  fcvt.s.w     fa1, a7, rup
                  fmax.s       fa2, ft0, ft3
                  sltiu        a0, s3, 1936
                  slti         s11, s6, -447
                  feq.s        t1, fa4, fs7
                  fsgnjn.s     ft10, ft9, fa2
                  add          s4, s4, s2
                  sra          t6, ra, gp
                  lui          a1, 870014
                  fclass.s     s9, ft3
                  sra          s6, t0, s11
                  fmv.x.w      s10, ft0
                  sll          t2, ra, t5
                  sltu         s8, s6, t2
                  srl          a7, a6, sp
                  fsgnj.s      fs2, ft2, fa3
                  mulhsu       s8, a6, a5
                  fcvt.s.w     ft3, ra
                  fsqrt.s      fs4, ft10, rup
                  mulhsu       s0, s9, zero
                  mul          t2, a2, t6
                  add          s5, s7, s3
                  fmax.s       ft8, fs4, fs7
                  fmv.x.w      s9, ft5
                  fcvt.w.s     a0, fs9, rne
                  fsgnjn.s     ft5, fa3, ft10
                  auipc        a5, 448493
                  auipc        a6, 243196
                  and          zero, t0, s9
                  fcvt.s.w     fs1, s5, rtz
                  fdiv.s       fs0, fa3, fa3
                  or           t3, a3, tp
                  ori          t6, s7, -841
                  feq.s        zero, fa1, ft2
                  divu         a0, t5, t6
                  nop
                  slti         s4, s7, -226
                  fcvt.w.s     a7, fa5, rne
                  fcvt.wu.s    s3, fa1, rtz
                  sltiu        t3, a2, -812
                  mulhsu       a6, s7, s1
                  fsgnjx.s     fs3, fa4, fs7
                  flt.s        t6, fa3, fa4
                  fadd.s       fa2, fa0, ft8, rtz
                  slli         a1, s11, 16
                  fcvt.w.s     s9, ft11, rdn
                  nop
                  fdiv.s       fs7, fa0, fa1
                  mulhu        t6, s10, a6
                  auipc        t1, 87494
                  mul          a1, a5, s7
                  srli         a1, a2, 17
                  fclass.s     s9, fs3
                  sub          s0, a0, s5
                  auipc        s3, 953290
                  fsgnj.s      fa7, fa6, ft1
                  div          tp, a7, a4
                  slli         s1, a6, 11
                  fsgnjx.s     ft7, fs3, fa4
                  slli         t4, a3, 1
                  addi         zero, s7, 1455
                  xori         t2, s9, -1072
                  mulh         tp, a5, t5
                  srl          t4, ra, zero
                  sub          s5, t0, t1
                  slli         s8, t1, 25
                  rem          s4, a4, t6
                  rem          s3, s9, s0
                  lui          sp, 164122
                  mulhu        t4, a5, a5
                  mulhsu       a6, a5, t5
                  fsgnjx.s     fs7, fs1, fs1
                  nop
                  fclass.s     a4, fs0
                  sll          a4, s11, s2
                  fsub.s       fs9, ft4, fs11
                  add          a7, a4, t6
                  addi         t1, t2, -654
                  fle.s        a5, fa0, ft7
                  xori         s9, s3, 793
                  or           t3, s7, zero
                  fcvt.s.wu    ft11, s9, rmm
                  slt          ra, a3, a1
                  feq.s        s0, ft8, fs2
                  div          s3, s7, s6
                  andi         a2, ra, 755
                  fmin.s       fs5, fs1, ft1
                  srl          a1, s3, s9
                  slt          s0, s3, a1
                  fmax.s       ft4, ft3, fs1
                  fle.s        s11, fs6, fs4
                  srl          a2, a0, a1
                  sltiu        tp, s0, -1079
                  mulhsu       t6, s9, gp
                  srai         t4, sp, 25
                  sra          s1, t4, a3
                  sll          s6, t6, s6
                  fmul.s       fa4, fa2, ft11, rtz
                  mul          zero, t0, s8
                  fcvt.s.w     fs6, sp
                  andi         a5, t0, -799
                  rem          a6, t2, t0
                  fsgnj.s      ft10, fs6, fs2
                  sra          s0, s7, a1
                  lui          a2, 647079
                  sltu         t2, zero, s2
                  fdiv.s       ft9, fs4, fs3
                  auipc        a6, 617897
                  sll          t2, s3, t1
                  fcvt.s.wu    fa5, a1, rtz
                  xori         t1, s1, 1770
                  remu         s0, s8, a4
                  and          a5, a7, s8
                  fsgnjx.s     fs3, ft7, fa0
                  mulhsu       s3, s2, t1
                  lui          s4, 774412
                  fsub.s       fa0, ft10, ft11, rmm
                  mulhu        s1, sp, t0
                  lui          s10, 486160
                  slti         s6, s0, 1009
                  mulh         t2, t2, t4
                  fmul.s       fs0, fs0, ft1
                  fclass.s     s11, ft11
                  sltiu        s8, s10, 1752
                  fcvt.s.w     fs2, zero
                  fclass.s     s6, fs5
                  fmv.w.x      fa3, a3
                  srai         sp, s2, 14
                  fmax.s       fs9, fs10, fa5
                  srli         s0, a0, 21
                  addi         a7, s6, -603
                  fclass.s     a5, fa4
                  andi         a5, a1, -900
                  lui          zero, 911992
                  xori         t2, s1, -1747
                  fle.s        t2, fa7, ft6
                  fcvt.w.s     a6, fs9, rmm
                  fdiv.s       ft3, ft5, fs3, rtz
                  andi         a7, t0, 1618
                  srl          a3, a2, sp
                  remu         s11, s3, s11
                  or           sp, zero, s10
                  srli         s6, s7, 25
                  fmv.x.w      a7, fs8
                  fadd.s       fs0, fa5, fa7
                  sll          s2, s5, s4
                  srli         s11, a5, 19
                  feq.s        t2, ft0, fs1
                  fsgnjn.s     fs11, fa7, fa7
                  fmv.x.w      a0, fa0
                  fcvt.wu.s    s10, fa1
                  fcvt.wu.s    s4, fs3, rne
                  or           t1, a1, zero
                  div          s0, t5, ra
                  lui          s3, 182052
                  addi         zero, s6, 1369
                  ori          a4, tp, -1081
                  fcvt.w.s     a5, fs0, rup
                  slt          s11, s0, a1
                  fle.s        s9, ft7, ft9
                  fcvt.s.wu    fa4, a4
                  feq.s        s11, fs3, ft8
                  fsgnjn.s     fs2, ft3, ft4
                  fsqrt.s      fa0, fs2, rmm
                  fsqrt.s      ft7, ft5, rmm
                  mulh         gp, a1, zero
                  add          s1, a5, s10
                  or           a0, tp, s6
                  andi         s11, a6, 195
                  fsgnjn.s     ft9, fa5, ft0
                  fcvt.wu.s    s1, fs6
                  flt.s        s5, fs9, fa1
                  sra          s6, s3, t3
                  nop
                  slti         s1, a0, -1668
                  xori         s9, s10, -172
                  sll          s4, a1, s10
                  remu         a7, s3, a6
                  sll          s6, s2, s0
                  div          s6, a7, t3
                  fmv.x.w      s1, fa3
                  slt          s3, s0, s11
                  or           a0, s6, a6
                  xori         a5, a7, 1801
                  sll          zero, t3, a4
                  fcvt.s.w     fa5, s0
                  fadd.s       fs2, fs5, fs7
                  add          ra, s5, tp
                  fmin.s       fs11, fa3, fa5
                  fmin.s       fs2, fs2, fs1
                  xor          s9, a4, a4
                  mulhsu       t6, s5, a1
                  xori         s8, a0, 984
                  srai         t2, a5, 29
                  fsgnjn.s     fs4, ft0, ft8
                  fsub.s       ft0, fs9, fs10
                  fsqrt.s      fs0, ft4, rmm
                  fsgnj.s      fs10, fa2, fs8
                  xori         tp, gp, 683
                  auipc        s9, 93568
                  fmax.s       fs2, fs8, fa1
                  srli         ra, a6, 16
                  fdiv.s       fs4, ft7, fs6
                  fsgnjn.s     ft10, ft11, ft7
                  fmul.s       ft3, fa1, fs2, rmm
                  fsub.s       fs11, ft2, fa7, rne
                  remu         zero, s1, a2
                  sltiu        a6, zero, 1060
                  mul          s11, s0, a7
                  lui          zero, 728652
                  mulh         t1, s4, t3
                  rem          a2, t5, s7
                  divu         tp, a0, a0
                  ori          t4, s1, -1401
                  fle.s        s5, fa5, ft3
                  andi         s0, a2, -2003
                  addi         s0, a1, 1939
                  srai         s8, a0, 30
                  fdiv.s       fs7, fa0, ft0
                  fsgnjn.s     fs11, fs0, fs11
                  remu         a2, s0, s4
                  lui          a0, 676673
                  div          s9, t2, t3
                  fsgnj.s      fs6, ft4, ft11
                  sub          s9, s10, s10
                  fcvt.s.w     fa3, s1
                  addi         a2, s3, -1971
                  fdiv.s       fs4, ft0, ft8
                  fclass.s     a0, fs11
                  fmin.s       fa2, fs9, ft8
                  fmul.s       ft1, fs7, ft6, rup
                  fdiv.s       fs11, ft11, fa7, rup
                  fsgnjx.s     fa2, fs2, ft3
                  fmax.s       fs5, ft10, fs4
                  fmin.s       fa4, ft7, fs4
                  fsgnjn.s     fs0, ft6, fs6
                  fcvt.w.s     s0, fs1
                  nop
                  mulhsu       a2, s8, s11
                  fsgnjn.s     fa1, ft10, fs7
                  fcvt.wu.s    s2, ft3
                  fcvt.s.w     fs8, t1, rne
                  sltu         a4, s5, a0
                  fadd.s       fa3, fs6, fa2, rmm
                  divu         s4, t4, tp
                  mulh         s8, a0, a7
                  feq.s        t2, fs3, fs9
                  fmul.s       fa1, ft9, ft4, rne
                  and          t1, s5, s2
                  remu         sp, t4, t2
                  rem          tp, s11, s8
                  andi         s6, t3, -1416
                  mulhsu       t1, s5, a1
                  fle.s        a7, fs9, ft3
                  ori          s2, zero, 792
                  fmv.x.w      s11, fa6
                  fcvt.s.wu    ft7, t1
                  srai         a2, a5, 9
                  feq.s        a2, fs6, fa4
                  fmv.x.w      s5, fa5
                  flt.s        a7, fs11, ft4
                  sra          a6, tp, a3
                  fcvt.s.w     ft8, t1, rmm
                  and          a6, sp, s9
                  or           s3, s8, s7
                  xori         s4, s9, 48
                  fcvt.s.wu    ft11, s0, rdn
                  sltu         s10, s8, s9
                  srli         a2, zero, 3
                  fle.s        s6, fs4, fs11
                  mul          gp, s11, zero
                  fmin.s       fs9, fs6, ft8
                  fsgnjx.s     fs10, ft1, ft9
                  and          s8, s1, s10
                  fclass.s     t2, ft1
                  fdiv.s       fa1, fa4, fs0
                  fcvt.s.w     ft11, s1, rtz
                  sra          s6, s6, tp
                  mul          s4, zero, s6
                  and          sp, a0, s9
                  divu         a6, a7, s5
                  sltu         t3, s6, s11
                  fadd.s       ft0, ft8, ft0, rtz
                  sll          tp, s7, t6
                  sll          s11, a2, zero
                  mul          s0, a7, s9
                  fsqrt.s      ft2, fs7, rmm
                  slti         zero, a0, -583
                  fcvt.w.s     t3, fs8, rtz
                  mulhsu       s9, s5, t1
                  fmv.w.x      fs6, t2
                  mulhsu       tp, s2, ra
                  slli         t3, t0, 24
                  sltu         a7, a7, a1
                  addi         zero, s9, 1737
                  srai         s3, t3, 19
                  rem          s3, a2, s0
                  sll          sp, a3, gp
                  mulhu        a7, gp, t0
                  fcvt.wu.s    s10, fs7
                  and          s9, gp, a3
                  fdiv.s       fs7, ft3, fs4, rne
                  andi         a3, t1, -1671
                  sub          s3, ra, t5
                  div          s8, a1, a0
                  fsgnj.s      fs3, fs11, ft7
                  fadd.s       fs7, fa2, fs11
                  slt          a6, t2, s11
                  fsgnjn.s     fs1, fa7, fs1
                  slti         s3, s0, -649
                  fsgnjn.s     fa0, ft0, fa1
                  sra          a3, s11, sp
                  remu         tp, t6, gp
                  or           a2, s8, ra
                  fcvt.wu.s    s6, fs9, rup
                  fclass.s     s8, ft1
                  fmv.w.x      ft4, s3
                  sra          s0, a2, t4
                  feq.s        s10, fa5, fs8
                  fsqrt.s      fs10, fs5, rdn
                  fsgnjn.s     ft6, fa3, fa2
                  remu         s10, s11, s10
                  fmv.x.w      sp, ft3
                  andi         a7, s0, -618
                  fle.s        s6, fa2, ft4
                  fadd.s       fs10, fs1, fs2
                  fmin.s       fs7, fs10, fs3
                  fmin.s       ft8, fs10, fa2
                  slt          gp, s5, s5
                  fmax.s       fs10, fs6, fs8
                  feq.s        t3, fs0, fs3
                  divu         a2, a2, zero
                  mulhu        t3, a7, a5
                  feq.s        t4, fs8, fs7
                  mulhu        t3, t3, t4
                  srli         s5, zero, 5
                  slli         a0, s11, 16
                  addi         a6, s4, 75
                  mulhsu       a5, s0, t3
                  slt          s6, gp, a6
                  slli         s11, t6, 4
                  fsgnj.s      fs5, ft1, ft7
                  rem          a5, s7, s1
                  fsgnjx.s     ft2, ft6, ft4
                  add          t2, a4, zero
                  mulhsu       a5, zero, t5
                  fcvt.s.w     fa2, t6, rmm
                  mulhu        s6, s2, s0
                  fsgnjn.s     ft5, fa6, fs10
                  slli         t2, s2, 30
                  sra          gp, a7, t1
                  fsgnjx.s     ft10, fa1, ft9
                  sra          a6, s10, ra
                  fclass.s     s10, fs11
                  fmv.x.w      a2, ft11
                  add          zero, a3, a0
                  fadd.s       ft6, ft0, ft4
                  fmv.x.w      a4, fs11
                  auipc        t3, 93075
                  fle.s        a1, ft4, fa0
                  fsgnjx.s     fs2, ft7, fs7
                  sltiu        t3, s9, -1174
                  xori         zero, s7, -845
                  sra          a3, t2, t0
                  fsgnjx.s     fa3, ft2, fs8
                  mulhsu       t1, a7, gp
                  fmul.s       fs2, ft6, ft7
                  and          a2, s10, s10
                  srl          s2, s5, a7
                  fsgnjn.s     fs1, ft0, ft4
                  fcvt.w.s     gp, fa3, rne
                  sub          s9, s0, t6
                  fcvt.s.w     ft2, s9
                  mulhsu       t1, sp, s1
                  sltiu        s4, gp, -119
                  srli         s5, s2, 18
                  add          t6, a2, t1
                  sll          a7, s0, s5
                  slti         s8, tp, -971
                  mulh         t2, a7, t6
                  rem          s2, s6, s8
                  fle.s        s0, fs2, ft2
                  sll          s5, t5, ra
                  feq.s        a3, fa7, fs11
                  srl          a7, t4, t1
                  fdiv.s       ft5, ft8, ft2, rmm
                  sra          a5, sp, t4
                  fsub.s       ft3, fa3, fs5, rtz
                  flt.s        t3, fa7, ft1
                  fcvt.s.w     fa6, a1, rup
                  lui          s6, 91737
                  mulhu        a1, a7, t1
                  xor          s9, a5, s11
                  andi         s6, s6, -879
                  fsgnjx.s     fs3, fs5, fs2
                  mulhu        s6, s0, zero
                  sra          s8, s6, s8
                  sltiu        t2, t2, -528
                  fcvt.s.wu    fa6, tp, rup
                  slt          s0, s4, a3
                  fsgnjn.s     fa0, fs11, ft0
                  fsgnjn.s     fs11, fs6, ft10
                  div          t6, t5, s9
                  xor          a0, ra, s3
                  srl          ra, s0, t6
                  xor          tp, t1, a4
                  slt          s11, t3, ra
                  fsub.s       fs9, fs3, fa0, rne
                  mulhsu       sp, a6, a1
                  slti         s5, s0, -1981
                  fcvt.w.s     s4, fs0
                  fle.s        s4, fs8, fs0
                  srli         a3, s5, 5
                  mulh         s6, s11, s0
                  srai         t3, zero, 17
                  andi         a3, a3, -1880
                  fmin.s       fs2, fa7, fs6
                  fsgnjn.s     fs10, fa6, ft8
                  remu         s3, a0, ra
                  sltu         ra, ra, a2
                  fsub.s       fs3, fa3, fs5, rdn
                  slti         t6, zero, 1122
                  mulhsu       s9, s3, t4
                  xor          gp, t0, s1
                  xor          t3, t4, t5
                  divu         s1, t0, a2
                  fsgnj.s      fa7, ft10, fs4
                  fmv.w.x      fs7, s3
                  lui          a7, 637834
                  sltiu        t3, t3, -660
                  fmin.s       ft9, ft8, ft4
                  slli         a7, s2, 26
                  srli         t6, t1, 31
                  fmv.x.w      tp, fa1
                  fmax.s       fs11, fs3, fs9
                  mulh         tp, t1, a2
                  fcvt.s.wu    ft11, a4
                  flt.s        tp, ft3, fa1
                  slt          a0, s7, a2
                  feq.s        tp, fs6, fa6
                  sub          a5, s10, a5
                  and          a0, a5, t0
                  fsgnjn.s     fs6, ft9, ft4
                  rem          t3, s4, s6
                  slt          zero, s11, s0
                  fsub.s       ft0, fa0, fs0
                  fcvt.s.w     fs8, t2, rup
                  ori          s10, a2, -1552
                  fmv.x.w      t4, fs4
                  sub          a0, t2, t4
                  feq.s        t6, fs8, fs4
                  sra          a4, s6, s3
                  mulhu        s10, s1, s0
                  sltu         a4, a1, s2
                  sra          s11, t4, t2
                  fcvt.wu.s    s0, fs7, rdn
                  srai         gp, tp, 26
                  mul          a3, ra, a1
                  remu         zero, s3, s3
                  feq.s        s5, fa3, fs7
                  mulh         a3, s8, s7
                  sltiu        s11, gp, -525
                  fclass.s     a4, fs9
                  slli         s8, s0, 25
                  sltu         s2, a4, a2
                  and          ra, s9, s2
                  fclass.s     a0, fs10
                  fsgnj.s      fs2, fs8, fs5
                  fsgnj.s      fs7, ft6, fa1
                  addi         gp, s0, -1889
                  fle.s        s5, fs3, ft10
                  slli         a3, s11, 22
                  mul          a7, s2, a1
                  fclass.s     a4, fs1
                  fclass.s     tp, fa7
                  or           s9, a3, t3
                  sll          a0, gp, t6
                  ori          tp, t0, -431
                  fsgnjn.s     fa6, fs3, fs3
                  fclass.s     zero, fs0
                  srl          a0, a6, t0
                  fcvt.w.s     s8, ft6
                  fsgnj.s      fs5, fa1, fs0
                  addi         s11, s6, -552
                  mul          zero, a7, a3
                  nop
                  feq.s        a5, fs0, fs8
                  fdiv.s       fs2, fa1, ft10, rtz
                  srli         ra, s4, 4
                  slti         ra, t6, 979
                  fdiv.s       fs5, fs10, ft0
                  fdiv.s       fa3, fa3, fa2, rne
                  fcvt.s.wu    ft8, s0, rtz
                  andi         gp, a1, -1718
                  fmul.s       fa6, fs7, fa1, rne
                  fadd.s       ft2, fs4, ft3
                  and          ra, s0, s1
                  fmv.w.x      ft7, a5
                  fcvt.w.s     a4, ft4, rdn
                  fsgnjn.s     fa0, fa0, fs5
                  ori          a7, s10, -263
                  fsgnjn.s     fa5, ft3, fa4
                  sra          a4, a1, t3
                  xori         t6, gp, 1053
                  slli         s10, a6, 31
                  fmin.s       fa3, ft0, ft2
                  mulh         a6, t5, t5
                  fcvt.w.s     a2, ft7, rmm
                  sub          a4, s6, a2
                  slti         t6, a7, 1192
                  fsgnjx.s     fs5, fs2, fs7
                  fcvt.s.wu    ft8, t4, rne
                  fsqrt.s      ft1, ft11
                  and          a5, a4, tp
                  xori         s4, ra, -540
                  srl          t3, s6, s8
                  fadd.s       fa5, ft3, fa2, rdn
                  remu         s10, a0, zero
                  xori         a4, t0, 104
                  nop
                  sll          s5, a2, t3
                  fcvt.s.wu    ft9, s4, rtz
                  fsgnjx.s     fs7, ft1, fs11
                  fclass.s     a0, ft5
                  mulhu        t1, t0, s7
                  add          s4, a6, a3
                  andi         t4, a2, -174
                  div          s4, a3, ra
                  mulh         s4, a4, s11
                  div          s9, s4, a7
                  sll          s9, sp, t1
                  and          s4, t3, s11
                  fsgnjx.s     fa0, fs9, fa7
                  flt.s        s8, fs4, ft9
                  mulh         ra, s0, tp
                  flt.s        s1, fs5, ft9
                  sub          s2, a6, a6
                  flt.s        a4, fs10, fs0
                  mulhsu       s2, t5, s10
                  mulhsu       a7, a1, a0
                  div          a2, a3, s2
                  xor          a6, s2, s4
                  div          s2, a4, a4
                  or           ra, sp, tp
                  fmv.w.x      ft10, s6
                  fsgnjx.s     ft2, ft1, fa1
                  fsgnjn.s     fa7, fa1, fs0
                  and          t4, zero, s4
                  fsgnj.s      fs1, ft4, fa3
                  divu         s2, a2, sp
                  fmax.s       fa6, fs11, ft0
                  auipc        s3, 474748
                  xori         gp, t6, 626
                  or           gp, s1, t1
                  mulhu        sp, t3, s9
                  fcvt.wu.s    a0, fs6, rup
                  mulhu        zero, a5, a1
                  mul          s5, t5, s6
                  sra          s6, a5, s7
                  xori         a4, s11, 948
                  mulhu        s3, t6, a7
                  mulh         s6, zero, s8
                  fsgnjn.s     fs8, fs3, fs5
                  fmin.s       fa0, fs9, fs5
                  srai         s9, a0, 31
                  fadd.s       ft8, fa5, ft7
                  auipc        a7, 719903
                  auipc        a6, 1022477
                  or           gp, s2, gp
                  fclass.s     a0, ft1
                  xor          gp, t2, ra
                  rem          t1, t6, s7
                  fcvt.wu.s    a2, ft7
                  sub          a0, s4, s8
                  slli         s9, s9, 21
                  fmax.s       fa0, fa0, fa4
                  fle.s        t4, fs9, fs5
                  fsgnj.s      ft4, fs9, ft8
                  mulhsu       t2, ra, t2
                  add          t1, s2, s3
                  fsub.s       fa5, fs8, ft1
                  mulhsu       ra, zero, s4
                  andi         a4, s4, -1474
                  fdiv.s       fa5, fs11, ft1, rdn
                  addi         a3, s8, 31
                  fsgnjn.s     fs2, fs7, fs4
                  slti         a5, s0, 1937
                  srli         s6, s9, 4
                  lui          s11, 565509
                  add          t1, t6, gp
                  fsgnjx.s     fa4, fa4, fs11
                  fmax.s       fs8, ft7, fs10
                  fsgnjn.s     fs0, fa4, fa0
                  sra          a6, s4, zero
                  fmv.w.x      fs1, a3
                  div          t4, s3, t5
                  fmv.w.x      ft5, t3
                  fclass.s     s9, ft2
                  fmv.x.w      a3, fs0
                  srl          a0, a5, s4
                  sltu         a4, s9, s1
                  fmv.w.x      ft2, t1
                  sltiu        sp, s11, 1827
                  xori         s8, s7, 896
                  fdiv.s       fs8, ft2, fs8, rmm
                  divu         s8, a6, a4
                  fsgnjx.s     fs6, fs11, fs6
                  xor          t2, s11, s8
                  sltiu        t4, s4, -1378
                  mul          s3, a1, s5
                  fclass.s     a1, fs3
                  ori          a5, s1, 157
                  fcvt.w.s     t4, fs4
                  slti         a2, zero, -548
                  mulhu        t1, zero, t0
                  fcvt.wu.s    s5, fs7
                  andi         t2, t5, -283
                  fcvt.s.w     fs8, t2, rtz
                  fadd.s       fa1, fs11, ft7, rdn
                  div          a2, sp, s3
                  or           s6, t2, s1
                  fadd.s       ft8, ft6, fs11
                  remu         s8, a6, a6
                  fclass.s     t6, fa3
                  fcvt.wu.s    zero, ft0
                  srli         t2, s2, 17
                  fcvt.s.w     fa0, s9
                  divu         t3, t4, a5
                  rem          a0, a2, t3
                  fmax.s       fs5, fs0, ft5
                  fmv.w.x      fa4, s1
                  fmax.s       fs9, ft8, ft6
                  fcvt.s.wu    fa7, s9
                  fmv.w.x      fs10, t0
                  divu         a3, t1, s7
                  mulhu        tp, s5, zero
                  sltu         s0, s7, gp
                  slt          sp, a6, s6
                  remu         sp, s10, t2
                  flt.s        t4, fa4, fa1
                  slli         sp, t6, 30
                  fmul.s       ft11, fs5, ft10
                  xori         a0, t2, -1089
                  fsub.s       fs3, ft9, fs5
                  fsub.s       fs6, ft6, fa4
                  fmv.x.w      a7, fs1
                  feq.s        s10, ft11, fs8
                  lui          t4, 338287
                  lui          s1, 50117
                  fcvt.w.s     zero, fa0, rtz
                  slti         t4, t1, 1423
                  add          a5, s10, s10
                  fsgnjx.s     ft0, ft7, fa7
                  div          a5, sp, s11
                  fcvt.s.wu    fa1, s10
                  fmax.s       fs6, ft10, fa6
                  mul          a0, a2, s9
                  fsqrt.s      ft7, fs1, rne
                  mulhu        a2, s5, s11
                  andi         s5, a7, -738
                  xor          s4, s10, a6
                  srli         a3, t4, 21
                  and          s3, zero, s9
                  fcvt.s.wu    fa1, a6
                  sub          s0, s10, a6
                  fmax.s       fa3, fs3, fs5
                  fcvt.s.wu    fa5, a2
                  fcvt.s.w     fa5, a0, rne
                  fmv.x.w      t2, ft5
                  fle.s        s11, fa0, fa3
                  fcvt.w.s     t2, fa5
                  fmul.s       fs11, ft9, fs8, rup
                  feq.s        t6, ft5, ft7
                  div          s5, t2, zero
                  sub          t2, a4, s5
                  mulhsu       a3, a2, s10
                  fle.s        tp, fs2, fa3
                  auipc        a2, 585232
                  auipc        s8, 399199
                  or           a7, s8, s8
                  nop
                  fsgnjn.s     ft7, ft0, fs0
                  addi         a7, t0, 415
                  fcvt.w.s     a0, fs2, rup
                  fsgnjn.s     fa3, fs0, fs3
                  fsqrt.s      fs3, fs7
                  auipc        t6, 436999
                  srai         s3, a6, 20
                  fadd.s       fs3, ft5, ft3
                  fcvt.w.s     a0, fs6
                  lui          a0, 622697
                  fdiv.s       fa5, fs1, fa2, rne
                  fle.s        t2, fa5, fs9
                  lui          a3, 289000
                  srl          a4, t3, t4
                  xori         a1, a3, 553
                  or           a0, sp, t2
                  sub          t1, sp, a2
                  mulh         s8, a3, s11
                  mul          sp, a2, t3
                  sltu         a4, t0, a0
                  fsgnj.s      fa4, fs7, fa2
                  slti         t2, s5, -1331
                  srai         s0, t3, 25
                  fsgnj.s      ft5, fs11, fs5
                  fmv.w.x      fa5, a2
                  fmax.s       ft7, fs5, fs11
                  slt          s10, a5, s4
                  fsqrt.s      fs10, ft4
                  sra          s6, s6, t3
                  or           a7, t0, s10
                  add          s9, s0, a5
                  fsgnjx.s     fs2, fs7, ft6
                  fsgnjn.s     fa7, fs2, fa5
                  fmul.s       fa7, fs1, fa6, rdn
                  fdiv.s       fs2, ft10, fa0, rdn
                  remu         t6, a6, s1
                  flt.s        s11, fa1, fs9
                  mulhu        zero, s4, a7
                  fsub.s       ft3, ft2, fa3
                  mulhsu       s0, s8, s11
                  sltiu        a4, s4, -1290
                  mul          a3, a4, a2
                  xori         t1, t4, -227
                  feq.s        t1, ft5, fa1
                  mulhu        zero, s2, s9
                  fmv.x.w      s3, fs9
                  slt          a3, s2, t6
                  auipc        s10, 513297
                  fmv.x.w      s10, ft8
                  mulhsu       a0, s2, t6
                  xor          a5, gp, a4
                  or           s0, t6, a3
                  mulhsu       tp, a6, t4
                  divu         a2, s4, a6
                  sll          t2, t2, s10
                  sub          gp, s2, ra
                  nop
                  fmax.s       fa2, fs5, fa1
                  fle.s        s1, ft5, ft9
                  srai         s2, s2, 25
                  nop
                  andi         a4, s5, -188
                  fmv.w.x      ft8, sp
                  feq.s        s11, ft7, fs5
                  feq.s        s5, ft10, ft8
                  fdiv.s       ft9, ft7, ft2
                  divu         a4, a4, a3
                  mulhsu       zero, t1, sp
                  xor          a7, s0, a4
                  ori          s8, s4, 1798
                  fcvt.w.s     s8, ft3
                  lui          t6, 152919
                  fsqrt.s      fa4, ft9
                  fcvt.s.w     fs6, a2, rtz
                  fcvt.w.s     a1, fa4
                  addi         s1, s9, 332
                  srai         a3, a3, 26
                  div          a7, gp, a4
                  add          s3, s9, ra
                  nop
                  xor          a5, a7, zero
                  fsgnjx.s     fa3, ft3, fs9
                  mul          s3, zero, s6
                  mulhu        s5, sp, a2
                  fdiv.s       fs5, fs4, ft11, rne
                  or           t1, s10, s4
                  sub          a0, gp, zero
                  flt.s        t3, ft6, ft5
                  sra          a5, s8, a7
                  xor          s5, t5, tp
                  mulh         s10, s6, sp
                  fmul.s       fs2, ft6, fs3, rup
                  mulhsu       ra, s5, s10
                  fsub.s       fs3, fs11, ft3
                  fle.s        sp, fs7, fa1
                  fclass.s     s2, fs0
                  fcvt.s.wu    fs1, s0
                  rem          t6, s11, s9
                  srai         zero, t2, 8
                  xor          t3, a2, s0
                  sltiu        zero, a4, 874
                  xori         s0, s8, 391
                  sub          s10, t2, a0
                  add          t2, t4, a5
                  feq.s        t1, ft7, fs0
                  fmax.s       ft11, ft8, fs2
                  fmv.w.x      ft9, t5
                  fsgnjn.s     fa7, fs3, ft6
                  fclass.s     a7, fs10
                  fsgnj.s      fs5, fs4, fa2
                  sra          a1, zero, s8
                  flt.s        ra, ft6, ft0
                  sltiu        t2, s4, -312
                  fle.s        sp, fs3, fs10
                  fsgnj.s      ft11, fs3, ft1
                  divu         s1, s4, s9
                  sll          s0, gp, zero
                  srli         s2, t0, 6
                  sub          s9, ra, gp
                  sltu         sp, s11, s0
                  andi         s0, s7, 749
                  flt.s        s8, fs11, ft11
                  fsgnjx.s     fs9, fa6, ft11
                  or           s3, t6, s2
                  sra          tp, s3, tp
                  srli         s11, t1, 31
                  lui          s1, 704337
                  andi         a0, s11, -780
                  remu         s11, s4, a1
                  lui          s2, 204839
                  fsqrt.s      fa2, fa2, rtz
                  div          s0, a1, s10
                  sra          t2, t1, a1
                  auipc        s9, 983919
                  fmv.w.x      fa0, s7
                  fmin.s       ft8, ft7, fa4
                  addi         a0, t4, -1357
                  addi         s1, s9, 382
                  auipc        s3, 79557
                  sll          s10, a2, t6
                  fsgnjx.s     fs7, fa4, ft11
                  addi         a2, a0, -1487
                  mulh         s1, s7, ra
                  fdiv.s       fs2, fa3, fs2, rtz
                  slti         a5, t0, -1167
                  sub          tp, t2, s0
                  or           tp, a0, s11
                  and          zero, t2, t3
                  rem          s11, a7, a7
                  andi         s5, t6, -915
                  fmv.x.w      s1, fa7
                  fcvt.s.w     fa7, s8, rtz
                  slli         zero, a7, 22
                  fsqrt.s      fs5, ft1
                  add          a6, s3, s5
                  fmax.s       fs3, fs10, ft6
                  and          s6, s7, s1
                  srai         t3, s3, 31
                  flt.s        t2, fa5, fs8
                  auipc        a4, 3628
                  sub          s3, t0, t0
                  and          t2, a1, a6
                  mulh         s0, gp, a3
                  addi         s9, s0, 1724
                  xor          a0, a6, tp
                  fadd.s       ft1, fa5, ft0
                  slt          s2, a2, s6
                  srl          s3, t0, a6
                  fmax.s       fs1, fs5, fs10
                  fdiv.s       fs5, fs9, fs6
                  fcvt.s.wu    fs4, a7
                  remu         s3, a7, a4
                  fmul.s       ft10, fa4, fs11
                  sll          t4, a2, s8
                  fmv.x.w      sp, fs7
                  fclass.s     s3, fs7
                  mulhu        t3, t0, s5
                  fmin.s       fs4, fs10, fa1
                  slli         s3, a5, 18
                  fcvt.s.w     fs1, s8, rne
                  fsgnjn.s     fs1, fs8, fs5
                  nop
                  fle.s        s9, fs5, fa5
                  fcvt.wu.s    a0, fs5
                  slt          gp, t0, s5
                  feq.s        ra, fs2, fs1
                  lui          tp, 125658
                  sra          a1, s10, tp
                  fmin.s       ft11, fs7, fa1
                  sltu         t6, t4, a3
                  srai         zero, a2, 3
                  xor          a4, zero, gp
                  ori          a5, a7, -1411
                  fle.s        s9, fs2, fa3
                  mulhsu       s9, a1, a4
                  fsub.s       fs11, ft9, fs4
                  mul          s6, s7, s7
                  sltu         s4, s4, s7
                  lui          s5, 920663
                  fclass.s     a3, ft9
                  div          a4, s9, a1
                  remu         s1, a0, t0
                  div          t4, t1, s7
                  fdiv.s       fs10, ft8, fs6, rup
                  fsqrt.s      ft7, fs3
                  fsqrt.s      ft0, ft9, rdn
                  flt.s        tp, fs4, fa3
                  feq.s        zero, ft11, fa4
                  fsgnj.s      fs1, fa4, fs2
                  srli         a6, s6, 19
                  fcvt.s.wu    fs2, a5
                  divu         s1, s10, s4
                  andi         a6, t2, -609
                  or           s6, t1, s0
                  mulhu        s10, s4, s9
                  fcvt.s.w     fs4, zero, rup
                  fclass.s     s6, fs6
                  srli         gp, s9, 26
                  lui          t2, 805011
                  fcvt.w.s     gp, ft2, rtz
                  mulh         t1, a1, t6
                  fsqrt.s      ft6, ft3
                  add          a6, t2, t1
                  rem          t2, s0, s0
                  fsub.s       fs1, fs7, ft0, rdn
                  sll          a7, s6, t1
                  fsgnjn.s     ft10, fs2, fa1
                  flt.s        s10, ft7, ft7
                  feq.s        a0, ft10, fs4
                  mulhsu       a1, gp, s9
                  feq.s        a1, fa3, fa5
                  fmin.s       ft11, ft5, fs9
                  mul          a1, s8, a5
                  srl          s3, s10, tp
                  flt.s        s2, fa6, ft1
                  lui          a6, 1029324
                  mulh         gp, s3, s9
                  srai         s8, t4, 6
                  slti         s9, s1, 1573
                  sra          s2, ra, s11
                  fmv.x.w      a3, fs4
                  feq.s        a0, ft0, ft3
                  srli         s11, t2, 9
                  fle.s        sp, ft3, ft7
                  nop
                  slli         gp, t3, 20
                  mulhu        s4, a6, a3
                  sltu         a0, a3, s3
                  sltu         a7, ra, t4
                  xori         sp, a5, -1297
                  fsgnjx.s     ft11, ft10, fs9
                  sltu         t6, s10, gp
                  remu         sp, s11, t5
                  mulhsu       t1, a5, s5
                  flt.s        a6, fs11, fa6
                  nop
                  nop
                  fmv.x.w      a3, ft5
                  ori          s11, s11, 472
                  fcvt.wu.s    s1, ft11, rne
                  feq.s        a2, ft2, fa3
                  rem          a6, s6, s0
                  slli         s3, s2, 30
                  or           s6, a3, t3
                  srai         s9, t5, 11
                  fdiv.s       fa5, ft10, fa0, rup
                  sub          a6, a1, s6
                  divu         s6, s6, s11
                  nop
                  fmv.x.w      s11, ft7
                  fadd.s       ft2, fa2, fs4, rmm
                  andi         a2, t2, -1366
                  remu         a5, t5, t2
                  mulh         tp, t1, tp
                  and          a4, a3, s5
                  and          a7, s9, s11
                  fadd.s       fs9, fs5, ft1
                  slt          s9, s0, t0
                  xori         a3, t5, -657
                  xor          s2, a2, a0
                  mul          tp, a3, zero
                  fsgnjx.s     ft8, fa2, ft7
                  andi         a6, t5, 527
                  mulh         s5, s7, t1
                  fdiv.s       fs6, fs5, ft0, rmm
                  auipc        s10, 301577
                  sra          a5, a2, s6
                  fcvt.s.wu    ft1, zero, rdn
                  fmv.w.x      ft6, ra
                  fsgnjx.s     fs2, ft4, fa7
                  fsqrt.s      fs0, fs10
                  or           a1, s6, s11
                  ori          sp, gp, -1126
                  fsgnjn.s     ft11, fs8, ft10
                  xor          s9, a7, a0
                  remu         a4, t5, s6
                  slti         s6, t5, 1581
                  fsgnjn.s     fs4, fs6, ft1
                  fle.s        s1, fa4, fs5
                  srl          a4, s2, a3
                  fmul.s       fa6, fs0, fa6, rup
                  ori          t1, s5, 1281
                  auipc        a5, 805109
                  fsgnj.s      fs0, fs6, fa4
                  fmin.s       fa6, fa6, fs6
                  fmv.x.w      t3, ft9
                  fcvt.wu.s    t4, fs6, rdn
                  fcvt.s.wu    fs2, t4
                  fmul.s       fa0, fa6, fs1, rdn
                  fsub.s       ft8, fa0, ft8
                  xor          s2, s6, t0
                  auipc        t4, 593835
                  sll          s4, a0, a5
                  fmax.s       fs2, fa2, fs1
                  fclass.s     s9, ft3
                  addi         zero, sp, -1285
                  lui          s0, 703243
                  srli         t1, zero, 5
                  fmin.s       ft1, fs1, ft9
                  sub          t4, gp, a1
                  divu         a6, tp, t4
                  fmax.s       fa7, fs7, fs8
                  lui          s5, 91683
                  fadd.s       fa5, fs8, ft6
                  rem          s1, gp, a7
                  auipc        a5, 210729
                  lui          sp, 11098
                  feq.s        a2, fs10, fs4
                  sltiu        t6, t3, 343
                  fsgnj.s      fa4, fs1, fs7
                  srl          zero, a4, t2
                  fle.s        s0, fa1, fa1
                  mulh         a2, s11, s1
                  sltu         a6, a0, s0
                  fsgnjn.s     fa6, ft8, fs10
                  fsgnjx.s     fs5, fa2, fs5
                  sltiu        s10, s4, 1556
                  fmv.w.x      fs0, s0
                  slli         s10, s3, 31
                  fsgnjx.s     fs4, fa3, ft4
                  fsgnj.s      ft4, ft11, ft4
                  addi         a4, s3, -1478
                  sll          t4, t0, a3
                  sltu         s2, s0, s6
                  fmul.s       ft3, ft10, ft7
                  mulhu        a3, t0, a0
                  fcvt.s.w     fa7, t4, rup
                  fmul.s       fa7, ft0, ft0, rne
                  fclass.s     ra, fa2
                  fmv.w.x      fs0, t5
                  mulhsu       a4, s5, t4
                  rem          zero, a4, a5
                  fsgnjx.s     ft2, ft1, fs6
                  srli         s1, ra, 0
                  rem          t4, t0, s2
                  fsgnj.s      fa6, fs7, ft6
                  slt          t3, ra, s10
                  fmv.x.w      t6, ft6
                  fdiv.s       fs9, ft5, fs10, rup
                  srli         a3, a3, 1
                  or           t2, s7, s7
                  ori          s2, s7, -707
                  xori         a7, sp, -551
                  and          a1, a5, zero
                  srl          s0, s7, s1
                  fdiv.s       fa4, fs7, fs7, rne
                  slt          t3, a1, s11
                  xor          s9, a7, a1
                  fsub.s       fs7, ft11, fa7
                  fadd.s       ft6, fs11, fs10, rmm
                  fmul.s       ft1, fa1, fs2, rup
                  xori         s5, s9, 1888
                  divu         s0, a1, s11
                  fmv.w.x      fs2, a0
                  mulhu        t4, s11, t2
                  sltu         a1, t4, s3
                  slli         s6, a0, 19
                  divu         t2, s1, a1
                  sltiu        t2, t2, -1896
                  fsub.s       fs11, fs11, fs7
                  fmul.s       fa4, fs7, fa2
                  feq.s        t1, ft9, fs2
                  remu         t4, a4, a5
                  divu         s5, t3, t1
                  fsgnjn.s     fs10, fs9, fa3
                  flt.s        s8, ft8, fs8
                  rem          s2, t6, s1
                  sub          s8, s4, a0
                  fcvt.s.w     fs4, s9
                  flt.s        ra, fs4, fs5
                  lui          t1, 275211
                  fmul.s       fs4, ft10, fa7
                  andi         a0, t5, -632
                  remu         a1, s11, a3
                  fmin.s       fs5, ft7, fs3
                  fcvt.wu.s    s3, fa3, rne
                  sltiu        s6, t1, -348
                  rem          a6, gp, t0
                  fadd.s       fa1, fa2, fa7, rmm
                  auipc        s5, 724883
                  add          a4, s3, t5
                  sub          a7, s4, tp
                  auipc        a5, 969768
                  fcvt.s.w     fa5, s11, rup
                  sub          t4, ra, s7
                  fcvt.wu.s    t3, ft4
                  fsgnjx.s     fs7, ft1, fs4
                  mul          a7, gp, s0
                  fsqrt.s      fa0, fs10
                  auipc        t3, 1022434
                  xori         s0, s1, -1616
                  sra          s8, s3, tp
                  fcvt.s.w     fs0, a2, rdn
                  div          a1, s4, t5
                  fmax.s       fs2, fs0, ft0
                  xori         a4, zero, 1752
                  fdiv.s       ft2, fa6, fs10
                  fsub.s       fs8, fa4, ft0
                  slt          a7, s4, a5
                  srl          t6, s0, s3
                  feq.s        s0, fa0, fs2
                  fmul.s       fs8, fa7, fa4, rup
                  fcvt.s.w     ft9, s8
                  div          a0, a4, a3
                  addi         s9, a7, -1558
                  fcvt.s.w     ft5, s3, rdn
                  mulhsu       t1, a3, sp
                  sll          a0, s4, t3
                  xor          s8, s11, a3
                  fsgnj.s      fs1, fs9, ft9
                  fclass.s     s4, ft7
                  fmin.s       fs0, ft9, fs7
                  sll          s0, a4, t1
                  fsub.s       ft2, ft1, fs9
                  sltiu        t4, s1, 1895
                  auipc        a5, 976130
                  fmv.x.w      a0, ft2
                  nop
                  xor          t4, s10, a1
                  add          a5, s3, t4
                  fmul.s       fa2, fs5, fs9
                  nop
                  fsub.s       fs0, fs8, fa4
                  add          ra, zero, t5
                  sra          sp, s4, ra
                  divu         s9, s6, zero
                  lui          tp, 959596
                  slli         tp, a4, 22
                  fsub.s       fa7, fs7, ft10
                  fcvt.w.s     t4, ft11
                  fsqrt.s      fs9, ft6, rne
                  fclass.s     s5, ft9
                  srli         a2, t2, 10
                  fle.s        gp, fs7, fs2
                  divu         a5, s9, a0
                  fcvt.w.s     s2, ft3, rdn
                  fsgnj.s      fa1, ft7, fs0
                  fmin.s       fs3, fs10, fs0
                  auipc        zero, 823013
                  fsgnj.s      ft9, ft6, ft8
                  addi         a7, s3, -423
                  and          gp, a5, s1
                  fsgnjx.s     fs3, ft2, fs11
                  fsub.s       fs11, ft0, ft0
                  nop
                  mul          t2, gp, a5
                  xor          sp, t3, s1
                  fmv.x.w      t6, fa6
                  sltiu        t6, s4, -368
                  fclass.s     a3, fa2
                  fsgnj.s      ft0, ft8, fs6
                  fsqrt.s      fs3, ft7, rne
                  fdiv.s       fs2, ft11, fs9
                  remu         t3, a1, s9
                  mulhu        t3, tp, gp
                  mulhsu       a0, s6, s9
                  fcvt.w.s     t4, fa2, rtz
                  mulhu        sp, a6, s7
                  fdiv.s       fs8, ft9, fs6, rtz
                  xori         a3, t3, -1037
                  sub          a7, s1, s3
                  srai         a2, t3, 16
                  fsgnjx.s     fa1, ft8, ft8
                  sltu         s8, s2, a7
                  lui          s8, 223548
                  feq.s        t2, fs0, fs2
                  divu         s9, s1, s7
                  fsgnjn.s     fa4, ft7, fs2
                  nop
                  sll          s9, a6, a7
                  fcvt.s.wu    ft0, s8
                  srai         a4, s0, 22
                  sra          ra, s2, s10
                  fmul.s       fa7, ft7, ft9
                  add          a6, t6, s10
                  lui          s5, 777270
                  mulhu        s0, gp, t3
                  rem          t3, t0, ra
                  mulhsu       s0, sp, s10
                  andi         s5, s6, -435
                  divu         a3, s11, a4
                  srli         s2, s4, 2
                  fsub.s       fs4, ft6, fs4
                  mul          zero, zero, sp
                  andi         sp, a2, 1199
                  sra          a0, a2, a2
                  divu         s3, t1, s1
                  fsgnjx.s     ft8, fs4, fs11
                  nop
                  nop
                  slt          tp, a2, s2
                  xori         s10, t5, 81
                  fcvt.wu.s    s6, ft0
                  remu         a6, s11, s6
                  nop
                  add          t3, a6, t3
                  auipc        a6, 317145
                  addi         gp, tp, -1167
                  xori         t1, s7, 536
                  mulhsu       t1, t6, a5
                  addi         tp, s8, -1070
                  fsgnjn.s     fa6, fs4, fa1
                  lui          a1, 924219
                  fsgnjx.s     fs11, fs8, fs11
                  fdiv.s       ft7, ft9, fs11, rmm
                  srai         s4, s5, 29
                  sra          t1, a0, sp
                  mulhu        sp, a3, a1
                  fclass.s     a1, fs3
                  xori         a7, a4, -1513
                  sra          zero, sp, s6
                  or           s3, s11, a2
                  feq.s        a0, fs9, fa6
                  sub          sp, a7, t3
                  andi         a0, t5, 2000
                  fdiv.s       ft0, fs0, fs5
                  fsgnjx.s     fa1, fa4, ft9
                  fdiv.s       ft0, fs5, ft11, rup
                  fmv.w.x      ft1, gp
                  sra          gp, s4, ra
                  sltiu        s2, t6, -1454
                  fsub.s       fs9, ft2, ft4
                  srli         a4, s2, 20
                  nop
                  xor          a6, tp, a6
                  fle.s        t4, fs4, ft1
                  or           s11, t6, gp
                  srl          zero, a7, s5
                  srai         s1, a1, 2
                  mulhsu       ra, a4, a0
                  fsqrt.s      ft1, fa5
                  mulhu        s6, t3, t0
                  addi         s6, a2, 1539
                  mul          s6, a0, a1
                  fmv.x.w      a2, fs0
                  fadd.s       ft4, ft3, fs3
                  sra          s8, s4, a1
                  feq.s        t4, ft8, ft1
                  mulhu        s9, a3, t3
                  xor          a5, s3, a7
                  add          a7, s5, s10
                  fdiv.s       ft8, ft8, fs11
                  slt          s5, s11, t2
                  fsgnj.s      fa3, ft9, fa7
                  or           a4, ra, zero
                  fsgnjx.s     ft6, fs3, ft8
                  fclass.s     s2, fs4
                  remu         a6, s8, t1
                  fdiv.s       fs7, fs8, fs11
                  auipc        s8, 659243
                  fle.s        s5, fa4, fa4
                  fclass.s     ra, fs10
                  xor          ra, t0, t3
                  slli         a2, ra, 23
                  fcvt.wu.s    a1, ft1
                  flt.s        ra, fs2, ft8
                  or           s9, a7, s5
                  fsqrt.s      fs8, ft6
                  slt          s2, a6, a6
                  add          s11, s1, s4
                  sltu         a5, s10, a4
                  auipc        t1, 213873
                  fclass.s     zero, fa5
                  and          a3, s6, t2
                  fcvt.wu.s    s9, fs11
                  fadd.s       fs7, fa2, fs1, rtz
                  mul          a7, s11, s8
                  fcvt.s.w     fs4, s10
                  fsgnjn.s     fs2, ft7, fa0
                  sll          t2, t3, s8
                  flt.s        s6, fa4, fa2
                  fmv.w.x      ft10, sp
                  fdiv.s       fs1, fa1, fs4, rmm
                  and          a4, s9, s2
                  fclass.s     sp, fs5
                  and          s9, s10, zero
                  divu         s11, a3, s6
                  fadd.s       fs9, ft5, ft1, rmm
                  fsgnj.s      ft7, fs0, fa3
                  fcvt.s.wu    fs10, s2
                  fmv.w.x      fs9, t0
                  rem          s8, s9, t2
                  mulhsu       tp, a0, t2
                  fmin.s       ft3, fa3, ft3
                  fsgnj.s      fa7, fa1, ft7
                  addi         s11, s1, -1816
                  addi         gp, tp, -1156
                  fmin.s       ft1, fa1, ft2
                  fdiv.s       fs4, ft6, fa6
                  fcvt.wu.s    s8, ft1
                  fsgnjx.s     fs11, fs6, fa1
                  mulh         a4, t2, a2
                  fmul.s       fa2, fs9, fa2
                  divu         s3, s4, s4
                  or           s5, sp, t6
                  divu         zero, s6, s9
                  srl          t2, s1, t0
                  fmv.x.w      tp, ft3
                  ori          s4, s1, 1702
                  fsgnjn.s     ft5, fa7, ft7
                  auipc        t3, 451919
                  slti         a6, t1, -726
                  fcvt.s.w     ft4, t0
                  srai         s2, s4, 25
                  srl          a4, a0, a6
                  srl          t2, s3, a3
                  fsgnjn.s     fs0, fa3, ft9
                  divu         tp, t3, a3
                  fsgnjx.s     fa7, fs9, fs0
                  fclass.s     s5, fa6
                  mulhu        s8, a2, sp
                  slli         t3, tp, 2
                  fcvt.s.w     fa6, a3
                  div          gp, s9, t1
                  fcvt.s.w     fs2, t0, rdn
                  lui          s10, 263839
                  fadd.s       fs5, fa2, ft6, rtz
                  slti         sp, zero, -1544
                  fadd.s       fs2, fs6, fs0
                  and          s1, s2, ra
                  srli         s8, t3, 0
                  auipc        t6, 1015067
                  remu         tp, gp, s11
                  srli         s0, s3, 27
                  nop
                  fcvt.w.s     s10, fs2, rdn
                  sltiu        s11, s11, -1323
                  slt          a6, t0, s5
                  add          a6, s4, a4
                  fcvt.wu.s    sp, fs6
                  mulhsu       a4, s0, a4
                  sltiu        zero, s3, -270
                  mul          s5, t3, s9
                  div          a2, a6, a7
                  sra          s0, a1, a1
                  slli         s5, s11, 2
                  fsgnj.s      fs4, ft0, ft11
                  auipc        a3, 91903
                  flt.s        s11, fs5, ft6
                  fsgnj.s      ft5, ft6, fs7
                  srl          a2, s10, t4
                  xor          s11, s8, s8
                  fcvt.s.w     ft10, s0
                  fmin.s       ft4, ft0, ft3
                  or           s4, a4, s5
                  slli         a1, a3, 21
                  ori          s5, sp, -1802
                  fsgnjx.s     fs6, fa1, fs3
                  fmin.s       fa6, fs5, fa3
                  sltiu        a0, a1, -2008
                  flt.s        s10, fa3, fa4
                  mulhu        tp, t2, s11
                  fcvt.wu.s    s0, ft4
                  fmul.s       ft10, ft2, ft5, rtz
                  div          s11, a2, s5
                  nop
                  fmul.s       fs3, fs5, fs5, rne
                  srai         s4, s11, 26
                  slli         a4, t1, 28
                  rem          gp, tp, ra
                  div          a5, t3, t6
                  nop
                  fcvt.wu.s    t1, ft4
                  fcvt.wu.s    t3, fa7
                  fsgnjn.s     fs8, fa3, ft3
                  or           gp, t2, t5
                  divu         a2, s1, s11
                  nop
                  mulh         a1, t1, s1
                  div          s5, s9, t4
                  flt.s        a7, ft6, fa3
                  mulhsu       s10, a4, s11
                  div          s4, s4, t5
                  nop
                  fmin.s       ft7, fa5, ft6
                  addi         a1, tp, -537
                  fmin.s       ft6, ft7, ft3
                  slt          a7, s9, a1
                  fmv.x.w      s5, fs7
                  xor          a2, t0, s6
                  fsgnjx.s     fa5, fa1, fa0
                  fcvt.s.wu    ft11, a6
                  srai         s10, s10, 9
                  fdiv.s       ft4, fs9, fa4, rtz
                  sub          s10, t6, tp
                  flt.s        a5, ft1, ft11
                  or           s8, s3, s7
                  divu         a3, t2, s3
                  slli         t6, s10, 2
                  srli         t4, a3, 11
                  fadd.s       fa0, fs11, fa2
                  fcvt.s.wu    ft4, s4, rmm
                  fmv.x.w      t6, fs4
                  fmul.s       fa1, fs3, ft1, rmm
                  rem          a5, ra, a1
                  sll          t2, gp, s0
                  xor          a0, s8, s8
                  srl          s1, t4, s10
                  fmv.w.x      fs4, s2
                  fcvt.s.wu    ft8, t0
                  fcvt.wu.s    t4, fa3, rdn
                  fcvt.s.w     fa0, tp
                  fsgnjn.s     ft5, fs7, ft1
                  fsgnjn.s     fs6, ft0, ft11
                  lui          s1, 234605
                  slti         s4, s11, 1125
                  xori         a2, t1, 988
                  fmax.s       ft2, fa0, fs4
                  sra          a2, s10, a1
                  flt.s        s3, fa0, fa0
                  fdiv.s       ft5, ft5, fs2
                  sltiu        gp, s7, 1552
                  fmin.s       fs9, fa6, ft3
                  srl          t1, t4, ra
                  nop
                  rem          gp, t0, s7
                  nop
                  feq.s        a7, fa1, ft6
                  addi         a0, s8, -1677
                  slli         s8, t3, 18
                  fmv.x.w      s8, fs0
                  fsub.s       ft4, ft8, fs8
                  sll          s3, t6, s0
                  remu         a5, t5, a4
                  fadd.s       fa1, fs1, fs10
                  fcvt.wu.s    gp, fs8
                  fcvt.wu.s    s1, fa2, rne
                  fsqrt.s      fs7, fs5
                  or           s9, a7, a5
                  sltiu        a4, a2, -561
                  add          s3, t6, t5
                  xor          s5, a1, a0
                  fcvt.s.wu    fs1, s5
                  srl          t3, t3, s2
                  fsgnjn.s     fa3, fs11, fa5
                  fclass.s     ra, ft8
                  fmv.x.w      s1, fa0
                  fmv.x.w      s8, fs10
                  fclass.s     t1, fs7
                  mulhu        t1, s7, t1
                  rem          a7, t1, t6
                  fcvt.s.w     fa1, s5
                  fcvt.s.w     ft8, gp, rtz
                  slti         s4, s10, -1968
                  andi         t6, s6, -329
                  fsub.s       fa3, fa4, fa2, rdn
                  sltiu        s2, t0, 947
                  div          a4, tp, t2
                  fsgnj.s      ft7, ft4, ft9
                  fcvt.wu.s    s5, fa2
                  div          a3, s11, s7
                  sub          t3, gp, sp
                  fsgnjn.s     fa4, fs9, fs1
                  rem          t3, a0, sp
                  sub          a2, s3, t2
                  sra          s9, t0, t4
                  sll          t6, s8, t6
                  rem          a3, s11, s1
                  div          a2, sp, t1
                  div          zero, t0, t1
                  flt.s        s6, ft2, fs3
                  fcvt.s.w     fs2, t3
                  fmul.s       fs8, ft9, fs5
                  sub          a6, a1, a1
                  mul          t6, t1, a0
                  fmv.x.w      zero, fa6
                  andi         a0, zero, 51
                  flt.s        a0, fs7, ft6
                  fclass.s     s9, fa3
                  fcvt.w.s     zero, fs9, rne
                  fsub.s       fa5, fa0, fs1
                  addi         a2, s9, 196
                  sll          a1, s3, a3
                  mulhsu       s8, s11, a3
                  srl          t6, a4, a0
                  fsqrt.s      fa2, fs4, rtz
                  fclass.s     s5, fa1
                  fsgnjn.s     fs8, fs7, fa0
                  sll          s6, s10, a5
                  fmv.x.w      s2, ft10
                  srli         s3, s11, 15
                  remu         s10, s6, s4
                  and          s10, s9, s2
                  mul          s3, t1, a2
                  fcvt.s.w     ft10, ra
                  fmul.s       fs6, ft7, ft6
                  fle.s        t4, fs2, fa0
                  sll          s3, s8, s11
                  slt          a5, gp, a3
                  fmax.s       ft11, fs1, fs8
                  sll          a6, s8, s0
                  fadd.s       fs2, fs2, ft0, rup
                  xori         a7, s11, -454
                  xor          a3, s4, t6
                  xor          a0, t6, s7
                  feq.s        s11, fs11, fa2
                  rem          gp, s5, zero
                  sltu         a4, a3, s1
                  addi         ra, sp, -1603
                  fdiv.s       fa0, fs6, fa6, rdn
                  srai         a7, t1, 2
                  or           s5, s3, t0
                  fsgnj.s      ft4, fa2, ft0
                  feq.s        tp, fs9, ft6
                  fsgnj.s      ft8, fs2, ft10
                  sltiu        s3, a3, -1273
                  fsgnjn.s     ft11, ft10, fs10
                  fclass.s     s5, ft0
                  auipc        s8, 750469
                  slt          t3, s11, t1
                  fmin.s       ft0, ft1, fs4
                  fsgnjn.s     ft3, fs7, fs5
                  fmin.s       ft0, fs1, fs6
                  auipc        a5, 606183
                  sub          gp, s4, s1
                  mul          s6, s11, t1
                  fclass.s     a7, fs3
                  slt          a4, s3, a5
                  auipc        s1, 273503
                  fcvt.wu.s    s1, fs5, rmm
                  fle.s        tp, ft9, fs2
                  srl          t2, a6, t6
                  sltu         a2, a2, s6
                  fmv.x.w      s8, ft8
                  fcvt.w.s     s1, ft0
                  fsqrt.s      fs1, ft6, rup
                  sra          s4, gp, s2
                  rem          a6, a6, a4
                  fsgnj.s      ft5, fa6, fs7
                  fmv.w.x      fs1, t0
                  slli         s3, s9, 12
                  auipc        s0, 907214
                  auipc        a4, 980319
                  fcvt.wu.s    a6, fs0, rdn
                  flt.s        s6, ft6, fs4
                  fdiv.s       fa0, ft4, ft11
                  fclass.s     s1, ft3
                  srl          a7, t1, a3
                  add          t2, t2, t6
                  slli         a3, s1, 16
                  sll          ra, sp, s8
                  fcvt.wu.s    s3, fs5, rup
                  divu         s8, t6, s3
                  fsgnjn.s     fs2, fs5, fs9
                  slt          a2, s4, ra
                  fmin.s       fs1, ft7, ft7
                  sra          s6, tp, s11
                  fmv.x.w      a3, ft8
                  mulhu        a4, ra, s8
                  addi         s11, a1, -977
                  xor          a3, tp, t5
                  mulh         s3, s9, t4
                  sltiu        zero, ra, -1409
                  ori          gp, gp, -1846
                  srli         gp, s0, 29
                  slt          s6, gp, t6
                  slti         s11, s4, -1490
                  andi         tp, gp, -1862
                  fle.s        s5, fa0, ft3
                  fmv.w.x      fs7, tp
                  div          a0, s11, s3
                  fle.s        a6, fs8, fs2
                  mulhu        a5, t3, t6
                  fsgnjn.s     ft0, ft3, ft0
                  fcvt.s.w     fs6, s10
                  fmin.s       fa2, fs8, ft8
                  fadd.s       fa7, ft2, fs6
                  srai         s11, sp, 6
                  addi         t1, t4, 181
                  sll          s4, tp, a7
                  srai         sp, s7, 31
                  flt.s        ra, ft1, fa7
                  fcvt.w.s     a6, ft4
                  fsgnj.s      fa5, ft4, ft9
                  remu         a6, sp, s2
                  fmv.x.w      s0, ft10
                  and          s10, a7, s9
                  mulhsu       s6, a2, t2
                  fsgnjn.s     fs10, ft7, fa3
                  fsgnj.s      ft7, fs4, fs8
                  feq.s        s1, ft9, fs0
                  slli         s3, s8, 10
                  xori         s1, a4, 1894
                  divu         s0, t6, a4
                  sltu         sp, s7, s4
                  sltiu        s9, s5, 1333
                  divu         s5, s7, gp
                  srai         sp, s7, 10
                  fle.s        a4, ft3, fs6
                  fmv.w.x      ft8, s5
                  fcvt.wu.s    gp, fs1
                  fmv.x.w      s1, fs8
                  fdiv.s       ft6, fs4, ft9
                  fcvt.w.s     sp, fs2, rup
                  feq.s        a7, fs5, ft0
                  srli         a6, a1, 3
                  nop
                  or           s11, zero, t6
                  slli         a5, t2, 13
                  srl          a2, s8, s2
                  div          s4, t4, a7
                  fmv.w.x      fs0, ra
                  sub          zero, gp, a5
                  slt          a4, tp, s3
                  fdiv.s       fs11, fa4, fa3, rmm
                  fcvt.w.s     s1, fs7
                  fle.s        s4, fs1, fa4
                  remu         a5, a2, s10
                  fadd.s       fa3, fs9, fa2
                  or           s4, a1, t1
                  xori         a3, s1, -101
                  auipc        s0, 389188
                  fle.s        t1, fs2, fs6
                  fsgnjx.s     fs1, fs7, ft0
                  sltu         s9, a2, s3
                  sltiu        gp, s9, 1678
                  auipc        s2, 642348
                  feq.s        t2, ft8, fs11
                  fadd.s       fs7, fs10, fa2
                  and          a1, s6, a6
                  sub          a5, a2, sp
                  mulhu        a3, a5, s5
                  xori         s3, a0, -634
                  fsgnj.s      ft3, fs10, ft8
                  mulh         t6, s1, s1
                  xori         a1, s9, -1939
                  or           s5, a5, t0
                  fsub.s       fa3, fs5, fa6
                  addi         t1, s0, 613
                  fmax.s       ft1, fs6, fs6
                  remu         sp, s8, s2
                  fcvt.w.s     a6, fs9
                  srl          ra, s7, a1
                  sub          tp, a5, t3
                  slt          a4, tp, t3
                  mulhu        s5, a5, a1
                  addi         s0, zero, -12
                  or           s0, gp, gp
                  mulhsu       t3, s5, t2
                  fadd.s       ft4, ft6, fs9, rup
                  divu         t6, t1, s11
                  auipc        t3, 498216
                  xor          s6, s4, a2
                  fmin.s       fs9, fs7, fs3
                  mulhsu       t4, t5, t1
                  andi         t3, t0, -93
                  sltu         a5, s2, tp
                  fmv.x.w      zero, ft4
                  or           t1, t1, s11
                  srai         t2, t2, 17
                  fcvt.wu.s    s0, ft4
                  div          s2, a3, t6
                  div          a4, t1, t3
                  slli         t4, gp, 3
                  fsgnjn.s     fs8, fa2, ft4
                  and          t6, a5, s10
                  srai         t2, tp, 26
                  fmv.w.x      fs7, sp
                  fsub.s       fs2, fa6, fs10, rmm
                  slt          s11, s4, a4
                  divu         a6, a4, gp
                  fmax.s       ft6, fa2, fa0
                  sltu         a1, a7, t3
                  sltu         t6, a4, s1
                  fsqrt.s      fs3, fs4, rup
                  slti         t3, ra, 101
                  fsgnjn.s     ft2, ft8, ft10
                  fdiv.s       fa3, fs5, fs2, rdn
                  andi         s4, s5, 1517
                  fmax.s       ft4, ft4, fa1
                  add          a1, a0, s2
                  srai         t3, s7, 21
                  and          t6, t6, ra
                  add          tp, a7, t5
                  lui          s0, 537017
                  slli         s0, a3, 29
                  ori          s2, s8, 386
                  add          s5, t5, s2
                  auipc        s6, 214588
                  fmv.x.w      zero, ft2
                  divu         s0, t2, s0
                  mulh         s8, a0, s10
                  sltiu        s2, s0, 414
                  flt.s        a1, fs3, ft11
                  fcvt.s.wu    fa3, a6
                  lui          a5, 779601
                  fcvt.s.w     ft0, t1, rup
                  xori         t4, a2, 655
                  fcvt.s.w     fs9, s2, rmm
                  xori         s11, t2, 1327
                  fsqrt.s      ft2, fa6, rdn
                  srli         s0, t4, 29
                  ori          a5, a3, -1885
                  fdiv.s       ft10, fs7, ft6, rdn
                  divu         tp, zero, t0
                  mul          s8, s3, zero
                  feq.s        tp, ft9, ft8
                  sltiu        t6, s2, -1753
                  mulhu        a2, s0, a1
                  and          s6, s5, s2
                  or           s11, a4, s6
                  nop
                  mulh         a6, a5, a5
                  sra          a6, s5, s10
                  fcvt.w.s     a7, fa5, rdn
                  fcvt.w.s     s9, fs1, rdn
                  mulh         t2, a6, t0
                  fmul.s       fa0, ft11, ft11
                  ori          a4, s10, -1296
                  mulh         a5, a1, s1
                  fmv.w.x      ft8, s1
                  mulhu        s5, zero, s10
                  fdiv.s       ft3, fs7, ft9, rdn
                  fmax.s       ft8, fs9, ft10
                  remu         a5, t6, a1
                  xor          s6, s6, s1
                  fsgnj.s      ft1, ft0, fs9
                  or           s10, a0, sp
                  fcvt.wu.s    a2, fs3
                  fcvt.wu.s    s1, fs9, rdn
                  sltu         s3, t5, zero
                  fadd.s       ft3, fs0, fs8
                  sltiu        s2, s5, -1538
                  slli         t6, s2, 6
                  div          t3, a3, s2
                  lui          ra, 309620
                  fmin.s       fa1, fs0, fa2
                  mulhsu       a1, a7, t4
                  fmv.w.x      fa3, a0
                  srli         ra, a2, 8
                  srli         s6, a4, 15
                  fsgnjx.s     fs9, fs3, fa4
                  mul          t3, zero, t1
                  srai         t3, s0, 12
                  mulhsu       a0, a6, s4
                  divu         a7, a2, s10
                  sub          tp, a7, s8
                  div          sp, t3, t3
                  fmax.s       fs4, fa3, fs6
                  andi         s0, t3, -1919
                  slli         tp, s5, 13
                  sra          t2, ra, s11
                  fsqrt.s      fa2, fa2, rne
                  fle.s        tp, fs2, ft2
                  fmax.s       fa2, fa3, ft4
                  add          s0, t3, s0
                  slti         s5, a7, -1191
                  sub          a6, s5, a4
                  fmax.s       fs6, ft7, fa4
                  slli         tp, s7, 4
                  sub          s5, s0, s8
                  sub          s5, a2, t5
                  fcvt.s.wu    fa0, tp, rne
                  fsqrt.s      fs4, ft5, rup
                  fcvt.wu.s    s6, ft7, rmm
                  andi         s4, s9, 1890
                  remu         s4, a7, t3
                  fsgnj.s      ft0, fs6, fa7
                  fmv.x.w      s3, fs2
                  div          s5, a3, a7
                  slli         gp, ra, 21
                  mulh         a7, a7, t5
                  xori         s8, s0, 67
                  and          s8, a7, s10
                  fcvt.s.wu    fs8, s3, rdn
                  xor          a5, ra, s11
                  srl          t2, a0, a2
                  mulh         t3, s1, zero
                  slti         s3, s10, -1683
                  remu         t3, a0, s4
                  fmv.x.w      s0, fa6
                  addi         s9, s10, 1388
                  fmv.w.x      ft4, tp
                  sltu         ra, t4, s2
                  fmv.w.x      fs6, a3
                  fmv.x.w      s1, ft8
                  fmax.s       ft10, ft5, fs4
                  fle.s        ra, ft10, fs4
                  remu         zero, t5, t0
                  mulhsu       a6, a3, zero
                  fmin.s       fa6, ft4, ft6
                  auipc        ra, 619846
                  addi         zero, s2, -1661
                  fsgnjx.s     fs10, fa7, fa4
                  auipc        t2, 183105
                  fsqrt.s      ft9, ft8, rmm
                  mul          t2, a1, t1
                  sltu         a7, t4, s8
                  ori          sp, s5, -1772
                  srai         a1, s3, 3
                  fsgnjx.s     ft11, fa0, ft11
                  ori          sp, a4, -1147
                  xor          s0, t5, a0
                  sltiu        a6, t3, 109
                  slti         s1, t1, -1945
                  or           t1, s4, tp
                  mul          a3, s1, sp
                  xor          t3, s2, s4
                  flt.s        t6, ft5, ft7
                  sltu         ra, gp, a2
                  srli         s2, s3, 21
                  xori         a7, t5, -328
                  slli         s5, t6, 4
                  mul          a7, s10, t3
                  fmul.s       fs2, fa2, ft5
                  xori         s0, s4, 1641
                  fsgnjx.s     fa6, ft0, fa5
                  mulhsu       gp, t5, s10
                  fcvt.s.wu    fs2, a2
                  sltu         a7, a4, s5
                  remu         sp, zero, s2
                  sll          a7, a7, t5
                  mulhu        t4, a4, t1
                  mulhsu       gp, s3, t0
                  div          t1, sp, s3
                  fmul.s       fs11, fa1, ft0
                  xor          t1, a2, s0
                  srl          ra, sp, s2
                  fmin.s       ft10, fa0, ft7
                  fcvt.w.s     a3, fs0
                  sltu         s10, s5, s10
                  sll          a4, t3, a2
                  srli         a0, a4, 22
                  srl          s6, sp, t2
                  mulhu        s11, a7, s7
                  sltiu        sp, a5, -451
                  lui          a5, 920867
                  or           s6, sp, t2
                  mulhu        zero, s9, t4
                  remu         sp, t4, a6
                  div          ra, a0, ra
                  mul          t6, s6, t0
                  nop
                  andi         a6, t6, 781
                  and          s4, t3, s9
                  sltiu        s0, s4, -1508
                  fcvt.s.w     ft11, ra
                  fle.s        s9, fs0, fa2
                  fcvt.wu.s    s0, ft11
                  fmul.s       ft1, fs5, fs2, rtz
                  remu         t1, s5, a4
                  fadd.s       fs6, ft6, ft4
                  divu         sp, s9, s10
                  flt.s        t3, ft6, fa2
                  remu         sp, s1, s9
                  fsgnjx.s     fa3, fs2, fs7
                  slli         zero, t5, 6
                  ori          a6, s2, -472
                  sltu         gp, ra, s0
                  div          sp, t3, s2
                  xori         t2, s8, -1142
                  sltu         s6, s8, a0
                  or           s2, gp, t6
                  div          a2, a3, s1
                  andi         s2, s1, 71
                  srl          s10, s9, s9
                  srli         a4, t6, 9
                  fclass.s     sp, fs1
                  remu         t3, a4, s11
                  fcvt.w.s     a2, ft9
                  div          t1, a0, a1
                  sltiu        a3, zero, 1625
                  slt          s10, s2, s11
                  fsqrt.s      ft0, fa3, rup
                  mul          s1, gp, s7
                  flt.s        s6, fs10, fs8
                  mul          a3, s9, gp
                  add          sp, s10, s2
                  ori          t3, s10, -1281
                  fmin.s       fs0, fa2, ft7
                  slti         tp, a1, -1392
                  fmv.x.w      s8, fs8
                  add          sp, gp, s7
                  div          s0, a0, a4
                  mulhsu       tp, t0, s7
                  fsqrt.s      fa5, fs8, rtz
                  sra          a3, s2, gp
                  xori         s5, sp, -912
                  or           s2, a2, a4
                  fsgnj.s      fs10, fs0, fs6
                  slli         t3, a1, 4
                  fsgnjx.s     fs11, ft10, fa3
                  div          sp, sp, s2
                  fle.s        a0, fs1, ft1
                  fsgnjn.s     fs9, ft0, fs0
                  fmin.s       ft9, fs9, ft11
                  divu         s5, s6, t5
                  fmax.s       fs2, fa3, fs1
                  rem          s3, s8, t0
                  nop
                  xor          gp, s11, s4
                  add          a1, t3, ra
                  sra          t3, t1, a4
                  xor          a7, s5, a3
                  sll          tp, a6, ra
                  sra          a4, s6, a6
                  fdiv.s       fa6, ft10, fs2
                  fdiv.s       fs0, fs3, fa6
                  add          t1, a3, t6
                  srli         a7, s3, 3
                  addi         gp, s7, 1784
                  and          tp, a3, a4
                  rem          a6, s3, s1
                  fsqrt.s      fs8, fa6
                  fmv.w.x      ft4, s1
                  sra          s4, a4, t4
                  fcvt.w.s     a2, fs7, rup
                  rem          a2, s9, s3
                  flt.s        tp, fs2, ft9
                  fle.s        s8, ft8, fa5
                  feq.s        s5, ft4, fa3
                  mul          a6, s8, a1
                  add          s4, a3, tp
                  xor          a3, zero, a1
                  fcvt.wu.s    a1, fs1
                  fsqrt.s      fa4, ft7
                  andi         a4, tp, -411
                  sub          s1, t1, t4
                  addi         t2, t2, 524
                  addi         a0, s2, -122
                  fsub.s       fa6, ft2, fs4, rtz
                  add          a0, ra, t5
                  slti         t4, s7, 1259
                  addi         a4, a5, 53
                  fcvt.s.wu    fs10, a5
                  div          s5, a3, s10
                  srai         s11, s1, 19
                  xor          s1, a6, s2
                  ori          s8, t1, -1185
                  lui          s8, 949969
                  andi         ra, sp, 281
                  addi         a0, t4, -2010
                  fmin.s       fs9, ft4, fs7
                  flt.s        a2, ft4, fs10
                  fmax.s       fa0, fs0, fs10
                  sltiu        s3, t5, 539
                  slt          s0, a4, a6
                  sll          s9, s4, t3
                  feq.s        t3, fs7, fs9
                  rem          s5, s10, t5
                  sltu         a4, s0, s2
                  mulh         s4, s6, s3
                  ori          s0, gp, 1004
                  fsgnj.s      fs4, fs2, fs11
                  sub          t4, a7, s4
                  ori          t4, s3, -874
                  fmax.s       ft5, ft7, fs7
                  div          s11, tp, s4
                  nop
                  mulh         s10, t4, sp
                  rem          s0, a7, s9
                  mulhu        t1, a2, a0
                  fle.s        t4, ft2, ft2
                  mulhsu       a6, s5, a3
                  remu         s11, t2, a5
                  sub          t2, gp, ra
                  fmin.s       fa7, fs7, fa0
                  auipc        a3, 545697
                  remu         zero, a7, a3
                  fdiv.s       ft5, fa7, fs4
                  and          s8, s10, t0
                  mulhu        s4, zero, sp
                  feq.s        s6, fa6, ft10
                  xor          s8, ra, zero
                  sltiu        s10, a1, 1520
                  ori          a3, a1, -1683
                  fsgnj.s      fs4, fs9, fs5
                  sltiu        s10, a3, 34
                  remu         s3, s0, s10
                  xori         a3, s7, 957
                  fcvt.w.s     s1, ft5, rmm
                  slti         t1, s11, 803
                  andi         s9, t6, -1127
                  fadd.s       fs0, ft3, ft2
                  rem          ra, a3, a7
                  slt          s10, s1, a4
                  fsgnjn.s     fa3, ft10, fa0
                  sltiu        s10, a5, -517
                  and          s10, s0, gp
                  srai         t4, t4, 26
                  flt.s        a6, fs0, fa5
                  fsqrt.s      fs3, fa1
                  ori          s10, s8, -1113
                  mulhu        ra, s7, s5
                  fadd.s       fs9, fs6, ft10, rdn
                  xori         t1, s11, -1174
                  mulhsu       a7, a2, a4
                  fcvt.s.wu    fs5, a7
                  or           s0, s5, s4
                  sub          ra, zero, a1
                  nop
                  fmin.s       fa0, fs5, fs4
                  srai         s10, s7, 4
                  add          a3, t0, t1
                  fmax.s       ft4, fa0, ft0
                  sll          s5, a7, gp
                  fclass.s     s4, fs6
                  fclass.s     ra, ft11
                  srl          ra, t1, s5
                  fdiv.s       fa6, fs0, ft5
                  fle.s        t1, ft4, ft5
                  andi         a3, tp, -437
                  xor          a4, a4, s6
                  fle.s        s8, fa4, ft2
                  fcvt.s.wu    fa0, a5
                  remu         tp, s3, ra
                  sltu         s8, a1, s0
                  sltu         gp, a0, ra
                  fsgnj.s      fa7, fa3, ft11
                  or           s2, a7, ra
                  srai         tp, t2, 21
                  fcvt.s.w     ft11, s6, rdn
                  rem          s8, s8, zero
                  fmax.s       fs10, fa6, ft4
                  fmv.x.w      a2, fs10
                  srl          sp, tp, gp
                  fsgnj.s      ft1, ft7, fs2
                  rem          sp, t3, s1
                  fclass.s     s2, fa1
                  or           a4, s5, s10
                  add          s6, a6, s10
                  slti         s11, a0, -1563
                  xori         t6, t1, -1031
                  divu         t2, a1, zero
                  mulhsu       t2, t0, s3
                  xori         t4, t1, 510
                  srai         s8, s1, 29
                  sltiu        a0, t5, 1440
                  rem          s0, s4, s2
                  remu         a0, a4, t6
                  and          s3, tp, s0
                  sltiu        a2, a7, -261
                  ori          a4, tp, -1829
                  and          s1, a2, s7
                  fcvt.s.wu    fs1, s9, rdn
                  fcvt.s.wu    fa7, s2
                  fadd.s       fs11, ft9, ft6, rdn
                  fcvt.s.wu    ft9, s10
                  addi         a5, t3, -827
                  lui          tp, 608911
                  xor          gp, t5, s0
                  srai         s3, a5, 22
                  auipc        a7, 1001924
                  rem          zero, s4, a6
                  fmv.x.w      a3, fs0
                  ori          s0, a6, -1741
                  fcvt.wu.s    t4, fs8
                  fmax.s       ft5, fa1, fa7
                  fdiv.s       ft5, ft10, fs9
                  sra          s5, s5, a6
                  srli         s1, t6, 13
                  srl          ra, a1, s2
                  slti         s0, sp, -357
                  sltiu        s4, a1, -831
                  fcvt.w.s     s0, fs8, rup
                  fcvt.wu.s    a7, fs3
                  mulhsu       tp, s0, a3
                  slli         t2, t1, 23
                  sub          a7, zero, t4
                  mul          a6, t0, t6
                  fsgnjn.s     ft8, fs9, fa0
                  fsgnj.s      fa2, fs0, ft5
                  mulh         s6, a7, a6
                  fle.s        s5, fa6, fs3
                  fmv.w.x      fa2, gp
                  srl          a2, s8, a4
                  fclass.s     s0, fs6
                  xor          a7, s4, s7
                  xori         a1, t0, 484
                  fsub.s       fs3, fs7, ft7
                  sub          s9, t2, s5
                  srli         s0, a0, 0
                  fsub.s       ft6, fs11, ft4
                  xor          s10, s7, s10
                  lui          s9, 960731
                  fadd.s       fa7, fs1, fa0
                  srl          t4, t6, s10
                  sltu         t4, s8, a5
                  fmin.s       fs6, fa1, fa2
                  mulhu        a6, t2, a5
                  add          s6, t4, s6
                  slt          zero, t6, s3
                  mul          a1, a7, t1
                  xori         t6, s6, -1881
                  divu         zero, zero, gp
                  fmv.x.w      a1, ft11
                  remu         a5, s4, s6
                  add          a2, s10, tp
                  nop
                  srai         a7, s9, 12
                  srl          a3, s6, a3
                  rem          a7, ra, t0
                  srai         s2, a3, 7
                  ori          a1, t5, -785
                  mulh         s6, a7, s0
                  fmv.x.w      s0, fa0
                  mulhsu       s1, t2, t0
                  auipc        t1, 680834
                  mulhsu       a1, a0, a5
                  sltiu        s4, s1, 1941
                  mul          s9, tp, t5
                  and          a5, s3, s3
                  fadd.s       ft1, ft10, ft2
                  fsgnjx.s     ft8, ft11, fs0
                  fmul.s       fa3, ft3, ft5
                  srli         s3, a1, 24
                  fsgnjn.s     fa1, fs9, fa6
                  slli         t1, zero, 25
                  flt.s        s6, ft6, fs3
                  sltu         a2, a3, t2
                  fsub.s       ft6, ft11, fs3, rtz
                  mulhu        s10, s7, t6
                  fle.s        sp, fs3, ft3
                  feq.s        a5, ft1, fs1
                  fmax.s       fa6, ft3, ft1
                  lui          zero, 536352
                  fsqrt.s      ft4, fs3
                  srli         ra, zero, 10
                  addi         t3, a3, -534
                  lui          gp, 253143
                  fcvt.s.w     fs4, a2
                  srli         s4, s3, 28
                  sll          a0, t3, t5
                  sub          a1, a3, a7
                  fcvt.w.s     a2, fa1, rdn
                  nop
                  fsgnj.s      ft7, ft0, fs9
                  mul          t3, a5, t2
                  xor          a3, a2, s5
                  add          gp, t5, s8
                  div          s1, s2, a1
                  fcvt.s.w     fs11, a4
                  andi         s0, s2, 1956
                  nop
                  srai         a0, sp, 13
                  mulhsu       s6, a0, s4
                  fmax.s       fs5, fs9, ft9
                  fle.s        a7, fa7, ft9
                  slli         s8, s11, 11
                  fadd.s       ft0, fs10, fs1
                  sltu         s0, sp, t6
                  fle.s        s3, fs0, ft7
                  divu         s11, gp, s5
                  fsub.s       ft7, ft7, ft10, rne
                  fadd.s       ft5, fs8, ft10, rne
                  sll          t1, ra, t1
                  fcvt.s.wu    fs6, a4
                  fle.s        s8, fs2, ft6
                  mulhu        s10, s2, a3
                  xor          a2, a5, s1
                  srli         tp, t6, 19
                  fmv.x.w      tp, fa4
                  fmv.x.w      t3, fa1
                  flt.s        zero, ft10, ft6
                  sra          s2, t4, t6
                  fcvt.wu.s    s2, ft7
                  fsgnj.s      fa6, ft3, fa1
                  fcvt.s.wu    fa1, t6, rne
                  fmul.s       ft4, ft5, fa3, rtz
                  srl          a5, s9, zero
                  fmin.s       fs9, fs7, fs9
                  srli         s5, t2, 5
                  fmax.s       fs7, ft1, fs8
                  fcvt.wu.s    s9, fs11
                  remu         t1, s9, tp
                  xori         s9, a7, 1043
                  fsgnj.s      fs10, fa0, fs11
                  fadd.s       ft9, fs6, ft8, rne
                  fcvt.wu.s    t1, ft0
                  sll          s5, a2, s1
                  slli         ra, s0, 13
                  fsgnj.s      fa1, fs0, fs5
                  fmv.w.x      fs4, t6
                  div          ra, a5, s11
                  auipc        a0, 478623
                  ori          a4, s9, 441
                  fcvt.s.wu    ft1, a4, rmm
                  fsgnj.s      fs5, ft11, fs0
                  srli         t6, s5, 31
                  fcvt.s.wu    ft7, t0
                  and          a3, ra, s4
                  fcvt.w.s     a6, fa1
                  xori         s4, s4, -817
                  fsgnjn.s     fs4, fs3, fs7
                  fadd.s       fs5, fs11, fa6
                  rem          tp, t2, zero
                  fsgnjn.s     fs8, fs3, fs11
                  sll          a6, s5, t1
                  xori         t1, s7, -1004
                  fmax.s       fa1, fa7, ft3
                  xor          t4, s8, a7
                  xor          s5, a4, ra
                  xori         s1, s9, 784
                  fclass.s     s11, ft11
                  srai         s3, a5, 18
                  sltu         s10, t6, t0
                  div          a1, a3, a1
                  slt          a1, s6, a4
                  fmax.s       fs9, ft3, ft3
                  remu         a0, a3, a7
                  fadd.s       fs8, ft7, fs10
                  divu         s6, a2, t5
                  addi         s10, s1, 1993
                  feq.s        t2, fs0, fs3
                  auipc        a3, 359203
                  fsgnjx.s     ft6, fa7, fa1
                  mulhsu       t4, s4, zero
                  div          s11, s6, s11
                  sltu         a5, s11, a2
                  fcvt.s.w     ft2, s2, rup
                  fsgnjn.s     ft9, fa3, fs9
                  sll          s0, s9, a3
                  slli         s5, a7, 10
                  divu         t4, a7, s6
                  fmin.s       ft2, fs9, ft1
                  xor          s4, s7, a7
                  rem          s10, zero, s3
                  lui          s11, 223014
                  fsgnjn.s     fs3, ft1, fs6
                  div          s3, a4, t0
                  fdiv.s       ft4, fs10, fs4, rmm
                  fmul.s       ft3, ft3, ft11
                  divu         t2, t4, a0
                  slt          a4, s2, a7
                  slti         sp, s11, 1023
                  andi         a0, t4, 603
                  fle.s        a0, ft8, fs4
                  lui          zero, 672320
                  xori         sp, t5, -551
                  sltiu        a2, s9, 674
                  remu         t2, s9, t0
                  or           zero, t5, sp
                  fle.s        s2, fs1, fs4
                  remu         s6, t1, s1
                  srai         s5, t5, 30
                  fcvt.s.wu    ft8, tp
                  sub          s10, a7, a7
                  fcvt.w.s     s3, fa1, rmm
                  srli         a7, s9, 19
                  fsgnjn.s     ft7, ft9, ft1
                  fsqrt.s      ft2, ft10, rmm
                  add          a3, s7, t6
                  slli         a2, t2, 5
                  fcvt.wu.s    zero, ft4, rmm
                  add          s4, ra, s7
                  slti         a7, a0, -850
                  addi         a0, t1, 1666
                  mulhsu       t2, ra, a6
                  slli         t6, a2, 26
                  fsgnjx.s     ft8, ft11, ft0
                  add          s1, s2, a4
                  slli         a6, s3, 10
                  auipc        a5, 81747
                  rem          s5, a1, ra
                  add          a2, s2, sp
                  xor          s5, s2, t2
                  auipc        gp, 244035
                  fdiv.s       ft1, fs11, ft9, rmm
                  mulh         a5, a2, s6
                  xori         s0, ra, -1745
                  addi         s8, s8, 1886
                  xor          gp, a2, a1
                  add          tp, a6, s7
                  lui          t6, 806684
                  srl          t3, s7, s10
                  fsgnjn.s     ft4, fa3, fa4
                  auipc        s11, 151889
                  slt          s8, a2, a7
                  sltiu        s0, s0, 209
                  fcvt.s.w     ft11, s3, rtz
                  addi         s8, s2, -2023
                  ori          a0, t0, 6
                  fsqrt.s      fa1, fa3
                  sll          a3, s10, s7
                  lui          s2, 751517
                  sltu         a0, s2, t3
                  fsub.s       fs8, fa3, ft7
                  fadd.s       ft2, ft2, fs7, rtz
                  srl          a5, s9, a3
                  slti         t1, t5, 1469
                  sub          s6, sp, s8
                  auipc        a6, 85190
                  fsgnjx.s     fa5, fa7, fs7
                  fadd.s       ft5, ft6, fs4, rmm
                  fcvt.wu.s    t3, fs9
                  fsgnjx.s     fs2, fa3, fa1
                  fmul.s       ft11, fs2, fs5
                  fle.s        s10, ft1, fs1
                  srl          t4, t0, t4
                  rem          zero, s7, s7
                  auipc        a0, 200884
                  srai         a5, a5, 14
                  sltu         s11, gp, t1
                  feq.s        t1, fs2, fa3
                  rem          s6, a6, s1
                  fsgnjx.s     fs10, ft8, ft5
                  xor          s4, t3, t5
                  slt          s3, zero, gp
                  mulhu        a3, a7, a1
                  fsgnjx.s     fs8, fs7, ft6
                  addi         t6, t3, -316
                  fcvt.s.wu    ft9, a5
                  mulhu        s0, a4, s0
                  srl          a1, t3, t5
                  xor          a0, zero, a1
                  srl          a2, s10, a1
                  fclass.s     gp, ft10
                  mulhsu       a5, zero, zero
                  add          t3, t2, ra
                  sltiu        s6, sp, 792
                  xor          s1, t2, a5
                  sra          a0, s9, s9
                  fmax.s       ft4, fs5, ft0
                  sltiu        s10, t0, -1589
                  mulhu        s3, t5, s2
                  or           s3, t1, s2
                  fmul.s       fa7, ft7, ft10
                  ori          ra, t2, 1380
                  srai         a5, s3, 0
                  xori         sp, s11, 473
                  sub          s9, s5, t4
                  flt.s        s10, ft6, fa5
                  add          t1, s8, t1
                  fmin.s       ft1, fa0, fs11
                  fcvt.w.s     t1, fa7
                  andi         s11, s3, 1406
                  xor          s3, s0, t0
                  sltu         a2, a1, a7
                  slli         tp, a0, 16
                  remu         s0, s1, t5
                  slt          ra, s3, a0
                  flt.s        sp, fs3, ft11
                  fmax.s       fa0, ft4, fs5
                  andi         a3, a0, 950
                  fclass.s     tp, fa0
                  fclass.s     s3, fa6
                  fcvt.s.w     fs8, a6
                  sra          zero, s1, zero
                  fmax.s       fs8, fs3, fa1
                  fmv.w.x      fa4, t5
                  fcvt.s.wu    fs6, s4, rne
                  fmv.w.x      fa7, s8
                  fsgnj.s      ft5, ft5, fa5
                  fcvt.w.s     a0, ft8
                  sra          tp, a7, s7
                  fmv.w.x      fs0, s0
                  nop
                  slt          t4, a6, gp
                  nop
                  fcvt.s.wu    ft2, s6
                  mulhu        s4, s5, t6
                  div          s0, s1, sp
                  add          zero, a1, a1
                  sub          ra, gp, a7
                  fle.s        tp, fa0, ft5
                  fclass.s     s9, fa3
                  lui          s2, 762530
                  slti         t6, a5, 1030
                  sll          gp, t2, s7
                  fcvt.s.w     ft1, s11, rdn
                  lui          t1, 915211
                  rem          a6, a2, a3
                  mul          a0, zero, s10
                  lui          s9, 218077
                  fsub.s       fs4, fs8, ft1, rne
                  fmv.w.x      ft7, a4
                  srl          s10, s3, ra
                  slti         gp, t5, -347
                  nop
                  srai         a0, t3, 28
                  fcvt.wu.s    a3, fs9, rmm
                  flt.s        s8, ft11, fa4
                  mulh         s2, t6, s7
                  auipc        s6, 134547
                  fmv.x.w      a0, fs4
                  fmul.s       ft9, ft1, ft5, rtz
                  andi         t6, s3, 401
                  srli         s3, t5, 2
                  mulh         s3, s9, a7
                  remu         s2, t4, t6
                  lui          gp, 847398
                  xor          t4, t2, a0
                  andi         a3, t4, -1302
                  remu         t4, s2, s6
                  auipc        t6, 410640
                  andi         a6, s4, -1945
                  slli         a1, gp, 16
                  fmul.s       ft6, fs5, fs2
                  slt          sp, s7, t2
                  fle.s        t1, fs1, ft5
                  rem          t4, s9, a0
                  div          s6, s11, s10
                  and          a7, s6, t6
                  mulhu        gp, a0, s11
                  add          s8, s11, t1
                  divu         t1, ra, a4
                  mulhu        s8, s2, s0
                  fmax.s       ft11, fs7, fa4
                  sll          s1, t5, t4
                  remu         gp, s8, a3
                  rem          a2, a1, a4
                  addi         s2, s11, 1759
                  slt          a7, ra, s5
                  fsgnj.s      fs11, fa7, fa1
                  sltu         s0, a0, t0
                  fle.s        s2, fs0, ft2
                  fcvt.s.w     fs5, s8
                  div          s1, a2, s6
                  sub          s0, s7, s7
                  fsub.s       ft1, fa0, ft3, rmm
                  andi         s5, gp, 843
                  fsgnjn.s     fa4, fs7, fa2
                  ori          s2, a2, -41
                  fclass.s     a2, fa1
                  feq.s        zero, fs3, fa0
                  fle.s        t6, fs10, fs8
                  srli         t1, a1, 8
                  div          zero, a0, a4
                  div          s5, a6, ra
                  fmax.s       fs5, ft2, fa6
                  feq.s        zero, ft9, ft5
                  add          t6, t1, s6
                  andi         sp, t1, -1893
                  srai         gp, a3, 24
                  fsgnjn.s     ft6, ft2, ft4
                  mulhsu       s8, gp, t0
                  fdiv.s       fs9, fs6, fa4
                  fsgnjn.s     ft10, ft4, ft8
                  fmv.x.w      s0, ft5
                  lui          sp, 498537
                  divu         gp, s0, s7
                  mulhsu       t1, a0, a0
                  fmul.s       fa2, fa4, fs4, rtz
                  fle.s        s3, fs2, fs2
                  lui          sp, 435023
                  lui          gp, 373500
                  remu         t2, t6, s6
                  lui          t6, 351939
                  mulhu        a0, a3, t4
                  fmv.x.w      s0, fs2
                  xori         sp, gp, 715
                  sra          a0, a7, tp
                  srai         t2, ra, 14
                  fadd.s       fs5, fs3, ft4
                  srai         t1, a5, 28
                  srl          gp, s1, a6
                  and          a7, a5, s6
                  srli         s11, ra, 12
                  slli         s5, s11, 11
                  fclass.s     sp, fa6
                  ori          a4, t6, 345
                  fsqrt.s      fs11, fs2, rne
                  div          t1, t5, t3
                  auipc        a7, 44649
                  fsgnjx.s     fs9, fa6, ft11
                  fmax.s       fs6, ft0, fs9
                  fcvt.w.s     s10, fa1, rne
                  srai         a1, s5, 31
                  slli         a5, a7, 22
                  divu         gp, t4, s1
                  addi         a2, s3, 1355
                  lui          t1, 193158
                  flt.s        s10, fa1, fs7
                  remu         s5, s3, a7
                  and          a1, t6, t3
                  mulhu        a2, zero, t2
                  fmax.s       fa0, fs3, fs11
                  fle.s        t3, ft10, ft5
                  fcvt.s.wu    fs6, a0, rdn
                  fadd.s       ft4, ft6, ft8, rmm
                  sltiu        ra, zero, 1397
                  ori          s4, t4, -1019
                  mul          s1, t3, a5
                  mul          sp, t4, t2
                  sltu         t4, s6, a6
                  fmin.s       fs0, fs0, ft4
                  slli         s11, s2, 17
                  fdiv.s       fs2, fa2, fs4, rtz
                  add          gp, gp, s9
                  auipc        s3, 257839
                  auipc        a0, 953613
                  ori          s4, s1, 1135
                  fmin.s       ft6, ft11, fs11
                  slli         s6, ra, 30
                  fle.s        sp, fs5, fs8
                  xor          s9, a2, a1
                  fmv.x.w      gp, ft9
                  sra          t4, s7, s11
                  mul          a5, a5, s7
                  addi         s3, t1, -313
                  sra          sp, a7, s7
                  fclass.s     s5, fa5
                  andi         t4, zero, 308
                  slt          a6, s6, t6
                  div          a3, t2, s2
                  fsgnjn.s     fs3, ft9, fa7
                  fcvt.wu.s    t2, fs3, rtz
                  slli         t1, s1, 25
                  fadd.s       fs2, ft8, ft2, rup
                  divu         s1, sp, s4
                  fcvt.s.w     ft11, a2, rtz
                  auipc        s4, 220429
                  fclass.s     ra, fs9
                  sltiu        a5, a1, 1782
                  slt          s4, a2, sp
                  fsub.s       fs6, fs4, fa2, rtz
                  sub          s5, s3, s1
                  fcvt.w.s     a6, fs6, rtz
                  fmul.s       fs4, fa2, fs0, rdn
                  fmul.s       fs6, fs6, ft7, rmm
                  fcvt.w.s     s3, fa6, rdn
                  or           s10, a0, a4
                  div          a3, a5, t6
                  xori         t6, s11, -1892
                  auipc        gp, 350163
                  sltu         a7, t3, t0
                  remu         s1, sp, s1
                  flt.s        a3, fs0, fa6
                  lui          t4, 42493
                  ori          gp, ra, -1550
                  fmax.s       fs11, fs2, fa2
                  fsgnj.s      fs10, fa1, fa5
                  fsub.s       fa6, fa7, fs2
                  mulhsu       s3, s4, s7
                  ori          t1, t1, -488
                  fmax.s       ft1, fa4, fs9
                  srai         a6, t3, 18
                  xori         s5, t1, -1497
                  fsqrt.s      ft11, ft8, rdn
                  fdiv.s       fa3, fa4, ft10, rup
                  fclass.s     a1, ft9
                  xor          t4, t5, t3
                  fmax.s       ft11, fa7, ft9
                  fsqrt.s      ft8, ft2
                  sra          t2, s4, a6
                  fclass.s     t2, fs9
                  fsgnjx.s     fs11, fa7, fa5
                  flt.s        t4, fs5, fa0
                  ori          a6, s7, 1445
                  fsgnjn.s     fs2, fs11, ft11
                  fsqrt.s      ft11, ft11, rmm
                  fmax.s       fs4, fa3, fs7
                  slti         s6, t5, -150
                  slt          s3, a3, ra
                  fsqrt.s      fs2, fs6
                  remu         s1, a3, s0
                  rem          tp, s3, t2
                  srli         s2, t6, 21
                  nop
                  slti         s5, s5, -442
                  mulhu        a6, a3, s8
                  fsgnj.s      ft11, fs3, ft1
                  fsub.s       fa2, fs3, fs3
                  or           a6, s0, s8
                  fcvt.w.s     s10, fa7
                  fcvt.w.s     s2, fs6
                  fsgnjx.s     fs0, fa6, fs8
                  mulhu        t1, s3, s10
                  auipc        a5, 720235
                  slt          a0, s0, tp
                  rem          s11, t5, s6
                  mulhu        a5, s7, s3
                  fcvt.s.w     fa6, a4
                  mulhu        ra, s4, s6
                  mulh         t3, ra, t3
                  nop
                  sltiu        s4, s3, 1368
                  fcvt.s.wu    fs5, s10
                  fmv.x.w      s0, fs10
                  ori          ra, s2, 855
                  fsgnjx.s     fa1, fa7, fa7
                  xor          s1, ra, s0
                  fsqrt.s      ft7, fs3
                  addi         t4, s8, -1676
                  mulh         t2, s9, s5
                  sra          s8, s7, s4
                  sltu         t4, t5, t3
                  fmv.x.w      a0, fs6
                  sltiu        zero, s3, -690
                  nop
                  fdiv.s       fs5, fs10, ft11
                  fcvt.w.s     t2, fs2
                  slli         s10, t3, 26
                  nop
                  sll          s9, s10, s1
                  div          a5, zero, t5
                  fle.s        sp, fs11, fs5
                  fmin.s       fs4, fa0, fs1
                  fsqrt.s      fa6, ft5
                  andi         t6, a3, 1762
                  fdiv.s       fs11, fs11, fs9, rdn
                  fmv.w.x      fa6, t1
                  fclass.s     s11, fs5
                  fcvt.w.s     s5, fs9
                  fmul.s       fa0, ft9, fs9, rdn
                  fcvt.s.w     fa5, s10, rmm
                  sll          s1, zero, s2
                  auipc        t2, 752713
                  nop
                  fsqrt.s      fs11, fa3, rtz
                  feq.s        a2, ft1, ft6
                  sll          s1, s3, s9
                  fdiv.s       fs7, ft8, fs5, rup
                  fmv.x.w      s5, fs6
                  fmax.s       fa6, fs4, fs1
                  fcvt.s.wu    fs1, ra
                  slli         s0, a2, 18
                  fcvt.w.s     s3, fa0
                  xor          s3, s5, t3
                  fclass.s     tp, fs9
                  fsub.s       ft6, fs10, fs8
                  xor          gp, a7, tp
                  addi         a3, t4, 1139
                  or           a1, s5, s11
                  fmul.s       fs5, ft3, fa0
                  sll          s3, s4, s2
                  rem          zero, zero, a1
                  feq.s        s0, fa4, fa0
                  fmax.s       ft5, ft2, fs3
                  fsgnjx.s     fs11, fs1, ft10
                  sub          a6, s10, s8
                  auipc        s2, 825413
                  fclass.s     a0, ft2
                  feq.s        a7, ft2, fs1
                  rem          a5, a2, a4
                  rem          a0, t5, s4
                  add          t1, tp, a2
                  andi         ra, t3, -1408
                  auipc        ra, 407236
                  and          t2, a1, gp
                  or           tp, sp, t0
                  slli         s8, a0, 19
                  sltiu        s10, t6, 1819
                  rem          a1, gp, a0
                  sltiu        t3, t3, -266
                  fadd.s       ft3, ft9, fa6, rne
                  sra          s11, t6, s8
                  fsgnjx.s     ft2, ft3, ft11
                  fdiv.s       fa2, fs10, fs2, rmm
                  or           a1, a1, t6
                  fmin.s       ft4, ft7, fa0
                  rem          gp, t2, a6
                  mulhsu       s4, a1, a5
                  slt          s2, s7, s9
                  sltu         a4, s11, s6
                  fdiv.s       ft11, fs2, ft8
                  flt.s        t1, fa7, fa5
                  auipc        s4, 101280
                  fsub.s       fs2, ft8, fa3, rne
                  fsqrt.s      ft11, fs10, rtz
                  div          s3, s3, sp
                  slli         s10, s1, 22
                  fsub.s       fs10, fs3, ft1, rup
                  fsqrt.s      ft2, fs8
                  fadd.s       fa3, fs5, ft5
                  fle.s        s9, ft11, fs8
                  flt.s        a0, ft9, ft6
                  divu         s10, s3, s5
                  and          s9, sp, a7
                  sltiu        sp, t6, 1306
                  fmin.s       ft2, fs2, fa1
                  nop
                  ori          a5, a2, -1387
                  lui          s10, 102012
                  fmax.s       ft11, ft6, ft5
                  remu         a7, tp, s3
                  fsgnjn.s     ft5, ft9, fa4
                  sub          a3, s8, zero
                  fcvt.wu.s    a5, fa5, rup
                  fdiv.s       ft10, fs6, fs6
                  slli         t3, s4, 3
                  slt          t4, s1, t0
                  fsgnjn.s     ft9, fa1, fa3
                  andi         ra, t6, 4
                  fsqrt.s      fs9, ft6, rne
                  slt          tp, tp, t2
                  sll          s9, t4, a5
                  mul          s6, zero, t3
                  auipc        a1, 437646
                  nop
                  divu         t6, gp, a6
                  fmax.s       ft10, ft7, fa4
                  fmul.s       ft7, ft11, fa3, rdn
                  srli         a7, a5, 24
                  slli         a4, s0, 11
                  xori         t3, tp, -322
                  fmv.w.x      ft1, zero
                  fsgnj.s      ft9, ft8, ft4
                  add          s1, a3, t2
                  mulh         s8, s2, a5
                  xori         s1, a7, -1147
                  feq.s        a6, fs2, fa6
                  fmin.s       fs7, fs6, fa7
                  sub          ra, a0, s6
                  mulhsu       s0, a1, a1
                  fcvt.s.wu    fs2, tp, rne
                  srl          sp, a5, a3
                  mulh         tp, a3, a3
                  fsgnjn.s     ft9, fa0, fa6
                  fle.s        ra, ft1, ft4
                  mulhsu       a6, s2, gp
                  fmv.w.x      fs5, s0
                  fle.s        a1, ft3, fa7
                  sll          s11, t4, a1
                  remu         a7, ra, a0
                  slli         s6, tp, 28
                  fcvt.s.w     fs4, tp
                  rem          s11, ra, zero
                  fmv.x.w      sp, fs11
                  slti         a0, t6, -646
                  fmul.s       fs4, ft10, fa1, rup
                  fadd.s       fa4, ft9, fs10, rmm
                  and          a7, zero, sp
                  feq.s        t3, ft6, ft6
                  feq.s        s10, ft1, ft0
                  or           ra, s11, s10
                  srai         s9, zero, 15
                  and          s10, t2, t2
                  remu         s3, a0, t1
                  fsgnjx.s     fs0, fa4, fs0
                  fmul.s       fs6, ft6, ft1
                  fadd.s       fa3, fs2, ft2
                  flt.s        s1, fs9, fa5
                  rem          a3, s1, a2
                  fdiv.s       fs10, fa1, ft5
                  fcvt.s.w     ft2, s9, rtz
                  ori          s10, s3, -691
                  fsqrt.s      fs8, ft0
                  fcvt.wu.s    ra, ft4
                  rem          s5, t1, a2
                  fsgnj.s      fs10, ft4, fa1
                  and          gp, s6, a1
                  fcvt.w.s     tp, ft3, rne
                  remu         zero, sp, t2
                  fle.s        a5, fa0, fs0
                  auipc        t6, 1001517
                  slt          a6, a4, a3
                  or           s8, ra, a5
                  slti         s5, s4, 1941
                  srli         a7, t1, 13
                  srai         a5, a2, 2
                  srli         s1, gp, 6
                  fle.s        s10, fs3, fs4
                  fsgnj.s      fs10, ft0, fs4
                  fsgnjx.s     fa1, fs3, fs6
                  fclass.s     zero, fa5
                  sub          s8, s0, a6
                  fsqrt.s      ft7, fs3
                  sub          s0, sp, s10
                  div          s5, a6, s9
                  mulh         tp, gp, sp
                  fsgnj.s      fa1, fs3, fs1
                  or           a4, zero, s2
                  fmin.s       ft0, fs8, fa1
                  flt.s        s9, ft11, ft6
                  mul          zero, s10, zero
                  ori          gp, s6, -1837
                  rem          s0, a3, t3
                  fadd.s       ft3, ft4, fa4, rmm
                  fsqrt.s      fs3, ft10, rtz
                  addi         s3, t3, -173
                  srli         zero, a0, 20
                  slli         s5, a1, 24
                  nop
                  auipc        a3, 895439
                  fsgnj.s      fs7, fs5, ft10
                  div          gp, s3, a0
                  xori         s5, a0, 1267
                  xor          a1, sp, s10
                  fmv.x.w      a6, ft3
                  srai         a3, s3, 5
                  rem          a1, t1, t3
                  sra          t6, t3, s7
                  slt          t1, t1, a7
                  fsub.s       fs3, fa3, ft9, rup
                  fclass.s     t1, ft0
                  sub          s5, s0, t2
                  fadd.s       ft1, ft5, fs9
                  fdiv.s       fs1, ft5, ft5, rmm
                  or           s8, a3, t5
                  xori         s4, a5, 1004
                  remu         s6, s3, t2
                  slli         a6, s7, 10
                  remu         t4, s5, t6
                  and          a3, t5, gp
                  fclass.s     t3, ft0
                  fle.s        ra, ft9, fs5
                  fmul.s       fa0, fs3, fa3, rup
                  fmax.s       fs4, fs3, ft10
                  fsgnjx.s     fs6, fs10, fs0
                  fsub.s       ft5, ft10, fs2
                  srai         s10, gp, 28
                  xori         s8, a3, -970
                  sltiu        a0, a2, 974
                  fsub.s       fs5, ft6, ft11, rmm
                  fdiv.s       ft4, fs11, ft2, rmm
                  divu         a0, t3, s5
                  srl          t2, s8, zero
                  fle.s        s1, fa5, fa4
                  sll          s5, t2, a7
                  xori         t1, a4, 1688
                  lui          sp, 299636
                  mulh         t2, a1, t0
                  slti         tp, t4, 1738
                  mulhsu       s2, s2, s8
                  xor          t2, gp, a4
                  fsgnjn.s     ft5, fa3, fs2
                  slti         a4, s1, 1992
                  sltiu        t1, s3, -1462
                  mulh         s8, a5, a5
                  div          tp, a3, t1
                  fadd.s       ft9, ft0, fs7
                  fmv.x.w      s1, fs9
                  srai         tp, s0, 13
                  fmin.s       fs4, fs9, fs1
                  rem          s11, t4, t2
                  srl          s3, s8, a1
                  xori         s11, t6, -1764
                  divu         a4, t2, s10
                  addi         s5, s10, 272
                  remu         a4, zero, t4
                  fsub.s       fa7, fs8, fa1
                  srli         s1, a5, 9
                  rem          a0, s6, t3
                  fmax.s       fa4, ft1, fa4
                  sltiu        tp, s4, 137
                  add          t2, s1, a0
                  fadd.s       fa1, fs0, fs1
                  sra          s10, sp, s2
                  fsqrt.s      fa6, fs2
                  fsgnjx.s     ft9, ft10, ft5
                  mul          a1, a6, s10
                  srli         a0, t6, 10
                  fclass.s     a2, fs11
                  fsgnj.s      fs6, fa5, fs5
                  mulhsu       a0, a3, gp
                  sra          ra, s7, s10
                  auipc        sp, 733145
                  div          s3, a6, a7
                  mulh         a5, t3, s7
                  fmv.x.w      s10, fs3
                  add          zero, a2, a2
                  sltu         s5, tp, t5
                  lui          s1, 432518
                  fle.s        a6, fs1, fa5
                  fmin.s       ft8, fs2, fs7
                  fclass.s     s6, fs8
                  mulhsu       a1, zero, s0
                  fmv.x.w      a2, ft6
                  feq.s        gp, fa4, fs9
                  sub          s4, sp, a7
                  and          s10, s3, s10
                  addi         t3, s1, 74
                  slti         gp, s5, -1486
                  sra          ra, gp, a2
                  slli         t3, s9, 9
                  xori         a6, a7, -1376
                  addi         t1, zero, -476
                  fsgnjn.s     ft7, ft9, fs9
                  fclass.s     a1, fa0
                  fcvt.s.wu    ft0, a1
                  srli         s0, s4, 31
                  fsgnjx.s     ft4, fa1, ft5
                  fmin.s       fs5, ft5, fs4
                  srli         t6, a6, 17
                  fcvt.w.s     sp, ft8
                  slt          a1, a7, a1
                  nop
                  remu         s6, t0, gp
                  fcvt.wu.s    t1, ft0
                  fsgnjn.s     fs3, fs7, ft2
                  rem          s2, t1, a5
                  fmv.w.x      fs9, s5
                  or           a0, a6, a4
                  flt.s        a4, fs9, fs10
                  fmul.s       ft5, fs9, ft0, rmm
                  fclass.s     s4, fs11
                  fmin.s       ft8, fs4, ft4
                  fle.s        s2, ft11, fs6
                  flt.s        s2, fa2, fs4
                  srai         s4, s2, 22
                  srai         s10, s5, 22
                  fcvt.w.s     t3, ft4
                  and          a4, t6, s8
                  fsgnj.s      fa4, fs4, ft11
                  feq.s        s4, ft8, fs11
                  fmin.s       ft8, ft0, fs9
                  srli         s6, a7, 7
                  fmv.x.w      zero, fs8
                  fclass.s     t3, fs5
                  srl          s8, s7, s6
                  divu         t2, s9, t1
                  fsub.s       fs1, ft3, fs7, rdn
                  fle.s        s1, ft1, fa0
                  add          s8, a3, a0
                  feq.s        s8, fa2, ft10
                  fclass.s     t4, ft11
                  and          a4, a5, s0
                  or           s0, s9, a3
                  sra          t2, s9, a6
                  add          s8, s0, t3
                  slt          a5, s0, t2
                  slt          s3, t3, s6
                  fmv.x.w      gp, fs5
                  fmin.s       ft10, ft11, fs11
                  mulh         tp, t2, t1
                  fmv.w.x      ft5, t6
                  srai         tp, a4, 16
                  slli         s1, s3, 27
                  fsqrt.s      fa6, fs5, rne
                  srl          s1, gp, gp
                  mulhsu       a1, a4, a1
                  divu         t2, t3, s0
                  fdiv.s       ft8, fs3, fa5, rdn
                  fmin.s       ft3, ft11, fs5
                  fcvt.w.s     s10, ft6, rmm
                  sltiu        s9, tp, -1014
                  rem          sp, a0, sp
                  sltiu        t3, sp, 1503
                  fmv.x.w      s3, fa4
                  ori          s5, t2, -641
                  and          a5, t3, a5
                  slli         a5, s11, 31
                  fmin.s       fa2, fs1, fa1
                  fsgnj.s      fs5, fa0, fs1
                  ori          a5, t2, -1319
                  ori          s8, t0, 1290
                  fsgnjn.s     ft2, fa3, fa6
                  lui          s8, 396376
                  slt          tp, s10, t3
                  div          s8, s6, zero
                  fcvt.s.w     fa1, s3
                  slti         s2, a3, 1361
                  lui          s9, 853684
                  ori          a5, s1, -1550
                  srli         a7, zero, 13
                  srli         zero, s0, 26
                  fcvt.s.wu    ft5, s10
                  fsqrt.s      fa3, ft4
                  addi         s1, a7, 1011
                  fmax.s       ft2, ft4, fa1
                  andi         a4, zero, 1249
                  auipc        tp, 1016336
                  fle.s        a0, ft9, fs4
                  fdiv.s       ft10, ft6, ft3, rne
                  rem          a1, ra, s9
                  fmax.s       ft0, fa3, fs2
                  fclass.s     s3, ft10
                  auipc        s11, 599166
                  mul          a2, s11, s11
                  feq.s        t4, fs5, ft8
                  feq.s        s8, ft10, ft6
                  div          s10, t2, t6
                  divu         zero, s11, t0
                  fmul.s       fa7, fa2, fa3
                  srli         a2, s4, 31
                  fdiv.s       ft3, fs6, fs6, rdn
                  mul          a2, s5, ra
                  xori         a5, s6, -1419
                  feq.s        a7, fs4, ft8
                  rem          tp, s10, s11
                  feq.s        a4, ft3, fa0
                  or           zero, s2, s11
                  slli         a3, sp, 13
                  fmv.w.x      fs11, s6
                  lui          a0, 108009
                  sltiu        tp, s5, -155
                  fadd.s       ft11, fs9, fs10, rdn
                  fsub.s       ft3, fs4, ft10, rtz
                  fcvt.s.wu    fs5, t2, rne
                  fmv.w.x      ft8, s5
                  flt.s        ra, fa6, ft8
                  mulh         s11, s4, t5
                  nop
                  or           s2, s6, t0
                  divu         a6, tp, t6
                  xor          s9, a2, ra
                  lui          t2, 191594
                  mulhsu       t6, t5, s9
                  lui          s1, 26258
                  fmax.s       fa4, ft0, fs0
                  andi         sp, t1, -1236
                  srai         s9, a3, 4
                  or           a7, s5, t5
                  add          a1, t4, tp
                  mulhu        s0, a4, a1
                  add          s3, zero, t3
                  mulhu        s8, a2, s2
                  fclass.s     s5, ft5
                  fdiv.s       ft8, fs1, fa3, rne
                  nop
                  fcvt.s.wu    fs3, a5, rup
                  mul          a1, tp, sp
                  nop
                  fcvt.w.s     tp, fa2
                  divu         s3, s6, s5
                  fcvt.wu.s    s4, fs11, rtz
                  sltu         a0, a4, s0
                  fsgnjx.s     ft1, ft3, ft5
                  fmul.s       fs1, ft6, fs1, rmm
                  fsgnj.s      fa5, fa7, ft7
                  feq.s        s5, ft9, ft10
                  srli         gp, zero, 18
                  flt.s        s1, fa3, fs11
                  fsgnj.s      fs1, fs6, ft5
                  slti         s9, gp, 657
                  and          t2, s5, s3
                  flt.s        t2, fs3, ft10
                  slt          ra, s6, t1
                  addi         a7, s11, -454
                  add          s6, s0, s6
                  fadd.s       fs2, ft11, fs3
                  feq.s        t1, fs2, fa5
                  sltu         s11, t0, sp
                  fmax.s       ft7, fa6, fs4
                  flt.s        s10, ft8, fa5
                  fsqrt.s      fs10, fs9
                  and          s2, sp, s11
                  div          gp, s2, a1
                  fsub.s       ft4, fs7, fs3
                  fcvt.wu.s    a6, fa4, rmm
                  sub          sp, s9, a3
                  sltu         s5, s11, t1
                  divu         s2, a4, a7
                  xori         a7, s10, 685
                  srai         s9, t3, 15
                  sll          t6, s7, sp
                  slli         s6, a0, 22
                  rem          a1, s11, t5
                  fcvt.w.s     t6, fs11, rmm
                  sra          a5, a5, a4
                  mulhu        t3, t4, a1
                  sltu         a6, s7, s5
                  slt          s9, s11, zero
                  or           a0, s5, s5
                  slt          s0, t0, t0
                  xor          a4, a0, tp
                  fadd.s       ft0, ft8, fs3
                  fadd.s       fs7, fs6, fa7
                  fmv.w.x      fs4, s6
                  fmv.x.w      s11, ft8
                  slti         t3, a4, 573
                  div          t2, a7, gp
                  fmv.x.w      s3, fa6
                  sltiu        tp, t2, 807
                  fsgnjx.s     ft1, fa4, ft2
                  fclass.s     a6, fs7
                  fle.s        a4, fs11, fs3
                  divu         s1, a1, s7
                  sltu         t1, s1, a2
                  fsub.s       ft8, fs0, fa5, rup
                  fadd.s       ft0, ft8, fs1, rne
                  sltu         t4, s6, s6
                  fcvt.s.w     fa1, a4, rup
                  srl          s4, a4, s6
                  fsgnj.s      ft3, fa1, fa7
                  and          sp, a1, s6
                  ori          s8, s6, 613
                  fsgnjx.s     ft5, ft1, ft2
                  rem          a2, t2, s11
                  fclass.s     s4, fs6
                  ori          a2, s6, 587
                  fmv.w.x      fs0, s9
                  lui          s8, 776266
                  sll          a4, s3, a5
                  fclass.s     s3, fs0
                  fsgnjn.s     fa0, fs4, ft2
                  fmax.s       ft9, fs7, ft0
                  slli         a6, tp, 1
                  sub          s5, t3, zero
                  srl          t6, s6, a0
                  fsgnjx.s     ft2, ft8, fs5
                  or           s4, zero, t4
                  mulhsu       s1, ra, t5
                  remu         s10, a3, s2
                  mulh         ra, s8, t1
                  xor          ra, s6, s9
                  sub          ra, a7, s5
                  remu         s5, a4, t2
                  mulh         a7, s11, s9
                  fsub.s       fs1, fs1, ft5, rtz
                  rem          t3, sp, s2
                  sll          a6, s0, t3
                  fmul.s       fs6, fs7, fa6
                  or           s10, s3, s1
                  auipc        zero, 741036
                  divu         gp, t2, sp
                  fsgnj.s      ft6, ft11, ft11
                  sltiu        t1, s11, 258
                  fmv.w.x      fa6, t0
                  divu         sp, t4, ra
                  fmv.x.w      t2, fa2
                  sra          t2, s7, s9
                  fclass.s     a2, fs9
                  xori         s11, s8, 146
                  add          s8, t6, s11
                  addi         a4, a5, -1879
                  fclass.s     s11, fa1
                  addi         s5, s8, 1770
                  fcvt.wu.s    t1, ft0
                  rem          t6, gp, s9
                  sltiu        a5, s5, -705
                  mulhu        t4, s4, a3
                  fmax.s       ft9, fa4, fs6
                  fcvt.w.s     tp, ft7, rdn
                  fsgnj.s      ft4, ft6, ft9
                  srai         a7, s4, 12
                  fsqrt.s      fs10, fs1
                  xor          s4, a2, tp
                  fmin.s       ft5, fs2, fa5
                  fcvt.s.w     fa2, s9, rdn
                  andi         ra, s4, 650
                  sltiu        a0, t4, 169
                  flt.s        sp, fs6, ft4
                  fmv.w.x      fs2, t4
                  mul          a1, t6, a7
                  srai         s11, s3, 13
                  feq.s        a0, fs7, ft6
                  fdiv.s       ft4, fa5, ft6
                  mulhsu       s10, t1, s5
                  fclass.s     gp, fa6
                  fcvt.wu.s    s3, ft10, rne
                  mul          s0, a2, s6
                  slt          a7, s3, s1
                  remu         gp, t5, zero
                  andi         s8, s0, -803
                  fsgnjx.s     fs7, ft6, fs3
                  rem          s3, t0, a6
                  fmv.x.w      a1, ft0
                  slti         s5, t0, 385
                  fmax.s       fa0, fs5, ft6
                  fcvt.wu.s    tp, fa3, rup
                  fmin.s       fa5, ft8, ft2
                  srli         s6, t0, 4
                  sltiu        t6, a0, -183
                  rem          zero, t0, s7
                  mul          s5, t5, s1
                  fsub.s       ft7, fs11, fa7
                  fcvt.s.wu    fs11, s7, rtz
                  xor          a2, a5, s6
                  fcvt.w.s     s9, ft7
                  ori          a6, s11, 853
                  sltu         a2, a0, a6
                  mul          s10, t2, t3
                  flt.s        s6, ft11, fa6
                  and          s9, s11, a7
                  sra          a1, t6, zero
                  mulhu        sp, s1, s8
                  fsqrt.s      fa7, fs3
                  ori          t2, a4, -596
                  flt.s        tp, fs5, ft2
                  mulhsu       t4, a7, t3
                  nop
                  nop
                  flt.s        s0, ft8, fs6
                  ori          a7, s10, -1599
                  mul          t6, a7, ra
                  fcvt.s.w     fa4, t3, rdn
                  mulhu        s6, a0, a7
                  fsgnjx.s     fs6, fs11, fs10
                  sltiu        s8, s2, 1622
                  slli         s6, a7, 18
                  div          sp, s11, s6
                  divu         s5, t5, t0
                  mulhu        a2, s7, ra
                  srli         s6, s2, 30
                  sltu         a6, a1, a6
                  srli         a7, s8, 28
                  sra          a2, s2, s6
                  divu         a7, s8, a5
                  sltu         s1, sp, s7
                  sub          s2, s7, s0
                  xor          s0, a7, t6
                  srai         t3, s10, 14
                  sltu         zero, s7, a6
                  fcvt.w.s     a0, fs11
                  fmv.w.x      ft0, a5
                  fcvt.wu.s    a6, fa4
                  divu         gp, t6, t5
                  sra          s0, t3, sp
                  fclass.s     a4, fs9
                  fmul.s       ft2, fa5, ft7
                  divu         s0, t6, s8
                  rem          t3, s11, a5
                  fsub.s       fs6, fs0, ft9, rtz
                  divu         a3, s8, ra
                  sltiu        a0, s1, -678
                  fcvt.s.w     ft11, t2
                  add          s9, s5, t1
                  mulhu        a5, a2, t2
                  mulh         s6, s0, s9
                  fcvt.s.wu    fs7, a0
                  fcvt.s.w     ft0, t6
                  fsgnjx.s     fs7, fa4, ft10
                  fmv.x.w      a6, fa0
                  fmul.s       ft10, fs7, fs9, rdn
                  fsgnjn.s     fs5, ft9, ft2
                  add          a2, s1, s4
                  fcvt.wu.s    a3, ft11
                  sub          s10, t1, t0
                  mul          a0, s3, sp
                  fmul.s       fs6, fs11, fa7
                  fsgnjx.s     fs4, fs7, fa3
                  mulh         s1, a6, tp
                  divu         a2, s4, a5
                  auipc        s11, 277384
                  ori          a5, sp, -1469
                  xori         t6, zero, 1894
                  fcvt.w.s     ra, ft7, rmm
                  fsqrt.s      fs4, fa2
                  fadd.s       ft3, fa1, fa2, rdn
                  fcvt.wu.s    t4, ft4
                  divu         a4, s6, s3
                  andi         s10, t3, -14
                  or           tp, a2, t2
                  fcvt.wu.s    t4, fs10, rtz
                  flt.s        t2, fs11, ft1
                  and          a6, t1, a0
                  mul          a6, zero, a4
                  fmin.s       fs9, fa6, ft1
                  xor          a3, a6, t0
                  sltiu        s6, zero, -1430
                  fclass.s     a1, ft3
                  mulh         ra, a1, t4
                  fsub.s       fs2, fa3, fa3, rup
                  fcvt.s.wu    ft4, tp
                  fmv.x.w      a3, fs11
                  slli         t4, s11, 12
                  slli         s2, ra, 29
                  and          s1, a0, gp
                  srl          t3, a4, sp
                  slli         a6, a6, 24
                  nop
                  fcvt.wu.s    a6, ft11, rne
                  feq.s        a6, fs9, fs7
                  sltiu        s9, sp, -643
                  lui          a7, 518659
                  andi         s11, tp, 462
                  fsgnj.s      fs10, fs4, fs2
                  fsgnjn.s     fa4, fa7, ft8
                  fdiv.s       ft11, ft4, fs0
                  mulh         a7, t0, t3
                  add          gp, a0, a6
                  fcvt.s.w     fs8, s8, rdn
                  fcvt.w.s     s4, ft8, rup
                  add          ra, s5, s7
                  xor          s0, a7, s3
                  mul          s4, s1, t1
                  sub          s10, s3, a5
                  add          a6, s10, t1
                  fmv.w.x      fs4, t1
                  mulh         zero, zero, a3
                  flt.s        s1, ft2, ft7
                  addi         zero, t0, 1059
                  slt          s5, t1, s4
                  addi         ra, t2, 1968
                  add          s3, a4, s3
                  fcvt.s.wu    fs1, a0
                  fsub.s       fa4, ft11, ft0
                  fmax.s       fs9, fs1, fs11
                  andi         ra, s2, -99
                  sub          s8, gp, s11
                  xori         a3, t0, 1967
                  remu         t2, a0, t6
                  mulh         s4, sp, ra
                  slti         s8, s3, -1888
                  div          a5, zero, a2
                  fsub.s       fs4, ft6, ft1
                  mulhu        a7, ra, sp
                  sltiu        s5, s8, -1527
                  nop
                  lui          s5, 539481
                  mul          a5, ra, t5
                  fsqrt.s      fs10, fs2, rup
                  or           t6, t0, s0
                  fsub.s       fs8, ft1, ft9
                  fcvt.wu.s    a6, fa3
                  mulh         s5, t1, tp
                  feq.s        s1, fa7, fa5
                  srai         a6, t3, 11
                  fsgnjx.s     fa3, fs7, ft9
                  xor          zero, s11, s6
                  sltu         s0, s8, a6
                  srli         s9, s6, 27
                  fsgnjx.s     fs1, fa1, ft8
                  fsub.s       fa2, ft11, ft11
                  fsgnjn.s     fa6, fa5, ft4
                  sra          s2, s2, s6
                  fmul.s       fs10, fa6, fs7
                  fsgnj.s      fa2, ft6, ft8
                  slti         s10, t5, 64
                  fadd.s       ft7, fa7, fa1
                  andi         t6, a1, 1431
                  fsgnjn.s     fa2, fs11, fs9
                  srai         ra, a0, 24
                  mulh         s8, t6, s5
                  xor          a2, s4, ra
                  xor          t4, s6, t0
                  srai         s2, s9, 11
                  rem          a1, s2, tp
                  divu         s11, t4, s11
                  slt          s8, gp, s8
                  mulhu        ra, sp, s1
                  andi         sp, s9, -1114
                  fmv.w.x      fa3, a5
                  or           s4, a1, a0
                  fdiv.s       fs1, fs6, fs2, rne
                  mulhsu       a4, a2, a1
                  sll          s8, s8, s5
                  div          s3, a5, t3
                  fadd.s       fa3, ft11, ft6
                  mul          ra, s1, s10
                  fcvt.s.w     fs7, t3, rmm
                  addi         s0, tp, 433
                  sltiu        s0, s8, 795
                  fsgnj.s      fs0, fs0, fs11
                  fmv.x.w      t2, ft3
                  fcvt.wu.s    s5, ft6, rmm
                  fmin.s       fa2, ft10, fa6
                  sltiu        t1, s2, -518
                  mulh         t4, t4, t5
                  fsub.s       fa5, fa7, ft10
                  fmv.w.x      fs6, a5
                  sll          s11, a1, s0
                  lui          t3, 293160
                  fsgnjn.s     fs5, fa1, fs2
                  nop
                  remu         s8, a6, t5
                  fcvt.wu.s    s10, ft10
                  slt          t1, s11, s9
                  srli         a2, a6, 30
                  andi         a7, s8, 1879
                  slti         a5, s7, -1801
                  fsub.s       ft2, fa0, fa4
                  fmul.s       ft0, fs6, fa2
                  xor          a6, a4, a6
                  divu         a5, s10, s2
                  sll          tp, t3, gp
                  fcvt.s.w     ft8, s10
                  slli         tp, t6, 27
                  fsqrt.s      fs4, fs3, rmm
                  fmv.x.w      a3, fa0
                  fcvt.wu.s    s1, fs11, rne
                  fsgnj.s      fa4, fa5, fs10
                  and          zero, s11, s1
                  fsgnjn.s     fs10, fa7, fa4
                  sub          ra, s0, t1
                  fadd.s       ft10, ft9, fs6
                  addi         s2, s10, -480
                  remu         ra, s4, t2
                  fsgnjn.s     ft8, fa0, ft4
                  auipc        tp, 159690
                  ori          tp, s8, 1166
                  fmax.s       fs3, fs4, fa0
                  mul          gp, s9, a5
                  xori         a4, a4, 564
                  mulhu        ra, gp, t4
                  fmin.s       ft11, fa4, ft8
                  fadd.s       fs0, fs3, ft6
                  mulh         s1, t4, t2
                  sltu         t6, s6, a2
                  fcvt.s.wu    ft1, ra
                  fsgnjn.s     fa0, ft4, ft10
                  fcvt.s.wu    fa2, s7, rne
                  fadd.s       fs6, fs6, fa7, rtz
                  fcvt.s.wu    fa1, zero, rtz
                  sll          tp, gp, t0
                  srli         t4, s7, 24
                  remu         ra, s2, s10
                  mulh         a3, s9, s7
                  sll          s4, t0, sp
                  fcvt.wu.s    s2, fs4, rdn
                  flt.s        s5, ft7, fs4
                  mul          s11, s8, s8
                  mulhsu       t4, s9, t3
                  and          s10, s4, ra
                  fadd.s       ft6, ft7, ft2
                  fcvt.s.w     ft3, t3, rtz
                  feq.s        t6, fs6, ft1
                  lui          a5, 463436
                  add          s9, s9, a7
                  divu         a6, s7, a6
                  fadd.s       fa0, fs8, fa2, rup
                  or           a0, t1, t5
                  fdiv.s       ft7, fs0, fa1, rne
                  fdiv.s       fs5, fs6, ft10, rdn
                  fsgnjn.s     fs7, fa2, fa1
                  rem          gp, s8, a5
                  flt.s        tp, fa6, fa1
                  srai         s9, a7, 0
                  fdiv.s       ft7, fs1, ft3, rmm
                  fsgnjx.s     ft9, ft5, fs11
                  mulhsu       s8, t1, t5
                  or           s4, tp, s3
                  nop
                  ori          a5, s2, 210
                  sltu         s1, a4, ra
                  fsgnjn.s     fa0, fa6, fa5
                  fcvt.w.s     s11, fs2
                  fadd.s       ft11, ft0, ft11, rne
                  slt          a4, s10, zero
                  mulhsu       a1, a5, t1
                  slti         a7, a5, 1268
                  lui          a4, 1035398
                  fsgnj.s      ft5, ft3, fs0
                  rem          a0, s3, a2
                  or           a3, s5, gp
                  mulhsu       t3, s10, s10
                  fmax.s       ft3, fs0, ft10
                  fadd.s       fa1, fs2, fa5
                  add          s10, a0, s10
                  remu         sp, t0, t2
                  fmin.s       fs6, fs7, fs11
                  sll          a0, a2, sp
                  divu         t6, s1, t3
                  addi         s5, s5, -1227
                  addi         tp, a0, 1164
                  slti         zero, s8, 1470
                  remu         t2, s2, t3
                  mulhu        a0, t1, t5
                  mulhsu       t6, a3, t3
                  xor          t6, ra, s6
                  addi         gp, ra, 1068
                  remu         a2, s8, s2
                  slt          t4, a6, s4
                  auipc        s4, 244172
                  srai         sp, t2, 15
                  fclass.s     tp, fs11
                  sll          t4, a1, a3
                  ori          s6, a3, -1078
                  slti         s4, t0, 714
                  and          t1, a0, a0
                  fcvt.s.w     ft5, t6, rne
                  mulhsu       zero, s1, tp
                  mulhsu       a6, s8, a6
                  fmul.s       fa6, fs8, fs3
                  fcvt.wu.s    t1, fa2, rdn
                  sra          s3, a5, s2
                  slt          s6, tp, t0
                  fcvt.w.s     t2, ft5, rdn
                  fcvt.s.w     fa6, s5
                  sub          tp, s7, t4
                  div          a5, s11, s10
                  fmin.s       fa3, ft6, ft0
                  mul          sp, tp, a3
                  fmax.s       ft9, fs6, ft1
                  or           a6, tp, t0
                  auipc        s1, 798123
                  mulhu        t1, gp, sp
                  fadd.s       ft3, fa0, ft9, rne
                  slli         s10, t1, 28
                  and          t1, a7, t5
                  fcvt.s.w     fs10, t0
                  sltiu        ra, s7, -448
                  remu         s6, t0, s4
                  fmax.s       ft2, ft2, ft4
                  lui          ra, 433308
                  addi         ra, t6, 1350
                  remu         t4, a1, s11
                  sra          s5, t1, s7
                  sltu         t3, a6, s11
                  feq.s        s6, ft7, ft3
                  sll          s4, t1, a7
                  ori          a1, t6, 950
                  add          a4, s2, t1
                  xor          s11, t0, s8
                  divu         a5, s10, s10
                  mulh         a6, s7, a6
                  srl          a3, a0, s6
                  remu         a0, zero, a0
                  fsub.s       fs2, fs3, ft6, rtz
                  div          t6, t3, a6
                  fmin.s       fa2, fa3, ft6
                  mulh         gp, zero, s3
                  fadd.s       fs1, ft10, ft0, rmm
                  fcvt.s.w     ft8, a4, rtz
                  and          s1, s1, s3
                  fsgnj.s      ft3, ft9, fs2
                  mul          zero, s0, t4
                  xor          s6, a3, t6
                  andi         a6, s2, 1001
                  slt          t3, t2, gp
                  fcvt.s.wu    fa3, a5
                  fclass.s     a7, fs0
                  andi         a6, s5, 965
                  fmv.x.w      a7, fs0
                  divu         t1, s8, tp
                  fmul.s       fs2, ft2, ft10, rup
                  mulhu        a5, a0, s9
                  rem          s11, s9, t1
                  mulhu        s0, gp, a6
                  div          a6, s1, t3
                  slti         t6, s3, -1830
                  srl          s1, a1, s7
                  slt          t3, tp, s2
                  sll          t4, gp, t6
                  fdiv.s       fs8, ft11, ft4, rne
                  sll          s1, a0, t1
                  sll          s8, t3, s8
                  divu         t1, a6, t6
                  sltiu        t1, a2, 1798
                  fmv.w.x      fs11, a0
                  sltu         s4, a6, s6
                  mulhu        sp, s2, a7
                  mulh         s5, s2, s0
                  xori         s3, t0, 692
                  ori          s3, a4, 703
                  lui          s8, 803769
                  feq.s        t6, fa6, fs3
                  fcvt.s.w     fa3, tp, rup
                  fadd.s       fa6, fa7, fs8, rup
                  rem          s10, s8, a3
                  or           sp, s8, t3
                  divu         s6, t2, t0
                  fdiv.s       ft5, ft0, ft2
                  srl          t6, gp, s0
                  sll          s9, a0, s2
                  add          s9, t5, s5
                  fsgnjx.s     fs3, fa3, ft10
                  fcvt.s.w     fs2, a4
                  srai         sp, a6, 0
                  rem          ra, a4, tp
                  sltiu        a0, a0, 946
                  auipc        s8, 729511
                  fmul.s       fa2, ft4, fa0, rdn
                  fmv.x.w      t1, ft9
                  div          a2, s9, a6
                  fsgnj.s      ft9, ft3, ft1
                  mulh         t4, a2, tp
                  div          s11, t6, s2
                  srli         ra, sp, 7
                  auipc        t3, 484242
                  fadd.s       fs1, fa6, fs4
                  nop
                  add          s10, s4, a5
                  slt          s5, ra, a5
                  sra          t3, s2, s1
                  xor          a0, a7, t0
                  fsgnjn.s     ft6, ft5, fs9
                  fmax.s       fa6, fa0, fs11
                  fsgnj.s      ft0, fs5, fa7
                  divu         zero, a5, zero
                  sll          a6, t0, t6
                  fmv.w.x      fa7, s7
                  nop
                  mulhu        a3, t5, t6
                  xor          gp, t2, s11
                  sub          s9, t2, s8
                  sra          a7, sp, s8
                  xori         s10, t5, -395
                  fsgnjn.s     fs9, ft0, ft2
                  fsqrt.s      fa3, ft1
                  auipc        tp, 40251
                  fdiv.s       ft7, fa6, fs2, rtz
                  fmv.w.x      fs4, tp
                  slti         s9, a6, -878
                  srli         t6, a4, 12
                  fclass.s     t3, fs2
                  feq.s        s5, ft11, fa5
                  sll          a1, t4, s0
                  mulh         zero, a6, a2
                  sltiu        a0, s1, 889
                  mulh         a3, zero, gp
                  remu         tp, t1, sp
                  nop
                  fsqrt.s      ft10, fs4
                  lui          s8, 314337
                  addi         t1, s4, -1068
                  xori         zero, s6, 1110
                  divu         a5, gp, a1
                  xor          s11, t4, s8
                  fle.s        s3, ft4, fs9
                  xori         s2, t1, -43
                  fmin.s       fa5, ft1, fs9
                  sltu         zero, t2, s1
                  sltiu        t4, a3, 1211
                  sra          zero, s6, a3
                  fcvt.s.wu    ft4, s11
                  flt.s        s1, fs6, fs9
                  fsgnj.s      fs5, fa1, fs3
                  remu         t2, zero, zero
                  mulh         ra, a7, a2
                  fclass.s     gp, fa1
                  fclass.s     gp, fs11
                  fsgnjn.s     ft8, ft0, ft3
                  mulhu        a5, a4, s11
                  fsub.s       fa2, ft4, ft8, rne
                  flt.s        s0, fs6, fa1
                  rem          s3, s6, t5
                  fcvt.s.w     ft11, t6, rmm
                  fle.s        a4, fs1, fs6
                  sll          s3, a0, a2
                  fsub.s       ft2, ft9, fs0
                  mul          s5, s8, s7
                  and          s4, t3, t2
                  mulhu        a6, s8, s6
                  srl          s10, tp, t4
                  sltiu        t6, t5, -967
                  fsgnj.s      ft7, fa7, fs11
                  fcvt.wu.s    s5, ft5, rne
                  addi         s10, s10, -1455
                  slti         a0, s5, 1397
                  andi         s2, t6, 1340
                  fmin.s       fs11, fs2, fa7
                  sltiu        s1, a0, 832
                  fdiv.s       ft4, ft1, fs0
                  sra          s6, t1, t4
                  fsgnjx.s     ft9, fa2, fs5
                  addi         s1, s2, -875
                  sll          a6, tp, s2
                  or           a0, a2, a2
                  divu         s11, a2, sp
                  remu         t6, gp, t3
                  fclass.s     s4, ft9
                  fsqrt.s      ft1, ft1, rtz
                  div          s4, sp, gp
                  fclass.s     s6, fs1
                  fcvt.s.w     ft6, sp, rne
                  srli         a5, s4, 9
                  divu         a3, tp, s11
                  fmax.s       fs1, ft10, fa0
                  rem          a5, s2, s4
                  ori          sp, a5, 826
                  and          s6, t2, a3
                  mulhu        t4, t1, s8
                  fsub.s       fa4, ft0, fs4, rup
                  fmax.s       fs8, ft9, ft4
                  fdiv.s       fa0, ft5, ft10, rup
                  xor          t1, s6, a1
                  fmax.s       fs4, fs7, ft4
                  fcvt.s.w     fa1, s7
                  auipc        s3, 990442
                  fsgnj.s      fa3, fa7, ft0
                  remu         t3, a2, s2
                  addi         a0, s1, -709
                  feq.s        s3, fs6, ft8
                  fsgnjx.s     fa5, fa0, fa4
                  fmul.s       fa4, fs5, fs2
                  slti         a3, t1, -773
                  nop
                  flt.s        a3, fs11, ft6
                  fadd.s       fa4, fa5, ft0
                  mulhu        a1, s11, s0
                  fclass.s     s9, fs8
                  fmv.x.w      a5, ft2
                  fmax.s       ft6, ft6, ft11
                  xor          s5, t1, sp
                  sltu         ra, t6, t5
                  slli         s9, a0, 3
                  sra          s11, s7, s10
                  sll          a2, s10, zero
                  sltu         ra, t1, s1
                  rem          t1, s5, s2
                  fmul.s       fs5, fa0, fa7
                  fmax.s       fs8, fs11, fa5
                  fcvt.wu.s    zero, fa6, rdn
                  remu         ra, s10, s7
                  fsgnjx.s     fs7, fs2, fa4
                  mul          a5, s6, sp
                  fmin.s       ft1, fa5, fs1
                  xori         t4, s8, -849
                  sll          a2, a2, t1
                  or           a2, t5, s4
                  addi         a6, t5, -347
                  mulhsu       a2, a7, a4
                  mulhu        s1, s11, t4
                  fcvt.s.wu    fs5, a3, rtz
                  rem          s10, a0, s11
                  slt          s5, s6, s3
                  feq.s        s11, fs8, ft8
                  slli         t6, s10, 19
                  slt          s0, t0, s2
                  srli         s2, a2, 24
                  fcvt.s.wu    ft1, a1
                  xori         a4, s0, 785
                  srli         a7, a3, 29
                  fdiv.s       fa4, fs8, fa1, rup
                  fmv.w.x      fs0, a1
                  fsgnj.s      fa0, ft6, ft9
                  fadd.s       ft3, fs6, fa5
                  fclass.s     sp, fs5
                  mulhsu       s11, t2, s0
                  fcvt.s.w     fa2, a6
                  sll          s6, s3, ra
                  xori         s0, tp, 854
                  andi         s0, a3, -1002
                  srai         s4, tp, 9
                  auipc        a2, 187140
                  srai         s3, s11, 7
                  fdiv.s       ft8, fs4, fa4, rtz
                  rem          ra, s9, s9
                  andi         a0, s0, -1799
                  divu         a2, a7, s7
                  auipc        a4, 104818
                  sub          s0, a2, t1
                  fmv.x.w      t2, ft9
                  add          a2, s8, s6
                  divu         tp, s6, s9
                  div          a7, t4, s0
                  fmv.x.w      zero, fs2
                  sra          gp, t1, tp
                  fsgnj.s      ft9, fs2, ft6
                  fsqrt.s      ft11, fa5, rne
                  lui          gp, 631498
                  fsqrt.s      fs2, fs2
                  slt          s2, a2, sp
                  mul          s5, a4, t0
                  fsgnj.s      fs7, fs8, fs9
                  or           s3, a2, s3
                  fmax.s       ft11, fa4, fa5
                  fadd.s       fs11, fs8, fa4
                  fcvt.s.wu    fs0, a2, rne
                  fclass.s     a0, fs0
                  sra          t2, s7, gp
                  auipc        t1, 960220
                  mul          s2, zero, a6
                  sub          a4, t6, s10
                  andi         a6, t4, -1169
                  fsub.s       fs0, fa5, fs3
                  mulh         a1, t4, t1
                  ori          a1, s6, -798
                  fle.s        s2, fs0, fs6
                  slli         s6, t1, 27
                  andi         t6, s0, -1269
                  srl          s8, s1, a1
                  nop
                  mulhsu       a4, a7, s6
                  remu         a6, a7, zero
                  fsgnjx.s     fs10, fs1, ft4
                  flt.s        s5, ft7, ft2
                  slt          s11, s1, s7
                  fcvt.s.w     fs6, s4
                  fadd.s       ft9, fs8, ft10
                  fsub.s       fs8, ft1, fa4
                  mulh         t4, s10, a5
                  fsgnjn.s     ft6, fs2, fa3
                  xor          t3, a4, tp
                  mulhsu       s1, s3, gp
                  fcvt.s.w     ft8, a4
                  fcvt.w.s     s9, fs11, rtz
                  fsgnj.s      fs3, fa6, ft2
                  fmin.s       ft6, fa4, ft9
                  mulhu        s6, t3, t4
                  srai         a3, s7, 17
                  nop
                  auipc        s5, 861427
                  sltu         s3, sp, s0
                  fmv.w.x      fs0, a0
                  fsqrt.s      fs4, fs10, rtz
                  remu         t4, gp, t4
                  ori          a1, sp, -353
                  mulhu        s8, s7, t4
                  nop
                  fcvt.w.s     ra, fa5, rne
                  nop
                  rem          t1, a0, s11
                  ori          t2, zero, -1653
                  fcvt.s.w     ft7, a1
                  fcvt.s.wu    ft10, s10
                  mulhsu       zero, s2, s7
                  feq.s        gp, ft3, fs3
                  fsgnj.s      fs1, ft6, fs10
                  fclass.s     t2, fs11
                  fsgnjn.s     ft3, ft9, ft8
                  srai         s5, a3, 9
                  fclass.s     a3, ft8
                  add          a1, s11, ra
                  addi         a6, ra, 480
                  fadd.s       ft4, fs9, fs10
                  fmv.w.x      fa2, t6
                  mulh         s9, s3, s6
                  fsqrt.s      fa6, fa5, rmm
                  flt.s        sp, ft2, ft0
                  mulhsu       gp, t1, s6
                  rem          s4, a5, s3
                  fmul.s       ft0, fa5, ft9, rdn
                  mulhsu       a5, s2, s5
                  fcvt.s.wu    fa7, tp, rdn
                  lui          s3, 684576
                  fcvt.wu.s    s0, fs1
                  fmv.x.w      s4, fa3
                  fmv.w.x      fa3, t4
                  auipc        a7, 728561
                  lui          s8, 175981
                  mulhu        s11, zero, s1
                  sltu         a4, t2, sp
                  sll          t6, sp, s4
                  fadd.s       fa7, fs5, fs11, rmm
                  auipc        s11, 803833
                  divu         s0, s4, t2
                  auipc        s2, 261217
                  lui          sp, 845815
                  mulhu        sp, s7, s11
                  fsgnjn.s     ft4, fs5, ft10
                  fsgnjn.s     fa1, ft1, fs0
                  fsgnjn.s     fs4, ft7, fa6
                  sltiu        a5, sp, -698
                  remu         s0, s9, s9
                  fsqrt.s      fa4, fs2, rne
                  fcvt.wu.s    sp, fs4, rmm
                  flt.s        t1, fa1, ft6
                  fadd.s       fa3, ft5, fs5
                  ori          s8, t2, -94
                  slti         a3, a0, -1216
                  srli         t6, s2, 10
                  lui          a4, 683878
                  sub          a4, a5, a7
                  fclass.s     t4, ft8
                  addi         s4, s9, -1780
                  fadd.s       ft11, ft0, ft6, rtz
                  sra          a3, t1, a2
                  auipc        tp, 235422
                  fsub.s       fs8, fs4, ft9
                  fcvt.s.wu    fs3, tp
                  rem          gp, a0, a0
                  fcvt.s.wu    fa3, s11, rdn
                  xori         zero, s4, -718
                  xor          s4, s0, s9
                  lui          a4, 411108
                  fsgnjx.s     ft3, fs7, fa1
                  fsgnjx.s     fs7, fs0, fs4
                  divu         s1, s9, s0
                  fsub.s       fa3, ft2, fa3, rup
                  srai         s10, s5, 19
                  sra          gp, zero, s10
                  fsgnjn.s     fs2, fa3, fs0
                  fmin.s       fs4, fs3, fs11
                  slti         t1, a0, -654
                  or           a3, a5, t1
                  feq.s        a2, fa6, ft11
                  rem          ra, s9, s1
                  fsgnjx.s     fs1, fa3, ft0
                  fcvt.wu.s    zero, fs1, rdn
                  mulh         zero, t6, a5
                  andi         a6, t6, 1119
                  addi         a1, t5, -1396
                  fcvt.wu.s    s11, ft5, rup
                  mulhu        s4, a2, a6
                  rem          t4, zero, t2
                  fcvt.s.w     fs8, s4
                  sltu         s11, a4, t0
                  add          s8, t2, a3
                  fmul.s       fs7, fs10, fs8, rmm
                  slti         sp, t1, -1729
                  fcvt.s.wu    fa2, a4, rdn
                  fdiv.s       ft3, fs7, fs2, rne
                  slt          a6, ra, s11
                  div          t4, t6, s2
                  addi         s0, s6, 81
                  fsqrt.s      fs6, fs5
                  andi         s5, a0, -281
                  sub          s11, s6, s5
                  fclass.s     t6, fs10
                  fsgnj.s      fs6, ft1, ft7
                  sll          s6, a4, sp
                  fsgnj.s      fs4, ft1, fs9
                  fdiv.s       ft8, fa6, fs6, rne
                  feq.s        sp, fs11, fs5
                  mul          s0, ra, a5
                  divu         t4, sp, a4
                  ori          s1, t2, -518
                  xori         s4, a6, 10
                  fmax.s       fa7, fa0, fa5
                  mulhu        s2, s4, a4
                  or           s9, zero, s2
                  fcvt.wu.s    s9, fs0, rmm
                  mulh         a2, s8, t2
                  mulh         t2, t3, t6
                  fcvt.wu.s    t4, ft8, rup
                  fsub.s       ft4, ft2, fs6
                  sll          s2, s5, a4
                  fcvt.wu.s    sp, fa0
                  sll          a4, t1, s8
                  fcvt.w.s     s10, ft7, rmm
                  addi         a3, s8, 872
                  ori          a5, s7, 996
                  slt          s0, s8, a2
                  fsgnj.s      fs0, fs11, ft0
                  mulhsu       a2, sp, s8
                  fmv.w.x      fs10, s3
                  divu         gp, a5, t1
                  slti         s10, tp, 960
                  feq.s        a5, ft2, fs5
                  fsgnj.s      fs9, fs6, fa3
                  fmin.s       ft7, fs3, ft2
                  sltiu        sp, a7, 845
                  nop
                  fsqrt.s      ft8, fa6
                  slti         t4, ra, -1871
                  nop
                  rem          s10, t1, s5
                  flt.s        s3, ft10, fs1
                  lui          a7, 16501
                  sltu         t1, s9, t1
                  feq.s        s8, fa7, ft10
                  slli         s8, t1, 28
                  auipc        a0, 681918
                  fsub.s       ft4, ft4, ft3
                  sll          ra, gp, sp
                  srai         tp, a0, 1
                  div          t1, a2, sp
                  sub          gp, gp, t6
                  fsub.s       fa5, ft6, ft3
                  flt.s        t4, ft10, fa3
                  slli         s5, t2, 6
                  rem          gp, t1, s3
                  fmv.w.x      ft11, s11
                  xor          s0, s8, a4
                  ori          a2, s5, 1613
                  fsub.s       fs3, fa1, fs1, rne
                  andi         s9, s11, 830
                  fcvt.wu.s    sp, fs7
                  fmv.x.w      a2, fs5
                  div          a3, t3, s3
                  addi         s8, a6, -1452
                  andi         sp, s2, -1042
                  fsgnjn.s     fa4, fs2, fa0
                  divu         tp, a2, t3
                  fsqrt.s      ft1, fs11, rtz
                  xor          sp, a6, a1
                  srli         a3, tp, 25
                  fcvt.w.s     s6, ft5, rdn
                  feq.s        s0, fs11, fs9
                  srl          t4, s8, zero
                  fsgnjx.s     fa6, fa7, fs4
                  fmul.s       fa1, fa2, fa2
                  flt.s        t4, fs5, fs8
                  auipc        t6, 672073
                  fcvt.wu.s    s8, ft9, rmm
                  fcvt.w.s     s4, fs1
                  slti         a1, s11, -498
                  xor          t1, t2, s4
                  srl          a4, a2, s9
                  fmv.x.w      zero, fs10
                  fcvt.wu.s    t3, ft11, rtz
                  auipc        a7, 38512
                  andi         ra, gp, 1372
                  fclass.s     a0, fs11
                  lui          t3, 462112
                  fle.s        s2, ft3, ft5
                  nop
                  mulhsu       s3, t5, t2
                  fsub.s       fs7, fs1, fa7
                  fmul.s       fs10, fa1, ft2, rup
                  auipc        t1, 418344
                  remu         t6, t6, a4
                  mulh         s4, tp, a3
                  fsgnjn.s     ft4, ft11, fs0
                  fmul.s       fs2, fa4, fa0
                  fclass.s     a6, fs11
                  srai         t2, s1, 11
                  sltu         s11, t3, a1
                  sra          s1, t0, t2
                  fmul.s       fa3, ft2, ft8
                  fsgnj.s      fs0, ft0, fa6
                  srli         a5, ra, 19
                  fmin.s       fs5, ft3, fa5
                  lui          zero, 327622
                  srli         a7, s9, 28
                  slt          a0, s4, tp
                  sll          sp, sp, a5
                  slt          s3, s5, a0
                  lui          s8, 987152
                  add          tp, t6, t5
                  andi         s1, s6, -1756
                  fcvt.wu.s    a5, fa7, rmm
                  remu         s10, a7, s2
                  srl          a3, a3, sp
                  fmin.s       ft7, ft7, ft2
                  fdiv.s       fs9, ft0, fs11
                  mulh         s2, a4, s2
                  slli         tp, s9, 26
                  fcvt.s.wu    fs4, zero
                  or           a1, sp, sp
                  xori         tp, a4, -1494
                  sltiu        a4, sp, -1844
                  xor          s3, ra, t3
                  nop
                  slti         a6, a0, 328
                  fsgnjx.s     fa2, ft9, ft4
                  slli         s4, gp, 25
                  fsgnjn.s     ft9, fs11, fs3
                  mul          zero, gp, a1
                  fmv.x.w      s3, fs11
                  fmin.s       fs10, ft4, fs2
                  sub          ra, s4, a0
                  fle.s        t6, fs11, fa3
                  srai         t4, tp, 29
                  divu         a5, s4, t3
                  mulhu        a3, a7, t5
                  fsgnjn.s     fa0, fa0, fa2
                  div          t4, s8, t4
                  auipc        a0, 56197
                  fsub.s       fs2, fs11, fs8, rdn
                  sra          tp, s6, a4
                  remu         s6, t1, t1
                  fmax.s       ft3, fs7, ft0
                  fsgnjx.s     fa4, fa6, ft0
                  fcvt.s.w     fa6, t3
                  flt.s        t2, fs6, fs8
                  slli         s10, zero, 28
                  sub          a3, s6, s11
                  fcvt.s.wu    fs10, t3
                  divu         gp, ra, s9
                  nop
                  addi         t1, s8, -120
                  sltu         t4, a2, t5
                  fdiv.s       ft9, fs0, fa2
                  fmv.w.x      ft10, t2
                  slt          a6, s0, gp
                  sub          t2, t0, gp
                  andi         sp, gp, -1771
                  fcvt.s.wu    fs2, t3, rmm
                  mulh         s2, s8, t0
                  lui          gp, 749771
                  mulhsu       t6, t1, s4
                  and          s5, s3, s1
                  ori          a0, s3, 1427
                  slli         s10, s7, 16
                  sll          s1, s10, sp
                  xor          t4, s3, t3
                  ori          s6, zero, 1886
                  fclass.s     s1, ft10
                  divu         a1, s3, s9
                  fcvt.s.wu    ft5, t3
                  lui          s2, 907409
                  feq.s        tp, fa0, fa6
                  lui          s3, 715387
                  mulhsu       s2, a5, s2
                  sltu         t4, t0, a4
                  andi         a2, t5, -440
                  flt.s        zero, fs11, ft5
                  fsqrt.s      ft8, fa6, rmm
                  sub          a0, a6, a6
                  fcvt.s.w     fa3, s4
                  fsgnj.s      fs3, ft2, fs0
                  slli         s1, t0, 3
                  sra          s10, s6, zero
                  fle.s        s4, fa0, ft10
                  fmul.s       fa2, ft0, fs11
                  fsgnjx.s     fs10, ft9, ft0
                  fmax.s       ft10, fa6, fa3
                  fsgnjx.s     fa1, fa0, ft5
                  fdiv.s       ft0, fa3, fs0
                  fcvt.wu.s    gp, fa0
                  mul          gp, s0, s8
                  fcvt.s.w     ft8, t6, rne
                  fsgnjx.s     ft10, ft3, fs7
                  sltu         a6, a2, a1
                  sll          s6, s4, a0
                  fsqrt.s      fs3, fa4, rne
                  addi         a6, s2, -196
                  divu         s5, gp, s10
                  sltu         tp, a5, a6
                  srli         t1, a0, 1
                  div          a7, a7, s2
                  fcvt.wu.s    s11, fs9
                  fmv.w.x      fs5, a5
                  addi         t4, a3, 177
                  mul          s0, s1, s11
                  auipc        t1, 17817
                  fmv.w.x      fa5, s0
                  fsgnjn.s     fa1, fa4, fs0
                  fmul.s       fs10, ft6, fa1
                  sltu         t6, s11, s10
                  rem          t3, a4, s1
                  mulhu        sp, a1, s2
                  rem          s10, s4, a7
                  fcvt.w.s     a7, ft2, rdn
                  fsgnjn.s     fa7, ft4, fs8
                  divu         s5, s7, gp
                  sub          s4, a1, s3
                  mul          s5, s5, s7
                  mulhu        a0, s10, gp
                  fsgnj.s      ft1, fs8, fa2
                  sub          s4, sp, s0
                  ori          tp, s5, -330
                  fdiv.s       fa7, fs1, fs0, rdn
                  fmv.x.w      sp, fs0
                  mul          s0, s6, t2
                  fcvt.w.s     a6, fs7, rne
                  fsgnjx.s     fs1, fs3, fa4
                  divu         a1, t3, a2
                  add          a2, a7, s5
                  fle.s        gp, ft8, ft2
                  flt.s        s2, ft1, fa3
                  fmin.s       fs0, ft4, fs4
                  fadd.s       fa1, ft11, fs4, rmm
                  or           t4, a7, a4
                  fmul.s       ft7, ft11, fs11
                  lui          a5, 686757
                  flt.s        s5, ft8, fa7
                  rem          a4, s5, a5
                  fadd.s       fa1, fa7, ft10
                  fcvt.wu.s    t6, fs4
                  feq.s        s1, ft6, fa2
                  fmin.s       ft6, fa4, fs4
                  fcvt.w.s     s1, fa4
                  fcvt.s.w     ft11, s6, rdn
                  andi         a3, a7, 1522
                  fcvt.s.w     fa4, s9, rtz
                  feq.s        a0, fa4, fa1
                  fsgnjn.s     fs10, fs10, fs2
                  sub          a1, a3, a6
                  fsgnjn.s     fs7, fa7, ft3
                  fsgnjn.s     ft1, ft9, fs4
                  fsub.s       fa5, ft3, ft0
                  xori         a5, s2, -75
                  slli         t3, s2, 21
                  or           s3, s8, a7
                  fsgnjn.s     ft10, fs4, fs11
                  fsgnjn.s     fa1, fs2, fs4
                  fcvt.w.s     s11, ft4, rtz
                  addi         a1, a5, -1778
                  flt.s        s0, ft10, ft11
                  sra          a3, s6, a4
                  and          t6, s7, s6
                  xori         t3, s7, 1826
                  fcvt.wu.s    t6, fs5, rup
                  remu         sp, a0, t3
                  fdiv.s       ft0, fs3, fs4
                  fcvt.s.wu    fs9, a1, rne
                  fcvt.s.wu    ft0, a7
                  mulhu        s8, t1, s11
                  remu         a2, t4, sp
                  flt.s        gp, fa5, fa3
                  flt.s        t3, ft2, fs10
                  fsgnj.s      fs5, fa3, fa6
                  sra          s1, s1, s8
                  or           a3, s10, s6
                  fmv.w.x      ft7, s3
                  fle.s        s6, fs3, fs7
                  fsgnjn.s     fa6, ft4, fs6
                  xor          s3, a2, a1
                  nop
                  div          s6, t4, a3
                  fmul.s       fa1, fs8, fs4, rdn
                  fdiv.s       ft7, fs4, fa4
                  fle.s        a0, fa4, fa7
                  fsub.s       fs9, fa3, fa4, rmm
                  fmul.s       ft11, ft7, ft1, rne
                  slt          s5, s1, s10
                  fmv.w.x      fa4, a5
                  fmin.s       fa7, ft10, ft3
                  fmul.s       ft2, ft10, fs5
                  fcvt.wu.s    t3, ft9, rdn
                  slli         zero, a6, 1
                  fsub.s       ft3, ft6, ft4
                  mulh         s2, t3, s2
                  div          s1, s5, ra
                  remu         a7, s5, t3
                  mul          t2, a3, s1
                  nop
                  add          s10, a5, s7
                  fsgnjn.s     fs10, fs10, fs1
                  fmul.s       fa5, fs7, fa7
                  add          a5, a2, s1
                  fsub.s       ft11, fs7, fa6
                  fcvt.w.s     a4, fs3, rmm
                  sub          a2, gp, tp
                  fsub.s       ft0, fs8, fs7, rdn
                  sra          a5, t5, t5
                  fadd.s       fs1, fs4, ft11
                  fmax.s       fa6, fs1, fs11
                  lui          a2, 682102
                  xor          a6, a3, t1
                  ori          s2, t4, 287
                  sra          s10, a2, s2
                  fsub.s       ft2, ft2, fs3, rtz
                  sub          a7, tp, s4
                  fcvt.s.w     ft8, zero
                  flt.s        s3, fs1, fs2
                  mulhsu       a5, s5, s7
                  flt.s        t1, ft8, ft8
                  divu         tp, sp, a7
                  fsgnj.s      fa7, ft0, fs5
                  sltu         t4, t6, a3
                  srli         a1, a1, 27
                  srl          t1, s3, t0
                  srl          gp, a4, a6
                  and          t2, t6, t3
                  fmin.s       fa7, fs8, fa3
                  fmv.x.w      s1, fa4
                  sra          a1, a5, s1
                  andi         a5, t0, 186
                  sra          sp, a7, sp
                  and          t4, s0, t2
                  fsgnj.s      ft7, fs3, ft1
                  and          sp, a4, t1
                  mul          tp, a0, s7
                  xor          s0, s3, a7
                  srl          a4, t3, s7
                  nop
                  mulh         t6, s2, t2
                  sltiu        sp, s11, 527
                  srai         zero, s2, 27
                  div          s3, s8, sp
                  addi         s3, zero, 1285
                  sll          a4, a6, a1
                  srli         tp, t2, 2
                  fsub.s       fa7, fa3, ft5, rtz
                  fmv.x.w      tp, fs0
                  fsgnjn.s     fs4, ft11, fs8
                  fmv.x.w      a1, fs11
                  fcvt.s.wu    fa1, s8
                  rem          a5, s6, a6
                  slti         t2, s5, 1199
                  fle.s        a6, fs6, fa0
                  sra          a0, s7, a6
                  fmv.w.x      fa5, t0
                  mulh         s10, s8, t0
                  sra          ra, s2, s3
                  fsgnj.s      ft9, fa2, fs1
                  andi         a1, s8, -995
                  sra          a3, s2, t2
                  fmul.s       fs6, ft6, fa5, rup
                  srl          gp, a2, zero
                  xori         a3, t5, 1937
                  fmv.w.x      ft5, s1
                  xor          t6, t1, a5
                  fdiv.s       fa3, ft4, ft3
                  fcvt.wu.s    s6, fa3
                  fmv.w.x      fs5, ra
                  div          a1, a4, s0
                  fle.s        a1, fs2, fs11
                  fcvt.w.s     zero, ft0
                  fsgnj.s      ft7, fs0, fs10
                  fsgnj.s      fa2, fa7, ft5
                  slt          sp, t4, s0
                  fmul.s       ft1, ft10, fa4
                  feq.s        gp, ft8, fa1
                  flt.s        s4, ft0, fa4
                  fdiv.s       ft7, fs7, ft9
                  fcvt.wu.s    a7, ft3, rne
                  fsgnjn.s     ft7, ft10, fa1
                  xor          a5, tp, t0
                  sll          t3, a0, s2
                  andi         a2, s1, 1117
                  fclass.s     a2, ft3
                  lui          s9, 637067
                  fmv.x.w      s6, fa7
                  mulhu        a2, a5, zero
                  ori          t3, a5, -1741
                  sltiu        tp, t0, 383
                  mulh         a3, s5, s3
                  rem          t3, a4, tp
                  mulhu        s8, s4, t4
                  auipc        s2, 124847
                  fsgnjx.s     fs2, ft3, ft11
                  slti         s11, s9, 934
                  sltiu        s5, ra, 1262
                  nop
                  fsub.s       fa3, fa3, fs5, rup
                  div          a3, a6, a6
                  and          s11, s4, s6
                  slli         t1, s7, 11
                  or           t6, t1, s9
                  divu         t1, a4, s4
                  remu         s6, ra, a7
                  fcvt.s.wu    ft11, a4, rtz
                  fcvt.s.w     ft7, s7
                  fdiv.s       fa5, fs1, fa6, rdn
                  fmv.w.x      ft11, s9
                  fmin.s       fa5, ft4, ft10
                  mulh         s8, t6, a1
                  fmax.s       fs5, fa0, ft1
                  feq.s        t6, fa5, fa4
                  addi         a2, t5, -1982
                  div          s2, t3, ra
                  fcvt.wu.s    a4, ft2, rne
                  sltu         a0, a0, t2
                  xori         t3, sp, 386
                  fcvt.w.s     a1, ft8
                  fdiv.s       fs10, ft2, ft10
                  sra          s1, a3, s10
                  fmax.s       fs5, fs9, ft5
                  fle.s        s1, fs2, ft4
                  srli         zero, s1, 24
                  fsgnjx.s     ft4, fa1, fa1
                  addi         s1, t1, 912
                  mulhsu       t6, s9, t6
                  fmax.s       fa6, fa2, ft5
                  and          a4, s0, sp
                  flt.s        t2, ft1, ft4
                  srli         a0, tp, 27
                  fcvt.w.s     a6, ft2, rne
                  fcvt.wu.s    a2, fs8, rup
                  addi         a5, s3, -1884
                  fsgnj.s      ft4, fs5, fs11
                  fmax.s       fa7, fs9, ft0
                  div          a2, t6, s6
                  divu         s1, zero, s11
                  andi         t3, s8, 1539
                  remu         ra, zero, sp
                  lui          a0, 256471
                  sra          gp, t0, a4
                  mul          a3, s6, s10
                  mul          a7, s0, a4
                  ori          s0, s0, 1326
                  fcvt.wu.s    s1, fa7, rup
                  ori          tp, s10, -1839
                  fdiv.s       ft7, ft11, ft0
                  fcvt.w.s     s0, ft4, rup
                  fsgnjx.s     ft0, fa4, fa0
                  lui          s8, 830939
                  xori         s11, t4, -1762
                  fcvt.s.wu    ft9, a4
                  srai         gp, a5, 14
                  sub          s1, s1, a5
                  fcvt.s.w     ft5, s6
                  slti         s5, t2, -936
                  lui          s10, 176118
                  fcvt.s.wu    fa1, t3
                  addi         s9, s10, -1301
                  fcvt.wu.s    sp, ft5
                  ori          a0, gp, 1579
                  rem          s8, sp, t4
                  or           s2, a4, s7
                  slt          s10, s10, a7
                  add          s11, a6, a3
                  fmv.x.w      s11, fs1
                  sltu         a7, t2, a1
                  slt          s1, gp, a3
                  mulhsu       a3, zero, s6
                  andi         s5, ra, 1259
                  mulhu        t4, a4, zero
                  add          tp, zero, t6
                  fcvt.s.wu    ft2, s5, rmm
                  feq.s        s8, ft2, ft10
                  srai         s8, t6, 2
                  xori         s5, s3, 560
                  and          t6, s11, a0
                  feq.s        s2, fs4, fa2
                  mulh         a2, s8, s11
                  and          a2, a1, a1
                  sra          a1, s4, s1
                  fclass.s     s11, fs4
                  ori          t4, a1, 1096
                  or           a2, s11, t1
                  fsgnj.s      ft4, ft0, ft8
                  div          zero, s4, a4
                  fmin.s       ft0, ft7, fs2
                  fsqrt.s      fs11, fa7
                  sra          s3, a6, ra
                  addi         s5, s10, 1772
                  mulhu        sp, t0, t6
                  fsgnjx.s     fs10, fs6, fa0
                  slt          a5, t1, s7
                  fsqrt.s      fa5, ft0
                  sra          s5, s5, s3
                  fmv.x.w      t2, ft5
                  ori          ra, sp, -1006
                  srai         s11, a5, 0
                  srai         sp, s8, 9
                  lui          s0, 584072
                  rem          a2, a2, a2
                  fle.s        a7, fa4, ft6
                  fsqrt.s      fa7, ft3, rmm
                  div          a4, t4, t2
                  srl          t4, a6, s8
                  andi         s5, zero, 966
                  sra          s6, ra, a2
                  srai         s4, t0, 26
                  slt          s0, a4, s8
                  fsgnjx.s     fa3, fa6, fs11
                  remu         s1, s4, s7
                  remu         a5, t6, s6
                  addi         s8, t6, 1398
                  fsqrt.s      ft9, fs1, rmm
                  mul          t1, s2, zero
                  fmv.x.w      a1, ft0
                  rem          a7, s2, sp
                  slti         s10, s0, 922
                  mulh         a0, s10, s0
                  fsgnjn.s     ft1, fs2, ft6
                  mul          a3, t6, t2
                  xor          sp, sp, sp
                  mul          a5, s1, s2
                  fclass.s     s8, fa6
                  mulhsu       a1, s10, a0
                  fmin.s       ft8, ft8, ft5
                  srai         a4, s3, 22
                  nop
                  sltiu        s8, s7, 1790
                  fcvt.w.s     a2, ft6, rup
                  fmax.s       fs10, ft11, ft0
                  mulh         s10, t4, s2
                  mulhu        tp, t0, t0
                  rem          a0, t5, gp
                  slli         s10, t4, 11
                  flt.s        a5, fs8, fa7
                  fcvt.wu.s    tp, fs8
                  flt.s        gp, fs8, ft11
                  mul          t2, s3, a5
                  fcvt.w.s     a0, fa6, rup
                  auipc        zero, 999502
                  xor          s4, s6, s3
                  srli         a6, gp, 4
                  slt          t3, a6, s4
                  fmv.w.x      fs3, s1
                  xor          a4, a2, s9
                  ori          s8, s6, -989
                  fadd.s       fs4, fa5, fs7
                  and          t1, t2, a0
                  fle.s        t1, ft10, ft0
                  div          a4, s7, t2
                  fsgnj.s      fa5, fs3, ft4
                  slli         s5, a5, 21
                  fclass.s     t3, ft11
                  fadd.s       fa5, fs1, ft11
                  xori         a0, a4, 809
                  mulhsu       s1, s7, ra
                  srl          t6, t4, t4
                  feq.s        a5, fs3, fs7
                  sub          s5, t5, a1
                  fsqrt.s      fs10, ft4, rtz
                  fle.s        gp, fa3, fa1
                  fclass.s     a2, ft5
                  fsub.s       ft6, fs9, fa2
                  addi         a5, a5, -1057
                  and          s1, a5, a1
                  fcvt.s.wu    fs4, s3
                  add          a1, sp, s8
                  sra          s5, a7, s9
                  nop
                  fclass.s     tp, ft10
                  lui          t6, 729287
                  fcvt.w.s     t2, fa5
                  div          t1, a7, t3
                  xori         t1, tp, 1912
                  srl          s10, s10, zero
                  fsgnj.s      ft8, fs0, fs7
                  sltiu        s11, s5, 1679
                  sltiu        t6, ra, -226
                  mulhu        t6, a4, s0
                  and          t2, a6, s0
                  fadd.s       fs6, fs4, fs7
                  sltiu        t3, s4, 665
                  fsgnj.s      fa7, fa4, fs5
                  slt          s5, t4, s3
                  rem          s6, s10, zero
                  fclass.s     a2, ft0
                  feq.s        s2, fs4, fa0
                  add          s11, s8, a4
                  fmv.x.w      s0, fa2
                  xori         t6, a0, -85
                  div          s2, sp, tp
                  feq.s        t3, fa6, ft9
                  flt.s        s1, fa1, ft11
                  fsgnjx.s     ft2, fa4, ft10
                  fmv.x.w      t1, fs8
                  mulh         s0, s7, t0
                  fmv.x.w      a2, fs6
                  fsgnj.s      ft0, ft10, ft1
                  remu         zero, t2, s10
                  fclass.s     tp, fa0
                  xori         zero, s0, 1385
                  mulhsu       a1, t6, a3
                  fsqrt.s      fs1, fs11
                  fcvt.s.w     fs11, zero
                  fcvt.s.w     ft0, s8, rne
                  rem          a2, a7, s5
                  mulh         s10, a4, s5
                  sltiu        s3, a2, -1134
                  sltu         sp, a0, tp
                  fsgnjn.s     fa4, fs3, fs3
                  mulh         a5, s3, s2
                  sll          t3, a5, s11
                  slt          s4, tp, t0
                  remu         gp, t6, s0
                  sra          t6, t3, a3
                  xori         t1, a1, 93
                  mulh         t3, a5, a3
                  slt          s4, a7, s2
                  slt          a1, a4, ra
                  fmax.s       fs0, fa5, ft7
                  mulhu        a0, t2, t1
                  srli         tp, a5, 25
                  add          a0, t5, t1
                  remu         s1, zero, a7
                  auipc        s3, 110589
                  ori          a4, t4, -1390
                  xor          sp, t1, sp
                  fdiv.s       ft7, fs4, fs3
                  fsgnj.s      ft8, fa3, ft1
                  div          t3, t6, s2
                  flt.s        tp, ft11, fs11
                  feq.s        t4, fs1, fa6
                  mulh         t2, ra, t2
                  mulh         s2, a5, s8
                  srai         a4, a3, 13
                  slli         a1, s1, 15
                  mul          zero, t6, s1
                  sll          gp, ra, ra
                  mul          a7, s10, a2
                  mulh         t6, zero, a1
                  ori          tp, t5, 1502
                  or           s2, s1, a5
                  slti         sp, t4, 678
                  fmv.w.x      fa6, t0
                  fsub.s       ft11, fs5, ft10, rup
                  andi         s2, zero, 1187
                  ori          s8, s9, 902
                  sltu         zero, a7, a7
                  mulh         a2, sp, a5
                  srai         t3, a4, 31
                  mul          tp, t4, gp
                  fsqrt.s      fs11, fa5, rmm
                  fmul.s       ft4, fs7, fa1, rne
                  feq.s        t3, ft3, fa7
                  fdiv.s       fa2, fs1, ft9
                  mulh         a3, s2, zero
                  sub          t3, s4, a6
                  srai         a7, s0, 28
                  fsgnj.s      fs3, ft4, fa3
                  and          s8, s2, a6
                  and          a6, t3, s4
                  sltiu        a0, t6, 1479
                  fmv.x.w      ra, fs1
                  andi         s4, zero, -988
                  fmax.s       ft6, fs8, fs6
                  xor          s8, t1, a4
                  feq.s        zero, fs9, fs6
                  slti         a2, a0, -71
                  mulhu        t6, t4, s4
                  sub          a1, t6, t6
                  fsgnj.s      ft9, fs1, fs1
                  mul          t3, t5, a1
                  fsqrt.s      fs8, ft3
                  andi         a5, a5, -897
                  nop
                  fcvt.wu.s    tp, fa0
                  sra          s9, t3, s11
                  fcvt.wu.s    a3, fs9, rne
                  or           t3, s7, s0
                  ori          s4, s9, 112
                  div          t4, s7, ra
                  slti         s9, s7, 823
                  fdiv.s       ft3, fs5, ft10
                  fcvt.w.s     s3, ft2
                  xori         t3, s1, 1491
                  srl          a0, t3, s2
                  rem          tp, t0, s3
                  remu         s3, s9, tp
                  or           a1, s7, a1
                  mulhsu       s8, s0, t2
                  fmv.x.w      s0, ft7
                  feq.s        s3, fa1, fa7
                  auipc        s8, 16013
                  ori          t4, s6, 801
                  fmul.s       fa1, ft10, ft9, rdn
                  div          zero, zero, s9
                  sll          s6, s6, t2
                  fcvt.w.s     a3, ft3
                  addi         t1, a5, -1272
                  and          s2, a2, s3
                  fsgnjn.s     fs6, ft3, fa6
                  rem          s5, t6, t1
                  rem          a5, s2, t4
                  mulhu        a1, t2, t1
                  slt          s4, s1, a1
                  fdiv.s       ft4, fs11, fs1, rmm
                  remu         s5, sp, s4
                  flt.s        zero, ft10, ft0
                  ori          ra, t4, -48
                  sltiu        s1, s2, -1752
                  slti         t3, a0, 772
                  remu         a7, a4, s8
                  slt          a5, tp, s2
                  slti         t2, t1, 1888
                  sra          a5, a2, a2
                  fsgnjn.s     ft8, fs11, fa5
                  sll          a0, a0, s7
                  xori         a4, a7, -603
                  fsub.s       fs0, fa5, ft9, rtz
                  fsgnjx.s     fs10, fa3, fs9
                  slti         tp, s8, 1129
                  srl          s1, t4, t2
                  mulhsu       a4, zero, s0
                  srai         zero, ra, 12
                  auipc        a1, 173172
                  fsgnj.s      fs11, ft5, fa6
                  sltiu        s5, ra, 369
                  fclass.s     a0, fa2
                  fadd.s       ft4, fs5, fs2
                  mulhsu       ra, t3, t2
                  sub          t4, t5, ra
                  sub          s6, s6, zero
                  fmv.x.w      tp, fs8
                  remu         tp, s10, a5
                  remu         zero, a2, s5
                  fsgnjn.s     fa3, ft3, fa6
                  slt          t3, a5, s2
                  feq.s        s2, fa5, fa7
                  mulhsu       t1, s11, gp
                  mulhsu       ra, a4, t3
                  ori          t6, t4, -182
                  fclass.s     s9, fs1
                  or           a3, t1, s1
                  fclass.s     s11, fs5
                  fsgnjn.s     fs7, fa5, fa5
                  rem          a7, s11, s5
                  fsub.s       ft4, ft6, ft4
                  mul          zero, s5, sp
                  srli         t1, zero, 28
                  mul          t2, s9, a7
                  flt.s        a2, fs8, fs2
                  fcvt.wu.s    s0, ft8, rdn
                  auipc        s10, 476397
                  srli         s0, s6, 14
                  mulhsu       a1, s1, a4
                  srl          s2, s6, a0
                  add          a0, s10, sp
                  fmv.x.w      s0, fa2
                  fle.s        s5, fs5, fa6
                  srl          ra, s0, s1
                  mulhsu       gp, s3, s0
                  and          a6, a5, a7
                  fsgnjn.s     fs11, fs11, ft8
                  remu         a3, s5, ra
                  fcvt.w.s     s4, fs11
                  fcvt.w.s     t1, fa0
                  flt.s        s5, fa6, ft8
                  fcvt.w.s     s4, fs2
                  fsqrt.s      fs10, ft9
                  slli         s10, tp, 2
                  add          tp, sp, t0
                  sll          a5, s6, a6
                  lui          a6, 300326
                  fcvt.w.s     s3, ft6
                  sltu         s0, s2, s11
                  xor          a1, t6, s4
                  flt.s        gp, fs9, fa7
                  fsqrt.s      fa5, ft9
                  srai         zero, t5, 0
                  fsgnjn.s     fs10, ft0, fs5
                  auipc        s0, 329341
                  sra          s9, s6, t2
                  fcvt.w.s     t3, fs11, rmm
                  flt.s        s2, fa0, fa4
                  xori         s10, a1, -1606
                  fmv.x.w      s1, fs7
                  fmv.w.x      fs2, s6
                  and          a4, s5, gp
                  and          s2, s9, t5
                  fclass.s     tp, ft2
                  sltiu        t6, a3, -1116
                  flt.s        a7, fs8, ft4
                  sll          s9, s8, s4
                  fsgnj.s      fs10, ft4, ft8
                  fmv.x.w      t3, ft8
                  fsgnjx.s     ft3, ft10, fs5
                  sltu         s0, t4, s9
                  fsgnj.s      ft8, fs0, fa6
                  lui          t3, 873345
                  fclass.s     t1, fs3
                  or           s0, s8, s7
                  fmv.x.w      s9, fs6
                  remu         t6, t1, t0
                  nop
                  lui          a3, 286955
                  fdiv.s       fs5, fs6, fs9
                  xor          s11, zero, a2
                  fle.s        a1, fs5, ft0
                  fsqrt.s      fa5, fs7
                  slti         s9, t2, 659
                  add          s0, a4, s10
                  sll          a4, a5, a3
                  fclass.s     t4, fa2
                  div          a6, ra, s2
                  flt.s        a3, ft11, fs2
                  mul          gp, s10, s0
                  fcvt.w.s     t3, fs3
                  flt.s        tp, fs5, ft4
                  fdiv.s       fs8, fa3, fs5
                  fmin.s       fs3, fs4, fs5
                  add          a4, s0, a2
                  slt          t6, ra, t2
                  fmax.s       ft9, fs10, ft6
                  sll          t3, s7, s8
                  fsgnjn.s     ft4, ft3, fs11
                  fsgnj.s      ft9, fa3, fa6
                  ori          ra, s1, -570
                  fdiv.s       ft2, fs0, ft9, rmm
                  mulh         t4, s11, t3
                  sltu         s3, zero, s9
                  fmv.w.x      fs7, t4
                  mulhu        zero, s6, a3
                  xori         s5, t6, 810
                  addi         a6, gp, -1679
                  divu         s0, a3, s7
                  xori         s0, t6, 1499
                  divu         s10, s6, ra
                  mulh         s0, s5, t5
                  or           a1, s9, s4
                  fsgnj.s      fa2, ft10, fa0
                  mul          s8, t3, zero
                  slt          tp, a6, ra
                  auipc        a7, 867804
                  xori         a1, a3, -177
                  fcvt.wu.s    s2, fs10, rdn
                  fsqrt.s      fs4, ft0, rup
                  fcvt.w.s     s8, fs8, rne
                  and          t6, s9, ra
                  fcvt.wu.s    t3, fa0, rtz
                  rem          s9, gp, a1
                  xor          s8, s9, zero
                  fsub.s       fs6, ft7, fs2, rup
                  andi         t6, t0, 302
                  rem          a6, a5, t1
                  fadd.s       ft8, fs7, fa0
                  fsqrt.s      fs4, ft1
                  fcvt.w.s     sp, ft1
                  xor          a0, gp, t0
                  fadd.s       fa4, fs11, ft11, rne
                  fmv.w.x      fa7, s6
                  fcvt.wu.s    s4, fs4
                  fsqrt.s      fs5, fs8
                  fcvt.s.w     fs8, s5
                  andi         s1, s1, 1058
                  mulhsu       t2, gp, tp
                  flt.s        s3, fa7, fa5
                  mulhsu       a4, s2, t5
                  fsgnjx.s     fa5, fa5, fa6
                  remu         a6, a6, ra
                  fsub.s       fs0, ft2, ft4
                  mulhu        t1, s10, s6
                  srli         s3, ra, 27
                  rem          ra, t1, t1
                  rem          a0, ra, a4
                  slli         a3, t1, 20
                  addi         s6, s11, 634
                  slli         s0, s2, 4
                  xor          t3, s11, t5
                  srli         s0, ra, 18
                  nop
                  xori         s2, s5, 821
                  srai         s10, a4, 2
                  fmax.s       ft8, fs5, ft5
                  sll          gp, a6, s8
                  fcvt.s.wu    ft6, t6
                  mulhsu       a1, a0, a1
                  fcvt.s.w     fs8, s4
                  and          t3, a0, s6
                  fmv.w.x      fa0, t6
                  fclass.s     zero, fs10
                  fmul.s       fs6, fs10, fs3
                  fsub.s       fs1, ft7, fs6
                  div          s6, s0, t5
                  and          ra, s1, s11
                  and          s5, s5, tp
                  fsqrt.s      ft7, fs5, rtz
                  fsgnjn.s     ft1, fs6, ft9
                  slli         s4, t6, 16
                  fsgnj.s      fs5, fs1, fs5
                  xori         gp, zero, -916
                  sra          a1, s8, s6
                  fcvt.w.s     a4, ft2, rup
                  fsgnj.s      fs0, fa7, fs1
                  mulhsu       a7, s11, s2
                  auipc        t6, 32799
                  flt.s        tp, fa3, ft1
                  xor          a6, a3, s4
                  andi         zero, tp, 1489
                  slt          sp, s1, t0
                  lui          a1, 256560
                  fmin.s       fs9, fs5, fs9
                  fmv.x.w      s4, fs4
                  divu         s4, s2, s7
                  mulh         s9, s1, s2
                  andi         s0, s9, 226
                  remu         a7, s1, t6
                  mulhsu       s1, t1, s7
                  mulhsu       a2, a0, a0
                  fcvt.w.s     s1, ft6
                  sltiu        ra, s10, -1296
                  and          s8, s2, s0
                  fsgnjn.s     fa1, fa5, fs5
                  fsub.s       fs3, ft9, fs6, rmm
                  sll          s10, s11, a1
                  fdiv.s       fs11, fs10, ft5
                  fclass.s     a2, ft9
                  slli         s11, t0, 3
                  slt          ra, s8, t1
                  or           t6, gp, s9
                  slti         tp, ra, 1780
                  fsgnj.s      ft5, fa3, ft2
                  fmax.s       ft11, fa7, fa6
                  mulh         s3, zero, ra
                  addi         s11, t0, 1518
                  flt.s        a0, ft3, fs8
                  xor          s11, gp, a1
                  slli         ra, t2, 17
                  fmv.x.w      s5, fs1
                  fsgnjn.s     fs10, ft3, fs4
                  sltiu        a6, s2, -1601
                  lui          a6, 173812
                  fmv.x.w      ra, fs8
                  rem          s1, a2, sp
                  sra          gp, s11, t0
                  srl          t3, a5, s10
                  or           t4, t0, t4
                  lui          s5, 860802
                  add          ra, s5, s4
                  slti         t4, a2, -1425
                  slli         gp, ra, 4
                  add          s1, s4, t0
                  sltiu        a6, a7, 433
                  sltu         s10, s9, ra
                  fsgnjx.s     fs11, fs4, fs10
                  div          t2, t4, s2
                  sra          a2, s5, a7
                  mulhu        s2, s1, a7
                  fsgnjx.s     ft0, ft0, ft7
                  fmax.s       ft5, ft6, fs5
                  fadd.s       ft6, fa0, ft8, rdn
                  xor          s2, a1, t6
                  feq.s        t1, ft2, fa1
                  fmax.s       fs6, ft1, fs11
                  rem          s9, a6, a6
                  fcvt.wu.s    ra, fs0, rup
                  div          s3, s10, t0
                  fcvt.s.w     fa7, ra
                  slli         gp, a3, 14
                  fmv.w.x      fs8, a2
                  mul          s3, a6, t6
                  feq.s        s11, ft9, fs6
                  sll          a1, a6, s5
                  addi         a5, a3, -119
                  fsub.s       fa3, ft4, ft1, rtz
                  slli         s10, t4, 30
                  or           a0, a2, ra
                  flt.s        s10, fs9, ft10
                  mulhu        a7, t3, s2
                  fcvt.wu.s    a1, fa2, rtz
                  fmin.s       fs9, fs4, ft0
                  fcvt.wu.s    sp, fa5, rmm
                  divu         t6, a0, t5
                  fsgnj.s      fs4, fs6, ft3
                  or           t4, s0, a4
                  fcvt.s.wu    ft11, sp
                  fcvt.w.s     t6, fs4
                  mul          s3, s6, s8
                  sltu         tp, s10, tp
                  fle.s        s0, fa5, ft11
                  fle.s        a3, ft5, ft4
                  addi         t6, t6, 273
                  sll          t1, s2, a5
                  mulhsu       s10, a3, s4
                  srl          a5, s3, tp
                  nop
                  fdiv.s       fs10, fs3, fs2
                  nop
                  fmin.s       fs2, ft8, ft8
                  fmax.s       ft10, ft2, fs1
                  xori         s1, s6, -547
                  slti         tp, s6, 900
                  addi         s3, ra, 80
                  fmax.s       fs6, ft1, fa0
                  fsgnj.s      ft0, fa1, fs11
                  srli         a7, t1, 19
                  add          gp, t5, s7
                  sltiu        t1, t3, -2031
                  ori          s8, ra, -245
                  or           sp, s2, s8
                  fsgnjn.s     fs1, fs7, ft0
                  flt.s        s6, fa4, ft2
                  mul          t1, ra, a1
                  fmul.s       fa3, fa5, ft3
                  auipc        a5, 979353
                  fmv.w.x      fa6, a6
                  fclass.s     t2, ft5
                  mulhu        a6, s2, t1
                  xor          a7, t2, s3
                  fcvt.wu.s    a3, ft10, rtz
                  sub          a1, s6, ra
                  and          s0, t5, a3
                  sll          s8, a7, ra
                  srl          sp, s6, a0
                  and          a1, zero, t5
                  srli         s4, s0, 17
                  fsub.s       fs3, fs7, ft5, rtz
                  fcvt.w.s     a7, ft10
                  fadd.s       fa0, fa7, fs4, rne
                  fcvt.s.w     ft4, t3, rmm
                  or           s11, gp, gp
                  srai         a2, s1, 20
                  fmul.s       fs4, fs2, ft11
                  divu         a3, s6, gp
                  srli         a3, s6, 21
                  fcvt.w.s     s8, fs0, rup
                  mulhsu       a4, t2, tp
                  fmul.s       ft5, ft11, ft5
                  slli         t2, t0, 18
                  srai         t2, s9, 6
                  rem          s1, a0, a6
                  xori         a3, t0, 1836
                  div          s10, s8, zero
                  fcvt.s.wu    fa2, s11
                  and          t2, t1, s10
                  fsgnjn.s     ft5, fa0, fs10
                  fclass.s     s11, fs10
                  fmv.x.w      t1, fa4
                  sra          gp, s0, s7
                  fclass.s     a6, ft1
                  auipc        tp, 688326
                  sra          a7, s6, a4
                  sltu         a1, s3, ra
                  remu         s6, ra, a7
                  fsub.s       ft9, ft9, ft2
                  fcvt.s.w     fa6, ra, rtz
                  fcvt.w.s     sp, fs3
                  remu         s2, t6, s3
                  mul          gp, ra, a1
                  fsgnjn.s     fs7, fs0, ft9
                  fle.s        gp, ft6, fa1
                  or           t4, s8, a0
                  slt          ra, s11, a1
                  fsgnjn.s     ft5, ft0, fa6
                  fcvt.wu.s    t6, ft6
                  mulhsu       s0, t4, s8
                  fsqrt.s      fa1, fs10
                  and          a0, s0, t1
                  and          tp, a2, s3
                  div          s9, s10, gp
                  fmul.s       fa0, fs3, ft7, rne
                  and          s11, sp, a3
                  fmv.w.x      fs1, s6
                  fsub.s       fs10, fs6, ft4
                  flt.s        zero, fa3, ft2
                  sltiu        s1, s7, -1038
                  fclass.s     s1, fa7
                  fsqrt.s      ft6, fs3
                  div          s1, sp, s1
                  fmul.s       fa4, fa1, fa3, rdn
                  fcvt.s.wu    ft1, t6
                  add          t6, t0, t4
                  flt.s        s9, fs8, fs0
                  fcvt.s.w     ft4, a6
                  sll          t4, s5, a7
                  fadd.s       fs1, ft0, fa4
                  fmv.w.x      ft0, s6
                  rem          s9, a1, a1
                  fmv.x.w      s3, fa6
                  sub          t4, ra, a1
                  mulhu        a3, a0, tp
                  fmax.s       fa2, fs6, fa1
                  addi         s6, t4, 638
                  fcvt.wu.s    t6, fa3
                  fmin.s       fa2, ft0, fs1
                  fmv.x.w      t1, ft5
                  sub          a2, s11, sp
                  div          t3, t5, s1
                  nop
                  sltiu        s11, t4, -1970
                  srli         s9, s7, 18
                  fdiv.s       fs0, fa3, ft10, rmm
                  fmv.w.x      fs4, sp
                  fmin.s       fs9, ft0, fs5
                  fcvt.wu.s    s3, fs11
                  srli         gp, sp, 22
                  fmin.s       fs10, ft9, fs3
                  divu         zero, zero, s7
                  lui          s2, 825175
                  fmul.s       fs11, ft7, ft0, rdn
                  sltiu        t6, s1, 674
                  sra          t2, s3, s8
                  addi         a6, s0, -1948
                  auipc        t2, 964839
                  fcvt.s.w     fs8, t3, rup
                  and          t4, a6, s11
                  mul          s9, s7, t4
                  fcvt.s.wu    ft11, s4, rdn
                  sltiu        ra, zero, 2002
                  fcvt.s.w     ft6, t2
                  fcvt.s.w     ft3, a2, rdn
                  slli         a0, s6, 18
                  mulhsu       a6, s6, a1
                  andi         s5, t2, -1839
                  mulh         a3, t5, ra
                  fsqrt.s      ft5, fs0
                  sub          a5, zero, s5
                  xor          s1, s3, s9
                  lui          s9, 516
                  div          a0, a7, a7
                  mulhsu       s3, t5, s0
                  srli         s11, t5, 23
                  rem          s10, sp, a1
                  fmax.s       fs8, ft11, fs2
                  sll          t3, t1, s2
                  xori         a4, gp, 739
                  fadd.s       ft4, fs2, ft3, rdn
                  slt          a0, t2, t2
                  feq.s        s6, fs5, fs4
                  auipc        s9, 697311
                  fclass.s     s11, ft3
                  remu         tp, s4, s0
                  xori         t1, a3, -2004
                  fcvt.w.s     s1, ft9, rtz
                  fmul.s       fs2, fa4, fs8, rtz
                  slt          zero, t3, s1
                  slti         a0, a5, -699
                  ori          s10, t3, -1912
                  fcvt.w.s     s0, ft2, rdn
                  sltiu        s6, t5, -1291
                  nop
                  fcvt.s.w     fs4, a1
                  fsgnjx.s     fs2, fs10, ft3
                  lui          a1, 232511
                  srl          s2, a6, a1
                  auipc        sp, 414434
                  rem          sp, a0, s1
                  fcvt.wu.s    s0, fa5
                  fcvt.s.w     fa4, a2, rtz
                  srai         sp, t2, 29
                  andi         zero, gp, 1600
                  fcvt.wu.s    a7, ft10, rtz
                  and          t3, t2, ra
                  or           a7, t5, t1
                  sltiu        t1, a5, 2041
                  fmul.s       ft6, ft11, ft11, rmm
                  xor          t6, s6, a2
                  srai         zero, t1, 5
                  fmax.s       fs2, fs10, fs1
                  sra          a0, a3, s4
                  slt          a7, s6, s4
                  and          ra, sp, s5
                  slt          t6, t3, t1
                  fmax.s       fs2, ft10, ft0
                  lui          s3, 362702
                  fmin.s       fs2, fs5, ft11
                  slti         s2, ra, 1178
                  andi         s0, s2, -1378
                  sltiu        s0, t3, 358
                  fle.s        a6, fs0, fs10
                  or           s2, ra, s1
                  slti         s11, s5, 1996
                  srl          t3, a4, s8
                  xor          a3, s10, s2
                  div          t3, a6, zero
                  fmax.s       fs0, fs7, fa7
                  fsgnj.s      fa6, fs1, fs9
                  sra          s0, a6, s11
                  srai         t6, a7, 3
                  slt          a5, s2, a1
                  fmin.s       fs5, ft3, fa6
                  andi         a5, s2, 1187
                  auipc        a6, 343703
                  divu         sp, t3, a6
                  auipc        t3, 589305
                  sra          a7, s3, s8
                  mulhu        a7, a7, ra
                  fmul.s       fs11, ft6, ft10, rdn
                  fle.s        s10, ft0, fs5
                  fle.s        a4, ft9, fa1
                  fcvt.s.wu    ft3, a7
                  sltiu        zero, s2, 1713
                  fmax.s       fs5, fs8, fs1
                  flt.s        a6, fa4, fa3
                  feq.s        a0, fs9, fs3
                  nop
                  divu         s6, s7, s4
                  remu         s5, t4, t2
                  fmv.x.w      s4, fs11
                  fadd.s       ft8, fs4, ft10
                  fclass.s     t3, fs1
                  fsgnj.s      fs10, fa3, fs2
                  feq.s        t4, ft1, fa4
                  fadd.s       ft4, fa7, ft7
                  fmin.s       ft2, fs0, ft0
                  remu         a3, s3, a3
                  fsqrt.s      fs8, fa2, rmm
                  or           t2, s5, s9
                  mulhsu       t6, s0, t6
                  slti         a4, s3, -793
                  fmax.s       fs5, ft7, ft9
                  fmul.s       ft7, fa3, ft2, rdn
                  nop
                  fle.s        s3, ft1, fs3
                  addi         a1, gp, 1959
                  and          a3, a4, s4
                  xor          zero, t1, a4
                  fmv.x.w      s2, ft9
                  xori         ra, gp, 1026
                  fcvt.w.s     s9, fa7, rtz
                  mulhsu       zero, s6, a3
                  xori         a7, s0, 1398
                  slti         a4, t3, 1525
                  slt          t1, zero, sp
                  sll          s10, tp, a1
                  fmin.s       fs1, fs3, fs10
                  srai         s10, s0, 0
                  mulh         sp, s7, a6
                  srli         ra, t2, 19
                  flt.s        t4, fs10, ft6
                  fsgnjx.s     fa1, fa3, fs4
                  auipc        s10, 68580
                  flt.s        s3, ft11, fa5
                  divu         s8, a1, a3
                  divu         a3, t5, t3
                  fmv.x.w      a5, ft11
                  sll          s11, sp, t2
                  fsub.s       ft2, fs0, fs10, rdn
                  fmul.s       fs3, fs3, ft9
                  srl          sp, ra, s4
                  xor          ra, s3, s11
                  divu         a4, a2, a2
                  slti         a2, t1, -712
                  slt          s2, zero, gp
                  slli         a3, s9, 31
                  fmax.s       ft2, fs1, fs8
                  fmv.x.w      a4, ft1
                  mulhu        t3, t6, s6
                  feq.s        s6, ft2, fs1
                  sub          t4, s0, a7
                  xor          a0, ra, a4
                  addi         a1, s0, -86
                  rem          a1, a6, ra
                  feq.s        t4, fa0, fa0
                  fle.s        s4, ft7, fs6
                  srli         tp, s4, 16
                  nop
                  and          s5, s2, a5
                  srli         s5, a5, 9
                  srai         t3, ra, 20
                  srl          s1, gp, t5
                  slli         a7, a1, 15
                  mul          s9, a6, a0
                  sll          sp, gp, ra
                  sll          s2, s5, a2
                  sltiu        sp, tp, -1745
                  ori          s8, a2, -1233
                  fsgnjx.s     fa5, fa1, ft4
                  fsqrt.s      fs8, fs11
                  fmv.x.w      a7, ft11
                  fcvt.s.wu    fs4, a2
                  fmin.s       fs6, fs3, fs5
                  fcvt.w.s     s8, fs11
                  fcvt.s.wu    fs11, s8
                  div          a4, ra, t5
                  xori         a6, s11, -1452
                  fdiv.s       fs10, fa7, fa0, rdn
                  addi         t4, s4, -1496
                  divu         tp, s1, s11
                  mulhu        zero, gp, a6
                  remu         a2, a5, t1
                  fadd.s       ft9, fa6, fa3, rup
                  slli         a6, s11, 3
                  srai         s6, t6, 14
                  divu         s4, gp, a3
                  lui          s6, 72788
                  mulhu        a5, s4, t6
                  fadd.s       fa3, fs6, fa1
                  mulhu        a7, a7, s8
                  xori         s8, a6, -1839
                  fsgnjx.s     ft3, fa0, fa6
                  or           s2, t2, s6
                  sltiu        s2, t4, -1175
                  or           s10, s6, s10
                  fsgnj.s      ft5, ft8, ft4
                  srli         t4, a1, 28
                  fmv.x.w      s11, ft2
                  mulh         s3, a7, a1
                  mulhsu       a3, a0, s8
                  slti         a4, ra, 1955
                  fsgnjn.s     fa3, ft7, ft1
                  mulhsu       sp, a0, s5
                  xori         a7, s8, 1569
                  fmin.s       fs11, ft6, ft11
                  fadd.s       fs10, ft3, ft7, rmm
                  sll          sp, zero, a2
                  slt          t2, a0, a2
                  sub          gp, s5, a7
                  mul          s2, tp, s5
                  srai         s0, t6, 26
                  fadd.s       ft9, fs3, ft3, rne
                  fsqrt.s      fa3, fs4
                  and          t1, a0, sp
                  flt.s        ra, fs10, ft9
                  fcvt.s.w     ft11, s8, rne
                  srl          zero, s7, a0
                  fsgnjn.s     ft8, ft2, fa4
                  fle.s        t4, fa7, fs2
                  auipc        sp, 480635
                  divu         tp, s2, s0
                  fsqrt.s      fa2, fs4
                  andi         sp, s4, -801
                  fsqrt.s      ft11, fa6
                  fsgnjn.s     fa2, fs0, fa6
                  lui          a7, 781019
                  mul          t1, t3, t1
                  div          s6, zero, tp
                  fmv.x.w      s11, fa7
                  fclass.s     a2, fa0
                  rem          t1, s11, a3
                  fcvt.s.wu    ft3, ra
                  fcvt.wu.s    a3, ft2
                  fsgnj.s      ft6, ft3, fa0
                  fmv.x.w      sp, ft2
                  fsgnjx.s     fs10, ft2, fs4
                  fcvt.wu.s    s5, ft6, rmm
                  fclass.s     ra, fs8
                  fmv.w.x      fs11, s6
                  fdiv.s       fa4, fa3, fa6, rtz
                  srli         gp, gp, 1
                  fsqrt.s      ft9, ft5
                  xor          s8, s10, s6
                  mulh         zero, s0, s5
                  remu         tp, sp, t1
                  slti         t3, sp, -142
                  fcvt.s.w     fs5, t6, rne
                  flt.s        zero, ft6, ft10
                  slt          a5, t6, s5
                  remu         s11, s5, a6
                  nop
                  nop
                  rem          a6, s6, zero
                  slti         a4, t0, 1116
                  lui          gp, 315955
                  feq.s        zero, ft8, fs5
                  sub          s5, s1, a1
                  div          tp, t4, t0
                  srai         s6, gp, 0
                  auipc        ra, 275233
                  add          gp, a5, s10
                  fcvt.s.w     fs7, s2
                  slti         s4, s6, 396
                  nop
                  srl          t4, t3, a0
                  feq.s        a2, ft5, fs6
                  add          t1, t0, t2
                  slt          a3, s10, a2
                  xori         a5, a5, 1909
                  fadd.s       ft5, fs11, ft0
                  ori          a6, s6, -536
                  divu         a1, s6, sp
                  fdiv.s       ft3, ft8, ft11
                  auipc        a2, 43843
                  andi         t4, a4, 1799
                  fclass.s     s0, ft4
                  slti         s3, a6, 610
                  remu         a4, sp, s4
                  fsqrt.s      ft1, fs8
                  addi         tp, t4, -298
                  divu         ra, t4, s5
                  fle.s        a7, fa6, fs9
                  addi         t2, zero, -922
                  fmul.s       ft5, fs0, ft6
                  fsgnjx.s     fa1, fa3, fs1
                  fmv.x.w      a6, ft5
                  fmv.w.x      ft10, a2
                  fdiv.s       ft3, ft4, fa0, rtz
                  ori          s0, s2, -2002
                  fcvt.s.wu    fs6, s10, rtz
                  fmv.x.w      ra, ft5
                  mulhu        a3, s5, t0
                  addi         t2, s3, -913
                  slt          s8, tp, t5
                  sra          t3, a5, a5
                  fcvt.wu.s    s9, ft1
                  remu         gp, gp, s11
                  fle.s        s8, ft4, ft11
                  ori          a4, a4, 749
                  fcvt.s.wu    fa2, gp
                  sub          a0, ra, t1
                  ori          s2, a1, 1152
                  fclass.s     a3, fs8
                  or           s6, a5, s0
                  sll          a2, zero, s11
                  sltiu        t6, a2, -868
                  fsqrt.s      fs6, ft6, rtz
                  fmul.s       ft4, fs4, ft1, rne
                  srl          gp, s6, s9
                  add          a0, s7, a2
                  srai         s0, s6, 21
                  addi         a2, gp, 448
                  xor          ra, t6, t4
                  sltu         sp, a3, t3
                  sub          s5, tp, a5
                  mul          ra, s10, a5
                  and          t3, gp, s6
                  fadd.s       fs1, fa3, ft11, rmm
                  nop
                  divu         a0, s5, t4
                  lui          a7, 861060
                  mulh         zero, s9, s4
                  sltu         a7, s3, s6
                  fsgnjn.s     fs6, ft4, ft5
                  fsub.s       ft10, ft10, fs9
                  srli         a2, a4, 7
                  srai         t3, t2, 28
                  ori          t2, s11, 1395
                  fmv.x.w      s1, fs4
                  and          a4, t1, a7
                  fclass.s     t1, ft7
                  addi         t3, a4, 521
                  fcvt.w.s     t1, ft8, rtz
                  fcvt.wu.s    a7, ft4
                  sltiu        s2, a4, -1489
                  mul          s1, a7, t1
                  slli         s11, s0, 1
                  mul          a6, t5, s10
                  fclass.s     a1, ft5
                  addi         a6, s3, 388
                  or           t6, t6, s11
                  fsgnj.s      ft8, ft3, fs7
                  fdiv.s       ft7, fa2, ft4
                  sub          s4, a7, t6
                  sra          s2, a5, s5
                  fdiv.s       fs3, fa3, ft1
                  sra          a5, t3, t3
                  lui          s5, 245338
                  fmul.s       fa7, ft8, fs1
                  slli         t2, a4, 5
                  sra          t6, ra, s9
                  fsgnjn.s     fa3, fs4, ft1
                  fsgnjn.s     fs11, ft3, fa1
                  xor          a6, s8, s1
                  fle.s        sp, fs1, ft0
                  flt.s        a2, fs2, ft8
                  andi         a2, s6, -1247
                  remu         s10, a1, tp
                  xor          s9, s0, a2
                  fsqrt.s      fs10, fs8, rmm
                  sub          s6, a1, a4
                  slti         s8, tp, 80
                  fclass.s     a2, fs6
                  fclass.s     s10, fa0
                  feq.s        sp, fs9, ft11
                  fadd.s       ft11, fa1, fa3, rne
                  fsgnjn.s     ft6, ft5, fs8
                  slli         tp, t3, 31
                  rem          a5, a4, a0
                  xori         a7, a0, 1091
                  ori          a1, a4, -199
                  div          s9, ra, s1
                  andi         s8, s7, -290
                  remu         t4, s3, zero
                  fmv.w.x      fa3, a3
                  fmul.s       fa5, fs2, fs7
                  fsgnj.s      fs7, ft11, ft9
                  fadd.s       fs5, fa0, fs0, rup
                  srai         s8, a0, 10
                  slti         s10, a0, 1800
                  addi         a6, t5, 210
                  fclass.s     s6, ft8
                  sltu         s2, t2, s3
                  sltiu        s2, s6, -54
                  sll          t1, s4, s3
                  lui          t6, 867369
                  fmax.s       fs10, ft5, fs10
                  fsqrt.s      ft10, ft9
                  fcvt.s.w     fa7, s10, rdn
                  fcvt.wu.s    s5, ft9, rne
                  fdiv.s       fs3, fs5, ft3
                  fdiv.s       fs0, fs5, fs11
                  srl          s5, t5, sp
                  fsub.s       fa7, fs0, fa6
                  rem          a4, s1, s7
                  slti         a2, tp, 1422
                  fmax.s       fs10, ft0, ft1
                  add          ra, t2, s7
                  slti         s5, a0, -566
                  sra          t3, t6, a2
                  slli         a7, t5, 10
                  mulhsu       sp, a2, s9
                  srai         t1, t4, 22
                  flt.s        s1, fs11, ft0
                  slt          a3, s11, ra
                  fle.s        t1, fa0, fa4
                  div          s10, a3, t2
                  add          t3, s9, s7
                  remu         tp, sp, s4
                  nop
                  xori         gp, s1, 1334
                  mulhsu       s4, s9, s6
                  auipc        t3, 759815
                  fmv.w.x      ft2, t3
                  nop
                  fsub.s       ft8, fs7, fs6
                  add          sp, t5, zero
                  andi         s0, s0, -1514
                  fcvt.s.wu    fa5, s6
                  rem          t3, sp, t4
                  srl          s8, a1, t4
                  add          t4, sp, s5
                  fsgnjn.s     ft8, ft11, fs4
                  div          s0, t2, s0
                  xor          s10, s3, t5
                  srli         s1, t3, 10
                  ori          s10, sp, -1314
                  fmax.s       fs5, fa7, fa7
                  sll          t1, a3, s10
                  sltiu        s1, a6, -1541
                  xor          a0, a2, s2
                  divu         a7, s6, a3
                  fcvt.s.w     ft8, sp, rdn
                  fcvt.s.w     ft1, s9, rtz
                  and          s0, zero, s4
                  slti         a3, s8, 517
                  fclass.s     s8, fs3
                  fcvt.wu.s    ra, fs0
                  sra          tp, a0, s1
                  fdiv.s       ft9, ft2, fa0, rne
                  fmax.s       ft5, fs11, fa3
                  fmv.x.w      t4, ft1
                  andi         a3, s9, 680
                  flt.s        t6, fs3, fs0
                  xor          s1, s11, s11
                  srai         s4, sp, 4
                  fsgnjn.s     fa6, fs5, fa5
                  srli         s2, a0, 30
                  sra          s8, gp, s3
                  fcvt.s.wu    fa5, s11
                  rem          s9, s6, a2
                  srai         sp, s11, 1
                  sll          a0, a1, s8
                  fmul.s       fs10, ft5, fs11, rtz
                  mul          s1, t5, t2
                  srli         t6, s5, 15
                  addi         t1, a0, 1469
                  xor          ra, s3, t3
                  sra          a2, s4, a2
                  fmv.x.w      s2, fa7
                  fmul.s       ft9, fs11, ft9, rdn
                  ori          gp, a0, 724
                  fmul.s       fs5, fs8, fs6
                  xori         s0, t6, -1158
                  fcvt.w.s     a2, fa2
                  divu         tp, s10, t3
                  xor          t1, s11, s2
                  srai         a0, t3, 19
                  auipc        a5, 403385
                  rem          a2, tp, gp
                  mul          a3, s0, s9
                  mulhsu       a7, gp, a3
                  flt.s        s4, ft10, ft5
                  srl          s5, t3, a2
                  fsgnj.s      ft8, fs8, fs1
                  flt.s        s3, fs2, fs3
                  fclass.s     s0, fa0
                  mulh         s10, s5, a3
                  rem          a0, s11, a6
                  addi         t1, a5, -192
                  and          s6, t4, tp
                  fadd.s       fa3, ft9, fs6
                  fcvt.s.w     ft3, t2, rup
                  fadd.s       ft5, fs10, ft10
                  rem          a7, t0, t1
                  divu         t3, s6, ra
                  andi         sp, a5, 938
                  fsub.s       ft3, ft8, fa5
                  feq.s        t3, fs8, ft9
                  mulhsu       s1, s8, a5
                  or           t2, a7, s10
                  mulhu        t4, s8, t5
                  fcvt.wu.s    a0, ft2
                  mulhu        s6, s7, t3
                  mul          tp, a0, s3
                  sll          s2, gp, t6
                  nop
                  sltu         t1, s7, s10
                  sltiu        gp, t0, -1462
                  rem          s8, t0, s8
                  feq.s        t3, ft3, fs1
                  fsub.s       fs10, fs10, ft11, rtz
                  feq.s        s9, ft6, fs11
                  mulh         a5, s9, s7
                  nop
                  fdiv.s       fs1, fs4, ft1, rtz
                  sra          sp, gp, s10
                  fsub.s       ft4, fs7, fs9
                  ori          s2, zero, 378
                  andi         t3, sp, 2043
                  fmin.s       fa1, fa5, fa3
                  fcvt.s.w     ft9, ra
                  slti         t3, s8, 1933
                  fadd.s       ft4, fs5, ft11
                  sltiu        s2, a2, -1216
                  andi         s3, t4, 1688
                  fmv.x.w      s8, fs2
                  nop
                  fmv.w.x      ft6, s3
                  remu         s6, sp, a4
                  fsub.s       ft10, ft4, fa0
                  fmv.x.w      s4, ft4
                  div          a3, t3, a2
                  addi         a2, t1, -901
                  fmv.w.x      fs11, s2
                  divu         t2, a7, s6
                  auipc        a1, 1019908
                  fcvt.w.s     s0, ft2, rne
                  fdiv.s       ft0, ft11, ft0
                  fmax.s       ft8, fs5, fs6
                  sub          t6, a0, a4
                  slti         gp, s8, -377
                  fcvt.wu.s    t3, fs11, rne
                  fsqrt.s      fa4, fa1, rmm
                  div          a5, s3, a0
                  or           a0, a1, t4
                  add          t4, ra, a1
                  fdiv.s       fs11, ft7, fa3, rdn
                  div          a7, s1, s10
                  fcvt.wu.s    t1, ft2, rup
                  sra          a3, zero, t6
                  srl          a3, a7, s2
                  sltu         t2, tp, gp
                  fsqrt.s      fs8, fs10, rne
                  fmv.x.w      s4, fs6
                  fmax.s       fa1, fs5, ft6
                  remu         s8, ra, s4
                  fsub.s       ft9, fa4, fs0, rdn
                  slt          s5, t2, t3
                  fsgnj.s      fs5, fa0, fa1
                  slti         a7, a5, 545
                  div          s10, a6, gp
                  fsgnj.s      ft4, ft11, ft8
                  sll          s1, s9, a1
                  flt.s        zero, ft9, ft10
                  slti         t2, s10, 667
                  mulhu        a7, t3, s6
                  addi         a6, s10, 1049
                  add          s8, t4, s7
                  srl          s6, s11, a2
                  div          s1, sp, s8
                  slli         t6, s4, 14
                  fdiv.s       fs0, fa4, ft6
                  auipc        zero, 654316
                  fadd.s       fs1, fa0, fs10
                  nop
                  rem          a6, a2, t6
                  fle.s        s10, ft7, fs3
                  srli         a2, t3, 8
                  srli         t2, t1, 31
                  mulh         a1, t3, s3
                  xori         a3, s9, -2001
                  mulhu        gp, ra, a5
                  fmax.s       ft1, ft11, ft1
                  fsqrt.s      ft0, ft10
                  fsgnj.s      fs11, fa2, ft9
                  feq.s        s9, ft2, fs7
                  srai         s6, t6, 11
                  fmin.s       ft0, fs3, fs9
                  mulhu        s6, t5, ra
                  fdiv.s       fa4, fs4, ft10
                  divu         zero, t4, s7
                  nop
                  srl          a6, s1, zero
                  sltu         a2, t1, a6
                  xor          t2, t4, t6
                  fmax.s       fs2, ft1, fa0
                  fsub.s       ft2, fs3, ft8, rup
                  addi         s5, s2, 1279
                  fclass.s     zero, ft0
                  divu         a6, s7, a7
                  xori         a4, s3, 633
                  mulh         s10, s0, s11
                  andi         s2, a0, 965
                  feq.s        s6, ft0, ft7
                  div          t2, gp, s10
                  fmin.s       fs4, ft9, ft3
                  add          s1, ra, t2
                  slli         tp, tp, 0
                  fmax.s       fs10, ft1, fs3
                  fsqrt.s      fs11, fs4, rmm
                  fcvt.s.wu    fs5, t0
                  fmul.s       fs1, ft3, fa7
                  sltu         ra, s8, s2
                  fmv.x.w      t1, fs7
                  fcvt.wu.s    s9, ft11
                  fsub.s       fs3, fs7, fa5, rtz
                  mul          t2, s2, s3
                  sub          s11, t1, s9
                  mulhsu       a2, s4, a4
                  fsgnjx.s     fa5, fa1, fs0
                  fmv.w.x      fs0, t2
                  fsub.s       fs3, ft6, ft11, rne
                  fcvt.w.s     a4, ft5, rne
                  fcvt.wu.s    t6, fs5, rmm
                  div          s5, a0, s10
                  mulhsu       a4, t6, t4
                  or           t6, s6, s2
                  remu         t2, s7, s9
                  feq.s        s0, ft8, fs6
                  add          s9, t4, a0
                  mulhu        tp, a5, s4
                  fcvt.s.w     fs3, t5, rmm
                  addi         s6, s8, 1607
                  divu         a4, t5, s9
                  or           s8, t6, a0
                  fsub.s       ft10, fa0, fs7
                  slli         s6, sp, 15
                  sll          a7, t5, t2
                  srl          a0, s11, a4
                  fmv.x.w      a7, ft2
                  fsgnj.s      fa4, fs0, fs6
                  div          t6, t3, s1
                  nop
                  slt          s1, a2, s9
                  fcvt.wu.s    s9, fa5, rne
                  xori         a6, a0, -1073
                  div          a1, t0, t6
                  and          s11, a7, s2
                  slt          s0, a7, s2
                  nop
                  mul          a0, a3, a0
                  fmv.w.x      ft8, zero
                  srai         t6, s1, 17
                  fle.s        s5, fs1, fs9
                  fcvt.s.wu    ft8, s3
                  nop
                  fsgnjx.s     fs5, fs10, ft11
                  xori         tp, s10, -1488
                  mulhsu       s11, s3, a0
                  slli         zero, t2, 8
                  srai         a6, a5, 7
                  mulhu        s6, s11, t5
                  xori         s9, s1, 634
                  remu         s6, ra, gp
                  fclass.s     t3, fs6
                  andi         s5, s4, -2032
                  fsub.s       ft4, ft6, fa1, rup
                  fcvt.wu.s    s9, fa1
                  mulhu        a7, zero, s10
                  sra          s6, tp, s6
                  mul          s11, a1, a7
                  fmul.s       fs10, fs3, fa7
                  slt          s2, s1, t3
                  srl          t4, a1, t6
                  fcvt.s.w     fa3, s1
                  mulh         ra, s3, s1
                  fmax.s       fa3, fs8, ft0
                  feq.s        a4, ft1, fa2
                  srli         t4, t5, 9
                  fdiv.s       fs3, ft7, ft3, rdn
                  flt.s        t2, fs5, fs0
                  lui          gp, 333515
                  fsgnjx.s     fa4, fs5, fs0
                  sltiu        a2, a0, 371
                  divu         s6, t0, gp
                  xor          a5, s10, gp
                  fsub.s       fa5, fs6, ft0
                  nop
                  slti         a7, s8, -1557
                  fsqrt.s      ft10, fs1
                  rem          s4, a5, s5
                  sra          s0, a6, s10
                  xori         s3, zero, -331
                  remu         a0, s11, s5
                  addi         zero, t0, 552
                  sra          t3, t3, a7
                  remu         s5, a6, t2
                  addi         s10, a7, 205
                  fcvt.wu.s    s9, ft11
                  sra          t1, s4, s10
                  or           a0, t0, a0
                  fsqrt.s      ft9, ft8
                  ori          t1, t4, -1272
                  sltu         s8, t3, s4
                  addi         t2, tp, 620
                  sll          a4, s0, a5
                  fcvt.s.w     fs5, s1, rup
                  divu         a0, zero, a4
                  slt          t1, s5, s5
                  fcvt.s.wu    fa6, tp
                  ori          a2, a6, -460
                  fcvt.w.s     t6, ft2, rtz
                  sra          s9, t2, tp
                  add          t2, a7, s7
                  fmax.s       fa4, fa0, fs10
                  fmul.s       ft9, fa0, fs6, rtz
                  slli         a6, gp, 9
                  srl          sp, gp, a0
                  sltu         tp, t1, a2
                  sltu         a0, tp, t6
                  auipc        tp, 436911
                  fcvt.w.s     a6, fa4
                  divu         t3, a5, tp
                  sub          a5, t6, t4
                  fdiv.s       fa1, fs6, fs0, rup
                  fsgnjn.s     fs11, ft2, ft0
                  fclass.s     s9, fa0
                  slli         gp, t4, 6
                  slli         s3, t3, 23
                  fmax.s       ft7, ft4, fa4
                  fle.s        sp, fs5, fs10
                  sub          a2, s2, t1
                  lui          gp, 246734
                  fcvt.w.s     s5, ft10, rmm
                  fle.s        ra, fs8, ft2
                  or           s11, a6, s10
                  fmv.w.x      ft8, s11
                  fsqrt.s      ft0, fs10
                  fdiv.s       ft1, fa5, fa3, rup
                  sltiu        t6, t2, 1187
                  sub          s1, gp, a4
                  andi         s11, gp, 250
                  fmax.s       fs0, ft6, ft0
                  xori         tp, s6, 1768
                  fcvt.s.wu    fs1, s6, rup
                  flt.s        s11, fs5, ft7
                  nop
                  divu         t2, gp, ra
                  andi         s11, t0, -149
                  sra          t6, tp, s0
                  sltiu        t6, a4, 2025
                  slt          s5, gp, s4
                  slti         s6, a2, 1916
                  add          t1, s7, a5
                  fsgnj.s      ft9, fs6, fs10
                  fcvt.w.s     s6, fs5
                  sltiu        a5, s2, -1002
                  andi         s5, tp, 1166
                  slti         tp, a0, -1505
                  fcvt.w.s     s11, fs4, rtz
                  nop
                  fsqrt.s      ft5, fa0
                  feq.s        a3, ft11, fa1
                  or           s8, s3, ra
                  srai         a5, s9, 14
                  sub          a1, sp, a2
                  fclass.s     a0, ft11
                  fclass.s     s2, fa1
                  lui          s11, 122846
                  rem          a1, s6, s5
                  sub          s9, s9, a4
                  fsgnjx.s     fs6, ft0, fs6
                  div          t1, s10, s1
                  fmul.s       fs1, fs6, fa6
                  fmv.w.x      ft7, s5
                  ori          tp, a0, -282
                  mulhu        a6, a1, t2
                  auipc        a3, 539124
                  sltiu        a5, s0, 961
                  fcvt.w.s     sp, fs4
                  nop
                  ori          sp, gp, -1492
                  flt.s        sp, ft2, fs7
                  fclass.s     a0, fs7
                  and          ra, s1, s1
                  fmax.s       ft11, fs11, ft4
                  fcvt.wu.s    a0, ft6, rup
                  fmin.s       ft8, fs3, fs8
                  fle.s        s10, ft10, fs5
                  nop
                  fsub.s       fa0, fa6, ft11
                  fmul.s       fs2, fs7, fs1
                  divu         s3, s7, s11
                  fadd.s       fs4, fs4, fa2, rup
                  fadd.s       ft7, ft5, ft9, rtz
                  fcvt.s.wu    fa1, s6
                  xori         a1, s9, 568
                  or           gp, s3, t4
                  xor          tp, a6, t6
                  slti         t1, a2, -72
                  slt          a7, gp, t1
                  flt.s        t6, fs4, ft8
                  fsgnjx.s     ft1, ft10, fs4
                  mulhsu       s9, s5, t3
                  lui          s5, 520466
                  remu         a5, s8, t2
                  mulh         ra, a2, t0
                  slt          ra, a2, s5
                  and          t4, s2, t0
                  mulh         a4, t3, s7
                  fadd.s       fs8, fs9, fa3
                  flt.s        sp, ft2, fa6
                  sltiu        a5, a1, 51
                  fsgnjx.s     ft8, ft6, fs2
                  sub          gp, s3, a1
                  srai         a3, sp, 24
                  lui          t4, 979577
                  fcvt.s.wu    fa6, sp
                  sltu         a7, a2, t2
                  fcvt.wu.s    s11, fs11
                  srli         a6, a7, 16
                  fcvt.w.s     sp, ft7, rdn
                  fsgnjn.s     ft1, fa4, ft0
                  feq.s        s4, ft11, fa6
                  sra          s9, ra, a4
                  slti         s8, s3, 2010
                  fsqrt.s      ft1, fs9, rne
                  srai         a4, a6, 9
                  andi         a5, s8, -1817
                  fdiv.s       ft2, ft1, fa2, rdn
                  divu         a7, gp, t5
                  fcvt.wu.s    s0, fa6
                  mulhsu       sp, s6, tp
                  lui          s6, 437453
                  fclass.s     t2, fa5
                  sub          a0, t0, gp
                  fcvt.wu.s    zero, fs1, rup
                  sub          s1, s10, a2
                  fmin.s       fs11, fa1, ft0
                  fmax.s       fs5, fa2, fs11
                  or           s4, zero, s6
                  add          t3, tp, a1
                  srli         zero, t6, 13
                  fsgnjx.s     fa4, ft1, fs1
                  fmv.x.w      s10, ft6
                  srai         t6, t6, 4
                  fcvt.s.w     ft2, a7, rne
                  slli         a5, t5, 24
                  mulh         s11, a2, a6
                  fsgnjx.s     fs2, ft7, fa4
                  fsgnj.s      fa4, fa3, fs4
                  fsgnjn.s     fs6, fs0, ft10
                  fsqrt.s      fa1, ft3, rne
                  sub          s8, gp, s6
                  fle.s        a4, fs1, ft7
                  srai         a4, t6, 28
                  fsgnj.s      fa4, fs6, ft5
                  fsqrt.s      fs7, fa6
                  slt          s0, t3, a1
                  sltu         a5, a2, t6
                  fcvt.w.s     a6, fs2, rtz
                  fmv.w.x      fs0, sp
                  lui          tp, 230953
                  fsgnj.s      fa0, fs10, ft10
                  sll          s10, a3, s6
                  remu         s0, t0, a1
                  fmv.w.x      ft3, t6
                  srai         s8, s6, 21
                  fmin.s       fa7, ft2, ft5
                  fmv.w.x      ft6, t1
                  slli         a7, s2, 17
                  or           a7, t6, t0
                  sll          a1, s5, gp
                  rem          s5, s10, sp
                  flt.s        s8, ft4, fa0
                  srl          s0, s9, s4
                  lui          t1, 978155
                  mul          ra, t4, s5
                  fmv.w.x      ft0, t3
                  remu         sp, t3, s0
                  mul          t3, a0, s9
                  fmul.s       fa2, fa5, fs4, rtz
                  feq.s        ra, fa1, ft1
                  mul          s11, t4, a4
                  sra          t4, sp, s4
                  fclass.s     s11, ft3
                  fdiv.s       fs11, ft7, ft4
                  mulhu        s3, a0, a0
                  mulhsu       t1, t6, t1
                  mul          s8, t5, gp
                  slti         a1, a7, 243
                  or           tp, s0, s4
                  add          s10, zero, s10
                  slli         s0, tp, 16
                  divu         t3, t1, t2
                  nop
                  fcvt.s.w     fs8, a5
                  fle.s        a4, ft11, ft2
                  xori         a2, s6, 434
                  fadd.s       fa6, ft6, ft5, rtz
                  srai         a5, a0, 15
                  nop
                  ori          gp, t2, 1907
                  and          ra, t2, s11
                  lui          s3, 321347
                  mulh         s3, s4, a3
                  ori          t4, a1, -1577
                  fmin.s       ft10, fa3, fa1
                  fsgnjn.s     fa4, ft11, ft7
                  or           a4, s0, a1
                  mulh         sp, s10, s1
                  sra          a1, gp, s5
                  mulhsu       a1, a6, s6
                  auipc        s11, 556345
                  or           s3, t6, ra
                  fcvt.s.wu    ft2, s6
                  xori         s4, a4, -773
                  fmv.x.w      zero, fa6
                  fcvt.w.s     gp, ft9
                  mulh         a6, s1, a7
                  fsgnjx.s     fs3, fa7, ft7
                  fsub.s       fs10, fs5, ft7
                  remu         a4, t3, t3
                  fmax.s       ft0, fs7, ft9
                  fle.s        s6, fa2, fa7
                  sll          t6, s8, t2
                  slti         a2, s1, 1960
                  fmin.s       fa0, ft11, fa1
                  slli         t4, ra, 28
                  slti         a7, t0, -1515
                  fmv.x.w      a2, ft8
                  fmax.s       fa4, fa2, ft1
                  mulhsu       s9, a0, s1
                  flt.s        t2, fs1, ft11
                  fcvt.s.wu    fs6, t4, rne
                  slt          s2, a2, ra
                  fsgnjn.s     fa1, fa2, fs10
                  xori         a6, a4, -1168
                  fdiv.s       ft9, fa1, ft2, rne
                  fadd.s       fs6, fa5, ft10, rmm
                  xori         t2, s0, -707
                  fsgnj.s      ft7, fs11, fs10
                  fsgnjx.s     fs5, fs9, ft4
                  srai         s3, t3, 16
                  fclass.s     s6, fa5
                  feq.s        s4, fa1, fs10
                  fmv.w.x      ft9, a7
                  xor          s0, a5, t5
                  srli         sp, s4, 7
                  auipc        s0, 192982
                  fadd.s       ft2, ft7, ft11, rne
                  div          s1, s6, a1
                  ori          s1, t0, 630
                  fcvt.s.w     ft2, a7
                  fmv.x.w      ra, fs0
                  fsgnj.s      ft9, ft2, fa3
                  sra          s4, a3, t2
                  sub          t1, t5, t4
                  sltu         s6, a5, t0
                  and          t2, s9, a4
                  fdiv.s       ft3, fa1, fs0, rtz
                  ori          a6, s10, 1378
                  mulhsu       a7, ra, a0
                  sltu         a2, s6, s11
                  slti         t3, a4, -1305
                  xor          a4, a6, gp
                  fsqrt.s      fs10, fa3
                  slt          tp, t2, s8
                  fmv.x.w      zero, ft4
                  fmul.s       fa3, ft7, ft8
                  sub          s3, s9, a7
                  fcvt.s.w     ft8, tp
                  sltiu        s1, a1, 1728
                  fmul.s       ft10, fa3, fs2
                  sll          gp, s0, s11
                  addi         gp, a7, 759
                  sll          a0, t0, ra
                  mul          a4, sp, s3
                  srli         s9, ra, 5
                  fmv.x.w      a3, fa0
                  mulh         t3, a0, a0
                  sra          s2, a5, t3
                  fmax.s       ft2, fs0, ft3
                  addi         s0, a1, -1489
                  fclass.s     a3, fa4
                  fmul.s       ft7, fa3, fa4, rmm
                  slti         a5, a5, 1217
                  fdiv.s       fs9, fs5, fa5, rmm
                  andi         a5, t6, 484
                  fclass.s     t4, fs8
                  srl          a6, a6, s11
                  fsqrt.s      fa1, fa3
                  sltiu        a1, t1, 1726
                  sltu         a6, gp, a1
                  sltiu        t1, t6, 799
                  fmin.s       fa1, fs8, ft0
                  mulhu        zero, t5, sp
                  fcvt.s.wu    fs11, gp
                  fdiv.s       fs11, fs11, fa5
                  fle.s        s9, fs10, fs5
                  fle.s        s9, ft5, ft0
                  fmv.w.x      fs7, ra
                  fadd.s       fa5, fa2, ft10
                  fsqrt.s      fs9, ft5, rup
                  remu         s3, a1, a0
                  auipc        s8, 877160
                  or           s1, s11, s11
                  sltu         gp, tp, s11
                  xor          a7, a1, s10
                  sra          s1, s10, s11
                  mulhu        s3, ra, ra
                  or           a2, s11, a2
                  fmin.s       ft10, ft3, fs6
                  addi         a2, a0, 386
                  srl          t6, s8, t0
                  and          t2, t1, t2
                  fsqrt.s      fa4, fs3, rup
                  fclass.s     a3, ft0
                  fcvt.s.w     ft10, a2, rdn
                  div          tp, s2, s0
                  fmv.w.x      fs3, a2
                  fdiv.s       fs8, ft11, fs11
                  mul          s9, zero, a5
                  srli         ra, s11, 28
                  fadd.s       ft8, fs9, ft5, rdn
                  mulhu        s3, a5, gp
                  fsub.s       ft2, fs2, fs3
                  slli         t6, a4, 7
                  slli         s11, t5, 16
                  sub          ra, s1, s7
                  and          ra, s4, s2
                  fsqrt.s      fa5, fa3, rne
                  mulh         s1, zero, s11
                  mul          t3, a7, sp
                  mulhu        ra, s7, s10
                  srli         a3, a2, 2
                  or           a5, ra, zero
                  divu         s10, t3, a5
                  xor          t4, s3, s0
                  rem          a6, ra, t6
                  mulhu        s4, s2, t4
                  xori         s8, s0, -387
                  slti         s10, s9, -42
                  ori          s4, ra, 1283
                  xori         zero, s8, 707
                  mulhu        ra, t2, a1
                  sll          tp, a3, s8
                  fmv.w.x      ft11, s9
                  sltu         a4, s9, a7
                  sll          a1, s10, t3
                  srli         a6, s4, 5
                  auipc        a5, 551716
                  fcvt.s.wu    fs0, tp, rdn
                  add          gp, s4, s8
                  fmul.s       ft11, fa0, fs9, rne
                  and          s11, a0, s4
                  fsub.s       fa3, ft4, ft1, rmm
                  lui          sp, 977767
                  xori         a5, s0, 504
                  mulhu        a1, ra, a3
                  and          gp, s2, s11
                  ori          t3, a5, 1199
                  srli         a1, gp, 9
                  or           s6, s8, a7
                  sltiu        s10, tp, -1337
                  add          s2, ra, tp
                  fle.s        tp, ft8, ft9
                  mulh         s4, s2, s1
                  divu         t1, sp, t6
                  andi         s9, a0, -1530
                  divu         s2, s11, sp
                  fcvt.s.wu    fa7, a7, rtz
                  fmv.x.w      s3, fs10
                  mul          a3, a6, sp
                  sub          gp, s7, a6
                  sll          s6, a3, t0
                  remu         ra, a2, ra
                  remu         s10, t4, sp
                  remu         a2, s4, gp
                  slti         t3, s1, 451
                  divu         t6, t3, t1
                  fmv.w.x      fs7, a3
                  fmv.w.x      fa2, a7
                  addi         s3, tp, 1135
                  or           a1, s5, a7
                  fmv.w.x      fa1, s5
                  divu         t1, t4, t6
                  slli         a0, t0, 25
                  lui          t6, 516366
                  feq.s        s0, ft3, fs4
                  sll          gp, s7, s10
                  nop
                  mulhsu       s9, t2, zero
                  fsqrt.s      fa1, fa7, rup
                  fmin.s       ft6, ft4, fa7
                  mulhsu       s4, s10, s2
                  fle.s        ra, fa2, fa4
                  fmin.s       fs10, ft1, fs4
                  fsgnj.s      ft3, fa3, ft6
                  flt.s        s8, fa2, ft3
                  srli         t2, a3, 9
                  fclass.s     a0, fs4
                  and          s5, s11, gp
                  fmax.s       fs2, fs4, fs9
                  nop
                  add          ra, ra, s7
                  slli         t2, t2, 7
                  fmv.w.x      ft8, t0
                  fsgnjx.s     ft3, fa7, ft6
                  fle.s        a7, fa7, ft4
                  fsgnj.s      ft5, fa7, fs5
                  fadd.s       fs9, fa6, fa7, rup
                  flt.s        t3, fs9, fa4
                  fclass.s     s8, fa5
                  mulhsu       a6, t3, tp
                  auipc        a1, 94530
                  fadd.s       fa2, fs2, fa6, rdn
                  fsgnjn.s     fa4, fa5, ft0
                  rem          s0, t6, a4
                  fle.s        t2, ft5, fs2
                  or           a4, sp, s1
                  divu         tp, t0, t2
                  ori          a3, a5, -1524
                  fcvt.s.wu    ft7, s6
                  fmul.s       fs0, ft3, ft5, rdn
                  slt          s11, s1, s5
                  xori         ra, s9, 1761
                  sltiu        a6, tp, -1308
                  sltu         a6, s11, t5
                  fclass.s     a4, fa5
                  remu         a6, a5, a0
                  remu         s1, t5, s7
                  fadd.s       ft11, fs2, fa5, rne
                  flt.s        t3, fa0, fs7
                  fcvt.s.w     fa1, ra, rup
                  divu         s5, s5, a7
                  fsgnjx.s     fa7, ft11, fa7
                  sra          t6, s4, s5
                  mulhsu       s1, s11, a3
                  or           t1, a2, s11
                  andi         a3, t4, -662
                  xor          zero, s0, s10
                  nop
                  lui          a2, 681636
                  or           s1, sp, s4
                  sll          a7, sp, a0
                  srli         s2, a3, 2
                  sra          tp, t1, s11
                  xori         ra, s9, -70
                  sra          t6, t4, t5
                  sra          tp, zero, s10
                  add          zero, s8, t4
                  sub          t3, a5, a1
                  fmv.w.x      fa0, a1
                  feq.s        gp, ft6, ft5
                  flt.s        s3, ft8, fs11
                  sra          a2, a3, t4
                  fmul.s       fs3, ft11, ft2
                  mulhu        t1, a7, a0
                  sub          s8, a6, t5
                  fcvt.s.w     ft8, a0, rdn
                  andi         s10, s3, 450
                  andi         s10, t5, -62
                  fcvt.s.wu    ft7, a0, rne
                  add          s8, a4, s4
                  fadd.s       ft7, fs10, fa5, rmm
                  add          s8, a0, s8
                  ori          a4, t6, 1767
                  add          a5, tp, s7
                  sub          s10, a1, sp
                  xor          t3, s1, a1
                  mulhsu       s8, a5, zero
                  ori          s4, s7, -68
                  add          t6, s3, a0
                  fmv.w.x      fa4, s6
                  sll          s0, a1, s1
                  add          t2, s10, s0
                  fclass.s     a5, ft9
                  ori          gp, s10, -1232
                  fsgnjx.s     ft6, fa6, ft5
                  sltu         s3, a7, s7
                  ori          s3, s8, -1255
                  fle.s        s11, ft11, fs5
                  andi         t3, t2, -1376
                  rem          s8, a4, a7
                  fclass.s     s10, fs10
                  fsgnjn.s     fa3, fs9, ft7
                  srl          a4, t3, s11
                  xori         a3, t0, -732
                  remu         a5, a4, sp
                  sra          tp, s2, s11
                  srli         s11, s2, 21
                  sltiu        s0, a6, 796
                  sll          s10, s2, t5
                  fadd.s       fa2, ft9, fs5, rmm
                  srai         a4, s4, 9
                  fcvt.wu.s    s4, fa4, rup
                  feq.s        a3, ft7, ft6
                  andi         gp, s9, -1315
                  slti         s9, a1, -598
                  srai         s6, s5, 8
                  sltu         a1, zero, s1
                  rem          s0, s2, s0
                  sltu         a5, a4, t6
                  add          s5, a7, a0
                  rem          a5, t2, s11
                  fle.s        a5, fa0, ft5
                  fle.s        t1, fa2, fa0
                  srli         s5, s6, 30
                  slli         t6, a3, 6
                  srai         t1, s11, 27
                  ori          s2, a2, 2007
                  fdiv.s       fs7, ft0, ft5, rmm
                  flt.s        t2, fs11, fs2
                  ori          t6, a7, 1318
                  mul          s11, s2, a2
                  mulh         s5, s7, tp
                  fsqrt.s      fs9, ft9, rne
                  fcvt.w.s     ra, fa7, rtz
                  srai         a3, s1, 8
                  sll          a5, a2, a2
                  mulh         a7, t5, s8
                  fmin.s       ft10, fs8, ft10
                  rem          t6, s8, t3
                  fmv.w.x      ft6, sp
                  fmv.x.w      a6, fs10
                  srai         sp, t3, 31
                  fsgnjn.s     fs8, fs10, fa2
                  mul          s4, s3, s9
                  fdiv.s       fs5, fa3, fa1
                  lui          s2, 612871
                  xori         s4, tp, -223
                  fcvt.s.wu    fs2, t1, rdn
                  lui          a0, 968451
                  sub          a2, s0, s6
                  fsgnj.s      ft1, fs6, ft0
                  add          s9, t1, s0
                  sll          tp, t2, t5
                  srai         a6, t0, 20
                  nop
                  divu         t3, sp, s4
                  fcvt.wu.s    t1, fs5, rmm
                  fcvt.wu.s    s6, fa6
                  slti         s0, a0, 342
                  xor          a6, s7, t1
                  sltiu        ra, a5, -658
                  slt          s9, s7, s1
                  fcvt.s.wu    ft6, a0, rne
                  fcvt.wu.s    a2, ft8
                  fsub.s       fa6, fa0, fa2
                  sra          s8, a2, a4
                  srl          a5, tp, a4
                  remu         ra, a1, s2
                  andi         s9, a2, -989
                  rem          s5, a1, t4
                  xori         t3, t3, -106
                  sltu         gp, s10, s2
                  auipc        ra, 254188
                  sll          a5, a4, sp
                  lui          a2, 708529
                  flt.s        s0, fs1, fs0
                  slli         s10, s7, 9
                  fmax.s       fa4, fa2, fs8
                  slt          s5, s4, s7
                  xori         a4, a5, 1676
                  mul          s11, t1, a2
                  slti         s5, s4, -1737
                  fmax.s       fs10, ft6, ft0
                  ori          t3, s4, 1613
                  sub          s4, s6, s0
                  slti         s8, t3, 575
                  xor          t2, a1, a1
                  nop
                  ori          ra, s5, -343
                  fmax.s       fs0, ft9, ft1
                  fsgnjn.s     fs9, fs10, ft6
                  add          s2, s7, a1
                  fadd.s       fa4, fa1, ft3
                  mulhsu       a5, t5, s4
                  fcvt.wu.s    s4, ft1, rne
                  ori          s3, s4, -481
                  xor          tp, t6, s7
                  remu         s2, s4, s4
                  add          a6, s4, s2
                  mulhsu       t2, t1, a0
                  lui          s9, 697153
                  fle.s        s11, fa2, ft11
                  fsub.s       ft1, fa6, ft0
                  lui          gp, 633235
                  fsgnj.s      fs11, fa4, ft6
                  nop
                  fsgnjx.s     fs10, ft1, fa1
                  srli         gp, s9, 30
                  fmv.x.w      t4, ft4
                  xori         a5, t5, -1886
                  xori         a0, s3, 1544
                  srl          a7, t4, a5
                  slli         s4, s1, 16
                  slti         a7, s6, 1709
                  srl          zero, s1, a3
                  fmul.s       fs4, fs7, fa2, rdn
                  fcvt.wu.s    zero, fa7
                  fle.s        s5, ft4, fs4
                  fcvt.wu.s    t3, fa0, rne
                  andi         a7, s8, 904
                  mulhsu       a2, a6, a3
                  mulhu        a3, t6, s11
                  slti         s5, zero, -745
                  addi         a7, a6, 1819
                  flt.s        t1, fa4, fa7
                  auipc        a1, 694616
                  addi         s1, gp, -528
                  fdiv.s       ft11, fa1, fs4, rdn
                  xori         zero, s9, 1733
                  andi         s2, a3, -1711
                  feq.s        s6, ft1, fs2
                  mul          a3, s3, s2
                  and          t1, s8, tp
                  fadd.s       fa2, fs1, fs5, rmm
                  flt.s        tp, ft0, fs5
                  sra          ra, zero, t5
                  slli         tp, a4, 25
                  div          s1, a5, tp
                  sra          tp, a2, t3
                  mulh         s3, a2, t5
                  div          a7, zero, t3
                  mul          s6, s1, a5
                  fsgnjx.s     fs4, fs2, fs4
                  fcvt.s.w     ft2, a3, rne
                  or           t3, s0, t4
                  srl          t2, a5, tp
                  xori         a0, a2, -491
                  xor          s0, s3, s9
                  fmax.s       fa4, fs11, fs11
                  feq.s        a6, fa0, ft9
                  sltiu        ra, a1, 776
                  xor          s8, gp, sp
                  mulhu        s2, t5, s7
                  fle.s        sp, fs8, fa7
                  slt          s4, s0, s6
                  fsqrt.s      fs11, fa5, rup
                  fmv.x.w      a5, ft0
                  fle.s        gp, ft2, fs7
                  and          zero, s3, s10
                  auipc        s5, 591524
                  fdiv.s       fs8, ft3, fs7, rdn
                  flt.s        a2, fs1, fs5
                  xor          s8, t2, a7
                  fmv.w.x      fa5, s11
                  fle.s        a4, ft11, ft11
                  nop
                  sll          s1, s4, t6
                  fcvt.wu.s    s11, fs3, rmm
                  add          t2, s5, a1
                  mulh         s11, t4, sp
                  nop
                  remu         gp, a0, s3
                  mul          t6, ra, s4
                  mul          a1, gp, tp
                  fclass.s     t4, ft7
                  flt.s        a1, fa0, fs2
                  sltu         s8, tp, a4
                  fmv.w.x      ft4, a5
                  sltu         ra, t1, tp
                  or           gp, t6, a4
                  fmax.s       ft2, ft10, fa3
                  fcvt.s.wu    ft0, zero
                  xor          tp, tp, zero
                  and          a3, a7, gp
                  fmax.s       fs6, fs4, ft9
                  sra          sp, s1, a4
                  fmul.s       fa2, fs7, ft1
                  slti         a2, t4, -577
                  fclass.s     a0, fs0
                  addi         a4, zero, -201
                  slli         tp, s8, 5
                  fsub.s       ft3, ft9, fa0
                  remu         a5, s1, s0
                  sltiu        a2, t3, -1218
                  and          s2, a2, t0
                  ori          s2, s2, -1444
                  or           t2, s4, a5
                  sltiu        s11, s1, 1885
                  mulhsu       a1, a6, a0
                  andi         s6, t4, -236
                  fcvt.wu.s    s8, fs9
                  fdiv.s       fs3, fs2, ft1
                  flt.s        t3, fs7, ft5
                  fsgnj.s      fa7, ft5, ft6
                  fcvt.s.w     fa3, a1
                  fmv.w.x      ft7, t6
                  slli         s9, a0, 22
                  xori         tp, s3, -1689
                  fsub.s       fs3, fa4, fs10, rne
                  mulh         s8, a1, s10
                  slt          a2, sp, t5
                  div          a1, t5, sp
                  addi         t6, ra, 30
                  fdiv.s       fa4, ft0, fs11, rdn
                  lui          a7, 774488
                  mul          sp, a2, a0
                  fle.s        zero, fs6, ft6
                  mul          s2, s4, t5
                  lui          s0, 360736
                  fclass.s     t3, fa2
                  nop
                  mulh         s3, a4, t2
                  slti         tp, t3, 1922
                  fle.s        ra, ft10, ft5
                  lui          t1, 7094
                  and          a6, t1, t6
                  xori         s5, t5, -150
                  addi         sp, a5, 1083
                  fsub.s       ft11, fs4, ft3
                  xor          a0, gp, a1
                  fcvt.s.w     fa6, s5
                  addi         s0, t6, -1270
                  div          t1, s6, s10
                  sltiu        a5, s8, -784
                  lui          t1, 601140
                  flt.s        t6, fs0, fs9
                  fclass.s     a4, fs6
                  and          ra, s0, a1
                  fadd.s       fa1, ft11, fa7, rtz
                  fadd.s       fs2, fs1, fs7, rne
                  addi         a6, a5, -1629
                  mulhsu       a2, s6, gp
                  rem          t3, a3, a4
                  srli         a0, a1, 30
                  flt.s        t3, fs8, ft9
                  fmin.s       fa7, fa6, fs4
                  fsgnj.s      fs7, fa1, fa0
                  and          t4, s2, ra
                  srli         zero, t4, 11
                  fsgnjx.s     fs6, fs0, ft5
                  nop
                  fdiv.s       fs4, ft0, ft1
                  addi         a4, a4, 1412
                  fcvt.s.wu    fa7, t4, rmm
                  slt          s1, s3, a2
                  addi         tp, a2, -1900
                  fsub.s       ft10, fa6, ft8, rtz
                  fmin.s       fa7, ft0, fs3
                  and          a7, s1, gp
                  nop
                  slti         s11, t5, -1238
                  or           s0, a5, s2
                  slli         sp, tp, 12
                  srai         t6, a0, 0
                  fcvt.wu.s    a1, fa1, rmm
                  nop
                  remu         t1, s0, a4
                  fclass.s     tp, ft2
                  feq.s        t1, fa1, ft1
                  fsgnjn.s     fs8, ft1, fs1
                  fsgnj.s      ft2, ft4, ft10
                  and          s6, s10, a6
                  fsgnj.s      fs0, fs8, ft10
                  fmin.s       fa6, fs1, fa3
                  fcvt.s.w     ft3, s8, rtz
                  mulhu        tp, s6, s6
                  fmul.s       fs6, ft8, fs2, rdn
                  addi         t2, a3, -1326
                  slt          t4, t6, s5
                  fcvt.s.w     fs11, t4
                  sltu         s1, s1, s1
                  and          s10, t0, s9
                  fsqrt.s      fs9, fs6, rup
                  fcvt.wu.s    gp, ft2, rup
                  fmin.s       fs4, ft11, ft4
                  lui          s11, 11675
                  add          a2, s9, s10
                  and          a7, a1, t4
                  add          a4, s10, t1
                  mulhu        s6, tp, a3
                  addi         a4, s7, -698
                  xori         s3, t1, -130
                  divu         s11, t6, a5
                  srli         ra, s7, 14
                  fsgnjn.s     fa5, fs5, fs2
                  sll          a4, s11, a3
                  slli         a1, gp, 29
                  slli         s0, tp, 28
                  slli         s10, t0, 11
                  slti         s2, s11, 1024
                  srai         gp, tp, 3
                  fsgnjn.s     fs2, fs9, fa7
                  sub          a7, t6, t1
                  srl          s2, a3, t6
                  fsgnj.s      ft2, fs6, fs2
                  sub          t3, a2, t1
                  div          t6, a3, s1
                  srl          t3, ra, s9
                  fcvt.wu.s    s8, ft10, rne
                  andi         s1, t2, 463
                  fcvt.w.s     zero, fs1, rdn
                  srl          s0, t6, t1
                  feq.s        a7, fs2, ft0
                  slti         s8, s8, -1578
                  fadd.s       fa2, fs6, fa5
                  sltiu        s2, t2, 587
                  fcvt.s.w     fa7, s6, rmm
                  xor          zero, sp, s6
                  fadd.s       ft10, fa7, fs5
                  mulhsu       s10, t1, s6
                  divu         a5, ra, t6
                  fadd.s       ft11, fs0, fs3, rdn
                  sltiu        zero, s6, -997
                  andi         s4, a2, -720
                  xor          t1, s5, a4
                  divu         s6, s0, a3
                  divu         tp, a5, t6
                  flt.s        s10, fs9, fs0
                  divu         t2, s3, t2
                  or           s8, a4, a1
                  fsgnjx.s     fs6, fs5, fs1
                  addi         a4, s7, 1704
                  fcvt.wu.s    a2, ft5
                  slli         gp, s0, 26
                  fmul.s       ft10, ft8, fa0, rtz
                  fmin.s       fs5, fa7, fs2
                  remu         s0, t0, s6
                  sub          a1, s5, a4
                  srai         a7, a1, 2
                  slti         a0, a0, 1757
                  sub          s0, t1, a6
                  sltu         a2, s1, a2
                  fsgnj.s      fa7, fs4, fs10
                  fsgnjx.s     ft6, fs9, ft4
                  fle.s        s2, fa4, fs4
                  sub          a7, s9, t5
                  fmax.s       ft4, fs8, fs1
                  srl          s1, s11, a6
                  andi         sp, a6, -1948
                  srli         a4, a5, 17
                  srli         a6, s1, 2
                  fsub.s       fs9, fa6, ft11
                  nop
                  fmv.x.w      s11, fa3
                  fsgnj.s      ft0, ft11, fs3
                  lui          s9, 368114
                  mulhu        s6, s2, t4
                  slt          s1, t6, a4
                  fsgnj.s      fa2, fa4, fs10
                  and          a3, t3, s6
                  mulhu        s6, s6, s5
                  auipc        a1, 442071
                  or           a5, s10, a6
                  lui          t6, 753666
                  fcvt.s.wu    fs4, s2
                  fmin.s       fa5, fs5, fa4
                  fmul.s       fs1, ft9, ft2, rne
                  addi         a6, a7, 198
                  divu         a2, t1, s8
                  fmin.s       fs5, fa7, fa4
                  nop
                  ori          t6, s0, 479
                  mulhu        a0, s3, a1
                  feq.s        t3, fa2, fs10
                  srai         s11, sp, 7
                  andi         s10, t1, 944
                  fcvt.w.s     gp, ft6
                  addi         a4, s8, -1605
                  slt          ra, t0, a0
                  fmax.s       fs0, fs3, fa4
                  sll          zero, ra, s8
                  andi         a6, a7, -366
                  addi         t3, a0, 424
                  sltu         sp, a2, t5
                  fcvt.wu.s    tp, fs8
                  auipc        a6, 251187
                  fdiv.s       fa1, fs9, ft1
                  remu         t1, a6, gp
                  nop
                  addi         a1, s9, -737
                  fmin.s       ft4, fa7, ft0
                  slt          s1, a2, s4
                  add          t6, t1, ra
                  fclass.s     a4, fa5
                  fsgnjx.s     fa2, fs11, fa7
                  sltu         a0, t1, s1
                  mulh         t4, s8, s5
                  mulhsu       a6, tp, t2
                  fmax.s       fs2, fa0, ft7
                  srl          s10, zero, t0
                  sll          s3, a6, sp
                  and          ra, t0, s1
                  fsgnj.s      fs5, fs9, fa2
                  fcvt.s.w     fa0, tp
                  feq.s        a2, fs10, ft8
                  fadd.s       fs4, fa1, fs8, rdn
                  fcvt.s.wu    ft3, t3
                  sll          s5, s8, t0
                  fle.s        s9, ft3, fs7
                  fsub.s       ft2, fs10, fs7, rdn
                  addi         s0, a2, 77
                  fmv.x.w      a4, ft2
                  srli         s0, sp, 0
                  fle.s        s6, fs7, fa4
                  slli         a1, s7, 28
                  mulhsu       s3, t6, a1
                  slli         a1, t6, 9
                  fmin.s       fs3, ft9, ft6
                  andi         gp, s3, 1337
                  mul          a6, gp, s8
                  mulh         a2, s3, s11
                  nop
                  fmv.w.x      ft11, a0
                  fcvt.wu.s    t4, ft11
                  fcvt.wu.s    s4, ft6
                  mulh         a2, t0, t6
                  feq.s        sp, ft9, fa0
                  fdiv.s       fs8, fs9, fs1, rdn
                  mulh         s10, t0, s0
                  sll          t2, t5, a5
                  srai         s2, s11, 23
                  fcvt.s.wu    fs2, s11
                  sltiu        sp, a5, 1094
                  fdiv.s       fs6, fa6, fs4, rtz
                  fcvt.w.s     a6, fs8
                  fdiv.s       fs4, fs5, ft2
                  fcvt.s.wu    fa1, a7, rup
                  xori         s6, a6, -160
                  srai         a0, a3, 25
                  ori          t1, s11, 262
                  srai         ra, s5, 9
                  ori          a0, t0, -1586
                  fsgnj.s      ft3, fa3, fa1
                  fsgnj.s      fa2, fs6, ft8
                  rem          s10, a4, a2
                  fcvt.w.s     a4, fs6
                  fsub.s       ft11, fs0, ft8
                  or           a4, s7, t6
                  div          a1, ra, t4
                  fmax.s       fs6, ft6, fa7
                  div          a4, a1, t0
                  slt          t2, t3, s8
                  fmin.s       fa3, fs7, fa6
                  fcvt.w.s     s5, ft9, rne
                  fmv.x.w      tp, fs6
                  ori          tp, a4, -1476
                  divu         tp, a5, t3
                  divu         t1, a1, sp
                  andi         a4, s7, -208
                  fsqrt.s      fa2, fs11, rne
                  mulh         ra, a5, a2
                  fclass.s     s9, ft5
                  divu         sp, a7, a1
                  remu         s11, t0, s11
                  fmv.w.x      ft7, t5
                  fsgnjx.s     ft4, fs10, fa6
                  mul          s6, t4, s5
                  sll          a4, a1, s4
                  srai         a3, t4, 25
                  fsgnjn.s     ft8, fs8, ft6
                  fmv.x.w      sp, ft1
                  mulhu        gp, a5, t1
                  sra          s2, s3, t5
                  and          a1, s0, t0
                  fcvt.s.wu    ft4, s8, rne
                  fsqrt.s      ft7, ft5
                  fcvt.wu.s    a2, ft8
                  sll          a6, a3, t4
                  fadd.s       fa2, ft8, ft9, rne
                  fsgnj.s      ft11, fs0, fa4
                  fcvt.w.s     a5, fs4, rne
                  fmax.s       fs2, fs2, ft1
                  fdiv.s       ft10, fa3, fs5
                  fcvt.s.w     fa3, zero
                  mulhu        a1, a0, ra
                  fmv.x.w      ra, ft3
                  fdiv.s       fa0, fs1, ft0, rne
                  fmv.x.w      s11, ft9
                  mulh         t1, s6, s4
                  mulhsu       t6, s0, s3
                  auipc        s8, 817634
                  fmin.s       fs8, ft10, fs11
                  fcvt.w.s     s4, fa4
                  andi         gp, s10, -1496
                  andi         t3, sp, 127
                  mul          sp, s4, t3
                  mulh         a4, t2, t3
                  nop
                  mulhsu       s11, s6, gp
                  mul          s3, s5, s11
                  fcvt.s.wu    ft9, t1
                  sub          a1, s6, s3
                  div          t6, a1, a1
                  nop
                  nop
                  fadd.s       fs10, ft9, ft9, rdn
                  ori          a4, t1, -830
                  add          s2, s4, s11
                  fsgnjn.s     fs5, fs6, fa5
                  fdiv.s       fs1, ft4, fs3
                  ori          a1, s7, 1572
                  flt.s        gp, fs5, fs10
                  ori          s6, s4, 1477
                  fmv.w.x      fa0, t1
                  add          t6, t2, a4
                  remu         a4, tp, a1
                  sub          t3, a2, a2
                  fcvt.s.w     fa3, s1
                  or           s6, s11, t2
                  div          s2, ra, a7
                  fcvt.w.s     a5, fs6, rdn
                  fcvt.s.w     fa4, tp
                  srli         zero, a6, 6
                  mulhsu       ra, a3, s1
                  slli         gp, t3, 18
                  fcvt.wu.s    a0, ft2, rup
                  div          a5, sp, a7
                  srai         t6, s3, 12
                  srli         s3, a0, 13
                  mulhsu       s8, sp, t3
                  sub          s1, s0, s11
                  and          a6, a7, s10
                  fcvt.s.w     fs7, a1
                  fclass.s     a2, fs3
                  fmv.w.x      fs2, tp
                  sra          gp, t4, a5
                  fsub.s       fs5, fa2, fa6, rne
                  slti         a6, a1, 1731
                  flt.s        t1, fs3, ft1
                  fmul.s       ft9, fs5, ft0
                  slti         s2, a2, -1287
                  remu         a1, s10, s8
                  div          t2, a4, a3
                  srli         a0, s6, 28
                  add          s6, a6, s0
                  slti         tp, tp, -428
                  xori         a3, a5, 704
                  fsgnj.s      ft2, fs6, fs11
                  ori          t6, t2, 711
                  sub          sp, gp, s11
                  flt.s        s2, fa4, fs4
                  fsqrt.s      fa5, fa2
                  fmv.x.w      zero, fa2
                  fmv.w.x      fs0, a5
                  nop
                  fmax.s       fs1, ft2, fs8
                  fcvt.w.s     s9, ft4, rtz
                  srl          s10, s10, a6
                  xori         t4, t1, -759
                  fsgnjn.s     fs2, fa1, fs6
                  fsgnj.s      ft8, fs7, fs4
                  slt          t3, a7, sp
                  divu         a5, a1, a0
                  fcvt.wu.s    s10, ft10, rup
                  fcvt.s.w     fs2, t1, rtz
                  rem          t1, t6, ra
                  ori          s5, gp, -1272
                  auipc        sp, 720239
                  mulh         a3, s9, a7
                  srai         a4, s5, 2
                  xor          ra, s7, a0
                  ori          a5, t1, -707
                  fclass.s     a5, fs8
                  mulh         t3, gp, ra
                  fmax.s       fa0, ft5, fs7
                  mulhu        a7, a4, a1
                  divu         ra, ra, a5
                  mulhu        a2, t5, s1
                  sll          a2, a4, ra
                  fsub.s       fs1, fs11, ft5, rup
                  lui          t1, 41797
                  fclass.s     tp, fa4
                  auipc        a2, 1000763
                  fsub.s       ft1, ft7, ft2, rup
                  sll          s9, tp, s4
                  ori          s5, s6, 1406
                  fsgnjx.s     ft0, fs10, ft0
                  or           t1, t4, a5
                  fsqrt.s      fs5, ft6, rup
                  fcvt.wu.s    s10, ft3
                  fsgnjx.s     fs2, ft7, fs7
                  sll          t2, t5, s9
                  fsgnjn.s     ft10, fs6, ft1
                  mulh         t1, t0, s5
                  auipc        a0, 885441
                  remu         t6, tp, s6
                  nop
                  fmax.s       ft3, fa7, fs2
                  srl          tp, s10, s6
                  sra          a5, zero, s9
                  sltu         t6, gp, s6
                  slt          s9, s1, a0
                  slti         t1, zero, -1249
                  or           s0, s1, t6
                  xori         a6, s10, 337
                  fdiv.s       ft5, fs8, fs5
                  srl          s3, t4, t4
                  divu         t2, s5, s11
                  add          t6, t2, s6
                  fsqrt.s      fs1, ft1
                  auipc        a2, 512648
                  lui          s2, 865610
                  srai         a3, t0, 28
                  auipc        s10, 361742
                  slt          s8, s2, s3
                  fcvt.s.wu    fs10, a7, rup
                  fmax.s       fs1, fa4, fs5
                  sltu         s9, a2, s1
                  rem          sp, s6, sp
                  slli         a3, a7, 16
                  xor          gp, s5, ra
                  slt          a1, t2, s6
                  fsgnjn.s     fs10, fs3, fs5
                  slli         a7, ra, 7
                  fmin.s       fa7, fs5, fa7
                  fmin.s       fs9, fs0, ft3
                  remu         sp, t0, sp
                  rem          a2, a1, t5
                  slli         t2, s3, 17
                  fsgnj.s      ft7, ft8, fs10
                  fmv.w.x      ft8, s0
                  mulhu        s3, t1, a0
                  fsgnjn.s     ft8, fa2, ft8
                  sub          s10, sp, a1
                  xor          a0, zero, sp
                  fadd.s       fs3, fs7, fs7, rdn
                  fadd.s       fs8, fs10, fa6, rdn
                  fsgnjn.s     fs0, ft10, ft9
                  fle.s        t3, ft1, ft3
                  mulhsu       ra, ra, t4
                  add          gp, s11, tp
                  fcvt.s.wu    fs5, s4, rmm
                  mulh         a1, sp, a6
                  div          s3, tp, zero
                  xor          s1, zero, t5
                  xori         t3, a0, 706
                  sll          t6, t2, s5
                  fadd.s       fs11, fs8, fa0
                  nop
                  srl          gp, tp, s11
                  fmin.s       fa1, ft7, fs2
                  srai         s5, a3, 25
                  divu         a6, t5, s8
                  auipc        a3, 15428
                  ori          s2, tp, 671
                  xor          s1, s5, s9
                  sltiu        t2, a6, 1640
                  rem          t6, s0, s3
                  xori         a7, s10, 1696
                  slli         tp, s9, 24
                  sltu         a5, s5, t1
                  fle.s        a0, fs9, fs4
                  srl          a1, s10, s9
                  fadd.s       ft7, fs2, fa6
                  mulhsu       t3, s6, a7
                  and          tp, t3, t2
                  and          s10, t1, a1
                  nop
                  mulh         t6, t6, s9
                  mulhsu       s10, s5, a6
                  fcvt.s.wu    ft11, s9
                  andi         a2, ra, -434
                  feq.s        t6, fs7, ft1
                  feq.s        a6, fs10, fa1
                  xori         s10, a3, -1791
                  srli         s6, s4, 18
                  xor          a6, a7, s8
                  andi         t6, zero, -978
                  slti         gp, s10, 1497
                  fmax.s       ft3, fs1, fs4
                  slti         gp, s7, -1424
                  mulhsu       sp, ra, gp
                  fadd.s       fs4, ft0, fs4
                  srl          s0, a6, a3
                  srai         s11, s7, 16
                  divu         gp, zero, a7
                  fcvt.s.w     ft0, s7, rne
                  fadd.s       fs3, fa5, ft5, rmm
                  or           t6, s6, s2
                  auipc        s5, 441077
                  fle.s        s9, ft10, fs0
                  srai         a0, a2, 16
                  fsqrt.s      fs10, fs0
                  fcvt.wu.s    s11, ft0, rmm
                  sra          t3, s10, tp
                  fsgnj.s      fa6, fa7, ft7
                  fcvt.s.wu    fs8, a1, rtz
                  mul          s8, zero, s2
                  flt.s        s8, ft0, fa4
                  mulhu        sp, t0, ra
                  add          a0, t0, s7
                  sll          zero, s4, s6
                  fmv.x.w      a1, fs5
                  addi         zero, s7, 1134
                  fmv.w.x      ft0, gp
                  fmv.w.x      fa6, a6
                  ori          s11, s2, -134
                  lui          s11, 161552
                  fdiv.s       ft3, fa1, fa2
                  fmin.s       fa5, fa2, fa5
                  fmul.s       fs4, fs0, fs4
                  fclass.s     a7, ft8
                  fmul.s       fs4, fs8, fa0, rtz
                  remu         ra, a2, t6
                  mulh         ra, a1, t2
                  feq.s        s3, fs10, fs3
                  auipc        s6, 87028
                  fcvt.s.wu    ft2, s1, rup
                  fsub.s       ft8, fa0, fa2
                  sub          s0, tp, s6
                  fmul.s       fs8, fs10, fs2, rdn
                  sra          s11, a1, a3
                  xor          a2, s2, a7
                  xor          s3, gp, s4
                  fmv.x.w      t3, fs6
                  srai         s2, s7, 31
                  fmv.w.x      fs5, sp
                  sra          s2, s4, s8
                  fle.s        s2, ft11, fs1
                  flt.s        t2, fs3, fs11
                  fcvt.wu.s    tp, fa4
                  srl          s5, s0, a6
                  remu         zero, tp, s7
                  remu         s11, a7, sp
                  auipc        a7, 596709
                  fcvt.wu.s    sp, fs0
                  srli         a4, a1, 26
                  and          a4, s6, t3
                  lui          s3, 816786
                  fsqrt.s      fs3, ft11, rup
                  fmin.s       fs6, ft11, fa4
                  mul          a3, t4, t3
                  fcvt.s.w     fs3, t1
                  slti         a2, tp, -900
                  mul          t4, t0, ra
                  fmul.s       ft10, fs11, fa7
                  rem          a6, sp, s1
                  xori         t2, s9, -1785
                  slt          s2, s11, a3
                  divu         gp, t2, gp
                  srli         t2, s1, 10
                  andi         s0, tp, 73
                  mulh         a7, s4, s1
                  fsgnjn.s     ft2, ft0, fs6
                  mulhu        zero, sp, a5
                  fsgnj.s      fs2, fa4, fs4
                  feq.s        s9, ft0, fa2
                  and          s1, s11, t3
                  div          a5, t5, s3
                  fmax.s       ft0, ft8, fs0
                  sltiu        t3, s7, -864
                  srli         s9, s9, 27
                  mulh         s10, ra, s1
                  slti         a1, t6, -510
                  sltu         a7, a4, a6
                  fcvt.s.w     fa2, zero, rmm
                  or           t3, a5, a0
                  addi         a2, a5, -301
                  fcvt.wu.s    s5, fa3
                  lui          s6, 207204
                  fsgnjn.s     ft9, fs2, ft3
                  fsgnj.s      ft6, ft9, ft8
                  lui          a0, 752756
                  fmul.s       fa4, ft2, ft4, rup
                  ori          tp, s1, -726
                  fmv.x.w      s1, ft11
                  mulhsu       s4, sp, t2
                  mulhu        s1, ra, a6
                  fcvt.wu.s    s0, fs9
                  divu         tp, s3, s9
                  add          s3, s8, a7
                  fmax.s       fs8, ft7, fs1
                  lui          a7, 412042
                  sll          t4, t4, s2
                  rem          gp, tp, s9
                  sra          s5, s2, s10
                  fcvt.wu.s    gp, fs5, rdn
                  mulhu        a3, t4, tp
                  mul          t2, a5, zero
                  sltiu        ra, sp, -1859
                  sll          t2, a4, s10
                  fcvt.wu.s    a2, ft7
                  fsub.s       fs7, fs2, fs1, rdn
                  xori         s2, tp, -1619
                  fmax.s       ft1, fs5, ft0
                  fsgnjx.s     fs8, fs9, fa2
                  fsqrt.s      ft9, ft5
                  slt          zero, s3, s11
                  mulhu        a3, t5, t6
                  ori          a1, s2, 956
                  addi         sp, a6, 1231
                  fcvt.wu.s    ra, fa7, rup
                  lui          sp, 687002
                  div          a5, s7, a6
                  srai         s4, s4, 9
                  slt          a4, s9, a3
                  fdiv.s       ft7, ft7, ft8, rup
                  fmin.s       fs10, ft7, ft5
                  fsqrt.s      ft0, fa6
                  fmv.w.x      fa6, s4
                  slt          sp, s9, tp
                  fsqrt.s      ft10, fs0
                  and          s6, sp, a1
                  srai         zero, a0, 14
                  mulh         sp, t2, s2
                  andi         s5, t2, -41
                  fmax.s       ft1, fs4, ft0
                  fmv.w.x      fa6, s5
                  or           s3, t0, a2
                  andi         t2, s6, 83
                  fsqrt.s      ft7, ft0
                  ori          t2, s9, -189
                  mulh         a2, t0, s10
                  or           s8, a1, t0
                  remu         t6, s0, a3
                  xor          s3, s6, s0
                  fdiv.s       fa0, ft5, fs11, rtz
                  lui          tp, 813142
                  nop
                  flt.s        s9, ft2, ft8
                  lui          t4, 621466
                  fsgnj.s      fs7, fs9, ft8
                  sltu         t1, a6, ra
                  lui          s3, 779035
                  fle.s        t2, fa1, fa5
                  xori         s3, ra, -1562
                  or           a2, a5, a7
                  slli         s3, t4, 5
                  xori         a3, s0, -968
                  srai         s5, s11, 31
                  mulhsu       a5, sp, a2
                  mulhu        a0, t5, a5
                  slti         a4, a3, -611
                  slt          a7, s10, gp
                  rem          s4, t5, s9
                  addi         a7, t6, -1386
                  sll          t3, a2, s8
                  sltu         a1, a7, zero
                  lui          ra, 896102
                  fcvt.wu.s    s6, ft3
                  srl          s1, s2, a1
                  mulhu        t2, s7, s10
                  and          a1, s10, t5
                  fsqrt.s      ft7, fa0
                  mulhsu       s1, a3, zero
                  srl          gp, t5, s11
                  feq.s        a5, fa6, fs1
                  remu         ra, s5, a5
                  mulhu        t3, a5, t6
                  and          t2, a4, t2
                  addi         t6, t3, 64
                  sra          s0, sp, s8
                  slli         s5, s8, 22
                  fcvt.s.w     fs0, a6
                  rem          s8, a1, t6
                  lui          a4, 170954
                  fadd.s       fs2, ft9, fs6, rdn
                  sra          a7, s0, a4
                  fcvt.s.wu    fs5, zero
                  fclass.s     t3, ft6
                  fadd.s       ft3, fa1, fa1
                  andi         a0, t1, 1727
                  andi         t2, zero, 133
                  lui          t2, 877720
                  fcvt.wu.s    t2, fs10
                  sra          a2, sp, ra
                  fmv.x.w      s11, fs7
                  fmin.s       ft9, ft3, fs3
                  divu         s10, s6, ra
                  fmv.w.x      fs4, a7
                  sll          a4, s8, s2
                  ori          t6, t4, -1873
                  addi         a0, s8, 734
                  fcvt.s.w     ft2, s8, rne
                  nop
                  fadd.s       fa4, ft5, ft4
                  fcvt.s.wu    ft6, s0, rup
                  addi         s8, a0, -1075
                  sra          s2, a3, a4
                  fmv.x.w      a6, fa4
                  fsgnj.s      ft10, ft1, fs8
                  mulhsu       a5, zero, a6
                  mulhu        s2, sp, s4
                  fcvt.wu.s    t4, fa7, rup
                  slti         a5, s2, -1892
                  slt          s9, s0, s11
                  srl          s2, a1, s8
                  fsqrt.s      fs2, ft9
                  fcvt.w.s     a0, fs4, rup
                  addi         a4, zero, -913
                  lui          t3, 906856
                  nop
                  xor          s1, s8, t0
                  fsqrt.s      fs7, ft7, rdn
                  slti         s5, s8, 941
                  fcvt.wu.s    s3, ft8, rmm
                  add          a6, gp, s9
                  fmax.s       ft6, ft1, fs9
                  sltu         t1, a7, s0
                  andi         s6, s3, -224
                  or           a0, s7, s3
                  fcvt.s.w     fa0, a6, rne
                  xori         a2, t1, 981
                  fsgnjn.s     fa3, ft4, ft4
                  flt.s        a5, fs0, fa7
                  fdiv.s       fa1, fa7, ft1, rdn
                  mul          gp, t6, a3
                  auipc        s4, 473681
                  fcvt.w.s     zero, fs0, rup
                  lui          s10, 29150
                  fsqrt.s      fa7, fs1
                  nop
                  fcvt.s.wu    fs0, t3, rtz
                  fsgnjx.s     fa6, ft9, ft3
                  sub          s5, a0, s7
                  mulh         s10, a2, s7
                  fmul.s       ft6, ft0, fs7
                  fadd.s       fs8, ft5, ft11, rmm
                  and          t4, gp, a7
                  srli         s6, s2, 22
                  fdiv.s       ft4, ft11, ft2
                  srl          s6, s9, t5
                  xor          s9, tp, s0
                  add          s11, a6, s8
                  remu         a0, s3, a7
                  slti         sp, tp, -1425
                  lui          s1, 905192
                  fsub.s       ft11, fs5, fs2, rup
                  auipc        t4, 504188
                  fcvt.wu.s    a0, fs0, rne
                  fsgnjx.s     fs4, fs10, ft2
                  xor          s10, a2, a0
                  mulhu        a4, a1, a2
                  fmul.s       fs7, fs8, fs6
                  mulhsu       s1, s4, gp
                  fcvt.w.s     zero, fs4
                  mulh         s8, s8, gp
                  fmin.s       fa2, ft4, fs10
                  nop
                  fcvt.s.wu    ft2, s8, rdn
                  fcvt.wu.s    t6, fs3
                  fsgnjn.s     ft5, fs5, fa3
                  srai         s10, s5, 11
                  xor          a6, a2, a0
                  andi         t3, a6, 1743
                  fcvt.wu.s    a2, ft4
                  or           t6, s7, sp
                  fdiv.s       fs0, ft9, ft2, rmm
                  sltu         t4, t6, a3
                  feq.s        s10, fa5, fa3
                  fsgnjx.s     ft5, ft10, fs8
                  divu         s0, s8, gp
                  div          t4, s2, sp
                  slti         a4, a0, 1895
                  fmax.s       fs4, fa6, fs10
                  addi         s8, t6, -352
                  mulhsu       t3, a2, gp
                  fcvt.s.w     fa1, s6
                  mulhu        s11, a5, a4
                  feq.s        a7, ft9, fa6
                  fle.s        t4, ft6, fa4
                  fcvt.s.w     fs2, t6, rup
                  mulhu        a0, a2, t4
                  slti         t6, t2, -710
                  rem          zero, s7, t1
                  auipc        sp, 639055
                  fcvt.w.s     s3, fs6
                  sltiu        s10, gp, -6
                  remu         s9, ra, a5
                  fdiv.s       ft3, ft11, fa2
                  sra          tp, s8, s0
                  nop
                  or           s8, t6, a5
                  fsub.s       fs11, fa3, fa4
                  fmax.s       fs3, fs0, fs1
                  mulh         t6, s4, s6
                  fdiv.s       fs2, fs10, ft5
                  fsgnj.s      fs5, ft1, fa3
                  add          ra, a2, s10
                  ori          t6, sp, 2036
                  xori         s3, a3, 1586
                  sltiu        a5, t3, -1477
                  feq.s        tp, fs1, fs2
                  fadd.s       ft8, ft11, fa3
                  slt          a2, a6, s6
                  add          s2, sp, t3
                  sub          a3, t5, t6
                  fmul.s       ft0, fs11, fs6
                  fmax.s       fa6, ft1, fs4
                  fclass.s     a6, ft6
                  fadd.s       fs7, ft11, ft3, rtz
                  fsqrt.s      ft7, fs2, rne
                  fmv.w.x      fs7, s5
                  fcvt.s.w     fa4, s1, rtz
                  fsqrt.s      ft8, ft9
                  fmul.s       fs9, ft2, fs1, rtz
                  divu         s4, t0, a6
                  fdiv.s       fa7, fa2, fs3
                  fcvt.s.w     fs8, tp, rmm
                  srl          s4, s2, t6
                  srli         gp, s3, 16
                  fmin.s       ft5, ft2, ft1
                  or           zero, s0, t2
                  or           t1, a3, a5
                  fcvt.wu.s    a4, fs0, rmm
                  sra          s4, sp, sp
                  fmin.s       fa6, fs1, ft11
                  xori         a2, s8, -1486
                  divu         s8, a3, s2
                  fdiv.s       ft5, fa6, ft8, rmm
                  srli         s2, t2, 19
                  sltu         a7, s6, zero
                  fcvt.wu.s    s5, ft5, rtz
                  sltiu        s2, s11, 551
                  auipc        a5, 827772
                  sll          a5, a5, s11
                  fsgnjn.s     ft10, fa3, fs4
                  fcvt.s.w     fa3, t1, rne
                  flt.s        zero, fs3, ft6
                  nop
                  fmin.s       ft8, ft5, fs6
                  sltiu        ra, a0, 1570
                  nop
                  sltiu        ra, a5, -1513
                  fcvt.wu.s    a0, fs7, rtz
                  fsgnjx.s     ft11, ft1, fs10
                  srli         t6, t0, 12
                  flt.s        a5, ft8, ft11
                  srai         a5, sp, 27
                  fle.s        a1, fa1, ft5
                  fsgnjn.s     ft5, fa3, ft5
                  div          s10, t0, zero
                  xori         s1, t4, 805
                  srai         s3, s1, 13
                  divu         a1, s11, a5
                  ori          sp, a4, -298
                  srai         zero, a5, 24
                  mul          t4, a2, a6
                  fmv.w.x      fs3, s5
                  fle.s        s4, ft5, fa0
                  fmv.x.w      s9, ft10
                  fcvt.s.wu    fs5, s8
                  fcvt.wu.s    ra, fs9, rdn
                  fdiv.s       fa4, ft11, fs1
                  sra          ra, ra, a7
                  mulh         t4, s10, s11
                  fcvt.s.wu    fs7, t1
                  srl          a7, t5, tp
                  sra          s11, a7, s6
                  mulhsu       a4, t6, t3
                  flt.s        a5, ft8, fs7
                  feq.s        s9, ft7, fa7
                  srli         a5, t5, 24
                  sub          s10, a3, a4
                  fmv.w.x      fa4, a1
                  fcvt.s.wu    fs1, s11
                  fcvt.s.w     fa0, s5, rdn
                  fcvt.s.wu    fs4, a6
                  addi         s9, s7, -708
                  fclass.s     s3, fs5
                  and          gp, a0, s9
                  fmax.s       fa3, fs0, ft4
                  auipc        tp, 74349
                  slli         t6, s4, 15
                  fmin.s       fs8, ft10, fs3
                  slt          s0, a2, t3
                  fle.s        tp, fs6, fa5
                  xor          s1, ra, t0
                  fadd.s       fs2, fs9, fs11, rmm
                  feq.s        s3, fs2, fa7
                  remu         t6, s9, s7
                  nop
                  addi         s5, s3, 1866
                  div          tp, t6, s11
                  divu         a2, a5, s11
                  fsgnjn.s     ft1, ft9, ft2
                  mulhu        t4, t3, s6
                  srai         tp, t6, 21
                  ori          a7, t2, -1868
                  fclass.s     a2, fs7
                  or           a6, s9, s5
                  fclass.s     t2, fs8
                  srli         a4, s10, 17
                  fmul.s       fs10, ft1, fa6, rup
                  sra          ra, gp, s8
                  mulh         s0, s5, s5
                  divu         tp, a3, t5
                  mulhsu       s8, t6, zero
                  fsgnj.s      ft10, fs4, fs0
                  auipc        a2, 379440
                  flt.s        a7, fs0, fs6
                  sltu         s5, s6, a4
                  fdiv.s       fa6, ft9, fs10, rtz
                  slti         s1, s11, -811
                  slli         a2, tp, 7
                  feq.s        s6, fs1, fs1
                  fsgnj.s      ft0, ft5, fa0
                  nop
                  feq.s        ra, fs10, fs2
                  sltiu        a3, tp, -1656
                  nop
                  fmul.s       fs7, fs3, ft4
                  slli         a3, sp, 0
                  flt.s        sp, fs4, ft10
                  addi         s5, sp, 728
                  div          s4, t5, a5
                  mulh         s6, s1, a5
                  fle.s        a0, fs2, ft4
                  fsgnjn.s     ft6, fa1, fa5
                  fsub.s       ft4, fa0, ft11, rne
                  rem          t3, s11, s9
                  feq.s        s11, fs4, fa7
                  slli         t6, a2, 29
                  fmv.w.x      ft7, s1
                  or           tp, t5, s2
                  mulh         s9, tp, a5
                  fdiv.s       fa2, fs8, ft2, rup
                  and          gp, t5, s11
                  divu         a6, s7, s5
                  fmin.s       ft5, fa6, fs6
                  sll          t1, s11, s5
                  slt          s3, a6, s3
                  fdiv.s       fa3, fa4, ft4, rtz
                  sll          t3, a0, t6
                  xor          t1, a6, a6
                  fmv.x.w      s6, fs9
                  srai         zero, s8, 6
                  or           t2, a2, a2
                  fmv.x.w      s8, fs3
                  fdiv.s       ft3, ft4, fs7, rmm
                  xor          s1, s0, t5
                  fsub.s       ft3, ft1, fs1, rup
                  fclass.s     a1, fs6
                  divu         s9, sp, a2
                  sltu         a0, gp, a3
                  fmv.w.x      ft8, tp
                  fsgnjx.s     ft8, fs10, ft2
                  mulhsu       s1, s11, a0
                  div          a5, s1, t1
                  srai         t4, gp, 14
                  fmax.s       fa7, ft5, fs4
                  remu         s6, a0, s5
                  fcvt.wu.s    s6, fs8, rne
                  or           s3, t2, a7
                  fsgnjn.s     fs10, fa4, fa3
                  fcvt.s.w     ft4, s2
                  fmax.s       fs5, fs4, fs10
                  slt          t6, sp, s11
                  sra          t1, a5, s10
                  fle.s        t1, fa5, fs1
                  fcvt.s.wu    ft2, s0, rtz
                  srli         t2, s2, 23
                  rem          s6, s1, s3
                  fmv.x.w      a0, ft5
                  fsub.s       ft11, fs3, fs0
                  srl          a6, s0, s11
                  slli         gp, s7, 6
                  fsgnjn.s     fa0, fs8, fs3
                  fcvt.wu.s    t1, ft0
                  sll          a2, s3, t1
                  fadd.s       fa5, fs9, fs9
                  addi         a7, s8, 754
                  slli         sp, ra, 7
                  sra          s9, s9, s4
                  fcvt.s.w     ft6, gp, rup
                  fadd.s       ft8, fs0, fs7
                  slti         t3, s2, 1321
                  mul          s8, a4, s8
                  flt.s        a0, fa4, ft9
                  slli         s2, s1, 22
                  sltiu        s8, t5, -149
                  or           zero, t5, s3
                  rem          a4, s8, t0
                  slt          t6, a6, gp
                  srl          s10, t0, a1
                  slt          s4, t6, s6
                  mul          s4, gp, s3
                  remu         a1, t6, a0
                  fmin.s       fs6, fs1, ft0
                  mulhsu       s1, a2, ra
                  fmv.w.x      fs0, a0
                  fmax.s       fa6, fa0, fs3
                  sltu         gp, a6, s2
                  feq.s        s1, fa5, ft8
                  xor          s4, t2, s5
                  andi         s5, s6, -1288
                  div          s1, a1, t0
                  fsub.s       ft9, fa1, fs9
                  srl          a5, gp, tp
                  fsgnj.s      fs4, fa2, fa5
                  add          sp, sp, t4
                  fsgnjx.s     ft9, ft7, ft11
                  fmv.w.x      fs7, s5
                  slt          gp, sp, a0
                  fadd.s       fs3, fs4, fa6, rne
                  mulhsu       a5, s0, a3
                  fcvt.s.w     fs4, a3, rne
                  ori          t4, gp, -676
                  fsgnjx.s     fs4, ft10, fs7
                  fdiv.s       fs11, fa5, fs1
                  lui          t3, 589076
                  flt.s        s3, ft11, fs11
                  sltiu        gp, gp, -449
                  fclass.s     s10, ft0
                  flt.s        a6, fa5, fa0
                  sub          a4, s4, s4
                  fcvt.s.w     fs4, t2, rne
                  sub          s0, s9, gp
                  fsgnj.s      fa5, ft10, fa4
                  mul          s11, s6, t1
                  fcvt.wu.s    s1, ft1
                  add          s9, t2, a5
                  sll          sp, ra, sp
                  sll          s0, a6, a3
                  srli         t3, ra, 16
                  fmul.s       fs6, fs0, ft6, rup
                  nop
                  remu         t6, t4, s1
                  fmv.w.x      fa5, s3
                  sltiu        t2, gp, -935
                  sub          s11, s9, t0
                  fmv.w.x      fa7, a6
                  fsgnj.s      ft6, fa5, fs9
                  mulhsu       a4, s10, a5
                  fsqrt.s      ft9, fa4, rdn
                  fsgnjx.s     fs11, ft2, ft3
                  slti         s8, s4, -1642
                  fmin.s       fs7, ft4, ft3
                  div          tp, s9, s9
                  fcvt.s.wu    fs2, a2, rtz
                  fsgnj.s      fa7, fa1, ft0
                  divu         s4, t3, a1
                  auipc        s2, 930774
                  feq.s        a2, fs3, fs8
                  srai         s10, s11, 23
                  fclass.s     t4, ft11
                  divu         s9, s5, a6
                  fclass.s     a4, ft4
                  auipc        s8, 720062
                  fsub.s       fs5, fa0, fs3, rup
                  srl          sp, ra, a4
                  sltiu        s0, a3, 1972
                  srai         a0, a5, 9
                  div          s6, t0, t2
                  rem          ra, tp, s1
                  auipc        s9, 1315
                  fcvt.wu.s    t4, ft9
                  mulhu        a4, s7, gp
                  fle.s        ra, ft5, ft11
                  fcvt.w.s     s1, ft5, rmm
                  srai         s6, t5, 10
                  sll          a7, a0, s8
                  divu         s0, t3, a3
                  fmin.s       fa7, fs4, fs7
                  sltiu        s3, zero, 1776
                  fadd.s       ft7, ft2, fa5
                  mulh         s10, gp, a7
                  addi         a1, a6, -1946
                  addi         t6, s7, 59
                  srli         t6, tp, 2
                  mul          a2, t4, ra
                  fmv.x.w      a0, fs2
                  addi         s1, s1, -484
                  nop
                  fmul.s       fa4, fs6, fa7, rne
                  slli         s1, s8, 3
                  fsgnj.s      fa0, fs4, ft0
                  fcvt.s.w     ft11, a1, rtz
                  mulh         tp, s9, s11
                  slt          a1, t6, t4
                  flt.s        a2, fa7, fa5
                  fmin.s       fa1, fs0, fs11
                  fsgnj.s      fs1, fs2, fa1
                  remu         a0, s4, a5
                  xori         t3, s8, -111
                  srli         a2, a5, 4
                  rem          s5, s8, t2
                  feq.s        a4, fs1, fa6
                  fmv.w.x      fs10, s1
                  srl          gp, s8, s2
                  sltu         a3, s1, a6
                  flt.s        a2, ft7, ft6
                  fcvt.s.wu    ft4, a5
                  mulhu        a3, t2, s0
                  fcvt.w.s     s5, ft10
                  sltu         ra, s2, a5
                  feq.s        ra, ft3, ft9
                  sltiu        s9, s8, -1706
                  addi         gp, tp, 1536
                  fle.s        a4, ft2, fs0
                  xor          t2, s3, t0
                  fclass.s     s1, ft8
                  srai         ra, s2, 13
                  fmv.x.w      tp, fs9
                  fsub.s       fs1, fa1, fs8
                  and          sp, s2, a0
                  srl          s0, zero, s7
                  nop
                  mulhu        s2, t4, s6
                  and          a1, t6, s1
                  srl          a2, s1, s1
                  fsgnjx.s     ft3, fs3, fa3
                  xor          a4, t1, a1
                  fclass.s     s1, fs9
                  or           gp, zero, s10
                  fcvt.wu.s    t2, fs11
                  auipc        a7, 250990
                  fsgnjx.s     fa2, fa4, fs11
                  nop
                  flt.s        s1, fa6, fa0
                  fmul.s       ft2, fs8, fa7, rtz
                  flt.s        a6, fs5, ft3
                  fdiv.s       fs2, ft3, ft0
                  lui          a1, 845652
                  mulh         sp, t6, s2
                  sub          gp, a5, s1
                  andi         s9, a0, -1320
                  fmul.s       ft6, ft0, fs8
                  fmin.s       ft9, ft4, fa0
                  divu         a1, tp, t3
                  flt.s        t1, ft0, fs11
                  fsgnjn.s     fa0, fs5, fa5
                  srli         s4, s3, 7
                  flt.s        a4, fs10, ft7
                  fcvt.w.s     a0, fs7
                  fsqrt.s      fa1, ft10
                  mulhsu       a3, t6, zero
                  lui          tp, 663467
                  sltu         t4, s6, t4
                  fcvt.s.wu    ft7, s0
                  lui          tp, 863047
                  fmax.s       fa3, ft4, fa2
                  mulhsu       s1, s3, t0
                  sra          a5, s1, s9
                  nop
                  fclass.s     s5, ft2
                  nop
                  mulhsu       t4, a5, s1
                  mulhsu       s8, s8, s11
                  srli         t2, s6, 22
                  xori         t1, ra, -465
                  add          a7, a0, s4
                  fmv.w.x      fs0, s1
                  fmul.s       ft6, fs2, fs6, rtz
                  mulhu        t6, ra, a1
                  lui          s4, 215884
                  fcvt.s.w     ft7, sp
                  slli         s0, a6, 4
                  fmin.s       ft2, ft7, fs5
                  xori         ra, s2, 673
                  sltiu        tp, gp, 1912
                  fsqrt.s      ft2, ft0, rtz
                  fcvt.wu.s    a5, fa0
                  addi         s6, t2, -1592
                  srli         a5, gp, 23
                  fmax.s       ft5, fa6, fa0
                  divu         s5, sp, tp
                  add          s4, ra, sp
                  slti         t2, s9, -352
                  fsgnj.s      ft0, ft9, fs6
                  fclass.s     s3, fs11
                  div          a5, s10, t0
                  auipc        s4, 375406
                  div          gp, t1, s9
                  fcvt.wu.s    a2, ft1
                  sub          s5, s7, t4
                  fsgnjn.s     fa4, ft7, fs9
                  feq.s        a2, fa3, ft11
                  fmul.s       ft0, ft9, fs1, rne
                  auipc        a0, 879313
                  slt          a1, a2, tp
                  slli         zero, gp, 23
                  fmul.s       fs2, ft4, ft8
                  fmv.w.x      fs1, t4
                  fcvt.wu.s    ra, fa4, rne
                  fmin.s       fa5, fs9, fa7
                  srai         s6, a4, 8
                  slti         gp, s3, -1974
                  fmv.w.x      fs3, t4
                  srli         a7, s9, 12
                  fsqrt.s      ft9, fs2, rup
                  xor          t3, s2, a2
                  remu         a7, tp, t6
                  slt          s2, s8, gp
                  xor          s11, t4, t5
                  mulh         s9, s0, s6
                  add          a6, t6, s0
                  fadd.s       ft0, fs7, ft8
                  add          tp, s4, s4
                  divu         zero, t2, a4
                  fdiv.s       fa0, ft8, fa4, rtz
                  mul          ra, sp, s10
                  fmin.s       fs3, fs6, ft10
                  slt          s6, a0, a6
                  fcvt.w.s     t1, fa1
                  fcvt.w.s     gp, ft4, rup
                  fsqrt.s      ft10, ft11, rmm
                  auipc        s5, 724942
                  srai         ra, a2, 4
                  fcvt.wu.s    a3, fa2
                  fmv.x.w      a5, fa7
                  fcvt.s.wu    fs2, t0, rup
                  feq.s        a7, fa2, ft7
                  mulh         ra, a6, a4
                  fcvt.s.wu    ft10, s4
                  sltu         s11, s4, a1
                  fsgnjn.s     fs0, fs4, fs8
                  srai         t2, s10, 4
                  mulhsu       s8, a4, s10
                  sltiu        s8, s10, 305
                  xor          a0, s7, s9
                  fcvt.s.w     ft11, a4, rtz
                  div          a7, a5, a7
                  fsub.s       ft4, fs5, fs0, rmm
                  fmul.s       fs0, ft9, fs8, rup
                  remu         zero, a1, ra
                  div          a1, s4, s2
                  srl          t3, s5, tp
                  srli         s8, s10, 28
                  slli         s4, a4, 17
                  fsub.s       ft10, fs4, fa5
                  mulhsu       s10, t1, tp
                  sra          s9, ra, ra
                  addi         a5, a3, 188
                  fdiv.s       fs10, fs10, ft9
                  divu         a0, a3, t2
                  sub          s2, a1, gp
                  sub          a5, a1, gp
                  srli         gp, s7, 22
                  fmul.s       fs6, fs8, fa1
                  slli         s8, t4, 9
                  mulh         gp, a5, s0
                  fclass.s     s4, fs0
                  auipc        t6, 863089
                  or           s1, t3, s4
                  sll          s4, t1, s9
                  fmax.s       ft7, ft7, fa1
                  sra          a6, s0, s6
                  feq.s        s11, fs1, fs10
                  xor          a1, t0, s10
                  feq.s        s8, fa0, fs10
                  fdiv.s       fs3, fa7, ft0
                  srai         a5, t5, 9
                  slt          s11, a2, a7
                  srl          t6, zero, a4
                  or           a5, a7, t0
                  andi         s6, s2, -458
                  fsub.s       fa3, fs6, ft10, rtz
                  mulh         s11, s2, a5
                  sra          a5, sp, t2
                  slti         a2, tp, 1983
                  remu         s9, sp, s5
                  mulhu        s8, a6, a0
                  rem          a6, s11, s5
                  mulhsu       a5, ra, ra
                  xori         s8, t1, -316
                  xor          s2, t4, a2
                  fmv.w.x      fs9, a2
                  add          s3, s9, sp
                  andi         ra, s5, -1870
                  xor          t2, s11, t5
                  sub          a0, t4, s7
                  sra          t1, sp, s10
                  sra          s1, s2, zero
                  fmv.w.x      fs8, t3
                  fsub.s       fa6, fa2, fa2
                  srli         t6, s5, 1
                  flt.s        t2, fs0, ft2
                  ori          s6, t2, 152
                  sll          s0, a6, t2
                  remu         s6, a0, a6
                  fclass.s     t4, fs1
                  fcvt.wu.s    t6, fs8, rdn
                  fdiv.s       fs1, fs9, ft0
                  srl          t1, a4, a2
                  fmv.x.w      a7, fs7
                  feq.s        s8, fs3, ft2
                  sll          gp, s2, t0
                  feq.s        a3, ft10, ft9
                  fcvt.s.wu    fs3, t5
                  lui          a3, 556286
                  fclass.s     t4, fs1
                  div          a3, tp, s8
                  fcvt.s.w     fs10, t4, rdn
                  rem          s3, t6, a2
                  mulhu        t6, a0, a6
                  fclass.s     a0, fs9
                  fle.s        a3, ft7, ft9
                  fsgnjn.s     ft11, fs0, ft5
                  mulhu        t6, a6, t1
                  rem          a3, s6, s0
                  sll          s3, t5, t1
                  xor          s2, t2, t4
                  fadd.s       fs3, fa1, fa5, rne
                  fmin.s       fs11, fa6, ft5
                  sll          s2, t0, a1
                  sub          t2, s3, s9
                  rem          zero, a0, s1
                  add          s4, a6, a4
                  feq.s        ra, ft3, fs2
                  fcvt.w.s     a5, fa7, rne
                  fcvt.s.w     ft11, t3, rdn
                  fclass.s     sp, ft4
                  xori         t3, s6, -202
                  remu         a7, t4, s4
                  srl          a0, t0, a3
                  feq.s        s11, ft6, ft8
                  divu         s10, t1, s3
                  fsqrt.s      ft4, ft6
                  ori          s1, s10, -463
                  fadd.s       ft2, ft3, fa1, rdn
                  fmax.s       fa7, ft10, fs2
                  fcvt.s.wu    ft10, s8, rmm
                  fmv.w.x      ft8, gp
                  ori          t3, s1, 105
                  fsgnjx.s     ft6, fs2, ft10
                  fle.s        ra, fs8, fs0
                  fdiv.s       fs5, fa5, ft2, rne
                  addi         s8, tp, 17
                  sltu         t2, ra, s9
                  fmin.s       ft1, fs4, fa4
                  div          a3, t3, zero
                  mul          s11, t2, s3
                  fdiv.s       fs6, fa7, fs5, rne
                  mulhu        s3, s10, tp
                  nop
                  fsub.s       ft7, fs0, fs2
                  fmv.w.x      ft8, a2
                  sub          t1, t6, t5
                  nop
                  fdiv.s       ft7, fs4, fa4, rup
                  fcvt.w.s     t4, fs6
                  fcvt.s.w     ft10, tp
                  sltu         a7, a4, t4
                  fsgnj.s      fs8, fa2, ft7
                  fadd.s       ft5, fa6, fs6
                  fsgnjn.s     fs1, ft0, ft3
                  addi         t2, a1, -149
                  sra          a0, t5, zero
                  auipc        s5, 506919
                  auipc        a3, 578004
                  fsgnj.s      fs8, fs9, fs0
                  slti         a0, t6, 2028
                  fmax.s       ft2, ft9, ft0
                  mulhsu       s4, a4, a5
                  fmax.s       ft10, fs5, ft2
                  fcvt.wu.s    gp, fs6, rne
                  fcvt.s.wu    fa7, gp
                  rem          a4, s3, a6
                  sltiu        t2, t5, 1805
                  rem          s11, s7, t4
                  slti         zero, s7, 338
                  fle.s        s10, ft0, fa2
                  fadd.s       ft2, fs7, fa0, rdn
                  mulhu        s1, s2, t6
                  fmax.s       ft11, fa1, fs3
                  xor          t6, t4, s9
                  srl          s11, s6, tp
                  divu         a7, gp, s7
                  mulh         s10, s0, t2
                  slti         s5, a0, -814
                  fmin.s       ft0, ft8, fs5
                  slt          t4, s9, a3
                  lui          t1, 332215
                  flt.s        s10, fs4, fs10
                  fmv.x.w      s3, ft2
                  fadd.s       ft3, ft2, fs3, rup
                  fcvt.s.wu    ft11, tp, rtz
                  fclass.s     s5, ft11
                  and          s1, s3, s11
                  fsgnjx.s     ft0, ft5, fa7
                  auipc        t3, 25481
                  fmv.w.x      fs4, t3
                  sra          ra, ra, s0
                  nop
                  feq.s        s10, ft0, ft6
                  mulhu        a7, a5, t1
                  fle.s        t4, fa4, ft5
                  fmul.s       fa7, fa1, fs10
                  fmv.w.x      fa2, s7
                  fsgnjn.s     ft9, ft5, fs3
                  fmin.s       fs10, fs10, ft9
                  fsgnjn.s     fs8, fa1, fs3
                  sltiu        a0, a6, -1482
                  sub          s9, s2, a1
                  mul          t6, t6, a3
                  fle.s        s11, ft5, ft4
                  rem          s5, a1, t4
                  xori         s6, s0, 317
                  ori          t3, tp, -1855
                  nop
                  fcvt.w.s     a5, ft0, rdn
                  fmax.s       fs5, ft0, fs6
                  mulhsu       a5, s8, t0
                  sltu         s0, sp, sp
                  sltiu        s5, t4, 912
                  fmv.x.w      s6, fs1
                  fsub.s       ft9, fs11, ft2, rmm
                  sra          a0, a5, a6
                  mulhsu       s11, a7, a5
                  fsgnj.s      fs2, ft10, fa5
                  fmv.w.x      fa3, zero
                  fmv.w.x      fs9, t0
                  addi         s9, a4, 1433
                  sltiu        t4, t2, 1171
                  auipc        t4, 530271
                  addi         s0, s3, -1748
                  fle.s        zero, ft11, ft2
                  xori         sp, tp, -800
                  and          ra, s11, t5
                  lui          a4, 11737
                  flt.s        s3, fs0, fa0
                  xori         s6, s5, -1591
                  div          tp, a6, gp
                  fle.s        s6, ft3, ft2
                  slt          s2, a3, s6
                  xori         s8, s6, 1884
                  addi         t4, s10, 1601
                  fcvt.wu.s    ra, fa4, rtz
                  fcvt.wu.s    t3, ft6, rtz
                  srl          ra, s8, t1
                  fdiv.s       ft8, fa5, fs10, rup
                  nop
                  fcvt.w.s     t2, ft8, rdn
                  lui          a7, 659539
                  auipc        zero, 337242
                  fsqrt.s      fs1, ft3
                  fsqrt.s      ft7, ft4, rup
                  fsgnj.s      fs3, fs4, fs7
                  sltiu        a2, s9, -656
                  fle.s        s11, ft4, fa1
                  fsqrt.s      fa3, fs2, rne
                  srai         s8, s4, 12
                  srai         t3, a4, 23
                  flt.s        s1, fs2, ft1
                  sll          t1, ra, s10
                  mulhu        zero, a5, t0
                  fsgnj.s      fs10, fa4, fs5
                  divu         s5, ra, t3
                  fclass.s     s9, ft0
                  fcvt.s.w     ft9, a5, rdn
                  divu         s11, tp, s4
                  slt          s6, a5, a6
                  fsgnj.s      fs9, fs11, ft11
                  mulhu        a0, s5, s1
                  auipc        t3, 54096
                  fcvt.s.wu    ft1, t3
                  sltu         a5, gp, t2
                  fcvt.w.s     s4, fa6
                  sltiu        s4, gp, 816
                  div          s5, s4, zero
                  xori         t4, s8, -133
                  srai         a5, s4, 6
                  fsgnjx.s     fa5, ft0, fs2
                  fsub.s       fs2, fa3, ft11
                  mulhu        t6, tp, t1
                  nop
                  fcvt.s.wu    fs1, s4
                  fcvt.wu.s    a5, ft0
                  mulh         s9, s2, t3
                  sll          tp, gp, t4
                  sll          ra, s3, ra
                  sll          s11, ra, t1
                  ori          s5, s3, 54
                  rem          t3, s10, s9
                  srli         s5, s11, 13
                  addi         t6, a2, -1669
                  fcvt.w.s     a5, ft8
                  fcvt.s.w     ft5, t3, rne
                  fmv.w.x      ft5, t6
                  add          a7, s2, a5
                  fsub.s       fs1, fs5, fa2
                  fmul.s       ft5, fa1, fs8, rup
                  add          s6, a5, a7
                  rem          a0, a3, a2
                  fsub.s       fs11, ft5, ft9
                  fsgnj.s      ft7, fa0, fs7
                  fmax.s       ft4, ft7, fs11
                  fsub.s       fa1, fs7, fs11, rdn
                  auipc        t4, 548437
                  xor          t1, t0, s6
                  or           s2, a7, gp
                  mul          s5, a7, t5
                  andi         s11, s6, 2020
                  rem          ra, t4, s4
                  fmin.s       ft9, fs2, fs0
                  fcvt.w.s     s9, fs6
                  mulhsu       t4, t5, a6
                  fclass.s     a4, ft10
                  fadd.s       fs9, fs9, fs6
                  fmv.w.x      ft10, s11
                  xori         ra, t6, 690
                  sll          zero, a5, ra
                  remu         a0, a3, a3
                  sub          a3, s9, t3
                  sltu         a3, s7, sp
                  fsgnj.s      fs4, fa5, fa5
                  lui          sp, 320262
                  fsub.s       fs7, ft9, ft10
                  sra          s2, a6, t2
                  mulhsu       s2, sp, zero
                  addi         s0, t5, -1057
                  rem          s6, a5, s11
                  srli         a6, a5, 24
                  srai         s3, sp, 24
                  slt          s2, t5, s10
                  sll          s1, sp, t0
                  and          a4, s4, t2
                  andi         s3, s11, 726
                  addi         t3, a7, -1930
                  fmv.w.x      fa1, gp
                  nop
                  fmul.s       fs8, fs9, ft5
                  fcvt.w.s     zero, fa4
                  fsub.s       fa0, ft0, fs8
                  fclass.s     ra, fa4
                  or           tp, t1, s11
                  fdiv.s       fs0, ft2, fs1, rne
                  andi         s4, t6, -707
                  slti         sp, s9, -1819
                  flt.s        s0, fs10, ft2
                  slli         s1, t5, 28
                  fsgnjn.s     fs7, ft2, ft9
                  or           a1, a5, s6
                  fsub.s       ft2, ft8, fa1, rdn
                  srli         a2, t5, 6
                  srl          t3, t3, t1
                  fmul.s       fa0, fs5, fa1, rmm
                  fcvt.s.w     ft11, t1, rne
                  fmax.s       fa4, fs3, ft7
                  fcvt.wu.s    a3, ft5
                  lui          s4, 195837
                  fcvt.s.wu    ft10, a6
                  slli         a7, t0, 30
                  auipc        s2, 921944
                  fmax.s       fs5, ft5, fs10
                  fcvt.w.s     gp, fs0
                  fcvt.w.s     t1, fs0
                  fsgnjn.s     ft2, ft7, fs0
                  fsgnj.s      fa7, ft10, ft7
                  fcvt.wu.s    tp, fs3, rtz
                  mulhu        s3, s9, ra
                  sltiu        tp, a4, -249
                  fcvt.s.wu    fa5, ra, rtz
                  fsgnjx.s     ft10, fs8, fs3
                  slti         s4, t0, -538
                  mulh         s9, t1, t3
                  fadd.s       fs4, fs2, fs2
                  fcvt.wu.s    s8, fa5
                  div          s6, t6, gp
                  srl          a3, s8, a4
                  fsgnjn.s     fs9, ft3, fs11
                  fmin.s       fs2, ft1, ft1
                  srl          t4, t0, a4
                  auipc        t3, 165027
                  feq.s        ra, ft11, ft5
                  sub          sp, t0, a7
                  mulh         a0, s11, t5
                  sltiu        gp, t4, -296
                  mulhsu       s10, s10, s8
                  fsgnjx.s     ft5, fs5, ft4
                  add          s6, a5, s8
                  mulhsu       ra, t1, a0
                  mulh         s4, s0, gp
                  srai         s10, t4, 26
                  mul          s4, s1, t6
                  flt.s        s8, fs7, fa7
                  sra          s5, s6, zero
                  srai         a1, s6, 13
                  fmin.s       fa6, ft10, fs4
                  srl          a6, a0, a7
                  or           s0, a5, t3
                  srl          t2, s10, gp
                  sltiu        s1, t2, 1456
                  flt.s        a4, fs11, ft0
                  fdiv.s       fs10, ft1, fs5
                  fle.s        a0, ft7, ft11
                  fmv.w.x      ft4, tp
                  fmul.s       fs0, fa7, fs8, rup
                  slt          t2, zero, a6
                  flt.s        a4, fs1, fs0
                  srai         t3, a4, 10
                  fmv.w.x      ft9, gp
                  slt          s6, s10, t5
                  divu         t2, a5, t4
                  fsgnjn.s     ft4, fs8, fa4
                  fmv.x.w      t6, fs10
                  remu         sp, t5, a3
                  fadd.s       fs7, fa4, fa1
                  feq.s        s10, fs3, ft6
                  add          a4, sp, t1
                  sra          s8, a2, gp
                  auipc        t2, 912243
                  xor          gp, s2, s10
                  lui          a7, 751351
                  fsgnjx.s     fa2, ft2, fs5
                  and          a4, tp, a5
                  slti         a5, s3, -1679
                  mulh         s5, a4, s1
                  add          a5, a3, sp
                  srai         s3, s7, 30
                  mulhsu       s0, a3, s10
                  sra          t1, t0, t5
                  remu         s11, gp, a2
                  sra          s8, tp, a6
                  fadd.s       fs9, fs5, fa4
                  fsqrt.s      fs1, ft11, rne
                  mulhu        s8, a6, s4
                  fclass.s     s2, fa2
                  xor          s4, s4, a1
                  fle.s        t3, fa1, ft6
                  srl          s10, t2, t6
                  sltiu        a2, a6, -223
                  srli         s1, ra, 7
                  sltiu        s11, a2, -211
                  srl          t3, a4, s11
                  fcvt.s.wu    ft9, s6, rtz
                  fclass.s     a1, fs1
                  add          s5, s1, a4
                  lui          a7, 621513
                  mul          s8, s0, s1
                  fmv.w.x      fa4, a4
                  sub          ra, t0, a6
                  fsqrt.s      fa5, ft3
                  or           a0, a7, s11
                  nop
                  fle.s        a4, fs9, ft10
                  fcvt.wu.s    ra, fs3, rdn
                  div          s6, s9, tp
                  xori         s0, s0, -748
                  fmin.s       fa5, fs3, ft5
                  or           s6, sp, t4
                  mul          t2, t0, a5
                  fdiv.s       ft11, ft6, ft1, rtz
                  fmul.s       fa3, fa0, fs6
                  feq.s        a5, fs10, ft11
                  fmv.w.x      fa7, s1
                  fmul.s       fs6, fs8, ft1
                  fsgnjx.s     fs0, ft4, fs0
                  mulh         s2, t2, a1
                  mulh         t4, t1, s8
                  or           a3, a5, t1
                  lui          a5, 986862
                  fsgnjn.s     ft6, ft5, fs4
                  fclass.s     t1, fs0
                  fsqrt.s      fa4, fa0
                  fmv.w.x      fs6, ra
                  fcvt.s.wu    fs10, a6, rdn
                  ori          s2, s8, 1976
                  fmul.s       fs1, ft0, fa1, rdn
                  or           a0, s11, s6
                  slt          a4, a2, t1
                  fsgnjn.s     fs11, ft6, ft10
                  fmax.s       fa3, ft1, ft0
                  fle.s        s6, fa5, ft10
                  fsgnjx.s     fs11, ft11, fa0
                  lui          t3, 862537
                  fmv.x.w      s11, ft0
                  mul          gp, t3, a6
                  fmv.x.w      t1, ft1
                  srai         s11, a1, 31
                  sub          s5, a5, s1
                  fsgnjn.s     ft9, fa1, ft8
                  fadd.s       fa0, fs1, fs10, rup
                  flt.s        s4, ft2, fs3
                  andi         s10, a7, 9
                  xori         gp, t1, -622
                  fclass.s     s10, ft2
                  srl          s4, t6, s8
                  ori          t4, zero, -1614
                  divu         s5, a0, s7
                  fclass.s     a3, fs10
                  srai         a1, a2, 23
                  remu         s3, t5, t0
                  srai         a1, a1, 11
                  fdiv.s       ft1, ft8, ft1
                  or           s2, s4, s8
                  div          sp, s8, zero
                  srli         s3, s2, 4
                  fsqrt.s      ft10, fs7
                  fcvt.s.wu    ft8, s11, rmm
                  fcvt.w.s     s11, fa3
                  fmax.s       ft1, fs1, ft10
                  ori          a3, s11, 1437
                  or           a5, t4, s7
                  fmax.s       fa6, ft11, fs1
                  srai         t4, s8, 2
                  divu         s4, zero, a4
                  mulh         gp, a6, s5
                  ori          s9, gp, -1395
                  flt.s        s8, ft2, fs9
                  rem          s0, t5, t5
                  srl          zero, a7, s4
                  fsub.s       fa2, fa3, fa0
                  fmv.w.x      fs8, s2
                  srli         t3, t6, 18
                  fcvt.s.w     ft10, t1, rne
                  nop
                  fclass.s     s5, ft1
                  xor          a6, s10, s5
                  sra          t2, t4, s10
                  div          s4, a6, s4
                  fcvt.w.s     s4, fs4
                  xori         s6, a6, 529
                  fcvt.s.wu    fa0, a7, rtz
                  sub          sp, a7, a4
                  div          s11, s7, tp
                  xor          t6, ra, s9
                  slt          t2, a6, t6
                  fcvt.s.w     ft10, a3
                  fcvt.s.w     fs3, s4
                  xor          a3, s1, t5
                  sll          t1, t4, t4
                  sra          s9, a2, s0
                  mulhsu       t6, s5, s11
                  fclass.s     ra, ft10
                  fsgnj.s      fa7, fs11, ft0
                  fcvt.s.w     ft7, s6, rne
                  addi         s2, a3, 830
                  fdiv.s       fs7, fs0, fs6, rdn
                  flt.s        s0, fa7, fs10
                  fmv.w.x      fa5, t5
                  nop
                  auipc        s6, 263577
                  fmul.s       fa6, fa5, ft1
                  mul          t6, s11, a5
                  srai         s2, a0, 20
                  nop
                  fcvt.w.s     a2, fa4
                  slt          s3, zero, ra
                  fcvt.s.w     fs7, s9, rdn
                  sra          t2, ra, t1
                  auipc        sp, 900567
                  or           s5, s7, t1
                  sra          s11, s2, t1
                  div          a2, t0, zero
                  fmin.s       ft7, ft2, ft8
                  sra          sp, t6, a6
                  slli         a3, a5, 1
                  fle.s        a6, fs10, fa2
                  fsgnjn.s     ft1, fa4, fs0
                  fcvt.s.wu    fs4, a4, rup
                  fsgnj.s      fs9, ft6, ft9
                  sltiu        gp, t4, 1870
                  div          a6, s1, ra
                  srai         sp, ra, 20
                  div          gp, t1, t1
                  fcvt.s.wu    fa4, t6, rdn
                  fsqrt.s      fs7, fa0, rne
                  srai         a1, sp, 31
                  fdiv.s       ft9, fa4, ft5
                  auipc        s1, 174557
                  remu         s0, s8, s1
                  mulh         gp, a7, s2
                  divu         t3, a4, a6
                  fsgnjn.s     fa4, fa6, fs6
                  fmul.s       ft11, ft5, ft6, rup
                  fsub.s       fa3, ft11, fs0
                  ori          s3, t1, 897
                  flt.s        a4, ft8, fs8
                  fsub.s       fa5, ft6, ft2, rmm
                  fcvt.wu.s    s0, ft4, rdn
                  fsgnjn.s     fa4, ft4, ft5
                  slli         zero, tp, 25
                  slli         t6, sp, 30
                  remu         t4, s1, t2
                  nop
                  fmv.w.x      fs2, t2
                  fsub.s       ft7, ft5, fa7
                  divu         ra, s5, s7
                  andi         s6, a7, -104
                  fmul.s       fs0, fs5, fs2
                  addi         a4, s8, -1175
                  fcvt.wu.s    a7, ft0
                  srai         t2, a7, 30
                  and          s1, a1, a4
                  sll          a1, s10, s9
                  srli         s0, s4, 28
                  fle.s        s8, fs7, ft11
                  slli         a0, tp, 16
                  slli         s3, s7, 25
                  addi         s10, s1, -1856
                  slt          a1, t0, t1
                  fsgnjx.s     ft8, fs2, fa3
                  fmin.s       fa6, fs9, ft8
                  fdiv.s       fa5, fs10, fa1
                  nop
                  fcvt.w.s     a4, fa1
                  remu         gp, s1, t2
                  fsub.s       ft7, fs4, fs4
                  xor          ra, s1, zero
                  xor          tp, t1, a0
                  srl          a7, s0, a3
                  fcvt.w.s     s1, fs1
                  mulh         a7, zero, t6
                  fsub.s       fa7, ft5, fa5
                  sltiu        s10, s5, -1498
                  fle.s        s1, fs6, ft11
                  sub          t2, a0, t6
                  slt          a3, ra, t3
                  add          s8, a6, s10
                  slt          s9, tp, a3
                  srli         t3, t2, 22
                  or           s0, t1, s9
                  mulh         t3, a1, t4
                  fdiv.s       fs4, fs6, ft7, rne
                  fdiv.s       fs2, fs10, fa2
                  addi         t3, t4, 536
                  srl          s4, t4, a7
                  addi         tp, a6, -541
                  fmax.s       ft1, fa0, fa5
                  fcvt.wu.s    a3, fa7, rdn
                  add          s11, s3, s1
                  sltiu        a7, sp, -1070
                  fsgnjx.s     fs1, fa3, fa6
                  mulh         a5, s4, a7
                  sltu         s6, zero, a6
                  fcvt.wu.s    a4, fs9
                  fmax.s       fa3, fs7, ft8
                  fcvt.wu.s    s6, ft8
                  auipc        a0, 817949
                  fcvt.s.wu    fa1, t6
                  sra          t2, t1, a7
                  slli         s10, t5, 27
                  xori         t1, t3, -1792
                  fcvt.wu.s    gp, fa2
                  fsqrt.s      fs3, fs2, rmm
                  srli         zero, sp, 30
                  add          s6, s2, t4
                  ori          a7, t1, -770
                  fsqrt.s      ft2, ft9
                  mulh         s4, a3, s2
                  fcvt.s.wu    fa6, gp
                  fsub.s       fs9, ft11, ft3
                  fsgnj.s      fa1, ft9, fs9
                  rem          a6, a2, a1
                  remu         a1, t3, a0
                  slti         s8, t4, 1012
                  fmul.s       fs10, fs3, ft0
                  fcvt.s.wu    fa1, s6
                  slt          sp, t0, a7
                  mulhsu       sp, s4, t4
                  fadd.s       ft2, fa1, ft6
                  fsgnjx.s     fs10, fs7, fs10
                  auipc        a3, 810645
                  nop
                  nop
                  mulh         s11, t2, a7
                  sub          s4, t5, a2
                  mul          a2, a0, a0
                  fsqrt.s      fs2, fa5, rdn
                  fclass.s     s0, fa2
                  sll          s11, zero, a0
                  fmv.w.x      fs0, sp
                  fdiv.s       fs6, fs5, fs3, rdn
                  fcvt.s.w     ft1, t5
                  xor          a5, a2, s7
                  andi         s5, t2, -1989
                  sub          a0, a6, t4
                  fclass.s     a3, fa6
                  fsqrt.s      ft2, fa6
                  andi         s1, a3, -1295
                  fclass.s     s1, ft6
                  fsgnj.s      fs0, fa5, fs5
                  addi         ra, tp, -674
                  flt.s        s2, fa3, fa3
                  sll          ra, s0, sp
                  fclass.s     s2, ft8
                  fmv.w.x      fs2, t2
                  sra          s4, s1, s1
                  slti         s8, a6, -509
                  slt          s8, t2, gp
                  mulhu        t2, s0, s10
                  fsgnjn.s     fa4, fa6, fa0
                  lui          t2, 480261
                  fmin.s       ft6, ft1, fa5
                  fle.s        a6, ft2, fs2
                  xori         a0, a4, 1171
                  mulhu        a6, t6, tp
                  fmul.s       ft4, fa4, fa5
                  sll          a5, tp, a1
                  fmin.s       fa5, fs9, fs1
                  fmax.s       fa6, fa6, ft6
                  mulhsu       s4, s10, tp
                  xori         tp, s10, -173
                  xor          s0, a2, tp
                  div          s10, a6, s5
                  srai         s6, t5, 21
                  srai         sp, t5, 9
                  srai         a2, gp, 1
                  fmul.s       ft11, fs2, fa1
                  xor          s9, a2, a5
                  fsgnjx.s     fs3, fs0, fs11
                  or           a0, s5, s3
                  fdiv.s       ft10, fs6, ft10
                  lui          a5, 125966
                  xori         tp, s5, -1288
                  add          s5, s11, s4
                  xor          s2, t4, s10
                  rem          a6, t1, s3
                  fcvt.s.w     fa0, s7, rtz
                  lui          t6, 444478
                  slt          tp, a1, s3
                  nop
                  mulhu        s1, t5, a7
                  fmin.s       ft10, fs7, ft9
                  fdiv.s       fa5, ft3, fs1
                  fsgnjx.s     fs9, ft1, ft5
                  fmin.s       fs0, fs0, fa6
                  sltu         a5, t2, s3
                  fdiv.s       ft3, ft3, ft6, rmm
                  xor          s0, s4, s1
                  mulhsu       s11, zero, a5
                  srli         a6, s0, 26
                  slti         s8, a0, 609
                  or           a3, sp, t0
                  fclass.s     a7, fa5
                  fcvt.s.w     fs3, a4
                  fsgnjx.s     ft5, fs2, fa5
                  fcvt.s.w     fa0, tp, rtz
                  fmax.s       ft7, ft3, fs2
                  xor          s4, a0, a2
                  sub          a4, sp, s9
                  fsgnj.s      fs0, fs7, ft1
                  ori          gp, a4, 1525
                  fmv.x.w      ra, fa1
                  fsgnjx.s     fs3, fa4, ft3
                  fmin.s       fa5, ft4, fa0
                  add          s11, t1, tp
                  fsub.s       fs0, fa4, ft8
                  fle.s        s3, ft11, ft5
                  fsgnjx.s     fs2, fa7, fa5
                  srl          sp, t3, t6
                  fsub.s       ft11, ft11, ft9, rtz
                  mulhsu       s2, a5, a2
                  add          gp, t6, t3
                  fadd.s       ft7, fs1, fa6, rdn
                  fmv.x.w      s2, fs9
                  srai         s2, t2, 23
                  fclass.s     t2, fs2
                  nop
                  xori         a4, t6, -1260
                  divu         a2, s1, s9
                  fcvt.s.wu    fs7, s5
                  slt          s6, t4, a5
                  auipc        s2, 391075
                  mulh         s6, gp, s0
                  div          t2, a6, t3
                  fmin.s       ft10, fs7, ft7
                  auipc        a6, 1017865
                  fcvt.w.s     ra, ft2
                  fsgnjn.s     fs7, ft11, fs6
                  fadd.s       fa1, ft10, ft0
                  divu         s1, gp, s0
                  remu         t4, t4, s2
                  divu         s10, a5, s6
                  fsgnjx.s     fa1, ft0, fs0
                  fmul.s       ft2, ft4, ft2
                  sltiu        s3, t3, 1446
                  sltu         t2, s10, t4
                  srai         t2, tp, 27
                  addi         s5, s10, 1010
                  fadd.s       fs8, ft11, fa5
                  fmul.s       fs6, fa7, ft8, rdn
                  flt.s        s10, ft5, ft5
                  mul          ra, s10, gp
                  fsgnjn.s     fa3, ft9, ft5
                  srl          t3, tp, s8
                  lui          s0, 809573
                  and          a1, s7, s3
                  fle.s        s6, fs10, fs10
                  fmax.s       ft8, fa1, fs7
                  sll          a0, s0, a0
                  slti         t6, a5, -371
                  slti         a1, a0, 1625
                  or           ra, s0, a2
                  flt.s        a3, fa1, ft2
                  fmul.s       ft5, fa2, ft0, rne
                  nop
                  fcvt.wu.s    gp, ft8
                  fsub.s       fs3, ft1, fa0, rdn
                  fle.s        tp, ft10, fs1
                  fmin.s       fs7, ft5, fs11
                  fcvt.s.w     ft10, t2, rtz
                  fmax.s       ft0, fa4, fa3
                  srli         a1, zero, 27
                  sltiu        t1, a7, 106
                  fdiv.s       fa3, fa7, fs6
                  fsgnjx.s     fa4, fs11, fs5
                  sub          sp, sp, sp
                  sltu         a4, a0, s1
                  mulhu        t2, s9, s6
                  divu         a5, t4, s1
                  srli         t4, s1, 15
                  fsqrt.s      fa5, fs9, rdn
                  sltu         a3, s1, tp
                  fcvt.s.wu    ft8, t3, rmm
                  sltu         tp, tp, s11
                  sra          s2, s0, s0
                  srli         s3, s10, 31
                  xori         t6, s0, -475
                  sltiu        a5, s0, 1720
                  fmv.x.w      s11, fa1
                  slti         zero, a5, 768
                  fsqrt.s      fs4, fa3
                  fcvt.wu.s    a0, fa0, rup
                  srai         a3, t1, 23
                  sltiu        a1, t2, -299
                  andi         s4, s5, 1788
                  fcvt.wu.s    s8, ft4, rtz
                  fle.s        tp, fs7, fa5
                  srli         s0, a1, 0
                  flt.s        zero, fs5, fa3
                  fmin.s       fs1, fa4, fs5
                  rem          s6, t1, t2
                  srl          s9, sp, t4
                  sra          s5, s2, s7
                  fcvt.s.wu    fs8, t6, rdn
                  fsgnj.s      fs7, fa5, fs0
                  mulhu        zero, s8, t6
                  sltu         a5, t4, gp
                  slli         t4, s11, 9
                  fmin.s       fa0, fa2, ft8
                  remu         s6, a2, s3
                  nop
                  srai         sp, s11, 7
                  lui          a4, 257529
                  add          zero, s3, gp
                  fclass.s     s3, ft8
                  sll          s2, gp, s1
                  lui          a6, 554657
                  ori          a6, s2, -1453
                  mulhsu       a3, s8, a1
                  fcvt.wu.s    t6, fs1, rmm
                  fdiv.s       ft1, ft3, ft7, rup
                  add          a2, gp, s3
                  xor          tp, t2, s9
                  fmv.x.w      sp, fs4
                  sra          t4, a4, sp
                  fdiv.s       ft8, ft1, fs2
                  mulhsu       s3, s3, gp
                  srai         s8, ra, 23
                  div          ra, s7, s5
                  fsqrt.s      ft11, fs5, rne
                  remu         s6, a1, a3
                  addi         s2, s11, -320
                  fmax.s       fs10, fs11, fs5
                  fcvt.wu.s    a0, fa0
                  srl          sp, s11, tp
                  fmax.s       fs3, ft8, ft3
                  ori          s6, s1, 558
                  feq.s        tp, ft11, ft6
                  add          t3, a6, gp
                  sub          t1, sp, a4
                  remu         s5, s8, a7
                  rem          t6, s0, s0
                  feq.s        a4, ft0, fs6
                  srli         a0, t5, 29
                  lui          tp, 249145
                  fsgnjx.s     ft9, ft6, fa2
                  slt          s11, a4, s8
                  sra          s3, a4, s7
                  slt          a6, t5, s0
                  fmul.s       ft3, fs1, ft7
                  sub          t6, t0, t1
                  fadd.s       fs1, fs11, ft10, rdn
                  add          s6, s0, s10
                  addi         t2, s4, 1878
                  fclass.s     t2, fs2
                  fcvt.w.s     a1, fs8, rmm
                  srli         sp, s2, 26
                  fcvt.w.s     s4, ft1
                  feq.s        s0, fa5, ft7
                  mulhsu       tp, s4, s0
                  fadd.s       ft3, fa1, fa0, rmm
                  remu         t1, s8, sp
                  fle.s        a7, ft4, fs10
                  ori          gp, s0, 1692
                  srli         s3, ra, 22
                  and          t2, s8, a7
                  slti         a1, t4, 975
                  xori         s0, a1, -1180
                  xori         s6, s5, 633
                  lui          t4, 121138
                  slt          s4, a2, t6
                  fdiv.s       fs9, fs10, fa0, rdn
                  remu         a6, s2, a6
                  fsgnjx.s     fa1, fa2, fs6
                  slli         tp, ra, 3
                  slt          s11, t4, a2
                  fmin.s       fa2, ft11, ft9
                  div          s11, ra, a5
                  fadd.s       ft5, fa6, ft2
                  andi         t2, a6, -1603
                  sra          ra, a5, s6
                  divu         s5, tp, s11
                  srl          s1, sp, s5
                  fsub.s       fs5, ft10, ft7
                  fadd.s       fs6, ft5, fs11
                  nop
                  nop
                  xori         tp, t0, -890
                  fmv.x.w      a1, fa4
                  and          sp, s6, s3
                  slti         a6, a0, -308
                  divu         s10, t0, ra
                  fmv.w.x      fs5, s5
                  add          a0, gp, a2
                  slt          s6, a1, s0
                  addi         a4, a4, 833
                  fcvt.s.w     fs4, a6, rne
                  fmv.x.w      tp, fs10
                  sra          t1, s9, t3
                  srai         a0, s8, 10
                  add          gp, a5, s5
                  sll          a6, s8, s3
                  andi         t6, s1, 1050
                  fadd.s       ft11, fs4, fs10
                  fsgnj.s      fs10, fs9, fs2
                  divu         s1, a6, s6
                  fmul.s       ft6, fs9, fs8, rtz
                  sltiu        t4, s7, -169
                  and          s9, s1, s9
                  slti         a2, a4, -564
                  fmax.s       fs3, fs3, fs0
                  fmin.s       ft7, ft4, fa0
                  srai         s9, a1, 30
                  sltiu        a1, a3, 388
                  srl          s6, s5, a4
                  fsgnjn.s     fa2, ft1, fs2
                  fsgnjx.s     ft2, fs9, fa3
                  feq.s        t3, ft1, fa7
                  slli         t2, a0, 2
                  slt          s5, a2, s4
                  ori          sp, ra, -511
                  auipc        zero, 883026
                  fsqrt.s      fa4, ft10
                  lui          a2, 690045
                  slt          a6, a3, t6
                  fmv.x.w      s8, fs4
                  fcvt.s.w     fa7, a7, rtz
                  sltu         a3, s10, a4
                  andi         t4, a2, -1989
                  addi         s1, s3, 1093
                  flt.s        t3, fa0, fs2
                  or           sp, s4, t1
                  mulhu        t3, s0, gp
                  sltu         ra, a0, t0
                  fle.s        s8, fs7, fa0
                  srli         a4, zero, 13
                  fclass.s     zero, fa2
                  divu         gp, zero, s1
                  srai         t4, a3, 28
                  fmin.s       ft3, ft9, fa7
                  add          a7, a2, a6
                  sltiu        s11, gp, 1757
                  slt          s11, t4, s9
                  nop
                  srli         a6, t1, 30
                  slt          sp, s5, s1
                  fcvt.s.w     fa4, s3
                  fmax.s       fs8, fa1, fa4
                  slti         ra, s8, -955
                  remu         s4, s0, a7
                  fmul.s       ft7, fs1, fs8, rup
                  slt          t3, s2, ra
                  sub          a6, s2, tp
                  and          a7, a6, a4
                  fle.s        s4, fs10, fs3
                  fmv.w.x      ft3, s4
                  feq.s        s5, ft10, fs0
                  srl          t3, t2, t2
                  feq.s        gp, ft4, ft3
                  fadd.s       fa5, fs8, fa0
                  auipc        t2, 408569
                  sltiu        a0, zero, 845
                  fsub.s       fa3, ft3, ft7, rup
                  and          a3, s6, t2
                  divu         gp, s8, s10
                  srai         a0, tp, 28
                  srli         s3, t0, 7
                  fdiv.s       fs3, fs3, ft9, rtz
                  feq.s        s10, ft5, ft9
                  andi         s0, s11, 1088
                  fsgnjn.s     ft6, ft10, fa6
                  flt.s        a1, ft1, ft1
                  fmv.x.w      a4, fs6
                  or           s10, sp, a5
                  fclass.s     s2, ft0
                  mul          tp, a1, t5
                  auipc        t3, 734974
                  xori         tp, t0, -1327
                  fsqrt.s      ft0, fa0, rne
                  nop
                  fcvt.wu.s    a1, ft11
                  slli         s8, gp, 3
                  nop
                  or           s3, s2, s1
                  sub          a5, t1, s8
                  xor          s3, s0, a7
                  addi         t4, s0, 1334
                  remu         a2, sp, s5
                  and          a0, a2, tp
                  fmv.x.w      a4, fa3
                  div          tp, t2, t6
                  fadd.s       fa2, fa7, fa5
                  fcvt.w.s     t2, fa5, rne
                  andi         s6, a7, -787
                  fmv.x.w      zero, fs2
                  addi         tp, a0, 1720
                  flt.s        s10, ft10, fa1
                  mulhu        sp, t0, s0
                  divu         s0, t0, a3
                  slti         s10, t5, 837
                  remu         t4, ra, a7
                  fdiv.s       fa7, fa3, ft8
                  fsgnjx.s     fa0, fs4, fs2
                  fsub.s       ft10, fs8, fs6, rne
                  xori         s1, a3, 60
                  sub          t4, ra, s7
                  fsgnjn.s     fs10, fs8, fa4
                  fcvt.s.wu    fa5, sp, rne
                  sltiu        t6, t2, 470
                  sltiu        s11, zero, -809
                  srl          a0, a1, s6
                  slt          s6, s1, a1
                  rem          a1, s9, t5
                  fmul.s       fs2, ft3, ft1, rdn
                  fcvt.s.wu    fs10, s6, rne
                  fsub.s       fa4, ft0, ft8
                  sltu         s1, t0, s6
                  sll          gp, a6, sp
                  sra          ra, a5, t4
                  srl          t2, s4, t1
                  mulhu        zero, a0, t2
                  fcvt.s.wu    ft9, s10
                  sub          s4, gp, s6
                  sra          s6, s1, t1
                  fsqrt.s      ft7, fs1, rtz
                  mulhsu       t3, t1, t6
                  fsub.s       ft6, ft2, fa3
                  srl          a1, s2, s0
                  fmul.s       fa0, ft2, fs9
                  fdiv.s       ft9, ft0, ft10
                  feq.s        t2, fa0, ft11
                  fsgnjn.s     fa4, ft7, fa4
                  fsgnjx.s     fa6, fs7, fs8
                  mulhu        s8, s5, s0
                  andi         s3, t6, -639
                  la x5, test_done
                  jalr x0, x5, 0
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
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_2:
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_3:
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_4:
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_5:
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_6:
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_7:
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_8:
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_9:
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_10:
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_11:
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_12:
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_13:
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_14:
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_15:
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

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
                  addi x23, x23, -4
                  sw  x30, (x23)
                  add x30, x23, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x23, x30, zero
                  csrr x7, 0x341 # MEPC
                  csrr x7, 0x342 # MCAUSE
                  li x15, 0x3 # BREAKPOINT
                  beq x7, x15, ebreak_handler
                  li x15, 0x8 # ECALL_UMODE
                  beq x7, x15, ecall_handler
                  li x15, 0x9 # ECALL_SMODE
                  beq x7, x15, ecall_handler
                  li x15, 0xb # ECALL_MMODE
                  beq x7, x15, ecall_handler
                  li x15, 0x1
                  beq x7, x15, instr_fault_handler
                  li x15, 0x5
                  beq x7, x15, load_fault_handler
                  li x15, 0x7
                  beq x7, x15, store_fault_handler
                  li x15, 0xc
                  beq x7, x15, pt_fault_handler
                  li x15, 0xd
                  beq x7, x15, pt_fault_handler
                  li x15, 0xf
                  beq x7, x15, pt_fault_handler
                  li x15, 0x2 # ILLEGAL_INSTRUCTION
                  beq x7, x15, illegal_instr_handler
                  csrr x15, 0x343 # MTVAL
                  1: la x5, test_done
                  jalr x1, x5, 0

ecall_handler:    
                  la x7, _start
                  sw x0, 0(x7)
                  sw x1, 4(x7)
                  sw x2, 8(x7)
                  sw x3, 12(x7)
                  sw x4, 16(x7)
                  sw x5, 20(x7)
                  sw x6, 24(x7)
                  sw x7, 28(x7)
                  sw x8, 32(x7)
                  sw x9, 36(x7)
                  sw x10, 40(x7)
                  sw x11, 44(x7)
                  sw x12, 48(x7)
                  sw x13, 52(x7)
                  sw x14, 56(x7)
                  sw x15, 60(x7)
                  sw x16, 64(x7)
                  sw x17, 68(x7)
                  sw x18, 72(x7)
                  sw x19, 76(x7)
                  sw x20, 80(x7)
                  sw x21, 84(x7)
                  sw x22, 88(x7)
                  sw x23, 92(x7)
                  sw x24, 96(x7)
                  sw x25, 100(x7)
                  sw x26, 104(x7)
                  sw x27, 108(x7)
                  sw x28, 112(x7)
                  sw x29, 116(x7)
                  sw x30, 120(x7)
                  sw x31, 124(x7)
                  la x5, write_tohost
                  jalr x0, x5, 0

instr_fault_handler:
                  add x30, x23, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x23, x30, zero
                  lw  x30, (x23)
                  addi x23, x23, 4
                  mret

load_fault_handler:
                  add x30, x23, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x23, x30, zero
                  lw  x30, (x23)
                  addi x23, x23, 4
                  mret

store_fault_handler:
                  add x30, x23, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x23, x30, zero
                  lw  x30, (x23)
                  addi x23, x23, 4
                  mret

ebreak_handler:   
                  csrr  x7, 0x341
                  addi  x7, x7, 4
                  csrw  0x341, x7
                  add x30, x23, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x23, x30, zero
                  lw  x30, (x23)
                  addi x23, x23, 4
                  mret

illegal_instr_handler:
                  csrr  x7, 0x341
                  addi  x7, x7, 4
                  csrw  0x341, x7
                  add x30, x23, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x23, x30, zero
                  lw  x30, (x23)
                  addi x23, x23, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x7, 0x300 # MSTATUS;
                  csrr  x7, 0x304 # MIE;
                  csrr  x7, 0x344 # MIP;
                  csrrc x7, 0x344, x7 # MIP;
                  add x30, x23, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x23, x30, zero
                  lw  x30, (x23)
                  addi x23, x23, 4
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
