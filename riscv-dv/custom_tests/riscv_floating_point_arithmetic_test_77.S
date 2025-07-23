.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x24, h0_start
jalr x0, x24, 0
h0_start:
                  li x30, 0x40001120
                  csrw 0x301, x30
kernel_sp:        
                  la x13, kernel_stack_end

trap_vec_init:    
                  la x30, mtvec_handler
                  ori x30, x30, 0
                  csrw 0x305, x30 # MTVEC

mepc_setup:       
                  la x30, init
                  csrw 0x341, x30

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x30, 0x3800
                  csrw 0x300, x30 # MSTATUS
                  li x30, 0x0
                  csrw 0x304, x30 # MIE
                  mret
init:             
                  li x30, 2147483648
                  fmv.w.x f0, x30
                  li x30, 2139095040
                  fmv.w.x f1, x30
                  li x30, 2143289344
                  fmv.w.x f2, x30
                  li x30, 2139095039
                  fmv.w.x f3, x30
                  li x30, 2151752068
                  fmv.w.x f4, x30
                  li x30, 6042089
                  fmv.w.x f5, x30
                  li x30, 2147483648
                  fmv.w.x f6, x30
                  li x30, 2143289344
                  fmv.w.x f7, x30
                  li x30, 4286578687
                  fmv.w.x f8, x30
                  li x30, 2139095041
                  fmv.w.x f9, x30
                  li x30, 2143289344
                  fmv.w.x f10, x30
                  li x30, 2147483648
                  fmv.w.x f11, x30
                  li x30, 2155297611
                  fmv.w.x f12, x30
                  li x30, 4286578688
                  fmv.w.x f13, x30
                  li x30, 0
                  fmv.w.x f14, x30
                  li x30, 2150731247
                  fmv.w.x f15, x30
                  li x30, 4286578687
                  fmv.w.x f16, x30
                  li x30, 1132137
                  fmv.w.x f17, x30
                  li x30, 1679414438
                  fmv.w.x f18, x30
                  li x30, 2139095040
                  fmv.w.x f19, x30
                  li x30, 2143289344
                  fmv.w.x f20, x30
                  li x30, 0
                  fmv.w.x f21, x30
                  li x30, 4286578687
                  fmv.w.x f22, x30
                  li x30, 2147483648
                  fmv.w.x f23, x30
                  li x30, 2139095039
                  fmv.w.x f24, x30
                  li x30, 3623467
                  fmv.w.x f25, x30
                  li x30, 2147483648
                  fmv.w.x f26, x30
                  li x30, 2147483648
                  fmv.w.x f27, x30
                  li x30, 0
                  fmv.w.x f28, x30
                  li x30, 0
                  fmv.w.x f29, x30
                  li x30, 2139095039
                  fmv.w.x f30, x30
                  li x30, 2139095041
                  fmv.w.x f31, x30
                  fsrmi 3
                  li x0, 0x80000000
                  li x1, 0x80000000
                  li x2, 0x80000000
                  li x3, 0xf6d189fa
                  li x4, 0x80000000
                  li x5, 0x7160c67f
                  li x6, 0x9
                  li x7, 0x0
                  li x8, 0xc
                  li x9, 0x80000000
                  li x11, 0x80000000
                  li x12, 0x80000000
                  li x14, 0x0
                  li x15, 0x45ff4bd7
                  li x16, 0x4e31de3d
                  li x17, 0x0
                  li x18, 0x80000000
                  li x19, 0x80000000
                  li x20, 0x6
                  li x21, 0x92854a3f
                  li x22, 0x0
                  li x23, 0x28c133f0
                  li x24, 0x3
                  li x25, 0x0
                  li x26, 0xf741096f
                  li x27, 0x0
                  li x28, 0x80000000
                  li x29, 0xeb3841c7
                  li x30, 0x80000000
                  li x31, 0x80000000
                  la x10, user_stack_end
main:             mul          tp, a3, a2
                  ori          zero, tp, 1510
                  mul          s6, t4, a2
                  rem          gp, s11, a2
                  sub          zero, t6, ra
                  fle.s        s4, ft8, ft11
                  sra          sp, s1, tp
                  slli         a4, zero, 8
	fcvt.s.wu	ft9, a6, rne
                  fcvt.s.w     fs0, s1, rtz
                  xor          t1, a4, s7
                  xori         tp, a6, -1656
                  mulhsu       a5, tp, a7
                  mul          a4, s3, s1
                  sll          t2, ra, a3
                  mulhsu       ra, a4, t0
                  mulh         a7, a6, a1
                  fle.s        t3, fa4, fs9
                  fcvt.wu.s    t4, ft4, rtz
                  auipc        s9, 983927
                  ori          a7, a7, 1342
                  div          t0, s1, a3
                  flt.s        s9, ft7, ft4
                  and          t1, a5, a2
                  srli         t4, t6, 1
                  feq.s        t0, fs9, fs9
                  add          gp, t6, a6
                  fmv.x.w      s4, ft9
                  srai         s9, s8, 6
                  mulh         t4, a7, s6
	fcvt.s.wu	fs10, a2, rne
                  andi         s4, s1, -235
                  and          a4, s6, t1
                  lui          gp, 229084
                  andi         ra, s10, -617
                  divu         a7, a2, a6
                  rem          sp, s9, t3
                  mulh         sp, t0, s9
                  mulhu        t0, gp, a7
                  slt          tp, t4, a5
                  mulhsu       sp, a2, s9
                  slli         s10, s3, 4
                  mul          s2, sp, s5
                  fclass.s     a7, ft9
                  fsgnjx.s     fa3, fa5, ft4
	fcvt.w.s	a5, ft0, rne
                  fsgnjx.s     fs5, ft6, ft1
                  sub          s0, t5, a3
                  sltu         tp, t1, a6
                  fsgnjn.s     ft9, fs4, fs3
                  fmax.s       fs10, fa3, ft3
                  fsub.s       fs7, fs1, fa5, rup
                  srli         t3, t4, 17
                  or           t6, s4, a7
                  xori         t4, s1, -319
                  sll          ra, t3, t5
                  fcvt.s.w     fa5, gp, rne
                  slti         s9, t6, 797
                  or           s7, a5, t3
                  mul          s4, zero, s9
                  fcvt.w.s     tp, fs5, rne
                  srai         s5, tp, 14
                  auipc        s6, 15158
                  andi         s4, gp, -672
                  auipc        zero, 557778
	fcvt.wu.s	a4, fs5, rne
                  fmin.s       fa3, fa1, fs11
                  fmax.s       fa2, fs2, ft5
                  or           s2, tp, t0
	fcvt.w.s	sp, ft6, rne
                  auipc        zero, 839704
	fcvt.wu.s	t6, ft11, rne
                  nop
                  lui          s0, 388636
	fcvt.s.wu	fs6, a5, rne
                  sll          s10, a3, t6
                  feq.s        s4, fa7, fs0
                  fmin.s       fs3, ft7, fs8
	fcvt.s.w	fa5, zero, rne
                  mulh         t0, s0, s2
                  fle.s        t2, ft2, fs6
                  xori         ra, s10, 1908
                  fmax.s       fa3, fa4, fs7
                  sra          s6, a1, s2
                  sltu         t4, tp, zero
                  sltu         ra, a5, sp
                  flt.s        t3, ft0, fs8
                  fsgnjn.s     fa1, ft1, ft8
                  srli         a6, tp, 25
                  sub          s2, s4, zero
                  feq.s        a2, ft5, fs3
                  slli         s4, s8, 11
                  mul          s1, ra, t2
                  fadd.s       ft9, fs0, ft4, rmm
                  srl          s4, a7, t5
                  rem          a7, t6, s7
                  and          s7, a7, s6
                  divu         s5, s10, s10
                  remu         gp, tp, t6
                  fclass.s     a4, fa3
                  remu         s10, s11, t6
                  fle.s        s2, ft11, ft2
                  fle.s        a6, fs10, fs8
                  divu         s6, s0, s11
                  and          s9, t1, s2
	fcvt.w.s	a5, fs6, rne
                  div          zero, s5, t1
                  srli         gp, a7, 17
                  divu         a4, a6, s7
                  sll          a5, s3, s8
                  fsub.s       fs1, fa5, fs11, rmm
                  slli         t5, gp, 18
                  or           a5, zero, sp
                  sra          tp, t0, t5
                  fle.s        s4, ft4, fa1
                  mulhu        tp, zero, a0
	fadd.s	fa0, fa5, ft9, rne
                  sub          a5, s1, gp
                  and          ra, t3, s2
                  lui          s0, 86973
                  srl          ra, t3, s11
                  fmax.s       fs3, fa5, ft1
                  fcvt.w.s     a6, fa5, rdn
                  fmv.x.w      t1, fs2
                  mulhu        ra, s3, ra
                  sra          t5, s4, t2
                  sll          zero, s9, t2
                  slti         zero, s1, 1604
                  srai         a1, zero, 13
                  fmv.w.x      fs4, tp
                  fsgnj.s      fa0, fa2, fs9
                  flt.s        t0, ft6, fs5
                  fmv.w.x      ft1, a1
                  fclass.s     s7, fs3
                  and          t0, s7, ra
                  mul          a6, s11, a2
                  fcvt.w.s     t1, fs10, rmm
                  sub          sp, t3, t4
                  fsgnjx.s     fs3, fs2, fs6
                  ori          sp, s7, -531
                  or           s0, s8, s8
                  flt.s        s6, fa3, ft2
                  or           zero, t0, s11
                  addi         s1, zero, 734
                  fadd.s       fs0, ft0, fs2, rtz
                  feq.s        zero, fa7, ft1
                  slti         t0, a1, -1377
                  slt          a5, a3, s8
                  mulh         t0, t4, a2
                  sra          s7, t2, ra
                  fmv.w.x      fs1, t2
	fcvt.w.s	t2, fa5, rne
                  mulh         tp, a6, s5
                  rem          s5, s4, s10
	fsub.s	fa2, ft3, fa3, rne
                  sra          a5, t4, t2
                  slti         t2, s7, 1996
                  div          t4, s6, sp
                  mulh         a4, t0, t1
                  fle.s        t0, fs4, ft10
                  remu         t2, s5, s5
                  feq.s        s3, fs4, fs8
                  fmin.s       fa1, ft6, fa2
                  add          zero, s1, s9
                  sub          s0, s10, s5
	fadd.s	ft8, ft1, fs2, rne
                  rem          t2, a1, s2
                  addi         t2, t0, 1405
                  sll          t4, zero, a2
                  fmv.w.x      fa1, s3
                  div          tp, gp, zero
                  xori         s6, s6, 775
                  srl          zero, a2, s10
                  nop
                  srl          t4, t1, s7
                  rem          t4, a3, t2
                  mul          gp, a3, sp
                  slli         s3, a2, 2
                  xor          sp, s1, t4
                  fle.s        t5, fa2, ft2
                  lui          s2, 682538
                  lui          s1, 418332
                  fle.s        tp, fa3, fs0
	fcvt.s.wu	ft1, t3, rne
                  nop
                  sltu         t4, s4, gp
                  ori          gp, s1, -238
                  fadd.s       fs7, fs11, fs6, rup
                  addi         t5, sp, -631
                  mulhu        tp, a5, s6
                  fcvt.s.wu    fs2, s2, rne
                  fmin.s       fs3, fs1, fa7
                  mulh         t0, s6, s5
                  lui          s7, 10828
                  divu         s10, t4, a1
	fcvt.s.w	fs8, s6, rne
                  ori          sp, s3, 48
                  xor          t2, s3, t5
                  xori         s6, a5, -1062
                  rem          sp, gp, s2
                  srl          t4, a6, a2
                  slt          t0, ra, gp
                  srli         t3, s0, 6
                  fmv.w.x      fs10, t0
                  fsub.s       ft3, ft5, fs6, rne
                  slt          ra, a1, tp
                  and          s0, t2, s11
                  auipc        gp, 635036
                  srai         a7, s9, 16
                  fmax.s       ft5, fa7, fa3
                  remu         t3, s0, a6
                  fmin.s       ft9, fs3, fa1
                  fsgnjn.s     ft3, fs3, fs2
                  fadd.s       ft8, ft7, ft3, rtz
                  fclass.s     s9, fa0
                  sll          a2, s7, t4
                  flt.s        s4, ft1, ft0
                  andi         s7, a5, 1784
                  sra          s0, s1, tp
                  mulhsu       t0, s11, s7
                  div          a5, s0, tp
                  fsgnj.s      fa3, ft11, fa2
	fcvt.s.wu	ft4, s10, rne
                  slli         t6, s7, 7
                  fsgnjn.s     ft6, fa2, ft1
                  srl          a7, s10, t6
                  slli         a5, t5, 14
                  sltiu        gp, s2, 746
                  sll          s10, gp, a7
                  addi         s4, a7, 1666
                  xor          t3, sp, s6
                  slt          a5, a7, s4
                  or           s5, s1, a4
                  ori          s10, ra, 399
                  fmv.x.w      s2, fs5
                  fcvt.w.s     sp, ft2, rdn
                  mulhu        s9, t4, s3
                  fmv.x.w      gp, ft8
                  sub          a1, t4, a4
                  srl          s10, ra, a5
                  fmin.s       fa4, fa0, ft9
                  sub          s7, s0, s9
                  slti         tp, gp, 1325
                  sltu         t5, a2, s1
	fsub.s	fa3, ft0, ft2, rne
                  srli         t5, a0, 17
                  lui          s11, 341074
                  remu         a4, t0, s6
                  sltu         s9, s3, sp
                  fsgnjx.s     fs1, fa2, fa1
	fadd.s	fa6, fa0, fs11, rne
                  or           a2, sp, t6
                  sll          s0, a0, t3
                  fmin.s       ft0, fs11, fa5
                  sltu         s3, s1, s4
	fadd.s	ft2, ft2, fa7, rne
                  rem          t1, s6, t2
	fcvt.s.w	fa4, t0, rne
                  fsgnj.s      fa6, ft6, ft4
                  addi         t5, s6, 1569
                  sltu         s10, s6, t1
                  fsub.s       fs3, ft0, fs6, rne
                  sra          a5, t2, s10
                  fsub.s       fa5, fs0, fs9, rtz
                  sltiu        t2, ra, -1417
                  xor          gp, s1, t0
                  fsgnjn.s     ft10, fs5, fs11
	fcvt.s.w	ft5, t0, rne
                  flt.s        t1, ft2, ft7
                  xor          t4, t0, a2
                  mulhu        s3, a2, s10
                  lui          gp, 645071
                  fmv.x.w      s9, ft5
                  nop
                  remu         t0, s9, s6
                  slt          a4, zero, a4
                  sra          t6, s0, a1
                  sltu         t4, t5, s0
	fsub.s	fs7, fa3, ft1, rne
                  fsgnjn.s     ft2, ft10, fa2
                  slli         a2, s7, 26
                  addi         t5, zero, -1381
                  ori          a7, t0, 1707
                  flt.s        a2, fa0, fs0
                  ori          s7, t5, -851
                  fmv.x.w      a1, ft10
                  sra          sp, t3, a4
                  remu         s1, a1, s11
                  fcvt.s.wu    fa2, gp, rup
                  fle.s        s1, ft2, fa2
                  flt.s        s9, fs5, fa0
                  add          s0, s7, t2
                  sltiu        t4, t6, -766
                  slti         s9, s5, -1086
                  sub          t6, s7, t6
                  mulhu        t5, t1, s4
                  and          s5, s10, s6
                  or           a5, t0, s0
                  xori         s9, t1, 1947
                  slli         a1, t3, 11
                  addi         a1, a2, 1649
                  fmin.s       fa3, fs10, ft4
                  divu         t6, a0, s11
	fcvt.w.s	t1, fa0, rne
                  fsgnjn.s     ft5, ft9, ft0
                  add          a7, s8, t6
                  fsgnjx.s     ft10, fs6, fa1
                  ori          t5, s9, 21
                  slli         t4, zero, 3
                  div          t6, t0, s11
                  auipc        zero, 630103
                  auipc        s11, 666012
                  mulhsu       s11, t2, t5
                  fsgnj.s      fs9, fa5, fs8
	fcvt.s.w	ft11, gp, rne
                  fsub.s       ft1, ft2, fs2, rdn
                  mulhsu       s1, s0, a2
                  fsgnjx.s     fs1, ft1, ft5
                  mulhu        zero, t4, t3
                  fmv.w.x      fs10, ra
                  add          s3, s6, t0
                  ori          sp, ra, -621
                  mulhu        s7, s8, s6
                  mulhu        t3, t5, s0
                  mul          s0, a1, a4
                  fmv.x.w      t3, ft9
                  auipc        s5, 421695
                  fsgnjx.s     ft2, fa0, fa7
                  addi         a4, s11, -958
                  mulhu        a1, s11, s9
                  ori          t4, s4, -13
                  sra          tp, t3, a1
                  fcvt.s.w     fa4, s11, rdn
                  flt.s        tp, fa4, fa1
                  xori         s4, s7, -938
                  fsgnj.s      fs4, fa5, ft9
                  mulhu        s10, tp, s2
                  fsgnj.s      ft0, ft11, ft9
                  remu         tp, t6, gp
                  fcvt.s.w     fs11, s0, rne
                  fle.s        zero, ft2, fa3
                  fmv.w.x      fs2, a0
                  ori          s5, s4, -1296
	fcvt.w.s	s4, fs5, rne
                  fsgnjx.s     ft8, fa2, ft8
	fcvt.s.w	fa6, t1, rne
                  nop
                  fmv.w.x      ft9, s10
	fsub.s	fs9, ft3, fs5, rne
                  feq.s        s9, ft7, fs5
                  slti         s4, t5, -1256
                  or           s1, s6, ra
                  fclass.s     gp, fs4
                  divu         t0, s2, a4
                  andi         zero, gp, -161
                  mul          tp, ra, a3
                  sll          a6, tp, s5
	fcvt.w.s	t5, fa0, rne
                  fmax.s       fa7, fs6, fa2
                  lui          zero, 540978
                  sltiu        s10, t0, -1762
                  sub          a7, s9, t1
	fcvt.s.wu	fa2, t4, rne
                  mulhu        a7, s2, t2
                  feq.s        zero, ft2, fa6
                  andi         s3, s3, -1030
                  flt.s        s0, fa7, ft11
                  mulh         s0, a6, a4
                  slti         sp, s5, 1352
                  sra          s0, a2, s2
                  mulhsu       zero, a0, sp
                  and          t1, s4, a5
                  andi         s9, t5, 934
	fcvt.s.w	fa2, a0, rne
                  fle.s        s11, fs1, fs3
                  fsgnj.s      fs11, fs4, ft3
                  fle.s        t3, fs5, fa4
                  or           s5, a1, tp
                  addi         s1, s1, 701
                  divu         t2, s1, s1
                  sll          s3, t1, t6
                  auipc        a2, 138487
                  or           t5, a6, s0
                  divu         ra, t5, ra
                  slt          t2, a2, s9
                  fmax.s       fs0, ft0, fa1
                  mulhu        ra, a7, s4
                  nop
                  fmin.s       fs11, fs4, ft1
                  auipc        a2, 882547
                  addi         s3, t3, -2020
                  srli         a2, a5, 2
                  fsgnjn.s     fs9, fa7, ft11
                  sub          s10, a1, zero
                  ori          s0, zero, 573
                  xor          t5, t0, t3
                  fmv.x.w      t0, fs4
                  divu         t1, a0, a5
                  srai         s1, s3, 30
                  flt.s        t5, fs2, ft3
                  div          a4, t2, t0
                  fcvt.w.s     a1, fs9, rup
                  fadd.s       fs10, fs6, fs11, rmm
                  div          ra, t4, a6
                  sltu         s10, s7, a5
                  fmv.w.x      fs10, a1
                  sltu         s0, t5, s9
                  and          s0, sp, a1
                  slti         a1, a4, -1624
                  fmax.s       fa4, ft9, fa2
                  srli         sp, s11, 24
                  andi         t4, a1, 1205
                  slli         a4, a3, 19
                  auipc        s3, 16028
                  mulh         s5, s9, a0
                  lui          a7, 756483
                  fcvt.s.w     ft7, a2, rmm
                  fmv.w.x      fs6, a1
                  sra          a6, a0, s3
                  mul          t1, tp, t5
                  andi         s11, tp, 1832
                  fmin.s       ft2, fa3, fa4
                  mulhsu       s11, s9, t6
                  sltu         a4, s3, s6
                  srl          sp, s0, a5
                  xor          s9, t0, t4
                  sltu         s0, s3, a4
                  andi         a5, s5, 114
                  fcvt.w.s     a2, ft11, rup
	fcvt.w.s	a5, fa2, rne
                  and          a1, a6, zero
                  sub          a6, s7, gp
                  mulhsu       s6, s6, a0
                  slt          zero, t4, t6
                  remu         t4, s11, s6
                  sub          s7, s2, a1
                  andi         a1, a0, 1677
                  srl          a1, s10, a3
                  fmax.s       ft5, ft10, ft5
                  fcvt.s.w     fs8, s3, rup
                  addi         a2, a3, 509
                  slti         ra, s6, -602
	fcvt.wu.s	t5, fs7, rne
                  sll          t0, tp, s9
                  fsgnjn.s     fs3, fa1, ft6
                  xor          s5, s6, t5
                  mulhsu       s0, a1, s10
                  sra          s3, a0, s10
                  div          t3, s6, a6
                  srl          s4, s2, t3
                  slli         s5, t6, 0
                  div          tp, s2, s1
                  flt.s        s10, fs11, fs8
                  slt          s7, s7, a2
                  slti         s3, s9, -1016
                  sll          a5, s1, a1
                  fcvt.s.wu    ft0, t6, rmm
                  mulhu        s10, gp, s11
                  srai         s2, a5, 21
                  mul          s2, a1, a5
                  xor          s5, t2, tp
                  sra          tp, t5, t0
                  fsub.s       ft0, fs3, fa3, rne
                  fsgnjn.s     fa2, fa5, fa1
                  fsgnjn.s     fa7, ft10, fa4
	fcvt.wu.s	s3, fa1, rne
                  divu         a6, s6, tp
                  srai         t6, s0, 7
                  mul          s3, t4, t6
                  and          t1, tp, gp
                  sub          s0, a1, t1
                  div          s5, a7, a0
                  fsgnjx.s     fs7, fs9, fs4
                  fcvt.s.w     fs6, s11, rtz
	fsub.s	ft5, fs3, ft6, rne
                  srl          s4, t4, sp
                  fsgnj.s      ft0, ft1, ft6
                  remu         s1, a4, s0
                  remu         t3, s11, gp
                  auipc        s7, 125243
                  fcvt.wu.s    zero, fa0, rdn
	fadd.s	fs2, ft3, fs1, rne
	fcvt.s.wu	fs10, t0, rne
                  xori         s6, s1, -291
                  remu         a1, t1, s11
                  sltiu        s11, a5, 1841
                  auipc        a1, 191000
                  fsgnjx.s     fa6, fs11, fs1
                  fle.s        ra, fa1, fs8
                  srli         s1, a6, 3
                  fclass.s     s0, fs7
                  addi         s10, t2, -273
                  or           s4, s9, s6
                  fmax.s       ft7, ft4, fa2
                  srli         t3, s8, 18
                  fclass.s     a1, ft0
                  fsgnjx.s     fs9, ft5, ft1
                  srl          s1, a1, s9
                  srl          tp, a3, s4
                  fclass.s     t6, fa3
                  slti         s4, t6, 1751
                  sltu         s4, s2, t1
                  slt          s3, s11, ra
                  sltiu        s6, t3, 1676
                  fmin.s       ft6, fs0, ft3
                  lui          a6, 353182
	fsub.s	fs9, ft5, fa6, rne
                  srl          t5, a0, s10
                  sub          s10, t5, t6
                  srl          a2, a3, s6
                  add          s3, ra, s9
                  or           a1, t0, a2
                  fsub.s       fs7, fa5, fs4, rtz
                  auipc        s7, 650087
                  fsub.s       fs6, ft0, ft6, rne
                  srl          t3, s7, s3
                  addi         s10, s2, -1985
                  auipc        t5, 679029
                  srl          a2, s2, a5
                  fmin.s       ft4, ft7, ft5
                  fclass.s     a1, fa4
                  sltu         t3, s0, s0
                  mulhsu       t0, t0, a0
                  fsgnj.s      fa5, fs8, fa5
                  sltu         zero, s6, t2
                  fadd.s       fa4, ft10, fa2, rdn
                  mulhsu       t5, a3, s10
                  andi         ra, s4, 432
                  auipc        s1, 182329
                  divu         t1, a2, a4
                  fadd.s       fa4, fs11, fs8, rmm
                  and          zero, s7, a4
                  and          gp, a6, a0
	fadd.s	ft0, fs4, fa2, rne
                  divu         t4, s0, s7
                  slli         s1, gp, 2
                  sltu         tp, a4, s10
                  srli         gp, a4, 7
                  mulh         ra, ra, s11
	fadd.s	fs1, fs11, ft5, rne
                  nop
                  slti         s10, s9, 1272
	fcvt.w.s	s7, ft6, rne
                  fsgnjn.s     ft4, fs5, ft10
                  xor          s0, a3, s8
                  slt          s2, s4, a4
	fcvt.s.w	fs6, s11, rne
                  fmv.w.x      fs6, ra
                  slti         s7, s6, -1931
	fcvt.s.w	fa5, ra, rne
                  remu         s0, t4, zero
                  slti         gp, t3, -1190
                  mulhu        s6, t4, s1
                  add          s0, s2, t2
                  xori         a6, a0, 469
                  flt.s        s0, ft3, ft11
                  mulhsu       a7, a0, a0
                  slli         s9, s8, 10
                  fmv.x.w      sp, fs0
                  mulhu        s9, a2, t2
                  fsgnjx.s     ft10, ft5, fs8
                  fmin.s       ft3, fa6, ft7
                  xori         a6, s10, 798
	fcvt.s.wu	fs9, s0, rne
                  addi         t4, s5, 1916
                  fsgnjn.s     fs2, fa2, fa4
	fcvt.wu.s	t2, fs0, rne
                  xor          s10, t0, a4
                  slli         s11, t5, 4
                  xori         s11, a3, 333
                  srli         s9, sp, 8
                  ori          s11, s7, 57
                  fle.s        t4, ft11, fa5
                  fsgnj.s      fs6, fa5, fs1
                  fmax.s       fs5, ft2, fs9
                  and          s6, s1, a3
                  mul          sp, s0, a6
                  flt.s        s9, fs6, fa5
                  fsgnjn.s     fs7, ft0, fa4
                  srl          s4, s11, t0
                  srl          t4, s11, t2
	fcvt.wu.s	t5, fa5, rne
                  fmin.s       ft10, ft11, fs10
                  fsgnj.s      ft10, fa2, ft3
                  srli         ra, s7, 20
                  auipc        t0, 773678
	fcvt.wu.s	t0, ft8, rne
                  mulhsu       s10, t6, a5
                  sltu         t2, s5, t2
                  fmax.s       fs6, ft10, ft4
	fcvt.w.s	t5, ft11, rne
                  xori         t1, tp, -1972
                  fmv.x.w      t6, fa2
                  and          s9, s6, gp
                  fcvt.w.s     a5, fa1, rdn
                  addi         a1, s6, -309
                  andi         a4, gp, 610
                  flt.s        a4, ft1, fa0
                  sra          t0, s5, a2
	fcvt.wu.s	t5, fs2, rne
	fcvt.w.s	a6, fa7, rne
                  fmax.s       ft10, fs1, ft10
	fadd.s	ft2, ft4, ft5, rne
                  sub          sp, t1, a7
                  fmax.s       fs10, ft11, fs3
                  fmin.s       fa6, fa3, fa4
                  slti         ra, tp, 613
	fcvt.w.s	tp, fs0, rne
                  mulh         a1, a0, s3
	fcvt.s.w	fa4, t0, rne
                  sra          t3, a4, t0
                  xor          s4, s3, s0
                  addi         t0, a7, -919
                  fmin.s       fs6, fs9, fa6
                  sltu         s10, a0, s11
                  sltu         a4, a1, s5
                  and          sp, t4, a1
                  div          a5, s4, s4
                  srai         t1, sp, 30
                  add          t4, s5, s3
                  and          a7, zero, t0
                  or           s2, s8, s0
                  sll          t4, a6, a0
                  srli         s6, s0, 10
                  div          a5, a0, a0
                  slt          t1, t4, t2
                  mul          gp, s4, a7
                  srli         a5, a2, 30
                  remu         s2, s1, t0
	fadd.s	ft9, ft1, ft6, rne
                  srl          a5, a2, s6
                  mulhu        t2, t3, t2
	fcvt.wu.s	t2, fa5, rne
                  add          s1, a0, s7
                  fsgnjn.s     ft5, fa2, ft7
                  auipc        s1, 618070
                  and          s0, a3, t4
                  feq.s        s3, fs9, ft5
                  sltiu        s0, sp, -1168
                  addi         gp, a5, 658
                  fle.s        a4, fa5, fa0
                  rem          tp, a7, a6
                  lui          s5, 569337
                  fmv.x.w      ra, fa6
                  fadd.s       fa3, fs3, fs1, rtz
                  addi         a2, t3, 1887
                  add          t6, sp, s4
                  fcvt.wu.s    s5, fs4, rmm
                  fsgnjx.s     fa7, fs9, fa4
                  mul          a7, tp, s7
	fcvt.w.s	a1, ft1, rne
                  fsub.s       fa5, fa2, fs2, rup
                  fmin.s       fs10, fs4, ft9
                  mulhsu       zero, s5, s4
                  srai         a6, s7, 30
	fsub.s	fa2, ft10, fs7, rne
                  and          sp, t3, s11
                  fcvt.s.wu    ft7, t2, rup
                  fsgnjx.s     fs1, fs2, fa4
                  fmax.s       fs4, fs9, fa3
                  fcvt.w.s     s10, ft7, rne
                  nop
	fcvt.s.w	fs6, a4, rne
                  sltiu        s11, tp, 1405
                  auipc        s4, 618148
                  srli         zero, s8, 9
                  divu         s4, a1, zero
	fcvt.s.w	fa2, a0, rne
                  sltiu        t1, s11, 1827
                  mulhsu       s1, t1, a7
                  slti         t3, a4, 1079
                  slti         s7, s7, -1982
                  fcvt.s.wu    fs7, s10, rdn
                  sltiu        a2, t3, -1980
                  mulhsu       t4, a5, t4
	fcvt.wu.s	gp, fs9, rne
                  sub          t3, s0, s11
                  add          a7, s6, s6
                  srl          t1, s2, a6
                  sltiu        s7, t2, -1599
                  andi         a7, a7, 1432
                  sub          t0, t1, a2
                  slt          s10, s0, a6
                  andi         zero, sp, 10
                  slt          t1, s9, a7
                  fmv.x.w      t1, ft9
                  ori          a6, a3, 1046
                  fsgnjx.s     fs4, fs10, fa4
                  and          a2, s1, a1
                  add          t3, a6, a7
                  andi         a4, t2, 1559
                  mulhsu       a1, t5, s3
	fcvt.s.w	fs3, gp, rne
                  fcvt.s.wu    fa7, s5, rdn
                  addi         s3, tp, -1883
                  fmv.x.w      t1, fs6
                  fsgnjn.s     fa2, fs1, fa3
                  sltiu        s1, a3, 757
                  sltu         gp, a4, gp
                  mulh         a6, ra, s1
                  sll          s10, ra, gp
                  fadd.s       ft7, fs10, fs10, rup
	fsub.s	ft11, ft2, ft6, rne
                  fclass.s     s7, fa7
                  fcvt.s.wu    ft2, ra, rmm
                  fadd.s       fs0, ft3, ft10, rmm
                  srli         s6, s5, 23
                  addi         t4, a5, -850
                  feq.s        s10, fa6, fa1
                  slli         a2, t6, 14
                  add          sp, s4, tp
                  div          a4, sp, s9
                  sub          a4, a7, t5
                  feq.s        t1, fs9, fs10
                  flt.s        a1, fs10, ft9
                  srl          s9, s4, a3
                  xori         s10, a4, -1056
                  div          t1, t6, a5
                  fcvt.s.wu    ft8, sp, rdn
                  srli         a4, tp, 6
                  fclass.s     a2, fa4
                  lui          t2, 157392
                  fle.s        s3, ft10, fs6
                  div          t1, s4, t1
                  fsgnjn.s     ft3, fa6, ft2
                  ori          s3, t5, 1163
                  rem          s0, a5, s7
                  mulhu        s7, s8, t3
                  ori          s0, a2, -1596
                  mul          s0, s3, t3
                  lui          s2, 563382
                  rem          a7, s0, s10
                  andi         s3, a7, -845
                  fcvt.s.w     fs9, tp, rmm
                  fsgnjx.s     ft0, ft11, fa5
	fcvt.s.w	fs9, s9, rne
                  srl          s10, t4, a4
                  addi         s10, s8, 1474
                  divu         a2, a5, sp
                  mul          a4, s10, tp
                  xor          s6, a7, s9
                  slt          s7, t3, t3
                  feq.s        a1, ft4, fs5
                  sltu         s10, s11, a6
                  feq.s        s7, ft8, fs11
                  mulhsu       t0, sp, gp
                  sltu         zero, s4, t2
                  fmax.s       fa7, ft1, fa7
                  fmin.s       fs4, fa4, fs1
                  xori         a6, s10, 972
                  srai         s6, s1, 0
                  srli         a5, s11, 14
                  mulh         t0, sp, s7
                  andi         t0, s4, -1564
                  sltiu        a4, t1, 368
                  srai         s5, t4, 14
                  fsgnjn.s     ft10, ft2, fs1
                  srai         a5, a4, 30
                  sltu         s4, s6, t4
	fcvt.w.s	t6, fs9, rne
                  addi         s10, s3, -1528
                  addi         s10, s9, 1190
                  div          t4, t0, t2
                  srli         a1, s2, 24
                  sub          t2, a3, t0
                  rem          sp, s0, sp
                  xori         t1, s7, 802
                  ori          t4, zero, -24
                  divu         t2, t3, sp
                  slt          t0, a4, s11
                  fclass.s     gp, fs0
                  sll          a1, s10, s0
                  fmax.s       ft9, fa0, fs7
                  mul          tp, t3, a2
                  srl          ra, s1, tp
                  fle.s        t3, fa3, ft10
                  srli         s3, t6, 10
                  fle.s        s0, ft2, ft11
                  mulh         tp, t0, t1
                  remu         a5, tp, a4
                  addi         tp, sp, 563
                  fsgnj.s      ft11, fs5, ft0
                  xori         t0, s1, -1687
	fcvt.s.w	fs4, a3, rne
                  nop
                  sltu         a7, gp, t1
                  flt.s        a1, ft7, fs3
                  auipc        t3, 521192
                  sltu         a4, s9, gp
                  add          s3, s7, t3
                  divu         s11, s0, s1
                  andi         a7, a1, -134
                  srai         zero, gp, 7
                  sub          t5, t4, a3
                  fmv.x.w      a4, ft1
                  add          t1, t5, t2
                  feq.s        zero, fs3, ft1
                  flt.s        t6, ft3, fs3
                  fadd.s       fs4, fa4, fa5, rne
                  fclass.s     t3, ft6
                  add          s5, s1, tp
                  mulhsu       s11, gp, t1
                  fclass.s     t6, ft4
                  fmin.s       ft1, ft10, fa5
                  ori          tp, zero, 112
                  or           a4, gp, t4
                  remu         t6, t6, s7
                  rem          t4, sp, t1
                  slti         s0, a4, -439
                  lui          s11, 706650
                  srl          tp, t6, s3
                  lui          s7, 988588
                  slt          t3, s8, t1
                  andi         t6, a0, 316
                  fcvt.wu.s    a2, fs0, rtz
                  fsgnjx.s     fs6, ft11, fa7
                  fmv.w.x      fa7, a7
                  and          zero, a4, t0
                  srl          a1, gp, t0
                  srli         zero, a3, 3
                  mulhu        s5, s2, s7
                  feq.s        s0, ft10, fa7
                  andi         tp, s5, -1237
                  fmv.w.x      fs1, s3
                  remu         t4, zero, s10
                  fsub.s       ft0, fs2, ft11, rne
                  and          a6, s9, zero
                  fcvt.w.s     a5, ft9, rne
                  ori          t0, s0, -418
                  xor          t0, t5, t5
                  nop
                  fmv.x.w      t2, fs1
	fcvt.wu.s	t5, fa5, rne
                  fsgnjn.s     fs8, fa0, fs0
                  fmin.s       ft11, fa1, fs8
                  remu         a6, s11, s4
                  fadd.s       fs11, fs9, fa7, rtz
                  add          t3, a4, tp
                  slli         t5, t5, 10
                  div          t2, a0, s4
                  slti         zero, s4, 837
                  sra          s0, a6, t1
                  sll          s6, tp, a6
                  fsub.s       ft11, fa7, fs6, rdn
                  auipc        t5, 676300
                  mulhsu       t0, gp, a1
                  srai         a1, t2, 16
                  andi         s10, s10, -223
                  fmin.s       ft11, ft10, ft10
                  fmv.w.x      fa1, a4
                  auipc        a6, 376406
                  feq.s        s5, fa3, fs4
                  sra          a5, a1, s6
                  andi         a6, t0, -874
                  srl          t1, s5, s4
                  slli         t4, s0, 10
                  fcvt.s.w     ft6, t0, rdn
                  fmv.w.x      fa6, t1
                  slt          s3, a7, s6
                  fcvt.s.wu    fa4, s3, rmm
                  feq.s        s10, ft2, fa5
                  feq.s        s5, fs3, fa2
                  divu         ra, s10, s4
                  or           s6, t0, s2
	fcvt.w.s	a6, ft4, rne
                  slli         s0, s7, 30
                  srai         a4, s9, 26
                  ori          s4, s6, 286
                  add          t6, tp, t2
                  lui          t4, 583006
                  or           s2, sp, s8
                  fle.s        a4, fa3, fs2
                  fcvt.wu.s    a1, fs6, rup
                  xori         s2, gp, -301
                  fcvt.w.s     s11, ft1, rne
                  mulhsu       s1, t0, s4
                  sra          s10, gp, a5
                  fmax.s       fa1, ft2, fa3
                  lui          s3, 880397
                  srl          s2, s7, s3
                  srl          s0, s2, s8
                  fcvt.wu.s    s9, ft4, rne
                  fclass.s     t3, ft6
                  xor          gp, t1, a0
                  srl          a2, t3, sp
                  auipc        ra, 829962
                  add          t4, t5, zero
                  fle.s        a1, ft4, ft0
                  divu         tp, t0, t3
                  divu         s6, s9, t2
                  slt          s0, s2, t4
                  slt          t1, a1, t2
                  fclass.s     s7, fa1
                  slti         gp, tp, -1850
                  fmv.w.x      ft0, tp
                  and          a4, s3, t0
                  fsgnj.s      fs10, fa0, ft1
	fcvt.w.s	t2, fs3, rne
                  srl          s1, t4, a7
                  fsgnjx.s     ft3, ft10, fa1
                  or           t3, s3, a1
                  fmax.s       fa4, fs10, fs10
                  sll          t6, sp, t1
                  fsgnjn.s     fs0, fs1, fa6
                  fcvt.s.wu    ft0, t1, rup
                  mul          s2, gp, a7
                  sltu         a1, a5, sp
                  fmin.s       fs3, ft8, fs6
                  fadd.s       fs2, fs10, fs10, rdn
                  fle.s        t1, ft11, ft4
                  sll          t0, s3, sp
                  fmv.x.w      a5, fa7
                  fmin.s       ft2, fs0, fs4
                  add          a2, s7, t1
                  fclass.s     t4, fs4
	fsub.s	fs8, fa7, fs3, rne
                  nop
                  fcvt.wu.s    a4, fa0, rdn
                  srai         t4, s2, 9
                  auipc        a1, 1023742
                  fsgnjn.s     fs6, ft0, ft5
                  mulhsu       gp, gp, t0
                  srl          ra, a5, s3
                  fcvt.s.wu    fs8, sp, rdn
                  fcvt.w.s     s5, fs0, rtz
                  addi         a2, s5, -859
                  sra          s0, t2, s9
                  srl          s9, zero, s10
                  feq.s        a5, fa7, fa3
                  mulh         a7, t2, s8
                  or           sp, s8, gp
                  fsgnjn.s     ft1, fs8, fa2
                  fclass.s     a4, fs4
                  remu         s11, s7, s11
                  xori         s9, t3, 1609
                  sltu         gp, a6, t5
                  fmv.w.x      fa0, gp
                  and          a4, t1, t4
                  mulhu        t5, s8, ra
                  srli         s6, a5, 31
                  add          s5, s2, t1
                  sll          s5, s11, a7
                  fmv.w.x      fa3, a0
                  div          t3, s2, s0
                  fclass.s     s2, fs5
                  addi         s5, a3, 1424
                  feq.s        t1, ft11, fs0
                  sra          s11, t3, s7
                  remu         s11, t0, s3
	fsub.s	fa2, fs6, fs6, rne
                  slti         a7, t1, -801
                  feq.s        a2, fs8, ft7
                  fmin.s       fs0, ft5, fs8
                  fmv.w.x      fs0, s5
                  addi         t1, a1, -1915
	fcvt.w.s	s6, ft0, rne
                  sltiu        t5, a2, 1795
                  divu         s1, a1, a0
                  auipc        a5, 1005645
                  fmin.s       fs8, fs8, fs6
                  fle.s        a5, ft0, fs0
                  mulh         s3, s11, s2
                  fsgnjx.s     ft7, fs7, ft4
                  rem          s4, s0, t0
                  fcvt.w.s     a4, fs9, rdn
                  sltu         a4, a0, s11
                  mulh         t3, a5, t6
                  srli         s10, t2, 29
                  fmv.x.w      s2, fs11
                  auipc        tp, 42786
                  fadd.s       fs11, ft7, fa6, rne
                  sltu         s3, s9, a6
                  mul          s10, tp, a0
                  addi         s4, a2, -948
                  srai         gp, a3, 1
                  slti         t5, tp, 1988
                  or           a1, a5, t4
                  xori         s5, s8, 539
                  or           s4, t5, a1
                  div          t2, zero, a2
	fcvt.w.s	s10, fs8, rne
                  auipc        s10, 728453
                  ori          s4, ra, 1828
                  sub          s3, zero, a4
	fcvt.wu.s	s5, fs6, rne
                  srli         a2, t4, 29
                  rem          t5, t5, s11
                  mulhsu       t5, a1, a7
                  feq.s        t0, fa7, fs9
                  sll          a5, s11, a4
                  sra          s3, a0, s6
	fsub.s	ft4, fs4, ft0, rne
                  slt          a2, sp, a5
                  flt.s        t4, ft1, fs10
                  fadd.s       fa3, fs1, ft0, rtz
	fcvt.s.wu	fs3, a0, rne
                  fmin.s       ft11, fs7, fa5
                  fsgnjn.s     ft7, fs2, fs0
                  slt          s6, a7, t1
                  flt.s        tp, ft2, fs2
                  mulhsu       s4, t3, s0
                  fsgnjn.s     fs3, ft8, ft0
                  srai         t0, s1, 14
                  fmax.s       fa5, fa7, fs1
                  fmax.s       fa0, ft4, fa3
                  andi         t2, a2, -595
                  sll          t1, a6, t3
                  fclass.s     s4, fa7
                  fclass.s     a5, fs3
                  fle.s        s10, ft5, ft11
                  xor          s7, t0, gp
                  fmv.x.w      s4, fa3
                  fmin.s       ft11, fs0, ft8
                  fcvt.s.wu    ft5, t6, rup
                  slli         zero, s10, 12
                  rem          s9, ra, s8
                  and          a2, a7, s1
                  sltiu        s6, t2, 177
	fcvt.w.s	sp, ft5, rne
                  lui          s11, 563532
                  or           t6, sp, t4
                  slli         a5, s5, 18
                  fmv.w.x      fs8, t5
                  srl          s0, a2, s0
                  xor          t5, sp, sp
                  remu         gp, s10, a2
                  nop
                  sll          s9, s10, s6
	fcvt.s.wu	fa1, a0, rne
                  sub          s2, s6, s0
                  sltiu        t2, a2, -194
                  remu         s7, a7, a5
                  srli         s11, a1, 9
	fadd.s	ft6, fa5, fs11, rne
                  sll          a5, t5, s10
                  mulh         s6, a4, a5
                  sltu         t0, s3, s4
	fcvt.wu.s	s2, fa0, rne
                  slli         s4, a7, 25
                  fle.s        s7, fa2, fs5
                  fcvt.wu.s    s11, ft2, rmm
                  fcvt.wu.s    t3, fa0, rmm
                  rem          gp, a2, t5
                  fmv.w.x      fs7, a0
                  srli         sp, a5, 19
                  srli         gp, s3, 23
                  remu         s0, s2, s11
	fcvt.s.w	ft3, t2, rne
                  fmax.s       fs2, fs8, ft6
                  addi         a7, t4, 1233
                  slti         ra, t2, -131
                  remu         a1, s9, s4
	fcvt.w.s	s3, fs2, rne
                  sub          t4, s3, t5
                  add          s4, s5, s1
                  rem          s9, s1, s5
                  flt.s        s11, fa4, ft11
                  fclass.s     t2, ft9
                  andi         tp, t3, 1579
                  mulhsu       a2, a7, t5
                  rem          s3, s8, a5
                  divu         s1, a3, t0
                  flt.s        tp, fs0, ft7
                  div          zero, s11, a5
                  divu         a4, zero, a4
                  divu         s3, s1, a7
                  slli         t3, a2, 31
                  ori          gp, a0, 1721
                  addi         tp, s3, 613
                  divu         t0, s6, t2
                  srai         gp, s9, 27
                  srl          s11, t4, s5
                  mul          tp, s1, t5
                  flt.s        a5, ft11, fa0
                  add          t6, a5, s5
                  xori         s7, a4, 1473
                  sub          a7, s6, t6
                  fcvt.wu.s    zero, fs0, rup
                  ori          s11, t2, 1934
                  xori         a2, s4, 1939
                  slt          t6, s11, sp
                  lui          t4, 610980
                  auipc        t3, 168377
                  mulhu        s11, sp, tp
                  fcvt.w.s     s2, fa6, rup
                  lui          tp, 764769
                  fclass.s     s11, ft2
                  sra          a2, s7, s6
                  lui          t0, 584879
                  fsgnj.s      fs1, fs1, ft6
                  fmv.w.x      ft1, s11
                  mul          t0, gp, t0
                  slli         s9, a2, 0
                  slti         s0, t5, -1235
                  fmv.x.w      s6, fs6
                  add          s3, s11, a0
                  fmin.s       fa4, ft7, fa7
                  flt.s        t3, ft5, fs1
                  srl          gp, s2, a1
                  rem          gp, t1, t5
                  flt.s        s11, fs0, ft1
                  fcvt.wu.s    gp, fa7, rdn
                  mulhsu       zero, t4, a5
                  mul          a1, s11, tp
                  xori         t6, t5, -410
                  srli         t3, s1, 5
                  fcvt.wu.s    t4, fs5, rup
                  mulhsu       a1, s11, s11
                  sltiu        a1, a1, -298
                  xor          sp, s8, s10
                  srai         s6, s9, 7
                  lui          s4, 573728
                  sll          s10, t5, s8
                  mulh         t6, s4, s6
                  fsgnjx.s     fs1, fs8, fa1
                  div          gp, t1, sp
                  mul          s2, t2, a5
                  srai         a2, s4, 10
                  fadd.s       fs6, ft5, ft11, rmm
                  divu         s7, gp, s3
	fadd.s	ft4, ft4, fa1, rne
                  mulhu        s1, a6, t1
	fcvt.s.wu	fa5, zero, rne
	fcvt.wu.s	a6, ft2, rne
                  fmv.w.x      ft0, sp
                  fmax.s       fs11, ft8, ft6
                  sub          t2, a6, a0
                  fmv.x.w      t1, ft8
	fcvt.s.w	ft3, t0, rne
                  flt.s        s10, fs2, ft10
	fcvt.s.w	fs10, a5, rne
                  lui          ra, 212035
                  mulhsu       a4, t3, s9
                  fsgnj.s      fs8, fa3, ft7
                  or           s0, a4, zero
                  fclass.s     a2, fs11
                  slli         a7, t2, 13
                  fcvt.w.s     a6, fs8, rup
                  mul          a1, s11, s0
                  fmax.s       ft9, ft8, fa1
                  fclass.s     s10, fs5
                  mul          zero, t3, a4
                  fmv.x.w      t3, fa0
                  add          s6, t2, s1
                  addi         s10, s2, 171
                  fsub.s       fs10, ft9, fs9, rmm
                  andi         sp, a7, -1064
                  srl          t0, t5, tp
                  fsgnj.s      ft6, fs5, fa6
                  mulhu        s5, sp, ra
                  feq.s        a1, fs5, ft0
                  fcvt.w.s     a4, ft2, rmm
                  fcvt.s.w     fs4, ra, rtz
                  rem          sp, sp, a2
                  slti         t0, s10, -1517
                  mul          t3, s3, a1
                  slti         t5, t6, -1047
                  rem          a4, t5, s8
                  div          a2, s3, t0
	fcvt.wu.s	s0, ft9, rne
                  fclass.s     a4, fa7
                  fcvt.s.w     ft8, s1, rne
                  andi         s0, t3, 289
                  add          a4, s2, s9
                  fsgnj.s      fa1, ft1, ft3
                  xor          s11, s5, a6
                  remu         gp, t2, sp
                  srli         t3, t2, 16
                  sltiu        sp, a2, 1307
                  fsgnj.s      ft0, fa7, ft1
                  ori          s11, t3, -876
                  mul          s4, ra, s0
                  fmv.x.w      t3, fs4
                  sub          a7, a1, s7
                  auipc        a6, 377117
                  mulhu        a1, a6, a4
                  or           s3, a1, a7
                  sub          a1, a0, t1
                  and          s11, s11, t0
                  ori          s6, s2, 1113
                  sll          s2, t1, a1
                  srai         t3, s9, 13
                  and          ra, s3, a5
	fadd.s	ft4, fa5, fa5, rne
	fcvt.s.wu	fs3, s5, rne
                  sltiu        sp, sp, 1610
                  fmv.w.x      fa7, t3
                  nop
                  mulhu        gp, t2, s3
                  srli         s0, t0, 23
                  ori          zero, t5, 1563
	fcvt.s.wu	fa7, s7, rne
                  sra          s4, s2, s7
                  xori         zero, s0, 424
                  and          t0, s0, ra
                  remu         t2, t5, a5
                  fcvt.wu.s    t0, fs0, rne
                  fsgnjn.s     fa0, fs3, ft5
                  fclass.s     sp, ft11
                  mul          t6, sp, tp
	fcvt.s.wu	ft5, a4, rne
                  fadd.s       fa2, fa2, ft11, rne
	fcvt.wu.s	t4, fa1, rne
                  fmv.w.x      fa1, t5
                  add          s6, gp, zero
                  ori          t3, s2, -1173
                  flt.s        t1, fs8, ft9
                  remu         s0, s3, t2
                  feq.s        a6, fa1, fa7
                  andi         s6, s8, -1389
                  fsgnj.s      fs9, fs9, fa1
                  feq.s        s2, ft5, ft5
                  lui          s9, 496547
                  auipc        t5, 310213
                  remu         ra, s10, s9
                  rem          sp, s2, s5
                  slt          s9, a4, a2
                  rem          s7, s0, a3
                  mul          t6, a3, a7
                  fsgnjx.s     fs9, fs0, ft4
                  fmax.s       fs11, fa1, fa5
	fsub.s	fa2, ft1, fs9, rne
                  sra          s9, a5, s10
                  xor          a5, a6, t0
                  sltu         gp, s10, gp
                  fsgnj.s      fa6, ft4, fa6
                  mulhsu       s0, s1, t3
                  nop
                  srli         s0, s7, 26
                  ori          s10, t4, -697
                  nop
                  fcvt.s.w     fs9, s2, rtz
                  fle.s        a6, ft3, fa3
                  fmv.x.w      zero, fa0
                  flt.s        s0, fs2, fs11
                  add          t1, s2, tp
                  mulhsu       s3, t3, t0
                  rem          s0, s5, s11
                  slti         t4, s1, -890
                  slt          ra, s3, t2
                  fsgnjn.s     fa1, fs8, fs11
                  fmin.s       fs4, ft7, ft11
                  fmv.x.w      s0, fa1
                  fclass.s     zero, ft6
                  slli         s4, a5, 8
                  slli         sp, zero, 3
                  fmv.w.x      fa3, s4
                  andi         s5, s2, 326
                  fmv.w.x      ft2, s3
                  flt.s        t2, fs4, fs0
                  fmin.s       fs4, fs4, fs1
                  auipc        ra, 630938
                  or           a2, a3, t3
                  sub          a2, a2, t0
                  slli         t2, s8, 11
                  fcvt.s.wu    ft4, t6, rup
                  slli         t2, a3, 9
                  add          t4, a6, a5
                  fcvt.w.s     t0, ft10, rdn
                  fmv.x.w      zero, ft2
                  feq.s        s3, ft9, ft7
                  rem          a7, a2, t0
                  lui          a4, 643287
                  fmv.x.w      zero, fs10
                  sub          s0, t5, s8
                  fsgnjx.s     fs4, fs6, fa1
	fcvt.w.s	s2, fa6, rne
                  fmv.x.w      a6, ft8
                  mul          ra, zero, s2
                  mulhsu       tp, a2, t4
                  xor          t4, s7, s0
                  flt.s        s7, ft0, ft8
	fadd.s	ft4, fa1, ft10, rne
                  slti         sp, s11, -245
                  mul          gp, s10, a7
                  lui          s11, 962567
                  fclass.s     ra, fs6
                  and          s6, gp, tp
                  div          t0, t0, sp
                  ori          ra, a2, 659
                  mulhsu       s6, zero, s10
                  add          s3, s8, a7
                  fsub.s       fa5, fs9, ft8, rup
                  sltu         s6, ra, t1
                  div          sp, s10, a3
                  sll          t1, t1, s1
                  xori         s10, t3, 304
                  sltiu        a1, s8, 624
                  fsgnj.s      ft8, ft0, fa4
                  fmin.s       fs6, fs1, fs2
                  ori          sp, a4, 1162
                  fsgnjx.s     fa5, fs3, ft1
                  andi         s6, t2, 1664
                  sll          s3, a7, s11
                  ori          s11, t2, -1764
                  xori         zero, t2, -1551
                  mul          s1, ra, tp
                  div          s0, s2, t4
                  srl          ra, s4, tp
                  fclass.s     a1, ft9
                  or           s10, s8, a6
                  fcvt.s.w     fs10, s7, rtz
                  ori          s6, a6, -314
                  divu         t1, a4, a6
                  nop
                  mul          s10, t5, a0
                  mulhsu       t0, a1, t4
                  slti         a7, s10, -583
                  flt.s        a5, ft9, fa3
	fsub.s	ft4, fs11, fs4, rne
                  fmax.s       fs9, ft0, fs3
                  fsub.s       fs4, fs10, fs1, rup
                  fsub.s       fa1, fa5, ft0, rup
                  fcvt.wu.s    t6, fa4, rtz
                  lui          t3, 369130
                  fsgnjx.s     fs2, fa0, ft6
                  mulh         t6, a3, t6
                  rem          t4, s10, a2
                  slli         t5, s8, 28
                  fmv.x.w      sp, fa4
                  mulhu        s9, t4, zero
                  mulhu        t0, a7, s2
                  fsgnj.s      fa4, ft1, fs5
                  fmv.w.x      fa1, s5
                  lui          s7, 738342
                  srli         a2, sp, 20
                  fmv.x.w      s9, fs5
                  sltiu        t4, s5, 800
                  mulhu        a2, t6, t2
                  mulhsu       a7, s9, a6
                  fclass.s     a1, ft0
                  fmin.s       ft10, ft3, fa3
	fcvt.s.w	ft11, t0, rne
                  remu         a6, ra, a2
                  srl          sp, s7, s5
                  mulh         gp, t1, s3
                  fcvt.wu.s    t2, ft2, rmm
                  and          s11, a1, s1
                  fmin.s       fs3, fs5, fs2
                  fsgnj.s      ft2, fs1, fa7
	fcvt.wu.s	tp, fs8, rne
                  srl          s1, s10, tp
                  srai         gp, t1, 7
                  fle.s        a4, ft10, fs3
                  mulh         a7, sp, a0
                  andi         s2, sp, -1480
                  slt          a7, s0, a4
                  srli         t2, t4, 18
                  xor          t3, gp, gp
                  remu         s5, a5, a5
                  fsgnjn.s     fa4, fa4, ft5
                  fcvt.w.s     sp, fs4, rdn
                  fsgnjn.s     fa1, ft3, fs7
                  mulhsu       s1, a6, a2
	fcvt.w.s	s5, fs8, rne
                  mul          s11, s2, t3
                  fsgnjx.s     ft11, ft11, fs1
                  srai         t4, t0, 12
                  lui          t3, 259015
                  sra          s3, t4, sp
	fcvt.wu.s	s3, ft1, rne
                  slli         a4, s7, 31
                  fcvt.s.wu    ft9, ra, rtz
                  xori         s5, t4, 639
                  fsgnjn.s     fa3, fa7, ft7
                  fmv.w.x      fs8, a3
                  fle.s        t0, fa6, fa7
                  slli         s0, s3, 13
                  slt          s7, t3, a5
	fsub.s	fs7, ft2, fs7, rne
                  slli         a2, t6, 24
                  fmv.x.w      s10, fa0
                  slti         a6, t2, 1272
                  xor          s4, s6, a3
                  addi         s7, s1, -1944
                  srai         s9, ra, 15
                  fmin.s       ft1, ft3, fa2
                  sll          a5, a0, s10
                  fcvt.s.wu    ft5, t5, rmm
                  fmv.x.w      zero, ft2
                  xor          ra, a0, s7
                  div          t0, a2, s0
                  and          a2, a7, t3
                  lui          t5, 500466
                  sub          s7, sp, gp
                  srli         a7, t3, 0
                  lui          s3, 108788
                  sub          s3, s3, a5
                  sltiu        s3, zero, 1255
                  fadd.s       fs9, fs1, fs10, rtz
                  sltiu        s10, s0, -546
                  fsgnjn.s     fs11, fa0, fs8
                  sll          gp, t0, a2
	fcvt.wu.s	t0, ft4, rne
                  fmv.x.w      s1, ft9
                  mulhsu       s0, a4, t1
                  fmv.x.w      tp, ft3
                  sltiu        a7, a0, -354
                  fmv.w.x      fs6, s10
                  divu         zero, a5, gp
                  xor          t3, gp, s6
                  ori          a7, zero, 1246
	fcvt.w.s	s4, ft3, rne
                  srli         t1, ra, 30
                  fmax.s       fs7, fa0, fs4
                  feq.s        a2, fa2, fa5
                  srl          ra, tp, s6
                  srl          t5, a7, t2
                  sll          t2, t2, t2
                  sltu         s1, s6, a3
                  slt          s5, gp, t6
                  srli         t6, t5, 28
                  mulhsu       a1, s7, sp
                  sra          a5, s10, sp
                  remu         s0, zero, sp
                  sltiu        s2, t4, -1178
                  slt          s0, s5, s9
                  xori         tp, s6, -1043
                  fmv.x.w      t1, ft8
                  div          t6, s2, a5
                  flt.s        s11, fs5, ft7
                  fmax.s       fa3, ft5, fs7
                  slli         t5, t2, 10
                  slt          t5, a4, a6
                  mulhsu       t3, s11, ra
                  mulhsu       a1, s1, a7
	fsub.s	fa5, fs11, fs11, rne
                  add          a7, s0, s9
                  div          s9, t3, a3
                  remu         gp, t3, t5
                  div          t1, s4, s8
                  remu         a6, s3, a3
                  srl          t5, s3, s5
                  fsgnjx.s     fa6, ft9, fa5
                  mulhsu       s0, a6, s8
                  nop
	fcvt.wu.s	s9, ft7, rne
                  fmax.s       fa7, ft3, fs11
                  fsub.s       ft9, fs2, ft0, rdn
                  andi         t6, t3, 1476
                  remu         s1, s2, s9
                  ori          s5, s11, 335
                  rem          s6, s2, a0
                  mulhsu       t5, sp, s5
                  rem          a5, s9, s4
                  slti         s11, t4, 1547
                  srli         a6, s3, 7
                  divu         s0, t5, s5
                  sll          s2, t6, s4
                  mulhsu       zero, s11, t4
                  add          s4, sp, sp
                  mulh         a6, a1, s2
                  slti         s0, a1, 1088
                  feq.s        t3, ft8, ft11
                  feq.s        a1, fs3, fs5
                  mul          t2, t5, a0
                  lui          t2, 48843
                  andi         a4, t3, 1680
                  nop
                  srl          s2, t1, sp
                  feq.s        s9, fs4, fa2
                  mulh         s6, a5, s8
                  fmv.w.x      fa5, tp
                  mulh         a7, s2, s4
                  fsgnj.s      ft2, fa1, fa4
                  addi         t4, a1, -1013
                  fcvt.s.wu    fs0, s7, rmm
                  fmax.s       fa3, fa0, ft6
                  srl          s1, s0, t5
                  fsgnjn.s     ft5, fs5, ft10
                  mulh         s3, a2, s5
                  fcvt.s.wu    fa5, t5, rup
                  xor          t3, t5, s0
                  sltu         ra, t1, a1
                  andi         t5, t2, -175
                  remu         a6, s6, a3
                  ori          gp, t1, 1550
                  or           a1, t5, ra
                  feq.s        s9, fa1, fa6
                  addi         s7, s5, -1075
                  fsgnjn.s     fs8, ft7, fs2
                  sra          t4, s10, s11
                  fcvt.w.s     s0, fs4, rne
                  divu         s3, a1, s9
                  fmax.s       fs5, fa2, ft7
                  fmv.w.x      fs4, t1
                  mulhu        a1, tp, gp
                  addi         a7, s0, -946
                  or           a7, t6, a3
                  remu         a4, s11, t3
                  sra          s4, s8, sp
                  fmax.s       fs1, ft2, fa3
                  fsgnjn.s     ft8, fa4, ft9
                  mul          a4, s2, s8
                  sltiu        gp, t3, 409
                  fmax.s       fa5, ft1, ft4
                  nop
                  addi         s6, t2, -945
                  srl          s10, s7, a1
                  slli         s2, t3, 12
                  fmax.s       ft7, fs8, fs3
                  mulhu        t3, zero, a4
                  sltiu        a4, gp, -633
                  fmin.s       fs2, fs1, fs11
                  fsgnj.s      ft0, fa3, ft7
                  fmax.s       fa5, ft7, fs1
                  fsgnj.s      fa5, fs8, fa3
                  mulhu        s10, t4, a4
                  sll          s0, s10, a3
                  or           s0, sp, zero
                  srai         s0, s6, 22
                  lui          s5, 705604
                  lui          s5, 658488
                  slli         gp, t3, 18
                  xor          a1, s9, ra
                  mul          a2, zero, s10
                  or           a7, s8, s5
                  add          s10, a1, a2
                  fsgnj.s      fs5, fa2, ft4
                  feq.s        a5, fa3, fs6
	fcvt.s.wu	ft7, t4, rne
                  lui          t1, 724922
                  slt          s0, a5, s9
                  sra          t4, t2, t1
                  rem          t6, a4, t4
	fcvt.wu.s	t1, fs11, rne
                  fmin.s       ft0, fa3, ft4
                  or           gp, t3, a7
                  fcvt.s.wu    fa5, s6, rmm
                  xori         a4, s4, 1652
                  fmin.s       fs7, fs6, ft11
                  fmv.w.x      fs3, gp
                  xori         s3, t2, -1865
                  fclass.s     zero, fs10
                  slti         t1, t0, -2014
                  slti         s11, s6, 1686
                  add          s1, s9, zero
                  sra          a5, gp, s9
                  fmv.w.x      fs0, a1
                  fsgnjx.s     ft5, ft8, ft10
                  sltu         gp, t0, a3
	fadd.s	fs4, ft2, ft9, rne
                  fmin.s       fa5, fs8, ft3
                  and          gp, s2, s6
                  fsgnjx.s     fs6, fa2, fa6
                  mulhu        a2, t3, s0
                  srli         s4, t0, 23
                  auipc        a2, 362757
                  sub          t3, t6, a2
                  xor          t2, t0, zero
                  fsgnjx.s     fs8, ft4, fs5
                  or           a7, a4, t0
                  xori         s2, t5, -30
                  sll          a6, a7, t0
                  add          a6, s0, t5
                  xori         s3, a4, -1279
                  feq.s        s4, fa3, fa5
                  srai         a5, a3, 7
                  remu         s0, zero, s0
                  fmv.x.w      gp, ft9
                  mulhsu       s3, t5, t4
                  fsgnjn.s     fs11, fs2, ft10
	fcvt.s.w	ft8, s10, rne
                  addi         t0, s11, 1714
                  mul          t0, a5, gp
                  sll          a7, a7, a2
                  fmin.s       ft3, fs1, fa1
                  mulhu        s0, s3, a3
                  sll          s5, s5, a0
	fcvt.w.s	a6, fs3, rne
                  fsgnj.s      ft11, ft0, fs8
                  fadd.s       ft11, fa4, fs3, rdn
                  divu         tp, s0, s2
	fcvt.wu.s	a6, fa3, rne
                  srai         s3, t5, 19
                  mulhu        s6, s9, a2
                  fsgnj.s      ft4, ft2, ft9
                  slt          s3, s9, a6
                  fsgnjn.s     ft10, ft5, fs7
                  sltu         a7, a2, a7
                  xor          t2, t2, t5
                  srl          zero, s7, t2
                  sltiu        s2, a6, -259
                  fmax.s       fs8, fa6, fs7
                  divu         t1, tp, a2
                  add          a4, t0, a1
                  sub          s9, a7, t3
                  rem          s5, s3, s4
                  fmv.x.w      t6, ft8
	fadd.s	ft4, fs11, fa3, rne
                  divu         tp, s0, tp
                  fsgnj.s      ft7, fs0, fs9
                  ori          a6, s8, 454
                  add          t6, s3, a7
                  fsgnjx.s     fa5, fs3, fs1
                  and          s9, a3, gp
                  fmax.s       fs8, fa3, fs6
                  mulhu        t2, a4, sp
                  lui          a2, 850080
                  mulhsu       s4, s6, t3
                  fadd.s       fa1, ft5, ft8, rtz
                  slt          t1, tp, t0
                  mul          t1, s6, s11
                  lui          sp, 1020788
                  mulhu        s3, a7, s3
                  or           ra, s9, t6
                  fclass.s     t6, ft4
                  lui          s2, 15335
                  andi         s5, zero, -1744
                  fcvt.s.w     fs4, s5, rtz
                  fsgnj.s      fs1, ft7, fa6
                  slli         a2, a1, 15
	fcvt.wu.s	tp, fs5, rne
                  div          t1, s9, gp
                  sra          s1, s4, tp
                  slt          a7, gp, s11
                  sltiu        sp, ra, -721
                  auipc        s9, 935086
                  srai         t3, s10, 25
                  sra          s1, t6, t4
                  sltu         tp, s6, s9
                  mulhu        s4, a3, a7
                  slli         s5, s6, 17
                  and          t4, tp, t6
                  mul          s7, s3, s9
                  mulhsu       t4, a6, t1
                  fsgnjx.s     ft0, ft10, fs2
                  fsgnjx.s     fs9, fs8, fs5
                  add          s3, t6, a4
                  sltu         ra, a1, t0
                  mulhsu       t2, s7, s4
                  sltiu        t5, s1, -1652
                  divu         s7, tp, t5
                  mulh         s6, ra, s9
                  srli         t0, s3, 5
                  feq.s        t4, ft7, fs8
                  rem          t2, s9, a5
                  addi         s5, sp, 521
                  srli         s5, s8, 21
                  sub          a5, t3, s4
                  lui          t0, 402958
	fcvt.w.s	a4, fs1, rne
                  fmin.s       fs9, fa1, ft3
                  fsgnjx.s     ft9, fa2, fa5
                  flt.s        s4, fs0, fa0
                  rem          a1, zero, sp
                  mulhu        a7, s10, t5
                  andi         zero, ra, -1279
                  mul          s9, s1, s1
                  ori          a7, s11, -1265
                  remu         s2, zero, gp
                  flt.s        t4, ft7, fs6
                  nop
                  fsgnjx.s     fa5, ft5, ft6
                  remu         sp, t0, ra
                  mulh         t1, zero, t0
                  srai         t0, s10, 22
                  and          s7, s0, sp
                  xor          t1, a5, a6
                  sra          tp, a0, s6
                  auipc        s10, 946039
                  fmv.w.x      fs4, sp
                  slli         t0, s9, 30
                  mulhsu       t4, t1, s1
                  andi         s3, a7, -934
                  fcvt.w.s     s6, fs11, rne
                  sltu         s11, s10, s3
                  nop
                  divu         t4, a6, s0
                  fsgnjx.s     ft2, ft0, fs7
                  sll          s1, s8, s6
                  srli         tp, s2, 18
                  srli         s5, s4, 19
                  fmv.w.x      fs8, tp
                  and          t2, t3, s0
                  fle.s        s4, ft10, ft2
                  srl          t0, t1, a1
                  slti         s6, s9, -842
                  ori          s6, t2, 1976
                  remu         gp, s7, a5
                  fsgnj.s      fa2, ft7, fs11
                  srli         s0, s0, 20
                  addi         a5, a3, -440
                  srli         s5, a1, 3
                  sll          t5, t1, zero
                  andi         a1, sp, -1426
                  addi         s9, s8, 312
                  lui          a5, 850794
                  sub          s7, s11, t5
                  slli         s4, a2, 4
                  sltiu        s1, a3, 1120
                  fmv.w.x      ft6, t0
                  mulhu        s0, a2, s1
                  andi         t6, t6, -1634
                  fmv.x.w      t0, fs3
	fsub.s	ft6, fs0, ft8, rne
                  sub          s3, s5, a6
                  feq.s        t1, fa7, ft9
                  sltiu        s4, s2, -17
                  slt          s2, a6, s9
	fcvt.wu.s	s5, fs4, rne
	fcvt.s.w	fa3, s8, rne
                  ori          s5, s2, -317
                  mulhsu       s11, t0, a0
                  addi         t0, zero, -978
                  lui          a6, 541616
                  remu         s4, a6, s11
                  fclass.s     s9, fa3
                  add          s10, a2, a7
                  srli         s7, a5, 2
                  remu         a5, a7, s6
                  div          ra, t3, t2
                  andi         gp, tp, -1758
                  srli         a6, t4, 0
                  mulhsu       s10, sp, s9
                  fmin.s       fs3, fa7, fa4
                  fsgnjn.s     ft9, fa2, fa2
                  slti         a2, s9, 1638
                  fmv.x.w      gp, ft9
                  mul          a7, t1, t3
                  addi         t3, s2, 1392
                  fcvt.wu.s    s1, ft8, rup
                  nop
                  slt          s5, t4, a6
                  or           s6, t5, sp
                  fmv.w.x      fs6, s10
                  mul          s2, zero, s5
                  auipc        a1, 63572
                  rem          a6, t3, s7
                  slti         a2, t3, 587
                  slt          t3, a5, s11
                  sll          sp, s10, t3
                  andi         zero, gp, 1401
                  div          s9, t0, tp
                  div          s1, ra, t4
                  slli         a6, s6, 24
                  slti         t6, zero, 1191
                  fadd.s       ft4, ft6, ft5, rmm
                  andi         ra, s9, 916
                  fcvt.w.s     s4, ft3, rtz
                  fclass.s     s4, fa6
                  addi         ra, zero, 276
                  fmin.s       fs11, ft2, fa5
                  srl          t2, gp, t1
                  slt          gp, s3, gp
                  fmin.s       fs11, fs11, fs9
                  fmax.s       fa2, fa0, fs6
                  and          t2, a2, ra
                  add          a7, s0, t5
                  slti         a1, s7, 707
                  flt.s        t3, ft9, ft8
                  nop
                  slt          tp, t1, s8
                  lui          s9, 157419
                  or           ra, s7, t2
                  xor          s1, t3, sp
                  fsgnj.s      ft8, fa2, ft9
                  srl          s5, s5, s0
                  sltu         s5, a5, sp
                  divu         a1, a7, t3
	fsub.s	fs11, ft1, ft3, rne
                  mul          s3, tp, t0
	fcvt.w.s	s10, fa0, rne
                  fclass.s     a2, fa5
                  sltu         s4, a7, a3
                  xor          s3, s2, tp
                  flt.s        s11, ft6, ft6
                  fclass.s     a1, fs8
                  srai         a6, s5, 14
                  feq.s        zero, ft10, fa5
                  sll          a6, a5, s0
                  fsgnjn.s     ft10, fs3, ft11
                  and          t3, s3, t2
                  ori          tp, ra, -1142
                  sll          t0, s11, s7
                  and          t6, s3, s10
                  srl          gp, s1, t6
                  fclass.s     ra, fa1
                  slti         s7, t6, -744
                  remu         s6, s9, ra
                  mulhu        s10, a7, t1
                  srli         t4, ra, 31
                  slti         s9, ra, 364
                  srl          a5, s4, s2
                  mulhu        s7, a3, zero
                  fmv.w.x      ft6, gp
                  mul          t0, a3, tp
                  fmax.s       fa2, ft3, ft2
                  fsgnjn.s     fa3, ft1, ft11
                  mulh         a2, s4, t2
                  div          s4, s7, gp
                  mulhsu       s10, sp, s7
                  mulhsu       s5, t0, t5
                  sra          s7, s0, t1
                  srli         t0, t5, 4
                  mulhsu       s11, a2, t1
                  mulhsu       sp, a5, a0
                  add          s1, s5, a6
                  mul          tp, a6, a7
	fcvt.w.s	s0, fs0, rne
                  fsgnj.s      fs7, fa7, ft7
                  srl          a4, s6, s4
                  div          t5, zero, sp
                  fcvt.wu.s    t0, ft1, rup
                  slli         s2, a5, 0
                  div          s6, tp, sp
                  div          tp, s3, a4
                  fclass.s     s0, ft3
                  auipc        sp, 469560
                  fcvt.s.wu    fs3, s1, rmm
                  fmv.x.w      s2, fa7
                  mul          t5, s3, a0
                  nop
	fcvt.w.s	a7, ft3, rne
                  srai         a1, gp, 25
                  flt.s        tp, fs6, fs0
                  lui          s9, 661768
                  fmax.s       fa2, fa3, fs8
                  mulhu        t3, s9, s7
                  slt          s11, s7, t2
                  mul          zero, a4, s4
                  sub          t4, s6, s11
                  remu         a2, s0, s8
                  feq.s        ra, fa5, fs8
                  auipc        t3, 952521
                  xori         t6, t3, -206
                  fmv.w.x      ft6, s8
                  lui          tp, 600298
                  fmax.s       fs10, ft11, fs0
                  rem          s10, sp, a5
                  fclass.s     a1, ft11
                  fsgnjn.s     fs5, fa0, fs10
                  mulh         a5, s6, a2
                  fsgnjx.s     fa2, fa6, fs9
                  fmin.s       ft6, fa3, fa4
	fcvt.s.w	fa1, t0, rne
                  nop
                  lui          t5, 470971
                  xor          s2, s6, t1
                  fsgnj.s      fa2, fa6, fa5
                  srli         t1, tp, 2
                  div          t4, sp, t3
                  addi         a6, gp, 1362
                  rem          s11, t6, s4
                  addi         s2, a1, 833
                  slt          tp, s6, t0
                  remu         t1, a0, t4
                  sra          a6, t1, t6
                  sltu         s6, s6, a3
	fcvt.wu.s	s11, fs3, rne
                  slli         a6, tp, 8
                  srl          tp, s10, t3
                  fcvt.s.w     ft5, s5, rmm
                  rem          s2, t5, s8
                  srli         s6, s2, 29
                  fcvt.s.wu    fa0, sp, rne
                  srai         s1, gp, 19
                  fle.s        ra, ft6, ft1
                  andi         s5, a1, 1898
                  rem          tp, s7, s10
                  mulhu        ra, t3, t6
                  andi         s10, t1, -701
                  sll          a2, s0, a4
                  fmv.x.w      s6, fa7
                  fle.s        s3, fs4, ft11
                  andi         sp, t4, 1300
                  fsgnjx.s     ft4, ft2, fs6
                  slli         a2, zero, 25
                  srl          sp, tp, t5
                  div          s4, a5, t3
                  slti         t6, s3, -1956
                  mul          s7, s4, zero
                  rem          a2, s11, s10
                  add          t4, t1, a1
                  slt          a5, s7, s6
                  xor          s11, t6, a7
                  divu         s1, a4, a5
                  mulhsu       s10, t5, s3
                  remu         s0, s2, ra
                  flt.s        a6, ft5, fs2
	fcvt.s.w	fa0, t0, rne
                  or           a6, a5, a2
                  fle.s        s10, ft4, ft4
                  ori          a5, tp, 907
                  nop
                  mul          a2, s4, s6
                  mulh         t3, s7, t1
                  andi         t5, s9, 1157
                  ori          s11, a2, -1165
                  divu         s6, s7, a1
                  mulhsu       t4, a7, s2
                  slti         s0, gp, -670
                  or           s4, s6, gp
                  andi         a6, s2, 2046
                  fmv.w.x      fa6, a2
                  fsgnjx.s     fs6, ft4, fs2
                  flt.s        s6, fa7, fs8
	fadd.s	fs2, fa5, ft1, rne
                  sra          a7, a1, s11
	fadd.s	fa1, fa3, fa6, rne
                  sra          zero, t1, t5
                  sra          t1, s5, a7
                  xori         t4, sp, -355
                  fsgnjn.s     fa4, fa1, fa0
                  sltiu        t4, sp, -577
                  xori         s4, s4, 1763
                  sltiu        t3, a6, -1293
                  fsgnjn.s     fs9, ft9, ft1
                  fsgnjx.s     fs11, fa4, fa0
                  fsgnj.s      ft7, fs2, fs6
                  feq.s        s4, fs6, fs6
                  fle.s        t6, ft11, fa5
                  div          a2, s1, a4
                  srli         gp, a5, 12
	fcvt.s.wu	fa0, zero, rne
	fcvt.wu.s	s0, fs8, rne
                  fcvt.s.w     ft1, s9, rdn
                  remu         a5, s8, t2
                  slti         s10, s3, 141
                  xori         s10, s11, 250
                  mul          t4, ra, s8
                  fsgnjn.s     fs1, ft2, fs7
                  mul          a7, a5, ra
                  addi         a2, t0, 918
                  mul          a1, ra, t2
                  addi         s4, a7, -1627
                  mulhsu       ra, s1, a4
	fcvt.w.s	s7, fs0, rne
                  sll          ra, t1, t6
                  or           t2, gp, s5
                  nop
                  fmin.s       fs6, ft6, fs7
                  fclass.s     t1, ft3
                  fle.s        sp, ft7, fs10
                  sltu         tp, s1, s2
                  sll          ra, tp, a0
                  slti         s7, a2, 1330
                  fmv.w.x      ft11, a2
                  remu         t1, s5, s1
                  fcvt.s.wu    ft4, gp, rdn
                  sltu         gp, s9, t4
                  divu         s11, sp, s3
                  sltiu        t6, t3, -1994
                  fmv.w.x      ft1, t1
                  mulh         ra, a0, a3
                  slli         s6, s8, 1
                  fmax.s       fs4, ft4, fs0
                  mul          t4, s7, s11
                  andi         a2, a0, -768
	fcvt.w.s	a5, fs5, rne
                  div          t6, t2, a4
                  srai         s4, s8, 27
                  slti         s11, t5, 1968
                  slli         sp, s1, 19
                  div          s5, a6, t5
                  ori          zero, s5, -1486
                  sub          s9, a7, zero
                  slt          s3, t0, t4
                  divu         s1, ra, s6
                  flt.s        s5, fa3, fs10
                  sltu         a4, s2, s9
                  fsgnjn.s     fa2, fa5, ft6
                  flt.s        s5, fa2, fa7
                  rem          t5, t4, s0
                  div          t4, t3, t1
                  sra          s6, a7, s6
                  addi         t0, a5, -1949
                  mul          s6, s4, t1
                  and          tp, a0, zero
                  nop
                  remu         t6, s2, s8
                  fsub.s       ft5, fa2, fa5, rmm
                  feq.s        s4, fa5, ft11
                  fmv.x.w      t6, ft7
                  andi         a2, zero, 492
                  fcvt.wu.s    zero, fa4, rmm
                  sltiu        a2, a6, -1304
                  andi         a1, s9, -1033
                  mul          t2, s10, zero
                  fclass.s     s3, ft5
	fcvt.wu.s	s10, fs0, rne
                  auipc        a6, 357792
                  fle.s        sp, fs9, fs5
                  slti         s4, s8, 857
                  fclass.s     s2, fs11
                  fle.s        t0, ft6, fa5
                  fsgnjx.s     fs2, ft4, fs8
                  srl          a7, s10, s0
                  add          s11, s6, t6
                  mulhsu       s6, a2, s8
                  srai         a2, a2, 1
                  srl          s7, s4, t4
                  xor          t2, a6, a0
                  xori         sp, t0, -1813
                  sltiu        sp, t3, -950
                  fcvt.s.w     fa0, a0, rtz
                  sra          s11, a5, tp
                  auipc        a6, 381679
                  fmax.s       fs7, ft0, fs10
                  lui          s3, 457873
                  fsgnjn.s     fa7, ft7, fs5
                  or           t1, gp, a4
	fcvt.s.w	ft1, s3, rne
                  rem          s2, t0, gp
                  rem          s4, t4, t3
                  div          t3, s9, zero
                  and          t0, s0, s1
	fadd.s	fa7, fa5, fs7, rne
                  slti         a5, t1, -444
                  ori          t2, t4, 1369
                  sub          t3, a6, t1
	fadd.s	fs9, fs11, fs0, rne
                  fsgnjx.s     ft8, fa4, fs6
                  slti         s10, t1, 1106
                  mulh         s3, tp, sp
                  addi         s11, t3, 1273
                  andi         a2, t5, -793
                  fsgnjn.s     fa6, fs1, fa3
                  fcvt.wu.s    t2, fs9, rup
	fcvt.wu.s	a5, ft5, rne
                  mulhsu       a7, a1, s3
	fcvt.w.s	s4, fa1, rne
                  slt          tp, s3, t5
                  addi         a2, ra, -344
                  fle.s        s0, ft2, fs0
                  andi         t6, zero, -1078
                  srli         s6, s11, 25
                  xori         t3, t5, 463
                  slti         zero, t2, -509
                  fmin.s       ft6, ft10, fs9
                  fcvt.wu.s    ra, ft10, rmm
                  fsgnj.s      ft10, fs1, fs4
                  srl          t6, a7, s8
                  fcvt.wu.s    a7, fs10, rmm
                  mulh         t4, a1, ra
                  fmv.x.w      s1, ft2
                  fsgnjx.s     fs9, ft0, fs4
	fsub.s	ft11, fs10, fs2, rne
                  fmin.s       fa4, fa1, ft11
                  slti         s9, s8, 717
                  srl          s11, s8, t4
                  fsub.s       fs0, ft8, fs1, rdn
                  sll          a4, gp, s7
                  fsgnjn.s     fs6, fs11, ft0
	fsub.s	ft6, fs8, fs10, rne
                  fsub.s       ft7, ft8, ft11, rne
                  auipc        t0, 895652
                  sra          s0, gp, t0
                  add          tp, s0, s8
                  fsgnj.s      fs1, ft4, ft10
                  mulhu        s7, t4, s4
                  slli         a2, gp, 5
                  mulh         s2, s0, gp
                  mulh         zero, a6, a6
                  divu         s6, s4, t3
	fcvt.s.wu	ft9, zero, rne
                  fmin.s       ft9, fa1, fs0
                  fcvt.s.wu    ft1, t0, rmm
	fsub.s	fa0, fa6, fs4, rne
                  srai         s1, ra, 2
                  fmin.s       ft0, fs8, fs2
	fcvt.s.w	fs3, s10, rne
                  fcvt.w.s     t4, ft7, rdn
                  mulhu        a6, ra, t3
                  mulh         s9, s8, a3
                  sll          a2, a1, s5
                  srai         s6, s4, 6
                  mul          t3, s0, tp
                  feq.s        s3, fa3, fa2
                  slt          t0, a4, t3
                  sltu         gp, s7, s6
	fsub.s	fa1, ft9, fs11, rne
                  lui          sp, 974891
                  srl          s10, s8, t4
                  andi         a7, s2, -1797
                  sra          s6, s5, tp
	fcvt.s.wu	fs2, t4, rne
                  andi         s9, s4, 1087
                  fclass.s     a4, fa2
	fadd.s	fs11, fs10, fs4, rne
	fcvt.s.wu	ft1, t2, rne
                  divu         s4, a7, s5
                  sra          ra, t5, s11
                  ori          s6, t2, 1440
                  flt.s        s5, fa7, fs3
                  or           s10, t0, a4
                  mulhu        t3, s3, s11
                  rem          a5, s6, t4
                  slli         zero, s4, 16
                  feq.s        s0, fa0, ft9
                  slli         s5, s3, 30
                  flt.s        zero, fs0, fa4
                  sub          t6, s2, zero
                  fmin.s       fa0, fa2, fs10
                  sra          s6, s0, s8
                  sub          a5, a3, s2
	fsub.s	ft1, ft4, fs6, rne
                  flt.s        t3, fs9, fs0
                  srl          s2, a7, s3
                  add          s4, t1, tp
                  remu         sp, s11, s4
                  andi         s2, a5, 1453
                  fadd.s       ft8, fs9, ft4, rtz
                  add          s1, gp, gp
                  ori          t4, s8, -421
                  fclass.s     s6, fs8
                  nop
                  fmv.x.w      a7, ft11
                  fsgnjx.s     fs5, fs9, ft8
                  fmax.s       ft1, fs8, fs7
                  fcvt.wu.s    t1, ft5, rup
                  slli         a2, a6, 9
                  nop
                  sub          s10, s2, a6
                  nop
                  fsgnjn.s     fs7, ft10, fs8
                  fsgnjn.s     fs1, fs6, fa1
                  fmv.x.w      s1, ft1
                  sub          t6, s0, a4
                  andi         a4, tp, 1682
                  or           a5, a7, s0
                  fle.s        t6, fs8, fs9
                  or           t4, a5, s7
                  srli         s5, t0, 10
	fcvt.s.wu	fs6, sp, rne
                  fcvt.wu.s    a5, fa1, rdn
	fcvt.w.s	tp, ft5, rne
                  fcvt.s.w     ft1, s0, rtz
                  sll          tp, s11, sp
                  add          a1, a6, s0
                  sub          t3, s0, tp
                  xori         s4, gp, -1016
                  slt          t5, a3, a4
                  fmv.w.x      ft6, t6
                  sub          a7, a2, s8
                  add          s1, s9, a1
	fcvt.w.s	tp, fs2, rne
                  fcvt.s.wu    fs7, ra, rtz
                  auipc        s1, 464782
                  mulh         s6, a0, s5
                  feq.s        s4, fa3, fs9
                  feq.s        s3, ft7, ft2
                  srl          s5, s9, a5
	fsub.s	fa3, fa5, ft2, rne
                  add          a5, a2, t3
                  or           s4, s5, t6
                  fsgnj.s      fs6, fs9, fa4
                  slli         t3, gp, 12
                  rem          t6, t3, t4
	fsub.s	fs8, fa0, fa3, rne
                  fsub.s       ft11, fs1, fa0, rtz
                  rem          s5, s8, s8
                  fmv.x.w      s7, fa2
                  slt          s2, t0, s8
                  fsgnjn.s     fs5, ft6, fs8
                  sltiu        s5, a6, 62
                  srli         s7, s1, 22
                  fcvt.wu.s    t4, fs5, rne
                  nop
                  fcvt.wu.s    zero, fs2, rup
                  fmax.s       fs0, fa1, ft0
                  rem          t6, s1, a4
                  fle.s        s7, fa7, fa1
	fcvt.s.wu	fa6, s11, rne
                  sltu         a5, a3, s9
                  fsgnjn.s     fs4, fa4, fs11
                  addi         s0, s2, -1588
                  fsgnj.s      fs2, fs10, fa5
                  flt.s        s11, fs6, fa7
                  xori         t3, t3, 1033
                  mulhu        ra, ra, s0
                  fle.s        s4, fa5, fa0
                  ori          a1, t2, 1302
                  or           t0, s0, a6
                  fsub.s       ft8, fa6, fs1, rdn
                  sltiu        s7, s7, -814
                  mulhu        t3, a0, s9
                  fmin.s       fa2, fa6, fs7
                  slti         s0, s9, -677
                  remu         s1, tp, a7
                  xori         s2, s0, -1779
                  sltu         gp, s6, a2
                  fsgnj.s      fs3, fa4, fs10
                  fcvt.w.s     zero, fs7, rtz
                  fsub.s       fa1, ft1, fa5, rdn
                  fmin.s       ft9, ft11, fs5
                  and          a4, s11, s0
                  remu         s11, t3, t1
                  divu         t2, a2, t2
	fadd.s	ft6, fs7, fs7, rne
                  rem          a7, a2, s1
                  sll          s11, sp, a5
                  divu         s11, a1, s0
                  auipc        t3, 28636
                  addi         a6, t2, -1746
                  auipc        t0, 1048307
                  and          a1, t5, gp
                  fle.s        a4, fs2, fs8
                  fsgnjx.s     fa4, fs7, fa0
                  slt          a6, s8, s11
                  slti         s11, s4, -780
                  divu         a1, a1, sp
                  srai         a4, s2, 13
                  sll          s10, zero, a2
                  mulhu        t0, s5, s4
                  nop
                  slli         a7, s5, 14
                  fmax.s       fs8, fs10, ft6
                  slt          t0, s6, a6
                  fcvt.s.w     ft8, s9, rne
                  mul          s11, a7, zero
                  fle.s        a4, ft11, ft8
                  nop
	fsub.s	ft0, ft10, ft8, rne
                  xor          a7, s0, zero
                  mulhsu       a5, a7, ra
                  lui          s9, 68896
                  srli         zero, a1, 1
                  mulh         s4, s5, a2
                  sra          s11, sp, a0
                  auipc        zero, 134677
                  fmv.x.w      s10, fs5
                  xori         s10, a0, -1864
                  fmv.x.w      s6, ft5
                  lui          t0, 277945
                  slt          s11, s3, sp
                  fsgnjx.s     fs8, ft4, ft9
                  and          a5, s2, s1
                  fsgnj.s      fa3, fs1, fa3
                  auipc        s5, 75108
                  srai         s10, t6, 8
                  fcvt.w.s     s3, ft7, rmm
                  mulhsu       s10, t4, a5
	fcvt.w.s	s10, fs9, rne
                  srai         s5, a2, 3
                  lui          t6, 173829
                  srl          s7, a0, a0
                  fsgnjx.s     ft11, fs3, fa5
                  remu         t1, gp, t4
                  fmin.s       fs5, fs4, fa0
                  srai         s4, zero, 21
                  fmax.s       fa2, fs9, fa3
                  fclass.s     a7, fs2
                  fmin.s       fs3, ft0, fs1
                  add          a2, t3, s10
                  fclass.s     s6, fs10
                  xori         t5, a2, -1457
                  xori         s9, a7, -632
                  mul          a2, a7, tp
                  or           s0, tp, t0
                  div          t5, s11, s4
                  ori          t0, a7, -985
                  fmax.s       fa4, fs11, fs8
                  fmin.s       ft2, ft3, ft11
                  nop
                  fmv.x.w      s3, fs10
                  srli         t6, a6, 21
                  or           t0, a3, t2
                  xor          s6, a2, s11
                  sll          s7, s2, a4
                  flt.s        s0, fa6, fs9
                  fsgnjx.s     ft5, fs11, fs7
                  feq.s        ra, fs2, fs7
                  auipc        sp, 461334
                  mul          zero, a7, s2
                  sltu         s10, tp, ra
                  mulhsu       s3, s1, gp
                  sra          zero, t5, s1
                  fmax.s       fs7, ft11, fs5
                  fsgnj.s      fs8, fs1, ft9
                  sra          s7, a1, a5
                  srai         ra, s10, 24
                  feq.s        t6, fs10, ft10
                  fmin.s       fs1, fs2, fa4
                  fclass.s     s3, fa6
                  remu         a2, s11, a5
                  sub          s11, a6, sp
                  fmv.x.w      s0, fs9
                  sra          t1, a5, t3
                  fclass.s     s1, fs11
                  fmax.s       ft0, fs7, fa0
                  ori          zero, gp, 1902
                  srai         gp, s3, 22
                  andi         gp, s4, 972
                  fadd.s       fa1, ft6, ft10, rup
                  fcvt.s.w     fa2, s2, rdn
                  fsub.s       fa5, ft4, fa0, rup
                  srai         t6, a3, 24
                  fsgnjx.s     fs9, fa7, fa1
                  mulhsu       a4, s0, a2
                  flt.s        s10, fa1, fa0
                  mulhu        t1, a1, a2
                  slti         a5, s8, 1223
                  fle.s        a6, fa1, ft5
                  fcvt.s.w     ft9, s0, rne
                  fsgnjx.s     fs11, ft4, fa6
                  xor          t2, a2, tp
                  feq.s        s0, ft10, ft0
                  mulhu        gp, tp, gp
                  mulh         s9, s11, gp
                  mul          s11, t0, ra
                  sll          s0, sp, t0
                  fle.s        s4, fa0, fa6
                  fle.s        s1, ft6, fa3
                  sub          t5, t3, a3
                  andi         t1, a1, -1385
                  divu         s3, s2, t4
                  fmv.x.w      a1, fa0
                  srli         a7, a1, 14
                  fsgnj.s      fa5, fa7, fa5
                  fle.s        s11, fa0, fa3
                  srai         s3, sp, 7
                  and          s1, a4, s1
                  div          s2, a5, s2
                  slt          t6, s8, a6
                  fmv.w.x      ft1, t6
                  add          a1, s11, s6
	fcvt.s.w	ft0, t6, rne
                  srli         s7, a3, 17
                  sltiu        s4, a3, -1052
                  fadd.s       fs11, fs9, fs10, rtz
                  fmv.x.w      a2, fs7
                  and          gp, s7, t6
                  fsgnj.s      ft9, fs0, ft0
                  div          gp, ra, s4
                  or           gp, s6, a4
                  fclass.s     a7, fs5
                  flt.s        tp, fs0, fs4
                  mulhu        a7, a0, s7
                  nop
	fadd.s	ft0, fa5, fa2, rne
                  fmv.w.x      fs11, a3
                  sub          s3, s7, t2
                  feq.s        s1, fs10, ft11
                  srai         s0, a4, 15
                  mul          t5, s5, s6
                  srl          t0, s4, a6
                  sub          a2, s8, t6
                  sltu         sp, gp, s1
                  slli         t6, s6, 1
                  lui          s2, 617691
                  srl          a4, a6, a1
                  ori          s7, s1, 1678
	fcvt.wu.s	t2, fs11, rne
                  auipc        a7, 83757
	fcvt.s.w	ft2, s4, rne
                  slli         a4, s7, 17
                  rem          s2, s9, a5
                  sub          s1, s6, t3
                  fle.s        t1, fs9, fs7
	fcvt.s.w	fa5, s1, rne
                  remu         s3, ra, s6
                  lui          t2, 395289
                  sltiu        s11, zero, -1046
                  flt.s        a5, fa6, fa7
                  div          s6, s2, a4
                  sltiu        s1, s9, -1707
                  slli         a1, t4, 19
                  sll          a7, s5, s2
                  fcvt.w.s     s4, fs11, rtz
                  fsgnjx.s     ft0, ft6, fa2
                  xori         t4, s6, -1127
                  nop
                  slti         t1, gp, 1517
                  fle.s        t2, fs11, fs2
                  sltiu        a6, s2, -100
                  flt.s        t0, fs0, ft1
                  feq.s        s11, fa7, ft7
                  mulhu        t6, sp, t2
                  ori          sp, zero, -450
                  fmv.x.w      a7, ft3
                  remu         sp, a2, s5
                  remu         t0, s10, s5
                  fclass.s     s1, ft5
                  fsgnjx.s     ft6, fs5, fa2
                  fmv.w.x      fa1, s11
                  add          t1, t2, a5
                  auipc        tp, 289807
                  feq.s        t0, ft11, ft5
                  addi         a4, s10, -1907
                  fcvt.s.wu    fa7, s4, rmm
                  flt.s        a1, ft2, fs10
	fcvt.w.s	ra, fa0, rne
                  fmv.w.x      fs3, t5
                  divu         t2, s7, s2
                  srl          ra, t2, a4
                  lui          t5, 114036
                  auipc        a5, 277756
                  fmax.s       fs5, fs3, fs10
                  fclass.s     a7, ft1
                  flt.s        tp, ft4, fs5
                  addi         a6, a3, 45
                  fmv.x.w      s9, fs11
                  slli         s9, s1, 11
	fcvt.w.s	tp, ft6, rne
                  fclass.s     tp, fs7
	fadd.s	fs6, fs6, ft3, rne
                  andi         s1, a2, 1310
                  div          s5, a5, s5
                  auipc        t4, 215050
                  sub          zero, s11, a1
                  addi         t5, a6, -1089
                  mulh         t2, s11, t0
                  srl          a2, a7, s1
                  slli         t0, s2, 10
                  nop
                  fcvt.s.wu    fa6, s0, rtz
                  sltiu        s9, s8, -621
                  xori         a6, a6, -1056
                  fmax.s       ft7, fa5, ft2
                  mulhsu       t6, s1, s9
                  xor          t0, s6, s7
                  and          s4, s6, ra
                  flt.s        t1, ft11, fs6
                  sub          s9, t5, a6
                  xor          ra, a2, t1
                  xori         a5, s0, 656
                  rem          s1, t5, tp
                  add          s5, a4, s2
                  mulhsu       a7, ra, t0
                  slti         s7, tp, 1150
                  flt.s        a4, ft6, fa6
                  fmin.s       ft3, ft2, ft8
                  slti         a5, zero, 879
                  sub          ra, a6, s4
                  sll          t5, t4, s11
                  auipc        t0, 119281
                  andi         a7, s10, 1787
                  fsgnjx.s     fs7, ft7, fs4
                  xor          s10, s0, a0
                  slli         t3, s2, 8
                  sra          t4, sp, a1
                  andi         t3, s11, 2014
                  sltu         a7, a7, gp
                  remu         gp, t3, zero
                  fmv.x.w      s4, fa0
                  flt.s        sp, fa1, ft1
                  remu         s7, sp, a1
                  xor          t6, a1, s8
                  remu         a2, s3, t2
                  fsgnj.s      fs10, ft9, fs0
                  fsgnj.s      fs1, fs4, fs6
                  fsgnjx.s     fs8, ft3, ft9
                  sra          s5, s4, s2
                  div          t4, sp, t6
                  flt.s        s11, fa0, fs10
                  fsgnj.s      ft3, ft5, ft9
                  div          tp, t5, t3
                  fmin.s       fs3, fa4, fa5
                  div          s6, t6, s5
                  srl          s2, t6, s8
                  sra          s6, t4, s2
	fcvt.wu.s	a6, fs9, rne
	fsub.s	fs11, fs6, fa4, rne
                  fmin.s       ft0, ft4, fa7
                  slt          zero, s0, a7
                  auipc        a6, 242002
                  flt.s        a6, ft11, fs4
	fcvt.w.s	gp, fs3, rne
                  fsub.s       fa4, fs0, ft2, rmm
                  or           ra, ra, s0
                  sltu         s3, s5, s3
	fcvt.s.wu	ft3, s9, rne
                  fcvt.w.s     t4, ft7, rne
                  mul          s6, gp, a6
                  div          s4, ra, a3
                  xori         sp, zero, -1101
                  sll          s11, a6, t6
                  fsgnjx.s     ft1, fs5, fs4
                  addi         s9, a1, 108
                  slti         s0, a6, 936
                  xor          s1, a6, a5
                  div          s11, s2, s0
                  ori          s6, t0, -1315
                  srli         s10, ra, 14
                  fmv.w.x      ft4, s10
	fcvt.w.s	s0, fa0, rne
                  sltiu        sp, t2, -1913
                  fmv.w.x      fa2, s1
                  fle.s        a7, ft11, ft7
                  fsgnjn.s     fs6, fa6, ft0
                  and          s3, t1, tp
                  xor          s9, tp, a7
	fcvt.wu.s	gp, fs3, rne
                  ori          a2, s7, 999
                  lui          s7, 560682
                  addi         s7, t5, 1475
                  xori         a4, a2, -1568
                  slti         tp, s4, -473
                  slli         s10, s6, 19
                  fsgnj.s      fa5, fs8, fs11
                  remu         t4, s8, sp
                  mulhsu       a2, s3, a4
                  fmv.x.w      s10, ft11
                  addi         t4, t6, -854
                  fsgnjn.s     ft7, ft6, fs0
                  mulhsu       zero, a3, s4
                  rem          t1, a2, t4
                  slt          t3, t4, ra
                  sra          a6, t2, sp
                  mulhsu       sp, a4, s4
                  fmin.s       ft5, fa2, fs7
                  fmv.x.w      a2, ft4
                  fmin.s       ft6, fa6, fs4
                  add          ra, sp, s2
                  fmax.s       fa6, fs5, fs8
                  div          t5, s5, s6
                  mulhu        a2, t0, a6
                  srai         t6, s5, 21
                  fmin.s       fs4, fa7, fs0
                  fle.s        s4, fs3, fs7
                  mul          s1, sp, s3
                  slti         zero, s11, -637
                  srai         t6, ra, 1
                  flt.s        t4, ft8, fs7
                  andi         s5, a0, 554
                  fclass.s     tp, fs11
                  srl          a5, t1, t1
                  fcvt.s.w     ft0, sp, rne
                  nop
                  sltu         s5, a2, t0
                  fle.s        a1, ft7, fa4
                  flt.s        t0, ft3, ft3
                  ori          s4, t5, 2033
                  xori         s9, tp, -138
                  addi         t4, a1, 1091
                  fcvt.w.s     s3, ft9, rup
                  divu         t1, a6, ra
                  sltiu        a1, a7, -847
                  sltiu        s3, s10, 1078
                  and          a5, s7, t2
                  srl          s9, s2, a1
                  fmv.x.w      t6, ft4
                  fmv.x.w      t2, ft4
                  fcvt.w.s     a2, ft10, rmm
                  fcvt.s.wu    fs2, t0, rne
                  fsgnjn.s     fs3, fa1, fs2
                  andi         zero, sp, 118
                  fmin.s       fa2, fa5, fs3
                  fmv.x.w      s10, fs2
                  ori          s9, t2, -65
                  fmv.w.x      ft9, s7
                  or           t1, t6, t1
                  fmv.x.w      s0, fs5
                  fadd.s       fs7, ft2, fs5, rmm
                  sll          t6, s1, t6
                  remu         sp, t6, t6
                  srl          sp, a3, t6
                  fmax.s       ft0, fs10, fa4
                  fsgnj.s      ft6, fa1, fs9
                  and          a7, s6, t5
                  fmin.s       fs6, fa5, fa6
                  fadd.s       ft0, fa1, fs0, rdn
                  fmv.w.x      ft1, s11
                  fsub.s       ft9, ft4, fs10, rne
                  fcvt.wu.s    s5, fa3, rmm
                  fsgnjx.s     fs0, fs7, ft0
                  fsgnjn.s     ft4, fa4, fa2
                  or           s5, s7, t4
                  remu         t4, s5, gp
	fsub.s	ft3, fs0, ft1, rne
                  sll          sp, s0, t2
                  or           a6, s5, t2
                  ori          a6, t4, 1084
                  srl          a2, a4, sp
                  fsgnj.s      ft2, fs4, fs6
                  srl          a1, s2, sp
                  slli         ra, zero, 23
                  fcvt.s.w     ft10, s1, rup
                  fmin.s       fa2, fs7, fs7
                  fclass.s     t5, ft4
                  sltu         s5, zero, zero
                  fcvt.s.w     ft9, a5, rtz
                  sltiu        s9, t4, 1180
                  add          a5, t6, t2
                  remu         a5, t5, tp
                  and          t0, t6, a2
                  xori         s7, s6, -842
                  mulhsu       a1, s3, s2
	fcvt.w.s	t4, fa4, rne
                  addi         s9, t0, 471
                  fadd.s       fs4, ft6, fs2, rtz
	fcvt.s.w	fa5, t4, rne
                  fcvt.wu.s    ra, fs7, rup
                  feq.s        s11, fs11, fs2
                  fmax.s       fs7, fa3, fs9
                  lui          zero, 160258
                  sra          s6, t5, a1
                  fsgnjx.s     ft3, fa4, fa0
                  srai         t3, s8, 29
                  add          a6, a3, s2
                  mulhu        a5, a7, zero
                  fmv.x.w      s4, fs5
                  sll          a1, tp, a5
                  fle.s        s2, fs3, fs0
                  divu         s9, s3, sp
                  fcvt.wu.s    t4, fs2, rdn
                  fsub.s       fa6, ft2, ft4, rtz
                  srl          s9, a0, a0
                  slti         s1, s0, 1696
                  srl          ra, s1, tp
	fadd.s	fs9, ft1, fa0, rne
                  or           a1, t6, a6
                  sltu         a5, s0, zero
                  andi         s0, a5, 1216
                  feq.s        t1, fa1, fs2
                  sra          sp, t0, t1
                  fmv.x.w      s0, fa3
                  fsgnj.s      ft6, fa3, fa4
                  mulhu        a5, a5, a5
                  srai         t5, a1, 24
                  sltu         a5, s7, a5
                  sltu         a5, s2, sp
                  fsgnjx.s     fa3, fs11, ft8
                  mulhu        a5, a1, gp
                  sltiu        s9, s1, 265
                  mul          t5, t0, sp
                  addi         ra, s7, 773
                  fcvt.s.w     ft10, s9, rne
                  rem          a5, t2, a6
                  fmv.w.x      fs0, a4
                  feq.s        s1, ft7, fa7
                  div          a5, s1, t2
                  fle.s        a5, ft0, fs4
                  flt.s        a5, ft0, ft4
                  fclass.s     t1, fa7
                  lui          s11, 690816
                  slti         t3, t3, 2031
                  srli         s10, t2, 20
	fadd.s	fa1, ft0, ft1, rne
                  fclass.s     a5, fs2
                  lui          s4, 717884
                  fmv.w.x      fa3, s8
                  sltu         a2, s10, s5
                  mulhu        zero, sp, ra
                  fle.s        a1, fa0, fs2
                  remu         s1, s5, s7
                  fmv.x.w      s9, fs0
                  mulhsu       s3, s10, a7
                  srl          s7, s6, a6
                  mulhsu       s3, s8, a0
                  srai         t4, a5, 3
                  srl          a5, s5, gp
                  srai         t1, s3, 15
                  add          t1, a7, a6
                  mulh         s10, s10, s2
                  mulhu        a2, a2, a0
                  remu         a4, t3, t4
                  srl          gp, tp, a6
                  fmv.x.w      s1, fs8
                  fsub.s       fs0, fs3, ft10, rup
	fadd.s	ft6, fa5, ft11, rne
                  mul          a1, t0, ra
                  divu         s9, t1, zero
	fcvt.wu.s	gp, ft9, rne
                  sll          t6, a6, t6
                  remu         s0, t4, t3
                  fsgnj.s      fa6, ft11, fa5
                  div          sp, s7, s7
	fsub.s	ft3, fa2, ft4, rne
                  mulhu        s2, s5, gp
                  nop
                  remu         zero, a0, a7
                  srli         t0, s4, 12
                  or           s11, ra, s4
	fcvt.wu.s	s1, ft4, rne
                  fmv.x.w      tp, fs6
                  ori          t4, t2, -89
                  slt          ra, s7, a4
                  addi         t3, t5, 1473
                  fcvt.s.w     fs3, sp, rtz
                  mul          s0, sp, a3
                  divu         a2, a4, t2
                  rem          a4, gp, s10
                  fle.s        t6, fa2, fs1
                  srl          s10, a6, ra
                  addi         s7, s5, 1662
                  flt.s        ra, ft2, fa6
                  srai         s1, s5, 6
                  srai         a2, s6, 18
                  fmv.x.w      gp, fa2
                  and          s9, t1, tp
                  andi         s2, a3, -1746
                  rem          t5, zero, a3
                  ori          s3, a3, 725
                  fclass.s     t6, fs8
                  mul          a1, s2, a5
                  slti         tp, t2, -370
                  xor          a1, a7, t4
                  add          s6, s10, s6
                  divu         t1, s11, gp
                  fle.s        s4, fa0, fa4
	fsub.s	fs0, fa5, fs5, rne
                  and          t1, s0, sp
                  sub          s2, s5, ra
                  ori          sp, s1, -1666
                  xor          a4, a4, t5
                  fclass.s     s0, fs6
                  add          t2, sp, s7
                  and          t1, a3, a7
                  fmax.s       ft7, ft1, fa1
                  and          s4, a5, s1
                  srli         a5, ra, 5
	fadd.s	fs11, ft8, fa1, rne
                  sra          s2, a6, t1
                  addi         s11, t5, 2014
                  xor          gp, s3, s9
                  ori          gp, zero, -382
                  feq.s        t5, fs2, fs11
                  fcvt.s.wu    fa2, sp, rmm
                  or           s2, s7, s4
                  fsgnjn.s     ft6, ft8, ft8
	fcvt.s.wu	ft6, s4, rne
                  and          s7, sp, t1
                  xor          t0, sp, s5
                  srl          t6, s8, t1
                  fle.s        t2, ft11, fa5
                  addi         s10, t0, -1741
                  sltiu        sp, a6, -1860
                  fsgnjx.s     fa4, fs6, ft0
                  auipc        s7, 941969
                  fmin.s       fa5, fa1, ft2
                  lui          t5, 620309
                  addi         a1, s7, 290
                  fclass.s     a5, ft5
                  srl          s7, ra, a7
                  srai         a2, zero, 25
                  fmv.w.x      fa2, t4
                  fsgnjn.s     ft2, fs3, fs2
	fcvt.s.w	ft6, s4, rne
                  fadd.s       ft2, fs11, fa5, rmm
                  sub          t6, ra, s9
                  srai         t0, t2, 20
                  remu         t4, gp, ra
	fcvt.s.wu	fs4, t6, rne
                  fmax.s       fs1, ft3, ft7
                  slli         s3, a2, 8
                  sra          t1, s9, a0
                  fmv.w.x      fs10, s6
                  or           s11, t4, t2
                  srli         t4, s6, 18
                  srl          s0, s8, s8
                  ori          t2, s9, 1680
                  sub          a5, sp, gp
                  fcvt.w.s     s7, ft8, rup
                  xori         t2, s9, 550
                  fcvt.s.w     fs8, t1, rmm
                  slli         t4, s9, 0
                  flt.s        t0, fa2, fa6
                  xor          a6, a6, s7
                  fclass.s     s10, fa0
                  fsgnjx.s     ft3, fa1, fs0
                  fclass.s     s5, fs7
                  fsgnj.s      ft10, fs1, ft7
                  fcvt.s.wu    fs1, a5, rup
                  rem          s4, s4, a3
                  sll          a1, sp, s4
                  div          t0, a2, t3
                  fmax.s       ft5, fs1, fa6
                  mulhsu       a4, a0, t5
                  fsgnj.s      ft8, fs4, fs7
                  div          s9, s0, s6
                  lui          t1, 596796
                  sra          t4, a3, t0
                  lui          t6, 877564
                  nop
                  divu         a6, ra, t4
                  addi         ra, t4, -309
                  or           a6, s10, a3
                  div          t0, zero, s3
                  fsgnj.s      ft4, fs7, ft0
                  mul          a5, s1, t2
                  and          t3, gp, a7
                  fmv.x.w      s6, fs10
                  feq.s        s2, ft11, ft10
                  fcvt.w.s     s2, ft2, rtz
                  sub          s9, s9, s10
	fcvt.s.w	ft10, s7, rne
                  srai         t5, t6, 0
                  fsgnjn.s     fs10, fa3, fa6
                  mul          s10, t2, a5
                  mul          gp, a1, s2
                  srai         a2, s11, 27
                  fmax.s       fs4, ft0, fa6
                  fsgnjx.s     fs4, ft1, fs5
                  lui          s11, 226465
                  slti         a7, a0, -1451
                  mulh         a1, t1, s9
                  fsgnjx.s     ft5, fs1, fs8
                  rem          t3, t2, s0
                  fsgnjx.s     fa2, fs1, fs6
                  fcvt.w.s     s0, ft2, rmm
                  or           s2, a3, ra
                  mulhsu       s10, zero, t2
                  slt          s1, s5, a1
                  srl          sp, s8, s7
                  sra          a2, a3, a7
                  fadd.s       fa5, fs6, ft8, rtz
                  fmax.s       fs9, ft0, fa3
	fsub.s	fa0, fa6, ft4, rne
	fcvt.w.s	zero, fa0, rne
                  slli         tp, gp, 27
                  srli         t2, s0, 5
                  fmax.s       fs1, ft7, fs2
                  xori         s5, s3, -652
                  fmax.s       ft9, ft4, ft11
                  ori          t3, t4, -487
                  fsub.s       ft8, fa6, fa4, rtz
                  slli         s2, t5, 19
                  feq.s        s2, ft3, fa6
                  srli         t2, a2, 1
                  add          zero, t6, t3
                  rem          t3, s0, t3
                  andi         ra, a5, -962
                  auipc        s6, 885702
                  flt.s        s10, fs6, ft4
                  fmv.x.w      t4, ft9
                  fmv.x.w      s5, fs5
                  flt.s        s10, fa1, fs9
                  slti         s6, s5, 400
                  fmax.s       fs10, fa5, fs4
                  fsgnj.s      fa2, fa6, ft4
                  fmv.x.w      t3, ft2
                  srli         sp, t5, 28
                  lui          s6, 65176
                  fadd.s       fs11, ft3, fs2, rne
                  and          t5, s3, a2
                  fsgnjx.s     fa0, fa4, ft0
                  fmv.w.x      fs1, tp
                  slti         s5, s1, -1104
                  feq.s        a7, ft1, ft6
	fadd.s	ft2, ft6, ft0, rne
                  addi         s6, t6, -569
                  xor          s1, s10, t0
                  ori          t2, s6, -321
                  sltiu        a1, a1, 1293
                  auipc        s6, 611467
                  flt.s        s0, fs10, fa0
                  xor          t2, tp, a6
                  fadd.s       fs4, fs7, fs7, rtz
                  sub          s7, ra, sp
                  fmv.x.w      t6, fs5
                  lui          s4, 568282
	fcvt.s.w	fs2, s1, rne
                  fmin.s       fs2, fa1, fs1
                  fmv.w.x      ft10, s7
                  sra          gp, ra, s8
                  andi         s9, zero, -591
                  or           s3, s3, s9
                  fsgnjx.s     ft11, ft1, fs5
	fadd.s	ft5, ft9, ft11, rne
                  divu         t4, t3, t2
                  fmv.x.w      t1, ft2
                  fmv.x.w      t1, fs3
                  srl          t1, a6, s1
                  srl          t3, a7, a4
                  fle.s        zero, fs5, fa6
                  sltu         s1, s5, s3
                  sltu         a1, s8, s9
                  lui          a6, 900302
                  srai         ra, gp, 2
                  fle.s        s0, ft11, ft11
                  mulh         s1, t5, a4
                  fsgnjx.s     fa6, fa6, ft10
                  add          t4, a7, a6
                  mulhu        s9, gp, ra
                  fcvt.wu.s    ra, ft1, rmm
                  remu         t0, s1, s5
                  or           t5, sp, t5
                  xor          t1, s7, s4
                  fsgnj.s      ft2, ft6, ft11
                  ori          s6, a4, 1059
                  fsgnjx.s     fa4, ft8, fs3
                  sltu         a6, s9, a7
                  sltiu        a1, s11, 56
                  auipc        s3, 383750
                  flt.s        a1, ft0, fs5
                  fmax.s       fs11, fa4, fs7
                  slli         s2, s3, 15
                  fle.s        s11, ft6, ft1
                  slli         a6, a4, 8
	fsub.s	fa1, ft3, fs2, rne
                  sll          s2, a2, s9
                  sra          t4, t6, a4
                  lui          t4, 838805
                  div          s0, a6, t2
                  divu         a6, s3, t2
                  andi         a4, sp, -894
                  fclass.s     s5, fa2
                  nop
                  fsgnj.s      ft8, fs5, fs2
                  fmv.x.w      s7, fs9
                  rem          ra, a3, s7
                  slti         s11, gp, -692
                  fmv.w.x      ft7, t0
                  mulhu        s11, s2, s6
                  divu         t4, t3, t4
                  fcvt.s.w     fs9, t0, rup
                  fle.s        t3, fs4, ft2
                  srl          a7, t4, a0
                  fmv.w.x      fs11, s3
                  addi         a5, s9, 1815
                  sltiu        s2, t6, -1215
                  fsgnj.s      ft11, fa2, ft3
                  and          a5, s3, ra
                  sra          t1, s10, t2
                  fle.s        t5, fs7, fs5
	fcvt.w.s	gp, fs3, rne
                  srai         s5, t5, 10
                  fcvt.s.wu    ft6, a0, rmm
                  mulhu        zero, s3, tp
                  sub          t0, a5, sp
                  slli         s5, a7, 19
                  fmv.w.x      fs2, s5
                  sra          s5, s11, tp
                  srl          t2, t3, s8
                  fcvt.s.w     ft4, zero, rdn
                  sub          t5, sp, s10
                  fsgnj.s      fa2, fs2, ft4
                  fmax.s       fs3, ft1, fa1
                  mulhu        t0, a7, t6
                  sra          a1, s10, s2
                  xor          t5, gp, t5
                  slli         t5, a3, 2
                  fadd.s       fs8, fa3, ft4, rtz
                  slt          t2, gp, t5
                  divu         t1, t5, s3
                  sltu         s4, a6, s2
                  or           t2, t3, s5
                  remu         s1, s4, a1
                  ori          t6, s3, -1747
                  fsgnjn.s     fa3, fs1, fa1
                  srl          sp, a5, a4
                  mulhsu       s4, a2, gp
	fcvt.s.w	fs3, s8, rne
                  fmv.w.x      ft11, s5
                  fclass.s     a7, ft2
                  fclass.s     s11, ft5
                  sltu         a2, a6, a6
	fcvt.w.s	s0, ft11, rne
                  nop
                  xori         s2, a2, 1260
                  sra          s5, s10, a0
                  rem          a1, a1, s4
	fcvt.s.wu	fs10, t1, rne
                  slli         t2, s5, 6
                  fsgnjx.s     ft10, fs7, ft11
                  mulhu        s11, sp, s9
                  slti         a4, s0, 1966
                  auipc        s10, 541691
                  fsgnj.s      ft3, ft4, fs0
                  addi         s2, t3, -848
                  fadd.s       fs4, ft6, fa4, rup
                  fadd.s       fs10, fs11, fa0, rmm
                  rem          ra, ra, a0
                  addi         a6, a5, 461
                  sltiu        t2, a2, -1850
                  or           s4, a6, s10
                  remu         t2, s5, s1
                  fmax.s       fs5, fa4, ft8
                  feq.s        s3, fs0, fa1
	fcvt.wu.s	t2, fs1, rne
                  fsgnj.s      fa6, ft10, ft5
                  srli         s9, zero, 22
                  srl          a5, t1, s3
                  mulh         s0, s7, s5
                  mulhsu       zero, s8, tp
                  sltu         tp, gp, t0
                  nop
                  mulhu        sp, s7, a4
                  nop
                  fmv.x.w      a1, fs0
                  mul          s10, t2, s11
                  fmin.s       fs8, ft5, fs6
                  mul          s9, a2, s8
                  fcvt.s.w     fa0, s0, rdn
                  fclass.s     a5, fa3
                  flt.s        t4, ft6, fs2
                  remu         sp, t2, gp
                  fmv.x.w      t5, fs8
                  fmin.s       fs0, ft8, fs4
                  slli         t5, s2, 8
                  fsgnj.s      ft4, ft0, fs3
                  slli         s5, t3, 4
                  mulhu        s4, t5, s2
                  fadd.s       fa0, fa3, ft4, rne
                  sub          a6, gp, t0
                  xori         gp, s8, 579
                  feq.s        s6, fa5, ft9
                  slli         s10, s6, 24
	fadd.s	fa1, fs8, fs10, rne
                  slli         t2, a1, 16
                  nop
                  slli         t6, s11, 15
                  rem          t6, s4, s0
                  mul          t3, a5, a5
                  sll          s0, a1, a0
                  fmax.s       fs4, ft0, fs4
                  or           t3, t4, s9
                  srai         s10, t6, 13
                  slt          a4, sp, zero
                  andi         a2, gp, -1235
	fsub.s	fs6, ft0, fs8, rne
	fadd.s	fa3, ft11, ft0, rne
                  slli         t5, s6, 21
                  fsgnjx.s     fa0, fa2, fa6
                  xori         a4, s3, 640
                  mulhu        t6, s3, s4
                  feq.s        s6, fs10, fs2
                  rem          s10, t6, s0
                  div          a1, s11, s10
                  flt.s        a7, ft2, fs8
                  rem          s1, s5, a6
                  and          s7, zero, a1
	fcvt.s.w	ft8, t1, rne
                  fsgnjx.s     fa4, fa5, ft9
	fcvt.s.w	fa7, t5, rne
                  auipc        a4, 423200
                  ori          t0, sp, 1332
                  and          a2, tp, tp
                  fmv.w.x      fs9, a4
                  mulhsu       t3, s2, s2
                  rem          t6, s2, ra
                  slli         a2, s4, 0
                  mul          s10, s5, a6
                  remu         a7, a2, a6
                  mulh         s5, tp, s5
                  fmv.x.w      zero, ft2
                  flt.s        t2, fa1, fa0
                  slti         t6, a3, 859
                  srli         zero, s1, 13
                  mulhu        s9, s9, s0
                  slti         a4, ra, -146
                  auipc        s3, 994695
                  flt.s        gp, fs10, ft6
                  fclass.s     s4, fa5
                  ori          t3, t1, -953
                  lui          s3, 175711
                  flt.s        s7, fa4, fs7
	fcvt.s.w	ft1, a4, rne
                  srl          tp, sp, t0
                  sub          a5, s8, a7
                  flt.s        a5, fa6, fs7
                  fsub.s       fa6, fa1, ft7, rup
                  fmv.w.x      ft9, zero
                  feq.s        zero, fs7, fa4
                  xori         t1, s7, 1064
                  slli         s4, s11, 2
                  sltiu        s2, s1, 1291
                  fsgnjn.s     ft1, ft1, fs7
                  fle.s        a6, fs7, fs7
                  rem          t6, t1, t1
                  addi         ra, a1, 1387
                  fclass.s     t2, ft5
                  srli         ra, s0, 27
                  or           a5, tp, a3
                  sra          s0, s1, a3
                  sltiu        s10, ra, -1621
	fcvt.s.w	fs2, a1, rne
                  feq.s        a2, ft10, fs3
                  sltu         a4, t1, zero
                  ori          ra, a6, 1789
                  fclass.s     s3, ft9
                  sll          gp, a5, gp
                  ori          t4, a1, -5
                  fadd.s       fa2, fs0, fs5, rne
                  or           gp, s7, s0
                  andi         s6, t2, 922
                  mulhu        sp, s10, t1
                  fmv.w.x      fa3, s11
                  fmax.s       fs8, fs3, ft6
                  fle.s        t1, fs6, fs11
	fcvt.s.w	fs0, a5, rne
                  fmin.s       fa2, fs10, ft5
                  or           tp, s2, a0
                  and          s10, s4, a6
	fcvt.s.w	ft1, a2, rne
                  andi         t0, a7, 537
                  sub          sp, s11, tp
                  fclass.s     a2, ft3
                  fclass.s     s7, ft8
                  srl          s7, t0, s11
                  add          a7, ra, a4
                  sub          s1, t4, a1
                  srl          t6, t3, s2
                  srai         ra, t3, 20
                  and          a7, sp, s11
                  or           t2, s4, a4
	fcvt.w.s	s0, fa4, rne
                  andi         s1, s9, -444
                  ori          s6, t1, -1319
                  flt.s        t4, ft11, ft4
	fsub.s	ft11, fs7, fs6, rne
                  lui          a4, 95340
                  divu         a2, s0, a4
                  fcvt.s.wu    ft11, s7, rtz
	fcvt.s.w	fa1, t2, rne
                  mul          a1, t0, a4
                  slli         a5, s10, 2
	fcvt.s.w	fa4, s8, rne
                  fsgnjn.s     ft8, ft11, ft4
                  feq.s        s2, fa1, ft4
                  sltu         tp, s9, s0
                  fmin.s       fs11, fs4, ft2
                  fsub.s       fs8, fa6, fa7, rdn
                  sra          t4, s2, s1
                  flt.s        t0, ft8, ft11
                  fadd.s       ft3, ft9, ft9, rup
                  nop
                  flt.s        s7, fa3, ft2
	fsub.s	fa0, ft9, fs2, rne
                  slt          s9, gp, a4
                  fmv.w.x      ft7, gp
                  lui          s5, 349129
                  sltu         a6, t5, s10
                  fmv.x.w      s5, ft1
                  fmin.s       fs5, fs7, fs1
	fsub.s	ft5, ft5, fa1, rne
                  fclass.s     t2, ft5
                  fmv.w.x      fs0, s2
                  slti         t4, t3, -302
                  fclass.s     t5, ft2
                  fcvt.s.wu    fs2, a1, rmm
                  ori          s1, s0, 1439
                  nop
                  mulhsu       s0, s2, s7
                  slti         a6, a7, -176
                  srl          a1, s7, s5
                  feq.s        t5, fa6, fa0
                  slt          a7, t4, tp
	fcvt.s.wu	fs4, s3, rne
                  mul          t0, sp, t3
                  sll          t0, t3, a1
                  sra          a2, s0, ra
                  fsgnjx.s     fa6, ft2, ft6
                  fmv.w.x      ft5, sp
                  feq.s        a7, fs2, ft2
                  fmv.w.x      ft8, t4
                  remu         tp, a5, a7
                  slt          tp, s1, s10
                  and          s0, tp, zero
	fcvt.s.w	fa0, s9, rne
                  fsub.s       ft6, fa6, ft9, rdn
                  or           tp, a0, ra
                  sll          t2, s8, s10
	fsub.s	fs8, fs8, fs0, rne
                  fmv.x.w      a5, fs11
	fcvt.s.wu	ft11, t4, rne
                  lui          a6, 708247
                  fcvt.wu.s    s4, ft3, rup
                  mulhu        s0, t3, gp
                  fsgnjn.s     fs4, fs6, fs10
                  mul          s1, t0, s1
                  slli         gp, gp, 29
                  mulh         s4, t3, s0
                  fcvt.w.s     s6, fs11, rtz
                  addi         a1, s10, 1257
                  and          t0, t1, t3
	fsub.s	ft6, ft3, fa2, rne
                  fle.s        t0, fa2, ft9
                  xori         a6, s10, 1381
                  addi         a2, s7, -605
	fadd.s	fs11, ft0, ft10, rne
	fcvt.w.s	s11, fa4, rne
                  rem          s6, s1, t6
                  fmin.s       fs10, fa7, ft10
                  mulhu        a6, s3, t1
                  sltiu        a4, a1, -830
                  rem          t5, s10, s7
                  fmax.s       fa0, ft3, fa4
                  feq.s        s1, ft5, ft6
                  fclass.s     t1, ft6
                  sra          t2, a5, a6
                  sub          a1, s9, a0
                  fsub.s       fa0, fa0, fs8, rtz
                  nop
                  fmin.s       ft7, fa6, ft5
                  lui          s9, 183070
                  fmv.w.x      ft6, zero
                  addi         s9, s3, -1780
                  addi         a6, t1, 1847
                  mulhsu       s7, s7, t4
                  sltu         t0, s10, t1
                  mulhu        s6, s4, gp
                  slli         s4, s2, 1
                  or           a5, t6, t1
                  fcvt.wu.s    a7, fa0, rne
                  fcvt.w.s     zero, fa7, rdn
                  srl          t6, a4, s10
                  or           s2, t6, s0
                  fle.s        s10, ft8, ft6
	fadd.s	fs8, fa5, fs9, rne
                  srai         zero, a2, 23
                  mulhu        s1, s7, s11
                  fsgnjx.s     fa6, fa1, ft5
                  srai         s3, s4, 17
                  fsub.s       fs5, fs2, fs11, rne
                  xor          t5, s5, tp
                  auipc        s9, 242022
                  srli         s4, s10, 6
                  ori          a5, a7, -572
                  xor          s11, s5, t4
                  fmv.x.w      t5, fs8
                  sra          s6, sp, a0
                  mulhu        a6, sp, a1
                  slli         s6, t6, 18
                  mul          s7, a0, zero
                  sub          t3, t1, zero
                  feq.s        s7, ft6, fa0
                  fle.s        a5, fa5, fa1
	fadd.s	fs2, fa6, ft4, rne
                  xori         a7, a7, -2005
                  or           a5, tp, a3
                  slt          gp, t2, s2
	fcvt.wu.s	a2, fa7, rne
                  xori         s0, zero, 2
                  slti         ra, sp, -1848
                  fcvt.s.w     ft2, t4, rne
                  xor          a6, s8, a6
                  fsgnjx.s     fs1, fa6, ft2
                  fadd.s       fa5, fs1, fs9, rmm
                  rem          s9, zero, s5
                  fsgnjn.s     ft9, ft0, fa7
                  sltiu        s11, s4, 833
                  flt.s        t1, fs7, fs1
                  divu         a7, a6, t1
                  andi         s10, a6, -1950
                  remu         s6, a1, s7
                  ori          a4, a7, 50
                  srl          s1, a2, gp
                  divu         sp, t1, sp
                  and          s11, a5, a1
                  andi         s1, t2, 1496
                  srli         a1, t3, 25
                  sra          a6, s4, t4
                  fmin.s       fa1, ft11, fs10
                  ori          a7, s2, 270
                  sltiu        s4, a4, -796
                  add          s4, a1, s9
                  feq.s        t5, ft7, ft2
                  fmv.w.x      ft4, s0
                  sra          s1, a0, a1
                  fcvt.wu.s    s4, fs8, rmm
                  flt.s        zero, ft7, fs11
                  nop
                  fmin.s       fs8, fa6, fa7
                  lui          s1, 529927
                  ori          s7, a3, -1578
                  mulh         a6, s0, a7
	fcvt.w.s	gp, fs7, rne
                  mulh         t3, a6, a0
                  fsgnjx.s     fs1, ft2, ft6
                  remu         t6, s7, gp
                  andi         s3, s1, -1886
                  slli         t1, ra, 5
                  fsub.s       ft8, ft11, fa3, rmm
                  addi         t1, s7, -745
                  fmin.s       ft0, ft2, fs7
                  fcvt.w.s     t3, ft3, rup
                  mulhu        s11, gp, s7
                  remu         s7, a2, s9
                  addi         t0, s11, 1058
                  xor          a7, s5, s3
                  fcvt.s.wu    fs11, s1, rtz
	fcvt.s.w	ft1, s2, rne
                  fle.s        s7, fa4, fs10
                  auipc        ra, 474676
                  mulhsu       s1, t4, t2
	fcvt.s.wu	ft4, t0, rne
                  srl          t1, s2, s10
                  sub          s2, s9, a2
                  sll          s2, tp, t1
	fcvt.s.wu	fa0, t6, rne
                  remu         t2, a2, s7
                  mulhsu       t4, tp, a6
                  fmin.s       ft3, fa0, fa4
                  ori          t6, s10, 835
                  divu         t6, a1, s4
                  srli         t0, t3, 2
                  nop
                  sltu         t6, s4, s11
                  mulh         t3, a1, s8
                  auipc        a1, 148039
                  fsgnjx.s     fa4, fa6, fs9
                  flt.s        a7, fs3, ft3
                  fmv.x.w      s1, fs6
	fadd.s	ft1, fa4, ft9, rne
                  sltu         s3, gp, t1
                  sll          t1, t0, s10
                  slti         a6, a4, 1764
                  slli         tp, t4, 18
                  nop
                  lui          a4, 1015910
                  mul          s9, s10, a5
	fcvt.wu.s	t5, fa2, rne
                  mulhu        sp, sp, s0
                  fclass.s     s5, ft9
                  xor          sp, a7, t5
                  srl          a7, s7, a4
                  fsgnj.s      fa2, fa4, ft4
                  feq.s        a6, fs1, fs4
                  fle.s        a6, ft6, fa1
                  lui          s3, 319086
                  divu         a1, t4, gp
                  feq.s        a5, fa3, fa4
                  xor          a7, gp, s6
                  addi         tp, sp, -135
                  mulhu        s5, t3, a7
                  or           s1, a2, t1
                  fclass.s     a7, ft0
                  xor          a6, a4, t4
                  fmin.s       fa1, fs8, ft1
                  feq.s        a4, fs5, ft0
                  fcvt.w.s     s11, fs7, rne
                  add          s1, t0, a7
	fcvt.s.wu	ft2, s0, rne
                  fsgnjx.s     fa7, fa6, ft7
	fcvt.s.w	fa5, a3, rne
                  xori         t1, t1, -467
                  mulh         a4, ra, t5
	fadd.s	fs6, ft5, ft0, rne
	fadd.s	fa5, ft0, fa5, rne
	fadd.s	fs2, fs4, fs5, rne
                  andi         t5, ra, 446
                  auipc        a5, 951639
	fcvt.wu.s	sp, fa2, rne
                  sra          t4, s2, ra
                  lui          t1, 714381
                  andi         t1, s0, -1689
                  fle.s        s11, ft1, fs6
	fsub.s	ft9, fs11, fa1, rne
                  auipc        a2, 551011
                  sra          s2, s9, t5
                  mulh         a1, s1, sp
                  fle.s        s3, fa3, ft10
                  fmv.x.w      s6, ft11
                  andi         s0, t6, -1552
                  slli         s5, tp, 19
                  fmv.w.x      fa4, a7
                  or           s7, s10, s4
                  lui          t3, 118331
                  srai         sp, s8, 20
                  auipc        t2, 648075
                  fle.s        s10, fs5, fa7
                  fle.s        t2, fs7, ft6
                  ori          s1, s9, -725
                  mulhsu       s0, s2, ra
                  add          a6, t1, a4
                  nop
	fsub.s	ft2, fa6, fa6, rne
                  fle.s        a6, ft5, ft6
                  fmv.x.w      a6, ft9
                  add          s5, s3, a5
                  xor          t3, a3, tp
                  sub          s5, t5, s8
                  slt          sp, t0, t3
                  rem          t4, t3, s3
                  mulhu        a7, a3, a2
                  fsgnjx.s     fa7, ft2, fs7
                  nop
                  sltiu        s3, t4, 803
                  fsgnjn.s     fs4, fa1, fa1
                  srli         s3, t4, 16
                  slt          s9, s0, zero
                  addi         s1, t2, -1714
                  lui          s0, 821666
                  fmv.w.x      fs11, t4
                  divu         gp, t1, tp
	fadd.s	ft2, fa3, fs3, rne
                  fmv.x.w      s7, fa6
                  fmv.x.w      s9, fs3
                  srli         t5, t2, 20
                  fsgnj.s      fs7, ft1, fs6
                  mulhsu       s5, s10, s10
	fcvt.s.wu	fs4, t0, rne
                  srai         t1, s0, 23
                  slti         a7, s5, -256
                  srai         zero, s2, 10
                  slti         a4, gp, 1843
                  feq.s        sp, ft5, fa4
                  fclass.s     s10, ft7
                  fmin.s       fa3, fa1, fs3
                  fsgnj.s      fs7, ft9, fa1
                  fadd.s       ft6, fs6, fs2, rne
                  srli         s4, sp, 21
                  srl          a2, s11, sp
                  fcvt.wu.s    s11, fa3, rup
                  add          s9, a1, s6
                  fsgnj.s      ft2, fs3, fs4
                  fle.s        ra, fa5, ft5
                  lui          t6, 494299
                  fsgnjx.s     fa5, fs9, ft7
                  rem          tp, s6, s4
                  nop
                  mul          s10, a4, s10
                  slli         s10, s9, 18
                  mulhsu       a1, t4, t3
                  fmv.x.w      s9, fs3
                  divu         a4, s8, s11
                  fclass.s     s3, ft7
                  fcvt.w.s     t6, ft7, rmm
	fcvt.s.w	ft2, a0, rne
                  fcvt.w.s     a1, ft5, rmm
                  slt          a7, tp, s5
                  sltu         s11, s6, t3
                  addi         s6, s10, -1956
                  rem          a2, tp, s4
                  fmax.s       ft10, fs4, fs4
                  rem          zero, a4, a0
                  slt          t6, s10, a2
                  divu         a5, s10, s11
                  feq.s        sp, fs6, fs2
                  or           t1, a1, t1
                  slt          s1, a6, s10
                  sltu         gp, a6, t0
                  slt          a5, t6, t2
                  add          t0, a4, a2
                  mul          s5, t3, a7
                  flt.s        t5, ft8, ft7
                  nop
                  fmax.s       ft0, ft5, fs5
                  divu         t4, t0, a6
                  add          t6, s3, a3
	fcvt.s.w	ft0, t2, rne
                  and          s7, s7, ra
                  mulh         s4, s8, a7
                  slti         t3, s5, -1158
                  xori         s2, tp, 1250
                  mulhsu       sp, a1, a7
                  slli         s4, s7, 6
                  fsgnjn.s     fa5, fa5, fa6
                  rem          s6, ra, s0
                  feq.s        s0, fs6, fa6
                  addi         a4, t5, 727
                  xor          s11, t1, s9
                  lui          s3, 377030
                  sub          gp, a0, tp
                  fsgnjn.s     fa4, ft2, fa7
                  div          t3, tp, s11
                  lui          t4, 447848
                  add          t1, t1, s9
                  feq.s        t0, ft9, fs6
                  andi         t0, ra, -520
                  fclass.s     s0, ft10
                  lui          s7, 570923
                  add          s3, a7, ra
                  mulh         s5, s3, s10
                  xori         s9, a1, -914
                  fadd.s       fs8, ft0, ft8, rdn
                  and          s2, zero, t6
                  slli         a4, s0, 27
                  andi         t4, t6, -142
                  xori         tp, tp, 377
                  slli         s3, t2, 4
                  sub          t5, t6, t3
                  divu         s5, t5, s5
                  remu         gp, t3, t1
                  sltu         s9, s0, s7
                  srli         t0, t0, 29
                  fsub.s       ft2, fa1, ft0, rdn
                  remu         zero, gp, a5
                  add          ra, a1, t6
                  xor          a4, t2, s10
                  fcvt.s.w     ft9, a0, rup
                  sll          gp, s7, a7
                  flt.s        s11, fs2, ft3
                  sll          s0, s11, s10
                  feq.s        s0, ft3, fs10
                  div          s10, a3, s3
                  and          t2, t1, a5
                  fsgnj.s      ft11, ft11, fs3
                  slt          s1, s0, t0
                  mulhu        t1, a1, a4
                  srl          sp, s9, s2
                  xori         s6, t3, -1325
                  feq.s        sp, fs8, ft7
	fcvt.s.w	fs3, a6, rne
	fcvt.wu.s	s5, ft7, rne
                  fsgnjx.s     fs7, ft4, fs10
                  slli         s9, s2, 11
                  mulh         t2, s4, s7
                  slti         s6, sp, -1977
                  sltu         a2, a4, s4
	fcvt.w.s	a6, fa7, rne
                  mulhsu       s11, s6, tp
                  sll          t2, ra, t0
                  srli         a4, s6, 23
                  mulhu        gp, a3, sp
                  mulh         t5, a2, ra
                  div          a7, s6, sp
                  fmin.s       ft3, fs2, fs8
                  srai         t1, a7, 22
                  ori          t2, t1, -1803
                  slt          gp, s3, s6
                  rem          gp, gp, s4
                  auipc        s11, 1032431
                  slt          s11, zero, s5
                  remu         t0, a5, gp
                  slti         s5, s5, 1047
                  fmax.s       ft1, ft3, fs5
                  ori          tp, s3, -57
                  slt          t5, t5, a7
                  fadd.s       fs4, ft10, ft3, rtz
                  fle.s        s1, fa3, fs3
                  fle.s        s10, fs3, fa0
                  slt          t2, s9, s8
                  srli         s3, a6, 27
	fadd.s	fa5, fa7, ft6, rne
                  slt          s7, s2, s4
                  divu         s1, t5, a5
                  flt.s        s0, fs6, ft10
                  fsgnj.s      ft9, fs8, fs5
                  fsgnjn.s     ft10, fs5, fa4
	fcvt.s.w	fs0, a3, rne
                  fmin.s       fs10, fs0, ft1
                  flt.s        a2, fs2, ft10
                  fmv.x.w      s5, fs5
                  srl          tp, s10, t6
                  flt.s        t3, ft0, fs10
                  mulh         sp, a0, a7
                  addi         s5, s2, -2047
                  add          s10, t6, a3
                  mulhsu       tp, gp, a0
                  fcvt.wu.s    s4, ft5, rmm
                  addi         a4, s10, -1008
                  mulhu        ra, tp, t4
                  fmv.x.w      t1, fs6
                  flt.s        s1, fs3, ft8
                  srli         a4, a5, 1
                  and          zero, t4, a1
                  sll          tp, a5, zero
                  fsgnjx.s     fa6, fa1, fa4
                  fle.s        sp, ft4, fs8
                  srli         s3, a1, 20
                  addi         sp, s3, 1949
	fcvt.w.s	sp, ft5, rne
                  fmv.w.x      ft6, a4
                  fclass.s     a7, ft2
                  rem          s1, a6, a6
	fcvt.w.s	zero, ft4, rne
                  addi         t1, s6, 1749
                  fle.s        sp, fs4, fs8
                  flt.s        s11, fs7, fs2
	fcvt.w.s	s0, fs6, rne
                  remu         s10, t4, t1
                  mul          a1, a6, t2
                  remu         t5, zero, s1
                  andi         s0, a4, -1120
                  srl          s5, t3, tp
                  fsub.s       fs0, fs6, fs0, rmm
                  divu         s6, t6, t2
                  mulhsu       t0, s8, gp
                  mulh         gp, a7, s11
                  add          t4, s11, a3
                  ori          s9, s2, 151
                  fsgnjx.s     ft9, ft1, fs1
                  srli         a2, zero, 10
                  feq.s        t2, fa2, ft7
                  auipc        s5, 20168
                  sub          gp, a4, s4
                  fcvt.w.s     gp, ft8, rtz
                  flt.s        t4, ft8, fs11
                  srai         s11, s6, 7
                  fcvt.wu.s    gp, fa7, rmm
                  mulhu        a1, s0, t5
                  xori         t3, a5, 1872
                  nop
                  fsgnj.s      fa4, fs2, fa7
                  rem          s2, a3, t3
                  auipc        t4, 1030648
                  mulhsu       s9, s10, s7
                  xori         t1, ra, -1292
                  slti         s4, a1, 1871
                  mulhu        s6, zero, a4
                  mulhu        s9, tp, t2
                  div          tp, t6, sp
                  andi         a2, sp, 239
	fcvt.s.wu	fa1, a2, rne
                  mulh         ra, t6, t2
                  feq.s        t0, fa0, ft0
                  fsgnjn.s     fs7, fs9, fs7
                  or           t5, t4, s7
	fcvt.s.w	ft3, a3, rne
                  sltu         gp, s8, a1
                  sltu         ra, a4, s3
                  addi         a5, s3, -879
                  rem          t2, s1, a7
                  add          a7, a6, a4
                  xori         s10, t3, 119
                  rem          s7, s9, a5
                  fmv.x.w      a6, fa3
                  mulhu        gp, t6, s8
                  srai         a6, a0, 26
                  or           s5, t6, s7
                  fmv.x.w      a6, fa3
                  fsgnjx.s     fa0, fs1, ft0
                  fclass.s     t3, fa1
                  fcvt.s.w     ft6, t0, rmm
                  fmv.x.w      s7, ft0
                  fmin.s       fa3, ft0, fa3
                  fmv.w.x      fa4, a2
                  sub          ra, s5, s11
                  rem          s7, s1, s9
                  fsgnjx.s     fa0, fs0, fa1
                  mulhsu       t2, s5, s10
                  sll          t6, t5, s7
                  flt.s        t6, ft7, fs2
                  srai         gp, s8, 0
                  sll          s4, a2, a5
                  sra          s4, a2, s4
                  feq.s        s2, fs2, ft3
                  fsub.s       fs2, fa4, ft2, rmm
                  div          tp, t3, gp
                  div          s5, t6, ra
                  rem          s4, t4, t5
                  nop
                  div          s6, zero, a5
                  auipc        s1, 790074
                  fsgnjn.s     fa5, ft10, fs5
                  or           t2, t4, a3
                  mul          s7, a6, a2
                  sltiu        s10, gp, -210
                  fsgnjn.s     fs2, ft10, fs8
                  srli         s0, a6, 29
                  xori         a2, s2, 60
                  divu         s3, t3, a5
                  mulh         ra, s11, s5
                  mul          t2, s6, a6
                  fmv.x.w      a1, fs0
                  rem          a1, t6, s8
                  mulh         a1, t4, a6
                  sub          t6, a2, a7
                  fmin.s       fs2, fs0, fa0
	fsub.s	ft1, fa4, fs11, rne
                  fmv.x.w      t4, ft1
                  xori         gp, t2, 913
                  srl          a7, tp, t6
                  fsgnjx.s     ft11, ft11, fs5
                  fsub.s       ft11, fs0, fs3, rtz
                  slli         gp, t6, 1
	fcvt.s.w	fs9, a0, rne
                  fsub.s       ft10, fa4, ft5, rne
                  ori          zero, t6, 1056
                  add          t6, a0, tp
                  sltu         tp, s9, s5
                  add          s6, zero, ra
                  sltiu        s0, t4, -1834
                  sra          s6, a7, s2
                  feq.s        s0, ft10, ft0
                  sra          a7, a0, a4
                  fsgnjn.s     fs6, fs7, ft9
                  addi         s11, t6, -745
                  mulhsu       a2, a6, sp
                  remu         s1, t3, t5
                  xori         t2, s5, 929
                  remu         s4, ra, s5
                  fle.s        tp, fs0, fs1
                  fsgnjn.s     fs6, fs1, fs1
	fadd.s	fs1, fa2, fa1, rne
                  sltu         zero, s11, s7
                  mulhsu       a7, a6, t6
                  fmax.s       fs8, fa7, fa4
                  nop
                  divu         t5, a2, t3
                  sltu         s11, a0, a0
                  auipc        s2, 1020535
                  mulh         t1, tp, s5
                  slli         s1, s8, 26
                  or           s2, s5, a3
                  lui          gp, 131190
                  xor          a1, t0, a4
                  fcvt.s.w     ft1, s3, rtz
                  auipc        zero, 247977
                  ori          t0, s9, 764
                  fclass.s     s3, fs1
	fcvt.wu.s	a2, fa6, rne
                  fmv.x.w      a6, ft4
                  fsgnj.s      fa3, fs5, fa0
                  and          s11, t3, t6
                  mulh         t0, t1, a4
                  auipc        a7, 1034372
                  auipc        a7, 755411
                  div          t3, s11, t3
                  slt          tp, s3, s0
                  fmax.s       fs1, ft11, fs5
                  divu         t4, t3, a7
                  mul          a5, s11, sp
                  auipc        t0, 210933
                  fsgnj.s      ft2, ft10, fs10
                  sub          s10, s7, t3
                  fsub.s       fs2, ft5, ft7, rup
                  fmv.x.w      t2, ft9
                  fsgnjx.s     ft11, fs6, fs10
                  slti         zero, t3, 1747
                  remu         t1, t4, t2
                  srai         s2, s3, 10
                  nop
                  nop
                  add          s7, a1, s7
                  srai         s0, s10, 19
                  fle.s        a4, fa4, ft8
                  srli         ra, a6, 0
                  fmax.s       ft8, ft4, ft5
                  fsgnjx.s     ft1, fa5, ft9
                  and          s7, s8, t5
                  slt          ra, t1, s1
                  mulhu        t4, t1, t5
	fcvt.wu.s	a2, fs5, rne
                  andi         s2, t3, 654
                  ori          a5, ra, 348
                  or           a5, t3, ra
                  feq.s        tp, fa5, fs6
                  srl          ra, t3, a7
                  sub          s2, s8, s4
                  mulhsu       s0, sp, gp
                  mulhsu       t5, a5, a3
                  fcvt.s.wu    ft6, a2, rtz
                  addi         s1, s0, -763
                  mul          gp, a5, a7
                  fsgnjx.s     fs7, fs4, fs1
                  fsgnj.s      fs10, fs7, fa2
                  mulhsu       t4, t0, t1
                  auipc        gp, 213669
                  fcvt.s.wu    fa6, tp, rtz
	fsub.s	fa5, fa1, ft6, rne
                  fsgnj.s      ft10, ft0, ft10
                  slli         sp, a3, 16
	fcvt.s.w	ft10, a3, rne
                  div          t0, a5, t4
                  slti         s3, t4, -271
                  remu         sp, a5, sp
                  sub          tp, a3, s3
                  srli         t3, s8, 4
                  mul          a2, a5, a2
                  slt          a1, tp, a0
	fcvt.s.w	ft9, a5, rne
	fcvt.wu.s	s0, fs0, rne
                  slt          a2, a0, a2
                  div          gp, s7, a7
                  lui          s11, 345404
                  xori         t2, s6, -1161
	fadd.s	fa6, fs2, ft3, rne
                  remu         a7, s10, t1
                  fsgnjn.s     fs11, fs0, ft3
                  add          t0, a7, ra
                  rem          t1, s0, s11
                  sltu         t0, s8, s2
                  and          s0, s1, s3
                  srli         s4, s6, 19
                  fsgnjn.s     fs4, fs11, fa0
                  fmv.x.w      s4, fs0
                  ori          t1, s1, -1780
                  fcvt.w.s     a7, fs3, rdn
                  flt.s        t1, fa0, fa3
                  slt          t1, t5, s8
                  fcvt.s.w     fs5, a5, rne
                  mulh         s6, s8, s2
                  fsub.s       fs1, fa3, fs0, rup
	fcvt.s.w	ft4, s2, rne
	fcvt.s.w	fa5, s3, rne
                  remu         s6, a5, s1
                  fcvt.wu.s    s7, ft10, rmm
                  rem          s7, gp, s6
                  srai         t6, s10, 17
                  sub          t2, a3, zero
                  srl          s5, t4, tp
                  srai         s2, s7, 13
                  lui          s0, 649990
                  fsgnjx.s     ft5, fs10, fs5
                  div          t5, tp, t0
                  and          sp, s1, s10
                  sltiu        s11, t2, -1276
                  auipc        t5, 438057
                  srl          a2, a1, a3
                  fadd.s       ft8, fs0, fa3, rmm
                  fmax.s       fa2, fa0, ft4
                  ori          t0, a7, -1656
                  feq.s        s2, fa3, ft5
                  fmax.s       fs2, fa0, fs0
                  lui          s10, 982011
                  auipc        s7, 667705
                  divu         t4, a6, gp
                  ori          a7, a7, 1431
                  or           t5, t1, a0
                  fcvt.s.w     ft11, s2, rmm
                  ori          a6, t2, 545
                  nop
                  sub          a5, zero, s0
	fcvt.wu.s	zero, fs4, rne
                  divu         a4, t3, s3
                  flt.s        ra, fs2, ft4
                  srai         t0, s3, 4
                  sll          t5, s4, zero
                  fcvt.w.s     s11, fa6, rtz
                  xori         t5, a3, 41
                  fsgnj.s      fs9, fa1, fs6
                  slti         s6, a4, 1109
                  rem          s5, a2, a2
                  fclass.s     s1, ft9
                  sra          t6, t2, s9
                  fmv.w.x      fa5, a2
                  rem          t0, a0, a3
                  mul          s1, s11, s11
                  fmv.w.x      fa6, s11
                  auipc        a6, 844309
                  fsgnjx.s     ft9, ft2, ft11
	fcvt.s.w	fa5, s10, rne
                  addi         a2, t0, 1114
                  fle.s        s4, fa1, fs9
                  mulhsu       s7, gp, s9
                  or           s7, ra, s1
	fcvt.s.wu	fs7, s10, rne
                  fmin.s       ft2, fs3, fs7
	fcvt.s.w	fs3, a0, rne
                  slti         s10, s3, -3
	fcvt.s.wu	ft0, a3, rne
                  addi         t1, s6, -655
                  and          t1, s3, s1
                  slt          s1, s6, zero
                  srli         t0, s6, 24
                  flt.s        zero, fs4, ft2
                  srai         s6, s9, 10
                  srli         s3, a5, 4
                  remu         sp, t3, a2
                  ori          t2, s2, 566
                  rem          t6, tp, t6
                  mulhsu       a6, a2, s7
	fsub.s	fs5, ft9, ft7, rne
                  sltu         zero, a0, s1
                  fcvt.s.wu    ft6, s2, rdn
                  add          s3, s4, t1
                  srai         s10, s10, 17
                  feq.s        t1, fs9, ft1
	fcvt.wu.s	s3, fs8, rne
                  fle.s        tp, fs11, fs7
                  feq.s        s4, ft2, fa4
                  fle.s        s7, fa4, ft7
                  or           tp, a5, s8
                  and          t2, s5, t3
                  flt.s        t2, fs1, ft8
                  remu         t5, t0, t4
	fcvt.wu.s	a5, ft6, rne
                  add          s7, a7, a4
                  rem          s11, t6, a4
                  divu         s11, s1, s10
                  auipc        a7, 122676
                  srai         s6, s1, 25
                  fmax.s       ft7, fa1, fs8
                  lui          t1, 983546
                  ori          sp, s4, 1414
                  sub          a1, a6, s6
                  fmv.w.x      fa6, t3
	fcvt.s.w	fa0, t3, rne
                  slli         t3, s2, 23
                  fsub.s       ft1, fs0, ft1, rup
	fsub.s	fs4, fa2, ft6, rne
                  srli         s5, a3, 4
                  fadd.s       fs5, ft9, fs7, rdn
                  fmv.w.x      fa7, a0
                  fcvt.wu.s    a7, ft0, rdn
                  xor          a2, tp, t5
                  andi         s3, s4, 442
                  slt          t0, s2, s4
                  ori          s10, a4, -1691
                  divu         s7, s11, a0
                  auipc        ra, 173449
                  fsgnjn.s     fs2, fs10, fs2
                  fmax.s       ft7, fs8, fa0
                  slt          t1, s3, t0
                  sub          t3, t6, tp
                  slli         zero, t5, 19
                  sub          a7, t2, t2
                  xor          s6, a6, s6
                  addi         t3, t5, 261
	fsub.s	fs1, fa2, fs1, rne
                  slli         gp, t0, 9
                  or           t0, t0, s0
                  xor          a7, s10, s0
	fcvt.w.s	t1, fs5, rne
                  or           s6, s7, t6
                  sll          s3, a5, a2
                  mulhu        a4, s6, a1
	fcvt.s.w	ft8, s2, rne
                  xori         sp, t1, -1293
                  ori          s11, s4, -1518
                  fsgnjn.s     fa4, ft6, ft7
                  xor          t6, t3, s8
                  addi         s6, s7, -921
                  remu         t0, s6, s1
                  fmv.x.w      s0, ft3
                  fclass.s     s7, fs10
                  fclass.s     s6, ft6
                  slt          a5, tp, a7
	fsub.s	fa5, ft0, fs5, rne
                  sra          s3, s11, sp
	fsub.s	ft11, ft2, fs6, rne
                  mul          s0, a4, a6
                  xor          t2, t0, t2
                  divu         s7, s9, s5
                  or           tp, s8, t4
                  remu         s1, t3, s4
                  remu         a7, t3, s8
                  divu         t4, gp, s6
                  remu         s1, s4, a5
                  mulhsu       s6, s6, a3
                  auipc        s1, 508131
                  andi         gp, t1, -1310
                  sll          a1, t0, s1
                  xori         s7, s4, 1646
                  andi         a6, ra, -1982
	fadd.s	fa2, fa6, fa1, rne
                  feq.s        a7, ft0, fa7
                  fle.s        s9, ft10, fs2
                  sltiu        t0, a0, 841
                  fcvt.w.s     sp, fs10, rdn
	fcvt.s.w	ft5, t1, rne
                  slti         a2, t2, 1996
                  slli         s9, a4, 31
                  nop
	fcvt.wu.s	s5, fs2, rne
                  ori          s5, t1, -102
                  srli         a4, sp, 3
                  fclass.s     a7, fa7
                  andi         s11, s4, 732
                  auipc        t1, 1026493
	fcvt.wu.s	s5, fa4, rne
                  feq.s        s5, ft10, fa3
                  addi         t0, s9, 1058
                  sltu         s4, a1, a4
                  fmv.x.w      tp, fs8
                  fsgnjn.s     fa0, fa4, fs4
                  fle.s        s1, fa6, fs11
                  srl          sp, s10, s6
                  add          s10, s5, t4
                  fsgnjn.s     fa5, ft9, fa0
                  fsub.s       fa3, fs11, fs4, rtz
                  lui          ra, 999722
                  nop
                  div          ra, t2, a6
                  slli         s11, a1, 5
                  auipc        t1, 668839
                  mulh         a7, t3, t2
                  mulhu        s6, s6, s6
                  slt          s9, zero, a2
                  div          gp, s4, t0
                  mulhsu       a6, a6, s3
	fadd.s	fs2, fs9, ft10, rne
                  mul          s7, s11, s2
                  remu         zero, ra, a5
                  remu         a7, a7, t0
                  feq.s        s5, ft3, ft4
                  fadd.s       fa4, ft11, ft8, rdn
                  nop
                  xori         a1, s7, -501
                  fsgnj.s      ft10, fs10, fa0
                  sra          a5, ra, tp
                  sll          zero, a5, tp
                  mulhu        ra, s3, sp
                  fmv.w.x      fa0, s3
                  mulhsu       tp, s5, a1
                  sll          zero, a4, a2
	fsub.s	fa1, fs7, fa3, rne
                  nop
                  fclass.s     t0, fs8
                  remu         a6, sp, s0
                  rem          a6, s10, s3
                  fsgnjn.s     fs11, fs1, ft10
                  sra          s7, s9, s7
	fadd.s	fa6, fs11, fs8, rne
                  div          s3, s11, a1
                  div          ra, t4, a0
                  lui          tp, 931778
                  sltu         s10, s5, s11
                  rem          t5, t0, t2
                  sra          s1, s1, t3
                  mulhu        s9, a3, s3
                  slti         a6, t5, -707
                  fmv.w.x      fs2, a7
                  add          sp, a5, a2
                  fsgnj.s      fs0, fa7, fa5
                  feq.s        s9, ft9, fa7
                  div          ra, gp, s1
                  sll          s9, t1, s0
                  fmax.s       fs3, fs4, fs4
                  sra          s10, s8, s10
                  sra          s6, a1, a0
                  fclass.s     a5, ft0
	fcvt.s.wu	ft5, t6, rne
                  and          t2, tp, a7
                  rem          tp, t2, t4
                  fclass.s     tp, fa0
                  add          s9, tp, zero
                  auipc        s3, 1015597
                  fmin.s       fa3, fs0, fa7
                  fmin.s       fa2, fa6, fs6
                  nop
                  fmv.w.x      fs2, a0
                  fclass.s     s5, fs3
                  fcvt.wu.s    t2, ft5, rmm
                  lui          sp, 477330
                  fmax.s       fa4, fs1, ft0
                  fcvt.w.s     s10, fa0, rup
                  fmax.s       ft11, fs3, fs1
                  slti         t6, s5, 1922
                  feq.s        a7, fa0, ft7
                  sub          a4, t6, a5
                  fadd.s       fs8, fa4, fa6, rup
                  or           sp, t4, a5
                  flt.s        s10, ft5, fs9
                  addi         t6, t0, -997
	fcvt.s.w	ft0, a3, rne
                  fmv.x.w      a5, fa4
                  slti         s10, t3, -1205
                  rem          t5, s2, s0
                  sltu         t5, s7, s3
                  mul          s5, s9, s2
                  slli         s2, s1, 25
                  fsgnjn.s     fa7, ft11, fa1
                  fsgnjx.s     ft2, fa3, ft4
                  fcvt.w.s     s9, ft5, rne
                  remu         ra, s1, t3
                  lui          gp, 517011
                  xor          a5, a2, sp
                  fmv.w.x      ft5, a1
                  ori          s11, s1, -75
                  nop
                  fcvt.wu.s    s7, ft7, rup
                  fcvt.s.wu    ft5, s0, rtz
                  mulhsu       s10, s3, ra
                  sub          s6, sp, s7
	fcvt.s.wu	fa3, a2, rne
                  fsgnjx.s     fa1, ft11, ft6
                  or           t3, s4, a3
                  sub          a5, s11, s4
	fcvt.wu.s	a6, fa3, rne
                  feq.s        s10, fs3, fa6
                  slti         s1, s8, 911
                  div          s4, s3, s10
	fsub.s	ft8, fs5, fs10, rne
                  ori          s11, t1, 175
                  div          t0, t4, gp
                  nop
                  remu         tp, a4, t2
                  sra          s6, s6, s0
                  sltiu        s2, t3, 1548
                  fcvt.w.s     s0, fs10, rmm
                  fcvt.s.wu    ft10, a3, rup
                  div          t6, a5, t3
                  divu         a7, s9, s1
                  fmv.w.x      fs9, t0
                  mul          a2, a5, t4
                  mulhu        a6, s1, t5
                  fmv.w.x      fa2, sp
                  fmax.s       ft11, ft3, fs9
                  lui          s4, 125386
                  fclass.s     ra, fs6
                  fmv.w.x      fs6, a1
                  slt          a2, s5, tp
                  fmv.x.w      a5, ft4
                  fmax.s       fs4, fs8, ft7
                  fmv.x.w      t6, fs10
                  fsgnjx.s     fs2, fs1, ft5
                  add          ra, a1, a3
                  lui          a7, 162079
                  fclass.s     s11, ft9
                  srai         a1, s10, 13
                  srli         t1, gp, 15
                  xori         s5, gp, 1303
                  sll          t6, a1, a0
                  fmax.s       ft11, fa5, fs4
                  sltu         s2, a5, s0
                  add          t6, t5, a2
                  div          s4, s6, tp
                  fmv.x.w      a1, fs2
	fcvt.wu.s	s10, fs11, rne
                  sll          s6, t4, t5
                  mul          a7, a2, gp
                  fmax.s       fa2, ft10, fa1
                  fadd.s       ft8, fs5, ft8, rmm
                  xori         s11, zero, 570
                  remu         tp, a6, sp
                  fsgnj.s      ft2, fa4, fs0
                  fcvt.s.w     ft3, a7, rup
                  fmax.s       ft9, fs8, fa4
                  fcvt.w.s     s4, fa2, rdn
                  fmv.x.w      s4, fa2
                  mulhsu       s6, s6, a1
                  and          a6, t4, gp
                  mulh         t1, a7, s5
                  rem          ra, a2, s4
                  fclass.s     tp, fs6
                  mul          a4, t6, a7
                  ori          t4, t5, -246
                  fle.s        s4, fa0, ft4
                  or           s2, s9, s8
                  slti         t0, t5, 1471
                  fmv.w.x      ft8, s0
                  fsgnj.s      fa6, ft6, fs9
                  feq.s        t4, ft10, fs11
                  fmv.x.w      s4, ft11
                  divu         t3, t3, s11
                  fcvt.s.wu    ft9, s6, rdn
                  sub          s2, a1, t6
                  remu         a1, t5, s6
                  div          ra, t4, s5
                  fle.s        s11, fs11, ft0
	fcvt.s.w	fa1, a5, rne
                  fmv.w.x      fs8, s4
                  nop
	fadd.s	ft4, ft2, ft7, rne
                  xori         gp, zero, -1166
                  xori         s4, a1, 806
                  remu         s1, s11, s9
                  fmin.s       ft4, ft8, ft2
                  add          a6, s1, a6
                  sltiu        sp, a4, -325
                  mulhu        a6, s7, s6
                  flt.s        t0, fs9, fs9
                  sub          s10, a0, t3
                  srli         s3, a2, 31
                  fmv.x.w      s3, ft3
                  mulhsu       a2, s3, s7
                  mulhu        s3, sp, t2
                  div          s7, a3, a2
                  fmv.w.x      ft9, t6
                  and          a4, tp, s5
                  srl          zero, s6, t2
                  fsgnjn.s     fs10, ft7, fa7
                  mulhu        zero, s7, a4
                  sra          t0, a1, t5
                  xori         zero, s4, 234
                  fsgnjx.s     fs9, fa4, fa2
	fcvt.s.w	fs0, zero, rne
                  fcvt.w.s     a6, fs5, rup
                  nop
                  slli         s4, a6, 5
                  fsub.s       fs5, fs6, fs10, rne
                  xori         s7, s5, 1482
	fadd.s	fa1, ft5, fa0, rne
                  fmax.s       fa1, fs8, fs5
                  xori         s10, a3, -795
                  fcvt.wu.s    s3, ft6, rtz
                  slli         a2, s8, 24
                  sra          t5, s8, s11
                  nop
                  ori          a6, s1, 1715
                  sltu         t3, s7, sp
                  slli         s1, a0, 26
                  and          s1, a0, a1
                  rem          a2, t6, zero
                  slli         s11, s8, 24
                  srli         s6, t6, 11
                  slti         a1, t1, 31
                  sltiu        ra, t5, 1834
                  sll          gp, s9, t6
                  fmv.x.w      t5, ft3
	fcvt.s.wu	fs7, t4, rne
                  srl          gp, s4, s6
                  sub          ra, sp, a2
                  xor          s7, a4, ra
                  flt.s        s5, fs4, ft8
                  sll          t4, s8, s8
                  divu         zero, s9, sp
                  sltu         zero, a3, s11
                  or           a5, a7, a1
                  or           tp, a2, t2
                  fsgnjn.s     fs0, fs0, ft1
                  divu         t0, a7, s7
                  srli         s10, a4, 7
                  or           a2, s8, tp
                  fcvt.wu.s    s1, ft4, rtz
                  remu         s7, a0, t1
                  fclass.s     s0, ft1
                  nop
                  fsub.s       ft11, fs4, fs4, rup
                  srli         s2, t1, 3
                  srai         a1, s6, 4
                  fle.s        gp, fs8, fs1
                  fmin.s       ft1, fs5, fa1
	fsub.s	fa5, ft1, ft7, rne
                  mulhsu       t1, s4, t2
                  nop
                  andi         t3, t2, 1616
                  addi         ra, a7, 1271
                  srli         s2, t4, 4
                  fmin.s       fa3, fs10, fs1
                  div          t2, s9, tp
                  mulhsu       a5, zero, t1
                  fmv.w.x      ft2, t1
                  slli         ra, a4, 18
                  xor          s3, a2, t4
                  fsgnjx.s     fa2, fs11, ft1
                  mulhsu       s11, a3, s8
                  auipc        s9, 998157
                  sltu         t5, t6, s8
                  srli         t6, a5, 13
                  fmv.w.x      ft2, s0
                  fle.s        s3, ft11, fs3
                  or           t3, s3, s0
                  sll          t6, s1, s5
                  remu         ra, s1, t2
                  andi         gp, a4, 877
                  fclass.s     t2, fa0
                  slli         s6, s11, 31
                  ori          a7, a5, 379
                  fle.s        a5, fa7, ft4
                  sub          gp, s4, a4
                  addi         a2, a7, -238
                  sltu         s6, t2, t0
                  srai         a1, s2, 22
                  fclass.s     s1, fs0
                  mul          t3, a0, t4
                  sll          t6, s4, tp
                  mulhsu       s11, t1, t2
	fsub.s	ft3, fa4, ft10, rne
                  fmv.w.x      fs9, t1
                  lui          a5, 962161
                  fsgnjn.s     ft7, ft4, ft1
                  fsub.s       ft0, ft5, fs2, rdn
                  mulh         a6, a3, t5
                  div          t1, a3, s7
                  fmv.w.x      fs4, t6
                  fmv.x.w      s0, fa5
                  fcvt.s.w     fa7, s6, rdn
                  fsgnj.s      fs11, ft5, fa7
                  fclass.s     s2, fa4
                  xori         a5, s7, -1503
                  fmv.w.x      fs3, sp
                  mul          s4, s7, s11
                  mulhsu       t2, t6, a5
	fcvt.s.wu	fs7, s8, rne
	fcvt.wu.s	t6, fa6, rne
                  fadd.s       fs7, fs6, ft7, rne
                  xor          t4, t1, s0
                  ori          a1, a7, -1290
                  divu         s10, s1, a7
                  xor          t3, a1, tp
                  sub          t1, t2, ra
                  mulhsu       a1, s1, s9
                  div          s6, a6, t2
                  fmv.x.w      t2, ft0
                  fsgnjn.s     fa2, ft5, fa5
                  slli         s2, a4, 3
                  fsgnjx.s     ft7, fs0, fa3
                  sltu         a1, a0, a5
	fsub.s	fs8, fa5, ft8, rne
                  and          tp, t5, a2
                  feq.s        t6, ft5, ft0
                  ori          s6, s6, -1484
                  fmv.w.x      ft3, s4
                  rem          t0, s5, s10
                  andi         s4, t3, 1707
                  sra          a7, t6, a5
                  xori         s9, t1, 1404
                  fmax.s       ft6, fs5, ft2
                  andi         s0, a6, 206
	fcvt.s.wu	fa7, t2, rne
                  fmv.x.w      t0, ft6
                  fsgnjn.s     fa7, ft6, fs7
                  sub          a7, ra, a3
                  sra          s4, s4, t5
                  fle.s        s1, fs7, fa0
                  sltu         t4, s3, a5
                  sub          a5, t1, s1
                  auipc        t3, 659712
                  fsgnjn.s     fs10, fa3, ft2
                  fmv.x.w      a7, ft6
                  mul          s0, t6, a4
                  flt.s        a6, fs1, ft9
                  slt          t3, s0, gp
                  or           s10, s5, t5
                  fmin.s       fs0, fa3, ft0
	fadd.s	fs4, ft9, fa0, rne
                  flt.s        t4, ft0, ft6
                  fmv.x.w      a5, fa5
                  addi         s5, zero, -1696
                  slti         a1, s6, -1054
                  sltiu        a1, sp, -178
                  fmin.s       ft3, ft1, fa4
                  feq.s        a5, ft9, ft1
                  sltu         s10, s6, s1
                  slli         s5, sp, 23
                  fclass.s     t6, ft1
                  fsgnjn.s     fa7, ft9, fs8
                  divu         ra, s0, t2
                  fmv.w.x      ft0, s3
                  fsgnjx.s     fs5, fa7, fs9
                  fmv.x.w      ra, fs0
                  slli         t3, t5, 15
                  lui          t4, 236149
                  slti         t0, sp, 279
                  divu         t3, s0, t5
	fadd.s	fs6, ft9, fa2, rne
	fsub.s	fs11, ft2, fa7, rne
                  slti         ra, s8, 386
                  fsgnjn.s     fs0, fs8, ft8
                  remu         zero, a6, a3
                  div          s11, s3, t6
	fadd.s	fs10, ft0, ft9, rne
                  fmin.s       fs1, fa4, ft5
                  ori          t4, t0, -2024
                  ori          s10, s4, 973
                  flt.s        t6, ft6, ft0
                  sltiu        ra, a1, 1621
                  rem          a4, gp, a4
	fcvt.s.w	fs10, s3, rne
                  sra          s7, a7, a1
                  rem          tp, sp, s2
                  sltiu        s1, zero, 416
                  sltiu        ra, s6, -937
	fcvt.w.s	s2, fa3, rne
                  fsgnjn.s     ft5, ft7, fa6
                  fmv.w.x      ft3, a7
                  mul          t5, t5, t0
                  fclass.s     t1, fa6
                  sra          s9, s8, t5
                  div          t1, a3, a6
                  mulh         s7, a7, s6
                  xori         s1, s5, -2005
                  addi         a1, a0, 1616
                  xori         s1, sp, 1266
	fadd.s	fs5, fs3, fs11, rne
	fcvt.s.w	ft1, t3, rne
                  ori          s0, a0, 1313
                  xor          s10, gp, t4
                  and          s1, t0, ra
                  fsub.s       ft1, fa5, fa1, rdn
	fcvt.s.wu	fa4, t0, rne
                  mulh         a6, zero, t2
                  fmv.x.w      t6, fa4
                  slt          tp, t1, gp
                  mulhsu       s10, t4, a7
                  fmv.w.x      fs3, s2
                  sltiu        tp, t6, 1276
	fcvt.wu.s	t1, fs11, rne
                  slti         t3, a0, 403
                  sra          tp, t0, t3
                  fmax.s       fs4, ft6, fs9
                  srli         s5, a5, 13
                  srli         a5, t4, 20
                  sra          t2, s7, t2
                  xor          t1, t1, t5
                  sub          s11, a4, s3
                  rem          gp, s11, ra
                  rem          t1, a2, t0
                  fcvt.s.wu    ft2, s5, rtz
                  remu         a4, s1, a1
                  fcvt.wu.s    s6, ft3, rdn
                  flt.s        t6, ft9, fs4
	fcvt.s.w	fa1, t3, rne
                  xor          ra, gp, a5
                  xor          t1, sp, s5
                  fmv.x.w      a4, ft10
                  div          t2, t3, t3
                  feq.s        a6, ft4, ft5
                  mulhu        zero, a2, s6
                  sra          a4, t4, a2
	fcvt.w.s	t5, fa4, rne
                  div          s1, t5, gp
                  fclass.s     s10, ft1
                  mulhu        s1, t6, s7
                  mulhu        s4, zero, s7
                  remu         s9, a1, s1
                  andi         s4, a3, 281
                  mulhsu       a5, t0, s11
                  fsgnj.s      ft8, ft1, ft5
	fadd.s	ft4, fa6, ft2, rne
                  fsub.s       ft3, fa4, fs2, rtz
	fcvt.wu.s	s6, fa7, rne
                  fsgnjn.s     fs7, fs8, fs7
	fsub.s	ft7, fs3, ft6, rne
                  slli         t1, s4, 20
                  ori          a1, tp, 977
                  mulhu        s4, t5, s1
                  nop
                  sll          t3, ra, zero
                  sub          zero, sp, s6
	fcvt.s.w	ft1, a4, rne
                  mulhsu       s11, s1, s10
                  fcvt.s.w     ft9, gp, rmm
                  mulhsu       s9, a1, s6
                  sub          s9, t2, gp
	fcvt.s.w	fs9, a0, rne
                  nop
                  fcvt.w.s     a4, ft0, rmm
                  sra          a6, a5, a6
                  addi         s0, a2, -2019
                  sra          gp, s10, s10
                  fle.s        a2, fs6, fs2
                  slli         s6, a7, 28
                  rem          s4, s1, s0
                  remu         a1, a2, t4
                  fmv.x.w      a1, ft4
                  and          ra, s6, s1
                  andi         s4, a6, 50
                  ori          zero, s6, 2009
                  fcvt.w.s     gp, ft0, rtz
                  ori          s3, tp, -1171
                  slti         t0, s0, 1340
                  mul          t0, a5, a5
                  sltiu        t6, a1, -1039
	fsub.s	ft0, ft4, fs8, rne
	fcvt.wu.s	tp, fs11, rne
                  fsgnj.s      fs7, ft2, ft8
                  sub          s4, ra, zero
                  slti         zero, gp, 1880
                  feq.s        t2, fs3, fa0
	fsub.s	ft9, ft9, fa5, rne
                  sltu         a5, s4, s2
                  sra          ra, t2, s6
                  xor          a1, s1, s1
                  sub          s7, s5, t6
                  xori         t0, t5, 2000
                  nop
                  fmin.s       fa6, fs4, ft10
                  sltiu        t0, t5, -1610
                  srai         s9, a5, 0
                  fmv.x.w      s0, ft3
                  xori         t4, a1, -1605
                  sra          s10, a7, s7
                  fsgnjx.s     ft6, fs5, fa6
                  fcvt.w.s     s4, ft10, rtz
                  div          s1, s7, s3
                  sra          s6, s11, s4
                  fsgnjn.s     fs11, fa2, fs3
                  addi         t5, sp, 191
                  fsgnjx.s     ft1, fs3, fs4
                  fcvt.wu.s    s0, fs6, rne
	fcvt.w.s	zero, fa6, rne
                  sub          a5, a4, zero
                  srli         t2, s2, 22
                  andi         s1, s6, 185
	fcvt.wu.s	t6, fs4, rne
                  slli         a1, t0, 30
                  fmv.x.w      t3, fa3
                  addi         s3, s10, 1651
                  fmv.x.w      tp, fs7
                  fsgnjx.s     fs0, ft8, fs3
                  mulhu        s3, s4, s7
                  fclass.s     s0, fs10
                  fadd.s       ft1, fs2, fa0, rne
                  sltu         s6, t3, a5
                  and          ra, s4, s8
                  fcvt.s.w     ft1, s7, rne
                  nop
                  mulhu        s0, s2, s4
                  or           zero, a0, t2
                  fsgnjn.s     fs4, ft7, ft2
                  srai         s5, s6, 5
                  or           s7, s11, t5
                  fadd.s       ft3, ft8, fs4, rdn
                  mulhsu       s10, a1, a5
                  sltu         t1, s9, sp
                  lui          t4, 316190
                  div          a6, t1, a7
                  fmin.s       fa4, ft2, fs4
                  rem          s6, tp, a7
                  fcvt.s.wu    fs1, t2, rmm
                  slti         s0, t0, 1864
	fcvt.w.s	t4, fs11, rne
                  sltu         a5, a1, s2
                  fcvt.s.w     fs2, t6, rne
                  or           t3, t6, s11
                  fsgnjn.s     fs11, fa5, fs6
                  slt          sp, t4, s11
                  mul          s9, t6, a7
                  nop
                  mul          t5, gp, a7
                  slt          t2, t5, ra
                  div          s10, a4, t0
	fcvt.s.wu	ft8, sp, rne
                  feq.s        t3, ft8, fs2
                  fmax.s       ft6, fa3, ft10
                  auipc        s2, 20704
                  fmv.w.x      fa0, a0
                  and          t5, ra, zero
                  or           a4, t2, s2
                  add          s10, a2, s4
                  srl          zero, sp, s6
                  remu         t3, tp, s2
                  rem          s2, t4, a0
                  fmax.s       fs6, ft8, fs5
                  srli         a5, t3, 10
	fadd.s	fs2, fa2, ft9, rne
                  slli         t1, a2, 24
                  xori         s0, t5, 24
                  fsgnjn.s     fs9, ft7, ft7
                  or           s11, s4, sp
                  fsub.s       fs7, fa2, fs5, rup
	fadd.s	fa1, ft8, ft0, rne
                  add          a6, a3, s6
                  and          a4, gp, a4
                  div          sp, tp, t1
	fsub.s	fs6, fs11, fs3, rne
                  lui          s3, 341479
                  rem          ra, a6, s4
                  srl          a2, s6, s7
                  and          tp, s6, s5
                  fsub.s       ft0, ft4, ft4, rtz
                  slt          s9, s0, a5
                  fle.s        s2, fa0, fa1
                  fsgnjx.s     fs10, fs4, fa2
                  slt          t0, a5, t5
                  divu         gp, s11, s3
                  sra          s3, a5, t6
                  fmax.s       fa5, ft3, fa1
                  sltu         s10, a7, s2
                  srli         gp, s5, 8
                  srl          t6, s7, a7
                  xori         a1, a6, 130
                  sll          a1, s1, t5
                  slt          a1, t3, s11
                  fmv.w.x      fa1, t1
                  xor          t3, s9, s10
                  auipc        t0, 604334
                  mulhu        s9, t2, t0
                  sltiu        gp, zero, -1067
                  fsgnjx.s     fs1, fa6, fa4
                  divu         a2, s6, t2
                  srai         s0, s7, 11
                  fmin.s       fs5, ft4, fa1
                  fcvt.s.wu    ft1, s1, rtz
                  fadd.s       fs7, fs8, fa0, rne
                  srli         s7, a2, 21
                  nop
                  divu         t1, s0, a0
                  sub          a6, s9, s3
                  mulhu        t0, s6, zero
                  sll          t2, sp, t1
                  slt          a4, s6, s7
                  srai         t0, a0, 2
                  fle.s        s9, ft8, ft10
                  slti         t6, a0, -2031
                  xori         a2, gp, -323
                  srli         a2, a5, 20
                  add          a6, s1, t1
                  or           t3, s0, a5
                  sltiu        a2, a7, 1261
                  sra          t3, a0, t5
                  sub          a4, t4, t0
                  and          s10, a0, t6
                  slt          sp, t2, t1
                  mul          t5, ra, t2
                  fmv.w.x      ft5, t3
                  sub          s3, a2, t6
                  fsgnj.s      ft11, fs7, fs6
                  fmax.s       fs2, ft4, ft6
                  srl          s2, s1, s6
                  fadd.s       fs3, fs7, ft4, rdn
                  fsgnjn.s     fa3, fa6, ft9
                  sra          a4, s2, sp
                  mulh         t5, a4, a2
                  xor          s3, a6, ra
                  sltu         sp, s1, zero
                  xori         s6, ra, -1250
                  fsgnj.s      ft7, ft3, ft6
                  sra          s11, sp, t5
                  slt          a2, t5, t3
                  fcvt.s.wu    fs10, a5, rdn
                  srli         a4, s9, 6
                  xor          sp, t1, a2
                  slli         sp, s6, 5
                  or           sp, s6, s6
                  nop
                  or           s7, t3, t4
                  srai         s10, t4, 1
                  sltu         gp, s11, s0
                  fsgnjx.s     fs0, ft11, ft4
                  xori         s7, a7, -1487
                  or           sp, s0, t6
                  remu         s4, zero, t6
                  slti         s5, s3, 400
                  fle.s        s4, fa4, fa3
                  sltiu        s6, t6, 1097
                  fclass.s     a1, fs2
                  fclass.s     a4, ft8
                  mul          ra, s7, tp
                  sll          s6, t6, t4
                  remu         a5, t1, zero
                  fmv.x.w      a4, fa3
                  mul          s4, t4, s0
                  add          tp, t1, s10
                  slt          s2, t3, tp
                  mulhsu       a6, s4, s0
                  mulhu        t0, s10, t0
                  mul          s1, s5, a1
                  fsgnjx.s     ft11, ft2, ft9
                  mulh         a2, s10, s0
                  addi         s6, s8, -393
	fcvt.s.w	fs6, s5, rne
                  xor          a6, s0, a2
                  fmv.x.w      t2, ft4
                  fsgnjx.s     ft4, ft1, ft11
                  ori          t5, t0, -425
                  fmv.x.w      s0, fa4
                  andi         t5, s5, 624
                  auipc        t5, 321371
                  sltu         a2, a4, s10
                  nop
                  srai         s1, a4, 22
                  sltu         s9, a7, a3
                  mul          a2, s4, a6
                  fsgnj.s      ft3, fs10, fs10
                  fmv.w.x      fs4, zero
                  xori         zero, t1, -101
                  add          s3, t6, gp
                  fcvt.wu.s    t0, ft0, rdn
                  auipc        s0, 219776
                  slti         zero, t6, 1707
                  slti         t2, sp, 598
                  mulhsu       gp, t4, a1
                  fmax.s       fa5, fs8, fa2
                  and          gp, t0, s3
                  sltiu        ra, a3, -500
                  fmv.w.x      ft9, t0
                  ori          s0, s10, -1932
                  fcvt.w.s     t6, fs8, rmm
                  auipc        a4, 1003550
                  nop
                  mulhu        s4, s9, t1
                  fsgnj.s      fs9, ft10, fs3
                  mulhsu       a5, a2, s0
                  sltu         s7, a7, a0
                  srl          sp, t0, a3
                  fsub.s       fa7, fs11, ft10, rne
                  nop
                  or           tp, s8, tp
                  srl          a7, a5, a7
                  add          s1, s0, s0
                  xor          a6, s6, s10
                  andi         s10, a4, 2010
                  feq.s        zero, fs7, fa3
                  slli         sp, s8, 31
                  mulh         t1, s10, s0
                  fmin.s       fa2, ft4, fs10
                  fclass.s     s4, fs10
                  srl          s5, a5, s2
                  xori         t1, a6, -322
                  sra          s9, s9, s0
                  mulhu        a1, s11, s2
                  sltu         s1, s8, sp
                  slti         s1, t4, -314
                  mulhu        a7, a5, gp
                  sltu         s5, a2, sp
                  xori         a7, a2, -1975
                  fsgnj.s      ft6, fs6, fs4
                  lui          a1, 716426
                  slli         s5, s8, 3
                  fmax.s       ft6, ft8, fs7
                  fclass.s     zero, fs6
                  sltu         sp, s8, a2
                  srli         ra, s5, 6
                  fsub.s       ft5, ft11, fa0, rtz
                  fsgnjx.s     fa7, fa2, fa0
                  nop
                  mulh         s0, t3, s6
                  and          t4, t1, gp
                  sll          ra, t6, s2
                  sra          sp, t1, s6
                  fcvt.w.s     zero, fa5, rmm
                  fmv.w.x      fa4, s8
	fcvt.s.wu	fa1, a6, rne
                  fsgnj.s      ft2, fs0, fs2
                  lui          t5, 363146
                  or           a2, s11, t5
                  andi         sp, gp, -1402
                  sub          a4, t2, a3
                  ori          s5, s9, 1066
                  fmv.x.w      a6, fa2
                  fclass.s     zero, ft11
                  fmin.s       ft10, fa0, fa4
                  fle.s        t2, fa0, ft7
                  feq.s        s9, fs5, ft7
                  fsub.s       ft6, fa6, ft6, rmm
	fcvt.s.wu	ft7, t6, rne
                  fmin.s       fa4, ft11, fa0
                  srl          a2, t2, s5
	fcvt.s.w	fa0, s0, rne
                  fmv.w.x      ft2, a4
                  srai         s7, t4, 0
                  andi         s7, s2, -481
                  fcvt.s.wu    fa2, t0, rne
                  slti         sp, s2, -237
                  slti         s2, a2, 1856
                  fmv.w.x      fs6, t0
                  mulhu        s11, a1, t0
                  ori          s9, s11, -946
                  nop
                  sra          t6, a1, s4
                  fcvt.wu.s    tp, fa0, rne
                  flt.s        s10, ft5, ft6
                  fmv.x.w      gp, fs9
                  fmin.s       fs3, fs7, fs5
                  xori         s1, t2, 1471
                  fmin.s       ft4, ft2, fs11
                  srl          a7, s10, tp
                  or           a6, a6, t0
                  mul          s2, a5, s3
	fcvt.w.s	s3, fs2, rne
	fcvt.w.s	zero, ft9, rne
                  fcvt.wu.s    s10, fs8, rdn
                  srai         s4, a0, 8
                  sll          a1, a7, t0
                  andi         a1, a1, 1744
                  sra          gp, s1, s7
                  fmv.w.x      ft11, a0
                  divu         t0, sp, t1
                  fmv.x.w      t1, fa5
                  fsub.s       ft0, ft0, ft3, rdn
                  nop
                  mul          zero, a1, s11
                  flt.s        t5, ft7, ft2
                  fsgnj.s      ft9, fa6, fs7
	fcvt.wu.s	a1, fs4, rne
                  andi         a6, ra, 1750
                  fmv.x.w      t3, fs3
                  andi         s1, a7, 602
                  sll          tp, tp, s2
                  flt.s        t1, fs2, ft5
                  fmv.w.x      fa4, t2
                  and          s10, a1, zero
                  sra          s10, a1, s4
                  andi         zero, s5, -1720
                  sub          a1, t4, t4
                  or           a5, zero, s1
                  fclass.s     a2, fa1
                  fclass.s     s0, fs11
                  fmin.s       fs7, fs11, ft1
                  and          s9, t4, s2
                  div          t3, a2, s4
                  fsgnjx.s     fa6, ft4, ft2
                  add          t1, a3, s3
                  fcvt.s.w     ft1, a3, rtz
                  add          s3, s1, s8
                  xor          t1, t3, a4
                  fmv.w.x      fa1, s9
                  fmv.w.x      ft10, s6
                  auipc        s6, 14011
	fcvt.w.s	ra, fa1, rne
                  auipc        s11, 607445
                  fmin.s       fs3, ft8, fa6
                  fadd.s       fa3, ft8, fa0, rup
                  fclass.s     gp, ft1
                  and          s0, a1, a1
                  fmv.w.x      fa7, gp
                  and          a6, t0, s1
                  addi         s2, zero, 69
                  fclass.s     a2, fs11
                  mulh         ra, s3, a3
                  divu         s1, t3, t5
                  lui          a4, 590884
                  nop
                  sra          s3, t1, s4
                  fcvt.w.s     t0, fs8, rtz
                  slli         sp, s6, 26
                  divu         t1, a4, zero
                  rem          s5, s4, a3
                  fmin.s       fs11, ft10, fs11
                  fmin.s       fa7, ft0, ft10
                  slt          sp, a7, s8
                  addi         zero, s11, 1172
                  fmv.x.w      s1, ft1
                  lui          t0, 23779
                  xor          s1, s5, s9
                  nop
                  mulh         a1, s6, s10
                  sltu         t3, a6, a1
                  feq.s        s2, fs3, fs6
                  srli         sp, s10, 30
                  sll          s6, a3, t3
                  remu         s2, s7, s5
                  div          a7, t2, t6
                  fle.s        a5, fs6, ft4
                  sltiu        t6, sp, -1207
                  fadd.s       fs11, fs5, fa2, rtz
                  mul          s11, s6, s7
                  fmv.w.x      fs11, a5
	fcvt.w.s	s2, fa2, rne
                  mulhsu       t6, s6, s1
                  remu         a5, sp, t2
                  ori          s6, t1, 1398
                  div          s10, t4, a5
                  auipc        s4, 80366
                  sll          s0, s10, a3
                  mulhu        t1, s4, zero
                  nop
                  nop
                  div          t6, s9, s3
                  sra          t4, s9, s3
                  sll          a4, s4, t5
                  auipc        s7, 156423
                  mul          ra, s5, t3
                  div          s10, a7, a4
                  fcvt.w.s     s9, fs8, rup
                  divu         zero, s0, a5
                  sltu         s2, t6, sp
                  fmv.w.x      ft1, s3
                  fclass.s     s4, fs7
                  fle.s        t0, ft8, fs2
                  feq.s        a6, fa4, ft6
                  divu         a4, t2, t0
	fadd.s	fs10, ft0, ft2, rne
                  fcvt.s.w     ft7, a6, rne
                  xor          s1, t0, s0
                  sll          t4, s5, s5
	fcvt.wu.s	gp, fs6, rne
                  rem          t2, s0, a1
                  sll          zero, t2, sp
                  andi         tp, t3, -945
                  slt          t5, s1, s3
                  fle.s        s4, ft0, ft11
                  sltu         t4, t2, s4
                  fmax.s       ft7, fa5, fs8
                  fsgnj.s      ft10, fs2, fs10
	fsub.s	ft3, fs11, fs6, rne
                  sra          s2, s1, s11
                  mulh         t4, a0, t3
                  auipc        t1, 581033
                  slli         a1, t3, 31
                  feq.s        s5, ft2, fs5
                  sll          t6, t2, s3
                  mulhu        sp, gp, t1
                  fsub.s       ft5, fs1, fs4, rtz
                  mulhsu       t0, a2, a1
                  fclass.s     ra, ft4
                  fcvt.wu.s    t0, ft7, rne
                  fsgnjx.s     ft1, fs0, ft0
                  fsgnjn.s     fa1, ft4, fa2
                  fmv.w.x      ft7, t5
                  ori          a5, s3, 906
	fcvt.s.w	fa0, s4, rne
                  addi         s7, s3, -1106
                  fmax.s       fa4, fs3, fs2
                  fsgnj.s      ft0, fs10, ft10
                  rem          s2, s2, a3
                  xori         zero, s6, -279
                  fadd.s       fa2, fs9, ft5, rne
                  ori          s4, s0, -693
                  remu         s11, s9, t6
                  srai         a1, s11, 5
                  xori         t3, t3, -427
	fsub.s	fs5, fs8, fs10, rne
                  sra          s2, tp, a0
                  fmv.w.x      fa7, t4
                  or           s10, s10, a5
	fcvt.wu.s	t6, fa7, rne
                  sra          s0, s5, zero
                  mulhu        s11, t4, s3
                  fclass.s     s0, fs4
                  fsgnj.s      fa6, fa2, ft5
                  fsub.s       ft1, fa0, fa1, rup
                  addi         tp, s1, -1548
                  auipc        t6, 61780
                  sltiu        s11, s8, 993
                  sltu         s3, s5, a4
                  sltu         t0, s1, s3
                  slt          t4, t1, a4
	fcvt.s.w	ft9, s10, rne
                  fcvt.wu.s    t5, fs11, rup
                  fmv.x.w      ra, fa3
	fsub.s	fa2, fa5, ft4, rne
                  sll          s1, t5, a6
                  mulhu        s11, s0, s9
                  srai         sp, s6, 6
                  divu         s10, s11, sp
                  mul          a6, s10, s4
                  slli         s2, s1, 23
                  andi         a2, s2, -404
                  fmv.w.x      fs1, s7
                  srli         s4, t4, 18
                  fcvt.wu.s    ra, fs4, rtz
                  fsgnj.s      ft7, ft6, fa7
                  fsgnj.s      ft8, fs0, fs8
                  feq.s        t0, ft2, fs0
                  remu         a5, t2, a6
                  feq.s        a2, ft1, fs8
                  addi         s0, sp, 452
                  ori          a1, tp, 43
                  fcvt.s.wu    fs10, s0, rne
                  fsgnjx.s     fa7, ft11, fs2
                  slt          s5, t6, s11
                  sltiu        t6, s5, -2042
                  slti         t5, s2, 1070
                  slti         t0, s10, 989
                  and          s10, ra, a3
                  sra          t2, a7, t4
                  fsgnj.s      fs3, fs4, ft0
                  xori         s11, s4, -292
                  slt          ra, s11, t1
                  fle.s        tp, fa0, fa2
                  rem          gp, s8, s6
                  mulhsu       sp, s8, s3
                  sub          a6, t2, zero
                  fmv.x.w      t1, ft2
                  andi         a2, t5, 136
                  rem          a1, gp, a7
                  fle.s        t4, ft8, ft9
                  add          s1, t2, a5
                  fclass.s     s3, fa3
                  and          t2, a3, s0
                  add          ra, t1, a4
                  flt.s        s1, fs10, fa5
                  srai         s6, ra, 28
                  fclass.s     s4, fa4
                  mulhsu       a1, ra, zero
                  addi         gp, s0, 696
                  srl          t3, s3, a4
                  srl          s1, s6, s8
                  fadd.s       fa5, ft11, fs0, rne
                  andi         a5, sp, -298
                  slt          s3, s11, a5
                  divu         s1, t0, a1
                  div          s9, a5, s4
                  fcvt.w.s     s10, ft5, rne
                  flt.s        zero, fs2, fa2
                  fsgnjn.s     fa2, ft11, fa4
                  sub          gp, a4, t0
                  xor          s6, a4, sp
                  mul          a2, a7, s2
	fcvt.s.wu	fs8, a1, rne
                  slti         s1, s8, -1592
                  srai         ra, s2, 6
                  sub          t3, sp, a3
                  xor          s5, s7, a6
                  srl          sp, a6, s9
                  sub          s7, s5, a4
                  fmax.s       fa0, fa0, fa4
                  slti         s2, a5, 130
                  sltiu        s4, a3, -248
                  lui          t4, 73464
                  mulhsu       s5, s1, s4
                  mulhu        ra, s4, s1
                  lui          gp, 823254
                  srli         s7, a0, 11
                  remu         s3, gp, s5
                  div          s7, t5, a0
                  fcvt.w.s     a5, fs4, rne
                  divu         s4, t0, t6
                  ori          s11, a0, -1146
                  fcvt.wu.s    s11, fa3, rdn
                  rem          a5, a4, t1
                  nop
                  fmv.x.w      t3, ft3
                  div          s3, a5, gp
                  add          a5, s4, a4
                  fmv.x.w      s11, fa5
	fcvt.w.s	a1, ft3, rne
                  ori          zero, t2, -189
                  fmv.x.w      s2, fa4
                  srli         t2, s7, 13
                  sll          s7, s6, s2
                  fsgnjn.s     fs4, ft4, fs3
                  sub          a5, s11, a1
                  ori          t0, a0, 1177
                  remu         t6, t6, s0
                  mul          a6, gp, a1
                  fcvt.wu.s    a7, ft7, rne
                  fmax.s       fs7, fs10, ft4
                  fclass.s     s3, ft5
                  sll          s6, a1, gp
                  add          tp, a3, zero
                  slli         s1, tp, 18
                  fmv.w.x      fs11, s8
                  addi         sp, sp, 1032
                  slti         t3, s0, -1862
                  xor          s6, a7, s1
                  nop
                  fmv.w.x      fa2, sp
                  mulh         t6, s10, t6
                  slti         s2, ra, -1900
	fsub.s	ft9, ft4, fa3, rne
                  xori         s6, tp, -470
                  fcvt.s.wu    fs7, a0, rdn
                  fsgnjx.s     fa3, ft10, ft0
                  fmv.w.x      fs0, a6
                  fsgnjn.s     ft9, fa5, ft6
	fcvt.s.wu	ft4, s4, rne
                  ori          a1, s5, -997
                  fcvt.w.s     t6, fs10, rmm
                  xor          t3, t0, a5
                  div          sp, s1, a3
	fsub.s	ft4, fs6, ft2, rne
                  add          t0, a6, a2
                  fmin.s       fs11, ft8, ft3
                  ori          a4, s4, -1785
                  fcvt.w.s     t0, fs4, rne
                  fsgnjx.s     fa2, fs2, fs6
                  fsgnjn.s     ft9, ft6, ft1
                  ori          s10, a7, 175
                  fcvt.wu.s    a1, ft6, rmm
                  sub          s0, gp, a3
                  fmin.s       fa7, ft1, ft10
                  fclass.s     s5, ft7
                  sra          tp, ra, a0
                  fclass.s     t3, ft10
                  nop
                  lui          t5, 40915
                  nop
                  fsgnjn.s     fs7, fs2, fa2
                  fmv.x.w      gp, fa2
	fcvt.w.s	a6, fa0, rne
                  xor          s0, a5, zero
                  srl          s9, s5, a2
                  mulh         s6, s8, gp
                  xor          t2, s2, s9
                  div          a6, t1, s1
                  or           s10, t6, s4
                  sll          t0, s9, zero
                  slti         t1, s2, 1735
                  rem          a5, a6, a6
                  and          t4, a0, a0
                  sub          a4, a1, gp
	fcvt.s.wu	fs3, s4, rne
                  srai         s6, ra, 5
                  slti         a6, a6, -1722
                  mulh         t0, s2, t1
                  fmax.s       fs10, fs2, fa4
                  fle.s        s2, fa0, fs6
                  remu         a2, t6, t6
                  mulh         s1, s5, s7
                  fclass.s     a2, ft2
                  slli         s6, s1, 1
                  fcvt.s.wu    ft11, gp, rdn
                  sltiu        a1, s6, -464
                  fsgnj.s      fs1, fa5, ft6
                  and          a6, t1, a3
                  fsgnjn.s     ft10, fs0, fa4
                  mulhu        t2, gp, s3
                  fsub.s       fs3, fs1, ft4, rtz
                  fsgnjx.s     fa5, fs10, ft8
                  mulhsu       a6, ra, t0
                  mulhsu       a2, a5, a6
                  fmax.s       fs3, fs1, fs6
	fsub.s	fa4, fa7, fs4, rne
                  mul          gp, t3, s0
                  remu         ra, s1, s11
                  fle.s        a6, fs2, ft1
	fcvt.s.w	fa7, a7, rne
                  and          a1, t2, s0
                  divu         zero, a1, s2
                  srai         t2, s1, 3
	fcvt.w.s	a4, fa7, rne
                  sltu         a1, s6, a3
                  fmv.x.w      t6, fa3
                  or           t2, s7, t3
	fadd.s	ft7, fs1, ft10, rne
                  mulhu        zero, ra, a1
                  nop
                  remu         s6, s1, s10
                  xori         a6, a2, 1994
                  srl          t4, ra, s0
                  srl          a1, s1, s2
                  sltu         s5, s3, a0
                  fmv.w.x      ft6, gp
                  sub          s3, s8, a0
                  mul          a6, t4, s3
                  srli         a2, a4, 5
                  mulhu        t6, s4, ra
                  fsgnj.s      fs2, fs9, ft6
                  srli         t5, s6, 24
                  fsgnjx.s     ft10, fs3, ft6
                  fmax.s       fs8, fs11, fa4
                  srli         sp, a6, 8
	fadd.s	ft3, fs8, fa7, rne
                  fle.s        s9, fs11, ft6
	fcvt.w.s	a5, ft11, rne
                  sll          s7, s0, a1
                  srl          s11, a2, t5
                  ori          t1, s9, 2018
                  ori          s6, s4, -1008
                  fsgnjx.s     fs6, fs7, ft9
	fadd.s	fa1, ft10, fs8, rne
                  fmax.s       ft2, fs6, fa3
	fadd.s	ft5, fs5, fs7, rne
                  fmin.s       fs1, ft8, ft10
                  srai         a6, ra, 28
                  xori         s6, t4, 1810
                  nop
                  fsgnjx.s     fs9, ft8, ft1
                  sltu         t6, a5, s5
                  fsgnj.s      ft9, fs5, fs6
                  fmv.x.w      s6, ft7
                  sltu         s2, s3, s10
                  add          s9, s2, t4
                  sltiu        t0, s0, 506
                  add          a4, sp, s8
                  xor          t3, tp, zero
                  sll          a5, a1, s1
	fsub.s	ft5, ft11, fa5, rne
                  divu         s11, a5, a3
                  slli         t5, s5, 8
                  fle.s        a1, fs8, fa4
                  and          s9, s3, t2
	fcvt.s.w	ft9, s5, rne
                  sra          t0, a0, a3
                  sltu         s3, t0, t0
                  mulhsu       t1, t3, s3
                  sltu         a2, gp, s8
                  div          zero, s11, t1
                  mul          tp, s5, a2
                  divu         s7, s7, a1
                  slli         a4, a2, 19
                  rem          t5, t4, zero
                  fsgnjn.s     ft8, fa7, ft0
                  ori          t5, t4, -26
                  fclass.s     sp, fs10
                  slli         s5, s5, 29
                  nop
                  sltu         a6, s3, s4
                  mul          t6, t2, ra
                  div          s5, zero, s11
                  sra          s2, s3, a3
                  slli         a6, t2, 7
                  fmin.s       fs9, fs10, fs5
                  fmin.s       fs5, fs8, ft10
                  srl          ra, s10, s8
                  xor          s6, sp, a6
                  srl          sp, a7, t3
	fcvt.wu.s	t4, fs8, rne
                  fsgnjx.s     fa5, fs5, fa6
                  mul          a2, a4, a6
                  fle.s        a2, ft6, fs3
                  sll          tp, a5, t4
                  sltiu        t5, s3, 420
                  fcvt.s.wu    fs6, t6, rmm
                  div          t5, ra, t4
                  addi         s1, s9, 445
                  and          a1, t5, a4
                  fsgnjn.s     fs2, fa4, ft5
                  mulhu        a2, s10, ra
                  auipc        s2, 416769
                  sll          zero, s4, sp
                  fmax.s       fa3, fs11, ft11
                  and          sp, s7, a3
                  sll          a5, s5, s9
                  addi         t2, s7, 178
                  div          s3, a7, s11
                  srli         s1, sp, 23
                  div          a2, s3, sp
                  fcvt.s.w     fs1, a3, rmm
                  srli         t5, t0, 30
                  sltiu        t6, s7, -208
                  sra          t2, t4, ra
                  remu         gp, zero, ra
                  sltu         t5, s8, t6
                  add          t2, a1, s6
                  lui          t3, 921350
                  ori          a2, t6, -344
                  rem          s11, t4, a6
                  andi         s11, a4, -1781
                  divu         s0, a7, t1
                  slt          t0, s5, s6
                  slt          a5, t1, s3
                  auipc        s7, 403941
                  slli         t5, a7, 8
                  mulhsu       t3, zero, a1
                  fsub.s       fs2, ft10, fs0, rdn
                  lui          t2, 251977
                  fsgnjn.s     fs8, ft11, fs5
                  sll          a2, s10, a0
                  add          t3, s5, gp
                  srai         s4, s3, 25
                  fcvt.s.w     fs10, s0, rne
                  mulhu        a4, s10, a1
                  sra          s2, t6, s2
                  fmv.x.w      a5, ft3
	fadd.s	fs11, fs8, ft11, rne
                  fsgnj.s      ft6, fs4, fa0
                  xor          s11, t1, s11
                  remu         a6, s3, t2
                  xor          t6, s7, tp
                  fle.s        s6, ft4, fa6
                  fclass.s     t0, ft6
                  fsgnjx.s     ft6, fs9, ft1
                  lui          a7, 893032
                  remu         tp, zero, a6
                  sltiu        s10, zero, -157
                  srai         a6, t5, 6
                  xor          a5, t3, t2
                  fmax.s       ft10, fa6, ft7
                  fsub.s       fs3, fs3, ft3, rup
                  fclass.s     a2, fs7
                  andi         s3, gp, -292
                  mulhu        s7, a1, s5
                  rem          t3, a1, s8
                  srl          a2, s7, ra
                  mulhsu       s1, a1, s2
                  sltiu        ra, gp, -1258
                  srli         gp, tp, 9
                  sub          s10, s4, s10
                  sltu         t5, s7, tp
                  fmv.w.x      fs10, s3
	fadd.s	ft6, fs1, fa1, rne
                  addi         s11, a3, -856
                  fsgnj.s      fs5, fs0, ft11
                  sra          a1, t1, zero
                  ori          s11, a4, -1297
                  remu         a2, s9, gp
                  or           t6, s11, s10
	fcvt.wu.s	tp, fa1, rne
                  fcvt.w.s     a5, ft7, rdn
                  xori         t4, s10, 318
                  or           t1, a6, s10
                  or           a5, zero, s3
                  addi         s10, s2, 532
                  remu         gp, s3, a2
                  fmax.s       ft1, fa3, fa6
                  xor          s10, sp, a4
                  ori          gp, a5, -772
	fcvt.wu.s	a4, fa6, rne
                  sltu         t0, a0, t6
                  sra          s1, a2, t3
                  fclass.s     gp, fs8
                  mulhu        tp, s3, s0
                  fcvt.s.wu    fs9, a1, rmm
                  fsgnjx.s     fa0, fa5, fs1
                  fsgnj.s      fs8, fs9, fa4
                  add          s1, a0, s5
                  fcvt.w.s     a7, ft6, rmm
	fsub.s	fs4, fa3, fa1, rne
                  mulhsu       t1, t1, s6
                  mulhu        t4, s1, a7
                  auipc        zero, 378749
                  addi         s9, a4, 798
                  lui          gp, 828154
                  fsgnjx.s     ft11, fs2, ft7
                  ori          s3, s8, -1777
	fcvt.wu.s	s0, ft10, rne
                  fmax.s       ft0, ft1, ft11
                  div          t4, s4, a1
                  rem          a5, s6, a2
                  sll          a4, s9, s3
                  fcvt.wu.s    a7, fs4, rup
                  srl          sp, a1, a7
                  fsgnjn.s     fs6, fs8, ft10
                  div          sp, s2, tp
                  srai         a5, a3, 1
                  sra          a6, s5, a1
                  fcvt.w.s     s1, ft11, rne
                  sll          s11, s3, a0
                  sra          a6, t5, t2
                  or           zero, s7, a0
                  auipc        tp, 623650
                  and          a1, a5, s2
                  xori         t3, a4, -738
                  sll          a7, t6, a4
                  fsgnj.s      fa6, fs1, fa1
                  srli         a1, zero, 7
                  slli         ra, s8, 1
                  mulh         gp, s8, a0
                  and          a5, s5, t4
                  fcvt.w.s     s3, ft11, rne
                  ori          s9, s1, -1492
	fcvt.s.wu	fs5, s4, rne
                  fmv.x.w      s2, fs8
                  fmin.s       ft3, ft1, fa2
                  fmax.s       ft2, ft10, fs0
                  slli         zero, t2, 25
                  sltu         gp, a2, zero
	fcvt.wu.s	a6, fs8, rne
                  fclass.s     gp, ft10
                  fsgnj.s      fs3, fs7, fs2
                  ori          s10, sp, 1627
                  srai         a5, s10, 9
                  sll          t0, s4, s7
                  fmax.s       fa3, fs10, ft7
                  flt.s        s2, fa7, ft1
                  or           t4, zero, a3
	fcvt.s.w	fa1, sp, rne
                  xori         a2, t4, -372
                  and          a6, t5, a2
                  fcvt.s.wu    fs3, gp, rtz
                  fadd.s       fs4, ft7, ft0, rne
                  sll          s1, a5, a3
                  andi         tp, t5, 1878
                  fsgnjx.s     ft8, fa2, fa0
                  fadd.s       fa4, fs1, fs5, rdn
                  fsgnjn.s     ft3, fa0, fs9
                  fclass.s     a1, ft1
                  mulhsu       a4, a4, a6
                  fmv.x.w      a4, fa2
                  slli         a1, a2, 28
                  remu         ra, t2, s3
                  fle.s        a7, fs6, fa0
                  fcvt.s.wu    fa7, t1, rdn
                  mulh         a4, t6, a4
                  mulh         sp, t1, ra
                  and          s4, s6, t4
                  fclass.s     zero, fs4
                  and          s4, s1, a4
                  div          t1, t2, s7
                  feq.s        ra, fs11, ft10
                  slli         s2, s7, 11
                  fclass.s     s1, fs0
                  xori         s0, t2, -163
                  mulh         ra, s0, s6
                  or           t0, a0, a2
                  fle.s        t6, ft9, ft10
                  srl          s4, s11, s5
                  slt          t6, t1, t4
                  srli         a6, s2, 14
                  xori         s2, s6, -502
                  sra          a4, a3, s7
                  addi         t6, s5, -1633
                  fmv.w.x      fa5, t3
                  fcvt.s.wu    ft4, t5, rne
                  andi         s3, t1, 305
                  mulhsu       a4, zero, gp
                  srli         a1, s0, 4
                  fmv.x.w      s1, fa2
                  fcvt.wu.s    s7, fs9, rdn
                  fsgnj.s      fs8, ft1, ft5
                  fmv.x.w      a4, fa6
                  xor          s6, a6, gp
                  fsgnjx.s     fa5, fs11, fs7
                  divu         s7, s6, sp
                  fsub.s       fs7, fa3, fa3, rup
                  flt.s        s11, fs2, fs10
                  addi         a1, gp, -1509
	fcvt.wu.s	t6, fa3, rne
                  ori          s9, a5, -199
                  ori          a5, s5, 1440
                  slli         zero, s1, 17
                  sra          s5, t6, t3
                  mul          a5, tp, t3
                  addi         s7, t5, 469
                  add          t4, s6, sp
                  feq.s        s3, ft0, fs7
                  nop
                  srai         s5, a2, 11
                  sub          s3, t1, a1
                  and          t4, t2, t2
                  sltu         s4, sp, t4
                  fcvt.s.wu    fa3, tp, rmm
                  rem          a1, tp, s7
                  and          s11, a0, t1
                  fsgnj.s      fs6, fs1, fa0
                  rem          a5, a2, tp
	fcvt.wu.s	a2, ft8, rne
                  fsgnjx.s     fs6, ft5, fs0
                  divu         s1, s6, a3
                  fsgnjx.s     fa3, fs10, fs7
                  srli         s3, t3, 19
                  mul          t1, a0, t2
                  xori         a7, s8, -1328
                  mulh         s1, a7, s9
                  mulhu        s10, t2, s5
                  fcvt.w.s     t5, ft3, rne
                  xor          s11, s2, t3
                  fmv.x.w      s3, fs6
                  mulh         t0, t0, s11
                  sltu         ra, s1, tp
                  lui          gp, 395165
                  andi         s10, t0, 1390
                  nop
                  xor          t0, a3, s2
                  mulh         s10, t6, a2
                  sra          a6, a5, tp
                  mulh         s9, t6, s10
                  mulh         tp, t1, s8
                  fcvt.s.w     fa0, t0, rup
                  and          s9, a3, gp
                  remu         sp, t2, s3
                  mul          t3, s3, gp
                  fsgnjn.s     fs3, ft5, fs8
                  div          t6, s11, a5
                  mulh         t2, zero, s7
                  sub          s10, t0, s7
                  fclass.s     t0, ft4
                  flt.s        zero, fs6, fs11
                  feq.s        zero, ft6, fa1
                  sll          t1, t3, t6
                  mulhsu       s5, a6, s6
                  sltiu        s0, t6, 26
                  slti         s5, t6, 495
                  mulhu        a7, s10, s6
                  auipc        s2, 31086
                  or           a4, s10, t3
                  lui          s1, 978408
                  fadd.s       fs8, ft3, fa3, rup
                  sub          s9, tp, ra
                  feq.s        zero, fa7, ft2
	fcvt.s.w	fs1, t5, rne
                  nop
                  fcvt.s.wu    ft11, zero, rmm
                  and          t1, s8, gp
                  sll          a2, s5, s1
                  fmin.s       fa6, ft3, ft11
                  mul          gp, s6, gp
                  add          a1, s2, s11
                  sltu         zero, s0, s7
                  srai         t0, tp, 27
                  slt          a5, s10, gp
                  ori          t1, s6, 544
                  nop
                  rem          ra, s6, t1
                  and          a4, s11, a1
                  fsgnj.s      ft11, fa6, fa1
                  srai         s11, a1, 9
                  fcvt.s.w     fs2, a2, rne
                  fle.s        s0, ft9, ft6
                  flt.s        a2, fa7, fa1
                  feq.s        a6, ft5, fs9
                  sltu         s5, t4, a3
                  slli         t2, a1, 20
                  sll          s1, t1, t5
                  srli         s0, s10, 1
                  mul          a1, gp, s5
                  sll          a7, t2, a4
                  addi         a2, s2, 1125
                  sll          t3, t5, s3
	fsub.s	ft7, fa6, fa1, rne
                  slt          t3, a1, tp
                  flt.s        a2, ft7, ft5
                  and          gp, gp, s7
                  fclass.s     s11, fs6
                  sll          s11, s10, sp
                  nop
                  divu         a7, ra, a1
                  andi         t4, t0, -818
                  fsgnj.s      ft5, ft1, ft9
                  fcvt.w.s     s1, ft5, rne
                  sltu         ra, s10, t2
                  fmv.w.x      ft0, s3
                  fmv.x.w      a5, ft10
                  fmax.s       fs1, ft6, ft2
                  srl          a2, a7, t4
                  xori         s2, t4, 645
                  div          sp, s8, a1
                  auipc        ra, 458902
	fsub.s	fs6, ft2, ft4, rne
                  fcvt.s.w     ft2, t3, rup
                  nop
                  fcvt.s.w     ft10, s11, rdn
                  andi         tp, a7, -1511
                  sub          s9, ra, ra
                  slt          a6, gp, s4
                  fcvt.s.wu    ft1, s3, rup
                  flt.s        gp, fs7, fa7
                  sll          t1, s9, a0
                  fsub.s       fa7, ft1, ft10, rne
                  nop
                  div          a6, s8, a6
                  fmv.w.x      fs5, t3
                  andi         a1, t2, -1241
                  slli         s0, s2, 31
                  slt          s0, a5, s1
                  andi         gp, s5, -1556
                  fcvt.s.w     fs3, s0, rup
                  srli         t4, a5, 12
                  fsgnjx.s     fa1, fs2, ft11
	fcvt.wu.s	s0, fs7, rne
                  andi         t3, s4, 1241
                  mulhsu       ra, t4, zero
                  mulhsu       sp, tp, a5
                  addi         s4, t2, 1070
                  sll          s1, ra, ra
	fcvt.s.wu	ft8, zero, rne
                  lui          a5, 27072
                  slli         t6, s11, 14
                  fle.s        s10, fs5, fa5
                  slli         sp, t6, 8
                  andi         s7, s11, -1184
                  mul          zero, s0, tp
                  fle.s        t1, ft8, fs4
                  srl          t0, s0, a2
                  fcvt.s.w     ft4, s0, rmm
                  sll          a5, s8, gp
                  mulhu        a5, sp, s7
                  slt          s3, s1, ra
                  and          t2, s5, s11
                  mulhu        a6, a4, s11
                  mul          t0, ra, s10
                  srli         s10, a3, 18
                  fadd.s       fs3, fs10, ft1, rdn
	fadd.s	ft10, fs11, ft7, rne
                  xor          t0, s8, t6
                  andi         s7, t0, -2045
                  divu         a2, s0, a5
                  mulhsu       sp, t0, a4
                  lui          a2, 475570
	fadd.s	fs10, fa3, ft8, rne
                  add          s11, a1, a3
                  or           t4, a7, s10
                  fadd.s       ft0, fs10, ft8, rmm
                  sll          s1, tp, gp
                  srai         t2, gp, 17
                  mulhu        t0, t2, t2
                  sltiu        t3, a4, 641
                  sra          ra, t0, s8
                  rem          s7, t0, s2
                  fcvt.s.wu    ft0, zero, rdn
                  mulhu        s11, gp, a4
                  fmv.x.w      t0, fa4
                  mul          s11, s9, s7
                  auipc        s3, 1026599
                  add          a1, a4, a4
                  fmv.w.x      fs8, t2
                  sltu         t3, a0, a0
                  fmin.s       fs8, ft0, ft9
                  addi         t1, gp, -1444
                  xori         t2, t6, 1622
                  mul          s3, ra, a3
                  slli         t1, a5, 26
                  auipc        t3, 607067
                  mul          s0, sp, a0
                  slti         s10, s3, 1061
                  fmv.w.x      ft8, ra
                  fcvt.s.wu    ft3, s9, rtz
                  fclass.s     s7, ft8
                  slti         s6, ra, 1187
                  fcvt.w.s     s0, fs9, rmm
                  fmax.s       ft9, fa6, ft1
                  fcvt.s.wu    fs5, t2, rmm
                  fmin.s       fs1, fs7, fa1
                  and          s4, a6, zero
                  xori         s2, t4, -64
                  fmv.w.x      fs6, t3
                  divu         s4, t1, a6
                  fmv.x.w      s10, fa3
                  mul          zero, s0, s10
                  fsgnjn.s     fa0, fs4, ft10
                  srli         s11, s6, 12
                  fmv.w.x      ft6, t5
                  slti         s1, s8, -184
                  addi         s5, s3, -284
                  nop
                  srli         a5, t6, 4
                  fmin.s       ft7, ft6, fs8
                  mulhsu       t1, s1, t4
                  rem          s4, ra, t5
                  fmv.x.w      a7, fs11
                  mulhu        s5, tp, gp
                  fsgnjn.s     fs9, ft7, fs11
	fadd.s	fa6, fa2, fs11, rne
                  fmax.s       ft0, fa4, ft1
                  feq.s        s0, ft2, ft7
                  mul          s7, a7, a0
                  xor          s10, t5, s1
                  sltu         t1, s2, t0
                  slli         s3, t1, 4
                  fcvt.wu.s    t1, fs1, rdn
                  slt          a5, t0, s3
                  sll          t5, ra, s4
                  fsub.s       fs8, fs1, fs7, rup
                  rem          zero, tp, a7
                  sra          t1, sp, s4
                  slli         t0, t6, 24
                  fmv.x.w      s7, fs7
	fcvt.s.w	ft4, a3, rne
                  sub          s3, a1, a1
                  sub          s11, s11, s11
                  mulhsu       t1, a3, sp
                  feq.s        t2, ft8, fa2
                  ori          t2, t5, 449
                  fcvt.wu.s    s4, ft8, rtz
                  remu         t3, s5, t5
                  flt.s        a4, ft9, ft3
                  fsgnj.s      fs11, fa5, fa0
                  mulhu        t2, s0, sp
                  fclass.s     zero, fa1
                  slt          s11, s10, tp
                  slti         s6, s4, 536
                  mulh         a2, a0, a4
                  ori          a7, a7, -1622
                  fsgnj.s      fs11, fa5, fa2
                  sra          sp, s6, t0
	fadd.s	fs0, fa6, fs6, rne
                  or           ra, a3, a7
                  fsub.s       fs10, ft1, fs7, rdn
                  sra          t0, s7, t4
                  div          a4, s9, t5
	fcvt.s.w	fs7, s11, rne
                  fle.s        a1, fa7, fa0
                  fsub.s       ft8, ft7, fs3, rtz
                  andi         s10, a0, -75
                  fsgnjn.s     fa1, ft4, fa2
                  sll          s11, a5, t6
                  feq.s        s5, fs5, fa2
                  auipc        a2, 850253
                  add          s6, t2, t6
                  and          gp, s9, s7
                  mulh         s10, t1, s1
                  sltu         t5, ra, s3
                  srli         a4, s3, 16
                  fmin.s       fs10, fa4, fa4
                  andi         t1, a7, -328
                  fle.s        ra, fs6, fa6
                  fadd.s       fa7, ft6, ft11, rmm
                  srai         ra, sp, 26
                  nop
                  mulhu        s9, t0, sp
                  rem          zero, a7, t2
	fcvt.s.wu	ft9, t4, rne
                  sll          t5, sp, sp
                  auipc        a7, 375047
                  fsgnjx.s     fa5, ft1, ft0
                  or           s5, a3, s1
                  nop
                  or           t0, a5, t6
                  xori         s6, gp, 459
                  sltu         s10, s10, s3
                  fmax.s       fs8, fa3, fs3
                  ori          a5, a1, 356
                  sltiu        gp, s1, 605
	fadd.s	ft3, ft11, fs1, rne
                  fcvt.s.wu    fs1, a4, rne
                  mul          a4, t3, sp
                  fmv.x.w      s1, ft7
                  srai         gp, a3, 13
                  add          s1, t0, s11
                  div          a6, a4, s0
                  fadd.s       ft11, fa4, ft10, rdn
                  fsgnjn.s     fs10, fs5, fa2
                  fmax.s       ft9, fa7, ft0
                  fcvt.s.w     ft3, a6, rne
                  fle.s        a5, fa2, fs10
                  fsgnj.s      ft5, ft8, fa7
                  mulhu        s6, zero, s5
                  auipc        s3, 532648
                  auipc        t3, 193524
                  fmin.s       fs3, fs5, fs6
                  fcvt.s.w     fa2, s8, rup
                  xori         ra, s9, 958
                  rem          zero, s7, t5
                  fclass.s     t1, ft7
                  mulhu        s11, zero, s11
                  fcvt.s.w     fa5, s4, rne
                  and          sp, s3, gp
                  nop
                  fsgnjn.s     ft6, fs11, ft10
                  remu         s2, t4, s1
                  feq.s        s6, ft7, ft4
                  feq.s        t3, ft10, fa4
                  sll          t6, s3, t1
                  mul          a2, t4, ra
                  or           s4, a3, t2
                  fmv.x.w      s11, fa4
                  fmax.s       fs4, fa4, fs5
                  lui          t1, 879221
                  srl          s5, s9, sp
                  flt.s        t0, fa1, fa1
                  ori          a6, s4, -942
                  xor          ra, t2, a4
                  mulhu        s7, s2, gp
                  rem          t1, s6, s2
	fcvt.w.s	a5, ft8, rne
                  add          t1, s4, s5
                  fadd.s       ft7, fs4, fa5, rne
                  sub          s11, s5, t2
                  fmin.s       fs11, fs0, ft11
                  addi         t1, zero, 1167
                  mulhu        s0, t1, s8
                  srai         t5, a7, 3
                  lui          a1, 443158
                  mulhsu       s6, a5, a0
                  mul          t1, a2, a2
                  srai         s3, zero, 27
                  mulhu        zero, t2, t0
                  fmv.w.x      ft0, a2
                  fmv.w.x      fs2, t5
                  fclass.s     s6, ft8
                  fmin.s       fs1, ft4, ft2
                  fcvt.wu.s    t1, fa3, rne
                  fsgnj.s      fs0, fs3, ft11
                  or           gp, t1, s10
                  slt          tp, s1, t0
                  mulhu        t5, s9, zero
                  srli         tp, ra, 10
                  mulhu        gp, t2, ra
                  srl          s3, t5, a2
                  sltiu        s3, a3, 63
                  fsgnj.s      fs9, ft8, fa7
	fcvt.s.w	ft1, s8, rne
                  flt.s        s4, fs10, fa0
	fadd.s	ft10, fs2, fs0, rne
                  fle.s        sp, ft10, fa2
                  fmv.x.w      a4, fa4
                  divu         t6, s6, s4
                  sra          s3, zero, s5
                  rem          ra, s3, a5
                  fmv.w.x      ft7, s8
                  divu         a4, t6, s9
                  mulhsu       tp, s0, sp
                  xor          t6, s2, t4
                  lui          s5, 700920
                  fclass.s     s2, fs10
                  remu         s9, s2, a5
                  xori         s10, a5, -1542
                  auipc        t5, 632354
                  mul          ra, s1, t2
                  srai         s3, s9, 19
                  fadd.s       ft5, fs5, fs0, rmm
                  mulh         a5, a2, zero
                  sra          a7, sp, s7
                  mulhsu       s1, a6, a5
                  fclass.s     a7, fs0
                  sub          ra, s0, t0
                  feq.s        a4, ft3, fs2
                  fsgnjn.s     fs3, ft3, fa1
                  fsgnjn.s     fs9, fa7, fs2
                  xori         tp, t3, 637
                  nop
                  srai         t6, ra, 16
                  fsub.s       ft1, fa6, fs10, rmm
                  flt.s        sp, fs1, fs11
                  remu         s11, s1, s4
                  lui          t4, 761490
                  fmax.s       fa6, fs7, fs0
                  sltu         gp, a1, a0
                  or           s5, s0, s7
                  sll          s2, tp, a4
                  mul          s0, a2, zero
                  sra          s11, s8, s9
                  lui          t1, 281843
                  fmax.s       fs9, fs11, ft3
                  fmin.s       ft0, fs10, ft2
                  andi         t6, s0, -596
                  divu         ra, a7, a2
                  mulh         tp, s5, s6
                  nop
                  xor          a4, s10, s1
                  fmin.s       ft11, fs0, ft1
                  sltu         t2, s11, t2
                  fcvt.wu.s    t2, ft8, rne
                  slt          t2, t5, s4
                  nop
                  sra          s10, a4, a7
                  sltu         t4, s11, s9
                  lui          s10, 719714
                  rem          tp, s2, t4
                  fmv.w.x      fa5, s3
                  fmax.s       fa3, fa3, ft10
                  slt          sp, sp, a7
                  srai         tp, s11, 29
                  and          t6, t6, s5
                  sub          t6, s5, tp
                  sll          s6, s10, t2
                  fsgnjn.s     fs8, fs10, fa0
                  ori          a6, s3, -1358
                  fle.s        s0, ft11, ft10
                  add          s11, a1, t6
                  srai         s5, t2, 22
                  add          s4, ra, s4
                  sltu         t3, a7, a0
                  remu         t0, s7, sp
                  slli         t2, a5, 4
                  sltu         s6, sp, s3
                  slt          a1, t1, gp
	fadd.s	fa6, fs0, ft10, rne
                  addi         s0, t6, 2006
                  srl          s0, t4, s5
                  xori         t1, s11, -1035
                  sltiu        t1, s2, -1900
                  divu         s4, sp, s11
                  fmv.w.x      fa6, t1
                  mul          zero, s6, s6
                  fcvt.w.s     s9, fa3, rne
                  sub          a4, t4, s9
                  add          t1, s2, s11
                  mulhu        tp, t2, a4
                  flt.s        s2, fs7, fa1
                  addi         t1, zero, -642
                  sub          a2, s7, s9
	fsub.s	ft3, ft10, ft6, rne
	fcvt.wu.s	s1, ft0, rne
                  mulh         tp, s1, t1
                  remu         s0, s6, s10
                  mulh         s11, tp, s0
                  and          ra, t2, s8
                  fcvt.wu.s    zero, fs7, rtz
	fcvt.s.wu	fa2, a5, rne
                  fle.s        sp, ft0, fa6
                  feq.s        a2, fa0, ft11
                  remu         s10, gp, tp
                  xori         t1, s11, 1232
                  fcvt.s.w     fa1, s5, rtz
                  mulh         t0, a4, a1
                  fcvt.s.wu    fs7, t1, rne
                  lui          a5, 936256
	fsub.s	ft11, fs3, fa7, rne
                  srl          t1, a5, zero
                  nop
                  mul          t1, a5, a4
	fsub.s	fs11, fs6, fa6, rne
                  add          t4, s5, t3
                  mulh         ra, s5, s11
                  andi         a6, t0, -1006
                  div          t6, ra, s4
                  fmin.s       ft11, ft10, fa2
                  and          t5, sp, a3
                  fsgnjn.s     ft8, fa5, fa6
                  fmv.x.w      tp, fs3
                  fle.s        a1, fs0, fs4
                  fmax.s       ft2, ft5, fs10
                  mul          s9, a6, s10
                  fclass.s     t4, fs8
	fcvt.s.w	fs7, t3, rne
                  flt.s        t2, ft5, ft11
                  slli         s11, s6, 14
                  auipc        t4, 999407
                  remu         t4, a7, s0
                  sll          t2, s10, t6
                  fcvt.s.wu    ft3, t1, rup
                  slt          a7, zero, a3
                  mulhsu       a7, s10, t6
                  fcvt.wu.s    a2, fa0, rtz
                  slt          a5, s6, zero
                  or           t4, t6, a2
                  and          tp, t4, a1
                  mul          a4, s1, s0
                  fsgnjn.s     fs0, fs1, fa7
                  mulhsu       s1, s5, gp
                  add          t1, a4, s2
                  fmv.w.x      fs3, t1
                  lui          ra, 274389
                  or           t0, a1, s3
                  remu         a6, sp, s11
                  mul          a5, a6, t3
                  slt          s6, t5, a5
                  mulhu        a4, a5, t2
                  add          t5, s10, s3
                  fle.s        t2, ft10, ft1
	fcvt.wu.s	a6, ft2, rne
                  mul          s2, zero, s2
                  fsgnjx.s     ft3, ft1, ft6
                  remu         a5, a2, s6
                  srl          t4, a6, s6
                  sll          zero, a2, s0
                  slt          s9, s9, s1
                  add          t2, a5, zero
                  flt.s        s6, fs9, ft0
                  rem          a4, t1, a1
                  addi         a1, a3, -653
                  div          gp, t5, gp
                  fmv.w.x      fs7, s5
                  sll          s1, a2, a2
                  sll          t5, s7, t1
                  lui          t0, 82231
                  fadd.s       ft0, fs2, fs6, rtz
                  rem          t1, zero, ra
                  xori         sp, s11, -1860
                  srli         tp, s8, 14
                  fcvt.s.w     fa5, sp, rup
                  fsgnj.s      fa1, fs5, ft9
                  sub          s11, s4, ra
                  sltiu        t6, a4, 1357
                  ori          tp, ra, -1230
	fsub.s	ft3, fa6, fs7, rne
                  mulhu        a7, a2, t2
                  fcvt.wu.s    tp, fs0, rne
                  sll          s9, s8, a1
                  sra          t0, a4, s9
                  srai         s2, t6, 2
                  and          s6, zero, a4
                  fcvt.w.s     sp, ft4, rmm
                  or           s10, s9, a7
                  nop
                  fclass.s     t4, ft3
                  fmax.s       fa7, ft1, fa4
                  fmv.w.x      fs8, a3
                  srai         tp, a0, 2
                  srai         t6, a3, 17
                  slt          a6, t1, s11
                  fle.s        zero, fs3, fa0
                  nop
                  srl          a4, t5, s1
                  srli         s4, t3, 21
                  mulhsu       s5, a0, a1
                  add          ra, s10, a2
                  feq.s        s1, fs7, ft4
                  slti         t5, t3, -1321
                  fclass.s     t5, fs11
                  mulhu        s10, s9, t4
                  xor          t5, s10, s6
                  lui          a5, 900676
                  sra          s7, s7, t2
                  sub          s2, tp, t2
                  lui          t2, 1004266
                  sra          tp, a6, s11
                  sltu         t5, a6, s3
                  addi         t4, t0, -1064
                  mul          t6, s3, t1
                  and          s9, a3, gp
                  mul          t3, ra, a1
                  fsgnjn.s     fa7, fs0, ft2
                  sltu         s4, t0, a3
	fadd.s	fa3, fs9, ft1, rne
                  srai         t4, s9, 25
                  fle.s        s1, ft2, fa5
                  fsub.s       ft3, fs7, ft11, rdn
                  fadd.s       ft5, fs7, fa7, rmm
	fcvt.w.s	s7, fs3, rne
                  rem          s1, s4, t6
                  fsgnjn.s     fs0, fa2, fs3
                  flt.s        s10, fs4, ft11
                  fmax.s       fs7, fa7, fs6
                  fclass.s     s9, fs0
                  slti         t1, t1, -303
                  addi         s11, t4, 1780
                  fcvt.w.s     ra, ft4, rtz
                  slli         t6, s8, 24
                  auipc        tp, 10803
                  fle.s        s0, fs11, fa3
                  div          a1, s4, s7
                  xori         gp, s10, -324
	fcvt.s.wu	ft6, t2, rne
	fadd.s	fs0, fs1, fa3, rne
                  srli         a4, t5, 3
                  or           s10, tp, a5
	fsub.s	fs0, fs1, fa0, rne
                  srai         s0, t6, 0
                  and          s11, s1, s9
                  sll          ra, sp, s6
                  sub          tp, a1, a6
                  divu         t1, s1, s1
                  slt          a5, s2, s2
                  remu         t6, t0, s11
                  sll          s5, s0, s10
                  fcvt.wu.s    t1, ft4, rmm
                  mulhsu       a6, t0, s7
                  andi         s11, ra, -1836
                  slt          gp, s2, a7
                  srai         a6, s8, 4
	fcvt.s.w	fs6, s1, rne
                  flt.s        a4, ft5, fa1
	fcvt.wu.s	s7, fa1, rne
                  fmin.s       fs6, fa2, ft3
                  and          t2, s11, t0
                  feq.s        s7, fa2, ft8
                  mulhu        s0, s1, a7
                  fmv.x.w      s9, ft11
                  srli         t0, t6, 4
                  srai         s11, a4, 10
                  rem          ra, t2, a1
                  srai         t4, t5, 20
                  fmv.w.x      ft1, s11
	fcvt.w.s	a4, ft5, rne
                  mul          s10, s0, s2
                  sra          s0, s6, a2
                  slli         ra, s1, 23
                  rem          s5, a1, t5
                  sll          t4, t2, s7
                  flt.s        s7, fs1, fa6
                  mul          tp, s11, s1
                  addi         ra, zero, -1069
                  fsgnj.s      ft9, ft9, ft1
                  flt.s        s7, ft8, fs1
                  fmin.s       fs4, fa2, fa7
                  sltiu        a6, s3, -288
                  fmin.s       fa7, ft3, ft7
                  srai         s10, s9, 2
                  auipc        t2, 34069
                  sltu         t3, ra, s8
                  slt          s0, t1, t2
                  feq.s        t2, ft8, fs11
                  slt          s0, sp, s8
                  remu         ra, s0, s8
                  fmv.w.x      fa0, s0
	fcvt.wu.s	s10, ft4, rne
                  fle.s        s5, fa6, fs5
                  rem          sp, a6, s10
                  srl          a1, s5, s1
                  mulhu        a2, s5, s11
                  mul          t0, s6, a4
                  mulhsu       s11, gp, s5
                  sra          s6, s0, a7
                  srai         t6, a2, 20
                  xori         s10, sp, -1325
                  fcvt.s.wu    ft5, t2, rup
                  remu         s7, a2, t0
                  fmv.w.x      fs3, sp
                  sra          t3, s8, t4
                  mulhsu       a6, ra, t0
                  add          gp, s3, a1
                  fsgnjx.s     ft4, ft6, fa2
                  rem          zero, t4, s10
                  srai         tp, zero, 17
                  fle.s        a4, fa4, ft8
	fadd.s	fs3, fa1, ft5, rne
                  fsgnjn.s     ft8, fa0, ft4
                  feq.s        t6, ft5, fa0
                  mulh         s10, t0, a5
                  addi         s3, a2, 1105
                  srl          t4, a5, zero
                  flt.s        s9, fs2, fs2
	fadd.s	fs2, ft7, ft9, rne
                  flt.s        t5, fs5, ft4
                  lui          a2, 625091
	fcvt.s.w	fa4, s0, rne
                  fsgnjx.s     ft9, fa6, fa5
                  or           s0, s8, t6
                  mulhsu       s5, ra, t1
                  lui          s0, 305676
                  add          s4, s5, a0
	fcvt.s.w	fs0, a0, rne
                  slli         a7, t5, 7
                  fsgnjn.s     fs6, fs9, fa7
                  divu         s7, gp, tp
                  sltu         a1, s0, s0
                  flt.s        s11, ft9, ft5
                  sra          s2, tp, a6
                  sltiu        s10, a3, 946
                  rem          tp, a3, ra
                  slt          t3, zero, t1
                  lui          t4, 168771
                  fsgnjn.s     fs3, fs6, fs5
                  addi         s9, s7, 1799
                  fcvt.s.w     ft9, tp, rdn
                  add          zero, zero, s8
                  mulhu        a4, s2, t5
                  mulhu        s6, ra, a2
                  fmv.x.w      a4, fs6
                  xori         s5, sp, -599
                  xori         a7, s6, 32
	fcvt.s.w	fs8, tp, rne
                  add          a1, ra, s2
                  xori         t2, t6, -504
                  fmin.s       ft2, fs11, fs2
                  sub          s5, s2, s4
                  auipc        t1, 1020207
                  mulh         t1, t3, a7
                  fmv.w.x      fs7, t3
                  xor          s5, s5, t4
                  divu         sp, s5, a6
                  fmax.s       fs5, fs4, ft4
                  mulh         a6, t5, s0
                  fmv.x.w      s4, fa5
                  srli         t3, zero, 14
                  fmax.s       fs1, ft7, ft9
                  fcvt.w.s     tp, ft8, rmm
                  slt          a4, t4, sp
                  fsgnjx.s     fa6, fs4, fa7
                  srai         sp, s10, 4
                  sltiu        s5, t1, 1080
                  mulh         s7, a1, t4
                  slti         t1, ra, 816
                  sll          s9, t3, t4
	fcvt.s.w	ft1, s8, rne
                  fmin.s       ft5, fs8, fs6
                  fle.s        a6, fs11, fa4
                  sra          sp, tp, s5
                  mulhsu       zero, s0, t1
                  sltiu        s5, a0, 1899
                  sll          tp, ra, tp
                  slti         s4, s8, 985
                  fadd.s       fs10, ft10, fs4, rmm
                  ori          a5, t5, 1266
	fcvt.wu.s	sp, fs8, rne
                  fcvt.s.wu    ft1, s3, rup
                  fcvt.s.w     ft0, sp, rne
                  mul          s0, s10, ra
                  fcvt.s.w     fs11, s4, rtz
                  mul          t0, s7, a1
                  fcvt.s.wu    ft11, s10, rmm
                  or           s11, s4, zero
                  mulhu        ra, a7, s9
                  sub          a7, a1, a2
                  mulhsu       s3, s0, t4
                  flt.s        s10, ft11, fs2
                  feq.s        a4, fa5, ft11
                  fadd.s       fs9, fs0, fs8, rup
                  rem          t3, s3, a4
                  fle.s        s9, fs6, fs3
                  rem          a2, zero, sp
                  slt          t3, t3, a1
                  fsgnj.s      fs6, ft7, fs2
                  rem          s11, zero, s9
                  fsgnj.s      fs11, ft2, ft2
                  auipc        t1, 55308
                  slti         t1, t2, -626
                  flt.s        t6, ft9, fa4
                  mulhu        ra, t3, s6
                  mul          t1, a4, gp
                  sll          s1, a3, a5
                  xor          s4, s1, s2
                  sll          t3, s6, a7
                  nop
                  fclass.s     a6, fa1
                  add          t2, t3, a4
                  fclass.s     s5, ft7
                  srai         s4, a1, 8
                  div          t0, ra, s1
                  slt          s1, s5, a5
                  slt          a2, t5, ra
                  nop
                  fclass.s     s0, fa3
                  divu         s9, gp, a1
                  andi         zero, s10, 326
	fcvt.s.w	fa3, a4, rne
                  fcvt.w.s     tp, fs4, rne
                  mulhu        ra, a5, s7
                  slti         t2, tp, -585
                  lui          gp, 204208
                  addi         s4, a1, 110
                  fsgnj.s      ft5, fs3, fs7
	fcvt.s.wu	fs8, sp, rne
	fadd.s	fs6, ft0, ft0, rne
                  sltu         s6, s5, s5
                  divu         a5, a7, a2
                  mulh         t2, a6, s3
                  fadd.s       fs7, fs10, ft7, rne
                  xor          t5, s5, a0
                  flt.s        t4, fa1, fs3
                  fmax.s       fs0, fs7, fa3
                  addi         s7, t5, 621
                  lui          a6, 330808
                  auipc        t5, 790119
                  andi         a4, sp, -872
                  sll          s2, s10, a5
                  mulhu        t6, s3, ra
                  fmv.w.x      fa5, t1
                  sltiu        s7, s2, 734
                  xori         s7, a3, 936
                  sltiu        ra, sp, -1692
                  srli         t1, s4, 28
                  fsgnj.s      ft1, fa5, ft2
                  auipc        t0, 162022
	fcvt.wu.s	s1, fa6, rne
                  or           a7, tp, t3
                  and          s4, a2, a2
                  auipc        s6, 697775
                  fmv.x.w      zero, fa7
                  slli         t1, s8, 22
                  fcvt.s.wu    fs10, s6, rtz
                  remu         a4, s2, a7
                  fclass.s     s11, fs3
                  flt.s        s9, ft11, ft4
                  ori          t6, a4, -1928
                  fsgnjx.s     fs5, fa2, ft5
                  slti         s1, t1, 1962
                  srl          s2, t6, tp
                  fsgnjn.s     ft5, ft10, fs2
                  sub          a2, t5, t2
                  xor          s1, s1, t3
                  fsub.s       ft0, fa2, ft9, rmm
	fadd.s	fs6, ft7, fa7, rne
                  mulhsu       s0, t1, s9
                  fcvt.wu.s    s1, fa2, rup
                  srli         tp, s11, 17
                  nop
                  fmv.x.w      t5, fs5
                  addi         a6, s10, -1915
                  andi         a4, t3, -515
                  sra          t2, t6, s4
                  lui          tp, 453315
                  fsgnjx.s     fa4, ft4, ft0
                  remu         t6, ra, s0
                  fmax.s       fs2, fa3, fs4
	fcvt.w.s	s6, fa0, rne
                  xor          s3, t2, t2
                  lui          sp, 980155
                  nop
                  addi         s2, gp, -279
                  slti         t6, t6, 537
                  mulhu        s6, t4, a2
                  srai         t2, a7, 11
                  slli         s10, s9, 10
                  fcvt.s.wu    fs4, a4, rup
	fsub.s	fa7, fs9, ft3, rne
                  flt.s        s1, fs11, ft8
                  fmv.w.x      ft0, t6
                  sltu         a1, s9, s0
                  fmv.x.w      a5, ft10
                  divu         t1, s10, t5
	fcvt.wu.s	t1, ft7, rne
                  mulh         s7, t6, s2
                  andi         a1, s8, 661
                  sltu         t0, t0, s7
                  sub          t1, gp, t1
                  xori         tp, s5, 2008
                  fle.s        s3, fa0, ft0
                  fle.s        gp, ft3, ft5
                  slt          s10, s2, tp
                  auipc        a1, 913695
                  fadd.s       ft1, fs10, ft0, rup
                  auipc        s11, 789346
                  ori          t6, s10, -1379
                  divu         s6, t5, s5
                  auipc        a4, 770351
                  addi         ra, s0, -1630
                  slli         t0, tp, 30
                  addi         t5, a5, -2027
                  auipc        s2, 995926
                  srai         s11, s5, 30
                  sltu         s7, t6, t2
                  andi         s9, s5, 768
                  slt          tp, s10, s5
                  fsub.s       fa4, fa7, ft4, rmm
                  slli         sp, s11, 15
                  sra          s1, a7, t5
                  div          s1, s0, a0
	fcvt.s.w	ft5, a0, rne
                  slti         a7, a4, -1274
                  slli         gp, a2, 10
	fcvt.s.w	fa7, s11, rne
                  fsgnj.s      fs7, fa3, fs2
                  fsgnjx.s     ft2, fs1, fs2
	fadd.s	fa0, fs1, fs1, rne
                  fsgnj.s      fs9, ft3, ft7
                  rem          t5, ra, a7
                  srli         a6, gp, 28
                  rem          ra, gp, gp
                  auipc        a1, 893651
                  slt          a1, s8, a3
                  ori          t4, a1, -2008
                  fcvt.s.wu    ft11, t6, rtz
                  fsgnjn.s     ft1, fs11, fs8
                  fle.s        sp, fs7, fa1
                  fcvt.wu.s    a7, fs3, rdn
                  or           a4, s10, t4
                  mulhsu       a4, s4, s2
                  sra          a7, s3, a5
                  fcvt.s.wu    ft5, t5, rmm
                  srai         s10, a3, 17
                  srai         tp, t5, 11
                  srli         s11, a0, 19
                  fsgnj.s      fa3, ft7, ft8
                  remu         t2, s2, t3
                  sltu         s6, t4, a4
                  fcvt.s.w     ft2, a0, rtz
                  remu         a5, ra, sp
                  xori         s4, a4, 207
                  mul          t4, a1, t4
                  fadd.s       fs10, fs10, fa6, rup
                  div          s10, a6, t3
                  fmin.s       fs9, fa5, fs8
                  lui          s9, 10426
                  sltu         t4, s1, zero
                  fmv.w.x      fa4, a3
                  fclass.s     t2, fa0
                  fle.s        t3, fa6, fa3
	fsub.s	ft5, fa5, fs7, rne
	fsub.s	fa1, fs8, fa0, rne
                  add          a1, t1, t0
                  slt          sp, s7, s6
                  sub          s0, t1, s7
                  lui          s1, 283567
                  fcvt.wu.s    a6, ft4, rup
                  auipc        a6, 138718
                  sub          t2, t5, s1
                  auipc        a7, 1001675
                  div          a1, s3, t6
                  auipc        s10, 936112
                  remu         s9, a5, t1
                  flt.s        a1, ft9, fa5
                  fclass.s     s6, ft6
	fcvt.s.w	fs3, tp, rne
                  srli         t2, sp, 18
                  sra          t1, a7, tp
                  xori         t5, s7, 1730
                  fsgnj.s      ft2, ft0, fa3
                  fmv.w.x      fs1, tp
                  xor          t6, t6, a1
                  sub          s7, s1, s6
                  srai         s3, tp, 15
                  xori         s3, s2, -1172
                  auipc        s5, 277949
                  mulhsu       s5, s1, t6
                  nop
                  fcvt.s.w     fa4, a4, rmm
                  xor          a2, s8, s6
                  fmv.w.x      fa6, s5
                  mulhsu       s5, ra, a7
                  auipc        zero, 783711
                  fcvt.wu.s    sp, ft11, rne
                  lui          s11, 678611
                  fclass.s     gp, fs2
                  srl          a1, a3, t1
                  add          s11, s11, a3
                  fmv.w.x      fs4, s5
                  rem          tp, s4, a6
                  fcvt.s.wu    fa3, t2, rdn
                  fsgnjx.s     fs3, ft3, ft2
                  fle.s        ra, fa0, fa1
                  fsgnj.s      ft1, fa2, ft6
                  and          t2, tp, t3
                  nop
                  and          s11, a0, a3
                  sra          s0, a6, gp
                  mulhsu       s7, ra, s8
                  remu         t0, t5, tp
                  fsgnjx.s     fa3, fs3, ft6
                  nop
                  fsgnjx.s     fa5, fa0, fa0
                  fcvt.w.s     s7, fa4, rtz
                  xor          s9, s0, s8
                  and          a7, s9, t3
                  add          tp, s10, s0
                  mulhsu       s1, t3, s11
                  mulh         zero, t2, t5
                  feq.s        a7, ft7, fa2
                  sll          a6, t5, sp
                  sltu         s6, t5, a0
	fsub.s	fs4, fs2, fa2, rne
                  sll          zero, t2, s8
                  srli         s6, a4, 18
                  sll          t5, s0, t3
                  sll          s1, sp, s5
                  flt.s        s10, fs9, ft1
                  fle.s        a4, fs4, ft9
                  andi         a7, s1, -498
                  fle.s        ra, fa4, fa3
                  auipc        ra, 126817
                  add          t3, t5, t5
                  fle.s        s9, fs3, fs1
                  remu         ra, a5, t1
                  fle.s        a7, fa3, ft8
                  srai         gp, t6, 10
                  sltu         s9, a3, t1
                  srli         s2, s4, 5
                  fmv.w.x      fa5, s5
                  sll          ra, t5, tp
                  sltiu        sp, s6, -337
                  mulhsu       a2, t6, t2
                  fmv.w.x      ft5, a1
                  slti         s2, zero, 1359
                  sra          s10, t1, s7
                  fsgnjx.s     fs10, fs9, fs1
                  fcvt.s.wu    fs4, a7, rdn
                  xori         t4, sp, -1285
                  sra          t4, s1, a3
                  div          a6, t4, s10
                  srli         a2, s2, 9
                  fmv.x.w      s2, ft1
                  slli         s2, s8, 19
                  feq.s        a2, fa2, fa5
                  rem          t3, gp, s7
                  and          s5, s6, a4
                  rem          t2, t3, t4
                  flt.s        t6, ft3, ft5
                  fsgnj.s      fs6, ft9, fa2
                  srli         sp, a7, 3
                  fadd.s       fs8, fs0, ft10, rup
                  fsgnjn.s     fa6, ft3, fa5
                  feq.s        s2, ft1, fs0
                  fmax.s       fa2, fs4, fa1
                  fcvt.wu.s    a1, ft6, rne
                  sll          t5, s10, t6
                  srli         s0, s3, 9
                  feq.s        a2, fa4, ft9
                  addi         a7, t3, -1871
                  fcvt.s.w     fa0, a5, rup
                  or           s0, t0, a3
                  fle.s        s10, fs1, fs1
                  slt          s2, s1, t4
                  remu         a7, s5, t1
	fcvt.wu.s	a4, ft5, rne
                  fmin.s       fs2, fa4, ft6
                  fcvt.wu.s    gp, ft9, rne
                  nop
                  fsgnjn.s     ft11, fa4, fs2
                  srl          a1, tp, s11
                  ori          t1, s0, 1191
	fcvt.s.w	fs4, t6, rne
	fsub.s	fa7, ft1, fa7, rne
                  fmv.x.w      s10, fs10
                  fclass.s     s2, fa3
                  mulh         t4, s11, t0
	fcvt.wu.s	t6, ft3, rne
                  sltiu        s6, sp, -1124
                  sltu         s5, tp, a2
                  addi         s0, t3, -153
                  and          a5, s4, t0
                  fmv.w.x      fa1, a7
                  fsgnjn.s     fs5, fs6, fs5
                  slt          tp, s8, gp
                  fcvt.wu.s    s2, fa1, rne
                  fclass.s     t0, ft9
                  fsgnjx.s     fs9, fs2, fs8
                  and          sp, s10, a4
                  or           t4, s9, a5
                  sll          a6, tp, s1
                  sltu         s7, t1, s7
                  mulhsu       gp, a3, s6
                  fcvt.w.s     t1, ft5, rne
                  rem          zero, s0, t0
                  sll          a6, a2, s4
	fcvt.wu.s	t6, fs2, rne
                  fmv.x.w      t5, fa0
                  slti         a1, zero, 971
                  fmax.s       fs0, ft11, fa0
                  fcvt.s.w     ft10, t2, rmm
                  fsgnjn.s     ft1, fs5, ft3
                  slti         s4, a1, -303
                  rem          sp, t3, t0
                  sll          s11, a1, gp
                  nop
                  slti         t5, zero, -1530
                  slti         ra, t0, -1657
                  sll          s0, s2, t5
                  rem          gp, t4, t2
                  divu         a6, s8, a2
                  srli         a7, s7, 28
                  slt          a6, t5, s0
                  feq.s        a4, ft8, fa3
                  or           s9, s8, t5
                  mulhsu       t1, s4, a2
                  fmax.s       fa3, ft11, fa0
                  div          a4, zero, t6
                  slli         s3, t3, 3
                  xor          sp, s4, a5
                  srai         ra, a5, 1
                  fsgnjn.s     fs0, ft10, fa4
                  mul          a2, s9, s10
                  div          s10, a6, a6
                  fmv.x.w      tp, fs2
                  sltu         s11, tp, s1
                  nop
                  fle.s        a1, fs3, ft7
                  fsgnj.s      ft7, fs3, fa5
                  addi         ra, s4, 576
                  add          s1, tp, s4
                  auipc        s7, 12606
                  slt          s5, s0, t0
                  srl          a2, a4, zero
                  xor          s1, t5, s8
                  fsgnjx.s     fa3, fs8, fs2
                  fsgnj.s      ft8, fs3, ft11
                  add          s6, s7, tp
                  fcvt.s.w     fs11, a0, rne
                  div          a2, s6, tp
                  srli         s7, ra, 28
                  sltiu        t3, a5, -1506
	fcvt.wu.s	t5, fa0, rne
                  slt          s11, ra, t4
                  fsgnjx.s     ft0, ft7, ft2
                  fle.s        s1, fs11, ft3
                  or           s9, t0, a6
                  and          s4, s11, t3
                  divu         t0, t1, s2
                  fcvt.wu.s    s11, fs4, rtz
                  srl          a7, s8, s0
                  sltiu        sp, a3, -599
                  auipc        zero, 523599
                  nop
                  fsgnjx.s     fs5, fs3, fs5
                  mulhu        s4, s4, tp
                  addi         s4, t5, -1713
                  fsgnjx.s     fa0, fs9, ft9
                  fmv.x.w      s11, ft9
	fadd.s	ft1, fs1, fs5, rne
                  and          a7, s5, s6
                  or           sp, s6, ra
                  or           s6, t4, a7
                  divu         a7, s1, a0
                  feq.s        s11, ft5, fs4
                  rem          gp, t5, s7
                  mulh         t0, t4, t6
                  div          a7, t3, ra
                  fmv.x.w      t0, fs5
                  mulhu        s11, s11, t6
                  fmax.s       fs3, fs7, ft6
                  srl          s5, t5, s4
                  srli         a6, t4, 24
                  xor          s3, s1, a6
                  fcvt.w.s     s6, ft5, rmm
                  fsgnjn.s     ft0, fs7, fs1
                  feq.s        t4, fs7, ft3
                  mulhsu       ra, t1, t1
                  ori          s4, t2, 267
                  sltu         t3, s3, s5
	fcvt.s.w	fs1, s0, rne
                  sll          tp, a6, a3
                  div          t2, s3, s8
                  div          s2, s4, a2
	fsub.s	fs9, fa5, fs9, rne
                  slt          gp, s11, t4
                  flt.s        s11, fs3, ft4
                  remu         a4, a4, a0
                  xori         ra, s11, -1138
	fcvt.s.wu	fs1, s3, rne
                  fsgnjx.s     ft0, fs1, fs2
                  srai         tp, a1, 26
                  addi         tp, ra, 1633
                  flt.s        s7, ft3, fa4
                  sub          s0, a0, s1
                  xori         s4, tp, 1161
                  srai         s7, s1, 28
                  srli         s10, a7, 24
                  mulh         tp, a4, s7
                  remu         t2, ra, tp
                  addi         t0, a5, 686
                  or           s1, s5, a5
                  remu         tp, s10, a4
                  or           s11, t2, t3
                  fle.s        s0, ft10, fa5
                  auipc        a2, 91627
                  fmv.w.x      ft3, zero
	fsub.s	fa4, ft10, fs8, rne
                  slt          t2, zero, a1
                  fcvt.w.s     s2, ft7, rtz
                  mul          s6, a1, a1
                  ori          s9, zero, -611
                  sra          s6, s3, a4
                  mulh         t4, sp, a5
                  fle.s        t5, ft4, ft0
                  sll          sp, a3, a7
                  fsgnj.s      fs10, fa0, ft5
                  fmv.x.w      s4, fs2
                  add          s1, a1, s10
                  xori         s7, a2, 984
                  fle.s        a7, fs5, ft6
                  fmv.w.x      ft6, a6
	fcvt.w.s	t6, ft11, rne
                  fsgnjn.s     fs4, ft3, fs6
                  div          s5, a0, s9
                  flt.s        s7, ft5, ft3
                  sll          a6, a6, t4
                  fcvt.s.w     fa5, a0, rtz
                  fcvt.s.wu    ft9, t2, rup
                  fsub.s       ft6, fa4, fa2, rmm
                  fsgnj.s      fs10, fa2, ft1
                  nop
                  remu         a7, s3, s6
                  andi         a1, sp, -1616
                  srli         s0, zero, 25
                  sra          a2, a5, s1
                  and          a4, a7, s5
                  slli         a2, t6, 25
                  fle.s        s5, ft1, fa6
                  sub          a1, s6, s5
                  fclass.s     a7, fa7
                  addi         t6, s6, -816
                  fsgnj.s      fa3, ft11, ft5
                  ori          tp, ra, -310
                  xor          a6, s3, a4
                  feq.s        a6, fs4, fs3
                  rem          s7, a7, zero
                  slti         t3, s11, 1729
                  divu         s3, s9, ra
                  sltiu        a5, a0, -2034
                  sub          ra, t6, t2
                  auipc        s4, 669994
                  addi         t5, t6, -1636
                  nop
                  feq.s        t3, fa2, fa0
                  mul          tp, s3, s0
                  fmin.s       ft10, ft10, fa2
                  fsgnjn.s     ft4, ft1, fa0
                  add          t6, a5, s5
                  srai         s6, a7, 17
                  andi         a2, t1, -977
	fsub.s	ft9, fs2, fs6, rne
                  lui          s10, 468052
                  mul          s11, a3, s4
                  remu         s2, a3, s10
                  add          t3, s0, t2
                  divu         s1, s0, s9
                  fle.s        t1, fs7, fa4
                  fcvt.wu.s    zero, fs1, rtz
                  srl          a2, a3, a5
	fcvt.s.w	ft2, s3, rne
                  or           t1, s4, s0
                  mul          tp, s0, sp
                  slt          s5, t1, a0
                  remu         a4, a4, s1
                  flt.s        a1, fa2, ft8
                  fadd.s       ft8, ft8, fs1, rtz
	fcvt.wu.s	s9, ft7, rne
                  fmv.x.w      a7, ft11
                  and          t1, s10, s11
                  sll          t5, sp, a6
                  sub          a6, a0, gp
                  slli         a1, ra, 31
                  mulh         a6, gp, zero
                  mulhu        t1, s4, s2
                  sra          s3, gp, s7
                  slt          s2, t1, gp
                  fsgnjn.s     ft1, fs11, ft9
                  feq.s        s9, fs8, fa5
                  lui          s1, 79251
	fcvt.w.s	s7, ft1, rne
	fcvt.w.s	s6, ft5, rne
                  and          s10, s9, s6
                  addi         t5, sp, -1425
                  rem          t3, a7, s9
                  div          a5, s10, a6
                  mulhsu       a7, s10, s4
                  fsgnjx.s     fs8, fs3, ft2
                  addi         s7, s9, -733
                  sltiu        s2, t3, -588
                  auipc        t1, 776328
                  fle.s        s6, fs10, fs5
                  fsgnjn.s     ft0, fs5, ft8
                  flt.s        t5, ft1, fs0
                  add          s2, t2, s10
                  mulhsu       s1, a5, s0
                  slt          tp, t2, s7
                  xor          a1, a2, s4
                  rem          a4, gp, t3
                  fcvt.s.w     ft3, a7, rtz
                  slt          a2, gp, s1
                  fclass.s     s7, ft11
                  mulhsu       ra, s3, t2
                  and          ra, s9, s6
                  sra          s3, a0, t0
                  mulhsu       t6, s8, a4
                  auipc        t1, 739327
                  auipc        t0, 530729
	fcvt.s.w	ft9, t3, rne
                  mulhsu       a6, gp, t0
                  slt          t5, a6, s3
                  fsgnjn.s     ft2, fa0, fs5
                  fsgnjn.s     fs2, fs0, fs4
                  nop
                  auipc        s0, 4063
                  srl          t4, s3, zero
                  and          s5, s1, t4
                  fsgnjx.s     fa5, ft7, ft4
                  lui          s0, 532072
                  fclass.s     t5, fs9
                  remu         s3, t3, t1
	fsub.s	ft3, ft1, ft3, rne
                  fmv.x.w      s5, ft5
                  feq.s        a2, ft6, ft2
                  fsgnj.s      fs4, fs8, ft8
                  fle.s        s9, ft8, fs0
                  fsgnjn.s     ft8, ft4, ft5
                  fmin.s       fa0, fs8, fs9
                  mulhu        a5, t6, s2
                  auipc        sp, 572882
                  fmv.w.x      fs2, a4
                  addi         ra, t2, 115
                  xor          t5, t1, a5
                  rem          s5, s3, a2
                  fmin.s       fs4, fs0, fs3
                  slti         zero, a6, 1691
                  flt.s        s4, ft6, ft6
                  ori          t3, s2, -1403
                  fsgnjn.s     fa3, fs5, fs1
                  div          tp, t5, t3
                  fcvt.s.wu    ft11, s0, rtz
	fadd.s	fs4, ft1, fs4, rne
                  fcvt.w.s     a6, fs6, rmm
                  fmv.x.w      a7, fa1
                  mulhsu       t5, s2, a5
                  fmv.w.x      fs10, s8
                  fclass.s     t0, fs6
                  sltu         s3, a7, a3
                  mulhsu       t6, tp, a4
                  div          a5, s5, sp
                  andi         s4, t5, -1484
                  mul          s0, s4, a7
                  lui          a4, 431410
                  fcvt.w.s     t4, fa2, rmm
                  sra          s3, a0, t0
                  xor          s10, s10, s2
                  fsgnjn.s     ft0, fa3, ft3
                  fsgnj.s      ft3, ft0, fa5
                  fmax.s       fs0, ft9, fs0
	fcvt.s.w	fs7, t2, rne
                  ori          s5, a7, -744
	fcvt.s.wu	fs2, s6, rne
	fcvt.w.s	s1, fs3, rne
                  remu         s11, s9, zero
                  or           t4, zero, gp
                  nop
                  sltu         s11, zero, t3
                  flt.s        sp, fs9, fa7
                  sub          s6, t2, gp
                  nop
                  fmv.w.x      fs5, a0
                  auipc        s2, 538364
                  srai         s3, s2, 9
                  divu         s3, sp, gp
                  mulh         a2, a4, a1
                  lui          a4, 703632
                  srl          t4, a1, s1
                  nop
                  fclass.s     s10, fs11
                  lui          t5, 470431
                  ori          t5, a6, -1598
	fsub.s	fa3, ft10, fa6, rne
                  div          a5, s0, a7
                  fmv.w.x      fa5, s10
                  srli         a4, s9, 13
	fcvt.w.s	t4, fs10, rne
                  mulhsu       s7, a4, t4
                  flt.s        s11, fs11, fa1
                  fmv.x.w      t5, fs3
                  fcvt.wu.s    zero, ft7, rne
                  sub          s10, s9, gp
                  rem          t2, gp, t4
                  fclass.s     a2, ft3
                  sll          s9, tp, s6
                  add          a2, a5, s6
                  rem          t2, s0, s11
                  fadd.s       ft3, fa3, ft4, rup
                  srl          a5, ra, s4
                  sub          a1, tp, a4
                  xori         t0, s10, -1924
                  ori          s10, s1, -561
                  divu         a1, t6, a5
                  srai         s9, t4, 7
                  slli         zero, a4, 15
                  fsgnjx.s     fs4, fs11, fs10
                  srl          s11, t5, t3
	fcvt.w.s	tp, fs9, rne
                  slt          s3, s3, s8
                  fmax.s       fs5, fa6, ft1
                  fsub.s       fs9, fa0, fs11, rdn
                  add          a6, a2, s0
                  srai         tp, s2, 1
                  fsgnjn.s     fa0, fs5, ft8
                  or           gp, t3, sp
                  ori          a5, s7, 684
                  flt.s        s5, fs7, ft11
                  feq.s        a6, fs5, fs0
                  fclass.s     t4, fs6
                  divu         a7, a5, s9
                  sll          t4, s8, s5
                  xor          t2, a3, t6
                  and          a6, s2, a5
                  slt          zero, ra, s2
                  add          sp, s9, a4
                  mulhu        t1, gp, tp
	fsub.s	fa3, ft0, fa5, rne
                  and          t5, a2, t4
                  sra          t6, t5, t1
                  fcvt.s.w     ft8, s7, rmm
                  srli         gp, tp, 4
                  sra          t3, tp, a2
                  xor          t3, t1, t2
                  srl          s3, gp, sp
                  mulhsu       s6, a2, a6
                  fmin.s       fs6, ft9, ft4
                  add          a2, s9, s8
                  feq.s        s3, ft11, ft9
                  fsgnj.s      fs7, ft4, fs10
                  fsub.s       ft2, fa5, fs10, rmm
                  mulhu        s2, s8, sp
                  sub          s3, s2, a1
                  flt.s        s3, fa6, ft5
                  fsub.s       fa5, fa5, fs6, rne
                  divu         s5, t1, a3
                  mulhu        t4, a7, t4
	fcvt.s.w	ft7, s0, rne
                  sltiu        s10, a2, 1502
                  fmv.w.x      fa0, t0
                  mulhsu       t3, s1, s9
                  auipc        t5, 609524
                  sub          t5, tp, a0
                  fmv.x.w      s3, fs11
                  fmax.s       ft3, fs11, ft10
                  remu         t2, a7, a3
	fcvt.w.s	s9, ft2, rne
                  srai         s6, gp, 27
                  remu         s6, t5, zero
                  fcvt.w.s     a2, fs11, rdn
                  srli         a2, t6, 9
                  sltu         zero, t2, t3
                  fmin.s       ft6, fs5, fa6
	fcvt.s.w	fa6, s0, rne
                  sltiu        zero, a7, -520
                  flt.s        t6, fa2, fs3
                  srli         s9, s0, 12
                  fle.s        s0, fs0, fa1
                  fclass.s     s10, fa6
                  addi         tp, t2, 1301
                  lui          t0, 525925
                  srli         sp, s2, 10
	fadd.s	fa0, fs5, fa0, rne
                  andi         t0, zero, -1884
                  fsgnj.s      fa7, fs11, ft11
                  add          s10, a7, s8
                  addi         s3, s11, -1514
                  slli         t1, a0, 19
                  nop
	fcvt.s.w	fa6, a6, rne
                  addi         t3, s9, -801
                  remu         s0, s2, s7
                  srli         s10, a6, 27
                  fadd.s       fa1, fs0, ft10, rne
                  fmax.s       ft9, fs5, fs0
                  lui          s6, 861716
                  mul          a2, t6, a1
                  sltu         t3, s11, a6
                  mul          t4, a1, a0
                  xori         t4, t2, -1885
                  srl          a6, s8, a3
                  fmax.s       fs7, fs1, ft7
                  fsgnjx.s     fa0, fa7, fs6
                  srai         s5, a4, 1
                  fcvt.s.w     fa5, s7, rmm
                  mul          s10, a7, a7
                  mulhu        a7, t2, s0
                  slti         s5, t4, -398
                  sra          a1, s10, a7
                  sll          sp, tp, s6
                  mulhsu       s0, a6, t4
                  fcvt.wu.s    tp, fa6, rne
                  sll          s7, s4, tp
                  slti         s9, a4, 1781
                  add          s4, a3, gp
                  fmax.s       ft8, fs7, ft1
                  divu         t3, s7, t0
	fcvt.w.s	zero, ft10, rne
                  fcvt.s.wu    ft9, s8, rmm
                  flt.s        a7, ft4, fs6
                  or           a2, a4, s0
                  auipc        t4, 349420
                  mulhsu       a5, s8, s10
                  fclass.s     t5, ft9
                  nop
                  slli         gp, s6, 29
                  sll          gp, s7, tp
                  srai         ra, s5, 9
                  and          s2, s11, t6
                  xor          s3, ra, s4
                  slt          t2, a2, gp
	fcvt.wu.s	tp, fs1, rne
                  add          s4, a7, s7
                  fmv.w.x      fa1, s9
                  mulhsu       sp, t4, s6
                  ori          s9, tp, -833
                  auipc        a6, 579864
                  lui          ra, 654885
                  fsgnjx.s     fa0, fs11, ft1
                  fmax.s       ft5, fa5, ft6
                  sltiu        a4, a6, -120
                  or           t0, zero, s1
                  divu         a1, a5, ra
                  nop
                  mul          s10, a6, tp
                  div          t4, a7, t2
                  fmv.w.x      ft10, zero
                  remu         a4, t1, s4
                  fmax.s       ft1, fa4, fa6
                  divu         gp, a5, s0
                  sra          s9, t5, s6
                  remu         s9, s7, s7
                  fsgnjn.s     fs3, fs8, fs2
	fcvt.wu.s	s2, ft8, rne
                  fmv.x.w      s11, fa1
                  slli         s6, s1, 12
                  slli         a6, s2, 10
                  sltu         t2, a1, s7
                  fcvt.wu.s    a6, fa2, rdn
                  andi         t4, s3, -503
	fcvt.wu.s	t5, fs7, rne
                  xori         tp, a5, -1644
                  add          s10, a6, sp
                  xor          s2, gp, gp
                  mulhu        tp, t4, s1
                  flt.s        sp, fs6, fs9
	fcvt.s.wu	ft9, s7, rne
                  sll          a1, s9, a4
                  nop
                  ori          a5, a3, 1548
                  nop
                  mulhsu       s11, s2, zero
                  feq.s        s5, fs11, ft5
                  flt.s        a7, fa2, ft1
                  divu         s9, s11, a5
                  remu         ra, a5, s5
                  mulh         s0, t4, a0
                  fmv.w.x      fs3, s1
                  sra          a2, gp, t1
                  slti         gp, t1, 2026
                  fmv.w.x      fs2, t1
                  feq.s        t1, ft3, fs1
                  sra          t6, gp, t2
                  andi         a1, a0, 1909
                  fsgnjx.s     ft2, ft6, fs0
                  fmv.w.x      fs0, zero
	fcvt.s.w	ft8, t5, rne
                  sll          t6, s6, s10
                  lui          t4, 192591
                  or           t2, a2, s2
                  div          a2, s4, a2
                  fmv.w.x      ft8, gp
                  fmv.x.w      a2, ft6
                  xor          s5, zero, a7
                  mul          s7, a4, s10
                  xor          s0, t3, t4
                  slli         s7, s0, 17
                  srai         tp, zero, 25
                  rem          a6, s1, t3
	fsub.s	fa0, fs3, fs2, rne
                  flt.s        s6, ft10, ft10
	fsub.s	ft2, fs11, ft6, rne
                  srli         t5, a1, 9
                  mulhsu       a2, s6, s9
                  mulhu        s7, gp, t2
                  feq.s        a6, fa4, fs10
                  fcvt.wu.s    s11, fa3, rtz
                  srl          t6, a6, gp
                  sub          ra, s7, s4
                  fmv.x.w      t2, fs0
                  fmin.s       fa7, fs9, fs10
                  and          zero, zero, tp
                  fmax.s       fs5, fa6, fa2
                  fmax.s       ft2, fa4, fs10
                  xori         s7, ra, 166
                  feq.s        t6, ft7, fs8
                  slti         t2, sp, 125
                  fsgnjn.s     fs0, fs8, fs2
                  slti         s2, gp, -1458
                  ori          a2, a4, -186
                  fmv.w.x      fs5, s3
                  fsgnjx.s     fa5, fs9, fs0
                  nop
                  lui          a6, 897929
                  nop
                  andi         s0, a4, 1361
                  fsgnjn.s     ft2, fs0, fa1
	fcvt.wu.s	t0, ft1, rne
                  srl          t4, ra, a2
                  fcvt.s.w     ft4, zero, rne
                  slti         s9, a1, -1738
                  slli         t1, s4, 15
                  srl          s6, s4, s2
                  fclass.s     a6, fs4
                  xor          gp, a4, a3
                  srai         s0, gp, 19
                  fsgnjn.s     fs10, fs2, fs5
                  fcvt.wu.s    a4, ft0, rne
                  or           s9, t2, s7
                  fmv.w.x      fs0, gp
                  lui          a7, 145723
                  fsub.s       fa2, fa0, ft3, rup
                  mul          s0, t0, gp
                  and          t3, tp, gp
                  auipc        a1, 766870
                  xor          s5, zero, a7
                  fmv.w.x      fa4, s7
                  mul          a6, t2, s9
	fsub.s	fs1, ft4, ft8, rne
	fcvt.s.wu	ft4, s1, rne
                  srai         t6, a1, 30
                  fmax.s       fa3, fs0, ft1
                  xori         t6, t0, 8
                  fadd.s       fs0, ft1, ft0, rup
                  mulh         a2, s6, s3
                  slti         t2, t6, -1252
                  flt.s        a5, fs9, ft0
                  andi         s6, t6, 1350
                  mulhu        s11, gp, s10
                  sub          ra, s7, t1
                  ori          s6, tp, 769
                  and          s4, a6, a3
                  fle.s        t4, ft10, ft7
                  remu         t1, a4, t3
                  mulhu        a2, ra, s0
                  xor          a5, a4, sp
                  srli         s4, a3, 24
                  sltu         s10, s3, t3
                  mulhsu       s3, s1, a2
                  mulh         t6, s8, s4
                  mulhsu       t6, a3, s0
                  slli         s4, t0, 9
                  div          a1, t0, s7
                  sll          a2, s0, s10
                  fsgnjx.s     ft9, fs4, ft7
                  mulh         t1, s2, a7
                  div          a7, t3, s4
                  srai         s9, a0, 24
                  add          s9, s2, s3
	fadd.s	fs4, ft6, fs9, rne
                  xor          sp, s5, s8
                  fsgnj.s      fs4, ft3, fs8
                  ori          tp, a0, -340
                  addi         s11, s8, 437
                  divu         t3, t1, t5
                  fmv.x.w      s0, fa7
                  xori         s6, t4, -40
                  xor          s6, t3, a5
                  fmv.w.x      ft6, a6
                  add          t5, gp, sp
                  and          ra, s5, sp
                  fsgnjx.s     fs4, fs7, ft4
                  div          s9, tp, s3
                  slt          s9, t0, a6
                  fle.s        t5, fs7, ft4
                  remu         s4, a5, sp
                  xori         ra, ra, 623
                  sltiu        s2, a7, -437
                  srli         s6, s1, 11
                  fsgnjn.s     fs5, fs7, fs1
                  mulh         s4, s10, s5
                  mulhsu       a6, ra, s8
                  sll          s11, s5, a2
                  fclass.s     a1, fa5
                  fmv.x.w      a2, ft5
                  mul          s4, tp, s8
                  feq.s        t6, fs8, ft10
                  div          s5, ra, s3
                  slt          s10, t4, a0
                  fclass.s     s0, fs11
                  and          s11, a3, gp
                  sll          s3, a2, a2
                  auipc        t4, 184366
                  xori         s0, a2, 1895
                  remu         a2, a2, a1
                  sra          s9, s5, s6
                  auipc        a5, 672500
	fadd.s	ft10, ft7, ft8, rne
                  xor          t2, zero, s2
                  flt.s        a2, fa4, ft2
                  ori          s9, t1, 285
                  add          t6, s6, a2
                  div          gp, s7, t5
                  divu         a2, a3, a0
                  fsgnjx.s     fa3, fa7, fs0
                  fmv.w.x      ft4, t5
                  mulhu        a1, a2, a7
                  sltiu        s0, ra, -1639
                  fmv.x.w      s0, fs7
                  feq.s        a2, fs5, fs5
                  srai         a4, gp, 24
                  addi         s5, a7, 1581
	fsub.s	fa7, fs10, ft10, rne
                  mulhsu       t6, t2, a5
                  flt.s        s4, fa6, fs4
                  fmin.s       fs11, fs0, fa3
                  xor          gp, s10, t0
                  addi         a7, s5, 1953
	fcvt.wu.s	s2, fa2, rne
                  fsgnj.s      ft3, fs0, fs4
                  mulhsu       a2, s7, s3
                  fcvt.s.wu    ft5, zero, rup
                  slti         t4, t2, 149
                  fsgnj.s      fa4, ft8, fa1
                  fsub.s       fs0, fa6, fa2, rdn
                  sll          ra, s3, a1
                  fsub.s       fa0, fs6, fa6, rtz
                  fle.s        a5, fs2, ft11
                  divu         a1, t5, s0
                  srai         tp, zero, 3
                  auipc        t0, 330135
                  ori          zero, a1, 130
                  auipc        t1, 696778
                  slt          s7, t5, tp
                  auipc        s6, 841056
                  div          a6, a0, a5
                  fcvt.s.wu    fs0, s3, rmm
                  rem          zero, a7, s2
                  fsgnj.s      ft11, fs11, ft0
                  div          s9, s9, s2
                  mulhsu       zero, a7, s6
                  ori          t6, a3, -634
                  divu         gp, a3, s6
                  fsgnjx.s     fs11, fs4, ft9
                  sll          t5, t1, s6
                  fsgnjn.s     ft7, fa2, fa6
                  fcvt.wu.s    t0, fs4, rne
                  mulh         a6, zero, s5
                  mulh         t0, s5, a7
                  fcvt.s.wu    fs6, s7, rtz
                  feq.s        s7, ft7, fa3
                  srli         a2, t3, 24
                  slt          s11, a0, a4
                  feq.s        t4, ft1, fs8
	fcvt.w.s	t0, ft2, rne
                  ori          t5, a7, 871
                  slti         t0, s3, -718
                  sra          s5, ra, s6
                  divu         sp, a2, a7
                  lui          a4, 424700
	fcvt.w.s	a7, ft11, rne
                  mulhsu       gp, s5, a5
                  xor          t4, s6, a2
                  fmv.x.w      sp, fs10
                  sll          sp, s6, sp
                  fsgnjn.s     ft1, fs6, fs1
                  divu         a1, tp, a1
                  sub          a2, s9, s2
                  srl          s9, s10, t5
                  remu         s11, s5, s10
                  mulhu        gp, s7, s5
                  fclass.s     s4, ft9
                  feq.s        sp, fs6, fa4
                  fmin.s       ft9, fa7, fs3
                  fcvt.w.s     a6, ft4, rmm
	fcvt.s.wu	fs10, s6, rne
	fcvt.s.w	fs1, a4, rne
                  fmin.s       ft5, fs3, fa6
                  sltiu        s11, t2, -14
                  fmax.s       fs4, ft6, fa3
                  sltu         gp, a7, a0
                  divu         zero, s0, a0
                  sra          s0, t0, tp
                  fle.s        s0, fa2, fs10
                  fadd.s       fs4, fs6, ft11, rne
                  fmv.w.x      fa2, t4
                  and          s9, s7, zero
                  or           t2, t5, a7
                  fmv.w.x      ft10, a2
                  addi         t0, s9, -1297
                  mulhsu       a1, s9, s2
                  divu         zero, a6, a7
                  fmin.s       fs9, fa4, ft0
                  addi         s0, s8, -859
                  or           s3, s8, a7
                  fmin.s       ft1, fa2, fs9
                  fle.s        t2, fa0, fa1
                  sltu         t4, s0, t4
                  remu         t0, a0, a5
                  or           s2, t6, t2
                  fsgnj.s      ft9, ft1, fs9
                  fsgnjx.s     fs1, fs2, ft3
                  sra          s6, s11, t2
                  slt          t3, s5, a6
                  fsgnjx.s     ft10, fs6, fs5
                  srai         s7, t5, 15
                  flt.s        s2, fa3, fa1
                  mul          s2, zero, s0
	fcvt.w.s	a7, fs0, rne
                  rem          tp, t2, s0
                  srli         t2, s0, 28
                  and          a2, t5, a7
                  and          s7, s11, a3
                  add          s6, gp, sp
                  sub          s1, a0, a0
                  mulhu        s11, t4, zero
                  mulhu        a1, s5, s4
                  rem          t5, s8, sp
                  slt          gp, t4, a7
                  sltiu        t0, t1, 186
                  mulhsu       a5, s2, a5
                  addi         a1, t4, 1766
                  sll          s7, a7, a4
                  slti         s11, t0, 1868
                  auipc        s1, 687023
                  fsgnj.s      ft7, fs10, ft11
                  andi         t4, t2, 186
                  srl          s10, s3, t6
                  fle.s        s3, ft4, fa0
                  mulhu        s2, t4, a1
                  xori         t2, s6, 999
                  add          s11, s2, t6
                  fmv.x.w      s3, ft6
	fcvt.wu.s	gp, fa0, rne
                  rem          a1, a4, s5
                  nop
                  fsgnj.s      fa3, fs3, ft3
                  sra          s10, s4, a5
                  fmin.s       fs1, ft10, fa7
                  lui          t2, 748988
                  fsgnjn.s     fa3, ft5, fs4
                  xor          t6, zero, a2
                  fsgnj.s      ft1, ft6, fs4
                  xor          s9, t2, s9
                  sra          a6, t3, a6
                  fmax.s       fs0, ft3, fa3
                  sltu         s4, a6, t1
                  srl          s7, sp, zero
                  slt          sp, a5, t6
                  mulhsu       t0, a5, tp
                  div          a5, a6, zero
                  add          t3, s11, s6
                  andi         t3, a1, 1699
	fcvt.s.w	fa1, a5, rne
                  lui          s11, 147213
                  srli         t4, a2, 30
                  add          a4, a2, a2
                  srl          s5, t2, s7
                  fmax.s       ft5, ft0, fa0
                  addi         s6, a3, -1161
                  and          a7, s1, a0
                  slli         t0, a0, 3
                  fsgnj.s      fs6, fs2, fa0
                  fcvt.s.w     fa3, t4, rdn
                  ori          a7, gp, 442
                  divu         zero, s4, gp
                  sltiu        s11, t1, -1996
                  fmv.x.w      gp, fs3
                  fsgnjx.s     ft11, fa2, fs1
	fcvt.w.s	s11, fs4, rne
                  sltiu        s10, t2, -1147
                  div          t5, s5, s7
                  nop
                  sll          t0, a0, t6
	fcvt.w.s	t6, ft11, rne
                  fcvt.s.w     fa7, a4, rmm
                  nop
                  fmv.w.x      fs11, a3
                  fmv.x.w      a2, ft8
                  fsgnj.s      fs2, ft4, fs5
                  srai         s7, t1, 27
                  fcvt.w.s     t6, ft6, rtz
                  div          s4, a1, a3
                  auipc        a2, 160798
	fcvt.w.s	s10, fs3, rne
                  add          a7, s10, s6
                  slli         s2, a3, 17
                  add          a4, s0, t1
                  ori          s0, tp, -2
                  slli         zero, t3, 27
                  slli         s0, a3, 6
                  xor          sp, s2, a1
                  srl          t2, s1, s6
                  mulhu        s10, s5, t5
                  mulhu        tp, t4, sp
                  div          a6, gp, a5
                  mulhsu       s10, s5, s0
	fcvt.wu.s	ra, fs10, rne
                  or           s9, sp, t3
                  feq.s        s3, fa3, fs8
                  divu         a7, t1, zero
                  fadd.s       fa4, ft0, fs0, rtz
                  sra          t5, s0, s3
	fcvt.s.wu	fa4, t4, rne
                  sll          s10, t2, s1
                  fclass.s     zero, fa2
                  or           s6, t2, t6
                  xori         s5, s6, 1248
                  fcvt.wu.s    s2, fa7, rdn
                  sll          s5, a4, ra
                  sub          a2, t5, s11
                  fsgnjn.s     fa3, ft0, ft6
                  fsgnj.s      fa7, ft0, fa0
                  add          s2, s11, zero
                  and          a4, s2, a1
                  fcvt.w.s     s9, fa3, rne
                  sltiu        s0, s10, -1269
                  srli         gp, a7, 6
                  fcvt.s.w     fs0, a6, rup
                  fmax.s       fs11, ft5, ft0
                  fmin.s       fa5, fa0, fs2
                  mulh         a2, s1, a2
                  mulhu        ra, s9, a5
                  remu         s2, ra, ra
                  xor          t6, a5, s3
                  xori         s10, s5, -1818
                  sll          zero, a0, a5
                  divu         s1, ra, sp
                  fclass.s     gp, ft6
                  remu         t1, gp, a7
                  slti         ra, s3, 1516
	fadd.s	ft6, fs10, fa0, rne
                  slti         s2, t3, 960
                  lui          t5, 843647
                  fcvt.s.w     fa6, gp, rtz
                  slli         ra, t6, 20
                  sub          s0, a1, a0
                  srai         t0, t6, 20
                  fsgnjx.s     fs6, fs5, ft2
                  div          s0, a3, s11
                  sltiu        s1, s9, -1577
                  sltiu        s3, s5, 10
                  andi         s1, s4, -211
                  flt.s        s6, fs10, fs8
                  fsgnjn.s     fs6, ft6, fa4
                  srli         ra, a1, 1
                  sub          t2, t5, a1
                  add          s7, s5, t4
                  sltiu        s0, t2, 1076
                  fmax.s       ft0, fs9, ft3
                  add          t0, a2, s8
                  feq.s        a2, fs11, fs7
                  fcvt.wu.s    a1, fs8, rup
	fsub.s	ft8, fs4, ft7, rne
                  sll          sp, a2, ra
                  fle.s        s2, fa2, fs8
                  slt          sp, t4, s10
                  sll          a5, s8, a5
                  fsgnjn.s     ft9, fs4, fa6
                  lui          zero, 969715
                  slti         s7, sp, -1181
                  and          t1, s4, s2
                  remu         s3, s5, s5
                  ori          s10, t6, 2034
                  auipc        s7, 238025
                  xor          sp, s0, a1
	fsub.s	ft2, fs8, ft7, rne
                  fcvt.w.s     t0, fa3, rdn
                  fmv.w.x      ft4, s6
                  sub          s5, tp, zero
	fcvt.w.s	t2, fa7, rne
                  ori          tp, s0, 766
                  rem          a7, t3, s7
                  flt.s        s9, fs9, fs0
                  srli         s11, s9, 4
                  fcvt.s.w     ft4, s7, rdn
                  ori          zero, t5, 1491
                  feq.s        sp, fs0, fs10
	fsub.s	ft7, fs4, ft4, rne
                  fle.s        s7, fa4, fs11
                  mulhsu       a2, s5, t6
                  flt.s        s5, ft3, ft10
                  andi         s7, ra, -90
                  fcvt.s.w     fs6, s5, rtz
                  fsgnjx.s     fs6, ft3, fa7
                  auipc        zero, 323380
                  slti         t0, s1, -396
                  flt.s        t2, fs11, ft1
                  srl          s9, t3, s7
                  slti         a1, gp, -2003
                  xori         a5, s1, -62
	fadd.s	ft9, ft4, fs0, rne
                  sltiu        t5, t1, 730
                  mul          s7, zero, a4
                  srl          s10, t0, a4
                  sll          s9, s10, a1
                  remu         sp, a2, t6
                  slli         s6, s5, 31
                  fsgnjx.s     ft10, fa7, ft6
                  mulhu        t1, t4, s1
                  mulh         t4, t2, zero
                  fsgnj.s      fa0, fs9, fa5
                  sra          s5, t0, s4
	fcvt.s.w	fa6, a6, rne
                  and          s1, tp, s10
                  srl          t0, s0, t2
	fsub.s	ft10, fs9, fa0, rne
	fcvt.w.s	s4, fa3, rne
                  fsgnj.s      fa3, ft0, fs2
                  mulh         t0, t4, s9
                  add          zero, t5, s3
                  fcvt.s.w     fs3, t2, rdn
                  sub          t6, s8, t4
                  feq.s        t1, fa4, fa5
                  slt          t1, a6, s10
                  srli         t6, a7, 21
                  xori         a2, zero, -1739
	fcvt.w.s	s4, ft8, rne
                  nop
                  fsgnjn.s     fs9, fs0, fs10
                  mulh         t5, a7, a3
                  add          s5, t0, s2
                  fle.s        s0, fa2, fs10
                  fclass.s     a4, ft9
                  sub          a4, t1, s6
                  fmax.s       fa2, fa1, fs10
                  add          s3, s8, s2
                  mulh         t5, s7, s10
                  fmv.x.w      s3, fs8
                  mulhsu       a6, t3, t3
                  andi         s1, t1, -417
                  ori          gp, s7, -179
                  auipc        s4, 168956
                  auipc        zero, 708561
                  xor          tp, s1, a7
                  xor          s9, s0, s10
                  andi         s2, t2, -390
                  fmv.x.w      t1, fa1
                  auipc        gp, 78745
                  fcvt.w.s     t5, fs11, rtz
                  sll          s4, a6, a1
                  feq.s        s7, fs1, ft2
	fcvt.w.s	t4, ft11, rne
                  remu         t6, s0, s2
                  fmv.w.x      fa5, t3
                  remu         s4, s11, t1
                  sub          s9, t0, t4
                  mulhsu       s1, a6, s9
                  add          s5, t6, a4
                  mulhu        t2, s0, a1
                  fcvt.w.s     ra, ft5, rmm
                  xori         t0, a6, 750
                  fle.s        zero, fa4, fs1
                  mulhu        s0, s1, t3
                  nop
                  fmv.w.x      fs11, a0
                  mulhsu       a2, sp, s7
                  sra          s6, a4, t5
                  srl          s3, t3, t6
                  fsgnj.s      ft7, fs8, fs4
                  fmin.s       fa5, ft0, fs11
                  fmv.x.w      t3, fs6
                  fle.s        s7, ft3, ft9
                  and          zero, tp, a2
                  sltu         ra, t6, ra
                  fmv.w.x      ft5, s11
                  mulh         zero, a1, s10
                  sll          s7, sp, a5
                  lui          s1, 14974
                  fmv.w.x      fs0, a1
                  fclass.s     a6, ft0
	fsub.s	fs9, fa1, fs10, rne
                  fmin.s       fa0, fa5, fs1
                  slli         a2, a4, 25
                  sub          s3, zero, a5
                  ori          t0, a4, -820
                  ori          a2, t2, -290
                  mulhu        t1, a4, s7
                  mulhu        a6, s8, t0
                  fadd.s       fs1, ft9, ft4, rdn
                  fcvt.s.w     ft9, t4, rne
                  andi         zero, s10, -1776
                  andi         t0, s5, 1244
                  sltiu        ra, a0, 269
                  fcvt.wu.s    t3, fs9, rmm
                  flt.s        t5, fa3, fa6
                  fmv.x.w      t0, fa5
                  sll          ra, s3, a4
                  andi         tp, a2, 98
                  xori         a6, a5, -544
                  sll          t0, gp, s0
                  slli         s1, a6, 29
                  srl          a5, s0, s0
                  srli         s5, s8, 21
                  srai         a5, a0, 16
                  mulhu        s5, tp, s3
                  lui          tp, 1047131
                  ori          s6, s1, -13
                  div          s0, a1, s10
                  or           t5, s2, s11
                  slti         s10, a3, 1016
                  fmin.s       ft2, ft0, fs1
	fcvt.w.s	s2, fs9, rne
                  fcvt.w.s     t5, ft10, rtz
                  fmax.s       fa4, ft10, fs7
                  and          tp, s9, a5
                  or           gp, a7, t5
                  sub          t4, a0, s5
                  sltiu        t3, s5, -1886
                  fclass.s     sp, fs7
	fadd.s	ft0, ft10, ft5, rne
                  srai         a2, t5, 23
                  ori          a4, s10, 1691
                  addi         t4, s8, -160
                  rem          a6, a5, s3
                  div          s9, t4, tp
                  fsgnj.s      fa0, fs0, fs4
                  and          t1, t3, a3
                  nop
                  mul          t4, gp, gp
                  div          s11, s8, a7
                  xor          zero, gp, sp
                  rem          a6, s10, sp
                  slli         gp, s2, 29
                  nop
                  fsgnjn.s     fa0, ft9, ft6
                  div          t3, t6, s8
                  auipc        s10, 343574
                  divu         gp, s1, a2
                  lui          t2, 284498
                  fcvt.w.s     t0, fs6, rup
                  fsgnjx.s     fs1, ft8, fs9
                  fclass.s     a4, ft10
                  ori          s4, t5, 843
                  mulhu        t6, s10, s8
                  rem          a2, a4, s11
                  addi         s4, s8, 1735
                  fadd.s       ft7, fa2, ft10, rmm
	fsub.s	ft8, ft1, fs5, rne
                  sub          a1, t1, a1
                  fclass.s     s6, fs7
                  fclass.s     s11, fs10
                  nop
                  div          t2, s6, s1
                  slt          a6, a6, a2
                  div          t2, s5, a0
                  slti         a2, a7, -1019
                  xor          s6, s10, s11
                  fcvt.w.s     s11, fa6, rdn
                  fsgnjx.s     ft10, ft9, fs11
                  sltu         s2, a4, gp
                  sltiu        a6, s11, -1801
                  fsgnjn.s     fa5, fa1, ft11
                  fmin.s       fa5, fa2, fa7
                  mulhu        a7, s7, s4
                  fsgnjx.s     fs5, fs11, ft10
                  ori          gp, s9, -743
	fcvt.s.wu	ft5, s2, rne
                  divu         s9, s3, t5
                  fmv.x.w      s2, fa3
                  mul          s3, s5, s4
                  fsgnj.s      fa3, fa1, fs1
                  sltu         t3, a5, a3
                  divu         a6, ra, t5
                  srli         s0, a6, 30
                  sltu         a4, s2, s5
                  div          s7, s8, s5
                  auipc        t4, 940602
                  fmv.x.w      a6, ft6
                  slt          t1, s10, a0
                  fmv.w.x      fa1, tp
                  fadd.s       fs10, fs9, fs1, rtz
                  lui          s7, 455231
                  slti         s6, a6, 1689
                  nop
                  fmin.s       ft9, ft6, fa2
                  fmin.s       ft0, fa1, fs0
                  mul          t0, tp, sp
                  sub          a6, t4, sp
                  feq.s        gp, fs5, fa7
                  flt.s        t3, fa2, fs4
                  mulh         ra, t6, a1
                  slli         t4, s9, 2
                  mulh         t0, t4, t4
	fsub.s	fa1, ft8, fs7, rne
                  xor          s9, s9, a7
                  div          a7, t4, t1
                  sra          t0, s8, t4
                  fsgnj.s      ft5, fs2, ft3
                  xori         a4, s11, 670
                  sll          a6, s6, a3
                  slli         s10, a2, 28
                  and          t0, tp, t0
                  xor          s7, s4, t0
                  flt.s        a2, fs7, fs6
                  fcvt.s.wu    fs3, t3, rne
                  auipc        s3, 732769
                  fmax.s       ft4, ft4, ft4
                  sll          a2, t3, a7
                  addi         a4, t1, -1550
                  sll          zero, a4, t3
                  sltiu        s2, a7, 147
                  andi         a7, s9, 1503
                  fmax.s       ft9, ft11, fs5
                  sra          s0, s1, t6
                  fsgnjx.s     fa7, fs1, ft10
	fsub.s	fs5, fs4, fs5, rne
                  or           t0, s8, zero
                  lui          t3, 539097
                  fle.s        s9, ft10, fa7
                  srai         s0, gp, 8
                  sra          a2, sp, s6
                  fmv.x.w      s11, ft9
                  mulhsu       t3, s7, s3
                  srli         s5, s10, 23
                  slt          s6, s3, s3
                  sltiu        s5, gp, 625
                  slt          zero, zero, a4
                  fmax.s       fa1, fs4, ft8
                  fcvt.s.wu    fs8, tp, rne
	fadd.s	fa2, fa1, fa5, rne
                  slli         s6, t0, 31
                  addi         t6, t4, 390
	fsub.s	fa2, fs6, fa2, rne
                  fmv.x.w      t4, ft0
                  mulhsu       a5, gp, a0
                  flt.s        t2, fa1, ft8
                  sra          gp, a1, s0
                  div          t0, t6, t4
                  fclass.s     gp, ft5
                  fmv.x.w      a7, fs0
                  fle.s        s3, fs9, fs11
                  mulhu        a1, t6, s4
                  fmax.s       fs10, ft2, ft4
	fsub.s	fa0, ft0, fs4, rne
                  rem          s11, t1, s7
                  addi         t4, a1, -1486
                  nop
                  ori          zero, gp, -517
                  mulhsu       s10, s0, s11
                  sltu         a4, s1, t3
                  mulhsu       t0, a1, sp
                  and          s2, t3, a0
                  addi         a7, gp, -1
	fcvt.s.wu	fa6, a7, rne
                  srai         sp, a7, 25
                  fcvt.s.wu    ft9, s10, rup
                  fsgnjx.s     fa2, fa2, fs8
                  rem          a7, s10, s6
                  sra          t5, t4, a5
                  slli         s5, t6, 7
                  fcvt.w.s     a2, ft1, rne
                  lui          t0, 863118
                  fmin.s       fs9, fs5, fs8
                  slt          t3, gp, a7
                  lui          a1, 304967
                  fsgnj.s      ft6, ft9, fs11
	fcvt.s.w	fs7, t6, rne
                  div          tp, a6, t1
                  fsub.s       fa6, ft0, fs1, rdn
                  fsgnjn.s     fa7, ft6, fs2
                  auipc        s3, 800141
                  fsgnjx.s     ft6, ft5, ft6
                  fmv.x.w      tp, fs11
	fcvt.w.s	t1, fa3, rne
                  sll          a4, s11, s6
                  fmax.s       fa4, fa6, ft7
                  mul          t5, s3, s9
                  flt.s        t2, fs10, fa4
                  slt          t4, a4, s5
                  srl          t1, s6, gp
                  sltiu        s1, gp, 1278
                  ori          t4, s9, -1570
                  sltu         a6, t3, a4
                  auipc        s0, 873686
	fsub.s	fs2, ft11, ft8, rne
                  auipc        t4, 148843
	fcvt.wu.s	s1, fa2, rne
                  rem          tp, a5, ra
                  srai         s9, ra, 3
                  sub          t6, s10, s9
                  ori          s0, a7, -857
                  sltu         s1, a5, a5
                  flt.s        ra, fa7, fa1
                  flt.s        a6, ft11, fs4
                  and          t6, ra, s1
                  addi         a2, s11, -114
                  mulhu        s6, t2, sp
                  srai         t2, t5, 17
                  slti         s1, s8, -1112
                  fmin.s       ft8, ft3, ft2
                  andi         s3, s3, -1412
                  nop
                  remu         a6, a1, s1
                  fmv.w.x      ft9, s4
                  xori         t1, s4, -1035
                  srli         s5, t6, 14
                  sra          t6, sp, ra
                  xori         t5, a5, -1836
	fcvt.s.wu	fa1, a3, rne
                  xori         t5, a5, 531
                  sub          gp, a6, s8
                  mul          t3, s8, s4
                  fle.s        a5, ft10, fa1
                  fadd.s       fs5, fs0, fs3, rtz
                  auipc        zero, 206122
                  div          a7, t2, t1
                  rem          tp, t1, ra
                  or           ra, a2, s11
                  and          t2, a3, s8
                  fmv.x.w      s0, fs7
                  sub          s11, s5, a2
                  nop
                  fle.s        s1, ft5, ft9
                  fmv.w.x      fs6, a6
                  mulhu        s0, s10, a1
                  feq.s        s10, fa4, fs9
                  mulh         zero, s4, t3
                  sub          s0, t3, s3
                  slt          t1, s4, a0
                  nop
                  flt.s        ra, fa1, ft4
                  lui          s11, 955833
                  srai         t3, s7, 1
                  srli         a6, s10, 13
                  fcvt.s.w     fa2, a2, rtz
                  sll          t3, t0, s1
                  fcvt.wu.s    s3, ft10, rne
	fcvt.s.wu	fa6, tp, rne
                  mulhu        s4, t2, tp
                  ori          zero, s6, 832
                  sub          a6, a2, s9
                  sra          s3, s3, zero
                  add          t3, ra, t0
                  lui          s0, 162064
                  divu         s5, a5, a3
                  auipc        a6, 57956
                  fsgnj.s      ft2, ft10, fa1
                  ori          s7, s10, -1448
                  fsgnjn.s     ft1, fa5, fa4
                  xor          s6, s0, a5
                  flt.s        s9, fa3, ft4
                  fadd.s       ft5, ft9, ft5, rup
                  slt          a7, tp, s2
                  fle.s        t3, fa0, ft11
                  fclass.s     tp, ft8
                  srai         a1, t6, 6
                  mulh         zero, t0, a6
                  fadd.s       fs11, fs10, fs3, rtz
                  sub          s0, s10, a2
                  fsgnjx.s     fs9, ft3, fa6
                  fcvt.w.s     tp, ft10, rup
                  slt          gp, s7, s10
                  sltu         t5, a1, ra
                  slt          s2, t1, s10
                  sltiu        t2, s5, -992
                  and          s6, ra, s7
                  slli         t5, s11, 5
                  mulh         tp, t6, a2
                  fle.s        a1, fs0, fa2
                  sll          zero, a6, s11
	fcvt.wu.s	s4, fa2, rne
                  slt          a2, s0, sp
                  fclass.s     tp, ft6
	fsub.s	ft3, fa4, ft5, rne
                  fsgnjn.s     fa6, fa1, fs1
                  andi         t3, s1, -798
                  flt.s        a1, fs8, fa2
                  sra          tp, a2, a5
                  div          s4, s10, s0
                  div          a7, t5, t0
                  slli         a7, gp, 3
                  feq.s        t0, fs7, ft9
                  div          a1, t0, s6
                  mulhsu       s1, s5, t1
                  and          s9, s10, s3
                  fmin.s       ft6, fa4, fs5
                  xori         a5, ra, -166
                  lui          a2, 299344
                  lui          a4, 380283
                  fle.s        a4, ft0, fa4
                  divu         a7, s4, a1
                  feq.s        s0, fs11, fs8
                  remu         s10, a6, t0
                  feq.s        t1, fa6, fa1
                  fsgnj.s      fs8, ft9, fs0
	fsub.s	ft9, ft6, fs10, rne
                  fmv.x.w      s11, fa2
                  flt.s        t4, ft8, fa5
	fcvt.wu.s	t6, fs10, rne
                  fmax.s       ft9, fs6, ft6
                  fsgnjx.s     fa6, ft3, fs6
                  nop
                  fle.s        t1, fa6, fs0
	fcvt.s.w	fa4, tp, rne
                  sub          s2, t3, gp
                  mul          s11, a1, s9
                  fsub.s       ft2, ft0, fa2, rdn
                  remu         a5, s2, a5
                  lui          s1, 457696
                  lui          s6, 575425
                  div          s9, t4, t3
                  fcvt.s.w     ft6, t2, rne
                  and          s5, a3, s1
                  rem          sp, s11, a3
                  fcvt.s.w     fs0, s11, rtz
                  slti         s4, gp, -287
	fcvt.wu.s	a1, ft9, rne
                  fsub.s       fa1, ft9, ft10, rdn
                  div          tp, s6, s7
                  fsgnjn.s     fs2, ft8, fs9
                  xori         t0, s5, -1231
                  divu         a4, s8, s9
                  sltiu        s0, s1, -1239
                  fclass.s     t2, fa0
                  addi         a5, s7, 315
                  xor          t5, ra, a4
                  rem          t4, s5, s3
                  sra          s6, t1, a5
                  sltiu        s0, a4, -557
                  sltiu        s1, sp, -526
                  srai         s10, s8, 1
                  fmv.x.w      s3, ft3
                  fclass.s     a1, ft9
                  and          a6, a0, s7
                  sll          a7, a4, a6
                  sub          s0, zero, t3
                  sub          s5, zero, a7
                  divu         t5, s2, zero
                  auipc        s11, 235808
                  add          s7, s5, t6
                  div          s7, s0, a7
                  divu         s10, s2, t1
                  mulhu        s5, t2, t3
                  ori          a7, s3, 1635
                  flt.s        gp, fa4, ft5
                  slt          a6, zero, a6
                  andi         s1, s7, -2007
                  sll          zero, a2, t6
                  fsgnjx.s     ft0, ft3, fs6
                  srl          s2, t0, ra
                  slti         s2, ra, -952
                  fsgnjn.s     ft6, fa5, ft5
                  ori          t4, zero, 952
                  srai         s1, s7, 7
                  sra          a6, s6, zero
                  sltiu        s2, s3, -739
                  fle.s        t1, fs8, fa0
                  or           t3, t2, t4
                  mulhu        s6, s10, t3
                  fcvt.s.wu    ft0, ra, rtz
                  sll          t3, t0, s8
                  andi         a5, t3, -1599
                  fmv.w.x      fa4, a1
                  sub          sp, s5, t6
                  fcvt.s.wu    fa7, s1, rup
                  sra          s3, a6, zero
                  auipc        zero, 668886
                  fsgnjx.s     fs1, ft3, fs5
                  slli         sp, a4, 8
                  divu         t2, s3, t4
                  fmv.x.w      t6, fa7
                  auipc        t4, 329799
                  xor          a4, zero, s1
                  xor          s1, a3, s0
                  addi         s6, t4, 2004
                  or           a4, t6, ra
                  andi         s9, s5, 120
                  fcvt.w.s     s11, fs2, rmm
                  fsgnjx.s     fa1, fa0, fa3
                  flt.s        t1, fs11, fa7
                  fsgnjx.s     fs0, fa5, ft4
                  mulhsu       a4, s5, t4
                  rem          a4, a3, sp
	fcvt.w.s	s6, fs3, rne
                  sltiu        s4, s5, 1932
                  sltiu        t6, t5, -1743
                  ori          t0, s1, 688
                  sra          s11, s1, tp
                  sub          gp, s10, zero
                  sra          t3, s2, s3
                  nop
                  fcvt.w.s     s11, ft8, rtz
	fcvt.w.s	a2, fs11, rne
                  fmin.s       ft4, fa6, ft7
                  sub          s7, a6, s10
                  fsgnjx.s     ft10, fa5, ft2
                  mulh         s6, t2, a5
                  srli         a1, t4, 23
                  srli         s6, a3, 31
                  fsub.s       fs3, fs9, fa3, rtz
                  sub          s7, s2, s11
                  flt.s        s5, fs11, fa2
                  slli         a5, tp, 20
                  auipc        t5, 779185
                  fmax.s       ft2, fs2, fs9
	fcvt.s.wu	ft3, s1, rne
                  fmv.w.x      ft3, t6
                  srl          zero, a1, s1
                  fmv.x.w      s4, fs3
                  mulhu        gp, s7, gp
                  srli         s7, t2, 20
                  ori          a7, zero, -1606
                  ori          a6, a7, -1618
                  srl          a6, s7, zero
                  slti         s2, s5, 573
                  fmin.s       fa6, fs11, fs9
	fcvt.wu.s	s11, fs0, rne
                  mulhsu       s1, a1, s4
                  slti         a2, s2, 1945
                  nop
                  fmv.x.w      t2, fs7
                  fclass.s     a6, ft1
                  sub          zero, s10, t6
                  sll          a4, s11, s11
                  lui          s6, 594416
                  remu         a1, s11, a6
                  fsgnjn.s     fs10, ft2, fs10
                  sub          a6, t6, ra
                  fclass.s     s0, fa3
                  feq.s        s11, ft8, fa5
                  fcvt.w.s     s3, ft10, rmm
                  fmin.s       ft2, ft5, ft2
                  xori         ra, zero, -904
                  sub          a4, a2, a7
                  auipc        t1, 289191
                  div          t0, s10, s10
                  sub          s0, s5, a5
                  lui          a1, 495931
                  srai         s7, a0, 13
	fsub.s	fs1, ft5, fa1, rne
                  fsgnjn.s     fs0, fa2, fs5
                  mulhsu       t5, s3, zero
                  feq.s        s10, fs10, fs1
                  remu         t1, a5, s1
                  fle.s        a4, ft0, ft4
                  sltiu        a7, t6, 1466
                  sll          s9, a2, t2
                  divu         a6, sp, a0
                  sra          a2, s2, ra
                  slli         t5, s4, 28
                  fmv.x.w      s2, fs3
                  fmv.w.x      fs1, t0
                  mulhu        a1, a5, t2
                  slt          a5, s9, a0
                  sltu         ra, ra, s1
                  nop
                  addi         t4, t5, 773
                  fclass.s     t6, ft11
                  fcvt.w.s     s9, ft5, rdn
                  lui          s6, 287133
                  sra          s10, t2, s2
	fcvt.s.wu	ft9, s6, rne
                  srli         a4, tp, 19
                  remu         s1, s9, a5
                  fmax.s       fs3, ft5, ft5
	fadd.s	fs7, ft8, ft9, rne
                  fsgnjn.s     ft10, ft7, fa7
                  mulh         zero, t6, a1
                  rem          a4, s5, t2
                  nop
                  fmv.w.x      fa7, t3
                  srl          s7, t2, s2
                  slti         a7, a4, -472
                  fle.s        s10, fs0, fa3
                  nop
                  divu         t1, sp, sp
                  fcvt.s.w     ft2, a1, rne
                  auipc        a4, 128602
                  sltiu        t5, t6, -1007
                  fsgnj.s      ft3, fa1, fs5
                  flt.s        sp, fs11, ft4
                  srl          t6, a3, gp
                  slt          s6, a0, t6
                  fmin.s       ft4, fs9, fs11
                  fle.s        t1, fs7, fs9
                  mul          a1, s3, a1
                  sltu         a4, t6, s7
	fsub.s	fa0, fa3, fa7, rne
                  fsub.s       ft9, ft10, fa0, rdn
                  fclass.s     a1, fs11
                  feq.s        t4, fa7, ft2
                  sub          sp, t0, s5
                  div          a5, s5, s7
                  andi         s0, t5, -1568
                  addi         ra, a2, 983
                  mulh         t0, sp, s9
                  mulhu        a4, t4, gp
                  mulh         s10, a7, s1
                  xor          s4, zero, s9
                  auipc        gp, 458327
                  rem          a5, s6, a3
                  ori          s2, a5, 1929
                  or           t1, zero, s3
	fadd.s	ft1, ft4, ft8, rne
                  fmv.x.w      t0, ft11
                  fclass.s     a2, ft3
                  mulhu        s7, t5, s1
                  fsgnj.s      fs2, fs2, ft8
                  fmv.x.w      s2, ft1
                  slli         s7, t4, 25
                  fle.s        s1, ft0, ft3
                  mulhu        t4, a3, s11
                  mulhu        s4, s7, t5
                  mulh         gp, s6, zero
                  fadd.s       ft11, fa1, fa3, rmm
                  lui          t5, 682726
                  mulhu        s7, zero, s9
                  mulh         t1, a4, s11
                  lui          t1, 999909
                  add          ra, a4, s11
                  remu         a1, s1, gp
                  mulhsu       s9, s2, t2
                  lui          s11, 911055
	fcvt.s.w	fa2, zero, rne
                  sub          s7, t4, a4
	fcvt.wu.s	s10, ft1, rne
                  fclass.s     s3, fs8
                  sra          a2, gp, t2
                  nop
                  slti         t0, a7, -28
                  srai         t3, a1, 15
                  rem          gp, a1, s5
	fcvt.s.w	fs0, t2, rne
                  slti         tp, s8, 1981
                  xori         t5, s5, 1332
                  andi         s7, s7, -233
                  mulhu        a4, t5, a6
                  fclass.s     tp, fs6
                  feq.s        tp, fs2, fa6
                  and          s5, t3, a3
                  auipc        sp, 555896
                  fcvt.s.wu    ft7, s9, rup
	fcvt.w.s	a2, fa2, rne
                  divu         a7, a7, a4
                  slti         t4, a4, -2046
                  slli         s11, s5, 29
                  auipc        a6, 752552
	fcvt.wu.s	s4, fs1, rne
                  fsgnjx.s     fs4, fa4, ft7
                  add          ra, s6, t6
                  fle.s        t2, fs2, ft9
                  slti         s3, s2, -1212
                  addi         a4, s11, 123
	fcvt.s.w	ft2, t0, rne
                  andi         gp, a6, -1064
                  or           a1, a0, s5
                  srl          s10, s5, s1
                  fmv.x.w      ra, ft10
	fcvt.s.wu	ft2, t4, rne
                  fsgnjx.s     ft0, fs9, fa0
                  divu         s1, s8, zero
                  andi         gp, a4, -442
                  auipc        s1, 921763
                  nop
                  sub          t2, zero, s6
                  fmin.s       fa7, fs4, fa4
                  slti         t6, tp, 999
                  sub          s4, a7, t0
                  fmv.x.w      s5, fs1
                  fcvt.s.w     ft4, t5, rup
                  sra          t5, sp, s3
                  rem          s0, s2, t0
                  mul          t6, s7, a6
                  srli         a2, t6, 6
                  fsgnj.s      ft0, ft6, ft5
                  flt.s        t6, fa2, fa6
                  xor          t5, t0, s5
                  auipc        t0, 95520
                  srli         s4, a2, 24
                  fle.s        a4, fs2, fs6
                  sltu         t5, tp, s0
                  sub          t0, zero, ra
                  auipc        t3, 382600
                  mulhsu       zero, s10, s3
                  addi         tp, s11, 1576
                  slti         a2, tp, -912
                  feq.s        s5, fs9, fs9
                  div          a5, a4, s7
                  fmax.s       fa1, fa2, ft8
                  srl          s11, a4, s0
                  mulhsu       gp, s9, sp
                  slli         t5, a0, 24
                  sra          a1, s7, a0
                  ori          a4, s6, -1584
                  sltu         a1, t4, a1
                  fsgnjn.s     fs10, ft11, fs9
                  andi         s7, t3, 714
                  fmax.s       ft4, ft0, fs0
                  auipc        tp, 527127
                  flt.s        s7, fs6, fs7
	fadd.s	fa1, ft1, fs0, rne
                  divu         a7, zero, t1
                  fmin.s       fa4, fs6, fa4
                  fclass.s     t2, fs6
                  fmin.s       fa3, ft4, fs6
                  sltu         t2, s5, a7
	fadd.s	fa2, fs7, ft0, rne
	fcvt.s.wu	fs8, s8, rne
                  sltiu        a7, a7, -542
                  slli         t2, a2, 23
                  add          a2, s10, a4
                  mulhu        a7, tp, s9
                  mulhu        a6, a7, a3
                  add          a1, t3, s6
                  lui          s3, 40512
                  auipc        t0, 420531
                  addi         sp, a1, -1671
                  mul          tp, s10, t6
                  fcvt.w.s     gp, fa5, rne
                  fcvt.s.w     fs0, a1, rmm
                  fcvt.w.s     a1, ft4, rup
                  srli         t2, s4, 24
                  fclass.s     a7, ft6
                  mul          s3, ra, t4
                  ori          t2, s5, 513
                  ori          a1, a1, 0
	fcvt.s.w	fa1, t5, rne
                  sltu         t5, t0, t2
                  rem          t5, ra, ra
                  sltu         a2, zero, a0
	fcvt.s.w	fs3, s10, rne
                  fmin.s       fs7, ft1, fs5
                  auipc        t0, 124166
                  mulhu        t2, t4, t6
                  sltiu        s5, tp, 1821
                  and          t6, s5, gp
                  fmv.w.x      ft2, sp
                  add          a2, t2, a5
                  remu         s3, a1, t2
                  fsgnjx.s     ft6, fs2, ft0
                  or           sp, a3, t1
                  sub          gp, a7, s4
                  andi         s10, a2, -1284
                  ori          gp, gp, 751
                  sra          t3, a0, a1
                  sltu         s0, s7, s8
                  slli         zero, a4, 6
                  fcvt.wu.s    a1, fa0, rne
	fcvt.s.w	fs7, s3, rne
                  sub          s4, a1, s0
                  nop
                  srl          a1, s10, s1
                  fsgnjn.s     ft6, ft5, ft6
                  fmin.s       fa5, ft2, ft9
                  slti         sp, a5, -684
                  fsgnj.s      fa6, fa4, ft6
                  mul          s9, t6, t0
                  srai         s9, s0, 15
                  addi         t1, t4, 1071
                  auipc        t5, 294426
                  div          s9, t0, s5
                  add          zero, s4, tp
                  fcvt.w.s     s3, fs3, rmm
                  sltiu        a5, a0, -487
                  srl          t5, s2, a6
                  xor          t5, gp, s10
                  fmin.s       fs4, fs6, ft1
                  fsgnj.s      ft0, fs11, ft5
                  xori         s11, ra, 1686
                  div          a4, t0, a4
	fcvt.s.wu	ft3, sp, rne
                  fcvt.w.s     s4, ft1, rne
                  slli         t5, t3, 1
                  srli         ra, a0, 21
                  mulhsu       s3, s2, a5
                  divu         s7, a6, ra
                  divu         sp, t3, t2
                  fmv.w.x      ft11, a4
                  fcvt.s.w     fa6, t5, rne
	fcvt.wu.s	s7, ft7, rne
                  srl          t1, s0, a6
                  fle.s        t0, fa3, fs1
                  xor          s10, t5, s6
                  feq.s        s7, fa5, ft6
                  fsgnjn.s     ft2, fa7, ft7
                  mul          a2, s10, tp
                  andi         tp, s7, 899
                  lui          s6, 658693
                  nop
                  slti         s11, s7, 1613
                  fcvt.w.s     t6, fs11, rup
                  flt.s        s4, fs7, fs6
                  sra          a5, s3, t6
                  divu         s10, tp, ra
                  fmv.x.w      s3, ft3
                  auipc        s11, 72039
                  sltu         s5, s4, s2
                  andi         t0, a1, 1610
                  fsgnjx.s     ft3, ft3, fa6
                  fmv.x.w      s6, fa7
                  fmv.w.x      fs8, sp
                  div          t6, a5, s0
	fcvt.s.wu	fa0, t4, rne
                  slt          s1, s7, s10
                  slti         t0, s3, -922
                  andi         s11, s6, 1974
                  mulhu        s10, ra, s0
                  sll          sp, ra, a6
                  mulhu        s3, t1, s2
                  srl          s7, tp, s4
                  sub          t0, s8, zero
                  slti         t1, t1, -1180
                  feq.s        a5, fa6, ft3
                  fadd.s       ft6, fs8, fs5, rmm
                  fmv.w.x      fs10, a3
                  srli         zero, tp, 11
                  fmv.x.w      a5, ft8
                  remu         gp, t3, s11
                  fcvt.wu.s    ra, fa7, rup
                  srl          t0, gp, t2
                  sltu         a7, t6, t2
                  sub          s5, a7, s5
                  lui          s9, 220978
                  sub          s5, s1, t4
                  fsgnjx.s     fs8, fa4, fa2
                  srl          s6, a6, s8
                  div          t0, s11, a2
                  add          a6, s0, s6
                  and          s3, a4, s6
                  srai         zero, a5, 17
                  sltu         gp, s1, a7
                  divu         s4, s5, s9
                  mulhu        s3, s1, s3
                  xori         t1, s9, 1172
	fcvt.s.wu	ft6, gp, rne
                  ori          t2, s4, -57
                  remu         a4, tp, s5
                  slli         t4, t5, 5
                  addi         gp, t6, -1835
                  sra          a6, t1, a5
                  srli         s9, t0, 21
                  srl          t1, a0, a5
                  flt.s        s1, ft3, fa5
                  fadd.s       fs5, fa6, fa6, rne
                  mulhsu       tp, t5, a7
                  fmin.s       fs3, fs1, fs6
	fcvt.s.wu	ft11, s6, rne
                  sltu         t2, sp, t6
                  div          a5, s10, t6
                  srai         t1, gp, 12
                  add          a4, t0, a3
	fsub.s	fs8, ft2, fs9, rne
                  fmax.s       fs2, fs4, fs6
                  slt          t3, a0, t5
                  and          t1, a5, s1
                  fle.s        t4, fs2, fa7
                  sltiu        s5, tp, -1760
                  fadd.s       fa3, fs4, ft8, rmm
                  xor          s2, t6, t5
                  fsub.s       fa6, fa3, fs0, rtz
	fcvt.w.s	s2, fs9, rne
                  srai         s4, s5, 27
                  addi         s4, t5, -619
                  add          t6, s10, a6
                  srli         s7, t5, 9
                  andi         s4, s6, -1468
                  auipc        s0, 89023
                  or           s11, a5, a0
                  fsgnjx.s     fs0, fa2, ft9
                  fmax.s       ft1, ft7, fs4
                  mulhu        a6, t0, a3
                  fcvt.s.wu    fs3, t0, rup
                  addi         zero, s0, 1602
                  fmax.s       fs11, ft7, ft1
                  remu         ra, t3, s11
                  mulhsu       gp, a6, t3
                  srl          tp, s9, ra
                  mulhu        a5, a4, a3
                  sub          s1, a5, s8
                  xori         a1, a1, 602
                  sub          tp, t5, t2
                  slli         s2, s11, 23
                  sra          t3, s10, ra
                  sll          zero, a6, a0
                  remu         t1, a6, s8
                  slt          t3, zero, t0
                  sub          s1, zero, zero
                  rem          s3, a5, a1
                  feq.s        a2, fs5, fs10
                  rem          ra, s8, s3
                  fmv.x.w      s5, fa7
                  fclass.s     a7, fs4
	fcvt.wu.s	s4, fa6, rne
                  divu         a4, gp, a5
                  sra          s7, s8, s1
                  srl          a1, s4, s7
                  mul          s5, s1, s11
                  fmv.x.w      s10, ft3
                  divu         a6, t0, t3
                  slt          tp, s4, t4
                  flt.s        s7, fa4, fs1
                  slt          a1, a2, a7
                  auipc        gp, 940844
                  feq.s        a7, fs8, fa0
                  fcvt.s.w     fa5, t5, rup
                  sub          t0, s8, s1
                  fmin.s       ft7, ft5, fs9
                  slli         s4, s11, 7
                  slli         s3, t2, 21
                  slt          tp, a4, a6
                  fsgnj.s      ft11, fs8, fs0
                  sltiu        s11, t0, -1039
                  srli         a1, sp, 21
                  sub          a6, t1, t3
                  fmv.w.x      fa2, a6
                  fmv.w.x      ft10, a4
                  fsgnjx.s     fs10, fa5, fs10
                  fcvt.wu.s    tp, fs6, rne
                  sub          tp, s2, a6
                  mulhsu       ra, s1, zero
                  and          t4, a2, a5
                  fmax.s       ft8, fa1, ft9
                  lui          s4, 932236
                  feq.s        a1, fs4, ft11
                  fclass.s     s1, ft3
                  fcvt.wu.s    s0, fs2, rne
                  fmin.s       fa4, ft4, fa3
                  lui          s11, 670554
                  andi         s3, t6, 1491
                  slt          s11, s4, t6
                  remu         a5, s5, s6
                  fmv.w.x      ft7, gp
                  mulh         s4, s2, s7
                  rem          tp, a2, s2
                  and          gp, ra, zero
                  feq.s        a4, ft10, ft4
	fcvt.wu.s	s1, ft11, rne
                  fsgnjn.s     fa7, ft7, ft11
                  fmax.s       fs3, fa5, fs2
                  addi         s9, s3, 264
                  slli         s0, a5, 23
                  sub          s7, s8, s3
                  mul          s5, s8, t4
                  fclass.s     s7, fs8
                  fsgnjn.s     fs9, fs8, fa2
                  fadd.s       fs7, fs2, fs0, rne
                  sltu         s3, a7, a1
                  nop
                  srl          tp, s4, s4
                  slli         t2, s5, 13
                  sltu         s11, s8, s2
                  sll          ra, t6, s4
                  add          s3, a7, t0
                  fmv.w.x      fa3, s11
                  div          a6, a7, tp
                  fsgnjn.s     fs2, ft0, fs6
                  slt          t5, s7, s5
                  mul          a5, a2, a5
                  fcvt.s.w     ft11, s8, rne
                  sltu         t1, a4, a1
                  flt.s        t5, fs3, fs10
                  div          ra, ra, ra
                  or           t4, s10, t4
                  fsgnjx.s     ft9, ft0, fs9
                  fmax.s       fs4, fa6, fa5
                  sra          s9, s8, t1
                  nop
                  mulhsu       sp, a1, s8
                  remu         t4, s3, t6
                  nop
                  mulh         a6, t2, tp
                  srl          s3, a2, s11
                  div          s11, t5, a7
                  fle.s        s0, fs8, fa1
                  ori          t6, s9, 159
	fsub.s	ft4, fa4, fa3, rne
                  sltiu        s11, t1, 595
                  slti         t2, tp, -1435
                  xori         a2, a4, 272
                  sltiu        ra, a0, 693
                  feq.s        t4, fs11, ft5
                  xori         t3, t5, 796
                  xor          s9, s4, t2
                  srai         s1, s4, 10
                  fcvt.w.s     ra, fs3, rne
                  mulhu        s1, a1, s9
                  fmv.x.w      s3, ft0
                  remu         a4, ra, a5
                  fclass.s     s7, fa5
                  auipc        a1, 728675
                  fmax.s       fs2, fs8, fs10
                  or           s5, s8, gp
                  mulh         a4, a6, t3
                  divu         s11, s4, s6
                  sltiu        t3, s2, 314
                  lui          a2, 208500
                  fmax.s       fs11, fs7, fs2
                  mul          t6, t5, t5
                  add          s0, tp, a5
                  add          s5, s4, s3
                  lui          t6, 971061
                  lui          s5, 424360
                  sltiu        t4, s1, 1498
                  fcvt.s.w     ft7, a0, rmm
                  mul          t1, a6, s4
                  mul          ra, ra, t1
                  sll          s10, a0, a0
                  addi         s9, a1, -660
                  sra          s3, a3, t4
                  srl          a2, a4, s11
                  fmv.w.x      fs2, a2
                  fsgnjn.s     fa4, fs3, fs8
                  slli         tp, a6, 27
	fcvt.wu.s	t3, ft5, rne
                  mulhu        a5, t5, s1
                  fmax.s       ft9, fa4, fa3
                  fmax.s       fa2, fs6, ft8
                  fsgnj.s      fa2, fs7, ft10
                  or           t4, s7, tp
                  fmv.w.x      fs4, sp
                  fsgnjx.s     fs10, fs7, fa4
                  fmax.s       fs1, fa5, ft6
                  srl          t2, s6, a7
                  fmin.s       fa1, fa1, fs9
                  mulhsu       s2, s10, s11
                  sll          tp, a1, zero
                  fclass.s     s10, fs4
                  fsgnjx.s     ft10, ft8, ft9
                  srl          s5, zero, s2
                  nop
                  div          tp, t0, s10
                  fsgnj.s      fa3, fs10, fa2
	fcvt.w.s	a1, ft6, rne
                  mul          t6, a4, gp
                  flt.s        a1, ft11, ft10
                  srl          s0, s4, a6
                  fle.s        s5, fs3, fs11
	fadd.s	fa0, fs4, fs4, rne
                  srli         t3, s11, 10
                  slt          s10, a1, s6
	fadd.s	fa7, ft0, ft10, rne
	fcvt.s.w	fs7, s6, rne
                  fmax.s       fa0, ft6, ft2
                  fmv.x.w      a2, fs3
                  nop
                  sltu         s3, a4, gp
                  add          s9, s3, t0
	fadd.s	fa4, fa3, ft0, rne
                  fmin.s       fs8, fs8, ft1
                  mul          sp, a7, t1
                  srai         a7, a4, 18
                  add          s7, sp, zero
                  divu         s3, s1, s4
                  srai         a6, s4, 15
                  sub          s11, t5, a6
                  slli         gp, s2, 19
                  fsgnj.s      fs10, ft0, fs3
                  rem          a2, t5, t2
                  sll          t2, zero, s4
                  div          s9, t6, s2
	fsub.s	fs0, ft6, fs1, rne
                  fcvt.s.wu    ft6, s3, rup
                  mulhu        s7, s11, ra
                  addi         s2, tp, -1047
                  sltu         a7, gp, s0
                  nop
                  auipc        a4, 853223
                  fmin.s       fs6, fa4, fs9
                  slli         s4, a4, 7
                  fsgnjn.s     fa0, fa7, fa0
                  addi         a6, t4, 555
                  xor          ra, gp, s3
                  xori         gp, zero, 1028
                  sltiu        s7, s1, 480
                  slt          zero, s8, a5
                  sltu         s11, t3, sp
                  sll          s10, a1, s4
                  auipc        t0, 438067
                  add          t3, s7, s11
                  fsgnjn.s     ft5, ft2, fs4
                  xori         t0, s0, -483
                  sll          s11, s8, s5
                  sll          s11, s0, s7
                  fsgnjx.s     fs9, ft4, ft7
                  fsgnj.s      fs9, fs1, fa0
                  srl          t2, s0, a5
                  rem          a4, zero, s10
                  fmv.w.x      ft0, a3
                  fadd.s       fs4, ft11, ft4, rup
	fcvt.s.wu	ft9, tp, rne
                  fsgnj.s      ft9, ft9, fs7
                  lui          gp, 369920
                  add          a4, s1, s9
                  mulhsu       t1, s5, a2
                  fle.s        a1, ft10, fs2
                  sltiu        s6, s6, 1478
                  fcvt.w.s     t3, fa3, rup
                  xor          s7, t5, gp
                  srl          t3, t5, a5
                  fcvt.s.w     ft7, tp, rdn
                  divu         ra, s10, a7
                  sltiu        t5, s6, -176
                  auipc        a6, 735533
                  ori          a2, a1, -560
                  fmv.x.w      zero, fa4
                  xor          t5, t0, a2
                  div          t6, t6, t6
                  and          t6, t4, s11
                  or           a7, t4, s7
	fcvt.s.w	fa5, t0, rne
                  mulh         tp, s1, s11
                  fmv.w.x      ft5, s7
                  slt          t3, sp, s2
                  sub          t5, s5, t1
	fcvt.s.wu	fs2, zero, rne
	fcvt.s.wu	fa4, s1, rne
                  fmax.s       ft5, fs2, fa2
                  fcvt.wu.s    a1, fs0, rne
	fcvt.s.wu	fa0, gp, rne
                  fcvt.s.w     ft3, gp, rmm
                  remu         s5, s2, sp
                  slti         t4, s1, -1395
                  fmv.x.w      s9, fs3
                  feq.s        s6, ft7, ft9
                  fclass.s     tp, fs9
                  srli         s9, a1, 26
                  fcvt.s.w     fs2, gp, rtz
                  add          sp, a4, a0
                  fsgnjn.s     ft0, ft1, ft9
                  mulhu        s11, t0, a0
                  fcvt.s.wu    ft6, s0, rdn
                  auipc        zero, 614602
                  addi         a7, t2, -1359
                  mul          zero, gp, a7
                  sltiu        s6, s3, 171
                  fmv.x.w      t0, fs1
                  mulh         t5, t3, s9
                  slt          s10, a2, s7
                  fmv.x.w      s9, ft5
                  sltiu        t2, a5, 41
                  auipc        s0, 143469
                  fcvt.s.w     fs0, s6, rdn
                  feq.s        t4, fa4, ft0
                  fcvt.s.wu    ft6, s11, rne
                  add          s1, ra, t2
                  srai         s11, gp, 5
	fcvt.s.w	ft0, a0, rne
                  fclass.s     s7, ft10
	fcvt.wu.s	t5, fs4, rne
                  and          t3, t6, s3
                  srli         s0, a7, 9
                  srl          s1, t0, a7
                  fsgnjn.s     ft7, fs8, fs9
                  ori          s7, s7, 1436
                  fsub.s       ft5, fs5, ft3, rmm
                  mulh         s11, s8, tp
                  nop
                  fmv.x.w      tp, ft10
                  srli         s4, sp, 6
                  nop
                  fsgnjn.s     fa7, fs1, ft7
                  srai         s9, a3, 6
                  srai         s6, s11, 0
                  slli         t2, a7, 12
                  slt          a4, zero, s4
                  rem          t1, s4, s5
                  lui          tp, 914703
                  fmax.s       fs2, ft0, fa0
                  mulhsu       s5, a7, s1
	fcvt.w.s	ra, fs0, rne
                  flt.s        a6, fs0, fs2
                  feq.s        a4, fs1, fs6
                  srl          a6, gp, t4
                  sll          t3, s2, s5
                  mulhu        s3, t4, t4
	fcvt.w.s	s6, fa6, rne
                  fcvt.w.s     s2, fa5, rdn
                  add          t4, ra, a0
                  xor          s4, ra, a3
                  nop
                  slt          s0, gp, a5
                  div          t4, a7, t1
                  fsgnjx.s     fs0, ft1, fa7
                  divu         s9, s7, s6
                  xori         s11, s10, 698
                  fsgnjx.s     fs0, fa6, fa0
                  mulhsu       a5, a1, s8
                  xori         s7, s1, -963
	fcvt.wu.s	a1, fs7, rne
                  fclass.s     t6, fa1
	fcvt.w.s	s11, fa1, rne
                  sll          ra, t5, a5
                  and          t6, gp, t1
                  add          s5, sp, s10
                  slli         s4, t0, 28
                  fsgnjn.s     fa5, fa5, ft11
                  andi         s3, gp, -1192
                  mulh         s2, sp, s9
                  mulh         s7, s10, t3
                  feq.s        s3, fs9, fa1
                  mul          a1, zero, s6
                  slt          a4, t0, t3
	fcvt.w.s	s3, fa7, rne
                  srl          a2, t3, s6
                  sltu         s10, s11, zero
	fcvt.s.w	ft2, s5, rne
                  or           a1, t0, s5
                  sub          t0, a1, t5
                  fclass.s     s3, fa5
                  sltiu        s5, s0, 754
                  slt          ra, s5, a0
                  fsgnjx.s     fs3, fs5, ft4
                  rem          s3, t5, s1
                  fsgnj.s      ft4, fa6, fs4
                  remu         a7, a4, a3
                  fsgnjx.s     fs7, fs6, fs1
                  addi         a2, t1, 831
                  or           s11, t3, a4
                  slt          t4, t3, s2
                  slt          s0, ra, a5
                  fsgnjx.s     ft10, ft10, fs4
                  sltiu        ra, t5, -193
                  fsgnjx.s     fa3, fs11, fs10
                  mulhsu       a1, s11, a2
                  auipc        t1, 443584
                  feq.s        t6, ft5, ft1
                  slli         s0, a6, 10
                  sra          ra, s10, s5
                  mul          s1, ra, a5
                  fclass.s     a4, ft9
                  fcvt.s.w     fs0, s5, rdn
                  slti         t3, a1, -1746
                  slti         s7, s6, 1842
                  slt          t5, a6, ra
                  srli         t1, a5, 0
                  and          s4, s9, a6
                  srl          ra, a6, gp
                  fmin.s       fs4, fs2, fs8
                  slli         t6, t3, 18
                  fclass.s     s11, fs6
                  fsgnjn.s     ft1, fs4, fs4
                  lui          t2, 111100
                  rem          sp, a5, s2
                  fcvt.w.s     t1, ft10, rtz
                  sub          s3, a2, ra
                  lui          s10, 849997
                  div          sp, t1, t6
                  mulh         a2, s4, ra
                  or           a5, a2, s8
	fsub.s	ft1, fa6, fs4, rne
                  and          a2, t0, s5
                  andi         s4, t2, 279
                  fadd.s       fs5, ft2, fa7, rne
                  fmin.s       ft3, ft10, fa5
                  xor          s4, gp, a6
                  fmax.s       ft11, fa7, fs6
                  mulhu        s10, s5, a5
                  rem          t0, a5, t1
                  fle.s        s2, ft4, fs3
                  auipc        ra, 707452
                  slt          a1, a0, s1
                  slt          t6, s0, a1
                  fclass.s     s1, ft0
                  sra          s10, a0, s2
                  nop
                  fmax.s       fa2, fs9, fa5
                  and          s3, s7, s3
                  fmax.s       ft7, fs3, ft5
                  ori          gp, s7, -476
                  fsgnjn.s     ft7, fs0, fs9
                  fle.s        s6, fa6, ft2
                  add          s0, s1, s1
                  fcvt.w.s     zero, fa6, rtz
                  nop
                  add          tp, t4, a3
                  fsgnj.s      fs10, ft11, fs1
                  slti         s2, s3, 163
                  and          s7, t3, s11
	fadd.s	fs11, fa6, fa2, rne
                  slli         sp, tp, 4
                  fle.s        zero, fs5, fs4
                  fle.s        s5, ft4, ft4
                  flt.s        t6, fa6, fa1
                  andi         s6, a3, -185
                  mulh         s9, t2, a2
                  ori          s11, t4, 941
                  ori          a4, sp, -735
	fadd.s	fs9, fa3, ft6, rne
                  fle.s        tp, ft10, fs2
                  xor          sp, s4, t1
                  fle.s        a6, fa1, fs11
                  fcvt.s.w     fs4, t4, rdn
                  rem          tp, s1, sp
                  fmv.w.x      ft7, s8
                  sll          ra, s0, t6
	fcvt.w.s	a4, fa1, rne
                  sra          s5, tp, s10
                  mulh         s6, a3, t4
                  flt.s        a7, fs6, ft4
                  sll          s9, t2, a6
                  xori         a5, t6, 49
                  fcvt.s.w     ft8, t1, rtz
                  mulhu        s9, zero, ra
                  sll          t3, t5, a3
                  flt.s        a1, fa2, fa2
                  sra          t3, s10, s2
                  andi         a4, s8, -108
                  nop
	fcvt.wu.s	a4, ft2, rne
                  rem          s0, t1, s3
                  xor          zero, s8, s5
                  fmax.s       fs10, ft9, fa1
                  rem          zero, a4, tp
                  mul          s2, t1, t3
                  ori          a6, s4, 1047
                  auipc        a6, 101319
                  srl          zero, a5, s10
                  fcvt.s.wu    fa6, t3, rdn
                  mulhsu       t5, s0, s6
                  fcvt.wu.s    a6, fs0, rtz
                  lui          t0, 597993
                  xor          ra, t6, s2
                  divu         a2, tp, ra
                  fsgnjn.s     fa2, ft4, ft2
                  mul          s4, a4, zero
                  xori         a4, s8, 1902
                  sltu         t1, gp, a0
                  andi         tp, s11, 1699
                  fsgnjx.s     fs8, fa4, ft10
	fcvt.w.s	t2, fs10, rne
                  srai         s3, sp, 3
                  mulh         ra, s3, tp
                  sra          s5, t2, zero
                  xor          a4, s2, zero
                  fcvt.s.wu    fa1, s11, rtz
                  sltiu        t0, s9, -1253
                  sltu         t3, s10, a6
                  or           s0, s9, tp
                  sub          tp, a5, a0
                  sra          s7, s8, t5
                  sub          s4, t4, s3
                  slli         t0, t0, 17
                  rem          t3, zero, s5
                  srli         ra, gp, 3
                  or           t0, a4, s3
                  mulhu        s9, a1, s6
                  fmax.s       fa7, fs3, fa3
                  fle.s        a4, fa7, fs5
                  fcvt.s.wu    fa4, tp, rdn
                  fcvt.s.w     fa5, s2, rtz
                  divu         t3, t6, a1
                  srli         tp, s10, 7
                  fcvt.w.s     s9, fs0, rdn
                  fcvt.s.wu    fa1, s3, rne
                  nop
                  slli         a1, t6, 19
                  fcvt.w.s     ra, fs9, rmm
                  ori          s0, t2, -1961
                  fclass.s     s0, fs3
                  sltiu        t3, s9, 837
                  ori          a5, sp, -2004
                  slt          gp, zero, t3
                  add          t4, s6, ra
                  slt          s4, t3, a6
                  and          t3, s9, s10
                  fadd.s       ft4, ft4, fa6, rtz
                  fsgnjx.s     fa7, ft1, fa0
                  fsgnjx.s     fs11, fs6, ft0
                  fmax.s       fs7, ft1, fs10
                  fadd.s       fs9, ft2, fs0, rne
                  fcvt.s.wu    fa2, sp, rmm
                  nop
                  slli         s4, a4, 16
                  mul          t3, s6, t2
                  nop
                  or           t0, s7, tp
	fcvt.s.w	fs11, t4, rne
                  fcvt.s.wu    ft9, t5, rtz
                  mulhsu       a2, s4, s9
                  mulh         t6, s4, sp
                  lui          s9, 371618
                  rem          s11, s3, sp
                  flt.s        a7, fa0, ft5
                  srai         a4, a5, 13
                  fcvt.s.wu    fs6, t3, rtz
                  mulhu        a2, t5, a7
                  srli         gp, t2, 15
                  feq.s        sp, ft5, fs1
                  fclass.s     sp, fs10
                  divu         s11, t0, t5
                  fsgnjx.s     fs0, ft3, fs11
                  fsgnjn.s     fa5, fa2, ft6
                  fmax.s       fs1, ft5, fs5
                  and          s7, s5, a6
                  fmv.w.x      fa7, a1
                  slti         t0, s3, 566
                  nop
                  lui          t1, 978985
                  slti         a5, s7, 839
                  feq.s        tp, fa6, fa0
                  add          s5, s10, a7
                  fmax.s       fs8, fs6, fa7
                  fcvt.s.w     fs4, t5, rne
                  remu         s6, a2, gp
                  lui          zero, 33985
                  andi         gp, a2, 2041
                  nop
                  rem          s10, s4, s8
	fadd.s	ft7, ft1, ft10, rne
                  sub          tp, s10, s6
                  fmv.x.w      a2, fs8
                  fsgnjx.s     ft8, ft1, ft6
                  srai         s11, ra, 3
                  slli         a6, s0, 9
                  slt          a4, t1, a7
                  flt.s        zero, fa2, fa1
                  xor          sp, s5, sp
                  andi         ra, a2, -233
                  fle.s        s0, fa0, fs2
                  xor          gp, tp, t4
                  add          tp, zero, t3
                  or           s1, a4, t5
                  or           s11, a6, t4
	fcvt.s.w	fa4, s7, rne
                  slti         t1, a4, 530
                  fsgnjx.s     ft6, fs8, ft5
                  srl          t1, s2, zero
                  auipc        s7, 247220
                  feq.s        t0, ft8, ft7
                  fcvt.s.w     ft1, t2, rtz
                  slli         t1, a2, 25
                  slt          s1, s9, t3
                  srli         gp, t5, 14
                  slt          t2, a3, t1
                  srai         s9, s7, 6
                  mul          s7, gp, t0
                  flt.s        ra, fa4, ft11
                  fcvt.w.s     tp, fs5, rdn
	fcvt.w.s	t4, ft2, rne
                  or           sp, s9, t0
                  addi         tp, t2, 1726
                  fsgnjn.s     fs4, fs0, fa7
                  add          t3, a2, t0
                  and          s0, zero, t4
                  or           a4, s11, a3
                  divu         t0, a0, s3
                  mulh         s5, s4, tp
                  and          s7, a5, gp
                  sltu         a1, s10, s1
                  addi         s3, s11, -1118
                  slti         a5, s1, -1258
                  div          zero, s9, a2
                  addi         t2, s8, -939
	fcvt.s.wu	ft11, s4, rne
                  flt.s        sp, fs1, fa4
                  mulhsu       s4, a1, a1
                  nop
                  and          s5, t4, sp
                  auipc        t5, 38813
                  fle.s        s2, ft8, fa5
                  sltu         s2, t2, t0
                  xori         s0, s8, -1555
                  ori          ra, a3, -67
                  sub          tp, t4, t1
                  mulh         s5, t0, t0
                  mulhsu       a5, gp, s7
                  divu         t2, s1, s10
                  auipc        s10, 256523
	fcvt.s.wu	ft9, sp, rne
                  nop
                  remu         gp, s11, gp
                  and          s3, tp, sp
                  fcvt.wu.s    t3, fa5, rtz
                  srai         a2, s9, 24
                  fmv.w.x      fa7, t4
                  fmv.x.w      s9, ft6
                  divu         ra, s10, sp
                  sra          a5, a7, a5
                  or           s5, t0, t3
                  fsgnj.s      ft5, fs1, ft6
                  slt          a7, ra, gp
                  andi         a7, a3, 1518
                  lui          t4, 398504
                  ori          s11, s11, -472
                  srl          zero, a4, gp
                  fcvt.wu.s    s10, fs7, rmm
                  fmv.w.x      fs7, s8
                  ori          a5, t2, 175
                  srl          sp, s5, s3
                  srai         t4, t0, 13
                  add          t0, ra, a3
                  slt          zero, s5, s0
                  remu         t0, s9, s11
                  div          gp, s4, a1
                  auipc        tp, 740011
                  sltu         t1, s0, t2
	fcvt.wu.s	a2, fs2, rne
                  add          s1, zero, a6
                  div          s3, a7, a3
                  remu         a7, t1, tp
                  flt.s        t4, ft2, fs7
                  srli         t6, s0, 15
                  fmax.s       ft8, fs2, ft6
                  add          s11, s0, s9
                  and          a2, t5, tp
                  divu         a1, a2, s10
                  srai         t2, s11, 9
                  rem          a5, s8, a0
                  xori         s3, t2, -1974
                  lui          sp, 1002479
                  mulh         s9, t3, a5
                  mulhu        s11, a0, zero
                  or           s2, a2, s3
                  fcvt.w.s     t0, ft9, rmm
                  fmin.s       fs10, ft7, ft2
                  flt.s        s2, fs5, fa5
                  sub          s7, a1, s2
                  fadd.s       fa5, fs2, fs9, rmm
                  slt          zero, a0, a4
                  fclass.s     s7, ft4
                  remu         sp, a4, zero
                  rem          t0, tp, s7
                  fmv.w.x      fa5, t1
                  fclass.s     s4, ft11
                  xor          s4, a4, a6
                  feq.s        a5, fs1, fs11
                  lui          t3, 317445
                  srl          s1, t1, t6
                  srli         a6, sp, 3
                  lui          s5, 550575
                  add          tp, s3, gp
                  and          sp, gp, a6
                  remu         sp, s6, t3
                  slt          s4, s9, a2
                  fsub.s       ft0, fs0, ft1, rtz
                  fadd.s       fs0, fs2, ft11, rtz
                  fle.s        t4, ft3, fa7
                  srl          a1, a7, a0
                  fsgnjx.s     fa1, fs10, fs4
                  rem          t0, s11, s3
                  or           t3, a2, sp
                  fsgnj.s      fs2, fa0, fs2
                  srli         ra, t1, 28
                  slt          s3, s5, ra
                  feq.s        t4, ft0, fs10
                  fclass.s     s3, fs11
                  fsgnjn.s     fs11, fa6, fs0
                  auipc        s3, 281933
                  fsgnjx.s     fs7, fa0, ft7
                  xor          t3, t6, a7
                  fsgnjn.s     fs0, fa4, fs2
                  sltu         gp, s9, a5
                  fle.s        a2, ft4, ft1
                  fle.s        gp, fa1, ft3
                  fsgnj.s      fa0, fs4, fa6
                  fcvt.wu.s    a5, ft5, rtz
                  slt          t3, t6, t2
                  fsgnjn.s     fs8, ft0, ft9
                  or           tp, sp, s0
                  xor          zero, s7, a1
                  fcvt.s.wu    fs1, s4, rne
                  xori         t1, s9, -926
                  mulh         s9, a5, s0
                  mulhu        s1, s7, s3
	fcvt.s.wu	fs10, s4, rne
                  lui          a7, 227508
                  andi         t0, ra, 274
                  sltu         t2, s7, a4
                  slt          s5, s11, a4
                  fadd.s       ft10, ft7, fs8, rtz
                  andi         s4, s0, -1073
                  srli         t4, s4, 14
                  srl          s9, s10, t1
	fcvt.wu.s	s2, ft8, rne
                  andi         s3, s4, 1534
                  fsgnjx.s     ft4, fs2, ft1
                  mulhu        t2, a0, gp
                  fclass.s     gp, fs7
                  slli         t0, a5, 16
	fcvt.s.wu	fa2, t3, rne
                  mul          s0, t0, t1
                  or           a6, zero, gp
                  auipc        t5, 634405
                  divu         t5, sp, a6
                  addi         a5, ra, 958
                  fmv.x.w      t0, fa0
                  srai         a1, t3, 7
                  div          ra, s10, s1
                  mul          s6, a2, t0
                  srai         tp, t2, 13
                  addi         t2, a2, -629
                  sltiu        s4, t2, 1218
                  fmv.x.w      s9, fa6
                  sub          s9, ra, a6
                  feq.s        gp, fs3, fa0
                  sll          s10, t3, t6
                  add          a7, t5, tp
                  addi         zero, s7, 586
                  xori         sp, s8, -1853
                  flt.s        gp, fs0, ft2
                  fsgnj.s      ft4, fa2, ft7
                  sra          a2, zero, t1
                  fmv.w.x      fa5, s7
                  fsgnjn.s     fs5, fs1, ft6
                  fmv.w.x      fs0, s4
                  fmax.s       fa3, fs6, ft1
                  add          ra, ra, s3
                  mulhsu       s9, s7, zero
                  mulhsu       a4, t5, t3
                  feq.s        sp, ft8, fs10
                  nop
                  fmin.s       fa0, ft3, fs2
                  mul          a2, s4, s5
                  mul          s11, s9, t6
                  fsgnjn.s     fs10, fs4, ft8
                  and          s3, s4, s10
                  flt.s        a4, ft8, fs1
                  fcvt.s.w     ft0, s7, rne
                  fcvt.w.s     a4, ft10, rtz
                  fcvt.s.w     ft1, gp, rtz
                  slti         s0, a0, 554
                  flt.s        s3, fa6, fs7
                  rem          t4, t2, ra
                  flt.s        t6, ft6, fs0
                  fsgnjn.s     fs8, ft10, fs5
                  sll          gp, s11, s8
                  slti         s9, a5, -1609
                  mulhu        a4, s10, t2
                  srai         a7, s10, 18
                  div          a7, t1, zero
                  xor          s11, ra, t0
                  fclass.s     zero, fs6
                  andi         t0, t4, -1259
                  fcvt.s.w     ft10, t6, rne
                  div          t3, zero, s8
                  srli         s5, s6, 0
                  remu         s5, sp, a1
                  fsub.s       fs8, ft7, fa5, rup
                  feq.s        s9, fa3, fa5
                  div          sp, a7, zero
                  fmv.w.x      ft9, a2
                  mulhsu       t3, t3, s8
	fcvt.wu.s	a5, fs8, rne
                  flt.s        s10, ft4, ft7
                  fsgnjx.s     fs1, ft6, ft7
                  fle.s        a6, fs4, fa2
                  fsgnj.s      fs2, fa5, fa5
                  flt.s        sp, ft10, ft5
                  auipc        t1, 72965
                  rem          t5, zero, s0
                  and          s4, s3, t5
                  mulhsu       s2, a7, s8
                  fcvt.s.wu    ft0, s8, rne
	fcvt.s.wu	fa3, t1, rne
	fcvt.w.s	s3, ft9, rne
                  and          a7, ra, a1
	fcvt.s.w	fs3, s0, rne
                  srai         sp, gp, 3
                  fsgnj.s      fs0, ft1, ft9
                  fsub.s       fs5, ft9, fs8, rmm
                  slt          gp, a6, sp
                  fmv.x.w      tp, ft5
                  ori          tp, t5, -589
                  div          s4, s1, t5
                  slt          zero, sp, ra
                  fle.s        t4, fs5, fa3
                  xor          tp, gp, a1
                  fmax.s       ft1, fs1, fs7
                  rem          tp, t6, a7
                  fsgnjn.s     fa4, fs4, fs5
                  fsgnj.s      fs11, fs7, ft5
                  mulhu        s6, s11, s11
                  divu         a6, a4, s7
                  fsgnjx.s     ft9, ft5, fs5
                  xor          s2, t6, a1
                  or           a5, t3, s8
                  or           t6, s4, t4
                  fmv.w.x      fa2, sp
                  sra          t5, a5, s2
	fcvt.wu.s	s7, ft10, rne
	fcvt.s.wu	ft0, s6, rne
                  remu         s11, s7, s2
                  sll          a1, a2, a3
                  flt.s        s4, ft5, ft5
                  mulhsu       s3, t0, a2
                  fsgnj.s      fa4, fa6, ft5
                  feq.s        a6, ft3, fs1
                  fclass.s     t0, ft10
                  or           gp, a1, a4
                  andi         s10, s8, -1055
                  sra          s6, s11, s4
                  fle.s        t2, fa4, fs1
                  or           t2, s11, s3
                  rem          zero, t1, t2
                  slt          gp, t3, s9
                  ori          gp, s9, 1262
                  xor          t5, t3, t1
                  slt          a1, s4, a5
                  addi         t6, a0, 952
                  mulhu        t2, t4, gp
                  add          t4, a3, s6
                  fcvt.s.w     fs7, s10, rdn
                  fsgnj.s      fa3, ft6, ft4
                  and          sp, a7, s4
	fcvt.s.wu	fa4, a7, rne
                  andi         a4, s0, 699
                  divu         a7, a1, tp
                  slt          s3, a7, s1
                  fcvt.wu.s    t0, fa5, rne
                  mulh         zero, a1, a1
                  fadd.s       fa6, ft11, fs8, rup
                  fclass.s     a1, fa4
                  fadd.s       fa5, fa6, fa1, rdn
                  mulhu        a7, s2, s4
                  fmv.x.w      t5, fa0
                  xor          a2, s2, t4
                  remu         s6, tp, t2
                  auipc        gp, 123534
                  mulhsu       s11, t3, t1
                  sll          t0, sp, s4
                  fmax.s       fa2, ft10, fs0
                  fsgnjx.s     ft2, ft8, fs5
                  nop
                  sub          s0, a7, t0
                  srli         a6, s6, 0
                  auipc        t6, 548485
                  and          t0, a4, a5
                  fmv.x.w      sp, fs8
                  divu         zero, a4, a0
                  fmax.s       fs8, ft7, ft4
                  fmax.s       ft5, fa5, fa0
                  sltiu        zero, s2, 1481
                  fmv.w.x      fs9, t2
                  add          s3, a2, s1
	fcvt.w.s	t4, fs10, rne
                  sub          t3, sp, s8
                  feq.s        s10, fa5, fa5
                  mulh         a5, a2, s7
                  fsub.s       ft3, fa3, fs4, rdn
                  sub          s7, s1, gp
                  fmax.s       ft1, fs5, ft2
                  and          zero, s0, s1
	fcvt.s.wu	fs10, a6, rne
                  srai         t0, t1, 28
                  andi         zero, t6, -2030
                  rem          t1, gp, s10
                  mulhu        t4, s9, s3
                  fclass.s     s5, ft7
                  slti         a7, gp, -2035
                  mulhu        zero, t1, a5
	fcvt.s.w	ft2, s0, rne
                  flt.s        tp, fs4, ft10
                  mulhu        t4, t5, gp
	fcvt.s.w	fs1, t6, rne
                  mul          s11, t1, s10
                  sltu         s0, t0, a1
                  fadd.s       ft11, fa5, ft10, rup
                  lui          a6, 785419
                  auipc        a4, 29183
                  nop
                  flt.s        s3, fa3, fa2
                  fclass.s     a4, fs3
                  fmin.s       ft10, ft0, fa5
                  fmv.x.w      sp, fs3
                  or           s4, t4, t3
                  slli         s3, gp, 27
                  lui          s5, 442782
                  fcvt.w.s     t4, fs4, rtz
                  nop
                  lui          gp, 28362
                  ori          s5, s4, -1737
                  fsgnjx.s     fa0, ft1, ft3
	fcvt.w.s	s11, fa5, rne
                  sltu         t4, s7, t1
                  fmin.s       ft2, ft10, ft8
                  srai         s7, t4, 12
                  add          sp, s11, t1
                  fmv.x.w      a5, ft5
                  srl          s5, t5, tp
                  nop
                  ori          ra, s7, 384
                  and          a6, s1, a6
                  sub          s9, s6, s0
                  add          s2, t3, a3
                  ori          t5, s1, 116
                  nop
                  feq.s        gp, fs6, ft5
                  mulhsu       s9, t5, a4
                  lui          t5, 227246
                  or           s1, t3, t3
                  fmax.s       fs10, fa5, fa4
                  srai         s7, a4, 19
                  fcvt.wu.s    a6, fs5, rdn
	fcvt.w.s	t6, fa6, rne
                  srli         a1, t0, 11
                  fsgnjx.s     fa7, ft8, ft7
                  lui          s11, 665826
                  feq.s        s11, ft8, fs4
	fsub.s	ft7, ft2, ft9, rne
                  mulh         s6, s11, t2
	fcvt.w.s	a7, fs3, rne
                  nop
                  sra          gp, s4, a3
                  sub          a2, tp, s8
                  fle.s        s3, fs5, fs3
                  sltu         s7, s7, s8
                  feq.s        t5, fs8, fs3
                  fmin.s       fa5, fs7, ft3
                  mulh         a4, s4, a2
                  slli         t1, a3, 0
                  fsgnj.s      ft10, fs2, fs11
                  remu         a2, s11, a2
                  srl          t1, a5, s0
                  xor          t5, s6, t4
                  fmv.x.w      a4, fa0
                  srl          s5, a6, t1
                  fsub.s       fa3, fs5, fs3, rmm
                  srli         s3, tp, 25
                  srli         s9, ra, 24
                  xor          s6, s4, s2
                  mul          s0, t4, tp
                  mulhsu       s9, a2, tp
                  fmax.s       fs10, ft1, ft3
                  mul          t6, s11, s3
                  mulh         zero, t4, s2
                  and          s1, tp, s11
                  srli         a2, a6, 2
                  fmin.s       fs10, fs8, fs0
                  slti         gp, t2, 1777
                  auipc        s10, 39962
                  div          s1, s6, a1
                  divu         ra, s2, a3
                  remu         a7, a2, s11
                  sra          t2, a7, s9
                  xor          ra, a6, a0
                  fmv.x.w      t3, fs8
                  add          a1, t5, a6
                  add          a6, ra, t6
                  fmv.x.w      ra, ft10
                  sub          s1, s7, t1
                  srai         s11, a6, 30
                  and          a5, a3, tp
                  divu         sp, t5, s0
                  fcvt.s.wu    ft3, t6, rtz
                  feq.s        t4, fa0, fs3
                  fmax.s       ft9, fs11, fs4
                  srli         tp, tp, 4
                  remu         s5, s1, zero
                  mulhsu       t6, a4, t6
                  mulh         t2, s0, ra
	fcvt.s.w	ft4, ra, rne
                  slti         a4, t2, -1396
                  nop
                  add          s1, gp, s1
                  flt.s        a5, ft4, ft0
                  fsgnjx.s     fa2, fs1, fs11
	fcvt.s.wu	ft9, sp, rne
                  slt          a4, t0, s11
                  mul          s6, s4, t1
                  sltiu        t4, s0, -672
                  sltiu        a4, s7, 308
                  divu         a5, tp, a7
                  lui          s11, 915642
                  feq.s        s7, fa3, ft9
	fcvt.s.w	fs10, s5, rne
                  fle.s        s10, fa5, fa4
                  fclass.s     s7, ft4
                  xori         s7, sp, 1459
                  nop
                  fclass.s     sp, fs0
                  srli         a7, s3, 12
                  fsgnjn.s     fa5, fs1, ft9
                  add          a6, s8, t3
                  xori         gp, s3, 1179
                  remu         a7, t5, s3
                  sra          s1, s1, s10
                  remu         a7, t0, s9
                  fmv.w.x      ft4, s0
                  slt          s4, zero, t6
                  srai         sp, a3, 30
                  xor          t3, tp, a3
                  ori          a4, s6, -426
                  flt.s        a7, ft3, fa0
                  fcvt.s.wu    fs9, s9, rtz
	fsub.s	ft5, ft11, ft0, rne
                  divu         s10, a3, s1
                  fmv.w.x      ft4, tp
                  nop
                  fsub.s       ft1, fs2, ft8, rdn
                  sltiu        t5, t2, -1161
                  slti         t6, a1, 1372
                  mulh         s4, s2, a3
                  divu         zero, t5, a4
                  sltu         s10, s1, s10
                  fsgnj.s      ft10, ft1, fs6
                  addi         s11, gp, -1240
                  addi         t6, t5, 1958
                  fle.s        a2, ft2, fa1
                  lui          a6, 992410
                  xori         sp, s0, -230
                  or           s3, a4, s3
                  or           s10, t5, s1
                  sltiu        s10, s2, -18
                  sub          s9, s2, a0
	fcvt.w.s	s6, ft8, rne
                  fcvt.s.wu    fs9, a7, rtz
                  or           a2, a0, s7
                  div          s6, sp, a7
                  andi         s6, s11, 956
                  fclass.s     s6, fa2
                  xor          s5, s7, a6
                  fcvt.s.w     fa7, gp, rdn
                  fsgnjn.s     fa5, ft11, ft3
                  fsgnjn.s     fa4, ft4, ft4
                  fle.s        t2, ft9, fs11
                  divu         s0, t6, s9
                  fsgnj.s      ft4, fs8, fs7
                  andi         s2, t0, -1032
                  fmv.x.w      s7, fs7
                  andi         t2, t4, -136
                  divu         a2, a3, sp
                  rem          a4, t3, t3
	fcvt.w.s	a2, fa1, rne
                  or           s9, s11, a2
                  sltiu        s2, a7, 1011
                  fsgnjn.s     fs0, ft6, ft11
                  flt.s        sp, fs7, fs6
                  fmax.s       fs4, fs8, fs6
                  sll          t6, a3, s6
                  fclass.s     t1, fs0
	fcvt.s.wu	fa7, t3, rne
                  or           s10, a4, s11
                  sltu         s0, a3, s4
                  fmv.w.x      ft7, t1
                  addi         gp, t1, 1880
                  mulhu        t2, s11, s11
                  and          s2, t6, tp
                  div          s10, t4, s2
                  fadd.s       fa7, fa3, ft9, rne
                  slt          a2, a1, a4
                  addi         gp, t0, -263
                  fsub.s       fa7, ft5, ft3, rdn
                  fsgnj.s      fs5, ft10, fs6
                  slt          s0, a7, s4
                  lui          a7, 648982
                  andi         a7, t4, -1563
                  fsgnjn.s     fs6, ft7, fs11
                  remu         s4, a1, t4
                  or           s7, s9, t2
                  srai         s5, t1, 9
                  fsgnjn.s     fa0, fs4, ft2
                  flt.s        zero, fs9, ft11
                  srli         s1, s4, 26
                  xori         s10, t1, 701
                  srai         s1, a3, 2
	fcvt.s.wu	fs10, a7, rne
                  srli         t0, s8, 28
	fadd.s	fs2, fa2, fs8, rne
                  andi         zero, sp, 379
                  div          t2, gp, t3
                  fle.s        a5, fs11, fa5
                  feq.s        a7, ft6, fa7
                  fclass.s     gp, ft6
                  xori         s10, a4, 770
                  srl          t2, s10, a7
                  fmv.w.x      ft8, s3
                  fmin.s       fs1, fs2, fs7
                  srai         s7, a6, 9
                  mul          s9, a3, a3
                  sltu         s6, gp, a5
                  remu         a4, s4, s1
                  mulhu        a7, s1, s9
                  sltiu        t2, s2, 359
	fcvt.s.wu	fa5, a3, rne
                  divu         s11, a7, a3
                  nop
                  or           s11, a1, s10
                  fmax.s       fs8, fa5, ft5
                  sll          t4, gp, s11
                  fsgnjn.s     fs5, fa2, fa5
                  rem          t4, s2, s5
                  srl          s0, t5, t6
                  and          t1, a3, s2
                  slt          s10, t6, a3
                  slti         a2, t5, -1661
                  fsgnjx.s     ft1, fs9, ft5
                  xor          s10, s10, t1
                  xor          s4, a6, s8
                  fmv.x.w      a5, fs7
                  andi         a7, zero, 187
                  srli         s2, zero, 20
                  fmv.x.w      t4, fs7
                  fmin.s       fs10, ft3, fs1
                  rem          a7, a7, s10
                  rem          s11, t6, t0
                  fmax.s       ft4, ft4, fs9
                  sltu         a5, s4, s3
                  mulhu        gp, a7, sp
                  fcvt.s.w     ft0, a7, rne
                  sll          ra, a2, sp
                  srl          s11, sp, zero
                  fmv.x.w      s7, ft6
                  sltu         t1, s6, s6
                  sub          a1, a7, a6
                  lui          s3, 521000
                  srai         t6, s7, 16
                  srai         s3, tp, 14
                  flt.s        t5, fs4, ft4
                  sra          s6, t2, tp
                  sra          a5, s3, t4
	fsub.s	fs7, fa3, fs7, rne
                  flt.s        s0, ft5, fs9
                  or           t6, ra, a5
                  nop
	fcvt.s.w	fs2, a6, rne
                  addi         s7, a1, -1194
                  fsub.s       fs6, fs5, fa3, rne
                  srai         a6, t5, 21
                  fsgnj.s      fa2, ft3, fs0
                  add          t6, s9, a5
                  fsgnjn.s     fa6, fs5, fa7
                  remu         a5, s6, t0
                  and          s1, a2, a1
                  slti         s0, gp, -1859
                  srl          t4, t3, ra
                  fle.s        a7, fs9, ft9
                  lui          s6, 661238
                  or           t0, s3, s11
                  fcvt.s.wu    ft11, s7, rne
                  srl          t0, s8, t3
                  srl          t1, sp, a1
                  andi         a5, t5, 1118
                  fsgnj.s      fs6, fa1, fs11
                  fmin.s       fs3, fs11, fa3
                  fmin.s       ft6, fs11, fs6
                  slli         a1, s0, 20
                  andi         t6, a2, -88
                  slti         s6, s2, -411
                  srli         s2, zero, 29
                  rem          s0, a2, s7
                  slli         s4, a6, 14
                  lui          a4, 438539
                  sra          t6, a7, a6
                  sltiu        s10, t2, -645
                  feq.s        t6, fa6, ft7
                  fcvt.w.s     t1, ft8, rtz
                  fmin.s       fs3, ft10, fa0
                  sll          t6, s0, t1
                  sra          a2, s4, s7
                  slti         ra, sp, 1966
                  fsgnj.s      fa1, fs6, fa5
                  or           zero, t2, t0
                  flt.s        a4, fs5, fs4
                  sub          a1, s8, s5
                  xor          s5, t2, a7
                  sltiu        t0, t2, 299
                  mulhsu       s3, t0, a2
                  srai         ra, s2, 12
                  slt          s3, s1, t0
                  srai         t1, a1, 25
                  feq.s        s7, fa7, ft4
                  div          sp, t3, sp
                  srl          s4, t0, t3
                  sub          t4, t0, s7
                  mulhsu       a4, a2, a2
                  fsgnjx.s     ft1, ft2, fs11
                  fmv.w.x      ft7, s3
                  add          t3, s5, a5
                  fmv.w.x      fs0, t3
                  fsub.s       ft4, fa2, fs10, rne
                  divu         s0, s3, ra
                  mulhsu       t1, a1, a3
                  sltiu        s10, t1, 1969
                  remu         a7, sp, s0
                  div          t5, a3, s5
                  ori          t3, ra, 1373
                  andi         a2, s3, -1411
                  flt.s        t2, fs6, fs6
                  sra          t6, a5, tp
                  auipc        a2, 94407
	fcvt.wu.s	a6, fs8, rne
                  srli         a7, zero, 19
                  add          a2, zero, ra
                  fsgnjx.s     fs4, fa2, fs11
                  andi         s1, a5, -903
                  fmin.s       ft0, fs10, fs5
                  fcvt.w.s     t6, fs0, rdn
                  divu         s4, s7, a2
                  fmv.w.x      fs7, a4
                  auipc        s11, 369411
                  mul          s0, a4, t4
                  flt.s        t2, fs2, ft9
                  srl          s5, s6, t1
                  sltiu        a1, s7, 1004
                  add          t4, gp, t2
                  mulhsu       a1, zero, sp
                  srl          s5, s8, s8
                  mulhsu       s11, s6, t2
                  sltu         sp, t5, t6
                  sll          s10, s11, a3
                  srli         s7, a1, 16
                  addi         s11, s4, -2006
                  srai         s10, tp, 10
                  slli         s2, s2, 3
	fcvt.s.wu	fa1, s3, rne
                  nop
                  fle.s        a4, ft11, fs8
                  slli         s7, a6, 17
                  andi         t4, s7, -699
                  slti         s3, s2, -1511
	fadd.s	fs3, fa7, fa7, rne
                  and          s2, s1, a1
                  slti         t5, t2, -1505
                  or           tp, a6, a2
                  sltu         s5, s10, s2
                  fmax.s       ft11, ft4, ft10
                  lui          a4, 82379
                  flt.s        a2, fa0, fa4
                  fcvt.s.wu    fs4, s9, rmm
                  slli         s10, s8, 22
                  fsgnj.s      fa2, fa5, ft1
                  sltu         zero, ra, s9
                  andi         zero, s6, -228
                  divu         a6, s6, t1
                  sub          s4, ra, ra
                  or           t0, zero, s11
                  and          a2, s1, s10
                  lui          tp, 460585
	fcvt.w.s	s1, fs6, rne
                  slti         s1, tp, -218
                  xori         sp, t5, 1040
                  auipc        s3, 502616
                  sll          s1, t6, s2
                  fclass.s     sp, ft6
                  fle.s        s0, fa2, ft1
                  nop
                  divu         t6, ra, s6
                  auipc        s9, 196595
                  sra          zero, tp, t5
                  sub          ra, a0, t3
                  srli         t2, a4, 1
                  fclass.s     s1, fs8
                  fadd.s       ft0, fa0, fs10, rne
                  divu         s1, t5, a3
                  fmax.s       ft3, fa4, ft5
                  mulh         a2, a0, ra
                  fmin.s       ft5, fs3, fs8
                  ori          t2, t3, 809
                  add          s2, s9, a2
                  fle.s        zero, ft3, ft7
                  xori         s10, a5, -1985
                  sra          s2, a7, s9
                  fmv.w.x      fa3, a6
                  div          s5, s0, s5
                  srli         a2, s6, 6
	fadd.s	ft9, ft3, ft2, rne
                  fsgnjx.s     ft6, fs8, fa2
                  feq.s        s4, ft6, fs10
                  fcvt.w.s     t1, fa7, rne
                  mulhu        s1, t5, a2
                  slli         t1, s0, 19
                  rem          s7, tp, s10
                  fsub.s       fa4, fa0, ft4, rup
                  fclass.s     sp, ft11
                  fcvt.s.wu    ft8, s10, rmm
	fsub.s	ft7, fs10, fa7, rne
                  fsgnjn.s     ft7, ft3, fs4
                  or           s4, t0, sp
                  fle.s        s3, fs9, fs10
                  sra          t0, a7, t2
                  fmv.w.x      fa1, s2
                  fle.s        t3, fs3, fs3
                  fmv.x.w      a7, ft10
                  div          t6, s1, t6
                  sll          t4, s1, s1
                  sll          s10, a5, s6
                  srai         s3, a1, 22
                  slli         s1, a6, 24
                  fsgnj.s      ft1, fs3, ft7
                  and          a1, t2, a7
                  xor          s0, s7, s6
                  slli         t5, t6, 13
                  sub          gp, s0, s10
                  slt          sp, zero, t0
                  feq.s        a1, fs3, fa0
                  sll          s6, t3, s1
                  addi         s0, s8, -1122
                  mulhu        s2, tp, a7
                  or           a5, s10, t1
                  mulhu        a4, s9, t1
                  fsgnjx.s     fa5, ft6, fa1
                  srai         a5, a3, 23
                  addi         t1, t1, -150
                  fsgnj.s      fs5, fa5, ft5
                  sltiu        a1, s0, 1619
	fadd.s	ft10, ft7, fa5, rne
                  nop
                  and          a1, sp, s11
                  sub          a4, a3, zero
	fcvt.w.s	s4, ft0, rne
                  sltu         s9, a5, t1
                  rem          s10, ra, s8
                  fmax.s       fa5, ft11, fs4
                  ori          t3, a5, 171
                  fadd.s       fs3, fs5, ft0, rmm
                  fclass.s     t0, fa5
                  fcvt.s.wu    fa7, s7, rne
                  fmv.w.x      fs11, t1
                  mul          t5, s5, a7
                  lui          t4, 89365
                  remu         s0, s4, tp
                  srl          a6, s10, s1
	fcvt.s.w	fs11, ra, rne
	fadd.s	fs2, fa2, fa2, rne
                  mulh         s5, a5, a6
                  add          a4, t5, t2
                  slti         a6, s11, -194
                  sra          t3, s4, gp
                  fclass.s     a2, ft1
                  auipc        t1, 1011979
                  fcvt.s.wu    fs1, s0, rdn
                  fsgnjx.s     ft10, fa0, ft1
                  mulh         t0, s5, s7
                  nop
                  andi         a2, s8, -891
                  fsgnjn.s     fs1, fs3, fa3
                  ori          t2, t0, -200
                  sra          s9, a7, s10
                  feq.s        tp, fs2, fa1
                  fcvt.wu.s    s3, fs1, rup
                  fsgnjx.s     ft9, ft5, fs9
                  andi         a7, s11, 508
	fsub.s	fs2, ft11, fa6, rne
                  fmin.s       fs4, ft0, fs8
                  slli         s4, a0, 1
                  srai         t4, sp, 25
                  slti         s6, t3, -1449
                  slli         t3, t1, 0
                  nop
                  andi         tp, s9, -1236
                  fcvt.s.w     ft11, s4, rne
                  nop
                  sltiu        s5, tp, -1377
                  sra          s2, s3, s8
                  mulh         ra, s9, s6
                  addi         t2, s9, -436
                  fmax.s       ft9, fs2, ft4
                  div          a6, s1, s11
                  fmv.x.w      zero, ft5
                  srai         a1, t6, 14
                  and          s0, sp, tp
                  mulhsu       t6, s8, a3
                  fle.s        t3, fs6, fs6
                  fcvt.w.s     tp, fs2, rne
                  add          a7, t1, s11
                  mulhsu       sp, s10, tp
                  nop
                  andi         s3, s10, 110
                  fmv.w.x      fa6, t5
                  fsub.s       fs5, fa0, ft2, rmm
                  fsub.s       ft9, ft8, fa7, rmm
                  remu         a7, a0, s2
                  add          a4, a6, gp
                  flt.s        s3, fs10, ft3
                  fsgnjn.s     ft9, fs2, fa2
                  slt          t0, s6, a6
                  sltiu        zero, s8, -197
                  fsgnjn.s     fs10, fs8, ft8
                  srai         s9, a5, 8
                  mulhu        s2, s7, s4
                  slli         zero, a0, 14
                  mulhu        t4, a0, s9
                  fcvt.s.w     fs7, s2, rdn
                  sra          s6, s11, a4
                  addi         s2, s5, -1295
                  slti         a5, a2, 699
                  add          s6, a7, t6
                  sll          t3, a7, a7
                  fmv.x.w      t6, fs11
                  lui          t1, 33093
                  fsgnjx.s     fa3, ft3, fa5
                  fmin.s       ft8, ft9, fa0
                  fmax.s       fs6, ft8, ft11
                  remu         s7, t6, s1
                  fmv.w.x      ft7, s1
	fcvt.wu.s	sp, fs1, rne
                  rem          gp, tp, t5
                  nop
                  sub          s7, a1, a5
                  slti         ra, s6, -760
                  sll          a4, s7, t6
                  sll          tp, t5, zero
                  div          s6, t1, a3
                  xor          s9, a6, zero
                  divu         s7, t0, t4
                  fsgnj.s      fa0, fs5, fs9
                  fmax.s       ft1, fa1, fa3
                  and          s7, zero, s8
                  mulhsu       sp, s8, s9
                  sub          a1, sp, a6
                  xor          a7, a0, s5
                  addi         tp, s4, -514
                  auipc        s0, 1032221
                  xor          s2, s5, s9
                  rem          tp, ra, zero
                  sll          t6, zero, zero
                  mulh         s6, s9, sp
                  remu         t2, s6, s1
                  ori          a1, t5, 1180
                  sub          s9, s3, t1
                  sub          t6, t3, s1
                  fclass.s     s1, ft8
                  fle.s        t1, fs1, ft11
                  or           s5, s3, s2
	fcvt.wu.s	sp, ft10, rne
                  fsgnjx.s     fs0, fa1, fs8
                  srl          s1, s2, s3
                  xori         t4, zero, -1363
                  fsgnjx.s     fs2, fs5, fs9
                  and          a6, s7, a6
                  lui          s6, 57520
                  slt          ra, t4, t5
                  auipc        a5, 803845
                  or           t1, s4, s9
                  fcvt.s.wu    ft1, s7, rtz
                  divu         s9, t2, t4
                  srli         s9, t1, 29
                  or           t5, a7, s4
                  andi         a5, s2, 331
                  fmv.w.x      fs0, a5
                  and          a1, zero, t4
                  sltiu        s3, a3, 981
                  fmv.w.x      fa4, a7
                  auipc        s11, 900153
                  sub          zero, a4, s0
                  mul          a1, s0, s8
                  fclass.s     ra, ft9
                  slti         t4, s8, 163
                  mulhsu       zero, a1, s3
                  fclass.s     a2, fa7
                  mul          t2, a5, zero
                  or           s5, s8, a6
                  fcvt.s.wu    fs0, a3, rup
	fadd.s	fs7, fs1, fs11, rne
                  fcvt.s.wu    fa3, a1, rup
                  fmin.s       fa2, fa4, ft1
                  slt          ra, t5, a7
	fcvt.w.s	a7, ft8, rne
                  mulhu        t3, s9, s7
                  fmv.w.x      ft9, a4
                  slt          a5, s9, t3
                  div          t2, a5, a5
                  div          tp, t2, t2
                  nop
                  remu         s1, s5, ra
                  mulhsu       zero, a2, a3
                  ori          s0, s4, -1273
                  fmv.w.x      fs10, gp
                  fadd.s       ft1, fa1, fa7, rtz
                  fsgnjn.s     fa1, fs3, fs9
                  xor          sp, s8, s7
                  or           a7, s1, s7
                  andi         a1, a3, -1176
                  fcvt.wu.s    a7, fs4, rmm
                  mulhu        s10, t2, t1
                  srai         t3, s7, 10
                  mul          t4, s8, t6
                  fcvt.wu.s    s5, ft11, rmm
                  feq.s        s7, ft11, ft4
                  div          a1, t1, a3
	fcvt.w.s	t4, fa3, rne
                  mulh         s4, s7, ra
                  xor          s0, t1, s2
                  nop
                  fadd.s       ft10, fa2, fa7, rtz
                  fadd.s       ft7, fa6, ft8, rdn
                  slli         a2, s5, 23
                  sltiu        s1, a6, 697
                  sra          s9, s3, gp
                  fmax.s       fa4, ft2, fs6
	fcvt.w.s	a4, fa3, rne
                  fmv.w.x      fs1, s3
                  fsgnjx.s     fs3, ft4, fa1
                  mul          s0, zero, a7
                  add          t2, a0, a4
                  mulhu        tp, s1, a6
                  andi         s5, t4, -765
                  fsgnjn.s     fs2, fs8, fs8
                  add          a1, sp, gp
                  auipc        s0, 779986
                  sra          s10, s9, t0
                  fadd.s       fs10, fa5, ft11, rne
                  auipc        a1, 406552
                  add          s1, s10, s8
                  sll          t4, gp, a4
                  fadd.s       fa1, fs2, fa2, rup
	fcvt.wu.s	s9, fa0, rne
                  fmax.s       fa2, ft5, fs1
                  andi         a5, s11, -1048
                  auipc        a2, 1000316
                  remu         a1, s6, t4
                  nop
                  mul          a7, a4, s7
                  fsgnjx.s     ft0, fa2, fs3
	fadd.s	ft4, ft8, fs5, rne
                  mulhu        zero, s2, s10
                  andi         t4, a5, 1205
                  slt          s7, s8, a7
                  addi         ra, zero, -57
                  fcvt.w.s     s6, fa0, rne
                  sub          t5, s1, t2
                  srli         t6, s6, 0
                  lui          gp, 329420
                  divu         t2, a0, a4
                  srl          s0, s10, a7
                  srl          t3, t6, s7
                  fsgnj.s      ft5, fs9, fs10
                  and          s0, t2, a3
                  lui          t4, 496876
	fcvt.s.wu	fa4, s7, rne
	fcvt.s.w	fa7, gp, rne
                  mul          t2, a1, a1
                  flt.s        s6, fa0, fs9
                  andi         gp, s1, 1446
                  fmv.w.x      fa4, s4
                  feq.s        tp, ft2, fs5
                  slti         s1, t5, -314
                  xori         t0, a1, 149
                  xori         s6, s1, 682
                  mulh         gp, a6, s7
                  addi         s11, zero, -1593
                  add          a7, s4, t5
                  lui          zero, 810966
                  srli         t1, a6, 31
                  nop
                  mulhu        a4, s1, t4
                  srl          a4, s0, s2
                  rem          a2, sp, s0
                  slt          s11, a2, t5
                  add          t0, a2, t1
                  div          t4, ra, a4
                  fcvt.s.w     ft11, t2, rdn
                  fclass.s     gp, ft6
                  feq.s        zero, fs8, ft10
                  fmv.w.x      ft6, s5
                  andi         a4, t5, 1251
                  or           t2, tp, sp
                  addi         gp, s4, 412
                  lui          s7, 687159
                  add          gp, a6, t0
	fcvt.w.s	gp, fs6, rne
                  div          gp, s3, s7
                  remu         s2, t6, s5
                  xor          gp, t3, s10
                  fclass.s     s1, fa3
                  fmin.s       fa2, fa3, ft9
                  mulhsu       tp, gp, t4
                  divu         t0, s10, s10
                  nop
                  fclass.s     s5, fs10
	fcvt.s.w	ft6, a7, rne
                  and          sp, zero, t0
                  slt          s7, a1, a5
                  and          sp, t0, s6
                  mul          t4, a6, a2
                  mulhsu       tp, s7, t3
                  slt          tp, a3, tp
	fadd.s	ft7, ft2, ft10, rne
                  divu         ra, a1, a7
                  nop
                  nop
                  and          s5, t4, t1
                  remu         s4, a4, a7
                  xor          s7, a6, s1
                  rem          s9, t5, t5
                  nop
                  srl          sp, s5, t0
                  fsub.s       fs7, ft4, fs7, rup
                  fmin.s       fa5, fa7, fs0
                  addi         a2, t0, -746
                  ori          a7, sp, -194
                  mulhsu       t4, t2, ra
                  or           ra, t0, zero
                  fsgnj.s      ft0, fa4, fa0
                  and          a1, t3, ra
                  and          sp, s0, t1
                  mul          t0, t0, t4
                  xor          s0, a6, a2
                  fsub.s       ft11, fa3, ft6, rup
                  lui          s11, 280833
                  nop
                  fsgnjx.s     fa6, fs4, fs4
                  fle.s        gp, fs4, ft7
                  remu         a7, t6, s9
                  rem          t4, a6, t4
                  fsgnjn.s     ft5, ft8, fa4
                  fmv.w.x      ft6, tp
                  ori          t3, a1, -1829
                  xori         tp, gp, 1732
                  remu         a1, a0, s2
                  fsgnj.s      fa5, fs1, fs10
                  divu         t5, s4, t1
                  slt          tp, a1, t0
                  feq.s        s7, fs11, fs11
	fcvt.s.w	ft9, t3, rne
                  sll          ra, s6, s11
                  sll          s0, gp, s5
                  auipc        s3, 839271
                  nop
                  mulhu        s4, a7, a2
                  and          s10, a7, s5
                  mul          s11, t6, zero
                  slli         s7, t1, 24
                  fsgnjx.s     ft4, ft9, ft1
                  sub          s2, a5, s3
                  fmin.s       fs4, ft1, fa1
                  lui          t3, 995129
                  sltiu        a4, ra, 840
                  fsub.s       fa5, fs11, fs9, rne
                  mul          s5, tp, a4
                  flt.s        s10, ft8, ft7
                  fmin.s       ft6, fa1, fs5
                  srai         a6, sp, 25
                  lui          s4, 146764
                  fsgnjx.s     ft6, fs2, fs0
                  fmv.w.x      fa7, a0
                  srai         s3, tp, 5
                  add          s5, a3, s2
                  flt.s        sp, fs10, fs0
                  div          a5, s5, s0
                  fadd.s       fs1, ft5, fs0, rne
                  andi         t1, s10, -1800
                  srl          sp, s2, a1
                  or           s0, zero, s2
                  mul          sp, s6, s4
                  and          t4, s1, ra
                  addi         t2, a6, 928
                  mulh         s6, t1, t5
                  remu         t2, a2, zero
                  fclass.s     s2, fa4
                  addi         s1, a3, -1871
                  mul          sp, t5, s10
                  mulh         t6, t1, ra
                  fcvt.s.wu    ft11, a5, rmm
                  add          s7, s3, s2
                  mulhu        a5, a5, s0
                  sll          tp, t2, t2
                  xor          a6, a0, zero
                  sltiu        s1, s1, -904
                  remu         s2, t2, tp
                  xori         s9, t0, -238
                  divu         s0, a1, t1
                  fcvt.wu.s    zero, fs0, rne
                  srai         s11, s3, 6
                  fsgnj.s      fs2, ft0, ft2
                  sll          s10, zero, t5
                  mulhu        s11, s7, s0
	fadd.s	ft5, fa6, fs0, rne
	fcvt.w.s	s3, ft8, rne
                  slti         s6, t6, 1793
	fcvt.s.wu	ft2, s1, rne
                  mulhu        a5, s9, t5
                  mulh         s9, gp, s9
	fcvt.w.s	tp, fs7, rne
                  mulhu        sp, s1, a7
                  srli         a6, s5, 5
                  sra          a4, a0, t1
                  sub          zero, t6, s10
                  feq.s        t2, fs7, fs7
                  nop
                  mulhsu       a1, a6, a3
                  mulh         s2, tp, ra
                  fclass.s     t4, ft8
                  lui          s7, 309818
                  fmax.s       fs10, ft8, fs10
                  fsgnjn.s     ft6, fa3, fa7
                  srli         t2, sp, 31
                  sltiu        a2, a4, 529
                  fmin.s       fa3, fs10, fs4
                  srai         t1, s6, 7
                  fsgnj.s      ft7, fs2, ft9
                  and          s10, t1, gp
                  lui          s1, 308935
                  feq.s        a2, ft4, fa2
                  slti         s7, s5, 695
                  fsgnjn.s     ft1, fs6, ft5
                  srli         zero, ra, 28
                  mulhsu       t5, a3, a5
                  or           tp, t4, s1
                  lui          tp, 544489
                  xori         s10, a5, 668
                  add          s5, s7, s9
                  sltu         a6, tp, s2
                  flt.s        a4, fs10, fs5
                  mulh         a7, a2, sp
                  fmin.s       fa5, ft3, ft10
                  srl          t3, s0, s5
                  rem          a1, s3, s8
                  lui          gp, 175543
                  xor          t4, tp, a0
                  divu         t5, s7, s8
	fcvt.wu.s	s9, fs11, rne
                  sub          s5, s10, gp
                  fcvt.s.w     ft9, t1, rmm
                  fcvt.wu.s    s2, fs11, rne
                  mulhu        s7, t2, a5
                  andi         s11, s1, 965
                  or           s6, gp, sp
                  and          s10, a1, t3
                  mul          gp, t2, s9
                  divu         t5, t5, s5
                  mulhu        a7, a7, s1
	fsub.s	ft1, fs2, ft2, rne
                  fmin.s       fs8, fs5, fa0
                  srl          ra, a7, t3
                  or           s3, s7, sp
                  srl          a5, s1, a5
                  slt          gp, t1, s7
                  fsgnjn.s     fs10, ft9, ft5
                  fsgnjn.s     ft3, fs10, fs6
                  sltu         s10, tp, t4
                  mulhu        s0, s0, gp
                  mul          s0, t1, s11
                  feq.s        t3, fa3, fs3
                  sltiu        s3, t1, 689
                  add          t5, a5, s10
                  srai         tp, s4, 10
                  and          s5, a7, t4
                  mulh         a6, s8, a6
                  fle.s        a1, fa4, fs0
                  mulhu        s5, s10, a0
                  fle.s        a2, fa3, fa6
                  srl          s5, sp, t1
                  addi         s1, t5, 1713
                  slt          t5, s2, a6
                  sltiu        t3, s4, -1661
                  fmax.s       fs0, fs6, ft5
                  mulh         s5, s2, s1
	fcvt.w.s	t0, fs4, rne
                  slti         a5, a2, 1085
                  fcvt.s.w     ft10, a0, rup
                  fmax.s       ft0, fs9, ft11
                  lui          a1, 697085
                  sltu         s7, ra, t0
                  sltiu        a7, ra, -158
                  ori          s6, s8, 1645
                  sltiu        tp, t1, -254
                  addi         s6, s3, 1210
                  and          a1, s7, t1
                  fmax.s       fs9, ft10, fa5
                  fsgnjn.s     ft8, fa6, fs0
                  mulhsu       gp, s4, s3
                  fsgnjx.s     fa7, fs10, fs3
                  or           tp, s0, s6
                  flt.s        a1, ft5, fs3
                  slti         a7, a1, 686
                  srl          sp, s10, t4
                  srli         ra, a6, 28
                  fclass.s     s5, fs9
                  fcvt.s.wu    ft1, s4, rtz
                  sltu         t5, a1, a2
                  fcvt.w.s     t3, fs11, rne
                  xori         t3, a7, 1844
                  fsgnjx.s     ft11, ft6, ft3
                  slt          a6, a2, s6
                  remu         s4, s5, a1
                  slt          sp, t5, a3
                  mulhsu       a1, zero, s7
                  xori         t3, a5, 248
                  addi         s9, s4, -800
                  fsgnjn.s     fs5, fs4, fs6
                  slt          t6, t4, s10
                  andi         a1, s5, 151
                  auipc        s11, 427510
                  fcvt.s.wu    ft1, t6, rne
                  sub          t4, s11, gp
                  fsgnj.s      fa4, ft11, fa3
                  xori         t2, t0, -359
                  feq.s        s0, ft7, fa0
                  sub          s0, a3, t1
                  fsgnj.s      fs3, fs2, fs8
                  mulh         a1, s3, s0
                  slt          s2, sp, a3
                  sltiu        s3, s4, -70
                  mulh         s5, s11, s4
                  lui          s6, 75332
                  fsub.s       ft7, ft9, ft3, rtz
                  add          gp, tp, s9
                  fmv.w.x      fs6, s1
                  add          zero, t3, s1
                  srli         t5, sp, 17
                  slli         ra, s7, 26
                  flt.s        a5, fs7, fs5
                  flt.s        gp, ft9, fa5
                  slt          t4, s5, a6
                  fsgnjx.s     ft5, fs0, ft10
                  nop
                  slti         s2, a5, -700
                  fmv.x.w      t3, fa1
	fsub.s	fa0, fs3, fs9, rne
                  fcvt.wu.s    sp, ft11, rtz
                  fcvt.s.w     fa3, sp, rtz
                  nop
                  fmin.s       ft0, ft1, ft2
                  sltiu        t3, a1, 1381
                  fle.s        a2, fs5, fs1
                  slt          t1, t6, t2
                  fsgnj.s      ft1, ft5, fa2
                  slti         a4, t4, -600
                  la x24, test_done
                  jalr x0, x24, 0
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
                  addi x13, x13, -4
                  sw  x10, (x13)
                  add x10, x13, zero
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
                  add x13, x10, zero
                  csrr x30, 0x300 # MSTATUS
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 31
                  bne x30, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x30, 0x341 # MEPC
                  csrr x30, 0x342 # MCAUSE
                  li x19, 0x3 # BREAKPOINT
                  beq x30, x19, ebreak_handler
                  li x19, 0x8 # ECALL_UMODE
                  beq x30, x19, ecall_handler
                  li x19, 0x9 # ECALL_SMODE
                  beq x30, x19, ecall_handler
                  li x19, 0xb # ECALL_MMODE
                  beq x30, x19, ecall_handler
                  li x19, 0x1
                  beq x30, x19, instr_fault_handler
                  li x19, 0x5
                  beq x30, x19, load_fault_handler
                  li x19, 0x7
                  beq x30, x19, store_fault_handler
                  li x19, 0xc
                  beq x30, x19, pt_fault_handler
                  li x19, 0xd
                  beq x30, x19, pt_fault_handler
                  li x19, 0xf
                  beq x30, x19, pt_fault_handler
                  li x19, 0x2 # ILLEGAL_INSTRUCTION
                  beq x30, x19, illegal_instr_handler
                  csrr x19, 0x343 # MTVAL
                  1: la x24, test_done
                  jalr x1, x24, 0

ecall_handler:    
                  la x30, _start
                  sw x0, 0(x30)
                  sw x1, 4(x30)
                  sw x2, 8(x30)
                  sw x3, 12(x30)
                  sw x4, 16(x30)
                  sw x5, 20(x30)
                  sw x6, 24(x30)
                  sw x7, 28(x30)
                  sw x8, 32(x30)
                  sw x9, 36(x30)
                  sw x10, 40(x30)
                  sw x11, 44(x30)
                  sw x12, 48(x30)
                  sw x13, 52(x30)
                  sw x14, 56(x30)
                  sw x15, 60(x30)
                  sw x16, 64(x30)
                  sw x17, 68(x30)
                  sw x18, 72(x30)
                  sw x19, 76(x30)
                  sw x20, 80(x30)
                  sw x21, 84(x30)
                  sw x22, 88(x30)
                  sw x23, 92(x30)
                  sw x24, 96(x30)
                  sw x25, 100(x30)
                  sw x26, 104(x30)
                  sw x27, 108(x30)
                  sw x28, 112(x30)
                  sw x29, 116(x30)
                  sw x30, 120(x30)
                  sw x31, 124(x30)
                  la x24, write_tohost
                  jalr x0, x24, 0

instr_fault_handler:
                  add x10, x13, zero
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
                  add x13, x10, zero
                  lw  x10, (x13)
                  addi x13, x13, 4
                  mret

load_fault_handler:
                  add x10, x13, zero
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
                  add x13, x10, zero
                  lw  x10, (x13)
                  addi x13, x13, 4
                  mret

store_fault_handler:
                  add x10, x13, zero
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
                  add x13, x10, zero
                  lw  x10, (x13)
                  addi x13, x13, 4
                  mret

ebreak_handler:   
                  csrr  x30, 0x341
                  addi  x30, x30, 4
                  csrw  0x341, x30
                  add x10, x13, zero
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
                  add x13, x10, zero
                  lw  x10, (x13)
                  addi x13, x13, 4
                  mret

illegal_instr_handler:
                  csrr  x30, 0x341
                  addi  x30, x30, 4
                  csrw  0x341, x30
                  add x10, x13, zero
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
                  add x13, x10, zero
                  lw  x10, (x13)
                  addi x13, x13, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x30, 0x300 # MSTATUS;
                  csrr  x30, 0x304 # MIE;
                  csrr  x30, 0x344 # MIP;
                  csrrc x30, 0x344, x30 # MIP;
                  add x10, x13, zero
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
                  add x13, x10, zero
                  lw  x10, (x13)
                  addi x13, x13, 4
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
