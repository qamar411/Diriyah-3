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
                  li x31, 0x40001120
                  csrw 0x301, x31
kernel_sp:        
                  la x14, kernel_stack_end

trap_vec_init:    
                  la x31, mtvec_handler
                  ori x31, x31, 1
                  csrw 0x305, x31 # MTVEC

mepc_setup:       
                  la x31, init
                  csrw 0x341, x31

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x31, 0x3800
                  csrw 0x300, x31 # MSTATUS
                  li x31, 0x0
                  csrw 0x304, x31 # MIE
                  mret
init:             
                  li x31, 2139095041
                  fmv.w.x f0, x31
                  li x31, 0
                  fmv.w.x f1, x31
                  li x31, 0
                  fmv.w.x f2, x31
                  li x31, 2147483648
                  fmv.w.x f3, x31
                  li x31, 1799538
                  fmv.w.x f4, x31
                  li x31, 1521368550
                  fmv.w.x f5, x31
                  li x31, 2147483648
                  fmv.w.x f6, x31
                  li x31, 2143289344
                  fmv.w.x f7, x31
                  li x31, 697461482
                  fmv.w.x f8, x31
                  li x31, 4286578688
                  fmv.w.x f9, x31
                  li x31, 2143289344
                  fmv.w.x f10, x31
                  li x31, 4726327
                  fmv.w.x f11, x31
                  li x31, 2139095040
                  fmv.w.x f12, x31
                  li x31, 4286578687
                  fmv.w.x f13, x31
                  li x31, 2147483648
                  fmv.w.x f14, x31
                  li x31, 4286578687
                  fmv.w.x f15, x31
                  li x31, 4161361935
                  fmv.w.x f16, x31
                  li x31, 2139095041
                  fmv.w.x f17, x31
                  li x31, 0
                  fmv.w.x f18, x31
                  li x31, 4286578688
                  fmv.w.x f19, x31
                  li x31, 2147966103
                  fmv.w.x f20, x31
                  li x31, 2139095040
                  fmv.w.x f21, x31
                  li x31, 1728957
                  fmv.w.x f22, x31
                  li x31, 171868846
                  fmv.w.x f23, x31
                  li x31, 2143289344
                  fmv.w.x f24, x31
                  li x31, 2139095040
                  fmv.w.x f25, x31
                  li x31, 477275069
                  fmv.w.x f26, x31
                  li x31, 1491462585
                  fmv.w.x f27, x31
                  li x31, 2150734838
                  fmv.w.x f28, x31
                  li x31, 2139095041
                  fmv.w.x f29, x31
                  li x31, 0
                  fmv.w.x f30, x31
                  li x31, 792210696
                  fmv.w.x f31, x31
                  fsrmi 3
                  li x0, 0x594cb195
                  li x1, 0x0
                  li x2, 0x80000000
                  li x3, 0x0
                  li x4, 0x0
                  li x5, 0xb
                  li x6, 0x80000000
                  li x7, 0x80000000
                  li x8, 0xf23133b8
                  li x9, 0xfa65c9d1
                  li x10, 0x80000000
                  li x11, 0x0
                  li x12, 0xfbebe54f
                  li x13, 0x0
                  li x15, 0xfa5138f5
                  li x16, 0x0
                  li x17, 0x80000000
                  li x18, 0x0
                  li x19, 0x3
                  li x20, 0x2
                  li x21, 0xde79d72f
                  li x22, 0x0
                  li x23, 0x0
                  li x24, 0x3e1a260c
                  li x25, 0xd88d8341
                  li x26, 0x80000000
                  li x28, 0xf613bc51
                  li x29, 0x0
                  li x30, 0xf94c9750
                  li x31, 0x4a579950
                  la x27, user_stack_end
main:             fcvt.wu.s    zero, fa6
                  fmv.x.w      s5, ft10
                  slti         ra, t3, 440
                  mulhsu       a7, a5, s0
                  fdiv.s       fa1, ft6, fs9
                  fcvt.wu.s    t6, fa4, rmm
                  fmv.w.x      fs5, s10
                  andi         t2, s1, 163
                  sltu         s5, s3, s6
                  srai         a1, s4, 4
                  lui          sp, 308913
                  flt.s        s7, fs1, ft0
                  fmul.s       ft7, fa2, fs9
                  fcvt.s.wu    ft7, s1
                  sll          a5, s2, s9
                  fmul.s       fs9, fs3, fa3, rtz
                  fmv.x.w      t2, fs0
                  fsgnj.s      fs7, ft9, fa3
                  fcvt.s.wu    fs9, gp
                  srai         zero, t0, 26
                  fdiv.s       fa3, fa5, fa0, rup
                  div          s4, a7, s8
                  mulhu        s8, t2, s10
                  mulhsu       t1, s9, t6
                  xor          a2, s9, s8
                  remu         s0, t5, a2
                  xori         sp, s4, -1469
                  fsgnjx.s     ft9, fa1, fa5
                  fcvt.wu.s    zero, fs10
                  div          sp, a3, t4
                  fle.s        s0, ft5, fs10
                  andi         s1, sp, -368
                  fcvt.wu.s    sp, fa7
                  fcvt.wu.s    s7, ft8
                  fcvt.wu.s    zero, fs1
                  sra          a7, s3, s2
                  sra          t5, tp, ra
                  srai         s8, a4, 20
                  fsub.s       fa1, fa5, ft3
                  slti         a7, a6, 542
                  lui          gp, 743972
                  addi         a2, s2, 615
                  fmul.s       ft0, fa2, fs5, rtz
                  srli         a6, sp, 8
                  fsgnjn.s     ft8, fa4, fa3
                  fsgnjn.s     fs3, fa6, fs10
                  addi         zero, s1, -309
                  srl          sp, gp, s5
                  remu         a7, s7, t3
                  auipc        s2, 716332
                  sra          ra, a2, a5
                  fclass.s     t2, fs5
                  or           s9, a2, t1
                  nop
                  xori         t6, t2, -887
                  sltu         s4, gp, t3
                  fsgnjn.s     fa6, fs4, fa4
                  fsgnjx.s     fa4, fa0, fs2
                  div          s9, s4, s1
                  mul          a5, sp, t6
                  mulh         s5, s4, a3
                  sltu         s2, zero, s1
                  mul          a5, a3, a4
                  fadd.s       fs1, ft11, fa6
                  srai         s5, a1, 19
                  add          s9, tp, s0
                  mulhsu       a6, gp, s7
                  mulhu        a6, a0, t6
                  auipc        t5, 810001
                  fmax.s       fs3, ft2, ft6
                  xori         t6, ra, 1343
                  fdiv.s       fs1, ft9, ft10
                  fdiv.s       ft9, ft2, fs8, rmm
                  div          s0, s8, s3
                  fcvt.wu.s    a6, fs0, rtz
                  div          s10, t2, zero
                  fmin.s       fa6, fa3, ft0
                  rem          t5, s4, a7
                  fadd.s       fa4, fs10, fa0, rdn
                  addi         s0, s5, -571
                  sub          s1, a3, s5
                  sub          s2, a4, a2
                  fsqrt.s      fa6, ft8
                  mulhu        s8, a0, s9
                  or           t2, t2, a5
                  ori          gp, s10, -435
                  mulhu        t2, s2, s4
                  nop
                  fmax.s       fa5, fs0, ft1
                  ori          a1, gp, -704
                  fcvt.w.s     t3, fs3
                  fsub.s       fs3, fs3, fs6, rdn
                  fmin.s       ft11, ft9, fs10
                  xori         ra, a4, 1432
                  slti         a7, t0, 848
                  nop
                  fle.s        sp, fs1, fs4
                  fmax.s       ft11, fa0, fs6
                  slli         s8, s5, 23
                  fcvt.s.w     ft1, s5
                  fmin.s       ft0, fa0, fs5
                  fsub.s       ft6, ft3, ft4, rtz
                  fdiv.s       fs5, fa4, ft2, rmm
                  fcvt.w.s     t4, fs2
                  flt.s        a5, fs10, ft8
                  fle.s        s4, fa3, ft1
                  remu         s6, s7, a2
                  mulhu        s0, t3, s10
                  srai         ra, a6, 7
                  and          tp, sp, s11
                  fmax.s       fs11, ft8, fa5
                  fsub.s       ft9, ft3, fs4
                  feq.s        t3, fs9, ft8
                  fsgnjn.s     ft0, fs0, ft10
                  fcvt.s.wu    fa2, sp
                  addi         a5, s3, 395
                  sltiu        gp, t5, 1299
                  slli         tp, a4, 31
                  sltu         t4, t4, s10
                  mulhsu       sp, s0, zero
                  fle.s        s4, ft10, ft11
                  fmv.w.x      fs7, s10
                  fsgnj.s      ft5, fa5, fa1
                  and          s5, t5, t5
                  rem          a0, t6, s4
                  slt          a0, ra, a3
                  srl          tp, t3, s8
                  slli         s1, gp, 11
                  div          a6, a3, a4
                  slt          t3, t4, s6
                  feq.s        s0, fs11, fs6
                  fsqrt.s      ft1, ft11, rmm
                  sra          t5, t0, t5
                  andi         t4, t1, 255
                  fclass.s     s3, ft7
                  sra          a1, a2, s6
                  fmul.s       fs10, fs3, ft6, rtz
                  auipc        a3, 40896
                  fsqrt.s      fs5, ft2, rmm
                  auipc        tp, 278723
                  fmv.w.x      fs10, s11
                  sltu         a2, gp, a2
                  auipc        a6, 538617
                  sub          a6, a2, sp
                  slti         s9, zero, 973
                  sra          s0, t1, a7
                  mulh         s7, s3, s5
                  auipc        s2, 450877
                  lui          s4, 884232
                  mul          s2, t3, s7
                  add          t1, s3, s3
                  srai         a2, a5, 29
                  fcvt.w.s     s8, fa7, rtz
                  fsgnjx.s     fs1, fs11, ft1
                  addi         zero, s11, -331
                  mulhsu       zero, a5, s10
                  srli         t1, a1, 10
                  fsgnjn.s     fs0, fa0, ft8
                  slti         t2, t6, -1366
                  sll          a0, s7, s3
                  fcvt.w.s     t6, ft11, rup
                  flt.s        s4, ft11, ft7
                  nop
                  addi         s7, t4, -1972
                  fsgnjn.s     fa7, ft9, fs3
                  slti         a6, a4, 816
                  fmin.s       ft6, ft6, fs8
                  fcvt.s.wu    fs6, s9
                  fcvt.s.wu    ft3, tp
                  lui          zero, 139277
                  sltiu        t3, a5, -1546
                  andi         tp, s11, -1751
                  mulh         tp, s0, s7
                  rem          s9, t0, sp
                  auipc        s1, 630060
                  fclass.s     a6, fs4
                  fmv.x.w      zero, fs10
                  sll          s0, s2, t3
                  ori          t4, a5, -1644
                  fclass.s     t5, fs5
                  auipc        gp, 1010761
                  fmin.s       fs6, fs7, ft9
                  andi         s9, tp, -1096
                  fsgnjx.s     ft0, ft1, ft5
                  fsgnj.s      fs10, fs11, fs10
                  mul          a1, a5, t1
                  fcvt.wu.s    s7, fs4
                  fcvt.wu.s    gp, fs7, rtz
                  nop
                  fclass.s     t2, fa5
                  srai         tp, a5, 15
                  flt.s        s2, fa2, fa5
                  fmul.s       fs4, fs11, ft7
                  srai         s0, t3, 19
                  nop
                  add          a6, s6, t2
                  fadd.s       fs7, ft11, fs1, rne
                  mulhsu       s0, t2, s11
                  feq.s        s4, ft11, fs8
                  srli         s3, a1, 1
                  nop
                  sltu         a0, t1, t1
                  or           a2, s3, s8
                  xor          t5, a2, a6
                  slti         sp, s8, 464
                  div          gp, a2, s8
                  mulhsu       s6, a2, s4
                  sra          t6, t5, s4
                  xor          s10, t5, t1
                  sra          s3, a1, s1
                  fsub.s       fs6, fs0, fa7, rne
                  slti         a0, t5, 473
                  addi         s6, t2, -1130
                  xor          a3, a0, t2
                  fsqrt.s      ft4, ft6
                  fsub.s       ft0, fs6, ft5, rne
                  fsub.s       ft2, fs6, ft9
                  rem          s9, a7, a4
                  fsqrt.s      ft5, fa2, rup
                  fsgnjx.s     ft3, fs0, ft7
                  fsgnjn.s     ft3, ft9, fs6
                  remu         t6, s2, t4
                  remu         s6, s8, t2
                  lui          a3, 906006
                  mulhsu       t4, s11, a3
                  fsgnjn.s     fs11, ft11, ft6
                  fmin.s       ft11, fa2, ft7
                  and          tp, zero, t4
                  fmin.s       fs3, fs11, fs7
                  slli         t2, t1, 0
                  fsgnj.s      fs2, fs4, fs1
                  fmul.s       fa1, fa6, fs10
                  auipc        a2, 1004049
                  sltu         s5, a1, a2
                  add          a3, sp, s1
                  remu         s0, a1, a3
                  add          s9, sp, gp
                  mulh         a3, t0, a6
                  remu         t1, t4, s2
                  slli         s2, s7, 10
                  fadd.s       fa5, fs9, fa3, rdn
                  fadd.s       fs1, ft9, ft1, rtz
                  mulhsu       sp, s1, s9
                  fmv.x.w      zero, fa0
                  fdiv.s       fa0, fa4, ft3
                  mulhsu       a5, t6, sp
                  xori         t3, s2, 1612
                  slt          s4, a7, s11
                  sll          t1, a7, t6
                  fsqrt.s      ft10, fs10
                  fsgnjn.s     fa3, fs0, ft3
                  xor          a6, s7, a1
                  srli         gp, t2, 25
                  addi         a0, a0, 1628
                  andi         a0, a7, -987
                  fmv.w.x      fs5, zero
                  fsgnjn.s     fs1, ft5, ft11
                  auipc        s4, 361643
                  flt.s        a0, fs11, fa3
                  andi         a3, gp, 855
                  andi         a6, s9, 1291
                  fmin.s       fa0, fs5, ft11
                  srl          s8, s11, a1
                  feq.s        t1, ft9, ft3
                  fsub.s       fs9, fs7, fa4, rup
                  sltu         s1, s10, ra
                  fmv.w.x      fs10, s10
                  fsgnjn.s     fa2, fs9, fs3
                  fmv.w.x      ft11, a4
                  or           a0, s8, tp
                  fcvt.s.w     fa4, s11
                  fmv.x.w      a1, ft0
                  fsgnj.s      ft0, ft4, fa4
                  fcvt.w.s     t3, fs4
                  sltiu        a7, s1, -1467
                  fmul.s       fs11, fa0, fa2, rtz
                  srai         tp, s7, 31
                  addi         t5, s4, -788
                  sub          tp, s0, t0
                  fmax.s       fs9, ft0, fs0
                  mulhu        t6, s9, s3
                  srli         s1, s10, 15
                  auipc        sp, 330395
                  fcvt.w.s     a6, fs11, rmm
                  slt          s9, t2, s8
                  mul          sp, s8, a3
                  fsgnj.s      fs0, ft8, fs3
                  xori         a1, a5, 1025
                  flt.s        a6, fs3, fa2
                  mulhu        t5, s7, t4
                  andi         a3, a2, 944
                  slti         s9, a1, -603
                  fsub.s       fs3, fs3, ft0, rdn
                  auipc        t6, 886908
                  fmin.s       fa3, fs7, ft6
                  andi         a0, t3, 91
                  fadd.s       ft8, fs11, fa1, rmm
                  mulhsu       a1, sp, t1
                  andi         t1, sp, -1219
                  add          a0, s11, a1
                  and          ra, s10, tp
                  ori          s6, s5, -1633
                  divu         a2, zero, t0
                  feq.s        t5, fs7, fs6
                  fsqrt.s      fa4, ft9
                  srl          s9, s2, s8
                  fmv.w.x      fa2, s2
                  fsgnjx.s     fs0, ft2, ft6
                  fsgnjn.s     ft7, fa1, fs2
                  fclass.s     t6, fs9
                  fsqrt.s      ft3, fs9, rdn
                  fadd.s       ft1, ft8, fa7
                  srli         t2, a4, 11
                  sltiu        zero, t3, 1604
                  slti         s5, a3, 969
                  slt          t3, s10, s6
                  flt.s        s4, fs1, fs6
                  div          s9, s8, s8
                  add          s10, s10, t0
                  fsgnj.s      fs6, ft2, ft11
                  fcvt.s.w     fa5, a0
                  rem          sp, a6, s10
                  fclass.s     tp, fs8
                  fmv.x.w      s7, fs0
                  fmv.x.w      a7, ft5
                  fdiv.s       ft7, fs2, ft9, rmm
                  xor          t5, s4, s5
                  sra          s10, ra, t0
                  sra          a0, ra, tp
                  fcvt.wu.s    s4, fa4, rup
                  add          t6, s8, tp
                  div          s6, a4, t2
                  fmul.s       ft10, ft1, fs7
                  or           t5, t2, sp
                  sra          t5, a6, a2
                  sltiu        sp, a7, -1499
                  flt.s        t6, ft1, fa5
                  flt.s        t6, fa3, fs8
                  add          t6, gp, s6
                  fmin.s       fs10, fa0, fa5
                  fcvt.s.wu    fs5, s7
                  or           t3, s4, s9
                  andi         t3, s4, 1190
                  fmv.w.x      ft1, a7
                  div          t3, sp, t0
                  addi         s3, t6, 718
                  sltiu        t3, t1, -1002
                  fmul.s       fs11, ft0, ft10, rne
                  ori          sp, s1, -1005
                  fadd.s       fa0, fa7, ft5
                  auipc        s6, 802610
                  fmul.s       fa4, fs1, ft9, rtz
                  sub          s5, t0, s9
                  sll          ra, a5, t2
                  sll          t4, t5, tp
                  mulhu        gp, s1, a1
                  or           s3, s8, s2
                  fcvt.wu.s    s9, ft10
                  fsgnjx.s     fa5, fa6, fa7
                  mulhsu       t5, a0, a5
                  fmv.w.x      ft11, t3
                  mulh         s6, s11, s5
                  srl          sp, s8, zero
                  mulhsu       sp, s2, s5
                  rem          s8, s5, t6
                  slt          s0, zero, a1
                  or           a7, t6, s5
                  fmv.x.w      a3, fa7
                  mulhu        a7, a0, s9
                  fcvt.w.s     a0, fs6, rne
                  divu         t4, t4, t5
                  mulhu        s8, s10, a5
                  fmin.s       fs1, ft5, ft4
                  fle.s        t5, ft7, fa1
                  fmul.s       ft3, fs9, fa3
                  fsgnjn.s     ft5, ft5, ft5
                  slt          t5, a0, t0
                  sub          s8, s11, s6
                  sub          zero, s6, s4
                  mulh         s9, a0, a6
                  feq.s        s7, ft5, ft9
                  remu         a2, s7, t0
                  add          s2, zero, a1
                  fsub.s       fa1, ft5, fa7
                  fmin.s       fs3, ft7, fs3
                  sll          s10, t5, s11
                  fmv.w.x      fs4, s2
                  fmax.s       fa1, fs1, ft0
                  remu         a3, ra, a7
                  sll          gp, sp, t5
                  fdiv.s       ft8, fa4, ft9
                  fsgnjx.s     fa5, fa4, ft8
                  fmv.x.w      s8, ft7
                  fmin.s       fs0, ft5, fa1
                  fadd.s       ft6, ft6, fa7, rmm
                  mulhu        t5, s5, t2
                  nop
                  fmv.x.w      ra, fa2
                  fcvt.s.wu    ft2, t1, rdn
                  feq.s        s3, ft11, fs3
                  srl          s0, t2, s3
                  mul          a2, t5, t4
                  remu         s7, a1, a3
                  addi         s3, tp, 1007
                  flt.s        s7, ft3, fs2
                  fcvt.s.w     fs8, s7, rup
                  divu         s6, s10, a6
                  fadd.s       ft5, fa2, fs9, rtz
                  fcvt.s.w     ft10, a3
                  mulhu        sp, s9, tp
                  slti         zero, a3, -820
                  srai         s7, s4, 19
                  mulh         t6, a3, a2
                  fcvt.w.s     a0, ft5, rmm
                  div          a3, gp, s0
                  fmul.s       ft0, ft3, ft9, rtz
                  sll          tp, t2, t6
                  divu         s0, a3, t6
                  xor          tp, s7, t0
                  sll          a7, s2, tp
                  fcvt.s.wu    ft2, s2
                  mul          a1, s4, a6
                  srai         s4, s1, 7
                  slt          zero, a3, s9
                  flt.s        s0, ft7, fa7
                  srai         s5, s0, 27
                  srai         tp, s7, 26
                  lui          ra, 564736
                  fdiv.s       fs1, ft1, fs11
                  fadd.s       fa2, fs11, fa0
                  fadd.s       fs11, fs9, fs2
                  fsgnj.s      fa1, fa1, fs6
                  divu         s0, s4, t2
                  fcvt.s.wu    fs6, s8
                  add          gp, s1, s8
                  sub          t1, s8, tp
                  slti         t1, ra, -1018
                  or           s5, s6, s6
                  fsgnjn.s     fs7, fa6, fs6
                  fle.s        t5, ft0, fa7
                  rem          s9, s7, a1
                  mulhu        s6, ra, s9
                  fmul.s       fs10, fa6, fs0, rup
                  slti         t4, s2, 1704
                  fmv.x.w      t3, fa4
                  fmax.s       ft1, ft11, fa5
                  fcvt.s.w     ft2, s10, rup
                  or           a2, s4, tp
                  fadd.s       fa0, ft3, fs9
                  fmin.s       fa6, fa3, ft7
                  fmax.s       ft5, fs1, ft7
                  nop
                  fsgnj.s      fa5, fa6, ft4
                  fsub.s       ft8, fa4, ft0, rtz
                  nop
                  sltiu        s2, s1, -671
                  or           t6, s0, t5
                  fmv.x.w      s7, fs1
                  fcvt.s.wu    ft11, s8, rmm
                  div          s9, s4, s3
                  sub          s5, s10, a7
                  fcvt.w.s     s9, fa6, rup
                  addi         sp, a0, -334
                  fsgnj.s      fa7, ft6, fs7
                  fcvt.s.wu    ft10, t0, rtz
                  nop
                  fclass.s     zero, fs3
                  fmul.s       ft11, fs7, fs0
                  sltiu        s9, tp, 430
                  fsgnjn.s     ft8, fs1, ft7
                  fsgnjn.s     ft3, fa6, fs1
                  sltiu        gp, sp, -669
                  fcvt.s.w     fs1, s1
                  remu         t5, s7, gp
                  sltiu        a6, s6, 950
                  fmul.s       fa5, fa5, ft1
                  flt.s        t2, fa4, ft6
                  xori         tp, a6, -1392
                  fsgnjn.s     ft10, ft8, fs5
                  mul          gp, t2, t0
                  mul          s4, t0, s11
                  andi         s1, a7, -1210
                  fdiv.s       fa5, ft2, fa1
                  fmul.s       fa4, fa4, ft4, rdn
                  add          a6, t4, a3
                  fcvt.s.w     fs6, s10, rdn
                  fclass.s     s4, fa0
                  fcvt.w.s     sp, fa1, rne
                  fmax.s       ft0, ft6, fs3
                  sll          s8, s11, t5
                  divu         t3, s2, s0
                  fsgnjx.s     ft5, ft2, fa7
                  fmv.x.w      s3, ft1
                  mulhu        gp, zero, a3
                  fle.s        t1, fs5, fs1
                  fmul.s       fa5, fa4, ft3, rmm
                  fmul.s       fa7, fs3, fa0, rup
                  slt          a2, a1, t3
                  fmax.s       fa2, fs8, ft1
                  mulhsu       ra, sp, a2
                  srl          a3, t2, a1
                  srli         s10, t4, 1
                  addi         a2, a5, 904
                  and          t4, s0, a1
                  fadd.s       fs3, fs2, ft1, rdn
                  fmul.s       fa4, ft10, ft11
                  and          t1, s7, a3
                  srl          t1, s8, s3
                  fmv.w.x      ft6, t3
                  andi         zero, a0, -371
                  sra          s2, a0, a4
                  and          t2, t1, a6
                  fle.s        t2, fs11, ft6
                  remu         s4, zero, s8
                  fcvt.wu.s    s9, fs4, rmm
                  mul          s0, sp, t4
                  mul          zero, s1, t5
                  xor          s1, t1, s4
                  ori          t6, s2, -1129
                  sltu         s1, a0, s3
                  feq.s        s7, ft9, ft0
                  andi         s7, tp, -190
                  sub          s10, t3, a5
                  fmax.s       fs6, ft6, fa6
                  rem          s9, t5, s2
                  feq.s        t5, fs0, ft1
                  fsgnjn.s     fa6, ft10, ft11
                  fmax.s       ft5, ft1, fs2
                  remu         s2, t1, t6
                  fcvt.w.s     t3, fa1, rup
                  fcvt.w.s     gp, fs0, rup
                  fsgnjn.s     fs4, ft6, ft0
                  and          zero, s7, s10
                  fsqrt.s      ft5, fs11, rup
                  mul          sp, s0, a3
                  fcvt.wu.s    s7, fs8, rup
                  fsgnjx.s     fs10, fa0, ft3
                  sltiu        s4, s10, 1838
                  andi         gp, s6, 88
                  lui          a1, 1004687
                  fcvt.s.w     fs9, s8, rmm
                  or           s1, a6, ra
                  fcvt.w.s     s9, fs3
                  fcvt.s.wu    ft6, t6, rtz
                  add          a7, s11, s2
                  auipc        s3, 657760
                  slti         ra, a4, 735
                  srl          t2, a6, s5
                  feq.s        a3, fs7, ft4
                  slt          s4, a3, t1
                  mulhsu       a3, tp, a4
                  slli         s4, s5, 13
                  fsgnj.s      ft8, ft4, fs8
                  fcvt.s.w     fs1, a7, rmm
                  fmv.x.w      sp, ft4
                  divu         s0, a5, a2
                  nop
                  or           t5, s0, a6
                  lui          a1, 5030
                  sra          s8, s0, a1
                  fdiv.s       fs8, fs8, fs9
                  xor          t4, s8, t4
                  slt          t2, s6, a1
                  fdiv.s       ft4, fs11, fa3, rup
                  fle.s        t1, fa0, fs6
                  fcvt.wu.s    ra, fs0
                  srli         t6, a5, 24
                  fclass.s     a5, fs3
                  xor          a6, t6, sp
                  slt          a7, a5, s0
                  lui          s0, 378946
                  remu         a2, gp, s0
                  and          t4, a1, t1
                  fmv.w.x      ft2, s9
                  srai         s3, a5, 11
                  fcvt.s.wu    fs3, a0
                  sub          tp, t5, s10
                  fsqrt.s      fs4, fs5
                  fmul.s       ft9, ft9, ft11
                  fsub.s       fa3, fs9, fs0, rmm
                  fcvt.s.w     fa6, tp, rne
                  fmin.s       fs0, fs1, fs3
                  fsgnj.s      fa4, ft3, fs3
                  srli         t2, s7, 1
                  fcvt.s.w     fs3, a3, rtz
                  slli         tp, s11, 8
                  fmin.s       ft8, fs7, fs6
                  fcvt.s.wu    ft8, a2, rup
                  slt          tp, s4, a0
                  flt.s        a3, fs10, fa4
                  mulhu        t1, s8, a7
                  xor          s4, s5, gp
                  remu         t3, sp, tp
                  fmul.s       ft0, fa1, fs5, rtz
                  fdiv.s       ft8, fs6, ft2
                  fmin.s       ft9, ft1, fs3
                  fclass.s     a6, fa4
                  mulh         a2, s4, s2
                  add          a0, a1, a2
                  and          t1, a6, s7
                  sltu         a3, t0, s7
                  auipc        s9, 166878
                  add          sp, a6, t4
                  feq.s        s0, fs3, fa0
                  fmin.s       fs7, fa1, fa6
                  fsqrt.s      ft2, fa2, rne
                  fsgnjx.s     fs2, fs3, fs3
                  fsgnjn.s     fa4, fa0, ft11
                  srai         s2, tp, 26
                  mulhu        a5, s4, a5
                  fcvt.s.w     fs5, tp
                  sltiu        s10, s7, 1145
                  fsqrt.s      ft8, ft7, rne
                  slli         s1, s4, 1
                  slli         a5, a2, 20
                  sll          s10, a6, s1
                  remu         s10, s7, s9
                  fsgnjx.s     fa3, fs11, ft11
                  fsgnjx.s     ft8, ft9, ft10
                  srl          a1, s9, a7
                  xor          t6, t5, s1
                  srl          s9, a6, t4
                  ori          t2, s3, -1986
                  fsqrt.s      fa0, fa0
                  xori         s4, s5, 941
                  fmul.s       fs9, ft10, ft1, rdn
                  fsgnjx.s     fa7, fs4, fa3
                  fclass.s     s5, fs0
                  addi         tp, s4, 272
                  fdiv.s       ft11, fa3, ft8, rne
                  slli         a5, s4, 20
                  slti         ra, s7, 626
                  ori          s1, s10, 1351
                  fsgnjx.s     fs1, fs4, fs3
                  xor          t5, a3, s1
                  sltu         s1, sp, t4
                  divu         s6, a0, gp
                  srli         t2, ra, 4
                  or           a5, a5, t3
                  fmin.s       ft5, fa6, fs1
                  addi         a6, a0, 361
                  mul          a2, s7, a5
                  add          ra, s2, t3
                  mulhu        a2, s5, a6
                  slli         t4, s11, 2
                  ori          a7, s5, 1249
                  mulhu        s2, tp, t1
                  mul          a2, s4, t5
                  srl          s7, a4, t4
                  mulh         a0, s8, t5
                  xor          gp, a5, a0
                  fcvt.w.s     s8, fs0
                  sra          t2, gp, zero
                  div          s3, t6, a3
                  remu         s2, t6, s5
                  or           a3, a3, a7
                  and          s0, s4, tp
                  fsub.s       ft2, fs0, ft2, rdn
                  fmin.s       fs6, fs7, fs0
                  mulhu        tp, t5, ra
                  sltu         ra, s5, s9
                  fsgnj.s      ft4, fa7, fs5
                  add          s0, t4, s6
                  ori          s5, a3, -1876
                  lui          s6, 741114
                  sltiu        a2, a4, -1707
                  fadd.s       fa5, fa2, ft1
                  rem          a0, a6, s3
                  fsgnjn.s     ft5, fs9, fs9
                  nop
                  nop
                  and          a5, s10, t0
                  and          a3, sp, s8
                  mulhsu       s1, t3, s3
                  sub          s2, s8, s1
                  fsgnjx.s     fs5, fa4, fs6
                  nop
                  nop
                  fcvt.s.w     fs4, ra
                  ori          a1, t4, 1456
                  auipc        t1, 851436
                  fle.s        zero, fa3, fs0
                  nop
                  fcvt.s.wu    fs1, s7
                  fmv.x.w      t5, fs11
                  slli         s1, s7, 9
                  andi         s2, s2, 1406
                  fcvt.s.w     fs10, t3, rmm
                  fcvt.s.w     ft11, tp
                  feq.s        a6, fa3, fs9
                  fsqrt.s      ft1, ft5
                  sll          a1, t6, t4
                  slt          t5, s9, t4
                  fsgnjn.s     ft4, ft0, ft0
                  fsgnjn.s     ft5, fa0, fs0
                  fdiv.s       fa4, ft0, fa1
                  slt          s7, a2, t4
                  slli         s8, gp, 23
                  sra          s4, s0, s2
                  srli         s6, s5, 11
                  srli         a5, a6, 26
                  slti         t2, a3, -1157
                  mulhu        t1, s4, a7
                  fcvt.s.w     ft3, t3, rne
                  fcvt.w.s     gp, ft11
                  fle.s        gp, ft3, fs6
                  feq.s        a6, ft6, fa1
                  slti         tp, t1, -1712
                  mulh         gp, a1, a6
                  fle.s        s8, fs2, ft11
                  srli         t2, a3, 7
                  mulhsu       s6, gp, t2
                  div          a1, a4, s8
                  feq.s        zero, fs0, fs6
                  fmul.s       fa0, fs9, ft1, rne
                  feq.s        s7, fs8, ft4
                  fcvt.s.wu    ft0, s4, rne
                  xor          t2, a0, sp
                  addi         a0, s9, 780
                  fle.s        tp, fa5, fs2
                  add          s3, t4, t0
                  srl          a7, a6, t5
                  fsgnjn.s     ft9, ft0, fs9
                  sll          s3, tp, a2
                  mulhu        s3, s4, zero
                  srai         s9, s10, 27
                  slti         s8, a7, -1324
                  flt.s        a0, ft9, ft4
                  slti         t1, s0, 111
                  fmv.x.w      a6, ft2
                  fcvt.wu.s    t4, ft10, rup
                  mul          s8, a7, s5
                  ori          a0, zero, -440
                  srl          t4, a3, t1
                  fsqrt.s      ft9, ft11
                  fsgnj.s      ft7, fs8, fs5
                  fle.s        a6, fs10, ft5
                  and          a6, s5, a2
                  fmin.s       fa0, fa5, ft7
                  xori         a1, a4, -944
                  sra          sp, s8, s0
                  fmv.w.x      fs5, t4
                  remu         gp, s2, s9
                  srai         zero, s10, 27
                  fcvt.wu.s    s7, ft5
                  sra          t4, t2, s6
                  fcvt.wu.s    a7, fs2, rtz
                  div          s6, s1, t2
                  mulhu        a2, s0, s10
                  sltiu        s8, s10, 1572
                  sra          s4, s1, zero
                  rem          a2, a0, a5
                  remu         s8, a1, a3
                  ori          ra, t5, -849
                  fdiv.s       fs7, ft5, fs7, rmm
                  add          a6, s8, a1
                  fmax.s       fa5, fs4, fa7
                  sub          s3, s5, s7
                  feq.s        a2, fa7, ft11
                  fsgnjn.s     fs8, ft9, fa5
                  fcvt.s.w     fa7, a5, rne
                  remu         a1, s5, gp
                  fsub.s       fs1, fa6, fs0, rdn
                  slli         t3, ra, 8
                  rem          s7, a5, s6
                  fmv.w.x      ft4, s5
                  fsgnj.s      fs5, ft11, ft0
                  sub          s0, s4, t1
                  nop
                  fsgnjx.s     ft4, fa4, fs5
                  fle.s        s0, fs9, ft1
                  flt.s        a5, fs6, fs6
                  fmv.w.x      fa1, a1
                  fsub.s       fa7, fs8, fs11
                  ori          s2, a6, 52
                  fmv.x.w      s4, fs5
                  sub          a2, tp, a3
                  addi         a7, a4, -1488
                  fsqrt.s      fa7, ft3
                  mul          sp, t0, t0
                  fsgnjx.s     ft4, fs3, ft4
                  sltu         a2, t2, s10
                  flt.s        t3, fs0, fa3
                  sra          s5, t3, t5
                  xori         a1, s0, 1561
                  fdiv.s       fa2, ft1, fs2, rup
                  srli         a7, s4, 24
                  feq.s        t5, fs8, ft11
                  srai         gp, a5, 29
                  ori          t1, s0, 1620
                  slt          sp, s1, s11
                  add          ra, a1, sp
                  xori         a7, s6, 663
                  fmul.s       fa2, ft2, ft0, rdn
                  slt          t5, s5, s6
                  auipc        a1, 413354
                  fle.s        t2, fs4, fs5
                  rem          s9, a2, s11
                  fadd.s       fs3, fs7, ft6
                  andi         zero, s11, -1578
                  or           gp, s10, a0
                  fle.s        t4, fs1, fs7
                  divu         s4, a6, s9
                  fsub.s       fs4, fs7, ft4
                  feq.s        s8, fa7, ft7
                  fcvt.s.w     ft11, ra, rdn
                  divu         ra, t3, a3
                  fmv.x.w      ra, fa3
                  fcvt.wu.s    s5, fs1
                  or           s9, s1, a1
                  and          a6, t1, a0
                  ori          sp, t1, -529
                  fmv.x.w      s2, fa2
                  mul          s1, s4, sp
                  rem          t3, t4, s11
                  fcvt.wu.s    t5, fs11, rmm
                  mulhsu       sp, a7, s3
                  or           t6, t0, s8
                  mulhsu       s9, t4, s1
                  fmv.x.w      a1, ft1
                  sra          s0, t2, gp
                  mul          a1, a4, s11
                  divu         s0, a4, gp
                  srli         s8, s10, 5
                  lui          s2, 880106
                  fcvt.s.wu    ft9, s7
                  srl          zero, t2, a2
                  fmax.s       fs7, ft11, ft9
                  fcvt.w.s     s10, fs2
                  rem          s9, a2, ra
                  fmv.w.x      ft2, a2
                  fcvt.w.s     t1, fs10, rup
                  fmv.x.w      s10, fs8
                  srl          t3, t0, ra
                  srai         a5, s10, 26
                  divu         t1, sp, sp
                  flt.s        t6, fs1, fs2
                  xori         s8, s3, 1409
                  fsgnjn.s     fs8, fa4, fa4
                  fcvt.s.w     ft2, s4, rdn
                  or           a2, a2, a0
                  flt.s        t3, fa0, fs9
                  mul          zero, t1, a3
                  feq.s        s10, fa4, ft7
                  ori          a3, s2, 1888
                  fmv.w.x      fs0, s8
                  sll          s6, s9, t6
                  fcvt.s.w     fs6, t4
                  and          a1, t1, ra
                  fcvt.s.w     fs3, a1, rne
                  div          tp, t5, a0
                  remu         a7, s2, t4
                  remu         s4, a5, a5
                  xori         a6, t1, -210
                  or           t4, sp, t2
                  fcvt.w.s     s0, ft10
                  fcvt.wu.s    s0, fa2
                  feq.s        s9, fa1, fs0
                  and          t2, a2, a2
                  fmin.s       ft10, ft0, fs5
                  fmax.s       fa6, ft3, fs1
                  sltiu        a2, t2, -728
                  or           a0, s7, s6
                  sub          a6, s6, s3
                  sra          t6, a4, t5
                  sra          s1, s7, a7
                  srl          ra, s1, a4
                  xor          gp, s0, s8
                  fsgnj.s      ft11, fa2, fa6
                  mul          t6, zero, s4
                  or           sp, s2, gp
                  fmv.x.w      t1, fs5
                  fcvt.wu.s    sp, fs2, rtz
                  slli         s6, a5, 27
                  sll          ra, s0, t3
                  remu         t4, a0, s6
                  nop
                  slti         s1, s3, -238
                  fclass.s     s4, fs3
                  remu         s9, gp, a0
                  fsgnj.s      fs0, fa3, ft6
                  div          tp, t6, s2
                  sra          a2, s2, a7
                  fcvt.wu.s    t1, fs6
                  div          s8, a4, a5
                  divu         s8, a4, tp
                  sra          t4, s9, s4
                  fmv.w.x      fa0, s9
                  rem          s10, tp, t3
                  fmv.x.w      t4, ft7
                  mul          a3, tp, s11
                  fsgnj.s      ft8, fa6, ft1
                  fmv.w.x      fa1, t1
                  slli         t5, zero, 21
                  sll          t6, a1, s11
                  fsqrt.s      fs2, ft10
                  slli         a2, t4, 10
                  fmax.s       ft7, fa4, fs8
                  fsgnj.s      fa1, fs9, fa7
                  fsqrt.s      fs4, ft3, rdn
                  nop
                  sll          t5, a0, s8
                  fmin.s       fa2, ft4, fs6
                  fcvt.s.wu    fs5, tp
                  fmul.s       fa0, ft3, fa3, rmm
                  fmv.x.w      ra, ft6
                  fle.s        s10, fs5, ft9
                  nop
                  srai         s6, s10, 18
                  auipc        s3, 629876
                  fmax.s       ft3, fs6, ft8
                  andi         s9, a5, 165
                  fcvt.s.wu    ft4, s5
                  srli         a1, s7, 11
                  fsub.s       ft3, fa6, ft3
                  fcvt.w.s     a6, ft11
                  fsgnjn.s     fs3, fs8, fs3
                  fdiv.s       fs5, fa6, fa4
                  fcvt.s.w     fs10, t3
                  fclass.s     ra, fs11
                  fdiv.s       ft9, fs1, fa3
                  xor          s9, t6, sp
                  mulhu        t4, a5, ra
                  lui          a7, 653604
                  fmv.w.x      fs8, a2
                  mulh         a2, t6, s1
                  andi         t3, a4, 913
                  mulhu        a3, a0, t2
                  mulh         a5, zero, a4
                  fsgnj.s      ft11, ft8, ft10
                  fcvt.s.wu    fs2, a3, rmm
                  fcvt.w.s     zero, fa1
                  addi         t5, t2, -1076
                  fsub.s       fs6, fs2, ft7, rtz
                  or           t2, s3, s3
                  fmul.s       fa4, ft7, fa0
                  nop
                  sra          a3, s8, s1
                  addi         s6, t1, 1615
                  fmin.s       fa1, fa6, fa2
                  srli         sp, s10, 1
                  srli         t5, a6, 29
                  nop
                  fcvt.wu.s    s3, ft7
                  div          zero, s7, a2
                  and          tp, a2, t5
                  fsub.s       fa6, ft0, fs6, rdn
                  fcvt.wu.s    s9, fs5
                  srli         t1, s10, 8
                  fcvt.w.s     t3, fa7
                  fsgnjn.s     fa1, fs5, fs10
                  remu         t5, s1, a7
                  lui          t6, 35305
                  slt          a2, a1, s0
                  mulhsu       s6, a4, s2
                  fmin.s       fs4, ft3, fa0
                  xori         t3, s6, -1060
                  srli         s3, gp, 1
                  fmv.w.x      ft4, s10
                  fsqrt.s      fs10, fa4, rdn
                  flt.s        t4, fs6, fs0
                  divu         ra, t6, s5
                  and          a0, t4, s11
                  slli         s0, t5, 4
                  mulhu        a6, a5, t4
                  xori         a7, ra, -609
                  divu         s3, s5, t0
                  fmin.s       fs11, ft11, ft8
                  sub          s9, gp, s0
                  fsub.s       ft3, ft2, fs3
                  fsgnjx.s     ft0, fs8, ft2
                  fclass.s     sp, fa1
                  rem          s6, s6, t1
                  fadd.s       ft2, ft5, fs11, rup
                  fmax.s       fs1, fs2, fa0
                  remu         s7, s9, s8
                  fclass.s     t2, fa1
                  feq.s        s2, fs0, fs3
                  mulhu        t6, s5, s10
                  fsgnj.s      fs11, fa7, fs3
                  or           a7, t4, a4
                  auipc        gp, 40074
                  slti         s8, a3, 299
                  fsqrt.s      ft9, ft3
                  lui          ra, 836682
                  fsqrt.s      fs7, fs4
                  sltiu        t6, s0, 1514
                  fmv.x.w      a0, ft9
                  sra          a0, s1, a2
                  srli         s7, s10, 18
                  mulhu        s9, a2, t3
                  div          s10, s7, s8
                  fmv.x.w      a6, fa6
                  fle.s        s4, fa0, fa0
                  rem          a5, t3, t4
                  fmul.s       fa5, ft3, fa5
                  remu         t3, t6, t0
                  srli         t5, s5, 10
                  srl          t3, t3, a5
                  addi         s2, t6, -1801
                  sltiu        s9, a7, -1496
                  rem          tp, a6, t1
                  rem          a2, sp, s8
                  fsub.s       ft10, fs7, ft4
                  fmul.s       fs2, fs5, ft2
                  divu         t1, s6, t0
                  mulh         a0, s3, t0
                  fsgnj.s      fs3, fa0, fa0
                  add          s1, s3, a1
                  sltiu        t5, t1, -182
                  fsub.s       fa7, fs2, fs8
                  xor          s6, s5, gp
                  lui          a5, 25345
                  divu         s7, t1, t3
                  fsgnjx.s     fs0, fs0, fa4
                  andi         t4, t6, 1207
                  mulhsu       t5, s4, a3
                  andi         ra, s11, 1034
                  srai         a2, s2, 15
                  fcvt.s.w     ft0, t2
                  fcvt.wu.s    s8, fa3, rmm
                  fcvt.wu.s    gp, fa7
                  slti         s1, s1, -646
                  slt          a3, t0, a1
                  srl          s4, sp, s1
                  fsub.s       fs5, fs1, ft11
                  mul          s10, t6, gp
                  srl          s9, s1, s3
                  mulh         t5, s2, t4
                  and          zero, tp, t6
                  fsub.s       fs6, fa5, fs5, rup
                  fcvt.wu.s    a3, fa3, rne
                  and          t5, s3, s9
                  add          t3, s6, a6
                  fcvt.wu.s    a2, ft10, rtz
                  fmin.s       ft6, ft1, fa2
                  fsgnjx.s     fa4, fa7, fs3
                  sltu         s4, s8, a3
                  slt          s5, t0, s1
                  fmin.s       fa2, fs10, fs5
                  slt          s5, s6, zero
                  fdiv.s       fs4, fa2, fs0, rup
                  slt          s8, s10, a5
                  addi         a0, t6, 1965
                  remu         gp, s0, t6
                  flt.s        gp, fs0, fs2
                  fmv.x.w      s8, fa3
                  srl          t3, s0, zero
                  or           s8, s9, a7
                  fcvt.w.s     s4, ft0
                  addi         a5, s8, -1991
                  sltiu        t5, s8, 127
                  and          t1, gp, s7
                  fmul.s       fs2, ft9, ft2
                  lui          t6, 910868
                  fmin.s       fa1, fs10, ft4
                  xor          gp, a0, a1
                  fmax.s       ft5, fs4, fa2
                  fcvt.s.w     fs7, a2, rdn
                  fmin.s       ft5, fs1, fs7
                  add          t4, a7, s3
                  fmin.s       fs10, ft1, fs5
                  fcvt.s.wu    fs1, a0
                  auipc        s6, 417113
                  fclass.s     a5, ft2
                  and          sp, s10, s2
                  divu         zero, a6, sp
                  fclass.s     s6, fa7
                  sltu         a3, s8, a4
                  divu         a6, s8, zero
                  div          s1, t3, s5
                  mulh         a6, tp, t5
                  fcvt.w.s     s9, fs6, rup
                  and          s3, s7, t5
                  addi         t2, s11, -31
                  sltu         t3, a3, s5
                  sra          t2, t5, s3
                  nop
                  fmul.s       fs3, ft8, fa6, rmm
                  slti         ra, a0, 2001
                  divu         t6, t1, t2
                  fclass.s     zero, fs8
                  flt.s        t5, fs3, ft2
                  srli         t6, s11, 17
                  fcvt.w.s     a1, fs5, rup
                  nop
                  auipc        t3, 1044021
                  andi         s4, ra, -786
                  mul          a2, t0, sp
                  sltiu        a1, s10, -565
                  div          a6, a2, s5
                  and          s7, s5, s2
                  fmul.s       ft2, ft1, fs7, rne
                  div          a2, a3, t0
                  ori          s3, s8, 947
                  flt.s        s3, ft4, fs3
                  sub          a2, s3, gp
                  lui          a0, 453951
                  ori          t3, s5, 1507
                  add          a2, s6, a6
                  mulhsu       s8, s7, s7
                  mulhsu       t2, t3, a7
                  slti         t4, a6, 708
                  fclass.s     t1, ft8
                  fmin.s       fa3, ft3, fs9
                  sub          a5, s10, t1
                  fle.s        t4, fs6, fa2
                  srli         a6, s4, 11
                  fclass.s     a6, ft11
                  srai         s8, sp, 29
                  sra          s8, a1, s3
                  sub          t2, a3, t4
                  add          a0, a5, s10
                  ori          zero, ra, 1080
                  srli         a6, a2, 31
                  sub          s10, t5, a6
                  remu         a2, s9, s7
                  fcvt.w.s     a3, ft11
                  fcvt.s.wu    fs11, t0, rmm
                  add          s1, sp, a3
                  fsub.s       fa6, fs11, fs9
                  sltiu        a3, a7, -616
                  fcvt.w.s     t6, ft6, rmm
                  add          s0, a1, zero
                  fcvt.s.wu    fs10, t0, rtz
                  mulh         tp, s7, sp
                  fsub.s       fa5, fa5, fa4
                  sltiu        s5, a2, -1746
                  sra          t1, t4, ra
                  sll          a2, s10, sp
                  sll          t3, a4, a2
                  feq.s        s7, ft0, ft8
                  mul          t2, a3, a7
                  fmin.s       fa4, ft6, ft6
                  fsub.s       fs1, fs0, ft9, rmm
                  fsgnjx.s     fa5, fs1, ft1
                  remu         a2, s3, a7
                  sltiu        a0, s1, -1454
                  sra          s3, t0, s1
                  fmax.s       ft7, ft2, fa5
                  fmul.s       fs11, ft5, ft7, rne
                  fsqrt.s      ft0, fs4, rmm
                  fcvt.s.w     fs7, a6, rdn
                  feq.s        a0, fs8, ft5
                  mulhsu       s10, s8, t2
                  div          a7, a6, t1
                  divu         t3, s11, s1
                  remu         t5, t5, s0
                  fsgnjx.s     fs11, fs3, ft10
                  slli         zero, s4, 16
                  fmax.s       fs2, fs5, fa5
                  srl          a5, t1, s1
                  divu         s3, a3, a6
                  auipc        s5, 261211
                  fclass.s     t6, ft4
                  slti         a5, a2, -847
                  fsgnjx.s     ft4, fa2, fa4
                  slli         s1, t4, 15
                  andi         sp, zero, -437
                  ori          a5, t6, 1906
                  fmul.s       fa7, fs10, ft6, rmm
                  xori         a0, t3, 2033
                  xori         a2, s7, -285
                  rem          s2, s11, t4
                  fmv.x.w      s8, ft10
                  fdiv.s       ft7, fs3, fa7, rtz
                  fmul.s       fa7, fa5, ft3, rdn
                  srli         t6, gp, 1
                  mulh         t3, zero, gp
                  mul          s1, t1, s2
                  fmax.s       fs10, fa2, ft2
                  fsgnjx.s     fs6, ft9, ft7
                  feq.s        s7, fa0, ft9
                  mul          tp, tp, t0
                  xor          t4, s11, s3
                  slli         t6, t4, 7
                  fcvt.s.wu    ft0, s9
                  fclass.s     a5, fs4
                  auipc        t6, 896611
                  sra          t1, a4, s3
                  fsgnjx.s     ft0, ft10, fa7
                  and          t5, ra, a6
                  fmv.w.x      fs8, gp
                  nop
                  srai         t5, t6, 26
                  fmv.x.w      a3, fs2
                  fcvt.w.s     s0, fa5, rdn
                  fclass.s     a2, ft0
                  fsgnjx.s     fa6, ft10, fa4
                  lui          s0, 902930
                  xor          a2, s8, s1
                  slti         s5, a7, 983
                  sltu         zero, sp, gp
                  srl          t1, t6, s4
                  fsqrt.s      ft3, fa3, rmm
                  fle.s        a2, fs7, fa3
                  fcvt.w.s     a2, fa4, rup
                  flt.s        a2, fs0, ft11
                  fsgnj.s      ft8, fs6, ft8
                  lui          s9, 319177
                  fdiv.s       fa5, fs1, fs0
                  fmin.s       ft1, fa0, fa7
                  fsqrt.s      fa4, ft9, rmm
                  remu         a0, s2, s0
                  xor          sp, t4, s11
                  fsgnj.s      fs7, ft8, ft11
                  fmul.s       ft1, fa2, fs3, rmm
                  fmax.s       fs6, fa3, fa6
                  fsgnj.s      fa2, fs7, fa6
                  fsqrt.s      fa2, fa1, rmm
                  fcvt.s.wu    fs0, t5, rmm
                  fmv.x.w      s2, fa3
                  sub          gp, t4, t6
                  div          t6, s0, a1
                  mulhsu       s3, a6, t6
                  mulh         s10, tp, t4
                  auipc        s0, 757583
                  addi         s7, tp, -395
                  fcvt.s.w     ft10, s9
                  addi         a7, s7, -1571
                  ori          tp, t6, 219
                  srai         tp, a0, 15
                  srli         a5, s10, 24
                  div          t2, a4, sp
                  fcvt.w.s     a1, ft3, rmm
                  fcvt.w.s     s6, fs11
                  rem          s9, s4, s9
                  fle.s        s4, ft2, fs5
                  mulh         s5, t6, s8
                  ori          a1, sp, 1194
                  slti         gp, t3, -1374
                  fsgnj.s      fa2, ft2, fa7
                  fcvt.s.w     ft1, tp
                  sra          s8, a6, s0
                  remu         a0, ra, tp
                  xor          s10, s0, s4
                  fsqrt.s      fs2, ft9, rdn
                  mul          zero, s4, t6
                  slti         s4, a2, 883
                  fmax.s       fs6, fs6, ft1
                  fmax.s       ft10, ft10, ft5
                  fsgnj.s      ft8, fa2, fs1
                  fle.s        a3, fa4, fs8
                  sltiu        gp, a4, -2024
                  lui          s2, 374831
                  div          s0, s3, t3
                  fadd.s       ft9, ft10, fs4
                  sra          t3, s5, t2
                  fmul.s       fa1, fa1, fs9
                  addi         sp, s5, -728
                  divu         s6, sp, s0
                  sltiu        sp, s6, 492
                  fadd.s       fa6, ft1, fs1, rup
                  fcvt.wu.s    a5, ft11
                  fcvt.s.wu    ft0, s7, rmm
                  srli         sp, t1, 26
                  sltiu        a5, a3, 1186
                  srl          s10, tp, gp
                  nop
                  rem          s6, gp, s5
                  nop
                  ori          zero, t4, 537
                  divu         s7, t2, t2
                  nop
                  fsqrt.s      fa1, ft1
                  fle.s        ra, fs4, fs11
                  srl          s6, s3, s4
                  sub          ra, t0, t4
                  mul          tp, s10, a0
                  sltu         a1, a1, s2
                  xori         t4, zero, -592
                  fdiv.s       fs0, fa6, ft5, rne
                  flt.s        s5, fs2, ft4
                  sra          gp, s5, t5
                  fmul.s       ft0, ft7, ft7, rtz
                  xor          a3, t0, a2
                  mulhu        s10, a0, s6
                  mulhsu       t6, s11, a7
                  mulhsu       s0, a1, t3
                  fcvt.w.s     s4, fs7
                  sll          a1, s5, s0
                  fmv.w.x      fs9, a1
                  andi         gp, t1, -1787
                  fadd.s       ft0, fs8, fs6
                  fmv.w.x      ft7, a0
                  fsqrt.s      fs9, ft4, rne
                  fmv.x.w      s7, fs11
                  fle.s        s0, ft7, ft10
                  addi         t1, s4, -1912
                  xor          t4, a7, s1
                  flt.s        ra, fs6, fa3
                  sra          a5, s3, s1
                  remu         a0, t4, zero
                  fadd.s       fa4, fa7, fs1, rtz
                  rem          s0, a2, s2
                  remu         s2, s3, a7
                  auipc        a2, 181133
                  mulhu        s4, s8, t3
                  fadd.s       fa2, ft3, ft4
                  and          s1, s10, t5
                  xori         a1, t5, 611
                  sltu         a5, a1, a3
                  fcvt.s.wu    fa0, t0
                  fmax.s       fa1, fa1, fs5
                  fmul.s       fa2, ft11, fa2
                  fmul.s       fs7, fs7, fa2, rup
                  divu         s3, ra, a5
                  add          t1, t3, t6
                  mul          t2, ra, zero
                  sub          s10, s11, s11
                  fle.s        s8, fa0, fa1
                  fle.s        a1, fa2, fs8
                  flt.s        s3, ft11, fs0
                  fclass.s     t2, ft4
                  fsgnjn.s     ft3, fa2, fs8
                  slt          ra, t0, a4
                  fadd.s       fs8, fs3, fs0, rmm
                  xor          a5, gp, s9
                  sll          s10, t6, s11
                  fcvt.wu.s    a2, ft11, rdn
                  ori          a6, a2, 663
                  fcvt.s.w     fs2, s8, rmm
                  sltu         t5, a6, s2
                  and          s5, a6, s10
                  mulhsu       a1, gp, t6
                  fsgnj.s      fa7, fa2, fs7
                  flt.s        s0, ft9, ft1
                  fsgnjn.s     fa3, ft11, fa4
                  fmv.x.w      a1, fs10
                  srai         a7, s8, 31
                  fdiv.s       ft0, fs3, fs3
                  srl          s10, t5, s10
                  nop
                  fsqrt.s      fs8, fa5, rmm
                  add          t6, s11, t4
                  fcvt.w.s     s9, ft11
                  xor          t5, s2, a6
                  srai         a6, s4, 14
                  srai         t5, s1, 13
                  sll          zero, t4, t6
                  fsgnj.s      fs3, fs9, ft0
                  fsub.s       ft4, ft11, fs7
                  fmul.s       fs2, ft5, ft3
                  fsgnjn.s     ft2, fs2, ft7
                  fadd.s       ft10, fs0, fs6, rtz
                  slti         gp, s8, 1738
                  fadd.s       fs9, fs11, fa2
                  sltu         zero, a5, s6
                  fsgnjx.s     ft4, fa0, fs11
                  fle.s        s8, fs9, ft11
                  mul          s1, a7, s7
                  fdiv.s       fs11, ft9, ft4, rne
                  nop
                  sll          s2, tp, a4
                  fsgnjn.s     ft6, ft1, fs5
                  fmv.x.w      t5, fs4
                  andi         a2, s0, -377
                  xor          a5, s10, s1
                  fdiv.s       fs3, ft8, fa6
                  fmax.s       fa1, ft3, fa1
                  fmv.x.w      s4, ft6
                  sltu         t4, s5, a2
                  divu         zero, a1, s7
                  srai         s8, s7, 19
                  nop
                  fcvt.s.w     ft1, s5
                  fle.s        tp, fa7, fs6
                  mulhu        gp, t0, s8
                  lui          s6, 634871
                  div          zero, t5, s1
                  fdiv.s       fa0, ft6, ft2
                  slli         t2, a1, 25
                  remu         a6, s8, a6
                  mulhsu       t6, ra, s0
                  xori         s7, s3, -1041
                  lui          a2, 387729
                  sltiu        s3, s3, 1393
                  nop
                  mulhu        t3, s8, t2
                  fsgnj.s      ft11, ft1, ft2
                  fsgnjn.s     fa2, fs11, fs1
                  srai         a7, a0, 28
                  mul          s8, a2, t6
                  mulhsu       tp, ra, s2
                  sll          t2, a1, zero
                  xori         t6, t6, -1272
                  fclass.s     t2, fa2
                  xori         t4, s3, 600
                  fsgnj.s      fa0, ft5, ft11
                  fclass.s     s2, fs4
                  fsgnj.s      fs2, ft7, fs2
                  fmv.x.w      s2, fa1
                  fsgnjx.s     ft3, ft3, fa2
                  sltiu        a5, s11, -450
                  fmul.s       fs10, ft4, ft1, rmm
                  mulhu        s9, s9, ra
                  sra          sp, s1, a5
                  or           s9, t2, zero
                  fcvt.w.s     a2, fa3
                  srli         t6, a6, 22
                  feq.s        s3, fs3, ft8
                  xor          a5, zero, t4
                  fcvt.s.w     fs5, s8
                  mulhsu       zero, t4, t5
                  fsgnj.s      fa6, ft11, fa4
                  fclass.s     ra, fs8
                  sra          t2, t3, t4
                  sltu         gp, zero, t5
                  fcvt.w.s     gp, fa2, rdn
                  sra          t2, s7, a5
                  and          a5, s11, zero
                  divu         s10, a6, zero
                  srli         s6, s1, 23
                  srli         t3, zero, 2
                  divu         sp, t0, s11
                  rem          gp, s6, t2
                  xori         a6, a6, 1867
                  srl          s9, ra, t1
                  sub          t5, t0, s1
                  nop
                  sltu         s1, s7, t5
                  fsgnjx.s     ft4, fs3, fs4
                  fsqrt.s      ft4, ft4, rtz
                  div          s10, t0, a0
                  or           t2, a4, gp
                  fcvt.wu.s    a6, ft11, rdn
                  fmul.s       ft8, fa1, fa4, rup
                  add          s6, s3, t5
                  divu         t6, t0, s10
                  lui          s8, 702260
                  sltiu        s10, gp, -1131
                  lui          s6, 1042750
                  fsgnjx.s     fs3, ft9, ft6
                  fmin.s       fa7, fs8, fs4
                  fadd.s       ft7, fs4, ft2
                  rem          a1, t1, t0
                  fcvt.s.w     fs3, ra
                  fsgnjn.s     fa1, ft5, ft5
                  fcvt.w.s     ra, fs4
                  fmv.w.x      ft2, s4
                  andi         t1, a0, 429
                  fsqrt.s      fs8, ft7, rmm
                  fsgnjn.s     fa7, fs10, ft5
                  fsgnj.s      fs4, ft11, fs0
                  rem          s1, s8, t4
                  srl          s4, s6, s0
                  fmin.s       ft2, fs0, ft5
                  srli         s3, zero, 21
                  slti         t2, t4, -52
                  sub          s3, s11, s10
                  fcvt.w.s     s3, fs8, rtz
                  or           t2, zero, a4
                  and          s8, a6, a7
                  fmul.s       fs4, fs1, fs6, rdn
                  fmul.s       ft3, ft1, fa0
                  sll          a7, tp, gp
                  auipc        s9, 930526
                  mulhsu       t5, s3, s10
                  div          a6, t5, s9
                  sll          a7, a6, t3
                  sltiu        a2, a6, -1271
                  feq.s        a5, fs8, fa2
                  fcvt.w.s     s2, ft1
                  remu         t4, a6, a7
                  fadd.s       fa7, ft9, fa0, rtz
                  fmax.s       fs9, fa1, ft0
                  fclass.s     t2, fa4
                  fcvt.w.s     s9, fs11, rtz
                  fmin.s       ft1, fa6, ft3
                  srl          a6, t1, a6
                  fsgnjx.s     ft10, fa6, ft10
                  sub          s0, s0, s7
                  sltu         t2, a5, ra
                  remu         zero, ra, a5
                  lui          a3, 812173
                  andi         t6, s6, -478
                  add          a3, tp, a0
                  fsgnjn.s     ft9, fs11, ft5
                  or           t1, s9, a3
                  xori         a2, ra, -1137
                  mulhu        s2, s6, t1
                  div          s9, zero, t0
                  fcvt.wu.s    t2, fs1, rtz
                  slti         a1, a6, -328
                  lui          t3, 628646
                  fmul.s       fs1, fs8, ft10
                  fcvt.wu.s    gp, ft11, rmm
                  mulh         a0, a0, t4
                  ori          s3, t3, 1727
                  fmax.s       ft2, ft5, ft6
                  srli         t3, s10, 6
                  fmax.s       fa1, ft1, fa4
                  mul          s2, gp, s7
                  fcvt.w.s     s8, fa3, rdn
                  fcvt.s.w     ft3, s11
                  fdiv.s       fs10, ft0, fa4
                  fcvt.s.wu    fs11, a6
                  fmv.x.w      t3, fa5
                  fmul.s       fs7, fs6, ft4
                  sltiu        s1, s5, 702
                  slti         t3, s9, 403
                  fsgnjn.s     ft2, fs1, fs4
                  srai         s9, s0, 2
                  sra          a1, s5, t4
                  srli         a5, ra, 13
                  srl          a7, s8, t3
                  fsub.s       ft6, ft9, ft10
                  sll          s9, t1, a7
                  div          s10, s6, s6
                  fmax.s       ft1, ft0, fa3
                  fdiv.s       ft8, fs0, fs6
                  sra          tp, s10, t0
                  fsqrt.s      fs0, fs7, rdn
                  fsgnj.s      fs5, fa4, fa0
                  fcvt.s.wu    fs5, a6, rup
                  fmax.s       fa0, ft4, fa3
                  ori          t6, s9, -1243
                  fadd.s       ft9, fa1, fs9, rmm
                  fsub.s       fs9, fs7, ft1
                  fsqrt.s      fs11, ft8, rne
                  fsub.s       fs6, fs9, ft11, rtz
                  srl          a7, a6, s9
                  div          a3, a5, s1
                  sub          s7, s9, a3
                  ori          s1, s0, -1183
                  fsgnjx.s     ft1, ft7, fs10
                  fmul.s       ft4, fs4, fs4
                  fclass.s     a1, fs1
                  rem          a1, s5, t5
                  slt          gp, t6, s2
                  divu         a5, s10, s8
                  fcvt.w.s     t1, fs6
                  fmin.s       fa5, ft0, ft2
                  fsgnj.s      fa7, fa5, fs8
                  sltiu        sp, s7, -1978
                  fclass.s     s10, fs5
                  or           s10, t6, t4
                  lui          s0, 308505
                  fmul.s       fs6, ft9, ft5, rup
                  fdiv.s       fs8, ft7, fa1, rdn
                  fle.s        s0, fa1, fs11
                  fcvt.w.s     a0, fs10
                  fcvt.s.w     fs9, s3
                  fcvt.s.w     fs5, s0
                  fmin.s       fs4, ft6, ft5
                  sltu         sp, s11, gp
                  mulhu        a5, s0, s9
                  srli         zero, t4, 8
                  sltiu        a3, a5, -942
                  div          a0, s9, s1
                  fmv.w.x      fa3, s11
                  sll          a2, sp, a1
                  xori         s6, s2, 915
                  srl          zero, sp, s2
                  fsgnj.s      ft8, ft10, fa3
                  srli         s5, a6, 12
                  fle.s        a6, ft9, ft3
                  fmax.s       ft9, fs0, fs4
                  xori         a2, tp, 1429
                  divu         s3, a7, t1
                  fle.s        s3, fs2, ft5
                  srli         sp, ra, 12
                  sltiu        a3, tp, -518
                  fmv.x.w      s8, ft8
                  rem          a2, t6, t2
                  fsqrt.s      fa3, fa5
                  slli         tp, a5, 13
                  fdiv.s       ft6, fa7, fa0, rmm
                  slli         s3, t6, 12
                  auipc        zero, 228970
                  xor          t6, a2, t2
                  nop
                  sub          a7, sp, t5
                  mulhsu       a0, sp, t0
                  fcvt.w.s     t6, fa2
                  srai         t2, s6, 30
                  xori         s9, t0, 1462
                  andi         zero, a0, 40
                  fmin.s       ft9, ft9, fs5
                  xor          gp, a7, a4
                  remu         sp, a4, a0
                  srli         t1, s5, 5
                  srai         sp, t1, 12
                  nop
                  sltu         t2, a7, sp
                  sll          s10, s5, a4
                  mulhsu       s5, s6, s6
                  srai         tp, s6, 0
                  and          t2, t3, s5
                  fmv.w.x      ft10, a5
                  fclass.s     s8, fa7
                  xor          s9, s5, s3
                  lui          tp, 628837
                  fmul.s       ft11, ft9, ft0, rne
                  mul          s8, t0, t4
                  rem          tp, t1, a0
                  fsgnjx.s     fa4, ft3, fa0
                  srli         a7, a1, 29
                  srli         t2, t1, 25
                  fmv.x.w      s8, ft7
                  nop
                  fsub.s       ft10, fs6, fs11
                  sub          sp, s1, s6
                  flt.s        s0, fa0, fs0
                  flt.s        a7, ft3, fa4
                  feq.s        t6, fa3, ft5
                  feq.s        a3, ft2, ft5
                  fsgnjx.s     ft5, fa2, fa3
                  fsub.s       ft7, fa2, ft10
                  fsgnjx.s     fa5, fs11, fs4
                  fsgnjn.s     ft11, fs8, fa3
                  xor          t4, s3, a1
                  lui          zero, 457289
                  sltiu        a6, t5, 1603
                  slt          gp, a3, s6
                  add          t1, a7, s5
                  flt.s        t6, fs3, fs1
                  fcvt.s.wu    fa2, gp, rne
                  ori          a3, a7, -478
                  slli         zero, a4, 12
                  rem          t6, a3, s2
                  fcvt.wu.s    a5, ft1
                  fmax.s       fa5, ft1, fs9
                  srli         a2, a3, 11
                  addi         t1, a6, -834
                  div          sp, s4, s0
                  mulh         s5, t4, tp
                  fsgnjx.s     fa0, ft6, fs3
                  sub          t6, s9, s7
                  mulh         s6, s0, tp
                  fle.s        s6, fa5, fa1
                  fclass.s     s8, fa2
                  mulh         s1, s8, t4
                  fadd.s       fa2, fs8, ft3, rup
                  fadd.s       fs7, ft9, fa1
                  fsgnjn.s     fa7, fs3, ft0
                  fsgnjn.s     ft2, ft1, fa5
                  sra          s4, s4, t1
                  andi         s0, t0, 910
                  lui          s0, 779796
                  fadd.s       ft1, fa2, fa4, rmm
                  fsgnjn.s     ft8, fa3, ft1
                  slli         a7, t6, 24
                  mulhu        a2, a1, t3
                  fsqrt.s      fs1, fs7, rup
                  sltu         s4, a1, s2
                  fmv.w.x      ft0, s10
                  srli         s7, a2, 17
                  xor          s2, t2, a1
                  fsub.s       ft5, fs1, fs8, rtz
                  srai         a2, a4, 15
                  fsub.s       ft7, fa2, fa7, rne
                  fcvt.wu.s    t2, ft10, rdn
                  sltu         a7, sp, sp
                  fclass.s     s4, ft0
                  fsub.s       fa4, fs4, fa3, rne
                  fmul.s       ft11, fa0, ft3
                  and          a2, ra, t2
                  mulhsu       s3, t5, s6
                  fcvt.w.s     s8, fs11, rdn
                  sltu         s1, ra, s10
                  mulhsu       s6, t2, s3
                  fdiv.s       fs6, ft6, fs9
                  mul          t1, t1, t5
                  fmin.s       fs2, fa2, fa5
                  slt          a3, s4, t6
                  srl          a0, ra, s0
                  fsgnjx.s     ft4, ft9, fs11
                  fsqrt.s      ft3, fs11
                  fsgnj.s      fs11, fs6, ft8
                  mulhsu       a1, t0, s11
                  divu         a2, t6, s7
                  rem          t2, a4, s9
                  fsgnjn.s     ft11, fs6, ft5
                  sltiu        t4, a1, -1152
                  or           gp, a4, sp
                  fadd.s       fs7, ft5, ft3, rup
                  lui          s3, 139901
                  fdiv.s       fs2, fs2, fs8
                  fsqrt.s      fa7, ft7, rtz
                  fle.s        tp, fa3, fs2
                  nop
                  sltiu        s0, s7, 2018
                  add          a5, t2, ra
                  divu         a0, a2, s11
                  or           t2, sp, a0
                  fmul.s       fs4, fa1, fs7, rtz
                  fsub.s       ft7, ft9, fs10, rdn
                  lui          a7, 1001690
                  slt          ra, sp, ra
                  fcvt.s.w     fs9, a7, rmm
                  mulhsu       t2, a6, t2
                  fle.s        s9, ft0, ft10
                  lui          t5, 488382
                  mulh         s7, s8, gp
                  fadd.s       ft8, fs6, ft9, rtz
                  fsqrt.s      fs7, ft8, rdn
                  lui          zero, 910057
                  fdiv.s       fs5, ft6, fa5, rup
                  xori         a5, gp, -1277
                  sltiu        s7, s2, 940
                  divu         s5, s6, t2
                  divu         t6, t0, a7
                  ori          s1, s11, 8
                  slt          t5, t4, s8
                  fcvt.s.wu    fs3, sp, rne
                  mulh         s9, a1, t3
                  mulh         a3, sp, s5
                  fsqrt.s      ft9, ft7
                  fcvt.wu.s    s0, fs1, rdn
                  mulh         a6, t2, a0
                  fdiv.s       ft9, ft7, fs8
                  fsgnjx.s     fs4, ft6, ft4
                  fsgnjn.s     fs10, ft10, fs6
                  xori         s2, s1, 907
                  nop
                  andi         a0, a1, 1058
                  addi         s5, s6, -1881
                  or           a6, a5, s9
                  xor          a5, t6, a5
                  slli         t2, s5, 4
                  sltiu        sp, t1, -2000
                  fcvt.w.s     a7, fa3
                  fmul.s       ft10, fs7, fs0
                  sltu         a2, gp, a7
                  slli         t2, zero, 6
                  addi         a2, s1, -145
                  sra          a6, s4, gp
                  andi         s7, a2, 1693
                  fmin.s       fa5, fa2, ft6
                  srl          t1, t5, s5
                  slt          sp, gp, s10
                  slli         s7, a2, 16
                  fcvt.s.w     fs5, t5
                  divu         sp, a4, a3
                  slti         a7, s6, 160
                  fmax.s       fs8, fa7, ft3
                  fmv.w.x      fa6, a1
                  mulhsu       a2, s8, sp
                  sra          gp, t0, s6
                  andi         s6, s10, -210
                  nop
                  fclass.s     ra, ft0
                  fadd.s       fa1, fs6, fs11
                  srl          t3, tp, ra
                  fsgnjn.s     fa6, fs10, fa6
                  fle.s        t5, fa0, fa5
                  ori          t3, t5, 218
                  sll          t3, t3, s1
                  fdiv.s       ft7, fs5, fs9
                  mulh         s8, t4, s11
                  sll          sp, a0, gp
                  fcvt.s.w     fa1, t1, rdn
                  xor          t2, s10, ra
                  fmax.s       fa6, fs6, fs7
                  slli         zero, t0, 7
                  fdiv.s       ft0, fa3, ft4
                  mulhu        a7, s8, a1
                  fclass.s     a7, fs7
                  fadd.s       fs10, fs7, ft8
                  div          t5, s11, t5
                  addi         s7, a6, -1682
                  andi         a1, a1, -430
                  mulh         s6, t3, a5
                  fsgnjn.s     ft4, ft4, ft2
                  addi         s5, sp, 1785
                  fdiv.s       fs0, ft10, ft1, rne
                  fmax.s       ft9, fa4, fa3
                  mulhu        s3, t3, t2
                  mulhu        ra, s3, s0
                  srl          t4, s11, t2
                  mul          zero, s1, gp
                  andi         a2, a3, -186
                  mulh         a1, s6, gp
                  fadd.s       ft0, fa2, ft4
                  srl          zero, a6, s1
                  fsqrt.s      fs6, fs8
                  fcvt.s.wu    fs7, s10
                  feq.s        s1, fs9, fs5
                  fsub.s       fa1, fs8, fa5, rup
                  addi         a2, s4, -943
                  remu         t1, s5, s10
                  fsgnj.s      fs6, fs5, fs6
                  ori          s5, a4, 877
                  fmul.s       fs2, ft10, fs1
                  sll          sp, s11, a1
                  sltiu        ra, s1, 907
                  and          a3, s3, s3
                  ori          t6, t1, -1632
                  rem          s0, t6, t6
                  nop
                  sltiu        t3, t3, 685
                  fmv.w.x      fs4, t2
                  mul          s7, a5, s0
                  add          a5, a4, s6
                  srli         t5, s0, 6
                  sltiu        s0, s6, -1147
                  fmul.s       fs2, fa7, ft8
                  slli         s0, s0, 31
                  fsgnjn.s     fa0, fs11, fs8
                  srli         s10, s4, 29
                  or           s5, s2, s2
                  sll          a7, t4, a5
                  slt          s1, s3, s11
                  sra          a3, a7, a4
                  fmin.s       fs10, ft5, fa2
                  add          a2, a7, a3
                  sltiu        sp, a1, 133
                  fcvt.s.w     ft8, s11, rup
                  sub          s10, a7, a6
                  slt          a7, a0, s6
                  srai         a2, s11, 1
                  fcvt.s.wu    fa0, s1, rdn
                  fclass.s     s7, ft3
                  sltiu        s6, sp, 737
                  sra          a2, t2, s7
                  auipc        t4, 301770
                  srl          t5, ra, ra
                  fsub.s       ft7, ft7, fs4
                  fsgnjx.s     ft10, ft5, fs5
                  sra          s2, a7, t3
                  sltiu        s8, zero, -1357
                  fmax.s       ft3, ft11, fa7
                  fle.s        tp, ft4, ft10
                  srl          s6, t1, a2
                  fclass.s     s0, fs3
                  slli         s0, t3, 2
                  fcvt.s.wu    ft10, t1
                  fclass.s     s7, fa3
                  mul          s2, sp, s11
                  slti         a6, gp, -1048
                  slt          a3, s0, s5
                  fsqrt.s      ft1, ft1, rne
                  fmv.w.x      fs9, sp
                  sltiu        a5, a7, -1043
                  remu         zero, s3, gp
                  fcvt.s.w     fs6, s7
                  divu         s1, t3, s6
                  nop
                  slt          t6, zero, zero
                  fle.s        t1, fa3, fa0
                  srai         a0, gp, 8
                  remu         t1, s10, gp
                  sltu         ra, t6, s4
                  slti         s2, t2, -1922
                  sub          sp, s11, a6
                  rem          t3, s0, a7
                  mul          s4, t4, a3
                  sub          gp, t2, a1
                  fmin.s       fs1, ft11, fa1
                  fmax.s       fs2, ft7, ft0
                  fmax.s       fa7, fa0, fs1
                  xor          s3, a3, s5
                  or           s2, tp, a1
                  fle.s        s8, fa0, fa4
                  auipc        sp, 822117
                  fsub.s       fa4, ft1, ft9
                  fmul.s       fs1, fs6, fa5
                  auipc        s8, 929804
                  fmv.w.x      ft5, gp
                  or           s7, zero, s0
                  rem          s5, s5, t0
                  addi         a7, a7, 1383
                  xori         t4, a7, -707
                  mulh         a2, a7, s4
                  nop
                  srai         s9, ra, 21
                  sltu         t4, a4, sp
                  fadd.s       fa4, ft2, fa6
                  fcvt.wu.s    s9, ft1, rdn
                  xori         a2, s5, 1940
                  and          tp, t2, s7
                  sra          t2, s9, a5
                  auipc        s3, 482792
                  mul          a6, sp, s8
                  addi         t6, s6, -1186
                  fsgnjn.s     fa5, ft9, fa4
                  fmax.s       ft3, fa6, fs7
                  addi         gp, a7, 118
                  auipc        sp, 789280
                  fclass.s     s2, ft3
                  srai         s8, s1, 14
                  srli         a2, a2, 18
                  fsgnjx.s     fa2, fa7, fa4
                  sra          sp, s2, s1
                  fsgnjn.s     ft8, fs0, fa1
                  srli         s10, s1, 8
                  nop
                  auipc        s0, 73725
                  remu         t4, a6, sp
                  feq.s        zero, fs6, ft6
                  sll          s1, t6, s3
                  fdiv.s       fa3, fs8, fa0, rup
                  slti         a2, zero, 1783
                  mulh         t6, a2, gp
                  mul          t6, t4, s8
                  fclass.s     s8, fa0
                  slt          a1, ra, s6
                  fle.s        s4, fs6, fa2
                  xori         zero, s7, 775
                  sra          s2, a4, sp
                  fclass.s     a3, ft8
                  fcvt.s.w     fa4, t0, rtz
                  srl          s2, a3, t0
                  mulh         a7, a6, t0
                  xori         t3, a5, 956
                  fmv.x.w      a1, ft4
                  divu         s7, a2, s6
                  slti         ra, s7, 1848
                  lui          s6, 402967
                  fsgnjx.s     fs1, fs8, fs7
                  xori         s9, t1, 1951
                  fmv.w.x      fa1, a4
                  and          s0, t4, a7
                  fadd.s       fa0, fs5, ft3
                  fsqrt.s      fs0, fa1, rne
                  ori          t1, a7, 741
                  fsgnjn.s     fs10, ft0, fs2
                  sll          s7, a3, t3
                  sub          ra, a5, s9
                  remu         s9, s2, t0
                  auipc        s0, 385095
                  xor          gp, s3, sp
                  slti         s0, t4, 1952
                  slli         s2, a7, 26
                  mulhu        a6, a5, s0
                  xor          a6, tp, gp
                  flt.s        s5, fs1, ft7
                  fsgnjx.s     ft4, ft10, fs6
                  srai         t5, s3, 2
                  fsqrt.s      ft11, fa7, rmm
                  sub          zero, sp, t6
                  fmv.x.w      sp, ft7
                  fmv.w.x      fs5, sp
                  andi         s4, t5, 1532
                  flt.s        a2, ft11, ft4
                  fsub.s       fs10, fs11, ft7, rup
                  fmax.s       fa0, fs0, fs10
                  sll          tp, s8, a4
                  slt          zero, t3, s2
                  or           t5, s10, t5
                  fdiv.s       ft0, fa6, ft10, rdn
                  fmv.w.x      fs1, a0
                  fcvt.s.w     fa1, t2, rmm
                  fmul.s       fs0, ft9, fs10
                  sltiu        t2, a7, -1434
                  fsgnjx.s     fs8, fs7, fa4
                  fsgnjx.s     fa5, ft5, ft6
                  fcvt.s.wu    fs10, a1
                  mul          t2, s2, s7
                  fsgnjn.s     fa2, ft9, fs9
                  srai         a7, t3, 6
                  fsgnjx.s     fa4, fs0, ft5
                  fmv.w.x      fs10, a0
                  fclass.s     s5, fs2
                  addi         a0, s1, -83
                  slli         s6, a1, 22
                  mul          s1, tp, s1
                  slt          sp, t2, s4
                  feq.s        a5, fs10, ft1
                  fmv.x.w      gp, ft1
                  slli         s2, t2, 10
                  addi         ra, a6, 1811
                  div          a0, s7, t4
                  sub          s6, s0, t5
                  slt          t4, s8, gp
                  slli         a7, t5, 12
                  rem          s1, t4, t4
                  mulhu        s0, a4, a3
                  mulhu        s9, t0, t5
                  fsgnjn.s     fa2, ft5, fa7
                  fdiv.s       ft4, ft7, fs1
                  addi         sp, t4, -1748
                  mulh         ra, ra, zero
                  ori          a1, s9, -939
                  fclass.s     zero, fa2
                  sltu         a5, s3, s1
                  flt.s        a3, ft9, fa5
                  srai         s1, a4, 22
                  or           a1, s0, s7
                  fle.s        t1, fs11, fs3
                  lui          t2, 12408
                  or           gp, s6, s6
                  feq.s        s10, ft8, fs0
                  nop
                  srai         s5, s5, 12
                  mulh         a7, a3, s1
                  mulhsu       t3, tp, s9
                  mulh         gp, t3, a3
                  xori         a0, a0, 1736
                  fsqrt.s      ft8, fs7
                  auipc        a5, 460196
                  sra          a0, t0, a6
                  divu         a6, t1, s0
                  xori         t3, gp, -1672
                  div          t5, s1, a1
                  fmv.w.x      fa2, t1
                  lui          s4, 68509
                  ori          t6, a5, 1793
                  ori          zero, a6, -27
                  mulhu        t2, s8, a6
                  mul          zero, a0, s11
                  divu         s10, a6, tp
                  fsqrt.s      fa0, ft7
                  sll          sp, a4, a6
                  fmax.s       ft3, ft5, fs11
                  and          gp, zero, s5
                  slti         a5, t4, -1228
                  flt.s        a2, fs4, ft8
                  mul          s6, t5, tp
                  slt          t6, t1, t0
                  fcvt.w.s     s2, fs2, rdn
                  feq.s        a0, fs10, ft8
                  fsgnj.s      fs6, fa7, ft11
                  fle.s        s4, ft2, fs8
                  fclass.s     a0, fa1
                  fcvt.s.wu    fs5, s8
                  fcvt.s.wu    ft6, a1, rtz
                  nop
                  addi         s4, s7, 874
                  div          t3, s3, s2
                  fsgnj.s      fa0, ft1, fa5
                  div          t5, s4, s2
                  andi         t2, a0, 371
                  rem          sp, t4, t5
                  srli         a7, a0, 19
                  fadd.s       fs0, fa5, ft3
                  remu         sp, s9, t4
                  fmv.w.x      ft8, gp
                  divu         s7, t6, t5
                  slli         s6, t6, 28
                  mulh         s7, gp, s9
                  fsgnj.s      fa4, fa7, ft8
                  fmul.s       ft1, fs8, fs5
                  fcvt.wu.s    s1, ft11, rmm
                  and          s7, s3, s3
                  fclass.s     s2, fs8
                  fsgnj.s      fs11, fs0, fa3
                  sll          t3, ra, t4
                  fcvt.s.w     fa3, t6
                  fsgnj.s      ft3, ft10, fs1
                  fdiv.s       fs2, ft8, fa0
                  mulhu        s1, zero, s3
                  mulhu        t6, zero, a7
                  sltu         a1, sp, t3
                  mulhsu       zero, a6, t0
                  fmax.s       fs6, fa2, fs3
                  mulhsu       t5, s10, a5
                  slt          a5, tp, t3
                  rem          a3, a3, ra
                  fmv.x.w      a0, ft8
                  fcvt.wu.s    a5, fa3, rne
                  slli         s7, t2, 21
                  ori          a7, t3, 1179
                  slt          a1, s2, t5
                  feq.s        t3, ft5, ft8
                  fclass.s     sp, ft9
                  fmax.s       fs2, fs3, ft2
                  xor          sp, s9, s2
                  mulh         a0, a1, s8
                  fsgnjn.s     ft1, fs2, fs9
                  srai         t1, t0, 25
                  fmv.x.w      s10, fs8
                  fsqrt.s      ft1, fa0
                  fmv.w.x      fa0, tp
                  lui          a1, 272246
                  fcvt.w.s     s6, ft11, rne
                  fcvt.wu.s    s2, fs3, rup
                  mulhsu       t4, s7, sp
                  sub          sp, t0, t4
                  fclass.s     zero, ft2
                  slli         tp, ra, 20
                  slli         a2, gp, 0
                  fsqrt.s      fs0, ft2, rtz
                  srl          s9, a7, s4
                  sra          s10, s1, t1
                  mulh         zero, s8, s2
                  ori          gp, a3, 497
                  mul          a5, gp, s4
                  ori          t5, tp, -656
                  fsqrt.s      ft4, fs2, rdn
                  fcvt.wu.s    s7, fs1
                  fsgnjn.s     fs4, ft10, ft3
                  slli         a7, t1, 28
                  addi         s1, a4, -1163
                  xori         s2, a1, -1713
                  fcvt.wu.s    t6, fa0, rdn
                  fmv.w.x      fs2, a5
                  fadd.s       ft6, ft1, fs6
                  fsub.s       fa3, fs10, fs5, rdn
                  fadd.s       fa6, ft2, fs0, rtz
                  fmin.s       fs7, fs2, fa7
                  sll          gp, sp, s8
                  fcvt.w.s     a2, ft7
                  and          t2, a0, a1
                  slli         t5, s0, 19
                  div          s0, s2, tp
                  slt          a5, s2, a5
                  rem          s10, ra, s8
                  addi         s6, a0, 536
                  sltiu        s0, s6, 1635
                  fcvt.wu.s    s9, ft4, rmm
                  addi         a3, a1, 1966
                  flt.s        ra, fs0, fs10
                  divu         zero, s11, zero
                  nop
                  srai         a5, t3, 20
                  fsgnj.s      ft2, ft2, fa7
                  mulh         t1, t1, a7
                  xori         s3, zero, 267
                  mulhu        a7, a6, s10
                  fle.s        a2, ft7, fs3
                  rem          a7, s1, ra
                  fadd.s       fa7, ft4, fa5, rdn
                  sltu         a2, tp, a5
                  fcvt.wu.s    s5, ft2, rdn
                  srli         s4, s5, 25
                  fcvt.wu.s    gp, fs8
                  sll          s4, s8, ra
                  fsub.s       ft9, fa7, fa2
                  slli         gp, s0, 19
                  fmax.s       fa7, ft3, fa2
                  mulh         a6, s3, s1
                  add          t4, a4, s5
                  andi         t5, t2, -101
                  addi         s2, a0, -8
                  xor          a3, s7, s10
                  addi         t3, s7, 1687
                  fsqrt.s      fa7, fs10
                  fmv.x.w      s7, fs7
                  slt          a3, a3, sp
                  rem          s4, a2, a0
                  fsqrt.s      fs5, fa0, rdn
                  fsqrt.s      fs10, fa0
                  auipc        t3, 232150
                  xori         a2, t5, 624
                  fcvt.s.w     ft9, gp, rup
                  div          a6, a1, a0
                  fclass.s     s4, fs4
                  flt.s        sp, ft4, ft2
                  fsub.s       fs9, ft4, ft9
                  fdiv.s       fa6, ft8, fa2
                  ori          a3, zero, 1085
                  sra          s4, a3, t3
                  lui          ra, 688714
                  slli         gp, a6, 16
                  fadd.s       fa5, fs8, fs5, rtz
                  xori         a0, s8, -1829
                  fsgnj.s      ft7, fa2, fa4
                  andi         s4, t5, -1501
                  fsqrt.s      ft8, ft8
                  xor          ra, a1, s9
                  auipc        a0, 950098
                  and          t4, t1, t4
                  slti         zero, s1, -772
                  mul          s4, sp, t3
                  sll          s5, s5, gp
                  mulh         t2, t0, s2
                  add          t3, s10, s2
                  lui          s4, 677234
                  sra          t4, s5, t0
                  xori         gp, s11, -1786
                  lui          a5, 938615
                  divu         zero, a1, s9
                  fmul.s       fs10, fs0, fa5
                  nop
                  srli         tp, s6, 7
                  fdiv.s       fs1, ft3, fa0, rdn
                  slti         t1, zero, 1247
                  sltiu        t4, t6, 1119
                  mul          s2, s6, s2
                  slt          a2, ra, s10
                  slt          s3, s9, gp
                  sra          s10, s10, t5
                  fsqrt.s      fs11, ft0, rup
                  nop
                  srli         s10, t4, 11
                  lui          s4, 422915
                  mulh         ra, s0, t6
                  fcvt.s.w     ft7, s8
                  fsub.s       ft3, ft3, fa7
                  rem          s0, s5, sp
                  andi         a1, a6, 253
                  addi         a5, s8, -1828
                  and          zero, ra, a4
                  sub          s6, zero, s6
                  fmv.w.x      fa7, t3
                  sltiu        gp, a5, 873
                  fmin.s       fs4, ft11, ft3
                  fsqrt.s      ft7, fs3, rdn
                  auipc        s3, 22674
                  fsqrt.s      fa6, ft7
                  sltu         a2, s1, s6
                  remu         sp, s2, a2
                  fcvt.s.wu    fa4, tp
                  addi         a5, s10, -1513
                  div          t1, t1, t4
                  sltu         t2, t1, t2
                  xor          zero, ra, s11
                  slti         tp, a6, 1144
                  srai         t4, a0, 1
                  div          tp, a0, a5
                  add          s6, sp, s9
                  xori         a2, t6, 1946
                  srl          t3, t0, s8
                  fmax.s       ft5, fa0, ft1
                  mulh         a5, t6, s11
                  fsqrt.s      fs2, fa5
                  and          s7, t0, t4
                  remu         t2, a4, t0
                  ori          a1, t1, 1458
                  div          t5, s8, s11
                  div          s1, s10, s4
                  fmin.s       ft9, fs4, ft4
                  srli         sp, a1, 29
                  fmin.s       ft4, fa2, fa4
                  or           s9, a3, s5
                  and          t4, s10, s2
                  div          a0, s3, ra
                  xor          t5, s0, zero
                  fcvt.wu.s    s10, fs8, rtz
                  addi         s7, sp, 1828
                  sltu         s8, s11, s0
                  sltiu        sp, s1, 1335
                  fcvt.s.w     fs6, a0, rdn
                  andi         a6, ra, 1907
                  nop
                  mulhu        sp, t6, a6
                  sltiu        a6, a2, 299
                  feq.s        s9, fs10, fa4
                  rem          a2, t2, ra
                  and          t4, t1, t1
                  fadd.s       fa7, ft10, fs0
                  slli         s8, gp, 21
                  fcvt.w.s     a2, fs9
                  fcvt.s.wu    fa4, t5
                  flt.s        s6, fs1, fa2
                  fclass.s     a0, fa3
                  fsgnjx.s     fa7, fs2, fs8
                  flt.s        t4, ft7, fa7
                  andi         s7, s3, 179
                  fmul.s       fs7, fa3, fa4, rdn
                  fmin.s       fs11, fs4, ft11
                  fcvt.s.w     ft6, t2
                  mulhu        a6, t5, s11
                  fsub.s       fa0, fa0, fs7, rup
                  slt          a7, s7, t4
                  srai         ra, sp, 4
                  addi         a5, gp, 1364
                  fsqrt.s      fa3, ft2
                  fdiv.s       fs2, ft5, fa3
                  mulh         gp, a1, ra
                  and          s6, a1, t5
                  fcvt.w.s     s4, ft3, rmm
                  fsqrt.s      fa3, fs2, rtz
                  sra          a5, gp, t5
                  srl          s10, t5, s1
                  sltiu        t1, s1, -387
                  fle.s        t3, fs1, fs5
                  fmv.x.w      s5, ft5
                  flt.s        sp, ft5, fs7
                  slti         a6, s5, -854
                  xori         a3, a2, -402
                  srai         tp, t5, 22
                  ori          t2, s4, -960
                  auipc        a5, 561397
                  fle.s        s6, fa6, fa7
                  flt.s        s6, fs11, fs7
                  sll          sp, s6, t2
                  addi         t3, s1, -1823
                  xor          s10, s5, a1
                  slt          t4, sp, s2
                  auipc        a3, 311636
                  mulhsu       zero, s10, t4
                  xori         s4, t1, 1709
                  xori         t3, s0, 863
                  fcvt.wu.s    s0, fa5
                  fmv.x.w      s4, fs10
                  andi         s1, s9, 1544
                  flt.s        s9, fa0, ft6
                  fadd.s       fs6, ft6, ft4, rup
                  or           s3, zero, t6
                  sll          s9, s8, a3
                  fmv.x.w      t1, fs1
                  slt          a5, t6, t0
                  slli         s10, zero, 18
                  srl          s0, s0, t4
                  fsub.s       fs11, fa4, ft7, rmm
                  fmax.s       ft5, fa7, fs0
                  slti         a2, s1, 1849
                  auipc        a3, 17914
                  addi         s2, s9, 1690
                  fmv.x.w      a6, fa5
                  sra          a7, t1, s10
                  srai         s3, s2, 22
                  sll          s7, t1, t6
                  fmv.w.x      ft10, t4
                  slt          t3, t1, s8
                  fle.s        a3, ft10, fs7
                  add          a7, zero, s1
                  ori          s5, a4, 319
                  slti         tp, s3, 91
                  slli         ra, s6, 0
                  srli         s7, tp, 17
                  addi         t4, t4, -1308
                  slli         zero, sp, 12
                  mulh         s0, a6, t5
                  fmin.s       fa7, fs6, fs4
                  xori         s10, a5, -1908
                  fcvt.s.wu    ft2, a3
                  fmul.s       fs4, ft10, fs10, rup
                  auipc        t5, 445360
                  div          a5, s4, t1
                  xor          t4, t3, t0
                  fmul.s       ft3, fs9, ft0, rne
                  xori         gp, tp, 140
                  fcvt.w.s     t4, ft3, rtz
                  nop
                  sltiu        gp, t2, 863
                  fcvt.s.w     fs10, a3, rmm
                  fdiv.s       fs10, fs0, fs5
                  divu         a0, s8, a7
                  sll          s3, s10, t4
                  fadd.s       ft3, ft11, ft1, rup
                  fdiv.s       fs6, ft10, fs11, rmm
                  mulhu        a6, a0, t5
                  fsgnjn.s     fa6, ft7, ft1
                  fdiv.s       ft7, ft9, fs3
                  remu         zero, s5, a3
                  fcvt.s.wu    fs10, zero
                  remu         s9, s10, s1
                  div          s6, a0, zero
                  slt          s4, s10, s7
                  fcvt.wu.s    sp, fs3
                  ori          s3, a4, -699
                  sltu         s3, s4, s3
                  or           s0, a7, ra
                  fcvt.w.s     ra, fa7, rmm
                  sub          s1, s5, s10
                  srli         a0, ra, 19
                  srl          tp, a1, s7
                  slt          s3, t5, a2
                  slli         s4, a7, 20
                  fsub.s       fs0, fa4, fs0
                  slti         a1, a0, -394
                  sltu         a6, tp, a7
                  fadd.s       fa5, fs9, ft4, rne
                  xori         s9, s9, 21
                  and          t4, sp, t0
                  and          s6, t3, t4
                  fsgnj.s      ft8, ft2, fs10
                  andi         s1, a7, 940
                  fclass.s     ra, ft11
                  fmul.s       fs2, fa0, fs8
                  sltu         t6, s11, t3
                  feq.s        s9, fs8, fa3
                  mulhsu       s1, s8, zero
                  sltiu        a6, a1, 1725
                  feq.s        s4, ft5, ft8
                  sltu         a2, a6, zero
                  mulhsu       a1, tp, t3
                  fcvt.w.s     a3, ft1, rne
                  fcvt.s.w     fs6, s5
                  fsgnjx.s     ft7, fa3, ft4
                  addi         t4, s4, 611
                  lui          t4, 97242
                  sub          s0, t4, t2
                  flt.s        a0, ft8, ft4
                  fcvt.s.w     ft3, a7, rdn
                  fcvt.wu.s    a6, fs8
                  fcvt.s.w     fs2, a7, rne
                  nop
                  fsgnjn.s     fs8, ft9, ft2
                  or           a3, s10, gp
                  sll          sp, s0, s11
                  sltu         s0, t5, s6
                  xori         a0, s9, 1003
                  xori         s7, a3, -1000
                  sltu         ra, gp, t5
                  srl          s1, a7, a7
                  srai         zero, tp, 2
                  ori          s0, a1, -460
                  fmax.s       fa7, fs0, fs3
                  fmin.s       ft6, fs10, fa3
                  slti         ra, a4, 1561
                  ori          gp, t1, 1175
                  andi         s4, a5, -171
                  fmax.s       fs1, fs7, fa5
                  auipc        s10, 482972
                  or           t4, t2, s7
                  sltiu        t4, t3, 1729
                  sra          sp, zero, t1
                  srli         t2, t4, 23
                  fcvt.wu.s    t2, fs9, rne
                  lui          zero, 822840
                  fsqrt.s      ft9, fa6, rdn
                  lui          s8, 354796
                  or           s8, s3, t6
                  fcvt.s.wu    fs3, a4, rne
                  fdiv.s       fs0, fs7, ft7, rtz
                  add          s5, t6, s10
                  srl          s10, s7, sp
                  srl          t5, a7, s9
                  div          gp, a0, s7
                  sra          tp, sp, t1
                  mulhsu       ra, a5, s0
                  fadd.s       fs5, ft2, fa2, rup
                  fcvt.s.wu    fa1, gp
                  and          s0, a7, a4
                  fcvt.w.s     s5, fs1
                  srai         a1, s2, 30
                  divu         t3, a3, s4
                  and          ra, sp, t5
                  rem          a1, a3, sp
                  slt          ra, s2, t3
                  add          a3, a1, t1
                  fsgnj.s      fs10, fa6, ft3
                  fsgnjn.s     fs8, fs11, fa4
                  fcvt.w.s     s1, ft1
                  lui          t6, 94290
                  srli         s3, a6, 28
                  sub          s8, t1, a3
                  sltu         s9, s9, s4
                  rem          t3, s1, a1
                  andi         t6, a2, 755
                  srai         a2, a0, 13
                  sub          a0, t4, s7
                  sub          t6, a0, a5
                  mulhsu       t3, a5, a3
                  lui          s10, 214026
                  ori          s3, s5, 350
                  fsqrt.s      ft7, ft3
                  lui          tp, 429535
                  srli         s3, s0, 6
                  fcvt.w.s     a1, fa7, rmm
                  fcvt.s.wu    fa0, t2
                  fclass.s     s1, fs9
                  div          t6, s9, a2
                  sltu         a0, tp, a4
                  fcvt.s.wu    fa5, a5, rmm
                  mul          s6, s3, ra
                  or           t4, s11, s0
                  fmv.x.w      t6, ft4
                  srai         s10, a2, 19
                  fsub.s       fs5, ft7, fs0
                  fmin.s       fs2, fs0, fa0
                  andi         s6, gp, 594
                  rem          s6, a7, s4
                  fsgnjn.s     ft0, fs8, ft0
                  slli         gp, a1, 9
                  fcvt.w.s     gp, fs1
                  rem          a0, t5, s6
                  fmul.s       fs11, ft10, fs10
                  xor          a3, t2, t3
                  mulh         zero, gp, s0
                  fle.s        s10, ft10, fs10
                  fcvt.w.s     s1, ft0, rdn
                  mul          s3, s0, a3
                  fmv.x.w      s5, fs9
                  mulhu        gp, s6, t5
                  xor          t2, t4, a2
                  mulhu        s2, sp, tp
                  and          a6, t5, zero
                  fcvt.wu.s    zero, ft7, rup
                  fclass.s     a0, fs2
                  ori          s3, tp, 1421
                  fmv.x.w      s10, fa0
                  fsgnj.s      fa3, ft10, ft5
                  feq.s        a2, fs6, fs11
                  fclass.s     s10, ft4
                  fdiv.s       fa6, fs11, ft3
                  fle.s        a3, fs0, ft5
                  rem          s4, s7, s1
                  fsqrt.s      fa7, fa1
                  xor          a5, a5, a1
                  fclass.s     a3, fa3
                  fmin.s       fa2, ft10, ft1
                  slti         a7, t5, -1055
                  remu         t1, s6, a4
                  fmin.s       fs3, ft4, ft8
                  addi         s1, a1, -1045
                  remu         t1, a5, a7
                  divu         a6, a3, s7
                  sra          a7, t4, t3
                  rem          s6, s4, t3
                  fcvt.w.s     t6, fa4
                  add          s6, t0, t4
                  feq.s        a7, fa1, ft3
                  xori         a3, t5, 778
                  sltu         t4, s5, t1
                  fmax.s       fa7, fa4, fs6
                  fdiv.s       fs1, fa6, fa4
                  flt.s        a6, fa1, ft7
                  fmul.s       fs8, fa0, fs10
                  fclass.s     ra, ft8
                  fclass.s     t4, fs3
                  slt          a5, zero, a1
                  slti         s10, a4, 526
                  sltiu        s10, s6, 1731
                  fmax.s       fa4, ft9, fs3
                  slti         s6, t1, 8
                  fclass.s     t4, ft11
                  fmv.x.w      s7, ft1
                  fsqrt.s      ft6, fs8, rtz
                  fcvt.s.wu    fs5, s5
                  sll          s8, t0, a5
                  feq.s        s5, fa7, fa3
                  sll          s0, s6, s6
                  fsgnjn.s     fs6, ft6, fs2
                  xor          a6, s0, s7
                  lui          t6, 833192
                  fle.s        s3, ft8, fa5
                  fclass.s     t6, fs7
                  nop
                  andi         gp, s5, 906
                  remu         a3, s0, t2
                  nop
                  fcvt.w.s     s3, ft8
                  mulhu        a1, a0, a7
                  fcvt.w.s     s9, ft11, rdn
                  lui          a2, 23728
                  fsub.s       ft5, fs1, ft1, rdn
                  fle.s        t3, fa6, ft10
                  fsqrt.s      fs2, ft8, rup
                  lui          ra, 424371
                  add          ra, a7, a7
                  fsgnj.s      ft1, ft2, ft11
                  sltu         a0, t1, a3
                  fmul.s       fa4, fs3, ft11, rdn
                  xor          s3, s5, t5
                  fmv.x.w      a0, fs8
                  fcvt.s.wu    fa2, s8
                  fmv.x.w      s9, ft2
                  sll          s6, s7, t3
                  andi         t6, t2, -414
                  divu         ra, t4, t4
                  fmin.s       ft2, fs9, fs11
                  slti         s2, s4, 580
                  mulh         s1, a4, a4
                  divu         s9, s11, s10
                  srli         ra, s4, 13
                  divu         a1, a6, s1
                  fsqrt.s      fs5, fa4
                  rem          t1, a1, s11
                  fle.s        t4, ft9, ft8
                  srl          t6, s6, sp
                  fsqrt.s      fs8, fs9
                  fsqrt.s      fs1, fa5, rdn
                  fsub.s       ft9, ft9, fs4, rdn
                  xor          t1, t0, gp
                  mulhsu       s0, s10, t2
                  nop
                  srli         s3, s4, 16
                  fmax.s       fs4, fa0, ft9
                  fsqrt.s      fa6, fa0
                  lui          a2, 838152
                  fadd.s       ft11, fs6, fs7
                  fclass.s     a3, ft11
                  fadd.s       ft5, fs10, fa5
                  and          s10, t6, s2
                  fcvt.s.wu    fa6, s5
                  feq.s        s1, fa1, fa6
                  fsgnjx.s     fa3, ft4, ft3
                  fdiv.s       fa3, ft5, fa3
                  fmv.x.w      s10, ft1
                  fcvt.s.w     ft1, s9, rtz
                  mulh         a7, t2, zero
                  addi         s9, a2, -240
                  addi         a0, s1, 1974
                  slt          sp, s5, s2
                  andi         t4, zero, -444
                  fcvt.s.wu    ft11, s6, rmm
                  sltiu        a6, a0, 442
                  fclass.s     s6, fs2
                  fcvt.wu.s    a2, fs8, rdn
                  fclass.s     t2, fs11
                  fcvt.wu.s    s4, fs5
                  feq.s        tp, ft2, fa5
                  mulhsu       a6, s9, s1
                  slt          gp, s6, s1
                  sll          t1, a7, a5
                  fcvt.w.s     t6, ft3, rtz
                  fmv.x.w      ra, fs10
                  srai         t6, a6, 16
                  lui          a1, 609415
                  mulh         a0, a0, s2
                  slt          s2, s2, s8
                  fsgnj.s      fa5, fs5, fa5
                  nop
                  srli         t1, s6, 1
                  remu         a1, a4, a7
                  nop
                  nop
                  fcvt.s.w     ft9, s11
                  and          s3, s4, a6
                  slti         a6, sp, -260
                  auipc        a6, 783724
                  srl          t3, t4, t5
                  fmv.x.w      a6, fs5
                  sltiu        t2, s0, -167
                  fsub.s       fa3, fa6, ft0
                  slti         a7, a0, 762
                  fle.s        t2, fa2, fa2
                  or           s2, zero, t2
                  fcvt.s.wu    ft10, a1, rmm
                  andi         a2, sp, 1405
                  fcvt.w.s     tp, fa5
                  fmin.s       fs0, ft6, ft0
                  fsub.s       fs0, fs4, ft3
                  fsgnjn.s     fs8, fs6, ft6
                  rem          s0, s2, s0
                  fcvt.w.s     s1, fs10
                  sltu         a6, a6, a5
                  fmv.w.x      fa6, s4
                  fmul.s       ft3, ft2, ft7, rne
                  nop
                  and          a6, s11, a5
                  andi         s5, sp, 1812
                  fmv.w.x      ft7, s7
                  fsub.s       ft9, fs10, fs10
                  mulhsu       s0, a1, sp
                  sra          s10, a3, t3
                  mulhsu       t2, t4, s4
                  addi         s8, a4, -1232
                  sltiu        t5, a5, -923
                  sltu         s2, gp, t0
                  sub          a1, s9, a2
                  fsgnjn.s     fs8, ft7, fa4
                  srli         t2, s3, 2
                  mulhsu       a6, a6, sp
                  fmul.s       fa3, fa3, fa2
                  remu         a7, t0, a2
                  mulh         s5, t6, tp
                  sub          zero, gp, a7
                  slt          sp, s2, a0
                  divu         a5, a6, t4
                  nop
                  fcvt.s.w     ft6, a7
                  mulhsu       tp, t0, a4
                  fle.s        t2, fs6, fs2
                  fsub.s       fs8, fa1, fs7
                  auipc        t6, 583846
                  nop
                  div          s10, t4, s9
                  fmul.s       fs8, fa3, ft7, rup
                  sltiu        a3, t2, -158
                  feq.s        a2, fa5, ft11
                  add          t5, a6, a6
                  fclass.s     a6, fa1
                  add          t5, t3, s8
                  feq.s        a7, ft1, fs4
                  fsqrt.s      fs0, fs1
                  fdiv.s       fa7, fs4, ft11, rne
                  or           a2, s9, s1
                  fle.s        s6, ft7, fs2
                  sra          gp, a3, zero
                  fcvt.s.wu    ft6, sp
                  andi         t3, t6, 1692
                  andi         zero, s3, -612
                  fsub.s       ft0, fs0, fs4, rtz
                  srli         a6, ra, 9
                  fcvt.wu.s    zero, ft0, rdn
                  fcvt.s.w     fa3, s11, rmm
                  sll          a6, a3, a0
                  srli         s7, t0, 31
                  xor          t3, s10, s1
                  fcvt.w.s     s2, fa4
                  divu         sp, s1, t0
                  rem          t5, t5, t6
                  fsgnjn.s     ft6, ft3, fs10
                  fadd.s       fs0, ft2, fa0, rup
                  mulhsu       t6, a4, t6
                  divu         tp, s8, a6
                  sub          a5, a1, a2
                  srai         s6, t0, 13
                  ori          a1, t0, -1968
                  or           s1, a1, sp
                  xori         s6, s5, -1302
                  xor          tp, s8, gp
                  rem          s7, s3, s11
                  remu         s6, s9, a2
                  fmax.s       fs11, ft0, fa2
                  feq.s        a0, fa3, ft0
                  auipc        s1, 980925
                  fmv.w.x      fs5, a7
                  srai         t2, tp, 4
                  xor          t2, t0, s4
                  auipc        t6, 615549
                  fsqrt.s      ft5, ft10, rne
                  mulhu        tp, t2, a7
                  mulh         s1, s7, gp
                  fcvt.s.wu    ft1, a3
                  fmv.x.w      a2, ft7
                  rem          s0, t1, a7
                  sub          s7, t6, a3
                  sll          s4, a3, ra
                  divu         s0, s11, t0
                  xor          s7, a5, a0
                  feq.s        a0, ft9, fs3
                  mul          t6, t3, sp
                  rem          s5, a2, t3
                  flt.s        a7, fs11, ft10
                  fcvt.w.s     s6, ft4, rmm
                  auipc        s0, 657902
                  fmax.s       ft9, ft10, fs6
                  fclass.s     gp, ft0
                  srl          a7, s8, a7
                  srl          a7, s11, a4
                  lui          a7, 895215
                  slti         s9, t0, 914
                  fcvt.w.s     a6, fs11, rne
                  fmin.s       fs1, ft8, ft5
                  srai         s5, t4, 27
                  fsgnj.s      fs9, fs3, fs2
                  slt          s0, s8, s8
                  srai         a7, s11, 8
                  feq.s        s4, fa2, fa1
                  andi         s5, t2, -446
                  fsqrt.s      ft9, ft10
                  fsgnj.s      fs3, fs9, ft0
                  fcvt.s.wu    ft0, s6
                  fmul.s       fs1, fs7, fa1, rtz
                  mulhu        a2, a7, t3
                  slt          a3, a7, t0
                  ori          s8, s7, 1512
                  sll          s6, tp, s8
                  fadd.s       fa7, ft10, ft11, rmm
                  nop
                  slli         a3, a7, 11
                  fle.s        t3, ft1, fs10
                  fcvt.s.wu    ft6, ra, rne
                  ori          t3, a2, -1799
                  srli         s6, a0, 5
                  div          s8, zero, a5
                  feq.s        s5, ft5, fa5
                  fcvt.wu.s    sp, fs2
                  srai         t4, s9, 13
                  or           s10, tp, ra
                  srli         s3, t5, 27
                  addi         s10, a1, -1277
                  flt.s        t3, fa4, fs3
                  fmv.w.x      fs0, t0
                  mulhsu       t1, t1, t6
                  srl          s6, a1, t1
                  mul          t4, tp, a1
                  mul          a5, s9, tp
                  fcvt.wu.s    s9, fs5, rdn
                  fle.s        t3, fa0, ft8
                  xor          sp, s10, s3
                  slli         s1, t5, 23
                  fadd.s       ft0, fs4, fs9
                  add          a7, s4, t2
                  slli         gp, s0, 14
                  mulhsu       s1, tp, a2
                  sub          ra, a3, zero
                  xori         a6, t3, -845
                  mulhu        a1, gp, tp
                  slli         s6, a6, 7
                  fsub.s       fa0, ft1, fa2, rne
                  feq.s        t3, fa1, ft8
                  fcvt.s.w     fa6, ra, rup
                  fcvt.s.w     fs7, s11, rtz
                  feq.s        a7, ft2, ft3
                  mulh         a7, a3, gp
                  or           ra, s9, t3
                  fmax.s       fs10, fs0, ft8
                  fclass.s     a6, fs1
                  fsub.s       fa1, ft4, ft8
                  fmax.s       ft4, fa7, fs4
                  and          s8, a2, t4
                  sub          t3, s0, s10
                  fsgnjx.s     ft6, ft6, ft1
                  addi         ra, t4, 315
                  nop
                  mulh         sp, s0, t5
                  xori         zero, sp, 1037
                  fadd.s       fs11, fa6, ft4
                  feq.s        ra, fa5, fs5
                  sll          s0, s7, t6
                  srl          s3, t0, tp
                  fcvt.w.s     s10, ft3, rdn
                  mulhu        a5, s6, gp
                  fmin.s       fs8, fs0, ft9
                  srl          t6, s1, a7
                  fcvt.s.w     ft3, s7, rdn
                  fsqrt.s      fs0, fs2, rne
                  slti         a1, t3, -1983
                  fdiv.s       ft9, ft3, ft7, rne
                  div          a3, t0, ra
                  or           s5, t1, a4
                  mulh         a0, s7, s3
                  sub          sp, s1, t6
                  slt          s3, gp, s5
                  slti         sp, s11, 1259
                  mulh         t3, s5, a1
                  xor          a1, t1, s4
                  divu         t1, a6, s4
                  fsgnjx.s     ft9, fa2, fa0
                  fcvt.s.wu    fa4, s3
                  xori         s1, t4, -961
                  mulhsu       a7, a4, s4
                  sra          zero, s8, a7
                  feq.s        a3, ft10, ft9
                  fdiv.s       fa4, fs2, fs3, rmm
                  fmul.s       fa0, ft7, ft6, rmm
                  fmv.w.x      ft11, t5
                  fclass.s     tp, ft9
                  and          s8, a0, ra
                  or           a6, t3, s10
                  fmul.s       fa2, fs4, ft7, rtz
                  mulh         t2, tp, zero
                  auipc        t2, 213455
                  feq.s        s8, fs3, ft2
                  fle.s        a7, fs1, fa6
                  flt.s        s6, ft4, ft8
                  fsgnj.s      fs0, fs3, ft2
                  fle.s        a0, ft1, fa1
                  nop
                  sll          a5, a0, gp
                  mulhsu       t4, sp, tp
                  addi         a5, t6, -255
                  and          s0, t3, s6
                  slli         a2, a4, 12
                  sll          a0, s9, a1
                  or           s7, gp, t3
                  sltu         s4, a7, s5
                  fcvt.s.wu    fa2, a2
                  andi         t5, ra, -694
                  fsub.s       fa3, ft1, ft2
                  nop
                  or           t2, t6, tp
                  rem          s1, s4, a3
                  or           a5, s6, t2
                  mul          gp, t3, s9
                  feq.s        t2, ft4, ft10
                  mulhsu       s6, ra, s10
                  sub          a1, s11, t4
                  srl          s1, a0, s0
                  fmv.x.w      sp, fs5
                  xori         ra, t0, -1302
                  addi         s7, s6, 71
                  fclass.s     s7, fa3
                  nop
                  mul          s1, s8, a6
                  nop
                  srai         s1, s11, 26
                  addi         a0, a5, -1015
                  fadd.s       fa1, ft6, ft5, rdn
                  sra          a2, s0, s3
                  fadd.s       ft6, fs2, fs2, rmm
                  srli         tp, s7, 3
                  fle.s        s10, ft9, fs8
                  auipc        s0, 774103
                  addi         t3, a4, 2
                  fmul.s       ft4, ft10, ft1
                  slli         s9, a6, 16
                  nop
                  rem          s8, tp, s5
                  and          s8, ra, a2
                  mulhu        gp, s11, t3
                  fmax.s       fa2, ft9, fs1
                  slt          s9, s0, tp
                  remu         gp, s3, s4
                  fmax.s       fa4, ft2, fa0
                  nop
                  fle.s        s3, fs10, ft2
                  fle.s        t3, ft4, fs8
                  srli         zero, a6, 16
                  sltu         tp, a6, a1
                  nop
                  rem          t2, t0, sp
                  or           s10, a6, a1
                  div          a0, s3, t0
                  fmv.w.x      ft9, a4
                  srli         a3, s10, 25
                  fle.s        zero, fs6, fa5
                  fcvt.wu.s    a3, ft0
                  slli         t1, s8, 29
                  sra          s7, t4, s8
                  fsgnjx.s     ft11, ft11, fa3
                  mulhsu       s7, t6, s1
                  sltu         s8, a7, s9
                  div          a0, t2, gp
                  fcvt.s.wu    ft8, t3, rtz
                  auipc        t2, 931889
                  fadd.s       fs7, fs8, fs8
                  or           s5, s3, s8
                  fmv.x.w      t4, fa4
                  andi         s5, a7, -1349
                  fsgnj.s      fa5, fs3, ft6
                  fcvt.w.s     s6, fs9
                  sltiu        gp, s5, 1941
                  rem          s0, t2, a3
                  fcvt.w.s     s5, fa7
                  fsgnjn.s     fa3, ft5, fa1
                  sub          t5, s7, a2
                  nop
                  ori          sp, s6, -1983
                  xor          ra, a6, s4
                  fcvt.s.wu    fs1, s11
                  xor          s5, t4, a0
                  fsqrt.s      fa6, ft10
                  addi         s4, s4, -2000
                  slt          s9, t2, a2
                  sltiu        s10, t5, -847
                  fmin.s       fs6, fa3, ft0
                  fdiv.s       ft5, fs2, fs6, rup
                  nop
                  slti         s10, tp, 550
                  feq.s        s8, fa7, fs3
                  fdiv.s       fs5, fs4, fs6
                  mulhsu       s10, t4, s5
                  sub          s4, a3, t0
                  fadd.s       fa2, ft0, fs10
                  fcvt.wu.s    s5, fa7, rne
                  lui          s1, 1025968
                  fsub.s       ft5, fs5, ft0, rtz
                  fsgnj.s      fa4, ft6, ft4
                  mulhsu       tp, t3, s8
                  mulh         a1, s9, a6
                  fmul.s       fa6, fs4, fs2
                  feq.s        t5, fa2, fs8
                  auipc        s10, 75162
                  addi         sp, a3, -464
                  fmv.w.x      fa2, a2
                  add          sp, s11, s6
                  mulhsu       t5, a0, s9
                  addi         t1, s1, -36
                  fsqrt.s      fa5, fa1, rmm
                  fmv.w.x      fa5, t2
                  fsqrt.s      ft8, ft7, rmm
                  srl          t1, gp, s11
                  fcvt.s.wu    ft8, a5
                  auipc        a1, 143812
                  divu         s10, t2, tp
                  auipc        t1, 308636
                  mulhsu       s10, t3, gp
                  ori          s10, a6, 554
                  fcvt.s.w     fs6, a0
                  and          s9, t4, a4
                  feq.s        t4, fa3, ft5
                  fsgnjn.s     fs5, fs2, fa0
                  fmv.w.x      fs7, t5
                  and          a7, t1, a3
                  slli         a1, t5, 25
                  fmv.w.x      ft3, s10
                  fcvt.w.s     s4, ft8
                  div          s4, t4, t5
                  fcvt.s.wu    ft8, a0, rtz
                  and          a1, s6, t2
                  mulhsu       s6, s7, s2
                  mulh         a6, t0, s3
                  fmv.w.x      fs1, a1
                  andi         t6, gp, -1750
                  ori          s10, t2, -1438
                  srai         s5, t3, 19
                  fadd.s       fs8, fa6, fs8, rdn
                  fsqrt.s      fa5, fa7
                  flt.s        t1, ft2, fs8
                  fdiv.s       ft7, fs7, ft0, rne
                  div          a5, a6, s5
                  slt          s2, s5, a1
                  feq.s        t6, ft6, ft0
                  fcvt.s.w     fs11, ra
                  slti         s7, s3, 1981
                  rem          s3, s10, t0
                  lui          a5, 93297
                  add          t1, zero, a0
                  mulhsu       tp, a5, s10
                  div          t5, a3, s0
                  srl          t1, a2, s6
                  flt.s        a3, fa3, fs6
                  divu         a7, tp, s2
                  lui          t3, 673253
                  sra          ra, a4, a1
                  fsub.s       fa7, ft1, fs8, rmm
                  xori         t1, a7, 360
                  fle.s        t4, fa3, ft2
                  fadd.s       ft8, ft11, ft4
                  srli         tp, s6, 30
                  sub          s6, a5, ra
                  fsqrt.s      fs7, ft0, rdn
                  fsgnj.s      fa7, fs7, fs10
                  fmax.s       fs3, fa5, ft4
                  srai         s9, a0, 17
                  andi         s7, tp, -271
                  fmax.s       fa0, fa2, fa2
                  divu         s5, s2, zero
                  fsgnj.s      fs4, ft11, fa6
                  flt.s        s10, fa4, ft3
                  flt.s        s9, fs2, ft11
                  mulhu        s1, t4, s6
                  fsub.s       fs11, ft6, fs0
                  srl          t3, s10, t6
                  andi         t6, a0, 587
                  or           a3, gp, a4
                  add          s1, tp, a3
                  xor          a1, sp, s1
                  fmv.w.x      fs3, t0
                  divu         t5, gp, sp
                  mulh         s0, a6, s9
                  ori          a3, s6, 129
                  fcvt.wu.s    s2, ft6, rup
                  mul          s5, s4, t5
                  fclass.s     t3, fs1
                  mulhsu       a3, s8, s6
                  fcvt.wu.s    s3, ft11
                  auipc        s4, 122133
                  sltiu        s5, t5, -701
                  andi         s1, a1, 961
                  fsgnjn.s     ft1, fs6, fa4
                  divu         t3, a3, zero
                  fmin.s       fs1, fs3, fs0
                  fdiv.s       fs5, ft4, ft4, rup
                  slli         t6, s1, 29
                  slt          s3, a4, s6
                  slli         s10, s3, 20
                  xori         t1, gp, -1871
                  rem          a6, s11, a4
                  fcvt.s.w     fs0, s1, rne
                  srai         t6, s10, 16
                  mulhu        a1, ra, a4
                  rem          sp, s2, s1
                  addi         a1, t2, -506
                  flt.s        s8, ft7, fs1
                  fcvt.s.w     fs2, t5
                  divu         a0, s6, tp
                  fle.s        t5, fs11, ft8
                  mulhu        t4, t2, s6
                  fcvt.s.wu    fs9, a4, rdn
                  fmul.s       fs7, fs8, fs0, rtz
                  remu         t6, s2, ra
                  addi         t6, a1, -518
                  slti         s7, tp, 1885
                  fadd.s       fs10, fa2, fa2, rtz
                  ori          s10, a3, -165
                  slli         s1, t4, 4
                  sub          a2, a3, t3
                  nop
                  sll          s3, s7, t2
                  fclass.s     a1, ft4
                  auipc        s6, 439185
                  fsgnj.s      fs1, fa0, fs0
                  sltiu        s4, s3, -1843
                  fadd.s       ft6, fa2, ft4
                  mulhsu       s10, tp, zero
                  fdiv.s       fs6, fa6, ft11, rne
                  sltu         a3, zero, s0
                  flt.s        a6, ft11, fs2
                  srai         s6, t3, 7
                  feq.s        t4, fs8, fa3
                  srli         a2, s7, 10
                  fle.s        s5, ft10, fa5
                  remu         a2, s4, a5
                  sltiu        a2, a6, -1655
                  remu         tp, s7, t5
                  fdiv.s       ft0, ft1, fs1, rup
                  addi         t2, t3, 1568
                  rem          s3, s6, a3
                  fmin.s       fa7, ft9, ft3
                  fsqrt.s      fa3, fs8
                  sub          a3, gp, a6
                  fmul.s       fs10, fa5, fs10, rtz
                  mulhu        a0, s1, gp
                  div          s6, s5, gp
                  fdiv.s       fa7, fs4, ft5, rtz
                  sll          s7, s0, t0
                  fsgnj.s      fs10, fa1, ft0
                  fadd.s       fa6, fa6, fs11
                  fsqrt.s      ft9, ft7, rmm
                  auipc        gp, 104788
                  fsub.s       fs9, ft9, fa5
                  flt.s        a2, ft8, ft0
                  fsgnj.s      fa5, fs5, ft6
                  fsgnjx.s     ft8, fa0, fa6
                  fdiv.s       fa2, fa1, ft0
                  remu         s2, zero, s4
                  slti         s7, ra, 1552
                  lui          s10, 568449
                  mulhu        t1, s4, sp
                  fle.s        ra, ft5, fa2
                  fmin.s       fs9, fs3, fs7
                  fcvt.wu.s    t3, fs4, rdn
                  slli         zero, t1, 20
                  xor          sp, a1, s9
                  fsgnjx.s     fs9, fs6, fs10
                  xori         s0, s4, 330
                  fcvt.wu.s    t3, fs11, rmm
                  fcvt.s.wu    fa7, t6, rtz
                  mulhu        sp, t6, a6
                  and          ra, s9, a4
                  slli         s3, a7, 11
                  fmul.s       ft11, fa1, ft6, rup
                  lui          s7, 459617
                  fsub.s       ft7, ft1, fa0
                  fdiv.s       fs4, fa7, fa4
                  divu         sp, s2, s0
                  fmv.x.w      t4, fs2
                  slt          s9, tp, a3
                  div          a5, s5, a4
                  mul          a3, a5, a0
                  lui          t4, 834689
                  fsgnjn.s     fs5, fa5, fa3
                  div          tp, t0, a2
                  div          t4, s11, s7
                  fmax.s       fa6, fa7, fs5
                  sltu         s7, sp, s5
                  srai         a0, gp, 12
                  slt          gp, s4, a7
                  slt          s5, ra, s1
                  fdiv.s       ft1, fs1, ft6
                  nop
                  fmin.s       fs7, ft4, fs3
                  fmax.s       fa3, fs10, ft7
                  slt          ra, s3, t2
                  fmv.x.w      s0, fa0
                  slli         s5, s8, 21
                  fclass.s     zero, ft7
                  flt.s        zero, ft9, ft10
                  divu         t1, t2, zero
                  mulhu        tp, s6, a1
                  slt          a1, s4, s5
                  fsgnj.s      ft10, fs3, fa0
                  feq.s        a7, ft10, fs8
                  andi         s9, s8, -727
                  srli         t4, a6, 1
                  fdiv.s       fs9, fa4, fs6
                  fmv.w.x      ft4, t2
                  sra          t4, t2, a2
                  fcvt.w.s     a5, fa1, rup
                  and          s4, a5, ra
                  xor          sp, a4, t6
                  slt          a5, t6, s1
                  srli         a0, s10, 25
                  mulhu        s6, s2, s3
                  divu         zero, s8, a1
                  srl          t4, tp, s7
                  srli         a6, t3, 19
                  fsgnjn.s     fs5, fs11, ft2
                  addi         t2, t0, 952
                  slti         a1, s8, 652
                  fle.s        s2, ft8, fs11
                  mul          s6, a2, s6
                  addi         t3, a4, -1550
                  fsgnjx.s     fa0, fs7, fa6
                  fle.s        a3, fs0, ft10
                  fadd.s       fa3, fs2, ft8, rne
                  fsgnjx.s     ft5, fs7, ft6
                  fmin.s       ft5, fa3, ft3
                  remu         a1, s7, s7
                  slli         a1, t1, 7
                  or           a5, s5, a1
                  fsgnjn.s     ft4, ft8, ft4
                  fmul.s       fs0, fa7, fa0, rup
                  srl          s8, t2, t4
                  remu         a5, a3, a3
                  sltiu        gp, a0, -19
                  fdiv.s       ft9, ft6, ft10, rne
                  mulh         s7, a0, zero
                  srli         t4, a2, 6
                  fclass.s     s3, fs6
                  nop
                  nop
                  sra          s1, s9, ra
                  srli         t5, s9, 14
                  fsgnjx.s     fa4, fs2, ft9
                  xori         s4, s6, 1688
                  fsgnjx.s     ft6, fs6, fa6
                  flt.s        a1, fa2, fa1
                  slli         a7, ra, 20
                  sltu         a7, s2, s4
                  and          t1, ra, t5
                  fsub.s       fs3, fs6, ft10
                  fadd.s       ft6, ft5, ft1
                  fmin.s       fs1, fs7, fs10
                  fcvt.wu.s    s5, fs3, rtz
                  sub          a5, s2, s0
                  fmv.w.x      ft1, gp
                  xor          s8, s7, s2
                  fmax.s       fa0, fs10, fs8
                  div          a1, s9, s7
                  fcvt.w.s     s5, ft2
                  add          zero, zero, s10
                  fsgnjn.s     ft3, fa2, fs5
                  fcvt.s.w     fs2, s2
                  srli         s1, s4, 12
                  fmv.x.w      s4, ft5
                  srai         a1, t6, 21
                  sub          zero, t4, a0
                  fmin.s       ft7, fa4, fs3
                  srl          tp, t2, s2
                  fclass.s     s3, ft0
                  mul          sp, s5, s4
                  srl          gp, zero, a3
                  sltu         a1, a0, s10
                  sub          s6, s9, a1
                  sltu         a2, t4, t2
                  fdiv.s       ft2, fs7, ft0
                  srli         a0, ra, 31
                  flt.s        s5, fs3, fs6
                  mulh         s2, t2, a6
                  slti         zero, ra, 92
                  auipc        s1, 735363
                  nop
                  andi         s6, s9, 1519
                  fadd.s       fs0, ft3, ft2
                  remu         s4, zero, a0
                  mulhsu       zero, s3, ra
                  nop
                  divu         t5, s10, a6
                  srl          s8, sp, s3
                  remu         gp, zero, s7
                  fmul.s       fs7, ft2, fs3, rtz
                  srai         s2, sp, 2
                  flt.s        s7, fa5, fa3
                  slti         a7, zero, -1476
                  mulhsu       a2, a5, a4
                  fle.s        s10, fa7, fs1
                  fsgnjn.s     fs7, fs2, ft0
                  fmax.s       fs11, ft8, ft3
                  fcvt.s.w     fs2, t0, rne
                  rem          ra, s9, s1
                  xor          s5, a5, zero
                  fsgnjx.s     fs11, fa1, fa3
                  fle.s        t4, ft10, fs7
                  slli         a6, s1, 19
                  auipc        s10, 562187
                  slli         s9, a0, 27
                  fdiv.s       fs3, fa4, ft10, rtz
                  sll          s0, gp, t2
                  fmv.w.x      fs0, tp
                  sra          s1, a2, a3
                  sra          tp, ra, gp
                  ori          sp, s10, -1238
                  div          sp, s1, t1
                  sub          s7, s9, a7
                  flt.s        s0, ft10, ft5
                  or           a0, a1, t4
                  sra          s8, sp, a5
                  mul          s5, s8, s5
                  and          a2, ra, s10
                  flt.s        s4, ft4, ft10
                  fmul.s       ft5, fs10, fs3, rdn
                  divu         s1, a6, s1
                  srl          t1, t3, t1
                  fsgnjx.s     ft0, ft3, fa5
                  add          zero, s10, s9
                  flt.s        a0, ft7, fa3
                  fclass.s     t1, ft0
                  lui          s7, 60341
                  xor          sp, t6, ra
                  fmv.x.w      s8, fs0
                  fsqrt.s      fa2, fa7
                  fsgnjn.s     ft6, fs9, fs2
                  divu         s4, sp, a0
                  srl          sp, s4, s11
                  rem          s6, s3, a0
                  auipc        sp, 140233
                  ori          zero, a0, 1072
                  sll          s1, sp, s3
                  fcvt.s.wu    ft9, t0, rne
                  feq.s        t3, fa7, fs4
                  srli         zero, s7, 26
                  xor          s0, t6, t0
                  fmv.w.x      ft6, a2
                  andi         ra, a3, -343
                  slli         zero, gp, 29
                  srai         t4, s6, 3
                  fle.s        a5, fs4, fa7
                  fclass.s     a7, fa2
                  remu         s2, zero, gp
                  fdiv.s       fs4, fa5, fs11
                  fsub.s       fa7, ft1, fs4
                  slt          s9, ra, t1
                  fsgnjn.s     ft0, fa2, ft9
                  slt          zero, a3, t5
                  xor          a6, a5, a1
                  sltiu        s2, a7, 903
                  fcvt.w.s     a5, ft7, rmm
                  fle.s        gp, ft2, ft6
                  remu         t2, s2, s7
                  fcvt.s.w     fa0, s10
                  or           a6, a5, a4
                  sll          t3, s0, t1
                  slli         s9, a2, 11
                  fadd.s       ft9, fs8, fs8
                  fmv.x.w      a0, ft9
                  fmv.w.x      fa7, a4
                  slt          t4, sp, a2
                  fcvt.w.s     t2, fs8
                  fsgnjn.s     ft7, ft9, fa1
                  fmin.s       fa6, fa2, ft9
                  fcvt.w.s     s0, fa1
                  srl          s3, s11, a7
                  sra          a0, ra, s8
                  mulhsu       a3, t3, s2
                  mulh         a6, t6, s2
                  nop
                  addi         tp, s0, -1956
                  mulhu        s5, s0, tp
                  mulh         a5, s8, s10
                  fdiv.s       fa3, fs3, fa0
                  fmul.s       fa7, fa1, fs3
                  sll          a0, tp, a0
                  or           s4, t2, sp
                  fcvt.wu.s    t4, fs9
                  sltu         t2, s0, t2
                  srli         s4, s9, 4
                  xor          t4, tp, t2
                  slti         s9, ra, -1668
                  mulhsu       sp, s9, a3
                  mulhu        s1, gp, tp
                  andi         t5, sp, 1249
                  sra          a5, s5, a4
                  fsqrt.s      fa0, ft7
                  andi         s2, t4, 445
                  fcvt.s.w     fa6, sp
                  auipc        a3, 145720
                  fmv.w.x      ft0, a0
                  fcvt.wu.s    s1, ft2
                  fsgnjx.s     fa7, ft7, fa5
                  lui          s10, 750743
                  feq.s        a7, ft8, fs7
                  mulhsu       s7, t4, t1
                  srai         s7, tp, 15
                  add          sp, t6, s2
                  fadd.s       ft8, fs7, ft1, rup
                  sltu         s9, a2, s6
                  ori          s5, s2, -280
                  slti         sp, s8, -1699
                  fcvt.s.wu    fa2, t6
                  srli         a6, s6, 29
                  fmv.w.x      ft2, a7
                  nop
                  fcvt.wu.s    t6, ft3, rtz
                  fsub.s       fs4, fs9, ft3, rdn
                  slti         a0, t1, -471
                  fmax.s       fs8, fs6, ft1
                  mulhsu       a1, a7, t2
                  sltu         a5, gp, a3
                  fmax.s       fa3, fs1, fa3
                  divu         s8, s3, s10
                  addi         s5, a2, -522
                  mulh         zero, a6, a6
                  sltu         s10, a5, s9
                  mulhsu       s2, s3, s11
                  srl          t4, tp, s10
                  fcvt.w.s     t5, fs10, rdn
                  fadd.s       fs7, ft4, fa4
                  sll          s5, s3, s11
                  mulh         s2, ra, t5
                  srl          t2, gp, t6
                  fmin.s       ft10, fs0, fs7
                  sra          t1, s4, s11
                  fsgnjn.s     fs10, ft9, ft11
                  fclass.s     a2, ft9
                  slti         s6, s9, -742
                  fadd.s       ft0, fs3, ft0
                  sub          s3, a3, a4
                  auipc        s5, 788014
                  andi         t2, tp, -1455
                  fcvt.s.wu    fs0, t2
                  xor          s9, ra, t0
                  fcvt.w.s     s10, ft9
                  fsub.s       fa6, fa5, ft2
                  sra          t3, s9, tp
                  sltiu        zero, t5, -577
                  nop
                  fsqrt.s      ft1, fs4
                  xor          s3, gp, sp
                  divu         a3, s6, tp
                  sub          s7, a3, a0
                  fmul.s       ft7, ft0, fa2, rup
                  srl          t6, t1, a1
                  srai         a2, a6, 26
                  srai         s0, a3, 24
                  mulhu        s1, s6, a0
                  sltiu        s0, a0, 325
                  addi         a7, s2, 1357
                  fle.s        s7, fs8, ft11
                  feq.s        a0, ft5, ft10
                  auipc        t4, 895615
                  fmax.s       ft7, fs2, ft5
                  remu         a1, a2, t0
                  div          a2, s4, s3
                  nop
                  mul          a2, a7, tp
                  sra          zero, a4, t2
                  fcvt.s.w     fs0, s2
                  mulhsu       t2, s3, s2
                  and          s10, tp, tp
                  remu         s2, a1, t1
                  addi         s0, a1, -775
                  flt.s        s3, fs5, fs7
                  lui          s9, 926803
                  fsgnj.s      fs2, ft0, ft0
                  add          s2, tp, s2
                  mulhu        zero, ra, s9
                  fmv.x.w      t4, fa2
                  andi         t4, a3, 1939
                  rem          a2, t2, s6
                  mul          s4, s9, sp
                  srli         s9, s4, 1
                  nop
                  xor          t2, a4, a7
                  ori          t1, a4, 1156
                  slli         gp, s5, 29
                  lui          t4, 65443
                  slli         t6, s3, 17
                  fsub.s       fs6, fs1, fs4
                  mulh         s4, a3, ra
                  rem          s3, t4, s5
                  xor          a2, s10, s10
                  fdiv.s       ft10, fs6, ft10, rne
                  rem          t5, a2, ra
                  fdiv.s       fa0, ft6, ft2, rdn
                  fsub.s       ft6, ft2, fa6
                  slti         a0, s5, -1856
                  fadd.s       fs9, fa0, fs1, rne
                  fmv.w.x      fa4, s7
                  fsub.s       fs6, ft10, ft9, rdn
                  sll          s7, s5, a2
                  sltu         s1, a2, t2
                  lui          a1, 1040025
                  sll          s3, s3, s0
                  slti         a1, t2, -433
                  and          t6, s1, s11
                  sub          s10, t3, s6
                  andi         s6, zero, 892
                  or           t3, sp, s3
                  fclass.s     s2, fs6
                  xor          s3, s9, t0
                  sra          a1, t6, t3
                  fcvt.s.wu    ft5, a2, rtz
                  auipc        gp, 98373
                  lui          s2, 200116
                  mulhu        s0, a6, a5
                  sub          a1, a5, s2
                  srli         s8, a0, 28
                  mulhsu       a6, s4, t0
                  sltu         s0, tp, a6
                  fclass.s     s9, fa3
                  fmax.s       fs1, ft8, ft4
                  fcvt.s.w     fs9, a2, rne
                  nop
                  fmul.s       fs6, fa4, ft11
                  mulhu        a5, ra, s1
                  fcvt.s.wu    ft9, s6, rmm
                  srli         t4, zero, 22
                  srli         s10, a6, 3
                  fsgnj.s      fa7, fs5, ft1
                  slt          s10, t2, s1
                  fclass.s     t3, ft7
                  add          a2, a2, s6
                  remu         s8, t2, t6
                  or           s6, t1, s8
                  addi         s8, sp, 283
                  remu         s1, s10, ra
                  xori         a2, s2, 121
                  sra          s9, a1, t3
                  slli         s10, s7, 26
                  rem          s0, sp, t6
                  mulh         zero, a6, tp
                  fsgnjn.s     ft3, fs5, fs0
                  mul          s0, s9, s4
                  fdiv.s       fa7, fa0, fa3
                  auipc        s9, 948266
                  fcvt.w.s     t6, fa6, rtz
                  feq.s        s3, fa7, fs11
                  slti         s0, a5, -669
                  fcvt.wu.s    s4, fa0
                  fsgnjn.s     fs5, fs9, fa5
                  xori         a1, a1, -1579
                  fcvt.w.s     a5, fa0, rdn
                  feq.s        t3, fs5, ft0
                  auipc        a1, 926409
                  addi         a7, t5, -407
                  sltiu        ra, zero, 1888
                  addi         t2, s10, 1855
                  fmax.s       fs10, fa6, fs8
                  fsub.s       ft9, fs7, ft1
                  add          s5, s6, s2
                  mulhsu       a3, gp, t6
                  fsgnjn.s     ft10, fa1, ft1
                  xor          a5, s1, t2
                  lui          s0, 225657
                  fsgnjx.s     ft11, fa7, ft7
                  fmul.s       ft0, fs8, fs0
                  fcvt.wu.s    t1, fs2
                  feq.s        a5, ft0, fa5
                  remu         s5, a3, t6
                  div          s2, s9, zero
                  and          s7, a5, s6
                  slt          s5, a3, s5
                  mul          ra, t1, zero
                  fsqrt.s      fs3, ft3
                  xori         t4, ra, 937
                  fcvt.w.s     s4, fa5, rne
                  and          a2, t0, t4
                  fsgnjx.s     fa0, ft0, fs5
                  fcvt.s.w     fs5, a4, rtz
                  sub          s3, s11, s10
                  xor          tp, a0, s4
                  sltiu        s7, s6, -449
                  lui          ra, 1591
                  xori         a3, gp, 1158
                  lui          t4, 358007
                  mulh         s7, t5, a4
                  fmv.x.w      a1, fa0
                  mulh         s10, t2, t0
                  fmin.s       fs0, ft6, ft5
                  mul          a0, a0, t1
                  or           a6, s11, sp
                  fsub.s       fs6, fs1, ft3, rup
                  xori         a0, gp, -1395
                  fsgnjx.s     ft0, ft4, fs10
                  mulhsu       sp, s4, a4
                  fmv.x.w      a6, fa3
                  add          sp, s6, t6
                  fcvt.w.s     ra, ft7
                  fsqrt.s      fs10, ft2, rmm
                  fsgnjx.s     ft5, fs8, fa6
                  lui          t4, 275275
                  fmax.s       fs8, fs5, ft2
                  sub          s4, a4, s6
                  fcvt.wu.s    a3, ft5
                  sll          s6, a3, sp
                  and          s1, s10, a1
                  or           ra, t5, a0
                  rem          t5, s11, s1
                  fclass.s     s6, fs11
                  srl          a6, s7, s8
                  fsgnj.s      fs8, fa0, fs10
                  slti         s2, a1, 213
                  xori         a0, a1, 1141
                  mulhsu       zero, t1, ra
                  div          sp, s6, a4
                  fclass.s     s9, fs8
                  fadd.s       fs7, fs10, fs7
                  fsqrt.s      ft10, fa4, rtz
                  srl          s5, s3, s1
                  feq.s        a3, ft1, fa4
                  fdiv.s       ft3, ft7, fs2, rdn
                  mul          a1, t1, s2
                  xor          a0, ra, s1
                  remu         a6, sp, t2
                  and          s0, s1, a6
                  fmv.w.x      ft8, s2
                  sra          s3, s6, a7
                  fmv.w.x      fa0, t1
                  fcvt.s.wu    ft6, s6, rdn
                  fcvt.s.wu    fa3, a5, rup
                  ori          sp, s8, 1141
                  sltu         sp, a1, gp
                  lui          t4, 530449
                  rem          t3, s11, a2
                  remu         a3, a1, t5
                  fle.s        t2, fs10, ft1
                  add          t4, s3, s11
                  ori          tp, a6, 971
                  fcvt.s.wu    fs7, t6, rtz
                  and          s2, a0, zero
                  sltiu        t2, t6, 154
                  auipc        s8, 595213
                  add          a5, s1, t5
                  slt          t3, t5, s4
                  ori          s0, zero, -1098
                  fsgnjn.s     fs10, fs10, ft3
                  lui          a5, 554979
                  rem          zero, a7, t0
                  auipc        a1, 376123
                  xori         t4, a1, -1966
                  fmax.s       fs3, fs7, ft11
                  fle.s        sp, ft8, ft11
                  add          s2, s2, t6
                  sltu         t6, s7, t2
                  sra          t5, s7, t4
                  mulhsu       a2, sp, a2
                  fmin.s       ft1, ft5, fa2
                  fcvt.s.w     ft4, t1
                  remu         a7, tp, s8
                  slli         a2, t3, 15
                  fsgnjn.s     fs2, fs5, fs4
                  and          t2, s8, t1
                  fmv.w.x      fs8, s6
                  srl          zero, a2, a3
                  fmv.x.w      s9, ft4
                  mulhu        a5, s5, zero
                  slti         tp, s2, -2029
                  fsub.s       ft2, fa7, ft8, rdn
                  add          sp, s1, t1
                  ori          s5, s0, 1011
                  fmin.s       ft10, ft6, ft7
                  slli         s4, ra, 24
                  auipc        s6, 198363
                  slli         a6, s10, 1
                  sll          s4, zero, sp
                  slt          s9, s9, a6
                  flt.s        tp, ft4, ft6
                  or           tp, a0, s3
                  nop
                  fsgnjx.s     fa0, fs8, fs5
                  auipc        gp, 776997
                  slli         a2, t3, 18
                  fadd.s       ft10, fs3, fa6
                  fsgnjn.s     fa0, ft1, fa7
                  srl          tp, a5, a1
                  andi         ra, a5, 148
                  mulhu        t4, gp, a4
                  lui          t5, 166340
                  mul          a6, s9, s5
                  fle.s        s9, fs5, fa1
                  fcvt.w.s     tp, fa4
                  feq.s        tp, ft3, ft1
                  fclass.s     t1, fs10
                  ori          s3, a3, 1821
                  fmv.x.w      a0, fs11
                  fsgnjx.s     fa7, fs1, fs11
                  fcvt.w.s     tp, ft6
                  fcvt.s.wu    fa5, t0
                  srai         s3, s8, 6
                  fmv.x.w      s4, fs10
                  andi         zero, s8, -196
                  sll          gp, a1, a7
                  remu         a6, s5, s1
                  fmv.w.x      fs2, t0
                  andi         s8, s6, -779
                  sll          s10, ra, s9
                  divu         t4, a7, s8
                  remu         a1, s4, a7
                  fadd.s       ft4, fs8, ft0, rtz
                  fcvt.wu.s    a6, fa1, rup
                  auipc        s6, 1037222
                  lui          t1, 796624
                  addi         s2, t4, 367
                  fsqrt.s      ft0, ft6, rup
                  div          s4, t3, t2
                  flt.s        s6, fs4, fs7
                  or           gp, zero, t6
                  ori          a2, a0, 1247
                  sub          zero, ra, a6
                  auipc        tp, 708855
                  mul          s5, s5, t6
                  ori          ra, tp, 744
                  addi         zero, t0, 2036
                  add          s9, s4, s10
                  mulhsu       ra, tp, s3
                  xor          a5, tp, s11
                  slti         t5, tp, 189
                  fmul.s       fs7, fs1, fs2
                  mulhu        s0, s11, s9
                  fcvt.s.w     ft1, a1
                  feq.s        t1, fs10, fa5
                  mulhu        t5, zero, a0
                  divu         s8, s3, s5
                  sltu         s8, s0, t0
                  add          s6, s10, a3
                  auipc        a6, 602564
                  remu         zero, sp, a4
                  fdiv.s       fs11, fa0, ft7, rdn
                  sub          t4, s6, s3
                  feq.s        t2, ft2, ft7
                  sra          gp, t6, s3
                  fdiv.s       ft4, ft6, fs3, rtz
                  andi         s9, t1, -1227
                  and          s2, s3, a2
                  add          s4, a6, s2
                  srai         t6, a2, 14
                  sra          t3, s11, t2
                  fmax.s       ft9, fs6, fs11
                  mulh         s1, t6, s10
                  mulhu        a1, tp, gp
                  mulh         s6, s8, s10
                  mulh         t5, t3, a7
                  nop
                  fcvt.wu.s    a1, ft1
                  fclass.s     s6, ft0
                  fsqrt.s      fs5, fs2
                  sll          t3, t5, s0
                  rem          zero, s8, s2
                  feq.s        t5, fs2, ft1
                  feq.s        a5, ft3, fs9
                  lui          s0, 888559
                  sra          s8, a1, s5
                  srli         t6, s1, 14
                  fmv.w.x      ft9, a2
                  fsgnjn.s     fs5, ft0, ft1
                  sll          t1, s10, s4
                  fsgnjx.s     fa3, fs7, ft10
                  fcvt.s.wu    ft0, s5, rdn
                  srli         s9, t2, 27
                  fsgnjn.s     fs11, ft11, fs4
                  fadd.s       fs9, ft8, fs6
                  srli         sp, a2, 23
                  fsqrt.s      fs8, ft6, rne
                  fcvt.w.s     tp, ft1, rtz
                  mulhsu       t2, s10, t1
                  nop
                  fsgnjx.s     fs9, fs7, fa2
                  add          a2, a0, s6
                  fdiv.s       fs10, ft9, ft8, rtz
                  fsqrt.s      ft9, fs0
                  or           a6, s7, t4
                  fsgnj.s      fs4, fa6, fs7
                  fsub.s       fs0, fs0, fa1
                  fcvt.s.wu    fa1, s6, rup
                  slti         tp, t6, -1935
                  xori         s0, t2, -1775
                  fmax.s       fs11, fa4, fa1
                  sra          s2, s1, s2
                  flt.s        s7, fa6, fs4
                  fcvt.w.s     a7, fs11, rmm
                  slli         s2, s7, 0
                  fadd.s       ft3, fs6, fs5, rne
                  divu         s5, s8, t2
                  mulhsu       t6, s3, t4
                  flt.s        zero, fs4, fa0
                  fdiv.s       ft0, ft3, fs9
                  sltiu        s2, s0, 28
                  xor          t6, s0, gp
                  mulh         ra, ra, gp
                  and          zero, s5, t5
                  fcvt.w.s     t6, fa6, rne
                  fcvt.s.w     fs2, a2
                  fsgnjn.s     ft11, fs11, ft1
                  xori         t4, sp, 467
                  ori          a5, a7, 1030
                  and          t2, s7, a0
                  fle.s        s2, fs3, fs1
                  slti         s8, tp, 1169
                  mulhu        t6, a1, s5
                  fmax.s       ft10, fa7, ft11
                  ori          ra, s10, 610
                  sltu         s4, zero, a2
                  srl          t1, s1, s7
                  srl          s7, a4, s4
                  fcvt.w.s     t5, fs0
                  fle.s        a7, ft9, fs5
                  fsgnjn.s     fs5, fa0, fs10
                  fmax.s       ft3, fa0, fa6
                  fmul.s       ft9, ft11, fa3
                  xori         s8, s1, 1510
                  srai         t2, sp, 26
                  sub          gp, s1, t6
                  sll          s7, a3, s6
                  fsgnjx.s     fa6, fs0, fs4
                  mulhsu       t2, s2, t6
                  sltu         t1, t3, a0
                  mulhu        a3, a5, s9
                  sltiu        s0, s6, 895
                  fsgnjn.s     ft8, fs4, ft9
                  mul          gp, s6, s4
                  srai         a7, a1, 22
                  fmv.x.w      ra, fs10
                  xori         gp, s6, -1399
                  fdiv.s       fa6, fs0, fa2
                  fmax.s       ft8, ft1, fs8
                  feq.s        zero, fs1, ft5
                  div          t6, gp, t6
                  ori          s8, a6, -1143
                  feq.s        t1, ft2, ft3
                  remu         t4, t1, a3
                  fcvt.s.w     ft9, t3, rup
                  fsub.s       ft10, ft11, fa1, rdn
                  fcvt.w.s     t1, ft9, rup
                  mulhsu       s2, zero, tp
                  divu         s1, s1, s9
                  srai         a1, t4, 0
                  fsgnjn.s     fa1, fa4, fs5
                  srl          tp, t1, ra
                  fmv.x.w      s4, fs0
                  xor          t4, s9, t6
                  fsub.s       fa4, fs3, fs2
                  fle.s        sp, fs5, fa0
                  add          s10, s2, ra
                  ori          t5, s11, -1289
                  mulhu        a1, tp, a3
                  fsqrt.s      fa2, fs6, rmm
                  fmul.s       fs9, fa4, ft0
                  feq.s        s0, ft4, fa7
                  slti         a7, a4, -1343
                  sll          s9, t0, s3
                  srai         gp, t2, 17
                  ori          a5, tp, -1490
                  fsub.s       ft8, fs2, ft8
                  fmin.s       fa4, ft5, ft7
                  mulhsu       s9, t6, s4
                  rem          s9, a2, t2
                  fdiv.s       fs6, fa5, fs2
                  sltu         a6, a5, a2
                  fmv.x.w      s1, fa5
                  divu         a1, a2, t6
                  fcvt.s.w     fs11, a4
                  fsgnjn.s     fs4, fs2, fs11
                  srl          a3, t3, t1
                  fmin.s       fs3, ft5, fs2
                  fsgnj.s      fs5, fs5, fa3
                  xor          tp, tp, s2
                  fcvt.w.s     a2, ft7, rup
                  fmax.s       fs3, ft8, fs2
                  fclass.s     tp, fa7
                  fcvt.wu.s    a0, fa3, rtz
                  mul          s10, s1, ra
                  fmul.s       fa2, fs8, ft6
                  sra          t4, sp, sp
                  div          a6, s7, t4
                  fcvt.wu.s    t5, fs7
                  fsgnj.s      fs7, fs3, ft8
                  lui          s3, 327962
                  div          s5, s4, s2
                  fmin.s       fs10, fs6, fa4
                  fclass.s     ra, fa1
                  fsgnjx.s     fs0, fs10, fs2
                  fmax.s       fa1, fa5, fa7
                  fmin.s       fs2, fs1, fa1
                  auipc        a2, 668282
                  or           a5, t2, s7
                  lui          a2, 945668
                  sltiu        s9, a0, 845
                  lui          a5, 136895
                  fsgnjn.s     ft3, fs8, fs1
                  fcvt.s.w     ft0, t4
                  srli         a5, gp, 16
                  fcvt.wu.s    s2, ft11
                  fsub.s       fs5, ft1, ft7
                  divu         s3, a1, s3
                  fcvt.wu.s    t5, ft11
                  srli         a5, sp, 10
                  mulhu        a3, s11, s1
                  fadd.s       fs6, ft6, fs4, rdn
                  add          s5, a6, a3
                  fdiv.s       fs2, fa3, ft10, rne
                  slti         s2, s1, -1606
                  mul          s9, t2, a5
                  sra          a3, s10, a6
                  fclass.s     t1, ft4
                  mulhsu       t3, t3, a2
                  slti         s5, a6, 518
                  slli         s2, t1, 24
                  sltiu        s10, s8, 593
                  and          a0, t3, t1
                  rem          s4, a0, s11
                  sra          s7, s4, s0
                  mulhu        s2, a5, a4
                  and          s8, s7, s8
                  lui          tp, 565942
                  slti         sp, s5, -347
                  fsgnjn.s     fa5, fa0, fs4
                  ori          a7, t5, -778
                  add          t3, t6, a5
                  fmax.s       fs10, ft7, fa4
                  srai         s7, a2, 31
                  andi         gp, gp, 1154
                  sltu         a5, zero, zero
                  srl          s2, a5, a5
                  fclass.s     t6, fa0
                  fsgnjx.s     ft11, ft4, ft4
                  fcvt.s.wu    fs0, t5
                  sltu         sp, s8, s6
                  fcvt.s.w     fs8, s2, rup
                  mulhsu       a7, s1, zero
                  sltiu        a0, ra, -1366
                  feq.s        ra, ft2, fa1
                  sra          tp, t2, t3
                  mulhsu       ra, s7, a3
                  fsqrt.s      ft9, fa6
                  feq.s        t5, fs9, fa6
                  lui          sp, 113663
                  div          s5, a7, t0
                  fdiv.s       ft1, fs10, fs1, rup
                  xori         s6, a5, 1203
                  srai         a3, s9, 27
                  fmv.w.x      fa5, tp
                  fsgnjn.s     fs3, ft4, fs4
                  mulh         a5, gp, a0
                  auipc        t2, 488441
                  mulhsu       tp, s11, sp
                  sub          t2, s7, zero
                  fmax.s       ft3, ft1, fa1
                  sll          t2, a4, a7
                  divu         s9, a5, s8
                  lui          tp, 627169
                  fmax.s       fa1, fs5, fa0
                  add          s10, tp, t0
                  lui          a2, 901854
                  add          tp, s3, gp
                  fle.s        s7, fa6, ft5
                  fmax.s       fs8, fs1, ft6
                  fmv.w.x      fa4, s10
                  slt          s2, a5, s3
                  sltiu        s2, t6, -1334
                  fsgnjn.s     fa0, fs8, fs2
                  auipc        s3, 155367
                  mulh         s5, a6, sp
                  sll          a3, t6, a7
                  slli         a5, gp, 30
                  slt          s6, a3, s5
                  fsgnjx.s     ft4, fs7, ft9
                  fmax.s       fs8, fs3, ft8
                  remu         zero, a6, a0
                  fsub.s       fa4, fa6, fs8, rup
                  sra          zero, a0, s6
                  lui          s0, 886273
                  mulh         a5, ra, a1
                  andi         s1, a1, 1641
                  xor          a0, sp, s3
                  slti         a5, s7, -1097
                  srli         t6, t2, 7
                  divu         s7, t4, t1
                  srai         a6, s0, 19
                  divu         s3, s5, gp
                  srl          s3, t1, s3
                  mulhsu       s6, s4, ra
                  fsgnjx.s     ft6, ft1, fs0
                  flt.s        a5, fa6, fa5
                  flt.s        s7, fa0, fa7
                  xori         a3, s6, -802
                  fsgnj.s      ft9, fs3, fs6
                  xori         t3, t3, -492
                  add          tp, s1, s7
                  fsgnjx.s     ft11, fa0, ft8
                  and          s5, s2, t2
                  mulhu        s7, tp, s9
                  sll          gp, a2, zero
                  fcvt.s.w     ft9, s2
                  fcvt.w.s     a1, fs2
                  andi         s10, s1, 1800
                  sra          t6, a4, a3
                  mul          t1, a4, sp
                  fmv.w.x      fs1, a1
                  xor          t1, s5, a2
                  fclass.s     s7, fs0
                  fsub.s       fa2, fs0, fs4
                  xor          ra, a5, a5
                  fmin.s       fs2, ft1, fa1
                  div          gp, s11, s5
                  slti         a2, s2, -744
                  fcvt.wu.s    s2, ft4
                  srl          s10, t5, t1
                  sll          s7, s8, a4
                  and          tp, a2, s2
                  fmv.x.w      a1, ft2
                  rem          s9, t1, t0
                  rem          t4, zero, s9
                  nop
                  xori         s6, t3, 378
                  feq.s        tp, fa2, fa3
                  sll          a6, s9, s3
                  ori          t5, s10, -510
                  rem          s3, t5, zero
                  fmv.x.w      s2, ft9
                  and          gp, t5, a3
                  fle.s        a7, fs3, fa0
                  fsgnjx.s     fa0, ft8, ft11
                  ori          t4, t1, 1540
                  sll          t4, a0, a1
                  slli         a3, t5, 14
                  fcvt.wu.s    s8, fa6, rtz
                  srl          s6, t3, gp
                  or           s10, t6, a1
                  fle.s        s7, fa0, ft6
                  fcvt.w.s     s9, fs9
                  feq.s        a5, fs6, fa1
                  sltiu        a1, t6, 1718
                  fle.s        s0, fs6, fs5
                  fclass.s     t3, ft5
                  rem          s5, s10, t6
                  slti         a0, t1, -1444
                  slt          s7, a7, a7
                  fsgnj.s      fa6, ft9, ft3
                  addi         a5, a6, -1106
                  div          a3, zero, sp
                  xor          tp, tp, t5
                  slti         s4, t1, -1894
                  sll          s3, s11, s9
                  fadd.s       fa4, ft2, fs1, rup
                  feq.s        s3, ft9, ft9
                  andi         t3, tp, -1949
                  mulhu        a1, sp, a3
                  fsub.s       fa6, fs7, fs5, rmm
                  srl          t6, zero, a2
                  sll          s7, s8, t5
                  xori         s2, a1, -1869
                  sub          a7, a3, s3
                  fmv.w.x      fa1, s2
                  fcvt.w.s     gp, fs8, rne
                  xori         ra, s6, -666
                  andi         s9, t4, 2025
                  sub          gp, a0, gp
                  fsub.s       ft0, fa4, fs8
                  ori          a6, s6, 610
                  slt          s7, a0, a6
                  fcvt.s.w     fs11, gp, rmm
                  fcvt.w.s     s10, fs3, rtz
                  mulhsu       s2, s10, t6
                  xor          zero, s0, s2
                  srli         a0, s6, 11
                  flt.s        s4, fa1, ft9
                  fdiv.s       fa0, fs4, fs4
                  addi         a2, t1, 955
                  addi         t6, a6, 1501
                  fclass.s     s2, fs8
                  mulhsu       s0, s0, t4
                  sltiu        s10, s2, 1742
                  srai         tp, t4, 29
                  slt          sp, ra, ra
                  fmin.s       ft8, ft0, fs7
                  auipc        a3, 584291
                  fcvt.s.wu    fs4, t1
                  divu         t5, t2, a6
                  fmax.s       fs8, fa0, ft3
                  sltu         s3, s2, t2
                  slli         a5, a1, 13
                  srai         s5, s9, 3
                  fsgnj.s      fs4, ft1, fa6
                  and          t1, a4, a1
                  remu         t3, a6, s10
                  mulhu        s0, s3, ra
                  fcvt.wu.s    t6, fa1
                  fsgnj.s      fs4, fa1, ft5
                  slt          t1, s8, s6
                  fsqrt.s      ft7, fs0, rtz
                  fmv.x.w      s8, fa0
                  slt          zero, t0, a5
                  flt.s        s6, fs9, fs2
                  fmin.s       fs5, fs0, ft6
                  fdiv.s       fs0, ft1, fa0
                  xor          a2, gp, a7
                  fmax.s       fa4, fa4, fs4
                  fcvt.w.s     s10, fa4, rtz
                  add          gp, t2, s1
                  mulhsu       t2, s5, sp
                  fmin.s       ft1, fs7, ft11
                  div          a1, a2, tp
                  fsgnjx.s     ft3, fs4, fs11
                  slt          ra, s9, s0
                  ori          sp, s10, -571
                  mulhu        sp, t0, t6
                  fsub.s       fa7, ft8, fs4
                  and          a7, s2, a3
                  srl          s5, s6, a5
                  lui          gp, 515426
                  fmax.s       ft3, fa3, ft4
                  fcvt.s.wu    fs0, s8, rdn
                  fcvt.wu.s    s6, fs9
                  fsgnjx.s     ft11, fs7, fa0
                  fsub.s       fa1, fs6, fa0
                  fle.s        gp, fa0, fs0
                  addi         gp, s3, 283
                  fadd.s       fs1, ft2, ft9, rup
                  flt.s        s5, fa6, ft2
                  feq.s        tp, fs8, fa2
                  srl          s4, a4, a7
                  fsub.s       ft3, ft6, fa0
                  mulhu        s7, t0, s6
                  flt.s        t3, fa0, fs6
                  srli         a3, s10, 8
                  fdiv.s       ft0, ft11, fa7, rup
                  fmin.s       fs7, ft9, fs5
                  slt          s8, a0, a7
                  mulhu        s4, a6, t5
                  sub          t3, a5, t5
                  ori          a6, s10, 206
                  mulhsu       gp, s9, s1
                  fadd.s       fs9, fs6, fs6, rmm
                  fcvt.s.w     fa1, gp
                  srl          s7, a6, a0
                  xor          s7, zero, s4
                  fsub.s       ft2, ft4, fs10
                  slti         s0, t2, -126
                  slti         s3, tp, -1755
                  mulhu        s4, tp, s7
                  feq.s        s2, fa1, fa5
                  sll          s3, s6, a2
                  div          s1, s4, a0
                  fsgnjx.s     ft11, ft8, fs6
                  srai         s5, s5, 3
                  mulh         s1, t2, a3
                  slli         a3, a7, 20
                  srli         s4, t3, 1
                  xor          ra, s8, gp
                  slt          s3, t3, s3
                  fmv.x.w      s3, ft0
                  fmv.x.w      tp, fs9
                  fcvt.s.w     ft10, s0, rne
                  fclass.s     gp, ft2
                  fmv.x.w      tp, fa0
                  sll          a3, a2, zero
                  slti         gp, s7, 1418
                  fmin.s       fs1, ft9, ft9
                  lui          s0, 145802
                  fsgnj.s      fs10, fs5, fs5
                  fsub.s       fs0, fs7, ft3, rdn
                  xor          s3, s2, s11
                  fadd.s       fa1, ft4, fa7, rup
                  or           s2, a3, s0
                  divu         gp, sp, zero
                  lui          s8, 157382
                  lui          s9, 1009645
                  sltu         a0, s9, ra
                  ori          s5, s4, 320
                  andi         a3, t6, -1198
                  fdiv.s       fs9, ft11, fs4, rup
                  fdiv.s       fs7, fs2, fs5
                  srli         t3, a7, 29
                  or           a1, a1, t1
                  mulhu        ra, s0, gp
                  fsub.s       ft7, fa0, fs0, rne
                  xor          t2, sp, tp
                  srl          a3, s1, a3
                  mulhu        t2, zero, s7
                  srai         s7, a2, 22
                  nop
                  fsgnjx.s     fs4, fs2, ft7
                  fmv.w.x      ft3, a3
                  mulhu        a6, ra, a0
                  sub          s2, s10, t2
                  div          s4, s0, a6
                  slti         t2, a1, 507
                  or           s7, s4, a1
                  fmv.w.x      fs3, t1
                  sltu         t1, a1, a1
                  sltu         t4, t3, t1
                  srl          s9, s9, ra
                  fcvt.w.s     s5, ft0, rdn
                  fsgnjn.s     fs9, fs9, ft10
                  remu         s5, s9, a7
                  sltu         s1, s2, s8
                  and          s5, tp, s7
                  lui          t4, 652664
                  fcvt.wu.s    s9, fs3
                  fdiv.s       ft7, fa7, ft11
                  auipc        s1, 732846
                  lui          t1, 647870
                  fmv.w.x      fa3, s6
                  add          t6, a7, s6
                  sub          a5, s6, a0
                  flt.s        s4, ft4, ft9
                  sra          t5, a7, s5
                  fclass.s     a0, ft3
                  remu         s0, a3, s2
                  fcvt.s.w     ft9, s2, rmm
                  sra          s3, a2, zero
                  srl          a7, a3, a4
                  auipc        a2, 421012
                  fsub.s       ft9, ft11, ft0, rmm
                  andi         sp, ra, -1316
                  fcvt.s.wu    fs7, s3
                  sub          a2, s10, t1
                  or           s1, a7, s3
                  sltu         s7, t3, t3
                  feq.s        a5, fs3, fs11
                  fsgnjn.s     fa2, fa0, fs3
                  add          s1, t4, s5
                  fcvt.w.s     t3, fs7
                  or           s5, t3, s10
                  sub          zero, s7, a1
                  slti         sp, gp, 445
                  sra          s10, t1, s3
                  xor          a1, t0, a0
                  fle.s        t2, ft8, fa2
                  sltiu        a5, tp, -1438
                  div          t2, s10, s4
                  fsgnjn.s     ft4, ft5, fs5
                  slt          s8, s5, t0
                  mul          tp, s5, s3
                  feq.s        a3, fs2, fa0
                  xor          a1, a2, a5
                  srli         a2, sp, 6
                  add          t4, s0, a0
                  srai         ra, a1, 24
                  mulhsu       t4, a2, a0
                  fmax.s       fs9, ft4, fs4
                  lui          sp, 380430
                  fle.s        a2, ft4, fa3
                  fmul.s       ft6, ft10, ft7
                  slli         a3, t6, 13
                  lui          s1, 348949
                  slt          s7, s2, tp
                  fsub.s       ft8, ft9, fs2, rup
                  fcvt.w.s     a5, fs8, rtz
                  nop
                  fsgnjx.s     fa0, fa1, ft9
                  slt          zero, s8, t3
                  mulh         t2, s7, s9
                  mul          zero, a0, s11
                  fsgnjx.s     ft4, fs5, fs8
                  auipc        s10, 835188
                  sub          s6, a2, zero
                  fdiv.s       ft8, fs9, fs4, rtz
                  divu         gp, t6, s11
                  flt.s        s1, fa5, ft5
                  srli         s2, tp, 17
                  srl          s2, t4, zero
                  fdiv.s       fs2, ft1, fs8, rdn
                  fmv.x.w      a7, fs5
                  flt.s        a0, ft8, fs4
                  fadd.s       fs9, fa0, ft3
                  mul          s2, tp, ra
                  fmax.s       fs11, fs11, ft7
                  fsub.s       fs8, ft10, ft0, rmm
                  or           s6, s11, a6
                  fclass.s     a7, ft4
                  remu         t6, t0, a7
                  fdiv.s       ft10, fs5, ft5, rup
                  fsgnjn.s     fs10, fa5, fs6
                  nop
                  fmv.x.w      a0, ft6
                  fle.s        s1, ft1, fs5
                  remu         a5, s0, s10
                  sltiu        a0, a1, 1101
                  fcvt.s.wu    ft0, s4, rne
                  or           t2, a7, s11
                  fsub.s       ft4, ft8, fs7
                  sltiu        s7, s8, 275
                  srli         t3, gp, 9
                  flt.s        a6, fs1, ft0
                  auipc        zero, 1029632
                  fcvt.s.w     fa7, t6
                  add          s8, s11, s2
                  srl          t4, s1, a4
                  auipc        t6, 104511
                  andi         a3, s10, 2027
                  slli         t2, zero, 14
                  xori         s9, s4, -1958
                  fmul.s       fa4, ft9, fs9
                  mulhsu       s3, s9, a2
                  sltu         zero, s1, t5
                  fmin.s       fs2, ft10, ft8
                  and          ra, ra, a1
                  fdiv.s       ft9, fa5, fs11, rne
                  addi         a0, s9, -1945
                  slti         tp, s4, 874
                  fmv.w.x      ft1, a3
                  xori         tp, a6, 959
                  slti         s5, a1, -1626
                  sltiu        a7, t6, 650
                  or           t2, s0, a0
                  fsub.s       fa4, fa6, fs3, rdn
                  slti         zero, a2, -582
                  mulhu        s7, s8, a4
                  and          zero, s0, t2
                  flt.s        t2, ft5, ft2
                  slti         a0, s4, 1233
                  srai         s8, t4, 28
                  sub          s5, t0, s1
                  or           t4, s8, a4
                  fmin.s       fs7, fs9, fs4
                  slti         t1, s0, -1884
                  mul          a0, t5, ra
                  mul          s10, t4, s4
                  andi         t2, ra, -1165
                  div          t4, t6, a0
                  fsgnjx.s     fs1, ft9, ft4
                  sll          a1, a6, s11
                  rem          t6, gp, t4
                  fsgnjn.s     fs11, ft3, ft3
                  fsub.s       fa0, fs6, fs9
                  fsgnjx.s     fs3, ft0, fs7
                  fcvt.w.s     t4, fa4, rmm
                  fle.s        s4, fa0, ft5
                  fcvt.w.s     s1, ft9
                  slt          zero, t5, t0
                  sll          zero, t2, a4
                  sra          gp, sp, a6
                  fmin.s       fs4, fs9, fs4
                  fsub.s       ft8, fs9, fa5, rmm
                  remu         a7, t2, s2
                  fsqrt.s      ft3, fa2
                  div          a6, s1, a0
                  feq.s        a3, ft3, ft1
                  srl          t3, t0, s8
                  divu         t4, s7, s8
                  lui          s6, 991910
                  slti         a5, s6, 849
                  mulhu        t4, a3, a4
                  remu         a3, a1, s7
                  or           t4, s11, a7
                  fmul.s       fa0, ft5, ft0
                  srli         zero, t0, 23
                  remu         a1, s11, a1
                  addi         gp, a2, 1456
                  remu         a1, ra, a1
                  fmax.s       ft6, fa2, fs2
                  fmv.w.x      fs6, a2
                  auipc        a0, 436775
                  fclass.s     zero, fs11
                  fadd.s       fs3, fa7, fa2, rtz
                  xori         t5, s5, 598
                  fmax.s       fa7, fs5, fs9
                  divu         s10, a3, a5
                  fmv.w.x      fa3, a4
                  flt.s        t4, ft5, fs3
                  mulhu        tp, s10, s6
                  or           t5, s4, ra
                  slli         t6, gp, 27
                  flt.s        zero, ft5, fs5
                  slli         a5, t6, 15
                  slti         s0, a4, 301
                  feq.s        tp, fa6, ft1
                  fle.s        t5, fs7, fa5
                  fclass.s     t2, fs3
                  srl          a7, s4, zero
                  fclass.s     t4, fs1
                  rem          s3, tp, ra
                  slt          s3, t6, t1
                  mul          zero, t0, sp
                  fmin.s       ft9, fa3, fs4
                  addi         t6, sp, -1972
                  fmv.x.w      tp, fa3
                  fsgnjx.s     ft5, ft5, ft0
                  sll          t5, t6, s4
                  sltu         gp, s6, t6
                  addi         s1, s7, 871
                  fmv.w.x      fs7, s6
                  auipc        t3, 149164
                  andi         zero, gp, 1580
                  fsgnjx.s     fs6, fa0, fa7
                  fmul.s       ft6, fa0, fs3
                  sltu         a0, t0, a6
                  or           s3, t1, t1
                  fclass.s     a2, ft1
                  div          zero, t4, t0
                  slli         t4, s2, 12
                  fcvt.wu.s    t5, ft6, rmm
                  srl          tp, a3, a7
                  and          a1, t3, s3
                  fsgnj.s      fs5, fs3, fa2
                  xori         ra, t3, 822
                  fclass.s     a7, ft6
                  sltu         t2, a0, s5
                  sltu         s2, s1, s3
                  slt          a1, a0, t0
                  add          t5, t3, t4
                  fdiv.s       fs7, ft3, ft0
                  mulhu        a3, a1, s7
                  xori         s3, ra, -1407
                  fsqrt.s      ft9, ft4
                  srai         gp, s9, 13
                  sra          s0, s2, a0
                  lui          s10, 634415
                  fle.s        t5, fs11, ft11
                  fmv.w.x      fs6, a3
                  fclass.s     s7, fs4
                  xor          a0, gp, t3
                  fdiv.s       ft0, fs6, fa4
                  flt.s        s9, ft9, fs4
                  fcvt.s.w     fs6, s11, rup
                  fcvt.s.w     fs0, a7
                  lui          s1, 882429
                  addi         s8, a5, 1674
                  sltiu        t2, s0, -288
                  fadd.s       fa3, fa2, fs5
                  xor          s2, a3, a7
                  mulhsu       zero, a2, s8
                  fsub.s       fa0, fs6, fa5, rup
                  fmin.s       fs3, ft0, fa3
                  xor          s5, a3, a6
                  fmv.w.x      fa7, zero
                  lui          t3, 697374
                  nop
                  ori          gp, a4, 275
                  fdiv.s       fs7, fa3, fs9, rne
                  rem          t6, s3, s3
                  feq.s        a1, ft9, fa2
                  sltu         s3, s1, ra
                  srli         s4, a1, 21
                  sra          a2, sp, s8
                  fmin.s       ft10, fa1, fa4
                  mulhu        a7, a4, t1
                  and          t3, tp, t3
                  lui          s5, 56828
                  fsgnj.s      ft11, fs2, fa6
                  fle.s        ra, fs4, ft4
                  rem          t1, s6, s6
                  mulhsu       sp, a1, a5
                  fmv.w.x      fa3, a6
                  mulhu        s5, t3, s5
                  fmv.w.x      ft6, a1
                  sub          s9, a4, t6
                  fmv.x.w      t5, ft3
                  mul          s0, t6, a5
                  fmv.x.w      s2, ft4
                  remu         s3, t1, a3
                  slt          s4, s1, a6
                  sltiu        s8, a6, 974
                  lui          a1, 811794
                  fsgnjx.s     ft6, fa3, fa0
                  nop
                  feq.s        ra, ft11, ft0
                  rem          a3, s4, s5
                  nop
                  divu         s10, t0, ra
                  xor          s5, s8, s10
                  mulh         zero, t4, s5
                  fmin.s       ft4, fs0, fs6
                  mulhsu       gp, t2, t6
                  fdiv.s       ft5, fs11, ft4
                  flt.s        a1, fa3, fa4
                  srl          a1, s6, a5
                  flt.s        gp, ft2, ft11
                  fcvt.wu.s    t3, fs7
                  slli         ra, s9, 18
                  fsqrt.s      fs5, ft6, rdn
                  fmv.w.x      ft5, s6
                  nop
                  sltu         s9, s2, s11
                  mul          tp, tp, s4
                  fmv.x.w      a3, fs8
                  mulhsu       t5, s5, a2
                  mul          zero, gp, s7
                  add          a1, a3, s5
                  fadd.s       ft1, fs10, fs11, rmm
                  sra          gp, a5, s7
                  srli         s5, s7, 29
                  mulhsu       s7, a3, a1
                  or           s0, t3, a4
                  nop
                  fcvt.s.w     fs11, s2
                  add          zero, s0, t6
                  fcvt.wu.s    a6, ft7, rtz
                  sltu         ra, s8, s3
                  feq.s        tp, fa4, fs8
                  srli         s2, s8, 5
                  mulhsu       zero, s11, a4
                  fsgnjx.s     fs8, ft7, ft11
                  rem          s0, s2, zero
                  fcvt.w.s     t1, ft0
                  nop
                  srai         a5, s11, 25
                  add          s0, s3, a7
                  mulhu        s7, a4, ra
                  sra          sp, s10, s10
                  andi         t5, gp, 1117
                  add          a3, s5, t1
                  fsub.s       ft10, fa7, fs11
                  fclass.s     s4, fa7
                  srai         gp, t0, 20
                  flt.s        tp, fs1, ft8
                  fcvt.s.wu    fa3, s4, rmm
                  fdiv.s       fa3, ft5, fs6
                  div          t5, a1, a5
                  add          s0, t2, t1
                  and          t6, t4, gp
                  srai         s1, s0, 18
                  sll          s0, t2, t5
                  fsub.s       fs9, fa6, fs11
                  mulhsu       s0, a3, a3
                  mulh         a7, a1, sp
                  slli         a2, sp, 19
                  fclass.s     tp, fs11
                  mul          a6, a4, a2
                  fsub.s       ft9, fs0, fa2, rmm
                  srai         s10, s0, 6
                  sra          t5, s11, s7
                  andi         s5, a1, -771
                  lui          a0, 554979
                  nop
                  fle.s        zero, ft4, ft11
                  rem          zero, s8, a1
                  fsgnj.s      fa5, fs2, fs0
                  fmax.s       fs10, ft0, fa2
                  fcvt.s.wu    ft8, s4
                  fmv.w.x      fa7, s4
                  div          t3, t6, a0
                  divu         t5, a3, s3
                  fcvt.s.wu    ft0, s9
                  flt.s        s4, fs1, ft4
                  andi         ra, sp, -2029
                  fmin.s       ft1, fa5, fs6
                  srli         a5, a7, 27
                  fmin.s       fa5, ft2, fa3
                  srli         s8, s4, 28
                  fmv.w.x      ft1, s8
                  nop
                  fcvt.w.s     gp, fs11, rtz
                  fmul.s       fs0, fa1, fa3, rne
                  add          gp, s9, s11
                  fmin.s       fa7, fa0, fs10
                  divu         gp, sp, a5
                  fcvt.s.w     fs5, t6
                  fmax.s       fa1, fa1, fs9
                  sra          s9, t1, s2
                  fsgnjx.s     ft5, ft4, fa2
                  fcvt.w.s     t3, fs4, rup
                  fsgnj.s      fs10, fs6, ft11
                  slti         s4, ra, 722
                  ori          s5, s7, 1496
                  mulhsu       a5, t2, s6
                  fsgnjx.s     fs3, fs3, fs9
                  fadd.s       ft5, ft10, ft7
                  fmax.s       ft2, ft4, ft3
                  fcvt.w.s     ra, ft4, rne
                  rem          s5, a4, gp
                  fsgnjx.s     fs3, ft9, ft2
                  flt.s        gp, ft8, fs0
                  fmul.s       ft7, fs2, fs11, rdn
                  andi         a2, a0, -1028
                  slti         a5, sp, -156
                  fsqrt.s      fs9, fa1
                  and          s1, a4, t4
                  fmin.s       fa6, fs0, fs2
                  fsqrt.s      ft9, fa5, rtz
                  fclass.s     t3, ft7
                  fmin.s       fa7, fa3, fa5
                  fsgnjx.s     fs1, ft2, ft0
                  mul          s9, s9, s4
                  flt.s        s0, fs10, fa0
                  remu         a3, t2, t0
                  fdiv.s       fa3, ft10, ft4, rtz
                  xori         a6, s3, -968
                  srli         s7, t3, 15
                  mulh         a6, a3, zero
                  xori         sp, zero, -709
                  sltiu        s5, t2, -1165
                  fcvt.wu.s    a6, fa4
                  fcvt.s.wu    ft4, tp
                  sub          s6, s10, sp
                  srli         a0, s9, 0
                  sll          gp, t1, a1
                  mulh         t6, t6, a6
                  ori          t1, a5, -1978
                  fcvt.w.s     a6, fs9, rup
                  sub          s3, s1, t2
                  fmul.s       fa4, fa7, fs6
                  sltu         a1, s11, s6
                  mulhsu       s4, t6, a3
                  mulhsu       s1, a2, s1
                  sltiu        tp, s6, -1005
                  fmv.x.w      gp, fa4
                  fmv.x.w      s7, fa3
                  fadd.s       fs1, fa1, ft6, rne
                  srl          s1, a6, tp
                  sltu         a6, s1, s11
                  fmv.x.w      gp, fs0
                  srl          s5, zero, t0
                  fmul.s       fs6, ft9, fa1, rup
                  or           a2, tp, t0
                  lui          t6, 163495
                  auipc        s2, 53596
                  fmv.x.w      a1, fs8
                  xori         a5, gp, 2032
                  fmv.x.w      s2, ft8
                  andi         s9, tp, -1122
                  mulhu        s5, s9, s2
                  mul          s9, a3, a5
                  slti         sp, s8, 313
                  fmin.s       fa4, ft10, fa6
                  fmv.w.x      ft2, s10
                  fclass.s     s8, ft10
                  mulhu        a6, a1, t0
                  div          s7, s0, s9
                  fmv.w.x      ft8, s2
                  feq.s        a6, fa2, ft0
                  mul          t1, t5, s4
                  fcvt.w.s     a1, fs6
                  xori         s0, s9, 1376
                  fcvt.w.s     tp, ft8
                  nop
                  fmv.w.x      fa0, a7
                  fsgnj.s      ft4, fa2, fs2
                  sra          s6, ra, t5
                  mulhsu       s4, a3, t5
                  fcvt.w.s     t5, fa7
                  fsgnj.s      fa2, fs5, fa5
                  fmv.x.w      ra, fa1
                  div          s3, zero, sp
                  xori         a5, a1, 564
                  sltiu        s2, s11, -1980
                  sltiu        a3, t6, 842
                  nop
                  fdiv.s       ft0, fs5, fa1, rdn
                  add          t1, tp, sp
                  remu         s3, t3, s3
                  fcvt.w.s     s10, ft8
                  fmv.x.w      a6, ft2
                  feq.s        a5, fs1, fs4
                  addi         a1, t3, 1521
                  xor          s0, a0, a6
                  fsqrt.s      ft9, fs7, rdn
                  and          t4, a0, s4
                  fcvt.s.wu    ft3, a7, rup
                  sra          s7, s3, a2
                  add          s0, s8, s8
                  mulhsu       a6, s3, t5
                  fdiv.s       ft6, fa4, fa3, rup
                  fcvt.w.s     a6, fs1
                  fmax.s       ft6, fs2, fa6
                  fmax.s       ft4, fs0, ft10
                  fcvt.s.wu    fs10, t2, rdn
                  ori          s9, gp, -1439
                  fsub.s       ft1, fs3, fa1, rdn
                  fmin.s       ft2, ft5, ft8
                  flt.s        s1, fs11, fs10
                  lui          zero, 1014750
                  divu         a2, s2, t1
                  lui          s7, 900627
                  andi         t6, a2, -1276
                  fcvt.s.wu    ft7, t1, rmm
                  fcvt.w.s     s10, fa6
                  fcvt.s.wu    fs4, s4, rmm
                  lui          s0, 712287
                  mul          ra, t0, a1
                  fsgnjn.s     ft11, fa2, fs3
                  rem          zero, t0, s2
                  remu         a0, a3, tp
                  xor          s6, t4, s7
                  auipc        a2, 887138
                  fmv.w.x      fa4, s2
                  addi         s3, s4, -374
                  feq.s        s9, ft7, fa4
                  flt.s        s0, fa2, ft10
                  slti         s5, s5, 639
                  sltu         s7, a1, a0
                  or           t6, s0, s5
                  rem          gp, s4, a2
                  divu         s10, ra, a7
                  srai         t2, a6, 17
                  and          sp, s6, s11
                  sltu         a2, s8, s9
                  fclass.s     s10, ft0
                  feq.s        ra, ft5, fa7
                  fsgnjx.s     ft8, fs9, fs5
                  fmax.s       fa6, fa2, fa4
                  auipc        a6, 338100
                  srl          s9, s3, t1
                  mulhu        s2, t4, a2
                  sltiu        s6, tp, -752
                  slt          t4, s4, t2
                  slt          a0, t3, zero
                  sub          t3, s10, s4
                  mulh         s4, t4, tp
                  rem          s10, s7, s5
                  fsgnj.s      fs6, fs9, fs0
                  sub          t1, t4, s10
                  andi         a3, t2, -935
                  sra          s0, t1, s10
                  auipc        s9, 1034322
                  feq.s        a5, fa6, ft3
                  flt.s        s2, ft3, fa4
                  mul          s5, t4, a4
                  fsub.s       ft2, fs11, ft0, rtz
                  sll          gp, s8, s5
                  divu         s8, s11, s3
                  andi         a0, s0, 1605
                  fsgnjn.s     fa3, fs4, fa3
                  flt.s        t4, fs8, ft4
                  flt.s        s5, fs7, ft9
                  srl          t2, s8, s4
                  fadd.s       fa7, fs5, fs2
                  mulhsu       zero, s3, t1
                  fmv.w.x      ft10, s7
                  rem          s0, a4, s2
                  nop
                  fdiv.s       fs0, ft9, fa3, rdn
                  slt          s3, t6, s4
                  sra          s6, s5, a4
                  andi         t4, s8, -739
                  lui          s5, 231301
                  fmv.w.x      ft2, sp
                  slli         a6, s8, 29
                  slti         a5, s4, -1071
                  add          t1, tp, s10
                  add          t5, gp, s0
                  slti         s2, s10, 506
                  srai         a7, s5, 29
                  fcvt.wu.s    s2, fs7
                  xor          s0, gp, ra
                  lui          a3, 268431
                  addi         a6, a1, -339
                  fmv.w.x      fs1, s2
                  remu         s6, t6, s4
                  mulhsu       gp, s2, s10
                  nop
                  xor          s4, s1, s2
                  fdiv.s       fs6, fs4, ft7, rdn
                  and          s8, s8, a6
                  fadd.s       ft5, fa3, fs11
                  flt.s        sp, fa5, fs5
                  flt.s        s5, fs5, fs0
                  divu         s5, sp, a5
                  srl          s10, a5, a4
                  sra          s7, a0, s1
                  sltu         t5, t0, s10
                  fsgnj.s      ft7, fa6, fa7
                  fsgnjn.s     fs5, ft10, fs0
                  fsgnjx.s     fs7, fs2, ft11
                  fsgnjn.s     fs11, fa7, fs5
                  sltu         tp, t3, s10
                  fmax.s       ft0, fs5, ft11
                  addi         a7, s11, 1174
                  and          s1, s7, t3
                  fsgnjn.s     fs1, fs0, ft5
                  addi         a2, s2, -1177
                  and          s9, s11, zero
                  xori         a1, a5, 1988
                  srl          t2, zero, s4
                  fsub.s       fa7, fa7, ft2
                  add          t6, s8, a0
                  slt          a0, a6, a4
                  srli         a2, s6, 8
                  srl          a5, a6, ra
                  mulhsu       s0, a0, s7
                  fmax.s       fa7, fs10, fa5
                  rem          a3, sp, s10
                  auipc        s5, 214297
                  srli         t3, tp, 31
                  ori          t6, s2, -705
                  fmv.w.x      ft9, t2
                  remu         a7, s6, s9
                  slti         t1, t5, -1458
                  or           s4, t6, s2
                  fsgnjn.s     fa5, fa7, fa1
                  fadd.s       ft10, fs3, fs5
                  mulhsu       s10, ra, t1
                  mul          gp, a3, a0
                  sltu         s4, a4, sp
                  or           t1, t5, gp
                  fsgnj.s      fs4, ft2, ft8
                  mulhu        s5, s3, t3
                  sltiu        s7, t1, 751
                  andi         a2, s0, -1659
                  fsgnjx.s     ft6, fs6, fs7
                  feq.s        s5, fs6, ft8
                  mulhu        sp, t2, s7
                  fadd.s       fs4, fa0, fs0
                  add          s0, s2, t6
                  fcvt.wu.s    t2, fa4
                  fcvt.wu.s    s2, fs6
                  div          s3, a3, zero
                  sra          s5, t1, t6
                  fclass.s     a6, fs3
                  fclass.s     sp, fa4
                  addi         s4, t2, 121
                  fdiv.s       ft9, fs11, ft3, rne
                  sltiu        zero, s4, 706
                  nop
                  mulhsu       s8, sp, tp
                  srl          s9, s3, sp
                  fsgnjx.s     ft6, fa1, fa7
                  fmax.s       fs11, ft11, ft9
                  sub          t4, t2, s11
                  fmv.w.x      fa2, a7
                  fcvt.wu.s    a1, fs9, rtz
                  fsgnj.s      ft1, fa2, fa7
                  divu         tp, s5, t0
                  addi         s1, s4, -143
                  fcvt.s.w     fs1, a1, rup
                  or           t1, t4, t4
                  fmax.s       fs7, ft11, fs0
                  fdiv.s       ft4, fa0, fa0
                  and          s2, gp, s2
                  rem          a5, a1, s8
                  slli         s8, s2, 12
                  andi         sp, zero, -850
                  fcvt.s.wu    ft6, t2, rdn
                  nop
                  fcvt.w.s     a7, fs8
                  fsgnjx.s     fa4, ft7, fa3
                  flt.s        tp, ft4, fs6
                  divu         a0, s9, ra
                  fsgnjx.s     ft10, fa2, ft11
                  slli         a6, s3, 31
                  fcvt.s.wu    fs5, t4
                  fsgnjn.s     fs10, fs3, fa7
                  slti         s0, t3, -1042
                  slli         s9, s2, 15
                  slti         t2, tp, 411
                  fmv.w.x      fa6, gp
                  slti         t1, tp, -1263
                  feq.s        tp, fs10, ft8
                  nop
                  divu         s2, t4, tp
                  fmul.s       fs5, fa7, ft8, rmm
                  nop
                  rem          a2, s6, s0
                  fmv.x.w      a3, fa6
                  slti         t6, a7, -53
                  fcvt.wu.s    s0, ft6, rtz
                  fcvt.w.s     s4, fa0, rup
                  fcvt.w.s     s10, fa0
                  slt          gp, zero, a3
                  mulhu        gp, a7, tp
                  rem          s3, s1, s1
                  fcvt.w.s     s1, fa0, rmm
                  fclass.s     s1, fa4
                  fmul.s       fa6, fa7, ft4
                  fcvt.wu.s    s3, fa0
                  nop
                  xor          tp, a2, a5
                  fmv.x.w      t2, ft5
                  fsqrt.s      fa5, ft8
                  srl          a6, a0, a6
                  add          ra, a4, sp
                  srl          s6, s3, gp
                  mulhsu       s8, gp, a5
                  mulh         a5, a7, t6
                  slt          s5, tp, a3
                  nop
                  fmax.s       fa7, ft8, fs8
                  fsqrt.s      ft11, ft10
                  srli         s3, s9, 3
                  fcvt.w.s     s7, ft4
                  fsqrt.s      fa4, fs10
                  div          t5, s9, a3
                  fsub.s       fa1, ft11, ft11, rdn
                  mulhsu       tp, a0, tp
                  rem          tp, gp, ra
                  fcvt.s.w     fs6, s8
                  fle.s        sp, fs9, fa1
                  fmv.w.x      ft2, gp
                  mulhu        t6, a6, ra
                  nop
                  sra          s7, tp, s0
                  fcvt.s.w     ft10, a3
                  fsub.s       fa3, fs10, fa2
                  fmin.s       fa1, ft11, fs11
                  fsgnj.s      fa0, fs11, fa1
                  sub          t2, a1, a0
                  srl          a0, a3, s4
                  fmin.s       fs4, fa5, fa6
                  flt.s        a2, ft2, fa7
                  fmax.s       fs6, ft4, fa3
                  fsqrt.s      ft10, fs0
                  fsqrt.s      ft6, fs1
                  sltu         s3, t4, s1
                  and          sp, sp, a0
                  fmv.w.x      fs5, s5
                  fcvt.wu.s    s0, fs4, rmm
                  fsub.s       fs9, ft10, fs5, rtz
                  fsub.s       ft11, fs10, fa4
                  sltiu        tp, s9, -690
                  fsqrt.s      fs11, ft0
                  fcvt.w.s     s10, fa4
                  ori          a3, t0, -820
                  fmin.s       ft10, fa4, ft6
                  fsgnjx.s     fs10, fs11, fa0
                  xori         ra, s9, 1191
                  fsgnjx.s     fa3, fa3, fs3
                  slt          a7, a4, t6
                  fsgnjx.s     ft11, fa6, fs1
                  flt.s        zero, fs11, ft10
                  fle.s        a2, fs11, fa2
                  fle.s        t2, fa4, ft6
                  andi         s6, t3, 957
                  srli         gp, s1, 14
                  remu         s7, t3, t4
                  fcvt.s.w     fs10, a2, rmm
                  fsgnjx.s     ft8, fa4, fs0
                  fcvt.s.w     fa7, sp, rdn
                  sll          s3, a6, a0
                  fmax.s       ft6, ft9, fa6
                  fle.s        s0, fa7, ft0
                  srl          t4, a7, s9
                  fsub.s       fa2, fa3, fs4
                  fcvt.w.s     s5, fa0, rmm
                  sub          a1, a5, ra
                  feq.s        a1, ft8, fs1
                  div          a5, s4, a6
                  sll          s10, a3, a5
                  fmin.s       fa3, ft0, fa3
                  add          a6, t3, s1
                  mulhu        t5, a4, s7
                  fsgnjn.s     ft0, fs10, fs0
                  divu         t5, t1, t2
                  sltu         t2, t2, t2
                  slti         tp, t0, -1745
                  rem          tp, s5, t5
                  xor          s10, a1, a7
                  slli         a0, t3, 13
                  slli         t2, a0, 28
                  ori          t1, ra, -1452
                  divu         a1, s1, s3
                  sll          t2, s9, a2
                  sra          s6, t1, a3
                  feq.s        a2, fs3, fa7
                  fle.s        t1, fa6, fs7
                  srli         s6, s5, 9
                  fmv.x.w      a2, ft9
                  remu         s7, s4, t0
                  mulh         a0, t1, t4
                  or           a7, zero, a6
                  div          t4, a0, t1
                  fmv.x.w      sp, fs3
                  fsgnjn.s     fs8, fa6, fs3
                  sltiu        a0, t1, 166
                  lui          gp, 160732
                  sltu         s9, s1, gp
                  fmin.s       fa7, fs4, fs4
                  slli         tp, t3, 27
                  mulhu        s0, t5, s9
                  divu         s0, ra, zero
                  fsgnjx.s     fs1, fs8, ft0
                  rem          s3, s7, t1
                  sra          t3, ra, t4
                  fmin.s       ft2, ft6, fs3
                  fle.s        t5, ft1, ft4
                  fcvt.s.w     ft2, s9
                  divu         s3, s2, t2
                  sra          s5, t3, s2
                  feq.s        t5, fs5, fs5
                  divu         a2, s10, a4
                  ori          s1, zero, -1043
                  add          s2, zero, s2
                  fadd.s       fs8, fs9, fs10
                  remu         s3, s1, a7
                  mulhu        a5, a1, s6
                  lui          t2, 162065
                  and          zero, s9, s6
                  sll          s1, t0, sp
                  fmv.x.w      t1, fa1
                  fmul.s       fs2, ft5, fa6, rmm
                  sub          s9, s11, a4
                  feq.s        a7, fa3, fs1
                  sltu         t2, a6, sp
                  ori          t5, s5, 266
                  fadd.s       fs7, fa6, fa4
                  and          a7, s10, t1
                  fmin.s       ft5, fa1, fs8
                  sra          t5, t4, a7
                  andi         a2, s3, -1080
                  nop
                  srai         s2, sp, 5
                  slti         s4, s7, -1145
                  fmv.w.x      fa4, s5
                  andi         s4, tp, 2027
                  slli         t3, a2, 6
                  fmul.s       fs7, ft1, ft4
                  sll          s9, zero, t6
                  fcvt.s.wu    ft10, s6, rtz
                  fcvt.w.s     s10, fs5, rtz
                  sra          s8, t6, ra
                  sub          s7, gp, s2
                  addi         tp, a4, 596
                  rem          zero, tp, t1
                  flt.s        sp, ft6, fa4
                  addi         t3, t3, -112
                  mulhsu       t2, a7, a1
                  fle.s        a2, fs1, fs8
                  rem          t5, s2, t0
                  auipc        s5, 1030974
                  mulh         s3, t5, ra
                  xori         s4, s6, -1142
                  fcvt.w.s     s5, fs10, rup
                  fsub.s       fa7, ft0, fs11, rne
                  fmax.s       ft8, fa5, ft5
                  sra          t1, s4, a6
                  srl          a6, s1, t3
                  fmul.s       fs11, fs10, ft8
                  slli         t3, a5, 24
                  remu         ra, t4, s2
                  fcvt.s.w     fa4, a3
                  fmin.s       fa3, fs9, ft9
                  fmax.s       fa1, ft6, ft5
                  xor          s7, t3, zero
                  lui          a6, 501922
                  mulh         a7, a2, t0
                  mul          zero, s10, t4
                  fsub.s       fa5, fs8, fa7
                  fcvt.s.w     ft10, t0, rtz
                  slti         s6, s1, -468
                  mulhsu       a5, t1, a4
                  fsqrt.s      fs3, ft8, rdn
                  divu         s7, t5, s2
                  nop
                  feq.s        t4, fs1, fs1
                  xor          a3, t0, a1
                  fmv.x.w      s8, fs7
                  mulh         a6, t4, s4
                  slti         s9, zero, -772
                  fmv.x.w      a3, fs11
                  slti         t4, t0, -1654
                  srl          tp, sp, tp
                  fcvt.wu.s    t1, fa5, rdn
                  slt          a1, a6, s3
                  fsub.s       fs0, ft8, ft5, rne
                  slli         a5, t6, 27
                  fmax.s       fa2, ft3, ft0
                  sltiu        a0, s8, 271
                  lui          s6, 795682
                  feq.s        t4, fa2, ft8
                  mulhsu       s8, sp, t5
                  andi         s2, s0, 943
                  fmax.s       fa7, ft6, ft3
                  mulh         s8, t2, ra
                  fsgnjn.s     ft7, fa2, fs10
                  and          s6, tp, ra
                  fsqrt.s      fs9, fa4
                  fcvt.wu.s    t1, ft0, rtz
                  sll          s2, s9, s0
                  fmv.w.x      fs9, s5
                  fcvt.s.wu    ft8, s5, rmm
                  fclass.s     ra, ft2
                  srai         s10, ra, 24
                  andi         s0, t3, -678
                  mulhsu       s4, a7, s11
                  and          s7, t5, s5
                  or           a2, a3, a4
                  flt.s        s3, fa2, ft10
                  srl          s9, t3, s11
                  fadd.s       ft0, ft8, fs6, rdn
                  slt          s10, t0, s6
                  fmul.s       ft4, ft7, fs1, rtz
                  feq.s        t4, ft11, fs6
                  fmv.x.w      a1, ft1
                  fmax.s       fa2, ft10, ft9
                  lui          t6, 511312
                  fcvt.w.s     gp, fa7
                  fmin.s       ft0, fa0, fs10
                  fsqrt.s      ft2, ft6
                  slti         s9, t4, -1877
                  remu         a0, s8, a4
                  lui          s6, 263274
                  xor          t3, gp, s5
                  lui          s10, 250297
                  flt.s        t2, fs0, ft7
                  fle.s        t1, fa2, fa7
                  fsgnjx.s     fs8, ft4, fs8
                  fmv.x.w      ra, ft9
                  fcvt.w.s     zero, fa7, rne
                  fsqrt.s      fa4, fa1
                  fmin.s       fs5, fa3, fs0
                  xor          t5, zero, t6
                  fmax.s       fs8, fa5, fa7
                  or           tp, a7, s10
                  divu         a6, s8, s4
                  sll          sp, a7, t1
                  and          a0, a7, t1
                  sltu         a3, s6, s2
                  fsgnjn.s     fs4, fs5, fs2
                  fsgnjx.s     fs9, ft6, fa3
                  sltu         gp, t4, a5
                  divu         gp, a1, s8
                  fmul.s       fs10, ft5, fa0, rmm
                  sll          s9, gp, s8
                  srl          a5, sp, s0
                  feq.s        s6, fs11, fs1
                  remu         s4, a7, a0
                  divu         a3, s9, a4
                  fsub.s       fs5, fa3, ft0
                  divu         s2, t4, a2
                  fsgnjx.s     ft7, fa7, ft4
                  slt          s1, s8, s5
                  fmv.x.w      s0, ft5
                  remu         a5, s9, t0
                  mulh         s10, a3, ra
                  lui          a0, 571049
                  fsub.s       ft7, ft8, fa2
                  rem          a2, tp, s7
                  fcvt.wu.s    ra, fs6
                  xori         a5, s9, -514
                  mulhu        s2, s5, a7
                  fmax.s       ft5, fa1, fs7
                  slti         t5, a5, -1270
                  flt.s        a1, fs9, fs11
                  remu         s2, t1, s11
                  fsqrt.s      fs7, fa5
                  fclass.s     s4, ft10
                  mulh         s6, s3, t4
                  or           gp, s9, s0
                  fmax.s       fs3, fa7, fs6
                  fclass.s     t3, ft1
                  fmv.x.w      s10, fs8
                  fmax.s       fs8, fa0, fa5
                  fclass.s     a3, fs5
                  srai         a7, a5, 17
                  fsub.s       ft9, fs4, ft5
                  fmax.s       ft7, ft2, fa5
                  slli         a0, t5, 27
                  divu         tp, a1, t0
                  fsub.s       ft2, fa7, fs7
                  slt          gp, a7, s10
                  fadd.s       ft10, fs10, ft2
                  sltiu        a6, t0, -1257
                  fcvt.s.wu    fa2, s10, rmm
                  fcvt.s.wu    ft8, tp
                  srl          s3, a6, a2
                  srl          s9, tp, a6
                  xor          t1, gp, ra
                  sra          s6, t3, ra
                  fle.s        zero, fs11, fs3
                  fmv.w.x      fs8, s3
                  sra          t6, s10, a1
                  and          gp, s4, s7
                  fsub.s       ft8, fa3, fa4
                  add          s3, a5, t0
                  lui          s5, 15006
                  mul          a2, a2, a5
                  flt.s        s5, fa2, fs10
                  fcvt.w.s     t2, fa6
                  srai         s0, t6, 18
                  addi         t6, a0, 1925
                  fdiv.s       ft9, ft4, ft2
                  fsgnj.s      fs6, fa3, fs3
                  fsub.s       fs2, fa7, fa6
                  slli         s2, sp, 13
                  sub          zero, s4, a1
                  srl          t6, ra, s3
                  slli         s4, a2, 12
                  mulhsu       a1, sp, t4
                  mulh         a0, a1, t4
                  fmax.s       fa6, fs6, ft9
                  fmv.w.x      fa1, s10
                  nop
                  sltu         s9, t1, s1
                  slli         a0, t4, 0
                  mulhsu       t5, s7, t2
                  nop
                  fmax.s       fa0, fs3, ft10
                  fclass.s     a2, fa6
                  mul          s5, a4, s8
                  slli         a2, a6, 30
                  auipc        t6, 766842
                  divu         gp, ra, s2
                  or           s3, s0, a3
                  feq.s        tp, ft2, fs8
                  fcvt.s.wu    ft7, a7, rdn
                  mul          t1, a7, s10
                  xori         t3, t1, -1636
                  fmin.s       ft5, fa1, ft11
                  sltu         s7, s6, a3
                  sll          s6, a0, s2
                  mulh         t5, s7, s7
                  mul          a7, a7, s4
                  fcvt.wu.s    a5, ft7, rdn
                  srl          s8, s7, t5
                  slt          a2, s1, s10
                  add          a5, s8, sp
                  fcvt.s.wu    fa3, s9
                  feq.s        sp, ft6, ft7
                  addi         t6, s9, -1638
                  fsgnjn.s     fa2, ft2, fs10
                  slt          s0, s6, s6
                  fsgnjx.s     ft6, fa0, ft8
                  sub          s7, t5, ra
                  auipc        s0, 706247
                  slt          a2, a2, t3
                  mulh         a1, s2, s1
                  fdiv.s       ft7, ft8, fa5, rne
                  feq.s        t1, fs4, fs6
                  fmv.w.x      fs2, t2
                  rem          s4, s8, t5
                  feq.s        a1, ft7, fa6
                  mul          s5, a2, gp
                  fmv.x.w      a1, ft9
                  fmax.s       fa2, fs6, fs6
                  remu         sp, t3, a0
                  fcvt.s.w     fa1, s8, rtz
                  fsqrt.s      ft9, fa3, rtz
                  srl          tp, sp, ra
                  slli         s1, a5, 23
                  nop
                  rem          s4, s8, s8
                  xor          s9, a2, a6
                  add          t2, a0, s8
                  flt.s        s3, ft11, fs9
                  fcvt.s.w     ft5, s3
                  fmax.s       ft6, ft2, ft1
                  ori          t1, tp, -1633
                  sub          gp, s7, gp
                  srai         s10, tp, 3
                  mulhu        tp, t0, a0
                  xori         t5, a4, 910
                  andi         s1, ra, 1396
                  lui          s3, 4011
                  lui          s6, 633422
                  fcvt.s.wu    fs5, a3
                  sltiu        gp, t4, 379
                  fdiv.s       fa5, ft3, fs3
                  mulhu        t4, s6, s5
                  xori         s10, t6, 469
                  nop
                  mulhu        a2, s11, s1
                  add          ra, s1, a5
                  mulh         a3, a2, t5
                  fcvt.w.s     a0, fs3, rdn
                  sub          t4, s2, t0
                  and          zero, s7, t2
                  slli         s5, a4, 26
                  flt.s        t6, fs7, fs11
                  add          gp, s6, sp
                  fadd.s       ft11, fs10, fs7
                  fadd.s       ft3, ft5, fs5, rmm
                  fmul.s       ft6, fa0, fs11
                  rem          s0, gp, s1
                  fmul.s       ft1, fs11, ft7
                  feq.s        a2, ft6, fa6
                  fmv.x.w      t3, fs4
                  fsgnj.s      ft6, fs8, ft3
                  fle.s        s3, ft9, fs10
                  divu         t4, t0, gp
                  or           s5, s9, s8
                  fmax.s       fa2, fs0, ft2
                  feq.s        s9, fs7, ft7
                  and          a0, s3, a6
                  srai         t1, s2, 19
                  fsub.s       fa4, fs4, ft5, rtz
                  sub          s2, a3, t1
                  sra          gp, s7, t5
                  sltiu        tp, tp, 464
                  slli         s3, a2, 16
                  slt          tp, a1, s7
                  sltiu        s0, gp, -1405
                  sra          s8, s5, s4
                  fle.s        a2, ft2, fa1
                  fmv.x.w      tp, ft8
                  feq.s        t3, ft10, fa0
                  slti         t5, s5, 1048
                  fmin.s       fs2, ft3, fa1
                  slti         gp, a3, -761
                  sub          s1, a1, s3
                  addi         a6, a0, -872
                  or           a6, a1, a0
                  andi         s9, a4, 454
                  fcvt.s.wu    fa1, gp
                  fmul.s       fs3, ft11, fs5
                  fmv.x.w      tp, ft4
                  fsgnjx.s     ft1, ft11, fs3
                  addi         t4, tp, 71
                  xori         a5, t4, 513
                  div          a2, t3, t3
                  fsub.s       fs10, ft10, ft6, rup
                  srli         a6, a2, 30
                  fle.s        t4, fa3, fa7
                  xori         a7, s7, 1687
                  fcvt.wu.s    s7, ft0
                  sll          t1, s6, tp
                  fsub.s       fs0, ft9, fa0
                  remu         a5, gp, s3
                  andi         s10, a5, 351
                  addi         s6, s0, 812
                  auipc        t6, 491958
                  and          t3, s7, s7
                  div          s5, t6, s7
                  fsgnj.s      fa6, ft11, ft7
                  add          t4, zero, ra
                  fsub.s       ft4, ft7, fs3
                  fcvt.s.w     fs3, s4, rne
                  fsub.s       ft5, fs1, fa6
                  sub          t5, zero, s7
                  mulhu        s6, s4, ra
                  srl          gp, s9, a5
                  auipc        a3, 493865
                  mulhu        s0, a2, a0
                  ori          t3, ra, 158
                  fcvt.wu.s    t6, ft10
                  sltiu        tp, s3, -637
                  or           s4, ra, s2
                  fadd.s       fa2, ft5, fa1
                  div          a0, s7, s5
                  fmul.s       fs9, fs10, fs3
                  sra          a3, s1, t6
                  div          s0, sp, a7
                  flt.s        t5, ft7, ft0
                  fcvt.s.wu    fs9, a3, rmm
                  ori          sp, gp, 1344
                  slli         a7, s4, 28
                  mulh         tp, s8, s10
                  lui          a7, 927252
                  fadd.s       fs3, fa1, ft2
                  xor          t1, s3, a1
                  lui          zero, 98212
                  ori          s3, s9, 1699
                  and          s10, s2, sp
                  fmul.s       fs7, ft7, ft3
                  rem          t5, s5, sp
                  mulh         t2, s3, s4
                  fsgnjx.s     ft0, ft9, fs10
                  fmax.s       fs4, fs11, ft6
                  fmin.s       ft4, fa3, ft4
                  div          a2, t5, t2
                  fcvt.wu.s    t4, fs2, rmm
                  fmv.w.x      fa4, s11
                  fdiv.s       fs3, fa5, ft5
                  auipc        a2, 840374
                  or           t5, t5, s7
                  srai         s3, s2, 23
                  or           s1, t5, t4
                  fdiv.s       fs7, fs10, ft9, rdn
                  sll          zero, zero, ra
                  fmv.x.w      t4, fa5
                  feq.s        s8, ft11, ft3
                  fadd.s       ft1, fs6, fs1, rdn
                  div          a1, s0, t5
                  fsub.s       ft10, ft6, fa2
                  mulh         s10, t6, sp
                  fcvt.w.s     s1, ft3, rtz
                  sub          zero, s4, s4
                  divu         t5, t5, s5
                  sltu         t4, a6, t4
                  mulhu        zero, zero, s1
                  remu         s8, a2, a0
                  slti         tp, gp, -222
                  flt.s        s4, fa4, fs9
                  sltu         s5, a6, t2
                  srl          a2, s10, s4
                  add          a7, s1, s2
                  nop
                  auipc        s7, 1038166
                  fcvt.s.w     fa7, s5, rup
                  slt          t1, sp, a3
                  feq.s        s2, fa3, ft11
                  add          a6, a7, ra
                  xor          a0, s11, s0
                  feq.s        zero, ft3, fs2
                  remu         t6, s0, t1
                  fmax.s       fa6, fs6, ft3
                  flt.s        a6, ft7, fa0
                  fmin.s       fs1, fa5, fs4
                  mulhsu       s2, t3, s2
                  srl          s1, s9, zero
                  srai         t4, s2, 31
                  add          s4, zero, a4
                  lui          a2, 3172
                  nop
                  srl          sp, tp, t2
                  fsgnjn.s     ft8, fa1, ft5
                  divu         zero, t4, a3
                  addi         s2, gp, 1458
                  rem          a1, a0, a1
                  xor          t2, t3, s6
                  mul          zero, ra, a5
                  srli         a0, s7, 26
                  fcvt.w.s     tp, fa4, rup
                  fmax.s       fa2, fs11, fa5
                  fclass.s     s1, fa4
                  fclass.s     a7, fa0
                  fsgnjn.s     fa7, fs10, fa1
                  and          s1, a6, s11
                  fsgnjx.s     fs10, fs11, fs6
                  srl          a6, a2, s0
                  fcvt.w.s     s0, fs1
                  fsqrt.s      ft5, fs9, rne
                  fsgnjn.s     ft4, ft4, ft7
                  fadd.s       fs11, ft0, ft1, rup
                  mul          a2, s5, a4
                  fcvt.wu.s    t1, fs1
                  fsgnjn.s     ft10, fa5, ft9
                  fcvt.s.wu    fa6, s7
                  srl          sp, a5, s0
                  and          a2, s5, t2
                  fmax.s       ft3, fs10, ft1
                  ori          a0, t6, -158
                  rem          s9, t6, ra
                  xori         a1, a7, 160
                  srai         a3, t2, 15
                  fcvt.wu.s    s6, ft7, rmm
                  fsub.s       ft11, ft2, ft4
                  fsgnjx.s     fa1, fs1, ft1
                  slt          s1, a5, a4
                  andi         t1, a1, -720
                  sub          s2, t5, t3
                  fcvt.s.w     fs4, s7
                  sub          a7, tp, a3
                  fsgnj.s      fa0, fs10, fs1
                  fmin.s       fa5, fs7, fs6
                  add          t2, t1, t0
                  divu         zero, t0, t3
                  ori          s3, a7, 1554
                  fmv.w.x      ft9, s2
                  slli         s5, a7, 22
                  addi         s0, t2, -340
                  ori          t5, s7, 423
                  fclass.s     s3, fs0
                  add          s6, a3, s9
                  fmul.s       fa4, fa7, fs9
                  fle.s        t3, fa1, ft1
                  xor          a5, t1, a3
                  slti         t5, s2, 1499
                  mulh         zero, gp, s6
                  fmax.s       ft1, fs3, fa6
                  ori          s4, a0, -412
                  fmul.s       fa1, ft10, fs5
                  slt          t2, t3, s4
                  fsqrt.s      fs9, fa7, rmm
                  flt.s        ra, fs1, fa4
                  fclass.s     a1, fa2
                  xor          s7, a4, s0
                  div          zero, s10, s7
                  mulhsu       a6, s9, ra
                  auipc        s0, 734061
                  div          s0, a7, t5
                  fmul.s       fa6, fs10, ft8
                  remu         t1, s7, t0
                  slti         s7, gp, -1991
                  sra          a5, zero, s10
                  add          t5, a0, a2
                  div          s9, t2, a6
                  nop
                  fle.s        s10, fa4, fs2
                  fcvt.s.wu    fs5, a7
                  mulhu        s6, a6, s1
                  addi         gp, a5, -330
                  fmv.x.w      sp, fs0
                  sll          sp, a4, s5
                  flt.s        a3, ft0, fs2
                  slti         a2, a1, -743
                  ori          s10, s8, -1401
                  nop
                  fle.s        s10, fa1, fa7
                  fcvt.s.wu    ft11, s11
                  srl          s5, s1, a6
                  fcvt.wu.s    s1, ft7
                  fmv.x.w      a6, fs2
                  mulhu        a6, tp, t6
                  fcvt.s.wu    ft0, a3, rne
                  or           s1, s3, s3
                  ori          s5, s3, -1267
                  fclass.s     s3, ft3
                  fmin.s       fa7, ft8, fa7
                  fmin.s       fs1, ft9, ft7
                  add          a1, a0, s7
                  ori          s2, t4, 1518
                  sll          s1, s7, t3
                  fdiv.s       ft9, fs8, ft2
                  xori         sp, zero, 650
                  mul          a0, t5, a7
                  fmv.x.w      a1, fs6
                  remu         t3, a7, zero
                  fcvt.s.w     fa3, a2
                  xori         tp, t6, 1899
                  fle.s        s10, fs7, fa2
                  sra          s5, a0, t1
                  fle.s        tp, ft9, ft6
                  xori         t4, t4, -1332
                  lui          a1, 24835
                  slt          s7, a5, sp
                  mulhu        tp, s10, a2
                  fcvt.wu.s    a5, ft2, rup
                  xor          a1, s1, s6
                  srl          t2, t6, a2
                  srai         s9, a5, 9
                  slti         tp, s4, -1353
                  mul          t1, s8, t4
                  fcvt.w.s     t4, ft10, rmm
                  and          t3, a3, a4
                  mulh         s8, t4, s4
                  rem          sp, s8, s10
                  flt.s        s5, fs3, ft6
                  xor          s0, t4, sp
                  slti         t4, s10, 1479
                  fsqrt.s      ft8, fa4
                  fcvt.s.wu    ft10, t6, rdn
                  mul          zero, a7, t0
                  slti         a7, s5, -615
                  sub          t6, a2, s7
                  feq.s        s3, fa3, fs7
                  divu         t2, s2, gp
                  sra          a1, a3, t1
                  divu         s4, t6, a6
                  mul          t3, a3, s6
                  srai         a1, t2, 8
                  addi         s10, t3, -1099
                  lui          tp, 182011
                  feq.s        t3, fs5, ft9
                  fmul.s       fs6, ft8, ft7
                  ori          s5, t6, -1442
                  fsub.s       ft0, ft1, fa1
                  sltu         t2, tp, a5
                  slti         ra, s3, 521
                  fcvt.w.s     s7, fa4
                  xor          zero, s7, s11
                  divu         t1, gp, s10
                  mulhu        t6, t5, ra
                  addi         a2, s5, -1953
                  and          tp, t3, gp
                  slti         a2, a0, -1938
                  auipc        s5, 809270
                  nop
                  andi         s9, a1, -96
                  div          ra, t0, a1
                  addi         a1, s4, -1042
                  fmin.s       ft6, fs1, ft8
                  srli         zero, s1, 6
                  sub          a3, t3, t5
                  mulhu        a7, t5, s9
                  srai         a0, sp, 30
                  mulh         s8, t6, t0
                  sra          t3, a0, s6
                  slt          s0, s7, s11
                  mul          t4, s7, t3
                  fadd.s       fa4, fs2, ft3
                  fmv.x.w      t3, fs1
                  lui          s3, 342834
                  fmv.w.x      ft3, a4
                  rem          a6, a1, a0
                  fmax.s       fs8, fa3, fa6
                  fmv.w.x      ft10, t6
                  and          s10, a1, ra
                  fsqrt.s      fa0, ft1
                  fcvt.s.wu    fs7, s9, rne
                  fsgnj.s      ft5, ft6, ft5
                  nop
                  ori          t6, s9, 1573
                  srl          s5, tp, s8
                  fadd.s       ft9, fa5, ft7
                  andi         sp, ra, 389
                  fadd.s       ft11, fs11, fa6, rup
                  nop
                  fsub.s       fs6, fa4, fa0
                  mulh         s0, t5, s0
                  slt          s4, s1, sp
                  fmul.s       fa4, ft0, fs6
                  flt.s        t2, fa4, ft4
                  sll          a1, s0, t2
                  fsqrt.s      fs1, fa7, rmm
                  fcvt.w.s     s10, ft10
                  fle.s        t4, fs5, fs2
                  fadd.s       fs2, fa7, fa6
                  fmv.w.x      ft1, s8
                  addi         gp, s8, -291
                  feq.s        s6, fa5, fs6
                  div          t3, a4, t4
                  slti         s7, s5, -1471
                  or           s4, a1, ra
                  feq.s        t3, ft10, fs3
                  feq.s        t4, fs7, fs1
                  sltu         s5, a7, sp
                  fcvt.w.s     a3, fa0
                  sra          s9, s7, s0
                  add          a6, ra, tp
                  nop
                  fsgnjn.s     ft7, fa5, fa5
                  xori         t4, s3, 910
                  slli         gp, a7, 19
                  mulhu        t5, t4, a0
                  xori         sp, a2, -896
                  addi         s4, s1, 1078
                  auipc        ra, 597298
                  and          t2, t3, t0
                  ori          sp, a2, 1975
                  andi         s9, t5, -1525
                  fmin.s       fa4, fa7, fs3
                  sub          s5, tp, gp
                  nop
                  flt.s        s8, fs2, ft5
                  fcvt.w.s     a3, fs4
                  andi         a3, a3, -797
                  addi         s2, sp, -1742
                  fmul.s       fa4, fs11, fs3
                  slli         s4, t3, 11
                  mulh         t6, s3, gp
                  mulhu        t3, s11, a2
                  lui          a7, 705871
                  sub          s7, s4, gp
                  sltiu        a3, a2, 1887
                  lui          a2, 263594
                  remu         t6, t2, a6
                  fsub.s       fs9, fa0, ft1
                  auipc        a0, 661632
                  feq.s        t3, fs4, fs10
                  srl          t3, ra, a6
                  div          a2, t6, a3
                  ori          gp, s11, -1149
                  sltu         gp, s7, zero
                  srai         a6, s4, 20
                  slli         sp, s3, 1
                  mulhu        t3, t3, a3
                  fcvt.w.s     a3, ft8, rtz
                  srai         s7, s6, 2
                  mulhu        s4, s2, s11
                  fmv.x.w      zero, fs3
                  fdiv.s       ft0, ft10, fs5, rmm
                  flt.s        t5, fa7, fs0
                  sra          a6, tp, a4
                  ori          a3, t5, -881
                  fcvt.s.w     fa2, s4, rmm
                  and          a3, s0, zero
                  mulhu        s9, ra, a4
                  sub          a0, s8, a1
                  fcvt.w.s     s3, ft8
                  slti         s2, s4, -274
                  fmv.w.x      ft7, gp
                  fclass.s     t2, ft1
                  fclass.s     s5, fs4
                  feq.s        t6, ft7, ft1
                  mulhu        a3, s6, t3
                  xor          tp, a7, a3
                  fadd.s       ft0, fa7, ft3
                  sltu         t6, t5, t2
                  fmv.w.x      fs0, a6
                  fmv.x.w      a2, ft5
                  or           s8, a6, gp
                  sltiu        a7, a3, -1312
                  srli         a7, tp, 2
                  or           s3, s2, s3
                  sltu         s10, tp, s4
                  fmin.s       fa2, fs3, fs6
                  fmax.s       ft1, fs2, ft10
                  ori          a3, tp, 1115
                  fle.s        a1, fa0, fs3
                  feq.s        s7, fs2, ft5
                  and          ra, s10, a7
                  fadd.s       ft5, ft7, fs7
                  slli         s6, s11, 17
                  mulh         s0, t0, tp
                  fcvt.s.wu    fa2, tp, rmm
                  srai         s9, s0, 7
                  add          ra, s1, ra
                  fmul.s       fa1, fa6, fa6
                  or           s0, t1, a4
                  xor          s9, s4, gp
                  xor          sp, a1, ra
                  srai         a6, a0, 14
                  ori          t4, a4, -1939
                  fadd.s       fs7, ft11, ft0, rtz
                  fsgnj.s      fs7, fa7, fs2
                  fle.s        s0, fa7, ft4
                  flt.s        t5, fa2, fs4
                  xor          a2, s4, zero
                  divu         sp, s5, a3
                  sub          a7, s10, s1
                  flt.s        t5, fs4, ft5
                  srli         a1, t3, 12
                  mulh         s2, a7, t0
                  xor          ra, s1, tp
                  auipc        s3, 821007
                  slti         a2, a1, -349
                  feq.s        s1, fs8, fs11
                  fcvt.s.w     fs2, gp
                  xori         a2, t6, 689
                  rem          s7, zero, s1
                  auipc        s7, 655795
                  nop
                  fclass.s     gp, ft8
                  fsgnjx.s     fa5, ft6, ft6
                  slt          s10, sp, ra
                  add          s4, t1, a2
                  fmv.x.w      s9, ft6
                  fclass.s     a7, ft3
                  fsgnjn.s     fs8, ft10, fs4
                  slt          t2, sp, s3
                  and          a7, a1, s11
                  fsub.s       ft4, ft8, fs0
                  and          s8, s11, a7
                  fcvt.s.wu    fa5, s1, rtz
                  auipc        s7, 228295
                  sltiu        a5, t1, -1335
                  slti         s2, a6, -19
                  divu         s8, a7, s9
                  fcvt.s.wu    fs9, s7
                  mul          s2, a6, a7
                  feq.s        s0, fa3, fs2
                  fclass.s     s6, fa4
                  div          s5, a5, s7
                  mulh         ra, s10, t0
                  fsgnjx.s     fs7, fa2, fa0
                  andi         s9, t5, -972
                  srli         tp, gp, 5
                  add          a2, s6, tp
                  feq.s        s10, fs2, fa2
                  fcvt.wu.s    sp, fa3, rtz
                  fadd.s       fs9, fs1, fs4, rmm
                  add          gp, s1, s4
                  addi         ra, a7, -951
                  sltiu        s2, s4, -1979
                  srl          s10, t6, a0
                  mul          a5, a6, t0
                  fmv.w.x      ft6, a5
                  sll          s0, t4, s10
                  or           a1, s3, a2
                  sltu         a1, s0, zero
                  lui          ra, 73902
                  sltiu        s4, zero, 241
                  mulh         s8, s6, ra
                  add          s2, s6, a4
                  sra          a3, t2, t3
                  and          tp, s11, s7
                  sra          zero, a2, a7
                  flt.s        gp, fs2, ft9
                  andi         t5, s2, -1744
                  fle.s        a6, fs2, fs10
                  fmul.s       ft6, fa2, ft0, rtz
                  mulhu        t6, gp, t4
                  fmin.s       ft0, fs5, ft0
                  mul          tp, t2, t4
                  fmul.s       fa4, fs10, fs8, rne
                  addi         s8, s0, 1646
                  fsgnjn.s     ft0, fs6, fs4
                  or           s4, sp, t6
                  fcvt.w.s     t4, fs5, rmm
                  or           a0, s3, s9
                  fsgnjn.s     fa0, ft8, fs6
                  sltu         t6, t0, t1
                  srli         a1, s5, 28
                  sltiu        a0, s6, 703
                  sltu         a1, s7, s1
                  fmax.s       ft7, fs8, ft7
                  fadd.s       ft10, ft7, fs9, rdn
                  fsgnjn.s     fa7, fs11, ft6
                  fle.s        t5, fa2, fs10
                  fsub.s       ft6, ft5, ft7
                  fsgnj.s      fa2, ft6, fa7
                  fsgnjx.s     fs4, fs5, fa3
                  and          s5, a3, a2
                  sll          t6, tp, a6
                  ori          s10, s0, 1052
                  sra          tp, a2, zero
                  fcvt.s.wu    ft1, s8, rup
                  fcvt.wu.s    a2, fs9
                  remu         a0, gp, a5
                  sltu         a7, s7, s10
                  ori          s2, s4, 172
                  auipc        s6, 530283
                  srl          s1, t4, s3
                  slti         a6, s7, 429
                  fmv.x.w      t2, fa0
                  sub          gp, a3, a6
                  flt.s        a2, ft5, fs6
                  sll          sp, s0, sp
                  add          s2, a3, s5
                  fcvt.s.wu    ft5, sp, rdn
                  fsgnjn.s     ft9, fa1, ft3
                  xori         s3, s4, 1477
                  or           a2, t1, t3
                  fmin.s       ft2, fs1, ft7
                  sltiu        a1, s2, 733
                  remu         ra, a3, a6
                  feq.s        s0, fa7, fs1
                  fsgnjx.s     ft0, fa6, fs11
                  ori          s4, s9, -1878
                  fsgnj.s      ft1, fa2, fs9
                  auipc        t1, 25934
                  fsgnjn.s     fs8, fa4, ft9
                  divu         t6, a5, a5
                  fmin.s       fs1, fa1, fa6
                  xori         s2, t2, 755
                  slti         sp, a2, 1142
                  add          s6, tp, a4
                  auipc        gp, 538691
                  fcvt.s.wu    fs5, a3
                  rem          gp, sp, s1
                  remu         tp, sp, s2
                  fsgnj.s      ft5, fs7, ft6
                  nop
                  fcvt.w.s     a0, fa1, rne
                  rem          s0, a7, a7
                  divu         s5, s5, a4
                  srai         s3, gp, 11
                  andi         s4, a5, -97
                  fcvt.w.s     a3, fs1
                  andi         t5, s8, -799
                  fsgnjn.s     fs6, fa5, ft10
                  fmin.s       fa2, ft2, fs7
                  fadd.s       ft11, ft1, ft8
                  sub          t4, a1, s10
                  nop
                  fcvt.s.w     ft3, zero
                  divu         s0, gp, s5
                  fsgnj.s      ft3, fa7, fs4
                  rem          s1, t3, t3
                  sltiu        s6, a6, 632
                  fmv.w.x      fs3, s1
                  or           a6, s11, a7
                  xori         t5, s5, 1365
                  slli         s1, s3, 6
                  mul          t4, a0, s4
                  sub          s3, sp, a6
                  rem          s0, t6, s0
                  fmv.w.x      ft1, a6
                  sltiu        s4, t0, -1770
                  divu         s4, s10, s8
                  fsub.s       fs5, ft6, ft3
                  fclass.s     s10, fs5
                  fmv.w.x      fa7, s10
                  fmin.s       fs8, fs7, ft0
                  fsgnj.s      fs3, fa0, fa7
                  fcvt.s.w     fs8, a4
                  divu         a2, s5, a3
                  and          s3, a4, tp
                  mul          gp, s6, s11
                  or           s8, s11, sp
                  sra          t5, a3, s3
                  lui          s7, 174864
                  fcvt.s.wu    fs9, tp, rmm
                  sltiu        s8, a0, 801
                  fmv.w.x      fs0, tp
                  and          a6, s7, s4
                  sra          s3, s9, s6
                  xori         s2, a6, -1884
                  sltiu        s2, s9, -1994
                  fmv.w.x      fs4, s5
                  mul          s2, t6, a7
                  sll          s10, t3, s9
                  srai         s4, s4, 2
                  div          t5, a5, t0
                  fadd.s       fa7, ft0, fs9, rdn
                  remu         t5, t1, a2
                  remu         zero, s6, s9
                  fmv.x.w      s2, fa3
                  or           t2, s11, ra
                  nop
                  xori         ra, gp, -1864
                  and          t6, s4, s7
                  fclass.s     s4, ft8
                  fmin.s       fs0, ft10, fs9
                  slti         s5, s8, 1811
                  srai         ra, a2, 0
                  fcvt.s.wu    fa6, sp, rmm
                  fcvt.w.s     s10, fa2, rmm
                  slti         a3, t2, 1715
                  auipc        a3, 879849
                  fcvt.w.s     t4, fs4
                  fsgnj.s      fa4, fs9, fs10
                  fmv.x.w      a6, fs3
                  fcvt.wu.s    t3, fs1
                  fsqrt.s      ft7, fa3, rtz
                  sltiu        s8, a7, 1940
                  srli         t2, sp, 29
                  and          tp, t4, s6
                  addi         t4, s8, -1076
                  fcvt.wu.s    s1, ft2, rup
                  fdiv.s       fa3, fs4, fs1, rtz
                  fcvt.w.s     s8, ft2
                  rem          s10, s3, a0
                  srl          a0, s5, t3
                  mul          a7, t4, s8
                  addi         s7, s4, -1666
                  fcvt.s.w     fa6, t2, rne
                  srai         s6, t3, 13
                  fclass.s     gp, fa1
                  fdiv.s       ft5, ft11, fa6
                  sra          sp, s3, ra
                  fsgnjn.s     ft7, ft8, fs2
                  sra          s3, s5, zero
                  slt          t2, s10, a2
                  ori          s2, s11, 779
                  rem          a6, t0, gp
                  lui          s8, 479718
                  slti         a2, a6, -932
                  fadd.s       fa7, fs3, fa7
                  slti         s0, gp, 356
                  divu         a2, t6, a7
                  mulhsu       t3, t2, s9
                  sub          a5, s9, t1
                  fcvt.wu.s    tp, fs10
                  auipc        a2, 43809
                  fcvt.s.w     ft0, a1, rtz
                  flt.s        a3, fs7, fs2
                  mulhu        s0, a7, a5
                  sra          a1, a3, tp
                  remu         s8, s5, s0
                  rem          a5, a2, a6
                  fmul.s       fs10, fa4, ft8
                  mulh         t6, a1, s7
                  feq.s        s4, ft6, fa7
                  and          zero, s11, t1
                  flt.s        t5, fa3, fs0
                  mulh         s7, s10, a6
                  fcvt.wu.s    sp, fs11, rup
                  ori          s9, a1, -1785
                  srl          s1, a6, ra
                  mulhu        s8, s0, s3
                  fsgnjx.s     ft10, ft8, fa2
                  sll          t4, s0, a1
                  fclass.s     sp, ft3
                  divu         a3, s1, t6
                  or           tp, a3, s9
                  div          t5, a2, t5
                  fmv.x.w      a2, ft9
                  mulhu        s3, s7, t4
                  fclass.s     zero, ft1
                  fcvt.w.s     ra, fs0
                  srli         s1, s1, 25
                  sll          a2, sp, sp
                  sltu         a0, s0, tp
                  srl          a3, s9, a2
                  fmv.w.x      ft11, a3
                  and          t6, a5, zero
                  divu         gp, a2, a0
                  slti         t6, a3, 541
                  remu         t3, s11, s0
                  nop
                  xori         a7, a4, -1049
                  fdiv.s       ft8, fs1, fs11
                  sltu         s3, ra, s3
                  div          a6, s6, zero
                  add          t4, s11, s4
                  xori         a6, s3, -1200
                  addi         a7, gp, 1672
                  flt.s        s5, ft9, ft1
                  ori          tp, s5, -75
                  srl          s3, zero, s5
                  mulhu        a7, a1, t2
                  sub          t6, s3, a3
                  fclass.s     t5, fa5
                  slt          a5, tp, t4
                  fsgnjn.s     fs11, fs4, fs4
                  xor          t6, a0, a6
                  mulhsu       a1, tp, zero
                  add          s9, s3, a1
                  xor          s7, s2, sp
                  div          ra, s4, zero
                  srli         s2, a4, 13
                  or           t3, s5, t5
                  srai         t3, s5, 24
                  nop
                  fsqrt.s      ft6, fs8, rdn
                  fcvt.wu.s    a6, fa1
                  mulh         a6, s9, s4
                  fcvt.w.s     s7, fs8
                  fmin.s       ft8, ft5, ft11
                  sltiu        a0, gp, 1045
                  xori         s2, gp, 1025
                  slti         s6, t6, 713
                  fsgnjx.s     ft10, ft5, ft8
                  fmin.s       fs3, ft2, ft2
                  or           t6, t4, gp
                  mul          a3, s11, t6
                  andi         ra, tp, -1109
                  nop
                  feq.s        t3, fs9, ft9
                  fadd.s       ft0, ft1, fs1, rdn
                  fcvt.s.w     ft9, gp
                  fmul.s       fs4, fs10, fs5
                  flt.s        s3, fs2, fa4
                  auipc        s6, 618333
                  fclass.s     a6, fa7
                  mul          tp, tp, a2
                  sltiu        s4, a3, -252
                  srli         t1, s5, 30
                  flt.s        s0, ft2, fs4
                  mulh         a5, s4, s0
                  div          s1, s6, t6
                  mulhsu       s10, s4, a3
                  mul          s8, t4, t5
                  sub          s7, a2, a3
                  addi         sp, t1, 209
                  and          s3, s2, a6
                  sltu         t5, sp, s11
                  or           gp, tp, s3
                  and          s10, t3, gp
                  fmax.s       fa0, ft0, fs4
                  fsub.s       fs9, ft4, fa0, rdn
                  srai         a3, s0, 12
                  slli         ra, a3, 16
                  fmin.s       fa3, fa2, fa0
                  and          t3, t4, s7
                  slli         t3, gp, 7
                  srl          t1, t3, sp
                  fsgnjn.s     ft11, fs5, fs5
                  sltiu        s4, t6, -124
                  fle.s        s1, fa4, fa5
                  remu         gp, s8, s7
                  sub          ra, s7, a6
                  mulh         t2, s7, s8
                  slt          a3, s3, a6
                  slli         s4, s10, 9
                  fcvt.s.w     fs0, s11
                  srli         s7, s5, 28
                  slli         s7, t3, 19
                  ori          gp, s11, 1556
                  nop
                  sra          a7, s7, t3
                  fsgnjn.s     fa4, ft3, fa2
                  fmin.s       fs11, fs3, fa1
                  mulhu        a1, s5, s11
                  mulhu        s8, s9, t3
                  fsgnjn.s     fs2, fa3, fa3
                  fmax.s       fs4, ft11, ft9
                  fmul.s       fs7, fs8, fa2, rtz
                  rem          t2, a1, a6
                  rem          gp, ra, s7
                  div          s10, t2, s9
                  fle.s        s8, fs9, fs2
                  add          tp, t0, s7
                  lui          s8, 906785
                  fcvt.s.wu    fs2, t1, rtz
                  mulhu        a5, a1, gp
                  feq.s        s0, ft6, fa7
                  slli         s5, t1, 29
                  or           gp, s3, zero
                  sub          a1, s6, s7
                  fmin.s       fa4, fa1, ft5
                  fmv.x.w      a0, fa0
                  flt.s        tp, ft10, ft5
                  addi         tp, t1, 1815
                  sll          a7, gp, t3
                  fdiv.s       fa6, fa3, fa1
                  xori         s0, s7, -73
                  and          s3, t4, a2
                  fle.s        t4, ft10, fs9
                  mulhsu       a5, t3, t1
                  fclass.s     s3, ft8
                  slli         a1, t2, 15
                  slt          a3, s10, s2
                  slt          t6, t1, s11
                  fcvt.s.w     fs11, s5, rup
                  slt          s9, s9, sp
                  fsgnjn.s     ft4, fs0, fs2
                  mul          t6, gp, ra
                  xori         tp, t0, -1723
                  ori          s3, s10, 1668
                  srai         a3, s8, 26
                  div          s1, s9, a6
                  fdiv.s       ft11, fs2, fa0, rdn
                  slt          t2, s5, a5
                  fsgnjx.s     ft8, ft0, fs6
                  fcvt.w.s     t5, ft4
                  fsub.s       fa6, fs7, fs1
                  fcvt.wu.s    t1, fa5, rmm
                  fsqrt.s      fs7, fs2
                  sll          s2, ra, s5
                  srli         s5, sp, 25
                  sltiu        s6, a1, 267
                  fadd.s       ft8, fs11, fs6, rne
                  srli         ra, s1, 18
                  remu         t6, s6, t5
                  fmax.s       ft0, ft7, fs4
                  divu         t5, s0, s9
                  fcvt.s.wu    ft8, s8, rdn
                  mulh         a3, t6, t4
                  fsqrt.s      ft9, fa6, rdn
                  fsgnjx.s     fa3, ft3, fa2
                  sltiu        t2, tp, 1063
                  fmv.x.w      zero, fa4
                  fcvt.s.wu    fa6, s8
                  srl          t5, s1, ra
                  sll          a3, s5, s2
                  fdiv.s       fs11, ft10, fs4
                  fsqrt.s      ft6, fa6, rup
                  fadd.s       fs10, fa5, ft11, rtz
                  fadd.s       ft7, fs2, fs8, rtz
                  fcvt.s.w     fs7, s0
                  xor          t4, gp, t0
                  fmul.s       fs0, fs7, ft1, rmm
                  and          a0, s2, s6
                  sltu         sp, s10, s9
                  fle.s        gp, fs8, fa6
                  fsub.s       fs11, fa4, ft7, rmm
                  fsqrt.s      ft4, ft9
                  srai         t4, zero, 29
                  fle.s        t3, ft9, fs8
                  mul          s8, s9, t4
                  or           t3, a7, t5
                  fclass.s     a5, fs4
                  fle.s        t6, fa6, fs9
                  fmin.s       ft4, fs3, ft1
                  fcvt.s.w     ft6, a2, rmm
                  andi         ra, a4, -1818
                  srli         zero, s5, 3
                  sub          s10, s2, t3
                  fadd.s       fa2, ft0, fa4
                  mulh         s0, t4, s9
                  or           s9, a6, a1
                  fdiv.s       fa1, fa5, ft7
                  and          t2, t0, s7
                  mul          t2, ra, t5
                  sra          t2, s5, zero
                  mulh         s2, a0, s8
                  fsqrt.s      ft3, ft6
                  addi         s0, a0, 1710
                  ori          s4, t1, -471
                  andi         a5, zero, -859
                  slli         t5, t1, 26
                  andi         a1, a7, 1151
                  fmax.s       fa3, ft9, ft1
                  fsgnjn.s     ft0, ft1, ft6
                  andi         s2, t2, 108
                  fsqrt.s      fs2, fa5, rne
                  ori          t1, s7, -1473
                  fsqrt.s      ft11, ft8, rup
                  lui          a1, 536760
                  fcvt.wu.s    s9, ft2, rmm
                  ori          s1, a6, 851
                  mulhu        t2, s10, s9
                  sltu         a1, s8, zero
                  fmv.w.x      fs6, a6
                  sll          t6, t3, tp
                  rem          s7, t3, a0
                  fsgnjn.s     fs3, fa5, fs8
                  srai         sp, t6, 29
                  xori         s4, t0, 993
                  fcvt.wu.s    t2, ft3
                  and          gp, s11, t0
                  slti         zero, s1, 1517
                  srl          s3, s11, s1
                  fle.s        sp, fs3, fa7
                  mulh         t3, s6, s1
                  srl          t1, t4, tp
                  mulhsu       t5, gp, t2
                  sub          a0, t0, s2
                  ori          s4, a2, -332
                  add          t5, a0, s0
                  sll          gp, a4, t5
                  and          gp, a5, a1
                  fmv.w.x      fs3, t6
                  add          s1, tp, gp
                  srli         s1, t3, 28
                  fmax.s       fa7, fa2, ft10
                  andi         s8, a1, -610
                  sll          tp, a1, t1
                  fadd.s       ft7, fa2, fa1, rup
                  fsqrt.s      ft2, ft6
                  srai         t5, t4, 27
                  ori          s7, t6, 874
                  fle.s        t5, fs9, fs6
                  fmin.s       fs5, ft2, ft6
                  fmv.x.w      a3, fs7
                  fsqrt.s      fs3, fa4, rup
                  fcvt.w.s     sp, fs2, rup
                  fcvt.s.w     fa0, a2, rdn
                  fsgnjn.s     fs2, fa1, ft6
                  fmv.x.w      t4, fs3
                  fsgnjn.s     fs3, fs10, ft11
                  mulhsu       s10, ra, a5
                  sll          t4, a5, ra
                  slt          ra, s4, t1
                  fsgnjn.s     fa7, fs0, ft3
                  xori         a5, s6, -1093
                  fmv.x.w      gp, fa0
                  divu         s0, a1, t4
                  xori         t4, s3, -2045
                  fsub.s       fa6, ft4, fa3
                  mulhu        a2, a2, s1
                  slt          t5, a7, s8
                  mul          s1, a2, s10
                  fcvt.wu.s    zero, fa2
                  fclass.s     gp, ft4
                  fclass.s     zero, fs9
                  fcvt.wu.s    a0, ft2
                  fcvt.w.s     a6, fa7, rtz
                  mulhsu       a0, a5, s6
                  fcvt.s.w     ft5, t2
                  slt          s7, a0, s10
                  fcvt.s.wu    ft7, s3
                  andi         s10, a0, 2034
                  mulh         s7, a7, a5
                  lui          gp, 284994
                  addi         a6, s4, 45
                  fle.s        sp, ft7, ft0
                  fmv.x.w      t1, ft10
                  fcvt.wu.s    s7, fs0, rmm
                  fsqrt.s      fa3, ft6, rmm
                  fmv.x.w      s3, fs1
                  sltiu        s9, sp, -785
                  feq.s        s5, fa0, fs8
                  fmul.s       fa7, fs9, ft11, rtz
                  fdiv.s       fs11, fa5, fs0, rtz
                  divu         a2, s7, t3
                  mulhu        a7, s1, s9
                  mul          s1, a2, t5
                  and          ra, a0, s5
                  sub          s2, tp, a4
                  rem          tp, a1, a5
                  xor          s7, a6, a0
                  fclass.s     zero, ft10
                  srai         s9, a5, 29
                  divu         gp, s0, s11
                  and          t3, a5, s4
                  srli         t1, s11, 5
                  lui          a1, 398978
                  div          a2, s1, a3
                  sltiu        ra, t3, -621
                  feq.s        s3, fa6, fa5
                  fmv.x.w      zero, fa6
                  mulh         s3, a5, s0
                  and          s10, t2, t2
                  div          ra, ra, s3
                  slli         sp, ra, 30
                  xori         a2, a0, 210
                  slli         t4, tp, 6
                  and          s2, a0, s5
                  fsgnj.s      fa0, fa5, fs4
                  sll          s4, tp, s4
                  fcvt.wu.s    a2, ft3
                  lui          a2, 1006034
                  fmax.s       fs6, fs7, ft5
                  sra          a1, ra, t5
                  mulh         a5, a0, s6
                  fcvt.s.wu    fs10, a7, rdn
                  fmv.x.w      a5, fs11
                  xori         a2, a7, -1078
                  or           t2, t6, t5
                  or           a3, s8, a6
                  srai         t1, a6, 19
                  lui          s9, 115773
                  add          t1, t4, t3
                  fsgnjx.s     fa5, fs6, fs10
                  or           gp, sp, s4
                  sltu         s0, s0, a4
                  fsgnj.s      ft7, ft6, ft5
                  slli         t2, s5, 29
                  srli         s0, gp, 27
                  srl          a6, s8, a2
                  fclass.s     s8, fs11
                  or           s3, a5, a6
                  sra          a2, ra, a3
                  mul          gp, s6, t0
                  xor          s1, s9, sp
                  xori         s6, a6, -1226
                  fsub.s       fa4, fs8, fs1, rdn
                  fcvt.w.s     a5, fa5, rdn
                  ori          s2, gp, -1160
                  fmv.w.x      ft3, s0
                  mulhu        ra, s10, tp
                  flt.s        s6, fs9, fs5
                  andi         a7, sp, 1148
                  xori         a3, zero, -1126
                  add          s8, a5, s9
                  srli         s8, a3, 8
                  srli         t1, s5, 14
                  slti         gp, ra, -1901
                  fsgnjx.s     ft6, fa1, fs0
                  auipc        a1, 489479
                  lui          s2, 626338
                  fsgnjx.s     ft7, fs2, fs6
                  fcvt.s.w     fa2, t1
                  slti         s0, t0, -1961
                  remu         t6, a4, sp
                  fclass.s     s7, fa4
                  ori          s0, a7, -394
                  fsgnj.s      fs4, fs10, fa3
                  remu         a2, a1, s3
                  fdiv.s       fa4, ft0, fa6
                  nop
                  fsqrt.s      ft11, fs1, rne
                  fsub.s       fa7, ft1, fs3
                  fclass.s     s1, ft1
                  divu         t3, t4, s0
                  fcvt.w.s     zero, ft6, rup
                  fsgnjx.s     fs5, fa6, fs0
                  slli         t1, a2, 31
                  fsgnjx.s     fa7, fs5, fs2
                  mulh         s2, t4, tp
                  rem          gp, t0, tp
                  slt          tp, t2, s10
                  slli         tp, zero, 31
                  or           zero, a0, t6
                  srl          s8, a4, t4
                  remu         a6, sp, t6
                  rem          zero, a2, gp
                  fadd.s       fa0, fs8, fs11, rtz
                  fsgnjn.s     fs10, ft7, fa7
                  slt          s7, s10, s4
                  div          a2, t4, t1
                  divu         a2, t3, t6
                  fcvt.s.wu    fs10, s6, rmm
                  slt          sp, gp, a4
                  addi         a2, s1, -1736
                  sll          s7, s7, s5
                  div          t4, tp, s0
                  srli         ra, s11, 9
                  srai         s4, t0, 31
                  sltiu        ra, s11, -1547
                  fle.s        a3, ft1, ft5
                  fmul.s       fs5, fs3, fs11, rmm
                  or           s5, s6, zero
                  mulh         zero, a7, s9
                  ori          s1, s3, -1889
                  sll          s1, t6, s0
                  feq.s        tp, fa7, fa0
                  fcvt.wu.s    t6, fa2
                  add          s9, gp, s9
                  fmul.s       ft6, fs3, fa0
                  andi         ra, s0, -378
                  sub          s3, s7, s3
                  fmin.s       ft3, fs9, fs6
                  fsgnjx.s     fs4, fs11, ft6
                  fsub.s       ft9, fa3, fa5
                  fsub.s       ft2, fa7, ft8
                  fcvt.w.s     ra, ft6
                  fsgnjn.s     fa0, fs6, fa3
                  feq.s        s10, ft11, fa7
                  remu         a7, s9, a7
                  mulhu        s9, a0, s4
                  slti         s3, t6, -1995
                  fmul.s       fa7, ft2, fs10, rtz
                  srai         t6, s1, 6
                  fsgnj.s      fs6, fs9, fs0
                  xori         sp, zero, -307
                  slt          s3, gp, s0
                  sub          s7, s5, t2
                  sltu         a3, a3, a2
                  fcvt.s.wu    ft3, zero
                  add          s4, a1, s9
                  slli         s1, a4, 5
                  divu         s7, t2, t5
                  sll          s5, t3, s1
                  slti         t2, a7, 78
                  addi         a2, t3, 799
                  ori          t4, ra, -740
                  or           a3, t6, s7
                  remu         t5, zero, zero
                  sltiu        sp, s0, -178
                  xori         s1, a5, -907
                  nop
                  srli         a1, sp, 28
                  fcvt.wu.s    a0, fa3
                  fclass.s     a0, ft7
                  add          s1, t0, s5
                  slti         tp, a6, 1139
                  fdiv.s       fs8, fs1, ft9, rdn
                  fadd.s       fa3, fa2, ft1
                  feq.s        a0, fa2, ft0
                  fmv.x.w      s4, fs6
                  lui          s5, 803569
                  auipc        a6, 665894
                  sra          s10, s5, a6
                  auipc        s8, 173301
                  fmin.s       ft5, fa4, ft2
                  lui          a6, 238934
                  remu         sp, s7, s0
                  mulhu        s2, zero, a7
                  div          s6, sp, t6
                  srl          t4, s3, a3
                  fsgnjn.s     fs6, fs11, ft1
                  fmv.x.w      t3, fa3
                  slli         s10, s3, 19
                  sltu         t4, a1, s5
                  sltiu        a7, s3, -1420
                  sltu         a2, t4, a0
                  fmul.s       ft5, ft0, fs10, rup
                  fsgnjn.s     ft11, ft7, ft1
                  sra          a6, a5, a2
                  fmv.x.w      s3, fs1
                  fmv.x.w      ra, fa2
                  add          s1, t4, a6
                  fcvt.s.wu    fa7, s1
                  fle.s        s9, fs3, ft11
                  fdiv.s       ft0, fa1, ft7
                  fsgnj.s      fa5, ft11, ft3
                  fle.s        s9, fa7, fs11
                  fmin.s       fa6, ft9, fa6
                  nop
                  sll          a7, a5, t2
                  fmax.s       fs10, ft5, fs3
                  nop
                  slt          s10, s5, s10
                  or           s6, s5, s9
                  fsgnjx.s     ft1, ft2, fa6
                  fmin.s       fa4, fa5, fs1
                  sltiu        t3, a5, 781
                  fmv.w.x      ft2, s8
                  fmin.s       fs10, fa4, fa2
                  and          zero, s0, t2
                  andi         t3, s7, -1325
                  flt.s        s3, fs8, fs2
                  slli         t6, s3, 3
                  add          a7, s4, s7
                  slli         s10, t5, 23
                  addi         t3, a3, 925
                  xori         t3, t0, 1952
                  or           a1, zero, s3
                  addi         a7, zero, -1532
                  fsgnjn.s     fa7, fs4, fs9
                  divu         s8, a6, s7
                  nop
                  fmv.w.x      fa5, t5
                  andi         s2, t1, -819
                  fsqrt.s      fs1, fa6
                  fle.s        t4, fs5, ft6
                  mulhsu       a0, a5, t5
                  fadd.s       fa0, ft6, ft9, rtz
                  mulhu        t1, s11, sp
                  rem          s7, t4, s0
                  remu         t5, tp, s5
                  feq.s        t3, fs6, ft11
                  xor          tp, t2, s10
                  fmin.s       fs9, fs2, fs0
                  slti         a1, t6, -655
                  feq.s        a2, ft3, fa1
                  fmax.s       ft6, fa3, ft9
                  fclass.s     a5, ft10
                  srli         s8, s1, 20
                  auipc        s2, 907669
                  divu         gp, gp, s3
                  sltu         t2, t3, a6
                  fmul.s       ft3, ft0, ft4, rup
                  feq.s        s1, fs5, ft2
                  fclass.s     t2, fa1
                  ori          s4, a3, -1425
                  slli         s0, s5, 14
                  fsgnj.s      ft3, fa0, fa4
                  divu         gp, s6, tp
                  mulhu        tp, s6, a2
                  feq.s        s6, ft11, fa3
                  fadd.s       fs0, ft2, ft0
                  sub          s6, s0, s4
                  srl          a7, s5, s4
                  fclass.s     s1, ft10
                  rem          s2, a0, a4
                  flt.s        t2, fs4, ft10
                  srai         t3, s0, 10
                  fsqrt.s      fs9, ft3
                  fmax.s       fa6, fa3, ft5
                  fcvt.wu.s    tp, fs9
                  nop
                  fle.s        a6, fs9, fs1
                  feq.s        ra, fs5, ft4
                  xor          s5, s10, s10
                  fcvt.s.w     fa3, s0, rmm
                  addi         s3, a1, -23
                  fsgnjx.s     fa0, ft0, fs3
                  andi         s10, s9, 1443
                  fdiv.s       fa7, fa7, fs11, rup
                  sll          a7, s7, t1
                  sll          t6, s5, t0
                  fsgnjn.s     fa3, ft6, fa7
                  fmin.s       fs2, fa4, fa0
                  fcvt.s.w     fs8, zero
                  fle.s        s10, ft8, ft4
                  rem          s0, a3, s5
                  fdiv.s       ft0, fs3, ft4
                  fcvt.s.w     fs1, tp
                  mulhu        a2, s4, a3
                  fadd.s       ft3, fs10, fa0
                  slli         gp, tp, 14
                  srl          zero, a5, zero
                  fmin.s       ft6, ft2, fs10
                  and          tp, t5, a6
                  srai         t5, a4, 21
                  auipc        a1, 939880
                  feq.s        gp, ft11, fs8
                  mulh         a7, a3, a2
                  remu         s2, t2, s6
                  fsub.s       ft2, fa1, ft6
                  mulhsu       t5, s11, t2
                  fmv.x.w      s7, fa7
                  addi         a3, t2, 1558
                  srli         s8, s7, 30
                  ori          a6, s2, -1450
                  fcvt.w.s     a7, fa3, rtz
                  and          s5, a5, a0
                  fmv.w.x      fs7, a0
                  slli         s9, s0, 14
                  fmul.s       fs0, fa0, ft3, rdn
                  fmv.x.w      s8, ft0
                  srli         s9, tp, 12
                  fdiv.s       fa7, ft8, ft0, rne
                  sra          t4, s9, s7
                  fcvt.w.s     s5, fa7
                  fsgnj.s      fa6, fs5, fs0
                  fsub.s       ft7, ft9, ft10, rup
                  flt.s        a1, ft1, ft6
                  fsgnj.s      fa4, ft4, fa7
                  mulh         t1, s3, t2
                  auipc        s10, 309937
                  fcvt.wu.s    a0, ft4, rtz
                  xori         a2, t6, -714
                  fmul.s       ft0, fa3, fs5, rmm
                  slt          t2, a6, a1
                  lui          t4, 621023
                  sll          a7, t6, s9
                  fdiv.s       fs7, fs8, fs9
                  divu         s10, t6, s5
                  fsub.s       fa7, ft11, ft6, rmm
                  fcvt.s.wu    fs9, a7
                  mulhu        gp, a2, a6
                  slli         t3, t6, 19
                  or           tp, t2, s5
                  fclass.s     t4, fa6
                  auipc        a2, 372169
                  rem          gp, s2, a0
                  srl          s8, t4, t3
                  feq.s        s6, fa7, fs1
                  srl          s2, t6, t1
                  andi         a0, gp, -242
                  sll          s0, a4, t3
                  remu         a1, s0, s8
                  slt          ra, s10, zero
                  xori         s2, ra, 1548
                  fsgnjn.s     fs0, fs0, ft6
                  divu         a6, s2, a0
                  fsub.s       fs9, fs9, fs8, rup
                  or           zero, s5, ra
                  xori         t4, s1, 1074
                  or           a3, t4, ra
                  sltiu        a7, s4, -785
                  fsub.s       fs7, fa6, ft6, rup
                  mulhsu       zero, t4, a1
                  mulhsu       s2, t5, s4
                  srl          s1, t4, s6
                  remu         t3, a4, a7
                  addi         t5, s5, -775
                  or           s5, ra, s0
                  fsgnjn.s     fa5, ft9, fs9
                  mulhsu       s5, zero, a0
                  srli         t1, tp, 28
                  lui          s9, 481500
                  auipc        a3, 983665
                  feq.s        t5, ft2, fa2
                  srai         s4, a5, 8
                  fmv.w.x      fs5, a5
                  nop
                  rem          a2, tp, s6
                  fcvt.s.wu    ft7, a6
                  ori          sp, s5, 10
                  sltiu        t1, a0, 856
                  sltu         a5, s4, a1
                  sra          sp, s10, a1
                  fdiv.s       fs6, ft4, fa0, rne
                  fsqrt.s      fs7, fs1, rup
                  sra          zero, a6, s0
                  fadd.s       ft9, fs6, fa5
                  slti         s6, zero, -206
                  fcvt.s.wu    fa3, s10
                  fsgnjx.s     fa6, fa6, fs8
                  mulh         s4, t3, s3
                  srai         ra, a5, 6
                  sltu         s8, t2, s4
                  andi         a3, t1, -1056
                  mulh         t3, a3, s6
                  fdiv.s       ft11, ft10, ft1
                  add          gp, t6, s9
                  mul          s6, s5, t2
                  fle.s        s5, fa3, ft5
                  fcvt.s.wu    fs1, s5, rtz
                  srai         s1, s4, 4
                  sub          t1, s0, zero
                  fdiv.s       fs4, fs2, fa3
                  fsqrt.s      ft4, fs4
                  andi         a1, s0, -298
                  slt          t4, a4, s11
                  nop
                  fmv.w.x      fa4, t1
                  nop
                  feq.s        t4, fs1, fs9
                  sub          s9, tp, s3
                  mulhsu       a7, a6, a4
                  mulhu        a7, s8, s9
                  feq.s        t6, ft9, fa3
                  fsgnj.s      ft10, fa7, fa2
                  sub          t6, t6, s5
                  rem          t1, s2, a7
                  fcvt.s.w     fs5, s2, rne
                  srl          zero, t2, s0
                  sltiu        a5, tp, 388
                  sltiu        s6, t1, -1901
                  div          t5, a6, s8
                  fcvt.w.s     s1, ft1
                  add          ra, s11, s8
                  flt.s        t1, ft0, ft0
                  fdiv.s       fa4, fs9, ft7, rtz
                  fle.s        s1, fa5, fs0
                  sll          a7, a3, s6
                  sll          t1, t5, s9
                  slli         tp, s3, 27
                  fcvt.wu.s    s7, fs11, rdn
                  mulh         s1, a1, zero
                  fadd.s       fs4, fa1, fa1, rmm
                  fclass.s     s8, fa7
                  fcvt.s.w     ft10, s1
                  fmul.s       fs8, fs1, ft11
                  sltu         s10, s5, s4
                  fmv.w.x      ft8, s3
                  sra          s2, t6, s5
                  sltu         t1, tp, a1
                  fcvt.wu.s    t3, fs1
                  andi         a6, s7, -1206
                  xori         sp, s1, 1435
                  fcvt.s.w     fs3, s10
                  xor          s8, a0, t4
                  srl          s4, sp, s7
                  nop
                  fle.s        t1, fs6, fs11
                  slti         tp, a1, -1951
                  rem          a2, s6, zero
                  srl          a6, s10, ra
                  fsgnj.s      fs11, fa5, ft4
                  fcvt.s.w     fs6, s0
                  srli         s4, a7, 1
                  fcvt.w.s     s6, fs10, rmm
                  or           s10, gp, a5
                  feq.s        s3, ft7, fs5
                  fadd.s       fs7, fs9, fs3, rne
                  slli         ra, t3, 5
                  xori         zero, s5, 1115
                  add          s6, s4, t6
                  slli         a5, t4, 9
                  fmul.s       fa6, fa0, ft11
                  add          ra, s5, t4
                  srl          s0, a6, a0
                  fclass.s     s0, fa4
                  mulh         zero, s10, zero
                  fmul.s       fs9, fa7, ft11, rmm
                  flt.s        a0, fs0, ft11
                  fsgnj.s      fs6, ft5, fs5
                  fclass.s     gp, fs6
                  fsgnjn.s     fa2, fa6, fs5
                  fdiv.s       ft3, fa3, ft3
                  rem          s2, zero, t4
                  xori         s0, t4, 701
                  nop
                  xor          s6, tp, s10
                  mul          sp, s6, t1
                  auipc        s8, 1009932
                  mulh         gp, t2, s11
                  xori         s7, t3, 755
                  xori         t1, tp, 1781
                  sra          s4, a2, sp
                  fsgnj.s      fs10, fa7, fa1
                  slt          s6, gp, zero
                  flt.s        s2, ft1, fs3
                  fdiv.s       ft6, fs1, fa5
                  mulhsu       a0, a7, a6
                  mul          a3, s3, s1
                  add          s5, s10, s4
                  mulh         tp, t5, a5
                  fcvt.s.wu    fs1, t5
                  fmv.w.x      fs3, zero
                  add          t1, t3, ra
                  fdiv.s       fa7, ft4, ft7
                  fmv.x.w      a1, fs6
                  fmv.x.w      s9, ft9
                  or           a3, s3, s1
                  slti         a3, s4, -288
                  fmv.w.x      fa3, s3
                  srai         t1, t0, 19
                  fsgnjn.s     ft7, fs8, ft9
                  srai         a2, s6, 7
                  srl          a0, s8, t5
                  srl          t3, a7, a5
                  slt          s1, ra, s9
                  ori          s8, a5, -1545
                  nop
                  div          t5, sp, s0
                  fcvt.wu.s    s9, ft5
                  sltiu        s9, s11, 471
                  slti         s6, s10, -1228
                  fmax.s       fa1, fs1, fa2
                  sltu         s6, a0, a0
                  fcvt.wu.s    s0, ft8, rup
                  or           s5, s3, tp
                  fcvt.s.wu    ft5, a4, rdn
                  fcvt.s.w     fa1, t2, rup
                  sra          a6, t5, t6
                  fmax.s       fs11, fs7, fa6
                  feq.s        s8, fa6, fa6
                  fadd.s       fs8, ft5, fs0
                  srli         s5, s5, 3
                  divu         a3, a2, a0
                  add          s9, t0, a0
                  mul          a2, t2, t1
                  sra          a2, a1, ra
                  mulhu        ra, a0, s9
                  fsgnjx.s     fs9, fs2, fa3
                  rem          a3, s10, t5
                  mulhu        t6, t5, t0
                  auipc        t4, 847972
                  sll          t2, s11, a3
                  srai         zero, t1, 7
                  ori          t6, a4, 305
                  fcvt.w.s     a7, fs10, rne
                  lui          zero, 1029997
                  sltu         s8, s7, a1
                  mulh         a3, s5, s6
                  remu         a3, t4, a2
                  flt.s        s2, fa1, ft0
                  fsgnjn.s     fs4, fs10, fa2
                  fsgnj.s      fa4, fs9, fa0
                  sub          s0, s11, s3
                  fcvt.w.s     s9, fs8
                  andi         a3, a3, 1593
                  div          sp, a2, t4
                  lui          s1, 85174
                  fmax.s       fs2, fa6, ft9
                  srl          t5, s0, gp
                  fmul.s       fs10, ft0, fs8, rmm
                  fsgnjx.s     fs9, ft11, fs1
                  nop
                  sra          a5, a1, a0
                  xori         s4, s4, 1942
                  remu         s4, a6, s3
                  nop
                  and          t2, a3, s6
                  sltiu        s2, t1, 329
                  sll          s4, a5, s3
                  divu         s1, s7, s4
                  srl          t1, t3, t0
                  or           s7, s11, sp
                  sub          s9, s11, a7
                  fmin.s       fa6, fs9, ft2
                  fmax.s       fa3, fa6, ft2
                  mulh         t2, s6, s6
                  fsgnj.s      fs0, ft6, ft4
                  mul          s5, a6, a4
                  fclass.s     t4, fs7
                  mulhsu       s8, a2, t4
                  fle.s        s3, fs6, ft0
                  mulh         t5, s2, gp
                  fadd.s       ft9, ft9, fs10
                  fsqrt.s      ft2, fa5
                  sltiu        a1, s3, 1378
                  fle.s        s0, ft0, ft2
                  srai         zero, zero, 3
                  sub          gp, a4, zero
                  fsub.s       fs5, fs6, fa6
                  srli         t2, a0, 29
                  fle.s        t5, fs1, ft7
                  sll          s10, t3, s9
                  flt.s        a7, fs3, ft8
                  xor          a3, t2, a5
                  srai         tp, s10, 22
                  fcvt.wu.s    a3, fa1, rdn
                  fmin.s       fs2, fs1, fa7
                  fmin.s       ft6, fa6, fs6
                  sltu         s9, a0, s9
                  feq.s        a3, fa4, fs5
                  fadd.s       fs10, fs8, fa0, rne
                  srli         s4, a1, 2
                  xori         a3, tp, 1083
                  sub          a1, t4, s10
                  flt.s        gp, fa4, ft4
                  xori         a3, s4, -1881
                  sltu         gp, s5, s0
                  nop
                  mulh         zero, s8, a6
                  fcvt.wu.s    s10, ft4, rup
                  mulhu        a0, a2, s4
                  divu         s8, s10, s1
                  fdiv.s       ft0, ft7, fa6, rtz
                  fsub.s       fs8, fs0, fs3, rne
                  slt          s6, tp, s10
                  feq.s        s9, fs0, fs8
                  sub          s10, a0, s9
                  mulhu        s8, sp, gp
                  fadd.s       fs5, ft1, fs4, rdn
                  mul          s0, s4, s2
                  fmv.x.w      s7, fs1
                  fmin.s       fa3, fs2, ft6
                  fsgnjx.s     fa7, ft0, fa3
                  fmv.w.x      ft7, t1
                  xori         a6, s10, -796
                  feq.s        s6, fs4, fa5
                  fle.s        a5, fs9, ft9
                  fclass.s     a2, ft2
                  and          s7, s6, s1
                  mulhsu       t5, a7, a2
                  sltiu        a6, s3, -136
                  remu         s1, sp, s6
                  fsqrt.s      ft5, fa1
                  rem          t2, s9, t2
                  fcvt.w.s     s7, fs3
                  mulh         s6, s10, s0
                  fmul.s       fa4, fa4, ft1, rdn
                  fsub.s       ft2, fs9, ft8, rne
                  srli         a7, s11, 8
                  slli         zero, a6, 3
                  sub          t3, a7, s0
                  flt.s        s9, ft4, ft8
                  fsgnjx.s     ft7, fs0, fa0
                  fle.s        t2, fs1, ft1
                  or           s7, t5, s11
                  fle.s        ra, fs6, ft9
                  rem          a1, a5, a4
                  sltiu        a1, s11, -1040
                  fsgnj.s      ft8, fs5, fs2
                  xori         s9, s6, 676
                  slli         t5, s2, 19
                  fmv.x.w      a5, fs3
                  fcvt.s.wu    fa7, s8
                  feq.s        s4, fs1, ft11
                  fclass.s     s9, fa4
                  sll          zero, t4, s4
                  sra          s10, t3, t6
                  fle.s        sp, fa3, fs10
                  fclass.s     gp, fs9
                  srl          a7, a6, s6
                  slti         ra, gp, -1366
                  sra          t2, tp, gp
                  fmv.w.x      fa0, s1
                  srai         s2, a4, 8
                  mulhsu       a3, sp, a4
                  remu         a0, a2, a0
                  mul          t3, s3, s2
                  sub          s2, a7, s1
                  slli         s6, s10, 13
                  fsgnj.s      fs3, ft9, fs10
                  rem          t5, t0, a2
                  fmin.s       ft0, fs10, ft9
                  fsgnjn.s     fs9, ft3, fs2
                  and          s5, t6, ra
                  sltiu        s1, sp, -583
                  sra          ra, t2, t3
                  fmul.s       ft4, fa7, fa4, rup
                  mulhsu       a3, a3, a7
                  ori          zero, tp, -1034
                  srli         t2, sp, 17
                  mulhu        s7, s11, a4
                  sltiu        sp, s5, 1259
                  fcvt.w.s     t6, ft6
                  mulhsu       ra, a0, t4
                  xori         tp, s9, -448
                  fsgnjn.s     fs11, fa4, ft10
                  fle.s        sp, fa0, fs10
                  xori         a3, s11, 1511
                  add          t6, ra, s6
                  rem          s1, t5, a6
                  fsgnj.s      fs0, ft7, fa5
                  flt.s        gp, fa2, fs4
                  fcvt.wu.s    s9, ft7
                  rem          s3, s5, gp
                  srl          t4, zero, a4
                  ori          tp, s7, 1558
                  fmv.w.x      ft10, gp
                  fcvt.s.w     fs10, s4, rup
                  flt.s        zero, fs2, fa4
                  slli         a1, a5, 0
                  fle.s        t1, fs4, ft9
                  fdiv.s       ft8, fs7, fa1
                  fcvt.wu.s    a5, ft4, rne
                  srli         a0, s3, 8
                  ori          a2, a7, 841
                  mulh         zero, tp, s2
                  fclass.s     t4, fa6
                  rem          s6, s4, a0
                  mulhu        t3, a2, t1
                  fcvt.wu.s    s10, fa5
                  divu         a6, s4, s1
                  fsub.s       ft11, fa4, ft7
                  add          s4, s6, a5
                  feq.s        s9, fs6, fs10
                  lui          t1, 480138
                  mulhu        gp, gp, s10
                  addi         s4, s3, 1935
                  mul          a2, s4, s3
                  fsgnj.s      fa0, ft4, fs3
                  slt          t3, s10, tp
                  sll          s8, zero, ra
                  slli         t3, s10, 22
                  sltu         t4, a0, t5
                  ori          a5, a1, -754
                  fclass.s     ra, fs4
                  fcvt.s.w     ft0, s3, rtz
                  sll          a5, a7, s8
                  fle.s        s1, fs9, fs5
                  mulhu        gp, a1, s7
                  fmv.w.x      ft3, s7
                  and          s10, t2, s11
                  fsub.s       ft3, fs4, fa7
                  div          a3, t4, gp
                  or           t4, a0, s10
                  srl          s10, t2, t5
                  add          s6, s0, a2
                  fmv.x.w      a1, ft1
                  fmv.x.w      t3, fs3
                  fsgnj.s      ft1, ft7, fs0
                  feq.s        s3, ft7, fs1
                  nop
                  remu         t2, a2, a5
                  or           sp, s9, s7
                  mulhsu       s2, a1, s10
                  fle.s        t6, fs2, fs3
                  fadd.s       ft7, fs11, fa6
                  fmin.s       ft10, ft5, ft10
                  fsqrt.s      fa3, fs0
                  fdiv.s       ft9, fs0, fa2, rmm
                  fcvt.s.wu    fs6, s3, rdn
                  fle.s        a0, ft11, fs11
                  mulhsu       s10, ra, t1
                  srai         gp, s3, 11
                  mulh         s0, t6, t1
                  slti         s6, zero, -1324
                  fclass.s     tp, fs6
                  mulhsu       tp, a4, a3
                  srai         s2, s3, 5
                  fsgnjn.s     fs6, fa3, fs7
                  sll          a0, s11, s1
                  fadd.s       fs9, ft2, ft6, rdn
                  mulhu        a1, t1, t0
                  srai         s8, ra, 21
                  div          t3, s0, s5
                  slli         s7, t1, 7
                  fcvt.s.wu    fs10, s2
                  ori          a3, t5, 1474
                  fmv.x.w      t2, fs8
                  fmv.x.w      a7, fa6
                  lui          a3, 972728
                  div          a0, t6, a4
                  fmul.s       fs9, ft4, ft11, rdn
                  mul          s0, s3, a1
                  nop
                  andi         s7, t5, -2024
                  fmin.s       fs7, fs10, fs3
                  xor          t1, t3, t5
                  sub          a3, t1, a4
                  and          t1, a6, s3
                  fcvt.s.wu    fs6, s10
                  fcvt.s.w     fa7, a1
                  div          zero, s1, tp
                  divu         zero, s0, s3
                  mulhu        s6, s7, t4
                  fsqrt.s      ft9, ft6, rup
                  mulhsu       a3, a1, t4
                  sltu         t6, a0, a6
                  fmv.w.x      fs10, s10
                  fdiv.s       ft1, ft1, ft11
                  fmv.w.x      ft5, s6
                  nop
                  add          s4, t2, t0
                  fsub.s       ft4, fs1, ft2, rup
                  slli         tp, t3, 11
                  fsgnjn.s     fs7, ft9, fs8
                  mulh         tp, s10, s2
                  mul          a3, a6, a5
                  nop
                  xori         s6, s6, -1489
                  lui          a1, 629486
                  slt          s7, s3, a6
                  fmv.x.w      s8, ft6
                  fclass.s     s2, fa0
                  fle.s        ra, fs4, fs4
                  mulhsu       s4, t0, s11
                  add          t3, s9, t5
                  xori         ra, s1, -841
                  sltu         zero, s7, t4
                  slt          a3, ra, a2
                  srli         a2, s10, 0
                  mulh         t6, t2, s11
                  fsgnjx.s     fa7, fs1, fa4
                  fcvt.wu.s    a7, fs11
                  fcvt.w.s     a5, ft11
                  fle.s        t4, ft2, fs2
                  add          s3, a0, t0
                  xor          a5, sp, s1
                  fmv.x.w      t1, ft4
                  remu         a6, t0, t5
                  fsgnj.s      ft6, fs7, fs10
                  fsqrt.s      fs3, ft11
                  remu         tp, t2, tp
                  div          a7, t2, a5
                  rem          a6, s5, s4
                  fdiv.s       ft6, fs11, fs1, rdn
                  slt          t1, s5, s2
                  xor          s10, s6, t0
                  div          s5, s4, a4
                  sll          s2, a1, zero
                  fsqrt.s      ft10, ft10
                  fmul.s       fa5, fa1, fs2
                  fclass.s     t3, fa0
                  slli         s2, t3, 26
                  fcvt.s.wu    ft7, a3, rmm
                  sra          s9, a7, s0
                  fdiv.s       ft1, ft4, ft6
                  andi         s1, s3, 24
                  slti         s2, a7, -822
                  mul          s7, s2, t4
                  add          a7, t1, s2
                  rem          s7, t5, s11
                  and          s10, s2, t0
                  fadd.s       fs4, fs5, ft8, rup
                  srl          s1, t6, s10
                  sub          a1, t0, t2
                  lui          s10, 862271
                  div          t4, t5, a0
                  fmax.s       fs10, fa3, fs4
                  fclass.s     a6, fs11
                  srli         t2, t0, 19
                  or           sp, t3, a7
                  rem          t1, ra, t4
                  fsqrt.s      ft0, fa7
                  fmin.s       fs1, fs9, fs6
                  fmv.w.x      fa2, s0
                  slli         s3, zero, 28
                  fcvt.wu.s    s4, fa1
                  fsub.s       fs2, fa2, ft2, rmm
                  fclass.s     zero, ft10
                  fadd.s       ft9, fa4, ft3
                  fsgnj.s      fs9, fs1, fa6
                  and          t4, t3, s8
                  div          s8, s3, t0
                  nop
                  lui          s2, 163449
                  sra          t3, s1, s3
                  divu         s10, ra, t6
                  fmin.s       fs0, fs2, fa6
                  slt          t2, sp, s5
                  xori         a2, s9, -37
                  andi         t5, zero, -1704
                  fle.s        a2, ft9, fa4
                  addi         tp, s2, 1388
                  slt          a3, s7, s10
                  rem          t6, s4, sp
                  flt.s        t5, fa0, ft9
                  lui          t5, 338598
                  fmul.s       ft3, fa4, ft9
                  ori          tp, s7, -209
                  fcvt.s.wu    fa5, a2
                  fcvt.wu.s    s2, fa0, rmm
                  fadd.s       ft10, ft6, ft11
                  fsgnj.s      fs11, ft9, fs5
                  and          ra, s8, s8
                  remu         a6, zero, s3
                  div          a0, a2, a1
                  slli         t3, s2, 23
                  sub          s10, s11, zero
                  ori          s8, t1, 443
                  mulhu        s8, s1, gp
                  and          t5, gp, gp
                  nop
                  fdiv.s       fa0, fs3, fa7
                  mul          t4, a6, s7
                  addi         s3, zero, -178
                  fcvt.w.s     t5, ft2
                  fmax.s       fs4, fs0, fs5
                  andi         a5, a5, 734
                  fdiv.s       fa0, fa2, fs11, rne
                  slti         s0, a2, 1675
                  sra          t5, s7, a0
                  fmax.s       fs10, ft4, fa6
                  fcvt.wu.s    tp, ft6
                  sub          a5, s11, t6
                  add          t3, s5, tp
                  fmin.s       ft4, fa2, fs6
                  slli         s6, s2, 22
                  ori          a2, t3, 1669
                  lui          s3, 427850
                  div          s8, s7, sp
                  sll          t6, zero, tp
                  xori         t6, t1, 1020
                  fmin.s       ft1, fa4, ft3
                  srl          t5, s2, s0
                  fcvt.s.w     ft11, t1
                  fcvt.w.s     ra, fa3
                  fsqrt.s      fs4, fs8, rne
                  fcvt.wu.s    s1, fa0, rdn
                  and          s0, s10, sp
                  srl          s5, t0, ra
                  mulhu        s0, s8, s4
                  fdiv.s       fa2, ft2, fs1
                  sra          a7, a5, a5
                  sltiu        s7, tp, -159
                  xor          s1, s6, t6
                  feq.s        s7, fa4, fs9
                  sll          t3, s1, t0
                  mulh         a6, t3, t2
                  xor          zero, a2, tp
                  lui          s3, 446436
                  srai         s0, a2, 25
                  or           s8, a5, s9
                  fcvt.s.w     fa2, s8
                  add          s6, gp, t6
                  fmul.s       ft2, ft6, fa4, rup
                  remu         a5, a2, tp
                  fdiv.s       ft1, fs6, ft10
                  sltu         t2, t0, s0
                  nop
                  fmv.w.x      fs1, a4
                  divu         s8, t5, t0
                  fmul.s       fs1, fa5, fs9
                  remu         s4, ra, s0
                  nop
                  fadd.s       fs4, fa1, ft5
                  xor          ra, a7, ra
                  sltu         t1, t1, t0
                  nop
                  fmax.s       fs8, fs7, fs8
                  sll          t2, a4, t6
                  sra          t6, s2, s9
                  fsgnjn.s     fs11, fs7, fs6
                  mulhsu       a6, a4, s9
                  add          sp, s10, t1
                  xori         s3, s9, -1397
                  xori         s2, a0, 284
                  lui          s0, 655709
                  sra          s4, a2, ra
                  slti         s3, s8, 991
                  or           s7, t2, s1
                  srli         gp, s2, 18
                  rem          s0, a2, ra
                  sra          s0, a0, a6
                  or           s3, s11, s4
                  or           a3, tp, s3
                  add          t1, s4, a5
                  fmin.s       fa5, fa3, ft1
                  remu         t3, gp, t5
                  fsgnj.s      fa3, ft8, fs11
                  fsub.s       ft10, ft6, ft7, rne
                  sll          t5, s6, gp
                  fmv.x.w      s9, fs2
                  sll          s6, a6, s7
                  auipc        t5, 569945
                  srai         a5, zero, 4
                  remu         s0, tp, t2
                  fcvt.w.s     s4, ft3
                  sub          s6, s10, s1
                  sltiu        a6, s4, -391
                  feq.s        t6, ft4, fs2
                  slt          a2, t5, s7
                  fsgnjn.s     fs3, ft6, ft2
                  and          ra, a6, ra
                  fclass.s     s0, fs4
                  sltu         s9, t6, t5
                  fmv.x.w      s1, ft9
                  fcvt.s.wu    ft4, t3
                  fcvt.wu.s    a0, fs10, rne
                  fcvt.wu.s    t2, fs5
                  fcvt.w.s     a1, ft9, rtz
                  fclass.s     s4, ft1
                  fdiv.s       ft3, ft11, fs11, rup
                  mulhsu       gp, a0, s11
                  remu         t6, t4, s10
                  fsub.s       fa2, fs11, ft0, rtz
                  fle.s        a1, ft11, fa7
                  fcvt.wu.s    s9, fa2
                  fmul.s       fa5, fa2, ft1
                  mulh         t2, t1, s8
                  lui          s7, 482033
                  auipc        ra, 89927
                  fcvt.s.wu    fa5, t6, rup
                  fmin.s       ft0, ft4, fa1
                  xor          s10, tp, t2
                  fmul.s       fa3, fs4, fs5
                  fmax.s       fs10, fa1, fs5
                  srli         s7, s7, 15
                  fcvt.s.wu    ft3, s11
                  xor          s0, t6, sp
                  fcvt.w.s     s7, fs8
                  slli         s6, a1, 31
                  fcvt.s.wu    fa7, s10
                  remu         sp, tp, t6
                  sll          s8, s6, s11
                  div          zero, s3, s7
                  fmax.s       fa4, fs3, fs1
                  or           t3, s3, s9
                  fcvt.wu.s    sp, ft11, rup
                  sltu         s4, s0, t2
                  srai         a2, a5, 9
                  mul          s9, s1, a1
                  fadd.s       fa1, ft11, fs6, rne
                  fcvt.s.wu    fs3, t1, rdn
                  slt          s4, t6, s10
                  fsub.s       ft2, fs2, ft11, rtz
                  andi         a6, s10, 1497
                  fdiv.s       fs7, fs11, fs1
                  srli         t3, s5, 18
                  or           a6, a6, s4
                  fadd.s       ft11, ft11, ft5
                  mulhsu       a2, a3, s9
                  slti         a1, s1, -1899
                  sltiu        t4, s9, 834
                  addi         s1, a1, -574
                  sltu         tp, s7, s8
                  xor          s0, a0, t3
                  or           s0, s4, s6
                  auipc        s1, 363276
                  slli         s9, t3, 30
                  fsgnjn.s     fs7, ft5, fs3
                  slt          s9, t4, zero
                  fadd.s       ft1, fs11, fs6
                  slli         s1, a5, 18
                  rem          a5, tp, a4
                  fadd.s       ft4, fa5, fs5
                  rem          t2, t1, s7
                  sltu         t4, t2, s0
                  andi         s3, a2, -829
                  sra          gp, t4, s11
                  sltu         s4, ra, s6
                  mulhu        gp, s9, s0
                  fdiv.s       fa5, fs8, ft3
                  mulh         s3, s10, s10
                  lui          a6, 500731
                  xori         tp, s4, 1797
                  and          a7, a7, s9
                  fcvt.s.wu    fs11, s3
                  mulhsu       s0, s2, gp
                  fsqrt.s      fs8, fa6
                  lui          a2, 44561
                  xori         a0, t1, 1099
                  and          t1, sp, s3
                  ori          a0, zero, 1313
                  fclass.s     a3, fa1
                  sltu         a6, zero, s8
                  feq.s        s0, fs11, fa4
                  divu         s1, s8, s7
                  mulhsu       ra, s1, a7
                  fsqrt.s      ft7, fa7, rup
                  sltiu        s2, a4, 104
                  feq.s        s6, fs10, fs3
                  srli         t1, a5, 21
                  auipc        s9, 757076
                  fcvt.s.wu    fs9, tp, rne
                  divu         s6, tp, s8
                  andi         s5, s11, -318
                  fmv.w.x      fa7, sp
                  slt          a0, t0, s3
                  slli         gp, t6, 12
                  mulh         s1, t1, a0
                  mulhsu       tp, s0, a0
                  fle.s        a7, fs9, fs2
                  fmul.s       ft6, fs6, ft1, rtz
                  fdiv.s       ft9, fs9, fs0
                  xori         ra, zero, 126
                  sltu         t5, s8, s11
                  xori         gp, a1, 238
                  or           a6, s5, gp
                  lui          s2, 372821
                  mulhu        a2, t3, ra
                  flt.s        s3, ft11, fa7
                  sub          sp, t5, s10
                  srai         a0, gp, 2
                  fmax.s       fs10, ft8, fs3
                  fcvt.s.wu    ft6, s10
                  fmax.s       fa1, fs0, fa2
                  lui          t4, 849460
                  fmv.w.x      fs9, s5
                  div          a5, a5, ra
                  lui          s2, 983955
                  slti         a1, a4, 976
                  fmin.s       fs1, fa1, fa5
                  fsgnj.s      fa0, ft0, fa7
                  and          t3, t1, t1
                  addi         gp, a6, 1768
                  or           s1, t4, zero
                  xori         a2, s4, 1608
                  srai         a7, s11, 13
                  rem          a2, s2, s3
                  mul          s7, a0, s10
                  andi         ra, a6, 1450
                  or           a0, t4, s1
                  fcvt.s.wu    fa5, s8, rtz
                  divu         zero, s5, a2
                  div          s1, t2, s1
                  add          s6, t4, s7
                  slli         t3, s6, 29
                  srli         a0, sp, 30
                  sltiu        s0, s1, -150
                  remu         s1, t5, s3
                  slt          a1, s3, s6
                  xor          t4, tp, a7
                  srli         t5, gp, 17
                  divu         t5, s5, t0
                  fclass.s     sp, fa0
                  mul          a2, a1, s4
                  fsgnjn.s     fs7, ft5, ft0
                  srai         sp, s6, 31
                  mulhsu       s9, a4, a0
                  fcvt.w.s     ra, fa1
                  or           s6, s3, ra
                  mul          a2, a7, t3
                  mulh         s0, t2, s7
                  sub          s7, s0, s10
                  fmul.s       ft9, ft0, ft7, rmm
                  addi         a6, t6, -491
                  fsgnjx.s     fa4, fs3, ft9
                  sra          t2, t3, t5
                  divu         a7, s5, sp
                  auipc        s9, 582394
                  addi         s5, a5, 318
                  rem          a3, tp, s8
                  mulhu        t1, t6, s5
                  divu         s10, s8, a7
                  xor          a6, s5, s2
                  slt          s5, tp, t0
                  fsub.s       ft10, ft4, fs10, rtz
                  sra          s8, t4, gp
                  andi         a6, s7, -1455
                  fcvt.s.w     ft0, t0
                  rem          gp, s5, a1
                  sll          s10, a1, ra
                  sll          a3, t0, t4
                  nop
                  fcvt.wu.s    s4, fa4, rtz
                  fcvt.s.w     ft6, a2, rne
                  and          gp, a3, t6
                  mulhsu       s4, a2, a0
                  slt          a7, a1, s10
                  fsqrt.s      fa2, fs3, rne
                  fsgnjn.s     fs10, ft5, fs5
                  sub          a7, a6, s9
                  mulhu        t5, s11, t6
                  feq.s        a0, fs10, fs1
                  fcvt.wu.s    t2, fa2, rmm
                  fdiv.s       fs9, fs1, ft1
                  fsqrt.s      fs5, ft9
                  addi         s4, t1, -951
                  fcvt.w.s     s0, ft10, rmm
                  fmax.s       fs4, fs5, fs10
                  nop
                  feq.s        a0, ft1, fa5
                  or           t3, a7, a4
                  fsqrt.s      fs0, fa5, rtz
                  rem          s3, a6, t3
                  fle.s        a6, fs4, ft2
                  fle.s        t5, fs4, fs11
                  fsgnj.s      ft10, ft9, ft8
                  slli         s4, t1, 17
                  flt.s        s9, fs10, fs7
                  fdiv.s       ft2, ft2, fs7
                  auipc        a5, 316817
                  fmul.s       ft7, fs2, fa3, rdn
                  fdiv.s       fs7, fs4, ft8, rtz
                  auipc        s2, 611604
                  xor          s0, t1, a0
                  fcvt.s.w     ft6, a4, rtz
                  sra          s4, t2, s10
                  fadd.s       fs6, fs2, ft4, rne
                  flt.s        a7, fa1, fa4
                  sra          ra, a1, t4
                  sll          zero, tp, a2
                  slti         s2, t0, 1894
                  fmax.s       fa5, ft2, fs8
                  auipc        s8, 652568
                  andi         s4, s6, 108
                  divu         s6, zero, tp
                  fle.s        s4, fs2, fs1
                  mulhsu       t5, s11, s8
                  fcvt.s.w     fs8, a2
                  fcvt.s.w     fs5, t4
                  flt.s        s6, ft6, ft8
                  fsgnjn.s     ft7, ft0, fs5
                  fcvt.s.wu    fs2, a3
                  fmax.s       ft0, ft8, ft10
                  mulhsu       s5, t3, s6
                  sltu         t5, t1, t1
                  fcvt.wu.s    s8, ft0, rdn
                  mul          t1, s9, t2
                  sub          a1, a4, a2
                  xor          s2, s2, s6
                  xori         ra, t6, 2003
                  andi         s9, zero, -878
                  fmv.x.w      s5, fs2
                  srl          t6, a0, s7
                  fcvt.wu.s    s10, fa0
                  andi         s1, a7, 943
                  fsub.s       ft4, fa0, fa6, rmm
                  sub          t3, t6, t6
                  addi         t1, a3, 1119
                  remu         t4, a2, t0
                  fmax.s       fs8, fs2, fs9
                  slti         a0, t4, 1707
                  fdiv.s       fs9, fa7, ft2
                  fcvt.s.w     ft6, tp, rtz
                  fle.s        tp, ft8, ft10
                  sltu         a2, t2, a3
                  sltu         zero, t0, s1
                  fsqrt.s      fs4, ft9
                  fsub.s       ft6, ft10, fs6
                  auipc        gp, 1016123
                  and          a5, a5, t3
                  srai         s6, a4, 8
                  mulh         s7, t5, t0
                  rem          s2, s4, s4
                  fmax.s       fs8, fa7, fs2
                  xori         s6, t6, 593
                  slt          sp, s4, a7
                  fcvt.s.wu    fs11, a0
                  or           t3, a4, t2
                  or           s7, s7, s6
                  fdiv.s       fs8, fa4, fs2, rne
                  srl          t3, tp, sp
                  xor          t2, s3, s5
                  sltu         a5, s6, gp
                  or           t6, a5, t5
                  mulh         t1, s6, a7
                  fcvt.wu.s    a2, fs4
                  fcvt.w.s     a6, fs0
                  div          a5, a1, t3
                  fsgnj.s      fs7, ft2, fs1
                  divu         zero, sp, a7
                  fmax.s       fs8, fa7, fs0
                  auipc        s10, 275702
                  sub          s1, a0, a4
                  sltu         t4, t4, a4
                  div          a5, a2, gp
                  xori         a3, a7, 1428
                  fsgnjx.s     ft9, fa0, ft2
                  sub          t3, t4, a6
                  slti         s4, gp, 297
                  sub          s3, t4, a7
                  srai         s4, s7, 11
                  srli         a2, a1, 20
                  fsgnj.s      fs5, fs8, ft3
                  fclass.s     t4, fs2
                  fclass.s     a2, fs4
                  fmin.s       ft2, ft10, fa0
                  fdiv.s       fa2, ft10, fs4
                  rem          s9, s4, a6
                  divu         a3, a5, a0
                  fmv.x.w      a6, ft5
                  mul          zero, t4, t5
                  fle.s        s10, fs8, ft2
                  fcvt.s.w     fs4, s10, rne
                  sll          a7, tp, s0
                  xori         t3, a3, 312
                  fdiv.s       fa7, fa0, fs2, rdn
                  mulhsu       a7, a4, t6
                  mulhu        a7, s7, a4
                  and          t3, s3, s2
                  flt.s        a2, ft7, ft6
                  slli         a5, s3, 18
                  remu         s8, t2, s7
                  lui          a3, 296447
                  fmv.w.x      fa6, s7
                  div          t5, a5, t6
                  andi         s6, a2, -853
                  rem          s9, s0, s2
                  and          sp, s11, t4
                  sltiu        a6, s7, 1839
                  slli         s3, tp, 21
                  fcvt.w.s     sp, ft6
                  lui          gp, 75123
                  fmv.x.w      t1, fs4
                  sltiu        s5, s5, -1788
                  or           sp, s11, s3
                  fcvt.s.w     fs0, a4, rtz
                  fcvt.s.w     ft8, s11, rdn
                  mul          a5, sp, s1
                  nop
                  divu         ra, ra, s11
                  rem          s4, t4, t6
                  rem          a5, s10, t0
                  fclass.s     s8, fs3
                  remu         s4, a2, s4
                  slt          s6, ra, t5
                  ori          a2, t3, 1676
                  fclass.s     t4, fa1
                  rem          a0, gp, t5
                  rem          t1, t5, sp
                  fmul.s       ft11, ft5, fs2, rtz
                  fsgnj.s      fs1, ft4, fs2
                  fadd.s       ft2, fa0, fa4, rmm
                  or           t2, ra, s8
                  and          s8, s8, a6
                  fsgnjn.s     fa0, ft6, fs0
                  or           s8, s2, a0
                  srli         s9, s10, 30
                  sltu         zero, a2, s11
                  fsgnj.s      ft3, ft6, ft10
                  srl          t2, s4, a7
                  fmul.s       fs9, ft0, ft2
                  fcvt.s.wu    ft3, s5, rup
                  ori          a3, t0, -17
                  srl          s6, t3, t3
                  xori         a2, s5, 1132
                  fmin.s       fa4, fs1, fs6
                  fmul.s       ft8, fs5, fa4, rup
                  add          a1, t1, a1
                  fcvt.wu.s    s0, fs7
                  sltu         a7, t5, a3
                  fclass.s     t5, fs7
                  srai         zero, s5, 0
                  sra          a2, a6, a2
                  mulhu        a3, a7, zero
                  fclass.s     t1, fa5
                  remu         t3, s8, gp
                  slt          tp, s10, gp
                  mulh         s1, a4, s3
                  mulhsu       a3, s9, a7
                  ori          ra, s2, 1683
                  div          a6, a3, s8
                  fcvt.s.wu    fs9, s4, rne
                  fle.s        t4, ft4, fs9
                  sra          s5, s11, s11
                  mulhu        s6, a3, s8
                  rem          t4, s4, s0
                  flt.s        a7, fa0, fa1
                  fadd.s       fa6, fs2, fs6, rmm
                  fadd.s       fa0, fs10, ft4, rmm
                  fsgnjx.s     ft4, ft7, fs6
                  remu         ra, t6, s9
                  sltiu        sp, a2, -308
                  fdiv.s       ft9, fa1, fa1
                  sll          zero, a1, s3
                  slli         s7, t4, 13
                  fmul.s       fs5, fs1, fs4, rdn
                  fdiv.s       ft7, ft9, fs2
                  fcvt.s.w     ft4, s11
                  mulh         s10, s4, t5
                  fmv.w.x      ft2, s7
                  sub          a3, s4, s4
                  fmv.x.w      t3, fa6
                  fclass.s     t4, ft7
                  fmul.s       fa2, ft2, ft2, rmm
                  fsub.s       fa1, ft6, fa4, rup
                  sltiu        t5, s6, -933
                  srli         s9, a1, 14
                  rem          t3, s9, a4
                  mulhsu       t5, t4, a4
                  srl          s3, a7, a1
                  feq.s        a3, ft11, ft5
                  fsqrt.s      ft6, fa6
                  sra          s6, s8, a7
                  srli         t1, s1, 3
                  srli         s3, s10, 29
                  srli         s4, s0, 30
                  fcvt.s.wu    ft0, s8
                  fcvt.s.wu    fa6, s4
                  fdiv.s       fs2, ft8, ft3, rup
                  fdiv.s       ft1, ft7, fs5
                  auipc        s8, 284578
                  fmv.x.w      t1, fs3
                  mulh         s3, a1, s6
                  sltu         s3, a1, sp
                  flt.s        t2, ft1, fs5
                  sra          a3, s3, s6
                  fclass.s     t4, ft5
                  feq.s        sp, fa3, ft11
                  fsub.s       ft1, ft6, fa3, rne
                  mulh         ra, t0, t2
                  lui          ra, 799787
                  sltu         a0, a7, s10
                  srli         s4, ra, 18
                  fdiv.s       ft1, ft3, fs4, rne
                  fmin.s       ft4, ft1, ft2
                  fmax.s       ft11, fs10, fs10
                  xor          tp, s2, s4
                  fcvt.s.w     fa2, a1, rdn
                  srai         s0, a6, 10
                  mulhsu       s1, t1, sp
                  slt          s2, s8, s1
                  mul          ra, a7, t2
                  ori          a5, s9, 1509
                  fle.s        a7, ft2, fa1
                  nop
                  sltu         zero, a4, t4
                  slli         a1, ra, 11
                  auipc        a6, 189416
                  fdiv.s       ft8, fs6, fs0
                  fsub.s       fs6, ft0, fs10, rmm
                  srai         s3, t5, 28
                  mul          a1, a0, gp
                  mulhsu       s4, ra, s6
                  fmin.s       fs11, fa0, fs9
                  fcvt.w.s     tp, ft7
                  sltu         sp, t2, a3
                  sltu         s5, s8, s9
                  fmax.s       fs8, fa2, fa6
                  xor          s2, s2, sp
                  sub          t1, ra, sp
                  remu         sp, sp, ra
                  remu         zero, s8, t2
                  mulhsu       a3, a7, s6
                  fclass.s     a3, ft4
                  nop
                  ori          ra, s1, -1238
                  fsgnjn.s     fa1, fa4, fs9
                  add          s8, t4, t2
                  rem          a6, s8, s8
                  srai         tp, zero, 16
                  fcvt.w.s     tp, fs1
                  fmin.s       fa1, ft3, fa0
                  addi         t5, t3, 1525
                  add          t5, t1, a6
                  or           s1, s4, t2
                  fsub.s       fs8, ft8, ft10, rmm
                  mulh         s3, sp, sp
                  slt          t2, tp, s1
                  nop
                  fle.s        a7, fs8, ft11
                  slti         gp, sp, -908
                  fsgnj.s      ft8, fa6, fa6
                  fcvt.wu.s    s3, fs5, rne
                  nop
                  mul          a1, t6, s11
                  div          s8, a6, ra
                  add          s7, a3, t3
                  flt.s        sp, fa0, fs10
                  auipc        a5, 544076
                  fsgnjx.s     ft8, fs3, ft3
                  lui          s10, 64062
                  add          sp, s4, ra
                  fsgnj.s      ft6, fs0, fa0
                  auipc        a5, 166679
                  fclass.s     a5, fa7
                  fadd.s       fs4, ft1, fs6, rmm
                  xori         s6, t6, -666
                  nop
                  fcvt.wu.s    s2, ft11, rup
                  rem          a3, s1, a1
                  fclass.s     s7, fs5
                  fmv.x.w      t2, fs9
                  nop
                  div          a5, s4, s6
                  fmin.s       fs0, fs5, fa0
                  fle.s        s3, fs6, ft8
                  fmin.s       ft7, fs9, ft9
                  lui          a3, 307837
                  fsub.s       fs3, fa2, fs11, rmm
                  or           ra, s5, zero
                  divu         t3, t1, s6
                  fmv.w.x      fs8, s4
                  fcvt.s.w     fs10, s1
                  slli         a5, s2, 20
                  nop
                  lui          s7, 864765
                  mulhu        sp, ra, a2
                  rem          s0, a6, s2
                  sll          s5, t0, s3
                  fle.s        s6, fs6, fs5
                  fsqrt.s      ft2, fa6, rdn
                  srai         t1, a3, 9
                  fcvt.s.wu    fa3, t2, rtz
                  flt.s        t3, ft2, fs8
                  fmin.s       ft4, fa5, ft10
                  divu         s10, s4, s9
                  fcvt.s.w     fa7, gp, rup
                  sltiu        t5, a7, -370
                  addi         s9, zero, 1926
                  sltu         s5, ra, gp
                  add          a6, t0, t2
                  fle.s        a2, fa6, fs2
                  fcvt.s.w     ft9, a5, rdn
                  fmul.s       fs5, ft10, fa2
                  andi         a0, a5, 1740
                  sltu         s7, a2, s1
                  srai         t2, t2, 6
                  add          a6, t2, s5
                  sltu         s10, sp, gp
                  andi         tp, a7, 1142
                  ori          s7, t2, -1499
                  fmv.x.w      a3, fa4
                  sll          s3, s0, t1
                  slt          ra, t4, tp
                  addi         a5, t2, 1689
                  div          a5, sp, s1
                  fmul.s       ft6, fs11, ft2
                  fmin.s       fs9, fa3, fs10
                  fmin.s       fa2, ft3, fa1
                  fsgnjx.s     fs1, fs2, ft7
                  ori          s0, s2, -934
                  div          s9, a0, s4
                  nop
                  fcvt.s.w     fa7, s4
                  fsub.s       fa6, ft9, fa3
                  mulhsu       s5, t2, s8
                  sll          s1, t0, s5
                  slt          s0, a0, gp
                  fcvt.w.s     s10, fs9, rmm
                  srli         s8, s9, 15
                  xor          s1, t2, s4
                  sltiu        gp, s8, 331
                  fcvt.s.w     ft2, a3, rtz
                  fmv.w.x      fa2, s5
                  slt          t6, s4, t4
                  fsub.s       fs7, fa0, fs1
                  fcvt.s.wu    ft0, s1
                  fcvt.wu.s    sp, ft5
                  mulh         a3, s3, s2
                  fcvt.wu.s    a3, ft1
                  fclass.s     s3, fa0
                  fmul.s       fs3, fs7, ft11
                  fmax.s       ft2, fs2, ft6
                  flt.s        a0, ft11, fs1
                  fcvt.s.wu    fs6, t4, rmm
                  fcvt.s.wu    fs5, a3
                  fdiv.s       fs8, fs11, ft10, rtz
                  mulhu        ra, s0, s6
                  fmin.s       fs9, ft2, fa0
                  xori         a2, s5, -996
                  fclass.s     s2, fa6
                  and          s7, s6, s6
                  fcvt.w.s     a7, fs1, rup
                  fsqrt.s      ft11, fs6, rmm
                  slli         sp, gp, 31
                  fcvt.w.s     t4, ft9
                  fcvt.s.wu    fs10, t6, rup
                  nop
                  mulhsu       s8, t3, s8
                  mulh         a0, zero, a4
                  fdiv.s       fs0, fs0, fs1, rup
                  srli         t2, t6, 25
                  srai         s0, s1, 28
                  srli         s7, a6, 22
                  flt.s        s4, ft4, ft9
                  fcvt.wu.s    s3, ft5, rup
                  flt.s        a3, ft5, fs6
                  fmv.x.w      gp, ft1
                  and          t1, a3, s9
                  srli         a1, a4, 30
                  fdiv.s       ft4, ft2, ft8, rup
                  fsgnj.s      fs1, ft7, fa7
                  fmv.w.x      fa0, a6
                  fcvt.s.wu    ft5, s11
                  nop
                  andi         t3, s1, -1741
                  srli         tp, a3, 3
                  fle.s        s8, fs8, fs9
                  and          t5, a0, s3
                  slti         a0, a0, 1041
                  fcvt.s.wu    fa1, zero, rne
                  or           a0, a2, s11
                  srl          s1, s5, s2
                  rem          s5, s6, tp
                  xori         a7, gp, -1151
                  srl          s6, s10, gp
                  sub          a5, s9, s8
                  nop
                  srli         s2, s11, 1
                  fsgnjn.s     fs7, ft0, fa2
                  sll          s9, t2, s3
                  fsgnjn.s     fa4, fa5, ft5
                  xori         s3, zero, 1338
                  fmax.s       ft10, fs5, ft11
                  flt.s        s1, ft9, fa5
                  fcvt.s.w     fs10, s7, rdn
                  andi         s8, a0, 1663
                  mul          s3, s3, gp
                  fsgnjn.s     fs4, ft6, fs9
                  and          s5, t0, t1
                  xori         s7, s11, -1912
                  mulhsu       a3, a1, t1
                  or           s6, t6, sp
                  fmv.x.w      s0, ft7
                  fmv.w.x      ft4, a1
                  sll          s9, t5, a1
                  ori          a5, t1, -1727
                  rem          s0, a1, s0
                  fclass.s     s4, fs4
                  fcvt.s.wu    fa6, t2
                  and          a0, ra, a5
                  fmul.s       ft2, ft11, fs0
                  or           s6, gp, t2
                  srli         a2, a6, 25
                  lui          a2, 646132
                  srai         s4, a1, 4
                  fadd.s       fs7, fs5, fs2
                  fmv.x.w      a5, ft11
                  rem          t5, t4, a1
                  sra          t1, s10, a3
                  fle.s        s10, fs4, ft0
                  remu         a7, sp, s0
                  fsqrt.s      ft5, fs8, rdn
                  xor          s3, s5, a3
                  fdiv.s       fs2, fa5, fs2
                  fmul.s       fs4, fa0, fa4
                  remu         t4, zero, a3
                  fdiv.s       fa3, fs4, fa2
                  fcvt.wu.s    gp, ft11
                  fadd.s       fs5, fs6, fa0, rtz
                  srl          t1, gp, a5
                  fmv.w.x      fs6, s1
                  srl          t1, a1, sp
                  div          s10, t3, a7
                  flt.s        t4, ft7, fs9
                  nop
                  divu         t6, a7, a0
                  fsub.s       fs9, fa2, fa3
                  fmv.w.x      fs8, t0
                  fmax.s       ft5, fs11, ft3
                  sub          t3, tp, s3
                  fclass.s     s7, ft1
                  add          s9, t2, a2
                  fadd.s       ft3, fs8, fs2
                  fsgnj.s      fs8, ft6, ft5
                  lui          a0, 419364
                  slti         t6, a1, -1681
                  fsgnjn.s     fs4, ft9, fa5
                  srli         a7, a0, 9
                  lui          t5, 55621
                  slli         gp, sp, 11
                  fdiv.s       fa3, ft5, fa0
                  flt.s        zero, ft2, fa6
                  fle.s        s3, ft7, ft2
                  sub          a3, a2, t0
                  slt          zero, t5, t3
                  fsgnj.s      ft7, ft1, ft4
                  fcvt.s.wu    fa2, s5
                  div          t5, t1, s10
                  srai         t2, s2, 10
                  srli         s0, s7, 26
                  addi         s6, ra, 408
                  nop
                  auipc        sp, 621670
                  fmv.x.w      s7, ft7
                  fmv.w.x      fs10, s7
                  slti         zero, t6, 1681
                  sub          s5, s8, s10
                  and          s9, s9, gp
                  slt          s4, sp, a6
                  xori         t5, gp, -1147
                  mulhu        a0, t1, gp
                  auipc        t6, 627011
                  xor          s6, s7, s7
                  mul          t2, s0, a6
                  srli         s10, s10, 9
                  fcvt.s.wu    fs6, s2, rdn
                  srl          s5, s0, s9
                  fsub.s       fs8, fs1, fa2
                  remu         a2, t5, gp
                  fsqrt.s      fs2, ft4, rup
                  sra          s6, a6, tp
                  fcvt.s.w     ft5, s2
                  add          a3, s2, t1
                  fcvt.s.wu    fs6, a7
                  fsqrt.s      fs11, ft10
                  fsub.s       fs9, fa5, fs11, rne
                  nop
                  slti         s1, t6, -726
                  slti         s10, tp, 191
                  fclass.s     s5, ft4
                  sra          t2, a3, s0
                  fdiv.s       fs7, ft0, fa1
                  mulhsu       a3, s2, s6
                  ori          a2, a5, -1056
                  sltiu        t3, s1, -1297
                  fmin.s       fs8, fs2, ft2
                  rem          t2, t6, s3
                  nop
                  srl          tp, t3, s11
                  divu         t1, a1, s7
                  sltu         a2, s5, gp
                  and          a0, s4, t1
                  srli         t2, t2, 17
                  flt.s        tp, fs4, ft4
                  mulhu        s0, s9, t5
                  fsgnjx.s     ft5, fa2, ft9
                  fcvt.s.wu    fs1, a5, rup
                  fadd.s       fa2, fs1, fa7, rdn
                  nop
                  flt.s        a3, fs2, ft11
                  fsgnjn.s     fa3, ft11, ft9
                  feq.s        s9, ft3, fa4
                  flt.s        gp, ft0, fs11
                  fmin.s       ft5, fs0, fa7
                  fsub.s       fa5, ft5, fs6
                  addi         tp, s8, 1874
                  sub          sp, tp, a3
                  xori         t4, s7, 448
                  fmax.s       fs4, fa7, ft4
                  xori         s5, s10, -302
                  fmv.x.w      a0, ft2
                  fcvt.s.w     fs9, s7, rne
                  fsqrt.s      fs0, fs2, rtz
                  srli         s2, tp, 31
                  fcvt.wu.s    a6, ft9, rne
                  sltiu        s1, gp, -1848
                  fmin.s       ft9, fs8, fa4
                  mulhu        s9, t2, tp
                  feq.s        sp, fs9, fs11
                  mulh         a3, s9, s6
                  fsgnj.s      fs3, fs4, ft9
                  fcvt.w.s     a0, fs3
                  remu         t2, t5, s9
                  fmv.x.w      s3, ft7
                  fcvt.wu.s    s6, fa6, rtz
                  remu         s4, a4, t2
                  sltiu        s1, ra, 613
                  sltiu        s2, a4, -682
                  fle.s        s10, fs7, ft9
                  mul          tp, sp, gp
                  feq.s        t3, ft11, fa2
                  fclass.s     t1, fa3
                  add          s5, s11, s5
                  fmv.x.w      ra, fs5
                  fsub.s       ft10, fa4, fa3, rmm
                  fclass.s     s0, ft2
                  and          zero, s8, t5
                  fcvt.w.s     t3, ft0
                  xori         a1, t4, -851
                  mulh         s4, a1, a5
                  srli         t6, a3, 26
                  mulh         a2, a4, s4
                  sltiu        sp, a3, 490
                  xor          zero, s1, ra
                  slt          a7, s2, t0
                  slt          t2, a7, t0
                  fsgnjn.s     fs1, fa1, fa1
                  mulh         t3, sp, t3
                  fle.s        t6, fa3, ft7
                  slti         s0, a0, -1590
                  mulhu        s1, t5, sp
                  lui          t4, 650297
                  sub          s0, t3, t3
                  rem          t2, s0, s9
                  rem          s7, a0, t0
                  fcvt.s.w     fa4, a0, rmm
                  xori         zero, t6, 702
                  srl          t4, a2, a7
                  fcvt.s.w     fs7, a2, rdn
                  slti         gp, sp, -414
                  fclass.s     a7, fa6
                  fle.s        a2, fa2, fs5
                  mulhsu       tp, gp, t4
                  fmin.s       ft9, fa7, ft4
                  fclass.s     ra, ft11
                  fsqrt.s      fs11, fs11, rmm
                  fmax.s       fa5, ft0, fs6
                  fmax.s       ft8, fs5, fs8
                  fmv.x.w      gp, ft8
                  fmin.s       fs11, ft2, fs1
                  mulhu        sp, a3, t5
                  divu         s9, a5, a6
                  rem          s3, t5, s11
                  fmv.w.x      fs4, s2
                  addi         s7, ra, 230
                  remu         s0, t4, s3
                  fcvt.s.wu    fa6, s2, rne
                  sltu         s8, a3, zero
                  remu         s10, s4, a2
                  mul          s3, a7, zero
                  slli         tp, s0, 27
                  fsqrt.s      ft10, fs5, rdn
                  mul          s10, s8, t2
                  mulhu        t1, t6, t5
                  remu         s10, s5, gp
                  sub          t3, a0, t5
                  fcvt.s.wu    fs2, s5, rmm
                  div          s7, a0, zero
                  fsqrt.s      fs7, ft0
                  fadd.s       fs10, fs0, ft9, rmm
                  slt          a5, s9, s9
                  fsub.s       ft11, fs5, ft0
                  sltiu        s0, s6, 1546
                  sll          a5, a6, s3
                  xor          s2, t0, s8
                  xori         s2, gp, 1396
                  srl          t3, gp, a4
                  fle.s        a1, fa2, fs8
                  sub          t3, t2, gp
                  mul          t3, s8, s2
                  mulhu        zero, s8, s1
                  fsgnj.s      ft10, fs3, ft7
                  slt          a6, sp, t4
                  slli         t2, s5, 3
                  fsgnjn.s     fa6, ft0, ft10
                  slt          s5, s5, s2
                  sub          s5, t2, s9
                  sra          a5, t3, s5
                  fmul.s       fs9, fa0, fs5, rne
                  fmin.s       ft8, ft10, fa0
                  addi         s5, s9, 1030
                  add          a2, s9, t0
                  remu         s4, s0, s10
                  remu         a5, s10, s4
                  fcvt.w.s     sp, fs6
                  fmul.s       ft1, fs0, fs3
                  mul          t1, s8, t1
                  mul          s10, a5, gp
                  fmv.w.x      fs9, gp
                  sltiu        a5, s4, 662
                  fclass.s     s0, fs5
                  fclass.s     s5, fa2
                  fsgnj.s      fs0, ft4, fs11
                  or           s6, ra, a0
                  feq.s        s2, fa6, fs5
                  fcvt.w.s     s1, fa0, rdn
                  mulhsu       a3, s8, gp
                  add          a3, t4, s1
                  fmin.s       ft2, fs11, ft3
                  andi         a5, s5, -882
                  srl          t4, a4, s2
                  fsgnj.s      ft2, ft1, fa6
                  slti         t5, s9, -1430
                  addi         a1, s6, -1080
                  fcvt.w.s     s2, fa1, rne
                  mulh         s8, s6, s8
                  mulhu        t2, t6, a6
                  ori          gp, s3, 1733
                  addi         t1, sp, -1520
                  sll          s7, t6, a5
                  sra          s10, a3, a2
                  ori          a6, t3, 1893
                  fsqrt.s      ft8, fa2, rtz
                  addi         a1, t4, -1777
                  addi         a3, s5, 1279
                  fsqrt.s      fs4, fa5
                  srl          a0, t2, s7
                  sltiu        a3, a0, -1417
                  add          sp, t2, a1
                  fmax.s       fa3, ft5, ft11
                  srl          a3, a5, a0
                  and          s0, s2, s7
                  fsgnjn.s     ft6, ft0, fs7
                  srl          t6, a0, zero
                  fadd.s       fs2, ft4, fs0
                  fclass.s     s3, fa5
                  flt.s        a1, fs8, fa7
                  fclass.s     t5, fs2
                  fmv.w.x      fs4, zero
                  div          t5, a2, t4
                  srai         t6, t6, 4
                  xor          t4, a5, a4
                  divu         s5, a3, a4
                  mulhsu       s1, a3, gp
                  nop
                  sltu         s2, s4, s0
                  nop
                  srli         s6, s1, 12
                  fsqrt.s      ft2, ft9, rtz
                  fcvt.w.s     gp, fs9
                  slli         a3, s8, 23
                  fcvt.w.s     s7, fa5, rtz
                  slt          s9, s9, a1
                  fcvt.s.wu    fa0, s11, rtz
                  or           t2, t0, s2
                  mulh         a7, sp, s10
                  mulhu        t4, s5, a1
                  fadd.s       fs4, ft3, ft2, rdn
                  srai         s8, gp, 4
                  fmul.s       fs5, ft1, ft9, rdn
                  or           s2, a6, t5
                  mul          s8, zero, a5
                  fcvt.s.w     ft1, s6
                  fsgnjx.s     ft10, ft6, fa2
                  slti         s7, zero, 169
                  fsqrt.s      fa5, fs0
                  add          a7, a1, a0
                  div          s3, t6, t4
                  fsqrt.s      fa2, ft7, rtz
                  mulhu        tp, t4, s2
                  divu         a1, s2, t5
                  srl          s8, s3, s10
                  fcvt.wu.s    a3, fa5, rdn
                  slli         s5, t6, 9
                  fle.s        t3, ft5, ft8
                  xori         t5, s3, -1839
                  sub          zero, t0, a7
                  fcvt.wu.s    a1, fs7, rmm
                  fcvt.w.s     s0, fs11
                  fmv.w.x      ft9, sp
                  flt.s        s1, fa2, fa5
                  feq.s        zero, fa1, ft3
                  srai         ra, a4, 10
                  slti         s9, a1, -1763
                  fmin.s       fs2, fs4, fs11
                  rem          t3, t5, s3
                  mul          a3, ra, t4
                  addi         zero, t0, -1330
                  sltu         t4, s4, t1
                  add          s0, a1, t4
                  fle.s        t6, fs9, ft3
                  xor          ra, s2, a3
                  fdiv.s       ft4, ft11, fs3
                  mulh         s3, zero, a1
                  divu         t5, t0, s11
                  fmv.x.w      s9, ft8
                  fsgnjx.s     ft5, fa2, fa6
                  mulhu        gp, a7, t5
                  divu         s9, s9, s10
                  fmv.x.w      sp, ft6
                  mulh         s5, a6, ra
                  fmax.s       fs4, fs7, fa5
                  fcvt.s.wu    fa0, a6, rdn
                  slli         zero, a6, 20
                  fsub.s       fa4, ft2, fs7
                  fmv.x.w      s0, ft3
                  remu         t1, tp, s5
                  fle.s        sp, fa3, fa5
                  slli         t4, t1, 17
                  mulhsu       a7, a2, gp
                  fsub.s       fs5, fs0, ft8
                  flt.s        a3, fs6, ft11
                  ori          t5, t0, 1791
                  fsgnj.s      ft8, fs3, fs7
                  divu         gp, s8, t5
                  fcvt.w.s     s8, fs3
                  slti         a1, s2, -90
                  srli         s9, s4, 2
                  mul          t5, t5, a5
                  slli         a2, t2, 31
                  or           a2, sp, a3
                  fcvt.w.s     a0, fa2
                  fcvt.w.s     s2, fs1
                  srai         t1, s3, 8
                  fsgnjn.s     fs8, fa2, fs3
                  fclass.s     s5, fs10
                  mulhsu       s7, a2, t6
                  srai         a3, a5, 2
                  ori          gp, s11, -1285
                  fsqrt.s      ft2, ft3, rmm
                  fsqrt.s      fa0, ft2, rdn
                  slti         a2, s0, 1090
                  fmv.x.w      s1, fs1
                  sltu         ra, s6, t4
                  mul          gp, zero, s4
                  or           s0, a7, a1
                  mulhsu       zero, a3, a3
                  xori         s3, sp, 1878
                  sub          a7, t4, t0
                  slt          s7, a3, a7
                  fsub.s       fs0, fa4, fs6
                  fcvt.w.s     t5, ft6
                  fcvt.w.s     t1, fs7, rup
                  fsgnjx.s     ft4, fs10, fs6
                  ori          s8, t1, -410
                  fmv.x.w      s9, fs11
                  srl          a1, t4, a6
                  sltiu        s6, t2, 1037
                  fle.s        s10, ft10, ft8
                  mul          s9, s10, gp
                  srai         a2, sp, 21
                  fadd.s       ft2, fs0, ft8, rne
                  fsqrt.s      fa6, fs10, rtz
                  fdiv.s       fs0, ft8, ft6
                  mul          a3, s4, t0
                  add          t1, t3, ra
                  auipc        a5, 549628
                  remu         s7, gp, a7
                  srli         s4, a6, 29
                  lui          zero, 331946
                  auipc        s3, 190176
                  fcvt.w.s     s2, ft5, rdn
                  feq.s        zero, ft3, fs6
                  mulh         ra, s10, s1
                  sra          t3, sp, s9
                  auipc        s3, 390449
                  add          a7, t4, a1
                  div          a0, a1, s4
                  ori          tp, s6, -314
                  fsgnjx.s     ft2, ft0, ft5
                  div          a2, s8, s8
                  fle.s        t5, fa5, ft6
                  ori          ra, t3, 740
                  sll          a2, t2, a2
                  feq.s        t3, fa4, ft3
                  slt          s6, s11, s9
                  fmv.w.x      fa5, t1
                  fadd.s       fs10, fs8, fs5, rup
                  andi         a0, t0, -10
                  remu         s4, t0, a1
                  nop
                  fcvt.w.s     s6, fa6
                  or           tp, t2, s0
                  sra          s4, s9, s8
                  feq.s        s2, fs6, fs2
                  div          s4, s8, a3
                  srli         t4, s6, 21
                  fcvt.wu.s    a5, ft5, rmm
                  fcvt.s.wu    fs5, t2, rdn
                  nop
                  slti         t6, a4, -431
                  fadd.s       fs9, fa4, fa7
                  xori         a1, a6, 1410
                  flt.s        s6, fs7, ft5
                  fdiv.s       fa0, fa0, ft7, rne
                  srai         t6, gp, 22
                  fmul.s       fa3, ft1, fa0, rmm
                  addi         s10, t0, 528
                  srai         gp, a5, 26
                  xor          tp, a6, a1
                  slti         s6, a6, 424
                  mulh         a0, t1, t5
                  fcvt.w.s     ra, fa0, rmm
                  mul          a3, a1, t3
                  slt          s6, a7, tp
                  sra          a2, s9, t3
                  add          sp, s8, s7
                  srl          s1, zero, zero
                  srli         s4, t1, 24
                  fsgnj.s      fa3, fs2, fs1
                  sltiu        t6, t2, -257
                  mulh         a2, t3, s6
                  fclass.s     t1, fs7
                  addi         s8, a5, -1195
                  fcvt.s.wu    ft9, a5
                  fcvt.wu.s    s9, fs7
                  sll          a1, t3, t2
                  sltiu        zero, s9, 784
                  fsgnj.s      fs8, fa7, ft4
                  auipc        zero, 500826
                  fsgnjx.s     fa7, fs5, fa7
                  fcvt.s.w     fs8, s1
                  xor          a3, t3, s1
                  srli         t2, t0, 9
                  fmv.w.x      fs4, a1
                  rem          t5, t5, s8
                  divu         s1, sp, a3
                  fcvt.w.s     t6, fa6
                  fle.s        s1, ft1, fa3
                  xor          s1, tp, a4
                  sll          tp, a5, s1
                  fmv.x.w      s4, ft9
                  sub          s2, a3, s9
                  srli         s9, zero, 28
                  fmax.s       ft9, ft9, fs8
                  fsgnj.s      ft4, fa3, fs10
                  fmax.s       fs4, ft0, ft3
                  fsub.s       ft3, fs10, fa2, rne
                  srl          s9, t2, t1
                  mulhsu       s8, a4, t6
                  fdiv.s       ft5, fa5, ft10, rne
                  fmv.x.w      s6, fa2
                  sltu         s3, s11, sp
                  fsgnj.s      ft8, fs1, ft4
                  fmv.x.w      s3, fa3
                  fclass.s     a2, fs4
                  div          s4, s2, a6
                  mul          ra, a2, a1
                  ori          gp, ra, -1271
                  slt          s0, t4, s5
                  fcvt.s.w     fa7, s9, rdn
                  divu         a1, t2, t2
                  remu         t2, s8, a6
                  and          a3, tp, s6
                  andi         s8, a4, 402
                  mulh         t5, s9, a0
                  mulh         s8, t4, zero
                  fadd.s       ft8, fs2, fs10
                  addi         t1, t6, -1048
                  fdiv.s       fs10, fa1, ft11, rdn
                  fclass.s     a7, ft10
                  sltu         t1, s7, a1
                  fclass.s     a2, ft8
                  sll          t6, zero, t6
                  fcvt.wu.s    s10, fa1, rup
                  flt.s        a7, fs11, ft5
                  ori          t6, s6, 1964
                  fdiv.s       fs5, fa3, fs7, rup
                  xori         s8, s7, 173
                  and          zero, s5, t3
                  nop
                  sra          a1, t6, a0
                  slt          s4, tp, a3
                  xori         a2, t6, 1118
                  ori          s2, ra, -174
                  fcvt.w.s     a2, ft8, rdn
                  sll          a7, t4, a4
                  fsub.s       fa4, fs7, fs7, rmm
                  fsub.s       fs1, fs0, fs11, rtz
                  auipc        a0, 1000973
                  divu         t3, t0, t0
                  fcvt.w.s     s2, ft0, rup
                  flt.s        gp, ft8, ft3
                  sub          s6, s9, t2
                  and          t5, s11, t5
                  fsqrt.s      ft2, ft2, rdn
                  mulhu        t1, gp, t0
                  andi         s2, t5, 1754
                  or           s8, s3, t2
                  fsgnj.s      fs11, fs4, fa2
                  slt          t5, s5, zero
                  fmul.s       fs0, fs4, fa6
                  fadd.s       ft6, fs11, fs5
                  mulhu        s0, s8, t5
                  sltiu        a0, gp, -991
                  fadd.s       fa3, ft4, fs5
                  andi         a0, t3, 1442
                  sltiu        s8, s7, 121
                  fmv.w.x      ft8, s4
                  andi         s9, s3, 1021
                  fcvt.wu.s    s2, ft9, rne
                  fdiv.s       ft2, fa0, ft5
                  mulhsu       a2, a0, s0
                  fmin.s       fa3, fs3, fs2
                  andi         s0, a7, 1655
                  srl          sp, s6, s7
                  srai         t4, a7, 30
                  mulh         t2, a0, s10
                  sltu         a2, tp, t4
                  andi         ra, a7, -337
                  mulhu        t1, t5, s8
                  fsub.s       fa2, fs3, fa7
                  sll          s5, s11, ra
                  fsqrt.s      ft1, fs2
                  xori         s7, a6, -417
                  feq.s        s2, fs11, fa3
                  mul          s3, s7, s6
                  sltu         s8, s1, s10
                  srai         zero, t4, 7
                  andi         t3, gp, 38
                  ori          a0, s3, -572
                  fsqrt.s      fs5, ft1
                  add          s9, a4, a5
                  fsub.s       ft3, fs9, ft6, rdn
                  fsgnjx.s     fs9, ft3, fs9
                  fcvt.w.s     a6, fa2
                  fdiv.s       ft8, ft10, fs2, rtz
                  sra          t5, s4, s4
                  add          ra, a6, gp
                  mulhsu       s10, t4, t3
                  srli         s2, a3, 6
                  mulhu        a7, s10, t1
                  sltu         t1, a7, a4
                  fadd.s       ft1, fs10, fs9, rup
                  fsgnjn.s     fs8, fa3, fa1
                  fmul.s       ft2, fs2, fs10, rne
                  flt.s        s3, fs8, ft4
                  rem          s9, a0, t5
                  or           t6, t3, s3
                  fsub.s       fa6, ft1, ft3, rup
                  slli         t3, s6, 31
                  add          s0, t2, s7
                  mul          t1, t3, t0
                  xor          a6, a4, t2
                  addi         tp, gp, -1287
                  xori         t2, s2, 929
                  add          a1, s0, t0
                  srl          s8, sp, s6
                  fmv.x.w      s2, fs6
                  or           s9, s6, s7
                  sub          s4, a4, zero
                  ori          a1, a6, -104
                  srli         a0, s3, 0
                  add          a5, t1, t0
                  fmul.s       ft5, fa6, fa6, rdn
                  srai         s4, ra, 31
                  add          zero, s8, t3
                  mulhsu       t6, sp, t3
                  slti         s10, s8, -1368
                  mulh         t4, s1, t1
                  sll          tp, s7, t3
                  fle.s        tp, ft4, fs2
                  srai         a0, a7, 21
                  fcvt.wu.s    gp, fa7
                  add          t1, s11, gp
                  mulhsu       a6, s3, a6
                  srl          t4, s8, a2
                  mulhu        tp, ra, s0
                  fdiv.s       fs4, fa5, ft10
                  remu         gp, t6, a0
                  sra          s1, a6, a6
                  mul          s7, t2, s5
                  div          t2, a2, s4
                  fmax.s       fa3, fs3, fs8
                  add          a1, a5, s1
                  feq.s        a3, fa0, fa7
                  fmul.s       ft6, ft3, fs10, rne
                  srai         a0, s10, 12
                  slt          s3, a3, a1
                  slli         s8, s4, 24
                  sltu         zero, t2, a5
                  sll          s7, a0, ra
                  mulhsu       s9, s6, a4
                  mulh         t5, t6, t1
                  fmv.x.w      zero, fs5
                  fclass.s     s7, fs3
                  slti         s2, a5, -1513
                  fmax.s       ft7, fs3, fa3
                  mulhsu       a3, s2, t3
                  div          s7, s7, a5
                  fmv.w.x      fs0, s5
                  fclass.s     s4, ft6
                  fmul.s       fs8, fs3, ft1
                  fcvt.wu.s    t1, ft6, rdn
                  mulhu        s1, a3, s5
                  fcvt.s.w     fs6, s0, rup
                  xori         a2, s6, 1934
                  sltiu        t2, s9, 1174
                  fmin.s       fs3, fs1, ft5
                  fsgnj.s      fa0, fa3, ft2
                  sltu         s1, sp, s3
                  slti         s1, t2, -249
                  sltu         tp, s8, a4
                  and          a0, s0, a1
                  sltu         s3, t4, a6
                  srli         s7, a3, 7
                  ori          ra, s3, -1807
                  sll          s10, s10, t2
                  feq.s        s4, fa6, fa0
                  srai         s0, s4, 31
                  feq.s        a7, ft2, fa0
                  and          a2, t2, s1
                  srli         t1, s1, 28
                  sltiu        a2, t5, 610
                  auipc        zero, 123506
                  fsgnjx.s     fa3, fa1, fs3
                  fdiv.s       fa7, fs3, fs6
                  addi         s6, a1, 661
                  fsub.s       fa2, fa2, fs10, rmm
                  fcvt.wu.s    gp, fs2
                  xor          a1, a7, s10
                  xori         a7, ra, 1615
                  srai         s8, s8, 19
                  srl          t6, s10, a1
                  srli         gp, a3, 22
                  sra          s3, s8, t4
                  add          t4, s7, a2
                  srli         s5, t4, 1
                  fcvt.w.s     s10, fs6
                  fsgnjn.s     fs11, fa3, fs1
                  addi         s1, s9, -462
                  sltu         s0, t2, s11
                  sltu         tp, a2, s0
                  fcvt.wu.s    ra, ft10, rup
                  mulhu        t2, a3, s9
                  fmax.s       fs9, ft7, fa0
                  fadd.s       fs0, ft8, fa2
                  fmin.s       fa3, fa4, fs6
                  fadd.s       fs9, ft7, fa1, rtz
                  fadd.s       fs6, ft9, fa4, rtz
                  feq.s        s6, fa5, ft7
                  andi         s8, zero, 1570
                  and          s0, a5, a5
                  sub          s4, t6, sp
                  srli         t5, ra, 3
                  fsqrt.s      fs1, ft1, rmm
                  divu         a5, s11, a1
                  fadd.s       fa1, fa1, fs0
                  rem          t3, s8, t1
                  fsgnjn.s     fa5, fs5, fs2
                  mulhu        gp, s2, s3
                  fcvt.w.s     s10, fs9, rtz
                  slli         ra, s6, 6
                  fsgnjn.s     fa3, fs11, ft6
                  fcvt.s.w     ft8, s7
                  fmax.s       fs3, fa5, ft4
                  feq.s        tp, ft7, fs8
                  sll          a3, t3, s1
                  srli         a3, s0, 14
                  mulhsu       s8, s5, sp
                  fsgnjx.s     ft4, fa4, fs5
                  fdiv.s       ft5, ft7, fa0, rdn
                  sll          t4, t0, s8
                  mulh         s4, t3, s11
                  ori          zero, a5, 1892
                  fsgnjn.s     fs5, ft8, fa6
                  fle.s        a2, fs8, ft4
                  fsgnjx.s     fa3, ft7, fs3
                  fcvt.wu.s    s4, ft10, rne
                  fle.s        s9, fa0, fa7
                  slli         s4, s2, 25
                  mulhu        a0, a0, a0
                  div          sp, a3, a1
                  addi         s6, s1, 1811
                  fcvt.wu.s    s4, fs6, rmm
                  slt          ra, sp, s3
                  fcvt.s.w     ft2, s0, rmm
                  fle.s        s1, fs8, ft8
                  srai         t2, s8, 19
                  fcvt.wu.s    s4, ft9, rne
                  fle.s        t1, ft11, ft11
                  fmv.x.w      s4, fs3
                  fsgnjx.s     fa2, ft6, ft11
                  fsqrt.s      fa7, fa6
                  fadd.s       fs11, ft11, fs10
                  fsqrt.s      ft9, fs11, rmm
                  flt.s        t6, ft11, ft0
                  auipc        t6, 331007
                  lui          s10, 534224
                  fcvt.w.s     a7, ft7, rdn
                  fcvt.w.s     a3, fa1
                  and          a6, t4, s1
                  fmul.s       fs1, fa3, ft1, rmm
                  flt.s        a2, fs7, fs9
                  sll          a6, t3, s4
                  slt          s6, s9, a3
                  sll          s1, t4, s6
                  fsqrt.s      ft1, fs2, rtz
                  fsgnj.s      fs8, fs5, fs0
                  fsqrt.s      fa1, ft9, rup
                  sub          s6, t3, s6
                  and          t4, zero, s3
                  fsgnj.s      ft10, fa4, fa0
                  slt          s6, t3, s3
                  fle.s        s10, fs7, fs3
                  feq.s        a3, fs7, fs6
                  sltu         s0, s2, a7
                  flt.s        s4, ft1, ft1
                  fmax.s       ft4, ft2, ft0
                  slli         s1, a1, 7
                  fsgnjx.s     ft4, fs4, fs6
                  add          a5, s1, s2
                  divu         tp, a4, a4
                  addi         s6, s9, -988
                  fmin.s       fs9, fa0, ft1
                  fcvt.wu.s    t5, ft6, rup
                  fcvt.w.s     ra, ft1
                  remu         s7, t3, s11
                  sltu         s8, s0, sp
                  fmul.s       fs1, fa1, fa7
                  mul          t2, t1, a5
                  sub          a2, a5, a2
                  srl          tp, s11, s4
                  srai         tp, a0, 30
                  srli         t3, ra, 18
                  fcvt.w.s     t6, ft9
                  andi         ra, s5, 1035
                  sll          ra, t4, tp
                  fdiv.s       fs0, fs0, fs8
                  slti         s9, a0, -1856
                  xor          a0, a4, a2
                  slti         a0, a4, 1548
                  feq.s        t5, ft5, fs2
                  fadd.s       ft2, fa4, fs8, rtz
                  slti         s5, a7, -1888
                  xor          sp, t1, zero
                  fsgnj.s      fs10, fa7, fs10
                  nop
                  lui          s3, 714755
                  sltu         zero, t0, s0
                  fsgnjx.s     fs11, fs4, fs7
                  fdiv.s       fa3, fa2, fa0
                  andi         s8, a2, -5
                  feq.s        t1, fa0, ft5
                  mulh         t2, s2, t5
                  fcvt.wu.s    s6, fa5
                  srai         s0, t2, 1
                  fcvt.s.wu    ft1, a1
                  fsqrt.s      ft4, fa3, rne
                  flt.s        s4, fs0, fa1
                  xor          s5, a4, gp
                  fsgnj.s      fs9, ft5, ft1
                  fcvt.wu.s    s1, ft9, rtz
                  mulh         s5, a0, s6
                  lui          s4, 45935
                  mulh         zero, s9, t5
                  lui          a6, 853614
                  slli         s1, a5, 28
                  fcvt.wu.s    t4, fa3, rtz
                  fmax.s       ft7, fa5, ft10
                  fadd.s       ft0, fa4, fs9, rup
                  fmax.s       fs9, fs9, fs10
                  add          a7, t5, s1
                  slt          s2, a1, s9
                  fmv.w.x      fa2, s2
                  sra          a1, s9, s3
                  add          s8, s8, t6
                  nop
                  mulhsu       s6, a2, t3
                  fcvt.wu.s    a5, fa7
                  flt.s        s7, ft7, fs6
                  fadd.s       fs10, fs5, fa1, rdn
                  lui          s7, 979914
                  sll          zero, s5, t4
                  feq.s        tp, fs11, ft5
                  auipc        a0, 540324
                  div          s8, s0, s9
                  div          a6, a4, s7
                  fmv.w.x      ft10, t3
                  slli         s10, s3, 3
                  fcvt.s.wu    fs11, s11
                  fsqrt.s      fs8, fs5, rtz
                  slt          s5, s6, t2
                  auipc        s1, 108016
                  mulhu        a6, t0, sp
                  sltiu        a3, a0, -1482
                  fcvt.w.s     a0, ft1, rdn
                  fclass.s     a5, ft3
                  srl          t5, tp, s7
                  divu         s0, s11, s9
                  fle.s        gp, ft9, fs4
                  remu         a2, s6, ra
                  srl          tp, t3, gp
                  fclass.s     a0, fs10
                  addi         t3, a5, -808
                  fmul.s       fs2, fs4, fa3
                  srl          s1, t3, zero
                  and          t2, zero, s9
                  lui          s5, 210226
                  addi         s10, s4, 76
                  slli         a5, t1, 24
                  fsgnjx.s     fs4, ft3, ft8
                  fmv.x.w      t4, fs11
                  feq.s        a3, fs6, fa5
                  fsgnj.s      fa2, fs10, fs6
                  fcvt.s.w     fs10, s9
                  xor          s5, zero, sp
                  fclass.s     s2, ft7
                  fcvt.w.s     zero, fs3, rne
                  fsgnjx.s     ft11, ft2, ft5
                  sltu         s7, t6, t6
                  sra          t6, s2, a6
                  xori         s5, s1, -393
                  sub          a6, s9, zero
                  fmin.s       fs1, fa4, ft0
                  fcvt.w.s     a3, ft9, rup
                  srli         s4, t6, 12
                  srl          t6, sp, t3
                  sltu         gp, tp, t4
                  sra          a0, zero, s1
                  fcvt.wu.s    zero, fs0
                  fmax.s       fs0, ft7, fa4
                  mul          s8, a2, gp
                  ori          s0, zero, 561
                  fmul.s       fa6, fs1, ft5
                  srli         s5, s11, 26
                  feq.s        a6, fs7, fa3
                  sll          s10, zero, zero
                  divu         sp, t2, sp
                  auipc        a2, 465653
                  fcvt.s.w     fa0, s4
                  fdiv.s       ft7, fs4, fa6, rne
                  nop
                  sll          t6, t2, s1
                  sra          a6, t4, a2
                  sub          a3, s0, s10
                  srai         t3, a5, 4
                  and          a6, s2, a5
                  slt          s3, s10, a5
                  sll          s7, s6, t3
                  rem          t5, s2, a5
                  fadd.s       fa7, ft2, fa7, rdn
                  fsub.s       ft1, ft1, fa4, rmm
                  slt          a1, t5, zero
                  fdiv.s       fs3, ft7, ft9, rne
                  mulh         s1, t4, s5
                  addi         t6, s4, -1938
                  srl          t2, sp, s10
                  fmv.w.x      ft7, s8
                  and          s6, a2, s11
                  fmul.s       ft0, fs0, fs5
                  sll          a7, s3, a3
                  mulh         t1, t4, s6
                  fsqrt.s      fa7, fs3, rmm
                  mulhu        t5, a4, t3
                  srli         a0, a7, 5
                  mulhsu       s1, s7, t2
                  andi         s1, a2, 847
                  addi         s7, t6, 920
                  mul          sp, s1, s3
                  lui          s3, 468353
                  srli         ra, tp, 24
                  xor          s8, a0, t3
                  sra          t2, tp, sp
                  lui          s5, 267696
                  fmul.s       fs8, fa0, ft1, rdn
                  fmax.s       fs8, ft11, ft3
                  sll          s0, s8, t5
                  lui          sp, 1029353
                  divu         a7, tp, a3
                  fclass.s     t5, fs11
                  fmax.s       fs0, fs7, ft1
                  feq.s        ra, fs8, fs5
                  fsgnj.s      fs3, ft1, fs4
                  fdiv.s       fs8, ft10, fa6, rtz
                  fmv.x.w      s6, ft2
                  slli         t1, t6, 17
                  nop
                  fcvt.s.wu    fa4, a5
                  or           a1, s6, gp
                  add          s2, tp, s9
                  fcvt.w.s     t6, fa0
                  and          s5, s4, t3
                  fcvt.s.wu    ft0, zero, rne
                  lui          s1, 38640
                  andi         s2, t3, -823
                  sra          s3, a6, s7
                  addi         sp, s10, 1632
                  sra          a7, a6, t6
                  fsgnjn.s     fs4, fs9, ft9
                  mulh         a5, s7, s4
                  srli         s2, s4, 4
                  lui          a5, 891660
                  andi         t1, s2, -1152
                  mulh         a2, gp, t4
                  slt          s4, t6, tp
                  fcvt.wu.s    a6, fa4
                  srl          s3, t0, a5
                  srl          gp, a1, s3
                  sra          t6, gp, a2
                  nop
                  fmin.s       fs2, ft6, ft6
                  fsub.s       ft6, ft7, fs10
                  and          s3, s5, t2
                  xori         s5, a3, 1304
                  sub          a2, t1, tp
                  or           t4, t2, t0
                  andi         t1, s5, 1196
                  sra          a7, zero, a0
                  slli         s7, a6, 26
                  xor          a5, a4, a2
                  fmul.s       fa5, fa1, fs0, rdn
                  srli         s2, s5, 7
                  srli         s8, t4, 7
                  add          a1, t3, t0
                  fmv.x.w      a5, fs9
                  and          s8, s2, a1
                  slt          a7, a4, ra
                  addi         t1, s9, -1401
                  sub          sp, t5, s3
                  or           s0, s9, t1
                  sub          a0, s11, a0
                  fcvt.w.s     a2, fs3, rup
                  flt.s        a1, fs6, fs7
                  fmul.s       ft6, fs9, fa7, rne
                  fcvt.s.w     fs6, zero, rup
                  slti         a2, s3, 1538
                  fmv.x.w      t5, fs8
                  slt          zero, s9, s2
                  andi         a7, s3, 1339
                  fcvt.wu.s    s1, fs6, rne
                  mulhu        s9, s5, tp
                  fdiv.s       fs6, ft10, ft4
                  sub          s9, a1, t1
                  fcvt.w.s     t3, ft1, rdn
                  add          t1, s0, t5
                  mulh         a7, tp, a1
                  xor          a2, s11, tp
                  fmv.x.w      s5, fa1
                  fcvt.s.wu    fa0, s0, rdn
                  fcvt.w.s     ra, ft3
                  fadd.s       ft10, fs1, ft2
                  rem          s2, a3, sp
                  fmax.s       ft3, fs3, ft4
                  fmv.x.w      t3, fa6
                  div          zero, t6, t0
                  fmul.s       ft1, ft3, fa3
                  or           a0, s4, s1
                  slti         a7, t2, -633
                  remu         t5, s6, s7
                  fmul.s       ft9, ft6, fa2
                  sra          gp, s2, a2
                  fdiv.s       fs11, fa6, ft0
                  srai         t3, tp, 30
                  srli         a3, t2, 20
                  rem          s4, s0, s5
                  fmv.w.x      fs0, s2
                  mulh         t3, s9, gp
                  sltiu        t3, s8, 1363
                  feq.s        s1, fa7, ft8
                  or           a3, gp, gp
                  xori         ra, a7, 169
                  fmax.s       ft4, fs5, ft3
                  rem          t3, t3, t0
                  srl          a5, s11, a1
                  slt          a1, t2, gp
                  fsgnjx.s     fa1, ft1, fa4
                  srai         gp, a3, 24
                  fcvt.s.wu    fs1, t3, rtz
                  fmax.s       fa3, fs3, fs4
                  xori         t4, gp, -1233
                  mulh         tp, a5, t5
                  fcvt.s.w     fs10, s0, rmm
                  addi         a3, s4, 1374
                  rem          s8, s4, sp
                  slli         a0, a7, 8
                  div          a2, t3, a3
                  and          a6, zero, s3
                  srli         s4, s11, 31
                  mulh         s4, s4, a2
                  sra          zero, t5, a5
                  addi         t4, t6, -1970
                  fsgnjn.s     fa0, fs3, ft8
                  fmv.w.x      ft7, s1
                  fdiv.s       fs4, ft7, fs11, rmm
                  fadd.s       ft2, fa0, ft6, rtz
                  fsub.s       fa0, fa5, fa7
                  srai         a6, t1, 17
                  sll          s10, s2, s0
                  fsgnj.s      fs5, ft5, fs0
                  mulhu        gp, a7, s0
                  add          gp, s8, gp
                  andi         s10, t4, -247
                  fsgnj.s      fs5, fa2, fs5
                  srli         a6, t2, 8
                  sltu         s2, a2, a3
                  mulhu        a0, a7, s9
                  fsgnj.s      ft0, ft10, fs2
                  auipc        a0, 623899
                  fle.s        s7, fs10, ft9
                  and          s3, s4, s9
                  or           a0, a4, gp
                  fcvt.w.s     ra, fs3
                  mulhsu       tp, a3, t6
                  sltu         s5, s2, a3
                  sub          a6, s10, a1
                  addi         t5, s11, 1322
                  fsgnjn.s     ft11, ft4, ft7
                  fcvt.s.w     fa6, a5
                  slti         s1, a7, -1935
                  and          gp, s2, tp
                  mulh         zero, s5, a4
                  fcvt.w.s     s7, fs7
                  and          a6, a3, s11
                  xori         t3, s6, 1563
                  srl          t5, s0, s3
                  fmin.s       ft1, fs8, fa6
                  or           s4, s1, s8
                  feq.s        a2, ft4, fs2
                  andi         t3, s1, -439
                  nop
                  fmax.s       fs4, fs3, fa0
                  fsgnj.s      ft7, ft7, fa6
                  remu         s6, s3, t6
                  slti         sp, t6, 965
                  feq.s        t5, fs5, fs0
                  rem          a2, a2, a2
                  divu         a3, t6, tp
                  fadd.s       fa7, fa4, ft1, rtz
                  remu         t6, s11, a1
                  fmax.s       fs1, ft5, fa3
                  flt.s        a1, ft0, ft8
                  xor          a7, s0, zero
                  add          s3, tp, s9
                  sra          tp, s9, a1
                  div          s7, t2, t6
                  div          s5, s5, a1
                  remu         s1, ra, s10
                  fsqrt.s      fs10, fa6, rup
                  fmv.x.w      a1, fa5
                  srli         zero, s3, 31
                  fdiv.s       ft9, fs7, fs4
                  fsqrt.s      fa5, ft8, rup
                  ori          t6, a2, -1429
                  flt.s        s10, fs9, fs9
                  nop
                  feq.s        t5, fs11, ft6
                  add          s1, tp, a4
                  fadd.s       ft4, ft7, fs2, rup
                  fsqrt.s      ft8, fs9
                  fcvt.wu.s    s0, fa0, rmm
                  fcvt.s.wu    fa6, a0, rup
                  fmin.s       ft4, fs6, ft10
                  fsgnjn.s     fs5, ft2, ft6
                  fmv.x.w      zero, fs6
                  fcvt.s.w     fa1, s9
                  sltu         s3, s11, t0
                  fdiv.s       fa1, ft6, ft11
                  fsgnjn.s     ft2, ft2, fa6
                  xori         t5, a5, 346
                  mulh         s5, s1, t1
                  fcvt.s.w     ft6, zero
                  and          s8, a1, t2
                  srl          t5, gp, s3
                  remu         a3, t0, t4
                  fdiv.s       fs11, fa5, ft3, rdn
                  feq.s        a0, ft10, fa7
                  remu         a3, s6, a7
                  fclass.s     s9, fa1
                  fcvt.wu.s    t2, ft6
                  ori          s4, a1, 1194
                  fmul.s       fs4, fs3, fa3
                  fcvt.s.w     fa1, s9, rmm
                  andi         a5, s0, 864
                  nop
                  srli         a7, t2, 18
                  fsub.s       fs8, fa5, ft8
                  srai         s7, t6, 2
                  mulhu        s3, zero, a6
                  auipc        s10, 385869
                  fdiv.s       fs8, fa6, ft2, rup
                  fcvt.s.wu    fa6, a1, rup
                  add          sp, t4, ra
                  or           gp, t1, s7
                  sltu         a3, a1, a5
                  ori          gp, s4, 978
                  flt.s        a6, ft7, fs0
                  srai         t3, a1, 28
                  or           s10, a2, a2
                  nop
                  fcvt.s.wu    ft7, s11
                  fclass.s     t5, fa5
                  fcvt.s.w     ft9, a1
                  rem          t6, t4, t5
                  fcvt.w.s     s2, ft4
                  slti         t4, ra, -864
                  flt.s        a5, fa3, fa3
                  sll          s9, s4, s6
                  slti         s2, s10, -2003
                  xor          a1, s8, s8
                  fmv.w.x      fa3, ra
                  auipc        s6, 1047447
                  fmax.s       fa6, ft0, ft0
                  xori         s1, a6, 543
                  fcvt.wu.s    a1, ft4, rtz
                  fsgnjx.s     fs4, fs10, fa2
                  div          s0, s6, s6
                  fcvt.s.wu    fa7, s4
                  lui          t2, 381192
                  ori          t6, s10, 471
                  auipc        a3, 745124
                  addi         t4, a7, 1990
                  fadd.s       fs0, fa5, fs7, rup
                  div          t4, t0, a1
                  mulhsu       s10, a0, t1
                  sub          s5, s6, t3
                  slti         t4, s5, -1863
                  fsub.s       ft2, fs5, ft5, rmm
                  fmin.s       fs7, ft1, fs10
                  fdiv.s       ft2, fs0, fs3
                  fsgnjx.s     ft10, ft2, fa7
                  fdiv.s       fa5, ft2, ft5
                  addi         s1, s11, 627
                  fcvt.w.s     s5, ft0, rne
                  fcvt.wu.s    ra, ft0, rup
                  sra          t2, t0, s9
                  slti         t1, a6, -1729
                  fmul.s       fs11, fa3, ft1
                  srli         s8, t2, 31
                  fclass.s     a1, ft8
                  srai         s5, s2, 1
                  nop
                  div          s6, tp, s5
                  lui          zero, 811052
                  sltiu        s4, tp, -1953
                  lui          tp, 992248
                  rem          t2, s5, s2
                  flt.s        s5, ft11, ft11
                  srl          a2, zero, s9
                  srli         s1, a6, 2
                  fsub.s       fa1, fs7, ft6, rdn
                  xori         s2, s4, 600
                  mulhsu       s10, a5, t4
                  fcvt.s.wu    ft10, t4, rdn
                  ori          a1, s0, 234
                  fcvt.w.s     a7, ft1
                  srli         s9, a4, 13
                  flt.s        s5, fs11, fa3
                  add          sp, s11, tp
                  andi         a3, a4, 223
                  sltiu        s0, s11, 92
                  xor          t5, s1, ra
                  srli         s4, s9, 9
                  srl          sp, a2, gp
                  or           a6, t5, t0
                  div          a3, ra, a7
                  sub          s3, gp, t0
                  srai         a0, a1, 21
                  lui          t2, 196574
                  flt.s        a0, fs1, ft8
                  srl          sp, a5, s10
                  feq.s        s2, fa6, ft5
                  fclass.s     s6, ft4
                  fcvt.s.w     fa0, t5
                  divu         a0, s5, t2
                  lui          a3, 639362
                  fadd.s       fs3, fs7, fs10, rup
                  sltiu        a2, a2, -434
                  lui          t2, 655249
                  fadd.s       fs6, ft8, fa7, rne
                  and          tp, s10, a5
                  fcvt.s.wu    fs7, s0
                  fsqrt.s      ft2, fa1, rne
                  fmv.x.w      s7, ft1
                  fcvt.s.wu    fs4, t4, rup
                  sltiu        a7, s8, 1323
                  auipc        s8, 250481
                  srli         s6, a2, 12
                  divu         s7, t4, s10
                  xori         s3, s0, 823
                  fsgnjx.s     fa6, fa6, fa7
                  srai         t4, s11, 11
                  or           gp, ra, s1
                  ori          t3, t1, -1665
                  slli         sp, a3, 3
                  fmv.x.w      s7, fa0
                  add          a7, t1, a3
                  remu         t2, s4, ra
                  fcvt.w.s     t2, fs1, rdn
                  sltu         tp, a5, a4
                  slti         tp, s10, 1061
                  sll          a3, a0, t1
                  slti         s10, s3, 1025
                  fcvt.w.s     a3, fs1, rtz
                  fadd.s       fa2, fs11, ft1, rmm
                  divu         s2, t1, t4
                  auipc        ra, 822110
                  fcvt.w.s     s9, ft4
                  sltu         s8, t3, s8
                  sra          s9, gp, s2
                  fmul.s       fs5, fs7, fs0
                  fdiv.s       ft0, fs10, ft5, rmm
                  srli         t5, s7, 3
                  mulh         sp, t5, s1
                  fcvt.wu.s    t6, ft4, rup
                  sltiu        s7, s7, 1277
                  or           zero, s9, a4
                  rem          a3, s2, t6
                  fmul.s       fs7, ft10, fa4, rdn
                  fmv.x.w      t5, ft8
                  slt          s5, s6, t3
                  divu         gp, t1, s8
                  srl          s10, s1, t6
                  sra          zero, s1, zero
                  div          s6, s0, s1
                  fmv.w.x      ft6, zero
                  fcvt.w.s     a5, ft1, rmm
                  slt          tp, t5, s4
                  srl          s4, t2, t1
                  fle.s        t6, fs1, fs0
                  mulh         t3, ra, s5
                  andi         s8, a3, -576
                  xor          s4, s1, a6
                  fcvt.s.w     fa4, zero, rmm
                  and          s5, a6, s5
                  rem          t1, tp, s11
                  or           s6, s11, s8
                  auipc        t5, 258659
                  feq.s        s2, fa0, ft5
                  fsgnjx.s     fs4, fs0, fa2
                  add          a0, zero, s10
                  remu         s9, s6, t4
                  mulh         s3, a5, t6
                  remu         t2, s2, s1
                  nop
                  fsgnjn.s     fa2, fs8, fa7
                  ori          s8, t4, -374
                  feq.s        s3, fs5, fs8
                  fcvt.w.s     sp, fs11
                  fcvt.s.wu    fa2, s0
                  mulhu        s9, t6, s2
                  fsub.s       ft7, fs9, ft1
                  sll          gp, a4, sp
                  fcvt.s.w     fa5, a7, rtz
                  and          s7, s5, s10
                  fdiv.s       ft11, ft1, ft9
                  sub          t4, a7, a7
                  srli         s3, a0, 21
                  nop
                  slli         tp, s8, 24
                  sltiu        a7, s8, 55
                  fsgnjn.s     fa5, ft7, fs7
                  ori          t4, t3, 1830
                  remu         t3, s2, s3
                  mulhsu       s1, t0, a1
                  fsub.s       fs9, ft8, fs9
                  remu         tp, s6, s4
                  mulh         t3, t2, a3
                  fmin.s       fs8, fs5, fs8
                  fclass.s     a3, ft4
                  or           t2, s11, s0
                  nop
                  xori         s3, t0, 24
                  fmax.s       fs7, fa7, fa1
                  xori         tp, s0, 372
                  mul          s9, t1, a3
                  feq.s        t3, ft6, fa5
                  xor          s4, s3, sp
                  lui          tp, 1019808
                  or           s5, t1, t1
                  fmin.s       fa2, ft2, ft4
                  fmv.w.x      ft7, s8
                  srai         s5, tp, 23
                  slt          ra, t3, t2
                  add          tp, a1, s4
                  sll          gp, s3, s1
                  flt.s        s6, fa3, fa7
                  sub          s9, sp, a4
                  slt          a3, a1, t6
                  fmv.x.w      t1, ft6
                  sll          t3, s11, t4
                  fcvt.s.w     fa7, s2
                  srai         t1, s5, 2
                  div          s10, s1, t3
                  rem          t2, s11, s2
                  slli         t1, s3, 10
                  fcvt.w.s     a3, ft3, rtz
                  lui          ra, 574104
                  flt.s        s5, fs2, ft6
                  fmv.x.w      a6, fs11
                  sltu         gp, t4, t6
                  or           s4, s2, s3
                  slt          s8, tp, tp
                  fsqrt.s      ft11, ft7
                  and          s10, s4, s3
                  divu         t3, s9, gp
                  fmv.x.w      a2, fs10
                  auipc        t3, 711122
                  sra          s2, s1, s9
                  sra          a6, s10, s7
                  srai         a5, s2, 26
                  fadd.s       fa7, fa1, fa5, rup
                  fcvt.s.wu    ft3, s7, rtz
                  remu         s10, sp, a2
                  xor          s6, a3, s5
                  lui          a1, 1041303
                  fmin.s       ft7, fs10, ft8
                  divu         t6, a1, s7
                  sra          a5, s10, t4
                  fcvt.s.w     fa3, s0
                  div          s0, s1, sp
                  xori         s7, t0, 1425
                  div          gp, a5, t2
                  fle.s        gp, fs8, fs1
                  feq.s        t4, fa6, ft4
                  fmin.s       fs8, fs9, fs2
                  fcvt.s.wu    fs10, s10, rmm
                  fsgnjx.s     ft0, fa1, ft10
                  and          s2, a6, s0
                  sll          a2, s2, s5
                  mulh         s5, s3, s6
                  feq.s        s4, fs7, fs5
                  slt          a1, s1, t3
                  lui          s10, 960276
                  fmul.s       ft9, fa3, fa7, rup
                  fcvt.s.wu    fs0, s4, rmm
                  auipc        s10, 291640
                  flt.s        gp, fs7, ft4
                  add          a0, a3, s0
                  fsgnjx.s     fs11, fa2, fa2
                  auipc        a7, 337433
                  fsgnjn.s     ft7, fs5, fs5
                  divu         zero, ra, sp
                  fle.s        a0, ft7, fa3
                  sll          a2, tp, a3
                  fcvt.wu.s    zero, fs7, rmm
                  or           s2, a5, a7
                  nop
                  mulh         zero, t3, a4
                  fsgnjn.s     fa2, fs8, fs5
                  feq.s        a7, fs5, fa4
                  fsgnjn.s     fs4, fs9, ft8
                  div          a1, a0, s4
                  fdiv.s       ft6, ft4, fa3, rup
                  and          t5, tp, a0
                  mulhsu       t1, s11, a2
                  andi         t6, s4, 1890
                  fsgnjx.s     ft9, ft9, ft11
                  srai         t5, gp, 24
                  addi         s0, ra, -1006
                  fmv.x.w      t2, ft1
                  flt.s        s1, fa6, fs1
                  sll          t3, s8, s3
                  fcvt.wu.s    a6, ft10
                  or           s0, t1, s0
                  fcvt.s.wu    ft11, a6, rup
                  or           s2, a2, t3
                  slti         t1, s6, 1292
                  fle.s        a6, ft5, fs7
                  fcvt.w.s     t3, fa3
                  fmv.x.w      t1, ft4
                  div          s6, t1, s5
                  nop
                  fmv.w.x      fs9, tp
                  fle.s        s7, fa6, ft4
                  sra          a5, a4, a0
                  feq.s        s2, ft2, fs4
                  fcvt.w.s     s2, fs4, rdn
                  fle.s        a5, fs3, fa3
                  srli         t6, t4, 7
                  flt.s        t2, ft6, ft7
                  mulh         a0, s10, t5
                  fmax.s       fa3, fs4, fs0
                  sll          s10, s2, t5
                  divu         t3, a7, a2
                  sra          s2, s1, t1
                  ori          s0, s10, -1927
                  mulhu        t4, s10, s2
                  ori          s6, a4, 1338
                  xor          s2, t2, s3
                  fmax.s       ft4, fs7, fa7
                  sra          t3, t6, ra
                  nop
                  addi         a1, s1, -1559
                  slli         ra, s5, 10
                  fclass.s     s6, ft6
                  xor          s0, t1, t3
                  sltu         s9, a7, s4
                  xori         a3, t6, -1378
                  mulhsu       t1, t4, t0
                  xor          a1, t5, a0
                  addi         t3, s0, 1765
                  and          t4, a0, a6
                  flt.s        s6, fs7, fa0
                  mulhu        s5, s10, tp
                  sub          t2, t1, gp
                  xori         a3, s9, -451
                  fsgnj.s      fa5, ft1, fs3
                  fsgnj.s      fs8, fs3, ft10
                  rem          s9, s3, t5
                  fcvt.s.wu    fa2, t3, rmm
                  sll          s2, ra, sp
                  fmax.s       ft1, fa1, fa3
                  and          t4, s5, s9
                  rem          a2, t4, t2
                  fcvt.s.w     fs1, t1
                  add          t3, a3, t6
                  sltu         t2, s1, s0
                  xori         s6, s10, 1686
                  sltiu        s6, s2, -1316
                  fmax.s       fs4, ft0, ft8
                  fcvt.w.s     sp, ft1
                  ori          s4, t6, 596
                  lui          s8, 230247
                  xori         t3, t2, -1465
                  fcvt.s.wu    ft9, s7, rmm
                  fcvt.w.s     a7, fa2
                  fmv.x.w      t2, ft3
                  slti         ra, s8, -669
                  rem          a5, t4, a2
                  fadd.s       ft0, fs11, ft3
                  sll          a2, s11, a6
                  div          s7, s8, s7
                  xori         a0, s8, 154
                  nop
                  flt.s        s6, ft4, fa2
                  fsgnj.s      ft11, fs5, ft2
                  fmax.s       fa1, fs0, fa7
                  auipc        s8, 444647
                  sltu         s7, s9, s0
                  srl          s9, s8, t2
                  fmin.s       fs3, fs7, ft4
                  fmul.s       fa0, fa3, fs9
                  fsgnjn.s     ft10, fa7, fs4
                  sra          s4, t5, s11
                  fcvt.wu.s    gp, ft10
                  fcvt.w.s     s6, ft9, rdn
                  fdiv.s       fs8, fs10, fs1, rdn
                  and          t4, s2, s11
                  srl          a3, a6, s0
                  fmax.s       fa4, fa0, ft9
                  slt          s6, a2, t4
                  or           s3, s9, s10
                  div          zero, a1, s6
                  div          s7, tp, s3
                  slt          s7, t3, s6
                  or           s0, s0, t5
                  fmv.w.x      fa6, s6
                  fmax.s       fa4, ft7, fs1
                  fdiv.s       fs2, fs4, fs3
                  fmin.s       ft4, fa3, fs0
                  fsqrt.s      fa1, ft5, rmm
                  flt.s        a7, ft11, fs3
                  rem          t1, s3, a7
                  fcvt.s.w     fa5, s0
                  slti         s2, s9, -1792
                  fmv.x.w      t2, fa6
                  fcvt.w.s     s1, ft1, rdn
                  flt.s        s6, ft1, ft2
                  fsqrt.s      fa1, fa0
                  slli         t6, t3, 9
                  fdiv.s       fa4, fa3, fa1
                  andi         s6, a1, -923
                  mulh         t2, t4, t3
                  xori         t5, t0, -1625
                  add          a5, s4, zero
                  sltiu        t1, t0, 943
                  rem          s1, s0, a1
                  fmax.s       ft10, fa3, ft6
                  andi         s5, a4, 147
                  fadd.s       ft7, fs9, fs4, rne
                  fcvt.s.w     ft5, sp, rup
                  divu         s4, s10, s10
                  xori         zero, s8, 1437
                  lui          s5, 900081
                  fsgnjn.s     fa4, ft10, fs0
                  nop
                  fmin.s       ft6, ft7, ft0
                  slli         a1, sp, 13
                  flt.s        zero, ft8, fa6
                  mulhsu       gp, s3, s1
                  xor          zero, s5, t3
                  fadd.s       fa7, fs9, ft5, rdn
                  fmax.s       ft1, ft4, fs8
                  div          a6, s7, t3
                  divu         t6, s11, a5
                  lui          t5, 421319
                  and          gp, s10, t1
                  fsub.s       ft8, ft9, fa3
                  fcvt.s.wu    fa1, t6, rne
                  fcvt.w.s     s9, fs1, rtz
                  fcvt.wu.s    a2, ft7, rup
                  fclass.s     s3, fa7
                  div          a6, a0, s9
                  mulh         tp, a0, a6
                  fle.s        t2, ft7, fs3
                  nop
                  fmul.s       ft5, fa3, ft0
                  mulh         s2, t2, t1
                  addi         a2, s9, -714
                  fdiv.s       fa2, fa7, ft2, rne
                  remu         a3, t3, a7
                  xori         a5, s7, 1089
                  fcvt.wu.s    s3, ft3
                  fcvt.wu.s    sp, fa3
                  lui          a6, 912360
                  rem          s0, s11, a5
                  mulhsu       s2, s3, tp
                  fclass.s     s8, fs4
                  xori         s6, tp, -1488
                  sltu         s9, t3, s2
                  fsgnjx.s     fs4, fa2, ft0
                  mulhu        s1, zero, tp
                  fmin.s       ft4, ft10, fs6
                  andi         t5, s0, -1856
                  mulhsu       tp, a0, s11
                  xori         sp, t5, 1620
                  sub          s8, t0, a0
                  mulh         a3, s0, sp
                  sltiu        s9, s11, 1403
                  fadd.s       fa1, ft3, fs1, rtz
                  fadd.s       fs3, fs8, ft6
                  fsgnj.s      ft5, fa1, fs0
                  or           a2, s5, sp
                  div          sp, a6, t6
                  fmv.w.x      fs6, s3
                  or           gp, a7, t2
                  srli         s3, t5, 2
                  mulhsu       s9, t6, t4
                  fmax.s       ft2, ft0, ft0
                  slli         t3, a0, 1
                  mul          s0, s2, t6
                  fcvt.s.w     fa3, a2, rmm
                  ori          a7, a6, 970
                  fsgnj.s      fs10, fs11, fs3
                  fsgnj.s      fs8, ft1, fs6
                  lui          a5, 476354
                  rem          a5, s10, t6
                  srli         s8, a0, 18
                  add          s5, a4, t2
                  addi         s9, s0, 383
                  fdiv.s       fs1, fs3, ft1
                  slli         gp, t4, 26
                  addi         t3, a5, -1033
                  slt          s9, t2, t2
                  srl          s1, s4, a5
                  flt.s        s7, ft1, fs4
                  lui          sp, 706018
                  rem          tp, s5, sp
                  fsgnjn.s     fa1, fs7, fs11
                  fcvt.s.w     ft5, s1, rup
                  fmv.w.x      fs7, t1
                  sub          sp, t0, t3
                  srl          a7, s10, s5
                  fmin.s       ft10, ft3, ft1
                  auipc        s7, 943779
                  fcvt.s.w     ft0, a3
                  fmax.s       ft5, fs6, fa2
                  xor          a2, s5, a7
                  fdiv.s       fs5, ft10, ft0, rup
                  remu         t5, a2, a4
                  fmul.s       ft6, ft10, fs11, rne
                  sltiu        zero, a2, -685
                  slt          zero, s7, zero
                  slti         s9, tp, 18
                  slli         s3, s0, 5
                  sltu         zero, gp, s7
                  slti         a1, s0, -1159
                  xor          a3, gp, s6
                  sll          a1, s6, t2
                  fdiv.s       fs0, fs1, fs10
                  fdiv.s       fs5, fa4, fa6, rup
                  nop
                  fcvt.s.w     ft10, s9
                  srl          s2, a6, s11
                  remu         t4, a6, s0
                  or           s6, t4, zero
                  rem          zero, s4, gp
                  slti         t3, t1, 1364
                  fcvt.s.w     fs11, s3
                  andi         s3, t2, -138
                  lui          a1, 368507
                  and          a3, a3, tp
                  nop
                  lui          t5, 98072
                  slti         a6, a5, -1010
                  rem          s9, t4, s10
                  fmv.w.x      fs6, ra
                  fsgnjn.s     fs6, ft11, fa5
                  fsgnjn.s     fs10, fa7, ft7
                  rem          s9, s10, s2
                  sub          s7, t5, t4
                  fcvt.wu.s    t6, fa5
                  slt          a6, tp, a2
                  srl          s9, t2, zero
                  sll          t3, s0, a4
                  divu         s8, a3, s4
                  sltiu        s10, t4, -346
                  fsgnjn.s     fa3, fa5, ft5
                  ori          sp, s2, 1863
                  fcvt.s.wu    ft8, s1
                  or           gp, t2, s1
                  add          a1, tp, sp
                  fmin.s       fs4, fs7, fa5
                  sll          t6, s10, a2
                  fsqrt.s      fs1, ft5, rmm
                  xor          gp, s8, a6
                  xor          a0, s3, a4
                  fmv.w.x      ft9, s8
                  fcvt.wu.s    t4, fs8, rtz
                  fsgnjx.s     fs0, fa5, fs8
                  fdiv.s       fs11, ft11, fs3
                  fsgnjn.s     fs5, fs1, fs4
                  slli         a1, a7, 8
                  fmul.s       fs1, ft9, ft2
                  nop
                  fsgnjx.s     fa1, fa5, ft6
                  flt.s        tp, fs10, fa7
                  srai         a7, a2, 27
                  fsgnj.s      ft11, fa5, ft3
                  xor          t2, t5, sp
                  mulh         s4, a2, t2
                  fsgnjx.s     fs4, fa6, fs10
                  fcvt.s.w     ft4, s10
                  fmax.s       ft2, fs1, ft7
                  divu         a2, a2, t6
                  fmv.x.w      s5, fa1
                  fmv.w.x      ft11, tp
                  fsub.s       fa4, ft7, fa4, rne
                  fsgnjn.s     ft6, fa5, ft5
                  divu         a2, s0, s10
                  mul          sp, s5, s6
                  fcvt.s.w     ft10, a3
                  fmv.w.x      fs8, s1
                  fdiv.s       ft5, fa6, fa1
                  fcvt.wu.s    a6, fs0
                  fsub.s       fs4, ft8, fs3, rdn
                  lui          s8, 233623
                  sra          sp, s3, a2
                  fmv.w.x      ft9, a0
                  fsub.s       fa2, fa4, fs9, rup
                  mulh         gp, a1, tp
                  xor          t6, s10, a1
                  auipc        t4, 132692
                  fsgnjx.s     ft9, fs2, ft6
                  add          a6, s3, a1
                  fdiv.s       ft10, ft5, fa5
                  fclass.s     s10, ft6
                  fmul.s       ft11, fs3, fs10, rmm
                  srl          ra, a7, t6
                  mul          t6, a6, t2
                  sltiu        t5, t0, -1671
                  fsgnjx.s     fa6, ft5, fa0
                  fcvt.wu.s    a5, fa6
                  auipc        s8, 178038
                  or           s10, s4, s9
                  fmul.s       ft10, ft5, fa2, rdn
                  fsgnjn.s     fs4, ft10, fa3
                  fadd.s       ft6, ft9, fa3, rne
                  fsgnj.s      fs5, fa4, ft6
                  and          a2, s2, s11
                  slt          s6, s7, s10
                  andi         s0, s10, 926
                  add          s2, a6, a4
                  fmv.w.x      ft4, gp
                  fsgnjn.s     fs2, ft1, fs8
                  srli         t6, t2, 4
                  fcvt.w.s     zero, ft10
                  srli         a1, gp, 25
                  sll          t5, ra, s7
                  sll          sp, s10, a3
                  fle.s        a7, ft1, fa6
                  srli         s4, s1, 28
                  mulh         s7, a2, s10
                  and          t1, t4, s8
                  and          s4, t5, tp
                  fmv.x.w      t4, ft10
                  and          a6, s10, s1
                  fsgnjn.s     fa1, ft11, fa0
                  mul          a6, a2, s3
                  fcvt.w.s     a2, fs0, rne
                  fsqrt.s      ft10, ft8, rtz
                  andi         gp, t0, 415
                  fcvt.w.s     s9, fs8, rdn
                  fcvt.wu.s    tp, fs8
                  and          t4, a1, s3
                  fmax.s       ft1, fs9, ft11
                  sra          s2, s8, a3
                  slt          s5, a7, s8
                  auipc        s9, 578100
                  fsqrt.s      ft10, ft11, rne
                  srli         t5, t2, 5
                  ori          s9, t6, -1455
                  fcvt.s.w     fa7, s2, rne
                  ori          s8, s3, 1310
                  slt          a0, s1, t0
                  sltu         a1, s3, s6
                  addi         a6, s1, 559
                  rem          a6, a0, t5
                  mulh         s4, ra, ra
                  mulhu        a3, t4, s1
                  fmax.s       ft0, fs6, fa4
                  sll          gp, s6, zero
                  fsqrt.s      fs8, ft9, rup
                  fsgnj.s      fs8, fa1, fa4
                  nop
                  fsub.s       ft2, fs11, fs5
                  feq.s        s7, fs2, ft7
                  sub          zero, s10, s8
                  mulhu        a7, a7, t6
                  mulhu        s4, tp, s8
                  sub          a1, s7, ra
                  slt          s6, s0, t6
                  add          t5, s1, a6
                  mulhsu       a1, s8, a0
                  or           ra, s6, s0
                  fsgnjx.s     fs5, ft3, ft9
                  and          a6, a1, s0
                  add          s8, s3, t3
                  fsgnjn.s     fa3, ft8, fs5
                  slt          sp, s0, s5
                  fmv.w.x      ft4, t3
                  fsub.s       fs11, fa7, ft4, rdn
                  feq.s        a0, fa4, fs1
                  fle.s        a7, ft1, ft9
                  mulh         s5, s4, gp
                  fclass.s     a3, fa7
                  slt          sp, a5, a3
                  lui          a6, 799603
                  add          s10, a5, s1
                  mulh         a2, s9, t1
                  fcvt.s.wu    fa0, s5, rdn
                  nop
                  addi         a5, a7, -317
                  and          t3, s11, ra
                  addi         a1, a4, -926
                  fcvt.s.w     ft8, s7
                  fcvt.s.wu    fs4, s2, rmm
                  remu         ra, s9, s2
                  sub          s9, t4, t0
                  slt          t2, s3, s1
                  sltiu        t1, gp, -985
                  fsqrt.s      fa7, fs11, rdn
                  srl          t1, a0, s5
                  fmv.x.w      s4, fs9
                  and          s4, t1, a4
                  nop
                  slti         gp, s0, -935
                  mulhsu       a6, s10, t5
                  fdiv.s       ft10, fs1, fa3, rtz
                  srli         s2, ra, 3
                  fsgnjn.s     fs9, fa4, ft5
                  fsqrt.s      ft5, fs0
                  fle.s        s8, ft10, fs8
                  slt          sp, s3, a7
                  sll          s5, a5, tp
                  mulhu        t4, t5, sp
                  slt          s2, s9, a1
                  mulhsu       s1, s6, s4
                  slti         t3, s7, -998
                  sltu         s7, sp, s2
                  ori          s2, s0, 1194
                  fle.s        t3, fs8, fa3
                  andi         s6, s3, 187
                  remu         t4, s0, a3
                  srai         a2, t5, 22
                  or           a6, t3, s11
                  fcvt.s.w     ft9, a6, rtz
                  xori         sp, t3, 144
                  srli         zero, tp, 24
                  mulhsu       s3, a7, s8
                  rem          s4, t1, tp
                  fsgnj.s      fs1, ft10, fa5
                  auipc        a1, 878480
                  fcvt.w.s     a6, fs2, rmm
                  remu         s1, a3, a5
                  addi         a2, a4, 1511
                  div          ra, a5, s6
                  sll          t3, s7, a4
                  fsub.s       fs7, fs8, ft11
                  add          a7, s1, ra
                  slt          t1, t0, zero
                  xor          s10, t1, s11
                  fle.s        a0, ft9, fa2
                  fsgnjx.s     fa2, fa2, fa7
                  sra          s0, s2, s1
                  sub          t2, a7, sp
                  srli         t2, t2, 31
                  sra          s9, s6, a7
                  fcvt.w.s     s6, ft6
                  div          t4, t3, t4
                  rem          a1, s1, a2
                  fmax.s       fs6, fa4, fa7
                  sll          s6, t4, t1
                  fcvt.s.wu    fs10, s10
                  div          ra, t2, a4
                  flt.s        a1, fs11, ft10
                  feq.s        s8, fs10, ft1
                  sltu         t6, tp, s8
                  sltu         s10, ra, sp
                  fmv.x.w      s0, fs4
                  flt.s        s2, fa6, ft3
                  fmul.s       fs9, ft5, ft5
                  fmin.s       fs6, ft10, fs6
                  fsub.s       fs9, fs8, ft9
                  slt          a7, s0, s0
                  fadd.s       fa4, fs9, ft9
                  fcvt.wu.s    a2, fa5, rdn
                  fcvt.wu.s    a2, ft10
                  fadd.s       fa7, fs5, fs8
                  fcvt.w.s     tp, fs5
                  srli         t1, s7, 12
                  fcvt.w.s     t5, ft0, rdn
                  rem          s0, s11, a0
                  fmul.s       ft9, fs4, fa1, rne
                  fmv.w.x      fs9, a0
                  fcvt.w.s     s9, ft4, rup
                  mulhu        s0, s0, ra
                  and          s0, zero, sp
                  fsgnj.s      fa0, fs8, ft0
                  fmul.s       fa7, fs3, ft7
                  and          s4, a7, t1
                  fclass.s     gp, fs10
                  mulhu        a2, sp, s2
                  slli         a3, t5, 18
                  andi         a6, s3, -1843
                  fcvt.s.wu    fs5, s5
                  div          s8, s2, s1
                  fcvt.w.s     a0, fs7
                  fsgnjx.s     ft1, fa6, ft2
                  fsgnjn.s     ft11, ft11, fa6
                  mulhu        s6, a5, a7
                  xor          t1, a3, a5
                  or           s6, a7, t0
                  slt          t2, s0, t0
                  slti         t3, s6, -1990
                  fsgnjn.s     ft7, fs4, fa3
                  srli         s8, ra, 3
                  fclass.s     s4, ft1
                  mulhsu       s5, a3, t2
                  fmv.x.w      s2, fa5
                  fsgnjn.s     fs7, ft11, fs11
                  slli         a5, t2, 17
                  srl          gp, zero, a6
                  nop
                  fsub.s       ft11, ft9, ft9
                  mul          t5, a5, a2
                  srai         s6, s0, 25
                  fmv.x.w      ra, fa1
                  xori         ra, t5, -300
                  fsgnjn.s     fs0, fs10, fs11
                  addi         s2, tp, -1538
                  fsgnj.s      fa6, ft4, ft11
                  fcvt.s.w     fs3, a3
                  div          s2, s7, sp
                  fle.s        ra, fs1, fs5
                  sltu         s5, s6, t6
                  fcvt.wu.s    t3, ft1
                  xor          ra, ra, s11
                  sll          a7, a1, a3
                  mulhu        s6, a1, s7
                  srl          s0, s10, a7
                  divu         s5, gp, s0
                  srli         a6, s3, 27
                  fclass.s     ra, ft1
                  fadd.s       ft8, fs0, ft11, rdn
                  lui          tp, 560482
                  mulhsu       s0, s1, s8
                  mulhsu       a0, t5, ra
                  fsgnjn.s     ft11, fs4, fa1
                  rem          a2, a2, t0
                  fmv.w.x      fs8, ra
                  fdiv.s       fs4, fs3, fa1, rup
                  fcvt.s.wu    ft5, a5, rdn
                  sll          s0, s3, s11
                  srl          s9, s9, a0
                  and          a6, s7, a3
                  remu         s3, a5, s0
                  feq.s        t2, fs10, fa3
                  ori          t2, t6, -1898
                  fsgnjx.s     ft10, fs3, fa3
                  feq.s        s10, fs6, ft1
                  lui          s8, 731242
                  div          s6, gp, s1
                  and          s5, t1, ra
                  fsgnjx.s     ft9, ft2, ft11
                  fmv.w.x      ft0, a5
                  fsgnjx.s     fa6, fa7, fs11
                  and          s1, s6, s5
                  sltiu        a0, a3, -786
                  flt.s        tp, fs0, fa3
                  fsgnjx.s     ft3, fa0, fa6
                  srli         s7, s0, 14
                  sltiu        zero, tp, 853
                  sra          a3, sp, tp
                  div          t5, t6, gp
                  fcvt.wu.s    a2, fs11, rtz
                  ori          s2, t1, -1322
                  mulhu        a1, s1, a5
                  divu         sp, t5, gp
                  fsgnjx.s     fs7, fa5, ft4
                  fmin.s       fs7, ft3, fs7
                  srli         a5, a6, 25
                  fsgnjx.s     ft7, fs7, fs8
                  mul          s3, t5, s7
                  mulhsu       s7, a6, t0
                  sltiu        a1, a3, 701
                  fadd.s       fs4, fs0, fs10
                  addi         a5, a1, 2017
                  xori         tp, s8, 162
                  fcvt.s.wu    fa1, s2
                  fle.s        t6, ft8, ft8
                  fcvt.w.s     s5, fa4, rtz
                  mul          s10, a4, s5
                  mulhsu       t2, a0, a6
                  mulh         s0, s1, a0
                  and          t2, s0, s9
                  fcvt.w.s     s2, fs0, rne
                  fmax.s       fs2, ft2, fa1
                  flt.s        a6, fa1, fa2
                  fcvt.s.w     ft11, t6, rup
                  sltiu        a0, sp, -1735
                  feq.s        s9, ft6, fa5
                  fmax.s       fs9, ft0, fs2
                  and          s9, t4, t4
                  addi         a6, s3, -231
                  fle.s        s8, fs8, fs10
                  fmax.s       ft3, fs8, ft3
                  div          t4, s10, a0
                  srl          s9, ra, s10
                  div          sp, t0, ra
                  fclass.s     a6, fs0
                  lui          s7, 1015999
                  divu         s10, ra, s1
                  mulhu        s0, s2, s4
                  srli         tp, a5, 23
                  slli         t1, s2, 22
                  fmv.w.x      fs8, s3
                  fclass.s     t5, ft4
                  lui          s6, 418675
                  mulhu        s4, s6, s10
                  lui          gp, 96937
                  ori          s6, s6, -1819
                  auipc        a5, 258475
                  fadd.s       fs8, ft10, ft6
                  mulh         s6, t1, a7
                  fmul.s       fa3, fs7, ft4
                  fcvt.w.s     t5, fs2, rup
                  ori          a5, a0, 289
                  fmv.w.x      ft0, t1
                  sub          a3, a6, gp
                  srli         a5, gp, 10
                  slt          a3, sp, a4
                  fsgnjn.s     fa2, ft8, ft1
                  srli         zero, t0, 26
                  sltu         sp, s0, a4
                  fsqrt.s      fs8, fs11, rup
                  fsgnj.s      ft9, fs10, fa6
                  ori          t5, a5, 618
                  feq.s        t1, fa6, ft11
                  rem          s8, tp, a1
                  xor          t3, a1, s2
                  add          gp, s11, t3
                  fcvt.w.s     a2, fa0
                  fclass.s     a5, fs2
                  mulh         t5, a0, a4
                  srli         s3, a1, 23
                  slti         s2, s6, 1092
                  fcvt.s.w     ft11, a0
                  fclass.s     t6, fs5
                  slli         a1, a4, 16
                  fcvt.s.wu    fs11, s7, rup
                  lui          t6, 457415
                  slti         s10, ra, 1365
                  fsqrt.s      ft5, ft4, rne
                  sub          a6, s10, s6
                  sub          a7, a0, s6
                  add          s7, a0, t5
                  fsgnjn.s     ft10, fa0, fs8
                  fadd.s       fs5, fa1, fs0
                  fdiv.s       fa7, ft2, ft10
                  fsgnj.s      fs3, ft9, fs10
                  xor          a6, s10, t0
                  lui          s4, 907332
                  srli         s1, s10, 8
                  sra          gp, t6, s4
                  feq.s        s10, fa5, ft10
                  divu         s5, a4, s9
                  fmul.s       ft7, fs8, fs2
                  andi         s0, s11, 732
                  sll          s9, t3, s2
                  andi         a2, a6, 1397
                  slli         s2, t5, 25
                  fsgnjx.s     fa0, ft11, fs10
                  mul          s10, s9, t3
                  nop
                  nop
                  srli         s2, gp, 0
                  fmv.w.x      fa2, t1
                  lui          ra, 823725
                  sltiu        s8, zero, -1862
                  sll          t4, s6, tp
                  fsgnj.s      fs5, fs5, fa1
                  addi         s0, s3, 797
                  fsgnjx.s     ft10, ft5, fs1
                  sltu         a3, gp, s7
                  sltu         a6, a2, s7
                  mul          t2, t6, t2
                  fsgnj.s      fs3, fs4, fs6
                  mulhu        s0, s6, t5
                  slt          s0, ra, s0
                  srli         s4, s6, 25
                  fadd.s       fa3, ft7, fs6
                  fdiv.s       ft2, ft11, ft5
                  xor          zero, a3, zero
                  fsgnjx.s     fs1, fs9, fs5
                  fcvt.w.s     s8, ft1, rup
                  remu         t2, a0, ra
                  srai         a7, t3, 17
                  xor          s9, a1, t4
                  fmv.x.w      a6, ft2
                  mul          s1, s10, s11
                  sltiu        a3, s10, -1621
                  mulhu        t6, sp, a7
                  fmul.s       fs11, ft6, ft1
                  rem          s8, s3, a5
                  fsgnj.s      ft6, fs10, ft7
                  mulhsu       tp, s6, s3
                  rem          sp, s5, a0
                  mulh         s9, a6, tp
                  fmul.s       fa5, ft10, ft2
                  auipc        a2, 392600
                  xori         s10, tp, 1956
                  slt          t6, a3, a4
                  feq.s        gp, ft9, ft1
                  ori          t5, s7, -726
                  fdiv.s       ft2, fa7, ft8, rtz
                  ori          t6, s6, -1582
                  sub          ra, zero, s4
                  add          t5, t4, zero
                  mulh         sp, s8, a2
                  div          t1, s5, t4
                  xor          t1, s9, sp
                  xori         s2, t4, -1783
                  fmax.s       fs10, fa2, ft11
                  fclass.s     gp, fs10
                  fcvt.w.s     s6, fs7
                  slt          gp, zero, a7
                  fmv.x.w      s7, fa2
                  sltiu        a0, t0, -1350
                  srli         zero, a1, 0
                  fadd.s       fa7, fs7, fa5, rdn
                  andi         t4, gp, -430
                  mul          s8, s11, s2
                  add          a3, t6, s2
                  fcvt.s.wu    ft2, t1, rtz
                  lui          a3, 738781
                  ori          t2, tp, 1446
                  nop
                  srli         a7, t1, 10
                  slli         a3, ra, 15
                  mulh         s9, s11, s7
                  fsgnjx.s     fs11, fa3, fa3
                  fsgnjn.s     fa1, ft9, fa0
                  andi         t1, a0, 1180
                  fadd.s       ft0, fs3, fs11, rdn
                  fmv.x.w      t5, fs3
                  fmv.x.w      s1, fs5
                  fmul.s       ft2, fs9, ft10, rdn
                  srli         a7, t4, 28
                  fcvt.wu.s    s4, fs8, rmm
                  sra          t3, tp, a2
                  auipc        s8, 927122
                  fmin.s       ft9, fs5, ft3
                  fclass.s     t5, fs4
                  andi         sp, a4, 928
                  fclass.s     s9, ft10
                  srli         s8, tp, 30
                  mulhsu       tp, s6, a6
                  remu         s10, s0, t5
                  fmv.x.w      s5, fa2
                  slli         a5, a5, 16
                  auipc        sp, 951624
                  or           s2, a2, a7
                  fsub.s       ft9, ft1, fs6
                  srl          s6, t4, a4
                  slli         t6, a5, 20
                  mul          a3, t4, s9
                  fle.s        t2, fs4, ft6
                  andi         s1, a5, 377
                  fmin.s       ft0, ft2, ft10
                  feq.s        s9, ft8, ft10
                  fsub.s       ft5, fs0, fa1, rmm
                  srl          zero, a2, s3
                  slt          s3, t5, sp
                  sll          a7, t1, t3
                  mul          gp, s11, gp
                  ori          tp, s3, 1926
                  remu         t3, s8, s6
                  sltiu        a1, a3, -713
                  fsgnjn.s     fs11, fs11, fa1
                  add          a0, s2, t3
                  fcvt.s.wu    fa1, s10, rup
                  slti         a7, zero, -1387
                  andi         a7, t4, 863
                  slti         a6, s8, -242
                  ori          s10, s9, -2020
                  divu         a3, a6, s4
                  fmin.s       fs9, ft2, fa1
                  mulhsu       s0, s0, t6
                  slti         s5, a1, -793
                  mulh         s10, s11, s0
                  fmv.x.w      a5, fa4
                  fsgnjx.s     fs10, fs6, ft9
                  fadd.s       ft10, ft8, fs6
                  fcvt.wu.s    s6, ft5
                  div          s6, t2, ra
                  fsub.s       fa2, fs4, ft5
                  srai         zero, a3, 0
                  fsgnj.s      ft3, fa5, fa3
                  nop
                  slti         s0, ra, -1190
                  fmax.s       ft0, fs6, fs9
                  fsgnjn.s     ft7, fs4, fs11
                  slti         s4, s4, 1229
                  fclass.s     t4, ft10
                  fclass.s     s5, ft4
                  feq.s        s2, ft1, ft3
                  feq.s        s10, fa7, ft0
                  srli         zero, s10, 8
                  fcvt.w.s     t1, fs5
                  mulhu        t3, tp, a6
                  lui          s3, 493170
                  xor          gp, s11, gp
                  fcvt.s.wu    ft3, s5
                  fadd.s       fs8, ft7, fa2, rne
                  remu         a6, t1, t2
                  sltiu        s5, gp, 263
                  fmv.x.w      a0, ft8
                  fmax.s       ft2, ft1, fs11
                  sub          a6, s2, s3
                  flt.s        t6, fs4, ft7
                  add          s7, gp, gp
                  fsgnjx.s     ft6, fa3, ft9
                  fsgnjn.s     ft9, fa4, ft6
                  ori          s3, a1, 1961
                  mulh         sp, gp, a3
                  fcvt.s.wu    fa6, a7
                  fcvt.wu.s    s4, fa5, rne
                  mul          t6, s4, a7
                  nop
                  fsgnjx.s     fa4, fs3, fs5
                  flt.s        s1, fs9, fs9
                  auipc        s2, 964114
                  auipc        s9, 211250
                  fsub.s       fa2, ft3, fa2, rne
                  fmin.s       fs11, ft4, fs9
                  divu         t6, ra, s0
                  sub          a3, s0, t4
                  and          gp, tp, s1
                  fsqrt.s      fs6, ft0, rup
                  fcvt.s.wu    ft1, s6
                  slli         a0, s6, 23
                  xori         t5, s8, -1524
                  mulh         a5, s7, s5
                  fcvt.s.w     fs11, s11, rdn
                  mul          s10, a4, a4
                  fmul.s       fa4, ft6, fa1, rmm
                  remu         s8, sp, s9
                  xori         a3, t5, 306
                  slt          zero, t4, a2
                  add          a6, s9, s11
                  fclass.s     s7, ft0
                  divu         s8, a3, t6
                  feq.s        a2, fs2, fs10
                  rem          s1, s0, s4
                  or           s7, sp, t0
                  fmin.s       ft9, ft11, fa0
                  fsgnjx.s     fs6, ft6, fs5
                  div          s7, a5, s1
                  sltu         s5, s6, s8
                  fmin.s       fa6, ft0, fs7
                  sub          t2, a1, a2
                  fdiv.s       ft1, fa2, ft4, rup
                  flt.s        s3, ft8, ft5
                  mulhu        s7, s6, a2
                  flt.s        s6, fs6, ft6
                  feq.s        zero, fs9, fa6
                  fcvt.wu.s    a1, ft5, rne
                  fmv.x.w      gp, fs9
                  fcvt.w.s     t2, fs8, rdn
                  fcvt.s.w     ft5, tp, rdn
                  mulhsu       t3, a1, s4
                  fsub.s       ft11, ft8, ft2
                  srai         s1, a3, 18
                  fmin.s       fs5, fa0, fa7
                  fsub.s       fs4, ft4, fa3
                  fsgnjx.s     fs9, fs5, fs7
                  fdiv.s       fs6, ft3, fa6, rne
                  divu         a5, s4, ra
                  sll          a5, s2, zero
                  fcvt.s.wu    fs0, t4, rtz
                  fle.s        t1, ft5, fs11
                  flt.s        a1, ft3, ft8
                  slli         ra, tp, 10
                  fsqrt.s      ft0, fs7
                  fmv.w.x      ft4, s1
                  add          s3, s9, s9
                  mul          a3, a1, t1
                  slt          t4, a5, sp
                  mulhu        a3, t6, s7
                  ori          t2, t1, 412
                  fle.s        ra, fs4, fs4
                  srli         t5, t1, 9
                  sltiu        a7, sp, -1928
                  rem          t6, a6, gp
                  sltiu        s9, tp, -396
                  addi         t1, s0, -178
                  srl          a6, s1, a2
                  fmin.s       fs5, fa0, fa7
                  fclass.s     s10, ft11
                  slti         s0, a5, 180
                  srli         s3, s7, 27
                  slt          gp, s2, a5
                  andi         sp, gp, -487
                  fsgnjx.s     ft1, fs5, ft0
                  auipc        a5, 600639
                  fle.s        s9, ft10, fs3
                  slli         a2, tp, 17
                  srli         t6, t4, 13
                  fsub.s       fs3, ft0, fa6
                  fdiv.s       fs3, fa3, fs11, rne
                  fsgnjn.s     ft2, fs4, ft4
                  addi         s10, s4, -1920
                  fcvt.wu.s    s8, fs3
                  add          s8, s4, s1
                  sll          t6, a5, a4
                  sll          ra, s8, a0
                  fsub.s       fs2, ft6, ft1
                  fmv.x.w      s7, fa1
                  sll          s1, zero, s8
                  fmv.x.w      t2, ft11
                  fcvt.s.w     fa6, zero, rmm
                  fdiv.s       ft10, ft1, ft4, rtz
                  nop
                  div          sp, t2, t5
                  fsub.s       ft3, ft2, fs7, rdn
                  fadd.s       ft4, ft2, ft7, rne
                  sub          s8, sp, s4
                  fmax.s       fa2, ft3, fs5
                  fcvt.s.w     ft7, t0, rne
                  fcvt.s.w     fs7, a6
                  slli         s2, s7, 26
                  fdiv.s       ft7, ft11, ft6, rdn
                  flt.s        s9, fs10, fs11
                  mulhu        a2, s5, t6
                  fmin.s       ft6, ft5, fs2
                  fmul.s       fs5, fs2, fs9, rtz
                  fsgnjx.s     fs0, fs3, ft10
                  sltu         s3, s6, s8
                  slli         sp, t5, 27
                  sltu         s0, s5, zero
                  fsub.s       ft1, fs4, fs5
                  ori          sp, a5, -663
                  sltiu        s0, s10, 1294
                  slli         zero, a1, 4
                  fmv.w.x      ft1, gp
                  fclass.s     a3, ft4
                  fsgnj.s      fa0, ft1, ft0
                  or           s0, sp, s6
                  fsub.s       ft3, fs6, fa0, rtz
                  fcvt.wu.s    s10, fa0
                  mul          t6, a6, a1
                  fmin.s       fa0, fa3, ft3
                  fsub.s       ft10, fs4, fs9
                  mul          zero, gp, a4
                  feq.s        s5, fs6, ft2
                  fclass.s     a2, fs10
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
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_2:
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_3:
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_4:
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_5:
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_6:
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_7:
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_8:
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_9:
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_10:
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_11:
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_12:
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_13:
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_14:
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_15:
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
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
                  addi x14, x14, -4
                  sw  x27, (x14)
                  add x27, x14, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x14, x27, zero
                  csrr x31, 0x341 # MEPC
                  csrr x31, 0x342 # MCAUSE
                  li x7, 0x3 # BREAKPOINT
                  beq x31, x7, ebreak_handler
                  li x7, 0x8 # ECALL_UMODE
                  beq x31, x7, ecall_handler
                  li x7, 0x9 # ECALL_SMODE
                  beq x31, x7, ecall_handler
                  li x7, 0xb # ECALL_MMODE
                  beq x31, x7, ecall_handler
                  li x7, 0x1
                  beq x31, x7, instr_fault_handler
                  li x7, 0x5
                  beq x31, x7, load_fault_handler
                  li x7, 0x7
                  beq x31, x7, store_fault_handler
                  li x7, 0xc
                  beq x31, x7, pt_fault_handler
                  li x7, 0xd
                  beq x31, x7, pt_fault_handler
                  li x7, 0xf
                  beq x31, x7, pt_fault_handler
                  li x7, 0x2 # ILLEGAL_INSTRUCTION
                  beq x31, x7, illegal_instr_handler
                  csrr x7, 0x343 # MTVAL
                  1: la x5, test_done
                  jalr x1, x5, 0

ecall_handler:    
                  la x31, _start
                  sw x0, 0(x31)
                  sw x1, 4(x31)
                  sw x2, 8(x31)
                  sw x3, 12(x31)
                  sw x4, 16(x31)
                  sw x5, 20(x31)
                  sw x6, 24(x31)
                  sw x7, 28(x31)
                  sw x8, 32(x31)
                  sw x9, 36(x31)
                  sw x10, 40(x31)
                  sw x11, 44(x31)
                  sw x12, 48(x31)
                  sw x13, 52(x31)
                  sw x14, 56(x31)
                  sw x15, 60(x31)
                  sw x16, 64(x31)
                  sw x17, 68(x31)
                  sw x18, 72(x31)
                  sw x19, 76(x31)
                  sw x20, 80(x31)
                  sw x21, 84(x31)
                  sw x22, 88(x31)
                  sw x23, 92(x31)
                  sw x24, 96(x31)
                  sw x25, 100(x31)
                  sw x26, 104(x31)
                  sw x27, 108(x31)
                  sw x28, 112(x31)
                  sw x29, 116(x31)
                  sw x30, 120(x31)
                  sw x31, 124(x31)
                  la x5, write_tohost
                  jalr x0, x5, 0

instr_fault_handler:
                  add x27, x14, zero
                  lw  x1, 4(x27)
                  lw  x2, 8(x27)
                  lw  x3, 12(x27)
                  lw  x4, 16(x27)
                  lw  x5, 20(x27)
                  lw  x6, 24(x27)
                  lw  x7, 28(x27)
                  lw  x8, 32(x27)
                  lw  x9, 36(x27)
                  lw  x10, 40(x27)
                  lw  x11, 44(x27)
                  lw  x12, 48(x27)
                  lw  x13, 52(x27)
                  lw  x14, 56(x27)
                  lw  x15, 60(x27)
                  lw  x16, 64(x27)
                  lw  x17, 68(x27)
                  lw  x18, 72(x27)
                  lw  x19, 76(x27)
                  lw  x20, 80(x27)
                  lw  x21, 84(x27)
                  lw  x22, 88(x27)
                  lw  x23, 92(x27)
                  lw  x24, 96(x27)
                  lw  x25, 100(x27)
                  lw  x26, 104(x27)
                  lw  x27, 108(x27)
                  lw  x28, 112(x27)
                  lw  x29, 116(x27)
                  lw  x30, 120(x27)
                  lw  x31, 124(x27)
                  addi x27, x27, 128
                  add x14, x27, zero
                  lw  x27, (x14)
                  addi x14, x14, 4
                  mret

load_fault_handler:
                  add x27, x14, zero
                  lw  x1, 4(x27)
                  lw  x2, 8(x27)
                  lw  x3, 12(x27)
                  lw  x4, 16(x27)
                  lw  x5, 20(x27)
                  lw  x6, 24(x27)
                  lw  x7, 28(x27)
                  lw  x8, 32(x27)
                  lw  x9, 36(x27)
                  lw  x10, 40(x27)
                  lw  x11, 44(x27)
                  lw  x12, 48(x27)
                  lw  x13, 52(x27)
                  lw  x14, 56(x27)
                  lw  x15, 60(x27)
                  lw  x16, 64(x27)
                  lw  x17, 68(x27)
                  lw  x18, 72(x27)
                  lw  x19, 76(x27)
                  lw  x20, 80(x27)
                  lw  x21, 84(x27)
                  lw  x22, 88(x27)
                  lw  x23, 92(x27)
                  lw  x24, 96(x27)
                  lw  x25, 100(x27)
                  lw  x26, 104(x27)
                  lw  x27, 108(x27)
                  lw  x28, 112(x27)
                  lw  x29, 116(x27)
                  lw  x30, 120(x27)
                  lw  x31, 124(x27)
                  addi x27, x27, 128
                  add x14, x27, zero
                  lw  x27, (x14)
                  addi x14, x14, 4
                  mret

store_fault_handler:
                  add x27, x14, zero
                  lw  x1, 4(x27)
                  lw  x2, 8(x27)
                  lw  x3, 12(x27)
                  lw  x4, 16(x27)
                  lw  x5, 20(x27)
                  lw  x6, 24(x27)
                  lw  x7, 28(x27)
                  lw  x8, 32(x27)
                  lw  x9, 36(x27)
                  lw  x10, 40(x27)
                  lw  x11, 44(x27)
                  lw  x12, 48(x27)
                  lw  x13, 52(x27)
                  lw  x14, 56(x27)
                  lw  x15, 60(x27)
                  lw  x16, 64(x27)
                  lw  x17, 68(x27)
                  lw  x18, 72(x27)
                  lw  x19, 76(x27)
                  lw  x20, 80(x27)
                  lw  x21, 84(x27)
                  lw  x22, 88(x27)
                  lw  x23, 92(x27)
                  lw  x24, 96(x27)
                  lw  x25, 100(x27)
                  lw  x26, 104(x27)
                  lw  x27, 108(x27)
                  lw  x28, 112(x27)
                  lw  x29, 116(x27)
                  lw  x30, 120(x27)
                  lw  x31, 124(x27)
                  addi x27, x27, 128
                  add x14, x27, zero
                  lw  x27, (x14)
                  addi x14, x14, 4
                  mret

ebreak_handler:   
                  csrr  x31, 0x341
                  addi  x31, x31, 4
                  csrw  0x341, x31
                  add x27, x14, zero
                  lw  x1, 4(x27)
                  lw  x2, 8(x27)
                  lw  x3, 12(x27)
                  lw  x4, 16(x27)
                  lw  x5, 20(x27)
                  lw  x6, 24(x27)
                  lw  x7, 28(x27)
                  lw  x8, 32(x27)
                  lw  x9, 36(x27)
                  lw  x10, 40(x27)
                  lw  x11, 44(x27)
                  lw  x12, 48(x27)
                  lw  x13, 52(x27)
                  lw  x14, 56(x27)
                  lw  x15, 60(x27)
                  lw  x16, 64(x27)
                  lw  x17, 68(x27)
                  lw  x18, 72(x27)
                  lw  x19, 76(x27)
                  lw  x20, 80(x27)
                  lw  x21, 84(x27)
                  lw  x22, 88(x27)
                  lw  x23, 92(x27)
                  lw  x24, 96(x27)
                  lw  x25, 100(x27)
                  lw  x26, 104(x27)
                  lw  x27, 108(x27)
                  lw  x28, 112(x27)
                  lw  x29, 116(x27)
                  lw  x30, 120(x27)
                  lw  x31, 124(x27)
                  addi x27, x27, 128
                  add x14, x27, zero
                  lw  x27, (x14)
                  addi x14, x14, 4
                  mret

illegal_instr_handler:
                  csrr  x31, 0x341
                  addi  x31, x31, 4
                  csrw  0x341, x31
                  add x27, x14, zero
                  lw  x1, 4(x27)
                  lw  x2, 8(x27)
                  lw  x3, 12(x27)
                  lw  x4, 16(x27)
                  lw  x5, 20(x27)
                  lw  x6, 24(x27)
                  lw  x7, 28(x27)
                  lw  x8, 32(x27)
                  lw  x9, 36(x27)
                  lw  x10, 40(x27)
                  lw  x11, 44(x27)
                  lw  x12, 48(x27)
                  lw  x13, 52(x27)
                  lw  x14, 56(x27)
                  lw  x15, 60(x27)
                  lw  x16, 64(x27)
                  lw  x17, 68(x27)
                  lw  x18, 72(x27)
                  lw  x19, 76(x27)
                  lw  x20, 80(x27)
                  lw  x21, 84(x27)
                  lw  x22, 88(x27)
                  lw  x23, 92(x27)
                  lw  x24, 96(x27)
                  lw  x25, 100(x27)
                  lw  x26, 104(x27)
                  lw  x27, 108(x27)
                  lw  x28, 112(x27)
                  lw  x29, 116(x27)
                  lw  x30, 120(x27)
                  lw  x31, 124(x27)
                  addi x27, x27, 128
                  add x14, x27, zero
                  lw  x27, (x14)
                  addi x14, x14, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x31, 0x300 # MSTATUS;
                  csrr  x31, 0x304 # MIE;
                  csrr  x31, 0x344 # MIP;
                  csrrc x31, 0x344, x31 # MIP;
                  add x27, x14, zero
                  lw  x1, 4(x27)
                  lw  x2, 8(x27)
                  lw  x3, 12(x27)
                  lw  x4, 16(x27)
                  lw  x5, 20(x27)
                  lw  x6, 24(x27)
                  lw  x7, 28(x27)
                  lw  x8, 32(x27)
                  lw  x9, 36(x27)
                  lw  x10, 40(x27)
                  lw  x11, 44(x27)
                  lw  x12, 48(x27)
                  lw  x13, 52(x27)
                  lw  x14, 56(x27)
                  lw  x15, 60(x27)
                  lw  x16, 64(x27)
                  lw  x17, 68(x27)
                  lw  x18, 72(x27)
                  lw  x19, 76(x27)
                  lw  x20, 80(x27)
                  lw  x21, 84(x27)
                  lw  x22, 88(x27)
                  lw  x23, 92(x27)
                  lw  x24, 96(x27)
                  lw  x25, 100(x27)
                  lw  x26, 104(x27)
                  lw  x27, 108(x27)
                  lw  x28, 112(x27)
                  lw  x29, 116(x27)
                  lw  x30, 120(x27)
                  lw  x31, 124(x27)
                  addi x27, x27, 128
                  add x14, x27, zero
                  lw  x27, (x14)
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
