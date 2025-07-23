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
                  li x8, 0x40001120
                  csrw 0x301, x8
kernel_sp:        
                  la x30, kernel_stack_end

trap_vec_init:    
                  la x8, mtvec_handler
                  ori x8, x8, 1
                  csrw 0x305, x8 # MTVEC

mepc_setup:       
                  la x8, init
                  csrw 0x341, x8

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x8, 0x3800
                  csrw 0x300, x8 # MSTATUS
                  li x8, 0x0
                  csrw 0x304, x8 # MIE
                  mret
init:             
                  li x8, 2139095039
                  fmv.w.x f0, x8
                  li x8, 2139095041
                  fmv.w.x f1, x8
                  li x8, 7090633
                  fmv.w.x f2, x8
                  li x8, 7187232
                  fmv.w.x f3, x8
                  li x8, 0
                  fmv.w.x f4, x8
                  li x8, 5760371
                  fmv.w.x f5, x8
                  li x8, 2139095039
                  fmv.w.x f6, x8
                  li x8, 2147483648
                  fmv.w.x f7, x8
                  li x8, 4286578687
                  fmv.w.x f8, x8
                  li x8, 2148901163
                  fmv.w.x f9, x8
                  li x8, 923991343
                  fmv.w.x f10, x8
                  li x8, 2139095039
                  fmv.w.x f11, x8
                  li x8, 4286578688
                  fmv.w.x f12, x8
                  li x8, 2972781179
                  fmv.w.x f13, x8
                  li x8, 0
                  fmv.w.x f14, x8
                  li x8, 2143289344
                  fmv.w.x f15, x8
                  li x8, 2139095041
                  fmv.w.x f16, x8
                  li x8, 2143289344
                  fmv.w.x f17, x8
                  li x8, 0
                  fmv.w.x f18, x8
                  li x8, 2147483648
                  fmv.w.x f19, x8
                  li x8, 2139095041
                  fmv.w.x f20, x8
                  li x8, 2139095039
                  fmv.w.x f21, x8
                  li x8, 0
                  fmv.w.x f22, x8
                  li x8, 0
                  fmv.w.x f23, x8
                  li x8, 404318588
                  fmv.w.x f24, x8
                  li x8, 2829137036
                  fmv.w.x f25, x8
                  li x8, 1616270358
                  fmv.w.x f26, x8
                  li x8, 2139095039
                  fmv.w.x f27, x8
                  li x8, 3203313177
                  fmv.w.x f28, x8
                  li x8, 4286578687
                  fmv.w.x f29, x8
                  li x8, 2147483648
                  fmv.w.x f30, x8
                  li x8, 2580838840
                  fmv.w.x f31, x8
                  fsrmi 1
                  li x0, 0x80000000
                  li x1, 0x0
                  li x2, 0x6
                  li x3, 0x5
                  li x4, 0xf7572a26
                  li x5, 0xa
                  li x6, 0x57226ed0
                  li x8, 0xf186a27a
                  li x9, 0xf552ba97
                  li x10, 0xf9bdaf9e
                  li x11, 0x0
                  li x12, 0x80000000
                  li x13, 0x1
                  li x14, 0x9
                  li x15, 0xf38d606b
                  li x16, 0x0
                  li x17, 0xf11dd09c
                  li x18, 0x6bd04d37
                  li x19, 0x0
                  li x20, 0xe
                  li x21, 0x80000000
                  li x22, 0x80000000
                  li x23, 0x80000000
                  li x24, 0xfd04a5fb
                  li x25, 0x2
                  li x26, 0xc
                  li x27, 0xf5e5e6e3
                  li x28, 0x7
                  li x29, 0x1
                  li x31, 0xf920d0f1
                  la x7, user_stack_end
main:             fsgnjn.s     fs0, ft2, fs11
                  and          t0, t1, a4
                  srli         s6, s0, 21
                  fmv.x.w      a6, fs7
	fcvt.s.wu	ft1, a0, rne
                  mulh         s2, s6, t5
                  slt          t1, s2, s11
                  slli         ra, a5, 19
                  fmax.s       ft8, fs1, fa6
                  and          s11, tp, s8
                  auipc        s5, 43416
                  mul          a4, s7, s10
                  add          a0, a5, t2
                  srai         s10, s11, 14
                  remu         zero, a7, a6
                  mulhsu       zero, s10, t6
	fcvt.w.s	s2, fs8, rne
                  mulh         s3, s6, t4
                  sub          s3, t0, a4
                  andi         s10, s3, 1692
                  or           s0, tp, t2
                  nop
                  xor          s1, s9, s5
                  sltiu        s0, a1, -281
                  remu         gp, t1, a0
                  fcvt.s.wu    fs3, s7, rmm
                  fmin.s       ft10, fs5, fa2
                  or           a3, a2, s1
                  and          a4, s5, t1
                  or           a4, a4, s8
                  fmv.x.w      sp, fa4
                  srai         tp, t2, 8
                  fclass.s     s5, fa1
                  fmv.w.x      fa0, t1
                  add          a7, s1, t5
                  add          s3, t0, s0
                  mulhu        t3, ra, t2
                  sltu         s8, a1, gp
                  fsgnj.s      ft2, fs11, fs7
                  fmax.s       fs3, ft3, fs4
                  mulhsu       a1, s7, s0
                  sltu         a6, sp, t6
                  fcvt.wu.s    a1, fs8, rmm
                  fmax.s       fs11, fs8, fs9
                  flt.s        a4, fa6, ft0
                  sltiu        s1, t6, 724
	fsub.s	fa5, fa0, fa3, rne
                  sll          s3, t5, a0
                  feq.s        s9, ft8, fa4
                  add          t6, zero, s2
                  addi         a0, s0, -75
                  fcvt.w.s     t6, ft11, rup
                  mulhsu       s1, gp, s10
	fcvt.wu.s	s7, ft7, rne
                  feq.s        t1, fs3, fa5
                  sll          s5, s11, tp
	fcvt.wu.s	s2, fa4, rne
                  fsgnjn.s     ft6, fa2, fa3
                  fsub.s       fa6, fa5, ft2, rup
                  rem          s8, a3, s0
                  slli         t0, a4, 23
                  rem          t4, a4, t3
                  mulh         tp, s0, sp
                  ori          a1, a2, -1752
                  divu         s2, a4, a1
                  slt          a7, t0, zero
                  divu         a6, a4, s11
                  rem          s2, s5, s1
                  fclass.s     s10, fs11
                  auipc        s11, 176050
                  remu         tp, t1, t4
                  fmin.s       fs10, ft4, ft7
                  auipc        s3, 806674
                  sltiu        ra, t3, -370
                  addi         tp, t0, 1719
                  srl          t0, a3, a5
                  fadd.s       fa4, ft4, ft7, rdn
                  sra          t3, s7, s9
                  rem          a7, a5, s6
                  fcvt.wu.s    t6, fs1, rtz
                  srai         s10, t6, 8
                  nop
                  ori          a5, s1, -1920
                  fsgnj.s      fa0, ft5, fs6
	fcvt.s.w	ft7, a4, rne
                  ori          s10, s1, 258
                  ori          s5, a0, 1398
	fcvt.w.s	s7, fa5, rne
                  fle.s        t1, fs0, fa6
                  fmax.s       fa4, ft1, fs1
                  remu         s6, s9, s9
                  andi         a4, s6, -398
                  fsgnj.s      ft6, ft8, ft10
                  fsgnjn.s     ft7, ft8, ft6
                  slti         a4, tp, 1353
                  or           s1, zero, a7
                  xori         ra, a7, 1156
                  slli         s9, t6, 4
                  slti         s7, s5, -32
                  fle.s        s3, fs5, fs2
	fcvt.w.s	s11, fa3, rne
                  feq.s        t0, ft3, fa6
                  fmv.w.x      fs0, t3
                  srai         t4, t0, 2
                  and          a2, t0, s3
                  fmax.s       fs6, fs1, fs10
                  fadd.s       ft3, ft9, ft11, rne
	fcvt.wu.s	gp, fs5, rne
                  fcvt.wu.s    s10, ft5, rtz
                  lui          s5, 545305
                  lui          t3, 48190
                  ori          a6, s8, 1359
                  mulh         a1, t5, t6
                  fle.s        ra, fs8, fa6
                  divu         ra, s11, s10
                  fmv.w.x      fs9, s10
                  fmin.s       fs0, fa6, fs2
                  or           gp, s8, t6
                  fmv.x.w      s7, fs1
                  lui          t1, 417197
                  mulhu        a5, s11, s2
                  addi         a7, t3, -1006
                  fsgnj.s      fs8, ft3, ft6
                  fmv.w.x      ft1, a4
                  fcvt.s.w     fa7, s4, rtz
                  flt.s        gp, ft3, ft7
                  nop
                  lui          s8, 700917
                  ori          s2, tp, -1723
                  fsgnjx.s     fs1, fa4, fs9
                  div          s1, t6, s4
                  sll          s9, s9, gp
                  ori          s1, ra, 1244
                  sltiu        s5, t2, -1477
                  sra          s10, s4, s11
                  mulhu        t3, t2, gp
                  fmv.x.w      a0, ft2
                  xor          t4, s1, t1
                  fcvt.s.wu    fs10, s8, rdn
                  add          zero, a3, s10
                  fcvt.wu.s    t4, fa4, rtz
                  xori         s10, a6, 617
	fadd.s	fs5, fs8, ft9, rne
                  nop
                  srli         a0, t6, 21
                  flt.s        s2, fa6, fa6
                  add          gp, t0, ra
                  div          tp, s11, a2
                  srai         t3, s11, 20
                  fcvt.w.s     s0, fa6, rmm
                  slti         a2, s9, -557
                  nop
                  slli         s5, a1, 28
                  sll          s7, zero, t3
                  slti         s10, a1, 1520
                  lui          a5, 362924
                  fmin.s       fs5, ft2, ft7
                  fclass.s     a4, ft6
                  remu         a6, s10, a3
                  fmin.s       ft6, ft3, fa6
                  fsub.s       fs0, fs11, fs6, rne
                  fmv.x.w      a7, ft0
                  rem          tp, a6, ra
                  slti         s1, s7, 995
                  feq.s        s7, fs9, ft10
                  fle.s        s10, fs10, fs5
                  ori          a2, s9, -930
                  div          t1, s1, a6
                  fsub.s       ft5, ft11, fa0, rne
                  fmv.w.x      fs4, a0
                  srli         t0, s11, 13
                  fmv.x.w      a4, ft3
                  sub          gp, s6, ra
                  sra          s0, t6, a3
                  ori          s10, t0, 105
                  fsgnjn.s     ft2, fa7, fa4
                  fsgnj.s      fs10, fs1, fs3
                  sll          a7, s9, a0
                  srli         a3, t4, 13
                  addi         s1, t6, -1360
                  fmax.s       fs9, fa5, fs4
                  fcvt.w.s     s5, fa7, rdn
                  fle.s        s1, fa1, ft9
                  sll          s8, t0, t5
                  fsgnjn.s     fs10, fa4, ft2
                  andi         zero, s6, 138
                  fmv.w.x      ft1, s5
                  sltiu        a1, tp, 1910
                  fmv.x.w      s3, fs4
                  addi         zero, s3, -1730
                  srl          a3, s9, a6
                  mul          sp, a3, tp
                  flt.s        s8, fa4, fs7
                  and          t3, a5, t3
	fcvt.wu.s	a5, fs10, rne
                  srai         s11, t1, 5
                  srli         a2, a3, 16
                  flt.s        sp, fa3, fs2
	fcvt.s.w	ft4, t5, rne
                  fclass.s     a2, fa7
                  addi         t3, s9, 1358
                  mulh         s9, a7, sp
                  and          s1, t3, zero
                  fsgnj.s      fs8, fa7, fa6
                  fadd.s       fs11, ft9, fs7, rmm
                  fclass.s     a1, fs2
                  ori          s1, s5, 2018
                  slt          s10, s6, t6
                  mulhsu       tp, a2, a4
                  feq.s        t4, ft9, fs10
                  nop
                  fcvt.wu.s    s2, fa0, rtz
                  sltu         t4, t0, s1
                  srai         a1, a2, 16
                  srli         zero, ra, 15
                  lui          s10, 487600
                  fmin.s       fs1, fs7, ft9
                  sltu         a0, s5, tp
                  fsgnjn.s     fs9, fs6, fa1
                  xor          sp, s8, gp
	fcvt.w.s	tp, ft1, rne
                  addi         s11, a2, 1888
                  nop
                  ori          a1, a3, -1940
                  fsgnj.s      ft2, fs2, ft1
                  fclass.s     a7, ft7
                  srl          s0, s3, s9
                  auipc        t1, 766260
                  slli         t0, s7, 25
                  fmv.w.x      ft2, s6
                  fmin.s       fa2, fa7, fs8
                  nop
                  flt.s        s10, ft0, fs1
                  rem          s1, a4, a7
                  xori         s9, a5, 154
                  auipc        t1, 837854
                  rem          tp, a3, t4
	fadd.s	ft9, fs1, ft10, rne
                  fsub.s       ft10, fs1, fs0, rup
                  srl          sp, s2, t1
                  sub          tp, t2, t5
                  add          s8, gp, s11
	fcvt.w.s	s1, ft1, rne
                  sub          s7, a7, gp
                  slt          s6, a6, gp
                  flt.s        s9, ft2, fs11
                  fsgnj.s      fs3, fa6, fs11
                  mulhsu       a5, zero, t5
                  nop
                  fmax.s       fs6, ft3, fs1
                  lui          s1, 1006348
                  mul          a3, s10, s11
                  lui          t4, 230026
                  srli         s6, t3, 7
                  slt          s5, a3, a2
                  fsub.s       fs3, ft11, ft8, rne
                  mulh         s7, t0, a2
                  fcvt.wu.s    s2, fa5, rtz
                  divu         s1, t5, t1
                  mulh         ra, s9, s6
                  divu         a2, t6, t1
                  fclass.s     ra, ft11
                  flt.s        a6, fa1, fs6
                  fmax.s       fa0, fs10, fs11
                  fcvt.w.s     a0, fa6, rup
                  sltiu        t1, t6, -428
                  sltu         s11, a6, a4
                  addi         tp, a7, -1081
                  slti         a4, a0, -1858
                  rem          s2, s4, t2
                  or           s0, t2, t6
                  xori         s0, s1, 1265
                  srl          t6, a1, a6
                  slli         s1, a4, 7
                  slli         t0, s0, 18
                  remu         s8, a2, gp
                  divu         a3, t0, ra
                  remu         s10, a7, t0
                  and          t1, a4, a4
                  srl          sp, s8, sp
                  sll          a5, s3, t6
                  srli         a5, a4, 8
                  fsgnjx.s     ft11, fa0, ft8
                  auipc        zero, 69105
                  slli         s11, s3, 29
                  add          s9, s9, s11
                  fle.s        zero, ft2, ft7
                  mulhsu       s9, a5, t3
                  srl          s7, s4, s7
                  auipc        s7, 430812
                  fcvt.w.s     s2, ft11, rtz
                  sll          t3, a5, t2
                  sltu         a4, t0, a1
                  nop
                  sltiu        s6, s5, 185
                  lui          s9, 105890
                  srai         s1, a5, 29
                  auipc        t3, 555543
                  mulhu        s2, t2, s9
                  fmin.s       fa6, ft11, fa1
                  and          s11, s5, t0
                  fmv.x.w      t0, ft11
                  sltiu        t4, s0, -267
                  srli         a4, t2, 10
                  fcvt.w.s     a2, fa5, rup
                  sll          s9, s4, a3
                  remu         a4, a1, a5
                  remu         s0, a5, a6
                  slti         a0, t5, 597
                  ori          s5, a7, 1262
                  sra          sp, s6, s0
                  slt          s0, s10, t6
                  fsgnjn.s     fs11, fs6, ft5
                  mulhsu       a1, a1, t2
                  xor          s5, a3, s11
                  sub          s6, t3, a3
                  div          a4, s7, tp
                  fmv.w.x      fs7, t4
                  and          s3, sp, s0
                  srai         s7, s8, 10
                  or           t0, t5, a7
                  slt          a1, s9, s0
                  srli         sp, a0, 20
	fcvt.w.s	zero, fs4, rne
                  auipc        s9, 693097
                  rem          s10, s8, s0
                  mulhsu       tp, s9, s4
	fcvt.s.w	fs8, a1, rne
	fcvt.wu.s	t6, ft4, rne
	fadd.s	fa4, fs3, fa6, rne
                  fclass.s     s5, fs9
                  xori         a3, t0, -2032
	fcvt.s.w	fs1, a1, rne
                  remu         a5, s11, a2
                  lui          s5, 549308
                  fadd.s       fa4, fs9, ft1, rdn
                  auipc        s10, 340159
                  lui          sp, 246421
                  fcvt.w.s     a3, fs11, rne
                  feq.s        a1, fs2, ft3
                  fsgnj.s      fs10, ft1, ft5
                  fmv.w.x      ft4, a2
                  sub          t6, a2, t3
                  mulhu        s1, s1, t2
                  fcvt.wu.s    s5, fs0, rup
                  div          gp, s11, s1
                  andi         t0, a1, -1400
                  sll          t0, tp, s5
                  fcvt.s.w     fa2, t0, rdn
                  fadd.s       ft8, ft9, fs7, rne
                  divu         s1, t0, s4
                  fcvt.wu.s    s10, fs1, rne
                  mulhsu       a7, s8, t1
                  fclass.s     s9, ft1
                  add          s7, a1, t1
                  rem          t0, t2, a5
                  fcvt.s.wu    fs2, s9, rtz
                  sll          a4, s5, t6
                  srl          sp, a1, t0
                  flt.s        t3, ft5, ft1
                  xori         a6, s5, -1721
	fcvt.s.wu	fs11, s8, rne
                  rem          a2, t2, s8
                  fclass.s     t6, ft6
                  flt.s        t3, ft0, fs4
                  addi         a4, s4, 1031
                  remu         a6, t3, ra
                  srli         t4, a1, 19
                  fmin.s       ft11, ft3, fs10
                  srli         a3, a2, 4
                  sltu         a2, t0, t5
                  mulhsu       tp, t5, tp
                  remu         s5, t2, sp
                  mulhu        s2, t0, t5
                  sltiu        s0, s1, -1590
	fsub.s	fs9, ft7, ft7, rne
                  and          t4, t2, a1
                  sll          a0, t1, a2
                  sltu         s2, t0, s10
                  sltiu        s7, a4, -499
                  remu         a3, zero, a7
                  div          s0, s11, t4
                  fcvt.w.s     sp, ft5, rmm
                  fsgnj.s      fa4, ft8, ft0
                  xor          t0, s10, s10
                  xor          t6, ra, a5
                  andi         a3, s9, -1108
                  rem          a1, s2, s2
                  fmin.s       fa6, ft5, ft2
                  sra          s3, a0, t0
                  xor          a4, s8, s4
                  fclass.s     a0, fa4
	fadd.s	ft4, fs11, ft6, rne
                  flt.s        sp, fa2, fs9
	fcvt.s.w	ft3, t4, rne
                  mulhsu       a7, s7, a7
                  mulhu        a1, s9, s6
                  srli         gp, s5, 14
                  srli         s5, s1, 22
                  fmin.s       fs9, ft6, fs11
                  srai         a2, t2, 3
                  sltiu        sp, tp, 2033
                  divu         t1, s6, t2
                  remu         s5, a5, gp
	fadd.s	fa0, ft6, fs2, rne
                  ori          ra, a0, -442
                  auipc        s8, 703464
                  srl          zero, a2, s11
                  auipc        gp, 59079
                  div          t0, a7, s9
                  mulhu        a6, ra, s0
                  or           s8, s4, a3
                  fsub.s       fs3, ft0, ft2, rmm
                  div          zero, a3, t5
                  auipc        t6, 847001
                  srl          t4, t4, t1
                  div          t0, s5, zero
                  lui          a6, 773192
                  fmin.s       fs8, fa5, fa7
                  feq.s        s10, ft3, fs3
                  div          a0, s2, s0
                  addi         a7, t0, -114
                  mul          t0, gp, t3
                  slli         s3, s5, 16
                  fsgnj.s      fs2, ft6, fa1
                  addi         a6, a2, 744
                  divu         a7, t2, t1
                  fsgnjn.s     ft10, fa5, fs8
                  divu         a7, s7, s10
                  fclass.s     s7, ft1
                  mulh         s6, a6, t3
                  sltiu        t4, s2, -1995
                  fsgnj.s      fa4, fs0, fs9
                  div          sp, a7, t6
                  feq.s        a3, ft2, ft11
                  slli         s8, a2, 31
                  fsgnjn.s     ft1, fa6, ft7
                  divu         t0, s6, a5
                  fsub.s       fs8, fs2, ft2, rne
                  remu         t1, s7, t2
                  slt          s7, t6, gp
                  lui          t4, 135946
                  fmv.w.x      ft10, t5
                  sll          s7, ra, t2
                  andi         sp, a7, 1158
                  srai         a5, s5, 8
                  fsgnjn.s     fs9, fa4, fa0
                  ori          s7, tp, 1530
                  fsgnjx.s     fa1, fs1, fs7
                  fadd.s       fs6, fa6, ft7, rtz
                  fsgnj.s      fs1, ft5, fs9
                  fmin.s       ft10, ft3, ft5
                  fsgnjn.s     fs4, fa5, ft3
                  ori          t6, a5, -817
                  mulh         gp, a7, s7
                  flt.s        a2, ft2, ft8
                  fmv.x.w      a7, ft6
                  mulh         s8, s9, s0
                  fmin.s       fs10, fs9, ft4
                  fmax.s       fs2, fs9, fa1
                  fmin.s       fa6, ft10, ft6
                  fsgnjn.s     ft1, fa2, fs8
                  mulh         t4, t4, a3
                  add          t0, s6, a2
                  xori         a7, s0, -1443
                  mulhsu       a0, t2, a3
	fcvt.s.wu	fs3, s6, rne
                  srai         gp, sp, 0
                  fcvt.wu.s    t1, fs10, rdn
                  rem          s10, s9, t4
                  flt.s        gp, fa5, fs4
                  srl          ra, t5, a6
                  slti         a5, a1, -1025
                  nop
                  fle.s        s9, fs11, ft9
                  fcvt.s.wu    ft0, a3, rtz
                  andi         t6, a4, -37
                  fmin.s       fa2, fs4, fa6
                  addi         t0, zero, -1620
                  flt.s        a1, ft3, fs6
                  rem          s8, ra, a5
                  sltu         t4, a7, a1
                  xori         t4, s11, 850
                  feq.s        t6, fa7, fa0
                  sll          a0, t3, s1
                  fsgnj.s      ft6, fs8, ft8
                  fmax.s       ft10, fs6, ft0
                  nop
                  sra          a2, s1, a0
                  sll          s2, s6, a4
                  fmax.s       ft10, ft11, ft6
                  ori          zero, s6, 1281
                  fsgnjx.s     fa5, ft7, fs7
                  flt.s        s8, ft0, fa5
                  mulhu        a4, s5, a0
                  fcvt.s.wu    ft1, s1, rdn
                  ori          s5, s3, 100
                  remu         s5, a4, a1
                  auipc        tp, 127147
                  addi         a7, s3, 1807
                  xori         s10, t4, -664
                  slt          a4, s10, s2
                  flt.s        t4, ft8, fs5
                  and          a3, s3, s1
                  flt.s        a3, ft3, ft11
                  slt          tp, a3, sp
                  lui          s10, 449469
                  mulhu        gp, a1, t0
                  mul          a1, t3, s2
                  fsgnjn.s     ft1, fa3, fa6
                  srai         sp, a4, 31
                  sra          tp, a2, s0
                  fsgnjn.s     ft10, ft1, ft8
                  srl          s3, t6, s8
                  sltu         t1, s10, tp
                  fsgnjn.s     ft2, ft4, ft4
                  div          a6, s4, gp
                  slli         a7, a0, 11
                  addi         a6, s6, 158
                  auipc        ra, 894483
                  flt.s        ra, ft8, fs10
	fcvt.s.wu	fa2, t5, rne
                  ori          t3, a3, 488
                  fsgnj.s      fs11, fs3, ft7
                  fsub.s       fa0, fs9, fs11, rup
	fadd.s	fs0, fs6, fa0, rne
                  xor          tp, s6, sp
                  fsgnj.s      ft10, ft5, ft6
                  fmin.s       fs4, fs0, ft10
                  divu         s3, s7, t1
	fcvt.s.wu	ft0, ra, rne
                  srai         a6, t3, 7
                  srai         s8, a4, 29
                  flt.s        a7, fa5, fs0
                  ori          s7, s1, 299
                  rem          t0, t3, t3
                  mulh         t6, s6, a5
                  fcvt.w.s     sp, fa5, rtz
                  sltiu        s10, s5, -2013
	fsub.s	fs1, fa7, fs6, rne
                  xor          sp, t0, s8
                  fcvt.wu.s    s3, fa7, rdn
                  fle.s        s7, fs2, fa0
                  fcvt.s.w     ft9, a5, rup
                  xor          s10, a1, t2
                  flt.s        t3, fa3, ft11
                  sltu         t1, gp, t2
                  andi         s8, a4, 1599
                  mulhsu       s2, gp, s11
                  mulhu        ra, s0, a3
                  auipc        a0, 495175
                  add          s9, s1, a4
                  srli         t1, ra, 24
                  fcvt.wu.s    gp, fa6, rtz
                  srl          a4, s9, s2
                  nop
                  mulhu        tp, a7, s5
                  fsgnjn.s     fs0, fa7, fs9
                  mulhsu       s6, s7, s0
                  slt          t3, a2, t1
                  andi         s5, a3, 1066
                  auipc        s9, 421132
                  auipc        s9, 672483
                  remu         a4, a4, s4
                  mulh         t0, s5, t5
                  fadd.s       fs10, fs8, fs8, rne
                  srli         s2, sp, 18
                  slti         a4, t2, -604
                  xori         a5, t5, -885
                  xor          t0, s10, t0
	fcvt.s.w	fs11, ra, rne
                  lui          s6, 170971
                  and          t3, t6, t1
                  mulhsu       t4, a3, t1
                  sub          a7, s9, zero
                  mulhu        a6, a2, a6
                  fclass.s     a6, fs5
                  remu         t0, a5, t2
                  mulhsu       s10, s4, a2
                  srai         ra, s3, 24
                  rem          t4, s2, s7
                  addi         sp, a0, 676
                  xori         a0, t3, 11
                  fmin.s       ft0, fs1, fa5
                  divu         zero, s8, s9
                  auipc        a1, 65825
                  ori          t3, a1, -679
                  div          t0, s1, s6
                  fle.s        s9, ft10, fs7
                  sll          s6, s2, s0
                  remu         a0, s0, s4
                  andi         a1, a4, -712
                  lui          zero, 121834
                  and          t4, t6, s8
                  nop
                  div          a4, a5, t5
                  slli         a6, s6, 18
                  nop
                  fsgnjn.s     fs2, ft0, fa2
                  ori          a4, s2, 1444
                  mulh         s0, a3, t4
                  fmin.s       fa5, fa1, fs7
                  fclass.s     t3, fs5
                  mul          gp, t5, t6
                  sra          a2, ra, t5
                  xor          t4, gp, s0
                  lui          s7, 306955
                  sll          t6, s10, s1
                  slt          t3, s10, a3
                  mul          t3, s7, t2
                  fle.s        ra, fs10, ft11
                  or           t3, sp, s7
                  sltiu        s2, t1, -1474
                  andi         a2, tp, -98
                  slli         t1, s7, 13
                  fcvt.s.wu    fs10, t5, rup
                  fsgnjn.s     fa4, ft9, fa1
                  slt          a2, gp, a6
                  fcvt.s.w     fa3, s2, rup
                  fadd.s       ft5, ft6, fs2, rup
                  andi         tp, a1, -1304
	fsub.s	ft2, fa4, fs10, rne
                  sltiu        a7, s11, -186
                  and          s8, a3, a5
                  nop
	fcvt.s.w	ft2, s1, rne
                  add          s9, s4, s9
                  srai         s3, s5, 21
                  sub          s11, s5, a1
                  srli         s7, sp, 30
                  addi         a4, a5, 1056
                  fclass.s     a7, fs11
                  fle.s        sp, fa3, fs9
                  fsgnjx.s     ft7, fa0, ft6
                  fle.s        t4, fs11, fs9
                  div          t1, t1, t0
                  add          s8, ra, a3
                  xor          a1, s4, s0
                  xori         s1, t2, -487
                  fsgnjn.s     fs6, ft4, fa5
	fcvt.s.w	fs3, a5, rne
                  srl          a4, t2, gp
                  nop
                  feq.s        a0, fs8, ft7
                  srai         a5, tp, 16
                  fle.s        gp, fs5, fa0
                  fcvt.s.w     fs6, t3, rne
                  mulhu        s10, s0, a4
	fadd.s	ft3, fs10, ft11, rne
                  div          t4, a0, s0
	fcvt.s.wu	fa7, s11, rne
                  fsgnjx.s     fs6, fa6, ft3
                  mul          a0, a3, a4
                  sll          t0, t0, a1
                  feq.s        a1, fa5, ft2
                  srai         t3, s10, 22
                  slli         s0, s8, 30
                  sll          s8, a3, a6
                  srli         gp, s6, 4
                  srli         s7, s2, 29
                  fcvt.s.wu    fs0, a4, rne
                  slt          sp, s2, t5
                  addi         s0, sp, 378
                  nop
                  fsub.s       fs6, fs11, ft4, rne
                  fadd.s       fa3, fa6, fa6, rne
                  sltiu        a2, gp, -1351
                  sll          s1, gp, t1
	fcvt.wu.s	s6, ft10, rne
                  fmv.x.w      ra, ft5
                  nop
                  sub          t0, t3, gp
                  fsgnjx.s     ft1, fs3, fs0
                  or           s8, tp, a7
                  addi         tp, a3, -321
                  mulhu        a1, gp, t3
                  slti         a1, s4, 1862
                  add          a5, s8, a3
	fadd.s	fs8, ft11, fs1, rne
                  fmax.s       fs6, fs4, fa0
                  ori          s7, a7, 103
                  sll          t0, s6, s10
                  divu         s10, s1, a6
                  mulhu        zero, gp, a6
                  lui          s7, 1025892
                  fmin.s       fs1, fs1, fs1
                  mulh         s11, t5, s7
                  fclass.s     t6, ft10
                  slt          s6, s10, s6
                  fclass.s     t4, ft5
                  auipc        s6, 260142
                  fsgnjx.s     fs9, fs0, ft9
                  fmv.w.x      fs7, s11
	fadd.s	ft0, fs0, ft7, rne
                  and          a3, t5, ra
                  divu         s6, s4, s11
                  slti         a5, a1, -264
                  fmv.w.x      fs3, tp
                  fmv.w.x      fa3, s8
                  fadd.s       fs6, fs10, fa6, rup
                  fmv.x.w      zero, fs4
                  div          a5, s0, gp
                  and          t4, a6, s9
                  add          a7, s3, s6
                  fsgnjn.s     fs8, fs2, ft3
                  slti         t0, s0, 15
                  mulhsu       t6, s3, s1
                  sltu         t1, s2, s6
                  ori          t3, t5, 1531
                  feq.s        a0, fs6, ft0
                  andi         t4, s8, -1516
	fsub.s	ft7, ft7, ft11, rne
                  fmax.s       fs0, fs10, fs3
                  mulhsu       s11, s5, s11
                  ori          s1, a4, 1053
                  flt.s        s2, ft9, ft10
                  and          a6, t5, a6
                  mul          zero, a7, t3
                  addi         tp, a7, 422
                  srai         a1, a5, 9
                  fmv.x.w      t3, ft8
                  sltiu        tp, s5, 349
                  fsgnj.s      fa1, ft3, fs9
                  feq.s        a6, fs10, ft2
	fadd.s	ft0, fs2, fs7, rne
                  slti         t4, s0, 1099
                  fle.s        a2, fa3, fa4
                  lui          s11, 637630
	fsub.s	fs8, ft0, fs8, rne
                  fcvt.w.s     s0, fa4, rup
                  or           zero, a7, s5
                  fsgnjx.s     ft11, fs1, fs0
                  auipc        gp, 228873
                  fle.s        s6, fs1, fs2
                  slti         s0, a6, -941
                  andi         s3, s9, -1392
	fcvt.s.wu	ft1, s11, rne
                  sll          t1, t5, s2
                  sltu         a1, t2, s3
                  fsub.s       ft6, fa6, fs9, rdn
                  slt          s2, s8, a2
                  ori          t3, tp, -889
                  fsgnjx.s     ft7, fa5, fs9
                  mulhu        t1, t2, s5
	fsub.s	fa2, ft5, ft4, rne
                  xor          s5, sp, gp
                  or           a6, a0, gp
                  auipc        t6, 17493
                  or           sp, sp, t5
                  slti         sp, t5, 1307
                  sltu         t6, t1, s10
                  fcvt.w.s     sp, fa0, rdn
                  fclass.s     a0, fs3
                  add          gp, ra, a6
                  sltu         t3, zero, t4
                  srli         s9, s7, 14
	fsub.s	fs1, ft4, ft3, rne
                  rem          s1, s8, a1
                  fmin.s       ft1, ft4, fa6
                  fmv.x.w      s2, ft2
                  sltiu        s8, s2, -1410
                  nop
                  mulh         tp, t4, s1
                  fclass.s     a1, fs9
                  or           t0, a2, s2
                  and          a2, a1, t5
                  fsgnjx.s     fa6, ft5, ft6
                  auipc        s5, 815108
                  mulh         t1, t0, a2
                  fcvt.w.s     s2, ft5, rne
                  fsgnjx.s     fs4, fa1, fa7
                  rem          t3, tp, t3
                  addi         t0, a1, 115
                  mul          a1, s5, s5
                  div          ra, s5, sp
                  xori         a3, s0, -107
                  lui          gp, 484152
                  fcvt.wu.s    t4, fs1, rmm
                  fsgnj.s      fs3, fs5, fs0
                  add          a6, s4, s10
                  mul          s7, sp, s9
                  add          s8, a1, a5
                  feq.s        s3, fs2, ft0
                  flt.s        s7, fa4, fa5
                  add          s1, t0, s10
                  mulhu        t6, s9, zero
                  remu         s6, s10, t5
                  fmin.s       fs2, ft2, ft9
                  fmv.w.x      fa7, s3
                  ori          ra, zero, -86
                  or           ra, t4, s6
                  xor          a5, a2, tp
                  lui          a4, 979646
                  fclass.s     s0, fa6
                  ori          a6, gp, -72
                  mulhsu       t4, s2, t3
                  fsgnj.s      fs11, fa1, fa0
                  fclass.s     a0, fs10
                  auipc        s8, 903752
                  sub          t6, t5, t3
                  srli         s8, s2, 6
                  fsgnjx.s     fa7, fa6, ft5
                  fsgnjx.s     ft8, fa3, fa7
                  feq.s        s6, ft7, fs3
                  slt          t6, a4, t1
                  sub          gp, s11, a1
                  fmv.x.w      zero, fa0
                  and          a1, sp, gp
                  divu         a0, s7, zero
                  feq.s        a0, fs11, ft2
                  xor          zero, s4, a4
                  sra          tp, s8, s10
                  slt          gp, s0, a5
                  fclass.s     s3, ft0
                  fsgnjx.s     ft11, ft2, fs2
                  sub          t4, s0, s8
                  div          sp, s4, s0
                  fmax.s       fs0, ft1, fs1
                  mulhsu       zero, a3, a3
                  srli         zero, t6, 23
                  slt          t0, s11, s6
                  fcvt.wu.s    s6, fa5, rne
                  div          a4, s4, s4
                  sll          s6, gp, a6
                  div          s0, a5, s11
                  sub          s6, a5, a5
                  slti         gp, a2, 554
                  mulhu        gp, t5, ra
                  ori          tp, a4, 1436
                  slli         t1, s8, 24
	fadd.s	ft5, ft11, fs4, rne
	fadd.s	fs7, ft7, fa7, rne
                  add          s1, a6, t6
                  nop
	fcvt.wu.s	s10, fa4, rne
                  andi         a2, s6, 894
                  rem          a2, s4, a4
                  or           s2, s6, t1
                  fmv.x.w      s9, ft8
                  slti         s2, t6, 736
                  slli         a0, sp, 18
                  fsgnj.s      fs6, fs6, fs3
                  slt          a2, s2, a0
                  fmv.x.w      a5, fs11
                  flt.s        s1, fs4, ft8
                  fsgnj.s      fs10, fs4, fs4
                  mulhu        s11, gp, a2
                  ori          s10, sp, -732
                  fmv.w.x      fa5, s1
	fcvt.wu.s	tp, fs6, rne
                  lui          s6, 886107
                  feq.s        a1, fa5, fs9
                  lui          s10, 788644
                  div          a7, t4, t0
                  fclass.s     t6, ft7
                  nop
                  sltiu        s3, s5, 1873
                  sra          t0, t3, a7
                  auipc        s7, 458126
	fsub.s	fs9, ft4, ft10, rne
                  srai         gp, t1, 24
	fcvt.w.s	s5, fs9, rne
	fcvt.w.s	a6, fa5, rne
                  srai         a6, a2, 7
                  fsgnj.s      fs0, ft5, ft7
                  sll          s6, sp, a1
                  nop
                  fsgnjn.s     ft8, ft9, ft10
                  fmax.s       fa7, fs11, fa7
                  fmv.w.x      fs0, zero
                  sub          s10, s0, t1
                  flt.s        ra, ft9, fs4
                  slt          s11, a0, s9
                  mulhu        ra, s10, a3
                  fmv.x.w      tp, ft5
                  sub          t1, a5, s8
                  slli         t0, a2, 23
	fcvt.s.wu	fa1, a7, rne
                  flt.s        s0, ft2, fs6
                  slti         s9, a0, -1196
                  flt.s        t4, fs6, fa4
	fadd.s	fs8, ft2, fs10, rne
                  rem          s10, s5, a5
                  and          s5, s1, s0
                  srai         tp, t4, 27
                  srai         a0, s11, 7
                  andi         tp, t4, 1656
                  div          t0, s2, s1
                  fsgnjx.s     ft5, fa2, fs4
                  feq.s        s6, fa2, fa5
                  rem          s10, s4, s7
                  fmin.s       fa0, ft2, ft5
                  divu         a6, s9, a0
                  fle.s        t0, fa1, ft5
                  mulhsu       s9, a1, a1
                  slli         a3, t1, 15
                  sltiu        a5, t0, 1413
                  addi         sp, a7, -1230
                  remu         s5, t2, s9
                  fcvt.s.wu    fs6, zero, rdn
                  fsgnjn.s     ft11, fa0, ft9
                  fmin.s       fs11, ft10, ft5
	fcvt.w.s	s11, fa7, rne
                  fsub.s       ft5, ft9, ft11, rtz
                  fcvt.wu.s    s5, ft8, rne
                  slli         a1, s6, 31
                  nop
                  rem          t0, a5, a6
                  andi         s5, a0, 706
	fcvt.w.s	gp, fs5, rne
                  xori         a5, a7, 787
                  sub          t6, a7, s0
                  sltiu        ra, s0, -951
                  mulhu        sp, a6, s7
                  or           s8, t6, s7
                  mulhu        a5, a3, t6
                  feq.s        a0, fa5, ft3
	fadd.s	fa2, ft6, ft9, rne
                  fmv.w.x      fa4, a4
                  ori          s3, s4, 289
                  ori          t3, s2, 1924
                  add          s2, sp, s3
                  fsgnjn.s     fs10, ft7, fs9
                  and          a1, t5, t6
                  fmax.s       fs2, ft6, ft4
                  slt          a7, a7, s2
                  srai         a2, ra, 16
                  rem          s0, sp, t4
                  sltu         gp, zero, t3
                  fcvt.wu.s    t6, fs4, rtz
                  rem          s2, a0, t6
                  sltu         t4, s1, a4
                  fsub.s       fs4, fs8, fs10, rne
                  fsgnjn.s     fs3, fs4, fs4
                  nop
                  fle.s        s3, fs2, fs9
                  sll          ra, t2, s8
                  and          a1, s1, a0
                  srl          a1, t2, s2
                  fmv.w.x      fs8, s11
                  div          a2, t6, t6
                  lui          s7, 969375
                  srl          sp, zero, s5
                  srli         gp, a0, 25
                  sra          t1, a7, s11
                  sra          s8, t1, a2
                  fle.s        a0, ft8, fs8
                  addi         s3, t5, 1743
                  fmax.s       fs8, fa7, fs3
                  mulhsu       sp, zero, s11
                  andi         t0, a2, 1341
                  or           ra, s9, s1
                  fcvt.wu.s    t0, fs4, rdn
                  fle.s        s9, fa6, fa0
                  sub          t0, t3, s1
                  mulhu        sp, s8, t5
                  andi         s1, a2, 1276
                  fsgnjx.s     ft5, ft1, fs6
                  or           a3, s4, s9
                  fmin.s       fs11, ft1, fs7
                  xor          sp, a2, ra
                  rem          a2, a3, a5
                  sll          sp, s7, s8
                  mul          zero, t4, s1
                  slt          s11, s5, t4
                  ori          tp, t0, 406
                  div          t3, t5, t3
                  div          a2, s4, t0
                  fmv.x.w      a2, ft8
                  xor          a2, gp, s0
                  fmin.s       ft2, fa7, fs2
                  fsgnjx.s     fa1, fs6, ft2
                  xor          zero, a2, a4
                  slt          s2, tp, s6
                  add          t6, a1, t2
                  mulh         a1, a1, zero
                  andi         a7, a7, -1975
                  fcvt.wu.s    s8, fa5, rup
                  fmax.s       ft9, ft6, fa4
                  slt          s10, a4, t6
                  add          a7, gp, t3
                  mulhsu       t1, a5, t1
                  fsgnjx.s     fs2, fs0, ft1
                  fle.s        s9, fa6, fs11
                  fmin.s       fs11, ft3, fs2
                  nop
                  mulh         zero, s11, s7
                  mulhsu       a3, sp, s2
                  fsgnj.s      fs6, fs4, fs0
	fadd.s	fa3, ft7, fa2, rne
                  add          a4, a7, a3
                  sll          s1, ra, s11
                  fsgnj.s      fa6, fs3, fa1
                  mulhu        ra, a7, s10
                  fclass.s     s10, ft0
                  auipc        s5, 964539
                  addi         a0, a1, -838
                  sltu         gp, a0, s7
                  sra          a4, s3, a1
                  auipc        a0, 922485
                  add          a5, t6, tp
                  mulh         a5, t6, a6
                  slt          a7, t4, a1
                  mul          s7, s10, zero
                  fmax.s       fs9, ft1, fs9
                  fmax.s       ft6, fs5, fs3
                  mulhu        s10, a5, a5
                  and          t0, s9, sp
                  fsgnj.s      fs11, ft0, fa5
                  rem          s11, t3, t5
                  fle.s        s0, fa1, ft11
                  slti         s6, ra, -1515
                  slli         zero, a6, 8
                  sra          s7, a2, s10
                  mulh         a7, a7, t4
                  fcvt.wu.s    a6, fs0, rtz
                  fclass.s     gp, ft5
                  srl          s9, a0, sp
                  sltu         s3, t5, t0
                  fcvt.s.wu    fs11, a5, rmm
                  sltiu        zero, s5, -1577
                  sll          zero, t2, a2
                  rem          t4, tp, t3
                  ori          a7, s6, -648
                  srl          s3, a1, gp
                  lui          a6, 314438
                  fcvt.s.wu    fs1, a6, rmm
                  srai         a6, a0, 14
                  flt.s        s3, fs5, fa3
                  slti         a7, s4, -1075
                  fmv.w.x      fs1, s1
                  mul          s6, s4, gp
                  fmv.w.x      fa4, a6
                  slt          a6, ra, a2
                  feq.s        a7, fa1, fa3
                  addi         s3, tp, 1305
                  addi         t6, a5, 627
                  srl          s8, t2, s0
                  flt.s        a5, ft0, fs1
                  srl          s10, t0, t5
                  fmax.s       ft4, fs9, ft10
                  fcvt.s.w     ft8, ra, rup
                  mul          ra, sp, a0
                  fcvt.w.s     s1, fs1, rtz
                  lui          gp, 293208
                  div          gp, s1, s7
                  sra          t0, s0, s2
                  fmv.x.w      s2, ft8
                  ori          t6, s6, 356
                  fle.s        a6, fs6, ft0
                  fclass.s     a1, ft7
                  fmin.s       fa7, fa7, fs3
                  slli         t4, sp, 8
                  or           a1, sp, a1
                  sltu         t3, t2, a2
                  remu         s1, tp, s2
                  mulh         sp, s9, a4
	fsub.s	fs11, ft5, ft8, rne
                  lui          t4, 324964
                  flt.s        s2, ft10, ft4
	fsub.s	ft3, fa0, fa7, rne
                  slti         t6, a7, 1449
                  slli         a3, a6, 31
                  slli         s8, t2, 24
                  srli         gp, a6, 13
                  rem          sp, t5, a3
                  sra          t6, gp, t3
                  fmax.s       fa0, ft0, fs3
                  or           t4, gp, s4
                  fmv.x.w      a3, ft4
	fadd.s	fa4, ft5, ft1, rne
                  sltu         t0, ra, s8
                  flt.s        s5, ft3, fs1
                  fle.s        a5, fa1, fs0
                  addi         s8, s4, -201
                  andi         t4, s7, 1253
                  fsgnjx.s     fs1, fs5, ft6
                  fle.s        s10, ft1, ft7
                  xor          s1, t0, s10
                  fsgnjn.s     ft2, fa1, ft9
                  srli         a0, s4, 30
                  auipc        a5, 497460
                  div          t3, gp, s9
                  fmin.s       ft11, fa7, fa5
                  slti         t3, s1, 185
                  mulhsu       s6, a0, a0
                  xori         a3, s9, -398
                  fclass.s     t0, ft9
                  fsgnj.s      fa3, ft11, ft2
                  remu         s11, a2, s4
                  xori         a5, gp, -1942
                  sltu         sp, t0, s4
                  mul          s2, a7, s0
                  srai         a6, s6, 7
                  fsgnjx.s     fs3, ft2, fs3
                  fcvt.w.s     a5, ft1, rtz
                  ori          a5, a5, -908
                  feq.s        t1, fs4, fa1
                  fcvt.s.wu    ft7, s2, rup
                  fsgnj.s      ft9, fs5, fs9
                  remu         a3, a1, sp
                  srai         a7, s9, 25
                  addi         a1, s3, 2006
	fcvt.wu.s	zero, fs0, rne
                  auipc        a5, 892894
                  lui          s6, 175512
                  divu         zero, gp, s0
                  slti         a4, s10, 1200
                  fcvt.s.wu    fs0, s5, rne
                  fmv.w.x      fa6, s1
                  slti         t0, a2, -490
                  fmv.w.x      fa0, a1
                  and          s2, t2, ra
                  sltu         s3, s5, a3
                  mulhu        s7, s4, t4
                  addi         s5, a6, 402
                  sltiu        t6, a4, -646
                  addi         s2, a5, -1550
                  srli         gp, a2, 16
                  flt.s        t0, ft4, ft10
                  andi         a4, s9, 498
                  rem          s0, zero, gp
                  fmin.s       ft1, fs10, ft2
                  nop
                  lui          s5, 750730
                  mulhsu       s9, t6, t6
                  xori         s1, zero, -645
                  srli         tp, a1, 7
                  lui          s1, 776274
                  mul          a6, s4, s6
                  slt          s9, t1, a5
                  lui          a0, 404484
                  auipc        zero, 994969
                  ori          a2, t0, 1633
                  fsgnjx.s     ft3, fa7, fa2
                  or           a4, a2, sp
	fcvt.w.s	tp, fs4, rne
                  ori          s3, a1, 562
                  xori         s8, a3, 967
                  fcvt.s.w     ft9, zero, rmm
                  srli         s10, t4, 10
                  addi         sp, a3, -1319
                  mulhsu       s1, a7, zero
                  fcvt.w.s     zero, fa0, rmm
                  sll          t1, s3, a5
                  fmin.s       ft11, fa3, fa0
                  sltu         a2, s8, a5
                  rem          t6, t0, s4
	fcvt.wu.s	a2, fa1, rne
                  andi         a6, gp, 1072
                  fsgnj.s      fs5, fa7, fs5
                  fsgnjx.s     fs11, fs11, ft1
                  sra          t3, s1, s8
                  mulh         s10, t3, s0
                  sra          t6, s0, a2
                  slti         t4, a5, 1118
                  fmv.x.w      a7, fa0
                  fclass.s     sp, ft1
                  xori         t4, tp, -1701
                  srai         t4, s0, 6
                  feq.s        gp, ft11, fs11
	fcvt.wu.s	s2, fa2, rne
                  srl          a3, tp, a2
                  divu         tp, s7, s4
                  srli         zero, a6, 19
                  fsgnjx.s     ft6, fs4, ft11
                  slti         s11, a6, 2015
                  xor          s10, s8, s11
                  slt          t1, s9, a4
                  fmv.x.w      zero, ft6
                  auipc        gp, 560793
                  ori          a0, s5, -888
	fsub.s	ft5, fa7, ft4, rne
                  flt.s        t6, ft9, fa4
                  fclass.s     s10, fa1
                  srai         s3, s8, 26
                  sll          s2, s0, s10
                  remu         a1, zero, t3
                  mul          s0, t4, t0
                  fsgnjn.s     ft5, fs1, ft7
                  xori         zero, ra, 1039
                  div          gp, a0, a1
                  xori         a0, zero, -1540
                  slli         a1, s1, 28
                  xori         t4, t0, -1864
                  slt          s9, a2, t4
                  auipc        s2, 801606
                  fmv.w.x      fs11, s9
                  fsub.s       ft1, ft9, fa3, rdn
                  fsgnjx.s     fa6, fs3, ft1
                  ori          t3, a6, -1571
                  sltu         s9, gp, a6
                  fcvt.s.wu    ft11, s6, rdn
                  auipc        a0, 723619
                  fsub.s       fs11, fs2, ft7, rtz
                  slti         s5, a7, -1891
                  divu         a5, a1, s8
                  div          s9, a2, a4
                  remu         a4, s2, s11
                  lui          t6, 608777
                  sll          s5, a1, s6
                  sra          a2, t2, s10
                  fle.s        s0, fs2, ft0
                  fsub.s       ft5, ft11, ft1, rdn
                  fmv.x.w      a3, fa5
                  fmv.w.x      ft4, t0
                  fmv.x.w      a7, ft3
                  sll          a2, s8, t1
                  fsgnjx.s     ft10, ft1, ft11
                  fmin.s       fs10, fs2, fs7
                  sltu         s1, s11, a6
                  divu         s2, gp, sp
                  fmv.x.w      a7, ft1
                  fmax.s       fs10, fs5, ft3
                  mulhu        ra, a1, sp
                  or           a7, a6, s6
                  mulh         s7, ra, s10
                  fsgnjx.s     ft3, fa1, fs4
                  sll          tp, zero, t3
                  fle.s        s11, ft10, ft1
                  xor          t3, zero, t3
                  fle.s        a2, ft1, fs4
                  feq.s        s0, ft7, fs10
                  slli         a3, tp, 24
                  fmv.x.w      tp, ft4
                  mulhu        s5, s10, a3
	fadd.s	ft2, fs2, fa4, rne
                  feq.s        s8, fa5, ft4
                  fcvt.s.wu    fs10, gp, rmm
                  divu         sp, a0, t6
                  sub          s7, a7, s8
                  mul          s6, s4, t5
                  mulhu        s8, s11, a3
                  nop
                  fcvt.s.w     fs8, tp, rmm
                  mulhu        s6, s3, sp
                  xor          t4, t0, s2
                  xor          gp, t5, t2
                  xor          t3, t0, zero
	fcvt.w.s	s0, fs0, rne
	fcvt.s.wu	fa4, a7, rne
                  fclass.s     tp, fs10
                  slli         a5, s4, 6
                  and          a1, t6, s11
                  slti         tp, ra, -628
                  fmv.x.w      t0, ft7
                  fsgnjn.s     fa4, fa0, fs6
                  sltu         s7, t1, tp
                  addi         a1, s2, -586
                  divu         t3, s1, s9
                  or           s6, t3, t5
                  fsgnj.s      ft3, ft0, fs10
                  add          t4, s1, s0
                  fcvt.s.wu    fa6, s8, rne
                  fsub.s       ft3, ft0, fs1, rdn
                  andi         zero, s4, -1294
                  divu         a6, t6, a5
	fcvt.w.s	s7, fs2, rne
                  sltu         sp, a3, t0
                  slt          gp, a2, s4
                  fcvt.wu.s    s9, fs7, rtz
                  divu         t0, a0, tp
                  ori          zero, s1, 1377
                  sra          a4, sp, a0
	fsub.s	ft6, fs3, ft3, rne
                  remu         t1, t0, t3
                  addi         zero, ra, -1365
                  fmin.s       ft5, ft6, fs11
                  srl          s0, t0, sp
                  slti         a0, s9, -1388
                  fmax.s       ft1, ft10, ft9
                  auipc        t1, 777130
                  xori         s6, s2, -128
                  div          a6, a1, s3
                  fsgnj.s      fs0, ft7, fs4
                  sltiu        s10, s11, -1161
                  fsgnjx.s     ft2, ft4, fs5
                  lui          a4, 453379
                  fmv.x.w      tp, fa2
                  fmax.s       ft11, fa4, ft8
                  fsub.s       fs10, fa1, ft10, rup
                  mulhsu       sp, a7, s9
                  mulh         t6, a3, sp
                  sltiu        a3, s10, 1804
                  fcvt.s.w     fs1, s8, rtz
                  fmv.x.w      s11, ft1
                  fsgnjx.s     fs10, fa4, fs3
                  fmax.s       fs0, fa1, fs9
                  xor          s8, s5, t3
                  sub          t3, a7, a2
                  sll          a1, s1, s10
                  auipc        a5, 727670
                  fsgnjx.s     fa5, fa1, fs11
                  fmin.s       fs0, fs4, ft6
                  add          a7, a3, a5
                  sltu         sp, s6, ra
                  feq.s        s7, fs1, ft11
                  mulhu        s7, s2, s9
                  mulhu        s1, a5, a7
                  sra          s0, s2, sp
                  add          t3, t1, s7
                  srl          ra, ra, s1
                  ori          a3, s11, 2005
                  slti         a0, t4, 1034
                  feq.s        t1, ft8, fs0
                  divu         s8, s10, s7
                  or           s10, s11, a0
                  srl          a6, s5, s0
                  xori         a4, s0, 1453
                  fcvt.wu.s    a1, ft3, rmm
                  mulhsu       t6, t0, s10
                  fsgnjn.s     fs1, fs1, fs2
                  divu         gp, t1, a1
                  rem          gp, t6, s1
                  sltiu        a4, s4, -201
                  add          s9, s4, s0
                  srai         t4, a6, 13
                  mulhu        s9, s0, s10
                  slti         ra, sp, -1374
                  slli         a6, s3, 27
                  feq.s        t3, ft5, ft10
                  remu         zero, a2, ra
                  fmv.w.x      ft0, gp
                  sll          s3, s9, t5
                  sltu         a7, s8, s4
                  addi         a5, t2, 1233
                  sltiu        tp, t5, 654
                  sll          s9, a6, s9
                  fcvt.w.s     t4, fs0, rtz
                  fmv.w.x      ft8, s6
                  mulhu        a2, s9, gp
                  fsgnjx.s     fs7, ft2, ft3
                  remu         s3, a0, a1
	fsub.s	fa6, fs10, fs7, rne
                  sll          s9, s5, a2
                  lui          t1, 991423
                  auipc        sp, 47949
                  fcvt.w.s     s3, ft1, rmm
                  sra          gp, s8, s2
                  mulh         s5, s2, a3
                  add          a4, s8, t0
                  andi         a1, t2, -1125
                  remu         a0, sp, gp
                  fcvt.s.wu    ft6, t4, rup
                  mulh         tp, s8, s8
                  mulhsu       a1, zero, ra
                  div          s0, zero, a4
                  fcvt.w.s     gp, ft0, rne
                  addi         s1, a5, -442
                  fclass.s     a2, ft1
                  sra          s9, a3, a7
                  lui          a7, 271783
                  sltiu        s10, zero, 1094
                  srai         a4, s2, 7
                  fle.s        sp, ft1, ft4
                  slti         s8, s7, -534
	fcvt.s.wu	ft9, s8, rne
                  fcvt.w.s     zero, ft4, rtz
                  flt.s        s2, fs8, fs10
                  divu         s6, s6, ra
                  slli         s6, s0, 14
                  or           a5, s4, tp
                  nop
                  fmax.s       fa1, ft9, fa1
                  fmax.s       ft11, fa3, fa0
                  sltiu        t1, gp, 1639
                  srl          a0, t5, t6
                  sub          s8, s2, s10
                  fsgnjx.s     fs10, fs10, ft3
                  xor          ra, a1, s8
                  fadd.s       ft5, fa1, fa3, rmm
	fcvt.wu.s	t6, ft10, rne
                  sltu         a7, s0, s5
                  slt          tp, s5, s2
                  ori          ra, t6, -629
                  fle.s        a2, fa6, fs0
                  sra          gp, s3, s11
                  fmv.w.x      fs8, s7
                  sub          s3, a6, s5
	fcvt.wu.s	t6, fs6, rne
                  fsgnjn.s     fs3, ft5, fa1
                  fcvt.w.s     t3, ft7, rne
                  fmin.s       fs9, fs6, fs4
                  xor          t1, t1, s3
                  feq.s        a4, fa4, fa5
                  auipc        s7, 158142
                  mulhu        a5, s6, a1
	fcvt.w.s	a5, fa4, rne
                  divu         a5, s0, s6
                  auipc        zero, 257781
                  div          ra, s6, t6
                  slti         s8, t1, 47
                  fclass.s     gp, ft10
                  andi         sp, t6, 924
                  xor          s0, s2, s3
                  sltu         s7, ra, t6
                  slti         a1, a4, -1978
                  ori          s8, s5, 1882
                  remu         s2, tp, s10
                  andi         s3, t1, 81
                  srai         s6, s8, 14
                  xor          t0, s1, a7
                  or           s5, ra, ra
                  andi         t0, t2, -1039
                  srli         t4, s4, 6
                  auipc        t0, 446794
                  sll          s2, tp, a4
                  mulh         s10, t3, t3
                  slti         a7, a5, 1819
                  xor          s7, zero, tp
                  xori         s6, s6, 408
	fcvt.wu.s	s1, fs10, rne
                  sub          s9, t3, s4
                  sra          s7, s2, s0
                  or           s10, a4, s7
                  and          a1, s9, a4
                  mulh         s0, s1, a3
                  sra          s3, s9, s10
                  addi         s11, a6, 1671
                  fcvt.s.wu    ft8, gp, rtz
                  fclass.s     s2, ft6
                  fcvt.s.w     fs3, t6, rmm
                  srai         s8, a4, 0
                  slti         t3, s5, -1977
                  fcvt.s.wu    fs9, t5, rup
                  and          zero, t0, a4
                  mulhu        s7, t2, t6
                  addi         a5, a6, -584
                  slti         a7, t2, 540
                  addi         a2, t0, 269
                  div          t3, s5, s3
                  slli         a2, gp, 9
                  or           sp, s10, a0
                  mulhsu       a4, a5, a0
                  fcvt.wu.s    a1, ft2, rdn
                  add          s7, tp, a4
                  add          t1, a4, t6
                  mulh         sp, a7, a2
                  nop
                  mulhsu       gp, a3, s5
                  fclass.s     t1, ft3
                  lui          ra, 486521
                  sll          s0, a0, a7
                  remu         a5, a6, s11
                  srli         t1, t6, 16
                  fsgnj.s      fs1, ft0, fa0
                  mulhsu       t6, tp, s11
	fcvt.s.w	fs8, s0, rne
                  andi         zero, a0, 1013
                  fmin.s       fa2, fs10, fs4
                  fsgnj.s      ft5, fa6, fs8
                  fadd.s       fs6, fs1, ft3, rup
	fcvt.s.w	fa0, t6, rne
                  xor          a5, a4, a3
                  auipc        t3, 610573
                  divu         t4, t4, s5
                  mul          s8, s3, sp
                  srli         s3, a7, 20
                  sltu         gp, s11, sp
                  srai         s0, s8, 3
	fadd.s	ft4, ft11, fs9, rne
                  fmv.w.x      fs3, zero
                  slt          s10, s2, zero
	fcvt.s.w	fa2, s2, rne
                  fcvt.w.s     s11, fa0, rtz
                  slti         ra, ra, -1055
                  sub          s6, ra, t0
	fcvt.s.w	fs5, s6, rne
                  and          zero, s7, sp
                  fle.s        s2, ft0, fa4
                  or           s0, a5, s2
                  divu         a4, s9, t2
                  sltu         a2, a7, t0
                  slti         a2, sp, -551
                  mulhu        s8, s9, a7
                  fmv.x.w      a7, fa4
                  sltu         ra, s0, s5
	fcvt.s.w	ft5, t2, rne
                  andi         s2, s0, 982
                  ori          s11, a4, -1685
                  or           t3, a1, zero
                  slli         s9, t6, 6
	fadd.s	fs5, fs0, fa3, rne
                  fcvt.wu.s    tp, fa3, rmm
                  fclass.s     t0, fa2
                  divu         ra, t2, gp
                  srli         a2, s2, 26
                  or           s11, ra, sp
                  srl          a4, s5, t0
                  xori         s6, tp, -535
                  auipc        t3, 543240
                  auipc        a5, 113258
	fcvt.s.wu	fa7, a5, rne
                  srai         t3, s6, 30
                  auipc        t6, 618742
                  feq.s        t1, ft10, fa6
                  slt          ra, sp, a4
                  addi         a5, a6, 64
                  sub          s8, ra, t6
                  slt          s2, t4, gp
                  lui          s7, 9146
                  ori          t0, t4, -659
                  srl          t3, s1, s8
                  div          a0, s1, t1
                  or           t1, a4, s6
                  div          s10, a0, gp
                  fsgnj.s      fs4, ft5, fa2
                  andi         s5, t2, -323
                  fmv.x.w      s0, ft9
                  slli         t0, tp, 17
                  srai         a6, a1, 6
                  srli         s7, gp, 10
                  slti         ra, a4, -113
                  srai         s10, s3, 0
                  sra          s7, s5, sp
	fcvt.s.w	fa1, s1, rne
                  sltiu        s0, a1, 13
                  add          a5, a2, t2
                  slt          a2, s6, a6
                  andi         s11, a6, 2032
                  mulhsu       a0, t1, s6
                  ori          a7, s0, 637
                  fclass.s     s8, ft7
                  fcvt.w.s     a7, fa7, rtz
                  xori         a6, t4, 659
                  fsgnj.s      fs8, fs8, ft2
                  mulhsu       tp, gp, gp
                  mulhsu       s0, a4, s4
                  lui          ra, 973064
                  sub          s8, s4, a2
                  slt          t3, s10, ra
	fcvt.w.s	s5, ft0, rne
                  sltiu        t3, s3, 218
                  xor          s6, a4, s6
                  fcvt.s.w     ft7, a7, rne
                  fmv.w.x      ft9, t3
                  fmv.x.w      a6, ft5
                  srli         a2, s9, 14
                  feq.s        zero, ft10, ft2
                  fcvt.wu.s    gp, fs7, rdn
                  srli         tp, s8, 7
                  and          t6, a6, a6
                  xor          tp, gp, a1
	fcvt.s.w	ft3, s8, rne
	fcvt.s.w	ft2, t0, rne
                  fmax.s       ft0, ft1, fs1
                  sltu         a4, s3, t5
                  srl          a3, t0, t5
                  slt          a3, s8, s7
                  lui          zero, 874149
                  fsgnj.s      ft2, fs4, ft1
                  fadd.s       ft10, fs2, fs3, rmm
                  fmv.w.x      ft3, s9
                  fsgnjn.s     ft6, ft11, fs6
                  sltiu        s0, s10, -1180
                  xori         a0, s10, 1699
                  fclass.s     a1, fs11
                  fmax.s       ft11, fa7, fs5
                  or           s11, t2, s3
	fsub.s	fs9, fs10, fa5, rne
                  fclass.s     t4, fs8
                  fsgnj.s      fs7, ft3, ft5
                  srl          ra, s3, s2
                  remu         t4, a4, a2
                  slt          s2, a7, s8
                  fclass.s     s9, fs1
                  fmax.s       fa7, fs4, fa7
                  mulhu        a5, a0, a3
                  div          s1, gp, a4
                  mulh         a5, t3, a4
                  fsub.s       fa0, fs6, ft7, rmm
                  or           zero, s7, a7
                  auipc        s8, 770659
                  add          s10, ra, a5
                  sub          t1, a3, s0
                  addi         s9, s8, 143
	fsub.s	fa3, fs0, fa4, rne
                  auipc        s11, 254983
                  fmax.s       fa1, fa1, fa5
                  or           s10, sp, s6
                  xori         a4, t5, -1221
                  fsgnj.s      ft6, ft0, fs0
                  auipc        tp, 787249
                  fcvt.wu.s    a3, fs0, rtz
                  sub          s10, t4, t6
                  fsgnjx.s     ft8, ft9, fa4
                  fmv.w.x      fa2, a2
                  addi         a6, s11, -188
                  srl          sp, t6, s2
                  fmv.w.x      ft10, t1
                  xori         gp, s4, 1336
                  addi         s5, s8, -26
                  mulh         t4, s0, t5
                  flt.s        s9, ft10, fa5
                  srai         gp, s10, 3
                  sltiu        a7, t5, -908
                  ori          s1, s3, -1288
                  fsgnjn.s     fa7, fs9, fs4
                  rem          ra, s6, s9
                  fsub.s       fa5, fa1, fs9, rtz
                  fle.s        a3, fa5, ft3
                  fclass.s     gp, ft1
                  fsgnj.s      fs1, fs6, fa2
                  srli         s7, gp, 6
                  div          a4, s6, t3
	fcvt.w.s	s6, ft1, rne
                  divu         s2, t6, a6
                  fle.s        a2, fs7, fs4
                  sltu         s6, s2, s6
                  nop
                  ori          s0, s0, 641
                  divu         a3, a2, t0
                  mulh         s7, ra, s3
                  fadd.s       fa4, fs7, fa2, rdn
                  fmv.w.x      ft9, s11
                  fmv.x.w      s2, fs3
                  srai         a5, s8, 5
                  fclass.s     t4, fa4
                  fcvt.s.wu    fa5, s0, rtz
                  sra          s10, t3, s5
                  srl          s7, a7, ra
                  rem          s10, t4, a7
                  xori         s0, gp, 1233
                  srl          t6, s2, a0
                  fmv.w.x      fa7, s6
                  fle.s        a6, ft6, fa1
                  divu         t1, a1, s7
                  div          t6, s10, t5
                  srai         s5, t4, 20
                  sub          t1, s0, a0
                  fsgnj.s      fa2, ft4, ft10
                  fmin.s       fa4, ft0, ft9
                  nop
                  sltiu        s3, s5, -648
                  flt.s        s9, fa4, fa0
	fcvt.wu.s	t6, ft5, rne
                  add          s7, a5, zero
	fsub.s	fs11, ft2, fs6, rne
                  andi         a1, t0, -703
                  fmv.x.w      s2, fs8
                  fcvt.w.s     a7, fa6, rne
                  slt          gp, t5, s10
                  fcvt.w.s     a4, fs9, rne
                  fcvt.s.wu    ft7, s4, rne
                  addi         t0, t1, -1867
                  sra          s8, a7, ra
                  add          sp, s4, sp
                  or           sp, a2, s1
                  flt.s        a2, fa7, ft0
                  lui          a3, 247356
                  or           ra, zero, t2
                  xori         tp, gp, 483
                  lui          a4, 811069
                  divu         a1, sp, ra
                  fsgnjn.s     fa1, ft10, fs2
                  fmv.w.x      fa2, s9
                  fsgnjx.s     fs3, fa5, ft1
	fcvt.w.s	tp, fa4, rne
                  srai         s5, a2, 8
                  or           s5, s1, ra
                  ori          t3, t6, 1485
                  fclass.s     s5, fa2
                  nop
                  auipc        s0, 989935
                  fcvt.w.s     a6, fs7, rne
                  feq.s        s7, fs11, ft4
                  sltu         t0, t2, a7
                  fcvt.w.s     s10, ft2, rdn
	fcvt.s.w	ft9, a4, rne
                  srl          s5, s0, a0
                  xori         a0, a6, -1705
                  mulhsu       s10, a4, s10
                  sll          s11, sp, a3
                  fcvt.wu.s    a4, fs9, rtz
                  fclass.s     ra, fa2
                  fmax.s       fs10, ft6, fs9
                  and          sp, s5, t5
                  fclass.s     a4, ft3
                  slli         t0, t1, 27
                  divu         a2, a7, t5
                  srl          s3, ra, s11
                  fcvt.w.s     s2, fs8, rtz
                  xor          s10, ra, zero
                  fsgnjn.s     fs9, fs6, fa4
                  mul          t0, t0, s3
                  fcvt.wu.s    s9, fs4, rdn
                  andi         a7, s2, 748
                  fsgnj.s      fa5, fs11, fa1
                  mulhu        tp, sp, s6
                  add          sp, s3, gp
                  ori          s5, t6, 1506
                  srli         s11, s1, 8
                  lui          a3, 891620
                  sltiu        sp, s6, 1254
                  add          s2, s9, gp
                  fmin.s       fa1, ft3, fa4
                  fsgnjn.s     fa1, fs9, fs9
	fsub.s	fs4, ft10, ft6, rne
                  feq.s        s7, fs9, ft3
                  and          a2, s6, s8
                  fsgnjx.s     ft4, fa1, fs10
                  addi         sp, a4, 1601
                  srli         a0, t4, 25
                  fsgnj.s      ft0, ft4, ft3
                  slt          t0, a5, zero
                  add          s6, tp, t3
                  fcvt.s.w     fs1, a1, rtz
                  xor          a5, s1, a0
                  srl          a7, a3, t3
                  fle.s        a7, ft9, ft7
                  or           ra, s8, s3
                  fmin.s       fs3, fa4, ft10
                  xori         s7, sp, 1850
                  fcvt.s.w     ft6, t5, rmm
                  andi         a4, s3, -1705
                  fclass.s     s5, fa0
                  srai         tp, ra, 4
                  slt          s6, ra, s11
                  fmax.s       fs1, ft7, ft11
                  fsgnj.s      fa6, fs0, fs3
                  fadd.s       fs9, fs4, fa7, rtz
                  ori          ra, zero, 1852
                  sltiu        t0, t3, -1882
                  mul          s5, a3, a1
                  fcvt.s.wu    fa4, a2, rtz
                  feq.s        s2, fa1, ft1
                  fle.s        s3, fs5, ft11
                  fsgnjn.s     fa0, fs6, fs9
                  mulhsu       t1, s4, t4
                  fmv.w.x      ft7, t3
                  fmv.w.x      ft3, t1
                  rem          gp, s3, t3
                  rem          gp, s10, s2
                  fadd.s       fs11, fs9, ft9, rne
                  slt          a3, sp, a7
	fsub.s	ft9, fs0, fa3, rne
                  sra          t1, a6, t2
                  and          zero, s3, t5
                  slti         sp, a0, 790
                  fmin.s       ft0, fs10, fa1
                  mul          t6, s5, t4
                  mul          a3, s2, s1
                  fsub.s       fs4, fs8, ft11, rdn
                  sltu         gp, t1, zero
                  divu         gp, a0, t4
                  auipc        t3, 145845
                  fclass.s     tp, ft4
                  mulhsu       a3, t1, s9
                  fclass.s     s10, fa6
                  fsgnjn.s     fa1, fs8, fa4
                  fmax.s       ft4, fs6, fs1
                  srl          s1, sp, a3
                  fle.s        a4, ft5, fs0
                  mul          t4, zero, s2
                  fmax.s       fs8, fs7, ft6
                  nop
                  and          a7, s8, a5
                  mulhsu       s1, a7, s8
                  fsgnjx.s     fa1, ft7, fs7
                  mulh         t1, s4, t6
                  flt.s        ra, ft5, fs9
                  fsgnj.s      fs9, fa4, fa0
                  auipc        s8, 579828
	fcvt.s.wu	fa0, gp, rne
                  fsgnj.s      fs5, fs1, fs10
                  slti         t0, a0, 570
                  nop
                  xori         s2, s7, -2037
	fcvt.wu.s	a4, fs5, rne
                  fmin.s       fs11, ft8, ft8
                  or           sp, t5, a6
                  fcvt.s.w     fs1, t6, rtz
                  sltiu        s1, s5, 1826
                  mulhsu       s7, t3, gp
	fcvt.s.wu	fa1, s8, rne
                  slt          a2, s0, s10
                  xor          s7, ra, s6
	fcvt.wu.s	t6, fs11, rne
                  nop
                  divu         gp, s4, t5
                  feq.s        a1, fa2, fa0
                  fmv.w.x      fs7, t4
                  mulhsu       s10, a4, a4
                  ori          s1, a5, -1462
                  feq.s        t3, fa3, ft5
                  fcvt.wu.s    t3, ft2, rdn
                  fclass.s     ra, fa3
                  slti         t1, sp, -675
                  fle.s        s9, ft11, fa1
                  srli         zero, a0, 23
                  nop
                  fcvt.wu.s    s10, fa0, rmm
                  divu         a1, s10, a0
                  fmin.s       ft0, ft2, ft7
                  ori          a2, t6, 980
	fadd.s	fa1, fs2, fs5, rne
                  feq.s        a3, fs0, fa2
                  sra          gp, s6, s8
                  fcvt.s.wu    ft8, t4, rup
                  fle.s        s2, fs1, ft10
                  fmin.s       fs4, fa5, ft5
                  mulhu        s6, s11, s1
                  fle.s        zero, fs1, ft3
	fcvt.s.wu	fa6, t3, rne
                  fle.s        a4, fs9, fa7
                  fmv.x.w      t3, fs7
                  srl          t4, a0, a3
                  lui          s9, 495037
                  andi         t1, t6, 1685
                  mulhsu       t1, s3, a6
                  or           a1, s3, t0
                  xor          s10, s3, s9
                  fmv.w.x      ft8, t0
                  ori          a3, t6, -1943
                  rem          a3, t3, s1
                  fsgnj.s      fs9, ft1, fs3
                  slli         t0, s6, 23
                  fmin.s       fa1, ft1, ft4
                  fmv.w.x      fs5, sp
                  sltiu        ra, a2, 673
                  fsgnjx.s     ft2, ft10, ft1
                  lui          s10, 862961
                  auipc        a0, 312512
                  ori          s8, t5, -1946
                  sub          a3, s3, a3
                  rem          s3, t5, s1
                  ori          s8, a4, 1499
                  lui          a3, 921290
                  rem          s3, s1, a6
                  mulhsu       s2, s3, sp
                  fmv.w.x      ft1, a3
                  sltu         t6, a0, s1
                  auipc        zero, 780844
                  feq.s        s2, fa0, ft8
                  xor          a0, a6, t0
                  addi         s8, a6, 1714
	fsub.s	fs1, fs11, fs0, rne
                  divu         s0, s10, t5
                  fcvt.s.wu    ft8, a7, rup
                  ori          a7, s1, 1891
                  nop
                  lui          s1, 194515
                  fmv.x.w      a7, ft9
	fadd.s	fs2, fa0, fa4, rne
                  sub          t3, s2, a1
                  ori          sp, a0, -234
                  slti         a4, a7, 1834
                  ori          a4, t4, -1907
	fsub.s	ft8, fs4, ft10, rne
                  mul          a7, sp, s3
                  srai         a7, a7, 11
                  remu         s6, tp, s0
                  fmv.w.x      ft11, a2
                  xori         gp, s2, -1519
                  fmin.s       fs9, fs2, fs3
                  xori         a6, a3, 347
                  fsgnj.s      fa7, ft6, fa4
                  sub          a5, s3, s1
                  srai         s2, a4, 27
                  fclass.s     tp, fa5
                  fsgnj.s      fa4, ft5, fa4
	fcvt.s.wu	ft3, ra, rne
                  nop
                  fmax.s       fa7, ft0, ft5
                  addi         t1, s4, -470
                  sll          gp, t3, tp
                  slli         a6, a3, 25
                  fcvt.wu.s    s3, ft6, rne
	fsub.s	fs5, fa3, fs2, rne
                  and          a2, t3, t4
                  fsgnjn.s     fs9, fa0, fs4
                  mulh         s0, t0, gp
                  auipc        s10, 479056
                  and          s5, a1, s2
                  srai         a4, a6, 6
                  sub          gp, a7, s9
                  mulhu        a3, t1, t3
                  flt.s        ra, fa1, ft1
                  flt.s        s3, fs10, fa6
                  fmax.s       fa7, ft4, fa3
                  srl          a0, s10, a6
                  feq.s        a0, ft10, fs11
                  remu         zero, s10, s10
                  feq.s        t3, fs6, ft2
                  xor          a5, a4, ra
                  div          s6, a3, zero
	fcvt.wu.s	s6, ft5, rne
                  xor          gp, s5, t1
	fcvt.s.wu	fs8, s7, rne
                  mulhsu       t1, a3, s9
                  mul          t3, a6, a5
                  divu         s2, a5, a6
                  fle.s        tp, fa5, ft6
	fadd.s	fs1, fs7, ft0, rne
                  andi         s6, t5, 1078
                  fmin.s       fs1, fs4, fa7
                  xor          t1, s6, s0
                  or           gp, sp, t1
                  slli         a1, t3, 23
                  sll          a6, t0, t5
                  fmv.x.w      s9, fs11
                  xori         t4, t4, 1196
                  fsgnjn.s     fs8, ft7, fa2
                  fcvt.w.s     s2, ft7, rup
                  and          a7, t6, ra
                  fsgnj.s      fa4, ft1, ft5
                  xor          t3, s0, a7
                  auipc        a5, 94653
                  slli         t1, s4, 11
                  flt.s        s8, ft0, ft11
                  srli         zero, a3, 26
                  fsgnjn.s     ft3, ft10, ft3
                  srli         s3, a5, 10
                  fsgnj.s      fa5, fs1, fa2
                  feq.s        a6, fa0, fs9
                  fcvt.s.w     ft7, s1, rup
                  sll          tp, a7, gp
	fcvt.s.w	ft3, a6, rne
                  slt          a5, t2, s0
                  ori          a2, a1, -174
                  slli         a2, a6, 13
                  lui          a3, 107847
                  fcvt.s.wu    fs11, a3, rup
                  slt          gp, t0, ra
                  sra          a4, s11, s2
                  div          tp, a7, t0
                  addi         s6, s10, 105
                  srl          a5, a0, s1
                  fmax.s       fa1, fs9, fs8
                  divu         t0, sp, a4
                  srai         s9, t1, 18
                  fsgnj.s      ft9, fa4, ft4
                  xori         a4, t0, -1608
                  sll          a0, t0, t2
                  divu         s9, s2, zero
                  srli         t1, a2, 12
                  fsgnjn.s     fa0, ft1, fa7
                  ori          s2, s5, 1994
	fsub.s	fs0, ft1, fs1, rne
                  fcvt.wu.s    s0, fa7, rne
                  lui          zero, 84521
                  fclass.s     s10, ft4
                  feq.s        zero, ft3, fs1
                  lui          zero, 380127
                  remu         t1, a3, s4
                  sub          s5, a7, s5
                  sra          a5, t5, s3
                  nop
                  fcvt.w.s     s6, fs7, rne
                  lui          t4, 552891
                  divu         gp, ra, ra
                  sltu         t0, s2, s5
                  xori         s7, s9, -1314
	fcvt.w.s	s10, fs9, rne
                  div          s6, t6, s9
                  fsgnjx.s     ft9, fs4, ft8
                  mul          s11, a4, a0
	fcvt.s.w	ft6, a6, rne
                  sltiu        a7, a3, 1557
                  div          s7, s2, t3
                  slt          t4, a3, zero
                  sub          s1, s3, zero
                  fclass.s     s8, ft4
                  rem          t4, s8, s10
                  add          a0, s2, a2
                  or           s9, a0, a5
                  auipc        t0, 603882
                  nop
                  srl          a0, s7, a4
                  mulhsu       t6, a4, t4
                  mul          t1, t1, s11
                  fcvt.s.w     ft1, a0, rdn
                  fcvt.wu.s    t4, fs10, rdn
                  fmv.w.x      ft6, s9
                  div          a1, t5, a6
                  flt.s        t4, ft7, fa1
                  srl          t4, s10, ra
                  slt          a0, t4, t5
                  slt          t0, a7, t5
                  fmin.s       fs8, fs7, fs8
                  sub          t1, s6, s1
                  lui          t3, 379871
                  mulh         t4, a2, a4
                  lui          s9, 462597
                  nop
                  add          s9, s4, t5
                  auipc        a0, 987351
                  fsgnjn.s     ft4, ft11, ft10
                  srai         a7, s9, 5
                  andi         s2, zero, 1180
                  addi         a6, zero, 1487
                  mulhu        s9, t0, s5
                  sra          s2, t5, s4
                  srli         t3, s10, 16
                  mulhsu       t1, t1, t6
                  ori          gp, t0, 898
                  slt          s3, t1, t3
                  fle.s        s0, fa0, ft2
	fcvt.w.s	sp, ft8, rne
                  auipc        s7, 578170
                  fcvt.s.wu    fs11, t1, rdn
                  ori          t1, s4, -538
                  mulhsu       gp, a1, s10
                  auipc        a2, 709939
                  sra          s3, a6, t6
                  mul          sp, s10, s0
                  fle.s        a1, fs4, fa2
                  xori         s1, a0, -1054
	fsub.s	ft4, fa4, fs1, rne
	fcvt.wu.s	t1, fs3, rne
                  fadd.s       ft4, ft2, fs2, rtz
                  slti         s0, s5, -366
                  fmv.w.x      fs9, s6
                  mul          s9, s5, t0
	fcvt.wu.s	gp, fa1, rne
                  fadd.s       fa5, ft5, fa6, rup
                  fcvt.s.w     fs7, s7, rne
                  fmax.s       fs11, fs11, fs4
                  sltu         t4, a5, t6
                  nop
                  mulh         a4, s0, ra
                  fsgnjn.s     fs6, fs7, fa6
	fcvt.wu.s	gp, fa0, rne
                  sltiu        zero, t4, 1197
                  fcvt.wu.s    s7, fa4, rne
                  srli         t0, a5, 3
                  fmv.x.w      zero, ft1
                  fsub.s       ft3, fa7, fs1, rmm
                  sub          a3, s2, ra
                  flt.s        ra, fa4, fs1
                  fsgnj.s      fs6, ft4, ft10
                  auipc        t1, 820156
                  fmin.s       fs10, ft9, ft2
                  fmin.s       ft11, fa5, fs1
                  flt.s        t4, ft1, fs2
	fcvt.s.wu	fa5, t2, rne
                  fsgnjn.s     fs11, fs9, ft4
                  mul          gp, s11, s3
                  flt.s        a7, fa6, fa2
                  sll          t6, t1, t1
                  srai         t6, a0, 10
                  xor          t6, t1, t0
                  fle.s        ra, fa1, fa2
                  fcvt.w.s     t1, fs7, rmm
                  fsgnjn.s     fs10, fa1, fs5
                  or           zero, t6, a5
                  fmin.s       fs1, fs7, ft8
                  slli         tp, s10, 3
                  divu         t4, a4, s6
                  srli         s2, s5, 29
                  slli         a0, s3, 15
                  slli         s1, t1, 26
                  slt          gp, s6, t5
                  fmv.w.x      fa7, s11
                  and          a4, s11, s1
                  addi         a0, a7, 891
                  div          gp, sp, s6
                  fle.s        s3, ft8, fs7
                  fcvt.s.w     fs0, s6, rdn
                  div          t4, s6, a1
                  sltu         t6, s11, a4
                  sltu         a1, a0, s5
                  or           s6, s0, a0
                  addi         s9, s7, -537
                  mulhu        a6, a4, a7
                  srai         t3, s2, 7
                  remu         s5, s9, s11
                  fle.s        a1, fa1, fa6
                  sra          t0, t4, s1
	fcvt.w.s	a2, ft3, rne
                  fmin.s       ft2, fs5, fs7
                  and          a6, t5, tp
                  remu         t0, a3, a6
                  mulhu        a4, s8, t3
                  fclass.s     a2, fa2
                  divu         s2, a0, a5
                  fcvt.wu.s    gp, fa4, rup
                  fsgnj.s      ft11, fs2, ft0
                  sltu         a4, a4, a6
                  fadd.s       ft6, ft10, ft11, rup
                  ori          a3, t4, 950
                  xor          s10, t6, ra
                  divu         s8, t6, s10
                  sll          s2, a3, s6
                  sub          s6, s9, zero
                  feq.s        a3, fs3, fs6
	fsub.s	fs2, ft8, ft10, rne
                  fsgnj.s      fs3, fs0, ft0
                  fclass.s     a4, fs2
                  slli         a7, gp, 28
                  fcvt.s.w     ft5, sp, rmm
                  feq.s        s0, fa4, ft9
	fcvt.s.w	fs8, a5, rne
                  sltiu        s9, sp, 361
                  mul          s6, a1, a1
                  srl          s2, s11, s5
                  auipc        t6, 1001819
                  mulhsu       t1, a6, s1
                  remu         t3, s9, a3
                  fmin.s       fa4, fs0, ft9
	fcvt.s.wu	ft2, s0, rne
                  nop
                  rem          a7, s7, a1
                  slli         t6, s8, 16
                  xor          a7, s6, a1
                  mul          s0, a1, a5
                  xori         s10, ra, -1388
                  lui          ra, 229277
                  sub          s1, s7, s0
                  xori         s5, t0, 103
                  sltiu        sp, a5, -1704
                  fsgnjn.s     fa6, fa1, ft7
                  remu         s2, tp, a5
                  auipc        a2, 46729
                  xor          a3, a3, s2
                  fle.s        a5, ft0, ft4
                  srl          a7, gp, t2
                  flt.s        s6, fs5, fa5
                  mul          a1, s6, a4
                  srai         zero, a4, 26
                  divu         a0, s1, a3
                  feq.s        s5, fa7, ft11
                  sub          a1, t6, s9
                  srli         a3, a4, 21
                  srli         t4, ra, 19
                  srl          t4, t6, t4
                  fmv.w.x      fs6, s1
                  lui          s1, 43057
	fsub.s	fs0, fs2, fa2, rne
                  and          tp, s6, t5
                  divu         a1, t4, t1
                  fsub.s       fs4, ft7, fs8, rtz
                  fadd.s       fs10, fa6, fs9, rdn
                  sltu         a5, ra, a1
                  slti         s6, tp, 684
	fadd.s	ft11, fa6, fs2, rne
                  slti         s1, s7, 812
                  fmin.s       fs9, fs10, fs9
                  mulhsu       t4, a4, t0
                  or           s5, s1, a6
                  or           s7, s11, t6
                  slti         s8, tp, 1275
                  add          t6, sp, s3
                  fmv.w.x      fs0, zero
                  mulhsu       a5, t6, s1
                  sub          a0, gp, s0
                  auipc        s5, 657517
                  slli         s7, gp, 31
                  mulh         a5, a7, a5
                  slli         s8, sp, 19
                  slti         a0, a0, -1231
                  fmax.s       ft8, ft1, fa6
                  sltiu        tp, s1, 1890
                  fsub.s       ft8, ft5, fs9, rmm
                  mul          s0, t4, tp
	fcvt.s.w	fs9, a1, rne
                  divu         s10, s5, ra
                  lui          t3, 459670
	fadd.s	ft0, ft3, ft6, rne
                  auipc        gp, 432016
                  lui          s5, 541154
                  add          s1, zero, s8
	fcvt.wu.s	t0, fa6, rne
                  srl          s9, s4, gp
                  remu         s7, a2, s6
                  fmv.x.w      a6, fa3
                  add          a2, a0, s8
                  mulhu        s9, s0, s2
                  or           zero, s2, s8
                  xori         a4, zero, -1350
	fadd.s	ft7, ft0, fs8, rne
                  slti         a1, a4, 198
	fcvt.s.w	fs0, s1, rne
                  srai         s1, t4, 28
                  mulhu        ra, s9, s5
                  and          gp, ra, s0
                  srli         a4, s3, 4
                  mulhsu       s1, t4, t2
                  nop
                  sltiu        s7, tp, 545
                  divu         a6, t6, s2
                  sll          t1, s2, s3
                  nop
                  lui          s9, 185235
                  fmax.s       fa6, fs5, fa3
                  fclass.s     t1, fs2
                  auipc        a1, 409857
                  mulhu        tp, s4, t4
                  fadd.s       ft9, fs5, fa5, rtz
                  srli         t3, zero, 14
                  ori          a6, a6, 341
                  and          s0, s2, s10
                  sub          zero, s3, s4
	fcvt.w.s	s6, ft0, rne
                  feq.s        gp, fs3, ft11
                  fmv.w.x      fa5, t2
	fsub.s	ft9, ft10, fs10, rne
                  fclass.s     t3, ft7
                  sltu         a1, s2, a7
                  fclass.s     t4, fs10
                  remu         a6, a3, s10
                  flt.s        s7, ft7, ft1
                  mulh         t4, s5, s1
	fsub.s	fa6, fa3, fa7, rne
                  auipc        t0, 685319
                  fcvt.s.wu    fa4, s9, rdn
                  xori         gp, s1, -941
                  srai         t0, s7, 6
                  sltiu        t1, a0, -1586
                  fcvt.s.w     fa2, a4, rtz
                  fle.s        s10, fs0, ft6
                  fadd.s       fs6, ft4, ft7, rtz
                  fcvt.s.w     ft3, s11, rup
                  add          gp, t1, s8
                  slt          gp, a6, s7
                  sub          a6, s11, t6
                  div          gp, tp, t0
                  sll          s8, s5, s7
                  fsgnj.s      fs1, ft7, fs4
                  feq.s        a7, fa2, ft10
                  mulh         s0, t0, a5
                  add          t1, tp, a0
                  nop
                  ori          a1, s10, -1458
                  fcvt.s.w     fa7, ra, rup
                  or           t6, s5, sp
                  andi         a0, s11, -1982
                  remu         ra, a0, zero
                  fcvt.s.w     fs5, s6, rmm
                  fsgnjn.s     ft0, fa0, fa0
                  fmin.s       fa5, ft5, ft1
                  fcvt.s.wu    ft5, s9, rup
                  andi         tp, s8, 1732
                  mulhu        s8, s0, t4
                  sll          sp, ra, ra
                  fsgnjx.s     fs6, fs7, fs5
                  sra          a2, a4, s10
                  sub          a0, s10, s6
                  fsgnjx.s     ft9, ft9, ft9
                  slti         s11, a4, 1995
                  ori          t4, a2, 1251
                  fmv.x.w      a4, ft5
                  slti         s5, t4, 1765
                  div          a5, gp, t1
                  fmin.s       ft2, fa1, ft1
                  nop
                  sub          s7, t1, t2
                  fmin.s       fs1, ft9, ft4
                  fsgnj.s      ft8, fa0, ft9
                  ori          s3, s4, 538
                  flt.s        s7, ft8, ft10
                  slti         t1, s4, -578
                  addi         s2, t1, -1515
                  ori          s6, s6, 1271
                  fsgnj.s      ft8, ft6, fa6
                  fsgnjn.s     fa2, ft3, ft9
                  fclass.s     s2, fs4
                  srli         s7, t2, 7
                  addi         a7, t2, 223
                  feq.s        s3, ft2, fs4
                  xori         sp, t2, 861
                  mulh         s5, s1, ra
                  fmv.x.w      t0, fs10
                  fsgnj.s      ft7, ft0, fs0
                  fmv.x.w      s9, fs10
                  mul          s5, t6, s9
                  srl          s0, s0, a7
                  fmv.w.x      fa2, s0
                  and          s2, s4, a3
                  feq.s        gp, fs2, ft11
                  rem          t3, t1, a3
                  div          a7, s6, t2
                  fcvt.s.wu    fa3, t6, rdn
	fadd.s	fs11, fs7, ft8, rne
                  xor          a0, s2, tp
                  srl          s3, gp, s10
                  srl          s2, t3, s1
                  lui          zero, 134661
                  sub          zero, s5, a4
                  fmax.s       ft2, fs6, fs11
                  srai         a1, zero, 15
                  mulh         ra, a7, a4
                  sltiu        sp, t4, 474
                  fle.s        s10, ft8, fs1
                  sltu         t4, s1, a1
                  fsgnj.s      fs9, fs5, ft6
                  xor          a7, a6, s8
                  fsgnjn.s     ft2, ft2, ft8
                  div          s0, s6, a4
                  addi         a3, t2, -805
                  add          s9, t5, s10
                  divu         t1, a7, ra
                  fmv.w.x      fs10, s7
                  flt.s        t3, ft8, fs7
                  slt          zero, a6, gp
                  remu         t1, ra, zero
                  sltu         a0, a7, s4
                  fmv.w.x      fa6, t0
                  fmax.s       fs4, ft7, ft9
                  slti         a5, a5, -1318
                  fcvt.w.s     gp, fs7, rne
                  mul          a0, a3, s4
                  fmv.x.w      s9, fa0
                  fmv.w.x      ft2, a0
                  slti         s9, s9, -1815
                  fmv.x.w      s10, ft9
                  fclass.s     s5, fa1
                  fmv.w.x      fa2, s3
                  sll          s2, a2, s11
                  sll          a2, a0, t2
	fcvt.s.wu	ft2, s7, rne
                  fmax.s       fs3, ft1, fs11
	fcvt.s.w	ft11, s4, rne
                  fclass.s     t4, ft6
                  remu         gp, s9, s4
                  mul          gp, zero, s1
                  sltu         ra, a1, t5
                  fmax.s       fa6, fa5, ft1
                  flt.s        a0, fa2, fs4
                  srai         gp, t6, 15
                  or           t3, t4, s0
                  sll          a7, s7, s6
                  sltiu        sp, t2, -1000
                  srl          s0, a4, a4
	fadd.s	ft4, ft5, fa4, rne
                  fsgnjn.s     fa0, fs10, ft3
                  auipc        s2, 427871
                  and          a2, s10, t1
                  flt.s        tp, fs8, fs1
                  feq.s        s7, fa2, ft0
                  slti         s11, s10, 892
                  sll          s7, s11, s10
	fcvt.s.w	fs11, t3, rne
                  fadd.s       ft5, fs7, fs6, rmm
                  sltiu        s9, t2, 1465
                  mulh         sp, zero, gp
                  sra          a6, tp, ra
                  ori          a0, s2, 1027
                  fcvt.s.wu    fa4, s0, rmm
                  sub          a7, a6, s11
	fcvt.s.wu	fs6, t3, rne
                  fmin.s       ft4, fs2, fa7
                  slli         a6, a4, 2
                  fsgnj.s      fs7, fa1, ft0
                  xor          a6, a2, t0
                  auipc        a2, 158566
                  auipc        s11, 1004947
                  fsgnjx.s     fa5, fa7, ft7
                  fmax.s       fa5, fs7, fa2
                  sltiu        t3, t2, -1725
	fsub.s	ft2, fs3, ft8, rne
                  fmax.s       ft2, ft4, fs0
                  fsgnjn.s     fa3, ft0, fs10
                  slti         gp, t3, -296
                  addi         t0, sp, 1256
                  slli         s5, a5, 0
                  and          s2, a1, a4
                  xor          gp, a4, s2
                  srl          t1, a1, t4
                  xori         s10, t3, -1789
                  srai         gp, s4, 23
                  sll          a3, s8, s8
                  feq.s        a2, ft11, fa6
                  srai         a3, s11, 4
	fadd.s	fa6, fs9, fs9, rne
                  lui          a3, 949328
                  rem          s11, t1, t6
                  srai         s9, s9, 9
                  flt.s        a1, fa6, fs4
                  srli         a6, a7, 28
	fadd.s	fs4, ft7, ft4, rne
                  divu         t4, sp, s10
                  div          t3, t2, a2
                  fsgnjx.s     fs4, fa4, ft8
                  auipc        a5, 502237
                  fcvt.wu.s    gp, fa4, rup
                  fsgnjx.s     fs9, fs10, ft7
                  sll          s7, s9, s7
                  srl          ra, ra, a3
                  div          ra, sp, a1
                  fmv.w.x      fs6, sp
                  xor          s6, s1, a3
                  mul          a2, sp, s0
                  lui          zero, 433304
                  sltu         s1, a5, t2
                  fmax.s       fs11, fs0, fs2
                  slli         a7, s4, 24
                  slt          a2, a3, s10
                  sll          s3, a2, s3
                  ori          s2, s6, 441
                  addi         s0, gp, 1029
                  flt.s        a7, ft8, ft10
                  div          t6, s7, s7
                  fsgnj.s      fa4, fa6, ft3
                  lui          t1, 116056
                  sra          s2, a7, a6
                  add          s11, s6, t6
                  fsgnjx.s     ft0, fa5, ft1
                  srai         a7, s2, 19
                  fmv.w.x      fs5, s1
                  rem          a6, s3, s6
                  nop
                  sub          a4, a1, t2
	fadd.s	fa2, ft10, ft5, rne
                  xori         sp, a0, -1645
                  remu         gp, gp, sp
                  div          a0, a2, a0
                  fmin.s       fs5, fs2, ft4
                  srli         a6, s3, 28
                  and          a6, a1, s11
                  div          a5, tp, t2
                  add          s0, t2, s4
                  slti         a7, t1, -1150
                  auipc        s6, 857445
	fcvt.s.wu	ft0, zero, rne
                  lui          a1, 785190
                  fle.s        s2, fs6, fs8
                  fmv.w.x      ft0, s6
                  and          s10, s0, a1
                  or           s3, t2, a1
                  xori         t0, gp, 1401
                  sltu         s0, t4, s5
                  auipc        s7, 81959
                  fmv.x.w      s2, fa2
                  lui          a2, 987172
                  ori          s1, t1, 1720
                  srai         tp, a3, 7
                  addi         s2, s3, 796
                  or           a1, t5, a2
                  xori         s1, s5, 1709
                  ori          s9, s2, -1887
                  fmax.s       fa2, ft11, fs10
                  fsgnj.s      fa6, ft2, fs5
                  xori         a1, a7, 1815
                  sub          a2, a6, t2
                  addi         s1, t2, 226
                  div          a0, s3, ra
                  andi         sp, t5, 259
                  ori          a0, s8, -600
                  sub          t1, s11, a7
                  flt.s        a7, ft8, ft11
                  addi         s2, s5, -175
                  sltiu        a2, s8, -1100
                  andi         t3, t3, -927
                  fadd.s       fa6, ft8, ft2, rdn
                  fcvt.w.s     s5, fa6, rmm
                  sll          t1, a3, a4
                  add          s7, a1, s7
                  divu         s9, s4, s0
                  fmax.s       fa6, fa5, fa2
                  sltu         s5, tp, s0
                  and          s8, s0, s5
                  xori         t3, s11, 29
	fsub.s	fa1, fs0, fs8, rne
                  fmv.w.x      fs2, ra
                  nop
                  and          tp, a2, a7
                  flt.s        s0, fa4, fs10
                  addi         s0, a6, 694
                  sll          s7, s3, a4
                  mul          a2, sp, ra
                  fclass.s     a7, ft2
                  fsgnjn.s     fs6, ft5, fa1
                  flt.s        s9, fa1, fa1
                  srai         s3, a0, 26
                  lui          s0, 491622
                  fle.s        t4, fs4, fa4
                  fadd.s       fs4, ft5, fs11, rtz
                  divu         a0, s10, s5
                  nop
                  fcvt.w.s     t1, ft7, rup
                  mulh         zero, a5, a2
                  fclass.s     s0, fs2
                  fmax.s       fs6, fs5, fs10
                  auipc        t4, 788396
                  addi         t4, s11, 982
                  fmax.s       fs4, fa4, fs1
                  fclass.s     s3, fs5
                  fsgnj.s      fs8, fs6, fs6
                  mul          t0, s1, ra
                  auipc        t4, 829554
                  fmax.s       fs4, fs6, fa5
	fcvt.w.s	s3, fs7, rne
                  sltiu        a0, s1, -130
                  mulh         a6, tp, sp
                  fmv.w.x      fa2, t0
                  slt          t1, a4, a5
                  divu         t6, s6, s11
                  fsgnj.s      ft3, fa2, fa3
                  fadd.s       fs5, ft10, fs6, rne
                  addi         t4, gp, -684
                  feq.s        s3, fs4, fs1
                  and          s10, t4, a4
                  fcvt.w.s     tp, ft10, rdn
                  mulhu        a6, a2, t0
                  rem          gp, t5, t1
                  sltiu        s1, a4, -1367
                  mul          sp, t2, t5
                  fsgnjx.s     fa5, ft0, fa1
                  fmv.x.w      s9, fs5
                  mulhsu       t0, a2, t4
                  mul          s8, a0, t6
                  feq.s        s1, fs0, fs4
                  xor          a6, a3, a4
	fcvt.s.wu	ft6, s9, rne
                  div          a4, a3, a2
                  nop
                  fadd.s       ft2, ft4, ft11, rmm
                  fmv.x.w      s10, fs6
	fcvt.wu.s	t0, ft10, rne
                  fmv.w.x      ft4, s3
	fcvt.s.w	ft8, zero, rne
                  mulhsu       a4, s9, s4
                  srli         tp, gp, 12
                  fmv.w.x      ft4, sp
                  fcvt.wu.s    s7, ft9, rtz
                  div          a1, s7, s4
                  addi         a5, t3, -892
                  srli         t6, t2, 29
                  ori          a6, s5, 194
                  lui          s8, 444234
                  slli         s2, t0, 26
                  divu         gp, a5, gp
                  andi         a2, s6, -66
                  fclass.s     ra, fs0
                  srl          sp, t3, ra
                  nop
                  sltiu        a7, s11, 1568
                  mul          t6, a1, t5
                  lui          s7, 940850
                  fsgnjx.s     fs1, fs2, fa0
                  fcvt.w.s     sp, fs4, rdn
                  flt.s        ra, ft3, ft8
                  fsgnjx.s     ft4, ft1, ft8
                  mulh         a2, s5, s8
                  fmax.s       fs9, ft4, ft9
                  and          s9, s7, a5
                  slt          s11, s10, a6
                  fmv.w.x      fa7, s0
                  lui          t0, 857165
                  fsgnjn.s     ft6, fs6, ft8
	fadd.s	fa0, fs1, fs7, rne
	fadd.s	fs5, fs2, fa2, rne
                  mulh         zero, t4, s6
                  andi         a0, s9, -471
	fcvt.w.s	s11, ft4, rne
                  div          s0, sp, s5
                  add          gp, s3, t5
                  auipc        a1, 170004
                  addi         s8, sp, -25
                  or           t6, s5, s3
                  sltiu        s11, t1, -731
                  xor          s1, s3, s11
                  fmv.x.w      t6, ft5
                  fcvt.w.s     t6, fa7, rtz
                  fcvt.s.w     ft1, tp, rup
                  mulhu        a5, t3, tp
                  fmax.s       fs10, ft0, fa6
                  rem          ra, a1, s0
                  xori         ra, s3, 738
                  srl          a3, s11, t4
                  fclass.s     sp, ft4
                  sltu         gp, t0, a4
                  mulh         t3, s4, t0
                  fclass.s     a5, ft1
                  flt.s        zero, fs9, fs5
                  fmin.s       ft7, ft3, fs6
                  mulhu        tp, s6, s4
                  or           sp, a0, t4
                  addi         a5, s7, -1884
                  sll          tp, sp, s2
                  srli         t0, a1, 28
                  or           s8, a5, a0
                  rem          tp, a5, gp
                  fclass.s     s6, fs7
                  sltu         sp, s8, t0
                  srli         t4, s6, 3
                  slti         s9, s10, 1542
                  xor          s0, t6, t1
	fsub.s	fs0, ft5, fa4, rne
                  sll          s2, s9, t3
                  srl          gp, s1, t5
                  fcvt.s.w     ft3, s10, rmm
                  slt          s10, s6, s0
                  sltu         t1, tp, sp
	fcvt.wu.s	a1, ft0, rne
                  mulhu        s6, s0, t0
                  feq.s        sp, fs9, fs7
                  auipc        t0, 365219
                  fmv.x.w      s0, ft3
                  mulhu        s6, s6, a4
                  remu         a6, s10, s5
                  fmv.w.x      fs5, ra
	fsub.s	fs6, fs4, ft0, rne
                  fsub.s       ft10, ft8, fs3, rup
                  rem          s3, s7, s11
                  fsgnj.s      ft6, ft9, ft1
                  auipc        s0, 376009
                  sub          s0, t6, s2
                  div          s2, t0, s4
                  div          zero, t5, s7
                  or           s7, ra, t4
                  feq.s        a7, fs1, fs5
                  fmv.w.x      ft5, a3
                  fcvt.s.wu    ft2, a6, rdn
                  add          tp, s4, t3
                  mulh         s2, t2, s7
                  andi         a1, a0, 440
                  fsgnjn.s     ft6, fs10, fa2
                  sll          a2, a1, s11
                  fsgnj.s      fs10, ft8, ft6
                  slli         a5, a0, 18
                  slt          s3, s7, t4
                  fclass.s     gp, ft9
                  flt.s        t6, ft7, ft0
                  mulhsu       a6, a3, s5
                  or           s5, a1, t4
                  fclass.s     gp, ft4
                  xor          t6, t3, t3
                  sltu         a5, t5, zero
                  mul          a7, s11, a2
                  xori         s5, t6, -219
                  sra          a5, ra, s4
                  feq.s        s8, ft3, fa2
                  fmv.x.w      s6, ft6
                  div          a7, a5, s9
	fcvt.w.s	a4, ft9, rne
                  slt          t3, s11, a1
                  or           tp, s8, t3
                  fclass.s     s2, ft4
                  and          t0, s5, s11
                  rem          t6, s0, s5
                  remu         s9, a6, tp
                  sltiu        a0, tp, -1416
                  fcvt.w.s     s9, ft3, rup
                  andi         s5, a6, -98
                  nop
                  rem          t3, a6, a3
                  add          t0, t1, sp
                  fsgnjx.s     fs0, fa0, fa7
                  mulhsu       t6, a5, a2
                  mulh         s10, t2, gp
                  fmv.w.x      ft9, a3
                  srli         a0, tp, 8
                  xori         a0, a7, -1974
                  srl          a0, s0, s7
                  fsgnj.s      ft6, fs1, fs9
                  srai         t3, ra, 4
                  fcvt.s.w     fs4, s4, rne
                  add          s0, s4, s5
                  fsgnj.s      fs11, ft7, fs7
                  lui          s9, 862070
                  mulh         t3, s4, t4
                  fcvt.s.w     ft10, s6, rmm
                  auipc        a0, 144383
                  fcvt.w.s     ra, fs4, rdn
                  sra          sp, a1, t2
                  fclass.s     a1, fs1
	fadd.s	fa5, fs6, fa7, rne
                  lui          tp, 358071
                  slt          sp, a7, s5
                  mul          a7, s3, s5
                  mulhsu       t6, s5, t4
                  sub          a5, tp, ra
                  mulhsu       tp, t1, s4
                  mulhsu       a0, s5, t5
                  divu         a4, a5, s9
                  div          a6, s0, gp
                  sra          sp, a0, s0
                  fsub.s       fs10, fs4, fa0, rtz
                  sll          s11, t5, tp
                  sub          tp, s9, s10
	fadd.s	fs10, fs4, fs7, rne
                  fmin.s       fs5, fa5, ft11
                  auipc        t3, 239984
                  lui          s0, 175262
                  ori          tp, s4, 1569
                  rem          a2, s11, t1
                  fsgnj.s      ft8, fa6, fs11
                  fadd.s       ft9, fs8, ft10, rne
                  slt          a6, t1, a7
                  or           s3, ra, zero
                  nop
                  fcvt.wu.s    t3, fs7, rup
                  fsgnjn.s     ft11, fa5, fs2
                  divu         tp, a0, s9
                  slli         tp, a3, 3
                  fcvt.s.w     fs6, gp, rmm
                  mulh         a1, s9, a5
                  fsgnjx.s     fs11, ft4, ft11
                  nop
                  fle.s        s6, fs6, ft8
                  slli         sp, tp, 18
                  mulhsu       a3, a1, t5
                  slti         s6, t5, -2003
                  divu         s7, a7, a0
                  fsgnjx.s     fs7, ft1, ft2
                  fmax.s       fa4, ft2, ft9
                  rem          zero, a5, t2
                  fmv.w.x      ft8, s5
                  fclass.s     s1, ft1
                  sll          s0, s7, a6
                  fsgnjx.s     fa5, fs2, ft0
                  fle.s        a6, ft5, fs3
                  mulh         t4, a0, a3
                  mulhu        a4, t5, s10
                  srl          t0, s0, zero
                  srai         s11, s1, 17
                  flt.s        a6, fs0, ft5
                  fadd.s       fs7, ft11, fs5, rdn
                  rem          a6, s5, s1
                  xori         a0, a0, 27
                  fle.s        t4, fs11, fs4
                  fcvt.s.wu    fs3, s5, rmm
                  fcvt.wu.s    t1, ft0, rtz
                  fsgnj.s      ft8, fa0, fs3
                  ori          s8, a5, 875
                  sltiu        a4, t2, 981
                  div          s3, s10, t0
                  andi         zero, s5, -155
                  fmv.x.w      t0, fa5
	fcvt.s.wu	ft3, gp, rne
                  and          s6, s6, s8
                  mulhsu       sp, ra, t6
                  slli         t4, s0, 17
                  fsgnjx.s     ft3, ft4, fs7
                  fcvt.wu.s    t0, fs6, rtz
                  fmax.s       fa5, ft3, ft6
                  sltiu        s3, t6, 1743
                  feq.s        zero, fs11, fa4
                  sll          t1, s2, s6
                  ori          a2, zero, 1996
                  mulhsu       a4, s3, s2
                  xori         s3, t4, -487
                  slti         t0, s7, -1944
                  fmv.x.w      s10, fs5
                  fmv.x.w      a5, fa3
                  fmin.s       ft4, fa1, fa0
                  sll          t1, tp, a7
                  andi         s10, s9, -379
                  fmax.s       fa4, ft3, fa2
                  fmv.x.w      sp, fa5
                  sra          t3, a5, s10
                  fmv.w.x      fs3, t0
                  slt          s8, ra, s2
                  mulh         t6, s9, t2
                  and          s0, t1, s2
                  sltu         zero, a1, a6
                  ori          t1, s2, -1843
                  mulhu        a7, t5, a4
                  fmv.w.x      fa1, s6
                  div          a5, a3, s4
                  mulh         ra, ra, s5
                  remu         a0, t4, a0
                  slt          t3, tp, a1
                  remu         s7, s10, t2
                  xor          a2, t0, s4
                  slti         s11, sp, 1481
                  ori          t6, t4, -325
                  mulhu        s0, tp, a2
                  fle.s        t0, ft3, ft4
	fsub.s	fs8, fs8, ft1, rne
                  addi         t3, a6, -260
                  fsgnjn.s     ft3, fs0, fa1
                  sra          a0, t3, t4
                  srli         tp, a3, 1
                  lui          s6, 106238
                  fclass.s     s10, fs10
                  fmv.x.w      t1, fs0
                  feq.s        t1, ft0, fs1
                  fmv.w.x      fs5, s7
                  add          a7, s8, s9
                  slti         s11, s11, 673
                  sra          s2, a0, t4
                  slli         s10, a3, 25
                  sltiu        a6, t0, 1286
                  div          a6, s2, sp
                  fsgnj.s      ft0, fs2, ft5
                  fmv.w.x      fa5, a0
                  mulhu        a2, s3, s0
                  auipc        t4, 589789
	fcvt.w.s	s3, fa0, rne
	fcvt.w.s	s11, fa5, rne
                  nop
                  auipc        zero, 81935
                  flt.s        s0, ft4, ft2
	fsub.s	ft3, fs3, ft0, rne
                  mulh         s8, ra, t2
                  xor          s2, s11, s1
                  add          a2, s5, s9
                  fcvt.s.wu    fs3, s0, rne
                  fle.s        a6, ft11, fs11
                  fcvt.s.w     fa1, s5, rne
	fcvt.s.w	fa1, s2, rne
	fcvt.s.w	ft10, s5, rne
                  addi         s11, zero, 228
                  xor          a5, gp, zero
                  slti         t1, t4, 1384
                  divu         t4, tp, gp
                  xor          s6, a2, t2
                  or           a2, t3, a0
                  srl          zero, a4, s9
                  slli         zero, t0, 18
                  andi         a5, s7, -919
                  sll          s11, tp, a7
                  feq.s        a2, fa6, fs11
                  add          zero, s10, t3
                  srai         ra, a2, 23
                  mulhsu       zero, a3, s7
                  slli         t4, a1, 13
                  fsgnjn.s     fs10, fs8, ft6
	fcvt.s.wu	fs3, s1, rne
                  slli         t3, s11, 12
                  fclass.s     a0, fa5
                  div          gp, s10, s3
                  slti         s7, s10, -498
                  and          a7, zero, s4
                  srli         ra, s0, 24
                  slt          tp, t1, t3
	fcvt.w.s	s9, fa6, rne
                  nop
                  andi         s0, s0, -698
                  fsgnj.s      ft9, ft3, ft8
                  fsgnjn.s     ft8, fs9, fs6
                  rem          ra, t4, tp
                  sub          ra, s7, t1
                  ori          zero, t3, 1973
                  mulhsu       a2, s2, tp
                  xori         a7, sp, -1868
                  sub          zero, a7, s11
                  srli         s6, t1, 22
                  mul          sp, a1, s7
                  and          a6, s1, a2
                  mul          a3, t4, a7
                  sub          t6, s5, t4
                  fcvt.wu.s    s10, fs8, rtz
                  srl          s7, a1, a6
                  addi         t4, tp, 1537
                  slti         a4, tp, -1855
                  mul          tp, s6, t2
                  and          s9, s10, s9
                  flt.s        gp, fa6, fs9
                  xori         a5, s1, -938
                  rem          s6, a4, s4
                  sra          a3, s3, s0
                  sltu         t1, s3, s9
                  fcvt.wu.s    zero, ft3, rup
                  slti         t6, t4, 1871
                  or           gp, t6, t3
                  ori          s10, a4, -33
                  nop
                  sltu         a2, s11, a7
                  fsgnj.s      ft2, ft8, fa7
                  div          a4, t0, s1
                  fcvt.wu.s    zero, fs0, rtz
                  fle.s        s7, fs1, ft11
                  slt          t4, a1, s6
                  xori         a1, zero, -1284
	fcvt.wu.s	a7, fs9, rne
                  fmv.x.w      a6, ft2
                  fmax.s       ft1, fa5, fa0
                  nop
                  xori         s0, t1, 309
                  rem          sp, a4, t3
                  xori         a7, a6, -1590
                  flt.s        a4, ft2, fa1
                  srli         a0, s7, 9
                  fcvt.w.s     t6, fs5, rtz
                  srli         s0, t5, 30
                  srl          zero, a4, t6
                  auipc        a6, 887983
                  mul          a3, s7, a1
                  nop
	fcvt.s.w	ft10, tp, rne
                  add          s3, t2, a7
                  sll          t4, s10, s3
                  fsgnjn.s     ft6, fs8, fs0
                  sub          s3, s6, t4
                  fcvt.wu.s    gp, fs3, rdn
                  xori         s6, zero, -844
                  sub          a1, s0, a2
                  xor          a4, t4, s6
                  fle.s        sp, fa7, fa7
                  srl          a2, tp, gp
                  lui          s9, 695529
                  fcvt.s.wu    fa7, t2, rne
                  fsgnj.s      fa1, ft3, fs0
                  sltu         s9, t4, s7
                  xori         a1, s11, -60
                  sltiu        s5, s0, 1578
                  fsgnjx.s     ft3, ft2, fs4
                  sra          t0, s0, t6
                  fmin.s       ft1, ft6, fa3
                  sltu         t0, a0, s1
                  fmin.s       fa6, ft11, fs4
                  fclass.s     s0, ft4
                  lui          s9, 564391
                  fsgnjx.s     fs0, fa1, ft8
                  fsgnjx.s     ft9, fa4, fs5
                  sll          s11, t5, a3
                  rem          a1, s5, a5
                  nop
                  rem          s5, sp, s3
                  andi         t3, s0, -775
                  xor          a0, t2, s8
                  mulh         s3, t5, t0
                  or           sp, sp, t4
	fcvt.s.wu	fa6, t2, rne
	fcvt.s.wu	ft11, a0, rne
                  fmv.w.x      fs9, gp
                  slli         a4, tp, 23
                  fmax.s       ft4, fs11, fa5
                  and          ra, t4, s11
                  fsgnjx.s     fa7, fa7, fs3
                  slti         s2, s5, -729
                  div          a6, s6, s3
                  fmv.w.x      fs4, a2
                  slt          s11, s11, s4
                  fsub.s       ft6, fs3, fa2, rne
	fcvt.s.wu	fs2, a0, rne
                  fsgnjn.s     ft11, ft5, fs0
                  nop
                  fmax.s       fs1, fs5, fa7
                  and          zero, s10, zero
                  slt          t0, s4, zero
                  fmv.w.x      fs1, a4
                  fclass.s     a4, ft4
                  and          tp, s2, a5
                  fsgnjx.s     fa3, ft3, fs5
                  xor          a4, a1, s5
                  fcvt.s.wu    ft7, t3, rtz
                  srl          a5, tp, s9
                  divu         s10, s5, sp
                  fle.s        tp, ft4, fa2
                  mul          a4, t3, zero
                  mulhsu       s7, a0, s3
                  divu         a5, s3, t5
                  srli         s11, sp, 5
                  auipc        a6, 380319
                  fsgnjx.s     fa6, fs0, fs1
                  sub          s7, s7, s11
                  and          s2, s0, ra
                  div          s6, s1, a5
                  mulh         tp, a3, a1
                  fsgnjx.s     fs7, fs4, ft7
                  fmax.s       fs7, ft1, fa6
                  mulhsu       s9, s8, t0
                  fcvt.s.wu    fs11, t1, rdn
                  andi         t1, gp, -677
                  divu         a3, t3, s2
                  slli         t0, gp, 28
                  slt          s9, a1, s6
                  fmin.s       ft5, fs2, fs6
                  andi         t4, s10, -414
                  feq.s        a5, ft0, ft6
                  mulhsu       t6, t3, a6
	fcvt.wu.s	gp, ft6, rne
                  lui          s9, 940748
                  fsgnj.s      fs7, ft5, ft9
                  sll          s1, s11, s11
                  fmv.w.x      ft3, a6
                  slti         s9, zero, 1229
                  mulhsu       s3, a6, sp
	fcvt.wu.s	t3, ft9, rne
                  fsgnjn.s     fs8, ft0, fa6
                  sub          s1, ra, a3
	fcvt.wu.s	s3, ft8, rne
                  remu         t1, t6, gp
	fcvt.wu.s	s8, fs8, rne
                  nop
	fadd.s	ft5, fs11, fs5, rne
                  flt.s        a5, ft8, fs0
                  add          a1, t1, s7
                  fsgnj.s      ft11, ft3, ft7
                  auipc        a3, 835405
                  flt.s        t6, fs7, ft0
                  div          s5, s11, a6
                  fclass.s     s6, fs3
                  mulhsu       gp, t5, t5
                  fcvt.w.s     a5, ft1, rdn
                  slt          s11, s9, s1
                  fsgnjx.s     fs1, ft5, fa3
                  fclass.s     gp, fa1
                  remu         t4, a1, zero
                  sltiu        s3, gp, 1464
                  fsub.s       fs7, fs1, fs2, rtz
                  fmax.s       ft8, ft7, fa4
                  feq.s        t0, fa3, fa0
                  auipc        s10, 252171
                  flt.s        s1, fs2, ft3
                  lui          a1, 663467
                  slt          a3, s6, sp
                  div          tp, a4, s11
                  and          s9, t3, ra
                  srl          t0, s5, t3
                  slli         a1, a5, 25
                  fsgnjn.s     fs10, fs3, fa5
                  srai         tp, a2, 26
                  slti         a2, s6, -430
                  sll          t3, t5, t4
                  andi         t4, t1, 1220
                  rem          s2, s0, s8
                  srai         t3, t4, 13
                  xori         a1, t0, 1768
                  addi         s7, tp, 972
                  slli         s5, s6, 14
                  sub          tp, a3, s3
                  remu         t6, gp, a2
                  sll          tp, a3, t6
                  mul          s8, a6, s3
                  addi         tp, a0, 608
                  slti         t1, a6, -531
                  srai         s11, s2, 12
                  fcvt.s.wu    fs5, s11, rtz
	fcvt.s.w	fs9, a4, rne
                  andi         s7, t5, 183
                  or           t1, sp, s10
                  slt          zero, s2, s2
                  rem          s0, t1, a4
                  fsgnj.s      fa1, ft4, fs0
                  remu         s9, a5, s5
                  fcvt.s.wu    fs8, a0, rdn
                  slti         t0, s8, -261
                  rem          s10, ra, t6
                  fsgnjx.s     fa0, fa3, fs6
                  auipc        t0, 237697
                  sll          t6, a1, s1
                  or           s5, s0, a3
                  rem          t4, s0, s9
                  add          s10, s3, a2
                  sltiu        s3, a1, 1156
                  slli         a6, s8, 9
                  xori         a2, a4, 1753
                  xori         gp, s1, 781
                  fclass.s     s1, fa2
                  sub          t1, a2, a7
                  xor          gp, gp, a4
                  lui          s8, 669952
                  remu         gp, t5, s7
                  slli         s10, gp, 11
                  fmv.x.w      a1, ft5
                  fcvt.s.w     fs6, s8, rtz
                  fmv.x.w      tp, fs3
                  sub          s1, s8, t3
                  mulh         s11, a1, t0
                  slt          zero, t0, tp
                  auipc        s7, 543879
                  srli         s11, zero, 27
                  fmin.s       ft4, fs3, fa7
                  fmv.w.x      fs7, s0
                  add          s0, tp, s2
                  fcvt.s.w     fs0, a3, rup
                  fmv.x.w      a3, fs5
                  sra          t0, a4, zero
                  fmv.w.x      ft2, a0
                  fmv.w.x      fs9, a6
                  add          t6, a4, a5
                  nop
	fadd.s	fa1, fs6, fs6, rne
                  andi         a5, t5, 1772
                  rem          sp, s6, zero
                  fcvt.w.s     s5, fa5, rtz
                  sltiu        s3, s8, 830
                  fsub.s       ft5, ft1, fs4, rup
	fcvt.w.s	ra, ft9, rne
                  fle.s        s9, fs8, fs8
                  ori          t6, t5, -1217
                  sub          s10, gp, s0
                  remu         s2, s8, a4
                  mulhsu       t3, sp, zero
                  addi         s10, a7, -2045
                  sub          s6, s6, a6
                  or           a7, a3, zero
	fcvt.s.wu	fa2, t5, rne
                  andi         a4, s4, 594
	fcvt.s.w	ft4, t4, rne
                  xor          t0, t1, gp
                  fsgnj.s      fs7, ft11, ft5
                  fsgnjn.s     fs3, ft10, fa7
                  or           s1, t1, sp
                  sltiu        s2, s8, -1996
                  sll          sp, t5, a7
                  fmv.w.x      fa3, s9
                  feq.s        sp, fa4, fs3
                  xori         s11, zero, 1752
                  mulh         tp, a6, s3
                  fcvt.s.w     fa0, zero, rmm
                  fclass.s     a4, fa4
                  div          s11, a1, s8
                  fle.s        s6, fa4, fa1
                  feq.s        s9, ft5, ft11
                  fsgnj.s      fs2, ft3, fa1
                  sra          s1, s2, a6
                  fsgnjx.s     ft4, ft1, fa7
                  fmv.w.x      fs0, tp
                  auipc        s6, 183165
                  mul          a1, tp, a2
                  mulhu        t0, sp, s3
                  fsgnjx.s     ft4, fa5, fa3
                  auipc        s8, 959825
                  sub          a7, s9, s1
                  srai         a1, t4, 18
                  sra          a2, t6, tp
                  addi         s6, zero, -953
                  auipc        s11, 51195
                  srli         ra, t6, 30
                  mulh         t6, t2, s2
                  nop
                  divu         a1, gp, a4
                  lui          t6, 316115
                  fmax.s       fs4, ft1, fs9
                  sub          a1, s2, a0
                  fmv.w.x      ft3, t1
                  sltu         gp, gp, s7
                  fsgnjn.s     ft6, ft7, fs6
                  addi         s9, s2, -345
                  nop
                  fle.s        ra, fs8, fa5
                  sub          ra, a2, a1
                  slli         zero, ra, 8
                  sub          a3, a4, a2
                  fadd.s       fa6, fa5, fa2, rtz
                  addi         a5, ra, 1815
                  mul          a3, a1, ra
                  add          zero, a1, t1
                  sltu         t4, a0, tp
                  addi         a6, gp, 497
                  auipc        t1, 216489
                  andi         s9, t0, -823
                  fclass.s     s0, fs5
                  divu         a7, t5, s6
                  xor          s3, t2, t1
                  sltiu        a0, a4, -354
                  sll          t6, s4, a5
                  div          a0, sp, s5
                  feq.s        s7, ft6, fs5
                  slt          a5, tp, ra
                  fcvt.wu.s    sp, fa3, rmm
                  fcvt.s.wu    ft5, s5, rup
                  fmin.s       fa6, ft2, ft10
                  sll          s10, s7, t2
                  slli         t0, gp, 14
                  fcvt.w.s     t3, fa0, rtz
                  addi         s3, t5, -947
                  xor          a5, a5, a5
                  fle.s        tp, fs8, fs6
                  srai         a3, a2, 27
                  rem          t3, a0, s8
                  sltiu        t1, a6, 2034
                  auipc        s1, 560824
                  xori         ra, s11, -1170
                  sra          a0, s5, t3
                  mul          s1, t4, tp
                  sltiu        a0, a4, 673
                  slli         tp, s3, 1
                  fmv.w.x      fa0, a0
                  fsgnjx.s     ft4, ft2, fs2
                  xori         zero, s1, -1645
                  mul          t3, zero, a1
                  nop
                  sll          s9, tp, s4
                  div          a0, a1, a2
                  fmv.w.x      ft5, t2
                  divu         s1, t5, a1
                  srl          a7, s8, gp
                  mulh         zero, s0, s9
                  slti         s8, s8, 1541
                  fsgnjx.s     fs10, ft4, ft5
	fcvt.s.w	ft3, t5, rne
                  fmin.s       fs7, ft7, fs7
                  fmv.x.w      a2, fa6
                  mul          s6, s6, s8
                  sll          sp, t4, a6
                  or           gp, s7, s8
                  mulhu        s6, s1, ra
	fadd.s	fa4, ft5, fs3, rne
                  sub          a6, s11, a5
                  fle.s        s5, fa7, ft9
                  fsgnjx.s     ft10, fs8, fa1
                  addi         zero, s8, -47
                  and          a3, sp, s9
                  auipc        t6, 230313
                  add          gp, t5, t0
                  fadd.s       ft7, ft8, ft8, rdn
                  ori          s5, a5, 1792
                  lui          a4, 836671
                  fmax.s       fs11, ft2, fa5
                  fcvt.w.s     a5, ft4, rmm
                  addi         s11, t6, -1404
                  mulh         s0, a0, ra
                  sub          a1, gp, s4
                  sltiu        s7, s1, 1304
                  sra          a0, t5, s8
                  srl          sp, s0, s9
                  fmin.s       fs8, fs9, fs5
                  ori          t6, t0, 873
                  xor          s0, t1, a3
	fadd.s	ft9, fs7, fs4, rne
                  lui          a0, 863579
                  srl          s7, zero, s11
                  fmv.w.x      fs8, a6
                  slt          t4, a2, a0
                  rem          ra, s11, s5
                  mul          gp, s1, t1
                  and          s10, s10, s2
                  flt.s        a1, fa5, fa4
                  srl          s9, s3, s4
                  sub          s10, a2, s5
	fsub.s	ft0, fa5, fs7, rne
                  srli         s9, t0, 6
                  sltu         a1, s2, a1
                  fcvt.s.wu    fa7, tp, rmm
                  fcvt.s.w     fa6, a7, rup
                  sub          s7, s9, s9
                  slli         s6, s6, 25
                  feq.s        a1, fa3, fa4
                  mulh         gp, zero, t3
                  auipc        a3, 355407
                  nop
                  slt          a4, s4, s9
	fadd.s	ft9, fa2, fs7, rne
                  fsgnjn.s     fa3, fs4, ft0
	fcvt.wu.s	a4, ft0, rne
                  nop
                  div          s7, s6, t3
                  slli         s6, t5, 11
                  fmv.w.x      fs5, sp
                  sltiu        a2, a3, 699
                  fcvt.s.w     ft6, tp, rdn
                  fclass.s     s1, fa1
                  fadd.s       fs5, fs0, fs6, rup
                  sltiu        s5, s8, 759
	fcvt.s.wu	fs8, a7, rne
                  addi         t4, t5, 1811
                  sub          a2, s2, t3
                  lui          a7, 78389
                  add          t0, a7, t2
                  fmv.w.x      fs9, s6
                  xor          zero, s3, s9
                  or           s7, s7, t5
	fadd.s	fs3, ft9, fa7, rne
                  fcvt.w.s     s0, ft5, rdn
                  fsgnj.s      fa1, ft8, fs5
                  sltiu        a5, t4, 268
                  fmv.w.x      fa7, t3
                  fcvt.s.wu    fa3, t0, rne
                  sll          t4, t3, s4
                  slt          a7, a5, s2
                  addi         t4, s1, -545
                  slti         s8, s11, -1139
                  feq.s        a4, fa3, fa1
                  fmv.w.x      fa2, s3
                  fle.s        t0, fa7, fa1
                  fsgnj.s      fs6, ft8, fs10
                  divu         a5, tp, t1
                  fcvt.s.w     fs7, a6, rdn
                  mulhsu       t0, s6, t1
                  fmv.w.x      fs6, t1
                  and          t0, s9, s0
                  slli         s5, s2, 31
                  flt.s        s11, fs4, fs4
                  mulh         s10, a6, s0
                  add          a5, a7, s10
                  fcvt.s.w     fa3, a5, rne
                  rem          a2, s3, t5
                  fmv.w.x      ft7, s5
	fsub.s	fs9, fs10, ft3, rne
                  slti         s7, s6, 1173
                  mulhu        s5, a4, gp
                  add          sp, a6, a2
                  mulh         t3, t5, t4
                  fmv.x.w      s9, fs0
                  fsub.s       ft9, fa1, fa1, rtz
                  fmax.s       ft1, ft7, fa5
                  mulhu        s2, t4, a6
                  fcvt.wu.s    s7, fa2, rtz
	fcvt.wu.s	a4, fs7, rne
                  sltu         t0, s11, a5
                  or           a2, s10, s9
                  mulhu        s10, s2, s3
                  sltu         s8, s0, s7
                  rem          a7, s1, t4
                  feq.s        s1, ft10, fa7
                  ori          s3, s6, -452
                  rem          s11, t1, s10
                  rem          s6, s7, t3
                  sra          t4, s2, a3
	fcvt.wu.s	gp, ft9, rne
                  addi         s8, s9, -1615
                  fcvt.s.wu    fs6, a1, rmm
                  fcvt.s.wu    fs11, s4, rne
                  fmin.s       fa2, fs7, fa4
	fcvt.wu.s	a2, fs4, rne
                  fmv.x.w      a1, ft2
                  sll          s1, a0, t1
                  nop
                  ori          sp, a3, 1961
                  srli         s6, s9, 4
                  fcvt.w.s     t6, ft7, rtz
	fcvt.w.s	s5, fs2, rne
                  nop
                  lui          a2, 733905
                  srl          t6, t2, ra
                  fmin.s       ft10, fs4, ft5
                  div          s0, s5, a1
                  sra          a2, t5, t1
                  srai         s2, a4, 11
                  fclass.s     s9, ft1
                  fsgnj.s      fa7, fs8, fs6
                  fsgnj.s      ft2, ft8, fs6
                  xor          s1, t1, sp
                  andi         t1, ra, 718
                  sltu         s1, s0, s3
                  andi         a2, zero, 1143
                  srl          ra, ra, t0
                  fmax.s       fa4, fa4, fs8
                  mulhsu       a7, s2, t2
                  rem          t0, s6, s5
	fcvt.s.wu	fs3, a4, rne
	fcvt.wu.s	s3, fs0, rne
                  div          a0, a0, a5
                  slti         a2, t0, 41
                  sltu         t1, t5, s1
                  fsgnjx.s     fs6, fs1, ft7
                  fsgnj.s      fs5, fa6, fs7
	fcvt.wu.s	t4, fs1, rne
                  xor          s10, s1, ra
                  slli         gp, s7, 12
                  sra          t1, a1, a7
                  xor          a0, tp, s10
                  xori         a6, s8, 196
                  mulhsu       ra, s0, s2
                  xor          s5, s3, s11
                  add          s5, a0, a7
                  srai         tp, s11, 11
	fcvt.s.wu	fs5, s10, rne
                  xor          s2, s3, s10
                  xor          sp, s7, s9
	fcvt.s.wu	fs8, a2, rne
                  fcvt.s.w     ft5, s1, rtz
                  fcvt.w.s     s9, ft2, rmm
                  mul          t1, t4, t4
                  remu         s9, t6, t3
                  slli         a3, s10, 11
                  sltiu        s9, a4, -1360
                  sra          s8, a5, t6
                  srl          s7, t0, zero
                  mulhu        a4, s7, a1
                  fsgnj.s      ft7, ft4, ft2
                  auipc        zero, 756708
                  slli         a5, t5, 26
                  fsub.s       fs11, fs11, fa2, rmm
                  sltiu        ra, a4, -1365
                  srai         zero, zero, 2
                  fsgnj.s      ft1, fa3, ft2
                  fmv.w.x      fa0, s7
                  fmv.x.w      s2, ft11
                  nop
                  sub          s2, t5, a6
                  auipc        s3, 780306
                  mulhu        s2, t6, s4
                  fclass.s     a1, ft2
                  add          s2, t2, tp
                  fsgnjx.s     ft5, fs8, ft3
	fcvt.s.wu	fs5, s7, rne
                  mulh         tp, s6, s1
	fadd.s	fs1, ft11, fs10, rne
                  slti         t3, gp, 1610
                  srl          a2, a7, s9
                  addi         gp, s5, -55
                  mulhsu       s8, t5, a4
                  or           a4, s3, a4
                  flt.s        gp, fa7, fa6
                  addi         s3, t4, 300
                  sra          s1, gp, t3
                  fcvt.wu.s    a4, ft7, rup
                  slli         sp, a0, 8
                  srli         zero, t0, 13
                  auipc        a1, 648677
                  fmin.s       fs9, ft8, ft8
                  srli         s10, s4, 15
                  fle.s        a2, ft5, ft2
                  sltu         a0, s7, s9
                  fmax.s       fs5, ft6, ft2
                  sll          s8, zero, ra
                  sll          s2, s9, ra
                  rem          s5, t4, a3
                  fle.s        a4, fs5, fs8
                  addi         s9, t5, 755
                  div          tp, a3, t2
                  fsgnjx.s     ft9, fa3, fs10
                  slti         zero, s4, 588
                  mulh         sp, s4, s9
	fcvt.wu.s	t4, ft4, rne
                  fmin.s       ft0, fs11, fa7
                  rem          s5, a0, s10
                  sll          s0, sp, s11
                  xori         a4, tp, -85
                  srl          s6, sp, tp
                  fadd.s       fa0, fs0, fa2, rdn
                  sub          a2, s3, s8
                  mulhsu       s1, s6, s3
                  mulhu        s10, s2, s7
                  fclass.s     t6, ft6
                  fcvt.w.s     a6, fs9, rtz
                  fsgnjx.s     fa7, ft8, fa0
                  sll          tp, ra, a1
                  fadd.s       fs2, ft9, fs7, rmm
                  xor          s11, s1, a1
                  rem          zero, zero, s7
                  fmin.s       fs8, fa5, fs3
                  fsgnj.s      fa7, fa3, ft0
                  or           s7, a3, tp
                  xor          s6, s3, s4
                  ori          t4, t1, -401
                  lui          s9, 966620
                  fmin.s       fs5, fs6, ft10
                  srli         s5, s2, 29
                  divu         a0, s0, s7
                  fclass.s     s6, ft4
                  feq.s        a2, fa5, fa5
	fadd.s	fs1, ft8, fs7, rne
                  nop
                  srl          s5, s6, ra
                  fsgnj.s      fs9, ft0, fs10
	fcvt.s.w	ft9, a6, rne
                  slti         zero, a2, -197
	fcvt.s.w	fa2, ra, rne
                  sltiu        s8, a7, -1483
                  fclass.s     s1, ft4
                  slt          a3, a7, a1
                  or           s1, s2, a5
                  div          a1, tp, zero
                  and          a6, s11, a4
                  fsgnj.s      fa6, fs11, fs8
                  remu         s5, t1, s0
                  andi         s8, a7, -1559
                  divu         s11, s1, s9
                  fcvt.s.w     fs3, sp, rmm
                  lui          t1, 858964
	fcvt.w.s	t0, fs1, rne
                  xor          t4, s3, t6
                  slt          a0, sp, s2
	fcvt.wu.s	ra, fs10, rne
                  sll          a2, a0, s10
                  slti         s7, tp, 401
                  lui          s10, 904340
                  fle.s        ra, ft0, fs10
                  add          s1, a4, s6
                  and          t3, a0, a0
                  fmv.w.x      fs11, s8
                  fmin.s       fs2, ft2, ft0
                  srai         tp, a0, 21
                  srai         s0, t5, 14
	fcvt.s.w	ft3, gp, rne
                  addi         s9, s4, 1792
                  add          ra, gp, a7
                  ori          gp, t6, -679
                  auipc        a3, 422444
                  fclass.s     t6, ft5
                  fcvt.s.w     fs2, t2, rup
                  auipc        t6, 397956
                  mul          s10, t1, gp
                  div          zero, a1, s0
                  fmax.s       fa7, fs0, ft8
	fcvt.s.w	fa3, s5, rne
                  mulhsu       a1, gp, s5
                  mul          s11, a1, a1
                  andi         s0, t2, -1362
                  sltu         s2, a4, s1
                  fsgnjn.s     ft7, fs8, fs9
                  nop
	fcvt.s.w	fs0, s1, rne
	fsub.s	fs10, ft2, fs5, rne
                  fmv.w.x      fs5, s6
                  addi         zero, s0, 1310
                  xori         a0, s9, 687
                  andi         ra, ra, 656
                  nop
                  srai         a4, t2, 11
                  nop
                  sll          a1, tp, t6
                  auipc        a4, 81059
                  divu         s11, a7, sp
                  fmin.s       ft11, fs7, ft4
                  srai         t6, s4, 26
                  sltiu        a1, t3, -1262
                  flt.s        s11, fa6, fa6
                  div          tp, s9, s9
                  fsgnjn.s     fa4, ft1, ft0
                  fmax.s       fs11, fs6, ft8
                  divu         a2, s5, s0
                  slt          gp, ra, tp
                  ori          a7, a4, 1136
                  div          a1, s5, s6
                  sltiu        ra, s7, 513
                  lui          tp, 221970
	fcvt.s.wu	fs1, s2, rne
                  xori         tp, s3, 1497
	fcvt.wu.s	sp, fs4, rne
                  srli         s10, t4, 16
                  remu         a1, t6, t6
                  sra          s7, s2, a7
                  divu         s10, s11, s3
                  sub          s10, t6, t4
                  fmv.x.w      a5, ft5
                  slt          t0, t0, tp
                  slli         ra, t3, 12
                  sub          tp, s2, s2
                  flt.s        t4, fs4, fs10
                  sltu         ra, a1, a7
                  fmv.x.w      t1, fa1
                  srai         a5, t3, 20
                  ori          s8, a2, 765
                  divu         a5, s10, s1
                  fadd.s       fs0, ft5, fs9, rup
                  sra          s2, s3, t0
                  fmv.x.w      a1, fs6
                  rem          t3, a4, gp
                  feq.s        s2, ft3, ft7
                  fsgnjn.s     ft1, fs1, fa0
                  srl          a3, gp, a3
                  srl          s11, sp, sp
                  fsgnjn.s     ft0, fa1, ft4
                  fmv.x.w      a0, fa2
                  fcvt.w.s     s6, fs1, rtz
                  and          a7, t5, s5
                  fsgnjn.s     fa7, fs6, fs1
                  srl          s7, a4, s10
                  fsgnj.s      fs3, fa1, fa2
                  mulhsu       s8, a7, gp
                  div          s6, a2, s2
                  mulh         a6, zero, sp
                  divu         t3, s4, s4
                  or           a4, t6, t3
                  srai         s0, t3, 0
                  xor          gp, s8, a0
                  slt          t3, s4, gp
                  andi         sp, a5, -1438
                  add          a4, t5, t2
	fadd.s	fa1, fa0, fa3, rne
                  slti         t1, s1, -624
                  mulhsu       s7, ra, a5
                  mulh         a2, s9, s8
                  fmv.w.x      fs7, s1
                  xor          a7, s10, t2
                  addi         a6, s1, 1521
                  addi         a4, a3, -604
                  srai         s10, a6, 21
                  flt.s        a5, ft4, ft11
                  remu         t1, a0, s1
                  sra          ra, t4, s4
                  sra          s2, gp, s8
                  remu         a2, a4, s10
                  fsgnj.s      fs1, fa6, fs11
                  fmv.x.w      s0, fa5
                  andi         a6, s4, -926
                  feq.s        s5, fs6, ft6
                  and          a2, a6, t5
                  mul          a6, s9, s2
                  slt          s5, t1, s6
                  add          t1, t6, a0
                  fmax.s       ft9, fa6, fs1
                  fcvt.w.s     s10, fs2, rup
                  andi         s6, t3, -1842
                  fadd.s       ft7, ft10, ft6, rne
                  andi         gp, s8, 1346
	fcvt.s.w	fs0, t1, rne
                  fmin.s       ft3, ft10, fa7
                  sra          a6, a0, gp
                  fmv.x.w      s2, ft6
                  rem          a1, a7, s9
                  remu         s10, a2, a5
                  divu         s2, a0, t0
                  and          a1, s0, s9
                  fle.s        tp, fs11, fa4
	fsub.s	fa3, fa3, ft6, rne
                  srli         a7, s1, 19
                  div          s9, gp, s4
                  addi         s3, sp, 1936
	fcvt.s.w	fa5, a1, rne
                  sltiu        s1, a1, -145
                  slti         s1, t3, 14
                  sub          sp, a1, a7
                  fcvt.s.w     ft7, gp, rne
                  xori         t1, a1, -823
                  fsgnjn.s     fs2, ft7, fa2
                  sub          t4, gp, zero
                  addi         a1, zero, 703
                  mulh         a7, s8, t1
                  or           a0, ra, a5
	fadd.s	ft6, fs9, fs11, rne
                  fsub.s       fa3, ft3, fa7, rmm
                  fadd.s       ft2, fs3, fa5, rmm
                  auipc        s7, 228967
	fcvt.s.wu	ft6, s8, rne
                  nop
                  fmv.w.x      fa0, s9
                  fmv.x.w      a4, fs6
                  lui          s8, 188768
                  addi         s0, s5, -1288
                  rem          s1, s6, zero
                  fmin.s       ft11, fs2, ft3
                  xor          t6, t1, t3
                  lui          s2, 931240
                  feq.s        s3, fs7, ft11
                  fsgnjn.s     fa4, fs11, ft8
	fcvt.s.wu	ft3, gp, rne
	fcvt.wu.s	tp, ft9, rne
	fcvt.s.wu	ft0, a1, rne
                  sub          a7, s6, a6
                  fcvt.w.s     a0, fa1, rdn
                  slli         zero, zero, 30
	fcvt.w.s	s0, ft6, rne
                  xor          zero, t0, a4
	fcvt.s.w	fa4, s5, rne
                  srli         s6, a0, 22
                  sltiu        sp, tp, -1201
                  slt          s1, s6, a2
                  fcvt.s.wu    fs11, tp, rmm
                  fsub.s       ft4, fs10, fs3, rne
                  flt.s        s5, ft0, fs0
                  fle.s        s8, ft1, ft0
                  fsgnjn.s     ft5, fs1, fs4
                  srai         s7, s5, 10
                  sltu         a3, s8, s8
                  fmv.x.w      ra, ft10
                  mulhsu       s8, a2, a6
	fcvt.w.s	s10, fs8, rne
                  nop
                  mulhsu       zero, a5, sp
                  flt.s        gp, fa7, ft0
	fcvt.s.w	fs9, t3, rne
                  fcvt.wu.s    s7, ft10, rtz
                  srli         a3, s9, 27
                  srli         s5, a0, 15
                  or           t3, a2, a2
                  slti         s3, gp, -1689
                  mul          t6, tp, gp
	fcvt.wu.s	a2, ft2, rne
                  fsub.s       ft2, ft5, fa0, rdn
                  mulhu        a1, s1, zero
                  mul          s5, a1, a3
                  slli         s8, s1, 21
                  mul          zero, s2, t0
                  sltiu        a2, s10, 676
                  xori         s1, t2, 650
                  slti         a2, s7, -529
                  slti         s5, a1, -1173
                  fsgnjx.s     fs4, ft2, fa6
                  slti         s6, t4, 136
                  srai         a6, s7, 27
                  xori         s3, t3, 544
                  mul          s10, a6, a0
	fcvt.s.w	fs10, s1, rne
                  sltu         t4, t3, a6
                  add          gp, t3, a0
                  nop
                  sltu         t4, t3, s3
                  mulhu        t1, a1, zero
	fcvt.s.w	fs8, s10, rne
                  nop
                  ori          a1, t2, 75
                  srl          a3, s10, s8
                  flt.s        t4, ft11, ft10
                  sub          zero, tp, a7
                  mul          a1, t0, a3
                  fclass.s     t6, ft4
                  add          s11, a4, a6
                  sll          a6, s1, gp
                  fcvt.s.w     fa6, t3, rmm
                  sra          zero, s8, s11
	fcvt.s.wu	fs1, s3, rne
                  fsgnjx.s     fa2, ft2, fa7
                  fmv.w.x      fa5, t1
                  slt          t0, a1, ra
                  auipc        a0, 1001782
                  feq.s        s11, ft5, ft9
	fcvt.s.wu	ft1, t0, rne
                  fle.s        s0, ft7, fs7
                  andi         s7, zero, -1527
                  nop
                  rem          s8, t3, s7
                  fmv.x.w      sp, ft9
                  srli         a7, a7, 22
                  nop
                  fsgnj.s      fa0, ft6, fs2
	fsub.s	ft5, ft3, fs1, rne
                  flt.s        tp, fa0, fa0
                  and          ra, s4, a1
                  nop
                  xori         t6, s3, -1464
                  mulh         a0, t3, t4
                  sra          ra, t1, tp
                  fclass.s     s9, fs10
                  fle.s        s3, fa2, fs7
                  feq.s        ra, fs9, fs5
                  fsub.s       ft8, ft0, fa5, rtz
                  fmv.x.w      a0, ft1
                  sub          t1, zero, s6
                  srai         gp, s8, 31
	fcvt.s.wu	ft10, s1, rne
	fcvt.s.w	fa4, ra, rne
                  mulhsu       t4, a3, s5
                  fmin.s       fa6, ft11, ft4
                  xor          a4, a2, a7
                  fsgnj.s      ft9, ft1, fs4
                  slti         tp, a1, 1772
                  sltiu        zero, s6, -217
                  mulh         s9, tp, t6
                  mulhu        sp, gp, tp
                  mulh         ra, t5, sp
	fcvt.wu.s	s9, fs8, rne
                  divu         a3, s7, s1
                  fclass.s     s11, fs3
                  slti         s8, s8, -710
                  mul          s8, s7, t4
                  fsgnjn.s     fs4, fa6, fs9
	fadd.s	ft9, fs5, fa6, rne
                  divu         t3, s6, s6
                  sll          s10, gp, s8
                  srl          a5, tp, s7
                  fsgnjn.s     ft2, ft3, fs5
                  xori         t1, gp, 557
                  fmin.s       fa5, ft10, fs3
                  remu         s6, s3, tp
                  rem          s8, ra, a3
                  fmv.w.x      ft10, a3
                  fmv.x.w      sp, fs8
	fcvt.s.w	ft0, t5, rne
                  addi         t6, t6, 144
                  srl          t0, zero, a6
                  ori          a6, a2, 842
                  add          s6, a6, s9
                  fsgnjn.s     fs4, fs8, fs0
                  flt.s        gp, ft8, fa4
                  ori          s2, a3, -1109
                  auipc        s11, 776545
                  remu         s11, sp, a2
	fadd.s	ft4, ft11, fa7, rne
                  divu         a2, s7, zero
                  fcvt.s.w     fs11, tp, rne
                  divu         a2, s1, s7
                  fsgnjx.s     fs8, fa4, fs1
                  sltu         s5, zero, s4
                  lui          a4, 186929
                  fmv.w.x      fs0, s10
                  fmv.w.x      fs2, a3
                  mulh         t6, s10, t3
                  sub          t0, a5, s5
                  srai         t3, a3, 29
                  slli         s5, tp, 18
                  andi         t6, t4, 238
                  fclass.s     t1, fs6
                  rem          s3, t2, s1
                  nop
                  auipc        a5, 252566
                  sra          s8, t4, zero
                  divu         s1, s3, t4
                  fsgnjx.s     fs7, fs11, fa1
                  fclass.s     s2, ft5
	fsub.s	fs6, fa7, fa4, rne
                  fcvt.w.s     s1, fa4, rtz
                  div          s0, t5, a7
                  fadd.s       ft11, fs9, fs10, rmm
                  fclass.s     a3, fs2
                  sra          t3, s5, s10
                  slti         a6, s6, -68
	fcvt.s.w	fs11, t2, rne
                  fcvt.s.w     ft6, s10, rtz
                  mulhu        s9, s5, t2
                  slti         a1, a5, 298
                  fclass.s     s1, ft11
                  fle.s        s9, fs2, ft4
                  sub          s9, sp, s7
                  sub          tp, t6, s4
                  rem          gp, sp, s10
	fcvt.s.wu	fs4, s7, rne
	fadd.s	fs8, fa0, fs5, rne
	fcvt.wu.s	a2, ft7, rne
                  fclass.s     gp, ft7
                  div          a6, s5, s7
                  sltu         zero, t4, s3
                  feq.s        s10, ft6, fs2
                  feq.s        s3, ft11, ft2
                  andi         s3, a6, -1791
                  xor          s2, a1, s7
                  sltiu        s3, a1, 553
                  fmax.s       ft11, fa4, fs1
                  or           s0, a4, a6
                  sub          t3, a0, a4
                  fclass.s     a6, fs3
                  fadd.s       fa1, fa2, ft7, rdn
                  nop
                  srli         ra, gp, 14
                  sra          tp, sp, s1
                  fle.s        s1, fs0, ft3
                  fle.s        a7, fs4, fa5
                  fle.s        t0, ft8, fa5
                  fsgnjx.s     ft10, fs5, fs4
                  srl          s6, s2, t3
                  fsgnj.s      fa4, ft10, fa4
                  mulh         t3, a0, s4
                  divu         t0, a1, a4
                  ori          s0, t4, -1508
                  slt          tp, ra, t2
                  fle.s        sp, ft5, ft1
	fsub.s	fs5, fs2, fs4, rne
                  andi         a4, s7, -959
                  remu         tp, a1, sp
                  srai         tp, a3, 19
                  mulh         s5, ra, a1
                  srai         tp, t3, 15
                  feq.s        t0, fs9, fs11
                  fmax.s       fs7, fa7, ft6
                  mul          a2, a7, t4
                  flt.s        t4, fs2, fa0
                  fmin.s       ft10, ft0, ft3
                  fmax.s       fs4, fa1, fs8
                  or           s11, zero, s6
                  sub          s11, s2, tp
	fcvt.s.w	fs1, t6, rne
                  fsgnj.s      ft2, ft4, fs10
                  fsub.s       fs7, ft4, fa6, rup
                  fclass.s     zero, ft9
                  fmv.w.x      fs0, s6
                  or           a5, s0, a4
                  rem          gp, zero, s3
                  fsub.s       fs9, ft8, ft7, rtz
                  fsgnj.s      fs11, fa3, ft1
                  remu         t4, s4, gp
                  slli         s10, s6, 19
                  sub          gp, s8, s6
                  fle.s        tp, fs0, fa1
                  slti         a1, s6, -1184
                  auipc        s3, 940135
                  fmin.s       fs2, fa7, fs10
                  fmv.w.x      fs10, a1
                  sub          s5, t2, a3
                  xori         a2, s3, -1062
                  add          s11, a2, s2
                  rem          s7, a5, ra
                  fmax.s       fa2, fa0, fa1
                  or           sp, s6, s3
                  or           s1, a5, s6
                  fle.s        a2, fa1, ft8
                  fsgnjn.s     fs0, fa7, fa5
                  srl          a2, a6, a3
                  slli         t0, s3, 16
                  ori          s10, s6, -991
                  sltiu        ra, a3, -231
                  fle.s        a2, ft3, fa3
                  andi         s6, t5, 626
                  mulhu        ra, s11, a7
                  sll          t4, a2, t6
                  fsgnjn.s     ft1, fa5, fa4
                  fsgnjx.s     ft6, fs4, fa2
                  fmin.s       fs11, ft1, ft11
                  auipc        a3, 899700
                  rem          s7, s8, a2
                  remu         t0, a1, s1
                  remu         t0, s4, s0
                  fsgnjx.s     fs11, fa2, fs3
                  fsgnjx.s     ft6, ft5, fs5
                  fsgnjx.s     fa1, ft3, fs6
                  fcvt.w.s     zero, ft4, rtz
                  and          s6, s7, a1
                  slli         t0, a4, 13
                  sltiu        gp, t1, -1392
                  fmv.x.w      s9, ft1
                  and          a0, s11, t4
                  divu         s5, s10, a6
                  addi         s9, s5, 327
                  slt          s3, s0, s7
                  slli         a2, s5, 16
                  ori          s7, s7, -155
                  fsgnjn.s     fa0, fs10, fa5
                  srai         s1, s9, 12
                  divu         s2, s4, t3
                  fsgnj.s      fa2, fa6, fa4
	fadd.s	fs4, ft1, fa4, rne
	fcvt.s.wu	fa3, zero, rne
                  fclass.s     gp, fs3
                  fclass.s     a7, ft7
                  sub          s8, a4, s7
                  mulh         gp, t4, ra
                  andi         zero, s10, 1213
                  lui          sp, 759639
                  mulhsu       t1, s8, a4
                  and          ra, s0, s4
                  div          a7, s9, s6
                  or           sp, s6, a7
                  fclass.s     s11, fs3
                  slli         a7, s3, 20
	fcvt.s.wu	fs4, t6, rne
                  sub          s11, a0, tp
                  divu         a2, t5, a4
                  or           t0, a1, tp
                  fmv.x.w      s10, fs1
                  add          s0, a1, s4
                  fmv.x.w      a3, fs6
                  mulhsu       a5, zero, a3
	fsub.s	fs10, fs2, fs7, rne
	fadd.s	fa7, fs9, fs9, rne
                  and          a2, t2, t2
                  sll          a6, s8, s11
                  fmin.s       ft9, fs8, ft3
                  mulhu        zero, a1, t1
                  sra          a1, a2, s9
                  xor          t0, a1, a6
                  fsgnjx.s     ft0, fa2, fa5
	fcvt.w.s	a2, ft11, rne
                  add          sp, t2, a7
                  xor          a0, s10, t1
	fcvt.s.w	ft3, a0, rne
                  ori          a3, s8, -398
                  fmv.w.x      fs0, zero
                  sra          zero, s3, ra
                  or           ra, t0, s10
                  fsgnjn.s     fs7, ft9, fa3
	fcvt.s.wu	ft0, s3, rne
                  mulhsu       a4, s7, t6
	fcvt.w.s	a1, fs8, rne
                  sra          a0, a5, t3
                  fcvt.s.wu    ft2, a3, rup
                  ori          s3, s3, 1587
                  sltiu        a3, s8, -1107
                  flt.s        a2, ft1, fs9
                  mulhsu       s7, s5, t0
	fsub.s	fs4, fs3, ft8, rne
                  nop
                  remu         s7, tp, s10
                  or           t4, t2, a3
                  fclass.s     s1, fa4
                  slti         sp, zero, 1769
                  fmv.x.w      a1, ft11
                  rem          ra, gp, t6
	fcvt.wu.s	a2, ft10, rne
                  rem          t1, s5, s8
                  xor          t4, s3, s1
                  slt          s10, s8, s5
                  and          tp, gp, a6
                  fsgnj.s      fs5, fs8, fa2
                  sltu         t6, s10, a7
                  slti         a7, s9, 1686
                  fmin.s       fa3, fs2, fs0
                  lui          zero, 630408
                  sltiu        s0, t3, 1005
                  or           s2, a5, zero
                  flt.s        s6, fa1, fa3
                  fcvt.w.s     a6, fa1, rtz
                  fmv.x.w      a4, fa6
                  and          a2, s7, s6
                  ori          s8, sp, -1849
                  add          s3, s0, s9
                  fmv.x.w      t1, fs4
                  fsub.s       ft3, fa5, ft1, rtz
                  srli         a0, s3, 19
                  auipc        t1, 559839
                  fmin.s       fs3, fs1, fs1
                  xor          s1, s9, ra
                  fle.s        s6, ft2, ft7
                  slti         s0, a0, -258
                  andi         t4, a3, 100
                  xor          t0, s9, a3
                  sltiu        t4, a5, -1510
                  fsgnj.s      ft1, ft5, fs8
                  xori         s3, t3, -1740
                  divu         sp, gp, gp
                  slti         a3, t1, -1582
                  fle.s        a1, ft3, fa5
                  rem          sp, t3, a2
                  addi         s9, s7, 219
                  ori          zero, s4, -602
                  flt.s        a6, ft7, ft1
                  sll          a1, t1, ra
                  slti         a7, s11, 1676
                  rem          tp, t1, s2
                  xori         zero, t5, -357
                  srl          a0, s5, s4
                  add          a3, a7, a5
                  srli         s8, s2, 15
	fcvt.s.wu	ft11, s5, rne
                  srli         a0, t0, 20
                  mul          tp, s11, zero
                  sltiu        ra, a2, 1102
                  fmax.s       fa0, ft6, ft3
                  add          s1, ra, t6
                  rem          a3, sp, a2
                  div          a4, t2, s4
                  ori          s1, s6, -1824
                  flt.s        s5, fa6, ft6
                  sltu         s1, t4, a0
                  srai         t0, t0, 19
                  auipc        s5, 977767
                  nop
                  fadd.s       fa2, ft9, fs9, rdn
                  fadd.s       ft2, ft6, fa0, rmm
                  fclass.s     a1, fs4
                  or           s6, s3, a4
                  mulh         t3, s7, s3
                  ori          s9, a5, -187
                  lui          t6, 193169
                  remu         tp, t0, a0
                  div          zero, sp, gp
                  addi         s6, a0, -698
                  addi         s6, s9, -795
                  sltiu        a5, t1, 1159
                  xori         ra, s9, -1951
                  srl          s8, a6, s4
                  andi         zero, s4, 1633
                  fclass.s     a7, fa3
                  sll          s10, a6, a7
                  nop
                  fsgnjn.s     fa0, fs11, ft8
                  ori          ra, s4, -451
                  and          t1, s6, a2
	fcvt.s.w	fs3, s0, rne
                  mul          a7, s0, a0
                  fmax.s       fa2, fa6, fs6
                  sub          s8, s8, s10
                  ori          a0, a5, 488
                  slti         s6, a5, 1941
                  mulh         s1, a5, s0
                  and          a2, s8, gp
                  fsgnjx.s     ft4, fs9, fa2
                  sub          ra, s9, tp
                  sltiu        s10, a4, -305
                  fadd.s       ft7, fs7, fs2, rup
                  nop
                  mulhu        s3, s1, gp
                  flt.s        s6, ft0, fa2
                  xor          a2, tp, s4
	fsub.s	fs10, ft0, fa1, rne
                  fmin.s       fs0, fa5, fa0
                  sll          s9, s4, s3
                  srli         s2, a7, 14
                  slli         t3, s6, 3
                  div          s1, t6, sp
	fsub.s	ft4, fs9, fa5, rne
                  div          ra, t1, t1
	fcvt.s.w	fa1, a6, rne
                  auipc        gp, 165016
                  nop
	fcvt.s.w	fs7, a5, rne
                  fmin.s       fs3, fa4, ft1
                  fadd.s       fs7, fa0, fs3, rdn
                  ori          a2, a3, -1899
                  sltu         a6, t2, s1
	fcvt.wu.s	t0, fs10, rne
	fsub.s	fa7, ft0, fs10, rne
                  fcvt.wu.s    s7, fa5, rmm
                  mul          s6, t1, t1
                  div          ra, s2, t5
                  rem          sp, s9, a5
                  sub          sp, a7, s2
                  rem          s3, a2, s10
                  mulhu        s6, s3, sp
                  sra          s2, t3, t5
                  ori          s1, zero, -1033
                  mul          s0, s2, s10
                  nop
                  auipc        t6, 66672
                  feq.s        s2, ft9, fs7
                  xor          tp, t2, t5
                  slt          t6, s9, s8
                  feq.s        a2, fs0, ft5
                  sra          s2, a5, a1
                  fsgnj.s      fa0, ft8, fa3
                  mulhu        s11, sp, t0
                  fmin.s       fa5, fs0, ft7
                  feq.s        s5, fa2, fa6
                  divu         a4, s5, t4
                  rem          zero, zero, zero
                  add          gp, a6, s6
                  mul          t1, t6, a0
                  xori         a2, a1, -1480
                  auipc        s11, 1044072
                  addi         s1, a6, 1855
	fcvt.s.w	fs0, a1, rne
                  xori         s8, s8, -258
                  ori          a5, s8, -1513
                  srli         t4, s0, 31
                  sra          s7, tp, tp
                  mul          a5, a6, gp
                  mul          s3, a1, s7
	fcvt.wu.s	a5, fa2, rne
                  add          gp, a1, s5
                  fmv.w.x      fs3, s4
                  mulhu        s5, a1, tp
                  fsgnjn.s     fs3, fs7, fs0
                  addi         s9, t4, -511
                  feq.s        a7, ft9, fs10
                  divu         a2, s9, a5
                  sltu         tp, tp, a5
                  sltu         t0, a2, a1
                  andi         sp, s6, -1002
                  andi         sp, t5, 142
                  lui          a6, 394141
                  feq.s        t0, fa7, ft4
                  fle.s        s5, fs2, ft1
                  ori          a3, s1, 1086
                  slt          a1, s6, a4
                  add          t3, s5, s3
                  feq.s        s5, fs5, ft9
                  nop
                  slti         a3, a4, -1721
                  or           t0, t5, tp
                  fmv.w.x      ft6, sp
                  fsgnj.s      ft0, ft7, fs8
                  addi         sp, a1, -1373
                  sub          s9, s8, a2
                  fcvt.wu.s    t0, fa4, rdn
                  srli         t6, s3, 30
                  and          s6, ra, a6
                  rem          s1, s6, a4
                  fcvt.s.wu    ft11, s11, rtz
                  mulhsu       t1, a3, s7
                  srai         a0, s3, 21
	fcvt.s.wu	fs8, a7, rne
                  srai         s10, s10, 28
                  auipc        gp, 606589
                  auipc        s3, 440911
                  fcvt.wu.s    a3, fa2, rdn
                  fsgnj.s      fs10, fs11, fs5
	fsub.s	fs2, fa4, fs9, rne
                  sra          t4, s6, t6
                  feq.s        s6, fs11, ft5
                  sra          s0, ra, s9
                  fmax.s       fa3, fs11, fs8
                  mulhu        gp, s10, t1
                  fcvt.s.w     fs7, a0, rne
                  fsub.s       fs9, ft2, ft3, rdn
                  and          s11, a3, s4
                  fcvt.s.wu    fs4, t4, rmm
                  lui          t0, 394365
                  lui          a3, 135943
                  addi         s8, s5, 1583
                  fsgnjx.s     ft1, fs2, fa5
                  flt.s        s1, fa2, ft7
                  or           s3, s10, t6
                  fclass.s     s2, fa6
                  srai         s9, s3, 5
                  sll          t0, zero, s11
                  fmv.w.x      fa1, s2
                  and          s0, s5, a3
                  fmin.s       ft2, fs9, ft6
                  fmax.s       fs8, fs3, fs5
                  fmin.s       fa2, fs6, fs3
                  addi         gp, sp, -1644
                  fsgnjx.s     ft11, fa5, fs0
                  xor          tp, a0, a5
	fcvt.wu.s	t4, fs5, rne
                  fmv.w.x      fa1, a2
                  mul          s2, t0, a4
                  sltiu        a4, zero, 1826
                  fsgnj.s      ft6, fs7, ft11
                  srl          s6, t1, a7
                  slti         s7, s11, -1155
                  div          a1, s7, s8
                  sra          a4, t2, ra
	fcvt.s.w	fa6, a6, rne
                  rem          sp, sp, t5
                  lui          a0, 726196
                  fmin.s       ft7, fa3, ft3
                  fsgnjx.s     ft3, ft10, ft1
                  fcvt.w.s     s6, fa0, rdn
                  addi         a7, a1, 822
	fcvt.w.s	tp, fs4, rne
                  sltiu        s9, t0, 1129
                  xori         a5, s5, 1575
                  fmv.x.w      s5, fs10
                  div          s11, a5, t3
                  fadd.s       fs4, ft2, ft5, rne
                  feq.s        a1, ft0, fa0
                  sltu         t3, t3, t2
                  xori         tp, s3, 39
                  fclass.s     a3, ft11
                  srai         t6, sp, 9
                  srl          a4, t5, t6
                  xor          s8, s8, s5
                  sltiu        t6, s9, 1280
                  slt          ra, a3, a0
                  fadd.s       ft7, ft0, fa3, rup
                  fsgnjx.s     fa4, ft1, ft7
                  div          t0, s7, a3
                  mulh         a4, a1, a4
                  fmax.s       fa0, fa5, ft2
                  slli         s1, ra, 13
                  div          t4, t1, gp
                  fle.s        a0, ft10, fs0
                  slti         t1, a4, -1154
                  auipc        a3, 244257
                  srl          a2, a6, t2
                  fsgnj.s      fs9, ft7, fs0
                  mulhsu       s5, a1, t1
                  lui          a5, 185666
	fcvt.s.wu	ft3, s10, rne
                  add          ra, s4, tp
                  fmax.s       fa7, fa2, ft9
                  andi         a0, t0, 711
                  nop
                  fsgnjn.s     fa6, fs3, fa0
                  fmv.x.w      t4, fa4
	fcvt.w.s	s5, ft0, rne
                  fle.s        s0, ft1, ft10
                  fmin.s       ft7, fa3, fs8
                  srai         a5, t3, 18
                  mulhsu       a3, a6, sp
                  srli         tp, s1, 2
                  sll          a0, a3, a1
                  fcvt.s.w     fa6, a1, rne
                  feq.s        s10, ft4, fs2
                  fmin.s       ft1, fa3, fs1
                  sll          s8, s0, t3
                  fle.s        t3, fa6, fa3
                  sra          tp, s8, a0
                  sltiu        t0, t0, -1172
                  sll          t1, t2, s0
                  fsub.s       ft0, ft6, ft2, rdn
                  mul          t3, t1, s3
                  fsgnj.s      fs5, fs10, fs6
                  andi         s7, s8, 300
                  fsub.s       fs9, ft6, ft11, rdn
                  fle.s        a6, ft0, fa3
                  srli         ra, s11, 16
                  mul          a4, t3, t6
                  sll          ra, s5, s6
                  fmin.s       fs8, fa0, ft1
                  fle.s        ra, ft11, ft6
                  flt.s        s5, fs5, ft1
                  fmv.w.x      fa5, s5
                  div          a3, s9, gp
                  flt.s        s2, ft1, fa1
                  rem          s1, t3, t0
                  fmax.s       ft11, ft7, fa6
                  fcvt.s.w     fs5, a7, rne
                  slli         s3, t4, 21
                  slti         t0, ra, -693
                  fadd.s       ft9, ft1, ft1, rup
	fcvt.s.w	fs5, s6, rne
                  slti         s10, a4, -1146
                  mulhsu       t4, t2, t6
                  fmax.s       fs8, fs1, fs4
                  slt          a7, s9, t6
                  fsgnjn.s     fa1, fa0, fa3
	fcvt.s.w	fa1, s10, rne
                  mul          s5, t3, t0
                  sltiu        s1, s4, 1278
                  fmv.x.w      zero, ft1
                  sra          a4, t2, s1
                  feq.s        a4, ft8, fs10
                  srli         a2, a7, 29
                  divu         zero, s10, ra
                  fmv.w.x      ft6, s2
                  fle.s        a5, fa7, ft7
                  flt.s        a7, ft8, fa5
                  rem          sp, t6, s5
                  flt.s        s1, fa6, fa5
                  srl          gp, tp, t0
                  add          s3, t2, s6
                  sltiu        a5, a4, 1331
                  and          s10, ra, gp
                  xor          s10, t0, t2
                  xori         a7, t2, 33
                  fmax.s       fa1, fs2, ft5
                  srai         t3, s4, 5
                  fcvt.s.wu    fa1, t5, rne
                  addi         a3, s3, -1674
	fcvt.wu.s	s7, fa3, rne
                  nop
                  xori         a1, tp, 1690
                  fsgnj.s      fs11, fa5, ft7
	fcvt.w.s	a2, ft5, rne
                  fle.s        a0, fa7, ft9
                  fcvt.w.s     s11, fa2, rtz
                  divu         t3, s11, t2
                  xor          s3, t2, s10
                  fsub.s       ft7, ft1, fa6, rne
                  mulhu        s6, sp, s2
                  fsgnj.s      ft4, fs9, fs0
                  fsgnj.s      fs10, ft4, fs5
                  mulh         a4, a5, s5
                  mulhu        a0, s11, s0
                  xor          s6, t2, a6
                  srli         s0, ra, 17
                  or           t3, s2, t1
                  mulhsu       zero, zero, a3
                  fmax.s       fa6, fs5, fa5
	fsub.s	fs8, fa3, fa6, rne
                  fsgnjn.s     fa7, ft6, fs2
                  auipc        t4, 504527
                  fcvt.w.s     s6, fa2, rup
                  fmv.x.w      sp, fs6
                  fmv.x.w      a4, fs3
                  lui          a0, 777846
                  fsgnjx.s     fa2, ft6, ft8
                  lui          a1, 672291
                  sltu         a4, t5, s11
                  sub          t4, s2, a4
	fsub.s	fs5, fa3, ft11, rne
                  andi         s10, a4, -673
                  mulhu        s9, a4, s6
                  add          a6, s2, t5
                  xor          t0, s3, a7
                  addi         s0, s4, -1597
                  feq.s        t0, ft10, ft2
                  srl          s8, s5, a5
                  and          s8, s9, t2
	fcvt.w.s	sp, fa2, rne
                  or           s3, s10, gp
                  auipc        tp, 238190
                  fcvt.wu.s    s11, ft1, rmm
                  srl          s1, s7, a0
                  lui          s2, 10049
                  divu         a5, s11, t6
                  fadd.s       fs10, ft5, ft4, rdn
	fcvt.s.wu	ft10, a5, rne
                  mulh         s8, a1, t6
                  or           t4, a6, s11
                  fcvt.s.w     ft8, a7, rtz
                  lui          a5, 826919
                  srai         s2, s0, 5
                  fmv.w.x      fs4, s11
                  mulhu        tp, a0, t2
                  sub          a7, s7, a2
                  fle.s        a7, ft1, ft5
                  lui          s6, 27128
                  feq.s        s10, fs5, fa6
                  sltiu        s7, a0, -1039
                  andi         tp, a1, 1217
                  fadd.s       fs3, ft0, fa2, rdn
	fcvt.s.wu	ft8, t1, rne
                  rem          s3, s10, t3
                  slti         s9, s11, 1769
                  mul          tp, a2, s9
                  xor          zero, a5, t0
                  sra          a5, s4, t4
                  andi         s5, s11, -2013
	fadd.s	fs10, fs0, fs1, rne
                  add          a4, s6, zero
                  sltiu        ra, s6, -1724
                  fmin.s       fa6, fa2, fs3
                  fmin.s       fa2, ft0, ft7
                  feq.s        gp, ft4, ft11
	fcvt.wu.s	t1, ft5, rne
                  srai         s2, t1, 30
                  and          s11, gp, tp
                  sltiu        ra, t1, 540
                  fsgnj.s      ft5, fs8, ft1
                  srl          t4, t1, t5
                  or           a7, s7, s6
                  remu         a3, a0, t5
                  lui          s11, 410242
                  sltu         a2, gp, tp
                  sra          t6, ra, t4
                  feq.s        t6, fs7, fa1
                  sra          a0, t4, t2
                  flt.s        s10, fa2, fs5
	fsub.s	ft7, fa3, ft3, rne
                  slti         s11, gp, 1765
                  nop
                  fsgnj.s      fa7, fs3, fa7
                  mulh         s6, a7, ra
                  xori         s3, gp, -1960
                  andi         a4, t4, -703
                  fcvt.s.w     fs9, s11, rtz
                  fsgnjx.s     ft3, fa1, ft7
                  fmv.w.x      fa3, a7
                  fsgnj.s      fs5, ft9, fs5
                  ori          s6, s10, -844
                  srli         a5, s5, 11
                  rem          sp, s3, a6
                  auipc        a5, 91261
                  andi         s2, s2, -383
                  nop
                  sra          s0, s2, s4
                  lui          a6, 497466
                  fsgnjx.s     ft7, fs1, ft6
                  srli         a3, t0, 27
                  xori         t4, a6, -742
                  fsgnjx.s     fa6, ft7, fs2
                  sll          s3, gp, s6
                  mul          s3, s6, s10
                  mul          s8, a5, t1
                  fle.s        s2, fa4, ft10
                  mulhsu       a3, t0, t6
                  auipc        a5, 752113
                  fmv.w.x      ft5, s7
                  fmax.s       fs8, fs6, ft0
	fcvt.w.s	zero, ft1, rne
                  mulhsu       tp, s5, t6
                  rem          a5, s8, s3
                  sltiu        a5, s3, 589
                  sltu         s8, t0, t0
                  mul          s1, a7, t0
                  srli         ra, s3, 4
                  nop
                  fle.s        s2, fs2, fs2
                  and          a7, a6, a3
                  slli         zero, s9, 9
                  sltiu        a6, tp, 118
                  rem          s9, a7, s2
                  and          ra, a2, t1
                  mulh         a1, t1, t1
                  fcvt.w.s     tp, ft1, rmm
                  fsgnj.s      fs11, fa5, fa7
                  srli         ra, a2, 28
                  fmv.x.w      s9, fa7
                  lui          sp, 189390
                  fmax.s       fs2, ft3, fs0
	fcvt.s.w	fs0, tp, rne
                  fmax.s       fa5, fs8, fs4
                  sll          a6, a2, a4
                  mulhsu       a4, a0, s9
                  fmax.s       ft9, ft6, fa3
                  nop
                  fmv.x.w      t1, fs6
                  mulhu        s8, a6, ra
                  or           s1, a4, a1
                  slt          a0, s10, t6
                  fle.s        t0, ft10, ft10
                  remu         a3, s10, s10
	fcvt.wu.s	a5, ft6, rne
                  nop
                  mulhu        a1, t5, zero
                  fclass.s     zero, ft4
                  div          sp, t0, a4
                  remu         s9, sp, zero
                  addi         t4, s2, -1483
                  fsub.s       ft4, fa3, fa1, rup
                  auipc        t4, 347573
                  sra          t4, a1, a6
                  mul          s6, s9, s9
                  div          s7, zero, a2
                  feq.s        a3, fa0, ft5
                  srli         ra, s5, 8
                  sltiu        a0, s5, 1374
                  fsgnjn.s     ft10, fs3, ft9
                  fmax.s       fa5, ft2, fa0
                  nop
                  mulh         s5, s2, t2
                  flt.s        t0, fs3, fa3
                  fmv.w.x      fs11, a3
                  auipc        s5, 381841
                  sra          a7, t1, a6
                  nop
                  auipc        t1, 415265
                  fcvt.wu.s    a0, ft3, rne
                  sra          t3, s2, a5
                  and          s0, s8, a1
                  fsgnjx.s     fa4, fs6, ft6
                  srai         ra, zero, 17
                  fcvt.s.w     fa6, a6, rdn
                  srli         t3, a6, 30
                  rem          sp, s1, s7
                  sltiu        zero, ra, 453
                  flt.s        s6, fs8, fa0
                  mulhu        t6, t1, gp
                  slli         a4, a7, 24
                  fmv.w.x      fs4, ra
                  auipc        a0, 470970
                  sltiu        s8, s8, 93
                  fmv.x.w      a4, fa4
                  addi         s6, a6, 19
                  fmv.x.w      a3, fa1
                  remu         s1, t0, a6
                  srl          a6, tp, zero
                  fsgnjn.s     fa0, fs9, ft4
                  auipc        t0, 358790
                  fcvt.w.s     a6, fs1, rne
                  divu         a4, ra, a0
                  sra          a0, ra, s10
                  slti         s10, a1, 404
                  lui          s9, 871080
	fcvt.w.s	t1, ft9, rne
                  sll          t1, s9, s5
                  fsgnj.s      fs8, fs2, ft2
                  fle.s        s0, ft8, fa4
                  fle.s        ra, fs7, fs5
                  or           s7, zero, tp
                  mulhsu       a7, t1, a6
                  srai         s3, s11, 16
	fcvt.wu.s	a1, fs3, rne
                  fmax.s       ft3, fs2, fs4
                  mulhu        a4, t3, a0
                  remu         s0, s4, a0
                  srli         a2, s4, 22
                  or           s9, t5, a7
                  slli         a6, sp, 23
                  fsgnjx.s     fa3, fs4, ft2
                  xori         t0, s2, 1363
                  srl          zero, zero, a0
                  addi         zero, a1, 1066
                  sltiu        s8, a4, -1310
                  srl          s9, a5, gp
	fcvt.w.s	a7, fs6, rne
	fcvt.s.w	fa5, s7, rne
                  mul          s5, s6, s8
                  rem          s1, zero, t1
                  srl          s3, t2, s3
                  sll          s1, t6, a6
                  andi         s9, t4, 1227
                  slli         tp, s8, 21
	fsub.s	ft3, fa1, ft1, rne
                  fclass.s     s2, fs9
                  nop
                  div          a0, a4, t6
                  feq.s        ra, fa6, fs10
                  addi         t4, s7, 602
                  fmv.w.x      fa5, s0
                  slli         a7, t1, 8
                  mul          s3, t3, a2
                  slti         zero, a3, 1054
                  nop
                  addi         tp, a5, 1151
                  fsgnj.s      ft10, fa2, fs10
                  mulh         a7, s11, a7
                  flt.s        s6, fa3, fa5
                  fmax.s       fs5, fa1, fs6
                  fcvt.s.w     fa5, t1, rmm
                  fmax.s       fs9, ft8, fa5
                  ori          a2, t2, 1985
                  remu         t6, t3, ra
                  sra          t6, s9, gp
                  sra          s10, s10, a7
                  xor          a2, gp, a7
	fadd.s	fs8, fs2, ft6, rne
                  fmv.x.w      s2, ft6
                  mulhu        s2, s9, s4
                  srl          a0, s7, a5
                  addi         s1, a5, 908
                  divu         t4, a0, s11
                  flt.s        t4, ft10, ft6
                  srli         a2, a3, 12
                  slli         s8, t2, 6
                  srl          a4, ra, s6
                  add          zero, a4, s11
                  fmin.s       ft2, fa2, ft8
                  sub          s3, t4, s9
                  addi         s11, t5, 304
	fadd.s	fs5, ft7, ft4, rne
                  ori          t3, s11, -787
                  remu         s7, a7, a7
                  fmv.x.w      s9, ft1
                  fmv.x.w      t6, ft9
                  fmv.x.w      zero, ft7
                  sll          tp, a3, t1
                  sltiu        s0, s4, -915
                  fmv.x.w      a5, ft6
                  fmv.w.x      ft8, a1
                  div          a7, a3, a7
                  flt.s        a6, fs8, ft3
                  mulh         t0, ra, s1
                  xori         s0, t0, -500
                  add          s6, a3, a7
                  srai         s10, s9, 0
	fcvt.s.w	fa1, t3, rne
                  sltiu        tp, a4, 997
                  xor          s0, t0, t6
                  fsgnj.s      fa4, fa4, fs2
                  mulhu        s8, ra, a3
                  nop
                  mul          gp, a5, t5
                  flt.s        s5, fs11, ft9
                  feq.s        a2, fa0, fs9
                  ori          t4, t5, 841
                  lui          ra, 817198
                  sltiu        s8, s10, -114
                  sltu         t6, t2, t4
                  fsgnjx.s     fs6, fa5, ft10
                  mul          t0, t5, t6
                  srai         s0, s7, 6
                  fsub.s       fs1, fs10, ft4, rmm
                  fadd.s       fa1, fa7, fa1, rtz
                  sub          a2, s10, a2
                  sll          s8, sp, s8
                  addi         a7, s2, -1409
                  auipc        s10, 790043
                  fsgnj.s      fs1, ft9, fa0
                  ori          s10, t4, 1995
                  slt          ra, s11, s11
                  andi         a0, s8, 1823
                  ori          gp, t5, -1443
	fcvt.wu.s	s11, fa0, rne
                  remu         t4, t3, s3
                  fsgnj.s      fs3, fa1, fs2
                  and          s1, s9, s7
                  sra          t3, s3, s6
                  lui          a3, 595083
                  flt.s        s5, fs8, fa3
                  div          s5, s2, gp
                  slti         s6, a5, -247
                  flt.s        a6, fa3, fs4
                  andi         gp, s4, -1712
                  fmv.w.x      fa2, gp
                  add          t1, sp, a0
                  or           t4, a0, s8
                  fmax.s       ft2, ft11, ft10
                  addi         tp, s2, 752
                  ori          t6, t1, -390
                  srli         s1, t0, 2
                  and          ra, tp, a5
                  sra          s10, t4, tp
                  sll          a7, s3, s10
                  lui          s2, 522004
                  and          a6, sp, s9
                  sub          s6, ra, sp
                  lui          a6, 888080
                  or           s8, a6, t5
                  xori         s7, s4, 1610
                  xor          t6, t3, t3
                  fcvt.s.wu    fs2, s3, rne
                  lui          s11, 682232
                  slli         s9, a1, 15
                  sltiu        t6, s1, 243
                  fcvt.w.s     s8, fa7, rne
                  fmv.w.x      ft6, ra
	fcvt.s.wu	ft8, a2, rne
                  flt.s        zero, fs1, ft6
                  sll          s2, a6, s1
                  sra          zero, gp, s5
                  sub          s5, s11, s3
                  div          a0, a0, zero
                  sub          t0, t1, s4
                  and          s0, s10, t4
                  fmax.s       fa1, fs7, ft11
                  or           s10, a4, ra
                  auipc        a7, 286482
                  or           ra, t0, sp
                  fcvt.s.w     fs1, t6, rup
                  sra          a0, a1, a1
                  feq.s        a0, ft8, ft5
                  fsgnjn.s     fs2, fs1, fs2
                  slti         s9, s4, 1911
                  srl          s10, s3, a1
                  sub          tp, s0, s5
                  fcvt.wu.s    tp, ft10, rdn
                  xori         zero, s11, 802
                  mulhsu       a4, a5, s11
	fadd.s	fa0, fa0, ft8, rne
                  add          a6, s2, a7
                  feq.s        t6, fa6, fa6
                  and          t0, zero, sp
                  fcvt.s.w     fs0, s4, rup
                  fmax.s       ft0, ft0, fs10
                  fmv.x.w      a0, fs11
                  fsgnjn.s     fs10, fa0, fs11
                  fsgnjn.s     fa5, fs7, fs4
                  xor          a4, ra, s1
                  fsub.s       ft5, fs11, fa1, rdn
	fcvt.s.wu	ft11, a3, rne
                  sra          s10, t6, t2
                  fmin.s       ft3, fs0, fa5
	fadd.s	fs7, ft8, fs8, rne
                  slt          t1, t6, s1
                  fsgnj.s      fs2, fa7, ft0
                  flt.s        s0, fa5, fs2
	fcvt.s.w	ft2, t5, rne
                  or           s11, a3, s1
                  sra          s10, t1, s7
	fsub.s	fs11, ft5, fa6, rne
                  add          t6, t2, s3
                  sltu         tp, s6, gp
                  fmv.x.w      a4, ft11
                  remu         s11, a0, a5
                  fmax.s       fs5, fs1, ft6
                  fmv.x.w      s2, fs11
                  fle.s        ra, ft2, ft8
                  slti         s8, a0, -793
                  mulhu        sp, a3, s3
                  fsgnj.s      ft0, ft11, ft6
	fadd.s	fa5, fa2, fs3, rne
                  remu         a4, t2, a1
                  or           s0, s1, s2
                  fmv.w.x      fa7, s2
                  srl          zero, s6, s3
                  fsgnjn.s     ft2, ft5, ft10
                  andi         a2, a4, -552
	fadd.s	fs4, fs11, fa7, rne
                  fcvt.s.wu    ft2, s7, rne
	fcvt.s.w	fa1, a6, rne
                  fmax.s       fs10, fs8, fs4
                  fmax.s       ft5, fa6, ft9
                  feq.s        a4, fs9, fs9
                  feq.s        t6, ft10, fa0
                  xor          s10, a0, sp
                  remu         t3, s3, gp
                  mulhu        s11, s6, a2
                  fle.s        ra, fs6, ft0
                  feq.s        t6, ft1, fs7
                  srl          s11, a5, t0
                  mul          a0, t4, zero
                  srl          t1, tp, s5
                  mulhsu       a4, t1, a3
                  lui          t0, 681403
                  fsgnjn.s     ft10, fs10, fa6
                  mulhsu       t1, a2, a7
                  mulhsu       s6, s3, a4
                  and          t3, tp, t3
                  ori          s5, a2, -1539
                  ori          t4, s9, 1592
                  fsgnjn.s     fa1, fs10, fa2
                  sltu         s3, s7, s7
                  slt          s9, s10, s11
                  srl          sp, s1, t2
                  xori         s6, t6, 126
                  slt          a4, a1, s11
                  fclass.s     s6, fa7
                  feq.s        t6, ft5, ft2
                  fclass.s     s7, ft10
                  sltiu        a7, a7, -1992
                  xori         gp, t3, -846
                  ori          gp, s8, 1928
                  sub          s5, a3, s6
                  lui          a7, 876988
                  fmin.s       fs2, fs11, fs6
                  fmin.s       ft2, fs0, fa1
                  sll          s7, sp, t2
                  fadd.s       fa4, ft4, ft6, rmm
                  feq.s        a2, fs10, ft6
                  or           s3, s4, a4
                  auipc        a6, 664616
                  andi         a7, t2, -1125
                  srai         t0, s0, 14
                  slti         a6, a5, 328
                  xor          s9, s6, s5
                  fmv.w.x      fs1, s1
                  and          sp, s5, a1
                  sltiu        s7, a3, -1843
                  auipc        a3, 423489
                  andi         a3, a2, -1492
                  rem          a3, a7, sp
                  srai         a6, s1, 19
                  fle.s        t4, fs10, fa2
	fadd.s	ft9, ft9, fs8, rne
                  srl          s7, t5, s5
                  fsgnjx.s     fa5, fs6, fs3
                  sltu         s8, s10, t4
                  slli         a0, t5, 1
                  auipc        ra, 573632
	fcvt.s.wu	fs0, t5, rne
                  ori          s9, a4, 12
                  rem          ra, sp, a1
                  divu         a0, a2, s7
                  slt          t0, s10, a6
                  add          t3, a3, ra
                  and          a2, s10, ra
                  sra          s8, t3, t2
	fcvt.s.w	fs1, ra, rne
                  mulhu        s7, s3, t4
                  slli         t1, a0, 22
                  sltu         t4, s8, a0
                  fcvt.s.w     ft11, s5, rup
                  auipc        s9, 621707
                  lui          a6, 710562
                  fsgnj.s      ft1, fs9, fs2
                  and          s0, zero, ra
                  add          a0, a1, s4
                  fmin.s       ft8, fa3, fa3
                  add          zero, a2, a1
                  sltu         a5, s4, s2
                  add          a6, a7, s10
	fcvt.w.s	s2, fs6, rne
                  auipc        a5, 323030
                  fsgnjn.s     fs1, ft8, fs3
                  rem          gp, s8, t3
                  ori          a3, gp, 316
                  auipc        a1, 158398
                  lui          t1, 776764
                  remu         a6, t5, a4
                  sub          a5, s10, s9
                  sltu         t1, s8, s5
                  ori          a1, t6, -1307
                  mulhu        s10, a1, t1
                  srai         a6, s7, 23
                  sltiu        a0, a2, -806
	fcvt.s.wu	ft11, t2, rne
                  fcvt.wu.s    zero, fs9, rup
                  rem          sp, t3, t4
                  div          ra, t5, s10
                  fcvt.wu.s    t1, ft5, rmm
                  srai         s3, zero, 1
                  fmin.s       fa0, fa7, ft6
                  divu         a7, s2, gp
                  div          s10, s9, a3
                  srl          t6, t3, t1
                  andi         ra, s10, 530
                  mulhsu       tp, a3, s11
                  divu         s3, t1, gp
                  fadd.s       fa4, fa1, fs7, rmm
                  fadd.s       fs0, fa2, ft1, rmm
                  xori         s9, a6, 273
                  slt          s2, s7, a4
                  mulh         ra, ra, t4
                  nop
                  rem          s6, s2, s4
                  sltu         s3, ra, zero
                  rem          t0, a1, s0
                  fsub.s       ft9, fa3, fa2, rmm
                  mul          s0, s2, tp
	fcvt.s.w	fa4, sp, rne
                  fmax.s       fs3, ft11, fs11
                  ori          a1, a2, -1060
                  xori         a2, zero, 1991
	fcvt.s.w	fs4, s7, rne
                  or           a2, a6, s2
                  fmax.s       fs2, fs9, fs3
                  srli         s5, s9, 21
                  sll          a7, s9, t4
	fcvt.s.wu	ft1, a5, rne
                  sll          a5, s1, s3
                  fmin.s       fs7, fs0, ft6
                  fmv.x.w      t1, fs10
                  nop
                  slt          s9, t3, s11
                  ori          a0, gp, -1670
                  sltu         a2, s2, a0
                  fsgnj.s      ft6, ft9, ft7
                  rem          a7, a6, s9
                  fsgnj.s      ft4, ft6, fs3
                  fmv.w.x      fs1, s9
                  auipc        s7, 167311
                  fmv.x.w      a2, ft1
	fsub.s	fs7, ft4, ft8, rne
                  fle.s        s1, fa0, ft9
                  lui          a0, 108292
                  mulhsu       zero, a4, ra
	fcvt.wu.s	s9, ft9, rne
	fcvt.wu.s	a1, ft9, rne
                  mulhsu       t1, a5, t0
                  fcvt.s.w     ft4, t3, rup
                  fmv.x.w      t4, fs1
                  lui          a5, 682955
                  divu         s0, s6, zero
                  lui          s6, 509177
                  divu         s2, zero, s4
                  srli         ra, s10, 9
                  andi         t3, t4, 1551
                  addi         s2, a6, 1704
                  xori         a6, sp, -283
                  addi         zero, t3, 971
                  divu         tp, a6, a1
                  lui          zero, 706350
                  srl          a5, gp, t5
                  xor          a7, s4, tp
                  fcvt.s.wu    fa7, zero, rdn
                  nop
                  fsgnjx.s     ft3, fa5, ft1
                  rem          a3, t0, s4
                  remu         a5, tp, s10
                  xor          s2, a5, s8
                  fsgnjx.s     ft11, fa1, fs4
                  sltiu        ra, s7, -1228
                  sub          zero, a2, s3
	fcvt.s.w	fa4, s6, rne
                  mulhu        a3, sp, s11
                  mulh         s6, gp, a5
                  sltu         a7, a6, t1
                  fmv.x.w      s9, ft2
                  slti         a1, t4, -2019
                  sra          a7, gp, s4
                  xor          a1, a1, a0
	fcvt.wu.s	ra, fa5, rne
                  mulhsu       a5, s7, ra
                  fcvt.wu.s    a0, ft5, rtz
                  slt          a6, t6, a7
                  sltiu        sp, a1, -950
                  auipc        zero, 500887
                  sra          a0, a1, t6
                  fcvt.w.s     t1, ft4, rdn
                  auipc        s6, 285780
                  sltiu        a4, s10, -1028
	fcvt.w.s	s3, ft5, rne
                  nop
                  fle.s        a3, fa6, ft5
                  or           tp, s1, a0
                  xor          s11, t0, s5
                  addi         s5, s5, -1750
                  fcvt.wu.s    t0, fs1, rdn
                  fmv.w.x      ft11, a1
                  fadd.s       fs6, fs6, fs9, rtz
                  mulh         sp, s0, s0
                  sltu         a1, a4, t1
                  div          t4, a2, t0
                  andi         a0, s11, 1839
                  divu         t6, t3, s8
                  srai         s8, a6, 18
	fcvt.s.w	ft5, a7, rne
                  sltu         a6, s9, s3
                  srli         s9, s7, 12
                  andi         s9, a1, 727
                  flt.s        tp, ft6, fa4
	fcvt.w.s	s2, ft4, rne
                  addi         a2, t4, -244
                  divu         s6, a1, s7
	fsub.s	fs6, ft0, fa0, rne
                  fclass.s     a0, fs2
                  remu         a0, a1, t4
                  fmax.s       fa6, ft11, ft2
                  fcvt.s.w     fa7, t6, rtz
                  xor          t4, gp, s9
                  fmv.w.x      ft4, t0
                  sltu         s8, sp, a1
                  fcvt.w.s     s6, ft7, rne
                  slli         tp, a7, 3
                  nop
                  srai         t4, t6, 3
                  rem          s3, gp, a1
                  srli         t0, a5, 8
                  fsgnjn.s     fa2, fa5, fs4
                  fsgnjx.s     ft1, fa3, fa4
                  xori         a0, tp, 1117
                  srli         t4, s8, 26
                  mul          t4, a7, a6
                  addi         sp, a5, -1966
                  fcvt.wu.s    s6, fs8, rne
                  fmin.s       fa2, fs5, fs8
                  srl          s9, a2, t0
                  srli         a2, s4, 17
                  or           a4, s1, s10
                  fmv.w.x      fs3, ra
	fcvt.s.wu	ft10, a3, rne
                  mulh         s11, t2, a7
                  fsgnjx.s     ft6, fs1, fs9
                  mulh         s5, t3, s2
                  mulhsu       s3, s7, a1
                  add          a1, gp, t4
                  lui          a3, 313559
                  srl          t1, t1, s11
                  fmax.s       fs3, fa3, fs4
                  ori          a6, s2, 115
                  fmin.s       ft4, fa4, fs10
                  div          a1, a2, gp
                  andi         s11, zero, 1360
                  slli         t3, zero, 29
                  srli         a2, s3, 14
                  addi         a5, t0, 214
                  divu         s9, s5, a6
                  rem          t6, s0, t4
                  srli         a5, a1, 19
                  sub          s6, s6, ra
                  fcvt.w.s     a2, fs4, rdn
                  slt          sp, t0, s1
                  fmin.s       fs10, fa0, fs8
                  nop
                  xor          sp, a5, t1
                  fcvt.wu.s    a7, ft1, rne
                  sll          s8, t6, s7
                  fmv.x.w      s9, fs4
                  srli         t6, a4, 19
                  srli         s5, s5, 10
                  andi         a0, t0, -1995
                  slli         s10, a6, 22
                  fclass.s     s6, fs10
                  sra          a6, s1, s8
                  slli         a1, s10, 18
                  srai         a6, t6, 7
	fcvt.s.w	ft11, s3, rne
                  srai         t3, s1, 11
                  remu         s9, a3, s5
                  sll          a0, t1, t4
                  fmax.s       fa7, fs10, fa2
                  srli         s1, s8, 3
                  xor          s1, s8, s5
                  divu         a6, a1, tp
                  mulh         a1, t5, s5
                  xori         a0, t4, 724
                  fle.s        ra, ft6, fs3
                  divu         s0, t3, a7
                  mul          t1, s4, s6
                  auipc        sp, 874254
                  andi         t1, a3, -674
                  srl          a1, t3, s7
                  fsub.s       fs0, ft9, fs7, rmm
                  fmin.s       fs11, ft10, fa6
                  fle.s        zero, fs8, ft8
	fadd.s	fs4, fs4, fs7, rne
                  fclass.s     sp, fs1
                  slli         t3, zero, 19
                  fclass.s     a1, fs1
                  fmv.w.x      ft7, a1
                  slt          a7, s4, t0
                  fcvt.w.s     s6, fa1, rne
                  sll          s7, sp, s0
                  srli         s8, a5, 22
                  addi         s7, sp, -2010
                  addi         t3, s11, -1094
                  fmv.x.w      t3, ft6
                  xori         t0, s1, -961
                  sltu         s7, t1, s1
                  add          t0, s3, s4
                  andi         s11, a5, -319
                  xor          a0, a0, a1
                  fmv.w.x      fs3, t0
                  fcvt.s.wu    fs4, s6, rup
                  fcvt.s.wu    ft9, s0, rmm
                  slli         a1, t2, 1
                  slti         s3, a5, 1094
                  fcvt.wu.s    s3, fa7, rmm
                  fsgnj.s      ft2, fa4, fs8
                  fle.s        a7, fa2, fs3
                  fmv.x.w      a5, fs4
                  xori         t6, sp, -267
                  xori         tp, s8, 1231
                  slt          t6, t4, s0
                  fsgnjn.s     fs1, fa3, fa7
                  ori          sp, s9, -1639
                  mulhsu       gp, s6, t1
                  slti         sp, sp, 1884
                  fsgnj.s      fa6, ft10, fs10
                  divu         s6, t5, s3
                  fclass.s     a3, fs6
                  andi         a5, tp, -1041
                  fsgnjx.s     fa5, fa0, fa4
                  slli         tp, s6, 29
                  fmv.w.x      ft2, zero
                  fmv.x.w      s1, fs1
                  sub          a7, s1, s2
                  fcvt.s.wu    fa7, s11, rtz
                  and          a1, tp, t3
                  sub          s8, t1, s2
                  sra          t0, a4, s8
                  fmv.x.w      a6, fs4
                  auipc        t4, 504320
                  fclass.s     ra, ft8
                  srli         sp, t6, 15
                  fmv.x.w      t4, fs0
                  fmv.w.x      fa2, s11
                  fle.s        a0, fs8, ft0
                  mulhu        s10, t6, a7
                  mul          s8, s10, s7
                  mul          t3, a0, s0
                  addi         tp, t5, 1796
                  and          a7, s10, s4
                  srl          s7, s0, t5
                  sra          s1, a5, a5
                  addi         sp, s1, 7
                  xor          a2, zero, t6
                  fcvt.s.wu    fs5, a5, rup
                  rem          s1, zero, t1
                  flt.s        zero, fs1, fa3
                  add          t1, a6, t1
                  remu         t6, t2, s11
                  xor          t3, t3, ra
                  sra          a3, a0, t0
                  nop
                  mul          sp, t1, a6
	fcvt.w.s	a3, fs7, rne
                  sra          a1, s11, s11
	fcvt.w.s	a1, fa4, rne
                  srli         a6, t5, 16
                  sltiu        a0, s5, -1225
                  nop
                  fcvt.s.w     fs6, sp, rne
                  fcvt.wu.s    s9, fa3, rup
                  slt          a2, s7, s9
                  and          s1, a3, s0
	fcvt.s.wu	ft0, s6, rne
                  flt.s        s3, ft4, ft1
                  fsgnjn.s     fs8, fs4, ft2
                  sltu         t1, s9, t3
                  fmin.s       ft6, ft0, fa7
                  xor          t3, a1, t5
                  srli         a4, t5, 28
                  fmv.x.w      a6, ft0
                  sltu         s1, s9, a1
                  divu         a1, tp, a6
                  srli         t3, s1, 24
                  nop
                  fsub.s       ft3, fs8, fs8, rne
                  andi         sp, s5, -266
                  feq.s        s5, fa0, fs8
                  fsgnjx.s     ft0, fa3, fs3
                  auipc        a0, 865997
                  fle.s        a7, ft6, ft0
                  nop
                  or           zero, zero, t2
                  or           t0, t0, s0
                  fsgnj.s      fa6, fs7, fs0
                  auipc        zero, 56155
                  fcvt.s.wu    fs3, t2, rdn
                  fmv.w.x      ft5, s8
                  sra          gp, a7, s8
                  sltu         s2, a1, t4
	fcvt.w.s	sp, ft8, rne
                  add          a1, gp, zero
                  slti         zero, a2, -1452
                  auipc        a1, 369355
                  srli         sp, t6, 8
                  fsgnjn.s     ft6, fs7, ft10
                  mulhu        s6, a4, s6
	fcvt.s.wu	fs11, t6, rne
                  fcvt.s.w     fs2, s11, rtz
                  mulh         t6, s9, a4
                  fsgnjx.s     fs5, fa3, fs4
	fadd.s	fa5, ft4, fa1, rne
                  add          s8, s9, s10
                  fsgnjx.s     fs4, fa3, fs3
                  srl          a5, t5, a7
                  slt          a4, a6, tp
                  mulhsu       a1, a7, s1
                  ori          a1, t5, 1658
                  fcvt.wu.s    s3, fs2, rdn
                  fcvt.w.s     a6, fa1, rmm
                  fcvt.wu.s    t4, fa2, rdn
                  divu         s5, a0, s5
                  fadd.s       fa6, fa2, fs4, rdn
                  fsgnjn.s     fs8, fs2, ft1
                  fsub.s       ft5, ft4, fs5, rup
                  divu         sp, a5, a4
                  divu         t4, s10, s7
                  addi         s2, t3, -1541
                  ori          a3, s6, 204
                  auipc        s7, 335462
                  xori         a3, zero, -332
                  fsgnj.s      ft9, fs4, ft8
                  srli         a6, gp, 20
                  srli         s8, s9, 19
                  remu         s10, t5, a0
                  fmin.s       fa7, fs0, fs3
                  sll          t0, t3, s6
                  rem          t6, s8, a1
                  xor          s1, a4, t0
                  sltiu        a4, zero, -1217
                  mulhsu       t0, zero, a0
                  sub          s6, s1, a5
                  srli         tp, t5, 21
                  fsub.s       ft6, ft7, ft6, rne
                  sub          s8, zero, a1
                  andi         ra, a2, -729
                  fle.s        s11, ft2, ft2
                  mulhsu       s0, gp, t2
                  mul          s0, s5, s7
                  fcvt.wu.s    t0, fa3, rtz
                  mulhu        t3, a2, t1
                  fle.s        s9, ft6, ft5
                  and          t3, s11, s4
                  srli         s8, a2, 2
                  fcvt.s.w     ft1, t0, rmm
	fcvt.s.w	ft2, a4, rne
                  slt          t3, t4, gp
                  mul          s2, s8, a1
                  slti         t4, t4, 1789
                  flt.s        t0, fa0, ft11
	fadd.s	fa4, ft4, fs2, rne
                  fmv.x.w      a7, fs4
	fcvt.s.wu	fs4, a6, rne
                  lui          s3, 783599
                  mul          s11, sp, a2
                  mulhsu       a0, ra, ra
                  xori         a6, t5, -1339
                  mulhsu       ra, ra, a0
                  mul          a2, t6, s10
                  sub          t4, a5, sp
                  sub          s8, a2, s11
                  fcvt.w.s     ra, fs2, rup
                  rem          a1, a4, a1
                  fclass.s     s11, ft9
                  mul          s3, t6, s3
	fadd.s	fs6, fs8, fs8, rne
                  divu         a4, a6, s6
                  fmax.s       fs10, fs5, fa7
                  fsgnjn.s     fa1, ft10, ft2
                  slli         a4, s3, 9
                  auipc        t6, 39198
                  fle.s        a7, ft7, fs9
                  fsgnjx.s     fs0, fs3, fs9
                  nop
                  slti         t1, zero, 1566
                  ori          s5, s0, 1768
                  div          s1, s0, t2
                  slli         t1, sp, 8
                  sra          tp, a0, s10
                  sltu         t6, s8, a0
                  add          a6, s3, t2
                  mul          gp, t2, a4
                  fsgnjx.s     ft8, ft4, fs6
                  add          s6, s9, t3
                  fmin.s       fa1, ft2, ft0
                  sub          gp, a7, s8
                  auipc        t6, 193936
                  sra          a7, s2, a6
                  srl          a3, s5, t3
                  fsgnj.s      ft10, fa6, ft6
                  flt.s        s8, fa4, ft10
                  xori         s9, a4, 281
                  div          a2, a6, a3
                  slt          a7, t1, s1
                  sll          zero, t4, t4
                  fsgnjn.s     fs8, ft10, ft2
                  fsgnjn.s     fa5, ft10, ft2
                  fsgnj.s      ft1, ft0, fs0
                  fmv.w.x      ft3, t2
                  or           s8, t5, t4
                  nop
                  fsgnjn.s     ft8, ft6, fs8
                  fmv.w.x      fa4, s4
                  srli         s8, a1, 0
                  slti         s2, t5, -150
                  mulhu        gp, a2, t1
                  sltiu        s6, a4, 981
                  fcvt.w.s     a1, fs1, rdn
                  srli         s11, t1, 21
                  sll          zero, s11, a6
                  srai         t3, s4, 0
                  and          a7, a0, ra
                  fmin.s       ft2, fa6, fs1
                  addi         t3, gp, -662
                  fcvt.s.wu    fs6, a5, rmm
                  sub          s8, a7, s5
                  fmin.s       fa7, ft11, ft9
                  fsub.s       ft7, fs4, fs8, rtz
                  add          zero, t6, t3
                  add          a6, a4, a0
                  fmax.s       ft4, ft8, ft3
                  fcvt.s.wu    ft3, a5, rtz
                  mulhu        a1, s4, t6
	fcvt.s.w	fs3, s8, rne
                  addi         sp, s1, 1416
                  rem          zero, a7, a6
                  fsgnj.s      fs11, ft3, fs1
                  fle.s        s11, ft6, fs0
                  fmin.s       ft5, fs11, fa4
                  lui          s8, 685848
                  fclass.s     ra, ft8
                  sll          s10, a4, sp
                  or           s5, gp, a0
                  fcvt.s.w     fs0, gp, rne
                  fsub.s       fs8, fa1, ft7, rmm
                  fmin.s       ft5, fa5, fa5
                  fclass.s     t0, fa3
                  fclass.s     a7, fs4
                  fclass.s     ra, ft5
                  ori          s2, tp, -1355
                  feq.s        t3, ft8, fs8
                  fsgnjx.s     fs3, fa0, fa5
                  sltiu        a6, s5, -555
                  mulh         a6, a1, s2
                  flt.s        ra, ft0, ft5
                  auipc        a3, 318330
                  xori         t1, t3, 1932
                  sub          s3, a4, t2
                  fmv.x.w      a1, ft7
                  fmv.x.w      a2, fa3
                  srl          a0, zero, zero
                  sltiu        t4, t0, -1040
                  xori         a5, zero, 1191
                  fmin.s       ft5, ft3, fa6
                  ori          t4, s11, -622
                  mul          s8, a3, s10
                  srl          t0, a4, s10
                  addi         t6, zero, 1616
                  xor          a5, t4, s2
                  sltiu        a3, s8, -355
                  auipc        s1, 21516
                  fsgnjn.s     ft1, ft2, fa2
                  sub          s11, t6, gp
                  fmv.x.w      a3, ft8
                  andi         gp, sp, 15
                  fmv.w.x      fs10, s6
                  srli         a4, a7, 5
                  auipc        ra, 306608
                  nop
                  fmv.x.w      ra, ft6
                  fcvt.w.s     tp, fa7, rdn
                  mulh         s9, s0, t4
                  flt.s        a5, fs6, fa2
                  or           t4, s5, t3
                  fsgnj.s      fs6, ft5, ft0
                  ori          s10, a2, 534
                  mul          a7, ra, t1
                  remu         gp, s3, t0
                  fsgnjn.s     ft7, fs7, fa6
                  divu         s9, s9, ra
                  or           ra, s10, s4
                  sll          t4, a5, a6
                  ori          t3, sp, 1147
                  srli         a2, s6, 0
                  mul          a1, t5, sp
                  flt.s        a0, fs1, fs10
                  and          tp, s9, s10
                  rem          t4, s4, s4
                  fmv.w.x      fs10, tp
                  fsub.s       ft3, ft8, ft7, rup
                  xor          t6, s1, t0
                  fmv.x.w      tp, ft6
                  auipc        a1, 1026846
                  divu         t4, t6, a0
                  fsgnj.s      fs9, fa5, ft11
                  sltu         t4, s5, s6
                  fle.s        s2, fs9, fs8
                  remu         s8, sp, t2
	fcvt.w.s	s2, ft6, rne
                  sltiu        ra, s5, -1294
                  add          s3, a6, s6
                  feq.s        a2, fa7, fa6
                  mulhsu       a5, t2, s11
                  fclass.s     t0, fs0
                  xor          s6, a3, t3
                  andi         zero, s0, -575
                  feq.s        a6, ft1, ft4
                  fcvt.w.s     t6, fa2, rtz
                  flt.s        a7, ft11, fs3
                  or           s1, t3, sp
                  xor          tp, ra, t3
                  rem          s6, ra, s6
                  fcvt.wu.s    ra, fa0, rmm
                  fclass.s     t6, ft6
                  srl          ra, gp, gp
                  fmv.x.w      t0, fa0
	fsub.s	ft0, fs1, fs1, rne
                  sra          a5, a7, s9
                  slt          tp, a0, t3
                  fclass.s     s6, ft9
                  fle.s        t4, ft11, ft7
                  slt          a5, t3, a4
                  fsgnjx.s     fs9, fa2, fa5
                  fsgnjn.s     fs2, fa1, fs1
                  sltu         ra, sp, a1
                  mulhu        zero, gp, sp
                  slli         s5, tp, 8
                  nop
	fcvt.s.w	ft6, tp, rne
                  andi         s3, t3, -602
                  mulhsu       s2, s8, s7
                  fsgnjx.s     ft7, fs11, fs4
                  fmax.s       fs2, ft5, fs5
                  lui          a4, 402348
                  fle.s        s5, ft1, fa2
                  sltiu        t1, t4, 1100
                  sra          a7, zero, a0
                  sltiu        s0, a4, -1871
	fadd.s	fs7, ft6, fa4, rne
                  rem          s1, s7, sp
                  fsgnjn.s     fa3, fs4, ft3
                  srai         sp, a1, 1
                  fmv.x.w      ra, fa4
                  lui          a6, 675541
                  slt          t3, tp, t4
                  fsgnjx.s     fs11, fs1, fs6
                  and          t0, s1, a7
	fcvt.w.s	t0, fa3, rne
                  fsgnjx.s     fs0, ft10, fs8
                  addi         s7, t5, 907
	fcvt.s.wu	ft2, zero, rne
                  remu         s9, a6, s10
                  fmin.s       fa1, fs6, ft7
                  fmax.s       fs6, fa2, ft8
                  remu         s1, a2, s9
                  xori         a7, a5, -676
                  sltu         gp, s8, s11
                  fcvt.s.w     fs2, a3, rne
	fcvt.s.w	fa3, s0, rne
                  auipc        s3, 499256
                  slti         sp, t5, 1920
                  mul          s7, t4, a3
                  fle.s        a0, ft6, fs11
                  fmin.s       fs3, fs7, ft5
                  mulh         ra, s2, t2
                  sub          a2, s9, t5
                  slli         s9, s3, 5
                  srli         s3, gp, 10
                  fmax.s       fa6, fs7, fa2
                  addi         s2, ra, -1043
                  sltu         s2, t4, a6
                  or           t6, a7, s0
                  fmin.s       ft1, ft8, ft1
                  remu         a1, s5, zero
                  divu         s10, a0, a3
                  srli         a0, s8, 30
                  fsgnjn.s     fs8, ft7, fa5
                  fcvt.w.s     s11, fs2, rup
                  sltu         a6, a5, t6
                  fcvt.s.w     fs11, sp, rup
                  mulhsu       s9, a5, s7
                  xori         t0, zero, 1175
	fcvt.s.wu	fs0, s2, rne
                  fsgnjn.s     fs7, ft2, fs6
	fcvt.s.w	fa3, t6, rne
                  remu         s5, s9, s10
	fadd.s	fa5, ft1, fs1, rne
                  addi         a1, s3, -1375
                  slti         zero, s10, 430
                  rem          s11, t1, tp
                  mul          a2, a3, s4
                  sltiu        t4, t3, 658
                  fcvt.s.w     ft0, sp, rne
                  div          a5, s6, t5
                  sltiu        gp, a2, 1450
                  fle.s        t3, fa2, ft0
                  sltiu        s3, s1, 2017
                  fsgnjx.s     fa4, ft7, fa7
	fadd.s	fs2, fs6, fa5, rne
                  srai         a0, s11, 6
                  sltu         s11, zero, s9
                  fmv.x.w      a5, fs1
	fadd.s	fs7, fs7, fs1, rne
                  srai         zero, a2, 11
                  nop
                  mulhsu       s10, s3, a6
	fcvt.wu.s	a4, fs4, rne
                  sltu         t3, s9, s9
                  feq.s        s11, fa3, fs4
                  fsgnjn.s     fs2, ft5, fs5
                  fsgnjn.s     fs7, fs8, fs1
                  slli         s2, s2, 31
                  fadd.s       ft6, ft6, ft10, rtz
	fcvt.w.s	a6, fs7, rne
                  feq.s        s1, ft10, ft7
                  feq.s        zero, fa0, fs10
                  sltu         a2, sp, s2
                  fsgnjx.s     ft2, fs7, fa1
                  fmax.s       fs9, ft7, fa7
                  fmv.x.w      s5, fs7
                  slt          a1, t6, tp
                  fsgnj.s      fa2, fa3, fs11
                  remu         s5, gp, a3
                  add          gp, a6, s0
                  sub          a4, s11, a2
                  lui          s6, 82293
                  fclass.s     s9, fs11
                  sub          s8, s11, t6
                  feq.s        t4, fa7, fs9
                  mulh         a6, s0, a0
                  mulhu        s6, t2, a3
                  lui          t3, 437042
                  fsgnj.s      fs10, fs9, fs6
                  fsub.s       fa4, fs3, fs9, rup
	fadd.s	fs2, fs6, ft11, rne
	fadd.s	fs3, ft6, ft11, rne
                  xor          a2, ra, t5
                  andi         a4, a0, -833
                  div          t3, a3, a4
                  fsgnjx.s     fs5, fs10, fs0
                  ori          a6, a0, 1592
                  fsgnj.s      ft10, fa5, ft5
	fsub.s	fa1, fa1, fa4, rne
                  mulhsu       a4, s3, a6
	fcvt.wu.s	a0, fs2, rne
                  fsgnjn.s     fs10, ft1, fa2
                  mulhu        a3, gp, s2
                  feq.s        zero, ft9, ft6
                  xori         a3, t3, -222
                  feq.s        a2, fa1, fa2
                  fle.s        gp, ft6, fs10
                  remu         t0, s3, ra
	fcvt.w.s	a4, fa7, rne
                  fmv.w.x      fs3, a7
                  mulhu        a0, sp, s1
                  slt          s9, a1, s11
                  fmin.s       fa3, fa6, fs6
                  div          s9, s3, a5
                  mul          gp, s5, a7
                  sub          a6, s6, s4
                  mul          s3, s5, a7
                  and          a1, s5, t2
	fadd.s	fs11, fs11, fs8, rne
                  feq.s        a4, fa2, fs11
                  ori          s1, t2, 927
	fcvt.wu.s	t4, fs7, rne
                  sra          a6, s11, s9
                  slti         s3, s2, 1968
                  srli         s5, s1, 0
                  xori         s6, a1, -1213
                  fmax.s       fa0, fa5, fs1
                  srai         a6, tp, 13
                  auipc        s7, 948157
                  fclass.s     s1, fs4
                  slt          s10, s2, a3
                  divu         s11, s0, t2
                  add          t1, a0, a4
                  div          s6, a4, s4
                  sltiu        s5, t2, 1060
                  feq.s        a3, fs3, ft7
                  lui          s1, 182654
                  div          gp, s8, tp
                  and          sp, a3, a2
                  slti         a0, s9, -522
                  mulh         s11, s0, gp
                  mulhsu       t0, ra, zero
	fadd.s	fs11, ft10, fa1, rne
                  sra          tp, t6, t0
	fsub.s	fa4, ft2, fs4, rne
                  and          s5, ra, sp
                  flt.s        s11, fs1, fs8
                  auipc        tp, 953043
                  sltiu        s8, t4, -1905
                  mulhu        a6, ra, a0
                  sra          s6, s7, t0
                  or           t3, s11, sp
                  sra          s5, t3, a2
                  ori          s9, s3, 1359
                  flt.s        a3, fs9, ft11
                  lui          gp, 175080
                  srli         zero, t2, 6
                  slli         s5, zero, 6
                  lui          s3, 223954
                  fmv.w.x      fs9, t3
                  nop
                  flt.s        s0, ft1, fs5
                  remu         a2, a7, t3
                  srli         ra, s2, 15
                  slt          a3, t4, a4
                  sub          a7, ra, s7
                  auipc        a2, 955244
                  fsgnjn.s     fa4, fs0, fs11
                  add          t6, gp, a0
                  mulhsu       ra, s10, a2
                  mulh         tp, t4, zero
                  andi         a6, t2, 402
                  fclass.s     a3, ft6
                  andi         s5, s8, 935
                  lui          t4, 1044629
                  or           gp, a6, tp
                  fmax.s       fa0, ft7, ft7
                  add          a4, tp, sp
                  fcvt.s.wu    fs8, s0, rdn
                  fmv.x.w      sp, ft10
                  nop
                  xori         t3, s4, 355
                  mulhu        s11, s0, a2
                  srai         a0, t0, 26
                  and          a6, t4, t1
                  add          s8, a5, sp
                  srli         ra, a6, 7
                  fcvt.wu.s    s8, fs0, rmm
                  flt.s        s7, fa0, fs8
                  flt.s        s10, ft5, fa2
                  srai         s5, gp, 23
                  xori         a0, t1, -485
                  nop
                  div          a7, a5, a3
                  and          a6, gp, zero
                  sltiu        ra, s10, 1757
                  fcvt.wu.s    s3, ft0, rdn
                  or           s7, s7, a0
                  fadd.s       fa4, fa7, ft11, rup
                  addi         s3, a3, 1179
	fcvt.w.s	s6, fa3, rne
                  feq.s        s2, ft5, ft9
                  mulhu        s0, s3, t2
                  rem          ra, s2, zero
                  fmin.s       fs8, fs0, ft7
                  mulhu        tp, a4, s11
                  nop
                  andi         t1, t4, 728
                  srl          s11, gp, s1
                  mulhu        a6, s2, zero
                  fcvt.wu.s    a5, ft5, rdn
                  srli         tp, a2, 28
                  mulh         t4, a2, t0
                  sll          s9, t1, t0
                  srai         s6, a7, 8
                  fcvt.w.s     s9, fa1, rup
                  srai         t1, a4, 26
                  div          s5, a5, t0
                  slti         a4, a1, 175
                  rem          s7, a7, t4
                  sltiu        s10, tp, -46
                  feq.s        t4, fa2, fa3
                  srai         sp, tp, 15
                  fclass.s     zero, fs3
                  flt.s        zero, fs5, fs11
                  fmin.s       fs5, fs2, ft5
                  ori          s1, tp, 1311
                  flt.s        a3, ft0, fs3
                  fle.s        s0, fs9, fs3
                  fsgnj.s      ft2, fa6, fa7
                  xor          tp, t2, s4
                  slli         s7, t5, 13
                  xori         a4, t3, -1009
                  fmv.w.x      fs8, a1
                  mulhsu       s7, a6, a3
                  mulhsu       s8, s10, zero
                  div          a1, s10, s5
                  flt.s        a1, ft3, fa4
                  nop
                  slt          s8, a2, s7
                  xor          s3, s4, a1
                  mulhsu       a5, t2, a6
	fcvt.wu.s	s11, fs7, rne
                  fmv.x.w      a0, ft2
                  sra          a5, a5, s11
                  fsgnjx.s     fa7, fa2, ft10
                  fadd.s       fa1, ft1, ft7, rup
                  fmax.s       fs7, ft6, fs6
                  mul          t0, tp, a3
                  fsub.s       ft10, fa4, fs9, rup
                  fcvt.w.s     t3, fs0, rtz
                  addi         t4, s5, -1826
                  lui          s8, 667168
                  srl          a0, a4, a4
                  fmin.s       fs4, ft7, fs1
                  addi         a4, t4, -1899
                  sll          zero, a0, s2
                  slti         a0, zero, -1665
                  xori         s1, a1, 920
                  addi         gp, a3, 681
                  fcvt.wu.s    a3, fa2, rup
                  fsgnjx.s     fs8, fa2, fa4
                  or           s6, tp, s5
	fsub.s	fa4, ft7, ft4, rne
                  rem          s5, s0, a1
                  fcvt.w.s     t1, fa6, rne
                  addi         a0, s4, -563
                  feq.s        gp, ft7, ft2
                  sra          t4, s5, t2
                  fclass.s     s5, fs3
                  sltu         t3, t3, s3
	fcvt.s.wu	fs0, s1, rne
                  fadd.s       ft5, fs4, ft10, rup
                  fadd.s       ft2, ft11, fs2, rtz
                  fclass.s     zero, ft9
                  divu         t1, t1, tp
                  sltu         t4, ra, t2
                  flt.s        s3, ft8, ft2
                  fle.s        a5, fa5, fs3
                  addi         s1, a3, -369
                  srai         sp, sp, 22
                  lui          t6, 536727
                  mul          a0, s4, s4
                  fsgnjx.s     ft9, ft2, fa6
                  fsgnj.s      fa5, fa7, ft8
                  slt          s8, s3, tp
                  fmv.w.x      fs2, s4
                  fcvt.wu.s    s9, fa7, rmm
                  nop
                  fle.s        ra, ft9, fa6
                  srai         t6, a6, 6
                  addi         a3, t3, 421
                  fle.s        a5, fa7, fa3
                  mulh         s5, s8, tp
                  fmv.x.w      t1, ft2
                  fmv.x.w      s3, ft9
                  rem          tp, t1, s1
                  sra          s1, a2, s4
                  addi         s5, a7, 1867
                  feq.s        gp, fs2, fa4
                  flt.s        s5, fs7, fs10
                  srai         sp, s7, 20
                  srl          s8, a4, t0
                  slli         a7, zero, 18
                  nop
                  fsgnjx.s     ft8, ft8, ft4
                  fmv.x.w      t4, ft6
                  mulhu        s9, a7, s9
                  mulhsu       t4, t2, zero
                  feq.s        zero, fs8, ft11
                  fsgnjn.s     fs10, ft0, fs7
                  fcvt.w.s     a1, fa2, rtz
                  fclass.s     s11, ft1
                  mul          a6, t6, a2
                  flt.s        s9, ft11, fs9
                  fsgnjn.s     fs6, fs1, fa1
	fcvt.s.w	ft0, s6, rne
                  fsgnj.s      ft9, fs2, ft2
                  fsgnjn.s     ft3, fs0, ft4
                  ori          tp, t2, 798
                  div          s3, zero, tp
                  addi         ra, tp, 447
                  fsgnjx.s     fs10, ft5, fs10
                  sub          ra, a6, t3
                  div          a4, gp, t1
                  fcvt.wu.s    a4, ft11, rmm
                  divu         s5, t1, s1
                  sub          a4, a6, s7
                  feq.s        a3, fs1, fs3
                  sub          s7, s10, a1
                  divu         t4, s5, s1
                  mulhsu       zero, a2, ra
                  addi         s7, t0, -1455
                  add          s0, s10, s11
                  fsgnj.s      fs7, fa2, fs3
                  srli         s6, a2, 0
                  fmax.s       ft7, fs3, fs10
                  slti         s5, a2, -1694
                  divu         t4, t1, gp
                  xori         ra, s10, 602
                  lui          s11, 849132
                  mulhu        a3, t2, a4
	fsub.s	ft3, ft2, ft2, rne
                  mulh         s0, t3, s7
	fsub.s	fa3, fs10, ft8, rne
                  fcvt.wu.s    s7, ft5, rmm
                  auipc        s7, 58059
                  lui          a7, 469876
                  feq.s        s8, ft1, ft9
                  sub          t1, ra, s11
                  ori          t6, tp, -1306
                  srai         s7, a7, 4
                  div          s5, s5, t0
                  fmax.s       fs5, fs8, fa0
                  fadd.s       ft3, fs1, fs10, rtz
                  sltiu        s0, t0, -1210
                  slti         s2, t2, -1085
	fsub.s	fa1, ft7, fa2, rne
                  lui          ra, 718279
                  mulhu        s2, a4, a0
                  sltu         s1, a4, s6
                  fsub.s       fs10, fs4, ft3, rtz
	fcvt.wu.s	a1, fs0, rne
                  addi         t6, s10, -1395
                  xor          a7, tp, sp
                  fcvt.s.wu    fs4, t1, rdn
                  fmv.x.w      tp, fs6
                  sltiu        t3, zero, 1193
                  fsgnjx.s     fa6, fa0, fs8
                  andi         t1, zero, 132
                  or           s10, a3, t3
                  fmax.s       fs9, fs9, fa0
                  remu         a5, gp, s11
                  mulhsu       gp, s2, s6
                  andi         a3, s0, -997
	fcvt.w.s	s5, fa7, rne
                  sll          tp, a5, a2
                  sltu         a3, sp, t6
                  fcvt.wu.s    t4, ft7, rne
                  fmax.s       ft11, fa5, fa6
                  fle.s        s7, ft0, fa5
                  flt.s        s9, fa4, fs9
                  add          s6, s2, t4
                  mulh         tp, s4, zero
                  fsgnjx.s     fs7, fs9, fs6
                  and          a2, a3, s10
                  ori          a1, t6, 1152
                  fsgnjn.s     fa7, fs1, ft1
                  fadd.s       fs3, fs1, ft0, rdn
                  fcvt.w.s     s8, fa6, rmm
                  xori         a5, t3, -209
                  auipc        t4, 26738
                  fsgnj.s      ft4, fs9, fs2
                  srl          gp, a2, tp
                  flt.s        s9, ft4, fa0
                  sub          t4, gp, a5
                  srai         s8, s2, 22
                  feq.s        a7, ft4, fs9
                  remu         a5, tp, s11
                  fsub.s       fa3, fs5, ft2, rup
                  mulh         a6, s0, a7
                  slli         s3, t4, 24
                  slti         s0, s3, -2021
                  feq.s        gp, fa1, fs6
                  fsgnjx.s     fs2, fa2, ft3
                  fmax.s       ft6, fs0, fs1
                  slti         ra, a1, 1592
                  slti         s0, a3, 1937
                  auipc        tp, 672891
                  add          t4, a6, s2
                  andi         t4, tp, 874
                  srai         s2, s11, 19
                  fcvt.s.wu    ft3, s5, rup
                  divu         t1, a0, zero
                  addi         a1, s6, -1926
                  slli         t0, s6, 12
                  remu         a7, a5, a3
                  slt          s6, t4, gp
                  fcvt.s.w     fs0, s7, rdn
                  nop
                  srai         s0, t4, 29
                  div          tp, sp, zero
                  srli         s0, sp, 12
	fcvt.wu.s	a7, ft9, rne
                  slt          gp, s6, t5
	fcvt.s.wu	fs3, gp, rne
                  add          t6, s8, a4
                  sltu         t0, s2, sp
                  slt          t4, t2, t2
                  slli         gp, s6, 8
                  mulhu        a7, zero, t5
                  sltu         s6, s4, a3
                  sltiu        s11, s2, -1426
	fcvt.s.wu	ft3, a5, rne
                  fmv.w.x      fa6, gp
                  div          a0, tp, a6
                  fsub.s       fs11, ft7, fs3, rup
                  sra          t6, t1, s8
                  sll          t6, a2, s5
                  fclass.s     ra, fa1
                  fsgnjn.s     ft9, fs11, fa3
                  add          a0, a1, a3
                  auipc        s7, 141124
	fsub.s	fs5, fs5, ft2, rne
	fadd.s	fa1, ft9, ft7, rne
                  slt          s1, s10, t6
                  slti         zero, t6, 145
	fadd.s	fs3, fs2, fs0, rne
                  sra          s8, a3, t2
                  fmax.s       fs6, fs4, ft9
                  fsgnj.s      fs9, ft3, ft2
                  feq.s        tp, fa1, ft3
                  fsub.s       fa0, fs11, fs3, rdn
                  nop
                  fcvt.w.s     t0, fs9, rtz
	fadd.s	ft8, ft6, fa3, rne
                  fcvt.w.s     s7, ft11, rmm
                  or           t6, a6, s9
                  fcvt.s.wu    fa7, t3, rtz
                  mulhsu       s3, a4, s1
                  lui          a6, 804201
                  fclass.s     s5, ft10
                  addi         s6, s11, 666
                  fmv.w.x      fs2, t2
                  xor          s2, a1, a2
                  srli         s10, s11, 10
                  or           s3, t0, a4
                  fclass.s     t1, ft1
                  lui          t6, 479180
                  mul          s2, tp, s3
                  and          t3, t2, s2
                  sll          s1, a2, s2
                  fmax.s       fa0, fs5, fs7
                  div          gp, t6, a4
                  fcvt.wu.s    sp, ft5, rtz
                  fmv.x.w      t3, fs8
                  addi         s6, s0, -792
                  sltu         sp, s3, s5
                  nop
                  sra          a1, a3, sp
                  slti         t3, t4, -1674
                  slt          t3, gp, sp
                  fmv.w.x      fa6, t4
                  sll          s2, s7, s6
                  or           s1, a1, s11
                  addi         gp, s5, 1642
                  srl          a2, a6, s8
	fsub.s	fs3, ft10, fs8, rne
                  fmv.w.x      fa6, a2
                  addi         a3, s3, 1274
                  or           zero, a7, s10
                  xor          t0, sp, gp
                  divu         s3, s6, s10
                  fle.s        ra, ft0, fs9
                  andi         t1, s2, 1992
                  or           s5, s2, s3
                  fclass.s     a1, fa2
                  slli         s2, s10, 23
                  sltu         s9, t1, s2
                  fcvt.s.wu    ft10, s9, rtz
	fsub.s	ft5, ft2, fs7, rne
                  fmin.s       fs1, fs9, fs8
                  srl          tp, t3, a1
	fcvt.s.w	fs3, a1, rne
                  fle.s        sp, fs3, ft9
                  sra          s7, s11, s6
                  srai         a2, a4, 0
                  rem          a7, a4, s4
                  fmv.x.w      s0, ft1
                  fmax.s       fa5, ft1, fa7
                  andi         a2, a6, -2045
                  divu         sp, t5, s2
                  fcvt.w.s     s0, fs4, rmm
                  mulh         s6, s8, t0
                  fcvt.w.s     s5, fa3, rmm
                  fmin.s       ft10, fs3, ft8
                  sub          tp, a7, sp
                  flt.s        ra, fs2, fs0
                  slti         ra, t0, -1297
                  lui          s10, 658286
                  fle.s        s1, fa4, fs9
                  fmv.w.x      ft8, a1
                  fmv.x.w      s8, fs6
                  xor          s9, t3, s8
                  add          gp, s7, sp
                  mulh         sp, a4, a0
	fcvt.s.wu	fa2, a6, rne
                  fle.s        a1, fa2, fa6
                  fmv.w.x      ft3, s7
                  fsgnjn.s     ft3, fa7, ft9
                  or           t1, a2, tp
                  sra          t4, t5, s5
                  sub          sp, s7, a3
                  fle.s        t6, fs1, ft10
                  auipc        gp, 262660
                  sltu         a3, s9, s9
                  fcvt.w.s     t0, ft4, rne
                  fclass.s     s10, ft7
                  fmin.s       fs10, fs1, ft4
                  fmv.w.x      fa5, a7
	fcvt.s.wu	fa1, s2, rne
                  nop
                  xor          s6, a0, t3
                  remu         gp, s4, a3
                  feq.s        s3, fs0, fa5
                  mulhsu       gp, a4, ra
                  and          t0, a1, sp
                  mul          s9, a7, gp
                  mulhsu       tp, a6, s9
                  flt.s        s6, ft9, fs10
                  flt.s        zero, fa1, ft2
                  slt          a2, a0, s10
                  slli         s10, gp, 13
                  fmax.s       fs11, ft3, fa2
                  fmax.s       ft3, fa1, fs1
                  sub          s3, s10, t5
                  nop
                  sltiu        t0, a2, -1561
                  nop
                  sra          t0, s7, a4
                  addi         s1, s0, 483
                  auipc        s10, 51914
                  xor          gp, t3, gp
                  slt          s6, a6, a0
                  fsgnjx.s     fs9, fa7, fs7
                  sll          s7, s10, a7
                  rem          zero, a6, s11
                  or           s7, t1, s10
                  div          a0, s2, tp
                  xori         s2, s6, 430
                  mulhu        gp, a7, s5
                  xor          s1, s4, t3
                  add          a4, s1, s1
                  nop
                  fclass.s     tp, fs6
                  srl          s1, a0, a2
                  fcvt.wu.s    a5, ft0, rmm
	fadd.s	fs5, ft6, ft9, rne
                  fmin.s       fa6, fs4, fa3
                  sltiu        s7, s7, -472
                  xori         s1, t1, -340
                  sub          s2, s1, s4
                  sltu         a0, s8, a1
                  slli         s2, a0, 19
                  sltiu        a6, a2, 1867
                  auipc        gp, 34227
                  sra          a3, a7, s8
                  and          s9, s1, s0
                  fcvt.w.s     ra, ft10, rmm
                  fle.s        gp, fs7, fs2
                  srl          s11, a4, s10
                  divu         s1, ra, t5
                  and          t4, a3, s10
                  fsgnj.s      ft2, fa3, ft5
                  and          s5, s1, tp
                  sra          s10, s1, t4
                  feq.s        t3, fs8, fs11
                  add          a5, ra, t1
                  xori         a1, a1, 330
                  mulh         t0, ra, sp
                  fmin.s       fa5, fa6, fs0
                  feq.s        a2, fs2, fa3
                  sltu         tp, a0, s0
                  sltu         s8, s2, s7
                  srai         s5, s0, 17
                  fmax.s       ft9, fs0, ft10
                  sltu         s2, a0, s5
                  rem          s10, s0, s0
                  slt          a2, a2, ra
                  fmax.s       fa7, fs10, fa5
                  mulhsu       a0, t4, s6
                  sra          t4, s0, t0
                  nop
                  andi         a3, s7, -1147
                  sub          t6, t4, t0
                  nop
                  auipc        s0, 495717
                  fcvt.w.s     a3, fs6, rmm
                  and          a0, a7, s11
                  xor          s6, s6, s10
                  slt          a6, tp, a3
                  rem          s9, sp, s3
                  remu         s0, t5, t6
                  divu         s0, a5, s3
                  sll          gp, s3, sp
                  fcvt.w.s     t1, fa4, rdn
                  lui          t3, 27512
                  ori          s2, a1, 406
                  mulh         gp, a7, a4
                  srai         s10, t5, 4
                  fsub.s       fs9, fs9, ft7, rtz
                  divu         a2, t5, tp
                  add          a2, s0, a6
                  fmin.s       fa4, fs3, fs7
                  add          t4, a0, s5
                  add          s10, ra, zero
                  ori          a4, sp, 1893
                  lui          tp, 879699
                  div          a5, s11, s5
                  fle.s        s5, ft1, ft3
                  srl          zero, a6, s10
	fcvt.s.w	ft6, s6, rne
                  sltu         a5, s2, a4
                  sub          a3, s7, t0
                  fadd.s       ft4, ft10, ft11, rtz
	fcvt.w.s	t1, ft4, rne
                  or           s1, s8, s1
                  sltiu        a0, s6, -1886
                  fmv.w.x      ft0, tp
                  fle.s        gp, ft4, fs11
                  ori          s3, t1, 2011
                  fmv.w.x      fs7, sp
                  fsub.s       fa0, ft3, fs11, rmm
                  lui          s5, 659099
                  xori         s1, t5, -366
                  sll          a1, a1, s10
                  srli         s1, a1, 27
                  srli         a6, s10, 29
                  ori          a7, a5, 1074
                  fsgnjn.s     ft6, fa5, fa5
                  slti         gp, sp, 481
                  fsgnjn.s     fs1, ft4, fs5
                  fmin.s       fs9, ft7, fs11
                  fmax.s       ft2, ft11, ft7
                  addi         t4, a2, 657
                  fmax.s       ft7, fs11, fs3
                  slti         s5, a5, -1519
                  fclass.s     a6, fs1
                  sltiu        a5, t0, -853
                  or           a7, t4, t6
                  and          t1, zero, s2
                  fsgnjn.s     fs5, fs6, ft11
                  sltiu        a2, t2, 339
                  srli         s7, s4, 5
                  fle.s        t6, ft6, fa6
                  fsgnj.s      fa7, fa0, ft11
                  sltu         a6, s3, s9
                  mulhu        s6, s7, gp
                  or           gp, a3, tp
                  slt          t6, s9, t0
                  srli         t4, t5, 26
                  slti         a6, t1, -1434
                  divu         tp, tp, s10
                  sra          a1, tp, a1
                  sltiu        s10, s4, 291
                  xori         sp, s2, 976
                  feq.s        a0, fs0, fa5
                  andi         s11, s1, -904
                  fsub.s       ft0, fa4, ft1, rup
                  srli         zero, zero, 22
                  srl          s6, a2, s8
                  or           s9, s11, s0
                  fsgnjx.s     ft8, fa1, fa2
                  rem          s8, s3, s3
                  slt          a7, tp, a2
                  mulh         a2, zero, s10
                  flt.s        tp, ft7, fs9
                  slli         s2, s5, 22
                  slt          t6, zero, a3
                  sltu         a0, a7, t0
                  fsgnjx.s     ft2, fa3, ft4
                  mulhsu       s2, s5, s3
                  auipc        t3, 265675
                  rem          a5, s3, t4
                  add          s11, sp, s6
                  divu         s8, t4, s3
                  sll          s7, t0, s4
                  srai         a0, t2, 6
                  fmv.w.x      fa1, ra
                  fmv.x.w      a5, fs7
	fsub.s	fs10, ft1, fs4, rne
	fadd.s	ft4, fa1, fa1, rne
                  sra          a3, zero, t5
                  divu         s6, t6, s7
                  srli         a0, sp, 17
	fadd.s	fs1, fa3, ft2, rne
                  addi         a6, ra, 1107
                  sltu         s2, s9, a4
                  srl          t6, sp, zero
                  or           t1, sp, tp
                  srl          a1, s10, s7
                  fclass.s     tp, fs9
                  fsgnjn.s     fs10, fs1, ft3
                  fmax.s       ft10, ft7, ft0
                  sltu         t4, s4, s8
                  ori          s2, s2, -1054
                  fsgnjn.s     fs4, ft4, fa1
                  fsgnjn.s     ft0, fa4, fa4
                  ori          gp, a1, 91
                  sub          a7, sp, s9
                  sltiu        s5, t6, 856
                  fmax.s       fa5, fs0, fs2
                  div          t4, a0, a5
                  sub          s7, s2, s3
                  fclass.s     s9, ft3
                  sub          a1, a7, s1
                  mulh         s5, s8, sp
                  srl          s9, s4, s3
	fcvt.s.w	fs9, t2, rne
                  srl          ra, a0, sp
                  lui          s8, 289050
                  fmv.w.x      fs4, t6
                  mulh         t4, s0, t1
                  auipc        a4, 877533
                  xori         s5, s5, -110
                  flt.s        t6, fs5, fs9
                  sra          zero, t5, s6
                  fclass.s     ra, fa7
                  ori          s2, zero, -1748
	fcvt.s.wu	ft7, s7, rne
                  flt.s        a2, ft6, fs6
                  ori          a2, t3, -472
                  sltiu        t0, s3, 1114
                  slti         s0, s1, -2036
                  sltu         a6, sp, sp
                  sub          a1, a7, a2
                  fmv.x.w      a3, ft9
                  fmin.s       fs10, ft10, fs6
                  fsub.s       fa0, fa5, fs7, rne
                  auipc        sp, 892093
                  srli         s5, a0, 31
                  fle.s        a6, fs1, fs1
                  fmin.s       fs8, fa4, fa3
                  mulhu        t3, tp, s3
                  sll          t6, sp, a7
                  mulh         a7, a0, a0
                  slt          s9, s11, s5
	fsub.s	fa7, fs2, ft10, rne
                  fmin.s       ft6, ft9, fa2
                  sltiu        a1, s11, 1940
                  fsgnjx.s     fs7, fs7, ft0
                  xor          gp, s9, a2
                  sltiu        s6, a5, 887
                  sltu         sp, t5, zero
                  auipc        a1, 304583
                  sra          s9, a7, s1
	fcvt.s.w	fs8, t2, rne
                  slli         s3, a0, 7
                  fmin.s       fs3, fs3, fa6
                  fmv.x.w      t4, fs0
                  flt.s        s9, fs5, fs2
                  feq.s        a5, fa4, fs6
                  slti         zero, s3, 741
                  slli         s6, a6, 23
                  or           s3, a1, s10
                  add          t1, s4, t6
                  fmv.w.x      fs3, s3
                  flt.s        s11, ft0, fs3
                  or           a3, s1, zero
                  lui          t1, 603557
                  slti         sp, gp, 59
                  sll          a3, s6, t6
                  fsgnjx.s     ft10, fs3, ft4
                  fle.s        a0, fs4, ft0
                  fclass.s     zero, fa3
                  fsgnjn.s     fs3, ft6, fs5
                  fclass.s     s6, ft4
                  fadd.s       fa1, fa2, ft3, rmm
                  remu         s5, t3, s11
                  sll          s3, s3, zero
                  auipc        a5, 1042038
                  rem          t1, a3, a4
                  fmv.w.x      fs8, s3
                  fsgnj.s      ft3, ft6, fs7
                  nop
	fadd.s	fa0, fs3, fs2, rne
                  sub          gp, s10, sp
                  add          tp, s3, a7
                  remu         ra, s3, s4
                  div          s1, t4, t5
                  slt          s5, sp, s4
                  fle.s        s7, ft4, fa4
                  fsgnjx.s     fa2, fs0, fs7
                  lui          a5, 998684
                  sub          s8, a4, s7
                  srli         a1, t6, 3
                  remu         a2, a1, t5
	fadd.s	fa5, fs1, ft6, rne
                  feq.s        t3, ft0, ft7
                  fmax.s       fa0, ft4, fs8
                  fsgnjn.s     fa2, fa0, ft10
                  sltiu        t3, s7, -263
                  srli         gp, a6, 8
                  sll          s3, s10, s11
                  mulh         t6, zero, t1
                  fmin.s       ft8, fa7, fs8
                  and          t6, t3, a3
                  xori         t4, s7, 172
                  fsgnj.s      fs9, fa3, fa6
	fadd.s	ft10, fa2, fs8, rne
                  div          a1, s4, s7
                  mul          t1, s8, a3
                  fle.s        s6, ft11, fs0
                  fcvt.w.s     s1, ft5, rne
                  div          s1, ra, a3
                  remu         sp, ra, s0
                  feq.s        ra, ft11, fs6
                  mul          t6, t6, s1
                  fsub.s       fs7, ft7, fs0, rtz
                  ori          s6, t0, -1436
                  fclass.s     a4, ft1
                  sll          a6, s4, s8
                  fcvt.s.wu    fa7, s6, rdn
                  feq.s        ra, fs0, fs8
                  fcvt.s.w     fs8, s9, rne
                  ori          s0, tp, 986
	fcvt.s.wu	fs9, s1, rne
                  slli         s1, s10, 18
                  lui          a0, 613875
                  sltiu        t1, ra, -168
                  xori         s7, s1, 58
                  mulh         t6, s5, a7
                  fsgnjx.s     ft3, fs3, fs11
                  fmv.x.w      s7, fa0
                  sll          ra, zero, tp
                  lui          a0, 970447
	fcvt.w.s	s0, ft4, rne
                  lui          a5, 385871
                  divu         s0, s1, t0
                  mul          a6, t0, a5
                  fle.s        zero, fs6, fa1
                  slli         sp, t2, 14
                  fcvt.s.wu    fs3, a1, rtz
                  fadd.s       ft10, fa5, ft10, rne
                  fmv.x.w      a6, ft7
                  sltiu        t4, a0, -865
                  xor          s3, t4, s0
                  sltiu        t1, a6, -1043
                  fmin.s       ft0, fa1, ft7
                  remu         a1, gp, a4
                  fsgnj.s      ft0, fs3, fs10
                  sltiu        a6, s11, -1861
                  lui          s8, 1022531
                  feq.s        a7, ft2, fs6
                  fclass.s     s0, fa3
	fcvt.wu.s	s8, fa3, rne
                  fmv.w.x      ft4, tp
                  fmin.s       ft8, fs5, fs2
                  srai         s10, s2, 17
	fcvt.wu.s	a2, fa7, rne
                  sub          s9, s3, a0
                  xor          s6, s1, t3
                  rem          s2, t6, s8
                  fsgnjn.s     fa2, fs7, fs10
                  or           gp, a4, tp
                  div          ra, tp, s10
                  xori         t3, a1, 1435
                  addi         s11, t0, -1954
                  sltiu        s6, sp, 304
                  srl          s3, gp, s7
                  srli         s5, s3, 3
                  srai         t4, s6, 28
                  mulh         t6, a5, tp
                  rem          s9, t3, a5
                  fmin.s       fs7, fs11, fs6
                  srli         t1, t0, 5
                  mul          s1, t4, ra
                  fle.s        s11, ft2, ft8
                  mulhsu       s3, gp, a7
                  srli         a3, s6, 2
                  fsgnjn.s     fs0, fa6, fa2
                  fclass.s     s7, ft4
                  add          t6, t5, t0
                  divu         s10, s1, ra
                  andi         t3, s1, 787
                  mulhu        sp, t4, a1
                  flt.s        a6, fa0, fs5
                  slt          a2, s11, a4
                  fsgnjn.s     fs1, fs6, ft7
                  mulhsu       a2, a7, a2
                  slti         sp, s11, 1294
                  flt.s        s8, ft0, fa5
                  fmin.s       fs7, fs9, ft8
                  div          gp, a1, s5
	fcvt.w.s	ra, fs9, rne
                  andi         a1, s4, 17
                  rem          a5, s4, t6
                  fmv.x.w      a2, fs5
                  fadd.s       ft0, ft0, fs5, rtz
                  flt.s        tp, fs3, ft8
                  fsgnjx.s     ft0, ft10, ft10
                  auipc        a5, 682916
                  remu         gp, a1, s1
                  nop
                  div          zero, t4, t5
                  slti         a3, t5, -1501
                  nop
                  ori          a1, t5, -842
                  sll          s9, t4, s2
                  fsgnj.s      ft6, fs1, fs8
                  sub          ra, s11, t1
                  add          s2, t4, a3
                  fmin.s       fs4, fa0, fs2
                  nop
                  slt          s7, a7, zero
                  ori          a3, t5, -1886
                  xor          t1, a4, s9
                  mulhu        a2, sp, s4
                  fsgnjn.s     fs7, fs3, fs6
                  fcvt.wu.s    tp, fs8, rtz
                  fcvt.w.s     s9, ft8, rtz
                  remu         s3, a0, s6
                  auipc        s3, 291315
                  divu         a6, t1, s3
                  srl          a1, t5, t1
                  srli         s10, a0, 30
                  xori         s9, s3, -1041
                  xor          sp, s3, a3
                  fmv.w.x      ft11, s9
                  fsgnjx.s     ft6, fs8, ft2
                  auipc        t4, 965694
	fcvt.s.w	fa3, t1, rne
                  mulh         s8, s3, a4
                  fclass.s     a1, fa3
                  mulhsu       s9, s5, t5
                  fmax.s       fs5, ft11, fs6
                  slti         s9, s2, -254
                  sltu         s5, s1, s5
                  fsgnjx.s     fs0, fs3, fs3
                  fsub.s       fs1, fa5, fa2, rup
                  sltu         a4, s9, t2
                  slt          s0, t1, s8
                  slli         s0, s0, 6
                  remu         s11, gp, t2
                  fcvt.s.wu    ft3, t1, rne
                  fle.s        a2, ft2, fa6
                  addi         s11, a7, 1423
                  remu         a4, a4, s5
                  flt.s        t3, ft11, fa2
                  add          t0, a6, a3
	fadd.s	fs8, ft10, ft5, rne
                  xori         t3, s2, -1498
                  lui          a4, 776559
                  nop
                  fmin.s       ft3, ft6, fs6
                  fmv.w.x      fa5, t4
                  fsgnjx.s     ft7, fa3, fs5
                  ori          t6, t2, -57
                  fadd.s       ft8, ft5, ft9, rmm
                  slli         t0, s9, 31
                  srli         a6, a2, 20
                  sra          a2, t3, a4
                  fmv.x.w      t4, fa3
                  slti         s5, s9, 558
                  sub          a1, s9, a6
                  fsgnj.s      ft0, ft10, fa3
                  mulhu        s6, t3, s0
                  slt          s1, sp, s6
                  fmv.x.w      gp, ft4
                  auipc        tp, 330407
                  slt          s3, s7, t1
	fsub.s	fa7, fa2, ft8, rne
                  mulhsu       s6, t4, s11
                  fmin.s       fs2, fa2, fa3
                  xor          s10, s8, s0
                  add          a7, a3, a2
                  auipc        a5, 83038
                  fsgnjx.s     ft9, fs6, fs5
	fcvt.wu.s	s10, ft6, rne
                  fcvt.wu.s    t0, ft4, rup
                  fsgnjx.s     ft7, fa6, fs5
                  fmin.s       fa2, fs7, ft9
                  divu         s9, gp, t4
                  fsgnjn.s     fa5, ft11, fs8
                  fcvt.s.w     fa7, sp, rmm
                  fsgnj.s      ft1, fa4, ft1
                  mulh         sp, a4, s6
                  fmv.x.w      a4, fs4
                  fsgnj.s      fa5, fa5, ft0
                  nop
                  sltiu        t6, ra, 1692
                  and          s11, t0, t1
                  slli         s6, t4, 28
                  slt          a1, t5, s8
                  fcvt.wu.s    a3, fs5, rmm
                  and          s2, a7, s1
                  sll          a4, a0, gp
                  lui          a5, 1038487
                  divu         tp, s1, s5
                  remu         a0, t0, a0
                  fcvt.s.w     fa3, s1, rne
                  fle.s        a2, fa6, ft3
                  feq.s        s7, ft3, fa5
                  mulhsu       t4, t4, s3
                  addi         s9, zero, -1764
                  fsgnjn.s     fs7, ft10, ft10
	fcvt.wu.s	a3, fs11, rne
                  fsgnj.s      fs2, ft1, ft9
                  srli         a2, a0, 27
                  rem          s9, a7, t4
                  slti         a3, tp, 984
                  auipc        s5, 97846
                  fsgnjn.s     fs5, fa6, ft3
                  add          a1, ra, zero
                  remu         s10, s7, t2
                  fsgnj.s      ft5, fs0, ft9
                  sltu         s6, t3, t6
                  or           a4, s11, t6
                  srli         a4, a2, 21
                  fcvt.s.w     fs10, a7, rup
                  fmax.s       ft1, ft6, fa2
                  andi         t6, tp, -1938
                  fmax.s       fa1, fa3, fs0
                  srai         a4, t5, 18
                  add          tp, a7, t6
                  flt.s        a6, fs6, fa5
	fadd.s	ft4, ft11, fa3, rne
                  fle.s        a7, fs3, fs11
                  sltu         ra, t4, s0
                  slti         a5, a0, 1961
                  slt          s1, s5, s6
                  slli         s10, sp, 3
                  fsgnjx.s     fa6, ft10, fs9
                  slti         s0, s11, -1140
                  slli         s2, a7, 11
                  slli         s2, tp, 24
                  ori          s5, t6, 2000
                  fcvt.s.wu    ft10, a4, rne
                  and          a6, sp, s11
                  or           s9, a6, s7
                  sra          a5, a6, zero
                  fadd.s       fs0, fs10, ft8, rtz
                  andi         sp, s4, 204
	fcvt.s.wu	fa2, t4, rne
                  div          s10, a5, tp
                  feq.s        t4, fa0, fs8
                  div          t3, a0, s7
                  fclass.s     s3, fa3
                  srai         t0, s4, 7
                  fsgnj.s      fs0, ft2, fa2
                  fcvt.s.w     fs5, s3, rdn
                  add          s11, a5, a7
	fsub.s	fs2, fs9, fa4, rne
	fadd.s	fa0, ft11, fs6, rne
                  addi         tp, s1, 870
                  fmv.x.w      s8, ft4
                  nop
                  feq.s        gp, ft5, ft3
                  mulhsu       s10, t4, a6
                  fsgnjx.s     fs0, fs10, ft4
                  srl          sp, a1, s1
                  fmax.s       ft0, ft8, fs1
                  sra          a1, sp, s6
                  sltu         a6, ra, a3
                  fcvt.s.wu    fa4, gp, rdn
                  srli         a5, gp, 0
                  flt.s        a6, fa4, ft1
                  sltu         a4, s11, a2
                  sltu         a6, s7, s11
                  divu         a3, t6, s2
                  sltu         a1, s7, t2
                  slli         t1, t4, 27
                  or           s9, a1, s10
                  ori          ra, sp, -1581
                  auipc        zero, 16085
                  divu         s1, s1, a1
                  fsgnj.s      fs2, fs11, fa4
                  rem          gp, t5, tp
                  sltiu        t3, t2, 477
                  sll          s11, s8, t0
                  xor          s3, zero, a7
                  mul          t0, t1, a4
	fcvt.wu.s	t4, fa2, rne
                  rem          t4, s0, t4
                  ori          a3, a5, 484
                  fsgnj.s      fs11, fs10, fs1
                  fclass.s     s11, fa4
                  fmax.s       fa3, ft3, fs5
                  div          ra, a6, a0
                  lui          s3, 631062
                  xori         t0, s5, -1732
                  and          s7, a2, tp
                  and          s2, t2, s9
                  sll          tp, a3, s5
                  fmv.x.w      s5, fa6
                  fsgnjn.s     fs9, ft8, fs1
                  srli         s0, a6, 27
                  sltu         s3, gp, s1
                  fmax.s       fa7, fa7, fa6
                  fsgnjn.s     fa3, ft4, ft10
                  sub          s3, t2, a0
                  add          s11, a6, s10
                  feq.s        t4, ft2, ft9
                  feq.s        t4, fs2, fa1
                  fmv.x.w      a0, fa5
                  add          s10, ra, ra
                  lui          t3, 311520
                  fle.s        sp, ft4, fs8
                  sra          s3, a7, a0
                  sltiu        gp, a4, -685
                  xor          s11, s11, ra
                  fmv.x.w      s10, fa0
                  xor          ra, s9, a2
                  fsgnj.s      ft9, fa3, fs2
                  fmv.x.w      a1, fa3
                  mulh         a2, a7, a2
                  fmin.s       fs11, ft4, ft0
	fadd.s	fs6, fa7, fs9, rne
                  remu         a7, s7, a0
                  mulhsu       a0, a5, ra
                  flt.s        a2, ft4, fs7
                  fclass.s     a1, fa7
                  remu         s9, s9, s9
                  slti         s9, s3, -1872
                  andi         s11, a2, -1542
                  sra          t3, s5, s0
                  fmin.s       fa2, fs8, ft0
                  sltiu        s8, s3, 483
                  sltiu        a7, s8, 878
                  fsgnj.s      fs6, fs1, fs11
                  add          t3, t4, a6
                  div          a7, a2, s2
                  flt.s        gp, fs6, ft8
                  lui          a2, 134568
                  fmv.x.w      s2, fs1
	fadd.s	fs7, ft6, fs9, rne
                  ori          a6, t4, -1713
                  auipc        ra, 978648
	fcvt.wu.s	s6, ft11, rne
                  srl          a7, s5, gp
                  fcvt.w.s     gp, ft2, rmm
                  fsgnj.s      fs0, fa6, fs7
                  slt          zero, s2, sp
                  remu         s6, s2, a4
                  fmv.w.x      fs9, s9
                  add          a3, a3, a4
                  or           ra, gp, s9
                  srli         s9, tp, 21
                  mulhu        s11, a5, s10
                  slt          s11, t5, s6
                  sub          sp, sp, s9
                  mulh         a1, s7, t2
                  srli         t4, t1, 27
                  lui          s8, 153867
                  slti         s0, t4, 1928
                  or           s2, sp, s9
                  sra          a7, a4, t0
                  srl          a2, a0, a3
                  fmv.x.w      s3, fs6
                  fmv.x.w      s11, fs10
                  fmv.w.x      ft1, t6
                  fcvt.s.wu    fs11, s4, rdn
                  fsgnjx.s     ft6, ft11, fa1
                  fcvt.s.wu    ft9, s0, rtz
                  slt          t1, t0, s2
                  xori         a2, s8, 2017
                  flt.s        s2, fa3, ft11
                  mul          ra, s6, t0
                  andi         a6, t3, -978
                  lui          a5, 16389
                  or           sp, t5, a1
                  flt.s        a7, fs6, ft8
                  fclass.s     zero, fa5
                  slti         s9, a1, 516
                  add          ra, t1, t2
                  fsgnjx.s     ft5, ft8, ft8
                  add          gp, t3, s2
                  feq.s        s0, ft1, fs1
                  remu         t3, s3, t1
                  rem          s1, a7, t0
                  srl          s10, t3, sp
                  add          s0, a7, s2
                  or           s3, s8, zero
                  sra          t0, s6, a0
                  sll          t3, a4, t2
                  fle.s        a7, ft2, ft3
                  fcvt.wu.s    gp, fa4, rmm
                  nop
                  sll          a2, sp, a2
                  srl          zero, a3, ra
                  fmin.s       ft9, fa1, fs1
                  slti         s1, t4, -1248
                  mulhsu       a6, a2, t3
                  add          t1, a2, t3
                  mul          s11, gp, a3
                  xori         a1, s11, -1924
                  fle.s        s8, ft2, ft10
                  sll          t0, a4, a6
                  lui          s9, 128729
                  rem          a5, s8, s0
                  slt          s5, sp, s1
                  srl          a5, s4, t4
                  and          s1, a6, a0
                  fmax.s       fs7, fa5, ft9
                  fsgnjn.s     fs7, fs11, ft4
                  nop
                  flt.s        a2, fs11, fs6
                  lui          t3, 87864
                  div          zero, t6, s2
                  sltu         s6, s4, s9
                  rem          s9, a4, s10
                  fcvt.w.s     t6, fs11, rdn
                  fsgnj.s      fa0, fs5, fa6
                  fclass.s     t4, ft10
                  fsgnjx.s     ft9, ft3, fa2
                  fle.s        a7, fs2, fs5
	fcvt.s.wu	ft2, s2, rne
                  sltiu        s10, zero, 218
                  mul          tp, a7, a0
                  srl          s9, s1, a6
                  fsgnj.s      ft2, fs0, fs5
                  addi         sp, t1, 1324
                  flt.s        a7, fs3, fs8
                  lui          a1, 577463
                  rem          s2, s9, a7
                  mulh         t6, s0, s3
                  xor          a4, s6, t6
                  rem          a6, s0, t5
                  srli         s11, gp, 24
                  mulhsu       zero, t3, a1
                  fsgnjn.s     fs11, fs7, fa7
                  fmv.x.w      tp, fs8
                  flt.s        gp, fa6, fs11
                  srai         a4, t2, 30
                  slli         s9, sp, 5
                  remu         zero, s8, a1
                  sra          s7, s10, s1
                  divu         a5, s2, s6
                  flt.s        a3, fs5, fs11
                  fmin.s       fs7, fa1, fs9
                  slt          s10, s11, a2
                  mulhu        a3, s0, s6
                  fsgnjn.s     ft3, fs7, ft7
                  flt.s        a0, fs6, fa7
                  fmin.s       ft11, fs10, fs9
                  mulhu        s9, s2, s9
	fcvt.s.wu	ft11, tp, rne
                  mulhu        a3, s3, t0
                  flt.s        s1, fs0, ft3
                  feq.s        sp, ft6, fs3
                  fmv.w.x      fs2, gp
                  srl          t0, a0, sp
                  div          a0, s2, a6
	fsub.s	fs4, fs8, fa1, rne
                  srl          s7, gp, t5
                  fsgnjn.s     ft6, fa5, fs6
                  sub          a5, gp, sp
                  fmv.w.x      fa3, s1
                  sltu         s1, t2, a7
                  auipc        a0, 903511
                  div          tp, t6, gp
                  sra          s3, a3, s7
                  sll          s6, t5, s8
                  fcvt.w.s     a1, fs6, rdn
	fcvt.w.s	a2, ft5, rne
                  remu         s2, a5, a1
                  fsgnjx.s     fs9, fs6, fa1
                  rem          s5, s11, s7
                  lui          s2, 618115
                  sub          s6, t2, sp
                  divu         gp, ra, s10
                  andi         s11, zero, 524
                  andi         s3, zero, 801
                  feq.s        s3, fa3, ft8
                  fsgnjn.s     fa6, fs1, fa2
                  div          sp, s4, s10
                  srai         s2, t0, 14
                  fcvt.wu.s    a2, ft8, rmm
                  fmv.x.w      a3, fa1
                  fcvt.wu.s    s6, ft8, rdn
                  xor          s5, a0, s8
                  fmv.w.x      fs4, s1
                  fmax.s       fa6, fs4, fa2
                  auipc        tp, 1000425
                  fsgnjn.s     fa6, ft7, ft4
                  fmv.x.w      ra, fs1
                  mul          s10, t2, a0
                  fsgnjx.s     fs7, fa6, fs9
                  mulhu        s2, s7, a6
	fsub.s	fa0, fs0, fs2, rne
                  sll          t1, s10, a1
                  add          s0, tp, t4
	fadd.s	fs7, fs4, fs2, rne
                  srl          s7, s8, s3
                  sltiu        s8, a1, -353
                  fsub.s       ft6, fs1, fs6, rtz
                  slti         t4, s7, -450
                  rem          s1, a7, s2
                  or           a3, tp, s3
                  fclass.s     s11, fs9
                  fmax.s       ft1, fa5, fs3
                  fsgnj.s      fs11, fs6, ft3
                  div          a7, t3, s8
                  sll          s7, s0, s5
                  add          a2, a7, t3
                  ori          a5, s7, 1926
                  feq.s        s11, ft9, fs5
                  srai         a4, a3, 9
                  sltiu        s0, s3, -1586
                  fmax.s       fs1, ft8, ft8
                  fsgnj.s      fa2, fa7, ft1
                  sra          s1, s4, t2
                  mulhsu       ra, a0, zero
                  div          a5, a3, a2
                  mulhsu       t0, t1, s11
                  mul          s8, ra, a0
	fsub.s	fs11, fs8, ft2, rne
                  remu         tp, t5, t4
                  fle.s        a2, ft1, ft7
                  slt          s9, s9, zero
                  srai         s10, a6, 12
                  auipc        s6, 392473
                  sltu         gp, s11, s9
                  slti         a2, t4, -561
                  feq.s        s1, fs11, ft7
                  addi         t3, s4, 683
                  fsgnjn.s     ft3, ft10, fa4
                  xor          s7, s11, a5
                  div          t6, a4, t0
                  add          a1, s2, a3
                  flt.s        t0, fa3, ft1
                  srli         t1, a0, 15
                  mulhu        a4, a0, t6
                  andi         a6, s7, -1897
                  sub          s6, t5, a2
                  fsgnjx.s     ft1, ft4, ft10
                  slti         t4, t1, -1021
                  andi         gp, s3, -562
                  fmax.s       ft2, fa5, ft7
	fcvt.s.wu	fs2, a0, rne
                  mulhsu       t0, t3, s10
                  xori         zero, sp, 1636
	fadd.s	fa4, fs4, fs9, rne
                  srl          a3, a5, tp
                  mulhu        s8, a4, s7
	fcvt.wu.s	tp, fa7, rne
                  mul          s0, s7, zero
                  fadd.s       ft9, fs4, fs10, rne
                  fmin.s       ft4, fa6, fa6
                  xori         s5, a7, 410
                  fcvt.s.wu    fs2, a2, rmm
                  srli         s1, s3, 30
                  xori         s3, s9, 403
                  slt          s9, t1, t2
                  fmv.w.x      fa3, a5
                  fsgnj.s      ft3, fa7, fs8
                  mulh         ra, t0, t3
                  ori          tp, t3, -1855
                  sltiu        s11, a0, -2017
                  fmv.w.x      fs8, a4
                  fmin.s       ft7, ft9, fs10
                  sltu         t0, a2, tp
                  div          a2, s10, a1
                  fcvt.w.s     t6, ft10, rne
                  fmin.s       ft9, fa2, fs1
                  fle.s        zero, fa1, fs2
                  srai         s5, s9, 28
                  srai         s1, s2, 21
                  fcvt.s.w     ft7, a6, rdn
                  flt.s        t0, fs6, fs11
                  lui          s9, 9266
	fcvt.wu.s	tp, fa0, rne
                  fclass.s     a6, fa5
                  fsgnj.s      fs3, fa6, ft1
                  or           t1, s0, sp
                  fadd.s       fa4, fs8, fa7, rne
                  rem          s7, a2, a1
                  fle.s        t3, fa3, fa6
                  fclass.s     t4, ft9
                  div          t0, s7, s6
                  sltu         s5, a0, gp
                  div          a3, gp, t3
                  mul          s10, t2, a7
                  remu         a7, s11, a5
                  nop
                  srai         sp, a5, 30
                  slti         zero, sp, 1798
                  auipc        zero, 463266
                  srai         t1, a0, 31
                  addi         t0, s0, 877
                  feq.s        a7, fa2, fs4
                  or           t6, t2, a3
                  mulhsu       t3, a7, a1
                  fclass.s     s6, ft9
                  fclass.s     s9, fa4
                  sra          sp, t2, t6
                  flt.s        a3, fa4, fs4
                  fsgnjx.s     fs6, fa4, fs3
                  mulhsu       a4, a3, t3
                  srai         zero, s0, 12
                  srl          s2, s6, s0
                  fcvt.s.wu    fa1, s4, rup
                  feq.s        s9, fs6, ft8
                  fcvt.s.wu    fs8, s4, rtz
                  fle.s        a5, ft3, fs4
                  flt.s        s2, fs4, fa5
	fcvt.s.w	ft11, gp, rne
                  addi         s7, a5, -1421
                  rem          s5, tp, s1
                  andi         s5, s5, -562
                  div          s8, s10, t1
	fadd.s	fa1, fa2, fa5, rne
                  fsgnj.s      fs1, fa0, fs11
                  mulhsu       zero, t0, s11
                  fcvt.wu.s    t1, fs0, rup
	fcvt.s.wu	fs3, a1, rne
                  andi         s5, s0, -550
                  xori         a0, s2, 966
                  add          a5, s11, t0
                  add          a1, gp, s0
                  mulh         ra, s5, a0
                  slti         a7, s10, 1974
                  fadd.s       ft5, ft8, fs8, rtz
                  fcvt.s.wu    fs0, s9, rtz
                  fsgnj.s      ft0, fs0, ft3
                  sra          zero, t1, s3
                  lui          sp, 173384
                  ori          s2, a0, -685
	fcvt.s.w	fs10, s10, rne
	fcvt.s.w	ft3, sp, rne
                  xor          zero, s8, gp
                  sub          a0, a4, a6
                  div          a6, s10, a0
                  slt          s6, s11, s3
                  andi         gp, s0, -1348
                  srli         a7, s9, 21
                  fcvt.w.s     s3, ft8, rtz
                  xor          a0, s2, t1
                  slti         s7, t0, 1929
                  fsgnjn.s     ft6, ft5, ft3
                  nop
                  rem          t4, a0, s3
                  div          t6, s6, s0
                  and          gp, t1, s11
                  auipc        s1, 141145
                  fclass.s     a4, fa1
                  and          s8, s7, a7
                  srl          zero, a6, s2
                  xor          a3, s1, s7
                  divu         s2, a0, s0
                  add          a4, t0, t5
                  flt.s        gp, ft1, fs7
                  add          t0, t1, a7
                  nop
                  fmv.w.x      fa0, zero
                  flt.s        s6, ft9, fa4
                  and          a5, a0, s1
                  divu         t6, ra, zero
                  fcvt.w.s     a2, fs9, rne
                  auipc        gp, 566993
                  slti         a0, t4, -1034
                  sltiu        zero, t6, 890
                  slti         tp, a4, 324
                  srli         t4, a0, 9
                  divu         a4, a0, a5
                  mulh         s2, t5, t6
                  or           a6, s4, s2
                  auipc        s1, 240580
                  srli         t4, a6, 16
                  lui          t6, 926358
                  fmin.s       fa6, fa6, fa6
                  slli         a7, s2, 1
                  fsgnjn.s     fs1, fs9, ft7
                  nop
                  fsub.s       fs4, fs9, ft4, rne
                  sltu         t3, t4, t3
                  slt          a2, s11, a2
                  sltu         ra, a5, a1
                  slti         s5, s1, 437
                  lui          s7, 295232
                  fclass.s     t4, fa2
                  srli         a7, s1, 25
	fcvt.s.wu	fs4, sp, rne
                  fcvt.s.w     fs1, s2, rmm
                  slt          a4, s4, t2
                  mulhsu       a4, t1, a6
                  remu         a6, a6, ra
                  lui          t1, 475509
                  fle.s        s1, fs5, fs5
                  flt.s        t4, fs5, fs8
	fcvt.w.s	tp, fa1, rne
                  lui          gp, 484313
                  remu         s0, s1, t0
                  fclass.s     sp, ft0
                  sll          t3, s2, t2
                  sub          s8, t0, s10
                  nop
                  sub          s11, t4, a1
                  fmv.w.x      ft3, tp
                  xori         tp, a4, -1934
                  slti         t3, t3, 921
                  fcvt.s.wu    fa6, t2, rup
                  fsgnjn.s     fs0, ft4, fs9
                  srai         sp, s4, 12
                  fle.s        s8, ft9, ft8
                  slti         a0, sp, 1370
                  remu         s0, s5, s2
                  slli         s10, s7, 8
                  and          s11, a3, s5
                  fcvt.w.s     a1, fa7, rmm
                  ori          tp, a4, -1061
                  mul          s6, s0, s3
                  xori         t4, a1, 1476
                  srli         s6, t2, 11
                  feq.s        t6, fs1, ft11
	fcvt.s.w	fa7, a5, rne
                  fsgnjx.s     fs4, ft7, ft3
                  sll          s9, gp, t0
	fcvt.w.s	s9, fa7, rne
                  mulh         tp, gp, a7
                  mulhsu       a4, t4, tp
                  sra          t3, s7, a5
                  fsgnjx.s     fa3, ft5, fa6
                  fmv.w.x      fs0, s3
                  rem          s10, zero, t6
                  sub          t3, t3, gp
                  xor          s5, s5, t4
                  fmv.w.x      fa6, a2
                  or           s7, t4, a2
                  flt.s        s6, ft1, ft3
                  divu         a7, t0, a2
                  fsgnj.s      fs10, ft6, fs0
                  or           s5, t3, zero
                  and          a5, gp, a6
                  divu         s2, t6, s1
                  ori          a6, s8, 1269
                  ori          t1, s1, 1641
                  feq.s        s3, ft9, fa3
	fcvt.w.s	s9, fa6, rne
                  rem          s9, s6, s2
                  fmax.s       ft4, fs5, fs8
	fcvt.w.s	s9, fs6, rne
                  flt.s        s8, ft4, ft8
                  fclass.s     s0, ft4
                  and          t1, t5, s10
                  and          s0, t1, s5
                  auipc        s10, 381178
                  mulhsu       s10, s6, zero
                  and          sp, s9, s4
                  fcvt.w.s     s3, fs5, rdn
                  feq.s        s8, ft5, fs10
	fcvt.wu.s	s11, ft11, rne
                  srai         a4, zero, 28
                  srli         s1, t1, 12
                  div          a6, t6, a5
                  sltiu        s11, s4, 1814
                  or           ra, s4, gp
                  ori          a2, a5, 433
                  remu         t6, s9, s0
                  slti         s6, t6, -1170
                  srai         sp, s4, 29
                  fclass.s     a1, fs6
                  slt          s3, ra, sp
                  fsgnjn.s     fs7, fs4, fs9
                  fcvt.s.w     ft5, s2, rup
                  fadd.s       fs10, fs8, ft1, rtz
                  fle.s        a2, fs11, fs7
                  or           a7, zero, t2
                  sra          a4, t4, tp
                  sra          s9, s9, t0
                  srli         s5, t5, 5
                  srli         s1, s9, 14
                  addi         s1, s5, 80
                  fmv.x.w      s5, ft0
	fcvt.s.wu	fs9, sp, rne
                  divu         t0, s5, a4
                  slli         ra, s10, 6
                  mulhsu       t4, s7, a7
	fcvt.w.s	t6, fs0, rne
                  auipc        s3, 124075
                  fadd.s       fa2, fa2, fs9, rtz
                  rem          sp, s1, s2
                  ori          a7, s0, -81
                  nop
                  fmv.x.w      s0, fs6
                  divu         s7, zero, t6
                  fcvt.s.w     fa4, t0, rmm
                  fsgnj.s      fa2, fs0, fs10
                  mul          zero, t1, s9
                  srl          sp, a4, a6
                  sltiu        s5, zero, -1642
                  fmax.s       ft2, fs6, ft11
                  fsub.s       ft8, ft7, fa3, rtz
	fadd.s	fa7, fa5, fa7, rne
                  fmax.s       fs4, ft5, fs2
                  fmv.w.x      fa4, tp
                  sra          s0, s10, gp
                  mul          t1, a0, a5
                  lui          a5, 593493
                  mulh         s5, a0, a4
                  slt          a1, gp, a2
                  xori         a2, t5, -993
                  add          a1, t0, t4
                  fsgnj.s      fa1, ft5, fa5
                  slt          a3, a7, t5
                  feq.s        a2, fs4, fa3
                  fadd.s       fs9, fa5, ft5, rne
                  add          s9, a1, s3
	fsub.s	fa1, fs9, ft10, rne
                  feq.s        a2, fs4, fs4
                  fcvt.wu.s    s8, fs1, rmm
                  and          a3, s1, s1
                  or           a7, t0, t3
                  fsgnjx.s     ft1, fa0, ft6
                  ori          a5, s4, -1601
                  sltu         a7, a5, s10
                  mulhu        t6, a4, s9
                  fadd.s       ft11, ft10, fa0, rne
                  addi         sp, a6, 1111
                  xori         a2, zero, 1468
                  add          t6, t3, t6
                  fsgnj.s      fs10, ft7, fs7
                  remu         a4, s7, a1
                  div          s5, zero, s10
	fadd.s	ft11, ft8, fs0, rne
                  slli         s11, s5, 21
                  fsgnjn.s     fs1, fs11, fa4
                  mulhsu       s11, s11, s9
                  rem          sp, s11, a4
                  or           ra, s4, tp
                  xori         a0, s8, -477
                  mulhu        a0, t5, a0
                  div          t4, a7, s8
                  divu         a6, ra, s10
                  fcvt.s.w     fs11, t5, rmm
                  mul          s6, a2, s1
                  feq.s        sp, fs11, ft11
                  feq.s        s0, fs9, ft2
	fcvt.w.s	a5, fs3, rne
                  sll          sp, t6, s5
                  addi         s0, t1, -562
                  fcvt.w.s     a2, ft3, rup
                  sltu         s0, s7, a1
                  divu         s1, a3, s11
                  nop
                  and          a5, t0, s11
                  fsgnj.s      ft11, fs10, fs5
                  srli         s10, a0, 22
	fcvt.wu.s	t4, fs0, rne
                  fmax.s       fa6, ft8, ft2
                  ori          s7, zero, 280
                  sub          gp, s7, s4
                  fsgnj.s      ft2, fs7, ft3
                  and          a6, s6, ra
                  fmv.w.x      fa6, a0
                  srai         a2, a2, 1
                  srai         a3, sp, 13
                  divu         s1, s11, s2
                  remu         a2, s11, t4
                  or           s3, s8, a7
                  and          s8, s10, s6
                  fle.s        s8, fa5, fs2
                  addi         s3, t4, -1714
                  mul          s6, a0, s8
                  mulhsu       s0, a6, s11
	fcvt.wu.s	zero, ft11, rne
                  andi         a3, t1, -378
	fadd.s	ft6, fs11, fs3, rne
                  slli         s3, s9, 13
                  addi         t0, t6, 876
                  fcvt.wu.s    tp, ft6, rup
                  or           t6, s3, s4
                  flt.s        s0, fs4, fs10
                  mulhu        a4, s9, a2
                  or           t4, a1, s11
                  and          s10, sp, t6
                  srai         t3, s7, 25
	fadd.s	ft8, fs1, ft7, rne
                  ori          tp, s1, 1785
                  mulhsu       s2, a4, s8
                  andi         a0, a5, 474
                  slt          s2, s1, t1
                  ori          s1, t6, -239
                  flt.s        a1, fa5, ft7
                  fmax.s       ft7, ft0, fa0
                  sltu         s10, a0, sp
                  sltiu        t1, t2, 798
                  xori         a4, s8, 2018
                  mulhu        a6, s8, t4
	fcvt.wu.s	a3, fa0, rne
                  xori         tp, tp, -1883
	fcvt.w.s	a4, ft5, rne
                  remu         t1, a3, a2
                  fcvt.s.wu    fs8, t4, rdn
                  fmv.w.x      ft0, s6
                  sub          a2, ra, a4
                  srai         t3, t6, 0
                  xor          t3, s6, s3
                  fclass.s     a1, ft3
                  divu         s6, s7, s11
                  feq.s        zero, fa5, fs8
                  srli         s0, a0, 26
                  srl          a2, zero, s3
                  nop
                  remu         a3, a3, t5
                  slli         a3, s11, 2
                  divu         zero, s1, s7
                  flt.s        ra, fs7, fs6
                  xor          ra, s4, s4
                  fclass.s     a1, fs8
                  fsub.s       fs0, ft5, ft1, rmm
                  fcvt.wu.s    s6, ft8, rmm
                  div          zero, tp, t4
                  sub          s3, a6, t0
                  mulh         a5, s11, s1
                  nop
                  fsgnjx.s     fs7, fs9, ft10
                  fmv.x.w      t6, fs4
                  mulh         zero, a1, t0
                  slti         a6, s0, 371
	fsub.s	fs3, ft5, ft8, rne
                  slli         s6, s8, 13
                  sra          gp, zero, ra
                  fmv.x.w      s9, fs4
                  sub          a6, s10, a2
                  and          gp, s2, s1
                  fmin.s       fs8, fa1, fa1
                  fclass.s     tp, fa0
                  andi         t3, s1, -1634
                  fmax.s       fs8, fa7, fs8
                  slli         sp, s10, 24
                  sltiu        a2, s1, -874
                  fsgnjx.s     fs8, fa6, ft4
                  mulhsu       a7, t2, s4
                  addi         a3, s5, 1229
                  div          a2, a1, s3
                  fsgnjx.s     fs1, ft11, fs3
	fcvt.wu.s	s7, ft8, rne
                  fclass.s     s9, ft7
                  fcvt.s.w     fs6, s1, rup
                  andi         s7, tp, -1845
                  fclass.s     s5, fa4
                  sll          s5, a7, a3
                  flt.s        t3, fs9, fs4
                  xori         t1, t1, -1405
                  rem          t6, s1, t2
                  srl          a2, t3, t4
                  fsgnj.s      fa0, fs3, fs3
                  auipc        s2, 551585
                  sll          s8, a3, gp
                  fmin.s       fs10, fa2, ft2
                  mulhsu       s1, a2, t3
                  slti         s9, s9, -1877
                  divu         t0, a2, t2
                  fmv.w.x      fs5, s5
                  fsgnjn.s     fs7, fs0, fa5
                  fsgnj.s      ft4, fs2, fa2
                  nop
                  sll          a0, t5, t4
                  fcvt.s.w     fs9, s2, rdn
                  fadd.s       fs3, ft9, fa4, rne
                  mulh         a3, zero, s10
                  sub          sp, gp, s11
                  xori         s1, s1, 1275
                  mulhsu       t6, a0, tp
                  mulh         t0, t6, s6
                  divu         tp, ra, gp
                  fmax.s       fa5, fa0, fa2
                  fcvt.wu.s    s2, fa6, rtz
                  srl          s5, s6, s8
                  fsgnj.s      fs0, ft1, ft11
                  add          s10, a3, s3
                  fmv.x.w      tp, ft10
                  fsgnjn.s     ft5, fs2, fs0
                  rem          a4, a2, a4
	fcvt.w.s	a6, fs1, rne
                  fsgnjx.s     ft11, fs8, fs0
                  feq.s        t6, fa5, ft3
	fcvt.s.wu	fs7, a5, rne
                  flt.s        s6, ft4, fs10
                  add          tp, s6, t2
                  fsgnjn.s     ft7, ft3, ft7
                  sra          s1, t6, s5
                  auipc        a0, 806320
                  div          a6, s9, s2
                  fmax.s       ft10, fa0, ft0
                  rem          a0, t4, a6
                  ori          gp, t4, 767
                  andi         sp, gp, -855
                  mulh         a1, s9, zero
                  slli         s2, a7, 6
	fcvt.s.w	ft3, a2, rne
                  or           s1, a0, t2
                  andi         s5, a3, -1802
                  fcvt.w.s     s3, fa0, rdn
                  divu         s2, t2, s3
                  xor          tp, s9, a1
                  fclass.s     a2, ft9
                  or           s7, s1, a4
                  sltiu        s3, s7, 849
                  remu         zero, s10, s0
                  fsgnjn.s     fs8, fs0, fa3
                  sra          t0, tp, zero
                  fmv.x.w      a6, ft4
                  addi         s9, t1, 517
                  sltu         s0, s1, ra
                  fmv.w.x      fa5, gp
                  xor          a4, s8, t1
                  xori         a6, tp, 1142
                  fcvt.w.s     tp, ft4, rdn
                  fcvt.wu.s    ra, fs7, rdn
                  fmv.w.x      ft7, s5
                  mulhsu       s0, t3, zero
                  fsgnj.s      fa5, fs9, ft10
                  flt.s        s0, fs1, fs5
                  feq.s        a6, fa6, fs7
                  fcvt.s.wu    ft11, s3, rmm
                  fmin.s       ft11, fs8, fs9
                  srl          s9, s3, s3
	fcvt.wu.s	a1, ft0, rne
                  flt.s        s8, ft8, ft5
	fcvt.w.s	a4, fa6, rne
                  fsgnjn.s     fa1, ft8, fs10
                  fsgnjx.s     fs10, ft0, ft5
                  mulhu        s11, t6, a1
                  fcvt.s.wu    fs2, s3, rne
                  or           zero, t1, s1
                  div          s0, t0, s8
	fcvt.s.w	ft8, s3, rne
                  fsgnjn.s     fs11, fa5, fa0
                  div          a6, s10, a2
                  rem          t4, t3, t5
                  and          s9, a4, sp
                  mulhsu       sp, s11, t6
                  fle.s        s11, ft2, fs8
                  fmv.x.w      a7, fs0
                  fsgnjn.s     ft3, fs11, ft11
                  fsgnjn.s     ft5, fs8, fs11
	fcvt.s.wu	fs5, s11, rne
                  auipc        a2, 303777
                  auipc        s8, 601660
                  mulhu        s2, a2, t3
                  add          s1, s11, t4
                  mulh         t0, a2, a7
                  feq.s        zero, fs4, ft4
	fcvt.s.wu	fa4, a0, rne
                  xor          gp, a4, a3
                  mulhsu       s11, s11, s4
                  fle.s        ra, ft1, fs10
                  slli         sp, a3, 11
                  sltu         s11, s10, a2
                  sra          a2, t6, s9
                  mulhu        s7, s9, t1
                  srli         t1, s4, 0
                  mulhsu       s7, s3, t6
                  rem          sp, s11, s3
                  or           a2, a6, zero
                  div          s5, t6, t0
                  srl          s9, t4, s8
                  lui          t3, 94783
                  slt          t3, a5, a2
                  rem          a6, s11, a6
                  fsgnj.s      fa4, fa2, ft4
                  mulhu        t3, gp, a0
                  mulhsu       a7, a2, a6
                  nop
                  slt          tp, t0, t6
                  fcvt.s.w     ft10, t1, rne
                  addi         s10, s0, -1296
                  fmin.s       fs4, ft8, fa2
                  mulhu        s9, s9, t6
                  fadd.s       fs7, fs5, ft2, rtz
                  andi         t4, t1, 360
                  fle.s        tp, ft1, ft1
                  sll          s0, gp, a3
                  fmax.s       fs9, fs6, fa3
                  mulhsu       t0, s8, t6
                  andi         s3, t5, 388
                  mul          t4, s4, zero
                  srl          a3, s2, s5
                  mulhsu       t0, tp, a2
                  fsgnj.s      ft11, ft3, ft6
                  feq.s        a1, fa2, fa0
                  and          a7, s0, a0
                  srli         s9, s10, 28
                  slt          s1, t1, s6
                  divu         gp, a7, a2
                  divu         t1, a5, s5
                  add          a7, t2, s3
                  xori         t3, sp, 1975
                  divu         s7, s5, s9
                  rem          t0, t0, s3
                  slti         a4, s1, -232
                  nop
                  fmv.x.w      s1, fa2
                  andi         s3, s9, -1994
                  lui          s5, 131654
                  and          a6, s5, s10
                  remu         s11, s9, s0
                  mul          s6, s5, t5
                  sltu         a3, t1, s9
                  fsgnj.s      fa7, fs10, fs3
                  srai         a6, t4, 22
                  fclass.s     t1, ft2
	fcvt.wu.s	t0, fa3, rne
                  srai         a1, a3, 1
                  add          t4, s11, t2
                  fsgnjn.s     ft4, fa3, ft0
                  srl          s1, s1, t2
                  sltiu        s8, a5, -759
                  slti         s9, s11, -458
                  slti         s7, s6, -1564
                  auipc        a6, 333306
                  add          a2, a2, ra
                  addi         zero, t1, -1210
                  fsgnjn.s     fs5, ft11, ft1
                  sra          a5, s6, zero
                  sltiu        t4, a3, -1234
                  divu         zero, a1, t0
                  div          s11, zero, a2
                  addi         t4, tp, 1732
                  add          s2, t6, sp
	fsub.s	ft5, ft2, fa5, rne
                  sltu         a2, s11, a4
                  fcvt.s.w     fs3, a6, rne
                  sltu         s3, a7, t0
	fadd.s	fs9, fa7, fa1, rne
                  srli         s11, a0, 4
                  nop
	fadd.s	fa3, ft3, fa5, rne
                  fsgnj.s      fa2, fa1, fa4
                  fmin.s       ft2, ft9, ft7
                  andi         tp, gp, -1994
                  fmv.w.x      fs1, s11
                  andi         s0, s6, 759
                  fmin.s       fs2, fs10, fs1
                  sra          t6, t5, t5
                  sra          a4, t1, sp
                  sub          t3, s0, a4
                  slli         s5, a4, 18
                  sll          gp, gp, t2
                  fcvt.wu.s    s5, fs11, rdn
                  add          a1, s7, t5
                  mulhu        s6, a7, s10
                  sll          s11, s0, s6
                  xor          a2, a7, tp
                  divu         t4, t3, s9
                  sra          s3, s8, a4
                  div          s9, zero, t0
                  srli         a3, a7, 7
                  flt.s        ra, ft7, fs9
                  slti         s3, a0, -1283
                  fsgnjn.s     ft2, fa0, fa4
                  feq.s        s3, fa7, fs0
                  andi         s10, t5, -946
                  fsgnjn.s     ft10, ft7, ft11
                  fcvt.s.wu    fs7, t3, rne
                  xori         s9, a6, 438
                  fmv.w.x      fs0, s0
                  sub          s0, a5, s0
	fcvt.s.w	fa4, t1, rne
	fcvt.wu.s	s7, ft3, rne
                  addi         s9, a4, 138
                  fmv.w.x      fa6, s2
                  addi         ra, tp, 1487
                  fcvt.wu.s    s3, ft5, rup
                  feq.s        s10, fs8, ft11
                  sll          a4, s2, a4
                  srl          a6, s11, s10
                  lui          t4, 707580
                  rem          s8, zero, s1
                  fsgnj.s      fa6, ft0, fa2
                  flt.s        s10, ft4, fs6
                  fclass.s     tp, fs11
                  fmv.x.w      a6, fs7
	fcvt.s.w	fs5, sp, rne
                  xori         a5, s2, 1659
                  srl          s6, s1, a1
                  ori          t1, s3, -1254
                  mulhu        s11, gp, t5
                  fmv.w.x      ft5, s11
                  ori          t0, tp, 1760
                  slt          t1, t5, s11
                  xor          s8, t2, s2
                  add          t4, zero, zero
                  fsgnjx.s     fs9, ft2, ft9
                  fsub.s       fs5, fs7, ft0, rne
                  mul          a3, a2, a0
                  slt          ra, t1, gp
                  fle.s        s7, fs8, ft0
                  feq.s        s1, fs6, fa2
                  fcvt.s.w     fs7, t3, rne
                  xor          a4, sp, zero
                  auipc        a4, 814676
                  sll          t6, s5, t3
                  xor          zero, s1, a0
	fsub.s	fa3, fs11, fs3, rne
                  slt          t0, s1, gp
                  slt          s11, sp, tp
	fcvt.s.wu	fa4, s2, rne
                  sltu         a5, t1, t2
                  sra          a3, t3, s8
                  sll          s1, a6, s11
                  xor          t4, t2, s10
                  xor          s11, tp, a6
                  xori         s6, t0, 870
                  divu         tp, s2, s2
                  mulh         s10, s2, s8
                  andi         s10, s11, -1346
                  addi         ra, a2, -1463
                  mulh         s2, gp, sp
                  slli         s5, a7, 6
                  srai         sp, a2, 3
                  lui          s7, 715035
                  srai         a1, a0, 23
                  sub          a2, t4, a4
                  mulhu        zero, ra, s5
                  sub          s3, gp, s3
                  remu         a0, t1, sp
	fcvt.s.w	fa1, tp, rne
                  fsgnjx.s     ft9, fa7, ft11
                  mulhu        s7, a7, s1
                  slt          zero, s1, s10
                  or           s0, s8, s4
                  sltiu        t4, sp, -1797
                  divu         s5, a6, a4
                  mulhsu       s7, tp, a1
                  slti         a7, s2, -839
                  xor          a1, ra, s2
                  sltiu        s8, t6, 1652
                  sll          a4, a0, t1
                  fsgnjn.s     fs2, fs9, ft4
                  slli         s6, a1, 14
                  xor          a4, gp, t2
                  feq.s        s1, fs4, fa1
	fcvt.wu.s	t6, fs6, rne
                  slt          gp, t1, tp
                  srl          t4, ra, a6
                  div          a6, s2, a6
                  xor          t3, a1, t2
                  sltu         t1, a7, s4
                  remu         a5, s7, s4
                  fsgnj.s      fs3, fs6, fs6
                  andi         s11, t2, 1902
	fsub.s	fs6, fs11, ft9, rne
                  feq.s        s1, fa6, ft5
                  remu         t3, a7, a5
                  srai         t0, sp, 9
                  slli         s0, a7, 24
                  fcvt.s.wu    fa5, s1, rdn
                  slt          s10, t3, gp
                  sub          s9, a0, a6
                  xori         t4, a6, -385
                  fsgnjn.s     ft5, ft2, fa5
                  fcvt.s.wu    ft5, t3, rne
                  xori         t1, s10, 1421
                  andi         s1, t6, -1296
                  auipc        sp, 527289
                  sra          a6, a7, t0
                  divu         s9, a4, gp
                  remu         t4, t3, a0
                  fmin.s       ft10, ft2, ft7
                  feq.s        s7, fs3, ft10
                  div          sp, s6, s6
                  fsgnjn.s     fs7, ft3, fs3
                  fmv.x.w      s11, fa2
                  fmv.w.x      fa4, s11
                  fadd.s       fs2, ft6, fs2, rtz
                  ori          s8, t1, 1344
                  auipc        a1, 768465
                  fsgnjx.s     ft9, fs3, ft1
                  fcvt.s.wu    fa5, s9, rne
                  or           a5, a7, s2
                  mul          t0, a1, s10
                  add          s7, s3, a6
                  nop
                  slti         s1, t5, -1564
                  andi         t3, a1, 1484
                  fcvt.w.s     s11, fs9, rdn
                  mulhsu       s8, t2, ra
                  or           s7, s7, t1
                  mulh         s2, gp, s3
                  mul          zero, a4, s7
                  div          a4, tp, t0
                  sltiu        a7, a6, -170
                  lui          a2, 177684
                  fle.s        s9, fs10, ft9
                  fcvt.w.s     s9, fa5, rup
                  fcvt.s.w     ft10, t2, rne
                  flt.s        s9, ft7, fa6
                  slli         gp, a4, 25
                  fcvt.wu.s    ra, ft7, rne
                  srl          t4, a7, t1
                  or           s6, a7, s2
                  mulh         zero, s10, sp
                  or           s8, a3, a0
                  sra          s9, gp, t2
                  flt.s        a0, fs10, fs5
                  xor          a2, s9, t3
                  xori         sp, t4, 1701
                  slt          a1, s7, s10
                  sra          t6, s2, t4
                  ori          t3, s11, 1758
                  sll          a7, s7, s8
                  mulhu        a2, s6, a5
                  fsgnj.s      fs0, ft11, fs4
                  mul          s5, a4, a5
                  sltiu        s7, s2, 1471
                  xor          a7, s11, s3
                  nop
	fadd.s	ft3, fa7, fs4, rne
                  nop
                  fmv.w.x      ft11, a5
                  sltiu        s10, t2, 1496
                  sltiu        zero, s7, -1606
                  andi         sp, s11, -344
                  ori          s7, sp, -106
                  flt.s        a6, ft7, fs4
                  sltu         a2, a2, s4
                  fmin.s       fs8, fs2, ft1
                  ori          s1, sp, 626
                  fle.s        s1, fs1, fs8
                  fsgnj.s      fs11, fs8, ft1
                  sltu         t4, a2, t4
                  fadd.s       fs1, fs10, fs2, rmm
                  xori         gp, a4, -814
                  sll          s11, s1, ra
                  remu         a4, a1, t1
                  and          a4, s3, t4
                  fle.s        a4, ft5, fa6
                  fcvt.wu.s    a6, fs2, rdn
                  nop
                  sll          tp, t6, t0
                  fmin.s       ft3, fs5, fa7
                  add          t4, a3, s4
	fcvt.wu.s	s1, ft4, rne
                  slti         ra, ra, -1422
                  slt          s5, t4, a2
                  fclass.s     t3, fa3
                  fsgnjx.s     fs0, fs11, ft8
                  auipc        a1, 263763
                  mul          a0, a2, t6
                  mulhu        a2, s4, s2
                  fmin.s       ft11, fa0, fs9
                  or           s5, sp, s8
                  fmv.w.x      fs10, t3
                  fmax.s       fa6, fs4, fa0
                  fcvt.w.s     gp, fs5, rne
                  andi         s3, t0, -1149
                  add          tp, t3, a6
                  fle.s        t6, ft6, fs1
	fadd.s	ft3, ft4, ft9, rne
                  fsgnjn.s     fa5, ft3, fs8
                  addi         gp, a4, -1024
                  fclass.s     s8, fa1
                  rem          sp, gp, a5
                  or           t3, s9, a5
                  fcvt.s.w     fs8, s8, rtz
                  divu         s6, a5, a4
                  fclass.s     ra, fa7
                  auipc        s6, 1009777
                  mul          t1, sp, a3
                  rem          ra, s11, s1
                  add          a6, t6, ra
                  srli         s10, t2, 18
                  srli         gp, s5, 4
                  fcvt.s.wu    ft11, a7, rdn
                  ori          a0, gp, -443
	fcvt.s.w	fa4, s9, rne
                  fcvt.wu.s    tp, fs8, rtz
                  xor          s3, s3, a5
                  sra          s8, s6, a6
                  fadd.s       fs6, fa3, ft0, rup
                  slt          zero, s6, a4
                  srai         a6, a0, 11
                  rem          s7, s1, s4
                  xori         s1, s6, -1799
                  fsub.s       fs10, fa3, fs2, rdn
                  feq.s        t3, ft9, ft4
                  fmv.w.x      ft8, t2
                  fsgnj.s      fa4, ft9, fs5
                  slti         a2, a2, -865
                  nop
	fadd.s	fs11, fa6, fs8, rne
                  fmv.w.x      ft9, s8
                  flt.s        s0, fa4, ft5
                  fsgnjx.s     fa0, fs6, ft8
                  mulhu        t3, a4, a1
                  srai         t6, s9, 12
                  srl          s5, s2, a3
                  rem          s3, s0, t3
                  mulh         zero, s6, s5
                  remu         s1, tp, a1
                  srli         sp, s0, 3
                  fmv.x.w      zero, ft8
                  divu         s11, t0, a6
                  xor          s9, a0, s11
                  andi         a4, a4, -521
                  fcvt.wu.s    tp, fs8, rdn
                  div          s0, s8, s5
                  flt.s        t1, ft0, ft11
                  andi         a4, zero, -581
                  fcvt.wu.s    s3, ft2, rup
                  sra          a5, a6, t6
	fcvt.s.w	fa6, a5, rne
                  fsgnjn.s     fs1, fs8, fa0
                  flt.s        tp, ft0, fs8
                  fsgnj.s      fs6, ft0, fa6
	fcvt.s.wu	ft4, a6, rne
                  fclass.s     a0, fa3
                  mulh         s11, zero, s9
                  srl          gp, gp, t3
                  or           t3, zero, a3
                  mulhsu       a1, a2, s11
                  divu         a4, s4, t5
                  fcvt.wu.s    sp, ft9, rmm
                  addi         a3, tp, 156
                  srl          s1, t3, a4
                  flt.s        s9, ft10, fs7
                  mulhsu       s8, t6, s5
                  fcvt.s.wu    fs11, t5, rtz
                  mul          s9, a3, s6
                  fsgnjn.s     fs3, fs0, fs7
                  mulhsu       s2, a0, t1
                  fsgnjx.s     ft5, ft5, fa1
                  mulhu        a7, sp, t6
                  add          s10, s1, s6
                  rem          t0, a1, zero
	fadd.s	fa2, fa1, fs4, rne
                  mulhu        a5, s7, ra
                  sra          t1, t6, tp
                  fcvt.s.w     fa0, t5, rdn
                  mul          a0, s11, a4
                  rem          a5, t6, t6
                  fmin.s       fs9, ft3, ft4
                  fclass.s     t0, fs9
                  andi         a0, s10, -1039
                  remu         s9, a5, s9
                  mulh         zero, zero, sp
                  xori         a2, a2, 1290
	fadd.s	fa4, fa1, fs1, rne
                  feq.s        s8, fa5, fa2
                  fcvt.w.s     t6, fa7, rmm
	fadd.s	ft1, ft10, fa6, rne
                  mulhsu       ra, s8, s10
                  sra          a4, s8, a6
                  nop
                  fadd.s       fa5, ft0, ft9, rdn
                  fsgnjx.s     fa3, ft6, ft2
                  fsgnjn.s     ft8, ft4, ft3
                  srli         t6, ra, 16
                  fmv.w.x      fa4, t0
                  remu         t1, s3, t5
                  lui          a7, 556638
                  feq.s        s7, ft10, ft9
                  fcvt.s.w     fa6, zero, rup
                  or           a1, t1, a4
                  or           a5, ra, s4
                  addi         t1, s11, 1464
                  mulhsu       s6, t0, a4
                  fsgnj.s      ft5, fa1, fa1
                  xori         s8, sp, -954
                  sltu         s0, t6, a7
                  auipc        t1, 216306
                  auipc        ra, 427807
                  auipc        t4, 535264
                  ori          t0, t3, 189
                  fcvt.wu.s    s2, fs0, rtz
                  feq.s        s0, ft5, fs7
	fcvt.wu.s	s5, ft11, rne
                  fmv.x.w      t3, ft1
                  feq.s        s3, fs5, fs8
                  mulhsu       a3, tp, a5
                  fle.s        a7, fa0, fa4
                  add          s1, t5, a3
                  and          s7, t4, s0
                  mul          t4, sp, t6
                  mul          ra, s3, s11
                  fmax.s       ft2, fs8, fs3
                  and          sp, s5, s11
                  sltiu        a4, a4, -2010
                  fsgnjx.s     ft7, ft6, fs10
                  flt.s        a7, ft4, ft8
                  fmv.x.w      t6, fs5
                  sra          s7, t1, a7
                  div          s9, t0, t0
                  fcvt.s.w     fs2, zero, rne
                  fadd.s       fa2, fa6, ft10, rdn
	fcvt.s.wu	fa5, s1, rne
                  sltiu        t4, s7, -598
                  fsgnjn.s     fa1, fs11, fs7
                  div          s11, a5, s7
                  mulhsu       s9, a2, s10
                  feq.s        zero, ft1, ft6
                  rem          t0, gp, s1
                  fcvt.s.wu    fs0, s3, rmm
                  xori         s0, s6, -804
                  lui          s10, 5345
                  ori          sp, t2, -894
                  fsgnjx.s     ft4, ft5, fs11
                  ori          gp, a6, 1919
                  mul          s5, s3, a0
                  fmax.s       fa2, fs5, fa4
                  addi         ra, t3, 447
                  mul          t4, ra, s11
                  flt.s        a5, fs2, fa0
                  flt.s        t1, ft6, fs6
	fadd.s	fs6, fs5, fs5, rne
                  fclass.s     s5, fs10
	fcvt.s.w	ft0, t6, rne
                  srl          s6, gp, zero
                  fmv.w.x      fs7, s9
                  lui          a7, 220525
	fsub.s	fa7, fs6, fs7, rne
                  remu         t4, a3, t5
                  fmv.w.x      fa0, a5
                  flt.s        a2, fs1, ft4
                  add          s11, a1, s6
                  fmin.s       ft0, ft1, fs5
                  sltu         a2, s5, s8
                  fle.s        s8, fs10, ft4
                  mulhsu       t0, sp, s5
                  mulhu        a5, t2, s0
                  mul          zero, t3, sp
                  fcvt.wu.s    ra, ft8, rmm
                  fmax.s       ft11, fs2, fs10
                  fsgnjx.s     ft8, ft1, fs9
                  fsgnjx.s     fs0, ft1, fa7
                  fmax.s       fs2, ft5, fs5
                  sltu         s0, t0, s11
                  fcvt.s.w     ft5, s5, rdn
                  feq.s        tp, ft11, ft10
                  mulhu        s9, t2, s0
                  fmv.x.w      s11, fs3
                  flt.s        a1, fs5, fa2
                  feq.s        t0, ft0, ft0
                  srli         s1, s0, 1
                  slti         s5, s3, -21
                  add          s5, s5, t1
                  fsgnjn.s     ft4, fs10, fs8
                  rem          s8, t1, a3
                  srli         s7, a6, 26
	fcvt.s.w	fs8, s6, rne
                  mul          t0, gp, s6
                  and          s1, sp, a4
                  or           a5, gp, s11
                  fcvt.wu.s    s2, ft1, rne
                  auipc        t1, 335725
                  addi         t1, zero, -555
                  fcvt.s.wu    fs10, gp, rdn
                  and          a7, a7, s11
                  slt          a2, a7, t5
                  sra          s3, zero, s11
                  srli         a2, s6, 2
                  fmv.x.w      s11, ft4
                  or           s10, s8, a5
                  add          s3, s1, sp
                  addi         s9, a5, 171
                  mulhu        a5, s10, gp
                  lui          t6, 738690
                  ori          tp, s5, -1944
                  mulh         tp, a1, s8
                  rem          s2, s8, a1
                  divu         t3, a7, sp
                  sub          tp, s11, s11
                  srl          a3, s0, s9
                  fsub.s       ft0, fs4, fs11, rtz
                  feq.s        a2, ft4, fa6
                  mulhu        t6, s2, zero
                  fmv.x.w      a1, fs4
                  slli         ra, s5, 24
                  addi         s2, s7, -1145
                  fsgnjx.s     ft5, fa4, ft3
                  fmax.s       fa4, ft0, ft8
	fcvt.s.w	fa1, t3, rne
                  ori          s11, s7, -1775
                  xori         t3, ra, 633
                  andi         a2, t0, -1017
                  sub          tp, s10, tp
                  slli         s11, t3, 25
                  or           s11, s9, s6
                  fsgnjn.s     fa5, fs11, fs6
                  fsgnj.s      fa5, ft8, fa5
                  slt          a1, s7, ra
                  xori         a1, a5, -1707
                  xori         a5, a6, -1036
                  xor          t1, gp, s6
                  fadd.s       ft0, fa7, fs0, rne
                  fmin.s       fs3, fs2, ft3
                  mulhu        a2, s3, zero
                  andi         s0, tp, 1366
                  fmin.s       ft11, ft2, ft10
                  fmin.s       fs8, fs10, fs9
                  fsgnjx.s     fa7, ft10, fs10
                  sra          t0, s3, a3
	fcvt.w.s	a2, fs9, rne
                  add          t0, sp, t3
                  nop
                  auipc        t3, 784764
                  sll          ra, s5, a7
                  sub          s10, t1, t2
                  sll          t0, t0, s7
                  and          t1, tp, sp
                  fcvt.wu.s    s1, fa0, rne
                  mulhu        s3, gp, a3
                  fcvt.wu.s    s10, fa1, rtz
                  slt          s6, a5, a6
                  mulh         a3, s4, a7
                  andi         a0, s10, -327
                  fmv.x.w      s1, fa3
	fsub.s	fs3, fa4, ft1, rne
                  sltu         s6, a3, t4
                  fmv.x.w      t3, ft7
                  fsub.s       ft5, ft2, fa6, rdn
                  fclass.s     t6, fs8
                  and          a1, a3, s7
                  fcvt.wu.s    s10, fs5, rtz
                  sltu         a6, t4, a2
                  div          a2, s6, tp
	fcvt.s.wu	ft7, a4, rne
                  slt          a7, gp, t4
                  rem          gp, s10, sp
                  srli         a6, s10, 6
                  slt          t4, s0, t1
                  fle.s        t3, ft4, fs6
                  div          t3, s5, s3
                  sub          t4, t5, t6
                  rem          a6, s11, a0
                  div          a0, ra, a4
                  fcvt.s.wu    ft9, s6, rdn
                  sra          t1, s1, s1
                  slli         t0, t0, 18
                  srl          sp, s8, t6
                  andi         s2, s8, -158
                  and          s9, s8, tp
                  or           s2, a3, s6
                  sltiu        tp, s4, 343
                  sra          a7, s5, a7
                  fsub.s       fs9, fs6, fs2, rne
                  fmin.s       ft3, ft5, fs4
                  fle.s        s8, ft8, fs1
                  add          t1, s7, a4
	fsub.s	fs1, fa7, fs10, rne
                  sltiu        t1, t4, -1253
                  and          s1, a0, t6
                  auipc        a7, 44741
                  mul          ra, a4, tp
                  divu         a7, a3, t0
                  fsgnjn.s     fa2, fs3, ft4
                  mul          a4, s1, s1
                  and          t6, gp, s9
                  div          s1, a1, a0
                  mulhu        zero, s3, a1
                  or           a6, a7, a4
                  xori         s2, gp, 1621
                  fmv.x.w      s9, ft6
                  xori         s0, s7, -1144
                  addi         zero, t5, -168
                  mul          a6, a0, a2
                  addi         a0, sp, -1442
                  srli         s8, a4, 21
                  andi         a0, s4, -995
                  flt.s        a6, fs10, fs10
                  sll          s8, sp, tp
                  nop
                  or           s1, s7, t2
                  lui          s7, 166442
                  flt.s        s2, fa5, ft6
                  fmin.s       ft9, fa4, fs0
                  fsgnj.s      fa1, ft6, fs8
                  divu         t1, a4, t2
                  auipc        sp, 683420
                  ori          t6, s9, 1422
                  sub          s9, a6, s9
                  fsgnjn.s     ft9, fs0, ft0
                  mulh         s9, s7, s11
                  slli         s7, tp, 6
                  fsgnjx.s     ft11, ft5, fs11
                  xori         s7, a7, 655
                  fmax.s       ft1, fa3, fs2
                  add          sp, a6, t6
                  add          t3, a3, t1
                  ori          t6, s9, 588
                  mulh         a1, s11, s0
                  mul          a4, sp, a3
                  ori          t0, zero, 1456
                  mulhu        a2, a6, a7
                  mul          a4, s4, a0
                  mulhsu       a3, s11, tp
                  mulh         sp, ra, s3
                  remu         a7, s11, t0
                  srl          s3, t6, zero
                  xor          s11, s0, a2
                  lui          t1, 437431
                  ori          a2, t2, -219
                  auipc        s7, 118121
                  ori          a0, s0, 574
                  or           s5, s0, t3
                  fsub.s       fa4, fa7, ft5, rtz
                  ori          a7, gp, 1382
                  lui          s7, 871754
                  xori         s3, t1, -142
                  slt          t3, s6, s4
                  xor          s9, s11, ra
                  sll          t1, a0, s10
                  mulhsu       a7, s8, a7
                  srai         a3, a0, 26
                  sltu         a3, s11, sp
	fcvt.w.s	zero, fs7, rne
                  sltu         s7, sp, t1
                  lui          a4, 483004
                  remu         t3, a1, s7
                  fcvt.w.s     s5, fa4, rne
                  xori         s8, s4, 776
	fcvt.w.s	s11, ft1, rne
                  fclass.s     s9, ft5
                  div          tp, sp, s3
                  slti         a2, s4, -389
	fcvt.s.w	fa6, t6, rne
                  fmv.x.w      a1, fs9
                  fle.s        t3, ft7, fa7
                  feq.s        tp, ft6, fa5
                  ori          s1, s11, -1888
                  fcvt.w.s     t1, fa6, rdn
                  sra          a0, zero, a6
                  lui          ra, 672058
                  srai         t1, t4, 14
                  andi         s8, sp, -100
                  ori          s3, s10, 529
                  nop
                  lui          s5, 1028558
                  fmv.x.w      a2, ft11
                  mulhsu       t0, t1, a7
                  rem          t0, a7, s3
                  ori          t0, a1, -1554
                  sltiu        a1, t3, 1525
                  or           s7, a3, s11
	fcvt.s.w	fa5, a3, rne
                  mulhu        ra, a0, t4
                  srl          t4, gp, t5
                  xori         s8, a2, 799
                  fsgnjx.s     ft4, fs5, fs7
                  remu         t4, t2, s9
                  rem          s3, t2, s7
                  fcvt.wu.s    s8, ft8, rdn
                  srai         s8, a5, 31
                  fmax.s       ft7, ft9, ft2
                  sub          a1, s11, s7
	fcvt.w.s	s11, fs0, rne
                  div          a6, tp, sp
                  fadd.s       fa3, fs10, fs5, rtz
                  andi         t0, s1, 658
                  div          s3, sp, t4
                  fle.s        s1, ft1, ft4
                  fsgnjn.s     ft11, fa7, ft8
                  fsgnjx.s     ft7, fs4, ft10
                  fsgnjn.s     fs11, fa3, fa4
                  srl          s2, a2, a7
                  fsgnjn.s     fs2, ft5, fa5
	fcvt.w.s	s1, fs2, rne
                  fmv.w.x      fa3, ra
                  mulhu        t4, s0, zero
                  ori          s6, s10, -263
                  mulh         t4, a1, s1
                  feq.s        t0, fa6, fa6
                  rem          a2, a2, gp
                  fsgnjx.s     fs0, fa5, ft1
	fadd.s	ft2, fs8, fs5, rne
                  or           t0, t2, s4
                  fclass.s     s10, fs10
                  div          t6, gp, s9
	fcvt.s.w	ft3, a0, rne
                  srl          s1, s4, s11
                  fcvt.wu.s    t6, ft4, rne
                  auipc        a3, 248746
	fcvt.s.w	fa4, s11, rne
                  nop
                  lui          s5, 475729
                  flt.s        a6, fs1, fs2
                  fmv.w.x      fs3, s9
                  slt          a0, s1, t2
                  fsgnjx.s     fa4, fa3, ft10
                  rem          t0, s9, s7
                  remu         ra, s4, a0
	fsub.s	fa3, fs11, fs11, rne
                  fsgnjx.s     fa5, fs6, fs9
                  rem          t0, t2, s2
                  remu         a0, a6, t1
                  fmv.x.w      s2, fs4
                  mulhsu       s11, s3, gp
                  fsgnjx.s     ft9, fs10, ft4
                  remu         t4, a1, a7
	fcvt.wu.s	s9, fs7, rne
                  slli         ra, t1, 2
                  fsub.s       fa2, ft10, ft9, rne
                  nop
                  andi         a3, t6, -339
                  slt          s6, a1, gp
                  fsgnjx.s     fa4, fa3, fa3
                  fmin.s       ft0, fs9, fs7
                  fcvt.w.s     s0, fa6, rmm
                  mulhsu       a3, gp, s0
                  mulhsu       s10, a1, t1
                  fmv.x.w      s8, ft6
	fcvt.s.w	ft8, a1, rne
                  mulhsu       s9, gp, t6
                  addi         a6, sp, 1725
                  fsgnjn.s     ft7, fa7, ft10
                  fclass.s     s6, fa7
                  slli         s6, s0, 21
                  or           t4, s6, t5
                  sltu         s1, t5, s3
                  addi         a6, s2, -294
                  div          a5, t2, ra
                  fmin.s       fs10, fa7, fs4
                  addi         t1, s8, 1777
                  and          a4, t4, t3
	fcvt.s.w	ft7, a2, rne
                  sub          s3, s6, s1
                  addi         s6, tp, -1
                  or           a0, a0, tp
                  slli         a2, s4, 12
                  slti         s7, s5, -1898
                  lui          s0, 58232
                  sltu         s5, s7, zero
                  srl          s1, gp, s8
                  slli         s8, t4, 1
                  addi         s7, t4, 1498
                  mulhsu       t3, t3, t0
                  fmv.x.w      s9, fs3
                  fsgnjx.s     ft1, fa6, fa0
                  fle.s        a3, fs8, fs0
                  fsgnjn.s     fa3, fs2, fs0
                  addi         zero, zero, 1561
	fcvt.s.w	fa6, ra, rne
                  sll          ra, gp, s3
                  flt.s        a3, fa4, ft2
                  fsgnjn.s     fa2, ft9, ft4
                  divu         t0, t5, t3
                  ori          t0, s10, -80
                  divu         gp, gp, s10
                  lui          a5, 921945
                  srli         t1, a5, 22
                  mulh         s6, a7, s8
                  sltu         s6, sp, t6
                  xori         s0, s7, -563
                  mul          s8, zero, a3
                  fle.s        s2, fs1, fs8
                  mulh         t0, s9, a3
                  remu         sp, s3, s4
                  slt          a7, t2, s4
	fsub.s	fa6, fa7, ft0, rne
                  feq.s        a1, ft1, fs6
                  and          t0, tp, s11
                  addi         tp, t3, -1352
                  mulhu        a4, a6, s11
                  slt          s1, a7, s5
	fcvt.w.s	s5, fs2, rne
                  flt.s        t4, ft10, fs4
                  fmin.s       fs0, fs9, ft10
                  fmv.x.w      t1, ft7
                  divu         a4, a0, s11
                  sub          s6, s4, s11
                  fclass.s     s1, ft1
                  slti         s3, s5, -160
                  remu         a1, s11, s8
                  remu         s6, s7, s9
                  fcvt.w.s     s6, fs9, rmm
                  mul          a7, a4, t6
                  fcvt.s.w     fs1, a3, rup
                  nop
                  ori          a1, a7, -466
                  addi         a4, t6, -886
                  slt          s10, tp, t2
                  remu         t6, s1, t6
                  sra          s6, t4, s9
	fcvt.wu.s	a0, fs9, rne
                  add          s7, gp, s7
                  or           a3, t2, a7
                  sra          s9, sp, a1
                  xori         a0, gp, -224
                  fmax.s       ft7, fs11, ft3
                  xor          sp, s10, s8
	fsub.s	fa4, fa1, fa1, rne
                  slti         t4, a2, -841
                  add          s6, a0, s2
	fsub.s	fs3, ft5, ft8, rne
                  sltiu        a7, zero, -294
	fcvt.s.w	fs11, t0, rne
                  sltu         gp, gp, a6
                  xor          s7, a4, s7
                  divu         a6, t5, s10
                  srai         zero, s7, 12
	fcvt.s.wu	ft1, tp, rne
                  div          s3, t1, s3
                  fclass.s     s8, fa2
                  fcvt.w.s     s5, fa3, rup
                  slti         s11, s8, -1035
                  fsgnjx.s     fa7, fs9, ft8
                  xor          t3, s5, s0
                  fsgnjn.s     ft5, fa2, ft10
                  flt.s        s6, ft2, ft0
                  feq.s        s7, fa0, ft3
	fcvt.s.wu	fs9, s5, rne
                  and          s2, a5, s7
                  srl          t1, a5, sp
                  lui          s0, 53689
                  fclass.s     a3, fs7
                  fclass.s     s2, fs2
                  mulhsu       zero, s6, a5
                  sub          s3, s7, s0
                  mulh         s1, s3, a4
                  fsgnj.s      fs10, ft0, fs2
	fadd.s	fa3, ft4, ft2, rne
                  and          s7, a6, a7
                  fmax.s       ft8, fs6, fs10
                  sltiu        t3, s8, -1301
                  fcvt.wu.s    a6, fa5, rmm
                  mulh         s1, a2, s10
                  srl          a4, s8, a2
                  add          sp, zero, a4
                  slti         s6, t0, 1155
                  srli         s6, a4, 21
                  auipc        s1, 838171
                  fmv.w.x      fs6, s10
                  remu         s11, sp, s6
                  sub          t3, tp, a2
                  fmv.x.w      a0, ft0
                  mulhsu       s6, sp, a1
                  fmax.s       ft7, ft10, fa4
                  fsgnj.s      fs8, fa5, fs1
                  sltu         t4, s4, a0
                  mul          a6, s4, tp
                  sra          a6, gp, a7
                  xor          a7, t2, s8
                  divu         a7, s0, t3
                  fmv.x.w      ra, ft10
                  fsgnjx.s     fs2, fs10, ft0
                  divu         s0, a3, sp
                  fle.s        s2, ft4, fs0
                  lui          gp, 300292
                  remu         a7, s4, s1
                  fle.s        s10, fs6, fa4
                  srl          s3, s4, s2
                  nop
                  fmin.s       fs9, fs1, ft10
                  sub          a0, s8, zero
                  andi         a3, s7, 604
                  slti         a3, t4, -1544
                  srl          a7, a6, a3
                  flt.s        s9, fs8, ft1
                  fcvt.s.wu    fa2, t3, rup
                  or           t1, s6, a4
                  addi         s7, s6, -320
                  nop
                  mulhu        a6, s11, t6
                  mulhsu       a6, gp, t1
                  fsgnjn.s     ft0, fs11, fs2
                  fmv.w.x      fs3, t3
                  remu         s11, s8, t1
                  fmv.x.w      a6, fs10
                  auipc        s0, 595908
                  ori          s7, s4, 1718
                  fcvt.s.w     ft8, sp, rdn
                  rem          t1, s0, s4
                  rem          s5, a1, a2
                  mulhsu       t3, gp, t3
                  srai         a6, s6, 17
	fsub.s	fs10, fa0, fa0, rne
                  fsgnjx.s     fa3, fs10, ft4
                  andi         s8, ra, -1305
                  sltiu        s3, a6, 741
                  divu         zero, s4, s5
                  sltu         a2, a1, t3
                  slli         gp, s7, 23
                  sra          sp, zero, a0
                  addi         s5, a5, -90
                  mulh         a5, a0, a0
                  ori          s1, gp, 1208
                  rem          zero, s0, a6
                  auipc        s7, 703378
                  fcvt.w.s     zero, fa0, rdn
                  fsgnjx.s     fs4, fs10, fs1
                  nop
                  xor          a6, t3, zero
	fsub.s	fs2, ft5, ft7, rne
                  xori         a2, a4, 1516
	fadd.s	fa1, ft2, fs7, rne
                  feq.s        a2, fs0, fa2
                  srl          s10, s0, s11
                  fsgnjx.s     ft3, fs6, fs5
                  fmv.x.w      a5, fa1
                  fsgnjx.s     fs7, fs9, fa5
                  andi         s0, ra, -1866
                  mulhsu       t0, s2, t1
                  srli         t4, t3, 4
                  feq.s        s9, fs4, fa4
                  slli         t6, t3, 15
                  fsgnjn.s     ft2, fa1, ft11
                  fle.s        s3, fa3, ft2
	fadd.s	ft7, ft11, fs5, rne
                  srl          a3, s5, tp
                  and          s8, tp, gp
                  or           t4, s10, t2
                  srai         t3, tp, 12
                  fsgnjx.s     ft8, fs3, ft9
                  ori          a5, s5, 955
                  flt.s        tp, ft4, ft11
                  fmv.w.x      ft11, s9
                  sltu         sp, t1, t6
                  fsub.s       fa3, ft8, ft10, rtz
                  rem          s10, ra, s4
                  rem          t0, t0, s9
                  fle.s        t6, ft9, fs3
                  addi         gp, a0, -1343
                  slli         gp, a5, 15
                  srai         s5, a7, 19
                  fle.s        a0, ft0, ft7
                  xor          a5, s9, s3
                  andi         zero, s11, -987
	fcvt.w.s	s7, fs0, rne
                  fsgnjx.s     fs4, fs10, fs11
                  feq.s        a0, fs9, fa1
                  fsgnj.s      fs5, fa6, fa7
                  srl          a5, a5, a5
                  fsub.s       ft8, fs2, fs4, rmm
                  or           ra, a6, a3
                  mulhu        t1, s11, s6
	fcvt.s.w	ft7, s9, rne
                  fsgnjx.s     ft0, fa4, fs2
                  fcvt.w.s     sp, fs2, rup
                  fcvt.s.w     fs5, t4, rmm
                  lui          a5, 655824
                  xor          s7, s5, t0
                  and          a3, s4, t2
                  fmv.w.x      fs1, t1
                  lui          ra, 305211
                  srl          s8, s1, gp
                  or           s1, t5, t5
                  and          ra, t5, ra
                  sra          s1, a0, s5
                  xor          s1, a7, s6
                  mul          s10, s10, s3
                  mulhu        a7, t0, ra
                  remu         gp, a4, s1
                  srl          a0, tp, s11
                  feq.s        a5, fa4, ft5
                  andi         a5, t0, 165
                  slt          s7, a3, gp
                  fclass.s     t6, ft11
                  fcvt.w.s     s1, ft8, rtz
                  nop
                  sltu         a5, t1, s8
                  fadd.s       fs5, fs0, ft2, rtz
                  addi         tp, a4, -1522
                  or           ra, s11, a0
                  sltiu        zero, a6, -1081
                  fmin.s       fs9, ft6, fs6
                  fcvt.s.w     ft2, a1, rdn
                  sub          s2, t1, zero
                  mul          s1, s4, s0
                  srli         s9, s6, 20
                  fsgnjn.s     fs1, ft9, fs7
                  lui          s10, 1027198
                  ori          s2, t4, 5
                  auipc        t0, 920904
                  fle.s        t6, fs4, ft1
                  flt.s        s7, fs4, fa0
                  xori         a1, ra, -1957
                  auipc        s2, 539638
                  ori          a7, tp, 688
                  remu         tp, s4, t0
                  xori         a2, s7, -1924
                  fadd.s       ft4, fs8, fa3, rtz
                  srl          s8, s10, a7
                  sltiu        a7, t3, 343
                  andi         s1, t5, -1659
                  nop
                  and          gp, s6, a6
                  fsgnjx.s     fa6, fs4, fa6
                  and          t4, s6, s0
                  mulh         a1, a5, t1
	fcvt.s.wu	fa4, s11, rne
                  fcvt.s.w     fa3, s7, rne
                  rem          s0, t5, a0
                  divu         s5, s7, tp
                  slti         s3, a2, -788
                  auipc        t6, 381177
	fsub.s	fs7, fs7, fs8, rne
                  divu         s7, s0, a5
                  sltiu        a0, s6, -1422
                  lui          t3, 216444
                  fsgnj.s      fa2, ft1, fs10
                  rem          s2, s11, s0
                  mul          t0, a2, tp
                  nop
	fadd.s	fa5, fa1, fa2, rne
                  fcvt.w.s     t0, fa1, rtz
                  srli         a1, zero, 15
                  srai         s5, t0, 27
                  addi         t6, a1, 1562
                  sltiu        a6, s5, -1059
                  sltiu        s10, s8, 423
                  sll          t0, t5, s6
                  remu         s9, s6, sp
                  slt          ra, ra, s3
                  xori         ra, t5, -1038
                  fsgnj.s      fs2, ft9, fs9
                  slli         ra, t0, 30
                  fsgnjn.s     ft11, fa0, fa3
                  fmv.w.x      ft6, a7
                  fmin.s       ft3, fs7, ft9
                  fsgnjn.s     fs5, fs9, ft9
                  srli         s8, zero, 1
                  fmv.x.w      t0, fs1
                  fsub.s       fs10, fa0, fa2, rdn
                  fmin.s       ft11, ft8, ft1
                  fmin.s       ft10, fa4, fa6
                  auipc        s5, 110817
                  slti         tp, s11, 502
                  sll          s3, a0, tp
                  fcvt.w.s     s3, fa1, rdn
                  fsgnjx.s     ft8, ft11, fs8
                  nop
                  xor          s6, s6, gp
                  fsgnj.s      fs6, fs5, fs1
                  fsgnj.s      ft3, ft1, ft0
                  fmv.w.x      ft0, s7
                  srai         a3, a6, 20
                  mulhsu       a1, t2, a5
                  mulhsu       a4, s6, s3
                  mulhsu       t3, ra, a0
                  fclass.s     s8, ft9
                  sltiu        t0, t5, 761
                  fsgnjn.s     ft10, fs7, fs9
                  fmv.x.w      t0, ft2
                  sra          s11, s2, a1
                  and          t6, a4, a7
                  fmax.s       fa5, ft8, ft0
                  nop
                  xor          s0, ra, s6
                  sll          a0, tp, a2
                  sra          t6, s2, s7
                  slt          tp, s9, ra
                  fmax.s       ft0, fa0, ft11
                  mulhsu       s6, gp, t0
                  xor          a3, a6, s9
                  feq.s        a5, fa3, fa0
                  slti         a0, s4, -649
	fsub.s	ft9, fs5, fa7, rne
                  sra          s10, t3, s8
                  fmin.s       ft3, ft7, ft10
                  divu         tp, t3, gp
                  fsgnj.s      fs10, ft6, fs8
                  sltiu        a0, a6, 1371
                  xor          zero, tp, tp
                  slti         t1, t1, -774
                  auipc        s0, 691115
	fsub.s	fa3, ft8, fs4, rne
                  slti         a7, t5, 1903
                  sltu         s2, a3, t4
                  andi         a0, s4, -997
                  div          tp, gp, a3
                  fmin.s       fs6, fa4, ft4
                  xor          s2, t0, t0
                  slli         a7, a1, 30
                  fmv.x.w      gp, fa4
                  fmv.x.w      t0, fs2
                  srl          s6, t6, s3
                  xori         s10, s3, -1151
	fcvt.s.wu	fa2, s9, rne
                  fmin.s       ft0, fa6, ft8
                  rem          a3, s3, s3
                  flt.s        zero, ft11, ft0
	fsub.s	ft8, fa3, fa6, rne
                  fmin.s       fs0, ft0, fa1
                  lui          a6, 494349
                  fsgnj.s      ft7, fs11, fs11
                  xor          s6, s10, a5
                  mulhsu       a1, t2, s5
                  srl          zero, s5, sp
	fcvt.s.w	ft5, gp, rne
                  andi         a7, a5, -165
                  slti         t3, t3, 1710
	fcvt.wu.s	s11, fs2, rne
                  fclass.s     t0, fs0
                  flt.s        t0, ft5, ft7
                  fsgnjn.s     fs1, fs4, fa4
                  slt          a1, a0, a6
                  fcvt.s.wu    fs2, a3, rup
                  fmax.s       ft10, fa3, fs1
                  or           sp, s9, a6
                  sub          a0, s7, a3
                  sltiu        sp, a1, -72
                  fclass.s     s6, fa6
	fcvt.s.w	fs4, sp, rne
                  rem          s0, s0, s7
                  divu         s2, t3, s11
                  sra          a1, tp, sp
                  fle.s        zero, ft6, fs6
	fsub.s	ft8, ft2, fs10, rne
                  xori         a3, zero, -670
	fcvt.s.wu	ft6, t3, rne
                  lui          ra, 991885
                  srai         s8, tp, 15
                  divu         s7, s11, s10
                  divu         s7, s9, s3
                  fsub.s       fs0, fs6, fs2, rmm
                  xori         t1, t4, 174
                  div          s1, t6, a1
                  flt.s        a4, fa4, fs8
	fcvt.s.w	fs3, s7, rne
                  fsgnjn.s     fs11, fs10, ft6
                  fsgnj.s      ft2, fs4, fa5
                  srl          s9, zero, a1
                  slt          gp, s5, s7
                  srai         t3, s10, 3
                  sub          t0, gp, t2
                  remu         a6, a1, t3
                  fcvt.wu.s    a2, ft8, rdn
                  fsub.s       fa2, fa5, ft9, rne
                  remu         a5, a7, zero
                  add          t3, t0, a1
                  mul          a3, t0, s6
                  fsgnj.s      ft8, fs8, ft11
                  sll          s6, s8, s6
                  fle.s        s0, ft6, fa6
	fcvt.w.s	t6, fs0, rne
                  or           s6, t5, gp
                  rem          t3, s4, tp
                  sll          a5, ra, t6
	fcvt.w.s	s2, fs2, rne
                  div          t0, t6, s4
                  fcvt.s.w     ft10, t2, rdn
                  fadd.s       ft0, ft5, ft9, rmm
                  rem          ra, s11, a2
                  remu         t4, a0, s8
                  lui          s10, 67245
	fcvt.w.s	zero, ft2, rne
                  sra          t4, a5, t6
                  srl          s7, s5, t1
                  srai         s5, t4, 15
                  xor          s2, a7, t5
                  or           t0, ra, gp
                  add          a3, a7, a3
                  mul          s2, t4, a6
                  sll          s6, sp, s7
                  slt          t3, a6, a5
                  mulhu        t0, t4, a7
                  fcvt.s.wu    fa4, s3, rdn
                  addi         s9, s11, 478
                  fsub.s       ft10, fa3, ft1, rne
                  slli         a0, s9, 20
                  fmax.s       fa0, fs10, ft2
                  fmv.w.x      fs7, s0
                  andi         zero, tp, -1813
	fcvt.s.w	ft6, a6, rne
                  feq.s        a0, fa4, ft0
                  feq.s        ra, fs4, fs0
                  add          a2, s8, tp
                  fmv.w.x      fa3, t6
                  fle.s        t3, fs8, ft6
                  fmv.x.w      s10, fs4
                  sub          tp, s5, sp
                  sltiu        s5, a2, -1374
                  xor          a6, tp, t4
                  auipc        gp, 719749
                  fsub.s       fa1, ft2, fs3, rne
                  fsub.s       ft6, fa1, ft0, rtz
                  fmv.x.w      s5, fs10
                  fsgnj.s      ft11, fs0, fs0
                  flt.s        tp, fa1, fs11
                  xor          gp, s8, s7
                  div          sp, a0, t5
                  slt          s8, ra, s1
                  fle.s        a0, fs6, fs5
                  or           s10, s5, s1
                  sll          s3, t5, a5
                  fmax.s       ft6, fa0, fa4
                  andi         s6, a6, 764
                  fsgnj.s      fa2, ft1, fs6
                  div          s10, a6, t6
	fcvt.s.wu	fs7, t6, rne
                  and          t6, t4, t2
                  div          a6, t5, s0
                  ori          a6, s7, -1097
                  sltiu        s6, s9, -860
                  mul          zero, a4, s4
                  slt          a0, s11, sp
                  auipc        s2, 342832
                  fclass.s     s0, ft3
                  fmax.s       ft10, ft6, ft8
                  fle.s        s7, ft0, fs11
                  fsgnjx.s     ft7, fa6, fa4
                  div          a5, s10, t2
                  mulhsu       s3, a2, s11
                  remu         t1, a3, s10
                  fsgnjx.s     fs6, fs11, ft7
                  xori         a7, s1, -1989
                  fsgnjx.s     fa1, ft11, ft10
                  ori          t4, t1, -1399
	fcvt.s.w	fs3, ra, rne
	fcvt.wu.s	s8, fs10, rne
                  addi         a0, s8, -704
                  fsgnjn.s     fs2, ft9, fa6
	fcvt.w.s	a3, ft10, rne
                  ori          s10, tp, 1058
                  mulhu        s10, s7, s8
                  srl          a4, s0, s4
                  sra          s9, a6, s2
	fcvt.s.wu	fs3, sp, rne
                  fle.s        a0, ft5, fa7
                  fadd.s       fa2, fs11, ft3, rdn
                  slti         s7, t1, 1204
                  fclass.s     gp, ft3
                  xor          a1, s8, a4
                  slt          a0, a0, s8
                  fmin.s       fs9, fs4, ft0
                  fmv.x.w      a3, fa0
                  divu         ra, s10, a1
                  rem          a0, t5, t4
                  slli         a2, zero, 13
                  feq.s        s3, ft5, fs2
                  mulhu        tp, tp, a0
                  add          s11, zero, sp
                  sub          t4, a4, t0
                  mul          s9, s11, a5
                  divu         zero, s8, a6
                  feq.s        s6, fa2, ft11
                  nop
                  lui          gp, 331330
                  fsgnjx.s     ft5, fa2, fs6
                  lui          s10, 44579
                  slt          s6, s6, a1
                  nop
                  srli         t4, t2, 14
                  fsgnjx.s     ft7, fa6, fa1
                  fsgnj.s      ft10, ft1, fa5
                  addi         gp, gp, -123
                  sltiu        sp, t1, -649
                  mulhsu       tp, t5, s11
                  xor          s2, s7, tp
                  andi         a0, a0, -1245
                  sll          s9, s10, s9
                  feq.s        s6, ft9, fa1
                  fmv.x.w      s5, ft1
                  slt          a7, zero, s4
                  rem          s9, s0, t0
	fadd.s	fa0, ft4, ft8, rne
                  fmin.s       ft11, fs6, fs10
                  lui          s9, 630570
                  andi         tp, s4, 1840
                  and          s8, t2, a6
                  srli         a6, s8, 19
                  addi         t1, a3, -1250
                  fmax.s       fs11, fa1, fs8
                  mulh         s0, s0, t6
                  fmv.w.x      ft3, tp
                  fadd.s       fs5, fs8, fs3, rtz
                  rem          s2, t1, s11
                  mul          zero, s8, t1
                  andi         a7, s10, -31
                  divu         a5, a5, ra
	fadd.s	fa2, ft2, fa0, rne
                  srli         s5, a6, 11
                  ori          t3, t0, 1727
                  div          s1, a7, t0
                  sltu         ra, t1, a1
                  mul          a5, a4, s2
                  auipc        t1, 461043
                  lui          a5, 732166
                  auipc        s3, 89694
                  srli         s9, a1, 15
                  fle.s        s6, ft2, fa2
	fcvt.w.s	t3, ft3, rne
                  xori         t1, a0, 1481
                  fsgnjn.s     fa5, fa0, fs6
                  sub          t4, tp, tp
                  fmin.s       fs11, fs8, ft1
                  slt          a3, ra, s7
                  xori         s1, s6, 1618
	fcvt.wu.s	a3, fa2, rne
                  slli         s2, zero, 12
                  feq.s        a1, fs2, ft5
                  fle.s        ra, fs9, fs6
                  sltu         a7, ra, s6
                  rem          s0, s5, s9
                  divu         s7, s9, a4
	fcvt.s.w	ft3, s1, rne
	fcvt.s.w	fs7, a0, rne
                  srai         t0, s8, 22
                  add          a1, zero, s11
                  div          t0, s6, a5
                  addi         a5, s5, 1197
                  andi         s11, s1, -740
                  lui          s9, 1040963
                  or           a4, tp, ra
                  slli         s0, t4, 5
                  andi         gp, s10, -883
                  xori         t6, t5, -140
                  remu         t1, a1, t6
                  srai         tp, a1, 11
                  srli         a4, t3, 16
                  mulh         a2, zero, gp
                  fmv.x.w      s0, ft6
                  fsgnjn.s     ft10, ft4, fs3
                  or           t3, t6, s7
                  fle.s        s9, ft0, fs4
                  feq.s        a6, fs1, ft3
                  mul          s2, t6, s8
                  or           s11, s3, s4
                  andi         a1, zero, -1397
                  sltu         s7, a2, t5
                  flt.s        a0, fs4, fs1
                  srai         a2, a1, 3
                  mulhsu       s9, zero, s5
                  mul          a7, t3, a6
                  auipc        sp, 72507
                  addi         s3, a0, -213
                  srli         t6, t6, 11
                  mulhsu       a5, s4, t4
                  fsub.s       fs5, fa1, fs10, rne
                  fmv.w.x      fs9, t6
                  srli         t6, s8, 17
                  andi         ra, sp, -43
                  fmax.s       ft2, ft2, fs7
                  auipc        s11, 432395
                  srli         a1, s3, 1
	fcvt.s.wu	fs3, s5, rne
                  or           a0, ra, a4
                  slli         s8, a6, 12
                  slli         s7, a6, 11
                  nop
                  slti         t0, a0, -64
                  add          s7, s8, s9
                  sltiu        s5, a4, 2025
	fadd.s	fs1, fa4, fa5, rne
                  slli         a6, a1, 14
                  fclass.s     s8, fs4
                  slt          s3, ra, a4
                  fcvt.s.wu    ft6, a7, rtz
                  ori          a1, a0, 1524
                  rem          s5, a0, gp
                  mulhsu       a7, t2, s2
                  slt          a2, s11, s8
                  sll          s6, a6, a4
                  or           s9, s0, a4
                  fcvt.wu.s    s11, fa5, rdn
                  auipc        s6, 1019985
                  srai         a1, s0, 22
                  divu         s10, a7, gp
                  srai         zero, a0, 3
	fsub.s	ft8, fs0, fa0, rne
                  sra          sp, t0, t4
                  sltiu        s11, s8, -546
                  fsgnjx.s     fs6, fa1, fa1
                  srl          s3, a2, ra
                  mulhu        tp, gp, s4
                  mul          s1, s3, t5
                  fsgnjx.s     fa7, fs4, fs7
                  fclass.s     a5, fa2
                  mul          s3, s7, ra
                  andi         t6, tp, 1699
                  fmax.s       ft4, fa5, fa3
                  sltiu        s1, s3, -462
                  fcvt.wu.s    a2, ft11, rne
                  fmv.x.w      gp, ft5
                  sub          t6, s3, t1
                  fmv.x.w      a0, ft9
                  srli         gp, a1, 6
                  sub          t4, tp, a5
                  divu         t1, t4, s0
                  fsub.s       fs0, fs4, fs1, rdn
                  slti         zero, t2, 1292
                  and          ra, a1, t0
                  fsgnjn.s     fa1, ft11, ft11
                  mulhsu       t0, s8, t2
                  fmv.x.w      a2, fa3
                  add          a7, s11, gp
                  nop
                  srli         sp, t1, 13
                  srai         s3, a7, 21
	fadd.s	fs11, fs5, ft3, rne
                  sll          s8, t1, s11
                  mul          zero, a4, t4
                  slti         gp, s11, -181
                  srai         a6, s4, 8
	fcvt.wu.s	s10, fa5, rne
                  mulhsu       s5, a3, sp
                  ori          t3, s0, -1560
                  div          a5, zero, t5
                  slt          t4, s11, a2
                  and          s10, t0, t1
                  srai         tp, s9, 23
                  sltiu        a2, tp, -329
                  mulh         a4, a1, s4
                  mul          t6, a7, s0
                  div          t3, s1, s4
                  sll          s9, s5, s6
                  divu         s7, a4, t2
                  fmin.s       fs7, fa0, ft5
                  slt          t0, s6, t4
                  mulh         ra, a7, s4
                  mulhu        gp, s4, s10
	fadd.s	fs5, fs0, fs2, rne
                  nop
                  sltu         t3, s3, s4
                  remu         s5, t2, s8
                  fle.s        s0, fs6, fs9
	fcvt.s.wu	fs11, a4, rne
                  fmin.s       fs8, fa5, ft10
                  fsgnjx.s     ft3, ft1, ft1
                  fsgnjn.s     ft7, fs7, fa0
	fcvt.s.w	fa7, t2, rne
                  sll          gp, a5, s2
                  sra          a7, s6, t2
                  fsgnjx.s     ft4, ft10, fs11
                  sltiu        s7, ra, 1849
                  sltu         a0, gp, t2
                  sra          a3, s9, sp
                  fcvt.wu.s    ra, fs8, rdn
                  slti         s1, s1, -1474
                  xori         s6, s3, -2022
	fadd.s	fa0, fa1, ft0, rne
                  flt.s        tp, fs6, fs8
                  sub          s10, zero, s11
                  fsgnjx.s     fs9, ft0, ft11
                  fle.s        t3, fa7, ft0
                  nop
                  sub          s5, s8, a0
                  fsgnjn.s     ft3, fa5, fa5
                  srli         t1, s5, 24
                  xori         s1, zero, -1059
                  mulh         s7, s6, t6
                  srl          s8, s1, t4
                  fcvt.s.wu    ft4, tp, rmm
                  nop
                  xor          s9, a4, s5
                  fmv.x.w      s3, fa7
	fsub.s	ft6, fa6, ft9, rne
                  addi         sp, a6, -1398
                  addi         s10, s4, 621
                  flt.s        sp, fs0, fa7
                  addi         t1, a4, -1552
                  fle.s        t4, fs8, fs9
                  mul          tp, s5, s10
                  sra          s11, t0, s7
	fcvt.wu.s	a3, fa2, rne
                  feq.s        a5, fa5, fa7
                  slt          s11, s2, a4
                  sra          s10, zero, s0
                  sll          s9, s11, s3
                  slti         s7, s11, 770
                  and          a7, t2, tp
                  fadd.s       ft2, fs11, ft8, rdn
                  sltiu        a6, s9, 2039
                  feq.s        s10, fa1, ft1
                  fsgnjx.s     ft5, ft2, ft3
	fcvt.s.wu	fs6, s8, rne
                  fmin.s       ft11, fs1, ft2
                  lui          t6, 217626
                  fmv.w.x      fa4, a5
                  xor          sp, s0, a6
                  slt          a1, t4, s8
                  flt.s        s6, fs10, fs11
                  xori         gp, gp, 1739
                  fsgnjx.s     fs6, fs7, fs0
                  slli         t0, s7, 19
                  sub          gp, a3, s5
                  flt.s        sp, fs4, fa1
                  xori         s10, gp, -196
                  slli         s9, ra, 19
                  srli         a5, a0, 17
                  lui          s3, 892836
                  fclass.s     s10, fa4
                  sltu         s2, ra, a2
                  or           s6, t5, a5
                  fsgnjx.s     ft5, fs1, fa2
                  sltiu        a5, s3, -113
                  srli         s7, gp, 24
                  fsgnjx.s     fa3, fs2, ft5
                  slli         zero, a5, 17
                  srli         t4, a1, 23
                  xor          a1, t4, gp
                  fmin.s       ft9, ft5, fs8
                  or           ra, gp, t6
                  sltu         s2, a6, a4
                  nop
                  add          a3, t5, s6
                  nop
                  div          t0, t2, s2
                  nop
                  fmin.s       ft7, ft9, fa7
                  feq.s        t6, fa1, ft7
                  add          zero, t2, gp
                  feq.s        s1, ft10, ft0
                  mulhsu       t1, a5, a2
                  and          a0, t0, a6
                  add          tp, s4, a3
                  fsub.s       fs7, ft2, fs5, rne
                  mulhu        s2, s9, s11
                  mul          s1, s4, ra
	fcvt.wu.s	t4, ft6, rne
                  fadd.s       fa0, ft2, ft11, rne
                  ori          sp, s7, -1998
                  fmv.w.x      fa5, s5
                  lui          ra, 387803
	fadd.s	ft11, fa5, fs11, rne
                  add          s8, a0, s4
                  mul          s2, a4, t0
                  sltiu        t6, a0, 1193
                  fmax.s       fs11, fs5, ft8
                  mulhsu       s1, t6, t6
                  fmv.w.x      fs4, t0
                  ori          t1, s6, 1523
                  or           s7, t3, a2
                  div          tp, t3, s7
                  fsgnjx.s     ft4, fs9, fa4
                  mulh         s5, s4, s7
                  lui          s3, 634539
                  fsgnjn.s     fs5, ft10, ft7
	fcvt.s.wu	fa3, gp, rne
                  srl          a1, s0, s8
                  srai         t6, t4, 2
                  flt.s        s10, ft2, ft8
                  sra          gp, t3, ra
                  feq.s        gp, ft10, ft6
                  sra          s7, s5, s0
                  fcvt.wu.s    gp, fa2, rtz
                  mulhu        tp, s11, tp
                  mulhu        t3, t4, sp
                  auipc        s5, 462065
                  auipc        a3, 912502
                  auipc        a3, 935645
                  add          zero, t2, s5
                  fmv.w.x      fa6, s0
                  andi         a3, sp, 747
                  addi         a3, zero, 230
                  sll          s6, s9, a4
                  fcvt.wu.s    s11, ft10, rmm
                  fmax.s       fs2, ft4, fs3
                  srli         s8, s5, 19
                  mul          s10, t0, s4
                  fsgnjx.s     fa1, fs10, ft9
                  fmv.w.x      fs5, s2
                  ori          a6, s4, 594
                  add          s7, a7, a3
                  fsgnjx.s     ft11, fs5, fs4
                  mul          t4, a1, t6
                  rem          s0, sp, s0
                  fmin.s       ft3, fa3, fs3
                  nop
                  add          sp, ra, ra
                  fsgnj.s      ft2, ft3, ft10
	fcvt.wu.s	s0, fa4, rne
                  sltu         t0, t6, tp
                  andi         t1, s5, 2024
                  flt.s        ra, ft3, ft7
                  fmv.x.w      t4, fs6
                  nop
                  andi         s7, s2, 502
                  slti         t6, t5, 1151
                  ori          s2, s7, -1811
                  fmax.s       fa5, fs0, ft7
                  remu         a6, a0, t0
                  sltu         a3, t0, zero
                  fle.s        a0, fa4, ft5
                  srl          gp, sp, s1
                  or           a2, s7, t4
	fsub.s	fa0, fa2, ft7, rne
                  auipc        s5, 928715
                  sra          t3, a4, s3
                  lui          tp, 822026
                  or           t0, a2, a1
                  fmv.x.w      tp, fa2
                  sra          a7, t4, s11
                  srl          s8, s4, t0
                  mulhsu       s9, s5, t2
                  auipc        t4, 602019
                  sra          zero, a6, a4
                  srli         t6, s6, 21
                  divu         ra, t1, a2
                  sll          gp, s11, s3
                  flt.s        gp, fs9, fa6
                  srli         s10, t2, 4
                  fclass.s     s8, fa4
                  fle.s        a2, fa6, fa1
                  fsgnjx.s     fa2, fs3, ft9
                  feq.s        a7, ft1, ft11
                  auipc        s1, 737415
                  slti         s0, s8, -787
                  sub          a2, s4, t3
                  fsgnjx.s     ft9, fs1, fs0
                  mul          a4, s3, s4
                  or           zero, a5, t5
                  sltu         t1, ra, a2
                  addi         t3, s2, 1217
                  auipc        s5, 944441
                  srl          a6, s10, s0
                  flt.s        t6, fs4, fs8
                  rem          tp, s6, s6
                  fsgnj.s      ft5, fs10, fs3
                  mulh         a7, s6, ra
	fcvt.s.wu	fs4, a7, rne
                  fcvt.s.w     ft9, a1, rmm
                  sltiu        tp, t6, 410
                  fclass.s     a7, ft0
                  remu         a0, a6, a3
                  srai         s9, s11, 14
                  fsgnj.s      ft10, fa5, fa6
                  srli         s5, a1, 5
                  flt.s        s6, fa6, ft11
                  xor          a6, t1, a2
                  add          ra, s9, a5
                  sltiu        s7, t0, -414
                  feq.s        s11, fa6, ft11
                  srl          t3, a5, a3
                  addi         s1, s2, 671
                  slli         s11, sp, 25
                  andi         ra, a2, -749
	fadd.s	ft5, fa7, fs11, rne
                  mulhu        a3, a4, t5
                  feq.s        a6, fa3, ft11
                  mulhu        a3, a5, t6
                  fsgnjn.s     fs9, fa1, fa3
                  slt          s8, t6, tp
                  rem          t4, s2, a5
                  srl          t4, t2, s5
                  andi         a4, ra, 675
                  ori          s3, t3, -2020
                  addi         a0, t0, 944
                  fcvt.s.w     fs10, s1, rtz
                  div          s7, ra, t1
                  add          a4, a1, a3
                  remu         t4, a2, s1
                  srai         a6, s6, 19
                  mulhsu       t6, t1, t2
                  or           s7, s10, tp
                  fclass.s     s9, ft0
                  fcvt.s.w     fs8, ra, rdn
                  div          s2, a6, s3
                  mulhu        a5, t0, a0
                  fmax.s       fs5, fs10, ft1
                  fsgnj.s      ft7, ft0, fa6
                  fcvt.wu.s    s0, ft5, rup
	fcvt.s.wu	ft7, a2, rne
                  remu         s2, s1, a4
                  sltu         gp, s9, s4
                  lui          s5, 621274
                  fmin.s       ft9, fs5, fs6
                  feq.s        a5, ft5, fs4
                  fadd.s       ft9, fa6, ft3, rdn
                  sub          s3, s7, s1
                  sra          t4, s4, gp
                  slli         s3, s10, 5
                  addi         s1, t3, 279
                  fclass.s     t6, fs1
                  fmv.w.x      ft3, a3
                  slt          t4, s5, s9
                  fsgnjn.s     fa6, ft2, fs7
                  fmin.s       fs8, ft8, fa5
                  fcvt.w.s     s2, fa6, rne
                  xor          s7, s3, t6
                  mulhsu       a3, a2, a2
                  rem          a7, t3, s0
                  fmax.s       fs11, fa7, fa6
                  and          a1, gp, gp
                  srai         t0, s5, 27
                  srli         t1, t5, 9
                  rem          t1, zero, s3
                  xor          ra, a5, a3
	fcvt.s.w	fa4, s7, rne
                  fmax.s       fa7, ft0, ft6
                  mulhu        s2, zero, s4
                  div          s3, t1, s1
	fcvt.s.w	ft4, zero, rne
                  sltiu        a1, t1, -1817
                  mul          t3, a4, t3
                  fadd.s       fs6, fa7, ft0, rup
                  feq.s        a5, ft6, fs2
                  sltiu        s10, tp, -1287
                  srai         a3, a5, 27
                  ori          t4, s6, -195
                  sltu         tp, a7, t4
                  sll          t4, s6, s11
                  divu         a3, s9, a5
                  mulhsu       t3, a2, t3
                  fmin.s       fs7, fs7, fs4
                  fsgnjx.s     fs2, fa7, ft3
                  fsub.s       fa6, fs5, fs6, rdn
                  fmv.x.w      s7, ft2
                  lui          s1, 545423
                  fsub.s       fa3, fa3, fs10, rdn
                  fmv.x.w      a3, ft5
                  srli         t0, a5, 31
                  auipc        a0, 722227
                  and          s8, s8, s4
                  fmax.s       fs5, ft3, ft1
                  slli         a6, a3, 8
                  fsgnjn.s     ft4, fs9, fs5
                  or           s10, s6, a1
                  auipc        a1, 656476
                  fsub.s       fs2, ft8, fs11, rmm
                  fcvt.w.s     a4, fa0, rtz
                  xor          s0, a6, gp
                  nop
                  mulhu        s2, a0, s0
                  srai         a7, s11, 13
                  fmv.w.x      ft5, a3
                  srl          ra, a0, t4
                  nop
	fcvt.wu.s	s11, fs7, rne
                  fcvt.w.s     s7, fa1, rup
                  slt          ra, a3, a5
                  srai         t6, a7, 3
                  fmv.w.x      fa3, s11
                  fmin.s       ft3, fa2, ft9
                  add          s11, s1, s5
                  remu         a1, s11, s1
                  nop
                  fmv.w.x      ft7, a7
                  flt.s        a2, ft8, fs0
                  sub          ra, s2, s6
	fcvt.s.wu	fs4, t3, rne
                  slti         s0, s10, 1707
                  srli         s2, sp, 28
                  divu         sp, a5, s4
                  mul          s7, tp, a7
                  div          s5, s0, t3
                  divu         a0, a7, s7
                  sltu         a1, s4, t5
                  addi         tp, t1, -639
	fadd.s	ft1, fs2, ft5, rne
                  srai         s2, zero, 25
                  fmv.w.x      fs2, s8
                  fclass.s     sp, fa5
                  lui          ra, 143128
                  divu         s0, s0, zero
                  fmv.w.x      ft10, zero
                  ori          t1, a0, -6
                  fadd.s       fa5, fs2, fa4, rmm
                  sub          s7, t4, s11
                  ori          a0, t4, -1370
                  sra          s6, s9, a7
                  addi         t0, s0, -135
                  fcvt.s.wu    ft11, sp, rdn
                  fmin.s       fs0, fs0, fa3
                  fcvt.w.s     t0, fs3, rne
                  fmv.w.x      ft1, s6
                  fclass.s     gp, ft11
                  fsgnj.s      fs10, ft11, fa3
                  add          t3, s2, a1
	fcvt.s.w	ft5, a3, rne
                  fsgnjx.s     ft11, fs2, ft11
                  fmv.w.x      fs8, s7
                  andi         s2, tp, 1289
                  div          s11, s9, s1
                  fmin.s       ft10, ft7, ft2
                  srli         a3, gp, 7
                  nop
                  feq.s        s6, fs5, ft9
                  mul          s11, t5, s2
                  fmax.s       ft5, ft3, fs2
                  sra          s6, gp, a4
                  sll          t4, a0, ra
                  mulh         a3, a2, a7
                  fadd.s       fs5, fs6, ft11, rup
                  srl          t3, t1, a5
                  remu         sp, s4, a5
	fsub.s	fs0, ft3, ft8, rne
	fadd.s	fs8, ft9, ft1, rne
                  remu         zero, s5, t1
                  sra          t3, zero, t2
	fsub.s	fs11, ft9, ft10, rne
                  divu         tp, t5, t6
                  fle.s        s3, fs5, fa2
                  srli         s6, t3, 29
                  mulhsu       s3, s5, a7
                  mulhu        gp, s4, zero
                  xori         a4, s5, 129
	fcvt.s.wu	fs2, t6, rne
                  sra          a7, tp, a2
                  and          s9, s9, zero
                  nop
                  fmv.w.x      fa0, tp
                  slt          a5, s0, a7
                  rem          a1, gp, s0
                  srl          t0, s11, s1
	fcvt.wu.s	gp, fa5, rne
                  addi         s9, s9, 746
                  remu         s5, t4, s4
                  srli         a2, t2, 18
                  srli         t0, t4, 20
                  fsgnj.s      ft1, fa6, fs3
                  divu         s5, s3, s0
	fcvt.w.s	s10, ft2, rne
                  andi         s2, s9, -1291
                  fmin.s       ft10, fs6, ft2
                  fsgnjx.s     fa7, fs0, fa6
                  srli         a5, s10, 1
                  fcvt.w.s     a3, ft2, rdn
                  or           s11, s11, gp
                  flt.s        t4, fa5, fa6
                  slli         gp, s6, 4
                  andi         a0, t2, -1993
                  xor          s2, a4, a4
                  xori         t4, a0, 112
                  slli         s1, gp, 25
                  add          a2, t1, tp
	fsub.s	fa2, fa7, fa2, rne
                  fmin.s       fs0, fs9, fs1
                  fmax.s       ft8, fs4, fs1
                  lui          a6, 351620
                  srl          s1, t3, a0
                  fsub.s       ft10, fs5, ft6, rmm
                  divu         s1, s9, s1
	fcvt.wu.s	s0, ft9, rne
                  fmv.x.w      a0, fs6
                  fadd.s       fs8, ft6, ft10, rup
                  fcvt.wu.s    t6, fa4, rup
                  slli         t6, a7, 6
                  srai         tp, sp, 15
                  nop
                  fsub.s       fa3, fa1, ft3, rdn
                  divu         s8, a5, s3
                  fsgnjx.s     fs7, fs6, fa1
                  sub          a7, gp, sp
                  andi         s1, a0, 441
                  feq.s        a2, fs10, ft5
                  fle.s        ra, fs1, fs3
                  div          s6, s7, t2
	fcvt.wu.s	a7, fa0, rne
                  sltu         sp, s8, sp
	fcvt.s.wu	fs4, a6, rne
                  fmax.s       ft7, ft7, ft5
                  mulhsu       s10, s6, s1
                  remu         ra, s7, ra
                  fmax.s       fa7, fs0, ft4
                  rem          t6, tp, s10
                  fsub.s       ft5, fs6, fa2, rup
                  fmin.s       fs11, fa1, fs7
                  sll          s0, a2, sp
                  sra          s3, s11, s6
                  fmv.w.x      fa3, a5
                  slt          zero, sp, s3
                  fsgnj.s      fa5, fs4, ft5
                  andi         s5, ra, -2036
                  nop
                  sll          ra, s7, a5
                  fclass.s     a0, ft8
                  sra          t6, s8, s1
                  lui          t1, 436699
                  mulh         s9, a7, s0
                  and          s1, t5, s7
                  flt.s        t6, ft7, fs11
                  sltu         s1, a7, t6
                  remu         t4, t0, gp
                  slli         a6, zero, 19
                  fsgnj.s      ft0, ft9, ft4
                  addi         a6, ra, -1656
                  fmin.s       fa6, fa7, fs1
                  nop
                  slli         a2, ra, 11
                  rem          s5, s11, s2
                  fclass.s     sp, ft3
                  sub          a7, s1, s10
	fcvt.s.w	fs7, a0, rne
                  and          t6, a4, s5
                  rem          t6, t4, a4
                  fsub.s       fa5, fs4, ft7, rup
	fsub.s	fs10, fa7, fs9, rne
                  slli         s8, a5, 10
                  andi         gp, t1, -1302
                  mulhu        a1, s6, a3
                  and          t3, s2, t1
                  srl          s2, a2, s9
                  fmv.x.w      a0, fs4
	fcvt.wu.s	s7, ft1, rne
                  sltu         a5, s10, t3
                  fmv.x.w      tp, fs2
                  flt.s        s2, fa0, fs4
                  feq.s        s0, ft9, fa2
                  feq.s        a4, ft1, fs3
                  or           s5, s10, s0
                  and          s6, t3, t0
                  srl          s8, s5, a3
                  slt          a6, sp, t4
                  auipc        gp, 328812
                  div          a6, s7, a1
                  slt          s8, a0, s2
                  fmin.s       ft5, ft2, ft10
                  fcvt.s.w     ft1, s11, rne
                  slt          s11, a3, t1
                  addi         s0, a3, 1914
                  fle.s        a6, fa1, fs3
                  fcvt.w.s     sp, fa4, rtz
                  fmv.x.w      s8, fa0
                  fmv.w.x      ft2, a1
                  srai         s1, a5, 19
                  fclass.s     s6, fs6
	fcvt.s.wu	fa7, s11, rne
                  divu         a4, gp, s2
                  add          a0, gp, t0
	fcvt.s.w	fs3, a1, rne
                  xor          s10, t4, t4
                  or           a5, s10, t0
	fsub.s	fa0, ft5, fa6, rne
                  lui          t1, 547751
                  slli         t0, a4, 2
                  sub          sp, ra, s2
                  fmv.x.w      t6, ft7
                  sra          a5, s8, s2
                  or           t6, t4, t4
                  mulhsu       s9, t5, t4
                  fcvt.s.w     fs8, s8, rmm
                  div          t3, t2, s3
                  fmv.w.x      fs8, a7
                  rem          a4, s4, a2
                  xor          sp, t1, s2
                  fcvt.wu.s    s6, fa4, rne
                  or           sp, t3, a0
                  slt          s7, t6, s6
                  nop
                  addi         tp, s10, 1645
                  divu         t6, ra, s9
                  addi         a4, t6, 953
                  xori         s11, a1, -281
	fcvt.s.wu	fs11, t0, rne
                  and          a2, tp, sp
                  fsgnjn.s     ft9, ft7, fa2
                  and          a7, s7, a5
                  flt.s        s5, fa7, fs8
                  mulhu        s2, zero, zero
                  sub          sp, tp, a2
                  fcvt.s.wu    fa2, s5, rne
                  remu         s10, a3, s10
                  fmv.w.x      fs9, t0
                  andi         s2, a6, 936
                  sra          a2, a1, ra
                  feq.s        s5, ft11, ft0
	fsub.s	ft9, fs6, fs4, rne
                  add          a2, a6, t3
                  fmin.s       fs6, ft1, fs7
	fcvt.w.s	s8, fa1, rne
                  srli         a1, a4, 27
                  rem          gp, a2, s10
	fadd.s	fs7, fs9, fa2, rne
                  fmv.x.w      s9, fa3
	fcvt.w.s	s2, fs11, rne
                  ori          a1, a1, -1006
                  and          a7, ra, a1
                  div          a3, s8, s4
                  srai         s9, t2, 9
	fcvt.s.wu	fs3, zero, rne
                  srl          a6, s9, tp
                  fsgnjn.s     fs4, fs3, ft3
                  mulhsu       a4, a3, s9
                  srai         a3, t0, 2
                  mul          s10, s1, a3
                  divu         s10, sp, s4
	fcvt.s.wu	fs11, a5, rne
                  sra          a6, a2, t2
                  fsgnjn.s     fs11, fa4, fa2
                  lui          t6, 138259
                  add          a3, a3, s1
                  lui          ra, 458966
                  xor          s10, zero, a5
                  sltu         ra, a3, zero
                  slt          t0, a4, s6
                  ori          t6, a3, -734
                  remu         a2, s11, t3
                  fadd.s       fs9, fa1, ft5, rup
                  srli         gp, zero, 8
                  add          t1, a3, tp
	fcvt.s.w	ft2, a7, rne
	fcvt.s.w	fs5, zero, rne
                  divu         t4, tp, t0
                  feq.s        tp, ft4, fa5
                  xori         a2, t6, 1940
                  xori         sp, s4, 65
                  add          a6, t4, s11
                  feq.s        s5, fa6, fs9
                  sra          s5, t6, a3
                  fmin.s       fa3, ft11, ft10
                  fcvt.s.w     ft5, a7, rmm
                  feq.s        s3, fs9, fs9
                  sub          s10, s8, t4
                  fmin.s       fs2, fs9, fs0
                  andi         a1, t1, -1021
                  fmin.s       ft7, fa3, fs2
                  and          s2, t4, s11
                  and          sp, s5, zero
                  div          gp, s7, s3
                  div          t3, s1, a6
                  divu         a1, s9, t6
                  fcvt.wu.s    a5, fs0, rtz
                  fmin.s       fs8, fs3, ft1
                  slti         s11, s1, 1466
                  add          s5, s9, t4
                  andi         s10, s2, -1976
                  fmv.x.w      s5, fs3
                  add          a0, s9, s10
                  auipc        s7, 667867
                  sltiu        s6, a4, 1641
	fadd.s	fs0, fs6, ft3, rne
	fcvt.wu.s	t4, ft6, rne
                  flt.s        s0, ft11, fa0
                  srli         s3, gp, 12
                  sub          t3, t3, s1
                  feq.s        s8, fs8, ft9
	fsub.s	fa7, fs9, fs8, rne
                  fle.s        ra, ft11, ft3
                  slt          s9, tp, t5
                  feq.s        t3, ft3, fa4
                  rem          t4, ra, s0
                  fcvt.s.w     ft8, a6, rmm
                  fsgnjn.s     ft7, ft11, fs6
                  xori         s8, a0, 760
                  fmin.s       fs11, ft6, fs6
                  nop
                  remu         a7, s4, t5
                  fsgnjx.s     fs4, fa3, fa3
                  fmax.s       fs4, fa2, fs5
                  div          s8, t0, t2
                  mulh         a2, t2, s0
                  fsgnjx.s     fa2, fs10, fa7
	fadd.s	ft9, fa3, ft1, rne
                  xori         zero, tp, -971
                  auipc        a0, 190576
                  rem          ra, s7, ra
                  xori         s7, a6, 1123
                  sltu         a4, t4, a7
                  fclass.s     a7, ft5
                  feq.s        a7, ft10, fa4
                  fcvt.wu.s    s9, ft2, rup
                  xor          s1, t5, t6
                  fsgnjn.s     fs6, ft9, fa1
                  feq.s        a0, fs11, fa2
                  slt          s3, s4, s0
                  lui          gp, 1037883
                  fadd.s       fs11, fa5, fa7, rtz
                  and          t6, a1, sp
                  fcvt.s.wu    ft1, a2, rtz
                  sra          a4, a0, s0
                  lui          s11, 1043733
                  srli         ra, zero, 10
                  xor          s1, tp, a3
                  lui          tp, 349695
                  fsub.s       ft5, fa3, fs6, rmm
                  fmv.x.w      a7, ft5
                  xori         a0, s10, -692
                  srai         s5, s9, 9
                  fmin.s       ft11, fa7, fs6
                  fmin.s       fa6, fa5, fa1
                  add          ra, s7, t0
                  auipc        a7, 371968
                  nop
                  slt          s0, a2, t4
	fcvt.s.w	ft3, a7, rne
                  xor          s1, t6, s0
                  ori          s9, zero, 419
                  fle.s        t6, ft7, fs3
                  fsgnjn.s     fa2, ft0, fa2
                  xor          t3, t5, t2
                  and          sp, s8, s9
                  srai         tp, s9, 19
                  flt.s        s7, ft4, fs10
                  slli         t4, t2, 14
	fcvt.wu.s	a2, ft7, rne
                  fsgnjx.s     ft7, fs3, fs7
                  sltiu        a5, s2, 1951
                  flt.s        a3, fa2, fs3
                  fle.s        t6, fs4, ft5
                  fsgnj.s      fs5, ft0, fa6
                  nop
                  lui          a7, 137133
                  and          a5, s4, s11
	fcvt.w.s	s11, ft6, rne
                  fsgnjn.s     ft5, fs8, ft10
                  fsgnj.s      fa2, ft9, fs4
                  nop
                  sra          a5, s10, t4
                  mulhu        s1, sp, t6
                  or           a7, s2, t0
                  srl          a7, t6, s1
                  srl          s2, s11, s2
                  fsub.s       fs3, ft7, fs5, rup
                  slti         s5, gp, 646
                  sub          a5, s11, ra
                  remu         gp, zero, t5
                  and          t3, a3, t0
                  sltu         s8, s2, zero
                  srl          a4, s10, s11
                  srai         t1, s0, 15
                  nop
                  remu         s1, s0, a2
	fcvt.w.s	a4, fa0, rne
                  fmax.s       ft3, ft4, fs11
                  slli         t6, a3, 2
                  mul          a0, a7, t1
                  srl          s3, a5, a4
                  ori          s6, s7, -1507
	fcvt.w.s	a3, fs8, rne
                  sll          a0, s2, tp
                  srai         s7, a5, 26
                  fmv.x.w      s11, fa1
                  fle.s        a6, fa3, ft1
                  sub          s1, a7, s8
                  sltu         tp, a6, t4
                  fmv.x.w      ra, ft6
                  andi         a6, s11, 12
                  mulhsu       t6, t4, s9
	fadd.s	ft3, fs9, fs6, rne
                  nop
                  flt.s        s10, ft0, fa3
                  fmax.s       fs7, ft1, fa3
                  div          t4, s6, a1
                  flt.s        s0, ft2, ft1
                  sub          ra, t4, a7
                  sll          s11, s6, zero
                  mulh         t1, s3, ra
                  add          s10, gp, s10
                  fmv.x.w      zero, ft6
                  fmv.w.x      ft9, t3
                  add          s8, tp, a4
                  fmv.x.w      s8, fs7
                  slt          sp, s3, a1
                  andi         gp, a5, 674
                  mulh         a1, t2, t1
                  mulhsu       ra, t3, t2
                  fmin.s       ft5, fs5, fa2
                  fclass.s     t6, fa0
                  and          a5, s6, s1
                  ori          s5, a5, 1584
                  fmv.x.w      s0, ft7
                  slti         a1, s10, 464
                  andi         a5, t3, 1657
	fcvt.s.w	fa6, zero, rne
                  sra          s0, tp, s10
                  slt          s5, t4, gp
	fcvt.wu.s	s11, fa7, rne
                  fsub.s       ft3, fs4, ft11, rtz
                  ori          s8, sp, 451
                  fmv.w.x      fa3, s1
                  fclass.s     s11, fs7
                  slti         t0, a2, -1309
                  mulh         s1, t2, t1
                  xor          s9, a2, a6
                  xor          s5, s2, t5
                  or           s2, s10, s1
                  addi         s6, t3, 598
                  lui          a6, 165117
                  xori         a1, s2, -1605
                  auipc        t0, 891875
                  sub          a3, tp, s3
                  feq.s        a2, fs3, fs5
                  fadd.s       fa4, ft8, ft9, rup
                  ori          t0, a2, -407
                  fmax.s       fs6, fs1, ft3
                  fmv.w.x      fs6, s2
                  srli         ra, s3, 29
                  srl          a0, s5, zero
                  fcvt.wu.s    gp, ft7, rne
                  flt.s        t6, fa4, fs3
                  feq.s        s0, fa4, ft2
	fcvt.s.wu	fs1, a6, rne
                  fle.s        t3, ft0, ft11
                  xori         s10, tp, 1449
                  lui          s11, 616585
                  rem          s6, t6, s11
                  slli         s8, s2, 0
                  flt.s        s3, ft3, fs0
                  fsgnj.s      fs1, ft0, ft3
                  xor          s1, t2, s5
                  fsgnjx.s     fs6, fa6, fs5
                  auipc        a1, 635166
                  div          s2, a4, t4
                  mul          s6, a7, s5
                  fadd.s       ft11, fa0, fs0, rne
                  sltiu        s9, zero, 1963
                  sltiu        t3, s3, 504
                  srli         s7, s0, 18
                  fclass.s     s11, ft8
                  or           s5, s3, s11
                  sub          a6, zero, t2
                  srli         a1, sp, 12
                  feq.s        t6, fs0, fs11
                  lui          gp, 998723
                  slli         s0, a6, 23
                  rem          a2, ra, a2
                  xor          s0, s9, a0
                  slt          t0, a7, ra
                  fmv.w.x      fs1, t0
                  sra          a1, t3, tp
                  sll          ra, s11, s11
                  mulh         s8, a1, a2
                  flt.s        s8, fs1, fa1
                  fmin.s       ft7, fs9, ft0
                  fclass.s     a1, fs0
                  fcvt.wu.s    s2, ft5, rmm
                  srl          tp, ra, t4
                  fsgnjn.s     ft11, ft4, fs6
                  fcvt.w.s     s7, fs5, rdn
                  fclass.s     a5, ft3
                  lui          gp, 258988
                  and          t0, t2, gp
	fcvt.wu.s	a0, ft11, rne
                  fsgnj.s      fa2, ft7, ft10
                  rem          tp, s4, t3
                  feq.s        t3, ft8, fa2
                  fmax.s       fs1, fs7, fa1
	fcvt.s.w	ft0, a4, rne
                  fsub.s       ft0, fs5, ft6, rne
                  fmv.x.w      s5, ft3
                  rem          s8, s11, t1
                  and          a4, s4, a4
	fsub.s	fs10, fs4, fa1, rne
                  rem          t6, t5, s11
	fcvt.s.w	ft4, s0, rne
                  nop
                  add          a4, a7, t6
                  fle.s        t0, fa4, fa5
	fcvt.s.wu	fa3, a6, rne
                  srli         s2, a3, 15
                  srl          tp, a0, s10
                  fcvt.wu.s    t6, ft0, rup
                  and          a4, s6, t6
                  fmv.x.w      s11, fa4
                  mulhsu       zero, s5, t2
                  fcvt.wu.s    s5, fa7, rne
                  andi         s5, s3, -951
                  flt.s        s7, fs11, ft2
                  srai         s1, a0, 11
                  xori         s6, s6, 979
                  fcvt.wu.s    s0, fa0, rmm
                  mulhsu       s11, a2, s3
                  fcvt.s.wu    fa6, a6, rtz
                  fmin.s       fs7, fa3, ft3
                  sltu         s10, t6, sp
                  lui          t1, 136296
                  fle.s        zero, ft4, fs2
                  xor          tp, a2, s1
                  fmin.s       ft7, ft0, fs3
	fcvt.wu.s	a4, fs7, rne
                  nop
                  slli         s5, gp, 11
	fcvt.s.wu	fa4, tp, rne
                  addi         s3, s11, -514
                  srl          sp, t2, s9
                  sub          s10, gp, t6
                  sra          a1, a0, s8
                  addi         gp, a6, -1220
                  ori          s5, zero, 2038
                  div          a0, s4, t0
                  flt.s        s8, ft1, ft11
                  sltiu        s0, gp, 591
                  feq.s        a2, ft9, ft9
                  add          s8, sp, a3
	fadd.s	ft8, fs4, fa2, rne
                  srl          a5, s3, zero
                  mulh         a4, s2, s5
                  or           s0, s7, a3
                  mulhu        s0, a4, t0
                  slli         s2, s0, 27
                  nop
                  fmv.x.w      gp, fa0
                  xor          s2, a4, a0
                  fmin.s       fs8, fs6, fs4
                  feq.s        s6, ft10, fa3
                  mulhsu       s1, a3, s1
                  div          tp, gp, t4
                  slti         zero, s8, 246
                  lui          a5, 893105
                  add          s9, t1, gp
                  sll          a6, s2, sp
                  add          a5, a7, gp
                  sltu         t0, s5, s7
                  fcvt.s.w     fs4, s5, rtz
                  mulh         t6, s11, s2
	fcvt.w.s	sp, fa5, rne
                  xori         t0, t3, 186
                  sltiu        a5, t5, 90
                  feq.s        a2, fs2, fs7
                  fsgnj.s      ft7, fa7, fa2
                  fmv.x.w      s6, ft3
                  slt          s2, a6, s6
                  slt          sp, s3, s10
                  mulhu        a7, a4, a7
                  fcvt.w.s     sp, fs7, rtz
                  slli         t1, s3, 15
                  auipc        a4, 185866
                  sltiu        s1, s0, -622
                  fmax.s       ft4, ft8, fs10
                  mulhu        s0, a2, zero
                  fmax.s       ft10, ft3, ft3
                  divu         t0, a4, s6
                  addi         zero, sp, 567
                  sra          a3, t6, ra
                  fle.s        t3, ft3, ft3
                  sra          gp, a5, t1
                  fcvt.w.s     t4, ft3, rtz
                  fsgnj.s      fs2, ft4, fa1
                  sra          t3, s2, s2
                  rem          gp, t1, a2
                  fcvt.wu.s    s3, ft1, rmm
                  sltiu        a0, sp, 1580
                  flt.s        a1, ft5, ft10
	fcvt.w.s	a2, fs8, rne
                  fmv.x.w      s1, ft4
                  fsgnj.s      ft10, fs1, fs1
                  sra          t6, a5, t6
                  ori          t4, a5, 1190
	fcvt.s.w	ft1, t2, rne
                  divu         a5, a7, t3
                  sltiu        t0, s5, 1676
                  fsgnjx.s     ft11, ft5, fs10
                  or           a3, t6, a5
                  srl          a4, gp, zero
                  fmax.s       ft1, fs1, fs3
                  flt.s        zero, ft2, fs6
                  fadd.s       ft3, fa6, fa7, rtz
                  fclass.s     a6, ft8
	fadd.s	ft4, fa2, fa4, rne
                  mulhsu       s10, s0, s11
                  fcvt.wu.s    a6, fa1, rdn
                  xor          t3, s6, s6
                  fmv.w.x      ft0, s11
                  slt          s10, s9, tp
	fcvt.s.w	fs5, t3, rne
                  fclass.s     s9, fa6
                  flt.s        s0, fs1, fs5
	fadd.s	ft9, fs5, fs11, rne
                  auipc        s3, 149580
	fsub.s	fa6, fs6, fa1, rne
                  add          s5, s2, a1
                  div          a3, a7, a0
                  feq.s        a1, fs6, fa0
                  flt.s        t0, fs1, fs10
                  fmin.s       ft7, fs3, ft2
                  xor          s2, s4, t6
                  mul          s8, t5, s10
	fcvt.s.wu	fs3, t5, rne
                  andi         s1, s0, 508
                  mulh         gp, s6, tp
                  fmv.w.x      ft8, zero
                  fle.s        a6, fs1, ft5
                  srl          a1, s2, t1
                  xori         s8, tp, -1528
                  fclass.s     a3, fs1
                  mul          t4, a5, s5
                  fcvt.s.w     ft9, a7, rmm
                  rem          s8, s0, zero
                  sra          s2, ra, s10
                  srai         t4, t2, 29
                  feq.s        s2, fa1, ft11
	fcvt.s.w	fa6, a3, rne
                  add          a7, s6, s3
                  srai         zero, s8, 4
                  sltu         sp, sp, s7
                  sltu         t1, t1, sp
                  slli         s2, a2, 17
                  fmv.w.x      fs1, a5
                  xor          a7, gp, s9
                  srli         a6, t6, 21
                  fle.s        s9, fa6, fa2
	fcvt.w.s	t3, ft1, rne
                  xori         s10, zero, -309
                  remu         a3, t1, zero
                  fle.s        s11, fs1, ft11
                  flt.s        a6, ft11, ft1
	fcvt.s.wu	fs11, ra, rne
                  fsgnjn.s     fa1, ft8, ft8
                  fmin.s       fa2, ft6, fs9
	fadd.s	fs8, ft6, fa6, rne
                  xori         ra, a1, 607
                  fsgnjx.s     ft1, ft9, fa3
                  ori          s3, s8, -462
                  sltu         a0, t3, a0
                  srai         t1, s11, 16
                  feq.s        a4, fs3, fs4
                  mulh         a2, t3, s4
                  mulh         t6, sp, a3
                  sll          sp, s1, t1
                  mulhsu       s1, t3, s4
                  andi         sp, s1, -1844
                  fadd.s       fs11, fs4, fa3, rup
                  rem          a5, a2, s6
                  sub          a7, t3, t2
                  nop
                  slli         t3, s9, 25
                  mulh         t1, a5, s0
                  divu         s9, a6, a1
                  fcvt.w.s     t3, fa4, rtz
                  sub          a2, s9, sp
                  addi         ra, tp, -668
                  fmv.x.w      a4, fs4
                  fmin.s       ft4, fs10, ft5
                  sltiu        t0, s5, 2037
                  add          s10, a2, a4
                  slti         sp, t3, 1654
                  addi         sp, sp, -1778
                  lui          a6, 831871
                  fmax.s       fs9, fa3, ft8
                  mulh         tp, s4, zero
                  fmax.s       fs9, ft2, ft9
                  srl          s0, a3, t5
                  mul          s10, t1, a5
	fsub.s	fs5, fs0, ft11, rne
                  auipc        s5, 313363
                  mulhsu       t1, t5, s9
                  lui          t3, 865543
                  xori         s3, s1, 990
                  sll          a6, s11, s10
                  slt          s0, t0, ra
                  fmv.w.x      ft5, t2
                  fcvt.w.s     s2, fa2, rup
                  fadd.s       fs6, fs7, fa0, rup
                  addi         s7, s2, -1935
                  fmv.x.w      s0, fa0
	fadd.s	fs8, fs4, ft1, rne
                  mulhsu       s10, s7, t4
                  sub          a2, s3, t1
                  lui          s9, 864513
                  mulhsu       tp, t1, t5
                  srli         a5, a6, 19
                  slti         a3, t5, -1508
                  mulhsu       a3, a5, s9
                  feq.s        s8, fs1, fs9
                  fsgnjx.s     ft6, fs4, fs1
	fcvt.wu.s	a7, ft11, rne
	fcvt.w.s	zero, fa1, rne
                  fclass.s     s3, fs8
                  sltu         s6, s10, s10
                  flt.s        s3, fa2, fa2
                  flt.s        a6, fa3, fa2
                  fmv.w.x      ft6, s2
                  sltiu        a4, s8, -656
                  fmax.s       ft3, fa2, fs4
                  fsgnjx.s     fa6, fa7, ft6
                  fle.s        a1, fs0, fs6
                  remu         ra, s9, a1
                  fmax.s       ft10, ft0, ft2
                  fclass.s     sp, ft7
	fcvt.s.w	fa1, gp, rne
                  fadd.s       fs5, fs4, fs10, rup
                  fsgnj.s      fs9, ft11, fa4
                  ori          s7, s0, -642
                  fcvt.s.wu    fa4, a5, rup
                  srli         s6, a1, 14
                  addi         a5, s8, -667
                  addi         gp, s5, 339
                  fclass.s     s1, fs9
                  sub          a2, a7, s11
                  auipc        s5, 866206
                  slti         a7, zero, -129
                  ori          s7, s1, 1424
                  fsub.s       fs0, fs4, ft10, rdn
                  fadd.s       fa0, ft9, fs8, rup
                  slt          s9, ra, t3
                  fle.s        a5, fs1, ft6
                  srai         s8, s5, 9
                  fsgnjx.s     fs8, fs3, ft10
                  lui          sp, 790992
                  fsgnjx.s     fs4, ft11, fa1
                  sra          a7, sp, sp
	fadd.s	fs7, ft9, ft3, rne
                  fclass.s     s6, fa7
                  fle.s        a2, fa4, fa4
                  remu         ra, t1, a5
                  fsgnj.s      fs5, fs2, fa5
	fcvt.wu.s	sp, fa5, rne
                  srai         s6, ra, 25
                  fcvt.s.w     ft0, s6, rdn
                  fadd.s       ft7, ft11, fa0, rne
                  add          a4, t6, t1
                  mul          tp, a6, s5
                  sll          t1, t0, t3
                  fsgnjn.s     ft5, ft5, fa4
                  slli         t1, s4, 0
	fcvt.s.wu	fs10, s4, rne
                  sll          ra, s5, sp
                  xori         a5, ra, 312
                  div          a3, a6, s4
                  rem          ra, t5, sp
                  remu         t0, s3, a4
	fcvt.w.s	tp, ft6, rne
                  lui          t0, 250054
                  or           s6, a0, t4
	fcvt.s.wu	fs9, t0, rne
                  nop
                  addi         tp, s9, 1509
                  sra          s1, s6, t5
                  ori          t0, s5, 1937
                  mulhsu       t1, t2, s8
                  mulhu        ra, a6, a5
                  xor          s5, s1, a4
                  fsgnjn.s     fs11, fa5, fa0
                  sra          s0, s7, sp
	fcvt.s.wu	fa5, a7, rne
                  remu         t1, t2, a3
                  fmv.w.x      fa2, s9
                  rem          zero, sp, a2
                  feq.s        s0, ft9, fs4
                  div          t6, s9, a4
                  or           s10, a3, ra
                  fmv.x.w      t4, fa5
                  slli         sp, t2, 28
                  fmax.s       fa1, ft5, fs8
                  addi         s0, s3, -1859
                  divu         s11, s1, s3
                  andi         zero, s0, 1094
                  xori         s0, s8, 8
                  mulhsu       s10, a0, s5
                  flt.s        a2, ft6, fs2
                  mul          a1, s11, t3
                  lui          tp, 480501
                  mul          a6, s2, s1
                  sub          s0, s3, s9
                  feq.s        s0, fa5, fa1
                  fsgnj.s      fs8, fs6, fs11
                  xor          s3, a1, s1
                  srai         s10, s6, 22
                  fmax.s       fs9, ft9, ft1
                  and          sp, a7, s10
	fcvt.wu.s	t4, fs0, rne
                  sltu         a5, sp, s8
                  sltiu        a3, s0, -1914
                  fsgnjn.s     fs11, fa0, fs4
                  fclass.s     s9, fs0
	fcvt.s.w	fa6, gp, rne
                  mulhsu       gp, s7, a4
                  fsgnjx.s     ft6, fa6, fs8
                  or           t6, s1, a1
                  sll          sp, s9, a2
                  fmv.x.w      s11, fa5
                  sltiu        zero, s2, 227
                  feq.s        s5, ft2, fs10
                  fcvt.wu.s    t1, ft5, rtz
                  mulhu        sp, a2, a2
                  addi         zero, s10, -1231
                  mulh         a5, a4, s9
                  add          s8, a3, a4
                  sltu         a4, s9, s7
                  fcvt.w.s     s3, fs3, rtz
                  mulhu        s3, s11, t5
                  sub          s9, s8, a1
                  fcvt.w.s     s3, ft9, rdn
                  fmin.s       ft1, ft3, ft0
                  mulh         a0, t3, zero
                  sltiu        s2, s8, 1888
                  fcvt.s.wu    fa3, a0, rne
                  fsgnjx.s     fs5, fa0, ft3
                  fsgnjx.s     fa2, fa2, fa7
                  slti         a4, a6, -422
                  fclass.s     ra, fs7
                  and          s1, t5, t4
                  srli         a1, s11, 18
                  srl          t4, s4, t6
                  mulh         a2, s3, s9
                  mulhsu       t4, t5, zero
                  slti         t4, a6, 1943
                  lui          s8, 711547
                  auipc        s0, 668382
                  fsub.s       ft4, fa4, ft0, rne
                  srli         t4, tp, 12
                  nop
                  rem          a3, s7, a4
                  mulhsu       t4, t1, s3
                  sra          gp, zero, a6
                  fsub.s       fs6, fa1, fs9, rtz
                  slt          a7, t4, s6
                  sltu         gp, gp, t1
                  addi         t1, ra, -1386
                  addi         t6, zero, -1677
                  nop
                  lui          t6, 504289
                  slti         t4, a0, -1985
	fcvt.w.s	gp, fa5, rne
                  fcvt.s.wu    fs11, t4, rup
                  xori         a7, s10, 1675
                  rem          s5, s8, a1
                  remu         zero, s2, a2
                  srai         s6, t1, 20
                  xor          a2, s10, s4
                  fclass.s     tp, fa2
                  feq.s        gp, ft8, fs8
                  nop
                  slti         gp, ra, 1816
                  xori         a4, s4, 612
                  mulhsu       s9, s3, t0
                  nop
                  fclass.s     s9, fs9
                  add          a0, s10, a0
                  xor          a3, a7, s1
                  and          zero, t1, a1
                  sll          s10, s3, t3
                  flt.s        zero, ft4, ft9
                  flt.s        s10, ft4, ft9
                  sll          s0, a1, s9
                  mulh         a2, s5, a6
                  sltiu        a1, s2, -481
                  slt          t1, a7, t6
                  slt          s9, s3, s7
                  flt.s        s11, fa1, fs6
                  mul          s5, t5, zero
                  xori         gp, t3, -1983
                  add          t4, a7, a6
                  fcvt.w.s     s0, fs11, rmm
                  sltu         gp, a1, gp
                  sltiu        a0, s11, -1576
                  mul          s7, s10, s11
                  fle.s        s8, ft5, ft11
                  sll          sp, s6, zero
                  fmax.s       ft1, fs2, fs8
                  srli         a0, t6, 12
                  fsgnj.s      ft6, ft6, ft10
                  sra          a5, s8, t3
	fsub.s	fs3, fa5, fs5, rne
	fcvt.s.wu	fs4, t4, rne
                  flt.s        t0, fs5, ft6
                  auipc        a6, 469040
                  rem          s11, t6, a7
                  fclass.s     a5, fa0
                  fcvt.s.w     ft9, s2, rmm
                  fmin.s       fa0, fs1, ft8
                  fsgnjx.s     fa6, fa4, ft9
                  srai         a2, a3, 10
                  fmv.w.x      ft6, a4
                  rem          s9, s0, ra
                  mul          zero, gp, a3
                  andi         a3, a1, -1171
                  fsgnj.s      fs1, ft6, ft0
                  addi         a4, s7, 1575
                  mulhsu       a2, s5, t1
                  flt.s        t3, fa7, ft7
                  fmax.s       ft1, ft7, fs2
                  lui          s5, 191270
	fsub.s	ft5, ft7, ft6, rne
                  mulh         a3, s5, s9
                  addi         t0, s6, 1551
                  nop
                  fsgnjn.s     fs9, fs2, fa5
	fsub.s	ft9, ft2, fa6, rne
                  fmin.s       fs7, ft10, ft9
                  sub          s7, ra, s3
                  sub          a2, a3, a2
                  fle.s        a5, fs2, fs11
                  andi         s2, s8, 362
                  flt.s        s2, fa7, fs4
                  andi         s1, a0, 236
                  fclass.s     sp, ft6
                  mulhsu       s2, t3, sp
                  fle.s        s1, fs10, fa0
                  fsgnjx.s     fs7, ft3, fs8
                  sra          s7, s6, s5
                  sub          a3, a5, s4
                  fsgnjn.s     ft6, fs1, fs7
	fcvt.s.wu	fs3, t0, rne
                  fclass.s     gp, fa4
                  fclass.s     ra, fs9
	fcvt.wu.s	s5, ft4, rne
                  slli         t6, gp, 7
                  mul          s1, a6, a1
                  fle.s        a2, fs5, ft8
	fcvt.s.w	fs2, t5, rne
                  rem          s7, ra, s7
                  sub          t3, ra, a7
                  slli         a0, s4, 16
                  addi         t6, s5, -228
                  mul          s2, a4, a5
                  slli         s6, t0, 2
                  andi         a1, s1, 595
                  add          t6, s9, s2
                  fmv.x.w      gp, fs9
                  fmax.s       fs4, fa2, fs11
                  slli         sp, a1, 17
                  andi         a4, s1, 1275
                  fmv.w.x      fs7, s1
                  xor          s8, t0, a4
                  sll          s8, t3, s4
                  feq.s        a7, fs1, ft3
                  feq.s        s0, fs10, ft11
                  auipc        zero, 793376
                  srl          s10, s11, a1
                  srl          a5, t5, tp
                  sltiu        a4, a1, 1534
                  fmin.s       fs0, ft1, fs0
                  nop
                  slt          s9, s3, s11
                  fadd.s       ft9, fs11, fa0, rup
                  mul          a7, zero, s4
                  addi         s0, t6, 651
                  srli         a4, t4, 27
                  fsgnjx.s     ft7, ft5, fa4
                  fclass.s     ra, fs9
                  mulh         s6, t0, s10
	fadd.s	ft2, fa7, ft1, rne
                  rem          s0, s4, s5
                  remu         s0, s4, s3
                  fcvt.s.w     ft4, s4, rdn
                  remu         a3, s2, a4
	fcvt.w.s	zero, ft11, rne
                  fsgnj.s      fs10, fa4, fs1
                  mulh         s2, s11, ra
                  fsgnjx.s     ft3, fa5, fa6
                  sra          s1, s10, s11
	fcvt.s.w	fa5, s5, rne
                  rem          a1, s6, a6
                  sltiu        a5, a5, 1
                  fsgnjx.s     ft11, fa5, ft11
                  remu         t1, a2, s0
                  srai         t0, a0, 24
                  srli         s3, a6, 19
                  fsgnj.s      fa6, fs10, fa1
                  rem          s3, a2, t4
                  div          s11, s0, t1
                  div          s3, s9, t2
                  slt          zero, s7, t0
	fsub.s	fs8, fa2, fa4, rne
                  slli         zero, t3, 20
                  srai         a2, gp, 26
                  auipc        t1, 282511
                  slt          s3, a7, s1
                  fmax.s       fa7, ft11, fa5
                  xori         gp, t0, -1144
                  rem          s5, s5, a2
                  srai         a7, a7, 23
                  mulh         s1, s9, s3
                  lui          t3, 423726
                  xor          a7, a3, sp
                  fadd.s       fs7, fs5, ft4, rmm
                  andi         s11, a5, 490
                  div          tp, a7, s9
                  fclass.s     a5, fs8
                  fsgnjn.s     fs5, fs7, ft8
                  mulh         sp, s9, s4
                  remu         a3, s9, a7
                  sltu         s1, t5, a6
                  fle.s        a4, ft11, fa3
                  or           t1, a4, a3
                  addi         ra, a4, 405
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
mmode_intr_vector_1:
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 0x1f
                  beqz x8, 1f
                  j mmode_intr_handler
                  1: la x20, test_done
                  jalr x0, x20, 0

mmode_intr_vector_2:
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 0x1f
                  beqz x8, 1f
                  j mmode_intr_handler
                  1: la x20, test_done
                  jalr x0, x20, 0

mmode_intr_vector_3:
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 0x1f
                  beqz x8, 1f
                  j mmode_intr_handler
                  1: la x20, test_done
                  jalr x0, x20, 0

mmode_intr_vector_4:
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 0x1f
                  beqz x8, 1f
                  j mmode_intr_handler
                  1: la x20, test_done
                  jalr x0, x20, 0

mmode_intr_vector_5:
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 0x1f
                  beqz x8, 1f
                  j mmode_intr_handler
                  1: la x20, test_done
                  jalr x0, x20, 0

mmode_intr_vector_6:
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 0x1f
                  beqz x8, 1f
                  j mmode_intr_handler
                  1: la x20, test_done
                  jalr x0, x20, 0

mmode_intr_vector_7:
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 0x1f
                  beqz x8, 1f
                  j mmode_intr_handler
                  1: la x20, test_done
                  jalr x0, x20, 0

mmode_intr_vector_8:
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 0x1f
                  beqz x8, 1f
                  j mmode_intr_handler
                  1: la x20, test_done
                  jalr x0, x20, 0

mmode_intr_vector_9:
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 0x1f
                  beqz x8, 1f
                  j mmode_intr_handler
                  1: la x20, test_done
                  jalr x0, x20, 0

mmode_intr_vector_10:
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 0x1f
                  beqz x8, 1f
                  j mmode_intr_handler
                  1: la x20, test_done
                  jalr x0, x20, 0

mmode_intr_vector_11:
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 0x1f
                  beqz x8, 1f
                  j mmode_intr_handler
                  1: la x20, test_done
                  jalr x0, x20, 0

mmode_intr_vector_12:
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 0x1f
                  beqz x8, 1f
                  j mmode_intr_handler
                  1: la x20, test_done
                  jalr x0, x20, 0

mmode_intr_vector_13:
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 0x1f
                  beqz x8, 1f
                  j mmode_intr_handler
                  1: la x20, test_done
                  jalr x0, x20, 0

mmode_intr_vector_14:
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 0x1f
                  beqz x8, 1f
                  j mmode_intr_handler
                  1: la x20, test_done
                  jalr x0, x20, 0

mmode_intr_vector_15:
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 0x1f
                  beqz x8, 1f
                  j mmode_intr_handler
                  1: la x20, test_done
                  jalr x0, x20, 0

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
                  addi x30, x30, -4
                  sw  x7, (x30)
                  add x7, x30, zero
                  addi x7, x7, -128
                  sw  x1, 4(x7)
                  sw  x2, 8(x7)
                  sw  x3, 12(x7)
                  sw  x4, 16(x7)
                  sw  x5, 20(x7)
                  sw  x6, 24(x7)
                  sw  x7, 28(x7)
                  sw  x8, 32(x7)
                  sw  x9, 36(x7)
                  sw  x10, 40(x7)
                  sw  x11, 44(x7)
                  sw  x12, 48(x7)
                  sw  x13, 52(x7)
                  sw  x14, 56(x7)
                  sw  x15, 60(x7)
                  sw  x16, 64(x7)
                  sw  x17, 68(x7)
                  sw  x18, 72(x7)
                  sw  x19, 76(x7)
                  sw  x20, 80(x7)
                  sw  x21, 84(x7)
                  sw  x22, 88(x7)
                  sw  x23, 92(x7)
                  sw  x24, 96(x7)
                  sw  x25, 100(x7)
                  sw  x26, 104(x7)
                  sw  x27, 108(x7)
                  sw  x28, 112(x7)
                  sw  x29, 116(x7)
                  sw  x30, 120(x7)
                  sw  x31, 124(x7)
                  add x30, x7, zero
                  csrr x8, 0x341 # MEPC
                  csrr x8, 0x342 # MCAUSE
                  li x5, 0x3 # BREAKPOINT
                  beq x8, x5, ebreak_handler
                  li x5, 0x8 # ECALL_UMODE
                  beq x8, x5, ecall_handler
                  li x5, 0x9 # ECALL_SMODE
                  beq x8, x5, ecall_handler
                  li x5, 0xb # ECALL_MMODE
                  beq x8, x5, ecall_handler
                  li x5, 0x1
                  beq x8, x5, instr_fault_handler
                  li x5, 0x5
                  beq x8, x5, load_fault_handler
                  li x5, 0x7
                  beq x8, x5, store_fault_handler
                  li x5, 0xc
                  beq x8, x5, pt_fault_handler
                  li x5, 0xd
                  beq x8, x5, pt_fault_handler
                  li x5, 0xf
                  beq x8, x5, pt_fault_handler
                  li x5, 0x2 # ILLEGAL_INSTRUCTION
                  beq x8, x5, illegal_instr_handler
                  csrr x5, 0x343 # MTVAL
                  1: la x20, test_done
                  jalr x1, x20, 0

ecall_handler:    
                  la x8, _start
                  sw x0, 0(x8)
                  sw x1, 4(x8)
                  sw x2, 8(x8)
                  sw x3, 12(x8)
                  sw x4, 16(x8)
                  sw x5, 20(x8)
                  sw x6, 24(x8)
                  sw x7, 28(x8)
                  sw x8, 32(x8)
                  sw x9, 36(x8)
                  sw x10, 40(x8)
                  sw x11, 44(x8)
                  sw x12, 48(x8)
                  sw x13, 52(x8)
                  sw x14, 56(x8)
                  sw x15, 60(x8)
                  sw x16, 64(x8)
                  sw x17, 68(x8)
                  sw x18, 72(x8)
                  sw x19, 76(x8)
                  sw x20, 80(x8)
                  sw x21, 84(x8)
                  sw x22, 88(x8)
                  sw x23, 92(x8)
                  sw x24, 96(x8)
                  sw x25, 100(x8)
                  sw x26, 104(x8)
                  sw x27, 108(x8)
                  sw x28, 112(x8)
                  sw x29, 116(x8)
                  sw x30, 120(x8)
                  sw x31, 124(x8)
                  la x20, write_tohost
                  jalr x0, x20, 0

instr_fault_handler:
                  add x7, x30, zero
                  lw  x1, 4(x7)
                  lw  x2, 8(x7)
                  lw  x3, 12(x7)
                  lw  x4, 16(x7)
                  lw  x5, 20(x7)
                  lw  x6, 24(x7)
                  lw  x7, 28(x7)
                  lw  x8, 32(x7)
                  lw  x9, 36(x7)
                  lw  x10, 40(x7)
                  lw  x11, 44(x7)
                  lw  x12, 48(x7)
                  lw  x13, 52(x7)
                  lw  x14, 56(x7)
                  lw  x15, 60(x7)
                  lw  x16, 64(x7)
                  lw  x17, 68(x7)
                  lw  x18, 72(x7)
                  lw  x19, 76(x7)
                  lw  x20, 80(x7)
                  lw  x21, 84(x7)
                  lw  x22, 88(x7)
                  lw  x23, 92(x7)
                  lw  x24, 96(x7)
                  lw  x25, 100(x7)
                  lw  x26, 104(x7)
                  lw  x27, 108(x7)
                  lw  x28, 112(x7)
                  lw  x29, 116(x7)
                  lw  x30, 120(x7)
                  lw  x31, 124(x7)
                  addi x7, x7, 128
                  add x30, x7, zero
                  lw  x7, (x30)
                  addi x30, x30, 4
                  mret

load_fault_handler:
                  add x7, x30, zero
                  lw  x1, 4(x7)
                  lw  x2, 8(x7)
                  lw  x3, 12(x7)
                  lw  x4, 16(x7)
                  lw  x5, 20(x7)
                  lw  x6, 24(x7)
                  lw  x7, 28(x7)
                  lw  x8, 32(x7)
                  lw  x9, 36(x7)
                  lw  x10, 40(x7)
                  lw  x11, 44(x7)
                  lw  x12, 48(x7)
                  lw  x13, 52(x7)
                  lw  x14, 56(x7)
                  lw  x15, 60(x7)
                  lw  x16, 64(x7)
                  lw  x17, 68(x7)
                  lw  x18, 72(x7)
                  lw  x19, 76(x7)
                  lw  x20, 80(x7)
                  lw  x21, 84(x7)
                  lw  x22, 88(x7)
                  lw  x23, 92(x7)
                  lw  x24, 96(x7)
                  lw  x25, 100(x7)
                  lw  x26, 104(x7)
                  lw  x27, 108(x7)
                  lw  x28, 112(x7)
                  lw  x29, 116(x7)
                  lw  x30, 120(x7)
                  lw  x31, 124(x7)
                  addi x7, x7, 128
                  add x30, x7, zero
                  lw  x7, (x30)
                  addi x30, x30, 4
                  mret

store_fault_handler:
                  add x7, x30, zero
                  lw  x1, 4(x7)
                  lw  x2, 8(x7)
                  lw  x3, 12(x7)
                  lw  x4, 16(x7)
                  lw  x5, 20(x7)
                  lw  x6, 24(x7)
                  lw  x7, 28(x7)
                  lw  x8, 32(x7)
                  lw  x9, 36(x7)
                  lw  x10, 40(x7)
                  lw  x11, 44(x7)
                  lw  x12, 48(x7)
                  lw  x13, 52(x7)
                  lw  x14, 56(x7)
                  lw  x15, 60(x7)
                  lw  x16, 64(x7)
                  lw  x17, 68(x7)
                  lw  x18, 72(x7)
                  lw  x19, 76(x7)
                  lw  x20, 80(x7)
                  lw  x21, 84(x7)
                  lw  x22, 88(x7)
                  lw  x23, 92(x7)
                  lw  x24, 96(x7)
                  lw  x25, 100(x7)
                  lw  x26, 104(x7)
                  lw  x27, 108(x7)
                  lw  x28, 112(x7)
                  lw  x29, 116(x7)
                  lw  x30, 120(x7)
                  lw  x31, 124(x7)
                  addi x7, x7, 128
                  add x30, x7, zero
                  lw  x7, (x30)
                  addi x30, x30, 4
                  mret

ebreak_handler:   
                  csrr  x8, 0x341
                  addi  x8, x8, 4
                  csrw  0x341, x8
                  add x7, x30, zero
                  lw  x1, 4(x7)
                  lw  x2, 8(x7)
                  lw  x3, 12(x7)
                  lw  x4, 16(x7)
                  lw  x5, 20(x7)
                  lw  x6, 24(x7)
                  lw  x7, 28(x7)
                  lw  x8, 32(x7)
                  lw  x9, 36(x7)
                  lw  x10, 40(x7)
                  lw  x11, 44(x7)
                  lw  x12, 48(x7)
                  lw  x13, 52(x7)
                  lw  x14, 56(x7)
                  lw  x15, 60(x7)
                  lw  x16, 64(x7)
                  lw  x17, 68(x7)
                  lw  x18, 72(x7)
                  lw  x19, 76(x7)
                  lw  x20, 80(x7)
                  lw  x21, 84(x7)
                  lw  x22, 88(x7)
                  lw  x23, 92(x7)
                  lw  x24, 96(x7)
                  lw  x25, 100(x7)
                  lw  x26, 104(x7)
                  lw  x27, 108(x7)
                  lw  x28, 112(x7)
                  lw  x29, 116(x7)
                  lw  x30, 120(x7)
                  lw  x31, 124(x7)
                  addi x7, x7, 128
                  add x30, x7, zero
                  lw  x7, (x30)
                  addi x30, x30, 4
                  mret

illegal_instr_handler:
                  csrr  x8, 0x341
                  addi  x8, x8, 4
                  csrw  0x341, x8
                  add x7, x30, zero
                  lw  x1, 4(x7)
                  lw  x2, 8(x7)
                  lw  x3, 12(x7)
                  lw  x4, 16(x7)
                  lw  x5, 20(x7)
                  lw  x6, 24(x7)
                  lw  x7, 28(x7)
                  lw  x8, 32(x7)
                  lw  x9, 36(x7)
                  lw  x10, 40(x7)
                  lw  x11, 44(x7)
                  lw  x12, 48(x7)
                  lw  x13, 52(x7)
                  lw  x14, 56(x7)
                  lw  x15, 60(x7)
                  lw  x16, 64(x7)
                  lw  x17, 68(x7)
                  lw  x18, 72(x7)
                  lw  x19, 76(x7)
                  lw  x20, 80(x7)
                  lw  x21, 84(x7)
                  lw  x22, 88(x7)
                  lw  x23, 92(x7)
                  lw  x24, 96(x7)
                  lw  x25, 100(x7)
                  lw  x26, 104(x7)
                  lw  x27, 108(x7)
                  lw  x28, 112(x7)
                  lw  x29, 116(x7)
                  lw  x30, 120(x7)
                  lw  x31, 124(x7)
                  addi x7, x7, 128
                  add x30, x7, zero
                  lw  x7, (x30)
                  addi x30, x30, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x8, 0x300 # MSTATUS;
                  csrr  x8, 0x304 # MIE;
                  csrr  x8, 0x344 # MIP;
                  csrrc x8, 0x344, x8 # MIP;
                  add x7, x30, zero
                  lw  x1, 4(x7)
                  lw  x2, 8(x7)
                  lw  x3, 12(x7)
                  lw  x4, 16(x7)
                  lw  x5, 20(x7)
                  lw  x6, 24(x7)
                  lw  x7, 28(x7)
                  lw  x8, 32(x7)
                  lw  x9, 36(x7)
                  lw  x10, 40(x7)
                  lw  x11, 44(x7)
                  lw  x12, 48(x7)
                  lw  x13, 52(x7)
                  lw  x14, 56(x7)
                  lw  x15, 60(x7)
                  lw  x16, 64(x7)
                  lw  x17, 68(x7)
                  lw  x18, 72(x7)
                  lw  x19, 76(x7)
                  lw  x20, 80(x7)
                  lw  x21, 84(x7)
                  lw  x22, 88(x7)
                  lw  x23, 92(x7)
                  lw  x24, 96(x7)
                  lw  x25, 100(x7)
                  lw  x26, 104(x7)
                  lw  x27, 108(x7)
                  lw  x28, 112(x7)
                  lw  x29, 116(x7)
                  lw  x30, 120(x7)
                  lw  x31, 124(x7)
                  addi x7, x7, 128
                  add x30, x7, zero
                  lw  x7, (x30)
                  addi x30, x30, 4
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
