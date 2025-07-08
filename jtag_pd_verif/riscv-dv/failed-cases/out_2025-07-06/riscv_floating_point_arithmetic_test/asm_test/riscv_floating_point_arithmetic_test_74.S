.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x27, h0_start
jalr x0, x27, 0
h0_start:
                  li x24, 0x40001120
                  csrw 0x301, x24
kernel_sp:        
                  la x28, kernel_stack_end

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
                  li x24, 5555651
                  fmv.w.x f0, x24
                  li x24, 2139095040
                  fmv.w.x f1, x24
                  li x24, 4286578688
                  fmv.w.x f2, x24
                  li x24, 3273983
                  fmv.w.x f3, x24
                  li x24, 2338876375
                  fmv.w.x f4, x24
                  li x24, 4286578687
                  fmv.w.x f5, x24
                  li x24, 2147483648
                  fmv.w.x f6, x24
                  li x24, 2139095041
                  fmv.w.x f7, x24
                  li x24, 2595353727
                  fmv.w.x f8, x24
                  li x24, 2139095039
                  fmv.w.x f9, x24
                  li x24, 2139095040
                  fmv.w.x f10, x24
                  li x24, 0
                  fmv.w.x f11, x24
                  li x24, 3814389988
                  fmv.w.x f12, x24
                  li x24, 2864353973
                  fmv.w.x f13, x24
                  li x24, 2143289344
                  fmv.w.x f14, x24
                  li x24, 4286578687
                  fmv.w.x f15, x24
                  li x24, 1327892355
                  fmv.w.x f16, x24
                  li x24, 2139095039
                  fmv.w.x f17, x24
                  li x24, 4286578688
                  fmv.w.x f18, x24
                  li x24, 2544595882
                  fmv.w.x f19, x24
                  li x24, 4286578688
                  fmv.w.x f20, x24
                  li x24, 2139095039
                  fmv.w.x f21, x24
                  li x24, 4286578687
                  fmv.w.x f22, x24
                  li x24, 2139095040
                  fmv.w.x f23, x24
                  li x24, 3249930001
                  fmv.w.x f24, x24
                  li x24, 2139095039
                  fmv.w.x f25, x24
                  li x24, 2139095040
                  fmv.w.x f26, x24
                  li x24, 1388137679
                  fmv.w.x f27, x24
                  li x24, 4088381617
                  fmv.w.x f28, x24
                  li x24, 2147483648
                  fmv.w.x f29, x24
                  li x24, 4286578687
                  fmv.w.x f30, x24
                  li x24, 2139095040
                  fmv.w.x f31, x24
                  fsrmi 3
                  li x0, 0xf3fccde1
                  li x1, 0x7
                  li x2, 0xa
                  li x3, 0x0
                  li x4, 0x6
                  li x5, 0xd
                  li x6, 0x80000000
                  li x7, 0x80000000
                  li x8, 0x0
                  li x9, 0xff6eb650
                  li x10, 0x54da00bd
                  li x11, 0x961e5114
                  li x12, 0xe939d07
                  li x13, 0x66b66239
                  li x14, 0xfd0d4091
                  li x15, 0x4
                  li x16, 0xfbe33d49
                  li x17, 0x7
                  li x18, 0x1
                  li x19, 0xfea6a14b
                  li x20, 0x4
                  li x21, 0x5
                  li x22, 0x6
                  li x24, 0x80000000
                  li x25, 0xeeb00390
                  li x26, 0x80000000
                  li x27, 0xf1936e1b
                  li x29, 0x1
                  li x30, 0x0
                  li x31, 0x80000000
                  la x23, user_stack_end
main:             and          sp, s3, s6
                  mul          s6, gp, a1
                  fcvt.wu.s    zero, fs2, rne
                  lui          a3, 225919
                  and          a2, a3, a1
                  ori          sp, t6, 1886
                  divu         s5, s1, t0
                  flt.s        a0, fa1, fa5
                  fmax.s       ft4, fs3, fs9
                  feq.s        s8, fs6, fs7
                  add          zero, s4, s10
                  fsgnjx.s     fs4, ft5, fs10
                  fsgnjn.s     ft10, fs0, fs10
                  nop
                  slti         zero, s4, 481
                  fmax.s       ft9, ft6, fs9
                  srl          t6, a3, tp
                  remu         t2, t3, a1
                  mul          t0, a4, a3
                  srai         zero, a6, 11
                  fadd.s       fa4, ft9, ft11, rmm
                  slli         s1, s2, 25
                  fdiv.s       ft7, fs0, fa7
                  mulhsu       sp, t2, zero
                  fclass.s     s5, fa5
                  fcvt.s.w     ft6, s3, rtz
                  sltiu        s8, t6, 7
                  slti         a5, gp, -1490
                  fsqrt.s      fs9, fs3
                  fsub.s       fs5, fa3, ft9, rmm
                  div          s8, s4, a6
                  nop
                  feq.s        a3, fa6, ft1
                  srli         a0, a4, 15
                  sra          t4, t0, a6
                  slti         s8, s11, -343
                  fadd.s       ft3, fs3, fs0, rtz
                  fmul.s       fs2, ft7, fa6
                  fsgnjn.s     fa2, fa5, fs3
                  sll          s3, a6, s9
                  mulhu        tp, a6, t5
                  addi         s0, a4, 281
                  and          a4, s0, a3
                  fmv.x.w      s6, fa2
                  fmul.s       ft0, fa5, fs1, rmm
                  sltiu        s5, a1, 1200
                  div          tp, s4, s4
                  fsqrt.s      ft9, ft11, rmm
                  addi         sp, a4, 965
                  slti         s10, sp, -1196
                  sltu         t5, s2, sp
                  slli         a3, zero, 4
                  srl          s3, zero, s2
                  fcvt.s.w     ft5, s10
                  srl          a3, a5, a0
                  fmin.s       ft5, ft2, fa1
                  mulhsu       t5, s5, zero
                  add          s6, s2, s4
                  mulh         a2, a7, a0
                  auipc        s2, 634264
                  srai         a6, t3, 10
                  srai         s3, s10, 29
                  slli         s0, s7, 29
                  xori         s2, a2, -327
                  fmul.s       ft4, ft5, ft6
                  mulhu        s1, s10, s5
                  divu         t5, ra, s10
                  sltiu        s10, t4, -634
                  slt          t1, s6, s8
                  slli         a2, a0, 20
                  nop
                  sll          ra, sp, t3
                  nop
                  and          tp, t5, gp
                  fsgnjn.s     fs1, fs6, fs9
                  flt.s        a0, ft8, fs4
                  fsgnjx.s     fa4, ft8, ft2
                  sltiu        s9, a0, -1840
                  flt.s        a7, ft8, ft7
                  mulh         t0, a1, a4
                  fsgnj.s      fs3, ft8, ft5
                  xori         t0, s4, 785
                  lui          s5, 708903
                  rem          sp, a0, t5
                  fclass.s     s3, fs1
                  flt.s        tp, ft0, fa5
                  mulh         a2, s8, s2
                  andi         a4, t5, 1589
                  fmul.s       fs6, ft1, fs1
                  srl          s6, tp, t4
                  andi         s2, t1, 1723
                  or           t2, sp, s11
                  srli         s8, t1, 30
                  fsgnjx.s     fs1, fs11, fs3
                  ori          s6, s8, -1002
                  fsgnj.s      fs2, fs4, fa5
                  sub          s4, s2, t1
                  fadd.s       ft6, fs11, ft11, rup
                  fmin.s       fs5, fs7, fs11
                  add          s10, s9, s7
                  mulhu        a2, t2, a0
                  auipc        s5, 420569
                  slli         s4, s11, 26
                  fsgnjn.s     fs1, fs11, ft5
                  fsgnjn.s     fs5, ft6, ft6
                  auipc        s2, 379131
                  flt.s        tp, fa1, fa3
                  add          a1, s9, s2
                  mulhsu       a7, tp, t3
                  div          sp, s6, s10
                  sltiu        s5, t3, 1332
                  fle.s        s2, fs10, ft11
                  srai         s5, a5, 16
                  xor          a2, t1, s4
                  fmin.s       fs8, fs8, ft10
                  sltu         tp, a1, s1
                  fcvt.s.wu    ft0, tp
                  divu         a0, t4, s3
                  nop
                  auipc        ra, 140271
                  auipc        t4, 63543
                  fmin.s       ft11, fs2, ft9
                  srl          s2, s9, s8
                  and          t6, s7, a0
                  slti         zero, s6, -355
                  srl          t5, s4, a5
                  srli         a1, s6, 31
                  srli         s1, a4, 12
                  xori         s10, a7, 1500
                  and          t5, a1, a4
                  fmul.s       ft7, ft5, fa1
                  fsgnjx.s     ft6, fs5, fa5
                  fmv.x.w      a4, fs6
                  rem          t0, zero, s10
                  div          t2, s2, t2
                  feq.s        s10, ft1, fa4
                  fcvt.s.w     fs11, s2, rmm
                  srli         s10, tp, 28
                  fsub.s       ft8, fa4, fs10, rmm
                  sltiu        t6, gp, 251
                  fcvt.s.w     ft2, s11, rne
                  div          t0, sp, a7
                  fsgnj.s      fa4, fs4, ft9
                  div          t4, a4, s4
                  fclass.s     t1, fs10
                  slli         s0, t5, 18
                  srli         t6, t5, 5
                  srl          a5, s3, a0
                  fcvt.wu.s    s0, fs6, rmm
                  fmul.s       fs1, ft9, ft0
                  slli         a2, t0, 25
                  sltu         t4, a2, a5
                  remu         gp, t1, a1
                  fdiv.s       ft3, fs8, ft4, rtz
                  fcvt.s.w     ft5, s4, rtz
                  mul          a3, s8, a3
                  srli         t1, s5, 22
                  fmv.x.w      s10, fa6
                  mulhu        t5, s2, s7
                  div          t2, sp, s6
                  fmin.s       ft8, ft11, ft8
                  fsqrt.s      ft1, ft7
                  and          a6, s10, s9
                  fcvt.s.w     fs11, s3
                  fsgnjx.s     fs1, ft0, fs0
                  sub          ra, a7, a0
                  mulh         a3, t4, s0
                  fsgnj.s      fa5, fs4, fs5
                  sltu         s6, t3, s0
                  nop
                  mulh         t2, t1, ra
                  div          a7, a6, t0
                  mul          sp, a0, ra
                  fsgnjx.s     ft3, ft6, ft8
                  fsub.s       ft5, fs1, fa4, rne
                  xori         a2, a4, -532
                  fmin.s       fs4, fs6, fs10
                  srl          a7, a1, ra
                  slti         t0, t5, -1738
                  mulhsu       a0, t1, a0
                  div          s3, s11, s0
                  fmax.s       ft4, fs10, fa6
                  fdiv.s       ft5, fs4, fs0, rne
                  slt          a0, s9, s7
                  nop
                  or           a7, t3, s5
                  and          a7, s0, t0
                  addi         gp, t2, -1445
                  fmv.x.w      t1, fs6
                  slti         s8, a5, -60
                  remu         s8, t4, s11
                  fsgnjn.s     fa5, fs2, ft7
                  fmin.s       fa4, fs6, ft10
                  sltu         s3, a3, t1
                  xor          s10, s1, s0
                  fmv.w.x      fs4, zero
                  fsgnjn.s     fs4, ft8, fa7
                  addi         s1, s1, -943
                  mulh         t4, t0, s1
                  fle.s        s6, fs10, fs0
                  sra          a2, zero, s3
                  sltu         t5, s1, a2
                  andi         s1, a3, 649
                  sltu         zero, t6, t0
                  fsgnj.s      ft3, fs7, fa7
                  mul          s3, a7, s4
                  feq.s        t1, fa1, fs10
                  ori          a3, s4, -1622
                  fsqrt.s      fs1, ft11, rup
                  fmax.s       ft10, ft1, fa2
                  fmv.w.x      fs3, s4
                  or           t1, s10, s6
                  addi         s2, a4, 1777
                  slli         a2, t1, 1
                  srl          tp, s3, s6
                  srl          ra, a3, s0
                  sll          t2, s1, a1
                  xori         s8, s8, 1160
                  remu         a2, ra, s1
                  srli         a2, s2, 31
                  fmul.s       fs5, ft8, fs2
                  xori         a2, s8, 42
                  slt          a4, t4, t1
                  and          a0, t6, t1
                  andi         s4, t3, -1686
                  fmin.s       fs0, ft8, fs8
                  addi         sp, s2, 415
                  fcvt.w.s     a0, fs3
                  slti         tp, s4, 545
                  mul          s8, s10, t1
                  mul          t4, t3, s1
                  slli         ra, a1, 26
                  nop
                  fclass.s     a5, fs7
                  fsgnjx.s     ft1, fs0, ft8
                  sltiu        ra, tp, 328
                  srli         a6, a1, 9
                  fsub.s       fs2, fs9, fa1, rmm
                  fclass.s     sp, ft8
                  srli         s6, a1, 24
                  fcvt.wu.s    s4, fa4, rdn
                  sra          a2, s0, t4
                  mul          t0, a5, a6
                  sra          a2, a0, s7
                  andi         ra, s9, 115
                  fadd.s       ft3, fs9, fs9, rne
                  nop
                  fle.s        a0, fs3, fa3
                  fclass.s     s10, fs2
                  div          a1, ra, s5
                  mul          t5, t1, t3
                  fcvt.s.w     ft7, gp, rtz
                  fadd.s       fa6, fs0, fa7
                  srai         s10, tp, 21
                  xori         gp, s6, -1667
                  nop
                  fmul.s       fa4, fs9, fa1
                  sltu         t0, t2, zero
                  fcvt.s.w     ft4, s3, rtz
                  ori          tp, t6, -1403
                  nop
                  srl          a5, s7, a3
                  lui          a6, 414777
                  mulh         t1, ra, s7
                  fcvt.w.s     s6, ft10
                  div          a7, zero, s0
                  fcvt.w.s     a3, fa0, rdn
                  lui          a5, 396237
                  fsub.s       fs2, fs3, fs1, rup
                  fmv.w.x      fa4, s6
                  ori          t4, s6, 871
                  xori         sp, a7, -21
                  nop
                  ori          s9, a3, -940
                  nop
                  srli         a1, s8, 20
                  sub          sp, a5, s3
                  slli         s9, a2, 4
                  sll          ra, gp, s6
                  lui          tp, 21374
                  nop
                  andi         t4, zero, -1967
                  addi         s5, s6, 46
                  fdiv.s       ft8, ft8, fa2
                  add          s5, a7, s5
                  fsgnjx.s     ft8, fs4, ft10
                  sltiu        a7, s0, 988
                  divu         s6, a7, t1
                  sll          t6, t4, t0
                  andi         t6, t5, -2026
                  slt          ra, sp, a2
                  sltiu        zero, t0, 491
                  fsub.s       fs11, fs8, fa7
                  fsub.s       fa2, fs10, fs1, rmm
                  mulhsu       s10, a0, tp
                  fmv.x.w      gp, ft8
                  srli         s2, a4, 23
                  divu         a4, t5, s5
                  fsgnj.s      fa0, fs11, fa1
                  ori          a0, t4, -1514
                  div          a5, s9, s11
                  and          t5, tp, s5
                  srl          sp, s4, a3
                  fsub.s       fa5, ft9, fs9, rmm
                  fmax.s       ft5, fs11, fa0
                  remu         s1, t0, a2
                  sll          t6, t1, a1
                  sltiu        a0, tp, -1310
                  slt          s8, sp, a4
                  srli         tp, t6, 30
                  fcvt.wu.s    t4, ft0, rdn
                  fsqrt.s      ft3, fa2, rup
                  slti         a2, s10, 736
                  fsub.s       ft9, fa5, ft3, rmm
                  mul          t2, t2, t4
                  mul          s0, s2, t3
                  fsgnjx.s     ft10, fs2, ft8
                  fadd.s       ft6, fa2, ft1
                  xori         a1, s4, -1226
                  feq.s        t6, ft8, fa1
                  sub          a5, s5, a5
                  fsgnj.s      fs5, fs9, ft3
                  auipc        s0, 232461
                  fsgnjn.s     ft4, ft5, ft10
                  fsub.s       ft11, fa4, fs2, rtz
                  sub          t1, zero, s2
                  auipc        s3, 814248
                  div          a1, tp, gp
                  feq.s        tp, fs6, fs2
                  rem          s9, s7, a5
                  lui          t2, 58611
                  xor          t2, a3, t3
                  fcvt.wu.s    tp, fs11, rmm
                  mul          a7, a3, gp
                  slt          a2, s3, t1
                  div          gp, t6, tp
                  slti         s6, sp, 663
                  mul          s3, a6, a6
                  fmv.x.w      s2, ft0
                  srl          s4, s6, t6
                  feq.s        a3, fa1, fa6
                  fsgnjx.s     fs5, fa4, fa3
                  fcvt.wu.s    a1, fa5, rup
                  srai         s9, t4, 7
                  mulhu        s2, s7, zero
                  fle.s        a3, fs1, fs6
                  fmin.s       fs9, fa4, ft5
                  flt.s        a6, ft7, fa7
                  nop
                  fcvt.s.w     fs0, sp
                  addi         zero, s5, 304
                  fsgnjn.s     ft6, fs11, fa7
                  fmv.x.w      s9, fs4
                  flt.s        s9, fs10, fa0
                  mulhu        s2, s6, gp
                  and          s4, s1, zero
                  mulhsu       s3, s10, s3
                  fclass.s     s0, fs0
                  nop
                  mul          t5, t0, a7
                  fclass.s     s10, ft3
                  fmv.w.x      ft10, s4
                  fcvt.wu.s    s4, ft11
                  fcvt.w.s     s3, fa7
                  fsub.s       ft3, fa7, fa6
                  fcvt.s.w     fs5, s9
                  fmin.s       fa6, ft11, fa4
                  remu         t1, a3, s11
                  sra          s9, s8, gp
                  sub          s2, ra, s11
                  fcvt.w.s     s2, ft10, rup
                  fmin.s       fa7, ft6, ft7
                  fsgnjx.s     fs4, ft10, fa0
                  srli         s6, s2, 12
                  fsgnjx.s     fs10, fs5, fa2
                  rem          s6, ra, t2
                  fle.s        a4, ft5, fs9
                  nop
                  div          t5, t2, s3
                  auipc        t0, 801936
                  xori         a1, a3, 1869
                  mulhu        t0, a7, t5
                  fsub.s       ft2, fa3, ft6
                  fsgnj.s      fa4, fs4, fs10
                  mulh         s6, sp, a1
                  fmul.s       fs0, ft5, ft1, rdn
                  fsgnj.s      ft2, fa7, fs4
                  sltu         t0, tp, sp
                  xori         a3, t0, -245
                  rem          s1, sp, t6
                  sltu         sp, s8, a7
                  fclass.s     s9, ft4
                  fmin.s       fa1, fs11, fa2
                  fmin.s       fa5, fs1, fs6
                  fcvt.s.wu    fs3, sp, rne
                  nop
                  ori          tp, sp, 1474
                  mul          gp, s0, s2
                  fdiv.s       ft1, fs0, fs4, rup
                  mulhu        s8, s6, s3
                  fle.s        t6, ft4, fs2
                  remu         t1, a1, ra
                  add          a0, a4, a6
                  ori          s6, t6, -1743
                  slli         a4, a4, 12
                  mulhsu       a0, t3, t5
                  fsgnjx.s     fa0, fs8, fa4
                  slli         t0, zero, 12
                  auipc        t2, 734233
                  and          s4, a5, gp
                  fcvt.w.s     zero, fs3
                  xori         s8, s10, 1052
                  mulhsu       ra, s1, a3
                  fclass.s     a3, fs1
                  lui          s10, 673652
                  fcvt.wu.s    t0, ft5, rup
                  remu         s1, a7, s0
                  fadd.s       fa4, fa1, fs2
                  xori         t0, s10, -93
                  fadd.s       fa4, ft10, ft3
                  fle.s        sp, fa0, ft8
                  fsgnj.s      fs9, ft3, ft8
                  remu         gp, t2, a7
                  rem          t5, a5, t1
                  divu         s4, zero, t3
                  mul          zero, tp, s6
                  fdiv.s       ft8, fs2, fs1
                  sltiu        s10, s9, -390
                  xori         s1, a2, -1679
                  fclass.s     s5, ft6
                  or           gp, t2, s0
                  fclass.s     ra, fs1
                  sll          t1, s9, s5
                  lui          t6, 705326
                  sra          a4, t3, gp
                  fsqrt.s      ft3, ft10
                  divu         s0, t1, t2
                  srai         t4, t6, 11
                  fsgnj.s      fs1, fs1, ft11
                  nop
                  srai         s5, s8, 24
                  fmin.s       fa7, ft4, ft5
                  sltiu        a7, s7, 1659
                  fmax.s       ft10, ft5, fa5
                  mulh         a7, t0, a6
                  fsub.s       fa6, ft8, fa5, rdn
                  srai         a7, t5, 26
                  feq.s        zero, ft9, fa3
                  fle.s        s1, fs3, ft9
                  remu         t6, gp, s6
                  mul          s3, t1, t0
                  slli         s5, t4, 15
                  auipc        t0, 889608
                  fmax.s       fa3, ft3, fa1
                  nop
                  fmv.w.x      fa1, s8
                  fsgnj.s      fs3, fa3, fs6
                  fsgnj.s      ft8, ft10, ft0
                  slli         s8, a2, 6
                  srl          gp, s1, t2
                  srai         a4, t5, 27
                  auipc        s5, 632092
                  fmv.x.w      a3, fs11
                  srl          t6, t1, s0
                  feq.s        s4, fa2, ft1
                  fmul.s       fs10, ft10, fa3
                  rem          s6, s6, s11
                  srl          a0, a1, s8
                  fle.s        tp, fa2, fa7
                  mulhsu       s5, t6, ra
                  slt          a5, s9, s6
                  sltiu        a4, t2, 1000
                  slli         a7, s5, 13
                  fsgnjx.s     fa5, ft6, fs7
                  feq.s        t2, fa3, ft6
                  remu         s10, zero, sp
                  remu         gp, a7, s9
                  srai         tp, gp, 0
                  sll          s1, t5, t6
                  and          t1, t2, s5
                  feq.s        a0, fs1, fs8
                  andi         s10, t4, 639
                  xor          s1, a3, t0
                  mulhu        s6, a0, s0
                  fcvt.w.s     zero, fa3, rne
                  fdiv.s       ft10, fs8, ft9
                  fcvt.s.w     fa3, t6, rne
                  fmv.w.x      fs4, s8
                  xori         a4, a1, -499
                  divu         s0, a2, gp
                  fdiv.s       fs3, fa3, fa6, rdn
                  slti         s9, s6, 1156
                  ori          a2, sp, 177
                  ori          t0, t0, 178
                  fmax.s       fs2, fs0, ft5
                  srli         ra, a2, 27
                  fcvt.s.w     ft2, s7
                  srai         s5, t1, 10
                  fdiv.s       fa2, ft0, fs2
                  mul          s6, s8, a3
                  feq.s        t6, fa5, fs8
                  sra          a5, s11, s9
                  add          s4, t0, t2
                  sltu         ra, a2, ra
                  sll          s8, a1, a3
                  sltu         a2, t3, a2
                  fcvt.w.s     ra, fs9
                  srl          tp, s7, s5
                  and          zero, ra, ra
                  mulh         t2, tp, ra
                  sltiu        sp, s5, -1610
                  or           s3, gp, a7
                  auipc        t1, 648290
                  fsgnjx.s     ft6, fs9, ft2
                  mul          tp, t5, t2
                  fadd.s       ft11, fs0, ft3
                  fcvt.wu.s    t5, fa1
                  slt          s2, a5, s4
                  slti         t4, t0, -223
                  slt          gp, zero, s8
                  srl          a0, zero, ra
                  xor          t1, s6, s7
                  fmv.w.x      fs3, a3
                  ori          a5, s0, -1546
                  sub          s0, a2, tp
                  rem          a5, a1, t5
                  slt          t0, s4, s3
                  srai         t2, s8, 2
                  slt          t6, a0, s9
                  divu         t5, t6, s2
                  sub          a2, s5, a2
                  fsqrt.s      ft4, ft4
                  lui          a2, 568328
                  xori         s1, a1, 184
                  sll          a4, s8, s3
                  fmv.w.x      ft6, t2
                  fmv.x.w      s0, ft10
                  auipc        a0, 226489
                  fcvt.wu.s    s4, fs1
                  sltiu        a2, s3, 1403
                  feq.s        tp, fa4, ft7
                  xori         a1, s8, -158
                  nop
                  andi         s8, a6, 620
                  add          s4, t2, t5
                  fmin.s       ft9, ft11, fs1
                  or           a3, t2, s5
                  remu         a6, gp, t3
                  rem          sp, s4, s7
                  xori         s3, s11, -220
                  lui          t2, 271353
                  srai         s0, s6, 25
                  feq.s        ra, fs8, ft9
                  srli         t2, s8, 6
                  xori         a2, a0, 1012
                  add          t5, gp, gp
                  fmv.w.x      fs11, s7
                  sub          s4, tp, s9
                  fmv.w.x      fs11, a5
                  mulhsu       a0, s9, t3
                  xori         a0, s6, -1090
                  rem          a0, t0, a1
                  flt.s        a1, fa5, fs2
                  fmul.s       fa5, fa6, ft4
                  fcvt.wu.s    sp, ft2
                  ori          a1, s0, -463
                  fcvt.s.w     ft3, a4
                  xori         s9, a2, 584
                  fcvt.w.s     a2, fs7
                  fsqrt.s      ft0, fs11
                  fsqrt.s      ft2, fs9, rne
                  fmv.x.w      t2, ft10
                  flt.s        sp, ft9, ft11
                  fsqrt.s      fa5, ft11, rup
                  fsgnj.s      ft7, ft5, ft3
                  rem          s9, s8, a0
                  feq.s        t0, ft2, fa1
                  lui          tp, 928057
                  sub          t2, a1, a6
                  ori          t1, s5, 62
                  fdiv.s       ft11, fs6, fa0, rup
                  flt.s        a1, fs5, fs4
                  sll          s5, s10, t5
                  fdiv.s       ft0, fa2, ft5, rmm
                  srl          gp, t1, a1
                  fsqrt.s      fs5, fs5, rtz
                  fmin.s       fa4, fa6, ft1
                  and          s5, tp, t6
                  fcvt.wu.s    ra, fs2, rup
                  and          t5, t0, a3
                  fcvt.s.wu    ft11, a5
                  mulh         a6, t0, s5
                  mulhsu       s10, tp, t0
                  remu         s2, a3, t3
                  fle.s        s1, fa6, fs1
                  or           s10, a4, sp
                  sub          s9, t6, t5
                  mulh         t5, a5, a4
                  feq.s        a2, ft4, fa4
                  ori          t6, gp, -1758
                  sltiu        s2, t0, -1387
                  fsgnjn.s     fs8, ft11, fs6
                  xori         gp, s10, -817
                  fmv.w.x      fs8, a2
                  rem          t2, a0, t5
                  lui          ra, 662166
                  flt.s        s0, fs2, ft7
                  sll          t4, a4, tp
                  fdiv.s       ft0, fs9, fs8, rne
                  divu         s1, a5, s7
                  sra          s6, t5, t4
                  fcvt.s.w     fa1, a2, rmm
                  sra          ra, s6, t2
                  nop
                  sltiu        s1, s0, -1510
                  fmv.x.w      gp, ft9
                  rem          s6, s11, a0
                  fsgnj.s      fs6, fs6, ft0
                  fmv.w.x      fs10, s4
                  ori          s2, s7, -1356
                  mulh         s5, a4, a6
                  srai         s2, t0, 7
                  fmv.x.w      a3, fa3
                  auipc        s4, 778099
                  flt.s        a4, fs5, fs3
                  fmv.w.x      ft2, s9
                  fdiv.s       fs5, fa2, ft7
                  fsub.s       fs6, ft5, fs10, rtz
                  and          s3, t6, a6
                  add          a4, s0, s6
                  fdiv.s       ft7, fs1, fs5
                  fle.s        tp, ft6, fs1
                  slt          s3, sp, s11
                  srai         a7, s8, 5
                  or           s5, a3, s10
                  fcvt.w.s     a4, fs4
                  and          sp, t4, a0
                  mul          sp, s11, s6
                  ori          zero, s7, 1849
                  fcvt.w.s     a6, fs2, rdn
                  srli         t5, a6, 16
                  fmv.x.w      s10, fa7
                  fcvt.s.w     fa2, gp, rtz
                  rem          t5, s7, a2
                  mulhsu       s2, a4, s11
                  addi         ra, zero, 1366
                  or           t4, s5, t2
                  fsub.s       ft10, fs6, ft10
                  divu         gp, t0, a5
                  lui          ra, 212508
                  add          t5, s11, a3
                  srli         s5, tp, 15
                  divu         s9, s4, s10
                  fsqrt.s      fs0, ft7
                  mulh         gp, s4, s9
                  xor          t2, tp, s0
                  andi         t4, sp, 1304
                  sltu         t6, s5, t6
                  xor          s6, s7, a4
                  feq.s        s2, fs6, fa6
                  fmv.x.w      a4, ft8
                  mulh         t0, tp, t5
                  mulhu        sp, s11, sp
                  mul          s4, t4, sp
                  fmax.s       fs10, fs0, fs0
                  fsgnj.s      ft9, fa0, ft1
                  fmv.x.w      s2, fa7
                  fcvt.wu.s    s3, fa7, rup
                  slt          zero, t0, s5
                  divu         a3, t2, a5
                  div          t0, a5, tp
                  slli         ra, s0, 3
                  fcvt.w.s     a2, fs1, rne
                  fdiv.s       fa1, fs5, fs9, rtz
                  auipc        s10, 394249
                  slt          s6, tp, s10
                  fmin.s       ft0, fs9, fs3
                  fsgnj.s      ft1, fs2, fa5
                  slti         s1, t5, -37
                  flt.s        a0, ft4, fs6
                  sub          zero, zero, a1
                  fmul.s       fs7, fa6, fs6
                  mulh         a1, s11, s5
                  sra          s8, ra, s7
                  mul          s3, t2, t3
                  fsgnj.s      ft0, fa5, ft0
                  fcvt.wu.s    a7, fs9
                  fcvt.wu.s    gp, ft11
                  fadd.s       fs5, fs10, fs1, rtz
                  mulh         a0, a6, t2
                  fsub.s       fs5, ft5, ft10, rup
                  fsgnjx.s     fs6, ft5, fa2
                  mulhu        t4, s8, t5
                  fmax.s       ft7, ft2, fa5
                  sltu         s3, a1, s3
                  srai         sp, s10, 14
                  fsqrt.s      ft9, fa1, rup
                  fsqrt.s      fs0, fa1, rdn
                  fsub.s       fa5, fs9, ft10, rmm
                  slt          zero, a3, t5
                  xori         t0, s3, 333
                  feq.s        sp, fa1, ft9
                  and          a2, t1, a0
                  feq.s        t5, fa2, ft11
                  fsgnjx.s     fs9, ft3, fs2
                  sltiu        s10, t2, -863
                  fmv.x.w      s8, fs1
                  mul          tp, a3, s4
                  fclass.s     s2, ft4
                  fsgnjx.s     fs3, ft4, ft11
                  sll          s8, s2, a0
                  add          a0, s1, t0
                  mulhu        a3, t2, s11
                  sub          a5, s6, a0
                  fmv.w.x      ft10, s2
                  fcvt.w.s     t2, ft10, rdn
                  fle.s        sp, fs0, fs11
                  or           a7, s2, t0
                  slt          a1, t5, s1
                  remu         zero, s10, s0
                  fsgnjx.s     ft8, fs3, fs10
                  mulhsu       a1, a3, gp
                  slt          a6, tp, a1
                  flt.s        t1, fa4, ft9
                  fsgnjx.s     fs8, ft8, fa6
                  remu         t2, s5, gp
                  fdiv.s       fa2, fs9, fs10, rmm
                  fsqrt.s      ft4, ft8, rtz
                  nop
                  fmv.w.x      ft1, s2
                  nop
                  srli         s10, s6, 31
                  sll          t6, t5, s1
                  auipc        a5, 549899
                  fadd.s       fs6, fs11, fa3
                  slti         s0, a3, 225
                  remu         a7, s11, s4
                  fmv.x.w      gp, fs6
                  slt          a6, s2, s8
                  srai         s4, s11, 6
                  fmv.w.x      fs5, t0
                  nop
                  fclass.s     s4, fa1
                  xori         s9, s2, 1062
                  fcvt.s.w     ft9, s5, rdn
                  or           a7, a1, sp
                  fcvt.s.w     fs4, a2, rmm
                  mulhu        a7, a1, s0
                  fsub.s       fs3, fs0, fa4, rtz
                  sll          a5, s10, s10
                  fadd.s       ft8, ft2, fs10, rup
                  fadd.s       fs3, ft11, ft7
                  slt          a0, a3, t0
                  nop
                  nop
                  or           s10, a3, s11
                  flt.s        t0, fs10, fa2
                  fsgnjx.s     ft11, ft9, fa6
                  rem          a4, t2, s8
                  fmul.s       ft6, fs8, ft3
                  and          t1, s11, t2
                  flt.s        a5, fa1, ft6
                  fcvt.s.w     fs7, s11, rup
                  fmul.s       ft3, fs1, fa6, rdn
                  fadd.s       ft6, ft8, ft6
                  sll          s6, s5, a0
                  and          t4, tp, a3
                  lui          tp, 33541
                  fsgnjx.s     ft0, fs1, fa3
                  and          a5, a2, s3
                  div          s5, s2, s9
                  fmv.w.x      ft11, a0
                  fsgnj.s      ft2, fs3, ft1
                  addi         t6, s3, 1137
                  divu         s8, t5, a6
                  fcvt.s.w     fa4, s8
                  fsub.s       fa7, ft0, ft7
                  fle.s        a0, fa7, fs2
                  remu         t2, t6, a2
                  ori          sp, t2, -618
                  lui          a5, 802742
                  fcvt.s.wu    fs9, tp, rmm
                  fmax.s       fa6, fa0, fa7
                  or           t4, s8, a5
                  or           ra, s4, a7
                  fmul.s       fs9, fa4, ft9
                  nop
                  fsgnjx.s     fa5, ft9, fa6
                  fcvt.wu.s    a6, fs9
                  fsgnjn.s     fa7, fs11, ft7
                  fmul.s       fs0, ft9, ft2, rtz
                  fcvt.s.wu    ft7, sp, rmm
                  xor          s8, t2, s4
                  lui          s10, 442908
                  mul          a4, a4, t3
                  add          a3, zero, s7
                  mulh         s6, a0, s8
                  ori          t0, ra, -1112
                  fle.s        s10, fa5, fs3
                  or           s3, s9, tp
                  mulhsu       s3, s11, s7
                  lui          a6, 58419
                  divu         s2, a1, s1
                  srli         a6, a6, 6
                  fmin.s       fs4, ft2, fs7
                  sltu         t0, zero, ra
                  fdiv.s       ft1, fa2, ft3
                  fmv.x.w      t1, fs2
                  fsgnjn.s     fs10, ft10, fs8
                  fsgnjn.s     fa3, ft9, ft1
                  add          s2, s6, tp
                  fcvt.s.wu    fs6, s0, rup
                  mul          t0, tp, s10
                  sltiu        tp, s2, 1730
                  fmv.x.w      s2, fs3
                  addi         t1, a1, 671
                  or           a0, gp, s7
                  div          t0, tp, s9
                  fle.s        a3, fs1, fa3
                  mul          a5, a7, t5
                  rem          s9, s6, s4
                  fmv.w.x      ft3, t0
                  lui          t2, 1007245
                  mul          s6, t0, a6
                  sltu         tp, a0, s11
                  mulh         a5, t5, zero
                  fsgnjn.s     ft2, ft7, fs7
                  xor          a0, a3, ra
                  fadd.s       fa0, ft2, ft2, rdn
                  nop
                  xor          t5, s0, s0
                  fdiv.s       ft11, fa2, fa4, rtz
                  divu         s3, sp, s8
                  sub          a4, tp, a7
                  sltiu        s0, t0, -1329
                  divu         t1, s11, ra
                  fmul.s       ft3, fs0, fs5, rup
                  andi         gp, s4, -1422
                  slt          ra, a3, a6
                  feq.s        sp, fa1, fs1
                  feq.s        s4, fa6, fs11
                  fcvt.wu.s    s6, ft6, rtz
                  fmul.s       fs6, fs9, fa2
                  add          t6, a2, a7
                  add          gp, a7, s0
                  sltiu        zero, zero, -1329
                  sub          t0, s0, a3
                  fsub.s       fa6, fs2, fs11
                  fcvt.w.s     t5, ft11
                  flt.s        a3, fa5, fs9
                  sub          s9, t2, a6
                  fdiv.s       fa6, ft5, fa1
                  div          s2, t1, a5
                  lui          tp, 418052
                  fsgnjx.s     fs8, ft1, fs1
                  feq.s        s5, ft1, ft4
                  fclass.s     a1, fs5
                  fsgnj.s      fs5, ft11, fs9
                  srai         t1, a2, 26
                  srai         t4, t6, 21
                  fcvt.s.w     fa4, s3, rmm
                  ori          t2, s5, 165
                  and          a2, zero, t0
                  fmin.s       ft9, ft5, fa0
                  mulhu        t0, s8, a1
                  addi         a0, t6, -444
                  sra          a5, s3, a1
                  mulhu        t0, s10, s7
                  fsub.s       fa2, fs7, fs10
                  auipc        t5, 897172
                  fmin.s       ft6, fa0, fa0
                  sltu         t2, t5, s8
                  fmv.w.x      ft2, s9
                  xori         s1, a6, -54
                  lui          sp, 422785
                  sub          s1, a7, s10
                  fmin.s       fs9, fs3, fs0
                  fle.s        s4, fa7, fa0
                  srai         s0, t4, 9
                  mul          t1, t1, s8
                  fmv.x.w      s5, fa2
                  and          s8, a4, ra
                  fsqrt.s      fs6, fs8, rne
                  divu         t1, a3, s4
                  fmv.w.x      fa6, t0
                  srli         a4, zero, 1
                  slti         tp, s1, 440
                  sltiu        s1, a1, -1919
                  sltiu        a4, s0, -878
                  sra          a5, s0, t2
                  andi         tp, ra, 1998
                  fsgnj.s      fs2, fs8, ft8
                  sltiu        t5, s0, 1822
                  fsgnjx.s     ft9, fa6, ft6
                  mul          s3, a4, t3
                  srli         ra, a6, 11
                  fadd.s       ft6, fa0, fa5
                  andi         a3, a1, -790
                  mulhsu       a5, a3, s6
                  fadd.s       fs10, fs9, fs10
                  fmul.s       fa2, ft3, fs6
                  xori         a3, t4, 202
                  or           t2, s8, t6
                  divu         s5, s0, a3
                  fle.s        t1, fs0, fa2
                  fmax.s       fs0, ft5, fs1
                  sll          ra, s10, t3
                  slti         t6, t3, -1244
                  and          t0, s11, zero
                  div          a3, t2, zero
                  div          s2, a0, s2
                  fcvt.s.w     fs10, s4
                  fle.s        tp, fs7, ft7
                  flt.s        s4, fa7, fa3
                  fcvt.s.w     ft6, s11, rne
                  lui          t4, 801444
                  feq.s        s5, ft3, ft6
                  divu         a0, s8, t5
                  fsqrt.s      fa3, ft9
                  mul          a1, s1, a1
                  sltu         a0, t3, s8
                  fle.s        t4, fs6, fa0
                  xor          a5, a1, s1
                  fsgnj.s      ft8, ft11, fs1
                  add          s3, s7, t2
                  fmin.s       fs11, fs0, ft4
                  fcvt.s.w     ft9, ra, rup
                  fcvt.w.s     a7, fs8
                  fadd.s       fs9, ft10, fs5, rmm
                  srai         a0, a4, 30
                  srli         a1, gp, 15
                  flt.s        s5, ft6, fs4
                  slt          s5, s2, s6
                  fcvt.s.wu    ft5, a4
                  flt.s        a4, ft6, fa6
                  nop
                  fsub.s       fs11, ft0, ft8, rdn
                  div          s2, zero, s2
                  mulhu        s2, s6, t1
                  fcvt.w.s     ra, ft5, rne
                  div          s8, t6, t1
                  lui          a6, 347166
                  fcvt.wu.s    a3, fs1, rup
                  sub          a5, s2, s4
                  fcvt.wu.s    t4, ft5
                  slli         s9, s2, 20
                  srl          s1, t6, a1
                  nop
                  sltu         a2, s6, a5
                  fcvt.wu.s    s10, fs2
                  fle.s        s0, fs8, ft6
                  add          s10, gp, s1
                  srli         tp, s10, 4
                  xor          a4, s3, a5
                  fcvt.s.w     fa3, ra
                  fsgnjx.s     ft9, fa5, fs0
                  andi         a4, ra, -20
                  xori         ra, s0, -179
                  fmv.w.x      fa5, a3
                  slti         s3, a0, 1075
                  fmax.s       fs3, fs2, fs10
                  fcvt.s.wu    fs10, a5
                  mulhu        a2, s6, s2
                  fcvt.s.wu    fa7, t4
                  fle.s        a5, fa7, ft7
                  divu         a6, s11, t5
                  fle.s        a3, ft11, ft1
                  srai         a6, a6, 15
                  fsqrt.s      ft4, fs9, rne
                  remu         t2, zero, s9
                  xori         s5, a2, 1656
                  fadd.s       fs2, ft11, fs3
                  rem          a7, s9, s4
                  fmax.s       ft9, fs10, fa2
                  divu         t2, s3, s6
                  mul          a6, a2, s10
                  mulh         t5, s9, s0
                  fle.s        a5, fs6, fa1
                  fsgnjx.s     ft0, fs11, fs3
                  fsgnj.s      fs6, ft5, fs0
                  add          s6, ra, s4
                  sltiu        t1, a0, -335
                  sltu         s10, t5, a0
                  xori         s9, s3, -1482
                  fclass.s     sp, fa2
                  or           t4, zero, s6
                  fmv.x.w      ra, ft11
                  srli         a4, t4, 14
                  srli         a6, s2, 26
                  fmul.s       fs9, fs0, ft3, rup
                  mulhu        s5, t4, s10
                  divu         gp, a7, a0
                  srl          s4, s0, a0
                  sub          t0, s3, a7
                  ori          s6, s9, 1058
                  fsub.s       fs9, ft4, ft3
                  mul          t1, s9, s8
                  fmul.s       ft9, ft3, fa7, rtz
                  fmv.w.x      fa7, zero
                  mulh         a5, a1, s9
                  mulhu        s10, t6, t5
                  srai         a7, t5, 0
                  fclass.s     t1, ft0
                  and          a2, a5, s11
                  fsub.s       ft0, ft5, ft11
                  sltu         zero, a2, s4
                  mulh         gp, a4, a3
                  sll          zero, t5, gp
                  fsub.s       ft0, fs2, ft9
                  srli         a0, a3, 25
                  nop
                  feq.s        zero, fs6, ft11
                  slti         s6, a7, 728
                  mulhu        a4, zero, a6
                  nop
                  xor          t5, t2, s2
                  remu         a0, s3, gp
                  sra          a3, a0, s5
                  sra          ra, s6, t2
                  fsgnj.s      ft9, fa1, fs1
                  add          sp, s0, a5
                  srl          zero, gp, tp
                  mulhu        a2, s1, a7
                  xori         s4, s9, -1562
                  andi         t4, t5, -1272
                  fcvt.s.w     ft9, sp, rne
                  mulh         tp, t6, sp
                  or           zero, t2, t6
                  div          s2, a0, t0
                  auipc        gp, 768902
                  fcvt.wu.s    sp, fs1
                  remu         a0, s4, a0
                  and          a3, s10, gp
                  slti         s5, tp, 1380
                  auipc        t2, 127828
                  or           a0, s4, t5
                  fmax.s       ft0, fs5, ft6
                  fsgnjn.s     ft11, ft4, fs6
                  srl          t1, a7, t0
                  flt.s        a4, ft10, fs3
                  mulhsu       s5, s0, s1
                  auipc        a7, 663069
                  or           a4, gp, a3
                  fsgnjx.s     ft10, fs6, fs6
                  fmv.w.x      fs9, a5
                  rem          s5, t4, s10
                  mulh         s0, s7, s10
                  sll          s6, s9, a6
                  fmv.w.x      fs6, s1
                  fcvt.s.wu    fa5, ra
                  fmin.s       ft0, ft7, fs0
                  fadd.s       fs11, fa7, fa5
                  fcvt.w.s     t1, fa3, rmm
                  flt.s        a4, fa3, fs7
                  fsgnjn.s     ft4, ft9, ft11
                  fdiv.s       ft0, ft0, ft3, rne
                  srai         a1, t5, 30
                  divu         s10, s10, ra
                  lui          s4, 18928
                  mulhu        t6, a6, s0
                  nop
                  div          a2, a4, gp
                  slti         t5, t4, 1885
                  srli         a2, ra, 1
                  fclass.s     s4, fs1
                  fsub.s       fa1, fa0, ft1, rup
                  srai         s1, t1, 12
                  xori         a2, s6, -906
                  mulhu        s3, s2, t3
                  nop
                  fsgnj.s      fa6, fs7, fs10
                  or           s4, a0, a7
                  slli         a4, ra, 2
                  slti         t0, s0, -1276
                  fclass.s     t5, ft3
                  fcvt.w.s     s6, ft7
                  mulhsu       s5, t2, sp
                  remu         tp, s5, a5
                  fcvt.wu.s    a7, fa0, rtz
                  srli         s0, a5, 26
                  feq.s        ra, ft3, fa4
                  div          s3, sp, ra
                  srl          s4, a4, s3
                  or           s3, a6, a5
                  srli         t2, t4, 9
                  srai         s2, a2, 24
                  mulhu        a2, t3, t0
                  sra          s8, a6, a5
                  sll          t0, a6, s5
                  feq.s        a5, ft5, fs9
                  srl          a6, a3, s7
                  slt          gp, s11, s10
                  srai         s9, s11, 8
                  fsgnjn.s     ft2, fa0, fs1
                  divu         sp, s2, s4
                  fsgnjx.s     ft8, ft10, ft4
                  fmv.x.w      a5, ft8
                  fcvt.s.w     ft0, gp
                  rem          s2, a4, s3
                  xor          t5, s3, s3
                  fcvt.s.wu    fa1, a5, rdn
                  xori         a0, t0, -317
                  mul          a0, a4, s11
                  sltiu        a7, a3, 2022
                  remu         zero, s10, t6
                  fmul.s       ft9, ft0, fs4
                  fcvt.w.s     a5, ft4
                  ori          a3, a5, -1956
                  rem          t6, s1, t2
                  add          a3, t5, s1
                  slt          a5, s1, s7
                  flt.s        gp, fs5, ft6
                  fsgnjn.s     fa7, ft1, fs2
                  addi         a2, a0, 56
                  sll          t4, s5, a0
                  remu         a2, s7, a4
                  remu         sp, ra, s2
                  fdiv.s       fa1, fa4, fs0, rup
                  srl          s3, s5, s3
                  fadd.s       ft8, fa0, ft7
                  or           t6, gp, zero
                  slt          s1, sp, t4
                  rem          s4, ra, s2
                  addi         tp, t3, 1483
                  mulhu        s0, gp, t2
                  feq.s        s4, fa5, ft8
                  srli         a7, s1, 22
                  slt          t4, ra, t1
                  fsgnjx.s     fs7, fs9, fs6
                  fsgnjn.s     ft10, fa2, fa3
                  fcvt.w.s     a3, fs1
                  fcvt.s.wu    fs8, s7, rmm
                  mulhsu       a5, t0, a3
                  fcvt.s.wu    fa4, t6, rtz
                  mul          a7, s2, t2
                  lui          gp, 962627
                  sub          t1, s11, t5
                  divu         ra, s5, s6
                  fsgnj.s      fs1, fs3, ft4
                  divu         a0, a6, t3
                  fmax.s       ft0, fs0, ft2
                  feq.s        t4, fa5, fa5
                  fmv.w.x      ft0, s1
                  fcvt.s.wu    fa6, zero
                  fle.s        t4, fa4, fa1
                  slti         s6, a7, 1609
                  sltu         gp, a5, s11
                  auipc        a2, 858929
                  fmv.w.x      fs10, s5
                  fdiv.s       fa6, fa5, fs8
                  ori          s1, s5, 1476
                  fmv.w.x      fs2, a1
                  xor          s0, s8, ra
                  fsqrt.s      fa5, ft0
                  mulhsu       t2, t0, a2
                  ori          a6, a1, 482
                  sltiu        tp, s0, -1327
                  nop
                  fmul.s       fa5, fa7, ft1, rdn
                  slti         a5, a2, 2047
                  fsqrt.s      fs0, fs4, rtz
                  srl          a2, t0, sp
                  lui          s1, 199681
                  xor          a1, zero, t5
                  divu         t2, a7, t5
                  sltu         ra, t6, a2
                  fmv.x.w      s1, ft3
                  feq.s        a0, fa6, ft4
                  fsub.s       ft2, fs3, ft4, rtz
                  remu         s2, s9, sp
                  ori          gp, t6, -1137
                  remu         a3, s6, s11
                  mulhu        s0, a6, s0
                  fcvt.wu.s    a1, fs11
                  fmv.w.x      fs10, s2
                  fdiv.s       ft5, fs6, fs8, rup
                  nop
                  flt.s        s1, fa4, fs10
                  fmv.x.w      sp, ft4
                  fsgnjx.s     fs11, ft8, fa5
                  slli         s9, t6, 12
                  sll          t2, zero, a2
                  slli         t5, zero, 10
                  addi         s5, s7, 1421
                  lui          a2, 181172
                  slli         t1, s6, 12
                  rem          zero, s7, tp
                  or           a0, s3, a4
                  fsub.s       ft10, fs7, fs0, rne
                  and          a4, t3, a7
                  fclass.s     a7, fs7
                  fsub.s       ft0, fa5, ft10, rmm
                  xor          a4, s5, t5
                  fsgnj.s      fs3, ft11, ft3
                  sltu         a3, s0, t6
                  slt          t1, s3, ra
                  or           t2, t3, t6
                  mulhu        t6, t0, t0
                  andi         s0, a1, 1082
                  ori          s10, t3, 841
                  addi         t6, s4, -1267
                  fmv.w.x      fs9, s0
                  sra          s1, t3, a7
                  fclass.s     s2, ft9
                  mulhu        a4, gp, t0
                  fsgnjn.s     fa1, fs5, fa1
                  fcvt.s.wu    ft8, t0, rup
                  fmv.x.w      s4, fs1
                  srl          a6, s4, s4
                  div          s2, gp, s7
                  or           s10, a5, s0
                  feq.s        sp, fs9, ft10
                  nop
                  srli         gp, a1, 3
                  fmv.x.w      a6, ft6
                  addi         s8, a4, 817
                  auipc        a3, 553751
                  fsub.s       ft0, fs11, fa6
                  fmv.w.x      fa6, a3
                  fsub.s       ft7, fa2, fs7
                  lui          a2, 143784
                  fmul.s       fa0, fa5, ft10
                  srl          t1, s0, s7
                  fmax.s       fs10, fa3, ft11
                  fmin.s       fs8, fa1, ft2
                  fmv.x.w      s4, fs1
                  srai         tp, a2, 12
                  fsgnjx.s     ft10, fa0, ft1
                  lui          a2, 288092
                  fcvt.s.w     fs2, s3
                  xor          tp, t6, s11
                  feq.s        s0, fa7, ft6
                  or           a6, zero, zero
                  fsgnj.s      fa1, fs6, fs6
                  sra          s6, zero, s3
                  fmv.x.w      t5, ft11
                  srai         a3, a0, 28
                  auipc        s4, 325556
                  fmin.s       fa6, fa3, fa1
                  sra          s10, a1, s2
                  mul          t1, s5, t6
                  fmul.s       fs9, fs3, fa4
                  fsqrt.s      ft7, fs7, rtz
                  fadd.s       fa4, ft0, fs5, rdn
                  div          a6, s7, t0
                  fcvt.s.w     fs6, t6, rdn
                  fmul.s       fs1, ft1, fs10, rne
                  remu         ra, t3, a5
                  srli         s4, t5, 17
                  fmv.x.w      s9, fs1
                  srl          t5, t6, gp
                  remu         a1, a2, s3
                  sll          a3, s2, a7
                  sub          sp, t6, zero
                  sltiu        a6, a6, 1463
                  fmv.w.x      fs6, s5
                  fmul.s       fs6, ft9, fa0, rdn
                  remu         s2, ra, s4
                  addi         s8, s4, -1674
                  xori         ra, a4, 1505
                  rem          s4, s4, s10
                  fclass.s     a1, fs7
                  or           s0, a4, s2
                  slti         sp, s3, 1753
                  fcvt.s.wu    fs9, t2
                  srai         a7, s5, 27
                  slli         s5, a7, 2
                  andi         s1, s10, -1218
                  fle.s        t2, ft5, ft10
                  divu         t4, a5, sp
                  add          a4, s2, s0
                  slti         s1, s8, -1493
                  fle.s        a2, fs4, fs1
                  fmin.s       fa3, ft8, fs3
                  fsgnjn.s     ft1, fs1, fa3
                  and          s1, sp, s7
                  fcvt.w.s     s10, ft6
                  slti         a0, tp, -757
                  sll          t0, zero, t1
                  sll          t2, s4, s1
                  fcvt.w.s     a6, ft4, rtz
                  fclass.s     sp, ft7
                  fle.s        s10, fa4, ft3
                  sltu         t2, t3, t4
                  srli         s9, t5, 20
                  xori         t0, a0, -148
                  fcvt.s.wu    ft8, s5
                  fmax.s       ft4, fa7, fa5
                  sltiu        s0, t4, 1083
                  fmin.s       fs7, fs4, fa3
                  fsgnjn.s     fs9, fs10, fs1
                  mulhu        s2, a0, gp
                  fle.s        s0, fs5, fa4
                  nop
                  xori         s10, t1, -732
                  fsub.s       ft11, fs9, fa4, rup
                  fmax.s       fs10, ft4, fs8
                  sltu         s8, s1, s8
                  fmin.s       fs3, fs3, ft10
                  sltu         gp, s9, s10
                  lui          a3, 94988
                  slli         a4, a2, 12
                  fmin.s       fs0, fs3, fa5
                  fle.s        s1, fa1, fa3
                  fadd.s       ft4, fa5, fa6
                  rem          a4, s5, a6
                  xori         s3, s1, 1922
                  fcvt.wu.s    s4, fa5
                  addi         t6, s10, 1966
                  fmax.s       fs2, ft0, ft0
                  ori          zero, t3, -522
                  fmin.s       fa5, fa7, fa2
                  xor          s0, a5, a2
                  fclass.s     a0, fs9
                  slli         t2, s7, 15
                  sra          a7, tp, t2
                  fmul.s       ft0, fs8, ft1
                  fcvt.wu.s    a5, ft3
                  and          a7, a7, t2
                  addi         s8, s4, 333
                  and          s6, ra, t4
                  sltiu        s5, s5, -197
                  fsub.s       fs5, fa1, fa1
                  fmul.s       ft7, fs4, ft6
                  fmin.s       fa4, fs0, ft4
                  fsqrt.s      fs0, fs2, rdn
                  andi         s0, a4, 562
                  sltiu        a2, s1, 1031
                  mulhsu       t1, a1, s11
                  fle.s        sp, fs11, ft10
                  and          t0, a5, tp
                  mul          ra, t4, s11
                  fcvt.w.s     gp, ft11, rne
                  auipc        s1, 994481
                  feq.s        ra, fs9, ft10
                  nop
                  remu         sp, s5, a7
                  sltiu        s2, t1, -1141
                  rem          s10, gp, tp
                  slli         tp, s2, 13
                  sltu         sp, s5, a0
                  fsgnjx.s     fs3, fs2, ft4
                  fcvt.s.w     fa3, a7, rmm
                  fsgnjx.s     ft7, ft3, fa4
                  or           s10, s3, t3
                  srli         a6, s8, 28
                  xor          ra, zero, a2
                  sltiu        a2, a1, -1356
                  and          s3, s4, a1
                  mulh         a0, a4, a7
                  sub          t5, s7, s6
                  srai         zero, zero, 11
                  fdiv.s       fs10, fa1, fa4, rdn
                  mulh         a4, a1, a6
                  flt.s        t5, fa1, fa3
                  add          zero, a4, t2
                  fmv.x.w      s2, ft4
                  add          a1, a5, tp
                  sub          t2, s11, t3
                  slt          t2, a6, a1
                  fsgnjn.s     fs0, ft4, ft11
                  fmin.s       fa4, fs8, fs2
                  fcvt.w.s     a3, ft1
                  sra          gp, s3, a0
                  srli         a5, a7, 21
                  mulhu        t6, gp, s6
                  fsub.s       fa1, fs8, ft5
                  fmul.s       ft2, fs9, ft0, rdn
                  srl          t1, t4, tp
                  lui          t5, 83738
                  mulhsu       zero, sp, s7
                  nop
                  div          s0, a6, sp
                  mul          a7, ra, sp
                  slti         s5, gp, 1418
                  fclass.s     s10, fa2
                  fle.s        s9, fs4, ft3
                  ori          a4, t4, -1975
                  divu         a5, zero, s7
                  nop
                  fmv.w.x      fa5, sp
                  auipc        t6, 445980
                  slti         gp, t3, -1006
                  slt          a4, s1, ra
                  fcvt.s.wu    fa0, s4
                  ori          s6, s11, 1057
                  sltiu        a5, s8, -136
                  feq.s        a0, fs7, fs2
                  fcvt.s.w     fa4, s2, rdn
                  slt          zero, t3, zero
                  rem          s9, sp, t4
                  add          a6, s5, ra
                  fmv.w.x      ft0, t5
                  fsub.s       ft6, fs3, ft7
                  fsqrt.s      fs0, fa6, rup
                  srli         a7, s8, 8
                  divu         t0, t6, s10
                  fclass.s     a1, fs4
                  sltiu        a4, a0, -1803
                  srai         a7, t3, 16
                  xor          a5, s6, a3
                  fsgnjx.s     fa6, fa2, ft4
                  feq.s        s10, fa6, ft4
                  slti         sp, sp, -1430
                  sltiu        s0, s9, 1295
                  srai         t5, a3, 22
                  slt          a2, ra, a4
                  andi         s9, tp, -1100
                  and          a2, s10, t6
                  fmax.s       fa4, fs8, ft6
                  andi         t4, t3, -1929
                  fmv.w.x      fs6, s9
                  and          sp, a4, s11
                  fle.s        t2, fs11, ft2
                  lui          s10, 306319
                  fsgnj.s      fs2, ft6, fs10
                  flt.s        sp, fa4, ft8
                  mulhu        a3, s11, a3
                  xori         ra, s8, 1606
                  fle.s        s0, ft9, fs3
                  flt.s        s2, fs10, ft7
                  fmul.s       ft11, ft11, fa3, rne
                  mulhu        a3, s3, s4
                  slt          s9, a0, t6
                  xori         ra, t5, -1015
                  lui          s6, 755905
                  add          a4, sp, a2
                  fsgnjn.s     fs4, fs10, ft0
                  andi         ra, a7, 1909
                  fcvt.s.w     fs1, a2, rdn
                  xor          a5, s5, a2
                  fcvt.s.w     fs7, t6, rup
                  fmv.x.w      s4, ft2
                  addi         s10, s4, 1599
                  sltu         t1, s11, a1
                  sub          s4, a1, s1
                  mul          s5, s6, s3
                  remu         zero, s7, a6
                  fsgnjn.s     fs2, fa2, fa3
                  divu         a6, a1, s9
                  nop
                  lui          t5, 745453
                  remu         tp, t0, t3
                  div          tp, t0, a1
                  xori         t4, a6, 1934
                  lui          s1, 473077
                  mulh         a0, a6, t3
                  sltu         a2, s4, s10
                  add          s3, a1, t3
                  sll          s8, tp, zero
                  add          gp, a5, a3
                  fmul.s       fa4, fs4, fa5
                  sll          a2, a7, t2
                  mulhsu       t0, a7, s4
                  slti         s0, t1, 405
                  fmv.x.w      t0, ft3
                  fcvt.s.wu    fa4, s9, rdn
                  mul          zero, s1, a5
                  sltu         a4, t0, t0
                  fclass.s     a5, fs8
                  mulh         a2, t0, gp
                  fsqrt.s      ft5, fa2, rmm
                  slt          t1, s8, sp
                  addi         t4, s10, 456
                  fcvt.s.wu    fa1, a6
                  fcvt.s.wu    fs3, ra, rne
                  fcvt.s.wu    fa3, s9, rtz
                  feq.s        a3, ft8, fa2
                  fmin.s       fa2, fs0, fs10
                  feq.s        s10, fs10, fs6
                  fcvt.w.s     a3, ft7
                  slt          s5, t5, a4
                  fsgnj.s      ft7, ft7, ft9
                  srl          a2, a2, s2
                  divu         a5, sp, gp
                  fsgnj.s      fa5, ft7, ft0
                  mulhsu       t5, a5, a1
                  mulhsu       s4, a1, s3
                  fdiv.s       fa1, ft7, fa1, rdn
                  div          s8, s5, s1
                  sra          s5, t5, t6
                  fcvt.w.s     t5, ft2
                  lui          a2, 106415
                  fmv.w.x      fa0, t6
                  nop
                  fsgnj.s      fa6, ft2, ft4
                  srli         sp, s10, 8
                  fcvt.wu.s    a4, fs6
                  slli         a6, s1, 18
                  srli         s4, s6, 4
                  fsgnjn.s     fs6, fs5, ft0
                  fdiv.s       ft3, fs0, fa1, rne
                  divu         zero, a1, s4
                  rem          a5, a1, s5
                  xori         a0, a5, 382
                  divu         a7, s9, t4
                  fsqrt.s      fa7, fa7
                  add          s0, t3, s9
                  sltiu        sp, s2, -625
                  sra          a3, t3, a4
                  slli         s1, a6, 3
                  fmv.x.w      s8, fs10
                  sltu         t0, s11, s5
                  fle.s        ra, ft2, fa7
                  slli         t0, a2, 26
                  xor          s9, a7, s5
                  fsgnjn.s     ft1, fa4, fa1
                  div          a6, a6, t2
                  mulh         a7, s8, tp
                  addi         a1, s9, 1422
                  mul          a3, a3, t1
                  srli         a1, s8, 18
                  slt          tp, zero, t4
                  sltiu        s10, t6, -1556
                  fmul.s       ft11, fs4, fs10, rne
                  fcvt.s.wu    ft11, t2, rne
                  fcvt.w.s     t6, fs6
                  sub          s5, gp, s3
                  srli         a2, s0, 31
                  fmul.s       fs10, fs5, fs1
                  srli         a3, s8, 22
                  sra          zero, s4, t6
                  nop
                  nop
                  divu         a3, t1, a5
                  fmv.x.w      a3, ft4
                  lui          t4, 308409
                  remu         s0, t1, a4
                  sra          s6, s2, sp
                  fcvt.wu.s    a5, ft0, rup
                  srl          a0, sp, ra
                  feq.s        s4, fs11, fs9
                  mulhsu       t1, s6, s7
                  fle.s        a5, ft1, fs3
                  fle.s        sp, fs8, ft1
                  fcvt.s.wu    ft1, a0
                  sll          a6, s9, s5
                  fle.s        a0, fs10, fs6
                  fcvt.wu.s    a0, fa5
                  add          t1, t4, a1
                  xori         t1, t4, -876
                  div          a7, s7, t5
                  remu         s2, s8, a1
                  fsgnjn.s     fs3, ft1, fs9
                  sll          zero, ra, t6
                  ori          tp, a3, 685
                  divu         s9, s1, a2
                  fcvt.w.s     s0, fs2, rmm
                  fclass.s     s2, fs10
                  fsub.s       ft6, ft9, ft3
                  fsgnjn.s     ft1, fa3, fs11
                  fmax.s       ft10, ft0, ft11
                  fsgnj.s      fs3, fs8, ft7
                  srli         s3, s4, 20
                  fdiv.s       fs3, ft3, fs0
                  fadd.s       fs8, ft7, fs3
                  slt          s8, tp, s2
                  mulh         t6, s8, a6
                  or           a0, s11, a4
                  fcvt.s.wu    ft11, s8
                  auipc        zero, 728344
                  fcvt.s.wu    fs3, sp
                  ori          a0, a3, 1111
                  fdiv.s       fs4, ft6, fa6, rtz
                  nop
                  fcvt.w.s     a6, ft7, rdn
                  mulh         a6, tp, t5
                  slti         gp, zero, 207
                  auipc        sp, 762629
                  or           t5, a1, t2
                  mulhu        t6, s2, s8
                  sltu         s5, a5, a0
                  sub          s9, a2, t1
                  feq.s        a2, fs2, fs10
                  fdiv.s       fs4, fs3, ft11
                  srl          sp, a1, a6
                  fadd.s       fa1, fa1, ft8
                  fcvt.s.w     ft5, a7, rdn
                  mulhsu       a0, s10, s7
                  slti         s10, zero, 651
                  flt.s        s9, fs5, fa5
                  sltu         sp, s1, a3
                  sltiu        t6, sp, -1743
                  flt.s        a4, fs6, fa7
                  fmv.x.w      a5, fs9
                  sltu         tp, s9, s11
                  or           a5, gp, s5
                  sll          t6, sp, ra
                  sra          s1, ra, zero
                  srai         s3, sp, 10
                  slt          ra, zero, t0
                  rem          s4, sp, a1
                  fcvt.s.wu    ft9, t1, rne
                  fsgnjn.s     ft9, ft9, fs6
                  fmv.x.w      t2, fa1
                  nop
                  remu         a7, a5, t1
                  fmv.w.x      fs3, s2
                  fcvt.wu.s    a3, fs8, rmm
                  fmax.s       ft8, ft10, ft11
                  mulhsu       s6, tp, t0
                  flt.s        a1, ft0, fs3
                  sra          zero, a1, t2
                  add          s1, a3, t0
                  slti         s0, s2, -954
                  xori         s1, sp, 1088
                  fmax.s       ft8, fa6, fa6
                  srl          s0, t0, s11
                  sra          a7, s0, tp
                  fadd.s       fa7, fa7, fa6, rmm
                  mulhu        s9, t3, a6
                  auipc        a4, 786434
                  srai         s8, s8, 13
                  xori         a2, s4, 469
                  fdiv.s       ft2, fa4, ft7
                  fmin.s       fs11, fs1, ft1
                  sltiu        a5, a1, 444
                  srli         tp, s4, 22
                  sub          s9, s5, a3
                  fdiv.s       fs3, fa1, fa3, rtz
                  fsqrt.s      ft8, fs0
                  divu         gp, s7, t5
                  xori         t5, zero, 528
                  fmin.s       fs5, fs11, fs3
                  fclass.s     t4, ft2
                  slti         s0, s2, -745
                  divu         a4, a1, s8
                  srai         a1, a3, 31
                  fmax.s       fa0, fs5, ft8
                  fadd.s       fs5, ft1, fa3, rdn
                  fsub.s       ft4, ft2, fs6
                  fcvt.wu.s    s10, ft6, rne
                  fmul.s       fs7, ft4, ft11
                  fsgnj.s      ft11, fa5, fs4
                  fcvt.w.s     sp, ft7, rmm
                  xori         a5, a7, -1399
                  fsqrt.s      fs5, fs9
                  fcvt.s.wu    fs10, s8, rne
                  nop
                  auipc        a5, 36591
                  sll          ra, t4, s6
                  rem          gp, s0, s2
                  fsgnj.s      fa5, fa5, fs9
                  fmv.x.w      gp, fs5
                  xori         ra, s4, 521
                  srai         t2, t6, 6
                  xori         s10, a3, 1774
                  div          a2, s10, s0
                  mulhsu       t5, gp, t6
                  sltiu        zero, s6, 458
                  fmax.s       fs3, ft4, ft9
                  fcvt.w.s     ra, fs1
                  div          tp, s0, s5
                  remu         s6, t2, s11
                  mulhsu       tp, s10, a4
                  sll          s10, s4, a7
                  nop
                  lui          s0, 1003887
                  slti         s10, a5, -2023
                  andi         ra, a3, -1051
                  mul          ra, zero, gp
                  xori         a1, s0, -1893
                  fsub.s       ft11, fs2, fs9, rup
                  slt          ra, s3, s0
                  rem          s5, t6, t0
                  feq.s        t2, ft5, ft8
                  mulh         a2, s9, t5
                  fdiv.s       ft11, fs2, fs0, rup
                  remu         a6, s10, t2
                  fdiv.s       ft9, fa5, fa7
                  mulh         s10, tp, a3
                  fle.s        a0, fa4, fs9
                  mul          t1, t1, t0
                  fle.s        a1, fs3, fa5
                  fmv.x.w      a2, fa7
                  fmv.w.x      fs8, sp
                  fle.s        s8, fs1, ft10
                  nop
                  fsgnjx.s     ft7, ft11, ft8
                  ori          s10, a5, -1097
                  sra          a7, t6, t1
                  auipc        a5, 124205
                  fmv.w.x      ft6, tp
                  remu         s4, s2, a1
                  fmin.s       ft10, fs2, fa2
                  slti         t0, ra, -927
                  sll          a6, zero, a7
                  fcvt.wu.s    a2, ft1
                  srai         gp, s5, 25
                  feq.s        s3, fa7, fa2
                  sltu         s5, a3, t3
                  srl          gp, a2, s2
                  div          a1, t4, s11
                  or           s3, tp, t6
                  fmin.s       fs6, ft7, fs9
                  mulh         t6, a5, t5
                  rem          s4, s11, t0
                  sltiu        gp, s2, 1978
                  slli         s5, s7, 15
                  slti         t4, s0, 709
                  fsgnj.s      ft9, fs0, ft0
                  rem          zero, zero, zero
                  fmin.s       ft6, ft6, fa6
                  fcvt.s.w     ft1, t5
                  sll          t2, s2, s2
                  mulh         s5, s2, ra
                  mulhu        t2, s7, gp
                  fcvt.s.wu    ft11, s9, rmm
                  sra          s9, s8, a0
                  fcvt.wu.s    zero, ft7, rmm
                  ori          a2, s2, 1818
                  slti         zero, s4, -659
                  fsub.s       fa1, fs5, ft5
                  andi         a2, t5, -1080
                  fmul.s       fa5, fs0, fa4, rmm
                  fcvt.wu.s    s0, fs11, rdn
                  or           s5, s2, s3
                  fmul.s       ft5, ft9, ft6
                  mulhsu       t4, a5, t4
                  sub          a3, t4, gp
                  fmv.x.w      s8, fs10
                  slli         s6, s5, 28
                  and          tp, s5, t4
                  ori          s3, s11, 2027
                  sltiu        t1, s2, -1965
                  fmul.s       fs7, fs3, fa6, rup
                  div          a7, ra, s3
                  srli         s3, s11, 12
                  mul          a5, s3, a3
                  and          s9, a1, s2
                  mul          t0, a6, s10
                  srl          a4, t2, a2
                  auipc        s8, 916639
                  divu         t1, t3, a5
                  fmul.s       fs2, ft8, fs11
                  fcvt.w.s     sp, fa4
                  ori          gp, s0, -1593
                  fsgnj.s      fs9, ft7, ft2
                  fcvt.w.s     t2, fs9, rtz
                  rem          t5, ra, ra
                  sub          t4, sp, tp
                  and          t0, t6, s8
                  fsqrt.s      fs2, ft3, rdn
                  div          t5, zero, a0
                  and          a5, a6, t5
                  rem          zero, t1, s3
                  flt.s        a5, ft8, ft10
                  fmax.s       fs2, ft11, ft4
                  slli         s5, s4, 4
                  fcvt.w.s     s5, fs7
                  lui          t2, 32529
                  addi         t0, a3, 17
                  fcvt.s.wu    ft3, a0, rne
                  fsub.s       ft9, ft6, fs3, rdn
                  divu         t4, s11, a2
                  feq.s        s2, ft4, ft6
                  fclass.s     t0, ft0
                  mulhu        sp, s10, s0
                  fsgnjn.s     fa4, fs10, fs9
                  fcvt.s.wu    ft1, a1, rup
                  mulhsu       a5, s4, t4
                  fmin.s       fs8, ft4, fs7
                  divu         ra, s9, s0
                  and          s2, gp, t4
                  fsqrt.s      fs9, fa7, rdn
                  fcvt.wu.s    t2, fa4, rne
                  and          s6, s2, s5
                  mulhsu       a6, a2, s5
                  xori         t5, a7, 2020
                  div          t1, a4, a5
                  srai         s0, t5, 21
                  and          t5, a6, zero
                  slli         a4, t4, 19
                  feq.s        ra, fs5, ft2
                  fmax.s       ft0, ft5, fs5
                  fmin.s       fa0, ft9, fs4
                  fcvt.w.s     sp, ft10
                  xor          s9, ra, tp
                  remu         zero, s7, s2
                  nop
                  div          a4, s10, s9
                  fmv.x.w      s10, fs9
                  flt.s        s6, fs5, fa1
                  and          a2, s3, s5
                  fmul.s       ft1, fa4, ft9
                  addi         t4, a3, -1045
                  mulh         t1, sp, a4
                  fadd.s       fs10, ft1, fs5, rdn
                  srli         t0, gp, 28
                  ori          s0, s7, 1441
                  fmv.w.x      fa4, t1
                  fcvt.s.wu    fs11, a2
                  mul          t2, a1, a2
                  nop
                  xor          a7, a5, a4
                  sltiu        s5, ra, 1484
                  sub          t5, a5, sp
                  addi         ra, s0, 1396
                  srai         t2, s9, 13
                  nop
                  srli         s8, a4, 20
                  fcvt.w.s     a4, ft2, rmm
                  xori         tp, a2, -1741
                  fsub.s       fa7, ft8, fs11, rmm
                  xori         a5, tp, -1604
                  flt.s        t2, ft1, fa7
                  srl          s10, s6, t0
                  auipc        a2, 520850
                  feq.s        t5, fa2, fa1
                  fsqrt.s      ft7, fa0, rtz
                  xor          sp, s11, s0
                  srl          a3, t2, zero
                  sltiu        t5, s4, 1510
                  lui          s2, 883807
                  fle.s        s9, fa6, ft11
                  or           s9, s1, s5
                  fmin.s       ft10, fs8, fs3
                  mulhsu       t4, t1, tp
                  flt.s        a0, ft7, fa3
                  div          s5, a5, a4
                  fcvt.w.s     zero, ft6, rne
                  sltiu        gp, a6, -1551
                  feq.s        a6, fs3, ft3
                  srli         t4, t1, 10
                  fmv.x.w      a0, ft7
                  sltiu        s5, s1, -1206
                  slti         s6, s0, -988
                  srl          a7, s11, tp
                  srli         tp, t2, 5
                  fsgnjx.s     fs0, fa3, fs8
                  fdiv.s       fa7, fs1, fs8, rmm
                  sltiu        s10, a0, -1724
                  fsgnj.s      fs0, fs7, ft6
                  lui          s1, 827396
                  flt.s        s5, fa5, fs3
                  addi         a7, a3, -461
                  sltiu        zero, a5, 1597
                  sltu         s2, a6, t6
                  fcvt.s.w     fa5, t5, rne
                  div          a5, a7, s1
                  sll          tp, t5, t0
                  ori          t1, ra, -499
                  fclass.s     a2, ft0
                  flt.s        a2, fs0, fa1
                  fcvt.w.s     a6, fa0
                  or           s2, zero, a5
                  flt.s        a5, fa7, fa2
                  sltu         a6, a0, t2
                  fmin.s       fa2, ft9, fa3
                  sub          t6, s1, gp
                  fsgnj.s      fs5, ft1, fa1
                  lui          sp, 712690
                  auipc        t6, 250623
                  fsgnjx.s     ft6, fs7, ft0
                  add          a2, t5, s11
                  slt          a7, a0, tp
                  fmul.s       fs3, ft7, ft6, rtz
                  addi         s9, t6, 1037
                  and          a1, s6, s6
                  srai         s8, t6, 16
                  auipc        t5, 155651
                  ori          t4, t6, 1189
                  mulh         s9, s7, t1
                  fdiv.s       fs2, fs11, fs11
                  mul          a6, t5, t5
                  fdiv.s       ft10, fs5, fs8
                  mulh         t0, t3, s4
                  fmv.x.w      s4, fs11
                  fmax.s       ft11, ft1, fa6
                  fsgnjn.s     ft9, ft1, ft5
                  slti         s3, s0, -1013
                  fle.s        sp, fa5, fa2
                  fdiv.s       fa4, fs4, fs5, rup
                  fsgnjx.s     fs1, fa2, fs10
                  or           s2, gp, s5
                  xori         a4, a3, 1003
                  or           s10, s1, a6
                  rem          s10, a7, a0
                  fdiv.s       ft10, ft1, ft11, rne
                  feq.s        a6, ft4, fa3
                  rem          s9, sp, a7
                  ori          s0, a1, -821
                  sra          a1, s6, s2
                  sub          s1, t4, a4
                  auipc        t1, 687530
                  fcvt.w.s     s4, ft3
                  lui          s4, 346730
                  div          s8, t4, sp
                  fcvt.wu.s    a6, fs11
                  fmv.x.w      a4, fs5
                  divu         gp, s6, s8
                  slli         s0, a3, 12
                  fsgnjn.s     fa5, fs10, ft4
                  fmv.w.x      fs0, s9
                  mulhsu       s6, s4, a0
                  srl          t4, a0, s4
                  nop
                  slt          t0, s3, t6
                  fdiv.s       fs4, ft9, fs0, rtz
                  xori         s5, a5, -1099
                  nop
                  or           s3, t0, s10
                  fmv.x.w      a1, ft6
                  fmv.x.w      t6, ft9
                  sub          s10, a2, s9
                  fcvt.s.wu    fa6, a0
                  xor          a6, s8, s8
                  sltiu        a7, a3, -1463
                  addi         s6, a3, 253
                  or           t2, tp, s3
                  auipc        zero, 281846
                  sltu         t4, t3, t0
                  mul          s8, s3, s8
                  div          t2, tp, t4
                  remu         t6, a5, s10
                  mulh         a7, s10, t4
                  xori         a5, s3, -1376
                  fle.s        sp, ft2, fa7
                  add          a2, ra, s6
                  srl          s5, a6, a1
                  rem          sp, a1, s1
                  fcvt.w.s     t2, fs10, rup
                  slt          gp, a5, tp
                  addi         s1, a7, 708
                  fmv.w.x      ft11, s4
                  remu         a0, a1, zero
                  rem          s8, s9, sp
                  mulhu        a3, t0, s0
                  fmin.s       fa3, fa3, fa3
                  ori          sp, t6, -1334
                  mulhu        a6, a5, t0
                  andi         sp, ra, -910
                  srl          t4, gp, gp
                  fsub.s       ft4, ft1, fa0
                  slli         t4, s3, 9
                  fsgnj.s      ft3, ft3, ft3
                  srl          a7, s4, t2
                  remu         s2, s5, s0
                  xor          a0, a0, tp
                  srl          a4, s0, t0
                  slti         zero, s1, -84
                  mulh         ra, a1, t1
                  sll          a7, a0, a2
                  fsqrt.s      ft11, fa4
                  rem          t2, t1, t3
                  slti         a3, tp, 534
                  fsgnjn.s     fs11, fs9, ft1
                  fmul.s       fs0, ft10, fa4, rtz
                  srl          a7, s1, s6
                  feq.s        t0, fs11, ft4
                  fadd.s       ft1, ft10, fs5
                  fdiv.s       ft7, ft6, fa3
                  fadd.s       fs4, fs1, ft2
                  xor          tp, t1, a0
                  andi         t6, a2, 374
                  mulh         s0, s10, t4
                  sltiu        s0, s11, 1806
                  sll          a5, t6, s1
                  or           t5, t4, t0
                  sub          a0, a7, gp
                  fcvt.s.wu    fa0, s8
                  fcvt.wu.s    t1, ft0, rne
                  add          s8, zero, a0
                  xori         zero, s7, 361
                  xori         s4, a6, 1304
                  sltu         t2, a5, a3
                  fcvt.w.s     s1, ft3
                  xori         t4, a3, 940
                  fmv.w.x      fs8, s0
                  sub          t1, a3, s4
                  addi         tp, a6, 1776
                  srl          sp, s7, s7
                  or           s1, a0, s10
                  srai         s4, s7, 29
                  fmv.x.w      t4, ft1
                  rem          s4, t5, sp
                  flt.s        a5, fs2, fs3
                  fcvt.s.wu    ft7, t4, rne
                  auipc        a7, 905612
                  sll          t1, s6, s4
                  fmin.s       fs1, ft1, ft5
                  fdiv.s       ft11, fa7, ft4, rdn
                  lui          a2, 224560
                  addi         t1, tp, -82
                  fmin.s       fa1, fs2, fs3
                  fmax.s       fa2, ft9, ft4
                  lui          s6, 461396
                  slti         tp, a1, -1558
                  flt.s        gp, fa4, fa7
                  div          gp, s8, s9
                  fcvt.s.wu    fs4, a5, rmm
                  div          t1, s7, a3
                  sll          t5, a4, a7
                  ori          s6, a1, -1378
                  fmul.s       fs7, fs10, fa3
                  mulh         s2, s9, t6
                  mulhu        a2, zero, s11
                  flt.s        sp, fs9, fa3
                  fcvt.s.w     ft1, a3, rtz
                  fadd.s       fa3, ft5, ft6, rne
                  fmv.w.x      ft6, tp
                  fcvt.s.w     ft4, ra
                  mul          a1, s3, a7
                  sub          s3, a7, a7
                  xor          t6, t6, sp
                  sltu         s9, s9, s1
                  flt.s        s9, fs2, fs9
                  nop
                  fadd.s       fs1, fs5, fs0
                  fsgnj.s      fs11, ft0, fa0
                  andi         a3, a3, 582
                  mulhsu       a3, s6, s1
                  xori         a5, gp, -554
                  fmin.s       ft0, fs1, fs7
                  fcvt.w.s     s10, ft9, rup
                  xor          s2, s5, a0
                  fmv.w.x      fs1, s5
                  fle.s        s9, fa0, fs5
                  fadd.s       fs11, fa4, ft5, rdn
                  sub          s0, t0, gp
                  fcvt.s.w     ft9, a7, rne
                  fle.s        a2, fa1, fa6
                  fsgnjn.s     fs7, ft5, ft1
                  slt          s10, s7, t0
                  addi         a3, s11, 1370
                  xor          a2, s3, s6
                  srli         t5, s7, 9
                  fsgnjn.s     fa5, ft7, ft8
                  xori         s8, t1, -1164
                  fmv.w.x      fa1, a4
                  feq.s        t5, fa4, fs1
                  fsgnj.s      fa0, fs1, ft5
                  fle.s        gp, fs3, fs5
                  flt.s        s9, fs11, fs8
                  addi         a6, a3, -1287
                  sra          s9, a5, a2
                  xori         s8, a4, -17
                  sub          s5, a0, s7
                  mul          s10, s7, s4
                  xori         t5, t1, 886
                  flt.s        s9, fa3, ft9
                  fmv.x.w      zero, ft1
                  sll          s10, a2, t3
                  fcvt.s.w     fs10, s6, rtz
                  rem          t6, zero, t0
                  slti         tp, s9, 460
                  ori          s6, s0, 989
                  feq.s        t6, fa5, fa0
                  slti         s10, t6, 1932
                  slti         t1, a0, -242
                  addi         t4, gp, -51
                  srai         t2, s3, 7
                  slti         a2, a6, 853
                  fmax.s       fs4, fs8, fs3
                  xori         t0, t3, 1238
                  fsgnjx.s     fs11, fs10, fs3
                  remu         gp, s0, s11
                  slti         s0, a7, 1105
                  andi         s1, t6, 1021
                  remu         s2, s7, t0
                  fcvt.s.w     fa2, s6, rtz
                  and          a0, s8, a6
                  fmv.x.w      zero, ft0
                  fcvt.s.w     ft10, s3, rdn
                  fsgnj.s      fa5, ft8, fs11
                  slli         zero, t4, 21
                  mul          t0, tp, t2
                  fmv.x.w      gp, fs10
                  fle.s        s1, ft6, fa3
                  nop
                  mul          s1, gp, s1
                  fmv.x.w      s5, ft2
                  xor          tp, s1, t5
                  div          t1, s0, s11
                  fclass.s     t1, ft6
                  fsub.s       fs5, ft8, fa6, rdn
                  fmax.s       ft8, fa3, ft3
                  fsgnjn.s     fa3, fs3, fs9
                  fadd.s       ft0, fs6, fa1
                  fdiv.s       fs1, fs6, fa1
                  sub          a0, a2, s11
                  and          t2, s3, s3
                  fle.s        s3, fs2, fa7
                  slti         s9, s4, 1458
                  feq.s        a4, fa4, ft0
                  fcvt.w.s     s8, fs3
                  and          t6, t1, s8
                  slti         s6, t3, 530
                  nop
                  fmul.s       fs1, fa0, fs4
                  rem          s2, a2, s2
                  or           s9, gp, t6
                  lui          s5, 299694
                  feq.s        s4, fa5, ft4
                  fsgnjn.s     fs1, fs3, fs8
                  fcvt.w.s     s3, ft10, rup
                  add          s2, s9, t4
                  sra          gp, sp, s0
                  flt.s        a2, fs4, fa4
                  or           a2, a1, t5
                  mulhsu       s8, s4, s2
                  mul          s4, s6, t2
                  fsqrt.s      fa5, fa5, rdn
                  fmul.s       fa5, fa1, fs9
                  fcvt.w.s     s8, ft10
                  slt          t2, a4, a3
                  sra          s4, a2, t4
                  auipc        s6, 363802
                  remu         t4, s1, s9
                  xori         t5, tp, -1603
                  auipc        a7, 431221
                  rem          t1, s2, ra
                  fdiv.s       ft3, ft4, fs5
                  fsgnjn.s     ft7, fs11, fa5
                  fmv.x.w      a6, fs9
                  fsgnjx.s     fa1, fa3, fs3
                  remu         t5, a7, s5
                  sra          a5, a4, t4
                  mulhsu       a5, s9, a1
                  fmin.s       fa0, ft3, fa5
                  feq.s        t1, fs6, ft9
                  fmax.s       fs0, fs0, fa5
                  fmul.s       fs10, ft9, fs7
                  or           s4, s4, gp
                  slti         a4, t5, -176
                  sltiu        s2, t2, -886
                  slli         s5, s4, 28
                  fmax.s       fa0, fs2, fa2
                  sltu         tp, a0, s0
                  fsgnjx.s     fa4, fa0, ft3
                  rem          a5, s3, s10
                  sll          s5, s2, t6
                  feq.s        zero, fs8, ft7
                  fdiv.s       fs3, fa1, fs9
                  fsub.s       fs11, fa2, fs2
                  sll          s8, t6, t2
                  slli         sp, s5, 21
                  fcvt.s.wu    ft11, s3, rne
                  sltiu        s0, a5, -834
                  divu         s1, s5, s7
                  srli         a0, ra, 13
                  fsgnjx.s     ft10, fs9, fs7
                  fcvt.s.wu    fs11, a5
                  or           a6, s11, t0
                  and          s2, s7, s8
                  srl          s9, s3, t6
                  slt          sp, gp, a1
                  fle.s        t6, ft2, fa5
                  mul          s1, s11, t3
                  slti         a7, tp, -337
                  fsgnjn.s     ft8, fs7, fa1
                  srai         ra, tp, 27
                  sra          s10, s0, t3
                  rem          t0, t5, a4
                  xor          s8, t3, t6
                  fcvt.w.s     t4, fs3
                  fcvt.w.s     s9, fs6
                  or           t4, a4, tp
                  fcvt.w.s     ra, fs2, rmm
                  flt.s        t0, fs7, fs2
                  fmv.w.x      fs8, s1
                  and          t2, gp, t3
                  fmv.x.w      tp, fs11
                  fmax.s       ft9, ft4, fa3
                  fmul.s       fs10, ft5, fa6
                  fcvt.s.wu    ft4, t6, rmm
                  feq.s        a7, ft1, fs0
                  fle.s        a7, fs6, ft11
                  fadd.s       fs11, fa6, fa3
                  fcvt.wu.s    a5, fs0
                  slli         s4, a3, 17
                  fcvt.s.wu    fa2, zero
                  add          t6, a1, t0
                  sra          t6, s5, s3
                  sltiu        t6, s3, 833
                  fdiv.s       fa2, fa0, ft11, rmm
                  sltu         sp, s4, zero
                  sll          s0, t2, t6
                  fadd.s       fs10, ft11, fs5
                  fclass.s     s3, fs4
                  srl          a4, tp, t3
                  slli         a0, tp, 20
                  fsgnjn.s     fa0, fa0, fa7
                  feq.s        sp, ft3, fs5
                  addi         gp, a6, 575
                  addi         a7, s5, 1293
                  fdiv.s       fa7, ft9, fa4, rup
                  ori          tp, a2, -1651
                  add          ra, tp, a1
                  sra          s3, a7, s5
                  fcvt.w.s     a0, ft7, rdn
                  mulh         a2, t5, gp
                  add          t4, t3, a7
                  or           t6, a2, t3
                  fsgnjx.s     ft2, ft11, fa0
                  fsqrt.s      ft3, ft3
                  srli         t2, s3, 25
                  fmv.w.x      fs2, t4
                  rem          t1, a5, t0
                  sra          s8, s3, s7
                  fsgnj.s      fs8, fs10, fs6
                  divu         ra, tp, s2
                  srai         a3, s2, 13
                  sra          a7, a2, tp
                  fmax.s       fs7, fs0, fs0
                  div          t1, t1, sp
                  sra          sp, a4, a1
                  fadd.s       fs3, ft6, fs8
                  fmax.s       fs2, ft5, fa1
                  fcvt.s.wu    ft6, s4, rdn
                  fsub.s       fa4, fa3, fa2
                  sll          a1, s11, a5
                  fcvt.w.s     ra, ft3
                  xori         t1, s6, 147
                  sra          ra, ra, s8
                  fadd.s       fs0, fs8, ft3, rup
                  divu         s6, s3, a1
                  slli         t5, s10, 27
                  fcvt.s.w     fa0, s4
                  sub          t1, zero, s4
                  mulhu        t2, a6, t0
                  div          t2, sp, gp
                  ori          sp, t0, 1570
                  slli         s9, a0, 24
                  fsgnjx.s     ft1, ft11, ft6
                  fdiv.s       fs0, ft7, ft1
                  fcvt.s.wu    fa3, s4, rup
                  div          gp, zero, s5
                  sll          s8, t2, s8
                  fcvt.w.s     s1, ft9
                  fsgnj.s      ft1, fs10, fa2
                  mul          a3, s3, sp
                  fcvt.w.s     s9, ft2
                  ori          t0, gp, 92
                  mul          a3, s0, sp
                  auipc        t5, 81036
                  fcvt.s.wu    fa1, s0, rmm
                  mulhsu       s2, sp, a3
                  fcvt.s.w     ft11, s11
                  sltiu        a0, t4, 1776
                  mulh         s0, ra, a6
                  or           t5, gp, zero
                  slti         s6, t5, 1435
                  sltu         a3, s4, s4
                  mulh         s8, s6, t3
                  feq.s        s1, fs2, fs1
                  fsqrt.s      ft3, fa5, rne
                  remu         ra, t6, a4
                  fcvt.s.w     fa0, t5, rup
                  fle.s        s10, fs10, fa7
                  fsgnjx.s     ft11, fs10, fa7
                  sltiu        s2, s4, 1351
                  sll          s4, sp, s9
                  mulhu        s2, tp, s6
                  divu         a5, a7, s2
                  fcvt.s.wu    ft1, s8
                  and          zero, zero, t0
                  fdiv.s       ft8, fa3, ft3
                  add          a4, zero, a0
                  nop
                  mul          s3, s1, a2
                  slli         a4, a1, 0
                  divu         s2, t1, s2
                  fsgnjx.s     fa4, ft1, ft11
                  sll          a1, s8, zero
                  sltiu        a5, sp, -551
                  mulh         s6, a3, s4
                  fcvt.w.s     s0, fa6, rtz
                  ori          s3, tp, 143
                  fdiv.s       fa1, fa1, fa1, rtz
                  fclass.s     a7, fs5
                  slt          t0, gp, t3
                  add          t1, s5, t6
                  lui          s10, 992869
                  srl          t6, t2, tp
                  mulhsu       a1, a1, s6
                  srl          s3, a0, t3
                  remu         gp, sp, t6
                  mulhsu       s2, s10, a0
                  or           s10, a5, a3
                  fmv.x.w      s0, fs4
                  nop
                  mul          s6, t4, t2
                  fle.s        a5, fs8, ft3
                  mulh         s8, t0, a1
                  sltu         s10, t3, s1
                  fcvt.s.w     ft0, s9, rmm
                  slti         s4, t3, 632
                  fclass.s     s0, fs6
                  addi         s3, s1, -353
                  fmv.w.x      fa2, a3
                  xori         s2, t3, -796
                  fmul.s       ft10, ft7, fs3
                  fcvt.s.wu    fa4, a2
                  fmul.s       fs10, ft5, fs1
                  fcvt.s.w     fa0, a4
                  rem          ra, s9, t1
                  fclass.s     gp, ft6
                  remu         s1, s1, a1
                  fsgnj.s      fs8, fa1, fa5
                  remu         a0, a6, s11
                  mulh         a0, s4, t2
                  fcvt.wu.s    a1, fa0
                  feq.s        s8, fs11, fs4
                  fmul.s       ft5, ft2, fa1
                  flt.s        s1, ft7, ft8
                  sltu         s1, a4, s2
                  fsub.s       fs8, ft3, ft4
                  fadd.s       ft11, fs6, fs7
                  lui          a1, 439114
                  sltu         t6, zero, s3
                  sltu         a6, t2, s4
                  nop
                  ori          t1, s0, 519
                  rem          a3, a3, s6
                  fmv.x.w      t1, fs8
                  sub          a3, zero, s10
                  fsub.s       fs6, ft9, fa3, rmm
                  sub          a1, a2, s1
                  feq.s        s2, fs5, fs4
                  sltiu        t2, tp, -126
                  fcvt.wu.s    t2, fs9, rdn
                  fmv.w.x      fs1, a0
                  mul          ra, s3, t2
                  fdiv.s       fa1, fa3, fs7, rtz
                  mulhu        ra, s6, tp
                  fadd.s       fs10, fs5, fs8
                  fclass.s     a3, fs11
                  fcvt.s.wu    fs6, s2, rdn
                  and          t4, s4, s8
                  sltu         a2, t0, s10
                  fmin.s       ft2, fs2, ft0
                  fsgnj.s      fa7, ft5, ft0
                  xor          gp, t4, s7
                  fdiv.s       fs1, fa5, ft9, rup
                  ori          s10, a2, 939
                  div          s1, a1, s1
                  srli         a0, t4, 21
                  fle.s        s10, fs3, fs10
                  sltu         t0, s9, s10
                  remu         s0, s5, t6
                  fcvt.w.s     a0, fa6
                  xori         s10, s11, 1512
                  sltu         a0, a2, s6
                  remu         t4, t6, s7
                  and          s9, a4, t4
                  div          s0, t3, s4
                  div          s6, s10, s10
                  fmul.s       ft6, ft5, ft8, rdn
                  fsub.s       ft6, ft2, ft5, rdn
                  fcvt.wu.s    t0, ft7, rup
                  fsub.s       ft7, fa3, ft5, rup
                  divu         t2, a1, t6
                  fdiv.s       fs0, fs7, fs2
                  fsqrt.s      ft1, fa5, rdn
                  flt.s        s0, fs10, fa0
                  divu         a5, s0, t3
                  nop
                  fclass.s     ra, fa3
                  fsub.s       fa5, ft6, ft11
                  sll          t4, a6, s6
                  slli         s5, s2, 30
                  and          a7, a0, t0
                  fcvt.s.wu    fa5, s9, rne
                  fcvt.wu.s    t1, fs0
                  fclass.s     sp, ft6
                  srl          zero, zero, s1
                  fsub.s       ft6, fs8, ft5
                  fmv.x.w      t6, ft2
                  nop
                  nop
                  sll          a5, s8, zero
                  fadd.s       fs7, fs9, fa2
                  andi         s8, a7, 271
                  div          s3, s8, s6
                  sub          gp, ra, t4
                  or           s9, a4, a3
                  sltu         gp, t2, tp
                  divu         s2, s0, a3
                  xori         t5, t4, -996
                  sltu         tp, a2, s0
                  slt          gp, s5, t5
                  fsgnjn.s     fs6, ft8, ft1
                  lui          gp, 592177
                  fadd.s       ft1, ft9, fs3, rne
                  fmv.w.x      ft6, s9
                  fmul.s       ft4, ft7, ft2, rup
                  fle.s        t2, fa4, fa6
                  and          a4, a6, s7
                  fmul.s       fs3, fa1, fs9, rmm
                  fmv.w.x      fs1, s11
                  mulhsu       t0, a3, s0
                  srl          t1, a3, t0
                  addi         s10, t0, 549
                  fcvt.s.w     fa3, s7
                  fsgnj.s      fs7, ft2, fs10
                  nop
                  mulhu        zero, ra, t4
                  fmv.x.w      a5, fa2
                  fcvt.w.s     a5, ft2
                  fmin.s       fs1, ft10, ft8
                  fsgnj.s      fs0, fa1, ft6
                  slti         a0, s9, -1774
                  fcvt.w.s     sp, fs4
                  fclass.s     a0, fs5
                  srli         t4, tp, 24
                  fsqrt.s      ft3, fa4
                  or           s3, gp, zero
                  fsgnjx.s     fa7, ft2, fs9
                  fcvt.s.wu    ft1, a5
                  sub          s8, s3, zero
                  fsqrt.s      fs10, ft4, rmm
                  srl          s5, tp, a2
                  andi         a4, tp, 1335
                  and          s5, s7, s5
                  srli         s8, zero, 15
                  sub          t1, zero, t4
                  rem          s4, t3, t3
                  fcvt.s.wu    ft3, s2
                  feq.s        tp, ft7, fa5
                  fmin.s       fs10, fs3, ft4
                  fclass.s     s2, fa7
                  auipc        a7, 94502
                  slt          t0, a3, tp
                  addi         s1, s9, -1283
                  fcvt.wu.s    zero, fs6
                  srai         a5, ra, 16
                  sub          s6, s6, s10
                  fmax.s       fs1, ft4, fs0
                  srl          zero, s6, a0
                  fadd.s       fs8, ft10, fs11
                  srl          tp, s9, t2
                  slti         t2, t6, 401
                  andi         t0, ra, -1024
                  mul          s10, s5, a3
                  fadd.s       fs1, ft9, fs1, rdn
                  mulhu        sp, a6, t3
                  lui          t4, 1021926
                  fcvt.s.wu    ft2, s4, rup
                  fmax.s       ft11, ft7, ft10
                  or           s6, zero, s4
                  xori         s2, zero, 63
                  fadd.s       fs8, fa4, ft1
                  add          s5, t1, sp
                  mulhsu       t0, s0, s8
                  srl          s4, s4, sp
                  fmin.s       ft0, fs2, ft10
                  addi         a3, s2, -1219
                  fmv.w.x      fs8, a0
                  slt          s8, a0, gp
                  srai         t4, ra, 5
                  fclass.s     a1, fs3
                  divu         t4, t3, s0
                  slli         s9, s8, 6
                  slti         s9, t4, 320
                  xori         t6, s7, 1045
                  srli         sp, s8, 15
                  xori         gp, a3, -1302
                  flt.s        s9, ft4, fs9
                  fcvt.s.w     fs3, s7
                  add          t5, a7, t5
                  srl          t5, ra, tp
                  xor          s4, t0, s4
                  fmin.s       ft3, ft5, fs4
                  xori         t0, s3, 1696
                  sltiu        t5, t6, -1409
                  xori         s8, a0, -84
                  and          s9, a5, sp
                  sltu         zero, t3, s6
                  nop
                  auipc        ra, 273076
                  sltu         t6, tp, s1
                  or           gp, a6, ra
                  addi         t4, a4, -2026
                  mulhsu       a3, a1, t0
                  divu         zero, s6, zero
                  fsgnj.s      fs8, fs1, fs2
                  srai         tp, t0, 30
                  feq.s        t4, fa3, fs10
                  sltiu        ra, t3, 1889
                  add          t0, ra, s11
                  srai         s2, t0, 7
                  addi         t2, s3, -1970
                  sll          a4, s8, s9
                  add          a1, s6, ra
                  fsgnjn.s     fs4, fs5, fa3
                  fsub.s       fs3, ft11, fa3, rne
                  feq.s        ra, ft6, fs10
                  ori          t0, sp, 381
                  fle.s        s9, fs4, ft8
                  srli         t2, t6, 7
                  fmv.x.w      s8, fs2
                  fmul.s       ft9, ft0, fa7
                  slt          a4, s8, tp
                  sra          s2, a5, a5
                  sub          t0, s6, a7
                  andi         tp, s1, 1495
                  rem          ra, t1, s6
                  fmv.w.x      fs6, zero
                  sltu         s10, t1, a6
                  srl          a2, a6, a3
                  and          s0, tp, s1
                  feq.s        zero, fa3, ft2
                  sra          s3, t0, a7
                  fdiv.s       fa1, ft7, fs10
                  remu         a1, t6, a4
                  or           s10, sp, a6
                  fsgnj.s      ft11, ft4, fs9
                  slti         gp, s4, -969
                  sra          s6, s1, s3
                  mulhsu       ra, s6, s0
                  sub          a3, s8, a7
                  fmin.s       ft3, fs0, ft1
                  mulh         a6, t4, a5
                  mulhu        a6, s3, t3
                  fsub.s       fs5, ft11, ft7
                  fmin.s       fs0, ft3, fs7
                  div          s6, s2, gp
                  and          s3, a0, a4
                  xori         a7, s3, 973
                  sll          t1, t2, a2
                  andi         s5, gp, -6
                  fmax.s       fs3, fs2, fa6
                  divu         s3, t0, t5
                  slli         t5, s10, 0
                  sll          t1, a2, a4
                  fcvt.w.s     t4, ft5
                  fcvt.s.w     ft9, gp, rdn
                  fle.s        t5, fa3, fa6
                  fmin.s       fs8, fs8, ft0
                  xor          t0, t2, zero
                  or           t6, a2, t6
                  add          t6, s5, a3
                  divu         s0, s10, sp
                  add          t4, t0, s1
                  fcvt.w.s     t2, fa4, rdn
                  slti         s0, a0, 1299
                  mul          s9, t2, s2
                  rem          s1, a2, sp
                  fcvt.w.s     a0, ft8, rtz
                  sltu         a7, s5, a7
                  auipc        a1, 1019679
                  fmv.w.x      ft4, t5
                  divu         zero, s7, s3
                  slti         a3, s1, 1270
                  div          ra, a0, t6
                  slti         a6, a2, 1220
                  xori         a4, gp, 741
                  fcvt.s.wu    ft9, a5
                  div          a0, s7, a5
                  fmv.w.x      ft3, s9
                  srai         a0, a4, 6
                  slt          t4, zero, s2
                  fsqrt.s      fs1, ft4, rdn
                  auipc        s4, 403779
                  sra          tp, s8, s1
                  slti         s8, s8, -647
                  srl          t0, t5, t1
                  fle.s        s2, fa0, ft10
                  sltiu        s0, a1, 793
                  srli         s2, tp, 8
                  srli         s8, a0, 16
                  auipc        t0, 41462
                  mul          t2, s11, t0
                  fadd.s       fs3, fa7, fa2, rmm
                  srli         a5, a4, 7
                  slt          t2, t6, s0
                  fclass.s     t0, fa1
                  and          s8, a3, s6
                  rem          t4, a2, sp
                  fclass.s     t1, ft11
                  fmul.s       fa3, fa4, fa5, rmm
                  and          t6, s4, t3
                  fcvt.w.s     s1, fs0
                  mulh         a5, a0, s6
                  fmul.s       ft2, fs3, fs4
                  fsub.s       ft5, fs0, ft9, rtz
                  div          tp, tp, s1
                  remu         t4, a0, s3
                  fsgnjx.s     fs7, ft4, ft11
                  fsgnjx.s     fa2, fa4, fa1
                  srl          ra, ra, s10
                  fmax.s       fs7, fa1, ft2
                  fclass.s     s1, fs11
                  feq.s        zero, fs9, ft9
                  mul          gp, s2, t6
                  fadd.s       fs9, ft10, fa6, rup
                  slt          t0, s11, a0
                  add          s8, a4, t6
                  mulh         s3, s0, s11
                  sltiu        s5, a0, -645
                  fclass.s     s6, ft10
                  fsgnjn.s     fa2, fs8, fs8
                  mulhu        t4, a7, s3
                  ori          zero, s5, 1651
                  fmv.w.x      fa2, sp
                  addi         s3, s6, -1927
                  slli         t6, zero, 24
                  xor          t4, t4, s5
                  slti         s3, s5, 1521
                  fsub.s       ft3, ft3, fs2, rup
                  fsgnjx.s     ft1, fa2, ft3
                  and          s0, s5, a2
                  fmin.s       ft3, ft11, fa3
                  mulhu        a2, t6, s5
                  fcvt.s.wu    fs11, a7
                  rem          tp, t6, a5
                  sltiu        s5, s11, -968
                  sltu         a4, a3, a0
                  mulh         s0, t6, s4
                  sltiu        zero, t1, -377
                  srli         t5, s3, 21
                  fadd.s       fa7, fs11, fs1
                  slli         t6, t6, 21
                  sltiu        t0, s11, 1118
                  mulh         zero, t4, s10
                  fmul.s       fs2, fa0, ft1
                  xori         a3, s5, -918
                  sll          s1, s9, t2
                  fadd.s       fa0, ft5, fs8, rup
                  lui          a1, 812883
                  fsqrt.s      fs0, fs3
                  slti         s3, s7, 568
                  fmul.s       fa1, fs1, fs2, rup
                  sra          t0, s1, s5
                  remu         a2, a3, t0
                  sltiu        gp, s7, 466
                  fcvt.s.w     fs11, a3
                  fmin.s       fs1, fa3, ft11
                  mulh         s3, a0, t2
                  slt          a7, s3, a0
                  fsub.s       fs6, fs8, fs10
                  ori          a2, a0, 1180
                  rem          a7, s6, s7
                  fmul.s       fs1, ft9, fs8
                  auipc        tp, 645534
                  mulh         a4, s11, s0
                  srl          s2, s10, t2
                  fcvt.s.wu    ft5, gp
                  fsgnj.s      fa7, fa5, ft9
                  fcvt.s.w     fa5, gp, rdn
                  ori          a7, s6, -375
                  mul          t1, t3, t3
                  fmv.w.x      fa1, gp
                  add          t2, s10, a3
                  fmin.s       ft6, ft8, fa3
                  feq.s        a0, fa5, fs2
                  or           s4, t6, s7
                  ori          a0, t3, 229
                  sub          t6, a0, t3
                  fmv.x.w      s0, fs11
                  fmv.x.w      s0, fa1
                  fsqrt.s      fs9, ft9
                  add          a3, a7, s3
                  fmv.x.w      a4, fa7
                  fsgnj.s      fs11, fa2, ft1
                  sltu         t4, s10, s11
                  sra          t2, s1, a3
                  fsgnj.s      ft0, ft5, fs7
                  fcvt.wu.s    sp, fa3
                  fcvt.wu.s    a2, fa3, rmm
                  ori          a0, zero, 1615
                  srli         t4, s3, 0
                  fsgnj.s      fa0, ft4, fs8
                  flt.s        a2, fs1, fa5
                  fsgnjn.s     fa2, fs0, ft6
                  ori          a6, ra, -1383
                  slt          t5, zero, t1
                  fcvt.s.wu    ft2, t6
                  rem          zero, a7, gp
                  xor          t4, s1, ra
                  fcvt.w.s     s1, ft2
                  fcvt.s.wu    fs2, a2, rmm
                  fcvt.wu.s    a3, fs1, rmm
                  fsgnjx.s     fa5, fs9, fs10
                  fcvt.wu.s    sp, ft4, rup
                  div          a0, s11, t0
                  fsqrt.s      fa0, fa2, rne
                  srli         s4, sp, 20
                  fsqrt.s      fs4, fs0, rne
                  fcvt.wu.s    sp, fs3, rdn
                  mul          a1, t4, t2
                  fsgnj.s      fa4, fa3, fs11
                  mulhu        a7, a2, a0
                  fsqrt.s      fs6, fs4, rup
                  mul          s5, s0, sp
                  mulhu        sp, s4, t5
                  slt          t2, a7, s3
                  fsgnj.s      ft10, fs8, fs6
                  fsub.s       fa2, ft2, ft11, rne
                  sub          s0, a0, a4
                  and          s5, t0, a1
                  ori          t0, ra, 1092
                  fcvt.s.wu    ft0, s4
                  srli         a5, a6, 22
                  srli         s8, s5, 13
                  flt.s        s10, fs0, fa0
                  nop
                  fcvt.w.s     s5, fs11
                  add          tp, t1, a6
                  flt.s        s8, fs7, fs8
                  auipc        t5, 466633
                  fadd.s       fa3, ft5, fs4
                  mulh         t4, t4, s3
                  fclass.s     a1, fs3
                  fcvt.s.w     ft10, ra
                  fcvt.s.w     ft6, a4
                  slt          t4, ra, s3
                  fsgnjn.s     ft5, fa7, ft6
                  xor          sp, s4, t0
                  fdiv.s       fa7, fa2, ft11, rne
                  xor          s6, a0, zero
                  fcvt.s.w     fa4, tp
                  feq.s        t1, fs8, fa0
                  fmax.s       ft0, fa6, ft0
                  divu         a4, s11, s9
                  fcvt.wu.s    s1, fs3, rmm
                  ori          a2, a5, 322
                  auipc        a2, 15664
                  nop
                  fclass.s     ra, ft7
                  fcvt.wu.s    s6, ft11, rne
                  sll          a5, tp, s8
                  rem          t2, s10, t3
                  fcvt.s.w     fs2, s10, rup
                  div          t1, t1, s1
                  mul          a1, a7, s5
                  addi         gp, t1, -681
                  sub          s4, gp, s2
                  xori         t4, a6, -1912
                  fmax.s       fa1, fs3, fa7
                  and          s1, a6, t2
                  remu         a1, ra, a1
                  fsgnjx.s     ft0, ft10, ft3
                  or           t0, t0, s5
                  fmv.w.x      ft0, t3
                  sra          s6, s0, t3
                  sub          zero, t4, a3
                  fmin.s       fs8, fa4, fa0
                  auipc        t2, 450409
                  mulhsu       a2, s10, s10
                  fmul.s       ft2, fa0, fa0
                  fmax.s       fs9, fs9, fs9
                  flt.s        s3, ft5, ft6
                  fle.s        a0, fa4, fs6
                  fcvt.s.w     ft5, t4
                  xor          s4, s0, s5
                  and          s2, ra, s4
                  sub          zero, t1, ra
                  srli         s2, s6, 19
                  ori          t5, ra, 920
                  andi         a0, s3, -1159
                  sltu         t0, s0, s1
                  nop
                  sra          s9, a4, t6
                  sub          t1, s7, s2
                  addi         t1, t2, -211
                  ori          s3, s4, 92
                  fdiv.s       fs3, ft0, fa2
                  fsqrt.s      fs8, fa5
                  sltu         s9, s2, s7
                  sltu         a2, a0, s10
                  slti         t2, s1, -589
                  fcvt.s.w     fs1, s4
                  add          a1, s3, a0
                  xor          sp, zero, a4
                  mul          s10, t5, s4
                  remu         a3, a1, t2
                  ori          a4, sp, 1017
                  slti         s9, a0, 774
                  and          t4, s9, t2
                  mulhsu       a1, a5, a4
                  fcvt.s.w     fa2, a1
                  addi         s9, t2, 1032
                  ori          zero, s4, -753
                  slti         a5, a0, -1921
                  sra          s0, zero, a0
                  slli         t2, tp, 22
                  div          s0, zero, a6
                  fsgnjx.s     ft6, ft1, fa0
                  fsgnjn.s     fs7, fs5, fa4
                  lui          t1, 62077
                  fsub.s       fa5, fa2, fs0, rdn
                  ori          s1, a1, 1680
                  sub          ra, a1, a4
                  fadd.s       fa3, fs7, fa4, rne
                  addi         t6, a7, -988
                  add          a5, t5, t6
                  srl          s5, t3, s7
                  slt          a2, t5, t5
                  nop
                  sll          t2, tp, t2
                  addi         t2, a2, 1557
                  fmax.s       fs7, ft8, fs2
                  fcvt.s.w     fa7, a1, rtz
                  remu         s2, a5, a4
                  sltiu        a5, a1, 1122
                  srli         s10, t2, 9
                  fsgnjn.s     ft10, ft6, fa5
                  fmul.s       fa0, fs2, fa0
                  fsgnjx.s     fa4, fa2, fs0
                  fsgnj.s      ft2, ft6, ft0
                  fsgnj.s      fa6, ft5, fa7
                  slli         t5, a1, 28
                  divu         zero, t0, s9
                  ori          zero, t1, 621
                  fsqrt.s      fs4, ft3
                  mulhsu       t0, a5, s4
                  srli         s5, zero, 31
                  fclass.s     s5, fa0
                  fsub.s       fs11, fs11, fa3
                  sub          a3, sp, s1
                  fle.s        t2, ft0, fa7
                  slli         sp, t1, 20
                  fsgnj.s      ft9, ft4, fs0
                  divu         t5, a6, tp
                  fmul.s       ft1, ft10, fs7
                  auipc        t2, 404354
                  sltu         s1, a3, a5
                  fmin.s       fs4, fs2, fs0
                  div          a5, s3, a3
                  feq.s        s4, ft10, fs6
                  fmax.s       ft3, fs7, fa7
                  divu         a7, s5, s1
                  xor          a4, t1, gp
                  slli         t1, sp, 4
                  slt          ra, s4, t5
                  sltu         a4, t3, s9
                  fcvt.wu.s    a3, ft9, rdn
                  addi         t1, sp, 382
                  sub          s4, s6, gp
                  ori          s3, t6, -1494
                  srai         t2, s7, 5
                  mulhsu       t2, s10, s6
                  or           ra, t5, s11
                  fadd.s       ft8, fs7, ft6
                  fsub.s       ft9, fa7, ft8, rdn
                  nop
                  sltiu        tp, t5, 1842
                  fmin.s       fa4, fa1, ft0
                  slti         s4, ra, -1663
                  lui          s8, 868675
                  fmul.s       fa3, fa6, fs8, rmm
                  fsub.s       ft2, fa2, ft0
                  feq.s        a7, ft9, ft9
                  div          a7, gp, s10
                  slt          a2, s2, a1
                  divu         s8, a5, a7
                  xor          a7, s7, tp
                  ori          s3, s1, 1670
                  divu         s3, a5, t0
                  rem          s1, a4, s0
                  fcvt.wu.s    s0, fs8, rdn
                  srai         t0, a3, 13
                  fsgnjn.s     fs10, fa2, fs8
                  fcvt.s.wu    fa3, s11, rdn
                  fsgnjn.s     fs8, fa6, ft7
                  divu         a4, s10, a1
                  sub          a3, s11, s8
                  fcvt.s.wu    fs4, s8
                  flt.s        s9, fa2, fa6
                  nop
                  slt          t0, s10, ra
                  mulhsu       a0, ra, tp
                  fdiv.s       fs1, fs2, ft9, rne
                  fdiv.s       fa1, fa3, fs7, rne
                  fdiv.s       fs6, ft0, ft9
                  rem          a3, t2, ra
                  fsgnjx.s     fs4, fs0, fa3
                  fmax.s       fa5, fs9, ft0
                  slti         t4, t2, 1097
                  fsqrt.s      ft6, fs7
                  srai         t1, a3, 8
                  divu         t0, s10, s3
                  fcvt.s.wu    fs10, s1
                  fcvt.wu.s    a7, ft3, rup
                  fcvt.s.wu    ft6, t3, rdn
                  fsgnjx.s     fa6, ft6, fs7
                  nop
                  and          t1, t6, s9
                  slli         zero, zero, 17
                  fmax.s       ft4, fs6, fs8
                  fadd.s       fa7, fs5, fa1, rne
                  auipc        s3, 379195
                  sll          t6, a5, s8
                  fsgnjx.s     ft0, fs9, fa1
                  mulh         t2, a5, s1
                  mul          t1, s7, t3
                  fsgnj.s      fs2, ft6, fa5
                  mulh         t5, a2, t2
                  flt.s        t4, fs4, fa2
                  fle.s        t2, ft2, fs2
                  fmv.x.w      s5, fs10
                  rem          a4, a0, t3
                  addi         t0, a3, 940
                  fcvt.s.wu    ft1, t3, rdn
                  fsgnjn.s     ft4, fa7, fa6
                  fsgnjn.s     fa3, fs3, fs6
                  fsgnjx.s     fa5, ft10, fs5
                  fcvt.s.wu    ft8, s6, rup
                  rem          s0, a4, a0
                  lui          s10, 1016361
                  remu         s0, a4, a3
                  or           tp, a0, t6
                  fsgnjn.s     fs10, ft5, fs0
                  xori         s0, tp, 1323
                  fmul.s       fs3, ft7, fs1
                  fmv.w.x      ft1, a3
                  slli         gp, s3, 19
                  fmv.w.x      fs11, zero
                  xor          t4, t4, s5
                  slt          t1, t4, a5
                  mulhsu       sp, s7, s9
                  ori          tp, t4, -1853
                  fsgnjn.s     fa5, fs8, fs1
                  fcvt.s.w     fa7, s11, rup
                  fmin.s       fs6, fs3, fs1
                  ori          t1, s11, -1652
                  slti         gp, s3, 691
                  rem          a7, sp, t6
                  sltiu        a7, s8, -1187
                  xor          t5, a4, a4
                  fcvt.s.wu    ft0, t1
                  fclass.s     t6, ft7
                  remu         s10, a1, t4
                  fsub.s       ft3, ft3, fs4, rne
                  slti         sp, s1, -1486
                  add          a1, s6, s5
                  fmul.s       fs10, fs1, ft2
                  slli         s6, t6, 30
                  fmv.w.x      ft4, s5
                  remu         s1, t5, s5
                  sltiu        a2, a0, -1843
                  sub          s10, t6, t0
                  fcvt.s.w     fs10, a0
                  sra          t4, s2, t1
                  and          s4, a5, t2
                  fdiv.s       fs6, fs7, fs2, rdn
                  add          s9, t0, s2
                  addi         s4, tp, 1371
                  slti         sp, s7, 1959
                  srli         a4, ra, 7
                  fsqrt.s      fs9, fs9
                  mul          a1, gp, a4
                  flt.s        s6, ft5, fs0
                  xori         a0, s4, 1757
                  srl          sp, a1, a2
                  addi         s4, s9, -812
                  srli         a0, t0, 6
                  fsqrt.s      fs3, fs9
                  fclass.s     t6, fa7
                  fadd.s       fs4, fa4, fs8, rtz
                  srl          t0, t4, t0
                  sub          zero, s7, a7
                  slti         a6, t0, -442
                  add          ra, s8, s1
                  slt          t4, s10, s0
                  slt          tp, t5, s4
                  remu         t2, a5, s4
                  fadd.s       ft8, fs9, fs4, rdn
                  slti         s5, s6, -1910
                  fsqrt.s      fs10, ft9
                  or           ra, t2, a4
                  fmv.w.x      ft3, t4
                  fcvt.wu.s    s5, ft9
                  fmv.x.w      a4, fa3
                  fsgnj.s      fa5, fs4, ft11
                  mulhsu       s10, t2, t5
                  mul          a5, a3, zero
                  and          t4, s9, t0
                  sltu         s3, t2, tp
                  fsgnjn.s     ft2, ft1, fs0
                  mulhu        s6, a4, s10
                  addi         t1, t0, -1784
                  nop
                  fdiv.s       fs1, fs8, fa2
                  mul          a2, a0, s7
                  sll          a1, s9, ra
                  fcvt.s.w     fs8, a6
                  add          s6, t5, tp
                  fcvt.s.w     fs3, t5, rne
                  fsgnjx.s     ft1, fs9, fs3
                  ori          s3, a2, -591
                  divu         s2, s4, t3
                  mulh         t4, s6, a7
                  slti         t0, t0, -1182
                  srai         a0, a2, 0
                  fclass.s     a5, ft11
                  srli         s3, a6, 6
                  fclass.s     s1, fs2
                  fmax.s       fs9, ft7, ft6
                  srl          s2, s0, a2
                  lui          gp, 791005
                  addi         a7, s11, -403
                  fsgnj.s      fs4, fs10, ft4
                  slli         s6, s9, 30
                  or           a7, gp, t4
                  sub          s4, a7, t5
                  sltu         zero, s4, t5
                  fcvt.w.s     a1, ft0
                  xori         t4, t4, 383
                  fsub.s       fa0, ft11, ft5, rdn
                  sra          a3, a0, a6
                  fmul.s       fs9, ft11, fs0
                  fsgnj.s      ft5, ft10, fa2
                  fsqrt.s      fs3, fa7, rdn
                  feq.s        sp, fs6, fa1
                  andi         s5, t1, -1943
                  mul          t5, t6, s7
                  sll          t0, a6, s6
                  andi         s9, t0, -12
                  sltiu        a6, a4, 159
                  srli         s9, s3, 22
                  feq.s        s4, ft9, fs11
                  sll          sp, sp, s10
                  and          tp, t2, a4
                  xor          s4, t5, a7
                  fcvt.s.wu    ft2, ra, rmm
                  fmin.s       ft1, ft2, fs3
                  mulhsu       s4, s6, a1
                  sll          t5, a6, a2
                  fsub.s       fs6, fa5, fs7, rtz
                  sra          a3, t0, s7
                  slti         a5, s4, -628
                  srl          s2, s6, s2
                  fcvt.s.wu    fs8, gp, rtz
                  xori         zero, a3, -1586
                  rem          a0, s5, s8
                  add          a2, s4, t6
                  xori         a4, t1, 1100
                  srai         tp, t4, 15
                  andi         s0, sp, -1006
                  fmul.s       fs1, fs10, ft7
                  srl          s4, s1, s0
                  auipc        t6, 468158
                  slt          t6, a6, a0
                  fcvt.s.wu    fs9, s6, rup
                  fsgnjx.s     fa5, fa4, fa3
                  add          a0, s3, sp
                  fsqrt.s      ft2, ft8
                  nop
                  or           s2, a3, t0
                  sll          t5, zero, s10
                  add          s2, t5, tp
                  fmul.s       fs5, ft8, fs1
                  sll          t1, a6, s9
                  rem          s8, t2, a2
                  remu         a7, t2, t0
                  slt          s1, t2, s6
                  fcvt.s.wu    ft2, s11, rup
                  fle.s        t0, fs7, fs9
                  fcvt.wu.s    s5, fs6, rtz
                  xori         s5, t6, 54
                  sltu         t2, a5, s11
                  fsub.s       ft7, fs10, ft6
                  srli         a7, s9, 10
                  fmv.x.w      s6, ft2
                  fsqrt.s      fs1, ft11
                  rem          a7, s4, a3
                  and          s1, s5, a0
                  sll          a7, s11, s4
                  fsqrt.s      ft3, ft7
                  add          a4, t6, s1
                  xor          t2, s4, s8
                  xori         s9, t0, 1272
                  and          a3, t2, t1
                  fdiv.s       fs1, fa2, fs5
                  fmv.x.w      s4, fs4
                  addi         t2, a2, -2
                  srl          s2, s10, tp
                  fmul.s       fs2, fs3, fa6
                  sra          a5, t1, s1
                  rem          s4, a7, ra
                  sltu         s2, s9, s6
                  srai         tp, a5, 2
                  fmv.x.w      sp, ft7
                  fsgnjn.s     fa7, ft6, fs8
                  srl          zero, t3, t2
                  fsqrt.s      fs10, fa1
                  ori          s8, s9, 85
                  fsgnjn.s     fs11, fs3, fs1
                  fsqrt.s      fa7, fs2, rne
                  xor          gp, a3, t2
                  fcvt.s.w     fs9, s0
                  fmv.x.w      s5, ft7
                  fle.s        s3, fs8, ft0
                  fsub.s       ft2, fs9, fa3
                  sra          t6, t5, s5
                  mul          a4, a1, ra
                  srai         ra, s0, 17
                  mulhu        a2, t4, a5
                  xor          s4, s6, s4
                  sll          s4, s7, sp
                  lui          a7, 260599
                  fcvt.wu.s    s5, ft2
                  divu         t4, a2, t0
                  nop
                  xor          s2, t1, a2
                  flt.s        t5, ft9, fa0
                  fsgnjx.s     fs4, ft9, fs0
                  srli         s10, a2, 12
                  fcvt.s.wu    fs10, s5
                  sub          a0, s3, a5
                  fsqrt.s      ft3, ft9
                  fmv.w.x      ft7, ra
                  mulhu        s0, a7, sp
                  mulhu        a1, s5, s9
                  add          a0, tp, a7
                  div          gp, s4, s8
                  fmin.s       fs1, fs1, ft7
                  fmin.s       ft6, fs7, fs10
                  fsgnjx.s     fs9, fa5, fs4
                  fmv.w.x      fa6, a3
                  srl          a2, t2, s3
                  sra          s8, s7, s1
                  fmin.s       fs5, fs11, ft4
                  fle.s        sp, ft4, fa6
                  remu         t2, s11, sp
                  sltiu        s3, a0, -1067
                  feq.s        tp, fa0, fs2
                  sltiu        tp, tp, 137
                  fmin.s       ft7, ft1, ft0
                  sltiu        tp, t6, 2011
                  fmul.s       fs9, fs2, fa6, rne
                  sltu         a7, t1, ra
                  auipc        a7, 791538
                  auipc        a2, 381465
                  divu         s0, a1, t5
                  and          t4, sp, s4
                  sltiu        t6, s2, -1767
                  remu         s4, s1, a0
                  xor          s3, tp, t2
                  or           s8, a3, s9
                  or           t1, s2, t3
                  slli         a0, a0, 16
                  fcvt.wu.s    a0, ft4
                  auipc        t6, 704188
                  sltu         s0, ra, s9
                  srli         s3, zero, 8
                  mul          t4, t1, a7
                  xor          sp, s8, t1
                  fsgnj.s      fs11, ft6, ft7
                  fcvt.s.wu    ft10, t0, rtz
                  andi         a0, ra, -1609
                  fmin.s       fa2, fa4, ft2
                  mulh         s4, s4, t4
                  slti         a2, s2, 557
                  fdiv.s       fa1, fa4, fs11, rmm
                  xor          a4, sp, ra
                  sltiu        a2, s4, 1370
                  lui          t5, 394289
                  xor          zero, s4, gp
                  srl          a0, a3, t1
                  srl          s4, s8, t0
                  fsub.s       fs11, ft2, fs1
                  div          t5, a6, t2
                  auipc        zero, 790370
                  srai         s0, a0, 27
                  mulh         a1, s3, a4
                  xor          t5, s1, tp
                  fsgnjn.s     fa6, ft4, fs2
                  sub          t6, a7, t2
                  fmin.s       fs1, fs3, fs0
                  fsqrt.s      fs2, fs6, rdn
                  mulh         a0, a1, a6
                  andi         t0, a6, 1254
                  flt.s        s5, ft6, ft0
                  fmax.s       ft10, ft3, ft2
                  or           s3, s9, s5
                  fsqrt.s      fs7, fa5
                  sll          s4, s5, t3
                  and          tp, s7, s10
                  fdiv.s       fa2, ft11, ft5
                  fsub.s       fs8, ft9, fs4
                  fle.s        gp, ft8, fs10
                  or           a5, s6, t0
                  slt          s4, s2, a3
                  lui          s2, 827409
                  auipc        gp, 936984
                  slli         a7, s8, 24
                  mul          a7, s9, a3
                  srai         s2, a3, 2
                  xor          s5, s7, s2
                  fcvt.s.wu    fa6, gp, rmm
                  add          a4, a7, s1
                  xor          s8, a4, t4
                  fcvt.wu.s    tp, fs5, rdn
                  fclass.s     s10, ft1
                  add          ra, a6, s2
                  sltu         gp, sp, a1
                  feq.s        t2, ft10, fs11
                  and          s6, a2, a2
                  sltu         s10, s11, a7
                  xori         t1, a4, 1861
                  fcvt.wu.s    s5, ft0, rup
                  and          tp, s6, s2
                  fdiv.s       ft8, ft10, fa0, rup
                  feq.s        s9, fs9, fa5
                  rem          t4, s5, sp
                  mul          tp, ra, a7
                  andi         t0, t1, -789
                  divu         s6, t3, s6
                  slti         t2, s11, -327
                  auipc        s9, 19038
                  fsqrt.s      ft9, fs11, rdn
                  rem          s8, s11, s9
                  mulhsu       sp, a0, s8
                  div          s5, s2, s7
                  xor          t4, t0, t0
                  fcvt.w.s     t5, fs1
                  mulh         s9, a5, a0
                  sub          ra, s9, zero
                  srl          gp, a3, s7
                  nop
                  fcvt.wu.s    s2, fs2
                  slli         s3, s7, 8
                  slli         t4, gp, 3
                  sll          zero, t0, s6
                  srli         ra, gp, 16
                  sra          a6, s8, gp
                  fcvt.s.wu    fs7, s11
                  ori          zero, t1, -279
                  mulhsu       t4, tp, s0
                  slti         s0, t6, 1561
                  sub          t1, t4, t2
                  fcvt.w.s     ra, fs5
                  fsqrt.s      ft4, fs5
                  srai         tp, s7, 16
                  fmax.s       ft6, fa7, fa0
                  slti         s8, s10, -530
                  srai         sp, s6, 25
                  remu         t5, a4, a6
                  lui          t0, 397501
                  divu         t0, s4, s1
                  fle.s        t1, fs0, fa0
                  fsgnjx.s     fa4, fa3, fs2
                  fsub.s       fs5, ft9, fs9, rdn
                  fle.s        s6, ft8, fs6
                  andi         s6, s6, -1849
                  fcvt.s.wu    fs5, zero, rdn
                  feq.s        gp, ft2, fa0
                  xor          a6, a1, t1
                  nop
                  rem          s9, s5, a5
                  fmv.x.w      t0, fs5
                  add          t2, a7, s1
                  slt          s6, a3, tp
                  ori          ra, s3, -1959
                  mulhsu       s9, a0, t0
                  fsqrt.s      fa0, fa4, rmm
                  fle.s        tp, fa2, fs3
                  fsqrt.s      fa2, fs0
                  ori          s9, s1, 1808
                  fcvt.wu.s    sp, ft0, rtz
                  add          s4, a0, a0
                  fmin.s       ft8, fa6, ft9
                  andi         s2, zero, 1123
                  xori         tp, gp, -1080
                  fle.s        s10, fs2, fs6
                  divu         s8, s7, t2
                  srai         sp, s8, 22
                  slli         a2, a5, 15
                  flt.s        a0, ft3, fa5
                  sltiu        a3, t6, 1137
                  addi         s0, a1, 1259
                  fcvt.s.wu    ft3, s0, rdn
                  addi         a7, a3, 605
                  rem          t0, t4, s5
                  addi         s9, a0, 195
                  srl          t4, t4, t5
                  fsgnj.s      fs9, fs3, fs8
                  sltu         zero, a5, s1
                  nop
                  add          a0, s8, s6
                  remu         t5, s3, s0
                  mulh         s3, t5, t6
                  sltu         t1, tp, s1
                  and          s5, a7, a5
                  lui          ra, 791635
                  ori          s2, a2, -985
                  fsub.s       ft9, fs1, fa1, rtz
                  srl          t1, s5, s8
                  fsgnjn.s     fs6, fa5, ft10
                  srl          s10, a6, s0
                  add          t0, tp, t5
                  srl          a3, a2, t0
                  srl          t6, s4, s11
                  fcvt.wu.s    t2, ft7, rtz
                  nop
                  fmv.x.w      s5, fa5
                  fsqrt.s      fs4, fs4
                  sub          tp, t3, zero
                  xor          t0, s3, a3
                  srl          a5, t1, s8
                  fmv.x.w      a2, ft3
                  sll          a5, t1, t5
                  xor          s5, gp, s6
                  sltu         t6, t4, s10
                  addi         t1, t6, 1254
                  mulhu        a2, t0, sp
                  slt          a1, t4, t6
                  fsgnjx.s     fs10, ft2, ft6
                  ori          a2, a5, -166
                  fcvt.w.s     s8, fs1
                  fsgnjx.s     fs7, ft1, fa5
                  nop
                  fcvt.w.s     zero, fs5
                  fmv.x.w      s9, fs5
                  slti         t1, tp, 1438
                  slti         a7, s2, 920
                  fsgnjx.s     fs5, fs0, fs2
                  fdiv.s       fs9, ft10, ft2
                  feq.s        s3, fs6, ft7
                  divu         a4, s6, a0
                  andi         tp, s4, 644
                  srai         a7, t2, 27
                  lui          s10, 232627
                  fcvt.w.s     s0, fa2
                  fsgnjx.s     fs8, fa0, fs9
                  fmax.s       ft3, fs7, fs11
                  mul          t0, ra, s9
                  fclass.s     a6, fa1
                  sra          a6, s8, sp
                  div          t5, t4, t4
                  sra          t1, t3, zero
                  slt          s2, s8, t6
                  srl          s9, sp, t0
                  fle.s        sp, ft6, fs10
                  fcvt.s.wu    ft5, t5, rup
                  fcvt.w.s     t4, ft5
                  div          t2, s8, t6
                  fle.s        s0, fs8, fa4
                  remu         tp, a6, zero
                  fcvt.w.s     s1, fa1
                  sub          s4, s2, a0
                  sll          s6, a3, s9
                  slt          t4, gp, s6
                  fadd.s       fs7, fs6, ft6
                  auipc        s5, 403802
                  mulh         a3, s0, t2
                  xori         a0, t2, 1827
                  mulhu        t1, s1, s4
                  addi         s3, s7, -1577
                  div          s2, a0, s7
                  mulh         a4, ra, t2
                  fmv.w.x      fs5, s2
                  fsqrt.s      ft1, ft0
                  ori          s9, s0, -712
                  rem          s6, t1, sp
                  fmv.w.x      fa5, t1
                  mulhu        t0, s7, tp
                  sub          t6, a7, s3
                  fcvt.s.w     ft5, t6
                  feq.s        a5, ft10, fs6
                  lui          a4, 561097
                  srai         a4, t6, 13
                  sll          a4, a3, t2
                  or           s5, ra, gp
                  remu         t2, s8, tp
                  fmax.s       fs6, fs5, ft10
                  fcvt.w.s     t4, fa4
                  mulh         t0, s5, s9
                  andi         gp, a6, 1958
                  and          tp, sp, t5
                  fsgnjx.s     ft2, ft10, ft11
                  slti         s2, t1, -507
                  fle.s        zero, ft5, fs9
                  mulhsu       s0, a2, a4
                  fle.s        t6, fa7, ft6
                  slli         a3, gp, 6
                  fclass.s     s10, ft4
                  mulhsu       a0, s11, zero
                  fsub.s       fa1, fs10, fs7, rdn
                  lui          t1, 806031
                  srai         a1, a3, 25
                  sll          s0, s2, s9
                  srli         ra, s9, 4
                  rem          a7, s7, a2
                  fcvt.wu.s    a6, fs2
                  add          s4, a2, ra
                  ori          a4, a7, 802
                  mul          s0, zero, tp
                  fsgnjn.s     fs7, fs1, fs2
                  fmin.s       fa2, fa7, fs6
                  fcvt.s.w     ft11, t6, rmm
                  fsgnj.s      fs10, fs9, fa7
                  flt.s        a3, ft10, fs2
                  mulh         a5, a3, s0
                  and          t5, s1, s6
                  sll          tp, t1, ra
                  fsgnjx.s     fa1, ft6, ft9
                  fcvt.s.w     fs9, t0
                  nop
                  mulhsu       s8, t1, s2
                  fcvt.s.w     fs6, a2, rtz
                  rem          sp, a1, a6
                  sltiu        s6, a6, -159
                  sll          s6, t0, s8
                  slt          a3, s8, s3
                  xor          t5, gp, t1
                  xor          a1, t5, s0
                  fcvt.wu.s    s10, fs11
                  mulhsu       a5, zero, s8
                  mulhu        t4, s10, a0
                  nop
                  slt          a6, t5, t1
                  fcvt.s.wu    ft7, a0, rne
                  div          a2, t1, s4
                  fsgnjn.s     fs8, fs3, fa7
                  addi         s4, s0, 1101
                  mulhu        t0, a6, a0
                  srl          t1, s3, zero
                  and          ra, s10, s3
                  slti         a1, s8, -164
                  fmul.s       ft7, fs5, ft10, rdn
                  fcvt.s.w     ft5, a3, rne
                  mulh         ra, s1, s3
                  fclass.s     sp, ft9
                  fsgnjn.s     fa6, fa5, fa1
                  fsqrt.s      ft3, ft1, rdn
                  fadd.s       fs3, fs1, fa6
                  xor          t0, t6, a2
                  fcvt.wu.s    s2, ft6, rup
                  xor          t1, a2, s7
                  add          s10, t6, tp
                  fsgnjn.s     ft6, fs9, ft10
                  fsgnj.s      ft2, ft4, ft10
                  fmax.s       fa2, fa0, fs6
                  add          t5, a4, s4
                  slt          s2, t2, s0
                  remu         a3, a7, s9
                  fcvt.wu.s    s4, fs11
                  fcvt.wu.s    a1, ft4
                  auipc        s8, 626175
                  mul          t6, tp, a4
                  sub          sp, t6, sp
                  andi         t1, t2, 444
                  fcvt.s.wu    ft7, s7, rne
                  div          t0, s4, s9
                  fsgnjn.s     ft9, ft4, fs4
                  fmin.s       ft1, fs0, ft0
                  andi         t2, s11, 1910
                  ori          s5, t1, 2023
                  sltu         s1, s9, s0
                  sltiu        s1, s5, -1466
                  fmul.s       fa7, fs0, ft5, rdn
                  xor          s6, s8, ra
                  slti         gp, gp, -979
                  slli         s9, s6, 11
                  mulhu        t6, ra, s8
                  fmax.s       ft8, ft11, ft7
                  mul          t1, s10, a6
                  fle.s        t1, fs7, fs1
                  lui          a5, 301305
                  slt          s0, s1, t6
                  fcvt.w.s     zero, fa7
                  sltu         s9, gp, a6
                  sltiu        t2, t2, -341
                  fcvt.s.wu    fs0, s3
                  lui          a3, 148917
                  sra          a7, a2, a3
                  sltiu        sp, a5, -1128
                  srl          a6, sp, t3
                  slt          t0, a3, t4
                  fclass.s     a6, fs6
                  or           s1, s0, s10
                  xori         s4, a5, -1116
                  fmax.s       fs0, ft6, fs9
                  fcvt.wu.s    sp, fa5, rdn
                  and          s2, t4, s4
                  ori          s5, a3, 2044
                  ori          a4, t3, 1053
                  slt          a5, s0, t3
                  slli         s3, s9, 17
                  sltu         s2, s0, s6
                  lui          a2, 329290
                  add          t2, zero, a0
                  nop
                  fsgnjx.s     fs7, fa3, fs5
                  fcvt.w.s     zero, ft7, rtz
                  add          t1, sp, t1
                  ori          s1, t4, -426
                  mul          a1, tp, a0
                  fadd.s       fa4, fs2, fs1
                  ori          a1, t1, -562
                  addi         s0, t0, -931
                  fmax.s       ft5, fs2, ft2
                  div          t0, a3, t3
                  addi         a1, zero, 138
                  srai         s3, t2, 12
                  sltiu        s5, t4, -213
                  sltu         s2, s3, s7
                  slt          s3, t6, a4
                  sub          s1, s8, s6
                  sll          a1, a3, a6
                  slti         s4, s1, 326
                  fsgnj.s      fs5, ft9, fs11
                  sltu         a2, t4, s1
                  sub          t4, s4, s5
                  or           s3, t5, a2
                  sra          s3, s0, s3
                  flt.s        tp, ft7, fa6
                  flt.s        s3, ft8, fa6
                  lui          s9, 215975
                  xor          t4, a0, s3
                  add          a2, t4, zero
                  fcvt.s.w     ft7, tp, rmm
                  remu         zero, sp, s9
                  nop
                  fcvt.s.w     fs4, a4, rtz
                  mulhsu       a4, t0, a6
                  lui          sp, 369861
                  slti         tp, s6, 1675
                  sltiu        a0, ra, 1875
                  div          a5, s5, t0
                  fmv.w.x      fa3, t4
                  fclass.s     a4, ft4
                  slli         gp, a5, 9
                  fle.s        s3, fs5, fa0
                  sll          sp, a6, s1
                  srl          t1, t1, a5
                  sltu         t6, a3, s10
                  xori         t1, tp, 1051
                  nop
                  or           a2, ra, a0
                  srai         s0, a0, 1
                  slti         s4, a1, 1310
                  srl          gp, a4, s3
                  fdiv.s       fa3, ft11, fs8
                  add          gp, s9, s4
                  slt          gp, ra, t6
                  lui          ra, 864265
                  auipc        s4, 781459
                  fclass.s     t2, fa6
                  slt          a0, zero, s7
                  xor          s3, t3, a0
                  ori          s3, sp, 672
                  remu         a5, s1, t3
                  div          ra, s3, s3
                  divu         zero, s2, a2
                  slli         a7, s1, 20
                  fsqrt.s      fa5, ft3, rup
                  sll          t2, s10, s9
                  xor          gp, s5, t5
                  fsgnjx.s     ft3, ft11, ft0
                  fcvt.s.wu    ft9, s6
                  rem          a6, t3, s10
                  fdiv.s       ft7, fs11, fs1
                  slti         t4, ra, -1824
                  addi         s9, t3, 2035
                  fsub.s       ft4, fa4, fa2
                  fcvt.s.wu    ft8, t1, rdn
                  fmul.s       fs7, fs5, ft5
                  fcvt.s.w     fs9, s5
                  flt.s        sp, ft7, ft2
                  xor          zero, sp, a6
                  rem          s5, s1, s7
                  remu         a7, a3, t5
                  addi         gp, s8, -1426
                  flt.s        s0, fs7, fs3
                  sub          s6, tp, s7
                  srl          a5, a6, t2
                  fmul.s       fs5, fs8, fs6
                  fdiv.s       ft10, fs8, ft11, rmm
                  fmv.x.w      s9, fs3
                  slti         s3, a5, 1138
                  fmul.s       fa3, fs7, fs0, rmm
                  srli         s10, s2, 2
                  fle.s        s4, fa1, fa2
                  mulhsu       s9, s11, s2
                  slli         a4, ra, 25
                  sub          gp, a2, t0
                  fmv.w.x      ft0, a0
                  fsub.s       fs2, fs2, fa2, rup
                  flt.s        s4, fs4, fs4
                  srai         t4, s4, 27
                  fsgnjn.s     ft4, fs0, fs8
                  fcvt.wu.s    a7, fs5
                  xor          t0, ra, t4
                  slti         s9, a4, -1119
                  mulhu        a0, s2, a6
                  fcvt.s.wu    fa3, s7
                  slt          a1, t3, s0
                  fadd.s       fs8, ft4, fs3
                  fsgnjx.s     fs3, ft7, ft8
                  fcvt.s.wu    fs1, s9
                  rem          s1, gp, zero
                  srl          t4, a3, a6
                  fsgnjn.s     fs4, ft3, fa1
                  div          s2, zero, a1
                  fmax.s       ft8, fa6, fa2
                  slt          s0, t3, t1
                  rem          s5, gp, a7
                  xori         t4, s7, -859
                  sltiu        gp, s9, -1409
                  rem          t4, t6, s2
                  fmin.s       fs9, fs10, fs7
                  feq.s        zero, ft0, fs3
                  srl          s10, sp, s1
                  sub          ra, s0, s9
                  slt          s2, gp, gp
                  srli         tp, a4, 30
                  sll          t1, s4, s7
                  mulhu        a5, gp, t5
                  auipc        s3, 32933
                  srai         s2, s5, 13
                  sra          a4, s11, s1
                  divu         t4, s4, s6
                  xori         sp, s4, 494
                  fsub.s       ft11, ft1, ft1
                  slti         t4, t3, -840
                  lui          gp, 974852
                  and          s3, t4, tp
                  mulh         s8, t2, s3
                  fadd.s       ft9, fa5, fs11
                  fmv.w.x      ft2, a7
                  fsgnjx.s     fs7, ft1, ft8
                  or           a5, a7, a1
                  srli         s8, gp, 31
                  mul          s5, t5, t0
                  fmax.s       fa4, ft7, fs8
                  xor          ra, t3, s0
                  fclass.s     sp, fs10
                  sub          gp, zero, t6
                  flt.s        tp, ft6, ft2
                  sltu         a6, zero, s10
                  auipc        t5, 112923
                  fsqrt.s      fa2, fs11
                  fmv.w.x      fa1, sp
                  srl          a6, s0, zero
                  fmv.w.x      ft11, a6
                  sltu         sp, sp, s11
                  fsub.s       fa0, fs0, ft5, rup
                  sltu         t2, s4, t5
                  fsgnjx.s     ft4, ft3, ft3
                  add          a2, a5, t2
                  ori          a6, s8, -1559
                  fcvt.s.w     ft8, t4
                  slt          a2, s10, s10
                  andi         a3, s2, -607
                  nop
                  nop
                  add          a5, t4, s6
                  mul          sp, t5, a6
                  fsgnjn.s     fs0, ft4, ft9
                  ori          a4, a2, -1914
                  fsgnjx.s     fs8, fa7, fs3
                  sra          s5, s8, a1
                  srai         t0, a7, 7
                  remu         a4, a1, sp
                  flt.s        a5, ft7, fs10
                  fcvt.w.s     s6, ft0
                  and          tp, gp, a5
                  slli         tp, sp, 3
                  fmv.x.w      t4, fs8
                  mulhu        a7, s7, s1
                  mul          s1, s3, a7
                  sub          tp, s11, s3
                  fsgnjn.s     ft2, ft2, fa4
                  fdiv.s       ft3, fa7, fa6, rdn
                  mulh         s2, tp, t2
                  fcvt.s.wu    ft9, s8, rup
                  fsgnjx.s     ft10, fa0, ft1
                  fmv.x.w      t4, fs8
                  fcvt.w.s     t1, ft2
                  mulhsu       s5, s3, t0
                  fcvt.s.wu    ft8, s4
                  xori         a2, s7, -602
                  srl          tp, t0, ra
                  fcvt.s.w     ft10, s7
                  mul          t6, a5, tp
                  feq.s        a5, fa6, ft4
                  fsub.s       fs4, fs7, ft7
                  slt          s3, a0, s11
                  div          s10, ra, gp
                  srl          a6, a4, s10
                  fclass.s     a6, fs1
                  fdiv.s       ft2, ft1, fa1, rup
                  fadd.s       fa1, fs11, fs5
                  mul          a2, a6, a3
                  rem          t2, a0, s7
                  sll          t5, a7, s3
                  sll          s3, t4, s8
                  fsgnjn.s     fa6, ft10, ft7
                  fsgnjn.s     fa0, fa5, fa0
                  fsgnjn.s     ft2, ft11, fa1
                  fcvt.s.wu    fa5, t5
                  sra          s5, a7, s7
                  sll          a3, s11, a3
                  fle.s        a4, fa2, fs7
                  fcvt.wu.s    a4, fa2, rup
                  fsgnjx.s     fa0, ft11, fs9
                  fmax.s       fa6, fa1, fa0
                  flt.s        s4, ft6, fa7
                  lui          s10, 216580
                  sltiu        s2, s8, 582
                  sra          t0, gp, s0
                  addi         a5, t1, -2002
                  srl          t6, zero, t3
                  mulhu        s9, a6, t0
                  auipc        t0, 154508
                  feq.s        sp, fs4, fs3
                  mulhu        s8, sp, s3
                  fclass.s     a1, fa5
                  xori         s0, t3, 1040
                  andi         gp, t0, -1244
                  fsgnjn.s     fs8, fs8, fs8
                  mulhu        s9, a6, a1
                  sltu         s9, t6, a7
                  fle.s        a0, fa0, ft6
                  remu         s1, s4, a1
                  srai         s2, s1, 10
                  and          a6, s1, s1
                  flt.s        t0, fs7, fa6
                  sltiu        s10, t0, 851
                  nop
                  mul          tp, a1, s2
                  mulhsu       t2, s10, a3
                  fmin.s       ft5, fa2, fs5
                  fdiv.s       fs7, ft1, ft6
                  mul          a4, sp, t5
                  fmax.s       fa5, fs0, fs3
                  addi         s6, a4, 588
                  sra          s1, a0, a1
                  fcvt.wu.s    a7, fs10
                  xor          t2, s8, a6
                  flt.s        a2, fa1, fa1
                  lui          tp, 336773
                  add          a4, s10, t0
                  feq.s        t5, ft7, fa1
                  srai         a0, zero, 21
                  srl          a3, s1, t0
                  fdiv.s       fs1, fs6, fs2, rup
                  fsqrt.s      fs1, fa0, rne
                  mul          sp, sp, a2
                  addi         zero, s0, 1985
                  addi         a3, t0, 137
                  sub          s0, s7, s5
                  mulh         sp, zero, zero
                  ori          s6, t2, -1853
                  div          tp, s0, a0
                  fsub.s       fs5, fs2, ft7, rmm
                  flt.s        a2, fs1, fs2
                  fmax.s       fa5, ft5, ft1
                  xor          gp, a0, a2
                  nop
                  addi         a6, a5, 223
                  fcvt.wu.s    a2, fs7
                  fcvt.s.w     fs1, s0
                  fmin.s       fs4, fs3, ft6
                  fcvt.w.s     a6, ft5
                  remu         a5, t0, s4
                  andi         t2, a4, 1640
                  sub          a7, s4, a1
                  nop
                  nop
                  fdiv.s       ft9, ft9, ft3
                  ori          s5, s6, -663
                  auipc        tp, 180627
                  srai         a6, sp, 11
                  fsgnj.s      fs9, ft6, fa3
                  sll          ra, t3, a3
                  slt          s10, t6, s2
                  add          sp, zero, a4
                  fsub.s       fa7, ft7, fs0
                  addi         s1, t0, -1581
                  fcvt.w.s     s2, fs9, rmm
                  remu         t6, t2, a6
                  srl          gp, s11, s0
                  lui          a7, 1019395
                  fsqrt.s      fs1, fs5
                  fsgnj.s      fa4, fa2, fs9
                  fmul.s       fs7, ft10, fs3, rtz
                  fmv.w.x      fs10, a5
                  xori         s9, s11, 1417
                  andi         a0, s6, 469
                  fdiv.s       fs1, fs9, ft10
                  remu         a1, s0, sp
                  fmul.s       fs4, ft1, fs7, rdn
                  fmin.s       ft11, ft5, fs9
                  mulhsu       tp, ra, s4
                  divu         a3, t2, a5
                  fmv.x.w      s2, fa7
                  srai         s5, s4, 24
                  fsgnj.s      ft6, fa6, ft10
                  ori          s9, a2, -1020
                  fcvt.w.s     s9, fa2, rmm
                  divu         a1, a5, gp
                  auipc        s6, 948661
                  fdiv.s       fs7, ft11, fs8, rdn
                  srl          sp, a5, s6
                  sltu         zero, t5, tp
                  slt          s9, gp, a0
                  ori          a2, zero, 468
                  fdiv.s       ft10, ft6, fs5, rmm
                  sltiu        s8, s1, -778
                  nop
                  xor          a6, a6, t1
                  and          s9, s2, a1
                  fsqrt.s      fs8, fs11
                  sltu         s6, gp, t4
                  feq.s        a5, ft10, ft11
                  nop
                  fclass.s     s8, fs6
                  fadd.s       fa3, fs0, ft1, rne
                  srl          t2, s9, s6
                  flt.s        a6, ft11, fs1
                  fmul.s       fs6, ft6, fs8
                  sltu         s0, zero, t1
                  fsgnj.s      fs7, ft5, fs0
                  remu         a4, s9, tp
                  auipc        s10, 815316
                  fsgnjx.s     fa6, ft0, fs1
                  fmin.s       fs9, fs2, ft11
                  mulhsu       a2, s10, s8
                  rem          sp, s8, ra
                  feq.s        a1, ft4, fa4
                  div          s1, s7, t1
                  fmin.s       ft3, ft6, fs10
                  fmv.w.x      ft10, t6
                  fmin.s       fa7, fs6, fa0
                  slli         t2, a3, 20
                  mulh         a6, s0, a5
                  fcvt.wu.s    a2, fs4, rne
                  rem          ra, t6, sp
                  lui          s0, 288017
                  xori         a4, s6, -253
                  fmv.x.w      sp, fs3
                  slti         t6, a2, 244
                  srli         s5, a7, 19
                  sll          a4, a1, s6
                  fsgnjn.s     fs5, fs8, ft4
                  sltu         t5, s5, t5
                  fmax.s       fa7, fs1, fa0
                  fmv.x.w      s9, fs2
                  xori         a1, s1, 1666
                  div          gp, sp, s9
                  feq.s        s2, fs11, fa5
                  fclass.s     sp, fa4
                  fadd.s       ft7, fs7, fa7, rdn
                  slt          a3, s3, a2
                  fsub.s       fs4, ft1, ft3
                  fle.s        zero, ft7, ft6
                  andi         s1, t4, -614
                  flt.s        a7, fs2, ft9
                  fclass.s     a4, fs3
                  feq.s        s8, fs3, ft10
                  fclass.s     a1, ft3
                  andi         a6, s0, -1909
                  andi         sp, s5, -228
                  fmin.s       fs5, ft1, ft7
                  addi         tp, t6, 951
                  slli         gp, a7, 8
                  srai         a3, a7, 6
                  fmin.s       fs5, ft1, fa2
                  auipc        s4, 321789
                  ori          ra, s4, 1481
                  srli         a2, t6, 3
                  mul          t4, a4, s2
                  ori          a2, s9, -1758
                  nop
                  mulhu        t4, a0, s6
                  fmv.w.x      fs0, t1
                  fsub.s       ft7, fa2, ft9
                  srli         t0, t3, 6
                  addi         a7, zero, 205
                  sll          s4, ra, s2
                  fle.s        s1, fa4, fs6
                  rem          s5, s11, zero
                  sra          a6, s4, s6
                  srl          t6, a0, sp
                  fsub.s       fa4, fa7, ft3, rmm
                  fsub.s       ft9, ft1, ft7, rdn
                  addi         tp, t0, -1216
                  fcvt.s.w     fa6, t4, rne
                  nop
                  xor          a5, a2, s3
                  rem          t5, t5, t4
                  and          s9, t2, s2
                  mul          s8, ra, s2
                  slli         a5, t0, 23
                  sll          s3, s7, a4
                  fcvt.s.w     fs7, gp
                  slti         a4, sp, 1276
                  fcvt.w.s     a4, fa7
                  fcvt.wu.s    a1, ft4, rmm
                  fmul.s       fs6, fs6, fs1
                  xor          s6, a5, a4
                  or           a0, a2, s9
                  mulh         s3, a0, a6
                  srai         a2, a0, 9
                  mul          s1, a5, a1
                  fmin.s       fa4, fa4, fa5
                  sub          a3, s0, a1
                  rem          t1, a5, a1
                  sltu         a7, a6, a1
                  and          zero, a1, zero
                  fdiv.s       fs2, fs7, fs6, rtz
                  fmv.x.w      s5, fs4
                  srli         a2, t2, 19
                  ori          a7, s10, -1230
                  mulhsu       t0, a6, s11
                  flt.s        s4, fa0, fa2
                  fmv.w.x      fs10, t2
                  auipc        s4, 166536
                  add          a2, a2, zero
                  fclass.s     a6, ft8
                  fmul.s       fs1, fa6, fa0, rmm
                  remu         s4, a1, a1
                  flt.s        s9, ft8, fa3
                  and          s5, s0, ra
                  fle.s        sp, fs1, fa6
                  mulhu        a3, ra, t4
                  fsqrt.s      fs11, ft4
                  divu         s4, gp, s4
                  nop
                  div          s5, s1, t4
                  fsub.s       fa1, ft10, fs4
                  fsgnjx.s     ft5, fs4, ft9
                  fsgnj.s      fs5, fs3, fa7
                  sltiu        s5, s0, 1905
                  fsqrt.s      ft7, fs9, rdn
                  fle.s        a7, fs10, fa1
                  addi         s0, t6, -1193
                  flt.s        a1, ft1, ft7
                  fsgnj.s      fa0, fa1, fa7
                  or           a3, s1, t2
                  fmv.w.x      fa1, ra
                  sltiu        a6, a6, -234
                  and          a5, s1, a4
                  srl          a4, a6, t4
                  lui          s6, 226063
                  fmin.s       ft8, fa3, fs9
                  slt          a2, a3, s5
                  lui          s1, 97714
                  fcvt.w.s     zero, ft0, rup
                  remu         t5, s2, s11
                  auipc        a0, 798688
                  xori         s3, ra, -1618
                  addi         s4, s4, 890
                  and          s8, s11, s7
                  rem          s3, t5, a1
                  slli         a1, s9, 3
                  rem          zero, s0, s9
                  sll          t0, t2, sp
                  mul          sp, sp, s8
                  fcvt.s.wu    ft5, s3, rup
                  fcvt.s.w     ft8, a7, rne
                  fmv.x.w      s2, fs10
                  fmv.x.w      t5, ft7
                  fmax.s       fs1, fs11, fa5
                  mulh         t2, t0, a5
                  divu         t0, s11, tp
                  mulhu        s4, s3, s4
                  fcvt.s.w     fa0, s6, rdn
                  and          a0, ra, zero
                  fcvt.w.s     s9, fa3
                  fsgnjx.s     fs2, fs0, ft8
                  fmin.s       ft7, ft3, fa1
                  fdiv.s       fs11, ft1, ft10
                  fcvt.wu.s    ra, ft11
                  fadd.s       fs0, fs1, fa3
                  fsgnjn.s     ft3, ft0, fs4
                  lui          s9, 123975
                  fsgnj.s      fs9, fs6, ft9
                  fsub.s       fs5, ft4, fs2, rne
                  feq.s        t2, ft10, fa1
                  fmax.s       fa2, fa5, ft5
                  fcvt.wu.s    a3, fs11, rtz
                  sltiu        a5, zero, 1513
                  srli         s4, s3, 29
                  sll          a5, t0, s6
                  xor          s10, s6, a0
                  sltu         a7, t0, a6
                  fadd.s       ft0, fs5, fs10
                  fle.s        s3, fs4, ft8
                  andi         s2, t2, 1539
                  fdiv.s       ft4, fs5, ft7
                  fcvt.w.s     s10, fa1, rmm
                  fadd.s       fa6, fa1, fa6, rtz
                  srai         t0, s0, 15
                  mulhu        a7, ra, s0
                  fmul.s       fs6, ft5, ft7, rmm
                  fmul.s       ft11, fs5, fs0, rup
                  fcvt.w.s     ra, fa6, rne
                  fcvt.wu.s    s6, fa4, rne
                  remu         a7, a7, t6
                  andi         s3, s0, 1064
                  divu         a4, t0, s11
                  fmul.s       fa4, ft1, ft6
                  add          s8, t5, a2
                  mulhsu       sp, s2, t4
                  flt.s        t2, fa1, fs0
                  slt          s10, t0, s3
                  remu         s8, t2, s4
                  fsgnjx.s     fs10, ft7, fs1
                  andi         s10, ra, 1740
                  fcvt.wu.s    t6, fs8, rup
                  add          s5, a6, s5
                  feq.s        s5, ft5, fs5
                  fmv.x.w      t0, fa0
                  slti         a2, ra, 998
                  flt.s        a4, ft2, fa3
                  fmv.w.x      fs7, a1
                  sltu         sp, t6, zero
                  sltu         s9, s5, t2
                  mulhu        t0, a0, zero
                  sra          a5, gp, s5
                  lui          a3, 333935
                  xor          gp, a3, s5
                  mulhsu       ra, gp, s3
                  sll          ra, a6, a4
                  fcvt.w.s     t2, fa4
                  sll          t2, s9, s0
                  rem          t4, s7, s2
                  and          tp, s6, a4
                  xor          s9, t0, a3
                  sll          s0, a0, s4
                  sltu         a7, s1, a7
                  slt          t0, a1, t1
                  sll          s5, s9, a4
                  sll          a3, a2, a1
                  slli         a3, t1, 9
                  fmv.x.w      s9, fs4
                  mulh         s8, tp, a4
                  fmax.s       fa5, fs10, fa5
                  sll          gp, s10, a3
                  or           a1, s10, ra
                  lui          s0, 7483
                  fsgnjn.s     ft5, fs1, ft0
                  fadd.s       fa5, fa6, fs6
                  and          a4, s4, s1
                  andi         a3, t4, -372
                  fcvt.s.wu    ft8, s3
                  mulh         t0, s8, t2
                  slli         s3, t6, 7
                  andi         t0, t3, -958
                  sll          t4, s0, s10
                  rem          s3, a6, a6
                  xori         tp, a0, 1255
                  mulhu        gp, s2, t2
                  fsgnjx.s     ft1, ft11, ft7
                  fmin.s       fs7, fa4, ft0
                  remu         a4, s2, a0
                  flt.s        s4, ft4, fs7
                  fsgnjn.s     ft8, fs1, fs2
                  fcvt.s.wu    fs11, s10, rmm
                  fsgnjx.s     ft8, ft8, fs11
                  sra          zero, s0, zero
                  sub          t1, s11, s11
                  fsgnjn.s     fa3, fs1, ft9
                  fadd.s       fs11, fs2, ft7
                  srli         sp, a0, 15
                  andi         zero, s1, -1228
                  srl          a5, a6, a3
                  mulhu        ra, a6, a2
                  add          s2, t5, t4
                  div          t2, a3, zero
                  sub          tp, s2, s7
                  mulh         s9, a3, a6
                  sltiu        t1, zero, 1218
                  fdiv.s       fs3, fs7, fa6
                  andi         zero, t3, -1923
                  fmv.w.x      ft7, t6
                  xor          s0, a2, t2
                  ori          s6, a2, -1636
                  remu         a1, gp, s1
                  fcvt.s.w     ft4, t6
                  fsgnjn.s     ft6, ft4, ft0
                  fsqrt.s      ft8, fs0
                  fmv.w.x      fs3, a1
                  add          a5, s8, a2
                  fclass.s     t2, fa5
                  remu         s3, t0, gp
                  sll          s10, tp, s2
                  rem          ra, sp, t1
                  sra          a2, ra, t0
                  sra          t4, s2, ra
                  mul          s2, s9, s3
                  fcvt.s.w     ft5, a5, rdn
                  div          s0, s4, a7
                  fcvt.s.wu    ft6, a6
                  flt.s        sp, fa4, fa2
                  sltiu        t5, s3, 1429
                  xor          t1, t4, s3
                  slti         s4, s11, -1113
                  remu         zero, t4, s4
                  fcvt.s.w     ft11, s2, rdn
                  srl          s2, gp, t4
                  fmax.s       fs10, fs7, ft9
                  fsqrt.s      ft8, ft10
                  srli         t6, a6, 25
                  nop
                  fcvt.wu.s    t0, fa6, rne
                  sltiu        a7, s4, 1086
                  srli         ra, a3, 19
                  flt.s        s1, fa5, ft1
                  fmin.s       fs1, fs3, fs6
                  fsgnjn.s     fa4, fa2, fa0
                  feq.s        s2, fs10, fa6
                  mul          t5, s4, sp
                  fmax.s       ft6, ft10, fa1
                  srai         s9, a5, 13
                  srai         a3, s9, 5
                  remu         t2, t3, s10
                  fadd.s       fs5, fa7, fs4
                  fcvt.s.w     fs9, s0
                  div          s6, s3, s6
                  nop
                  srli         s5, s4, 25
                  slli         a3, s7, 22
                  fcvt.s.wu    ft3, ra, rdn
                  fle.s        ra, fs3, fa4
                  addi         a4, s10, -1209
                  fcvt.s.wu    fs1, s5
                  feq.s        t6, ft10, ft5
                  auipc        tp, 423008
                  flt.s        t6, fa7, fs7
                  nop
                  mulhsu       s0, t4, s8
                  slti         t5, t4, -615
                  sll          tp, s3, tp
                  fcvt.wu.s    gp, fa2, rtz
                  remu         ra, a5, s6
                  xor          a0, s5, s11
                  fle.s        a7, ft6, ft1
                  mulhu        s10, t1, s10
                  fle.s        s6, fa7, ft8
                  or           t2, s0, s0
                  srli         t6, a6, 3
                  xor          gp, t5, s0
                  xori         t1, t2, -1830
                  divu         t1, a1, gp
                  fmax.s       fs0, fs1, fa0
                  fmv.w.x      fs3, a0
                  or           t0, a4, a0
                  fclass.s     s8, ft6
                  fcvt.wu.s    s9, fa3
                  fadd.s       fa2, ft10, fa4, rmm
                  sub          a1, t1, s9
                  srai         a4, gp, 28
                  srli         t5, zero, 5
                  fmv.w.x      ft7, t0
                  sltu         s9, sp, a3
                  lui          sp, 106376
                  fmv.x.w      s0, ft0
                  fsgnj.s      fs2, fs11, fs8
                  fadd.s       ft1, fa2, fs0
                  slli         ra, t5, 1
                  add          t2, a1, s6
                  and          s0, s5, a4
                  fclass.s     sp, ft8
                  fsgnjn.s     fs5, fs2, fa3
                  sll          a3, a1, s9
                  slt          t1, a5, s3
                  fmul.s       fs4, fa2, fs11, rup
                  div          a7, tp, a1
                  xori         t1, s1, -1988
                  divu         t1, sp, ra
                  srai         a1, s1, 20
                  slti         a5, s6, -1038
                  ori          t6, t1, 527
                  slti         a7, s2, 1846
                  fmv.x.w      s8, fs8
                  fcvt.s.wu    fs4, s5
                  srl          tp, s4, s0
                  divu         a4, t0, s1
                  and          s9, t3, s3
                  fcvt.s.wu    fa7, a4, rup
                  mul          s3, s4, s6
                  andi         sp, a0, -304
                  fmv.x.w      s2, fs0
                  fmin.s       fa3, fs10, fs2
                  rem          t1, ra, s7
                  fadd.s       fs3, fs7, ft2
                  auipc        a6, 363136
                  auipc        t2, 826500
                  andi         a0, s9, 417
                  srai         sp, t4, 12
                  fmv.w.x      fs10, s10
                  addi         a7, a5, 423
                  srai         a3, s6, 19
                  sltu         a5, gp, a4
                  flt.s        s0, fa3, ft1
                  fcvt.wu.s    s1, fa7, rne
                  fsqrt.s      fs6, ft7
                  ori          a7, a2, -1008
                  sltu         s10, zero, a0
                  fcvt.s.wu    fa6, s9
                  sll          a0, a7, s6
                  or           a6, t6, zero
                  fsgnjx.s     fa1, fs6, ft10
                  ori          s2, t6, 593
                  ori          s3, t6, 1285
                  fcvt.wu.s    s10, ft8
                  fsqrt.s      fs1, fs3
                  fsgnjn.s     fa0, fs11, fa1
                  nop
                  div          t0, a0, s5
                  srl          zero, t0, s11
                  andi         s6, t3, 1512
                  mulh         s2, s4, s11
                  mulh         a7, s3, s10
                  lui          s4, 612255
                  fcvt.s.wu    fa1, t5
                  fmax.s       ft2, fa0, fa4
                  mulhsu       s5, s1, a4
                  sll          s1, a4, s1
                  sra          zero, s4, a6
                  mulhsu       s0, a2, s3
                  div          a2, s7, t6
                  xori         s2, t3, -1603
                  nop
                  flt.s        s6, fa7, fa5
                  feq.s        s6, fs10, ft9
                  sll          a2, a1, s11
                  srai         s8, a7, 10
                  mul          a6, s8, s7
                  mulhsu       ra, a6, s11
                  auipc        ra, 142946
                  fcvt.s.wu    fs10, s11, rmm
                  fmul.s       ft1, fa0, fs11
                  auipc        s4, 1027233
                  lui          s1, 926721
                  fmv.x.w      t5, ft10
                  fmv.x.w      tp, ft4
                  slti         t1, a6, -1020
                  andi         ra, a0, 2039
                  div          s10, a3, ra
                  lui          t1, 874447
                  fmv.w.x      fs8, a5
                  sltu         a6, a4, zero
                  feq.s        sp, ft6, fs4
                  fmv.w.x      fs10, s3
                  add          sp, a3, a0
                  nop
                  fmax.s       fa0, ft4, ft6
                  and          a4, a3, s11
                  fsgnj.s      fs2, fa6, ft2
                  srli         t1, ra, 26
                  fcvt.wu.s    a5, ft4
                  auipc        t0, 720680
                  srl          a2, gp, s8
                  divu         t4, t6, t6
                  srai         tp, t3, 9
                  and          a4, s2, s11
                  fdiv.s       fs7, fa3, fa4
                  div          ra, s9, s8
                  fmv.x.w      s1, fs9
                  fle.s        ra, fs6, fa6
                  slli         s8, a3, 20
                  and          tp, s6, t3
                  fcvt.s.w     fs0, s7, rtz
                  fmv.x.w      s2, ft9
                  fdiv.s       ft1, ft7, fa0, rmm
                  nop
                  mulh         sp, t1, s10
                  fcvt.s.w     fs7, s9, rne
                  slli         a3, zero, 14
                  mulhsu       a4, s4, a4
                  xor          a6, sp, s9
                  fcvt.wu.s    a5, fa0, rup
                  fsqrt.s      fs5, ft6, rmm
                  fadd.s       ft10, fs7, ft8
                  and          a0, t3, s4
                  mulhu        a1, a3, t6
                  andi         s0, t5, -273
                  mulhsu       s1, t6, a1
                  mulhsu       s10, t1, s9
                  flt.s        t1, ft0, ft3
                  fmin.s       fs5, fa2, fa7
                  feq.s        a6, ft5, ft3
                  lui          t6, 468421
                  fsqrt.s      fs4, fs4, rmm
                  div          a1, s2, gp
                  fdiv.s       fa7, fa2, fa5
                  sra          gp, s10, a0
                  fadd.s       fs6, fa3, fs9, rdn
                  fcvt.w.s     a0, ft5
                  fmv.x.w      s9, ft0
                  slli         t5, s4, 7
                  fsub.s       ft3, ft11, fs11, rne
                  slt          a2, tp, t2
                  fsqrt.s      ft2, fa3
                  sub          a7, a6, t2
                  fsub.s       fs5, fs10, fs9
                  andi         s10, t4, -590
                  feq.s        s6, fs8, ft7
                  and          tp, s9, a5
                  fcvt.s.wu    ft4, a4, rmm
                  fdiv.s       fs7, fa2, fa7, rup
                  mul          t6, s9, a4
                  srai         t1, t1, 15
                  mulhsu       a3, a4, s2
                  fmv.w.x      fs7, a0
                  fclass.s     ra, ft7
                  fsub.s       fa6, ft9, fs7, rdn
                  remu         a4, s1, a5
                  sll          s5, t1, t5
                  fadd.s       fs4, fs0, fa7, rdn
                  sll          s9, a2, a3
                  fmv.w.x      ft9, a6
                  fmax.s       fa0, ft4, fs7
                  xor          s10, t6, gp
                  fcvt.s.w     ft4, t6
                  srai         s6, s8, 8
                  srli         a4, s5, 19
                  fcvt.w.s     t5, fs5
                  fmin.s       fs6, fs8, fs9
                  nop
                  fmin.s       fs9, fs4, ft0
                  ori          s8, a6, 1895
                  fmv.x.w      a4, ft2
                  mulhsu       t1, s4, t6
                  rem          a4, s7, a0
                  xor          a6, a3, s9
                  fle.s        s8, fs0, fs9
                  fcvt.s.wu    ft4, s7
                  and          t4, a7, zero
                  mulhu        s8, s7, a6
                  fsgnj.s      fa0, fs11, ft0
                  fadd.s       ft4, ft8, fs3, rup
                  feq.s        ra, fs2, fs10
                  remu         gp, a1, a2
                  fmv.w.x      ft9, tp
                  sltiu        sp, a3, 1766
                  fdiv.s       fs2, fs6, fs0, rtz
                  fcvt.s.wu    fa0, t1, rne
                  fsgnjx.s     fa3, fs0, fs5
                  sra          s2, ra, s8
                  slli         s5, sp, 8
                  auipc        s1, 921552
                  fcvt.wu.s    a0, fa5
                  fmv.x.w      t0, ft3
                  fcvt.w.s     a1, ft9
                  fsgnjx.s     fs6, ft9, fa3
                  feq.s        t6, ft7, fa1
                  sltiu        s6, s2, 815
                  fcvt.wu.s    s10, ft8, rne
                  fcvt.w.s     s9, fs5
                  divu         s4, s0, t1
                  fdiv.s       ft10, ft9, ft1, rne
                  fmv.x.w      a2, fs11
                  fsqrt.s      ft1, fa2
                  divu         a5, s2, t1
                  sub          t6, s3, a6
                  sltu         t5, a3, s1
                  ori          s6, t1, -1061
                  and          s9, t2, s11
                  xori         a1, s11, -749
                  fsqrt.s      fs2, ft1, rup
                  fsgnjx.s     fs7, ft9, fa2
                  sub          sp, s10, a7
                  mulhsu       s5, t2, s2
                  addi         t0, s9, -1007
                  andi         s3, a5, 1614
                  lui          s10, 333068
                  srl          a1, t6, t0
                  lui          sp, 64787
                  rem          t1, t1, s7
                  mulhsu       s5, a4, s7
                  fcvt.s.wu    ft9, a2
                  andi         t2, sp, -890
                  fmax.s       fs10, ft0, fs1
                  feq.s        tp, ft0, fs0
                  srl          s8, t2, s5
                  add          s0, a0, ra
                  sll          s3, s0, a0
                  flt.s        sp, fs7, fs0
                  mul          s4, s2, gp
                  divu         ra, a6, s0
                  srl          a7, t6, a5
                  lui          s8, 25433
                  lui          a7, 784182
                  srli         s5, a6, 21
                  fclass.s     s1, ft7
                  fsgnjn.s     fs4, fs4, fa4
                  rem          a2, s0, tp
                  andi         s5, s1, 736
                  nop
                  ori          a2, s10, -1450
                  nop
                  fadd.s       fa3, ft1, ft6
                  fsqrt.s      fs6, ft8, rmm
                  fadd.s       fs2, ft10, ft1, rdn
                  rem          a5, t5, t0
                  fmul.s       fa5, fs11, fs6, rmm
                  fadd.s       ft1, ft2, fa5
                  addi         t1, t2, 1212
                  feq.s        s5, fs1, fa1
                  sra          t1, s1, s2
                  fcvt.w.s     ra, ft11
                  rem          s0, s5, a5
                  fdiv.s       fs6, fs6, ft10
                  mulhsu       s1, s3, s6
                  fsqrt.s      ft3, fa6
                  fsgnj.s      fs6, ft7, ft6
                  fsqrt.s      fs3, fs6
                  feq.s        a5, fa5, ft6
                  xor          ra, t3, a0
                  slti         gp, s6, 443
                  feq.s        ra, fs1, ft4
                  srai         t1, ra, 16
                  ori          t6, t4, -49
                  fcvt.wu.s    s8, fs9
                  fcvt.s.wu    fa3, s11
                  addi         s4, ra, 1226
                  fdiv.s       fa0, ft2, fs9
                  mulhsu       tp, s10, s6
                  sra          a0, s8, a3
                  divu         a0, s1, a1
                  fmv.x.w      t5, ft3
                  fmin.s       fs4, ft4, fa0
                  sll          a1, t4, s4
                  fmv.x.w      a3, fs8
                  fmin.s       ft5, fa6, ft6
                  srl          a0, t5, a2
                  fmv.w.x      ft3, s3
                  mul          a6, s3, a6
                  fsgnj.s      ft8, ft4, fa7
                  srli         s6, s9, 9
                  fdiv.s       ft5, fs8, fs2
                  fsgnjn.s     ft4, ft3, fa6
                  or           s8, s0, t3
                  fle.s        zero, ft3, fs10
                  slt          s5, a6, gp
                  or           a7, a4, s4
                  mul          ra, s1, a1
                  sll          sp, s7, s4
                  sltiu        a3, zero, -1399
                  ori          a4, t6, 1382
                  add          t4, t1, a7
                  ori          a2, t3, -243
                  fmv.x.w      t1, ft8
                  fsgnj.s      ft10, fa0, fa6
                  fadd.s       ft6, ft2, fs3, rne
                  ori          a4, tp, 1053
                  fsub.s       ft1, ft7, ft1, rne
                  addi         gp, a0, 1699
                  nop
                  lui          t0, 661301
                  slti         s3, t3, -412
                  fcvt.w.s     a1, fs8
                  fclass.s     s1, ft10
                  fdiv.s       ft6, ft10, ft10, rtz
                  mulh         a4, t5, s9
                  add          ra, tp, zero
                  fadd.s       fs2, ft4, ft0, rne
                  fmul.s       fs1, ft1, fs10, rmm
                  sltiu        s4, t2, 1222
                  mulhu        sp, tp, s8
                  fmv.w.x      fs11, gp
                  fsgnj.s      fs4, ft7, ft7
                  and          t2, a4, t5
                  mulh         a1, a5, a4
                  add          a7, s11, t1
                  slti         s10, t4, 27
                  flt.s        t1, ft2, fs6
                  flt.s        a0, fs4, fs10
                  fsub.s       fs10, fs4, fa7
                  mulhu        s1, t1, a6
                  fsgnjn.s     fa6, ft1, fs11
                  div          a0, a5, s2
                  feq.s        ra, fa1, fs8
                  slti         s8, sp, -300
                  xori         t4, t3, -716
                  fsgnjn.s     fa7, ft3, fs9
                  mul          t2, t3, s10
                  addi         s9, a3, 1296
                  fclass.s     s2, fs1
                  fmax.s       fa4, fs5, ft5
                  addi         tp, s9, -1351
                  fmax.s       ft7, ft6, ft0
                  fle.s        s1, ft10, fs3
                  add          a6, s6, zero
                  flt.s        t0, fa5, fs3
                  mul          a4, s2, a5
                  fsqrt.s      ft6, ft1
                  fsgnjx.s     ft11, ft6, fs7
                  slt          t0, s4, t0
                  add          ra, a2, s5
                  or           a7, t2, t4
                  and          t4, t6, a2
                  slti         s2, s3, -9
                  nop
                  fsqrt.s      ft9, ft6, rdn
                  mul          t6, s9, gp
                  slli         zero, s9, 21
                  xori         tp, s6, -401
                  fsqrt.s      fa2, ft0, rup
                  mulh         sp, s10, t5
                  and          t4, s7, a0
                  sub          t0, s3, s8
                  fcvt.s.w     fa3, s9, rup
                  sra          a2, t6, t5
                  sra          t4, a4, s7
                  ori          a4, zero, 629
                  sra          s0, s1, s2
                  srai         t5, sp, 8
                  fmv.x.w      t0, ft5
                  fdiv.s       fa7, fa3, ft8, rup
                  div          a6, s5, a6
                  nop
                  sll          a2, s9, s3
                  fmv.w.x      ft0, s7
                  slti         t4, t4, -1176
                  fcvt.s.wu    fs6, a0, rtz
                  slti         t1, a3, -30
                  srai         sp, a0, 10
                  remu         t0, s5, t6
                  fsqrt.s      ft2, ft9, rmm
                  fsqrt.s      fs5, fs9, rdn
                  fmin.s       fa2, fa0, ft3
                  and          s3, s0, s3
                  fadd.s       fs2, fs6, ft5, rup
                  fdiv.s       fs7, fa0, fa4, rup
                  fmul.s       ft5, ft8, fs0
                  andi         s5, a4, -1245
                  ori          ra, t5, 1505
                  div          s10, s1, s0
                  mul          a2, a7, ra
                  flt.s        s1, fs1, ft3
                  srli         s1, s10, 21
                  add          a2, a5, sp
                  mulhu        zero, t5, t1
                  nop
                  fcvt.s.wu    fa0, a2, rup
                  and          s6, s2, s7
                  fmin.s       ft4, ft7, ft5
                  mulhsu       s5, a6, zero
                  remu         t0, a5, s7
                  flt.s        a4, ft0, ft4
                  xori         t2, a7, -1100
                  rem          s8, a6, t5
                  fcvt.w.s     a1, ft8
                  fsgnjx.s     fa4, ft10, fa6
                  auipc        s5, 221926
                  mulhu        a6, ra, a1
                  fmv.x.w      a1, fa2
                  fclass.s     s0, fa7
                  xori         t6, sp, 1605
                  lui          s1, 817395
                  mulhu        s3, s11, s2
                  fsgnj.s      fa5, fa4, fa1
                  addi         a0, s6, 135
                  fmv.w.x      ft9, a6
                  sll          t2, s8, a0
                  divu         s9, s0, t3
                  sltiu        s8, s4, -1084
                  fmax.s       fa5, ft1, fs9
                  sll          zero, a5, t4
                  mulhsu       t2, a5, zero
                  sub          a5, t1, t3
                  fmv.x.w      s8, fa0
                  srli         a7, s4, 0
                  fcvt.s.w     fs7, s11, rne
                  fmin.s       fs2, fs9, ft8
                  add          a6, s8, t3
                  ori          t6, t1, 719
                  fmv.w.x      fa5, ra
                  sltu         s0, t3, s5
                  fsgnjx.s     fa1, fa1, fs8
                  srai         a3, t2, 8
                  auipc        t2, 982267
                  andi         s3, t2, 1460
                  fmv.x.w      gp, fs8
                  fcvt.s.wu    fa3, a5, rmm
                  fsgnjx.s     ft3, fs3, ft10
                  sltu         t6, s9, s2
                  fadd.s       ft8, fa0, fs7
                  sub          tp, t0, a4
                  xor          t0, t0, s10
                  or           s2, s3, t0
                  slli         s4, t4, 5
                  fcvt.s.wu    ft9, t0, rmm
                  slti         s6, s5, 419
                  fmax.s       fa7, ft10, fa7
                  xori         s8, s4, 948
                  fcvt.s.w     fs8, s2
                  fadd.s       ft0, ft6, ft5, rne
                  add          a2, s4, s2
                  remu         s10, s9, a0
                  mulhu        tp, s8, tp
                  fmax.s       fs8, fa2, ft0
                  and          a1, s9, a1
                  and          s0, a0, s6
                  fdiv.s       fa5, fa2, fs11, rmm
                  fmax.s       fs5, fs8, ft8
                  fsgnj.s      ft6, ft6, fa7
                  slli         a5, t5, 0
                  div          t5, s0, s11
                  fsqrt.s      fs9, ft3, rne
                  slt          a4, a6, s0
                  addi         s8, s11, -179
                  fadd.s       fa4, ft5, fs7, rdn
                  flt.s        s10, fs9, fs4
                  sub          t1, s2, s3
                  divu         sp, s7, t5
                  sll          sp, ra, a7
                  srli         a1, a5, 9
                  flt.s        a1, fa4, ft1
                  srli         a5, gp, 9
                  and          s9, t2, a0
                  auipc        s1, 749701
                  ori          sp, s11, 1199
                  fsgnjn.s     ft0, ft4, ft10
                  mulhsu       a1, t3, a4
                  fmv.x.w      s8, ft4
                  fmax.s       fs6, fs9, ft5
                  remu         t1, s11, s3
                  fmul.s       fs10, fa7, fs5, rmm
                  mulhu        s1, t4, s5
                  remu         a6, a7, a6
                  flt.s        a3, fa3, fs8
                  sll          s0, s2, a2
                  fmv.x.w      a1, fs5
                  ori          t2, s4, -1585
                  divu         gp, zero, t5
                  fmv.x.w      t6, fa5
                  slti         s6, a2, 426
                  fmul.s       ft0, ft7, fs11, rmm
                  sub          s1, s9, s6
                  fsgnjx.s     fa2, fa0, ft2
                  sltu         t6, a0, zero
                  slt          s1, a4, a5
                  feq.s        s0, fs5, fs8
                  sub          t0, zero, s7
                  fmv.w.x      fs5, s7
                  fcvt.s.w     fs11, s2, rtz
                  addi         gp, t0, 905
                  fmax.s       fa2, fa1, fs10
                  xor          sp, s10, t5
                  fle.s        zero, fs11, fs8
                  fmv.w.x      fa2, s6
                  remu         s0, t4, t2
                  fclass.s     s9, fs2
                  mulhu        t2, sp, s5
                  feq.s        t1, ft9, fs3
                  feq.s        s5, fs11, fs6
                  xori         sp, a3, -715
                  mulhu        t6, t0, a5
                  mul          s6, s1, a1
                  or           zero, t0, s4
                  slli         a5, a2, 16
                  fmin.s       ft10, fa0, fs9
                  fadd.s       ft0, fa7, fa4
                  fcvt.s.wu    fa7, a7
                  fadd.s       fa5, fa1, ft10
                  feq.s        t4, ft5, fs9
                  srli         sp, s11, 8
                  mulhsu       s4, a5, ra
                  slli         a2, s4, 14
                  flt.s        s3, fs9, ft2
                  mulhu        s2, t2, s8
                  lui          a7, 436078
                  srl          s2, s3, s8
                  sltu         s9, s2, t6
                  fmax.s       ft0, fs6, fs4
                  div          s10, a5, s10
                  remu         s9, t0, t4
                  fcvt.wu.s    s2, fa1, rdn
                  addi         s3, gp, 1527
                  slti         zero, a7, 1277
                  mulhsu       s10, a6, t1
                  rem          t4, a6, s7
                  sub          a0, s7, s0
                  fmv.w.x      ft7, t6
                  fclass.s     ra, fa2
                  add          t6, sp, t4
                  srai         t6, t0, 10
                  sub          t2, gp, sp
                  xori         s1, a4, -1897
                  nop
                  div          s5, t6, t6
                  fsgnjn.s     ft2, fs11, ft6
                  fsub.s       fs10, ft1, ft2
                  feq.s        t4, fs5, ft11
                  flt.s        s10, fa7, ft10
                  srli         t6, t1, 6
                  lui          s0, 111729
                  fsgnj.s      ft0, ft2, fs10
                  srl          s9, t2, s5
                  auipc        a0, 687830
                  add          ra, s4, t2
                  andi         s5, s6, 108
                  and          s9, s2, t3
                  srai         a3, a0, 4
                  fcvt.s.w     ft11, t5, rdn
                  or           s4, t4, s6
                  fcvt.s.w     fa2, a5, rne
                  fcvt.w.s     s4, ft9, rtz
                  or           s9, t6, s6
                  sll          t2, a2, a0
                  fdiv.s       ft6, ft8, fs8
                  fmin.s       ft11, fa5, fs1
                  srli         s1, ra, 15
                  lui          ra, 301460
                  auipc        ra, 34175
                  fsgnjx.s     ft1, fs6, fs9
                  fmv.x.w      a5, ft5
                  and          t6, a0, zero
                  fdiv.s       fs6, fs0, fs2
                  mul          s4, s3, a2
                  or           a3, a1, s4
                  sltiu        s10, t0, -971
                  fmv.w.x      fa5, a7
                  fmul.s       ft4, fa3, fa5, rmm
                  srai         a4, s6, 28
                  feq.s        a3, fs4, fs0
                  sub          t1, s0, s0
                  fadd.s       ft9, fs2, fa4, rup
                  slt          s3, sp, s1
                  addi         s6, s10, 639
                  fcvt.s.wu    ft5, t2, rup
                  fsgnjx.s     fa3, ft0, fs11
                  sub          s9, s4, t2
                  add          a3, a0, zero
                  fmax.s       fa4, fa5, ft2
                  xor          s1, sp, t0
                  mul          s8, s0, a5
                  and          t4, t3, s11
                  fmv.w.x      fs5, t6
                  remu         a6, a2, a3
                  fclass.s     s1, fa4
                  fcvt.s.w     fs8, ra, rtz
                  srai         s9, a2, 15
                  fcvt.w.s     a5, ft9, rup
                  fcvt.s.wu    fa0, zero, rup
                  feq.s        gp, fs0, ft3
                  slli         gp, t0, 5
                  add          ra, t2, t0
                  mulh         s0, ra, a7
                  feq.s        s10, fs6, fs4
                  fsgnjn.s     fs5, fs9, fa1
                  fcvt.wu.s    a0, ft11
                  sltiu        a4, tp, -97
                  mulhsu       s0, s9, a6
                  fsgnjx.s     ft8, ft11, fa7
                  fcvt.s.w     ft9, a6, rmm
                  lui          a0, 497083
                  and          t0, s4, t1
                  fsgnjx.s     ft7, ft5, fa7
                  xor          gp, ra, a3
                  srai         s10, ra, 15
                  fcvt.s.w     fs2, t5
                  divu         s0, t1, t4
                  sra          ra, s7, t0
                  fsub.s       fs8, fs7, ft7
                  fsgnj.s      fs3, ft3, ft2
                  fmul.s       ft9, fs7, fs1
                  add          ra, a2, t3
                  mul          t5, s8, a3
                  fsgnj.s      ft10, fs9, ft2
                  divu         t1, a6, a3
                  slt          a6, a7, s9
                  slti         s5, sp, -464
                  nop
                  sra          t4, s2, tp
                  divu         s1, s6, t4
                  rem          a6, gp, zero
                  fcvt.s.wu    ft9, gp, rdn
                  mulhu        s9, a4, s3
                  andi         gp, s7, 935
                  andi         a0, t4, 1945
                  lui          zero, 164307
                  fmin.s       fs3, ft1, fs8
                  mul          ra, a2, s7
                  fmin.s       fa5, fs7, fs5
                  fdiv.s       fa3, fa6, fs9, rmm
                  fsgnj.s      fa2, ft2, fs10
                  mulhsu       ra, s11, a5
                  sra          s9, gp, a7
                  fle.s        s5, ft2, fs0
                  mulhsu       sp, a3, t4
                  mulhsu       a7, zero, t0
                  flt.s        s1, ft10, fa0
                  fsqrt.s      ft7, fa0
                  fle.s        a7, fs0, ft2
                  remu         s9, s1, t6
                  fcvt.s.wu    fs5, s5
                  fmin.s       ft8, fs8, ft2
                  remu         ra, s9, t5
                  xori         s0, s4, 1000
                  addi         a5, s3, -372
                  fcvt.s.w     ft2, s2
                  sltu         t4, s6, tp
                  add          s2, s9, t5
                  fcvt.s.w     ft4, s8
                  mul          a0, t3, t2
                  fmax.s       fs10, fs11, fs10
                  lui          a7, 601821
                  or           a2, t4, ra
                  fmv.x.w      a2, fs11
                  addi         s2, sp, -1269
                  fdiv.s       fs1, fa0, fa4
                  fmv.w.x      fa6, a3
                  fsgnjx.s     fs3, ft5, ft4
                  fcvt.w.s     s1, fs4, rne
                  fle.s        s1, fs1, fa0
                  fclass.s     s9, ft11
                  fsgnjx.s     ft5, ft5, fa7
                  fmin.s       ft10, fa1, fs7
                  mulhsu       a2, s6, s9
                  xori         t5, t2, -1668
                  fmv.w.x      ft10, gp
                  fsqrt.s      fs1, ft3, rmm
                  fclass.s     ra, fs9
                  fdiv.s       fa2, ft9, ft10, rne
                  srli         s5, a1, 15
                  slt          a5, t5, a6
                  fmax.s       fa0, fs7, fa0
                  feq.s        s6, fs9, fs7
                  xori         a3, ra, -1725
                  fmv.w.x      fs4, a7
                  xori         a1, s11, -305
                  xor          s4, a7, a4
                  slti         s1, s0, -1297
                  add          zero, sp, sp
                  sra          a0, tp, s5
                  feq.s        t2, fa2, fs6
                  fadd.s       ft3, fa2, fs10
                  fmax.s       fs5, ft5, fa3
                  fsqrt.s      fa4, fa6, rdn
                  fcvt.w.s     t6, fs1
                  srli         s1, a2, 27
                  mulhu        s9, s2, s1
                  fdiv.s       fs10, fa3, ft10
                  rem          s9, s2, s4
                  fmax.s       ft3, ft1, ft0
                  xor          t2, t2, t6
                  and          a1, t4, a0
                  ori          s5, t0, -1267
                  fmv.x.w      a2, ft10
                  xori         a5, s1, -160
                  srli         t0, t6, 23
                  fclass.s     s5, fa4
                  fle.s        a1, ft2, fa7
                  lui          tp, 461812
                  div          t2, t0, s9
                  sltu         t0, s2, ra
                  fmax.s       fs11, fa2, ft10
                  fcvt.s.wu    fa7, s3, rdn
                  sub          zero, a7, a5
                  fsgnj.s      ft11, ft2, ft1
                  mulhu        gp, a7, a6
                  fdiv.s       fs10, ft4, fa1, rdn
                  add          a4, t4, s0
                  xor          a7, s5, t1
                  slt          t0, s4, t0
                  div          t4, t2, t1
                  mul          t4, gp, tp
                  fsgnj.s      ft4, fs10, fa5
                  fsgnj.s      fs8, fa7, ft5
                  nop
                  div          sp, t5, t4
                  add          a5, a6, a1
                  fcvt.s.w     ft10, t3, rtz
                  remu         a6, s5, t5
                  fdiv.s       ft0, fs8, fs5
                  add          sp, s4, s9
                  flt.s        s8, ft10, fa7
                  mul          s3, t4, a4
                  div          s0, a0, a5
                  mulhu        s1, s1, t2
                  andi         s8, s9, -1703
                  srli         s1, zero, 23
                  fmax.s       fs0, fa7, fs2
                  slli         gp, t6, 2
                  fdiv.s       fa7, fa1, fs10, rup
                  sub          s10, t2, s5
                  flt.s        t2, ft4, ft0
                  srli         sp, t6, 27
                  fsgnj.s      fs8, fs3, fa2
                  mulhu        a3, t5, a1
                  fsgnj.s      fa3, fs7, ft3
                  mulhsu       s5, a2, a3
                  fmv.w.x      ft10, s5
                  slti         a2, a0, 1993
                  fadd.s       ft8, ft9, fs3, rtz
                  ori          s3, a1, -471
                  sltiu        a6, s11, -1414
                  fcvt.wu.s    s3, ft3
                  slli         t4, s7, 0
                  xor          ra, a5, s11
                  addi         s10, zero, -237
                  or           s1, s6, t5
                  and          s10, s10, a5
                  sub          a6, ra, s9
                  sub          a3, t1, s4
                  fdiv.s       ft0, fs6, fa3
                  fmv.w.x      fs11, gp
                  fcvt.w.s     s8, ft3
                  slli         a5, s1, 21
                  add          tp, a6, s4
                  remu         a3, s11, s6
                  sll          s1, t6, zero
                  addi         ra, t0, 1091
                  fcvt.w.s     s5, ft5, rup
                  fmv.w.x      fs9, tp
                  mulh         a5, t2, a3
                  fcvt.s.wu    fs6, sp, rtz
                  srli         gp, s9, 23
                  andi         a3, s9, -652
                  feq.s        t2, ft4, fs5
                  mulhsu       a1, s4, s1
                  ori          a5, a6, -137
                  sub          a6, t5, s3
                  fclass.s     a3, ft0
                  nop
                  sll          a4, s2, s0
                  fsgnj.s      fs2, fa5, fs7
                  xor          s5, t1, s3
                  fmin.s       ft0, fs11, fs4
                  mulh         a0, s5, s11
                  rem          a5, a7, s1
                  andi         s8, a7, -841
                  mulhu        a7, s1, t3
                  fmv.x.w      a5, fs5
                  feq.s        a4, fa2, fa7
                  srai         s3, a4, 23
                  addi         t2, s5, -291
                  sltiu        a7, s7, -1329
                  auipc        a7, 573708
                  srli         t6, t5, 12
                  fcvt.w.s     a4, ft6
                  ori          gp, s4, -1239
                  add          a1, s10, gp
                  add          s10, t3, t1
                  flt.s        a7, ft3, fa0
                  srai         s8, s10, 7
                  srl          a5, sp, a0
                  slt          s8, t0, s0
                  mul          s4, a6, s3
                  sra          a0, s5, t5
                  srli         t5, a7, 21
                  fcvt.s.wu    ft0, a3, rup
                  fmv.x.w      a7, fs6
                  divu         a3, s6, s2
                  fclass.s     s2, ft3
                  srai         t0, a3, 2
                  sll          s2, s8, s7
                  or           t5, sp, s4
                  fsgnjx.s     ft5, ft1, fs10
                  slt          s6, s7, s10
                  sra          s9, a7, s9
                  or           a5, t6, t2
                  and          s10, t6, a1
                  mulhu        t5, t3, s8
                  mulhsu       t6, a4, s10
                  feq.s        t0, fs9, fa3
                  sll          s1, t0, a5
                  divu         s5, a1, tp
                  fsgnjx.s     fa3, fs8, fs9
                  fcvt.wu.s    a3, fs4, rtz
                  fsgnjn.s     fs8, ft5, fs11
                  feq.s        s5, fs9, ft6
                  fmv.x.w      t0, fs3
                  auipc        t1, 258923
                  fmax.s       fs4, fs5, fa6
                  fclass.s     a0, fs7
                  remu         a0, a0, s7
                  ori          t5, a0, 572
                  lui          s10, 220319
                  remu         a3, a2, s7
                  auipc        s10, 571507
                  fcvt.s.w     fs10, s2
                  fsgnjx.s     fa2, fs7, ft10
                  andi         sp, a0, 366
                  sltu         s0, a2, s9
                  remu         s9, t6, a6
                  slli         t0, sp, 0
                  sub          tp, t2, a3
                  srai         t1, a4, 3
                  srl          t6, s9, a6
                  slti         s4, t5, -552
                  fsgnj.s      ft7, fs7, fa0
                  or           a0, s10, gp
                  addi         a1, s0, -1351
                  fsub.s       fa6, fa7, fs0, rup
                  fmul.s       ft5, fs7, ft2
                  fmin.s       ft5, ft10, ft5
                  divu         zero, s6, s5
                  andi         s5, a0, 260
                  mulhsu       s3, gp, s3
                  fadd.s       fa5, fa1, fa3
                  fcvt.s.w     ft8, s7
                  mulhu        s8, zero, a2
                  mulh         s9, t4, s2
                  slli         zero, gp, 12
                  add          t1, t4, a3
                  div          s0, s7, ra
                  fadd.s       fs4, fs8, ft6, rne
                  ori          s0, gp, -1664
                  slli         a7, s6, 5
                  sll          gp, gp, t4
                  sll          a1, s3, t1
                  fsgnjx.s     fs3, ft11, fs1
                  fsgnj.s      ft11, fs6, ft9
                  fdiv.s       ft4, fa1, fs2
                  mulhsu       s0, a1, sp
                  fmul.s       fs3, fa0, fs5
                  mulh         s1, a5, s4
                  ori          a2, a5, -1863
                  fcvt.wu.s    s8, ft3, rtz
                  addi         s10, s8, -1026
                  sra          t5, a5, s7
                  div          t2, s10, t3
                  fclass.s     a2, ft8
                  add          gp, a6, sp
                  fsgnjn.s     fs3, ft9, fa7
                  fmin.s       fa3, fa1, ft0
                  fclass.s     a1, fa2
                  srai         sp, t3, 12
                  and          a6, s10, t3
                  slli         s8, s7, 19
                  srl          ra, s2, s11
                  mul          a6, a2, t2
                  fsgnj.s      fa6, fs8, ft7
                  or           s0, s6, a6
                  nop
                  slli         s2, a7, 19
                  fcvt.w.s     a1, fs7, rmm
                  remu         t1, s7, s0
                  ori          t0, a7, -349
                  fsgnjx.s     ft2, fa1, fs5
                  andi         t2, s0, -144
                  andi         t2, a1, -1961
                  sra          s9, s8, a3
                  ori          a0, s7, 224
                  nop
                  slli         s4, a1, 3
                  fcvt.wu.s    t0, ft1
                  fcvt.wu.s    t4, ft3, rdn
                  srl          a3, tp, a3
                  xori         s5, t3, -1971
                  fsgnj.s      fs1, fa6, ft4
                  slt          a3, s11, t1
                  fmv.x.w      sp, fs8
                  divu         a4, s11, t6
                  fcvt.w.s     a6, fa6, rdn
                  divu         a7, a7, s9
                  add          tp, s2, sp
                  sltiu        a6, ra, -1742
                  fsgnjx.s     ft7, ft8, fs3
                  fsgnjn.s     ft3, ft10, fs8
                  fmul.s       fa2, fs5, fs2
                  fsub.s       fs1, fs4, fa0, rtz
                  or           a1, gp, a5
                  rem          t0, s8, s1
                  fsub.s       ft1, fs0, fs0
                  xori         t4, t0, -758
                  fsqrt.s      ft8, fa6
                  fmul.s       fa5, ft5, ft6, rmm
                  srli         s2, a7, 20
                  srl          a3, ra, s8
                  div          tp, t5, a2
                  sll          s9, s7, t6
                  fcvt.w.s     a4, fa5
                  div          t4, s8, a7
                  slt          a6, t5, t1
                  srli         t5, zero, 14
                  add          a1, s8, tp
                  fadd.s       fs5, fa7, ft0
                  srai         a2, a7, 6
                  divu         s3, a2, t1
                  fsgnjx.s     fs4, fs11, ft11
                  slli         a3, ra, 8
                  sll          s10, s10, a4
                  mulhu        sp, a0, t1
                  addi         s1, a7, 1578
                  fcvt.s.w     fs0, t1
                  mulhsu       a3, a3, a1
                  fadd.s       fs11, fa6, fs5
                  fsqrt.s      fs7, fs7, rmm
                  fsub.s       fa2, ft0, fs2, rmm
                  auipc        sp, 27180
                  auipc        s8, 452513
                  srli         sp, t5, 6
                  xori         s3, t6, 640
                  or           t1, t3, a2
                  mul          s8, t0, gp
                  rem          s8, s4, t3
                  fclass.s     t0, ft7
                  fmin.s       fa2, fa6, fs9
                  fle.s        t4, fs2, fa0
                  fclass.s     s8, fs3
                  fmul.s       fa5, ft5, fs1
                  fsgnjn.s     fs1, fs9, fa3
                  sltu         t6, t6, t5
                  mulh         zero, t4, ra
                  fsgnjx.s     fs7, ft6, ft3
                  xori         s10, a2, 26
                  fclass.s     s2, fs0
                  fcvt.wu.s    ra, fs4, rup
                  fmv.x.w      ra, fs2
                  flt.s        s8, ft8, fs2
                  ori          t6, t6, -947
                  remu         t4, tp, t1
                  fsgnjn.s     ft4, fs1, fs7
                  fsgnjn.s     fs7, fs9, fs2
                  andi         gp, s1, 705
                  flt.s        a3, fa5, ft4
                  add          sp, a6, t1
                  mulhsu       a5, a5, t4
                  fmul.s       fs2, fa3, ft4, rne
                  mul          s9, gp, s11
                  fcvt.w.s     s3, fs10
                  andi         a5, a1, -398
                  sltu         t5, s0, s4
                  fdiv.s       fa4, fa2, ft11, rtz
                  sltiu        a6, t3, 634
                  mulh         s5, s4, s8
                  remu         s3, t5, a5
                  sltu         t0, a3, gp
                  srl          s4, t0, s6
                  fadd.s       ft9, ft1, fs7
                  flt.s        s0, fa1, fa1
                  lui          s5, 635515
                  flt.s        a7, fa6, ft2
                  ori          a6, s2, 915
                  sltu         a3, sp, a4
                  auipc        a4, 943433
                  sra          s1, sp, s4
                  sltiu        t5, s10, 1534
                  xori         a5, t4, 1986
                  fmin.s       fs4, fs4, fs8
                  mulh         a7, sp, s10
                  rem          s8, s9, t4
                  fle.s        ra, ft8, ft7
                  sltiu        s3, a6, -1783
                  feq.s        s5, fa1, ft10
                  fcvt.w.s     s10, fs6
                  rem          s6, t5, t2
                  fsgnjx.s     ft3, ft7, ft7
                  or           s9, s2, a7
                  div          s2, s3, t5
                  ori          tp, t6, 1400
                  mulhsu       s6, zero, s1
                  fmul.s       ft11, fs6, fa2
                  mul          tp, zero, a6
                  fcvt.s.w     fa0, ra
                  mulhu        a4, s2, a0
                  mulh         t2, gp, a2
                  feq.s        gp, fs7, fs7
                  mul          s9, t2, s8
                  srai         s6, t2, 11
                  mul          s6, s11, t3
                  and          tp, t6, ra
                  fsgnjx.s     ft11, fs2, ft3
                  fdiv.s       ft4, fs5, fa1, rdn
                  fcvt.s.w     ft3, s0
                  srli         a7, s10, 23
                  fcvt.wu.s    a7, fs3, rmm
                  fcvt.s.wu    ft11, sp
                  andi         a7, t1, 1541
                  slti         gp, t1, 548
                  slli         tp, t0, 17
                  fmin.s       fs4, fs7, fa1
                  sltiu        a2, a1, -326
                  fmax.s       ft1, fa3, fa0
                  andi         s4, t1, 1192
                  mulhsu       s3, a3, t0
                  mulhsu       t4, t6, t0
                  or           a1, t3, sp
                  srl          s0, s6, sp
                  sltu         a4, a2, a5
                  slli         s8, s9, 23
                  remu         s4, s9, t1
                  auipc        t5, 749933
                  fsub.s       fs10, ft6, ft8
                  mulhu        a4, tp, t2
                  and          a1, a0, a2
                  slli         s0, s8, 18
                  flt.s        t6, fa3, ft6
                  rem          a5, s10, a3
                  fmul.s       fa5, fs2, ft0, rne
                  fsub.s       ft11, fa3, ft8, rtz
                  addi         ra, s7, -1687
                  nop
                  mulhu        a3, t2, a3
                  fadd.s       fs6, fa7, fs5
                  ori          s8, s6, 1126
                  divu         s3, zero, t6
                  andi         a2, t4, 221
                  fmin.s       ft0, fs3, fs8
                  nop
                  flt.s        s9, fs11, ft0
                  fsgnjn.s     fs0, fs0, ft8
                  fmv.x.w      s0, fs10
                  lui          zero, 862739
                  xor          a3, t0, s2
                  srli         a7, s10, 27
                  xori         a7, a2, -1173
                  fmax.s       fa7, ft2, fa0
                  and          a1, a4, a3
                  fsgnjx.s     fs9, ft8, ft1
                  srli         ra, a7, 15
                  fsgnjn.s     ft11, ft0, fs3
                  sltu         s10, t2, sp
                  mulh         s9, s3, zero
                  slli         s8, a0, 21
                  slli         gp, s10, 31
                  mulhu        a1, t2, t3
                  fsub.s       fs10, fa1, fs5
                  sub          s0, a0, s2
                  andi         s8, t3, -96
                  srai         s3, s1, 26
                  fle.s        s5, ft0, ft11
                  mulhsu       s9, t1, gp
                  fmv.x.w      a0, fa5
                  fcvt.wu.s    a1, fs0
                  remu         s1, t5, t1
                  mulhsu       s10, s10, ra
                  auipc        s2, 515307
                  fcvt.s.w     ft4, zero
                  fsgnjn.s     ft3, ft1, fa5
                  fcvt.s.w     fs1, s4, rup
                  sltu         s10, a3, s3
                  fsgnj.s      ft10, ft11, fa3
                  rem          t4, s10, a7
                  fle.s        a3, fs7, ft2
                  lui          s9, 104458
                  fmin.s       fs11, fs4, ft6
                  andi         s5, a7, 342
                  fsgnjx.s     fs1, fs11, fa0
                  fsgnjx.s     fa0, ft8, ft6
                  auipc        gp, 343986
                  fsqrt.s      fs6, fs4
                  sub          s1, s3, s6
                  fle.s        s4, fa1, ft3
                  sub          a4, s1, zero
                  xor          gp, t6, a4
                  sll          a3, s10, a3
                  fcvt.s.wu    fa6, gp, rne
                  sltiu        tp, t5, -2022
                  auipc        a4, 234616
                  srl          a2, tp, s11
                  sltiu        t0, s0, 1013
                  fmv.w.x      fs2, a7
                  div          gp, a2, s3
                  fsgnjn.s     ft4, fs5, fa7
                  fsqrt.s      ft1, fs6
                  auipc        t0, 670661
                  remu         a0, a6, a4
                  fsgnjx.s     fa0, fs6, ft0
                  or           s0, s10, a4
                  fcvt.w.s     s5, ft4, rup
                  slt          s10, t1, gp
                  sltu         s9, a6, t4
                  flt.s        t6, ft9, fs10
                  fmv.w.x      ft8, t1
                  addi         s5, a4, 537
                  or           s5, s4, t3
                  divu         t5, sp, t1
                  fsqrt.s      ft3, fs0
                  fcvt.wu.s    a4, fs8
                  add          sp, sp, t5
                  fdiv.s       ft9, fs5, fa0, rtz
                  xori         t6, s8, 1451
                  fmv.x.w      t0, fs8
                  fcvt.w.s     a7, fa6
                  mulh         s3, t5, s8
                  div          s6, a6, t4
                  fmv.w.x      fs4, s6
                  fmin.s       fa4, fa4, fa5
                  srli         s8, s6, 22
                  mulhsu       t4, s8, s4
                  ori          sp, ra, -1653
                  fcvt.s.wu    ft2, s4
                  div          s0, a2, sp
                  sll          a4, a1, s3
                  feq.s        t2, fs4, fs11
                  and          gp, a0, a6
                  add          s10, tp, s8
                  srai         a0, s9, 17
                  slti         s10, t0, 1659
                  sll          s9, s9, s6
                  nop
                  fcvt.wu.s    s6, fs7
                  fcvt.s.wu    ft8, s6, rdn
                  fmv.w.x      ft4, s5
                  div          s2, ra, sp
                  nop
                  fmul.s       fs10, fa0, fa4, rdn
                  ori          t1, s0, -1854
                  mulhsu       sp, s5, t2
                  mulh         zero, t2, s5
                  fmul.s       ft11, fs8, ft1
                  nop
                  fle.s        t5, fs10, fa4
                  fsgnjn.s     fs5, fs5, ft4
                  slli         a3, t1, 28
                  div          s0, s0, t4
                  and          t2, s6, sp
                  fcvt.wu.s    s6, ft9
                  fsub.s       fs9, fs2, fa1
                  fsqrt.s      fa7, fa1, rdn
                  addi         zero, s0, 123
                  nop
                  xori         a6, s0, 915
                  remu         s0, s3, t6
                  slt          a2, a7, s2
                  mulhsu       s8, a2, t4
                  mulh         s1, s1, a5
                  and          zero, zero, a6
                  fsgnj.s      ft6, ft3, fs8
                  fsgnjx.s     fs4, fs7, ft1
                  srli         s5, t4, 17
                  mul          gp, s7, t6
                  fmv.w.x      ft3, s7
                  slt          a1, s2, s2
                  fle.s        s5, fs8, fs8
                  sra          gp, t1, s7
                  fcvt.wu.s    t1, fs10, rne
                  sltu         a3, t0, s2
                  fsub.s       fs6, fa3, fs11, rtz
                  remu         t0, a3, s8
                  slt          gp, a2, a0
                  xori         s9, a5, -282
                  remu         t4, s11, a2
                  feq.s        zero, fs8, fa2
                  fmv.w.x      ft3, a5
                  slli         t5, zero, 3
                  sltiu        t2, a2, 1455
                  srl          a7, s10, s5
                  fcvt.wu.s    s2, ft7, rtz
                  xor          s9, t4, s4
                  fmv.w.x      ft4, a6
                  fsgnj.s      ft7, fa2, fs11
                  xor          gp, zero, t4
                  fcvt.wu.s    s3, fa7, rmm
                  fcvt.w.s     tp, fs4, rtz
                  rem          s3, t4, gp
                  sltiu        s8, s6, -1770
                  sll          tp, ra, zero
                  rem          s1, s11, t4
                  div          s6, t3, s0
                  srl          a1, zero, ra
                  fcvt.wu.s    a3, ft1
                  fsub.s       fa4, fa1, ft2, rne
                  remu         s8, t1, t3
                  sub          a3, s4, s11
                  fadd.s       fs0, fs10, fa3, rne
                  sltiu        a2, a6, -1692
                  fcvt.wu.s    s10, fs1, rtz
                  fmul.s       ft7, fs6, fs8, rne
                  fmv.x.w      sp, fa1
                  fsub.s       ft10, ft10, fs0, rmm
                  nop
                  xori         s5, a4, 171
                  fsqrt.s      fs2, ft8, rdn
                  fsgnjx.s     fa7, ft1, fs6
                  sll          s6, t3, s6
                  srl          t0, t0, s10
                  ori          a4, tp, 136
                  feq.s        a4, fs6, ft11
                  auipc        s10, 383292
                  fsub.s       fs4, fa1, ft8
                  slt          sp, s2, a4
                  fsqrt.s      ft6, fs2
                  fmv.w.x      fa3, s11
                  feq.s        a0, fs5, fa4
                  sra          a3, a3, gp
                  mul          s10, a1, s7
                  sltu         t6, a1, a2
                  fmax.s       fs10, ft3, fa3
                  fsgnjn.s     ft6, ft0, fs8
                  fadd.s       ft0, ft10, fs4, rup
                  rem          a1, s11, t1
                  sltu         sp, s4, t3
                  fmul.s       fs0, fs4, fs8, rtz
                  fsub.s       fs6, fa4, fs0, rdn
                  fclass.s     a3, fs7
                  slt          s3, a7, ra
                  fsgnjn.s     fs9, fs10, fs2
                  srli         sp, a4, 4
                  sll          s5, t0, t3
                  fsgnj.s      fs0, fs9, fs6
                  fmul.s       ft9, fs8, ft4
                  fcvt.s.wu    fa1, s0, rmm
                  slti         s4, t1, 2040
                  fsgnjx.s     ft5, ft10, fs2
                  fmul.s       fs5, ft9, fs7
                  fcvt.s.w     ft3, s9, rdn
                  fcvt.w.s     t1, fs5
                  sub          s1, s8, t2
                  sub          t6, zero, a2
                  slt          s9, a0, t3
                  fmv.w.x      fs9, a6
                  divu         s1, t5, t6
                  fsqrt.s      ft4, fs5
                  add          a4, s7, s9
                  fclass.s     s3, fa2
                  andi         a3, s8, -1413
                  fmin.s       fs1, fs0, fs1
                  remu         a3, a1, t2
                  andi         zero, ra, -796
                  sltiu        a4, tp, 1135
                  and          s2, a7, t2
                  fdiv.s       ft7, fa1, ft4, rmm
                  fsgnjx.s     fs11, ft7, fs7
                  fmax.s       fs10, fs2, fs4
                  sra          s2, t4, s3
                  fsub.s       ft5, fs7, ft4, rdn
                  or           s0, gp, a4
                  fle.s        s1, fs0, fa4
                  fmin.s       ft8, fa6, fa6
                  xor          s6, s9, a4
                  fdiv.s       fa3, fs7, ft5, rdn
                  andi         s10, a4, -335
                  mulhsu       s3, s9, t2
                  fmin.s       fa6, fa5, ft4
                  sltu         a2, t6, a2
                  auipc        t5, 941190
                  slt          sp, s10, tp
                  andi         s6, gp, 745
                  fsub.s       fa4, fs2, ft7
                  sra          t0, s1, t4
                  xor          s4, s8, s8
                  fadd.s       ft9, ft11, ft6, rne
                  sub          s8, s9, a3
                  nop
                  fadd.s       fs7, ft10, fs6, rmm
                  fadd.s       fs4, fa0, ft4
                  xor          a3, t4, s5
                  add          t5, t3, a7
                  flt.s        t2, ft2, ft11
                  srli         s8, tp, 22
                  xor          a3, s11, s2
                  xor          s4, a7, a6
                  slt          t4, s10, tp
                  fmax.s       ft5, fs2, ft9
                  feq.s        a7, fs4, ft2
                  fcvt.wu.s    a7, ft9, rtz
                  add          a2, a6, a4
                  div          a5, s0, a6
                  fmv.w.x      fa4, a3
                  flt.s        a2, ft8, fs4
                  sltiu        s5, sp, -1545
                  divu         a4, tp, s10
                  sll          tp, sp, a3
                  fsgnj.s      fa2, fs2, ft8
                  fcvt.w.s     t1, ft9, rmm
                  divu         t5, gp, t1
                  fcvt.wu.s    s6, fs1, rtz
                  lui          a7, 348739
                  sltiu        tp, s4, 1010
                  slli         tp, s10, 24
                  fcvt.wu.s    a2, fa3, rdn
                  slli         s8, t2, 11
                  fmv.x.w      s6, fs10
                  slt          sp, a1, t2
                  srai         s10, s10, 1
                  auipc        t2, 730677
                  slt          a7, gp, zero
                  fdiv.s       fs1, ft7, fs2
                  fadd.s       fs5, ft10, ft5
                  xor          sp, sp, a3
                  or           ra, a3, sp
                  fadd.s       fa2, fa1, fs1
                  fmax.s       fa1, ft5, ft10
                  divu         sp, t2, s8
                  xori         a4, ra, 113
                  fcvt.s.wu    ft2, a5
                  fcvt.s.wu    fs11, s2
                  sub          zero, a3, s2
                  fmv.w.x      fa4, a6
                  div          t1, s9, s10
                  div          s4, s5, s2
                  mul          a3, a0, s7
                  fcvt.w.s     s10, fs7, rup
                  slli         t4, a4, 7
                  fmv.w.x      fs5, t2
                  or           s10, t1, t2
                  or           s0, s11, t6
                  addi         a5, s9, -1774
                  fclass.s     a2, fs8
                  fmul.s       ft5, ft10, ft5
                  mulhsu       gp, s2, s8
                  add          tp, s11, t4
                  fcvt.w.s     ra, ft11
                  fle.s        t4, fs1, fa0
                  fle.s        t1, ft2, ft11
                  mul          s10, t3, gp
                  fmax.s       ft8, ft9, ft7
                  fcvt.s.w     fs9, s2, rup
                  ori          a6, s4, 1747
                  fcvt.wu.s    sp, fs0, rdn
                  divu         s2, s7, gp
                  rem          a6, s0, zero
                  fadd.s       fa5, fs3, fs2, rtz
                  and          s0, t4, s4
                  sltu         a0, t6, a3
                  fmv.w.x      fs5, t6
                  divu         a7, a3, zero
                  mul          s0, s10, a6
                  and          t4, a7, t1
                  or           s5, a7, gp
                  fsgnjx.s     fs1, fs6, ft1
                  fsgnj.s      fs10, ft2, ft0
                  add          s8, gp, gp
                  slti         t5, s7, 209
                  mulhu        a3, s9, s7
                  nop
                  fclass.s     t2, fs11
                  xori         t2, gp, 1144
                  fmv.x.w      s8, ft6
                  slti         a0, s0, 1812
                  fsgnjn.s     ft9, ft4, fs2
                  xori         s6, t1, 388
                  nop
                  fsgnj.s      fs3, fs6, fs3
                  fcvt.s.wu    fs0, a3, rmm
                  fsub.s       ft5, fa0, fs10, rmm
                  nop
                  fcvt.w.s     s2, fa7, rtz
                  fmv.x.w      s2, ft11
                  srli         a3, s11, 5
                  fmul.s       fs0, ft0, fa5, rtz
                  feq.s        a2, fa4, ft6
                  xori         zero, a1, -1556
                  fsgnjx.s     fs8, fa1, fs3
                  xor          a4, a6, sp
                  mulhsu       ra, a6, zero
                  fclass.s     t6, fs3
                  fmin.s       fs11, fs6, ft9
                  fsub.s       fs1, ft5, fs5, rmm
                  mulh         t0, s10, s0
                  sub          s6, t4, sp
                  fcvt.s.w     fs7, t6, rdn
                  xor          a5, s3, t5
                  div          sp, s3, zero
                  slli         s1, s11, 23
                  slli         s9, a0, 25
                  slt          s3, a2, t6
                  srai         t1, t5, 22
                  srli         a3, zero, 24
                  fclass.s     a7, ft7
                  ori          s10, a7, -1554
                  slli         a5, t3, 6
                  and          sp, a3, t4
                  remu         s9, zero, s3
                  mulhsu       a4, s7, gp
                  fcvt.w.s     a5, fs11, rne
                  div          a4, t3, sp
                  fadd.s       ft11, fa4, fs9
                  feq.s        t5, fs0, fa2
                  add          zero, t0, t4
                  fcvt.wu.s    a6, ft7
                  slti         gp, a7, 31
                  slt          ra, t6, sp
                  auipc        s3, 239881
                  xori         tp, s8, -23
                  srli         t4, gp, 20
                  rem          s1, a7, s10
                  fsgnjx.s     fa4, fs9, fs2
                  mul          s3, a1, zero
                  slli         t5, sp, 0
                  remu         t1, zero, a7
                  add          a3, s9, a3
                  fmax.s       ft6, ft1, ft9
                  nop
                  or           t0, s8, a2
                  srai         s0, t4, 29
                  and          t1, t1, s9
                  fsqrt.s      ft9, fs6
                  fmax.s       ft4, fa7, ft11
                  sll          a1, s5, t0
                  srl          a5, gp, ra
                  mulhsu       s1, sp, sp
                  fcvt.w.s     tp, ft2, rmm
                  fsgnjx.s     fs0, fs7, fs1
                  divu         a5, t3, t3
                  fdiv.s       fs0, fa2, fs10, rmm
                  mulh         a3, s1, s4
                  fcvt.s.w     fa1, t5, rmm
                  srli         a1, s2, 22
                  fdiv.s       fa2, fs0, ft4, rmm
                  fsgnjn.s     ft2, ft9, fs6
                  sra          s8, a3, s3
                  fsgnjn.s     fa3, fs4, ft7
                  andi         s9, a0, 124
                  xori         a0, ra, 1123
                  fsgnj.s      fa2, ft8, fs2
                  and          t6, tp, tp
                  rem          gp, a1, s2
                  fle.s        s6, fa2, fs9
                  ori          zero, t3, -304
                  ori          a4, s11, -1584
                  fmv.w.x      fa7, a0
                  feq.s        a5, ft11, fs3
                  fsub.s       ft8, ft2, fa1, rup
                  mulhsu       ra, tp, s11
                  fsub.s       ft9, ft1, ft2
                  fcvt.w.s     zero, ft7
                  feq.s        s5, ft9, ft2
                  and          s10, a1, a6
                  or           t5, t4, gp
                  sll          s5, zero, a1
                  srl          t2, t2, s1
                  auipc        s1, 1030326
                  divu         a1, gp, a0
                  xor          a7, s8, t3
                  add          zero, t0, sp
                  slli         s0, ra, 28
                  sltiu        s3, sp, -702
                  nop
                  ori          t0, tp, -492
                  srl          t0, t3, s7
                  lui          t5, 1021043
                  div          s6, a5, a3
                  flt.s        t6, fs10, fa0
                  ori          t1, s1, 1818
                  fle.s        a1, fa1, fs6
                  fsgnj.s      ft4, fs9, ft6
                  srli         a4, a2, 16
                  andi         s2, a0, 1378
                  fcvt.s.wu    fa1, s11
                  divu         a3, gp, s0
                  slt          a5, s8, s9
                  add          t2, t5, s11
                  xor          a7, a1, a2
                  fclass.s     s5, fs9
                  fmv.w.x      ft1, t1
                  addi         a2, s1, 1539
                  mulhu        s6, s1, s2
                  fcvt.s.wu    ft2, ra, rmm
                  sub          gp, s4, t2
                  rem          a6, s7, s4
                  fadd.s       fs10, ft5, fa1, rmm
                  ori          s2, s7, -997
                  addi         s5, t5, 1479
                  fcvt.s.wu    fs8, s11, rdn
                  srl          s0, s8, s1
                  mulhu        t5, a0, t4
                  addi         t0, s6, 736
                  add          ra, t3, s0
                  slli         gp, a4, 19
                  sltiu        a3, s5, 474
                  nop
                  sltu         s1, a7, a5
                  sltiu        s0, a2, -1248
                  fsgnjn.s     ft0, fa1, fs5
                  fcvt.w.s     a6, ft1
                  div          s3, t4, gp
                  fmin.s       fs7, fa1, ft0
                  fsub.s       fa2, ft9, ft10, rmm
                  andi         t0, a7, 811
                  div          t0, s6, a0
                  mulhu        a5, gp, s7
                  auipc        s0, 636406
                  fdiv.s       ft7, fa0, fs0, rtz
                  fle.s        a3, ft5, ft10
                  fcvt.wu.s    sp, fa3, rne
                  divu         a4, s5, a0
                  nop
                  nop
                  sub          a6, ra, tp
                  or           a3, s5, ra
                  fcvt.wu.s    s5, fs7, rdn
                  remu         a1, s3, t3
                  feq.s        s3, fa1, fa2
                  add          s1, s3, a1
                  srli         s1, t3, 29
                  fmv.w.x      ft1, s9
                  fadd.s       ft10, ft8, ft8, rup
                  slt          zero, s8, zero
                  remu         t5, s7, s4
                  srai         s3, zero, 2
                  srli         a2, ra, 7
                  lui          tp, 354951
                  fmul.s       ft0, fa2, ft11
                  slli         a2, t6, 23
                  fadd.s       fa1, ft9, fs8
                  fsqrt.s      fs5, fs7, rmm
                  fmin.s       ft8, fa4, fs0
                  srai         sp, s3, 28
                  slli         gp, a4, 1
                  fsgnjn.s     ft5, fs10, ft6
                  fsub.s       fs1, fa4, ft8
                  and          ra, a4, s0
                  fmax.s       ft2, fs3, fs7
                  flt.s        t2, ft10, fa1
                  sltiu        s8, a7, 227
                  feq.s        s5, ft4, fa5
                  flt.s        t4, ft7, fa3
                  fcvt.s.wu    fa1, a3
                  mulhsu       zero, s2, gp
                  fsub.s       fs7, fs2, fa1
                  fsub.s       ft2, fa0, fa6
                  fsgnjn.s     ft11, fs1, ft1
                  fcvt.s.w     fs8, ra
                  fsgnjx.s     fs5, fs2, ft5
                  xor          s2, s0, a7
                  fclass.s     s6, fs6
                  fcvt.s.wu    fa5, a3
                  fmv.x.w      t6, ft1
                  fcvt.s.wu    fs8, a1, rdn
                  rem          tp, s7, s5
                  fmax.s       fa4, fs5, fa3
                  fsgnjn.s     fa4, ft6, fa4
                  fmin.s       ft6, fs8, ft5
                  andi         t5, zero, 1444
                  mul          s6, a6, s0
                  sub          s8, a6, s3
                  fadd.s       fs3, fs3, ft11, rup
                  srl          a6, t6, s5
                  fcvt.s.w     fs2, s3
                  sll          t5, a2, tp
                  slli         s6, a0, 29
                  slt          a0, t0, s9
                  fcvt.s.w     fa0, s11, rne
                  fsub.s       fs7, fs3, fs7, rne
                  slt          t6, s3, a0
                  divu         s9, a7, a5
                  fsgnjx.s     fs1, ft7, fs4
                  fsgnj.s      ft9, fs10, fs7
                  addi         t2, sp, -1968
                  fmv.w.x      ft10, a0
                  fsub.s       fs4, fs8, fa5
                  slt          gp, a0, a5
                  div          t5, s0, zero
                  lui          s1, 977335
                  fmul.s       fs7, ft1, ft3, rmm
                  slt          s4, s3, tp
                  fmv.w.x      fs0, s10
                  add          s1, a0, a3
                  sll          a6, t4, a7
                  lui          zero, 72946
                  fsub.s       fa1, ft4, ft7, rne
                  srl          zero, a7, s9
                  auipc        t2, 412440
                  ori          s6, s5, 1845
                  remu         s8, zero, s0
                  add          s3, t0, s11
                  fsgnjx.s     fa5, ft6, ft7
                  sltiu        a3, s0, 1336
                  slti         s0, a6, 1497
                  slt          a3, a3, a2
                  fclass.s     t2, ft3
                  fmin.s       ft3, fs8, fa1
                  xor          t4, s5, s0
                  ori          a4, t2, -1706
                  fcvt.s.w     ft1, s8
                  fcvt.wu.s    s3, fs2
                  fadd.s       fa6, ft10, fa4
                  slli         t0, a1, 29
                  mulh         s6, sp, t2
                  fcvt.w.s     a5, ft6
                  fmv.w.x      fs1, t4
                  rem          a7, t1, t6
                  fsqrt.s      fs5, ft1
                  sub          a3, t4, a3
                  divu         a4, a0, t5
                  sra          gp, s8, tp
                  srl          a3, s10, a4
                  srl          t0, a2, sp
                  fcvt.w.s     a6, fs2
                  sltiu        s1, a2, 1310
                  fcvt.s.wu    fs0, a2, rup
                  mul          a6, a3, a7
                  fsgnj.s      fs8, fs1, fs5
                  sub          t1, s5, s7
                  fsqrt.s      fs0, fs3
                  or           gp, tp, a5
                  fcvt.s.w     fs11, tp, rdn
                  mul          zero, s8, s11
                  slli         s9, s6, 21
                  fclass.s     a6, ft7
                  mulh         a7, t4, t4
                  xor          t0, s11, tp
                  fsgnjn.s     ft2, ft0, fa0
                  slt          sp, s11, tp
                  fmax.s       fa4, fa2, fa2
                  sltu         a7, s3, tp
                  mul          a1, sp, s6
                  and          t4, s0, t3
                  fclass.s     s3, fs8
                  fadd.s       ft10, ft7, fs4, rne
                  sll          s2, s11, t1
                  xori         t1, s1, 456
                  srai         t0, a6, 20
                  rem          t0, t5, zero
                  mulhu        s2, a3, s9
                  fsgnj.s      ft8, fs3, fs10
                  auipc        zero, 699021
                  addi         t2, a7, 349
                  fadd.s       ft10, fs7, fs9, rdn
                  sll          zero, s7, s2
                  lui          t6, 273018
                  addi         a0, zero, 159
                  sltiu        a1, t5, 590
                  remu         a4, s0, s5
                  fmv.x.w      s10, fs11
                  remu         t5, s1, t3
                  auipc        a5, 253682
                  addi         a1, a1, 1208
                  sltu         s4, a5, s3
                  fdiv.s       fs0, fa4, ft11
                  fclass.s     t2, fs4
                  divu         a2, s10, s3
                  addi         s1, gp, 896
                  and          s5, s1, t5
                  mulhsu       a6, s8, a3
                  fsqrt.s      fs7, ft4, rup
                  fclass.s     s6, fs7
                  xor          s6, s10, t3
                  fmv.x.w      t5, fa7
                  sra          gp, t0, zero
                  fmin.s       fs0, fa7, ft11
                  or           s6, sp, a0
                  fcvt.s.w     ft1, s9
                  ori          t6, a2, 676
                  slt          s10, t5, a7
                  fmv.w.x      fa2, a4
                  mul          a2, zero, t4
                  fmin.s       ft7, ft2, fs11
                  fdiv.s       ft2, ft11, fa6
                  sltiu        s4, s0, 1063
                  sub          tp, a6, a2
                  slti         a4, a6, 1652
                  div          a2, s2, a5
                  fcvt.s.w     fs3, s11, rdn
                  fsgnj.s      ft3, fa2, ft8
                  xor          s6, s11, a2
                  fcvt.s.w     ft3, a7, rup
                  flt.s        s0, ft0, ft4
                  sltu         s5, sp, a7
                  fcvt.w.s     a0, fs3
                  fdiv.s       fs5, ft9, ft6
                  fcvt.w.s     t1, ft1
                  sra          t2, s7, a0
                  remu         a2, s6, s6
                  add          s10, s6, a0
                  xor          gp, t4, a6
                  fcvt.s.wu    fa6, t4
                  fcvt.s.wu    fs8, s11, rdn
                  remu         tp, t4, s7
                  fmul.s       ft6, ft1, fs10, rtz
                  fsqrt.s      fa2, ft0, rtz
                  sltu         s0, a2, t4
                  ori          s4, s9, 1374
                  fmv.w.x      ft4, t4
                  feq.s        s6, fa7, fs4
                  fclass.s     t0, fa7
                  sll          a7, s5, s8
                  fmv.x.w      a7, fa5
                  fsub.s       fa1, ft10, ft2, rne
                  flt.s        t1, ft0, ft1
                  mulh         t5, s7, s8
                  slli         s1, t4, 31
                  rem          s3, sp, s0
                  rem          s1, a6, a2
                  fcvt.s.wu    fs4, a4, rne
                  rem          a4, s8, s7
                  or           t2, s7, t1
                  mul          s5, a0, gp
                  rem          a5, s8, s6
                  addi         t4, gp, -519
                  fdiv.s       ft1, fs2, fs5, rdn
                  fsgnjx.s     fs7, fs6, ft3
                  fsqrt.s      ft7, ft4, rup
                  and          a2, a1, sp
                  and          zero, a3, s7
                  fadd.s       fs4, fa0, ft9, rne
                  mulhu        s8, s3, a2
                  srl          t4, s6, s7
                  slli         t2, t1, 29
                  fsqrt.s      ft8, ft4, rdn
                  fmv.w.x      fa1, s11
                  sltiu        t2, a4, -1505
                  mulhu        s0, a7, a6
                  nop
                  fcvt.s.w     ft5, s1, rne
                  sltu         s0, s10, s9
                  fdiv.s       ft11, ft2, ft3, rmm
                  fcvt.w.s     ra, fa4
                  rem          a4, a1, a4
                  srli         s10, a2, 28
                  fmin.s       fs8, ft7, ft7
                  add          tp, s9, a4
                  fcvt.wu.s    sp, ft3, rup
                  sll          t2, s10, zero
                  srl          a5, a4, a5
                  or           s8, a3, s6
                  fcvt.s.w     fs10, gp
                  fle.s        a0, fa4, ft8
                  xor          a2, s4, s9
                  rem          a5, a1, s10
                  fdiv.s       fs5, fs6, fs6, rne
                  fmv.x.w      ra, fs10
                  xor          s2, ra, s1
                  xor          a6, a3, a0
                  and          t2, t3, t4
                  slt          s4, ra, s0
                  fsgnjn.s     fa6, ft4, ft6
                  mulhu        t0, t6, t2
                  fmin.s       ft9, ft7, fs11
                  mulhu        s6, sp, sp
                  add          s10, s5, s3
                  sll          t1, t2, s6
                  add          zero, s1, ra
                  feq.s        s5, fa2, fs4
                  srai         a6, t5, 24
                  div          t0, s5, a5
                  fmin.s       ft8, ft11, fs11
                  fmax.s       fs2, ft9, ft1
                  fsgnjn.s     ft10, fa5, ft4
                  lui          a1, 904378
                  fcvt.w.s     s2, ft7, rup
                  rem          zero, s1, gp
                  feq.s        s8, ft5, ft8
                  and          a3, t1, s1
                  add          a7, t5, s2
                  fcvt.wu.s    a5, ft2
                  fmax.s       ft2, fs1, fs7
                  srai         a2, a2, 5
                  flt.s        ra, ft8, ft1
                  xor          s3, t3, zero
                  flt.s        s4, fs9, ft5
                  nop
                  fsgnj.s      ft10, fs9, fs10
                  fmax.s       fs9, ft4, ft10
                  fmul.s       fs0, fs5, fs6, rdn
                  lui          s5, 183349
                  divu         s9, a5, s0
                  add          s9, tp, t2
                  mulhsu       a1, s3, t4
                  fsgnj.s      ft2, fa7, fs7
                  remu         s8, a7, a1
                  lui          a6, 243230
                  feq.s        sp, ft11, fa1
                  fcvt.wu.s    a1, fa2
                  sltiu        s4, t4, 1303
                  mul          t4, a3, s8
                  fcvt.wu.s    s6, ft1, rdn
                  rem          s0, a6, s2
                  fcvt.wu.s    a3, fa7
                  srli         s10, t4, 17
                  addi         t5, t5, 1620
                  fcvt.wu.s    zero, ft7, rtz
                  sub          a7, zero, s3
                  ori          s4, a6, 1517
                  div          tp, s10, s3
                  xori         s8, s0, -656
                  sltiu        t2, s7, -958
                  addi         s0, t0, -1210
                  srl          t6, s1, t6
                  sltu         t2, t5, s6
                  mulh         s0, s5, t3
                  slt          a0, s10, s7
                  nop
                  mulhu        a5, s7, t3
                  sltiu        a2, t6, 1660
                  fcvt.wu.s    zero, fa5
                  ori          tp, a5, -256
                  sltiu        t6, zero, 1697
                  fsqrt.s      fa1, fs8
                  nop
                  and          t4, a1, s4
                  fsgnj.s      ft1, fs6, ft3
                  fcvt.s.wu    fs2, s2, rup
                  ori          s8, a6, 460
                  sll          a1, s2, a2
                  and          a4, a7, a4
                  slti         t4, a0, -1639
                  xor          t2, s6, a1
                  nop
                  fclass.s     a5, ft11
                  fle.s        a4, fs7, fs6
                  fcvt.s.wu    fs4, a1, rtz
                  slti         a3, t4, 869
                  fsgnj.s      ft3, ft9, fa5
                  remu         a0, a6, a7
                  fadd.s       fs9, ft3, ft4, rne
                  fsgnjn.s     fa5, ft10, fs5
                  slti         s4, tp, -1360
                  nop
                  srai         t4, s2, 30
                  fsgnj.s      fs0, ft6, ft1
                  fcvt.s.w     ft7, s5
                  fcvt.s.wu    fs11, s5, rup
                  sra          a6, a4, a1
                  fcvt.s.w     ft9, sp, rup
                  div          a7, s3, s3
                  xori         zero, ra, 1293
                  nop
                  sltiu        s4, tp, 752
                  andi         a5, s1, 1628
                  fmax.s       ft1, fs2, ft8
                  flt.s        s8, fa4, ft5
                  slti         a0, s9, 841
                  fcvt.w.s     s6, fa6, rne
                  feq.s        a6, fs4, ft5
                  mul          t1, s3, a6
                  fadd.s       fs4, ft6, ft7, rdn
                  mulh         a1, a5, s11
                  xori         s5, s5, 827
                  fsub.s       ft1, ft11, fs3, rmm
                  rem          a5, s1, t5
                  or           zero, s3, t4
                  sltiu        a0, tp, -1319
                  sll          a5, a1, a0
                  fcvt.s.w     ft9, ra, rmm
                  fclass.s     sp, fa3
                  mulhsu       ra, s8, a4
                  fcvt.wu.s    t0, fa1, rdn
                  mulhsu       t1, a7, t4
                  ori          ra, s3, -1568
                  mulhu        t4, s7, a6
                  xor          a2, s3, s4
                  sub          a5, s8, a0
                  fmax.s       ft6, fs2, fs1
                  fadd.s       fs4, fa5, fs4
                  mul          tp, t2, s7
                  fsgnjn.s     ft6, fa5, ft11
                  sltiu        s6, s0, 830
                  and          t0, t4, s0
                  auipc        a6, 60508
                  mulh         ra, gp, s3
                  fcvt.wu.s    a7, ft1
                  slt          s9, s6, s1
                  fsgnjn.s     fs4, ft8, fs8
                  fdiv.s       ft3, fs8, fs7
                  slt          ra, t2, t2
                  fmin.s       fs6, ft2, ft9
                  fsub.s       fa5, ft6, ft7
                  fmin.s       ft11, fs7, fa3
                  fclass.s     t0, ft2
                  remu         t0, s6, s6
                  divu         t5, t6, a1
                  fclass.s     a3, ft5
                  remu         t2, gp, s0
                  andi         t5, a6, -971
                  auipc        a5, 958705
                  mulh         t1, zero, s3
                  slti         s9, s2, -1498
                  fdiv.s       fs8, ft7, fs0, rmm
                  fcvt.w.s     t2, ft5
                  fmv.x.w      s9, ft4
                  and          s1, s8, sp
                  divu         sp, t1, gp
                  add          a0, tp, a0
                  fadd.s       ft3, fs7, fa2, rne
                  fsgnjx.s     fa6, fa3, fs1
                  slli         t0, a0, 24
                  flt.s        s6, fa4, fs5
                  addi         a5, a5, -1480
                  slli         a1, a4, 28
                  fclass.s     s3, ft0
                  mulh         s4, t4, tp
                  addi         a7, tp, -870
                  mulhsu       t6, a2, s10
                  sltu         t6, t0, a2
                  sltiu        s0, a6, -134
                  fsub.s       fa3, ft3, ft8, rdn
                  fsub.s       ft5, fs7, fa5, rdn
                  lui          t4, 462852
                  divu         s3, s6, a2
                  fsub.s       ft9, ft3, fs1
                  or           t1, a4, a0
                  addi         s6, zero, 252
                  fsgnj.s      fa4, ft4, ft4
                  sltu         t5, t2, s9
                  add          t6, s5, tp
                  fdiv.s       fs1, fs5, ft2
                  slt          t2, gp, gp
                  feq.s        t1, ft0, ft6
                  divu         t0, tp, s5
                  nop
                  lui          s4, 261227
                  and          s1, t1, s3
                  andi         sp, s8, 1031
                  fsgnjn.s     fa0, fa5, fs6
                  slli         t1, sp, 20
                  auipc        s0, 175686
                  mulhu        t6, s1, t0
                  rem          s10, s9, t5
                  sra          a6, s7, s11
                  sub          s9, tp, a7
                  div          s6, s1, t1
                  feq.s        s1, fs0, fs11
                  fmv.x.w      s4, fs7
                  fmax.s       ft1, ft2, ft4
                  mul          s1, a4, s4
                  fdiv.s       fs6, fs9, fa6
                  fsgnj.s      ft2, fs0, fs9
                  fdiv.s       fs4, fa2, ft10
                  fsub.s       ft6, fs3, ft9
                  sltiu        tp, s0, -547
                  sub          gp, s0, zero
                  slt          a7, sp, a6
                  mulh         t1, s6, a5
                  fle.s        a0, fs5, fs1
                  rem          s3, s11, s2
                  or           t4, s8, s10
                  xor          s3, t2, gp
                  nop
                  fcvt.wu.s    s3, fs10
                  and          a3, a2, gp
                  sub          t6, gp, t1
                  fdiv.s       ft9, fs10, fs7
                  xori         ra, t2, -177
                  mul          t4, s0, s10
                  fsgnjx.s     fa1, ft2, ft4
                  divu         a1, t6, t1
                  flt.s        s5, fs6, fs1
                  fsgnj.s      fa2, fs8, ft2
                  fclass.s     gp, ft8
                  sltu         s1, a4, s6
                  fmv.x.w      a3, fs7
                  sub          a1, a0, sp
                  mulhu        t2, a4, t0
                  nop
                  fmv.x.w      t2, fa3
                  mulh         a0, s1, s5
                  srli         a4, a7, 13
                  fmv.x.w      ra, ft8
                  fmul.s       fs11, ft8, fs9
                  sltiu        a0, s2, -393
                  fcvt.s.w     fa4, s11, rne
                  fmul.s       ft4, fs0, ft0, rne
                  fdiv.s       fs4, ft11, fs4, rtz
                  lui          s4, 87959
                  or           ra, s0, t1
                  mul          s4, gp, t0
                  fadd.s       ft10, ft5, fa4, rtz
                  fsgnjn.s     fs11, ft3, fs2
                  fsub.s       fs4, ft5, fs5
                  feq.s        s3, ft3, fs7
                  add          a1, s1, sp
                  fmin.s       ft7, ft11, fa3
                  srai         t6, t3, 24
                  ori          s10, s2, -1690
                  mul          sp, sp, a1
                  mulhu        s10, s9, s5
                  fdiv.s       ft10, fs4, fa4
                  nop
                  slli         a0, s2, 22
                  lui          zero, 210762
                  fmul.s       ft11, fa7, fs3, rup
                  or           a1, s0, s6
                  srl          a0, tp, t0
                  fcvt.s.wu    fa4, t3, rup
                  slt          s5, s0, gp
                  srl          a4, t4, s8
                  rem          t0, tp, a2
                  sltiu        a7, s0, 1128
                  rem          a2, s7, a0
                  sll          a3, s11, gp
                  fcvt.s.wu    fs9, t6
                  add          t4, t4, a0
                  remu         a7, t6, t5
                  srai         t6, t1, 11
                  andi         t0, s10, -1861
                  feq.s        a4, ft2, ft8
                  lui          a4, 76421
                  fmax.s       fs9, ft8, fs6
                  and          s0, s4, s9
                  fmin.s       ft1, fs6, ft6
                  rem          s1, s11, t5
                  fsub.s       fs2, ft8, fs6, rup
                  xori         a0, gp, -1415
                  fsub.s       fs0, ft0, ft11
                  xor          sp, s5, a6
                  fcvt.s.w     fa5, sp
                  xori         s1, s5, 899
                  fle.s        ra, fs1, ft8
                  fcvt.wu.s    t4, fs10, rdn
                  fmv.x.w      ra, ft5
                  fmul.s       ft0, fa4, ft7
                  mulh         sp, t6, s7
                  andi         t4, s8, 1366
                  fle.s        gp, fs2, fs11
                  fmax.s       fa2, ft3, ft1
                  ori          s5, s4, -369
                  fcvt.s.wu    ft8, t5, rne
                  fcvt.s.w     fa2, a2
                  fsgnjx.s     ft5, fa7, ft9
                  fcvt.wu.s    s9, fa0
                  feq.s        t6, ft5, fa5
                  srli         ra, s4, 15
                  divu         t4, s10, s2
                  slli         t2, t2, 10
                  fclass.s     ra, ft7
                  flt.s        s10, fs0, ft2
                  fsub.s       ft5, ft1, fa0
                  fsgnj.s      ft9, ft10, fs5
                  mulhsu       a1, t2, s8
                  mulhsu       a2, s1, a7
                  fadd.s       fs1, fs0, fa7
                  or           s1, t4, a1
                  fsgnj.s      fs2, fa2, fa6
                  sltiu        gp, s8, -394
                  fle.s        a0, ft3, ft11
                  fcvt.w.s     s4, fa3, rtz
                  div          a5, t3, t0
                  andi         a7, s10, 275
                  auipc        s4, 6151
                  fcvt.s.wu    fa3, s5, rne
                  slti         t6, a4, -1296
                  auipc        s3, 363389
                  lui          s2, 617405
                  flt.s        sp, ft8, fs7
                  auipc        s8, 603783
                  fcvt.s.w     fa5, t2, rtz
                  fclass.s     t4, fs6
                  fle.s        s5, ft4, fs2
                  fcvt.s.w     ft1, s11, rne
                  auipc        s9, 362880
                  fclass.s     s0, ft1
                  fsqrt.s      fs4, fs1
                  fdiv.s       fs7, fs0, fs6
                  srai         t1, t4, 10
                  divu         s6, a4, a1
                  mulh         a3, sp, s3
                  fsgnjn.s     fa0, fs9, ft4
                  feq.s        s3, fs7, fs2
                  fmv.x.w      s5, fa1
                  ori          a7, s1, 1206
                  fcvt.s.wu    fs6, tp
                  lui          tp, 492342
                  fmin.s       fs6, fa4, ft7
                  auipc        a7, 1025646
                  srl          a4, t2, a7
                  slli         s10, t6, 6
                  divu         t5, s11, s11
                  slt          s4, a6, t5
                  slt          gp, a4, t2
                  fsqrt.s      fa0, ft10, rne
                  divu         sp, t3, s9
                  srli         s0, ra, 24
                  or           zero, gp, zero
                  fmin.s       fa0, fs3, fs1
                  rem          gp, a7, t2
                  fdiv.s       ft11, fs6, fs10, rdn
                  sub          a7, a5, a0
                  fsqrt.s      fs5, ft9, rmm
                  feq.s        zero, fs2, fa2
                  xori         a0, t1, 773
                  srli         s3, ra, 2
                  addi         tp, s4, -102
                  auipc        t0, 856215
                  fmul.s       ft6, ft8, fa6
                  slt          a1, zero, s7
                  fcvt.wu.s    s1, ft3
                  fcvt.s.wu    ft11, gp
                  fsgnjx.s     fs9, fa3, fs7
                  sltiu        s1, s8, 750
                  srli         s9, t5, 17
                  fcvt.s.w     fs0, s1
                  feq.s        s6, fs8, fs8
                  xor          ra, s2, t3
                  mulhu        s1, s0, tp
                  mulhu        s1, t1, zero
                  mulh         t0, s5, sp
                  fsgnjx.s     fs11, fs7, ft9
                  mulhsu       s5, s1, a5
                  fsgnjn.s     ft0, fa7, ft8
                  sra          s1, s1, s11
                  mulhu        s5, gp, gp
                  sltu         s4, s0, a7
                  rem          s9, gp, a0
                  mulhu        t5, a4, s6
                  auipc        a1, 118258
                  xor          s1, gp, t0
                  sll          a0, s5, t1
                  sll          gp, t1, s0
                  ori          s10, s2, -1103
                  nop
                  slti         s6, a2, -699
                  xor          t5, t5, s7
                  div          s6, s6, t0
                  fmul.s       ft7, ft6, ft0
                  sub          ra, s11, t6
                  ori          s9, zero, 870
                  divu         t4, a6, ra
                  andi         zero, s1, -1610
                  sra          s10, s6, gp
                  fcvt.w.s     t6, ft8
                  fsgnj.s      ft5, fa5, fa0
                  auipc        t4, 797736
                  xor          a0, t5, a3
                  fsgnjx.s     ft5, fs10, fs3
                  sra          a4, ra, a4
                  xor          t6, a0, t2
                  sltiu        a5, a1, -119
                  flt.s        t5, fs2, ft0
                  and          s5, a7, s2
                  fmv.x.w      a7, fs8
                  fcvt.w.s     s4, ft6
                  mulh         s1, gp, a7
                  fmv.w.x      fs1, t2
                  fadd.s       fs1, fa4, fs2, rup
                  mulhsu       ra, t1, a2
                  fclass.s     ra, ft10
                  mul          t6, t6, sp
                  mul          a6, ra, s2
                  auipc        a4, 322464
                  lui          a7, 383842
                  sub          tp, t3, t4
                  sll          a7, a5, a2
                  mulhsu       s9, s8, sp
                  remu         s2, ra, zero
                  feq.s        s5, fs11, ft3
                  fcvt.s.w     ft7, s8, rne
                  ori          s5, t6, -801
                  nop
                  fcvt.wu.s    t4, ft4
                  xori         s5, a3, -1232
                  fsgnjn.s     fs3, fs8, ft6
                  fcvt.w.s     s3, ft4, rmm
                  rem          s0, s10, a1
                  andi         t2, t1, -1726
                  fcvt.w.s     gp, fa5, rne
                  slli         s2, s11, 13
                  flt.s        a6, fa6, fa3
                  srai         a0, a0, 3
                  sll          s2, t0, s9
                  lui          s0, 606817
                  fsgnjx.s     fs10, ft10, ft3
                  fmv.x.w      s10, fs6
                  ori          a6, s1, 1319
                  div          t1, a4, gp
                  rem          s6, a5, a6
                  srli         t4, tp, 30
                  sra          s6, s2, t5
                  srai         s4, t6, 2
                  sltiu        a3, t6, 1529
                  addi         gp, a5, -1921
                  fcvt.s.w     fa4, s3, rne
                  slt          s9, s6, s3
                  fcvt.wu.s    s10, fs5
                  xori         t4, t2, 586
                  fsgnjn.s     fs6, ft7, fa2
                  xor          a5, s6, sp
                  and          a6, sp, a2
                  sll          gp, a6, t4
                  feq.s        a5, fs0, ft9
                  rem          t5, a2, t6
                  xori         t6, zero, -861
                  fmin.s       ft1, ft11, fs1
                  slli         a5, s10, 15
                  divu         tp, a4, t5
                  fadd.s       ft1, fa1, ft2, rtz
                  srl          a4, s6, t4
                  sub          a4, a5, a1
                  divu         a1, s11, sp
                  xor          sp, s0, s11
                  fsub.s       ft2, ft6, fa4
                  xor          t6, s8, zero
                  srai         s9, t4, 14
                  remu         s1, s10, s11
                  sub          s9, s9, s4
                  fsgnjx.s     ft2, fs7, ft11
                  srai         t1, s4, 8
                  fle.s        gp, fa7, fa1
                  sll          ra, t5, t4
                  nop
                  fle.s        a3, fs5, fa7
                  addi         gp, t5, 1538
                  sll          a1, s10, a3
                  fcvt.wu.s    gp, ft10, rtz
                  andi         a2, a3, -459
                  rem          t1, s7, s4
                  sltu         zero, sp, s2
                  fmin.s       fa7, fs9, fs11
                  sub          t0, a1, ra
                  fadd.s       fs9, fs8, ft3, rdn
                  fcvt.wu.s    a5, fs6
                  sltiu        t1, s6, 299
                  fadd.s       fa0, ft8, fa3
                  sltiu        a5, s8, 33
                  fmin.s       fa6, fs2, ft1
                  srai         s8, a7, 25
                  mulhsu       s5, ra, a6
                  or           s4, ra, t5
                  lui          a7, 29134
                  sltu         a4, t6, s9
                  fcvt.wu.s    a1, fs8
                  divu         s9, t1, a6
                  rem          a2, s9, s9
                  and          s1, tp, ra
                  fcvt.s.wu    ft8, s8, rmm
                  andi         s1, s3, 866
                  lui          t0, 448941
                  rem          gp, t2, s5
                  fcvt.s.wu    fs9, a0, rne
                  mulhu        a7, s8, zero
                  sra          s5, a1, ra
                  add          a1, t0, a5
                  srli         a2, s2, 15
                  fcvt.wu.s    s5, ft2, rup
                  remu         ra, t4, s3
                  sra          s4, s7, s11
                  mul          t1, s10, s11
                  nop
                  mul          ra, s10, a2
                  fmv.x.w      a1, fs3
                  lui          s1, 1022813
                  addi         zero, s6, -1924
                  slti         tp, s10, 1769
                  fcvt.wu.s    t0, fs7, rtz
                  feq.s        t1, fs2, ft9
                  fcvt.w.s     a6, fs10, rtz
                  slli         s9, s4, 1
                  mulhsu       ra, s9, t0
                  remu         a0, t1, t1
                  fadd.s       fa1, fa2, fa6
                  sra          a5, t3, a0
                  flt.s        s4, fa7, ft7
                  sra          s4, tp, s2
                  srli         t4, s8, 5
                  xor          s4, tp, tp
                  fcvt.s.w     ft6, s3
                  lui          a0, 160155
                  fclass.s     a6, ft2
                  fmin.s       ft8, ft9, fa7
                  sltu         s4, s1, a5
                  sltiu        t5, ra, 1653
                  sra          t4, t2, s4
                  mulhu        s8, a3, t3
                  div          a2, s11, s11
                  fmv.w.x      ft0, s4
                  fle.s        a6, fa4, fa1
                  fcvt.wu.s    a4, ft4
                  fsgnjn.s     fs7, ft1, fa7
                  lui          t4, 108914
                  xori         s9, a7, -1213
                  addi         s2, s8, -1872
                  srli         t1, s11, 13
                  flt.s        t2, ft6, fs9
                  fle.s        t6, ft1, fa5
                  fmax.s       ft6, fs6, ft10
                  divu         s4, a3, t0
                  flt.s        s6, fa6, fa4
                  fsub.s       fa0, fa1, fa5
                  divu         s9, t0, s3
                  rem          gp, s2, sp
                  mulh         a3, sp, s3
                  divu         a3, s0, s6
                  srli         t6, s10, 11
                  fmv.x.w      t2, fa3
                  fmv.x.w      s1, fa4
                  fdiv.s       ft5, fs4, ft1
                  nop
                  fsgnjx.s     ft1, ft9, fa4
                  nop
                  sll          t5, s10, s7
                  auipc        sp, 794434
                  mul          t1, a4, s1
                  fmv.x.w      ra, fa6
                  srli         t4, s1, 10
                  srai         t2, sp, 1
                  and          s3, a2, zero
                  fcvt.w.s     zero, fa6
                  fsgnjx.s     fa7, fs6, fs5
                  fmin.s       fs3, fs3, fa7
                  and          t0, t2, a0
                  sltu         gp, a3, s8
                  add          a1, t3, s5
                  mul          t0, s11, t2
                  fcvt.s.wu    fa5, s10, rdn
                  lui          a4, 727950
                  fsub.s       ft6, fs9, ft0, rmm
                  fmax.s       fs3, fs2, fs9
                  xor          a6, s8, t1
                  mulhsu       s4, t4, t5
                  sltu         s9, a7, a5
                  srl          a5, t4, s9
                  sra          t5, t0, s4
                  fcvt.s.wu    fs11, t4, rmm
                  fsub.s       fa2, fs5, fs2, rup
                  feq.s        a1, fs0, ft2
                  slt          sp, s7, s10
                  remu         gp, a7, t4
                  fsub.s       ft9, ft0, ft2, rne
                  sra          a4, ra, a0
                  addi         a7, s7, -274
                  fsgnjn.s     fa3, ft5, ft0
                  lui          t6, 227349
                  add          s1, s11, a0
                  mul          t1, a5, a5
                  sra          s4, t2, s11
                  feq.s        a4, fs2, ft4
                  div          a7, gp, s9
                  addi         s5, t1, 93
                  lui          a0, 563319
                  and          a2, a2, t1
                  divu         s4, s5, s4
                  sub          t1, t6, zero
                  sll          a2, t2, s5
                  slti         t1, t5, -982
                  rem          a6, a5, a6
                  rem          s2, t1, t1
                  remu         t2, a7, zero
                  fle.s        t5, fs7, ft3
                  div          s10, a3, t5
                  fmv.x.w      a4, ft1
                  lui          s9, 579437
                  divu         a3, zero, s3
                  fmul.s       ft3, fa4, fs7
                  fcvt.s.wu    fs8, s0
                  sll          s6, t5, a5
                  fsqrt.s      fs3, ft5, rtz
                  sll          a0, s7, s1
                  fmul.s       fs11, fs3, fs11, rne
                  fmul.s       fa0, ft4, fs8
                  ori          a6, gp, -737
                  fsqrt.s      fs10, fs7
                  fcvt.s.w     fs2, a4
                  fcvt.s.wu    fs8, a2
                  remu         ra, s7, a5
                  sltiu        t1, s7, -647
                  srl          a0, s4, a4
                  fcvt.w.s     a3, fa4, rup
                  flt.s        sp, fs9, fa6
                  fdiv.s       fa2, fa0, fa6, rtz
                  mulh         a1, zero, a1
                  slli         a1, s4, 19
                  slli         a3, s1, 23
                  fmv.w.x      fa1, s3
                  rem          s8, t0, a3
                  fsub.s       fa4, ft10, fa4
                  div          s8, zero, s11
                  fsgnjx.s     fa4, fa0, ft6
                  slti         s0, s5, 1880
                  fcvt.wu.s    s9, fa6
                  fcvt.s.wu    ft3, a2
                  divu         t1, a2, s10
                  flt.s        s9, ft0, fa1
                  slli         a7, s11, 4
                  fclass.s     s3, ft5
                  addi         s6, zero, 1744
                  rem          a0, s9, s8
                  divu         t0, t4, t5
                  srl          s3, t4, s1
                  div          sp, s2, a4
                  flt.s        a6, ft8, fa0
                  mulhu        a7, s4, s10
                  mulh         ra, t3, a1
                  fmin.s       ft10, ft5, fa1
                  fmv.w.x      fs1, t4
                  slti         s4, t3, -1956
                  sub          s2, s0, s1
                  fmv.x.w      s1, fa4
                  slti         a0, a7, 904
                  xor          t0, s10, s7
                  andi         s4, a3, 100
                  fcvt.s.w     fa3, t3, rup
                  fcvt.s.w     fs8, s6, rmm
                  fmin.s       ft2, ft4, fs2
                  nop
                  divu         s5, s10, a1
                  fsqrt.s      ft1, fs4, rne
                  flt.s        t6, ft3, fs10
                  sra          a4, t6, s8
                  srai         t0, a3, 2
                  mulh         s9, t2, s3
                  sra          t4, a4, gp
                  andi         s6, s7, 1400
                  fadd.s       fs3, fs7, fs3
                  auipc        a0, 515519
                  ori          s3, a0, 1875
                  fle.s        a5, fa6, fa4
                  remu         sp, s10, a1
                  andi         t5, a5, 1067
                  fcvt.s.wu    ft7, t0
                  fclass.s     t1, ft6
                  div          t6, ra, t2
                  fcvt.wu.s    a7, fs0
                  divu         a2, a2, tp
                  lui          s4, 377827
                  or           t6, tp, s0
                  fcvt.s.w     ft8, a2, rtz
                  fsub.s       fs11, fs3, ft7, rmm
                  fmv.w.x      fs7, a0
                  srl          t4, t1, a5
                  fle.s        a5, fa3, fs1
                  sltu         t1, sp, s1
                  slli         s3, s3, 31
                  fmv.x.w      a6, fa1
                  or           a2, a4, s7
                  nop
                  sltiu        sp, t6, 1590
                  fsgnjn.s     fs11, fs11, fs8
                  div          a0, s10, s11
                  divu         t5, s10, a6
                  rem          a2, zero, a3
                  slli         ra, s7, 3
                  fsgnj.s      fa7, ft2, fs3
                  slli         s9, t6, 16
                  feq.s        s6, fs11, ft7
                  fadd.s       fa2, fs3, fs9
                  fadd.s       fa5, fa7, ft3
                  addi         tp, s10, -833
                  sll          a4, t1, s0
                  mul          t5, ra, t5
                  addi         s0, a0, 1540
                  slli         a7, s0, 5
                  fmv.x.w      s4, ft5
                  slt          tp, a6, s5
                  div          t2, t3, a4
                  fcvt.s.w     fa5, s2
                  srli         t1, a2, 19
                  addi         a2, t2, 497
                  fadd.s       fs4, fs11, fa5
                  fcvt.wu.s    s8, fs6, rmm
                  fcvt.s.wu    ft10, s9, rmm
                  fle.s        tp, ft1, fs6
                  mulhsu       s9, t1, a4
                  fmax.s       fa5, ft7, ft4
                  fmul.s       fs8, fa5, fa7
                  slli         a3, a1, 29
                  auipc        t6, 326067
                  mulhsu       sp, s3, gp
                  slti         ra, t2, -497
                  fsqrt.s      fs2, fa2
                  fmax.s       fs4, fs3, fa1
                  slli         t0, s5, 18
                  flt.s        a6, ft3, ft9
                  feq.s        gp, ft10, ft11
                  fcvt.wu.s    tp, fa6
                  srai         s3, s1, 12
                  fsub.s       fs11, fs9, ft5
                  rem          t1, gp, a3
                  fle.s        a0, ft1, fs4
                  fcvt.s.w     fs3, s1, rne
                  add          sp, s2, t5
                  mulh         tp, s2, gp
                  slli         a2, a2, 5
                  fmul.s       fs7, fa4, fa0
                  fdiv.s       fa0, ft4, ft9, rne
                  nop
                  xori         s1, tp, 866
                  remu         s1, s5, a5
                  mulh         s6, a5, a5
                  addi         a7, zero, -1906
                  mul          a5, a4, gp
                  srl          s4, a7, s1
                  fmin.s       fa0, fs7, fa7
                  fcvt.s.w     fs4, a7
                  mul          tp, s2, a7
                  fcvt.w.s     a5, ft7
                  fcvt.s.w     ft6, s6
                  andi         a5, s9, 674
                  fsub.s       fs7, fs8, ft6, rne
                  mulh         tp, s3, s11
                  div          s6, s7, s9
                  slli         s2, a3, 6
                  fcvt.wu.s    s6, fa5
                  xor          s1, s1, t5
                  div          s0, s1, a7
                  xori         t2, t1, 1316
                  fmul.s       fa4, ft5, ft5
                  srl          s2, s9, sp
                  add          s2, gp, s8
                  sub          t4, t3, s7
                  fdiv.s       fs10, ft7, fs11
                  fmv.x.w      s0, fa3
                  srl          zero, a4, t1
                  fmv.x.w      a5, fa0
                  div          a3, s1, a7
                  srl          s1, s2, s5
                  fadd.s       fs5, fa5, ft1
                  fclass.s     t0, ft1
                  fsub.s       ft6, fa2, ft9, rtz
                  slti         t2, s7, -950
                  fadd.s       ft8, fa1, fa4, rne
                  rem          a2, s5, t3
                  divu         ra, s8, s3
                  srli         s0, t4, 9
                  fadd.s       ft9, fs8, fs5, rmm
                  divu         t6, s2, s8
                  rem          t1, ra, s7
                  auipc        a1, 1048572
                  fle.s        s1, fs5, ft3
                  feq.s        s1, fs6, fs1
                  sra          a2, s4, t2
                  fclass.s     zero, fa0
                  remu         sp, gp, s6
                  srai         a2, s10, 22
                  fcvt.wu.s    a0, ft7
                  fcvt.w.s     a0, ft7
                  lui          a7, 873545
                  slti         t5, a4, -1545
                  fclass.s     s3, fs1
                  add          a4, s11, a4
                  fsgnjn.s     ft9, ft3, ft10
                  srl          s4, ra, t2
                  and          a4, s11, t1
                  fsgnjx.s     fs5, fs0, ft6
                  sub          s0, s4, s0
                  add          s3, s5, s7
                  lui          a1, 1038770
                  flt.s        a5, fs8, fa1
                  srli         zero, tp, 26
                  fdiv.s       ft2, ft3, fa6
                  fdiv.s       fs3, fs5, fa7
                  auipc        s8, 422278
                  fcvt.s.w     ft0, t2
                  fdiv.s       fs1, fa5, fs5
                  feq.s        s9, fa1, fs1
                  mulh         s2, a4, s0
                  and          t0, sp, a5
                  slt          s9, a5, s8
                  srli         s4, s4, 2
                  fmv.x.w      a6, ft0
                  fclass.s     a7, fs8
                  fsgnj.s      fa6, fs9, fs9
                  srai         a5, a1, 14
                  sltiu        t4, sp, -1505
                  mulh         a6, a2, t5
                  fsgnjx.s     ft5, fs10, ft10
                  addi         a7, t5, 1410
                  andi         s8, t2, -1545
                  or           t5, t0, t1
                  fle.s        s5, fs5, fs5
                  fcvt.s.w     ft0, s1, rtz
                  fmv.w.x      ft11, t6
                  srai         s3, s5, 18
                  xori         s2, s2, 1123
                  add          a4, s8, s8
                  slti         sp, a2, -382
                  remu         t6, a7, a0
                  sub          t1, s2, s10
                  fsgnjn.s     ft4, fs3, fa5
                  fcvt.s.w     ft10, s4, rne
                  fcvt.wu.s    s2, fa7
                  rem          a1, s5, a0
                  fmax.s       fs8, fs5, ft4
                  add          t2, s11, s0
                  and          t1, a0, s9
                  auipc        s4, 496022
                  feq.s        s4, ft10, fa0
                  mulhsu       t0, s3, t3
                  feq.s        sp, ft1, ft10
                  fcvt.w.s     tp, fs3, rne
                  fle.s        a6, fs5, ft6
                  or           s8, s10, s1
                  addi         a0, sp, -824
                  xori         a4, t2, 595
                  fsgnjn.s     ft4, fa7, fa6
                  divu         a2, a6, sp
                  fmax.s       fs4, fs8, fa0
                  addi         t4, tp, 900
                  and          a5, s9, a5
                  fadd.s       ft6, ft1, ft7, rne
                  mulhsu       t1, a7, sp
                  slli         s0, t0, 6
                  fcvt.s.wu    fs10, tp
                  andi         s9, t3, 1739
                  srli         gp, s0, 0
                  fmax.s       ft9, fs0, ft11
                  xor          ra, a5, s4
                  fsgnjn.s     fa3, ft7, ft0
                  fmv.w.x      ft8, a4
                  or           s6, s0, s2
                  lui          a3, 153049
                  sll          gp, t4, t2
                  lui          gp, 442500
                  xori         tp, zero, -804
                  fmin.s       fs1, fa2, ft9
                  fsqrt.s      fs0, fs7
                  fsgnj.s      ft8, fs1, fs0
                  auipc        a5, 156589
                  mul          a2, t6, a1
                  fsgnjn.s     ft8, ft5, ft3
                  fsgnjx.s     fs0, fs4, ft5
                  fsqrt.s      ft3, fs5, rup
                  fmv.x.w      a2, fa7
                  add          t6, a6, s4
                  fmax.s       ft7, fs2, fs2
                  fsgnjn.s     fs5, fs5, ft3
                  sll          t5, s9, a1
                  fmax.s       fs2, ft11, fs0
                  mul          t4, s3, s4
                  srai         s0, t4, 23
                  sra          a7, s5, t4
                  fsqrt.s      fs3, fs1, rdn
                  add          a3, t3, t6
                  mulh         s2, t5, s8
                  slt          s5, t6, a5
                  sub          s10, s2, s7
                  sub          gp, s9, a4
                  remu         s2, t3, s11
                  divu         s6, t2, s4
                  and          a3, t3, s3
                  lui          ra, 664376
                  fcvt.wu.s    a0, ft5, rup
                  fmin.s       fs7, fs7, ft10
                  addi         t5, s1, 1454
                  ori          s1, zero, 1265
                  mulhu        a2, s2, s10
                  fmv.x.w      s3, fs3
                  fadd.s       ft4, fs6, fs2
                  slti         s9, s0, -854
                  fsgnj.s      fs10, fs5, fa0
                  mulhsu       t4, s7, t6
                  add          s9, t4, t2
                  fsgnj.s      fs1, ft9, ft4
                  fmax.s       fs5, ft3, ft9
                  fsqrt.s      fs9, fs9
                  and          s2, s10, s4
                  div          a1, zero, s9
                  nop
                  fcvt.s.w     ft8, s4, rtz
                  and          s9, s9, t5
                  fcvt.wu.s    s0, ft2, rup
                  fmin.s       fs3, fs5, fs2
                  srli         s0, a7, 20
                  fdiv.s       ft2, ft7, ft5, rup
                  sltu         s4, a7, zero
                  add          zero, t5, a4
                  auipc        s2, 189070
                  fsgnj.s      fs8, ft11, fa4
                  slti         s1, s4, 1937
                  fsgnjx.s     fa0, fs9, fs6
                  fmax.s       fs5, fs6, fa7
                  fcvt.w.s     ra, fs4
                  srli         t4, t6, 28
                  fcvt.s.wu    ft0, t4
                  srl          a1, t3, zero
                  sub          zero, a0, sp
                  mulh         s8, t0, t2
                  srl          s1, s1, t5
                  slt          s2, t1, s8
                  addi         a5, s11, 1286
                  remu         s10, s10, a5
                  fmax.s       fs1, fa4, fs0
                  div          s1, s10, t4
                  xori         s1, t2, 591
                  fdiv.s       fa2, fs4, fa7
                  fcvt.s.w     fa2, s9
                  slt          t4, a6, s8
                  sltiu        s6, s8, -136
                  slli         a2, a5, 23
                  or           s8, a7, ra
                  ori          t6, s4, -401
                  fclass.s     t4, fs1
                  fmv.w.x      fs0, a5
                  mul          gp, t2, s4
                  andi         t1, t2, 95
                  andi         ra, t0, 931
                  fcvt.wu.s    s5, fs11
                  xor          s1, t3, a6
                  fcvt.s.wu    ft3, a6, rne
                  fmul.s       fs6, fs7, fs4, rtz
                  fcvt.wu.s    t6, fs2, rne
                  xori         t6, t1, -222
                  fclass.s     t0, fs5
                  addi         t0, t0, -1448
                  sltiu        ra, a5, -1954
                  auipc        a1, 926809
                  mulh         t6, a5, s10
                  slli         s6, a7, 16
                  sll          ra, s2, s4
                  slti         t6, s5, 565
                  andi         s1, t5, 1158
                  fmul.s       fs2, fs5, fs11, rmm
                  fmul.s       fs8, ft7, fs0
                  fle.s        tp, ft3, ft7
                  fmul.s       fa2, ft4, fa5
                  fcvt.s.wu    ft11, t3, rne
                  fcvt.wu.s    t5, ft4, rtz
                  mulhu        s9, a1, a5
                  ori          a3, s10, 1438
                  sltu         t0, a2, t5
                  flt.s        s5, ft5, ft9
                  feq.s        s0, ft11, fs9
                  srli         a3, gp, 27
                  fsqrt.s      fs6, fa6
                  fsgnjx.s     ft11, fs10, fs4
                  mulhu        a1, s4, t6
                  fmv.w.x      fa1, zero
                  flt.s        s2, ft3, fa2
                  fmv.x.w      a3, fs1
                  fcvt.s.wu    fa4, t0
                  fdiv.s       ft0, fa1, ft8, rmm
                  xor          t5, t2, t3
                  flt.s        t1, fa7, ft9
                  remu         a2, a6, t0
                  sll          s9, zero, t3
                  srl          s0, t5, a0
                  fle.s        a2, ft2, ft11
                  fcvt.s.wu    fa6, s1
                  slt          gp, sp, tp
                  fmv.w.x      fa2, s6
                  mulh         t4, t1, s3
                  slli         tp, ra, 20
                  addi         t0, s8, -379
                  fmul.s       fa0, fs2, ft0, rne
                  fclass.s     a0, fs11
                  mulhu        t4, s9, a5
                  and          ra, s5, t4
                  fmul.s       fa3, ft6, fs10
                  sltiu        zero, a3, 280
                  fadd.s       ft11, ft1, ft2
                  fle.s        gp, fa6, ft0
                  feq.s        s10, fa7, fa2
                  fsgnjx.s     fa1, ft0, fa4
                  nop
                  xor          a6, t1, t5
                  fadd.s       fs9, fs6, fs1, rne
                  rem          tp, a6, s6
                  divu         a3, t3, t6
                  fle.s        s9, ft7, ft4
                  fcvt.s.wu    fa3, a6, rtz
                  auipc        sp, 719588
                  fsub.s       fa4, fs6, ft11
                  ori          t6, s0, -1432
                  srai         s9, zero, 21
                  add          s5, s10, sp
                  fmul.s       ft3, ft1, ft7, rtz
                  mulhsu       t0, s4, ra
                  mul          t6, s1, s10
                  fsqrt.s      fs4, fa6
                  fsgnj.s      fs2, fa7, fs11
                  srl          tp, tp, t0
                  slt          t5, s10, s9
                  fadd.s       ft9, ft6, fs9, rup
                  fsgnj.s      fa3, ft11, fa7
                  srai         ra, s9, 14
                  sub          t6, s10, s9
                  fcvt.wu.s    t2, ft11, rdn
                  fdiv.s       fs1, fs1, fs1
                  fmul.s       fs9, fs6, fs3, rne
                  feq.s        a0, ft3, fs7
                  srai         s3, s9, 19
                  or           s9, s0, s7
                  fle.s        t6, ft2, ft0
                  fsgnjn.s     fs5, ft9, fs3
                  fcvt.wu.s    a7, ft5, rne
                  fcvt.s.w     ft3, s1, rdn
                  or           s10, a3, zero
                  xori         a6, a5, -818
                  srl          s9, s2, a3
                  slli         t5, s11, 28
                  fmax.s       fa2, fa6, ft6
                  or           s0, a4, a2
                  fsgnjn.s     fa5, ft5, ft6
                  and          s8, a0, t0
                  fcvt.s.wu    fa4, s4, rne
                  srl          gp, gp, a1
                  fsgnjn.s     fa4, ft2, ft10
                  fmin.s       fs7, fs11, ft2
                  sra          t1, t2, t3
                  fsgnjn.s     fa1, ft8, fs0
                  nop
                  srai         t1, t6, 22
                  fsgnjn.s     ft0, fs8, fa5
                  add          a3, zero, s8
                  fcvt.s.wu    fs3, sp
                  fadd.s       fa3, ft9, ft3, rmm
                  slti         sp, s3, 1906
                  addi         s4, zero, 1722
                  andi         a7, a1, -1978
                  fsub.s       fs4, fs4, fs5, rmm
                  fmv.x.w      a3, fa4
                  auipc        s0, 835198
                  fclass.s     a3, ft4
                  slti         a5, t2, -1647
                  fle.s        ra, fa0, ft1
                  nop
                  slt          s5, s10, t1
                  fcvt.s.w     fa4, t4
                  feq.s        a7, fa6, ft2
                  fmv.x.w      s8, fs4
                  sll          s6, s5, tp
                  add          s6, tp, a2
                  auipc        a4, 529901
                  slti         a4, s1, 1325
                  xor          a0, s1, s5
                  add          s10, zero, t1
                  div          s1, ra, s11
                  divu         s1, s8, s4
                  fadd.s       fa5, fs10, fa2
                  fmv.w.x      fa5, t2
                  slt          t4, t0, a7
                  srl          s5, a4, t6
                  mulh         s0, tp, s9
                  sub          a5, s0, t1
                  slti         a4, a2, -1854
                  fcvt.wu.s    s4, ft1, rne
                  div          t2, a7, t2
                  rem          a5, s3, a6
                  add          sp, a6, t4
                  fmin.s       ft0, fa2, ft2
                  slti         s5, s5, -21
                  fcvt.wu.s    s10, ft10, rmm
                  slli         s3, t3, 2
                  srli         a7, s9, 21
                  fsqrt.s      ft7, ft6, rtz
                  and          t4, s8, a3
                  sll          a5, a7, a4
                  mulhu        s6, s6, s6
                  fmax.s       ft2, fs1, fs11
                  andi         s1, s6, -2021
                  sltu         s2, t6, s10
                  andi         s2, t1, -389
                  fdiv.s       fa0, fs6, ft7, rne
                  fsgnjn.s     ft11, fa1, fs1
                  fsqrt.s      fa2, ft11, rtz
                  fsqrt.s      ft3, fs10, rup
                  andi         t1, s1, -1855
                  slli         t0, a3, 22
                  mul          t2, s3, s4
                  lui          a5, 460923
                  srl          s0, t3, s1
                  slt          t2, gp, s4
                  fcvt.s.w     ft3, a3
                  fsqrt.s      fs11, fs10
                  fmin.s       fs6, fs6, fa1
                  xor          t1, s5, t1
                  divu         gp, t2, gp
                  fle.s        s5, fs4, fa4
                  slti         a0, s5, 1375
                  or           a3, s10, t4
                  feq.s        a5, ft6, fs2
                  or           s2, t4, s0
                  slli         zero, s9, 17
                  rem          a7, t3, gp
                  slli         s0, sp, 3
                  srl          s3, s6, s2
                  srai         a1, t6, 6
                  fcvt.wu.s    tp, ft4, rdn
                  fle.s        s3, fs1, ft5
                  remu         t4, zero, s0
                  auipc        t0, 26848
                  slli         s0, t1, 21
                  fsqrt.s      fs2, ft5
                  divu         s0, t0, t5
                  divu         a4, sp, t4
                  srai         ra, s5, 13
                  fcvt.wu.s    s5, fs8, rne
                  fmin.s       ft6, fs6, fa3
                  srl          s9, ra, s11
                  auipc        a3, 33710
                  div          t1, t5, t2
                  sub          s1, s9, s6
                  xori         s8, a5, 207
                  remu         s4, a2, s1
                  divu         t0, ra, a1
                  slt          sp, s2, s5
                  fcvt.s.wu    fa3, s1
                  and          t2, s1, s6
                  lui          s3, 317168
                  divu         s1, s11, a6
                  lui          s0, 589995
                  fmv.w.x      fa1, t3
                  andi         t1, a6, -848
                  fdiv.s       ft4, ft5, fa4, rup
                  mul          s9, s1, zero
                  fmv.x.w      a3, fa5
                  slti         gp, s11, 1849
                  addi         t6, t4, -746
                  srl          gp, s5, t4
                  fcvt.s.wu    ft5, t3
                  sll          a7, ra, a7
                  srai         t5, s5, 18
                  fsqrt.s      ft9, ft5, rtz
                  fadd.s       fs10, ft2, ft7, rne
                  fclass.s     tp, fa4
                  flt.s        s9, ft6, ft4
                  fcvt.s.w     fs8, t0, rtz
                  ori          t6, a5, -1636
                  auipc        s5, 547877
                  mul          s10, t0, tp
                  sltu         a2, t3, a1
                  fmax.s       fs5, fa5, fs11
                  fcvt.s.w     fs3, a6, rdn
                  div          s3, a2, s11
                  flt.s        s10, fs7, fs4
                  sra          a3, s6, t2
                  and          t6, a3, a0
                  and          a7, t5, s8
                  remu         zero, t3, t0
                  fcvt.s.wu    ft11, t0, rmm
                  sra          t2, s10, t2
                  fsgnjn.s     ft1, ft11, fa1
                  fmv.x.w      s0, fs4
                  fmax.s       fa3, fs9, fs1
                  fsqrt.s      ft4, ft8, rmm
                  mul          a6, s9, a1
                  fcvt.s.wu    ft6, t1
                  fmin.s       fs9, fa6, fs3
                  fmin.s       fs7, ft6, fs11
                  feq.s        zero, fs7, fs4
                  fsub.s       ft1, ft6, fa3, rtz
                  remu         s5, s11, a1
                  auipc        s2, 174110
                  sltu         s3, sp, t2
                  srai         a3, t6, 13
                  slli         a3, sp, 9
                  mulh         ra, gp, s11
                  fmax.s       ft0, ft11, ft5
                  xori         ra, s5, 271
                  fmul.s       fs10, fs7, fs3
                  ori          t0, s8, 1407
                  xori         s9, s2, 808
                  fsqrt.s      ft9, fs5, rdn
                  fsqrt.s      fa4, fa1
                  fmul.s       fa4, fa6, ft11
                  fmv.x.w      s10, ft8
                  slt          a5, a4, t1
                  rem          a5, s6, s5
                  feq.s        t2, ft7, ft10
                  fmv.w.x      fs7, t3
                  flt.s        ra, fs5, fa5
                  xor          t5, s5, t1
                  sltiu        s4, a5, -1660
                  nop
                  sltu         s5, t0, s11
                  add          s6, t0, s7
                  xor          a1, t1, s6
                  rem          a4, s4, s3
                  fmin.s       ft8, fs3, fa4
                  mulhu        sp, s0, a1
                  fsgnj.s      fs1, ft8, ft11
                  or           t4, tp, s4
                  srli         a7, t2, 29
                  mul          a0, t4, s2
                  div          ra, a3, a3
                  fcvt.s.wu    ft1, s2
                  slti         a2, a2, 1357
                  fclass.s     t6, fs3
                  and          t0, t2, s11
                  fdiv.s       fa0, ft6, fs3, rne
                  fcvt.s.w     fs7, a4, rmm
                  mul          a5, t4, a0
                  fsgnjn.s     fs0, fs9, fs8
                  fclass.s     s8, fa6
                  addi         t5, a4, -400
                  rem          s4, ra, s9
                  ori          s1, sp, 1384
                  xori         s10, s2, 1229
                  divu         t5, tp, t6
                  slt          ra, a6, s8
                  sll          t0, gp, t1
                  flt.s        s6, fa1, fs3
                  auipc        s4, 891286
                  mulhu        t1, a3, zero
                  andi         zero, t2, -1886
                  sub          a1, t0, t4
                  addi         t2, a7, 204
                  fsqrt.s      ft11, ft4
                  xori         s8, s4, 2011
                  sub          ra, sp, t2
                  xori         s6, s2, -621
                  fmv.w.x      fa0, t6
                  fclass.s     t4, fs6
                  fclass.s     s6, ft7
                  mulhsu       s8, s8, s0
                  fmv.x.w      tp, ft4
                  mulh         tp, s11, a5
                  fcvt.s.wu    fa0, a2, rup
                  fcvt.s.w     ft1, zero, rup
                  fsgnjn.s     ft3, ft11, fa0
                  rem          s5, a2, t6
                  fmul.s       fs6, ft9, fa3, rne
                  andi         tp, s0, 821
                  srli         gp, t6, 3
                  fmv.w.x      fs1, t1
                  sll          s4, t0, t5
                  sub          t1, s5, s4
                  fmin.s       fa6, fa7, ft6
                  mulhu        a5, t0, s5
                  fdiv.s       fa1, fa6, fa3
                  rem          t1, a6, t1
                  sltu         s3, a1, a2
                  fcvt.wu.s    tp, ft11
                  srl          s10, ra, gp
                  srl          ra, s6, s1
                  fsub.s       fa5, fs6, ft11, rtz
                  sll          s3, s7, t4
                  lui          zero, 611200
                  xori         s4, s1, 1806
                  sltiu        t2, sp, 692
                  remu         t5, s9, t2
                  srl          s6, t3, a4
                  remu         s6, t2, gp
                  fmv.w.x      fs9, s9
                  slli         t5, s0, 13
                  sub          s6, tp, s9
                  sltiu        s6, s6, 1067
                  fmin.s       ft1, ft0, ft4
                  srli         t2, ra, 18
                  slli         a5, gp, 17
                  sltu         s10, gp, ra
                  fcvt.wu.s    s6, ft10, rdn
                  slt          s9, s1, s11
                  slt          s4, sp, t6
                  fdiv.s       ft9, ft7, ft10
                  mul          sp, a2, s0
                  srl          s3, t1, s9
                  sra          t2, s8, s3
                  auipc        a4, 1035593
                  fsgnj.s      fs7, ft0, fa2
                  and          s0, a0, t1
                  fcvt.wu.s    gp, ft7, rmm
                  fle.s        s4, fa7, fa7
                  fcvt.s.w     fa3, s1, rne
                  xor          a3, s1, zero
                  slt          s3, t3, ra
                  fmul.s       fa1, fa0, ft8, rne
                  fsqrt.s      fs7, fa1
                  fsub.s       fs5, fs5, ft4, rdn
                  slli         a7, s9, 6
                  divu         t4, s10, s5
                  fadd.s       fa6, fs11, fs1, rtz
                  fmin.s       fs6, fs10, ft6
                  ori          t1, s11, -431
                  fmv.x.w      s3, fs8
                  sra          s0, s11, a6
                  nop
                  fadd.s       fa2, fs2, fa6
                  fsub.s       fs3, fa6, fa4, rmm
                  rem          a0, s8, tp
                  mulhsu       t4, s4, gp
                  remu         sp, a4, a6
                  fsqrt.s      ft6, ft3, rmm
                  feq.s        s0, fa6, ft7
                  xor          t0, a0, s9
                  addi         t4, a5, -1727
                  srl          a3, s6, s8
                  fle.s        a2, fa2, fs0
                  slli         a7, a0, 12
                  or           s6, s11, s2
                  mulhsu       a7, a5, t0
                  mulhu        s6, s3, a1
                  flt.s        s6, fa7, ft3
                  flt.s        s10, ft7, ft0
                  ori          a3, a3, 487
                  mulhsu       t1, a5, a5
                  nop
                  sra          zero, s9, a5
                  srai         a1, t4, 14
                  lui          s0, 358639
                  fcvt.s.w     ft1, a3
                  fclass.s     zero, fs7
                  nop
                  sra          a7, s2, s4
                  fadd.s       fs8, fs2, ft6
                  fmin.s       fs10, fs6, fa5
                  sub          s3, a4, t2
                  flt.s        a3, fs6, fa4
                  fcvt.wu.s    gp, fa3
                  feq.s        a5, ft0, fs1
                  fsqrt.s      fs9, fs6
                  fclass.s     a1, fa7
                  nop
                  fmin.s       ft4, fa4, ft4
                  addi         a4, s3, -761
                  mulhsu       s4, s7, gp
                  xori         ra, s3, -1594
                  fle.s        a1, fs8, fa3
                  fcvt.wu.s    tp, fs0
                  mul          a7, s5, tp
                  or           a4, s2, gp
                  andi         tp, s7, -1442
                  mulhu        sp, s3, s11
                  sltiu        s8, t6, 1525
                  srai         a2, t0, 6
                  rem          s8, a2, tp
                  fcvt.s.w     fa7, s10, rmm
                  sub          s6, s8, s0
                  fsqrt.s      fs4, fs11, rmm
                  rem          a4, a0, tp
                  divu         a3, a0, s4
                  srli         t1, s9, 4
                  fsgnjx.s     fs4, fa0, fa4
                  fcvt.w.s     t2, fs7, rdn
                  sub          tp, t1, t4
                  sll          sp, sp, s4
                  fsub.s       fs7, fa7, fa0
                  mul          a0, t1, sp
                  nop
                  fdiv.s       ft8, ft8, fs5
                  add          tp, a0, tp
                  slli         s1, a0, 30
                  slli         t2, s3, 19
                  fcvt.w.s     ra, fs9
                  feq.s        a6, ft2, fa6
                  fle.s        gp, fs0, fa0
                  fmv.x.w      s6, ft5
                  divu         a3, a2, s11
                  fle.s        t2, fs11, fs10
                  fsgnj.s      fs4, fs6, ft6
                  mulh         sp, gp, t0
                  xor          tp, s10, ra
                  fadd.s       fa4, ft4, fa1, rne
                  fsgnjn.s     fs10, fa4, fa2
                  flt.s        tp, fa4, fa5
                  mulhu        s6, a6, t0
                  srl          t4, s5, s9
                  andi         s8, a6, -647
                  srai         zero, a7, 0
                  fmul.s       fs6, fa1, ft1, rne
                  mulhsu       a2, a7, s9
                  mul          t0, s4, t3
                  fcvt.wu.s    s9, fs6
                  andi         a4, t5, 845
                  remu         s4, s11, s7
                  fdiv.s       fa4, fs10, fs3, rmm
                  fadd.s       ft7, fs3, fa1, rne
                  sra          s10, t5, s7
                  divu         a0, s5, a2
                  slti         a2, a3, -1106
                  xori         a3, zero, 1780
                  addi         a0, t0, 1930
                  lui          s4, 19659
                  fsub.s       ft3, ft8, fs6, rne
                  flt.s        a7, fa5, fa2
                  slli         s4, s11, 3
                  divu         zero, s11, gp
                  fmin.s       fs10, ft2, ft11
                  fcvt.s.wu    fs8, s2, rdn
                  slli         tp, a1, 28
                  sll          s4, t2, s6
                  fle.s        s6, ft5, fs1
                  divu         t2, t6, s10
                  fsqrt.s      ft7, fa7, rmm
                  sra          a5, s4, ra
                  auipc        t2, 303408
                  ori          s1, s5, -335
                  mulh         t6, sp, s3
                  nop
                  sub          ra, a0, s4
                  div          a7, t2, s3
                  remu         a5, t0, t1
                  fclass.s     a3, fa6
                  xor          a3, t1, s2
                  fmv.x.w      t5, fa6
                  fsgnjx.s     fa1, ft1, ft9
                  sra          zero, tp, a2
                  sra          zero, t5, a1
                  feq.s        tp, fs8, ft4
                  fmv.w.x      fa7, s7
                  fle.s        zero, fs8, ft1
                  feq.s        a0, ft4, ft5
                  fcvt.s.wu    ft11, s6
                  fclass.s     s10, fa7
                  mul          zero, s11, a7
                  srai         sp, gp, 20
                  ori          t6, tp, 1484
                  divu         s9, ra, a0
                  fmv.w.x      fs2, s5
                  mulhu        a5, s11, a4
                  slti         s1, ra, -53
                  slti         s2, s4, -1041
                  fsgnj.s      fa5, ft10, fs4
                  fmin.s       ft1, ft0, fs4
                  fdiv.s       ft0, fs3, fs0
                  mulhsu       t0, ra, t4
                  mulhu        s1, s9, gp
                  mulhu        s1, s9, tp
                  fcvt.s.w     fs5, s11
                  and          t6, a5, t2
                  fmin.s       ft10, ft10, fs9
                  nop
                  fadd.s       ft3, fs0, fa6
                  fcvt.s.wu    fs9, s4
                  add          s5, gp, s5
                  div          zero, s10, t2
                  fsub.s       fs0, ft1, fs0
                  ori          zero, a4, -1936
                  flt.s        a5, ft3, fs6
                  fdiv.s       ft10, fs10, fa4, rne
                  nop
                  flt.s        zero, fs2, fa4
                  sll          zero, t4, t4
                  srl          a4, s9, s2
                  nop
                  slli         t6, a6, 20
                  fsub.s       fs6, ft0, fs11
                  andi         s1, t6, -1179
                  slti         s2, t6, -1532
                  mulhu        t0, s1, a7
                  srai         a2, t2, 11
                  xor          a0, t3, s5
                  sltiu        s6, s11, 1381
                  srli         s3, tp, 7
                  mulh         a6, t2, t3
                  auipc        ra, 550542
                  xori         t6, a0, -742
                  fdiv.s       ft5, fs10, fs4, rne
                  andi         s2, t4, 349
                  srl          s3, s10, s2
                  nop
                  auipc        a3, 804513
                  xor          zero, a7, s9
                  slti         s9, s0, 1332
                  divu         s6, a4, a5
                  ori          t1, t0, 1273
                  flt.s        t6, fs0, fs0
                  srl          s8, s6, a1
                  slli         s1, a7, 3
                  fmv.x.w      s2, fa3
                  fcvt.w.s     t2, fs7
                  lui          s4, 692615
                  fle.s        gp, fs6, ft4
                  fle.s        s8, ft3, fs4
                  fsgnjx.s     ft5, ft8, ft3
                  fsgnj.s      fs9, fs1, fs9
                  mulh         t5, a3, s6
                  mulh         t6, s11, s0
                  srai         gp, t1, 7
                  sltiu        a3, s10, 170
                  fsgnjn.s     fs3, ft5, ft2
                  flt.s        s9, ft4, fa2
                  fmv.x.w      a0, fs9
                  xor          s1, a1, a3
                  srli         t2, a3, 23
                  fmax.s       ft5, fa5, ft3
                  fcvt.s.w     fs7, s5
                  sll          t4, s8, s9
                  and          s10, s9, s0
                  fsgnj.s      ft6, fa3, ft11
                  srl          sp, s11, s10
                  lui          t0, 938329
                  sltu         a4, t5, s2
                  lui          s4, 46253
                  fcvt.w.s     tp, ft4, rmm
                  fmul.s       fa0, fs0, fs7, rtz
                  lui          s8, 369928
                  and          t4, s0, sp
                  div          zero, s1, s2
                  fsgnj.s      fa7, fa7, ft1
                  sltiu        zero, t0, 427
                  fcvt.w.s     s0, fs3, rtz
                  srli         zero, t6, 24
                  fmv.w.x      fs2, ra
                  divu         a5, t3, s6
                  fle.s        a3, fa1, ft5
                  mulhu        a0, s5, s1
                  srli         a4, a3, 30
                  div          s3, a6, s9
                  fmin.s       fs11, fa3, fa4
                  fcvt.wu.s    t6, fa0
                  sll          t4, gp, t6
                  remu         a5, a5, t5
                  lui          a6, 255049
                  mulhsu       a0, s6, a6
                  mulhsu       sp, s6, a0
                  fle.s        a3, ft3, ft1
                  xori         s10, a5, -1344
                  sra          t0, a7, s2
                  or           a0, t4, t2
                  rem          zero, a6, t6
                  xor          a2, gp, a4
                  fmax.s       ft9, ft11, ft1
                  lui          t6, 55689
                  and          s4, s3, tp
                  and          s0, s10, a3
                  srli         t6, a4, 21
                  mulh         a3, tp, t0
                  sltu         a5, a1, zero
                  fsqrt.s      fs10, ft5
                  remu         t5, s3, s2
                  feq.s        t6, fs11, ft0
                  fmul.s       fa6, ft10, fs3
                  fmax.s       fs1, fs7, ft10
                  rem          s0, t1, s3
                  slt          a5, t4, s9
                  andi         gp, s7, 100
                  xori         s10, s11, -1308
                  add          s6, t0, s8
                  sub          s1, s3, a5
                  fclass.s     sp, fs3
                  addi         t4, sp, 2036
                  slt          gp, a1, t4
                  fsub.s       fa6, fs7, fa4
                  mulhsu       t0, sp, s5
                  srli         ra, s5, 0
                  slt          a4, a6, a2
                  and          s4, s8, gp
                  srai         s0, s1, 19
                  or           a1, a2, a1
                  slli         a2, a7, 17
                  fdiv.s       fs4, fa6, ft1
                  divu         s10, a0, a2
                  mulhsu       s5, s5, a7
                  and          a4, s10, s4
                  mulh         s4, t1, gp
                  flt.s        a2, fs1, ft4
                  auipc        s3, 899445
                  sub          s6, t1, a2
                  fcvt.wu.s    a1, fs9
                  xor          a1, s5, t3
                  fmv.w.x      fs8, a4
                  fdiv.s       fa1, ft1, fa3, rtz
                  div          s0, ra, t3
                  fcvt.wu.s    a3, ft1
                  fsqrt.s      ft0, ft10, rtz
                  mulhsu       s4, s11, ra
                  sltu         a2, s4, gp
                  fsgnj.s      ft0, ft5, ft9
                  xor          s5, a3, ra
                  and          s5, t4, t2
                  slt          a6, a1, s5
                  mulhsu       t4, gp, t5
                  fsqrt.s      fa5, fs11, rmm
                  remu         a2, s6, s9
                  fcvt.w.s     s3, ft9
                  lui          a4, 428249
                  fcvt.s.wu    fs0, s10, rup
                  sub          a5, a5, t2
                  sub          s6, a1, t2
                  srl          s2, s1, a7
                  mul          t1, s3, a4
                  fcvt.wu.s    a6, fa1
                  and          ra, t3, s10
                  sll          t0, tp, s8
                  srai         a2, a6, 24
                  srai         a1, s6, 7
                  andi         t4, a5, -582
                  fclass.s     a7, fa5
                  remu         ra, a6, a0
                  xor          t5, t5, s4
                  divu         s2, t3, a6
                  fcvt.w.s     s8, fs11, rup
                  auipc        a0, 567018
                  fsub.s       ft7, fa7, ft1, rup
                  fmv.x.w      gp, fs6
                  auipc        gp, 807061
                  fmv.w.x      ft10, s11
                  slli         s0, t3, 5
                  fsgnj.s      fs6, fs10, fa2
                  fcvt.wu.s    a0, ft1
                  slli         a4, a0, 0
                  fsgnj.s      ft3, fa2, ft8
                  fsgnjx.s     fs4, ft5, fs3
                  ori          s4, t0, -512
                  flt.s        s3, fa6, fs11
                  nop
                  sub          a3, a1, t0
                  fcvt.s.wu    ft6, ra
                  fsgnj.s      ft7, fs5, ft5
                  div          a6, s5, s4
                  add          t4, a4, sp
                  flt.s        a7, ft2, fa6
                  remu         s2, gp, s5
                  rem          tp, s1, a0
                  srl          t4, a0, t1
                  flt.s        t0, fs9, ft7
                  srli         zero, a7, 8
                  fle.s        a1, ft8, ft6
                  auipc        a0, 771384
                  sra          zero, t3, a3
                  fmin.s       fs3, ft10, fa2
                  andi         t1, t5, 316
                  sltiu        s0, t1, 1354
                  fsgnjn.s     fs3, fs6, fa3
                  mulh         gp, s8, s5
                  add          a6, a6, a4
                  and          t2, s8, a6
                  fcvt.w.s     s5, fa6
                  srai         tp, t4, 18
                  add          t1, t4, t5
                  ori          s5, s4, 1314
                  flt.s        a2, ft0, fa2
                  auipc        s0, 529013
                  mul          s1, s6, gp
                  sub          s8, a6, t3
                  fdiv.s       ft2, fs3, fa6, rtz
                  sltu         tp, s11, a4
                  add          a3, t5, sp
                  sub          a3, zero, s5
                  fmul.s       fs6, fs8, fs3, rdn
                  srai         t4, s7, 13
                  fsgnjx.s     fs9, fa2, ft7
                  addi         a6, s3, 559
                  ori          zero, sp, 386
                  fcvt.w.s     s8, ft10
                  remu         a6, zero, a1
                  sra          tp, s7, s7
                  auipc        s9, 360350
                  slli         zero, zero, 26
                  slti         sp, ra, -1166
                  fle.s        s6, fs4, fa2
                  mulhsu       s9, s9, s9
                  fmv.x.w      a1, fs10
                  fsgnjx.s     ft1, ft9, fa7
                  addi         s8, s1, 1
                  or           s8, s10, t5
                  flt.s        a3, fa4, fa7
                  div          zero, s4, t1
                  lui          a3, 362113
                  mulh         a3, a1, a4
                  fadd.s       ft5, fa6, fs0, rmm
                  sll          a5, s7, a1
                  fsgnjn.s     fa5, fa6, ft7
                  sra          t1, zero, s11
                  mul          ra, s8, s9
                  fsgnjx.s     ft7, ft7, fs6
                  fmax.s       ft10, ft4, fs1
                  mulhu        gp, s5, t1
                  divu         a3, s5, sp
                  andi         s1, t3, 1122
                  fsgnj.s      ft1, ft4, fa6
                  flt.s        s9, ft3, ft6
                  divu         zero, tp, s6
                  sltiu        s9, s1, -666
                  ori          s5, s9, 656
                  sltiu        t5, a2, -1610
                  fmv.w.x      ft4, s6
                  fmv.x.w      s2, fa4
                  fmv.x.w      a7, ft1
                  mulhu        s6, t2, t4
                  add          a1, s0, s7
                  sub          t6, a7, s11
                  srli         a3, zero, 30
                  fdiv.s       fs9, fs4, ft8, rdn
                  slt          a6, s10, t2
                  div          s1, t1, t2
                  remu         s6, s1, a1
                  nop
                  sra          s5, s0, a3
                  or           s1, a4, tp
                  fclass.s     s4, fs7
                  andi         tp, s7, 365
                  fsgnjn.s     fa2, fs11, fs8
                  fsqrt.s      fs2, fa0, rmm
                  slt          s4, a4, s5
                  fmin.s       fs6, fa1, fa1
                  lui          sp, 616356
                  mul          gp, t1, a4
                  mulhu        t5, t0, a5
                  srl          s0, t0, s6
                  fcvt.s.wu    fs8, t1, rdn
                  fmv.x.w      s9, fs11
                  rem          s1, t5, a6
                  slti         s4, s1, 1428
                  sub          s8, a3, gp
                  rem          a2, a3, s5
                  fcvt.w.s     a1, ft10, rmm
                  sll          a4, ra, zero
                  addi         gp, s1, -523
                  fmv.w.x      ft11, gp
                  fmax.s       fa5, ft9, ft0
                  sltu         s3, gp, s1
                  fsgnjx.s     fs8, fs3, ft8
                  fcvt.wu.s    s0, fa2
                  fadd.s       fs7, ft6, fs6, rdn
                  fsub.s       fa5, fs2, fa5, rtz
                  xori         t5, a1, -1934
                  slli         s3, a6, 1
                  addi         s2, s9, 1547
                  addi         s4, s8, -734
                  mulhu        s1, s8, a7
                  rem          t4, tp, a6
                  fle.s        t6, ft11, fa1
                  sll          s9, t3, gp
                  xor          s3, s6, a1
                  fsgnj.s      fs9, fa2, ft5
                  fcvt.w.s     zero, fs4, rup
                  fmin.s       ft1, fs4, fa4
                  mulh         t5, a1, tp
                  add          a6, s9, a7
                  divu         s6, s3, t0
                  fsgnj.s      fs10, fs8, fs5
                  lui          s9, 509506
                  mulhsu       s1, s7, s5
                  srli         t5, s5, 27
                  andi         s3, a0, 1790
                  sltu         ra, s0, t3
                  fsqrt.s      fs4, fs0
                  xor          t6, s6, a5
                  xor          s1, s2, s0
                  fcvt.s.wu    fa5, t2, rne
                  and          t1, t6, s6
                  sub          s9, gp, a7
                  sub          gp, a4, a2
                  fsgnj.s      fs6, ft8, fa0
                  remu         t4, t6, t3
                  fmul.s       fs6, ft10, fs3, rmm
                  mul          s10, t6, a6
                  fsgnjn.s     fs11, fa3, fs9
                  fle.s        s10, ft7, fs9
                  srli         s0, t1, 1
                  div          a5, a0, a3
                  rem          t0, s8, a6
                  addi         zero, a5, -862
                  srli         a0, s2, 21
                  fclass.s     t2, fa7
                  fdiv.s       ft1, fs1, fa4, rmm
                  fmv.x.w      a0, ft9
                  fsgnjx.s     fs1, fs6, fs2
                  xori         t6, s4, -1180
                  xor          tp, ra, ra
                  fcvt.w.s     s4, fs7
                  fmv.x.w      s10, ft1
                  srl          t5, ra, s6
                  fsub.s       fs0, ft8, fs1, rtz
                  sub          t2, s8, s5
                  addi         zero, t4, -462
                  div          t6, t5, zero
                  sll          a1, a2, t0
                  auipc        s4, 774740
                  mulhsu       s6, zero, s6
                  andi         a1, a3, -644
                  add          gp, zero, t1
                  mulhu        a6, t5, sp
                  auipc        s6, 734486
                  fclass.s     s3, ft4
                  fsqrt.s      fs3, fs5, rtz
                  slt          s3, s2, t4
                  fsqrt.s      ft8, fs1
                  fsub.s       fa4, ft8, fs7
                  fcvt.s.wu    fs5, a5, rdn
                  sltiu        a6, zero, 1826
                  add          a1, tp, sp
                  fle.s        sp, fs7, ft5
                  xor          gp, zero, s8
                  fcvt.w.s     s1, ft3
                  fmv.w.x      fs5, s11
                  fmv.x.w      t0, ft1
                  mulh         a5, t5, ra
                  and          s9, a1, t6
                  fmv.w.x      fa6, a0
                  feq.s        gp, fa3, ft1
                  mulhsu       s0, ra, t2
                  fcvt.wu.s    s5, ft3, rne
                  mul          t6, gp, s9
                  srai         a0, gp, 9
                  mul          s10, t4, s0
                  fclass.s     a2, fa7
                  fadd.s       fa7, fa7, ft0, rdn
                  and          gp, s3, a3
                  mul          gp, gp, t2
                  remu         gp, a7, a1
                  fmin.s       fs11, fs8, fa7
                  slt          s1, a5, tp
                  fsqrt.s      fa0, fs1, rtz
                  mulhsu       gp, s7, t6
                  srai         a7, zero, 8
                  fsqrt.s      ft3, ft4
                  div          s1, s10, s6
                  slt          s10, s8, s3
                  fsub.s       fs0, ft2, ft1
                  mulh         s9, s9, s9
                  srli         a7, s4, 9
                  fmin.s       fs2, ft3, ft10
                  fmv.w.x      fs6, s1
                  lui          a1, 989476
                  fdiv.s       fa0, ft5, ft9, rdn
                  fclass.s     t6, ft11
                  sub          s6, a1, t2
                  sra          a5, t5, s1
                  fsub.s       fs1, fa7, fs2, rtz
                  div          s9, t0, s1
                  fsgnjx.s     fs8, fs0, fs8
                  xor          a6, t6, t5
                  mulh         gp, a2, s0
                  fsgnj.s      fa7, fs6, fs7
                  nop
                  ori          s4, a3, -2031
                  nop
                  fsub.s       fs2, fs10, fs2, rne
                  fle.s        s0, fs6, fa4
                  xori         ra, a3, 175
                  fcvt.s.wu    ft6, s5
                  sltiu        s3, s11, 1542
                  auipc        a4, 874643
                  sra          t2, a3, s9
                  addi         s6, s5, -1150
                  xor          t1, s6, a7
                  fmv.x.w      s0, ft4
                  mulhsu       s6, a3, t1
                  fmv.x.w      t5, ft11
                  fcvt.wu.s    s4, fs4
                  fmin.s       ft3, fs8, fs0
                  nop
                  fsub.s       ft5, ft8, fa4
                  sltu         sp, s4, a5
                  fsqrt.s      fa3, ft8, rne
                  or           s0, t6, s6
                  fcvt.wu.s    a3, ft11
                  fadd.s       fa1, fa1, fa0
                  sub          s5, s0, s0
                  sra          s5, s0, t2
                  xori         s0, a5, -232
                  fcvt.w.s     sp, fs3, rne
                  fcvt.s.w     fs2, a6
                  xor          tp, a5, s9
                  rem          s1, s3, tp
                  fsgnjn.s     ft1, ft6, fs6
                  and          t2, tp, a2
                  fcvt.w.s     s6, fa5
                  fmul.s       fa6, fs6, ft11
                  lui          a3, 960614
                  slli         a2, t2, 24
                  andi         a4, a4, -1570
                  or           s3, t2, tp
                  feq.s        s10, fs7, ft4
                  fadd.s       fs6, ft5, fs2
                  slt          t2, s6, ra
                  mulh         t6, s2, s8
                  div          a4, tp, sp
                  sltiu        s6, a1, 1781
                  mulh         s8, t5, gp
                  fsgnj.s      fa7, fa7, fa2
                  fcvt.s.w     ft10, t1, rup
                  fcvt.s.w     fs3, s11
                  fcvt.wu.s    a4, fs11, rtz
                  sra          a7, a5, t0
                  sll          sp, s0, s0
                  mul          t4, a7, a0
                  mulhsu       t1, t3, s2
                  mulhu        t5, a1, s8
                  sltiu        sp, t0, 911
                  fcvt.s.wu    ft7, s11, rdn
                  fsub.s       ft9, fs9, ft8
                  srai         s10, s9, 24
                  sll          s5, s3, s3
                  sub          ra, t3, s8
                  fsgnj.s      ft3, fs1, fa4
                  fsgnjn.s     ft8, fs11, fa0
                  mulh         a0, a2, t2
                  fclass.s     zero, fa5
                  fsub.s       ft5, fs3, ft9, rmm
                  andi         s1, t1, -458
                  fcvt.w.s     a5, fs0, rtz
                  fmax.s       ft10, fs11, ft5
                  sra          a1, s7, a7
                  slti         s3, tp, 1847
                  mulhsu       t5, a5, s9
                  mulhsu       a7, s4, s5
                  sub          s10, t3, t2
                  fle.s        s8, fs6, fs6
                  feq.s        a5, ft1, fs8
                  feq.s        s3, fa3, fa2
                  nop
                  fsqrt.s      fs3, fs7, rdn
                  mul          s2, t4, a5
                  div          t4, a2, s6
                  mul          a5, s2, t2
                  or           s5, t3, s7
                  mul          a2, t6, ra
                  sltiu        a1, zero, -577
                  fclass.s     t0, fs3
                  fsgnj.s      ft8, fa0, fa3
                  fmul.s       fs11, fs11, fa7
                  fclass.s     t1, ft0
                  fsgnj.s      ft3, ft3, ft6
                  slti         a4, t2, -683
                  fdiv.s       fs8, fs5, ft0
                  fclass.s     a3, fs6
                  fclass.s     gp, fa2
                  fadd.s       fs11, ft10, ft5
                  and          t0, tp, t4
                  mul          a4, s1, a2
                  fcvt.w.s     a6, fa6
                  fsub.s       fs10, fs6, fs0, rmm
                  flt.s        t0, ft10, ft5
                  mulhsu       t0, t6, a2
                  rem          a0, a1, a0
                  fclass.s     a1, fa7
                  andi         a7, zero, -1348
                  fle.s        s0, fs1, fa7
                  fcvt.s.wu    fs7, t4
                  and          s1, a6, t3
                  sub          s3, t5, s8
                  addi         s8, a1, -276
                  mulhsu       s3, a5, t0
                  fmin.s       ft11, fa5, fa5
                  fcvt.w.s     a2, fa5, rne
                  lui          t5, 554823
                  srli         zero, s3, 17
                  fmv.x.w      t2, fa4
                  srl          t2, s1, a6
                  fsgnj.s      ft9, fs6, fs0
                  srli         s10, t4, 27
                  ori          a0, a7, -1495
                  mulhsu       sp, s10, a5
                  fle.s        s9, fs4, ft4
                  fsub.s       fs2, ft1, fa5
                  fmv.w.x      fs0, s3
                  fle.s        t0, ft7, ft8
                  sltu         s0, gp, t0
                  flt.s        a0, fs4, fs8
                  sub          a0, s1, t6
                  fmin.s       fa7, ft3, ft5
                  slt          zero, a4, s3
                  sub          s6, s9, s11
                  div          a6, tp, gp
                  fclass.s     t2, fs4
                  lui          s8, 1010030
                  fcvt.wu.s    a5, fs10, rtz
                  or           s3, t5, s5
                  flt.s        sp, ft0, ft5
                  remu         a1, t2, s7
                  sll          s1, a2, s7
                  nop
                  sra          s1, s3, zero
                  fcvt.w.s     s1, fs0
                  sub          s5, s9, s4
                  mulhsu       a6, s2, a6
                  sltiu        a7, t0, -1313
                  mulhsu       s4, s8, s9
                  sltiu        t6, ra, -1271
                  srli         s5, a0, 29
                  fcvt.s.w     ft8, gp, rne
                  fcvt.wu.s    a3, fs10, rmm
                  fmax.s       fs4, fs2, ft2
                  fsgnjn.s     fa7, ft11, ft6
                  fsqrt.s      fa6, fs1, rtz
                  sll          s4, t1, ra
                  divu         t0, t6, s2
                  mulhu        s2, sp, t0
                  fmul.s       ft8, ft11, fa6
                  srai         a1, t2, 20
                  fmin.s       fs9, fs8, fs0
                  fsub.s       fs9, ft0, fa5, rdn
                  fclass.s     s1, fa6
                  or           sp, s3, t3
                  nop
                  mulhu        tp, s4, gp
                  fle.s        a5, ft7, ft0
                  fmin.s       ft3, fa4, fs11
                  srai         sp, s1, 6
                  fsub.s       fs10, ft10, ft5, rne
                  auipc        a7, 687669
                  fdiv.s       fa0, fa1, fs1
                  ori          s0, t1, 761
                  add          a2, t5, a2
                  lui          a2, 440976
                  auipc        t2, 993201
                  fadd.s       ft6, fa2, fs5, rup
                  sra          t0, a7, s0
                  mul          s2, a7, s3
                  sll          s2, a2, s2
                  slti         s10, t3, 1036
                  div          s9, a3, t5
                  andi         a6, tp, -477
                  lui          a1, 367931
                  nop
                  andi         ra, t6, -1226
                  lui          t6, 380623
                  fdiv.s       fs10, fs3, fs11
                  mulhsu       a6, a2, a5
                  lui          s6, 133977
                  sltiu        a0, ra, 461
                  mulhsu       zero, a0, zero
                  fle.s        t5, fa2, fs10
                  divu         t6, s3, s3
                  mulhsu       t0, sp, gp
                  sra          t6, a0, sp
                  fsgnj.s      fs3, fs1, ft5
                  fsqrt.s      ft9, ft1
                  fsqrt.s      fs10, ft4, rmm
                  fmax.s       fs3, fa0, fa3
                  mulhsu       a2, tp, a3
                  fcvt.wu.s    a0, ft10, rup
                  fclass.s     s8, ft1
                  sltu         s5, s11, s8
                  xor          s0, gp, a0
                  fsgnjn.s     fa4, fs3, ft4
                  fmax.s       fa3, ft5, ft2
                  sra          t0, tp, a2
                  slt          s4, t2, s6
                  flt.s        ra, fs1, ft8
                  slti         a0, s0, -1670
                  fcvt.s.wu    ft5, a6, rup
                  addi         a1, t6, -535
                  feq.s        s10, fs7, fs5
                  fsub.s       fs10, ft1, fs4, rdn
                  fmv.x.w      s3, fs5
                  xori         zero, s5, 529
                  mulhu        s5, a0, s11
                  mulhu        s2, ra, s8
                  fle.s        a0, ft11, fa6
                  sltiu        sp, a0, 1493
                  fmv.w.x      fs1, a0
                  sub          a5, s1, s1
                  fmv.w.x      ft6, t0
                  nop
                  fcvt.s.w     fa6, s3, rmm
                  fsub.s       fs5, ft6, fa6
                  fmin.s       fa6, ft3, ft5
                  divu         sp, a7, t3
                  sll          a2, zero, t0
                  fadd.s       fs6, ft6, fs7
                  mul          a0, tp, zero
                  nop
                  slti         a7, a6, 527
                  fsgnjx.s     fa5, fs1, ft0
                  divu         sp, s10, ra
                  add          t2, s1, ra
                  fsub.s       fa3, fs7, fa2
                  add          ra, s2, t0
                  fmv.x.w      s4, fa4
                  fsgnj.s      fa2, fs1, ft0
                  srl          a6, t0, s8
                  nop
                  srl          s9, sp, a5
                  nop
                  mulhu        s10, s4, s0
                  fcvt.s.wu    fa2, s3, rtz
                  srli         a1, t3, 5
                  div          s5, t6, t3
                  fmax.s       fa1, fa4, fa5
                  slt          s10, s0, t5
                  sra          t2, a7, a3
                  xor          s5, a1, t6
                  and          s4, a2, s9
                  fdiv.s       fs11, fs2, ft7
                  fdiv.s       ft7, fa3, ft4, rup
                  fsgnjx.s     fa6, fa5, fa7
                  mulhsu       tp, s1, s9
                  fsub.s       fs1, fs4, fs5
                  fmin.s       ft7, fa2, fs0
                  and          t1, tp, t4
                  rem          tp, s11, ra
                  fsub.s       ft5, fs9, fs6
                  slt          a2, tp, t3
                  flt.s        s5, ft7, fa5
                  srli         s2, t1, 19
                  slti         t1, sp, -1795
                  xor          a3, s7, s1
                  fcvt.s.wu    fs0, t5
                  srli         a7, s1, 0
                  sltiu        s10, s6, 1195
                  fle.s        a4, fs7, ft9
                  fcvt.wu.s    a2, fs2, rmm
                  mul          t2, a2, a3
                  srai         s8, s10, 1
                  xori         a5, s8, 245
                  mul          zero, a7, s3
                  xor          gp, a5, t3
                  mul          t2, s6, gp
                  add          zero, a5, s11
                  fclass.s     t1, fa6
                  fmv.x.w      t4, fa4
                  fclass.s     t4, ft10
                  div          a5, a4, a0
                  or           s3, a0, a5
                  lui          zero, 676101
                  flt.s        s0, fa4, fa3
                  fmax.s       fs2, ft6, fa2
                  sll          s1, s7, s7
                  flt.s        t6, fa5, fa6
                  fclass.s     ra, fs8
                  fmv.w.x      ft3, s9
                  fmv.x.w      s8, fs2
                  sra          s4, t4, a3
                  srai         s4, a0, 7
                  fcvt.s.w     fs9, t6
                  fmv.x.w      sp, fa5
                  sltiu        ra, a1, -659
                  fsub.s       fs3, ft6, fs2, rmm
                  fcvt.w.s     a1, fa3, rtz
                  fsqrt.s      ft6, fa1
                  flt.s        t4, ft7, ft0
                  slt          a5, t0, a3
                  fmul.s       ft7, ft0, ft6, rne
                  sra          ra, a3, s11
                  fadd.s       fs2, ft1, fs1
                  xor          s2, s0, t2
                  fmv.w.x      fs3, zero
                  remu         s9, s1, s5
                  and          s5, t3, a7
                  mulh         s4, a5, s6
                  fdiv.s       fs6, ft5, fa7, rdn
                  fmax.s       fs10, fs5, fa5
                  remu         zero, a7, s2
                  xor          s10, t4, t6
                  auipc        a2, 535372
                  srl          t5, a4, ra
                  or           a3, a1, t1
                  rem          a0, s5, ra
                  fmax.s       fa2, ft9, fa1
                  fadd.s       fa0, ft9, fa1, rtz
                  addi         s10, t5, 429
                  fmv.w.x      fs2, t5
                  xori         t0, s10, 430
                  sll          s0, sp, s11
                  mulhu        s4, s5, a0
                  srai         s8, t5, 8
                  fmv.x.w      a1, fs5
                  srli         s9, tp, 21
                  fsgnjn.s     fa6, fs1, fs3
                  fcvt.s.w     fs6, a5, rup
                  lui          a6, 305193
                  nop
                  or           s2, zero, t4
                  fmul.s       fs2, fa5, fs6, rdn
                  slt          a0, a6, a5
                  fsgnj.s      fs6, fa7, ft0
                  fmul.s       ft3, fs6, fa7
                  flt.s        t2, fa6, fs9
                  sub          gp, t3, s1
                  sra          tp, t6, a1
                  ori          s6, a3, -1485
                  fmv.w.x      fs6, s9
                  and          t2, s1, t5
                  fcvt.s.w     fa0, gp
                  fsgnj.s      ft11, fa7, ft0
                  sll          sp, a4, gp
                  fcvt.w.s     a3, fs1, rtz
                  fsub.s       fa6, ft9, fs10, rdn
                  fsqrt.s      ft10, fs0, rup
                  auipc        s2, 488141
                  div          t5, s8, a2
                  srli         a1, s10, 19
                  mulhsu       zero, a7, tp
                  fcvt.s.wu    fs5, a7, rmm
                  fcvt.w.s     a3, fs0, rtz
                  slli         a4, s10, 13
                  slli         t2, t4, 31
                  fcvt.s.wu    ft4, s10
                  fsgnj.s      ft5, fs1, fs0
                  xori         a0, t5, -823
                  fclass.s     s6, ft9
                  or           s10, a5, a6
                  fle.s        a3, fa6, fs1
                  fclass.s     s10, ft0
                  fmax.s       fa6, fs7, ft11
                  mulh         a7, a1, t4
                  fcvt.w.s     sp, fs10, rdn
                  mulh         tp, s11, t2
                  fcvt.w.s     a4, ft11, rtz
                  fcvt.s.w     ft8, s10, rmm
                  fmax.s       fa1, ft10, ft0
                  fsgnjx.s     ft9, fa5, fa0
                  fmax.s       fa2, ft2, ft6
                  div          sp, tp, s5
                  mulhsu       s4, a2, t3
                  mulhsu       s3, t3, a5
                  fle.s        s4, fs1, fs0
                  feq.s        a2, fs2, fs2
                  div          s0, s8, a1
                  fmv.x.w      gp, ft0
                  fmv.w.x      fs9, s4
                  addi         t0, s3, -1054
                  nop
                  mulhu        a7, t1, s8
                  fsub.s       fs8, fs9, fs8
                  feq.s        s1, ft7, fs5
                  addi         s6, s10, 1339
                  mul          t2, s9, s9
                  rem          s5, a6, sp
                  fsqrt.s      ft2, ft8
                  srai         t6, a5, 23
                  srl          s8, a7, gp
                  fsqrt.s      ft7, fs2, rtz
                  nop
                  fcvt.s.wu    ft11, s10
                  sll          a5, a2, a2
                  srai         sp, s1, 11
                  sub          t2, s5, sp
                  fadd.s       ft8, fs7, fa5
                  fcvt.wu.s    tp, fa6
                  ori          s5, a5, 995
                  fmax.s       fa2, fs3, fs6
                  fcvt.wu.s    t0, fa0, rne
                  addi         a1, s4, -325
                  fcvt.w.s     s1, ft0
                  and          s1, a1, gp
                  add          a2, t6, ra
                  fsqrt.s      ft9, fs1
                  slt          a3, t5, s7
                  andi         t0, a5, -1027
                  mulh         t4, a3, t6
                  rem          s0, s9, s10
                  lui          a7, 148488
                  fmul.s       ft0, fs2, ft5
                  slt          a2, t0, gp
                  ori          a3, s4, -925
                  fmv.w.x      fa4, zero
                  fsgnjn.s     fa0, ft1, ft4
                  flt.s        a0, fa3, ft7
                  xori         t1, t5, 1335
                  fsub.s       fa3, ft1, fs6
                  or           s4, s9, a1
                  mulhsu       s2, t3, s2
                  srl          s10, a2, ra
                  remu         s1, s6, tp
                  fle.s        a4, fa4, fa5
                  sll          ra, t4, a6
                  sll          s0, s4, sp
                  auipc        a3, 1026901
                  fmv.x.w      s0, fs9
                  slli         s8, t0, 4
                  fsgnj.s      fs0, ft1, fs10
                  ori          a5, sp, -1849
                  fmin.s       fs9, ft5, fa3
                  fclass.s     a0, ft1
                  sltiu        t1, a3, 97
                  slli         t4, s8, 8
                  ori          a5, s1, 919
                  ori          a4, s5, 1089
                  auipc        t1, 403438
                  fmax.s       fs10, ft0, fa4
                  mulhu        t1, a4, s0
                  fcvt.s.w     ft5, a7, rup
                  feq.s        a1, fs7, ft5
                  lui          t4, 398376
                  fadd.s       fa2, fa6, fs10
                  xor          gp, s3, t6
                  div          s5, s6, a1
                  sra          ra, a7, a0
                  fmax.s       fa2, fs6, fs6
                  fle.s        s9, ft2, fs3
                  lui          s1, 249080
                  fclass.s     a7, ft9
                  slti         gp, zero, -1846
                  flt.s        a5, ft11, fs5
                  sub          s4, s4, s7
                  and          s10, gp, a3
                  fmv.x.w      a1, fa5
                  fcvt.s.wu    fa4, s7, rdn
                  srai         s1, s10, 3
                  and          s1, a5, t0
                  feq.s        zero, ft1, fs3
                  lui          a0, 836260
                  nop
                  sll          t5, gp, tp
                  or           a2, s5, s4
                  fsqrt.s      ft9, fs8, rup
                  slli         s6, sp, 28
                  lui          ra, 17692
                  fcvt.s.w     fa5, sp, rdn
                  fdiv.s       ft7, fs5, ft8
                  xori         a0, a5, -1096
                  slli         s1, a6, 23
                  slti         s3, a4, -1734
                  add          t0, s6, s1
                  fadd.s       ft11, fa7, fa2, rmm
                  sltu         tp, t5, t4
                  addi         a4, s4, -1254
                  sub          a6, t3, tp
                  sll          a7, a7, s2
                  srai         s10, a7, 7
                  mulhu        a7, t0, s4
                  slti         t2, a3, 419
                  fcvt.s.wu    fa1, t1, rmm
                  fcvt.s.w     fs4, s11, rdn
                  sltu         a6, t1, t4
                  divu         sp, zero, s6
                  mulh         t1, s0, gp
                  fclass.s     a0, fs3
                  sltiu        s5, t4, 192
                  fsgnjx.s     fa0, fs6, ft8
                  sll          t1, s1, s11
                  sltu         a1, a5, s2
                  mul          t1, s10, s2
                  andi         a5, a4, 1120
                  fmv.x.w      a4, ft1
                  sra          a2, t4, a4
                  slli         s4, t6, 21
                  fclass.s     s5, fs2
                  addi         t1, s9, 186
                  feq.s        t5, ft8, fs6
                  add          a4, a2, t2
                  mul          t1, s11, t3
                  mul          ra, s9, sp
                  fmax.s       ft1, ft8, fa7
                  fsqrt.s      fs6, fs0, rup
                  sll          sp, t6, a4
                  or           ra, s11, gp
                  addi         a6, s2, -1612
                  mulhu        sp, a1, s5
                  fcvt.w.s     s8, fa1
                  fcvt.wu.s    s2, fs0, rmm
                  xor          s2, s8, a7
                  auipc        s5, 763491
                  rem          s4, s8, s5
                  srli         t6, t1, 20
                  fmv.x.w      sp, fa2
                  xori         s9, s0, -644
                  divu         zero, s0, a3
                  fsgnjn.s     fa2, fa4, ft2
                  fcvt.s.w     fa6, s2, rtz
                  fsub.s       ft5, ft3, ft9, rmm
                  xori         s6, tp, -1764
                  andi         t1, t4, 1590
                  sltu         s0, s4, t1
                  nop
                  fcvt.s.w     fs5, sp, rne
                  andi         t6, t5, -871
                  ori          s6, s7, -560
                  fcvt.s.wu    fa7, s0
                  sltu         s9, s10, s4
                  slt          s0, a2, a7
                  xor          gp, gp, s10
                  mulhu        gp, a4, s3
                  fmv.x.w      s3, ft10
                  xor          a7, s10, zero
                  slti         s5, t0, 1329
                  slt          s9, s9, gp
                  srli         a2, a5, 27
                  fsgnjx.s     ft11, ft3, fs10
                  sll          s8, t1, gp
                  fmv.w.x      fs11, s5
                  and          s6, a3, a2
                  fcvt.wu.s    s2, fs10, rup
                  rem          t2, sp, sp
                  remu         a4, s5, ra
                  srl          ra, a4, s3
                  rem          ra, s1, s9
                  mulhu        s3, sp, s4
                  divu         t0, s10, t1
                  div          t1, s0, s10
                  sltiu        s5, a4, -1118
                  mulh         zero, s3, a1
                  mulhu        a3, a5, s10
                  sltu         s3, s0, t3
                  srli         a7, s7, 14
                  divu         s2, t6, s8
                  add          a6, a6, s2
                  sub          gp, s0, t6
                  fmin.s       ft3, fs1, fs6
                  nop
                  fdiv.s       ft3, ft9, fa0, rup
                  divu         tp, tp, sp
                  add          t5, s10, s10
                  sltiu        s8, gp, -1331
                  sll          s5, zero, s8
                  andi         s10, s2, -1046
                  srli         a7, s3, 8
                  nop
                  ori          a7, s5, -506
                  sltu         s5, t4, s4
                  xor          s6, t6, a7
                  xor          a7, gp, t2
                  fsqrt.s      fs7, fa1
                  fmv.x.w      tp, fa3
                  slt          a2, s1, a1
                  fsgnjn.s     ft5, ft3, fs4
                  and          s8, sp, a0
                  fsqrt.s      fs4, ft8
                  fcvt.wu.s    a6, fs0
                  mulh         ra, t4, a2
                  fcvt.wu.s    s5, ft4
                  fmax.s       ft3, ft8, fs6
                  xori         t5, t3, 1046
                  remu         a1, s9, t5
                  fsgnj.s      fa6, fa1, fs3
                  fsgnjn.s     ft4, fa6, fa4
                  feq.s        s10, ft3, ft6
                  mulh         a3, s4, zero
                  fmin.s       fa5, ft2, ft6
                  fsgnjx.s     fs9, fa2, fa6
                  xor          s6, t1, s2
                  mulhu        ra, a3, a4
                  ori          t2, a0, -1535
                  nop
                  fmv.w.x      fs2, a3
                  feq.s        s3, fs0, fs10
                  divu         s4, s0, s1
                  sub          s8, s1, t4
                  fsqrt.s      fs0, fs9, rmm
                  div          a1, sp, s5
                  fsub.s       ft9, fs1, ft0
                  srli         sp, a0, 2
                  sltiu        s4, s0, -23
                  fsgnj.s      ft10, fs9, ft2
                  slli         s3, s11, 28
                  slt          sp, s2, t6
                  mulh         zero, s2, t4
                  and          a6, a2, s11
                  lui          s6, 287899
                  mul          a3, s3, sp
                  rem          t6, t4, a6
                  fsgnjn.s     fa6, fa0, ft7
                  sll          s2, s6, s7
                  fsgnj.s      fs1, fs6, fs8
                  fmin.s       fs3, fa5, fs6
                  sll          t1, s4, zero
                  fmin.s       fs7, fa7, ft1
                  add          t2, s10, sp
                  mulh         s0, s6, t2
                  xor          t1, t5, s5
                  auipc        a3, 214968
                  mul          t4, s4, s9
                  srli         a1, s7, 17
                  fclass.s     sp, fs3
                  fmul.s       fs6, fs2, fs7, rmm
                  mulhu        s10, s6, a6
                  fsgnj.s      ft3, fs3, ft6
                  fadd.s       fs4, fs7, ft9, rne
                  ori          t4, t2, -329
                  fsub.s       fa5, fa7, ft5
                  divu         s0, s8, s3
                  srl          s8, t0, s10
                  sltu         t5, a4, gp
                  rem          gp, a1, a7
                  mulhu        a0, a6, zero
                  addi         t2, a4, 621
                  fsgnj.s      ft2, fa1, fs5
                  mulh         s1, a4, ra
                  nop
                  slt          s9, s8, t3
                  add          s6, s5, t5
                  fle.s        s8, fs7, fs11
                  fsgnjn.s     fa1, ft1, ft3
                  srl          s5, t4, s7
                  div          gp, a4, a7
                  mulh         a0, t0, s1
                  mulhsu       s4, a7, t3
                  slli         a6, zero, 11
                  remu         s0, a0, s4
                  sltiu        s9, tp, -890
                  or           s0, zero, s7
                  fadd.s       fa3, ft5, fs6
                  fle.s        zero, ft11, fs6
                  fle.s        s6, ft3, ft11
                  fsub.s       fa3, fa3, ft3, rmm
                  fdiv.s       fs0, fs5, fs7, rdn
                  mulhu        tp, a0, a2
                  addi         t2, a3, 470
                  ori          a1, s1, -2044
                  mulh         t5, s7, s11
                  fmin.s       ft10, fs6, fa1
                  fmv.w.x      fs5, a3
                  sra          s8, s5, t1
                  auipc        a7, 1036116
                  lui          s1, 75958
                  flt.s        a7, fs1, fs4
                  fadd.s       ft7, ft11, fa3
                  addi         s4, s6, -727
                  fle.s        s9, ft4, fa1
                  fmv.x.w      s1, ft0
                  auipc        s8, 720083
                  rem          s8, a7, sp
                  mulhsu       a5, t5, s8
                  fle.s        s3, ft7, fs10
                  slti         a3, a7, 264
                  nop
                  fsgnj.s      fa1, fs5, fa1
                  srli         a2, sp, 8
                  fsgnjx.s     fa0, fa2, fs8
                  or           a5, t0, a6
                  fmax.s       fs11, ft7, ft10
                  fmin.s       fs4, ft2, fs10
                  ori          a4, s0, -1975
                  fle.s        tp, ft2, fs10
                  mulhu        a6, s4, a1
                  add          zero, s9, zero
                  fmv.x.w      t5, fs0
                  slti         s10, s10, 1776
                  rem          a6, s1, sp
                  fsgnj.s      fa2, fs7, fa0
                  fdiv.s       ft0, fs9, fs3
                  div          t6, t6, sp
                  sltiu        s3, a0, 283
                  sll          sp, a3, s0
                  fmul.s       fs11, ft9, ft6
                  srli         t0, t6, 10
                  ori          a4, tp, -1291
                  srai         a2, s6, 6
                  fsgnjn.s     ft6, ft9, fs1
                  xori         tp, s10, 766
                  fsgnjn.s     ft7, ft9, fa0
                  add          sp, s3, s3
                  mul          a2, s8, t4
                  fclass.s     s4, fs4
                  mul          sp, tp, s0
                  lui          s5, 636972
                  slt          t0, s3, t4
                  fsgnj.s      fs2, fa1, fs4
                  sltiu        a4, zero, -143
                  mul          s9, s9, a5
                  sub          gp, a3, a2
                  srai         s6, s0, 31
                  sltu         s1, t4, t2
                  feq.s        sp, fs6, fa5
                  slli         tp, s0, 14
                  srai         a7, t5, 9
                  fmax.s       fa6, fa5, fs3
                  mulhsu       t6, ra, s6
                  and          t1, t6, s11
                  fsgnj.s      fs0, fa1, ft11
                  xori         a7, a7, 373
                  div          t5, t4, t4
                  srl          t2, a6, s6
                  srl          zero, a0, a7
                  addi         s0, s2, -1719
                  fmin.s       fs8, fa2, fs0
                  feq.s        s0, ft11, fs5
                  sra          a1, zero, s9
                  xori         s4, s2, -49
                  fmul.s       ft6, fs1, fs10, rdn
                  fsqrt.s      fs11, ft10
                  rem          sp, a1, a2
                  andi         t2, t3, 1782
                  xor          s8, s8, t4
                  xori         zero, t0, -1892
                  mulh         s4, zero, a4
                  sltu         t5, t1, s3
                  sll          t6, t6, gp
                  mulh         t0, t5, t3
                  slt          t6, a2, s4
                  srli         a0, s7, 17
                  addi         t4, s1, 1790
                  feq.s        a5, ft7, ft1
                  or           t1, t1, t1
                  or           gp, s3, s2
                  andi         zero, t0, -1359
                  feq.s        gp, fa3, fs0
                  ori          a0, s10, -334
                  lui          s10, 499166
                  slli         a7, a4, 27
                  srai         a7, s2, 29
                  mul          gp, t4, s8
                  mulhsu       t0, s1, a4
                  fclass.s     s1, fa6
                  fsub.s       fs3, ft9, ft1, rtz
                  xori         a2, s1, 1182
                  mul          s8, s11, s6
                  slli         t6, t1, 21
                  fmv.x.w      s4, ft8
                  slli         zero, s10, 7
                  divu         s10, s4, s5
                  lui          a3, 181203
                  fmax.s       ft3, ft3, ft8
                  fclass.s     t5, fa7
                  nop
                  fsub.s       ft9, fs1, fa3
                  fsub.s       ft11, ft9, fa7
                  mulh         t2, a2, s2
                  srli         s6, tp, 19
                  fsqrt.s      fs0, fa5
                  andi         t1, t5, -178
                  sll          t5, t6, t5
                  auipc        s0, 392111
                  sub          s5, s4, t1
                  fdiv.s       ft4, ft11, fs10, rmm
                  lui          sp, 800838
                  fcvt.s.w     fs11, ra
                  srli         s10, s7, 16
                  srai         s2, gp, 8
                  rem          zero, s0, t0
                  divu         a6, t1, s8
                  fsgnj.s      fa3, fs6, fa7
                  div          t6, a4, a2
                  fmin.s       ft4, fs1, ft2
                  srai         t4, ra, 0
                  fmv.x.w      a5, ft4
                  div          a2, s0, tp
                  fsgnjn.s     ft6, fa1, fs0
                  slt          a6, t1, t3
                  flt.s        a0, ft6, ft1
                  fle.s        t6, fs8, fa0
                  sll          a1, t5, t0
                  mul          s2, s10, t5
                  div          gp, t1, gp
                  fsgnj.s      fs10, ft9, fa4
                  andi         a7, s9, 500
                  fmv.w.x      fs10, s4
                  lui          s9, 464303
                  mul          s8, sp, s11
                  lui          a1, 368997
                  mulh         t6, a5, s6
                  addi         s6, t0, 917
                  fdiv.s       fs1, fa6, fa3
                  slli         t1, t1, 4
                  fsgnjx.s     fs1, fs11, ft3
                  nop
                  sll          a4, t4, s6
                  srai         a0, sp, 13
                  srai         a7, t6, 25
                  slti         s3, a4, -1643
                  fcvt.w.s     s4, fs3
                  fcvt.wu.s    t2, ft5
                  fmax.s       ft11, fa0, fs9
                  add          s4, a3, s6
                  add          s9, gp, s8
                  sltiu        gp, s8, -1629
                  xor          t1, s9, t6
                  fmv.w.x      fs1, s5
                  and          a1, s7, a7
                  sll          gp, s2, a3
                  flt.s        a3, fs9, fa5
                  mulh         s0, s7, s6
                  sll          a0, t2, t4
                  fmin.s       ft9, ft3, fa1
                  fsgnj.s      ft0, fa4, ft10
                  sub          t2, ra, a2
                  fcvt.s.wu    fs8, t2, rne
                  fsgnjn.s     ft5, fs9, ft6
                  fclass.s     t4, fs7
                  fmul.s       ft4, fs8, ft10
                  slli         a1, s10, 19
                  fdiv.s       fa6, fs3, ft6, rup
                  feq.s        t2, fs4, ft0
                  rem          tp, a7, s8
                  ori          a5, t3, 1757
                  fsqrt.s      fs7, fa7
                  addi         s6, s10, 1794
                  srl          a0, a2, t5
                  fsgnj.s      fa3, ft8, ft8
                  mulhsu       a5, t0, gp
                  srli         s4, a3, 22
                  fmv.w.x      ft5, t3
                  fmin.s       fs3, fa2, fa1
                  srl          a0, a1, ra
                  divu         a3, s3, a0
                  sll          t2, a2, a7
                  fsgnjn.s     fs1, fs6, fs4
                  div          gp, s11, gp
                  flt.s        s2, fa1, fs5
                  slli         a7, a7, 0
                  fmul.s       fa7, fs3, fs7
                  fsqrt.s      ft5, fs5
                  or           sp, t3, s0
                  slti         t6, s10, 1146
                  slt          s10, s5, t5
                  rem          t5, s7, a4
                  sltiu        gp, a5, -1383
                  sltiu        s10, t1, -1831
                  fsqrt.s      ft3, fa1, rne
                  fsgnj.s      ft5, fa0, fs9
                  ori          t5, tp, -1641
                  fmv.x.w      s3, fs6
                  fsqrt.s      fs10, ft4
                  fsub.s       fa5, fa1, fa0, rdn
                  fmul.s       ft0, fs6, fs8, rtz
                  or           s5, tp, a7
                  fcvt.wu.s    ra, fs11, rtz
                  flt.s        gp, fs5, ft2
                  rem          s2, t4, s10
                  auipc        sp, 481723
                  andi         s6, ra, 742
                  fmin.s       ft5, ft2, fs9
                  slti         s1, s10, -740
                  fadd.s       fs10, ft6, fs5, rup
                  mul          zero, a5, s4
                  fdiv.s       fa0, ft3, ft2
                  sltu         a3, s7, s9
                  slt          t1, s0, a5
                  srli         sp, s0, 19
                  rem          s4, s0, t1
                  sub          a2, t2, s7
                  divu         t5, zero, t3
                  slli         s9, a5, 14
                  slti         s5, tp, 1884
                  fcvt.s.w     fs8, t5
                  addi         s2, s10, 124
                  sltu         t5, sp, s7
                  fmax.s       fs4, fs2, fs0
                  xori         s5, a2, 40
                  sll          tp, s3, a0
                  mul          s6, t3, t6
                  fadd.s       fs6, ft7, fs10
                  flt.s        s8, ft3, ft5
                  slti         a6, t6, -1032
                  mulh         t2, s9, a0
                  xori         gp, s7, -1505
                  fmax.s       fs6, fa1, ft4
                  fmv.x.w      gp, fs3
                  mulh         gp, a0, zero
                  slt          t2, a0, s11
                  fsub.s       ft1, fa7, fs1
                  fmul.s       ft7, ft11, ft3, rdn
                  fclass.s     s2, fs11
                  fcvt.s.w     ft8, sp
                  fmv.w.x      fa4, s10
                  fclass.s     a1, ft7
                  fle.s        a3, ft7, fa5
                  fdiv.s       ft4, fa1, fs0
                  xor          s6, a2, t6
                  fmin.s       ft5, fs2, fs4
                  or           t6, t0, s4
                  sltiu        a7, s7, -839
                  nop
                  sltiu        a3, ra, -311
                  sll          a0, sp, s3
                  sll          s2, s1, a0
                  slt          s6, t2, s8
                  fsgnjn.s     ft4, fa3, fs6
                  divu         s10, a1, tp
                  srl          s9, s2, s1
                  fle.s        t1, fa1, fa3
                  xor          t6, a2, s10
                  fcvt.s.wu    ft1, s4
                  add          s2, t2, a1
                  fclass.s     t0, fa3
                  div          t2, t2, t5
                  ori          s6, s2, 361
                  remu         s5, a3, s11
                  add          t4, s7, a3
                  rem          a4, a3, ra
                  sra          a2, a0, ra
                  fdiv.s       fs0, fs7, ft3
                  auipc        a5, 802490
                  fclass.s     a7, fs5
                  xori         t6, t5, 1312
                  slt          a4, t6, s2
                  rem          s0, t2, s5
                  fsub.s       fs8, fs3, ft11, rdn
                  fcvt.wu.s    s6, fs6
                  andi         a1, s3, 180
                  slli         a6, s5, 18
                  div          s10, t2, a1
                  addi         s9, s3, -1073
                  andi         t0, t2, 69
                  addi         a7, s5, -1721
                  fsgnjx.s     fa5, fs4, ft9
                  xori         a3, s7, 419
                  fadd.s       fa1, fs4, fs1, rtz
                  feq.s        s10, ft10, ft8
                  fmv.x.w      ra, ft8
                  fcvt.w.s     tp, fs5
                  remu         s10, s9, sp
                  lui          a3, 920885
                  fle.s        t2, ft0, fs9
                  fmax.s       fa5, fs11, ft9
                  fmv.w.x      fs9, s7
                  slt          s8, s2, s7
                  xori         t6, a7, 290
                  sra          t0, a3, a2
                  fmv.x.w      a7, fs6
                  or           a0, t4, s3
                  sltu         s6, ra, s10
                  divu         ra, t6, sp
                  ori          t2, tp, -1461
                  divu         t0, t2, a3
                  sra          tp, s5, s0
                  fadd.s       fa1, ft10, fs2
                  srai         t0, t2, 21
                  xori         t6, t3, 1106
                  fle.s        gp, fs4, fa1
                  srai         a2, t1, 8
                  feq.s        s1, fs7, fs4
                  fcvt.s.wu    ft1, s7, rne
                  fle.s        a0, ft4, fs9
                  fmv.w.x      ft10, ra
                  fcvt.s.wu    fs2, s7
                  slti         t6, s5, -489
                  xor          a6, t4, t1
                  fsgnjn.s     fs6, ft6, fs8
                  rem          s5, tp, gp
                  fsub.s       fs8, fs9, fs11, rne
                  or           s9, s3, a2
                  fsqrt.s      ft3, ft7, rdn
                  flt.s        s0, fs0, ft3
                  slt          a4, a5, s0
                  fcvt.wu.s    t0, fs4
                  slt          zero, t6, a0
                  fsqrt.s      ft6, ft6, rmm
                  and          a4, a0, s10
                  fcvt.w.s     t6, fs0, rtz
                  mul          sp, s9, a2
                  sub          a0, zero, t5
                  fsgnj.s      fa6, fs1, ft3
                  slt          a1, s10, tp
                  sltiu        s0, s11, -782
                  mulhu        t6, a4, a5
                  sltiu        a1, a6, 1890
                  addi         s8, a4, -1626
                  sltiu        tp, ra, 1588
                  addi         s1, a1, 770
                  slti         a0, t3, 1325
                  auipc        s4, 332605
                  add          tp, a0, a0
                  nop
                  mulhsu       ra, s11, s3
                  fmul.s       fa4, ft0, ft11, rmm
                  fclass.s     s0, fs8
                  fsgnj.s      fs1, ft7, fa5
                  andi         a4, s1, 587
                  fmv.x.w      s6, fa3
                  sra          a3, s4, t0
                  fdiv.s       ft1, ft9, fa4, rne
                  addi         a7, s0, 320
                  or           a4, s3, a4
                  slt          tp, a0, s4
                  mulhu        sp, a1, s6
                  sll          a3, a7, a1
                  add          a7, tp, a0
                  lui          s0, 788112
                  fcvt.wu.s    s2, fs4, rdn
                  addi         s2, a2, -450
                  fcvt.s.w     fa4, a1
                  fsgnjx.s     fs7, fa0, ft0
                  fsgnjx.s     fs4, fs11, ft8
                  xor          s6, t1, ra
                  lui          a7, 285101
                  mulh         s9, a3, s7
                  fsub.s       ft2, fs10, fa1
                  srli         t4, s7, 29
                  fle.s        s0, ft5, fs0
                  andi         s10, a1, -2017
                  rem          t2, t1, s11
                  and          tp, s4, a7
                  srli         s6, t4, 18
                  sra          t5, t2, s4
                  sltu         s8, s4, zero
                  fmv.x.w      s3, fs8
                  andi         a7, t2, 156
                  slli         s5, s10, 25
                  remu         t4, s10, a1
                  srli         t0, t1, 25
                  slli         zero, s7, 16
                  sltu         s5, t1, s7
                  fcvt.s.w     fa0, tp, rne
                  or           s0, tp, s9
                  slli         tp, s5, 19
                  auipc        s10, 23240
                  mul          a1, s10, a1
                  fmv.x.w      s10, fa3
                  fmul.s       fs4, fa6, fs4
                  or           a5, t6, t2
                  fcvt.wu.s    t2, ft11
                  fclass.s     s2, fs6
                  fcvt.wu.s    s1, fs6
                  sub          a3, a6, a3
                  lui          a0, 575562
                  or           a4, t5, s9
                  slt          t5, a3, a4
                  ori          zero, zero, 1681
                  srl          t4, s11, a6
                  xor          t4, s4, sp
                  sll          a4, a6, a1
                  and          a7, t5, t6
                  andi         a4, s1, 822
                  lui          s10, 809070
                  srai         s10, t5, 10
                  srai         t4, a4, 4
                  sub          s6, a6, a4
                  addi         t2, s4, 1578
                  fsgnj.s      fa4, fs1, fa7
                  fsgnj.s      fs1, ft3, fs2
                  slti         a2, a6, -391
                  mulhu        a5, t0, s7
                  fcvt.s.wu    fa7, t2
                  fsgnjn.s     fs0, ft7, fa0
                  auipc        a0, 89047
                  slti         a0, s0, -2028
                  xor          s1, t1, s3
                  fadd.s       ft8, fs8, fa6, rdn
                  slli         tp, s10, 0
                  andi         gp, s6, 434
                  srli         s9, zero, 20
                  auipc        tp, 145405
                  lui          s2, 496052
                  fmv.w.x      ft1, t1
                  divu         ra, s9, s6
                  fsqrt.s      fs6, ft8
                  divu         a0, a3, t6
                  xori         s4, s1, -959
                  mulhsu       zero, t3, s8
                  fmin.s       fs8, ft7, ft8
                  slt          s0, a4, s0
                  fsgnjx.s     fs7, fa4, ft11
                  fmin.s       ft3, fa3, fs9
                  slli         s6, t0, 14
                  xori         a4, s9, -138
                  fle.s        a5, fs6, fs10
                  sub          a4, s11, s1
                  fsgnjx.s     fs10, fa4, fs1
                  xor          a5, s9, s10
                  sra          s10, a1, s11
                  fcvt.wu.s    sp, fs3
                  feq.s        tp, fs8, fs3
                  ori          s8, a5, 924
                  mul          a0, t2, t5
                  fle.s        s8, fa1, fa7
                  fmv.w.x      fs10, s1
                  sltiu        s1, s1, 1101
                  add          gp, a1, t0
                  fdiv.s       ft10, fa3, fa1
                  addi         s1, s2, -307
                  fcvt.w.s     ra, fa4, rtz
                  lui          s1, 255280
                  ori          zero, t1, -1575
                  fle.s        s2, ft1, fa3
                  fmax.s       fa0, fs9, fa0
                  fcvt.wu.s    t0, ft6, rmm
                  div          ra, s6, t4
                  xor          a0, s11, sp
                  fmax.s       fs0, fa7, fa4
                  fcvt.w.s     t6, ft7, rmm
                  srai         t2, a7, 23
                  fsgnjx.s     fs7, fa4, fs6
                  mulh         a4, a2, tp
                  slli         t1, a1, 16
                  sll          gp, s0, sp
                  fmul.s       ft8, fs2, fs7, rup
                  andi         s3, ra, 1481
                  fcvt.s.w     fs8, s7, rmm
                  divu         t1, a2, a1
                  and          a4, t1, t6
                  flt.s        a2, fs11, fa5
                  auipc        s1, 179969
                  sltiu        t0, s2, -1065
                  fdiv.s       fs10, fs2, ft6, rne
                  fsub.s       ft3, fs2, fa6, rdn
                  add          gp, s10, zero
                  rem          s5, t1, t4
                  fle.s        s10, fa3, ft3
                  slt          ra, tp, t4
                  sltu         zero, a4, ra
                  sub          a0, t3, s0
                  srli         s9, s9, 19
                  flt.s        gp, fs3, fs11
                  srai         a2, a2, 30
                  fclass.s     zero, fs1
                  feq.s        t4, fa2, ft3
                  lui          a7, 509731
                  add          t4, a3, tp
                  fdiv.s       fs9, fa5, ft6
                  fadd.s       fa0, ft6, fa0
                  srl          a7, ra, s5
                  ori          s4, a0, -557
                  fclass.s     s9, fs6
                  add          s9, s8, t4
                  fcvt.w.s     gp, fs9
                  lui          a3, 589223
                  fclass.s     s10, fs9
                  mul          a3, s10, s5
                  fsgnj.s      ft0, ft10, fs0
                  xor          s5, t6, a1
                  fsgnjn.s     fa1, ft0, fa0
                  slt          t4, t1, a5
                  sltiu        sp, a6, -1807
                  fsgnj.s      fa5, ft1, ft9
                  fmv.x.w      a3, fs0
                  auipc        a4, 934671
                  fadd.s       fa0, ft5, fa7, rne
                  nop
                  remu         s0, a0, zero
                  nop
                  slli         a2, zero, 2
                  fmin.s       fa7, fa4, fa1
                  fmv.w.x      fs11, zero
                  xori         s1, a6, -1961
                  sra          tp, s7, s2
                  fle.s        s5, ft4, fs1
                  rem          t6, sp, t5
                  sltu         a4, a6, a5
                  fsgnjn.s     fa6, fs11, fs6
                  or           a2, a0, t2
                  mulh         t2, sp, s2
                  feq.s        s5, ft9, fs7
                  srai         t1, t4, 23
                  add          a4, a6, t6
                  fsub.s       ft4, fa3, ft2
                  nop
                  fcvt.s.wu    fs9, t6
                  srli         zero, t4, 8
                  fcvt.s.w     fs3, s8
                  mulhsu       s1, a5, a0
                  srl          zero, a5, t2
                  fcvt.s.w     fs7, s11
                  ori          t6, a4, 359
                  nop
                  fcvt.wu.s    s4, fa3, rup
                  fmul.s       fs2, fa5, ft6
                  andi         a7, s10, 825
                  fadd.s       ft8, ft6, fs1
                  xori         a2, t5, 925
                  slli         zero, zero, 1
                  sltiu        t4, s10, 177
                  divu         a6, tp, sp
                  fsqrt.s      fs1, fa7, rup
                  fclass.s     gp, fa1
                  fcvt.wu.s    t0, fs6
                  sll          s3, a7, t2
                  fsgnj.s      fs8, fs7, fs0
                  div          zero, s11, s4
                  and          tp, gp, s6
                  slli         s0, s1, 15
                  andi         t0, t6, 1701
                  fsub.s       fs10, ft4, fa2, rdn
                  fadd.s       ft1, ft6, ft9
                  slti         tp, t3, -1467
                  fcvt.s.w     fs5, ra
                  sll          t6, t2, s6
                  add          a1, s2, a3
                  ori          zero, s1, -1576
                  remu         s0, s8, s3
                  srai         t4, sp, 17
                  sltiu        a2, t4, 570
                  fsgnjn.s     ft10, ft7, ft8
                  fcvt.wu.s    a1, fs8, rmm
                  rem          a0, t4, s10
                  mulh         t0, a2, t6
                  add          s6, s5, a2
                  fcvt.w.s     t0, ft0, rup
                  slli         t0, s3, 3
                  fmv.w.x      ft2, t0
                  lui          a4, 425802
                  fmul.s       fs6, ft9, ft6, rne
                  fle.s        ra, fs4, fa0
                  sltiu        a4, s7, -1259
                  fsqrt.s      ft4, ft8, rne
                  sltu         s3, s3, a5
                  divu         s8, s4, a6
                  ori          s2, a0, -44
                  flt.s        s10, fs9, ft7
                  remu         s2, s2, a5
                  fclass.s     t0, ft3
                  divu         sp, a1, a1
                  and          t5, s11, s9
                  remu         s9, a6, t0
                  xori         s8, t1, 1586
                  sra          s0, s2, tp
                  div          t1, t5, s11
                  fmv.x.w      t5, fa3
                  sltiu        t5, t5, 1257
                  fmv.w.x      fa5, a3
                  xori         s0, a3, 1142
                  andi         ra, gp, 155
                  fsqrt.s      ft8, fa1
                  sub          t5, a0, a2
                  sll          s8, s6, s1
                  sll          t1, tp, s1
                  fmin.s       ft2, fa5, ft4
                  fmul.s       fs11, fa3, ft4
                  mulh         t2, s2, t3
                  div          sp, s6, s1
                  fclass.s     a6, ft9
                  remu         a6, t4, s3
                  fcvt.s.wu    fs4, a2
                  and          s4, a2, t0
                  divu         s9, s11, a7
                  divu         a5, t4, ra
                  sltu         s8, s0, s1
                  rem          s4, s0, a3
                  flt.s        s8, fs8, ft2
                  mul          t0, a7, s3
                  slt          s2, s4, s6
                  feq.s        a0, fa3, ft0
                  xori         a2, t5, -69
                  fle.s        s0, ft7, ft3
                  fmv.x.w      tp, fs0
                  remu         s5, t6, s6
                  fsqrt.s      fa3, fa3
                  fsub.s       fa7, ft3, fs11, rup
                  slt          gp, s5, t6
                  fsgnjn.s     ft5, ft8, fs9
                  sra          ra, t3, a0
                  mulhu        a6, t4, s8
                  slti         t1, s0, 538
                  srl          a6, s8, t0
                  xor          s8, t0, t6
                  srli         zero, s3, 23
                  fsqrt.s      ft8, fs11
                  or           s2, t0, s4
                  ori          s10, s3, -1377
                  fmul.s       ft6, fs5, ft7
                  srli         a4, zero, 14
                  xori         s10, t0, 1449
                  fmin.s       fs4, fa5, fa2
                  fsqrt.s      fa1, ft1, rdn
                  mulhu        t6, s8, s5
                  fmul.s       fa0, fs10, ft4, rup
                  srli         a3, s6, 3
                  fcvt.s.wu    ft10, t5
                  andi         a3, s8, 1366
                  sltu         s10, s10, s10
                  addi         ra, t3, 829
                  add          s9, s9, s7
                  srl          s1, t3, s5
                  fmax.s       ft6, fs4, ft7
                  slt          s1, s11, tp
                  fadd.s       fs11, fa7, fs2
                  and          s4, s2, s7
                  slt          a0, sp, a7
                  fcvt.s.wu    ft4, s6, rtz
                  fsqrt.s      fa4, ft1
                  mul          s3, a7, t1
                  sll          s9, t4, zero
                  ori          a6, t0, -690
                  sll          s2, t2, a5
                  srl          a7, s2, s7
                  mulhsu       a4, a4, s2
                  andi         s5, a0, -1264
                  nop
                  fmul.s       fa7, fa4, fa5
                  sltiu        sp, s2, 1791
                  fcvt.w.s     a2, ft5, rmm
                  fadd.s       ft7, ft5, fs1
                  fsqrt.s      fs6, ft2
                  srli         a1, a4, 19
                  lui          s4, 1025439
                  flt.s        t0, fa7, fs0
                  div          s3, s10, a1
                  fsgnj.s      fa6, ft5, fa2
                  or           zero, s11, a2
                  fmul.s       ft0, ft8, ft5
                  fcvt.wu.s    a2, fs0
                  srli         t1, t2, 25
                  mulhsu       tp, ra, a2
                  nop
                  sltu         s1, t6, s7
                  slti         gp, a3, -1687
                  mul          a0, a4, s3
                  slti         s9, zero, -1829
                  and          sp, s7, s8
                  slti         a0, s0, -826
                  mulhu        gp, a4, s10
                  fdiv.s       ft1, fa2, fs10, rtz
                  mulhu        a3, a3, tp
                  auipc        t6, 864546
                  fsgnj.s      fa4, fs11, fs5
                  xori         sp, t2, 881
                  fclass.s     tp, fs8
                  fmv.x.w      gp, ft5
                  fclass.s     gp, ft6
                  fsgnj.s      fs2, fs8, ft10
                  div          s6, s9, s2
                  fsgnjn.s     fa7, fa3, fs3
                  divu         s5, a5, a6
                  fmul.s       fs8, fs2, fs7, rmm
                  sll          s0, a6, zero
                  lui          s1, 816825
                  fadd.s       fs5, ft10, fs11
                  fclass.s     sp, ft11
                  xori         t0, s4, -2039
                  sll          sp, a2, a3
                  fsgnjx.s     ft5, fa0, ft2
                  ori          tp, s1, -717
                  flt.s        t5, fs4, fs11
                  srli         tp, t2, 9
                  auipc        t1, 327512
                  addi         t6, t6, 960
                  addi         a1, s7, 1940
                  fmv.x.w      s8, ft1
                  fsgnjx.s     fa4, ft0, fs6
                  fmin.s       fs2, fs8, fs5
                  slti         s1, s1, -869
                  fcvt.s.wu    fa7, a0, rtz
                  slti         t5, t3, 579
                  add          s2, a1, ra
                  fcvt.wu.s    sp, ft11, rdn
                  fmv.w.x      ft0, t0
                  flt.s        t4, fa6, fa0
                  add          a6, a6, a4
                  flt.s        t0, ft5, fs0
                  flt.s        a3, fs9, fs11
                  fclass.s     t5, fa5
                  and          a0, a0, t0
                  fle.s        a0, ft8, ft10
                  fsgnj.s      fs6, fs0, ft8
                  fcvt.wu.s    a6, fa2, rdn
                  fsgnjx.s     fa3, ft4, ft4
                  andi         a2, ra, 233
                  mulh         t1, t5, sp
                  srai         t6, a6, 22
                  fmv.x.w      t0, fs3
                  fcvt.w.s     t4, fs2, rmm
                  slli         a7, s9, 29
                  mulhsu       a0, t0, ra
                  mulhu        t2, gp, s9
                  fsqrt.s      fs5, fa3
                  slt          t6, a4, a6
                  fsub.s       fs6, fa1, fa0, rup
                  srli         s4, gp, 27
                  feq.s        a1, fs6, fs11
                  fmin.s       fs6, fa7, fs5
                  fadd.s       ft11, fa2, fa6
                  rem          a1, s4, t1
                  sub          a7, t1, a6
                  remu         s8, s5, gp
                  feq.s        s8, fs1, ft11
                  fmv.w.x      ft7, s8
                  andi         s9, s4, 867
                  xori         t1, s4, -1585
                  fle.s        a1, fa0, ft5
                  nop
                  andi         a3, t4, 1157
                  lui          t1, 928620
                  flt.s        t4, fs8, ft6
                  addi         ra, a1, -1592
                  fcvt.w.s     s6, fa5
                  fadd.s       fa4, fa6, ft3, rup
                  xori         a3, s1, 1288
                  slli         s0, s7, 11
                  fadd.s       fs4, fa6, fs3, rup
                  mul          zero, a7, s7
                  ori          tp, s9, 300
                  and          gp, t5, t1
                  srl          sp, s10, tp
                  mulh         zero, s4, ra
                  andi         s5, s0, 1961
                  sll          sp, t3, s7
                  fdiv.s       fs7, fs8, ft5, rup
                  fcvt.s.wu    fs4, s6
                  fmv.w.x      ft3, s2
                  fadd.s       fs9, ft10, ft6, rup
                  remu         s3, a0, t5
                  div          ra, a4, a0
                  srai         a2, gp, 23
                  sra          s4, s4, s2
                  divu         s5, s7, t2
                  fmin.s       fa3, ft1, ft2
                  srli         a1, s1, 30
                  divu         s10, s1, a3
                  fmul.s       fa7, ft2, fs5, rup
                  fcvt.w.s     sp, ft8, rtz
                  fmin.s       ft6, ft6, ft9
                  ori          s9, a2, -1210
                  fsgnjn.s     fs10, fs4, ft6
                  slli         gp, t4, 24
                  mul          s6, s0, gp
                  mulhu        a4, s4, a6
                  xori         a3, s10, -117
                  sll          zero, t0, s4
                  mulhsu       a3, s10, a2
                  fsgnj.s      fa1, fs11, ft2
                  fclass.s     s6, fs4
                  add          a3, a2, s4
                  remu         s6, a3, tp
                  fcvt.wu.s    s6, ft9
                  slli         t5, s6, 4
                  divu         a3, t5, s11
                  add          a7, t3, s11
                  fsqrt.s      ft6, fs10
                  xor          s6, s5, s6
                  lui          s2, 539207
                  rem          a1, s10, tp
                  mul          s0, s0, s1
                  srli         s1, s4, 27
                  fdiv.s       fa2, ft4, fa1, rne
                  xori         a1, s8, 10
                  xori         a5, t3, 1937
                  xori         sp, t5, 1868
                  auipc        t4, 864616
                  nop
                  addi         sp, s8, -202
                  nop
                  and          t6, s11, ra
                  mulh         t2, s7, s2
                  sra          ra, a1, a7
                  sub          t2, ra, a7
                  andi         t5, a1, -2009
                  sltiu        s2, t5, 1619
                  sra          gp, a6, s8
                  andi         s8, t3, -800
                  fcvt.s.wu    fa5, a6
                  slt          s3, s3, sp
                  sltu         s1, s7, s1
                  or           gp, s8, a1
                  lui          t4, 87034
                  srai         s4, t5, 20
                  sub          s9, a6, s3
                  divu         t4, a5, s0
                  fmin.s       fa1, ft3, ft9
                  fclass.s     a5, fa0
                  slli         s9, s4, 31
                  fcvt.s.wu    fs3, t6
                  remu         s10, s1, t4
                  fmax.s       fs5, fs5, fa6
                  fcvt.s.w     fa4, a6, rtz
                  mulhsu       a3, tp, t4
                  div          a0, t0, s6
                  add          a6, t4, t6
                  slli         s2, sp, 17
                  fcvt.s.w     ft2, s0
                  and          t6, a6, ra
                  addi         a0, tp, -834
                  fdiv.s       fa0, ft0, ft0, rmm
                  divu         a6, s10, s4
                  flt.s        t2, ft3, fs11
                  xori         s10, s10, -1294
                  fcvt.wu.s    s9, ft4
                  xori         s9, a1, 836
                  div          zero, t4, a7
                  flt.s        tp, fs0, fs8
                  fclass.s     sp, ft4
                  mulh         a0, s8, s7
                  lui          a4, 862236
                  or           a4, s4, t6
                  sltu         s3, s5, zero
                  mulh         s10, a6, t1
                  sltiu        zero, t5, 595
                  lui          a6, 83942
                  srai         s4, s8, 20
                  srli         s6, s5, 25
                  mulh         a4, t5, s6
                  fsqrt.s      ft7, fs0
                  andi         s6, s0, -1955
                  sub          gp, t1, s7
                  fsgnj.s      fa2, fa4, fs11
                  fsub.s       ft10, fa5, fs8
                  mulhu        t4, a6, a5
                  srl          t5, s0, s8
                  fsub.s       fa4, ft4, ft0
                  divu         t1, t2, gp
                  lui          zero, 594204
                  sltu         t6, gp, s4
                  sltu         s5, gp, s4
                  srl          t4, s10, ra
                  fcvt.w.s     sp, ft3, rtz
                  fsgnj.s      fa7, fs9, ft1
                  fmv.w.x      fa3, s8
                  srai         a6, s2, 29
                  fmin.s       fs3, fa1, ft3
                  fle.s        a7, ft9, fs1
                  ori          gp, s9, 1848
                  sltu         a0, t4, a7
                  sltu         s3, sp, s10
                  sltu         ra, a1, s11
                  divu         s1, t6, s11
                  or           s0, s6, s2
                  or           t1, s10, s0
                  div          a7, t5, s0
                  slt          a2, t6, s0
                  fadd.s       fs6, fa7, fs5, rdn
                  addi         s10, s6, 311
                  fsgnjx.s     fa0, fs6, fs11
                  fmv.x.w      s8, fa3
                  fsub.s       fa2, ft4, fs10
                  fcvt.wu.s    a1, ft7, rdn
                  fadd.s       fa6, ft8, fa0, rdn
                  mulhu        s8, ra, s6
                  addi         t4, s3, 728
                  sll          s6, zero, a2
                  fcvt.s.w     ft9, t2
                  mulhsu       s4, s1, s5
                  fmin.s       fs1, ft10, fs11
                  addi         a0, s10, 395
                  remu         s8, s8, a2
                  sll          t0, s4, ra
                  add          t1, t6, a7
                  fcvt.wu.s    a3, fa2, rne
                  srl          t1, t0, ra
                  mulhsu       s0, s3, a0
                  divu         s5, a3, t2
                  fsqrt.s      fa1, ft0, rmm
                  fcvt.s.wu    fs4, s0, rne
                  ori          s1, a1, 1218
                  mulhu        s6, tp, s9
                  or           gp, s9, s5
                  ori          s2, a4, -1954
                  fsgnjn.s     ft10, fa4, ft4
                  fcvt.wu.s    s6, ft4, rne
                  fmax.s       fs8, fa0, fs11
                  fmin.s       fa3, fs0, fs6
                  fdiv.s       ft3, ft7, ft11
                  fsqrt.s      ft8, fa5
                  addi         a4, t5, 139
                  fsgnjx.s     fs5, ft5, fa1
                  fcvt.s.w     fa0, t3, rmm
                  sltu         a3, s11, tp
                  mulhsu       s3, t5, s9
                  srai         s1, a0, 12
                  srai         a7, zero, 5
                  fcvt.s.wu    ft8, s8, rmm
                  lui          s1, 672445
                  slli         a1, a0, 0
                  fmul.s       fs8, ft4, fs5
                  srl          s0, s7, a5
                  fcvt.s.w     fs0, ra, rup
                  fcvt.w.s     s4, ft10
                  div          a6, zero, s7
                  fcvt.wu.s    t5, fs2
                  fsqrt.s      fa3, ft3
                  slli         s2, t1, 14
                  and          zero, a3, zero
                  fcvt.w.s     s0, ft2
                  sra          a1, s6, t5
                  sltiu        zero, a1, -1086
                  fmul.s       ft0, fs0, ft2
                  fmv.x.w      a4, fs11
                  lui          s9, 391325
                  nop
                  slli         ra, a5, 12
                  srl          s10, a4, s9
                  fsub.s       fs9, ft9, fs7
                  sll          a7, ra, sp
                  mulhu        gp, a5, t1
                  lui          t2, 477694
                  sltiu        s4, s10, -1391
                  fmax.s       fa6, ft4, fa3
                  fsqrt.s      fa7, fa2
                  fsub.s       fa0, fa3, fs3, rdn
                  sll          t5, s5, a4
                  fdiv.s       fa6, fs5, ft6
                  and          s10, t5, s1
                  ori          s9, s7, -837
                  or           gp, zero, ra
                  remu         a0, t0, t3
                  fadd.s       fs2, fs2, ft4, rmm
                  lui          tp, 505080
                  fcvt.wu.s    t5, ft1
                  sltu         gp, s11, s7
                  remu         t1, t4, s0
                  sltiu        t0, gp, 920
                  fsqrt.s      ft5, ft9
                  andi         a5, tp, 1695
                  andi         sp, s5, -782
                  srli         a6, s10, 25
                  slti         s2, t1, -1397
                  srli         a3, s3, 6
                  mulh         t4, s2, s3
                  or           t0, s7, gp
                  fmul.s       ft7, ft4, fs0
                  fle.s        s0, fa1, fa3
                  fsgnjx.s     fa5, ft9, fa1
                  flt.s        tp, ft2, fa3
                  fmv.w.x      ft1, t5
                  remu         t6, zero, a6
                  fcvt.w.s     a4, ft5
                  fcvt.wu.s    a7, fs8
                  fcvt.s.w     fs8, a7
                  srl          a7, a5, sp
                  srli         t0, s2, 23
                  fcvt.s.w     fs9, sp, rdn
                  slti         tp, gp, -1323
                  fcvt.w.s     s8, fa7
                  slt          s0, ra, ra
                  srli         t1, s7, 8
                  fsgnjn.s     fa5, ft8, ft11
                  lui          a3, 648502
                  xor          t0, zero, s0
                  add          s9, s9, a7
                  fsqrt.s      fs3, fs11
                  addi         t6, s8, 80
                  auipc        s10, 1040259
                  fclass.s     a7, fs2
                  fmin.s       ft11, fa4, ft11
                  nop
                  addi         a0, s1, -983
                  slt          a7, s3, s10
                  fdiv.s       fa5, ft8, ft3
                  srai         a5, s1, 25
                  addi         s9, a1, 1181
                  srai         ra, a5, 0
                  add          gp, s6, a4
                  lui          t6, 23456
                  slti         ra, s6, 882
                  mulh         a6, a5, t5
                  fadd.s       fs0, fs3, fs9
                  fmul.s       ft9, ft11, fa5
                  fcvt.s.w     ft11, t6, rne
                  fsgnjx.s     ft7, fa7, ft8
                  sltiu        a6, a3, -665
                  sll          a6, t1, a7
                  fmul.s       fa4, fs7, fs7
                  div          s8, a0, s3
                  fle.s        s5, fa3, fs0
                  fsub.s       fs0, ft8, ft1, rdn
                  fmv.x.w      s0, fa2
                  ori          t5, s10, 982
                  xori         a1, a3, -1343
                  auipc        a1, 17991
                  divu         ra, s10, s10
                  fmax.s       ft2, ft2, ft0
                  xor          s9, s11, t1
                  sltiu        a5, a4, -38
                  fmin.s       fa3, fa3, fs5
                  fcvt.wu.s    tp, ft7, rup
                  lui          a1, 701203
                  feq.s        a0, ft9, fs4
                  rem          a1, a1, a7
                  sll          gp, t4, s8
                  fadd.s       fa5, fa5, ft10, rup
                  sltu         t6, t1, s4
                  auipc        s0, 510745
                  mul          t4, s7, a2
                  fsgnjx.s     fa1, ft0, fs0
                  slt          s2, tp, ra
                  fcvt.s.w     ft11, ra
                  srai         t5, s7, 26
                  fclass.s     t5, ft11
                  srli         s2, tp, 24
                  fsub.s       fa3, fs4, fs7
                  and          s5, s6, t3
                  fsub.s       fa7, fa7, ft6
                  ori          gp, s8, 1611
                  fmv.w.x      fa4, s7
                  slt          s6, a4, s11
                  sra          gp, zero, a7
                  slli         s2, s7, 23
                  sltiu        t5, s10, -1634
                  feq.s        t2, fa7, ft8
                  fdiv.s       fa1, ft5, ft0
                  mulhu        s6, s11, a1
                  or           a5, s8, a0
                  fsgnjn.s     ft3, ft3, fs11
                  xor          s1, t4, a1
                  andi         tp, t2, 789
                  fmv.w.x      ft10, t2
                  nop
                  fsgnjn.s     ft7, fa2, ft8
                  slli         s0, t1, 23
                  fcvt.wu.s    s9, fa0, rmm
                  divu         s1, a3, t5
                  fmax.s       fs4, ft4, fs10
                  addi         s3, tp, 1304
                  sub          s10, a5, t1
                  mulhsu       s3, s4, t3
                  slli         ra, s11, 25
                  fmv.w.x      fa3, gp
                  fsub.s       fs7, fa5, fa4, rtz
                  slli         s9, gp, 3
                  fmax.s       fs7, fs3, fs8
                  addi         zero, s0, 1509
                  sll          zero, zero, s0
                  sra          zero, s6, s1
                  fsgnj.s      fs9, ft8, ft5
                  nop
                  mul          tp, s0, a5
                  sltu         s10, t5, t0
                  fmv.w.x      fa1, s11
                  andi         s10, s5, -918
                  sltiu        a1, s6, 2031
                  lui          t4, 337092
                  mulh         a7, t1, a7
                  auipc        ra, 894675
                  srl          t1, s7, t4
                  addi         a0, s3, 706
                  and          tp, zero, gp
                  fclass.s     tp, ft10
                  sra          t0, a7, t5
                  div          t1, s1, s0
                  fle.s        a2, fs8, fa2
                  xor          a2, a4, sp
                  fcvt.s.wu    fs0, s6, rup
                  addi         s8, s2, 1374
                  or           a7, s3, t5
                  fdiv.s       ft6, ft8, fa1, rmm
                  fle.s        t4, fa7, ft6
                  srli         s3, a0, 21
                  add          sp, t2, a1
                  srl          t5, ra, t5
                  feq.s        a3, ft9, ft3
                  xori         t2, t2, -1875
                  mulhu        s9, gp, s6
                  nop
                  sltu         s4, s6, s8
                  nop
                  andi         t1, a3, -1488
                  xor          ra, t5, s8
                  auipc        s0, 298024
                  fcvt.s.wu    fs9, a0
                  fcvt.s.w     fs6, tp
                  xor          a1, s11, t2
                  fsqrt.s      fa2, fs11
                  sltiu        a7, t6, -1413
                  fsgnjn.s     fa3, fa1, ft3
                  fcvt.wu.s    ra, ft4
                  auipc        t1, 657169
                  fadd.s       fs5, fs1, fs3
                  nop
                  fmul.s       fa5, ft4, fs1, rdn
                  addi         a4, s8, 49
                  slli         a1, a7, 19
                  rem          s8, sp, a2
                  rem          s3, s3, sp
                  ori          t4, a4, 1058
                  fmax.s       ft5, ft11, fa1
                  rem          ra, s2, a1
                  rem          t1, a2, a4
                  andi         ra, a5, 1004
                  fmax.s       fs1, fs9, fs10
                  div          s2, sp, sp
                  srli         a1, s11, 9
                  add          ra, s3, t6
                  sltiu        tp, s0, -573
                  andi         t6, s1, -1607
                  or           t0, gp, s4
                  fcvt.w.s     s8, fa1
                  fcvt.wu.s    s8, ft6, rtz
                  fcvt.wu.s    zero, fs9
                  feq.s        a1, fs2, fs5
                  sltu         t0, t5, sp
                  slt          a2, sp, a7
                  sra          tp, a7, ra
                  fsqrt.s      fs3, fa3
                  fclass.s     t6, ft9
                  slt          s2, a5, s4
                  fsub.s       fa0, fa4, ft2
                  fsgnjn.s     ft1, ft2, fs8
                  fcvt.s.w     fs7, a7
                  mulh         s8, a3, s0
                  slt          t5, s10, s8
                  mulhsu       a5, s1, t4
                  remu         t0, t3, a7
                  fmax.s       ft11, fs1, fa2
                  srl          gp, a1, t6
                  srli         a0, s8, 1
                  fcvt.wu.s    s6, fs4, rtz
                  andi         sp, a2, 1232
                  fcvt.s.w     fa6, a7
                  srli         a6, a4, 7
                  mulhu        gp, a4, t6
                  fcvt.wu.s    sp, fs4, rne
                  fcvt.s.wu    ft7, sp, rtz
                  srai         s8, s5, 6
                  and          sp, a7, a5
                  sll          sp, s10, sp
                  mulhsu       s3, a3, a7
                  xor          a0, s4, t5
                  fadd.s       ft6, ft0, ft0, rdn
                  fmax.s       fa6, fs0, ft7
                  divu         sp, s10, t5
                  sll          s0, s4, t6
                  sll          t0, a4, sp
                  fmax.s       fs4, fs3, ft3
                  fmul.s       ft2, fs4, fs11
                  srai         t4, ra, 22
                  fmv.x.w      sp, ft9
                  fadd.s       fs8, ft8, ft8
                  slti         a2, s11, 1314
                  sra          gp, s0, sp
                  fle.s        s6, fs11, fa5
                  fle.s        s10, fs10, fa4
                  srai         zero, s9, 29
                  auipc        s9, 82544
                  slti         a5, a3, -299
                  fmv.w.x      ft10, s11
                  rem          s8, a6, a1
                  slt          t1, s3, a2
                  or           t6, s9, a6
                  fcvt.wu.s    t1, fs10, rtz
                  sub          a1, ra, t2
                  andi         a6, tp, 379
                  mulh         t6, s4, s3
                  sra          s2, t5, s8
                  lui          a1, 191576
                  fcvt.s.w     fs3, t5, rtz
                  fmin.s       fs5, ft11, ft3
                  sll          t5, a5, s6
                  addi         t4, t4, -1415
                  sra          gp, a2, a5
                  srli         t5, s9, 0
                  sra          s5, t6, s9
                  sub          a0, s4, a6
                  remu         ra, s0, s4
                  or           s3, s11, s6
                  fsub.s       fa7, fs3, fs7, rtz
                  srli         s6, a2, 30
                  and          s1, a7, s5
                  fmin.s       ft2, fs10, fs1
                  fmul.s       fa7, fs8, ft0
                  fle.s        t4, fs7, fa3
                  sll          s1, s1, s10
                  fcvt.s.w     ft5, s7, rne
                  lui          a5, 79514
                  rem          s3, s11, t2
                  fsgnjx.s     fa6, fs1, ft9
                  mulhsu       ra, s8, s6
                  fcvt.w.s     a4, fa0
                  sll          a6, a3, a7
                  sltu         gp, ra, a1
                  fdiv.s       fa7, fa1, fs4
                  fsub.s       ft4, fs3, fa4
                  fcvt.s.w     fs10, t0, rne
                  fsgnj.s      fs9, fs4, ft10
                  fsgnj.s      fs4, fs3, fs10
                  srli         s5, s1, 18
                  divu         tp, t0, s4
                  fle.s        s9, fs7, fa7
                  nop
                  fmv.w.x      fs7, t2
                  fcvt.w.s     s10, fs8
                  fsgnj.s      ft0, ft4, fa2
                  fsgnj.s      ft4, ft4, fa0
                  fle.s        s2, fa3, fa1
                  slt          ra, sp, s5
                  addi         a0, sp, -1251
                  fadd.s       fa0, fa5, ft9
                  or           s2, s5, s2
                  feq.s        a0, ft10, ft9
                  fsqrt.s      fa5, ft0, rmm
                  sub          t6, a2, zero
                  addi         t6, s8, 1264
                  fmax.s       fs7, fs6, fs8
                  fcvt.wu.s    tp, fa4, rdn
                  fsgnjn.s     fs3, fs4, fa0
                  fsub.s       ft0, fa3, ft5, rup
                  fdiv.s       ft6, ft2, fs8, rup
                  or           s1, s1, sp
                  ori          s1, a5, -1287
                  slti         t1, a4, 483
                  srai         a3, s8, 6
                  add          t4, s8, s11
                  or           zero, s2, zero
                  slti         s0, a2, 1796
                  fadd.s       fa6, fs2, fa2
                  fsqrt.s      ft6, ft7
                  fsqrt.s      fs11, fa0, rmm
                  mulhsu       s4, gp, s0
                  srl          a3, a6, sp
                  fcvt.s.wu    fs9, s0, rtz
                  fle.s        s5, fs5, ft2
                  and          a1, s6, t2
                  fmin.s       fs7, fs0, fs0
                  div          s4, s11, t3
                  mul          a5, s11, s7
                  auipc        t0, 561114
                  fsgnj.s      fa4, ft8, fa6
                  slti         a1, a7, -61
                  fcvt.w.s     a7, fa2, rmm
                  fcvt.w.s     s0, ft0, rtz
                  fcvt.s.w     fa6, s9
                  fsqrt.s      fa1, fa1
                  mulh         s8, a7, s2
                  fcvt.s.w     ft1, s0
                  srl          tp, a0, ra
                  xori         t4, a4, -304
                  mul          a2, a1, a3
                  fmv.x.w      t1, fs0
                  xor          s9, s9, a0
                  fcvt.w.s     t1, fs8
                  fsqrt.s      ft2, fs7
                  slli         a7, s8, 30
                  rem          a1, a2, a5
                  fsgnjx.s     fa0, fs3, fs4
                  fmv.w.x      fa7, tp
                  flt.s        s0, fs7, fs10
                  sra          t5, s4, ra
                  remu         s9, s10, s6
                  srai         s6, s4, 30
                  nop
                  xori         t6, ra, 836
                  addi         a1, a7, -8
                  sub          sp, s0, s4
                  mulhsu       a2, s7, s4
                  div          tp, a3, a4
                  fsgnj.s      fs1, ft11, fs4
                  sub          a3, t2, s8
                  rem          a1, a1, a6
                  fsgnjx.s     fs3, fs1, fa0
                  mulhu        s5, t4, t2
                  andi         s4, s5, -379
                  flt.s        a7, ft7, ft3
                  fmul.s       ft10, fa6, ft3
                  mulh         s6, s6, a4
                  flt.s        a4, ft7, ft7
                  slti         a7, a2, 658
                  mulhu        gp, a0, t2
                  mul          t0, a4, tp
                  slti         t1, gp, 989
                  divu         s2, s7, s6
                  nop
                  slt          a4, a3, s6
                  fclass.s     tp, fs0
                  xori         s3, s0, 551
                  sltiu        gp, t1, 1361
                  rem          gp, s5, ra
                  nop
                  mulhu        s5, a3, gp
                  srl          t0, ra, t0
                  sra          t4, s9, a6
                  slti         ra, zero, 1619
                  lui          s10, 407461
                  mul          ra, a7, t0
                  sll          s5, tp, a6
                  fdiv.s       fa1, ft5, fs10
                  fmv.w.x      ft7, s1
                  fmv.x.w      a6, fs0
                  fsub.s       fs7, fs10, fs10
                  fclass.s     t0, fs0
                  slt          s6, t1, s7
                  fsub.s       ft5, fs11, ft8
                  fclass.s     s8, ft5
                  slti         zero, s3, 622
                  sra          s4, a5, tp
                  sltu         s10, s6, s5
                  remu         s2, a0, s8
                  fdiv.s       fs2, fa1, fs2, rtz
                  fle.s        s5, fs11, ft11
                  fcvt.s.wu    ft7, tp
                  fcvt.wu.s    tp, fs7, rne
                  fmul.s       fs3, ft11, ft3, rmm
                  fmax.s       ft7, ft3, fa6
                  mul          t4, t4, s8
                  slti         s10, a0, 478
                  fsgnjn.s     fs1, fa2, fa5
                  divu         s5, s0, s3
                  fsqrt.s      ft3, fs0, rne
                  fmin.s       fs10, fs0, fs3
                  div          s8, a4, a1
                  fsub.s       ft4, fa3, fs5
                  slti         t5, ra, 210
                  fclass.s     a6, fa6
                  fsqrt.s      ft11, ft0
                  mulhsu       a3, gp, a1
                  sltiu        s1, s8, 16
                  sll          a5, t3, s9
                  sltu         a4, s10, a5
                  xori         t1, t4, 1544
                  fcvt.s.wu    ft1, a0
                  auipc        sp, 648131
                  fsub.s       ft3, ft6, ft7, rmm
                  ori          a1, a0, -1980
                  srai         s3, a2, 27
                  fsgnjn.s     fa4, fa0, fa3
                  sltu         a5, zero, sp
                  fle.s        s4, ft2, ft5
                  andi         a4, t1, 309
                  xori         t2, s11, -714
                  auipc        s8, 856019
                  srli         s6, s6, 5
                  or           a1, a5, t2
                  fmax.s       fa7, ft5, fs0
                  fmin.s       fa0, fs3, fa3
                  andi         tp, s3, 1145
                  mulhu        a5, a3, a4
                  fsgnj.s      fs5, fs11, fa4
                  fmv.w.x      fs5, s4
                  addi         a5, a2, -462
                  fmax.s       fa6, fa4, ft3
                  fmax.s       fs11, fa4, fa3
                  slt          t1, a4, a0
                  mul          s3, t3, a3
                  fsgnjn.s     fa3, fs5, fs6
                  srli         ra, gp, 16
                  fmax.s       fa0, fs4, ft7
                  flt.s        ra, fs3, fs9
                  fsgnj.s      ft7, ft2, ft9
                  fsgnjx.s     ft1, ft6, fa6
                  fmax.s       fa6, ft4, fs6
                  addi         s10, t4, 1951
                  fsgnj.s      fs10, ft3, fs2
                  fcvt.wu.s    t4, fs10
                  fcvt.wu.s    a5, fa6, rmm
                  fcvt.w.s     t6, fa6, rup
                  fcvt.s.wu    fa1, s8
                  sub          t1, t1, s0
                  slli         s9, tp, 5
                  and          ra, s8, a1
                  mul          s1, t2, s9
                  fsub.s       fa2, ft6, fa0, rne
                  auipc        sp, 266576
                  feq.s        s5, fs3, ft8
                  fmv.w.x      fs0, s4
                  fsgnjn.s     ft11, fs5, ft1
                  fmul.s       ft9, fs8, fs2, rtz
                  fsgnjx.s     fa3, ft5, ft10
                  sra          a6, s10, a2
                  fadd.s       fa7, fs1, fs8
                  fsgnjx.s     fa4, fs3, fa5
                  sub          s1, s8, s8
                  slti         s2, gp, -1266
                  sub          s8, zero, s8
                  feq.s        a0, fs0, ft9
                  div          a0, s7, a0
                  fsgnj.s      ft1, ft3, fs9
                  slli         s1, s2, 1
                  sll          ra, s3, ra
                  srli         s10, s0, 14
                  rem          t1, s4, a4
                  mulh         s4, a1, s2
                  fle.s        a1, fs3, ft0
                  fmul.s       fa6, fa1, ft10
                  mulhu        a3, a2, s7
                  fcvt.s.wu    ft10, s11, rdn
                  mulhsu       t5, a7, s3
                  sltu         s9, t0, t4
                  mulhu        s9, sp, a0
                  remu         a2, s5, zero
                  fmin.s       fs2, ft9, fa2
                  fsgnjn.s     fa0, fs5, fa7
                  fmax.s       fa0, fs2, fa7
                  fadd.s       fa6, fa2, fs1, rtz
                  fsgnj.s      fs8, fa5, fs3
                  fsqrt.s      fa1, ft1, rtz
                  mulh         ra, tp, t4
                  fsub.s       fs5, fs11, fa2
                  nop
                  slli         s1, t4, 10
                  srli         zero, s2, 7
                  mulhu        a6, a5, gp
                  fmin.s       fs8, ft4, ft1
                  feq.s        a1, fa5, fs10
                  xori         s3, a6, 1084
                  remu         t0, zero, t6
                  xor          s1, t1, s7
                  divu         s3, zero, a7
                  xor          s5, a5, t6
                  sll          s10, t0, t1
                  ori          a6, ra, -1742
                  slti         s3, a2, -1535
                  sltu         sp, t5, t0
                  fsub.s       ft4, ft8, ft3
                  nop
                  srli         s6, a1, 28
                  and          s3, t3, t2
                  srli         a5, ra, 15
                  fcvt.s.wu    fa5, t2
                  slti         t0, s8, -289
                  fcvt.w.s     zero, fs7, rdn
                  mul          a0, gp, s5
                  slli         t0, t5, 24
                  fsqrt.s      fa0, ft2, rdn
                  fsqrt.s      fs0, fs4, rup
                  mulh         a2, sp, a1
                  fsub.s       ft7, ft11, ft11, rup
                  srl          t1, s10, ra
                  fmv.x.w      gp, fs9
                  mulhu        zero, tp, s11
                  fadd.s       fa1, ft10, fa2, rup
                  auipc        t0, 758516
                  srl          sp, s0, s2
                  auipc        ra, 811897
                  srai         s1, s0, 10
                  slli         a1, t6, 29
                  srli         ra, s8, 4
                  slli         t2, a7, 0
                  fsgnjx.s     ft8, fs4, ft4
                  nop
                  fdiv.s       ft2, fs8, fs5
                  fle.s        a5, fs1, fs6
                  fmin.s       ft5, ft5, ft8
                  fdiv.s       fa0, ft4, fs11, rne
                  mulhu        s4, a0, s2
                  mul          a1, a2, a2
                  and          t2, s4, s3
                  sltiu        zero, s10, -1661
                  fmax.s       fs10, ft1, fs7
                  srai         t4, a4, 10
                  fle.s        t4, ft11, fa3
                  slli         gp, a2, 12
                  or           t0, t3, a5
                  fle.s        s3, fs0, ft4
                  fcvt.s.w     ft9, s2, rdn
                  fle.s        t2, fa5, fs3
                  divu         s8, a3, t4
                  fadd.s       fa2, ft2, fs8, rmm
                  slt          t0, s4, a7
                  lui          a7, 514600
                  fmin.s       ft1, fs10, fa0
                  sub          t0, ra, s2
                  sub          s10, a0, a1
                  fsub.s       fs6, fa5, ft9
                  fmax.s       ft10, ft9, ft6
                  fcvt.wu.s    sp, ft10
                  remu         t1, a4, s10
                  slli         a3, a7, 25
                  sra          t4, t5, t6
                  flt.s        a7, fs4, ft1
                  div          s6, s5, a5
                  fcvt.s.w     ft8, a2
                  xor          t4, t2, sp
                  srli         s8, t2, 12
                  fcvt.s.wu    fa0, s1
                  fclass.s     t0, fa1
                  srli         a7, a3, 31
                  ori          t5, s1, -36
                  fsgnjx.s     fs1, ft1, fa7
                  sltu         s10, s7, zero
                  divu         s8, s8, tp
                  sltu         s6, s9, sp
                  fmv.w.x      fa4, ra
                  addi         a0, s2, 1525
                  sub          a1, s0, t5
                  divu         t0, t1, s10
                  ori          a7, ra, -1375
                  fsgnjn.s     fa1, fa1, ft5
                  sub          a0, s1, a6
                  lui          s6, 516176
                  andi         a1, tp, 1223
                  fcvt.w.s     s2, ft2
                  andi         a1, s0, -173
                  lui          a7, 996611
                  addi         s2, a4, 1280
                  slti         t0, s1, 1185
                  fmin.s       ft5, fs6, ft9
                  fadd.s       ft2, fa1, fa0
                  srli         ra, ra, 21
                  xor          a1, a1, t3
                  mulhu        s10, a5, s11
                  fmin.s       fa1, ft5, fa0
                  fle.s        t2, fs0, ft0
                  fmax.s       fa6, ft10, ft7
                  sub          s2, t4, s1
                  srai         s6, a3, 3
                  mulhu        t2, s8, t5
                  sub          a6, t6, a5
                  slti         s9, zero, -756
                  fmv.x.w      s10, ft11
                  ori          a0, t5, -1843
                  fadd.s       ft8, ft0, fs2, rup
                  srl          a0, a4, t0
                  or           t4, t5, t0
                  fsgnjx.s     ft3, ft6, fa0
                  or           s4, t0, s3
                  sra          t4, s10, t0
                  fcvt.wu.s    s0, ft6
                  fcvt.w.s     t4, ft1, rtz
                  fadd.s       fs8, fa4, fs10, rne
                  ori          s8, a7, 1811
                  srai         a0, s11, 9
                  remu         a3, t1, t6
                  fmv.w.x      ft5, t0
                  and          s5, t6, s6
                  fcvt.w.s     s9, ft8, rne
                  and          t2, tp, gp
                  srli         s2, a1, 4
                  fsqrt.s      ft1, fs0
                  div          s5, s1, s0
                  sra          a7, s0, a0
                  slli         t4, s2, 20
                  divu         s3, a1, ra
                  fsgnj.s      fs2, fa2, fs7
                  fsub.s       fs5, ft11, fa1, rdn
                  fsgnjx.s     fa4, ft0, ft10
                  sltu         s4, s6, a0
                  fle.s        a6, fs1, ft1
                  fadd.s       fs11, ft9, fa4, rne
                  srli         a2, s0, 18
                  slt          a0, s2, t6
                  la x27, test_done
                  jalr x0, x27, 0
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
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_2:
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_3:
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_4:
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_5:
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_6:
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_7:
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_8:
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_9:
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_10:
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_11:
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_12:
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_13:
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_14:
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_15:
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x342 # MCAUSE
                  srli x24, x24, 0x1f
                  beqz x24, 1f
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

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
                  addi x28, x28, -4
                  sw  x23, (x28)
                  add x23, x28, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x28, x23, zero
                  csrr x24, 0x341 # MEPC
                  csrr x24, 0x342 # MCAUSE
                  li x13, 0x3 # BREAKPOINT
                  beq x24, x13, ebreak_handler
                  li x13, 0x8 # ECALL_UMODE
                  beq x24, x13, ecall_handler
                  li x13, 0x9 # ECALL_SMODE
                  beq x24, x13, ecall_handler
                  li x13, 0xb # ECALL_MMODE
                  beq x24, x13, ecall_handler
                  li x13, 0x1
                  beq x24, x13, instr_fault_handler
                  li x13, 0x5
                  beq x24, x13, load_fault_handler
                  li x13, 0x7
                  beq x24, x13, store_fault_handler
                  li x13, 0xc
                  beq x24, x13, pt_fault_handler
                  li x13, 0xd
                  beq x24, x13, pt_fault_handler
                  li x13, 0xf
                  beq x24, x13, pt_fault_handler
                  li x13, 0x2 # ILLEGAL_INSTRUCTION
                  beq x24, x13, illegal_instr_handler
                  csrr x13, 0x343 # MTVAL
                  1: la x27, test_done
                  jalr x1, x27, 0

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
                  la x27, write_tohost
                  jalr x0, x27, 0

instr_fault_handler:
                  add x23, x28, zero
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 128
                  add x28, x23, zero
                  lw  x23, (x28)
                  addi x28, x28, 4
                  mret

load_fault_handler:
                  add x23, x28, zero
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 128
                  add x28, x23, zero
                  lw  x23, (x28)
                  addi x28, x28, 4
                  mret

store_fault_handler:
                  add x23, x28, zero
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 128
                  add x28, x23, zero
                  lw  x23, (x28)
                  addi x28, x28, 4
                  mret

ebreak_handler:   
                  csrr  x24, 0x341
                  addi  x24, x24, 4
                  csrw  0x341, x24
                  add x23, x28, zero
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 128
                  add x28, x23, zero
                  lw  x23, (x28)
                  addi x28, x28, 4
                  mret

illegal_instr_handler:
                  csrr  x24, 0x341
                  addi  x24, x24, 4
                  csrw  0x341, x24
                  add x23, x28, zero
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 128
                  add x28, x23, zero
                  lw  x23, (x28)
                  addi x28, x28, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x24, 0x300 # MSTATUS;
                  csrr  x24, 0x304 # MIE;
                  csrr  x24, 0x344 # MIP;
                  csrrc x24, 0x344, x24 # MIP;
                  add x23, x28, zero
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 128
                  add x28, x23, zero
                  lw  x23, (x28)
                  addi x28, x28, 4
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
