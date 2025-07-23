.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x20, h0_start
jalr x0, x20, 0
h0_start:
                  li x28, 0x40001120
                  csrw 0x301, x28
kernel_sp:        
                  la x18, kernel_stack_end

trap_vec_init:    
                  la x28, mtvec_handler
                  ori x28, x28, 0
                  csrw 0x305, x28 # MTVEC

mepc_setup:       
                  la x28, init
                  csrw 0x341, x28

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x28, 0x3800
                  csrw 0x300, x28 # MSTATUS
                  li x28, 0x0
                  csrw 0x304, x28 # MIE
                  mret
init:             
                  li x28, 0
                  fmv.w.x f0, x28
                  li x28, 2139095040
                  fmv.w.x f1, x28
                  li x28, 2139095039
                  fmv.w.x f2, x28
                  li x28, 2139095041
                  fmv.w.x f3, x28
                  li x28, 0
                  fmv.w.x f4, x28
                  li x28, 2147604161
                  fmv.w.x f5, x28
                  li x28, 2139095040
                  fmv.w.x f6, x28
                  li x28, 2139095039
                  fmv.w.x f7, x28
                  li x28, 2143289344
                  fmv.w.x f8, x28
                  li x28, 2139095040
                  fmv.w.x f9, x28
                  li x28, 223189
                  fmv.w.x f10, x28
                  li x28, 2139095039
                  fmv.w.x f11, x28
                  li x28, 2139095039
                  fmv.w.x f12, x28
                  li x28, 4286578688
                  fmv.w.x f13, x28
                  li x28, 2147483648
                  fmv.w.x f14, x28
                  li x28, 2147483648
                  fmv.w.x f15, x28
                  li x28, 2139095039
                  fmv.w.x f16, x28
                  li x28, 1806258788
                  fmv.w.x f17, x28
                  li x28, 4286578688
                  fmv.w.x f18, x28
                  li x28, 2143289344
                  fmv.w.x f19, x28
                  li x28, 0
                  fmv.w.x f20, x28
                  li x28, 0
                  fmv.w.x f21, x28
                  li x28, 2139095039
                  fmv.w.x f22, x28
                  li x28, 1960740162
                  fmv.w.x f23, x28
                  li x28, 2139095040
                  fmv.w.x f24, x28
                  li x28, 4286578688
                  fmv.w.x f25, x28
                  li x28, 2139095041
                  fmv.w.x f26, x28
                  li x28, 3473990135
                  fmv.w.x f27, x28
                  li x28, 4286578688
                  fmv.w.x f28, x28
                  li x28, 4286578688
                  fmv.w.x f29, x28
                  li x28, 2149725937
                  fmv.w.x f30, x28
                  li x28, 4286578688
                  fmv.w.x f31, x28
                  fsrmi 0
                  li x0, 0x583d3898
                  li x1, 0xac546d0e
                  li x2, 0xf89ce2c4
                  li x3, 0xd42a9a28
                  li x4, 0xc542b009
                  li x5, 0xbeeeaa
                  li x6, 0xa5fd2b69
                  li x7, 0xfd2e7738
                  li x8, 0xf597143f
                  li x9, 0x80000000
                  li x11, 0x80000000
                  li x12, 0x6c66440a
                  li x13, 0x80000000
                  li x14, 0x80000000
                  li x15, 0x80000000
                  li x16, 0x0
                  li x17, 0x80000000
                  li x19, 0xf9000210
                  li x20, 0xa202344a
                  li x21, 0x9c844a86
                  li x22, 0x80000000
                  li x23, 0xce7018f4
                  li x24, 0x44d2157c
                  li x25, 0xf415588b
                  li x26, 0x6
                  li x27, 0x0
                  li x28, 0xf717a35c
                  li x29, 0x0
                  li x30, 0xb
                  li x31, 0x80000000
                  la x10, user_stack_end
main:             sltu         t0, sp, s4
                  divu         t5, a0, t1
                  fmul.s       ft6, ft4, fs7, rne
                  sra          gp, sp, s2
                  or           gp, a7, s4
                  fmin.s       ft10, fs0, fa4
                  mulh         s0, s1, a2
                  fcvt.wu.s    t3, fa2
                  fcvt.w.s     t0, fs0
                  sltu         s9, ra, a7
                  fmv.x.w      sp, fs9
                  fmul.s       ft3, fa1, ft0
                  mulhu        t1, a5, t6
                  mulh         zero, t1, t0
                  fmin.s       ft4, fs4, ft7
                  srli         a2, a4, 25
                  sub          t4, tp, s0
                  flt.s        a6, ft9, fs2
                  or           t2, sp, s3
                  mulhu        t4, s3, t6
                  andi         a7, ra, -694
                  flt.s        a2, ft8, ft9
                  fle.s        tp, ft9, fa3
                  fmul.s       fa1, ft8, ft7, rup
                  fmv.x.w      s1, fa0
                  fsub.s       fs1, fs5, fa3, rne
                  xori         t1, t5, -1800
                  flt.s        s7, fa3, fa4
                  fsqrt.s      fs0, fa4
                  fle.s        a7, fs9, fs9
                  slti         s1, t1, -1824
                  slt          s10, t3, gp
                  fadd.s       ft10, fs3, fs10, rmm
                  sltiu        s11, s4, 1714
                  sll          a3, a3, s3
                  mulhsu       t3, s3, a3
                  mulhu        s6, s7, s11
                  fclass.s     a5, ft7
                  lui          a3, 944553
                  fcvt.s.wu    ft1, t2
                  and          s7, a0, a7
                  and          t1, s1, s1
                  addi         a1, a4, -1870
                  xor          a7, t4, s11
                  fle.s        ra, fs8, fs9
                  div          s3, a2, t1
                  remu         s5, a0, s5
                  fsub.s       fs1, ft9, ft11
                  fcvt.w.s     a2, ft0
                  or           a4, t6, a0
                  fmv.w.x      ft4, s0
                  mulhsu       a2, s6, s11
                  addi         a5, t5, -851
                  divu         s6, ra, t0
                  mulh         t6, t4, s10
                  flt.s        t6, ft9, fs1
                  mulh         s3, a0, a0
                  sltiu        s5, s7, 1836
                  rem          zero, s1, s11
                  fcvt.w.s     s7, fa2
                  mulhsu       t1, s0, s6
                  sub          t6, ra, s4
                  srai         t1, a6, 2
                  addi         ra, sp, -1165
                  feq.s        a1, ft9, ft11
                  mul          a3, t6, a4
                  fcvt.s.w     fs5, t2, rmm
                  mulhsu       s10, tp, s7
                  andi         s1, a6, -516
                  slli         s3, t4, 26
                  srl          t0, a2, s11
                  fcvt.wu.s    a7, fs7
                  mulhu        ra, t3, t5
                  sltu         a1, t3, s2
                  flt.s        sp, fs3, fa1
                  sub          a6, a0, t0
                  fsqrt.s      fs11, fs5
                  nop
                  srai         a3, t4, 5
                  fsgnjn.s     fs8, ft1, fs11
                  ori          t4, a3, -1705
                  mul          s1, a7, a7
                  mul          a1, tp, s9
                  flt.s        t3, ft3, fs8
                  fsgnj.s      ft3, fa6, ft10
                  and          t5, t5, s7
                  sll          t5, a6, s7
                  sltiu        s0, s11, 1800
                  ori          s5, a2, -1080
                  addi         zero, a1, -1408
                  add          s0, a5, t5
                  fmul.s       ft9, fa0, fa7, rup
                  div          s7, t3, a3
                  andi         a1, a0, 1371
                  slt          a3, s6, sp
                  fmv.x.w      zero, fs2
                  mul          s9, s0, s0
                  addi         s1, a1, -1144
                  or           gp, s4, s3
                  ori          t3, a7, 1605
                  feq.s        a7, fa4, fs3
                  remu         t2, a1, a0
                  fdiv.s       fs5, fs9, ft4
                  feq.s        t4, fa6, fs5
                  rem          s11, a3, s1
                  mulh         s10, s10, t0
                  sltiu        t2, a3, 1409
                  fsub.s       fs1, ft10, ft4, rup
                  andi         s5, s6, -1515
                  or           s0, t2, a6
                  slt          s1, t6, s3
                  fcvt.w.s     t2, fa0
                  slt          a6, s10, s5
                  fmul.s       ft8, fs0, fs2
                  fcvt.s.w     ft11, s6, rup
                  rem          gp, t0, t4
                  fle.s        s6, ft2, fa2
                  mulhsu       zero, a4, t4
                  fsgnjx.s     fs11, ft10, fa5
                  sltiu        a5, a7, 1930
                  fdiv.s       fs10, ft8, ft0
                  xor          a7, t0, s0
                  rem          tp, t5, zero
                  remu         a4, s5, sp
                  remu         a5, s3, t5
                  fadd.s       fs1, ft8, ft5, rup
                  sltu         s8, zero, sp
                  mul          s10, tp, s9
                  fadd.s       fa5, ft3, fs3, rmm
                  nop
                  fcvt.s.w     fa7, t3
                  fadd.s       ft3, fs4, fs8, rmm
                  or           a2, s11, s3
                  srl          t0, s0, s6
                  slli         a6, t0, 19
                  div          a6, a2, a2
                  sltu         zero, s11, t2
                  fmax.s       fs10, ft4, ft2
                  fmul.s       fs11, ft6, ft6
                  slli         a2, t4, 31
                  feq.s        s5, ft1, fs11
                  fle.s        s5, fa4, ft7
                  slli         s6, s5, 16
                  addi         a5, tp, -1707
                  fsgnjn.s     fs1, ft6, ft10
                  slt          s6, s5, s0
                  fmin.s       ft4, ft7, ft2
                  rem          a4, a7, gp
                  addi         t1, s10, 1650
                  srli         s5, t1, 23
                  feq.s        s11, fa5, ft5
                  fmul.s       fa2, fs5, fa4, rmm
                  rem          s0, a1, s5
                  mul          s7, zero, s2
                  slti         t6, s4, -1987
                  lui          t0, 27369
                  slt          s1, s1, t5
                  or           a3, t1, s1
                  srl          a2, a5, t6
                  fsgnjn.s     ft1, fa7, ft6
                  slti         t3, s9, 1164
                  fadd.s       fs7, ft7, ft6
                  rem          s9, s1, t4
                  fsgnj.s      fs3, fs4, fa6
                  fcvt.s.w     fs4, a4
                  slti         a7, ra, 875
                  addi         ra, zero, -1248
                  slli         t0, s3, 23
                  sltu         s5, t4, s4
                  lui          s0, 98603
                  divu         t4, s4, a5
                  mulhu        s1, a0, s10
                  ori          t0, s9, -2016
                  srli         sp, a7, 9
                  sub          s5, s7, t1
                  slti         s8, a1, -930
                  mul          s10, s6, zero
                  fsgnjn.s     fs0, ft6, fs2
                  xor          s11, a3, t3
                  fmin.s       fa6, ft0, fs10
                  sra          a2, a2, tp
                  fclass.s     t0, fa0
                  slli         a1, s9, 28
                  slli         s10, zero, 12
                  slli         s0, t0, 2
                  fcvt.s.w     fs5, s6, rtz
                  sltu         s5, a3, ra
                  fcvt.s.w     fa2, a4, rmm
                  lui          s1, 37769
                  sltu         t4, s9, a2
                  fclass.s     s11, ft3
                  fmv.x.w      s10, ft6
                  srl          t4, s3, zero
                  or           s6, t4, a6
                  srai         t5, tp, 28
                  fcvt.s.w     ft10, ra, rdn
                  flt.s        t0, fs6, ft10
                  auipc        s1, 925606
                  mulhu        s6, t1, tp
                  sub          a7, s5, s9
                  fsgnj.s      fs0, fs7, fs2
                  sub          t1, s8, s8
                  xor          s5, a4, gp
                  feq.s        t4, fs6, fs8
                  sltu         s8, s8, a5
                  flt.s        a6, fs0, fs8
                  auipc        gp, 405821
                  fcvt.s.wu    fs6, t1
                  xor          t6, s11, zero
                  fmax.s       ft6, fs0, ft2
                  srl          s6, s1, a2
                  sll          s1, s8, s3
                  sub          t1, s8, a3
                  fsgnjx.s     ft5, fs6, fa6
                  fcvt.w.s     s1, fa6
                  lui          a5, 506376
                  fsgnjn.s     fs11, ft11, fs0
                  srai         a4, t2, 5
                  flt.s        gp, fa5, fs6
                  fclass.s     zero, fs9
                  ori          a5, s8, -1885
                  mulh         t1, a3, a1
                  auipc        s7, 336967
                  auipc        a1, 963035
                  flt.s        t2, ft11, fs3
                  slt          tp, t1, t2
                  fmv.x.w      s5, fs0
                  fdiv.s       fs0, fs3, fa0
                  mulhu        a7, s1, s1
                  fsgnjn.s     fs3, fa0, ft2
                  ori          s10, ra, 1770
                  fcvt.s.w     fa6, t6
                  fcvt.w.s     s5, fs1, rne
                  sra          s7, ra, s4
                  sltu         s11, a7, s4
                  sll          a1, s9, s11
                  flt.s        s8, ft0, fa2
                  fcvt.s.wu    ft2, s10, rtz
                  fcvt.w.s     zero, fa3
                  srli         t3, s11, 4
                  fsgnj.s      fa6, fs8, fs2
                  fdiv.s       fa3, fa5, fs4, rtz
                  slli         sp, a0, 27
                  divu         s11, s1, a1
                  fclass.s     s1, ft8
                  fle.s        a4, fs0, ft8
                  feq.s        s9, fa1, fs9
                  mulh         ra, t3, s1
                  xori         s9, a1, 664
                  sll          t1, a1, a7
                  sltu         a4, t6, s4
                  sltiu        s9, s11, -1672
                  fsgnjx.s     ft4, ft0, fa2
                  fsub.s       fa0, fs7, ft11
                  fcvt.s.w     fs2, s7
                  fmul.s       ft6, fa5, ft1
                  nop
                  mulhu        t3, s11, a4
                  fmv.x.w      a1, fs0
                  fcvt.s.w     ft2, a5
                  fmv.w.x      ft2, s10
                  fcvt.wu.s    s0, ft7
                  sltiu        a1, tp, -1690
                  mulhsu       s6, s6, s9
                  srl          s7, s5, ra
                  remu         a6, s6, s11
                  andi         s8, s7, -1146
                  fclass.s     s6, fs7
                  mulh         sp, t4, a5
                  sll          s7, s11, a0
                  fmax.s       ft2, fs8, fa0
                  fsgnjx.s     fs2, fa1, fs9
                  fle.s        t0, ft9, ft11
                  fsgnj.s      fs4, fs9, fs1
                  fsgnj.s      fs9, fs8, ft2
                  fmv.w.x      ft3, s7
                  fsub.s       fa7, ft6, ft6, rdn
                  and          a3, s6, a2
                  fmv.x.w      sp, fs1
                  slli         a4, s6, 4
                  srl          s5, s2, t2
                  slt          ra, s2, a0
                  fsub.s       fs6, fs0, ft5, rmm
                  fle.s        a7, ft6, fa3
                  nop
                  ori          ra, a0, 2006
                  sltu         a2, gp, s1
                  sra          t0, a1, a2
                  slli         t6, a2, 28
                  slt          tp, ra, s1
                  add          t5, s6, a2
                  fmin.s       fa7, ft7, fs7
                  fsgnjn.s     fa0, fs11, ft5
                  sltiu        a2, t3, -1502
                  fcvt.s.wu    fs3, a7, rtz
                  mulhsu       a7, s4, t0
                  fsub.s       ft11, fs10, fs6
                  rem          gp, a7, a6
                  sub          s7, t5, ra
                  srli         s0, s9, 21
                  fdiv.s       ft3, fs6, fa6, rmm
                  sll          s0, s8, sp
                  xori         gp, s1, 1948
                  fcvt.s.wu    ft3, ra, rup
                  divu         t3, t3, a0
                  fmax.s       ft1, ft2, fs0
                  divu         t4, s11, tp
                  flt.s        s11, fa2, fs6
                  fcvt.w.s     s8, ft3, rne
                  slli         s0, t6, 12
                  nop
                  add          ra, a6, s2
                  fsub.s       ft3, fs2, ft1, rtz
                  andi         s8, s0, -520
                  xori         tp, a0, -1874
                  fsgnj.s      fa2, fs3, fs8
                  fmv.x.w      sp, fa4
                  fcvt.s.w     fs3, s2, rdn
                  fdiv.s       fs0, fs7, fa2, rmm
                  fcvt.s.wu    fs4, gp, rdn
                  slli         t2, s4, 18
                  fcvt.s.w     ft4, t3, rne
                  fcvt.w.s     a3, ft2
                  fsgnj.s      fa3, ft4, ft4
                  xori         s6, a3, -2006
                  xor          s5, a6, t0
                  fcvt.w.s     t0, fs10, rdn
                  rem          s0, tp, a5
                  sra          s9, t1, s5
                  lui          s5, 484409
                  feq.s        tp, fa6, fa2
                  srai         a2, a3, 2
                  fcvt.s.wu    fa7, t0
                  fclass.s     s11, fa2
                  slti         t3, t1, 108
                  and          s9, a5, s8
                  divu         t1, s9, t4
                  fsub.s       fs8, fa4, fa7, rmm
                  and          s8, tp, a1
                  addi         t4, a6, -1562
                  sll          s9, t2, t4
                  addi         tp, t2, -1276
                  auipc        a7, 185323
                  sltu         a1, a5, t0
                  srl          tp, t2, zero
                  fmul.s       fs4, fa0, ft10
                  srai         a2, s1, 13
                  slt          s0, t1, sp
                  addi         t6, ra, -892
                  lui          s6, 123803
                  fcvt.wu.s    t1, ft7
                  auipc        tp, 385723
                  fmv.w.x      ft7, t6
                  fsgnjx.s     fs0, fa5, fa6
                  fmax.s       fs9, fa1, fa4
                  add          t2, a4, t1
                  fdiv.s       ft2, fs11, fa1, rtz
                  sra          t2, a1, a4
                  sra          t2, s2, t0
                  sltu         s5, a7, s10
                  fcvt.wu.s    a3, ft9, rtz
                  fclass.s     s6, fs10
                  fcvt.wu.s    s6, fa5, rdn
                  srai         t5, a0, 18
                  xori         gp, zero, -1815
                  srl          s6, t5, a7
                  fcvt.s.w     fs2, gp
                  fle.s        s5, fs10, fs6
                  div          gp, t4, s10
                  srl          a6, s4, a5
                  flt.s        s6, fs5, fa1
                  fmv.w.x      fs7, s3
                  xor          s3, t2, s7
                  fmul.s       fa3, ft2, fa6
                  slli         a7, sp, 1
                  divu         zero, a3, tp
                  divu         s9, t2, s7
                  sll          a2, s5, a3
                  fmv.x.w      a2, ft6
                  sub          t5, a0, a5
                  lui          t0, 733993
                  ori          t0, t3, 511
                  fsqrt.s      ft7, ft4, rdn
                  fsgnjn.s     ft2, fs6, fs2
                  fadd.s       ft2, ft1, fs8, rne
                  andi         s11, s2, 1310
                  ori          a3, s8, 1530
                  sra          s1, s5, ra
                  remu         t3, a0, s2
                  srl          s1, s8, t4
                  xor          s9, ra, zero
                  fmax.s       ft3, fs6, fs6
                  div          s5, a7, a2
                  sll          a1, s1, s7
                  mul          s11, a0, s5
                  remu         sp, s3, t5
                  fsub.s       fs4, fa7, fs2
                  fadd.s       fs1, fa7, fs11
                  remu         a7, a1, t2
                  mul          t5, tp, a3
                  fcvt.s.w     fa3, t0, rup
                  flt.s        s11, fs9, fs3
                  rem          a1, t5, s3
                  fcvt.s.w     fs9, s0
                  fsqrt.s      fs4, ft9, rup
                  fcvt.w.s     a1, fs0
                  fle.s        t3, ft7, fa0
                  srli         s5, t5, 22
                  sll          s6, t4, t5
                  fclass.s     t2, ft3
                  fmv.w.x      ft3, zero
                  addi         s5, s8, -1738
                  xor          s9, s2, a1
                  slli         a3, s8, 10
                  flt.s        a7, ft6, fa1
                  mulhu        s8, sp, s9
                  fcvt.w.s     t0, ft8, rup
                  slt          a5, a0, t6
                  div          s10, a2, t4
                  fadd.s       fa3, ft5, ft10, rup
                  slt          sp, a0, s6
                  fdiv.s       fa4, fs10, fs5, rne
                  mul          a5, a3, s10
                  div          s0, t6, s10
                  lui          t4, 486765
                  and          s9, a6, s8
                  addi         t4, tp, 1040
                  srai         t4, ra, 18
                  fclass.s     t5, ft8
                  fcvt.s.w     fa2, t3, rmm
                  fcvt.w.s     s1, ft3
                  lui          a2, 119705
                  and          t1, t3, gp
                  nop
                  fcvt.wu.s    s11, fs8
                  fmax.s       ft10, ft1, fa2
                  mulh         t0, a2, t4
                  fcvt.s.w     fa0, a4, rtz
                  slt          s1, t0, s9
                  fcvt.s.w     fa0, s8, rdn
                  divu         a4, t5, tp
                  fcvt.w.s     s8, ft1
                  slti         t1, t1, 1173
                  fsqrt.s      fa5, ft1, rdn
                  slti         t6, t3, -656
                  srai         t6, t0, 6
                  srl          t5, t5, zero
                  fle.s        s7, fs4, fs3
                  sra          gp, t5, a6
                  fsqrt.s      ft10, ft6, rup
                  flt.s        s5, ft7, ft6
                  and          t1, s5, s8
                  fsgnjx.s     ft0, fa2, ft6
                  mul          t4, a7, t3
                  sra          t0, sp, gp
                  fmv.x.w      sp, fa7
                  slt          t2, s7, s3
                  mulhsu       t6, s2, a5
                  sltu         s7, a6, a0
                  ori          a6, ra, 170
                  srl          s8, t0, t5
                  fcvt.w.s     sp, fa4
                  srai         sp, a4, 29
                  sub          t6, s9, s0
                  feq.s        sp, fs6, ft6
                  sra          a2, t4, s3
                  flt.s        s11, ft1, fs5
                  mulh         t1, t0, sp
                  or           t2, s1, t0
                  sltu         a6, s10, a0
                  mulhu        gp, zero, s10
                  fsgnjx.s     ft11, ft11, ft7
                  xor          a2, a7, t4
                  sltu         s5, a7, t5
                  flt.s        t6, fs10, ft5
                  fsqrt.s      fa3, fa0
                  srai         sp, gp, 27
                  fsgnjn.s     fa4, ft5, ft3
                  fmul.s       ft7, ft9, ft3, rne
                  xor          s7, s0, a4
                  sltu         t4, s1, gp
                  sltiu        t2, a4, -1874
                  slt          t0, t2, s9
                  fsgnjn.s     ft9, fs0, fs4
                  div          t4, ra, s1
                  fcvt.s.w     fa0, a5, rmm
                  srli         s3, s0, 14
                  fsub.s       fa5, ft10, fa7, rmm
                  sltiu        tp, a7, -436
                  slli         s11, t3, 14
                  fcvt.w.s     a1, fs9, rne
                  xor          s6, a5, s3
                  xori         s10, s11, 4
                  fclass.s     t1, fs5
                  fle.s        a1, ft4, fs2
                  fle.s        s8, fs4, fs1
                  mulhu        a7, s6, s0
                  slli         a3, a1, 30
                  and          a2, t6, s7
                  divu         t5, a1, s0
                  fmax.s       fs5, ft5, ft4
                  sll          s10, s2, s6
                  fmv.x.w      s10, ft0
                  auipc        s1, 826072
                  fmax.s       fa5, fa5, ft1
                  or           tp, a0, s10
                  fsqrt.s      fs11, ft1
                  mulhu        t1, a6, t5
                  andi         a5, t4, 6
                  fsgnj.s      ft6, ft10, ft11
                  nop
                  feq.s        a5, fa1, fs5
                  fsqrt.s      fa4, fa6
                  feq.s        s9, fa3, ft10
                  fcvt.w.s     t2, fs7, rne
                  remu         s9, ra, t2
                  feq.s        a6, fa2, fa0
                  add          s1, s8, a1
                  or           a6, t6, s9
                  sltiu        s3, a2, 614
                  fmv.x.w      s6, fa4
                  auipc        t6, 236961
                  fmin.s       fs9, ft9, ft5
                  xori         sp, a3, -623
                  fsgnjn.s     ft2, fa7, ft10
                  fmul.s       fs10, fa0, ft3, rup
                  xor          s7, s2, s4
                  rem          s1, s5, t5
                  fsgnjn.s     fs8, fs2, fs3
                  fcvt.s.w     fa0, s5
                  slt          a5, t4, t0
                  fadd.s       fa1, ft11, fa2, rup
                  xori         a6, t6, -345
                  fclass.s     gp, fa5
                  fcvt.s.wu    fs1, s8, rup
                  slt          a4, t3, a6
                  div          s5, t3, s11
                  lui          s3, 268080
                  feq.s        s3, fa5, fa2
                  nop
                  mulh         sp, t2, t1
                  slli         s0, s5, 9
                  divu         t3, a5, gp
                  mulhu        s11, a0, s10
                  mul          s3, a2, t5
                  andi         t3, t4, 1465
                  slli         gp, s9, 5
                  remu         s0, a7, gp
                  srai         t6, s0, 11
                  andi         t3, a7, 452
                  or           a6, a7, s9
                  fle.s        t1, fa1, fs0
                  fcvt.s.w     ft9, s10
                  and          t0, t4, s5
                  fcvt.s.wu    fs2, s1, rup
                  fmax.s       fs0, fs10, fa6
                  srli         tp, s10, 3
                  mulh         a5, a6, gp
                  mulh         s7, ra, s7
                  srai         t1, tp, 25
                  fsub.s       ft10, ft2, fa1
                  nop
                  fclass.s     t1, fs6
                  divu         a1, a0, s2
                  srai         s3, a3, 29
                  fmv.x.w      s8, fs11
                  xor          a5, tp, a0
                  fdiv.s       fa3, fs2, ft5, rup
                  ori          t0, t5, -1966
                  fcvt.s.wu    ft9, s4, rtz
                  fdiv.s       fs4, fa2, fs11
                  slt          a3, s2, s2
                  mul          s0, sp, a3
                  sltu         s5, s3, s8
                  fmax.s       ft11, fa4, fs7
                  fsub.s       ft8, fa7, ft3
                  fadd.s       ft9, fs3, ft11
                  div          t0, s8, a2
                  fmax.s       fs4, fa6, fs6
                  fsqrt.s      ft1, fs8, rup
                  sra          s11, s4, t0
                  feq.s        a5, fs7, ft7
                  xori         s0, sp, 471
                  or           a3, a6, s8
                  sltiu        s8, s7, 1772
                  ori          t1, s4, 1071
                  sub          a5, s10, sp
                  remu         a1, t0, s11
                  remu         s6, s9, s11
                  fsgnjx.s     ft0, fa4, ft6
                  sll          a7, s11, a2
                  fle.s        ra, fs5, fa5
                  fclass.s     a1, fs0
                  fle.s        s9, fs2, ft0
                  fmin.s       fs2, fs7, ft8
                  fcvt.s.wu    fs7, t0
                  andi         sp, a3, -670
                  fadd.s       fa2, fs6, ft8
                  slti         s6, s7, 1584
                  fmv.w.x      ft4, s0
                  srl          t5, sp, t1
                  flt.s        t5, fs6, ft11
                  rem          t5, tp, s7
                  mulhu        a5, s4, t6
                  rem          t6, s8, t0
                  div          s11, t1, t4
                  xor          s6, s8, ra
                  srli         s1, t5, 8
                  divu         s1, zero, a4
                  fsqrt.s      ft7, ft0, rtz
                  xor          t5, t0, a0
                  fmv.x.w      a1, fs2
                  mulhu        s3, a5, tp
                  fle.s        t1, fs7, ft4
                  or           a7, s11, a3
                  and          a6, a0, s1
                  fdiv.s       fs1, fs4, fs0, rup
                  srli         ra, gp, 8
                  feq.s        t5, ft5, fa3
                  fmul.s       fa5, fa2, fa6
                  xori         a3, t0, 1440
                  fmul.s       ft4, fs2, ft4
                  fmin.s       fs1, ft8, ft1
                  slli         s11, t6, 5
                  slli         s5, t3, 18
                  addi         s11, s8, -272
                  fsqrt.s      ft6, fs9
                  fdiv.s       fa2, ft4, fa1, rne
                  add          zero, tp, s1
                  sll          s5, t1, t0
                  div          tp, s9, s0
                  fcvt.s.wu    fa1, s3
                  xori         s5, s2, -1211
                  slli         a1, s1, 18
                  auipc        t5, 303612
                  fcvt.w.s     t1, fs3
                  mulhsu       s6, s10, t5
                  divu         t4, gp, s0
                  sltu         t1, s5, s5
                  slli         t0, s9, 20
                  sll          s9, a0, t6
                  fmul.s       ft5, fa0, ft7, rtz
                  fsgnj.s      ft7, ft8, ft4
                  feq.s        a5, fs1, fa4
                  mulhsu       t3, t2, s10
                  rem          s11, s5, s2
                  divu         sp, gp, t1
                  srai         sp, tp, 27
                  xor          s3, a7, t4
                  addi         tp, gp, -339
                  fmv.x.w      t4, fs10
                  fsqrt.s      fs8, ft6, rmm
                  fcvt.s.w     fs7, s2
                  sll          t1, a1, gp
                  srl          t4, s4, s8
                  fcvt.w.s     tp, fs0, rdn
                  slt          a4, zero, a3
                  srai         a5, a5, 24
                  sll          s5, t5, gp
                  fle.s        a2, fa1, fa3
                  fsub.s       fs10, fa0, fs6
                  fmul.s       fa2, ft0, fa7
                  flt.s        a7, fa6, ft11
                  sra          t1, s9, zero
                  add          t0, t0, s0
                  xor          s7, sp, s11
                  fmul.s       ft2, ft7, fa3, rdn
                  div          s6, a1, t5
                  slt          t4, s0, a6
                  fmv.x.w      a2, ft2
                  fmv.w.x      ft10, s11
                  fdiv.s       fs3, fa3, fs11, rdn
                  fmax.s       fs6, fs0, fs8
                  fmv.x.w      s7, fa3
                  fsgnj.s      fa5, fs9, fs1
                  rem          s10, s0, t6
                  fcvt.w.s     t1, fa2, rdn
                  sll          a6, sp, t5
                  slti         s7, a5, 1478
                  fdiv.s       fa5, ft5, ft10, rup
                  fsgnjn.s     ft5, fa3, fs10
                  srli         t4, sp, 5
                  fcvt.s.wu    fs4, s3, rdn
                  mulhu        t5, a2, a1
                  nop
                  slti         s5, sp, -1746
                  slli         s8, s8, 23
                  fcvt.w.s     sp, ft3, rtz
                  mulhsu       s11, a2, s2
                  srl          t5, zero, s5
                  fmv.w.x      fs4, t1
                  srai         s1, s8, 27
                  fcvt.wu.s    a7, fa5
                  xori         s9, tp, 1319
                  mulhu        sp, t4, a3
                  remu         t0, s5, zero
                  xor          a5, a1, s9
                  add          t2, a6, s8
                  nop
                  fle.s        s9, ft11, ft4
                  feq.s        t0, ft11, fa7
                  slt          s6, s0, gp
                  sltiu        t5, t1, 1243
                  fmul.s       fs5, fs0, fs5, rdn
                  and          s11, sp, t3
                  fsgnjn.s     ft7, fs6, ft7
                  mulhsu       s7, s9, a5
                  fsgnj.s      fs1, ft5, ft9
                  fmv.x.w      t1, fs4
                  fmin.s       ft5, ft8, fs5
                  feq.s        a2, ft9, fs8
                  sra          s8, s8, a4
                  andi         gp, s5, 845
                  fsgnjn.s     fs1, ft3, fs7
                  fmv.w.x      fs2, s2
                  fcvt.w.s     s1, ft11
                  fclass.s     s5, ft9
                  srli         a6, s7, 24
                  srl          s11, s9, ra
                  mulhu        t3, s0, a2
                  div          t4, s8, s10
                  feq.s        a1, fs8, fs5
                  auipc        t1, 139122
                  divu         s7, a2, a2
                  fsqrt.s      fs8, ft11, rup
                  xor          s9, s10, tp
                  and          t5, a7, s10
                  remu         t1, a7, s0
                  fsqrt.s      fa1, fs3
                  sll          t0, t1, s7
                  auipc        s3, 128786
                  srli         t6, s10, 28
                  mulh         a6, ra, gp
                  sra          a2, s8, s1
                  lui          t2, 181072
                  divu         ra, s7, s4
                  xori         a6, t5, -906
                  andi         a7, s10, 768
                  fmv.w.x      fs5, t6
                  fcvt.wu.s    s6, fs2, rup
                  slt          zero, s2, a5
                  and          s6, t3, a3
                  sltiu        a2, s9, 0
                  fmv.x.w      sp, fs4
                  srl          tp, sp, gp
                  mulhsu       s9, s0, gp
                  fdiv.s       ft8, fs0, ft5
                  srai         t3, a7, 12
                  fcvt.w.s     zero, fa2, rdn
                  addi         t5, t1, 283
                  fsqrt.s      fa6, ft3
                  nop
                  and          ra, s4, s9
                  rem          s6, a4, a7
                  andi         t2, a6, -1634
                  rem          t5, zero, a3
                  fsgnj.s      fa2, ft8, fs11
                  fadd.s       fa0, fs1, fs9, rtz
                  and          s10, s5, t0
                  fadd.s       fs4, fa0, fs2
                  fsgnj.s      fs5, fs1, fs4
                  srl          s11, s1, a4
                  fsgnjx.s     fa0, fa3, ft3
                  fle.s        a2, ft6, ft11
                  fsub.s       ft6, ft0, fs7, rne
                  sltiu        s6, s11, -1916
                  lui          s10, 407704
                  mulhsu       a3, s11, t0
                  mulhsu       a4, t1, a1
                  andi         t5, s4, -1154
                  fdiv.s       ft2, ft8, fs6
                  srai         zero, sp, 26
                  fclass.s     sp, fa1
                  divu         s5, a0, a6
                  srai         a3, t6, 25
                  fmin.s       fa1, ft4, fa7
                  fmv.w.x      fa3, a1
                  srli         s10, t6, 2
                  fsgnjx.s     ft10, fs0, ft11
                  fcvt.s.w     fa5, a0, rmm
                  add          zero, s4, t6
                  fsgnj.s      fa2, ft3, fa1
                  sll          a7, s6, a7
                  slt          s5, s4, s2
                  mulh         t3, s4, s10
                  mulh         s10, s11, s10
                  or           a3, s8, s3
                  fadd.s       ft2, fs1, fa3, rdn
                  slti         a7, s11, 43
                  sub          s10, a1, s8
                  fclass.s     a1, fs1
                  fsgnjn.s     fs0, fa5, fs8
                  srli         s5, a3, 23
                  flt.s        s7, fs6, fa6
                  feq.s        zero, fs10, fa4
                  ori          s7, s1, 1308
                  or           a4, s3, gp
                  fmul.s       ft4, ft0, ft1
                  xor          s11, s7, a5
                  srai         s1, t3, 10
                  fdiv.s       fs0, fs3, ft6, rup
                  fmax.s       ft5, ft7, ft9
                  mulhsu       s1, t6, gp
                  fsgnjx.s     ft0, ft4, fa1
                  fcvt.s.wu    fs6, t6
                  fdiv.s       fs11, ft4, fa4
                  mul          t3, a5, a2
                  srli         s5, s3, 31
                  ori          t0, s7, 554
                  mulh         a3, t1, a7
                  fdiv.s       fa4, fa2, fs9
                  sltiu        s3, a2, 733
                  ori          s1, s3, -685
                  sra          a7, a5, a3
                  feq.s        s6, ft5, fs11
                  fcvt.w.s     s1, fa6, rdn
                  slti         a4, s8, 947
                  divu         ra, s3, s3
                  mulh         t1, a0, a2
                  sll          gp, a2, a6
                  fmin.s       fs9, fs3, fs8
                  rem          sp, a3, s5
                  fsqrt.s      fa7, fs3
                  fcvt.s.wu    fs0, s10, rdn
                  fle.s        tp, fs8, fa5
                  mul          a7, s1, t0
                  auipc        a3, 629400
                  divu         s1, s5, t0
                  fadd.s       ft1, fs3, ft4
                  add          t1, a5, t5
                  add          a3, s5, s2
                  mulhsu       a4, sp, t2
                  divu         a3, a4, tp
                  divu         s1, s6, s8
                  remu         t1, t5, s6
                  fcvt.s.wu    ft10, s1, rdn
                  sll          s11, t5, t6
                  fmax.s       ft0, fs6, ft0
                  fle.s        s5, ft10, fs0
                  sltu         a2, zero, s1
                  fmul.s       fs10, fs10, ft9, rne
                  xori         s3, t0, -1081
                  slli         t1, s8, 19
                  fclass.s     s5, ft11
                  mul          s3, tp, a0
                  slli         t2, t6, 21
                  fsgnjn.s     fs5, fs5, fa4
                  fmv.w.x      ft5, s11
                  fcvt.s.wu    fs7, s0
                  fcvt.wu.s    s3, fs8, rdn
                  and          a5, a0, a6
                  slli         sp, s5, 13
                  sll          t2, t3, tp
                  fcvt.s.wu    ft6, a4
                  srai         t5, s11, 18
                  mulhu        t4, s4, t0
                  rem          tp, t2, t4
                  remu         t4, t3, gp
                  xor          t5, s7, s5
                  fadd.s       ft11, fs10, fs7
                  fadd.s       fa7, fs8, fa3
                  fmv.x.w      a4, ft1
                  ori          t3, s7, 1713
                  sub          t6, s1, s4
                  slti         s0, a2, -798
                  addi         t6, s6, 1599
                  fsub.s       ft7, fs10, fs5
                  fmul.s       fs0, fs7, fs10, rup
                  slt          t1, s4, zero
                  ori          t2, s4, 429
                  sll          a2, sp, t4
                  mulhsu       t2, s1, s7
                  fcvt.s.wu    fa6, s11, rtz
                  fle.s        s11, fs3, fs10
                  auipc        a2, 116002
                  andi         s0, t6, -1176
                  mul          t3, s8, t2
                  nop
                  fcvt.s.wu    fa7, s8
                  fmul.s       fs9, ft9, ft4, rne
                  divu         s11, t4, ra
                  fsgnjx.s     fa7, fa2, fs9
                  slti         a2, t1, 919
                  addi         a4, a3, -115
                  fle.s        t1, fs5, fa0
                  fsgnjn.s     fs9, ft9, ft10
                  sra          a1, t4, s1
                  andi         a6, gp, -1292
                  flt.s        a5, fs9, ft4
                  or           s7, tp, s5
                  slli         a2, s0, 27
                  fcvt.s.wu    ft4, a2
                  sll          ra, a3, s4
                  mulhsu       t5, s7, s0
                  mulhsu       t0, a5, t3
                  nop
                  fsgnjx.s     fs9, fa3, fs6
                  fmv.x.w      t2, fa5
                  xor          t5, s0, t6
                  fmul.s       fs2, ft5, ft3, rdn
                  mulhsu       t6, a3, tp
                  sltiu        gp, a4, -1958
                  fsqrt.s      fs10, fs9, rne
                  fmv.x.w      s1, fa1
                  fcvt.w.s     s1, fa0, rdn
                  fclass.s     s7, ft5
                  fdiv.s       fa2, fs11, fs10, rup
                  addi         s0, t0, -2015
                  fsgnjn.s     fs1, fa4, ft3
                  slli         a3, a6, 8
                  sltiu        tp, s5, -1610
                  sltu         sp, a1, a2
                  fdiv.s       fs2, ft4, fs2, rmm
                  ori          s11, s2, -1548
                  slti         a6, t6, 1673
                  fcvt.w.s     t3, ft4, rdn
                  sltu         a1, a7, a5
                  lui          a5, 223446
                  xori         t0, a5, -259
                  fclass.s     s11, fs6
                  sltiu        gp, a6, -463
                  fmv.x.w      t5, ft10
                  fmul.s       ft0, ft1, fs8
                  xor          t0, t2, a4
                  and          a1, a6, a7
                  addi         a4, gp, 1960
                  feq.s        a4, fs10, fs6
                  remu         s3, s7, t0
                  sltu         a5, s6, t5
                  mul          s9, s7, s3
                  sub          t6, a3, zero
                  fcvt.w.s     a5, ft7, rdn
                  fsub.s       fs0, fs5, fa3
                  fmv.x.w      tp, fa7
                  sltu         a4, ra, s7
                  xor          s11, a2, s7
                  fsqrt.s      ft2, fs5
                  mul          s3, s3, s6
                  feq.s        tp, ft5, ft4
                  or           t6, t3, a6
                  slli         s1, a0, 4
                  fadd.s       fa7, fa6, ft6, rdn
                  or           a3, a5, t5
                  mulhsu       ra, t5, s4
                  xori         s10, t6, 21
                  mulhu        a7, t3, t5
                  slt          s8, s10, s8
                  mulh         s5, a2, a0
                  nop
                  mulhu        s11, a6, zero
                  srl          a4, a1, a5
                  fle.s        a1, fs1, fs5
                  fmax.s       fs5, fs9, ft1
                  xori         t0, s2, 2047
                  fsgnjn.s     ft6, fa0, fa6
                  sltu         s10, s8, a4
                  fsgnj.s      fa1, ft5, fa5
                  remu         t0, s4, t1
                  fle.s        t2, fs1, ft1
                  srli         s1, a4, 15
                  add          a5, s5, t2
                  remu         t3, a6, zero
                  mulhsu       t1, s6, s3
                  feq.s        sp, ft7, fs1
                  slti         s0, s9, 900
                  fsqrt.s      fs6, fa1
                  fmax.s       fa0, ft1, fa6
                  ori          s3, s6, -1100
                  fcvt.wu.s    s11, ft4, rdn
                  srli         s7, s8, 9
                  fcvt.w.s     t2, ft1
                  fmv.x.w      s11, ft10
                  sltu         s10, a5, t3
                  rem          ra, t2, a0
                  fcvt.wu.s    a6, fs6
                  fcvt.w.s     t6, ft0, rtz
                  rem          t3, t5, s4
                  lui          s6, 201767
                  srai         a4, t1, 9
                  sltiu        a2, t4, -182
                  sltiu        a2, s2, -876
                  addi         a1, s2, -1817
                  nop
                  fsub.s       fa0, fa4, ft1
                  andi         a3, s2, 95
                  flt.s        a4, fa1, ft3
                  fle.s        t1, fa2, ft7
                  fsgnj.s      fs6, ft8, fa1
                  fclass.s     t4, ft11
                  sll          t0, s10, a7
                  fdiv.s       ft10, fs0, ft0
                  fadd.s       ft1, fa2, fa6
                  slti         s0, a2, -1431
                  xor          s8, a7, s7
                  lui          a7, 293686
                  mulh         a3, s8, zero
                  fmax.s       fs6, ft8, fs6
                  fmv.x.w      t3, ft7
                  fmax.s       fa1, fs0, fs4
                  sra          t6, s0, t1
                  sub          tp, t3, a4
                  or           t3, t6, t4
                  or           zero, s2, s11
                  fcvt.s.w     ft5, gp, rtz
                  fcvt.s.w     ft1, s11, rne
                  sltu         ra, t5, s10
                  fcvt.w.s     s7, ft5, rup
                  fadd.s       ft0, fs1, ft11
                  fadd.s       ft6, fs7, ft6, rup
                  sltiu        ra, t4, 834
                  fsub.s       ft3, fs9, fa2
                  srli         gp, t4, 26
                  and          a2, s1, t1
                  fcvt.w.s     s3, ft10
                  fcvt.s.wu    fs8, a6, rdn
                  and          t1, s1, gp
                  fclass.s     t5, fs8
                  fdiv.s       ft5, fa3, ft11
                  mul          a7, a6, a1
                  fle.s        s0, ft6, fs11
                  or           a6, t5, s10
                  srl          gp, s10, s3
                  xori         zero, t3, -719
                  fdiv.s       fs2, fs8, fs9
                  fsgnjx.s     fa4, fs0, fs6
                  slti         zero, t4, 1930
                  slt          s6, t4, s7
                  fle.s        a2, fs9, ft3
                  addi         s3, tp, -397
                  srai         a5, s3, 22
                  remu         a4, s8, s11
                  auipc        sp, 712596
                  mul          s10, a3, s0
                  rem          s8, sp, a4
                  fle.s        s11, ft6, fa0
                  fsgnj.s      fa5, fa6, fa6
                  sll          s10, sp, s6
                  ori          s7, t3, 1172
                  srai         s8, a4, 26
                  auipc        sp, 1015950
                  fsub.s       fa6, fs6, fs1, rne
                  div          t4, sp, gp
                  fmax.s       ft4, ft2, ft5
                  slli         t4, a4, 5
                  fcvt.wu.s    tp, ft2, rmm
                  add          s11, s5, a2
                  fadd.s       ft1, fs2, ft3
                  fcvt.wu.s    a3, fs4, rne
                  fcvt.w.s     a4, fa1
                  mulhsu       a4, zero, a5
                  auipc        s10, 287742
                  fcvt.wu.s    a4, fa2
                  fcvt.s.wu    fs4, a1, rne
                  remu         s10, s8, s9
                  fsgnjx.s     fa3, ft11, ft3
                  srl          s6, a7, s11
                  mulhsu       t0, t4, s2
                  fmin.s       fs11, fs11, fa7
                  fmul.s       ft6, ft5, fa2
                  fsgnjx.s     fs6, fs2, ft6
                  fdiv.s       fs5, fs8, fa5
                  addi         s11, s4, 678
                  fmv.x.w      t1, ft3
                  sub          zero, sp, a3
                  fsub.s       fs4, fa3, fs3, rdn
                  addi         a4, a4, 1414
                  remu         a3, t0, t1
                  sltiu        a2, s7, -572
                  add          t6, a6, a0
                  remu         s3, s3, t5
                  divu         s9, s2, s4
                  fsub.s       fs11, ft5, fa0
                  fclass.s     t0, ft8
                  slti         a5, tp, -1795
                  srai         a1, a2, 31
                  srai         s0, s10, 3
                  addi         t2, s0, -1068
                  flt.s        s0, fs2, fa3
                  or           zero, t4, s0
                  add          ra, s9, gp
                  divu         s0, s3, sp
                  divu         ra, sp, t0
                  fmv.x.w      s6, ft11
                  divu         t3, ra, s8
                  fmv.x.w      a6, fs5
                  div          s6, s3, a7
                  fclass.s     a6, fa1
                  fsgnjn.s     ft5, fs10, fa3
                  flt.s        a4, fs8, fs1
                  mul          zero, s5, s3
                  srli         s10, t3, 22
                  addi         zero, s9, 918
                  fadd.s       ft0, fa7, fa7
                  fsub.s       fs8, fs4, ft1
                  srli         zero, s5, 2
                  sll          t5, a3, s6
                  slt          tp, s1, t4
                  nop
                  sra          s0, s6, t1
                  slt          t6, tp, s0
                  and          s11, s5, a7
                  fmax.s       fa7, ft9, fs5
                  sltiu        tp, ra, 1591
                  remu         s3, t2, s7
                  auipc        a1, 766685
                  remu         a7, a0, s3
                  mulhu        a1, s1, s9
                  fdiv.s       fa5, fs7, fa6, rne
                  addi         t4, s11, -340
                  mulhsu       a4, a0, s8
                  sltu         t4, a5, s11
                  fmv.w.x      ft8, ra
                  fmax.s       ft2, fs8, ft9
                  fmin.s       fa0, fs1, ft1
                  mulhu        a5, s0, s9
                  fsgnj.s      ft2, fa4, fa7
                  fsgnj.s      ft7, fs3, ft2
                  fcvt.s.w     fs8, t3, rdn
                  fsgnjx.s     fs5, fa3, fs6
                  mulhsu       a6, s0, tp
                  ori          t6, a2, -1727
                  fmin.s       fs2, fa6, ft10
                  or           t5, t1, s0
                  fdiv.s       ft10, fa6, ft10
                  fcvt.w.s     a6, fs1
                  or           s10, s11, a1
                  fcvt.s.wu    fs1, zero, rdn
                  fsgnj.s      ft10, fs0, fa0
                  fsgnjx.s     fs4, ft5, fs5
                  fsub.s       fs6, fs0, fa2
                  divu         s9, s9, t3
                  fcvt.s.w     fs6, zero
                  div          a7, a4, a2
                  rem          s6, s1, gp
                  or           t4, t5, t5
                  sub          a3, a2, s8
                  feq.s        t0, ft6, ft8
                  sra          sp, a5, t0
                  fcvt.w.s     s6, ft9, rne
                  fcvt.s.w     fs10, a5, rne
                  auipc        zero, 338287
                  auipc        s11, 727379
                  fcvt.s.wu    fs9, s8, rmm
                  sltiu        t6, a5, -1952
                  fmax.s       fs11, fa0, fs10
                  and          t6, ra, s0
                  fmv.x.w      s11, fa4
                  slli         t5, t4, 17
                  div          s3, a3, t0
                  ori          zero, t3, 81
                  slli         s9, a5, 18
                  xori         a7, gp, 1526
                  mulhsu       s11, gp, a0
                  srli         a6, s9, 24
                  slt          a7, t5, s6
                  mulhu        s5, a7, a7
                  sra          s11, t2, a2
                  srli         s8, gp, 19
                  fsgnjn.s     ft11, fs9, fa2
                  flt.s        t4, fs6, ft10
                  and          zero, ra, t4
                  fmax.s       fa2, fa3, fs0
                  slt          s3, t0, sp
                  fcvt.s.w     fs9, s2, rdn
                  fadd.s       ft6, fs0, fs5, rne
                  fsgnj.s      ft2, ft6, fa0
                  slti         zero, a7, 1600
                  or           t2, a2, s3
                  sra          t2, a4, a0
                  addi         s5, s11, 1406
                  fcvt.s.w     fa5, a3, rdn
                  srl          s11, a5, t3
                  fcvt.w.s     a2, ft1
                  sltiu        t3, t4, 753
                  fadd.s       fs1, fa1, ft3
                  xori         t5, a1, -293
                  fsub.s       fa3, fs8, fs2, rdn
                  fdiv.s       fs5, fs9, fa0
                  fmv.x.w      t6, fs5
                  fclass.s     a1, fa7
                  slti         sp, t2, 1607
                  fsqrt.s      fs8, fa6
                  fcvt.w.s     s5, fa7
                  slti         tp, s4, -1568
                  div          a7, s9, s5
                  and          t0, a2, gp
                  fsgnjn.s     fs9, fa3, fs8
                  slli         s1, a5, 30
                  sll          s10, t3, t3
                  srli         t6, s0, 10
                  mulh         t3, a7, s9
                  slt          gp, t5, s6
                  rem          a4, t2, s0
                  slli         t3, sp, 18
                  remu         s9, a0, zero
                  remu         t0, t0, tp
                  fmax.s       ft10, fa0, fs4
                  slti         a5, s2, -272
                  sltiu        a1, a2, -1935
                  nop
                  add          t1, s6, s8
                  fsgnj.s      fa3, fs1, fa7
                  fmax.s       ft3, fa0, ft3
                  flt.s        a2, fa2, ft2
                  fadd.s       fs0, fs6, ft10
                  fsub.s       fa5, ft10, ft11
                  auipc        a5, 610897
                  mulhu        s11, t2, t3
                  srai         s1, a7, 21
                  andi         a7, s8, -333
                  srai         a7, t2, 0
                  slli         t0, t4, 23
                  slt          a1, t6, a1
                  fmv.x.w      t3, fs3
                  fcvt.s.wu    fs6, tp, rup
                  remu         ra, s10, t0
                  mulh         a1, s9, a7
                  fcvt.s.wu    fs2, t2, rne
                  mulh         s11, t0, s1
                  slli         t4, s5, 16
                  fmax.s       ft1, fs2, fa0
                  fle.s        t6, fs1, fs4
                  fsgnjx.s     fs7, fa5, fa6
                  or           s3, a4, s9
                  sltiu        sp, s11, -1080
                  slli         a4, s4, 5
                  xori         t3, sp, -1437
                  fsqrt.s      ft4, fa2, rtz
                  xor          s1, a0, a7
                  mul          a4, ra, s2
                  srl          s10, t0, a6
                  lui          t2, 378426
                  fcvt.w.s     a5, ft2
                  add          t0, s1, s9
                  slli         a7, t3, 3
                  sltu         a7, a0, zero
                  remu         a2, s3, a6
                  sltu         a6, s11, t6
                  slli         a1, sp, 18
                  fclass.s     a6, fs9
                  andi         s0, t4, 568
                  feq.s        s3, fa0, fs2
                  sra          s3, ra, s3
                  divu         t4, s4, a3
                  fsgnj.s      ft6, ft0, fa0
                  andi         a1, tp, -539
                  fmin.s       fs8, fs6, ft4
                  mulhsu       ra, s5, s11
                  mul          a3, s1, tp
                  addi         a4, gp, -575
                  fadd.s       fs3, fa5, ft11, rdn
                  fsgnjx.s     fs1, ft4, ft5
                  ori          a1, a1, -1844
                  srai         sp, a4, 2
                  feq.s        a7, fs10, ft10
                  nop
                  feq.s        sp, fs1, fa6
                  fle.s        a4, ft3, fs2
                  mulhsu       a3, t5, t3
                  sub          a6, s2, s5
                  sltu         a7, s1, s6
                  andi         t5, a4, 482
                  fadd.s       fa7, ft3, ft11
                  div          t4, s4, a2
                  add          t3, sp, a5
                  mulhu        s5, gp, t5
                  srl          a3, s2, a4
                  sra          t1, t2, s5
                  lui          gp, 889672
                  fmul.s       fa7, ft1, fa6, rtz
                  fcvt.w.s     s10, ft0
                  remu         a2, zero, s3
                  fdiv.s       fs9, fs2, ft10
                  auipc        a5, 765227
                  fmul.s       fs4, fa3, fa0
                  rem          tp, s5, gp
                  sltu         sp, s8, zero
                  fmin.s       fs9, ft4, ft7
                  auipc        s11, 799226
                  nop
                  mulhu        s5, s6, a6
                  sll          a6, a6, s1
                  and          a4, s9, s8
                  fdiv.s       ft4, fa4, fs3
                  slti         t6, t3, 1669
                  fmul.s       ft1, ft2, fa3, rdn
                  andi         s6, s11, -935
                  feq.s        a6, fs5, fs0
                  sra          s6, t0, s8
                  fmv.w.x      fa6, a6
                  srai         a1, a3, 3
                  xori         a7, s7, -1945
                  fcvt.w.s     t6, fa5, rmm
                  slli         ra, a5, 6
                  and          t1, s2, a1
                  fmax.s       ft5, fa7, fs3
                  slti         t5, t5, 357
                  fsub.s       fs1, fs5, fs2
                  divu         s11, a6, sp
                  and          s6, a0, s3
                  fclass.s     s10, ft5
                  mulh         t1, t2, ra
                  div          t1, s6, ra
                  srli         ra, s4, 27
                  fsub.s       fs1, ft0, ft4
                  slli         s7, s8, 9
                  slli         s3, s0, 6
                  fsub.s       fa5, fs8, fa1
                  mulh         s5, t3, s11
                  feq.s        t6, ft0, ft1
                  sltiu        s1, s0, 898
                  or           s7, s8, gp
                  rem          sp, s10, s11
                  fcvt.w.s     t5, fs2, rmm
                  sll          s1, s11, ra
                  fdiv.s       fs11, fa5, ft4
                  nop
                  addi         sp, gp, -1549
                  fdiv.s       fs0, fs5, ft4
                  fcvt.s.wu    fs4, a3
                  fdiv.s       ft2, ft11, ft7
                  sra          a4, s5, a7
                  flt.s        s11, ft2, fs7
                  fsqrt.s      ft6, fs3
                  sra          a6, a5, a0
                  divu         s6, s1, t3
                  fsgnjx.s     fs0, ft8, ft7
                  fcvt.wu.s    s3, ft5
                  auipc        s11, 739679
                  xor          s10, a3, t4
                  slti         s9, s4, 343
                  sltu         a6, a0, s9
                  fcvt.wu.s    s7, fs3
                  mulhsu       t5, s6, s0
                  slli         t4, s6, 27
                  fcvt.s.w     ft9, s2, rne
                  fsub.s       ft10, ft11, fs11, rdn
                  auipc        a5, 816940
                  fdiv.s       fs1, fs8, ft3, rdn
                  fmul.s       fs6, fs1, fs3
                  fmax.s       ft6, ft0, ft6
                  fclass.s     t5, ft4
                  sltiu        a1, t1, -359
                  sub          ra, s4, s3
                  fmv.w.x      fs4, sp
                  fclass.s     s11, fs6
                  fsgnj.s      fs4, fs10, fs9
                  andi         t1, a2, 1470
                  add          sp, a3, tp
                  sra          a4, s2, a2
                  sltu         gp, s10, t6
                  and          s11, a0, s3
                  andi         s7, a7, -230
                  lui          s9, 200017
                  slli         t2, s8, 2
                  lui          a1, 147064
                  or           a2, t0, s0
                  fclass.s     t6, fa1
                  add          s3, s2, t3
                  nop
                  fcvt.s.w     ft1, s2
                  srl          s6, t6, s5
                  slti         a3, a3, -1347
                  fsub.s       fs7, fs3, fs0, rmm
                  fmul.s       ft3, fs0, ft9
                  fmax.s       ft10, ft6, fs3
                  div          a2, t0, t4
                  nop
                  sltiu        t5, gp, 2030
                  fsgnjx.s     ft10, fs11, fa6
                  sltu         a7, s1, t0
                  fdiv.s       fs3, ft5, fs3, rtz
                  div          s8, s4, s8
                  srli         sp, s4, 26
                  andi         a3, ra, 483
                  slli         s7, t0, 30
                  fmul.s       fs4, fs5, fa5, rup
                  fmv.x.w      t0, fa7
                  fadd.s       ft5, fa2, fa3
                  fmin.s       fs0, fs10, fs9
                  auipc        tp, 461152
                  auipc        s6, 359207
                  fclass.s     a3, fs3
                  srl          gp, s3, sp
                  fsub.s       fs0, fs2, ft4
                  fdiv.s       ft5, ft1, fs9
                  slt          s3, s2, a7
                  andi         t0, a6, 1106
                  sltu         sp, a2, a6
                  add          a6, a3, zero
                  mulh         gp, s9, s0
                  andi         s9, a1, 237
                  div          s3, gp, s10
                  fsgnj.s      fs8, fa2, ft4
                  fdiv.s       ft3, ft0, fs8
                  fsqrt.s      ft7, fs7, rup
                  fsub.s       ft0, fa2, ft10, rne
                  fmul.s       fs9, fs10, fs2, rtz
                  xor          a5, s11, s8
                  mulh         a7, a7, a4
                  sub          zero, s6, s10
                  slt          t2, s11, t6
                  fsgnjx.s     fs4, ft8, fs7
                  sra          t1, t4, t1
                  flt.s        t2, ft3, fa1
                  slt          s1, t6, t5
                  lui          a2, 415788
                  fmv.w.x      fa4, s6
                  fsub.s       ft6, fs3, fa6, rup
                  and          t6, t1, t5
                  fmv.x.w      t1, ft8
                  fmax.s       fa4, ft6, ft1
                  fmv.w.x      fa5, a4
                  and          s3, s9, s1
                  or           s6, zero, sp
                  addi         s1, a5, -1788
                  sltiu        t1, t0, 460
                  sltiu        s9, ra, 0
                  fmv.w.x      ft0, s2
                  feq.s        a6, ft11, fs8
                  fdiv.s       ft7, ft7, ft0, rup
                  sll          t5, s1, a0
                  add          s10, t4, s1
                  andi         sp, t6, 1106
                  sra          t2, a4, s5
                  sub          s6, zero, a7
                  addi         s3, a2, -821
                  xor          zero, s11, s6
                  srl          a7, a7, s6
                  fadd.s       fa0, fa0, fs3, rtz
                  fadd.s       fs5, fa6, fs1
                  sra          t1, a7, a6
                  fcvt.wu.s    s9, fa5, rdn
                  and          t3, sp, ra
                  ori          s5, tp, -1281
                  lui          a3, 354317
                  fcvt.w.s     t3, ft5, rdn
                  xor          sp, t4, s11
                  and          t0, s10, s9
                  fsgnj.s      fa7, ft11, fs6
                  fmax.s       fs0, ft5, fs10
                  lui          a3, 980491
                  remu         a3, s9, a1
                  feq.s        ra, fa4, fa5
                  mul          s7, s5, s11
                  fmin.s       ft2, fs8, fs6
                  mul          a6, t4, a5
                  add          s6, sp, a7
                  sub          a4, t5, s5
                  ori          s3, s4, -58
                  fmul.s       fs2, ft11, ft7
                  fsqrt.s      fa0, ft3, rtz
                  sltiu        a3, s1, 1793
                  mulh         s11, a5, zero
                  mul          s3, a7, t2
                  mulhu        s1, a2, tp
                  slt          t6, a1, t1
                  srl          a6, s8, s5
                  fmin.s       fs11, fs4, fa0
                  feq.s        t0, fs3, ft6
                  xor          t0, s5, t6
                  sltu         s5, s7, s4
                  or           zero, a5, t0
                  and          ra, s2, sp
                  mulhsu       a2, t0, a6
                  slt          s3, s1, sp
                  fmin.s       ft6, fs0, ft11
                  srli         sp, s0, 10
                  addi         t2, t6, -866
                  srl          s5, t3, s10
                  sltiu        ra, s11, -313
                  add          a3, tp, gp
                  sll          tp, s0, t3
                  auipc        t3, 209786
                  fsub.s       fs9, fs9, fa1, rmm
                  and          a7, s8, t0
                  fcvt.wu.s    t5, ft4
                  addi         t0, t2, -1706
                  mulhsu       sp, s5, gp
                  sra          t1, a1, t0
                  and          s9, s11, a2
                  xori         s0, a0, 1998
                  sltiu        a5, a6, 1680
                  srli         t3, t5, 31
                  fsgnj.s      fs6, fs3, ft2
                  ori          t6, s5, -1214
                  sll          a5, s4, s3
                  nop
                  srai         s1, zero, 22
                  fcvt.w.s     gp, fa7
                  fmv.x.w      a6, fs2
                  div          a2, s6, s4
                  fadd.s       fa0, fa0, fs3
                  sll          a1, s8, s6
                  sub          a5, s1, s9
                  nop
                  flt.s        t1, fa1, fa2
                  fsgnjn.s     fs11, fa3, ft3
                  fcvt.s.wu    ft5, s5
                  slt          s6, s3, s8
                  fcvt.w.s     a2, fs11, rtz
                  fcvt.wu.s    s5, fs7, rne
                  and          t0, a6, s4
                  sltiu        t5, t3, 141
                  sub          a6, s6, s3
                  fmv.w.x      ft3, t6
                  fcvt.wu.s    s0, fs11, rup
                  fsgnjn.s     fa4, ft3, fs2
                  srli         ra, a0, 30
                  sltiu        t4, s10, -692
                  flt.s        s11, ft4, ft7
                  slti         a3, s9, -956
                  div          zero, s11, t2
                  mul          t2, a7, ra
                  mulhu        s6, a2, s2
                  divu         t3, t6, s5
                  fsgnjn.s     fs2, fs10, fa3
                  fsgnjx.s     fs5, fs5, fs5
                  fsgnjx.s     ft11, fa0, fa7
                  fmv.x.w      zero, fs6
                  feq.s        t3, fs0, fa0
                  sll          a3, s9, tp
                  fsgnjn.s     fs3, fa7, fs3
                  slt          a5, a6, a3
                  srl          tp, s2, sp
                  fmul.s       ft4, fs6, fs11, rdn
                  xori         t3, a7, -810
                  feq.s        s0, fs9, fs4
                  slt          s1, s10, a0
                  srai         gp, t0, 9
                  fclass.s     a1, fs4
                  mul          t2, s1, t6
                  xori         s7, s0, 251
                  addi         s1, s11, 1873
                  fsgnj.s      fs0, fs10, fa0
                  addi         sp, s1, 2009
                  fmul.s       fs1, fa1, fs5
                  fmul.s       ft0, fs1, fs3, rne
                  flt.s        a6, ft1, fs2
                  fsgnjx.s     fa7, fs6, ft3
                  fcvt.s.w     ft1, s1
                  fsgnjx.s     ft0, ft2, ft6
                  lui          a5, 356509
                  nop
                  feq.s        gp, fa6, ft6
                  fcvt.w.s     t5, fs10, rne
                  fmv.x.w      s5, fs9
                  nop
                  or           t3, t6, sp
                  mulh         a2, t3, s5
                  fcvt.wu.s    sp, fa4
                  rem          a1, ra, s2
                  fclass.s     a1, fs0
                  flt.s        t1, fs3, fs7
                  fsgnjx.s     fs11, fs7, fs0
                  fdiv.s       ft8, ft5, ft0
                  fadd.s       fs2, fs2, ft7
                  slli         t4, t6, 27
                  xori         a1, s5, -1919
                  fcvt.s.wu    fs4, a2, rdn
                  fclass.s     s6, fs8
                  fmin.s       fs6, ft5, fa3
                  fmv.w.x      fa1, ra
                  slti         gp, ra, 1362
                  ori          t5, a0, -181
                  andi         s8, a1, 1445
                  rem          t2, a6, s2
                  or           s10, t1, a6
                  fsgnjn.s     ft6, ft10, ft5
                  divu         s3, a3, a4
                  add          a4, t6, gp
                  fsub.s       fs10, ft9, fa2
                  fsgnj.s      ft4, fa3, ft9
                  andi         s6, zero, 1410
                  feq.s        s1, ft0, fs3
                  fsub.s       fs6, fs2, ft6
                  div          gp, s0, s11
                  srli         s6, zero, 27
                  srai         a6, a0, 31
                  fmax.s       fs1, fa4, ft7
                  fle.s        s0, ft3, ft7
                  srai         t3, a7, 20
                  nop
                  remu         s6, s4, t6
                  fmin.s       fa7, fs9, fs7
                  mulhu        a3, tp, s6
                  fsqrt.s      fa3, fa2, rdn
                  fclass.s     a6, fa2
                  xor          s7, a6, s8
                  fcvt.s.wu    fs5, s1, rdn
                  xor          a4, t3, s4
                  xor          t6, a6, t5
                  fdiv.s       fs7, fs10, fs1
                  xori         s1, s7, -755
                  mulh         a2, t0, s0
                  divu         t0, a5, s9
                  lui          sp, 934390
                  fcvt.s.w     fs6, gp
                  slti         s9, s0, -255
                  slti         t2, t3, 395
                  sltiu        a5, a6, 956
                  fmax.s       fs7, fa0, ft8
                  sll          s3, s8, a4
                  divu         t0, gp, s5
                  fmin.s       ft4, fa7, ft0
                  fcvt.s.w     fs3, s9, rdn
                  srai         a7, sp, 10
                  mulh         s1, s4, s4
                  slti         t2, a1, -1700
                  auipc        s7, 133014
                  srli         a5, a6, 0
                  fsqrt.s      fs9, fa5
                  lui          t2, 510335
                  and          ra, ra, ra
                  fadd.s       ft9, fa5, fs9
                  fclass.s     a7, fa0
                  xor          s6, t3, zero
                  mulhu        s7, zero, s11
                  div          gp, a1, t5
                  fcvt.s.wu    ft11, t5, rtz
                  and          a5, a7, s4
                  fsgnjn.s     fa5, ft9, fs5
                  sub          s8, s8, a5
                  nop
                  fcvt.s.w     fs9, s9, rtz
                  fdiv.s       fs6, fa6, ft1
                  fmul.s       ft9, ft6, ft4
                  fmv.x.w      a1, fa5
                  fcvt.s.wu    fs8, s6, rup
                  fsgnjn.s     fs3, fs9, ft5
                  xori         a3, tp, 194
                  rem          gp, s9, tp
                  mulhu        a4, s10, s1
                  sltu         gp, s3, a2
                  mulhu        s10, a5, s2
                  add          s9, sp, s7
                  fle.s        s5, fs6, fa4
                  divu         a3, s0, s1
                  srl          s10, t6, zero
                  mulhu        sp, t1, a0
                  flt.s        a2, fa6, ft11
                  mulhsu       s9, s2, s9
                  rem          t3, s7, tp
                  fsgnjn.s     ft11, ft2, fs7
                  srl          s10, s8, s11
                  xori         s0, a1, 1597
                  sll          tp, gp, zero
                  divu         a1, a3, a5
                  rem          t5, s8, tp
                  fsub.s       fa5, ft1, fs11, rtz
                  fmax.s       ft0, fs3, ft2
                  fsgnjn.s     fs4, ft3, ft2
                  fsgnjx.s     fs0, ft1, fs10
                  fmax.s       ft11, ft7, fs10
                  sll          t4, s9, s5
                  fsgnjn.s     ft3, ft2, ft2
                  slli         s5, ra, 11
                  fsgnjx.s     fs2, fs1, ft8
                  remu         s3, a4, s10
                  fadd.s       ft6, ft6, ft8
                  add          t0, s10, ra
                  xori         s10, s8, -1940
                  fle.s        s9, fs8, fs6
                  fmin.s       ft5, ft1, fs2
                  mulhu        t3, s11, a2
                  srl          s7, t0, s8
                  fmin.s       fs8, fs11, fs4
                  fcvt.s.wu    ft7, sp
                  fclass.s     a6, fs11
                  flt.s        t3, fa2, ft0
                  feq.s        a3, fs9, fs1
                  div          a7, t3, sp
                  sltiu        a6, s11, -224
                  remu         s11, s5, t6
                  ori          s6, s9, 1821
                  fclass.s     t2, ft2
                  fsgnjx.s     fs2, ft5, fs8
                  fdiv.s       ft8, fa6, fs8
                  slli         a7, a7, 10
                  fmin.s       ft1, ft0, ft10
                  or           t2, a6, s4
                  mulhu        a6, ra, t0
                  fle.s        s5, ft7, ft7
                  fsub.s       fa6, fa5, fs0
                  and          a2, a7, s1
                  slli         s11, zero, 3
                  slli         a5, ra, 28
                  mulhu        a1, s11, t0
                  xori         t1, sp, 921
                  fmv.w.x      ft5, s8
                  feq.s        t0, fs5, ft2
                  mulh         gp, a5, s11
                  fdiv.s       fa5, ft9, fa4
                  mulhu        sp, t1, t5
                  fcvt.wu.s    zero, fa4, rmm
                  and          t4, a1, s11
                  fsgnjx.s     fs8, fs11, fs1
                  fcvt.s.wu    ft0, t6, rmm
                  fsqrt.s      fs4, fs4
                  slli         t3, s5, 1
                  add          s7, t5, t1
                  fsqrt.s      fa6, fa5, rup
                  divu         a4, a0, a3
                  sltiu        s9, a4, -230
                  fmin.s       fs9, ft3, fs6
                  xor          t2, s1, a1
                  srli         zero, sp, 24
                  fmin.s       fs5, fa7, ft4
                  add          t1, t3, s4
                  fadd.s       ft0, fa3, ft11, rtz
                  mulhsu       t1, a6, t2
                  fsgnj.s      fa5, fs10, ft4
                  sltiu        s0, s0, -882
                  fmv.w.x      ft4, t0
                  fsqrt.s      ft1, fs5, rne
                  add          s11, a5, ra
                  fadd.s       ft1, ft0, fa1, rdn
                  rem          ra, sp, s1
                  fsgnjn.s     fs8, fs8, ft0
                  mulhsu       s6, a6, sp
                  slli         s1, s7, 18
                  rem          a5, a2, t3
                  fmul.s       ft1, fa1, fs6, rdn
                  fcvt.s.w     ft4, a3, rdn
                  slt          t4, s10, t1
                  addi         a3, s5, 605
                  fsub.s       fs6, ft5, ft5
                  srl          ra, a0, zero
                  mulhsu       tp, a2, gp
                  remu         s8, ra, gp
                  fmv.w.x      fa4, a2
                  mul          s0, t1, a4
                  nop
                  fcvt.s.w     fa7, s9, rne
                  sra          a5, s8, t5
                  nop
                  fmin.s       fs8, fs8, ft8
                  fmv.x.w      s3, fs10
                  flt.s        s9, fs4, fa6
                  fmul.s       fs2, fs3, fa7, rdn
                  srl          gp, s5, a3
                  fmv.x.w      s5, fs3
                  addi         a2, a2, -825
                  xori         zero, sp, 347
                  fmax.s       fs3, fs4, fa3
                  fmv.w.x      ft11, t3
                  auipc        t2, 732983
                  fcvt.s.w     ft8, s7, rne
                  sltu         s11, gp, tp
                  fsgnjn.s     fs6, fs4, fs0
                  mulhu        t0, a7, s11
                  xori         a6, a3, 1403
                  sltiu        ra, t2, -1992
                  ori          s0, a3, 176
                  andi         gp, s8, 1191
                  and          s3, s9, s0
                  fsgnjn.s     fa3, fa6, fs4
                  add          a6, a2, t6
                  fmax.s       ft10, fs8, ft2
                  addi         t2, s2, -53
                  andi         t2, s10, -1440
                  add          t2, s6, a3
                  nop
                  flt.s        s9, ft0, ft9
                  srai         a2, a0, 13
                  fmax.s       fa5, ft1, fa5
                  srai         zero, a4, 18
                  remu         ra, s3, a0
                  add          t1, t0, a1
                  fdiv.s       fs8, ft7, ft6, rtz
                  fcvt.wu.s    s9, ft0, rup
                  fclass.s     t1, fs4
                  auipc        t1, 17244
                  fclass.s     t0, fa0
                  fclass.s     sp, fs4
                  fmv.w.x      ft8, t0
                  lui          t2, 621970
                  fmv.w.x      ft10, a5
                  mulhsu       s5, a3, t5
                  fmax.s       fs5, ft6, fa3
                  fcvt.s.wu    fa0, t4
                  fclass.s     a2, fa7
                  fsgnj.s      fa1, ft1, ft5
                  mulh         t5, s11, gp
                  fmul.s       ft11, fa7, ft2
                  srli         t2, s5, 12
                  srai         t1, s7, 14
                  fmul.s       fa1, ft6, fs10
                  srai         a6, a5, 19
                  fcvt.s.wu    fa1, a1, rne
                  mul          t4, t5, s8
                  mulh         tp, s1, t2
                  add          s7, t0, s9
                  sub          a7, s2, t6
                  lui          tp, 263931
                  fcvt.wu.s    zero, fs5
                  mulhsu       t1, a1, a1
                  xori         a7, s4, -964
                  slti         s6, s1, 1668
                  srl          s8, a7, a7
                  srai         s0, a6, 21
                  fcvt.w.s     a7, fa1
                  fsgnj.s      ft1, fa1, ft3
                  mulh         s9, a4, sp
                  or           s0, s3, t6
                  sra          zero, a3, sp
                  andi         t0, t1, 1742
                  mulhsu       s5, a5, s0
                  nop
                  fsgnj.s      fs1, fs3, ft3
                  flt.s        s1, ft11, ft11
                  fcvt.s.w     fs2, t5, rup
                  mulh         t6, gp, s7
                  divu         a2, t6, s9
                  srai         t0, t2, 11
                  fcvt.s.w     fa7, t1
                  mulhu        t6, a1, a6
                  fcvt.wu.s    ra, fs2, rup
                  auipc        s3, 1001277
                  remu         s0, s6, t4
                  fmax.s       fs9, ft5, fa0
                  srli         a1, a0, 26
                  fsgnj.s      ft3, fs8, fs1
                  xor          a7, s10, s7
                  slli         a5, s8, 6
                  lui          t1, 728635
                  fclass.s     tp, fs9
                  divu         a7, zero, s9
                  add          s3, t0, t0
                  slt          s10, t4, t2
                  srl          t1, a1, a2
                  xori         a6, s3, -590
                  auipc        a2, 878444
                  slli         t2, a0, 29
                  mulh         a7, a2, t4
                  slt          zero, a7, gp
                  xor          zero, t4, a0
                  divu         t6, ra, a6
                  auipc        a6, 502613
                  flt.s        a3, ft5, fs0
                  fmax.s       fs9, fa4, ft11
                  sra          a7, ra, s2
                  fle.s        s10, fa5, fs6
                  srai         sp, s7, 2
                  fdiv.s       fs3, ft1, fs8
                  andi         a7, t5, -1637
                  sra          a3, gp, s5
                  and          a3, s1, s1
                  fsgnjn.s     fs6, fa0, fs11
                  sub          s3, a1, ra
                  fcvt.s.wu    fa6, t1, rmm
                  fle.s        a7, fa4, fa0
                  fsgnj.s      fa0, fa2, fa2
                  fcvt.wu.s    t5, ft6
                  auipc        ra, 436777
                  remu         tp, s10, sp
                  fsgnjn.s     ft10, ft5, fa4
                  or           s0, t0, t0
                  fmin.s       ft0, ft2, fs0
                  fclass.s     t2, ft11
                  fmv.w.x      fa1, s9
                  rem          zero, a2, a1
                  or           s11, tp, s4
                  fmv.x.w      a6, fs2
                  sub          zero, sp, s3
                  fadd.s       ft0, ft9, fs11
                  and          t5, s1, s8
                  ori          s9, s1, 230
                  fmv.x.w      s10, fa3
                  fcvt.wu.s    s6, fs0
                  fsqrt.s      fs10, fs11
                  srai         t0, a4, 12
                  divu         t1, s4, sp
                  sltiu        a5, t0, -6
                  fsgnj.s      fs8, fs8, fa1
                  fclass.s     a4, fs3
                  or           a1, a3, t2
                  slti         gp, t0, -2037
                  sub          t1, a3, t5
                  and          zero, s6, s4
                  flt.s        a7, fa4, fs2
                  addi         gp, s2, -739
                  feq.s        ra, fs5, fa6
                  mulhsu       tp, ra, sp
                  srai         s6, gp, 0
                  sltu         t3, s11, t5
                  fcvt.w.s     t4, fs8
                  fsgnj.s      ft3, ft3, ft11
                  mulh         t1, a7, s2
                  srl          a6, s11, a7
                  slli         s11, zero, 15
                  fdiv.s       fa4, ft3, ft1, rne
                  fsgnj.s      ft5, fs3, ft3
                  fsgnjn.s     fs10, fs4, fs2
                  slt          t3, t2, a7
                  or           s6, t5, t2
                  sltiu        s0, s2, 1465
                  remu         zero, t2, gp
                  ori          t3, s6, -381
                  fclass.s     gp, ft5
                  fmin.s       fa0, ft10, ft2
                  fmv.x.w      a4, fs5
                  fmv.x.w      s0, ft10
                  fmin.s       fa5, fs6, fa4
                  fmv.w.x      fs5, tp
                  slli         ra, s9, 3
                  divu         t3, t5, zero
                  fle.s        a4, fa2, ft1
                  fsub.s       ft2, fs3, fa7
                  auipc        s9, 483629
                  nop
                  xori         s1, a6, -742
                  xori         a6, s3, -579
                  feq.s        a3, fa4, ft9
                  remu         s0, sp, t4
                  or           s1, ra, t2
                  xori         t4, ra, 1051
                  fdiv.s       ft3, fa1, fs1
                  flt.s        s11, ft10, ft8
                  fcvt.s.w     fs7, sp
                  nop
                  fcvt.w.s     s7, fa0, rdn
                  slt          s0, gp, a4
                  mulhu        a5, sp, s0
                  sub          s7, a5, t4
                  sltiu        s10, s4, -1
                  fcvt.s.w     ft2, a7
                  fmin.s       ft4, ft7, fs1
                  fsqrt.s      fs3, ft11
                  mulh         s1, a6, tp
                  fsgnjx.s     fs6, fs6, fs3
                  fsgnjx.s     fs0, fs9, ft1
                  sll          s10, s1, s11
                  remu         a5, s7, s1
                  fsqrt.s      ft10, fs10
                  slli         sp, a2, 29
                  and          a7, a2, gp
                  ori          a2, a4, 1744
                  fdiv.s       ft2, ft10, fs0, rdn
                  mulh         ra, s3, t4
                  divu         a5, s4, t3
                  add          t5, a5, s5
                  fsub.s       fa3, fs5, fa2
                  fclass.s     s1, fs10
                  sll          zero, s6, t1
                  sub          t5, tp, a5
                  sll          s0, s1, s7
                  mulhu        t1, tp, t3
                  srl          s9, a7, s0
                  srai         s3, s4, 9
                  fdiv.s       fs7, ft1, fa3, rne
                  srl          s5, s3, a1
                  remu         a6, t0, s3
                  flt.s        t5, fa6, fa3
                  mul          s7, t1, a5
                  slt          zero, s8, a5
                  flt.s        t2, fa5, fs0
                  srl          a6, a7, a2
                  fclass.s     zero, fa0
                  fsgnjn.s     ft2, ft0, ft1
                  sra          t4, a3, t4
                  slli         t0, sp, 18
                  slt          t0, t3, s5
                  fadd.s       fa2, fs11, fa1
                  fmin.s       fs7, fs5, fa1
                  mul          a4, zero, t2
                  slli         a6, gp, 29
                  rem          a7, a0, a3
                  fcvt.w.s     tp, fs3, rtz
                  mulhsu       a2, s7, s2
                  fsgnjn.s     fs4, fa4, ft10
                  addi         s10, t5, -2044
                  fmv.w.x      fa0, t6
                  add          a2, s9, s9
                  slli         t5, t2, 6
                  auipc        a5, 799772
                  mulh         t5, s6, t0
                  fmv.x.w      t1, fs11
                  fsub.s       ft3, fs2, ft2, rtz
                  fmin.s       fa4, ft11, fa5
                  fcvt.w.s     s10, ft8, rtz
                  fmin.s       fs7, fs0, ft7
                  xori         t1, a6, -1420
                  remu         a5, t3, a6
                  sub          s3, s4, t4
                  div          s9, t1, s7
                  add          s5, t6, ra
                  fdiv.s       fs5, ft9, ft7
                  srli         s1, s5, 12
                  fmax.s       ft11, fa6, ft3
                  fmax.s       fs9, fs10, ft0
                  slt          a7, zero, a2
                  mulhu        t5, t5, a2
                  remu         ra, t5, s5
                  mulhu        t6, s1, a0
                  fmv.x.w      s10, ft0
                  srai         sp, zero, 8
                  fmul.s       fs1, ft5, fs2
                  fcvt.w.s     s9, ft4
                  fadd.s       fs8, ft8, ft8, rmm
                  sra          gp, a0, gp
                  or           t5, gp, sp
                  fsqrt.s      ft9, ft8, rne
                  sltiu        a4, a1, -997
                  slti         s8, s6, -1010
                  sltu         s9, a3, s11
                  rem          a1, t1, s0
                  srli         a1, a7, 15
                  xor          a7, s0, a2
                  fsub.s       fs7, ft1, fs5, rtz
                  andi         t6, s8, -181
                  fsgnj.s      fa0, ft6, fs3
                  mulhsu       s11, t3, t6
                  ori          a1, a4, 238
                  mul          t1, t6, s7
                  slt          a6, t6, sp
                  fmin.s       ft5, ft9, ft8
                  fsub.s       fs6, fs5, fa3, rmm
                  srl          t2, a5, a1
                  feq.s        sp, fa2, ft10
                  fcvt.w.s     a6, fa2
                  mulh         t3, tp, s6
                  nop
                  fcvt.s.w     fs7, a0, rmm
                  fdiv.s       fs1, fs0, fa0, rup
                  xori         a2, a0, -1847
                  sltiu        s6, s1, -201
                  fsgnjx.s     ft3, fa2, fa2
                  fsgnjn.s     ft2, ft6, ft4
                  mulhsu       a2, s8, s1
                  mulhsu       s11, a2, s5
                  mulhsu       s8, s7, a1
                  or           s5, t4, a5
                  fdiv.s       ft5, ft5, fs2
                  slli         t1, t0, 31
                  fsgnjn.s     ft9, fa5, ft10
                  fdiv.s       fs11, ft5, fs9
                  sltu         sp, t4, s3
                  fcvt.s.wu    ft11, zero
                  sub          s10, a0, a2
                  fmin.s       fs5, ft1, fa3
                  fmv.x.w      tp, fa5
                  sra          s3, s2, tp
                  fcvt.w.s     a5, fs2
                  fcvt.s.w     ft10, s2, rmm
                  sub          t1, s1, s9
                  fcvt.s.wu    fa0, s8, rup
                  lui          ra, 758144
                  andi         s3, s5, -50
                  remu         t3, t0, s5
                  fclass.s     a6, fs3
                  addi         t2, s1, -1480
                  or           tp, a2, s6
                  fsgnjn.s     ft6, fs2, fa7
                  rem          t5, a4, ra
                  fsgnj.s      fs1, ft5, ft5
                  fsgnj.s      ft9, ft2, ft2
                  fsqrt.s      fs6, ft0, rtz
                  fmax.s       fs9, fa1, fs2
                  addi         t4, s3, -1973
                  slti         s5, t4, 1410
                  fmv.x.w      s6, fs11
                  srl          a6, s10, zero
                  fclass.s     s7, fa7
                  fsgnjn.s     fs7, ft5, fa4
                  mulhsu       s10, t0, zero
                  mul          a2, a2, t4
                  sll          t5, s5, a4
                  nop
                  srai         t6, t1, 26
                  fcvt.wu.s    s10, fa7, rtz
                  fsgnj.s      ft8, fa0, fs3
                  fadd.s       ft6, fs8, fa6, rup
                  srl          s10, a1, sp
                  fcvt.s.w     fa2, s9, rmm
                  mul          a4, s4, a4
                  fsqrt.s      fs4, ft9, rtz
                  nop
                  fcvt.wu.s    zero, ft6, rtz
                  remu         sp, t2, a0
                  xori         gp, t5, 799
                  fsqrt.s      fa0, fa5, rdn
                  fsub.s       ft1, fs10, fa7
                  srai         a5, a7, 4
                  sub          s9, s3, s9
                  fcvt.s.wu    ft7, a4
                  xori         t4, a6, 1116
                  ori          zero, zero, -238
                  slti         ra, s8, 958
                  fsgnjn.s     fa7, fs10, fa2
                  lui          a2, 442606
                  fcvt.s.w     ft10, t1
                  slti         t6, s3, 1075
                  slli         gp, a6, 8
                  mulhu        tp, sp, gp
                  sltu         a7, t5, t5
                  nop
                  add          s5, a5, s9
                  flt.s        ra, fa1, fs11
                  fsqrt.s      ft0, ft0
                  sll          s3, sp, s5
                  ori          t5, ra, 1217
                  fadd.s       ft9, fs8, fs5
                  fsgnj.s      fa6, fs2, ft6
                  mul          s0, a6, t5
                  fclass.s     zero, fs1
                  div          a3, s5, zero
                  fsgnj.s      fa2, ft4, fs8
                  or           s7, s8, s7
                  fcvt.w.s     ra, fs2, rtz
                  srai         s11, zero, 21
                  divu         a7, s11, ra
                  remu         s7, s7, s4
                  lui          s11, 318137
                  ori          a5, t4, -1955
                  addi         gp, a6, -425
                  fsgnj.s      ft3, fs8, fs11
                  fdiv.s       ft2, fs2, fs7
                  feq.s        t4, fa2, fa4
                  fmul.s       ft3, fa3, fa3, rup
                  fadd.s       fs11, fs6, fs8
                  mulhsu       s8, t0, s2
                  sltu         sp, t3, a7
                  auipc        a2, 583509
                  sra          a6, s2, a2
                  fcvt.s.w     ft1, t1
                  and          s6, a0, a7
                  sltiu        a4, t1, 1644
                  xor          s8, a1, s8
                  or           t6, t3, s3
                  or           a1, a3, a3
                  sltiu        s3, s6, 1502
                  xori         t0, a7, 392
                  fmin.s       ft11, fs11, ft0
                  slt          s1, tp, sp
                  sra          t5, t3, ra
                  fmv.w.x      fa5, t2
                  fsgnjx.s     fs2, fs8, fs6
                  sub          t6, ra, s11
                  sub          a7, a3, a7
                  slti         t6, t1, 366
                  rem          s0, a7, s7
                  div          s8, s6, tp
                  lui          s7, 854027
                  mulh         zero, a3, t3
                  fmax.s       fs9, ft1, fa5
                  fdiv.s       fs7, fa7, ft9
                  srl          t1, a0, t6
                  fclass.s     s8, ft3
                  divu         t5, s3, tp
                  sub          zero, a2, a0
                  fadd.s       ft10, fs3, ft5
                  mul          a4, s5, a7
                  divu         a7, ra, t4
                  fle.s        s3, fs4, fs4
                  mul          sp, s9, s5
                  xori         t0, t2, -545
                  sub          s6, s2, s0
                  fcvt.s.w     fa4, t2
                  fmv.x.w      gp, fa7
                  mulhsu       s8, zero, t5
                  nop
                  fmv.w.x      ft11, gp
                  mulh         s7, s0, a1
                  fsub.s       fa4, fs9, ft3
                  fsgnjx.s     fs4, fs4, fs3
                  slti         a3, t0, 293
                  sltiu        a3, a3, 1326
                  fsgnjn.s     fs9, fa4, ft6
                  fmv.w.x      fs0, t3
                  mulh         a1, s9, a7
                  mulh         a2, a2, s7
                  fcvt.w.s     s11, ft2
                  divu         a6, t3, a7
                  xor          s6, a0, zero
                  and          s0, a2, a1
                  fsqrt.s      fs4, fs3, rne
                  fsgnj.s      ft1, ft7, fs0
                  or           t3, t6, a4
                  fcvt.s.w     fs2, s1
                  fadd.s       fs3, ft3, fa0
                  fcvt.w.s     sp, fs0
                  flt.s        s3, fa4, fs0
                  fcvt.wu.s    t6, ft6, rmm
                  auipc        s5, 396423
                  mulhsu       a3, a7, s3
                  feq.s        a5, fa3, fa3
                  addi         a5, gp, -1399
                  fle.s        zero, ft4, fs0
                  and          s0, t1, s6
                  slti         s5, a3, 644
                  ori          t0, s2, 909
                  fcvt.wu.s    s11, fs4, rne
                  fsgnj.s      fa1, ft11, fa2
                  fcvt.s.wu    fs4, s7, rdn
                  rem          t1, a6, sp
                  add          tp, t1, tp
                  addi         s1, s3, -168
                  fsgnjx.s     ft11, fs3, ft1
                  fcvt.w.s     s10, ft4
                  sltu         s1, a1, a3
                  addi         s3, t5, -1286
                  remu         t0, t5, s1
                  ori          s7, gp, -1915
                  fmin.s       fs10, fs4, fa7
                  feq.s        s8, fs4, fs9
                  add          t2, s4, s7
                  mulh         s1, a4, s8
                  fle.s        s6, fa6, fa1
                  feq.s        s0, fa7, fa7
                  fsqrt.s      fa4, fs8, rmm
                  addi         t1, tp, 2035
                  fmv.x.w      s0, ft6
                  fclass.s     s0, fs3
                  add          t0, a6, t6
                  mulh         s10, t1, s6
                  div          a1, tp, a2
                  fsgnjn.s     ft3, ft7, ft3
                  div          a5, a1, s10
                  sra          t6, t1, s0
                  fsub.s       ft5, fs5, fs10, rdn
                  sub          t4, t3, s0
                  andi         t4, s4, -1023
                  or           t1, a1, s1
                  xori         ra, s3, 1963
                  fsgnjx.s     ft10, fs6, ft9
                  fsgnj.s      fs4, ft10, fa3
                  slti         s0, tp, -1875
                  fcvt.s.wu    fa2, s8, rtz
                  fmul.s       fa5, fs6, fs11
                  ori          ra, a3, 931
                  fcvt.s.wu    fs3, a5
                  fadd.s       fs1, fa2, fa2, rtz
                  fmin.s       fa4, ft0, fs1
                  remu         a7, t6, s2
                  fclass.s     s8, fa0
                  mulhu        tp, t1, s3
                  fsqrt.s      ft6, fs10, rtz
                  remu         a3, t3, s0
                  fle.s        s1, fs8, ft7
                  auipc        a6, 470987
                  sll          t2, zero, a0
                  srl          s10, s1, t4
                  fmv.x.w      s5, fs4
                  fmul.s       fa6, fa3, fs9, rne
                  auipc        sp, 737016
                  mulh         s0, a3, t6
                  mulh         t2, s3, s0
                  fdiv.s       fa7, ft0, fa1
                  slli         s3, s7, 9
                  remu         s10, s5, t1
                  lui          t5, 962378
                  fle.s        t5, ft1, ft10
                  slti         a1, t1, -1965
                  feq.s        s0, ft3, fa5
                  fdiv.s       fa4, fs7, fs2, rup
                  mul          s11, a2, gp
                  fcvt.s.w     fs10, s0, rmm
                  feq.s        t3, fa7, ft1
                  sra          t1, a4, s0
                  ori          t0, t5, 234
                  fmv.x.w      s3, fs2
                  fmv.w.x      fs2, s1
                  srai         s8, ra, 27
                  add          a1, sp, a5
                  sub          ra, a3, s11
                  sltu         s9, s9, s7
                  fmin.s       ft9, fs4, ft8
                  fsgnjn.s     fs1, ft0, fs11
                  fcvt.w.s     a5, ft10, rdn
                  fclass.s     s8, fa4
                  mulhsu       ra, s0, s4
                  fmv.w.x      fs2, s6
                  fsgnjx.s     ft7, ft3, fa7
                  auipc        s5, 545381
                  sra          tp, s8, ra
                  sub          t3, tp, a0
                  fmul.s       fs0, fs7, ft8, rdn
                  fcvt.s.w     ft6, s2, rdn
                  fclass.s     t2, fa6
                  auipc        s0, 889613
                  fcvt.w.s     s7, fa4, rup
                  sub          s10, t1, zero
                  fsgnjx.s     fs0, fs8, ft10
                  fadd.s       ft10, fa2, ft2
                  slt          s0, sp, t5
                  fsqrt.s      fs0, ft11, rmm
                  fle.s        a7, fa7, ft11
                  andi         gp, s7, 633
                  addi         a3, s9, 1333
                  or           t3, t2, a0
                  divu         s1, s3, zero
                  fcvt.wu.s    s5, ft3, rtz
                  auipc        a7, 501558
                  xori         t5, a7, 494
                  fcvt.w.s     zero, ft6, rmm
                  fadd.s       fs0, fa7, ft11, rup
                  lui          a5, 712855
                  nop
                  sra          s7, t4, t6
                  sltiu        s8, t1, -571
                  srl          t4, a4, sp
                  nop
                  fclass.s     a1, ft7
                  sll          sp, a0, gp
                  lui          a6, 589174
                  slli         sp, zero, 24
                  xori         s7, a3, -1044
                  fsub.s       ft6, fa2, fa7
                  fmv.w.x      ft4, a1
                  feq.s        s6, fs11, fs2
                  divu         s6, a1, sp
                  slli         t3, s10, 10
                  feq.s        sp, ft10, ft5
                  fsqrt.s      ft11, fa6, rup
                  sltu         s1, t4, s4
                  fmv.w.x      fa3, a1
                  sra          s5, ra, t2
                  auipc        s8, 463337
                  sra          s11, s2, a1
                  mul          t6, s5, a6
                  mulh         zero, s10, t0
                  fcvt.w.s     s6, fs9, rup
                  auipc        t5, 512462
                  sub          s6, a4, a3
                  div          a2, s6, s2
                  sltiu        gp, s7, 557
                  fmul.s       ft11, fa0, fs5, rne
                  fsgnj.s      ft0, fs5, fa5
                  div          s1, s3, s8
                  srli         s11, a4, 21
                  ori          sp, a1, 580
                  fadd.s       ft3, fs7, fs7, rdn
                  sra          a5, a2, s5
                  fcvt.s.wu    fa5, s3, rmm
                  slt          a4, t1, s5
                  or           s8, s11, a3
                  nop
                  and          t3, t6, s1
                  rem          t3, s10, s10
                  mul          a7, s1, a4
                  mulh         a3, a3, s10
                  lui          s8, 586419
                  fsqrt.s      fs3, fs1
                  fclass.s     a3, fs2
                  fmul.s       fa2, ft6, ft11, rdn
                  rem          s1, zero, tp
                  fsgnjn.s     fa3, fs6, fs1
                  flt.s        t2, fs10, ft7
                  fmv.w.x      fs9, sp
                  fdiv.s       fs4, fa0, fs6
                  mulhu        t3, s2, s6
                  fclass.s     tp, ft0
                  ori          t2, s7, 241
                  add          t5, a1, a7
                  add          t5, ra, t0
                  slli         a7, s3, 1
                  xori         t4, a5, 224
                  mul          sp, sp, a0
                  slli         s8, s7, 5
                  fadd.s       fa4, ft1, fa1
                  fsub.s       fs1, fs1, fs1
                  mulhsu       t0, tp, t1
                  sra          s1, a7, a2
                  fmul.s       ft7, fa7, ft5
                  sltu         a5, zero, s7
                  fsub.s       fs0, fs6, ft7
                  slti         sp, s4, -285
                  fcvt.wu.s    s6, ft2, rdn
                  slti         a2, s2, 1137
                  div          t3, s4, t0
                  add          gp, t6, s8
                  mulhsu       zero, a2, s11
                  andi         s1, s1, 1964
                  flt.s        s6, ft10, ft8
                  nop
                  divu         t2, t2, a1
                  lui          sp, 66583
                  mulh         a5, a7, a7
                  fcvt.s.w     fs10, a3
                  srli         s1, a1, 29
                  fmin.s       ft8, ft4, ft9
                  fsgnjx.s     fs3, ft6, ft1
                  sub          s1, t1, a5
                  slli         s9, t0, 11
                  fmul.s       fs9, ft7, fs9
                  feq.s        gp, ft5, ft1
                  fle.s        gp, fa2, fs5
                  fcvt.w.s     s7, fa5, rtz
                  or           zero, t1, s2
                  sltu         s3, t5, t0
                  andi         tp, t0, -1795
                  div          sp, a3, a7
                  srl          s8, s2, s9
                  fmin.s       fs1, fs1, fa3
                  xori         s8, s6, 2019
                  mulhu        s5, a4, a2
                  fsgnj.s      fs11, fs1, fs11
                  ori          t3, s11, -582
                  srai         t6, gp, 3
                  feq.s        tp, fs0, ft2
                  fcvt.s.wu    fs9, a6, rup
                  divu         a2, tp, t1
                  fdiv.s       ft1, fs0, ft9
                  and          t2, s0, t0
                  sra          s6, s10, s8
                  ori          s5, s8, 1037
                  nop
                  mulhu        t5, t2, ra
                  slti         s7, a7, 1393
                  slli         gp, s2, 29
                  addi         s11, s11, 1170
                  fsgnjn.s     ft10, fs1, fs8
                  fclass.s     a6, fs5
                  sltu         t2, s3, sp
                  xori         s3, t5, -2003
                  mulhu        t4, s7, s2
                  div          t6, s2, s9
                  or           s1, a6, t1
                  sltu         a6, a5, t4
                  sltu         s6, s5, s11
                  feq.s        t5, fs5, fs7
                  sra          gp, a4, t6
                  and          s0, t2, gp
                  fmax.s       fa4, fa4, fa3
                  fcvt.s.wu    fs10, s3
                  fsqrt.s      fa3, fa4, rup
                  sltiu        zero, a6, 767
                  xori         s8, s8, 880
                  div          s1, ra, a5
                  sltu         tp, sp, s3
                  fcvt.w.s     s5, ft5, rup
                  fcvt.wu.s    t4, ft1
                  and          sp, s2, s5
                  remu         ra, t5, ra
                  and          a2, a4, s9
                  and          t3, t6, a5
                  rem          tp, zero, a0
                  mulhu        t2, sp, a7
                  sltu         t6, t3, a4
                  andi         sp, t4, 991
                  mulh         t3, a2, s11
                  mul          s11, t3, s8
                  fsqrt.s      fs2, fs11
                  nop
                  rem          a6, zero, t1
                  add          a5, t2, a7
                  slt          t2, t5, t5
                  flt.s        t1, ft10, fs0
                  fsub.s       fa5, fa5, ft1
                  mulhsu       ra, s2, s1
                  sra          s10, s11, a2
                  divu         gp, zero, a1
                  slti         t6, s6, -545
                  fsgnjx.s     fa1, fa7, fs6
                  or           s5, t4, t4
                  div          a2, s1, s4
                  divu         tp, a6, s7
                  fmv.x.w      ra, fs5
                  sll          tp, gp, gp
                  slli         t1, zero, 19
                  mul          zero, gp, s10
                  xori         s3, s8, -1502
                  flt.s        t3, fa1, fs3
                  srl          s5, t2, ra
                  fcvt.s.wu    ft8, a5
                  auipc        s10, 654453
                  mulh         s8, s4, a4
                  fmax.s       ft7, fa5, fa1
                  fadd.s       fs2, ft11, fs10, rmm
                  or           a6, s7, s7
                  mulhsu       tp, s10, s6
                  sub          t6, s2, ra
                  slt          ra, sp, s10
                  nop
                  mulhu        zero, a1, a7
                  rem          t5, s8, t5
                  fcvt.w.s     t6, ft6, rne
                  fdiv.s       ft0, ft5, fs11, rtz
                  nop
                  fle.s        a5, ft1, fa1
                  sltiu        t3, s11, 55
                  addi         t2, s10, 728
                  andi         t4, s0, -2005
                  andi         s10, ra, 20
                  fmv.w.x      ft5, s2
                  fcvt.wu.s    gp, fa0, rup
                  sub          s1, s5, zero
                  mul          a2, s3, s3
                  fclass.s     tp, fs1
                  fadd.s       ft2, fs10, ft8
                  remu         gp, sp, t3
                  add          t3, sp, sp
                  srl          t5, a3, t5
                  slti         a7, a2, -1489
                  slli         s6, t1, 19
                  fsgnjx.s     fs0, fs9, fa5
                  fmin.s       fa6, fa7, ft9
                  sll          ra, s1, a4
                  remu         t6, t3, s5
                  srl          s5, a4, t5
                  ori          a2, a3, -1757
                  auipc        s9, 197036
                  auipc        s1, 531278
                  mulhu        s3, s1, a5
                  srai         s7, s3, 2
                  div          s7, a2, t1
                  fmin.s       fa6, fs9, ft5
                  lui          gp, 16050
                  fsgnjx.s     fs4, fs4, fa3
                  fsgnjn.s     fs11, fa3, fs11
                  remu         t6, t5, s3
                  mulhu        a5, a7, gp
                  srai         s11, a6, 28
                  fdiv.s       fs10, fs5, fa5
                  divu         s5, s10, t3
                  nop
                  slli         t3, a7, 0
                  and          a6, tp, a7
                  sra          s11, s11, a0
                  fle.s        sp, ft3, fa1
                  sub          t4, a6, gp
                  fcvt.wu.s    a6, ft9, rmm
                  mulhu        a1, a2, s8
                  divu         a6, zero, s4
                  fsgnjn.s     fa1, fs11, fs0
                  remu         s8, a7, a4
                  ori          a1, s7, -1716
                  fclass.s     s9, ft2
                  fsqrt.s      ft7, fs2
                  fsgnj.s      ft7, ft0, fs6
                  sltu         gp, t3, t0
                  fsgnjn.s     fs5, fa2, fa3
                  srai         a7, s6, 9
                  srl          s0, s2, t3
                  sub          s9, t4, s11
                  divu         s1, a7, gp
                  addi         a4, sp, 543
                  fsgnj.s      fs4, fa4, fs6
                  mulhsu       s11, s10, s8
                  fsgnjn.s     fs8, ft5, ft5
                  mulh         a6, tp, t1
                  slli         s11, tp, 24
                  xori         s6, s8, -378
                  fsgnjx.s     fa0, ft11, fa5
                  mulhu        a6, t3, t4
                  fmin.s       ft11, fs4, ft9
                  rem          a4, t5, s7
                  slt          t1, a6, a0
                  fcvt.s.w     fs7, t6
                  fclass.s     t0, fs1
                  fsgnj.s      ft7, fs1, fa5
                  fsqrt.s      ft9, ft5
                  fmv.w.x      fs1, a7
                  fcvt.wu.s    s9, fa6
                  fsub.s       fs7, fa0, fa5
                  fmv.w.x      fs7, t2
                  srai         gp, t1, 12
                  andi         t0, t3, 311
                  slli         a4, t2, 26
                  addi         s0, gp, -1216
                  sub          s0, a1, t1
                  fmax.s       ft8, ft4, fs3
                  fsgnjn.s     fa0, fs2, ft7
                  xori         t5, a0, 1941
                  fcvt.w.s     a3, fs11, rup
                  mulhsu       s7, s3, s11
                  ori          s6, s0, -26
                  slt          s6, ra, t6
                  fclass.s     a6, fs3
                  sll          s11, s10, t1
                  xori         s7, a4, -804
                  sltiu        t2, tp, 188
                  sra          s11, a2, tp
                  srai         s0, ra, 4
                  add          s9, s9, s9
                  xor          a5, t4, t3
                  fmv.w.x      fs7, a5
                  fsqrt.s      ft2, fs11
                  fsgnjn.s     ft11, fs11, ft2
                  fsqrt.s      fs8, ft4
                  fadd.s       ft11, fa2, ft7, rtz
                  andi         s9, s9, 180
                  fmv.w.x      ft0, a5
                  fcvt.w.s     s11, ft7
                  fcvt.s.wu    fa6, s6
                  fmin.s       fs8, fs6, fa3
                  fdiv.s       fa0, ft5, ft3
                  rem          t6, gp, s4
                  fle.s        s3, ft5, ft6
                  auipc        t6, 137696
                  mul          a1, s6, s2
                  sll          t0, a5, s6
                  slli         s5, s3, 27
                  sltu         s11, s4, s2
                  fsub.s       fs5, fs8, fa4
                  fmin.s       fs1, fs8, fs8
                  fsgnj.s      fa4, fs5, fs11
                  sltu         s11, s3, a1
                  sltu         ra, t5, a3
                  fmul.s       fs1, fs3, fs3
                  mul          t1, s5, t4
                  slli         a1, s0, 12
                  sra          t2, a4, sp
                  sll          a2, s8, s3
                  mulhsu       t3, t0, s10
                  fmul.s       fs11, fs0, fs2, rne
                  add          a7, a7, a0
                  fadd.s       fa5, fs7, fa7, rne
                  div          t4, s7, a4
                  remu         s3, a1, s0
                  fmul.s       fs6, fa1, ft6
                  nop
                  fdiv.s       ft2, ft3, fs9, rup
                  mul          s3, s7, a4
                  fclass.s     a4, ft2
                  remu         ra, s1, gp
                  sll          a3, s5, a4
                  ori          gp, a1, 466
                  mul          s10, s1, s5
                  nop
                  nop
                  slli         a2, t2, 14
                  div          s3, gp, tp
                  srl          t4, sp, a4
                  slli         t3, s9, 30
                  addi         a6, s7, -1397
                  add          s0, t3, s2
                  fmv.w.x      ft9, s11
                  fsgnjx.s     ft8, fa7, ft6
                  mulhu        t1, a6, sp
                  sltiu        s6, a1, 620
                  fmv.w.x      fa7, s6
                  srl          t0, t3, t6
                  feq.s        a3, fs10, fs5
                  srl          t2, t6, a0
                  fmv.x.w      a2, fs6
                  ori          a4, s0, 902
                  remu         s0, t6, s1
                  mulhsu       s7, t1, s11
                  sll          s0, ra, s8
                  auipc        s6, 692158
                  mulhsu       a1, s5, gp
                  xori         gp, a6, 1964
                  fsgnjn.s     fs8, ft9, fa5
                  sltiu        s7, gp, 1915
                  fmv.x.w      s1, fs0
                  lui          a3, 317474
                  sll          a1, s4, gp
                  fcvt.s.wu    ft8, sp, rmm
                  fcvt.s.wu    fs10, t1, rmm
                  divu         t6, zero, s5
                  rem          a4, s1, a5
                  fsgnjx.s     fs11, fa3, ft2
                  addi         a6, t4, 998
                  sltiu        s11, t6, -523
                  fmax.s       ft3, ft0, fs9
                  divu         s5, s0, s2
                  fcvt.w.s     t5, fs6, rne
                  fsqrt.s      ft4, ft8, rup
                  fcvt.w.s     t1, fs2
                  slt          zero, a0, s7
                  fdiv.s       fs8, fs10, ft3
                  mul          s8, s0, a4
                  lui          s5, 1030837
                  fmv.x.w      tp, fs7
                  srl          s9, tp, s5
                  slli         gp, sp, 7
                  sll          s7, s8, t3
                  fmul.s       ft0, fs5, ft3
                  mul          s9, t5, s4
                  rem          gp, sp, s3
                  addi         a5, s11, -1042
                  sltu         gp, t0, s5
                  sll          t0, s2, a0
                  fmul.s       ft5, fa1, fs3, rmm
                  fmin.s       ft3, ft7, fs9
                  sub          s11, s0, s0
                  xori         sp, zero, 1081
                  flt.s        zero, ft4, ft5
                  fadd.s       ft6, fa5, fs7, rne
                  fcvt.w.s     a4, fa3, rdn
                  fmul.s       ft2, fs1, fs6
                  or           a4, s4, zero
                  fcvt.s.w     fa2, a1
                  mul          t1, s5, t0
                  mulh         tp, tp, s0
                  fadd.s       fs10, fs6, fa4
                  auipc        sp, 367020
                  fmax.s       ft8, ft10, fs11
                  fdiv.s       fs8, fs6, ft11, rmm
                  and          s3, a3, s8
                  slti         sp, zero, -859
                  sra          s9, s4, a6
                  xori         s8, tp, -1281
                  div          a7, s4, s5
                  slti         t4, gp, 1804
                  flt.s        ra, ft3, fs1
                  lui          s1, 639461
                  rem          s7, a5, s2
                  sltu         s5, a7, s8
                  fmul.s       ft9, ft5, fa1, rmm
                  ori          t1, gp, -1687
                  fmin.s       ft1, fs9, ft10
                  feq.s        s10, fs5, ft11
                  or           t0, a5, s9
                  div          t4, a7, t1
                  and          a5, s4, t6
                  lui          a3, 1045462
                  fadd.s       fs3, fs1, fs10, rdn
                  sll          a6, a7, t6
                  srai         a5, ra, 11
                  fcvt.w.s     sp, fa6, rdn
                  xor          a1, t2, t4
                  slli         s9, s11, 19
                  fadd.s       fs0, ft9, ft10
                  div          s9, t0, s9
                  divu         s5, ra, t1
                  flt.s        a4, ft7, ft8
                  mulhu        a3, s1, a4
                  sltu         t1, a5, s2
                  xori         s10, s5, 223
                  remu         gp, t6, ra
                  xor          t4, s8, a5
                  xor          a5, a5, t4
                  fmin.s       fs7, fs0, fs2
                  sltiu        gp, t5, -814
                  sll          s5, s7, a5
                  fcvt.s.wu    fa3, a6
                  divu         a3, s10, s2
                  fmv.x.w      s9, fs11
                  fadd.s       fs8, ft8, ft5
                  slt          gp, a2, t2
                  fcvt.wu.s    a2, ft11
                  nop
                  fcvt.s.w     fs9, gp
                  sll          s0, a7, t4
                  fmv.x.w      tp, fs5
                  sub          a6, a3, s1
                  flt.s        a1, fs9, ft4
                  sll          sp, zero, t6
                  fcvt.s.wu    fs11, s5, rmm
                  fsqrt.s      fa7, ft8, rup
                  fsqrt.s      fs0, fa0
                  fmax.s       fs6, fa5, ft11
                  srai         t5, s4, 28
                  xor          t5, s4, s9
                  fsgnjn.s     ft7, fs4, ft10
                  fmin.s       fs2, fa2, fs10
                  srl          s9, s10, t1
                  xori         s9, a7, 1598
                  sll          t4, t6, a1
                  sltiu        s6, s11, -1307
                  or           t1, a6, s1
                  divu         t4, a5, a6
                  sltu         s5, t6, s9
                  fsgnjn.s     ft0, ft11, fa5
                  add          t1, t3, t6
                  fcvt.w.s     s0, fs2
                  fsqrt.s      fs10, ft2
                  fmul.s       ft0, ft9, fa2, rmm
                  fmax.s       fa1, fs8, fs1
                  fsgnjn.s     fa5, ft6, fa3
                  nop
                  and          s0, t2, tp
                  fsub.s       ft3, fa7, ft3
                  sltu         t2, s1, s10
                  srl          t0, t2, t2
                  nop
                  div          s8, s3, a4
                  fsgnj.s      ft10, ft10, fs2
                  remu         a5, a4, a6
                  rem          s6, t1, s8
                  slt          a2, ra, gp
                  sub          s11, a2, s9
                  fsub.s       ft3, fs11, ft10
                  flt.s        s11, fa5, ft11
                  fcvt.wu.s    s10, fa5, rup
                  srli         a7, a2, 2
                  sra          t0, s6, zero
                  fcvt.s.wu    fa6, s6, rne
                  fsub.s       fs7, fa1, fs3, rne
                  sll          gp, gp, t0
                  fmin.s       fs3, fa6, fa0
                  fmul.s       fa1, fs7, ft3, rtz
                  slli         s6, s4, 8
                  mulhu        s6, zero, a3
                  sltu         s7, t3, s5
                  fdiv.s       fs2, fa2, fa2, rmm
                  fcvt.s.w     ft5, s7, rtz
                  fcvt.wu.s    a7, fs0, rtz
                  fmv.w.x      fa5, a6
                  sltiu        a3, a2, 1462
                  rem          a6, a6, ra
                  feq.s        gp, ft6, fs3
                  sra          a1, s8, t5
                  xori         a6, t1, 756
                  srai         s5, tp, 14
                  fle.s        gp, ft10, ft4
                  divu         a7, a2, a6
                  feq.s        ra, fs11, fs4
                  srai         a6, t3, 10
                  sub          s1, t3, s0
                  fsgnjx.s     ft6, ft4, ft4
                  slli         a3, t3, 5
                  mulhsu       t5, s6, s8
                  rem          t0, t6, a5
                  fsgnjn.s     ft9, ft1, fa5
                  sltiu        t5, gp, -8
                  slt          s1, s7, s3
                  fcvt.s.wu    fs11, a7, rmm
                  fcvt.s.w     ft4, t3
                  fcvt.wu.s    s3, ft8, rne
                  fclass.s     t6, fa3
                  fmv.w.x      fa5, s1
                  remu         t1, s8, s11
                  sll          s1, t0, t6
                  fmul.s       fs1, ft8, ft5, rup
                  fsub.s       ft10, fa4, ft4, rne
                  fcvt.w.s     t1, fa6, rup
                  srl          a4, s1, s5
                  fmv.x.w      t3, fs0
                  srli         s9, t1, 28
                  srli         t0, a6, 31
                  fmin.s       fs5, fs9, fs3
                  fsgnjx.s     ft1, fs11, ft6
                  fmin.s       ft6, fa3, ft11
                  mulh         tp, s0, zero
                  sll          s7, tp, t4
                  lui          s5, 188543
                  and          s3, s0, a7
                  divu         t2, t4, gp
                  add          t4, t0, s5
                  fsgnjx.s     fs2, fs0, fs2
                  sll          t6, s8, t3
                  auipc        t6, 786968
                  fsgnjx.s     fa0, fa6, fs4
                  remu         t4, s7, t1
                  fsub.s       fs7, ft10, ft4
                  fdiv.s       fa2, ft2, ft8, rne
                  fsub.s       fa4, ft5, ft7
                  fle.s        s8, fa2, fs2
                  srl          t2, s0, a4
                  srai         t2, t0, 31
                  mulhsu       gp, sp, a2
                  rem          s6, s8, t3
                  srai         zero, s0, 10
                  and          sp, s6, gp
                  and          s6, a3, t5
                  slt          s6, gp, s7
                  fcvt.wu.s    t5, fs0
                  addi         t0, sp, -1106
                  sra          s7, a5, a7
                  addi         s7, a2, -25
                  divu         s10, a6, gp
                  fcvt.s.wu    ft3, s0
                  srli         t0, a0, 8
                  mul          s5, s7, t3
                  fmin.s       fs2, ft1, ft6
                  fmul.s       fs1, fs4, fs3
                  fmax.s       fs9, fa2, fa0
                  remu         t0, a1, sp
                  sltiu        t1, s11, -980
                  fmul.s       ft7, fa5, ft7, rdn
                  mul          zero, a3, t2
                  add          s7, s8, a0
                  fcvt.w.s     zero, ft9, rtz
                  and          s1, ra, tp
                  nop
                  fdiv.s       fs8, fs3, fs3
                  nop
                  flt.s        s5, ft9, fs7
                  srli         a5, a4, 27
                  rem          t4, a7, s2
                  slli         t1, a1, 14
                  slt          t1, a6, t1
                  srl          a3, s0, a3
                  fclass.s     a2, fs5
                  sll          t1, s6, t6
                  rem          gp, zero, a7
                  div          a1, t6, s11
                  fcvt.w.s     t3, ft9
                  fsqrt.s      ft4, fs4, rdn
                  lui          s8, 934768
                  flt.s        gp, fs2, ft5
                  fsgnj.s      ft3, ft5, ft10
                  flt.s        s7, fa6, ft5
                  mul          gp, a6, ra
                  fmax.s       fs10, fs0, ft2
                  andi         t6, s7, 247
                  fdiv.s       fs10, fa2, ft2, rup
                  ori          t4, ra, 1735
                  fmul.s       fa0, ft10, ft3, rdn
                  fcvt.wu.s    t5, ft1
                  mulhsu       tp, s8, s1
                  and          sp, a3, tp
                  mulh         a3, t1, s4
                  auipc        tp, 1002173
                  and          a7, t2, ra
                  xor          a5, a3, a4
                  fmv.w.x      ft1, a1
                  fsub.s       fs11, fa2, fs2, rtz
                  fsqrt.s      fa1, ft5, rdn
                  fmv.x.w      s5, ft6
                  fclass.s     a3, ft6
                  slli         tp, t4, 2
                  addi         t6, s5, 562
                  divu         zero, a1, t5
                  sltiu        a2, s8, 1193
                  slti         sp, s3, -866
                  slti         t5, s4, 2029
                  srl          a4, t3, s0
                  fcvt.s.w     ft10, s2
                  xori         s5, gp, -21
                  srli         s11, s1, 12
                  addi         t1, a0, -191
                  fsub.s       fs5, ft10, fa2, rne
                  addi         s0, gp, -557
                  fsgnj.s      fa2, fa6, ft0
                  fsgnj.s      fs8, fs5, fs3
                  flt.s        gp, ft2, fs7
                  fsub.s       ft3, fs0, ft1
                  slti         t4, s0, -952
                  fsub.s       ft3, fs3, fs4, rne
                  fmax.s       fs10, fs0, fs8
                  srai         t0, s9, 17
                  sub          s10, gp, t3
                  fsgnjx.s     fs7, fa5, ft0
                  mul          a3, a5, a5
                  remu         t2, tp, gp
                  fmax.s       fs6, fs9, ft0
                  divu         t3, s4, zero
                  fcvt.wu.s    gp, fs8
                  fmv.w.x      ft6, t3
                  div          s7, t5, s7
                  sub          a7, t0, s3
                  fcvt.wu.s    t5, ft4
                  mulhsu       s0, s2, s10
                  srl          sp, t1, a3
                  auipc        s10, 593950
                  nop
                  or           s0, zero, a6
                  feq.s        s9, fs1, fs2
                  remu         a7, s9, t0
                  fmax.s       ft7, fs3, ft9
                  fsgnj.s      fa1, ft0, ft5
                  fcvt.s.w     ft3, s5, rup
                  slti         a3, s3, -191
                  fsgnjx.s     fs3, fs11, ft1
                  srl          a1, ra, s10
                  mulh         s0, s7, a5
                  fsqrt.s      fs1, fa5
                  fsgnjn.s     ft2, fa0, fa0
                  srl          s6, a4, s9
                  xori         tp, s0, -316
                  srai         a7, s1, 24
                  fmv.w.x      fa2, a0
                  addi         a3, t4, -228
                  lui          s9, 876987
                  xor          a4, t1, a6
                  ori          s8, t3, 645
                  sra          t6, a5, t2
                  lui          s10, 230751
                  fmv.w.x      fs9, a2
                  and          t3, s10, ra
                  or           t0, s11, s0
                  div          s5, a0, t2
                  and          s8, a3, a1
                  fadd.s       ft5, ft10, fs7, rmm
                  srai         sp, a5, 2
                  slt          t2, a3, t0
                  rem          s7, tp, a4
                  fmv.w.x      ft6, a7
                  sub          sp, gp, a7
                  mul          s8, a1, a7
                  fcvt.w.s     t4, ft4
                  lui          s5, 39597
                  and          zero, s9, t5
                  fmul.s       fa1, fa7, fs3, rdn
                  fcvt.s.w     fa2, t1
                  mul          a2, t1, s5
                  xor          tp, t4, a3
                  fdiv.s       fa7, fa3, fa4
                  fmv.w.x      fs10, t3
                  srli         ra, t3, 20
                  xor          t1, s4, s11
                  ori          t6, gp, 1112
                  fle.s        t5, ft4, fa1
                  slli         a7, a7, 25
                  and          a3, t5, s9
                  fmin.s       fs2, fa0, fs7
                  feq.s        gp, fs6, fs11
                  fcvt.wu.s    t0, fa3
                  and          sp, s10, s2
                  fsgnjx.s     fa6, fs8, ft7
                  fsqrt.s      fs1, fa1, rne
                  fcvt.s.w     fs5, t5
                  xor          t1, a7, s4
                  slli         s3, t5, 25
                  slti         s9, s5, 1004
                  lui          s11, 761771
                  fmv.x.w      s0, fa0
                  sra          tp, s6, a0
                  flt.s        t3, fa1, ft4
                  remu         a7, s0, t0
                  srl          s9, s10, s9
                  slt          a1, a0, t0
                  feq.s        s9, ft5, fs1
                  feq.s        sp, fs8, fs1
                  flt.s        s7, fs2, ft10
                  sub          a4, t1, t6
                  fsub.s       ft0, fa2, fs4
                  fmul.s       fs5, fa7, fa2
                  fcvt.w.s     s7, fa3, rtz
                  xori         a4, s6, -1471
                  srl          s6, zero, a1
                  slti         s10, a5, -227
                  auipc        t3, 709331
                  slli         s9, s6, 10
                  andi         a1, s4, -709
                  xor          s1, sp, s10
                  nop
                  slt          s8, s0, a7
                  mulh         a5, t3, s4
                  rem          s0, t6, ra
                  sltu         a4, gp, s0
                  slt          a1, t5, t2
                  rem          t2, zero, s7
                  fdiv.s       fs7, ft4, fa1, rne
                  andi         s3, t4, -1571
                  fadd.s       ft5, ft5, ft4
                  fcvt.w.s     a3, fs11, rtz
                  slt          s11, a3, gp
                  rem          t4, s5, a3
                  mulhu        a5, s6, s5
                  fdiv.s       fs7, ft1, fa1
                  xor          a3, s0, s6
                  slli         t0, a3, 5
                  divu         t5, zero, s6
                  fsgnj.s      fa1, ft8, fs1
                  fsgnjn.s     fa3, fa1, fs3
                  slti         s5, t2, -138
                  lui          ra, 407867
                  fmul.s       ft7, fa4, ft1
                  xori         s10, s5, 1944
                  slt          t6, s10, t4
                  slt          a6, s0, t2
                  srl          a3, s9, ra
                  fsgnj.s      ft4, ft5, fs6
                  mulhu        s11, a2, a6
                  fmin.s       fs10, ft2, ft10
                  xori         a5, t4, 1380
                  add          s5, a2, a4
                  mul          a3, s2, t4
                  sll          a1, ra, t4
                  srai         s11, gp, 30
                  fmul.s       fs1, ft6, fa5, rdn
                  rem          a3, tp, a2
                  fcvt.s.wu    ft11, t1
                  slt          s11, s11, t6
                  fmin.s       fs6, fs11, fa3
                  fcvt.s.w     ft11, s4, rdn
                  fmax.s       ft10, fa0, fa0
                  mulhsu       a7, a0, t2
                  fmul.s       fs1, ft7, fa6, rmm
                  nop
                  fcvt.w.s     t4, ft8, rup
                  mulh         a3, s0, t4
                  nop
                  fmul.s       fs9, ft4, fa4, rmm
                  remu         t6, t0, s10
                  remu         t0, ra, s0
                  fmin.s       ft11, fs3, fs5
                  srli         s7, sp, 2
                  srl          t3, t5, a3
                  fmv.w.x      fs0, a1
                  rem          s11, tp, s6
                  div          s0, s5, s2
                  fmul.s       fs7, ft6, fa4
                  fcvt.s.w     fs9, t2
                  srl          s5, s5, gp
                  slli         t2, t3, 25
                  slti         a4, s11, 1725
                  sltu         t6, s5, gp
                  fle.s        s7, fa1, ft9
                  sra          t5, gp, t0
                  fmv.w.x      fs3, s10
                  fsgnjn.s     ft3, fa0, fa0
                  or           t1, s9, a7
                  fmv.w.x      fa5, t3
                  fcvt.w.s     t6, ft7, rdn
                  ori          s9, t4, -1116
                  rem          a1, t4, a3
                  srai         s1, t4, 9
                  mulh         t1, t4, t0
                  ori          a5, s4, 1094
                  fsgnjx.s     fa0, fa5, fa3
                  fsgnjn.s     fs0, fs0, fa2
                  feq.s        s3, fs1, fs10
                  sll          tp, a4, s9
                  sll          s8, s5, sp
                  fsqrt.s      fa0, ft7
                  nop
                  sltiu        s10, s2, -474
                  fmul.s       ft4, fs7, fa7
                  srli         a5, s8, 24
                  fsqrt.s      fs2, fs9, rdn
                  fmv.x.w      s1, ft11
                  fdiv.s       fa7, fs7, fs5, rne
                  add          t4, a2, t4
                  xori         a3, s11, 857
                  rem          t4, sp, s5
                  sub          s3, s6, t5
                  slli         s10, s10, 21
                  fcvt.w.s     a2, fs0
                  fsgnjx.s     ft4, fs5, ft3
                  ori          ra, sp, -1813
                  xori         t2, a3, -1091
                  fdiv.s       ft9, fa2, ft3, rup
                  sltiu        ra, tp, 480
                  lui          s9, 832904
                  fmv.w.x      fs5, zero
                  sub          a1, s3, a0
                  sub          t1, s5, t6
                  slti         a1, s11, 628
                  fmv.x.w      s10, fs8
                  lui          s10, 670941
                  andi         s3, s1, -1141
                  fsgnjx.s     ft11, ft7, fs7
                  auipc        a1, 667505
                  fdiv.s       fs4, fa1, ft5
                  remu         t0, a0, t2
                  fle.s        t6, fs0, ft4
                  auipc        a1, 932759
                  sll          t3, s10, a2
                  feq.s        a3, fs10, fs4
                  fcvt.wu.s    a2, fa1
                  fmul.s       fa1, ft2, fa5
                  fsgnjn.s     fs7, ft4, ft6
                  mulhu        t4, tp, a7
                  sltu         s0, a1, t6
                  slti         gp, t2, -1648
                  slt          a4, tp, t1
                  fsub.s       fs3, ft2, fa5
                  fcvt.s.wu    fs5, s6
                  mul          t3, s0, t0
                  auipc        ra, 1022960
                  fmv.x.w      s9, ft3
                  sra          t6, s6, s8
                  fsgnjn.s     ft9, ft2, fs2
                  fcvt.wu.s    gp, fs3, rup
                  xori         a7, s6, 1148
                  nop
                  fcvt.s.wu    fs7, a2
                  srli         ra, a2, 18
                  or           t2, t6, s5
                  slti         s10, a1, 1679
                  fmv.x.w      ra, fs10
                  srai         zero, s8, 1
                  add          a4, t0, s1
                  fmul.s       fs11, ft0, ft2
                  nop
                  fsub.s       fs4, fs0, ft2, rne
                  fclass.s     s8, fs3
                  sra          t0, a3, s10
                  fmax.s       ft1, fa7, fs6
                  fcvt.wu.s    s7, ft11
                  sll          a5, a3, s8
                  xori         t6, t3, -1488
                  fclass.s     s5, fs11
                  xori         s5, a1, 301
                  xori         zero, s6, 2044
                  mulhu        t5, sp, s9
                  fsgnjx.s     fs5, fa4, ft2
                  mulh         t2, a0, t2
                  divu         s9, t0, zero
                  fcvt.w.s     s0, fa3
                  flt.s        ra, fa4, fa2
                  fdiv.s       fa6, ft6, fs10, rtz
                  fdiv.s       fs8, ft7, fs5
                  fsgnjn.s     fa5, fs6, ft0
                  xori         s1, a7, 390
                  srli         s3, t5, 20
                  fmax.s       fs8, fs1, fs11
                  divu         t5, s5, s10
                  or           zero, zero, s5
                  fmv.w.x      fs0, a5
                  fmax.s       ft8, ft1, fs5
                  or           s0, s1, ra
                  div          s5, a1, t1
                  fdiv.s       ft8, ft7, ft2
                  fmul.s       fs5, fs2, fs4
                  feq.s        s9, fs11, fa5
                  slli         a1, t2, 22
                  mulhu        s10, s8, t2
                  slli         s7, t6, 8
                  fsgnjx.s     fa2, ft10, fa6
                  addi         t2, a6, -394
                  fsqrt.s      ft5, fs7
                  nop
                  ori          a7, a2, -1482
                  addi         ra, ra, 534
                  div          s5, t3, a2
                  mul          a1, t6, zero
                  auipc        t1, 249637
                  sll          s0, a6, a3
                  xor          s6, s10, t3
                  fmin.s       fa4, ft11, fs6
                  fsqrt.s      fs11, fs11, rmm
                  fmax.s       fa7, fa7, ft6
                  ori          ra, sp, -578
                  sltu         s1, s3, zero
                  flt.s        s7, fa2, fs2
                  fcvt.w.s     sp, ft8
                  fsqrt.s      fa2, fa0, rtz
                  srai         a2, t6, 12
                  mulh         s10, s5, s8
                  ori          t5, zero, 1675
                  andi         s0, s10, -486
                  fsgnj.s      fs10, fa3, fs1
                  feq.s        s10, ft7, fa2
                  sra          tp, s9, t2
                  sub          s7, a5, t3
                  lui          a7, 749097
                  fadd.s       ft11, fs10, ft8, rup
                  xori         s10, t4, 337
                  remu         t6, t4, s7
                  flt.s        a2, fa5, ft7
                  addi         a3, a1, -189
                  feq.s        t2, fs1, fs2
                  ori          sp, a6, 1392
                  fmv.x.w      a4, fa6
                  fsqrt.s      fs7, fs8
                  srli         ra, s3, 28
                  div          t2, gp, s4
                  ori          a6, t0, 1976
                  fcvt.s.w     fs11, a4, rne
                  fadd.s       fs0, fs4, ft4
                  fadd.s       fa0, fa6, fs4, rdn
                  remu         t2, s1, a0
                  sll          a1, t2, t3
                  fsgnjn.s     ft10, ft6, fs6
                  andi         s1, s11, -1513
                  ori          a7, s3, 352
                  slti         s10, a6, -1970
                  fmv.w.x      ft10, s1
                  remu         a7, s6, a2
                  fcvt.wu.s    s10, fs4, rup
                  fcvt.w.s     a7, fs1
                  sub          s3, sp, sp
                  sub          t6, s0, s1
                  fmv.x.w      s10, fa3
                  lui          t3, 212503
                  fsub.s       ft3, ft5, ft4, rne
                  addi         t6, a0, -1304
                  sltiu        t5, t1, 920
                  rem          a6, s2, a2
                  sub          s9, s6, s2
                  sra          ra, t2, ra
                  auipc        a2, 174184
                  fsgnjn.s     fs4, fs10, fs2
                  slt          tp, t5, t6
                  remu         t1, s4, t1
                  fcvt.s.wu    fa6, t3, rtz
                  add          a7, s7, s4
                  flt.s        a4, fa1, fa6
                  fcvt.w.s     a1, fa6, rup
                  mulhsu       s10, t1, t2
                  fmul.s       fs6, fs4, fs2
                  slti         a5, s10, 1584
                  mul          a6, a6, a4
                  xor          s5, s5, ra
                  fmin.s       ft10, fa5, ft9
                  fmin.s       ft9, fs11, fs11
                  nop
                  div          zero, s7, a0
                  fcvt.s.w     fs8, s3, rtz
                  sra          s0, s4, s4
                  rem          s6, a3, s5
                  div          s5, a0, gp
                  slti         sp, s7, -1439
                  rem          a5, a3, a1
                  fsqrt.s      fs7, fs9, rtz
                  addi         a4, t3, 1092
                  fsgnjx.s     fa7, ft6, fa2
                  fsqrt.s      fs8, fs1, rup
                  srl          t1, s10, a3
                  fcvt.s.wu    fs5, t2
                  div          s6, tp, t6
                  sltu         a7, tp, a0
                  fcvt.wu.s    s5, fs9
                  add          s5, t4, t4
                  slti         zero, s7, -1374
                  sub          s6, a0, s10
                  mulhsu       s10, s11, s9
                  srl          gp, gp, t4
                  fcvt.s.wu    fs2, s4
                  mul          s8, t0, t1
                  fmax.s       fs4, ft0, fs11
                  fle.s        s6, fs9, fa2
                  srl          s9, t0, s2
                  auipc        s9, 288293
                  xor          t4, t6, tp
                  feq.s        s6, ft7, fa6
                  fcvt.wu.s    t3, fa2, rtz
                  srai         t5, a5, 17
                  fle.s        s1, fs6, fs10
                  fmv.x.w      t6, ft3
                  xor          gp, s9, t2
                  fmv.w.x      ft11, a6
                  fsub.s       fs10, fs2, fa0
                  fsub.s       ft4, fa6, fs8, rup
                  fmin.s       ft5, fs2, fs8
                  and          t3, t0, t5
                  mulh         s0, t3, a2
                  divu         sp, a4, s3
                  srli         a1, tp, 31
                  div          a4, s10, tp
                  remu         s5, s7, s10
                  fsqrt.s      fs7, fa0
                  srli         s7, a1, 21
                  add          t2, gp, t4
                  lui          a4, 936272
                  lui          a3, 28141
                  srli         s10, s4, 17
                  fmax.s       fs11, fs4, ft9
                  flt.s        sp, fa7, fa1
                  slt          t2, s11, a6
                  feq.s        s3, ft5, fa7
                  div          t3, s9, s5
                  srli         s11, a3, 12
                  srai         s3, s11, 12
                  add          t2, s8, s11
                  fmv.w.x      fs3, t5
                  srl          s7, gp, t2
                  srai         t4, a7, 13
                  flt.s        gp, ft5, fs7
                  slti         s1, a4, -1934
                  andi         t0, s3, -1286
                  sltiu        s10, s10, -492
                  fsgnj.s      ft0, ft4, ft0
                  and          s11, s4, t6
                  add          s1, s7, s3
                  nop
                  sra          t4, s8, s1
                  divu         s8, s7, s2
                  mulhsu       a6, s3, a2
                  fle.s        s6, fa2, fs1
                  mul          t0, t2, s7
                  fsgnjx.s     fa5, ft6, ft10
                  fmv.x.w      s11, fs0
                  slli         s3, s10, 12
                  fcvt.w.s     s3, ft10
                  fcvt.wu.s    s10, ft10, rne
                  divu         a2, zero, s6
                  divu         zero, s4, t1
                  fcvt.s.w     fs0, s0, rtz
                  srli         t5, t1, 13
                  fcvt.wu.s    zero, fa2, rup
                  flt.s        gp, fs5, fa1
                  srli         s10, ra, 4
                  fcvt.w.s     s5, fa7, rne
                  srl          t6, s3, t3
                  feq.s        s8, fa3, ft11
                  sltu         a5, tp, t6
                  mul          a6, s2, s5
                  mulhsu       zero, tp, a3
                  mulhsu       s9, a2, s4
                  ori          t1, s0, 1112
                  mulhsu       t4, s4, a6
                  fsqrt.s      fa4, ft0, rup
                  divu         s5, t2, t4
                  fmax.s       fa5, fa6, fs9
                  sltiu        s8, t5, 1055
                  sltu         s6, a3, s2
                  mulhu        s11, tp, s8
                  sll          t6, tp, t3
                  sra          ra, s9, t4
                  srl          t2, s3, zero
                  and          s11, a1, t4
                  fmul.s       fs3, fa7, ft9, rup
                  fsub.s       fs4, ft5, fa3
                  sltu         a3, a5, s0
                  auipc        s5, 771137
                  sub          tp, s10, a2
                  feq.s        s5, fs11, fa0
                  sra          a4, s8, t4
                  ori          t0, s2, 1762
                  xor          a5, gp, t4
                  srai         a2, s6, 4
                  fcvt.wu.s    a7, fs9
                  fmin.s       fs10, fa3, fa4
                  fcvt.wu.s    t1, ft1
                  or           t5, s5, a2
                  sll          s8, a4, t2
                  fmax.s       fa2, ft0, fa3
                  div          t4, t5, s4
                  fmin.s       ft11, fa7, fs11
                  fmv.w.x      fa0, s8
                  fcvt.s.w     ft5, zero
                  sra          s3, s5, a4
                  sltu         t5, s10, t2
                  srai         gp, a1, 23
                  fsub.s       fs8, fs2, fs9, rtz
                  mulhsu       s3, s10, a4
                  fcvt.wu.s    s11, fa2, rne
                  fcvt.s.wu    fa6, t2, rtz
                  mulh         t1, t0, a1
                  fmin.s       fs2, ft4, ft8
                  mul          s7, a4, a2
                  fmin.s       ft3, fs1, ft9
                  fdiv.s       ft7, fs1, fs0, rup
                  fle.s        s1, fa4, fa2
                  fmul.s       fs5, fs4, fa3, rup
                  fcvt.w.s     a2, ft9
                  fcvt.w.s     ra, ft10
                  fcvt.s.wu    fs11, t5
                  mul          tp, t1, s4
                  fcvt.s.w     fa0, s5, rdn
                  srli         s5, s11, 26
                  xor          a5, s2, s0
                  sltiu        sp, s6, 544
                  slt          a5, s2, s7
                  fmul.s       ft11, fs4, fs10, rne
                  sltiu        gp, a3, -213
                  andi         sp, s2, 1571
                  slli         t4, a1, 23
                  srli         t1, a1, 18
                  add          s3, t4, a4
                  fcvt.s.wu    ft10, s1, rmm
                  fdiv.s       ft0, fa3, fs9, rne
                  xori         t2, s1, 426
                  fsqrt.s      fa0, ft11, rmm
                  flt.s        s10, fs7, ft7
                  ori          s0, t3, 1583
                  fmv.w.x      fa3, t5
                  add          t6, s2, s0
                  nop
                  xori         s7, a2, 1337
                  rem          sp, a6, a1
                  auipc        a1, 578088
                  fcvt.w.s     s7, fs10
                  auipc        s5, 647818
                  fsgnj.s      ft7, fa5, fa0
                  ori          s9, a2, 1090
                  nop
                  srl          s5, a5, s7
                  fmax.s       fs9, fs9, fs6
                  srai         zero, ra, 17
                  mul          t0, a7, gp
                  auipc        zero, 1002377
                  and          ra, a4, a3
                  div          s9, a2, t2
                  lui          a4, 83520
                  fmv.x.w      a2, fs2
                  sltiu        s11, s8, 210
                  fmv.x.w      t4, ft3
                  fcvt.w.s     a3, ft3, rup
                  addi         s8, sp, -411
                  fclass.s     a2, fs1
                  fmv.w.x      fa7, s11
                  slt          s11, s10, a6
                  sltu         s10, s5, t6
                  fmul.s       fs9, fa0, fs7, rup
                  srl          t6, t6, gp
                  sra          a7, s11, s8
                  fdiv.s       fs5, ft9, fa1
                  sll          t6, t2, t5
                  xori         a6, s2, -1320
                  srli         s11, a1, 22
                  sltiu        a4, t6, 2034
                  rem          sp, s2, s4
                  auipc        s11, 239957
                  fmax.s       fs0, fs3, fa4
                  fsgnj.s      fs8, ft9, fa2
                  srl          t2, s6, t3
                  fsgnj.s      ft3, fs8, ft5
                  sltiu        s7, t3, -1691
                  nop
                  divu         sp, a6, tp
                  fcvt.s.wu    fa7, t2
                  sltiu        t4, s1, 1646
                  feq.s        a6, fs7, fs8
                  ori          zero, a0, 867
                  sra          gp, a5, s9
                  andi         s1, sp, -1983
                  fcvt.s.wu    fs0, t2
                  fmin.s       fs7, fs8, fs4
                  xor          a7, a3, s3
                  fle.s        t1, fs0, fs6
                  mulhu        a3, s7, s5
                  fsgnjn.s     ft3, fs5, ft9
                  fcvt.s.w     ft6, a4, rup
                  xori         t4, s3, -1115
                  mul          s9, sp, a4
                  lui          a5, 612311
                  fsgnjn.s     fa2, ft11, ft8
                  remu         a7, zero, t5
                  add          s11, s10, tp
                  feq.s        t4, fs4, ft5
                  fsub.s       ft11, fa2, ft2, rdn
                  fmv.w.x      fa3, tp
                  sltiu        t0, s6, -348
                  slti         s10, a4, -1354
                  div          s3, a5, s0
                  slt          a2, a7, a0
                  or           t0, s0, s11
                  mulhsu       a4, gp, ra
                  fle.s        ra, ft10, fa5
                  addi         t2, a1, 1888
                  andi         t2, s5, 1566
                  sltiu        a2, s5, 716
                  sltu         t4, s6, s5
                  ori          a1, ra, 1881
                  divu         a2, gp, t6
                  srai         a5, t1, 4
                  fmul.s       ft11, fa7, ft3
                  addi         s3, gp, 1099
                  fsgnjx.s     fs3, fs3, fs7
                  slti         t2, t5, -365
                  feq.s        s0, ft7, fa1
                  divu         t4, a0, a4
                  fmv.w.x      ft6, t0
                  fmv.x.w      s11, fs6
                  mul          s9, t0, a6
                  sltiu        a7, t1, -655
                  srli         a3, a3, 24
                  fsgnj.s      fs1, ft2, fs3
                  divu         a5, s4, s5
                  lui          t3, 308818
                  sltiu        s10, t3, -517
                  sll          a1, s9, a2
                  fclass.s     a6, ft4
                  fmin.s       fs2, fs4, ft7
                  slti         a3, s4, -551
                  fmin.s       fs2, fa0, ft5
                  fmin.s       fs7, ft7, fa4
                  sltu         s8, a1, zero
                  fsub.s       fs1, ft10, ft8, rdn
                  mul          sp, zero, a6
                  slt          s8, a6, t3
                  xori         t6, ra, 1754
                  sra          s5, s10, s8
                  fmv.x.w      a5, fs4
                  ori          t2, a1, -1889
                  fmin.s       fs5, ft5, fs3
                  fmax.s       fs9, ft11, fs8
                  fcvt.w.s     zero, fa0, rdn
                  fsgnj.s      ft2, fa7, fa4
                  fmin.s       fs6, fs4, fs8
                  fmul.s       fa5, ft1, fs3, rdn
                  remu         t3, a5, t3
                  flt.s        a5, fs6, fs5
                  srli         t6, a3, 28
                  fcvt.w.s     ra, fa5
                  ori          s5, s9, 955
                  mulhsu       s11, ra, s8
                  fsgnjn.s     fs3, ft10, fa2
                  remu         gp, ra, s4
                  srai         t1, s1, 16
                  fdiv.s       fs11, fa0, ft4, rmm
                  flt.s        a1, ft3, ft8
                  fsgnjn.s     fs6, ft1, fs1
                  fmin.s       ft5, fs2, ft11
                  fadd.s       ft5, fa4, fa7
                  or           t4, ra, s5
                  sll          s9, s3, s6
                  fmv.x.w      s6, fs9
                  lui          t0, 1001749
                  add          t6, t6, a7
                  slt          s11, t6, s0
                  div          a2, a7, zero
                  fsqrt.s      fa1, fs2, rup
                  fdiv.s       ft1, ft1, ft1, rdn
                  andi         a7, t0, 893
                  mulhsu       sp, t0, t4
                  lui          t6, 1002386
                  fle.s        s6, fa1, fs4
                  sll          tp, a5, t4
                  fcvt.w.s     t1, fa2
                  remu         s0, s7, s11
                  add          t0, s10, s3
                  rem          a2, s2, gp
                  sltu         gp, t1, s5
                  sll          t3, a1, sp
                  fdiv.s       ft11, fs7, ft7
                  and          s0, t5, s2
                  sltu         ra, s8, t6
                  addi         a2, t1, 1714
                  fcvt.wu.s    s11, ft10
                  sra          s9, s7, tp
                  mulhsu       a2, a7, a7
                  remu         s5, tp, t2
                  slti         gp, s7, -1345
                  fcvt.wu.s    zero, ft3
                  slli         t2, a3, 11
                  flt.s        ra, fa3, ft1
                  fdiv.s       ft2, ft3, fa6, rdn
                  sub          s3, s6, s9
                  fsgnj.s      fa4, fa5, fa2
                  remu         zero, zero, t5
                  rem          ra, sp, t5
                  flt.s        t6, fs3, fa6
                  add          t3, t2, s10
                  srai         s5, zero, 25
                  mul          sp, sp, tp
                  fsub.s       fs6, fs11, ft4
                  fsqrt.s      fs6, ft7, rup
                  fsgnj.s      fa7, fs6, fa5
                  fcvt.w.s     a2, fs1, rmm
                  fdiv.s       fs10, fa7, fa7
                  add          t0, s5, s7
                  sra          s11, sp, sp
                  sltu         zero, t5, s7
                  fsqrt.s      fs6, fs4, rmm
                  and          ra, gp, a3
                  sub          a6, a4, zero
                  mulh         a5, t3, tp
                  slt          a6, t6, s11
                  fcvt.s.wu    fa3, sp
                  sub          a2, s8, a3
                  sll          gp, a2, gp
                  sltu         s8, tp, t2
                  sub          a6, s5, tp
                  srli         a1, s11, 0
                  rem          a1, s9, s10
                  nop
                  slli         a1, s2, 21
                  fcvt.w.s     s8, ft4
                  fclass.s     a7, ft6
                  feq.s        a7, fs5, fs4
                  fcvt.s.wu    fs1, a4
                  xor          a6, gp, s2
                  fsgnj.s      fa0, ft7, fs10
                  fmin.s       fs4, fa6, fa1
                  fle.s        t3, ft3, ft1
                  fsgnjx.s     fa5, fs4, fa3
                  srai         s8, s2, 28
                  sll          a4, a3, t6
                  fmul.s       fa6, ft2, fa7
                  fsgnjn.s     ft11, fa7, fs9
                  slti         zero, s9, 959
                  auipc        s7, 311366
                  slt          a6, t0, t0
                  srai         s6, sp, 31
                  xor          s10, a1, t2
                  fle.s        a1, fs10, fs3
                  sltu         gp, t4, t4
                  divu         t2, ra, a5
                  andi         tp, s9, -1509
                  srli         s3, a6, 19
                  sll          t5, gp, a4
                  fmin.s       fa5, ft1, ft11
                  rem          a6, s0, tp
                  fcvt.s.wu    fs10, s10
                  sll          t1, tp, s2
                  fmul.s       fs1, fs10, fa2
                  fadd.s       fs0, ft9, ft5, rmm
                  fcvt.w.s     a2, fs8, rtz
                  fcvt.s.wu    fa3, s7, rmm
                  feq.s        t2, fs9, ft10
                  mulh         s3, a0, s9
                  sltu         gp, t3, s11
                  div          t3, t6, s6
                  fcvt.wu.s    a4, ft1, rmm
                  fmul.s       ft4, fs11, fa6
                  fmul.s       fs2, fs6, fa0
                  xor          s0, sp, sp
                  nop
                  remu         zero, s2, s7
                  fsgnjx.s     fs11, ft1, fa5
                  fcvt.s.w     fs10, a2, rup
                  fmv.w.x      ft1, a2
                  fmax.s       fa4, ft8, ft9
                  and          t1, s2, a0
                  fcvt.s.w     ft10, s2, rup
                  fmin.s       fa7, fs11, ft11
                  sltiu        a6, t3, 507
                  fcvt.wu.s    t3, ft9, rne
                  mulhsu       s6, tp, s5
                  addi         t1, t3, -1967
                  slli         s5, s0, 27
                  fsgnj.s      fs7, ft7, fs6
                  slli         s3, s9, 11
                  srli         s8, sp, 2
                  mulhsu       zero, s9, sp
                  srl          s11, a3, s0
                  fsub.s       fa2, fs3, ft6
                  srai         tp, s7, 24
                  flt.s        t4, fa4, fs8
                  mulhsu       a1, ra, t1
                  fsgnjx.s     fs0, fs3, fs10
                  slti         s7, s9, -489
                  andi         t4, s1, -1596
                  div          t1, t2, t2
                  fsgnjx.s     fa2, fs2, ft0
                  mulhsu       t6, s4, gp
                  addi         s10, t5, -1340
                  sll          tp, t3, a5
                  xori         s7, t1, 976
                  ori          t4, s0, 903
                  lui          a5, 579901
                  fsub.s       ft11, ft10, fa4
                  slli         a4, a4, 9
                  sub          t4, tp, s1
                  lui          s7, 932958
                  sltu         a5, sp, a4
                  fadd.s       ft6, fs4, fs3, rmm
                  nop
                  fmv.x.w      a2, fa3
                  andi         a5, t2, -1230
                  divu         a2, zero, s7
                  mulhsu       s8, s10, s8
                  mulhsu       a2, gp, a5
                  xor          a2, ra, a6
                  remu         a3, ra, a4
                  nop
                  fsgnjx.s     ft9, fs11, fa7
                  fmv.w.x      fa1, tp
                  fmax.s       fa2, ft7, ft9
                  rem          t2, s1, a7
                  srai         zero, t4, 5
                  fsub.s       ft2, fs3, ft0
                  sltu         a1, t5, t3
                  mulhu        t3, ra, s2
                  fcvt.wu.s    s7, fa2, rmm
                  fadd.s       fs4, fs3, fs9, rup
                  sltiu        tp, s8, -1249
                  ori          s10, s2, 42
                  fcvt.s.wu    fs6, s9, rup
                  fmv.w.x      ft4, a3
                  mulh         s5, a4, s2
                  srli         a5, a3, 28
                  add          sp, s5, t0
                  or           t6, s6, a4
                  srai         t1, a4, 2
                  sub          s5, s0, s10
                  fsqrt.s      fa4, ft8, rne
                  fmin.s       fs9, fs1, fa4
                  fsub.s       ft6, fa4, ft6
                  fmv.x.w      s9, ft9
                  fsgnjn.s     fs11, fs0, ft7
                  or           t0, tp, t6
                  fmv.x.w      t4, ft1
                  sltiu        ra, s4, 1325
                  mulhsu       t6, s5, a7
                  fmax.s       fa7, ft7, ft0
                  fmin.s       fa7, fs7, fs1
                  remu         s11, a6, a2
                  mulhsu       a3, a2, a6
                  andi         ra, zero, 833
                  fcvt.s.wu    ft3, s1, rne
                  fsgnj.s      fs10, fs8, fa2
                  mulhu        s11, a7, t0
                  fcvt.wu.s    t0, fa5
                  xor          t4, t0, t2
                  fmul.s       fa2, ft8, ft5, rtz
                  div          t2, t5, t6
                  sltiu        a6, a1, 543
                  fmul.s       fs7, fs4, ft7, rne
                  div          s7, s2, gp
                  fsgnj.s      fa7, fs6, fs4
                  auipc        a1, 681960
                  mulhu        a3, ra, gp
                  feq.s        gp, fs0, ft3
                  fmul.s       ft5, fs2, fs3
                  divu         s0, s7, zero
                  fcvt.w.s     sp, ft3
                  fdiv.s       fs8, ft7, ft1
                  fsgnjn.s     ft2, fa2, ft4
                  fsgnjx.s     fa2, ft7, ft2
                  add          a7, t0, ra
                  sra          tp, s2, t2
                  fcvt.s.w     fs4, a0
                  fsqrt.s      fa7, ft7, rtz
                  slt          t4, s11, a5
                  fmul.s       fa3, ft11, ft9
                  fadd.s       fa1, fs7, ft3, rtz
                  auipc        s7, 1047360
                  sltu         s0, s10, t2
                  fcvt.wu.s    t6, fa3, rup
                  srl          t6, s11, s10
                  fmv.x.w      s0, fs3
                  divu         s6, a7, s10
                  fmv.w.x      ft0, t3
                  xori         t6, s8, 833
                  fadd.s       fa7, ft10, fs3
                  sra          a7, a3, a5
                  andi         t0, gp, 71
                  slli         a4, s6, 25
                  fclass.s     zero, ft6
                  sub          t4, s7, t5
                  ori          gp, zero, 1336
                  fmax.s       fs7, ft11, ft2
                  sltu         s11, ra, s2
                  srli         a5, t0, 28
                  and          a6, a6, t4
                  fsgnj.s      fs5, fa7, fa3
                  mulhsu       tp, s0, s1
                  andi         t1, a1, -1311
                  fcvt.w.s     s11, ft1
                  mulhu        t5, tp, s11
                  fmul.s       ft9, fs10, ft10, rtz
                  mul          t0, s1, s0
                  sll          s1, s3, s0
                  remu         s9, s10, t6
                  auipc        s5, 296597
                  slt          s7, t5, s6
                  fmv.x.w      t1, ft10
                  fsub.s       fs4, ft1, ft0, rdn
                  fmax.s       fs10, ft7, ft11
                  rem          sp, a5, a1
                  fmax.s       ft9, ft2, ft8
                  fcvt.s.w     ft9, zero, rdn
                  srai         s3, a6, 3
                  sll          zero, s7, s0
                  mulh         s5, t2, a5
                  or           gp, s11, a0
                  sltu         s11, s1, t5
                  fsgnjn.s     ft4, fa7, fa3
                  sltiu        ra, gp, 1521
                  sll          s0, s2, t5
                  divu         a3, s7, s5
                  fmv.x.w      ra, ft5
                  sltiu        tp, s7, -129
                  fmin.s       fa7, fs1, ft9
                  fmv.w.x      ft11, s6
                  flt.s        t3, ft11, fs10
                  fsgnjn.s     ft8, fa3, ft4
                  srai         t6, ra, 10
                  fcvt.w.s     t3, fs2
                  sltiu        s5, s3, 1090
                  xor          s9, s11, tp
                  fsgnj.s      ft11, fa2, fs2
                  lui          s1, 748922
                  feq.s        a3, fs7, fa7
                  fcvt.s.w     fs2, t3, rdn
                  fdiv.s       fa5, fa6, fa6
                  div          zero, a1, s10
                  slli         a2, t4, 25
                  auipc        a6, 15854
                  sltiu        t3, t3, 1593
                  slti         s8, s4, 191
                  fmin.s       fa4, fa2, fa5
                  and          t4, a1, a5
                  srl          tp, s2, a5
                  slti         t5, t4, -775
                  sub          a7, a1, s5
                  ori          s9, t0, -1035
                  fclass.s     a2, fs9
                  addi         t4, t2, -1323
                  xor          sp, s10, t2
                  fmv.w.x      ft11, s11
                  fsgnjn.s     fa6, fa0, fs6
                  fcvt.w.s     t0, fa2
                  feq.s        t1, fs3, fs9
                  fsub.s       fs7, fs10, ft6
                  mulhsu       a4, sp, gp
                  srli         s9, s7, 2
                  addi         s7, s8, -105
                  xor          a1, s6, t1
                  mul          s1, s0, t4
                  sltiu        t3, t3, 1478
                  divu         s10, s7, a0
                  feq.s        s9, ft5, ft2
                  fle.s        a3, fs8, fs4
                  divu         t1, s1, a7
                  fmin.s       fs9, ft10, ft9
                  srai         ra, t0, 10
                  xori         s8, a0, 630
                  fadd.s       fs8, ft8, fs11, rup
                  fcvt.s.w     ft1, t2
                  mulhu        s6, a7, t4
                  slt          s8, a5, t5
                  srli         t0, s0, 18
                  xor          zero, gp, gp
                  slt          sp, s2, a0
                  flt.s        t5, fa2, fa0
                  fsgnj.s      fa4, fs6, ft6
                  ori          s9, a0, 1385
                  fmin.s       ft10, ft5, fa4
                  xori         t1, a3, -1086
                  fdiv.s       ft7, fs1, fa4, rne
                  fclass.s     zero, fs1
                  srli         t5, a2, 16
                  sll          a4, s11, a4
                  andi         t0, a4, 1081
                  or           tp, t2, t0
                  div          t0, t5, s11
                  nop
                  auipc        t4, 314248
                  slti         t2, s1, 1934
                  mulhu        s6, tp, t0
                  sll          a1, a5, s1
                  xori         t6, t4, 569
                  slt          s7, a2, s7
                  sltiu        a6, gp, 223
                  addi         s11, sp, 760
                  fmv.x.w      s7, ft5
                  sltiu        s10, a5, -36
                  sltu         s1, t5, a0
                  add          t6, s8, a1
                  auipc        s10, 637334
                  fcvt.wu.s    s1, ft10
                  addi         s8, a1, 1019
                  fmv.w.x      fs2, a1
                  srli         sp, a2, 9
                  sltiu        a4, a3, -1476
                  divu         a2, a1, a3
                  sltu         s3, a3, s11
                  ori          ra, s9, -893
                  fcvt.wu.s    gp, fa2
                  fclass.s     s10, ft3
                  andi         ra, a1, 1785
                  xor          a2, t3, t1
                  fcvt.s.wu    fs3, a3, rne
                  sll          s0, t4, s9
                  xor          s7, s5, gp
                  and          s10, t3, a5
                  fcvt.s.w     ft3, tp
                  fmax.s       fa3, fs0, fa3
                  addi         s11, a4, 160
                  sltiu        t4, tp, -2024
                  srli         s7, s5, 29
                  and          a5, a0, s6
                  slli         a2, t0, 1
                  flt.s        s3, ft3, ft3
                  fsgnjx.s     fs4, fa6, ft8
                  auipc        t0, 679067
                  ori          s6, gp, -624
                  remu         s1, t3, s10
                  sll          s9, s3, s7
                  fclass.s     a4, fa1
                  mulh         tp, t4, a0
                  ori          a2, s10, 113
                  sub          gp, s8, s6
                  sub          t4, s1, s4
                  sub          a2, a2, s4
                  sltu         s6, t1, s9
                  mulh         sp, s5, t3
                  sll          ra, s11, t4
                  slti         ra, a5, -532
                  fadd.s       fs1, fs4, ft3, rdn
                  slli         tp, gp, 25
                  fcvt.s.wu    fa1, t4
                  mulh         t5, t5, t0
                  rem          t2, a0, t6
                  fsqrt.s      fs6, fs11, rup
                  div          tp, s2, s11
                  srai         t1, t0, 8
                  srai         s9, t5, 16
                  xor          a5, s5, a6
                  or           t0, s7, a3
                  srai         t0, t1, 28
                  xor          t5, s5, s3
                  fsgnjx.s     fa1, fa5, fs6
                  xor          a2, ra, sp
                  mulhsu       zero, a0, s8
                  remu         a5, t2, ra
                  mulhsu       s5, t0, a4
                  fsgnjx.s     ft3, ft11, fa4
                  mul          a7, t4, s2
                  fcvt.w.s     t2, ft10
                  remu         a2, gp, a3
                  fmin.s       fs10, fs7, ft11
                  mulhu        sp, t1, a2
                  rem          a4, s1, t0
                  div          s6, t2, s1
                  mul          s8, s6, s5
                  slt          a7, a5, s2
                  fle.s        s8, fs2, fs3
                  fmul.s       ft4, ft0, fs7, rne
                  fsgnj.s      fa7, ft0, fa5
                  sub          zero, s4, a0
                  or           t6, s7, t6
                  rem          a6, a4, s7
                  srl          t3, a5, s5
                  fcvt.wu.s    s7, fs8
                  srl          zero, t1, s10
                  fsgnjn.s     fs5, ft6, fs4
                  fsub.s       ft2, fs1, ft7, rtz
                  fmv.w.x      fs1, s10
                  mulhsu       s11, a4, a5
                  fsgnjx.s     ft2, fs0, ft1
                  fsub.s       fa3, ft6, ft8, rmm
                  fsgnjx.s     ft7, ft10, ft5
                  divu         zero, gp, s0
                  fmul.s       ft5, ft4, fa1, rup
                  andi         a7, zero, -1656
                  divu         a3, a4, t2
                  fle.s        t6, ft2, fs6
                  xori         a2, t1, -1712
                  divu         t2, s4, s9
                  fcvt.s.w     fs11, s6, rup
                  remu         t0, tp, a5
                  srli         t1, a4, 18
                  fclass.s     a7, ft9
                  srai         t0, a1, 2
                  fsgnj.s      fs0, fs6, fa2
                  and          s5, t4, a7
                  srl          s5, s9, s8
                  fcvt.s.w     ft9, gp
                  mul          t0, s10, zero
                  rem          a1, s4, t2
                  nop
                  lui          t3, 879881
                  srli         ra, t4, 19
                  fsub.s       fa2, fa3, ft0
                  fclass.s     t0, ft3
                  fmax.s       ft10, fa4, fa5
                  fmin.s       ft10, ft6, fs6
                  mulhsu       a4, zero, t1
                  add          sp, s5, s10
                  fcvt.wu.s    a7, ft9, rne
                  sltiu        t0, s5, 867
                  fmv.x.w      s8, fs10
                  remu         s10, s8, t2
                  slti         tp, s0, -1232
                  fmv.w.x      fs2, s3
                  fclass.s     a6, fs7
                  sltu         a7, tp, a3
                  srai         gp, t2, 12
                  fadd.s       fa1, ft0, ft11
                  xor          s5, t2, s5
                  fdiv.s       fs5, ft7, fs7, rmm
                  fcvt.wu.s    s8, ft9, rne
                  fcvt.s.wu    fs10, gp
                  slt          tp, a2, tp
                  add          s1, t4, a2
                  fcvt.w.s     t2, ft10
                  sltu         s7, a1, s4
                  fmax.s       fs5, fa0, fa1
                  fle.s        s1, fs5, ft1
                  fsgnjn.s     fs3, ft2, fs0
                  sub          t0, a6, t1
                  auipc        s3, 1014239
                  slt          a5, s6, gp
                  andi         t1, a3, 1570
                  auipc        a3, 313477
                  fcvt.w.s     s10, fs5
                  ori          t1, t6, 1785
                  sltiu        sp, a7, -707
                  fsub.s       ft4, fs8, ft2, rup
                  fsgnjn.s     ft6, fa1, fs7
                  mul          sp, a2, t1
                  fsgnjn.s     fs7, ft11, fs11
                  andi         a2, s2, -20
                  sltu         gp, s3, s5
                  fmul.s       fs3, ft8, fa0, rne
                  fclass.s     s7, ft10
                  auipc        s10, 417378
                  and          sp, s11, s2
                  slti         t2, t5, 482
                  srli         t2, gp, 30
                  divu         zero, s2, ra
                  slt          s7, a6, s8
                  xori         t4, t3, -103
                  add          t3, s10, a4
                  mul          t6, s4, tp
                  andi         a4, s1, -1951
                  fcvt.s.w     fs5, s8, rtz
                  div          t3, s11, a1
                  lui          t1, 311648
                  andi         a1, ra, 1956
                  fle.s        a4, fs4, fs6
                  srl          zero, s2, tp
                  mulh         ra, t3, s3
                  sltu         s9, a1, a1
                  or           s9, a5, t2
                  slti         tp, s0, 1490
                  xori         a7, a4, 1312
                  lui          t2, 437259
                  lui          ra, 838510
                  addi         s10, tp, -1226
                  srli         s8, t1, 17
                  rem          a3, s2, t1
                  srai         a1, s0, 29
                  addi         s3, t2, -318
                  fle.s        s6, fa6, fa2
                  lui          a6, 624316
                  fsgnjx.s     fa0, fs5, ft3
                  flt.s        s0, fs10, ft5
                  fmv.x.w      t3, fs6
                  divu         sp, gp, t0
                  fmv.w.x      ft10, t6
                  sltu         s3, t6, a3
                  slli         s3, s6, 31
                  lui          a5, 269285
                  fclass.s     s1, fs4
                  mul          a4, gp, zero
                  lui          gp, 438867
                  fmax.s       ft3, fa6, fa7
                  fcvt.w.s     t2, fs11, rup
                  and          t5, a0, s4
                  sub          s1, gp, t3
                  fmin.s       fs8, ft0, fa4
                  fle.s        a6, fs7, fa2
                  ori          a5, t0, -231
                  and          a5, a3, s0
                  fcvt.s.w     fa2, s0
                  srl          s8, s6, t1
                  sra          s6, t6, a7
                  fsqrt.s      ft7, ft9
                  fmax.s       fs7, fa4, fs11
                  mul          sp, s6, t0
                  add          ra, s7, t2
                  slti         s11, s9, -1805
                  flt.s        s7, ft8, fa1
                  xori         t1, s11, -1534
                  fcvt.wu.s    t4, fa4, rup
                  addi         s6, s7, -450
                  fmin.s       ft2, fs9, fa7
                  addi         s7, t1, -1675
                  srl          t4, gp, t5
                  srai         s9, t0, 17
                  fsub.s       fs1, fs10, fa2
                  fclass.s     s6, fa0
                  fdiv.s       fa7, fs1, fs0, rtz
                  andi         t2, s10, 750
                  fsgnjx.s     fs6, fs0, ft2
                  fsgnjn.s     fa6, fa0, ft0
                  div          a6, tp, a2
                  mulh         a7, t3, zero
                  fmv.w.x      ft5, t2
                  nop
                  sll          s10, a4, ra
                  lui          zero, 165427
                  srl          t4, s9, s0
                  sltiu        sp, s3, -746
                  fmv.x.w      s9, fa3
                  srai         s5, a0, 11
                  feq.s        a3, ft8, fs7
                  fmin.s       fa1, fs4, fa7
                  fsgnjn.s     fa3, fa3, ft3
                  slt          t5, t1, t2
                  mulhsu       a5, s0, t6
                  sub          t6, t0, tp
                  fclass.s     tp, fa5
                  fadd.s       ft9, ft1, fa2
                  fmul.s       fs10, fa4, ft7, rtz
                  fcvt.wu.s    t4, fs2
                  slt          a2, s9, s8
                  addi         s6, zero, 1447
                  fsgnjx.s     fs9, fa0, fs6
                  feq.s        a2, fs3, fs0
                  srli         s6, a7, 7
                  sll          t5, s11, s3
                  fmv.w.x      ft8, t1
                  fmax.s       fa5, ft11, fs0
                  sra          a6, sp, a4
                  fdiv.s       ft11, ft4, ft5, rup
                  nop
                  andi         a4, s1, -1047
                  fsqrt.s      fa7, fs9, rup
                  fcvt.s.w     ft3, t5, rmm
                  rem          a1, a0, tp
                  srl          a7, a4, s6
                  fmax.s       ft7, ft2, fs6
                  xori         t6, a4, -990
                  fmax.s       fs0, ft5, fs8
                  fle.s        t1, fs0, fs4
                  fsub.s       fs2, fs9, ft7
                  slt          gp, a4, t4
                  slti         zero, s0, 1706
                  srl          t4, a7, s11
                  fsgnjx.s     fa5, ft7, ft2
                  fmv.x.w      a6, ft11
                  sub          gp, a1, s5
                  slti         s0, ra, 435
                  mulhu        a7, a7, s3
                  sltu         a4, t6, s10
                  sll          t0, s7, a0
                  andi         a7, a3, 1147
                  mulh         t1, t0, t3
                  mulhsu       a4, s4, s1
                  sltiu        a5, a4, -753
                  sltu         t2, s2, a4
                  fmax.s       ft4, ft6, fs3
                  remu         a6, s5, a1
                  fsqrt.s      fa7, fs3, rne
                  nop
                  remu         t4, s0, s2
                  fcvt.s.w     fs0, s0, rmm
                  slt          a3, gp, tp
                  fmv.x.w      a5, ft9
                  div          s10, s9, t2
                  sra          s5, s0, t1
                  fcvt.s.wu    fs9, t3
                  fadd.s       ft7, ft6, fa3
                  auipc        a7, 636070
                  fmv.w.x      fs8, a3
                  fsub.s       ft6, fs11, ft9
                  ori          t4, tp, 1943
                  mul          s8, sp, zero
                  sub          gp, s2, a5
                  srai         t0, a3, 21
                  fsgnj.s      fs4, ft9, fs11
                  xori         a7, a7, 508
                  xori         t3, tp, -242
                  fmv.x.w      sp, ft9
                  fmv.w.x      fs11, t1
                  sra          t3, s5, s1
                  fsgnj.s      fa6, fs5, fa7
                  auipc        a4, 496136
                  or           s1, a2, s6
                  remu         a7, ra, a0
                  mulhu        s5, gp, t0
                  fmin.s       ft4, ft5, ft6
                  fcvt.wu.s    s6, fa1, rne
                  xor          s3, a0, s3
                  rem          s11, t3, a4
                  mul          s9, t5, s11
                  mul          zero, t0, t1
                  mulh         a4, t4, t6
                  andi         s5, a4, 238
                  or           a4, s3, t3
                  srl          zero, s10, t2
                  srli         tp, s1, 24
                  mulh         tp, s3, s0
                  rem          t5, t5, a0
                  fcvt.w.s     a6, ft0
                  fle.s        s11, fa4, fs5
                  fmv.x.w      s5, fa3
                  ori          t3, s10, -1813
                  rem          s3, sp, t0
                  feq.s        t2, fs0, fa4
                  sll          a4, a0, t4
                  fcvt.wu.s    a1, fs10, rdn
                  sltiu        t1, sp, 411
                  xor          s6, s1, s0
                  slli         ra, s6, 14
                  slt          s5, s11, s7
                  or           s7, t4, s7
                  xori         a1, t0, 1562
                  fdiv.s       fs5, fa0, ft10, rmm
                  nop
                  or           a5, a0, a4
                  mul          a3, a4, t3
                  div          s9, t2, sp
                  ori          t4, t4, 709
                  fmin.s       fa5, ft8, ft1
                  feq.s        s7, fa1, ft0
                  feq.s        s0, ft5, fa5
                  nop
                  fsqrt.s      ft1, fa2
                  div          t4, a5, a1
                  sltu         t6, a5, ra
                  auipc        a5, 81381
                  fle.s        s5, ft3, ft3
                  mulhu        a4, s1, t0
                  addi         s5, a1, -376
                  fmax.s       fs11, ft11, fa7
                  xor          t2, gp, s4
                  fsgnjn.s     fs10, fs11, ft8
                  sltu         a5, s5, s0
                  lui          a2, 836844
                  flt.s        a4, fs4, fs2
                  sll          s6, a5, s4
                  slli         t0, t1, 19
                  divu         s10, s7, ra
                  slti         t5, a0, 850
                  rem          a5, a2, s7
                  remu         t6, a3, t6
                  fsgnj.s      fs1, fs11, ft9
                  addi         s3, s11, 1930
                  and          sp, a6, a1
                  add          t1, a6, sp
                  fsgnjx.s     fs9, fs5, fa0
                  add          t5, zero, a5
                  fmin.s       fs1, fs1, fs5
                  sra          ra, s1, gp
                  lui          a5, 333397
                  fsgnj.s      ft0, fs2, ft8
                  rem          tp, s6, s0
                  fsgnjx.s     fs0, fa3, fa0
                  fsgnj.s      ft9, fa3, fa3
                  add          a6, t2, ra
                  div          a3, zero, ra
                  addi         s0, s2, -1325
                  fmin.s       fa4, fs8, ft6
                  sltiu        zero, t1, 766
                  srli         a6, a4, 12
                  fmv.w.x      ft2, s7
                  fsgnjx.s     fa1, fs0, ft1
                  fclass.s     t5, fs9
                  slti         a3, a7, -1167
                  fcvt.s.w     fs5, s11, rdn
                  fcvt.s.wu    fs11, gp
                  feq.s        s0, fa6, fa5
                  slli         t6, t3, 16
                  mulhu        a2, zero, s11
                  andi         s11, s7, 1096
                  fsqrt.s      fa0, fs10, rne
                  or           sp, a1, a3
                  fsgnjn.s     fs6, fa6, ft11
                  fcvt.w.s     s11, fs9
                  sltiu        s11, a4, -415
                  mulhu        ra, tp, ra
                  sll          t4, gp, t3
                  fcvt.s.wu    ft2, t5
                  mul          zero, s9, a2
                  sltiu        zero, s5, -1597
                  fcvt.wu.s    s8, fs9, rmm
                  fmv.x.w      s8, ft8
                  and          t1, t0, sp
                  slti         a3, s0, -564
                  andi         a5, t0, 1193
                  slt          t5, s4, gp
                  andi         tp, s2, 504
                  fmax.s       fs9, fs4, ft11
                  mulh         s3, tp, t4
                  fmul.s       fs4, fa1, fs5, rdn
                  or           ra, t0, t2
                  mulhsu       a2, s11, ra
                  lui          s0, 914737
                  slli         ra, s3, 19
                  srl          sp, s5, s9
                  fmin.s       ft6, ft11, fa6
                  sltiu        s6, s9, -1192
                  auipc        s3, 32977
                  slt          a2, t5, gp
                  fsgnjx.s     fa6, ft8, fa6
                  srl          s1, s3, ra
                  srli         s0, a0, 0
                  srl          t2, s10, t5
                  div          zero, a1, a0
                  fle.s        s10, ft3, ft7
                  div          s10, s0, a1
                  sltiu        a6, a1, -94
                  slti         s9, t4, 2035
                  feq.s        a1, fs0, fs6
                  flt.s        t6, ft0, fs10
                  flt.s        t2, fa4, fs0
                  rem          t3, s0, ra
                  fsqrt.s      fs2, fa6, rmm
                  mulhsu       t4, s1, s0
                  fclass.s     t1, fs8
                  fcvt.s.w     fs11, s11
                  slt          zero, a2, s6
                  fclass.s     t2, ft10
                  fsqrt.s      ft2, fa2, rdn
                  fcvt.wu.s    a5, fa7, rup
                  mulhsu       a3, tp, t3
                  fmax.s       fs9, fa4, fa0
                  fadd.s       fs1, fa0, ft0, rne
                  sltiu        ra, t2, 1039
                  fsgnjn.s     fa3, ft9, fs3
                  fclass.s     s8, fs9
                  fmv.w.x      fs4, t2
                  fcvt.s.wu    fs9, t5, rdn
                  srl          s10, s2, t2
                  mulhsu       t5, s9, s2
                  sltu         a5, s4, s7
                  mulhu        t6, sp, s3
                  srl          t1, a5, s7
                  fsgnj.s      fs11, fs2, fs6
                  ori          tp, s9, 972
                  slli         a4, a4, 11
                  sltiu        sp, t4, 330
                  fsgnj.s      fa3, fa4, ft10
                  mulhu        s9, s7, t3
                  xor          sp, ra, s8
                  add          zero, s9, s7
                  andi         s10, sp, -1027
                  fclass.s     t4, fa2
                  fadd.s       fa5, fs9, fa6
                  rem          s7, s0, s6
                  sltiu        sp, t0, -110
                  xori         s6, s6, -1290
                  fcvt.wu.s    t6, fs8
                  fcvt.s.wu    ft10, a7
                  fcvt.s.w     fa0, sp, rup
                  fadd.s       fa2, fa2, ft5
                  fsub.s       fs10, ft1, ft2
                  sltu         a4, t0, a6
                  nop
                  auipc        t3, 546071
                  fmax.s       fa2, ft10, ft9
                  sub          t5, s3, s10
                  andi         a7, s11, -1246
                  addi         t1, t6, 832
                  fclass.s     a6, fs8
                  fmin.s       ft1, fs6, fa2
                  fadd.s       ft11, fs9, ft2, rmm
                  fcvt.s.wu    fs8, s5, rup
                  srai         s1, s2, 23
                  fmv.x.w      s10, fa3
                  fmin.s       fa3, fa2, fs1
                  fsgnjx.s     fs1, fs4, ft3
                  fsgnjx.s     ft4, fs11, fs9
                  fdiv.s       ft10, fa6, ft5
                  sub          a6, t1, t3
                  or           s11, a0, a0
                  feq.s        s8, fs3, ft0
                  divu         ra, s7, s6
                  sll          gp, t0, s0
                  fclass.s     t3, ft8
                  xori         a1, t6, -701
                  add          a4, s9, ra
                  divu         a3, t3, sp
                  fmul.s       fa0, fs5, fs7
                  fmv.x.w      t6, fs2
                  srai         t1, s0, 8
                  fclass.s     s7, fs10
                  fmv.x.w      a7, fs8
                  auipc        t5, 750994
                  addi         ra, s4, -1330
                  fcvt.wu.s    a3, fa1
                  srli         t5, s10, 19
                  fmax.s       fs7, ft4, fs10
                  fcvt.wu.s    s8, fs2
                  xor          a7, s9, s2
                  mulhsu       s10, sp, s1
                  fsqrt.s      fs10, fs9
                  fclass.s     t4, ft6
                  fdiv.s       ft9, fs3, ft7, rup
                  or           s11, s6, t6
                  sltiu        t0, s9, 128
                  fadd.s       fs2, ft5, ft3
                  flt.s        t4, fs10, fa3
                  or           s8, s8, a0
                  fcvt.s.w     ft11, s6
                  fmul.s       ft0, fs3, ft9
                  mulhsu       s10, s4, t4
                  fsgnj.s      fs7, fs11, ft7
                  mulhsu       s0, t4, t3
                  fmul.s       fs5, ft4, fa3
                  remu         s8, s3, s11
                  add          s3, s0, a7
                  mul          s8, s6, s7
                  srli         tp, a0, 23
                  fmv.w.x      fs11, a7
                  flt.s        t4, fs8, fa6
                  div          a5, tp, tp
                  srl          t1, t1, t4
                  fadd.s       fa0, fa5, fs0
                  fsub.s       fs9, ft11, ft3
                  fclass.s     a5, fa7
                  fmul.s       ft10, fs4, ft9, rtz
                  fsqrt.s      ft3, fs4, rne
                  or           sp, a7, t2
                  remu         sp, s11, t5
                  mulhsu       t2, t0, s4
                  fsgnj.s      fs11, ft6, fa4
                  fcvt.wu.s    s11, ft5
                  sltu         a7, s3, a0
                  auipc        a7, 383278
                  fsqrt.s      ft2, fs0, rtz
                  fsqrt.s      fs4, fs10
                  srl          t1, a2, a1
                  ori          s0, t1, 718
                  lui          s5, 186760
                  and          s0, a7, ra
                  fcvt.s.wu    ft11, s5
                  auipc        s5, 514577
                  addi         t4, t1, 329
                  fmv.w.x      ft5, ra
                  slli         s1, s4, 4
                  auipc        ra, 185817
                  add          a4, sp, a3
                  fcvt.s.w     fs5, t1
                  flt.s        t0, fs3, ft3
                  fmin.s       fs2, ft10, fa4
                  rem          s6, tp, tp
                  fmv.x.w      a3, fs3
                  remu         a2, a0, sp
                  fmax.s       fs11, fs2, fs2
                  feq.s        sp, ft1, fs6
                  nop
                  fmv.x.w      s1, ft9
                  fdiv.s       ft4, fs5, fs9
                  fmin.s       fs11, fa3, fs0
                  auipc        sp, 231377
                  and          a2, a3, t2
                  fcvt.s.wu    fa2, t4
                  fadd.s       ft10, fs8, fs1
                  fcvt.s.w     fs9, t2, rne
                  nop
                  slti         t2, t4, -1193
                  sltu         sp, a7, t3
                  fsgnjx.s     fs9, ft10, fs4
                  auipc        a4, 258014
                  fsgnj.s      ft3, ft3, fa1
                  fcvt.s.wu    fa0, tp
                  addi         s7, a2, 1896
                  fsgnjx.s     ft3, fa2, ft4
                  auipc        zero, 666837
                  fsub.s       fa7, ft10, fs3
                  ori          s1, t2, 1525
                  add          gp, s3, a1
                  fsgnjn.s     fs1, fs0, fa5
                  ori          s7, t5, -1994
                  mulh         t2, s11, t3
                  auipc        a4, 128431
                  lui          s8, 258883
                  andi         a7, t3, 1053
                  fcvt.w.s     t6, fa7, rmm
                  fsqrt.s      fs4, fa6
                  feq.s        s3, fa3, fs2
                  fsgnjn.s     fs0, ft9, ft5
                  fmul.s       fs10, fs11, fs2
                  div          a2, tp, zero
                  fmul.s       fa3, fs4, fs9, rtz
                  rem          s11, s10, a5
                  addi         s9, s0, -212
                  add          s5, s6, s3
                  xor          a7, a4, s2
                  remu         t5, gp, a0
                  remu         s1, a0, a7
                  fmv.w.x      ft4, a7
                  fsgnjn.s     ft9, fs5, fa4
                  xori         t5, s1, -1962
                  fmin.s       fs6, fa5, fs7
                  fmul.s       fs11, fa7, fa4, rdn
                  divu         t2, gp, t6
                  sub          a7, t0, a7
                  slti         a3, t4, 1367
                  fsqrt.s      fs4, ft4, rup
                  andi         t1, a7, 433
                  sra          t5, s3, s7
                  fmul.s       fs6, fs5, fs11, rdn
                  fadd.s       ft10, fs2, fs10, rtz
                  fclass.s     s0, fs9
                  fsgnjn.s     fa5, ft10, ft9
                  xori         t0, a1, 1766
                  slti         a2, t5, 1890
                  fcvt.s.w     ft7, s11, rdn
                  sltu         t1, a4, s3
                  divu         s9, a3, s5
                  sra          t3, s6, a6
                  ori          a1, t6, 1400
                  fsgnjn.s     ft1, fs9, fs11
                  remu         a7, a0, a7
                  ori          s7, s3, -577
                  fcvt.s.w     fa6, s1, rne
                  and          t5, s4, zero
                  addi         s7, s1, -58
                  auipc        t3, 908762
                  add          s10, a7, s6
                  and          s3, s3, s10
                  fcvt.wu.s    s9, fa3, rne
                  mulh         t0, s8, zero
                  fmv.x.w      gp, ft4
                  fcvt.s.w     ft2, t4
                  fsgnjx.s     fs1, fs1, fa0
                  sll          t0, s2, s0
                  fle.s        s3, fs5, fa5
                  fadd.s       ft10, fs0, fa4, rdn
                  andi         s7, a6, -713
                  slt          a5, s6, t2
                  slti         a7, t5, -1626
                  andi         ra, t5, 1112
                  fmin.s       ft6, fs1, fs2
                  fmv.w.x      ft9, s1
                  ori          s3, s8, -2028
                  mulhsu       t2, a6, a0
                  mulhsu       a4, t5, s9
                  fmv.w.x      ft6, a7
                  sltu         t0, s11, tp
                  sltu         ra, ra, s8
                  mulh         t4, gp, t0
                  fcvt.w.s     t6, fs3
                  addi         s8, a7, 78
                  sltiu        s3, s7, 1137
                  fle.s        t1, fs2, fa0
                  mulhsu       gp, a3, a4
                  fsgnjx.s     fa2, fa7, fa5
                  sll          zero, tp, a5
                  sltiu        tp, s2, 1597
                  xori         a1, t5, -43
                  fcvt.wu.s    a2, ft0
                  sltu         t2, tp, s10
                  fsgnjn.s     fa3, fs11, fa0
                  slt          t6, a7, s11
                  div          s8, s11, a5
                  slti         t6, gp, 161
                  or           t5, t4, s0
                  fsgnjx.s     fs8, fs10, fa5
                  andi         t4, zero, 415
                  fmin.s       ft4, fa0, fs7
                  fmv.w.x      ft6, s9
                  xori         a1, a0, -1260
                  fmv.w.x      fs6, s0
                  sra          s7, t0, ra
                  fmul.s       fs4, fs10, fs7, rmm
                  or           s1, s3, t1
                  addi         s6, s8, -634
                  fsgnjn.s     fa2, ft3, ft10
                  flt.s        a5, fs3, ft3
                  fcvt.wu.s    s11, fs11, rne
                  fsub.s       ft1, fs8, ft3, rtz
                  nop
                  fclass.s     t5, ft4
                  fadd.s       fs6, fa7, ft3
                  andi         ra, ra, 1148
                  fle.s        s0, ft1, fs1
                  xori         a7, t3, 1734
                  auipc        s3, 455385
                  add          s11, a7, t1
                  srli         s11, gp, 2
                  mulhu        s7, s9, s8
                  lui          a6, 483694
                  feq.s        a1, ft2, fa5
                  xor          t1, a7, s6
                  rem          s10, a5, s10
                  lui          t1, 45275
                  mulhu        ra, a6, s1
                  fsub.s       ft5, ft1, fs0, rdn
                  xori         a3, zero, -1666
                  addi         s0, s3, -676
                  fmv.w.x      ft8, t3
                  srli         a5, a5, 17
                  auipc        ra, 1036778
                  sltiu        s0, t1, -574
                  sll          t4, t5, t3
                  andi         t6, s2, 13
                  slt          s7, s0, s3
                  lui          sp, 72167
                  fmax.s       ft11, fs4, fa4
                  add          t4, s0, sp
                  feq.s        a6, fa7, fs7
                  fmv.x.w      s0, ft10
                  slti         s10, a6, 271
                  sltu         tp, s2, a3
                  fmax.s       fa4, fa3, fs2
                  or           a7, a6, t3
                  mulhsu       t2, a7, s3
                  fclass.s     s5, ft11
                  and          t4, s4, a2
                  feq.s        a7, fs7, ft0
                  xori         s3, s7, -1636
                  sll          a4, s11, s2
                  slti         t4, t1, -1248
                  fcvt.s.w     fs2, a6
                  fcvt.s.wu    ft6, a1, rne
                  nop
                  lui          zero, 381663
                  fadd.s       fs1, ft5, ft2, rtz
                  sltiu        gp, a1, 742
                  fsqrt.s      fs3, ft6, rup
                  fmin.s       ft2, fs8, fa0
                  fcvt.wu.s    a4, ft1
                  flt.s        a2, fa3, ft1
                  mul          a2, s6, t1
                  mulhu        t4, a7, t4
                  fcvt.s.w     fs6, a3, rdn
                  add          tp, s11, t4
                  fmv.x.w      gp, fs6
                  rem          s7, t0, s5
                  fsqrt.s      fs11, ft0, rup
                  auipc        a3, 278935
                  add          a5, s0, tp
                  divu         t6, a7, s4
                  sll          t5, a7, s7
                  slti         a2, zero, 901
                  sll          s7, t1, tp
                  srli         a2, gp, 4
                  slti         a2, gp, 1408
                  slt          t0, a6, a4
                  sltiu        t4, s5, 973
                  fcvt.w.s     a2, fs3
                  fsgnj.s      fs7, fs4, ft5
                  fcvt.s.wu    ft9, s9, rup
                  sltu         a2, s2, s10
                  mulhsu       sp, s2, s6
                  feq.s        s11, ft2, fa0
                  divu         s8, t2, a3
                  sltiu        gp, tp, 1440
                  xor          a1, t4, s6
                  remu         s11, t0, s1
                  nop
                  and          s7, t2, t1
                  fcvt.w.s     zero, fa1
                  div          t0, sp, s10
                  fcvt.w.s     s11, fs8, rne
                  fsqrt.s      fs9, ft4, rne
                  addi         a2, a2, -639
                  mulhsu       s10, s0, s4
                  sll          a4, s7, a5
                  fmv.w.x      fs7, t6
                  flt.s        gp, fa3, ft0
                  remu         tp, s3, zero
                  fcvt.w.s     a6, ft10, rne
                  fsqrt.s      fs5, fa6
                  fmul.s       fs8, fs1, fs5
                  fsqrt.s      fa2, fa0, rne
                  sub          t1, a7, a5
                  remu         a7, s3, a3
                  fle.s        s5, fs3, fs1
                  sltu         tp, s11, s8
                  remu         a1, zero, a1
                  fclass.s     s10, fa5
                  fsgnjx.s     fa4, fa6, fs5
                  srli         a1, s5, 8
                  srai         t1, t1, 5
                  slli         s10, s7, 23
                  fcvt.w.s     s1, ft9
                  slli         s1, a6, 25
                  flt.s        a5, fs0, fa2
                  and          a7, t4, sp
                  fmin.s       ft10, ft1, fa3
                  fcvt.wu.s    s5, fs10, rne
                  slli         s5, sp, 19
                  or           t4, s11, a7
                  fmv.w.x      fs4, t4
                  add          tp, s9, a3
                  auipc        gp, 678018
                  fsgnjn.s     fa2, fs7, fs11
                  feq.s        tp, ft1, ft7
                  slli         s9, gp, 5
                  mul          t3, s1, s9
                  fsgnjn.s     ft2, ft10, fs5
                  fsgnjx.s     fs4, fs9, fa7
                  fcvt.wu.s    zero, fs11, rtz
                  fsub.s       fa2, fs6, ft2
                  fsqrt.s      ft2, ft6, rtz
                  fcvt.s.wu    ft0, s8, rdn
                  fdiv.s       fs3, ft11, ft6, rtz
                  fcvt.s.w     fa3, t0, rtz
                  and          s0, a5, a5
                  mulhsu       s8, a1, a5
                  xor          a2, s4, s1
                  fle.s        t6, ft11, fa1
                  fmul.s       ft2, fa1, fs9
                  nop
                  fclass.s     s5, fa4
                  addi         sp, s1, 1622
                  fadd.s       ft4, fa4, fa6, rne
                  srli         s10, t5, 9
                  mul          t4, a0, a1
                  fsqrt.s      fa3, fa6, rup
                  add          t3, s5, s0
                  srl          t0, t5, t1
                  addi         s10, a7, 4
                  sll          a6, a6, a5
                  addi         s10, s2, 749
                  sll          a3, s5, s1
                  fmv.x.w      t6, ft8
                  divu         s1, t5, t2
                  sltiu        s0, zero, -316
                  fle.s        t2, ft5, ft5
                  xori         s5, t6, 62
                  fmv.w.x      fs8, zero
                  fcvt.s.w     ft0, t2
                  fcvt.s.w     ft3, s4
                  fcvt.s.wu    ft10, s2, rne
                  sll          s10, t3, s1
                  mul          ra, s11, a3
                  or           ra, a1, a6
                  fle.s        s9, ft3, fs11
                  fcvt.wu.s    s11, fa5
                  fsqrt.s      ft11, fs9, rne
                  rem          t3, t1, s10
                  fclass.s     s5, fs10
                  auipc        s10, 744525
                  sub          t4, a6, s10
                  fle.s        tp, fs5, fs4
                  srai         s1, t0, 19
                  mulhu        s10, ra, s8
                  mul          t3, t3, s9
                  srli         t2, zero, 2
                  feq.s        t2, fs3, fs0
                  sll          s6, s7, t1
                  sltiu        s0, ra, -919
                  fmul.s       ft3, fa0, fa4, rup
                  fsqrt.s      fs0, fs0, rup
                  xor          sp, s1, a1
                  and          a6, s8, ra
                  flt.s        gp, ft2, fs11
                  nop
                  srli         s6, a6, 5
                  divu         gp, a6, s2
                  fmv.x.w      s1, fa1
                  fsqrt.s      fs1, ft8, rtz
                  sll          t6, s5, s11
                  div          s6, s10, a4
                  fcvt.wu.s    t2, ft8, rdn
                  sltu         a2, t3, t5
                  sll          a3, a6, s10
                  fsqrt.s      ft0, fa0
                  sltiu        s0, a4, 438
                  lui          s8, 318071
                  andi         s9, s9, -540
                  fmin.s       ft10, fa5, fs2
                  sub          s1, t3, t5
                  srli         s3, zero, 19
                  fmv.x.w      s9, fs3
                  or           s3, a4, t0
                  fle.s        a4, ft0, ft6
                  srl          zero, sp, s3
                  fmul.s       ft1, ft11, ft0, rdn
                  sll          a6, s0, t6
                  fmv.x.w      a2, ft6
                  slt          t4, a0, a4
                  fmax.s       fs0, fa3, fa2
                  fmul.s       fa0, ft0, ft2, rmm
                  div          s9, s11, s3
                  sltu         ra, s10, sp
                  mulhsu       s0, s1, s5
                  fdiv.s       fs2, fa0, fa0
                  slt          t2, gp, tp
                  nop
                  nop
                  mul          t3, t0, s2
                  feq.s        s1, ft10, fa3
                  mulhsu       a5, sp, s5
                  srai         a1, s5, 30
                  mul          ra, s1, sp
                  fsqrt.s      fa2, fs6
                  fmax.s       fs6, fs7, ft4
                  fdiv.s       fs1, fs4, fs5, rne
                  rem          a6, s3, s8
                  flt.s        a2, fs3, ft0
                  and          ra, a0, t3
                  mulh         t2, t1, ra
                  sltu         s9, t5, a1
                  lui          t2, 128262
                  mulhu        t6, t1, gp
                  or           ra, a3, s4
                  add          s3, a1, s8
                  fmv.w.x      ft5, tp
                  sll          a3, t1, a1
                  sltu         a7, s0, tp
                  nop
                  fsqrt.s      ft7, fa2
                  andi         s1, t5, 954
                  fcvt.s.wu    fs2, sp
                  fmax.s       fs6, ft9, ft9
                  fcvt.wu.s    t0, fs6
                  mulhsu       zero, s3, t0
                  add          t0, s0, t5
                  slli         zero, s10, 8
                  sltiu        t0, zero, -39
                  srai         s3, a6, 17
                  xor          a7, s11, a0
                  fsgnj.s      fs1, fs3, fs2
                  div          s3, a0, a4
                  lui          t3, 547961
                  and          s7, a5, a2
                  fclass.s     t4, fa6
                  slt          t6, t6, t4
                  xor          t1, s7, zero
                  fsgnjn.s     ft7, fs4, fa6
                  fcvt.w.s     a5, ft7, rdn
                  flt.s        gp, ft6, fa0
                  sub          a1, tp, s6
                  sltiu        s10, a3, 581
                  sll          t6, t4, tp
                  fcvt.w.s     s3, fs3, rtz
                  fsub.s       ft1, fa2, ft11
                  sub          s9, gp, t6
                  fcvt.wu.s    s10, fs2, rmm
                  div          s10, t6, t1
                  fmv.w.x      ft9, t1
                  mulhsu       t2, s4, s8
                  fcvt.s.w     ft3, s5
                  fcvt.s.wu    ft10, s6
                  add          t5, t0, zero
                  fle.s        s8, fs6, fs3
                  fcvt.s.wu    fa5, s8, rdn
                  fcvt.s.wu    ft0, tp, rtz
                  sub          a4, s2, a3
                  div          s10, a0, s5
                  fsgnj.s      ft5, fs1, fs10
                  addi         t0, a6, -1686
                  srai         s1, ra, 13
                  and          a4, a0, a0
                  or           s0, sp, s4
                  srli         a2, tp, 0
                  fcvt.w.s     a1, fs2
                  sra          t1, s1, a1
                  fmv.x.w      a7, fs4
                  fmul.s       ft7, ft11, fs0
                  fdiv.s       fs7, ft5, fs11
                  fdiv.s       fs6, fs4, fs4, rmm
                  mul          a6, t0, t1
                  remu         a2, sp, s8
                  fsgnj.s      fa6, ft9, ft11
                  srl          s3, s7, s1
                  fmv.x.w      s6, fa1
                  divu         a2, a2, ra
                  fsgnj.s      ft4, fs7, fs5
                  auipc        t2, 182263
                  add          t1, t4, s8
                  fsgnjx.s     fa6, ft2, ft2
                  fsgnjn.s     ft2, ft1, ft7
                  fsqrt.s      ft5, fa3, rne
                  fcvt.w.s     ra, fs8
                  and          t0, t0, t2
                  fmax.s       ft9, ft9, fs3
                  divu         sp, s1, s7
                  feq.s        s6, ft2, ft2
                  fsgnjx.s     fa1, ft11, ft6
                  fsqrt.s      fs10, fs2, rup
                  sltiu        a2, ra, 1217
                  addi         zero, a2, -345
                  and          t6, s4, a3
                  mul          t3, s9, a4
                  slti         a6, tp, 1953
                  fadd.s       fs1, ft2, ft10, rmm
                  fadd.s       ft0, fa3, ft9, rmm
                  fmv.w.x      fa7, s2
                  fle.s        a5, fa5, fs7
                  fsub.s       ft8, fs6, ft6, rup
                  slli         t6, a4, 22
                  sra          t6, a1, t3
                  fdiv.s       fs6, fs4, fa0
                  slt          t5, a6, a1
                  addi         s0, s10, -934
                  mulhsu       t3, a7, s2
                  addi         t2, tp, 835
                  and          s0, t4, zero
                  fmv.x.w      a3, ft5
                  fcvt.wu.s    a3, ft2, rtz
                  fsqrt.s      fa0, fa2
                  fsgnjn.s     fs6, ft7, ft0
                  fclass.s     s3, fs2
                  fcvt.s.wu    fa3, s3
                  addi         a6, t0, -242
                  sra          a1, ra, a3
                  fcvt.w.s     sp, fs5
                  divu         a3, t6, s4
                  srl          t2, s1, a7
                  fmul.s       fa3, fa0, fs0
                  srl          s1, t5, s6
                  mulh         a5, s10, a4
                  fsgnj.s      fs11, fs8, fa0
                  fcvt.wu.s    a7, fa2, rtz
                  ori          t2, s9, -619
                  ori          gp, a5, -706
                  sltu         s6, s3, s9
                  div          t2, s6, s6
                  addi         s11, t3, -1365
                  or           s9, a2, t1
                  slli         s5, a7, 7
                  divu         s7, a4, s6
                  xori         gp, t6, 799
                  fmv.w.x      fa3, s1
                  sltu         t0, a5, sp
                  div          t3, a5, t0
                  fadd.s       fs2, fa7, fs10, rne
                  slli         a1, t2, 22
                  slti         t1, a1, -280
                  fcvt.wu.s    t4, fs8, rtz
                  srl          ra, a7, s6
                  fcvt.wu.s    t6, fa3, rtz
                  fcvt.wu.s    s3, fs6
                  feq.s        s5, fs7, ft11
                  fsgnjx.s     fs7, ft10, ft3
                  fsub.s       fs5, fs7, fs1, rmm
                  auipc        a5, 767107
                  fmax.s       ft6, fa4, fa6
                  remu         s9, t3, s1
                  and          zero, t5, s11
                  ori          t0, s11, 295
                  slt          s8, t1, t4
                  remu         s6, ra, s9
                  slt          s7, a2, zero
                  fmv.x.w      sp, fa6
                  add          a6, sp, zero
                  sltiu        s11, zero, 431
                  ori          s10, t0, 700
                  fcvt.s.wu    ft7, s10
                  nop
                  srai         t6, a6, 11
                  fsgnjn.s     ft8, fa7, fs4
                  fcvt.w.s     a5, ft6, rtz
                  fmul.s       fs9, ft6, ft3
                  fmul.s       fs5, ft8, ft8, rup
                  fmv.w.x      fa7, s3
                  fsub.s       fs10, fa2, fs11
                  srli         t5, a4, 23
                  andi         sp, s1, 1347
                  sltiu        s6, a0, 1133
                  fmul.s       ft9, fs9, fs6
                  or           sp, tp, tp
                  sra          a7, a7, s10
                  lui          s10, 999742
                  auipc        ra, 1029395
                  sltiu        sp, zero, 695
                  and          sp, s1, s4
                  sub          s1, s3, s7
                  fsgnjn.s     fa6, ft2, ft0
                  div          tp, s3, zero
                  sra          s3, s11, s11
                  or           a6, a3, ra
                  fsgnj.s      ft2, ft3, ft9
                  auipc        s8, 896535
                  slli         a5, zero, 27
                  sltiu        a3, tp, -7
                  fsub.s       ft3, ft3, fs10
                  fsgnjn.s     ft5, ft9, fs1
                  auipc        s7, 578876
                  mulh         t3, t0, ra
                  or           s3, t6, a6
                  sltu         gp, a1, sp
                  remu         a6, a7, tp
                  divu         t0, t3, s8
                  andi         a3, s3, -133
                  fle.s        t5, fa3, fs3
                  nop
                  rem          a4, a6, s5
                  rem          a2, gp, s9
                  rem          s5, s4, a6
                  srl          a4, s0, s5
                  remu         s11, t0, a2
                  slli         s7, s7, 22
                  sub          s8, a7, ra
                  fmax.s       fs3, fa6, fs5
                  fcvt.s.wu    ft7, s11, rtz
                  slli         a5, s11, 25
                  slli         a4, t2, 12
                  fle.s        a2, ft5, fa7
                  fmv.w.x      ft10, s2
                  fadd.s       ft1, ft8, ft11
                  divu         ra, a1, s7
                  fmin.s       fa6, fs4, ft0
                  sltiu        t5, t6, 1402
                  fmv.x.w      a3, fs6
                  srai         s3, t0, 15
                  fsub.s       fa1, ft4, fa3, rtz
                  fsub.s       ft8, ft9, fs9
                  flt.s        t1, fs0, fa4
                  fclass.s     gp, ft0
                  add          a5, s7, t6
                  ori          s8, s2, 1850
                  divu         s11, t1, s6
                  mulhsu       s5, s1, t5
                  srai         t3, tp, 23
                  fmv.w.x      ft9, a1
                  mulhu        a5, a5, ra
                  auipc        a4, 54789
                  sltu         s5, a2, sp
                  fsgnjx.s     fa4, fa0, fs9
                  slli         a6, gp, 25
                  fcvt.s.wu    fs8, s5, rtz
                  fmul.s       ft10, fs3, fa3
                  fsub.s       fa3, fa6, ft4, rne
                  div          a1, s7, a7
                  fdiv.s       fa0, fs9, fs11
                  lui          s5, 916948
                  srai         t3, a6, 27
                  fle.s        t1, fs6, fs2
                  add          t4, s11, s1
                  srai         a2, t5, 30
                  sub          a2, t4, t0
                  fsgnjx.s     fs5, fa5, fa0
                  fsgnjn.s     ft9, fs0, fs8
                  sll          s10, s0, a4
                  sltu         s0, a1, s3
                  fclass.s     t4, fs8
                  srl          a7, a1, a3
                  remu         s5, gp, s0
                  mulh         t5, t0, t1
                  sra          t1, a5, s10
                  fadd.s       fs1, ft7, fa3
                  or           zero, a0, t0
                  fcvt.w.s     a3, fs8
                  andi         a2, s1, 1097
                  and          ra, tp, a0
                  fmin.s       fs4, ft10, ft0
                  fdiv.s       fs9, fs3, fs9
                  slli         s11, a1, 27
                  mulhsu       a1, s2, t4
                  nop
                  ori          a1, s7, 1063
                  mulhu        a7, s10, a1
                  fsgnj.s      ft5, ft3, fs10
                  srl          ra, s8, ra
                  fmin.s       ft11, fa2, fs4
                  remu         t3, s4, s11
                  andi         ra, s8, -654
                  slt          ra, s7, s7
                  fcvt.w.s     a5, fs9
                  andi         gp, gp, 1950
                  fmv.x.w      s5, ft6
                  fmv.x.w      s11, fs0
                  addi         s5, t3, -629
                  slli         a7, a5, 9
                  flt.s        zero, fs3, fa0
                  slt          t3, s11, s11
                  sub          tp, a4, a5
                  mulhsu       a4, a5, a6
                  sub          a1, s1, s6
                  sra          t3, t0, a5
                  fdiv.s       fa4, ft2, fs5
                  fmv.x.w      t4, fs10
                  fmv.w.x      fs0, a5
                  sra          a1, s8, s5
                  fsqrt.s      fs0, ft0, rne
                  fdiv.s       fs8, fs1, fs5, rup
                  rem          a1, s1, t6
                  mulhsu       t3, gp, tp
                  slti         s11, s0, -379
                  fsgnjx.s     ft0, ft11, ft2
                  fsub.s       ft6, ft6, fs9, rmm
                  sll          s0, t3, s1
                  fle.s        t3, ft10, ft9
                  slti         a2, a2, 769
                  mulhsu       a4, s4, sp
                  flt.s        t5, fs3, fa1
                  srli         zero, tp, 31
                  fsgnjx.s     fa2, ft5, fs1
                  fsgnjx.s     fs3, fs11, fs10
                  add          s8, a2, a0
                  ori          tp, a7, -1540
                  mulh         a7, s7, tp
                  fclass.s     t3, fs5
                  or           a2, sp, s6
                  ori          t4, s5, 1113
                  srai         a1, s10, 25
                  auipc        zero, 315695
                  fcvt.s.wu    fa6, s5
                  nop
                  or           s11, sp, s2
                  mulhu        a7, t5, a1
                  slt          a1, s0, sp
                  fcvt.s.wu    ft1, t3, rne
                  divu         a7, t6, t4
                  mulh         t1, s4, s0
                  slli         a5, s0, 27
                  fmin.s       fs9, fs5, fs0
                  fmv.x.w      t2, fs2
                  fcvt.wu.s    s6, fa2, rne
                  xori         t3, t5, -1945
                  remu         t3, t5, s6
                  mulhu        t1, t0, t0
                  fcvt.s.wu    ft7, s6, rdn
                  ori          a5, sp, -1711
                  flt.s        t3, ft4, ft6
                  sll          a4, a6, t6
                  remu         tp, s6, s2
                  sub          a1, t2, a1
                  fcvt.wu.s    s5, ft11
                  fclass.s     a4, ft7
                  flt.s        a6, ft7, fa2
                  sll          s6, a5, s1
                  fcvt.w.s     a3, fs4, rdn
                  srai         a4, ra, 2
                  divu         a2, sp, a0
                  remu         s11, s4, a1
                  sltiu        a2, a0, 165
                  sltiu        s9, s8, 1051
                  fsgnj.s      ft4, ft0, fs4
                  mulhu        s11, a5, a4
                  ori          a3, t0, -336
                  ori          s5, zero, -1348
                  srli         a6, t1, 9
                  andi         s6, s9, 641
                  flt.s        a1, fs4, fs4
                  fmv.w.x      ft3, a6
                  slli         tp, s9, 22
                  mulhsu       ra, tp, a3
                  fadd.s       fs11, ft7, fs6, rmm
                  nop
                  fmin.s       fs10, ft1, ft5
                  fsgnjx.s     fs1, fa6, fs5
                  andi         s11, a6, 1612
                  div          a4, a4, s1
                  addi         t4, zero, -1415
                  andi         s10, s4, -1133
                  fcvt.wu.s    t2, fa0
                  ori          t0, s0, 656
                  div          t2, t1, a2
                  srai         s3, s7, 0
                  fcvt.s.w     ft0, a6
                  fcvt.s.wu    fa6, t3, rtz
                  fsqrt.s      ft9, fs10, rmm
                  fmin.s       ft10, ft1, fs5
                  fmv.w.x      fs6, zero
                  sltiu        tp, s9, 1730
                  flt.s        s7, fa5, fs5
                  fsgnjx.s     fs1, ft7, fa4
                  fmv.x.w      a3, fa4
                  fcvt.wu.s    t0, fs11, rdn
                  srai         t3, gp, 31
                  fsqrt.s      ft9, fa6, rup
                  slt          t2, t1, t0
                  fle.s        a1, fs1, ft5
                  feq.s        s9, ft9, fa2
                  slti         t0, a3, 1548
                  rem          t2, s9, s10
                  fsgnj.s      fa7, fa5, fs4
                  srli         zero, s1, 20
                  mulhsu       t5, s2, a0
                  fcvt.s.wu    fa6, ra
                  add          t6, s3, s6
                  sltu         s0, s1, s6
                  fcvt.s.w     fs6, zero
                  mulhu        tp, t3, s6
                  fmin.s       ft2, fs2, ft7
                  lui          sp, 900899
                  sub          t3, s10, a3
                  slti         s7, a7, -1394
                  rem          t6, s6, t2
                  srai         t0, zero, 14
                  fmul.s       fs0, fa5, fs4, rtz
                  mulh         s5, sp, s11
                  fmv.x.w      s8, fs11
                  srl          a6, a5, s6
                  auipc        sp, 185200
                  fmax.s       fa0, ft0, fa7
                  xori         gp, s4, 1724
                  fmv.x.w      s11, fa1
                  fadd.s       ft0, fs11, fs5, rup
                  mulh         t1, a1, a6
                  sub          s5, t4, s3
                  sub          a5, a6, s10
                  fcvt.w.s     t4, ft1, rtz
                  divu         ra, s0, s8
                  fcvt.s.w     ft4, s3, rtz
                  fsgnjn.s     fa2, fa7, fa2
                  xor          ra, ra, s0
                  fsub.s       fa7, fa7, fs6
                  slt          s11, t5, sp
                  mulhu        s8, s9, t3
                  and          a3, s7, s3
                  or           a3, s4, t4
                  fdiv.s       fs0, fs8, ft0, rup
                  sll          s10, gp, s1
                  mulhu        s3, tp, zero
                  fle.s        gp, ft0, ft4
                  fle.s        ra, ft5, fs9
                  sub          t4, s0, t4
                  fsqrt.s      fa4, fa3
                  rem          t2, a2, s11
                  sltu         sp, s5, s5
                  fdiv.s       ft10, ft9, fs5
                  fmul.s       fa1, ft4, ft3
                  andi         s10, s6, 1040
                  sub          s11, a1, gp
                  and          t1, s5, t1
                  mul          t1, s2, zero
                  fcvt.s.wu    fa2, s5
                  fmul.s       ft8, fs10, ft0, rne
                  fmv.w.x      fs3, s9
                  fcvt.w.s     zero, ft3
                  div          tp, ra, zero
                  flt.s        t3, fa3, fs5
                  or           a1, t2, a3
                  slli         t0, a3, 27
                  sltiu        s7, zero, 1481
                  divu         a4, sp, a4
                  fadd.s       fa6, ft0, ft9, rmm
                  slli         s11, s8, 1
                  sra          a4, zero, t5
                  sltu         a7, t2, a2
                  mulh         a1, t3, t2
                  fsqrt.s      fs0, ft4
                  fadd.s       fs9, fs8, ft0
                  nop
                  mulh         a7, t1, t1
                  sra          s3, t6, a1
                  fcvt.wu.s    t4, ft7
                  sltiu        s10, a1, -1118
                  fsgnjn.s     ft7, ft1, ft0
                  sub          t6, ra, a0
                  lui          t4, 253537
                  srli         zero, s10, 25
                  mulh         sp, tp, ra
                  sltiu        a4, a2, 1750
                  rem          a4, a1, zero
                  fsub.s       fa6, ft6, ft2
                  srl          s10, ra, s5
                  srli         a1, a6, 15
                  fsgnjn.s     fs3, fs5, fs11
                  andi         s0, t5, 1719
                  slti         s11, s4, -959
                  fle.s        a7, fa4, ft9
                  nop
                  ori          t4, zero, -639
                  andi         t3, a6, 1539
                  fcvt.s.w     fa1, s10
                  fmv.x.w      s10, fs3
                  sub          a1, s11, tp
                  mul          tp, sp, s11
                  fcvt.s.wu    fs5, a1
                  rem          tp, gp, zero
                  addi         gp, s2, -1834
                  fcvt.w.s     a7, fa2, rtz
                  srai         s6, a4, 18
                  rem          a6, s6, t0
                  fmax.s       ft3, fa7, fa5
                  slli         s7, a2, 25
                  srli         s11, a4, 23
                  fle.s        a2, ft3, fa7
                  flt.s        ra, ft8, fs0
                  fle.s        a4, fs3, fa7
                  or           t5, s11, s8
                  fmin.s       ft5, fa1, fs4
                  fmul.s       fs8, fs8, fa4
                  slli         s8, s3, 11
                  fsqrt.s      fs6, ft5, rmm
                  or           a7, s6, t0
                  sltiu        s11, a1, -538
                  fmax.s       ft7, fa4, fs8
                  srai         t3, a7, 24
                  slti         s10, a4, -1133
                  auipc        a1, 745537
                  fmv.x.w      tp, fs7
                  mul          a7, a6, zero
                  feq.s        s11, fs9, fs5
                  lui          s8, 243004
                  mulh         a4, a5, s1
                  mulh         s1, s11, s4
                  fmin.s       ft6, ft11, fa0
                  auipc        t0, 418550
                  fadd.s       fs9, ft11, ft6, rtz
                  feq.s        sp, fa5, fs3
                  flt.s        t4, fa2, ft9
                  nop
                  nop
                  flt.s        s0, fs7, ft1
                  add          s5, a4, t6
                  fmax.s       fa5, ft8, ft8
                  fsub.s       fa0, ft4, ft8, rtz
                  fcvt.wu.s    s6, ft6
                  mul          s1, tp, t0
                  slti         s7, sp, -706
                  sltiu        t3, t6, -741
                  fmin.s       fs1, fs7, fs1
                  fsqrt.s      ft3, ft4
                  or           s7, sp, t3
                  xori         s0, s6, 507
                  fadd.s       fs2, fs4, ft11
                  rem          t2, a7, s8
                  mul          tp, a6, a2
                  fsgnj.s      ft9, ft2, ft3
                  fmv.x.w      t0, ft2
                  fcvt.s.w     fa2, a3
                  mulh         s1, s2, a5
                  srl          t3, a6, t0
                  divu         ra, a3, s11
                  slt          s3, s4, s0
                  fsqrt.s      fs6, fs6, rtz
                  fsub.s       fa0, fs2, ft3
                  addi         t0, a5, 731
                  xor          s0, s10, a3
                  sll          tp, s0, t3
                  and          s11, t4, a2
                  srli         t6, zero, 12
                  mulhsu       tp, a7, a3
                  xori         s5, s10, 1247
                  xori         s9, a6, 257
                  addi         tp, s5, 1861
                  sltiu        s9, s5, 1640
                  fmul.s       fs9, fa4, ft11
                  fdiv.s       ft2, ft4, fs0
                  flt.s        tp, fa2, ft3
                  xor          t5, t2, a4
                  fmv.w.x      fa2, s1
                  fle.s        ra, fs4, fs8
                  xor          a6, s9, a5
                  andi         a5, s0, -179
                  fsgnjx.s     ft2, ft0, fa2
                  auipc        s3, 987528
                  mulhsu       s9, a0, s6
                  sltiu        sp, a3, 1522
                  addi         s10, a4, -1921
                  fcvt.s.wu    fs4, zero, rup
                  ori          t6, a2, 1690
                  fclass.s     s5, fs1
                  slti         s9, a1, -1592
                  fsgnj.s      ft8, ft5, ft9
                  fadd.s       ft3, fs3, fa2, rtz
                  or           t6, s5, s0
                  mulh         a7, t5, s1
                  nop
                  sub          a1, t3, s7
                  fcvt.wu.s    s9, fs9, rmm
                  fmin.s       fs8, fs7, fa4
                  rem          s9, a1, s0
                  mul          t5, s9, t6
                  mulhu        s9, a6, t3
                  fcvt.wu.s    s1, ft11
                  slli         t2, s11, 26
                  fsqrt.s      ft8, ft2, rne
                  fsgnj.s      fs6, fa2, ft4
                  fmin.s       fs9, ft10, ft8
                  mul          s1, s8, ra
                  addi         s3, a1, -2034
                  mulhsu       gp, s8, s5
                  fsqrt.s      ft3, fa6, rmm
                  or           s0, tp, t2
                  feq.s        t4, ft0, ft10
                  mulhsu       ra, s4, t4
                  or           zero, s10, s4
                  fcvt.wu.s    s7, fa3
                  and          a4, t2, ra
                  fcvt.w.s     ra, fa6, rup
                  fcvt.wu.s    a2, ft11, rne
                  mul          t1, t0, s7
                  fclass.s     a6, fs0
                  fclass.s     sp, fs10
                  fsgnjx.s     ft1, fa4, fa4
                  slt          t0, a6, a5
                  feq.s        s1, fa5, fs7
                  divu         s10, s2, s3
                  mulhu        s0, s11, s5
                  fcvt.s.w     ft4, sp, rtz
                  add          tp, s0, zero
                  add          s1, a6, s5
                  fadd.s       fs10, ft1, ft11, rne
                  fle.s        s8, fs2, fs11
                  srli         a4, s5, 7
                  div          t4, s8, t3
                  and          t4, t1, a3
                  addi         s6, a1, -1714
                  add          a2, zero, a1
                  mulhsu       s8, a1, ra
                  ori          a6, a0, -1389
                  fcvt.s.wu    fa5, a7
                  fsub.s       ft4, ft2, fs5
                  fmax.s       fa5, fs11, ft2
                  fsgnjx.s     ft2, fs7, ft10
                  slti         s5, a0, 1009
                  fle.s        a4, ft4, ft8
                  mul          a7, s0, t0
                  fcvt.wu.s    s3, fa0, rup
                  xor          t6, s10, s4
                  fmul.s       fs5, fs4, fs5, rup
                  fsgnj.s      ft5, fa7, ft11
                  mulh         ra, sp, t6
                  fsgnjx.s     fs6, fa4, ft11
                  fcvt.wu.s    s7, ft11, rtz
                  mulh         s10, s4, a4
                  andi         t1, t2, -38
                  fclass.s     s3, fa4
                  flt.s        a6, ft7, ft1
                  fmv.x.w      t2, fa7
                  fclass.s     s6, fa1
                  remu         a6, t4, sp
                  slt          sp, s4, a2
                  slt          t0, a4, s9
                  sub          s11, a1, t1
                  fmax.s       fs0, fa7, ft10
                  fcvt.wu.s    t6, fs10, rmm
                  fmin.s       ft4, ft11, fs1
                  fcvt.s.w     ft5, gp
                  fmv.w.x      fs1, t5
                  fsgnjx.s     fs5, ft3, ft0
                  div          t5, t4, t5
                  add          s11, a0, sp
                  mulhsu       a3, s1, a5
                  divu         s10, tp, s7
                  fcvt.wu.s    gp, ft7, rup
                  sll          t0, t6, s9
                  fmin.s       fa6, fs5, fs1
                  addi         s7, s8, -1021
                  remu         gp, s3, t5
                  mulh         t2, a5, t6
                  fmv.w.x      fa7, gp
                  auipc        t1, 607188
                  lui          s11, 575942
                  fmv.w.x      fa6, a0
                  fcvt.wu.s    s5, ft6, rmm
                  xor          t1, t1, s5
                  srl          t5, a1, zero
                  fmul.s       ft6, fa7, ft8
                  fsub.s       ft2, ft11, ft1, rup
                  fmin.s       fs3, fa4, fa4
                  fdiv.s       ft10, ft4, ft8, rtz
                  slt          a4, a3, s9
                  fcvt.s.wu    fs2, a3
                  sub          t4, tp, s11
                  fcvt.s.wu    ft8, t6, rdn
                  slt          s11, zero, s6
                  nop
                  div          t5, t3, a1
                  ori          s1, t4, 1527
                  slti         t3, s0, 330
                  fclass.s     a4, ft2
                  feq.s        a4, ft3, fs8
                  ori          a2, a6, 971
                  flt.s        s0, fa3, ft4
                  xor          t1, s8, a4
                  nop
                  ori          sp, s6, -199
                  andi         s10, s2, -1713
                  remu         s0, s7, s9
                  srai         t2, s9, 19
                  mul          s3, a5, zero
                  fsgnjx.s     ft7, fs0, ft4
                  fmax.s       ft1, fs1, ft10
                  auipc        s5, 490224
                  fclass.s     s11, ft2
                  srai         a3, s11, 15
                  slti         s0, a1, 374
                  slt          s3, s9, a5
                  sltiu        t5, a6, -379
                  mul          s9, s1, a2
                  fsgnjn.s     fa6, ft4, fa4
                  srl          a2, t3, s4
                  and          s7, s10, t4
                  fsub.s       ft2, ft5, fs2
                  auipc        t0, 773369
                  slli         s1, t0, 19
                  fcvt.s.wu    ft10, a5, rmm
                  div          t2, s10, t0
                  fcvt.s.wu    fs4, a0, rup
                  fcvt.s.wu    fa2, a4, rmm
                  fsgnjx.s     fs10, ft7, ft5
                  fle.s        a7, fs11, fa6
                  sra          a6, a0, s1
                  sltu         a5, ra, t2
                  srli         t1, a5, 7
                  sub          s10, s3, t1
                  fclass.s     s3, ft5
                  sll          a3, t3, t1
                  fmin.s       ft4, ft7, ft7
                  slli         a7, t4, 17
                  div          s11, s3, s8
                  and          a4, t2, s9
                  sltiu        s10, s5, -102
                  fsgnjn.s     fa1, ft11, ft8
                  slli         tp, s3, 9
                  mulhu        a3, a7, t5
                  xori         s11, t6, 411
                  fcvt.s.wu    fa2, a3, rmm
                  fsub.s       ft10, fs8, fs7, rmm
                  sll          s11, t2, t2
                  fmv.x.w      t0, fa2
                  lui          a2, 712328
                  andi         s6, s7, 1227
                  fsub.s       fa4, fs11, fa7
                  slt          sp, s11, a1
                  fsgnj.s      ft1, ft2, ft11
                  fsub.s       ft8, fa5, ft2, rne
                  flt.s        a5, fa2, fs0
                  mulhu        s10, a4, a6
                  xor          s1, s10, s2
                  fsgnjx.s     fs10, ft4, fa1
                  fcvt.s.w     ft10, s7, rup
                  fcvt.s.wu    ft4, a0, rne
                  ori          s3, s4, -1192
                  mulh         a7, tp, s8
                  slli         zero, s11, 8
                  add          t3, a7, s8
                  fcvt.wu.s    t0, fs6, rup
                  ori          a4, a6, 1235
                  remu         s6, tp, a4
                  divu         a4, a1, t6
                  or           s0, s3, s6
                  remu         t2, a1, s5
                  fmv.x.w      s6, fs5
                  mul          a2, a7, zero
                  slti         a3, a2, 1649
                  andi         a5, s0, 1043
                  fdiv.s       fa1, fa1, fa1, rdn
                  slti         a7, tp, 259
                  slti         t1, a0, -1582
                  add          sp, s1, t4
                  xori         a4, t1, -1089
                  feq.s        t5, fa0, ft9
                  srli         s5, a0, 18
                  fmin.s       fs0, ft1, ft0
                  rem          gp, s0, s2
                  div          t6, t2, a3
                  fsgnjn.s     ft8, fs2, ft1
                  add          s10, t0, s10
                  fle.s        t4, fa5, fa7
                  sltiu        a5, s8, 1824
                  or           gp, ra, s10
                  or           a3, tp, s1
                  ori          t1, a5, -1693
                  addi         s5, gp, -1906
                  fclass.s     s5, fs10
                  remu         t1, a4, a2
                  fcvt.s.w     fa3, a2
                  fdiv.s       ft6, ft11, ft3
                  fcvt.s.wu    fa2, a0, rdn
                  fsgnjn.s     fs10, fs7, ft7
                  flt.s        s6, fs3, ft2
                  fdiv.s       ft10, ft7, ft9
                  fsqrt.s      fa4, ft6
                  sub          t1, t0, t1
                  fsqrt.s      fa6, fa6
                  sub          t3, s7, a3
                  divu         gp, s9, s4
                  srai         s5, s3, 11
                  mul          t0, t2, s5
                  ori          ra, a0, -1252
                  fle.s        a5, fs0, ft3
                  fadd.s       fs8, fa0, fa4
                  fmv.w.x      fa6, t4
                  slt          a3, s2, s3
                  fsgnjx.s     fs1, fa0, ft9
                  xor          t5, s11, s7
                  srli         s5, a4, 7
                  mulhu        a6, t1, s4
                  fadd.s       fa1, ft3, fa6, rtz
                  fcvt.w.s     a1, fs4, rtz
                  sltiu        a5, s1, -338
                  andi         s3, s4, 324
                  fsgnj.s      fs5, ft1, fa6
                  add          t3, t5, a1
                  xor          t2, a5, tp
                  addi         gp, s6, -303
                  fsqrt.s      fs8, fa4, rdn
                  sltiu        s6, ra, -1017
                  add          zero, a3, a4
                  fcvt.s.w     ft10, s2
                  fmax.s       ft8, fa6, ft9
                  fsgnjx.s     fs8, fa7, fa0
                  fsub.s       ft1, ft1, fs0
                  and          s6, t5, s4
                  fsqrt.s      fa3, fa6, rne
                  sra          t2, gp, s8
                  sltiu        a7, a2, 1327
                  fmin.s       ft11, fa7, ft0
                  fcvt.s.w     fs2, s8, rmm
                  srai         t5, s5, 7
                  fdiv.s       ft7, fa0, fa3
                  srai         a2, ra, 31
                  srai         a6, zero, 10
                  mulhsu       s8, t1, a3
                  fmv.x.w      s6, fs0
                  fle.s        a5, fs5, ft11
                  sltiu        s7, s3, -1359
                  fle.s        s10, fs6, fs8
                  fmv.w.x      ft6, a6
                  fmax.s       fs5, ft11, fs7
                  slti         t4, gp, -1302
                  lui          s8, 55267
                  sltu         ra, a0, s8
                  andi         a4, t4, -446
                  div          sp, zero, s2
                  xori         ra, a4, -2013
                  rem          s5, t5, s3
                  andi         s3, tp, -136
                  slli         a4, s0, 0
                  nop
                  fdiv.s       fs0, ft8, ft10, rmm
                  fadd.s       fa7, fs10, ft11
                  and          t2, t2, a4
                  fsqrt.s      fs0, ft10
                  addi         s11, a1, -1218
                  slt          a7, a6, s2
                  sltiu        s1, t4, 428
                  fclass.s     a2, fa1
                  fcvt.s.wu    fa7, a1
                  fmv.w.x      fs0, t3
                  nop
                  srli         tp, t1, 17
                  mul          s7, ra, s1
                  fsqrt.s      fa4, ft10
                  nop
                  divu         a6, a1, t0
                  fsgnjn.s     ft11, ft0, ft10
                  fdiv.s       ft5, fs8, fs11, rne
                  fsgnjx.s     fa6, fa2, fa2
                  add          a6, a0, t1
                  fsgnj.s      fs0, ft7, fs8
                  fmv.w.x      fs8, s3
                  sub          sp, sp, s0
                  srli         s10, s3, 4
                  srai         t2, a4, 29
                  fmv.w.x      ft1, s5
                  and          a2, a4, a2
                  feq.s        a3, fs1, ft9
                  srai         ra, zero, 31
                  srl          a3, s9, s1
                  fcvt.s.w     fs0, t3
                  fclass.s     s11, ft10
                  slt          a1, t4, ra
                  divu         t0, a2, s5
                  nop
                  sltiu        s8, sp, -80
                  fadd.s       fs0, ft4, fa5, rup
                  divu         t3, t0, s1
                  rem          s10, a2, s2
                  fsgnjn.s     ft8, fs3, fs2
                  srli         s9, s0, 2
                  fcvt.wu.s    t3, fs4
                  fsgnjn.s     fs8, fs2, ft7
                  add          s7, s7, t2
                  sra          a7, t6, s6
                  mulh         s7, s7, t4
                  fsgnj.s      fa1, ft5, ft2
                  mulhu        s3, gp, a0
                  flt.s        t1, ft3, fa1
                  auipc        t6, 718554
                  flt.s        a3, fs0, ft9
                  sltiu        s7, s0, -167
                  divu         t3, t3, zero
                  srl          a2, a1, a6
                  ori          t6, zero, 80
                  fsgnj.s      fs11, ft10, fs1
                  fcvt.s.w     fa1, a3
                  div          ra, s0, t4
                  mulhsu       s8, ra, a1
                  andi         a3, t3, -1375
                  fcvt.s.wu    fs8, s11
                  fsqrt.s      fa3, fs1
                  fsqrt.s      fs3, fs2
                  fcvt.wu.s    s9, fs11, rmm
                  fcvt.s.wu    ft3, t3, rdn
                  fmax.s       ft8, fs0, ft8
                  add          s1, t4, s4
                  fsgnjx.s     fs4, ft5, ft1
                  fsgnjn.s     fs3, fs5, ft3
                  fdiv.s       fa1, fs11, fa2, rdn
                  feq.s        t6, fa7, fs7
                  and          s5, s7, t1
                  fcvt.w.s     s5, fs4
                  sltu         a4, s2, t0
                  fsgnjn.s     fs4, fa2, fs11
                  fsub.s       fa0, fs11, fa1
                  srl          tp, s10, s8
                  fmax.s       fs10, ft11, ft5
                  remu         t3, t2, s2
                  slt          s10, s11, gp
                  divu         tp, a7, s9
                  mulhsu       s7, a6, a3
                  divu         t5, s6, s7
                  srl          a2, a1, tp
                  fclass.s     zero, ft1
                  fmv.w.x      ft9, a0
                  srli         t6, s3, 0
                  srai         t3, tp, 30
                  feq.s        ra, ft0, fs4
                  fsgnj.s      fa1, ft0, fs10
                  addi         s9, sp, -1168
                  fsgnjn.s     ft7, fs4, fa4
                  div          t4, tp, s6
                  srl          gp, s2, t4
                  fadd.s       ft5, ft1, fs10, rmm
                  ori          t6, s6, 866
                  mulhsu       t3, s8, tp
                  xori         a1, s4, 185
                  fsub.s       fa6, fa5, fs10, rtz
                  slli         a6, s10, 7
                  mulh         t6, s10, t1
                  sltu         a3, tp, zero
                  slt          a4, t5, s1
                  mulh         t6, a1, t5
                  srai         s7, a1, 26
                  lui          sp, 900750
                  fcvt.wu.s    ra, fs9
                  rem          s9, t1, a5
                  mulh         a6, a5, t1
                  sltu         gp, t1, a3
                  fmax.s       fs11, ft8, fs6
                  mul          a5, s11, sp
                  mul          t0, a6, s1
                  fsub.s       ft9, fa2, fa6, rdn
                  or           t5, t3, t0
                  fadd.s       ft2, fs7, fa4
                  fmax.s       ft0, fa4, fs2
                  nop
                  fsqrt.s      fs7, ft6
                  flt.s        ra, fs10, fs1
                  fsgnj.s      fa6, ft6, fa5
                  fmax.s       fa3, fs9, fs11
                  slti         a7, s0, 1598
                  andi         a1, s5, -1806
                  xor          gp, a2, a6
                  fcvt.s.w     ft3, a0, rne
                  slti         a7, a2, 1885
                  sltu         t2, s1, s10
                  fcvt.w.s     s0, fa2
                  mulhsu       s0, s3, a6
                  fmv.w.x      fs6, t0
                  rem          s10, s1, t0
                  xor          t4, s3, gp
                  sltiu        s10, s10, -631
                  mulh         ra, t0, s6
                  fadd.s       fs0, fa2, fa7
                  ori          a4, s9, -331
                  fcvt.s.wu    fs5, t2, rtz
                  fsub.s       ft7, ft8, fa6, rup
                  fmax.s       fs8, fs6, fa4
                  sra          zero, a4, t2
                  feq.s        a5, ft5, fs10
                  fle.s        sp, fs2, ft11
                  remu         a1, s8, a7
                  mulhu        a2, s4, t6
                  fmax.s       fa7, fs9, ft9
                  nop
                  fle.s        a2, fa3, fa4
                  fcvt.s.wu    ft4, t0, rmm
                  fmul.s       fs0, fs11, fa2, rmm
                  slt          s7, s5, s1
                  fmv.w.x      ft10, t5
                  slti         s7, gp, -156
                  srli         gp, s5, 23
                  fmv.w.x      ft0, t2
                  slli         gp, a3, 1
                  auipc        a1, 349737
                  divu         s11, a3, t0
                  slt          s10, zero, s10
                  addi         a3, s11, -2019
                  fcvt.s.wu    ft5, a0, rne
                  srli         a3, s8, 3
                  slti         zero, tp, 1954
                  flt.s        a3, fs3, fs5
                  sll          t1, s0, a6
                  or           s10, gp, t1
                  add          tp, t5, tp
                  nop
                  fadd.s       fa2, fa2, ft3
                  fsqrt.s      fa5, ft8, rmm
                  srl          t5, s8, t4
                  sltu         s0, s11, s8
                  remu         a7, s2, s11
                  sra          t6, ra, gp
                  or           t1, a4, a5
                  fsgnjn.s     fs9, ft7, ft9
                  mulhsu       s8, s5, a6
                  fcvt.s.wu    ft0, s8
                  feq.s        a6, ft4, ft1
                  sll          s3, s10, a0
                  mulhu        sp, s8, a7
                  and          s11, a1, s2
                  srl          a6, s10, a6
                  srli         s8, a3, 16
                  and          t5, a1, s11
                  mulhu        t2, s4, t0
                  and          s1, a3, a1
                  mulhsu       t6, ra, a5
                  fmul.s       fa0, ft6, fa3
                  srli         t6, a6, 14
                  fsgnj.s      ft1, ft1, ft3
                  feq.s        tp, fa1, fs10
                  auipc        s11, 989699
                  mul          s11, t2, s11
                  fle.s        s8, fs10, fa2
                  xor          s11, s3, s1
                  or           a5, s7, t5
                  xori         s5, s1, -1901
                  xor          tp, a2, a6
                  or           t0, s1, tp
                  addi         t2, a2, 1547
                  rem          s5, a6, t3
                  sra          t0, s8, a2
                  sra          tp, a3, s7
                  sltu         zero, s5, a4
                  fmv.w.x      ft1, s2
                  fmul.s       fs5, fa1, fs5, rdn
                  slli         a4, s9, 23
                  auipc        a4, 301910
                  mulh         t2, a4, zero
                  flt.s        t0, ft0, ft11
                  fmax.s       ft10, fs5, ft11
                  mulhu        gp, gp, tp
                  ori          a4, s0, -265
                  slt          t6, s4, t1
                  and          t5, s11, t0
                  ori          s6, t5, 67
                  mulhu        gp, t2, tp
                  srli         s7, a3, 7
                  sll          zero, a4, t5
                  slti         a2, a5, 804
                  lui          t2, 37643
                  fsgnjn.s     ft2, ft3, fa4
                  xori         a7, gp, -98
                  fcvt.w.s     tp, fs0, rne
                  sltiu        t2, s8, 1967
                  slli         s8, a4, 20
                  div          s3, s1, t3
                  fmin.s       fs8, ft1, fs9
                  or           s5, a1, t6
                  fcvt.s.w     fa6, tp
                  fadd.s       fa0, fs4, ft10
                  fmin.s       fs10, fa0, fs4
                  fcvt.s.w     ft5, zero, rne
                  fdiv.s       ft10, fs1, fs10
                  andi         t5, s10, -267
                  sltu         s9, t0, a0
                  sll          a5, s10, a7
                  slli         t0, a4, 29
                  fclass.s     t5, fs6
                  fsqrt.s      fa4, ft8
                  fcvt.s.w     ft3, s11
                  fdiv.s       ft0, ft5, fs4
                  slti         s6, t6, -1604
                  and          t6, t0, s6
                  add          tp, a5, a5
                  fdiv.s       fs3, ft1, fs11, rdn
                  slti         s6, s7, -877
                  fcvt.w.s     a7, ft1
                  fcvt.w.s     a2, fs5, rdn
                  fsgnjn.s     fa3, fs5, ft3
                  slli         s3, s8, 21
                  and          s9, s1, t4
                  fcvt.s.w     fs11, s6
                  slli         s1, t1, 11
                  fcvt.w.s     zero, fs10
                  add          a5, s0, a6
                  auipc        zero, 186394
                  fmv.x.w      sp, fs8
                  fmin.s       fa4, fs6, fa4
                  fsub.s       fs3, fs2, fs1, rmm
                  fcvt.s.wu    fa6, t5
                  fmin.s       fa6, fa3, fs11
                  divu         t2, sp, zero
                  or           t6, a2, s11
                  sltu         t2, s5, s2
                  sub          sp, ra, s8
                  fsub.s       ft4, fs10, fs11, rdn
                  fle.s        a5, fs2, fa2
                  fsgnjx.s     ft1, ft6, fa6
                  sltu         s8, a4, a5
                  slli         a6, tp, 12
                  sll          t3, s6, s4
                  fadd.s       fs8, ft6, fa7, rmm
                  slt          gp, s0, tp
                  flt.s        t0, ft7, fa3
                  slti         a7, t3, 1691
                  sll          t0, a0, a4
                  and          s7, sp, s5
                  andi         s8, s3, -996
                  srli         a5, gp, 12
                  xor          a1, s1, s4
                  nop
                  sll          s0, s8, t1
                  fclass.s     ra, fa6
                  fmv.w.x      fs3, s0
                  add          s7, gp, t5
                  fle.s        a4, fs6, fa3
                  andi         a2, s11, -309
                  sra          a5, s10, zero
                  fsqrt.s      fa0, fa4, rup
                  add          s8, a5, a3
                  mulhu        ra, t2, tp
                  andi         t6, tp, 636
                  fsgnjx.s     ft11, ft3, ft5
                  mulhu        t4, a2, t4
                  sra          s6, a3, a3
                  divu         a5, s4, a3
                  fle.s        ra, fs2, ft9
                  auipc        sp, 574128
                  fmv.w.x      fs10, s3
                  fsub.s       ft4, fs1, ft10, rtz
                  srai         t5, t3, 17
                  slti         s11, tp, 73
                  sll          sp, s3, s6
                  fcvt.s.wu    fa3, a0, rdn
                  flt.s        s7, ft0, fa5
                  mul          tp, s3, s3
                  fmin.s       ft6, ft10, fa2
                  fsqrt.s      fa0, fs0, rmm
                  andi         s3, s3, -1868
                  fmv.w.x      fa0, a2
                  fmin.s       fs9, fs10, fa2
                  sra          a5, s11, a6
                  rem          t1, s8, t5
                  div          t5, t3, a2
                  fmv.x.w      ra, ft6
                  mulhu        a1, t2, zero
                  mul          s0, s11, s3
                  sltiu        a6, a2, 1947
                  fsgnj.s      fs0, ft1, ft0
                  fcvt.s.w     ft7, t6
                  fmv.w.x      fs1, s4
                  and          t4, zero, t4
                  srli         s0, s10, 22
                  fcvt.s.w     ft2, t5, rtz
                  slt          tp, s3, t1
                  fdiv.s       ft6, ft7, fs6, rmm
                  fmax.s       fs0, fs9, ft6
                  fsgnjn.s     fa0, fs2, fa1
                  divu         tp, a0, a1
                  fdiv.s       ft5, fa7, fs10, rup
                  fsub.s       fs7, ft2, fa2, rne
                  rem          t6, t1, a0
                  srl          s10, a4, a7
                  sub          a4, s3, t3
                  slt          s6, a1, a6
                  fdiv.s       fs6, ft0, fs1, rdn
                  fadd.s       fa3, ft4, ft11
                  srai         a2, tp, 6
                  fsqrt.s      fa6, fs6
                  add          s11, s3, s10
                  and          ra, gp, s2
                  fmv.x.w      s0, fs10
                  fcvt.wu.s    a5, ft11
                  fmv.x.w      a7, ft3
                  fadd.s       fa2, fs6, fs0
                  rem          ra, a4, a3
                  add          s1, s5, s9
                  fdiv.s       fa2, fs5, ft1, rmm
                  mul          a5, a6, t3
                  mulh         t4, t3, a5
                  slti         ra, a5, -1061
                  fcvt.wu.s    t6, fa5, rtz
                  fsgnjn.s     fa7, ft5, ft8
                  fadd.s       fs1, ft9, ft1, rup
                  fmul.s       ft6, fs4, ft8, rup
                  slti         tp, a7, 1237
                  sub          a2, a0, t0
                  sltu         ra, t2, s10
                  srli         t6, a6, 9
                  sltiu        ra, gp, 1584
                  sltu         s5, s0, s4
                  xor          ra, s0, s2
                  fcvt.s.w     fs2, t5, rmm
                  fclass.s     s1, ft10
                  fclass.s     a7, fs2
                  fcvt.s.w     fs11, s5, rne
                  flt.s        a1, fs10, fa3
                  addi         a2, s0, 2031
                  fcvt.s.w     fa2, t1, rdn
                  fcvt.s.w     fs8, s10
                  mul          s3, gp, t6
                  fsgnj.s      ft11, fs10, fa2
                  mulh         s10, ra, s6
                  sra          s3, ra, zero
                  xori         s6, s3, 642
                  fmv.w.x      fs4, t4
                  fcvt.wu.s    a2, ft9
                  fsgnjx.s     fs1, fs1, fa0
                  slt          s10, s8, s0
                  slti         ra, zero, 2035
                  addi         a4, tp, -1250
                  fmv.w.x      ft8, s2
                  fsqrt.s      ft1, ft0, rmm
                  lui          a7, 305763
                  fcvt.s.wu    fa3, gp
                  sltiu        s0, t2, -1671
                  flt.s        t2, fa5, fs1
                  fsgnj.s      ft1, ft11, fa3
                  add          s1, zero, t4
                  rem          s7, s7, s2
                  fsgnjx.s     fa6, fs10, fs2
                  add          sp, s8, a4
                  slt          ra, t1, tp
                  fsgnjn.s     fs1, fs5, ft1
                  fsgnjn.s     fa3, ft1, fa3
                  mul          a2, sp, s0
                  srl          a1, t3, t1
                  fcvt.s.wu    fa7, tp, rup
                  sll          t0, s10, a0
                  fmul.s       ft2, fs3, ft10, rmm
                  xor          zero, t4, s11
                  mulhu        a7, a3, s9
                  sub          ra, a0, tp
                  addi         t3, tp, -969
                  fclass.s     s3, fa4
                  fmv.x.w      a7, fs11
                  mulh         a5, gp, a3
                  fmax.s       fs7, fs10, fs7
                  divu         tp, a3, s11
                  fmv.x.w      a1, ft5
                  lui          t4, 759103
                  sub          s11, ra, a2
                  xori         ra, t3, 585
                  fmul.s       fs4, ft7, ft2
                  fle.s        a5, ft10, fs0
                  addi         t5, t3, 1901
                  fmv.w.x      fa4, s6
                  rem          sp, s8, a7
                  fcvt.wu.s    a3, fa3
                  srai         a7, ra, 7
                  divu         a3, s5, tp
                  fle.s        a2, fs4, ft6
                  slli         s1, a0, 2
                  nop
                  div          a6, t1, s10
                  feq.s        s0, fs2, ft3
                  mulhsu       s8, sp, s7
                  srl          a7, s3, s11
                  sltiu        t4, t6, -876
                  andi         s9, s7, 2027
                  fcvt.s.w     ft5, a6, rtz
                  auipc        s10, 821224
                  fsqrt.s      fs4, fs10
                  xor          s7, s9, t0
                  nop
                  sra          s3, a6, gp
                  srl          s8, t5, a6
                  fsgnj.s      fs0, ft5, ft0
                  divu         a5, s5, s4
                  nop
                  slti         tp, s6, 187
                  fmul.s       ft11, fs1, fa6
                  mulh         s0, t6, s0
                  addi         s7, t5, 768
                  slt          s0, s10, a7
                  fdiv.s       ft8, fs6, fs9
                  divu         s3, a4, ra
                  fcvt.s.wu    ft10, s7, rne
                  fcvt.s.w     ft11, a1
                  feq.s        a5, fs0, ft0
                  div          s9, a6, a2
                  slt          s7, s3, a1
                  add          s6, a7, t2
                  xori         t6, gp, -1952
                  add          tp, a6, s5
                  and          s8, s9, zero
                  fmv.x.w      t2, ft1
                  fsgnjn.s     fs4, ft7, fs1
                  fcvt.s.w     fa4, ra, rmm
                  andi         gp, a7, 1332
                  fmv.w.x      fs8, s5
                  fsgnjn.s     ft2, ft1, fs5
                  flt.s        s1, fs0, ft11
                  sll          a7, t6, a4
                  divu         a5, t1, s0
                  div          t0, s0, t1
                  xori         t0, s6, -2002
                  fadd.s       fs5, fs5, ft8
                  sltu         sp, s0, s1
                  andi         s10, sp, -168
                  lui          t6, 88167
                  and          a6, t3, s6
                  fcvt.wu.s    s6, fs6, rtz
                  srai         t4, a4, 7
                  nop
                  mulh         a4, t1, s9
                  xori         a4, a3, 429
                  slli         t0, s5, 16
                  fsgnj.s      fa3, fa4, fs4
                  xori         s1, s9, 167
                  srl          a7, t6, a6
                  slt          ra, a4, gp
                  nop
                  xori         s3, s5, -1722
                  add          a2, a2, a3
                  fsgnjn.s     ft4, ft5, fa3
                  fmax.s       fa5, fs6, fs11
                  slt          t0, s3, a4
                  fcvt.wu.s    s8, fs0
                  div          s7, s0, a5
                  fmv.w.x      ft5, s10
                  fadd.s       fa1, ft10, ft8, rne
                  mulhu        s8, a7, a0
                  xor          a5, a0, s6
                  fdiv.s       ft4, ft5, fs3, rdn
                  fsub.s       fa2, ft3, ft2
                  sra          a1, t2, a7
                  and          t4, t3, gp
                  and          a3, s5, t1
                  slt          t5, s10, s9
                  flt.s        a5, fa5, ft4
                  mulh         gp, t2, zero
                  fcvt.wu.s    a6, fs9
                  fsgnjn.s     ft2, fs2, ft9
                  fclass.s     a7, ft4
                  rem          zero, s10, a0
                  sltu         t5, s5, t1
                  sll          s11, s5, a5
                  fclass.s     a4, fa4
                  ori          s6, zero, -1963
                  sll          zero, ra, s10
                  fadd.s       fs11, fs4, fs8, rmm
                  divu         ra, sp, zero
                  sltiu        s8, s10, 2034
                  sll          gp, s7, s6
                  sub          ra, s2, a4
                  mulhsu       s7, tp, t2
                  srl          t5, ra, s4
                  fmul.s       ft1, fs4, fa1
                  flt.s        t0, ft3, ft10
                  fsgnjn.s     fa4, ft8, ft4
                  remu         a5, a1, s10
                  fclass.s     s7, fs5
                  fcvt.w.s     zero, fs8
                  remu         a3, a1, t4
                  fmv.w.x      fs4, a3
                  mulhu        s0, t2, s6
                  add          s8, t4, a7
                  fcvt.w.s     s9, fa6, rmm
                  xor          tp, s10, s9
                  fcvt.wu.s    t0, fs1
                  divu         s10, s1, s11
                  slt          s0, tp, s8
                  fmv.w.x      fs6, a3
                  fcvt.w.s     s6, fs2, rne
                  sll          t4, gp, a5
                  fsgnjx.s     fa1, ft7, fa4
                  slli         s0, a6, 20
                  sltu         a5, t1, a0
                  add          s9, t6, a4
                  fadd.s       ft8, ft4, fa1, rne
                  sra          zero, s1, s6
                  fcvt.s.w     fa5, t0, rmm
                  rem          a2, t6, s6
                  xor          tp, t6, s2
                  xori         a6, s8, -1498
                  nop
                  fsgnjn.s     fa0, ft11, fs2
                  mulh         s7, a7, t5
                  mulh         s5, ra, s6
                  ori          gp, ra, -1561
                  fsgnj.s      fs9, fa2, fs0
                  remu         a1, s4, a0
                  fsgnj.s      ft5, fa2, fs3
                  fcvt.s.wu    fa0, a7, rup
                  lui          s9, 768485
                  sll          t6, a2, sp
                  feq.s        sp, fa0, fa4
                  flt.s        a2, fa1, fa5
                  divu         t4, gp, a4
                  fsgnjn.s     ft8, fs6, fa2
                  sltiu        s1, t3, 1441
                  srai         s8, tp, 2
                  fclass.s     s1, ft9
                  feq.s        t1, fs8, fs1
                  fcvt.s.wu    fa5, ra
                  feq.s        a2, fs6, ft9
                  srai         zero, t3, 22
                  srl          a4, s6, a1
                  slti         t6, s9, 1575
                  fle.s        t0, ft10, ft6
                  fadd.s       ft9, ft1, fs2, rup
                  xori         t1, tp, 1397
                  rem          ra, zero, tp
                  sra          a2, a0, a7
                  addi         t0, gp, 1149
                  fclass.s     a1, ft2
                  mulh         t3, ra, sp
                  or           a1, s3, a6
                  fsgnjx.s     fs11, fa3, ft3
                  addi         a3, a7, -314
                  fdiv.s       ft0, ft6, fa6
                  fsqrt.s      fa6, ft10, rtz
                  fdiv.s       fs7, ft10, ft3
                  srl          ra, a3, a7
                  mulhu        s9, t3, s8
                  addi         s9, tp, -590
                  rem          s5, s6, s7
                  andi         s11, sp, 2033
                  nop
                  mulh         s11, s10, s9
                  mulhsu       gp, a5, s3
                  xor          s6, t2, t3
                  rem          s1, sp, s0
                  fmax.s       ft6, fa6, fa6
                  fsgnj.s      fs6, fa6, fa2
                  fsub.s       ft5, fa3, fs0, rtz
                  fcvt.s.w     fa5, s3, rup
                  srai         a7, a0, 9
                  slli         s11, s11, 16
                  sra          t3, a6, ra
                  fmax.s       fs2, fa6, fa7
                  andi         t2, s6, 309
                  sub          a5, s9, t2
                  sll          a5, t5, a0
                  srli         a1, a3, 31
                  fsgnjx.s     fs0, ft5, fs11
                  lui          s1, 242699
                  fsub.s       fa2, ft8, fs1
                  flt.s        zero, fa2, ft6
                  srli         t4, a4, 10
                  lui          a5, 954860
                  slt          s1, s3, a1
                  fsgnj.s      ft10, ft10, fa2
                  fmin.s       fs2, fs3, ft2
                  mulhu        s8, s4, tp
                  ori          gp, gp, 1014
                  mulhu        t0, t3, tp
                  and          zero, t0, a0
                  fclass.s     s7, ft6
                  fsqrt.s      fa4, ft3
                  srl          t5, ra, s2
                  rem          s10, s10, s2
                  fmax.s       fs9, fa5, fa6
                  fcvt.wu.s    t2, ft10
                  sra          t2, a6, s4
                  add          a7, a3, zero
                  mulhu        s8, s2, a2
                  mulhu        s1, s0, t0
                  slti         s5, sp, -602
                  rem          zero, a1, t1
                  addi         t6, a2, -614
                  sltiu        s10, zero, -326
                  and          a5, a6, a1
                  mulhu        t3, a7, zero
                  fdiv.s       fa0, ft11, ft3, rtz
                  mulhsu       s6, t4, t4
                  sub          gp, s6, a4
                  fsub.s       ft2, ft6, ft0
                  sub          t6, s7, a5
                  fsub.s       fs10, ft1, ft10
                  sll          s10, zero, s10
                  divu         s9, sp, a5
                  fcvt.wu.s    sp, fa7, rtz
                  fdiv.s       ft2, fa0, ft11
                  slti         s1, s3, 1605
                  xori         t2, a3, 993
                  flt.s        a3, fs1, fa6
                  ori          t2, t1, 329
                  lui          s9, 671026
                  mulhsu       gp, t1, a5
                  srli         a7, gp, 5
                  fsqrt.s      fs0, fs11
                  xori         a7, s2, -1881
                  fle.s        t2, fs1, fs10
                  fcvt.w.s     t6, fa6, rmm
                  fsub.s       fa6, fs9, fa4
                  nop
                  addi         s0, gp, 1349
                  sra          s7, a1, s5
                  div          zero, sp, a6
                  fadd.s       ft2, fa0, fa1, rdn
                  fsgnjn.s     ft0, fa5, ft5
                  addi         s0, a4, 94
                  fmv.w.x      fs2, s10
                  srai         gp, a0, 17
                  add          s6, ra, t3
                  fdiv.s       fs9, fa0, fs9
                  fclass.s     a4, ft3
                  mulhu        s9, t5, tp
                  lui          tp, 680124
                  srli         zero, gp, 11
                  xori         t2, t6, 2046
                  fsub.s       fs7, ft9, fs10
                  sltu         a1, s3, s5
                  slt          s0, t5, gp
                  mulhsu       t1, ra, s10
                  fcvt.s.w     ft10, t5, rne
                  addi         a6, gp, -1671
                  and          gp, s11, a5
                  fmul.s       ft3, fs7, ft3, rup
                  slt          t0, ra, a4
                  rem          s8, a1, tp
                  srl          t5, s11, s4
                  div          t0, t4, a5
                  fcvt.wu.s    t0, fs5
                  mulhu        a7, s9, t0
                  slt          s5, t3, zero
                  div          s8, a7, s6
                  fclass.s     t1, fs6
                  fcvt.s.wu    ft6, t5
                  remu         a1, t4, t3
                  fdiv.s       ft9, ft3, fs4, rdn
                  srli         a5, t4, 26
                  rem          t1, s3, s2
                  mul          t1, s8, t3
                  slli         tp, t4, 19
                  fdiv.s       fs2, ft8, fs9, rtz
                  sltiu        gp, t1, 1431
                  sltiu        t3, ra, 1479
                  andi         a3, s2, 1075
                  fcvt.wu.s    tp, fs11, rmm
                  and          a3, t2, s4
                  slti         t2, a7, -942
                  srai         a1, a6, 17
                  sltu         tp, a1, ra
                  fadd.s       fa6, fa1, fa7, rmm
                  auipc        s5, 958544
                  fcvt.s.wu    fa5, zero
                  ori          a1, s4, -647
                  xor          a3, s9, t3
                  fcvt.w.s     zero, ft0, rup
                  sub          t4, t4, t2
                  fsgnj.s      ft4, fa0, fs8
                  addi         s3, s7, 1476
                  flt.s        s0, fa6, fs11
                  mulhsu       t5, s3, a2
                  lui          s11, 1041744
                  divu         t1, a2, t2
                  fmv.w.x      fs9, a0
                  mulhu        t0, s10, s4
                  sub          a1, s5, s2
                  auipc        s3, 911699
                  mulh         tp, s4, gp
                  fadd.s       ft0, ft4, ft9, rne
                  fsgnjx.s     ft0, fs1, ft2
                  fmul.s       ft5, fs3, ft5, rdn
                  fclass.s     s10, fa2
                  mulhu        s8, ra, t4
                  srai         t3, zero, 13
                  fclass.s     tp, ft5
                  slt          a6, t5, a0
                  fcvt.w.s     a5, ft1, rup
                  srl          zero, t2, a3
                  rem          gp, t6, s9
                  srai         tp, s7, 20
                  andi         tp, s7, -1409
                  feq.s        t4, ft9, ft4
                  fsgnjn.s     fa3, ft11, fs4
                  fle.s        a3, ft5, fs2
                  add          tp, t3, s2
                  divu         t1, zero, a6
                  sll          s9, a7, s4
                  fcvt.s.w     ft7, t1
                  divu         s10, tp, s11
                  sltiu        gp, s7, 6
                  slti         s0, s4, -30
                  mulh         s8, s6, s8
                  fadd.s       ft4, fa6, fs10
                  fcvt.s.wu    fa6, gp
                  slti         a2, t6, 67
                  fcvt.s.w     ft7, s5
                  remu         t4, s9, ra
                  remu         s11, t0, s7
                  srli         a6, t1, 4
                  fclass.s     t3, ft2
                  or           sp, s3, zero
                  srai         t1, t4, 25
                  fadd.s       fs7, fs10, ft5, rne
                  nop
                  mulhsu       t6, sp, t1
                  fcvt.wu.s    t4, fa3
                  ori          s7, t2, -1220
                  sltiu        t4, sp, -1841
                  fcvt.w.s     s8, ft4
                  sub          t1, s8, a7
                  fcvt.s.w     fs8, s0, rtz
                  fmv.w.x      fa7, s5
                  sltu         s6, s1, sp
                  sra          s7, s5, t1
                  rem          s7, s5, a4
                  or           t4, s0, s1
                  auipc        gp, 96516
                  fle.s        a2, fa2, fa6
                  mulhsu       sp, t0, a5
                  srai         a2, a3, 6
                  mul          zero, s1, a7
                  fmax.s       ft7, fs6, fs11
                  fclass.s     s5, ft2
                  srai         s0, t6, 23
                  sra          a1, a4, gp
                  andi         sp, s6, 1447
                  fsgnjx.s     fs5, ft0, ft8
                  fdiv.s       fa1, fs10, fa1
                  sltu         a5, s11, t2
                  and          gp, t5, s1
                  auipc        t3, 337095
                  sltu         t6, a3, a4
                  fsgnj.s      ft6, fs7, fs2
                  auipc        s9, 1751
                  sll          sp, t5, tp
                  sll          t3, a7, a3
                  slti         s1, a5, -609
                  fsgnjx.s     fs8, ft0, fa4
                  slti         t2, a6, -770
                  div          s0, a3, s10
                  fmin.s       fs3, fs3, ft2
                  ori          s8, gp, -719
                  slt          gp, a3, a2
                  add          t1, zero, t4
                  fcvt.s.wu    ft9, s0, rup
                  fmv.x.w      s7, fs8
                  div          t4, s4, a7
                  sltiu        sp, a7, -1084
                  sra          t5, s4, a4
                  fmv.x.w      a3, fs0
                  sltiu        sp, s8, 1967
                  fsub.s       fs11, fa1, ft10
                  xori         a1, s8, -1570
                  sub          ra, t0, s1
                  fsub.s       fs2, fs6, fs1
                  andi         s10, s0, 902
                  fsub.s       ft3, fa6, fa5, rdn
                  slti         s5, t1, -230
                  xori         s3, a0, -59
                  slti         s3, a4, -1520
                  add          s6, s11, a4
                  srli         s1, s9, 21
                  fsgnjx.s     ft10, fs3, fs1
                  fmin.s       ft6, fs9, fs5
                  xor          gp, s8, a1
                  addi         t2, t4, 227
                  fmv.x.w      zero, ft0
                  fmv.x.w      t0, ft1
                  feq.s        sp, fa5, fa3
                  remu         s1, s9, t6
                  slli         s0, s6, 29
                  div          s5, a1, a4
                  addi         s11, a7, -165
                  fmul.s       fa2, fa4, ft4
                  fmul.s       fs3, ft4, fs10
                  fcvt.w.s     a1, ft8
                  fcvt.s.wu    ft0, t5
                  feq.s        t3, fs0, ft1
                  sra          t2, s9, s7
                  nop
                  fsgnjn.s     ft0, fa1, fs11
                  auipc        t1, 66390
                  xor          s3, t2, a7
                  auipc        s10, 412629
                  fsqrt.s      ft5, ft8
                  srli         t5, a2, 6
                  fcvt.w.s     tp, fs5, rtz
                  rem          s9, a7, a6
                  xor          a7, s2, s2
                  div          s10, t3, t6
                  srli         s1, gp, 16
                  div          s8, a5, a3
                  fsub.s       fs9, fs4, fs11
                  fsgnjn.s     fa1, ft0, ft5
                  fcvt.s.w     fs4, a4, rtz
                  sub          gp, a7, a5
                  srl          t2, a5, a7
                  fcvt.wu.s    t4, fs2, rdn
                  fsub.s       fs2, fa1, fs0
                  ori          t2, s10, -1480
                  slti         t1, t6, 122
                  fclass.s     zero, ft6
                  fclass.s     s1, fa0
                  sub          s11, a1, s1
                  div          t6, t2, s2
                  sub          t4, a5, s6
                  ori          a6, s6, -1413
                  flt.s        t6, fa4, fa2
                  sltiu        a1, a1, -1331
                  fdiv.s       fa1, fa5, fs5
                  sll          sp, t0, s8
                  fmin.s       fs0, ft8, ft5
                  fmul.s       fs1, fs8, fa1, rne
                  mulhu        s7, a1, s6
                  divu         a3, t2, a1
                  fle.s        t6, fs4, fs5
                  xor          t1, a1, s7
                  fcvt.w.s     a2, ft4, rup
                  remu         s1, a4, a2
                  sll          a5, s2, tp
                  fle.s        a4, ft5, fa1
                  srli         gp, t6, 29
                  fsub.s       fa1, ft3, ft0, rdn
                  mulhsu       ra, gp, a2
                  sll          t4, t3, zero
                  fsgnjx.s     fa7, fs5, fs10
                  fmin.s       ft8, fs3, ft11
                  fmv.x.w      s0, fs0
                  slli         a1, t4, 12
                  flt.s        a2, fa4, fa0
                  fcvt.s.wu    fs5, t4, rmm
                  sltu         a1, a4, sp
                  srli         t2, sp, 23
                  add          s1, s1, a7
                  xori         s8, t0, 984
                  fadd.s       fs1, ft9, fs8, rmm
                  or           tp, a1, a5
                  mulh         s7, a7, s2
                  srli         a3, s8, 5
                  sltu         t6, s1, a3
                  srli         t5, a3, 1
                  remu         ra, a7, t2
                  lui          s10, 912490
                  xori         zero, s5, 1482
                  add          s11, s2, s8
                  flt.s        gp, ft11, fs7
                  fadd.s       fa5, fa4, ft3
                  mulhsu       t0, s3, a1
                  add          tp, s3, t3
                  fmin.s       fa5, ft3, ft10
                  mulh         t3, s11, s7
                  srl          a6, s6, gp
                  slti         a4, s8, -1968
                  ori          s3, a7, -353
                  sll          t1, s6, tp
                  srli         a2, s11, 25
                  fsgnjn.s     fa2, ft5, fs11
                  fsqrt.s      fs10, ft3, rtz
                  add          t0, s1, t2
                  mul          a2, t6, s11
                  fmul.s       ft10, fs2, ft11
                  ori          a7, zero, 1963
                  srai         a6, a5, 26
                  fadd.s       fs9, fs4, fa6, rmm
                  div          ra, t2, s3
                  fmv.x.w      a3, fs2
                  ori          t1, s0, 1343
                  rem          zero, a0, s5
                  sltu         s8, t6, s6
                  sll          a1, s5, s11
                  fmv.x.w      a3, ft5
                  addi         s5, t4, 2041
                  fcvt.s.wu    fa0, t6, rdn
                  fmv.x.w      t2, ft11
                  ori          s1, t2, 814
                  fclass.s     t0, fs5
                  fadd.s       fa2, fs3, ft7
                  addi         s11, s10, 1345
                  fmv.x.w      gp, ft0
                  fmin.s       ft4, fs3, fa6
                  fsqrt.s      ft10, ft8, rne
                  slti         s10, s4, 2020
                  sltu         s10, a1, t4
                  remu         t5, s7, s6
                  fdiv.s       fa3, fs2, fs9
                  slti         s9, a6, 315
                  mulhsu       sp, sp, s5
                  feq.s        sp, fs8, fs3
                  fmul.s       fa2, fa3, fs11
                  fmv.w.x      ft7, a7
                  feq.s        t0, ft3, fa4
                  auipc        t4, 259183
                  sra          t2, a6, s10
                  addi         a3, t1, 807
                  fclass.s     tp, ft4
                  srl          gp, tp, s10
                  xor          s0, gp, s4
                  sub          s9, t0, t5
                  slli         s5, a4, 13
                  fmax.s       fa1, ft1, ft6
                  nop
                  mul          s1, s5, s10
                  ori          a7, s8, 1004
                  sltiu        a5, ra, 1958
                  fcvt.s.wu    ft8, s5, rne
                  fcvt.s.wu    fs4, sp, rne
                  sltiu        gp, t6, 1476
                  add          t2, t2, a2
                  add          gp, a3, a5
                  sub          s10, t4, s10
                  mulh         s8, a7, a6
                  slti         a5, s3, 1279
                  fdiv.s       fs1, fs3, ft3, rne
                  fcvt.s.w     fa4, t6
                  rem          t5, s6, a0
                  xori         t4, s8, 198
                  nop
                  divu         t3, s1, a5
                  lui          s8, 73496
                  andi         t4, s8, -756
                  mul          s7, a7, a7
                  sub          s7, t1, a7
                  fsqrt.s      fa5, fa5, rne
                  fclass.s     s1, fa3
                  and          a3, tp, s4
                  lui          zero, 607406
                  fcvt.w.s     a7, ft11, rne
                  nop
                  add          sp, a4, sp
                  nop
                  fadd.s       fs0, fs6, fs4, rne
                  and          a5, t0, s4
                  addi         s3, ra, -402
                  mulh         a5, t1, a6
                  div          s5, s11, a1
                  slli         t2, t4, 21
                  nop
                  fcvt.w.s     s7, ft7
                  add          s8, zero, zero
                  or           ra, zero, sp
                  sltiu        s11, a5, -241
                  andi         s0, t5, 377
                  add          a4, sp, gp
                  rem          t3, a0, s2
                  srli         a2, ra, 24
                  fsgnjx.s     fa3, ft3, ft6
                  fcvt.wu.s    a6, fs1
                  fmv.w.x      fs2, s11
                  srli         a3, t3, 30
                  mul          sp, ra, s4
                  fadd.s       ft0, fs8, fs3, rup
                  div          a3, t0, t0
                  add          tp, zero, s7
                  fmv.w.x      fs9, s11
                  sra          t3, s3, sp
                  addi         tp, zero, -906
                  addi         s5, gp, -1699
                  sll          t6, t2, s9
                  fdiv.s       fs7, ft7, ft4
                  srli         a4, s11, 7
                  sltu         t5, s8, s10
                  srli         s7, s2, 12
                  fle.s        t3, ft0, fs5
                  sltu         sp, s2, s7
                  mul          a6, a6, t3
                  sll          sp, s10, s9
                  remu         s9, s11, a1
                  srai         gp, s5, 19
                  fmax.s       fa7, ft2, fa4
                  mulhu        a1, sp, gp
                  slti         t4, s10, -1396
                  rem          s10, t0, a5
                  srai         s8, t4, 29
                  fsqrt.s      ft1, fs1
                  ori          a3, t3, 1276
                  feq.s        s7, ft6, ft11
                  fdiv.s       fs11, ft0, ft9
                  sra          s6, a4, s10
                  srl          tp, t1, tp
                  fmin.s       fa6, fs2, fs4
                  fmv.x.w      s1, fs1
                  srai         s10, ra, 20
                  ori          a3, t2, 1214
                  fle.s        a3, ft2, fa2
                  sll          t2, t2, ra
                  mul          s1, s10, t3
                  fle.s        gp, ft3, ft7
                  fsgnjn.s     fs9, ft11, fs10
                  fsgnjx.s     fs6, ft11, fs1
                  xor          s7, s3, zero
                  xor          t0, a7, zero
                  or           a2, t3, a2
                  fmax.s       fa2, fs11, ft8
                  rem          tp, t2, a5
                  feq.s        zero, ft6, fs4
                  fsqrt.s      fs11, fa5, rmm
                  fmv.x.w      t3, fa4
                  sll          s6, t4, zero
                  flt.s        a7, fs4, fa1
                  and          t0, tp, t4
                  div          s6, s0, tp
                  xor          t2, s2, s2
                  mul          a3, a3, tp
                  fcvt.s.wu    fs1, t3, rmm
                  fmv.x.w      t0, fs0
                  mulh         t2, t0, t1
                  rem          a4, a1, s0
                  addi         s10, s1, -507
                  fmv.x.w      a3, fs0
                  and          t3, sp, zero
                  andi         a1, zero, -571
                  sub          t1, t5, a5
                  fcvt.wu.s    t3, fa5
                  fclass.s     t5, ft9
                  fclass.s     tp, fa2
                  nop
                  fdiv.s       fs0, fa0, fa0, rmm
                  xor          ra, a4, s11
                  fdiv.s       fs7, fs11, ft0, rup
                  lui          t4, 606531
                  or           a7, tp, gp
                  xor          s11, t3, tp
                  mulhsu       s10, s10, s7
                  fsgnj.s      fs0, fa5, fa3
                  fsgnj.s      ft3, ft10, fs2
                  srai         t2, t2, 26
                  nop
                  slti         a7, s5, -2037
                  divu         t5, s8, a5
                  fsgnjn.s     ft1, fa7, fa7
                  srai         a2, sp, 17
                  lui          s6, 126504
                  fsqrt.s      ft7, fs10, rup
                  or           zero, t2, t4
                  slli         a6, s5, 17
                  fcvt.wu.s    t3, ft4, rne
                  or           a4, s5, tp
                  fcvt.wu.s    s3, fs7, rup
                  fmv.w.x      ft4, s7
                  fsgnj.s      ft5, fa6, fa6
                  mulhsu       s9, s1, s0
                  fsgnjn.s     fs7, fs4, fs1
                  fclass.s     t1, fa6
                  mul          s7, s4, sp
                  fmv.w.x      fa4, gp
                  sll          tp, s0, t3
                  mulhsu       a6, a0, t3
                  sltu         s10, s1, t5
                  srai         t2, t0, 4
                  xori         sp, a0, 892
                  sltu         s5, a3, s6
                  fsgnj.s      fs11, ft9, fa4
                  fmv.w.x      fs6, zero
                  fmin.s       ft0, fa1, fs7
                  fmax.s       fa4, fa0, ft1
                  sltu         s6, s6, s2
                  fsqrt.s      ft0, fa7
                  fcvt.s.w     ft11, s2, rtz
                  rem          t4, a6, s9
                  slli         ra, s6, 23
                  sra          t0, zero, zero
                  xor          t5, t6, t0
                  fcvt.wu.s    s3, ft8, rtz
                  fdiv.s       fs6, ft3, fs5, rdn
                  remu         t1, a7, t6
                  and          a2, s8, t1
                  andi         s7, sp, -1687
                  div          s7, s2, s4
                  slli         s5, t3, 1
                  fsgnj.s      fa3, fa2, fa2
                  mul          zero, t1, t5
                  sra          s10, s9, t4
                  divu         s9, s6, s2
                  fclass.s     a5, fs11
                  add          s11, a3, t6
                  sub          a6, s1, s6
                  xori         a6, s0, 1014
                  fsgnj.s      fs9, fs3, ft11
                  div          s11, s1, a5
                  div          tp, sp, ra
                  auipc        a1, 495244
                  fclass.s     s11, fs9
                  fmul.s       ft5, ft9, fs3
                  fsqrt.s      fs3, fs7
                  srai         s5, t1, 17
                  fcvt.wu.s    s9, ft3, rtz
                  slti         a3, s2, 352
                  slt          s11, s3, t6
                  fmv.x.w      t4, fs2
                  fsgnjn.s     fs10, fa0, fa4
                  slt          t4, a1, t3
                  remu         s1, a1, a5
                  mul          tp, t2, a6
                  fcvt.s.w     ft4, s9
                  fcvt.wu.s    s8, ft1
                  slt          t0, a2, s11
                  sub          a1, t4, t5
                  srai         s5, zero, 4
                  fsgnj.s      ft8, fs0, ft8
                  feq.s        s3, fs9, fa2
                  fmax.s       fs4, ft8, ft10
                  slti         a4, ra, -1050
                  fadd.s       ft9, fs8, fa3
                  mulh         s8, s11, a2
                  fle.s        sp, ft11, fa6
                  mul          s11, t6, sp
                  fmv.w.x      fa6, t6
                  xori         a5, ra, -839
                  lui          a7, 722386
                  fmv.x.w      s7, fa4
                  flt.s        a1, fs2, ft2
                  fle.s        t2, fs1, fs7
                  divu         t5, s10, a7
                  lui          t0, 743409
                  xori         a4, s4, 1314
                  fmax.s       fs1, fs10, fs7
                  srli         t5, a4, 9
                  lui          s11, 1046441
                  fcvt.wu.s    s0, ft7
                  remu         gp, s0, sp
                  fclass.s     s7, fa2
                  mulh         s5, zero, a6
                  mul          s6, t1, a2
                  sltiu        s5, s5, 1591
                  feq.s        t5, fs11, ft4
                  fcvt.w.s     zero, fs1, rtz
                  mul          t2, t2, tp
                  mulhu        t2, a6, a6
                  remu         s0, t1, t0
                  fclass.s     s3, fs10
                  and          a5, t2, a3
                  rem          zero, a7, a5
                  xori         t6, t6, 187
                  fcvt.s.w     fs11, s5, rtz
                  xor          t0, s10, s11
                  sltu         s10, t2, s7
                  or           gp, s11, s3
                  fmv.w.x      ft2, ra
                  mul          t6, t4, t3
                  fle.s        a1, fa4, fs6
                  fsub.s       ft4, fa7, ft2
                  mulhsu       gp, a5, t4
                  fsub.s       fs4, ft4, fs11
                  flt.s        s11, ft4, fs6
                  div          s11, sp, zero
                  srl          t6, a1, a1
                  sltiu        s9, sp, -625
                  srli         a5, tp, 9
                  divu         gp, s11, tp
                  fcvt.w.s     s10, fs1, rtz
                  slli         s10, s11, 31
                  srli         s8, s0, 10
                  xor          s5, s8, t1
                  fle.s        a3, ft10, fs2
                  srai         ra, s0, 7
                  fclass.s     sp, fa5
                  feq.s        a6, fa4, ft8
                  andi         sp, a4, -1043
                  addi         ra, t6, 1085
                  divu         a4, s7, s0
                  fsqrt.s      fs8, ft8, rmm
                  fadd.s       fa6, fa4, fs9
                  feq.s        tp, ft5, ft0
                  fsgnj.s      ft4, ft5, ft8
                  add          a4, a4, s5
                  srl          tp, t6, sp
                  auipc        s10, 983790
                  fcvt.s.wu    ft2, s2, rdn
                  xori         t5, s1, 1185
                  fsgnj.s      fa3, fa3, ft6
                  or           s9, t2, t6
                  ori          a6, s4, 323
                  slt          a3, s7, a0
                  mulhsu       s6, s5, s3
                  flt.s        sp, ft5, ft5
                  xori         t2, a1, 602
                  auipc        s7, 1040090
                  remu         a2, a2, t3
                  fcvt.w.s     s8, fa1, rup
                  fsgnjx.s     fs5, fs8, ft2
                  fsub.s       fs9, fs5, fs11, rmm
                  lui          gp, 522419
                  div          a2, s2, s6
                  fcvt.wu.s    sp, ft0, rtz
                  fmv.w.x      ft8, t6
                  lui          tp, 737509
                  mul          zero, a1, ra
                  fcvt.s.wu    fa0, a4, rmm
                  and          t6, a2, t2
                  slt          s9, s2, sp
                  and          s9, s2, a4
                  fle.s        s10, ft4, fs5
                  slt          t4, a6, t4
                  slli         ra, a2, 1
                  fcvt.s.wu    ft3, a3
                  and          ra, t4, a0
                  fmax.s       ft4, ft3, fs7
                  fsqrt.s      ft8, ft9
                  fsgnj.s      fa7, ft2, fa5
                  srli         a2, a0, 25
                  fmv.x.w      zero, fa1
                  fle.s        ra, ft7, fs7
                  fcvt.w.s     s3, fs6
                  srai         t5, t5, 7
                  fsgnjx.s     fs3, fs11, fs10
                  mulh         s10, tp, s4
                  fmv.x.w      s8, fa0
                  sra          a1, s10, s8
                  xori         a2, s5, 474
                  fsub.s       fs1, fa7, ft2, rne
                  fcvt.wu.s    t3, fs3, rne
                  xor          gp, t2, t2
                  fsgnjx.s     ft2, ft5, fa4
                  or           s3, s3, tp
                  fsgnjn.s     ft0, fa1, fa1
                  and          gp, t0, s10
                  srli         s0, zero, 7
                  slti         a4, s6, -894
                  mulhu        s8, zero, a6
                  fsgnj.s      fa6, ft3, ft8
                  srl          s9, a2, tp
                  and          t3, a6, a7
                  div          s3, s10, s11
                  fdiv.s       fa5, fs11, fs4
                  andi         s6, t6, 1751
                  flt.s        sp, fs11, fs11
                  fsgnjx.s     fs8, ft6, fa1
                  fsgnj.s      ft0, fs2, fs9
                  fsgnj.s      fs10, fa4, fa0
                  fsgnjn.s     ft7, ft8, fs3
                  fmax.s       ft9, fs7, fa6
                  sltu         a5, s7, tp
                  srl          t3, s7, s10
                  add          a2, s7, s7
                  fcvt.s.w     fs3, s8
                  fsgnj.s      fs7, fs1, fs2
                  srai         t5, a2, 15
                  andi         gp, ra, 1503
                  fcvt.s.w     ft5, zero
                  or           a5, s3, s7
                  fadd.s       fs3, fs10, fs3, rne
                  xori         a3, s0, 1648
                  div          t6, a5, a0
                  fadd.s       fa2, ft0, fs5, rup
                  div          a2, t4, s10
                  mulhsu       a5, ra, t2
                  slti         tp, s1, 1762
                  fmin.s       fs9, ft11, ft4
                  srl          t1, s1, a4
                  addi         tp, s2, 1125
                  nop
                  fcvt.w.s     zero, fa5
                  fsgnjx.s     fs7, fa3, ft2
                  rem          a7, a7, s8
                  fsgnjx.s     fs2, fs0, fs0
                  fsub.s       ft10, fa1, ft9
                  nop
                  slt          t3, sp, tp
                  remu         tp, a0, a3
                  fclass.s     s5, fa5
                  mul          s11, s6, t0
                  srl          s5, zero, a6
                  fmax.s       ft4, ft6, fa0
                  sub          s9, s6, s7
                  fclass.s     t5, fs8
                  xor          t5, s10, a5
                  fdiv.s       fa7, fa7, fs6, rne
                  fsgnj.s      fa2, fs11, fs4
                  rem          s9, a7, a1
                  fmv.w.x      fa0, s10
                  fmul.s       fs5, fs9, fa6
                  fsgnjx.s     fs4, fa2, fa1
                  srai         t5, s6, 12
                  remu         s1, s6, tp
                  fmin.s       ft7, ft3, ft7
                  sll          a4, s7, gp
                  fsgnjn.s     ft1, fa7, fs11
                  mul          a1, s5, s2
                  fmin.s       ft9, fs2, ft7
                  xori         a3, s5, 46
                  remu         t3, t6, ra
                  fmin.s       ft1, ft8, fs6
                  fsgnjn.s     fs8, ft1, ft8
                  fcvt.s.wu    ft0, t6, rtz
                  divu         a3, a3, a5
                  and          s1, s2, t5
                  fdiv.s       fs4, fa5, ft3, rup
                  ori          t6, s9, 237
                  fsgnjn.s     ft9, ft6, fs1
                  fcvt.wu.s    t1, ft2
                  srai         t5, s5, 5
                  mul          s8, t1, s3
                  srl          s0, t1, sp
                  xori         ra, t6, 852
                  add          t0, s2, t4
                  addi         t5, t2, -1181
                  fmax.s       fa3, ft9, fa5
                  fcvt.wu.s    s7, ft7
                  fsgnjx.s     fs0, ft2, fa2
                  mul          a5, t1, t3
                  fmv.x.w      s6, fa1
                  flt.s        s0, ft8, ft3
                  andi         s3, a0, 1468
                  fmv.w.x      fs0, a2
                  auipc        s5, 44040
                  fcvt.wu.s    s8, fs6
                  fsgnj.s      fs1, ft11, ft4
                  or           t4, s4, t4
                  slti         s10, s0, 1331
                  srai         tp, t1, 0
                  fsgnjn.s     fs1, fa3, fs8
                  xori         t5, a5, -1362
                  fcvt.s.w     fs11, t0
                  mulhu        s1, s0, s3
                  mulh         s10, s2, a6
                  sll          s9, t1, a6
                  fmax.s       ft10, fa5, ft4
                  fsgnjn.s     ft6, fa5, fs7
                  fmin.s       fs10, fa3, ft0
                  slli         a3, t6, 10
                  fcvt.s.wu    fa3, ra
                  srai         zero, s2, 6
                  add          t0, sp, s5
                  fsgnj.s      fs1, ft7, fa6
                  fmax.s       fs9, fa7, fa0
                  andi         gp, s7, 1188
                  fmin.s       fs5, fa5, ft6
                  remu         s0, a1, s3
                  fmin.s       ft2, ft10, ft1
                  add          s5, a5, a2
                  rem          a3, s9, t2
                  ori          s3, a7, 1281
                  or           ra, t2, s3
                  fsqrt.s      fa5, fa1, rne
                  slti         s6, s10, -797
                  fmv.x.w      t6, fs10
                  xor          a1, s2, s3
                  feq.s        t6, fa3, fs1
                  sltiu        s3, a6, 1209
                  fsgnj.s      fs1, fs6, ft9
                  div          zero, s4, a7
                  fadd.s       ft2, ft8, fs6, rmm
                  fsub.s       ft0, fs3, fa2, rtz
                  fcvt.s.wu    ft7, s5
                  sra          gp, s7, t2
                  or           s10, t6, t2
                  andi         t3, a7, -1600
                  fmv.w.x      fa5, t6
                  fsgnjn.s     fs8, ft1, ft0
                  and          t6, s8, t3
                  rem          t4, s0, s4
                  add          tp, s2, sp
                  ori          t0, s2, -319
                  feq.s        s9, fa4, fa5
                  srai         s10, a5, 24
                  sltiu        s3, t1, 887
                  xori         t4, tp, -200
                  slli         s8, t4, 14
                  remu         zero, s5, gp
                  xor          a4, s5, s6
                  fclass.s     ra, ft10
                  feq.s        t5, fs1, fa1
                  fmv.w.x      ft6, t6
                  divu         a3, a4, a6
                  mulhsu       a1, t3, tp
                  slti         s5, a2, -569
                  mulhu        ra, t0, s6
                  fsgnj.s      fa2, fs1, fs9
                  add          s8, t2, t5
                  feq.s        t5, fs11, fa5
                  andi         s0, gp, 105
                  flt.s        a2, ft10, fs0
                  fsub.s       fs6, ft1, ft2
                  sub          ra, a0, gp
                  fsub.s       ft7, fs2, fa2, rne
                  fmv.w.x      fa7, s9
                  fcvt.s.wu    ft9, t1, rtz
                  fadd.s       fs8, ft8, fa0, rmm
                  sll          a1, a4, a5
                  fcvt.s.w     ft7, ra
                  feq.s        t3, ft9, fs3
                  xori         tp, a7, -676
                  fmax.s       ft3, fs0, fa6
                  srli         t4, zero, 28
                  addi         a4, a7, 1143
                  sll          t2, a3, t2
                  add          s9, s7, a7
                  sltiu        a5, t0, -739
                  or           t1, a4, s0
                  srai         zero, tp, 21
                  flt.s        t2, ft5, ft2
                  fadd.s       fs11, fs2, fs10
                  fmv.w.x      fs7, t1
                  sra          s1, s11, t2
                  nop
                  fmin.s       ft3, ft8, fs7
                  fsub.s       fs0, ft6, fs6, rup
                  div          ra, a2, a6
                  rem          a5, a0, a4
                  fsgnj.s      ft1, ft5, fa0
                  fsgnjx.s     fa4, fa5, ft7
                  flt.s        a2, fs6, fa4
                  fsgnjn.s     fs7, fs10, fa3
                  fcvt.w.s     a6, ft4
                  sra          s8, s0, a0
                  and          t6, s11, a6
                  slli         a7, s4, 25
                  nop
                  slti         s7, tp, -352
                  feq.s        s3, fs1, fs4
                  addi         a2, a1, 821
                  fsgnjn.s     ft0, fa2, ft2
                  mulh         s8, s11, a4
                  addi         a4, a0, 43
                  sra          s8, t1, s1
                  fcvt.s.w     fs6, a3, rne
                  srl          sp, a3, a5
                  slti         t4, s1, 312
                  and          s9, a1, a1
                  fcvt.wu.s    zero, fs3, rtz
                  fsub.s       fa7, ft5, fs10, rup
                  slt          gp, a1, sp
                  fcvt.s.wu    fs6, s8
                  sltu         sp, zero, t4
                  remu         s1, a5, a0
                  fsqrt.s      fs4, fa4, rne
                  fmv.x.w      s6, fs7
                  feq.s        t6, fs6, fs0
                  sub          s3, t0, t3
                  mulhu        t3, s10, a1
                  sub          tp, s0, t0
                  flt.s        t0, ft1, fs10
                  lui          a7, 169543
                  rem          s0, s2, a4
                  feq.s        s1, fs6, fs10
                  sra          t0, t1, a2
                  flt.s        a5, ft7, fs10
                  srai         a6, s0, 22
                  fcvt.w.s     t0, fs8, rne
                  mulhu        s3, s4, s10
                  fcvt.w.s     t1, ft7
                  fcvt.wu.s    t0, fs8, rdn
                  sub          s0, s1, tp
                  fmul.s       fa4, ft10, fs4, rne
                  remu         t0, t4, a0
                  fadd.s       fs4, ft3, fs1
                  srl          s3, s1, s8
                  fcvt.s.wu    ft11, s1, rdn
                  fsgnj.s      fa2, ft2, fa6
                  lui          a7, 737951
                  fclass.s     t0, fa1
                  srai         s3, a7, 7
                  flt.s        t1, ft3, ft9
                  fle.s        gp, ft11, fa2
                  fdiv.s       ft4, fa7, ft11
                  add          s9, s4, t5
                  fsqrt.s      fa3, fs9, rdn
                  sltu         a4, t1, s8
                  and          t4, s0, a0
                  flt.s        s9, fs3, fs11
                  ori          s3, s6, -526
                  mulhu        s8, t4, sp
                  addi         t2, s1, -1364
                  srl          s9, sp, sp
                  sra          s8, s6, gp
                  mulhsu       a5, t3, a5
                  slli         t0, a2, 22
                  auipc        a7, 823317
                  andi         s8, gp, 508
                  mulh         a6, a7, s0
                  fmin.s       fs11, ft8, fa0
                  srl          a6, gp, tp
                  fcvt.wu.s    s10, fs7
                  fmul.s       fa0, fs2, fa0, rtz
                  fcvt.w.s     t1, fa6, rup
                  add          s11, s2, t1
                  slli         a7, t0, 7
                  fsgnjn.s     fs5, fs5, fs7
                  remu         gp, s7, t1
                  andi         s1, s6, -1884
                  srai         s6, a0, 31
                  fle.s        s10, fs6, fs1
                  mulhsu       ra, t4, s3
                  fclass.s     s6, ft4
                  xori         a2, s10, -1846
                  auipc        s0, 467766
                  divu         s3, s0, s8
                  lui          a6, 390980
                  fmax.s       fs5, fs3, ft1
                  fsgnjn.s     fa3, ft1, fs1
                  slt          t4, s11, s5
                  andi         s0, s1, 219
                  mulhu        s5, a7, s0
                  sll          gp, t1, s8
                  add          ra, t6, s8
                  fmul.s       ft8, ft2, fa1, rmm
                  remu         s10, t5, gp
                  fsgnjx.s     fs9, ft7, fs8
                  div          t6, a4, t4
                  fmv.w.x      ft1, s2
                  lui          s11, 403328
                  remu         t6, s0, s9
                  add          a2, s8, s1
                  andi         s6, s3, 735
                  fle.s        s7, fa5, fa7
                  fdiv.s       fs7, fa7, ft0, rdn
                  or           tp, tp, a7
                  mulhsu       gp, s11, t2
                  fcvt.w.s     t1, fs8
                  fmax.s       fa5, fs8, fa1
                  ori          s6, a3, 678
                  mulhu        a7, t4, zero
                  flt.s        a3, fa4, fa7
                  srl          a6, a4, gp
                  rem          t2, zero, sp
                  fsqrt.s      fs4, fa1, rne
                  fsgnjx.s     fs7, fs4, ft3
                  srai         zero, a7, 0
                  mulhu        sp, t6, a3
                  mulh         a1, s3, s4
                  fdiv.s       ft1, fs11, ft6
                  rem          s3, tp, s4
                  fsqrt.s      fs3, ft1
                  sra          a3, t0, a4
                  fmin.s       fa6, fa3, fs4
                  nop
                  fclass.s     t1, fs4
                  rem          t4, a3, s5
                  add          s8, tp, s1
                  ori          t3, a6, -1421
                  add          s7, a6, a7
                  add          t1, tp, t5
                  fcvt.s.wu    ft8, a6
                  slti         a6, s2, -1436
                  mulh         a2, s1, s6
                  fle.s        t6, ft0, fs8
                  fmv.w.x      ft4, s4
                  fmax.s       fa2, ft1, fs9
                  fsgnjx.s     fa0, ft6, fa3
                  sra          a6, a6, a7
                  and          s10, s2, t6
                  fcvt.s.wu    ft5, s11, rne
                  feq.s        a7, fa3, ft3
                  div          a5, s2, s1
                  fcvt.s.wu    ft10, sp
                  fcvt.s.w     fa0, t2, rtz
                  mulhu        t6, tp, s4
                  and          t5, s7, s8
                  srli         sp, s8, 16
                  fsgnj.s      fs8, fs11, ft9
                  slt          s6, ra, sp
                  andi         s10, a3, -1227
                  mulhu        t3, sp, s9
                  fsgnj.s      ft11, fa2, fa1
                  feq.s        s0, ft1, fs3
                  fsub.s       ft2, ft7, ft4, rup
                  fsgnj.s      ft7, fs2, ft7
                  feq.s        a1, fs0, fs8
                  mulh         s10, t6, t3
                  fsgnj.s      fs1, fa7, ft6
                  div          a2, a5, t5
                  divu         s7, t1, a4
                  sra          sp, zero, tp
                  fmv.w.x      ft6, s6
                  rem          ra, s2, t5
                  and          t2, t3, a2
                  xori         sp, t1, 366
                  fclass.s     s1, fs4
                  xori         gp, s8, 641
                  sltu         a7, t2, s7
                  or           t0, s0, zero
                  auipc        a1, 958232
                  fmv.w.x      fs10, s8
                  sub          a7, a5, a7
                  fsgnjn.s     fa1, ft0, fs10
                  fcvt.w.s     a4, fs2, rdn
                  srl          zero, s1, t0
                  srli         t2, t2, 1
                  mul          s8, s3, a7
                  ori          gp, a2, 849
                  slti         a7, ra, 716
                  add          t0, gp, tp
                  xori         s6, sp, -852
                  fmax.s       ft7, fa0, ft7
                  lui          s11, 9342
                  fclass.s     t4, fa3
                  fmv.w.x      ft4, t3
                  mulhu        s5, s0, a0
                  or           s3, gp, a6
                  and          a3, s0, a2
                  xor          t1, a1, a0
                  srai         tp, tp, 9
                  add          ra, sp, a4
                  fdiv.s       fa0, fs1, fs0, rmm
                  fclass.s     t3, fs4
                  feq.s        t0, fa5, fa5
                  divu         tp, s4, a6
                  fsub.s       fa4, ft8, fa3
                  flt.s        a3, fa1, ft3
                  srl          ra, a1, s4
                  xori         t4, s5, -699
                  fadd.s       ft6, fs2, ft2
                  fcvt.s.wu    fa7, a0
                  fle.s        s6, ft3, fs1
                  addi         s8, a4, 772
                  fsgnjn.s     ft0, ft6, ft1
                  rem          s0, zero, s2
                  slt          s5, t4, a1
                  add          t3, t3, s6
                  remu         s1, t4, a3
                  auipc        a6, 744908
                  fcvt.wu.s    tp, fa0, rtz
                  fcvt.s.wu    ft1, gp, rtz
                  slt          s5, a0, gp
                  mulhsu       s1, t5, t4
                  add          s3, a5, a2
                  sub          s7, s8, tp
                  and          t1, s5, s1
                  sltiu        s1, s5, 1544
                  fmax.s       fa0, ft11, fs7
                  sll          s11, s8, t3
                  rem          gp, s5, a6
                  auipc        s1, 912959
                  slli         gp, s7, 31
                  mulh         s8, s5, t1
                  fle.s        t5, fs0, fs6
                  fdiv.s       fs7, ft6, fa2
                  srli         s7, s6, 14
                  or           a3, ra, s8
                  fmv.x.w      t4, ft10
                  ori          t6, a2, -893
                  or           t6, s11, a2
                  fcvt.s.w     ft3, a6
                  mulh         a3, tp, s6
                  fmv.w.x      fs3, s2
                  mulhsu       a1, sp, s4
                  sll          s3, s4, zero
                  fmv.w.x      fs8, sp
                  srai         a5, sp, 2
                  slt          s3, zero, t5
                  xori         a4, a0, -31
                  xor          a4, t6, a2
                  sltiu        t3, s4, -1455
                  slli         t4, s7, 14
                  fsqrt.s      fs4, fs8
                  mul          a6, s9, a7
                  sll          s0, s8, t4
                  fmul.s       ft1, ft1, fs5, rtz
                  flt.s        t2, fa4, ft0
                  fmax.s       fa2, ft5, fs8
                  xori         a1, t0, 1661
                  fclass.s     s5, fs6
                  fmax.s       ft2, fs9, fs5
                  fmin.s       fs10, fs2, fs1
                  fadd.s       fs3, fa2, fa7, rup
                  sra          tp, s6, s2
                  xor          a5, sp, gp
                  div          sp, a6, a5
                  xor          zero, ra, s2
                  fmax.s       ft1, ft2, fs4
                  fmul.s       ft3, ft5, fa7, rmm
                  fsgnjx.s     fs9, ft11, ft5
                  divu         s9, s0, s6
                  andi         sp, s1, -304
                  addi         s8, s3, -1874
                  sub          tp, s3, t6
                  feq.s        a3, fa7, fa0
                  fsub.s       fs7, fa3, fs7, rup
                  sub          ra, tp, t2
                  fdiv.s       fs2, ft4, fa3
                  andi         a2, s9, 905
                  fadd.s       fa6, ft11, fs8, rup
                  srli         a2, tp, 30
                  mulh         s9, a7, s7
                  sltu         s5, gp, s9
                  remu         s11, tp, t6
                  fsgnjn.s     fs4, ft7, fs8
                  fsgnj.s      ft7, fs2, fs8
                  slti         s10, a0, 1084
                  sltiu        zero, sp, -1225
                  flt.s        s0, ft11, ft2
                  auipc        s1, 206130
                  addi         s3, t2, 573
                  xor          a1, s10, t2
                  fcvt.s.w     fs7, zero
                  rem          a4, zero, tp
                  fmv.x.w      tp, fs4
                  fmul.s       fs8, ft1, fs0, rmm
                  srai         a7, s8, 14
                  divu         ra, a4, tp
                  remu         a7, s0, s3
                  fmv.x.w      s6, fs1
                  divu         a3, s9, s4
                  slt          a1, zero, s6
                  fclass.s     a6, fs0
                  fcvt.s.wu    fs10, s9, rmm
                  fcvt.s.w     ft10, s11, rne
                  flt.s        s8, ft10, fa0
                  ori          t5, t3, 734
                  ori          s3, a2, 1675
                  fadd.s       fa7, ft4, fs4
                  fmv.w.x      ft5, a7
                  add          s5, t1, s3
                  fmax.s       ft4, fs0, fa5
                  sra          s11, gp, ra
                  auipc        s1, 868671
                  mulhsu       s7, a2, s3
                  fsgnjn.s     fa6, ft10, fs5
                  fsgnj.s      fs10, fs4, fa5
                  fmul.s       ft9, fa3, fa2, rdn
                  ori          t5, a5, -1793
                  fmax.s       ft0, ft10, fs8
                  sub          s11, s6, s11
                  fcvt.s.wu    ft8, s1, rtz
                  fsgnjx.s     fa4, fa3, ft7
                  sub          a6, s4, a1
                  div          t4, a0, s10
                  sltiu        t3, t1, 220
                  sub          t1, s10, a0
                  slti         s9, s1, 1585
                  remu         sp, a5, s5
                  ori          t0, s2, 1950
                  feq.s        t6, fa4, fs4
                  fsgnj.s      ft7, fs8, fs7
                  sra          t4, t3, t0
                  fle.s        t2, ft3, ft0
                  mulhu        s1, t1, s6
                  fsub.s       fs1, fs5, ft8, rup
                  fmin.s       fs9, ft9, fa1
                  mulhu        ra, s0, s0
                  fsgnj.s      fs10, ft5, fs5
                  sltu         tp, t2, t0
                  flt.s        t0, ft5, ft6
                  fsgnjn.s     ft11, fa7, ft10
                  lui          sp, 464848
                  auipc        a5, 155771
                  ori          s11, a6, 602
                  fcvt.s.wu    fa1, a7
                  flt.s        a7, fs8, fs1
                  rem          a6, s7, t2
                  slt          a3, t0, t4
                  fsgnj.s      fa5, fa3, ft9
                  fcvt.s.wu    fs1, ra, rup
                  slt          t0, s2, a0
                  fmv.x.w      s7, fs7
                  fdiv.s       fs3, ft6, ft7, rmm
                  sltu         t4, s6, t1
                  slli         s7, ra, 27
                  andi         a1, sp, -507
                  xori         s3, s11, 2034
                  add          gp, sp, ra
                  fcvt.wu.s    s0, fs3, rtz
                  remu         a3, s7, a5
                  sltu         t5, a2, s10
                  andi         a7, sp, 1531
                  fmv.x.w      t5, fa3
                  or           t4, a4, a5
                  fcvt.s.wu    ft0, a7, rup
                  fsqrt.s      fs4, fa4
                  add          a2, a0, s10
                  slt          a7, a4, s1
                  flt.s        s6, fs10, ft4
                  feq.s        sp, ft9, fa0
                  sltiu        a5, ra, 989
                  sra          t1, s9, s10
                  nop
                  andi         a6, s11, 21
                  fmin.s       ft4, ft0, fs1
                  fcvt.s.w     fa7, s0
                  slli         t4, s5, 17
                  mul          a2, a5, a7
                  fmax.s       ft6, fa5, fa0
                  fcvt.w.s     a2, fs0, rmm
                  fmul.s       ft4, fa7, ft5, rdn
                  feq.s        t2, fs3, fa0
                  sub          s9, ra, s2
                  fmv.x.w      t2, fs5
                  feq.s        s6, ft10, ft6
                  srli         s9, s10, 30
                  add          t4, a3, s4
                  fle.s        s8, fs6, fs3
                  fcvt.s.w     fs2, a6
                  remu         a4, a4, t1
                  mulh         t5, a4, t6
                  slt          zero, t1, sp
                  add          s3, s4, t2
                  mulhsu       a7, s5, t4
                  sra          t2, a5, a7
                  mulh         t4, s0, s2
                  fmul.s       fa1, fa4, ft10, rtz
                  and          t3, gp, s4
                  sltu         s10, zero, t3
                  fmax.s       fs8, fs4, fs10
                  add          t1, zero, sp
                  mulhu        gp, t4, s1
                  ori          s5, s6, -979
                  fsub.s       fs3, ft11, fs11
                  fsub.s       ft6, fa0, ft1, rtz
                  fdiv.s       ft8, fa5, fs10, rne
                  fsub.s       ft6, fs11, fa4
                  fcvt.s.wu    fa7, t6, rdn
                  add          t2, t0, a6
                  fmin.s       fs9, fs3, ft1
                  fmv.x.w      t0, ft7
                  mul          a5, a6, a5
                  fcvt.s.wu    fa1, t0
                  ori          ra, t4, 1676
                  mulhu        a3, t6, a0
                  fcvt.wu.s    a3, ft10
                  rem          t1, s5, ra
                  srai         t2, t4, 20
                  mulh         a1, gp, s5
                  sll          sp, tp, a4
                  fsgnjn.s     fs9, ft2, fa5
                  sltiu        a1, a5, -866
                  sltiu        s10, a3, -39
                  sub          t3, s1, s10
                  srli         a2, t6, 23
                  rem          t1, s10, s5
                  fcvt.s.wu    ft11, sp, rtz
                  addi         a7, sp, 1069
                  mul          a5, s4, tp
                  sll          zero, tp, s4
                  fadd.s       fs8, fa0, fs10
                  ori          t3, a7, -1185
                  fle.s        a7, ft11, ft2
                  fsqrt.s      ft8, fa7, rdn
                  sll          t2, a5, a5
                  sltu         s0, s6, t3
                  div          zero, ra, s9
                  mulhu        a3, a3, a4
                  fcvt.s.wu    fa5, s5, rne
                  fsgnjx.s     ft1, ft5, ft2
                  fcvt.s.w     fs0, a2
                  lui          tp, 472613
                  lui          s5, 325188
                  div          s11, s11, s0
                  fsgnjx.s     ft11, fs7, ft5
                  add          t6, s7, a7
                  sll          ra, sp, s1
                  xori         a7, a2, 618
                  mul          s5, s8, a1
                  or           s1, zero, zero
                  mul          a1, s7, s2
                  mulh         a2, sp, s8
                  xori         t5, t2, 156
                  fmv.x.w      s5, fs6
                  and          s9, a0, a7
                  divu         a5, a0, s9
                  xor          sp, a4, t3
                  and          t6, a4, s0
                  fcvt.s.wu    fa3, a2, rdn
                  fmv.w.x      fs3, zero
                  sub          t1, t6, s10
                  andi         s6, a1, -816
                  mulhsu       a7, s2, tp
                  and          s0, t2, t1
                  fsqrt.s      ft5, ft0, rup
                  fsgnjx.s     fa6, fa3, ft5
                  xori         a6, s9, 2014
                  fmul.s       fa2, ft0, ft9, rne
                  fcvt.w.s     zero, ft11
                  nop
                  fcvt.wu.s    t4, ft7
                  mulhsu       t2, gp, a0
                  lui          s0, 380338
                  div          gp, tp, a4
                  fcvt.wu.s    s0, fa4
                  divu         a6, t5, s4
                  sub          t5, a5, s8
                  div          t0, t6, t4
                  slt          t0, a7, a2
                  fmul.s       ft11, fs5, ft8
                  fcvt.s.wu    fa5, s1
                  fsqrt.s      fa2, fs1, rmm
                  nop
                  slli         a3, s2, 5
                  srl          s11, a4, s8
                  fadd.s       ft9, ft0, fs7
                  fmv.w.x      ft5, s8
                  fsqrt.s      ft10, fs7, rtz
                  sll          t3, s1, a1
                  rem          a4, t6, s4
                  fcvt.w.s     t6, fa7
                  mul          t6, s6, s9
                  andi         ra, t1, 1913
                  fmv.x.w      a7, fs9
                  slt          gp, t2, a4
                  fsub.s       ft11, ft3, ft3, rdn
                  fsub.s       fs1, ft6, ft5, rne
                  xor          s10, s2, a0
                  or           t2, a0, s10
                  nop
                  fmax.s       fa6, ft7, fs10
                  nop
                  slti         a5, a5, 1842
                  sll          zero, gp, a3
                  mulhsu       t2, s8, t1
                  add          t3, a6, s3
                  slt          s6, zero, s0
                  fmv.w.x      ft8, gp
                  fmul.s       fa7, fa6, ft6
                  andi         a3, t2, -654
                  andi         s9, t3, -1631
                  xori         t1, t1, -1068
                  fle.s        s7, fa6, fs8
                  slti         gp, t2, -200
                  div          s8, a6, a7
                  fsgnjx.s     ft3, fa4, ft1
                  slti         a7, a4, 1475
                  remu         t5, a7, a0
                  fsub.s       ft1, fs2, fa0
                  add          s6, a3, s4
                  fcvt.s.w     ft1, zero
                  flt.s        t4, fs0, ft10
                  addi         tp, s10, 830
                  fcvt.wu.s    gp, fa6
                  sra          a3, s5, s5
                  fsgnjn.s     ft7, ft1, fa7
                  divu         s5, s9, ra
                  srl          tp, tp, t6
                  fcvt.wu.s    s6, ft2
                  mul          s11, sp, s4
                  add          t2, s7, t0
                  mul          s7, s6, a0
                  srai         a7, a0, 31
                  xori         s3, a4, 1784
                  fmv.x.w      a5, ft10
                  lui          t5, 847502
                  mul          a2, s6, a3
                  ori          a6, tp, -117
                  srli         s3, tp, 24
                  fsgnjn.s     fs2, fa4, ft1
                  or           a1, t5, s0
                  addi         s10, a3, 1109
                  div          a7, a3, t3
                  ori          t1, a1, -1617
                  fmv.x.w      s3, fs8
                  fmv.w.x      ft7, t2
                  or           a4, zero, tp
                  srli         ra, a4, 24
                  fsgnj.s      ft4, fs4, fs4
                  srai         s5, t4, 9
                  fsgnj.s      ft3, ft6, ft4
                  fmv.w.x      fa6, sp
                  fmv.x.w      a7, fs6
                  sll          zero, s5, s6
                  slt          t6, a6, t6
                  fsgnjn.s     fa0, fs2, ft5
                  ori          ra, s1, 509
                  fcvt.s.w     fa6, s0
                  mulh         a3, a4, t3
                  fcvt.wu.s    s11, fa3, rmm
                  srl          a1, s2, s7
                  sra          tp, t5, t2
                  fmv.w.x      ft4, s1
                  sltu         s1, s3, t1
                  fcvt.s.w     fa5, t6
                  srai         a2, t3, 28
                  and          t0, s7, s10
                  lui          zero, 766568
                  fadd.s       ft2, fs0, fs6
                  fcvt.w.s     a4, fs9
                  fsgnj.s      fa0, ft6, fs11
                  fsgnjx.s     fa1, fa4, fs2
                  fclass.s     s9, fs8
                  remu         a2, a0, s7
                  fsub.s       ft7, fs0, fa1
                  flt.s        s9, fa4, fs3
                  and          s3, s4, a7
                  or           t0, a6, s2
                  srl          s1, t6, t5
                  fmv.x.w      a3, ft0
                  mulhsu       zero, s10, a2
                  ori          s6, t5, -349
                  lui          a5, 217393
                  srli         a1, t1, 22
                  add          t0, t6, s4
                  xori         a5, s6, 486
                  fmv.w.x      fs6, t2
                  flt.s        s9, fs4, fs1
                  or           s3, t0, s10
                  feq.s        a7, fa4, fa7
                  mulh         zero, s6, s8
                  xori         s10, s5, 1608
                  slli         t2, a5, 11
                  ori          s5, a5, -1019
                  srai         s1, s3, 21
                  flt.s        s5, fs11, fs6
                  rem          ra, a1, a6
                  fmv.x.w      a3, fa7
                  fcvt.wu.s    t0, ft5
                  fcvt.s.wu    ft7, a0, rdn
                  slli         a4, s5, 25
                  sltu         t5, s4, gp
                  srli         a5, a2, 3
                  andi         a2, zero, 1928
                  fcvt.wu.s    tp, fs8
                  xori         t6, s11, -1408
                  mulh         a2, s2, gp
                  remu         a3, s1, a2
                  slt          a5, a6, t5
                  fmul.s       fa3, ft1, fs8
                  ori          t2, s8, -738
                  fsgnjn.s     ft1, ft5, ft10
                  fmin.s       ft11, ft5, ft7
                  fsub.s       ft8, ft10, ft9
                  srli         s3, a4, 24
                  fmin.s       ft10, ft11, fs7
                  add          t4, t4, t5
                  srli         s11, s4, 11
                  div          sp, t4, a2
                  lui          sp, 504133
                  fcvt.w.s     t0, fa1
                  fcvt.s.wu    fs2, a0, rdn
                  sltu         a6, a4, s8
                  nop
                  feq.s        zero, ft9, ft9
                  fmax.s       fa5, fs1, fa2
                  sll          t0, t0, t3
                  div          a7, a5, gp
                  slt          s11, t4, a5
                  fmv.w.x      ft9, sp
                  srai         t2, s10, 6
                  slli         a1, s11, 2
                  fsqrt.s      ft6, fs3, rdn
                  and          s3, s2, a4
                  fclass.s     t2, fa1
                  srl          t1, s2, s7
                  fcvt.s.wu    fa0, t6
                  sltiu        s3, a5, -1190
                  fadd.s       fs9, fa6, fa6
                  srai         zero, s6, 23
                  lui          a7, 71967
                  sll          a2, t2, tp
                  fcvt.wu.s    sp, fa6
                  slti         s7, t1, -456
                  fdiv.s       fs1, fa6, fs1, rmm
                  fcvt.s.wu    fa3, s7
                  xori         t5, ra, 804
                  ori          t0, s6, 1324
                  fle.s        tp, fa6, fa2
                  sltu         s1, t4, t1
                  srli         t0, zero, 18
                  mulhsu       s10, s5, tp
                  fdiv.s       fs3, ft10, fs9, rup
                  and          t4, t2, t1
                  fmul.s       ft2, fs8, fs8, rne
                  mulhsu       tp, s6, s4
                  srai         t6, s3, 0
                  srli         s8, t2, 24
                  feq.s        a2, fs9, ft0
                  slt          s6, t5, a7
                  sra          gp, tp, s4
                  andi         sp, a6, 365
                  fsgnj.s      ft4, ft11, fa2
                  xor          ra, a7, a5
                  srli         a3, zero, 4
                  fmv.w.x      fa3, t6
                  nop
                  auipc        s0, 908382
                  srli         s9, zero, 23
                  addi         s9, s9, -1702
                  fmax.s       ft8, fa6, fs2
                  slli         s9, zero, 13
                  slt          t2, t6, a1
                  ori          t6, t5, -416
                  andi         a6, t4, 625
                  fsgnjx.s     ft2, fa0, fs3
                  xor          s5, t3, s7
                  xori         a5, s5, 1490
                  sll          t4, zero, s4
                  div          s7, zero, zero
                  fsgnjn.s     fs1, ft9, fa5
                  srli         s0, gp, 3
                  fsub.s       ft11, fs6, ft3, rtz
                  fmul.s       ft10, ft0, ft9
                  slti         t3, ra, -602
                  xori         s1, ra, -471
                  fsgnj.s      fs4, fa1, fa1
                  fcvt.wu.s    a3, ft9, rtz
                  fclass.s     s8, ft10
                  div          a1, a7, ra
                  fsgnjn.s     fs7, fa1, ft5
                  rem          s9, a3, sp
                  remu         tp, s7, a4
                  feq.s        zero, ft9, fa2
                  srai         s3, s7, 16
                  slti         a6, t1, -1039
                  sltu         s5, a2, a6
                  sub          s10, a5, s3
                  xori         s11, s7, -113
                  and          ra, a3, t2
                  addi         a6, s8, -571
                  add          s1, s3, t5
                  sltu         zero, s0, ra
                  mulhu        s1, a7, a3
                  fmul.s       fa5, fs3, fs10, rne
                  divu         s8, a4, t5
                  fmin.s       fs8, fa5, fs0
                  srl          s9, t5, a1
                  mul          a6, s1, s3
                  fdiv.s       fa0, ft3, fa5
                  slti         a1, s8, -354
                  fsqrt.s      fa7, fs2, rmm
                  mulhu        s11, s9, s6
                  lui          a7, 1043919
                  add          t0, t4, gp
                  slli         a2, tp, 19
                  srli         a3, a7, 20
                  slli         ra, s8, 2
                  xor          s8, gp, tp
                  or           s0, a1, t2
                  lui          t3, 557585
                  sra          zero, a0, t1
                  fsgnjx.s     fa5, fs9, fa1
                  mulhu        s7, s1, s2
                  or           s0, t1, s4
                  andi         a7, s11, 988
                  fcvt.wu.s    a4, fs8
                  addi         ra, a3, -1489
                  fcvt.wu.s    a1, ft8
                  mulhu        a2, t6, t3
                  fcvt.s.wu    ft9, s2, rup
                  mulhu        a4, s2, a2
                  fsub.s       fs9, ft1, ft6
                  fmv.w.x      fs1, s5
                  fdiv.s       ft11, fs5, fs6
                  auipc        t6, 1023748
                  sll          a1, a6, s11
                  fmv.x.w      a2, ft5
                  fmv.x.w      s7, fs2
                  fcvt.s.wu    fs6, s6
                  andi         gp, s3, -1653
                  divu         t5, t2, s8
                  remu         s7, a3, t1
                  rem          tp, tp, a7
                  lui          zero, 157161
                  andi         s10, s10, -1085
                  mulh         t1, s4, s9
                  fdiv.s       fs8, fs7, fs5, rmm
                  fcvt.wu.s    ra, fs10
                  lui          ra, 321243
                  add          a3, a0, t1
                  mulh         s8, a0, tp
                  xori         t1, a4, 1984
                  divu         a5, s0, a6
                  nop
                  ori          a1, s2, 1843
                  mulh         gp, s3, a5
                  mulhsu       s5, s11, t6
                  fcvt.s.w     ft8, a7
                  mulhsu       s0, a3, a1
                  fmax.s       ft11, fs0, ft8
                  fsub.s       ft9, ft2, fa3
                  fmul.s       ft8, fs0, ft1, rdn
                  fsgnjx.s     ft1, fs9, ft3
                  and          zero, a5, a2
                  sltiu        sp, ra, -542
                  fsgnj.s      fa4, ft8, fa0
                  slli         t1, a2, 18
                  fle.s        a6, fs3, fa5
                  fsub.s       ft11, ft4, fs6, rmm
                  mulh         s9, a2, a5
                  feq.s        sp, ft11, fa2
                  fsgnjx.s     fs4, fa4, fa5
                  mulhsu       t3, s3, t6
                  sra          a7, t4, t6
                  mulh         a5, s8, a5
                  auipc        t4, 706832
                  fcvt.s.w     fs2, t2
                  fsub.s       fa3, fs8, fa5
                  srl          sp, t5, s0
                  divu         a7, a4, a6
                  fcvt.s.wu    fs10, a4
                  sra          s3, t4, t5
                  fclass.s     sp, ft1
                  slli         t3, gp, 0
                  slt          t2, t1, s9
                  fcvt.s.w     ft0, tp, rne
                  or           t6, a7, t0
                  fmax.s       fa1, ft0, fs11
                  fcvt.s.wu    fa7, s8
                  slti         a4, s9, 919
                  or           gp, s9, s2
                  andi         a6, ra, -501
                  srai         t4, ra, 13
                  fle.s        t0, fs11, fa7
                  srli         a4, s5, 22
                  slt          tp, a6, a6
                  fmin.s       fs2, fs6, fa3
                  rem          zero, s9, t4
                  slti         tp, s1, 1206
                  remu         s11, s1, a5
                  slt          a3, s5, s1
                  ori          t0, a1, -321
                  or           a6, s2, zero
                  srl          s9, sp, a3
                  flt.s        t2, ft6, fa4
                  fsgnjn.s     fs3, fs2, fs1
                  fcvt.s.w     ft10, s4, rup
                  fdiv.s       fs5, fs10, fa1
                  rem          s1, tp, t2
                  remu         s6, t2, a4
                  feq.s        a7, fa1, ft10
                  fmax.s       ft6, ft0, fs5
                  flt.s        t6, fs4, fs2
                  xori         s10, sp, 820
                  and          t4, a1, a4
                  and          a1, a2, s3
                  fmv.w.x      ft4, a1
                  fmv.x.w      t1, fa5
                  fclass.s     t0, fa5
                  srai         s6, a1, 21
                  auipc        t1, 540147
                  fadd.s       fs1, ft4, ft1, rtz
                  fcvt.w.s     zero, fs8, rtz
                  slli         ra, a6, 10
                  sub          zero, a2, a7
                  addi         t3, t6, -393
                  mulhu        s0, s6, a4
                  or           s10, gp, t6
                  slti         a3, t4, -267
                  fmv.x.w      s0, ft3
                  add          a7, t5, a7
                  mul          a7, a4, s0
                  fmax.s       ft8, fs9, ft9
                  srli         a2, ra, 15
                  sltiu        t1, zero, 1154
                  fsgnjx.s     ft0, fs2, fs2
                  slt          s6, a6, sp
                  fcvt.s.wu    ft9, t1, rne
                  fcvt.s.wu    ft4, s8
                  fsqrt.s      ft11, fa4, rtz
                  auipc        a7, 107590
                  nop
                  fcvt.w.s     s8, ft7
                  addi         t0, ra, 1131
                  fmv.w.x      fs0, t3
                  xori         t4, a3, 156
                  fadd.s       ft3, ft9, fs1
                  fdiv.s       ft3, ft7, fa3, rmm
                  sltiu        t4, s10, -1244
                  nop
                  sub          t2, s8, s7
                  mulhsu       t3, a0, t4
                  fsgnjx.s     fs0, fs6, ft10
                  nop
                  sltiu        s11, a4, 499
                  fsgnj.s      fs4, fs2, ft8
                  or           s8, a3, t1
                  slti         s0, s8, -655
                  srl          s10, a3, tp
                  fle.s        t5, fs6, ft11
                  andi         t2, sp, 1683
                  nop
                  xor          a5, a2, s6
                  slti         s11, gp, -426
                  srl          t3, s4, a7
                  addi         t4, a7, -1842
                  xori         s9, ra, -895
                  sra          t5, t2, a1
                  divu         a3, a3, s9
                  sub          s7, s3, a2
                  sll          tp, t5, s10
                  fcvt.s.wu    ft5, t1
                  xori         s5, zero, 979
                  auipc        s0, 592240
                  fmv.x.w      a4, fa5
                  fsqrt.s      ft4, fs10, rne
                  mulhsu       t5, zero, a1
                  ori          a1, a7, -1835
                  auipc        zero, 973740
                  sll          a5, s11, s5
                  fcvt.w.s     t5, fs11, rdn
                  fmv.w.x      fs1, s3
                  srai         s3, a4, 26
                  mulh         t1, s9, sp
                  xor          s0, s5, s10
                  srai         a6, s6, 12
                  fsgnjx.s     ft7, fa4, fa7
                  mulhsu       ra, a3, s5
                  and          a4, ra, s3
                  sltiu        a2, tp, 998
                  fclass.s     a2, fs3
                  fsqrt.s      ft2, fa4, rne
                  sltiu        s11, t6, -918
                  nop
                  fmul.s       ft2, fa4, ft0
                  sub          t6, s5, s10
                  fsgnjx.s     fs0, fs5, fs8
                  or           a2, s1, s7
                  slt          t5, a2, t4
                  fcvt.s.wu    fs3, a7, rtz
                  sub          t4, t1, a3
                  fcvt.s.w     ft10, t1
                  fadd.s       ft9, fs4, ft1, rne
                  sll          s3, gp, t3
                  xor          a5, t5, gp
                  slli         tp, tp, 2
                  slli         a5, gp, 13
                  fcvt.wu.s    a5, fs2, rmm
                  fclass.s     t3, fs5
                  srai         a2, t0, 8
                  nop
                  auipc        a6, 966302
                  nop
                  sra          s3, s4, a1
                  sll          t3, s2, s11
                  lui          s7, 638252
                  sll          t2, zero, ra
                  sra          s7, sp, s9
                  nop
                  mulhsu       t3, a6, t1
                  mul          tp, a2, s8
                  or           s3, s0, a3
                  sub          a2, ra, t1
                  mulhsu       s10, gp, s6
                  fmv.w.x      ft2, t2
                  fsub.s       fs10, ft1, ft8, rdn
                  auipc        gp, 598607
                  fsub.s       fs4, ft3, ft5
                  sltu         t3, s1, gp
                  or           zero, s8, tp
                  sub          a1, s5, zero
                  fsqrt.s      fa7, fs2
                  mulh         a3, a6, t5
                  fadd.s       fs11, fs2, fa1, rtz
                  sll          a5, sp, ra
                  add          t2, s2, a5
                  fadd.s       fs0, ft6, fs6
                  fsgnjx.s     ft2, fa1, fa1
                  mulhsu       a7, s6, zero
                  mulhu        t3, s9, a0
                  fsgnjn.s     fa6, fa5, fs2
                  fsqrt.s      fa4, ft7
                  srl          s3, zero, t4
                  or           a3, sp, s1
                  sltiu        s5, s10, -1816
                  remu         s9, s8, s3
                  fsgnjn.s     fs5, fa6, fa6
                  sll          gp, s10, s9
                  remu         a1, gp, a5
                  rem          t0, t0, t1
                  mul          s5, sp, a3
                  fcvt.wu.s    s7, ft0
                  fmin.s       ft9, fa5, ft11
                  fclass.s     gp, ft9
                  slli         a1, s4, 1
                  fdiv.s       fa2, fa2, fs3
                  fsgnj.s      fa1, fs3, fs8
                  fadd.s       ft10, fa5, ft11
                  auipc        s0, 291577
                  divu         t1, s10, s10
                  slti         t3, s11, 377
                  sra          s11, s1, s3
                  mulhsu       t3, a6, a3
                  auipc        a2, 473735
                  fsgnjn.s     fa4, fs0, ft4
                  addi         t5, s1, 720
                  srl          t0, s8, s8
                  fsub.s       ft10, ft11, fa4, rmm
                  sltu         a6, tp, s3
                  fmul.s       fs7, fs8, fs8
                  and          s0, s0, s3
                  fadd.s       ft2, ft2, fa2, rdn
                  xor          t1, s2, s6
                  mulh         s1, s10, s11
                  div          t1, a6, s2
                  auipc        t2, 511733
                  rem          a4, sp, t2
                  sub          t2, s11, s2
                  or           ra, a4, a4
                  xori         ra, a6, 859
                  rem          a7, s4, s0
                  flt.s        s0, ft5, fa0
                  srl          t6, s1, tp
                  or           a2, a2, t3
                  andi         a7, a2, -1649
                  fsqrt.s      fs3, fs4, rdn
                  fcvt.s.w     fa6, t1, rmm
                  fsub.s       ft2, ft8, fs1, rdn
                  lui          a6, 272400
                  fsqrt.s      fs8, ft1, rne
                  auipc        a2, 46036
                  fmv.x.w      a5, fs9
                  fdiv.s       fs10, fa4, ft7
                  fmul.s       ft3, ft0, ft3
                  sltiu        a1, ra, 1771
                  slt          a1, s4, sp
                  ori          s9, s4, 2011
                  sll          s6, t4, sp
                  addi         sp, t5, -710
                  fcvt.s.w     fs3, a7
                  feq.s        ra, ft9, ft3
                  fsqrt.s      fs4, fs6, rup
                  fcvt.s.w     fs5, s0, rdn
                  fsqrt.s      fs10, fs3
                  sltiu        s11, t6, -1380
                  slli         s6, t5, 4
                  srli         t6, s0, 29
                  fsgnj.s      ft7, fs1, ft6
                  auipc        s0, 738197
                  xor          a7, a5, s11
                  sltu         s7, s4, t6
                  sub          s11, a5, a0
                  add          zero, s3, s0
                  srli         a3, a6, 21
                  and          zero, s5, ra
                  srai         a5, zero, 1
                  mulh         s5, a4, s5
                  fsgnj.s      fa3, ft4, fa5
                  fsub.s       fa7, fs5, fs1, rmm
                  slti         a2, t1, 600
                  xori         sp, a3, -167
                  fclass.s     zero, ft10
                  nop
                  sltiu        s10, a1, 1003
                  fsqrt.s      fs8, fa7, rtz
                  and          zero, tp, a4
                  sll          t6, gp, s3
                  addi         s10, s2, -859
                  divu         s0, s6, s10
                  fclass.s     t5, fs1
                  fsub.s       fa7, fa5, fa7, rmm
                  rem          a1, a3, t1
                  srai         a6, s2, 20
                  fle.s        tp, fs7, fa3
                  divu         a1, s2, s3
                  fmul.s       fa3, fs1, ft5, rup
                  mul          t5, s6, s6
                  or           a6, s7, sp
                  fsqrt.s      ft9, fa1, rmm
                  add          t6, gp, t3
                  sltiu        t4, s6, -261
                  rem          t0, t5, a1
                  fcvt.w.s     a4, ft5, rdn
                  mulhu        s9, sp, a0
                  flt.s        zero, ft2, fa0
                  mul          t6, a7, a0
                  or           a4, a3, a2
                  addi         t1, s2, -300
                  lui          a7, 711965
                  feq.s        t2, fs2, fa7
                  fsub.s       fa5, fs9, ft10, rup
                  mulhsu       a4, s6, gp
                  srl          ra, t2, s9
                  flt.s        ra, ft4, ft2
                  sll          s9, s9, tp
                  and          a6, zero, s4
                  srli         t1, a2, 11
                  fmin.s       fs9, fs1, fa4
                  addi         ra, s9, -584
                  fadd.s       fa6, fs4, ft10
                  andi         a1, gp, -769
                  mulh         a3, s4, s3
                  fmax.s       fs10, fs10, ft3
                  fmv.x.w      a3, ft4
                  andi         a4, a0, -962
                  sll          a2, a0, gp
                  ori          s5, s6, -1331
                  fsub.s       fs1, fs8, fa6
                  fmv.x.w      t3, fs9
                  fsub.s       fa5, ft5, fs5, rdn
                  fle.s        t3, fs1, ft0
                  fcvt.s.w     fa4, zero, rdn
                  nop
                  xori         t3, a4, 1502
                  slt          gp, s5, ra
                  sltiu        s8, t4, -1476
                  xor          a3, a5, s11
                  fsub.s       fs6, fa7, fa1, rmm
                  fsgnjx.s     fa1, fs2, fs8
                  remu         sp, a3, t4
                  rem          sp, ra, a3
                  slli         s3, t0, 16
                  fcvt.s.w     fs9, s10, rdn
                  sll          a1, s1, t0
                  xor          t1, sp, s11
                  fle.s        ra, ft11, fs8
                  srai         s10, a4, 25
                  xori         t5, t6, 535
                  remu         t5, zero, s5
                  mulhsu       sp, t1, t0
                  sll          s8, s7, tp
                  fsgnjn.s     fs3, fa5, fa1
                  rem          t6, ra, a6
                  fcvt.s.w     fa0, t4
                  mulhu        s1, s7, t5
                  and          t1, a1, zero
                  and          t6, t0, zero
                  fsgnjx.s     fa0, fs3, fs10
                  sub          t4, s0, s1
                  div          tp, t2, s2
                  fcvt.w.s     zero, ft7
                  flt.s        s0, ft10, ft8
                  fcvt.s.wu    ft4, s2, rup
                  xor          t3, t3, gp
                  and          s8, s6, t1
                  sll          t1, s11, t5
                  fsgnjn.s     fs4, fs2, fa4
                  fmv.w.x      fs8, s1
                  fsgnjx.s     fs4, fa7, fs6
                  sltu         s0, gp, s0
                  lui          s5, 591618
                  fcvt.w.s     s9, fa6
                  flt.s        t0, ft9, ft9
                  srl          a6, a2, t5
                  or           a2, gp, s3
                  andi         a3, t3, -1603
                  auipc        t4, 608784
                  fmv.x.w      a7, fa4
                  fmul.s       fs2, fs2, fs1
                  sub          t6, s2, s1
                  mul          t0, s1, s3
                  sub          t0, t2, t3
                  nop
                  fsqrt.s      ft6, fs4, rmm
                  srli         gp, s10, 8
                  fcvt.w.s     t3, fa7, rmm
                  fmin.s       fa5, ft7, fa1
                  flt.s        s11, fs3, fs1
                  div          tp, t0, t5
                  rem          s8, s8, a6
                  and          a7, zero, gp
                  fmin.s       fa4, ft0, fs11
                  slt          s1, a5, t2
                  sltu         zero, ra, a1
                  xor          a2, s10, s3
                  fsqrt.s      fa5, fa4
                  div          s8, t5, t4
                  fsqrt.s      ft4, fa4
                  fcvt.s.wu    fs8, a0, rtz
                  sra          t5, a0, t0
                  fcvt.wu.s    s3, fs5
                  xor          gp, t5, t4
                  fclass.s     ra, fa6
                  mul          t0, s2, a0
                  lui          a4, 567757
                  fsqrt.s      ft9, ft11, rtz
                  or           s1, s9, a6
                  addi         s5, zero, -585
                  divu         s10, a4, tp
                  srl          s5, s0, s5
                  fmul.s       ft0, fs8, ft0
                  feq.s        ra, fs9, fs5
                  fsqrt.s      fa4, fa1, rtz
                  fcvt.s.wu    fa3, t4
                  xori         s9, t0, -1809
                  srl          a6, gp, gp
                  sll          a7, tp, s10
                  remu         a4, tp, t0
                  fclass.s     t3, fs10
                  fsgnjn.s     ft6, fs10, ft0
                  lui          t3, 482834
                  andi         a1, tp, -1693
                  fmul.s       ft4, fs4, fa1
                  slt          t0, t4, s4
                  slli         s0, a7, 29
                  mul          s8, s4, a3
                  fle.s        s5, ft8, fa1
                  fsgnjx.s     ft6, fa1, fa4
                  fcvt.s.wu    fa3, s9, rne
                  fclass.s     s1, ft4
                  sra          a4, t6, a6
                  fdiv.s       fs6, fs9, fs0, rdn
                  fmin.s       fa7, fa4, fs9
                  flt.s        a6, ft0, fa0
                  nop
                  add          t2, a0, a3
                  auipc        a3, 516083
                  sll          s9, t2, a5
                  srli         s11, a4, 20
                  ori          a2, s0, -511
                  sra          t0, zero, sp
                  andi         s0, a3, -980
                  slli         zero, s4, 17
                  fadd.s       ft2, fs1, fa1, rdn
                  fdiv.s       ft11, fa6, fa6
                  fdiv.s       ft2, ft8, fs10
                  mul          s0, s6, zero
                  addi         a3, t1, -989
                  srl          t6, a2, s9
                  fmul.s       ft11, ft10, fs11
                  mul          t1, tp, tp
                  fadd.s       fs9, fs2, fs5
                  fmax.s       fa5, fa7, fs10
                  mulh         s1, s1, a6
                  add          t2, t1, s7
                  and          a3, a7, a6
                  fmv.x.w      s11, ft0
                  nop
                  srl          tp, t2, s8
                  addi         t0, s3, -627
                  xor          t6, a0, s1
                  fsgnjn.s     fa1, fs11, ft11
                  fmin.s       ft4, ft11, ft4
                  fsgnjx.s     ft3, fs3, ft5
                  srl          t4, s4, t2
                  fdiv.s       fs1, ft0, ft6, rtz
                  add          s7, a7, a3
                  auipc        t4, 311802
                  and          s1, gp, s8
                  xori         t5, s8, -166
                  sra          s9, t5, t2
                  fmax.s       ft3, ft3, ft3
                  slt          a7, t5, a5
                  mul          t2, a5, s10
                  mulh         t4, a3, t4
                  ori          ra, s11, -1503
                  flt.s        a1, fa5, fs11
                  fsqrt.s      ft8, fs0
                  slli         a5, a4, 19
                  lui          s0, 574543
                  fsqrt.s      ft1, fs8, rtz
                  fmv.x.w      s5, fa1
                  auipc        tp, 381408
                  sub          s10, s0, t0
                  ori          a3, s11, -1645
                  srli         t0, a2, 7
                  remu         zero, a0, s10
                  fmin.s       fs9, fa2, ft8
                  xor          a1, t4, t3
                  sltiu        s0, s3, -1340
                  fsqrt.s      fs6, fa3, rtz
                  mulh         t2, gp, a7
                  and          t0, s0, s8
                  fcvt.s.w     fa3, t2, rdn
                  fclass.s     t5, fs8
                  slt          s6, t4, s4
                  sltu         s11, s5, t0
                  fsgnjx.s     fs10, ft8, ft11
                  addi         gp, s10, -1219
                  mulh         a5, a6, s1
                  fsgnjx.s     ft1, ft0, fa7
                  fmax.s       fs8, fs4, fs2
                  fadd.s       fa3, fs9, fa5
                  fmul.s       ft11, fs6, ft1
                  xori         t1, s8, 1337
                  fsgnjn.s     fa0, fa2, ft2
                  fle.s        s6, fa0, fs1
                  fdiv.s       fs6, fa1, fs9, rup
                  mulhsu       a3, s1, a2
                  sltu         s6, s3, a4
                  srai         s11, a5, 15
                  lui          s8, 301646
                  fsgnjx.s     fa7, fs7, ft0
                  fsgnjx.s     ft0, ft5, ft3
                  fmul.s       ft11, fa1, fs4
                  or           t2, s11, s3
                  mul          ra, a5, s3
                  xori         s5, a0, 1687
                  and          ra, t0, s1
                  xori         s0, s0, 75
                  ori          s8, a0, -1800
                  or           a6, a5, a4
                  xori         a5, s10, -908
                  divu         t2, s5, t6
                  div          gp, s10, s1
                  xori         a7, t2, -984
                  addi         s1, a0, -425
                  fadd.s       fa7, ft2, ft3, rup
                  remu         s8, zero, sp
                  fmv.w.x      ft2, s1
                  add          sp, s1, s6
                  slt          s10, s1, t2
                  or           a1, s9, t4
                  ori          a7, t3, -1537
                  mulhsu       t5, s11, s2
                  divu         s1, ra, a0
                  fsgnj.s      fa1, fs7, fs10
                  sltiu        t0, a4, -1999
                  sltu         a5, a4, s5
                  add          a5, s0, a2
                  rem          t2, s9, s1
                  or           a6, s10, a5
                  fsgnjx.s     ft5, fa2, fa5
                  fcvt.wu.s    a3, fa0, rne
                  srai         a5, zero, 6
                  mulhsu       s8, a1, t0
                  fclass.s     zero, fs4
                  fclass.s     s8, fa7
                  auipc        s10, 752386
                  divu         a4, t6, s9
                  fdiv.s       fa1, fa7, fa1, rdn
                  remu         s7, a2, a0
                  slti         s7, t1, -398
                  fsgnjn.s     fa6, ft2, ft5
                  srli         a4, a1, 24
                  fadd.s       fa0, ft9, ft11
                  mulhu        s3, s4, s4
                  divu         s9, s7, s11
                  fmax.s       fs8, ft5, ft8
                  sltu         gp, t0, a6
                  ori          s8, s6, -1058
                  srli         a4, s10, 0
                  auipc        a4, 756387
                  fmin.s       fs4, fs11, fs7
                  mulhsu       s1, zero, s4
                  addi         s1, a7, -1478
                  sra          t5, t5, a7
                  rem          t2, s6, a1
                  sub          a3, t6, s8
                  fle.s        t6, fs4, fs3
                  fmax.s       fs1, ft3, fs6
                  div          s11, a4, t1
                  fle.s        t0, fs8, fs2
                  fcvt.w.s     a6, ft7
                  divu         t3, zero, s6
                  slli         a6, s11, 27
                  xor          s6, t3, sp
                  divu         s9, t5, a2
                  slt          s1, s1, a2
                  fmv.x.w      t0, ft7
                  add          a7, s10, s2
                  feq.s        s1, fs2, fs11
                  nop
                  sltu         t5, s10, tp
                  fsgnj.s      fs9, fa5, fa6
                  feq.s        a5, ft3, fs5
                  div          s8, s5, ra
                  fcvt.s.wu    ft1, a5, rmm
                  fcvt.s.w     fs7, s6, rup
                  srl          t6, a7, t5
                  fmv.w.x      fs3, s7
                  slt          gp, a4, t2
                  xori         t4, s7, 185
                  nop
                  fcvt.wu.s    t2, fa3
                  fclass.s     sp, fa4
                  mulhu        t0, s6, s0
                  feq.s        tp, fs9, fa2
                  fsgnj.s      fs2, ft4, fa7
                  fsqrt.s      ft1, fa3
                  fcvt.s.w     fa3, a4, rup
                  fsub.s       fs6, ft8, ft8, rdn
                  fmv.x.w      sp, fs8
                  fsqrt.s      fa7, fs6
                  fsub.s       fa1, fa4, ft10, rne
                  rem          t1, a3, s2
                  fcvt.s.wu    fa4, a7, rne
                  addi         a1, gp, 814
                  fcvt.s.wu    ft3, s2
                  or           s8, a0, s2
                  divu         sp, a6, t4
                  mulhsu       s11, s9, ra
                  fmul.s       ft5, ft2, ft9
                  andi         t2, gp, -412
                  srl          s0, t4, a0
                  xor          t5, s8, t2
                  addi         s1, s2, 1768
                  sll          t4, a1, s9
                  fclass.s     t3, fs9
                  flt.s        sp, ft3, ft9
                  fmv.x.w      s7, ft0
                  fcvt.wu.s    s6, fs3, rne
                  andi         t2, ra, -1892
                  fclass.s     zero, fs8
                  addi         s7, a7, 1935
                  mul          s7, a0, a7
                  mulh         a6, s3, gp
                  fadd.s       ft9, ft10, ft0
                  add          tp, tp, gp
                  fdiv.s       fs6, ft0, fs2
                  add          a4, s5, s8
                  fmv.x.w      a7, ft11
                  srai         zero, t2, 28
                  addi         ra, s5, 1039
                  feq.s        t2, fs3, ft7
                  divu         t5, t1, a5
                  rem          s10, s5, a5
                  fdiv.s       fa7, fs2, ft0, rmm
                  srai         a2, t1, 4
                  fadd.s       ft3, fs3, fs1
                  mulhsu       s8, t5, a2
                  flt.s        t0, fs5, fs2
                  rem          s1, t1, s5
                  fdiv.s       ft7, fs6, fa4, rne
                  fmv.x.w      a5, ft7
                  fmin.s       ft11, fa6, fs4
                  fdiv.s       fa7, fs3, fs11
                  feq.s        zero, ft4, ft11
                  fcvt.w.s     a1, ft4
                  sra          a7, s4, a6
                  flt.s        a3, ft2, fa3
                  sll          t6, a0, t1
                  nop
                  fsgnjn.s     fa5, fs5, fs9
                  ori          s5, t2, -1948
                  fcvt.s.w     ft0, zero
                  fsgnjx.s     ft11, fa1, fa4
                  fdiv.s       fs6, fs3, fs7
                  fmin.s       fa0, fs11, fs1
                  fdiv.s       fs5, ft3, fs1
                  fcvt.s.wu    fs10, a1
                  slti         t6, s1, 1735
                  sub          a6, s9, a5
                  sll          t2, a6, s8
                  sltu         s6, a5, a2
                  srai         a2, s10, 20
                  fsgnjn.s     fa5, fs1, fs0
                  fmv.x.w      s3, ft0
                  nop
                  or           s5, s5, sp
                  div          t5, s11, a0
                  xori         s1, s7, 1119
                  fsub.s       ft8, fs4, fs2
                  fmul.s       ft0, fa6, fa1, rup
                  sll          a6, s6, s2
                  divu         s10, s9, a5
                  sltu         s3, s1, s1
                  slli         t4, t2, 11
                  add          s0, a3, t4
                  fsqrt.s      fs7, fs3
                  mulh         t2, s9, s4
                  ori          tp, gp, -212
                  fsgnj.s      ft2, fa2, fs4
                  auipc        t0, 284110
                  fcvt.s.wu    fa1, s9, rtz
                  flt.s        t1, ft11, fs4
                  sra          ra, zero, sp
                  fcvt.s.w     fa0, a7
                  ori          a5, a2, 38
                  mulh         s5, t4, t0
                  sltiu        a1, a6, -2042
                  mul          a4, t6, t0
                  fmin.s       ft0, fs2, fa7
                  ori          s7, a0, 1447
                  fcvt.s.w     fs2, a6, rmm
                  rem          s8, t1, t4
                  srai         gp, s11, 24
                  fsgnjn.s     fa1, fs3, fs3
                  flt.s        a6, ft8, ft10
                  slti         s5, s4, 1508
                  nop
                  fcvt.w.s     a3, fs6, rdn
                  fsgnjn.s     fa4, fs5, ft1
                  nop
                  or           t5, s11, a7
                  fclass.s     t2, fa0
                  fdiv.s       ft2, ft0, fa0
                  fsqrt.s      ft5, fs3, rup
                  mul          a5, t4, s1
                  sra          s7, t5, a2
                  fsgnj.s      fa0, fa2, ft4
                  mulhsu       zero, s0, s6
                  fcvt.w.s     s7, fs1
                  mul          s5, sp, a4
                  fmul.s       fs6, fs7, fs11, rne
                  auipc        a3, 525198
                  fclass.s     tp, fs4
                  mulhu        a4, t5, s7
                  fcvt.wu.s    s9, ft11, rdn
                  xori         s11, a4, -913
                  sltiu        s5, t3, -1257
                  fdiv.s       ft9, fa3, fa6, rtz
                  fcvt.s.wu    fa5, s2
                  remu         s9, s4, t4
                  srli         a4, s0, 14
                  fsgnj.s      ft11, fa7, fs1
                  mulhu        t5, sp, t5
                  lui          gp, 829720
                  fmin.s       fs10, fa7, fs7
                  fcvt.w.s     s11, fa6
                  fadd.s       fa4, ft3, fs10
                  divu         a5, a6, a7
                  fmax.s       fa0, fa5, fs6
                  fmul.s       fa2, fa6, ft5
                  fadd.s       ft8, fa5, ft7
                  slt          s0, s4, t2
                  feq.s        s0, ft5, fs4
                  addi         sp, s5, -1594
                  fmin.s       fs10, fs6, ft11
                  sltu         s0, zero, a2
                  fcvt.s.w     fs9, s10, rmm
                  fmul.s       ft1, fa0, fs11, rmm
                  flt.s        t6, fs4, ft5
                  fsgnjn.s     fs3, ft3, ft0
                  mulh         a6, a7, s11
                  fcvt.s.wu    ft5, s5, rup
                  fmul.s       fa3, ft11, fs6
                  fmul.s       ft1, fa1, fs4
                  rem          a2, s4, sp
                  add          s1, a2, a5
                  fle.s        t2, fa0, ft1
                  mulhu        s10, s2, s9
                  fle.s        t6, ft7, fs5
                  xor          t5, t2, t1
                  and          t3, a2, s4
                  fle.s        t5, ft2, fs9
                  fcvt.w.s     zero, fa4, rne
                  slt          sp, tp, t2
                  mulh         t0, ra, tp
                  remu         ra, zero, s10
                  remu         t0, tp, s9
                  srli         a7, a5, 12
                  ori          t5, s4, -952
                  srai         a7, s5, 13
                  srai         s0, a1, 25
                  sltiu        a5, s0, 857
                  fmv.x.w      a2, fs8
                  lui          s0, 839288
                  srai         s6, s6, 8
                  divu         t1, tp, s6
                  flt.s        t4, fs6, ft6
                  srli         s3, s5, 6
                  fsgnjn.s     ft9, fs7, fs7
                  fmv.w.x      fs1, t4
                  fmax.s       fa3, fa0, fa6
                  add          s5, t1, s10
                  xori         s6, t3, -146
                  andi         s10, t1, 118
                  remu         a3, ra, gp
                  fmin.s       ft11, fs7, fa2
                  sltu         t2, a0, gp
                  fsgnj.s      fa5, fs8, fs4
                  sra          a5, s9, a1
                  fsgnj.s      ft8, ft9, fs1
                  srl          s1, a0, zero
                  srli         s9, s3, 25
                  auipc        a6, 730249
                  fcvt.w.s     s8, fa4
                  fmax.s       ft6, fa6, fa1
                  fmax.s       fs11, fs6, ft11
                  fsqrt.s      ft10, fa0, rup
                  fmv.w.x      fs9, a4
                  mul          a4, ra, a7
                  div          s10, a5, t6
                  flt.s        a6, fs1, fs7
                  remu         s0, sp, t5
                  srli         s8, s9, 0
                  ori          a1, s0, 365
                  fmv.x.w      t3, fs0
                  or           t0, a2, zero
                  slti         t1, a4, -1481
                  remu         s3, s3, a6
                  fsgnj.s      ft8, fa1, fs10
                  slt          a6, a7, s5
                  rem          t6, s7, s9
                  sra          s10, t0, t4
                  or           t4, a7, a5
                  slti         gp, s0, -1091
                  sltu         s6, s9, s2
                  fmul.s       fs0, ft7, ft0, rne
                  fcvt.s.wu    fa3, t0, rdn
                  andi         gp, t0, -484
                  xor          s5, s10, s2
                  fsub.s       fs2, fa5, fs11, rup
                  slt          t1, s8, a0
                  fsgnjx.s     ft6, fs2, ft1
                  sra          s11, s5, a0
                  ori          a5, a6, -319
                  mulh         a4, t2, s5
                  feq.s        s11, fs11, fa1
                  sltiu        s8, s1, 1662
                  sltu         tp, s4, a6
                  fmv.w.x      ft1, t5
                  mulhu        s7, a3, s5
                  sra          a1, s4, s0
                  mulh         a7, a4, t0
                  add          a2, s3, a5
                  fcvt.wu.s    t2, ft0
                  fmax.s       fs6, ft0, fa2
                  andi         a7, s0, 1208
                  div          s7, s2, t3
                  mulh         a4, t6, a0
                  fmv.x.w      a4, fs11
                  div          ra, sp, s7
                  mul          s9, s4, a2
                  fclass.s     s3, ft5
                  srli         s8, s6, 3
                  and          s9, t3, s10
                  fadd.s       ft0, fa4, ft8, rdn
                  sra          a2, s11, s5
                  fsgnj.s      ft8, ft2, ft9
                  xor          tp, a5, t4
                  auipc        a7, 892541
                  sra          t4, t2, t5
                  addi         a4, tp, 316
                  rem          t2, s0, zero
                  addi         t1, ra, -1439
                  feq.s        a6, fs3, fa4
                  sra          sp, s6, s5
                  fsgnjx.s     ft3, ft4, fa0
                  fmax.s       fs10, fa3, fs6
                  fle.s        a2, ft1, fs2
                  add          a5, a2, a2
                  fmul.s       ft10, fa6, ft2
                  slti         a6, gp, 653
                  divu         s9, s8, t6
                  mulhsu       ra, t1, s3
                  fsqrt.s      ft4, ft8
                  fsgnjx.s     ft2, ft7, fs7
                  rem          t5, s9, t4
                  xori         a2, a3, 582
                  sub          a1, sp, t2
                  fmin.s       fs11, fs9, fs3
                  srli         zero, a5, 28
                  fmax.s       ft4, fa1, ft6
                  rem          s10, s4, a1
                  slt          t0, a0, t4
                  fsgnj.s      fa6, ft11, ft9
                  fmv.w.x      ft8, s4
                  slti         s11, s0, 725
                  fcvt.s.w     ft5, t1, rtz
                  xor          s0, t6, a2
                  fmv.w.x      ft10, t6
                  andi         ra, gp, 981
                  xori         s9, s7, -1472
                  fadd.s       fa4, fa2, fs5
                  fmin.s       ft11, fs4, fs8
                  fmin.s       fs9, fs10, fs8
                  fmv.w.x      ft1, t6
                  feq.s        s1, fs2, fa3
                  nop
                  fsgnjn.s     fa2, ft0, fa5
                  fdiv.s       ft11, fs5, fs3
                  fmul.s       fs3, fa5, fs8, rdn
                  andi         a1, a2, -325
                  srli         s7, t2, 9
                  fsgnj.s      fs0, ft11, fa7
                  srli         s3, sp, 10
                  mulhu        s6, s4, s3
                  mulh         s5, s6, a7
                  fmv.w.x      fa2, t2
                  slt          t3, a5, s6
                  divu         a1, a5, t2
                  srli         a1, t2, 19
                  fsgnj.s      ft11, ft2, fs11
                  divu         t2, s6, sp
                  slt          s6, t2, sp
                  or           a3, s5, t2
                  divu         a1, s9, a5
                  fcvt.wu.s    s3, fa3, rmm
                  auipc        a1, 467300
                  fadd.s       fs5, ft4, ft9, rtz
                  fclass.s     a6, fs4
                  and          t5, a1, zero
                  div          s3, s5, a5
                  slt          a6, t4, s2
                  fadd.s       fs0, fa4, ft1
                  fmv.w.x      ft3, s2
                  fdiv.s       fs6, ft9, fs7, rne
                  lui          ra, 613596
                  fmax.s       ft0, fs3, fa7
                  xor          a5, zero, a0
                  fmul.s       ft11, fs6, fs6, rdn
                  mulhu        a4, zero, s4
                  andi         zero, s11, -1436
                  fmv.w.x      ft11, s5
                  fmax.s       ft1, fa4, fs5
                  fsgnjn.s     fs2, fs5, fa3
                  remu         t1, t4, a2
                  sub          t6, s7, a0
                  auipc        t2, 390221
                  sra          s10, a0, s5
                  fmin.s       fs1, ft6, fs11
                  fmin.s       ft6, fs9, fs11
                  fcvt.w.s     t3, fa4
                  auipc        s10, 797573
                  slt          a3, s1, a2
                  andi         a3, s6, -589
                  ori          a5, a3, 187
                  rem          a6, t1, s7
                  fmv.x.w      t0, fa2
                  xori         sp, tp, 1426
                  sll          sp, a5, s4
                  fsgnjx.s     ft3, fa2, fa2
                  rem          a3, gp, a3
                  fmv.x.w      s3, fa2
                  fmax.s       ft0, fa1, fs6
                  fadd.s       fs5, fa1, ft4
                  flt.s        zero, fa7, fs1
                  sltu         a6, s2, sp
                  remu         t6, t6, sp
                  slli         s7, a6, 28
                  lui          a7, 280008
                  fcvt.s.w     fa2, t1
                  lui          tp, 22620
                  sra          s6, s9, a5
                  fmax.s       fa2, fa1, fs3
                  fsgnjn.s     fa1, fs5, ft9
                  nop
                  fclass.s     t4, fs11
                  fmv.w.x      fa3, sp
                  fcvt.s.w     ft4, s2
                  fsqrt.s      ft4, fs3, rup
                  andi         a5, t6, -1081
                  divu         gp, s4, a1
                  slti         s9, s5, 463
                  fsqrt.s      fs6, ft5
                  remu         a1, s0, t0
                  xor          s10, s3, s0
                  or           t1, s0, s7
                  andi         sp, a0, 1633
                  xor          a1, tp, s11
                  sub          ra, a3, s10
                  mul          t6, sp, t5
                  sra          tp, s3, s2
                  ori          sp, s3, 717
                  div          s1, t2, a3
                  lui          s7, 499134
                  srl          s10, a7, a1
                  nop
                  auipc        t3, 260450
                  sltu         zero, zero, s4
                  fsgnjx.s     fa2, ft0, fa2
                  srl          a6, s4, s5
                  fmax.s       fa2, ft10, fa1
                  feq.s        s8, fs2, fs8
                  mulh         a2, a0, s8
                  fcvt.s.wu    ft4, sp
                  fle.s        s8, ft4, ft9
                  lui          s8, 117405
                  ori          a6, s2, 521
                  sra          a1, zero, a6
                  or           t2, a7, a2
                  fmv.w.x      ft8, a7
                  andi         t0, s7, -1553
                  fle.s        a7, fs2, fa1
                  ori          a7, s4, -877
                  slli         a4, t2, 24
                  feq.s        t2, fs0, fs2
                  fcvt.wu.s    t6, fa0, rtz
                  add          ra, ra, t2
                  fmv.w.x      ft6, a3
                  remu         sp, a2, a1
                  fmin.s       fs7, ft2, fa7
                  remu         t2, gp, s9
                  sll          ra, tp, a7
                  flt.s        t5, ft10, fa0
                  ori          s3, a6, -1107
                  mulh         s8, a1, s2
                  fmv.w.x      fa0, s6
                  fle.s        s1, fs0, ft8
                  and          s7, ra, s6
                  srli         s7, s8, 19
                  fcvt.s.w     fs1, a2, rup
                  add          t6, t6, a1
                  fsgnjx.s     fa1, ft11, fa1
                  and          a4, s5, tp
                  slt          t3, s11, s11
                  ori          a1, s5, -436
                  or           t5, a0, a7
                  nop
                  fcvt.s.w     ft0, s9
                  sltiu        a3, s10, -386
                  fcvt.s.wu    ft0, s8, rmm
                  mul          a1, s4, s9
                  andi         a4, t1, -1543
                  fle.s        sp, ft6, ft7
                  fle.s        a7, fs4, fs9
                  mulh         s10, s4, ra
                  xor          t1, s10, s7
                  sll          t3, a5, t2
                  mulhsu       s3, ra, a0
                  fmul.s       ft11, fa3, fs9, rup
                  fmax.s       fs4, fs9, fs4
                  auipc        t5, 83211
                  srl          s8, t2, s10
                  or           a7, t3, t3
                  fadd.s       fa5, ft7, fa6
                  fdiv.s       fa5, fs0, ft8
                  nop
                  xor          t4, s7, s2
                  fsqrt.s      fa2, fa0
                  addi         tp, s6, -1928
                  fsgnjn.s     fs8, fs10, fa7
                  remu         tp, ra, t6
                  slt          ra, s5, tp
                  fcvt.wu.s    t6, fa6, rne
                  fle.s        tp, ft7, ft11
                  flt.s        ra, fs9, fs3
                  flt.s        t3, fs4, fs4
                  lui          t3, 1024673
                  add          t6, t0, ra
                  fcvt.w.s     t4, ft7, rup
                  fmv.x.w      a7, fa0
                  srl          a7, a7, a4
                  mulhu        a4, a0, s7
                  sll          a4, s8, t5
                  sub          t2, s11, s8
                  fmv.x.w      a3, fs7
                  xor          a7, a0, s2
                  fsqrt.s      fs7, fs2
                  slt          s9, a0, sp
                  slti         zero, s3, 1820
                  srli         t2, a4, 14
                  xori         t0, s11, -851
                  fmv.w.x      fa0, a0
                  fsub.s       fs8, ft8, ft2, rdn
                  or           t5, s0, a4
                  add          t4, a2, s4
                  ori          t2, t2, -766
                  fsgnj.s      fs2, ft3, fa5
                  fcvt.s.wu    ft1, a0, rmm
                  sltu         t2, tp, zero
                  srl          sp, t2, s3
                  fcvt.s.w     ft4, a7
                  andi         a2, a5, 244
                  fcvt.wu.s    s0, fa4
                  fcvt.wu.s    t4, fs6, rtz
                  mulh         t4, sp, sp
                  sltu         s9, s2, s9
                  mulhsu       s1, s5, a4
                  addi         s3, s1, 837
                  fcvt.wu.s    s3, fa3
                  fle.s        ra, fa4, fa0
                  fsgnj.s      fa4, fa6, ft8
                  srl          sp, t2, a0
                  fcvt.wu.s    a1, ft0, rup
                  fcvt.s.wu    fs4, a6, rmm
                  remu         sp, s10, s10
                  fsgnjn.s     fa7, fs5, ft8
                  fmax.s       fa1, fs11, fs0
                  feq.s        s7, fs1, fs11
                  feq.s        s10, fs4, ft2
                  fcvt.w.s     s1, ft11
                  fsqrt.s      fs9, fs0
                  slt          t4, t0, t0
                  sltiu        t6, s2, -579
                  srai         s9, s9, 22
                  fclass.s     s7, fs5
                  xori         ra, s7, 824
                  srl          t3, t5, s11
                  addi         a4, t2, -373
                  fcvt.s.w     fs9, t2, rtz
                  slt          s3, s1, a3
                  auipc        zero, 336142
                  sra          zero, a5, s4
                  or           tp, a5, t1
                  fmv.w.x      fa2, zero
                  remu         ra, a5, a4
                  remu         s10, s6, s2
                  add          gp, a3, a2
                  fsgnj.s      fs4, fa7, fa4
                  mulh         s9, t2, a1
                  remu         gp, t4, s11
                  fmin.s       fa5, ft4, ft11
                  fsgnjn.s     fs4, ft7, fa5
                  fadd.s       fa0, ft9, fa4
                  fmin.s       ft6, fs3, fs9
                  fcvt.wu.s    s7, ft6, rdn
                  divu         s5, t1, sp
                  divu         gp, s7, s10
                  sll          t5, s3, a6
                  nop
                  fsqrt.s      ft10, fa0
                  divu         ra, t3, t6
                  add          a2, s9, t2
                  fmul.s       ft3, ft2, ft6
                  auipc        s5, 817814
                  fsub.s       fa5, fs8, ft5
                  fmul.s       fs4, ft2, fa2
                  xor          a5, s5, s7
                  srl          s10, t3, sp
                  fcvt.s.w     ft10, s6
                  slt          s5, s2, s8
                  xor          sp, s4, ra
                  fcvt.s.wu    fs5, s4
                  nop
                  fcvt.w.s     a3, fa0, rup
                  sll          gp, a0, a0
                  fmul.s       fa0, fa7, ft3, rtz
                  sltiu        a3, a2, -829
                  auipc        s1, 955783
                  fmv.w.x      ft7, a2
                  fmv.x.w      s1, fs2
                  fmin.s       fs11, fs11, fa6
                  fcvt.w.s     tp, ft11
                  fcvt.s.w     fa6, a6
                  mulhu        t2, s11, t5
                  fcvt.s.w     ft2, s5
                  andi         a2, t2, 1344
                  rem          s3, s1, a6
                  xor          t6, s2, s7
                  fdiv.s       ft7, fs1, fs2, rne
                  fmv.w.x      fs9, s11
                  ori          tp, s7, -136
                  or           a5, s11, t2
                  sra          a7, s3, a7
                  fcvt.s.wu    fa6, tp
                  mulh         a7, ra, s0
                  srl          a5, a1, t5
                  feq.s        s10, fa7, fa4
                  sub          a4, s4, a0
                  add          s5, t6, a2
                  nop
                  fadd.s       fa4, fs5, fs9, rne
                  fle.s        t6, fs0, ft2
                  remu         s3, s6, sp
                  fmv.w.x      fa6, a3
                  xor          s1, tp, t4
                  fsgnjn.s     fa6, fa2, fa3
                  lui          t4, 331386
                  slti         gp, sp, -76
                  and          s9, a3, s10
                  mulhu        a4, s1, a5
                  fsqrt.s      fs5, ft10
                  div          s3, a1, a5
                  auipc        t1, 558226
                  mulh         s3, zero, t1
                  srli         a2, s7, 6
                  slt          a6, s1, t4
                  fclass.s     tp, ft7
                  srai         t5, a6, 6
                  divu         s6, ra, s1
                  flt.s        s1, ft0, fa1
                  fsub.s       fs2, ft7, fs3, rup
                  divu         s7, s0, a1
                  sll          s11, t1, s5
                  mulh         s5, s9, s2
                  fmin.s       ft10, fs6, fa1
                  fcvt.s.w     fs8, s4
                  fcvt.wu.s    a3, ft10, rup
                  addi         t6, a5, 513
                  srl          t4, a7, sp
                  or           s11, s10, s1
                  remu         gp, s0, s0
                  xor          a1, gp, t0
                  add          s8, a5, s6
                  and          s3, a3, s8
                  auipc        a1, 247908
                  fcvt.s.w     ft6, s2
                  and          s5, s0, gp
                  fmul.s       fs4, fs10, fs0
                  ori          s11, a3, 391
                  srl          s5, t0, a7
                  fclass.s     a1, fa2
                  sll          a7, s9, a6
                  sltiu        t4, s6, 1830
                  sltu         tp, a0, a0
                  sltu         a1, s0, sp
                  feq.s        s6, ft7, fs4
                  ori          ra, t2, -1514
                  andi         a7, t5, 1157
                  nop
                  sltu         s5, t5, s10
                  sra          ra, s3, s7
                  mulhsu       s6, tp, a2
                  fclass.s     a7, ft8
                  fmin.s       ft11, ft8, fa2
                  ori          s9, t2, -1810
                  lui          s5, 222965
                  fle.s        a2, fs5, fs9
                  add          a7, t6, a1
                  fcvt.wu.s    sp, fs6
                  sltu         a5, t5, s6
                  fmul.s       fa7, ft11, fs0
                  slti         a5, s6, -726
                  fmax.s       ft3, fs3, fs11
                  fsgnj.s      fs1, fs9, ft0
                  xori         gp, t5, -1812
                  fclass.s     a3, fa2
                  lui          s10, 349099
                  sltu         a3, s1, t3
                  mul          s0, a2, s9
                  fsub.s       fa0, fs4, fa6
                  lui          tp, 824947
                  fmv.w.x      fs3, gp
                  slt          a2, t5, s6
                  fsqrt.s      fa2, ft7, rne
                  div          t1, a1, ra
                  fmul.s       fa7, ft7, fs6, rtz
                  feq.s        sp, fs7, ft2
                  fclass.s     a6, fs10
                  fdiv.s       fs2, fa1, fs6
                  auipc        t5, 898521
                  auipc        t6, 620231
                  fmax.s       fa6, fs11, fs2
                  rem          s3, sp, s9
                  andi         s6, a1, -1791
                  or           a3, sp, t4
                  sub          a4, a5, a1
                  fmul.s       fa3, fa0, ft0
                  nop
                  fsub.s       fa3, fs11, ft8
                  fclass.s     s1, ft11
                  rem          gp, a7, s6
                  fcvt.w.s     s5, ft6
                  fsub.s       fa2, fs5, fa2
                  fcvt.s.w     fs5, sp
                  sub          t6, s11, a2
                  fsgnjn.s     fs3, ft5, ft8
                  flt.s        sp, ft2, fa4
                  fcvt.w.s     a7, fs0, rtz
                  fsgnjn.s     ft1, ft3, fs2
                  flt.s        a4, fa7, ft2
                  rem          zero, t0, a6
                  fmax.s       fs1, ft5, ft3
                  sltu         s10, s1, a3
                  fsgnjx.s     fa2, ft9, fs2
                  sra          s6, s6, s4
                  fle.s        s10, ft5, fa2
                  mul          t6, t3, a1
                  fmul.s       ft10, fa7, fa2, rtz
                  srli         s0, t2, 6
                  fcvt.wu.s    s11, fs6, rne
                  and          s8, s3, a2
                  fcvt.w.s     s3, fa4, rne
                  slt          a6, sp, gp
                  nop
                  fmv.x.w      s11, ft11
                  mulhsu       sp, a2, s6
                  fmax.s       ft7, fs6, fa4
                  srai         a4, t5, 7
                  mulh         s6, a5, t6
                  fsqrt.s      ft10, ft2, rup
                  or           tp, t1, ra
                  sub          t3, s7, s2
                  fmv.w.x      ft4, s2
                  xori         s8, s6, 1770
                  fclass.s     s9, fa6
                  mulhu        a3, t4, gp
                  srl          sp, a5, s4
                  nop
                  fmv.x.w      a4, ft4
                  sltu         a6, t2, t6
                  fsgnj.s      ft6, ft6, fs7
                  fle.s        s10, fa2, fs3
                  fdiv.s       fs4, fs0, fa2
                  srl          t6, a0, zero
                  slli         s10, s2, 21
                  sltiu        a1, a0, -1166
                  sltiu        sp, a1, 986
                  add          t6, s10, a0
                  divu         s5, s7, a0
                  fmv.x.w      a4, fa4
                  fcvt.s.wu    fs6, a7
                  xor          s3, t4, t3
                  ori          ra, zero, -1330
                  fadd.s       fs8, ft8, ft3
                  feq.s        s3, fa2, ft3
                  fmv.w.x      fs3, s9
                  xori         gp, a3, -1009
                  fmax.s       ft6, fs1, ft11
                  sll          a5, t0, s2
                  fcvt.wu.s    ra, fs3, rne
                  fcvt.s.wu    fs5, s3, rdn
                  mul          s11, s9, s3
                  rem          s5, ra, gp
                  andi         a2, t1, -187
                  slti         zero, s8, 1714
                  fcvt.w.s     ra, fs0, rtz
                  fcvt.wu.s    t4, fa3
                  or           tp, a6, t1
                  mulhsu       s8, t2, s11
                  sra          s5, t0, t2
                  remu         s9, t0, t3
                  fcvt.w.s     s9, fs6, rmm
                  sltu         s11, s6, t2
                  fcvt.s.wu    ft3, a4, rmm
                  srli         t1, zero, 22
                  slt          a4, s2, a6
                  slti         zero, s11, -623
                  ori          s5, s8, -175
                  flt.s        a7, fs8, fa5
                  fmv.x.w      s1, fs9
                  fmv.w.x      fs1, s0
                  andi         ra, s11, -1706
                  fsgnjn.s     ft6, fs10, fs2
                  sub          s5, t0, t6
                  fsqrt.s      fs10, ft1
                  feq.s        a1, fa5, ft8
                  sll          t4, s5, a1
                  fsqrt.s      ft5, fa1
                  srai         a7, a1, 25
                  xori         ra, s0, -810
                  flt.s        s1, ft5, fs11
                  mul          s10, ra, ra
                  fmv.w.x      ft9, s5
                  slt          s5, s10, s10
                  fmv.w.x      ft4, a0
                  fmin.s       ft4, ft7, ft11
                  mulhsu       a5, s10, a4
                  sub          t6, ra, a0
                  sra          a3, a1, tp
                  fmax.s       fs5, ft9, fs9
                  feq.s        s5, fs2, fs10
                  fcvt.s.wu    fs0, ra
                  addi         t0, s6, -1691
                  ori          s5, t1, -1749
                  add          t2, s9, a0
                  ori          a4, s2, -927
                  fsqrt.s      ft3, ft5
                  fcvt.s.wu    ft5, s9
                  lui          t1, 807505
                  fmv.w.x      fa3, zero
                  fcvt.s.wu    fa1, a7
                  fcvt.wu.s    sp, fs9
                  flt.s        s9, ft6, fs0
                  mul          a2, tp, s1
                  add          gp, sp, s10
                  ori          gp, tp, -2015
                  fsub.s       fs1, fa1, fa6
                  slt          sp, sp, t5
                  fsgnjx.s     fs7, fa5, fs11
                  divu         t2, ra, s0
                  fsub.s       fs2, fa1, fs10
                  sltu         s10, s10, zero
                  srai         s8, s2, 21
                  fmin.s       ft11, ft11, ft8
                  addi         t0, t3, 1254
                  fsgnj.s      fs9, ft10, fa7
                  mul          a7, gp, gp
                  sltu         a7, s1, s9
                  srai         t1, s9, 18
                  sltiu        t0, s3, -1727
                  fmv.x.w      s1, fs6
                  or           t3, s5, s9
                  xori         a7, ra, 2016
                  nop
                  sll          a3, a1, a2
                  slli         s0, a2, 4
                  fclass.s     t2, ft1
                  slti         s10, s6, -1712
                  or           a5, a5, s5
                  fcvt.w.s     s7, fs5
                  fsgnjx.s     ft7, fs2, fs2
                  fdiv.s       fa3, fs9, fs4
                  remu         tp, t6, s9
                  and          a3, s2, s9
                  ori          a2, a2, -91
                  fsgnjn.s     fa3, ft1, ft10
                  auipc        s5, 613714
                  fcvt.s.w     fs7, t5
                  fcvt.s.wu    fa7, t2, rtz
                  fcvt.w.s     s9, fs7
                  divu         a3, a6, zero
                  or           s9, t0, s7
                  add          s11, s5, sp
                  mul          a1, s5, a2
                  nop
                  fmin.s       fs9, ft3, fs2
                  fsgnjx.s     ft4, ft4, fa1
                  divu         a5, s6, sp
                  divu         a5, s6, a7
                  rem          a3, a4, a2
                  nop
                  fadd.s       fs4, fs5, ft9
                  srli         t4, zero, 21
                  fdiv.s       ft5, ft11, fa3, rup
                  fmv.x.w      t2, fa7
                  fcvt.w.s     a7, fa7
                  xor          t0, gp, s10
                  fmin.s       fs5, fa4, fa6
                  sltu         s3, t0, tp
                  nop
                  and          s8, t2, a6
                  feq.s        s5, fa5, ft10
                  sll          a7, a3, a5
                  fmv.x.w      s10, ft10
                  mulh         t1, t0, a7
                  fadd.s       ft7, ft3, ft3, rdn
                  add          t2, tp, t5
                  fsgnjx.s     ft5, ft5, ft9
                  slli         s3, a0, 28
                  fsgnjx.s     fs2, fs6, fa2
                  slt          t5, a6, s11
                  mulhsu       s1, a6, a0
                  lui          s8, 33845
                  or           t2, sp, zero
                  mulhu        a1, gp, s6
                  xor          t6, zero, s10
                  fclass.s     tp, ft1
                  sll          a5, a0, t1
                  sll          t6, a5, a7
                  fmv.w.x      fa1, tp
                  lui          t5, 33401
                  fmin.s       ft10, fa0, ft2
                  srai         a1, s5, 4
                  fcvt.wu.s    t3, fs4
                  slti         gp, gp, 635
                  divu         s0, t1, t3
                  lui          t0, 617195
                  fmv.x.w      s8, fa3
                  srl          s1, s9, a4
                  lui          a6, 601362
                  fsgnj.s      fs9, fa6, fs7
                  srl          t5, t4, s0
                  fsgnjx.s     fs8, ft9, fa0
                  xor          sp, a3, t5
                  srl          s0, zero, s3
                  nop
                  rem          s9, a4, a2
                  rem          a2, s2, s2
                  sll          zero, s7, s2
                  or           zero, s3, tp
                  slt          s6, s8, t5
                  fsqrt.s      ft10, fa0, rup
                  divu         sp, s11, t5
                  fmv.x.w      zero, ft8
                  mul          s5, t2, zero
                  mulhsu       a3, s0, a2
                  sub          a6, t5, t3
                  fmul.s       fs6, fs11, fs5, rup
                  fmin.s       fs4, fa1, ft9
                  add          s11, t6, a1
                  nop
                  fcvt.s.wu    ft8, a5
                  slli         a1, t3, 13
                  mulhu        s10, s1, tp
                  xor          t1, a4, s10
                  sll          t1, s6, a6
                  fclass.s     s7, fa6
                  fsub.s       ft7, ft1, fa6
                  sltiu        t1, s3, 1964
                  remu         s1, a1, s5
                  srai         gp, ra, 17
                  fclass.s     gp, fs0
                  andi         t5, s8, 1474
                  srai         t6, s0, 8
                  fcvt.s.wu    ft6, s7, rne
                  slti         s5, sp, 1788
                  fsgnj.s      fs0, ft2, ft5
                  divu         a2, a7, a5
                  slt          a2, a6, s6
                  xori         ra, a5, -478
                  slti         s1, t3, -179
                  fcvt.wu.s    t1, fs4
                  fcvt.s.wu    fa3, s8, rup
                  fsqrt.s      ft0, ft8, rup
                  sll          s0, t0, s10
                  addi         a3, a6, -1523
                  addi         a2, gp, 194
                  fclass.s     tp, fa5
                  fsgnjn.s     fs6, fa1, fa1
                  sll          s0, gp, t6
                  fsgnj.s      fa6, ft3, fs5
                  fclass.s     s7, fs4
                  fsub.s       fa3, fa0, ft5
                  srl          tp, ra, t4
                  fsgnjn.s     fa7, fa2, fs3
                  and          t0, s0, t2
                  fsgnj.s      ft11, fs10, fa4
                  fmv.w.x      fa1, ra
                  andi         ra, a6, -1473
                  fsub.s       ft3, fa0, fa3, rne
                  srli         t5, s4, 20
                  fsgnj.s      fs6, ft4, fs5
                  flt.s        a5, fa5, ft9
                  fsub.s       fa5, fs0, fs1, rdn
                  sltu         tp, a2, tp
                  div          zero, t3, gp
                  fdiv.s       ft11, fa7, fa2, rdn
                  fsgnj.s      fs0, ft8, ft6
                  rem          gp, a1, a2
                  add          a3, t3, t2
                  lui          s8, 371184
                  slli         s7, a2, 31
                  fmin.s       ft3, ft4, ft8
                  fle.s        t2, ft7, fs5
                  fmul.s       ft7, fa3, fa5
                  mulhu        a1, a7, a1
                  sub          s11, s4, zero
                  lui          zero, 749962
                  fle.s        s0, ft0, fs0
                  addi         a4, s8, 50
                  fcvt.w.s     a1, fs4
                  fcvt.wu.s    s1, fs4, rtz
                  fcvt.s.w     ft8, s1
                  xor          tp, t3, a6
                  mulhu        a4, a0, t2
                  fcvt.s.w     fa3, s7, rne
                  srli         sp, a0, 17
                  andi         zero, a6, 1066
                  rem          t1, a6, a2
                  nop
                  srli         s3, a0, 16
                  mul          t3, ra, t2
                  slti         t0, a3, -2025
                  fsgnjx.s     fa5, fa5, fs8
                  slti         s6, tp, -129
                  fmul.s       fs9, fs6, fa7
                  sltu         a2, t5, t3
                  mulh         s9, s2, s7
                  auipc        sp, 595233
                  mulhu        s9, t5, a4
                  divu         a4, t5, a4
                  fle.s        a5, fs6, fa3
                  fsgnjn.s     fa7, fa3, fs11
                  slt          t0, t3, a5
                  sub          t6, tp, a2
                  auipc        sp, 224362
                  remu         sp, s10, gp
                  fclass.s     s3, fs8
                  fmin.s       fa2, ft8, fs9
                  srai         a3, t4, 20
                  or           s0, s3, zero
                  auipc        s0, 17096
                  flt.s        s10, ft7, ft0
                  fsgnj.s      ft1, ft1, fs3
                  fmax.s       fs0, fs2, ft4
                  fmin.s       ft5, fs5, fa7
                  fsub.s       ft11, ft1, ft8
                  auipc        sp, 999624
                  fsqrt.s      fs7, fa4
                  rem          zero, t0, a5
                  fcvt.s.w     fs6, tp
                  mulh         a4, t2, t1
                  slt          t3, s6, a7
                  fle.s        s0, fs11, fs3
                  fdiv.s       ft11, fs6, fs9
                  fsqrt.s      ft7, fa5
                  srai         sp, a5, 14
                  fsgnjx.s     fa1, ft11, ft5
                  divu         t3, t2, a6
                  sra          a3, s10, a2
                  fclass.s     a1, ft2
                  srai         gp, t0, 13
                  sltu         a7, s4, s6
                  sltu         t4, a6, a2
                  addi         a7, s5, -984
                  xori         s8, s9, -1526
                  fdiv.s       fs3, ft8, fs11
                  fdiv.s       fs1, fs6, ft0
                  ori          a4, a3, -1044
                  ori          tp, a0, -567
                  sltiu        t3, t4, -1665
                  xor          s8, t4, s1
                  fsgnjx.s     fa2, ft10, ft10
                  fcvt.wu.s    t5, ft10
                  fcvt.w.s     s9, fs5, rdn
                  fsgnj.s      fs8, fa3, fs7
                  srl          t3, a2, a6
                  fsgnjx.s     fs4, fs3, ft5
                  fmv.x.w      s11, fa6
                  slt          s0, a1, t3
                  fdiv.s       fs2, fs5, fs9
                  fsgnjn.s     ft6, ft1, fa1
                  fcvt.s.wu    fa3, s11, rup
                  fcvt.s.wu    fs4, s8
                  fmin.s       ft2, fs2, fs3
                  andi         s11, t2, -1890
                  xori         s6, a4, -1207
                  slt          s7, t2, a7
                  andi         a5, a1, 349
                  fsqrt.s      ft5, ft0
                  or           a7, t2, a2
                  slt          t0, s9, gp
                  and          a4, s5, gp
                  fmin.s       fa3, ft4, ft4
                  auipc        t0, 192122
                  mulhu        a2, a1, s2
                  and          t2, t6, t0
                  fmul.s       fs8, ft1, ft7
                  fmin.s       fa4, ft4, ft8
                  mulhsu       t5, gp, sp
                  sll          tp, s2, t3
                  mulh         t5, s6, tp
                  mulhu        t4, a7, a4
                  remu         gp, s4, s11
                  srai         t6, a5, 15
                  feq.s        a3, ft8, ft3
                  sltu         a3, t4, s11
                  slt          s10, a2, t3
                  fle.s        a7, fa0, fs10
                  sub          a5, t5, s6
                  nop
                  remu         t2, t1, a0
                  fsgnjx.s     fs4, fs4, ft3
                  fle.s        s3, fs3, fs6
                  fclass.s     s8, ft2
                  andi         a6, a5, -872
                  sub          s9, t0, t3
                  fmul.s       fs1, fs7, ft6
                  and          sp, a2, a3
                  mulh         t2, gp, s0
                  ori          ra, t5, 829
                  nop
                  feq.s        a1, ft8, fa2
                  sra          gp, a6, s4
                  mul          a3, s2, s9
                  fmin.s       fs2, fa5, fa4
                  or           s8, t3, s5
                  xor          sp, s5, t6
                  mulhu        s1, a0, t5
                  fcvt.s.w     fa6, a2, rne
                  srli         tp, s6, 24
                  fdiv.s       fa1, fs8, ft5, rup
                  addi         s10, ra, -935
                  feq.s        a5, fa5, fs11
                  fsgnj.s      fs4, fs5, fa1
                  xori         s5, a4, 1200
                  mulhsu       s1, a2, s3
                  and          a6, t3, t3
                  divu         a1, a7, s8
                  ori          sp, a4, 363
                  slt          s5, a6, a7
                  xori         s9, gp, 793
                  xor          s0, s11, a6
                  addi         s7, sp, -1148
                  divu         a7, t3, s7
                  fsqrt.s      fs3, fs2
                  auipc        t6, 868872
                  sltiu        a6, s10, -988
                  sltiu        a6, t3, -1563
                  sltiu        s8, s2, -1855
                  slli         t0, s8, 14
                  ori          t1, s0, -264
                  sub          gp, s3, s2
                  mulh         a7, sp, t1
                  mulh         ra, s9, t0
                  fmv.x.w      t6, fs0
                  fadd.s       fa4, fs11, ft10
                  fdiv.s       ft4, fs4, fs10, rup
                  mulh         s11, s5, tp
                  fcvt.wu.s    s10, ft0
                  fmul.s       fs6, ft7, ft10
                  mul          s3, a6, t3
                  fmv.x.w      s10, fs11
                  slli         s8, t6, 31
                  or           s0, t3, s6
                  mulh         s11, s10, zero
                  lui          t6, 855576
                  mul          s7, ra, s7
                  ori          tp, s6, -1711
                  or           t4, a0, a0
                  fcvt.s.w     fs7, tp, rmm
                  mul          t5, a7, s1
                  sltu         zero, a6, a0
                  add          s3, tp, s1
                  fcvt.wu.s    s5, ft1
                  fclass.s     a1, fs9
                  fadd.s       ft8, fa7, fs9
                  srai         a5, s6, 6
                  fsgnjn.s     ft2, fs5, fa1
                  fcvt.wu.s    s5, ft7, rtz
                  fmax.s       fa2, fa1, ft7
                  remu         s11, a4, s0
                  div          a7, a2, s1
                  sub          t2, t2, a0
                  srl          a7, t2, a3
                  fsub.s       fa4, ft4, ft7, rdn
                  sltiu        s8, a3, 1200
                  fmul.s       fa1, ft1, ft6
                  fsgnjx.s     fa2, ft4, ft1
                  flt.s        ra, fs1, ft4
                  ori          ra, s3, 975
                  fle.s        gp, ft4, ft2
                  mulh         s7, t1, a0
                  mulhsu       t6, sp, gp
                  fsgnjn.s     fa1, fa3, fs3
                  srl          a4, s4, s11
                  fsub.s       fs0, ft7, fs4
                  fsub.s       fa7, ft4, fa4, rtz
                  xori         a6, ra, 263
                  xor          t1, a6, s4
                  ori          a3, s6, -1747
                  fmin.s       ft4, fs4, fs10
                  sra          a3, s9, s8
                  fclass.s     s11, fs8
                  fmv.x.w      tp, fa7
                  flt.s        a3, fa1, ft0
                  fmul.s       fs6, fs3, ft4
                  srl          a1, a7, a1
                  divu         a2, a7, s4
                  fadd.s       fa7, fs3, ft3, rup
                  andi         tp, s8, -1688
                  slt          zero, a4, t1
                  srli         s6, s5, 8
                  fcvt.s.wu    fs1, t5, rdn
                  add          a1, a6, s8
                  mulhsu       a7, t5, gp
                  fmin.s       ft4, fa4, fs1
                  add          gp, t0, t1
                  sltiu        s7, a4, 193
                  auipc        s0, 312986
                  lui          tp, 536614
                  fmin.s       ft10, fs2, fa3
                  lui          t1, 217685
                  xori         a7, s0, 938
                  sltu         t3, s5, t3
                  mulh         sp, gp, t3
                  sltiu        t3, zero, 386
                  fadd.s       ft7, ft2, ft8
                  sll          t5, t3, s11
                  mulhsu       t6, t3, a5
                  fcvt.s.wu    fa5, s9, rtz
                  auipc        s8, 841302
                  mulh         t0, a6, t6
                  divu         s5, s3, t1
                  fcvt.s.w     ft1, t2
                  fsgnjn.s     fs2, ft2, ft8
                  fsqrt.s      fa6, fs4
                  andi         gp, t6, -1530
                  mulhu        t6, a7, s1
                  div          t5, s8, s3
                  rem          t2, s7, s7
                  srai         s0, sp, 10
                  or           a2, a6, ra
                  fmax.s       ft10, fs3, fs9
                  sltiu        s3, t0, -1999
                  fmv.w.x      ft1, s5
                  nop
                  srli         sp, t4, 12
                  fsgnjx.s     fs0, ft8, fs3
                  mul          a4, a2, a2
                  fsgnj.s      ft11, fs2, fs2
                  fmul.s       ft2, fa5, fs5, rtz
                  rem          s0, sp, s5
                  mulh         s5, a2, t4
                  fsub.s       ft5, ft8, fa3
                  xori         a6, t1, -1328
                  srai         tp, a7, 22
                  div          t3, a2, sp
                  mulhsu       s0, s10, s1
                  mulhu        t0, a7, s4
                  mulhsu       s6, ra, sp
                  sub          s7, t2, t0
                  sltiu        s11, t2, 1375
                  srai         s6, a1, 30
                  mulhu        s11, a7, t0
                  fsqrt.s      fa1, fs6
                  fmul.s       ft11, fa7, ft4
                  add          s3, s6, t4
                  xori         s9, s0, 630
                  mulh         tp, t1, t0
                  fdiv.s       fs9, ft7, ft0, rup
                  fmin.s       fs11, fs5, fa7
                  fcvt.s.wu    fa6, gp, rmm
                  slti         a6, a4, -1339
                  slt          s10, a2, a1
                  sltu         s0, ra, t1
                  sll          ra, s9, s1
                  addi         ra, a4, -1697
                  srl          t6, a0, a1
                  auipc        a7, 939587
                  fsgnjx.s     fs3, ft7, fs3
                  fsgnj.s      ft9, fs10, ft7
                  sltu         t5, t4, ra
                  fsgnjn.s     ft8, fa1, ft5
                  fmin.s       ft10, fa6, fs3
                  fclass.s     a2, fs9
                  or           s1, s3, t2
                  fmin.s       fs2, fa3, ft1
                  andi         tp, a0, 464
                  fmax.s       ft3, fs5, fa7
                  fadd.s       fs0, ft7, fa7
                  divu         ra, t0, s4
                  flt.s        tp, ft3, ft7
                  lui          t6, 731814
                  mul          s0, a4, s7
                  mulhsu       t0, a0, a5
                  fsgnjn.s     ft3, fs9, ft0
                  or           s1, s1, s1
                  and          t6, a2, t6
                  sub          zero, s3, zero
                  andi         s11, s0, -1791
                  nop
                  div          s8, s4, t5
                  fadd.s       fa7, fa2, fa1
                  addi         a3, zero, -1404
                  fcvt.w.s     tp, fs3, rdn
                  add          s6, ra, a2
                  xor          t1, a2, sp
                  mulh         a5, t1, s5
                  fmax.s       fs6, ft5, ft3
                  fmul.s       fa6, ft8, fs4, rdn
                  rem          a6, s5, s5
                  fsgnjx.s     ft0, ft6, ft1
                  fmv.w.x      ft5, gp
                  fmin.s       fs11, fs7, fa4
                  xor          t4, a2, s10
                  xori         a4, s4, -1721
                  fsgnjx.s     fs8, ft2, ft5
                  or           a2, s9, t5
                  divu         s9, a3, a3
                  fsgnjx.s     fs4, fa7, fs6
                  srai         s7, s3, 10
                  fmul.s       fa6, ft8, ft2
                  fle.s        t2, ft2, ft4
                  srai         s10, sp, 26
                  mulhsu       t5, ra, s9
                  fadd.s       fs6, fs0, fa6, rdn
                  nop
                  srli         s5, t4, 24
                  slli         t6, t2, 8
                  mulh         s5, s2, t3
                  sltu         s1, s11, t4
                  srli         s1, s11, 16
                  sltu         s0, tp, t4
                  fsgnjn.s     fs3, fs8, fs11
                  fsqrt.s      ft9, ft6
                  andi         gp, t1, -327
                  add          ra, s1, s1
                  fcvt.wu.s    a6, fs7, rtz
                  addi         a7, t0, -763
                  and          s10, a5, gp
                  slti         a6, s0, -1762
                  or           s3, t1, s5
                  andi         s3, s11, 218
                  remu         t6, a0, s5
                  mulh         sp, sp, a4
                  feq.s        s11, ft4, fs3
                  fcvt.s.wu    fa1, t3
                  fsgnj.s      fa4, fs4, fs9
                  slt          ra, s7, s1
                  ori          s10, a5, 1938
                  slti         t4, s4, -1216
                  slti         a3, t4, 131
                  sltu         a6, t0, a4
                  fadd.s       ft5, ft8, fs11
                  and          s8, t2, t1
                  slt          zero, gp, s7
                  auipc        t2, 401425
                  divu         a2, s9, gp
                  slli         t0, t5, 30
                  slt          a3, s9, a4
                  fsgnjx.s     fa0, fa0, fa0
                  srai         s3, a2, 14
                  fsgnjx.s     fs3, ft10, ft0
                  add          a5, s9, t1
                  fmv.x.w      t6, fa7
                  feq.s        t5, ft6, ft7
                  andi         t2, t2, -1779
                  sltu         a6, t2, s10
                  lui          t4, 951060
                  xor          s9, s7, a4
                  fmin.s       ft2, fs7, fa2
                  fmin.s       fa5, ft10, ft8
                  fmax.s       ft4, fs7, ft6
                  fmul.s       ft5, fs10, ft4
                  flt.s        a4, ft11, fs8
                  fsgnj.s      ft10, fs10, fa1
                  addi         s6, ra, 851
                  auipc        s6, 559727
                  fcvt.w.s     a3, fa4, rtz
                  andi         s11, t6, -723
                  fmin.s       fa7, fs6, fs0
                  sltiu        s6, s7, 1259
                  rem          s9, a4, t2
                  and          tp, t3, s11
                  addi         a1, s1, -958
                  srai         s5, gp, 4
                  fmv.x.w      tp, ft9
                  fmul.s       ft5, ft1, ft10, rmm
                  sltiu        t2, a4, -705
                  mul          s10, sp, a4
                  add          a2, s3, a7
                  lui          a6, 755646
                  srl          a4, t0, a3
                  xori         t4, s11, -1719
                  srai         s3, s9, 3
                  fmul.s       fs0, fa3, fs1, rmm
                  fcvt.s.w     ft5, a0, rmm
                  fsgnjn.s     ft11, fs1, fs10
                  fsub.s       fa1, fs7, fs4, rup
                  xor          s7, t5, s5
                  sltu         a5, t0, gp
                  fsgnjn.s     fs1, ft9, ft3
                  div          ra, s0, a6
                  fsqrt.s      fs0, ft7
                  fsgnj.s      fs1, ft1, fs5
                  flt.s        a1, fs9, fa0
                  srai         a4, s5, 19
                  fmax.s       fs1, fa7, fs0
                  xori         t1, a4, 1378
                  mulhu        t6, s6, s4
                  or           a5, s8, t6
                  fmv.w.x      ft8, t3
                  fcvt.wu.s    a3, fs8, rne
                  fle.s        a2, fa0, ft3
                  ori          s11, sp, 160
                  fsgnjx.s     fs9, fs2, fs10
                  fsgnjx.s     fs5, ft9, ft0
                  addi         ra, a2, 1698
                  xori         tp, a1, -804
                  xor          s3, a0, a2
                  add          s7, a2, s6
                  fdiv.s       ft10, fs8, fa5
                  fle.s        t6, ft9, fa4
                  xori         s6, s4, -761
                  fadd.s       fa0, ft0, fa6, rdn
                  or           t3, t4, s2
                  sll          t0, t4, s1
                  srai         a4, ra, 23
                  slli         s7, tp, 31
                  fmv.w.x      ft0, t2
                  fsqrt.s      ft10, ft8
                  add          zero, s3, ra
                  fcvt.s.w     fs6, ra
                  sltu         a4, s9, sp
                  fmv.w.x      fs10, s2
                  fcvt.s.wu    fs8, s2
                  nop
                  sra          s0, s4, a4
                  mul          s8, a5, a6
                  fmv.x.w      a1, fa0
                  feq.s        a5, fa1, ft5
                  slti         s0, t3, 366
                  fmax.s       ft5, ft6, fs2
                  fsqrt.s      fa0, fs2, rne
                  sll          s5, s2, s1
                  sub          sp, a2, s10
                  nop
                  sra          s8, zero, a5
                  fmin.s       fa2, fs8, fs8
                  sra          t4, tp, s1
                  xori         t1, t3, -376
                  fle.s        s9, fs2, ft7
                  and          a1, t6, gp
                  sltiu        gp, s9, -2017
                  auipc        a4, 235093
                  fle.s        s8, fa7, ft11
                  fsub.s       fs0, fs11, fs11
                  srl          s5, a7, s7
                  nop
                  auipc        a3, 438288
                  mul          a7, tp, s7
                  fadd.s       fs6, ft7, ft2, rtz
                  auipc        a5, 416077
                  fcvt.s.wu    ft6, s2
                  fcvt.wu.s    t0, fs11
                  nop
                  feq.s        s8, ft7, fs6
                  mulh         a6, t3, a5
                  fmv.w.x      fs6, s7
                  lui          s6, 93725
                  lui          a3, 1017468
                  slti         ra, t6, 280
                  sll          a2, tp, a4
                  xori         s0, sp, 1788
                  mulh         a2, s4, s9
                  slli         a3, s2, 18
                  sltiu        a6, zero, -1338
                  fle.s        a6, ft8, fa1
                  sltu         sp, t2, a3
                  mulh         s6, s6, tp
                  fclass.s     zero, ft10
                  fcvt.s.w     fs6, a6
                  fcvt.s.wu    ft0, a0, rup
                  sub          s10, s10, a5
                  xori         a3, a2, -935
                  srli         t5, a7, 22
                  rem          t1, a4, t1
                  div          a6, s2, s8
                  xori         s11, s2, -1699
                  andi         a1, t5, 131
                  mul          t4, s4, a1
                  fdiv.s       ft6, fs7, fs3, rdn
                  srli         t5, ra, 10
                  mulh         s7, gp, a1
                  slti         a2, a7, 1744
                  srl          sp, t0, a0
                  fmv.x.w      gp, fs5
                  mulhsu       s10, t0, s8
                  sltiu        a7, a4, 694
                  mulhu        t2, s2, a0
                  feq.s        a7, ft5, ft6
                  xor          s0, a5, gp
                  mulh         s6, a5, a7
                  fmul.s       ft3, fa5, fa0
                  fsqrt.s      fa5, ft3, rdn
                  fclass.s     s9, fa7
                  srl          s11, t6, t2
                  fmul.s       ft9, ft3, fa7, rmm
                  fmax.s       ft5, ft0, fs1
                  divu         s1, t6, s3
                  and          a1, t1, t4
                  lui          s1, 262210
                  and          s10, s3, t0
                  fadd.s       ft7, fs10, fs3
                  fle.s        ra, fa4, ft8
                  rem          t0, s3, s8
                  fsub.s       ft0, fa3, fa4
                  fmv.w.x      fs1, t6
                  fmv.x.w      s5, fs6
                  srai         zero, a1, 9
                  slli         t3, s11, 3
                  sll          t4, a3, s4
                  fmax.s       fs6, fa5, fs7
                  addi         a5, a7, -107
                  fsgnj.s      fa5, fs10, fa5
                  fmv.x.w      zero, ft2
                  or           t1, t4, ra
                  sra          s3, s5, a6
                  add          s11, s10, t6
                  mul          s5, a4, t4
                  srai         gp, a4, 3
                  remu         a6, t2, t6
                  fsgnj.s      ft0, fa0, fs6
                  fclass.s     t4, ft10
                  fadd.s       fa1, ft5, ft7, rup
                  ori          t5, t5, -396
                  mulhsu       s3, a5, s10
                  andi         s8, a3, -1671
                  flt.s        s8, fs5, fs3
                  fsgnj.s      fs4, fs2, fs7
                  or           s11, s9, a2
                  fcvt.s.wu    ft6, s1, rmm
                  feq.s        a2, ft1, fs4
                  fsub.s       fa5, ft11, fa3, rdn
                  mul          t6, zero, zero
                  fsqrt.s      fs6, fs9
                  mul          a1, t2, a7
                  srli         t5, s0, 21
                  mulh         t0, t5, gp
                  fcvt.wu.s    s10, ft8
                  fsgnjn.s     fs3, fs7, ft10
                  and          a7, t1, t3
                  fmin.s       ft11, ft2, fa3
                  xori         zero, t4, -931
                  fmin.s       ft1, ft2, ft5
                  auipc        a1, 862037
                  fclass.s     a1, ft7
                  fmin.s       fs10, fa1, fs5
                  auipc        s5, 862795
                  mulhu        t6, a7, s10
                  fle.s        s6, fa7, fa1
                  fclass.s     a5, ft7
                  fadd.s       fs3, fa0, fs9, rmm
                  mul          t6, s2, t5
                  srli         gp, s10, 30
                  nop
                  fcvt.s.w     ft10, s3
                  rem          s11, a6, zero
                  fmin.s       fa2, ft5, ft10
                  fcvt.wu.s    ra, fs2, rdn
                  flt.s        t1, ft8, fs0
                  srl          t4, zero, t3
                  nop
                  fdiv.s       ft7, fs2, ft6, rup
                  xori         a3, a7, -823
                  fsub.s       fa3, fa5, fa7, rtz
                  fsgnjn.s     fa0, ft3, ft4
                  add          a1, a1, a6
                  srli         s5, s10, 13
                  or           t2, a6, s1
                  fsub.s       fa3, ft1, ft8
                  fcvt.s.wu    fa2, s11
                  fcvt.s.w     fa6, s7, rmm
                  mulh         a6, s6, a2
                  mulhsu       a2, s7, a2
                  mul          a4, gp, a3
                  fclass.s     t4, ft7
                  lui          a1, 507680
                  srli         a2, s11, 9
                  sltu         t2, s5, s8
                  xori         s11, a6, -1542
                  sll          a7, tp, a3
                  or           s6, s5, a7
                  or           s6, s3, t2
                  srai         s11, s3, 15
                  mulhu        t4, s3, s10
                  and          s3, zero, s2
                  fmul.s       ft2, fs4, ft6
                  auipc        a7, 804337
                  fmax.s       ft3, fs3, fs2
                  fsub.s       ft2, ft1, ft8
                  fle.s        s0, fs10, ft10
                  rem          a6, t5, a6
                  sll          a5, a0, s2
                  fcvt.s.wu    fs7, ra, rup
                  sltu         s6, a7, s10
                  fclass.s     gp, ft5
                  nop
                  div          t1, tp, t4
                  ori          a1, a6, 1744
                  divu         s3, tp, t3
                  slti         ra, t6, 256
                  addi         a2, s6, -1607
                  auipc        tp, 101110
                  fcvt.s.wu    fs11, t3
                  and          s3, a0, a2
                  sltiu        t1, t0, -1407
                  addi         t3, a6, 849
                  mul          gp, zero, gp
                  auipc        t3, 283468
                  remu         s5, a1, a7
                  fmul.s       fa6, ft0, ft2, rmm
                  xori         a5, gp, -545
                  remu         zero, a1, t4
                  lui          a2, 35497
                  fsub.s       ft6, fa3, ft7
                  fdiv.s       ft6, fa2, fa1, rtz
                  andi         s11, s10, 548
                  fmv.x.w      a2, fa4
                  mulhsu       t1, a2, s2
                  mul          tp, s9, s7
                  fcvt.wu.s    s0, ft8, rup
                  fcvt.wu.s    t4, fa1, rdn
                  addi         a1, t4, -112
                  auipc        s11, 335041
                  sra          a2, s1, s4
                  slt          zero, a0, t5
                  slti         s1, a7, 85
                  rem          a5, a0, t1
                  fmul.s       fa4, fs7, fs7, rtz
                  addi         a7, a2, 1483
                  addi         t1, s4, -1212
                  srl          s5, a4, s0
                  fclass.s     t5, ft1
                  div          t3, t1, a6
                  slli         s6, gp, 0
                  div          t6, a4, a4
                  mulh         sp, ra, s7
                  fsgnj.s      fs3, ft6, fs6
                  mulhu        a1, t1, s2
                  slti         a2, a4, 438
                  mulhu        s0, ra, s7
                  slt          a1, a2, gp
                  sltiu        s11, t1, 2030
                  flt.s        gp, fs4, fs4
                  div          s10, s6, a4
                  ori          a2, s11, 2021
                  fcvt.s.wu    ft7, a1, rup
                  sub          zero, a3, a3
                  slt          t1, a0, s2
                  fcvt.w.s     t6, ft4
                  la x20, test_done
                  jalr x0, x20, 0
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
                  addi x18, x18, -4
                  sw  x10, (x18)
                  add x10, x18, zero
                  addi x10, x10, -128
                  sw  x1, 4(x10)
                  sw  x2, 8(x10)
                  sw  x3, 12(x10)
                  sw  x4, 16(x10)
                  sw  x5, 20(x10)
                  sw  x6, 24(x10)
                  sw  x7, 28(x10)
                  sw  x8, 32(x10)
                  sw  x9, 36(x10)
                  sw  x10, 40(x10)
                  sw  x11, 44(x10)
                  sw  x12, 48(x10)
                  sw  x13, 52(x10)
                  sw  x14, 56(x10)
                  sw  x15, 60(x10)
                  sw  x16, 64(x10)
                  sw  x17, 68(x10)
                  sw  x18, 72(x10)
                  sw  x19, 76(x10)
                  sw  x20, 80(x10)
                  sw  x21, 84(x10)
                  sw  x22, 88(x10)
                  sw  x23, 92(x10)
                  sw  x24, 96(x10)
                  sw  x25, 100(x10)
                  sw  x26, 104(x10)
                  sw  x27, 108(x10)
                  sw  x28, 112(x10)
                  sw  x29, 116(x10)
                  sw  x30, 120(x10)
                  sw  x31, 124(x10)
                  add x18, x10, zero
                  csrr x28, 0x300 # MSTATUS
                  csrr x28, 0x342 # MCAUSE
                  srli x28, x28, 31
                  bne x28, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x28, 0x341 # MEPC
                  csrr x28, 0x342 # MCAUSE
                  li x9, 0x3 # BREAKPOINT
                  beq x28, x9, ebreak_handler
                  li x9, 0x8 # ECALL_UMODE
                  beq x28, x9, ecall_handler
                  li x9, 0x9 # ECALL_SMODE
                  beq x28, x9, ecall_handler
                  li x9, 0xb # ECALL_MMODE
                  beq x28, x9, ecall_handler
                  li x9, 0x1
                  beq x28, x9, instr_fault_handler
                  li x9, 0x5
                  beq x28, x9, load_fault_handler
                  li x9, 0x7
                  beq x28, x9, store_fault_handler
                  li x9, 0xc
                  beq x28, x9, pt_fault_handler
                  li x9, 0xd
                  beq x28, x9, pt_fault_handler
                  li x9, 0xf
                  beq x28, x9, pt_fault_handler
                  li x9, 0x2 # ILLEGAL_INSTRUCTION
                  beq x28, x9, illegal_instr_handler
                  csrr x9, 0x343 # MTVAL
                  1: la x20, test_done
                  jalr x1, x20, 0

ecall_handler:    
                  la x28, _start
                  sw x0, 0(x28)
                  sw x1, 4(x28)
                  sw x2, 8(x28)
                  sw x3, 12(x28)
                  sw x4, 16(x28)
                  sw x5, 20(x28)
                  sw x6, 24(x28)
                  sw x7, 28(x28)
                  sw x8, 32(x28)
                  sw x9, 36(x28)
                  sw x10, 40(x28)
                  sw x11, 44(x28)
                  sw x12, 48(x28)
                  sw x13, 52(x28)
                  sw x14, 56(x28)
                  sw x15, 60(x28)
                  sw x16, 64(x28)
                  sw x17, 68(x28)
                  sw x18, 72(x28)
                  sw x19, 76(x28)
                  sw x20, 80(x28)
                  sw x21, 84(x28)
                  sw x22, 88(x28)
                  sw x23, 92(x28)
                  sw x24, 96(x28)
                  sw x25, 100(x28)
                  sw x26, 104(x28)
                  sw x27, 108(x28)
                  sw x28, 112(x28)
                  sw x29, 116(x28)
                  sw x30, 120(x28)
                  sw x31, 124(x28)
                  la x20, write_tohost
                  jalr x0, x20, 0

instr_fault_handler:
                  add x10, x18, zero
                  lw  x1, 4(x10)
                  lw  x2, 8(x10)
                  lw  x3, 12(x10)
                  lw  x4, 16(x10)
                  lw  x5, 20(x10)
                  lw  x6, 24(x10)
                  lw  x7, 28(x10)
                  lw  x8, 32(x10)
                  lw  x9, 36(x10)
                  lw  x10, 40(x10)
                  lw  x11, 44(x10)
                  lw  x12, 48(x10)
                  lw  x13, 52(x10)
                  lw  x14, 56(x10)
                  lw  x15, 60(x10)
                  lw  x16, 64(x10)
                  lw  x17, 68(x10)
                  lw  x18, 72(x10)
                  lw  x19, 76(x10)
                  lw  x20, 80(x10)
                  lw  x21, 84(x10)
                  lw  x22, 88(x10)
                  lw  x23, 92(x10)
                  lw  x24, 96(x10)
                  lw  x25, 100(x10)
                  lw  x26, 104(x10)
                  lw  x27, 108(x10)
                  lw  x28, 112(x10)
                  lw  x29, 116(x10)
                  lw  x30, 120(x10)
                  lw  x31, 124(x10)
                  addi x10, x10, 128
                  add x18, x10, zero
                  lw  x10, (x18)
                  addi x18, x18, 4
                  mret

load_fault_handler:
                  add x10, x18, zero
                  lw  x1, 4(x10)
                  lw  x2, 8(x10)
                  lw  x3, 12(x10)
                  lw  x4, 16(x10)
                  lw  x5, 20(x10)
                  lw  x6, 24(x10)
                  lw  x7, 28(x10)
                  lw  x8, 32(x10)
                  lw  x9, 36(x10)
                  lw  x10, 40(x10)
                  lw  x11, 44(x10)
                  lw  x12, 48(x10)
                  lw  x13, 52(x10)
                  lw  x14, 56(x10)
                  lw  x15, 60(x10)
                  lw  x16, 64(x10)
                  lw  x17, 68(x10)
                  lw  x18, 72(x10)
                  lw  x19, 76(x10)
                  lw  x20, 80(x10)
                  lw  x21, 84(x10)
                  lw  x22, 88(x10)
                  lw  x23, 92(x10)
                  lw  x24, 96(x10)
                  lw  x25, 100(x10)
                  lw  x26, 104(x10)
                  lw  x27, 108(x10)
                  lw  x28, 112(x10)
                  lw  x29, 116(x10)
                  lw  x30, 120(x10)
                  lw  x31, 124(x10)
                  addi x10, x10, 128
                  add x18, x10, zero
                  lw  x10, (x18)
                  addi x18, x18, 4
                  mret

store_fault_handler:
                  add x10, x18, zero
                  lw  x1, 4(x10)
                  lw  x2, 8(x10)
                  lw  x3, 12(x10)
                  lw  x4, 16(x10)
                  lw  x5, 20(x10)
                  lw  x6, 24(x10)
                  lw  x7, 28(x10)
                  lw  x8, 32(x10)
                  lw  x9, 36(x10)
                  lw  x10, 40(x10)
                  lw  x11, 44(x10)
                  lw  x12, 48(x10)
                  lw  x13, 52(x10)
                  lw  x14, 56(x10)
                  lw  x15, 60(x10)
                  lw  x16, 64(x10)
                  lw  x17, 68(x10)
                  lw  x18, 72(x10)
                  lw  x19, 76(x10)
                  lw  x20, 80(x10)
                  lw  x21, 84(x10)
                  lw  x22, 88(x10)
                  lw  x23, 92(x10)
                  lw  x24, 96(x10)
                  lw  x25, 100(x10)
                  lw  x26, 104(x10)
                  lw  x27, 108(x10)
                  lw  x28, 112(x10)
                  lw  x29, 116(x10)
                  lw  x30, 120(x10)
                  lw  x31, 124(x10)
                  addi x10, x10, 128
                  add x18, x10, zero
                  lw  x10, (x18)
                  addi x18, x18, 4
                  mret

ebreak_handler:   
                  csrr  x28, 0x341
                  addi  x28, x28, 4
                  csrw  0x341, x28
                  add x10, x18, zero
                  lw  x1, 4(x10)
                  lw  x2, 8(x10)
                  lw  x3, 12(x10)
                  lw  x4, 16(x10)
                  lw  x5, 20(x10)
                  lw  x6, 24(x10)
                  lw  x7, 28(x10)
                  lw  x8, 32(x10)
                  lw  x9, 36(x10)
                  lw  x10, 40(x10)
                  lw  x11, 44(x10)
                  lw  x12, 48(x10)
                  lw  x13, 52(x10)
                  lw  x14, 56(x10)
                  lw  x15, 60(x10)
                  lw  x16, 64(x10)
                  lw  x17, 68(x10)
                  lw  x18, 72(x10)
                  lw  x19, 76(x10)
                  lw  x20, 80(x10)
                  lw  x21, 84(x10)
                  lw  x22, 88(x10)
                  lw  x23, 92(x10)
                  lw  x24, 96(x10)
                  lw  x25, 100(x10)
                  lw  x26, 104(x10)
                  lw  x27, 108(x10)
                  lw  x28, 112(x10)
                  lw  x29, 116(x10)
                  lw  x30, 120(x10)
                  lw  x31, 124(x10)
                  addi x10, x10, 128
                  add x18, x10, zero
                  lw  x10, (x18)
                  addi x18, x18, 4
                  mret

illegal_instr_handler:
                  csrr  x28, 0x341
                  addi  x28, x28, 4
                  csrw  0x341, x28
                  add x10, x18, zero
                  lw  x1, 4(x10)
                  lw  x2, 8(x10)
                  lw  x3, 12(x10)
                  lw  x4, 16(x10)
                  lw  x5, 20(x10)
                  lw  x6, 24(x10)
                  lw  x7, 28(x10)
                  lw  x8, 32(x10)
                  lw  x9, 36(x10)
                  lw  x10, 40(x10)
                  lw  x11, 44(x10)
                  lw  x12, 48(x10)
                  lw  x13, 52(x10)
                  lw  x14, 56(x10)
                  lw  x15, 60(x10)
                  lw  x16, 64(x10)
                  lw  x17, 68(x10)
                  lw  x18, 72(x10)
                  lw  x19, 76(x10)
                  lw  x20, 80(x10)
                  lw  x21, 84(x10)
                  lw  x22, 88(x10)
                  lw  x23, 92(x10)
                  lw  x24, 96(x10)
                  lw  x25, 100(x10)
                  lw  x26, 104(x10)
                  lw  x27, 108(x10)
                  lw  x28, 112(x10)
                  lw  x29, 116(x10)
                  lw  x30, 120(x10)
                  lw  x31, 124(x10)
                  addi x10, x10, 128
                  add x18, x10, zero
                  lw  x10, (x18)
                  addi x18, x18, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x28, 0x300 # MSTATUS;
                  csrr  x28, 0x304 # MIE;
                  csrr  x28, 0x344 # MIP;
                  csrrc x28, 0x344, x28 # MIP;
                  add x10, x18, zero
                  lw  x1, 4(x10)
                  lw  x2, 8(x10)
                  lw  x3, 12(x10)
                  lw  x4, 16(x10)
                  lw  x5, 20(x10)
                  lw  x6, 24(x10)
                  lw  x7, 28(x10)
                  lw  x8, 32(x10)
                  lw  x9, 36(x10)
                  lw  x10, 40(x10)
                  lw  x11, 44(x10)
                  lw  x12, 48(x10)
                  lw  x13, 52(x10)
                  lw  x14, 56(x10)
                  lw  x15, 60(x10)
                  lw  x16, 64(x10)
                  lw  x17, 68(x10)
                  lw  x18, 72(x10)
                  lw  x19, 76(x10)
                  lw  x20, 80(x10)
                  lw  x21, 84(x10)
                  lw  x22, 88(x10)
                  lw  x23, 92(x10)
                  lw  x24, 96(x10)
                  lw  x25, 100(x10)
                  lw  x26, 104(x10)
                  lw  x27, 108(x10)
                  lw  x28, 112(x10)
                  lw  x29, 116(x10)
                  lw  x30, 120(x10)
                  lw  x31, 124(x10)
                  addi x10, x10, 128
                  add x18, x10, zero
                  lw  x10, (x18)
                  addi x18, x18, 4
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
